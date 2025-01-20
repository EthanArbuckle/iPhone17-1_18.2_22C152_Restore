@interface PBContextMenuMediumPasteButtonDrawing
- (PBContextMenuMediumPasteButtonDrawing)initWithStyle:(id)a3 tag:(id)a4;
@end

@implementation PBContextMenuMediumPasteButtonDrawing

- (PBContextMenuMediumPasteButtonDrawing)initWithStyle:(id)a3 tag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[UISPasteVariant variantForSecureName:](UISPasteVariant, "variantForSecureName:", [v7 secureName]);
  [v7 size];
  double v10 = v9;
  double v12 = v11;
  [v7 titleOrigin];
  double v14 = v13;

  char v50 = 2;
  char v49 = 0;
  settings.spec = kCTParagraphStyleSpecifierAlignment;
  settings.valueSize = 1;
  settings.value = &v50;
  int v54 = 6;
  uint64_t v55 = 1;
  v56 = &v49;
  CTParagraphStyleRef v15 = CTParagraphStyleCreate(&settings, 2uLL);
  uint64_t v16 = kCTUIFontTextStyleFootnote;
  id v17 = [v6 newFontForTextStyle:kCTUIFontTextStyleFootnote attributes:0];
  v18 = [v6 localization];
  v19 = [v8 localizedStringForLocalization:v18];

  v52[0] = v17;
  v51[0] = kCTFontAttributeName;
  v51[1] = kCTForegroundColorAttributeName;
  id v20 = [v6 tintColor];
  v51[2] = kCTParagraphStyleAttributeName;
  v52[1] = v20;
  v52[2] = v15;
  v21 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:3];
  CFRelease(v15);
  CFRelease(v17);
  v22 = (const __CTFont *)[v6 newFontForTextStyle:kCTUIFontTextStyleBody attributes:0];
  double v23 = sub_10001E778(v22, 48.0);
  CFRelease(v22);
  v24 = [v8 glyph];
  if ([v6 hasAccessibilityContentSizeCategory]) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = 2;
  }
  v26 = [v6 assetGlyphWithName:v24 glyphSize:v25 textStyle:v16];

  id v27 = objc_msgSend(objc_alloc((Class)UISVectorGlyphDrawing), "initWithVectorGlyph:tintColor:", v26, objc_msgSend(v6, "tintColor"));
  [v27 drawingSize];
  double v29 = v28;
  double v31 = v30;
  id v32 = objc_alloc((Class)UISTextParagraphDrawing);
  unsigned int v33 = [v6 hasAccessibilityContentSizeCategory];
  double v34 = (double)[v6 displayScale];
  if (v33) {
    uint64_t v35 = 0;
  }
  else {
    uint64_t v35 = 2;
  }
  id v36 = objc_msgSend(v32, "initWithString:attributes:size:numberOfLines:scale:", v19, v21, v35, v10, 0.0, v34);
  [v36 drawingSize];
  double v38 = (v10 - v37) * 0.5;
  double v40 = v14 + v39;
  if (v37 + v38 > v10 || v40 > v12)
  {
    v42 = _PBLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v43 = "Context menu paste button text too offset in button.";
LABEL_20:
      _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, v43, buf, 2u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  double v44 = (double)[v6 displayScale];
  if (round((v10 - v29) * 0.5 * v44) / v44 < 0.0 || round((v23 * 0.5 - v31 * 0.5 + -1.0) * v44) / v44 < 0.0)
  {
    v42 = _PBLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v43 = "Context menu paste button too small for glyph.";
      goto LABEL_20;
    }
LABEL_17:

    v45 = 0;
    goto LABEL_18;
  }
  v47.receiver = self;
  v47.super_class = (Class)PBContextMenuMediumPasteButtonDrawing;
  self = -[PBContextMenuPasteButtonDrawing initWithTitleDrawing:titleOffset:glyph:glyphOffset:size:](&v47, "initWithTitleDrawing:titleOffset:glyph:glyphOffset:size:", v36, v27, v38, v14);
  v45 = self;
LABEL_18:

  return v45;
}

@end