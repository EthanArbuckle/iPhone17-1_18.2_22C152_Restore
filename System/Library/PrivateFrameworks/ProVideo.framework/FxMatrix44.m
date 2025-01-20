@interface FxMatrix44
+ (BOOL)supportsSecureCoding;
- (BOOL)_planarInverseZ;
- (BOOL)invert;
- (BOOL)invertColorMatrixWithTolerance:(double)a3;
- (CGPoint)transform2DPoint:(CGPoint)a3;
- (FxMatrix44)init;
- (FxMatrix44)initWithCoder:(id)a3;
- (FxMatrix44)initWithColorMatrix44Data:(double)a3[4][4];
- (FxMatrix44)initWithFxMatrix:(id)a3;
- (FxMatrix44)initWithInverseOfFxMatrix:(id)a3;
- (FxMatrix44)initWithMatrix44Data:(double)a3[4][4];
- (FxPoint3D)transform3DPoint:(FxPoint3D)a3;
- (double)matrix;
- (id)copy;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMatrix:(double)a3[4][4];
- (void)setToIdentity;
- (void)transpose;
@end

@implementation FxMatrix44

- (FxMatrix44)init
{
  v6.receiver = self;
  v6.super_class = (Class)FxMatrix44;
  result = [(FxMatrix44 *)&v6 init];
  uint64_t v3 = 0;
  mat = result->_mat;
  do
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      if (v3 == i) {
        result->_mat[v3][v3] = 1.0;
      }
      else {
        (*mat)[i] = 0.0;
      }
    }
    ++v3;
    ++mat;
  }
  while (v3 != 4);
  return result;
}

- (FxMatrix44)initWithMatrix44Data:(double)a3[4][4]
{
  v8.receiver = self;
  v8.super_class = (Class)FxMatrix44;
  result = [(FxMatrix44 *)&v8 init];
  uint64_t v5 = 0;
  mat = result->_mat;
  do
  {
    for (uint64_t i = 0; i != 4; ++i)
      (*mat)[i] = (*a3)[i];
    ++v5;
    ++a3;
    ++mat;
  }
  while (v5 != 4);
  if (fabs(result->_mat[2][2]) < 0.00000011920929)
  {
    result->_mat[0][2] = 0.0;
    result->_mat[1][2] = 0.0;
    result->_mat[2][2] = 0.0;
    result->_mat[3][2] = 0.0;
  }
  return result;
}

- (FxMatrix44)initWithColorMatrix44Data:(double)a3[4][4]
{
  v8.receiver = self;
  v8.super_class = (Class)FxMatrix44;
  result = [(FxMatrix44 *)&v8 init];
  uint64_t v5 = 0;
  mat = result->_mat;
  do
  {
    for (uint64_t i = 0; i != 4; ++i)
      (*mat)[i] = (*a3)[i];
    ++v5;
    ++a3;
    ++mat;
  }
  while (v5 != 4);
  return result;
}

- (FxMatrix44)initWithFxMatrix:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FxMatrix44;
  result = [(FxMatrix44 *)&v9 init];
  uint64_t v5 = 0;
  objc_super v6 = (char *)a3 + 8;
  mat = result->_mat;
  do
  {
    for (uint64_t i = 0; i != 4; ++i)
      (*mat)[i] = *(double *)&v6[i * 8];
    ++v5;
    v6 += 32;
    ++mat;
  }
  while (v5 != 4);
  return result;
}

- (FxMatrix44)initWithInverseOfFxMatrix:(id)a3
{
  uint64_t v3 = [(FxMatrix44 *)self initWithFxMatrix:a3];
  v4 = v3;
  if (v3 && ![(FxMatrix44 *)v3 invert])
  {

    return 0;
  }
  return v4;
}

- (id)copy
{
  uint64_t v3 = [FxMatrix44 alloc];

  return [(FxMatrix44 *)v3 initWithFxMatrix:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (FxMatrix44)initWithCoder:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)FxMatrix44;
  v4 = [(FxMatrix44 *)&v15 init];
  if (v4)
  {
    uint64_t v14 = 0;
    uint64_t v5 = (long long *)[a3 decodeBytesForKey:@"Matrix" returnedLength:&v14];
    if (v14 == 128)
    {
      long long v6 = *v5;
      long long v7 = v5[1];
      long long v8 = v5[2];
      *(_OWORD *)(v4 + 56) = v5[3];
      *(_OWORD *)(v4 + 40) = v8;
      *(_OWORD *)(v4 + 24) = v7;
      *(_OWORD *)(v4 + 8) = v6;
      long long v9 = v5[4];
      long long v10 = v5[5];
      long long v11 = v5[6];
      *(_OWORD *)(v4 + 120) = v5[7];
      *(_OWORD *)(v4 + 104) = v11;
      *(_OWORD *)(v4 + 88) = v10;
      *(_OWORD *)(v4 + 72) = v9;
    }
    else
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Found an invalid data length in %s", "-[FxMatrix44 initWithCoder:]");
      uint64_t v16 = *MEMORY[0x1E4F28568];
      v17[0] = v12;
      objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", FxPlugErrorDomain, 15, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1)));
    }
  }
  return (FxMatrix44 *)v4;
}

