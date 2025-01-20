@interface MSHistoryCuratedCollection
- (GEOMapItemIdentifier)mapItemIdentifier;
@end

@implementation MSHistoryCuratedCollection

- (GEOMapItemIdentifier)mapItemIdentifier
{
  id v2 = [objc_alloc((Class)GEOMapItemIdentifier) initWithMUID:[self curatedCollectionIdentifier] resultProviderID:[self resultProviderIdentifier] coordinate:-180.0 -180.0];

  return (GEOMapItemIdentifier *)v2;
}

@end