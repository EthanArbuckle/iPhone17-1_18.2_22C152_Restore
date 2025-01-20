@interface MFPhoneDeviceDriver
+ (int)getROP:(id)a3;
- (CGRect)getCanvas;
- (MFPhoneDeviceDriver)initWithCanvas:(CGRect)a3;
- (id)createBitmap:(id)a3 in_width:(int)a4 in_height:(int)a5 in_planes:(int)a6 in_bitsPerPixel:(int)a7 in_bitmap:(const char *)a8 in_bitmapSize:(unsigned int)a9;
- (id)createDIBitmap:(id)a3 in_dib:(const char *)a4 in_dibSize:(unsigned int)a5 in_usage:(int)a6;
- (id)createDIBitmap:(id)a3 in_header:(const char *)a4 in_headerSize:(unsigned int)a5 in_bitmap:(const char *)a6 in_bitmapSize:(unsigned int)a7 in_usage:(int)a8;
- (id)createFont:(int)a3;
- (id)createFont:(int)a3 lfWidth:(int)a4 lfEscapement:(int)a5 lfOrientation:(int)a6 lfWeight:(int)a7 lfItalic:(BOOL)a8 lfUnderline:(BOOL)a9 lfStrikeOut:(BOOL)a10 lfCharSet:(int)a11 lfOutPrecision:(int)a12 lfClipPrecision:(unsigned __int8)a13 lfQuality:(int)a14 pitch:(int)a15 family:(int)a16 lfFaceName:(id)a17;
- (id)createFontIndirectW:(int)a3 lfWidth:(int)a4 lfEscapement:(int)a5 lfOrientation:(int)a6 lfWeight:(int)a7 lfItalic:(BOOL)a8 lfUnderline:(BOOL)a9 lfStrikeOut:(BOOL)a10 lfCharSet:(int)a11 lfOutPrecision:(int)a12 lfClipPrecision:(unsigned __int8)a13 lfQuality:(int)a14 pitch:(int)a15 family:(int)a16 lfFaceName:(id)a17 elfFullName:(id)a18 elfStyle:(id)a19 elfVersion:(unsigned int)a20 elfStyleSize:(unsigned int)a21 elfMatch:(unsigned int)a22 elfVendorId:(unsigned int)a23 elfCulture:(unsigned int)a24;
- (id)createHatchBrush:(id)a3 in_hatchstyle:(int)a4;
- (id)createNullBrush;
- (id)createPath;
- (id)createPatternBrush:(id)a3 usePaletteForBilevel:(BOOL)a4;
- (id)createPen;
- (id)createPen:(int)a3 in_width:(int)a4 in_colour:(id)a5 in_userStyleArray:(double *)a6;
- (id)createRegionWithPath:(id)a3;
- (id)createRegionWithRects:(id)a3 in_dc:(id)a4;
- (id)createSolidBrush:(id)a3;
- (int)activateTransform:(CGAffineTransform *)a3;
- (int)alphaBlend:(id)a3 in_xDest:(int)a4 in_yDest:(int)a5 in_widthDest:(int)a6 in_heightDest:(int)a7 in_sourceImage:(id)a8 in_xSrc:(int)a9 in_ySrc:(int)a10 in_widthSrc:(int)a11 in_heightSrc:(int)a12 in_sourceConstantOpacity:(unsigned __int8)a13 in_useSourceAlphaChannel:(BOOL)a14 in_xform:(CGAffineTransform *)a15 in_colour:(unsigned int)a16;
- (int)angleArc:(id)a3 x:(int)a4 y:(int)a5 radius:(unsigned int)a6 startAngle:(double)a7 sweepAngle:(double)a8;
- (int)arc:(id)a3 nLeftRect:(int)a4 nTopRect:(int)a5 nRightRect:(int)a6 nBottomRect:(int)a7 nXStartArc:(int)a8 nYStartArc:(int)a9 nXEndArc:(int)a10 nYEndArc:(int)a11;
- (int)arcTo:(id)a3 nLeftRect:(int)a4 nTopRect:(int)a5 nRightRect:(int)a6 nBottomRect:(int)a7 nXStartArc:(int)a8 nYStartArc:(int)a9 nXEndArc:(int)a10 nYEndArc:(int)a11;
- (int)bezier:(id)a3 x:(int)a4 y:(int)a5 x2:(int)a6 y2:(int)a7 x3:(int)a8 y3:(int)a9 x4:(int)a10 y4:(int)a11;
- (int)bezierTo:(id)a3 x:(int)a4 y:(int)a5 x2:(int)a6 y2:(int)a7 x3:(int)a8 y3:(int)a9;
- (int)bitBlt:(id)a3 in_xDest:(int)a4 in_yDest:(int)a5 in_widthDest:(int)a6 in_heightDest:(int)a7 in_sourceImage:(id)a8 in_xSrc:(int)a9 in_ySrc:(int)a10 in_rop:(unsigned int)a11 in_xform:(CGAffineTransform *)a12 in_colour:(unsigned int)a13;
- (int)chord:(id)a3 leftRect:(int)a4 topRect:(int)a5 rightRect:(int)a6 bottomRect:(int)a7 xStartArc:(int)a8 yStartArc:(int)a9 xEndArc:(int)a10 yEndArc:(int)a11;
- (int)ellipse:(id)a3 x1:(int)a4 y1:(int)a5 x2:(int)a6 y2:(int)a7;
- (int)excludeClipRect:(CGRect)a3;
- (int)extTextOut:(id)a3 px:(int *)a4 py:(int *)a5 in_text:(id)a6 options:(int)a7 left:(int)a8 top:(int)a9 right:(int)a10 bottom:(int)a11 spacingValues:(int *)a12 numValues:(int)a13;
- (int)fillRectangle:(id)a3 x1:(int)a4 y1:(int)a5 x2:(int)a6 y2:(int)a7;
- (int)intersectClipRect:(CGRect)a3;
- (int)lineTo:(id)a3 x:(double)a4 y:(double)a5;
- (int)maskBlt:(id)a3 in_xDest:(int)a4 in_yDest:(int)a5 in_widthDest:(int)a6 in_heightDest:(int)a7 in_sourceImage:(id)a8 in_xSrc:(int)a9 in_ySrc:(int)a10 in_maskImage:(id)a11 in_xMask:(int)a12 in_yMask:(int)a13 in_rop:(unsigned int)a14 in_xform:(CGAffineTransform *)a15 in_colour:(unsigned int)a16;
- (int)patBlt:(id)a3 in_x:(int)a4 in_y:(int)a5 in_width:(int)a6 in_height:(int)a7 in_rop:(unsigned int)a8;
- (int)pie:(id)a3 nLeftRect:(int)a4 nTopRect:(int)a5 nRightRect:(int)a6 nBottomRect:(int)a7 nXStartArc:(int)a8 nYStartArc:(int)a9 nXEndArc:(int)a10 nYEndArc:(int)a11;
- (int)plgBlt:(id)a3 in_destinationParallelogram:(CGPoint *)a4 in_sourceImage:(id)a5 in_xSrc:(int)a6 in_ySrc:(int)a7 in_widthSrc:(int)a8 in_heightSrc:(int)a9 in_maskImage:(id)a10 in_xMask:(int)a11 in_yMask:(int)a12 in_xform:(CGAffineTransform *)a13 in_colour:(unsigned int)a14;
- (int)polyPolygon:(id)a3 in_points:(CGPoint *)a4 in_polyCounts:(int *)a5 in_count:(int)a6;
- (int)polyPolyline:(id)a3 in_points:(CGPoint *)a4 in_polyCounts:(int *)a5 in_count:(int)a6;
- (int)polygon:(id)a3 in_points:(CGPoint *)a4 in_count:(int)a5;
- (int)polyline:(id)a3 in_points:(CGPoint *)a4 in_count:(int)a5;
- (int)rectangle:(id)a3 x1:(int)a4 y1:(int)a5 x2:(int)a6 y2:(int)a7;
- (int)roundRect:(id)a3 left:(int)a4 top:(int)a5 right:(int)a6 bottom:(int)a7 rx:(double)a8 ry:(double)a9;
- (int)setMetaRgn;
- (int)setViewBox:(double)a3 top:(double)a4 width:(double)a5 height:(double)a6;
- (int)stretchBlt:(id)a3 in_xDest:(int)a4 in_yDest:(int)a5 in_widthDest:(int)a6 in_heightDest:(int)a7 in_sourceImage:(id)a8 in_xSrc:(int)a9 in_ySrc:(int)a10 in_widthSrc:(int)a11 in_heightSrc:(int)a12 in_rop:(unsigned int)a13 in_xform:(CGAffineTransform *)a14 in_colour:(unsigned int)a15;
- (int)textOut:(id)a3 px:(int *)a4 py:(int *)a5 in_text:(id)a6;
- (void)applyTransformsToCurrentContext;
- (void)drawBezierPath:(id)a3 dc:(id)a4 fill:(BOOL)a5 stroke:(BOOL)a6;
- (void)updateViewBoxTransform;
@end

