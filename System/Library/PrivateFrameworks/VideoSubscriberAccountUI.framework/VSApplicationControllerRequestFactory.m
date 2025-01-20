@interface VSApplicationControllerRequestFactory
+ (id)_attributeQuerySAMLRequestStringWithAttributeNames:(id)a3 channelID:(id)a4 authenticationToken:(id)a5 error:(id *)a6;
+ (id)_authNRequestSAMLStringWithAuthenticationToken:(id)a3 forced:(BOOL)a4 error:(id *)a5;
+ (id)_logoutSAMLRequestStringWithError:(id *)a3;
- (id)STBOptOutApplicationControllerRequest;
- (id)accountMetadataApplicationControllerRequestWithAccountMetadataRequest:(id)a3 authenticationToken:(id)a4;
- (id)authenticationApplicationControllerRequestWithAuthenticationToken:(id)a3 forcedAuthentication:(BOOL)a4;
- (id)logoutApplicationControllerRequestWithAuthenticationToken:(id)a3;
- (id)silentAuthenticationApplicationControllerRequest;
- (id)silentAuthenticationApplicationControllerRequestWithAuthenticationToken:(id)a3 forcedAuthentication:(BOOL)a4;
@end

@implementation VSApplicationControllerRequestFactory

- (id)silentAuthenticationApplicationControllerRequestWithAuthenticationToken:(id)a3 forcedAuthentication:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 isOpaque])
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_opt_class();
    v8 = [v5 body];
    v6 = [v7 _authNRequestSAMLStringWithAuthenticationToken:v8 forced:v4 error:0];
  }
  v9 = objc_alloc_init(VSApplicationControllerRequest);
  [(VSApplicationControllerRequest *)v9 setType:2];
  [(VSApplicationControllerRequest *)v9 setSAMLRequest:v6];
  v10 = [v5 body];
  [(VSApplicationControllerRequest *)v9 setAuthenticationToken:v10];

  return v9;
}

- (id)silentAuthenticationApplicationControllerRequest
{
  v2 = objc_alloc_init(VSApplicationControllerRequest);
  [(VSApplicationControllerRequest *)v2 setType:2];
  return v2;
}

- (id)authenticationApplicationControllerRequestWithAuthenticationToken:(id)a3 forcedAuthentication:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 isOpaque])
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_opt_class();
    v8 = [v5 body];
    v6 = [v7 _authNRequestSAMLStringWithAuthenticationToken:v8 forced:v4 error:0];
  }
  v9 = objc_alloc_init(VSApplicationControllerRequest);
  [(VSApplicationControllerRequest *)v9 setType:1];
  [(VSApplicationControllerRequest *)v9 setSAMLRequest:v6];
  v10 = [v5 body];
  [(VSApplicationControllerRequest *)v9 setAuthenticationToken:v10];

  return v9;
}

- (id)accountMetadataApplicationControllerRequestWithAccountMetadataRequest:(id)a3 authenticationToken:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 attributeNames];
  v8 = [v6 channelIdentifier];
  v9 = [v6 verificationToken];

  if ([v5 isOpaque])
  {
    v10 = 0;
  }
  else
  {
    v11 = objc_opt_class();
    v12 = [v5 body];
    v10 = [v11 _attributeQuerySAMLRequestStringWithAttributeNames:v7 channelID:v8 authenticationToken:v12 error:0];
  }
  v13 = objc_alloc_init(VSApplicationControllerRequest);
  [(VSApplicationControllerRequest *)v13 setType:3];
  [(VSApplicationControllerRequest *)v13 setSAMLRequest:v10];
  v14 = [v5 body];
  [(VSApplicationControllerRequest *)v13 setAuthenticationToken:v14];

  [(VSApplicationControllerRequest *)v13 setRequestorVerificationToken:v9];
  [(VSApplicationControllerRequest *)v13 setAttributeNames:v7];

  return v13;
}

- (id)logoutApplicationControllerRequestWithAuthenticationToken:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(id)objc_opt_class() _logoutSAMLRequestStringWithError:0];
  id v5 = objc_alloc_init(VSApplicationControllerRequest);
  [(VSApplicationControllerRequest *)v5 setType:4];
  [(VSApplicationControllerRequest *)v5 setSAMLRequest:v4];
  id v6 = [v3 body];

  [(VSApplicationControllerRequest *)v5 setAuthenticationToken:v6];
  return v5;
}

- (id)STBOptOutApplicationControllerRequest
{
  v2 = objc_alloc_init(VSApplicationControllerRequest);
  [(VSApplicationControllerRequest *)v2 setType:5];
  return v2;
}

+ (id)_authNRequestSAMLStringWithAuthenticationToken:(id)a3 forced:(BOOL)a4 error:(id *)a5
{
  id v6 = +[VSSAMLRequestFactory authNRequestWithResponse:forced:error:](VSSAMLRequestFactory, "authNRequestWithResponse:forced:error:", a3, a4);
  v7 = [v6 xmlString:a5];

  return v7;
}

+ (id)_attributeQuerySAMLRequestStringWithAttributeNames:(id)a3 channelID:(id)a4 authenticationToken:(id)a5 error:(id *)a6
{
  v7 = +[VSSAMLRequestFactory attributeQueryWithAttributeNames:channelID:authNResponse:error:](VSSAMLRequestFactory, "attributeQueryWithAttributeNames:channelID:authNResponse:error:", a3, a4, a5);
  v8 = [v7 xmlString:a6];

  return v8;
}

+ (id)_logoutSAMLRequestStringWithError:(id *)a3
{
  BOOL v4 = +[VSSAMLRequestFactory logoutRequestWithError:"logoutRequestWithError:"];
  id v5 = [v4 xmlString:a3];

  return v5;
}

@end