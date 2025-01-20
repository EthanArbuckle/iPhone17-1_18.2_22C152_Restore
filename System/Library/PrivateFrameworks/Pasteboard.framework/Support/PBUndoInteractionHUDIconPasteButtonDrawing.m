@interface PBUndoInteractionHUDIconPasteButtonDrawing
- (CGSize)drawingSize;
- (PBUndoInteractionHUDIconPasteButtonDrawing)initWithStyle:(id)a3 tag:(id)a4;
- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4;
@end

@implementation PBUndoInteractionHUDIconPasteButtonDrawing

- (PBUndoInteractionHUDIconPasteButtonDrawing)initWithStyle:(id)a3 tag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)PBUndoInteractionHUDIconPasteButtonDrawing;
  v8 = [(PBUndoInteractionHUDIconPasteButtonDrawing *)&v33 init];
  if (!v8) {
    goto LABEL_6;
  }
  v9 = +[UISPasteVariant variantForSecureName:0x10000];
  v10 = [v9 glyph];
  v11 = [v6 assetGlyphWithName:v10 glyphSize:2 textStyle:_UISKBUndoInteractiveControlLabelTextStyle];

  id v12 = objc_msgSend(objc_alloc((Class)UISVectorGlyphDrawing), "initWithVectorGlyph:tintColor:", v11, objc_msgSend(v6, "tintColor"));
  v13 = (void *)*((void *)v8 + 1);
  *((void *)v8 + 1) = v12;

  [*((id *)v8 + 1) drawingSize];
  float64_t v30 = v15;
  double v31 = v14;
  double v16 = v14 + 32.0;
  [v7 minWidth];
  v18.f64[0] = v31;
  if (v16 >= v17) {
    double v17 = v16;
  }
  *((double *)v8 + 2) = v17;
  if (v17 <= v31 * 4.5)
  {
    v19 = (const double *)&qword_100025880;
    float64x2_t v20 = vld1q_dup_f64(v19);
    v20.f64[0] = v17;
    v18.f64[1] = v30;
    float64x2_t v21 = vsubq_f64(v20, v18);
    __asm { FMOV            V1.2D, #0.5 }
    *(float64x2_t *)(v8 + 24) = vmulq_f64(v21, _Q1);

LABEL_6:
    v27 = v8;
    goto LABEL_10;
  }
  v28 = _PBLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Undo interaction HUD icon paste button is too wide.", buf, 2u);
  }

  v27 = 0;
LABEL_10:

  return v27;
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