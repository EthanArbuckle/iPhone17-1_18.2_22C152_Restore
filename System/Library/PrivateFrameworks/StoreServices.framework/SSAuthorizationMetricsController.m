@interface SSAuthorizationMetricsController
+ (id)_clientIDForAccount:(id)a3 orUserID:(id)a4;
+ (id)_clientIdForMetrics;
+ (id)_dialogEventForBiometricAuthorizationWithDialogId:(id)a3 buyParams:(id)a4 matchState:(int64_t)a5 topicName:(id)a6 userAgent:(id)a7;
+ (id)_dialogEventForBiometricOptInWithResult:(BOOL)a3 message:(id)a4 topicName:(id)a5 userAgent:(id)a6 error:(id)a7;
+ (id)_dialogEventForPasswordAuthorizationWithDialogId:(id)a3 buyParams:(id)a4 topicName:(id)a5 userAgent:(id)a6;
+ (id)_dialogEventForPaymentSheetPresentationErrorWithBuyParams:(id)a3 error:(id)a4;
+ (id)_mtTopicForBuyParams:(id)a3;
+ (id)authorizationDialogEventForParameters:(id)a3;
+ (id)dialogIdForMetricsDictionary:(id)a3;
+ (id)userActionDictionaryForBiometricMatchState:(unint64_t)a3 didBiometricsLockout:(BOOL)a4;
+ (id)userActionDictionaryForUserAction:(int64_t)a3 didBiometricsLockout:(BOOL)a4;
@end

@implementation SSAuthorizationMetricsController

+ (id)authorizationDialogEventForParameters:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"buyParams"];
  uint64_t v22 = [v3 objectForKeyedSubscript:@"dialogID"];
  v5 = [v3 objectForKeyedSubscript:@"dualAction"];
  uint64_t v21 = [v3 objectForKeyedSubscript:@"error"];
  v6 = [v3 objectForKeyedSubscript:@"eventType"];
  uint64_t v7 = [v6 integerValue];

  v8 = [v3 objectForKeyedSubscript:@"biometricMatchState"];
  uint64_t v9 = [v8 integerValue];

  v10 = [v3 objectForKeyedSubscript:@"message"];
  v11 = [v3 objectForKeyedSubscript:@"result"];
  uint64_t v12 = [v11 BOOLValue];

  v13 = [v3 objectForKeyedSubscript:@"topicName"];
  v14 = [v3 objectForKeyedSubscript:@"userAgent"];

  switch(v7)
  {
    case 1:
    case 4:
      v15 = (void *)v22;
      uint64_t v16 = [(id)objc_opt_class() _dialogEventForPasswordAuthorizationWithDialogId:v22 buyParams:v4 topicName:v13 userAgent:v14];
      goto LABEL_6;
    case 2:
      v15 = (void *)v22;
      uint64_t v16 = [(id)objc_opt_class() _dialogEventForBiometricAuthorizationWithDialogId:v22 buyParams:v4 matchState:v9 topicName:v13 userAgent:v14];
LABEL_6:
      v17 = (void *)v16;
      v18 = (void *)v21;
      if (v5) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 3:
      v18 = (void *)v21;
      uint64_t v20 = [(id)objc_opt_class() _dialogEventForBiometricOptInWithResult:v12 message:v10 topicName:v13 userAgent:v14 error:v21];
      goto LABEL_13;
    case 5:
      v18 = (void *)v21;
      uint64_t v20 = [(id)objc_opt_class() _dialogEventForPaymentSheetPresentationErrorWithBuyParams:v4 error:v21];
LABEL_13:
      v17 = (void *)v20;
      v15 = (void *)v22;
      if (!v5) {
        goto LABEL_8;
      }
      goto LABEL_7;
    default:
      v17 = 0;
      v18 = (void *)v21;
      v15 = (void *)v22;
      if (!v5) {
        goto LABEL_8;
      }
LABEL_7:
      [v17 setDualAction:v5];
LABEL_8:

      return v17;
  }
}

