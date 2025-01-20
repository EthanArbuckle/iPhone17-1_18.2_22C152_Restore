@interface TPSCallForwardingController
- (BOOL)isConditionalServiceAvailable;
- (BOOL)isConditionalServiceLoading;
- (BOOL)isLoading;
- (BOOL)isUnconditionalServiceLoading;
- (BOOL)isUnloading;
- (CTCallForwardingValue)conditionalServiceBusyValue;
- (CTCallForwardingValue)conditionalServiceUnansweredValue;
- (CTCallForwardingValue)conditionalServiceUnreachableValue;
- (CTCallForwardingValue)unconditionalServiceValue;
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (NSArray)conditionalServiceRequests;
- (NSArray)unconditionalServiceRequests;
- (NSDictionary)carrierBundleLocalizedStringKeys;
- (NSString)conditionalServiceBusyPhoneNumber;
- (NSString)conditionalServiceUnansweredPhoneNumber;
- (NSString)conditionalServiceUnreachablePhoneNumber;
- (NSString)localizedConditionalBusyTitle;
- (NSString)localizedConditionalUnansweredTitle;
- (NSString)localizedConditionalUnreachableTitle;
- (NSString)subscriptionISOCountryCode;
- (NSString)unconditionalServicePhoneNumber;
- (TPSCallForwardingController)init;
- (TPSCallForwardingController)initWithSubscriptionContext:(id)a3;
- (TPSCallForwardingControllerDelegate)delegate;
- (TPSCallForwardingRequestController)requestController;
- (TPSCarrierBundleController)carrierBundleController;
- (id)localizedCarrierBundleStringForKey:(id)a3;
- (int64_t)conditionalServiceState;
- (int64_t)currentServiceType;
- (int64_t)pendingServiceType;
- (int64_t)unconditionalServiceState;
- (void)enableConditionalServiceIfNeeded;
- (void)enableUnconditionalServiceIfNeeded;
- (void)requestController:(id)a3 didReceiveResponse:(id)a4;
- (void)resetPendingServiceType;
- (void)sendConditionalServicesRequest;
- (void)sendEnableSetRequestForValue:(id)a3;
- (void)sendServicesRequest;
- (void)sendSetAllServicesDisabledRequest;
- (void)sendSetRequestForValue:(id)a3;
- (void)sendSetUnconditionalServiceDisabledRequest;
- (void)sendUnconditionalServicesRequest;
- (void)setConditionalServiceBusyPhoneNumber:(id)a3;
- (void)setConditionalServiceBusyValue:(id)a3;
- (void)setConditionalServiceUnansweredPhoneNumber:(id)a3;
- (void)setConditionalServiceUnansweredValue:(id)a3;
- (void)setConditionalServiceUnreachablePhoneNumber:(id)a3;
- (void)setConditionalServiceUnreachableValue:(id)a3;
- (void)setCurrentServiceType:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setPendingServiceType:(int64_t)a3;
- (void)setUnconditionalServicePhoneNumber:(id)a3;
- (void)setUnconditionalServiceValue:(id)a3;
- (void)setUnloading:(BOOL)a3;
- (void)updateServiceType:(int64_t)a3;
@end

@implementation TPSCallForwardingController

- (TPSCallForwardingController)init
{
  return 0;
}

- (TPSCallForwardingController)initWithSubscriptionContext:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TPSCallForwardingController;
  v6 = [(TPSCallForwardingController *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);
    v8 = objc_alloc_init(TPSCarrierBundleController);
    carrierBundleController = v7->_carrierBundleController;
    v7->_carrierBundleController = v8;

    v10 = (void *)MEMORY[0x1E4F14428];
    [(TPSController *)v7->_carrierBundleController addDelegate:v7 queue:MEMORY[0x1E4F14428]];
    v11 = objc_alloc_init(TPSCallForwardingRequestController);
    requestController = v7->_requestController;
    v7->_requestController = v11;

    [(TPSRequestController *)v7->_requestController addDelegate:v7 queue:v10];
    [(TPSCallForwardingController *)v7 sendServicesRequest];
  }

  return v7;
}

