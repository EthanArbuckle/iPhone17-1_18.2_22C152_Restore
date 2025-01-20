@interface PXGBurstStackEffect
- (PXGBurstStackEffect)initWithEntityManager:(id)a3;
- (id)createSiblingsTextureForMainSpriteTexture:(id)a3;
- (id)shader;
- (void)configureSiblingSprites:(id *)a3 siblingsSpriteIndexRange:(_PXGSpriteIndexRange)a4 siblingsTexture:(id)a5 forMainRenderSpriteRef:(id *)a6 mainPresentationSpriteRef:(id *)a7 mainSpriteIndex:(unsigned int)a8 mainSpriteTexture:(id)a9 screenScale:(double)a10;
- (void)setNumberOfItemsStackedBehind:(int64_t)a3;
@end

@implementation PXGBurstStackEffect

- (PXGBurstStackEffect)initWithEntityManager:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXGBurstStackEffect;
  v3 = [(PXGEffect *)&v6 initWithEntityManager:a3];
  v4 = v3;
  if (v3) {
    [(PXGBurstStackEffect *)v3 setNumberOfItemsStackedBehind:2];
  }
  return v4;
}

- (void)setNumberOfItemsStackedBehind:(int64_t)a3
{
}

- (id)shader
{
  return 0;
}

