@interface CRLMutableStroke
+ (id)emptyStroke;
+ (id)stroke;
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

@implementation CRLMutableStroke

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

+ (id)stroke
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CRLMutableStroke;
  id v2 = [super i_newStroke];

  return v2;
}

+ (id)emptyStroke
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CRLMutableStroke;
  id v2 = [super i_newEmptyStroke];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = [CRLStroke alloc];
  v5 = [(CRLMutableStroke *)self color];
  [(CRLMutableStroke *)self width];
  double v7 = v6;
  unint64_t v8 = [(CRLMutableStroke *)self cap];
  unint64_t v9 = [(CRLMutableStroke *)self join];
  v10 = [(CRLMutableStroke *)self pattern];
  [(CRLMutableStroke *)self miterLimit];
  v12 = [(CRLStroke *)v4 initWithColor:v5 width:v8 cap:v9 join:v10 pattern:v7 miterLimit:v11];

  [(CRLMutableStroke *)self actualWidth];
  -[CRLStroke i_setActualWidth:](v12, "i_setActualWidth:");
  return v12;
}

@end