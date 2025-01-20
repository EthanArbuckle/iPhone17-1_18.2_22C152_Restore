@interface FlowcaseViewCell.FlowcaseOverlayView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (UIEdgeInsets)marginsForRow:(int64_t)a3 atIndex:(int64_t)a4;
- (_TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView)initWithCoder:(id)a3;
- (_TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView)initWithFrame:(CGRect)a3;
- (double)maximumWidthForScorecardView:(id)a3;
- (id)backgroundImageForScorecardViewMaterial:(id)a3;
- (id)scoreValue:(id)a3 inRow:(int64_t)a4 atIndex:(int64_t)a5;
- (int)backgroundBlendModeForScoreValueInRow:(int64_t)a3 atIndex:(int64_t)a4;
- (int64_t)numberOfRowsInScorecardView:(id)a3;
- (int64_t)numberOfScoreValuesForScorecardView:(id)a3 inRow:(int64_t)a4;
- (int64_t)styleForScorecardView:(id)a3;
- (void)sampleWithImage:(id)a3;
@end

@implementation FlowcaseViewCell.FlowcaseOverlayView

- (int64_t)styleForScorecardView:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_1E308146C();

  return v6;
}

- (int64_t)numberOfRowsInScorecardView:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_1E3081538();

  return v6;
}

- (int64_t)numberOfScoreValuesForScorecardView:(id)a3 inRow:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  int64_t v8 = sub_1E30815F8((uint64_t)v7, a4);

  return v8;
}

- (id)scoreValue:(id)a3 inRow:(int64_t)a4 atIndex:(int64_t)a5
{
  id v6 = a3;
  v7 = self;
  sub_1E3081704();

  int64_t v8 = (void *)sub_1E387C8E8();
  swift_bridgeObjectRelease();
  return v8;
}

- (double)maximumWidthForScorecardView:(id)a3
{
  id v4 = a3;
  v5 = self;
  double v6 = sub_1E3081824();

  return v6;
}

- (UIEdgeInsets)marginsForRow:(int64_t)a3 atIndex:(int64_t)a4
{
  double v4 = sub_1E308188C(a3);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (id)backgroundImageForScorecardViewMaterial:(id)a3
{
  id v4 = a3;
  double v5 = self;
  double v6 = (void *)sub_1E3081928();

  return v6;
}

- (int)backgroundBlendModeForScoreValueInRow:(int64_t)a3 atIndex:(int64_t)a4
{
  id v4 = self;
  int v5 = sub_1E30819C4();

  return v5;
}

- (_TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView *)sub_1E322BAD4();
}

- (_TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E322C064();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  double v7 = self;
  sub_1E322C23C(a4, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_gradientColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_badgeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_legacyScorecardView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_scorecardView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_scoreboardViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_backgroundImageForMaterial));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_scorecardViewBackgroundImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_pendingOperation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_isOperationCancelledObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_isOperationFinishedObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_verticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_logoImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_channelLogoView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_alphaImageView));
  sub_1E30CAB10(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView____lazy_storage___logoGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView____lazy_storage___visualEffectContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView____lazy_storage___visualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView_nonPlaybackGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView____lazy_storage___playbackGradientView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCC8VideosUI16FlowcaseViewCell19FlowcaseOverlayView____lazy_storage___opacityMaskLayer);
}

- (void)sampleWithImage:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_1E322FB28(a3);
}

@end