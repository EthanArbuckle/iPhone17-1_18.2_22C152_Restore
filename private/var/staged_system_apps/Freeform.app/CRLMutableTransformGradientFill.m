@interface CRLMutableTransformGradientFill
- (id)copyWithZone:(_NSZone *)a3;
- (id)insertStopAtFraction:(double)a3;
- (id)insertStopAtFraction:(double)a3 withColor:(id)a4;
- (id)removeStopAtIndex:(unint64_t)a3;
- (void)evenlyDistributeStops;
- (void)moveStopAtIndex:(unint64_t)a3 toFraction:(double)a4;
- (void)removeStop:(id)a3;
- (void)reverseStopOrder;
- (void)setColorOfStopAtIndex:(unint64_t)a3 toColor:(id)a4;
- (void)setEndPoint:(CGPoint)a3 inShapeWithNaturalSize:(CGSize)a4;
- (void)setFirstColor:(id)a3;
- (void)setGradientAngleInDegrees:(double)a3;
- (void)setGradientStops:(id)a3;
- (void)setGradientType:(unint64_t)a3;
- (void)setInflectionOfStopAtIndex:(unint64_t)a3 toInflection:(double)a4;
- (void)setLastColor:(id)a3;
- (void)setOpacity:(double)a3;
- (void)setStartPoint:(CGPoint)a3 inShapeWithNaturalSize:(CGSize)a4;
- (void)swapStopAtIndex:(unint64_t)a3 withStopAtIndex:(unint64_t)a4;
- (void)upgradeIfNecessaryWithBaseNaturalSize:(CGSize)a3;
@end

@implementation CRLMutableTransformGradientFill

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

  [(CRLMutableTransformGradientFill *)self setColorOfStopAtIndex:v5 toColor:a3];
}

- (void)setOpacity:(double)a3
{
}

- (void)setStartPoint:(CGPoint)a3 inShapeWithNaturalSize:(CGSize)a4
{
  -[CRLTransformGradientFill p_scalePoint:fromShapeWithNaturalSize:](self, "p_scalePoint:fromShapeWithNaturalSize:", a3.x, a3.y, a4.width, a4.height);

  -[CRLTransformGradientFill p_setStartPoint:](self, "p_setStartPoint:");
}

- (void)setEndPoint:(CGPoint)a3 inShapeWithNaturalSize:(CGSize)a4
{
  -[CRLTransformGradientFill p_scalePoint:fromShapeWithNaturalSize:](self, "p_scalePoint:fromShapeWithNaturalSize:", a3.x, a3.y, a4.width, a4.height);

  -[CRLTransformGradientFill p_setEndPoint:](self, "p_setEndPoint:");
}

- (void)upgradeIfNecessaryWithBaseNaturalSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  p_mTransformBeforeUpgrade = &self->super.mTransformBeforeUpgrade;
  long long v7 = *(_OWORD *)&self->super.mTransformBeforeUpgrade.c;
  *(_OWORD *)&v10.a = *(_OWORD *)&self->super.mTransformBeforeUpgrade.a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&self->super.mTransformBeforeUpgrade.tx;
  CGAffineTransformInvert(&v11, &v10);
  long long v8 = *(_OWORD *)&v11.c;
  *(_OWORD *)&p_mTransformBeforeUpgrade->a = *(_OWORD *)&v11.a;
  *(_OWORD *)&p_mTransformBeforeUpgrade->c = v8;
  *(_OWORD *)&p_mTransformBeforeUpgrade->tx = *(_OWORD *)&v11.tx;
  -[CRLMutableTransformGradientFill setBaseNaturalSize:](self, "setBaseNaturalSize:", height * p_mTransformBeforeUpgrade->c + p_mTransformBeforeUpgrade->a * width, height * p_mTransformBeforeUpgrade->d + p_mTransformBeforeUpgrade->b * width);
  long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&p_mTransformBeforeUpgrade->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&p_mTransformBeforeUpgrade->c = v9;
  *(_OWORD *)&p_mTransformBeforeUpgrade->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
}

- (void)setGradientAngleInDegrees:(double)a3
{
  p_mStart = &self->super.mStart;
  p_mEnd = &self->super.mEnd;
  double x = self->super.mStart.x;
  double y = self->super.mStart.y;
  double v8 = self->super.mEnd.x;
  double v9 = sub_100065E00(x, y, v8, self->super.mEnd.y, 0.5);
  double v11 = v10;
  double v12 = sub_100064680(x, y, v8);
  double v14 = sub_100065398(v12, v13);
  double v15 = sub_1000662E0(a3 * 0.0174532925);
  double v17 = sub_1000646A4(-v15, v16, v14 * 0.5);
  p_mStart->double x = sub_100064698(v9, v11, v17);
  p_mStart->double y = v18;
  p_mEnd->double x = sub_100064680(v9, v11, v17);
  p_mEnd->double y = v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CRLTransformGradientFill allocWithZone:a3];
  v5 = [(CRLGradientFill *)self gradientStops];
  unint64_t v6 = [(CRLGradientFill *)self gradientType];
  [(CRLGradientFill *)self opacity];
  long long v7 = -[CRLGradientFill initWithGradientStops:type:opacity:](v4, "initWithGradientStops:type:opacity:", v5, v6);
  [(CRLGradientFill *)v7 i_setAdvancedGradientFlag:[(CRLGradientFill *)self i_advancedGradientFlag]];
  [(CRLTransformGradientFill *)self startPoint];
  -[CRLTransformGradientFill p_setStartPoint:](v7, "p_setStartPoint:");
  [(CRLTransformGradientFill *)self endPoint];
  -[CRLTransformGradientFill p_setEndPoint:](v7, "p_setEndPoint:");
  [(CRLTransformGradientFill *)self baseNaturalSize];
  -[CRLTransformGradientFill p_setBaseNaturalSize:](v7, "p_setBaseNaturalSize:");
  return v7;
}

@end