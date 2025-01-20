@interface UICollectionViewTableLayoutAttributes
+ (int64_t)automaticValueOptionsForRepresentedElementCategory:(unint64_t)a3;
+ (void)applyValuesFromAttributes:(id)a3 toAttributes:(id)a4 valueOptions:(int64_t)a5;
- (BOOL)drawsSeparatorAtBottomOfSection;
- (BOOL)drawsSeparatorAtTopOfSection;
- (BOOL)floating;
- (BOOL)insetsContentViewsToSafeArea;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHeader;
- (BOOL)layoutMarginsFollowReadableWidth;
- (BOOL)preferredAttributesCached;
- (BOOL)separatorInsetIsRelativeToCellEdges;
- (BOOL)shouldIndentWhileEditing;
- (BOOL)showsReorderControl;
- (UIColor)backgroundColor;
- (UIColor)separatorColor;
- (UIEdgeInsets)backgroundInset;
- (UIEdgeInsets)margins;
- (UIEdgeInsets)separatorInset;
- (UIVisualEffect)separatorEffect;
- (double)defaultLeadingCellMarginWidth;
- (double)defaultTrailingCellMarginWidth;
- (double)indexBarExtentFromEdge;
- (double)maxTitleWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (int)sectionLocation;
- (int64_t)accessoryType;
- (int64_t)editingStyle;
- (int64_t)indentationLevel;
- (int64_t)separatorStyle;
- (int64_t)textAlignment;
- (void)setAccessoryType:(int64_t)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundInset:(UIEdgeInsets)a3;
- (void)setDefaultLeadingCellMarginWidth:(double)a3;
- (void)setDefaultTrailingCellMarginWidth:(double)a3;
- (void)setDrawsSeparatorAtBottomOfSection:(BOOL)a3;
- (void)setDrawsSeparatorAtTopOfSection:(BOOL)a3;
- (void)setEditingStyle:(int64_t)a3;
- (void)setFloating:(BOOL)a3;
- (void)setIndentationLevel:(int64_t)a3;
- (void)setIndexBarExtentFromEdge:(double)a3;
- (void)setInsetsContentViewsToSafeArea:(BOOL)a3;
- (void)setIsHeader:(BOOL)a3;
- (void)setLayoutMarginsFollowReadableWidth:(BOOL)a3;
- (void)setMargins:(UIEdgeInsets)a3;
- (void)setMaxTitleWidth:(double)a3;
- (void)setPreferredAttributesCached:(BOOL)a3;
- (void)setSectionLocation:(int)a3;
- (void)setSeparatorColor:(id)a3;
- (void)setSeparatorEffect:(id)a3;
- (void)setSeparatorInset:(UIEdgeInsets)a3;
- (void)setSeparatorInsetIsRelativeToCellEdges:(BOOL)a3;
- (void)setSeparatorStyle:(int64_t)a3;
- (void)setShouldIndentWhileEditing:(BOOL)a3;
- (void)setShowsReorderControl:(BOOL)a3;
- (void)setTextAlignment:(int64_t)a3;
@end

@implementation UICollectionViewTableLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewTableLayoutAttributes;
  id v4 = [(UICollectionViewLayoutAttributes *)&v6 copyWithZone:a3];
  +[UICollectionViewTableLayoutAttributes applyValuesFromAttributes:self toAttributes:v4 valueOptions:31];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UICollectionViewTableLayoutAttributes;
  unsigned int v5 = -[UICollectionViewLayoutAttributes isEqual:](&v10, sel_isEqual_);
  if (v5)
  {
    if (a3 == self)
    {
      LOBYTE(v5) = 1;
      return v5;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || self->_isHeader != *((unsigned __int8 *)a3 + 360)
      || self->_maxTitleWidth != *((double *)a3 + 56)
      || (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_margins.top, *((float64x2_t *)a3 + 33)), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_margins.bottom, *((float64x2_t *)a3 + 34)))), 0xFuLL))) & 1) == 0|| self->_textAlignment != *((void *)a3 + 57)|| self->_floating != *((unsigned __int8 *)a3 + 361)|| self->_accessoryType != *((void *)a3 + 50)|| self->_editingStyle != *((void *)a3 + 51)|| self->_shouldIndentWhileEditing != *((unsigned __int8 *)a3 + 353)|| self->_showsReorderControl != *((unsigned __int8 *)a3 + 354)|| self->_layoutMarginsFollowReadableWidth != *((unsigned __int8 *)a3 + 355)|| self->_insetsContentViewsToSafeArea != *((unsigned __int8 *)a3 + 356)|| self->_defaultLeadingCellMarginWidth != *((double *)a3 + 52)
      || self->_defaultTrailingCellMarginWidth != *((double *)a3 + 53)
      || self->_indexBarExtentFromEdge != *((double *)a3 + 54)
      || (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_backgroundInset.top, *((float64x2_t *)a3 + 31)), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_backgroundInset.bottom, *((float64x2_t *)a3 + 32)))), 0xFuLL))) & 1) == 0|| self->_indentationLevel != *((void *)a3 + 55)|| self->_drawsSeparatorAtTopOfSection != *((unsigned __int8 *)a3 + 357)|| self->_drawsSeparatorAtBottomOfSection != *((unsigned __int8 *)a3 + 358))
    {
      goto LABEL_33;
    }
    backgroundColor = self->_backgroundColor;
    if (backgroundColor == *((UIColor **)a3 + 49) || (unsigned int v5 = -[UIColor isEqual:](backgroundColor, "isEqual:")) != 0)
    {
      if (self->_separatorStyle != *((void *)a3 + 46)
        || (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_separatorInset.top, *((float64x2_t *)a3 + 29)), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_separatorInset.bottom, *((float64x2_t *)a3 + 30)))), 0xFuLL))) & 1) == 0|| self->_separatorInsetIsRelativeToCellEdges != *((unsigned __int8 *)a3 + 352))
      {
        goto LABEL_33;
      }
      separatorColor = self->_separatorColor;
      if (separatorColor == *((UIColor **)a3 + 47) || (unsigned int v5 = -[UIColor isEqual:](separatorColor, "isEqual:")) != 0)
      {
        separatorEffect = self->_separatorEffect;
        if (separatorEffect == *((UIVisualEffect **)a3 + 48)
          || (unsigned int v5 = -[UIVisualEffect isEqual:](separatorEffect, "isEqual:")) != 0)
        {
          if (self->_sectionLocation == *((_DWORD *)a3 + 91))
          {
            LOBYTE(v5) = self->_preferredAttributesCached == *((unsigned __int8 *)a3 + 359);
            return v5;
          }
LABEL_33:
          LOBYTE(v5) = 0;
        }
      }
    }
  }
  return v5;
}

