@interface SBHRootFolderVisualConfiguration
- (BOOL)isEqual:(id)a3;
- (CGSize)editModeButtonSize;
- (CGSize)pageControlCustomPadding;
- (CGSize)pageControlFrameInset;
- (CGSize)pageManagementFocusModeOptionsButtonSize;
- (NSDirectionalEdgeInsets)editModeButtonContentEdgeInsets;
- (NSString)description;
- (SBHRootFolderVisualConfiguration)init;
- (SBRootFolderViewPageManagementLayoutMetrics)pageManagementLayoutMetricsForLayoutConfiguration:(SEL)a3;
- (UIEdgeInsets)dockBackgroundViewInsets;
- (UIEdgeInsets)dockListViewInsets;
- (UIOffset)editModeButtonLayoutOffset;
- (double)dockBackgroundViewCornerRadius;
- (double)dockViewHeight;
- (double)editingEntryAreaHorizontalInset;
- (double)idleTextVerticalOffset;
- (double)pageControlVerticalOffset;
- (double)pageManagementPageCheckboxDiameter;
- (double)pageManagementPageCheckboxVerticalMargin;
- (double)scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)setDockBackgroundViewCornerRadius:(double)a3;
- (void)setDockBackgroundViewInsets:(UIEdgeInsets)a3;
- (void)setDockListViewInsets:(UIEdgeInsets)a3;
- (void)setDockViewHeight:(double)a3;
- (void)setEditModeButtonContentEdgeInsets:(NSDirectionalEdgeInsets)a3;
- (void)setEditModeButtonLayoutOffset:(UIOffset)a3;
- (void)setEditModeButtonSize:(CGSize)a3;
- (void)setEditingEntryAreaHorizontalInset:(double)a3;
- (void)setIdleTextVerticalOffset:(double)a3;
- (void)setPageControlCustomPadding:(CGSize)a3;
- (void)setPageControlFrameInset:(CGSize)a3;
- (void)setPageControlVerticalOffset:(double)a3;
- (void)setPageManagementFocusModeOptionsButtonSize:(CGSize)a3;
- (void)setPageManagementLayoutMetrics:(SBRootFolderViewPageManagementLayoutMetrics *)a3 forLayoutConfiguration:(int64_t)a4;
- (void)setPageManagementPageCheckboxDiameter:(double)a3;
- (void)setPageManagementPageCheckboxVerticalMargin:(double)a3;
- (void)setScrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView:(double)a3;
@end

@implementation SBHRootFolderVisualConfiguration

- (double)dockBackgroundViewCornerRadius
{
  return self->_dockBackgroundViewCornerRadius;
}

- (double)dockViewHeight
{
  return self->_dockViewHeight;
}

- (double)scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView
{
  return self->_scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView;
}

- (double)pageControlVerticalOffset
{
  return self->_pageControlVerticalOffset;
}

- (CGSize)pageControlFrameInset
{
  double width = self->_pageControlFrameInset.width;
  double height = self->_pageControlFrameInset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)editingEntryAreaHorizontalInset
{
  return self->_editingEntryAreaHorizontalInset;
}

