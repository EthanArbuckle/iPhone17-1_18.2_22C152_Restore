@interface NonSelectableCollectionViewListCell
+ (id)reuseIdentifier;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation NonSelectableCollectionViewListCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4 = +[UIBackgroundConfiguration clearConfiguration];
  [(NonSelectableCollectionViewListCell *)self setBackgroundConfiguration:v4];
}

@end