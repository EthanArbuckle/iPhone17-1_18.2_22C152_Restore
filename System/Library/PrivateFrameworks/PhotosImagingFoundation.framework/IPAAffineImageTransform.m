@interface IPAAffineImageTransform
- (BOOL)canAlignToPixelsExactly;
- (IPAAffineImageTransform)initWithInputGeometry:(id)a3 intrinsicGeometry:(id)a4 matrix:(const Matrix4d *)a5 canAlignToPixelsExactly:(BOOL)a6;
- (Matrix4d)matrix;
- (Vector2d)mapVector:(Vector2d)a3;
- (id)description;
- (id)inverseTransform;
@end

@implementation IPAAffineImageTransform

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(IPAImageTransform *)self inputGeometry];
  v7 = [(IPAImageTransform *)self intrinsicGeometry];
  BOOL canAlignToPixelsExactly = self->_canAlignToPixelsExactly;
  v9 = PA::Matrix4d::description((PA::Matrix4d *)&self->_matrix);
  v10 = [v3 stringWithFormat:@"<%@.%p inputGeometry:%@ intrinsicGeometry:%@ canAlignToPixelsExactly:%d matrix:\n%@>", v5, self, v6, v7, canAlignToPixelsExactly, v9];

  return v10;
}

- (BOOL)canAlignToPixelsExactly
{
  return self->_canAlignToPixelsExactly;
}

- (Vector2d)mapVector:(Vector2d)a3
{
  v5[0] = a3;
  v5[1] = (Vector2d)xmmword_1DD424090;
  double v3 = PA::operator*(self->_matrix.m, &v5[0].X);
  result.Y = v4;
  result.X = v3;
  return result;
}

- (id)inverseTransform
{
  p_matrix = &self->_matrix;
  long long v4 = *(_OWORD *)&self->_matrix.m[10];
  v13[4] = *(_OWORD *)&self->_matrix.m[8];
  v13[5] = v4;
  long long v5 = *(_OWORD *)&self->_matrix.m[14];
  v13[6] = *(_OWORD *)&self->_matrix.m[12];
  v13[7] = v5;
  long long v6 = *(_OWORD *)&self->_matrix.m[2];
  v13[0] = *(_OWORD *)self->_matrix.m;
  v13[1] = v6;
  long long v7 = *(_OWORD *)&self->_matrix.m[6];
  v13[2] = *(_OWORD *)&self->_matrix.m[4];
  v13[3] = v7;
  if (PA::Matrix4d::invert((PA::Matrix4d *)v13))
  {
    id v8 = objc_alloc((Class)objc_opt_class());
    v9 = [(IPAImageTransform *)self intrinsicGeometry];
    v10 = [(IPAImageTransform *)self inputGeometry];
    v11 = (void *)[v8 initWithInputGeometry:v9 intrinsicGeometry:v10 matrix:v13 canAlignToPixelsExactly:self->_canAlignToPixelsExactly];

    return v11;
  }
  else
  {
    PA::Matrix4d::description((PA::Matrix4d *)p_matrix);
    objc_claimAutoreleasedReturnValue();
    id result = (id)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

- (Matrix4d)matrix
{
  long long v3 = *(_OWORD *)&self->m[14];
  *(_OWORD *)&retstr->m[8] = *(_OWORD *)&self->m[12];
  *(_OWORD *)&retstr->m[10] = v3;
  long long v4 = *(_OWORD *)&self[1].m[2];
  *(_OWORD *)&retstr->m[12] = *(_OWORD *)self[1].m;
  *(_OWORD *)&retstr->m[14] = v4;
  long long v5 = *(_OWORD *)&self->m[6];
  *(_OWORD *)retstr->m = *(_OWORD *)&self->m[4];
  *(_OWORD *)&retstr->m[2] = v5;
  long long v6 = *(_OWORD *)&self->m[10];
  *(_OWORD *)&retstr->m[4] = *(_OWORD *)&self->m[8];
  *(_OWORD *)&retstr->m[6] = v6;
  return self;
}

- (IPAAffineImageTransform)initWithInputGeometry:(id)a3 intrinsicGeometry:(id)a4 matrix:(const Matrix4d *)a5 canAlignToPixelsExactly:(BOOL)a6
{
  v15.receiver = self;
  v15.super_class = (Class)IPAAffineImageTransform;
  id result = [(IPAImageTransform *)&v15 initWithInputGeometry:a3 intrinsicGeometry:a4];
  if (result)
  {
    long long v9 = *(_OWORD *)&a5->m[6];
    long long v11 = *(_OWORD *)a5->m;
    long long v10 = *(_OWORD *)&a5->m[2];
    *(_OWORD *)&result->_matrix.m[4] = *(_OWORD *)&a5->m[4];
    *(_OWORD *)&result->_matrix.m[6] = v9;
    *(_OWORD *)result->_matrix.m = v11;
    *(_OWORD *)&result->_matrix.m[2] = v10;
    long long v12 = *(_OWORD *)&a5->m[14];
    long long v14 = *(_OWORD *)&a5->m[8];
    long long v13 = *(_OWORD *)&a5->m[10];
    *(_OWORD *)&result->_matrix.m[12] = *(_OWORD *)&a5->m[12];
    *(_OWORD *)&result->_matrix.m[14] = v12;
    *(_OWORD *)&result->_matrix.m[8] = v14;
    *(_OWORD *)&result->_matrix.m[10] = v13;
    result->_BOOL canAlignToPixelsExactly = a6;
  }
  return result;
}

@end