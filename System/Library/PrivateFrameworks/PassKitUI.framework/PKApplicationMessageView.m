@interface PKApplicationMessageView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)needsRemoval;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKApplicationMessageNode)content;
- (PKApplicationMessageView)init;
- (PKApplicationMessageView)initWithConfiguration:(id)a3;
- (PKApplicationMessageView)initWithFrame:(CGRect)a3;
- (PKApplicationMessageViewConfiguration)configuration;
- (PKApplicationMessageViewDelegate)delegate;
- (double)_layoutWithContext:(CGFloat)a3 bounds:(CGFloat)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)scrollType;
- (uint64_t)_initWithType:(void *)a3 configuration:;
- (void)_dismiss;
- (void)_invalidate;
- (void)_invalidateSize;
- (void)_markPresented;
- (void)_rootView;
- (void)_setBlurRadius:(void *)a3 animated:(double)a4 withCompletion:;
- (void)_setContent:(unsigned int)a3 type:(uint64_t)a4 depth:;
- (void)_tapped:(id)a3;
- (void)_treeLayoutWithContext:(void *)a3 block:;
- (void)_updateFilters;
- (void)_updateHighlightAnimated:(uint64_t)a1;
- (void)_updateSubviewsWithType:(uint64_t)a3 depth:;
- (void)_visitPostOrder:(uint64_t)a1;
- (void)_visitPreOrder:(uint64_t)a1;
- (void)collapse;
- (void)dealloc;
- (void)layoutIfNeededAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setContent:(id)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSubheaderDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKApplicationMessageView

void __82__PKApplicationMessageView_RemovedSubviewContainer_commitAnimated_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (++*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= *(unsigned __int8 *)(a1 + 48))
    {
      id v3 = WeakRetained;
      -[PKApplicationMessageView_RemovedSubviewContainer _finishFromDealloc:]((uint64_t)WeakRetained, 0);
      id WeakRetained = v3;
    }
  }
}

void __82__PKApplicationMessageView_RemovedSubviewContainer_commitAnimated_withCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (++*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= *(unsigned __int8 *)(a1 + 48))
    {
      id v3 = WeakRetained;
      -[PKApplicationMessageView_RemovedSubviewContainer _finishFromDealloc:]((uint64_t)WeakRetained, 0);
      id WeakRetained = v3;
    }
  }
}

uint64_t __82__PKApplicationMessageView_RemovedSubviewContainer_commitAnimated_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) invalidate];
  if (result)
  {
    __break(1u);
  }
  else
  {
    [*(id *)(a1 + 32) invalidate];
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (PKApplicationMessageView)init
{
  return 0;
}

- (PKApplicationMessageView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (PKApplicationMessageView)initWithConfiguration:(id)a3
{
  if (a3)
  {
    self = (PKApplicationMessageView *)(id)-[PKApplicationMessageView _initWithType:configuration:]((uint64_t)self, 2, a3);
    id v3 = self;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (uint64_t)_initWithType:(void *)a3 configuration:
{
  id v6 = a3;
  v7 = v6;
  if (a1)
  {
    double v8 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v10 = v6 ? *((double *)v6 + 1) : 0.0;
    v39.receiver = (id)a1;
    v39.super_class = (Class)PKApplicationMessageView;
    id v11 = objc_msgSendSuper2(&v39, sel_initWithFrame_, v8, v9, v10, 0.0);
    a1 = (uint64_t)v11;
    if (v11)
    {
      *((void *)v11 + 93) = a2;
      objc_storeStrong((id *)v11 + 91, a3);
      *(unsigned char *)(a1 + 528) = 1;
      *(void *)(a1 + 520) = 0x7FEFFFFFFFFFFFFFLL;
      *(_DWORD *)(a1 + 612) = 0;
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v13 = *(void **)(a1 + 648);
      *(void *)(a1 + 648) = v12;

      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v15 = *(void **)(a1 + 656);
      *(void *)(a1 + 656) = v14;

      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v17 = *(void **)(a1 + 664);
      *(void *)(a1 + 664) = v16;

      *(unsigned char *)(a1 + 712) = [(id)a1 isEnabled];
      *(unsigned char *)(a1 + 713) = [(id)a1 isSelected];
      *(unsigned char *)(a1 + 714) = [(id)a1 isHighlighted];
      *(unsigned char *)(a1 + 584) = 0;
      objc_initWeak(&location, (id)a1);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __56__PKApplicationMessageView__initWithType_configuration___block_invoke;
      aBlock[3] = &unk_1E59D3018;
      objc_copyWeak(&v37, &location);
      v18 = _Block_copy(aBlock);
      if ((unint64_t)(a2 - 1) <= 1)
      {
        v19 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
        [v19 setPreferredSymbolConfigurationForImage:0];
        v20 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [v19 setBaseForegroundColor:v20];

        objc_msgSend(v19, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
        v21 = (void *)MEMORY[0x1E4FB13F0];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __56__PKApplicationMessageView__initWithType_configuration___block_invoke_2;
        v34[3] = &unk_1E59CBEE0;
        objc_copyWeak(&v35, &location);
        v22 = [v21 actionWithHandler:v34];
        uint64_t v23 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v19 primaryAction:v22];
        v24 = *(void **)(a1 + 632);
        *(void *)(a1 + 632) = v23;

        v25 = *(void **)(a1 + 632);
        uint64_t v28 = MEMORY[0x1E4F143A8];
        uint64_t v29 = 3221225472;
        v30 = __56__PKApplicationMessageView__initWithType_configuration___block_invoke_3;
        v31 = &unk_1E59D3040;
        id v32 = v18;
        uint64_t v33 = a2;
        [v25 setConfigurationUpdateHandler:&v28];
        objc_msgSend(*(id *)(a1 + 632), "setAlpha:", 0.0, v28, v29, v30, v31);
        objc_msgSend(*(id *)(a1 + 632), "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
        [*(id *)(a1 + 632) sizeToFit];
        [*(id *)(a1 + 632) setNeedsUpdateConfiguration];
        [(id)a1 addSubview:*(void *)(a1 + 632)];

        objc_destroyWeak(&v35);
      }
      v26 = [(id)a1 layer];
      objc_msgSend(v26, "setAnchorPoint:", 0.5, 0.0);
      -[PKApplicationMessageView _updateHighlightAnimated:](a1, 0);
      [(id)a1 addTarget:a1 action:sel__tapped_ forControlEvents:64];

      objc_destroyWeak(&v37);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

uint64_t __56__PKApplicationMessageView__initWithType_configuration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained traitCollection];
  uint64_t v3 = _PKFontForDesign(v2, (void *)*MEMORY[0x1E4FB0928], (void *)*MEMORY[0x1E4FB28C8], 0x8000, 0, 0);

  return v3;
}

void __56__PKApplicationMessageView__initWithType_configuration___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    -[PKApplicationMessageView _dismiss]((uint64_t)WeakRetained);
    id WeakRetained = v2;
  }
}

void __56__PKApplicationMessageView__initWithType_configuration___block_invoke_3(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  v5 = [v3 configuration];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v6 == 2)
  {
    double v8 = PKLocalizedString(&cfstr_ClearAllApplic.isa);
    uint64_t v16 = *MEMORY[0x1E4FB06F8];
    v17[0] = v4;
    double v9 = (void *)MEMORY[0x1E4F1C9E8];
    double v10 = (void **)v17;
    id v11 = &v16;
  }
  else
  {
    double v8 = PKLocalizedString(&cfstr_ClearSectionAp.isa);
    uint64_t v14 = *MEMORY[0x1E4FB06F8];
    v15 = v4;
    double v9 = (void *)MEMORY[0x1E4F1C9E8];
    double v10 = &v15;
    id v11 = &v14;
  }
  id v12 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
  v13 = (void *)[v7 initWithString:v8 attributes:v12];
  [v5 setAttributedTitle:v13];

  [v3 setConfiguration:v5];
}

- (void)_updateHighlightAnimated:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  v4 = [(id)a1 layer];
  if (*(void *)(a1 + 696))
  {
    v5 = CGColorRetain(*(CGColorRef *)(a1 + 704));
  }
  else
  {
    id v6 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
    v5 = CGColorRetain((CGColorRef)[v6 CGColor]);
  }
  if (*(unsigned char *)(a1 + 714) || *(unsigned char *)(a1 + 713))
  {
    id v7 = (void *)MEMORY[0x1E4FB1618];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4FB1618];
    if (*(unsigned char *)(a1 + 712))
    {
      double v8 = 1.0;
      uint64_t v9 = 2;
      goto LABEL_9;
    }
  }
  double v8 = 0.5;
  uint64_t v9 = 1030;
LABEL_9:
  id v10 = [v7 colorWithWhite:1.0 alpha:v8];
  id v11 = CGColorRetain((CGColorRef)[v10 CGColor]);

  if (!CGColorEqualToColor(v5, v11))
  {
    if (!*(void *)(a1 + 696))
    {
      id v12 = objc_alloc(MEMORY[0x1E4F39BC0]);
      uint64_t v13 = [v12 initWithType:*MEMORY[0x1E4F3A2A8]];
      uint64_t v14 = *(void **)(a1 + 696);
      *(void *)(a1 + 696) = v13;

      [*(id *)(a1 + 696) setName:@"highlightFilter"];
      [*(id *)(a1 + 696) setValue:v5 forKey:@"inputColor"];
      -[PKApplicationMessageView _updateFilters]((void *)a1);
    }
    CGColorRelease(*(CGColorRef *)(a1 + 704));
    *(void *)(a1 + 704) = CGColorRetain(v11);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __53__PKApplicationMessageView__updateHighlightAnimated___block_invoke;
    v20 = &unk_1E59CA870;
    id v21 = v4;
    uint64_t v22 = a1;
    v15 = _Block_copy(&v17);
    uint64_t v16 = v15;
    if (a2) {
      objc_msgSend(MEMORY[0x1E4FB1EB0], "_animateUsingDefaultTimingWithOptions:animations:completion:", v9, v15, 0, v17, v18, v19, v20);
    }
    else {
      (*((void (**)(void *))v15 + 2))(v15);
    }
  }
  CGColorRelease(v5);
  CGColorRelease(v11);
}

- (void)dealloc
{
  CGColorRelease(self->_filterColor);
  -[PKApplicationMessageView _invalidate]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)PKApplicationMessageView;
  [(PKApplicationMessageView *)&v3 dealloc];
}