@implementation MFPhoneDeviceDriver

- (MFPhoneDeviceDriver)initWithCanvas:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v18.receiver = self;
  v18.super_class = (Class)MFPhoneDeviceDriver;
  v7 = [(MFPhoneDeviceDriver *)&v18 init];
  v8 = v7;
  if (v7)
  {
    v7->m_canvas.origin.CGFloat x = x;
    v7->m_canvas.origin.CGFloat y = y;
    v7->m_canvas.size.CGFloat width = width;
    v7->m_canvas.size.CGFloat height = height;
    v9 = TCCurrentGraphicsContext();
    CGContextGetCTM(&v17, v9);
    long long v11 = *(_OWORD *)&v17.c;
    long long v10 = *(_OWORD *)&v17.tx;
    *(_OWORD *)&v8->m_canvasTransform.a = *(_OWORD *)&v17.a;
    *(_OWORD *)&v8->m_canvasTransform.c = v11;
    *(_OWORD *)&v8->m_canvasTransform.tCGFloat x = v10;
    v8->m_viewBox.origin.CGFloat x = x;
    v8->m_viewBox.origin.CGFloat y = y;
    v8->m_viewBox.size.CGFloat width = width;
    v8->m_viewBox.size.CGFloat height = height;
    v12 = (long long *)MEMORY[0x263F000D0];
    long long v13 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v8->m_viewBoxTransform.a = *MEMORY[0x263F000D0];
    long long v14 = *v12;
    *(_OWORD *)&v8->m_viewBoxTransform.c = v12[1];
    long long v15 = v12[2];
    *(_OWORD *)&v8->m_viewBoxTransform.tCGFloat x = v15;
    *(_OWORD *)&v8->m_worldToDeviceTransform.tCGFloat x = v15;
    *(_OWORD *)&v8->m_worldToDeviceTransform.a = v14;
    *(_OWORD *)&v8->m_worldToDeviceTransform.c = v13;
    *(_OWORD *)&v8->m_combinedTransform.tCGFloat x = v12[2];
    *(_OWORD *)&v8->m_combinedTransform.c = v13;
    *(_OWORD *)&v8->m_combinedTransform.a = v14;
  }
  return v8;
}

- (id)createFont:(int)a3
{
  return +[MFFont fontWithStockFont:*(void *)&a3];
}

- (id)createSolidBrush:(id)a3
{
  v3 = +[MFPhoneSolidBrush solidBrushWithColour:a3];
  return v3;
}

- (id)createPath
{
  v2 = objc_alloc_init(MFPhonePath);
  return v2;
}

- (int)activateTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->m_worldToDeviceTransform.tCGFloat x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->m_worldToDeviceTransform.c = v4;
  *(_OWORD *)&self->m_worldToDeviceTransform.a = v3;
  [(MFPhoneDeviceDriver *)self applyTransformsToCurrentContext];
  return 0;
}

- (void)updateViewBoxTransform
{
  self->m_viewBoxTransform.b = 0.0;
  self->m_viewBoxTransform.c = 0.0;
  float32x2_t v2 = vcvt_f32_f64(vdivq_f64((float64x2_t)self->m_canvas.size, (float64x2_t)self->m_viewBox.size));
  float32x2_t v3 = vcvt_f32_f64(vmlaq_f64((float64x2_t)self->m_canvas.origin, (float64x2_t)self->m_viewBox.origin, vcvtq_f64_f32(vneg_f32(v2))));
  self->m_viewBoxTransform.a = v2.f32[0];
  self->m_viewBoxTransform.d = v2.f32[1];
  *(float64x2_t *)&self->m_viewBoxTransform.tCGFloat x = vcvtq_f64_f32(v3);
  [(MFPhoneDeviceDriver *)self applyTransformsToCurrentContext];
}

- (void)drawBezierPath:(id)a3 dc:(id)a4 fill:(BOOL)a5 stroke:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v13 = a3;
  id v9 = a4;
  long long v10 = [v9 getPath];
  if ([v10 isOpen])
  {
    [v10 appendBezierPath:v13 dc:v9];
  }
  else
  {
    if (v7)
    {
      long long v11 = [v9 getBrush];
      objc_msgSend(v11, "fillPath:in_path:", v9, v13);
    }
    if (v6)
    {
      v12 = [v9 getPen];
      objc_msgSend(v12, "strokePath:in_path:", v9, v13);
    }
  }
}

+ (int)getROP:(id)a3
{
  id v3 = a3;
  long long v4 = [v3 getPath];
  if ([v4 isOpen])
  {
    int v5 = 3;
  }
  else
  {
    int v6 = [v3 getRop2];
    if (v6 == 16) {
      int v7 = 1;
    }
    else {
      int v7 = 2;
    }
    if (v6 == 1) {
      int v5 = 0;
    }
    else {
      int v5 = v7;
    }
  }

  return v5;
}

- (int)intersectClipRect:(CGRect)a3
{
  if (a3.size.width > 0.0 && a3.size.height > 0.0) {
    +[OITSUBezierPath clipRect:](OITSUBezierPath, "clipRect:", a3.origin.x, a3.origin.y, v3, v4);
  }
  return 0;
}

- (id)createNullBrush
{
  return +[MFPhoneNullBrush nullBrush];
}

- (CGRect)getCanvas
{
  double x = self->m_canvas.origin.x;
  double y = self->m_canvas.origin.y;
  double width = self->m_canvas.size.width;
  double height = self->m_canvas.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)createPen
{
  return +[MFPen pen];
}

- (int)excludeClipRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CGRectIntersectsRect(a3, self->m_canvas))
  {
    v14.origin.CGFloat x = x;
    v14.origin.CGFloat y = y;
    v14.size.CGFloat width = width;
    v14.size.CGFloat height = height;
    CGRect v15 = CGRectIntersection(v14, self->m_canvas);
    double v8 = v15.origin.x;
    double v9 = v15.origin.y;
    double v10 = v15.size.width;
    double v11 = v15.size.height;
    v12 = +[OITSUBezierPath bezierPathWithRect:](OITSUBezierPath, "bezierPathWithRect:", self->m_canvas.origin.x, self->m_canvas.origin.y, self->m_canvas.size.width, self->m_canvas.size.height);
    objc_msgSend(v12, "appendBezierPathWithRect:", v8, v9, v10, v11);
    [v12 setWindingRule:1];
    [v12 addClip];
  }
  return 0;
}

- (id)createPatternBrush:(id)a3 usePaletteForBilevel:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v6 = +[MFPhonePatternBrush patternBrushWithBitmap:v5 usePaletteForBilevel:v4];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (int)setMetaRgn
{
  return 0;
}

