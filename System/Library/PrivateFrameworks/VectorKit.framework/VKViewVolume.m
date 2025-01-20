@interface VKViewVolume
- (Matrix<double,)lerpPoint:(float *)a3;
- (const)corners;
- (void)updateWithFrustum:(id *)a3 matrix:(const void *)a4;
@end

@implementation VKViewVolume

- (void)updateWithFrustum:(id *)a3 matrix:(const void *)a4
{
  double var4 = a3->var4;
  double v5 = a3->var5 + a3->var5;
  double v6 = -1.0 - v5;
  double v7 = 1.0 - v5;
  double var3 = a3->var3;
  double v9 = a3->var1 * 0.5;
  double v10 = a3->var2 * 0.5;
  double v11 = v9 * (-1.0 - v5);
  double v12 = -v10;
  double v13 = -var3;
  self->_corners[0]._e[0] = v11;
  self->_corners[0]._e[1] = -v10;
  double v14 = v9 * v7;
  self->_corners[0]._e[2] = -var3;
  self->_corners[1]._e[0] = v9 * v7;
  self->_corners[1]._e[1] = -v10;
  self->_corners[1]._e[2] = -var3;
  self->_corners[2]._e[0] = v11;
  self->_corners[2]._e[1] = v10;
  self->_corners[2]._e[2] = -var3;
  self->_corners[3]._e[0] = v9 * v7;
  self->_corners[3]._e[1] = v10;
  self->_corners[3]._e[2] = -var3;
  double v15 = v9 * v7;
  double v16 = v11;
  double v17 = v10;
  if (!a3->var0)
  {
    double v18 = var4 / var3 * v9;
    double v17 = var4 / var3 * v10;
    double v16 = v18 * v6;
    double v12 = -v17;
    double v15 = v18 * v7;
  }
  double v19 = -var4;
  self->_corners[4]._e[0] = v16;
  self->_corners[4]._e[1] = v12;
  self->_corners[4]._e[2] = v19;
  self->_corners[5]._e[0] = v15;
  self->_corners[5]._e[1] = v12;
  self->_corners[5]._e[2] = v19;
  self->_corners[6]._e[0] = v16;
  self->_corners[6]._e[1] = v17;
  self->_corners[6]._e[2] = v19;
  self->_corners[7]._e[0] = v15;
  self->_corners[7]._e[1] = v17;
  self->_corners[7]._e[2] = v19;
  double v20 = *((double *)a4 + 14) - (var3 * *((double *)a4 + 10) + v10 * *((double *)a4 + 6) - *((double *)a4 + 2) * v11);
  *(float64x2_t *)self->_corners[0]._e = vaddq_f64(vmlaq_n_f64(vnegq_f64(vmlaq_n_f64(vmulq_n_f64(*((float64x2_t *)a4 + 4), var3), *((float64x2_t *)a4 + 2), v10)), *(float64x2_t *)a4, v11), *((float64x2_t *)a4 + 6));
  self->_corners[0]._e[2] = v20;
  double v21 = *((double *)a4 + 14) - (var3 * *((double *)a4 + 10) + v10 * *((double *)a4 + 6) - *((double *)a4 + 2) * v14);
  *(float64x2_t *)self->_corners[1]._e = vaddq_f64(vmlaq_n_f64(vnegq_f64(vmlaq_n_f64(vmulq_n_f64(*((float64x2_t *)a4 + 4), var3), *((float64x2_t *)a4 + 2), v10)), *(float64x2_t *)a4, v14), *((float64x2_t *)a4 + 6));
  self->_corners[1]._e[2] = v21;
  double v22 = *((double *)a4 + 14) + *((double *)a4 + 2) * v11 + *((double *)a4 + 6) * v10 - var3 * *((double *)a4 + 10);
  *(float64x2_t *)self->_corners[2]._e = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)a4 + 6), *(float64x2_t *)a4, v11), *((float64x2_t *)a4 + 2), v10), *((float64x2_t *)a4 + 4), v13);
  self->_corners[2]._e[2] = v22;
  double v23 = self->_corners[3]._e[0];
  double v24 = self->_corners[3]._e[1];
  double v25 = self->_corners[3]._e[2];
  double v26 = self->_corners[4]._e[0];
  double v27 = *((double *)a4 + 14) + *((double *)a4 + 2) * v23 + *((double *)a4 + 6) * v24 + *((double *)a4 + 10) * v25;
  *(float64x2_t *)self->_corners[3]._e = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)a4 + 6), *(float64x2_t *)a4, v23), *((float64x2_t *)a4 + 2), v24), *((float64x2_t *)a4 + 4), v25);
  self->_corners[3]._e[2] = v27;
  double v28 = self->_corners[4]._e[1];
  double v29 = self->_corners[4]._e[2];
  double v30 = *((double *)a4 + 14) + *((double *)a4 + 2) * v26 + *((double *)a4 + 6) * v28 + *((double *)a4 + 10) * v29;
  *(float64x2_t *)self->_corners[4]._e = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)a4 + 6), *(float64x2_t *)a4, v26), *((float64x2_t *)a4 + 2), v28), *((float64x2_t *)a4 + 4), v29);
  self->_corners[4]._e[2] = v30;
  double v31 = self->_corners[5]._e[0];
  double v32 = self->_corners[5]._e[1];
  double v33 = self->_corners[5]._e[2];
  double v34 = self->_corners[6]._e[0];
  double v35 = *((double *)a4 + 14) + *((double *)a4 + 2) * v31 + *((double *)a4 + 6) * v32 + *((double *)a4 + 10) * v33;
  *(float64x2_t *)self->_corners[5]._e = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)a4 + 6), *(float64x2_t *)a4, v31), *((float64x2_t *)a4 + 2), v32), *((float64x2_t *)a4 + 4), v33);
  self->_corners[5]._e[2] = v35;
  double v36 = self->_corners[6]._e[1];
  double v37 = self->_corners[6]._e[2];
  double v38 = *((double *)a4 + 14) + *((double *)a4 + 2) * v34 + *((double *)a4 + 6) * v36 + *((double *)a4 + 10) * v37;
  *(float64x2_t *)self->_corners[6]._e = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)a4 + 6), *(float64x2_t *)a4, v34), *((float64x2_t *)a4 + 2), v36), *((float64x2_t *)a4 + 4), v37);
  self->_corners[6]._e[2] = v38;
  double v39 = self->_corners[7]._e[0];
  double v40 = self->_corners[7]._e[1];
  double v41 = self->_corners[7]._e[2];
  double v42 = *((double *)a4 + 14) + *((double *)a4 + 2) * v39 + *((double *)a4 + 6) * v40 + *((double *)a4 + 10) * v41;
  *(float64x2_t *)self->_corners[7]._e = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)a4 + 6), *(float64x2_t *)a4, v39), *((float64x2_t *)a4 + 2), v40), *((float64x2_t *)a4 + 4), v41);
  self->_corners[7]._e[2] = v42;
}

