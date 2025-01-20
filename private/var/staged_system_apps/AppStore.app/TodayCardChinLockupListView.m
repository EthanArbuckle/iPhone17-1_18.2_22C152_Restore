@interface TodayCardChinLockupListView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore27TodayCardChinLockupListView)initWithCoder:(id)a3;
- (_TtC8AppStore27TodayCardChinLockupListView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TodayCardChinLockupListView

- (_TtC8AppStore27TodayCardChinLockupListView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore27TodayCardChinLockupListView *)sub_1000F0008(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore27TodayCardChinLockupListView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000F3B64();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000F1350();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_1000F1614();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore27TodayCardChinLockupListView_lockupIconViewReusePool;
  uint64_t v4 = sub_100082C28(&qword_100983FB8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_weakDestroy();
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore27TodayCardChinLockupListView_impressionsUpdateBlock));
  double v5 = (char *)self + OBJC_IVAR____TtC8AppStore27TodayCardChinLockupListView_todayCardStyle;
  uint64_t v6 = type metadata accessor for TodayCard.Style();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore27TodayCardChinLockupListView_clickActionHandler);

  sub_10006012C(v7);
}

@end