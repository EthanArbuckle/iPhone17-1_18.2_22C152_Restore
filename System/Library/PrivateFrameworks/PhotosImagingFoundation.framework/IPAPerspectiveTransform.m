@interface IPAPerspectiveTransform
- (BOOL)canAlignToPixelsExactly;
- (IPAPerspectiveTransform)initWithInputGeometry:(id)a3 intrinsicGeometry:(id)a4 projectionTransform:(const Matrix4d *)a5 viewingTransform:(const Matrix4d *)a6;
- (Vector2d)mapVector:(Vector2d)a3;
- (id)intrinsicGeometry;
- (id)inverseTransform;
@end

@implementation IPAPerspectiveTransform

- (void).cxx_destruct
{
}

- (BOOL)canAlignToPixelsExactly
{
  return 0;
}

- (id)intrinsicGeometry
{
  return self->_intrinsicGeometry;
}

- (id)inverseTransform
{
  if (self->_isInverse)
  {
    _PFAssertFailHandler();
    goto LABEL_8;
  }
  long long v4 = *(_OWORD *)&self->_projectionTransform.m[10];
  v19[4] = *(_OWORD *)&self->_projectionTransform.m[8];
  v19[5] = v4;
  long long v5 = *(_OWORD *)&self->_projectionTransform.m[14];
  v19[6] = *(_OWORD *)&self->_projectionTransform.m[12];
  v19[7] = v5;
  long long v6 = *(_OWORD *)&self->_projectionTransform.m[2];
  v19[0] = *(_OWORD *)self->_projectionTransform.m;
  v19[1] = v6;
  long long v7 = *(_OWORD *)&self->_projectionTransform.m[6];
  v19[2] = *(_OWORD *)&self->_projectionTransform.m[4];
  v19[3] = v7;
  if (!PA::Matrix4d::invert((PA::Matrix4d *)v19))
  {
LABEL_8:
    _PFAssertFailHandler();
LABEL_9:
    v17 = (_Unwind_Exception *)_PFAssertFailHandler();

    _Unwind_Resume(v17);
  }
  long long v8 = *(_OWORD *)&self->_viewingTransform.m[10];
  v18[4] = *(_OWORD *)&self->_viewingTransform.m[8];
  v18[5] = v8;
  long long v9 = *(_OWORD *)&self->_viewingTransform.m[14];
  v18[6] = *(_OWORD *)&self->_viewingTransform.m[12];
  v18[7] = v9;
  long long v10 = *(_OWORD *)&self->_viewingTransform.m[2];
  v18[0] = *(_OWORD *)self->_viewingTransform.m;
  v18[1] = v10;
  long long v11 = *(_OWORD *)&self->_viewingTransform.m[6];
  v18[2] = *(_OWORD *)&self->_viewingTransform.m[4];
  v18[3] = v11;
  if (!PA::Matrix4d::invert((PA::Matrix4d *)v18)) {
    goto LABEL_9;
  }
  v12 = [IPAPerspectiveTransform alloc];
  intrinsicGeometry = self->_intrinsicGeometry;
  v14 = [(IPAImageTransform *)self inputGeometry];
  v15 = [(IPAPerspectiveTransform *)v12 initWithInputGeometry:intrinsicGeometry intrinsicGeometry:v14 projectionTransform:v19 viewingTransform:v18];

  v15->_isInverse = !self->_isInverse;
  return v15;
}

