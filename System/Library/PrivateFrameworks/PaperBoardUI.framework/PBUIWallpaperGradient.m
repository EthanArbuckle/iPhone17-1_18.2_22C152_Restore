@interface PBUIWallpaperGradient
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGGradient)copyCGGradient;
- (CGPoint)endPoint;
- (CGPoint)startPoint;
- (NSArray)colors;
- (NSArray)locations;
- (NSString)description;
- (NSString)type;
- (PBUIWallpaperGradient)init;
- (PBUIWallpaperGradient)initWithCoder:(id)a3;
- (id)cgColors;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)configureLayer:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setColors:(id)a3;
- (void)setEndPoint:(CGPoint)a3;
- (void)setLocations:(id)a3;
- (void)setStartPoint:(CGPoint)a3;
- (void)setType:(id)a3;
@end

@implementation PBUIWallpaperGradient

- (PBUIWallpaperGradient)init
{
  v7.receiver = self;
  v7.super_class = (Class)PBUIWallpaperGradient;
  v2 = [(PBUIWallpaperGradient *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_startPoint = (CGPoint)xmmword_1BC53F1A0;
    v2->_endPoint = (CGPoint)xmmword_1BC53F1B0;
    uint64_t v4 = [(id)*MEMORY[0x1E4F3A390] copy];
    type = v3->_type;
    v3->_type = (NSString *)v4;
  }
  return v3;
}

- (id)cgColors
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(PBUIWallpaperGradient *)self colors];
  uint64_t v4 = v3;
  if (v3)
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFIndex v6 = [v3 count];
    Mutable = CFArrayCreateMutable(v5, v6, MEMORY[0x1E4F1D510]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = [(PBUIWallpaperGradient *)self colors];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          CFArrayAppendValue(Mutable, (const void *)[*(id *)(*((void *)&v14 + 1) + 8 * i) CGColor]);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

- (void)configureLayer:(id)a3
{
  id v4 = a3;
  CFAllocatorRef v5 = [(PBUIWallpaperGradient *)self cgColors];
  [v4 setColors:v5];

  CFIndex v6 = [(PBUIWallpaperGradient *)self locations];
  [v4 setLocations:v6];

  [(PBUIWallpaperGradient *)self startPoint];
  objc_msgSend(v4, "setStartPoint:");
  [(PBUIWallpaperGradient *)self endPoint];
  objc_msgSend(v4, "setEndPoint:");
  id v7 = [(PBUIWallpaperGradient *)self type];
  [v4 setType:v7];
}

- (CGGradient)copyCGGradient
{
  v3 = [(PBUIWallpaperGradient *)self locations];
  size_t v4 = [v3 count];
  if (v4)
  {
    CFAllocatorRef v5 = (CGFloat *)malloc_type_calloc(v4, 8uLL, 0x100004000313F17uLL);
    CFIndex v6 = v5;
    if (v5)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __39__PBUIWallpaperGradient_copyCGGradient__block_invoke;
      v10[3] = &__block_descriptor_40_e25_v32__0__NSNumber_8Q16_B24l;
      v10[4] = v5;
      [v3 enumerateObjectsUsingBlock:v10];
    }
  }
  else
  {
    CFIndex v6 = 0;
  }
  CFArrayRef v7 = [(PBUIWallpaperGradient *)self cgColors];
  v8 = CGGradientCreateWithColors(0, v7, v6);

  free(v6);
  return v8;
}

uint64_t __39__PBUIWallpaperGradient_copyCGGradient__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 doubleValue];
  *(void *)(*(void *)(a1 + 32) + 8 * a3) = v6;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  size_t v4 = (PBUIWallpaperGradient *)a3;
  if (self == v4)
  {
    char v19 = 1;
  }
  else
  {
    CFAllocatorRef v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      CFArrayRef v7 = v4;
      v8 = [(PBUIWallpaperGradient *)self colors];
      uint64_t v9 = [(PBUIWallpaperGradient *)v7 colors];
      int v10 = BSEqualObjects();

      if (v10
        && ([(PBUIWallpaperGradient *)self locations],
            uint64_t v11 = objc_claimAutoreleasedReturnValue(),
            [(PBUIWallpaperGradient *)v7 locations],
            v12 = objc_claimAutoreleasedReturnValue(),
            int v13 = BSEqualObjects(),
            v12,
            v11,
            v13))
      {
        [(PBUIWallpaperGradient *)self startPoint];
        double v15 = v14;
        double v17 = v16;
        [(PBUIWallpaperGradient *)v7 startPoint];
        char v19 = 0;
        if (v15 == v20 && v17 == v18)
        {
          [(PBUIWallpaperGradient *)self endPoint];
          double v22 = v21;
          double v24 = v23;
          [(PBUIWallpaperGradient *)v7 endPoint];
          char v19 = 0;
          if (v22 == v26 && v24 == v25)
          {
            v27 = [(PBUIWallpaperGradient *)self type];
            v28 = [(PBUIWallpaperGradient *)v7 type];
            char v19 = BSEqualObjects();
          }
        }
      }
      else
      {
        char v19 = 0;
      }
    }
    else
    {
      char v19 = 0;
    }
  }

  return v19;
}

