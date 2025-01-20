@interface UITableViewCellLayoutManager
+ (BOOL)requiresLegacyLayout;
+ (id)_externalDetailTextColor;
+ (id)_externalTextColor;
+ (id)layoutManagerForTableViewCellStyle:(int64_t)a3;
+ (id)sharedLayoutManager;
+ (void)initialize;
- (BOOL)_editControlOnSameSideAsReorderControlForCell:(id)a3;
- (BOOL)accessoryShouldAppearForCell:(id)a3;
- (BOOL)accessoryShouldFadeForCell:(id)a3;
- (BOOL)editControlShouldAppearForCell:(id)a3;
- (BOOL)editControlShouldFadeForCell:(id)a3;
- (BOOL)editingAccessoryShouldAppearForCell:(id)a3;
- (BOOL)editingAccessoryShouldFadeForCell:(id)a3;
- (BOOL)reorderControlShouldAppearForCell:(id)a3;
- (BOOL)reorderControlShouldFadeForCell:(id)a3;
- (BOOL)reorderSeparatorShouldAppearForCell:(id)a3;
- (BOOL)reorderSeparatorShouldFadeForCell:(id)a3;
- (BOOL)shouldApplyAccessibilityLargeTextLayoutForCell:(id)a3;
- (BOOL)shouldIncreaseMarginForImageViewInCell:(id)a3;
- (BOOL)shouldStackAccessoryViewVerticallyForCell:(id)a3 editing:(BOOL)a4;
- (CGRect)_accessoryRectForCell:(id)a3 offscreen:(BOOL)a4;
- (CGRect)_accessoryRectForCell:(id)a3 offscreen:(BOOL)a4 rowWidth:(double)a5;
- (CGRect)_adjustedBackgroundContentRectForCell:(id)a3;
- (CGRect)_adjustedBackgroundContentRectForCell:(id)a3 rowWidth:(double)a4;
- (CGRect)_adjustedBackgroundRectForCell:(id)a3;
- (CGRect)_adjustedBackgroundRectForCell:(id)a3 rowWidth:(double)a4;
- (CGRect)_backgroundRectForCell:(id)a3;
- (CGRect)_backgroundRectForCell:(id)a3 rowWidth:(double)a4;
- (CGRect)_contentRectForCell:(id)a3 forEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5;
- (CGRect)_contentRectForCell:(id)a3 forEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5 rowWidth:(double)a6;
- (CGRect)_editControlRectForCell:(id)a3 offscreen:(BOOL)a4;
- (CGRect)_editingAccessoryRectForCell:(id)a3 offscreen:(BOOL)a4;
- (CGRect)_legacy_contentRectForCell:(id)a3 forEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5 rowWidth:(double)a6;
- (CGRect)_reorderControlRectForCell:(id)a3 offscreen:(BOOL)a4;
- (CGRect)_reorderSeparatorRectForCell:(id)a3 offscreen:(BOOL)a4;
- (CGRect)accessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5;
- (CGRect)accessoryStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5;
- (CGRect)contentEndingRectForCell:(id)a3 forDisplayOfDeleteConfirmation:(BOOL)a4;
- (CGRect)contentEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4;
- (CGRect)contentRectForCell:(id)a3 forState:(unint64_t)a4;
- (CGRect)contentRectForCell:(id)a3 forState:(unint64_t)a4 rowWidth:(double)a5;
- (CGRect)contentStartingRectForCell:(id)a3 forDisplayOfDeleteConfirmation:(BOOL)a4;
- (CGRect)contentStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4;
- (CGRect)editControlEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4;
- (CGRect)editingAccessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5;
- (CGRect)editingAccessoryStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5;
- (CGRect)reorderControlEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5;
- (CGRect)reorderControlStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5;
- (CGRect)reorderSeparatorEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5;
- (CGRect)reorderSeparatorStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5;
- (CGRect)selectedBackgroundEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4;
- (CGRect)standardLayoutImageViewFrameForCell:(id)a3 forSizing:(BOOL)a4;
- (CGRect)textRectForCell:(id)a3;
- (CGRect)textRectForCell:(id)a3 rowWidth:(double)a4;
- (CGRect)textRectForCell:(id)a3 rowWidth:(double)a4 forSizing:(BOOL)a5;
- (CGSize)intrinsicContentSizeForCell:(id)a3 rowWidth:(double)a4;
- (CGSize)optimumSizeForLabel:(id)a3 inTotalTextRect:(CGRect)a4 minimizeWidthOnVerticalOverflow:(BOOL)a5 preferSingleLineWidth:(BOOL)a6;
- (double)_contentRectLeadingOffsetForCell:(id)a3 editingState:(BOOL)a4 rowWidth:(double)a5;
- (double)contentIndentationForCell:(id)a3;
- (double)defaultTextLabelFontSizeForCell:(id)a3;
- (double)requiredIndentationForFirstLineOfCell:(id)a3 rowWidth:(double)a4;
- (double)requiredIndentationForFirstLineOfCell:(id)a3 rowWidth:(double)a4 forSizing:(BOOL)a5;
- (id)customAccessoryViewForCell:(id)a3 editing:(BOOL)a4;
- (id)defaultBadgeForCell:(id)a3;
- (id)defaultDetailTextLabelFontForCell:(id)a3;
- (id)defaultEditableTextFieldForCell:(id)a3;
- (id)defaultImageViewForCell:(id)a3;
- (id)defaultLabelForCell:(id)a3;
- (id)defaultLabelForCell:(id)a3 ofClass:(Class)a4;
- (id)defaultTextLabelFontForCell:(id)a3;
- (id)detailTextLabelForCell:(id)a3;
- (id)editableTextFieldForCell:(id)a3;
- (void)_layoutFocusGuidesForCell:(id)a3;
- (void)_legacy_cell:(id)a3 didTransitionToState:(unint64_t)a4;
- (void)_legacy_cell:(id)a3 willTransitionToState:(unint64_t)a4;
- (void)_legacy_layoutSubviewsOfCell:(id)a3;
- (void)_modern_cell:(id)a3 didTransitionToState:(unint64_t)a4;
- (void)_modern_layoutSubviewsOfCell:(id)a3;
- (void)_reconfigureCell:(id)a3;
- (void)_resetTextLabelDefaultFontInCell:(id)a3;
- (void)_updateFocusGuidesForCell:(id)a3 editing:(BOOL)a4;
- (void)cell:(id)a3 didTransitionToState:(unint64_t)a4;
- (void)cell:(id)a3 willTransitionToState:(unint64_t)a4;
- (void)getTextLabelRect:(CGRect *)a3 detailTextLabelRect:(CGRect *)a4 forCell:(id)a5 rowWidth:(double)a6 forSizing:(BOOL)a7;
- (void)layoutSubviewsOfCell:(id)a3;
@end

@implementation UITableViewCellLayoutManager

- (void)_modern_layoutSubviewsOfCell:(id)a3
{
  [a3 _updateAccessoriesIfNeeded];
  v5 = [a3 _accessoryManager];
  [v5 layoutIfNeeded];

  v6 = [a3 _accessoryManager];
  [v6 contentFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = [a3 contentView];
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  if (_UITableViewCellUsesLayoutMarginBasedContentPadding())
  {
    v16 = [a3 _accessoryManager];
    v17 = [v16 currentConfiguration];

    v18 = [v17 leadingAccessories];
    uint64_t v19 = [v18 count];

    double v20 = 0.0;
    double v21 = 0.0;
    if (v19)
    {
      v22 = [a3 _constants];
      [v22 defaultCellContentLeadingPaddingForSidebar:0];
      double v21 = v23;
    }
    v24 = [v17 trailingAccessories];
    uint64_t v25 = [v24 count];

    if (v25)
    {
      v26 = [a3 _constants];
      [v26 defaultCellContentTrailingPadding];
      double v20 = v27;
    }
    objc_msgSend(a3, "_setOverriddenDefaultContentViewLayoutMargins:", 0.0, v21, 0.0, v20);
  }
  uint64_t v28 = [a3 currentStateMask] & 1;
  v29 = [a3 _badge:0];
  [(UITableViewCellLayoutManager *)self backgroundEndingRectForCell:a3 forNewEditingState:v28];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  v38 = [a3 _backgroundView:1];
  objc_msgSend(v38, "setFrame:", v31, v33, v35, v37);
  v39 = [v38 layer];
  objc_msgSend(v39, "setContentsRect:", 0.0, 0.0, 1.0, 1.0);

  [(UITableViewCellLayoutManager *)self selectedBackgroundEndingRectForCell:a3 forNewEditingState:v28];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  v48 = [a3 _selectedBackgroundView:0];
  objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

  v49 = [a3 _imageView:0];
  v50 = v49;
  if (v49)
  {
    v51 = [v49 image];

    if (v51)
    {
      v52 = [v50 superview];

      if (!v52)
      {
        v53 = [a3 contentView];
        [v53 addSubview:v50];
      }
    }
    else
    {
      [v50 removeFromSuperview];
    }
    v54 = [v50 superview];

    if (v54)
    {
      [(UITableViewCellLayoutManager *)self standardLayoutImageViewFrameForCell:a3 forSizing:0];
      double v56 = v55;
      double v58 = v57;
      double v60 = v59;
      double v62 = v61;
      [v50 frame];
      v94.origin.x = v63;
      v94.origin.y = v64;
      v94.size.width = v65;
      v94.size.height = v66;
      v91.origin.x = v56;
      v91.origin.y = v58;
      v91.size.width = v60;
      v91.size.height = v62;
      BOOL v67 = CGRectEqualToRect(v91, v94);
      objc_msgSend(v50, "setFrame:", v56, v58, v60, v62);
      if (!v67) {
        [a3 _updateSeparatorContent:1];
      }
    }
  }
  v68 = [a3 _textLabel:0];
  unint64_t v69 = (unint64_t)v68;
  if (v68)
  {
    v70 = [v68 font];
    [v70 pointSize];
    double v72 = v71;

    if (v72 == 0.0)
    {
      v73 = [(UITableViewCellLayoutManager *)self defaultTextLabelFontForCell:a3];
      [(id)v69 setFont:v73];
    }
    v74 = [(id)v69 text];
    v75 = v74;
    if (v74 && [v74 length])
    {
      v76 = [(id)v69 superview];

      if (!v76)
      {
        v77 = [a3 contentView];
        [v77 addSubview:v69];
      }
    }
    else
    {
      [(id)v69 removeFromSuperview];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v78 = [(UITableViewCellLayoutManager *)self shouldIncreaseMarginForImageViewInCell:a3];
    double v79 = 0.0;
    if (!v78)
    {
      objc_msgSend(a3, "bounds", 0.0);
      [(UITableViewCellLayoutManager *)self requiredIndentationForFirstLineOfCell:a3 rowWidth:CGRectGetWidth(v92)];
    }
    [(id)v69 _setFirstParagraphFirstLineHeadIndent:v79];
  }
  uint64_t v80 = [a3 _detailTextLabel:0];
  if (v69 | v80)
  {
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    [a3 bounds];
    [(UITableViewCellLayoutManager *)self getTextLabelRect:&v89 detailTextLabelRect:&v87 forCell:a3 rowWidth:0 forSizing:CGRectGetWidth(v93)];
    objc_msgSend((id)v69, "setFrame:", v89, v90);
    objc_msgSend((id)v80, "setFrame:", v87, v88);
  }
  if ([(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:a3])
  {
    [(id)v69 frame];
    [(id)v69 _capOffsetFromBoundsTop];
    v81 = [(id)v69 font];
    [v81 capHeight];
  }
  uint64_t v82 = [v50 superview];
  if (v82)
  {
    v83 = (void *)v82;
    BOOL v84 = [(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:a3];

    if (v84)
    {
      if (![(UITableViewCellLayoutManager *)self shouldIncreaseMarginForImageViewInCell:a3])
      {
        v85 = [a3 contentView];
        [v85 bringSubviewToFront:v50];
      }
      [v50 frame];
      objc_msgSend(v50, "setFrame:");
    }
  }
  if (![a3 style])
  {
    v86 = [a3 _detailTextLabel:0];
    [v86 removeFromSuperview];
  }
  [(UITableViewCellLayoutManager *)self _layoutFocusGuidesForCell:a3];
}

- (BOOL)shouldIncreaseMarginForImageViewInCell:(id)a3
{
  id v4 = a3;
  v5 = [v4 _imageView:0];
  v6 = [v4 _textLabel:0];
  double v7 = [v5 image];

  BOOL v8 = 1;
  if (v7)
  {
    if (v6)
    {
      if ([(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:v4])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 textAlignment] != 1)
        {
          double v9 = [v4 _imageView:0];
          double v10 = [v9 image];
          [v10 size];
          double v12 = v11;

          double v13 = [v4 _textLabel:0];
          double v14 = [v13 font];

          double v15 = v12 * 0.5;
          [v14 capHeight];
          double v17 = v16 * 0.5;
          [v14 ascender];
          double v19 = v18;
          [v14 capHeight];
          if (v15 <= v17 + v19 - v20)
          {
            [v14 capHeight];
            double v22 = v21 * 0.5;
            [v14 descender];
            BOOL v8 = v15 > v22 - v23;
          }
          else
          {
            BOOL v8 = 1;
          }
        }
      }
    }
  }

  return v8;
}

- (BOOL)shouldApplyAccessibilityLargeTextLayoutForCell:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _textLabel:0];
  if (v4)
  {
    v5 = [(id)UIApp preferredContentSizeCategory];
    if (UIContentSizeCategoryIsAccessibilityCategory(v5) && dyld_program_sdk_at_least())
    {
      v6 = [v4 text];
      if ([v6 length])
      {
        double v7 = [v3 traitCollection];
        BOOL v8 = [v7 userInterfaceIdiom] != 3;
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (CGSize)optimumSizeForLabel:(id)a3 inTotalTextRect:(CGRect)a4 minimizeWidthOnVerticalOverflow:(BOOL)a5 preferSingleLineWidth:(BOOL)a6
{
  BOOL v7 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  id v10 = a3;
  uint64_t v11 = [v10 numberOfLines];
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(v10, "sizeThatFits:", width, height);
    double v14 = v13;
    if (v7 && v12 < width) {
      double v15 = v12;
    }
    else {
      double v15 = width;
    }
    if (width < v12) {
      double v12 = width;
    }
    if (v14 <= height) {
      double width = v12;
    }
    else {
      double width = v15;
    }
  }
  else
  {
    [v10 setNumberOfLines:1];
    objc_msgSend(v10, "sizeThatFits:", width, height);
    double v17 = v16;
    double v19 = v18;
    [v10 setNumberOfLines:0];
    objc_msgSend(v10, "sizeThatFits:", width, height);
    double v22 = v19 * (double)v11;
    if (v11 <= 0) {
      double v22 = 3.40282347e38;
    }
    if (v21 >= v22) {
      double v14 = v22;
    }
    else {
      double v14 = v21;
    }
    if (v14 > height || v21 > v14)
    {
      if (width >= v17) {
        double v20 = v17;
      }
      else {
        double v20 = width;
      }
      if (v7) {
        double width = v20;
      }
    }
    else if (v11 == 1 && a6)
    {
      double width = v17;
    }
    else
    {
      double width = v20;
    }
    objc_msgSend(v10, "setNumberOfLines:", v11, v20);
  }

  double v24 = width;
  double v25 = v14;
  result.double height = v25;
  result.double width = v24;
  return result;
}

- (void)_layoutFocusGuidesForCell:(id)a3
{
  id v4 = a3;
  id v3 = [v4 _editingControlsFocusGuide];
  if (v3)
  {
    [v4 bounds];
    objc_msgSend(v3, "_setManualLayoutFrame:");
  }
}

void __139__UITableViewCellLayoutManager_UITableViewCellLayoutManagerStatic___contentRectForCell_forEditingState_showingDeleteConfirmation_rowWidth___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateAccessoriesIfNeeded];
  v2 = [*(id *)(a1 + 32) _accessoryManager];
  [v2 layoutIfNeeded];

  id v8 = [*(id *)(a1 + 32) _accessoryManager];
  [v8 contentFrame];
  id v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
}

- (void)layoutSubviewsOfCell:(id)a3
{
  if ([a3 _usesModernAccessoriesLayout])
  {
    [(UITableViewCellLayoutManager *)self _modern_layoutSubviewsOfCell:a3];
  }
  else
  {
    [(UITableViewCellLayoutManager *)self _legacy_layoutSubviewsOfCell:a3];
  }
}

- (CGRect)_contentRectForCell:(id)a3 forEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5 rowWidth:(double)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  if ([v10 _usesModernAccessoriesLayout])
  {
    uint64_t v33 = 0;
    double v34 = (double *)&v33;
    uint64_t v35 = 0x4010000000;
    double v36 = &unk_186D7DBA7;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v28 = MEMORY[0x1E4F143A8];
    v29 = __139__UITableViewCellLayoutManager_UITableViewCellLayoutManagerStatic___contentRectForCell_forEditingState_showingDeleteConfirmation_rowWidth___block_invoke;
    double v30 = &unk_1E52E4728;
    id v11 = v10;
    id v31 = v11;
    double v32 = &v33;
    objc_msgSend(v11, "frame", v28, 3221225472);
    if (v13 == a6)
    {
      v29((uint64_t)&v28);
    }
    else
    {
      double v22 = v12;
      double v23 = [v11 _accessoryManager];
      objc_msgSend(v23, "performWithEnforcedContainerSize:block:", &v28, a6, v22);
    }
    double v15 = v34[4];
    double v17 = v34[5];
    double v19 = v34[6];
    double v21 = v34[7];

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    [(UITableViewCellLayoutManager *)self _legacy_contentRectForCell:v10 forEditingState:v8 showingDeleteConfirmation:v7 rowWidth:a6];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
  }

  double v24 = v15;
  double v25 = v17;
  double v26 = v19;
  double v27 = v21;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)textRectForCell:(id)a3 rowWidth:(double)a4 forSizing:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v8 = a3;
  -[UITableViewCellLayoutManager contentRectForCell:forState:rowWidth:](self, "contentRectForCell:forState:rowWidth:", v8, [v8 currentStateMask], a4);
  CGFloat v10 = v9;
  CGFloat rect = v11;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  double v16 = [v8 contentView];
  [v16 directionalLayoutMargins];
  double v18 = v17;
  double v20 = v19;

  int v21 = v8[28];
  [v8 _effectiveSafeAreaInsets];
  double v103 = v20;
  if ((v21 & 0x80000) != 0)
  {
    double v27 = v23;
    v107.origin.x = v10;
    v107.origin.y = rect;
    CGFloat v25 = v13;
    v107.size.double width = v13;
    v107.size.double height = v15;
    double MinX = a4 - CGRectGetMaxX(v107);
    double v24 = v27;
  }
  else
  {
    double v24 = v22;
    v106.origin.x = v10;
    v106.origin.y = rect;
    CGFloat v25 = v13;
    v106.size.double width = v13;
    v106.size.double height = v15;
    double MinX = CGRectGetMinX(v106);
  }
  [(UITableViewCellLayoutManager *)self contentIndentationForCell:v8];
  double v29 = v28;
  [v8 _marginWidth];
  double v31 = v29 + v30 - fmax(v24, MinX);
  int v32 = _UITableViewCellTextLabelUsesLeadingLayoutMargin();
  double v33 = 15.0;
  if (v32) {
    double v33 = v18;
  }
  double v34 = fmax(v31, v33);
  uint64_t v35 = [v8 _imageView:0];
  double v36 = [v35 image];

  if (!v36
    || ![(UITableViewCellLayoutManager *)self shouldIncreaseMarginForImageViewInCell:v8])
  {
    goto LABEL_13;
  }
  double v101 = v34;
  [(UITableViewCellLayoutManager *)self standardLayoutImageViewFrameForCell:v8 forSizing:v5];
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  double v45 = [v8 traitCollection];
  if ([v45 userInterfaceIdiom] == 3) {
    double v46 = 8.0;
  }
  else {
    double v46 = 15.0;
  }

  if ((v21 & 0x80000) == 0)
  {
    v108.origin.x = v38;
    v108.origin.y = v40;
    v108.size.double width = v42;
    v108.size.double height = v44;
    double v34 = fmax(v101, v46 + CGRectGetMaxX(v108));
LABEL_13:
    double v47 = v25;
    goto LABEL_14;
  }
  v112.origin.x = v10;
  v112.origin.y = rect;
  CGFloat v99 = v44;
  double v47 = v25;
  v112.size.double width = v25;
  v112.size.double height = v15;
  double Width = CGRectGetWidth(v112);
  v113.origin.x = v38;
  v113.origin.y = v40;
  v113.size.double width = v42;
  v113.size.double height = v99;
  double v34 = fmax(v101, Width - (CGRectGetMinX(v113) - v46));
