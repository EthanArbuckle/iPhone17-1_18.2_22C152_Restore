@interface PlayerTimeControl
- (BOOL)accessibilityIsLiveContent;
- (BOOL)isEnabled;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)bounds;
- (CGRect)thumbHitRect;
- (CGSize)intrinsicContentSize;
- (UIEdgeInsets)alignmentRectInsets;
- (UILabel)accessibilityLiveLabel;
- (UIView)accessibilityKnobView;
- (UIView)bufferTrack;
- (UIView)elapsedTrack;
- (UIView)remainingTrack;
- (_TtC12NowPlayingUI17PlayerTimeControl)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI17PlayerTimeControl)initWithFrame:(CGRect)a3;
- (double)accessibilityElapsedDuration;
- (double)accessibilityTotalDuration;
- (float)maximumValue;
- (float)minimumValue;
- (float)value;
- (id)viewForBaselineLayout;
- (void)accessibilityUpdateWithElapsedDuration:(double)a3;
- (void)dealloc;
- (void)detailScrubController:(id)a3 didChangeScrubSpeed:(int64_t)a4;
- (void)detailScrubController:(id)a3 didChangeValue:(float)a4;
- (void)detailScrubControllerDidBeginScrubbing:(id)a3;
- (void)detailScrubControllerDidEndScrubbing:(id)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)panGestureRecognized:(id)a3;
- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setEnabled:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation PlayerTimeControl

- (UIView)elapsedTrack
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_elapsedTrack));
}

- (UIView)bufferTrack
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_bufferTrack));
}

- (UIView)remainingTrack
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_remainingTrack));
}

- (_TtC12NowPlayingUI17PlayerTimeControl)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_4F0A8();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_displayLink);
  if (v2)
  {
    id v3 = self;
    [v2 invalidate];
    v4.receiver = v3;
    v4.super_class = (Class)type metadata accessor for PlayerTimeControl();
    [(PlayerTimeControl *)&v4 dealloc];
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_trackLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_elapsedTrack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_bufferUnselectedColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_bufferSelectedColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_bufferTrack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_remainingTrack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_knobView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_knobKnockoutView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_elapsedTimeActivityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_elapsedTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_remainingTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_liveLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_liveBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_bufferingIndicator));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_elapsedTimeLabelBottomAnchorConstraint));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_metrics);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_remainingTrackLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_scrubController));
  sub_FB70(*(uint64_t *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_scrubbingDidChangeHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_knobViewXConstraint));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_displayLink));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_elapsedTimeFormatter));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_remainingTimeFormatter);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_4AB68();
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_4ACD4();
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2 = -6.0;
  double v3 = 0.0;
  double v4 = -1.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PlayerTimeControl();
  [(PlayerTimeControl *)&v6 bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for PlayerTimeControl();
  v19.receiver = self;
  v19.super_class = v8;
  v9 = self;
  [(PlayerTimeControl *)&v19 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v18.receiver = v9;
  v18.super_class = v8;
  -[PlayerTimeControl setBounds:](&v18, "setBounds:", x, y, width, height);
  sub_4AF20(v11, v13, v15, v17);
}

- (id)viewForBaselineLayout
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_elapsedTimeLabel));
}

- (CGSize)intrinsicContentSize
{
  double v2 = self;
  CGFloat v3 = sub_4B074();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)tintColorDidChange
{
  double v2 = self;
  sub_4B164();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  LOBYTE(v4) = sub_4B33C(v4, x, y);

  return v4 & 1;
}

- (BOOL)isEnabled
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlayerTimeControl();
  return [(PlayerTimeControl *)&v3 isEnabled];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (objc_class *)type metadata accessor for PlayerTimeControl();
  v9.receiver = self;
  v9.super_class = v5;
  double v6 = self;
  char v7 = [(PlayerTimeControl *)&v9 isEnabled];
  v8.receiver = v6;
  v8.super_class = v5;
  [(PlayerTimeControl *)&v8 setEnabled:v3];
  sub_4B608(v7);
}

- (void)panGestureRecognized:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_4B860(v4);
}

- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_4F6C4();
}

- (float)value
{
  double v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_knobViewXConstraint);
  if (v2)
  {
    BOOL v3 = self;
    [v2 constant];
    double v5 = v4;
    [(PlayerTimeControl *)v3 bounds];
    double Width = CGRectGetWidth(v8);

    return v5 / Width;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (float)minimumValue
{
  return 0.0;
}

- (float)maximumValue
{
  return 1.0;
}

- (CGRect)thumbHitRect
{
  double v2 = self;
  double v3 = sub_4BD88();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (void)detailScrubController:(id)a3 didChangeValue:(float)a4
{
  id v6 = a3;
  double v7 = self;
  sub_4FBA8(a4);
}

- (void)detailScrubController:(id)a3 didChangeScrubSpeed:(int64_t)a4
{
  id v6 = a3;
  double v7 = self;
  sub_4FE94(a4);
}

- (void)detailScrubControllerDidBeginScrubbing:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_4FFA4();
}

- (void)detailScrubControllerDidEndScrubbing:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_500D4();
}

- (double)accessibilityTotalDuration
{
  double result = 0.0;
  if (self->remainingTrack[OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_durationSnapshot] != 2) {
    return *(double *)&self->bufferUnselectedColor[OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_durationSnapshot];
  }
  return result;
}

- (double)accessibilityElapsedDuration
{
  double v2 = (char *)self + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_durationSnapshot;
  uint64_t v3 = *(void *)&self->remainingTrack[OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_durationSnapshot];
  double ElapsedTimeForCurrentTime = 0.0;
  if (v3 != 2)
  {
    uint64_t v5 = *((void *)v2 + 5);
    uint64_t v6 = *((void *)v2 + 4);
    long long v10 = *(_OWORD *)v2;
    long long v11 = *((_OWORD *)v2 + 1);
    double v7 = self;
    sub_126AA0();
    v12[0] = v10;
    v12[1] = v11;
    uint64_t v13 = v6;
    uint64_t v14 = v5;
    __int16 v15 = v3 & 0x101;
    char v16 = BYTE2(v3) & 1;
    double ElapsedTimeForCurrentTime = MPCPlayerItemDurationSnapshotGetElapsedTimeForCurrentTime((uint64_t)v12, v8);
  }
  return ElapsedTimeForCurrentTime;
}

- (void)accessibilityUpdateWithElapsedDuration:(double)a3
{
  id v4 = self;
  sub_4D974(a3);
}

- (BOOL)accessibilityIsLiveContent
{
  return (self->remainingTrack[OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_durationSnapshot] != 2) & self->remainingTrack[OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_durationSnapshot];
}

- (UIView)accessibilityKnobView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_knobView));
}

- (UILabel)accessibilityLiveLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_liveLabel));
}

- (_TtC12NowPlayingUI17PlayerTimeControl)initWithFrame:(CGRect)a3
{
  double result = (_TtC12NowPlayingUI17PlayerTimeControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end