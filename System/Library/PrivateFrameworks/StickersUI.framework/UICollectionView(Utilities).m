@interface UICollectionView(Utilities)
- (id)animationForCell:()Utilities sourceCell:triggerDelay:;
- (void)stk_performRippleAnimationAtIndexPath:()Utilities delay:;
@end

@implementation UICollectionView(Utilities)

- (void)stk_performRippleAnimationAtIndexPath:()Utilities delay:
{
  id v6 = a4;
  v7 = [a1 visibleCells];
  v8 = [a1 cellForItemAtIndexPath:v6];

  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__UICollectionView_Utilities__stk_performRippleAnimationAtIndexPath_delay___block_invoke;
  v10[3] = &unk_2655274F0;
  v10[4] = a1;
  id v11 = v8;
  double v12 = a2;
  id v9 = v8;
  [v7 enumerateObjectsUsingBlock:v10];
  [MEMORY[0x263F158F8] commit];
}

- (id)animationForCell:()Utilities sourceCell:triggerDelay:
{
  v76[2] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  if (v7 == v8)
  {
    v47 = [MEMORY[0x263F15750] animation];
  }
  else
  {
    [v7 bounds];
    objc_msgSend(v7, "convertRect:toView:", 0);
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [v8 bounds];
    objc_msgSend(v8, "convertRect:toView:", 0);
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    double v61 = a1;
    CGFloat v24 = v23;
    double v25 = STKCenterOfRect(v10, v12, v14, v16);
    double v27 = v26;
    double v28 = STKCenterOfRect(v18, v20, v22, v24);
    double v30 = v29;
    long double v31 = STKDistance(v28, v29, v25, v27);
    double v32 = STKSubtractPoints(v28, v30, v25);
    double v34 = STKNiceAngleFromDelta(v32, v33);
    double v35 = STKExponentialDecay(0.2, 0.004, v31);
    __double2 v36 = __sincos_stret(v34);
    v37 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform"];
    memset(&v75, 0, sizeof(v75));
    CATransform3DMakeScale(&v75, v35 * 0.5 + 1.0, v35 * 0.5 + 1.0, 1.0);
    memset(&v74, 0, sizeof(v74));
    CATransform3DMakeTranslation(&v74, v36.__cosval * (v35 * -100.0), v36.__sinval * (v35 * -100.0), 0.0);
    CATransform3D a = v75;
    CATransform3D b = v74;
    CATransform3DConcat(&v73, &a, &b);
    CATransform3D v75 = v73;
    long long v60 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    long long v69 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    long long v59 = v69;
    long long v70 = v60;
    long long v56 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    long long v67 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    long long v55 = v67;
    long long v68 = v56;
    long long v58 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    long long v65 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    long long v57 = v65;
    long long v66 = v58;
    long long v54 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    v64[0] = *MEMORY[0x263F15740];
    long long v53 = v64[0];
    v64[1] = v54;
    v38 = [MEMORY[0x263F08D40] valueWithBytes:v64 objCType:"{CATransform3D=dddddddddddddddd}"];
    [v37 setFromValue:v38];

    CATransform3D v63 = v75;
    v39 = [MEMORY[0x263F08D40] valueWithBytes:&v63 objCType:"{CATransform3D=dddddddddddddddd}"];
    [v37 setToValue:v39];

    [v37 setBeginTime:(double)(v31 * 0.000833333333)];
    [v37 setDuration:0.2];
    v40 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
    [v37 setTimingFunction:v40];

    v41 = [MEMORY[0x263F15890] animationWithKeyPath:@"transform"];
    [v41 setFillMode:*MEMORY[0x263F15AB0]];
    v62[4] = v55;
    v62[5] = v56;
    v62[6] = v59;
    v62[7] = v60;
    v62[0] = v53;
    v62[1] = v54;
    v62[2] = v57;
    v62[3] = v58;
    v42 = [MEMORY[0x263F08D40] valueWithBytes:v62 objCType:"{CATransform3D=dddddddddddddddd}"];
    [v41 setToValue:v42];

    v43 = [v37 toValue];
    [v41 setFromValue:v43];

    [v41 setMass:1.0];
    [v41 setDamping:24.87471];
    [v41 setStiffness:275.004];
    [v37 beginTime];
    double v45 = v44;
    [v37 duration];
    [v41 setBeginTime:v45 + v46];
    [v41 settlingDuration];
    objc_msgSend(v41, "setDuration:");
    v47 = [MEMORY[0x263F15750] animation];
    v76[0] = v37;
    v76[1] = v41;
    v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:2];
    [v47 setAnimations:v48];

    [v41 duration];
    double v50 = v49;
    [v41 beginTime];
    [v47 setDuration:v50 + v51];
    [v47 setBeginTime:CACurrentMediaTime() + v61];
  }

  return v47;
}

@end