- (const)corners
{
  return self->_corners;
}

- (Matrix<double,)lerpPoint:(float *)a3
{
  double v3 = *a3;
  double v4 = a3[1];
  double v5 = a3[2];
  double v6 = self->_corners[0]._e[0] + (self->_corners[1]._e[0] - self->_corners[0]._e[0]) * v3;
  double v7 = self->_corners[0]._e[1] + (self->_corners[1]._e[1] - self->_corners[0]._e[1]) * v3;
  double v8 = self->_corners[0]._e[2] + (self->_corners[1]._e[2] - self->_corners[0]._e[2]) * v3;
  double v9 = self->_corners[4]._e[0] + (self->_corners[5]._e[0] - self->_corners[4]._e[0]) * v3;
  double v10 = self->_corners[4]._e[1] + (self->_corners[5]._e[1] - self->_corners[4]._e[1]) * v3;
  double v11 = self->_corners[4]._e[2] + (self->_corners[5]._e[2] - self->_corners[4]._e[2]) * v3;
  double v12 = v6 + (self->_corners[2]._e[0] - v6 + (self->_corners[3]._e[0] - self->_corners[2]._e[0]) * v3) * v4;
  double v13 = v7 + (self->_corners[2]._e[1] - v7 + (self->_corners[3]._e[1] - self->_corners[2]._e[1]) * v3) * v4;
  double v14 = v8 + (self->_corners[2]._e[2] - v8 + (self->_corners[3]._e[2] - self->_corners[2]._e[2]) * v3) * v4;
  double v15 = self->_corners[6]._e[1] - v10 + (self->_corners[7]._e[1] - self->_corners[6]._e[1]) * v3;
  double v16 = self->_corners[6]._e[2] - v11 + (self->_corners[7]._e[2] - self->_corners[6]._e[2]) * v3;
  double v17 = v12
      + (v9 - v12 + (self->_corners[6]._e[0] - v9 + (self->_corners[7]._e[0] - self->_corners[6]._e[0]) * v3) * v4) * v5;
  double v18 = v13 + (v10 - v13 + v15 * v4) * v5;
  double v19 = v14 + (v11 - v14 + v16 * v4) * v5;
  result._e[2] = v19;
  result._e[1] = v18;
  result._e[0] = v17;
  return result;
}

@end