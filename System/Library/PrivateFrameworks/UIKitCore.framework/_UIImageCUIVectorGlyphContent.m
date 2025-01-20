@interface _UIImageCUIVectorGlyphContent
- (BOOL)_canProvideCGImageDirectly;
- (BOOL)canEmitVectorDrawingCommands;
- (BOOL)canScaleImageToTargetResolution;
- (BOOL)containsNamedColorStyle:(id)a3;
- (BOOL)containsNamedColorStyles;
- (BOOL)isCGImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVectorGlyph;
- (CGImage)CGImage;
- (CGImage)_provideCGImageWithSize:(CGSize)a3 scale:(double)a4;
- (CGImage)_provideVectorGlyphCGImageWithSize:(CGSize)a3 scale:(double)a4 hierarchicalColorResolver:(id)a5;
- (CGImage)_provideVectorGlyphCGImageWithSize:(CGSize)a3 scale:(double)a4 namedColorResolver:(id)a5;
- (CGImage)_provideVectorGlyphCGImageWithSize:(CGSize)a3 scale:(double)a4 paletteColors:(id)a5;
- (CGSize)sizeInPixels;
- (_UIImageCUIVectorGlyphContent)contentWithCGImage:(CGImage *)a3;
- (_UIImageCUIVectorGlyphContent)contentWithVariableValue:(double)a3;
- (_UIImageCUIVectorGlyphContent)initWithCUIVectorGlyph:(id)a3 scale:(double)a4;
- (_UIImageCUIVectorGlyphContent)initWithScale:(double)a3;
- (double)glyphScaleFactor;
- (double)variableValue;
- (double)vectorScale;
- (id)_automaticSymbolConfiguration;
- (id)description;
- (id)outlinePath;
- (id)typeName;
- (id)vectorGlyph;
- (unint64_t)hash;
- (unint64_t)numberOfHierarchyLayers;
- (unint64_t)numberOfPaletteLayers;
- (void)_drawVectorGlyphWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 hierarchicalColorResolver:(id)a6;
- (void)_drawVectorGlyphWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 namedColorResolver:(id)a6;
- (void)_drawVectorGlyphWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 paletteColors:(id)a6;
- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6;
- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5;
- (void)dealloc;
- (void)setGlyphScaleFactor:(double)a3;
@end

@implementation _UIImageCUIVectorGlyphContent

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (+[_UIImageContent content:isEqualToContent:]((uint64_t)_UIImageContent, self, v4))
  {
    v5 = (void *)v4[5];
    v6 = self->_vectorGlyph;
    v7 = v5;
    v8 = v7;
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      if (v6) {
        BOOL v9 = v7 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (v9) {
        char v10 = 0;
      }
      else {
        char v10 = [(CUINamedVectorGlyph *)v6 isEqual:v7];
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isVectorGlyph
{
  return self->_vectorGlyph != 0;
}

- (BOOL)containsNamedColorStyles
{
  p_isMultiColor = &self->_isMultiColor;
  unsigned int explicit = atomic_load_explicit(&self->_isMultiColor, memory_order_acquire);
  if ((explicit & 0x80000000) != 0)
  {
    unsigned int explicit = [(CUINamedVectorGlyph *)self->_vectorGlyph containsNamedColorStyles];
    atomic_store(explicit, (unsigned int *)p_isMultiColor);
  }
  return explicit != 0;
}

- (id)_automaticSymbolConfiguration
{
  uint64_t v3 = [(CUINamedVectorGlyph *)self->_vectorGlyph preferredRenderingMode];
  switch(v3)
  {
    case 1:
      uint64_t v6 = +[UIImageSymbolConfiguration configurationPreferringMonochrome];
      break;
    case 2:
      uint64_t v6 = +[UIImageSymbolConfiguration configurationPreferringMulticolor];
      break;
    case 3:
      v4 = +[UIColor tintColor];
      v5 = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v4];

      goto LABEL_12;
    default:
      if (os_variant_has_internal_diagnostics())
      {
        BOOL v9 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "SF Symbol has a preferred rendering mode unsupported by UIKit. This is an internal UIKit bug.", buf, 2u);
        }
      }
      else
      {
        v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_automaticSymbolConfiguration___s_category) + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "SF Symbol has a preferred rendering mode unsupported by UIKit. This is an internal UIKit bug.", buf, 2u);
        }
      }
      v10.receiver = self;
      v10.super_class = (Class)_UIImageCUIVectorGlyphContent;
      uint64_t v6 = [(_UIImageContent *)&v10 _automaticSymbolConfiguration];
      break;
  }
  v5 = (void *)v6;
