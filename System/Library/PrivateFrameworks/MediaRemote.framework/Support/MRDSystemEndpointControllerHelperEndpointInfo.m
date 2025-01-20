@interface MRDSystemEndpointControllerHelperEndpointInfo
- (BOOL)isAirplayActive;
- (MRDSystemEndpointControllerHelperEndpointInfo)initWithParentGroupID:(id)a3 isAirplayActive:(BOOL)a4;
- (NSString)parentGroupID;
@end

@implementation MRDSystemEndpointControllerHelperEndpointInfo

- (MRDSystemEndpointControllerHelperEndpointInfo)initWithParentGroupID:(id)a3 isAirplayActive:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRDSystemEndpointControllerHelperEndpointInfo;
  v8 = [(MRDSystemEndpointControllerHelperEndpointInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_parentGroupID, a3);
    v9->_isAirplayActive = a4;
  }

  return v9;
}

- (BOOL)isAirplayActive
{
  return self->_isAirplayActive;
}

- (NSString)parentGroupID
{
  return self->_parentGroupID;
}

- (void).cxx_destruct
{
}

@end