@interface FxVector
+ (id)vectorWithCIVector:(id)a3;
+ (id)vectorWithString:(id)a3;
+ (id)vectorWithValues:(const double *)a3 count:(unint64_t)a4;
+ (id)vectorWithX:(double)a3;
+ (id)vectorWithX:(double)a3 Y:(double)a4;
+ (id)vectorWithX:(double)a3 Y:(double)a4 Z:(double)a5;
+ (id)vectorWithX:(double)a3 Y:(double)a4 Z:(double)a5 W:(double)a6;
- (FxVector)init;
- (FxVector)initWithCIVector:(id)a3;
- (FxVector)initWithCoder:(id)a3;
- (FxVector)initWithString:(id)a3;
- (FxVector)initWithValues:(const double *)a3 count:(unint64_t)a4;
- (FxVector)initWithX:(double)a3;
- (FxVector)initWithX:(double)a3 Y:(double)a4;
- (FxVector)initWithX:(double)a3 Y:(double)a4 Z:(double)a5;
- (FxVector)initWithX:(double)a3 Y:(double)a4 Z:(double)a5 W:(double)a6;
- (double)W;
- (double)X;
- (double)Y;
- (double)Z;
- (double)valueAtIndex:(unint64_t)a3;
- (id)ciVector;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FxVector

+ (id)vectorWithValues:(const double *)a3 count:(unint64_t)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithValues:a3 count:a4];

  return v4;
}

- (FxVector)initWithCIVector:(id)a3
{
  uint64_t v5 = [a3 count];
  v6 = malloc_type_malloc(8 * v5, 0x100004000313F17uLL);
  if (v6)
  {
    v7 = v6;
    if (v5)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        [a3 valueAtIndex:i];
        v7[i] = v9;
      }
    }
    v10 = [(FxVector *)self initWithValues:v7 count:v5];
    free(v7);
    return v10;
  }
  else
  {

    return 0;
  }
}

+ (id)vectorWithCIVector:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCIVector:a3];

  return v3;
}

+ (id)vectorWithX:(double)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithX:a3];

  return v3;
}

+ (id)vectorWithX:(double)a3 Y:(double)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithX:a3 Y:a4];

  return v4;
}

+ (id)vectorWithX:(double)a3 Y:(double)a4 Z:(double)a5
{
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithX:a3 Y:a4 Z:a5];

  return v5;
}

+ (id)vectorWithX:(double)a3 Y:(double)a4 Z:(double)a5 W:(double)a6
{
  v6 = (void *)[objc_alloc((Class)a1) initWithX:a3 Y:a4 Z:a5 W:a6];

  return v6;
}

+ (id)vectorWithString:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithString:a3];

  return v3;
}

- (FxVector)init
{
  return [(FxVector *)self initWithValues:0 count:0];
}

- (FxVector)initWithX:(double)a3
{
  double v4 = a3;
  return [(FxVector *)self initWithValues:&v4 count:1];
}

- (FxVector)initWithX:(double)a3 Y:(double)a4
{
  v5[2] = *MEMORY[0x1E4F143B8];
  *(double *)uint64_t v5 = a3;
  *(double *)&v5[1] = a4;
  return [(FxVector *)self initWithValues:v5 count:2];
}

- (FxVector)initWithX:(double)a3 Y:(double)a4 Z:(double)a5
{
  v6[3] = *MEMORY[0x1E4F143B8];
  *(double *)v6 = a3;
  *(double *)&v6[1] = a4;
  *(double *)&v6[2] = a5;
  return [(FxVector *)self initWithValues:v6 count:3];
}

- (FxVector)initWithX:(double)a3 Y:(double)a4 Z:(double)a5 W:(double)a6
{
  v7[4] = *MEMORY[0x1E4F143B8];
  *(double *)v7 = a3;
  *(double *)&v7[1] = a4;
  *(double *)&v7[2] = a5;
  *(double *)&v7[3] = a6;
  return [(FxVector *)self initWithValues:v7 count:4];
}

- (FxVector)initWithValues:(const double *)a3 count:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)FxVector;
  v6 = [(FxVector *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_count = a4;
    if (a4 > 4)
    {
      uint64_t v9 = (double *)malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
      v7->_u.ptr = v9;
      if (v9)
      {
        uint64_t v10 = 0;
        do
        {
          v7->_u.ptr[v10] = a3[v10];
          ++v10;
        }
        while (a4 != v10);
      }
      else
      {

        return 0;
      }
    }
    else
    {
      if (!a4) {
        goto LABEL_7;
      }
      uint64_t v8 = 0;
      do
      {
        v6->_u.vec[v8] = a3[v8];
        ++v8;
      }
      while (a4 != v8);
      if (a4 <= 3) {
LABEL_7:
      }
        bzero(&v6->_u.vec[a4], 32 - 8 * a4);
    }
  }
  return v7;
}