LABEL_12:
  return v5;
}

- (CGSize)sizeInPixels
{
  double width = self->_sizeInPixels.width;
  double height = self->_sizeInPixels.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)vectorScale
{
  return 2.0;
}

- (BOOL)canScaleImageToTargetResolution
{
  return 1;
}

- (BOOL)_canProvideCGImageDirectly
{
  return 1;
}

- (CGImage)_provideCGImageWithSize:(CGSize)a3 scale:(double)a4
{
  v4 = 0;
  if (a3.width > 0.0)
  {
    double height = a3.height;
    if (a3.height > 0.0)
    {
      double width = a3.width;
      [(_UIImageContent *)self size];
      BOOL v11 = width == v10 && height == v9;
      if (v11 && ([(_UIImageContent *)self scale], v12 == a4)) {
        CGImageRef v13 = CGImageRetain([(_UIImageCUIVectorGlyphContent *)self CGImage]);
      }
      else {
        CGImageRef v13 = (CGImageRef)-[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:](self->_vectorGlyph, "rasterizeImageUsingScaleFactor:forTargetSize:", a4, width, height);
      }
      v4 = v13;
      if (v13) {
        CFAutorelease(v13);
      }
    }
  }
  return v4;
}

- (CGImage)CGImage
{
  if (self->_overrideImageRef) {
    return self->_overrideImageRef;
  }
  else {
    return (CGImage *)[(CUINamedVectorGlyph *)self->_vectorGlyph image];
  }
}

- (CGImage)_provideVectorGlyphCGImageWithSize:(CGSize)a3 scale:(double)a4 namedColorResolver:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  double v10 = v9;
  if (v9)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __93___UIImageCUIVectorGlyphContent__provideVectorGlyphCGImageWithSize_scale_namedColorResolver___block_invoke;
    aBlock[3] = &unk_1E52ECB78;
    id v20 = v9;
    BOOL v11 = _Block_copy(aBlock);
  }
  else
  {
    BOOL v11 = 0;
  }
  double v12 = 0;
  if (width > 0.0 && height > 0.0)
  {
    [(_UIImageContent *)self size];
    if (width == v14 && height == v13 && ([(_UIImageContent *)self scale], v15 == a4))
    {
      if (v11) {
        CGImageRef v16 = (CGImageRef)[(CUINamedVectorGlyph *)self->_vectorGlyph imageWithColorResolver:v11];
      }
      else {
        CGImageRef v16 = CGImageRetain([(_UIImageCUIVectorGlyphContent *)self CGImage]);
      }
    }
    else
    {
      vectorGlyph = self->_vectorGlyph;
      if (v11) {
        CGImageRef v16 = (CGImageRef)-[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withColorResolver:](vectorGlyph, "rasterizeImageUsingScaleFactor:forTargetSize:withColorResolver:", v11, a4, width, height);
      }
      else {
        CGImageRef v16 = (CGImageRef)-[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:](vectorGlyph, "rasterizeImageUsingScaleFactor:forTargetSize:", a4, width, height);
      }
    }
    double v12 = v16;
    if (v16) {
      CFAutorelease(v16);
    }
  }

  return v12;
}