LABEL_14:
  double v48 = v103;
  uint64_t v49 = MEMORY[0x1E4F1DAD8];
  if (_UITableViewCellUsesLayoutMarginBasedContentPadding()) {
    goto LABEL_62;
  }
  uint64_t v50 = [v8 isEditing];
  uint64_t v51 = [v8 showingDeleteConfirmation];
  double v102 = v34;
  if (v50) {
    BOOL v52 = [(UITableViewCellLayoutManager *)self editingAccessoryShouldAppearForCell:v8];
  }
  else {
    BOOL v52 = [(UITableViewCellLayoutManager *)self accessoryShouldAppearForCell:v8];
  }
  BOOL v53 = v52;
  -[UITableViewCellLayoutManager _adjustedBackgroundRectForCell:](self, "_adjustedBackgroundRectForCell:", v8, *(void *)&v99);
  CGFloat v58 = v54;
  CGFloat v59 = v55;
  CGFloat v60 = v56;
  CGFloat v61 = v57;
  if ((v21 & 0x80000) != 0)
  {
    v110.origin.x = v10;
    v110.origin.y = rect;
    v110.size.double width = v47;
    v110.size.double height = v15;
    double v100 = v47;
    double v66 = v15;
    double v67 = v10;
    double v68 = CGRectGetMinX(v110);
    v111.origin.x = v58;
    v111.origin.y = v59;
    v111.size.double width = v60;
    v111.size.double height = v61;
    double v69 = CGRectGetMinX(v111);
    [v8 _effectiveSafeAreaInsets];
    double v65 = v68 - (v69 + v70);
    CGFloat v10 = v67;
    CGFloat v15 = v66;
    double v48 = v103;
  }
  else
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v54);
    [v8 _effectiveSafeAreaInsets];
    double v64 = MaxX - v63;
    v109.origin.x = v10;
    v109.origin.y = rect;
    v109.size.double width = v47;
    v109.size.double height = v15;
    double v65 = v64 - CGRectGetMaxX(v109);
  }
  double v34 = v102;
  if (!v53)
  {
    int v73 = dyld_program_sdk_at_least();
    double v74 = fmax(v48, 15.0);
    if (v73) {
      double v72 = v74;
    }
    else {
      double v72 = 15.0;
    }
LABEL_56:
    double v71 = fmax(v72 - v65, 0.0);
    goto LABEL_57;
  }
  if (![(UITableViewCellLayoutManager *)self shouldStackAccessoryViewVerticallyForCell:v8 editing:v50])
  {
    if (v50) {
      [(UITableViewCellLayoutManager *)self editingAccessoryEndingRectForCell:v8 forNewEditingState:1 showingDeleteConfirmation:v51];
    }
    else {
      [(UITableViewCellLayoutManager *)self accessoryEndingRectForCell:v8 forNewEditingState:0 showingDeleteConfirmation:v51];
    }
    if ((*(void *)&v21 & 0x80000) != 0) {
      CGFloat v80 = v76;
    }
    else {
      CGFloat v80 = v10;
    }
    if ((*(void *)&v21 & 0x80000) != 0) {
      CGFloat v81 = v77;
    }
    else {
      CGFloat v81 = rect;
    }
    if ((*(void *)&v21 & 0x80000) != 0) {
      CGFloat v82 = v78;
    }
    else {
      CGFloat v82 = v47;
    }
    if ((*(void *)&v21 & 0x80000) != 0) {
      CGFloat v83 = v79;
    }
    else {
      CGFloat v83 = v15;
    }
    if ((*(void *)&v21 & 0x80000) != 0) {
      CGFloat v84 = v10;
    }
    else {
      CGFloat v84 = v76;
    }
    double v104 = v65;
    if ((*(void *)&v21 & 0x80000) != 0) {
      CGFloat v85 = rect;
    }
    else {
      CGFloat v85 = v77;
    }
    double v86 = v15;
    double v87 = v10;
    if ((*(void *)&v21 & 0x80000) != 0) {
      CGFloat v88 = v47;
    }
    else {
      CGFloat v88 = v78;
    }
    if ((*(void *)&v21 & 0x80000) != 0) {
      CGFloat v89 = v86;
    }
    else {
      CGFloat v89 = v79;
    }
    v114.origin.x = v80;
    v114.origin.y = v81;
    v114.size.double width = v82;
    v114.size.double height = v83;
    double v90 = CGRectGetMaxX(v114);
    v115.origin.x = v84;
    v115.origin.y = v85;
    v115.size.double width = v88;
    CGFloat v10 = v87;
    CGFloat v15 = v86;
    v115.size.double height = v89;
    double v34 = v102;
    double v65 = v104;
    double v72 = fmax(v90 - CGRectGetMinX(v115), 35.0);
    goto LABEL_56;
  }
  double v71 = fmax(v48, 15.0);
  double v72 = 0.0;
LABEL_57:
  char v91 = !-[UITableViewCellLayoutManager _editControlOnSameSideAsReorderControlForCell:](self, "_editControlOnSameSideAsReorderControlForCell:", v8, *(void *)&v100)|| v53;
  double v92 = fmax(v71, v72);
  if ((v50 ^ 1)) {
    double v92 = v71;
  }
  if (v91) {
    double v48 = v71;
  }
  else {
    double v48 = v92;
  }
LABEL_62:
  double v93 = *(double *)(v49 + 8);
  double v94 = v47 - (v34 + v48);
  if ((v21 & 0x80000) != 0)
  {
    v116.origin.x = v10;
    v116.origin.y = rect;
    v116.size.double width = v47;
    v116.size.double height = v15;
    double v34 = CGRectGetWidth(v116) - v94 - v34;
  }

  double v95 = v34;
  double v96 = v93;
  double v97 = v94;
  double v98 = v15;
  result.size.double height = v98;
  result.size.double width = v97;
  result.origin.y = v96;
  result.origin.x = v95;
  return result;
}

- (CGRect)contentRectForCell:(id)a3 forState:(unint64_t)a4 rowWidth:(double)a5
{
  [(UITableViewCellLayoutManager *)self _contentRectForCell:a3 forEditingState:a4 & 1 showingDeleteConfirmation:0 rowWidth:a5];
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)standardLayoutImageViewFrameForCell:(id)a3 forSizing:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = a3;
  double v7 = [v6 _imageView:0];
  double v8 = v7;
  if (v7 && ([v7 image], double v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    int v10 = v6[28];
    double v11 = [v6 contentView];
    [v11 bounds];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    double v19 = v18;

    if ((v10 & 0x80000) != 0)
    {
      v90.origin.x = v13;
      v90.origin.y = v15;
      v90.size.double width = v17;
      v90.size.double height = v19;
      double MaxX = CGRectGetMaxX(v90);
      [(UITableViewCellLayoutManager *)self contentIndentationForCell:v6];
      double v22 = MaxX - v27;
    }
    else
    {
      double v20 = *MEMORY[0x1E4F1DB28];
      [(UITableViewCellLayoutManager *)self contentIndentationForCell:v6];
      double v22 = v20 + v21;
    }
    [v8 frame];
    objc_msgSend(v8, "sizeThatFits:", v28, v29);
    double width = v30;
    double height = v31;
    CGFloat v86 = v13;
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      [v8 transform];
      if (!CGAffineTransformIsIdentity(&v89))
      {
        CGFloat v32 = *MEMORY[0x1E4F1DAD8];
        CGFloat v33 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        [v8 transform];
        v91.origin.x = v32;
        v91.origin.y = v33;
        CGFloat v13 = v86;
        v91.size.double width = width;
        v91.size.double height = height;
        CGRect v92 = CGRectApplyAffineTransform(v91, &v88);
        double width = v92.size.width;
        double height = v92.size.height;
      }
    }
    if (height <= v19 || v4) {
      double v35 = 1.0;
    }
    else {
      double v35 = v19 / height;
    }
    double v36 = [v8 _currentImage];
    CGFloat rect = v15;
    CGFloat v85 = v17;
    _UITableCellLineHeightCenteredImageInRect(v36, v35, v13, v15, v17, v19);
    CGFloat v23 = v37;
    double v39 = v38;
    double v41 = v40;

    if (fabs(v35 + -1.0) > 2.22044605e-16)
    {
      double height = v41;
      double width = v39;
    }
    if (dyld_program_sdk_at_least())
    {
      CGFloat v42 = [v6 _constants];
      double v43 = [v6 traitCollection];
      [v42 defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:0 traitCollection:v43];
      double v45 = v44;

      double v46 = [v8 image];
      double v47 = [v6 traitCollection];
      double v48 = 0.0;
      if (_UITableCellShouldCenterImageHorizontallyForTraitCollection(v46, v47))
      {
        v93.origin.x = v22;
        v93.origin.y = v23;
        v93.size.double width = width;
        v93.size.double height = height;
        double v48 = (v45 - CGRectGetWidth(v93)) * 0.5;
      }

      CGFloat v49 = rect;
      if ((v10 & 0x80000) != 0)
      {
        CGFloat v70 = v85;
        CGFloat v69 = v86;
        double v71 = v19;
        double v72 = CGRectGetWidth(*(CGRect *)(&v49 - 1));
        v95.origin.x = v22;
        v95.origin.y = v23;
        v95.size.double width = width;
        v95.size.double height = height;
        double v73 = v72 - CGRectGetWidth(v95);
        uint64_t v50 = [v6 contentView];
        [v50 layoutMargins];
        double v22 = v73 - v74 - v48;
      }
      else
      {
        uint64_t v50 = [v6 contentView];
        [v50 layoutMargins];
        double v22 = v48 + v51;
      }
    }
    else if (dyld_program_sdk_at_least())
    {
      BOOL v52 = [v6 _constants];
      BOOL v53 = [v6 _tableView];
      int v54 = [v52 imageViewOffsetByLayoutMarginsForCell:v6 inTableView:v53];

      if (v54)
      {
        [v6 bounds];
        double v82 = CGRectGetWidth(v94);
        -[UITableViewCellLayoutManager contentRectForCell:forState:rowWidth:](self, "contentRectForCell:forState:rowWidth:", v6, [v6 currentStateMask], v82);
        uint64_t v83 = v56;
        uint64_t v84 = v55;
        uint64_t v58 = v57;
        uint64_t v60 = v59;
        [v6 directionalLayoutMargins];
        double v62 = v61;
        [v6 _defaultLeadingMarginWidth];
        uint64_t v63 = v58;
        uint64_t v64 = v60;
        double v66 = fmax(v62, v65);
        uint64_t v68 = v83;
        uint64_t v67 = v84;
        if ((v10 & 0x80000) != 0)
        {
          double v76 = fmax(v66 - (v82 - CGRectGetMaxX(*(CGRect *)&v67)), 15.0);
          v96.origin.x = v86;
          v96.origin.y = rect;
          v96.size.double width = v85;
          v96.size.double height = v19;
          CGFloat v77 = CGRectGetMaxX(v96) - v76;
          v97.origin.x = v22;
          v97.origin.y = v23;
          v97.size.double width = width;
          v97.size.double height = height;
          double v22 = v77 - CGRectGetWidth(v97);
        }
        else
        {
          double v22 = fmax(v66 - CGRectGetMinX(*(CGRect *)&v67), 15.0);
        }
      }
    }
    else
    {
      [v6 _defaultLeadingMarginWidth];
      double v22 = v75;
    }
  }
  else
  {
    double v22 = *MEMORY[0x1E4F1DB28];
    CGFloat v23 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v78 = v22;
  double v79 = v23;
  double v80 = width;
  double v81 = height;
  result.size.double height = v81;
  result.size.double width = v80;
  result.origin.y = v79;
  result.origin.x = v78;
  return result;
}

- (double)contentIndentationForCell:(id)a3
{
  id v3 = a3;
  double v4 = (double)[v3 indentationLevel];
  [v3 indentationWidth];
  double v6 = v5;

  return v6 * v4;
}