- (UIOffset)editModeButtonLayoutOffset
{
  double horizontal = self->_editModeButtonLayoutOffset.horizontal;
  double vertical = self->_editModeButtonLayoutOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (NSDirectionalEdgeInsets)editModeButtonContentEdgeInsets
{
  double top = self->_editModeButtonContentEdgeInsets.top;
  double leading = self->_editModeButtonContentEdgeInsets.leading;
  double bottom = self->_editModeButtonContentEdgeInsets.bottom;
  double trailing = self->_editModeButtonContentEdgeInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (SBHRootFolderVisualConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBHRootFolderVisualConfiguration;
  NSDirectionalEdgeInsets result = [(SBHRootFolderVisualConfiguration *)&v3 init];
  if (result) {
    result->_idleTextVerticalOffset = 23.0;
  }
  return result;
}

- (SBRootFolderViewPageManagementLayoutMetrics)pageManagementLayoutMetricsForLayoutConfiguration:(SEL)a3
{
  return self;
}

- (void)setPageManagementLayoutMetrics:(SBRootFolderViewPageManagementLayoutMetrics *)a3 forLayoutConfiguration:(int64_t)a4
{
  if ((unint64_t)a3 <= 5)
  {
    uint64_t v8 = qword_1D81E9958[(void)a3];
    uint64_t v9 = qword_1D81E9988[(void)a3];
    uint64_t v10 = qword_1D81E99B8[(void)a3];
    *(Class *)((char *)&self->super.isa + qword_1D81E9928[(void)a3]) = v4;
    *(Class *)((char *)&self->super.isa + v8) = v5;
    *(Class *)((char *)&self->super.isa + v9) = v6;
    *(Class *)((char *)&self->super.isa + v10) = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((void *)result + 21) = *(void *)&self->_idleTextVerticalOffset;
    *((void *)result + 22) = *(void *)&self->_pageControlVerticalOffset;
    *(CGSize *)((char *)result + 232) = self->_pageControlFrameInset;
    *(CGSize *)((char *)result + 248) = self->_pageControlCustomPadding;
    *((void *)result + 23) = *(void *)&self->_scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView;
    *((void *)result + 24) = *(void *)&self->_pageManagementPageCheckboxVerticalMargin;
    *((void *)result + 25) = *(void *)&self->_pageManagementPageCheckboxDiameter;
    *(CGSize *)((char *)result + 264) = self->_pageManagementFocusModeOptionsButtonSize;
    CGSize cellSpacing = self->_pageManagement1x1LayoutMetrics.cellSpacing;
    *(_OWORD *)((char *)result + 24) = *(_OWORD *)&self->_pageManagement1x1LayoutMetrics.bottomMargin;
    *(CGSize *)((char *)result + 8) = cellSpacing;
    CGSize v6 = self->_pageManagement2x1LayoutMetrics.cellSpacing;
    *(_OWORD *)((char *)result + 56) = *(_OWORD *)&self->_pageManagement2x1LayoutMetrics.bottomMargin;
    *(CGSize *)((char *)result + 40) = v6;
    CGSize v7 = self->_pageManagement2x2LayoutMetrics.cellSpacing;
    *(_OWORD *)((char *)result + 88) = *(_OWORD *)&self->_pageManagement2x2LayoutMetrics.bottomMargin;
    *(CGSize *)((char *)result + 72) = v7;
    CGSize v8 = self->_pageManagement3x2LayoutMetrics.cellSpacing;
    *(_OWORD *)((char *)result + 120) = *(_OWORD *)&self->_pageManagement3x2LayoutMetrics.bottomMargin;
    *(CGSize *)((char *)result + 104) = v8;
    CGSize v9 = self->_pageManagement3x3LayoutMetrics.cellSpacing;
    *(_OWORD *)((char *)result + 152) = *(_OWORD *)&self->_pageManagement3x3LayoutMetrics.bottomMargin;
    *(CGSize *)((char *)result + 136) = v9;
    *((void *)result + 26) = *(void *)&self->_dockViewHeight;
    *((void *)result + 27) = *(void *)&self->_dockBackgroundViewCornerRadius;
    long long v10 = *(_OWORD *)&self->_dockBackgroundViewInsets.bottom;
    *(_OWORD *)((char *)result + 312) = *(_OWORD *)&self->_dockBackgroundViewInsets.top;
    *(_OWORD *)((char *)result + 328) = v10;
    long long v11 = *(_OWORD *)&self->_dockListViewInsets.bottom;
    *(_OWORD *)((char *)result + 344) = *(_OWORD *)&self->_dockListViewInsets.top;
    *(_OWORD *)((char *)result + 360) = v11;
    long long v12 = *(_OWORD *)&self->_editModeButtonContentEdgeInsets.bottom;
    *(_OWORD *)((char *)result + 376) = *(_OWORD *)&self->_editModeButtonContentEdgeInsets.top;
    *(_OWORD *)((char *)result + 392) = v12;
    *(UIOffset *)((char *)result + 280) = self->_editModeButtonLayoutOffset;
    *(CGSize *)((char *)result + 296) = self->_editModeButtonSize;
    *((void *)result + 28) = *(void *)&self->_editingEntryAreaHorizontalInset;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBHRootFolderVisualConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
    goto LABEL_22;
  }
  v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    BOOL v10 = 0;
    goto LABEL_22;
  }
  CGSize v7 = v4;
  if (self->_idleTextVerticalOffset == v7->_idleTextVerticalOffset
    && self->_pageControlVerticalOffset == v7->_pageControlVerticalOffset
    && self->_pageControlFrameInset.width == v7->_pageControlFrameInset.width
    && self->_pageControlFrameInset.height == v7->_pageControlFrameInset.height)
  {
    BOOL v9 = self->_pageControlCustomPadding.width == v7->_pageControlCustomPadding.width
      && self->_pageControlCustomPadding.height == v7->_pageControlCustomPadding.height;
    if (v9
      && self->_scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView == v7->_scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView
      && self->_pageManagementPageCheckboxVerticalMargin == v7->_pageManagementPageCheckboxVerticalMargin
      && self->_pageManagementPageCheckboxDiameter == v7->_pageManagementPageCheckboxDiameter)
    {
      BOOL v10 = 0;
      if (self->_pageManagementFocusModeOptionsButtonSize.width != v7->_pageManagementFocusModeOptionsButtonSize.width) {
        goto LABEL_19;
      }
      if (self->_pageManagementFocusModeOptionsButtonSize.height != v7->_pageManagementFocusModeOptionsButtonSize.height) {
        goto LABEL_19;
      }
      BOOL v10 = 0;
      if (self->_pageManagement2x2LayoutMetrics.cellSpacing.width != v7->_pageManagement2x2LayoutMetrics.cellSpacing.width) {
        goto LABEL_19;
      }
      if (self->_pageManagement2x2LayoutMetrics.cellSpacing.height != v7->_pageManagement2x2LayoutMetrics.cellSpacing.height) {
        goto LABEL_19;
      }
      if (self->_pageManagement2x2LayoutMetrics.bottomMargin != v7->_pageManagement2x2LayoutMetrics.bottomMargin) {
        goto LABEL_19;
      }
      BOOL v10 = 0;
      if (self->_pageManagement3x2LayoutMetrics.cellSpacing.width != v7->_pageManagement3x2LayoutMetrics.cellSpacing.width) {
        goto LABEL_19;
      }
      if (self->_pageManagement3x2LayoutMetrics.cellSpacing.height != v7->_pageManagement3x2LayoutMetrics.cellSpacing.height) {
        goto LABEL_19;
      }
      if (self->_pageManagement3x2LayoutMetrics.bottomMargin != v7->_pageManagement3x2LayoutMetrics.bottomMargin) {
        goto LABEL_19;
      }
      BOOL v10 = 0;
      if (self->_pageManagement3x3LayoutMetrics.cellSpacing.width != v7->_pageManagement3x3LayoutMetrics.cellSpacing.width
        || self->_pageManagement3x3LayoutMetrics.cellSpacing.height != v7->_pageManagement3x3LayoutMetrics.cellSpacing.height
        || self->_pageManagement3x3LayoutMetrics.bottomMargin != v7->_pageManagement3x3LayoutMetrics.bottomMargin)
      {
        goto LABEL_19;
      }
      if (self->_dockViewHeight == v7->_dockViewHeight
        && self->_dockBackgroundViewCornerRadius == v7->_dockBackgroundViewCornerRadius
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_dockBackgroundViewInsets.top, *(float64x2_t *)&v7->_dockBackgroundViewInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_dockBackgroundViewInsets.bottom, *(float64x2_t *)&v7->_dockBackgroundViewInsets.bottom))), 0xFuLL))) & 1) != 0&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_dockListViewInsets.top, *(float64x2_t *)&v7->_dockListViewInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_dockListViewInsets.bottom,
                                                       *(float64x2_t *)&v7->_dockListViewInsets.bottom))),
                                      0xFuLL))) & 1) != 0
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_editModeButtonContentEdgeInsets.top, *(float64x2_t *)&v7->_editModeButtonContentEdgeInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_editModeButtonContentEdgeInsets.bottom, *(float64x2_t *)&v7->_editModeButtonContentEdgeInsets.bottom))), 0xFuLL))) & 1) != 0)
      {
        BOOL v10 = 0;
        if (self->_editModeButtonLayoutOffset.horizontal == v7->_editModeButtonLayoutOffset.horizontal
          && self->_editModeButtonLayoutOffset.vertical == v7->_editModeButtonLayoutOffset.vertical)
        {
          BOOL v10 = 0;
          if (self->_editModeButtonSize.width == v7->_editModeButtonSize.width
            && self->_editModeButtonSize.height == v7->_editModeButtonSize.height)
          {
            BOOL v10 = self->_editingEntryAreaHorizontalInset == v7->_editingEntryAreaHorizontalInset;
          }
        }
        goto LABEL_19;
      }
    }
  }
  BOOL v10 = 0;
