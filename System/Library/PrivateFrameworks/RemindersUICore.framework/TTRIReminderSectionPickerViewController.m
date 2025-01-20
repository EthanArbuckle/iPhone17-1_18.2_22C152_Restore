@interface TTRIReminderSectionPickerViewController
- (_TtC15RemindersUICore39TTRIReminderSectionPickerViewController)initWithCoder:(id)a3;
- (_TtC15RemindersUICore39TTRIReminderSectionPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC15RemindersUICore39TTRIReminderSectionPickerViewController)initWithStyle:(int64_t)a3;
- (void)cancelButtonAction:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TTRIReminderSectionPickerViewController

- (_TtC15RemindersUICore39TTRIReminderSectionPickerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B9456698();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B945284C();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(TTRIReminderSectionPickerViewController *)&v5 viewWillAppear:v3];
  sub_1B94530D0();
}

- (void)cancelButtonAction:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1B9970200();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
    objc_super v5 = self;
  }
  -[TTRIReminderSectionPickerViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0, v6, v7);

  sub_1B922A57C((uint64_t)&v6);
}

- (_TtC15RemindersUICore39TTRIReminderSectionPickerViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC15RemindersUICore39TTRIReminderSectionPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore39TTRIReminderSectionPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15RemindersUICore39TTRIReminderSectionPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore39TTRIReminderSectionPickerViewController_contentSizeObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore39TTRIReminderSectionPickerViewController_tableDataController));
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end