- (void)_invalidate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1 && !*(unsigned char *)(a1 + 608))
  {
    *(unsigned char *)(a1 + 608) = 1;
    *(void *)(a1 + 456) = 0;
    id v2 = *(void **)(a1 + 472);
    if (v2)
    {
      uint64_t v3 = [v2 context];
      v4 = (void *)v3;
      if (v3) {
        *(void *)(v3 + 24) = 0;
      }
      [*(id *)(a1 + 472) setContext:0];
      v5 = *(void **)(a1 + 472);
      *(void *)(a1 + 472) = 0;
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = *(id *)(a1 + 648);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "context", (void)v14);
          id v12 = (void *)v11;
          if (v11) {
            uint64_t v11 = *(void *)(v11 + 24);
          }
          -[PKApplicationMessageView _invalidate](v11);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 736));
    [WeakRetained applicationMessageViewNeedsRemoval:a1];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = -[PKApplicationMessageView _layoutWithContext:bounds:]((uint64_t)self, 0, *MEMORY[0x1E4F1DAD8], *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)_layoutWithContext:(CGFloat)a3 bounds:(CGFloat)a4
{
  if (!a1) {
    return 0.0;
  }
  if (*(unsigned char *)(a1 + 608))
  {
    [(id)a1 bounds];
    return v7;
  }
  else
  {
    CGFloat v9 = a6;
    double v8 = a5;
    int v12 = a2;
    unint64_t v13 = HIDWORD(a2);
    if (*(unsigned char *)(a1 + 528))
    {
      LOBYTE(v14) = 1;
    }
    else
    {
      v135.origin.x = a3;
      v135.origin.y = a4;
      v135.size.width = a5;
      v135.size.height = a6;
      BOOL v14 = !CGRectEqualToRect(*(CGRect *)(a1 + 536), v135);
    }
    uint64_t v15 = [*(id *)(a1 + 472) context];
    long long v16 = (void *)v15;
    if (v15 && (uint64_t v17 = *(void *)(v15 + 32), [*(id *)(v15 + 16) numberOfChildren] + v17))
    {
      BOOL v19 = 0;
      int v20 = 0;
      if (*(unsigned char *)(a1 + 496)) {
        BOOL v18 = 0;
      }
      else {
        BOOL v18 = *(void *)(a1 + 456) == 0;
      }
    }
    else
    {
      BOOL v18 = 0;
      BOOL v19 = *(void *)(a1 + 456) == 0;
      int v20 = 1;
    }
    if (v13) {
      char v21 = 1;
    }
    else {
      char v21 = v14;
    }
    if (v21)
    {
      BOOL v83 = v19;
      [(id)a1 _shouldReverseLayoutDirection];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke;
      aBlock[3] = &__block_descriptor_40_e22_v28__0__UIView_8d16B24l;
      int v132 = v12;
      int v133 = v13;
      v84 = (void (**)(void *, void, uint64_t, double))_Block_copy(aBlock);
      v128[0] = MEMORY[0x1E4F143A8];
      v128[1] = 3221225472;
      v128[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_2;
      v128[3] = &unk_1E59D3088;
      int v129 = v12;
      int v130 = v13;
      v128[4] = a1;
      uint64_t v22 = _Block_copy(v128);
      v125[0] = MEMORY[0x1E4F143A8];
      v125[1] = 3221225472;
      v125[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_3;
      v125[3] = &__block_descriptor_40_e51____v__d_20__0__PKApplicationMessageContentView_8B16l;
      int v126 = v12;
      int v127 = v13;
      uint64_t v23 = _Block_copy(v125);
      v122[0] = MEMORY[0x1E4F143A8];
      v122[1] = 3221225472;
      v122[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_5;
      v122[3] = &__block_descriptor_40_e44____v__d_20__0__PKApplicationMessageView_8B16l;
      int v123 = v12;
      int v124 = v13;
      v24 = _Block_copy(v122);
      uint64_t v114 = 0;
      v115 = (CGRect *)&v114;
      unint64_t v25 = 0x4010000000;
      uint64_t v116 = 0x4010000000;
      v117 = "";
      CGFloat v82 = a3;
      CGFloat v118 = a3;
      CGFloat v119 = a4;
      double v120 = v8;
      CGFloat v121 = v9;
      uint64_t v26 = *(void *)(a1 + 632);
      if (v26)
      {
        LOBYTE(v25) = *(unsigned char *)(a1 + 584);
        v84[2](v84, v26, 1, (double)v25);
        BOOL v76 = v18;
        objc_msgSend(*(id *)(a1 + 632), "sizeThatFits:", 1.79769313e308, 1.79769313e308);
        double v79 = v28;
        double v81 = v27;
        double v77 = v9;
        uint64_t v29 = [*(id *)(a1 + 632) imageView];
        v30 = [v29 image];

        [v30 alignmentRectInsets];
        double v32 = v31;
        v113[0] = MEMORY[0x1E4F143A8];
        v113[1] = 3221225472;
        v113[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_7;
        v113[3] = &unk_1E59D3118;
        v113[5] = v33;
        v113[6] = v34;
        *(double *)&v113[7] = v31;
        v113[8] = v35;
        v113[4] = &v114;
        v36 = (void (**)(void, double, double))_Block_copy(v113);
        id v37 = v36;
        if (((*(unsigned char *)(a1 + 584) == 0) & ~v20) != 0)
        {
          v36[2](v36, 8.0, 6.0);
          PKSizeAlignedInRect();
          double v39 = v46;
          double v41 = v47;
          double v43 = v48;
          double v45 = v49;
        }
        else
        {
          memset(&slice, 0, 32);
          if (*(void *)(a1 + 744) != 2 && *(unsigned char *)(a1 + 512)) {
            CGRectDivide(v115[1], (CGRect *)&slice, v115 + 1, 8.0, CGRectMinYEdge);
          }
          v37[2](v37, 8.0, 0.0);
          PKSizeAlignedInRect();
          double v39 = v38;
          double v41 = v40;
          double v43 = v42;
          double v45 = v44;
          CGRect v134 = v115[1];
          CGRectDivide(v134, (CGRect *)&slice, v115 + 1, v134.size.height - v134.origin.y - v32 + 8.0, CGRectMinYEdge);
        }
        CGFloat v9 = v77;
        uint64_t v50 = *(void *)(a1 + 632);
        double v51 = *MEMORY[0x1E4F1DAD8];
        double v52 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        v53 = (void (*)(void *, uint64_t, CATransform3D *, uint64_t, double, double, double, double, double, double, double, double))v22[2];
        long long v54 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
        *(_OWORD *)&slice.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
        *(_OWORD *)&slice.m33 = v54;
        long long v55 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
        *(_OWORD *)&slice.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
        *(_OWORD *)&slice.m43 = v55;
        long long v56 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
        *(_OWORD *)&slice.m11 = *MEMORY[0x1E4F39B10];
        *(_OWORD *)&slice.m13 = v56;
        long long v57 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
        *(_OWORD *)&slice.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
        *(_OWORD *)&slice.m23 = v57;
        v53(v22, v50, &slice, 1, v39, v41, v43, v45, v51, v52, v81, v79);

        BOOL v18 = v76;
      }
      v109[0] = MEMORY[0x1E4F143A8];
      v109[1] = 3221225472;
      v109[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_8;
      v109[3] = &unk_1E59D3168;
      v109[4] = a1;
      id v58 = v23;
      id v110 = v58;
      id v80 = v24;
      id v111 = v80;
      v59 = _Block_copy(v109);
      memset(&slice, 0, sizeof(slice));
      CATransform3DMakeScale(&slice, 0.5, 0.5, 1.0);
      v78 = v58;
      uint64_t v60 = [*(id *)(a1 + 664) count];
      uint64_t v61 = v60;
      v93[0] = MEMORY[0x1E4F143A8];
      v93[1] = 3221225472;
      long long v102 = *(_OWORD *)&slice.m31;
      long long v103 = *(_OWORD *)&slice.m33;
      long long v104 = *(_OWORD *)&slice.m41;
      long long v105 = *(_OWORD *)&slice.m43;
      long long v98 = *(_OWORD *)&slice.m11;
      long long v99 = *(_OWORD *)&slice.m13;
      long long v100 = *(_OWORD *)&slice.m21;
      BOOL v63 = v13 == 1 && v60 != 0;
      v93[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_10;
      v93[3] = &unk_1E59D31B8;
      BOOL v106 = v63;
      v93[4] = a1;
      v97 = &v114;
      BOOL v107 = v83;
      long long v101 = *(_OWORD *)&slice.m23;
      v64 = v22;
      id v94 = v64;
      BOOL v108 = v18;
      v65 = v84;
      id v95 = v65;
      id v66 = v59;
      id v96 = v66;
      v67 = (void (**)(void))_Block_copy(v93);
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_12;
      v85[3] = &unk_1E59D3258;
      BOOL v92 = v63;
      v85[4] = a1;
      v68 = v64;
      CATransform3D v90 = slice;
      uint64_t v91 = v61;
      id v86 = v68;
      v89 = &v114;
      v69 = v65;
      id v87 = v69;
      id v70 = v66;
      id v88 = v70;
      v71 = (void (**)(void))_Block_copy(v85);
      v72 = v71;
      if (*(_DWORD *)(a1 + 612))
      {
        double v73 = ((double (*)(void *))v71[2])(v71);
        v67[2](v67);
      }
      else
      {
        double v73 = ((double (*)(void))v67[2])(v67);
        v72[2](v72);
      }
      double v74 = v73 + v115[1].origin.y - a4;
      if (v13 <= 1)
      {
        *(unsigned char *)(a1 + 528) = 0;
        *(CGFloat *)(a1 + 536) = v82;
        *(CGFloat *)(a1 + 544) = a4;
        *(double *)(a1 + 552) = v8;
        *(CGFloat *)(a1 + 560) = v9;
        *(double *)(a1 + 568) = v8;
        *(double *)(a1 + 576) = v74;
      }

      _Block_object_dispose(&v114, 8);
    }
    else
    {
      double v8 = *(double *)(a1 + 568);
    }
  }
  return v8;
}

void __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke(uint64_t a1, void *a2, char a3, double a4)
{
  id v7 = a2;
  int v8 = *(_DWORD *)(a1 + 36);
  if (v8 == 1 || v8 == 2 && (a3 & 1) == 0)
  {
    id v9 = v7;
    objc_msgSend(v7, "pkui_setAlpha:animated:", *(unsigned __int8 *)(a1 + 32), a4);
    id v7 = v9;
  }
}

void __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_2(uint64_t a1, void *a2, _OWORD *a3, char a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  id v23 = a2;
  v24 = v23;
  int v25 = *(_DWORD *)(a1 + 44);
  if (v25 == 1 || v25 == 2 && (a4 & 1) == 0)
  {
    objc_msgSend(v23, "pkui_setBounds:animated:", *(unsigned __int8 *)(a1 + 40), a9, a10, a11, a12);
    uint64_t v26 = [v24 layer];
    [v26 anchorPoint];
    objc_msgSend(v24, "pkui_setPosition:animated:", *(unsigned __int8 *)(a1 + 40), a5 + v27 * a7, a6 + v28 * a8);
    uint64_t v29 = *(unsigned __int8 *)(a1 + 40);
    long long v30 = a3[5];
    void v34[4] = a3[4];
    v34[5] = v30;
    long long v31 = a3[7];
    v34[6] = a3[6];
    v34[7] = v31;
    long long v32 = a3[1];
    v34[0] = *a3;
    v34[1] = v32;
    long long v33 = a3[3];
    v34[2] = a3[2];
    v34[3] = v33;
    objc_msgSend(v24, "pkui_setTransform:animated:", v34, v29);
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 672)) {
      [v24 layoutIfNeeded];
    }
  }
}

id __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_3(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_4;
  aBlock[3] = &unk_1E59D30B0;
  uint64_t v6 = *(void *)(a1 + 32);
  char v13 = a3;
  id v11 = v5;
  uint64_t v12 = v6;
  id v7 = v5;
  int v8 = _Block_copy(aBlock);

  return v8;
}

void __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_4(uint64_t a1, double a2)
{
  int v2 = *(_DWORD *)(a1 + 44);
  if (v2 == 1 || v2 == 2 && !*(unsigned char *)(a1 + 48)) {
    -[PKApplicationMessageContentView setBlurRadius:animated:withCompletion:](*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0, a2);
  }
}

id __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_5(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_6;
  aBlock[3] = &unk_1E59D30B0;
  uint64_t v6 = *(void *)(a1 + 32);
  char v13 = a3;
  id v11 = v5;
  uint64_t v12 = v6;
  id v7 = v5;
  int v8 = _Block_copy(aBlock);

  return v8;
}

void __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_6(uint64_t a1, double a2)
{
  int v2 = *(_DWORD *)(a1 + 44);
  if (v2 == 1 || v2 == 2 && !*(unsigned char *)(a1 + 48)) {
    -[PKApplicationMessageView _setBlurRadius:animated:withCompletion:](*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0, a2);
  }
}

- (void)_setBlurRadius:(void *)a3 animated:(double)a4 withCompletion:
{
  id v7 = a3;
  int v8 = (void (**)(void, void))v7;
  if (a1)
  {
    if (*(double *)(a1 + 688) == a4)
    {
      if (v7) {
        (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
      }
    }
    else
    {
      if (!*(void *)(a1 + 680))
      {
        id v9 = objc_alloc(MEMORY[0x1E4F39BC0]);
        uint64_t v10 = [v9 initWithType:*MEMORY[0x1E4F3A0D0]];
        id v11 = *(void **)(a1 + 680);
        *(void *)(a1 + 680) = v10;

        [*(id *)(a1 + 680) setName:@"blur"];
        -[PKApplicationMessageView _updateFilters]((void *)a1);
      }
      uint64_t v12 = [(id)a1 layer];
      if (a2)
      {
        char v13 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"filters.blur.inputRadius"];
        objc_msgSend(v13, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", *(double *)(a1 + 688), a4);
        if (v8)
        {
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __67__PKApplicationMessageView__setBlurRadius_animated_withCompletion___block_invoke;
          v16[3] = &unk_1E59CA9F8;
          uint64_t v17 = v8;
          objc_msgSend(v13, "pkui_setCompletionHandler:", v16);
        }
        id v14 = (id)objc_msgSend(v12, "pkui_addAdditiveAnimation:", v13);
      }
      *(double *)(a1 + 688) = a4;
      uint64_t v15 = [NSNumber numberWithDouble:a4];
      [v12 setValue:v15 forKeyPath:@"filters.blur.inputRadius"];

      if (v8 && (a2 & 1) == 0) {
        v8[2](v8, 1);
      }
    }
  }
}

double __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_7(uint64_t a1, double a2)
{
  return a2 - *(double *)(a1 + 48) + *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
}

void __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_8(uint64_t a1, void *a2)
{
  double v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 640);
  if (v5)
  {
    double v6 = *(double *)(v4 + 592);
    double v7 = fmin(*(double *)(v4 + 600), *(double *)(v4 + 520));
    uint64_t v8 = *(unsigned __int8 *)(v4 + 585);
    uint64_t v9 = 24;
    if (*(unsigned char *)(v4 + 585)) {
      uint64_t v9 = 4;
    }
    uint64_t v10 = *(unsigned int *)(v4 + OBJC_IVAR___PKApplicationMessageView__type[v9]);
    id v11 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    v3[2](v3, v5, v8, v10, v11, v6, v7);

    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v12 = *(void **)(v4 + 648);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_9;
  v14[3] = &unk_1E59D3140;
  v14[4] = v4;
  uint64_t v15 = v3;
  id v16 = *(id *)(a1 + 48);
  char v13 = v3;
  [v12 enumerateObjectsUsingBlock:v14];
}

void __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_9(void *a1, void *a2)
{
  uint64_t v3 = [a2 context];
  id v18 = (id)v3;
  if (v3) {
    uint64_t v4 = *(void **)(v3 + 24);
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4;
  double v6 = (unsigned int *)v5;
  uint64_t v7 = *(void *)(a1[4] + 728);
  if (v7) {
    double v8 = *(double *)(v7 + 8);
  }
  else {
    double v8 = 0.0;
  }
  objc_msgSend(v5, "sizeThatFits:", v8, 1.79769313e308);
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = a1[5];
  if (*((unsigned char *)v6 + 496)) {
    id v14 = (unsigned int *)(a1[4] + 612);
  }
  else {
    id v14 = v6 + 125;
  }
  BOOL v15 = *((unsigned __int8 *)v6 + 496) != 0;
  uint64_t v16 = *v14;
  uint64_t v17 = (*(void (**)(void))(a1[6] + 16))();
  (*(void (**)(uint64_t, unsigned int *, BOOL, uint64_t, void *, double, double))(v13 + 16))(v13, v6, v15, v16, v17, v10, v12);
}

double __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_10(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 200))
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 664);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (!v3) {
      goto LABEL_19;
    }
    uint64_t v4 = *(void *)v56;
    while (1)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v56 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        if (v6)
        {
          if (*(_DWORD *)(v6 + 28)) {
            continue;
          }
          uint64_t v6 = *(void *)(v6 + 32);
        }
        id v7 = (id)v6;
        [v7 bounds];
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        double v16 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        PKFloatRoundToPixel();
        double v18 = v17;
        if (*(unsigned char *)(a1 + 201))
        {
          long long v19 = *(_OWORD *)(a1 + 152);
          long long v51 = *(_OWORD *)(a1 + 136);
          long long v52 = v19;
          long long v20 = *(_OWORD *)(a1 + 184);
          long long v53 = *(_OWORD *)(a1 + 168);
          long long v54 = v20;
          long long v21 = *(_OWORD *)(a1 + 88);
          long long v47 = *(_OWORD *)(a1 + 72);
          long long v48 = v21;
          long long v22 = *(_OWORD *)(a1 + 120);
          long long v49 = *(_OWORD *)(a1 + 104);
          long long v50 = v22;
        }
        else
        {
          if (v7)
          {
            [v7 transform3D];
          }
          else
          {
            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v40 = 0u;
            long long v39 = 0u;
          }
          long long v51 = v43;
          long long v52 = v44;
          long long v53 = v45;
          long long v54 = v46;
          long long v47 = v39;
          long long v48 = v40;
          long long v49 = v41;
          long long v50 = v42;
        }
        id v23 = *(void (**)(double, double, double, double, double, double, double, double))(*(void *)(a1 + 40) + 16);
        long long v44 = v52;
        long long v45 = v53;
        long long v46 = v54;
        long long v39 = v47;
        long long v40 = v48;
        long long v41 = v49;
        long long v42 = v50;
        long long v43 = v51;
        v23(v18, v16, v13, v15, v9, v11, v13, v15);
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v55 objects:v59 count:16];
      if (!v3)
      {
LABEL_19:

        break;
      }
    }
  }
  *(void *)&long long v39 = 0;
  *((void *)&v39 + 1) = &v39;
  long long v40 = 0x2020000000uLL;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0;
  *(void *)&long long v47 = 0;
  *((void *)&v47 + 1) = &v47;
  *(void *)&long long v48 = 0x4010000000;
  *((void *)&v48 + 1) = "";
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v24 = *(void *)(a1 + 64);
  long long v49 = *(_OWORD *)(*(void *)(v24 + 8) + 32);
  long long v50 = *(unint64_t *)(*(void *)(v24 + 8) + 48);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_11;
  aBlock[3] = &unk_1E59D3190;
  long long v33 = v38;
  uint64_t v34 = &v39;
  char v37 = *(unsigned char *)(a1 + 202);
  uint64_t v35 = v24;
  v36 = &v47;
  id v31 = *(id *)(a1 + 40);
  id v32 = *(id *)(a1 + 48);
  int v25 = _Block_copy(aBlock);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  double v26 = *(double *)(*((void *)&v47 + 1) + 40);
  double v27 = *(double *)(*((void *)&v47 + 1) + 56);
  double v28 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(&v39, 8);
  return v26 + v27 - v28;
}