- (Vector2d)mapVector:(Vector2d)a3
{
  if (self->_isInverse)
  {
    Vector2d v54 = a3;
    long long v55 = xmmword_1DD424090;
    v4.n128_f64[0] = PA::operator*(self->_viewingTransform.m, &v54.X);
    v4.n128_u64[1] = v5;
    __n128 v53 = v4;
    PA::Matrix4d::MultiplyWithProject(self->_projectionTransform.m, v4, -1.0);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    PA::Matrix4d::MultiplyWithProject(self->_projectionTransform.m, v53, 1.0);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v18 = [(IPAImageTransform *)self inputGeometry];
    char v19 = [v18 conformsToProtocol:&unk_1F38A5400];

    if ((v19 & 1) == 0)
    {
      v52 = (_Unwind_Exception *)_PFAssertFailHandler();

      _Unwind_Resume(v52);
    }
    v20 = [(IPAImageTransform *)self inputGeometry];
    v21 = v20;
    double v22 = 0.0;
    double v23 = 0.0;
    double v24 = 0.0;
    double v25 = 0.0;
    double Y = 0.0;
    double X = 0.0;
    if (v20)
    {
      objc_msgSend(v20, "imageQuad", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
      double X = v54.X;
      double Y = v54.Y;
      double v24 = *((double *)&v55 + 1);
      double v25 = *(double *)&v55;
      double v23 = v56;
      double v22 = v57;
    }
    double v28 = v25 - X;
    double v29 = v24 - Y;
    double v30 = v23 - X;
    double v31 = v22 - Y;
    double v32 = v31 * -0.0 + v29 * 0.0;
    double v33 = v28 * -0.0 + v30 * 0.0;
    double v34 = v28 * v31 - v29 * v30;
    double v35 = sqrt(v33 * v33 + v32 * v32 + v34 * v34);
    double v36 = v32 / v35;
    double v37 = v33 / v35;
    double v38 = v34 / v35;
    double v39 = v37 * (v15 - v9) + v36 * (v13 - v7) + v34 / v35 * (v17 - v11);
    double v40 = fabs(v39);
    double v41 = 2.22044605e-16;
    if (v40 < 2.22044605e-16)
    {
      double v43 = unk_1EAB21350;
    }
    else
    {
      double v42 = -(v37 * (v9 - Y) + v36 * (v7 - X) + v38 * v11) / v39;
      double v41 = v7 + (v13 - v7) * v42;
      double v43 = v9 + (v15 - v9) * v42;
    }
    if (v40 < 2.22044605e-16) {
      double v44 = *(double *)&kIPAGeometryInvalidPoint;
    }
    else {
      double v44 = v41;
    }
  }
  else
  {
    double v45 = a3.Y;
    PA::Matrix4d::MultiplyWithProject(self->_projectionTransform.m, (__n128)a3, 0.0);
    v54.double X = v46;
    v54.double Y = v47;
    *(void *)&long long v55 = v48;
    *((void *)&v55 + 1) = 0x3FF0000000000000;
    double v44 = PA::operator*(self->_viewingTransform.m, &v54.X);
    double v43 = v49;
  }
  double v50 = v44;
  double v51 = v43;
  result.double Y = v51;
  result.double X = v50;
  return result;
}

- (IPAPerspectiveTransform)initWithInputGeometry:(id)a3 intrinsicGeometry:(id)a4 projectionTransform:(const Matrix4d *)a5 viewingTransform:(const Matrix4d *)a6
{
  id v11 = a4;
  v27.receiver = self;
  v27.super_class = (Class)IPAPerspectiveTransform;
  double v12 = [(IPAImageTransform *)&v27 initWithInputGeometry:a3 intrinsicGeometry:v11];
  double v13 = (IPAPerspectiveTransform *)v12;
  if (v12)
  {
    long long v14 = *(_OWORD *)&a5->m[6];
    long long v16 = *(_OWORD *)a5->m;
    long long v15 = *(_OWORD *)&a5->m[2];
    *(_OWORD *)(v12 + 56) = *(_OWORD *)&a5->m[4];
    *(_OWORD *)(v12 + 72) = v14;
    *(_OWORD *)(v12 + 24) = v16;
    *(_OWORD *)(v12 + 40) = v15;
    long long v17 = *(_OWORD *)&a5->m[14];
    long long v19 = *(_OWORD *)&a5->m[8];
    long long v18 = *(_OWORD *)&a5->m[10];
    *(_OWORD *)(v12 + 120) = *(_OWORD *)&a5->m[12];
    *(_OWORD *)(v12 + 136) = v17;
    *(_OWORD *)(v12 + 88) = v19;
    *(_OWORD *)(v12 + 104) = v18;
    long long v20 = *(_OWORD *)&a6->m[6];
    long long v22 = *(_OWORD *)a6->m;
    long long v21 = *(_OWORD *)&a6->m[2];
    *(_OWORD *)(v12 + 184) = *(_OWORD *)&a6->m[4];
    *(_OWORD *)(v12 + 200) = v20;
    *(_OWORD *)(v12 + 152) = v22;
    *(_OWORD *)(v12 + 168) = v21;
    long long v23 = *(_OWORD *)&a6->m[14];
    long long v25 = *(_OWORD *)&a6->m[8];
    long long v24 = *(_OWORD *)&a6->m[10];
    *(_OWORD *)(v12 + 248) = *(_OWORD *)&a6->m[12];
    *(_OWORD *)(v12 + 264) = v23;
    *(_OWORD *)(v12 + 216) = v25;
    *(_OWORD *)(v12 + 232) = v24;
    objc_storeStrong((id *)v12 + 35, a4);
  }

  return v13;
}

@end