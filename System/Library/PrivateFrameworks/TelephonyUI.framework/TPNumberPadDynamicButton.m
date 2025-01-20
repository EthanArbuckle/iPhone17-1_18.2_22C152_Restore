@interface TPNumberPadDynamicButton
+ (BOOL)usesTelephonyGlyphsWhereAvailable;
+ (double)highlightedCircleViewAlpha;
+ (double)unhighlightedCircleViewAlpha;
+ (id)imageForCharacter:(int64_t)a3;
+ (id)imageForCharacter:(int64_t)a3 highlighted:(BOOL)a4;
+ (int64_t)currentStyle;
- (id)buttonColor;
- (id)initForCharacter:(int64_t)a3 style:(int64_t)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateCurrentStyleIfNecessaryFromStyle:(int64_t)a3;
@end

@implementation TPNumberPadDynamicButton

- (id)initForCharacter:(int64_t)a3 style:(int64_t)a4
{
  currentStyle = a4;
  v7.receiver = self;
  v7.super_class = (Class)TPNumberPadDynamicButton;
  id v4 = -[TPNumberPadButton initForCharacter:style:](&v7, sel_initForCharacter_style_, a3);
  v5 = v4;
  if (v4) {
    [v4 updateCurrentStyleIfNecessaryFromStyle:currentStyle];
  }
  return v5;
}

- (id)buttonColor
{
  if (currentStyle == 2) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  v2 = [MEMORY[0x1E4FB1618] blackColor];
  }
  return v2;
}

+ (int64_t)currentStyle
{
  return currentStyle;
}

+ (id)imageForCharacter:(int64_t)a3
{
  return (id)[a1 imageForCharacter:a3 highlighted:0 whiteVersion:currentStyle == 2];
}

+ (id)imageForCharacter:(int64_t)a3 highlighted:(BOOL)a4
{
  return (id)[a1 imageForCharacter:a3 highlighted:0 whiteVersion:currentStyle == 2];
}

+ (double)unhighlightedCircleViewAlpha
{
  if (currentStyle == 2) {
    v2 = off_1E647BAB0;
  }
  else {
    v2 = off_1E647BAB8;
  }
  [(__objc2_class *)*v2 unhighlightedCircleViewAlpha];
  return result;
}

+ (double)highlightedCircleViewAlpha
{
  if (currentStyle == 2) {
    v2 = off_1E647BAB0;
  }
  else {
    v2 = off_1E647BAB8;
  }
  [(__objc2_class *)*v2 highlightedCircleViewAlpha];
  return result;
}

+ (BOOL)usesTelephonyGlyphsWhereAvailable
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPNumberPadDynamicButton;
  id v4 = a3;
  [(TPNumberPadDynamicButton *)&v6 traitCollectionDidChange:v4];
  uint64_t v5 = objc_msgSend(v4, "userInterfaceStyle", v6.receiver, v6.super_class);

  [(TPNumberPadDynamicButton *)self updateCurrentStyleIfNecessaryFromStyle:v5];
}

- (void)updateCurrentStyleIfNecessaryFromStyle:(int64_t)a3
{
  id v9 = [(TPNumberPadDynamicButton *)self traitCollection];
  if ([v9 userInterfaceStyle] == a3)
  {
  }
  else
  {
    uint64_t v5 = [(TPNumberPadDynamicButton *)self traitCollection];
    uint64_t v6 = [v5 userInterfaceStyle];

    if (v6)
    {
      objc_super v7 = [(TPNumberPadDynamicButton *)self traitCollection];
      currentStyle = [v7 userInterfaceStyle];

      v8 = [(TPNumberPadDynamicButton *)self buttonColor];
      [(TPNumberPadButton *)self setColor:v8];

      [(TPNumberPadButton *)self reloadImagesForCurrentCharacter];
    }
  }
}

@end