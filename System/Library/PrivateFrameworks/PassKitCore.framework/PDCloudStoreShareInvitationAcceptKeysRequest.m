@interface PDCloudStoreShareInvitationAcceptKeysRequest
- (BOOL)canCoalesceRequest:(id)a3;
- (PDCloudStoreShareInvitationAcceptKeysRequest)initWithInvitation:(id)a3 fromDestination:(id)a4 completion:(id)a5;
- (PKCloudStoreZoneInvitation)invitation;
- (PKSharingDestination)fromDestination;
- (id)description;
@end

@implementation PDCloudStoreShareInvitationAcceptKeysRequest

- (PDCloudStoreShareInvitationAcceptKeysRequest)initWithInvitation:(id)a3 fromDestination:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PDCloudStoreShareInvitationAcceptKeysRequest;
  v11 = [(PDCloudStoreShareInvitationRequest *)&v14 initWithType:0 completion:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_invitation, a3);
    objc_storeStrong((id *)&v12->_fromDestination, a4);
  }

  return v12;
}

- (BOOL)canCoalesceRequest:(id)a3
{
  id v4 = a3;
  if (![v4 type])
  {
    id v6 = v4;
    v7 = [v6 invitation];
    v8 = [v6 fromDestination];
    id v9 = [v7 zoneName];
    id v10 = [(PKCloudStoreZoneInvitation *)self->_invitation zoneName];
    id v11 = v9;
    id v12 = v10;
    v13 = v12;
    if (v11 == v12)
    {
    }
    else
    {
      if (!v11 || !v12)
      {

        goto LABEL_18;
      }
      unsigned int v14 = [v11 isEqualToString:v12];

      if (!v14) {
        goto LABEL_18;
      }
    }
    v15 = [v7 containerIdentifier];
    v16 = [(PKCloudStoreZoneInvitation *)self->_invitation containerIdentifier];
    id v17 = v15;
    id v18 = v16;
    if (v17 == v18)
    {

      goto LABEL_16;
    }
    v19 = v18;
    if (v17 && v18)
    {
      unsigned __int8 v20 = [v17 isEqualToString:v18];

      if ((v20 & 1) == 0) {
        goto LABEL_19;
      }
LABEL_16:
      char v5 = PKEqualObjects();
LABEL_20:

      goto LABEL_21;
    }

LABEL_18:
LABEL_19:
    char v5 = 0;
    goto LABEL_20;
  }
  char v5 = 0;
LABEL_21:

  return v5;
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
  [v3 appendFormat:@"invitation: '%@'; ", self->_invitation];
  [v3 appendFormat:@"fromDestination: '%@'; ", self->_fromDestination];
  [v3 appendFormat:@">"];
  return v3;
}

- (PKCloudStoreZoneInvitation)invitation
{
  return self->_invitation;
}

- (PKSharingDestination)fromDestination
{
  return self->_fromDestination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromDestination, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
}

@end