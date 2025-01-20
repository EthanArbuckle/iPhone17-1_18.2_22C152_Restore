@interface PDCloudStoreShareBootstrapZoneRequest
- (BOOL)canCoalesceRequest:(id)a3;
- (NSString)containerName;
- (NSString)zoneName;
- (PDCloudStoreShareBootstrapZoneRequest)initWithZoneName:(id)a3 containerName:(id)a4 completion:(id)a5;
- (id)description;
@end

@implementation PDCloudStoreShareBootstrapZoneRequest

- (PDCloudStoreShareBootstrapZoneRequest)initWithZoneName:(id)a3 containerName:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PDCloudStoreShareBootstrapZoneRequest;
  v11 = [(PDCloudStoreShareInvitationRequest *)&v14 initWithType:7 completion:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_zoneName, a3);
    objc_storeStrong((id *)&v12->_containerName, a4);
  }

  return v12;
}

- (BOOL)canCoalesceRequest:(id)a3
{
  id v4 = a3;
  if ([v4 type] == (id)7)
  {
    id v5 = v4;
    v6 = [v5 zoneName];
    zoneName = self->_zoneName;
    v8 = v6;
    id v9 = zoneName;
    if (v8 == v9)
    {
    }
    else
    {
      id v10 = v9;
      LOBYTE(v11) = 0;
      if (!v8 || !v9)
      {
        v16 = v8;
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      unsigned int v11 = [(NSString *)v8 isEqualToString:v9];

      if (!v11) {
        goto LABEL_17;
      }
    }
    v12 = [v5 containerName];
    containerName = self->_containerName;
    id v10 = v12;
    objc_super v14 = containerName;
    v15 = v14;
    if (v10 == v14)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      LOBYTE(v11) = 0;
      if (v10 && v14) {
        LOBYTE(v11) = [(NSString *)v10 isEqualToString:v14];
      }
    }

    v16 = v10;
    goto LABEL_16;
  }
  LOBYTE(v11) = 0;
LABEL_18:

  return v11;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  unint64_t v4 = [(PDCloudStoreShareInvitationRequest *)self type];
  if (v4 - 1 > 6) {
    CFStringRef v5 = @"acceptKeys";
  }
  else {
    CFStringRef v5 = off_10073DCC0[v4 - 1];
  }
  [v3 appendFormat:@"type: '%@'; ", v5];
  [v3 appendFormat:@"zoneName: '%@'; ", self->_zoneName];
  [v3 appendFormat:@"containerName: '%@'; ", self->_containerName];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSString)containerName
{
  return self->_containerName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end