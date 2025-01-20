@interface RoutePlanningWaypointRequest
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (RoutePlanningWaypointRequest)initWithWaypointPlaceholder:(id)a3 request:(id)a4 preferredNameSource:(unint64_t)a5;
- (WaypointPlaceholder)waypointPlaceholder;
- (WaypointRequest)waypointRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (id)nameWithResolvedWaypoint:(id)a3 allowCurrentLocation:(BOOL)a4;
- (unint64_t)hash;
- (unint64_t)preferredNameSource;
- (void)_maps_buildDescriptionWithBlock:(id)a3;
@end

@implementation RoutePlanningWaypointRequest

- (RoutePlanningWaypointRequest)initWithWaypointPlaceholder:(id)a3 request:(id)a4 preferredNameSource:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RoutePlanningWaypointRequest;
  v11 = [(RoutePlanningWaypointRequest *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_waypointPlaceholder, a3);
    v13 = (WaypointRequest *)[v10 copyWithZone:0];
    waypointRequest = v12->_waypointRequest;
    v12->_waypointRequest = v13;

    v12->_preferredNameSource = a5;
  }

  return v12;
}

- (id)nameWithResolvedWaypoint:(id)a3 allowCurrentLocation:(BOOL)a4
{
  id v6 = a3;
  v7 = v6;
  if (a4 || ![v6 isCurrentLocation])
  {
    if ([(RoutePlanningWaypointRequest *)self preferredNameSource])
    {
      if (!v7 || ([v7 isCurrentLocation] & 1) != 0)
      {
        id v11 = 0;
LABEL_19:
        if ([v11 length]) {
          goto LABEL_23;
        }
        v8 = [(RoutePlanningWaypointRequest *)self waypointPlaceholder];
        id v10 = [v8 name];
        goto LABEL_21;
      }
      v13 = [[SearchResult alloc] initWithComposedWaypoint:v7];
      id v11 = [(SearchResult *)v13 name];
    }
    else
    {
      v12 = [v7 addressBookAddress];
      if (v12)
      {
      }
      else
      {
        id v11 = [v7 findMyHandle];

        if (!v11) {
          goto LABEL_19;
        }
      }
      v13 = [(RoutePlanningWaypointRequest *)self waypointRequest];
      v14 = [(SearchResult *)v13 waypointName];
      v15 = v14;
      if (v14)
      {
        id v11 = v14;
      }
      else
      {
        v17 = [(RoutePlanningWaypointRequest *)self waypointPlaceholder];
        id v11 = [v17 name];
      }
    }

    goto LABEL_19;
  }
  v8 = [v7 mkMapItem];
  id v9 = [v8 _addressFormattedAsShortenedAddress];
  if (v9)
  {
    id v10 = v9;
    id v11 = v10;
LABEL_21:
    uint64_t v16 = (uint64_t)v10;
    goto LABEL_22;
  }
  uint64_t v16 = MKLocalizedStringForUnknownLocation();
  id v11 = 0;
LABEL_22:

  id v11 = (id)v16;
LABEL_23:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  waypointPlaceholder = self->_waypointPlaceholder;
  waypointRequest = self->_waypointRequest;
  unint64_t preferredNameSource = self->_preferredNameSource;

  return [v4 initWithWaypointPlaceholder:waypointPlaceholder request:waypointRequest preferredNameSource:preferredNameSource];
}

- (unint64_t)hash
{
  unint64_t v3 = [(WaypointPlaceholder *)self->_waypointPlaceholder hash];
  return (unint64_t)[(WaypointRequest *)self->_waypointRequest hash] ^ v3 ^ (2654435761u
                                                                                         * self->_preferredNameSource);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RoutePlanningWaypointRequest *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else if ([(RoutePlanningWaypointRequest *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    waypointPlaceholder = self->_waypointPlaceholder;
    v7 = [(RoutePlanningWaypointRequest *)v5 waypointPlaceholder];
    if ([(WaypointPlaceholder *)waypointPlaceholder isEqual:v7])
    {
      waypointRequest = self->_waypointRequest;
      id v9 = [(RoutePlanningWaypointRequest *)v5 waypointRequest];
      if ([(WaypointRequest *)waypointRequest isEqual:v9])
      {
        id preferredNameSource = self->_preferredNameSource;
        BOOL v11 = preferredNameSource == (id)[(RoutePlanningWaypointRequest *)v5 preferredNameSource];
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (NSString)description
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  uint64_t v16 = sub_10009270C;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(RoutePlanningWaypointRequest *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(RoutePlanningWaypointRequest *)v5 performSelector:"accessibilityIdentifier"];
      id v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        id v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    id v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  id v10 = @"<nil>";
LABEL_9:

  BOOL v11 = [v3 componentsJoinedByString:@", "];
  v12 = +[NSString stringWithFormat:@"%@ (%@)", v10, v11];

  return (NSString *)v12;
}

- (NSString)debugDescription
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  uint64_t v16 = sub_100AA1AAC;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(RoutePlanningWaypointRequest *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(RoutePlanningWaypointRequest *)v5 performSelector:"accessibilityIdentifier"];
      id v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        id v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    id v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  id v10 = @"<nil>";
LABEL_9:

  BOOL v11 = [v3 componentsJoinedByString:@"\n"];
  v12 = +[NSString stringWithFormat:@"%@ {\n%@\n}", v10, v11];

  return (NSString *)v12;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  id v4 = (void (**)(id, const __CFString *, WaypointRequest *))((char *)a3 + 16);
  v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, @"waypointRequest", self->_waypointRequest);
  v7 = +[NSNumber numberWithUnsignedInteger:self->_preferredNameSource];
  (*v4)(v6, @"preferredNameSource", v7);
}

- (WaypointPlaceholder)waypointPlaceholder
{
  return self->_waypointPlaceholder;
}

- (WaypointRequest)waypointRequest
{
  return self->_waypointRequest;
}

- (unint64_t)preferredNameSource
{
  return self->_preferredNameSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointRequest, 0);

  objc_storeStrong((id *)&self->_waypointPlaceholder, 0);
}

@end