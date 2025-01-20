@interface _UIImageMultiVectorGlyphContent
- (BOOL)canEmitVectorDrawingCommands;
- (BOOL)canScaleImageToTargetResolution;
- (BOOL)containsNamedColorStyles;
- (BOOL)isCGImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVectorGlyph;
- (CGImage)CGImage;
- (CGSize)sizeInPixels;
- (_UIImageMultiVectorGlyphContent)initWithScale:(double)a3;
- (_UIImageMultiVectorGlyphContent)initWithSize:(CGSize)a3 glyphs:(id)a4 colors:(id)a5 offsets:(id)a6 scaleFactors:(id)a7 anchorPoint:(CGPoint)a8;
- (double)vectorScale;
- (id)description;
- (id)typeName;
- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6;
- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5;
- (void)dealloc;
@end

@implementation _UIImageMultiVectorGlyphContent

- (_UIImageMultiVectorGlyphContent)initWithSize:(CGSize)a3 glyphs:(id)a4 colors:(id)a5 offsets:(id)a6 scaleFactors:(id)a7 anchorPoint:(CGPoint)a8
{
  CGFloat y = a8.y;
  CGFloat x = a8.x;
  double height = a3.height;
  double width = a3.width;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  if (![v17 count])
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2 object:self file:@"_UIImageContent.m" lineNumber:2314 description:@"Need to pass some glyhps"];
  }
  v21 = [v17 objectAtIndexedSubscript:0];
  [v21 scale];
  v36.receiver = self;
  v36.super_class = (Class)_UIImageMultiVectorGlyphContent;
  v22 = -[_UIImageContent initWithScale:](&v36, sel_initWithScale_);

  if (v22)
  {
    uint64_t v23 = [v17 copy];
    glyphs = v22->_glyphs;
    v22->_glyphs = (NSArray *)v23;

    uint64_t v25 = [v18 copy];
    colors = v22->_colors;
    v22->_colors = (NSArray *)v25;

    uint64_t v27 = [v19 copy];
    offsets = v22->_offsets;
    v22->_offsets = (NSArray *)v27;

    uint64_t v29 = [v20 copy];
    scaleFactors = v22->_scaleFactors;
    v22->_scaleFactors = (NSArray *)v29;

    [(_UIImageContent *)v22 scale];
    CGFloat v32 = width * v31;
    [(_UIImageContent *)v22 scale];
    v22->_sizeInPixels.double width = v32;
    v22->_sizeInPixels.double height = height * v33;
    v22->_anchorPoint.CGFloat x = x;
    v22->_anchorPoint.CGFloat y = y;
  }

  return v22;
}

- (_UIImageMultiVectorGlyphContent)initWithScale:(double)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"_UIImageContent.m" lineNumber:2332 description:@"You need to use -initWithCGImage:CUIVectorGlyph:scale:symbolScaleFactor:"];

  return 0;
}

