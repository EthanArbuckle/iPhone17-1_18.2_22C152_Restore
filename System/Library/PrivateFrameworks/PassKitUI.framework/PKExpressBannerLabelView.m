@interface PKExpressBannerLabelView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKExpressBannerLabelView)init;
- (PKExpressBannerLabelView)initWithCoder:(id)a3;
- (PKExpressBannerLabelView)initWithFrame:(CGRect)a3;
- (void)_updateLabelAnimated:(uint64_t)a1;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKExpressBannerLabelView

- (PKExpressBannerLabelView)init
{
  return 0;
}

- (PKExpressBannerLabelView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (PKExpressBannerLabelView)initWithCoder:(id)a3
{
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKExpressBannerLabelView;
  [(PKExpressBannerLabelView *)&v9 traitCollectionDidChange:v4];
  v5 = [(PKExpressBannerLabelView *)self traitCollection];
  if (!v4
    || ([v4 preferredContentSizeCategory],
        v6 = (NSString *)objc_claimAutoreleasedReturnValue(),
        [v5 preferredContentSizeCategory],
        v7 = (NSString *)objc_claimAutoreleasedReturnValue(),
        NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v6, v7),
        v7,
        v6,
        v8))
  {
    -[PKExpressBannerLabelView _updateLabelAnimated:]((uint64_t)self);
  }
}

