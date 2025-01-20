@interface TUSenderIdentityClient
- (BOOL)inEmergencyMode;
- (BOOL)isEmergencyNumberForDigits:(id)a3 senderIdentityUUID:(id)a4;
- (BOOL)isEmergencyNumberForDigits:(id)a3 senderIdentityUUID:(id)a4 error:(id *)a5;
- (BOOL)isRTTAvailableForSenderIdentityUUID:(id)a3;
- (BOOL)isRTTSupportedForSenderIdentityUUID:(id)a3;
- (BOOL)isTTYAvailableForSenderIdentityUUID:(id)a3;
- (BOOL)isTTYEnabledForSenderIdentityUUID:(id)a3;
- (BOOL)isTTYHardwareAvailableForSenderIdentityUUID:(id)a3;
- (BOOL)isTTYHardwareEnabledForSenderIdentityUUID:(id)a3;
- (BOOL)isTTYHardwareSupportedForSenderIdentityUUID:(id)a3;
- (BOOL)isTTYSoftwareAvailableForSenderIdentityUUID:(id)a3;
- (BOOL)isTTYSoftwareEnabledForSenderIdentityUUID:(id)a3;
- (BOOL)isTTYSoftwareSupportedForSenderIdentityUUID:(id)a3;
- (BOOL)isTTYSupportedForSenderIdentityUUID:(id)a3;
- (BOOL)isWhitelistedEmergencyNumberForDigits:(id)a3 senderIdentityUUID:(id)a4;
- (BOOL)isWhitelistedEmergencyNumberForDigits:(id)a3 senderIdentityUUID:(id)a4 error:(id *)a5;
- (BOOL)shouldShowEmergencyCallbackModeAlertForSenderIdentityUUID:(id)a3;
- (BOOL)shouldShowEmergencyCallbackModeAlertForSenderIdentityUUID:(id)a3 error:(id *)a4;
- (OS_dispatch_queue)queue;
- (TUCoreTelephonyClient)client;
- (TUSenderIdentityClient)init;
- (id)testEmergencyHandleForAccountUUID:(id)a3 error:(id *)a4;
- (void)setClient:(id)a3;
@end

@implementation TUSenderIdentityClient

- (BOOL)isRTTAvailableForSenderIdentityUUID:(id)a3
{
  id v4 = a3;
  if ([(TUSenderIdentityClient *)self isRTTSupportedForSenderIdentityUUID:v4]) {
    BOOL v5 = [(TUSenderIdentityClient *)self isTTYSoftwareAvailableForSenderIdentityUUID:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isRTTSupportedForSenderIdentityUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUSenderIdentityClient *)self client];
  char v6 = [v5 isRTTSupportedForSubscriptionUUID:v4];

  return v6;
}

- (BOOL)isTTYAvailableForSenderIdentityUUID:(id)a3
{
  id v4 = a3;
  if ([(TUSenderIdentityClient *)self isTTYSupportedForSenderIdentityUUID:v4]) {
    BOOL v5 = [(TUSenderIdentityClient *)self isTTYHardwareAvailableForSenderIdentityUUID:v4]|| [(TUSenderIdentityClient *)self isTTYSoftwareAvailableForSenderIdentityUUID:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isTTYEnabledForSenderIdentityUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUSenderIdentityClient *)self client];
  char v6 = [v5 isTTYEnabledForSubscriptionUUID:v4];

  return v6;
}

- (BOOL)isTTYSupportedForSenderIdentityUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUSenderIdentityClient *)self client];
  char v6 = [v5 isTTYSupportedForSubscriptionUUID:v4];

  return v6;
}

- (BOOL)isTTYHardwareAvailableForSenderIdentityUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUSenderIdentityClient *)self client];
  char v6 = [v5 isTTYHardwareAvailableForSubscriptionUUID:v4];

  return v6;
}

- (BOOL)isTTYHardwareEnabledForSenderIdentityUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUSenderIdentityClient *)self client];
  char v6 = [v5 isTTYHardwareEnabledForSubscriptionUUID:v4];

  return v6;
}

- (BOOL)isTTYHardwareSupportedForSenderIdentityUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUSenderIdentityClient *)self client];
  char v6 = [v5 isTTYHardwareSupportedForSubscriptionUUID:v4];

  return v6;
}

- (BOOL)isTTYSoftwareAvailableForSenderIdentityUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUSenderIdentityClient *)self client];
  char v6 = [v5 isTTYSoftwareAvailableForSubscriptionUUID:v4];

  return v6;
}

