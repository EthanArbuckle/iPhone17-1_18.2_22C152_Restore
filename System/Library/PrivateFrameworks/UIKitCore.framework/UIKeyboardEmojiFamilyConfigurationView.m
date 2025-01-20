@interface UIKeyboardEmojiFamilyConfigurationView
+ (CGSize)preferredContentViewSizeForKey:(id)a3 withTraits:(id)a4;
+ (id)_selectionAndSeparatorColorForDarkMode:(BOOL)a3;
- (BOOL)_hasCompletelyConfiguredSkinToneConfiguration;
- (BOOL)hasSplitFontSupport;
- (BOOL)retestSelectedVariantIndexForKey:(id)a3 atPoint:(CGPoint)a4 phase:(int64_t)a5;
- (BOOL)usesDarkStyle;
- (NSArray)skinToneVariantRows;
- (NSArray)variantDisplayRows;
- (NSIndexPath)lastSelectedIndexPath;
- (NSMutableArray)familyMemberStackViews;
- (NSMutableArray)selectedVariantIndices;
- (NSString)baseEmojiString;
- (UIKBTree)representedKey;
- (UIKeyboardEmojiFamilyConfigurationView)initWithFrame:(CGRect)a3;
- (UIKeyboardEmojiWellView)configuredWellView;
- (UIKeyboardEmojiWellView)neutralWellView;
- (UIStackView)previewWellStackView;
- (UIView)separatorView;
- (UIView)touchForwardingView;
- (id)_currentlySelectedSkinToneConfiguration;
- (id)_wellViewForSection:(int64_t)a3 item:(int64_t)a4;
- (id)nextResponder;
- (unint64_t)_silhouetteFromCurrentSelections;
- (void)_beginFamilyMetachronalRhythmAnimation;
- (void)_colorConfigurationDidChange;
- (void)_configureFamilyMemberWellStackViews;
- (void)_configureSkinToneVariantSpecifiersForBaseString:(id)a3;
- (void)_setCurrentlySelectedSkinToneConfiguration:(id)a3;
- (void)_updateBottomRowForSelections:(id)a3;
- (void)_updatePreviewWellForCurrentSelection;
- (void)_updateReferencedKeySelectedVariantIndexBasedOnCurrentConfiguration;
- (void)layoutSubviews;
- (void)retestForTouchUpSelectedVariantIndexForKey:(id)a3 atPoint:(CGPoint)a4;
- (void)retestSelectedVariantIndexForKey:(id)a3 atPoint:(CGPoint)a4;
- (void)setBaseEmojiString:(id)a3;
- (void)setConfiguredWellView:(id)a3;
- (void)setFamilyMemberStackViews:(id)a3;
- (void)setHasSplitFontSupport:(BOOL)a3;
- (void)setLastSelectedIndexPath:(id)a3;
- (void)setNeutralWellView:(id)a3;
- (void)setPreviewWellStackView:(id)a3;
- (void)setRepresentedKey:(id)a3;
- (void)setSelectedVariantIndices:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setSkinToneVariantRows:(id)a3;
- (void)setTouchForwardingView:(id)a3;
- (void)setUsesDarkStyle:(BOOL)a3;
- (void)setVariantDisplayRows:(id)a3;
- (void)updateForKeyplane:(id)a3 key:(id)a4;
- (void)updateRenderConfig:(id)a3;
@end

@implementation UIKeyboardEmojiFamilyConfigurationView

+ (id)_selectionAndSeparatorColorForDarkMode:(BOOL)a3
{
  if (a3) {
    +[UIColor colorWithWhite:1.0 alpha:0.18];
  }
  else {
  v3 = +[UIColor colorWithRed:0.934 green:0.934 blue:0.938 alpha:1.0];
  }
  return v3;
}