void __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_11(uint64_t a1, void *a2, uint64_t a3, int a4, void *a5, double a6, double a7)
{
  id v13 = a2;
  double v14 = a5;
  if (!a4 || a3)
  {
    if (a3) {
      uint64_t v15 = *(void *)(a1 + 48);
    }
    else {
      uint64_t v15 = *(void *)(a1 + 56);
    }
    v16.n128_f64[0] = exp(fmin((double)*(unint64_t *)(*(void *)(v15 + 8) + 24) * 0.5, 1.0) * -0.0896074712);
    if (*(unsigned char *)(a1 + 80)) {
      double v19 = v16.n128_f64[0] * 0.5;
    }
    else {
      double v19 = v16.n128_f64[0];
    }
    v16.n128_f64[0] = a6 * v19;
    v17.n128_f64[0] = a7 * v19;
    PKSizeRoundToPixel(v16, v17, v18);
    double v22 = v21;
    double v23 = v20;
    if (a3 && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      double v24 = *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)
    }
          + *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 56)
          + 8.0
          - v20;
    else {
      double v24 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    }
    PKFloatRoundToPixel();
    double v26 = v25;
    if (!a4)
    {
      memset(&v31, 0, sizeof(v31));
      CATransform3DMakeScale(&v31, v19, v19, 1.0);
      (*(void (**)(double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double))(*(void *)(a1 + 32) + 16))(v26, v24, v22, v23, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a6, a7, v31.m11, v31.m12, v31.m13, v31.m14, v31.m21, v31.m22, v31.m23, v31.m24, v31.m31, v31.m32, v31.m33,
        v31.m34,
        v31.m41,
        v31.m42,
        v31.m43,
        v31.m44);
      uint64_t v27 = *(void *)(a1 + 40);
      v28.n128_u64[0] = 0;
      if (!*(unsigned char *)(a1 + 80) && a3) {
        v28.n128_f64[0] = exp(fmin((double)*(unint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) * 0.5, 1.0)* -0.693147181);
      }
      (*(void (**)(uint64_t, id, uint64_t, __n128))(v27 + 16))(v27, v13, a3, v28);
      v29.n128_u64[0] = 0x4020AAAAAAAAAAABLL;
      if (!*(unsigned char *)(a1 + 80)) {
        v29.n128_f64[0] = 0.0;
      }
      v14[2](v14, v29);
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (a3)
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      long long v30 = *(double **)(*(void *)(a1 + 72) + 8);
      v30[4] = v26;
      v30[5] = v24;
      v30[6] = v22;
      v30[7] = v23;
    }
  }
}

double __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_12(uint64_t a1)
{
  PKFloatRoundToPixel();
  uint64_t v3 = v2;
  uint64_t v4 = (long long *)MEMORY[0x1E4F1DB20];
  if (*(unsigned char *)(a1 + 208))
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    double v38 = __Block_byref_object_copy__19;
    *(void *)&long long v39 = __Block_byref_object_dispose__19;
    *((void *)&v39 + 1) = [*(id *)(*(void *)(a1 + 32) + 664) firstObject];
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x2020000000;
    uint64_t v69 = 0;
    uint64_t v60 = 0;
    uint64_t v61 = (double *)&v60;
    uint64_t v62 = 0x4010000000;
    BOOL v63 = "";
    long long v5 = v4[1];
    long long v64 = *v4;
    long long v65 = v5;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_94;
    aBlock[3] = &unk_1E59D3208;
    long long v47 = &v60;
    id v6 = *(id *)(a1 + 40);
    long long v54 = *(_OWORD *)(a1 + 136);
    long long v55 = *(_OWORD *)(a1 + 152);
    long long v56 = *(_OWORD *)(a1 + 168);
    long long v57 = *(_OWORD *)(a1 + 184);
    long long v50 = *(_OWORD *)(a1 + 72);
    long long v51 = *(_OWORD *)(a1 + 88);
    long long v52 = *(_OWORD *)(a1 + 104);
    long long v53 = *(_OWORD *)(a1 + 120);
    uint64_t v58 = v3;
    long long v48 = &v35;
    long long v49 = &v66;
    uint64_t v59 = *(void *)(a1 + 200);
    void aBlock[4] = *(void *)(a1 + 32);
    id v46 = v6;
    id v7 = _Block_copy(aBlock);

    _Block_object_dispose(&v60, 8);
    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(&v35, 8);
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  uint64_t v69 = 0;
  uint64_t v41 = 0;
  long long v42 = (double *)&v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v44 = *(void *)(*(void *)(v8 + 8) + 40);
  uint64_t v60 = 0;
  uint64_t v61 = (double *)&v60;
  uint64_t v62 = 0x4010000000;
  BOOL v63 = "";
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v9 = *(void *)(v8 + 8);
  long long v64 = *(_OWORD *)(v9 + 32);
  long long v65 = *(unint64_t *)(v9 + 48);
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x4010000000;
  double v38 = (uint64_t (*)(uint64_t, uint64_t))"";
  long long v10 = v4[1];
  long long v39 = *v4;
  long long v40 = v10;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_3_100;
  v17[3] = &unk_1E59D3230;
  double v21 = &v41;
  uint64_t v22 = v8;
  id v18 = *(id *)(a1 + 40);
  id v19 = *(id *)(a1 + 48);
  double v23 = &v66;
  double v24 = &v60;
  double v25 = &v35;
  id v11 = v7;
  id v20 = v11;
  uint64_t v26 = v3;
  long long v31 = *(_OWORD *)(a1 + 136);
  long long v32 = *(_OWORD *)(a1 + 152);
  long long v33 = *(_OWORD *)(a1 + 168);
  long long v34 = *(_OWORD *)(a1 + 184);
  long long v27 = *(_OWORD *)(a1 + 72);
  long long v28 = *(_OWORD *)(a1 + 88);
  long long v29 = *(_OWORD *)(a1 + 104);
  long long v30 = *(_OWORD *)(a1 + 120);
  double v12 = _Block_copy(v17);
  (*(void (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v12, v13, v14);
  if (v11) {
    (*((void (**)(id, uint64_t, double, double, double, double))v11 + 2))(v11, -1, *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), v42[3], *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 48), 0.0);
  }
  double v15 = v61[5] + v61[7] - *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v66, 8);

  return v15;
}

void __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_94(uint64_t a1, unint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v41 = 3221225472;
  long long v42 = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_2_95;
  uint64_t v43 = &unk_1E59D31E0;
  long long v39 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v39;
  long long v12 = *(_OWORD *)(a1 + 136);
  long long v13 = *(_OWORD *)(a1 + 168);
  long long v50 = *(_OWORD *)(a1 + 152);
  long long v51 = v13;
  long long v52 = *(_OWORD *)(a1 + 184);
  long long v14 = *(_OWORD *)(a1 + 72);
  long long v44 = v39;
  long long v45 = v14;
  long long v15 = *(_OWORD *)(a1 + 104);
  long long v46 = *(_OWORD *)(a1 + 88);
  long long v47 = v15;
  long long v48 = *(_OWORD *)(a1 + 120);
  long long v49 = v12;
  uint64_t v53 = *(void *)(a1 + 200);
  __n128 v16 = (void (**)(void *, id))_Block_copy(&aBlock);
  if (CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32)))
  {
    v17.n128_f64[0] = a5 * 0.5;
    v18.n128_f64[0] = a6 * 0.5;
    PKSizeRoundToPixel(v17, v18, v19);
    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
    *(void *)(v20 + 48) = v21;
    *(void *)(v20 + 56) = v22;
    PKFloatRoundToPixel();
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = v23;
    PKFloatRoundToPixel();
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v24;
  }
  uint64_t v25 = *(void *)(a1 + 56);
  uint64_t v26 = *(void *)(*(void *)(v25 + 8) + 40);
  if (!v26 || (unint64_t v27 = *(void *)(v26 + 48), v27 >= a2))
  {
    id v28 = 0;
    goto LABEL_32;
  }
  id v28 = 0;
  char v29 = 0;
  do
  {
    if (*(_DWORD *)(v26 + 28) == 1)
    {
      if (!v28)
      {
        id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v25 = *(void *)(a1 + 56);
      }
      objc_msgSend(v28, "addObject:", *(void *)(*(void *)(v25 + 8) + 40), v39, aBlock, v41, v42, v43);
      char v29 = 1;
    }
    unint64_t v30 = ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    unint64_t v31 = *(void *)(a1 + 208);
    if (v30 >= v31)
    {
      long long v32 = 0;
    }
    else
    {
      id v6 = [*(id *)(*(void *)(a1 + 32) + 664) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
      long long v32 = v6;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v32);
    if (v30 < v31) {

    }
    uint64_t v33 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v33)
    {
      unint64_t v34 = *(void *)(v33 + 48);
      BOOL v35 = v27 == v34 || v28 == 0;
      unint64_t v27 = v34;
      if (v35) {
        goto LABEL_22;
      }
    }
    else
    {
      unint64_t v27 = 0;
      if (!v28) {
        goto LABEL_22;
      }
    }
    if (objc_msgSend(v28, "count", v39))
    {
      v16[2](v16, v28);
      [v28 removeAllObjects];
    }
LABEL_22:
    uint64_t v25 = *(void *)(a1 + 56);
    uint64_t v26 = *(void *)(*(void *)(v25 + 8) + 40);
  }
  while (v27 < a2 && v26 != 0);
  if ((v29 & 1) == 0)
  {
LABEL_32:
    uint64_t v37 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v38 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(v37 + 32) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v37 + 48) = v38;
  }
}

