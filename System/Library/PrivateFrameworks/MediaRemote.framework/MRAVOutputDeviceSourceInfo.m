@interface MRAVOutputDeviceSourceInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)multipleBuiltInDevices;
- (MRAVOutputDeviceSourceInfo)initWithRoutingContextUID:(id)a3 multipleBuiltInDevices:(BOOL)a4;
- (NSString)routingContextUID;
- (id)description;
@end

@implementation MRAVOutputDeviceSourceInfo

- (void).cxx_destruct
{
}

- (MRAVOutputDeviceSourceInfo)initWithRoutingContextUID:(id)a3 multipleBuiltInDevices:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRAVOutputDeviceSourceInfo;
  v7 = [(MRAVOutputDeviceSourceInfo *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    routingContextUID = v7->_routingContextUID;
    v7->_routingContextUID = (NSString *)v8;

    v7->_multipleBuiltInDevices = a4;
  }

  return v7;
}

- (BOOL)multipleBuiltInDevices
{
  return self->_multipleBuiltInDevices;
}

- (NSString)routingContextUID
{
  return self->_routingContextUID;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_multipleBuiltInDevices) {
    v5 = "YES";
  }
  else {
    v5 = "NO";
  }
  return (id)[v3 stringWithFormat:@"<%@:%p routingContextUID = %@, multipleBuiltIn = %s>", v4, self, self->_routingContextUID, v5];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 routingContextUID];
    if ([v6 isEqual:self->_routingContextUID]) {
      BOOL v7 = self->_multipleBuiltInDevices == [v5 multipleBuiltInDevices];
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

@end