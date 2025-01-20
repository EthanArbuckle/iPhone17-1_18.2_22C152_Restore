@interface PBUndoInteractionHUDTextPasteButtonDrawing
- (CGSize)drawingSize;
- (PBUndoInteractionHUDTextPasteButtonDrawing)initWithStyle:(id)a3 tag:(id)a4;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4;
@end

@implementation PBUndoInteractionHUDTextPasteButtonDrawing

- (PBUndoInteractionHUDTextPasteButtonDrawing)initWithStyle:(id)a3 tag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)PBUndoInteractionHUDTextPasteButtonDrawing;
  v8 = [(PBUndoInteractionHUDTextPasteButtonDrawing *)&v35 init];
  if (!v8) {
    goto LABEL_6;
  }
  v9 = +[UISPasteVariant variantForSecureName:0x10000];
  id v10 = [v6 newFontForTextStyle:_UISKBUndoInteractiveControlLabelTextStyle attributes:0];
  v11 = [v6 localization];
  v12 = [v9 localizedStringForLocalization:v11];

  v37[0] = v10;
  v36[0] = kCTFontAttributeName;
  v36[1] = kCTForegroundColorAttributeName;
  v37[1] = [v6 tintColor];
  v13 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
  CFRelease(v10);
  id v14 = objc_msgSend(objc_alloc((Class)UISTextLineDrawing), "initWithString:attributes:lineBreakMode:textAlignment:width:scale:", v12, v13, 2, 0, NAN, (double)objc_msgSend(v6, "displayScale"));
  v15 = (void *)*((void *)v8 + 1);
  *((void *)v8 + 1) = v14;

  [*((id *)v8 + 1) drawingSize];
  float64_t v32 = v17;
  double v33 = v16;
  double v18 = v16 + 32.0;
  [v7 minWidth];
  v20.f64[0] = v33;
  if (v18 >= v19) {
    double v19 = v18;
  }
  *((double *)v8 + 2) = v19;
  if (v19 <= v33 * 4.5)
  {
    v21 = (const double *)&qword_100025880;
    float64x2_t v22 = vld1q_dup_f64(v21);
    v22.f64[0] = v19;
    v20.f64[1] = v32;
    float64x2_t v23 = vsubq_f64(v22, v20);
    __asm { FMOV            V1.2D, #0.5 }
    *(float64x2_t *)(v8 + 24) = vmulq_f64(v23, _Q1);

LABEL_6:
    v29 = v8;
    goto LABEL_10;
  }
  v30 = _PBLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Undo interaction HUD text paste button is too wide.", buf, 2u);
  }

  v29 = 0;
LABEL_10:

  return v29;
}

- (void)dealloc
{
  text = self->_text;
  self->_text = 0;

  CTFontRemoveFromCaches();
  CGFontCacheGetLocalCache();
  CGFontCacheReset();
  v4.receiver = self;
  v4.super_class = (Class)PBUndoInteractionHUDTextPasteButtonDrawing;
  [(PBUndoInteractionHUDTextPasteButtonDrawing *)&v4 dealloc];
}

- (CGSize)drawingSize
{
  double width = self->_width;
  double v3 = 77.0;
  result.height = v3;
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