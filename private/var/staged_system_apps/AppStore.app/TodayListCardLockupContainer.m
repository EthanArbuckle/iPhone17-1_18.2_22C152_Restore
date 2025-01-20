@interface TodayListCardLockupContainer
- (CGRect)frame;
- (_TtC8AppStore28TodayListCardLockupContainer)initWithCoder:(id)a3;
- (_TtC8AppStore28TodayListCardLockupContainer)initWithFrame:(CGRect)a3;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)applySizeCategoryUpdates;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TodayListCardLockupContainer

- (void)layoutSubviews
{
  v2 = self;
  sub_100053E90();
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_100054C80(x, y, width, height);
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TodayListCardLockupContainer();
  [(TodayListCardLockupContainer *)&v6 frame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (_TtC8AppStore28TodayListCardLockupContainer)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore28TodayListCardLockupContainer *)sub_100018A74(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)didMoveToSuperview
{
  double v2 = self;
  sub_1000185CC();
}

- (_TtC8AppStore28TodayListCardLockupContainer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003B1E64();
}

- (void)applySizeCategoryUpdates
{
  double v2 = self;
  sub_1000213D0();
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1003B20C4();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  swift_weakDestroy();
  swift_weakDestroy();
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore28TodayListCardLockupContainer_impressionsUpdateBlock));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore28TodayListCardLockupContainer_currentTouch);
}

@end