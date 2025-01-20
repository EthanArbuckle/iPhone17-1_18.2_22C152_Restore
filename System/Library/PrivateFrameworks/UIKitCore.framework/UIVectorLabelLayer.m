@interface UIVectorLabelLayer
@end

@implementation UIVectorLabelLayer

id __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setOpacity:0.0];
  _UIMorphLayerPaths(*(void **)(a1 + 32), *(void **)(a1 + 40));
  [*(id *)(a1 + 40) frame];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  v2 = *(void **)(a1 + 32);
  return v2;
}

uint64_t __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  LODWORD(v4) = 1.0;
  [v3 setOpacity:v4];
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  [v3 setPath:*(void *)(a1 + 72)];
  [v3 setFillColor:*(void *)(a1 + 80)];
  [*(id *)(a1 + 32) setOpacity:0.0];
  _UIMorphLayerPaths(*(void **)(a1 + 32), v3);

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v5 = *(void *)(a1 + 80);
  v6 = *(void **)(a1 + 32);
  return [v6 setFillColor:v5];
}

id __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 40) frame];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  LODWORD(v2) = 1.0;
  [*(id *)(a1 + 32) setOpacity:v2];
  id v3 = *(void **)(a1 + 32);
  return v3;
}

uint64_t __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke_4(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  [*(id *)(a1 + 32) setOpacity:0.0];
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  v7 = *(void **)(a1 + 32);
  return objc_msgSend(v7, "setFrame:", v3, v4, v5, v6);
}

id __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setOpacity:0.0];
  [*(id *)(a1 + 40) size];
  double v3 = v2;
  double v5 = v4;
  [*(id *)(a1 + 48) size];
  double v8 = v6 / v3;
  double v9 = 1.0;
  if (v3 == 0.0) {
    double v8 = 1.0;
  }
  if (v5 != 0.0) {
    double v9 = v7 / v5;
  }
  double v10 = v7 - v5;
  if (v5 >= 0.01) {
    double v11 = v5;
  }
  else {
    double v11 = 0.01;
  }
  double v12 = *(double *)(a1 + 64) + v10 * (*(double *)(a1 + 64) / v11);
  double v13 = v6 - v3;
  if (v3 >= 0.01) {
    double v14 = v3;
  }
  else {
    double v14 = 0.01;
  }
  double v15 = *(double *)(a1 + 56) + v13 * (*(double *)(a1 + 56) / v14);
  if (v8 >= v9) {
    double v16 = v9;
  }
  else {
    double v16 = v8;
  }
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", v15, v12, *(double *)(a1 + 72) * v16, *(double *)(a1 + 80) * v16);
  v17 = *(void **)(a1 + 32);
  return v17;
}

void __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke_6(double *a1, void *a2)
{
  id v4 = a2;
  LODWORD(v3) = 1.0;
  [v4 setOpacity:v3];
  objc_msgSend(v4, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __46___UIVectorLabelLayer__isPathCompatible_with___block_invoke(uint64_t result)
{
  return result;
}

uint64_t __46___UIVectorLabelLayer__isPathCompatible_with___block_invoke_2(uint64_t result)
{
  return result;
}

void __44___UIVectorLabelLayer__layersForTextLayout___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 shouldRender])
  {
    id v4 = [UIGraphicsImageRenderer alloc];
    [v3 usedRunRect];
    double v7 = -[UIGraphicsImageRenderer initWithSize:format:](v4, "initWithSize:format:", *(void *)(a1 + 32), v5, v6);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __44___UIVectorLabelLayer__layersForTextLayout___block_invoke_2;
    v13[3] = &unk_1E52DD280;
    id v8 = v3;
    id v14 = v8;
    double v9 = [(UIGraphicsImageRenderer *)v7 imageWithActions:v13];
    double v10 = objc_opt_new();
    objc_msgSend(v10, "_ui_setLayoutRun:", v8);
    objc_msgSend(v10, "setAnchorPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
    id v11 = v9;
    objc_msgSend(v10, "setContents:", objc_msgSend(v11, "CGImage"));
    [v8 usedRunRect];
    objc_msgSend(v10, "setFrame:");
    [*(id *)(a1 + 40) addObject:v10];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44___UIVectorLabelLayer__layersForTextLayout___block_invoke_3;
    v12[3] = &__block_descriptor_40_e40_v24__0____UIVectorTextLayoutGlyph__8_B16l;
    v12[4] = *(void *)(a1 + 64);
    [v3 enumerateGlyphsUsingBlock:v12];
  }
}

uint64_t __44___UIVectorLabelLayer__layersForTextLayout___block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 CGContext];
  return [v2 renderInContext:v3];
}

void __44___UIVectorLabelLayer__layersForTextLayout___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  memset(&v7, 0, sizeof(v7));
  if (v3) {
    objc_msgSend(v3, "pathTransform", *(_OWORD *)&v7.a, *(_OWORD *)&v7.c, *(_OWORD *)&v7.tx);
  }
  double v5 = *(CGPath **)(a1 + 32);
  objc_msgSend(v4, "path", *(_OWORD *)&v7.a, *(_OWORD *)&v7.c, *(_OWORD *)&v7.tx);
  id v6 = objc_claimAutoreleasedReturnValue();
  CGPathAddPath(v5, &v7, (CGPathRef)[v6 CGPath]);
}

@end