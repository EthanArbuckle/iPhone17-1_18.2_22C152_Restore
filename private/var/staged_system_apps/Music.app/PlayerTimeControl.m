@interface PlayerTimeControl
- (BOOL)accessibilityIsLiveContent;
- (BOOL)isEnabled;
- (BOOL)isHidden;
- (UILabel)liveLabel;
- (_TtC5Music17PlayerTimeControl)init;
- (_TtC5Music17PlayerTimeControl)initWithCoder:(id)a3;
- (_TtC5Music17PlayerTimeControl)initWithFrame:(CGRect)a3;
- (double)accessibilityElapsedDuration;
- (double)accessibilityTotalDuration;
- (double)alpha;
- (void)accessibilityUpdateWithElapsedDuration:(double)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAlpha:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PlayerTimeControl

- (_TtC5Music17PlayerTimeControl)init
{
  sub_1002C9120();
  return result;
}

- (_TtC5Music17PlayerTimeControl)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002CD2B8();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Music17PlayerTimeControl_displayLink);
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
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5Music17PlayerTimeControl_scrubbingDidChangeHandler));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5Music17PlayerTimeControl_timeDidChangeHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music17PlayerTimeControl_elapsedTrackColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music17PlayerTimeControl_remainingTrackColor));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music17PlayerTimeControl_elapsedTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music17PlayerTimeControl_remainingTimeLabel));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music17PlayerTimeControl_trackingTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music17PlayerTimeControl_liveLabelTextColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music17PlayerTimeControl_timeLabelTextColor));
  swift_release();
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music17PlayerTimeControl_elapsedTimeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music17PlayerTimeControl_remainingTimeFormatter));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Music17PlayerTimeControl_timeLabelFont);
}

- (UILabel)liveLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC5Music17PlayerTimeControl_liveLabel));
}

- (BOOL)isHidden
{
  return sub_1002CB4C0(self, (uint64_t)a2, (SEL *)&selRef_isHidden);
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)type metadata accessor for PlayerTimeControl();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  char v7 = [(PlayerTimeControl *)&v9 isHidden];
  v8.receiver = v6;
  v8.super_class = v5;
  [(PlayerTimeControl *)&v8 setHidden:v3];
  sub_1002CACE0(v7);
}

- (double)alpha
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlayerTimeControl();
  [(PlayerTimeControl *)&v3 alpha];
  return result;
}

- (void)setAlpha:(double)a3
{
  v5 = (objc_class *)type metadata accessor for PlayerTimeControl();
  v10.receiver = self;
  v10.super_class = v5;
  v6 = self;
  [(PlayerTimeControl *)&v10 alpha];
  double v8 = v7;
  v9.receiver = v6;
  v9.super_class = v5;
  [(PlayerTimeControl *)&v9 setAlpha:a3];
  sub_1002CAF54(v8);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002CB108();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PlayerTimeControl();
  id v4 = a3;
  id v5 = v6.receiver;
  [(PlayerTimeControl *)&v6 traitCollectionDidChange:v4];
  sub_1002CBFD4();
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_1002CB30C();
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlayerTimeControl();
  id v2 = v3.receiver;
  [(PlayerTimeControl *)&v3 tintColorDidChange];
  sub_1002CB764();
}

- (BOOL)isEnabled
{
  return sub_1002CB4C0(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  id v4 = self;
  sub_1002CB554(a3);
}

- (double)accessibilityTotalDuration
{
  double result = 0.0;
  if (self->elapsedTrackColor[OBJC_IVAR____TtC5Music17PlayerTimeControl_durationSnapshot] != 2) {
    return *(double *)&self->timeDidChangeHandler[OBJC_IVAR____TtC5Music17PlayerTimeControl_durationSnapshot];
  }
  return result;
}

- (double)accessibilityElapsedDuration
{
  id v2 = (char *)self + OBJC_IVAR____TtC5Music17PlayerTimeControl_durationSnapshot;
  uint64_t v3 = *(void *)&self->elapsedTrackColor[OBJC_IVAR____TtC5Music17PlayerTimeControl_durationSnapshot];
  double v4 = 0.0;
  if (v3 != 2)
  {
    uint64_t v5 = *((void *)v2 + 5);
    uint64_t v6 = *((void *)v2 + 4);
    long long v10 = *(_OWORD *)v2;
    long long v11 = *((_OWORD *)v2 + 1);
    double v7 = self;
    static Date.timeIntervalSinceReferenceDate.getter();
    v12[0] = v10;
    v12[1] = v11;
    uint64_t v13 = v6;
    uint64_t v14 = v5;
    __int16 v15 = v3 & 0x101;
    char v16 = BYTE2(v3) & 1;
    double v4 = sub_1002CD838((uint64_t)v12, v8);
  }
  return v4;
}

- (void)accessibilityUpdateWithElapsedDuration:(double)a3
{
  uint64_t v3 = *(void (**)(uint64_t, double))((char *)&self->super.super.super.super.isa
                                              + OBJC_IVAR____TtC5Music17PlayerTimeControl_timeDidChangeHandler);
  if (v3)
  {
    uint64_t v5 = *((unsigned __int8 *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Music17PlayerTimeControl__tracking);
    uint64_t v6 = self;
    sub_10007B674((uint64_t)v3);
    v3(v5, a3);
    sub_10006ADFC((uint64_t)v3);
  }
}

- (BOOL)accessibilityIsLiveContent
{
  return (self->elapsedTrackColor[OBJC_IVAR____TtC5Music17PlayerTimeControl_durationSnapshot] != 2) & self->elapsedTrackColor[OBJC_IVAR____TtC5Music17PlayerTimeControl_durationSnapshot];
}

- (_TtC5Music17PlayerTimeControl)initWithFrame:(CGRect)a3
{
  double result = (_TtC5Music17PlayerTimeControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end