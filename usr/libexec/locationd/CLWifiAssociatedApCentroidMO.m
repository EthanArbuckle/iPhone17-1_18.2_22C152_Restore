@interface CLWifiAssociatedApCentroidMO
+ (id)fetchRequest;
- (id)convert;
@end

@implementation CLWifiAssociatedApCentroidMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"CLWifiAssociatedApCentroidMO"];
}

- (id)convert
{
  v3 = [CLWifiAssociatedApCentroidDO alloc];
  id v4 = [(CLWifiAssociatedApCentroidMO *)self mac];
  [(CLWifiAssociatedApCentroidMO *)self latitude];
  double v6 = v5;
  [(CLWifiAssociatedApCentroidMO *)self longitude];
  double v8 = v7;
  [(CLWifiAssociatedApCentroidMO *)self altitude];
  double v10 = v9;
  [(CLWifiAssociatedApCentroidMO *)self horizontalAccuracy];
  double v12 = v11;
  [(CLWifiAssociatedApCentroidMO *)self verticalAccuracy];
  double v14 = v13;
  id v15 = [(CLWifiAssociatedApCentroidMO *)self reach];
  [(CLWifiAssociatedApCentroidMO *)self stationaryTimeInSeconds];
  double v17 = v16;
  id v18 = [(CLWifiAssociatedApCentroidMO *)self loiType];
  [(CLWifiAssociatedApCentroidMO *)self lastUpdated];

  return [(CLWifiAssociatedApCentroidDO *)v3 initWithMac:v4 latitude:v15 longitude:v18 altitude:v6 horizontalAccuracy:v8 verticalAccuracy:v10 reach:v12 stationaryTimeInSeconds:v14 loiType:v17 lastUpdated:v19];
}

@end