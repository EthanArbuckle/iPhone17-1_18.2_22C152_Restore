@interface VolumeSlider
- (BOOL)isOnScreenForVolumeDisplay;
- (NSString)volumeAudioCategory;
- (UIWindowScene)windowSceneForVolumeDisplay;
- (_TtC5Music12VolumeSlider)initWithCoder:(id)a3;
- (_TtC5Music12VolumeSlider)initWithFrame:(CGRect)a3;
- (float)accessibilityCurrentValue;
- (void)_sliderFluidInteractionWillBegin:(id)a3 withLocation:(CGPoint)a4;
- (void)_sliderFluidInteractionWillContinue:(id)a3 withLocation:(CGPoint)a4;
- (void)_sliderFluidInteractionWillEnd:(id)a3;
- (void)_sliderFluidInteractionWillExtend:(id)a3 insets:(UIEdgeInsets)a4;
- (void)accessibilityUpdateWithVolume:(float)a3;
- (void)didMoveToWindow;
- (void)sliderDidChangeValue:(id)a3;
- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4;
- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4;
@end

@implementation VolumeSlider

- (_TtC5Music12VolumeSlider)initWithFrame:(CGRect)a3
{
  return (_TtC5Music12VolumeSlider *)sub_1006BA964(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music12VolumeSlider)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006BBF60();
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_1006BB1B0();
}

- (void)sliderDidChangeValue:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1006BB3A8(v4);
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music12VolumeSlider_volumeChangeHandler);

  sub_10006ADFC(v3);
}

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_1006BB2A8(1);
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  id v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music12VolumeSlider_slider);
  id v6 = a3;
  v9 = self;
  if (([v5 isTracking] & 1) == 0)
  {
    sub_1006BB2A8(1);
    v7 = *(void (**)(uint64_t))((char *)&v9->super.super.super.isa
                                        + OBJC_IVAR____TtC5Music12VolumeSlider_volumeChangeHandler);
    if (v7)
    {
      uint64_t v8 = swift_retain();
      v7(v8);
      sub_10006ADFC((uint64_t)v7);
    }
  }
}

- (UIWindowScene)windowSceneForVolumeDisplay
{
  v2 = self;
  id v3 = [(VolumeSlider *)v2 window];
  id v4 = [v3 windowScene];

  return (UIWindowScene *)v4;
}

- (NSString)volumeAudioCategory
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music12VolumeSlider_volumeController);
  id v3 = self;
  id v4 = objc_msgSend(objc_msgSend(v2, "dataSource"), "volumeAudioCategory");
  swift_unknownObjectRelease();
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (BOOL)isOnScreenForVolumeDisplay
{
  v2 = self;
  if ([(VolumeSlider *)v2 isHidden])
  {

    return 0;
  }
  else
  {
    [(VolumeSlider *)v2 alpha];
    double v5 = v4;

    return v5 > 0.0;
  }
}

- (void)_sliderFluidInteractionWillBegin:(id)a3 withLocation:(CGPoint)a4
{
  id v5 = a3;
  id v6 = self;
  sub_1006BC114();
}

- (void)_sliderFluidInteractionWillContinue:(id)a3 withLocation:(CGPoint)a4
{
  double v4 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Music12VolumeSlider_volumeChangeHandler);
  if (v4)
  {
    id v6 = a3;
    uint64_t v8 = self;
    uint64_t v7 = sub_10007B674((uint64_t)v4);
    v4(v7);
    sub_10006ADFC((uint64_t)v4);
  }
}

- (void)_sliderFluidInteractionWillExtend:(id)a3 insets:(UIEdgeInsets)a4
{
  double v4 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Music12VolumeSlider_volumeChangeHandler);
  if (v4)
  {
    id v6 = a3;
    uint64_t v8 = self;
    uint64_t v7 = sub_10007B674((uint64_t)v4);
    v4(v7);
    sub_10006ADFC((uint64_t)v4);
  }
}

- (void)_sliderFluidInteractionWillEnd:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1006BBBD0(v4);
}

- (float)accessibilityCurrentValue
{
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music12VolumeSlider_slider) value];
  return result;
}

- (void)accessibilityUpdateWithVolume:(float)a3
{
}

@end