LABEL_19:

LABEL_22:
  return v10;
}

- (unint64_t)hash
{
  double bottom = self->_editModeButtonContentEdgeInsets.bottom;
  CGFloat v3 = self->_editModeButtonContentEdgeInsets.leading
     + bottom
     + self->_editModeButtonContentEdgeInsets.trailing
     + self->_editModeButtonContentEdgeInsets.top
     + self->_dockListViewInsets.left
     + self->_dockListViewInsets.bottom
     + self->_dockListViewInsets.right
     + self->_dockListViewInsets.top
     + self->_dockBackgroundViewInsets.left
     + self->_dockBackgroundViewInsets.bottom
     + self->_dockBackgroundViewInsets.right
     + self->_dockBackgroundViewInsets.top
     + self->_dockBackgroundViewCornerRadius
     + self->_dockViewHeight
     + self->_idleTextVerticalOffset
     + self->_pageControlVerticalOffset
     + self->_scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView
     + self->_pageControlFrameInset.width
     + self->_pageControlFrameInset.height
     + self->_pageControlCustomPadding.width
     + self->_pageControlCustomPadding.height
     + self->_pageManagementPageCheckboxVerticalMargin
     + self->_pageManagementPageCheckboxDiameter
     + self->_pageManagementFocusModeOptionsButtonSize.width
     + self->_pageManagementFocusModeOptionsButtonSize.height
     + (double)(unint64_t)(self->_pageManagement1x1LayoutMetrics.bottomMargin
                                + self->_pageManagement1x1LayoutMetrics.cellSpacing.width
                                + self->_pageManagement1x1LayoutMetrics.cellSpacing.height)
     + (double)(unint64_t)(self->_pageManagement2x1LayoutMetrics.bottomMargin
                                + self->_pageManagement2x1LayoutMetrics.cellSpacing.width
                                + self->_pageManagement2x1LayoutMetrics.cellSpacing.height)
     + (double)(unint64_t)(self->_pageManagement2x2LayoutMetrics.bottomMargin
                                + self->_pageManagement2x2LayoutMetrics.cellSpacing.width
                                + self->_pageManagement2x2LayoutMetrics.cellSpacing.height)
     + (double)(unint64_t)(self->_pageManagement3x2LayoutMetrics.bottomMargin
                                + self->_pageManagement3x2LayoutMetrics.cellSpacing.width
                                + self->_pageManagement3x2LayoutMetrics.cellSpacing.height)
     + (double)(unint64_t)(self->_pageManagement3x3LayoutMetrics.bottomMargin
                                + self->_pageManagement3x3LayoutMetrics.cellSpacing.width
                                + self->_pageManagement3x3LayoutMetrics.cellSpacing.height);
  return (unint64_t)(self->_editingEntryAreaHorizontalInset
                          + self->_editModeButtonSize.height
                          + self->_editModeButtonSize.width
                          + self->_editModeButtonLayoutOffset.vertical
                          + self->_editModeButtonLayoutOffset.horizontal
                          + v3);
}

