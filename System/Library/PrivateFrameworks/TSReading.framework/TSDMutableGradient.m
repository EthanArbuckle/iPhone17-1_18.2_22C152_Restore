@interface TSDMutableGradient
- (void)setFirstColor:(id)a3;
- (void)setFraction:(double)a3 ofStopAtIndex:(unint64_t)a4;
- (void)setLastColor:(id)a3;
@end

@implementation TSDMutableGradient

- (void)setFirstColor:(id)a3
{
}

- (void)setLastColor:(id)a3
{
  NSUInteger v5 = [(NSArray *)[(TSDGradient *)self gradientStops] count] - 1;

  [(TSDMutableGradient *)self setColorOfStopAtIndex:v5 toColor:a3];
}

- (void)setFraction:(double)a3 ofStopAtIndex:(unint64_t)a4
{
  NSUInteger v5 = (void *)[(NSMutableArray *)self->super.mStops objectAtIndex:a4];

  objc_msgSend(v5, "p_setFraction:", a3);
}

@end