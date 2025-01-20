@interface PDNotificationServicePostBalanceTask
+ (BOOL)supportsSecureCoding;
+ (id)postBalanceTaskWithNotificationService:(id)a3 dpanIdentifier:(id)a4 accountIdentifier:(id)a5 transactionSequenceNumber:(id)a6 autoTopUpDisabled:(BOOL)a7 balance:(id)a8;
- (BOOL)autoTopUpDisabled;
- (BOOL)backoffComplete;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)isValid;
- (BOOL)matchesTask:(id)a3;
- (NSString)accountIdentifier;
- (NSString)dpanIdentifier;
- (NSString)transactionSequenceNumber;
- (PDNotificationServicePostBalanceTask)initWithCoder:(id)a3;
- (PDNotificationServicePostBalanceTask)initWithNotificationService:(id)a3 dpanIdentifier:(id)a4 accountIdentifier:(id)a5 transactionSequenceNumber:(id)a6 autoTopUpDisabled:(BOOL)a7 balance:(id)a8;
- (PKPaymentBalance)balance;
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
@end

@implementation PDNotificationServicePostBalanceTask

+ (id)postBalanceTaskWithNotificationService:(id)a3 dpanIdentifier:(id)a4 accountIdentifier:(id)a5 transactionSequenceNumber:(id)a6 autoTopUpDisabled:(BOOL)a7 balance:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [objc_alloc((Class)a1) initWithNotificationService:v18 dpanIdentifier:v17 accountIdentifier:v16 transactionSequenceNumber:v15 autoTopUpDisabled:v8 balance:v14];

  return v19;
}

