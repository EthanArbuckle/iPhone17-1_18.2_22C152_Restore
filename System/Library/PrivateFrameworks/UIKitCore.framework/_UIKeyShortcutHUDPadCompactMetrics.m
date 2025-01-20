@interface _UIKeyShortcutHUDPadCompactMetrics
- (BOOL)shouldExtendToolbarThroughSafeArea;
- (BOOL)toolbarStylesCategoriesAsPageControl;
- (double)menuBaseVerticalContentInset;
- (double)menuCellHorizontalContentMargin;
- (double)menuPlatterCornerRadius;
- (double)minimumBottomScreenEdgeDistance;
- (double)minimumScreenEdgeDistance;
- (double)standardHUDWidth;
- (double)standardMenuPadding;
- (double)standardMenuToolbarSpacing;
- (double)toolbarCellCornerRadius;
- (double)toolbarContentInset;
- (double)toolbarPanelStrokeWidth;
- (double)toolbarPlatterCornerRadius;
- (unint64_t)menuPanelCornerMask;
- (unint64_t)toolbarPanelCornerMask;
@end

@implementation _UIKeyShortcutHUDPadCompactMetrics

- (double)standardHUDWidth
{
  return 10000.0;
}

- (double)standardMenuToolbarSpacing
{
  return 0.0;
}

- (double)minimumScreenEdgeDistance
{
  [(UIKeyShortcutHUDMetrics *)self menuPanelStrokeWidth];
  return -v2;
}

- (double)minimumBottomScreenEdgeDistance
{
  return 0.0;
}

- (double)menuPlatterCornerRadius
{
  [(UIKeyShortcutHUDMetrics *)self contentSizeScaledMetric:12.0];
  return result;
}

- (double)toolbarPlatterCornerRadius
{
  return 0.0;
}

- (unint64_t)menuPanelCornerMask
{
  return 3;
}

- (BOOL)shouldExtendToolbarThroughSafeArea
{
  return 1;
}

- (double)toolbarPanelStrokeWidth
{
  return 0.0;
}

- (unint64_t)toolbarPanelCornerMask
{
  return 0;
}

- (double)standardMenuPadding
{
  [(UIKeyShortcutHUDMetrics *)self contentSizeScaledMetric:16.0];
  return result;
}

- (double)menuBaseVerticalContentInset
{
  [(_UIKeyShortcutHUDPadCompactMetrics *)self standardMenuPadding];
  double v4 = v3;
  [(_UIKeyShortcutHUDPadCompactMetrics *)self menuCellHorizontalContentMargin];
  return v4 - v5;
}

- (double)toolbarContentInset
{
  return 5.0;
}

- (BOOL)toolbarStylesCategoriesAsPageControl
{
  return 1;
}

- (double)menuCellHorizontalContentMargin
{
  return 8.0;
}

- (double)toolbarCellCornerRadius
{
  [(UIKeyShortcutHUDMetrics *)self contentSizeScaledMetric:8.0];
  return result;
}

@end