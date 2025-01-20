@interface RevealingVideoView
- (_TtC8AppStore18RevealingVideoView)initWithCoder:(id)a3;
- (_TtC8AppStore18RevealingVideoView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)willMoveToWindow:(id)a3;
@end

@implementation RevealingVideoView

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RevealingVideoView();
  id v2 = v3.receiver;
  [(RevealingVideoView *)&v3 layoutSubviews];
  sub_10000A05C();
  sub_100096B48();
  sub_100096A24();
}

- (void)willMoveToWindow:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10005145C((uint64_t)a3);
}

- (_TtC8AppStore18RevealingVideoView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore18RevealingVideoView *)sub_100051D8C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore18RevealingVideoView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10068CCD0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1000E6FD8((uint64_t)self + OBJC_IVAR____TtC8AppStore18RevealingVideoView_pageGrid);
  sub_100092F18((uint64_t)self + OBJC_IVAR____TtC8AppStore18RevealingVideoView_mirrorDelegate);
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

@end