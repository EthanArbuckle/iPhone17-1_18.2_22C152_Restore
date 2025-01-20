@interface PBContextMenuLargePasteButtonDrawing
- (PBContextMenuLargePasteButtonDrawing)initWithStyle:(id)a3 tag:(id)a4;
@end

@implementation PBContextMenuLargePasteButtonDrawing

- (PBContextMenuLargePasteButtonDrawing)initWithStyle:(id)a3 tag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[UISPasteVariant variantForSecureName:](UISPasteVariant, "variantForSecureName:", [v7 secureName]);
  [v7 size];
  double v10 = v9;
  double v12 = v11;
  [v7 titleOrigin];
  double v14 = v13;
  double v16 = v15;
  BOOL v55 = [v6 layoutDirection] != 0;
  char v54 = 0;
  settings.spec = kCTParagraphStyleSpecifierAlignment;
  settings.valueSize = 1;
  settings.value = &v55;
  int v59 = 6;
  uint64_t v60 = 1;
  v61 = &v54;
  CTParagraphStyleRef v17 = CTParagraphStyleCreate(&settings, 2uLL);
  uint64_t v18 = kCTUIFontTextStyleBody;
  id v19 = [v6 newFontForTextStyle:kCTUIFontTextStyleBody attributes:0];
  v20 = [v6 localization];
  v21 = [v8 localizedStringForLocalization:v20];

  v57[0] = v19;
  v56[0] = kCTFontAttributeName;
  v56[1] = kCTForegroundColorAttributeName;
  id v22 = [v6 tintColor];
  v56[2] = kCTParagraphStyleAttributeName;
  v57[1] = v22;
  v57[2] = v17;
  v23 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:3];
  CFRelease(v17);
  CFRelease(v19);
  if ([v6 hasAccessibilityContentSizeCategory])
  {
    id v24 = 0;
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
    double v51 = 0.0;
    double v27 = 0.0;
  }
  else
  {
    v28 = [v8 glyph];
    v29 = [v6 assetGlyphWithName:v28 glyphSize:2 textStyle:v18];

    id v24 = objc_msgSend(objc_alloc((Class)UISVectorGlyphDrawing), "initWithVectorGlyph:tintColor:", v29, objc_msgSend(v6, "tintColor"));
    [v24 drawingSize];
    double width = v30;
    double height = v31;
    double v27 = round(sub_10001E778((const __CTFont *)v19, 24.0)* (double)[v6 displayScale]/ (double)objc_msgSend(v6, "displayScale"));
    unsigned int v32 = [v7 hasTrailingGutter];
    double v33 = width * 0.5 + 16.0 + v27 * 0.5 + 12.0;
    if (!v32) {
      double v33 = width * 0.5 + 16.0 + v27 * 0.5;
    }
    double v51 = v33;
  }
  [v7 titleOrigin];
  double v35 = v10 - v34 + -16.0 + -4.0 - v27;
  id v36 = objc_alloc((Class)UISTextParagraphDrawing);
  unsigned int v37 = [v6 hasAccessibilityContentSizeCategory];
  double v38 = (double)[v6 displayScale];
  if (v37) {
    uint64_t v39 = 0;
  }
  else {
    uint64_t v39 = 2;
  }
  id v40 = objc_msgSend(v36, "initWithString:attributes:size:numberOfLines:scale:", v21, v23, v39, v35, 0.0, v38);
  [v40 drawingSize];
  if (v14 + v42 > v10 || v16 + v41 > v12)
  {
    v44 = _PBLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v45 = "Context menu paste button text too offset in button.";
LABEL_32:
      _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, v45, buf, 2u);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (v10 > 343.0 || v12 > (height + v41) * 3.0)
  {
    v44 = _PBLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v45 = "Context menu paste button too large for text + glyph.";
      goto LABEL_32;
    }
    goto LABEL_18;
  }
  if (v10 - v51 < 0.0 || (v12 - height) * 0.5 < 0.0)
  {
    v44 = _PBLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v45 = "Context menu paste button too small for glyph.";
      goto LABEL_32;
    }
LABEL_18:

    v46 = 0;
    goto LABEL_19;
  }
  id v48 = [v6 layoutDirection];
  if (v48 == (id)1) {
    double v49 = v51 - width;
  }
  else {
    double v49 = v10 - v51;
  }
  if (v48 == (id)1) {
    double v50 = v10 - v14 - v35;
  }
  else {
    double v50 = v14;
  }
  v52.receiver = self;
  v52.super_class = (Class)PBContextMenuLargePasteButtonDrawing;
  self = -[PBContextMenuPasteButtonDrawing initWithTitleDrawing:titleOffset:glyph:glyphOffset:size:](&v52, "initWithTitleDrawing:titleOffset:glyph:glyphOffset:size:", v40, v24, v50, v16, v49, (v12 - height) * 0.5, v10, v12, *(void *)&v16);
  v46 = self;
LABEL_19:

  return v46;
}

@end