- (UIKeyboardEmojiFamilyConfigurationView)initWithFrame:(CGRect)a3
{
  v39[2] = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)UIKeyboardEmojiFamilyConfigurationView;
  v3 = -[UIView initWithFrame:](&v38, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(UIView *)v3 setBackgroundColor:v4];

    v5 = [MEMORY[0x1E4F1CA48] array];
    [(UIKeyboardEmojiFamilyConfigurationView *)v3 setFamilyMemberStackViews:v5];

    v6 = [UIView alloc];
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v11 = -[UIView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    [(UIKeyboardEmojiFamilyConfigurationView *)v3 setSeparatorView:v11];

    v12 = objc_msgSend((id)objc_opt_class(), "_selectionAndSeparatorColorForDarkMode:", -[UIKeyboardEmojiFamilyConfigurationView usesDarkStyle](v3, "usesDarkStyle"));
    v13 = [(UIKeyboardEmojiFamilyConfigurationView *)v3 separatorView];
    [v13 setBackgroundColor:v12];

    v14 = [(UIKeyboardEmojiFamilyConfigurationView *)v3 separatorView];
    [(UIView *)v3 addSubview:v14];

    v15 = -[UIKeyboardEmojiWellView initWithFrame:]([UIKeyboardEmojiWellView alloc], "initWithFrame:", v7, v8, v9, v10);
    [(UIKeyboardEmojiFamilyConfigurationView *)v3 setNeutralWellView:v15];

    v16 = [off_1E52D39B8 systemFontOfSize:48.0];
    v17 = [(UIKeyboardEmojiFamilyConfigurationView *)v3 neutralWellView];
    [v17 setLabelFont:v16];

    v18 = [(UIKeyboardEmojiFamilyConfigurationView *)v3 _backgroundColorForSelection];
    v19 = [(UIKeyboardEmojiFamilyConfigurationView *)v3 neutralWellView];
    [v19 setSelectionBackgroundColor:v18];

    v20 = -[UIKeyboardEmojiWellView initWithFrame:]([UIKeyboardEmojiWellView alloc], "initWithFrame:", v7, v8, v9, v10);
    [(UIKeyboardEmojiFamilyConfigurationView *)v3 setConfiguredWellView:v20];

    v21 = [off_1E52D39B8 systemFontOfSize:48.0];
    v22 = [(UIKeyboardEmojiFamilyConfigurationView *)v3 configuredWellView];
    [v22 setLabelFont:v21];

    v23 = [(UIKeyboardEmojiFamilyConfigurationView *)v3 configuredWellView];
    objc_msgSend(v23, "setCompositeImageSize:", 48.0, 48.0);

    v24 = [(UIKeyboardEmojiFamilyConfigurationView *)v3 _backgroundColorForSelection];
    v25 = [(UIKeyboardEmojiFamilyConfigurationView *)v3 configuredWellView];
    [v25 setSelectionBackgroundColor:v24];

    v26 = [UIStackView alloc];
    v27 = [(UIKeyboardEmojiFamilyConfigurationView *)v3 neutralWellView];
    v39[0] = v27;
    v28 = [(UIKeyboardEmojiFamilyConfigurationView *)v3 configuredWellView];
    v39[1] = v28;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    v30 = [(UIStackView *)v26 initWithArrangedSubviews:v29];
    [(UIKeyboardEmojiFamilyConfigurationView *)v3 setPreviewWellStackView:v30];

    v31 = [(UIKeyboardEmojiFamilyConfigurationView *)v3 previewWellStackView];
    [v31 setAxis:0];

    v32 = [(UIKeyboardEmojiFamilyConfigurationView *)v3 previewWellStackView];
    [v32 setDistribution:1];

    v33 = [(UIKeyboardEmojiFamilyConfigurationView *)v3 previewWellStackView];
    v34 = [v33 heightAnchor];
    v35 = [v34 constraintEqualToConstant:70.0];
    [v35 setActive:1];

    v36 = [(UIKeyboardEmojiFamilyConfigurationView *)v3 previewWellStackView];
    [(UIView *)v3 addSubview:v36];

    getEMFStringUtilitiesClass_1();
    [(UIKeyboardEmojiFamilyConfigurationView *)v3 setHasSplitFontSupport:objc_opt_respondsToSelector() & 1];
  }
  return v3;
}

- (void)_colorConfigurationDidChange
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend((id)objc_opt_class(), "_selectionAndSeparatorColorForDarkMode:", -[UIKeyboardEmojiFamilyConfigurationView usesDarkStyle](self, "usesDarkStyle"));
  v4 = [(UIKeyboardEmojiFamilyConfigurationView *)self separatorView];
  [v4 setBackgroundColor:v3];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = [(UIKeyboardEmojiFamilyConfigurationView *)self familyMemberStackViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v20 + 1) + 8 * v9);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        v11 = objc_msgSend(v10, "arrangedSubviews", 0);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v17;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v17 != v14) {
                objc_enumerationMutation(v11);
              }
              [*(id *)(*((void *)&v16 + 1) + 8 * v15++) setSelectionBackgroundColor:v3];
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }
}

- (void)_configureSkinToneVariantSpecifiersForBaseString:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  v27 = getEMFSkinToneSpecifierTypeFitzpatrickSilhouette_0();
  v24 = v3;
  v5 = [getEMFStringUtilitiesClass_1() _skinToneChooserVariantsForString:v3];
  if ([v5 count])
  {
    uint64_t v6 = 0;
    unsigned int v7 = 0;
    v25 = v5;
    uint64_t v26 = v4;
    do
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v9 = [v5 objectAtIndexedSubscript:v6];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (!v10) {
        goto LABEL_20;
      }
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [getEMFStringUtilitiesClass_1() _skinToneSpecifiersForString:*(void *)(*((void *)&v29 + 1) + 8 * v13)];
          if ([(UIKeyboardEmojiFamilyConfigurationView *)self hasSplitFontSupport])
          {
            id v15 = [v14 firstObject];
            goto LABEL_14;
          }
          if (v7 == 1)
          {
            id v15 = v27;
LABEL_14:
            long long v16 = v15;
            id v17 = [v14 firstObject];
LABEL_15:
            long long v18 = v17;
            goto LABEL_16;
          }
          if (!v7)
          {
            long long v16 = [v14 firstObject];
            id v17 = v27;
            goto LABEL_15;
          }
          long long v16 = 0;
          long long v18 = 0;
LABEL_16:
          v33[0] = v16;
          v33[1] = v18;
          long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
          [v8 addObject:v19];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v20 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
        uint64_t v11 = v20;
      }
      while (v20);
LABEL_20:

      v4 = v26;
      [v26 addObject:v8];

      v5 = v25;
      uint64_t v6 = ++v7;
    }
    while ([v25 count] > (unint64_t)v7);
  }
  [(UIKeyboardEmojiFamilyConfigurationView *)self setBaseEmojiString:v24];
  [(UIKeyboardEmojiFamilyConfigurationView *)self setSkinToneVariantRows:v4];
  if ([(UIKeyboardEmojiFamilyConfigurationView *)self hasSplitFontSupport]) {
    -[UIKeyboardEmojiFamilyConfigurationView setVariantDisplayRows:](self, "setVariantDisplayRows:", [getEMFStringUtilitiesClass_1() performSelector:sel__coupleSkinToneChooserVariantsForString_ withObject:v24]);
  }
  long long v21 = [MEMORY[0x1E4F1CA48] array];
  if ([v4 count])
  {
    unint64_t v22 = 0;
    do
    {
      [(NSMutableArray *)v21 addObject:&unk_1ED3F7518];
      ++v22;
    }
    while (v22 < [v4 count]);
  }
  selectedVariantIndices = self->_selectedVariantIndices;
  self->_selectedVariantIndices = v21;

  [(UIKeyboardEmojiFamilyConfigurationView *)self _configureFamilyMemberWellStackViews];
}

