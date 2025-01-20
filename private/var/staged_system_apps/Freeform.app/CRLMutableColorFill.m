@interface CRLMutableColorFill
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBrightness:(double)a3;
- (void)setColor:(id)a3;
- (void)setHue:(double)a3;
- (void)setOpacity:(double)a3;
- (void)setSaturation:(double)a3;
@end

@implementation CRLMutableColorFill

- (void)setColor:(id)a3
{
  id v5 = a3;
  v4 = [(CRLColorFill *)self color];
  if (([v4 isEqual:v5] & 1) == 0) {
    [(CRLColorFill *)self i_setColor:v5];
  }
}

- (void)setOpacity:(double)a3
{
  id v6 = [(CRLColorFill *)self color];
  id v5 = [v6 colorWithAlphaComponent:a3];
  [(CRLMutableColorFill *)self setColor:v5];
}

- (void)setHue:(double)a3
{
  [(CRLColorFill *)self saturation];
  double v6 = v5;
  [(CRLColorFill *)self brightness];
  double v8 = v7;
  [(CRLColorFill *)self opacity];
  id v10 = +[CRLColor colorWithHue:a3 saturation:v6 brightness:v8 alpha:v9];
  [(CRLMutableColorFill *)self setColor:v10];
}

- (void)setBrightness:(double)a3
{
  [(CRLColorFill *)self hue];
  double v6 = v5;
  [(CRLColorFill *)self saturation];
  double v8 = v7;
  [(CRLColorFill *)self opacity];
  id v10 = +[CRLColor colorWithHue:v6 saturation:v8 brightness:a3 alpha:v9];
  [(CRLMutableColorFill *)self setColor:v10];
}

- (void)setSaturation:(double)a3
{
  [(CRLColorFill *)self hue];
  double v6 = v5;
  [(CRLColorFill *)self brightness];
  double v8 = v7;
  [(CRLColorFill *)self opacity];
  id v10 = +[CRLColor colorWithHue:v6 saturation:a3 brightness:v8 alpha:v9];
  [(CRLMutableColorFill *)self setColor:v10];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CRLColorFill alloc];
  double v5 = [(CRLColorFill *)self color];
  double v6 = [(CRLColorFill *)v4 initWithColor:v5];

  return v6;
}

@end