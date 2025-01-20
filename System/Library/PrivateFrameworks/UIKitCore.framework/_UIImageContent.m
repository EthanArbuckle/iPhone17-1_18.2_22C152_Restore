@interface _UIImageContent
+ (BOOL)content:(void *)a3 isEqualToContent:;
+ (_UIImageContent)empty;
+ (void)_cachePreparedContent:(void *)a3 forDisplayOfContent:;
- (BOOL)_canProvideCGImageDirectly;
- (BOOL)_isSameSymbolImageContentExceptVariableValue:(id)a3;
- (BOOL)canEmitVectorDrawingCommands;
- (BOOL)canRenderCIImage;
- (BOOL)canScaleImageToTargetResolution;
- (BOOL)containsNamedColorStyle:(id)a3;
- (BOOL)containsNamedColorStyles;
- (BOOL)hasCGImage;
- (BOOL)isCGImage;
- (BOOL)isCGImageOnly;
- (BOOL)isCGPDFPage;
- (BOOL)isCGSVGDocument;
- (BOOL)isCIImage;
- (BOOL)isDecompressing;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHDR;
- (BOOL)isIOSurface;
- (BOOL)isPreparedCGImage;
- (BOOL)isVectorGlyph;
- (BOOL)optimizeContentForImageSize:(CGSize)a3 completionHandler:(id)a4;
- (BOOL)prefersProvidingNonCGImageContentsDirectlyForRendering;
- (BOOL)prepareContentForDisplayWithCompletionHandler:(id)a3;
- (CGImage)CGImage;
- (CGImage)_provideCGImageWithSize:(CGSize)a3 scale:(double)a4;
- (CGImageSource)CGImageSource;
- (CGPDFPage)CGPDFPage;
- (CGSVGDocument)CGSVGDocument;
- (CGSize)CGPDFPageSize;
- (CGSize)CGSVGDocumentSize;
- (CGSize)size;
- (CGSize)sizeInPixels;
- (CIImage)CIImage;
- (CUINamedVectorGlyph)vectorGlyph;
- (NSString)typeName;
- (UIBezierPath)outlinePath;
- (UIImageSymbolConfiguration)_automaticSymbolConfiguration;
- (_UIImageContent)contentWithCGImage:(CGImage *)a3;
- (_UIImageContent)init;
- (_UIImageContent)initWithScale:(double)a3;
- (__IOSurface)IOSurface;
- (double)imageMaximumHeadroom;
- (double)scale;
- (double)variableValue;
- (double)vectorScale;
- (id)_existingPreparedContentForDisplay;
- (id)contentOptimizedForImageSize:(CGSize)a3;
- (id)contentPreparedForDisplay;
- (id)debugDescription;
- (id)debugQuickLookObject;
- (id)imageRendererFormat;
- (id)renditionApplyingEffect:(id)a3;
- (id)renditionWithSize:(CGSize)a3 scale:(double)a4 applyingEffect:(id)a5;
- (unint64_t)hash;
- (unint64_t)numberOfHierarchyLayers;
- (unint64_t)numberOfPaletteLayers;
- (void)_drawVectorGlyphWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 hierarchicalColorResolver:(id)a6;
- (void)_drawVectorGlyphWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 namedColorResolver:(id)a6;
- (void)_drawVectorGlyphWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 paletteColors:(id)a6;
- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5;
- (void)_setCGImageSource:(CGImageSource *)a3;
- (void)setIsDecompressing:(BOOL)a3;
@end

@implementation _UIImageContent

+ (BOOL)content:(void *)a3 isEqualToContent:
{
  id v4 = a2;
  id v5 = a3;
  self;
  if (v4 == v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
    if (v4 && v5)
    {
      uint64_t v7 = objc_opt_class();
      if (v7 == objc_opt_class())
      {
        [v4 scale];
        double v9 = v8;
        [v5 scale];
        BOOL v6 = v9 == v10;
      }
      else
      {
        BOOL v6 = 0;
      }
    }
  }

  return v6;
}

- (BOOL)isVectorGlyph
{
  return 0;
}

- (double)scale
{
  return self->_scale;
}