+ (void)applyValuesFromAttributes:(id)a3 toAttributes:(id)a4 valueOptions:(int64_t)a5
{
  char v5 = a5;
  id v10 = a3;
  id v7 = a4;
  if (v5)
  {
    objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v10, "backgroundColor"));
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v7, "setSectionLocation:", objc_msgSend(v10, "sectionLocation"));
  objc_msgSend(v7, "setLayoutMarginsFollowReadableWidth:", objc_msgSend(v10, "layoutMarginsFollowReadableWidth"));
  objc_msgSend(v7, "setInsetsContentViewsToSafeArea:", objc_msgSend(v10, "insetsContentViewsToSafeArea"));
  [v10 defaultLeadingCellMarginWidth];
  objc_msgSend(v7, "setDefaultLeadingCellMarginWidth:");
  [v10 defaultTrailingCellMarginWidth];
  objc_msgSend(v7, "setDefaultTrailingCellMarginWidth:");
  [v10 indexBarExtentFromEdge];
  objc_msgSend(v7, "setIndexBarExtentFromEdge:");
  [v10 backgroundInset];
  objc_msgSend(v7, "setBackgroundInset:");
  objc_msgSend(v7, "setIndentationLevel:", objc_msgSend(v10, "indentationLevel"));
  objc_msgSend(v7, "setDrawsSeparatorAtTopOfSection:", objc_msgSend(v10, "drawsSeparatorAtTopOfSection"));
  objc_msgSend(v7, "setDrawsSeparatorAtBottomOfSection:", objc_msgSend(v10, "drawsSeparatorAtBottomOfSection"));
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
LABEL_16:
    objc_msgSend(v7, "setSeparatorStyle:", objc_msgSend(v10, "separatorStyle"));
    [v10 separatorInset];
    objc_msgSend(v7, "setSeparatorInset:");
    objc_msgSend(v7, "setSeparatorInsetIsRelativeToCellEdges:", objc_msgSend(v10, "separatorInsetIsRelativeToCellEdges"));
    v8 = [v10 separatorColor];
    [v7 setSeparatorColor:v8];

    v9 = [v10 separatorEffect];
    [v7 setSeparatorEffect:v9];

    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  objc_msgSend(v7, "setAccessoryType:", objc_msgSend(v10, "accessoryType"));
  objc_msgSend(v7, "setEditingStyle:", objc_msgSend(v10, "editingStyle"));
  objc_msgSend(v7, "setShouldIndentWhileEditing:", objc_msgSend(v10, "shouldIndentWhileEditing"));
  objc_msgSend(v7, "setShowsReorderControl:", objc_msgSend(v10, "showsReorderControl"));
  if ((v5 & 2) != 0) {
    goto LABEL_16;
  }
LABEL_5:
  if ((v5 & 0x10) != 0)
  {
LABEL_6:
    objc_msgSend(v7, "setIsHeader:", objc_msgSend(v10, "isHeader"));
    [v10 maxTitleWidth];
    objc_msgSend(v7, "setMaxTitleWidth:");
    [v10 margins];
    objc_msgSend(v7, "setMargins:");
    objc_msgSend(v7, "setTextAlignment:", objc_msgSend(v10, "textAlignment"));
    objc_msgSend(v7, "setFloating:", objc_msgSend(v10, "floating"));
  }
LABEL_7:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v7, "setPreferredAttributesCached:", objc_msgSend(v10, "preferredAttributesCached"));
    }
  }
}

