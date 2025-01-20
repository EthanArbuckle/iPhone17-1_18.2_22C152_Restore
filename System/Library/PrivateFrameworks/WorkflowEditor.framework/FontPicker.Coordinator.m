@interface FontPicker.Coordinator
- (_TtCV14WorkflowEditorP33_EAA722A494E602EA7844B636B7E142B110FontPicker11Coordinator)init;
- (void)fontPickerViewControllerDidCancel:(id)a3;
- (void)fontPickerViewControllerDidPickFont:(id)a3;
@end

@implementation FontPicker.Coordinator

- (void)fontPickerViewControllerDidPickFont:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23496279C(v4);
}

- (void)fontPickerViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23496286C();
}

- (_TtCV14WorkflowEditorP33_EAA722A494E602EA7844B636B7E142B110FontPicker11Coordinator)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end