@interface TUApplicationContentSizeCategoryProvider
- (NSString)currentContentSizeCategory;
- (TUApplicationContentSizeCategoryProvider)init;
@end

@implementation TUApplicationContentSizeCategoryProvider

- (NSString)currentContentSizeCategory
{
  v2 = self;
  id v3 = ApplicationContentSizeCategoryProvider.currentContentSizeCategory.getter();

  return (NSString *)v3;
}

- (TUApplicationContentSizeCategoryProvider)init
{
  return (TUApplicationContentSizeCategoryProvider *)ApplicationContentSizeCategoryProvider.init()();
}

@end