@interface TVRUIHintsStylePad
- (BOOL)shouldShowSiriHint;
- (BOOL)shouldShowVolumeHint;
- (NSString)description;
- (double)activationAnimationDismissalDelay;
- (double)activationAnimationDuration;
- (double)animationDuration;
- (double)animationPresentationDelay;
- (double)buttonOutlineWidth;
- (double)imageMargin;
- (double)maximumSymbolPointSize;
- (double)preferredTipWidth;
- (double)siriHintContainerWidth;
- (double)volumeHintContainerWidth;
- (id)backgroundColor;
- (id)backgroundFilters;
- (id)primaryTintColor;
- (id)siriHintTipContext;
- (id)siriImage;
- (id)volumeImage;
- (int64_t)userInterfaceStyle;
@end

@implementation TVRUIHintsStylePad

- (id)backgroundColor
{
  return 0;
}

- (id)backgroundFilters
{
  return 0;
}

- (id)primaryTintColor
{
  v2 = [MEMORY[0x263F825C8] blackColor];
  v3 = [v2 colorWithAlphaComponent:0.5];

  return v3;
}

- (id)siriImage
{
  return (id)objc_msgSend(MEMORY[0x263F827E8], "tvrui_symbolImageWithName:fontSize:weight:scale:", @"mic.circle.fill", 7, 3, 28.0);
}

- (id)volumeImage
{
  return (id)objc_msgSend(MEMORY[0x263F827E8], "tvrui_symbolImageWithName:fontSize:weight:scale:", @"speaker.wave.2.circle.fill", 7, 3, 28.0);
}

- (double)maximumSymbolPointSize
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePad;
  [(TVRUIHintsStyle *)&v3 maximumSymbolPointSize];
  return result;
}

- (BOOL)shouldShowSiriHint
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePad;
  return [(TVRUIHintsStyle *)&v3 shouldShowSiriHint];
}

- (BOOL)shouldShowVolumeHint
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePad;
  return [(TVRUIHintsStyle *)&v3 shouldShowVolumeHint];
}

- (double)imageMargin
{
  return 12.0;
}

- (double)animationPresentationDelay
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePad;
  [(TVRUIHintsStyle *)&v3 animationPresentationDelay];
  return result;
}

- (double)animationDuration
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePad;
  [(TVRUIHintsStyle *)&v3 animationDuration];
  return result;
}

- (double)activationAnimationDuration
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePad;
  [(TVRUIHintsStyle *)&v3 activationAnimationDuration];
  return result;
}

- (double)activationAnimationDismissalDelay
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePad;
  [(TVRUIHintsStyle *)&v3 activationAnimationDismissalDelay];
  return result;
}

- (double)buttonOutlineWidth
{
  return 6.0;
}

- (double)siriHintContainerWidth
{
  objc_super v3 = [(TVRUIHintsStylePad *)self siriImage];
  [v3 size];
  double v5 = v4;
  [(TVRUIHintsStylePad *)self buttonOutlineWidth];
  double v7 = v5 + v6;

  return v7;
}

- (double)volumeHintContainerWidth
{
  objc_super v3 = [(TVRUIHintsStylePad *)self volumeImage];
  [v3 size];
  double v5 = v4;
  [(TVRUIHintsStylePad *)self buttonOutlineWidth];
  double v7 = v5 + v6;

  return v7;
}

- (id)siriHintTipContext
{
  v4.receiver = self;
  v4.super_class = (Class)TVRUIHintsStylePad;
  v2 = [(TVRUIHintsStyle *)&v4 siriHintTipContext];
  return v2;
}

- (int64_t)userInterfaceStyle
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePad;
  return [(TVRUIHintsStyle *)&v3 userInterfaceStyle];
}

- (double)preferredTipWidth
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePad;
  [(TVRUIHintsStyle *)&v3 preferredTipWidth];
  return result;
}

- (NSString)description
{
  objc_super v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:@"Pad" withName:@"idiom"];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRUIHintsStyle hasHomeButton](self, "hasHomeButton"), @"hasHomeButton");
  double v5 = [v3 build];

  return (NSString *)v5;
}

@end