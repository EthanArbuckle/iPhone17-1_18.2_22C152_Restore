@interface SystemContactPicker.SystemContactPickerViewController
- (_TtCV12SystemPlugin19SystemContactPicker33SystemContactPickerViewController)initWithCoder:(id)a3;
- (_TtCV12SystemPlugin19SystemContactPicker33SystemContactPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)viewDidLoad;
@end

@implementation SystemContactPicker.SystemContactPickerViewController

- (_TtCV12SystemPlugin19SystemContactPicker33SystemContactPickerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_263EC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_26504();
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_26624();
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2671C((uint64_t)v8, (uint64_t)v7);
}

- (_TtCV12SystemPlugin19SystemContactPicker33SystemContactPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_33A38();
  }
  id v5 = a4;
  sub_26858();
}

- (void).cxx_destruct
{
  id v2 = *(id *)&self->container[OBJC_IVAR____TtCV12SystemPlugin19SystemContactPicker33SystemContactPickerViewController_container
                             + 32];
  swift_release();
  swift_release();
  swift_release();
}

@end