- (CGImage)_provideVectorGlyphCGImageWithSize:(CGSize)a3 scale:(double)a4 paletteColors:(id)a5
{
  if (a3.width <= 0.0) {
    return 0;
  }
  double height = a3.height;
  if (a3.height <= 0.0) {
    return 0;
  }
  double width = a3.width;
  id v9 = (void *)[a5 mutableCopy];
  if ([v9 count])
  {
    unint64_t v10 = 0;
    do
    {
      id v11 = [v9 objectAtIndexedSubscript:v10];
      objc_msgSend(v9, "setObject:atIndexedSubscript:", objc_msgSend(v11, "CGColor"), v10);

      ++v10;
    }
    while ([v9 count] > v10);
  }
  [(_UIImageContent *)self size];
  if (width == v13 && height == v12 && ([(_UIImageContent *)self scale], v14 == a4)) {
    uint64_t v15 = [(CUINamedVectorGlyph *)self->_vectorGlyph imageWithPaletteColors:v9];
  }
  else {
    uint64_t v15 = -[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColors:](self->_vectorGlyph, "rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColors:", v9, a4, width, height);
  }
  CGImageRef v16 = (const void *)v15;

  if (!v16) {
    return 0;
  }
  return (CGImage *)CFAutorelease(v16);
}

- (unint64_t)hash
{
  return [(CUINamedVectorGlyph *)self->_vectorGlyph hash];
}

- (_UIImageCUIVectorGlyphContent)initWithCUIVectorGlyph:(id)a3 scale:(double)a4
{
  id v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_UIImageCUIVectorGlyphContent;
  id v9 = [(_UIImageContent *)&v19 initWithScale:a4];
  if (v9)
  {
    if (!v8)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:v9 file:@"_UIImageContent.m" lineNumber:1899 description:@"Need a valid vector glyph!"];
    }
    [v8 pointSize];
    double v11 = v10;
    [v8 referencePointSize];
    v9->_glyphScaleFactor = v11 / v12;
    objc_storeStrong((id *)&v9->_vectorGlyph, a3);
    [(_UIImageContent *)v9 scale];
    double v14 = v13;
    [(CUINamedVectorGlyph *)v9->_vectorGlyph alignmentRect];
    v9->_sizeInPixels.double width = v14 * v15;
    v9->_sizeInPixels.double height = v14 * v16;
    atomic_store(0xFFFFFFFF, (unsigned int *)&v9->_isMultiColor);
    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)&v9->_numberOfHierarchyLayers);
    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)&v9->_numberOfPaletteLayers);
  }

  return v9;
}

