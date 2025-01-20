@interface CollectionURLActivityProvider
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation CollectionURLActivityProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if ([a4 isEqualToString:UIActivityTypeMail])
  {
    v5 = 0;
  }
  else
  {
    v6 = [(CollectionActivityProvider *)self collectionInfo];
    v5 = [v6 sharingURL];
  }

  return v5;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  v3 = [(CollectionActivityProvider *)self collectionInfo];
  v4 = [v3 sharingURL];

  return v4;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  v5 = [(CollectionActivityProvider *)self collectionInfo];
  v6 = [v5 image];

  return v6;
}

@end