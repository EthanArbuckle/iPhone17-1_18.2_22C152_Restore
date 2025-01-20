@interface UITextMagnifierCommonRenderer
- (id)backgroundColourIfNecessary;
- (id)visualsForMagnifier;
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
- (void)didMoveToSuperview;
- (void)loadImages;
- (void)performOperations:(id)a3;
- (void)update;
@end

@implementation UITextMagnifierCommonRenderer

- (void)loadImages
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!self->m_loaded)
  {
    v17 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_storeStrong((id *)&self->m_images, v17);
    v16 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_storeStrong((id *)&self->m_offsets, v16);
    v15 = self;
    v3 = [(UITextMagnifierCommonRenderer *)self visualsForMagnifier];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = [v3 allKeys];
    uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v20 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v9 = [v3 objectForKey:v8];
          v10 = [v9 objectForKey:@"UITextMagnifierFilename"];
          v11 = v10;
          if (v10)
          {
            uint64_t v12 = _UIImageWithName(v10);
            if (v12)
            {
              v13 = (void *)v12;
              [v17 setObject:v12 forKey:v8];
              v14 = [v9 objectForKey:@"UITextMagnifierOffset"];
              if (v14) {
                [v16 setObject:v14 forKey:v8];
              }
            }
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v5);
    }

    v15->m_loaded = 1;
  }
}

- (void)performOperations:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(UITextMagnifierCommonRenderer *)self magnifier];
  uint64_t v6 = [v5 target];
  v7 = [v6 window];

  uint64_t v8 = [v7 screen];
  v9 = +[UIWindow allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 forScreen:v8];

  if ([(id)UIApp _isSpringBoard])
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __51__UITextMagnifierCommonRenderer_performOperations___block_invoke;
    v21[3] = &unk_1E530A990;
    v23 = &v29;
    id v22 = v7;
    uint64_t v24 = &v25;
    [v9 enumerateObjectsUsingBlock:v21];
    if (v30[3] == 0x7FFFFFFFFFFFFFFFLL || v26[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v9;
    }
    else
    {
      v11 = objc_msgSend(v9, "objectAtIndex:");
      v10 = (void *)[v9 mutableCopy];
      [v10 insertObject:v11 atIndex:v26[3] + 1];
    }
    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v10 = v9;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v16, "_appearsInLoupe", (void)v17)) {
          v4[2](v4, v16);
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v33 count:16];
    }
    while (v13);
  }
}

