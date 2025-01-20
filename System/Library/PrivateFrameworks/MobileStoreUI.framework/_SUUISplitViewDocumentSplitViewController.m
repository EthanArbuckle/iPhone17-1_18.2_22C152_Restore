@interface _SUUISplitViewDocumentSplitViewController
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (double)_SUUI_primaryColumnWidthForWidth:(double)a3;
@end

@implementation _SUUISplitViewDocumentSplitViewController

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  CGFloat height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v8 = [(_SUUISplitViewDocumentSplitViewController *)self viewControllers];
  id v9 = [v8 firstObject];

  [(_SUUISplitViewDocumentSplitViewController *)self _SUUI_primaryColumnWidthForWidth:width];
  if (v9 != v7)
  {
    double v11 = width - v10;
    [(_SUUISplitViewDocumentSplitViewController *)self gutterWidth];
    float v13 = v11 - v12;
    double v10 = floorf(v13);
  }
  double v14 = height;
  result.CGFloat height = v14;
  result.double width = v10;
  return result;
}

- (double)_SUUI_primaryColumnWidthForWidth:(double)a3
{
  [(_SUUISplitViewDocumentSplitViewController *)self preferredPrimaryColumnWidthFraction];
  double v6 = *MEMORY[0x263F83990];
  if (v5 == *MEMORY[0x263F83990]) {
    double v5 = 0.4;
  }
  double v7 = ceil(v5 * a3);
  [(_SUUISplitViewDocumentSplitViewController *)self minimumPrimaryColumnWidth];
  if (v8 == v6) {
    double v9 = 0.0;
  }
  else {
    double v9 = v8;
  }
  [(_SUUISplitViewDocumentSplitViewController *)self maximumPrimaryColumnWidth];
  if (result == v6) {
    double result = 320.0;
  }
  if (v9 >= v7) {
    double v11 = v9;
  }
  else {
    double v11 = v7;
  }
  if (result >= v11) {
    return v11;
  }
  return result;
}

@end