- (BOOL)isLoading
{
  if ([(TPSCallForwardingController *)self isConditionalServiceLoading]) {
    return 1;
  }
  return [(TPSCallForwardingController *)self isUnconditionalServiceLoading];
}

- (NSString)subscriptionISOCountryCode
{
  subscriptionISOCountryCode = self->_subscriptionISOCountryCode;
  if (!subscriptionISOCountryCode)
  {
    v4 = [(TPSCallForwardingController *)self subscriptionContext];
    objc_msgSend(v4, "tps_isoCountryCode");
    id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_subscriptionISOCountryCode;
    self->_subscriptionISOCountryCode = v5;

    subscriptionISOCountryCode = self->_subscriptionISOCountryCode;
  }
  return subscriptionISOCountryCode;
}

- (void)setCurrentServiceType:(int64_t)a3
{
  if (self->_currentServiceType != a3)
  {
    self->_currentServiceType = a3;
    if (a3 == 1) {
      [(TPSCallForwardingController *)self setUnloading:0];
    }
    id v5 = [(TPSCallForwardingController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(TPSCallForwardingController *)self delegate];
      [v7 callForwardingController:self didChangeServiceType:a3];
    }
  }
}

- (void)resetPendingServiceType
{
}

- (void)updateServiceType:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(TPSCallForwardingController *)self currentServiceType];
  if (v5 == a3) {
    return;
  }
  int64_t v6 = v5;
  id v7 = TPSLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(NSString, "tps_stringWithTPSCallForwardingServiceType:", v6);
    v9 = objc_msgSend(NSString, "tps_stringWithTPSCallForwardingServiceType:", a3);
    int v10 = 138412546;
    v11 = v8;
    __int16 v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1E4DD4000, v7, OS_LOG_TYPE_DEFAULT, "Transitioning call forwarding service from %@ to %@.", (uint8_t *)&v10, 0x16u);
  }
  if (v6 == 2)
  {
    if ((a3 | 2) == 3)
    {
      if ([(TPSCallForwardingController *)self unconditionalServiceState] == 3)
      {
        [(TPSCallForwardingController *)self setPendingServiceType:a3];
        [(TPSCallForwardingController *)self sendSetUnconditionalServiceDisabledRequest];
      }
      else
      {
        [(TPSCallForwardingController *)self setCurrentServiceType:a3];
        if (a3 == 3) {
          [(TPSCallForwardingController *)self enableConditionalServiceIfNeeded];
        }
      }
      return;
    }
    goto LABEL_16;
  }
  if (v6 != 3)
  {
    if (a3 == 2 && v6 == 1)
    {
      [(TPSCallForwardingController *)self setCurrentServiceType:2];
LABEL_15:
      [(TPSCallForwardingController *)self enableUnconditionalServiceIfNeeded];
      return;
    }
LABEL_16:
    [(TPSCallForwardingController *)self setCurrentServiceType:a3];
    return;
  }
  if ((unint64_t)(a3 - 1) > 1) {
    goto LABEL_16;
  }
  if ([(TPSCallForwardingController *)self conditionalServiceState] == 3)
  {
    [(TPSCallForwardingController *)self setPendingServiceType:a3];
    [(TPSCallForwardingController *)self sendSetAllServicesDisabledRequest];
    return;
  }
  [(TPSCallForwardingController *)self setCurrentServiceType:a3];
  if (a3 == 2) {
    goto LABEL_15;
  }
}

- (void)enableConditionalServiceIfNeeded
{
  v3 = [(TPSCallForwardingController *)self conditionalServiceBusyValue];
  if (v3) {
    [(TPSCallForwardingController *)self sendEnableSetRequestForValue:v3];
  }
  v4 = [(TPSCallForwardingController *)self conditionalServiceUnansweredValue];

  if (v4) {
    [(TPSCallForwardingController *)self sendEnableSetRequestForValue:v4];
  }
  id v6 = [(TPSCallForwardingController *)self conditionalServiceUnreachableValue];

  int64_t v5 = v6;
  if (v6)
  {
    [(TPSCallForwardingController *)self sendEnableSetRequestForValue:v6];
    int64_t v5 = v6;
  }
}

