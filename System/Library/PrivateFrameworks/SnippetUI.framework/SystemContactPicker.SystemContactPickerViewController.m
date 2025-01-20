@interface SystemContactPicker.SystemContactPickerViewController
- (_TtCV9SnippetUI19SystemContactPicker33SystemContactPickerViewController)initWithCoder:(id)a3;
- (_TtCV9SnippetUI19SystemContactPicker33SystemContactPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)viewDidLoad;
@end

@implementation SystemContactPicker.SystemContactPickerViewController

- (_TtCV9SnippetUI19SystemContactPicker33SystemContactPickerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22C269768();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_22C269810();
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22C269960();
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_22C269A88((uint64_t)v8, (uint64_t)v7);
}

- (_TtCV9SnippetUI19SystemContactPicker33SystemContactPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_22C64F480();
  }
  id v5 = a4;
  sub_22C269BF4();
}

- (void).cxx_destruct
{
  id v2 = *(UITabBarItem **)((char *)&self->super._tabBarItem
                        + OBJC_IVAR____TtCV9SnippetUI19SystemContactPicker33SystemContactPickerViewController_container);
  swift_release();
  swift_release();
  swift_release();
}

@end