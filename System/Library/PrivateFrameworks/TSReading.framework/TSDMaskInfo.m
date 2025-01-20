@interface TSDMaskInfo
- (BOOL)isEqual:(id)a3;
- (Class)layoutClass;
- (Class)repClass;
- (TSDMaskInfo)initWithContext:(id)a3 geometry:(id)a4;
- (TSDMaskInfo)initWithContext:(id)a3 geometry:(id)a4 pathSource:(id)a5;
- (TSDPathSource)pathSource;
- (id)copyWithContext:(id)a3;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (int64_t)mixingTypeWithObject:(id)a3;
- (void)dealloc;
- (void)setGeometry:(id)a3;
- (void)setPathSource:(id)a3;
@end

@implementation TSDMaskInfo

- (TSDMaskInfo)initWithContext:(id)a3 geometry:(id)a4 pathSource:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)TSDMaskInfo;
  v6 = [(TSDDrawableInfo *)&v10 initWithContext:a3 geometry:a4];
  if (v6)
  {
    if (!a5)
    {
      v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[TSDMaskInfo initWithContext:geometry:pathSource:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMaskInfo.m"), 33, @"invalid nil value for '%s'", "pathSource");
    }
    [(TSDMaskInfo *)v6 setPathSource:a5];
  }
  return v6;
}

- (TSDMaskInfo)initWithContext:(id)a3 geometry:(id)a4
{
  v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSDMaskInfo initWithContext:geometry:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMaskInfo.m"), 41, @"call -initWithContext:geometry:style: please");
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDMaskInfo;
  [(TSDDrawableInfo *)&v3 dealloc];
}

- (id)copyWithContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSDMaskInfo;
  v4 = [(TSDDrawableInfo *)&v6 copyWithContext:a3];
  if (v4) {
    v4[18] = [(TSDPathSource *)self->mPathSource copyWithZone:[(TSDMaskInfo *)self zone]];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    uint64_t v5 = v4;
    LOBYTE(v4) = -[TSDInfoGeometry isEqual:](-[TSDDrawableInfo geometry](self, "geometry"), "isEqual:", [v4 geometry])&& (objc_msgSend(-[TSDPathSource bezierPath](-[TSDMaskInfo pathSource](self, "pathSource"), "bezierPath"), "isEqual:", objc_msgSend((id)objc_msgSend(v5, "pathSource"), "bezierPath")) & 1) != 0;
  }
  return (char)v4;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return 0;
}

- (void)setGeometry:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TSDMaskInfo;
  -[TSDDrawableInfo setGeometry:](&v12, sel_setGeometry_);
  if ([(TSDDrawableInfo *)self geometry] == a3)
  {
    [(TSDInfoGeometry *)[(TSDDrawableInfo *)self geometry] size];
    double v6 = v5;
    double v8 = v7;
    [(TSDPathSource *)self->mPathSource naturalSize];
    if (v10 != v6 || v9 != v8)
    {
      [(TSDDrawableInfo *)self willChangeProperty:526];
      [(TSPObject *)self willModify];
      -[TSDPathSource setNaturalSize:](self->mPathSource, "setNaturalSize:", v6, v8);
    }
  }
}

- (void)setPathSource:(id)a3
{
  if (!a3)
  {
    double v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDMaskInfo setPathSource:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMaskInfo.m"), 109, @"invalid nil value for '%s'", "newPathSource");
  }
  if (self->mPathSource != a3)
  {
    [(TSDDrawableInfo *)self willChangeProperty:526];
    [(TSPObject *)self willModify];

    self->mPathSource = (TSDPathSource *)a3;
  }
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__TSDMaskInfo_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1758;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __36__TSDMaskInfo_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDMaskInfo mixingTypeWithObject:]_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMaskInfo.m"), 126, @"nil object after cast");
  }
  if (TSDMixingTypeWithPossiblyNilObjects([*(id *)(a1 + 40) geometry], objc_msgSend(v2, "geometry")) == 5) {
    uint64_t v5 = 5;
  }
  else {
    uint64_t v5 = 3;
  }
  uint64_t v6 = TSDMixingTypeWithPossiblyNilObjects([*(id *)(a1 + 40) pathSource], objc_msgSend(v2, "pathSource"));
  uint64_t result = TSDMixingTypeBestFromMixingTypes(v5, v6);
  if (result != 4) {
    return 2;
  }
  return result;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__TSDMaskInfo_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDMaskInfo *__48__TSDMaskInfo_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  objc_super v3 = -[TSDMaskInfo initWithContext:geometry:pathSource:]([TSDMaskInfo alloc], "initWithContext:geometry:pathSource:", [*(id *)(a1 + 40) context], objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "geometry"), "mixedObjectWithFraction:ofObject:", objc_msgSend(v2, "geometry"), *(double *)(a1 + 48)), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "pathSource"), "mixedObjectWithFraction:ofObject:", objc_msgSend(v2, "pathSource"), *(double *)(a1 + 48)));

  return v3;
}

- (TSDPathSource)pathSource
{
  return self->mPathSource;
}

@end