- (CGSize)intrinsicContentSizeForCell:(id)a3 rowWidth:(double)a4
{
  id v6 = a3;
  double v7 = [v6 _textLabel:0];
  double v8 = [v7 font];
  [v8 pointSize];
  double v10 = v9;

  if (v10 == 0.0)
  {
    double v11 = [(UITableViewCellLayoutManager *)self defaultTextLabelFontForCell:v6];
    [v7 setFont:v11];
  }
  [v6 frame];
  double v13 = v12;
  double v14 = [v6 textLabel];
  uint64_t v15 = [v14 numberOfLines];

  if (v7) {
    [v7 font];
  }
  else {
  double v16 = [(UITableViewCellLayoutManager *)self defaultTextLabelFontForCell:v6];
  }
  CGFloat v17 = [v6 _detailTextLabel:0];
  double v18 = [v17 text];
  uint64_t v19 = [v18 length];

  if (v15 == 1)
  {
    double v20 = [v6 traitCollection];
    uint64_t v21 = [v20 userInterfaceIdiom];

    if (v21 == 5)
    {
      double v22 = [v6 _constants];
      CGFloat v23 = [v6 _tableView];
      objc_msgSend(v22, "defaultRowHeightForTableView:cellStyle:hasDetailText:", v23, objc_msgSend(v6, "_cellStyle"), v19 != 0);
      double v25 = v24;
    }
    else
    {
      [v16 _bodyLeading];
      double v25 = v37 + v37;
    }
    if (dyld_program_sdk_at_least()) {
      goto LABEL_20;
    }
  }
  else
  {
    double v26 = [v6 imageView];
    double v27 = [v26 image];
    [v27 size];
    double v29 = v28;

    double v30 = 0.0;
    double v31 = fmax(v29, 0.0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (![(UITableViewCellLayoutManager *)self shouldIncreaseMarginForImageViewInCell:v6])
      {
        [(UITableViewCellLayoutManager *)self requiredIndentationForFirstLineOfCell:v6 rowWidth:1 forSizing:a4];
        double v30 = v32;
      }
      [v7 _setFirstParagraphFirstLineHeadIndent:v30];
    }
    long long v47 = 0u;
    long long v48 = 0u;
    [(UITableViewCellLayoutManager *)self getTextLabelRect:&v47 detailTextLabelRect:0 forCell:v6 rowWidth:1 forSizing:a4];
    long long v47 = *MEMORY[0x1E4F1DAD8];
    *((void *)&v48 + 1) = 0x7FEFFFFFFFFFFFFFLL;
    CGFloat v33 = [v6 textLabel];
    objc_msgSend(v33, "textRectForBounds:limitedToNumberOfLines:", v15, v47, v48);
    double v35 = v34;

    if (v35 <= v31) {
      double v35 = v31;
    }
    [v16 _bodyLeading];
    double v25 = v36 + v35;
  }
  if ([v6 separatorStyle])
  {
    [v6 _separatorFrame];
    double v25 = v25 + CGRectGetHeight(v50);
  }
LABEL_20:
  if (-[UITableViewCellLayoutManager shouldStackAccessoryViewVerticallyForCell:editing:](self, "shouldStackAccessoryViewVerticallyForCell:editing:", v6, [v6 isEditing]))
  {
    double v38 = -[UITableViewCellLayoutManager customAccessoryViewForCell:editing:](self, "customAccessoryViewForCell:editing:", v6, [v6 isEditing]);
    [v38 frame];
    double v25 = v25 + v39;
  }
  BOOL v40 = v19 != 0;
  double v41 = [v6 _constants];
  CGFloat v42 = [v6 _tableView];
  objc_msgSend(v41, "defaultRowHeightForTableView:cellStyle:hasDetailText:", v42, objc_msgSend(v6, "_cellStyle"), v40);
  double v44 = ceil(fmax(v43, v25));

  double v45 = v13;
  double v46 = v44;
  result.double height = v46;
  result.double width = v45;
  return result;
}

- (BOOL)shouldStackAccessoryViewVerticallyForCell:(id)a3 editing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:v6])
  {
    double v7 = [(UITableViewCellLayoutManager *)self customAccessoryViewForCell:v6 editing:v4];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

+ (void)initialize
{
  v18[20] = *MEMORY[0x1E4F143B8];
  id v3 = (id)objc_opt_class();
  if (([a1 requiresLegacyLayout] & 1) == 0 && v3 != a1)
  {
    uint64_t v5 = 0;
    v18[0] = sel_editControlShouldAppearForCell_;
    v18[1] = sel_editControlStartingRectForCell_forNewEditingState_;
    v18[2] = sel_editControlEndingRectForCell_forNewEditingState_;
    v18[3] = sel_editControlShouldFadeForCell_;
    v18[4] = sel_reorderControlShouldAppearForCell_;
    v18[5] = sel_reorderControlStartingRectForCell_forNewEditingState_showingDeleteConfirmation_;
    v18[6] = sel_reorderControlEndingRectForCell_forNewEditingState_showingDeleteConfirmation_;
    v18[7] = sel_reorderControlShouldFadeForCell_;
    v18[8] = sel_reorderSeparatorShouldAppearForCell_;
    v18[9] = sel_reorderSeparatorStartingRectForCell_forNewEditingState_showingDeleteConfirmation_;
    v18[10] = sel_reorderSeparatorEndingRectForCell_forNewEditingState_showingDeleteConfirmation_;
    v18[11] = sel_reorderSeparatorShouldFadeForCell_;
    v18[12] = sel_accessoryShouldAppearForCell_;
    v18[13] = sel_accessoryStartingRectForCell_forNewEditingState_showingDeleteConfirmation_;
    v18[14] = sel_accessoryEndingRectForCell_forNewEditingState_showingDeleteConfirmation_;
    v18[15] = sel_accessoryShouldFadeForCell_;
    v18[16] = sel_editingAccessoryShouldAppearForCell_;
    v18[17] = sel_editingAccessoryStartingRectForCell_forNewEditingState_showingDeleteConfirmation_;
    v18[18] = sel_editingAccessoryEndingRectForCell_forNewEditingState_showingDeleteConfirmation_;
    v18[19] = sel_editingAccessoryShouldFadeForCell_;
    *(void *)&long long v4 = 138412546;
    long long v13 = v4;
    do
    {
      id v6 = (const char *)v18[v5];
      uint64_t v7 = objc_msgSend(a1, "instanceMethodForSelector:", v6, v13);
      if (v7 != objc_msgSend((id)objc_msgSend(a1, "superclass"), "instanceMethodForSelector:", v6))
      {
        double v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("UITableViewCellLayoutManager", &initialize___s_category_1) + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          double v9 = v8;
          double v10 = (objc_class *)objc_opt_class();
          double v11 = NSStringFromClass(v10);
          double v12 = NSStringFromSelector(v6);
          *(_DWORD *)buf = v13;
          uint64_t v15 = v11;
          __int16 v16 = 2112;
          CGFloat v17 = v12;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "%@ is implementing %@ without returning YES from requiresLegacyLayout. This method will be ignored.", buf, 0x16u);
        }
      }
      ++v5;
    }
    while (v5 != 20);
  }
}

+ (BOOL)requiresLegacyLayout
{
  return 0;
}

+ (id)layoutManagerForTableViewCellStyle:(int64_t)a3
{
  switch((int)a3)
  {
    case 0:
      id v3 = +[UITableViewCellLayoutManager sharedLayoutManager];
      goto LABEL_13;
    case 1:
      long long v4 = (void *)_MergedGlobals_19_11;
      if (!_MergedGlobals_19_11)
      {
        uint64_t v7 = objc_alloc_init(UITableViewCellLayoutManagerValue1);
        double v8 = (void *)_MergedGlobals_19_11;
        _MergedGlobals_19_11 = (uint64_t)v7;

        long long v4 = (void *)_MergedGlobals_19_11;
      }
      goto LABEL_12;
    case 2:
      long long v4 = (void *)qword_1EB25E520;
      if (!qword_1EB25E520)
      {
        double v9 = objc_alloc_init(UITableViewCellLayoutManagerValue2);
        double v10 = (void *)qword_1EB25E520;
        qword_1EB25E520 = (uint64_t)v9;

        long long v4 = (void *)qword_1EB25E520;
      }
      goto LABEL_12;
    case 3:
      long long v4 = (void *)qword_1EB25E528;
      if (!qword_1EB25E528)
      {
        double v11 = objc_alloc_init(UITableViewCellLayoutManagerSubtitle);
        double v12 = (void *)qword_1EB25E528;
        qword_1EB25E528 = (uint64_t)v11;

        long long v4 = (void *)qword_1EB25E528;
      }
      goto LABEL_12;
    default:
      if (a3 == 1000)
      {
        long long v4 = (void *)qword_1EB25E530;
        if (!qword_1EB25E530)
        {
          uint64_t v5 = objc_alloc_init(UITableViewCellLayoutManagerEditable1);
          id v6 = (void *)qword_1EB25E530;
          qword_1EB25E530 = (uint64_t)v5;

          long long v4 = (void *)qword_1EB25E530;
        }
LABEL_12:
        id v3 = v4;
      }
      else
      {
        id v3 = 0;
      }
LABEL_13:
      return v3;
  }
}

+ (id)sharedLayoutManager
{
  v2 = (void *)sharedLayoutManager_layoutManager;
  if (!sharedLayoutManager_layoutManager)
  {
    id v3 = objc_alloc_init(UITableViewCellLayoutManager);
    long long v4 = (void *)sharedLayoutManager_layoutManager;
    sharedLayoutManager_layoutManager = (uint64_t)v3;

    v2 = (void *)sharedLayoutManager_layoutManager;
  }
  return v2;
}

- (id)defaultImageViewForCell:(id)a3
{
  id v3 = objc_alloc_init((Class)objc_opt_class());
  return v3;
}

- (CGRect)selectedBackgroundEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(UITableViewCellLayoutManager *)self backgroundEndingRectForCell:v6 forNewEditingState:v4];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if (([v6 _isUsingOldStyleMultiselection] & 1) == 0)
  {
    uint64_t v15 = [v6 multipleSelectionBackgroundView];
    if (v15)
    {
    }
    else if (([v6 _insetsBackground] & 1) == 0)
    {
      [v6 _separatorHeight];
      double v10 = v10 - v16;
      double v14 = v14 + v16 + v16;
    }
  }

  double v17 = v8;
  double v18 = v10;
  double v19 = v12;
  double v20 = v14;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)_backgroundRectForCell:(id)a3 rowWidth:(double)a4
{
  id v5 = a3;
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  if (([v5 _insetsBackground] & 1) == 0 && objc_msgSend(v5, "separatorStyle"))
  {
    [v5 _separatorHeight];
    double v9 = v9 - v10;
  }

  double v11 = 0.0;
  double v12 = v7;
  double v13 = a4;
  double v14 = v9;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_backgroundRectForCell:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  [(UITableViewCellLayoutManager *)self _backgroundRectForCell:v4 rowWidth:CGRectGetWidth(v17)];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)contentRectForCell:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  [v6 bounds];
  [(UITableViewCellLayoutManager *)self contentRectForCell:v6 forState:a4 rowWidth:CGRectGetWidth(v19)];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)defaultLabelForCell:(id)a3
{
  id v4 = a3;
  double v5 = [(UITableViewCellLayoutManager *)self defaultLabelForCell:v4 ofClass:objc_opt_class()];

  return v5;
}

- (id)defaultLabelForCell:(id)a3 ofClass:(Class)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(a4);
  double v8 = +[UIColor clearColor];
  if ([v6 _changesOpaqueStateOfSubviews])
  {
    double v9 = [v6 _contentBackgroundColor];
    [v9 alphaComponent];
    if (v10 == 1.0)
    {
      id v11 = v9;

      double v8 = v11;
    }
  }
  [v7 setBackgroundColor:v8];
  double v12 = [(UITableViewCellLayoutManager *)self defaultTextLabelFontForCell:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 _setDefaultFont:v12];
  }
  else {
    [v7 setFont:v12];
  }
  [v7 setAdjustsFontForContentSizeCategory:dyld_program_sdk_at_least()];
  double v13 = [v6 _constants];
  uint64_t v14 = [v6 _cellStyle];
  double v15 = [v6 traitCollection];
  double v16 = [v6 _inheritedInteractionTintColor];
  double v17 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  double v18 = [v13 defaultTextColorForCellStyle:v14 traitCollection:v15 tintColor:v16 state:v17];

  [v7 setTextColor:v18];
  CGRect v19 = [v6 _constants];
  uint64_t v20 = [v6 _cellStyle];
  uint64_t v21 = [v6 traitCollection];
  double v22 = [v6 _inheritedInteractionTintColor];
  CGFloat v23 = +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, 5);
  double v24 = [v19 defaultTextColorForCellStyle:v20 traitCollection:v21 tintColor:v22 state:v23];

  if (v24)
  {
    id v25 = v18;
    id v26 = v24;
    if (v25 == v26)
    {

      goto LABEL_16;
    }
    double v27 = v26;
    if (v25)
    {
      char v28 = [v25 isEqual:v26];

      if (v28) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    [v7 setHighlightedTextColor:v27];
  }
LABEL_16:

  objc_msgSend(v7, "setHighlighted:", objc_msgSend(v6, "_isHighlighted"));
  objc_msgSend(v7, "setEnabled:", objc_msgSend(v6, "isUserInteractionEnabled"));
  objc_msgSend(v7, "setOpaque:", objc_msgSend(v7, "isHighlighted") ^ 1);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 setTableCell:v6];
  }

  return v7;
}

- (id)defaultTextLabelFontForCell:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _constants];
  uint64_t v5 = [v3 _cellStyle];

  id v6 = [v4 defaultTextLabelFontForCellStyle:v5];

  return v6;
}

- (CGRect)_adjustedBackgroundRectForCell:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  [(UITableViewCellLayoutManager *)self _adjustedBackgroundRectForCell:v4 rowWidth:CGRectGetWidth(v17)];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_adjustedBackgroundRectForCell:(id)a3 rowWidth:(double)a4
{
  double v6 = a3;
  [(UITableViewCellLayoutManager *)self _backgroundRectForCell:v6 rowWidth:a4];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [v6 _tableView];
  if ([v15 _isShowingIndex])
  {
    double v16 = [v6 traitCollection];
    uint64_t v17 = [v16 userInterfaceIdiom];

    if (v17 != 3)
    {
      [v15 _indexFrame];
      int v18 = v6[28];
      double v21 = v19 + v20;
      double v22 = v8 + v12 - v19;
      if ((v18 & 0x80000) != 0) {
        double v22 = v21;
      }
      if (v22 > 0.0)
      {
        if ((*(void *)&v18 & 0x80000) == 0) {
          double v21 = -0.0;
        }
        double v12 = v12 - v22;
        double v8 = v8 + v21;
      }
    }
  }

  double v23 = v8;
  double v24 = v10;
  double v25 = v12;
  double v26 = v14;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGRect)_adjustedBackgroundContentRectForCell:(id)a3
{
  [a3 bounds];
  double Width = CGRectGetWidth(v11);
  [(UITableViewCellLayoutManager *)self _adjustedBackgroundContentRectForCell:a3 rowWidth:Width];
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)_adjustedBackgroundContentRectForCell:(id)a3 rowWidth:(double)a4
{
  -[UITableViewCellLayoutManager _adjustedBackgroundRectForCell:rowWidth:](self, "_adjustedBackgroundRectForCell:rowWidth:", a4);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  int v13 = *((_DWORD *)a3 + 28);
  double v14 = [a3 _tableView];
  unsigned int v15 = [a3 sectionLocation];
  double v16 = 0.0;
  double v17 = 0.0;
  if ([a3 separatorStyle])
  {
    unint64_t v18 = [v14 _tableStyle];
    if (v18 <= 0x10 && ((1 << v18) & 0x10006) != 0 && [a3 _insetsBackground])
    {
      [a3 _separatorHeight];
      double v17 = v19;
    }
  }
  double v20 = 0.0;
  if (v14)
  {
    [v14 _sectionContentInset];
    double v16 = v21 + 0.0;
  }
  if (((1 << v15) & 0x15) != 0) {
    double v22 = v16;
  }
  else {
    double v22 = 0.0;
  }
  if (v15 > 4) {
    double v22 = 0.0;
  }
  double v23 = v17 + v20;
  if (((1 << v15) & 0x19) == 0) {
    double v23 = v17;
  }
  if (v15 > 4) {
    double v23 = v17;
  }
  if ((*(void *)&v13 & 0x80000) != 0) {
    double v24 = v6 + 0.0;
  }
  else {
    double v24 = 0.0;
  }
  double v25 = v8 + v22;
  double v26 = v12 - (v22 + v23);

  double v27 = v24;
  double v28 = v25;
  double v29 = v10;
  double v30 = v26;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (BOOL)_editControlOnSameSideAsReorderControlForCell:(id)a3
{
  return 0;
}

- (CGRect)_editControlRectForCell:(id)a3 offscreen:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = a3;
  double v7 = [v6 _constants];
  double v8 = [v6 _tableView];
  [v7 defaultEditControlSizeForCell:v6 inTableView:v8];
  double v10 = v9;

  [v6 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = [v6 _constants];
  unint64_t v18 = [v6 _tableView];
  [v17 defaultEditControlPaddingForCell:v6 inTableView:v18];
  double v20 = v10 + v19;
  int v21 = v6[28];
  BOOL v22 = [(UITableViewCellLayoutManager *)self _editControlOnSameSideAsReorderControlForCell:v6];
  int v23 = v22 ^ ((*(void *)&v21 & 0x80000) == 0);
  if (!v4)
  {
    if (v23)
    {
      [v6 _effectiveSafeAreaInsets];
      double v27 = v12 + v28;
      if (!v22) {
        goto LABEL_9;
      }
    }
    else
    {
      [v6 _effectiveSafeAreaInsets];
      double v27 = v12 + v14 - v20 - v38;
      if (!v22) {
        goto LABEL_9;
      }
    }
LABEL_13:
    if ([(UITableViewCellLayoutManager *)self reorderControlShouldAppearForCell:v6])
    {
      [(UITableViewCellLayoutManager *)self _reorderControlRectForCell:v6 offscreen:v4];
      double Width = CGRectGetWidth(v49);
      [v17 defaultSpaceBetweenEditAndReorderControlsForCell:v6 inTableView:v18];
      double v27 = v27 - (Width + v40);
    }
    goto LABEL_16;
  }
  [v17 defaultContentEditPaddingForCell:v6 inTableView:v18];
  double v25 = v12 + v14 - v24;
  double v26 = v12 - v20 + v24;
  if (v23) {
    double v27 = v26;
  }
  else {
    double v27 = v25;
  }
  if (v22) {
    goto LABEL_13;
  }
LABEL_9:
  if (!v4)
  {
    double v29 = v10 + 20.0;
    uint64_t v30 = 0;
    double v31 = v27;
    double v32 = v20;
    double v33 = v16;
    if ((v21 & 0x80000) != 0)
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v31);
      [v6 directionalLayoutMargins];
      double v43 = v42;
      [v17 defaultEditControlPaddingForCell:v6 inTableView:v18];
      double v27 = fmin(MaxX, v14 - (v43 - (v29 + v44 * 0.5))) - v20;
    }
    else
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v31);
      [v6 directionalLayoutMargins];
      double v36 = v35;
      [v17 defaultEditControlPaddingForCell:v6 inTableView:v18];
      double v27 = fmax(MinX, v36 - (v29 + v37 * 0.5));
    }
  }
