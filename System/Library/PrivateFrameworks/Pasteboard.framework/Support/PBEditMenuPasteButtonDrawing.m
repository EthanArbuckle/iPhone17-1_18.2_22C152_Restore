@interface PBEditMenuPasteButtonDrawing
- (CGSize)drawingSize;
- (PBEditMenuPasteButtonDrawing)initWithStyle:(id)a3 tag:(id)a4;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4;
@end

@implementation PBEditMenuPasteButtonDrawing

- (PBEditMenuPasteButtonDrawing)initWithStyle:(id)a3 tag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v54.receiver = self;
  v54.super_class = (Class)PBEditMenuPasteButtonDrawing;
  v8 = [(PBEditMenuPasteButtonDrawing *)&v54 init];
  if (!v8) {
    goto LABEL_27;
  }
  v9 = +[UISPasteVariant variantForSecureName:](UISPasteVariant, "variantForSecureName:", [v7 secureName]);
  [v7 size];
  v8->_size.double width = v10;
  v8->_size.double height = v11;
  uint64_t v12 = kCTUIFontTextStyleSubhead;
  id v13 = [v6 newFontForTextStyle:kCTUIFontTextStyleSubhead attributes:0];
  [v7 contentOrigin];
  double v15 = v14;
  double v17 = v16;
  id v18 = [v7 displayMode];
  id v19 = [v7 displayMode];
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  if (v19)
  {
    v22 = [v9 glyph];
    v23 = [v6 assetGlyphWithName:v22 glyphSize:2 textStyle:v12];

    v24 = (UISVectorGlyphDrawing *)objc_msgSend(objc_alloc((Class)UISVectorGlyphDrawing), "initWithVectorGlyph:tintColor:", v23, objc_msgSend(v6, "tintColor"));
    glyph = v8->_glyph;
    v8->_glyph = v24;

    [v23 alignmentRect];
    double v27 = v26;
    [(UISVectorGlyphDrawing *)v8->_glyph drawingSize];
    double v29 = v28;
    double v31 = v30;
  }
  else
  {
    double v27 = 0.0;
    double v31 = CGSizeZero.height;
    double v29 = CGSizeZero.width;
  }
  if (v18 != (id)1)
  {
    BOOL v53 = [v6 layoutDirection] != 0;
    char v52 = [v6 hasAccessibilityContentSizeCategory] ^ 1;
    settings.spec = kCTParagraphStyleSpecifierAlignment;
    settings.valueSize = 1;
    settings.value = &v53;
    int v58 = 6;
    uint64_t v59 = 1;
    v60 = &v52;
    CTParagraphStyleRef v32 = CTParagraphStyleCreate(&settings, 2uLL);
    v33 = [v6 localization];
    v34 = [v9 localizedStringForLocalization:v33];

    v56[0] = v13;
    v55[0] = kCTFontAttributeName;
    v55[1] = kCTForegroundColorAttributeName;
    id v35 = [v6 tintColor];
    v55[2] = kCTParagraphStyleAttributeName;
    v56[1] = v35;
    v56[2] = v32;
    v36 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:3];
    CFRelease(v32);
    double v37 = v29 + 6.0;
    if (v29 <= 0.0) {
      double v37 = 0.0;
    }
    v38 = (UISTextParagraphDrawing *)objc_msgSend(objc_alloc((Class)UISTextParagraphDrawing), "initWithString:attributes:size:numberOfLines:scale:", v34, v36, objc_msgSend(v6, "hasAccessibilityContentSizeCategory") ^ 1, v8->_size.width + v15 * -2.0 - v37, 0.0, (double)objc_msgSend(v6, "displayScale"));
    titleDrawing = v8->_titleDrawing;
    v8->_titleDrawing = v38;

    [(UISTextParagraphDrawing *)v8->_titleDrawing drawingSize];
    double width = v40;
    double height = v41;
  }
  CFRelease(v13);
  if ([v6 layoutDirection])
  {
    double v42 = v8->_size.width;
    double v15 = v42 - v15 - v29;
    double v43 = v15 + -6.0;
    if (!v8->_glyph) {
      double v43 = v15;
    }
    double v44 = v43 - width;
  }
  else
  {
    double v45 = v29 + 6.0;
    if (!v8->_glyph) {
      double v45 = -0.0;
    }
    double v44 = v15 + v45;
    double v42 = v8->_size.width;
  }
  v8->_glyphOffset.x = v15;
  v8->_glyphOffset.y = v17 - v27;
  v8->_titleOffset.x = v44;
  v8->_titleOffset.y = v17;
  if (width + v44 <= v42)
  {
    double v46 = v8->_size.height;
    if (v17 + height <= v46)
    {
      if (v29 + v15 > v42 || v31 + v17 - v27 > v46)
      {
        v47 = _PBLog();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          goto LABEL_19;
        }
        LOWORD(settings.spec) = 0;
        v50 = "Edit menu paste button image too offset in button.";
LABEL_30:
        _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, v50, (uint8_t *)&settings, 2u);
        goto LABEL_19;
      }

LABEL_27:
      v48 = v8;
      goto LABEL_28;
    }
  }
  v47 = _PBLog();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    LOWORD(settings.spec) = 0;
    v50 = "Edit menu paste button text too offset in button.";
    goto LABEL_30;
  }
LABEL_19:

  v48 = 0;
LABEL_28:

  return v48;
}

- (void)dealloc
{
  titleDrawing = self->_titleDrawing;
  self->_titleDrawing = 0;

  CTFontRemoveFromCaches();
  CGFontCacheGetLocalCache();
  CGFontCacheReset();
  v4.receiver = self;
  v4.super_class = (Class)PBEditMenuPasteButtonDrawing;
  [(PBEditMenuPasteButtonDrawing *)&v4 dealloc];
}

- (CGSize)drawingSize
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  CGContextSaveGState(a3);
  -[UISTextParagraphDrawing drawInContext:atPoint:](self->_titleDrawing, "drawInContext:atPoint:", a3, x + self->_titleOffset.x, y + self->_titleOffset.y);
  CGContextRestoreGState(a3);
  CGContextSaveGState(a3);
  -[UISVectorGlyphDrawing drawInContext:atPoint:](self->_glyph, "drawInContext:atPoint:", a3, x + self->_glyphOffset.x, y + self->_glyphOffset.y);
  CGContextRestoreGState(a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_titleDrawing, 0);
}

@end