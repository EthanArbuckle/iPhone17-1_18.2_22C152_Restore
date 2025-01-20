@interface TSDImageInfo
+ (id)bootstrapPropertyMapForPresetIndex:(unint64_t)a3 inTheme:(id)a4 alternate:(int)a5;
+ (id)presetKinds;
+ (void)adjustIncomingImageGeometry:(id)a3 maskGeometry:(id)a4 forImageData:(id)a5 maskedWithInstantAlphaPath:(id)a6 withNaturalSize:(CGSize)a7 forTargetImageGeometry:(id)a8 withTargetMaskGeometry:(id)a9;
+ (void)bootstrapPresetsOfKind:(id)a3 inTheme:(id)a4 alternate:(int)a5;
+ (void)bootstrapPresetsOfKind:(id)a3 inTheme:(id)a4 alternate:(int)a5 reservedCount:(unint64_t)a6;
- (BOOL)interpretsUntaggedImageDataAsGeneric;
- (BOOL)isMasked;
- (BOOL)isOpaque;
- (BOOL)isPDF;
- (BOOL)isValid;
- (BOOL)maskCanBeReset;
- (CGAffineTransform)computeFullTransform;
- (CGPoint)centerForReplacingWithNewMedia;
- (CGSize)defaultOriginalSize;
- (CGSize)naturalSize;
- (CGSize)originalSize;
- (CGSize)rawDataSize;
- (CGSize)targetSizeForImageData:(id)a3 associatedHint:(id)a4;
- (Class)layoutClass;
- (Class)repClass;
- (Class)styleClass;
- (TSDBezierPath)instantAlphaPath;
- (TSDBezierPath)tracedPath;
- (TSDContainerInfo)parentInfo;
- (TSDImageAdjustments)imageAdjustments;
- (TSDImageInfo)initWithContext:(id)a3 geometry:(id)a4;
- (TSDImageInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 imageData:(id)a6 originalImageData:(id)a7;
- (TSDInfoGeometry)geometry;
- (TSDMaskInfo)maskInfo;
- (TSPData)adjustedImageData;
- (TSPData)enhancedImageData;
- (TSPData)imageData;
- (TSPData)originalImageData;
- (TSPData)thumbnailAdjustedImageData;
- (TSPData)thumbnailImageData;
- (id)childInfos;
- (id)copyWithContext:(id)a3;
- (id)copyWithContext:(id)a3 style:(id)a4;
- (id)defaultMaskInfo;
- (id)defaultMaskInfoWithContext:(id)a3;
- (id)geometryWithMask;
- (id)i_thumbnailForImageData:(id)a3;
- (id)imageDatasForReducingFileSizeWithAssociatedHints;
- (id)mediaDisplayName;
- (id)mediaFileType;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)objectForProperty:(int)a3;
- (id)presetKind;
- (id)style;
- (id)updatedMaskInfoGeometryForImageDraggedBy:(CGPoint)a3;
- (int64_t)mixingTypeWithObject:(id)a3;
- (void)acceptVisitor:(id)a3;
- (void)dealloc;
- (void)setAdjustedImageData:(id)a3;
- (void)setEnhancedImageData:(id)a3;
- (void)setExteriorTextWrap:(id)a3;
- (void)setImageAdjustments:(id)a3;
- (void)setImageData:(id)a3;
- (void)setInstantAlphaPath:(id)a3;
- (void)setInterpretsUntaggedImageDataAsGeneric:(BOOL)a3;
- (void)setMaskInfo:(id)a3;
- (void)setNaturalSize:(CGSize)a3;
- (void)setOriginalImageData:(id)a3;
- (void)setParentInfo:(id)a3;
- (void)setStyle:(id)a3;
- (void)setThumbnailAdjustedImageData:(id)a3;
- (void)setThumbnailImageData:(id)a3;
- (void)updateGeometryToReplaceMediaInfo:(id)a3;
- (void)wasRemovedFromDocumentRoot:(id)a3;
@end

@implementation TSDImageInfo

- (void)setThumbnailImageData:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mThumbnailImageData = (TSPData *)a3;
}

- (BOOL)interpretsUntaggedImageDataAsGeneric
{
  return self->mInterpretsUntaggedImageDataAsGeneric;
}

- (TSPData)enhancedImageData
{
  return self->mEnhancedImageData;
}

- (void)setEnhancedImageData:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mEnhancedImageData = (TSPData *)a3;
}

- (TSDImageInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 imageData:(id)a6 originalImageData:(id)a7
{
  v14.receiver = self;
  v14.super_class = (Class)TSDImageInfo;
  v10 = [(TSDMediaInfo *)&v14 initWithContext:a3 geometry:a4];
  if (v10)
  {
    if (!a5)
    {
      v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[TSDImageInfo initWithContext:geometry:style:imageData:originalImageData:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 124, @"invalid nil value for '%s'", "style");
    }
    [(TSDImageInfo *)v10 setStyle:a5];
    [(TSDImageInfo *)v10 setImageData:a6];
    [(TSDImageInfo *)v10 defaultOriginalSize];
    -[TSDMediaInfo setOriginalSize:](v10, "setOriginalSize:");
    [(TSDImageInfo *)v10 setOriginalImageData:a7];
  }
  return v10;
}

- (TSDImageInfo)initWithContext:(id)a3 geometry:(id)a4
{
  v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSDImageInfo initWithContext:geometry:]"];
  [v4 handleFailureInFunction:v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 138, @"call the designated initializer, please" file lineNumber description];
  return 0;
}

- (void)dealloc
{
  [(TSDDrawableInfo *)self->mMaskInfo clearBackPointerToParentInfoIfNeeded:self];

  v3.receiver = self;
  v3.super_class = (Class)TSDImageInfo;
  [(TSDDrawableInfo *)&v3 dealloc];
}