- (id)createRegionWithPath:(id)a3
{
  id v4 = a3;
  id v5 = -[MFPhoneRegion initWithPath:in_bounds:]([MFPhoneRegion alloc], "initWithPath:in_bounds:", v4, self->m_viewBox.origin.x, self->m_viewBox.origin.y, self->m_viewBox.size.width, self->m_viewBox.size.height);

  return v5;
}

- (int)textOut:(id)a3 px:(int *)a4 py:(int *)a5 in_text:(id)a6
{
  LODWORD(v8) = 0;
  LODWORD(v7) = 0;
  return -[MFPhoneDeviceDriver extTextOut:px:py:in_text:options:left:top:right:bottom:spacingValues:numValues:](self, "extTextOut:px:py:in_text:options:left:top:right:bottom:spacingValues:numValues:", a3, a4, a5, a6, 0, 0, 0, v7, 0, v8);
}

- (int)extTextOut:(id)a3 px:(int *)a4 py:(int *)a5 in_text:(id)a6 options:(int)a7 left:(int)a8 top:(int)a9 right:(int)a10 bottom:(int)a11 spacingValues:(int *)a12 numValues:(int)a13
{
  char v13 = a7;
  uint64_t v116 = *MEMORY[0x263EF8340];
  id v17 = a3;
  v113 = (__CFString *)a6;
  objc_super v18 = [v17 getFont];
  char v107 = v13;
  v112 = v18;
  v19 = (const void *)[v18 createCTFontEquivalent];
  int v20 = *a4;
  int v21 = *a5;
  v22 = [v17 getPath];
  if ([(__CFString *)v113 length])
  {
    if ([v17 getTextUpdateCP])
    {
      [v17 getPenPosition];
      double v24 = v23;
      double v26 = v25;
    }
    else
    {
      double v24 = (double)v20;
      double v26 = (double)v21;
    }
    v28 = v113;
    if (!v113) {
      v28 = &stru_26EBF24D8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = [v18 faceName];
      v30 = [v18 faceName];
      v31 = +[TCFontUtils stringByFixingString:v28 latinFontFamilyName:v29 symbolFontFamilyName:v30];

      v28 = v31;
      int v32 = [(__CFString *)v31 length];
      if (!v32)
      {
LABEL_22:
        CFRelease(v19);
        int v27 = 0;
        goto LABEL_108;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_22;
      }
      int v33 = [(__CFString *)v28 length];
      int v34 = v33 >= 0 ? v33 : v33 + 1;
      int v32 = v34 >> 1;
      if (!(v34 >> 1)) {
        goto LABEL_22;
      }
    }
    glyphs = (CGGlyph *)malloc_type_malloc(2 * v32, 0x1000040BDFB0063uLL);
    bzero(glyphs, 2 * v32);
    characters = (UniChar *)malloc_type_malloc(2 * (v32 + 1), 0x1000040BDFB0063uLL);
    font = (const __CTFont *)v19;
    v102 = a4;
    advances = (CGSize *)malloc_type_malloc(16 * v32, 0x1000040451B5BE8uLL);
    v35 = malloc_type_malloc(8 * v32, 0x6004044C4A2DFuLL);
    v36 = v35;
    if (glyphs && characters && advances && v35)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        -[__CFString getCharacters:range:](v28, "getCharacters:range:", characters, 0, v32);
        CTFontGetGlyphsForCharacters(font, characters, glyphs, v32);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          memcpy(glyphs, (const void *)[(__CFString *)v28 bytes], 2 * v32);
        }
      }
      CTFontGetAdvancesForGlyphs(font, kCTFontOrientationDefault, glyphs, advances, v32);
      if (v32 >= 1) {
        bzero(v36, 8 * v32);
      }
      v100 = v17;
      v114 = v28;
      v103 = v22;
      objc_opt_class();
      int v104 = v32;
      if (objc_opt_isKindOfClass())
      {
        if (v32 < 1)
        {
          char v41 = 0;
        }
        else
        {
          uint64_t v37 = 0;
          uint64_t v38 = v32;
          while (glyphs[v37])
          {
            if (v32 == ++v37)
            {
              v39 = font;
              goto LABEL_45;
            }
          }
          v117.length = [(__CFString *)v28 length];
          v117.location = 0;
          v39 = CTFontCreateForString(font, v28, v117);
          CFRelease(font);
          CTFontGetGlyphsForCharacters(v39, characters, glyphs, v32);
          CTFontGetAdvancesForGlyphs(v39, kCTFontOrientationDefault, glyphs, advances, v32);
LABEL_45:
          char v41 = 0;
          v42 = glyphs;
          v43 = characters;
          v44 = advances;
          v45 = (const __CTFont **)v36;
          do
          {
            if (!*v42)
            {
              v46 = (__CFString *)[[NSString alloc] initWithCharactersNoCopy:v43 length:1 freeWhenDone:0];
              v118.length = [(__CFString *)v46 length];
              v118.location = 0;
              v47 = CTFontCreateForString(v39, v46, v118);
              CTFontGetGlyphsForCharacters(v47, v43, v42, 1);
              CTFontGetAdvancesForGlyphs(v47, kCTFontOrientationDefault, v42, v44, 1);
              *v45 = v47;

              char v41 = 1;
              int v32 = v104;
            }
            ++v45;
            ++v44;
            ++v43;
            ++v42;
            --v38;
          }
          while (v38);
          font = v39;
          id v17 = v100;
        }
        char v40 = v41;
      }
      else
      {
        char v40 = 0;
      }
      int v48 = [v17 getTextCharExtra];
      int v49 = a13;
      v110 = a12;
      uint64_t v50 = v32;
      float v51 = 0.0;
      int v52 = v32 - 1;
      if (v32 >= 1)
      {
        uint64_t v53 = v32;
        p_CGFloat width = &advances->width;
        do
        {
          double v55 = *p_width;
          p_width += 2;
          float v51 = v55 + v51;
          --v53;
        }
        while (v53);
      }
      float v56 = (float)v48;
      tCGFloat x = v24;
      if (a12 && a13)
      {
        float v57 = 0.0;
        if (a13 >= 1)
        {
          uint64_t v58 = a13;
          v59 = a12;
          do
          {
            int v60 = *v59++;
            float v57 = v57 + (float)v60;
            --v58;
          }
          while (v58);
        }
        if ((v40 & 1) != 0
          || (CFStringRef v61 = CTFontCopyFamilyName(font),
              [v112 faceName],
              v62 = objc_claimAutoreleasedReturnValue(),
              char v63 = [v62 isEqualToString:v61],
              v62,
              CFRelease(v61),
              (v63 & 1) == 0))
        {
          int v32 = v104;
          int v49 = 0;
          v110 = 0;
          if (v104 < 2) {
            float v56 = 0.0;
          }
          else {
            float v56 = (float)(v57 - v51) / (float)v52;
          }
        }
        else
        {
          int v32 = v104;
        }
      }
      else
      {
        float v57 = v51 + (float)((float)v32 * v56);
      }
      double Ascent = CTFontGetAscent(font);
      double Descent = CTFontGetDescent(font);
      double Leading = CTFontGetLeading(font);
      int v66 = [v17 getTextVerticalAlign];
      float v67 = Ascent;
      float v68 = Descent;
      float v69 = fabsf(v68);
      float v70 = v67;
      if (v66)
      {
        if (v66 == 8) {
          float v70 = -v69;
        }
        else {
          float v70 = 0.0;
        }
      }
      int v71 = [v17 getTextHorizontalAlign];
      float v72 = v57;
      if (v71 != 2)
      {
        if (v71 == 6) {
          float v72 = v57 * 0.5;
        }
        else {
          float v72 = 0.0;
        }
      }
      v73 = TCCurrentGraphicsContext();
      CGContextSaveGState(v73);
      CGContextGetCTM(&v115, v73);
      double d = v115.d;
      if (v115.d < 0.0) {
        float v70 = v67 - v70;
      }
      CGContextTranslateCTM(v73, tx, v26);
      [v112 escapement];
      float v76 = v75;
      if (v76 != 0.0) {
        CGContextRotateCTM(v73, (float)(360.0 - v76) * 3.14159265 / 180.0);
      }
      CGContextTranslateCTM(v73, (float)-v72, (float)-v70);
      if (d < 0.0)
      {
        CGContextTranslateCTM(v73, 0.0, (float)(v67 * 0.5));
        CGContextScaleCTM(v73, 1.0, -1.0);
        CGContextTranslateCTM(v73, 0.0, (float)-(float)(v67 * 0.5));
      }
      float v77 = v69 + v67;
      if (((v107 & 2) != 0 || [v17 getBkMode] == 2)
        && ([v103 isOpen] & 1) == 0)
      {
        v78 = [v17 getBkColour];
        [v78 set];

        v119.origin.CGFloat y = (float)-v69;
        v119.size.CGFloat width = v57;
        v119.size.CGFloat height = v77;
        v119.origin.CGFloat x = 0.0;
        CGContextFillRect(v73, v119);
      }
      if (([v103 isOpen] & 1) == 0)
      {
        v79 = [v17 getTextColour];
        [v79 set];
      }
      CGFloat Size = CTFontGetSize(font);
      CGContextSetFontSize(v73, Size);
      v81 = CTFontCopyGraphicsFont(font, 0);
      CGContextSetFont(v73, v81);
      if (v32 >= 1)
      {
        uint64_t v82 = 0;
        v83 = 0;
        double v84 = v56;
        uint64_t v85 = v49;
        float v86 = 0.0;
        v87 = glyphs;
        v88 = &advances->width;
        while (1)
        {
          v89 = v83;
          v83 = (const void *)*((void *)v36 + v82);
          if (v83 != v89)
          {
            if (v83)
            {
              v90 = CTFontCopyGraphicsFont(*((CTFontRef *)v36 + v82), 0);
              CGContextSetFont(v73, v90);
              CFRelease(v90);
            }
            else
            {
              CGContextSetFont(v73, v81);
            }
          }
          v115.a = v86;
          v115.b = 0.0;
          v91 = TCCurrentGraphicsContext();
          CGContextShowGlyphsAtPositions(v91, v87, (const CGPoint *)&v115, 1uLL);
          if (v82 < v85) {
            break;
          }
          float v86 = *v88 + v84 + v86;
          if (v83) {
            goto LABEL_98;
          }
LABEL_99:
          ++v82;
          v88 += 2;
          ++v87;
          if (v50 == v82) {
            goto LABEL_100;
          }
        }
        if (v110) {
          float v86 = v86 + (float)v110[v82];
        }
        if (!v83) {
          goto LABEL_99;
        }
LABEL_98:
        CFRelease(v83);
        *((void *)v36 + v82) = 0;
        goto LABEL_99;
      }