- (UIImageSymbolConfiguration)_automaticSymbolConfiguration
{
  return +[UIImageSymbolConfiguration unspecifiedConfiguration];
}

- (BOOL)containsNamedColorStyles
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  return +[_UIImageContent content:isEqualToContent:]((uint64_t)_UIImageContent, self, a3);
}

- (double)variableValue
{
  return INFINITY;
}

+ (_UIImageContent)empty
{
  if (qword_1EB25B1A8 != -1) {
    dispatch_once(&qword_1EB25B1A8, &__block_literal_global_182);
  }
  v2 = (void *)qword_1EB25B1A0;
  return (_UIImageContent *)v2;
}

- (CGSize)size
{
  [(_UIImageContent *)self sizeInPixels];
  double scale = self->_scale;
  double v5 = v4 / scale;
  double v7 = v6 / scale;
  result.height = v7;
  result.width = v5;
  return result;
}

- (BOOL)prefersProvidingNonCGImageContentsDirectlyForRendering
{
  return 0;
}

- (double)vectorScale
{
  return self->_scale;
}

- (BOOL)isCIImage
{
  return 0;
}

- (BOOL)canScaleImageToTargetResolution
{
  return 0;
}

- (id)renditionWithSize:(CGSize)a3 scale:(double)a4 applyingEffect:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  if (a4 <= 0.0)
  {
    [(_UIImageContent *)self scale];
    a4 = v10;
  }
  int v11 = _UIImageDummyImageContentRendering();
  if (v11)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke;
    aBlock[3] = &unk_1E52EC910;
    aBlock[4] = self;
    *(double *)&aBlock[5] = a4;
    *(double *)&aBlock[6] = width;
    *(double *)&aBlock[7] = height;
    id v12 = _Block_copy(aBlock);
LABEL_15:
    v19 = 0;
LABEL_16:
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__77;
    v32[4] = __Block_byref_object_dispose__77;
    id v33 = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_29;
    v26[3] = &unk_1E52ECAE0;
    v28 = v32;
    double v29 = a4;
    double v30 = width;
    double v31 = height;
    id v12 = v12;
    id v27 = v12;
    v18 = _Block_copy(v26);

    _Block_object_dispose(v32, 8);
    goto LABEL_17;
  }
  [(_UIImageContent *)self size];
  if (v14 == width
    && v13 == height
    && ([(_UIImageContent *)self scale], a4 == v15)
    && [(_UIImageContent *)self hasCGImage])
  {
    v16 = self;
    uint64_t v17 = [(_UIImageContent *)v16 CGImage];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_2;
    v53[3] = &__block_descriptor_40_e15___CGImage__8__0l;
    v53[4] = v17;
    v18 = _Block_copy(v53);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_3;
    v52[3] = &unk_1E52EC910;
    v52[4] = v16;
    *(double *)&v52[5] = width;
    *(double *)&v52[6] = height;
    *(double *)&v52[7] = a4;
    id v12 = _Block_copy(v52);
    v19 = 0;
  }
  else
  {
    if (![(_UIImageContent *)self _canProvideCGImageDirectly])
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_20;
      v34[3] = &unk_1E52EC9D0;
      v34[4] = self;
      double v36 = width;
      double v37 = height;
      double v38 = a4;
      id v35 = v9;
      id v12 = _Block_copy(v34);

      goto LABEL_15;
    }
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_4;
    v46[3] = &unk_1E52EC9A8;
    id v20 = v9;
    id v47 = v20;
    v48 = self;
    double v49 = width;
    double v50 = height;
    double v51 = a4;
    v18 = _Block_copy(v46);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_7;
    v41[3] = &unk_1E52EC9D0;
    v41[4] = self;
    double v43 = width;
    double v44 = height;
    double v45 = a4;
    id v21 = v20;
    id v42 = v21;
    id v12 = _Block_copy(v41);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_10;
    v39[3] = &unk_1E52ECA90;
    id v40 = v21;
    v19 = _Block_copy(v39);
  }
  int v11 = 1;
  if (!v18) {
    goto LABEL_16;
  }
