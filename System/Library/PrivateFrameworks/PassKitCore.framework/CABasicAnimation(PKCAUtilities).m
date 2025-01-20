@interface CABasicAnimation(PKCAUtilities)
- (uint64_t)pkui_updateForAdditiveAnimationFromPoint:()PKCAUtilities toPoint:;
- (uint64_t)pkui_updateForAdditiveAnimationFromScalar:()PKCAUtilities toScalar:;
- (uint64_t)pkui_updateForAdditiveAnimationFromSize:()PKCAUtilities toSize:;
- (uint64_t)pkui_updateForAdditiveAnimationFromTransform:()PKCAUtilities toTransform:;
- (void)pkui_updateForAdditiveAnimationFromPoint:()PKCAUtilities toPoint:withLayerPoint:;
- (void)pkui_updateForAdditiveAnimationFromScalar:()PKCAUtilities toScalar:withLayerScalar:;
- (void)pkui_updateForAdditiveAnimationFromSize:()PKCAUtilities toSize:withLayerSize:;
- (void)pkui_updateForAdditiveAnimationFromTransform:()PKCAUtilities toTransform:withLayerTransform:;
@end

@implementation CABasicAnimation(PKCAUtilities)

- (uint64_t)pkui_updateForAdditiveAnimationFromPoint:()PKCAUtilities toPoint:
{
  return objc_msgSend(a1, "pkui_updateForAdditiveAnimationFromPoint:toPoint:withLayerPoint:", a3, a4, a5, a6, a5, a6);
}

- (void)pkui_updateForAdditiveAnimationFromScalar:()PKCAUtilities toScalar:withLayerScalar:
{
  v7 = [NSNumber numberWithDouble:a2 - a4];
  [a1 setFromValue:v7];

  id v8 = [NSNumber numberWithDouble:a3 - a4];
  [a1 setToValue:v8];
}

- (void)pkui_updateForAdditiveAnimationFromPoint:()PKCAUtilities toPoint:withLayerPoint:
{
  double v8 = a4 - a6;
  double v9 = a5 - a7;
  v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", a2 - a6, a3 - a7);
  [a1 setFromValue:v10];

  objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setToValue:v11];
}

- (uint64_t)pkui_updateForAdditiveAnimationFromScalar:()PKCAUtilities toScalar:
{
  return objc_msgSend(a1, "pkui_updateForAdditiveAnimationFromScalar:toScalar:withLayerScalar:", a3, a4, a4);
}

- (uint64_t)pkui_updateForAdditiveAnimationFromSize:()PKCAUtilities toSize:
{
  return objc_msgSend(a1, "pkui_updateForAdditiveAnimationFromSize:toSize:withLayerSize:", a3, a4, a5, a6, a5, a6);
}

- (void)pkui_updateForAdditiveAnimationFromSize:()PKCAUtilities toSize:withLayerSize:
{
  double v8 = a4 - a6;
  double v9 = a5 - a7;
  v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", a2 - a6, a3 - a7);
  [a1 setFromValue:v10];

  objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setToValue:v11];
}

- (uint64_t)pkui_updateForAdditiveAnimationFromTransform:()PKCAUtilities toTransform:
{
  long long v4 = a3[5];
  v26[4] = a3[4];
  v26[5] = v4;
  long long v5 = a3[7];
  v26[6] = a3[6];
  v26[7] = v5;
  long long v6 = a3[1];
  v26[0] = *a3;
  v26[1] = v6;
  long long v7 = a3[3];
  v26[2] = a3[2];
  v26[3] = v7;
  long long v8 = a4[5];
  long long v9 = a4[3];
  long long v22 = a4[4];
  long long v23 = v8;
  long long v10 = a4[5];
  long long v11 = a4[7];
  long long v24 = a4[6];
  long long v25 = v11;
  long long v12 = a4[1];
  v19[0] = *a4;
  v19[1] = v12;
  long long v13 = a4[3];
  long long v15 = *a4;
  long long v14 = a4[1];
  long long v20 = a4[2];
  long long v21 = v13;
  v18[4] = v22;
  v18[5] = v10;
  long long v16 = a4[7];
  v18[6] = v24;
  v18[7] = v16;
  v18[0] = v15;
  v18[1] = v14;
  v18[2] = v20;
  v18[3] = v9;
  return objc_msgSend(a1, "pkui_updateForAdditiveAnimationFromTransform:toTransform:withLayerTransform:", v26, v19, v18);
}

