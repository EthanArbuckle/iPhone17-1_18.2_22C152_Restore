@interface UIBarButtonItem(PXDefaultBarButtonItems)
+ (id)px_localizedAddBarButtonItem;
+ (id)px_localizedDeselectAllBarButtonItem;
+ (id)px_localizedSelectAllBarButtonItem;
+ (id)px_localizedSelectBarButtonItem;
@end

@implementation UIBarButtonItem(PXDefaultBarButtonItems)

+ (id)px_localizedSelectBarButtonItem
{
  id v1 = [a1 alloc];
  v2 = PXLocalizedStringFromTable(@"PXPhotosDetailsBarSelectButton", @"PhotosUICore");
  v3 = (void *)[v1 initWithTitle:v2 style:0 target:0 action:0];

  return v3;
}

+ (id)px_localizedAddBarButtonItem
{
  id v1 = [a1 alloc];
  v2 = PXLocalizedStringFromTable(@"PXAddButtonTitle", @"PhotosUICore");
  v3 = (void *)[v1 initWithTitle:v2 style:0 target:0 action:0];

  return v3;
}

+ (id)px_localizedDeselectAllBarButtonItem
{
  id v1 = [a1 alloc];
  v2 = PXLocalizedStringFromTable(@"PXPhotosBarsDeselectAll", @"PhotosUICore");
  v3 = (void *)[v1 initWithTitle:v2 style:0 target:0 action:0];

  return v3;
}

+ (id)px_localizedSelectAllBarButtonItem
{
  id v1 = [a1 alloc];
  v2 = PXLocalizedStringFromTable(@"PXPhotosBarsSelectAll", @"PhotosUICore");
  v3 = (void *)[v1 initWithTitle:v2 style:0 target:0 action:0];

  return v3;
}

@end