LABEL_100:
      CFRelease(v81);
      v28 = v114;
      id v17 = v100;
      if (([v112 strikeout] & 1) != 0
        || [v112 underline] && (objc_msgSend(v103, "isOpen") & 1) == 0)
      {
        v92 = [v100 getTextColour];
        [v92 set];

        [v112 fontHeight];
        CGContextSetLineWidth(v73, fabs(v93) / 20.0);
        int v94 = [v112 strikeout];
        float v95 = Leading;
        float v96 = v77 + v95;
        if (v94)
        {
          float v97 = v96 * 0.2;
          v115.a = 0.0;
          v115.b = v97;
          v115.c = v57;
          v115.double d = v97;
          CGContextStrokeLineSegments(v73, (const CGPoint *)&v115, 2uLL);
        }
        if ([v112 underline])
        {
          float v98 = v96 * -0.1;
          v115.a = 0.0;
          v115.b = v98;
          v115.c = v57;
          v115.double d = v98;
          CGContextStrokeLineSegments(v73, (const CGPoint *)&v115, 2uLL);
        }
      }
      CGContextRestoreGState(v73);
      int *v102 = (int)(tx + v72 + v57);
      CFRelease(font);
      free(glyphs);
      free(characters);
      free(advances);
      free(v36);
      int v27 = 0;
      v22 = v103;
    }
    else
    {
      if (glyphs) {
        free(glyphs);
      }
      if (characters) {
        free(characters);
      }
      if (advances) {
        free(advances);
      }
      if (v36) {
        free(v36);
      }
      int v27 = -4;
    }
  }
  else
  {
    CFRelease(v19);
    int v27 = 0;
    v28 = v113;
  }
LABEL_108:

  return v27;
}

- (int)arc:(id)a3 nLeftRect:(int)a4 nTopRect:(int)a5 nRightRect:(int)a6 nBottomRect:(int)a7 nXStartArc:(int)a8 nYStartArc:(int)a9 nXEndArc:(int)a10 nYEndArc:(int)a11
{
  id v17 = a3;
  int v18 = [v17 getArcDirection];
  v19 = objc_alloc_init(OITSUBezierPath);
  -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:](v19, "appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:", v18 == 1, 1, (double)a4, (double)a5, (double)(a6 - a4), (double)(a7 - a5), (double)a8, (double)a9, (double)a10, (double)a11);
  [(MFPhoneDeviceDriver *)self drawBezierPath:v19 dc:v17 fill:0 stroke:1];

  return 0;
}

- (int)arcTo:(id)a3 nLeftRect:(int)a4 nTopRect:(int)a5 nRightRect:(int)a6 nBottomRect:(int)a7 nXStartArc:(int)a8 nYStartArc:(int)a9 nXEndArc:(int)a10 nYEndArc:(int)a11
{
  id v17 = a3;
  int v18 = [v17 getArcDirection];
  v19 = objc_alloc_init(OITSUBezierPath);
  [v17 getPenPosition];
  -[OITSUBezierPath moveToPoint:](v19, "moveToPoint:");
  -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:](v19, "appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:", v18 == 1, 0, (double)a4, (double)a5, (double)(a6 - a4), (double)(a7 - a5), (double)a8, (double)a9, (double)a10, (double)a11);
  [(MFPhoneDeviceDriver *)self drawBezierPath:v19 dc:v17 fill:0 stroke:1];
  [(OITSUBezierPath *)v19 currentPoint];
  objc_msgSend(v17, "setPenPosition:");

  return 0;
}

- (int)angleArc:(id)a3 x:(int)a4 y:(int)a5 radius:(unsigned int)a6 startAngle:(double)a7 sweepAngle:(double)a8
{
  id v14 = a3;
  double v15 = 360.0 - a7;
  double v16 = fmod(360.0 - a7, 360.0);
  double v17 = fmod(v15 - a8, 360.0);
  int v18 = objc_alloc_init(OITSUBezierPath);
  [v14 getPenPosition];
  -[OITSUBezierPath moveToPoint:](v18, "moveToPoint:");
  -[OITSUBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:](v18, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", a8 > 0.0, (double)a4, (double)a5, (double)a6, v16, v17);
  [(MFPhoneDeviceDriver *)self drawBezierPath:v18 dc:v14 fill:0 stroke:1];
  [(OITSUBezierPath *)v18 currentPoint];
  objc_msgSend(v14, "setPenPosition:");

  return 0;
}

- (int)pie:(id)a3 nLeftRect:(int)a4 nTopRect:(int)a5 nRightRect:(int)a6 nBottomRect:(int)a7 nXStartArc:(int)a8 nYStartArc:(int)a9 nXEndArc:(int)a10 nYEndArc:(int)a11
{
  id v17 = a3;
  int v18 = [v17 getArcDirection];
  v19 = objc_alloc_init(OITSUBezierPath);
  double v20 = (double)(a7 - a5);
  -[OITSUBezierPath moveToPoint:](v19, "moveToPoint:", (double)(a6 - a4) * 0.5 + (double)a4, v20 * 0.5 + (double)a5);
  -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:](v19, "appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:", v18 == 1, 0, (double)a4, (double)a5, (double)(a6 - a4), v20, (double)a8, (double)a9, (double)a10, (double)a11);
  [(OITSUBezierPath *)v19 closePath];
  [(MFPhoneDeviceDriver *)self drawBezierPath:v19 dc:v17 fill:1 stroke:1];

  return 0;
}

