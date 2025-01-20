@interface PDSharingManagementUpdateShareRequest
- (NSString)shareIdentifier;
- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setShareIdentifier:(id)a3;
@end

@implementation PDSharingManagementUpdateShareRequest

- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  CFStringRef v14 = @"sharing";
  CFStringRef v15 = @"share";
  shareIdentifier = self->_shareIdentifier;
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSArray arrayWithObjects:&v14 count:3];
  v9 = -[PDSharingManagementUpdateShareRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v7, v8, 0, v6, v14, v15, shareIdentifier);

  [v9 setHTTPMethod:@"PUT"];
  v10 = [(PDSharingManagementCreateShareRequest *)self requestBody];
  v11 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v10];
  [v9 setHTTPBody:v11];

  id v12 = [v9 copy];
  return v12;
}

- (NSString)shareIdentifier
{
  return self->_shareIdentifier;
}

- (void)setShareIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end