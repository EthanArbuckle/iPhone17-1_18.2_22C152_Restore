@interface _UIHyperPanGesture
- (UIPanGestureRecognizer)_panGestureRecognizer;
- (_UIHyperPanGesture)init;
- (_UIHyperPanGesture)initWithAxes:(unint64_t)a3;
- (_UIHyperPanGesture)initWithInteractor:(id)a3;
- (double)_multiplier;
- (unint64_t)_axes;
- (void)_getCurrentTranslation:(double *)a3;
- (void)_getCurrentVelocity:(double *)a3;
- (void)_setAxes:(unint64_t)a3;
- (void)_setMultiplier:(double)a3;
- (void)_setPanGestureRecognizer:(id)a3;
@end

@implementation _UIHyperPanGesture

- (_UIHyperPanGesture)init
{
  return [(_UIHyperPanGesture *)self initWithAxes:3];
}

- (_UIHyperPanGesture)initWithAxes:(unint64_t)a3
{
  v5 = [_UIHyperInteractor alloc];
  uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
  v6.i16[0] = vaddlv_u8(v6);
  v7 = [(_UIHyperInteractor *)v5 initWithDimensions:v6.u32[0]];
  v8 = [(_UIHyperPanGesture *)self initWithInteractor:v7];

  if (v8) {
    [(_UIHyperPanGesture *)v8 _setAxes:a3];
  }
  return v8;
}

- (_UIHyperPanGesture)initWithInteractor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIHyperPanGesture;
  result = [(_UIHyperGesture *)&v4 initWithInteractor:a3];
  if (result)
  {
    result->__axes = 3;
    result->__multiplier = 1.0;
  }
  return result;
}

- (UIPanGestureRecognizer)_panGestureRecognizer
{
  panGestureRecognizer = self->__panGestureRecognizer;
  if (!panGestureRecognizer)
  {
    objc_super v4 = objc_alloc_init(UIPanGestureRecognizer);
    [(_UIHyperPanGesture *)self _setPanGestureRecognizer:v4];

    panGestureRecognizer = self->__panGestureRecognizer;
  }
  return panGestureRecognizer;
}

- (void)_setPanGestureRecognizer:(id)a3
{
  id v7 = a3;
  p_panGestureRecognizer = &self->__panGestureRecognizer;
  panGestureRecognizer = self->__panGestureRecognizer;
  if (panGestureRecognizer) {
    [(UIGestureRecognizer *)panGestureRecognizer removeTarget:self action:sel__handleGesture_];
  }
  objc_storeStrong((id *)&self->__panGestureRecognizer, a3);
  if (*p_panGestureRecognizer) {
    [(UIGestureRecognizer *)*p_panGestureRecognizer addTarget:self action:sel__handleGesture_];
  }
}

- (void)_getCurrentTranslation:(double *)a3
{
  uint8x8_t v6 = [(_UIHyperPanGesture *)self _panGestureRecognizer];
  [v6 translationInView:0];
  double v8 = v7;
  double v10 = v9;

  unint64_t v11 = [(_UIHyperPanGesture *)self _axes];
  [(_UIHyperPanGesture *)self _multiplier];
  double v13 = v12;
  v14 = [(_UIHyperGesture *)self _interactor];
  uint64_t v15 = [v14 _dimensions];
  uint8x8_t v16 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
  v16.i16[0] = vaddlv_u8(v16);
  uint64_t v17 = v16.u32[0];

  if (v15 == v17)
  {
    if ((v11 & 1) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    *a3 = v8 * v13;
    uint64_t v18 = 1;
    if ((v11 & 2) == 0) {
      return;
    }
    goto LABEL_7;
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIHyperGesture.m", 136, @"_UIHyperPanGesture must be used with an interactor of dimensionality compatible with axes (%lu).", v11);

  if (v11) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v18 = 0;
  if ((v11 & 2) != 0) {
LABEL_7:
  }
    a3[v18] = v10 * v13;
}

- (void)_getCurrentVelocity:(double *)a3
{
  uint8x8_t v6 = [(_UIHyperPanGesture *)self _panGestureRecognizer];
  [v6 velocityInView:0];
  double v8 = v7;
  double v10 = v9;

  unint64_t v11 = [(_UIHyperPanGesture *)self _axes];
  [(_UIHyperPanGesture *)self _multiplier];
  double v13 = v12;
  v14 = [(_UIHyperGesture *)self _interactor];
  uint64_t v15 = [v14 _dimensions];
  uint8x8_t v16 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
  v16.i16[0] = vaddlv_u8(v16);
  uint64_t v17 = v16.u32[0];

  if (v15 == v17)
  {
    if ((v11 & 1) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    *a3 = v8 * v13;
    uint64_t v18 = 1;
    if ((v11 & 2) == 0) {
      return;
    }
    goto LABEL_7;
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIHyperGesture.m", 155, @"_UIHyperPanGesture must be used with an interactor of dimensionality compatible with axes (%lu).", v11);

  if (v11) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v18 = 0;
  if ((v11 & 2) != 0) {
LABEL_7:
  }
    a3[v18] = v10 * v13;
}

- (unint64_t)_axes
{
  return self->__axes;
}

- (void)_setAxes:(unint64_t)a3
{
  self->__axes = a3;
}

- (double)_multiplier
{
  return self->__multiplier;
}

- (void)_setMultiplier:(double)a3
{
  self->__multiplier = a3;
}

- (void).cxx_destruct
{
}

@end