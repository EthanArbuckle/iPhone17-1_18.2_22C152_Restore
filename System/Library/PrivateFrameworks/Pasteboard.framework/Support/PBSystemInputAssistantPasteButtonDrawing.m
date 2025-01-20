@interface PBSystemInputAssistantPasteButtonDrawing
- (CGSize)drawingSize;
- (PBSystemInputAssistantPasteButtonDrawing)initWithStyle:(id)a3 tag:(id)a4;
- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4;
@end

@implementation PBSystemInputAssistantPasteButtonDrawing

- (PBSystemInputAssistantPasteButtonDrawing)initWithStyle:(id)a3 tag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PBSystemInputAssistantPasteButtonDrawing;
  id v8 = [(PBSystemInputAssistantPasteButtonDrawing *)&v24 init];
  if (v8)
  {
    v9 = +[UISPasteVariant variantForSecureName:0x10000];
    v10 = [v9 glyph];
    v11 = [v6 assetGlyphWithName:v10 glyphSize:2 glyphWeight:4 glyphPointSize:20.0];

    id v12 = objc_msgSend(objc_alloc((Class)UISVectorGlyphDrawing), "initWithVectorGlyph:tintColor:", v11, objc_msgSend(v6, "tintColor"));
    v13 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v12;

    id v14 = [v7 site];
    if (v14)
    {
      if (v14 != (id)1)
      {
LABEL_7:
        [*((id *)v8 + 1) drawingSize];
        v17.f64[1] = v16;
        __asm { FMOV            V1.2D, #0.5 }
        *((float64x2_t *)v8 + 1) = vmulq_f64(vsubq_f64(*((float64x2_t *)v8 + 2), v17), _Q1);

        goto LABEL_8;
      }
      long long v15 = xmmword_100025870;
    }
    else
    {
      long long v15 = xmmword_100025860;
    }
    *((_OWORD *)v8 + 2) = v15;
    goto LABEL_7;
  }
LABEL_8:

  return (PBSystemInputAssistantPasteButtonDrawing *)v8;
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