@interface PDSharingManagementCreateShareResponse
- (NSDictionary)shareVouchers;
- (NSString)shareIdentifier;
- (NSURL)displayInformationOpenGraphUrl;
- (PDSharingManagementCreateShareResponse)initWithData:(id)a3;
- (void)setDisplayInformationOpenGraphUrl:(id)a3;
@end

@implementation PDSharingManagementCreateShareResponse

- (PDSharingManagementCreateShareResponse)initWithData:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PDSharingManagementCreateShareResponse;
  v3 = [(PDSharingManagementCreateShareResponse *)&v18 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PDSharingManagementCreateShareResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 PKDictionaryForKey:@"provisioningData"];
      shareVouchers = v4->_shareVouchers;
      v4->_shareVouchers = (NSDictionary *)v6;

      uint64_t v8 = [v5 PKStringForKey:@"shareIdentifier"];
      shareIdentifier = v4->_shareIdentifier;
      v4->_shareIdentifier = (NSString *)v8;

      uint64_t v10 = [v5 PKURLForKey:@"displayInformationUrl"];
      displayInformationOpenGraphUrl = v4->_displayInformationOpenGraphUrl;
      v4->_displayInformationOpenGraphUrl = (NSURL *)v10;

      if (v4->_shareVouchers)
      {
LABEL_9:

        return v4;
      }
    }
    else
    {
      v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        v15 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v20 = v14;
        __int16 v21 = 2112;
        v22 = v15;
        id v16 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
    }

    v4 = 0;
    goto LABEL_9;
  }
  return v4;
}

- (NSDictionary)shareVouchers
{
  return self->_shareVouchers;
}

- (NSString)shareIdentifier
{
  return self->_shareIdentifier;
}

- (NSURL)displayInformationOpenGraphUrl
{
  return self->_displayInformationOpenGraphUrl;
}

- (void)setDisplayInformationOpenGraphUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayInformationOpenGraphUrl, 0);
  objc_storeStrong((id *)&self->_shareIdentifier, 0);
  objc_storeStrong((id *)&self->_shareVouchers, 0);
}

@end