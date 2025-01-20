@interface SUGradient
+ (BOOL)supportsSecureCoding;
+ (SUGradient)gradientWithColor:(id)a3;
- (CGGradient)copyCGGradient;
- (CGShading)copyShading;
- (NSArray)colorStopColors;
- (NSArray)colorStopOffsets;
- (SUGradient)initWithCoder:(id)a3;
- (SUGradient)initWithPoint0:(SUGradientPoint *)a3 point1:(SUGradientPoint *)a4 type:(int64_t)a5;
- (SUGradient)initWithPropertyList:(id)a3;
- (SUGradient)initWithType:(int64_t)a3;
- (SUGradientPoint)p0;
- (SUGradientPoint)p1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)newPatternColorWithSize:(CGSize)a3 opaque:(BOOL)a4;
- (int64_t)gradientType;
- (int64_t)numberOfColorStops;
- (void)addColorStopWithOffset:(double)a3 color:(CGColor *)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SUGradient

- (SUGradient)initWithPoint0:(SUGradientPoint *)a3 point1:(SUGradientPoint *)a4 type:(int64_t)a5
{
  double v12 = v10;
  CGFloat v13 = v9;
  CGFloat v14 = v8;
  double v15 = v7;
  CGFloat v16 = v6;
  CGFloat v17 = v5;
  v20.receiver = self;
  v20.super_class = (Class)SUGradient;
  v18 = [(SUGradient *)&v20 init];
  if (v18)
  {
    v18->_lock = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    v18->_p0.point.x = v17;
    v18->_p0.point.y = v16;
    v18->_p0.radius = v15;
    v18->_p1.point.x = v14;
    v18->_p1.point.y = v13;
    v18->_p1.radius = v12;
    v18->_type = (int64_t)a3;
  }
  return v18;
}

- (SUGradient)initWithPropertyList:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  double v6 = (void *)[a3 objectForKey:@"top-color"];
  uint64_t v7 = [objc_alloc(MEMORY[0x263F1C550]) initWithStyleString:v6];
  if (v7)
  {
    double v8 = (void *)v7;
    [v5 addObject:v7];
  }
  uint64_t v9 = [a3 objectForKey:@"bottom-color"];
  if (v9)
  {
    uint64_t v10 = v9;
    if (([v6 isEqualToString:v9] & 1) == 0)
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x263F1C550]) initWithStyleString:v10];
      if (v11)
      {
        double v12 = (void *)v11;
        [v5 addObject:v11];
      }
    }
  }
  if ([v5 count])
  {
    CGFloat v13 = [(SUGradient *)self initWithType:0];
    uint64_t v14 = [v5 count];
    if (v14 >= 1)
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0;
      double v17 = (double)v14 + -1.0;
      do
      {
        -[SUGradient addColorStopWithOffset:color:](v13, "addColorStopWithOffset:color:", objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v16), "CGColor"), (double)v16 / v17);
        ++v16;
      }
      while (v15 != v16);
    }
  }
  else
  {

    CGFloat v13 = 0;
  }

  return v13;
}

- (SUGradient)initWithType:(int64_t)a3
{
  if (a3 == 1)
  {
    double v3 = 0.5;
    double v4 = 0.5;
    double v5 = 0.5;
    double v6 = 1.0;
  }
  else
  {
    double v3 = 0.0;
    double v4 = 0.5;
    double v5 = 1.0;
    double v6 = 0.0;
  }
  return -[SUGradient initWithPoint0:point1:type:](self, "initWithPoint0:point1:type:", 0.5, v3, 0.0, v4, v5, v6);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUGradient;
  [(SUGradient *)&v3 dealloc];
}

+ (SUGradient)gradientWithColor:(id)a3
{
  double v4 = (void *)[objc_alloc((Class)a1) initWithType:0];
  objc_msgSend(v4, "addColorStopWithOffset:color:", objc_msgSend(a3, "CGColor"), 0.0);

  return (SUGradient *)v4;
}