- (id)copyWithContext:(id)a3 style:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)TSDImageInfo;
  v7 = -[TSDMediaInfo copyWithContext:](&v11, sel_copyWithContext_);
  *((void *)v7 + 21) = [(TSDImageInfo *)self imageData];
  *((void *)v7 + 23) = [(TSDImageInfo *)self originalImageData];
  [v7 setStyle:a4];
  v8 = [(TSDImageInfo *)self maskInfo];
  if (v8)
  {
    id v9 = [(TSDMaskInfo *)v8 copyWithContext:a3];
    [v9 setParentInfo:v7];
    *((void *)v7 + 30) = v9;
  }
  if ([(TSDImageInfo *)self instantAlphaPath]) {
    *((void *)v7 + 31) = [(TSDBezierPath *)[(TSDImageInfo *)self instantAlphaPath] copy];
  }
  *((void *)v7 + 22) = self->mThumbnailImageData;
  *((void *)v7 + 32) = [(TSDBezierPath *)self->mTracedPath copy];
  *(CGSize *)(v7 + 264) = self->mNaturalSize;
  *((void *)v7 + 25) = [(TSDImageAdjustments *)self->mImageAdjustments copy];
  *((void *)v7 + 26) = self->mAdjustedImageData;
  *((void *)v7 + 27) = self->mThumbnailAdjustedImageData;
  *((void *)v7 + 28) = self->mEnhancedImageData;
  return v7;
}

- (id)copyWithContext:(id)a3
{
  [a3 documentObject];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = (TSPObjectContext *)a3;
LABEL_5:
    v6 = (TSSStylesheet *)[[(TSPObjectContext *)v5 documentObject] performSelector:sel_stylesheet];
    goto LABEL_7;
  }
  [(TSPObjectContext *)[(TSPObject *)self context] documentObject];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(TSPObject *)self context];
    goto LABEL_5;
  }
  v6 = [(TSSStyle *)self->mStyle stylesheet];
LABEL_7:
  v7 = v6;
  if (!v6)
  {
    v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSDImageInfo copyWithContext:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 211, @"invalid nil value for '%s'", "stylesheet");
  }
  v10 = [[TSSStyleMapper alloc] initWithTargetStylesheet:v7 newStyleDOLCContext:0];
  objc_opt_class();
  [(TSSStyleMapper *)v10 mappedStyleForStyle:self->mStyle];
  id v11 = [(TSDImageInfo *)self copyWithContext:a3 style:TSUDynamicCast()];

  return v11;
}

- (void)setExteriorTextWrap:(id)a3
{
  [(TSDExteriorTextWrap *)[(TSDDrawableInfo *)self exteriorTextWrap] alphaThreshold];
  double v6 = v5;
  v8.receiver = self;
  v8.super_class = (Class)TSDImageInfo;
  [(TSDDrawableInfo *)&v8 setExteriorTextWrap:a3];
  [(TSDExteriorTextWrap *)[(TSDDrawableInfo *)self exteriorTextWrap] alphaThreshold];
  if (v6 != v7)
  {

    self->mTracedPath = 0;
  }
}

- (Class)styleClass
{
  return (Class)objc_opt_class();
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (id)presetKind
{
  objc_super v3 = (void *)String;
  objc_opt_class();
  [(TSDImageInfo *)self style];
  v4 = (void *)TSUDynamicCast();
  if (!v4) {
    return v3;
  }
  return (id)[v4 presetKind];
}

- (TSDInfoGeometry)geometry
{
  v3.receiver = self;
  v3.super_class = (Class)TSDImageInfo;
  return [(TSDDrawableInfo *)&v3 geometry];
}

- (TSDContainerInfo)parentInfo
{
  v3.receiver = self;
  v3.super_class = (Class)TSDImageInfo;
  return [(TSDDrawableInfo *)&v3 parentInfo];
}

- (void)setParentInfo:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TSDImageInfo;
  [(TSDDrawableInfo *)&v3 setParentInfo:a3];
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TSDImageInfo;
  [(TSDDrawableInfo *)&v3 wasRemovedFromDocumentRoot:a3];
}

- (id)childInfos
{
  if (self->mMaskInfo) {
    return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:");
  }
  else {
    return (id)[MEMORY[0x263EFF8C0] array];
  }
}

- (id)geometryWithMask
{
  mMaskInfo = self->mMaskInfo;
  if (mMaskInfo)
  {
    v4 = [(TSDDrawableInfo *)mMaskInfo geometry];
    double v5 = [(TSDImageInfo *)self geometry];
    return [(TSDInfoGeometry *)v4 geometryWithParentGeometry:v5];
  }
  else
  {
    return [(TSDImageInfo *)self geometry];
  }
}

