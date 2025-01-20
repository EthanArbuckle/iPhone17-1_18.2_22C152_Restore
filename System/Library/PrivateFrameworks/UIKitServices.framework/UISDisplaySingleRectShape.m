@interface UISDisplaySingleRectShape
- (BOOL)isEqual:(id)a3;
- (CGRect)rect;
- (UISDisplaySingleRectShape)initWithRect:(CGRect)a3;
- (UISDisplaySingleRectShape)initWithXPCDictionary:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation UISDisplaySingleRectShape

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UISDisplaySingleRectShape;
  id v3 = a3;
  [(UISDisplayShape *)&v4 encodeWithXPCDictionary:v3];
  BSSerializeCGRectToXPCDictionaryWithKey();
}

- (UISDisplaySingleRectShape)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UISDisplaySingleRectShape;
  v5 = [(UISDisplayShape *)&v13 initWithXPCDictionary:v4];
  v6 = v5;
  if (v5)
  {
    p_rect = &v5->_rect;
    BSDeserializeCGRectFromXPCDictionaryWithKey();
    *(void *)&p_rect->origin.double x = v8;
    v6->_rect.origin.double y = v9;
    v6->_rect.size.double width = v10;
    v6->_rect.size.double height = v11;
  }

  return v6;
}

- (UISDisplaySingleRectShape)initWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)UISDisplaySingleRectShape;
  CGRect result = [(UISDisplaySingleRectShape *)&v8 init];
  if (result)
  {
    result->_rect.origin.CGFloat x = x;
    result->_rect.origin.CGFloat y = y;
    result->_rect.size.CGFloat width = width;
    result->_rect.size.CGFloat height = height;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UISDisplaySingleRectShape *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    BOOL v18 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(UISDisplaySingleRectShape *)self rect];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    [(UISDisplaySingleRectShape *)v5 rect];
    v21.origin.CGFloat x = v14;
    v21.origin.CGFloat y = v15;
    v21.size.CGFloat width = v16;
    v21.size.CGFloat height = v17;
    v20.origin.CGFloat x = v7;
    v20.origin.CGFloat y = v9;
    v20.size.CGFloat width = v11;
    v20.size.CGFloat height = v13;
    BOOL v18 = CGRectEqualToRect(v20, v21);
  }
  else
  {
LABEL_5:
    BOOL v18 = 0;
  }
LABEL_7:

  return v18;
}

- (unint64_t)hash
{
  int8x16_t v2 = veorq_s8((int8x16_t)vcvtq_s64_f64((float64x2_t)self->_rect.origin), (int8x16_t)vcvtq_s64_f64((float64x2_t)self->_rect.size));
  return (unint64_t)veor_s8(*(int8x8_t *)v2.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL));
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"single rect: {%g, %g, %g, %g}", *(void *)&self->_rect.origin.x, *(void *)&self->_rect.origin.y, *(void *)&self->_rect.size.width, *(void *)&self->_rect.size.height];
}

@end