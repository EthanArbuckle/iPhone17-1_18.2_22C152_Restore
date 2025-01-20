@interface _UICalendarViewPlatformMetrics
+ (id)_headerViewDefaultButtonConfiguration;
- (CATransform3D)highlightedContentTransform;
- (UIButtonConfiguration)headerViewDefaultButtonConfiguration;
- (UIColor)expandedMonthYearChevronColor;
- (UIColor)expandedMonthYearLabelColor;
- (UIColor)monthYearChevronColor;
- (UIColor)monthYearLabelColor;
- (UIColor)weekdayLabelTextColor;
- (UIEdgeInsets)monthYearContainerEdgeInsets;
- (UIOffset)monthYearContainerOffset;
- (UIVisualEffect)defaultCellBackgroundEffect;
- (UIVisualEffect)highlightedCellBackgroundEffect;
- (_UICalendarViewPlatformMetrics)init;
- (double)dateViewCellBackgroundSize;
- (double)dateViewCellSpacing;
- (double)headerViewInterMonthButtonSpacing;
- (double)minimumContentWidth;
- (double)minimumLayoutWidth;
- (double)weekdayViewMinimumHeight;
- (double)weekdayViewVerticalSpacing;
- (id)dateCellBackgroundColorProvider;
- (id)dateCellFontProvider;
- (id)dateCellForegroundColorProvider;
- (id)headerViewInsetsForLayoutMargins;
- (id)headerViewIntrinsicLayoutMarginsForProposedLayoutMargins;
- (id)headerViewLayoutMarginsForProposedLayoutMargins;
- (id)maximumContentWidthForLayoutMargins;
- (id)monthYearButtonConfiguration;
- (id)monthYearChevronSymbolConfiguration;
- (id)monthYearContainerViewProvider;
- (id)monthYearLabelFontProvider;
- (id)nextPreviousMonthButtonConfiguration;
- (void)setDateCellBackgroundColorProvider:(id)a3;
- (void)setDateCellFontProvider:(id)a3;
- (void)setDateCellForegroundColorProvider:(id)a3;
- (void)setDateViewCellBackgroundSize:(double)a3;
- (void)setDateViewCellSpacing:(double)a3;
- (void)setDefaultCellBackgroundEffect:(id)a3;
- (void)setExpandedMonthYearChevronColor:(id)a3;
- (void)setExpandedMonthYearLabelColor:(id)a3;
- (void)setHeaderViewDefaultButtonConfiguration:(id)a3;
- (void)setHeaderViewInsetsForLayoutMargins:(id)a3;
- (void)setHeaderViewInterMonthButtonSpacing:(double)a3;
- (void)setHeaderViewIntrinsicLayoutMarginsForProposedLayoutMargins:(id)a3;
- (void)setHeaderViewLayoutMarginsForProposedLayoutMargins:(id)a3;
- (void)setHighlightedCellBackgroundEffect:(id)a3;
- (void)setHighlightedContentTransform:(CATransform3D *)a3;
- (void)setMaximumContentWidthForLayoutMargins:(id)a3;
- (void)setMinimumContentWidth:(double)a3;
- (void)setMinimumLayoutWidth:(double)a3;
- (void)setMonthYearButtonConfiguration:(id)a3;
- (void)setMonthYearChevronColor:(id)a3;
- (void)setMonthYearChevronSymbolConfiguration:(id)a3;
- (void)setMonthYearContainerEdgeInsets:(UIEdgeInsets)a3;
- (void)setMonthYearContainerOffset:(UIOffset)a3;
- (void)setMonthYearContainerViewProvider:(id)a3;
- (void)setMonthYearLabelColor:(id)a3;
- (void)setMonthYearLabelFontProvider:(id)a3;
- (void)setNextPreviousMonthButtonConfiguration:(id)a3;
- (void)setWeekdayLabelTextColor:(id)a3;
- (void)setWeekdayViewMinimumHeight:(double)a3;
- (void)setWeekdayViewVerticalSpacing:(double)a3;
@end

@implementation _UICalendarViewPlatformMetrics

