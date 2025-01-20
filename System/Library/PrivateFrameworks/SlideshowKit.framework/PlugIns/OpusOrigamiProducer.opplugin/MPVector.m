@interface MPVector
+ (id)vectorFromCGColor:(CGColor *)a3;
+ (id)vectorFromMCVector:(id *)a3;
+ (id)vectorFromString:(id)a3;
+ (id)vectorWithValues:(id)a3;
- ($421962E1114BB55FD51FACB03C2AC210)vector;
- (BOOL)isEqualTo:(id)a3;
- (CGColor)CGColor;
- (MPVector)init;
- (double)valueAtIndex:(int64_t)a3;
- (id)CIColorString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)string;
- (id)values;
- (int64_t)count;
- (void)setValues:(id)a3;
- (void)setVector:(id *)a3;
@end

@implementation MPVector

+ (id)vectorFromString:(id)a3
{
  id v4 = objc_alloc_init((Class)a1);
  MCStringToVector(a3, (uint64_t)v6);
  [v4 setVector:v6];
  return v4;
}

+ (id)vectorWithValues:(id)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [v4 setValues:a3];
  return v4;
}

+ (id)vectorFromCGColor:(CGColor *)a3
{
  id v4 = objc_alloc_init((Class)a1);
  Components = (float64x2_t *)CGColorGetComponents(a3);
  float32x4_t v6 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*Components), Components[1]);
  char v8 = 4;
  __int16 v9 = 0;
  char v10 = 0;
  float32x4_t v11 = v6;
  [v4 setVector:&v8];
  return v4;
}

- (MPVector)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPVector;
  return [(MPVector *)&v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setValues:", -[MPVector values](self, "values"));
  return v4;
}

- (double)valueAtIndex:(int64_t)a3
{
  return self->_vector[a3];
}

- (int64_t)count
{
  return self->_length;
}

- (id)string
{
  char v9 = 0;
  __int16 v8 = 0;
  float32x4_t v2 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)self->_vector), *(float64x2_t *)&self->_vector[2]);
  char length = self->_length;
  __int16 v5 = 0;
  char v6 = 0;
  float32x4_t v7 = v2;
  return (id)MCVectorToString((uint64_t)&length);
}

- (id)CIColorString
{
  switch(self->_length)
  {
    case 1:
      id result = +[NSString stringWithFormat:@"%f", *(void *)&self->_vector[0], v3, v4, v5];
      break;
    case 2:
      id result = +[NSString stringWithFormat:@"%f %f", *(void *)&self->_vector[0], *(void *)&self->_vector[1], v4, v5];
      break;
    case 3:
      id result = +[NSString stringWithFormat:@"%f %f %f", *(void *)&self->_vector[0], *(void *)&self->_vector[1], *(void *)&self->_vector[2], v5];
      break;
    case 4:
      id result = +[NSString stringWithFormat:@"%f %f %f %f", *(void *)&self->_vector[0], *(void *)&self->_vector[1], *(void *)&self->_vector[2], *(void *)&self->_vector[3]];
      break;
    default:
      id result = &stru_1AC850;
      break;
  }
  return result;
}

- (CGColor)CGColor
{
  return +[MPUtilities CGColorWithRed:self->_vector[0] green:self->_vector[1] blue:self->_vector[2] alpha:self->_vector[3]];
}

- (id)values
{
  int64_t length = self->_length;
  id v4 = +[NSMutableArray array];
  if ((unint64_t)(length - 1) <= 3)
  {
    vector = self->_vector;
    do
    {
      double v6 = *vector++;
      HIDWORD(v7) = HIDWORD(v6);
      *(float *)&double v7 = v6;
      objc_msgSend(v4, "addObject:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
      --length;
    }
    while (length);
  }
  return v4;
}

- (void)setValues:(id)a3
{
  id v5 = [a3 count];
  if ((uint64_t)v5 <= 4)
  {
    id v6 = v5;
    self->_int64_t length = (int64_t)v5;
    if ((uint64_t)v5 >= 1)
    {
      double v7 = 0;
      vector = self->_vector;
      do
      {
        objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v7), "floatValue");
        vector[(void)v7] = v9;
        double v7 = (char *)v7 + 1;
      }
      while (v6 != v7);
    }
  }
}

- (BOOL)isEqualTo:(id)a3
{
  return (objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(-[MPVector values](self, "values"), "isEqualToArray:", objc_msgSend(a3, "values")) & 1) != 0;
}

+ (id)vectorFromMCVector:(id *)a3
{
  id v4 = objc_alloc_init((Class)a1);
  $421962E1114BB55FD51FACB03C2AC210 v6 = *a3;
  [v4 setVector:&v6];
  return v4;
}

- (void)setVector:(id *)a3
{
  self->_int64_t length = a3->var0;
  float32x4_t v3 = *(float32x4_t *)a3->var1;
  *(float64x2_t *)&self->_vector[2] = vcvt_hight_f64_f32(v3);
  *(float64x2_t *)self->_vector = vcvtq_f64_f32(*(float32x2_t *)v3.f32);
}

- ($421962E1114BB55FD51FACB03C2AC210)vector
{
  retstr->var1[3] = 0.0;
  *(void *)&retstr->var0 = 0;
  *(void *)&retstr->var1[1] = 0;
  retstr->var0 = *(void *)&self[2].var0;
  *(float32x4_t *)retstr->var1 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->var1[1]), *(float64x2_t *)self[1].var1);
  return self;
}

@end