@interface TSDShapeInfo
- (BOOL)supportsShrinkTextToFit;
- (BOOL)supportsTextInset;
- (CGSize)targetSizeForImageData:(id)a3 associatedHint:(id)a4;
- (Class)layoutClass;
- (Class)repClass;
- (Class)styleClass;
- (TSDFill)fill;
- (TSDLineEnd)headLineEnd;
- (TSDLineEnd)tailLineEnd;
- (TSDPathSource)pathSource;
- (TSDShapeInfo)initWithContext:(id)a3 geometry:(id)a4;
- (TSDShapeInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5;
- (TSDShapeInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 pathSource:(id)a6;
- (id)animationFilters;
- (id)copyWithContext:(id)a3;
- (id)imageDatasForReducingFileSizeWithAssociatedHints;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)objectForProperty:(int)a3;
- (id)style;
- (int)elementKind;
- (int64_t)mixingTypeWithObject:(id)a3;
- (void)dealloc;
- (void)setFill:(id)a3;
- (void)setGeometry:(id)a3;
- (void)setHeadLineEnd:(id)a3;
- (void)setPathSource:(id)a3;
- (void)setStyle:(id)a3;
- (void)setTailLineEnd:(id)a3;
- (void)setValuesForProperties:(id)a3;
@end

@implementation TSDShapeInfo

- (TSDLineEnd)headLineEnd
{
  return self->mHeadLineEnd;
}

- (void)setHeadLineEnd:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mHeadLineEnd = (TSDLineEnd *)a3;
}

- (TSDLineEnd)tailLineEnd
{
  return self->mTailLineEnd;
}

- (void)setTailLineEnd:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mTailLineEnd = (TSDLineEnd *)a3;
}

- (TSDShapeInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 pathSource:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)TSDShapeInfo;
  v8 = [(TSDDrawableInfo *)&v14 initWithContext:a3 geometry:a4];
  if (v8)
  {
    if (a5)
    {
      if (a6)
      {
LABEL_4:
        [(TSDShapeInfo *)v8 setStyle:a5];
        [(TSDShapeInfo *)v8 setPathSource:a6];
        return v8;
      }
    }
    else
    {
      v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[TSDShapeInfo initWithContext:geometry:style:pathSource:]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeInfo.m"), 91, @"invalid nil value for '%s'", "style");
      if (a6) {
        goto LABEL_4;
      }
    }
    v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[TSDShapeInfo initWithContext:geometry:style:pathSource:]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeInfo.m"), 92, @"invalid nil value for '%s'", "pathSource");
    goto LABEL_4;
  }
  return v8;
}

- (TSDShapeInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5
{
  [a4 size];
  id v9 = +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:");
  return [(TSDShapeInfo *)self initWithContext:a3 geometry:a4 style:a5 pathSource:v9];
}

- (TSDShapeInfo)initWithContext:(id)a3 geometry:(id)a4
{
  v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSDShapeInfo initWithContext:geometry:]"];
  [v4 handleFailureInFunction:v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeInfo.m"), 114, @"call - (id)initWithContext:(TSPObjectContext*)context geometry:(TSDInfoGeometry *)geometry style:TSDGraphicStyle*style please." file lineNumber description]);
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDShapeInfo;
  [(TSDDrawableInfo *)&v3 dealloc];
}

- (id)copyWithContext:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)TSDShapeInfo;
  uint64_t v5 = -[TSDDrawableInfo copyWithContext:](&v14, sel_copyWithContext_);
  if (!v5) {
    return v5;
  }
  uint64_t v6 = [(TSDShapeInfo *)self zone];
  v5[18] = [(TSDPathSource *)self->mPathSource copyWithZone:v6];
  [a3 documentObject];
  if (objc_opt_respondsToSelector())
  {
    v7 = (TSPObjectContext *)a3;
  }
  else
  {
    [(TSPObjectContext *)[(TSPObject *)self context] documentObject];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v8 = [(TSSStyle *)self->mStyle stylesheet];
      goto LABEL_8;
    }
    v7 = [(TSPObject *)self context];
  }
  v8 = (TSSStylesheet *)[[(TSPObjectContext *)v7 documentObject] performSelector:sel_stylesheet];
