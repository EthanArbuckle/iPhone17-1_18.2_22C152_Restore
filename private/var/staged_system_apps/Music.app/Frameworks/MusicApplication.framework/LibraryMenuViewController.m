@interface LibraryMenuViewController
- (_TtC16MusicApplication25LibraryMenuViewController)init;
- (_TtC16MusicApplication25LibraryMenuViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication25LibraryMenuViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC16MusicApplication25LibraryMenuViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation LibraryMenuViewController

- (_TtC16MusicApplication25LibraryMenuViewController)init
{
  return [(LibraryMenuViewController *)self initWithNibName:0 bundle:0];
}

- (_TtC16MusicApplication25LibraryMenuViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  v9 = (_TtC16MusicApplication25LibraryMenuViewController *)sub_21C3B8(v5, v7, (uint64_t)a4);

  return v9;
}

- (_TtC16MusicApplication25LibraryMenuViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21C590();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2166E4();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LibraryMenuViewController();
  id v4 = v5.receiver;
  [(LibraryMenuViewController *)&v5 viewWillAppear:v3];
  [v4 loadViewIfNeeded];
  *((unsigned char *)v4 + OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_pendingSelectedIdentifier) = 13;
  sub_219490();
  RequestResponse.Controller.isAutomaticReloadingEnabled.setter(1);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LibraryMenuViewController();
  id v4 = v5.receiver;
  [(LibraryMenuViewController *)&v5 viewDidAppear:v3];
  sub_219490();
  v4[OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_allowsAnimatedChanges] = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LibraryMenuViewController();
  id v4 = v5.receiver;
  [(LibraryMenuViewController *)&v5 viewWillDisappear:v3];
  RequestResponse.Controller.isAutomaticReloadingEnabled.setter(0);
  v4[OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_allowsAnimatedChanges] = 0;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v6 = self;
  sub_217DA8(a3, a4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_218C28((uint64_t)a3);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_AB1110();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_DC0F70);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v14 = a3;
  id v15 = a4;
  v16 = self;
  sub_218EEC((uint64_t)v10, (uint64_t)v13);

  v17 = *(void (**)(char *, uint64_t))(v8 + 8);
  v17(v10, v7);

  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v13, 1, v7) != 1)
  {
    Class isa = sub_AB1060().super.isa;
    v17(v13, v7);
  }

  return isa;
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v9 = sub_AB1110();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  type metadata accessor for LibraryMenuViewController.Cell();
  uint64_t v13 = swift_dynamicCastClass();
  if (v13)
  {
    id v14 = (void *)v13;
    id v15 = a3;
    id v16 = a4;
    id v17 = a5;
    v18 = self;
    [v14 _setDrawsSeparatorAtTopOfSection:0];
    [v14 _setDrawsSeparatorAtBottomOfSection:1];
    [v14 _setShouldHaveFullLengthTopSeparator:0];
  }
  else
  {
    id v19 = a5;
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (_TtC16MusicApplication25LibraryMenuViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC16MusicApplication25LibraryMenuViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A500((uint64_t)self + OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_editingDelegate);
  sub_21D290(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_editingMenu), *(void **)&self->editingDelegate[OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_editingMenu]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_downloadManagerObserver));

  swift_release();
  swift_release();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication25LibraryMenuViewController_dataSource);
}

@end