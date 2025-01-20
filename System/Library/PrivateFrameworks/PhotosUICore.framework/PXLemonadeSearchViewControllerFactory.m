@interface PXLemonadeSearchViewControllerFactory
+ (void)presentDatePickerWithCompletion:(id)a3;
+ (void)presentLocationPickerWithPhotoLibrary:(id)a3 completion:(id)a4;
- (PXLemonadeSearchViewControllerFactory)init;
@end

@implementation PXLemonadeSearchViewControllerFactory

+ (void)presentLocationPickerWithPhotoLibrary:(id)a3 completion:(id)a4
{
  v4 = _Block_copy(a4);
  _Block_release(v4);
}

+ (void)presentDatePickerWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  _Block_release(v3);
}

- (PXLemonadeSearchViewControllerFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXLemonadeSearchViewControllerFactory;
  return [(PXLemonadeSearchViewControllerFactory *)&v3 init];
}

@end