- (BOOL)isConditionalServiceAvailable
{
  return [(TPSCallForwardingController *)self conditionalServiceState] != 1;
}

- (BOOL)isConditionalServiceLoading
{
  return [(TPSCallForwardingController *)self conditionalServiceState] == 0;
}

- (NSArray)conditionalServiceRequests
{
  v16[3] = *MEMORY[0x1E4F143B8];
  conditionalServiceRequests = self->_conditionalServiceRequests;
  if (!conditionalServiceRequests)
  {
    v4 = [TPSCallForwardingRequest alloc];
    int64_t v5 = [(TPSCallForwardingController *)self subscriptionContext];
    id v6 = [(TPSCallForwardingRequest *)v4 initWithSubscriptionContext:v5 reason:1];
    id v7 = [TPSCallForwardingRequest alloc];
    v8 = [(TPSCallForwardingController *)self subscriptionContext];
    v9 = [(TPSCallForwardingRequest *)v7 initWithSubscriptionContext:v8 reason:2];
    v16[1] = v9;
    int v10 = [TPSCallForwardingRequest alloc];
    v11 = [(TPSCallForwardingController *)self subscriptionContext];
    __int16 v12 = [(TPSCallForwardingRequest *)v10 initWithSubscriptionContext:v11 reason:3];
    v16[2] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
    uint64_t v14 = self->_conditionalServiceRequests;
    self->_conditionalServiceRequests = v13;

    conditionalServiceRequests = self->_conditionalServiceRequests;
  }
  return conditionalServiceRequests;
}

- (int64_t)conditionalServiceState
{
  if (!MGGetBoolAnswer()) {
    return 1;
  }
  uint64_t v3 = [(TPSCallForwardingController *)self conditionalServiceBusyValue];
  if (v3)
  {
    v4 = (void *)v3;
    uint64_t v5 = [(TPSCallForwardingController *)self conditionalServiceUnansweredValue];
    if (!v5)
    {
      int64_t v8 = 0;
LABEL_17:

      return v8;
    }
    id v6 = (void *)v5;
    id v7 = [(TPSCallForwardingController *)self conditionalServiceUnreachableValue];

    if (v7)
    {
      v4 = [(TPSCallForwardingController *)self conditionalServiceBusyValue];
      if ([v4 enabled])
      {
        int64_t v8 = 3;
      }
      else
      {
        v9 = [(TPSCallForwardingController *)self conditionalServiceUnansweredValue];
        if ([v9 enabled])
        {
          int64_t v8 = 3;
        }
        else
        {
          int v10 = [(TPSCallForwardingController *)self conditionalServiceUnreachableValue];
          if ([v10 enabled]) {
            int64_t v8 = 3;
          }
          else {
            int64_t v8 = 2;
          }
        }
      }
      goto LABEL_17;
    }
  }
  return 0;
}

- (NSString)conditionalServiceBusyPhoneNumber
{
  uint64_t v3 = [(TPSCallForwardingController *)self conditionalServiceBusyValue];
  v4 = [v3 saveNumber];
  uint64_t v5 = [(TPSCallForwardingController *)self subscriptionISOCountryCode];
  id v6 = TPSLocalizedPhoneNumberString(v4, v5);

  return (NSString *)v6;
}

- (void)setConditionalServiceBusyPhoneNumber:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TPSCallForwardingController *)self conditionalServiceBusyValue];
  if (v5)
  {
    id v6 = [(TPSCallForwardingController *)self subscriptionISOCountryCode];
    id v7 = TPSNormalizedPhoneNumberString(v4, v6);

    int64_t v8 = [v5 saveNumber];
    unint64_t v9 = v7;
    unint64_t v10 = v8;
    if (v9 | v10)
    {
      v11 = (void *)v10;
      if (v10)
      {
        char v12 = [(id)v9 isEqualToString:v10];

        if (v12) {
          goto LABEL_10;
        }
      }
      else
      {
      }
      v13 = (void *)[v5 copy];
      [v13 setSaveNumber:v9];
      objc_msgSend(v13, "setEnabled:", objc_msgSend((id)v9, "length") != 0);
      uint64_t v14 = TPSLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        v16 = v13;
        _os_log_impl(&dword_1E4DD4000, v14, OS_LOG_TYPE_DEFAULT, "Sending set conditional call forwarding service busy phone number request for value %@.", (uint8_t *)&v15, 0xCu);
      }

      [(TPSCallForwardingController *)self sendSetRequestForValue:v13];
    }
