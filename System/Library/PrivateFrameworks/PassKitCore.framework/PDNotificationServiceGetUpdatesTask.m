@interface PDNotificationServiceGetUpdatesTask
+ (BOOL)supportsSecureCoding;
+ (id)getUpdatesTaskWithNotificationService:(id)a3 accountIdentifier:(id)a4;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)isInitialUpdatesTask;
- (BOOL)isValid;
- (NSString)accountIdentifier;
- (PDNotificationServiceGetUpdatesTask)initWithCoder:(id)a3;
- (PDNotificationServiceGetUpdatesTask)initWithNotificationService:(id)a3 accountIdentifier:(id)a4;
- (id)_resultFromResponseData:(id)a3;
- (id)bodyDictionary;
- (id)description;
- (id)endpointComponents;
- (id)headerFields;
- (id)method;
- (id)queryFields;
- (int64_t)actionForInactiveTask:(id)a3;
- (int64_t)taskType;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
- (void)reportAuthenticationFailure;
- (void)reportUnexpectedResponseCode:(int64_t)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setInitialUpdatesTask:(BOOL)a3;
@end

@implementation PDNotificationServiceGetUpdatesTask

+ (id)getUpdatesTaskWithNotificationService:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithNotificationService:v7 accountIdentifier:v6];

  return v8;
}

