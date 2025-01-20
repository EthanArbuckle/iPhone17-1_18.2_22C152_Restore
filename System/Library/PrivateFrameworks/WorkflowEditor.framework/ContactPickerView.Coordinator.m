@interface ContactPickerView.Coordinator
- (_TtCV14WorkflowEditor17ContactPickerView11Coordinator)init;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)recipientViewControllerDidFinish:(id)a3 cancelled:(BOOL)a4;
@end

@implementation ContactPickerView.Coordinator

- (void)contactPickerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_234AD814C();
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_234AD8394((uint64_t)v8, v7);
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_234AD84CC((uint64_t)v8, v7);
}

- (void)recipientViewControllerDidFinish:(id)a3 cancelled:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_234AD8570(v6, a4);
}

- (_TtCV14WorkflowEditor17ContactPickerView11Coordinator)init
{
}

- (void).cxx_destruct
{
}

@end