LABEL_10:
  }
}

- (NSString)conditionalServiceUnansweredPhoneNumber
{
  uint64_t v3 = [(TPSCallForwardingController *)self conditionalServiceUnansweredValue];
  id v4 = [v3 saveNumber];
  uint64_t v5 = [(TPSCallForwardingController *)self subscriptionISOCountryCode];
  id v6 = TPSLocalizedPhoneNumberString(v4, v5);

  return (NSString *)v6;
}

- (void)setConditionalServiceUnansweredPhoneNumber:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TPSCallForwardingController *)self conditionalServiceUnansweredValue];
  if (v5)
  {
    id v6 = [(TPSCallForwardingController *)self subscriptionISOCountryCode];
    id v7 = TPSNormalizedPhoneNumberString(v4, v6);

    int64_t v8 = [v5 saveNumber];
    unint64_t v9 = v7;
    unint64_t v10 = v8;
    if (v9 | v10)
    {
      v11 = (void *)v10;
      if (v10)
      {
        char v12 = [(id)v9 isEqualToString:v10];

        if (v12) {
          goto LABEL_10;
        }
      }
      else
      {
      }
      v13 = (void *)[v5 copy];
      [v13 setSaveNumber:v9];
      objc_msgSend(v13, "setEnabled:", objc_msgSend((id)v9, "length") != 0);
      uint64_t v14 = TPSLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        v16 = v13;
        _os_log_impl(&dword_1E4DD4000, v14, OS_LOG_TYPE_DEFAULT, "Sending set conditional call forwarding service unanswered phone number request for value %@.", (uint8_t *)&v15, 0xCu);
      }

      [(TPSCallForwardingController *)self sendSetRequestForValue:v13];
    }
LABEL_10:
  }
}

- (NSString)conditionalServiceUnreachablePhoneNumber
{
  uint64_t v3 = [(TPSCallForwardingController *)self conditionalServiceUnreachableValue];
  id v4 = [v3 saveNumber];
  uint64_t v5 = [(TPSCallForwardingController *)self subscriptionISOCountryCode];
  id v6 = TPSLocalizedPhoneNumberString(v4, v5);

  return (NSString *)v6;
}

- (void)setConditionalServiceUnreachablePhoneNumber:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TPSCallForwardingController *)self conditionalServiceUnreachableValue];
  if (v5)
  {
    id v6 = [(TPSCallForwardingController *)self subscriptionISOCountryCode];
    id v7 = TPSNormalizedPhoneNumberString(v4, v6);

    int64_t v8 = [v5 saveNumber];
    unint64_t v9 = v7;
    unint64_t v10 = v8;
    if (v9 | v10)
    {
      v11 = (void *)v10;
      if (v10)
      {
        char v12 = [(id)v9 isEqualToString:v10];

        if (v12) {
          goto LABEL_10;
        }
      }
      else
      {
      }
      v13 = (void *)[v5 copy];
      [v13 setSaveNumber:v9];
      objc_msgSend(v13, "setEnabled:", objc_msgSend((id)v9, "length") != 0);
      uint64_t v14 = TPSLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        v16 = v13;
        _os_log_impl(&dword_1E4DD4000, v14, OS_LOG_TYPE_DEFAULT, "Sending set conditional call forwarding service unreachable phone number request for value %@.", (uint8_t *)&v15, 0xCu);
      }

      [(TPSCallForwardingController *)self sendSetRequestForValue:v13];
    }
LABEL_10:
  }
}

