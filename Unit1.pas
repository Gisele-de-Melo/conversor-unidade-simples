unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    InputEdit: TEdit;
    FromCombobox: TComboBox;
    ToComboBox: TComboBox;
    ConvertButton: TButton;
    ResultLabel: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ConvertButtonClick(Sender: TObject);
  private
    function ConvertUnits(Value: Double; FromUnit, ToUnit: string): Double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ConvertButtonClick(Sender: TObject);
var
  InputValue, ResultValue: Double;

begin
  // Valida e converte o valor de entrada
  if TryStrToFloat(InputEdit.Text, InputValue) then
  begin
    ResultValue := ConvertUnits(InputValue, FromComboBox.Text, ToComboBox.Text);
    ResultLabel.Caption := FormatFloat('0.0000', ResultValue);
  end
  else
  begin
    ShowMessage('Please enter a valid number.');
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Popula os ComboBoxes com unidades de medida
  FromComboBox.Items.Add('Meters');
  FromComboBox.Items.Add('Kilometers');
  FromComboBox.Items.Add('Centimeters');
  FromComboBox.Items.Add('Inches');
  FromComboBox.Items.Add('Feet');
  FromComboBox.ItemIndex := 0;

  ToComboBox.Items.Add('Meters');
  ToComboBox.Items.Add('Kilometers');
  ToComboBox.Items.Add('Centimeters');
  ToComboBox.Items.Add('Inches');
  ToComboBox.Items.Add('Feet');
  ToComboBox.ItemIndex := 1;
end;

function TForm1.ConvertUnits(Value: Double; FromUnit, ToUnit: string): Double;
const
  MetersToKilometers = 0.001;
  MetersToCentimeters = 100;
  MetersToInches = 39.3701;
  MetersToFeet = 3.28084;
var
  ValueInMeters: Double;
begin
  // Converte a unidade de origem para metros
  if FromUnit = 'Meters' then
    ValueInMeters := Value
  else if FromUnit = 'Kilometers' then
    ValueInMeters := Value / MetersToKilometers
  else if FromUnit = 'Centimeters' then
    ValueInMeters := Value / MetersToCentimeters
  else if FromUnit = 'Inches' then
    ValueInMeters := Value / MetersToInches
  else if FromUnit = 'Feet' then
    ValueInMeters := Value / MetersToFeet
  else
    raise Exception.Create('Unsupported unit');

  // Converte de metros para a unidade de destino
  if ToUnit = 'Meters' then
    Result := ValueInMeters
  else if ToUnit = 'Kilometers' then
    Result := ValueInMeters * MetersToKilometers
  else if ToUnit = 'Centimeters' then
    Result := ValueInMeters * MetersToCentimeters
  else if ToUnit = 'Inches' then
    Result := ValueInMeters * MetersToInches
  else if ToUnit = 'Feet' then
    Result := ValueInMeters * MetersToFeet
  else
    raise Exception.Create('Unsupported unit');
end;

end.
