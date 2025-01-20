@interface CRLMutablePencilKitInkStroke
- (CRLColor)color;
- (CRLStrokePattern)pattern;
- (double)actualWidth;
- (double)miterLimit;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)join;
- (void)setPatternPropertiesFromStroke:(id)a3;
- (void)setPropertiesFromStroke:(id)a3;
- (void)setWidth:(double)a3;
@end

@implementation CRLMutablePencilKitInkStroke

- (CRLColor)color
{
  return [(CRLStroke *)self i_color];
}

- (double)actualWidth
{
  [(CRLStroke *)self i_actualWidth];
  return result;
}

- (unint64_t)join
{
  return [(CRLStroke *)self i_join];
}

- (double)miterLimit
{
  [(CRLStroke *)self i_miterLimit];
  return result;
}

- (CRLStrokePattern)pattern
{
  return [(CRLStroke *)self i_pattern];
}

- (void)setWidth:(double)a3
{
  -[CRLStroke i_setWidth:](self, "i_setWidth:");

  [(CRLStroke *)self i_setActualWidth:a3];
}

- (void)setPropertiesFromStroke:(id)a3
{
}

- (void)setPatternPropertiesFromStroke:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CRLPencilKitInkStroke alloc];
  v5 = [(CRLPencilKitInkStroke *)self inkType];
  v6 = [(CRLMutablePencilKitInkStroke *)self color];
  [(CRLMutablePencilKitInkStroke *)self width];
  v7 = -[CRLPencilKitInkStroke initWithInkType:color:adjustedWidth:](v4, "initWithInkType:color:adjustedWidth:", v5, v6);

  return v7;
}

@end