+ (id)dialogIdForMetricsDictionary:(id)a3
{
  if (a3)
  {
    id v3 = [a3 objectForKey:@"dialogId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)userActionDictionaryForBiometricMatchState:(unint64_t)a3 didBiometricsLockout:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = v6;
  unint64_t v8 = 0x1E4F28000uLL;
  switch(a3)
  {
    case 1uLL:
      [v6 setObject:@"error" forKeyedSubscript:@"reason"];
      uint64_t v9 = @"failure";
      v10 = @"result";
      goto LABEL_25;
    case 2uLL:
      [v6 setObject:@"authenticate" forKeyedSubscript:@"actionType"];
      v27 = SSMetricsDialogEventResultSuccess;
      goto LABEL_23;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_6;
    case 4uLL:
      [v6 setObject:@"enterPassword" forKeyedSubscript:@"actionType"];
      v28 = SSMetricsDialogEventTargetIdEnterPassword;
      goto LABEL_24;
    case 8uLL:
      v11 = SSMetricsDialogEventActionTypeCancel;
      goto LABEL_21;
    default:
      if (a3 == 16)
      {
        [v6 setObject:@"authenticate" forKeyedSubscript:@"actionType"];
        [v7 setObject:@"invalidCredentials" forKeyedSubscript:@"reason"];
        v27 = SSMetricsDialogEventResultFailure;
LABEL_23:
        [v7 setObject:*v27 forKeyedSubscript:@"result"];
        v28 = SSMetricsDialogEventTargetIdBiometrics;
        goto LABEL_24;
      }
      if (a3 != 32)
      {
LABEL_6:
        uint64_t v12 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v12)
        {
          uint64_t v12 = +[SSLogConfig sharedConfig];
        }
        int v13 = [v12 shouldLog];
        if ([v12 shouldLogToDisk]) {
          int v14 = v13 | 2;
        }
        else {
          int v14 = v13;
        }
        v15 = [v12 OSLogObject];
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          v14 &= 2u;
        }
        if (v14)
        {
          uint64_t v16 = objc_opt_class();
          v17 = (void *)MEMORY[0x1E4F28ED0];
          id v18 = v16;
          v19 = [v17 numberWithUnsignedInteger:a3];
          int v58 = 138543618;
          v59 = v16;
          __int16 v60 = 2114;
          v61 = v19;
          LODWORD(v57) = 22;
          v55 = &v58;
          uint64_t v20 = (void *)_os_log_send_and_compose_impl();

          unint64_t v8 = 0x1E4F28000;
          if (!v20)
          {
LABEL_17:

            goto LABEL_26;
          }
          v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v58, v57);
          free(v20);
          SSFileLog(v12, @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v15);
        }

        goto LABEL_17;
      }
      v11 = SSMetricsDialogEventActionTypeCancelHomeButton;
LABEL_21:
      [v6 setObject:*v11 forKeyedSubscript:@"actionType"];
      v28 = SSMetricsDialogEventTargetIdCancel;
LABEL_24:
      uint64_t v9 = *v28;
      v10 = @"targetId";
LABEL_25:
      [v7 setObject:v9 forKeyedSubscript:v10];
LABEL_26:
      v29 = +[SSDevice currentDevice];
      uint64_t v30 = [v29 deviceBiometricStyle];

      if (v30)
      {
        if (v30 == 3)
        {
          v31 = @"faceId";
LABEL_40:
          [v7 setObject:v31 forKey:@"biometricType"];
          if (!v4) {
            goto LABEL_42;
          }
          goto LABEL_41;
        }
        if (v30 == 2)
        {
          v31 = @"touchId";
          goto LABEL_40;
        }
        v32 = +[SSLogConfig sharediTunesStoreConfig];
        if (!v32)
        {
          v32 = +[SSLogConfig sharedConfig];
        }
        int v44 = [v32 shouldLog];
        if ([v32 shouldLogToDisk]) {
          int v45 = v44 | 2;
        }
        else {
          int v45 = v44;
        }
        v35 = [v32 OSLogObject];
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
          v45 &= 2u;
        }
        if (!v45) {
          goto LABEL_55;
        }
      }
      else
      {
        v32 = +[SSLogConfig sharediTunesStoreConfig];
        if (!v32)
        {
          v32 = +[SSLogConfig sharedConfig];
        }
        int v33 = [v32 shouldLog];
        if ([v32 shouldLogToDisk]) {
          int v34 = v33 | 2;
        }
        else {
          int v34 = v33;
        }
        v35 = [v32 OSLogObject];
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
          v34 &= 2u;
        }
        if (!v34) {
          goto LABEL_55;
        }
      }
      v46 = objc_opt_class();
      int v58 = 138543362;
      v59 = v46;
      id v47 = v46;
      LODWORD(v57) = 12;
      v56 = &v58;
      v48 = (void *)_os_log_send_and_compose_impl();

      if (!v48) {
        goto LABEL_56;
      }
      v35 = objc_msgSend(NSString, "stringWithCString:encoding:", v48, 4, &v58, v57);
      free(v48);
      SSFileLog(v32, @"%@", v49, v50, v51, v52, v53, v54, (uint64_t)v35);
