@interface PUCollectionRelevancyDebugViewControllerFactory
+ (id)viewController;
- (PUCollectionRelevancyDebugViewControllerFactory)init;
@end

@implementation PUCollectionRelevancyDebugViewControllerFactory

+ (id)viewController
{
  v2 = (void *)sub_1AEA770D8();
  return v2;
}

- (PUCollectionRelevancyDebugViewControllerFactory)init
{
  return (PUCollectionRelevancyDebugViewControllerFactory *)CollectionRelevancyDebugViewControllerFactory.init()();
}

@end