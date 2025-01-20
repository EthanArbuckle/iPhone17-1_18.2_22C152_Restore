@interface CRLMutableGradientFill
- (id)insertStopAtFraction:(double)a3;
- (id)insertStopAtFraction:(double)a3 withColor:(id)a4;
- (id)removeStopAtIndex:(unint64_t)a3;
- (void)evenlyDistributeStops;
- (void)moveStopAtIndex:(unint64_t)a3 toFraction:(double)a4;
- (void)removeStop:(id)a3;
- (void)reverseStopOrder;
- (void)setColorOfStopAtIndex:(unint64_t)a3 toColor:(id)a4;
- (void)setFirstColor:(id)a3;
- (void)setFraction:(double)a3 ofStopAtIndex:(unint64_t)a4;
- (void)setGradientStops:(id)a3;
- (void)setGradientType:(unint64_t)a3;
- (void)setInflectionOfStopAtIndex:(unint64_t)a3 toInflection:(double)a4;
- (void)setLastColor:(id)a3;
- (void)setOpacity:(double)a3;
- (void)swapStopAtIndex:(unint64_t)a3 withStopAtIndex:(unint64_t)a4;
@end

@implementation CRLMutableGradientFill

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

  [(CRLMutableGradientFill *)self setColorOfStopAtIndex:v5 toColor:a3];
}

- (void)setOpacity:(double)a3
{
}

- (void)setFraction:(double)a3 ofStopAtIndex:(unint64_t)a4
{
  id v5 = [(NSArray *)[(CRLGradientFill *)self gradientStops] objectAtIndexedSubscript:a4];

  [v5 p_setFraction:a3];
}

@end