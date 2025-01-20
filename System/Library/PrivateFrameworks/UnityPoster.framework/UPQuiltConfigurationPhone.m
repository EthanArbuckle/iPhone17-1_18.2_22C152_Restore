@interface UPQuiltConfigurationPhone
- (UIBezierPath)bottomLeftQuiltAsleepPath;
- (UIBezierPath)bottomLeftQuiltAwakeLockedPath;
- (UIBezierPath)bottomLeftQuiltUnlockedPath;
- (UIBezierPath)bottomRightQuiltAwakeLockedPath;
- (UIBezierPath)bottomRightQuiltUnlockedPath;
- (UIBezierPath)intersectionPieceAwakeLockedPath;
- (UIBezierPath)topQuiltAsleepPath;
- (UIBezierPath)topQuiltAwakeLockedPath;
- (UIBezierPath)topQuiltUnlockedPath;
- (UPQuiltConfigurationPhone)initWithRandomizationSeedValue:(unint64_t)a3 viewport:(CGRect)a4 timeBounds:(CGRect)a5 lineVariance:(double)a6;
- (id)_quiltVariationValuesForSideLength:(double)a3 variance:(double)a4 fromKeyFraction:(double)a5 toKeyFraction:;
- (void)_generateQuiltPaths;
- (void)setBottomLeftQuiltAsleepPath:(id)a3;
- (void)setBottomLeftQuiltAwakeLockedPath:(id)a3;
- (void)setBottomLeftQuiltUnlockedPath:(id)a3;
- (void)setBottomRightQuiltAwakeLockedPath:(id)a3;
- (void)setBottomRightQuiltUnlockedPath:(id)a3;
- (void)setIntersectionPieceAwakeLockedPath:(id)a3;
- (void)setTopQuiltAsleepPath:(id)a3;
- (void)setTopQuiltAwakeLockedPath:(id)a3;
- (void)setTopQuiltUnlockedPath:(id)a3;
@end

@implementation UPQuiltConfigurationPhone

- (UPQuiltConfigurationPhone)initWithRandomizationSeedValue:(unint64_t)a3 viewport:(CGRect)a4 timeBounds:(CGRect)a5 lineVariance:(double)a6
{
  v9.receiver = self;
  v9.super_class = (Class)UPQuiltConfigurationPhone;
  v6 = -[UPQuiltConfiguration initWithRandomizationSeedValue:viewport:timeBounds:lineVariance:](&v9, sel_initWithRandomizationSeedValue_viewport_timeBounds_lineVariance_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, *(void *)&a6);
  v7 = v6;
  if (v6) {
    -[UPQuiltConfigurationPhone _generateQuiltPaths]((uint64_t)v6);
  }
  return v7;
}

