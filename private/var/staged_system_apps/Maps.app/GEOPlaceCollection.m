@interface GEOPlaceCollection
- (id)joeColorImage;
@end

@implementation GEOPlaceCollection

- (id)joeColorImage
{
  v3 = +[MKPlaceCollectionImageProvider sharedInstance];
  v4 = [v3 joeColorForCuratedCollection:self];

  CGFloat v5 = kRichPreviewSnapshotSize[0];
  CGFloat v6 = kRichPreviewSnapshotSize[1];
  v10.width = kRichPreviewSnapshotSize[0];
  v10.height = v6;
  UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
  [v4 set];
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = v5;
  v11.size.height = v6;
  UIRectFill(v11);
  v7 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v7;
}

@end