- (void)enableUnconditionalServiceIfNeeded
{
  uint64_t v3 = [(TPSCallForwardingController *)self unconditionalServiceValue];
  if (v3) {
    [(TPSCallForwardingController *)self sendEnableSetRequestForValue:v3];
  }
  MEMORY[0x1F41817F8]();
}

- (BOOL)isUnconditionalServiceLoading
{
  return [(TPSCallForwardingController *)self unconditionalServiceState] == 0;
}

- (NSArray)unconditionalServiceRequests
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unconditionalServiceRequests = self->_unconditionalServiceRequests;
  if (!unconditionalServiceRequests)
  {
    id v4 = [TPSCallForwardingRequest alloc];
    uint64_t v5 = [(TPSCallForwardingController *)self subscriptionContext];
    id v6 = [(TPSCallForwardingRequest *)v4 initWithSubscriptionContext:v5 reason:0];
    v10[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    int64_t v8 = self->_unconditionalServiceRequests;
    self->_unconditionalServiceRequests = v7;

    unconditionalServiceRequests = self->_unconditionalServiceRequests;
  }
  return unconditionalServiceRequests;
}

- (int64_t)unconditionalServiceState
{
  v2 = [(TPSCallForwardingController *)self unconditionalServiceValue];
  uint64_t v3 = v2;
  if (v2)
  {
    if ([v2 enabled]) {
      int64_t v4 = 3;
    }
    else {
      int64_t v4 = 2;
    }
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (NSString)unconditionalServicePhoneNumber
{
  uint64_t v3 = [(TPSCallForwardingController *)self unconditionalServiceValue];
  int64_t v4 = [v3 saveNumber];
  uint64_t v5 = [(TPSCallForwardingController *)self subscriptionISOCountryCode];
  id v6 = TPSLocalizedPhoneNumberString(v4, v5);

  return (NSString *)v6;
}

- (void)setUnconditionalServicePhoneNumber:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TPSCallForwardingController *)self unconditionalServiceValue];
  if (v5)
  {
    id v6 = [(TPSCallForwardingController *)self subscriptionISOCountryCode];
    id v7 = TPSNormalizedPhoneNumberString(v4, v6);

    int64_t v8 = [v5 saveNumber];
    unint64_t v9 = v7;
    unint64_t v10 = v8;
    if (v9 | v10)
    {
      v11 = (void *)v10;
      if (v10)
      {
        char v12 = [(id)v9 isEqualToString:v10];

        if (v12) {
          goto LABEL_10;
        }
      }
      else
      {
      }
      v13 = (void *)[v5 copy];
      [v13 setSaveNumber:v9];
      objc_msgSend(v13, "setEnabled:", objc_msgSend((id)v9, "length") != 0);
      uint64_t v14 = TPSLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        v16 = v13;
        _os_log_impl(&dword_1E4DD4000, v14, OS_LOG_TYPE_DEFAULT, "Sending set unconditional call forwarding service phone number request for value %@.", (uint8_t *)&v15, 0xCu);
      }

      [(TPSCallForwardingController *)self sendSetRequestForValue:v13];
    }
LABEL_10:
  }
}

- (NSDictionary)carrierBundleLocalizedStringKeys
{
  uint64_t v3 = [(TPSCallForwardingController *)self carrierBundleController];
  id v4 = [(TPSCallForwardingController *)self subscriptionContext];
  uint64_t v5 = [v3 objectForKey:@"CallForwardingCustomLabels" subscriptionContext:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return (NSDictionary *)v6;
}

- (id)localizedCarrierBundleStringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TPSCallForwardingController *)self carrierBundleLocalizedStringKeys];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = [NSString stringWithFormat:@"%@_CALL_FORWARDING_CUSTOM_LABEL", v6];

    int64_t v8 = [(TPSCallForwardingController *)self carrierBundleController];
    unint64_t v9 = [(TPSCallForwardingController *)self subscriptionContext];
    unint64_t v10 = [v8 localizedStringForKey:v7 subscriptionContext:v9];
  }
  else
  {
    unint64_t v10 = 0;
    id v7 = 0;
  }

  return v10;
}