LABEL_16:

  double v45 = 0.0;
  double v46 = v27;
  double v47 = v20;
  double v48 = v16;
  result.size.double height = v48;
  result.size.double width = v47;
  result.origin.y = v45;
  result.origin.x = v46;
  return result;
}

- (CGRect)_reorderControlRectForCell:(id)a3 offscreen:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = a3;
  double v7 = [v6 _constants];
  double v8 = [v6 _tableView];
  double v9 = [v6 _constants];
  double v10 = [v8 _accessoryBaseColor];
  [v9 defaultReorderControlSizeForCell:v6 withAccessoryBaseColor:v10];
  double v12 = v11;

  [v6 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  int v19 = v6[28];
  if ([v6 _usesRoundedGroups])
  {
    [(UITableViewCellLayoutManager *)self _adjustedBackgroundContentRectForCell:v6];
    if ((v19 & 0x80000) == 0)
    {
      double v14 = v20 + v21 - v12 + -1.0;
      goto LABEL_27;
    }
    double v14 = v20 + 1.0;
LABEL_31:
    [v8 _isShowingIndex];
    goto LABEL_32;
  }
  if (!v4)
  {
    if ([v6 layoutMarginsFollowReadableWidth])
    {
      double v25 = [v6 _tableView];
      double v26 = [v25 _scrollView];
      int v27 = [v26 _safeAreaWidthExceedsReadableWidth];

      if ((v19 & 0x80000) == 0)
      {
        double v28 = v14 + v16 - v12;
        if (v27)
        {
          [v6 directionalLayoutMargins];
LABEL_18:
          double v14 = v28 - v29;
          goto LABEL_27;
        }
LABEL_17:
        [v6 _effectiveSafeAreaInsets];
        goto LABEL_18;
      }
      if (v27)
      {
        [v6 directionalLayoutMargins];
        double v14 = v14 + v31;
        goto LABEL_31;
      }
    }
    else if ((v19 & 0x80000) == 0)
    {
      double v28 = v14 + v16 - v12;
      goto LABEL_17;
    }
    [v6 _effectiveSafeAreaInsets];
    double v14 = v14 + v32;
    goto LABEL_31;
  }
  if ([(UITableViewCellLayoutManager *)self accessoryShouldAppearForCell:v6]
    && ![(UITableViewCellLayoutManager *)self editingAccessoryShouldAppearForCell:v6])
  {
    if ((v19 & 0x80000) == 0)
    {
      double v14 = v14 + v16 - v12;
      goto LABEL_27;
    }
    goto LABEL_31;
  }
  BOOL v22 = [(UITableViewCellLayoutManager *)self reorderSeparatorShouldAppearForCell:v6];
  if ((v19 & 0x80000) != 0)
  {
    if (v22)
    {
      [(UITableViewCellLayoutManager *)self _reorderSeparatorRectForCell:v6 offscreen:1];
      double v14 = v30 - v12;
    }
    else
    {
      [v7 defaultContentReorderPaddingForCell:v6 inTableView:v8];
      double v14 = v14 - v12 + v35;
    }
    goto LABEL_31;
  }
  if (v22)
  {
    [(UITableViewCellLayoutManager *)self _reorderSeparatorRectForCell:v6 offscreen:1];
    double v14 = v23 + v24;
  }
  else
  {
    [v7 defaultContentReorderPaddingForCell:v6 inTableView:v8];
    double v14 = v14 + v16 - v33;
  }
LABEL_27:
  if ([v8 _isShowingIndex] && (v19 & 0x80000) == 0)
  {
    [v8 _indexFrame];
    double v14 = v14 - (v12 + v14 - v34);
  }
LABEL_32:

  double v36 = 0.0;
  double v37 = v14;
  double v38 = v12;
  double v39 = v18;
  result.size.double height = v39;
  result.size.double width = v38;
  result.origin.y = v36;
  result.origin.x = v37;
  return result;
}

- (CGRect)_reorderSeparatorRectForCell:(id)a3 offscreen:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = a3;
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v6 _currentScreenScale];
  int v13 = v6[28];
  double v15 = 1.0 / v14;
  if ([v6 _usesRoundedGroups])
  {
    [(UITableViewCellLayoutManager *)self _adjustedBackgroundRectForCell:v6];
    double v17 = v16;
    double v19 = v18;
    [(UITableViewCellLayoutManager *)self _reorderControlRectForCell:v6 offscreen:v4];
    double v21 = v17 + v20 + 1.0;
    double v22 = v17 + v19 - v20 - v15 + -1.0;
    goto LABEL_7;
  }
  if (v4)
  {
    if (![(UITableViewCellLayoutManager *)self editingAccessoryShouldAppearForCell:v6]|| [(UITableViewCellLayoutManager *)self shouldStackAccessoryViewVerticallyForCell:v6 editing:1])
    {
      double v21 = v8 - v15;
      double v22 = v8 + v10;
LABEL_7:
      if ((v13 & 0x80000) != 0) {
        double v23 = v21;
      }
      else {
        double v23 = v22;
      }
      goto LABEL_15;
    }
    [(UITableViewCellLayoutManager *)self _editingAccessoryRectForCell:v6 offscreen:0];
    double v26 = v28 - v15;
    double v27 = v28 + v29;
  }
  else
  {
    [(UITableViewCellLayoutManager *)self _reorderControlRectForCell:v6 offscreen:0];
    double v26 = v15 + v24 + v25;
    double v27 = v24 - v15;
  }
  if ((v13 & 0x80000) != 0) {
    double v23 = v26;
  }
  else {
    double v23 = v27;
  }
LABEL_15:

  double v30 = 0.0;
  double v31 = v23;
  double v32 = v15;
  double v33 = v12;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.y = v30;
  result.origin.x = v31;
  return result;
}

- (id)customAccessoryViewForCell:(id)a3 editing:(BOOL)a4
{
  if (a4) {
    [a3 _customEditingAccessoryView:1];
  }
  else {
  BOOL v4 = [a3 _customAccessoryView:1];
  }
  return v4;
}

