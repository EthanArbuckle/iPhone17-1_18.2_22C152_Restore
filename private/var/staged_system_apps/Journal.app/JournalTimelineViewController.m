@interface JournalTimelineViewController
- (BOOL)accessibilityPerformMagicTap;
- (_TtC7Journal29JournalTimelineViewController)initWithCoder:(id)a3;
- (_TtC7Journal29JournalTimelineViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3;
- (void)adminLongPressWithSender:(id)a3;
- (void)onAppUnlock;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation JournalTimelineViewController

- (_TtC7Journal29JournalTimelineViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10025FE18();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100257F68();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1002588E0(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_100258ADC(a3);
}

- (void)onAppUnlock
{
  v2 = self;
  sub_100258C00();
}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UIContentUnavailableConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10025B84C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)adminLongPressWithSender:(id)a3
{
  uint64_t v5 = sub_100010218(&qword_1007FA1D0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  v15 = self;
  if ([v8 state] == (id)1)
  {
    uint64_t v9 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
    type metadata accessor for MainActor();
    v10 = v15;
    uint64_t v11 = static MainActor.shared.getter();
    v12 = (void *)swift_allocObject();
    v12[2] = v11;
    v12[3] = &protocol witness table for MainActor;
    v12[4] = v10;
    sub_100328C50((uint64_t)v7, (uint64_t)&unk_100805450, (uint64_t)v12);

    swift_release();
  }
  else
  {

    v13 = v15;
  }
}

- (BOOL)accessibilityPerformMagicTap
{
  v2 = self;
  id v3 = [(JournalTimelineViewController *)v2 presentedViewController];

  if (v3)
  {
    v6.receiver = v2;
    v6.super_class = (Class)type metadata accessor for JournalTimelineViewController();
    BOOL v4 = [(JournalTimelineViewController *)&v6 accessibilityPerformMagicTap];
  }
  else
  {
    sub_1002573B0();

    return 1;
  }
  return v4;
}

- (_TtC7Journal29JournalTimelineViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7Journal29JournalTimelineViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal29JournalTimelineViewController_entryCollectionViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal29JournalTimelineViewController_composeButtonsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal29JournalTimelineViewController_composeButtonsViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal29JournalTimelineViewController____lazy_storage___accessoryContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal29JournalTimelineViewController____lazy_storage___accessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal29JournalTimelineViewController____lazy_storage___accessoryViewForNavBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal29JournalTimelineViewController____lazy_storage___syncSpinner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal29JournalTimelineViewController____lazy_storage___syncSpinnerForNavBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal29JournalTimelineViewController____lazy_storage___filtersView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal29JournalTimelineViewController____lazy_storage___filtersViewForNavBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal29JournalTimelineViewController____lazy_storage___searchButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal29JournalTimelineViewController____lazy_storage___searchButtonForNavBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal29JournalTimelineViewController____lazy_storage___overflowButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal29JournalTimelineViewController____lazy_storage___overflowButtonForNavBar));
  swift_release();
  swift_release();

  swift_weakDestroy();
}

@end