void __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_2_95(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if (v8) {
          uint64_t v8 = (void *)v8[4];
        }
        uint64_t v9 = v8;
        [v9 bounds];
        PKFloatRoundToPixel();
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = fmax(v10, *(double *)(*(void *)(*(void *)(a1 + 40)+ 8)+ 56));
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v5);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v11 = v3;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v11);
        }
        __n128 v16 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        if (v16) {
          __n128 v16 = (void *)v16[4];
        }
        __n128 v17 = v16;
        [v17 bounds];
        double v19 = v18;
        double v21 = v20;
        double v23 = v22.n128_f64[0];
        double v25 = v24;
        v26.n128_f64[0] = v22.n128_f64[0] * 0.5;
        v27.n128_f64[0] = v24 * 0.5;
        PKSizeRoundToPixel(v26, v27, v22);
        double v29 = v28;
        double v31 = v30;
        PKFloatRoundToPixel();
        double v33 = v32;
        PKFloatRoundToPixel();
        (*(void (**)(double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double))(*(void *)(a1 + 32) + 16))(v33, v34, v29, v31, v19, v21, v23, v25, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128),
          *(double *)(a1 + 136),
          *(double *)(a1 + 144),
          *(double *)(a1 + 152),
          *(double *)(a1 + 160),
          *(double *)(a1 + 168),
          *(double *)&v35);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v13);
  }

  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 40)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 56)
                                                              + *(double *)(a1 + 176);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = 0;
}

void __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_3_100(uint64_t a1, void *a2, int a3, int a4, void *a5, double a6, double a7)
{
  id v13 = a2;
  uint64_t v14 = a5;
  if (!a3)
  {
    if (a4 != 1) {
      goto LABEL_14;
    }
    if (CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(a1 + 88) + 8) + 32))) {
      double v26 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    }
    else {
      double v26 = *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)
    }
          + *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 56)
          + *(double *)(a1 + 96);
    v23.n128_f64[0] = a6 * 0.5;
    v24.n128_f64[0] = a7 * 0.5;
    PKSizeRoundToPixel(v23, v24, v25);
    double v28 = v27;
    double v30 = v29;
    PKFloatRoundToPixel();
    double v32 = v31;
    (*(void (**)(double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double))(*(void *)(a1 + 32) + 16))(v31, v26, v28, v30, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a6, a7, *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160), *(double *)(a1 + 168), *(double *)(a1 + 176), *(double *)(a1 + 184),
      *(double *)(a1 + 192),
      *(double *)(a1 + 200),
      *(double *)(a1 + 208),
      *(double *)(a1 + 216),
      *(double *)(a1 + 224));
    (*(void (**)(double))(*(void *)(a1 + 40) + 16))(0.0);
    double v33 = *(double **)(*(void *)(a1 + 88) + 8);
    v33[4] = v32;
    v33[5] = v26;
    v33[6] = v28;
    v33[7] = v30;
    v20.n128_u64[0] = 0x4020AAAAAAAAAAABLL;
LABEL_13:
    v14[2](v14, v20);
    goto LABEL_14;
  }
  double v15 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  PKFloatRoundToPixel();
  double v17 = v16;
  if (a4 == 1)
  {
    (*(void (**)(double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double))(*(void *)(a1 + 32) + 16))(v16, v15, a6, a7, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a6, a7, *MEMORY[0x1E4F39B10], *(double *)(MEMORY[0x1E4F39B10] + 8), *(double *)(MEMORY[0x1E4F39B10] + 16), *(double *)(MEMORY[0x1E4F39B10] + 24), *(double *)(MEMORY[0x1E4F39B10] + 32), *(double *)(MEMORY[0x1E4F39B10] + 40), *(double *)(MEMORY[0x1E4F39B10] + 48), *(double *)(MEMORY[0x1E4F39B10] + 56), *(double *)(MEMORY[0x1E4F39B10] + 64), *(double *)(MEMORY[0x1E4F39B10] + 72), *(double *)(MEMORY[0x1E4F39B10] + 80),
      *(double *)(MEMORY[0x1E4F39B10] + 88),
      *(double *)(MEMORY[0x1E4F39B10] + 96),
      *(double *)(MEMORY[0x1E4F39B10] + 104),
      *(double *)(MEMORY[0x1E4F39B10] + 112),
      *(double *)(MEMORY[0x1E4F39B10] + 120));
    (*(void (**)(double))(*(void *)(a1 + 40) + 16))(1.0);
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a7
                                                              + 8.0
                                                              + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24);
  double v18 = *(double **)(*(void *)(a1 + 80) + 8);
  v18[4] = v17;
  v18[5] = v15;
  v18[6] = a6;
  v18[7] = a7;
  uint64_t v19 = *(void *)(*(void *)(a1 + 88) + 8);
  __n128 v20 = *(__n128 *)MEMORY[0x1E4F1DB20];
  long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *(_OWORD *)(v19 + 32) = *MEMORY[0x1E4F1DB20];
  *(_OWORD *)(v19 + 48) = v21;
  uint64_t v22 = *(void *)(a1 + 48);
  if (v22) {
    (*(void (**)(uint64_t, void, double, double, double, double))(v22 + 16))(v22, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), v17, v15, a6, a7);
  }
  v20.n128_u64[0] = 0;
  if (a4 == 1) {
    goto LABEL_13;
  }
LABEL_14:
}

- (void)layoutIfNeededAnimated:(BOOL)a3
{
}

- (void)layoutSubviews
{
  self->_inLayout = 1;
  v8.receiver = self;
  v8.super_class = (Class)PKApplicationMessageView;
  [(PKApplicationMessageView *)&v8 layoutSubviews];
  unsigned int IsAnimated = PKCATrackedLayoutIsAnimated();
  [(PKApplicationMessageView *)self bounds];
  -[PKApplicationMessageView _layoutWithContext:bounds:]((uint64_t)self, IsAnimated | 0x100000000, v4, v5, v6, v7);
  self->_inLayout = 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (!-[PKApplicationMessageView pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    double v17 = 0;
    goto LABEL_17;
  }
  uint64_t v8 = [(PKApplicationMessageNode *)self->_content context];
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    if (!*(unsigned char *)(v8 + 8))
    {
      uint64_t v10 = *(void *)(v8 + 32);
      if ((unint64_t)([*(id *)(v8 + 16) numberOfChildren] + v10) >= 2)
      {
        double v17 = self;
        goto LABEL_16;
      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)PKApplicationMessageView;
  -[PKApplicationMessageView hitTest:withEvent:](&v19, sel_hitTest_withEvent_, v7, x, y);
  id v11 = (PKApplicationMessageContentView *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  if (v11)
  {
    if (v11 != (PKApplicationMessageContentView *)self)
    {
      id v13 = (PKApplicationMessageView *)v11;
      if (v11 != self->_messageView) {
        goto LABEL_15;
      }
    }
    message = self->_message;
    if (message)
    {
      double v15 = [(PKApplicationMessage *)message content];
      double v16 = [v15 action];
      if (v16) {
        id v13 = self;
      }
      else {
        id v13 = 0;
      }

      goto LABEL_15;
    }
  }
  id v13 = 0;
LABEL_15:
  double v17 = v13;

LABEL_16:
LABEL_17:

  return v17;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"filters.highlightFilter.inputColor"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKApplicationMessageView;
    BOOL v5 = [(PKApplicationMessageView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKApplicationMessageView;
  [(PKApplicationMessageView *)&v13 traitCollectionDidChange:v4];
  if (!v4) {
    goto LABEL_3;
  }
  BOOL v5 = [v4 preferredContentSizeCategory];
  CGFloat v6 = [(PKApplicationMessageView *)self traitCollection];
  objc_super v7 = [v6 preferredContentSizeCategory];
  NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v5, v7);

  if (v8)
  {
LABEL_3:
    if (self)
    {
      uint64_t v9 = self;
      p_reloadQueued = &v9->_reloadQueued;
      if (!v9->_reloadQueued)
      {
        while (1)
        {
          BOOL *p_reloadQueued = 1;
          parent = v9->_parent;
          if (!parent) {
            break;
          }
          uint64_t v12 = parent;

          p_reloadQueued = &v12->_reloadQueued;
          uint64_t v9 = v12;
          if (v12->_reloadQueued) {
            goto LABEL_10;
          }
        }
        v9->_reloadQueuedIsRoot = 1;
        objc_initWeak(&location, v9);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __40__PKApplicationMessageView__queueReload__block_invoke;
        block[3] = &unk_1E59CA7F8;
        objc_copyWeak(&v15, &location);
        dispatch_async(MEMORY[0x1E4F14428], block);
        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }
      uint64_t v12 = v9;
LABEL_10:
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKApplicationMessageView;
  -[PKApplicationMessageView setEnabled:](&v5, sel_setEnabled_);
  if (self->_enabled != v3)
  {
    self->_enabled = v3;
    -[PKApplicationMessageView _updateHighlightAnimated:]((uint64_t)self, 1);
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKApplicationMessageView;
  -[PKApplicationMessageView setSelected:](&v5, sel_setSelected_);
  if (self->_selected != v3)
  {
    self->_selected = v3;
    -[PKApplicationMessageView _updateHighlightAnimated:]((uint64_t)self, 1);
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKApplicationMessageView;
  -[PKApplicationMessageView setHighlighted:](&v5, sel_setHighlighted_);
  if (self->_highlighted != v3)
  {
    self->_highlighted = v3;
    -[PKApplicationMessageView _updateHighlightAnimated:]((uint64_t)self, 1);
  }
}

- (void)_rootView
{
  id v1 = a1;
  uint64_t v2 = v1;
  BOOL v3 = (void *)*((void *)v1 + 57);
  if (!v3) {
    return v1;
  }
  do
  {
    id v4 = v3;

    BOOL v3 = (void *)v4[57];
    uint64_t v2 = v4;
  }
  while (v3);
  return v4;
}

- (PKApplicationMessageNode)content
{
  return self->_content;
}

- (void)setContent:(id)a3 animated:(BOOL)a4
{
  CGFloat v6 = (PKApplicationMessageNode *)a3;
  objc_super v7 = v6;
  if (self->_content != v6 && !self->_invalidated)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __48__PKApplicationMessageView_setContent_animated___block_invoke;
    uint64_t v12 = &unk_1E59D3280;
    objc_super v13 = self;
    uint64_t v14 = v6;
    -[PKApplicationMessageView _treeLayoutWithContext:block:](self, a4, &v9);
    if ([(PKApplicationMessageView *)self needsRemoval])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained applicationMessageViewNeedsRemoval:self];
    }
  }
}

void __48__PKApplicationMessageView_setContent_animated___block_invoke(uint64_t a1)
{
}

- (void)_setContent:(unsigned int)a3 type:(uint64_t)a4 depth:
{
  id v8 = a2;
  if (a1 && !*(unsigned char *)(a1 + 608))
  {
    id v20 = v8;
    uint64_t v9 = (void *)MEMORY[0x1A6224460]();
    id v10 = *(id *)(a1 + 472);
    if (v10 == v20)
    {
LABEL_24:
      -[PKApplicationMessageView _updateSubviewsWithType:depth:](a1, a3, a4);
      id v8 = v20;
      goto LABEL_25;
    }
    id v11 = v10;
    objc_storeStrong((id *)(a1 + 472), a2);
    uint64_t v12 = *(void **)(a1 + 472);
    if (v12)
    {
      uint64_t v13 = [v12 type];
      uint64_t v14 = *(void *)(a1 + 744);
      if (v14 != v13) {
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"PKApplicationMessageView: content type %ld does not match expected type %ld.", v13, v14);
      }
    }
    if (*(void *)(a1 + 744) || (double v16 = *(void **)(a1 + 472)) == 0)
    {
      id v15 = 0;
    }
    else
    {
      id v15 = [v16 message];
    }
    objc_storeStrong((id *)(a1 + 480), v15);
    if (*(void *)(a1 + 744) == 2)
    {
      if (v11)
      {
        double v17 = [v11 context];
        [v11 setContext:0];
        double v18 = *(void **)(a1 + 472);
        if (v18)
        {
          if (v17)
          {
            -[PKApplicationMessageViewContext setNode:]((uint64_t)v17, v18);
LABEL_19:
            [*(id *)(a1 + 472) setContext:v17];
LABEL_22:

            goto LABEL_23;
          }
LABEL_17:
          objc_super v19 = -[PKApplicationMessageViewContext initForNode:]([PKApplicationMessageViewContext alloc], *(void **)(a1 + 472));
          double v17 = v19;
          if (v19) {
            v19[3] = a1;
          }
          goto LABEL_19;
        }
        if (v17)
        {
          v17[3] = 0;
          goto LABEL_22;
        }
      }
      else if (*(void *)(a1 + 472))
      {
        goto LABEL_17;
      }
    }
LABEL_23:

    goto LABEL_24;
  }
LABEL_25:
}

- (void)_treeLayoutWithContext:(void *)a3 block:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (a1)
  {
    if (!v4) {
      __break(1u);
    }
    id v15 = v4;
    context = (void *)MEMORY[0x1A6224460]();
    objc_super v5 = -[PKApplicationMessageView _rootView](a1);
    uint64_t v6 = (uint64_t)v5;
    if (*((unsigned char *)v5 + 488))
    {
      v15[2](v15, a2);
    }
    else
    {
      *((unsigned char *)v5 + 488) = 1;
      if (v5[59])
      {
        -[PKApplicationMessageView _visitPostOrder:]((uint64_t)v5, &__block_literal_global_118);
      }
      else
      {
        *((_DWORD *)v5 + 125) = 0;
        *((_DWORD *)v5 + 123) = 0;
        *((unsigned char *)v5 + 496) = 0;
      }
      v15[2](v15, a2);
      -[PKApplicationMessageView _visitPostOrder:](v6, &__block_literal_global_120);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_2;
      v28[3] = &__block_descriptor_33_e42_v32__0__PKApplicationMessageView_8_B16_B24l;
      unsigned __int8 v29 = a2;
      -[PKApplicationMessageView _visitPreOrder:](v6, v28);
      -[PKApplicationMessageView _visitPreOrder:](v6, &__block_literal_global_124);
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_4;
      v26[3] = &unk_1E59D3358;
      id v8 = v7;
      id v27 = v8;
      -[PKApplicationMessageView _visitPreOrder:](v6, v26);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      obuint64_t j = v8;
      uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            v21[0] = 0;
            v21[1] = v21;
            v21[2] = 0x2020000000;
            v21[3] = 0;
            v20[0] = 0;
            v20[1] = v20;
            v20[2] = 0x2020000000;
            v20[3] = 0;
            v19[0] = MEMORY[0x1E4F143A8];
            v19[1] = 3221225472;
            v19[2] = __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_5;
            v19[3] = &unk_1E59D3380;
            v19[4] = v21;
            v19[5] = v20;
            -[PKApplicationMessageView _visitPreOrder:](v12, v19);
            v18[0] = MEMORY[0x1E4F143A8];
            v18[1] = 3221225472;
            v18[2] = __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_6;
            v18[3] = &unk_1E59D3380;
            v18[4] = v21;
            v18[5] = v20;
            -[PKApplicationMessageView _visitPreOrder:](v12, v18);
            _Block_object_dispose(v20, 8);
            _Block_object_dispose(v21, 8);
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
        }
        while (v9);
      }

      if (a2)
      {
        -[PKApplicationMessageView _visitPreOrder:](v6, &__block_literal_global_126);
        -[PKApplicationMessageView _visitPreOrder:](v6, &__block_literal_global_128);
      }
      [(id)v6 layoutIfNeededAnimated:a2 & 1];
      *(unsigned char *)(v6 + 488) = 0;
      id WeakRetained = objc_loadWeakRetained((id *)(v6 + 736));
      [WeakRetained applicationMessageViewNeedsSizeUpdate:v6];
    }
    id v4 = v15;
  }
}

- (void)collapse
{
  if (!self->_invalidated)
  {
    uint64_t v5 = 0;
    uint64_t v6 = &v5;
    uint64_t v7 = 0x2020000000;
    char v8 = 0;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __36__PKApplicationMessageView_collapse__block_invoke;
    v4[3] = &unk_1E59D32A8;
    v4[4] = &v5;
    -[PKApplicationMessageView _visitPostOrder:]((uint64_t)self, v4);
    if (*((unsigned char *)v6 + 24))
    {
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __36__PKApplicationMessageView_collapse__block_invoke_2;
      v3[3] = &unk_1E59D32F0;
      v3[4] = self;
      -[PKApplicationMessageView _treeLayoutWithContext:block:](self, 1u, v3);
    }
    _Block_object_dispose(&v5, 8);
  }
}

void __36__PKApplicationMessageView_collapse__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = [*(id *)(a2 + 472) context];
  if (v3)
  {
    if (v3[8])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      if (v3[8]) {
        v3[8] = 0;
      }
    }
  }
}