- (unint64_t)hash
{
  v3 = [(PBUIWallpaperGradient *)self colors];
  uint64_t v4 = [v3 hash];
  CFAllocatorRef v5 = [(PBUIWallpaperGradient *)self locations];
  uint64_t v6 = [v5 hash] + v4;
  CFArrayRef v7 = [(PBUIWallpaperGradient *)self type];
  unint64_t v8 = v6 + [v7 hash];

  return v8;
}

- (NSString)description
{
  return (NSString *)[(PBUIWallpaperGradient *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  CFAllocatorRef v5 = [(PBUIWallpaperGradient *)self colors];
  [v4 setColors:v5];

  uint64_t v6 = [(PBUIWallpaperGradient *)self locations];
  [v4 setLocations:v6];

  [(PBUIWallpaperGradient *)self startPoint];
  objc_msgSend(v4, "setStartPoint:");
  [(PBUIWallpaperGradient *)self endPoint];
  objc_msgSend(v4, "setEndPoint:");
  CFArrayRef v7 = [(PBUIWallpaperGradient *)self type];
  [v4 setType:v7];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  CFAllocatorRef v5 = [(PBUIWallpaperGradient *)self colors];
  [v4 encodeObject:v5 forKey:@"colors"];

  uint64_t v6 = [(PBUIWallpaperGradient *)self locations];
  [v4 encodeObject:v6 forKey:@"locations"];

  [(PBUIWallpaperGradient *)self startPoint];
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"startPoint");
  [(PBUIWallpaperGradient *)self endPoint];
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"endPoint");
  id v7 = [(PBUIWallpaperGradient *)self type];
  [v4 encodeObject:v7 forKey:@"type"];
}

- (PBUIWallpaperGradient)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PBUIWallpaperGradient;
  CFAllocatorRef v5 = [(PBUIWallpaperGradient *)&v26 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    id v7 = self;
    unint64_t v8 = self;
    uint64_t v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"colors"];
    colors = v5->_colors;
    v5->_colors = (NSArray *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    int v13 = self;
    double v14 = self;
    double v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"locations"];
    locations = v5->_locations;
    v5->_locations = (NSArray *)v16;

    [v4 decodeCGPointForKey:@"startPoint"];
    v5->_startPoint.x = v18;
    v5->_startPoint.y = v19;
    [v4 decodeCGPointForKey:@"endPoint"];
    v5->_endPoint.x = v20;
    v5->_endPoint.y = v21;
    double v22 = self;
    uint64_t v23 = [v4 decodeObjectOfClass:v22 forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v23;
  }
  return v5;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(PBUIWallpaperGradient *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  CFAllocatorRef v5 = [(PBUIWallpaperGradient *)self colors];
  id v6 = (id)[v4 appendObject:v5 withName:@"colors"];

  id v7 = [(PBUIWallpaperGradient *)self locations];
  id v8 = (id)[v4 appendObject:v7 withName:@"locations"];

  [(PBUIWallpaperGradient *)self startPoint];
  id v9 = (id)objc_msgSend(v4, "appendPoint:withName:", @"startPoint");
  [(PBUIWallpaperGradient *)self endPoint];
  id v10 = (id)objc_msgSend(v4, "appendPoint:withName:", @"endPoint");
  uint64_t v11 = [(PBUIWallpaperGradient *)self type];
  id v12 = (id)[v4 appendObject:v11 withName:@"type"];

  return v4;
}

- (id)succinctDescription
{
  v2 = [(PBUIWallpaperGradient *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (NSArray)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
}

- (NSArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
}

- (CGPoint)startPoint
{
  double x = self->_startPoint.x;
  double y = self->_startPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartPoint:(CGPoint)a3
{
  self->_startPoint = a3;
}

- (CGPoint)endPoint
{
  double x = self->_endPoint.x;
  double y = self->_endPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setEndPoint:(CGPoint)a3
{
  self->_endPoint = a3;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

@end