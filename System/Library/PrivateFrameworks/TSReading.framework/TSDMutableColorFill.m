@interface TSDMutableColorFill
- (void)setBrightness:(double)a3;
- (void)setColor:(id)a3;
- (void)setHue:(double)a3;
- (void)setOpacity:(double)a3;
- (void)setSaturation:(double)a3;
@end

@implementation TSDMutableColorFill

- (void)setColor:(id)a3
{
  mColor = self->super.mColor;
  if ((-[TSUColor isEqual:](mColor, "isEqual:") & 1) == 0)
  {
    self->super.mColor = (TSUColor *)[a3 copy];
  }
}

- (void)setOpacity:(double)a3
{
  v4 = [(TSUColor *)[(TSDColorFill *)self color] colorWithAlphaComponent:a3];

  [(TSDMutableColorFill *)self setColor:v4];
}

- (void)setHue:(double)a3
{
  v5 = (void *)MEMORY[0x263F7C808];
  [(TSDColorFill *)self saturation];
  double v7 = v6;
  [(TSDColorFill *)self brightness];
  double v9 = v8;
  [(TSDColorFill *)self opacity];
  uint64_t v11 = [v5 colorWithHue:a3 saturation:v7 brightness:v9 alpha:v10];

  [(TSDMutableColorFill *)self setColor:v11];
}

- (void)setBrightness:(double)a3
{
  v5 = (void *)MEMORY[0x263F7C808];
  [(TSDColorFill *)self hue];
  double v7 = v6;
  [(TSDColorFill *)self saturation];
  double v9 = v8;
  [(TSDColorFill *)self opacity];
  uint64_t v11 = [v5 colorWithHue:v7 saturation:v9 brightness:a3 alpha:v10];

  [(TSDMutableColorFill *)self setColor:v11];
}

- (void)setSaturation:(double)a3
{
  v5 = (void *)MEMORY[0x263F7C808];
  [(TSDColorFill *)self hue];
  double v7 = v6;
  [(TSDColorFill *)self brightness];
  double v9 = v8;
  [(TSDColorFill *)self opacity];
  uint64_t v11 = [v5 colorWithHue:v7 saturation:a3 brightness:v9 alpha:v10];

  [(TSDMutableColorFill *)self setColor:v11];
}

@end