- (void)_visitPostOrder:(uint64_t)a1
{
  BOOL v3 = a2;
  if (!a1) {
    goto LABEL_10;
  }
  context = (void *)MEMORY[0x1A6224460]();
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", a1, 0);
  if (![v4 count]) {
    goto LABEL_9;
  }
  while (1)
  {
    uint64_t v5 = [v4 lastObject];
    uint64_t v6 = (void *)v5;
    if (!*(unsigned char *)(v5 + 464))
    {
      *(unsigned char *)(v5 + 464) = 1;
      if ([*(id *)(v5 + 648) count])
      {
        uint64_t v7 = (void *)v6[81];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __44__PKApplicationMessageView__visitPostOrder___block_invoke;
        v10[3] = &unk_1E59D34A8;
        id v11 = v4;
        [v7 enumerateObjectsWithOptions:2 usingBlock:v10];
      }
      goto LABEL_8;
    }
    [v4 removeLastObject];
    char v9 = 0;
    v3[2](v3, v6, &v9);
    if (v9) {
      break;
    }
LABEL_8:

    if (![v4 count]) {
      goto LABEL_9;
    }
  }

LABEL_9:
  -[PKApplicationMessageView _visitPreOrder:](a1, &__block_literal_global_176);

LABEL_10:
}

void __36__PKApplicationMessageView_collapse__block_invoke_2(uint64_t a1)
{
}

void __36__PKApplicationMessageView_collapse__block_invoke_3(uint64_t a1, uint64_t a2)
{
}

- (void)_updateSubviewsWithType:(uint64_t)a3 depth:
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  if (!a1 || *(unsigned char *)(a1 + 608)) {
    return;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__PKApplicationMessageView__updateSubviewsWithType_depth___block_invoke;
  aBlock[3] = &unk_1E59CC1D0;
  void aBlock[4] = a1;
  v117 = (void (**)(void *, void))_Block_copy(aBlock);
  uint64_t v3 = [*(id *)(a1 + 472) context];
  uint64_t v4 = v3;
  uint64_t v5 = a1;
  uint64_t v6 = *(void *)(a1 + 480);
  if (v6) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = *(void *)(a1 + 640) != 0;
  }
  int v8 = *(_DWORD *)(a1 + 612);
  uint64_t v9 = v6 != 0;
  if (!v3)
  {
    unsigned int v112 = 0;
    *(void *)(a1 + 616) = a3;
    goto LABEL_22;
  }
  if (*(void *)(v3 + 32) != v9)
  {
    *(void *)(v3 + 32) = v9;
    uint64_t v10 = [*(id *)(v3 + 16) numberOfChildren];
    uint64_t v5 = a1;
    if ((unint64_t)(v10 + v9) <= 1) {
      *(unsigned char *)(v4 + 8) = 0;
    }
  }
  if (*(unsigned char *)(v4 + 8))
  {
    *(void *)(v5 + 616) = a3;
  }
  else
  {
    uint64_t v11 = *(void *)(v4 + 32);
    if ((unint64_t)([*(id *)(v4 + 16) numberOfChildren] + v11) <= 1)
    {
      int v15 = *(unsigned __int8 *)(v4 + 8);
      uint64_t v12 = a1;
    }
    else
    {
      uint64_t v12 = a1;
      if (*(unsigned char *)(a1 + 492))
      {
        uint64_t v13 = *(void *)(v4 + 32);
        int v14 = (unint64_t)([*(id *)(v4 + 16) numberOfChildren] + v13) > 1;
        uint64_t v12 = a1;
      }
      else
      {
        int v14 = 0;
      }
      int v15 = *(unsigned __int8 *)(v4 + 8);
      if (v15 != v14)
      {
        *(unsigned char *)(v4 + 8) = v14;
        int v15 = v14;
      }
    }
    *(void *)(v12 + 616) = a3;
    if (!v15)
    {
      uint64_t v83 = *(void *)(v4 + 32);
      BOOL v16 = (unint64_t)([*(id *)(v4 + 16) numberOfChildren] + v83) < 2;
      goto LABEL_21;
    }
  }
  BOOL v16 = 1;
LABEL_21:
  unsigned int v112 = !v16;
LABEL_22:
  v115 = (id *)(id)v4;
  self;
  if (!v4) {
    goto LABEL_26;
  }
  double v17 = v115;
  if (*((unsigned char *)v115 + 8))
  {
    int v18 = 1;
    goto LABEL_27;
  }
  id v19 = v115[4];
  if ((unint64_t)v19 + [v115[2] numberOfChildren] <= 1)
  {
    double v17 = v115;
    int v18 = *((unsigned __int8 *)v115 + 8);
  }
  else
  {
LABEL_26:
    int v18 = 0;
    double v17 = v115;
  }
