@interface FMRenameItemViewController
- (_TtC6FindMy26FMRenameItemViewController)initWithCoder:(id)a3;
- (void)dismissKeyboard;
- (void)saveRole;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMRenameItemViewController

- (_TtC6FindMy26FMRenameItemViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000BA638();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1000B79A0(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMRenameItemViewController();
  v4 = (char *)v6.receiver;
  [(FMRenameItemViewController *)&v6 viewDidAppear:v3];
  uint64_t v5 = *(void *)&v4[OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_customRoleView];
  *(unsigned char *)(v5 + OBJC_IVAR____TtC6FindMy16FMCustomRoleView_emojiPickerEnabled) = 1;
  [*(id *)(v5 + OBJC_IVAR____TtC6FindMy16FMCustomRoleView_emojiBackground) setUserInteractionEnabled:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1000B7C08(a3);
}

- (void)dismissKeyboard
{
  v2 = self;
  sub_1000B8E14();
}

- (void)scrollViewDidScroll:(id)a3
{
  BOOL v3 = *(void (**)(id))((char *)&self->super.super.super.super.super.isa
                                 + OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_scrollHandler);
  if (v3)
  {
    id v5 = a3;
    objc_super v6 = self;
    sub_1000B7838((uint64_t)v3);
    v3(v5);
    sub_100036B90((uint64_t)v3);
  }
}

- (void)saveRole
{
  v2 = self;
  sub_1000B965C();
}

- (void).cxx_destruct
{
  sub_100036B90(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_scrollHandler));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_item;
  uint64_t v4 = type metadata accessor for FMIPItem();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_rolePicker));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_customRoleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_dataSource));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_doneButtonItem));
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end