- (int)chord:(id)a3 leftRect:(int)a4 topRect:(int)a5 rightRect:(int)a6 bottomRect:(int)a7 xStartArc:(int)a8 yStartArc:(int)a9 xEndArc:(int)a10 yEndArc:(int)a11
{
  id v17 = a3;
  int v18 = [v17 getArcDirection];
  v19 = objc_alloc_init(OITSUBezierPath);
  -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:](v19, "appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:", v18 == 1, 1, (double)a4, (double)a5, (double)(a6 - a4), (double)(a7 - a5), (double)a8, (double)a9, (double)a10, (double)a11);
  [(OITSUBezierPath *)v19 closePath];
  [(MFPhoneDeviceDriver *)self drawBezierPath:v19 dc:v17 fill:1 stroke:1];

  return 0;
}

- (int)polyline:(id)a3 in_points:(CGPoint *)a4 in_count:(int)a5
{
  id v8 = a3;
  if (a5 >= 2)
  {
    double v9 = objc_alloc_init(OITSUBezierPath);
    [(OITSUBezierPath *)v9 appendBezierPathWithPoints:a4 count:a5];
    [(MFPhoneDeviceDriver *)self drawBezierPath:v9 dc:v8 fill:0 stroke:1];
  }
  return 0;
}

- (int)polyPolyline:(id)a3 in_points:(CGPoint *)a4 in_polyCounts:(int *)a5 in_count:(int)a6
{
  id v10 = a3;
  if (a6 < 1)
  {
    int v15 = 0;
  }
  else
  {
    uint64_t v11 = 0;
    int v12 = 0;
    unint64_t v13 = a6;
    do
    {
      int v14 = [(MFPhoneDeviceDriver *)self polyline:v10 in_points:&a4[v12] in_count:a5[v11]];
      int v15 = v14;
      if (v11 + 1 >= v13) {
        break;
      }
      v12 += a5[v11++];
    }
    while (!v14);
  }

  return v15;
}

- (int)polygon:(id)a3 in_points:(CGPoint *)a4 in_count:(int)a5
{
  id v8 = a3;
  if (a5 >= 2)
  {
    double v9 = objc_alloc_init(OITSUBezierPath);
    [(OITSUBezierPath *)v9 appendBezierPathWithPoints:a4 count:a5];
    [(OITSUBezierPath *)v9 closePath];
    [(MFPhoneDeviceDriver *)self drawBezierPath:v9 dc:v8 fill:1 stroke:1];
  }
  return 0;
}

- (int)polyPolygon:(id)a3 in_points:(CGPoint *)a4 in_polyCounts:(int *)a5 in_count:(int)a6
{
  LODWORD(v6) = a6;
  id v10 = a3;
  uint64_t v11 = objc_alloc_init(OITSUBezierPath);
  if ((int)v6 >= 1)
  {
    int v12 = 0;
    uint64_t v6 = v6;
    do
    {
      [(OITSUBezierPath *)v11 appendBezierPathWithPoints:&a4[v12] count:*a5];
      [(OITSUBezierPath *)v11 closePath];
      int v13 = *a5++;
      v12 += v13;
      --v6;
    }
    while (v6);
  }
  [(MFPhoneDeviceDriver *)self drawBezierPath:v11 dc:v10 fill:1 stroke:1];

  return 0;
}

- (int)lineTo:(id)a3 x:(double)a4 y:(double)a5
{
  id v8 = a3;
  double v9 = objc_alloc_init(OITSUBezierPath);
  [v8 getPenPosition];
  -[OITSUBezierPath moveToPoint:](v9, "moveToPoint:");
  id v10 = [v8 getPath];
  int v11 = [v10 isOpen];

  if (v11)
  {
    -[OITSUBezierPath lineToPoint:](v9, "lineToPoint:", a4, a5);
  }
  else
  {
    CGPoint v15 = (CGPoint)*MEMORY[0x263F00148];
    [v8 getPenPosition];
    v17.CGFloat x = v12;
    v17.CGFloat y = v13;
    v16.CGFloat x = a4;
    v16.CGFloat y = a5;
    calculatePreviousPointOnLine(v16, v17, &v15);
    [(OITSUBezierPath *)v9 lineToPoint:v15];
  }
  [(MFPhoneDeviceDriver *)self drawBezierPath:v9 dc:v8 fill:0 stroke:1];
  objc_msgSend(v8, "setPenPosition:", a4, a5);

  return 0;
}

- (int)rectangle:(id)a3 x1:(int)a4 y1:(int)a5 x2:(int)a6 y2:(int)a7
{
  id v12 = a3;
  CGFloat v13 = objc_alloc_init(OITSUBezierPath);
  int v14 = v13;
  if (a5 <= a7) {
    int v15 = a7;
  }
  else {
    int v15 = a5;
  }
  float v16 = (float)v15;
  if (a5 >= a7) {
    int v17 = a7;
  }
  else {
    int v17 = a5;
  }
  float v18 = (float)v17;
  if (a4 <= a6) {
    int v19 = a6;
  }
  else {
    int v19 = a4;
  }
  float v20 = (float)v19;
  if (a4 >= a6) {
    int v21 = a6;
  }
  else {
    int v21 = a4;
  }
  -[OITSUBezierPath appendBezierPathWithRect:](v13, "appendBezierPathWithRect:", (float)v21, v18, (float)(v20 - (float)v21), (float)(v16 - v18));
  [(MFPhoneDeviceDriver *)self drawBezierPath:v14 dc:v12 fill:1 stroke:1];

  return 0;
}

- (int)fillRectangle:(id)a3 x1:(int)a4 y1:(int)a5 x2:(int)a6 y2:(int)a7
{
  id v12 = a3;
  CGFloat v13 = objc_alloc_init(OITSUBezierPath);
  int v14 = v13;
  if (a5 <= a7) {
    int v15 = a7;
  }
  else {
    int v15 = a5;
  }
  float v16 = (float)v15;
  if (a5 >= a7) {
    int v17 = a7;
  }
  else {
    int v17 = a5;
  }
  float v18 = (float)v17;
  if (a4 <= a6) {
    int v19 = a6;
  }
  else {
    int v19 = a4;
  }
  float v20 = (float)v19;
  if (a4 >= a6) {
    int v21 = a6;
  }
  else {
    int v21 = a4;
  }
  -[OITSUBezierPath appendBezierPathWithRect:](v13, "appendBezierPathWithRect:", (float)v21, v18, (float)(v20 - (float)v21), (float)(v16 - v18));
  [(MFPhoneDeviceDriver *)self drawBezierPath:v14 dc:v12 fill:1 stroke:0];

  return 0;
}