- (void)_configureFamilyMemberWellStackViews
{
  id v3 = [(UIKeyboardEmojiFamilyConfigurationView *)self baseEmojiString];

  if (v3)
  {
    if ([(UIKeyboardEmojiFamilyConfigurationView *)self hasSplitFontSupport])
    {
      v4 = [(UIKeyboardEmojiFamilyConfigurationView *)self variantDisplayRows];
      uint64_t v5 = [v4 count];

      if (v5)
      {
        unint64_t v6 = 0;
        do
        {
          unsigned int v7 = [(UIKeyboardEmojiFamilyConfigurationView *)self variantDisplayRows];
          uint64_t v8 = [v7 objectAtIndex:v6];

          uint64_t v24 = 0;
          v25 = &v24;
          uint64_t v26 = 0x3032000000;
          v27 = __Block_byref_object_copy__240;
          v28 = __Block_byref_object_dispose__240;
          id v29 = [MEMORY[0x1E4F1CA48] array];
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __78__UIKeyboardEmojiFamilyConfigurationView__configureFamilyMemberWellStackViews__block_invoke;
          v23[3] = &unk_1E52E5848;
          v23[5] = &v24;
          v23[6] = v6;
          v23[4] = self;
          [v8 enumerateObjectsUsingBlock:v23];
          uint64_t v9 = [UIStackView alloc];
          uint64_t v10 = [(UIStackView *)v9 initWithArrangedSubviews:v25[5]];
          uint64_t v11 = [(UIView *)v10 heightAnchor];
          uint64_t v12 = [v11 constraintEqualToConstant:50.0];
          [v12 setActive:1];

          LODWORD(v13) = 1148829696;
          [(UIView *)v10 setContentCompressionResistancePriority:1 forAxis:v13];
          [(UIStackView *)v10 setAxis:0];
          [(UIStackView *)v10 setDistribution:1];
          uint64_t v14 = [(UIKeyboardEmojiFamilyConfigurationView *)self familyMemberStackViews];
          [v14 addObject:v10];

          [(UIView *)self addSubview:v10];
          _Block_object_dispose(&v24, 8);

          ++v6;
          id v15 = [(UIKeyboardEmojiFamilyConfigurationView *)self variantDisplayRows];
          unint64_t v16 = [v15 count];
        }
        while (v6 < v16);
      }
    }
    else
    {
      id v17 = [(UIKeyboardEmojiFamilyConfigurationView *)self skinToneVariantRows];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __78__UIKeyboardEmojiFamilyConfigurationView__configureFamilyMemberWellStackViews__block_invoke_2;
      v22[3] = &unk_1E53104D8;
      v22[4] = self;
      [v17 enumerateObjectsUsingBlock:v22];
    }
    long long v18 = [(UIKeyboardEmojiFamilyConfigurationView *)self baseEmojiString];
    long long v19 = [(UIKeyboardEmojiFamilyConfigurationView *)self neutralWellView];
    [v19 setStringRepresentation:v18];

    uint64_t v20 = [(UIKeyboardEmojiFamilyConfigurationView *)self baseEmojiString];
    LODWORD(v18) = +[UIKeyboardEmoji shouldHighlightEmoji:v20];

    if (v18)
    {
      long long v21 = [(UIKeyboardEmojiFamilyConfigurationView *)self neutralWellView];
      [v21 setUnreleasedHighlight:1];
    }
    [(UIKeyboardEmojiFamilyConfigurationView *)self _updatePreviewWellForCurrentSelection];
  }
}

void __78__UIKeyboardEmojiFamilyConfigurationView__configureFamilyMemberWellStackViews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = [UIKeyboardEmojiWellView alloc];
  uint64_t v10 = -[UIKeyboardEmojiWellView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  unsigned int v7 = objc_msgSend((id)objc_opt_class(), "_selectionAndSeparatorColorForDarkMode:", objc_msgSend(*(id *)(a1 + 32), "usesDarkStyle"));
  [(UIKeyboardEmojiWellView *)v10 setSelectionBackgroundColor:v7];

  if (*(void *)(a1 + 48)) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  [(UIKeyboardEmojiWellView *)v10 setStringRepresentation:v5 silhouette:v8];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v10];
  uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:*(void *)(a1 + 48)];
  [(UIKeyboardEmojiWellView *)v10 setAssociatedIndexPath:v9];
}

void __78__UIKeyboardEmojiFamilyConfigurationView__configureFamilyMemberWellStackViews__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  unint64_t v16 = __Block_byref_object_copy__240;
  id v17 = __Block_byref_object_dispose__240;
  id v18 = [MEMORY[0x1E4F1CA48] array];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__UIKeyboardEmojiFamilyConfigurationView__configureFamilyMemberWellStackViews__block_invoke_3;
  v12[3] = &unk_1E53104B0;
  v12[4] = *(void *)(a1 + 32);
  v12[5] = &v13;
  v12[6] = a3;
  [v5 enumerateObjectsUsingBlock:v12];
  unint64_t v6 = [UIStackView alloc];
  unsigned int v7 = [(UIStackView *)v6 initWithArrangedSubviews:v14[5]];
  uint64_t v8 = [(UIView *)v7 heightAnchor];
  uint64_t v9 = [v8 constraintEqualToConstant:50.0];
  [v9 setActive:1];

  LODWORD(v10) = 1148846080;
  [(UIView *)v7 setContentCompressionResistancePriority:1 forAxis:v10];
  [(UIStackView *)v7 setAxis:0];
  [(UIStackView *)v7 setDistribution:1];
  uint64_t v11 = [*(id *)(a1 + 32) familyMemberStackViews];
  [v11 addObject:v7];

  [*(id *)(a1 + 32) addSubview:v7];
  _Block_object_dispose(&v13, 8);
}