LABEL_55:

LABEL_56:
      if (v4) {
LABEL_41:
      }
        objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E4F1CC38], @"bioLockout", v56);
LABEL_42:
      v36 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v56);
      [v36 timeIntervalSince1970];
      double v38 = v37;

      v39 = NSString;
      v40 = [*(id *)(v8 + 3792) numberWithLongLong:(uint64_t)v38];
      v41 = [v39 stringWithFormat:@"%@", v40];

      [v7 setObject:v41 forKeyedSubscript:@"responseTime"];
      v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v7];

      return v42;
  }
}

+ (id)userActionDictionaryForUserAction:(int64_t)a3 didBiometricsLockout:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = v6;
  int64_t v8 = a3 - 1;
  uint64_t v9 = SSMetricsDialogEventActionTypeAuthenticate;
  v10 = @"result";
  v11 = SSMetricsDialogEventResultSuccess;
  switch(v8)
  {
    case 0:
      [v6 setObject:@"success" forKeyedSubscript:@"result"];
      uint64_t v9 = SSMetricsDialogEventTargetIdOK;
      v10 = @"actionType";
      v11 = SSMetricsDialogEventActionTypeOK;
      goto LABEL_11;
    case 1:
      uint64_t v9 = SSMetricsDialogEventTargetIdIForgot;
      goto LABEL_6;
    case 2:
      uint64_t v9 = SSMetricsDialogEventTargetIdIForgot;
      v10 = @"actionType";
      v11 = SSMetricsDialogEventActionTypeOpen;
      goto LABEL_11;
    case 3:
      uint64_t v9 = SSMetricsDialogEventTargetIdCancel;
LABEL_6:
      v10 = @"actionType";
      v11 = SSMetricsDialogEventActionTypeCancel;
      goto LABEL_11;
    case 4:
      [v6 setObject:@"invalidCredentials" forKeyedSubscript:@"reason"];
      v10 = @"result";
      v11 = SSMetricsDialogEventResultFailure;
      goto LABEL_11;
    case 5:
      goto LABEL_11;
    case 6:
      v10 = @"actionType";
      v11 = SSMetricsDialogEventActionTypeEnterPasswordCancelled;
      goto LABEL_11;
    case 7:
      v10 = @"actionType";
      v11 = SSMetricsDialogEventActionTypeEnterPasswordPressed;
      goto LABEL_11;
    case 8:
      uint64_t v9 = SSMetricsDialogEventTargetIdCancel;
      v10 = @"actionType";
      v11 = SSMetricsDialogEventActionTypeCancelHomeButton;
LABEL_11:
      [v7 setObject:*v11 forKeyedSubscript:v10];
      [v7 setObject:*v9 forKeyedSubscript:@"targetId"];
      break;
    default:
      break;
  }
  if (v4) {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"bioLockout"];
  }
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
  [v12 timeIntervalSince1970];
  double v14 = v13;

  v15 = NSString;
  uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithLongLong:(uint64_t)v14];
  v17 = [v15 stringWithFormat:@"%@", v16];

  [v7 setObject:v17 forKeyedSubscript:@"responseTime"];
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v7];

  return v18;
}