- (void)_generateQuiltPaths
{
  if (a1)
  {
    [(id)a1 viewport];
    double v3 = v2;
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    [(id)a1 timeBounds];
    double v12 = v11 + v10 * 0.5;
    double v13 = v7 / 393.366;
    double v14 = v9 / 852.0;
    v15 = [MEMORY[0x263F824C0] bezierPath];
    objc_msgSend(v15, "moveToPoint:", v3, v12 + v9 / 852.0 * -1.075);
    objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", v13 * 40.495, v12 + v14 * 2.81, v13 * 22.016, v12 + v14 * 2.925, v13 * 35.515, v12 + v14 * 2.889);
    objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", v13 * 50.834, v12 + v14 * 2.811, v13 * 44.051, v12 + v14 * 2.754, v13 * 47.279, v12 + v14 * 2.872);
    objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", v13 * 269.367, v12 + v14 * -7.157, v13 * 123.735, v12 + v14 * 1.562, v13 * 196.714, v12 + v14 * -2.289);
    objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", v13 * 313.996, v12 + v14 * -6.157, v13 * 279.301, v12 + v14 * -6.765, v13 * 294.178, v12 + v14 * -6.765);
    objc_msgSend(v15, "addLineToPoint:", v7, v12 + v9 / 852.0 * -16.126);
    objc_msgSend(v15, "addLineToPoint:", v7, v5);
    objc_msgSend(v15, "addLineToPoint:", v3, v5);
    objc_msgSend(v15, "addLineToPoint:", v3, v12 + v9 / 852.0 * -1.075);
    [v15 closePath];
    v16 = *(void **)(a1 + 168);
    *(void *)(a1 + 168) = v15;
    id v47 = v15;

    long long v49 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v50 = *MEMORY[0x263F000D0];
    *(_OWORD *)&v55.a = v50;
    *(_OWORD *)&v55.c = v49;
    long long v48 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    *(_OWORD *)&v55.tx = v48;
    *(_OWORD *)&v54.a = v50;
    *(_OWORD *)&v54.c = v49;
    *(_OWORD *)&v54.tx = v48;
    CGAffineTransformScale(&v55, &v54, 1.375, 1.0);
    path = (const CGPath *)MEMORY[0x237DD81F0]([*(id *)(a1 + 168) CGPath], &v55);
    uint64_t v17 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithCGPath:");
    v18 = *(void **)(a1 + 120);
    *(void *)(a1 + 120) = v17;

    v19 = (void *)[*(id *)(a1 + 120) copy];
    *(_OWORD *)&v54.a = v50;
    *(_OWORD *)&v54.c = v49;
    *(_OWORD *)&v54.tx = v48;
    *(_OWORD *)&v53.a = v50;
    *(_OWORD *)&v53.c = v49;
    *(_OWORD *)&v53.tx = v48;
    CGAffineTransformTranslate(&v54, &v53, 0.0, -5.0);
    v20 = (const CGPath *)MEMORY[0x237DD81F0]([*(id *)(a1 + 120) CGPath], &v54);
    uint64_t v21 = [MEMORY[0x263F824C0] bezierPathWithCGPath:v20];
    v22 = *(void **)(a1 + 152);
    *(void *)(a1 + 152) = v21;

    v23 = [MEMORY[0x263F824C0] bezierPath];
    objc_msgSend(v23, "moveToPoint:", v3, v5);
    objc_msgSend(v23, "addLineToPoint:", v7 / 393.366 * 8.894, v5);
    objc_msgSend(v23, "addLineToPoint:", v7 / 393.366 * 75.471, (v9 + -575.551) * (v9 / 852.0));
    objc_msgSend(v23, "addCurveToPoint:controlPoint1:controlPoint2:", v13 * 88.997, (v9 + -550.137) * v14, v13 * 82.619, (v9 + -564.581) * v14, v13 * 87.127, (v9 + -556.109) * v14);
    objc_msgSend(v23, "addCurveToPoint:controlPoint1:controlPoint2:", v13 * 149.902, (v9 + -332.432) * v14, v13 * 104.021, (v9 + -502.139) * v14, v13 * 124.322, (v9 + -429.57) * v14);
    objc_msgSend(v23, "addLineToPoint:", v7 / 393.366 * 161.028, (v9 + -289.447) * (v9 / 852.0));
    objc_msgSend(v23, "addLineToPoint:", v7 / 393.366 * 176.039, (v9 + -254.383) * (v9 / 852.0));
    objc_msgSend(v23, "addCurveToPoint:controlPoint1:controlPoint2:", v13 * 246.006, (v9 + -53.646) * v14, v13 * 210.982, (v9 + -167.405) * v14, v13 * 234.305, (v9 + -100.493) * v14);
    objc_msgSend(v23, "addCurveToPoint:controlPoint1:controlPoint2:", v13 * 265.636, v9, v13 * 245.658, (v9 + -47.711) * v14, v13 * 252.202, (v9 + -29.829) * v14);
    objc_msgSend(v23, "addLineToPoint:", v3, v9);
    objc_msgSend(v23, "addLineToPoint:", v3, v5);
    [v23 closePath];
    v24 = *(void **)(a1 + 176);
    *(void *)(a1 + 176) = v23;
    id v45 = v23;

    *(_OWORD *)&v53.a = v50;
    *(_OWORD *)&v53.c = v49;
    *(_OWORD *)&v53.tx = v48;
    *(_OWORD *)&v52.a = v50;
    *(_OWORD *)&v52.c = v49;
    *(_OWORD *)&v52.tx = v48;
    CGAffineTransformScale(&v53, &v52, 1.375, 1.375);
    v25 = (const CGPath *)MEMORY[0x237DD81F0]([*(id *)(a1 + 176) CGPath], &v53);
    uint64_t v26 = [MEMORY[0x263F824C0] bezierPathWithCGPath:v25];
    v27 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = v26;

    v28 = (void *)[*(id *)(a1 + 128) copy];
    *(_OWORD *)&v52.a = v50;
    *(_OWORD *)&v52.c = v49;
    *(_OWORD *)&v52.tx = v48;
    *(_OWORD *)&v51.a = v50;
    *(_OWORD *)&v51.c = v49;
    *(_OWORD *)&v51.tx = v48;
    CGAffineTransformTranslate(&v52, &v51, -5.0, 0.0);
    v29 = (const CGPath *)MEMORY[0x237DD81F0]([*(id *)(a1 + 128) CGPath], &v52);
    uint64_t v30 = [MEMORY[0x263F824C0] bezierPathWithCGPath:v29];
    v31 = *(void **)(a1 + 160);
    *(void *)(a1 + 160) = v30;

    id v32 = v19;
    v33 = (const CGPath *)[v32 CGPath];
    id v34 = v28;
    CopyByIntersectingPath = CGPathCreateCopyByIntersectingPath(v33, (CGPathRef)[v34 CGPath], 1);
    uint64_t v36 = [MEMORY[0x263F824C0] bezierPathWithCGPath:CopyByIntersectingPath];
    v37 = *(void **)(a1 + 136);
    *(void *)(a1 + 136) = v36;

    v38 = [MEMORY[0x263F824C0] bezierPath];
    objc_msgSend(v38, "moveToPoint:", v7, v9 + -243.342);
    objc_msgSend(v38, "addLineToPoint:", v7 / 393.366 * 340.995, v9 + v9 / 852.0 * -165.511);
    objc_msgSend(v38, "addLineToPoint:", v7 / 393.366 * 324.657, v9 + v9 / 852.0 * -143.25);
    objc_msgSend(v38, "addLineToPoint:", v7 / 393.366 * 228.221, v9 + v9 / 852.0 * -18.2134);
    objc_msgSend(v38, "addLineToPoint:", v7 / 393.366 * 221.894, v9 + v9 / 852.0 * -7.762);
    objc_msgSend(v38, "addLineToPoint:", v7 / 393.366 * 218.774, v9 + v9 / 852.0 * -0.149);
    objc_msgSend(v38, "addLineToPoint:", v7, v9);
    [v38 closePath];
    v39 = *(void **)(a1 + 184);
    *(void *)(a1 + 184) = v38;
    id v40 = v38;

    v41 = [MEMORY[0x263F824C0] bezierPath];
    double v42 = v7 + 50.0;
    double v43 = v9 + 50.0;
    objc_msgSend(v41, "moveToPoint:", v42, v43);
    objc_msgSend(v41, "addLineToPoint:", v42, v43);
    objc_msgSend(v41, "addLineToPoint:", v42, v43);
    objc_msgSend(v41, "addLineToPoint:", v42, v43);
    objc_msgSend(v41, "addLineToPoint:", v42, v43);
    objc_msgSend(v41, "addLineToPoint:", v42, v43);
    objc_msgSend(v41, "addLineToPoint:", v42, v43);
    [v41 closePath];
    v44 = *(void **)(a1 + 144);
    *(void *)(a1 + 144) = v41;

    if (CopyByIntersectingPath) {
      CGPathRelease(CopyByIntersectingPath);
    }
    if (path) {
      CGPathRelease(path);
    }
    if (v20) {
      CGPathRelease(v20);
    }
    if (v25) {
      CGPathRelease(v25);
    }
    if (v29) {
      CGPathRelease(v29);
    }
  }
}