void __51__UITextMagnifierCommonRenderer_performOperations___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (*(void *)(*(void *)(a1[5] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL && (id)a1[4] == v5)
  {
    id v10 = v5;
    NSClassFromString(&cfstr_Sbisolationtan.isa);
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v6 = v10;
    if (isKindOfClass)
    {
      uint64_t v8 = a1[5];
LABEL_8:
      *(void *)(*(void *)(v8 + 8) + 24) = a3;
      goto LABEL_9;
    }
  }
  if (*(void *)(*(void *)(a1[6] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v6;
    NSClassFromString(&cfstr_Sbhomescreenwi.isa);
    char v9 = objc_opt_isKindOfClass();
    uint64_t v6 = v11;
    if (v9)
    {
      uint64_t v8 = a1[6];
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)didMoveToSuperview
{
  if (dyld_program_sdk_at_least())
  {
    [(UITextMagnifierCommonRenderer *)self update];
  }
}

- (id)backgroundColourIfNecessary
{
  if (![(id)UIApp _isSpringBoard]) {
    goto LABEL_7;
  }
  v3 = [(UITextMagnifierCommonRenderer *)self magnifier];
  uint64_t v4 = [v3 target];
  id v5 = [v4 window];

  uint64_t v6 = [v5 screen];
  v7 = +[UIWindow allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 forScreen:v6];

  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__UITextMagnifierCommonRenderer_backgroundColourIfNecessary__block_invoke;
  v15[3] = &unk_1E530A990;
  long long v17 = &v23;
  id v8 = v5;
  id v16 = v8;
  long long v18 = &v19;
  [v7 enumerateObjectsUsingBlock:v15];
  if (v24[3] == 0x7FFFFFFFFFFFFFFFLL || v20[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v9 = 1;
  }
  else
  {
    id v5 = +[UIColor blackColor];
    int v9 = 0;
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  if (v9)
  {
LABEL_7:
    id v10 = [(UIView *)self _window];
    if ([v10 _isHostedInAnotherProcess])
    {
LABEL_8:
      uint64_t v11 = +[UIColor darkGrayColor];
LABEL_9:
      id v5 = (void *)v11;
    }
    else
    {
      uint64_t v13 = [v10 windowScene];
      uint64_t v14 = [v13 _backgroundStyle];

      id v5 = 0;
      switch(v14)
      {
        case 1:
        case 6:
          uint64_t v11 = +[UIColor grayColor];
          goto LABEL_9;
        case 2:
        case 3:
          uint64_t v11 = +[UIColor lightGrayColor];
          goto LABEL_9;
        case 4:
        case 5:
          goto LABEL_8;
        default:
          break;
      }
    }
  }
  return v5;
}

void __60__UITextMagnifierCommonRenderer_backgroundColourIfNecessary__block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (*(void *)(*(void *)(a1[5] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL && (id)a1[4] == v5)
  {
    id v10 = v5;
    NSClassFromString(&cfstr_Sbisolationtan.isa);
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v6 = v10;
    if (isKindOfClass)
    {
      uint64_t v8 = a1[5];
LABEL_8:
      *(void *)(*(void *)(v8 + 8) + 24) = a3;
      goto LABEL_9;
    }
  }
  if (*(void *)(*(void *)(a1[6] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = v6;
    NSClassFromString(&cfstr_Sbhomescreenwi.isa);
    char v9 = objc_opt_isKindOfClass();
    uint64_t v6 = v11;
    if (v9)
    {
      uint64_t v8 = a1[6];
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)update
{
  v3 = [(UIView *)self superview];

  if (v3)
  {
    [(UITextMagnifierCommonRenderer *)self loadImages];
    uint64_t v4 = [(UITextMagnifierCommonRenderer *)self magnifier];
    int v5 = [v4 isHorizontal];
    uint64_t v6 = @"UITextMagnifierVerticalLo";
    if (v5) {
      uint64_t v6 = @"UITextMagnifierHorizontalLo";
    }
    m_images = self->m_images;
    if (v5) {
      uint64_t v8 = @"UITextMagnifierHorizontalMask";
    }
    else {
      uint64_t v8 = @"UITextMagnifierVerticalMask";
    }
    if (v5) {
      char v9 = @"UITextMagnifierHorizontalHi";
    }
    else {
      char v9 = @"UITextMagnifierVerticalHi";
    }
    id v10 = v6;
    uint64_t v11 = [(NSDictionary *)m_images objectForKey:v10];
    id v12 = [(NSDictionary *)self->m_offsets objectForKey:v10];

    [v12 CGPointValue];
    double v14 = v13;
    double v16 = v15;

    long long v17 = self->m_images;
    long long v18 = v8;
    uint64_t v19 = [(NSDictionary *)v17 objectForKey:v18];
    long long v20 = [(NSDictionary *)self->m_offsets objectForKey:v18];

    [v20 CGPointValue];
    double v80 = v21;
    double v23 = v22;

    uint64_t v24 = self->m_images;
    uint64_t v25 = v9;
    uint64_t v26 = [(NSDictionary *)v24 objectForKey:v25];
    uint64_t v27 = [(NSDictionary *)self->m_offsets objectForKey:v25];

    [v27 CGPointValue];
    double v81 = v29;
    double v82 = v28;

    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    if (!self->m_back && v11)
    {
      v30 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      m_back = self->m_back;
      self->m_back = v30;

      uint64_t v32 = [(UIView *)self layer];
      [v32 addSublayer:self->m_back];
    }
    id v33 = v11;
    -[CALayer setContents:](self->m_back, "setContents:", [v33 CGImage]);
    if (!self->m_mask)
    {
      uint64_t v34 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      m_mask = self->m_mask;
      self->m_mask = v34;

      id v36 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
      [(CALayer *)self->m_mask setMask:v36];

      v37 = [(UIView *)self layer];
      [v37 insertSublayer:self->m_mask above:self->m_back];
    }
    id v79 = v19;
    uint64_t v38 = [v79 CGImage];
    v39 = [(CALayer *)self->m_mask mask];
    [v39 setContents:v38];

    m_content = self->m_content;
    if (m_content)
    {
      v41 = [(CALayer *)m_content sublayers];
      v42 = (void *)[v41 copy];
      [v42 makeObjectsPerformSelector:sel_removeFromSuperlayer];
    }
    else
    {
      v43 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      v44 = self->m_content;
      self->m_content = v43;

      -[CALayer setAnchorPoint:](self->m_content, "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      [(CALayer *)self->m_mask addSublayer:self->m_content];
    }
    if (!self->m_front)
    {
      v45 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      m_front = self->m_front;
      self->m_front = v45;

      v47 = [(UIView *)self layer];
      [v47 insertSublayer:self->m_front above:self->m_mask];
    }
    id v78 = v26;
    -[CALayer setContents:](self->m_front, "setContents:", [v78 CGImage]);
    if (!self->_isRegisteredForGeometryChanges)
    {
      [(UIView *)self _registerForGeometryChanges];
      self->_isRegisteredForGeometryChanges = 1;
    }
    v48 = [(UITextMagnifierCommonRenderer *)self backgroundColourIfNecessary];
    if (v48)
    {
      v77 = v4;
      id v49 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
      v76 = v48;
      objc_msgSend(v49, "setBackgroundColor:", objc_msgSend(v48, "CGColor"));
      v50 = [(UITextMagnifierCommonRenderer *)self magnifier];
      v51 = [v50 target];
      v52 = [v51 window];
      v53 = [v52 screen];
      v54 = v53;
      if (!v53)
      {
        v54 = +[UIScreen mainScreen];
      }
      [v54 bounds];
      objc_msgSend(v49, "setFrame:");
      if (!v53) {

      }
      [(CALayer *)self->m_content addSublayer:v49];
      v48 = v76;
      uint64_t v4 = v77;
    }
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __39__UITextMagnifierCommonRenderer_update__block_invoke;
    v84[3] = &unk_1E530A9B8;
    v84[4] = self;
    [(UITextMagnifierCommonRenderer *)self performOperations:v84];
    [(UIView *)self bounds];
    double v56 = v55;
    double v58 = v57;
    double v60 = v59;
    double v62 = v61;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__UITextMagnifierCommonRenderer_update__block_invoke_2;
    aBlock[3] = &__block_descriptor_64_e63__CGRect__CGPoint_dd__CGSize_dd__40__0_CGPoint_dd_8_CGSize_dd_24l;
    *(double *)&aBlock[4] = v55;
    *(double *)&aBlock[5] = v57;
    *(double *)&aBlock[6] = v59;
    *(double *)&aBlock[7] = v61;
    v63 = (void (**)(void, double, double, double, double))_Block_copy(aBlock);
    [v33 size];
    v63[2](v63, v14, v16, v64, v65);
    -[CALayer setFrame:](self->m_back, "setFrame:");
    -[CALayer setFrame:](self->m_mask, "setFrame:", v56, v58, v60, v62);
    [v4 frame];
    double v66 = ((double (*)(void (**)(void, double, double, double, double), double, double))v63[2])(v63, v80, v23);
    double v68 = v67;
    double v70 = v69;
    double v72 = v71;
    v73 = [(CALayer *)self->m_mask mask];
    objc_msgSend(v73, "setFrame:", v66, v68, v70, v72);

    [v78 size];
    v63[2](v63, v82, v81, v74, v75);
    -[CALayer setFrame:](self->m_front, "setFrame:");
    [MEMORY[0x1E4F39CF8] commit];
  }
}

void __39__UITextMagnifierCommonRenderer_update__block_invoke(uint64_t a1, void *a2)
{
  id v20 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F39C40]);
  [v3 setMatchesOpacity:1];
  [v3 setMatchesTransform:1];
  uint64_t v4 = [v20 layer];
  [v3 setSourceLayer:v4];

  int v5 = [v3 sourceLayer];
  [v5 anchorPoint];
  objc_msgSend(v3, "setAnchorPoint:");

  uint64_t v6 = [v3 sourceLayer];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  if (([v20 _isTextEffectsWindow] & 1) == 0
    && [v20 _isHostedInAnotherProcess])
  {
    double v15 = [*(id *)(a1 + 32) _window];
    double v16 = [v15 windowScene];
    long long v17 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v16];

    [v17 hostedViewOrigin];
    double v8 = v8 + v18;
    double v10 = v10 + v19;
  }
  objc_msgSend(v3, "setFrame:", v8, v10, v12, v14);
  [*(id *)(*(void *)(a1 + 32) + 448) addSublayer:v3];
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  if ((a3->var0 & 6) != 0)
  {
    int v5 = [(UITextMagnifierCommonRenderer *)self magnifier];
    [v5 offsetFromMagnificationPoint];
    double v7 = v6;
    double v8 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    int v10 = [v5 isHorizontal];
    double v11 = -0.0;
    if (v10) {
      double v12 = v7;
    }
    else {
      double v12 = -0.0;
    }
    double v13 = v9 + v12;
    if (!v10) {
      double v11 = v7;
    }
    double v14 = v8 + v11;
    double v15 = [(UIView *)self _window];
    [(UIView *)self bounds];
    objc_msgSend(v15, "convertRect:fromView:", self);
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    long long v24 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    *(_OWORD *)&v31.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&v31.m33 = v24;
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&v31.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&v31.m43 = v25;
    long long v26 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)&v31.m11 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v31.m13 = v26;
    long long v27 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    *(_OWORD *)&v31.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    *(_OWORD *)&v31.m23 = v27;
    *(_OWORD *)&v30.m31 = *(_OWORD *)&v31.m31;
    *(_OWORD *)&v30.m33 = v24;
    *(_OWORD *)&v30.m41 = *(_OWORD *)&v31.m41;
    *(_OWORD *)&v30.m43 = v25;
    *(_OWORD *)&v30.m11 = *(_OWORD *)&v31.m11;
    *(_OWORD *)&v30.m13 = v26;
    *(_OWORD *)&v30.m21 = *(_OWORD *)&v31.m21;
    *(_OWORD *)&v30.m23 = v27;
    CATransform3DTranslate(&v31, &v30, (v14 + v17 + (v21 + v21 / -1.20000005) * 0.5) * -1.20000005, (v13 + v19 + (v23 + v23 / -1.20000005) * 0.5) * -1.20000005, 0.0);
    CATransform3D v29 = v31;
    CATransform3DScale(&v30, &v29, 1.20000005, 1.20000005, 1.0);
    CATransform3D v31 = v30;
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    CATransform3D v28 = v31;
    [(CALayer *)self->m_content setSublayerTransform:&v28];
    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (id)visualsForMagnifier
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_front, 0);
  objc_storeStrong((id *)&self->m_content, 0);
  objc_storeStrong((id *)&self->m_mask, 0);
  objc_storeStrong((id *)&self->m_back, 0);
  objc_storeStrong((id *)&self->m_offsets, 0);
  objc_storeStrong((id *)&self->m_images, 0);
}

@end