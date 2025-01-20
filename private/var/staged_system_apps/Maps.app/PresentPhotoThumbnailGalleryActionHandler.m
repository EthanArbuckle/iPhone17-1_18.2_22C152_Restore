@interface PresentPhotoThumbnailGalleryActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation PresentPhotoThumbnailGalleryActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v10;
    v7 = [v5 coordinator];
    v8 = [v6 mapItem];
    id v9 = [v6 albumIndex];

    [v7 viewControllerShowPhotoThumbnailGalleryWithMapItem:v8 albumIndex:v9];
  }
}

@end