- (NSString)localizedConditionalBusyTitle
{
  v2 = [(TPSCallForwardingController *)self localizedCarrierBundleStringForKey:@"Busy"];
  if (!v2)
  {
    v2 = +[TPSLocalizedString localizedStringForKey:@"CONDITIONAL_SERVICE_BUSY_SPECIFIER_TITLE"];
  }
  return (NSString *)v2;
}

- (NSString)localizedConditionalUnansweredTitle
{
  v2 = [(TPSCallForwardingController *)self localizedCarrierBundleStringForKey:@"NoAnswer"];
  if (!v2)
  {
    v2 = +[TPSLocalizedString localizedStringForKey:@"CONDITIONAL_SERVICE_UNANSWERED_SPECIFIER_TITLE"];
  }
  return (NSString *)v2;
}

- (NSString)localizedConditionalUnreachableTitle
{
  v2 = [(TPSCallForwardingController *)self localizedCarrierBundleStringForKey:@"Unreachable"];
  if (!v2)
  {
    v2 = +[TPSLocalizedString localizedStringForKey:@"CONDITIONAL_SERVICE_UNREACHABLE_SPECIFIER_TITLE"];
  }
  return (NSString *)v2;
}

- (void)sendConditionalServicesRequest
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TPSCallForwardingController *)self conditionalServiceRequests];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        unint64_t v9 = TPSLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v16 = v8;
          _os_log_impl(&dword_1E4DD4000, v9, OS_LOG_TYPE_DEFAULT, "Sending conditional call forwarding services request for %@.", buf, 0xCu);
        }

        unint64_t v10 = [(TPSCallForwardingController *)self requestController];
        [v10 addRequest:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)sendUnconditionalServicesRequest
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TPSCallForwardingController *)self unconditionalServiceRequests];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        unint64_t v9 = TPSLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v16 = v8;
          _os_log_impl(&dword_1E4DD4000, v9, OS_LOG_TYPE_DEFAULT, "Sending unconditional call forwarding services request for %@.", buf, 0xCu);
        }

        unint64_t v10 = [(TPSCallForwardingController *)self requestController];
        [v10 addRequest:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)sendServicesRequest
{
  uint64_t v3 = TPSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1E4DD4000, v3, OS_LOG_TYPE_DEFAULT, "Sending initial request for call forwarding services.", v4, 2u);
  }

  if ([(TPSCallForwardingController *)self isConditionalServiceAvailable]) {
    [(TPSCallForwardingController *)self sendConditionalServicesRequest];
  }
  [(TPSCallForwardingController *)self sendUnconditionalServicesRequest];
}

- (void)sendSetAllServicesDisabledRequest
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(TPSCallForwardingController *)self isConditionalServiceAvailable])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F23940]);
    [v3 setClss:1];
    [v3 setEnabled:0];
    [v3 setReason:4];
  }
  else
  {
    uint64_t v4 = [(TPSCallForwardingController *)self unconditionalServiceValue];
    id v3 = (id)[v4 copy];

    [v3 setEnabled:0];
  }
  uint64_t v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "Sending disable call forwarding services request for value %@.", (uint8_t *)&v6, 0xCu);
  }

  [(TPSCallForwardingController *)self sendSetRequestForValue:v3];
}

- (void)sendSetUnconditionalServiceDisabledRequest
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [(TPSCallForwardingController *)self unconditionalServiceValue];
  uint64_t v4 = (void *)[v3 copy];

  [v4 setEnabled:0];
  uint64_t v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "Sending disable all unconditional call forwarding services request for value %@.", (uint8_t *)&v6, 0xCu);
  }

  [(TPSCallForwardingController *)self sendSetRequestForValue:v4];
}

- (void)sendSetRequestForValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [TPSSetCallForwardingRequest alloc];
  int v6 = [(TPSCallForwardingController *)self subscriptionContext];
  uint64_t v8 = [(TPSSetCallForwardingRequest *)v5 initWithSubscriptionContext:v6 value:v4];

  id v7 = [(TPSCallForwardingController *)self requestController];
  [v7 addRequest:v8];
}