- (void)_updateLabelAnimated:(uint64_t)a1
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    char v2 = [(id)a1 isHidden];
    double v4 = *(double *)(a1 + 424);
    double v3 = *(double *)(a1 + 432);
    v5 = *(void **)(a1 + 440);
    if (v5)
    {
      if (v2)
      {
        [v5 removeFromSuperview];
        id v6 = *(id *)(a1 + 448);
        v7 = *(void **)(a1 + 448);
        *(void *)(a1 + 448) = 0;

        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v8 = v6;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v38 != v10) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*((void *)&v37 + 1) + 8 * i) removeFromSuperview];
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v46 count:16];
          }
          while (v9);
        }
        id v12 = v8;
      }
      else
      {
        if (!*(void *)(a1 + 448))
        {
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v14 = *(void **)(a1 + 448);
          *(void *)(a1 + 448) = v13;

          v5 = *(void **)(a1 + 440);
        }
        id v15 = v5;
        [*(id *)(a1 + 448) addObject:v15];
        id v8 = [v15 layer];
        [v8 setValue:&unk_1EF2B8990 forKeyPath:@"filters.blur.inputRadius"];
        v16 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"filters.blur.inputRadius"];
        objc_msgSend(v16, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", 0.0, 8.33333333);
        id v17 = (id)objc_msgSend(v8, "pkui_addAdditiveAnimation:", v16);
        objc_initWeak(&location, (id)a1);
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __49__PKExpressBannerLabelView__updateLabelAnimated___block_invoke;
        v41[3] = &unk_1E59CB268;
        objc_copyWeak(&v43, &location);
        id v12 = v15;
        id v42 = v12;
        objc_msgSend(v12, "pkui_setAlpha:animated:withCompletion:", 1, v41, 0.0);

        objc_destroyWeak(&v43);
        objc_destroyWeak(&location);
      }
      v18 = *(void **)(a1 + 440);
      *(void *)(a1 + 440) = 0;

      *(_OWORD *)(a1 + 424) = *MEMORY[0x1E4F1DB30];
    }
    if (*(void *)(a1 + 416))
    {
      v19 = [(id)a1 traitCollection];
      if (v19)
      {
        id v20 = objc_alloc_init(MEMORY[0x1E4FB1930]);
        v21 = *(void **)(a1 + 440);
        *(void *)(a1 + 440) = v20;

        [*(id *)(a1 + 440) setNumberOfLines:1];
        v22 = *(void **)(a1 + 440);
        v23 = objc_msgSend(MEMORY[0x1E4FB08E0], "sbui_systemAperturePreferredFontForTextStyle:compatibleWithTraitCollection:", 4, v19);
        [v22 setFont:v23];

        [*(id *)(a1 + 440) setLineBreakMode:4];
        [*(id *)(a1 + 440) setAdjustsFontSizeToFitWidth:1];
        [*(id *)(a1 + 440) setMinimumScaleFactor:0.8];
        [*(id *)(a1 + 440) setText:*(void *)(a1 + 416)];
        [*(id *)(a1 + 440) sizeToFit];
        uint64_t v24 = *(int *)(a1 + 408);
        if (v24 >= 4)
        {
          __break(1u);
          return;
        }
        objc_msgSend(*(id *)(a1 + 440), "setAnchorPoint:", dbl_1A0445C90[v24], dbl_1A0445C70[v24]);
        v25 = [*(id *)(a1 + 440) layer];
        id v26 = objc_alloc(MEMORY[0x1E4F39BC0]);
        v27 = (void *)[v26 initWithType:*MEMORY[0x1E4F3A0D0]];
        [v27 setName:@"blur"];
        v45 = v27;
        v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
        [v25 setFilters:v28];

        [(id)a1 addSubview:*(void *)(a1 + 440)];
        [*(id *)(a1 + 440) frame];
        *(void *)(a1 + 424) = v29;
        *(void *)(a1 + 432) = v30;
        [(id)a1 setNeedsLayout];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __49__PKExpressBannerLabelView__updateLabelAnimated___block_invoke_2;
        v35[3] = &unk_1E59CDA78;
        char v36 = v2 ^ 1;
        v35[4] = a1;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v35];
        if ((v2 & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 440), "pkui_setAlpha:animated:", 1, 1.0);
          v31 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"filters.blur.inputRadius"];
          objc_msgSend(v31, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", 8.33333333, 0.0);
          id v32 = (id)objc_msgSend(v25, "pkui_addAdditiveAnimation:", v31);
        }
        if (v4 != *(double *)(a1 + 424) || v3 != *(double *)(a1 + 432))
        {
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 456));
          [WeakRetained expressLabelViewDidChangeSize:a1];
        }
        goto LABEL_30;
      }
    }
    if (v4 != *(double *)(a1 + 424) || v3 != *(double *)(a1 + 432))
    {
      v19 = objc_loadWeakRetained((id *)(a1 + 456));
      [v19 expressLabelViewDidChangeSize:a1];
LABEL_30:
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (self->_label)
  {
    p_height = &self->_size.height;
    double v4 = fmin(self->_size.width, a3.width);
  }
  else
  {
    p_height = (CGFloat *)(MEMORY[0x1E4F1DB30] + 8);
    double v4 = *MEMORY[0x1E4F1DB30];
  }
  double v5 = *p_height;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)PKExpressBannerLabelView;
  [(PKExpressBannerLabelView *)&v14 layoutSubviews];
  [(PKExpressBannerLabelView *)self bounds];
  if (self && self->_alignmentEdge >= 4) {
    __break(1u);
  }
  label = self->_label;
  if (label)
  {
    PKSizeAlignedInRect();
    -[UILabel setFrame:](label, "setFrame:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v4 = self->_obsoleteLabels;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_msgSend(v9, "frame", (void)v10);
        PKSizeAlignedInRect();
        objc_msgSend(v9, "setFrame:");
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

void __49__PKExpressBannerLabelView__updateLabelAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v4 = WeakRetained;
    double v3 = [*(id *)(a1 + 32) superview];

    id WeakRetained = v4;
    if (v3)
    {
      [v4[56] removeObjectIdenticalTo:*(void *)(a1 + 32)];
      [*(id *)(a1 + 32) removeFromSuperview];
      id WeakRetained = v4;
    }
  }
}

uint64_t __49__PKExpressBannerLabelView__updateLabelAnimated___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:0.0];
  }
  char v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_obsoleteLabels, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end