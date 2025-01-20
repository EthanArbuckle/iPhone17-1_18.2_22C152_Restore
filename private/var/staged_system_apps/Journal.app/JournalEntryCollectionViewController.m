@interface JournalEntryCollectionViewController
- (BOOL)accessibilityPerformMagicTap;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC7Journal36JournalEntryCollectionViewController)initWithCoder:(id)a3;
- (_TtC7Journal36JournalEntryCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (void)appWillEnterForeground;
- (void)controller:(id)a3 didChangeContentWithSnapshot:(id)a4;
- (void)handleTap:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setUpBottomFade;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation JournalEntryCollectionViewController

- (void)controller:(id)a3 didChangeContentWithSnapshot:(id)a4
{
  id v6 = a3;
  v7 = (void (*)(char *, uint64_t, uint64_t))a4;
  v8 = self;
  sub_1000D7EB4(v7);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1001CC0B4();
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JournalEntryCollectionViewController();
  v4 = v5.receiver;
  [(JournalEntryCollectionViewController *)&v5 viewIsAppearing:v3];
  if ((v4[OBJC_IVAR____TtC7Journal36JournalEntryCollectionViewController_hasPerformedInitialFetch] & 1) == 0) {
    sub_1001C824C();
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1001CC7C8(a3);
}

- (void)appWillEnterForeground
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC7Journal36JournalEntryCollectionViewController_shouldPlayVideoAfterDelay) = 1;
}

- (BOOL)accessibilityPerformMagicTap
{
  v2 = self;
  unsigned __int8 v3 = sub_1001CC93C();

  return v3 & 1;
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC7Journal36JournalEntryCollectionViewController_entryCollectionView));
}

- (void)setUpBottomFade
{
  v2 = self;
  sub_1001C7D10();
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  v4 = self;
  LOBYTE(a3) = sub_1001D0120(a3);

  return a3 & 1;
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1001D4DF8((uint64_t)&unk_10079D5B8, (double (*)(double, double))sub_1001D5E40, (uint64_t)&unk_10079D5D0, (uint64_t)&unk_10079D5F8);
}

- (_TtC7Journal36JournalEntryCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC7Journal36JournalEntryCollectionViewController *)sub_1001D1848(v5, v7, a4);
}

- (_TtC7Journal36JournalEntryCollectionViewController)initWithCoder:(id)a3
{
  return (_TtC7Journal36JournalEntryCollectionViewController *)sub_1001D1B50(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal36JournalEntryCollectionViewController_coreDataContext));
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal36JournalEntryCollectionViewController_delegate);
  swift_weakDestroy();
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal36JournalEntryCollectionViewController_timelineScrollDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal36JournalEntryCollectionViewController_prefetcher));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal36JournalEntryCollectionViewController_entryCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal36JournalEntryCollectionViewController_fadeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal36JournalEntryCollectionViewController_currentSelectedCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal36JournalEntryCollectionViewController_collectionViewTopConstraint));
  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal36JournalEntryCollectionViewController_tip, &qword_1008026B8);
  swift_release();
  unsigned __int8 v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Journal36JournalEntryCollectionViewController_dataSource);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001D4DF8((uint64_t)&unk_10079D478, (double (*)(double, double))sub_1001D5E40, (uint64_t)&unk_10079D490, (uint64_t)&unk_10079D4B8);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001D219C(v4);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    id v6 = a3;
    uint64_t v7 = self;
    sub_10030A6C4();
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10030A6C4();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_1001D50C0();

  return self & 1;
}

@end