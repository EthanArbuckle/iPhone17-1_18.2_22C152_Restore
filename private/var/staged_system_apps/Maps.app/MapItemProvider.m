@interface MapItemProvider
+ (id)mapItemSourceWithMapItem:(id)a3;
+ (id)mapItemSourceWithPersonalizedItem:(id)a3;
+ (id)mapItemSourceWithResolvedWaypoint:(id)a3;
- (MKMapItem)mapItem;
- (MapItemProvider)initWithMapItem:(id)a3 precedence:(unint64_t)a4;
- (unint64_t)precedence;
@end

@implementation MapItemProvider

+ (id)mapItemSourceWithMapItem:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && ([v4 placemark],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 coordinate],
        BOOL v7 = CLLocationCoordinate2DIsValid(v11),
        v6,
        v7))
  {
    id v8 = [objc_alloc((Class)a1) initWithMapItem:v5 precedence:1];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)mapItemSourceWithResolvedWaypoint:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)MKMapItem);
  v6 = [v4 geoMapItem];

  id v7 = [v5 initWithGeoMapItem:v6 isPlaceHolderPlace:0];
  if (v7
    && ([v7 placemark],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 coordinate],
        BOOL v9 = CLLocationCoordinate2DIsValid(v13),
        v8,
        v9))
  {
    id v10 = [objc_alloc((Class)a1) initWithMapItem:v7 precedence:3];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)mapItemSourceWithPersonalizedItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [v4 mapItem];

  id v7 = [v5 initWithMapItem:v6 precedence:2];

  return v7;
}

- (MapItemProvider)initWithMapItem:(id)a3 precedence:(unint64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MapItemProvider;
  id v8 = [(MapItemProvider *)&v12 init];
  BOOL v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mapItem, a3);
    v9->_precedence = a4;
    id v10 = v9;
  }

  return v9;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (unint64_t)precedence
{
  return self->_precedence;
}

- (void).cxx_destruct
{
}

@end