void __78__UIKeyboardEmojiFamilyConfigurationView__configureFamilyMemberWellStackViews__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  unsigned int v7 = [v5 baseEmojiString];
  uint64_t v8 = [v6 objectAtIndexedSubscript:0];
  uint64_t v9 = [v6 objectAtIndexedSubscript:1];

  UIKBImageSetForCoupleCharacter(v7, v8, v9);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  double v10 = [UIKeyboardEmojiWellView alloc];
  uint64_t v11 = -[UIKeyboardEmojiWellView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v12 = objc_msgSend((id)objc_opt_class(), "_selectionAndSeparatorColorForDarkMode:", objc_msgSend(*(id *)(a1 + 32), "usesDarkStyle"));
  [(UIKeyboardEmojiWellView *)v11 setSelectionBackgroundColor:v12];

  uint64_t v13 = [v15 array];
  [(UIKeyboardEmojiWellView *)v11 setCompositeImageRepresentation:v13];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v11];
  uint64_t v14 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:*(void *)(a1 + 48)];
  [(UIKeyboardEmojiWellView *)v11 setAssociatedIndexPath:v14];
}

- (id)_wellViewForSection:(int64_t)a3 item:(int64_t)a4
{
  unsigned int v7 = [(UIKeyboardEmojiFamilyConfigurationView *)self familyMemberStackViews];
  unint64_t v8 = [v7 count];

  if (v8 < a3) {
    goto LABEL_3;
  }
  uint64_t v9 = [(UIKeyboardEmojiFamilyConfigurationView *)self familyMemberStackViews];
  double v10 = [v9 objectAtIndexedSubscript:a3];
  uint64_t v11 = [v10 arrangedSubviews];
  unint64_t v12 = [v11 count];

  if (v12 >= a4)
  {
    uint64_t v14 = [(UIKeyboardEmojiFamilyConfigurationView *)self familyMemberStackViews];
    id v15 = [v14 objectAtIndexedSubscript:a3];
    unint64_t v16 = [v15 arrangedSubviews];
    uint64_t v13 = [v16 objectAtIndexedSubscript:a4];
  }
  else
  {
LABEL_3:
    uint64_t v13 = 0;
  }
  return v13;
}

- (unint64_t)_silhouetteFromCurrentSelections
{
  id v3 = [(UIKeyboardEmojiFamilyConfigurationView *)self selectedVariantIndices];
  v4 = [v3 firstObject];
  uint64_t v5 = [v4 integerValue];

  id v6 = [(UIKeyboardEmojiFamilyConfigurationView *)self selectedVariantIndices];
  unsigned int v7 = [v6 lastObject];
  uint64_t v8 = [v7 integerValue];

  unint64_t v9 = 2;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v9 = 3;
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    return v9;
  }
  else {
    return v5 == 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)_currentlySelectedSkinToneConfiguration
{
  id v3 = getEMFSkinToneSpecifierTypeFitzpatrickSilhouette_0();
  uint64_t v8 = 0;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__240;
  unint64_t v12 = __Block_byref_object_dispose__240;
  id v13 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(UIKeyboardEmojiFamilyConfigurationView *)self selectedVariantIndices];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__UIKeyboardEmojiFamilyConfigurationView__currentlySelectedSkinToneConfiguration__block_invoke;
  v7[3] = &unk_1E5310500;
  v7[5] = v3;
  v7[6] = &v8;
  v7[4] = self;
  [v4 enumerateObjectsUsingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __81__UIKeyboardEmojiFamilyConfigurationView__currentlySelectedSkinToneConfiguration__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 integerValue];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    unsigned int v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    [v7 addObject:v6];
  }
  else
  {
    uint64_t v8 = v5;
    unint64_t v9 = [*(id *)(a1 + 32) skinToneVariantRows];
    uint64_t v10 = [v9 objectAtIndexedSubscript:a3];
    uint64_t v11 = [v10 objectAtIndexedSubscript:v8];
    id v12 = [v11 objectAtIndexedSubscript:a3];

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v12];
  }
}

- (void)_setCurrentlySelectedSkinToneConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIKeyboardEmojiFamilyConfigurationView *)self selectedVariantIndices];
  uint64_t v6 = (void *)[v5 mutableCopy];

  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __85__UIKeyboardEmojiFamilyConfigurationView__setCurrentlySelectedSkinToneConfiguration___block_invoke;
  uint64_t v11 = &unk_1E52E57D8;
  id v12 = self;
  id v13 = v6;
  id v7 = v6;
  [v4 enumerateObjectsUsingBlock:&v8];

  -[UIKeyboardEmojiFamilyConfigurationView setSelectedVariantIndices:](self, "setSelectedVariantIndices:", v7, v8, v9, v10, v11, v12);
}

void __85__UIKeyboardEmojiFamilyConfigurationView__setCurrentlySelectedSkinToneConfiguration___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) skinToneVariantRows];
  id v7 = [v6 objectAtIndex:a3];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__UIKeyboardEmojiFamilyConfigurationView__setCurrentlySelectedSkinToneConfiguration___block_invoke_2;
  v9[3] = &unk_1E5310528;
  uint64_t v12 = a3;
  id v10 = v5;
  id v11 = *(id *)(a1 + 40);
  id v8 = v5;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __85__UIKeyboardEmojiFamilyConfigurationView__setCurrentlySelectedSkinToneConfiguration___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 objectAtIndexedSubscript:*(void *)(a1 + 48)];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
    [*(id *)(a1 + 40) setObject:v9 atIndexedSubscript:*(void *)(a1 + 48)];

    *a4 = 1;
  }
}

