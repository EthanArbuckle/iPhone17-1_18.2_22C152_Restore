@interface FMRemoveItemViewController
- (_TtC6FindMy26FMRemoveItemViewController)initWithCoder:(id)a3;
- (_TtC6FindMy26FMRemoveItemViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancel;
- (void)removeItem;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMRemoveItemViewController

- (_TtC6FindMy26FMRemoveItemViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001D8A78();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1001D1774();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1001D1864(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1001D1A20(a3);
}

- (void)removeItem
{
  v2 = self;
  sub_1001D38A8();
}

- (void)cancel
{
}

- (_TtC6FindMy26FMRemoveItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy26FMRemoveItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy26FMRemoveItemViewController_itemToRemove, (uint64_t *)&unk_1006AFE30);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRemoveItemViewController_landingView));

  swift_release();
}

@end