- (void)dealloc
{
  imageRef = self->_imageRef;
  if (imageRef) {
    CGImageRelease(imageRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIImageMultiVectorGlyphContent;
  [(_UIImageMultiVectorGlyphContent *)&v4 dealloc];
}

- (id)typeName
{
  return @"multiSymbol";
}

- (BOOL)isCGImage
{
  return 1;
}

- (BOOL)canScaleImageToTargetResolution
{
  return 1;
}

- (BOOL)canEmitVectorDrawingCommands
{
  return 0;
}

- (BOOL)isVectorGlyph
{
  return 1;
}

- (BOOL)containsNamedColorStyles
{
  return 1;
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

- (CGImage)CGImage
{
  CGSize result = self->_imageRef;
  if (!result)
  {
    [(_UIImageContent *)self scale];
    double v5 = v4;
    [(_UIImageContent *)self size];
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    v10 = +[UIGraphicsImageRendererFormat preferredFormat];
    [v10 setScale:v5];
    v11 = [UIGraphicsImageRenderer alloc];
    [(_UIImageContent *)self size];
    v12 = -[UIGraphicsImageRenderer initWithSize:format:](v11, "initWithSize:format:", v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42___UIImageMultiVectorGlyphContent_CGImage__block_invoke;
    v14[3] = &unk_1E52ECBC8;
    v14[4] = self;
    v14[5] = v7;
    v14[6] = v9;
    *(double *)&v14[7] = v5;
    id v13 = [(UIGraphicsImageRenderer *)v12 imageWithActions:v14];
    self->_imageRef = (CGImage *)CFRetain((CFTypeRef)[v13 CGImage]);

    return self->_imageRef;
  }
  return result;
}

- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5
{
  double height = a3.height;
  double width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)_UIImageMultiVectorGlyphContent;
  [(_UIImageContent *)&v11 _prepareForDrawingWithSize:a3.width scale:a3.height inContext:a4];
  CGContextTranslateCTM(a5, 0.0, height);
  CGContextScaleCTM(a5, 1.0, -1.0);
  [(_UIImageContent *)self size];
  CGContextScaleCTM(a5, width / v9, height / v10);
}

- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id rect_8 = a6;
  [(_UIImageContent *)self size];
  double v64 = v12;
  double v65 = v11;
  uint64_t v13 = 40;
  if ([(NSArray *)self->_glyphs count])
  {
    unint64_t v14 = 0;
    v15 = &OBJC_IVAR____UIImageMultiVectorGlyphContent__colors;
    CGFloat v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    CGFloat v61 = *MEMORY[0x1E4F1DAD8];
    CGFloat v62 = width;
    unint64_t v17 = 0x1E4F1C000uLL;
    id v18 = &OBJC_IVAR____UIImageMultiVectorGlyphContent__scaleFactors;
    double v19 = 1.0;
    double v63 = height;
    uint64_t v60 = 40;
    do
    {
      CGContextSaveGState(a5);
      id v20 = [*(id *)((char *)&self->super.super.isa + v13) objectAtIndexedSubscript:v14];
      v21 = [*(id *)((char *)&self->super.super.isa + v15[1]) objectAtIndexedSubscript:v14];
      [v21 CGPointValue];
      double v23 = v22;
      double v25 = v24;

      id v26 = [*(id *)((char *)&self->super.super.isa + *v15) objectAtIndexedSubscript:v14];
      id v27 = [*(id *)(v17 + 2712) null];

      if (v26 == v27)
      {

        id v26 = 0;
      }
      objc_msgSend(v20, "size", v60);
      double v29 = v28;
      double v31 = v30;
      CGFloat v32 = [*(id *)((char *)&self->super.super.isa + *v18) objectAtIndexedSubscript:v14];
      [v32 floatValue];
      double v34 = v33;

      double v35 = v29 * v34;
      objc_super v36 = (double *)((char *)self + v18[2]);
      UIRoundToScale(v23 + (v65 - v35) * *v36, a4);
      CGFloat rect = v37;
      double v38 = v31 * v34;
      UIRoundToScale((v64 - v38) * (v19 - v36[1]) - v25, a4);
      CGFloat v40 = v39;
      UIRoundToScale(v35, a4);
      double v42 = v41;
      UIRoundToScale(v38, a4);
      CGFloat v44 = v43;
      if (!rect_8 || v26)
      {
        v46 = objc_msgSend(v20, "renditionWithSize:scale:applyingEffect:", 0, v42, v43, a4);
        CGFloat v48 = v63;
        if (v26) {
          goto LABEL_10;
        }
      }
      else
      {
        uint64_t v45 = objc_msgSend(v20, "renditionWithSize:scale:applyingEffect:", rect_8, v42, v43, a4);
        v46 = (void *)v45;
        if (v45) {
          v47 = *(void **)(v45 + 40);
        }
        else {
          v47 = 0;
        }
        CGFloat v48 = v63;
        id v26 = v47;
        if (v26)
        {
LABEL_10:
          [v26 alphaComponent];
          if (v49 > 0.0)
          {
            CGFloat v50 = v40;
            [v26 alphaComponent];
            if (v51 >= v19)
            {
              CGFloat v58 = v61;
              CGFloat v57 = v62;
            }
            else
            {
              CGContextSaveGState(a5);
              CGContextSetBlendMode(a5, kCGBlendModeDestinationOut);
              CGContextBeginTransparencyLayer(a5, 0);
              v52 = (CGImage *)-[_UIImageContentRendition CGImage]((uint64_t)v46);
              v69.origin.CGFloat x = rect;
              v69.origin.CGFloat y = v40;
              v69.size.CGFloat width = v42;
              v69.size.CGFloat height = v44;
              CGContextDrawImage(a5, v69, v52);
              CGContextScaleCTM(a5, a4, a4);
              +[UIColor blackColor];
              v53 = v18;
              v54 = v15;
              v56 = unint64_t v55 = v17;
              [v56 setFill];

              unint64_t v17 = v55;
              v15 = v54;
              id v18 = v53;
              uint64_t v13 = v60;
              CGContextSetBlendMode(a5, kCGBlendModeSourceIn);
              CGFloat v58 = v61;
              CGFloat v57 = v62;
              v70.origin.CGFloat x = v61;
              v70.origin.CGFloat y = v16;
              v70.size.CGFloat width = v62;
              v70.size.CGFloat height = v48;
              CGContextFillRect(a5, v70);
              CGContextEndTransparencyLayer(a5);
              CGContextSetBlendMode(a5, kCGBlendModeNormal);
              CGContextRestoreGState(a5);
            }
            CGContextBeginTransparencyLayer(a5, 0);
            v59 = (CGImage *)-[_UIImageContentRendition CGImage]((uint64_t)v46);
            v71.origin.CGFloat x = rect;
            v71.origin.CGFloat y = v50;
            v71.size.CGFloat width = v42;
            v71.size.CGFloat height = v44;
            CGContextDrawImage(a5, v71, v59);
            CGContextScaleCTM(a5, a4, a4);
            [v26 setFill];
            CGContextSetBlendMode(a5, kCGBlendModeSourceIn);
            v72.origin.CGFloat x = v58;
            v72.origin.CGFloat y = v16;
            v72.size.CGFloat width = v57;
            v72.size.CGFloat height = v48;
            CGContextFillRect(a5, v72);
            CGContextEndTransparencyLayer(a5);
            double v19 = 1.0;
          }
          goto LABEL_17;
        }
      }
      -[_UIImageContentRendition drawInContext:]((uint64_t)v46);
LABEL_17:
      CGContextRestoreGState(a5);

      ++v14;
    }
    while (v14 < [*(id *)((char *)&self->super.super.isa + v13) count]);
  }
}

- (id)description
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_glyphs, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v4 = self->_glyphs;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * v8);
        if (v9) {
          id v10 = *(id *)(v9 + 40);
        }
        else {
          id v10 = 0;
        }
        double v11 = [v10 name];
        [v3 addObject:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v12 = [(NSArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v6 = v12;
    }
    while (v12);
  }

  uint64_t v13 = NSString;
  NSUInteger v14 = [(NSArray *)self->_glyphs count];
  v15 = [v3 componentsJoinedByString:@","];
  CGFloat v16 = [v13 stringWithFormat:@"composite-symbol:(%ld:%@)", v14, v15, (void)v18];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = a3;
  if (!+[_UIImageContent content:isEqualToContent:]((uint64_t)_UIImageContent, self, v4)) {
    goto LABEL_8;
  }
  uint64_t v5 = (void *)v4[5];
  uint64_t v6 = self->_glyphs;
  uint64_t v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_10;
  }
  uint64_t v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    goto LABEL_16;
  }
  int v10 = [(NSArray *)v6 isEqual:v7];

  if (v10)
  {
LABEL_10:
    colors = self->_colors;
    uint64_t v13 = (void *)v4[6];
    uint64_t v6 = colors;
    NSUInteger v14 = v13;
    if (v6 == v14)
    {
      char v11 = 1;
      uint64_t v8 = v6;
      goto LABEL_18;
    }
    uint64_t v8 = v14;
    if (v6) {
      BOOL v15 = v14 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15)
    {
      char v11 = [(NSArray *)v6 isEqual:v14];
LABEL_18:

      goto LABEL_19;
    }
LABEL_16:
    char v11 = 0;
    goto LABEL_18;
  }
LABEL_8:
  char v11 = 0;
LABEL_19:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaleFactors, 0);
  objc_storeStrong((id *)&self->_offsets, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_glyphs, 0);
}

@end