- (void)setSelectedVariantIndices:(id)a3
{
  id v4 = a3;
  id v5 = self->_selectedVariantIndices;
  uint64_t v6 = [v4 count];
  uint64_t v7 = [(NSMutableArray *)v5 count];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  unint64_t v22 = __68__UIKeyboardEmojiFamilyConfigurationView_setSelectedVariantIndices___block_invoke;
  long long v23 = &unk_1E5310578;
  uint64_t v24 = self;
  int v8 = (NSMutableArray *)v4;
  v25 = v8;
  uint64_t v9 = (void (**)(void *, NSMutableArray *, void))_Block_copy(&v20);
  v9[2](v9, v5, 0);
  if (v6 == v7)
  {
    v9[2](v9, v8, 1);
    id v10 = v8;
    selectedVariantIndices = self->_selectedVariantIndices;
    self->_selectedVariantIndices = v10;
  }
  else
  {
    uint64_t v12 = [(NSMutableArray *)v8 count];
    if ((unint64_t)(v12 - [(NSMutableArray *)v5 count]) >= 2)
    {
      do
      {
        [(NSMutableArray *)v8 removeLastObject];
        uint64_t v13 = [(NSMutableArray *)v8 count];
      }
      while ((unint64_t)(v13 - [(NSMutableArray *)v5 count]) > 1);
    }
    [(UIKeyboardEmojiFamilyConfigurationView *)self _updateBottomRowForSelections:v8];
    -[NSMutableArray subarrayWithRange:](v8, "subarrayWithRange:", 0, [(NSMutableArray *)v8 count] - 1);
    selectedVariantIndices = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, selectedVariantIndices, 1);
    uint64_t v14 = (NSMutableArray *)[(NSMutableArray *)selectedVariantIndices mutableCopy];
    id v15 = self->_selectedVariantIndices;
    self->_selectedVariantIndices = v14;
  }
  [(UIKeyboardEmojiFamilyConfigurationView *)self _updatePreviewWellForCurrentSelection];
  unint64_t v16 = [(UIKeyboardEmojiFamilyConfigurationView *)self representedKey];
  id v17 = [v16 selectedVariantIndices];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    long long v19 = [(UIKeyboardEmojiFamilyConfigurationView *)self representedKey];
    [v19 setSelectedVariantIndices:v8];
  }
}

void __68__UIKeyboardEmojiFamilyConfigurationView_setSelectedVariantIndices___block_invoke(uint64_t a1, void *a2, char a3)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__UIKeyboardEmojiFamilyConfigurationView_setSelectedVariantIndices___block_invoke_2;
  v6[3] = &unk_1E5310550;
  id v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  char v8 = a3;
  [a2 enumerateObjectsUsingBlock:v6];
}

void __68__UIKeyboardEmojiFamilyConfigurationView_setSelectedVariantIndices___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 integerValue];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = v5;
    id v7 = [*(id *)(a1 + 32) skinToneVariantRows];
    char v8 = [v7 objectAtIndex:a3];
    unint64_t v9 = [v8 count] - 1;

    if (v6 > v9)
    {
      id v10 = *(void **)(a1 + 40);
      id v11 = [NSNumber numberWithInteger:0];
      [v10 replaceObjectAtIndex:a3 withObject:v11];

      unint64_t v6 = 0;
    }
    id v12 = [*(id *)(a1 + 32) _wellViewForSection:a3 item:v6];
    [v12 setSelected:*(unsigned __int8 *)(a1 + 48)];
  }
}

- (void)_updateBottomRowForSelections:(id)a3
{
  id v31 = a3;
  id v4 = [v31 lastObject];
  uint64_t v5 = [v4 integerValue];

  unint64_t v6 = [(UIKeyboardEmojiFamilyConfigurationView *)self lastSelectedIndexPath];
  uint64_t v7 = [v6 section];
  uint64_t v8 = [v31 count] - 1;

  if (v7 == v8)
  {
    unint64_t v9 = [(UIKeyboardEmojiFamilyConfigurationView *)self lastSelectedIndexPath];
    uint64_t v10 = [v9 item];

    if (v5 == v10)
    {
      id v11 = objc_msgSend(v31, "subarrayWithRange:", 0, objc_msgSend(v31, "count") - 1);
      id v12 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v13 = [v11 lastObject];
      uint64_t v14 = objc_msgSend(v12, "indexPathForRow:inSection:", objc_msgSend(v13, "integerValue"), objc_msgSend(v11, "count") - 1);
      [(UIKeyboardEmojiFamilyConfigurationView *)self setLastSelectedIndexPath:v14];

      id v15 = [(UIKeyboardEmojiFamilyConfigurationView *)self neutralWellView];
      [v15 setActiveSelection:0];

      unint64_t v16 = [(UIKeyboardEmojiFamilyConfigurationView *)self configuredWellView];
      [v16 setActiveSelection:0];

      goto LABEL_18;
    }
    uint64_t v25 = v5 & 1;
    if (v5 < 0) {
      uint64_t v25 = -v25;
    }
    if (v25 == 1) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = v5;
    }
    if (v25) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = 0;
    }
    v28 = [(UIKeyboardEmojiFamilyConfigurationView *)self neutralWellView];
    [v28 setActiveSelection:v27 == 0];

    id v29 = [(UIKeyboardEmojiFamilyConfigurationView *)self configuredWellView];
    [v29 setActiveSelection:v27 == 1];

    long long v30 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v22 = [v31 count] - 1;
    long long v23 = v30;
    uint64_t v24 = v27;
  }
  else
  {
    id v17 = [(UIKeyboardEmojiFamilyConfigurationView *)self neutralWellView];
    uint64_t v18 = v17;
    if (v5 >= 0) {
      uint64_t v19 = v5 & 1;
    }
    else {
      uint64_t v19 = -(v5 & 1);
    }
    [v17 setActiveSelection:v5 == 0];

    uint64_t v20 = [(UIKeyboardEmojiFamilyConfigurationView *)self configuredWellView];
    [v20 setActiveSelection:v5 == 1];

    uint64_t v21 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v22 = [v31 count] - 1;
    long long v23 = v21;
    uint64_t v24 = v19;
  }
  id v11 = [v23 indexPathForRow:v24 inSection:v22];
  [(UIKeyboardEmojiFamilyConfigurationView *)self setLastSelectedIndexPath:v11];