LABEL_8:
  id v9 = v8;
  if (!v8)
  {
    v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSDShapeInfo copyWithContext:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeInfo.m"), 155, @"invalid nil value for '%s'", "stylesheet");
  }
  v12 = [[TSSStyleMapper alloc] initWithTargetStylesheet:v9 newStyleDOLCContext:0];
  objc_opt_class();
  [(TSSStyleMapper *)v12 mappedStyleForStyle:self->mStyle];
  v5[19] = (id)TSUDynamicCast();

  v5[20] = [(TSDLineEnd *)self->mHeadLineEnd copyWithZone:v6];
  v5[21] = [(TSDLineEnd *)self->mTailLineEnd copyWithZone:v6];
  return v5;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (Class)styleClass
{
  return (Class)objc_opt_class();
}

- (void)setGeometry:(id)a3
{
  if ([(TSDInfoGeometry *)[(TSDDrawableInfo *)self geometry] heightValid]) {
    BOOL v5 = [(TSDInfoGeometry *)[(TSDDrawableInfo *)self geometry] widthValid];
  }
  else {
    BOOL v5 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)TSDShapeInfo;
  [(TSDDrawableInfo *)&v13 setGeometry:a3];
  if ([(TSDDrawableInfo *)self geometry] == a3
    && [a3 heightValid]
    && [a3 widthValid])
  {
    [a3 size];
    double v7 = v6;
    double v9 = v8;
    if (!v5
      || (([(TSDPathSource *)self->mPathSource naturalSize], v11 == v7) ? (BOOL v12 = v10 == v9) : (BOOL v12 = 0),
          !v12))
    {
      [(TSDDrawableInfo *)self willChangeProperty:526];
      -[TSDPathSource setNaturalSize:](self->mPathSource, "setNaturalSize:", v7, v9);
    }
  }
}

- (void)setPathSource:(id)a3
{
  if (self->mPathSource != a3)
  {
    [(TSDDrawableInfo *)self willChangeProperty:526];

    self->mPathSource = (TSDPathSource *)a3;
  }
}

- (BOOL)supportsTextInset
{
  return 0;
}

- (BOOL)supportsShrinkTextToFit
{
  return 0;
}

- (void)setStyle:(id)a3
{
  if (self->mStyle != a3)
  {
    -[TSDDrawableInfo willChangeProperties:](self, "willChangeProperties:", [(id)objc_opt_class() properties]);
    [(TSPObject *)self willModify];
    id v5 = a3;

    self->mStyle = (TSDShapeStyle *)a3;
  }
}

- (TSDFill)fill
{
  if (![(TSDShapeInfo *)self style])
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDShapeInfo fill]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeInfo.m"), 254, @"invalid nil value for '%s'", "self.style");
  }
  id v5 = (TSDFill *)objc_msgSend(-[TSDShapeInfo style](self, "style"), "valueForProperty:", 516);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 0;
  }
  else {
    return v5;
  }
}

- (void)setFill:(id)a3
{
  if (!a3) {
    a3 = (id)[MEMORY[0x263EFF9D0] null];
  }
  [(TSDStyledInfo *)self i_setValue:a3 forProperty:516];
}

- (void)setValuesForProperties:(id)a3
{
  if (![(TSDShapeInfo *)self style])
  {
    id v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDShapeInfo setValuesForProperties:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeInfo.m"), 273, @"invalid nil value for '%s'", "self.style");
  }
  if (!objc_msgSend(-[TSDShapeInfo style](self, "style"), "stylesheet"))
  {
    double v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDShapeInfo setValuesForProperties:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeInfo.m"), 274, @"invalid nil value for '%s'", "self.style.stylesheet");
  }
  -[TSDDrawableInfo willChangeProperties:](self, "willChangeProperties:", [a3 allProperties]);
  uint64_t v9 = objc_msgSend((id)objc_msgSend(-[TSDShapeInfo style](self, "style"), "stylesheet"), "variationOfStyle:propertyMap:", -[TSDShapeInfo style](self, "style"), a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSDShapeInfo setValuesForProperties:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeInfo.m"), 279, @"Variation style is not a shape style.");
  }
  [(TSDShapeInfo *)self setStyle:v9];
}