LABEL_17:
  v22 = +[_UIImageContentRenditionResult resultWithDrawingProvider:CGImageProvider:rbSymbolConfigurationProvider:]((uint64_t)_UIImageContentRenditionResult, v12, v18, v19);
  if (v9 && v11)
  {
    uint64_t v23 = [(_UIImageContentContextualEffect *)(uint64_t)v9 _renditionWithRenditionResult:width size:height];
  }
  else
  {
    uint64_t v23 = +[_UIImageContentRendition renditionWithResult:]((uint64_t)_UIImageContentRendition, v22);
  }
  v24 = (void *)v23;

  return v24;
}

- (BOOL)hasCGImage
{
  return 0;
}

- (BOOL)isHDR
{
  return 0;
}

- (CIImage)CIImage
{
  return 0;
}

- (_UIImageContent)initWithScale:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIImageContent;
  CGSize result = [(_UIImageContent *)&v6 init];
  if (result)
  {
    double v5 = 1.0;
    if (a3 > 0.0) {
      double v5 = a3;
    }
    result->_double scale = v5;
  }
  return result;
}

- (void)_setCGImageSource:(CGImageSource *)a3
{
}

- (CGImage)CGImage
{
  return 0;
}

- (BOOL)isDecompressing
{
  return 0;
}

- (id)imageRendererFormat
{
  return +[UIGraphicsImageRendererFormat preferredFormat];
}

- (id)_existingPreparedContentForDisplay
{
  id v1 = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_35);
    id v1 = [(id)qword_1EB25B1C0 objectForKey:v1];
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_35);
  }
  return v1;
}

+ (void)_cachePreparedContent:(void *)a3 forDisplayOfContent:
{
  id v8 = a3;
  id v4 = a2;
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_35);
  double v5 = (void *)qword_1EB25B1C0;
  if (!qword_1EB25B1C0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    double v7 = (void *)qword_1EB25B1C0;
    qword_1EB25B1C0 = v6;

    double v5 = (void *)qword_1EB25B1C0;
  }
  [v5 setObject:v4 forKey:v8];
  [(id)qword_1EB25B1C0 setObject:v4 forKey:v4];

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_35);
}

- (BOOL)isCGImageOnly
{
  uint64_t v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (_UIImageContent)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UIImageContent.m" lineNumber:91 description:@"You can't just init an _UIImageContent!"];

  return 0;
}

- (NSString)typeName
{
  return (NSString *)@"generic";
}

- (BOOL)isCGImage
{
  return 0;
}

- (BOOL)isPreparedCGImage
{
  return 0;
}

- (double)imageMaximumHeadroom
{
  BOOL v2 = [(_UIImageContent *)self isHDR];
  double result = 1.0;
  if (v2) {
    return 8.0;
  }
  return result;
}

- (BOOL)canEmitVectorDrawingCommands
{
  return 0;
}

- (BOOL)_canProvideCGImageDirectly
{
  return 0;
}

- (CGImageSource)CGImageSource
{
  return (CGImageSource *)objc_getAssociatedObject(self, &_UIImageContentCGImageSourceKey);
}

- (id)contentPreparedForDisplay
{
  return 0;
}

- (BOOL)prepareContentForDisplayWithCompletionHandler:(id)a3
{
  return 0;
}

- (id)contentOptimizedForImageSize:(CGSize)a3
{
  return 0;
}

- (BOOL)optimizeContentForImageSize:(CGSize)a3 completionHandler:(id)a4
{
  return 0;
}

- (BOOL)canRenderCIImage
{
  return 0;
}

- (__IOSurface)IOSurface
{
  return 0;
}

- (BOOL)isIOSurface
{
  return 0;
}

- (CGPDFPage)CGPDFPage
{
  return 0;
}

- (BOOL)isCGPDFPage
{
  return 0;
}

- (CGSize)CGPDFPageSize
{
  if ([(_UIImageContent *)self isCGPDFPage])
  {
    v3 = self;
    CGRect BoxRect = CGPDFPageGetBoxRect([(_UIImageContent *)v3 CGPDFPage], kCGPDFMediaBox);
    double width = BoxRect.size.width;
    double height = BoxRect.size.height;
    [(_UIImageContent *)v3 vectorScale];
    double v7 = width / v6;
    [(_UIImageContent *)v3 vectorScale];
    double v9 = height / v8;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB30];
    double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v10 = v7;
  result.double height = v9;
  result.double width = v10;
  return result;
}

