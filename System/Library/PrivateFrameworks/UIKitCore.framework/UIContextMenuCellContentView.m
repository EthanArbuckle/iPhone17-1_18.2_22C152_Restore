@interface UIContextMenuCellContentView
@end

@implementation UIContextMenuCellContentView

void __42___UIContextMenuCellContentView_setTitle___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length])
  {
    [*(id *)(a1 + 40) _createLabelStackViewIfNeeded];
    [*(id *)(a1 + 40) _installTitleLabelIfNeeded];
  }
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [*(id *)(a1 + 40) titleLabel];
  [v3 setText:v2];

  [*(id *)(a1 + 40) _updateTitleLabelNumberOfLines];
  id v5 = [*(id *)(a1 + 40) _iconSymbolConfigurationForCurrentTraitsUsingBoldFont:0];
  v4 = [*(id *)(a1 + 40) iconImageView];
  [v4 setPreferredSymbolConfiguration:v5];
}

uint64_t __52___UIContextMenuCellContentView_setAttributedTitle___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length])
  {
    [*(id *)(a1 + 40) _createLabelStackViewIfNeeded];
    [*(id *)(a1 + 40) _installTitleLabelIfNeeded];
  }
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [*(id *)(a1 + 40) titleLabel];
  [v3 setAttributedText:v2];

  v4 = *(void **)(a1 + 40);
  return [v4 _updateTitleLabelNumberOfLines];
}

void __45___UIContextMenuCellContentView_setSubtitle___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) length];
  if (v2)
  {
    [*(id *)(a1 + 40) _createLabelStackViewIfNeeded];
    [*(id *)(a1 + 40) _installSubtitleLabelIfNeeded];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = [*(id *)(a1 + 40) subtitleLabel];
  [v4 setText:v3];

  id v5 = [*(id *)(a1 + 40) subtitleLabel];
  [v5 setHidden:v2 == 0];
}

uint64_t __42___UIContextMenuCellContentView_setImage___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) iconImageView];
  v4 = v3;
  if (v2)
  {

    if (!v4)
    {
      id v5 = [*(id *)(a1 + 40) _contentImageViewForImage:*(void *)(a1 + 32)];
      [*(id *)(a1 + 40) setIconImageView:v5];

      int v6 = dyld_program_sdk_at_least();
      v7 = [*(id *)(a1 + 40) _iconSymbolConfigurationForCurrentTraitsUsingBoldFont:0];
      v8 = [*(id *)(a1 + 40) iconImageView];
      v9 = v8;
      if (v6) {
        [v8 setPreferredSymbolConfiguration:v7];
      }
      else {
        [v8 _setOverridingSymbolConfiguration:v7];
      }
    }
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = [*(id *)(a1 + 40) iconImageView];
    [v11 setImage:v10];

    v12 = [*(id *)(a1 + 40) iconImageView];
    [v12 sizeToFit];
  }
  else
  {
    [v3 removeFromSuperview];

    [*(id *)(a1 + 40) setIconImageView:0];
  }
  v13 = *(void **)(a1 + 40);
  return [v13 _setNeedsConstraintRebuild];
}

void __53___UIContextMenuCellContentView__setDecorationImage___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) decorationImageView];
  v4 = v3;
  if (v2)
  {

    if (!v4)
    {
      id v5 = [*(id *)(a1 + 40) _contentImageViewForImage:*(void *)(a1 + 32)];
      [*(id *)(a1 + 40) setDecorationImageView:v5];
    }
    int v6 = [*(id *)(a1 + 40) _childIndicatorColorForCurrentState];
    v7 = [*(id *)(a1 + 40) decorationImageView];
    [v7 setTintColor:v6];

    uint64_t v8 = *(void *)(a1 + 32);
    v9 = [*(id *)(a1 + 40) decorationImageView];
    [v9 setImage:v8];

    id v11 = [*(id *)(a1 + 40) decorationImageView];
    [v11 sizeToFit];
  }
  else
  {
    [v3 removeFromSuperview];

    uint64_t v10 = *(void **)(a1 + 40);
    [v10 setDecorationImageView:0];
  }
}

BOOL __76___UIContextMenuCellContentView__updateForOptionsChangeFromPreviousOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return ((*(void *)(a1 + 40) ^ [*(id *)(a1 + 32) options]) & a2) != 0;
}

void __76___UIContextMenuCellContentView__updateForOptionsChangeFromPreviousOptions___block_invoke_2(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) options];
  uint64_t v3 = *(void **)(a1 + 32);
  if ((v2 & 4) != 0)
  {
    id v4 = [v3 _selectionImage];
    [v3 _setDecorationImage:v4];
  }
  else
  {
    [v3 _setDecorationImage:0];
  }
}

void __76___UIContextMenuCellContentView__updateForOptionsChangeFromPreviousOptions___block_invoke_3(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) options];
  uint64_t v3 = *(void **)(a1 + 32);
  if ((v2 & 8) != 0)
  {
    id v4 = [v3 _mixedSelectionImage];
    [v3 _setDecorationImage:v4];
  }
  else
  {
    [v3 _setDecorationImage:0];
  }
}

void __76___UIContextMenuCellContentView__updateForOptionsChangeFromPreviousOptions___block_invoke_4(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) options];
  uint64_t v3 = *(void **)(a1 + 32);
  if ((v2 & 0x10) != 0)
  {
    id v4 = [v3 _childIndicatorImage];
    [v3 _setDecorationImage:v4];
  }
  else
  {
    [v3 _setDecorationImage:0];
  }
}