- (void)dealloc
{
  overrideImageRef = self->_overrideImageRef;
  if (overrideImageRef) {
    CGImageRelease(overrideImageRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIImageCUIVectorGlyphContent;
  [(_UIImageCUIVectorGlyphContent *)&v4 dealloc];
}

- (_UIImageCUIVectorGlyphContent)contentWithVariableValue:(double)a3
{
  [(_UIImageCUIVectorGlyphContent *)self variableValue];
  if (v5 == a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIImageCUIVectorGlyphContent;
    id v8 = [(_UIImageContent *)&v11 contentWithVariableValue:a3];
  }
  else
  {
    uint64_t v6 = [_UIImageCUIVectorGlyphContent alloc];
    v7 = (void *)[(CUINamedVectorGlyph *)self->_vectorGlyph copy];
    [(_UIImageContent *)self scale];
    id v8 = -[_UIImageCUIVectorGlyphContent initWithCUIVectorGlyph:scale:](v6, "initWithCUIVectorGlyph:scale:", v7);

    id v9 = [(_UIImageCUIVectorGlyphContent *)v8 vectorGlyph];
    [v9 setVariableMaxValue:a3];
  }
  return v8;
}

- (double)variableValue
{
  [(CUINamedVectorGlyph *)self->_vectorGlyph variableMaxValue];
  return result;
}

- (unint64_t)numberOfHierarchyLayers
{
  p_numberOfHierarchyLayers = &self->_numberOfHierarchyLayers;
  unint64_t explicit = atomic_load_explicit(&self->_numberOfHierarchyLayers, memory_order_acquire);
  if ((explicit & 0x8000000000000000) != 0)
  {
    unint64_t explicit = [(CUINamedVectorGlyph *)self->_vectorGlyph numberOfHierarchyLayers];
    atomic_store(explicit, (unint64_t *)p_numberOfHierarchyLayers);
  }
  return explicit;
}

- (unint64_t)numberOfPaletteLayers
{
  p_numberOfPaletteLayers = &self->_numberOfPaletteLayers;
  unint64_t explicit = atomic_load_explicit(&self->_numberOfPaletteLayers, memory_order_acquire);
  if ((explicit & 0x8000000000000000) != 0)
  {
    unint64_t explicit = [(CUINamedVectorGlyph *)self->_vectorGlyph numberOfPaletteLayers];
    atomic_store(explicit, (unint64_t *)p_numberOfPaletteLayers);
  }
  return explicit;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(CUINamedVectorGlyph *)self->_vectorGlyph debugDescription];
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%p vectorGlyph:%@>", v4, self, v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vectorContent, 0);
  objc_storeStrong((id *)&self->_vectorGlyph, 0);
}

- (CGImage)_provideVectorGlyphCGImageWithSize:(CGSize)a3 scale:(double)a4 hierarchicalColorResolver:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  double v10 = v9;
  if (v9)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __100___UIImageCUIVectorGlyphContent__provideVectorGlyphCGImageWithSize_scale_hierarchicalColorResolver___block_invoke;
    aBlock[3] = &unk_1E52ECBA0;
    id v20 = v9;
    objc_super v11 = _Block_copy(aBlock);
  }
  else
  {
    objc_super v11 = 0;
  }
  double v12 = 0;
  if (width > 0.0 && height > 0.0)
  {
    [(_UIImageContent *)self size];
    if (width == v14 && height == v13 && ([(_UIImageContent *)self scale], v15 == a4))
    {
      if (v11) {
        CGImageRef v16 = (CGImageRef)[(CUINamedVectorGlyph *)self->_vectorGlyph imageWithHierarchyColorResolver:v11];
      }
      else {
        CGImageRef v16 = CGImageRetain([(_UIImageCUIVectorGlyphContent *)self CGImage]);
      }
    }
    else
    {
      vectorGlyph = self->_vectorGlyph;
      if (v11) {
        CGImageRef v16 = (CGImageRef)-[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withHierarchyColorResolver:](vectorGlyph, "rasterizeImageUsingScaleFactor:forTargetSize:withHierarchyColorResolver:", v11, a4, width, height);
      }
      else {
        CGImageRef v16 = (CGImageRef)-[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:](vectorGlyph, "rasterizeImageUsingScaleFactor:forTargetSize:", a4, width, height);
      }
    }
    double v12 = v16;
    if (v16) {
      CFAutorelease(v16);
    }
  }

  return v12;
}

- (BOOL)isCGImage
{
  return 1;
}

- (_UIImageCUIVectorGlyphContent)initWithScale:(double)a3
{
  double v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"_UIImageContent.m" lineNumber:1918 description:@"You need to use -initWithCGImage:CUIVectorGlyph:scale:"];

  return 0;
}

- (id)typeName
{
  return @"symbol";
}

- (double)glyphScaleFactor
{
  return self->_glyphScaleFactor;
}

- (id)outlinePath
{
  v2 = (void *)[(CUINamedVectorGlyph *)self->_vectorGlyph CGPath];
  if (v2)
  {
    v2 = +[UIBezierPath bezierPathWithCGPath:v2];
  }
  return v2;
}

- (BOOL)canEmitVectorDrawingCommands
{
  return 1;
}

- (id)vectorGlyph
{
  return self->_vectorGlyph;
}

- (_UIImageCUIVectorGlyphContent)contentWithCGImage:(CGImage *)a3
{
  double v5 = [_UIImageCUIVectorGlyphContent alloc];
  vectorGlyph = self->_vectorGlyph;
  [(_UIImageContent *)self scale];
  v7 = -[_UIImageCUIVectorGlyphContent initWithCUIVectorGlyph:scale:](v5, "initWithCUIVectorGlyph:scale:", vectorGlyph);
  v7->_overrideImageRef = CGImageRetain(a3);
  return v7;
}