LABEL_18:
}

- (void)_updatePreviewWellForCurrentSelection
{
  id v13 = [(UIKeyboardEmojiFamilyConfigurationView *)self _currentlySelectedSkinToneConfiguration];
  if (![(UIKeyboardEmojiFamilyConfigurationView *)self hasSplitFontSupport])
  {
    unint64_t v9 = [(UIKeyboardEmojiFamilyConfigurationView *)self baseEmojiString];
    uint64_t v10 = [v13 objectAtIndexedSubscript:0];
    id v11 = [v13 objectAtIndexedSubscript:1];
    unint64_t v6 = UIKBImageSetForCoupleCharacter(v9, v10, v11);

    uint64_t v8 = [(UIKeyboardEmojiFamilyConfigurationView *)self configuredWellView];
    id v12 = [v6 array];
    [v8 setCompositeImageRepresentation:v12];

    goto LABEL_6;
  }
  unint64_t v3 = [(UIKeyboardEmojiFamilyConfigurationView *)self _silhouetteFromCurrentSelections];
  id EMFStringUtilitiesClass_1 = getEMFStringUtilitiesClass_1();
  uint64_t v5 = [(UIKeyboardEmojiFamilyConfigurationView *)self baseEmojiString];
  unint64_t v6 = [EMFStringUtilitiesClass_1 _multiPersonStringForString:v5 skinToneVariantSpecifier:v13];

  uint64_t v7 = [(UIKeyboardEmojiFamilyConfigurationView *)self configuredWellView];
  [v7 setStringRepresentation:v6 silhouette:v3];

  if (!v3 && +[UIKeyboardEmoji shouldHighlightEmoji:v6])
  {
    uint64_t v8 = [(UIKeyboardEmojiFamilyConfigurationView *)self configuredWellView];
    [v8 setUnreleasedHighlight:1];
LABEL_6:
  }
}

- (BOOL)_hasCompletelyConfiguredSkinToneConfiguration
{
  unint64_t v3 = getEMFSkinToneSpecifierTypeFitzpatrickSilhouette_0();
  id v4 = [(UIKeyboardEmojiFamilyConfigurationView *)self _currentlySelectedSkinToneConfiguration];
  char v5 = [v4 containsObject:v3] ^ 1;

  return v5;
}

- (void)_updateReferencedKeySelectedVariantIndexBasedOnCurrentConfiguration
{
  if ([(UIKeyboardEmojiFamilyConfigurationView *)self _hasCompletelyConfiguredSkinToneConfiguration])
  {
    unint64_t v3 = [(UIKeyboardEmojiFamilyConfigurationView *)self _currentlySelectedSkinToneConfiguration];
    id EMFStringUtilitiesClass_1 = getEMFStringUtilitiesClass_1();
    char v5 = [(UIKeyboardEmojiFamilyConfigurationView *)self baseEmojiString];
    unint64_t v6 = [EMFStringUtilitiesClass_1 _multiPersonStringForString:v5 skinToneVariantSpecifier:v3];

    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v7 = [(UIKeyboardEmojiFamilyConfigurationView *)self representedKey];
    uint64_t v8 = [v7 subtrees];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __109__UIKeyboardEmojiFamilyConfigurationView__updateReferencedKeySelectedVariantIndexBasedOnCurrentConfiguration__block_invoke;
    id v15 = &unk_1E52F5468;
    id v9 = v6;
    id v16 = v9;
    id v17 = &v18;
    [v8 enumerateObjectsUsingBlock:&v12];

    uint64_t v10 = v19[3];
    id v11 = [(UIKeyboardEmojiFamilyConfigurationView *)self representedKey];
    [v11 setSelectedVariantIndex:v10];

    _Block_object_dispose(&v18, 8);
  }
}

void __109__UIKeyboardEmojiFamilyConfigurationView__updateReferencedKeySelectedVariantIndexBasedOnCurrentConfiguration__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 representedString];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)_beginFamilyMetachronalRhythmAnimation
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = getEMFSkinToneSpecifierTypeFitzpatrickSilhouette_0();
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v5 = v4;
  if (v4 - self->_metachronalRhythmAnimationStartTime >= 0.25)
  {
    unint64_t v6 = [(UIKeyboardEmojiFamilyConfigurationView *)self _currentlySelectedSkinToneConfiguration];
    uint64_t v7 = [v6 count];
    int v8 = [(UIKeyboardEmojiFamilyConfigurationView *)self familyMemberStackViews];
    uint64_t v9 = [v8 count];

    if (v7 == v9)
    {
      if ([v6 count])
      {
        unint64_t v10 = 0;
        double v11 = 0.0;
        uint64_t v25 = self;
        uint64_t v26 = v3;
        uint64_t v24 = v6;
        do
        {
          uint64_t v12 = [v6 objectAtIndexedSubscript:v10];
          if ([v12 isEqualToString:v3])
          {
            v28 = v12;
            uint64_t v13 = [(UIKeyboardEmojiFamilyConfigurationView *)self familyMemberStackViews];
            unint64_t v29 = v10;
            uint64_t v14 = [v13 objectAtIndexedSubscript:v10];

            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            uint64_t v27 = v14;
            id v15 = [v14 arrangedSubviews];
            uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v33;
              double v19 = v11;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v33 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8 * i);
                  aBlock[0] = MEMORY[0x1E4F143A8];
                  aBlock[1] = 3221225472;
                  aBlock[2] = __80__UIKeyboardEmojiFamilyConfigurationView__beginFamilyMetachronalRhythmAnimation__block_invoke;
                  aBlock[3] = &unk_1E52D9F70;
                  aBlock[4] = v21;
                  uint64_t v22 = _Block_copy(aBlock);
                  v30[0] = MEMORY[0x1E4F143A8];
                  v30[1] = 3221225472;
                  v30[2] = __80__UIKeyboardEmojiFamilyConfigurationView__beginFamilyMetachronalRhythmAnimation__block_invoke_2;
                  v30[3] = &unk_1E52D9F70;
                  v30[4] = v21;
                  long long v23 = _Block_copy(v30);
                  +[UIView animateWithDuration:0 delay:v22 options:0 animations:0.25 completion:v19];
                  +[UIView animateWithDuration:4 delay:v23 usingSpringWithDamping:0 initialSpringVelocity:1.25 options:v19 + 0.25 animations:0.4 completion:0.5];
                  double v19 = v19 + 0.05;
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
              }
              while (v17);
            }

            double v11 = v11 + 0.0825;
            self = v25;
            unint64_t v3 = v26;
            unint64_t v6 = v24;
            uint64_t v12 = v28;
            unint64_t v10 = v29;
          }

          ++v10;
        }
        while (v10 < [v6 count]);
      }
      self->_metachronalRhythmAnimationStartTime = v5;
    }
  }
}