- (void)sendEnableSetRequestForValue:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 enabled] & 1) == 0)
  {
    uint64_t v5 = [v4 saveNumber];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      id v7 = (void *)[v4 copy];
      [v7 setEnabled:1];
      uint64_t v8 = TPSLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        unint64_t v10 = v7;
        _os_log_impl(&dword_1E4DD4000, v8, OS_LOG_TYPE_DEFAULT, "Sending enable call forwarding service request for value %@.", (uint8_t *)&v9, 0xCu);
      }

      [(TPSCallForwardingController *)self sendSetRequestForValue:v7];
    }
  }
}

- (void)requestController:(id)a3 didReceiveResponse:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = TPSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v28 = 138412546;
    *(void *)&v28[4] = objc_opt_class();
    *(_WORD *)&v28[12] = 2112;
    *(void *)&v28[14] = v5;
    id v7 = *(id *)&v28[4];
    _os_log_impl(&dword_1E4DD4000, v6, OS_LOG_TYPE_DEFAULT, "%@ received response %@.", v28, 0x16u);
  }
  uint64_t v8 = [v5 value];
  int v9 = v8;
  if (!v8) {
    goto LABEL_21;
  }
  switch([v8 reason])
  {
    case 0u:
      unint64_t v10 = [(TPSCallForwardingController *)self unconditionalServiceValue];
      if (v10)
      {
        objc_msgSend(v10, "setEnabled:", objc_msgSend(v9, "enabled"));
        uint64_t v11 = [v9 saveNumber];
        [v10 setSaveNumber:v11];

        if ([v10 enabled])
        {
          long long v12 = TPSLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v28 = 138412290;
            *(void *)&v28[4] = v10;
            _os_log_impl(&dword_1E4DD4000, v12, OS_LOG_TYPE_DEFAULT, "Setting service type to Unconditional for value %@.", v28, 0xCu);
          }

          int64_t v13 = 2;
        }
        else if ([(TPSCallForwardingController *)self isConditionalServiceAvailable])
        {
          uint64_t v17 = TPSLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v28 = 0;
            _os_log_impl(&dword_1E4DD4000, v17, OS_LOG_TYPE_DEFAULT, "Conditional service is available; settings service type to Conditional.",
              v28,
              2u);
          }

          int64_t v13 = 3;
        }
        else
        {
          int64_t v13 = 1;
        }
      }
      else
      {
        [(TPSCallForwardingController *)self setUnconditionalServiceValue:v9];
        int64_t v13 = 0;
      }
      break;
    case 1u:
      [(TPSCallForwardingController *)self setConditionalServiceBusyValue:v9];
      goto LABEL_21;
    case 2u:
      [(TPSCallForwardingController *)self setConditionalServiceUnansweredValue:v9];
      goto LABEL_21;
    case 3u:
      [(TPSCallForwardingController *)self setConditionalServiceUnreachableValue:v9];
      goto LABEL_21;
    case 4u:
      long long v14 = [(TPSCallForwardingController *)self conditionalServiceBusyValue];
      objc_msgSend(v14, "setEnabled:", objc_msgSend(v9, "enabled"));
      int v15 = [(TPSCallForwardingController *)self conditionalServiceUnansweredValue];

      objc_msgSend(v15, "setEnabled:", objc_msgSend(v9, "enabled"));
      uint64_t v16 = [(TPSCallForwardingController *)self conditionalServiceUnreachableValue];

      objc_msgSend(v16, "setEnabled:", objc_msgSend(v9, "enabled"));
      unint64_t v10 = [(TPSCallForwardingController *)self unconditionalServiceValue];

      objc_msgSend(v10, "setEnabled:", objc_msgSend(v9, "enabled"));
      int64_t v13 = [(TPSCallForwardingController *)self pendingServiceType];
      break;
    default:
      goto LABEL_21;
  }
  [(TPSCallForwardingController *)self resetPendingServiceType];

  if (!v13)
  {
LABEL_21:
    if ([(TPSCallForwardingController *)self isLoading])
    {
      int64_t v13 = 0;
    }
    else
    {
      int64_t v18 = [(TPSCallForwardingController *)self conditionalServiceState];
      int64_t v19 = [(TPSCallForwardingController *)self unconditionalServiceState];
      if (v18 == 3)
      {
        v20 = TPSLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v28 = 0;
          _os_log_impl(&dword_1E4DD4000, v20, OS_LOG_TYPE_DEFAULT, "Conditional service is enabled; setting service type to Conditional.",
            v28,
            2u);
        }
        int64_t v13 = 3;
      }
      else
      {
        int64_t v21 = v19;
        unint64_t v22 = v18 - 1;
        v20 = TPSLog();
        BOOL v23 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        if (v22 <= 1 && v21 == 2)
        {
          if (v23)
          {
            *(_WORD *)v28 = 0;
            _os_log_impl(&dword_1E4DD4000, v20, OS_LOG_TYPE_DEFAULT, "Conditional service is unavailable/disabled and Unconditional service is disabled; setting service type to None.",
              v28,
              2u);
          }
          int64_t v13 = 1;
        }
        else if (v23)
        {
          *(_WORD *)v28 = 0;
          int64_t v13 = 2;
          _os_log_impl(&dword_1E4DD4000, v20, OS_LOG_TYPE_DEFAULT, "Unconditional service is enabled; setting service type to Unconditional.",
            v28,
            2u);
        }
        else
        {
          int64_t v13 = 2;
        }
      }
    }
  }
  if ([(TPSCallForwardingController *)self currentServiceType] == v13)
  {
    v24 = [(TPSCallForwardingController *)self delegate];
    char v25 = objc_opt_respondsToSelector();

    if (v25)
    {
      v26 = [(TPSCallForwardingController *)self delegate];
      v27 = [v5 error];
      [v26 callForwardingController:self didChangeValue:v9 error:v27];
    }
  }
  else
  {
    [(TPSCallForwardingController *)self setCurrentServiceType:v13];
  }
}