- (void)setToIdentity
{
  uint64_t v2 = 0;
  mat = self->_mat;
  do
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      if (v2 == i) {
        self->_mat[v2][v2] = 1.0;
      }
      else {
        (*mat)[i] = 0.0;
      }
    }
    ++v2;
    ++mat;
  }
  while (v2 != 4);
}

- (void)setMatrix:(double)a3[4][4]
{
  uint64_t v3 = 0;
  mat = self->_mat;
  do
  {
    for (uint64_t i = 0; i != 4; ++i)
      (*mat)[i] = (*a3)[i];
    ++v3;
    ++a3;
    ++mat;
  }
  while (v3 != 4);
}

- (double)matrix
{
  return (double (*)[4][4])self->_mat;
}

- (BOOL)_planarInverseZ
{
  double v3 = self->_mat[1][0];
  double v2 = self->_mat[1][1];
  double v4 = self->_mat[3][3];
  double v5 = self->_mat[1][3];
  double v7 = self->_mat[3][0];
  double v6 = self->_mat[3][1];
  double v8 = v2 * v4 - v6 * v5;
  double v9 = self->_mat[0][3];
  double v10 = v5 * v7 - v4 * v3;
  double v12 = self->_mat[0][0];
  double v11 = self->_mat[0][1];
  double v13 = v6 * v3 - v2 * v7;
  double v14 = v9 * v13 + v8 * v12 + v11 * v10;
  double v15 = fabs(v14);
  if (v15 >= 0.00000011920929)
  {
    self->_mat[0][0] = v8 * (1.0 / v14);
    self->_mat[0][1] = (v6 * v9 - v4 * v11) * (1.0 / v14);
    self->_mat[0][3] = (v5 * v11 - v2 * v9) * (1.0 / v14);
    self->_mat[1][0] = v10 * (1.0 / v14);
    self->_mat[1][1] = (v4 * v12 - v9 * v7) * (1.0 / v14);
    self->_mat[1][3] = (v9 * v3 - v5 * v12) * (1.0 / v14);
    self->_mat[3][0] = v13 * (1.0 / v14);
    self->_mat[3][1] = (v11 * v7 - v6 * v12) * (1.0 / v14);
    self->_mat[3][3] = (v2 * v12 - v11 * v3) * (1.0 / v14);
    self->_mat[3][2] = 0.0;
    self->_mat[1][2] = 0.0;
    self->_mat[0][2] = 0.0;
    *(_OWORD *)&self->_mat[2][0] = 0u;
    *(_OWORD *)&self->_mat[2][2] = 0u;
  }
  return v15 >= 0.00000011920929;
}