- (id)_quiltVariationValuesForSideLength:(double)a3 variance:(double)a4 fromKeyFraction:(double)a5 toKeyFraction:
{
  v25[2] = *MEMORY[0x263EF8340];
  if (a1)
  {
    double v9 = a3 * 0.1;
    double v10 = objc_opt_new();
    double v11 = [NSNumber numberWithDouble:a4];
    v24[0] = v11;
    v25[0] = &unk_26E87BE00;
    double v12 = [NSNumber numberWithDouble:a5];
    v24[1] = v12;
    v25[1] = &unk_26E87BE00;
    double v13 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    [v10 addEntriesFromDictionary:v13];

    unint64_t v14 = 1;
    double v15 = 0.0;
    char v16 = 1;
    do
    {
      if (a3 - v15 <= v9) {
        v16 ^= 1u;
      }
      uint64_t v17 = objc_msgSend(a1, "randomizer", a3 - v15);
      v18 = v17;
      if (v16) {
        double v19 = a3;
      }
      else {
        double v19 = 0.0;
      }
      [v17 floatValueBetweenFirstValue:v15 secondValue:v19];
      double v15 = v20;

      uint64_t v21 = [NSNumber numberWithDouble:v15];
      v22 = [NSNumber numberWithDouble:(double)v14 * 0.25];
      [v10 setObject:v21 forKeyedSubscript:v22];

      ++v14;
    }
    while (v14 != 4);
  }
  else
  {
    double v10 = 0;
  }
  return v10;
}