- (CGRect)_accessoryRectForCell:(id)a3 offscreen:(BOOL)a4 rowWidth:(double)a5
{
  BOOL v6 = a4;
  double v8 = a3;
  double v9 = (double *)MEMORY[0x1E4F1DB28];
  double v10 = *MEMORY[0x1E4F1DB28];
  double v11 = [v8 _customAccessoryView:1];
  uint64_t v12 = [v8 _accessoryView:v11 == 0];
  int v13 = (void *)v12;
  int v14 = v8[28];
  if (v11)
  {
    if ([(UITableViewCellLayoutManager *)self shouldStackAccessoryViewVerticallyForCell:v8 editing:0])
    {
      [(UITableViewCellLayoutManager *)self _adjustedBackgroundContentRectForCell:v8 rowWidth:a5];
      double v16 = v15;
      double v18 = v17;
      [v11 bounds];
      double v131 = v19;
      double v21 = v20;
      double v22 = [v8 _textLabel:0];
      [v22 frame];
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      double v31 = [v8 _detailTextLabel:0];
      [v31 frame];
      v153.origin.CGFloat x = v32;
      v153.origin.CGFloat y = v33;
      v153.size.CGFloat width = v34;
      v153.size.CGFloat height = v35;
      v133.origin.CGFloat x = v24;
      v133.origin.CGFloat y = v26;
      v133.size.CGFloat width = v28;
      v133.size.CGFloat height = v30;
      CGRect v134 = CGRectUnion(v133, v153);
      double MaxY = CGRectGetMaxY(v134);

      [v8 _marginWidth];
      double v38 = v37;
      [(UITableViewCellLayoutManager *)self contentIndentationForCell:v8];
      double v40 = fmax(v38 + v39, 15.0);
      double v41 = [v8 _imageView:0];
      uint64_t v42 = [v41 image];
      if (v42
        && (double v43 = (void *)v42,
            BOOL v44 = [(UITableViewCellLayoutManager *)self shouldIncreaseMarginForImageViewInCell:v8], v43, v44))
      {
        double rect = v18;
        [v41 frame];
        double v46 = v45;
        uint64_t v48 = v47;
        uint64_t v50 = v49;
        uint64_t v52 = v51;
        [v8 bounds];
        [(UITableViewCellLayoutManager *)self _contentRectLeadingOffsetForCell:v8 editingState:v6 rowWidth:CGRectGetWidth(v135)];
        double v54 = v46 + v53;
        if ((v14 & 0x80000) != 0)
        {
          uint64_t v119 = v48;
          uint64_t v120 = v50;
          uint64_t v121 = v52;
          CGFloat v78 = v131;
          double v10 = fmin(v16 + rect - v40, CGRectGetMinX(*(CGRect *)&v54) + -15.0) - v131;
          goto LABEL_51;
        }
        uint64_t v55 = v48;
        uint64_t v56 = v50;
        uint64_t v57 = v52;
        double v10 = v16 + fmax(v40, CGRectGetMaxX(*(CGRect *)&v54) + 15.0);
      }
      else
      {
        if ((v14 & 0x80000) != 0)
        {
          CGFloat v78 = v131;
          [v8 bounds];
          [(UITableViewCellLayoutManager *)self _contentRectLeadingOffsetForCell:v8 editingState:v6 rowWidth:CGRectGetWidth(v141)];
          double v10 = v16 + v18 - v131 - v40 - v89;
          goto LABEL_51;
        }
        [v8 bounds];
        [(UITableViewCellLayoutManager *)self _contentRectLeadingOffsetForCell:v8 editingState:v6 rowWidth:CGRectGetWidth(v136)];
        double v10 = v16 + v40 + v77;
      }
      CGFloat v78 = v131;
LABEL_51:

      goto LABEL_52;
    }
  }
  else if (!v12)
  {
    double MaxY = v9[1];
    CGFloat v78 = v9[2];
    double v21 = v9[3];
    goto LABEL_52;
  }
  [(UITableViewCellLayoutManager *)self _adjustedBackgroundContentRectForCell:v8 rowWidth:a5];
  CGFloat v59 = v58;
  double v61 = v60;
  CGFloat v63 = v62;
  CGFloat v65 = v64;
  double v66 = v64;
  double v67 = v60;
  if ([(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:v8])
  {
    uint64_t v68 = [v8 _textLabel:0];
    [v68 frame];
    double v70 = v69;
    [v68 _capOffsetFromBoundsTop];
    double v67 = v61 + v71 + v70;
    double v72 = [v68 font];
    [v72 capHeight];
    double v66 = v73;
  }
  if (v11)
  {
    [v11 bounds];
    double v10 = v74;
    CGFloat v132 = v75;
    double v21 = v76;
  }
  else
  {
    [v13 bounds];
    objc_msgSend(v13, "sizeThatFits:", v79, v80);
    CGFloat v132 = v81;
    double v21 = v82;
  }
  double MaxY = round(v67 + (v66 - v21) * 0.5);
  if (!v6)
  {
    BOOL v86 = [(UITableViewCellLayoutManager *)self reorderControlShouldAppearForCell:v8];
    if ((v14 & 0x80000) != 0)
    {
      if (v86)
      {
        [(UITableViewCellLayoutManager *)self _reorderControlRectForCell:v8 offscreen:0];
        double MaxX = CGRectGetMaxX(v140);
      }
      else
      {
        v150.origin.CGFloat x = v59;
        v150.origin.CGFloat y = v61;
        v150.size.CGFloat width = v63;
        v150.size.CGFloat height = v65;
        double MaxX = CGRectGetMinX(v150);
      }
      double v101 = MaxX;
      CGFloat v78 = v132;
      if (dyld_program_sdk_at_least())
      {
        [v8 _effectiveSafeAreaInsets];
        double v109 = v108;
        [v8 _defaultTrailingCellMarginWidth];
        double v111 = fmax(v109, v110);
        [v8 directionalLayoutMargins];
        double v10 = v101 + fmax(v112, v111);
        goto LABEL_52;
      }
    }
    else
    {
      if (v86)
      {
        [(UITableViewCellLayoutManager *)self _reorderControlRectForCell:v8 offscreen:0];
        double MinX = CGRectGetMinX(v139);
      }
      else
      {
        v148.origin.CGFloat x = v59;
        v148.origin.CGFloat y = v61;
        v148.size.CGFloat width = v63;
        v148.size.CGFloat height = v65;
        double MinX = CGRectGetMaxX(v148);
      }
      double v100 = MinX;
      CGFloat v78 = v132;
      v149.origin.CGFloat x = v10;
      v149.origin.CGFloat y = MaxY;
      v149.size.CGFloat width = v132;
      v149.size.CGFloat height = v21;
      double v101 = v100 - CGRectGetWidth(v149);
      if (dyld_program_sdk_at_least())
      {
        [v8 _effectiveSafeAreaInsets];
        double v103 = v102;
        [v8 _defaultTrailingCellMarginWidth];
        double v105 = fmax(v103, v104);
        [v8 directionalLayoutMargins];
        double v107 = fmax(v106, v105);
LABEL_45:
        double v10 = v101 - v107;
        goto LABEL_52;
      }
    }
    [v8 _defaultTrailingCellMarginWidth];
    goto LABEL_45;
  }
  if ([v8 _hasEditingAccessoryView])
  {
    BOOL v83 = [(UITableViewCellLayoutManager *)self shouldStackAccessoryViewVerticallyForCell:v8 editing:1];
    if (v83 == [(UITableViewCellLayoutManager *)self shouldStackAccessoryViewVerticallyForCell:v8 editing:0])
    {
      [(UITableViewCellLayoutManager *)self _editingAccessoryRectForCell:v8 offscreen:1];
      CGFloat x = v144.origin.x;
      CGFloat v94 = MaxY;
      CGFloat recta = MaxY;
      CGFloat y = v144.origin.y;
      CGFloat width = v144.size.width;
      CGFloat height = v144.size.height;
      double MidX = CGRectGetMidX(v144);
      v145.origin.CGFloat x = v10;
      v145.origin.CGFloat y = v94;
      CGFloat v78 = v132;
      v145.size.CGFloat width = v132;
      v145.size.CGFloat height = v21;
      double v10 = MidX - CGRectGetWidth(v145) * 0.5;
      v146.origin.CGFloat x = x;
      v146.origin.CGFloat y = y;
      v146.size.CGFloat width = width;
      v146.size.CGFloat height = height;
      double MidY = CGRectGetMidY(v146);
      v147.origin.CGFloat x = v10;
      v147.origin.CGFloat y = recta;
      v147.size.CGFloat width = v132;
      v147.size.CGFloat height = v21;
      double MaxY = MidY - CGRectGetHeight(v147) * 0.5;
      goto LABEL_52;
    }
  }
  if ([v8 _usesRoundedGroups])
  {
    if ((v14 & 0x80000) == 0)
    {
LABEL_21:
      v137.origin.CGFloat x = v59;
      v137.origin.CGFloat y = v61;
      v137.size.CGFloat width = v63;
      v137.size.CGFloat height = v65;
      double v84 = CGRectGetMaxX(v137);
      v138.origin.CGFloat x = v10;
      v138.origin.CGFloat y = MaxY;
      CGFloat v78 = v132;
      v138.size.CGFloat width = v132;
      v138.size.CGFloat height = v21;
      double v85 = v84 - CGRectGetWidth(v138);
LABEL_32:
      BOOL v91 = [(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:v8];
      double v92 = -fmin(MaxY - v61, 10.0);
      if (v91) {
        double v92 = -10.0;
      }
      if ((*(void *)&v14 & 0x80000) != 0) {
        double v92 = -v92;
      }
      double v10 = v85 + v92;
      goto LABEL_52;
    }
LABEL_31:
    v142.origin.CGFloat x = v59;
    v142.origin.CGFloat y = v61;
    v142.size.CGFloat width = v63;
    v142.size.CGFloat height = v65;
    double v90 = CGRectGetMinX(v142);
    v143.origin.CGFloat x = v10;
    v143.origin.CGFloat y = MaxY;
    CGFloat v78 = v132;
    v143.size.CGFloat width = v132;
    v143.size.CGFloat height = v21;
    double v85 = v90 + CGRectGetWidth(v143);
    goto LABEL_32;
  }
  if ([(UITableViewCellLayoutManager *)self reorderControlShouldAppearForCell:v8])
  {
    if ((v14 & 0x80000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_31;
  }
  CGFloat v113 = v59;
  double v114 = v61;
  CGFloat v115 = v63;
  CGFloat v116 = v65;
  if ((v14 & 0x80000) != 0)
  {
    double v126 = CGRectGetMinX(*(CGRect *)&v113);
    v151.origin.CGFloat x = v10;
    v151.origin.CGFloat y = MaxY;
    CGFloat v78 = v132;
    v151.size.CGFloat width = v132;
    v151.size.CGFloat height = v21;
    double v10 = v126 - CGRectGetWidth(v151);
    if (!v11)
    {
      v127 = [v8 _constants];
      [v127 defaultContentAccessoryPadding];
      double v10 = v10 + v128;
    }
  }
  else
  {
    double v10 = CGRectGetMaxX(*(CGRect *)&v113);
    if (!v11)
    {
      v117 = [v8 _constants];
      [v117 defaultContentAccessoryPadding];
      double v10 = v10 - v118;
    }
    CGFloat v78 = v132;
  }
LABEL_52:

  double v122 = v10;
  double v123 = MaxY;
  double v124 = v78;
  double v125 = v21;
  result.size.CGFloat height = v125;
  result.size.CGFloat width = v124;
  result.origin.CGFloat y = v123;
  result.origin.CGFloat x = v122;
  return result;
}

- (CGRect)_accessoryRectForCell:(id)a3 offscreen:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 bounds];
  [(UITableViewCellLayoutManager *)self _accessoryRectForCell:v6 offscreen:v4 rowWidth:CGRectGetWidth(v19)];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)_editingAccessoryRectForCell:(id)a3 offscreen:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = (double *)MEMORY[0x1E4F1DB28];
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = [v6 _customEditingAccessoryView:1];
  uint64_t v10 = [v6 _editingAccessoryView:v9 == 0];
  double v11 = (void *)v10;
  int v12 = v6[28];
  if (!v9)
  {
    if (!v10)
    {
      double MaxY = v7[1];
      double v18 = v7[2];
      CGFloat rect = v7[3];
      goto LABEL_72;
    }
LABEL_8:
    [(UITableViewCellLayoutManager *)self _adjustedBackgroundContentRectForCell:v6];
    uint64_t v53 = v52;
    double v55 = v54;
    uint64_t v57 = v56;
    double v59 = v58;
    double v60 = v58;
    double v61 = v54;
    if ([(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:v6])
    {
      double v62 = [v6 _textLabel:0];
      [v62 frame];
      double v64 = v63;
      [v62 _capOffsetFromBoundsTop];
      double v61 = v55 + v65 + v64;
      double v66 = [v62 font];
      [v66 capHeight];
      double v60 = v67;
    }
    if (v9)
    {
      [v9 bounds];
      double v8 = v69;
      double v18 = v70;
    }
    else
    {
      [v11 bounds];
      objc_msgSend(v11, "sizeThatFits:", v72, v73);
      double v18 = v74;
      double v68 = v75;
    }
    double MaxY = round(v61 + (v60 - v68) * 0.5);
    CGFloat rect = v68;
    if (v4)
    {
      if ([(UITableViewCellLayoutManager *)self reorderSeparatorShouldAppearForCell:v6])
      {
        [(UITableViewCellLayoutManager *)self _reorderSeparatorRectForCell:v6 offscreen:0];
        if ((v12 & 0x80000) == 0)
        {
          double MinX = CGRectGetMinX(*(CGRect *)&v76);
LABEL_28:
          double v91 = MinX;
          v146.origin.CGFloat x = v8;
          v146.origin.CGFloat y = MaxY;
          v146.size.CGFloat width = v18;
          v146.size.CGFloat height = rect;
          double v92 = v91 - CGRectGetWidth(v146);
          goto LABEL_37;
        }
        double MaxX = CGRectGetMaxX(*(CGRect *)&v76);
      }
      else
      {
        uint64_t v87 = v53;
        double v88 = v55;
        uint64_t v89 = v57;
        double v90 = v59;
        if ((v12 & 0x80000) == 0)
        {
          double MinX = CGRectGetMaxX(*(CGRect *)&v87);
          goto LABEL_28;
        }
        double MaxX = CGRectGetMinX(*(CGRect *)&v87);
      }
      double v92 = MaxX;
LABEL_37:
      if (dyld_program_sdk_at_least())
      {
        [v6 _effectiveSafeAreaInsets];
        double v107 = v106;
        double v109 = v108;
        [v6 _defaultTrailingCellMarginWidth];
        double v111 = v110;
        [v6 directionalLayoutMargins];
        if ((*(void *)&v12 & 0x80000) != 0) {
          double v113 = v107;
        }
        else {
          double v113 = v109;
        }
        double v114 = fmax(v112, fmax(v113, v111));
        if ((*(void *)&v12 & 0x80000) == 0) {
          double v114 = -v114;
        }
      }
      else
      {
        BOOL v115 = [(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:v6];
        double v116 = -fmin(MaxY - v55, 10.0);
        if (v115) {
          double v117 = -10.0;
        }
        else {
          double v117 = v116;
        }
        [v6 _effectiveSafeAreaInsets];
        if ((v12 & 0x80000) != 0) {
          double v114 = v118 - v117;
        }
        else {
          double v114 = v117 - v119;
        }
      }
LABEL_71:
      double v8 = v92 + v114;
      goto LABEL_72;
    }
    if ([v6 _hasAccessoryView])
    {
      BOOL v81 = [(UITableViewCellLayoutManager *)self shouldStackAccessoryViewVerticallyForCell:v6 editing:1];
      if (v81 == [(UITableViewCellLayoutManager *)self shouldStackAccessoryViewVerticallyForCell:v6 editing:0])
      {
        [(UITableViewCellLayoutManager *)self _accessoryRectForCell:v6 offscreen:0];
        CGFloat x = v147.origin.x;
        CGFloat y = v147.origin.y;
        CGFloat width = v147.size.width;
        CGFloat height = v147.size.height;
        double MidX = CGRectGetMidX(v147);
        v148.origin.CGFloat x = v8;
        v148.origin.CGFloat y = MaxY;
        v148.size.CGFloat width = v18;
        v148.size.CGFloat height = rect;
        double v8 = MidX - CGRectGetWidth(v148) * 0.5;
        v149.origin.CGFloat x = x;
        v149.origin.CGFloat y = y;
        v149.size.CGFloat width = width;
        v149.size.CGFloat height = height;
        double MidY = CGRectGetMidY(v149);
        v150.origin.CGFloat x = v8;
        v150.origin.CGFloat y = MaxY;
        v150.size.CGFloat width = v18;
        v150.size.CGFloat height = rect;
        double MaxY = MidY - CGRectGetHeight(v150) * 0.5;
        goto LABEL_72;
      }
    }
    if ([v6 _usesRoundedGroups])
    {
      if ([(UITableViewCellLayoutManager *)self reorderSeparatorShouldAppearForCell:v6])
      {
        [(UITableViewCellLayoutManager *)self _reorderSeparatorRectForCell:v6 offscreen:0];
        if ((v12 & 0x80000) == 0)
        {
          double v86 = CGRectGetMinX(*(CGRect *)&v82);
LABEL_52:
          double v124 = v86;
          v151.origin.CGFloat x = v8;
          v151.origin.CGFloat y = MaxY;
          v151.size.CGFloat width = v18;
          v151.size.CGFloat height = rect;
          double v92 = v124 - CGRectGetWidth(v151);
          goto LABEL_61;
        }
        double v127 = CGRectGetMaxX(*(CGRect *)&v82);
      }
      else
      {
        uint64_t v120 = v53;
        double v121 = v55;
        uint64_t v122 = v57;
        double v123 = v59;
        if ((v12 & 0x80000) == 0)
        {
          double v86 = CGRectGetMaxX(*(CGRect *)&v120);
          goto LABEL_52;
        }
        double v127 = CGRectGetMinX(*(CGRect *)&v120);
      }
      double v92 = v127;
    }
    else
    {
      uint64_t v93 = v53;
      double v94 = v55;
      uint64_t v95 = v57;
      double v96 = v59;
      if ((v12 & 0x80000) != 0)
      {
        double v125 = CGRectGetMinX(*(CGRect *)&v93);
        v152.origin.CGFloat x = v8;
        v152.origin.CGFloat y = MaxY;
        v152.size.CGFloat width = v18;
        v152.size.CGFloat height = rect;
        double v92 = v125 - CGRectGetWidth(v152);
        if (v9) {
          goto LABEL_61;
        }
        CGRect v97 = [v6 _constants];
        [v97 defaultContentAccessoryPadding];
        double v92 = v92 + v126;
      }
      else
      {
        double v92 = CGRectGetMaxX(*(CGRect *)&v93);
        if (v9) {
          goto LABEL_61;
        }
        CGRect v97 = [v6 _constants];
        [v97 defaultContentAccessoryPadding];
        double v92 = v92 - v98;
      }
    }
LABEL_61:
    if (dyld_program_sdk_at_least())
    {
      [v6 _effectiveSafeAreaInsets];
      if ((*(void *)&v12 & 0x80000) != 0) {
        double v130 = v128;
      }
      else {
        double v130 = v129;
      }
      [v6 _defaultTrailingCellMarginWidth];
      double v132 = fmax(v130, v131);
      [v6 directionalLayoutMargins];
      double v134 = fmax(v133, v132);
    }
    else
    {
      BOOL v135 = [(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:v6];
      double v114 = -10.0;
      if (v135) {
        goto LABEL_69;
      }
      double v134 = fmin(MaxY - v55, 10.0);
    }
    double v114 = -v134;
LABEL_69:
    if ((*(void *)&v12 & 0x80000) != 0) {
      double v114 = -v114;
    }
    goto LABEL_71;
  }
  if (![(UITableViewCellLayoutManager *)self shouldStackAccessoryViewVerticallyForCell:v6 editing:1])goto LABEL_8; {
  [(UITableViewCellLayoutManager *)self _adjustedBackgroundContentRectForCell:v6];
  }
  double v14 = v13;
  double v16 = v15;
  [v9 bounds];
  double v18 = v17;
  CGFloat rect = v19;
  double v20 = [v6 _textLabel:0];
  [v20 frame];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  double v29 = [v6 _detailTextLabel:0];
  [v29 frame];
  v155.origin.CGFloat x = v30;
  v155.origin.CGFloat y = v31;
  v155.size.CGFloat width = v32;
  v155.size.CGFloat height = v33;
  v141.origin.CGFloat x = v22;
  v141.origin.CGFloat y = v24;
  v141.size.CGFloat width = v26;
  v141.size.CGFloat height = v28;
  CGRect v142 = CGRectUnion(v141, v155);
  double MaxY = CGRectGetMaxY(v142);

  [v6 _marginWidth];
  double v36 = v35;
  [(UITableViewCellLayoutManager *)self contentIndentationForCell:v6];
  double v38 = fmax(v36 + v37, 15.0);
  double v39 = [v6 _imageView:0];
  uint64_t v40 = [v39 image];
  if (v40
    && (double v41 = (void *)v40,
        BOOL v42 = [(UITableViewCellLayoutManager *)self shouldIncreaseMarginForImageViewInCell:v6], v41, v42))
  {
    [v39 frame];
    double v44 = v43;
    CGFloat v46 = v45;
    CGFloat v48 = v47;
    CGFloat v50 = v49;
    [v6 bounds];
    [(UITableViewCellLayoutManager *)self _contentRectLeadingOffsetForCell:v6 editingState:v4 rowWidth:CGRectGetWidth(v143)];
    if ((v12 & 0x80000) != 0)
    {
      v153.origin.CGFloat x = v44 - v51;
      v153.origin.CGFloat y = v46;
      v153.size.CGFloat width = v48;
      v153.size.CGFloat height = v50;
      double v8 = fmin(-v38, CGRectGetMinX(v153) + -15.0);
    }
    else
    {
      v144.origin.CGFloat x = v44 + v51;
      v144.origin.CGFloat y = v46;
      v144.size.CGFloat width = v48;
      v144.size.CGFloat height = v50;
      double v8 = v14 + fmax(v38, CGRectGetMaxX(v144) + 15.0);
    }
  }
  else
  {
    [v6 bounds];
    [(UITableViewCellLayoutManager *)self _contentRectLeadingOffsetForCell:v6 editingState:v4 rowWidth:CGRectGetWidth(v145)];
    if ((v12 & 0x80000) != 0) {
      double v8 = v14 + v16 - v18 - v38 - v71;
    }
    else {
      double v8 = v14 + v38 + v71;
    }
  }

LABEL_72:
  double v136 = v8;
  double v137 = MaxY;
  double v138 = v18;
  double v139 = rect;
  result.size.CGFloat height = v139;
  result.size.CGFloat width = v138;
  result.origin.CGFloat y = v137;
  result.origin.CGFloat x = v136;
  return result;
}

- (double)_contentRectLeadingOffsetForCell:(id)a3 editingState:(BOOL)a4 rowWidth:(double)a5
{
  BOOL v6 = a4;
  double v8 = a3;
  double v9 = [v8 _constants];
  uint64_t v10 = [v8 _tableView];
  BOOL v11 = (v8[28] & 0x80000) == 0;
  BOOL v12 = [(UITableViewCellLayoutManager *)self _editControlOnSameSideAsReorderControlForCell:v8];
  [(UITableViewCellLayoutManager *)self _adjustedBackgroundContentRectForCell:v8 rowWidth:a5];
  double v17 = 0.0;
  if (v6)
  {
    CGFloat v18 = v13;
    CGFloat v19 = v14;
    CGFloat v20 = v15;
    CGFloat v21 = v16;
    if ([(UITableViewCellLayoutManager *)self editControlShouldAppearForCell:v8])
    {
      int v22 = v12 ^ v11;
      [(UITableViewCellLayoutManager *)self _editControlRectForCell:v8 offscreen:0];
      if (v22) {
        CGFloat v27 = v23;
      }
      else {
        CGFloat v27 = v18;
      }
      if (v22) {
        CGFloat v28 = v24;
      }
      else {
        CGFloat v28 = v19;
      }
      if (v22) {
        CGFloat v29 = v25;
      }
      else {
        CGFloat v29 = v20;
      }
      if (v22) {
        CGFloat v30 = v26;
      }
      else {
        CGFloat v30 = v21;
      }
      if (!v22)
      {
        CGFloat v18 = v23;
        CGFloat v19 = v24;
        CGFloat v20 = v25;
        CGFloat v21 = v26;
      }
      v35.origin.CGFloat x = v27;
      v35.origin.CGFloat y = v28;
      v35.size.CGFloat width = v29;
      v35.size.CGFloat height = v30;
      double MaxX = CGRectGetMaxX(v35);
      v36.origin.CGFloat x = v18;
      v36.origin.CGFloat y = v19;
      v36.size.CGFloat width = v20;
      v36.size.CGFloat height = v21;
      double v32 = MaxX - CGRectGetMinX(v36);
      [v9 defaultContentEditPaddingForCell:v8 inTableView:v10];
      double v17 = v32 - v33;
    }
  }

  return v17;
}

- (CGRect)_contentRectForCell:(id)a3 forEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  [a3 bounds];
  double Width = CGRectGetWidth(v15);
  [(UITableViewCellLayoutManager *)self _contentRectForCell:a3 forEditingState:v6 showingDeleteConfirmation:v5 rowWidth:Width];
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (CGRect)_legacy_contentRectForCell:(id)a3 forEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5 rowWidth:(double)a6
{
  BOOL v7 = a4;
  double v9 = a3;
  double v10 = [v9 _tableView];
  double v11 = [v9 _constants];
  [(UITableViewCellLayoutManager *)self _adjustedBackgroundContentRectForCell:v9 rowWidth:a6];
  double v13 = v12;
  double rect_8 = v14;
  double v16 = v15;
  double rect_24 = v17;
  int v18 = v9[28];
  int v19 = [(UITableViewCellLayoutManager *)self _editControlOnSameSideAsReorderControlForCell:v9] ^ ((*(void *)&v18 & 0x80000) == 0);
  [(UITableViewCellLayoutManager *)self _contentRectLeadingOffsetForCell:v9 editingState:v7 rowWidth:a6];
  double v21 = -0.0;
  if (v19) {
    double v21 = v20;
  }
  double v22 = v13 + v21;
  double v23 = v16 - v20;
  if (v7 || [v9 _allowsReorderingWhenNotEditing])
  {
    if ([(UITableViewCellLayoutManager *)self reorderSeparatorShouldAppearForCell:v9])
    {
      [(UITableViewCellLayoutManager *)self _reorderSeparatorRectForCell:v9 offscreen:0];
      CGFloat v28 = v24;
      CGFloat v29 = v25;
      CGFloat v30 = v26;
      CGFloat v31 = v27;
      if ((v18 & 0x80000) == 0)
      {
        v112.origin.CGFloat x = v22;
        v112.origin.CGFloat y = rect_8;
        v112.size.CGFloat width = v23;
        v112.size.CGFloat height = rect_24;
        double MaxX = CGRectGetMaxX(v112);
        v113.origin.CGFloat x = v28;
        v113.origin.CGFloat y = v29;
        v113.size.CGFloat width = v30;
        v113.size.CGFloat height = v31;
        double MinX = CGRectGetMinX(v113);
LABEL_8:
        double v34 = MaxX - MinX;
        double v35 = -0.0;
LABEL_18:
        double v23 = v23 - v34;
        double v22 = v22 + v35;
        goto LABEL_19;
      }
      double v55 = CGRectGetMaxX(*(CGRect *)&v24);
      v116.origin.CGFloat x = v22;
      v116.origin.CGFloat y = rect_8;
      v116.size.CGFloat width = v23;
      v116.size.CGFloat height = rect_24;
      double v35 = v55 - CGRectGetMinX(v116);
    }
    else
    {
      if (![(UITableViewCellLayoutManager *)self reorderControlShouldAppearForCell:v9]|| [(UITableViewCellLayoutManager *)self _editControlOnSameSideAsReorderControlForCell:v9])
      {
LABEL_19:
        if (v7
          && [(UITableViewCellLayoutManager *)self editingAccessoryShouldAppearForCell:v9])
        {
          double rect_16 = v22;
          [(UITableViewCellLayoutManager *)self _editingAccessoryRectForCell:v9 offscreen:1];
          double v57 = v56;
          double v59 = v58;
          double v61 = v60;
          double v63 = v62;
          if ([(UITableViewCellLayoutManager *)self shouldStackAccessoryViewVerticallyForCell:v9 editing:1])
          {
            double v53 = v23;
            double v54 = a6;
            double rect_24 = rect_24 - v63;
            double v22 = rect_16;
            goto LABEL_24;
          }
          if ((*(void *)&v18 & 0x80000) != 0) {
            double v81 = v57;
          }
          else {
            double v81 = rect_16;
          }
          if ((*(void *)&v18 & 0x80000) != 0) {
            double v82 = v59;
          }
          else {
            double v82 = rect_8;
          }
          if ((*(void *)&v18 & 0x80000) != 0) {
            double v83 = v61;
          }
          else {
            double v83 = v23;
          }
          if ((*(void *)&v18 & 0x80000) != 0) {
            double v84 = v63;
          }
          else {
            double v84 = rect_24;
          }
          if ((*(void *)&v18 & 0x80000) != 0) {
            CGFloat v85 = rect_16;
          }
          else {
            CGFloat v85 = v57;
          }
          if ((*(void *)&v18 & 0x80000) != 0) {
            CGFloat v86 = rect_8;
          }
          else {
            CGFloat v86 = v59;
          }
          if ((*(void *)&v18 & 0x80000) != 0) {
            CGFloat v87 = v23;
          }
          else {
            CGFloat v87 = v61;
          }
          if ((*(void *)&v18 & 0x80000) != 0) {
            CGFloat v88 = rect_24;
          }
          else {
            CGFloat v88 = v63;
          }
          double v89 = CGRectGetMaxX(*(CGRect *)&v81);
          v121.origin.CGFloat x = v85;
          v121.origin.CGFloat y = v86;
          v121.size.CGFloat width = v87;
          v121.size.CGFloat height = v88;
          double v90 = v89 - CGRectGetMinX(v121);
          double v91 = [v9 _customEditingAccessoryView:1];

          double v92 = v23;
          goto LABEL_75;
        }
LABEL_23:
        double v53 = v23;
        double v54 = a6;
        goto LABEL_24;
      }
      [(UITableViewCellLayoutManager *)self _reorderControlRectForCell:v9 offscreen:0];
      CGFloat v40 = v36;
      CGFloat v41 = v37;
      CGFloat v42 = v38;
      CGFloat v43 = v39;
      if ((v18 & 0x80000) == 0)
      {
        v114.origin.CGFloat x = v22;
        v114.origin.CGFloat y = rect_8;
        v114.size.CGFloat width = v23;
        v114.size.CGFloat height = rect_24;
        double v44 = CGRectGetMaxX(v114);
        v115.origin.CGFloat x = v40;
        v115.origin.CGFloat y = v41;
        v115.size.CGFloat width = v42;
        v115.size.CGFloat height = v43;
        double MaxX = v44 - CGRectGetMinX(v115);
        [v11 defaultContentReorderPaddingForCell:v9 inTableView:v10];
        goto LABEL_8;
      }
      double v104 = CGRectGetMaxX(*(CGRect *)&v36);
      [v11 defaultContentReorderPaddingForCell:v9 inTableView:v10];
      double v35 = v104 + v105;
    }
    double v34 = v35;
    goto LABEL_18;
  }
  if (![(UITableViewCellLayoutManager *)self accessoryShouldAppearForCell:v9]) {
    goto LABEL_23;
  }
  [(UITableViewCellLayoutManager *)self _accessoryRectForCell:v9 offscreen:0 rowWidth:a6];
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  if ([(UITableViewCellLayoutManager *)self shouldStackAccessoryViewVerticallyForCell:v9 editing:0])
  {
    double v53 = v23;
    double v54 = a6;
    double rect_24 = rect_24 - v52;
    goto LABEL_24;
  }
  if ((*(void *)&v18 & 0x80000) != 0) {
    double v93 = v46;
  }
  else {
    double v93 = v22;
  }
  if ((*(void *)&v18 & 0x80000) != 0) {
    double v94 = v48;
  }
  else {
    double v94 = rect_8;
  }
  if ((*(void *)&v18 & 0x80000) != 0) {
    double v95 = v50;
  }
  else {
    double v95 = v23;
  }
  if ((*(void *)&v18 & 0x80000) != 0) {
    double v96 = v52;
  }
  else {
    double v96 = rect_24;
  }
  double rect_16 = v22;
  if ((*(void *)&v18 & 0x80000) != 0) {
    double v97 = v22;
  }
  else {
    double v97 = v46;
  }
  CGFloat rect = v97;
  if ((*(void *)&v18 & 0x80000) != 0) {
    CGFloat v98 = rect_8;
  }
  else {
    CGFloat v98 = v48;
  }
  double v92 = v23;
  if ((*(void *)&v18 & 0x80000) != 0) {
    CGFloat v99 = v23;
  }
  else {
    CGFloat v99 = v50;
  }
  if ((*(void *)&v18 & 0x80000) != 0) {
    CGFloat v100 = rect_24;
  }
  else {
    CGFloat v100 = v52;
  }
  double v101 = CGRectGetMaxX(*(CGRect *)&v93);
  v122.origin.CGFloat x = rect;
  v122.origin.CGFloat y = v98;
  v122.size.CGFloat width = v99;
  v122.size.CGFloat height = v100;
  double v90 = v101 - CGRectGetMinX(v122);
  double v91 = [v9 _customAccessoryView:1];

LABEL_75:
  double v54 = a6;
  if (!v91)
  {
    [v11 defaultContentAccessoryPadding];
    double v90 = v90 + v102;
  }
  double v53 = v92 - v90;
  double v103 = -0.0;
  if ((*(void *)&v18 & 0x80000) != 0) {
    double v103 = v90;
  }
  double v22 = rect_16 + v103;
LABEL_24:
  double rect_16a = v22;
  objc_msgSend(v9, "_effectiveSafeAreaInsets", *(void *)&rect);
  double v65 = v64;
  double recta = v66;
  [v9 bounds];
  CGFloat v68 = v67;
  CGFloat v70 = v69;
  CGFloat v72 = v71;
  v117.origin.CGFloat x = v22;
  v117.origin.CGFloat y = rect_8;
  v117.size.CGFloat width = v53;
  v117.size.CGFloat height = rect_24;
  double v73 = CGRectGetMinX(v117);
  v118.origin.CGFloat x = v68;
  v118.origin.CGFloat y = v70;
  v118.size.CGFloat width = v54;
  v118.size.CGFloat height = v72;
  double v74 = fmax(v65 - fmax(v73 - CGRectGetMinX(v118), 0.0), 0.0);
  v119.origin.CGFloat x = v68;
  v119.origin.CGFloat y = v70;
  v119.size.CGFloat width = v54;
  v119.size.CGFloat height = v72;
  double v75 = CGRectGetMaxX(v119);
  v120.origin.CGFloat x = rect_16a;
  v120.origin.CGFloat y = rect_8;
  v120.size.CGFloat width = v53;
  v120.size.CGFloat height = rect_24;
  double v76 = v53 - (v74 + fmax(recta - fmax(v75 - CGRectGetMaxX(v120), 0.0), 0.0));

  double v77 = rect_16a + v74;
  double v78 = rect_8 + 0.0;
  double v79 = v76;
  double v80 = rect_24;
  result.size.CGFloat height = v80;
  result.size.CGFloat width = v79;
  result.origin.CGFloat y = v78;
  result.origin.CGFloat x = v77;
  return result;
}

- (void)_reconfigureCell:(id)a3
{
  id v5 = a3;
  int v4 = [v5 _usesModernAccessoriesLayout];
  [v5 setLayoutManager:self];
  if (v4) {
    [v5 _setUsesModernAccessoriesLayout:1];
  }
  [(UITableViewCellLayoutManager *)self _resetTextLabelDefaultFontInCell:v5];
}

- (void)_resetTextLabelDefaultFontInCell:(id)a3
{
  id v7 = a3;
  int v4 = [v7 _textLabel:0];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([v5 usingDefaultFont])
      {
        BOOL v6 = [(UITableViewCellLayoutManager *)self defaultTextLabelFontForCell:v7];
        [v5 _setDefaultFont:v6];
      }
    }
  }
}

- (double)defaultTextLabelFontSizeForCell:(id)a3
{
  id v3 = a3;
  int v4 = [v3 _constants];
  uint64_t v5 = [v3 _cellStyle];

  [v4 defaultTextLabelFontSizeForCellStyle:v5];
  double v7 = v6;

  return v7;
}

- (id)defaultDetailTextLabelFontForCell:(id)a3
{
  return 0;
}

- (id)defaultEditableTextFieldForCell:(id)a3
{
  id v3 = a3;
  int v4 = objc_alloc_init(UITextField);
  uint64_t v5 = +[UIColor clearColor];
  if ([v3 _changesOpaqueStateOfSubviews])
  {
    double v6 = [v3 _contentBackgroundColor];
    [v6 alphaComponent];
    if (v7 == 1.0)
    {
      id v8 = v6;

      uint64_t v5 = v8;
    }
  }
  [(UITextField *)v4 setBackgroundColor:v5];
  double v9 = [v3 _constants];
  double v10 = objc_msgSend(v9, "defaultTextLabelFontForCellStyle:", objc_msgSend(v3, "_cellStyle"));
  [(UITextField *)v4 setFont:v10];

  [(UITextField *)v4 setAdjustsFontForContentSizeCategory:dyld_program_sdk_at_least()];
  -[UITextField setHighlighted:](v4, "setHighlighted:", [v3 _isHighlighted]);
  -[UITextField setEnabled:](v4, "setEnabled:", [v3 isUserInteractionEnabled]);
  [(UIView *)v4 setOpaque:[(UIControl *)v4 isHighlighted] ^ 1];

  return v4;
}

- (id)defaultBadgeForCell:(id)a3
{
  id v3 = [_UITableViewCellBadge alloc];
  int v4 = -[_UITableViewCellBadge initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  return v4;
}

- (id)detailTextLabelForCell:(id)a3
{
  return 0;
}

- (id)editableTextFieldForCell:(id)a3
{
  return 0;
}

- (void)_legacy_layoutSubviewsOfCell:(id)a3
{
  char v5 = [a3 currentStateMask];
  uint64_t v6 = v5 & 1;
  uint64_t v7 = [a3 showingDeleteConfirmation];
  id v8 = [a3 _badge:0];
  int v9 = *((_DWORD *)a3 + 28);
  double v10 = [a3 editingData:v6];
  [(UITableViewCellLayoutManager *)self backgroundEndingRectForCell:a3 forNewEditingState:v6];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  int v19 = [a3 _backgroundView:1];
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);
  CGRect v153 = v19;
  double v20 = [v19 layer];
  objc_msgSend(v20, "setContentsRect:", 0.0, 0.0, 1.0, 1.0);

  [(UITableViewCellLayoutManager *)self selectedBackgroundEndingRectForCell:a3 forNewEditingState:v6];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  CGFloat v29 = [a3 _selectedBackgroundView:0];
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  CGFloat v30 = [v10 editControl:v6];
  if (v30)
  {
    [(UITableViewCellLayoutManager *)self editControlEndingRectForCell:a3 forNewEditingState:v5 & 1];
    objc_msgSend(v30, "setFrame:");
  }
  BOOL v31 = +[UIView _isInAnimationBlock];
  v158 = v30;
  if (v5)
  {
    v173[0] = MEMORY[0x1E4F143A8];
    v173[1] = 3221225472;
    v173[2] = __61__UITableViewCellLayoutManager__legacy_layoutSubviewsOfCell___block_invoke_2;
    v173[3] = &unk_1E52D9FC0;
    id v174 = v30;
    char v175 = 0;
    +[UIView conditionallyAnimate:v31 withAnimation:&__block_literal_global_517 layout:v173 completion:0];
  }
  else
  {
    if ([(UITableViewCellLayoutManager *)self editControlShouldFadeForCell:a3])
    {
      v171[0] = MEMORY[0x1E4F143A8];
      v171[1] = 3221225472;
      v171[2] = __61__UITableViewCellLayoutManager__legacy_layoutSubviewsOfCell___block_invoke_4;
      v171[3] = &unk_1E52D9F70;
      id v172 = v30;
      +[UIView conditionallyAnimate:v31 withAnimation:&__block_literal_global_86_2 layout:v171 completion:0];
    }
    [v30 setRotated:0 animated:1];
  }
  BOOL v32 = [(UITableViewCellLayoutManager *)self reorderControlShouldAppearForCell:a3];
  double v33 = [v10 reorderControl:v32];
  if (v33)
  {
    [(UITableViewCellLayoutManager *)self reorderControlEndingRectForCell:a3 forNewEditingState:v5 & 1 showingDeleteConfirmation:v7];
    objc_msgSend(v33, "setFrame:");
    if ((v5 & 1) != 0 || [a3 _allowsReorderingWhenNotEditing])
    {
      double v34 = 0.0;
      if (v32) {
        double v34 = 1.0;
      }
      goto LABEL_13;
    }
    if (([a3 _allowsReorderingWhenNotEditing] & 1) == 0)
    {
      BOOL v150 = [(UITableViewCellLayoutManager *)self reorderControlShouldFadeForCell:a3];
      double v34 = 0.0;
      if (v150) {
LABEL_13:
      }
        [v33 setAlpha:v34];
    }
  }
  BOOL v35 = [(UITableViewCellLayoutManager *)self reorderSeparatorShouldAppearForCell:a3];
  v156 = [v10 reorderSeparatorView:v35];
  if (!v156) {
    goto LABEL_21;
  }
  [(UITableViewCellLayoutManager *)self reorderSeparatorEndingRectForCell:a3 forNewEditingState:v5 & 1 showingDeleteConfirmation:v7];
  objc_msgSend(v156, "setFrame:");
  if (v5)
  {
    double v36 = 0.0;
    if (v35) {
      double v36 = 1.0;
    }
  }
  else
  {
    BOOL v37 = [(UITableViewCellLayoutManager *)self reorderSeparatorShouldFadeForCell:a3];
    double v36 = 0.0;
    if (!v37) {
      goto LABEL_21;
    }
  }
  [v156 setAlpha:v36];
LABEL_21:
  CGRect v155 = objc_msgSend(a3, "_accessoryView:", (v5 & 1) == 0, v36);
  v157 = [a3 _editingAccessoryView:v5 & 1];
  [(UITableViewCellLayoutManager *)self contentEndingRectForCell:a3 forNewEditingState:v5 & 1];
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v46 = [a3 contentView];
  objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

  if ((v9 & 0x80000) != 0)
  {
    double v47 = [a3 contentView];
    [v47 frame];
    CGRectGetWidth(v176);
  }
  [(UITableViewCellLayoutManager *)self contentIndentationForCell:a3];
  if (v8)
  {
    double v48 = [v8 text];
    uint64_t v49 = [v48 length];

    if (v49)
    {
      double v50 = [v8 superview];

      if (!v50) {
        [a3 addSubview:v8];
      }
    }
    else
    {
      [v8 removeFromSuperview];
    }
    double v51 = [v8 superview];

    if (v51)
    {
      double v52 = [a3 contentView];
      [v52 frame];
      double v54 = v53;
      double v56 = v55;
      double v58 = v57;
      double v60 = v59;

      [v8 frame];
      if (v62 > v60)
      {
        double v61 = round(v61 * (v60 / v62));
        double v62 = v60;
      }
      double v63 = v54 + v58 - v61 + -15.0;
      if ((*(void *)&v9 & 0x80000) != 0) {
        double v63 = v54 + 15.0;
      }
      double v64 = floor((v60 - v62) * 0.5);
      double v65 = v58 - (v61 + 15.0);
      if ((*(void *)&v9 & 0x80000) != 0) {
        double v66 = v61 + 15.0;
      }
      else {
        double v66 = -0.0;
      }
      objc_msgSend(v8, "setFrame:", v63, v64);
      double v67 = [a3 contentView];
      objc_msgSend(v67, "setFrame:", v54 + v66, v56, v65, v60);
    }
  }
  CGFloat v68 = [a3 _imageView:0];
  double v69 = v68;
  if (v68)
  {
    CGFloat v70 = [v68 image];

    if (v70)
    {
      double v71 = [v69 superview];

      if (!v71)
      {
        CGFloat v72 = [a3 contentView];
        [v72 addSubview:v69];
      }
    }
    else
    {
      [v69 removeFromSuperview];
    }
    double v73 = [v69 superview];

    if (v73)
    {
      [(UITableViewCellLayoutManager *)self standardLayoutImageViewFrameForCell:a3 forSizing:0];
      double v75 = v74;
      double v77 = v76;
      double v79 = v78;
      double v81 = v80;
      [v69 frame];
      v180.origin.CGFloat x = v82;
      v180.origin.CGFloat y = v83;
      v180.size.CGFloat width = v84;
      v180.size.CGFloat height = v85;
      v177.origin.CGFloat x = v75;
      v177.origin.CGFloat y = v77;
      v177.size.CGFloat width = v79;
      v177.size.CGFloat height = v81;
      BOOL v86 = CGRectEqualToRect(v177, v180);
      objc_msgSend(v69, "setFrame:", v75, v77, v79, v81);
      if (!v86) {
        [a3 _updateSeparatorContent:1];
      }
    }
  }
  v154 = v8;
  CGFloat v87 = [a3 _textLabel:0];
  CGFloat v88 = v87;
  if (v87)
  {
    double v89 = [v87 font];
    [v89 pointSize];
    double v91 = v90;

    if (v91 == 0.0)
    {
      double v92 = [(UITableViewCellLayoutManager *)self defaultTextLabelFontForCell:a3];
      [v88 setFont:v92];
    }
    double v93 = [v88 text];
    double v94 = v93;
    if (v93 && [v93 length])
    {
      double v95 = [v88 superview];

      if (!v95)
      {
        double v96 = [a3 contentView];
        [v96 addSubview:v88];
      }
    }
    else
    {
      [v88 removeFromSuperview];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v97 = [(UITableViewCellLayoutManager *)self shouldIncreaseMarginForImageViewInCell:a3];
    double v98 = 0.0;
    if (!v97)
    {
      objc_msgSend(a3, "bounds", 0.0);
      [(UITableViewCellLayoutManager *)self requiredIndentationForFirstLineOfCell:a3 rowWidth:CGRectGetWidth(v178)];
    }
    [v88 _setFirstParagraphFirstLineHeadIndent:v98];
  }
  unsigned int v152 = v7;
  CGFloat v99 = v10;
  CGFloat v100 = [a3 _detailTextLabel:0];
  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  [a3 bounds];
  [(UITableViewCellLayoutManager *)self getTextLabelRect:&v169 detailTextLabelRect:&v167 forCell:a3 rowWidth:0 forSizing:CGRectGetWidth(v179)];
  objc_msgSend(v88, "setFrame:", v169, v170);
  CGRect v151 = v100;
  objc_msgSend(v100, "setFrame:", v167, v168);
  if ([(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:a3])
  {
    [v88 frame];
    [v88 _capOffsetFromBoundsTop];
    double v101 = [v88 font];
    [v101 capHeight];
  }
  uint64_t v102 = [v69 superview];
  if (v102)
  {
    double v103 = (void *)v102;
    BOOL v104 = [(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:a3];

    if (v104)
    {
      if (![(UITableViewCellLayoutManager *)self shouldIncreaseMarginForImageViewInCell:a3])
      {
        double v105 = [a3 contentView];
        [v105 bringSubviewToFront:v69];
      }
      [v69 frame];
      objc_msgSend(v69, "setFrame:");
    }
  }
  uint64_t v106 = [v158 superview];
  double v107 = (double *)MEMORY[0x1E4F1DB20];
  if (v106
    && (double v108 = (void *)v106,
        BOOL v109 = [(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:a3], v108, v109))
  {
    [v158 frame];
    objc_msgSend(a3, "convertRect:toView:", v158);
  }
  else
  {
    double v110 = *v107;
    double v111 = v107[1];
    double v112 = v107[2];
    double v113 = v107[3];
  }
  objc_msgSend(v158, "adjustLayoutForFocalRect:", v110, v111, v112, v113);
  uint64_t v114 = [v33 superview];
  if (v114
    && (CGRect v115 = (void *)v114,
        BOOL v116 = [(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:a3], v115, v116))
  {
    [v33 frame];
    objc_msgSend(a3, "convertRect:toView:", v33);
  }
  else
  {
    double v117 = *v107;
    double v118 = v107[1];
    double v119 = v107[2];
    double v120 = v107[3];
  }
  objc_msgSend(v33, "adjustLayoutForFocalRect:", v117, v118, v119, v120);
  v165[0] = MEMORY[0x1E4F143A8];
  v165[1] = 3221225472;
  v165[2] = __61__UITableViewCellLayoutManager__legacy_layoutSubviewsOfCell___block_invoke_5;
  v165[3] = &unk_1E52D9F70;
  id v121 = v33;
  id v166 = v121;
  +[UIView performWithoutAnimation:v165];
  double v123 = v155;
  if (!v155)
  {
LABEL_77:
    if (!v157) {
      goto LABEL_94;
    }
    [(UITableViewCellLayoutManager *)self editingAccessoryEndingRectForCell:a3 forNewEditingState:v5 & 1 showingDeleteConfirmation:v152];
    double v133 = v132;
    double v135 = v134;
    double v137 = v136;
    double v139 = v138;
    if (v5)
    {
      if ([(UITableViewCellLayoutManager *)self editingAccessoryShouldAppearForCell:a3])
      {
        id v140 = [v157 superview];
        if (!v140)
        {
          BOOL v141 = +[UIView areAnimationsEnabled];
          +[UIView setAnimationsEnabled:0];
          objc_msgSend(v157, "setFrame:", v133, v135, v137, v139);
          BOOL v142 = v141;
          double v123 = v155;
          +[UIView setAnimationsEnabled:v142];
        }
        [v157 _setHiddenForReuse:0];
        if (v140 != a3) {
          [a3 addSubview:v157];
        }
      }
      objc_msgSend(v157, "setFrame:", v133, v135, v137, v139);
      double v122 = 1.0;
LABEL_93:
      [v157 setAlpha:v122];
      goto LABEL_94;
    }
LABEL_92:
    objc_msgSend(v157, "setFrame:", v133, v135, v137, v139);
    BOOL v148 = [(UITableViewCellLayoutManager *)self editingAccessoryShouldFadeForCell:a3];
    double v122 = 0.0;
    if (!v148) {
      goto LABEL_94;
    }
    goto LABEL_93;
  }
  [(UITableViewCellLayoutManager *)self accessoryEndingRectForCell:a3 forNewEditingState:v5 & 1 showingDeleteConfirmation:v152];
  double v128 = v124;
  double v129 = v125;
  double v130 = v126;
  double v131 = v127;
  if (v5)
  {
    objc_msgSend(v155, "setFrame:", v124, v125, v126, v127);
    if ([(UITableViewCellLayoutManager *)self accessoryShouldFadeForCell:a3]) {
      [v155 setAlpha:0.0];
    }
    goto LABEL_77;
  }
  id v143 = [v155 superview];
  if (!v143)
  {
    v159[0] = MEMORY[0x1E4F143A8];
    v159[1] = 3221225472;
    v159[2] = __61__UITableViewCellLayoutManager__legacy_layoutSubviewsOfCell___block_invoke_6;
    v159[3] = &unk_1E52DA520;
    id v160 = v155;
    double v161 = v128;
    double v162 = v129;
    double v163 = v130;
    double v164 = v131;
    double v123 = v155;
    +[UIView performWithoutAnimation:v159];
  }
  [v123 _setHiddenForReuse:0];
  if (v143 != a3) {
    [a3 addSubview:v123];
  }

  objc_msgSend(v123, "setFrame:", v128, v129, v130, v131);
  [v123 setAlpha:1.0];
  if (v157)
  {
    [(UITableViewCellLayoutManager *)self editingAccessoryEndingRectForCell:a3 forNewEditingState:0 showingDeleteConfirmation:v152];
    double v133 = v144;
    double v135 = v145;
    double v137 = v146;
    double v139 = v147;
    goto LABEL_92;
  }
LABEL_94:
  if (!objc_msgSend(a3, "style", v122))
  {
    CGRect v149 = [a3 _detailTextLabel:0];
    [v149 removeFromSuperview];

    double v123 = v155;
  }
  [(UITableViewCellLayoutManager *)self _layoutFocusGuidesForCell:a3];
}

uint64_t __61__UITableViewCellLayoutManager__legacy_layoutSubviewsOfCell___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:65600 delay:a2 options:a3 animations:0.0 completion:0.0];
}

uint64_t __61__UITableViewCellLayoutManager__legacy_layoutSubviewsOfCell___block_invoke_2(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

uint64_t __61__UITableViewCellLayoutManager__legacy_layoutSubviewsOfCell___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:131136 delay:a2 options:a3 animations:0.0 completion:0.0];
}

uint64_t __61__UITableViewCellLayoutManager__legacy_layoutSubviewsOfCell___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __61__UITableViewCellLayoutManager__legacy_layoutSubviewsOfCell___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __61__UITableViewCellLayoutManager__legacy_layoutSubviewsOfCell___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)cell:(id)a3 willTransitionToState:(unint64_t)a4
{
  id v6 = a3;
  if (([v6 _usesModernAccessoriesLayout] & 1) == 0) {
    [(UITableViewCellLayoutManager *)self _legacy_cell:v6 willTransitionToState:a4];
  }
}

- (void)_legacy_cell:(id)a3 willTransitionToState:(unint64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__UITableViewCellLayoutManager__legacy_cell_willTransitionToState___block_invoke;
  v8[3] = &unk_1E52DA070;
  double v10 = self;
  unint64_t v11 = a4;
  id v9 = v6;
  id v7 = v6;
  +[UIView performWithoutAnimation:v8];
}

void __67__UITableViewCellLayoutManager__legacy_cell_willTransitionToState___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) currentStateMask];
  unint64_t v3 = *(void *)(a1 + 48);
  BOOL v4 = (v2 & 1) == 0;
  id v20 = [*(id *)(a1 + 32) editingData:1];
  [*(id *)(a1 + 40) backgroundStartingRectForCell:*(void *)(a1 + 32) forNewEditingState:v3 & 1];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [*(id *)(a1 + 32) _backgroundView:0];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  double v14 = [*(id *)(a1 + 32) _selectedBackgroundView:0];
  objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);

  if ((v3 & v4) == 1)
  {
    if ([*(id *)(a1 + 40) editControlShouldAppearForCell:*(void *)(a1 + 32)])
    {
      double v15 = [v20 editControl:1];
      [*(id *)(a1 + 40) editControlStartingRectForCell:*(void *)(a1 + 32) forNewEditingState:1];
      objc_msgSend(v15, "setFrame:");
      if (([*(id *)(a1 + 32) isEditing] & 1) == 0
        && [*(id *)(a1 + 40) editControlShouldFadeForCell:*(void *)(a1 + 32)])
      {
        [v15 setAlpha:0.0];
      }
    }
  }
  else if ((v3 & 0x40000000) == 0 || (v2 & 0x40000000) != 0)
  {
    goto LABEL_21;
  }
  if ([*(id *)(a1 + 40) reorderControlShouldAppearForCell:*(void *)(a1 + 32)])
  {
    double v16 = [v20 reorderControl:1];
    [*(id *)(a1 + 40) reorderControlStartingRectForCell:*(void *)(a1 + 32) forNewEditingState:v3 & 1 showingDeleteConfirmation:(v3 >> 1) & 1];
    objc_msgSend(v16, "setFrame:");
    if ((v3 & 1) != 0
      && ([*(id *)(a1 + 32) isEditing] & 1) == 0
      && [*(id *)(a1 + 40) reorderControlShouldFadeForCell:*(void *)(a1 + 32)])
    {
      [v16 setAlpha:0.0];
    }
  }
  if ([*(id *)(a1 + 40) reorderSeparatorShouldAppearForCell:*(void *)(a1 + 32)])
  {
    double v17 = [v20 reorderSeparatorView:1];
    [*(id *)(a1 + 40) reorderSeparatorStartingRectForCell:*(void *)(a1 + 32) forNewEditingState:v3 & 1 showingDeleteConfirmation:(v3 >> 1) & 1];
    objc_msgSend(v17, "setFrame:");
    if ((v3 & 1) != 0
      && ([*(id *)(a1 + 32) isEditing] & 1) == 0
      && [*(id *)(a1 + 40) reorderSeparatorShouldFadeForCell:*(void *)(a1 + 32)])
    {
      [v17 setAlpha:0.0];
    }
  }
