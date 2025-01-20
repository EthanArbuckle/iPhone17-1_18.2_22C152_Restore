@interface PUSlideshowNavigationController
- (CGSize)preferredContentSize;
- (PUSlideshowNavigationController)initWithRootViewController:(id)a3;
@end

@implementation PUSlideshowNavigationController

- (CGSize)preferredContentSize
{
  v2 = [(PUSlideshowNavigationController *)self view];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (PUSlideshowNavigationController)initWithRootViewController:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PUSlideshowNavigationController;
  double v3 = [(PUSlideshowNavigationController *)&v10 initWithRootViewController:a3];
  if (v3)
  {
    double v4 = [MEMORY[0x1E4FB1618] labelColor];
    double v5 = [(PUSlideshowNavigationController *)v3 navigationBar];
    [v5 setTintColor:v4];
    double v6 = [v5 standardAppearance];
    [v5 setScrollEdgeAppearance:v6];

    double v7 = [(PUSlideshowNavigationController *)v3 toolbar];
    [v7 setTintColor:v4];
    [(PUSlideshowNavigationController *)v3 setToolbarHidden:0];
    double v8 = [v7 standardAppearance];
    [v7 setScrollEdgeAppearance:v8];

    [(PUSlideshowNavigationController *)v3 setModalPresentationStyle:0];
  }
  return v3;
}

@end