- (CGSVGDocument)CGSVGDocument
{
  return 0;
}

- (BOOL)isCGSVGDocument
{
  return 0;
}

- (CGSize)CGSVGDocumentSize
{
  if ([(_UIImageContent *)self isCGSVGDocument])
  {
    v3 = self;
    [(_UIImageContent *)v3 CGSVGDocument];
    CGSVGDocumentGetCanvasSize();
    double v5 = v4;
    double v7 = v6;
    [(_UIImageContent *)v3 vectorScale];
    double v9 = v5 / v8;
    [(_UIImageContent *)v3 vectorScale];
    double v11 = v7 / v10;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB30];
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v12 = v9;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (BOOL)containsNamedColorStyle:(id)a3
{
  return 0;
}

- (unint64_t)numberOfHierarchyLayers
{
  return 0;
}

- (unint64_t)numberOfPaletteLayers
{
  return 0;
}

- (CUINamedVectorGlyph)vectorGlyph
{
  return 0;
}

- (UIBezierPath)outlinePath
{
  return 0;
}

- (unint64_t)hash
{
  return (unint64_t)self->_scale;
}

- (_UIImageContent)contentWithCGImage:(CGImage *)a3
{
  return 0;
}

- (BOOL)_isSameSymbolImageContentExceptVariableValue:(id)a3
{
  id v4 = a3;
  double v5 = [(_UIImageContent *)self vectorGlyph];
  [v5 variableMinValue];
  if (v6 != INFINITY || ([v5 variableMaxValue], v7 != INFINITY))
  {
    double v8 = (void *)[v5 copy];

    [v8 setVariableMinValue:INFINITY];
    [v8 setVariableMaxValue:INFINITY];
    double v5 = v8;
  }
  double v9 = [v4 vectorGlyph];
  [v9 variableMinValue];
  if (v10 != INFINITY || ([v9 variableMaxValue], v11 != INFINITY))
  {
    double v12 = (void *)[v9 copy];

    [v12 setVariableMinValue:INFINITY];
    [v12 setVariableMaxValue:INFINITY];
    double v9 = v12;
  }
  char v13 = 0;
  if (v5 && v9) {
    char v13 = [v5 isEqual:v9];
  }

  return v13;
}

- (id)renditionApplyingEffect:(id)a3
{
  id v4 = a3;
  [(_UIImageContent *)self size];
  double v6 = v5;
  double v8 = v7;
  [(_UIImageContent *)self scale];
  double v10 = -[_UIImageContent renditionWithSize:scale:applyingEffect:](self, "renditionWithSize:scale:applyingEffect:", v4, v6, v8, v9);

  return v10;
}

- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5
{
  [(_UIImageContent *)self scale];
  double v8 = a4 / v7;
  CGContextScaleCTM(a5, v8, v8);
}

- (CGImage)_provideCGImageWithSize:(CGSize)a3 scale:(double)a4
{
  return 0;
}

- (void)_drawVectorGlyphWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 namedColorResolver:(id)a6
{
}

- (void)_drawVectorGlyphWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 hierarchicalColorResolver:(id)a6
{
}

- (void)_drawVectorGlyphWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 paletteColors:(id)a6
{
}

- (id)debugDescription
{
  [(_UIImageContent *)self size];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  double v7 = NSString;
  uint64_t v8 = objc_opt_class();
  double v9 = [(_UIImageContent *)self description];
  double v10 = [v7 stringWithFormat:@"<%@:%p (%g,%g) [%@]>", v8, self, v4, v6, v9];

  return v10;
}

- (id)debugQuickLookObject
{
  id v2 = [[UIImage alloc] _initWithContent:self orientation:0];
  return v2;
}

- (CGSize)sizeInPixels
{
  double width = self->_sizeInPixels.width;
  double height = self->_sizeInPixels.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIsDecompressing:(BOOL)a3
{
  self->_isDecompressing = a3;
}

@end