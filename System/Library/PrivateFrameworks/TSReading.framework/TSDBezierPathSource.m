@interface TSDBezierPathSource
+ (id)pathSourceWithBezierPath:(id)a3;
- (BOOL)isCircular;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRectangular;
- (CGAffineTransform)transformToNaturalSize;
- (CGSize)naturalSize;
- (TSDBezierPathSource)init;
- (TSDBezierPathSource)initWithBezierPath:(id)a3;
- (TSDBezierPathSource)initWithNaturalSize:(CGSize)a3;
- (id)bezierPathWithoutFlips;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (int64_t)mixingTypeWithObject:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)p_setBezierPath:(id)a3;
- (void)setNaturalSize:(CGSize)a3;
@end

@implementation TSDBezierPathSource

+ (id)pathSourceWithBezierPath:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBezierPath:a3];

  return v3;
}

- (TSDBezierPathSource)initWithBezierPath:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TSDBezierPathSource;
  v4 = [(TSDBezierPathSource *)&v9 init];
  if (v4)
  {
    if ([a3 elementCount] < 1)
    {
      double v5 = *(double *)(MEMORY[0x263F001A0] + 16);
      double v6 = *(double *)(MEMORY[0x263F001A0] + 24);
    }
    else
    {
      [a3 controlPointBounds];
    }
    BOOL v7 = v5 == *MEMORY[0x263F001B0] && v6 == *(double *)(MEMORY[0x263F001B0] + 8);
    if (v7 || TSDRectHasNaNComponents())
    {
      a3 = +[TSDBezierPath bezierPath];
      objc_msgSend(a3, "moveToPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
      objc_msgSend(a3, "lineToPoint:", 100.0, 100.0);
    }
    if (a3)
    {
      [(TSDBezierPathSource *)v4 p_setBezierPath:a3];
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (TSDBezierPathSource)initWithNaturalSize:(CGSize)a3
{
  v4 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", 0.0, 0.0, a3.width, a3.height);

  return [(TSDBezierPathSource *)self initWithBezierPath:v4];
}

- (TSDBezierPathSource)init
{
  return [(TSDBezierPathSource *)self initWithBezierPath:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDBezierPathSource;
  [(TSDBezierPathSource *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = (void *)[(TSDBezierPath *)self->mPath copy];
  double v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBezierPath:", v5);

  objc_msgSend(v6, "setHasHorizontalFlip:", -[TSDPathSource hasHorizontalFlip](self, "hasHorizontalFlip"));
  objc_msgSend(v6, "setHasVerticalFlip:", -[TSDPathSource hasVerticalFlip](self, "hasVerticalFlip"));
  [(TSDBezierPathSource *)self naturalSize];
  objc_msgSend(v6, "setNaturalSize:");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    uint64_t v12 = v3;
    uint64_t v13 = v4;
    objc_opt_class();
    uint64_t v7 = TSUDynamicCast();
    if (v7)
    {
      uint64_t v8 = v7;
      v11.receiver = self;
      v11.super_class = (Class)TSDBezierPathSource;
      LODWORD(v7) = [(TSDPathSource *)&v11 isEqual:a3];
      if (v7)
      {
        mPath = self->mPath;
        if (mPath == *(TSDBezierPath **)(v8 + 16)
          || (LODWORD(v7) = -[TSDBezierPath isEqual:](mPath, "isEqual:"), v7))
        {
          LOBYTE(v7) = self->mIsRectangular != (*(unsigned char *)(v8 + 24) == 0)
                    && self->mNaturalSize.height == *(double *)(v8 + 40)
                    && self->mNaturalSize.width == *(double *)(v8 + 32);
        }
      }
    }
  }
  return v7;
}

- (unint64_t)hash
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);

  return [(NSString *)v3 hash];
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)TSDBezierPathSource;
  uint64_t v3 = objc_msgSend(-[TSDBezierPathSource description](&v5, sel_description), "mutableCopy");
  objc_msgSend(v3, "appendString:", objc_msgSend(NSString, "stringWithFormat:", @"; naturalSize=%@; path=%@; isRectangular=%d",
      NSStringFromCGSize(self->mNaturalSize),
      self->mPath,
      self->mIsRectangular));
  return v3;
}

- (CGAffineTransform)transformToNaturalSize
{
  [(TSDBezierPath *)self->mPath bounds];
  double v6 = v5;
  double v8 = v7;
  double width = self->mNaturalSize.width;
  double height = self->mNaturalSize.height;
  result = (CGAffineTransform *)TSDNearlyEqualSizes(v5, v7, width, height);
  if (result)
  {
    uint64_t v12 = MEMORY[0x263F000D0];
    long long v13 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
    *(_OWORD *)&retstr->c = v13;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v12 + 32);
  }
  else
  {
    double v14 = 1.0;
    double v15 = 1.0;
    if (v6 > 0.01)
    {
      float v16 = width / v6;
      double v15 = v16;
    }
    if (v8 > 0.01)
    {
      float v17 = height / v8;
      double v14 = v17;
    }
    return CGAffineTransformMakeScale(retstr, v15, v14);
  }
  return result;
}

- (id)bezierPathWithoutFlips
{
  uint64_t v3 = (void *)[(TSDBezierPath *)self->mPath copy];
  memset(&v5[1], 0, sizeof(CGAffineTransform));
  [(TSDBezierPathSource *)self transformToNaturalSize];
  v5[0] = v5[1];
  if (!CGAffineTransformIsIdentity(v5))
  {
    v5[0] = v5[1];
    [v3 transformUsingAffineTransform:v5];
  }
  return v3;
}

- (BOOL)isRectangular
{
  return self->mIsRectangular;
}

- (BOOL)isCircular
{
  return [(TSDBezierPath *)self->mPath isCircular];
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__TSDBezierPathSource_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1758;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __44__TSDBezierPathSource_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = TSUDynamicCast();
  if (!v2)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDBezierPathSource mixingTypeWithObject:]_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathSource.m"), 176, @"nil object after cast");
  }
  if (*(unsigned __int8 *)(*(void *)(a1 + 40) + 24) == *(unsigned __int8 *)(v2 + 24)) {
    return 4;
  }
  else {
    return 1;
  }
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  CGAffineTransform v5[2] = __56__TSDBezierPathSource_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDBezierPathSource *__56__TSDBezierPathSource_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = (void *)TSUDynamicCast();
  [*(id *)(a1 + 40) naturalSize];
  double v4 = v3;
  double v6 = v5;
  [v2 naturalSize];
  double v9 = TSDMixSizes(v4, v6, v7, v8, *(double *)(a1 + 48));
  double v11 = v10;
  uint64_t v12 = +[TSDBezierPathSource pathSourceWithBezierPath:](TSDBezierPathSource, "pathSourceWithBezierPath:", [*(id *)(a1 + 40) bezierPath]);
  -[TSDBezierPathSource setNaturalSize:](v12, "setNaturalSize:", v9, v11);
  return v12;
}

- (void)p_setBezierPath:(id)a3
{
  if (!a3)
  {
    double v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDBezierPathSource p_setBezierPath:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathSource.m"), 207, @"invalid nil value for '%s'", "path");
  }
  [a3 bounds];
  double v8 = v7;
  double v10 = v9;
  if (!TSDNearlyEqualPoints(v7, v9, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8)))
  {
    CGAffineTransformMakeTranslation(&v14, -v8, -v10);
    [a3 transformUsingAffineTransform:&v14];
  }
  id v11 = a3;

  self->mPath = (TSDBezierPath *)a3;
  [a3 bounds];
  self->mNaturalSize.double width = v12;
  self->mNaturalSize.double height = v13;
  self->mIsRectangular = [(TSDBezierPath *)self->mPath isRectangular];
}

- (CGSize)naturalSize
{
  double width = self->mNaturalSize.width;
  double height = self->mNaturalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNaturalSize:(CGSize)a3
{
  self->mNaturalSize = a3;
}

@end