- (SUGradient)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)SUGradient;
  double v4 = [(SUGradient *)&v13 init];
  if (v4)
  {
    double v5 = (void *)MEMORY[0x263EFFA08];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v4->_colorStops = (NSMutableArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v14, 2)), @"colorstops");
    [a3 decodeCGPointForKey:@"point0"];
    v4->_p0.point.x = v6;
    v4->_p0.point.y = v7;
    [a3 decodeFloatForKey:@"radius0"];
    v4->_p0.radius = v8;
    [a3 decodeCGPointForKey:@"point1"];
    v4->_p1.point.x = v9;
    v4->_p1.point.y = v10;
    [a3 decodeFloatForKey:@"radius1"];
    v4->_p1.radius = v11;
    v4->_type = [a3 decodeIntegerForKey:@"type"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [(NSLock *)self->_lock lock];
  [a3 encodeObject:self->_colorStops forKey:@"colorstops"];
  objc_msgSend(a3, "encodeCGPoint:forKey:", @"point0", self->_p0.point.x, self->_p0.point.y);
  double radius = self->_p0.radius;
  *(float *)&double radius = radius;
  [a3 encodeFloat:@"radius0" forKey:radius];
  objc_msgSend(a3, "encodeCGPoint:forKey:", @"point1", self->_p1.point.x, self->_p1.point.y);
  double v6 = self->_p1.radius;
  *(float *)&double v6 = v6;
  [a3 encodeFloat:@"radius1" forKey:v6];
  [a3 encodeInteger:self->_type forKey:@"type"];
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(NSLock *)self->_lock lock];
  *(void *)(v5 + 8) = [(NSMutableArray *)self->_colorStops copyWithZone:a3];
  double radius = self->_p0.radius;
  *(CGPoint *)(v5 + 24) = self->_p0.point;
  *(double *)(v5 + 40) = radius;
  CGPoint point = self->_p1.point;
  *(double *)(v5 + 64) = self->_p1.radius;
  *(CGPoint *)(v5 + 48) = point;
  *(unsigned char *)(v5 + 72) = self->_sorted;
  *(void *)(v5 + 80) = self->_type;
  [(NSLock *)self->_lock unlock];
  return (id)v5;
}