- (CGAffineTransform)computeFullTransform
{
  result = [(TSDImageInfo *)self geometryWithMask];
  if (result)
  {
    return (CGAffineTransform *)[(CGAffineTransform *)result fullTransform];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  return result;
}

- (id)imageDatasForReducingFileSizeWithAssociatedHints
{
  v6[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [(TSDImageInfo *)self originalImageData];
  if (!v3) {
    objc_super v3 = [(TSDImageInfo *)self imageData];
  }
  id v4 = objc_alloc(MEMORY[0x263F7C880]);
  v6[0] = v3;
  return (id)objc_msgSend(v4, "initWithObjects:forKeys:", &unk_26D739390, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v6, 1));
}

- (CGSize)targetSizeForImageData:(id)a3 associatedHint:(id)a4
{
  if (([@"misc" isEqualToString:a4] & 1) == 0)
  {
    double v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDImageInfo targetSizeForImageData:associatedHint:]"];
    [v6 handleFailureInFunction:v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 382, @"associated hint is wrong %@", a4 file lineNumber description];
  }
  uint64_t v13 = 0;
  objc_super v14 = (double *)&v13;
  uint64_t v15 = 0x3010000000;
  v16 = &unk_22389B221;
  long long v17 = *MEMORY[0x263F001B0];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__TSDImageInfo_targetSizeForImageData_associatedHint___block_invoke;
  v12[3] = &unk_2646B1568;
  v12[4] = &v13;
  [(TSDDrawableInfo *)self performBlockWithTemporaryLayout:v12];
  double v8 = v14[4];
  double v9 = v14[5];
  _Block_object_dispose(&v13, 8);
  double v10 = v8;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

void __54__TSDImageInfo_targetSizeForImageData_associatedHint___block_invoke(uint64_t a1)
{
  objc_opt_class();
  objc_msgSend((id)objc_msgSend((id)TSUDynamicCast(), "imageGeometry"), "size");
  double v3 = TSDCeilSize(v2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  *(double *)(v4 + 32) = v3;
  *(void *)(v4 + 40) = v5;
}

- (id)mediaDisplayName
{
  double v2 = [(TSDImageInfo *)self imageData];
  return [(TSPData *)v2 filename];
}

- (id)mediaFileType
{
  double v2 = [(TSDImageInfo *)self imageData];
  return [(TSPData *)v2 type];
}

- (void)setInterpretsUntaggedImageDataAsGeneric:(BOOL)a3
{
  if (self->mInterpretsUntaggedImageDataAsGeneric != a3)
  {
    [(TSPObject *)self willModify];
    self->mInterpretsUntaggedImageDataAsGeneric = a3;
  }
}

- (void)setImageData:(id)a3
{
  if (self->mImageData != a3)
  {
    [(TSDDrawableInfo *)self willChangeProperty:528];

    self->mImageData = (TSPData *)a3;
    [(TSDImageInfo *)self setThumbnailImageData:0];

    self->mTracedPath = 0;
    self->mNaturalSize = (CGSize)*MEMORY[0x263F001B0];
    [(TSDImageInfo *)self setImageAdjustments:0];
    [(TSDImageInfo *)self setAdjustedImageData:0];
    [(TSDImageInfo *)self setEnhancedImageData:0];
    [(TSDImageInfo *)self setInterpretsUntaggedImageDataAsGeneric:0];
  }
}

- (id)i_thumbnailForImageData:(id)a3
{
  id result = TSDResampleImageData(a3, 0, 3, 256.0, 256.0);
  if (result == a3) {
    return 0;
  }
  return result;
}

- (void)setOriginalImageData:(id)a3
{
  if (self->mOriginalImageData != a3)
  {
    [(TSDDrawableInfo *)self willChangeProperty:528];
    [(TSPObject *)self willModify];

    self->mOriginalImageData = (TSPData *)a3;
  }
}

- (void)setStyle:(id)a3
{
  if (self->mStyle != a3)
  {
    [(TSDDrawableInfo *)self willChangeProperties:+[TSDMediaStyle properties]];
    [(TSPObject *)self willModify];
    id v5 = a3;

    self->mStyle = (TSDMediaStyle *)a3;
  }
}

- (CGSize)originalSize
{
  if (self->mMaskInfo)
  {
    double v2 = [(TSDDrawableInfo *)self->mMaskInfo geometry];
    [(TSDInfoGeometry *)v2 size];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TSDImageInfo;
    [(TSDMediaInfo *)&v5 originalSize];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)defaultOriginalSize
{
  if (self->mMaskInfo)
  {
    double v2 = [(TSDDrawableInfo *)self->mMaskInfo geometry];
    [(TSDInfoGeometry *)v2 size];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TSDImageInfo;
    [(TSDMediaInfo *)&v5 defaultOriginalSize];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)rawDataSize
{
  if ([(TSDImageInfo *)self originalImageData]) {
    double v3 = [(TSDImageInfo *)self originalImageData];
  }
  else {
    double v3 = [(TSDImageInfo *)self imageData];
  }
  double v4 = objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "temporaryProviderForData:shouldValidate:", v3, 1);
  [v4 dpiAdjustedNaturalSize];
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setMaskInfo:(id)a3
{
  if (self->mMaskInfo != a3)
  {
    [(TSDDrawableInfo *)self willChangeProperty:529];
    [(TSDDrawableInfo *)self->mMaskInfo clearBackPointerToParentInfoIfNeeded:self];

    double v5 = (TSDMaskInfo *)a3;
    self->mMaskInfo = v5;
    [(TSDDrawableInfo *)v5 setParentInfo:self];
  }
}

- (void)setInstantAlphaPath:(id)a3
{
  if (self->mInstantAlphaPath != a3)
  {
    [(TSDDrawableInfo *)self willChangeProperty:530];

    self->mInstantAlphaPath = (TSDBezierPath *)a3;
  }
}

- (void)setImageAdjustments:(id)a3
{
  if ((unint64_t)a3 | (unint64_t)self->mImageAdjustments && (objc_msgSend(a3, "isEqual:") & 1) == 0)
  {
    [(TSDDrawableInfo *)self willChangeProperty:531];

    self->mImageAdjustments = (TSDImageAdjustments *)[a3 copy];
    [(TSDImageInfo *)self setAdjustedImageData:0];
  }
}

- (void)setAdjustedImageData:(id)a3
{
  if (self->mAdjustedImageData == a3) {
    return;
  }
  [(TSDDrawableInfo *)self willChangeProperty:528];

  self->mAdjustedImageData = (TSPData *)a3;
  if (!a3 || ![(TSPObjectContext *)[(TSPObject *)self context] documentObject]) {
    goto LABEL_8;
  }
  if (![a3 isReadable])
  {
    [a3 addDownloadObserver:self completionHandler:&__block_literal_global_32];
LABEL_8:
    id v5 = 0;
    goto LABEL_9;
  }
  id v5 = [(TSDImageInfo *)self i_thumbnailForImageData:a3];
LABEL_9:
  [(TSDImageInfo *)self setThumbnailAdjustedImageData:v5];
}

void __37__TSDImageInfo_setAdjustedImageData___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (!a4)
  {
    uint64_t v5 = objc_msgSend(a2, "i_thumbnailForImageData:");
    if (v5)
    {
      [a2 setThumbnailAdjustedImageData:v5];
    }
  }
}

- (id)objectForProperty:(int)a3
{
  switch(a3)
  {
    case 530:
      return [(TSDImageInfo *)self instantAlphaPath];
    case 529:
      return [(TSDImageInfo *)self maskInfo];
    case 528:
      return [(TSDImageInfo *)self imageData];
    default:
      uint64_t v7 = v3;
      uint64_t v8 = v4;
      v6.receiver = self;
      v6.super_class = (Class)TSDImageInfo;
      return -[TSDStyledInfo objectForProperty:](&v6, sel_objectForProperty_);
  }
}

- (BOOL)isMasked
{
  return [(TSDImageInfo *)self maskInfo] != 0;
}

- (BOOL)maskCanBeReset
{
  BOOL v3 = [(TSDImageInfo *)self isMasked];
  if (v3)
  {
    uint64_t v4 = [(TSDDrawableInfo *)[(TSDImageInfo *)self maskInfo] geometry];
    [(TSDInfoGeometry *)v4 position];
    if (v6 == *MEMORY[0x263F00148] && v5 == *(double *)(MEMORY[0x263F00148] + 8))
    {
      [(TSDInfoGeometry *)v4 size];
      double v9 = v8;
      double v11 = v10;
      [(TSDInfoGeometry *)[(TSDImageInfo *)self geometry] size];
      LOBYTE(v3) = 1;
      if (v9 == v13 && v11 == v12)
      {
        [(TSDInfoGeometry *)v4 angle];
        LOBYTE(v3) = v14 != 0.0;
      }
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (id)defaultMaskInfoWithContext:(id)a3
{
  if ([(TSDImageInfo *)self instantAlphaPath])
  {
    double v5 = (void *)[(TSDBezierPath *)[(TSDImageInfo *)self instantAlphaPath] copy];
    [(TSDInfoGeometry *)[(TSDImageInfo *)self geometry] size];
    double v7 = v6;
    double v9 = v8;
    [(TSDImageInfo *)self naturalSize];
    memset(&v40, 0, sizeof(v40));
    CGAffineTransformMakeScale(&v40, v7 / v10, v9 / v11);
    CGAffineTransform v39 = v40;
    [v5 transformUsingAffineTransform:&v39];
    [v5 bounds];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;

    v20 = -[TSDInfoGeometry initWithCenter:size:]([TSDInfoGeometry alloc], "initWithCenter:size:", TSDCenterOfRect(v13, v15, v17, v19));
    v21 = objc_alloc_init(TSDBezierPath);
    [(TSDBezierPath *)v21 appendBezierPathWithRect:TSDRectWithSize()];
    v22 = [[TSDBezierPathSource alloc] initWithBezierPath:v21];
  }
  else
  {
    v23 = [(TSDImageInfo *)self geometry];
    [(TSDInfoGeometry *)v23 center];
    double v25 = v24;
    double v27 = v26;
    [(TSDInfoGeometry *)v23 position];
    double v29 = TSDSubtractPoints(v25, v27, v28);
    double v31 = v30;
    [(TSDInfoGeometry *)v23 size];
    double v33 = v32;
    double v35 = v34;
    v36 = objc_alloc_init(TSDBezierPath);
    [(TSDBezierPath *)v36 appendBezierPathWithRect:TSDRectWithSize()];
    v22 = [[TSDBezierPathSource alloc] initWithBezierPath:v36];

    v20 = -[TSDInfoGeometry initWithCenter:size:]([TSDInfoGeometry alloc], "initWithCenter:size:", v29, v31, v33, v35);
  }
  v37 = [[TSDMaskInfo alloc] initWithContext:a3 geometry:v20 pathSource:v22];

  return v37;
}

- (id)defaultMaskInfo
{
  BOOL v3 = [(TSPObject *)self context];
  return [(TSDImageInfo *)self defaultMaskInfoWithContext:v3];
}

- (id)updatedMaskInfoGeometryForImageDraggedBy:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id result = [(TSDImageInfo *)self maskInfo];
  if (result)
  {
    double v7 = objc_msgSend((id)objc_msgSend(result, "geometry"), "mutableCopy");
    memset(&v17, 0, sizeof(v17));
    double v8 = [(TSDImageInfo *)self geometry];
    if (v8) {
      [(TSDInfoGeometry *)v8 transform];
    }
    else {
      memset(&v17, 0, sizeof(v17));
    }
    memset(&v16, 0, sizeof(v16));
    CGAffineTransformMakeTranslation(&t2, x, y);
    CGAffineTransform t1 = v17;
    CGAffineTransformConcat(&v16, &t1, &t2);
    [v7 position];
    double v11 = v17.ty + v9 * v17.d + v17.b * v10;
    double v12 = v17.tx + v9 * v17.c + v17.a * v10;
    CGAffineTransform t1 = v16;
    CGAffineTransformInvert(&v13, &t1);
    objc_msgSend(v7, "setPosition:", vaddq_f64(*(float64x2_t *)&v13.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v13.c, v11), *(float64x2_t *)&v13.a, v12)));
    return v7;
  }
  return result;
}

- (BOOL)isPDF
{
  double v2 = [(TSPData *)[(TSDImageInfo *)self imageData] type];
  return UTTypeConformsTo((CFStringRef)v2, (CFStringRef)[(id)*MEMORY[0x263F1DBF0] identifier]) != 0;
}

- (BOOL)isValid
{
  double v2 = [(TSDImageInfo *)self imageData];
  return +[TSDImageProviderPool isValidImageData:v2];
}

- (BOOL)isOpaque
{
  objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", -[TSDImageInfo imageData](self, "imageData"), 0);
  objc_opt_class();
  double v2 = (void *)TSUDynamicCast();
  return [v2 isOpaque];
}

- (CGPoint)centerForReplacingWithNewMedia
{
  id v2 = [(TSDImageInfo *)self geometryWithMask];
  [v2 center];
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (void)updateGeometryToReplaceMediaInfo:(id)a3
{
  double v5 = objc_msgSend((id)objc_msgSend(a3, "geometry"), "copy");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a3 maskInfo])
  {
    double v6 = (void *)[a3 maskInfo];
    id v27 = (id)objc_msgSend((id)objc_msgSend(v6, "pathSource"), "copy");
    double v7 = (void *)[v6 geometry];
    if (!v7)
    {
      double v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"-[TSDImageInfo updateGeometryToReplaceMediaInfo:]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 912, @"invalid nil value for '%s'", "oldMaskGeometry");
    }
    double v10 = (TSDInfoGeometry *)[v7 copy];
  }
  else
  {
    double v11 = [TSDInfoGeometry alloc];
    [v5 size];
    double v12 = TSDRectWithSize();
    double v16 = TSDCenterOfRect(v12, v13, v14, v15);
    double v18 = v17;
    [a3 originalSize];
    double v10 = -[TSDInfoGeometry initWithCenter:size:](v11, "initWithCenter:size:", v16, v18, v19, v20);
    id v27 = 0;
  }
  v21 = (void *)[v5 mutableCopy];
  v22 = (void *)[(TSDInfoGeometry *)v10 mutableCopy];
  v23 = [(TSDImageInfo *)self imageData];
  double v24 = [(TSDImageInfo *)self instantAlphaPath];
  [(TSDImageInfo *)self naturalSize];
  +[TSDImageInfo adjustIncomingImageGeometry:maskGeometry:forImageData:maskedWithInstantAlphaPath:withNaturalSize:forTargetImageGeometry:withTargetMaskGeometry:](TSDImageInfo, "adjustIncomingImageGeometry:maskGeometry:forImageData:maskedWithInstantAlphaPath:withNaturalSize:forTargetImageGeometry:withTargetMaskGeometry:", v21, v22, v23, v24, v5, v10);
  [(TSDMediaInfo *)self setGeometry:v21];
  if (v27) {
    double v25 = [[TSDMaskInfo alloc] initWithContext:[(TSPObject *)self context] geometry:v10 pathSource:v27];
  }
  else {
    double v25 = [(TSDImageInfo *)self defaultMaskInfo];
  }
  double v26 = v25;
  [(TSDMaskInfo *)v25 setGeometry:v22];
  [(TSDImageInfo *)self setMaskInfo:v26];
}

+ (void)adjustIncomingImageGeometry:(id)a3 maskGeometry:(id)a4 forImageData:(id)a5 maskedWithInstantAlphaPath:(id)a6 withNaturalSize:(CGSize)a7 forTargetImageGeometry:(id)a8 withTargetMaskGeometry:(id)a9
{
  double height = a7.height;
  double width = a7.width;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v63 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v64 = [NSString stringWithUTF8String:"+[TSDImageInfo adjustIncomingImageGeometry:maskGeometry:forImageData:maskedWithInstantAlphaPath:withNaturalSize:forTargetImageGeometry:withTargetMaskGeometry:]"];
    objc_msgSend(v63, "handleFailureInFunction:file:lineNumber:description:", v64, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 956, @"invalid nil value for '%s'", "newImageGeometry");
    if (a4)
    {
LABEL_3:
      if (a5) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  v65 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v66 = [NSString stringWithUTF8String:"+[TSDImageInfo adjustIncomingImageGeometry:maskGeometry:forImageData:maskedWithInstantAlphaPath:withNaturalSize:forTargetImageGeometry:withTargetMaskGeometry:]"];
  objc_msgSend(v65, "handleFailureInFunction:file:lineNumber:description:", v66, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 957, @"invalid nil value for '%s'", "newMaskGeometry");
  if (a5)
  {
LABEL_4:
    if (a8) {
      goto LABEL_5;
    }
LABEL_18:
    v69 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v70 = [NSString stringWithUTF8String:"+[TSDImageInfo adjustIncomingImageGeometry:maskGeometry:forImageData:maskedWithInstantAlphaPath:withNaturalSize:forTargetImageGeometry:withTargetMaskGeometry:]"];
    objc_msgSend(v69, "handleFailureInFunction:file:lineNumber:description:", v70, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 960, @"invalid nil value for '%s'", "targetImageGeometry");
    if (a9) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_17:
  v67 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v68 = [NSString stringWithUTF8String:"+[TSDImageInfo adjustIncomingImageGeometry:maskGeometry:forImageData:maskedWithInstantAlphaPath:withNaturalSize:forTargetImageGeometry:withTargetMaskGeometry:]"];
  objc_msgSend(v67, "handleFailureInFunction:file:lineNumber:description:", v68, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 958, @"invalid nil value for '%s'", "newImageData");
  if (!a8) {
    goto LABEL_18;
  }
LABEL_5:
  if (a9) {
    goto LABEL_6;
  }
LABEL_19:
  v71 = [TSDInfoGeometry alloc];
  [a8 size];
  a9 = -[TSDInfoGeometry initWithPosition:size:](v71, "initWithPosition:size:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v72, v73);
LABEL_6:
  [a9 transformedBounds];
  double v18 = v17;
  double v20 = v19;
  v21 = objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", a5, 0);
  v22 = v21;
  double v23 = v20;
  double v24 = v18;
  if (v21)
  {
    [v21 naturalSize];
    double v24 = TSDFitOrFillSizeInSize(1, v25, v26, v18, v20);
    double v23 = v27;
  }
  if (!a6) {
    goto LABEL_21;
  }
  if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    v74 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v75 = [NSString stringWithUTF8String:"+[TSDImageInfo adjustIncomingImageGeometry:maskGeometry:forImageData:maskedWithInstantAlphaPath:withNaturalSize:forTargetImageGeometry:withTargetMaskGeometry:]"];
    objc_msgSend(v74, "handleFailureInFunction:file:lineNumber:description:", v75, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 982, @"instant alpha paths require non-zero natural sizes");
LABEL_21:
    float v76 = v24;
    float v77 = v23;
    objc_msgSend(a3, "setSize:", fmaxf(v76, 1.0), fmaxf(v77, 1.0));
    [a9 center];
    if (a8)
    {
      double v98 = v79;
      double v100 = v78;
      [a8 transform];
      double v79 = v98;
      double v78 = v100;
      float64x2_t v81 = v101;
      float64x2_t v80 = v102;
      float64x2_t v82 = v103;
    }
    else
    {
      float64x2_t v82 = 0uLL;
      float64x2_t v81 = 0uLL;
      float64x2_t v80 = 0uLL;
    }
    objc_msgSend(a3, "setCenter:", vaddq_f64(v82, vmlaq_n_f64(vmulq_n_f64(v80, v79), v81, v78)));
    [a3 size];
    double v83 = TSDRectWithSize();
    double v87 = TSDCenterOfRect(v83, v84, v85, v86);
    goto LABEL_27;
  }
  [v22 naturalSize];
  double v30 = v29;
  double v32 = v31;
  CGAffineTransformMakeScale(&v108, v29 / width, v31 / height);
  [a6 transformUsingAffineTransform:&v108];
  [a6 bounds];
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  double v38 = v37;
  double v40 = v39;
  float v41 = TSDFitOrFillSizeInSize(1, v37, v39, v18, v20);
  *(float *)&double v42 = v42;
  CGFloat v43 = fmaxf(v41, 1.0) / v38;
  CGFloat v44 = fmaxf(*(float *)&v42, 1.0) / v40;
  objc_msgSend(a3, "setSize:", v30 * v43, v32 * v44);
  CGAffineTransformMakeScale(&v107, v43, v44);
  v109.origin.CGFloat x = v34;
  v109.origin.CGFloat y = v36;
  v109.size.double width = v38;
  v109.size.double height = v40;
  CGRect v110 = CGRectApplyAffineTransform(v109, &v107);
  CGFloat x = v110.origin.x;
  CGFloat y = v110.origin.y;
  CGFloat v47 = v110.size.width;
  CGFloat v48 = v110.size.height;
  double v49 = TSDRectWithSize();
  double v53 = TSDCenterOfRect(v49, v50, v51, v52);
  double v55 = v54;
  double v56 = TSDCenterOfRect(x, y, v47, v48);
  double v57 = TSDSubtractPoints(v53, v55, v56);
  [a9 center];
  if (a8)
  {
    double v97 = v59;
    double v99 = v58;
    [a8 transform];
    double v59 = v97;
    double v58 = v99;
    float64x2_t v61 = v104;
    float64x2_t v60 = v105;
    float64x2_t v62 = v106;
  }
  else
  {
    float64x2_t v62 = 0uLL;
    float64x2_t v61 = 0uLL;
    float64x2_t v60 = 0uLL;
  }
  float64x2_t v88 = vaddq_f64(v62, vmlaq_n_f64(vmulq_n_f64(v60, v59), v61, v58));
  objc_msgSend(a3, "setCenter:", TSDAddPoints(v88.f64[0], v88.f64[1], v57));
  [a3 size];
  double v89 = TSDRectWithSize();
  double v93 = TSDCenterOfRect(v89, v90, v91, v92);
  double v87 = TSDSubtractPoints(v93, v94, v57);
LABEL_27:
  [a4 setCenter:v87];
  if (![a3 heightValid] || (objc_msgSend(a3, "widthValid") & 1) == 0)
  {
    v95 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v96 = [NSString stringWithUTF8String:"+[TSDImageInfo adjustIncomingImageGeometry:maskGeometry:forImageData:maskedWithInstantAlphaPath:withNaturalSize:forTargetImageGeometry:withTargetMaskGeometry:]"];
    objc_msgSend(v95, "handleFailureInFunction:file:lineNumber:description:", v96, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 1030, @"returning an image geometry with invalid height/width.");
  }
}

- (TSDBezierPath)tracedPath
{
  objc_sync_enter(self);
  if (!self->mTracedPath)
  {
    objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", -[TSDImageInfo imageData](self, "imageData"), 0);
    objc_opt_class();
    double v3 = (void *)TSUDynamicCast();
    double v4 = v3;
    if (v3)
    {
      double v5 = (CGImage *)[v3 CGImageForNaturalSize];
      if (v5)
      {
        [(TSDExteriorTextWrap *)[(TSDDrawableInfo *)self exteriorTextWrap] alphaThreshold];
        self->mTracedPath = (TSDBezierPath *)+[TSDBezierPath tracedPathForImage:alphaThreshold:pointSpacing:](TSDBezierPath, "tracedPathForImage:alphaThreshold:pointSpacing:", v5);
        [v4 naturalSize];
        double v7 = v6;
        double v9 = v8;
        [(TSDImageInfo *)self naturalSize];
        mTracedPath = self->mTracedPath;
        if (mTracedPath && (v7 != v10 || v9 != v11))
        {
          CGAffineTransformMakeScale(&v25, v10 / v7, v11 / v9);
          [(TSDBezierPath *)mTracedPath transformUsingAffineTransform:&v25];
        }
        memset(&v24, 0, sizeof(v24));
        [v4 orientation];
        TSUImageOrientationTransform();
        memset(&v23, 0, sizeof(v23));
        if (!CGAffineTransformIsIdentity(&v23))
        {
          CGImageGetWidth(v5);
          CGImageGetHeight(v5);
          v26.origin.CGFloat x = TSDRectWithSize();
          CGAffineTransform v23 = v24;
          CGRect v27 = CGRectApplyAffineTransform(v26, &v23);
          CGFloat x = v27.origin.x;
          CGFloat y = v27.origin.y;
          CGFloat width = v27.size.width;
          CGFloat height = v27.size.height;
          double v17 = self->mTracedPath;
          CGAffineTransform v23 = v24;
          [(TSDBezierPath *)v17 transformUsingAffineTransform:&v23];
          double v18 = self->mTracedPath;
          v28.origin.CGFloat x = x;
          v28.origin.CGFloat y = y;
          v28.size.CGFloat width = width;
          v28.size.CGFloat height = height;
          double MinX = CGRectGetMinX(v28);
          v29.origin.CGFloat x = x;
          v29.origin.CGFloat y = y;
          v29.size.CGFloat width = width;
          v29.size.CGFloat height = height;
          CGFloat MinY = CGRectGetMinY(v29);
          CGAffineTransformMakeTranslation(&v22, -MinX, -MinY);
          [(TSDBezierPath *)v18 transformUsingAffineTransform:&v22];
        }
      }
    }
    if (!self->mTracedPath)
    {
      [(TSDImageInfo *)self naturalSize];
      self->mTracedPath = +[TSDBezierPath bezierPathWithRect:TSDRectWithSize()];
    }
  }
  objc_sync_exit(self);
  return self->mTracedPath;
}

- (CGSize)naturalSize
{
  objc_sync_enter(self);
  p_mNaturalSize = &self->mNaturalSize;
  if (self->mNaturalSize.width == *MEMORY[0x263F001B0]
    && self->mNaturalSize.height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    objc_msgSend((id)objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", -[TSDImageInfo imageData](self, "imageData"), 1), "naturalSize");
    p_mNaturalSize->double width = v5;
    self->mNaturalSize.double height = v6;
  }
  objc_sync_exit(self);
  double width = p_mNaturalSize->width;
  double height = self->mNaturalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNaturalSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  p_mNaturalSize = &self->mNaturalSize;
  if (a3.width != self->mNaturalSize.width || a3.height != self->mNaturalSize.height)
  {
    objc_sync_enter(self);
    [(TSPObject *)self willModify];
    p_mNaturalSize->CGFloat width = width;
    p_mNaturalSize->CGFloat height = height;
    objc_sync_exit(self);
  }
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__TSDImageInfo_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1758;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __37__TSDImageInfo_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  id v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDImageInfo mixingTypeWithObject:]_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 1112, @"nil object after cast");
  }
  if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "imageData"), "isEqual:", objc_msgSend(v2, "imageData")))return 1; {
  uint64_t v5 = TSDMixingTypeBestFromMixingTypes(5, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "geometry"), "mixingTypeWithObject:", objc_msgSend(v2, "geometry")));
  }
  uint64_t v6 = TSDMixingTypeBestFromMixingTypes(v5, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "imageStyle"), "mixingTypeWithObject:", objc_msgSend(v2, "imageStyle")));
  uint64_t v7 = TSDMixingTypeWithPossiblyNilObjects([*(id *)(a1 + 40) maskInfo], objc_msgSend(v2, "maskInfo"));
  uint64_t result = TSDMixingTypeBestFromMixingTypes(v6, v7);
  if (result == 3) {
    return 2;
  }
  return result;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__TSDImageInfo_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDImageInfo *__49__TSDImageInfo_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  id v2 = (void *)TSUDynamicCast();
  uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "geometry"), "mixedObjectWithFraction:ofObject:", objc_msgSend(v2, "geometry"), *(double *)(a1 + 48));
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "imageStyle"), "mixedObjectWithFraction:ofObject:", objc_msgSend(v2, "imageStyle"), *(double *)(a1 + 48));
  uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "maskInfo"), "mixedObjectWithFraction:ofObject:", objc_msgSend(v2, "maskInfo"), *(double *)(a1 + 48));
  uint64_t v6 = -[TSDImageInfo initWithContext:geometry:style:imageData:originalImageData:]([TSDImageInfo alloc], "initWithContext:geometry:style:imageData:originalImageData:", [*(id *)(a1 + 40) context], v3, v4, objc_msgSend(*(id *)(a1 + 40), "imageData"), 0);
  [(TSDImageInfo *)v6 setMaskInfo:v5];
  return v6;
}

