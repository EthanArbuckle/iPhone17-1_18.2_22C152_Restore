@interface CMDiagramContinuousArrowMapper
- (CGSize)sizeForNode:(id)a3;
- (id)_suggestedBoundsForNodeAtIndex:(int64_t)a3;
- (id)fill;
- (id)stroke;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapChildrenAt:(id)a3 withState:(id)a4;
@end

@implementation CMDiagramContinuousArrowMapper

- (id)fill
{
  v2 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
  v3 = [v2 children];

  if ([v3 count])
  {
    v4 = [v3 objectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v4 shapeProperties];
      v6 = [v5 fill];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)stroke
{
  v2 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
  v3 = [v2 children];

  if ([v3 count])
  {
    v4 = [v3 objectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v4 shapeProperties];
      v6 = [v5 stroke];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [(CMDiagramShapeMapper *)self setDefaultFonSize];
  v7 = [MEMORY[0x263F08680] transform];
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  double v9 = v8;
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  objc_msgSend(v7, "translateXBy:yBy:", v9);
  [(CMDrawingContext *)self->super.super.mDrawingContext addTransform:v7];
  [(CMDiagramContinuousArrowMapper *)self mapChildrenAt:v10 withState:v6];
  [(CMDrawingContext *)self->super.super.mDrawingContext restoreLastTransform];
}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  v7 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
  double v8 = [v7 children];

  uint64_t v9 = [v8 count];
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      v11 = [v8 objectAtIndex:i];
      v12 = [(CMDiagramContinuousArrowMapper *)self _suggestedBoundsForNodeAtIndex:i];
      v13 = [(CMDiagramPointMapper *)[CMDiagramPointContinuousArrowMapper alloc] initWithPoint:v11 drawingContext:self->super.super.mDrawingContext orientedBounds:v12 parent:self];
      [(CMDiagramPointContinuousArrowMapper *)v13 mapAt:v22 withState:v6];
    }
  }
  v21 = [(CMDiagramContinuousArrowMapper *)self _suggestedBoundsForNodeAtIndex:-1];
  v14 = [(CMDiagramContinuousArrowMapper *)self fill];
  v15 = [(CMDiagramContinuousArrowMapper *)self stroke];
  v16 = NSDictionary;
  double v17 = (double)(self->super.mChildCount + 1) * 100000.0 / (double)(self->super.mChildCount + 2);
  *(float *)&double v17 = v17;
  v18 = [NSNumber numberWithFloat:v17];
  v19 = [NSNumber numberWithInt:0];
  v20 = [v16 dictionaryWithObject:v18 forKey:v19];
  +[CMShapeRenderer renderCanonicalShape:13 fill:v14 stroke:v15 adjustValues:v20 orientedBounds:v21 state:v6 drawingContext:self->super.super.mDrawingContext];
}

- (id)_suggestedBoundsForNodeAtIndex:(int64_t)a3
{
  if (a3 < 0)
  {
    double v3 = 1.0;
    double v4 = 0.0;
    double v6 = 0.0;
    double v5 = 1.0;
  }
  else
  {
    double v3 = 1.0 / ((double)self->super.mChildCount + 0.5);
    double v4 = v3 * (double)a3;
    double v5 = 0.666666667;
    double v6 = 0.166666667;
  }
  return +[CMShapeUtils internalBoundsWithBounds:scaleBounds:](CMShapeUtils, "internalBoundsWithBounds:scaleBounds:", self->super.super.super.mOrientedBounds, v4, v6, v3, v5);
}

- (CGSize)sizeForNode:(id)a3
{
  double v3 = [(CMDiagramContinuousArrowMapper *)self _suggestedBoundsForNodeAtIndex:0];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

@end