- (BOOL)invert
{
  double v3 = self->_mat[3][2];
  double v4 = self->_mat[3][3];
  double v5 = self->_mat[2][2];
  double v6 = self->_mat[2][3];
  double v7 = v5 * v4 - v3 * v6;
  double v9 = self->_mat[2][0];
  double v8 = self->_mat[2][1];
  double v10 = self->_mat[3][0];
  double v11 = self->_mat[3][1];
  double v12 = v4 * v8 - v6 * v11;
  double v13 = v3 * v8 - v5 * v11;
  double v14 = v4 * v9 - v6 * v10;
  double v15 = v3 * v9 - v5 * v10;
  double v16 = v11 * v9 - v8 * v10;
  double v17 = self->_mat[1][0];
  double v18 = self->_mat[1][1];
  double v19 = self->_mat[1][2];
  double v20 = self->_mat[1][3];
  double v21 = v7 * v18 - v12 * v19 + v13 * v20;
  double v22 = v15 * v20 + v7 * v17 - v19 * v14;
  double v23 = v16 * v20 + v12 * v17 - v18 * v14;
  double v24 = v19 * v16 + v13 * v17 - v18 * v15;
  double v25 = self->_mat[0][0];
  double v26 = self->_mat[0][1];
  double v27 = self->_mat[0][2];
  double v28 = self->_mat[0][3];
  double v29 = v23 * v27 + v21 * v25 - v26 * v22;
  if (vabdd_f64(v29, v24 * v28) >= 0.00000011920929)
  {
    double v43 = v29 - v24 * v28;
    double v31 = v4 * v19 - v3 * v20;
    double v32 = v4 * v18 - v11 * v20;
    double v33 = v3 * v18 - v11 * v19;
    double v34 = v4 * v17 - v10 * v20;
    double v35 = v3 * v17 - v10 * v19;
    double v36 = v11 * v17 - v10 * v18;
    double v37 = v6 * v19 - v5 * v20;
    double v38 = v6 * v18 - v8 * v20;
    double v39 = v5 * v18 - v8 * v19;
    double v40 = v6 * v17 - v9 * v20;
    double v41 = v5 * v17 - v9 * v19;
    double v42 = v8 * v17 - v9 * v18;
    self->_mat[0][0] = v21 * (1.0 / v43);
    self->_mat[0][1] = -((v7 * v26 - v12 * v27 + v13 * v28) * (1.0 / v43));
    self->_mat[0][2] = 1.0 / v43 * (v28 * v33 + v26 * v31 - v27 * v32);
    self->_mat[0][3] = -((v28 * v39 + v26 * v37 - v27 * v38) * (1.0 / v43));
    self->_mat[1][0] = -(v22 * (1.0 / v43));
    self->_mat[1][1] = (v7 * v25 - v14 * v27 + v15 * v28) * (1.0 / v43);
    self->_mat[1][2] = -((v28 * v35 + v25 * v31 - v27 * v34) * (1.0 / v43));
    self->_mat[1][3] = 1.0 / v43 * (v28 * v41 + v25 * v37 - v27 * v40);
    self->_mat[2][0] = v23 * (1.0 / v43);
    self->_mat[2][1] = -((v12 * v25 - v14 * v26 + v16 * v28) * (1.0 / v43));
    self->_mat[2][2] = 1.0 / v43 * (v28 * v36 + v25 * v32 - v26 * v34);
    self->_mat[2][3] = -((v28 * v42 + v25 * v38 - v26 * v40) * (1.0 / v43));
    self->_mat[3][0] = -(v24 * (1.0 / v43));
    self->_mat[3][1] = (v13 * v25 - v15 * v26 + v16 * v27) * (1.0 / v43);
    self->_mat[3][2] = -((v27 * v36 + v25 * v33 - v26 * v35) * (1.0 / v43));
    self->_mat[3][3] = 1.0 / v43 * (v27 * v42 + v25 * v39 - v26 * v41);
    return 1;
  }
  else if (fabs(v5) >= 0.00000011920929)
  {
    return 0;
  }
  else
  {
    return [(FxMatrix44 *)self _planarInverseZ];
  }
}