+ (id)_dialogEventForBiometricAuthorizationWithDialogId:(id)a3 buyParams:(id)a4 matchState:(int64_t)a5 topicName:(id)a6 userAgent:(id)a7
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  uint64_t v16 = objc_alloc_init(SSMetricsDialogEvent);
  [(SSMetricsDialogEvent *)v16 setDialogId:v15];

  [(SSMetricsDialogEvent *)v16 setDialogType:@"SignIn"];
  v17 = [(id)objc_opt_class() _clientIdForMetrics];
  if (v17) {
    [(SSMetricsMutableEvent *)v16 setProperty:v17 forBodyKey:@"clientId"];
  }
  if (v12)
  {
    int v44 = @"buyParams";
    v45[0] = v12;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
    [(SSMetricsDialogEvent *)v16 setDetails:v18];
  }
  if (v14) {
    [(SSMetricsMutableEvent *)v16 setUserAgent:v14];
  }
  v19 = (__CFString *)v13;
  uint64_t v20 = v19;
  if (!v19)
  {
    uint64_t v21 = [a1 _mtTopicForBuyParams:v12];
    if (v21) {
      uint64_t v20 = (__CFString *)v21;
    }
    else {
      uint64_t v20 = @"xp_its_main";
    }
  }
  [(SSMetricsMutableEvent *)v16 setTopic:v20];
  switch(a5)
  {
    case 1:
      [(SSMetricsDialogEvent *)v16 setResult:@"failure"];
      goto LABEL_32;
    case 2:
      [(SSMetricsDialogEvent *)v16 setActionType:@"biometricsAnalyze"];
      uint64_t v22 = SSMetricsDialogEventResultSuccess;
      goto LABEL_25;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_15;
    case 4:
      [(SSMetricsDialogEvent *)v16 setActionType:@"enterPassword"];
      [(SSMetricsDialogEvent *)v16 setResult:@"unknown"];
      v35 = SSMetricsDialogEventTargetIdEnterPassword;
      goto LABEL_28;
    case 8:
      [(SSMetricsDialogEvent *)v16 setActionType:@"cancel"];
      [(SSMetricsDialogEvent *)v16 setResult:@"failure"];
      v35 = SSMetricsDialogEventTargetIdCancel;
      goto LABEL_28;
    default:
      if (a5 != 16)
      {
LABEL_15:
        uint64_t v23 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v23)
        {
          uint64_t v23 = +[SSLogConfig sharedConfig];
        }
        int v24 = [v23 shouldLog];
        if ([v23 shouldLogToDisk]) {
          v24 |= 2u;
        }
        v39 = [v23 OSLogObject];
        if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          v24 &= 2u;
        }
        if (v24)
        {
          HIDWORD(v37) = v24;
          uint64_t v25 = objc_opt_class();
          uint64_t v26 = (void *)MEMORY[0x1E4F28ED0];
          id v38 = v25;
          [v26 numberWithInteger:a5];
          int v40 = 138543618;
          v41 = v25;
          __int16 v42 = 2114;
          id v43 = (id)objc_claimAutoreleasedReturnValue();
          LODWORD(v37) = 22;
          v27 = (void *)_os_log_send_and_compose_impl();

          if (!v27)
          {
LABEL_31:

            goto LABEL_32;
          }
          v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v27, 4, &v40, v37);
          free(v27);
          SSFileLog(v23, @"%@", v29, v30, v31, v32, v33, v34, (uint64_t)v28);
        }
        else
        {
          v28 = v39;
        }

        goto LABEL_31;
      }
      [(SSMetricsDialogEvent *)v16 setActionType:@"biometricsAnalyze"];
      uint64_t v22 = SSMetricsDialogEventResultFailure;
