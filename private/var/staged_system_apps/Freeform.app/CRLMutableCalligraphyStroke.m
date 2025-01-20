@interface CRLMutableCalligraphyStroke
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

@implementation CRLMutableCalligraphyStroke

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
  v4 = +[CRLCalligraphyStroke allocWithZone:a3];
  v5 = [(CRLMutableCalligraphyStroke *)self color];
  [(CRLMutableCalligraphyStroke *)self width];
  double v7 = v6;
  unint64_t v8 = [(CRLMutableCalligraphyStroke *)self cap];
  unint64_t v9 = [(CRLMutableCalligraphyStroke *)self join];
  v10 = [(CRLMutableCalligraphyStroke *)self pattern];
  [(CRLMutableCalligraphyStroke *)self miterLimit];
  v12 = [(CRLCalligraphyStroke *)v4 initWithColor:v5 width:v8 cap:v9 join:v10 pattern:v7 miterLimit:v11];

  return v12;
}

@end