LABEL_27:

  *(_DWORD *)(a1 + 612) = v18;
  if (v8)
  {
    if (v8 != 1)
    {
      int v20 = *(_DWORD *)(a1 + 612);
      goto LABEL_34;
    }
    int v121 = *(_DWORD *)(a1 + 612);
    if (!v121)
    {
LABEL_32:
      int v20 = a2 == 0;
LABEL_34:
      int v121 = v20;
    }
  }
  else
  {
    int v121 = *(_DWORD *)(a1 + 612);
    if (v121 == 1) {
      goto LABEL_32;
    }
  }
  uint64_t v21 = [*(id *)(a1 + 472) children];
  long long v22 = (void *)v21;
  long long v23 = (void *)MEMORY[0x1E4F1CBF0];
  if (v21) {
    long long v23 = (void *)v21;
  }
  id v24 = v23;

  if (*(_DWORD *)(a1 + 612)) {
    goto LABEL_49;
  }
  uint64_t v25 = *(void *)(a1 + 616);
  uint64_t v26 = 3;
  if (v25) {
    uint64_t v26 = 1;
  }
  uint64_t v27 = v26 - v9;
  BOOL v28 = !v25 || v6 == 0;
  unint64_t v29 = v28 ? v27 : 0;
  if ([v24 count] <= v29)
  {
LABEL_49:
    CGFloat v119 = v24;
  }
  else
  {
    if (v29)
    {
      CGFloat v119 = objc_msgSend(v24, "subarrayWithRange:", 0, v29);
    }
    else
    {
      CGFloat v119 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  id v120 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v30 = a1;
  uint64_t v31 = *(void *)(a1 + 640);
  if (v6)
  {
    if (!v31)
    {
      double v32 = [PKApplicationMessageContentView alloc];
      uint64_t v33 = *(void *)(a1 + 728);
      if (v33) {
        double v34 = *(double *)(v33 + 8);
      }
      else {
        double v34 = 0.0;
      }
      uint64_t v35 = -[PKApplicationMessageContentView initWithWidth:](v32, v34);
      long long v36 = *(void **)(a1 + 640);
      *(void *)(a1 + 640) = v35;

      uint64_t v37 = *(void *)(a1 + 640);
      if (v37)
      {
        objc_storeWeak((id *)(v37 + 600), (id)a1);
        long long v38 = *(void **)(a1 + 640);
      }
      else
      {
        long long v38 = 0;
      }
      long long v39 = [v38 layer];
      objc_msgSend(v39, "setAnchorPoint:", 0.5, 0.0);

      v117[2](v117, *(void *)(a1 + 640));
      uint64_t v30 = a1;
      *(unsigned char *)(a1 + 585) = 0;
      *(_DWORD *)(a1 + 588) = v121;
      *(_OWORD *)(a1 + 592) = *MEMORY[0x1E4F1DB30];
    }
  }
  else if (v31)
  {
    long long v40 = [PKApplicationMessageView_RemovedSubviewContainer alloc];
    if (v40) {
      long long v41 = -[PKApplicationMessageView_RemovedSubviewContainer initWithView:index:layoutMode:commitAnimation:]((id *)&v40->super.isa, *(void **)(a1 + 640), 0, v121, 0);
    }
    else {
      long long v41 = 0;
    }
    [v120 addObject:v41];

    long long v42 = *(id **)(a1 + 640);
    if (v42)
    {
      objc_storeWeak(v42 + 75, 0);
      uint64_t v43 = a1;
      long long v42 = *(id **)(a1 + 640);
    }
    else
    {
      uint64_t v43 = a1;
    }
    *(void *)(v43 + 640) = 0;

    uint64_t v30 = a1;
  }
  long long v44 = [v119 differenceFromArray:*(void *)(v30 + 648) withOptions:0 usingEquivalenceTest:&__block_literal_global_139];
  v46 = (!v4 || (uint64_t v45 = (char *)v115[4], !&v45[[v115[2] numberOfChildren]]))
     && *(void *)(a1 + 456) == 0;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v122 = v44;
  uint64_t v47 = [v122 countByEnumeratingWithState:&v127 objects:v148 count:16];
  if (v47)
  {
    uint64_t v48 = *(void *)v128;
    BOOL v49 = v7;
    do
    {
      uint64_t v50 = 0;
      do
      {
        if (*(void *)v128 != v48) {
          objc_enumerationMutation(v122);
        }
        long long v51 = *(void **)(*((void *)&v127 + 1) + 8 * v50);
        uint64_t v52 = [v51 index];
        uint64_t v53 = [v51 changeType];
        if (v53 == 1)
        {
          long long v54 = [v51 object];
          [*(id *)(a1 + 648) removeObjectAtIndex:v52];
          uint64_t v55 = [v54 context];
          long long v56 = (void *)v55;
          if (v55) {
            long long v57 = *(void **)(v55 + 24);
          }
          else {
            long long v57 = 0;
          }
          id v58 = v57;
          -[PKApplicationMessageView _invalidate]((uint64_t)v58);
          uint64_t v59 = [PKApplicationMessageView_RemovedSubviewContainer alloc];
          v125[0] = MEMORY[0x1E4F143A8];
          v125[1] = 3221225472;
          v125[2] = __58__PKApplicationMessageView__updateSubviewsWithType_depth___block_invoke_3;
          v125[3] = &__block_descriptor_33_e67_v24__0__PKApplicationMessageView_RemovedSubviewContainer_8___v___16l;
          BOOL v126 = v46;
          uint64_t v60 = -[PKApplicationMessageView_RemovedSubviewContainer initWithView:index:layoutMode:commitAnimation:]((id *)&v59->super.isa, v58, (void *)(v52 + v49), v121, v125);

          [v120 addObject:v60];
        }
        else
        {
          if (v53) {
            goto LABEL_79;
          }
          long long v54 = [v51 object];
          [*(id *)(a1 + 648) insertObject:v54 atIndex:v52];
        }

LABEL_79:
        ++v50;
      }
      while (v47 != v50);
      uint64_t v61 = [v122 countByEnumeratingWithState:&v127 objects:v148 count:16];
      uint64_t v47 = v61;
    }
    while (v61);
  }

  if ([v120 count])
  {
    id v62 = v120;
    BOOL v63 = v62;
    if (!*(unsigned char *)(a1 + 608) && [v62 count])
    {
      uint64_t v144 = 0;
      v145 = &v144;
      uint64_t v146 = 0x2020000000;
      uint64_t v147 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v138 = 0;
      v139 = &v138;
      uint64_t v140 = 0x3032000000;
      v141 = __Block_byref_object_copy__19;
      v142 = __Block_byref_object_dispose__19;
      id v143 = [v63 objectEnumerator];
      uint64_t v132 = MEMORY[0x1E4F143A8];
      uint64_t v133 = 3221225472;
      uint64_t v134 = (uint64_t)__59__PKApplicationMessageView__stageRemovedSubviewContainers___block_invoke;
      CGRect v135 = &unk_1E59D3410;
      v136 = &v138;
      v137 = &v144;
      long long v64 = (void (**)(void))_Block_copy(&v132);
      [v63 sortUsingComparator:&__block_literal_global_146];
      v64[2](v64);
      uint64_t v116 = [*(id *)(a1 + 656) objectEnumerator];
      long long v65 = 0;
      unint64_t v66 = 0;
      while (1)
      {
        uint64_t v67 = [v116 nextObject];

        if (!v67) {
          break;
        }
        unint64_t v68 = *(void *)(v67 + 40);
        while (1)
        {
          unint64_t v69 = v145[3];
          BOOL v70 = v69 == 0x7FFFFFFFFFFFFFFFLL || v69 >= v68;
          if (v70) {
            break;
          }
          ++v66;
          v64[2](v64);
        }
        unint64_t v71 = *(void *)(v67 + 40);
        long long v65 = (void *)v67;
        if (v71)
        {
          BOOL v70 = v71 >= v66;
          unint64_t v72 = v71 - v66;
          if (!v70) {
            unint64_t v72 = 0;
          }
          *(void *)(v67 + 40) = v72;
          long long v65 = (void *)v67;
        }
      }
      unint64_t v73 = [v63 count];
      unint64_t v74 = [*(id *)(a1 + 656) count];
      if (v74)
      {
        unint64_t v75 = 0;
        unint64_t v76 = 0;
        do
        {
          uint64_t v77 = [*(id *)(a1 + 656) objectAtIndexedSubscript:v75];
          v78 = (void *)v77;
          if (v77) {
            unint64_t v79 = *(void *)(v77 + 40);
          }
          else {
            unint64_t v79 = 0;
          }
          if (v76 < v73)
          {
            unint64_t v80 = v75 + v73 - v76;
            while (1)
            {
              double v81 = [v63 objectAtIndexedSubscript:v76];
              CGFloat v82 = v81;
              if (v81)
              {
                if (v81[5] > v79) {
                  break;
                }
              }
              [*(id *)(a1 + 656) insertObject:v81 atIndex:v75];

              ++v75;
              if (v73 == ++v76)
              {
                unint64_t v76 = v73;
                unint64_t v75 = v80;
                goto LABEL_109;
              }
            }
          }
LABEL_109:

          ++v75;
        }
        while (v75 < v74);
      }
      else
      {
        unint64_t v76 = 0;
      }
      if (v76 < v73)
      {
        do
        {
          v84 = [v63 objectAtIndexedSubscript:v76];
          [*(id *)(a1 + 656) addObject:v84];

          ++v76;
        }
        while (v73 != v76);
      }
      [v63 sortUsingComparator:&__block_literal_global_148];
      uint64_t v85 = [*(id *)(a1 + 664) count];
      if (v85)
      {
        unint64_t v114 = v85;
        unint64_t v86 = 0;
        unint64_t v87 = 0;
        do
        {
          uint64_t v88 = [*(id *)(a1 + 664) objectAtIndexedSubscript:v86];
          v89 = (void *)v88;
          if (v88) {
            unint64_t v90 = *(void *)(v88 + 48);
          }
          else {
            unint64_t v90 = 0;
          }
          if (v87 < v73)
          {
            unint64_t v91 = v86 + v73 - v87;
            while (1)
            {
              BOOL v92 = [v63 objectAtIndexedSubscript:v87];
              v93 = v92;
              if (v92)
              {
                if (v92[6] > v90) {
                  break;
                }
              }
              [*(id *)(a1 + 664) insertObject:v92 atIndex:v86];

              ++v86;
              if (v73 == ++v87)
              {
                unint64_t v87 = v73;
                unint64_t v86 = v91;
                goto LABEL_130;
              }
            }
          }
LABEL_130:

          ++v86;
        }
        while (v86 < v114);
      }
      else
      {
        unint64_t v87 = 0;
      }
      if (v87 < v73)
      {
        do
        {
          id v94 = [v63 objectAtIndexedSubscript:v87];
          [*(id *)(a1 + 664) addObject:v94];

          ++v87;
        }
        while (v73 != v87);
      }
      id v95 = *(void **)(a1 + 504);
      if (!v95)
      {
        id v96 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v97 = *(void **)(a1 + 504);
        *(void *)(a1 + 504) = v96;

        id v95 = *(void **)(a1 + 504);
      }
      [v95 addObjectsFromArray:v63];

      _Block_object_dispose(&v138, 8);
      _Block_object_dispose(&v144, 8);
    }
  }
  uint64_t v98 = [*(id *)(a1 + 656) count];
  if (v98)
  {
    uint64_t v138 = 0;
    v139 = &v138;
    uint64_t v140 = 0x3032000000;
    v141 = __Block_byref_object_copy__19;
    v142 = __Block_byref_object_dispose__19;
    id v143 = [*(id *)(a1 + 656) lastObject];
    uint64_t v132 = 0;
    uint64_t v133 = (uint64_t)&v132;
    uint64_t v134 = 0x2020000000;
    CGRect v135 = 0;
    v124[0] = MEMORY[0x1E4F143A8];
    v124[1] = 3221225472;
    v124[2] = __58__PKApplicationMessageView__updateSubviewsWithType_depth___block_invoke_5;
    v124[3] = &unk_1E59D33E8;
    v124[4] = a1;
    v124[5] = &v138;
    v124[6] = &v132;
    v124[7] = v98;
    long long v99 = (void (**)(void *, unint64_t, void))_Block_copy(v124);
    _Block_object_dispose(&v132, 8);
    _Block_object_dispose(&v138, 8);
  }
  else
  {
    long long v99 = 0;
  }
  unint64_t v100 = [v119 count];
  unint64_t v101 = [*(id *)(a1 + 648) count];
  if (v101 < v100) {
    unint64_t v100 = v101;
  }
  if (v99)
  {
    if (*(void *)(a1 + 640)) {
      unint64_t v102 = v101 + 1;
    }
    else {
      unint64_t v102 = v101;
    }
    v99[2](v99, v102, 0);
  }
  uint64_t v103 = a1;
  if (v100)
  {
    for (unint64_t i = v100 - 1; i != -1; --i)
    {
      long long v105 = [*(id *)(v103 + 648) objectAtIndexedSubscript:i];
      BOOL v106 = [v119 objectAtIndexedSubscript:i];
      uint64_t v107 = [v105 context];
      BOOL v108 = (void *)v107;
      if (v105 == v106)
      {
        if (v107)
        {
          id v110 = *(id *)(v107 + 24);
          if (v110) {
            goto LABEL_159;
          }
        }
        else
        {
          BOOL v108 = -[PKApplicationMessageViewContext initForNode:]([PKApplicationMessageViewContext alloc], v105);
          [v105 setContext:v108];
        }
      }
      else
      {
        if (v107) {
          v109 = *(void **)(v107 + 24);
        }
        else {
          v109 = 0;
        }
        id v110 = v109;
        -[PKApplicationMessageViewContext setNode:]((uint64_t)v108, v106);
        [v106 setContext:v108];
        [*(id *)(a1 + 648) replaceObjectAtIndex:i withObject:v106];
        if (v110)
        {
LABEL_159:
          [(id)a1 bringSubviewToFront:v110];
LABEL_163:

          goto LABEL_164;
        }
      }
      id v110 = (void *)-[PKApplicationMessageView _initWithType:configuration:]((uint64_t)[PKApplicationMessageView alloc], [v106 type], *(void **)(a1 + 728));
      v110[57] = a1;
      *((_DWORD *)v110 + 125) = v121;
      ((void (**)(void *, void *))v117)[2](v117, v110);
      if (v108)
      {
        v108[3] = v110;
        goto LABEL_163;
      }
LABEL_164:
      if (v99)
      {
        if (*(void *)(a1 + 640)) {
          unint64_t v111 = i + 1;
        }
        else {
          unint64_t v111 = i;
        }
        ((void (**)(void *, unint64_t, void *))v99)[2](v99, v111, v110);
      }
      -[PKApplicationMessageView _setContent:type:depth:](v110, v106, a2, a3 + v112);

      uint64_t v103 = a1;
    }
  }
  if (*(void *)(v103 + 640))
  {
    objc_msgSend((id)v103, "bringSubviewToFront:");
    uint64_t v103 = a1;
    if (v99)
    {
      v99[2](v99, 0, *(void *)(a1 + 640));
      uint64_t v103 = a1;
    }
  }
  -[PKApplicationMessageView _invalidateSize]((void *)v103);
}

void __58__PKApplicationMessageView__treeLayoutPreludeWithContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  uint64_t v3 = (void *)*((void *)v2 + 59);
  if (v3
    && ([v3 context], (uint64_t v4 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue()) != 0)
    && (int v5 = v4[8], v4, v5))
  {
    char v6 = 1;
  }
  else
  {
    BOOL v7 = (void *)*((void *)v2 + 81);
    if (v7)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        char v6 = 0;
        uint64_t v11 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "context", (void)v14);
            if (v13) {
              v6 |= *(unsigned char *)(v13[3] + 492) != 0;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v10);
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }
  v2[492] = v6 & 1;
  *(_DWORD *)(v2 + 493) = 0x1000000;
  *((_DWORD *)v2 + 125) = 0;
}

void __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  uint64_t v3 = (void *)v2[59];
  if (v3 && ([v3 context], (uint64_t v4 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v5 = v4[8];
    BOOL v6 = v4[8] != 0;

    uint64_t v7 = v2[80];
    BOOL v8 = v7 != 0;
    if (v5) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
LABEL_31:
      LOBYTE(v8) = 1;
      BOOL v6 = 1;
      goto LABEL_32;
    }
  }
  else
  {
    BOOL v6 = 0;
    BOOL v8 = v2[80] != 0;
  }
  uint64_t v10 = (void *)v2[81];
  if (v10)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (!v12) {
      goto LABEL_29;
    }
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
LABEL_12:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v22 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v15), "context", (void)v21);
      long long v17 = (void *)v16;
      if (v16) {
        break;
      }
LABEL_27:

      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v13) {
          goto LABEL_12;
        }
LABEL_29:

        LOBYTE(v8) = v8;
        goto LABEL_32;
      }
    }
    int v18 = *(id *)(v16 + 24);
    if (v6)
    {
      BOOL v6 = 1;
      if (v8)
      {
LABEL_18:
        int v19 = 1;
        goto LABEL_23;
      }
    }
    else
    {
      BOOL v6 = v18[492] != 0;
      if (v8) {
        goto LABEL_18;
      }
    }
    if (v18[493]) {
      BOOL v8 = 1;
    }
    int v19 = v8;
LABEL_23:
    if (v19) {
      BOOL v20 = v6;
    }
    else {
      BOOL v20 = 0;
    }

    if (v20)
    {

      goto LABEL_31;
    }
    goto LABEL_27;
  }
LABEL_32:
  *((unsigned char *)v2 + 492) = v6;
  *((unsigned char *)v2 + 493) = v8;
}

