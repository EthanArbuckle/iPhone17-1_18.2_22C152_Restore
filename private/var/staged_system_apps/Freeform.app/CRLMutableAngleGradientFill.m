@interface CRLMutableAngleGradientFill
- (id)copyWithZone:(_NSZone *)a3;
- (id)insertStopAtFraction:(double)a3;
- (id)insertStopAtFraction:(double)a3 withColor:(id)a4;
- (id)removeStopAtIndex:(unint64_t)a3;
- (void)evenlyDistributeStops;
- (void)moveStopAtIndex:(unint64_t)a3 toFraction:(double)a4;
- (void)removeStop:(id)a3;
- (void)reverseStopOrder;
- (void)setColorOfStopAtIndex:(unint64_t)a3 toColor:(id)a4;
- (void)setFirstColor:(id)a3;
- (void)setGradientAngle:(double)a3;
- (void)setGradientAngleInDegrees:(double)a3;
- (void)setGradientStops:(id)a3;
- (void)setGradientType:(unint64_t)a3;
- (void)setInflectionOfStopAtIndex:(unint64_t)a3 toInflection:(double)a4;
- (void)setLastColor:(id)a3;
- (void)setOpacity:(double)a3;
- (void)swapStopAtIndex:(unint64_t)a3 withStopAtIndex:(unint64_t)a4;
@end

@implementation CRLMutableAngleGradientFill

- (void)setGradientStops:(id)a3
{
}

- (void)removeStop:(id)a3
{
}

- (id)removeStopAtIndex:(unint64_t)a3
{
  return [(CRLGradientFill *)self p_removeStopAtIndex:a3];
}

- (id)insertStopAtFraction:(double)a3
{
  return [(CRLGradientFill *)self p_insertStopAtFraction:a3];
}

- (id)insertStopAtFraction:(double)a3 withColor:(id)a4
{
  return [(CRLGradientFill *)self p_insertStopAtFraction:a4 withColor:a3];
}

- (void)reverseStopOrder
{
}

- (void)evenlyDistributeStops
{
}

- (void)setGradientType:(unint64_t)a3
{
}

- (void)moveStopAtIndex:(unint64_t)a3 toFraction:(double)a4
{
}

- (void)swapStopAtIndex:(unint64_t)a3 withStopAtIndex:(unint64_t)a4
{
}

- (void)setColorOfStopAtIndex:(unint64_t)a3 toColor:(id)a4
{
}

- (void)setInflectionOfStopAtIndex:(unint64_t)a3 toInflection:(double)a4
{
}

- (void)setFirstColor:(id)a3
{
}

- (void)setLastColor:(id)a3
{
  v5 = (char *)[(NSArray *)[(CRLGradientFill *)self gradientStops] count] - 1;

  [(CRLMutableAngleGradientFill *)self setColorOfStopAtIndex:v5 toColor:a3];
}

- (void)setOpacity:(double)a3
{
}

- (void)setGradientAngleInDegrees:(double)a3
{
}

- (void)setGradientAngle:(double)a3
{
  self->super.mAngle = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CRLAngleGradientFill allocWithZone:a3];
  v5 = [(CRLGradientFill *)self gradientStops];
  unint64_t v6 = [(CRLGradientFill *)self gradientType];
  [(CRLGradientFill *)self opacity];
  double v8 = v7;
  [(CRLAngleGradientFill *)self gradientAngle];
  v10 = [(CRLAngleGradientFill *)v4 initWithGradientStops:v5 type:v6 opacity:v8 angle:v9];
  [(CRLGradientFill *)v10 i_setAdvancedGradientFlag:[(CRLGradientFill *)self i_advancedGradientFlag]];
  return v10;
}

@end