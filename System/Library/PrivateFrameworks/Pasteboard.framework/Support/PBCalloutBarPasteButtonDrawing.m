@interface PBCalloutBarPasteButtonDrawing
- (CGSize)drawingSize;
- (PBCalloutBarPasteButtonDrawing)initWithStyle:(id)a3 tag:(id)a4;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4;
@end

@implementation PBCalloutBarPasteButtonDrawing

- (PBCalloutBarPasteButtonDrawing)initWithStyle:(id)a3 tag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)PBCalloutBarPasteButtonDrawing;
  v8 = [(PBCalloutBarPasteButtonDrawing *)&v33 init];
  if (!v8) {
    goto LABEL_15;
  }
  v9 = +[UISPasteVariant variantForSecureName:](UISPasteVariant, "variantForSecureName:", [v7 secureName]);
  v10 = [v6 localization];
  v11 = [v9 localizedStringForLocalization:v10];

  [v6 preferredContentSizeCategory];
  [v7 contentScaleLevel];
  UISCalloutBarFontSize();
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, v12, 0);
  v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 accessibilityButtonShapes] == (id)1);
  v35[0] = UIFontForLanguage;
  v34[0] = kCTFontAttributeName;
  v34[1] = kCTForegroundColorAttributeName;
  CGColorRef ConstantColor = CGColorGetConstantColor(kCGColorWhite);
  v34[2] = kCTUnderlineStyleAttributeName;
  v35[1] = ConstantColor;
  v35[2] = v14;
  v16 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
  [v7 titleWidth];
  v18 = (UISTextLineDrawing *)objc_msgSend(objc_alloc((Class)UISTextLineDrawing), "initWithString:attributes:lineBreakMode:textAlignment:width:scale:", v11, v16, 1, 2, v17, (double)objc_msgSend(v6, "displayScale"));
  text = v8->_text;
  v8->_text = v18;

  [v7 size];
  v8->_size.width = v20;
  v8->_size.height = v21;
  CFRelease(UIFontForLanguage);
  if ([(UISTextLineDrawing *)v8->_text hasLineBreak])
  {
    v22 = _PBLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = 0;
      v23 = "Callout bar paste button text too small for width.";
LABEL_9:
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v32, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  [(UISTextLineDrawing *)v8->_text drawingSize];
  double v26 = v25;
  double v27 = v24;
  if (v8->_size.width <= v25 * 4.5 && v8->_size.height <= v24 * 3.0)
  {
    [v7 titleOrigin];
    v8->_textOffset.x = v29;
    v8->_textOffset.y = v28;
    if (v26 + v29 > v8->_size.width || v27 + v28 > v8->_size.height)
    {
      v22 = _PBLog();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      __int16 v32 = 0;
      v23 = "Callout bar paste button text too offset in button.";
      goto LABEL_9;
    }

LABEL_15:
    v30 = v8;
    goto LABEL_16;
  }
  v22 = _PBLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    __int16 v32 = 0;
    v23 = "Callout bar paste button too large for text.";
    goto LABEL_9;
  }
LABEL_13:

  v30 = 0;
LABEL_16:

  return v30;
}

- (void)dealloc
{
  text = self->_text;
  self->_text = 0;

  CTFontRemoveFromCaches();
  CGFontCacheGetLocalCache();
  CGFontCacheReset();
  v4.receiver = self;
  v4.super_class = (Class)PBCalloutBarPasteButtonDrawing;
  [(PBCalloutBarPasteButtonDrawing *)&v4 dealloc];
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
}

- (void).cxx_destruct
{
}

@end