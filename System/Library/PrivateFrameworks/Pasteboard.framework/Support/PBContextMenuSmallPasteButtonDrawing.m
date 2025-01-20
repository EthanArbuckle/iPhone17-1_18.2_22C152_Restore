@interface PBContextMenuSmallPasteButtonDrawing
- (PBContextMenuSmallPasteButtonDrawing)initWithStyle:(id)a3 tag:(id)a4;
@end

@implementation PBContextMenuSmallPasteButtonDrawing

- (PBContextMenuSmallPasteButtonDrawing)initWithStyle:(id)a3 tag:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[UISPasteVariant variantForSecureName:](UISPasteVariant, "variantForSecureName:", [v6 secureName]);
  [v6 size];
  double v10 = v9;
  double v12 = v11;
  v13 = [v8 glyph];
  if ([v7 hasAccessibilityContentSizeCategory]) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = 2;
  }
  v15 = [v7 assetGlyphWithName:v13 glyphSize:v14 textStyle:kCTUIFontTextStyleBody];

  id v16 = objc_msgSend(objc_alloc((Class)UISVectorGlyphDrawing), "initWithVectorGlyph:tintColor:", v15, objc_msgSend(v7, "tintColor"));
  [v16 drawingSize];
  double v18 = v17;
  double v20 = (v10 - v19) * 0.5;
  unsigned int v21 = [v7 displayScale];

  double v22 = round(v20 * (double)v21) / (double)v21;
  if (v22 < 0.0 || (double v23 = round((v12 - v18) * 0.5 * (double)v21) / (double)v21, v23 < 0.0))
  {
    v27 = _PBLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Context menu paste button too small for glyph.", buf, 2u);
    }

    v26 = 0;
  }
  else
  {
    [v6 size];
    v29.receiver = self;
    v29.super_class = (Class)PBContextMenuSmallPasteButtonDrawing;
    self = -[PBContextMenuPasteButtonDrawing initWithTitleDrawing:titleOffset:glyph:glyphOffset:size:](&v29, "initWithTitleDrawing:titleOffset:glyph:glyphOffset:size:", 0, v16, CGPointZero.x, CGPointZero.y, v22, v23, v24, v25);
    v26 = self;
  }

  return v26;
}

@end