- (BOOL)invertColorMatrixWithTolerance:(double)a3
{
  double v3 = self->_mat[3][2];
  double v4 = self->_mat[3][3];
  double v5 = self->_mat[2][2];
  double v6 = self->_mat[2][3];
  double v7 = v5 * v4 - v3 * v6;
  double v9 = self->_mat[2][0];
  double v8 = self->_mat[2][1];
  double v10 = self->_mat[3][0];
  double v11 = self->_mat[3][1];
  double v12 = v4 * v8 - v6 * v11;
  double v13 = v3 * v8 - v5 * v11;
  double v14 = v4 * v9 - v6 * v10;
  double v15 = v3 * v9 - v5 * v10;
  double v16 = v11 * v9 - v8 * v10;
  double v17 = self->_mat[1][0];
  double v18 = self->_mat[1][1];
  double v19 = self->_mat[1][2];
  double v20 = self->_mat[1][3];
  double v21 = v7 * v18 - v12 * v19 + v13 * v20;
  double v22 = v15 * v20 + v7 * v17 - v19 * v14;
  double v23 = v16 * v20 + v12 * v17 - v18 * v14;
  double v24 = v19 * v16 + v13 * v17 - v18 * v15;
  double v25 = self->_mat[0][0];
  double v26 = self->_mat[0][1];
  double v27 = self->_mat[0][2];
  double v28 = self->_mat[0][3];
  double v29 = v23 * v27 + v21 * v25 - v26 * v22;
  double v30 = v29 - v24 * v28;
  BOOL v31 = vabdd_f64(v29, v24 * v28) >= a3 && v30 != 0.0;
  if (v31)
  {
    double v32 = v4 * v19 - v3 * v20;
    double v33 = v4 * v18 - v11 * v20;
    double v45 = v3 * v18 - v11 * v19;
    double v34 = v4 * v17 - v10 * v20;
    double v35 = v3 * v17 - v10 * v19;
    double v36 = v11 * v17 - v10 * v18;
    double v37 = v6 * v19 - v5 * v20;
    double v38 = v6 * v18 - v8 * v20;
    double v39 = v5 * v18 - v8 * v19;
    double v40 = v6 * v17 - v9 * v20;
    double v41 = v5 * v17 - v9 * v19;
    double v42 = v8 * v17 - v9 * v18;
    double v43 = 1.0 / v30;
    self->_mat[0][0] = v21 * v43;
    self->_mat[0][1] = -((v7 * v26 - v12 * v27 + v13 * v28) * v43);
    self->_mat[0][2] = v43 * (v28 * v45 + v26 * v32 - v27 * v33);
    self->_mat[0][3] = -((v28 * v39 + v26 * v37 - v27 * v38) * v43);
    self->_mat[1][0] = -(v22 * v43);
    self->_mat[1][1] = (v7 * v25 - v14 * v27 + v15 * v28) * v43;
    self->_mat[1][2] = -((v28 * v35 + v25 * v32 - v27 * v34) * v43);
    self->_mat[1][3] = v43 * (v28 * v41 + v25 * v37 - v27 * v40);
    self->_mat[2][0] = v23 * v43;
    self->_mat[2][1] = -((v12 * v25 - v14 * v26 + v16 * v28) * v43);
    self->_mat[2][2] = v43 * (v28 * v36 + v25 * v33 - v26 * v34);
    self->_mat[2][3] = -((v28 * v42 + v25 * v38 - v26 * v40) * v43);
    self->_mat[3][0] = -(v24 * v43);
    self->_mat[3][1] = (v13 * v25 - v15 * v26 + v16 * v27) * v43;
    self->_mat[3][2] = -((v27 * v36 + v25 * v45 - v26 * v35) * v43);
    self->_mat[3][3] = v43 * (v27 * v42 + v25 * v39 - v26 * v41);
  }
  return v31;
}

- (CGPoint)transform2DPoint:(CGPoint)a3
{
  double v3 = self->_mat[3][3] + a3.x * self->_mat[3][0] + a3.y * self->_mat[3][1];
  double v4 = (self->_mat[0][3] + a3.x * self->_mat[0][0] + a3.y * self->_mat[0][1]) / v3;
  double v5 = (self->_mat[1][3] + a3.x * self->_mat[1][0] + a3.y * self->_mat[1][1]) / v3;
  double v6 = v4;
  result.y = v5;
  result.x = v6;
  return result;
}

- (FxPoint3D)transform3DPoint:(FxPoint3D)a3
{
  double v3 = self->_mat[3][3] + a3.var0 * self->_mat[3][0] + a3.var1 * self->_mat[3][1] + a3.var2 * self->_mat[3][2];
  double v4 = self->_mat[1][3] + a3.var0 * self->_mat[1][0] + a3.var1 * self->_mat[1][1] + a3.var2 * self->_mat[1][2];
  double v5 = a3.var0 * self->_mat[2][0];
  double v6 = (self->_mat[0][3] + a3.var0 * self->_mat[0][0] + a3.var1 * self->_mat[0][1] + a3.var2 * self->_mat[0][2]) / v3;
  double v7 = (self->_mat[2][3] + v5 + a3.var1 * self->_mat[2][1] + a3.var2 * self->_mat[2][2]) / v3;
  double v8 = v4 / v3;
  result.var2 = v7;
  result.var1 = v8;
  result.var0 = v6;
  return result;
}

- (id)description
{
  double v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @"(\n");
  uint64_t v4 = 0;
  mat = self->_mat;
  do
  {
    for (uint64_t i = 0; i != 4; ++i)
      objc_msgSend(v3, "appendFormat:", @"%f,", *(void *)&(*mat)[i]);
    [v3 appendString:@"\n"];
    ++v4;
    ++mat;
  }
  while (v4 != 4);
  [v3 appendString:@""]);

  return v3;
}

- (void)transpose
{
  uint64_t v2 = 0;
  mat = self->_mat;
  uint64_t v4 = 4;
  do
  {
    uint64_t v5 = v4;
    double v6 = mat;
    double v7 = mat;
    do
    {
      double v8 = (*v7)[0];
      (*v7)[0] = (*v6)[0];
      double v7 = (double (*)[4])((char *)v7 + 8);
      (*v6++)[0] = v8;
      --v5;
    }
    while (v5);
    ++v2;
    mat = (double (*)[4])((char *)mat + 40);
    --v4;
  }
  while (v2 != 4);
}

@end