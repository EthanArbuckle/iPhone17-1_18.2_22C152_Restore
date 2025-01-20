@interface NANowPlayingVolumeSlider
- (BOOL)isOnScreenForVolumeDisplay;
- (CGPoint)accessibilityActivationPoint;
- (NANowPlayingVolumeSlider)initWithCoder:(id)a3;
- (NANowPlayingVolumeSlider)initWithFrame:(CGRect)a3;
- (NSString)accessibilityValue;
- (NSString)volumeAudioCategory;
- (UIWindowScene)windowSceneForVolumeDisplay;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)didMoveToWindow;
- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4;
- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4;
@end

@implementation NANowPlayingVolumeSlider

- (NANowPlayingVolumeSlider)initWithFrame:(CGRect)a3
{
  return (NANowPlayingVolumeSlider *)sub_1BF5C31F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NANowPlayingVolumeSlider)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF5C4D40();
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_1BF5C47A8();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___NANowPlayingVolumeSlider_volumeChangeHandler);
  sub_1BF4C35A0(v3);
}

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_1BF5C3B34();
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  id v5 = a3;
  v6 = self;
  sub_1BF5C4E70();
}

- (UIWindowScene)windowSceneForVolumeDisplay
{
  v2 = self;
  id v3 = [(NANowPlayingVolumeSlider *)v2 window];
  id v4 = objc_msgSend(v3, sel_windowScene);

  return (UIWindowScene *)v4;
}

- (NSString)volumeAudioCategory
{
  v2 = self;
  sub_1BF5C4AE8();

  id v3 = (void *)sub_1BF7E3998();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isOnScreenForVolumeDisplay
{
  v2 = self;
  if ([(NANowPlayingVolumeSlider *)v2 isHidden])
  {

    return 0;
  }
  else
  {
    [(NANowPlayingVolumeSlider *)v2 alpha];
    double v5 = v4;

    return v5 > 0.0;
  }
}

- (NSString)accessibilityValue
{
  sub_1BF7E3EA8();
  v2 = (void *)sub_1BF7E3998();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = *(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___NANowPlayingVolumeSlider_slider);
  id v3 = *(void **)&v2[OBJC_IVAR____TtC12NewsArticles10SliderView_elapsedTrack];
  double v4 = self;
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
  LODWORD(v2) = 1036831949;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___NANowPlayingVolumeSlider_volumeController), sel_adjustVolumeValue_, v2);
}

- (void)accessibilityDecrement
{
  LODWORD(v2) = -1110651699;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___NANowPlayingVolumeSlider_volumeController), sel_adjustVolumeValue_, v2);
}

@end