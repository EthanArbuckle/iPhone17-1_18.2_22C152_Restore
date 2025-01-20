@interface _SUUIModalSheetNavigationController
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (int64_t)forcedUserInterfaceStyle;
- (int64_t)preferredUserInterfaceStyle;
- (void)setForcedUserInterfaceStyle:(int64_t)a3;
@end

@implementation _SUUIModalSheetNavigationController

- (int64_t)preferredUserInterfaceStyle
{
  return self->_forcedUserInterfaceStyle;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = [(_SUUIModalSheetNavigationController *)self topViewController];

  if (v8 != v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)_SUUIModalSheetNavigationController;
    -[_SUUIModalSheetNavigationController sizeForChildContentContainer:withParentContainerSize:](&v13, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
    double width = v9;
    double height = v10;
  }

  double v11 = width;
  double v12 = height;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (int64_t)forcedUserInterfaceStyle
{
  return self->_forcedUserInterfaceStyle;
}

- (void)setForcedUserInterfaceStyle:(int64_t)a3
{
  self->_forcedUserInterfaceStyle = a3;
}

@end