@interface WTFinaleTextEffect
@end

@implementation WTFinaleTextEffect

uint64_t __40___WTFinaleTextEffect_updateEffectWith___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sweep];
}

void __40___WTFinaleTextEffect_updateEffectWith___block_invoke_2(uint64_t a1)
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) effectView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [*(id *)(a1 + 32) rootLayer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  v12 = [*(id *)(a1 + 32) textContentLayer];
  v13 = [v12 sublayers];
  v14 = (void *)[v13 copy];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v93 objects:v98 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v94;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v94 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v93 + 1) + 8 * i) removeFromSuperlayer];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v93 objects:v98 count:16];
    }
    while (v16);
  }

  Mutable = CGPathCreateMutable();
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v20 = *(id *)(a1 + 40);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v89 objects:v97 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    CGFloat v23 = *MEMORY[0x263F001A8];
    CGFloat v24 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat v25 = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat v26 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v27 = *(void *)v90;
    CGFloat height = v26;
    CGFloat width = v25;
    CGFloat y = v24;
    CGFloat x = *MEMORY[0x263F001A8];
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v90 != v27) {
          objc_enumerationMutation(v20);
        }
        v33 = *(void **)(*((void *)&v89 + 1) + 8 * j);
        v34 = objc_msgSend(v33, "layerWithContents", (void)v89);
        v35 = [*(id *)(a1 + 32) textContentLayer];
        [v35 addSublayer:v34];

        v36 = [*(id *)(a1 + 40) firstObject];

        if (v33 == v36)
        {
          v47 = (const CGPath *)[v33 clippingPath];
LABEL_20:
          CGPathAddPath(Mutable, 0, v47);
          goto LABEL_22;
        }
        v37 = [*(id *)(a1 + 40) lastObject];

        if (v33 == v37)
        {
          CGPathAddPath(Mutable, 0, (CGPathRef)[v33 clippingPath]);
          v101.origin.CGFloat x = x;
          v101.origin.CGFloat y = y;
          v101.size.CGFloat width = width;
          v101.size.CGFloat height = height;
          v106.origin.CGFloat x = v23;
          v106.origin.CGFloat y = v24;
          v106.size.CGFloat width = v25;
          v106.size.CGFloat height = v26;
          if (CGRectEqualToRect(v101, v106)) {
            goto LABEL_22;
          }
          v102.origin.CGFloat x = x;
          v102.origin.CGFloat y = y;
          v102.size.CGFloat width = width;
          v102.size.CGFloat height = height;
          v47 = CGPathCreateWithRect(v102, 0);
          goto LABEL_20;
        }
        v100.origin.CGFloat x = x;
        v100.origin.CGFloat y = y;
        v100.size.CGFloat width = width;
        v100.size.CGFloat height = height;
        v105.origin.CGFloat x = v23;
        v105.origin.CGFloat y = v24;
        v105.size.CGFloat width = v25;
        v105.size.CGFloat height = v26;
        BOOL v38 = CGRectEqualToRect(v100, v105);
        [v33 presentationFrame];
        double v43 = v39;
        double v44 = v40;
        double v45 = v41;
        double v46 = v42;
        if (v38)
        {
          CGFloat height = v42;
          CGFloat width = v41;
          CGFloat y = v40;
          CGFloat x = v39;
        }
        else
        {
          v103.origin.CGFloat x = x;
          v103.origin.CGFloat y = y;
          v103.size.CGFloat width = width;
          v103.size.CGFloat height = height;
          CGRect v104 = CGRectUnion(v103, *(CGRect *)&v43);
          CGFloat x = v104.origin.x;
          CGFloat y = v104.origin.y;
          CGFloat width = v104.size.width;
          CGFloat height = v104.size.height;
        }
LABEL_22:
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v89 objects:v97 count:16];
    }
    while (v22);
  }

  v48 = [*(id *)(a1 + 32) maskLayer];
  [v48 setPath:Mutable];

  CGPathRelease(Mutable);
  v49 = [*(id *)(a1 + 32) effectView];
  [v49 bounds];
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  double v57 = v56;
  v58 = [*(id *)(a1 + 32) gradientHostLayer];
  objc_msgSend(v58, "setFrame:", v51, v53, v55, v57);

  v59 = [*(id *)(a1 + 32) effectView];
  [v59 bounds];
  double v61 = v60;
  double v63 = v62;
  double v65 = v64;
  double v67 = v66;
  v68 = [*(id *)(a1 + 32) gradientLayer];
  objc_msgSend(v68, "setFrame:", v61, v63, v65, v67);

  v69 = [*(id *)(a1 + 32) effectView];
  [v69 bounds];
  double v71 = v70;
  double v73 = v72;
  double v75 = v74;
  double v77 = v76;
  v78 = [*(id *)(a1 + 32) maskLayer];
  objc_msgSend(v78, "setFrame:", v71, v73, v75, v77);

  v79 = [*(id *)(a1 + 32) effectView];
  [v79 bounds];
  double v81 = v80;
  double v83 = v82;
  double v85 = v84;
  double v87 = v86;
  v88 = [*(id *)(a1 + 32) textContentLayer];
  objc_msgSend(v88, "setFrame:", v81, v83, v85, v87);
}

void __29___WTFinaleTextEffect__sweep__block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) gradientLayer];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

@end