- (NSString)description
{
  return (NSString *)[(SBHRootFolderVisualConfiguration *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBHRootFolderVisualConfiguration *)self succinctDescriptionBuilder];
  CGFloat v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  CGFloat v3 = [(SBHRootFolderVisualConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBHRootFolderVisualConfiguration *)self succinctDescriptionBuilder];
  [(SBHRootFolderVisualConfiguration *)self idleTextVerticalOffset];
  id v5 = (id)objc_msgSend(v4, "appendFloat:withName:", @"idleTextVerticalOffset");
  [(SBHRootFolderVisualConfiguration *)self pageControlVerticalOffset];
  id v6 = (id)objc_msgSend(v4, "appendFloat:withName:", @"pageControlVerticalOffset");
  [(SBHRootFolderVisualConfiguration *)self pageControlFrameInset];
  id v7 = (id)objc_msgSend(v4, "appendSize:withName:", @"pageControlFrameInset");
  [(SBHRootFolderVisualConfiguration *)self pageControlCustomPadding];
  id v8 = (id)objc_msgSend(v4, "appendSize:withName:", @"pageControlCustomPadding");
  [(SBHRootFolderVisualConfiguration *)self scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView];
  id v9 = (id)objc_msgSend(v4, "appendFloat:withName:", @"scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView");
  [(SBHRootFolderVisualConfiguration *)self pageManagementPageCheckboxVerticalMargin];
  id v10 = (id)objc_msgSend(v4, "appendFloat:withName:", @"pageManagementPageCheckboxVerticalMargin");
  [(SBHRootFolderVisualConfiguration *)self pageManagementPageCheckboxDiameter];
  id v11 = (id)objc_msgSend(v4, "appendFloat:withName:", @"pageManagementPageCheckboxDiameter");
  [(SBHRootFolderVisualConfiguration *)self pageManagementFocusModeOptionsButtonSize];
  id v12 = (id)objc_msgSend(v4, "appendSize:withName:", @"pageManagementFocusModeOptionsButtonSize");
  [(SBHRootFolderVisualConfiguration *)self dockViewHeight];
  id v13 = (id)objc_msgSend(v4, "appendFloat:withName:", @"dockViewHeight");
  [(SBHRootFolderVisualConfiguration *)self dockBackgroundViewCornerRadius];
  id v14 = (id)objc_msgSend(v4, "appendFloat:withName:", @"dockBackgroundViewCornerRadius");
  [(SBHRootFolderVisualConfiguration *)self dockBackgroundViewInsets];
  v15 = NSStringFromUIEdgeInsets(v25);
  [v4 appendString:v15 withName:@"dockBackgroundViewInsets"];

  [(SBHRootFolderVisualConfiguration *)self dockListViewInsets];
  v16 = NSStringFromUIEdgeInsets(v26);
  [v4 appendString:v16 withName:@"dockListViewInsets"];

  [(SBHRootFolderVisualConfiguration *)self editModeButtonContentEdgeInsets];
  v17 = NSStringFromDirectionalEdgeInsets(v27);
  [v4 appendString:v17 withName:@"editModeButtonContentEdgeInsets"];

  [(SBHRootFolderVisualConfiguration *)self editModeButtonLayoutOffset];
  v18 = NSStringFromUIOffset(v23);
  [v4 appendString:v18 withName:@"editModeButtonLayoutOffset"];

  [(SBHRootFolderVisualConfiguration *)self editModeButtonSize];
  v19 = NSStringFromCGSize(v24);
  [v4 appendString:v19 withName:@"editModeButtonSize"];

  [(SBHRootFolderVisualConfiguration *)self editingEntryAreaHorizontalInset];
  id v20 = (id)objc_msgSend(v4, "appendFloat:withName:", @"editingEntryAreaHorizontalInset");
  return v4;
}

