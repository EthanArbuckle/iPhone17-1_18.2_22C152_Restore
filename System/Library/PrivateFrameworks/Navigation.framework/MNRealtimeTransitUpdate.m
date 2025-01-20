@interface MNRealtimeTransitUpdate
+ (BOOL)supportsSecureCoding;
- (GEOTransitRouteUpdate)transitUpdate;
- (MNRealtimeTransitUpdate)initWithCoder:(id)a3;
- (MNRealtimeTransitUpdate)initWithTransitRouteUpdate:(id)a3;
- (id)description;
- (id)routeID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MNRealtimeTransitUpdate

- (MNRealtimeTransitUpdate)initWithTransitRouteUpdate:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNRealtimeTransitUpdate;
  v6 = [(MNRealtimeTransitUpdate *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transitUpdate, a3);
    v8 = v7;
  }

  return v7;
}

- (id)routeID
{
  v2 = (void *)MEMORY[0x1E4F29128];
  v3 = [(GEOTransitRouteUpdate *)self->_transitUpdate routeIdentifier];
  v4 = [v3 clientRouteHandle];
  id v5 = objc_msgSend(v2, "_maps_UUIDWithData:", v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MNRealtimeTransitUpdate;
  [(MNRealtimeUpdate *)&v6 encodeWithCoder:v4];
  transitUpdate = self->_transitUpdate;
  if (transitUpdate) {
    [v4 encodeObject:transitUpdate forKey:@"transitUpdate"];
  }
}

- (MNRealtimeTransitUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MNRealtimeTransitUpdate;
  id v5 = [(MNRealtimeUpdate *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transitUpdate"];
    transitUpdate = v5->_transitUpdate;
    v5->_transitUpdate = (GEOTransitRouteUpdate *)v6;
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"MNRealtimeTransitUpdate: %p with transitUpdate %@", self, self->_transitUpdate];
}

- (GEOTransitRouteUpdate)transitUpdate
{
  return self->_transitUpdate;
}

- (void).cxx_destruct
{
}

@end