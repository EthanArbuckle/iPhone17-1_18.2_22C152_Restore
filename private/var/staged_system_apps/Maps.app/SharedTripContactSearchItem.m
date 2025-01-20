@interface SharedTripContactSearchItem
- (NSString)_maps_diffableDataSourceIdentifier;
@end

@implementation SharedTripContactSearchItem

- (NSString)_maps_diffableDataSourceIdentifier
{
  return (NSString *)@"ContactSearch";
}

@end