@interface NowPlayingQueueHeaderView
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (_TtC5Music25NowPlayingQueueHeaderView)initWithCoder:(id)a3;
- (_TtC5Music25NowPlayingQueueHeaderView)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NowPlayingQueueHeaderView

- (_TtC5Music25NowPlayingQueueHeaderView)initWithFrame:(CGRect)a3
{
  sub_1004DF8C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC5Music25NowPlayingQueueHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004E2208();
}

- (void)applyLayoutAttributes:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NowPlayingQueueHeaderView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(NowPlayingQueueHeaderView *)&v6 applyLayoutAttributes:v4];
  [v5 setClipsToBounds:sub_1004D8E30() & 1];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NowPlayingQueueHeaderView();
  v2 = (char *)v5.receiver;
  [(NowPlayingQueueHeaderView *)&v5 layoutSubviews];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_gradientView];
  [v2 bounds];
  double MaxY = CGRectGetMaxY(v6);
  [v2 bounds];
  [v3 setFrame:CGRectMake(0.0, MaxY, CGRectGetWidth(v7), 5.0)];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  CGRect v6 = self;
  sub_1004E1288((uint64_t)a3);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  sub_1004E1908(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_backdropView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_subtitleButton));
  id v3 = (char *)self + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_subtitleButtonConfiguration;
  uint64_t v4 = type metadata accessor for UIButton.Configuration();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_buttonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_autoPlayButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView____lazy_storage___clearButton));
  swift_bridgeObjectRelease();
  sub_1002C408C(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_playSource), *(void *)&self->backdropView[OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_playSource], *(void *)&self->gradientView[OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_playSource], *(void *)&self->titleLabel[OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_playSource], self->subtitleButton[OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_playSource]);
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_autoPlayButtonAction));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_clearButtonAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_titleLabelTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_buttonsStackViewTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_titleLabelBottomAnchorConstraint));
  id v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5Music25NowPlayingQueueHeaderView_subtitleButtonBottomAnchorConstraint);
}

@end