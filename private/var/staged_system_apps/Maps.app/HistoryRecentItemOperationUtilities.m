@interface HistoryRecentItemOperationUtilities
+ (void)fetchHistoryItemsMatchingMapItem:(id)a3 completion:(id)a4;
+ (void)saveGeoMapItem:(id)a3;
@end

@implementation HistoryRecentItemOperationUtilities

+ (void)fetchHistoryItemsMatchingMapItem:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = objc_alloc((Class)_TtC8MapsSync22MapsSyncQueryPredicate);
  [v5 coordinate];
  double v10 = v9;
  [v5 coordinate];
  id v11 = [v8 initWithCenterLatitude:v10];
  id v12 = [objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions) initWithPredicate:v11 sortDescriptors:0 range:0];
  id v13 = objc_alloc_init((Class)MSHistoryPlaceItemRequest);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1008B2138;
  v17[3] = &unk_1012F09D8;
  id v18 = v5;
  id v19 = v7;
  id v20 = v6;
  id v14 = v6;
  id v15 = v7;
  id v16 = v5;
  [v13 fetchWithOptions:v12 completionHandler:v17];
}

+ (void)saveGeoMapItem:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1008B2430;
  v5[3] = &unk_1012F0F88;
  id v6 = a3;
  id v4 = v6;
  [a1 fetchHistoryItemsMatchingMapItem:v4 completion:v5];
}

@end