LABEL_21:
  if ((v3 & 1) == 0
    && (v2 & 1) != 0
    && [*(id *)(a1 + 40) accessoryShouldAppearForCell:*(void *)(a1 + 32)])
  {
    double v18 = [*(id *)(a1 + 32) _accessoryView:1];
    [*(id *)(a1 + 32) addSubview:v18];
    [*(id *)(a1 + 40) accessoryStartingRectForCell:*(void *)(a1 + 32) forNewEditingState:0 showingDeleteConfirmation:(v3 >> 1) & 1];
    objc_msgSend(v18, "setFrame:");
    if (([*(id *)(a1 + 32) isEditing] & 1) == 0
      && [*(id *)(a1 + 40) accessoryShouldFadeForCell:*(void *)(a1 + 32)]
      && (v3 & 2) == 0)
    {
      [v18 setAlpha:0.0];
    }
  }
  if ((v3 & v4) != 0
    && [*(id *)(a1 + 40) editingAccessoryShouldAppearForCell:*(void *)(a1 + 32)])
  {
    int v19 = [*(id *)(a1 + 32) _editingAccessoryView:1];
    [*(id *)(a1 + 32) addSubview:v19];
    [*(id *)(a1 + 40) editingAccessoryStartingRectForCell:*(void *)(a1 + 32) forNewEditingState:1 showingDeleteConfirmation:(v3 >> 1) & 1];
    objc_msgSend(v19, "setFrame:");
    if (([*(id *)(a1 + 32) isEditing] & 1) == 0
      && [*(id *)(a1 + 40) editingAccessoryShouldFadeForCell:*(void *)(a1 + 32)])
    {
      [v19 setAlpha:0.0];
    }
  }
}

