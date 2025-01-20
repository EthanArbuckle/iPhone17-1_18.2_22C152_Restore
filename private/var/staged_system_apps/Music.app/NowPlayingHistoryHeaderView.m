@interface NowPlayingHistoryHeaderView
- (_TtC5Music27NowPlayingHistoryHeaderView)initWithCoder:(id)a3;
- (_TtC5Music27NowPlayingHistoryHeaderView)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NowPlayingHistoryHeaderView

- (_TtC5Music27NowPlayingHistoryHeaderView)initWithFrame:(CGRect)a3
{
  sub_1004D61EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC5Music27NowPlayingHistoryHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004D74E8();
}

- (void)applyLayoutAttributes:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NowPlayingHistoryHeaderView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(NowPlayingHistoryHeaderView *)&v6 applyLayoutAttributes:v4];
  [v5 setClipsToBounds:sub_1004D8E30() & 1];
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004D709C();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NowPlayingHistoryHeaderView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(NowPlayingHistoryHeaderView *)&v6 traitCollectionDidChange:v4];
  sub_1004D7228();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music27NowPlayingHistoryHeaderView_clearButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music27NowPlayingHistoryHeaderView_gradientView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC5Music27NowPlayingHistoryHeaderView_clearButtonAction);

  sub_10006ADFC(v3);
}

@end