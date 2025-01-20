@interface VideoAssetView
- (CGRect)bounds;
- (CGRect)frame;
- (_TtC7Journal14VideoAssetView)initWithCoder:(id)a3;
- (_TtC7Journal14VideoAssetView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)finishedPlayingWithNotification:(id)a3;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation VideoAssetView

- (_TtC7Journal14VideoAssetView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal14VideoAssetView *)sub_1005E0D1C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal14VideoAssetView)initWithCoder:(id)a3
{
  return (_TtC7Journal14VideoAssetView *)sub_1005E0F30(a3);
}

- (void)dealloc
{
  v2 = self;
  sub_1005DF9A0();
  sub_1005E04A4();
  id v3 = [self defaultCenter];
  [v3 removeObserver:v2];

  v4 = *(Class *)((char *)&v2->super.super.super.super.isa + OBJC_IVAR____TtC7Journal14VideoAssetView_playerView);
  *(Class *)((char *)&v2->super.super.super.super.isa + OBJC_IVAR____TtC7Journal14VideoAssetView_playerView) = 0;

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for VideoAssetView();
  [(VideoAssetView *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal14VideoAssetView_playerStatusObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal14VideoAssetView_playerTimeControlStatusObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal14VideoAssetView_thumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal14VideoAssetView____lazy_storage___player));

  sub_10001ABB8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC7Journal14VideoAssetView_finishPlayingAction));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal14VideoAssetView_thumbnailOverride));
  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal14VideoAssetView_latestImageRequestID, &qword_100800950);
}

- (CGRect)frame
{
  sub_1005E40C0(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for VideoAssetView, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_1005E3724((SEL *)&selRef_setFrame_, x, y, width, height);
}

- (CGRect)bounds
{
  sub_1005E40C0(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for VideoAssetView, (SEL *)&selRef_bounds);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_1005E3724((SEL *)&selRef_setBounds_, x, y, width, height);
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_1005E3830();
}

- (void)finishedPlayingWithNotification:(id)a3
{
  double v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC7Journal14VideoAssetView_finishPlayingAction);
  if (v3)
  {
    id v5 = a3;
    v7 = self;
    uint64_t v6 = sub_1001A2550((uint64_t)v3);
    v3(v6);
    sub_10001ABB8((uint64_t)v3);
  }
}

@end