- (void)cell:(id)a3 didTransitionToState:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 _usesModernAccessoriesLayout]) {
    [(UITableViewCellLayoutManager *)self _modern_cell:v6 didTransitionToState:a4];
  }
  else {
    [(UITableViewCellLayoutManager *)self _legacy_cell:v6 didTransitionToState:a4];
  }
}

- (void)_modern_cell:(id)a3 didTransitionToState:(unint64_t)a4
{
  char v4 = a4;
  id v7 = a3;
  if ((v4 & 1) == 0
    && ([v7 isEditing] & 1) == 0
    && ([v7 _allowsReorderingWhenNotEditing] & 1) == 0)
  {
    [v7 removeEditingData];
  }
  id v6 = [v7 _focusSystem];

  if (v6) {
    [(UITableViewCellLayoutManager *)self _updateFocusGuidesForCell:v7 editing:v4 & 1];
  }
}

- (void)_legacy_cell:(id)a3 didTransitionToState:(unint64_t)a4
{
  char v4 = a4;
  id v19 = a3;
  BOOL v6 = +[UIView areAnimationsEnabled];
  +[UIView setAnimationsEnabled:0];
  int v7 = [v19 isEditing];
  if (v4)
  {
    if (v7)
    {
      double v8 = [v19 _accessoryView:1];
      double v9 = [v19 _editingAccessoryView:1];

      if (v8 != v9)
      {
        double v10 = [v19 _accessoryView:0];
LABEL_9:
        double v13 = v10;
        [v10 removeFromSuperview];
      }
    }
  }
  else if ((v7 & 1) == 0 && ([v19 _allowsReorderingWhenNotEditing] & 1) == 0)
  {
    [v19 removeEditingData];
    double v11 = [v19 _accessoryView:1];
    double v12 = [v19 _editingAccessoryView:1];

    if (v11 != v12)
    {
      double v10 = [v19 _editingAccessoryView:0];
      goto LABEL_9;
    }
  }
  double v14 = [v19 _focusSystem];

  if (v14) {
    [(UITableViewCellLayoutManager *)self _updateFocusGuidesForCell:v19 editing:v4 & 1];
  }
  double v15 = [v19 _accessoryView:0];
  double v16 = v15;
  if (v15)
  {
    double v17 = [v15 superview];

    if (!v17)
    {
      double v18 = [v16 layer];
      [v18 clearHasBeenCommitted];
    }
  }
  +[UIView setAnimationsEnabled:v6];
}