+ (id)bootstrapPropertyMapForPresetIndex:(unint64_t)a3 inTheme:(id)a4 alternate:(int)a5
{
  uint64_t v7 = (void *)[a4 colors];
  if (!v7)
  {
    double v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"+[TSDImageInfo bootstrapPropertyMapForPresetIndex:inTheme:alternate:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 1174, @"invalid nil value for '%s'", "colors");
  }
  double v10 = objc_alloc_init(TSSPropertyMap);
  if (a5 <= 5 && ((1 << a5) & 0x2B) != 0)
  {
    switch(a3)
    {
      case 1uLL:
        double v11 = [TSDReflection alloc];
        double v12 = 0.5;
        goto LABEL_9;
      case 2uLL:
        double v17 = [TSDDropShadow alloc];
        uint64_t v18 = objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 2), "CGColor");
        double v19 = 270.0;
        double v20 = 0.7;
        double v21 = 10.0;
        double v22 = 20.0;
        goto LABEL_16;
      case 3uLL:
        CGAffineTransform v23 = v7;
        uint64_t v24 = 5;
        goto LABEL_18;
      case 4uLL:
        uint64_t v25 = [v7 objectAtIndex:5];
        double v26 = 2.0;
        goto LABEL_19;
      case 5uLL:
        CGFloat v13 = [[TSDFrame alloc] initWithFrameName:@"Modern"];
        if (v13) {
          goto LABEL_23;
        }
        uint64_t v27 = [MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v28 = [NSString stringWithUTF8String:"+[TSDImageInfo bootstrapPropertyMapForPresetIndex:inTheme:alternate:]"];
        uint64_t v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"];
        double v30 = (void *)v27;
        uint64_t v31 = v28;
        uint64_t v32 = 1216;
        goto LABEL_22;
      default:
        goto LABEL_25;
    }
  }
  switch(a3)
  {
    case 1uLL:
      double v11 = [TSDReflection alloc];
      double v12 = 0.27;
LABEL_9:
      CGFloat v13 = [(TSDReflection *)v11 initWithOpacity:v12];
      CGFloat v14 = v10;
      CGFloat v15 = v13;
      uint64_t v16 = 519;
      goto LABEL_24;
    case 2uLL:
      double v17 = [TSDDropShadow alloc];
      uint64_t v18 = objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 2), "CGColor");
      double v19 = 320.0;
      double v20 = 0.59;
      double v21 = 6.0;
      double v22 = 7.0;