- (FxVector)initWithString:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v4 = (const char *)[a3 UTF8String];
  if (!v4)
  {
    return [(FxVector *)self init];
  }
  v18 = 0;
  if (*v4 == 91) {
    uint64_t v5 = v4 + 1;
  }
  else {
    uint64_t v5 = v4;
  }
  double v6 = strtod(v5, &v18);
  v7 = v18;
  if (v18 == v5) {
    return -[FxVector initWithValues:count:](self, "initWithValues:count:", v19, 0, v6);
  }
  double v8 = v6;
  uint64_t v9 = 0;
  int v10 = 32;
  v11 = (double *)v19;
  while (v9 != v10)
  {
    v13 = v11;
LABEL_13:
    unsigned int v14 = v9 + 1;
    v13[v9] = v8;
    double v8 = strtod(v7, &v18);
    ++v9;
    BOOL v15 = v18 == v7;
    v7 = v18;
    if (v15) {
      goto LABEL_21;
    }
  }
  objc_super v12 = (double *)malloc_type_malloc(16 * v10, 0x31FFBBE5uLL);
  if (v12)
  {
    v13 = v12;
    memcpy(v12, v11, 8 * v10);
    if (v11 != (double *)v19) {
      free(v11);
    }
    v10 *= 2;
    v7 = v18;
    v11 = v13;
    goto LABEL_13;
  }
  v13 = v11;
  unsigned int v14 = v9;
LABEL_21:
  v17 = -[FxVector initWithValues:count:](self, "initWithValues:count:", v13, v14, v18);
  if (v13 != (double *)v19) {
    free(v13);
  }
  return v17;
}

- (void)dealloc
{
  if (self->_count >= 5) {
    free(self->_u.ptr);
  }
  v3.receiver = self;
  v3.super_class = (Class)FxVector;
  [(FxVector *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t count = self->_count;
  uint64_t v5 = +[FxVector allocWithZone:a3];
  if (count > 4) {
    ptr = ($88552A8D2734CBBEDCC5ADBDCF1D9580 *)self->_u.ptr;
  }
  else {
    ptr = &self->_u;
  }
  unint64_t v7 = self->_count;

  return [(FxVector *)v5 initWithValues:ptr count:v7];
}

- (FxVector)initWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([a3 containsValueForKey:@"CICount"])
  {
    LODWORD(v5) = [a3 decodeIntForKey:@"CICount"];
    if (([a3 containsValueForKey:@"FxVector"] & 1) == 0)
    {
      uint64_t v5 = (int)v5;
      if (v5 >= 0x41)
      {
        double v6 = malloc_type_malloc(8 * (int)v5, 0x100004000313F17uLL);
        if (!v6)
        {

          return 0;
        }
      }
      else
      {
        double v6 = v11;
      }
      if (!v5)
      {
        uint64_t v5 = 0;
        return [(FxVector *)self initWithValues:v6 count:v5];
      }
LABEL_9:
      for (uint64_t i = 0; i != v5; ++i)
      {
        double v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"CI_%ld", i);
        [a3 decodeFloatForKey:v8];
        *(double *)&v6[8 * i] = v9;
      }
      return [(FxVector *)self initWithValues:v6 count:v5];
    }
  }
  else if (([a3 containsValueForKey:@"FxVector"] & 1) == 0)
  {
    double v6 = v11;
    uint64_t v5 = 4;
    goto LABEL_9;
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt:LODWORD(self->_count) forKey:@"CICount"];
  if (self->_count >= 5)
  {
    unint64_t v5 = 0;
    do
    {
      double v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"CI_%ld", v5);
      double v7 = self->_u.ptr[v5];
      *(float *)&double v7 = v7;
      [a3 encodeFloat:v6 forKey:v7];

      ++v5;
    }
    while (v5 < self->_count);
  }
}

- (unint64_t)count
{
  return self->_count;
}

- (double)valueAtIndex:(unint64_t)a3
{
  unint64_t count = self->_count;
  double result = 0.0;
  if (count > a3)
  {
    p_u = &self->_u;
    if (count > 4) {
      double v6 = &p_u->ptr[a3];
    }
    else {
      double v6 = &p_u->vec[a3];
    }
    return *v6;
  }
  return result;
}

- (double)X
{
  p_u = &self->_u;
  if (self->_count >= 5) {
    p_u = ($88552A8D2734CBBEDCC5ADBDCF1D9580 *)p_u->ptr;
  }
  return p_u->vec[0];
}

- (double)Y
{
  if (self->_count > 4) {
    v2 = self->_u.ptr + 1;
  }
  else {
    v2 = &self->_u.vec[1];
  }
  return *v2;
}

- (double)Z
{
  if (self->_count > 4) {
    v2 = self->_u.ptr + 2;
  }
  else {
    v2 = &self->_u.vec[2];
  }
  return *v2;
}

- (double)W
{
  if (self->_count > 4) {
    v2 = self->_u.ptr + 3;
  }
  else {
    v2 = &self->_u.vec[3];
  }
  return *v2;
}

- (id)ciVector
{
  return 0;
}

@end