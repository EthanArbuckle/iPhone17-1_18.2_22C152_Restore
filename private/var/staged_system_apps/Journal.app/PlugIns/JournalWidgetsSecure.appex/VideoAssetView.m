@interface VideoAssetView
- (CGRect)bounds;
- (CGRect)frame;
- (_TtC20JournalWidgetsSecure14VideoAssetView)initWithCoder:(id)a3;
- (_TtC20JournalWidgetsSecure14VideoAssetView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)finishedPlayingWithNotification:(id)a3;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation VideoAssetView

- (_TtC20JournalWidgetsSecure14VideoAssetView)initWithFrame:(CGRect)a3
{
  return (_TtC20JournalWidgetsSecure14VideoAssetView *)sub_10003F174(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20JournalWidgetsSecure14VideoAssetView)initWithCoder:(id)a3
{
  return (_TtC20JournalWidgetsSecure14VideoAssetView *)sub_10003F388(a3);
}

- (void)dealloc
{
  v2 = self;
  sub_10003E858();
  sub_10003EFBC();
  id v3 = [self defaultCenter];
  [v3 removeObserver:v2];

  v4 = *(Class *)((char *)&v2->super.super.super.super.isa
                + OBJC_IVAR____TtC20JournalWidgetsSecure14VideoAssetView_playerView);
  *(Class *)((char *)&v2->super.super.super.super.isa + OBJC_IVAR____TtC20JournalWidgetsSecure14VideoAssetView_playerView) = 0;

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for VideoAssetView();
  [(VideoAssetView *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20JournalWidgetsSecure14VideoAssetView_playerStatusObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20JournalWidgetsSecure14VideoAssetView_playerTimeControlStatusObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20JournalWidgetsSecure14VideoAssetView_thumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20JournalWidgetsSecure14VideoAssetView____lazy_storage___player));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20JournalWidgetsSecure14VideoAssetView_playerView));
  sub_10003A1EC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC20JournalWidgetsSecure14VideoAssetView_finishPlayingAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20JournalWidgetsSecure14VideoAssetView_videoAsset));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20JournalWidgetsSecure14VideoAssetView_thumbnailOverride));
  sub_100012510((uint64_t)self + OBJC_IVAR____TtC20JournalWidgetsSecure14VideoAssetView_latestImageRequestID, &qword_10014DD70);
}

- (CGRect)frame
{
  sub_100040E28(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for VideoAssetView, (SEL *)&selRef_frame);
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
  sub_100040994((SEL *)&selRef_setFrame_, x, y, width, height);
}

- (CGRect)bounds
{
  sub_100040E28(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for VideoAssetView, (SEL *)&selRef_bounds);
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
  sub_100040994((SEL *)&selRef_setBounds_, x, y, width, height);
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_100040AA0();
}

- (void)finishedPlayingWithNotification:(id)a3
{
  double v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC20JournalWidgetsSecure14VideoAssetView_finishPlayingAction);
  if (v3)
  {
    id v5 = a3;
    v7 = self;
    uint64_t v6 = sub_10004102C((uint64_t)v3);
    v3(v6);
    sub_10003A1EC((uint64_t)v3);
  }
}

@end