uint64_t __50___UIContextMenuCellContentView__updateSecureView__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) resolvedStyleForStyle:a2];
}

void __50___UIContextMenuCellContentView__updateSecureView__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v9 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50___UIContextMenuCellContentView__updateSecureView__block_invoke_3;
  block[3] = &unk_1E52FBD90;
  v16[1] = a2;
  id v13 = v7;
  id v14 = *(id *)(a1 + 32);
  id v10 = v7;
  objc_copyWeak(v16, (id *)(a1 + 40));
  id v15 = v8;
  id v11 = v8;
  dispatch_async(v9, block);

  objc_destroyWeak(v16);
}

void __50___UIContextMenuCellContentView__updateSecureView__block_invoke_3(uint64_t a1)
{
  char v2 = +[_UIConcretePasteboard _remoteContentForLayerContextWithId:*(void *)(a1 + 64) slotStyle:*(void *)(a1 + 32) pasteButtonTag:*(void *)(a1 + 40)];
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50___UIContextMenuCellContentView__updateSecureView__block_invoke_4;
    block[3] = &unk_1E52DF578;
    objc_copyWeak(&v6, (id *)(a1 + 56));
    id v5 = *(id *)(a1 + 48);
    id v4 = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v6);
  }
}

void __50___UIContextMenuCellContentView__updateSecureView__block_invoke_4(uint64_t a1)
{
  char v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained pasteVariant];
  if (v3)
  {
    id v4 = (void *)v3;
    int v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();

    if (!v5) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained(v2);
    [WeakRetained _hideContents];
  }
}

void __49___UIContextMenuCellContentView_setIsEmphasized___block_invoke(uint64_t a1)
{
  char v2 = *(unsigned char **)(a1 + 32);
  if (!v2[410]) {
    return;
  }
  uint64_t v3 = [v2 titleLabel];
  id v4 = [v3 text];
  if ([v4 length])
  {
    int v5 = [*(id *)(a1 + 32) emphasizedTitleLabel];

    if (v5) {
      goto LABEL_6;
    }
    id v6 = [*(id *)(a1 + 32) _primaryTitleLabel];
    [*(id *)(a1 + 32) setEmphasizedTitleLabel:v6];

    id v7 = [*(id *)(a1 + 32) traitCollection];
    id v8 = _UIContextMenuGetPlatformMetrics([v7 userInterfaceIdiom]);
    v9 = [v8 titleEmphasizedFont];
    id v10 = [v9 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v7];

    id v11 = [*(id *)(a1 + 32) emphasizedTitleLabel];
    [v11 setFont:v10];

    v12 = [*(id *)(a1 + 32) titleLabel];
    uint64_t v13 = [v12 textAlignment];
    id v14 = [*(id *)(a1 + 32) emphasizedTitleLabel];
    [v14 setTextAlignment:v13];

    id v15 = [*(id *)(a1 + 32) titleLabel];
    uint64_t v16 = [v15 adjustsFontSizeToFitWidth];
    v17 = [*(id *)(a1 + 32) emphasizedTitleLabel];
    [v17 setAdjustsFontSizeToFitWidth:v16];

    v18 = [*(id *)(a1 + 32) _primaryCompositingFilterForCurrentTraitsAndState];
    v19 = [*(id *)(a1 + 32) emphasizedTitleLabel];
    v20 = [v19 layer];
    [v20 setCompositingFilter:v18];

    uint64_t v3 = [*(id *)(a1 + 32) titleLabel];
    id v4 = [v3 superview];
    v21 = [*(id *)(a1 + 32) emphasizedTitleLabel];
    v22 = [*(id *)(a1 + 32) titleLabel];
    [v4 insertSubview:v21 aboveSubview:v22];
  }
LABEL_6:
  v23 = [*(id *)(a1 + 32) titleLabel];
  v24 = [v23 text];
  v25 = [*(id *)(a1 + 32) emphasizedTitleLabel];
  [v25 setText:v24];

  v26 = [*(id *)(a1 + 32) emphasizedTitleLabel];
  [v26 setAlpha:0.0];

  v27 = [*(id *)(a1 + 32) iconImageView];
  uint64_t v28 = [v27 image];
  if (!v28)
  {

    goto LABEL_11;
  }
  v29 = (void *)v28;
  v30 = [*(id *)(a1 + 32) emphasizediconImageView];

  if (v30)
  {
LABEL_11:
    v35 = [*(id *)(a1 + 32) iconImageView];
    v36 = [v35 image];
    v37 = [*(id *)(a1 + 32) emphasizediconImageView];
    [v37 setImage:v36];

    goto LABEL_12;
  }
  v31 = *(void **)(a1 + 32);
  v32 = [v31 iconImageView];
  v33 = [v32 image];
  v34 = [v31 _contentImageViewForImage:v33];
  [*(id *)(a1 + 32) setEmphasizediconImageView:v34];

  v35 = [*(id *)(a1 + 32) _iconSymbolConfigurationForCurrentTraitsUsingBoldFont:1];
  v36 = [*(id *)(a1 + 32) emphasizediconImageView];
  [v36 _setOverridingSymbolConfiguration:v35];
LABEL_12:

  v38 = [*(id *)(a1 + 32) emphasizediconImageView];
  [v38 sizeToFit];

  id v39 = [*(id *)(a1 + 32) emphasizediconImageView];
  [v39 setAlpha:0.0];
}

uint64_t __74___UIContextMenuCellContentView_setControlState_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAppearanceForStateChange];
}

@end