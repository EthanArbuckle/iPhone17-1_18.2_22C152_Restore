@interface NSPersistentStore
- (NSCoreDataCoreSpotlightDelegate)rd_associatedCoreSpotlightDelegate;
- (void)setRd_associatedCoreSpotlightDelegate:(id)a3;
@end

@implementation NSPersistentStore

- (NSCoreDataCoreSpotlightDelegate)rd_associatedCoreSpotlightDelegate
{
  return (NSCoreDataCoreSpotlightDelegate *)objc_getAssociatedObject(self, "rd_associatedCoreSpotlightDelegate");
}

- (void)setRd_associatedCoreSpotlightDelegate:(id)a3
{
}

@end