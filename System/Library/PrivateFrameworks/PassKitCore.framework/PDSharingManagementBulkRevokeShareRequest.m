@interface PDSharingManagementBulkRevokeShareRequest
- (BOOL)shouldCascade;
- (NSArray)shareIdentifiers;
- (NSString)dpanIdentifier;
- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setDpanIdentifier:(id)a3;
- (void)setShareIdentifiers:(id)a3;
- (void)setShouldCascade:(BOOL)a3;
@end

@implementation PDSharingManagementBulkRevokeShareRequest

- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  v15[0] = @"sharing";
  v15[1] = @"manage";
  v15[2] = @"revoke";
  v15[3] = @"bulk";
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSArray arrayWithObjects:v15 count:4];
  v9 = [(PDSharingManagementBulkRevokeShareRequest *)self _murlRequestWithServiceURL:v7 endpointComponents:v8 queryParameters:0 appleAccountInformation:v6];

  [v9 setHTTPMethod:@"POST"];
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  [v10 setObject:self->_dpanIdentifier forKeyedSubscript:@"dpanIdentifier"];
  [v10 setObject:self->_shareIdentifiers forKeyedSubscript:@"shareIdentifiers"];
  v11 = +[NSNumber numberWithBool:self->_shouldCascade];
  [v10 setObject:v11 forKeyedSubscript:@"shouldCascade"];

  v12 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v10];
  [v9 setHTTPBody:v12];

  id v13 = [v9 copy];
  return v13;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDpanIdentifier:(id)a3
{
}

- (NSArray)shareIdentifiers
{
  return self->_shareIdentifiers;
}

- (void)setShareIdentifiers:(id)a3
{
}

- (BOOL)shouldCascade
{
  return self->_shouldCascade;
}

- (void)setShouldCascade:(BOOL)a3
{
  self->_shouldCascade = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareIdentifiers, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
}

@end