void __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = (uint64_t)v3;
  if (*(unsigned char *)(a1 + 32))
  {
    id v5 = v3[57];
    BOOL v6 = v5;
    if (v5 && !*((unsigned char *)v5 + 495))
    {
      -[PKApplicationMessageView _markPresented](v4);
      int v7 = 0;
    }
    else
    {
      int v7 = 1;
    }
  }
  else
  {
    -[PKApplicationMessageView _markPresented]((uint64_t)v3);
    int v7 = 1;
  }
  uint64_t v8 = *(void *)(v4 + 472);
  if (v8) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v8) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = v7;
    }
  }
  else
  {
    BOOL v10 = *(unsigned char *)(v4 + 496) != 0;
  }
  *(unsigned char *)(v4 + 495) = v10;
  id v11 = *(void **)(v4 + 648);
  uint64_t v58 = v4;
  if (v11)
  {
    int v12 = *(unsigned __int8 *)(v4 + 494);
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v62 objects:v91 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v63;
      int v16 = v12 != 0;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v63 != v15) {
            objc_enumerationMutation(v13);
          }
          int v18 = objc_msgSend(*(id *)(*((void *)&v62 + 1) + 8 * i), "context", v58);
          if (v18)
          {
            uint64_t v19 = v18[3];
            *(unsigned char *)(v19 + 494) = v16 & 1;
            v16 |= *(unsigned char *)(v19 + 493) != 0;
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v62 objects:v91 count:16];
      }
      while (v14);
    }

    uint64_t v4 = v58;
  }
  if (*(unsigned char *)(a1 + 32)) {
    BOOL v20 = v10;
  }
  else {
    BOOL v20 = 0;
  }
  if (!*(unsigned char *)(v4 + 608))
  {
    BOOL v21 = *(unsigned __int8 *)(v4 + 492) != 0;
    uint64_t v22 = [*(id *)(v4 + 472) context];
    long long v23 = (void *)v22;
    if (v22) {
      BOOL v24 = v21;
    }
    else {
      BOOL v24 = 0;
    }
    if (v24)
    {
      uint64_t v25 = *(void *)(v22 + 32);
      int v26 = (unint64_t)([*(id *)(v22 + 16) numberOfChildren] + v25) > 1;
    }
    else
    {
      int v26 = 0;
    }
    uint64_t v27 = v58;
    if (*(unsigned __int8 *)(v58 + 584) != v26)
    {
      *(unsigned char *)(v58 + 584) = v26;
      if (*(void *)(v58 + 632))
      {
        -[PKApplicationMessageView _invalidateSize]((void *)v58);
        uint64_t v27 = v58;
      }
    }
    BOOL v28 = *(unsigned char **)(v27 + 640);
    if (v28)
    {
      BOOL v29 = v20 && *(unsigned char *)(v27 + 585) != 0;
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __69__PKApplicationMessageView__commitStagedContentAnimated_dismissable___block_invoke;
      v74[3] = &unk_1E59CDA78;
      v74[4] = v27;
      BOOL v75 = v29;
      BOOL v30 = v20 && *(unsigned char *)(v27 + 585) != 0;
      -[PKApplicationMessageContentView performBatchUpdates:animated:](v28, v74, v30);
      uint64_t v31 = v58 + 592;
      uint64_t v32 = *(void *)(v58 + 728);
      double v33 = v32 ? *(double *)(v32 + 8) : 0.0;
      double v35 = *(double *)v31;
      double v34 = *(double *)(v58 + 600);
      objc_msgSend(*(id *)(v58 + 640), "sizeThatFits:", v33, 1.79769313e308, v58);
      *(void *)uint64_t v31 = v36;
      *(void *)(v31 + 8) = v37;
      uint64_t v27 = v58;
      if (v35 != *(double *)(v58 + 592) || v34 != *(double *)(v58 + 600))
      {
        -[PKApplicationMessageView _invalidateSize]((void *)v58);
        uint64_t v27 = v58;
      }
    }
    if (*(void *)(v27 + 504))
    {
      if (v20) {
        long long v38 = dispatch_group_create();
      }
      else {
        long long v38 = 0;
      }
      objc_initWeak(&location, (id)v27);
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      obuint64_t j = *(id *)(v58 + 504);
      uint64_t v39 = [obj countByEnumeratingWithState:&v69 objects:v92 count:16];
      if (v39)
      {
        uint64_t v60 = *(void *)v70;
        long long v40 = (id *)v87;
        do
        {
          for (uint64_t j = 0; j != v39; ++j)
          {
            if (*(void *)v70 != v60) {
              objc_enumerationMutation(obj);
            }
            uint64_t v42 = *(void *)(*((void *)&v69 + 1) + 8 * j);
            if (v38) {
              dispatch_group_enter(v38);
            }
            v66[0] = MEMORY[0x1E4F143A8];
            v66[1] = 3221225472;
            v66[2] = __69__PKApplicationMessageView__commitStagedContentAnimated_dismissable___block_invoke_2;
            v66[3] = &unk_1E59D3458;
            objc_copyWeak(&v68, &location);
            uint64_t v67 = v38;
            uint64_t aBlock = v66;
            if (v42)
            {
              if (*(unsigned char *)(v42 + 24)) {
                __break(1u);
              }
              uint64_t v43 = _Block_copy(aBlock);
              long long v44 = *(void **)(v42 + 16);
              *(void *)(v42 + 16) = v43;

              *(unsigned char *)(v42 + 24) = 1;
              if (v20)
              {
                v89[0] = 0;
                v89[1] = v89;
                v89[2] = 0x2020000000;
                char v90 = 0;
                if (*(void *)(v42 + 8)) {
                  char v45 = 2;
                }
                else {
                  char v45 = 1;
                }
                objc_initWeak(&from, (id)v42);
                BOOL v46 = *(void **)(v42 + 32);
                uint64_t block = MEMORY[0x1E4F143A8];
                uint64_t v83 = 3221225472;
                v84 = __82__PKApplicationMessageView_RemovedSubviewContainer_commitAnimated_withCompletion___block_invoke;
                uint64_t v85 = &unk_1E59D2FC8;
                objc_copyWeak(v40, &from);
                unint64_t v86 = v89;
                v87[8] = v45;
                objc_msgSend(v46, "pkui_setAlpha:animated:withCompletion:", 1, &block, 0.0);
                if (*(void *)(v42 + 8))
                {
                  v79[0] = MEMORY[0x1E4F143A8];
                  v79[1] = 3221225472;
                  v79[2] = __82__PKApplicationMessageView_RemovedSubviewContainer_commitAnimated_withCompletion___block_invoke_2;
                  v79[3] = &unk_1E59D2FF0;
                  objc_copyWeak(&v80, &from);
                  v79[4] = v89;
                  char v81 = v45;
                  uint64_t v47 = _Block_copy(v79);
                  uint64_t v48 = v40;
                  BOOL v49 = v20;
                  uint64_t v50 = v23;
                  long long v51 = (void *)[objc_alloc(MEMORY[0x1E4F84630]) initWithBlock:v47];
                  uint64_t v52 = *(void *)(v42 + 8);
                  v76[0] = MEMORY[0x1E4F143A8];
                  v76[1] = 3221225472;
                  v76[2] = __82__PKApplicationMessageView_RemovedSubviewContainer_commitAnimated_withCompletion___block_invoke_3;
                  v76[3] = &unk_1E59CAD18;
                  id v53 = v51;
                  id v77 = v53;
                  id v54 = v47;
                  id v78 = v54;
                  (*(void (**)(uint64_t, uint64_t, void *))(v52 + 16))(v52, v42, v76);
                  uint64_t v55 = *(void **)(v42 + 8);
                  *(void *)(v42 + 8) = 0;

                  long long v23 = v50;
                  BOOL v20 = v49;
                  long long v40 = v48;

                  objc_destroyWeak(&v80);
                }
                objc_destroyWeak(v40);
                objc_destroyWeak(&from);
                _Block_object_dispose(v89, 8);
              }
              else
              {
                long long v56 = *(void **)(v42 + 8);
                *(void *)(v42 + 8) = 0;

                -[PKApplicationMessageView_RemovedSubviewContainer _finishFromDealloc:](v42, 0);
              }
            }

            objc_destroyWeak(&v68);
          }
          uint64_t v39 = [obj countByEnumeratingWithState:&v69 objects:v92 count:16];
        }
        while (v39);
      }

      long long v57 = *(void **)(v58 + 504);
      *(void *)(v58 + 504) = 0;

      if (v38)
      {
        uint64_t block = MEMORY[0x1E4F143A8];
        uint64_t v83 = 3221225472;
        v84 = __69__PKApplicationMessageView__commitStagedContentAnimated_dismissable___block_invoke_3;
        uint64_t v85 = &unk_1E59CA7F8;
        objc_copyWeak((id *)&v86, &location);
        dispatch_group_notify(v38, MEMORY[0x1E4F14428], &block);
        objc_destroyWeak((id *)&v86);
      }
      objc_destroyWeak(&location);
    }
    uint64_t v4 = v58;
  }
}

- (void)_markPresented
{
  if (a1 && !*(unsigned char *)(a1 + 608))
  {
    if (*(void *)(a1 + 640) && !*(unsigned char *)(a1 + 585))
    {
      *(unsigned char *)(a1 + 585) = 1;
      if (!*(unsigned char *)(a1 + 496)) {
        *(unsigned char *)(a1 + 496) = 1;
      }
      goto LABEL_8;
    }
    if (!*(unsigned char *)(a1 + 496))
    {
      *(unsigned char *)(a1 + 496) = 1;
      a1 = *(void *)(a1 + 456);
      if (a1) {
LABEL_8:
      }
        -[PKApplicationMessageView _invalidateSize]((void *)a1);
    }
  }
}

- (void)_visitPreOrder:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    context = (void *)MEMORY[0x1A6224460]();
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", a1, 0);
    if ([v4 count])
    {
      while (1)
      {
        id v5 = [v4 lastObject];
        [v4 removeLastObject];
        char v11 = 1;
        char v10 = 0;
        v3[2](v3, v5, &v11, &v10);
        if (v10) {
          break;
        }
        if (v11 && [v5[81] count])
        {
          id v6 = v5[81];
          v8[0] = MEMORY[0x1E4F143A8];
          v8[1] = 3221225472;
          v8[2] = __43__PKApplicationMessageView__visitPreOrder___block_invoke;
          v8[3] = &unk_1E59D34A8;
          id v9 = v4;
          [v6 enumerateObjectsWithOptions:2 usingBlock:v8];
        }
        if (![v4 count]) {
          goto LABEL_10;
        }
      }
    }
LABEL_10:
  }
}

void __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_3(uint64_t a1, unsigned __int8 *a2)
{
  int v2 = a2[494];
  if (a2[512] != v2)
  {
    a2[512] = v2;
    -[PKApplicationMessageView _invalidateSize](a2);
  }
}

- (void)_invalidateSize
{
  if (a1)
  {
    id v1 = a1;
    do
    {
      if (v1[528]) {
        break;
      }
      v1[528] = 1;
      uint64_t v3 = (id *)v1;
      [v1 setNeedsLayout];
      int v2 = v3[57];

      id v1 = v2;
    }
    while (v2);
  }
}

void __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_4(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v8 = a2;
  uint64_t v5 = [v8[59] context];
  id v6 = (void *)v5;
  if (v5
    && !*(unsigned char *)(v5 + 8)
    && (uint64_t v7 = *(void *)(v5 + 32), (unint64_t)([*(id *)(v5 + 16) numberOfChildren] + v7) > 1))
  {
    [*(id *)(a1 + 32) addObject:v8];
    *a3 = 0;
  }
  else if (*((double *)v8 + 65) != 1.79769313e308)
  {
    v8[65] = (id)0x7FEFFFFFFFFFFFFFLL;
    -[PKApplicationMessageView _invalidateSize](v8);
  }
}

double __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(a2 + 640))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
    double result = *(double *)(a2 + 600);
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
    *a4 = 1;
  }
  return result;
}

void __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if (*(double **)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == v3) {
    double v4 = 1.79769313e308;
  }
  else {
    double v4 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  if (v3[65] != v4)
  {
    v3[65] = v4;
    uint64_t v5 = v3;
    -[PKApplicationMessageView _invalidateSize](v3);
    uint64_t v3 = v5;
  }
}

void __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_7(uint64_t a1, void *a2, unsigned char *a3)
{
  double v4 = a2;
  uint64_t v5 = v4;
  if (v4[495])
  {
    id v6 = v4;
    PKCATrackedLayoutPerform();
  }
  else
  {
    [v4 layoutIfNeededAnimated:0];
    *a3 = 0;
  }
}

double __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unsigned int IsAnimated = PKCATrackedLayoutIsAnimated();
  [*(id *)(a1 + 32) bounds];

  return -[PKApplicationMessageView _layoutWithContext:bounds:](v2, IsAnimated | 0x200000000, v4, v5, v6, v7);
}

void __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_9(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 495) = 1;
  -[PKApplicationMessageView _markPresented](a2);
}

uint64_t __58__PKApplicationMessageView__updateSubviewsWithType_depth___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addSubview:a2];
}

uint64_t __58__PKApplicationMessageView__updateSubviewsWithType_depth___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  CGFloat v5 = [a2 key];
  CGFloat v6 = [v4 key];

  uint64_t v7 = [v5 isEqual:v6];
  return v7;
}

