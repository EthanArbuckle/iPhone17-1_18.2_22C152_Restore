@interface EDGradientFill
+ (id)gradientWithType:(int)a3 degree:(double)a4 focusRect:(CGRect)a5 stops:(id)a6 resources:(id)a7;
+ (id)gradientWithType:(int)a3 degree:(double)a4 top:(double)a5 bottom:(double)a6 right:(double)a7 left:(double)a8 stops:(id)a9 resources:(id)a10;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToGradientFill:(id)a3;
- (CGRect)focusRect;
- (EDGradientFill)initWithResources:(id)a3;
- (EDGradientFill)initWithType:(int)a3 degree:(double)a4 focusRect:(CGRect)a5 stops:(id)a6 resources:(id)a7;
- (EDGradientFill)initWithType:(int)a3 degree:(double)a4 top:(double)a5 bottom:(double)a6 right:(double)a7 left:(double)a8 stops:(id)a9 resources:(id)a10;
- (double)degree;
- (id)colorForStopAtPosition:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stops;
- (int)type;
- (unint64_t)hash;
- (void)setDegree:(double)a3;
- (void)setFocusRect:(CGRect)a3;
- (void)setStopColor:(id)a3 atPosition:(id)a4;
- (void)setStops:(id)a3;
- (void)setType:(int)a3;
@end

@implementation EDGradientFill

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setDegree:(double)a3
{
  self->mDegree = a3;
}

- (void)setFocusRect:(CGRect)a3
{
  self->mFocusRect = a3;
}

- (void)setStops:(id)a3
{
  v5 = (NSMutableDictionary *)a3;
  if (self->mStops != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mStops, a3);
    v5 = v6;
  }
}

- (void)setStopColor:(id)a3 atPosition:(id)a4
{
}

- (EDGradientFill)initWithResources:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EDGradientFill;
  v5 = [(EDFill *)&v10 initWithResources:v4];
  v6 = v5;
  if (v5)
  {
    v5->mType = 0;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mStops = v6->mStops;
    v6->mStops = v7;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)EDGradientFill;
  id v4 = [(EDFill *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSMutableDictionary *)self->mStops mutableCopy];
  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (BOOL)isEqualToGradientFill:(id)a3
{
  id v4 = (char *)a3;
  uint64_t v5 = v4;
  if (self->mType == *((_DWORD *)v4 + 4)
    && self->mDegree == *((double *)v4 + 4)
    && CGRectEqualToRect(self->mFocusRect, *(CGRect *)(v4 + 40)))
  {
    char v6 = [(NSMutableDictionary *)self->mStops isEqual:v5[3]];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EDGradientFill *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(EDGradientFill *)self isEqualToGradientFill:v5];

  return v6;
}

- (unint64_t)hash
{
  int v2 = self->mType << 8;
  return [(NSMutableDictionary *)self->mStops count] + v2;
}

- (BOOL)isEmpty
{
  return 0;
}

- (int)type
{
  return self->mType;
}

- (double)degree
{
  return self->mDegree;
}

- (id)stops
{
  return self->mStops;
}

- (CGRect)focusRect
{
  double x = self->mFocusRect.origin.x;
  double y = self->mFocusRect.origin.y;
  double width = self->mFocusRect.size.width;
  double height = self->mFocusRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)colorForStopAtPosition:(id)a3
{
  v3 = [(NSMutableDictionary *)self->mStops objectForKey:a3];
  return v3;
}

- (void).cxx_destruct
{
}

- (EDGradientFill)initWithType:(int)a3 degree:(double)a4 top:(double)a5 bottom:(double)a6 right:(double)a7 left:(double)a8 stops:(id)a9 resources:(id)a10
{
  uint64_t v16 = *(void *)&a3;
  id v18 = a9;
  id v19 = a10;
  v20 = [(EDGradientFill *)self initWithResources:v19];
  v21 = v20;
  if (v20)
  {
    [(EDGradientFill *)v20 setType:v16];
    -[EDGradientFill setFocusRect:](v21, "setFocusRect:", a8, a5, a7, a6);
    [(EDGradientFill *)v21 setStops:v18];
    [(EDGradientFill *)v21 setDegree:a4];
  }

  return v21;
}

+ (id)gradientWithType:(int)a3 degree:(double)a4 top:(double)a5 bottom:(double)a6 right:(double)a7 left:(double)a8 stops:(id)a9 resources:(id)a10
{
  uint64_t v16 = *(void *)&a3;
  id v18 = a9;
  id v19 = a10;
  v20 = (void *)[objc_alloc((Class)a1) initWithType:v16 degree:v18 top:v19 bottom:a4 right:a5 left:a6 stops:a7 resources:a8];

  return v20;
}

- (EDGradientFill)initWithType:(int)a3 degree:(double)a4 focusRect:(CGRect)a5 stops:(id)a6 resources:(id)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v13 = *(void *)&a3;
  id v15 = a6;
  id v16 = a7;
  v17 = [(EDGradientFill *)self initWithResources:v16];
  id v18 = v17;
  if (v17)
  {
    [(EDGradientFill *)v17 setType:v13];
    -[EDGradientFill setFocusRect:](v18, "setFocusRect:", x, y, width, height);
    [(EDGradientFill *)v18 setStops:v15];
    [(EDGradientFill *)v18 setDegree:a4];
  }

  return v18;
}

+ (id)gradientWithType:(int)a3 degree:(double)a4 focusRect:(CGRect)a5 stops:(id)a6 resources:(id)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v13 = *(void *)&a3;
  id v15 = a6;
  id v16 = a7;
  v17 = objc_msgSend(objc_alloc((Class)a1), "initWithType:degree:focusRect:stops:resources:", v13, v15, v16, a4, x, y, width, height);

  return v17;
}

@end