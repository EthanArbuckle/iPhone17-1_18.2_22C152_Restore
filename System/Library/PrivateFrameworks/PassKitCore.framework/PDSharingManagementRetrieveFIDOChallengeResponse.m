@interface PDSharingManagementRetrieveFIDOChallengeResponse
- (NSString)fidoChallenge;
- (NSString)keyHash;
- (PDSharingManagementRetrieveFIDOChallengeResponse)initWithData:(id)a3;
@end

@implementation PDSharingManagementRetrieveFIDOChallengeResponse

- (PDSharingManagementRetrieveFIDOChallengeResponse)initWithData:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PDSharingManagementRetrieveFIDOChallengeResponse;
  v3 = [(PDSharingManagementRetrieveFIDOChallengeResponse *)&v16 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PDSharingManagementRetrieveFIDOChallengeResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 PKStringForKey:@"fidoChallenge"];
      fidoChallenge = v4->_fidoChallenge;
      v4->_fidoChallenge = (NSString *)v6;

      uint64_t v8 = [v5 PKStringForKey:@"keyHash"];
      keyHash = v4->_keyHash;
      v4->_keyHash = (NSString *)v8;

      if (v4->_fidoChallenge)
      {
LABEL_9:

        return v4;
      }
    }
    else
    {
      v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        v13 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v18 = v12;
        __int16 v19 = 2112;
        v20 = v13;
        id v14 = v13;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
    }

    v4 = 0;
    goto LABEL_9;
  }
  return v4;
}

- (NSString)fidoChallenge
{
  return self->_fidoChallenge;
}

- (NSString)keyHash
{
  return self->_keyHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyHash, 0);
  objc_storeStrong((id *)&self->_fidoChallenge, 0);
}

@end