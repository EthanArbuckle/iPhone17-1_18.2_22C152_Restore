@interface PDSharingRelayServerGetMailboxResponse
- (PDSharingMailboxPayload)payload;
- (PDSharingRelayServerGetMailboxResponse)initWithData:(id)a3;
- (PKSharingMessageDisplayInformation)displayInfo;
- (void)setDisplayInfo:(id)a3;
- (void)setPayload:(id)a3;
@end

@implementation PDSharingRelayServerGetMailboxResponse

- (PDSharingRelayServerGetMailboxResponse)initWithData:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)PDSharingRelayServerGetMailboxResponse;
  v3 = [(PDSharingRelayServerGetMailboxResponse *)&v23 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PDSharingRelayServerGetMailboxResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [PDSharingMailboxPayload alloc];
      v7 = [v5 PKDictionaryForKey:@"payload"];
      v8 = [(PDSharingMailboxPayload *)v6 initWithDictionary:v7];
      payload = v4->_payload;
      v4->_payload = v8;

      v10 = [v5 PKDictionaryForKey:@"displayInformation"];
      v11 = v10;
      if (!v10)
      {
LABEL_13:

        return v4;
      }
      v12 = [(PDSharingRelayServerGetMailboxResponse *)v10 PKStringForKey:@"title"];
      v13 = [(PDSharingRelayServerGetMailboxResponse *)v11 PKStringForKey:@"description"];
      uint64_t v14 = [(PDSharingRelayServerGetMailboxResponse *)v11 PKURLForKey:@"imageURL"];
      v15 = (void *)v14;
      if (v12 && v13 && v14)
      {
        v16 = (PKSharingMessageDisplayInformation *)[objc_alloc((Class)PKSharingMessageDisplayInformation) initWithTitle:v12 subtitle:v13 imageURL:v14];
        displayInfo = v4->_displayInfo;
        v4->_displayInfo = v16;
      }
    }
    else
    {
      v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (objc_class *)objc_opt_class();
        v19 = NSStringFromClass(v18);
        v20 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v25 = v19;
        __int16 v26 = 2112;
        v27 = v20;
        id v21 = v20;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v11 = v4;
      v4 = 0;
    }

    goto LABEL_13;
  }
  return v4;
}

- (PDSharingMailboxPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (PKSharingMessageDisplayInformation)displayInfo
{
  return self->_displayInfo;
}

- (void)setDisplayInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayInfo, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end