- (BOOL)containsNamedColorStyle:(id)a3
{
  int v4 = [(CUINamedVectorGlyph *)self->_vectorGlyph containsNamedColorStyle:a3];
  if (v4) {
    atomic_store(MEMORY[0x1E4F1CC38], (unsigned int *)&self->_isMultiColor);
  }
  return v4;
}

- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5
{
  double height = a3.height;
  double width = a3.width;
  [(_UIImageContent *)self size];
  double v9 = width / v8;
  double v11 = height / v10;
  CGContextScaleCTM(a5, v9, v11);
}

- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6
{
  if (a3.width > 0.0 && a3.height > 0.0) {
    -[CUINamedVectorGlyph drawInContext:](self->_vectorGlyph, "drawInContext:", a5, a6);
  }
}

- (void)_drawVectorGlyphWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 namedColorResolver:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  id v10 = a6;
  double v11 = v10;
  if (!v10)
  {
    double v12 = 0;
    if (width <= 0.0 || height <= 0.0) {
      goto LABEL_12;
    }
LABEL_11:
    [(CUINamedVectorGlyph *)self->_vectorGlyph drawInContext:a5];
    double v12 = 0;
    goto LABEL_12;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __93___UIImageCUIVectorGlyphContent__drawVectorGlyphWithSize_scale_inContext_namedColorResolver___block_invoke;
  aBlock[3] = &unk_1E52ECB78;
  id v15 = v10;
  double v12 = _Block_copy(aBlock);

  if (width <= 0.0 || height <= 0.0) {
    goto LABEL_12;
  }
  if (!v12) {
    goto LABEL_11;
  }
  if ([(CUINamedVectorGlyph *)self->_vectorGlyph numberOfMulticolorLayers])
  {
    unint64_t v13 = 0;
    do
      [(CUINamedVectorGlyph *)self->_vectorGlyph drawMulticolorLayerAtIndex:v13++ inContext:a5 withColorResolver:v12];
    while (v13 < [(CUINamedVectorGlyph *)self->_vectorGlyph numberOfMulticolorLayers]);
  }
LABEL_12:
}

- (void)_drawVectorGlyphWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 hierarchicalColorResolver:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  id v10 = a6;
  double v11 = v10;
  if (!v10)
  {
    double v12 = 0;
    if (width <= 0.0 || height <= 0.0) {
      goto LABEL_12;
    }
LABEL_11:
    [(CUINamedVectorGlyph *)self->_vectorGlyph drawInContext:a5];
    double v12 = 0;
    goto LABEL_12;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __100___UIImageCUIVectorGlyphContent__drawVectorGlyphWithSize_scale_inContext_hierarchicalColorResolver___block_invoke;
  aBlock[3] = &unk_1E52ECBA0;
  id v15 = v10;
  double v12 = _Block_copy(aBlock);

  if (width <= 0.0 || height <= 0.0) {
    goto LABEL_12;
  }
  if (!v12) {
    goto LABEL_11;
  }
  if ([(CUINamedVectorGlyph *)self->_vectorGlyph numberOfHierarchyLayers])
  {
    unint64_t v13 = 0;
    do
      [(CUINamedVectorGlyph *)self->_vectorGlyph drawHierarchyLayerAtIndex:v13++ inContext:a5 withColorResolver:v12];
    while (v13 < [(CUINamedVectorGlyph *)self->_vectorGlyph numberOfHierarchyLayers]);
  }
LABEL_12:
}

- (void)_drawVectorGlyphWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 paletteColors:(id)a6
{
  if (a3.width > 0.0 && a3.height > 0.0)
  {
    id v11 = (id)[a6 mutableCopy];
    if ([v11 count])
    {
      unint64_t v9 = 0;
      do
      {
        id v10 = [v11 objectAtIndexedSubscript:v9];
        objc_msgSend(v11, "setObject:atIndexedSubscript:", objc_msgSend(v10, "CGColor"), v9);

        ++v9;
      }
      while ([v11 count] > v9);
    }
    [(CUINamedVectorGlyph *)self->_vectorGlyph drawInContext:a5 withPaletteColors:v11];
  }
}

- (void)setGlyphScaleFactor:(double)a3
{
  self->_glyphScaleFactor = a3;
}

@end