uint64_t __80__UIKeyboardEmojiFamilyConfigurationView__beginFamilyMetachronalRhythmAnimation__block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 1.2, 1.2);
  v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

uint64_t __80__UIKeyboardEmojiFamilyConfigurationView__beginFamilyMetachronalRhythmAnimation__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

- (void)layoutSubviews
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)UIKeyboardEmojiFamilyConfigurationView;
  [(UIView *)&v20 layoutSubviews];
  [(UIView *)self bounds];
  CGRect v24 = CGRectInset(v23, 16.0, 0.0);
  double x = v24.origin.x;
  double width = v24.size.width;
  double height = v24.size.height;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v6 = [(UIKeyboardEmojiFamilyConfigurationView *)self familyMemberStackViews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    double MaxY = 6.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "setFrame:", x, MaxY, width, 50.0);
        [v12 frame];
        double MaxY = CGRectGetMaxY(v25);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v8);
    double v13 = MaxY + 8.0;
  }
  else
  {
    double v13 = 14.0;
  }

  uint64_t v14 = [(UIKeyboardEmojiFamilyConfigurationView *)self separatorView];
  objc_msgSend(v14, "setFrame:", x, v13, width, 1.0);

  id v15 = [(UIKeyboardEmojiFamilyConfigurationView *)self previewWellStackView];
  objc_msgSend(v15, "setFrame:", x, v13 + 9.0, width, height - (v13 + 9.0) + -6.0);
}

+ (CGSize)preferredContentViewSizeForKey:(id)a3 withTraits:(id)a4
{
  double v4 = 262.0;
  double v5 = 199.0;
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (BOOL)retestSelectedVariantIndexForKey:(id)a3 atPoint:(CGPoint)a4 phase:(int64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  if (a5 == 3)
  {
    -[UIKeyboardEmojiFamilyConfigurationView retestForTouchUpSelectedVariantIndexForKey:atPoint:](self, "retestForTouchUpSelectedVariantIndexForKey:atPoint:", v9, x, y);
  }
  else if (!a5)
  {
    -[UIKeyboardEmojiFamilyConfigurationView retestSelectedVariantIndexForKey:atPoint:](self, "retestSelectedVariantIndexForKey:atPoint:", v9, x, y);
  }

  return 0;
}

- (void)retestSelectedVariantIndexForKey:(id)a3 atPoint:(CGPoint)a4
{
  uint64_t v5 = -[UIView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a4.x, a4.y);
  if (!v5) {
    return;
  }
  unint64_t v6 = (void *)v5;
  while (1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    uint64_t v7 = [v6 superview];

    unint64_t v6 = (void *)v7;
    if (!v7) {
      return;
    }
  }
  id v20 = v6;
  id v8 = [(UIKeyboardEmojiFamilyConfigurationView *)self configuredWellView];

  if (v20 == v8)
  {
    [(UIKeyboardEmojiFamilyConfigurationView *)self _updateReferencedKeySelectedVariantIndexBasedOnCurrentConfiguration];
    if (![(UIKeyboardEmojiFamilyConfigurationView *)self _hasCompletelyConfiguredSkinToneConfiguration])goto LABEL_15; {
    uint64_t v14 = v20;
    }
LABEL_14:
    [v14 setSelected:1];
    goto LABEL_15;
  }
  id v9 = [(UIKeyboardEmojiFamilyConfigurationView *)self neutralWellView];

  if (v20 == v9)
  {
    id v15 = [(UIKeyboardEmojiFamilyConfigurationView *)self representedKey];
    [v15 setSelectedVariantIndex:0];

    long long v16 = [(UIKeyboardEmojiFamilyConfigurationView *)self representedKey];
    long long v17 = [v16 selectedVariantIndices];
    uint64_t v18 = [v17 count];

    if (v18)
    {
      long long v19 = [(UIKeyboardEmojiFamilyConfigurationView *)self representedKey];
      [v19 setSelectedVariantIndices:&unk_1ED3F18E8];
    }
    uint64_t v14 = v20;
    goto LABEL_14;
  }
  [v20 setSelected:1];
  unint64_t v10 = [v20 associatedIndexPath];
  double v11 = [(UIKeyboardEmojiFamilyConfigurationView *)self selectedVariantIndices];
  uint64_t v12 = (void *)[v11 mutableCopy];

  double v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "item"));
  objc_msgSend(v12, "setObject:atIndexedSubscript:", v13, objc_msgSend(v10, "section"));

  [(UIKeyboardEmojiFamilyConfigurationView *)self setSelectedVariantIndices:v12];
LABEL_15:
}

