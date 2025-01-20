@interface PDCloudStoreShareInvitationCreateKeysRequest
- (BOOL)canCoalesceRequest:(id)a3;
- (NSString)containerName;
- (NSString)handle;
- (NSString)zoneName;
- (PDCloudStoreShareInvitationCreateKeysRequest)initWithHandle:(id)a3 permission:(int64_t)a4 zoneName:(id)a5 containerName:(id)a6 completion:(id)a7;
- (id)description;
- (int64_t)permission;
@end

@implementation PDCloudStoreShareInvitationCreateKeysRequest

- (PDCloudStoreShareInvitationCreateKeysRequest)initWithHandle:(id)a3 permission:(int64_t)a4 zoneName:(id)a5 containerName:(id)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PDCloudStoreShareInvitationCreateKeysRequest;
  v16 = [(PDCloudStoreShareInvitationRequest *)&v19 initWithType:2 completion:a7];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_handle, a3);
    v17->_permission = a4;
    objc_storeStrong((id *)&v17->_zoneName, a5);
    objc_storeStrong((id *)&v17->_containerName, a6);
  }

  return v17;
}

- (BOOL)canCoalesceRequest:(id)a3
{
  id v4 = a3;
  if ([v4 type] == (id)2)
  {
    id v5 = v4;
    v6 = [v5 zoneName];
    v7 = [v5 handle];
    v8 = [v5 containerName];
    id v9 = [v5 permission];
    zoneName = self->_zoneName;
    v11 = v6;
    v12 = zoneName;
    if (v11 == v12)
    {
    }
    else
    {
      id v13 = v12;
      if (!v11 || !v12)
      {

        goto LABEL_22;
      }
      unsigned int v14 = [(NSString *)v11 isEqualToString:v12];

      if (!v14) {
        goto LABEL_22;
      }
    }
    handle = self->_handle;
    v17 = v7;
    v18 = handle;
    if (v17 == v18)
    {
    }
    else
    {
      objc_super v19 = v18;
      if (!v17 || !v18) {
        goto LABEL_21;
      }
      unsigned int v20 = [(NSString *)v17 isEqualToString:v18];

      if (!v20) {
        goto LABEL_22;
      }
    }
    containerName = self->_containerName;
    v17 = v8;
    v22 = containerName;
    if (v17 == v22)
    {

LABEL_26:
      BOOL v15 = self->_permission == (void)v9;
      goto LABEL_23;
    }
    objc_super v19 = v22;
    if (v17 && v22)
    {
      unsigned int v23 = [(NSString *)v17 isEqualToString:v22];

      if (v23) {
        goto LABEL_26;
      }
LABEL_22:
      BOOL v15 = 0;
LABEL_23:

      goto LABEL_24;
    }
LABEL_21:

    goto LABEL_22;
  }
  BOOL v15 = 0;
LABEL_24:

  return v15;
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
  [v3 appendFormat:@"handle: '%@'; ", self->_handle];
  v6 = CKStringFromParticipantPermission();
  [v3 appendFormat:@"permission: '%@'; ", v6];

  [v3 appendFormat:@"zoneName: '%@'; ", self->_zoneName];
  [v3 appendFormat:@"containerName: '%@'; ", self->_containerName];
  [v3 appendFormat:@">"];
  return v3;
}

- (int64_t)permission
{
  return self->_permission;
}

- (NSString)handle
{
  return self->_handle;
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
  objc_storeStrong((id *)&self->_handle, 0);
}

@end