- (BOOL)isUnloading
{
  return self->_unloading;
}

- (void)setUnloading:(BOOL)a3
{
  self->_unloading = a3;
}

- (TPSCallForwardingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TPSCallForwardingControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TPSCarrierBundleController)carrierBundleController
{
  return self->_carrierBundleController;
}

- (TPSCallForwardingRequestController)requestController
{
  return self->_requestController;
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (int64_t)currentServiceType
{
  return self->_currentServiceType;
}

- (int64_t)pendingServiceType
{
  return self->_pendingServiceType;
}

- (void)setPendingServiceType:(int64_t)a3
{
  self->_pendingServiceType = a3;
}

- (CTCallForwardingValue)conditionalServiceBusyValue
{
  return self->_conditionalServiceBusyValue;
}

- (void)setConditionalServiceBusyValue:(id)a3
{
}

- (CTCallForwardingValue)conditionalServiceUnansweredValue
{
  return self->_conditionalServiceUnansweredValue;
}

- (void)setConditionalServiceUnansweredValue:(id)a3
{
}

- (CTCallForwardingValue)conditionalServiceUnreachableValue
{
  return self->_conditionalServiceUnreachableValue;
}

- (void)setConditionalServiceUnreachableValue:(id)a3
{
}

- (CTCallForwardingValue)unconditionalServiceValue
{
  return self->_unconditionalServiceValue;
}

- (void)setUnconditionalServiceValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unconditionalServiceValue, 0);
  objc_storeStrong((id *)&self->_conditionalServiceUnreachableValue, 0);
  objc_storeStrong((id *)&self->_conditionalServiceUnansweredValue, 0);
  objc_storeStrong((id *)&self->_conditionalServiceBusyValue, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_requestController, 0);
  objc_storeStrong((id *)&self->_carrierBundleController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unconditionalServiceRequests, 0);
  objc_storeStrong((id *)&self->_subscriptionISOCountryCode, 0);
  objc_storeStrong((id *)&self->_conditionalServiceRequests, 0);
}

@end