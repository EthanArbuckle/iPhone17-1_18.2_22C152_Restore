@interface PDSharingRelayServerCreateMailboxResponse
- (BOOL)supportsPushNotifications;
- (NSString)mailboxURL;
- (PDSharingRelayServerCreateMailboxResponse)initWithData:(id)a3;
- (void)setMailboxURL:(id)a3;
- (void)setSupportsPushNotifications:(BOOL)a3;
@end

@implementation PDSharingRelayServerCreateMailboxResponse

- (PDSharingRelayServerCreateMailboxResponse)initWithData:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)PDSharingRelayServerCreateMailboxResponse;
  v3 = [(PDSharingRelayServerCreateMailboxResponse *)&v17 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PDSharingRelayServerCreateMailboxResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 PKStringForKey:@"urlLink"];
      v7 = v6;
      if (!v6)
      {
        v7 = [v5 PKStringForKey:@"mailboxIdentifier"];
      }
      objc_storeStrong((id *)&v4->_mailboxURL, v7);
      if (!v6) {

      }
      if (!v4->_mailboxURL)
      {
        v8 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v19 = v9;
          id v10 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Malformed response: missing mailbox url link inside %@", buf, 0xCu);
        }
        v4 = 0;
      }
      v4->_supportsPushNotifications = [v5 PKBoolForKey:@"isPushNotificationSupported"];
    }
    else
    {
      v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        v14 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v19 = v13;
        __int16 v20 = 2112;
        v21 = v14;
        id v15 = v14;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v4 = 0;
    }
  }
  return v4;
}

- (BOOL)supportsPushNotifications
{
  return self->_supportsPushNotifications;
}

- (void)setSupportsPushNotifications:(BOOL)a3
{
  self->_supportsPushNotifications = a3;
}

- (NSString)mailboxURL
{
  return self->_mailboxURL;
}

- (void)setMailboxURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end