- (void)configureSiblingSprites:(id *)a3 siblingsSpriteIndexRange:(_PXGSpriteIndexRange)a4 siblingsTexture:(id)a5 forMainRenderSpriteRef:(id *)a6 mainPresentationSpriteRef:(id *)a7 mainSpriteIndex:(unsigned int)a8 mainSpriteTexture:(id)a9 screenScale:(double)a10
{
  id v15 = a5;
  PXFloatRoundToPixel();
  double v17 = v16;
  PXFloatRoundToPixel();
  double v19 = v18;
  int v20 = PXFloatApproximatelyEqualToFloat();
  double v21 = 1.0;
  if (!v20) {
    double v21 = v19;
  }
  double v68 = v21;
  uint64_t var0 = a3->var0;
  PXRectWithCenterAndSize();
  float v23 = *((double *)a7->var1 + 2);
  double v65 = v24;
  double v66 = v17 * (double)var0;
  PXRectRoundToPixel();
  double x = v73.origin.x;
  double y = v73.origin.y;
  double width = v73.size.width;
  CGFloat height = v73.size.height;
  var1 = a6->var1;
  CGFloat MidX = CGRectGetMidX(v73);
  v74.origin.double x = x;
  v74.origin.double y = y;
  v74.size.double width = width;
  v74.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v74);
  double v32 = v23;
  v75.origin.double x = x;
  v75.origin.double y = y;
  v75.size.double width = width;
  v75.size.CGFloat height = height;
  CGFloat v69 = CGRectGetWidth(v75);
  v76.origin.double x = x;
  v76.origin.double y = y;
  v76.size.double width = width;
  v76.size.CGFloat height = height;
  CGFloat v33 = CGRectGetHeight(v76);
  v34.f64[0] = v69;
  v34.f64[1] = v33;
  *(CGFloat *)var1 = MidX;
  *((CGFloat *)var1 + 1) = MidY;
  *((double *)var1 + 2) = v32;
  *((float32x2_t *)var1 + 3) = vcvt_f32_f64(v34);
  if (var0)
  {
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = 32 * var0;
    double v67 = v66 / v65;
    do
    {
      double y = y - v17;
      double x = v17 + x;
      double width = width + -v17 * 2.0;
      v39 = (CGFloat *)((char *)a3->var2 + v37);
      v77.origin.double x = x;
      v77.origin.double y = y;
      v77.size.double width = width;
      v77.size.CGFloat height = v17 - v68;
      CGFloat v40 = CGRectGetMidX(v77);
      v78.origin.double x = x;
      v78.origin.double y = y;
      v78.size.double width = width;
      v78.size.CGFloat height = v17 - v68;
      CGFloat v41 = CGRectGetMidY(v78);
      v79.origin.double x = x;
      v79.origin.double y = y;
      v79.size.double width = width;
      v79.size.CGFloat height = v17 - v68;
      CGFloat v70 = CGRectGetWidth(v79);
      v80.origin.double x = x;
      v80.origin.double y = y;
      v80.size.double width = width;
      v80.size.CGFloat height = v17 - v68;
      CGFloat v42 = CGRectGetHeight(v80);
      v43.f64[0] = v70;
      v43.f64[1] = v42;
      CGFloat *v39 = v40;
      v39[1] = v41;
      v39[2] = v32;
      *((float32x2_t *)v39 + 3) = vcvt_f32_f64(v43);
      v44 = (_OWORD *)((char *)a3->var3 + v35);
      var2 = a7->var2;
      long long v46 = *((_OWORD *)var2 + 1);
      _OWORD *v44 = *(_OWORD *)var2;
      v44[1] = v46;
      long long v47 = *((_OWORD *)var2 + 5);
      long long v49 = *((_OWORD *)var2 + 2);
      long long v48 = *((_OWORD *)var2 + 3);
      v44[4] = *((_OWORD *)var2 + 4);
      v44[5] = v47;
      v44[2] = v49;
      v44[3] = v48;
      long long v50 = *((_OWORD *)var2 + 9);
      long long v52 = *((_OWORD *)var2 + 6);
      long long v51 = *((_OWORD *)var2 + 7);
      v44[8] = *((_OWORD *)var2 + 8);
      v44[9] = v50;
      v44[6] = v52;
      v44[7] = v51;
      v53 = (float *)((char *)a3->var3 + 4 * v36);
      *(float *)&CGFloat v42 = *v53 * 0.6;
      float *v53 = *(float *)&v42;
      *(float *)&CGFloat v42 = v67 * v53[4];
      v53[4] = *(float *)&v42;
      v54 = (char *)a3->var4 + v36;
      var3 = a7->var3;
      uint64_t v56 = *((void *)var3 + 4);
      long long v57 = *((_OWORD *)var3 + 1);
      *(_OWORD *)v54 = *(_OWORD *)var3;
      *((_OWORD *)v54 + 1) = v57;
      *((void *)v54 + 4) = v56;
      *(void *)((char *)a3->var4 + v36 + 24) = a8;
      v37 += 32;
      v36 += 40;
      v35 += 160;
    }
    while (v38 != v37);
  }
  id v71 = v15;
  if (v71)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_8;
    }
    v58 = [MEMORY[0x263F08690] currentHandler];
    v61 = (objc_class *)objc_opt_class();
    v60 = NSStringFromClass(v61);
    v62 = objc_msgSend(v71, "px_descriptionForAssertionMessage");
    [v58 handleFailureInMethod:a2, self, @"PXGBurstStackEffect.m", 85, @"%@ should be an instance inheriting from %@, but it is %@", @"siblingsTexture", v60, v62 object file lineNumber description];
  }
  else
  {
    v58 = [MEMORY[0x263F08690] currentHandler];
    v59 = (objc_class *)objc_opt_class();
    v60 = NSStringFromClass(v59);
    [v58 handleFailureInMethod:a2, self, @"PXGBurstStackEffect.m", 85, @"%@ should be an instance inheriting from %@, but it is nil", @"siblingsTexture", v60 object file lineNumber description];
  }

LABEL_8:
  objc_msgSend(v71, "addSpriteIndexRange:", a4.var0, HIDWORD(*(unint64_t *)&a4));
}

- (id)createSiblingsTextureForMainSpriteTexture:(id)a3
{
  id v3 = a3;
  v4 = +[PXGEffectWrappingTexture createTexture];
  [v4 setParent:v3];

  return v4;
}

@end