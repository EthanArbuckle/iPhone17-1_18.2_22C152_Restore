@interface SBLightPasscodeNumberPadButton
+ (BOOL)usesTelephonyGlyphsWhereAvailable;
+ (CGSize)defaultSize;
+ (UIEdgeInsets)paddingOutsideRing;
+ (double)_numberPadButtonOuterCircleDiameter;
+ (double)highlightedCircleViewAlpha;
+ (double)unhighlightedCircleViewAlpha;
- (UIColor)reduceTransparencyButtonColor;
- (id)initForCharacter:(int64_t)a3;
- (id)stringCharacter;
- (int)characterType;
- (void)setReduceTransparencyButtonColor:(id)a3;
@end

@implementation SBLightPasscodeNumberPadButton

- (id)initForCharacter:(int64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SBLightPasscodeNumberPadButton;
  id v3 = [(TPNumberPadButton *)&v15 initForCharacter:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 revealingRingView];
    v6 = [MEMORY[0x1E4F428B8] clearColor];
    [v5 setColorInsideRing:v6];

    v7 = [v4 revealingRingView];
    v8 = [MEMORY[0x1E4F428B8] clearColor];
    [v7 setColorOutsideRing:v8];

    v9 = [v4 revealingRingView];
    [v9 setRevealAnimationDuration:0.0];

    v10 = [v4 revealingRingView];
    [v10 setUnrevealAnimationDuration:0.392500013];

    v11 = [v4 layer];
    LODWORD(v8) = [v11 disableUpdateMask];

    uint64_t v12 = v8 | 0x10;
    v13 = [v4 layer];
    [v13 setDisableUpdateMask:v12];
  }
  return v4;
}

- (int)characterType
{
  int64_t v2 = [(TPNumberPadButton *)self character];
  return +[SBPasscodeNumberPadButton _characterTypeForCharacter:v2];
}

- (id)stringCharacter
{
  int64_t v2 = [(TPNumberPadButton *)self character];
  return +[SBPasscodeNumberPadButton _stringCharacterForCharacter:v2];
}

+ (CGSize)defaultSize
{
  +[SBPasscodeNumberPadButton defaultSize];
  result.height = v3;
  result.width = v2;
  return result;
}

+ (UIEdgeInsets)paddingOutsideRing
{
  +[SBPasscodeNumberPadButton paddingOutsideRing];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (double)_numberPadButtonOuterCircleDiameter
{
  +[SBPasscodeNumberPadButton _numberPadButtonOuterCircleDiameter];
  return result;
}

+ (BOOL)usesTelephonyGlyphsWhereAvailable
{
  return 0;
}

- (void)setReduceTransparencyButtonColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_reduceTransparencyButtonColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_reduceTransparencyButtonColor, a3);
    [(TPNumberPadButton *)self setColor:self->_reduceTransparencyButtonColor];
    double v5 = v6;
  }
}

+ (double)unhighlightedCircleViewAlpha
{
  int v2 = [a1 _shouldUseAlternativeCirlceViewAlphas];
  double result = 0.1;
  if (v2) {
    return 0.47;
  }
  return result;
}

+ (double)highlightedCircleViewAlpha
{
  int v2 = [a1 _shouldUseAlternativeCirlceViewAlphas];
  double result = 0.3;
  if (v2) {
    return 0.9;
  }
  return result;
}

- (UIColor)reduceTransparencyButtonColor
{
  return self->_reduceTransparencyButtonColor;
}

- (void).cxx_destruct
{
}

@end