- (PDNotificationServiceGetUpdatesTask)initWithNotificationService:(id)a3 accountIdentifier:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PDNotificationServiceGetUpdatesTask;
  id v8 = [(PDNotificationServiceConnectionTask *)&v11 initWithNotificationService:a3];
  v9 = v8;
  if (v8)
  {
    [(PDNetworkTask *)v8 setCanRequestReauthentication:1];
    objc_storeStrong((id *)&v9->_accountIdentifier, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDNotificationServiceGetUpdatesTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDNotificationServiceGetUpdatesTask;
  v5 = [(PDNotificationServiceConnectionTask *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_initialUpdatesTask = [v4 decodeBoolForKey:@"initialUpdatesTask"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDNotificationServiceGetUpdatesTask;
  id v4 = a3;
  [(PDNotificationServiceConnectionTask *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_initialUpdatesTask, @"initialUpdatesTask", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
}

- (BOOL)isValid
{
  v2 = [(PDNotificationServiceConnectionTask *)self notificationService];
  v3 = [v2 deviceIdentifier];

  return v3 != 0;
}

- (int64_t)taskType
{
  return 2;
}

- (id)headerFields
{
  v12.receiver = self;
  v12.super_class = (Class)PDNotificationServiceGetUpdatesTask;
  v3 = [(PDNotificationServiceConnectionTask *)&v12 headerFields];
  id v4 = +[NSMutableDictionary dictionaryWithDictionary:v3];

  uint64_t v5 = +[NSLocale pk_deviceLanguage];
  uint64_t v6 = (void *)v5;
  if (v5) {
    CFStringRef v7 = (const __CFString *)v5;
  }
  else {
    CFStringRef v7 = @"en";
  }
  [v4 setObject:v7 forKey:@"Accept-Language"];
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier)
  {
    [v4 setObject:accountIdentifier forKeyedSubscript:@"x-account-identifier"];
  }
  else
  {
    objc_super v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No account identifier present", v11, 2u);
    }
  }
  return v4;
}

- (id)endpointComponents
{
  v3 = [(PDNotificationServiceConnectionTask *)self notificationService];
  id v4 = [v3 deviceIdentifier];

  if (v4)
  {
    uint64_t v5 = [(PDNotificationServiceConnectionTask *)self notificationService];
    id v6 = [v5 serviceType];

    CFStringRef v7 = @"messages";
    if (v6 != (id)1) {
      CFStringRef v7 = 0;
    }
    if (!v6) {
      CFStringRef v7 = @"transactions";
    }
    v10[0] = @"devices";
    v10[1] = v4;
    v10[2] = v7;
    id v8 = +[NSArray arrayWithObjects:v10 count:3];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)queryFields
{
  v2 = [(PDNotificationServiceConnectionTask *)self notificationService];
  v3 = [v2 lastUpdatedTag];

  if (v3)
  {
    CFStringRef v6 = @"tag";
    CFStringRef v7 = v3;
    id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)bodyDictionary
{
  return 0;
}

- (id)method
{
  return @"GET";
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = [a3 statusCode];
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    objc_super v11 = self;
    __int16 v12 = 2048;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ got response with code %ld", (uint8_t *)&v10, 0x16u);
  }

  if (v7 == (id)401)
  {
    PKAnalyticsSendEvent();
    [(PDNotificationServiceGetUpdatesTask *)self reportAuthenticationFailure];
    [(PDNetworkTask *)self failForAuthentication];
  }
  else if (v7 == (id)304 || v7 == (id)200)
  {
    PKAnalyticsSendEvent();
    objc_super v9 = [(PDNotificationServiceGetUpdatesTask *)self _resultFromResponseData:v6];
    [(PDNetworkTask *)self deliverResult:v9];

    [(PDNetworkTask *)self succeed];
  }
  else
  {
    PKAnalyticsSendEvent();
    [(PDNotificationServiceGetUpdatesTask *)self reportUnexpectedResponseCode:v7];
    [(PDNetworkTask *)self fail];
  }
}

- (void)handleError:(id)a3
{
  uint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Connection Error for Task: %@ (%@)", (uint8_t *)&v6, 0x16u);
  }

  [(PDNetworkTask *)self fail];
}

- (id)description
{
  v3 = [(PDNotificationServiceConnectionTask *)self notificationService];
  if ([v3 serviceType]) {
    CFStringRef v4 = @"Messages";
  }
  else {
    CFStringRef v4 = @"Transactions";
  }
  uint64_t v5 = [(PDNotificationServiceConnectionTask *)self notificationService];
  int v6 = [v5 deviceIdentifier];
  id v7 = [(PDNotificationServiceConnectionTask *)self notificationService];
  __int16 v8 = [v7 serviceURL];
  id v9 = [(PDNotificationServiceConnectionTask *)self notificationService];
  int v10 = [v9 registrationURL];
  objc_super v11 = +[NSString stringWithFormat:@"Get %@ Notifications Task (Device ID: %@, Service URL: %@, Registration URL: %@)", v4, v6, v8, v10];

  return v11;
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  unsigned int v4 = [(objc_class *)a3 isSubclassOfClass:objc_opt_class()];
  if (v4) {
    LOBYTE(v4) = [(objc_class *)a3 isSubclassOfClass:objc_opt_class()] ^ 1;
  }
  return v4;
}

- (int64_t)actionForInactiveTask:(id)a3
{
  id v4 = a3;
  if (sub_100302700(self, v4))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v4 requestedStatus] == (id)2) {
        int64_t v5 = 7;
      }
      else {
        int64_t v5 = 5;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = objc_opt_class();
        if (v6 == objc_opt_class()) {
          int64_t v5 = 1;
        }
        else {
          int64_t v5 = 5;
        }
      }
      else
      {
        int64_t v5 = 5;
      }
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)_resultFromResponseData:(id)a3
{
  if (!a3)
  {
    v20 = 0;
    goto LABEL_31;
  }
  id v29 = 0;
  id v4 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:&v29];
  id v5 = v29;
  uint64_t v6 = v5;
  if (!v4)
  {
    v20 = 0;
    if (!v5) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if (PKLogNotificationServiceResponses())
  {
    id v7 = +[NSJSONSerialization dataWithJSONObject:v4 options:1 error:0];
    id v8 = [objc_alloc((Class)NSString) initWithData:v7 encoding:4];
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v31 = self;
      __int16 v32 = 2112;
      id v33 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ Response: %@", buf, 0x16u);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v25 = objc_opt_class();
    PDBasicError();
    v20 = 0;
    uint64_t v6 = v10 = v6;
    goto LABEL_28;
  }
  id v10 = v4;
  objc_super v11 = [(PDNotificationServiceConnectionTask *)self notificationService];
  id v12 = [v11 serviceType];

  id v13 = &__NSArray0__struct;
  if (v12 == (id)1)
  {
    objc_opt_class();
    PDTypecheckArrayOfObjectsForKey();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    v27 = &__NSArray0__struct;
    v28 = &__NSArray0__struct;
    v14 = v6;
    v18 = &__NSArray0__struct;
    goto LABEL_23;
  }
  if (!v12)
  {
    objc_opt_class();
    v14 = PDTypecheckArrayOfObjectsForKey();
    v28 = &__NSArray0__struct;
    uint64_t v15 = PDTypecheckArrayOfObjectsForKey();
    v26 = &__NSArray0__struct;
    uint64_t v16 = PDTypecheckArrayOfObjectsForKey();
    v27 = &__NSArray0__struct;
    id v17 = (id)PDTypecheckArrayOfObjectsForKey();
    v18 = &__NSArray0__struct;
    if (v14 && v15 | v16) {
      id v19 = v14;
    }
    else {
      id v19 = 0;
    }
    id v13 = v26;

LABEL_23:
    uint64_t v6 = v19;
    if (v19) {
      goto LABEL_24;
    }
    goto LABEL_19;
  }
  v27 = &__NSArray0__struct;
  v28 = &__NSArray0__struct;
  v18 = &__NSArray0__struct;
  if (v6)
  {
LABEL_24:
    id v22 = 0;
    id v21 = 0;
    goto LABEL_25;
  }
LABEL_19:
  objc_opt_class();
  uint64_t v6 = PDTypecheckObjectForKey();
  id v21 = 0;
  if (v6)
  {
    id v22 = 0;
LABEL_25:
    id v23 = 0;
    goto LABEL_26;
  }
  objc_opt_class();
  uint64_t v6 = PDTypecheckObjectForKey();
  id v23 = 0;
  if (v6)
  {
    id v22 = 0;
  }
  else
  {
    objc_opt_class();
    uint64_t v6 = PDTypecheckObjectForKey();
    id v22 = 0;
    if (!v6)
    {
      v20 = objc_alloc_init(PDNotificationServiceGetUpdatesResult);
      [(PDNotificationServiceGetUpdatesResult *)v20 setNotifications:v28];
      [(PDNotificationServiceGetUpdatesResult *)v20 setBalances:v13];
      [(PDNotificationServiceGetUpdatesResult *)v20 setPlans:v27];
      [(PDNotificationServiceGetUpdatesResult *)v20 setTileConfigurations:v18];
      [(PDNotificationServiceGetUpdatesResult *)v20 setLastUpdatedTag:v21];
      [(PDNotificationServiceGetUpdatesResult *)v20 setAuthenticationToken:v23];
      [(PDNotificationServiceGetUpdatesResult *)v20 setAppLaunchToken:v22];
      goto LABEL_27;
    }
  }
LABEL_26:
  v20 = 0;
LABEL_27:

LABEL_28:
  if (v6) {
LABEL_29:
  }
    -[PDNetworkTask reportError:](self, "reportError:", v6, v25);
LABEL_30:

LABEL_31:
  return v20;
}

- (void)reportAuthenticationFailure
{
  PDTaskError(0, self, 0, @"Authentication failure", v2, v3, v4, v5, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(PDNetworkTask *)self reportError:v8];
}

- (void)reportUnexpectedResponseCode:(int64_t)a3
{
  PDTaskError(1, self, 0, @"Unexpected response code %ld", v3, v4, v5, v6, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(PDNetworkTask *)self reportError:v8];
}

- (BOOL)isInitialUpdatesTask
{
  return self->_initialUpdatesTask;
}

- (void)setInitialUpdatesTask:(BOOL)a3
{
  self->_initialUpdatesTask = a3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end