@interface EQKitCompoundBox
- (BOOL)isEqual:(id)a3;
- (CGRect)erasableBounds;
- (CGRect)p_cacheErasableBounds;
- (EQKitCompoundBox)init;
- (EQKitCompoundBox)initWithChildBoxes:(id)a3;
- (NSArray)childBoxes;
- (double)depth;
- (double)height;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5;
@end

@implementation EQKitCompoundBox

- (EQKitCompoundBox)initWithChildBoxes:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EQKitCompoundBox;
  v4 = [(EQKitCompoundBox *)&v6 init];
  if (v4) {
    v4->mChildBoxes = (NSArray *)[a3 copy];
  }
  return v4;
}

- (EQKitCompoundBox)init
{
  return [(EQKitCompoundBox *)self initWithChildBoxes:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitCompoundBox;
  [(EQKitCompoundBox *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(EQKitCompoundBox *)self childBoxes];

  return (id)[v4 initWithChildBoxes:v5];
}

- (BOOL)isEqual:(id)a3
{
  objc_super v3 = self;
  BOOL v4 = self == a3;
  LOBYTE(self) = self == a3;
  if (a3)
  {
    if (!v4)
    {
      LODWORD(self) = [a3 isMemberOfClass:objc_opt_class()];
      if (self)
      {
        objc_super v6 = [(EQKitCompoundBox *)v3 childBoxes];
        self = (EQKitCompoundBox *)[a3 childBoxes];
        if (v6 == self)
        {
          LOBYTE(self) = 1;
        }
        else
        {
          v7 = self;
          LOBYTE(self) = 0;
          if (v6 && v7)
          {
            LOBYTE(self) = -[EQKitCompoundBox isEqual:](v6, "isEqual:");
          }
        }
      }
    }
  }
  return (char)self;
}

- (double)height
{
  if (!self->mDimensionsValid)
  {
    [(EQKitCompoundBox *)self p_cacheDimensionsForHeight:&self->mHeight depth:&self->mDepth width:&self->mWidth];
    self->mDimensionsValid = 1;
  }
  return self->mHeight;
}

- (double)depth
{
  if (!self->mDimensionsValid)
  {
    [(EQKitCompoundBox *)self p_cacheDimensionsForHeight:&self->mHeight depth:&self->mDepth width:&self->mWidth];
    self->mDimensionsValid = 1;
  }
  return self->mDepth;
}

- (double)width
{
  if (!self->mDimensionsValid)
  {
    [(EQKitCompoundBox *)self p_cacheDimensionsForHeight:&self->mHeight depth:&self->mDepth width:&self->mWidth];
    self->mDimensionsValid = 1;
  }
  return self->mWidth;
}

- (CGRect)erasableBounds
{
  if (self->mErasableBoundsValid)
  {
    double x = self->mErasableBounds.origin.x;
    double y = self->mErasableBounds.origin.y;
    double width = self->mErasableBounds.size.width;
    double height = self->mErasableBounds.size.height;
  }
  else
  {
    [(EQKitCompoundBox *)self p_cacheErasableBounds];
    self->mErasableBounds.origin.double x = x;
    self->mErasableBounds.origin.double y = y;
    self->mErasableBounds.size.double width = width;
    self->mErasableBounds.size.double height = height;
    self->mErasableBoundsValid = 1;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitCompoundBox *)self height];
  uint64_t v6 = v5;
  [(EQKitCompoundBox *)self depth];
  uint64_t v8 = v7;
  [(EQKitCompoundBox *)self width];
  return (id)[v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f width=%f childBoxes=%@", v4, self, v6, v8, v9, -[EQKitCompoundBox childBoxes](self, "childBoxes")];
}

- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5
{
  if (a3) {
    *a3 = 0.0;
  }
  if (a4) {
    *a4 = 0.0;
  }
  if (a5) {
    *a5 = 0.0;
  }
}

- (CGRect)p_cacheErasableBounds
{
  double v2 = *MEMORY[0x263F001A8];
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (NSArray)childBoxes
{
  return self->mChildBoxes;
}

@end