- (void)retestForTouchUpSelectedVariantIndexForKey:(id)a3 atPoint:(CGPoint)a4
{
  id v9 = -[UIView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a4.x, a4.y);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v6 = v9;
  if (isKindOfClass)
  {
    id v7 = v9;
    id v8 = [(UIKeyboardEmojiFamilyConfigurationView *)self configuredWellView];

    if (v7 == v8
      && !-[UIKeyboardEmojiFamilyConfigurationView _hasCompletelyConfiguredSkinToneConfiguration](self, "_hasCompletelyConfiguredSkinToneConfiguration")&& ([v7 isSelected] & 1) == 0)
    {
      [(UIKeyboardEmojiFamilyConfigurationView *)self _beginFamilyMetachronalRhythmAnimation];
    }

    unint64_t v6 = v9;
  }
}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
  id v17 = a4;
  [v17 setSelectedVariantIndex:0x7FFFFFFFFFFFFFFFLL];
  [(UIKeyboardEmojiFamilyConfigurationView *)self setRepresentedKey:v17];
  uint64_t v5 = [v17 selectedVariantIndices];
  if ([v5 count])
  {
    unint64_t v6 = [v17 selectedVariantIndices];
    id v7 = [v6 firstObject];
    uint64_t v8 = [v7 integerValue];

    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = [v17 selectedVariantIndices];
      unint64_t v10 = (void *)[v9 mutableCopy];
      [(UIKeyboardEmojiFamilyConfigurationView *)self setSelectedVariantIndices:v10];

      [(UIKeyboardEmojiFamilyConfigurationView *)self _updateReferencedKeySelectedVariantIndexBasedOnCurrentConfiguration];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id EMFStringUtilitiesClass_1 = getEMFStringUtilitiesClass_1();
  uint64_t v12 = [v17 representedString];
  double v13 = [EMFStringUtilitiesClass_1 _baseStringForEmojiString:v12];

  [(UIKeyboardEmojiFamilyConfigurationView *)self _configureSkinToneVariantSpecifiersForBaseString:v13];
  id v14 = getEMFStringUtilitiesClass_1();
  id v15 = [v17 representedString];
  long long v16 = [v14 _skinToneSpecifiersForString:v15];

  [(UIKeyboardEmojiFamilyConfigurationView *)self _setCurrentlySelectedSkinToneConfiguration:v16];
LABEL_6:
}

- (void)updateRenderConfig:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIKeyboardEmojiFamilyConfigurationView *)self usesDarkStyle];
  int v6 = [v4 lightKeyboard];

  [(UIKeyboardEmojiFamilyConfigurationView *)self setUsesDarkStyle:v6 ^ 1u];
  if (v5 != [(UIKeyboardEmojiFamilyConfigurationView *)self usesDarkStyle])
  {
    [(UIKeyboardEmojiFamilyConfigurationView *)self _colorConfigurationDidChange];
  }
}

- (id)nextResponder
{
  unint64_t v3 = [(UIKeyboardEmojiFamilyConfigurationView *)self touchForwardingView];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIKeyboardEmojiFamilyConfigurationView;
    id v5 = [(UIView *)&v8 nextResponder];
  }
  int v6 = v5;

  return v6;
}

- (UIView)touchForwardingView
{
  return self->_touchForwardingView;
}

- (void)setTouchForwardingView:(id)a3
{
}

- (BOOL)usesDarkStyle
{
  return self->_usesDarkStyle;
}

- (void)setUsesDarkStyle:(BOOL)a3
{
  self->_usesDarkStyle = a3;
}

- (NSMutableArray)familyMemberStackViews
{
  return self->_familyMemberStackViews;
}

- (void)setFamilyMemberStackViews:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (UIStackView)previewWellStackView
{
  return self->_previewWellStackView;
}

- (void)setPreviewWellStackView:(id)a3
{
}

- (UIKeyboardEmojiWellView)neutralWellView
{
  return self->_neutralWellView;
}

- (void)setNeutralWellView:(id)a3
{
}

- (UIKeyboardEmojiWellView)configuredWellView
{
  return self->_configuredWellView;
}

- (void)setConfiguredWellView:(id)a3
{
}

- (NSIndexPath)lastSelectedIndexPath
{
  return self->_lastSelectedIndexPath;
}

- (void)setLastSelectedIndexPath:(id)a3
{
}

- (NSString)baseEmojiString
{
  return self->_baseEmojiString;
}

- (void)setBaseEmojiString:(id)a3
{
}

- (NSMutableArray)selectedVariantIndices
{
  return self->_selectedVariantIndices;
}

- (NSArray)skinToneVariantRows
{
  return self->_skinToneVariantRows;
}

- (void)setSkinToneVariantRows:(id)a3
{
}

- (NSArray)variantDisplayRows
{
  return self->_variantDisplayRows;
}

- (void)setVariantDisplayRows:(id)a3
{
}

- (UIKBTree)representedKey
{
  return self->_representedKey;
}

- (void)setRepresentedKey:(id)a3
{
}

- (BOOL)hasSplitFontSupport
{
  return self->_hasSplitFontSupport;
}

- (void)setHasSplitFontSupport:(BOOL)a3
{
  self->_hasSplitFontSupport = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedKey, 0);
  objc_storeStrong((id *)&self->_variantDisplayRows, 0);
  objc_storeStrong((id *)&self->_skinToneVariantRows, 0);
  objc_storeStrong((id *)&self->_selectedVariantIndices, 0);
  objc_storeStrong((id *)&self->_baseEmojiString, 0);
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_configuredWellView, 0);
  objc_storeStrong((id *)&self->_neutralWellView, 0);
  objc_storeStrong((id *)&self->_previewWellStackView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_familyMemberStackViews, 0);
  objc_storeStrong((id *)&self->_touchForwardingView, 0);
}

@end