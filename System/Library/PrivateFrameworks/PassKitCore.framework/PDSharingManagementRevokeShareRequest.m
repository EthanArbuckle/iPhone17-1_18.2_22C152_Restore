@interface PDSharingManagementRevokeShareRequest
- (BOOL)shouldCascade;
- (NSString)dpanIdentifier;
- (NSString)shareIdentifier;
- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setDpanIdentifier:(id)a3;
- (void)setShareIdentifier:(id)a3;
- (void)setShouldCascade:(BOOL)a3;
@end

@implementation PDSharingManagementRevokeShareRequest

- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  CFStringRef v15 = @"sharing";
  CFStringRef v16 = @"share";
  shareIdentifier = self->_shareIdentifier;
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSArray arrayWithObjects:&v15 count:3];
  v9 = -[PDSharingManagementRevokeShareRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v7, v8, 0, v6, v15, v16, shareIdentifier);

  [v9 setHTTPMethod:@"DELETE"];
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  [v10 setObject:self->_dpanIdentifier forKeyedSubscript:@"dpanIdentifier"];
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

- (NSString)shareIdentifier
{
  return self->_shareIdentifier;
}

- (void)setShareIdentifier:(id)a3
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
  objc_storeStrong((id *)&self->_shareIdentifier, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
}

@end