@interface PXPhotosDetailsLocationSearchUIFactory
+ (id)searchViewControllerWithAssets:(id)a3 delegate:(id)a4;
+ (id)searchViewControllerWithAssets:(id)a3 delegate:(id)a4 completion:(id)a5;
@end

@implementation PXPhotosDetailsLocationSearchUIFactory

+ (id)searchViewControllerWithAssets:(id)a3 delegate:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [NSClassFromString(&cfstr_Pxphotosdetail_28.isa) searchViewControllerWithAssets:v9 delegate:v8 completion:v7];

  return v10;
}

+ (id)searchViewControllerWithAssets:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [NSClassFromString(&cfstr_Pxphotosdetail_28.isa) searchViewControllerWithAssets:v6 delegate:v5];

  return v7;
}

@end