@interface PDSharingManagementRetrieveFIDOChallengeRequest
- (NSString)dpanIdentifier;
- (PKFidoProfile)fidoProfile;
- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setDpanIdentifier:(id)a3;
- (void)setFidoProfile:(id)a3;
@end

@implementation PDSharingManagementRetrieveFIDOChallengeRequest

- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  v19[0] = @"sharing";
  v19[1] = @"fidoChallenge";
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSArray arrayWithObjects:v19 count:2];
  v9 = [(PDSharingManagementRetrieveFIDOChallengeRequest *)self _murlRequestWithServiceURL:v7 endpointComponents:v8 queryParameters:0 appleAccountInformation:v6];

  [v9 setHTTPMethod:@"POST"];
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  [v10 setObject:self->_dpanIdentifier forKeyedSubscript:@"dpanIdentifier"];
  v17[0] = @"relyingPartyIdentifier";
  v11 = [(PKFidoProfile *)self->_fidoProfile relyingPartyIdentifier];
  v17[1] = @"accountHash";
  v18[0] = v11;
  v12 = [(PKFidoProfile *)self->_fidoProfile accountHash];
  v18[1] = v12;
  v13 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  [v10 setObject:v13 forKeyedSubscript:@"fidoProfile"];

  v14 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v10];
  [v9 setHTTPBody:v14];

  id v15 = [v9 copy];
  return v15;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDpanIdentifier:(id)a3
{
}

- (PKFidoProfile)fidoProfile
{
  return self->_fidoProfile;
}

- (void)setFidoProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fidoProfile, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
}

@end