LABEL_25:
      [(SSMetricsDialogEvent *)v16 setResult:*v22];
      v35 = SSMetricsDialogEventTargetIdBiometrics;
LABEL_28:
      [(SSMetricsDialogEvent *)v16 setTargetId:*v35];
LABEL_32:

      return v16;
  }
}

+ (id)_dialogEventForBiometricOptInWithResult:(BOOL)a3 message:(id)a4 topicName:(id)a5 userAgent:(id)a6 error:(id)a7
{
  BOOL v10 = a3;
  v31[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  id v13 = (__CFString *)a5;
  id v14 = objc_alloc_init(SSMetricsDialogEvent);
  id v15 = [(id)objc_opt_class() _clientIdForMetrics];
  if (v15) {
    [(SSMetricsMutableEvent *)v14 setProperty:v15 forBodyKey:@"clientId"];
  }
  [(SSMetricsDialogEvent *)v14 setDialogId:@"EnableTouchIdPurchases"];
  [(SSMetricsDialogEvent *)v14 setDialogType:@"OkCancel"];
  if (v13) {
    uint64_t v16 = v13;
  }
  else {
    uint64_t v16 = @"xp_its_main";
  }
  [(SSMetricsMutableEvent *)v14 setTopic:v16];

  if (v11) {
    [(SSMetricsDialogEvent *)v14 setMessage:v11];
  }
  if (v12) {
    [(SSMetricsMutableEvent *)v14 setUserAgent:v12];
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (a7)
  {
    id v18 = SSMetricsDialogEventResultFailure;
  }
  else
  {
    v19 = SSMetricsDialogEventActionTypeOK;
    if (v10)
    {
      uint64_t v20 = SSMetricsDialogEventTargetIdOK;
    }
    else
    {
      v19 = SSMetricsDialogEventActionTypeCancel;
      uint64_t v20 = SSMetricsDialogEventTargetIdNotNow;
    }
    [(SSMetricsDialogEvent *)v14 setActionType:*v19];
    uint64_t v21 = *v20;
    [(SSMetricsDialogEvent *)v14 setTargetId:v21];
    [v17 setObject:v21 forKey:@"targetId"];
    id v18 = SSMetricsDialogEventResultSuccess;
  }
  uint64_t v22 = *v18;
  [(SSMetricsDialogEvent *)v14 setResult:*v18];
  [v17 setObject:v22 forKey:@"result"];
  uint64_t v23 = [MEMORY[0x1E4F1C9C8] date];
  [v23 timeIntervalSince1970];
  double v25 = v24;

  uint64_t v26 = NSString;
  v27 = [MEMORY[0x1E4F28ED0] numberWithLongLong:(uint64_t)v25];
  v28 = [v26 stringWithFormat:@"%@", v27];

  [v17 setObject:v28 forKey:@"responseTime"];
  v31[0] = v17;
  uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  [(SSMetricsDialogEvent *)v14 setUserActions:v29];

  return v14;
}

+ (id)_dialogEventForPasswordAuthorizationWithDialogId:(id)a3 buyParams:(id)a4 topicName:(id)a5 userAgent:(id)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = objc_alloc_init(SSMetricsDialogEvent);
  [(SSMetricsDialogEvent *)v14 setDialogId:v13];

  [(SSMetricsDialogEvent *)v14 setDialogType:@"SignIn"];
  id v15 = [(id)objc_opt_class() _clientIdForMetrics];
  if (v15) {
    [(SSMetricsMutableEvent *)v14 setProperty:v15 forBodyKey:@"clientId"];
  }
  if (v10)
  {
    uint64_t v21 = @"buyParams";
    v22[0] = v10;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    [(SSMetricsDialogEvent *)v14 setDetails:v16];
  }
  if (v12) {
    [(SSMetricsMutableEvent *)v14 setUserAgent:v12];
  }
  id v17 = (__CFString *)v11;
  id v18 = v17;
  if (!v17)
  {
    uint64_t v19 = [a1 _mtTopicForBuyParams:v10];
    if (v19) {
      id v18 = (__CFString *)v19;
    }
    else {
      id v18 = @"xp_its_main";
    }
  }
  [(SSMetricsMutableEvent *)v14 setTopic:v18];

  return v14;
}

+ (id)_dialogEventForPaymentSheetPresentationErrorWithBuyParams:(id)a3 error:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = objc_alloc_init(SSMetricsDialogEvent);
  uint64_t v9 = [(id)objc_opt_class() _clientIdForMetrics];
  if (v9) {
    [(SSMetricsMutableEvent *)v8 setProperty:v9 forBodyKey:@"clientId"];
  }
  [(SSMetricsDialogEvent *)v8 setDialogId:@"PaymentSheet"];
  [(SSMetricsDialogEvent *)v8 setDialogType:@"SignIn"];
  [(SSMetricsDialogEvent *)v8 setResult:@"failure"];
  id v10 = [a1 _mtTopicForBuyParams:v7];

  if (v10) {
    [(SSMetricsMutableEvent *)v8 setTopic:v10];
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v11 setObject:@"authenticate" forKey:@"actionType"];
  [v11 setObject:@"failure" forKey:@"result"];
  uint64_t v12 = [v6 code];

  if (v12 == 151)
  {
    id v13 = SSMetricsDialogEventReasonPaymentSheetPresentationFailure;
  }
  else
  {
    if (v12 != 152) {
      goto LABEL_10;
    }
    id v13 = SSMetricsDialogEventReasonPaymentSheetTimeout;
  }
  [v11 setObject:*v13 forKey:@"reason"];
LABEL_10:
  id v14 = [MEMORY[0x1E4F1C9C8] date];
  [v14 timeIntervalSince1970];
  double v16 = v15;

  id v17 = NSString;
  id v18 = [MEMORY[0x1E4F28ED0] numberWithLongLong:(uint64_t)v16];
  uint64_t v19 = [v17 stringWithFormat:@"%@", v18];

  [v11 setObject:v19 forKey:@"responseTime"];
  v22[0] = v11;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  [(SSMetricsDialogEvent *)v8 setUserActions:v20];

  return v8;
}

