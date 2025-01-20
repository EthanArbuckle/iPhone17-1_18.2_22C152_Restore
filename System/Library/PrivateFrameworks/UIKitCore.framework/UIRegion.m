@interface UIRegion
+ (UIRegion)infiniteRegion;
- (BOOL)containsPoint:(CGPoint)point;
- (PKRegion)_region;
- (UIBezierPath)path;
- (UIRegion)initWithCoder:(id)a3;
- (UIRegion)initWithPath:(id)a3;
- (UIRegion)initWithRadius:(CGFloat)radius;
- (UIRegion)initWithSize:(CGSize)size;
- (UIRegion)inverseRegion;
- (UIRegion)regionByDifferenceFromRegion:(UIRegion *)region;
- (UIRegion)regionByIntersectionWithRegion:(UIRegion *)region;
- (UIRegion)regionByUnionWithRegion:(UIRegion *)region;
- (id)copyWithZone:(_NSZone *)a3;
- (void)containsPoints:(const float *)a3 locationStride:(int64_t)a4 results:(char *)a5 resultsStride:(int64_t)a6 count:(int)a7;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIRegion

- (PKRegion)_region
{
  return self->_region;
}

- (UIBezierPath)path
{
  uint64_t v2 = [(PKRegion *)self->_region path];
  return +[UIBezierPath bezierPathWithCGPath:v2];
}

+ (UIRegion)infiniteRegion
{
  if (qword_1EB2603D0 != -1) {
    dispatch_once(&qword_1EB2603D0, &__block_literal_global_181);
  }
  uint64_t v2 = (void *)_MergedGlobals_1029;
  return (UIRegion *)v2;
}

void __26__UIRegion_infiniteRegion__block_invoke()
{
  v0 = objc_alloc_init(UIRegion);
  v1 = (void *)_MergedGlobals_1029;
  _MergedGlobals_1029 = (uint64_t)v0;

  uint64_t v2 = [MEMORY[0x1E4F91410] infiniteRegion];
  v3 = *(void **)(_MergedGlobals_1029 + 8);
  *(void *)(_MergedGlobals_1029 + 8) = v2;
}

- (UIRegion)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIRegion;
  v5 = [(UIRegion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"_region"];
    region = v5->_region;
    v5->_region = (PKRegion *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  region = self->_region;
  if (region) {
    [v5 encodeObject:region forKey:@"_region"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_region);
  return v4;
}

- (UIRegion)initWithRadius:(CGFloat)radius
{
  v11.receiver = self;
  v11.super_class = (Class)UIRegion;
  id v4 = [(UIRegion *)&v11 init];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F91410]);
    PKGet_PTM_RATIO();
    CGFloat v7 = v6 * radius;
    *(float *)&CGFloat v7 = v7;
    uint64_t v8 = [v5 initWithRadius:v7];
    region = v4->_region;
    v4->_region = (PKRegion *)v8;
  }
  return v4;
}

- (UIRegion)initWithSize:(CGSize)size
{
  double height = size.height;
  double width = size.width;
  v14.receiver = self;
  v14.super_class = (Class)UIRegion;
  id v5 = [(UIRegion *)&v14 init];
  if (v5)
  {
    PKGet_PTM_RATIO();
    float v7 = v6;
    int v8 = dyld_program_sdk_at_least();
    id v9 = objc_alloc(MEMORY[0x1E4F91410]);
    double v10 = v7;
    if (!v8) {
      double v10 = v7 * 0.5;
    }
    uint64_t v11 = objc_msgSend(v9, "initWithSize:", width * v10, height * v10);
    region = v5->_region;
    v5->_region = (PKRegion *)v11;
  }
  return v5;
}

- (UIRegion)initWithPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIRegion;
  id v5 = [(UIRegion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F91410]), "initWithPath:", objc_msgSend(v4, "CGPath"));
    region = v5->_region;
    v5->_region = (PKRegion *)v6;
  }
  return v5;
}

- (UIRegion)inverseRegion
{
  uint64_t v2 = (id *)[(UIRegion *)self copy];
  uint64_t v3 = [v2[1] inverseRegion];
  id v4 = v2[1];
  v2[1] = (id)v3;

  return (UIRegion *)v2;
}

- (UIRegion)regionByUnionWithRegion:(UIRegion *)region
{
  id v4 = region;
  id v5 = (id *)[(UIRegion *)self copy];
  uint64_t v6 = [v5[1] regionByUnionWithRegion:v4->_region];
  id v7 = v5[1];
  v5[1] = (id)v6;

  return (UIRegion *)v5;
}

- (UIRegion)regionByDifferenceFromRegion:(UIRegion *)region
{
  id v4 = region;
  id v5 = (id *)[(UIRegion *)self copy];
  uint64_t v6 = [v5[1] regionByDifferenceFromRegion:v4->_region];
  id v7 = v5[1];
  v5[1] = (id)v6;

  return (UIRegion *)v5;
}

- (UIRegion)regionByIntersectionWithRegion:(UIRegion *)region
{
  id v4 = region;
  id v5 = (id *)[(UIRegion *)self copy];
  uint64_t v6 = [v5[1] regionByIntersectionWithRegion:v4->_region];
  id v7 = v5[1];
  v5[1] = (id)v6;

  return (UIRegion *)v5;
}

- (BOOL)containsPoint:(CGPoint)point
{
  region = self->_region;
  if (region) {
    LOBYTE(region) = -[PKRegion containsPoint:](region, "containsPoint:", point.x, point.y);
  }
  return (char)region;
}

- (void)containsPoints:(const float *)a3 locationStride:(int64_t)a4 results:(char *)a5 resultsStride:(int64_t)a6 count:(int)a7
{
  if (a7 >= 1)
  {
    uint64_t v21 = v12;
    uint64_t v22 = v11;
    uint64_t v23 = v10;
    uint64_t v24 = v9;
    uint64_t v25 = v8;
    uint64_t v26 = v7;
    uint64_t v27 = v13;
    uint64_t v28 = v14;
    int v15 = a7;
    v20 = (float *)(a3 + 1);
    do
    {
      *a5 = -[UIRegion containsPoint:](self, "containsPoint:", *(v20 - 1), *v20, v21, v22, v23, v24, v25, v26, v27, v28);
      a5 += a6;
      v20 = (float *)((char *)v20 + a4);
      --v15;
    }
    while (v15);
  }
}

- (void).cxx_destruct
{
}

@end