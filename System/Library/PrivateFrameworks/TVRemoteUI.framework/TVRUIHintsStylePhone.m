@interface TVRUIHintsStylePhone
- (BOOL)shouldShowSiriHint;
- (BOOL)shouldShowVolumeHint;
- (NSString)description;
- (double)activationAnimationDismissalDelay;
- (double)activationAnimationDuration;
- (double)animationDuration;
- (double)animationPresentationDelay;
- (double)buttonOutlineWidth;
- (double)hintButtonWidth;
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

@implementation TVRUIHintsStylePhone

- (id)backgroundColor
{
  return (id)[MEMORY[0x263F825C8] blackColor];
}

- (id)backgroundFilters
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
  [v2 setValue:&unk_26DB65D48 forKey:@"inputRadius"];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)primaryTintColor
{
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    double v2 = 0.388235294;
    double v3 = 0.4;
  }
  else
  {
    double v2 = 0.235294118;
    double v3 = 0.262745098;
  }
  v4 = [MEMORY[0x263F825C8] colorWithRed:v2 green:v2 blue:v3 alpha:1.0];
  return v4;
}

- (id)siriImage
{
  return (id)objc_msgSend(MEMORY[0x263F827E8], "tvrui_symbolImageWithName:textStyle:weight:scale:maxPointSize:", @"mic.circle.fill", *MEMORY[0x263F835E0], 7, 2, 1.79769313e308);
}

- (id)volumeImage
{
  return (id)objc_msgSend(MEMORY[0x263F827E8], "tvrui_symbolImageWithName:textStyle:weight:scale:maxPointSize:", @"speaker.wave.2.circle.fill", *MEMORY[0x263F835E0], 7, 2, 1.79769313e308);
}

- (double)maximumSymbolPointSize
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePhone;
  [(TVRUIHintsStyle *)&v3 maximumSymbolPointSize];
  return result;
}

- (BOOL)shouldShowSiriHint
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePhone;
  return [(TVRUIHintsStyle *)&v3 shouldShowSiriHint];
}

- (BOOL)shouldShowVolumeHint
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePhone;
  return [(TVRUIHintsStyle *)&v3 shouldShowVolumeHint];
}

- (double)imageMargin
{
  return 13.0;
}

- (double)animationPresentationDelay
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePhone;
  [(TVRUIHintsStyle *)&v3 animationPresentationDelay];
  return result;
}

- (double)animationDuration
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePhone;
  [(TVRUIHintsStyle *)&v3 animationDuration];
  return result;
}

- (double)activationAnimationDuration
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePhone;
  [(TVRUIHintsStyle *)&v3 activationAnimationDuration];
  return result;
}

- (double)activationAnimationDismissalDelay
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePhone;
  [(TVRUIHintsStyle *)&v3 activationAnimationDismissalDelay];
  return result;
}

- (double)buttonOutlineWidth
{
  return 5.0;
}

- (double)hintButtonWidth
{
  return 2.0;
}

- (double)siriHintContainerWidth
{
  objc_super v3 = [(TVRUIHintsStylePhone *)self siriImage];
  [v3 size];
  double v5 = v4;
  [(TVRUIHintsStylePhone *)self buttonOutlineWidth];
  double v7 = v5 + v6;

  return v7;
}

- (double)volumeHintContainerWidth
{
  objc_super v3 = [(TVRUIHintsStylePhone *)self volumeImage];
  [v3 size];
  double v5 = v4;
  [(TVRUIHintsStylePhone *)self buttonOutlineWidth];
  double v7 = v5 + v6;

  return v7;
}

- (id)siriHintTipContext
{
  v4.receiver = self;
  v4.super_class = (Class)TVRUIHintsStylePhone;
  double v2 = [(TVRUIHintsStyle *)&v4 siriHintTipContext];
  return v2;
}

- (int64_t)userInterfaceStyle
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePhone;
  return [(TVRUIHintsStyle *)&v3 userInterfaceStyle];
}

- (double)preferredTipWidth
{
  objc_super v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 bounds];
  double v5 = v4;

  if (v5 <= 667.0) {
    return 304.0;
  }
  v7.receiver = self;
  v7.super_class = (Class)TVRUIHintsStylePhone;
  [(TVRUIHintsStyle *)&v7 preferredTipWidth];
  return result;
}

- (NSString)description
{
  objc_super v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:@"Phone" withName:@"idiom"];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRUIHintsStyle hasHomeButton](self, "hasHomeButton"), @"hasHomeButton");
  double v5 = [v3 build];

  return (NSString *)v5;
}

@end