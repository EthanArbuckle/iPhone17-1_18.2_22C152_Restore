@interface _NTKPolygonCylinderTransformView
+ (Class)layerClass;
- (CATransform3D)_transformForFaceIndex:(SEL)a3;
- (_NTKPolygonCylinderTransformView)initWithNumberOfFaces:(unint64_t)a3;
- (double)faceDistanceToCenter;
- (double)rotationAnglePerFace;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)viewForFaceAtIndex:(unint64_t)a3;
- (unint64_t)numberOfFaces;
- (unint64_t)numberOfVisibleFaces;
- (void)enumerateFaceViewsWithBlock:(id)a3;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setView:(id)a3 forFaceAtIndex:(unint64_t)a4;
@end

@implementation _NTKPolygonCylinderTransformView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_NTKPolygonCylinderTransformView;
  -[_NTKPolygonCylinderTransformView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_NTKPolygonCylinderTransformView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    v5 = 0;
  }
  v7 = v5;

  return v7;
}

- (_NTKPolygonCylinderTransformView)initWithNumberOfFaces:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_NTKPolygonCylinderTransformView;
  v4 = [(_NTKPolygonCylinderTransformView *)&v11 init];
  if (v4)
  {
    if (a3 <= 1) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ cannot have fewer than 2 faces", objc_opt_class() format];
    }
    v4->_numberOfFaces = a3;
    double v5 = 6.28318531 / (double)a3;
    if (v5 <= 1.57079633)
    {
      unint64_t numberOfVisibleFaces = v4->_numberOfVisibleFaces;
      double v7 = 6.28318531 / (double)a3;
      do
      {
        ++numberOfVisibleFaces;
        double v7 = v5 + v7;
      }
      while (v7 <= 1.57079633);
      v4->_unint64_t numberOfVisibleFaces = numberOfVisibleFaces;
      double v5 = 6.28318531 / (double)v4->_numberOfFaces;
    }
    v4->_exteriorAngle = v5;
    v4->_interiorAngle = 3.14159265 - v5;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    faceViews = v4->_faceViews;
    v4->_faceViews = v8;
  }
  return v4;
}

- (void)setView:(id)a3 forFaceAtIndex:(unint64_t)a4
{
  id v13 = a3;
  faceViews = self->_faceViews;
  double v7 = [NSNumber numberWithUnsignedInteger:a4];
  id v8 = [(NSMutableDictionary *)faceViews objectForKey:v7];

  if (v8 != v13)
  {
    [v8 removeFromSuperview];
    if (v13)
    {
      objc_super v9 = [v13 layer];
      [v9 setDoubleSided:0];

      [(_NTKPolygonCylinderTransformView *)self addSubview:v13];
      v10 = self->_faceViews;
      objc_super v11 = [NSNumber numberWithUnsignedInteger:a4];
      [(NSMutableDictionary *)v10 setObject:v13 forKey:v11];
    }
    else
    {
      v12 = self->_faceViews;
      objc_super v11 = [NSNumber numberWithUnsignedInteger:a4];
      [(NSMutableDictionary *)v12 removeObjectForKey:v11];
    }
  }
}

- (id)viewForFaceAtIndex:(unint64_t)a3
{
  faceViews = self->_faceViews;
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  double v5 = [(NSMutableDictionary *)faceViews objectForKey:v4];

  return v5;
}

- (void)enumerateFaceViewsWithBlock:(id)a3
{
  v4 = (void (**)(id, unint64_t, void *, unsigned char *))a3;
  unsigned __int8 v10 = 0;
  if (self->_numberOfFaces)
  {
    unint64_t v5 = 0;
    do
    {
      faceViews = self->_faceViews;
      double v7 = [NSNumber numberWithUnsignedInteger:v5];
      id v8 = [(NSMutableDictionary *)faceViews objectForKey:v7];

      if (v8) {
        v4[2](v4, v5, v8, &v10);
      }
      int v9 = v10;

      if (v9) {
        break;
      }
      ++v5;
    }
    while (v5 < self->_numberOfFaces);
  }
}

- (double)rotationAnglePerFace
{
  return self->_exteriorAngle;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  v6.receiver = self;
  v6.super_class = (Class)_NTKPolygonCylinderTransformView;
  -[_NTKPolygonCylinderTransformView setBounds:](&v6, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width);
  float v5 = self->_interiorAngle * 0.5;
  self->_faceDistanceToCenter = height * 0.5 * tanf(v5);
}

- (void)layoutSubviews
{
  uint64_t v3 = [(_NTKPolygonCylinderTransformView *)self bounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  double v12 = MEMORY[0x1C1874A70](v3);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50___NTKPolygonCylinderTransformView_layoutSubviews__block_invoke;
  v14[3] = &unk_1E62C8BF0;
  *(double *)&v14[5] = v12;
  v14[6] = v13;
  v14[7] = v5;
  v14[8] = v7;
  v14[9] = v9;
  v14[10] = v11;
  v14[4] = self;
  [(_NTKPolygonCylinderTransformView *)self enumerateFaceViewsWithBlock:v14];
}

- (CATransform3D)_transformForFaceIndex:(SEL)a3
{
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  CATransform3DMakeRotation(retstr, -(self->_exteriorAngle * (double)a4), 1.0, 0.0, 0.0);
  double faceDistanceToCenter = self->_faceDistanceToCenter;
  long long v7 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v16.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v16.m33 = v7;
  long long v8 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v16.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v16.m43 = v8;
  long long v9 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v16.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v16.m13 = v9;
  long long v10 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v16.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v16.m23 = v10;
  result = CATransform3DTranslate(&v17, &v16, 0.0, 0.0, faceDistanceToCenter);
  long long v12 = *(_OWORD *)&v17.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v17.m31;
  *(_OWORD *)&retstr->m33 = v12;
  long long v13 = *(_OWORD *)&v17.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v17.m41;
  *(_OWORD *)&retstr->m43 = v13;
  long long v14 = *(_OWORD *)&v17.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v17.m11;
  *(_OWORD *)&retstr->m13 = v14;
  long long v15 = *(_OWORD *)&v17.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v17.m21;
  *(_OWORD *)&retstr->m23 = v15;
  return result;
}

- (unint64_t)numberOfFaces
{
  return self->_numberOfFaces;
}

- (unint64_t)numberOfVisibleFaces
{
  return self->_numberOfVisibleFaces;
}

- (double)faceDistanceToCenter
{
  return self->_faceDistanceToCenter;
}

- (void).cxx_destruct
{
}

@end