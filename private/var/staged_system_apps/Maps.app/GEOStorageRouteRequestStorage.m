@interface GEOStorageRouteRequestStorage
- (GEOComposedGeometryRoutePersistentData)destinationRouteData;
- (void)setDestinationRouteData:(id)a3;
@end

@implementation GEOStorageRouteRequestStorage

- (GEOComposedGeometryRoutePersistentData)destinationRouteData
{
  v3 = [(GEOStorageRouteRequestStorage *)self destinationPersistentData];
  if (v3)
  {
    v4 = objc_getAssociatedObject(self, "destinationRouteData");
    if (v4)
    {
      id v5 = v4;
    }
    else
    {
      id v9 = 0;
      v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v9];
      id v7 = v9;
      objc_setAssociatedObject(self, "destinationRouteData", v6, (void *)1);
      id v5 = v6;
    }
  }
  else
  {
    id v5 = 0;
  }

  return (GEOComposedGeometryRoutePersistentData *)v5;
}

- (void)setDestinationRouteData:(id)a3
{
  id v6 = 0;
  v4 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v6];
  id v5 = v6;
  [(GEOStorageRouteRequestStorage *)self setDestinationPersistentData:v4];
  objc_setAssociatedObject(self, "destinationRouteData", 0, (void *)1);
}

@end