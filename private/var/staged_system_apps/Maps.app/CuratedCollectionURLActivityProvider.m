@interface CuratedCollectionURLActivityProvider
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
@end

@implementation CuratedCollectionURLActivityProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if ([a4 isEqualToString:UIActivityTypeMail])
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CuratedCollectionActivityProvider *)self url];
  }

  return v5;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  return 0;
}

@end