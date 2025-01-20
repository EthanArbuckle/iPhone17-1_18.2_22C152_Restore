@interface FMMyLocationAlertsView
- (_TtC6FindMy22FMMyLocationAlertsView)init;
- (_TtC6FindMy22FMMyLocationAlertsView)initWithCoder:(id)a3;
- (void)handleFriendTapWithGestureRecognizer:(id)a3;
@end

@implementation FMMyLocationAlertsView

- (void)handleFriendTapWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100494240(v4);
}

- (_TtC6FindMy22FMMyLocationAlertsView)init
{
  *(void *)&self->super.sectionLabel[OBJC_IVAR____TtC6FindMy22FMMyLocationAlertsView_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy22FMMyLocationAlertsView_friendsRow) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy22FMMyLocationAlertsView_rowViewModel) = (Class)&_swiftEmptyDictionarySingleton;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMMyLocationAlertsView();
  return [(FMSectionPlatterGroupView *)&v4 init];
}

- (_TtC6FindMy22FMMyLocationAlertsView)initWithCoder:(id)a3
{
  *(void *)&self->super.sectionLabel[OBJC_IVAR____TtC6FindMy22FMMyLocationAlertsView_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy22FMMyLocationAlertsView_friendsRow) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy22FMMyLocationAlertsView_rowViewModel) = (Class)&_swiftEmptyDictionarySingleton;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMMyLocationAlertsView();
  return [(FMSectionPlatterGroupView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy22FMMyLocationAlertsView_delegate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end