- (UIBezierPath)topQuiltAwakeLockedPath
{
  return self->_topQuiltAwakeLockedPath;
}

- (void)setTopQuiltAwakeLockedPath:(id)a3
{
}

- (UIBezierPath)bottomLeftQuiltAwakeLockedPath
{
  return self->_bottomLeftQuiltAwakeLockedPath;
}

- (void)setBottomLeftQuiltAwakeLockedPath:(id)a3
{
}

- (UIBezierPath)intersectionPieceAwakeLockedPath
{
  return self->_intersectionPieceAwakeLockedPath;
}

- (void)setIntersectionPieceAwakeLockedPath:(id)a3
{
}

- (UIBezierPath)bottomRightQuiltAwakeLockedPath
{
  return self->_bottomRightQuiltAwakeLockedPath;
}

- (void)setBottomRightQuiltAwakeLockedPath:(id)a3
{
}

- (UIBezierPath)topQuiltAsleepPath
{
  return self->_topQuiltAsleepPath;
}

- (void)setTopQuiltAsleepPath:(id)a3
{
}

- (UIBezierPath)bottomLeftQuiltAsleepPath
{
  return self->_bottomLeftQuiltAsleepPath;
}

- (void)setBottomLeftQuiltAsleepPath:(id)a3
{
}

- (UIBezierPath)topQuiltUnlockedPath
{
  return self->_topQuiltUnlockedPath;
}

- (void)setTopQuiltUnlockedPath:(id)a3
{
}

- (UIBezierPath)bottomLeftQuiltUnlockedPath
{
  return self->_bottomLeftQuiltUnlockedPath;
}

- (void)setBottomLeftQuiltUnlockedPath:(id)a3
{
}

- (UIBezierPath)bottomRightQuiltUnlockedPath
{
  return self->_bottomRightQuiltUnlockedPath;
}

- (void)setBottomRightQuiltUnlockedPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomRightQuiltUnlockedPath, 0);
  objc_storeStrong((id *)&self->_bottomLeftQuiltUnlockedPath, 0);
  objc_storeStrong((id *)&self->_topQuiltUnlockedPath, 0);
  objc_storeStrong((id *)&self->_bottomLeftQuiltAsleepPath, 0);
  objc_storeStrong((id *)&self->_topQuiltAsleepPath, 0);
  objc_storeStrong((id *)&self->_bottomRightQuiltAwakeLockedPath, 0);
  objc_storeStrong((id *)&self->_intersectionPieceAwakeLockedPath, 0);
  objc_storeStrong((id *)&self->_bottomLeftQuiltAwakeLockedPath, 0);
  objc_storeStrong((id *)&self->_topQuiltAwakeLockedPath, 0);
  objc_storeStrong((id *)&self->_toInterpolatedConfiguration, 0);
  objc_storeStrong((id *)&self->_fromInterpolatedConfiguration, 0);
}

@end