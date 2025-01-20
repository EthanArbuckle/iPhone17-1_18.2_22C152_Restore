@interface HistoryEntryRecentRouteInfoSource
- (HistoryEntryRecentRouteInfoSource)initWithItem:(id)a3;
- (id)ifGEOStorageRouteRequestStorage;
- (id)ifRidesharingInformationSource;
@end

@implementation HistoryEntryRecentRouteInfoSource

- (HistoryEntryRecentRouteInfoSource)initWithItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HistoryEntryRecentRouteInfoSource;
  v6 = [(HistoryEntryRecentRouteInfoSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_item, a3);
  }

  return v7;
}

- (id)ifGEOStorageRouteRequestStorage
{
  return [(MSHistoryDirectionsItem *)self->_item routeRequestStorage];
}

- (id)ifRidesharingInformationSource
{
  return 0;
}

- (void).cxx_destruct
{
}

@end