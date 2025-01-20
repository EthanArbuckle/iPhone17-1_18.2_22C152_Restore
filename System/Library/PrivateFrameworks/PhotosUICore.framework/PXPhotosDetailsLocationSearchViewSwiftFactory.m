@interface PXPhotosDetailsLocationSearchViewSwiftFactory
+ (id)searchViewControllerWithAssets:(id)a3 delegate:(id)a4;
+ (id)searchViewControllerWithAssets:(id)a3 delegate:(id)a4 completion:(id)a5;
@end

@implementation PXPhotosDetailsLocationSearchViewSwiftFactory

+ (id)searchViewControllerWithAssets:(id)a3 delegate:(id)a4 completion:(id)a5
{
  return +[PhotosDetailsLocationSearchViewFactory searchViewControllerWithAssets:a3 delegate:a4 completion:a5];
}

+ (id)searchViewControllerWithAssets:(id)a3 delegate:(id)a4
{
  return +[PXPhotosDetailsLocationSearchViewSwiftFactory searchViewControllerWithAssets:a3 delegate:a4 completion:0];
}

@end