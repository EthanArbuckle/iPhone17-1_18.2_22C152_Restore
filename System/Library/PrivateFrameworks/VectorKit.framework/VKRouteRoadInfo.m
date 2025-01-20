@interface VKRouteRoadInfo
- (NSString)name;
- (NSString)shieldGroup;
- (PolylineCoordinate)routeOffset;
- (VKRouteRoadInfo)initWithName:(id)a3 shieldGroup:(id)a4 offset:(PolylineCoordinate)a5;
- (id).cxx_construct;
@end

@implementation VKRouteRoadInfo

- (id).cxx_construct
{
  *((void *)self + 3) = 0xBF80000000000000;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shieldGroup, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (PolylineCoordinate)routeOffset
{
  return self->_routeOffset;
}

- (NSString)shieldGroup
{
  return self->_shieldGroup;
}

- (NSString)name
{
  return self->_name;
}

- (VKRouteRoadInfo)initWithName:(id)a3 shieldGroup:(id)a4 offset:(PolylineCoordinate)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)VKRouteRoadInfo;
  v11 = [(VKRouteRoadInfo *)&v15 init];
  v12 = v11;
  if (v11)
  {
    v11->_routeOffset = a5;
    objc_storeStrong((id *)&v11->_name, a3);
    objc_storeStrong((id *)&v12->_shieldGroup, a4);
    v13 = v12;
  }

  return v12;
}

@end