- (id)imageDatasForReducingFileSizeWithAssociatedHints
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [(TSDShapeInfo *)self fill];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = (id)[(TSDFill *)v2 originalImageData];
  if (v3 || (result = (id)[(TSDFill *)v2 imageData], (id v3 = result) != 0))
  {
    id v5 = objc_alloc(MEMORY[0x263F7C880]);
    v6[0] = v3;
    return (id)objc_msgSend(v5, "initWithObjects:forKeys:", &unk_26D739360, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v6, 1));
  }
  return result;
}

- (CGSize)targetSizeForImageData:(id)a3 associatedHint:(id)a4
{
  objc_opt_class();
  [(TSDShapeInfo *)self fill];
  uint64_t v6 = (void *)TSUDynamicCast();
  if ((id)[v6 originalImageData] != a3 && (id)objc_msgSend(v6, "imageData") != a3)
  {
    double v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDShapeInfo targetSizeForImageData:associatedHint:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeInfo.m"), 343, @"Wrong data for reducing shape fill");
  }
  uint64_t v16 = 0;
  v17 = (double *)&v16;
  uint64_t v18 = 0x3010000000;
  v19 = &unk_22389B221;
  long long v20 = *MEMORY[0x263F001B0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54__TSDShapeInfo_targetSizeForImageData_associatedHint___block_invoke;
  v15[3] = &unk_2646B1568;
  v15[4] = &v16;
  [(TSDDrawableInfo *)self performBlockWithTemporaryLayout:v15];
  objc_msgSend(v6, "renderedImageSizeForObjectSize:", v17[4], v17[5]);
  double v10 = v9;
  double v12 = v11;
  _Block_object_dispose(&v16, 8);
  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

uint64_t __54__TSDShapeInfo_targetSizeForImageData_associatedHint___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t result = objc_msgSend((id)objc_msgSend((id)TSUDynamicCast(), "path"), "bounds");
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (id)animationFilters
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", kTSDAnimationFilterStandard, kTSDAnimationFilterByGlyph, kTSDAnimationFilterByWord, kTSDAnimationFilterByLine, kTSDAnimationFilterNotMovie, 0);
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__TSDShapeInfo_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1758;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __37__TSDShapeInfo_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDShapeInfo mixingTypeWithObject:]_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeInfo.m"), 393, @"nil object after cast");
  }
  uint64_t v5 = TSDMixingTypeBestFromMixingTypes(5, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "geometry"), "mixingTypeWithObject:", objc_msgSend(v2, "geometry")));
  uint64_t v6 = TSDMixingTypeWithPossiblyNilObjects([*(id *)(a1 + 40) shapeStyle], objc_msgSend(v2, "shapeStyle"));
  uint64_t v7 = TSDMixingTypeBestFromMixingTypes(v5, v6);
  uint64_t v8 = TSDMixingTypeWithPossiblyNilObjects([*(id *)(a1 + 40) pathSource], objc_msgSend(v2, "pathSource"));
  return TSDMixingTypeBestFromMixingTypes(v7, v8);
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__TSDShapeInfo_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDShapeInfo *__49__TSDShapeInfo_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  uint64_t v3 = -[TSDShapeInfo initWithContext:geometry:style:pathSource:]([TSDShapeInfo alloc], "initWithContext:geometry:style:pathSource:", [*(id *)(a1 + 40) context], objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "geometry"), "mixedObjectWithFraction:ofObject:", objc_msgSend(v2, "geometry"), *(double *)(a1 + 48)), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "shapeStyle"), "mixedObjectWithFraction:ofObject:", objc_msgSend(v2, "shapeStyle"), *(double *)(a1 + 48)), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "pathSource"), "mixedObjectWithFraction:ofObject:", objc_msgSend(v2, "pathSource"), *(double *)(a1 + 48)));
  return v3;
}

- (id)objectForProperty:(int)a3
{
  switch(a3)
  {
    case 522:
      return [(TSDShapeInfo *)self headLineEnd];
    case 523:
      return [(TSDShapeInfo *)self tailLineEnd];
    case 526:
      return [(TSDShapeInfo *)self pathSource];
    default:
      uint64_t v7 = v3;
      uint64_t v8 = v4;
      v6.receiver = self;
      v6.super_class = (Class)TSDShapeInfo;
      return -[TSDStyledInfo objectForProperty:](&v6, sel_objectForProperty_);
  }
}

- (id)style
{
  return self->mStyle;
}

- (TSDPathSource)pathSource
{
  return self->mPathSource;
}

- (int)elementKind
{
  return 2;
}

@end