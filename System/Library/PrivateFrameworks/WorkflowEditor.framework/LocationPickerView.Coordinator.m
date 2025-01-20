@interface LocationPickerView.Coordinator
- (_TtCV14WorkflowEditor18LocationPickerView11Coordinator)init;
- (void)locationPicker:(id)a3 didFinishWithValue:(id)a4;
- (void)locationPickerDidCancel:(id)a3;
@end

@implementation LocationPickerView.Coordinator

- (void)locationPicker:(id)a3 didFinishWithValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_234957D60((uint64_t)v8, a4);
}

- (void)locationPickerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_234958000();
}

- (_TtCV14WorkflowEditor18LocationPickerView11Coordinator)init
{
}

- (void).cxx_destruct
{
}

@end