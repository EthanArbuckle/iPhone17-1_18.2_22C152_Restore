@interface TSDMutableAngleGradient
- (void)setFirstColor:(id)a3;
- (void)setGradientAngleInDegrees:(double)a3;
- (void)setLastColor:(id)a3;
@end

@implementation TSDMutableAngleGradient

- (void)setFirstColor:(id)a3
{
}

- (void)setLastColor:(id)a3
{
  NSUInteger v5 = [(NSArray *)[(TSDGradient *)self gradientStops] count] - 1;

  [(TSDMutableAngleGradient *)self setColorOfStopAtIndex:v5 toColor:a3];
}

- (void)setGradientAngleInDegrees:(double)a3
{
  self->super.mAngle = a3 * 0.0174532925;
}

@end