@interface TTRIUIDividedGridView
- (CGSize)intrinsicContentSize;
- (TTRIDividedGridViewController)viewController;
- (id)accessibilityElements;
- (void)setViewController:(id)a3;
@end

@implementation TTRIUIDividedGridView

- (CGSize)intrinsicContentSize
{
  v2 = [(TTRIUIDividedGridView *)self viewController];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)accessibilityElements
{
  v2 = [(TTRIUIDividedGridView *)self viewController];
  double v3 = [v2 allCells];

  return v3;
}

- (TTRIDividedGridViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (TTRIDividedGridViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end