- (PDNotificationServicePostBalanceTask)initWithNotificationService:(id)a3 dpanIdentifier:(id)a4 accountIdentifier:(id)a5 transactionSequenceNumber:(id)a6 autoTopUpDisabled:(BOOL)a7 balance:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)PDNotificationServicePostBalanceTask;
  id v18 = [(PDNotificationServiceConnectionTask *)&v22 initWithNotificationService:a3];
  id v19 = v18;
  if (v18)
  {
    [(PDNetworkTask *)v18 setCanRequestReauthentication:1];
    objc_storeStrong((id *)&v19->_dpanIdentifier, a4);
    objc_storeStrong((id *)&v19->_accountIdentifier, a5);
    objc_storeStrong((id *)&v19->_transactionSequenceNumber, a6);
    v19->_autoTopUpDisabled = a7;
    objc_storeStrong((id *)&v19->_balance, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDNotificationServicePostBalanceTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PDNotificationServicePostBalanceTask;
  v5 = [(PDNotificationServiceConnectionTask *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dpanIdentifier"];
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionSequenceNumber"];
    transactionSequenceNumber = v5->_transactionSequenceNumber;
    v5->_transactionSequenceNumber = (NSString *)v10;

    v5->_autoTopUpDisabled = [v4 decodeBoolForKey:@"autoTopUpDisabled"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"balance"];
    balance = v5->_balance;
    v5->_balance = (PKPaymentBalance *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDNotificationServicePostBalanceTask;
  id v4 = a3;
  [(PDNotificationServiceConnectionTask *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountIdentifier, @"dpanIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v4 encodeObject:self->_transactionSequenceNumber forKey:@"transactionSequenceNumber"];
  [v4 encodeBool:self->_autoTopUpDisabled forKey:@"autoTopUpDisabled"];
  [v4 encodeObject:self->_balance forKey:@"balance"];
}

- (BOOL)isValid
{
  v3 = [(PDNotificationServiceConnectionTask *)self notificationService];
  id v4 = [v3 deviceIdentifier];

  objc_super v5 = [(PDNotificationServicePostBalanceTask *)self dpanIdentifier];
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6;

  return v7;
}

- (int64_t)taskType
{
  return 4;
}

- (id)headerFields
{
  v12.receiver = self;
  v12.super_class = (Class)PDNotificationServicePostBalanceTask;
  v3 = [(PDNotificationServiceConnectionTask *)&v12 headerFields];
  id v4 = +[NSMutableDictionary dictionaryWithDictionary:v3];

  uint64_t v5 = +[NSLocale pk_deviceLanguage];
  BOOL v6 = (void *)v5;
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
    v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No account identifier present", v11, 2u);
    }
  }
  return v4;
}

- (id)endpointComponents
{
  v3 = [(PDNotificationServiceConnectionTask *)self notificationService];
  id v4 = [v3 deviceIdentifier];

  uint64_t v5 = [(PDNotificationServicePostBalanceTask *)self dpanIdentifier];
  BOOL v6 = (void *)v5;
  CFStringRef v7 = 0;
  if (v4 && v5)
  {
    v9[0] = @"devices";
    v9[1] = v4;
    v9[2] = @"dpan";
    v9[3] = v5;
    v9[4] = @"balancesync";
    CFStringRef v7 = +[NSArray arrayWithObjects:v9 count:5];
  }

  return v7;
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
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = [(PKPaymentBalance *)self->_balance identifiers];
  CFStringRef v6 = [v5 anyObject];
  [v4 safelySetObject:v6 forKey:@"identifier"];

  CFStringRef v7 = [(PKPaymentBalance *)self->_balance currencyCode];
  [v4 safelySetObject:v7 forKey:@"currencyCode"];

  uint64_t v8 = +[NSNumber numberWithInteger:[(PKPaymentBalance *)self->_balance exponent]];
  [v4 setObject:v8 forKey:@"exponent"];

  if ([(PKPaymentBalance *)self->_balance isPrimary]) {
    CFStringRef v9 = @"true";
  }
  else {
    CFStringRef v9 = @"false";
  }
  [v4 setObject:v9 forKey:@"isPrimaryBalance"];
  uint64_t v10 = [(PKPaymentBalance *)self->_balance value];
  [v4 setObject:v10 forKey:@"value"];

  v11 = [(PKPaymentBalance *)self->_balance lastUpdateDate];
  if (!v11)
  {
    balance = self->_balance;
    v13 = +[NSDate date];
    [(PKPaymentBalance *)balance setLastUpdateDate:v13];

    v11 = [(PKPaymentBalance *)self->_balance lastUpdateDate];
  }
  id v14 = objc_alloc_init((Class)NSDateFormatter);
  [v14 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
  objc_super v15 = +[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v14 setLocale:v15];

  id v16 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
  [v14 setCalendar:v16];

  id v17 = [v14 stringFromDate:v11];
  [v4 setObject:v17 forKey:@"lastUpdatedDate"];
  id v18 = [v4 copy];
  [v3 setObject:v18 forKey:@"balanceDetails"];

  id v19 = +[NSNumber numberWithBool:self->_autoTopUpDisabled];
  [v3 setObject:v19 forKey:@"autoTopUpDisabled"];

  [v3 safelySetObject:self->_transactionSequenceNumber forKey:@"transactionSequenceNumber"];
  id v20 = [v3 copy];

  return v20;
}

- (id)method
{
  return @"POST";
}

- (BOOL)backoffComplete
{
  return self->_autoTopUpDisabled;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v5 = [a3 statusCode];
  CFStringRef v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    uint64_t v8 = self;
    __int16 v9 = 2048;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ got response with code %ld", (uint8_t *)&v7, 0x16u);
  }

  if (v5 == (id)401)
  {
    PKAnalyticsSendEvent();
    [(PDNotificationServicePostBalanceTask *)self reportAuthenticationFailure];
    [(PDNetworkTask *)self failForAuthentication];
  }
  else if (v5 == (id)304 || v5 == (id)200)
  {
    PKAnalyticsSendEvent();
    [(PDNetworkTask *)self succeed];
  }
  else
  {
    PKAnalyticsSendEvent();
    [(PDNotificationServicePostBalanceTask *)self reportUnexpectedResponseCode:v5];
    [(PDNetworkTask *)self fail];
  }
}

- (void)handleError:(id)a3
{
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    int v7 = self;
    __int16 v8 = 2112;
    id v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Connection Error for Task: %@ (%@)", (uint8_t *)&v6, 0x16u);
  }

  [(PDNetworkTask *)self fail];
}

- (id)description
{
  objc_super v15 = [(PDNotificationServiceConnectionTask *)self notificationService];
  if ([v15 serviceType]) {
    CFStringRef v3 = @"Messages";
  }
  else {
    CFStringRef v3 = @"Transactions";
  }
  id v4 = [(PDNotificationServiceConnectionTask *)self notificationService];
  id v5 = [v4 deviceIdentifier];
  int v6 = [(PDNotificationServicePostBalanceTask *)self dpanIdentifier];
  int v7 = [(PDNotificationServiceConnectionTask *)self notificationService];
  __int16 v8 = [v7 serviceURL];
  id v9 = [(PDNotificationServiceConnectionTask *)self notificationService];
  id v10 = [v9 registrationURL];
  v11 = [(PDNotificationServicePostBalanceTask *)self transactionSequenceNumber];
  objc_super v12 = [(PDNotificationServicePostBalanceTask *)self balance];
  v13 = +[NSString stringWithFormat:@"Post Balance %@ Notifications Task (Device ID: %@, DPAN ID: %@, Service URL: %@, Registration URL: %@, transactionSequenceNumber: %@, balance: %@)", v3, v5, v6, v8, v10, v11, v12];

  return v13;
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  uint64_t v4 = objc_opt_class();
  return [(objc_class *)a3 isSubclassOfClass:v4];
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
        if ([(PDNotificationServicePostBalanceTask *)self matchesTask:v4])
        {
          int64_t v5 = 1;
        }
        else
        {
          int v7 = [v4 balance];
          __int16 v8 = [v7 lastUpdateDate];
          id v9 = [(PDNotificationServicePostBalanceTask *)self balance];
          id v10 = [v9 lastUpdateDate];
          id v11 = [v8 compare:v10];

          if (v11 == (id)-1) {
            int64_t v5 = 1;
          }
          else {
            int64_t v5 = 5;
          }
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

- (BOOL)matchesTask:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PDNotificationServicePostBalanceTask;
  if ([(PDNotificationServiceConnectionTask *)&v15 matchesTask:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v5 = [v4 dpanIdentifier];
    int v6 = [v4 accountIdentifier];
    int v7 = [v4 transactionSequenceNumber];
    __int16 v8 = [v4 balance];
    id v9 = [(PDNotificationServicePostBalanceTask *)self dpanIdentifier];
    if (PKEqualObjects())
    {
      id v10 = [(PDNotificationServicePostBalanceTask *)self accountIdentifier];
      if (PKEqualObjects())
      {
        id v11 = [(PDNotificationServicePostBalanceTask *)self transactionSequenceNumber];
        if ([v11 isEqualToString:v7])
        {
          objc_super v12 = [(PDNotificationServicePostBalanceTask *)self balance];
          char v13 = PKEqualObjects();
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
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

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (NSString)transactionSequenceNumber
{
  return self->_transactionSequenceNumber;
}

- (BOOL)autoTopUpDisabled
{
  return self->_autoTopUpDisabled;
}

- (PKPaymentBalance)balance
{
  return self->_balance;
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
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_transactionSequenceNumber, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
}

@end