LABEL_16:
      CGFloat v13 = [(TSDDropShadow *)v17 initWithAngle:v18 offset:1 radius:v19 opacity:v21 color:v22 enabled:v20];
      CGFloat v14 = v10;
      CGFloat v15 = v13;
      uint64_t v16 = 520;
      goto LABEL_24;
    case 3uLL:
      CGAffineTransform v23 = v7;
      uint64_t v24 = 3;
LABEL_18:
      uint64_t v25 = [v23 objectAtIndex:v24];
      double v26 = 1.0;
LABEL_19:
      [(TSSPropertyMap *)v10 setObject:+[TSDStroke strokeWithColor:v25 width:v26] forProperty:517];
      break;
    case 5uLL:
      CGFloat v13 = [[TSDFrame alloc] initWithFrameName:@"Modern"];
      if (!v13)
      {
        uint64_t v33 = [MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v34 = [NSString stringWithUTF8String:"+[TSDImageInfo bootstrapPropertyMapForPresetIndex:inTheme:alternate:]"];
        uint64_t v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"];
        double v30 = (void *)v33;
        uint64_t v31 = v34;
        uint64_t v32 = 1260;
LABEL_22:
        [v30 handleFailureInFunction:v31 file:v29 lineNumber:v32 description:@"Modern frame in frames bundle is NULL!"];
      }
LABEL_23:
      CGFloat v14 = v10;
      CGFloat v15 = v13;
      uint64_t v16 = 517;
LABEL_24:
      [(TSSPropertyMap *)v14 setObject:v15 forProperty:v16];

      break;
    default:
      break;
  }
