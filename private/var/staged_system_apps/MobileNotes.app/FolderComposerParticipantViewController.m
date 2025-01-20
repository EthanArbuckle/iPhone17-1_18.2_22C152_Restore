@interface FolderComposerParticipantViewController
- (_TtC11MobileNotes39FolderComposerParticipantViewController)initWithCoder:(id)a3;
- (_TtC11MobileNotes39FolderComposerParticipantViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (uint64_t)collectionView:(void *)a3 shouldHighlightItemAtIndexPath:;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation FolderComposerParticipantViewController

- (_TtC11MobileNotes39FolderComposerParticipantViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes39FolderComposerParticipantViewController____lazy_storage___diffableDataSource) = 0;

  result = (_TtC11MobileNotes39FolderComposerParticipantViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1003C0310();
}

- (uint64_t)collectionView:(void *)a3 shouldHighlightItemAtIndexPath:
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a1;
  LOBYTE(a1) = sub_1003C2E00();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return a1 & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1003C2F88((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC11MobileNotes39FolderComposerParticipantViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11MobileNotes39FolderComposerParticipantViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes39FolderComposerParticipantViewController_participantSelection));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes39FolderComposerParticipantViewController____lazy_storage___diffableDataSource);
}

@end