+ (id)_clientIdForMetrics
{
  id v3 = +[SSAccountStore defaultStore];
  BOOL v4 = [v3 activeAccount];

  if (!v4
    || ([a1 _clientIDForAccount:v4 orUserID:0],
        (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = [a1 _clientIDForAccount:0 orUserID:&unk_1EF9A9960];
    if (!v5)
    {
      v5 = [a1 _clientIDForAccount:0 orUserID:&unk_1EF9A9978];
    }
  }

  return v5;
}

+ (id)_clientIDForAccount:(id)a3 orUserID:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[SSLogConfig sharediTunesStoreConfig];
  id v8 = (id)v7;
  if (!v6)
  {
    if (!v7)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v23 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v24 = v23 | 2;
    }
    else {
      int v24 = v23;
    }
    double v25 = [v8 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
      int v26 = v24;
    }
    else {
      int v26 = v24 & 2;
    }
    if (v26)
    {
      int v65 = 138543362;
      id v66 = (id)objc_opt_class();
      id v27 = v66;
      LODWORD(v60) = 12;
      v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_28:
        v35 = 0;
        goto LABEL_53;
      }
      double v25 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, &v65, v60);
      free(v28);
      SSFileLog(v8, @"%@", v29, v30, v31, v32, v33, v34, (uint64_t)v25);
    }

    goto LABEL_28;
  }
  if (!v7)
  {
    id v8 = +[SSLogConfig sharedConfig];
  }
  int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  id v11 = [v8 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
    int v12 = v10;
  }
  else {
    int v12 = v10 & 2;
  }
  if (!v12) {
    goto LABEL_13;
  }
  int v65 = 138543618;
  id v66 = (id)objc_opt_class();
  __int16 v67 = 2112;
  id v68 = v6;
  id v13 = v66;
  LODWORD(v60) = 22;
  v59 = &v65;
  id v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    id v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v65, v60);
    free(v14);
    SSFileLog(v8, @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v11);