LABEL_25:
  return v10;
}

+ (void)bootstrapPresetsOfKind:(id)a3 inTheme:(id)a4 alternate:(int)a5
{
}

+ (void)bootstrapPresetsOfKind:(id)a3 inTheme:(id)a4 alternate:(int)a5 reservedCount:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  unint64_t v10 = 6 - a6;
  double v11 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:6 - a6];
  if (a6 != 6)
  {
    uint64_t v12 = 0;
    if (v10 <= 1) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = v10;
    }
    do
    {
      uint64_t v14 = TSDImageStyleIdentifierString(v12);
      CGFloat v15 = -[TSSStyle initWithContext:]([TSDMediaStyle alloc], "initWithContext:", [a4 context]);
      -[TSSStyle setValuesForProperties:](v15, "setValuesForProperties:", [a1 bootstrapPropertyMapForPresetIndex:v12 inTheme:a4 alternate:v7]);
      objc_msgSend((id)objc_msgSend(a4, "stylesheet"), "addStyle:withIdentifier:", v15, v14);
      [v11 addObject:v15];

      ++v12;
    }
    while (v13 != v12);
  }
  id v16 = (id)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v11];
  [a4 setPresets:v16 ofKind:String];
}

+ (id)presetKinds
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:String];
}

- (void)acceptVisitor:(id)a3
{
}

- (TSPData)imageData
{
  return self->mImageData;
}

- (TSPData)thumbnailImageData
{
  return self->mThumbnailImageData;
}

- (TSPData)originalImageData
{
  return self->mOriginalImageData;
}

- (id)style
{
  return self->mStyle;
}

- (TSDMaskInfo)maskInfo
{
  return self->mMaskInfo;
}

- (TSDBezierPath)instantAlphaPath
{
  return self->mInstantAlphaPath;
}

- (TSDImageAdjustments)imageAdjustments
{
  return self->mImageAdjustments;
}

- (TSPData)adjustedImageData
{
  return self->mAdjustedImageData;
}

- (TSPData)thumbnailAdjustedImageData
{
  return self->mThumbnailAdjustedImageData;
}

- (void)setThumbnailAdjustedImageData:(id)a3
{
}

@end