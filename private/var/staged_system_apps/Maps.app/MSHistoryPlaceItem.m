@interface MSHistoryPlaceItem
- (NSUUID)supersededSearchStorageIdentifier;
- (void)ifSearch:(id)a3 ifRoute:(id)a4 ifPlaceDisplay:(id)a5 ifTransitLineItem:(id)a6;
@end

@implementation MSHistoryPlaceItem

- (NSUUID)supersededSearchStorageIdentifier
{
  return (NSUUID *)[(MSHistoryPlaceItem *)self supersededSearchId];
}

- (void)ifSearch:(id)a3 ifRoute:(id)a4 ifPlaceDisplay:(id)a5 ifTransitLineItem:(id)a6
{
  if (a5) {
    (*((void (**)(id, MSHistoryPlaceItem *))a5 + 2))(a5, self);
  }
}

@end