- (void)_updateFocusGuidesForCell:(id)a3 editing:(BOOL)a4
{
  BOOL v4 = a4;
  id v16 = a3;
  BOOL v6 = [v16 _focusSystem];

  if (v6 && v4)
  {
    int v7 = [v16 _editingControlsFocusGuide];

    if (!v7)
    {
      double v8 = objc_alloc_init(UIFocusContainerGuide);
      [v16 _setEditingControlsFocusGuide:v8];

      double v9 = [v16 _editingControlsFocusGuide];
      [v9 setIdentifier:@"UITableViewCellEditingFocusGuide"];

      double v10 = [v16 _editingControlsFocusGuide];
      [v16 addLayoutGuide:v10];
    }
    [(UITableViewCellLayoutManager *)self _layoutFocusGuidesForCell:v16];
  }
  else
  {
    double v11 = [v16 _focusSystem];
    double v12 = v11;
    if (v11 && v4)
    {
    }
    else
    {
      double v13 = [v16 _editingControlsFocusGuide];

      double v14 = v16;
      if (!v13) {
        goto LABEL_12;
      }
      double v15 = [v16 _editingControlsFocusGuide];
      [v16 removeLayoutGuide:v15];

      [v16 _setEditingControlsFocusGuide:0];
    }
  }
  double v14 = v16;
LABEL_12:
}

- (BOOL)editControlShouldAppearForCell:(id)a3
{
  id v3 = a3;
  if ([v3 wasSwiped])
  {
    char v4 = 0;
  }
  else if ([v3 editingStyle])
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 shouldIndentWhileEditing];
  }

  return v4;
}

- (CGRect)editControlEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  [(UITableViewCellLayoutManager *)self _editControlRectForCell:a3 offscreen:!a4];
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (BOOL)editControlShouldFadeForCell:(id)a3
{
  return 1;
}

- (BOOL)reorderControlShouldAppearForCell:(id)a3
{
  id v3 = a3;
  if ([v3 wasSwiped] && !objc_msgSend(v3, "_allowsReorderingWhenNotEditing")) {
    char v4 = 0;
  }
  else {
    char v4 = [v3 showsReorderControl];
  }

  return v4;
}

- (CGRect)reorderControlStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  [(UITableViewCellLayoutManager *)self _reorderControlRectForCell:a3 offscreen:a4 & ~a5];
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (CGRect)reorderControlEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = [v8 showsReorderControl] ^ 1;
  if ((v9 & 1) == 0 && !a4) {
    uint64_t v9 = ([v8 _allowsReorderingWhenNotEditing] | v5) ^ 1;
  }
  [(UITableViewCellLayoutManager *)self _reorderControlRectForCell:v8 offscreen:v9];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (BOOL)reorderControlShouldFadeForCell:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 _tableView];
  char v6 = [v5 _isShowingIndex];

  BOOL v7 = (v6 & 1) != 0
    || [(UITableViewCellLayoutManager *)self accessoryShouldAppearForCell:v4]
    && ![(UITableViewCellLayoutManager *)self editingAccessoryShouldAppearForCell:v4];

  return v7;
}

- (BOOL)reorderSeparatorShouldAppearForCell:(id)a3
{
  id v4 = a3;
  if (-[UITableViewCellLayoutManager reorderControlShouldAppearForCell:](self, "reorderControlShouldAppearForCell:", v4)&& ([v4 _allowsReorderingWhenNotEditing] & 1) == 0)
  {
    if ([v4 editingAccessoryType])
    {
      BOOL v5 = 1;
    }
    else
    {
      BOOL v7 = [v4 _editingAccessoryView:1];
      BOOL v5 = v7 != 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (CGRect)reorderSeparatorStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  [(UITableViewCellLayoutManager *)self _reorderSeparatorRectForCell:a3 offscreen:a4 & ~a5];
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (CGRect)reorderSeparatorEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  [(UITableViewCellLayoutManager *)self _reorderSeparatorRectForCell:a3 offscreen:!a4 && !a5];
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (BOOL)reorderSeparatorShouldFadeForCell:(id)a3
{
  id v3 = [a3 _tableView];
  char v4 = [v3 _isShowingIndex];

  return v4;
}

- (BOOL)accessoryShouldAppearForCell:(id)a3
{
  id v3 = [a3 _accessoryView:1];
  BOOL v4 = v3 != 0;

  return v4;
}

- (CGRect)accessoryStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  [(UITableViewCellLayoutManager *)self _accessoryRectForCell:a3 offscreen:!a4 && !a5];
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (CGRect)accessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = v8;
  if (v6 && a5)
  {
    double v10 = [v8 _tableView];
    -[UITableViewCellLayoutManager _accessoryRectForCell:offscreen:](self, "_accessoryRectForCell:offscreen:", v9, [v10 _isEditingForSwipeDeletion] ^ 1);
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    uint64_t v9 = v10;
  }
  else
  {
    [(UITableViewCellLayoutManager *)self _accessoryRectForCell:v8 offscreen:v6];
    double v12 = v19;
    double v14 = v20;
    double v16 = v21;
    double v18 = v22;
  }

  double v23 = v12;
  double v24 = v14;
  double v25 = v16;
  double v26 = v18;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (BOOL)accessoryShouldFadeForCell:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 _customAccessoryView:0];
  uint64_t v6 = [v4 _customEditingAccessoryView:0];
  uint64_t v7 = [v4 accessoryType];
  uint64_t v8 = [v4 editingAccessoryType];
  if (v5 && v6)
  {
    if (v5 == v6)
    {
LABEL_16:
      BOOL v13 = 0;
      goto LABEL_17;
    }
  }
  else if (v5 || v6 || !v7 || !v8)
  {
    uint64_t v9 = v5 | v7;
    BOOL v10 = (v5 | v7) != 0;
    if ((!v9 || !(v6 | v8))
      && (v10 & [(UITableViewCellLayoutManager *)self reorderControlShouldAppearForCell:v4] & 1) == 0)
    {
      double v11 = [v4 _tableView];
      char v12 = [v11 _isShowingIndex];

      if ((v12 & 1) == 0) {
        goto LABEL_16;
      }
    }
  }
  else if (v7 == v8)
  {
    goto LABEL_16;
  }
  BOOL v13 = 1;
LABEL_17:

  return v13;
}

- (BOOL)editingAccessoryShouldAppearForCell:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _editingAccessoryView:1];
  if (v4) {
    int v5 = [v3 showingDeleteConfirmation] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (CGRect)editingAccessoryStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  [(UITableViewCellLayoutManager *)self _editingAccessoryRectForCell:a3 offscreen:!a4 && !a5];
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (CGRect)editingAccessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  [(UITableViewCellLayoutManager *)self _editingAccessoryRectForCell:a3 offscreen:a4 | a5];
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (BOOL)editingAccessoryShouldFadeForCell:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 _customAccessoryView:0];
  uint64_t v5 = [v3 _customEditingAccessoryView:0];
  uint64_t v6 = [v3 accessoryType];
  uint64_t v7 = [v3 editingAccessoryType];
  if (v4 && v5)
  {
    if (v4 == v5)
    {
LABEL_15:
      BOOL v10 = 0;
      goto LABEL_16;
    }
  }
  else if (v4 || v5 || !v6 || !v7)
  {
    if (!(v4 | v6) || !(v5 | v7))
    {
      double v8 = [v3 _tableView];
      char v9 = [v8 _isShowingIndex];

      if ((v9 & 1) == 0) {
        goto LABEL_15;
      }
    }
  }
  else if (v6 == v7)
  {
    goto LABEL_15;
  }
  BOOL v10 = 1;
LABEL_16:

  return v10;
}

- (CGRect)contentStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  BOOL v5 = !a4;
  id v6 = a3;
  -[UITableViewCellLayoutManager _contentRectForCell:forEditingState:showingDeleteConfirmation:](self, "_contentRectForCell:forEditingState:showingDeleteConfirmation:", v6, v5, [v6 showingDeleteConfirmation]);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)contentEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  -[UITableViewCellLayoutManager _contentRectForCell:forEditingState:showingDeleteConfirmation:](self, "_contentRectForCell:forEditingState:showingDeleteConfirmation:", v6, v4, [v6 showingDeleteConfirmation]);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)contentStartingRectForCell:(id)a3 forDisplayOfDeleteConfirmation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  -[UITableViewCellLayoutManager _contentRectForCell:forEditingState:showingDeleteConfirmation:](self, "_contentRectForCell:forEditingState:showingDeleteConfirmation:", v6, [v6 currentStateMask] & 1, !v4);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)contentEndingRectForCell:(id)a3 forDisplayOfDeleteConfirmation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  -[UITableViewCellLayoutManager _contentRectForCell:forEditingState:showingDeleteConfirmation:](self, "_contentRectForCell:forEditingState:showingDeleteConfirmation:", v6, [v6 currentStateMask] & 1, v4);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)textRectForCell:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  [(UITableViewCellLayoutManager *)self textRectForCell:v4 rowWidth:0 forSizing:CGRectGetWidth(v17)];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (double)requiredIndentationForFirstLineOfCell:(id)a3 rowWidth:(double)a4
{
  [(UITableViewCellLayoutManager *)self requiredIndentationForFirstLineOfCell:a3 rowWidth:0 forSizing:a4];
  return result;
}

- (double)requiredIndentationForFirstLineOfCell:(id)a3 rowWidth:(double)a4 forSizing:(BOOL)a5
{
  BOOL v5 = a5;
  double v7 = a3;
  double v8 = 0.0;
  if (![(UITableViewCellLayoutManager *)self shouldIncreaseMarginForImageViewInCell:v7])
  {
    int v9 = v7[28];
    [v7 _effectiveSafeAreaInsets];
    if ((*(void *)&v9 & 0x80000) != 0) {
      double v12 = v11;
    }
    else {
      double v12 = v10;
    }
    [(UITableViewCellLayoutManager *)self contentIndentationForCell:v7];
    double v14 = v13;
    [v7 _marginWidth];
    double v16 = v15;
    CGRect v17 = [v7 _imageView:0];
    double v18 = [v17 image];

    if (v18)
    {
      double v19 = fmax(v14 + v16 - v12, 15.0);
      double v20 = [v7 _constants];
      double v21 = [v7 traitCollection];
      [v20 defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:0 traitCollection:v21];
      double v23 = v22;

      [(UITableViewCellLayoutManager *)self standardLayoutImageViewFrameForCell:v7 forSizing:v5];
      double v25 = v24;
      double v26 = [v17 image];
      double v27 = [v7 traitCollection];
      if (_UITableCellShouldCenterImageHorizontallyForTraitCollection(v26, v27)) {
        double v25 = v23;
      }

      double v28 = [v7 _constants];
      CGFloat v29 = [v7 _tableView];
      int v30 = [v28 imageViewOffsetByLayoutMarginsForCell:v7 inTableView:v29];

      if (v30)
      {
        [v7 directionalLayoutMargins];
        double v32 = v31;
        [v7 _defaultLeadingMarginWidth];
        double v34 = fmax(v32, v33) - v12;
      }
      else
      {
        [(UITableViewCellLayoutManager *)self contentIndentationForCell:v7];
      }
      double v8 = fmax(v19, v25 + v34 + 15.0) - v19;
    }
    else
    {
      double v8 = 0.0;
    }
  }
  return v8;
}

- (CGRect)textRectForCell:(id)a3 rowWidth:(double)a4
{
  [(UITableViewCellLayoutManager *)self textRectForCell:a3 rowWidth:0 forSizing:a4];
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (void)getTextLabelRect:(CGRect *)a3 detailTextLabelRect:(CGRect *)a4 forCell:(id)a5 rowWidth:(double)a6 forSizing:(BOOL)a7
{
  BOOL v7 = a7;
  double v28 = a5;
  BOOL v12 = [(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:v28];
  [(UITableViewCellLayoutManager *)self textRectForCell:v28 rowWidth:v7 forSizing:a6];
  double x = v13;
  double y = v15;
  double width = v17;
  double height = v19;
  if (v12)
  {
    double v21 = [v28 _textLabel:0];
    if (v21)
    {
      -[UITableViewCellLayoutManager optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:](self, "optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:", v21, 0, 0, x, y, width, height);
      double v23 = v22;
      double v25 = v24;
    }
    else
    {
      double v23 = *MEMORY[0x1E4F1DB30];
      double v25 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    double v26 = ceil((height - v25) * 0.5);
    if ((v28[28] & 0x80000) != 0)
    {
      v30.origin.double x = x;
      v30.origin.double y = y;
      v30.size.double width = width;
      v30.size.double height = height;
      double x = CGRectGetMaxX(v30) - v23;
    }
    v31.origin.double x = 0.0;
    v31.origin.double y = 0.0;
    v31.size.double width = v23;
    v31.size.double height = v25;
    CGRect v32 = CGRectOffset(v31, x, v26);
    double x = v32.origin.x;
    double y = v32.origin.y;
    double width = v32.size.width;
    double height = v32.size.height;
  }
  if (a3)
  {
    a3->origin.double x = x;
    a3->origin.double y = y;
    a3->size.double width = width;
    a3->size.double height = height;
  }
  if (a4)
  {
    CGSize v27 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    a4->origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    a4->size = v27;
  }
}

+ (id)_externalTextColor
{
  return +[UIColor whiteColor];
}

+ (id)_externalDetailTextColor
{
  return +[UIColor whiteColor];
}

@end