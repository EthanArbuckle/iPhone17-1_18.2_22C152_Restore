@interface CSDConversationProvider
- (BOOL)supportsLinks;
- (BOOL)supportsSharePlay;
- (BOOL)supportsVideo;
- (CSDConversationProvider)initWithProvider:(id)a3;
- (CSDConversationProviderDelegate)delegate;
- (CSDIDSService)service;
- (NSString)bundleIdentifier;
- (NSString)identifier;
- (NSString)pseudonymFeatureID;
- (TUConversationProvider)tuProvider;
- (id)callerIDAccount;
- (id)tuConversationProvider;
- (void)generatePseudonymHandleForConversationWithExpiryDuration:(double)a3 URI:(id)a4 completionHandler:(id)a5;
- (void)isPseudonymHandleForProvider:(id)a3 completionHandler:(id)a4;
- (void)registerWithIDSWithCompletionHandler:(id)a3;
- (void)renewPseudonymHandle:(id)a3 expirationDate:(id)a4 completionHandler:(id)a5;
- (void)revokePseudonymHandle:(id)a3 completionHandler:(id)a4;
- (void)setService:(id)a3;
@end

@implementation CSDConversationProvider

- (CSDConversationProvider)initWithProvider:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CSDConversationProvider;
  v5 = [(CSDConversationProvider *)&v18 init];
  if (v5)
  {
    v6 = [v4 identifier];
    v7 = (NSString *)[v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = v7;

    v9 = [v4 bundleIdentifier];
    v10 = (NSString *)[v9 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = v10;

    v12 = [v4 pseudonymFeatureID];
    v13 = (NSString *)[v12 copy];
    pseudonymFeatureID = v5->_pseudonymFeatureID;
    v5->_pseudonymFeatureID = v13;

    v5->_supportsLinks = [v4 supportsLinks];
    v5->_supportsSharePlay = [v4 supportsSharePlay];
    v5->_supportsVideo = [v4 supportsVideo];
    v15 = (TUConversationProvider *)[v4 copy];
    tuProvider = v5->_tuProvider;
    v5->_tuProvider = v15;
  }
  return v5;
}

- (id)tuConversationProvider
{
  id v3 = objc_alloc((Class)TUConversationProviderConfiguration);
  id v4 = [(CSDConversationProvider *)self identifier];
  id v5 = [v3 initWithServiceName:v4];

  v6 = [(CSDConversationProvider *)self bundleIdentifier];
  id v7 = [v6 copy];
  [v5 setBundleID:v7];

  v8 = [(CSDConversationProvider *)self pseudonymFeatureID];
  id v9 = [v8 copy];
  [v5 setPseudonymFeatureID:v9];

  id v10 = [objc_alloc((Class)TUConversationProvider) initWithConfiguration:v5];

  return v10;
}

- (void)registerWithIDSWithCompletionHandler:(id)a3
{
  v8 = (void (**)(id, void))a3;
  id v4 = [CSDIDSService alloc];
  id v5 = [(CSDConversationProvider *)self identifier];
  v6 = [(CSDIDSService *)v4 initWithName:v5];
  service = self->_service;
  self->_service = v6;

  v8[2](v8, 0);
}

- (id)callerIDAccount
{
  v2 = [(CSDConversationProvider *)self service];
  id v3 = [v2 account];

  return v3;
}

- (void)generatePseudonymHandleForConversationWithExpiryDuration:(double)a3 URI:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(CSDConversationProvider *)self service];
  id v11 = [objc_alloc((Class)TUHandle) initWithType:1 value:v9];

  pseudonymFeatureID = self->_pseudonymFeatureID;
  v13 = [(CSDConversationProvider *)self service];
  v14 = [v13 name];
  v15 = +[NSArray arrayWithObject:v14];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001C7468;
  v17[3] = &unk_10050A118;
  id v18 = v8;
  id v16 = v8;
  [v10 provisionPseudonymForHandle:v11 featureID:pseudonymFeatureID scopeID:0 expiryDuration:v15 allowedServices:v17 completionHandler:a3];
}

- (void)renewPseudonymHandle:(id)a3 expirationDate:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CSDConversationProvider *)self service];
  v12 = [v10 value];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001C7658;
  v14[3] = &unk_10050A140;
  id v15 = v8;
  id v13 = v8;
  [v11 renewPseudonymString:v12 expirationDate:v9 completionHandler:v14];
}

- (void)revokePseudonymHandle:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(CSDConversationProvider *)self service];
  id v8 = [v7 value];

  [v9 revokePseudonymString:v8 completionHandler:v6];
}

- (void)isPseudonymHandleForProvider:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v10 = [(CSDConversationProvider *)self service];
  id v9 = [v8 value];

  (*((void (**)(id, id))a4 + 2))(v7, [v10 checkValidityForSelfPseudonymString:v9]);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (TUConversationProvider)tuProvider
{
  return self->_tuProvider;
}

- (CSDIDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)pseudonymFeatureID
{
  return self->_pseudonymFeatureID;
}

- (BOOL)supportsLinks
{
  return self->_supportsLinks;
}

- (BOOL)supportsSharePlay
{
  return self->_supportsSharePlay;
}

- (BOOL)supportsVideo
{
  return self->_supportsVideo;
}

- (CSDConversationProviderDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_pseudonymFeatureID, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_tuProvider, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end