- (_UICalendarViewPlatformMetrics)init
{
  v17.receiver = self;
  v17.super_class = (Class)_UICalendarViewPlatformMetrics;
  v2 = [(_UICalendarViewPlatformMetrics *)&v17 init];
  v3 = v2;
  if (v2)
  {
    [(_UICalendarViewPlatformMetrics *)v2 setMinimumContentWidth:280.0];
    [(_UICalendarViewPlatformMetrics *)v3 setMinimumLayoutWidth:220.0];
    [(_UICalendarViewPlatformMetrics *)v3 setMaximumContentWidthForLayoutMargins:&__block_literal_global_26];
    [(_UICalendarViewPlatformMetrics *)v3 setHeaderViewLayoutMarginsForProposedLayoutMargins:&__block_literal_global_56];
    [(_UICalendarViewPlatformMetrics *)v3 setHeaderViewIntrinsicLayoutMarginsForProposedLayoutMargins:&__block_literal_global_58];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __38___UICalendarViewPlatformMetrics_init__block_invoke_4;
    v15[3] = &unk_1E52DCD28;
    v4 = v3;
    v16 = v4;
    [(_UICalendarViewPlatformMetrics *)v4 setHeaderViewInsetsForLayoutMargins:v15];
    v5 = +[_UICalendarViewPlatformMetrics _headerViewDefaultButtonConfiguration];
    [(_UICalendarViewPlatformMetrics *)v4 setHeaderViewDefaultButtonConfiguration:v5];

    v6 = +[UIColor labelColor];
    [(_UICalendarViewPlatformMetrics *)v4 setMonthYearLabelColor:v6];

    v7 = +[UIColor tintColor];
    [(_UICalendarViewPlatformMetrics *)v4 setExpandedMonthYearLabelColor:v7];

    [(_UICalendarViewPlatformMetrics *)v4 setMonthYearLabelFontProvider:&__block_literal_global_64];
    [(_UICalendarViewPlatformMetrics *)v4 setMonthYearChevronSymbolConfiguration:&__block_literal_global_67];
    [(_UICalendarViewPlatformMetrics *)v4 setNextPreviousMonthButtonConfiguration:&__block_literal_global_71];
    [(_UICalendarViewPlatformMetrics *)v4 setMonthYearButtonConfiguration:&__block_literal_global_73];
    [(_UICalendarViewPlatformMetrics *)v4 setHeaderViewInterMonthButtonSpacing:0.0];
    -[_UICalendarViewPlatformMetrics setMonthYearContainerEdgeInsets:](v4, "setMonthYearContainerEdgeInsets:", -4.0, -4.0, -4.0, -4.0);
    [(_UICalendarViewPlatformMetrics *)v4 setMonthYearContainerViewProvider:&__block_literal_global_77];
    v8 = +[UIColor tertiaryLabelColor];
    [(_UICalendarViewPlatformMetrics *)v4 setWeekdayLabelTextColor:v8];

    [(_UICalendarViewPlatformMetrics *)v4 setWeekdayViewMinimumHeight:0.0];
    [(_UICalendarViewPlatformMetrics *)v4 setWeekdayViewVerticalSpacing:0.0];
    [(_UICalendarViewPlatformMetrics *)v4 setDateViewCellBackgroundSize:44.0];
    [(_UICalendarViewPlatformMetrics *)v4 setDateViewCellSpacing:-1.0];
    [(_UICalendarViewPlatformMetrics *)v4 setDateCellForegroundColorProvider:&__block_literal_global_81];
    [(_UICalendarViewPlatformMetrics *)v4 setDateCellBackgroundColorProvider:&__block_literal_global_83];
    [(_UICalendarViewPlatformMetrics *)v4 setDateCellFontProvider:&__block_literal_global_86];
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    v14[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    v14[5] = v9;
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    v14[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    v14[7] = v10;
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    v14[0] = *MEMORY[0x1E4F39B10];
    v14[1] = v11;
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    v14[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    v14[3] = v12;
    [(_UICalendarViewPlatformMetrics *)v4 setHighlightedContentTransform:v14];
  }
  return v3;
}

+ (id)_headerViewDefaultButtonConfiguration
{
  v2 = +[UIButtonConfiguration plainButtonConfiguration];
  [v2 contentInsets];
  objc_msgSend(v2, "setContentInsets:");
  v3 = +[UIColor clearColor];
  v4 = [v2 background];
  [v4 setBackgroundColor:v3];

  return v2;
}

- (id)maximumContentWidthForLayoutMargins
{
  return self->_maximumContentWidthForLayoutMargins;
}

- (void)setMaximumContentWidthForLayoutMargins:(id)a3
{
}

- (double)minimumContentWidth
{
  return self->_minimumContentWidth;
}

- (void)setMinimumContentWidth:(double)a3
{
  self->_minimumContentWidth = a3;
}

- (double)minimumLayoutWidth
{
  return self->_minimumLayoutWidth;
}

- (void)setMinimumLayoutWidth:(double)a3
{
  self->_minimumLayoutWidth = a3;
}

- (id)headerViewLayoutMarginsForProposedLayoutMargins
{
  return self->_headerViewLayoutMarginsForProposedLayoutMargins;
}

- (void)setHeaderViewLayoutMarginsForProposedLayoutMargins:(id)a3
{
}

- (id)headerViewIntrinsicLayoutMarginsForProposedLayoutMargins
{
  return self->_headerViewIntrinsicLayoutMarginsForProposedLayoutMargins;
}

- (void)setHeaderViewIntrinsicLayoutMarginsForProposedLayoutMargins:(id)a3
{
}

- (id)headerViewInsetsForLayoutMargins
{
  return self->_headerViewInsetsForLayoutMargins;
}

- (void)setHeaderViewInsetsForLayoutMargins:(id)a3
{
}

- (UIButtonConfiguration)headerViewDefaultButtonConfiguration
{
  return self->_headerViewDefaultButtonConfiguration;
}

- (void)setHeaderViewDefaultButtonConfiguration:(id)a3
{
}

- (UIColor)monthYearLabelColor
{
  return self->_monthYearLabelColor;
}

- (void)setMonthYearLabelColor:(id)a3
{
}

- (UIColor)expandedMonthYearLabelColor
{
  return self->_expandedMonthYearLabelColor;
}

- (void)setExpandedMonthYearLabelColor:(id)a3
{
}

- (UIColor)monthYearChevronColor
{
  return self->_monthYearChevronColor;
}

- (void)setMonthYearChevronColor:(id)a3
{
}

- (UIColor)expandedMonthYearChevronColor
{
  return self->_expandedMonthYearChevronColor;
}

- (void)setExpandedMonthYearChevronColor:(id)a3
{
}

- (id)monthYearLabelFontProvider
{
  return self->_monthYearLabelFontProvider;
}

- (void)setMonthYearLabelFontProvider:(id)a3
{
}

- (id)monthYearChevronSymbolConfiguration
{
  return self->_monthYearChevronSymbolConfiguration;
}

- (void)setMonthYearChevronSymbolConfiguration:(id)a3
{
}

- (id)nextPreviousMonthButtonConfiguration
{
  return self->_nextPreviousMonthButtonConfiguration;
}

- (void)setNextPreviousMonthButtonConfiguration:(id)a3
{
}

- (id)monthYearButtonConfiguration
{
  return self->_monthYearButtonConfiguration;
}

- (void)setMonthYearButtonConfiguration:(id)a3
{
}

- (double)headerViewInterMonthButtonSpacing
{
  return self->_headerViewInterMonthButtonSpacing;
}

- (void)setHeaderViewInterMonthButtonSpacing:(double)a3
{
  self->_headerViewInterMonthButtonSpacing = a3;
}

- (UIEdgeInsets)monthYearContainerEdgeInsets
{
  double top = self->_monthYearContainerEdgeInsets.top;
  double left = self->_monthYearContainerEdgeInsets.left;
  double bottom = self->_monthYearContainerEdgeInsets.bottom;
  double right = self->_monthYearContainerEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMonthYearContainerEdgeInsets:(UIEdgeInsets)a3
{
  self->_monthYearContainerEdgeInsets = a3;
}

- (id)monthYearContainerViewProvider
{
  return self->_monthYearContainerViewProvider;
}

- (void)setMonthYearContainerViewProvider:(id)a3
{
}

- (UIColor)weekdayLabelTextColor
{
  return self->_weekdayLabelTextColor;
}

- (void)setWeekdayLabelTextColor:(id)a3
{
}

- (double)weekdayViewMinimumHeight
{
  return self->_weekdayViewMinimumHeight;
}

- (void)setWeekdayViewMinimumHeight:(double)a3
{
  self->_weekdayViewMinimumHeight = a3;
}

- (double)weekdayViewVerticalSpacing
{
  return self->_weekdayViewVerticalSpacing;
}

- (void)setWeekdayViewVerticalSpacing:(double)a3
{
  self->_weekdayViewVerticalSpacing = a3;
}

- (double)dateViewCellBackgroundSize
{
  return self->_dateViewCellBackgroundSize;
}

- (void)setDateViewCellBackgroundSize:(double)a3
{
  self->_dateViewCellBackgroundSize = a3;
}

- (double)dateViewCellSpacing
{
  return self->_dateViewCellSpacing;
}

- (void)setDateViewCellSpacing:(double)a3
{
  self->_dateViewCellSpacing = a3;
}

- (UIVisualEffect)defaultCellBackgroundEffect
{
  return self->_defaultCellBackgroundEffect;
}

- (void)setDefaultCellBackgroundEffect:(id)a3
{
}

- (UIVisualEffect)highlightedCellBackgroundEffect
{
  return self->_highlightedCellBackgroundEffect;
}

- (void)setHighlightedCellBackgroundEffect:(id)a3
{
}

- (CATransform3D)highlightedContentTransform
{
  long long v3 = *(_OWORD *)&self[2].m41;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[2].m33;
  *(_OWORD *)&retstr->m33 = v3;
  long long v4 = *(_OWORD *)&self[3].m11;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[2].m43;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self[2].m21;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[2].m13;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self[2].m31;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[2].m23;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setHighlightedContentTransform:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m11;
  long long v4 = *(_OWORD *)&a3->m13;
  long long v5 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->_highlightedContentTransform.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_highlightedContentTransform.m23 = v5;
  *(_OWORD *)&self->_highlightedContentTransform.m11 = v3;
  *(_OWORD *)&self->_highlightedContentTransform.m13 = v4;
  long long v6 = *(_OWORD *)&a3->m31;
  long long v7 = *(_OWORD *)&a3->m33;
  long long v8 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->_highlightedContentTransform.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_highlightedContentTransform.m43 = v8;
  *(_OWORD *)&self->_highlightedContentTransform.m31 = v6;
  *(_OWORD *)&self->_highlightedContentTransform.m33 = v7;
}

- (id)dateCellForegroundColorProvider
{
  return self->_dateCellForegroundColorProvider;
}

- (void)setDateCellForegroundColorProvider:(id)a3
{
}

- (id)dateCellBackgroundColorProvider
{
  return self->_dateCellBackgroundColorProvider;
}

- (void)setDateCellBackgroundColorProvider:(id)a3
{
}

- (id)dateCellFontProvider
{
  return self->_dateCellFontProvider;
}

- (void)setDateCellFontProvider:(id)a3
{
}

- (UIOffset)monthYearContainerOffset
{
  double horizontal = self->_monthYearContainerOffset.horizontal;
  double vertical = self->_monthYearContainerOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (void)setMonthYearContainerOffset:(UIOffset)a3
{
  self->_monthYearContainerOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateCellFontProvider, 0);
  objc_storeStrong(&self->_dateCellBackgroundColorProvider, 0);
  objc_storeStrong(&self->_dateCellForegroundColorProvider, 0);
  objc_storeStrong((id *)&self->_highlightedCellBackgroundEffect, 0);
  objc_storeStrong((id *)&self->_defaultCellBackgroundEffect, 0);
  objc_storeStrong((id *)&self->_weekdayLabelTextColor, 0);
  objc_storeStrong(&self->_monthYearContainerViewProvider, 0);
  objc_storeStrong(&self->_monthYearButtonConfiguration, 0);
  objc_storeStrong(&self->_nextPreviousMonthButtonConfiguration, 0);
  objc_storeStrong(&self->_monthYearChevronSymbolConfiguration, 0);
  objc_storeStrong(&self->_monthYearLabelFontProvider, 0);
  objc_storeStrong((id *)&self->_expandedMonthYearChevronColor, 0);
  objc_storeStrong((id *)&self->_monthYearChevronColor, 0);
  objc_storeStrong((id *)&self->_expandedMonthYearLabelColor, 0);
  objc_storeStrong((id *)&self->_monthYearLabelColor, 0);
  objc_storeStrong((id *)&self->_headerViewDefaultButtonConfiguration, 0);
  objc_storeStrong(&self->_headerViewInsetsForLayoutMargins, 0);
  objc_storeStrong(&self->_headerViewIntrinsicLayoutMarginsForProposedLayoutMargins, 0);
  objc_storeStrong(&self->_headerViewLayoutMarginsForProposedLayoutMargins, 0);
  objc_storeStrong(&self->_maximumContentWidthForLayoutMargins, 0);
}

@end