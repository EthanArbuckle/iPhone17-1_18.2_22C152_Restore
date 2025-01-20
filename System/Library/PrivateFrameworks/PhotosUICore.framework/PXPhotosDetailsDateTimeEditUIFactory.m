@interface PXPhotosDetailsDateTimeEditUIFactory
+ (id)dateTimeViewControllerWithAssets:(id)a3 completion:(id)a4;
@end

@implementation PXPhotosDetailsDateTimeEditUIFactory

+ (id)dateTimeViewControllerWithAssets:(id)a3 completion:(id)a4
{
  return +[PhotosDetailsDateTimeEditViewFactory dateTimeViewControllerWithAssets:a3 completion:a4];
}

@end