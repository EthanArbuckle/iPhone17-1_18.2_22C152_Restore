@interface MediaPickerMenuTableViewController
- (_TtC16MusicApplication34MediaPickerMenuTableViewController)init;
- (_TtC16MusicApplication34MediaPickerMenuTableViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication34MediaPickerMenuTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC16MusicApplication34MediaPickerMenuTableViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation MediaPickerMenuTableViewController

- (_TtC16MusicApplication34MediaPickerMenuTableViewController)init
{
  return [(MediaPickerMenuTableViewController *)self initWithNibName:0 bundle:0];
}

- (_TtC16MusicApplication34MediaPickerMenuTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_AB6510();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  v9 = sub_444BD4(v5, v7, (uint64_t)a4);

  return (_TtC16MusicApplication34MediaPickerMenuTableViewController *)v9;
}

- (_TtC16MusicApplication34MediaPickerMenuTableViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication34MediaPickerMenuTableViewController_bindings) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication34MediaPickerMenuTableViewController_menuItems) = (Class)_swiftEmptyArrayStorage;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication34MediaPickerMenuTableViewController_needsVisibleMenuItemsUpdate) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication34MediaPickerMenuTableViewController_isBatchUpdating) = 0;
  id v4 = a3;

  result = (_TtC16MusicApplication34MediaPickerMenuTableViewController *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_442FAC();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication34MediaPickerMenuTableViewController_menuItems))[2];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  v14 = sub_443550(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  sub_444E34();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v6 = sub_AB1110();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  type metadata accessor for LibraryMenuViewController.Cell();
  v10 = (void *)swift_dynamicCastClass();
  id v11 = a5;
  if (v10) {
    [v10 _setDrawsSeparatorAtTopOfSection:0];
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC16MusicApplication34MediaPickerMenuTableViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC16MusicApplication34MediaPickerMenuTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end