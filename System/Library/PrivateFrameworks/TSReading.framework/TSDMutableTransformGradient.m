@interface TSDMutableTransformGradient
- (void)setEndPoint:(CGPoint)a3 inShapeWithNaturalSize:(CGSize)a4;
- (void)setFirstColor:(id)a3;
- (void)setGradientAngleInDegrees:(double)a3;
- (void)setLastColor:(id)a3;
- (void)setStartPoint:(CGPoint)a3 inShapeWithNaturalSize:(CGSize)a4;
- (void)upgradeIfNecessaryWithBaseNaturalSize:(CGSize)a3;
@end

@implementation TSDMutableTransformGradient

- (void)setFirstColor:(id)a3
{
}

- (void)setLastColor:(id)a3
{
  NSUInteger v5 = [(NSArray *)[(TSDGradient *)self gradientStops] count] - 1;

  [(TSDMutableTransformGradient *)self setColorOfStopAtIndex:v5 toColor:a3];
}

- (void)setStartPoint:(CGPoint)a3 inShapeWithNaturalSize:(CGSize)a4
{
  -[TSDTransformGradient p_scalePoint:fromShapeWithNaturalSize:](self, "p_scalePoint:fromShapeWithNaturalSize:", a3.x, a3.y, a4.width, a4.height);

  -[TSDTransformGradient setStartPoint:](self, "setStartPoint:");
}

- (void)setEndPoint:(CGPoint)a3 inShapeWithNaturalSize:(CGSize)a4
{
  -[TSDTransformGradient p_scalePoint:fromShapeWithNaturalSize:](self, "p_scalePoint:fromShapeWithNaturalSize:", a3.x, a3.y, a4.width, a4.height);

  -[TSDTransformGradient setEndPoint:](self, "setEndPoint:");
}

- (void)upgradeIfNecessaryWithBaseNaturalSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  p_mTransformBeforeUpgrade = &self->super.mTransformBeforeUpgrade;
  long long v7 = *(_OWORD *)&self->super.mTransformBeforeUpgrade.c;
  *(_OWORD *)&v11.a = *(_OWORD *)&self->super.mTransformBeforeUpgrade.a;
  *(_OWORD *)&v11.c = v7;
  *(_OWORD *)&v11.tx = *(_OWORD *)&self->super.mTransformBeforeUpgrade.tx;
  CGAffineTransformInvert(&v12, &v11);
  long long v8 = *(_OWORD *)&v12.c;
  *(_OWORD *)&p_mTransformBeforeUpgrade->a = *(_OWORD *)&v12.a;
  *(_OWORD *)&p_mTransformBeforeUpgrade->c = v8;
  *(_OWORD *)&p_mTransformBeforeUpgrade->tx = *(_OWORD *)&v12.tx;
  -[TSDTransformGradient setBaseNaturalSize:](self, "setBaseNaturalSize:", height * p_mTransformBeforeUpgrade->c + p_mTransformBeforeUpgrade->a * width, height * p_mTransformBeforeUpgrade->d + p_mTransformBeforeUpgrade->b * width);
  uint64_t v9 = MEMORY[0x263F000D0];
  long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&p_mTransformBeforeUpgrade->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&p_mTransformBeforeUpgrade->c = v10;
  *(_OWORD *)&p_mTransformBeforeUpgrade->tx = *(_OWORD *)(v9 + 32);
}

- (void)setGradientAngleInDegrees:(double)a3
{
  p_mStart = &self->super.mStart;
  p_mEnd = &self->super.mEnd;
  double x = self->super.mStart.x;
  double y = self->super.mStart.y;
  double v8 = self->super.mEnd.x;
  double v9 = TSDMixPoints(x, y, v8, self->super.mEnd.y, 0.5);
  double v11 = v10;
  double v12 = TSDSubtractPoints(x, y, v8);
  double v14 = TSDPointLength(v12, v13);
  double v15 = TSDDeltaFromAngle(a3 * 0.0174532925);
  double v17 = TSDMultiplyPointScalar(-v15, v16, v14 * 0.5);
  p_mStart->double x = TSDAddPoints(v9, v11, v17);
  p_mStart->double y = v18;
  p_mEnd->double x = TSDSubtractPoints(v9, v11, v17);
  p_mEnd->double y = v19;
}

@end