void __58__PKApplicationMessageView__updateSubviewsWithType_depth___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5)
  {
    if (!*(unsigned char *)(a1 + 32)) {
      goto LABEL_12;
    }
    uint64_t v11 = 0;
    goto LABEL_11;
  }
  int v8 = *((_DWORD *)v5 + 7);
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = *(unsigned char *)(a1 + 32) == 0;
  }
  if (!v9 || v8 == 1)
  {
    uint64_t v11 = *((void *)v5 + 4);
LABEL_11:
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__PKApplicationMessageView__updateSubviewsWithType_depth___block_invoke_4;
    v12[3] = &unk_1E59CA9F8;
    id v13 = v6;
    -[PKApplicationMessageView _setBlurRadius:animated:withCompletion:](v11, 1, v12, 8.33333333);
  }
LABEL_12:
}

uint64_t __58__PKApplicationMessageView__updateSubviewsWithType_depth___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__PKApplicationMessageView__updateSubviewsWithType_depth___block_invoke_5(void *a1, unint64_t a2, void *a3)
{
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1[5] + 8) + 40);
  if (v7)
  {
    while (!a2 || *(void *)(v7 + 40) >= a2)
    {
      id v8 = *(id *)(v7 + 32);
      BOOL v9 = (void *)a1[4];
      if (v6) {
        [v9 insertSubview:v8 aboveSubview:v6];
      }
      else {
        [v9 bringSubviewToFront:v8];
      }
      id v14 = v8;

      ++*(void *)(*(void *)(a1[6] + 8) + 24);
      unint64_t v10 = a1[7];
      unint64_t v11 = *(void *)(*(void *)(a1[6] + 8) + 24);
      if (v11 >= v10)
      {
        int v12 = 0;
      }
      else
      {
        uint64_t v3 = [*(id *)(a1[4] + 656) objectAtIndexedSubscript:v10 + ~v11];
        int v12 = v3;
      }
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v12);
      if (v11 < v10) {

      }
      id v13 = v14;
      uint64_t v7 = *(void *)(*(void *)(a1[5] + 8) + 40);
      id v6 = v14;
      if (!v7) {
        goto LABEL_15;
      }
    }
  }
  id v13 = v6;
LABEL_15:
}

void __59__PKApplicationMessageView__stageRemovedSubviewContainers___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    uint64_t v3 = [v2 nextObject];
    if (v3)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3[5];
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
      id v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = 0;

      uint64_t v3 = 0;
    }
  }
}

uint64_t __59__PKApplicationMessageView__stageRemovedSubviewContainers___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  if (a2)
  {
    unint64_t v5 = *(void *)(a2 + 40);
    if (v4)
    {
LABEL_3:
      unint64_t v6 = v4[5];
      goto LABEL_4;
    }
  }
  else
  {
    unint64_t v5 = 0;
    if (v4) {
      goto LABEL_3;
    }
  }
  unint64_t v6 = 0;
LABEL_4:
  BOOL v7 = v5 >= v6;
  BOOL v8 = v5 == v6;
  uint64_t v9 = -1;
  if (v7) {
    uint64_t v9 = 1;
  }
  if (v8) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v9;
  }

  return v10;
}

uint64_t __59__PKApplicationMessageView__stageRemovedSubviewContainers___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  if (a2)
  {
    unint64_t v5 = *(void *)(a2 + 48);
    if (v4)
    {
LABEL_3:
      unint64_t v6 = v4[6];
      goto LABEL_4;
    }
  }
  else
  {
    unint64_t v5 = 0;
    if (v4) {
      goto LABEL_3;
    }
  }
  unint64_t v6 = 0;
LABEL_4:
  BOOL v7 = v5 >= v6;
  BOOL v8 = v5 == v6;
  uint64_t v9 = -1;
  if (v7) {
    uint64_t v9 = 1;
  }
  if (v8) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v9;
  }

  return v10;
}

void __69__PKApplicationMessageView__commitStagedContentAnimated_dismissable___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 640);
  uint64_t v4 = [*(id *)(v2 + 480) content];
  if (v3) {
    -[PKApplicationMessageContentView setContent:animated:](v3, v4, 0);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  unint64_t v6 = *(unsigned char **)(v5 + 640);
  BOOL v7 = *(void *)(v5 + 616) == 0;
  int v8 = *(unsigned __int8 *)(a1 + 40);

  -[PKApplicationMessageContentView setDismissable:animated:](v6, v7, v8);
}

void __69__PKApplicationMessageView__commitStagedContentAnimated_dismissable___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = v7;
    objc_msgSend(WeakRetained[82], "removeObjectAtIndex:", objc_msgSend(WeakRetained[82], "indexOfObjectIdenticalTo:", v4));
    objc_msgSend(WeakRetained[83], "removeObjectAtIndex:", objc_msgSend(WeakRetained[83], "indexOfObjectIdenticalTo:", v4));
    if (v4) {
      uint64_t v5 = (void *)v4[4];
    }
    else {
      uint64_t v5 = 0;
    }
    [v5 removeFromSuperview];
  }
  unint64_t v6 = *(NSObject **)(a1 + 32);
  if (v6) {
    dispatch_group_leave(v6);
  }
}

void __69__PKApplicationMessageView__commitStagedContentAnimated_dismissable___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    int v3 = [WeakRetained needsRemoval];
    uint64_t v2 = v5;
    if (v3)
    {
      id v4 = objc_loadWeakRetained(v5 + 92);
      [v4 applicationMessageViewNeedsRemoval:v5];

      uint64_t v2 = v5;
    }
  }
}

void __40__PKApplicationMessageView__queueReload__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[625] = 0;
    int v3 = -[PKApplicationMessageView _rootView](WeakRetained);
    id v4 = v3;
    if (v3 == v2)
    {
      int v3 = v2;
    }
    else if (v3[625])
    {
      uint64_t v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 134218240;
        id v7 = v2;
        __int16 v8 = 2048;
        uint64_t v9 = v4;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKApplicationMessageView (%p): deferring queued reload to new root view %p.", (uint8_t *)&v6, 0x16u);
      }

      goto LABEL_9;
    }
    __40__PKApplicationMessageView__queueReload__block_invoke_2(v3);
LABEL_9:
  }
}

void __40__PKApplicationMessageView__queueReload__block_invoke_2(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1) {
    __break(1u);
  }
  int v6 = v1;
  -[PKApplicationMessageView _visitPreOrder:]((uint64_t)v1, &__block_literal_global_154);
  uint64_t v2 = -[PKApplicationMessageView _rootView](v6);
  int v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v2;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKApplicationMessageView (%p): reloading full graph.", (uint8_t *)&buf, 0xCu);
  }

  id v4 = v6;
  uint64_t v5 = (void *)v6[79];
  if (v5)
  {
    [v5 setNeedsUpdateConfiguration];
    id v4 = v6;
  }
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  __int16 v8 = __35__PKApplicationMessageView__reload__block_invoke;
  uint64_t v9 = &unk_1E59D32F0;
  uint64_t v10 = v4;
  -[PKApplicationMessageView _treeLayoutWithContext:block:](v2, 0, &buf);
}

void __40__PKApplicationMessageView__queueReload__block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 624) = 0;
}

void __35__PKApplicationMessageView__reload__block_invoke(uint64_t a1)
{
}

void __35__PKApplicationMessageView__reload__block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)_updateFilters
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 layer];
  int v3 = v2;
  uint64_t v4 = a1[87];
  if (!a1[85])
  {
    if (!v4)
    {
      [v2 setFilters:0];
      goto LABEL_9;
    }
    uint64_t v9 = a1[87];
    uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
    int v6 = &v9;
    goto LABEL_7;
  }
  if (!v4)
  {
    uint64_t v10 = a1[85];
    uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
    int v6 = &v10;
LABEL_7:
    uint64_t v7 = 1;
    goto LABEL_8;
  }
  v11[0] = a1[85];
  v11[1] = v4;
  uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
  int v6 = v11;
  uint64_t v7 = 2;
LABEL_8:
  __int16 v8 = [v5 arrayWithObjects:v6 count:v7];
  [v3 setFilters:v8];

LABEL_9:
}

uint64_t __67__PKApplicationMessageView__setBlurRadius_animated_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__PKApplicationMessageView__updateHighlightAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setValue:*(void *)(*(void *)(a1 + 40) + 704) forKeyPath:@"filters.highlightFilter.inputColor"];
}

void __35__PKApplicationMessageView__expand__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  -[PKApplicationMessageView _updateSubviewsWithType:depth:](*(void *)(a1 + 32), v1, *(void *)(*(void *)(a1 + 32) + 616));
}

- (void)_dismiss
{
  if (a1 && !*(unsigned char *)(a1 + 608))
  {
    uint64_t v4 = (id *)-[PKApplicationMessageView _rootView]((void *)a1);
    id v2 = *(id *)(a1 + 472);
    id WeakRetained = objc_loadWeakRetained(v4 + 92);
    [WeakRetained applicationMessageView:v4 requestsContentDismissal:v2];
  }
}

void __41__PKApplicationMessageView__resetVisited__block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 464) = 0;
}

void __43__PKApplicationMessageView__visitPreOrder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 context];
  id v5 = (id)v3;
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 24);
  }
  else {
    uint64_t v4 = 0;
  }
  [v2 addObject:v4];
}

void __44__PKApplicationMessageView__visitPostOrder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 context];
  id v5 = (id)v3;
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 24);
  }
  else {
    uint64_t v4 = 0;
  }
  [v2 addObject:v4];
}

- (void)_tapped:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PKApplicationMessageNode *)self->_content context];
  if (v4)
  {
    if (!*(unsigned char *)(v4 + 8))
    {
      uint64_t v5 = *(void *)(v4 + 32);
      id v28 = (id)v4;
      unint64_t v6 = [*(id *)(v4 + 16) numberOfChildren] + v5;
      uint64_t v4 = (uint64_t)v28;
      if (v6 > 1)
      {
        if (self->_invalidated) {
          goto LABEL_24;
        }
        uint64_t v18 = [(PKApplicationMessageNode *)self->_content context];
        __int16 v8 = (unsigned __int8 *)v18;
        if (v18)
        {
          int v19 = *(unsigned __int8 *)(v18 + 8);
          uint64_t v20 = *(void *)(v18 + 32);
          uint64_t v21 = [*(id *)(v18 + 16) numberOfChildren];
          int v22 = (unint64_t)(v21 + v20) > 1;
          int v23 = v8[8];
          if (v23 != v22)
          {
            v8[8] = v22;
            int v23 = (unint64_t)(v21 + v20) > 1;
          }
          if ((v19 != 0) != (v23 != 0))
          {
            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = __35__PKApplicationMessageView__expand__block_invoke;
            v30[3] = &unk_1E59D3480;
            v30[4] = self;
            char v31 = v23;
            -[PKApplicationMessageView _treeLayoutWithContext:block:](self, 1u, v30);
          }
        }
        goto LABEL_23;
      }
    }
  }
  if (!self->_invalidated)
  {
    message = self->_message;
    if (message)
    {
      id v28 = (id)v4;
      __int16 v8 = message;
      uint64_t v9 = [v8 content];
      uint64_t v10 = [v9 action];

      if (v10)
      {
        unint64_t v11 = [v10 type];
        if (v11 <= 1)
        {
          unint64_t v12 = v11;
          id v13 = [v10 url];
          id v14 = objc_alloc_init(MEMORY[0x1E4F224A0]);
          [v14 setSensitive:v12 == 1];
          uint64_t v29 = *MEMORY[0x1E4F62688];
          v30[0] = MEMORY[0x1E4F1CC38];
          uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
          [v14 setFrontBoardOptions:v15];

          if ((PKRunningInViewService() & 1) != 0 || PKRunningInLockScreenPlugin())
          {
            int v16 = [(PKApplicationMessageView *)self window];
            long long v17 = v16;
            if (v16) {
              PKPostOpenApplicationNotification(v16, v13, v14);
            }
          }
          else
          {
            PKOpenApplication(v13, v14);
          }
        }
        BOOL v24 = (id *)-[PKApplicationMessageView _rootView](self);
        id WeakRetained = objc_loadWeakRetained(v24 + 92);
        int v26 = [v8 registration];
        uint64_t v27 = [v26 key];
        [WeakRetained applicationMessageView:v24 tappedApplicationMessageWithKey:v27];
      }
LABEL_23:

      uint64_t v4 = (uint64_t)v28;
    }
  }
LABEL_24:
}

- (BOOL)needsRemoval
{
  if (self->_invalidated) {
    return 1;
  }
  if ([(NSMutableArray *)self->_removedSubviews count]) {
    return 0;
  }
  uint64_t v4 = [(PKApplicationMessageNode *)self->_content context];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    uint64_t v6 = *(void *)(v4 + 32);
    BOOL v2 = [*(id *)(v4 + 16) numberOfChildren] + v6 == 0;
  }
  else
  {
    BOOL v2 = 1;
  }

  return v2;
}

- (int64_t)scrollType
{
  return 1;
}

- (void)setSubheaderDelegate:(id)a3
{
}

- (PKApplicationMessageViewConfiguration)configuration
{
  return self->_configuration;
}

- (PKApplicationMessageViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKApplicationMessageViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_subheaderDelegate);
  objc_storeStrong((id *)&self->_highlightFilter, 0);
  objc_storeStrong((id *)&self->_blurFilter, 0);
  objc_storeStrong((id *)&self->_removedVisualSubviews, 0);
  objc_storeStrong((id *)&self->_removedSubviews, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_stagedRemovedSubviews, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end