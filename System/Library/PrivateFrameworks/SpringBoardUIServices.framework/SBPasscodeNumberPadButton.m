@interface SBPasscodeNumberPadButton
+ (BOOL)_isPortrait;
+ (CGSize)defaultSize;
+ (UIEdgeInsets)paddingOutsideRing;
+ (double)_numberPadButtonOuterCircleDiameter;
+ (double)highlightedCircleViewAlpha;
+ (double)outerCircleDiameter;
+ (double)unhighlightedCircleViewAlpha;
+ (id)_stringCharacterForCharacter:(int64_t)a3;
+ (int)_characterTypeForCharacter:(int64_t)a3;
- (UIColor)reduceTransparencyButtonColor;
- (id)initForCharacter:(int64_t)a3;
- (id)stringCharacter;
- (int)characterType;
- (void)setReduceTransparencyButtonColor:(id)a3;
@end

@implementation SBPasscodeNumberPadButton

- (id)initForCharacter:(int64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SBPasscodeNumberPadButton;
  id v3 = [(TPNumberPadButton *)&v15 initForCharacter:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 revealingRingView];
    v6 = [MEMORY[0x1E4F428B8] blackColor];
    [v5 setColorInsideRing:v6];

    v7 = [v4 revealingRingView];
    v8 = [MEMORY[0x1E4F428B8] blackColor];
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

+ (int)_characterTypeForCharacter:(int64_t)a3
{
  if ((unint64_t)a3 > 0xC) {
    return 0;
  }
  else {
    return dword_1A76A5660[a3];
  }
}

- (int)characterType
{
  id v3 = objc_opt_class();
  int64_t v4 = [(TPNumberPadButton *)self character];
  return [v3 _characterTypeForCharacter:v4];
}

+ (id)_stringCharacterForCharacter:(int64_t)a3
{
  if (_stringCharacterForCharacter____onceToken != -1) {
    dispatch_once(&_stringCharacterForCharacter____onceToken, &__block_literal_global_18);
  }
  int64_t v4 = (void *)_stringCharacterForCharacter____map;
  v5 = [NSNumber numberWithInteger:a3];
  v6 = [v4 objectForKey:v5];

  return v6;
}

void __58__SBPasscodeNumberPadButton__stringCharacterForCharacter___block_invoke()
{
  v13[10] = *MEMORY[0x1E4F143B8];
  v0 = [NSNumber numberWithUnsignedInt:0];
  v13[0] = @"1";
  v1 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", 1, v0);
  v12[1] = v1;
  v13[1] = @"2";
  v2 = [NSNumber numberWithUnsignedInt:2];
  v12[2] = v2;
  v13[2] = @"3";
  id v3 = [NSNumber numberWithUnsignedInt:3];
  v12[3] = v3;
  v13[3] = @"4";
  int64_t v4 = [NSNumber numberWithUnsignedInt:4];
  v12[4] = v4;
  v13[4] = @"5";
  v5 = [NSNumber numberWithUnsignedInt:5];
  v12[5] = v5;
  v13[5] = @"6";
  v6 = [NSNumber numberWithUnsignedInt:6];
  v12[6] = v6;
  v13[6] = @"7";
  v7 = [NSNumber numberWithUnsignedInt:7];
  v12[7] = v7;
  v13[7] = @"8";
  v8 = [NSNumber numberWithUnsignedInt:8];
  v12[8] = v8;
  v13[8] = @"9";
  v9 = [NSNumber numberWithUnsignedInt:10];
  v12[9] = v9;
  v13[9] = @"0";
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:10];
  v11 = (void *)_stringCharacterForCharacter____map;
  _stringCharacterForCharacter____map = v10;
}

- (id)stringCharacter
{
  id v3 = objc_opt_class();
  int64_t v4 = [(TPNumberPadButton *)self character];
  return (id)[v3 _stringCharacterForCharacter:v4];
}

+ (BOOL)_isPortrait
{
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  double Height = CGRectGetHeight(v13);
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  return Height >= CGRectGetWidth(v14);
}

+ (CGSize)defaultSize
{
  uint64_t v2 = [a1 _isPortrait];
  [MEMORY[0x1E4FA5F68] pinNumberPadButtonOuterCircleDiameter:v2];
  double v4 = v3;
  [MEMORY[0x1E4FA5F68] pinNumberPadButtonPaddingHeight:v2];
  double v6 = v5;
  [MEMORY[0x1E4FA5F68] pinNumberPadButtonPaddingWidth];
  double v8 = v4 + v7 * 2.0;
  double v9 = v4 + v6 * 2.0;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (double)outerCircleDiameter
{
  uint64_t v2 = [a1 _isPortrait];
  double v3 = (void *)MEMORY[0x1E4FA5F68];
  [v3 pinNumberPadButtonOuterCircleDiameter:v2];
  return result;
}

+ (UIEdgeInsets)paddingOutsideRing
{
  uint64_t v2 = [a1 _isPortrait];
  [MEMORY[0x1E4FA5F68] pinNumberPadButtonPaddingHeight:v2];
  double v4 = v3;
  [MEMORY[0x1E4FA5F68] pinNumberPadButtonPaddingWidth];
  double v6 = v5;
  double v7 = v4;
  double v8 = v4;
  double v9 = v6;
  result.right = v9;
  result.bottom = v8;
  result.left = v6;
  result.top = v7;
  return result;
}

+ (double)_numberPadButtonOuterCircleDiameter
{
  uint64_t v2 = [a1 _isPortrait];
  double v3 = (void *)MEMORY[0x1E4FA5F68];
  [v3 pinNumberPadButtonOuterCircleDiameter:v2];
  return result;
}

- (void)setReduceTransparencyButtonColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_reduceTransparencyButtonColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_reduceTransparencyButtonColor, a3);
    [(TPNumberPadButton *)self setColor:self->_reduceTransparencyButtonColor];
    double v5 = v6;
  }
}

+ (double)unhighlightedCircleViewAlpha
{
  int v2 = [a1 _shouldUseAlternativeCirlceViewAlphas];
  double result = 0.15;
  if (v2) {
    return 0.47;
  }
  return result;
}

+ (double)highlightedCircleViewAlpha
{
  int v2 = [a1 _shouldUseAlternativeCirlceViewAlphas];
  double result = 0.65;
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