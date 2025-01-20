@interface NANowPlayingTimeControl
- (BOOL)isEnabled;
- (BOOL)isHidden;
- (CGPoint)accessibilityActivationPoint;
- (NANowPlayingTimeControl)initWithCoder:(id)a3;
- (NANowPlayingTimeControl)initWithFrame:(CGRect)a3;
- (NSString)accessibilityValue;
- (UIColor)elapsedTrackColor;
- (UIColor)remainingTrackColor;
- (UIColor)timeLabelTextColor;
- (UIColor)timeLabelTrackingTextColor;
- (UIColor)trackingTrackColor;
- (double)alpha;
- (id)timeDidChangeHandler;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)displayLinkFired:(id)a3;
- (void)setAlpha:(double)a3;
- (void)setCurrentTime:(double)a3 duration:(double)a4 rate:(double)a5 isWaiting:(BOOL)a6 animated:(BOOL)a7;
- (void)setElapsedTrackColor:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setRemainingTrackColor:(id)a3;
- (void)setTimeDidChangeHandler:(id)a3;
- (void)setTimeLabelTextColor:(id)a3;
- (void)setTimeLabelTrackingTextColor:(id)a3;
- (void)setTrackingTrackColor:(id)a3;
- (void)tintColorDidChange;
- (void)updateFonts;
@end

@implementation NANowPlayingTimeControl

- (NANowPlayingTimeControl)initWithFrame:(CGRect)a3
{
  return (NANowPlayingTimeControl *)sub_1BF4BF7A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NANowPlayingTimeControl)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF4C27D4();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___NANowPlayingTimeControl_displayLink);
  v5 = self;
  if (v4) {
    objc_msgSend(v4, sel_invalidate);
  }
  v6.receiver = self;
  v6.super_class = ObjectType;
  [(NANowPlayingTimeControl *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NANowPlayingTimeControl_remainingTimeLabel));
  sub_1BF4C35A0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___NANowPlayingTimeControl_scrubbingDidChangeHandler));
  sub_1BF4C35A0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___NANowPlayingTimeControl_timeDidChangeHandler));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NANowPlayingTimeControl_remainingTrackColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NANowPlayingTimeControl_trackingTrackColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NANowPlayingTimeControl_timeLabelTextColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NANowPlayingTimeControl_timeLabelTrackingTextColor));
  swift_release();
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NANowPlayingTimeControl_accessibilityTimeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NANowPlayingTimeControl____lazy_storage___elapsedTimeLabelBaselineConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___NANowPlayingTimeControl____lazy_storage___remainingTimeLabelBaselineConstraint);
}

- (id)timeDidChangeHandler
{
  if (*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___NANowPlayingTimeControl_timeDidChangeHandler))
  {
    uint64_t v2 = *(void *)((char *)&self->super.super.super._responderFlags
                   + OBJC_IVAR___NANowPlayingTimeControl_timeDidChangeHandler);
    v5[4] = *(Class *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NANowPlayingTimeControl_timeDidChangeHandler);
    v5[5] = v2;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 1107296256;
    v5[2] = sub_1BF4C1080;
    v5[3] = &block_descriptor_1;
    id v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)setTimeDidChangeHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    objc_super v6 = sub_1BF4C3530;
  }
  else
  {
    objc_super v6 = 0;
  }
  v7 = (uint64_t (**)(char))((char *)self + OBJC_IVAR___NANowPlayingTimeControl_timeDidChangeHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___NANowPlayingTimeControl_timeDidChangeHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)(char))v4;
  sub_1BF4C35A0(v8);
}

- (UIColor)elapsedTrackColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR___NANowPlayingTimeControl_elapsedTrackColor));
}

- (void)setElapsedTrackColor:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_1BF4C2A94(v5);
}

- (UIColor)remainingTrackColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR___NANowPlayingTimeControl_remainingTrackColor));
}

- (void)setRemainingTrackColor:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_1BF4C2B84(v5);
}

- (UIColor)trackingTrackColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR___NANowPlayingTimeControl_trackingTrackColor));
}

- (void)setTrackingTrackColor:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_1BF4C2C70(v5);
}

