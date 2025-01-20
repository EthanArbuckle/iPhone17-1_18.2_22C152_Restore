@interface UnifiedOverlayView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (UIEdgeInsets)marginsForRow:(int64_t)a3 atIndex:(int64_t)a4;
- (UIView)accessibilityBadgeView;
- (VUIImageView)accessibilityAppImageView;
- (VUIImageView)accessibilityLogoImageView;
- (VUILabel)accessibilitySubtitleLabel;
- (VUILabel)accessibilityTextLabel;
- (VUILabel)textLabel;
- (VUITextBadgeView)accessibilityTextBadge;
- (_TtC8VideosUI18UnifiedOverlayView)initWithCoder:(id)a3;
- (_TtC8VideosUI18UnifiedOverlayView)initWithFrame:(CGRect)a3;
- (_TtC8VideosUI21StyledProgressBarView)accessibilityProgressView;
- (double)maximumWidthForScorecardView:(id)a3;
- (id)backgroundImageForScorecardViewMaterial:(id)a3;
- (id)scoreValue:(id)a3 inRow:(int64_t)a4 atIndex:(int64_t)a5;
- (int)backgroundBlendModeForScoreValueInRow:(int64_t)a3 atIndex:(int64_t)a4;
- (int64_t)numberOfRowsInScorecardView:(id)a3;
- (int64_t)numberOfScoreValuesForScorecardView:(id)a3 inRow:(int64_t)a4;
- (int64_t)styleForScorecardView:(id)a3;
- (void)dealloc;
- (void)sampleWithImage:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)setTextLabel:(id)a3;
- (void)textBadgeViewContentsUpdated:(id)a3;
- (void)vui_setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)vui_willMoveToWindow:(id)a3;
@end

@implementation UnifiedOverlayView

- (int64_t)styleForScorecardView:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_1E32EF258();

  return v6;
}

- (int64_t)numberOfRowsInScorecardView:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_1E32EF364();

  return v6;
}

- (int64_t)numberOfScoreValuesForScorecardView:(id)a3 inRow:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  int64_t v8 = sub_1E32EF424((uint64_t)v7, a4);

  return v8;
}

- (id)scoreValue:(id)a3 inRow:(int64_t)a4 atIndex:(int64_t)a5
{
  id v6 = a3;
  v7 = self;
  sub_1E32EF530();

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
  double v4 = sub_1E32EF69C(a3);
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
  double v6 = (void *)sub_1E32EF738();

  return v6;
}

- (int)backgroundBlendModeForScoreValueInRow:(int64_t)a3 atIndex:(int64_t)a4
{
  id v4 = self;
  int v5 = sub_1E32EF7D0();

  return v5;
}

- (VUILabel)textLabel
{
  v2 = sub_1E3546798();
  return (VUILabel *)v2;
}

- (void)setTextLabel:(id)a3
{
  id v4 = a3;
  int v5 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E3546824();
}

- (_TtC8VideosUI18UnifiedOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI18UnifiedOverlayView *)sub_1E3548868();
}

- (_TtC8VideosUI18UnifiedOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3548AF0();
}

- (void)vui_setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  id v6 = OUTLINED_FUNCTION_50_44((uint64_t)self, (uint64_t)a2, a3, a4, a5);
  id v7 = v5;
  char v8 = OUTLINED_FUNCTION_43_53();
  sub_1E3548CF8(v8, v9, v10);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  id v6 = OUTLINED_FUNCTION_50_44((uint64_t)self, (uint64_t)a2, a3, a4, a5);
  id v7 = v5;
  char v8 = (void *)OUTLINED_FUNCTION_43_53();
  sub_1E3548DB4(v8, v9, v10);
}

- (void)vui_willMoveToWindow:(id)a3
{
  id v4 = a3;
  int v5 = self;
  uint64_t v6 = OUTLINED_FUNCTION_8_8();
  sub_1E3548E78(v6);
}

- (void)dealloc
{
  v2 = self;
  sub_1E3548F54();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_progressView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_appImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_logoImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_badgeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_selectionGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_selectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_textBadge));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_protectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_unfocusedProtectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_scorecardView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_legacyScorecardView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_backgroundImageForMaterial));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_scoreboardViewModel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_scorecardViewBackgroundImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_pendingOperation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_isOperationCancelledObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18UnifiedOverlayView_isOperationFinishedObserver));
  swift_release();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  OUTLINED_FUNCTION_5_1();
  id v6 = v5;
  OUTLINED_FUNCTION_11_2();
  sub_1E3549174(a4);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (_TtC8VideosUI21StyledProgressBarView)accessibilityProgressView
{
  v2 = self;
  id v3 = (void *)sub_1E354A718();

  return (_TtC8VideosUI21StyledProgressBarView *)v3;
}

- (VUIImageView)accessibilityAppImageView
{
  v2 = self;
  id v3 = (void *)sub_1E354A79C();

  return (VUIImageView *)v3;
}

- (VUIImageView)accessibilityLogoImageView
{
  v2 = self;
  id v3 = (void *)sub_1E354A820();

  return (VUIImageView *)v3;
}

- (VUILabel)accessibilityTextLabel
{
  v2 = self;
  id v3 = (void *)sub_1E354A8A4();

  return (VUILabel *)v3;
}

- (VUILabel)accessibilitySubtitleLabel
{
  v2 = self;
  id v3 = (void *)sub_1E354A928();

  return (VUILabel *)v3;
}

- (UIView)accessibilityBadgeView
{
  v2 = self;
  id v3 = (void *)sub_1E354A9AC();

  return (UIView *)v3;
}

- (VUITextBadgeView)accessibilityTextBadge
{
  v2 = self;
  id v3 = (void *)sub_1E354AA30();

  return (VUITextBadgeView *)v3;
}

- (void)textBadgeViewContentsUpdated:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1E34248CC();
}

- (void)sampleWithImage:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = (void *)OUTLINED_FUNCTION_8_8();
  sub_1E354B528(v6);
}

@end