- (void)addColorStopWithOffset:(double)a3 color:(CGColor *)a4
{
  [(NSLock *)self->_lock lock];
  if (!self->_colorStops) {
    self->_colorStops = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  CGFloat v7 = [[SUGradientColorStop alloc] initWithColor:a4 offset:a3];
  [(NSMutableArray *)self->_colorStops addObject:v7];

  self->_sorted = 0;
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (NSArray)colorStopColors
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v3 = (NSArray *)[MEMORY[0x263EFF980] array];
  [(NSLock *)self->_lock lock];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  colorStops = self->_colorStops;
  uint64_t v5 = [(NSMutableArray *)colorStops countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(colorStops);
        }
        CGFloat v9 = (CGColor *)[*(id *)(*((void *)&v11 + 1) + 8 * i) copyCGColor];
        [(NSArray *)v3 addObject:v9];
        CGColorRelease(v9);
      }
      uint64_t v6 = [(NSMutableArray *)colorStops countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (NSArray)colorStopOffsets
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = (NSArray *)[MEMORY[0x263EFF980] array];
  [(NSLock *)self->_lock lock];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  colorStops = self->_colorStops;
  uint64_t v5 = [(NSMutableArray *)colorStops countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(colorStops);
        }
        CGFloat v9 = NSNumber;
        [*(id *)(*((void *)&v12 + 1) + 8 * i) offset];
        *(float *)&double v10 = v10;
        -[NSArray addObject:](v3, "addObject:", [v9 numberWithFloat:v10]);
      }
      uint64_t v6 = [(NSMutableArray *)colorStops countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (CGGradient)copyCGGradient
{
  [(NSLock *)self->_lock lock];
  uint64_t v3 = [(NSMutableArray *)self->_colorStops count];
  if (v3 >= 1 && (v4 = v3, (uint64_t v5 = (CGFloat *)malloc_type_malloc(8 * v3, 0x100004000313F17uLL)) != 0))
  {
    uint64_t v6 = v5;
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v4];
    for (uint64_t i = 0; i != v4; ++i)
    {
      CGFloat v9 = (void *)[(NSMutableArray *)self->_colorStops objectAtIndex:i];
      double v10 = (CGColor *)[v9 copyCGColor];
      [v7 addObject:v10];
      CGColorRelease(v10);
      [v9 offset];
      v6[i] = v11;
    }
    long long v12 = CGGradientCreateWithColors(0, (CFArrayRef)v7, v6);

    free(v6);
  }
  else
  {
    long long v12 = 0;
  }
  [(NSLock *)self->_lock unlock];
  return v12;
}

- (CGShading)copyShading
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (!DeviceRGB) {
    return 0;
  }
  uint64_t v4 = DeviceRGB;
  [(NSLock *)self->_lock lock];
  if (!self->_sorted)
  {
    [(NSMutableArray *)self->_colorStops sortUsingSelector:sel_compare_];
    self->_sorted = 1;
  }
  uint64_t v5 = (void *)[(NSMutableArray *)self->_colorStops copy];
  [(NSLock *)self->_lock unlock];
  *(_OWORD *)domain = xmmword_2279241C0;
  range[0] = 0.0;
  uint64_t v14 = 0;
  uint64_t v16 = 0;
  range[1] = 1.0;
  uint64_t v15 = 0x3FF0000000000000;
  uint64_t v17 = 0x3FF0000000000000;
  uint64_t v18 = 0;
  uint64_t v19 = 0x3FF0000000000000;
  CGFunctionCallbacks v12 = *(CGFunctionCallbacks *)byte_26DB86060;
  uint64_t v6 = CGFunctionCreate(v5, 1uLL, domain, 4uLL, range, &v12);
  CGFloat x = self->_p0.point.x;
  CGFloat y = self->_p0.point.y;
  if (self->_type) {
    CGShadingRef Radial = CGShadingCreateRadial(v4, *(CGPoint *)&x, self->_p0.radius, self->_p1.point, self->_p1.radius, v6, 1, 1);
  }
  else {
    CGShadingRef Radial = CGShadingCreateAxial(v4, *(CGPoint *)&x, self->_p1.point, v6, 1, 1);
  }
  double v10 = Radial;
  CGFunctionRelease(v6);
  CGColorSpaceRelease(v4);
  return v10;
}

- (int64_t)gradientType
{
  return self->_type;
}

- (id)newPatternColorWithSize:(CGSize)a3 opaque:(BOOL)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if ([(SUGradient *)self gradientType]) {
    return 0;
  }
  CGFloat v9 = [(SUGradient *)self copyCGGradient];
  if (!v9) {
    return 0;
  }
  double v10 = v9;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale");
  CGFloat v12 = v11;
  v21.CGFloat width = width;
  v21.CGFloat height = height;
  UIGraphicsBeginImageContextWithOptions(v21, a4, v12);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, width, height);
  [(SUGradient *)self p0];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [(SUGradient *)self p1];
  v23.CGFloat x = v18;
  v23.CGFloat y = v19;
  v22.CGFloat x = v15;
  v22.CGFloat y = v17;
  CGContextDrawLinearGradient(CurrentContext, v10, v22, v23, 3u);
  float v8 = (void *)[objc_alloc(MEMORY[0x263F1C550]) initWithPatternImage:UIGraphicsGetImageFromCurrentImageContext()];
  if (v8)
  {
    objc_setAssociatedObject(v8, "com.apple.iTunesStoreUI.SUGradient.iscolor", (id)[NSNumber numberWithBool:1], (void *)1);
    objc_setAssociatedObject(v8, "com.apple.iTunesStoreUI.SUGradient.size", (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", width, height), (void *)1);
  }
  UIGraphicsEndImageContext();
  CGGradientRelease(v10);
  return v8;
}

- (int64_t)numberOfColorStops
{
  [(NSLock *)self->_lock lock];
  int64_t v3 = [(NSMutableArray *)self->_colorStops count];
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (SUGradientPoint)p0
{
  return self;
}

- (SUGradientPoint)p1
{
  return self;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)SUGradient;
  return (id)[NSString stringWithFormat:@"%@: Colorstops: %@", -[SUGradient description](&v3, sel_description), self->_colorStops];
}

@end