- (int)roundRect:(id)a3 left:(int)a4 top:(int)a5 right:(int)a6 bottom:(int)a7 rx:(double)a8 ry:(double)a9
{
  uint64_t v11 = *(void *)&a7;
  uint64_t v12 = *(void *)&a6;
  uint64_t v13 = *(void *)&a5;
  uint64_t v14 = *(void *)&a4;
  id v16 = a3;
  if ((int)v14 >= (int)v12) {
    int v17 = v12;
  }
  else {
    int v17 = v14;
  }
  float v18 = (float)v17;
  if ((int)v14 <= (int)v12) {
    int v19 = v12;
  }
  else {
    int v19 = v14;
  }
  if ((int)v13 >= (int)v11) {
    int v20 = v11;
  }
  else {
    int v20 = v13;
  }
  float v21 = (float)v19 - v18;
  if ((int)v13 <= (int)v11) {
    int v22 = v11;
  }
  else {
    int v22 = v13;
  }
  if (v21 * 0.001 <= a8 && (float v23 = (float)v20, v24 = (float)v22 - (float)v20, v24 * 0.001 <= a9))
  {
    if ((float)(v21 * 0.5) >= a8) {
      double v26 = a8;
    }
    else {
      double v26 = (float)(v21 * 0.5);
    }
    if ((float)(v24 * 0.5) >= a9) {
      double v27 = a9;
    }
    else {
      double v27 = (float)(v24 * 0.5);
    }
    v28 = objc_alloc_init(OITSUBezierPath);
    double v33 = v27;
    double v29 = v27 + v27;
    double v32 = v18;
    -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:](v28, "appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:", 0, 1);
    double v30 = (float)(v21 + v18) + v26 * -2.0;
    -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:](v28, "appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:", 0, 0, v30, v23, v26 + v26, v29, 270.0, 90.0);
    -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:](v28, "appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:", 0, 0, v30, (float)(v24 + v23) + v33 * -2.0, v26 + v26, v29, 0.0, 90.0);
    -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:](v28, "appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:", 0, 0, v32, (float)(v24 + v23) + v33 * -2.0, v26 + v26, v29, 90.0, 90.0);
    [(OITSUBezierPath *)v28 closePath];
    [(MFPhoneDeviceDriver *)self drawBezierPath:v28 dc:v16 fill:1 stroke:1];

    int v25 = 0;
  }
  else
  {
    int v25 = [(MFPhoneDeviceDriver *)self rectangle:v16 x1:v14 y1:v13 x2:v12 y2:v11];
  }

  return v25;
}

- (int)ellipse:(id)a3 x1:(int)a4 y1:(int)a5 x2:(int)a6 y2:(int)a7
{
  id v12 = a3;
  uint64_t v13 = objc_alloc_init(OITSUBezierPath);
  uint64_t v14 = v13;
  if (a5 <= a7) {
    int v15 = a7;
  }
  else {
    int v15 = a5;
  }
  double v16 = (double)v15;
  if (a5 >= a7) {
    int v17 = a7;
  }
  else {
    int v17 = a5;
  }
  double v18 = (double)v17;
  double v19 = v16 - (double)v17;
  if (a4 <= a6) {
    int v20 = a6;
  }
  else {
    int v20 = a4;
  }
  double v21 = (double)v20;
  if (a4 >= a6) {
    int v22 = a6;
  }
  else {
    int v22 = a4;
  }
  -[OITSUBezierPath appendBezierPathWithOvalInRect:](v13, "appendBezierPathWithOvalInRect:", (double)v22, v18, v21 - (double)v22, v19);
  [(MFPhoneDeviceDriver *)self drawBezierPath:v14 dc:v12 fill:1 stroke:1];

  return 0;
}

- (int)bezierTo:(id)a3 x:(int)a4 y:(int)a5 x2:(int)a6 y2:(int)a7 x3:(int)a8 y3:(int)a9
{
  id v15 = a3;
  double v16 = objc_alloc_init(OITSUBezierPath);
  [v15 getPenPosition];
  -[OITSUBezierPath moveToPoint:](v16, "moveToPoint:");
  -[OITSUBezierPath curveToPoint:controlPoint1:controlPoint2:](v16, "curveToPoint:controlPoint1:controlPoint2:", (double)a8, (double)a9, (double)a4, (double)a5, (double)a6, (double)a7);
  [(MFPhoneDeviceDriver *)self drawBezierPath:v16 dc:v15 fill:0 stroke:1];
  objc_msgSend(v15, "setPenPosition:", (double)a8, (double)a9);

  return 0;
}

- (int)bezier:(id)a3 x:(int)a4 y:(int)a5 x2:(int)a6 y2:(int)a7 x3:(int)a8 y3:(int)a9 x4:(int)a10 y4:(int)a11
{
  id v17 = a3;
  double v18 = objc_alloc_init(OITSUBezierPath);
  -[OITSUBezierPath moveToPoint:](v18, "moveToPoint:", (double)a4, (double)a5);
  -[OITSUBezierPath curveToPoint:controlPoint1:controlPoint2:](v18, "curveToPoint:controlPoint1:controlPoint2:", (double)a10, (double)a11, (double)a6, (double)a7, (double)a8, (double)a9);
  [(MFPhoneDeviceDriver *)self drawBezierPath:v18 dc:v17 fill:0 stroke:1];

  return 0;
}

- (void)applyTransformsToCurrentContext
{
  uint64_t v3 = TCCurrentGraphicsContext();
  CGContextGetCTM(&v14, v3);
  CGAffineTransformInvert(&transform, &v14);
  CGContextConcatCTM(v3, &transform);
  long long v4 = *(_OWORD *)&self->m_canvasTransform.c;
  *(_OWORD *)&v13.a = *(_OWORD *)&self->m_canvasTransform.a;
  *(_OWORD *)&v13.c = v4;
  *(_OWORD *)&v13.tCGFloat x = *(_OWORD *)&self->m_canvasTransform.tx;
  CGContextConcatCTM(v3, &v13);
  long long v5 = *(_OWORD *)&self->m_worldToDeviceTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->m_worldToDeviceTransform.a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&self->m_worldToDeviceTransform.tx;
  long long v6 = *(_OWORD *)&self->m_viewBoxTransform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->m_viewBoxTransform.a;
  *(_OWORD *)&t2.c = v6;
  *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&self->m_viewBoxTransform.tx;
  CGAffineTransformConcat(&v12, &t1, &t2);
  long long v7 = *(_OWORD *)&v12.c;
  *(_OWORD *)&self->m_combinedTransform.a = *(_OWORD *)&v12.a;
  *(_OWORD *)&self->m_combinedTransform.c = v7;
  *(_OWORD *)&self->m_combinedTransform.tCGFloat x = *(_OWORD *)&v12.tx;
  long long v8 = *(_OWORD *)&self->m_combinedTransform.c;
  *(_OWORD *)&v9.a = *(_OWORD *)&self->m_combinedTransform.a;
  *(_OWORD *)&v9.c = v8;
  *(_OWORD *)&v9.tCGFloat x = *(_OWORD *)&self->m_combinedTransform.tx;
  CGContextConcatCTM(v3, &v9);
}

- (int)setViewBox:(double)a3 top:(double)a4 width:(double)a5 height:(double)a6
{
  self->m_viewBox.origin.double x = a3;
  self->m_viewBox.origin.double y = a4;
  self->m_viewBox.size.double width = a5;
  self->m_viewBox.size.double height = a6;
  [(MFPhoneDeviceDriver *)self updateViewBoxTransform];
  long long v7 = *(_OWORD *)&self->m_worldToDeviceTransform.c;
  *(_OWORD *)&v18.a = *(_OWORD *)&self->m_worldToDeviceTransform.a;
  *(_OWORD *)&v18.c = v7;
  *(_OWORD *)&v18.tdouble x = *(_OWORD *)&self->m_worldToDeviceTransform.tx;
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformInvert(&v19, &v18);
  double width = self->m_viewBox.size.width;
  double height = self->m_viewBox.size.height;
  double v10 = v19.c * height + v19.a * width;
  if (v10 > 0.0)
  {
    double v11 = v19.d * height + v19.b * width;
    if (v11 > 0.0)
    {
      double x = self->m_viewBox.origin.x;
      double y = self->m_viewBox.origin.y;
      CGFloat v14 = v19.ty + v19.d * y + v19.b * x;
      CGFloat v15 = v19.tx + v19.c * y + v19.a * x;
      double v16 = TCCurrentGraphicsContext();
      v20.origin.double x = v15;
      v20.origin.double y = v14;
      v20.size.double width = v10;
      v20.size.double height = v11;
      CGContextClipToRect(v16, v20);
    }
  }
  return 0;
}

