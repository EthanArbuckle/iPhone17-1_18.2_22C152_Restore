@interface PKPaymentNotificationAppURLHelper
+ (BOOL)applicationExistsToHandleNotificationsForPaymentPass:(id)a3;
+ (id)_appURLForNotificationOfType:(id)a3 paymentPass:(id)a4 serviceIdentifier:(id)a5 appLaunchToken:(id)a6 pathSuffix:(id)a7 usingDeviceAccountNumber:(BOOL)a8;
+ (id)appURLForMessageNotification:(id)a3 pass:(id)a4 appLaunchToken:(id)a5;
+ (id)appURLForTransactionNotification:(id)a3 excludeTransactionIdentifier:(BOOL)a4 pass:(id)a5 pathSuffix:(id)a6 appLaunchToken:(id)a7;
+ (id)appURLForTransactionNotification:(id)a3 pass:(id)a4 appLaunchToken:(id)a5;
@end

@implementation PKPaymentNotificationAppURLHelper

+ (id)appURLForMessageNotification:(id)a3 pass:(id)a4 appLaunchToken:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 serviceIdentifier];
  uint64_t v12 = [v10 hasAssociatedPaymentApplication];

  v13 = [a1 _appURLForNotificationOfType:@"messages" paymentPass:v9 serviceIdentifier:v11 appLaunchToken:v8 pathSuffix:0 usingDeviceAccountNumber:v12];

  return v13;
}

+ (id)appURLForTransactionNotification:(id)a3 pass:(id)a4 appLaunchToken:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 serviceIdentifier];
  uint64_t v12 = [v10 hasAssociatedPaymentApplication];

  v13 = [a1 _appURLForNotificationOfType:@"transactions" paymentPass:v9 serviceIdentifier:v11 appLaunchToken:v8 pathSuffix:0 usingDeviceAccountNumber:v12];

  return v13;
}

+ (id)appURLForTransactionNotification:(id)a3 excludeTransactionIdentifier:(BOOL)a4 pass:(id)a5 pathSuffix:(id)a6 appLaunchToken:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (a4)
  {
    v16 = 0;
  }
  else
  {
    v16 = [v12 serviceIdentifier];
  }
  v17 = objc_msgSend(a1, "_appURLForNotificationOfType:paymentPass:serviceIdentifier:appLaunchToken:pathSuffix:usingDeviceAccountNumber:", @"transactions", v13, v16, v15, v14, objc_msgSend(v12, "hasAssociatedPaymentApplication"));

  return v17;
}

+ (BOOL)applicationExistsToHandleNotificationsForPaymentPass:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 appURLScheme];
  v5 = (void *)MEMORY[0x1E4F1CB10];
  v6 = [NSString stringWithFormat:@"%@://", v4];
  v7 = [v5 URLWithString:v6];

  id v8 = [v3 associatedApplicationIdentifiers];
  id v9 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v10 = [v9 applicationsAvailableForOpeningURL:v7];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    v23 = v7;
    v24 = v4;
    id v25 = v3;
    uint64_t v14 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v17 = NSString;
        v18 = [v16 teamID];
        uint64_t v19 = [v16 bundleIdentifier];
        v20 = [v17 stringWithFormat:@"%@.%@", v18, v19];

        LOBYTE(v19) = [v8 containsObject:v20];
        if (v19)
        {
          BOOL v21 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v13) {
        continue;
      }
      break;
    }
    BOOL v21 = 0;
LABEL_11:
    v4 = v24;
    id v3 = v25;
    v7 = v23;
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

+ (id)_appURLForNotificationOfType:(id)a3 paymentPass:(id)a4 serviceIdentifier:(id)a5 appLaunchToken:(id)a6 pathSuffix:(id)a7 usingDeviceAccountNumber:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if ([a1 applicationExistsToHandleNotificationsForPaymentPass:v15])
  {
    uint64_t v19 = [v15 appURLScheme];
    if (v19)
    {
      if (a8)
      {
        v20 = [v15 deviceAccountIdentifier];
        BOOL v21 = @"dpan";
      }
      else
      {
        v20 = [v15 primaryAccountIdentifier];
        BOOL v21 = @"fpan";
      }
      v23 = [NSString stringWithFormat:@"%@://%@/%@/%@", v19, v21, v20, v14];
      v24 = v23;
      if (v16)
      {
        uint64_t v25 = [v23 stringByAppendingFormat:@"/%@", v16];

        v24 = (void *)v25;
      }
      if (v18)
      {
        uint64_t v26 = [v24 stringByAppendingString:v18];

        v24 = (void *)v26;
      }
      if (v17)
      {
        uint64_t v27 = [v24 stringByAppendingFormat:@"?token=%@", v17];

        v24 = (void *)v27;
      }
      v22 = [MEMORY[0x1E4F1CB10] URLWithString:v24];
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end