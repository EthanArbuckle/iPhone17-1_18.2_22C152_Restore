@interface FolderComposerFolderViewController
- (_TtC11MobileNotes34FolderComposerFolderViewController)initWithCoder:(id)a3;
- (_TtC11MobileNotes34FolderComposerFolderViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation FolderComposerFolderViewController

- (_TtC11MobileNotes34FolderComposerFolderViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes34FolderComposerFolderViewController____lazy_storage___folderSelectionDataSource) = 0;

  result = (_TtC11MobileNotes34FolderComposerFolderViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10032D348();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_10032D950();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC11MobileNotes34FolderComposerFolderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11MobileNotes34FolderComposerFolderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes34FolderComposerFolderViewController_accountObjectID));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes34FolderComposerFolderViewController_folderSelection));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes34FolderComposerFolderViewController____lazy_storage___folderSelectionDataSource);
}

@end