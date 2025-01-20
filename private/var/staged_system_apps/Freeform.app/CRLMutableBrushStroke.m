@interface CRLMutableBrushStroke
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

@implementation CRLMutableBrushStroke

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
  v4 = [CRLBrushStroke alloc];
  v5 = [(CRLSmartStroke *)self strokeName];
  v6 = [(CRLMutableBrushStroke *)self color];
  [(CRLMutableBrushStroke *)self width];
  double v8 = v7;
  unint64_t v9 = [(CRLMutableBrushStroke *)self cap];
  unint64_t v10 = [(CRLMutableBrushStroke *)self join];
  v11 = [(CRLMutableBrushStroke *)self pattern];
  [(CRLMutableBrushStroke *)self miterLimit];
  v13 = [(CRLBrushStroke *)v4 initWithName:v5 color:v6 width:v9 cap:v10 join:v11 pattern:v8 miterLimit:v12];

  return v13;
}

@end