LABEL_13:
  }
  uint64_t v21 = +[SSVCookieStorage sharedStorage];
  uint64_t v22 = v21;
  if (v5) {
    [v21 allCookiesForAccount:v5];
  }
  else {
  v36 = [v21 allCookiesForUserIdentifier:v6];
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v8 = v36;
  uint64_t v37 = [v8 countByEnumeratingWithState:&v61 objects:v71 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v62;
LABEL_32:
    uint64_t v40 = 0;
    while (1)
    {
      if (*(void *)v62 != v39) {
        objc_enumerationMutation(v8);
      }
      v41 = *(void **)(*((void *)&v61 + 1) + 8 * v40);
      __int16 v42 = objc_msgSend(v41, "name", v59);
      char v43 = [v42 isEqualToString:@"xp_ci"];

      if (v43) {
        break;
      }
      if (v38 == ++v40)
      {
        uint64_t v38 = [v8 countByEnumeratingWithState:&v61 objects:v71 count:16];
        if (v38) {
          goto LABEL_32;
        }
        goto LABEL_38;
      }
    }
    v35 = [v41 value];

    if (!v35) {
      goto LABEL_53;
    }
    int v44 = +[SSLogConfig sharediTunesStoreConfig];
    if (!v44)
    {
      int v44 = +[SSLogConfig sharedConfig];
    }
    int v45 = [v44 shouldLog];
    if ([v44 shouldLogToDisk]) {
      int v46 = v45 | 2;
    }
    else {
      int v46 = v45;
    }
    id v47 = [v44 OSLogObject];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO)) {
      int v48 = v46;
    }
    else {
      int v48 = v46 & 2;
    }
    if (v48)
    {
      uint64_t v49 = objc_opt_class();
      int v65 = 138543874;
      id v66 = v49;
      __int16 v67 = 2114;
      id v68 = v35;
      __int16 v69 = 2112;
      id v70 = v6;
      id v50 = v49;
      LODWORD(v60) = 32;
      uint64_t v51 = (void *)_os_log_send_and_compose_impl();

      if (!v51) {
        goto LABEL_52;
      }
      id v47 = objc_msgSend(NSString, "stringWithCString:encoding:", v51, 4, &v65, v60);
      free(v51);
      SSFileLog(v44, @"%@", v52, v53, v54, v55, v56, v57, (uint64_t)v47);
    }
  }
  else
  {
LABEL_38:
    v35 = 0;
    int v44 = v8;
  }
LABEL_52:

LABEL_53:
  return v35;
}

+ (id)_mtTopicForBuyParams:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__86;
  int v12 = __Block_byref_object_dispose__86;
  id v13 = 0;
  BOOL v4 = [v3 componentsSeparatedByString:@"&"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SSAuthorizationMetricsController__mtTopicForBuyParams___block_invoke;
  v7[3] = &unk_1E5BAEC40;
  v7[4] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];
  id v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v5;
}

void __57__SSAuthorizationMetricsController__mtTopicForBuyParams___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  int v6 = [v12 containsString:@"mtTopic"];
  uint64_t v7 = v12;
  if (v6)
  {
    uint64_t v8 = [v12 componentsSeparatedByString:@"="];
    if ([v8 count] == 2)
    {
      uint64_t v9 = [v8 objectAtIndexedSubscript:1];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
    *a4 = 1;

    uint64_t v7 = v12;
  }
}

@end