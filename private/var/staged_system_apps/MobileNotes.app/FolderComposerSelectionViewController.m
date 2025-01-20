@interface FolderComposerSelectionViewController
- (_TtC11MobileNotes37FolderComposerSelectionViewController)initWithCoder:(id)a3;
- (_TtC11MobileNotes37FolderComposerSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation FolderComposerSelectionViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1003C86A8();
}

- (_TtC11MobileNotes37FolderComposerSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC11MobileNotes37FolderComposerSelectionViewController *)sub_1003C909C(v5, v7, a4);
}

- (_TtC11MobileNotes37FolderComposerSelectionViewController)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes37FolderComposerSelectionViewController *)sub_1003C9218(a3);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MobileNotes37FolderComposerSelectionViewController_joinSummaryIdentifier;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes37FolderComposerSelectionViewController____lazy_storage___collectionView));
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes37FolderComposerSelectionViewController_contentSizeObservation);
}

@end