- (double)idleTextVerticalOffset
{
  return self->_idleTextVerticalOffset;
}

- (void)setIdleTextVerticalOffset:(double)a3
{
  self->_idleTextVerticalOffset = a3;
}

- (void)setPageControlVerticalOffset:(double)a3
{
  self->_pageControlVerticalOffset = a3;
}

- (void)setPageControlFrameInset:(CGSize)a3
{
  self->_pageControlFrameInset = a3;
}

- (CGSize)pageControlCustomPadding
{
  double width = self->_pageControlCustomPadding.width;
  double height = self->_pageControlCustomPadding.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPageControlCustomPadding:(CGSize)a3
{
  self->_pageControlCustomPadding = a3;
}

- (void)setScrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView:(double)a3
{
  self->_scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView = a3;
}

- (double)pageManagementPageCheckboxVerticalMargin
{
  return self->_pageManagementPageCheckboxVerticalMargin;
}

- (void)setPageManagementPageCheckboxVerticalMargin:(double)a3
{
  self->_pageManagementPageCheckboxVerticalMargin = a3;
}

- (double)pageManagementPageCheckboxDiameter
{
  return self->_pageManagementPageCheckboxDiameter;
}

- (void)setPageManagementPageCheckboxDiameter:(double)a3
{
  self->_pageManagementPageCheckboxDiameter = a3;
}

- (CGSize)pageManagementFocusModeOptionsButtonSize
{
  double width = self->_pageManagementFocusModeOptionsButtonSize.width;
  double height = self->_pageManagementFocusModeOptionsButtonSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPageManagementFocusModeOptionsButtonSize:(CGSize)a3
{
  self->_pageManagementFocusModeOptionsButtonSize = a3;
}

- (void)setDockViewHeight:(double)a3
{
  self->_dockViewHeight = a3;
}

- (void)setDockBackgroundViewCornerRadius:(double)a3
{
  self->_dockBackgroundViewCornerRadius = a3;
}

- (UIEdgeInsets)dockBackgroundViewInsets
{
  double top = self->_dockBackgroundViewInsets.top;
  double left = self->_dockBackgroundViewInsets.left;
  double bottom = self->_dockBackgroundViewInsets.bottom;
  double right = self->_dockBackgroundViewInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setDockBackgroundViewInsets:(UIEdgeInsets)a3
{
  self->_dockBackgroundViewInsets = a3;
}

- (UIEdgeInsets)dockListViewInsets
{
  double top = self->_dockListViewInsets.top;
  double left = self->_dockListViewInsets.left;
  double bottom = self->_dockListViewInsets.bottom;
  double right = self->_dockListViewInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setDockListViewInsets:(UIEdgeInsets)a3
{
  self->_dockListViewInsets = a3;
}

- (void)setEditModeButtonContentEdgeInsets:(NSDirectionalEdgeInsets)a3
{
  self->_editModeButtonContentEdgeInsets = a3;
}

- (void)setEditModeButtonLayoutOffset:(UIOffset)a3
{
  self->_editModeButtonLayoutOffset = a3;
}

- (CGSize)editModeButtonSize
{
  double width = self->_editModeButtonSize.width;
  double height = self->_editModeButtonSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setEditModeButtonSize:(CGSize)a3
{
  self->_editModeButtonSize = a3;
}

- (void)setEditingEntryAreaHorizontalInset:(double)a3
{
  self->_editingEntryAreaHorizontalInset = a3;
}

@end