+ (int64_t)automaticValueOptionsForRepresentedElementCategory:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return qword_186B93E90[a3];
  }
}

- (int64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (void)setSeparatorStyle:(int64_t)a3
{
  self->_separatorStyle = a3;
}

- (UIEdgeInsets)separatorInset
{
  double top = self->_separatorInset.top;
  double left = self->_separatorInset.left;
  double bottom = self->_separatorInset.bottom;
  double right = self->_separatorInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSeparatorInset:(UIEdgeInsets)a3
{
  self->_separatorInset = a3;
}

- (BOOL)separatorInsetIsRelativeToCellEdges
{
  return self->_separatorInsetIsRelativeToCellEdges;
}

- (void)setSeparatorInsetIsRelativeToCellEdges:(BOOL)a3
{
  self->_separatorInsetIsRelativeToCellEdges = a3;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (void)setSeparatorColor:(id)a3
{
}

- (UIVisualEffect)separatorEffect
{
  return self->_separatorEffect;
}

- (void)setSeparatorEffect:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (int64_t)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(int64_t)a3
{
  self->_accessoryType = a3;
}

- (int64_t)editingStyle
{
  return self->_editingStyle;
}

- (void)setEditingStyle:(int64_t)a3
{
  self->_editingStyle = a3;
}

- (int)sectionLocation
{
  return self->_sectionLocation;
}

- (void)setSectionLocation:(int)a3
{
  self->_sectionLocation = a3;
}

- (BOOL)shouldIndentWhileEditing
{
  return self->_shouldIndentWhileEditing;
}

- (void)setShouldIndentWhileEditing:(BOOL)a3
{
  self->_shouldIndentWhileEditing = a3;
}

- (BOOL)showsReorderControl
{
  return self->_showsReorderControl;
}

- (void)setShowsReorderControl:(BOOL)a3
{
  self->_showsReorderControl = a3;
}

- (BOOL)layoutMarginsFollowReadableWidth
{
  return self->_layoutMarginsFollowReadableWidth;
}

- (void)setLayoutMarginsFollowReadableWidth:(BOOL)a3
{
  self->_layoutMarginsFollowReadableWidth = a3;
}

- (BOOL)insetsContentViewsToSafeArea
{
  return self->_insetsContentViewsToSafeArea;
}

- (void)setInsetsContentViewsToSafeArea:(BOOL)a3
{
  self->_insetsContentViewsToSafeArea = a3;
}

- (double)defaultLeadingCellMarginWidth
{
  return self->_defaultLeadingCellMarginWidth;
}

- (void)setDefaultLeadingCellMarginWidth:(double)a3
{
  self->_defaultLeadingCellMarginWidth = a3;
}

- (double)defaultTrailingCellMarginWidth
{
  return self->_defaultTrailingCellMarginWidth;
}

- (void)setDefaultTrailingCellMarginWidth:(double)a3
{
  self->_defaultTrailingCellMarginWidth = a3;
}

- (double)indexBarExtentFromEdge
{
  return self->_indexBarExtentFromEdge;
}

- (void)setIndexBarExtentFromEdge:(double)a3
{
  self->_indexBarExtentFromEdge = a3;
}

- (UIEdgeInsets)backgroundInset
{
  double top = self->_backgroundInset.top;
  double left = self->_backgroundInset.left;
  double bottom = self->_backgroundInset.bottom;
  double right = self->_backgroundInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBackgroundInset:(UIEdgeInsets)a3
{
  self->_backgroundInset = a3;
}

- (int64_t)indentationLevel
{
  return self->_indentationLevel;
}

- (void)setIndentationLevel:(int64_t)a3
{
  self->_indentationLevel = a3;
}

- (BOOL)drawsSeparatorAtTopOfSection
{
  return self->_drawsSeparatorAtTopOfSection;
}

- (void)setDrawsSeparatorAtTopOfSection:(BOOL)a3
{
  self->_drawsSeparatorAtTopOfSection = a3;
}

- (BOOL)drawsSeparatorAtBottomOfSection
{
  return self->_drawsSeparatorAtBottomOfSection;
}

- (void)setDrawsSeparatorAtBottomOfSection:(BOOL)a3
{
  self->_drawsSeparatorAtBottomOfSection = a3;
}

- (BOOL)preferredAttributesCached
{
  return self->_preferredAttributesCached;
}

- (void)setPreferredAttributesCached:(BOOL)a3
{
  self->_preferredAttributesCached = a3;
}

- (BOOL)isHeader
{
  return self->_isHeader;
}

- (void)setIsHeader:(BOOL)a3
{
  self->_isHeader = a3;
}

- (double)maxTitleWidth
{
  return self->_maxTitleWidth;
}

- (void)setMaxTitleWidth:(double)a3
{
  self->_maxTitleWidth = a3;
}

- (UIEdgeInsets)margins
{
  double top = self->_margins.top;
  double left = self->_margins.left;
  double bottom = self->_margins.bottom;
  double right = self->_margins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (BOOL)floating
{
  return self->_floating;
}

- (void)setFloating:(BOOL)a3
{
  self->_floating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_separatorEffect, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
}

@end