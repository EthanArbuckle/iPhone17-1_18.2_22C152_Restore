@interface NTKPolygonCylinderView
- (NTKPolygonCylinderView)init;
- (double)_rotationAngleForFaceIndex:(int64_t)a3;
- (id)viewForSideAtIndex:(unint64_t)a3;
- (unint64_t)numberOfSides;
- (unint64_t)numberOfVisibleSides;
- (void)_informFaceViewsOfRotation;
- (void)_setRotationAngle:(double)a3;
- (void)_updateTransform;
- (void)enumerateSideViewsWithBlock:(id)a3;
- (void)layoutSubviews;
- (void)setNumberOfSides:(unint64_t)a3;
- (void)setView:(id)a3 forSideAtIndex:(unint64_t)a4;
- (void)transitionToFraction:(double)a3 fromSideAtIndex:(unint64_t)a4 toSideAtIndex:(unint64_t)a5;
- (void)transitionToSideAtIndex:(unint64_t)a3;
@end

@implementation NTKPolygonCylinderView

- (NTKPolygonCylinderView)init
{
  v15.receiver = self;
  v15.super_class = (Class)NTKPolygonCylinderView;
  v2 = [(NTKPolygonCylinderView *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(NTKPolygonCylinderView *)v2 layer];
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    v10[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    v10[3] = v5;
    v10[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    uint64_t v6 = *(void *)(MEMORY[0x1E4F39B10] + 80);
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    v10[0] = *MEMORY[0x1E4F39B10];
    v10[1] = v7;
    uint64_t v11 = v6;
    unint64_t v12 = 0xBF6B4E81B4E81B4FLL;
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v14 = v8;
    [v4 setSublayerTransform:v10];

    [(NTKPolygonCylinderView *)v3 _setRotationAngle:0.0];
  }
  return v3;
}

- (void)setNumberOfSides:(unint64_t)a3
{
  if ([(NTKPolygonCylinderView *)self numberOfSides] != a3)
  {
    [(_NTKPolygonCylinderTransformView *)self->_transformView removeFromSuperview];
    long long v5 = [[_NTKPolygonCylinderTransformView alloc] initWithNumberOfFaces:a3];
    transformView = self->_transformView;
    self->_transformView = v5;

    long long v7 = self->_transformView;
    [(NTKPolygonCylinderView *)self addSubview:v7];
  }
}

- (unint64_t)numberOfSides
{
  return [(_NTKPolygonCylinderTransformView *)self->_transformView numberOfFaces];
}

- (unint64_t)numberOfVisibleSides
{
  return [(_NTKPolygonCylinderTransformView *)self->_transformView numberOfVisibleFaces];
}

- (void)setView:(id)a3 forSideAtIndex:(unint64_t)a4
{
}

- (id)viewForSideAtIndex:(unint64_t)a3
{
  return [(_NTKPolygonCylinderTransformView *)self->_transformView viewForFaceAtIndex:a3];
}

- (void)enumerateSideViewsWithBlock:(id)a3
{
}

- (void)transitionToSideAtIndex:(unint64_t)a3
{
  [(NTKPolygonCylinderView *)self _rotationAngleForFaceIndex:a3];
  -[NTKPolygonCylinderView _setRotationAngle:](self, "_setRotationAngle:");
}

- (void)transitionToFraction:(double)a3 fromSideAtIndex:(unint64_t)a4 toSideAtIndex:(unint64_t)a5
{
  unint64_t v8 = [(NTKPolygonCylinderView *)self numberOfSides];
  if (v8 - 1 == a4 && a5 == 0) {
    a5 = v8;
  }
  if (a5 == v8 - 1) {
    unint64_t v10 = v8;
  }
  else {
    unint64_t v10 = 0;
  }
  if (a4) {
    unint64_t v11 = a4;
  }
  else {
    unint64_t v11 = v10;
  }
  [(NTKPolygonCylinderView *)self _rotationAngleForFaceIndex:v11];
  [(NTKPolygonCylinderView *)self _rotationAngleForFaceIndex:a5];
  CLKInterpolateBetweenFloatsClipped();
  -[NTKPolygonCylinderView _setRotationAngle:](self, "_setRotationAngle:");
}

- (void)layoutSubviews
{
  [(NTKPolygonCylinderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = -[_NTKPolygonCylinderTransformView setBounds:](self->_transformView, "setBounds:");
  transformView = self->_transformView;
  MEMORY[0x1C1874A70](v11, v4, v6, v8, v10);
  -[_NTKPolygonCylinderTransformView setCenter:](transformView, "setCenter:");
  [(NTKPolygonCylinderView *)self _updateTransform];
}

- (double)_rotationAngleForFaceIndex:(int64_t)a3
{
  [(_NTKPolygonCylinderTransformView *)self->_transformView rotationAnglePerFace];
  return v4 * (double)a3;
}

- (void)_setRotationAngle:(double)a3
{
  for (; a3 < 0.0; a3 = a3 + 6.28318531)
    ;
  float v4 = a3;
  self->_rotationAngle = fmodf(v4, 6.2832);
  [(NTKPolygonCylinderView *)self _updateTransform];
  [(NTKPolygonCylinderView *)self _informFaceViewsOfRotation];
}

- (void)_informFaceViewsOfRotation
{
  transformView = self->_transformView;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__NTKPolygonCylinderView__informFaceViewsOfRotation__block_invoke;
  v3[3] = &unk_1E62C8BC8;
  v3[4] = self;
  [(_NTKPolygonCylinderTransformView *)transformView enumerateFaceViewsWithBlock:v3];
}

void __52__NTKPolygonCylinderView__informFaceViewsOfRotation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (objc_opt_respondsToSelector())
  {
    [*(id *)(a1 + 32) _rotationAngleForFaceIndex:a2];
    double v6 = vabdd_f64(*(double *)(*(void *)(a1 + 32) + 416), v5);
    if (v6 > 3.14159265) {
      double v6 = 6.28318531 - v6;
    }
    [v7 setRotationFromFront:v6];
  }
}

- (void)_updateTransform
{
  [(_NTKPolygonCylinderTransformView *)self->_transformView faceDistanceToCenter];
  memset(&v8, 0, sizeof(v8));
  CATransform3DMakeTranslation(&v8, 0.0, 0.0, -v3);
  double rotationAngle = self->_rotationAngle;
  CATransform3D v6 = v8;
  CATransform3DRotate(&v7, &v6, rotationAngle, 1.0, 0.0, 0.0);
  CATransform3D v8 = v7;
  double v5 = [(_NTKPolygonCylinderTransformView *)self->_transformView layer];
  CATransform3D v7 = v8;
  [v5 setTransform:&v7];
}

- (void).cxx_destruct
{
}

@end