- (BOOL)isTTYSoftwareEnabledForSenderIdentityUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUSenderIdentityClient *)self client];
  char v6 = [v5 isTTYSoftwareEnabledForSubscriptionUUID:v4];

  return v6;
}

- (BOOL)isTTYSoftwareSupportedForSenderIdentityUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUSenderIdentityClient *)self client];
  char v6 = [v5 isTTYSoftwareSupportedForSubscriptionUUID:v4];

  return v6;
}

- (TUSenderIdentityClient)init
{
  v18.receiver = self;
  v18.super_class = (Class)TUSenderIdentityClient;
  v2 = [(TUSenderIdentityClient *)&v18 init];
  if (v2)
  {
    v3 = NSString;
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v5 = [v4 bundleIdentifier];
    char v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = [v3 stringWithFormat:@"%@.%@", v5, v7];
    v9 = NSStringFromSelector(sel_queue);
    v10 = [v3 stringWithFormat:@"%@.%@", v8, v9];

    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    id v12 = v10;
    dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], v11);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v13;

    v15 = [[TUCoreTelephonyClient alloc] initWithQueue:v2->_queue];
    client = v2->_client;
    v2->_client = v15;
  }
  return v2;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TUCoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)inEmergencyMode
{
  v2 = [(TUSenderIdentityClient *)self client];
  char v3 = [v2 inEmergencyMode];

  return v3;
}

- (BOOL)isEmergencyNumberForDigits:(id)a3 senderIdentityUUID:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v13 = 0;
  BOOL v8 = [(TUSenderIdentityClient *)self isEmergencyNumberForDigits:v6 senderIdentityUUID:v7 error:&v13];
  id v9 = v13;
  v10 = v9;
  if (!v8 && v9)
  {
    v11 = TUDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = v6;
      __int16 v16 = 2112;
      v17 = v10;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_error_impl(&dword_19C496000, v11, OS_LOG_TYPE_ERROR, "Failed to determine whether digits %@ are an emergency number due to error %@ for sender identity UUID %@.", buf, 0x20u);
    }
  }
  return v8;
}

- (BOOL)isEmergencyNumberForDigits:(id)a3 senderIdentityUUID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(TUSenderIdentityClient *)self client];
  LOBYTE(a5) = [v10 isEmergencyNumberForDigits:v9 subscriptionUUID:v8 error:a5];

  return (char)a5;
}

- (BOOL)isWhitelistedEmergencyNumberForDigits:(id)a3 senderIdentityUUID:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v13 = 0;
  BOOL v8 = [(TUSenderIdentityClient *)self isWhitelistedEmergencyNumberForDigits:v6 senderIdentityUUID:v7 error:&v13];
  id v9 = v13;
  v10 = v9;
  if (!v8 && v9)
  {
    v11 = TUDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = v6;
      __int16 v16 = 2112;
      v17 = v10;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_error_impl(&dword_19C496000, v11, OS_LOG_TYPE_ERROR, "Failed to determine whether digits %@ are a whitelisted emergency number due to error %@ for sender identity UUID %@.", buf, 0x20u);
    }
  }
  return v8;
}

- (BOOL)isWhitelistedEmergencyNumberForDigits:(id)a3 senderIdentityUUID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(TUSenderIdentityClient *)self client];
  LOBYTE(a5) = [v10 isWhitelistedEmergencyNumberForDigits:v9 subscriptionUUID:v8 error:a5];

  return (char)a5;
}

- (BOOL)shouldShowEmergencyCallbackModeAlertForSenderIdentityUUID:(id)a3
{
  id v4 = a3;
  id v10 = 0;
  BOOL v5 = [(TUSenderIdentityClient *)self shouldShowEmergencyCallbackModeAlertForSenderIdentityUUID:v4 error:&v10];
  id v6 = v10;
  id v7 = v6;
  if (!v5 && v6)
  {
    id v8 = TUDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(TUSenderIdentityClient(Emergency) *)(uint64_t)v7 shouldShowEmergencyCallbackModeAlertForSenderIdentityUUID:v8];
    }
  }
  return v5;
}

- (BOOL)shouldShowEmergencyCallbackModeAlertForSenderIdentityUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(TUSenderIdentityClient *)self client];
  LOBYTE(a4) = [v7 shouldShowEmergencyCallbackModeAlertForSubscriptionUUID:v6 error:a4];

  return (char)a4;
}

- (id)testEmergencyHandleForAccountUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(TUSenderIdentityClient *)self client];
  id v8 = [v6 UUIDString];

  id v9 = [v7 testEmergencyHandleForSubscriptionLabelIdentifier:v8 error:a4];

  return v9;
}

@end