- (int)patBlt:(id)a3 in_x:(int)a4 in_y:(int)a5 in_width:(int)a6 in_height:(int)a7 in_rop:(unsigned int)a8
{
  id v14 = a3;
  CGFloat v15 = [v14 getPath];
  char v16 = [v15 isOpen];

  if (a8 == 11141161) {
    char v17 = 1;
  }
  else {
    char v17 = v16;
  }
  if ((v17 & 1) == 0)
  {
    uint64_t v18 = [v14 getRop2];
    if (a8 == 16711778) {
      unsigned int v19 = 16;
    }
    else {
      unsigned int v19 = 13;
    }
    if (a8 == 66) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = v19;
    }
    [v14 setRop2:v20];
    double v21 = objc_alloc_init(OITSUBezierPath);
    -[OITSUBezierPath appendBezierPathWithRect:](v21, "appendBezierPathWithRect:", (double)a4, (double)a5, (double)a6, (double)a7);
    [(MFPhoneDeviceDriver *)self drawBezierPath:v21 dc:v14 fill:1 stroke:0];
    [v14 setRop2:v18];
  }
  return 0;
}

- (int)bitBlt:(id)a3 in_xDest:(int)a4 in_yDest:(int)a5 in_widthDest:(int)a6 in_heightDest:(int)a7 in_sourceImage:(id)a8 in_xSrc:(int)a9 in_ySrc:(int)a10 in_rop:(unsigned int)a11 in_xform:(CGAffineTransform *)a12 in_colour:(unsigned int)a13
{
  LODWORD(v15) = a13;
  LODWORD(v14) = a11;
  return -[MFPhoneDeviceDriver stretchBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:](self, "stretchBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:", a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, a8, __PAIR64__(a10, a9), __PAIR64__(a7, a6), v14, a12, v15);
}

- (int)stretchBlt:(id)a3 in_xDest:(int)a4 in_yDest:(int)a5 in_widthDest:(int)a6 in_heightDest:(int)a7 in_sourceImage:(id)a8 in_xSrc:(int)a9 in_ySrc:(int)a10 in_widthSrc:(int)a11 in_heightSrc:(int)a12 in_rop:(unsigned int)a13 in_xform:(CGAffineTransform *)a14 in_colour:(unsigned int)a15
{
  uint64_t v16 = *(void *)&a7;
  uint64_t v17 = *(void *)&a6;
  uint64_t v18 = *(void *)&a5;
  uint64_t v19 = *(void *)&a4;
  id v21 = a3;
  id v22 = a8;
  float v23 = [v21 getPath];
  char v24 = [v23 isOpen];

  if (a13 == 11141161) {
    char v25 = 1;
  }
  else {
    char v25 = v24;
  }
  if ((v25 & 1) == 0)
  {
    if (([v22 isEmpty] & 1) != 0 || a13 == 16711778 || a13 == 66)
    {
      int v26 = [(MFPhoneDeviceDriver *)self patBlt:v21 in_x:v19 in_y:v18 in_width:v17 in_height:v16 in_rop:a13];
      goto LABEL_10;
    }
    double v28 = (double)a9;
    double v29 = (double)a10;
    double v30 = (double)a11;
    double v31 = (double)a12;
    if (a14)
    {
      double b = a14->b;
      double c = a14->c;
      double d = a14->d;
      double v35 = d * v29 + b * v28;
      double v28 = a14->tx + c * v29 + a14->a * v28;
      double v29 = a14->ty + v35;
      double v36 = c * v31;
      double v31 = d * v31 + b * v30;
      double v30 = v36 + a14->a * v30;
    }
    uint64_t v37 = [v22 getImage];
    objc_msgSend(v37, "drawInRect:fromRect:isFlipped:", 1, (double)(int)v19, (double)(int)v18, (double)(int)v17, (double)(int)v16, v28, v29, v30, v31);
  }
  int v26 = 0;
LABEL_10:

  return v26;
}

- (int)alphaBlend:(id)a3 in_xDest:(int)a4 in_yDest:(int)a5 in_widthDest:(int)a6 in_heightDest:(int)a7 in_sourceImage:(id)a8 in_xSrc:(int)a9 in_ySrc:(int)a10 in_widthSrc:(int)a11 in_heightSrc:(int)a12 in_sourceConstantOpacity:(unsigned __int8)a13 in_useSourceAlphaChannel:(BOOL)a14 in_xform:(CGAffineTransform *)a15 in_colour:(unsigned int)a16
{
  id v21 = a8;
  id v22 = [a3 getPath];
  if ([v22 isOpen]) {
    goto LABEL_28;
  }
  char v23 = [v21 isEmpty];

  if ((v23 & 1) == 0)
  {
    double v25 = (double)a9;
    double v26 = (double)a10;
    double v27 = (double)a11;
    double v28 = (double)a12;
    if (a15)
    {
      double b = a15->b;
      double c = a15->c;
      double d = a15->d;
      double v32 = d * v26 + b * v25;
      double v25 = a15->tx + c * v26 + a15->a * v25;
      double v26 = a15->ty + v32;
      double v33 = c * v28;
      double v28 = d * v28 + b * v27;
      double v27 = v33 + a15->a * v27;
    }
    int v34 = [v21 getImage];
    id v22 = v34;
    if (!v34)
    {
      int v24 = -1;
LABEL_29:

      goto LABEL_30;
    }
    double v35 = (double)a4;
    double v36 = (double)a5;
    double v37 = (double)a6;
    double v38 = (double)a7;
    if (__PAIR64__(a14, a13) == 255) {
      goto LABEL_27;
    }
    v39 = (CGImage *)[v34 CGImage];
    char v40 = v39;
    if (!v39) {
      goto LABEL_27;
    }
    unint64_t Width = CGImageGetWidth(v39);
    unint64_t Height = CGImageGetHeight(v40);
    if (a14)
    {
      v43 = (void *)[v21 pixelData];
      if ([v21 pixelDataLength] == Height * 4 * Width
        && (v44 = (CGColorSpace *)TSUDeviceRGBColorSpace(),
            v45 = CGBitmapContextCreateWithData(v43, Width, Height, 8uLL, 4 * Width, v44, 0x2002u, 0, 0),
            (v46 = v45) != 0))
      {
        Image = CGBitmapContextCreateImage(v45);
        CGContextRelease(v46);
      }
      else
      {
        Image = 0;
      }
      if (([v21 isFlipped] & 1) == 0)
      {
        v55.origin.double x = v25;
        v55.origin.double y = v26;
        v55.size.double width = v27;
        v55.size.double height = v28;
        int v48 = 0;
        double v26 = v26 + (double)Height + CGRectGetMidY(v55) * -2.0;
        if (!Image)
        {
LABEL_27:
          objc_msgSend(v22, "drawInRect:fromRect:isFlipped:", 1, v35, v36, v37, v38, v25, v26, v27, v28);
LABEL_28:
          int v24 = 0;
          goto LABEL_29;
        }
LABEL_20:
        v61.size.double width = (double)Width;
        v61.size.double height = (double)Height;
        v61.origin.double x = 0.0;
        v61.origin.double y = 0.0;
        v56.origin.double x = v25;
        v56.origin.double y = v26;
        v56.size.double width = v27;
        v56.size.double height = v28;
        if (CGRectEqualToRect(v56, v61))
        {
          CGImageRef v49 = CGImageRetain(Image);
        }
        else
        {
          v57.origin.double x = v25;
          v57.origin.double y = v26;
          v57.size.double width = v27;
          v57.size.double height = v28;
          CGImageRef v49 = CGImageCreateWithImageInRect(Image, v57);
        }
        uint64_t v50 = v49;
        CGImageRelease(Image);
        if (v50)
        {
          float v51 = TCCurrentGraphicsContext();
          CGContextSaveGState(v51);
          if (v48)
          {
            v58.origin.double x = v35;
            v58.origin.double y = v36;
            v58.size.double width = v37;
            v58.size.double height = v38;
            CGFloat MidY = CGRectGetMidY(v58);
            CGContextTranslateCTM(v51, 0.0, MidY);
            CGContextScaleCTM(v51, 1.0, -1.0);
            v59.origin.double x = v35;
            v59.origin.double y = v36;
            v59.size.double width = v37;
            v59.size.double height = v38;
            CGFloat v53 = CGRectGetMidY(v59);
            CGContextTranslateCTM(v51, 0.0, -v53);
          }
          CGContextSetAlpha(v51, (double)a13 / 255.0);
          CGContextSetBlendMode(v51, kCGBlendModeNormal);
          v60.origin.double x = v35;
          v60.origin.double y = v36;
          v60.size.double width = v37;
          v60.size.double height = v38;
          CGContextDrawImage(v51, v60, v50);
          CGContextRestoreGState(v51);
          CGImageRelease(v50);
          goto LABEL_28;
        }
        goto LABEL_27;
      }
    }
    else
    {
      Image = CGImageRetain(v40);
    }
    int v48 = 1;
    if (!Image) {
      goto LABEL_27;
    }
    goto LABEL_20;
  }
  int v24 = 0;
LABEL_30:

  return v24;
}