- (UIColor)timeLabelTextColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR___NANowPlayingTimeControl_timeLabelTextColor));
}

- (void)setTimeLabelTextColor:(id)a3
{
}

- (UIColor)timeLabelTrackingTextColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR___NANowPlayingTimeControl_timeLabelTrackingTextColor));
}

- (void)setTimeLabelTrackingTextColor:(id)a3
{
}

- (BOOL)isHidden
{
  return sub_1BF4C1A40(self, (uint64_t)a2, (SEL *)&selRef_isHidden);
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v9.receiver = self;
  v9.super_class = ObjectType;
  objc_super v6 = self;
  char v7 = [(NANowPlayingTimeControl *)&v9 isHidden];
  v8.receiver = v6;
  v8.super_class = ObjectType;
  [(NANowPlayingTimeControl *)&v8 setHidden:v3];
  sub_1BF4C1480(v7);
}

- (double)alpha
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  [(NANowPlayingTimeControl *)&v3 alpha];
  return result;
}

- (void)setAlpha:(double)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v10.receiver = self;
  v10.super_class = ObjectType;
  objc_super v6 = self;
  [(NANowPlayingTimeControl *)&v10 alpha];
  double v8 = v7;
  v9.receiver = v6;
  v9.super_class = ObjectType;
  [(NANowPlayingTimeControl *)&v9 setAlpha:a3];
  sub_1BF4C16D8(v8);
}

- (void)didMoveToWindow
{
  uint64_t v2 = self;
  sub_1BF4C186C();
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(NANowPlayingTimeControl *)&v3 tintColorDidChange];
  sub_1BF4C12C0();
}

- (BOOL)isEnabled
{
  return sub_1BF4C1A40(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v12.receiver = self;
  v12.super_class = ObjectType;
  objc_super v6 = self;
  [(NANowPlayingTimeControl *)&v12 setEnabled:v3];
  uint64_t v7 = *(uint64_t *)((char *)&v6->super.super.super.super.isa + OBJC_IVAR___NANowPlayingTimeControl_slider);
  v11.receiver = v6;
  v11.super_class = ObjectType;
  unsigned __int8 v8 = [(NANowPlayingTimeControl *)&v11 isEnabled];
  uint64_t v9 = OBJC_IVAR____TtC12NewsArticles10SliderView_isEnabled;
  *(unsigned char *)(v7 + OBJC_IVAR____TtC12NewsArticles10SliderView_isEnabled) = v8;
  id v10 = sub_1BF7D822C();
  objc_msgSend(v10, sel_setEnabled_, *(unsigned __int8 *)(v7 + v9));
}

- (NSString)accessibilityValue
{
  id v2 = self;
  sub_1BF4C1BAC();
  uint64_t v4 = v3;

  if (v4)
  {
    id v5 = (void *)sub_1BF7E3998();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  return (NSString *)v5;
}

- (CGPoint)accessibilityActivationPoint
{
  id v2 = *(char **)((char *)&self->super.super.super.super.isa + OBJC_IVAR___NANowPlayingTimeControl_slider);
  uint64_t v3 = *(void **)&v2[OBJC_IVAR____TtC12NewsArticles10SliderView_elapsedTrack];
  uint64_t v4 = self;
  objc_msgSend(v3, sel_accessibilityFrame);
  CGFloat MaxX = CGRectGetMaxX(v10);
  objc_msgSend(v2, sel_accessibilityFrame);
  CGFloat MidY = CGRectGetMidY(v11);

  double v7 = MaxX;
  double v8 = MidY;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)accessibilityIncrement
{
  id v2 = self;
  sub_1BF4C1E2C();
}

- (void)accessibilityDecrement
{
  id v2 = self;
  sub_1BF4C1F9C();
}

- (void)displayLinkFired:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1BF4C2D60();
}

- (void)setCurrentTime:(double)a3 duration:(double)a4 rate:(double)a5 isWaiting:(BOOL)a6 animated:(BOOL)a7
{
  BOOL v7 = a6;
  CGRect v11 = self;
  sub_1BF4C2E98(v7, a3, a4, a5);
}

- (void)updateFonts
{
  id v2 = self;
  sub_1BF4C0BA0();
}

@end