- (void)pkui_updateForAdditiveAnimationFromTransform:()PKCAUtilities toTransform:withLayerTransform:
{
  memset(&v53, 0, sizeof(v53));
  long long v9 = a5[5];
  *(_OWORD *)&v52.m31 = a5[4];
  *(_OWORD *)&v52.m33 = v9;
  long long v10 = a5[7];
  *(_OWORD *)&v52.m41 = a5[6];
  *(_OWORD *)&v52.m43 = v10;
  long long v11 = a5[1];
  *(_OWORD *)&v52.m11 = *a5;
  *(_OWORD *)&v52.m13 = v11;
  long long v12 = a5[3];
  *(_OWORD *)&v52.m21 = a5[2];
  *(_OWORD *)&v52.m23 = v12;
  CATransform3DInvert(&v53, &v52);
  memset(&v52, 0, sizeof(v52));
  long long v13 = a3[5];
  *(_OWORD *)&a.m31 = a3[4];
  *(_OWORD *)&a.m33 = v13;
  long long v14 = a3[7];
  *(_OWORD *)&a.m41 = a3[6];
  *(_OWORD *)&a.m43 = v14;
  long long v15 = a3[1];
  *(_OWORD *)&a.m11 = *a3;
  *(_OWORD *)&a.m13 = v15;
  long long v16 = a3[3];
  *(_OWORD *)&a.m21 = a3[2];
  *(_OWORD *)&a.m23 = v16;
  long long v17 = a5[5];
  *(_OWORD *)&b.m31 = a5[4];
  *(_OWORD *)&b.m33 = v17;
  long long v18 = a5[7];
  *(_OWORD *)&b.m41 = a5[6];
  *(_OWORD *)&b.m43 = v18;
  long long v19 = a5[1];
  *(_OWORD *)&b.m11 = *a5;
  *(_OWORD *)&b.m13 = v19;
  long long v20 = a5[3];
  *(_OWORD *)&b.m21 = a5[2];
  *(_OWORD *)&b.m23 = v20;
  BOOL v21 = CATransform3DEqualToTransform(&a, &b);
  long long v22 = (_OWORD *)MEMORY[0x1E4F39B10];
  if (v21)
  {
    long long v23 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    *(_OWORD *)&v52.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&v52.m33 = v23;
    long long v24 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&v52.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&v52.m43 = v24;
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)&v52.m11 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v52.m13 = v25;
    long long v26 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    *(_OWORD *)&v52.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    *(_OWORD *)&v52.m23 = v26;
  }
  else
  {
    CATransform3D a = v53;
    long long v27 = a3[5];
    *(_OWORD *)&b.m31 = a3[4];
    *(_OWORD *)&b.m33 = v27;
    long long v28 = a3[7];
    *(_OWORD *)&b.m41 = a3[6];
    *(_OWORD *)&b.m43 = v28;
    long long v29 = a3[1];
    *(_OWORD *)&b.m11 = *a3;
    *(_OWORD *)&b.m13 = v29;
    long long v30 = a3[3];
    *(_OWORD *)&b.m21 = a3[2];
    *(_OWORD *)&b.m23 = v30;
    CATransform3DConcat(&v52, &a, &b);
  }
  memset(&a, 0, sizeof(a));
  long long v31 = a4[5];
  *(_OWORD *)&b.m31 = a4[4];
  *(_OWORD *)&b.m33 = v31;
  long long v32 = a4[7];
  *(_OWORD *)&b.m41 = a4[6];
  *(_OWORD *)&b.m43 = v32;
  long long v33 = a4[1];
  *(_OWORD *)&b.m11 = *a4;
  *(_OWORD *)&b.m13 = v33;
  long long v34 = a4[3];
  *(_OWORD *)&b.m21 = a4[2];
  *(_OWORD *)&b.m23 = v34;
  long long v35 = a5[5];
  *(_OWORD *)&v49.m31 = a5[4];
  *(_OWORD *)&v49.m33 = v35;
  long long v36 = a5[7];
  *(_OWORD *)&v49.m41 = a5[6];
  *(_OWORD *)&v49.m43 = v36;
  long long v37 = a5[1];
  *(_OWORD *)&v49.m11 = *a5;
  *(_OWORD *)&v49.m13 = v37;
  long long v38 = a5[3];
  *(_OWORD *)&v49.m21 = a5[2];
  *(_OWORD *)&v49.m23 = v38;
  if (CATransform3DEqualToTransform(&b, &v49))
  {
    long long v39 = v22[5];
    *(_OWORD *)&a.m31 = v22[4];
    *(_OWORD *)&a.m33 = v39;
    long long v40 = v22[7];
    *(_OWORD *)&a.m41 = v22[6];
    *(_OWORD *)&a.m43 = v40;
    long long v41 = v22[1];
    *(_OWORD *)&a.m11 = *v22;
    *(_OWORD *)&a.m13 = v41;
    long long v42 = v22[3];
    *(_OWORD *)&a.m21 = v22[2];
    *(_OWORD *)&a.m23 = v42;
  }
  else
  {
    CATransform3D b = v53;
    long long v43 = a4[5];
    *(_OWORD *)&v49.m31 = a4[4];
    *(_OWORD *)&v49.m33 = v43;
    long long v44 = a4[7];
    *(_OWORD *)&v49.m41 = a4[6];
    *(_OWORD *)&v49.m43 = v44;
    long long v45 = a4[1];
    *(_OWORD *)&v49.m11 = *a4;
    *(_OWORD *)&v49.m13 = v45;
    long long v46 = a4[3];
    *(_OWORD *)&v49.m21 = a4[2];
    *(_OWORD *)&v49.m23 = v46;
    CATransform3DConcat(&a, &b, &v49);
  }
  CATransform3D b = v52;
  v47 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&b];
  [a1 setFromValue:v47];

  CATransform3D b = a;
  v48 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&b];
  [a1 setToValue:v48];
}

@end