- (int)maskBlt:(id)a3 in_xDest:(int)a4 in_yDest:(int)a5 in_widthDest:(int)a6 in_heightDest:(int)a7 in_sourceImage:(id)a8 in_xSrc:(int)a9 in_ySrc:(int)a10 in_maskImage:(id)a11 in_xMask:(int)a12 in_yMask:(int)a13 in_rop:(unsigned int)a14 in_xform:(CGAffineTransform *)a15 in_colour:(unsigned int)a16
{
  return -[MFPhoneDeviceDriver bitBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:](self, "bitBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:", a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, a8);
}

- (int)plgBlt:(id)a3 in_destinationParallelogram:(CGPoint *)a4 in_sourceImage:(id)a5 in_xSrc:(int)a6 in_ySrc:(int)a7 in_widthSrc:(int)a8 in_heightSrc:(int)a9 in_maskImage:(id)a10 in_xMask:(int)a11 in_yMask:(int)a12 in_xform:(CGAffineTransform *)a13 in_colour:(unsigned int)a14
{
  return 0;
}

- (id)createHatchBrush:(id)a3 in_hatchstyle:(int)a4
{
  long long v4 = +[MFPhoneHatchBrush hatchBrushWithColour:a3 in_style:*(void *)&a4];
  return v4;
}

- (id)createPen:(int)a3 in_width:(int)a4 in_colour:(id)a5 in_userStyleArray:(double *)a6
{
  long long v6 = *(_OWORD *)&self->m_combinedTransform.c;
  v9[0] = *(_OWORD *)&self->m_combinedTransform.a;
  v9[1] = v6;
  v9[2] = *(_OWORD *)&self->m_combinedTransform.tx;
  long long v7 = +[MFPhonePen penWithStyle:*(void *)&a3 width:*(void *)&a4 colour:a5 styleArray:a6 LPToDPTransform:v9];
  return v7;
}

- (id)createFont:(int)a3 lfWidth:(int)a4 lfEscapement:(int)a5 lfOrientation:(int)a6 lfWeight:(int)a7 lfItalic:(BOOL)a8 lfUnderline:(BOOL)a9 lfStrikeOut:(BOOL)a10 lfCharSet:(int)a11 lfOutPrecision:(int)a12 lfClipPrecision:(unsigned __int8)a13 lfQuality:(int)a14 pitch:(int)a15 family:(int)a16 lfFaceName:(id)a17
{
  LODWORD(v21) = a16;
  BYTE4(v20) = a13;
  HIDWORD(v19) = a11;
  LODWORD(v20) = a12;
  LOWORD(v19) = __PAIR16__(a10, a9);
  uint64_t v17 = +[MFFont fontWithFeatures:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:](MFPhoneFont, "fontWithFeatures:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, a8, v19, v20, *(void *)&a14, v21, a17);
  return v17;
}

- (id)createFontIndirectW:(int)a3 lfWidth:(int)a4 lfEscapement:(int)a5 lfOrientation:(int)a6 lfWeight:(int)a7 lfItalic:(BOOL)a8 lfUnderline:(BOOL)a9 lfStrikeOut:(BOOL)a10 lfCharSet:(int)a11 lfOutPrecision:(int)a12 lfClipPrecision:(unsigned __int8)a13 lfQuality:(int)a14 pitch:(int)a15 family:(int)a16 lfFaceName:(id)a17 elfFullName:(id)a18 elfStyle:(id)a19 elfVersion:(unsigned int)a20 elfStyleSize:(unsigned int)a21 elfMatch:(unsigned int)a22 elfVendorId:(unsigned int)a23 elfCulture:(unsigned int)a24
{
  LODWORD(v29) = a24;
  LODWORD(v28) = a16;
  BYTE4(v27) = a13;
  HIDWORD(v26) = a11;
  LODWORD(v27) = a12;
  LOWORD(v26) = __PAIR16__(a10, a9);
  +[MFFont fontWithExtendedFeatures:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:elfFullName:elfStyle:elfVersion:elfStyleSize:elfMatch:elfVendorId:elfCulture:](MFPhoneFont, "fontWithExtendedFeatures:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:elfFullName:elfStyle:elfVersion:elfStyleSize:elfMatch:elfVendorId:elfCulture:", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, a8, v26, v27, *(void *)&a14, v28, a17, a18, a19, *(void *)&a20, *(void *)&a22,
  int v24 = v29);
  return v24;
}

- (id)createRegionWithRects:(id)a3 in_dc:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = -[MFPhoneRegion initWithRects:in_bounds:in_dc:]([MFPhoneRegion alloc], "initWithRects:in_bounds:in_dc:", v6, v7, self->m_viewBox.origin.x, self->m_viewBox.origin.y, self->m_viewBox.size.width, self->m_viewBox.size.height);

  return v8;
}

- (id)createDIBitmap:(id)a3 in_dib:(const char *)a4 in_dibSize:(unsigned int)a5 in_usage:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  id v9 = a3;
  double v10 = [(MFBitmap *)[MFPhoneBitmap alloc] initWithDIBitmap:v9 in_dib:a4 in_dibSize:v7 in_usage:v6];

  return v10;
}

- (id)createDIBitmap:(id)a3 in_header:(const char *)a4 in_headerSize:(unsigned int)a5 in_bitmap:(const char *)a6 in_bitmapSize:(unsigned int)a7 in_usage:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v9 = *(void *)&a7;
  uint64_t v11 = *(void *)&a5;
  id v13 = a3;
  uint64_t v14 = [(MFBitmap *)[MFPhoneBitmap alloc] initWithDIBitmap:v13 in_header:a4 in_headerSize:v11 in_bitmap:a6 in_bitmapSize:v9 in_usage:v8];

  return v14;
}

- (id)createBitmap:(id)a3 in_width:(int)a4 in_height:(int)a5 in_planes:(int)a6 in_bitsPerPixel:(int)a7 in_bitmap:(const char *)a8 in_bitmapSize:(unsigned int)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = *(void *)&a5;
  uint64_t v13 = *(void *)&a4;
  id v14 = a3;
  LODWORD(v17) = a9;
  uint64_t v15 = [(MFBitmap *)[MFPhoneBitmap alloc] initWithBitmap:v14 in_width:v13 in_height:v12 in_planes:v11 in_bitsPerPixel:v10 in_bitmap:a8 in_bitmapSize:v17];

  return v15;
}

@end