@interface VMCarrierStateRequestController
- (CTMessageCenter)messageCenter;
- (VMCarrierStateRequestController)initWithMessageCenter:(id)a3 telephonyClient:(id)a4 queue:(id)a5;
- (VMCarrierStateRequestController)initWithTelephonyClient:(id)a3;
- (VMTelephonyClient)telephonyClient;
- (void)dealloc;
- (void)executeRequest:(id)a3;
- (void)postSMSMessageSent:(id)a3 success:(BOOL)a4 messageID:(int64_t)a5 err1:(int64_t)a6 err2:(int64_t)a7;
- (void)setTelephonyClient:(id)a3;
@end

@implementation VMCarrierStateRequestController

- (VMCarrierStateRequestController)initWithTelephonyClient:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "vm_classIdentifier");
  v6 = NSStringFromSelector("queue");
  v7 = +[NSString stringWithFormat:@"%@.%@", v5, v6];

  id v8 = v7;
  v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
  dispatch_queue_set_specific(v9, off_1000DFF78, self, 0);
  v10 = +[CTMessageCenter sharedMessageCenter];
  v11 = [(VMCarrierStateRequestController *)self initWithMessageCenter:v10 telephonyClient:v4 queue:v9];

  return v11;
}

- (VMCarrierStateRequestController)initWithMessageCenter:(id)a3 telephonyClient:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)VMCarrierStateRequestController;
  v12 = [(VMTelephonyRequestController *)&v16 initWithQueue:v11];
  v13 = v12;
  if (v12)
  {
    dword_1000E0A88 = -1;
    objc_storeStrong((id *)&v12->_messageCenter, a3);
    [(VMCarrierStateRequestController *)v13 setTelephonyClient:v10];
    v14 = [(VMCarrierStateRequestController *)v13 telephonyClient];
    [v14 addDelegate:v13 queue:v11];
  }
  return v13;
}

- (void)dealloc
{
  v3 = [(VMCarrierStateRequestController *)self telephonyClient];
  [v3 removeDelegate:self];

  v4.receiver = self;
  v4.super_class = (Class)VMCarrierStateRequestController;
  [(VMCarrierStateRequestController *)&v4 dealloc];
}

- (void)executeRequest:(id)a3
{
  id v4 = a3;
  v5 = [(VMTelephonyRequestController *)self pendingRequest];
  unsigned int v6 = [v5 isEqualToRequest:v4];

  if (v6)
  {
    v7 = vm_vmd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending message for STATE request %@", (uint8_t *)&v19, 0xCu);
    }

    int v19 = -1;
    id v8 = [(VMCarrierStateRequestController *)self messageCenter];
    id v9 = [v4 subscription];
    id v10 = [v4 message];
    id v11 = [v4 serviceCenter];
    v12 = [v4 destination];
    unsigned __int8 v13 = [v8 sendSMSWithText:v9 text:v10 serviceCenter:v11 toAddress:v12 trackingID:&v19];

    if (v13)
    {
      dword_1000E0A88 = v19;
    }
    else
    {
      v14 = vm_vmd_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000805C8((uint64_t)v4, v14);
      }

      v15 = +[VMCarrierStateResponseError errorWithCode:qword_1000E0760 userInfo:0];
      objc_super v16 = [VMCarrierStateResponse alloc];
      v17 = [v4 subscription];
      v18 = [(VMTelephonyResponse *)v16 initWithSubscription:v17 error:v15];

      [(VMTelephonyRequestController *)self postResponse:v18 forRequest:v4];
    }
  }
}

- (CTMessageCenter)messageCenter
{
  uint64_t v5 = 0;
  unsigned int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100017514;
  id v9 = sub_100017524;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001752C;
  v4[3] = &unk_1000C1230;
  v4[4] = self;
  v4[5] = &v5;
  [(VMTelephonyRequestController *)self performAtomicAccessorBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CTMessageCenter *)v2;
}

- (void)postSMSMessageSent:(id)a3 success:(BOOL)a4 messageID:(int64_t)a5 err1:(int64_t)a6 err2:(int64_t)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  unsigned __int8 v13 = [(VMTelephonyRequestController *)self queue];
  dispatch_assert_queue_V2(v13);

  if (dword_1000E0A88 == a5)
  {
    v14 = vm_vmd_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 138413570;
      id v31 = (id)objc_opt_class();
      __int16 v32 = 2112;
      id v33 = v12;
      __int16 v34 = 1024;
      BOOL v35 = v10;
      __int16 v36 = 2048;
      int64_t v37 = a5;
      __int16 v38 = 2048;
      int64_t v39 = a6;
      __int16 v40 = 2048;
      int64_t v41 = a7;
      id v15 = v31;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ is handling postSMSMessageSent delegate callback with context:%@, success: %d, messageID: %ld, err1: %ld, err2: %ld", (uint8_t *)&v30, 0x3Au);
    }
    dword_1000E0A88 = -1;
    objc_super v16 = [(VMTelephonyRequestController *)self pendingRequest];
    v17 = v16;
    if (v16)
    {
      v18 = [v16 subscription];
      int v19 = [v18 uuid];
      id v20 = [v12 uuid];
      unsigned int v21 = [v19 isEqual:v20];

      if (v21)
      {
        if (v10)
        {
          v22 = 0;
        }
        else
        {
          v22 = +[VMCarrierStateResponseError errorWithCode:a6 userInfo:0];
        }
        v23 = vm_vmd_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          int v30 = 138412290;
          id v31 = v17;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Acknowledging outgoing message for STATE request %@", (uint8_t *)&v30, 0xCu);
        }

        v24 = [(VMCarrierStateRequestController *)self messageCenter];
        [v24 acknowledgeOutgoingMessageWithId:a5];

        v25 = vm_vmd_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v26 = @"failure";
          if (!v22) {
            CFStringRef v26 = @"success";
          }
          int v30 = 138412546;
          id v31 = (id)v26;
          __int16 v32 = 2112;
          id v33 = v17;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Posting %@ response for STATE request %@", (uint8_t *)&v30, 0x16u);
        }

        v27 = [VMCarrierStateResponse alloc];
        v28 = [v17 subscription];
        v29 = [(VMTelephonyResponse *)v27 initWithSubscription:v28 error:v22];
        [(VMTelephonyRequestController *)self postResponse:v29 forRequest:v17];
      }
      else
      {
        v22 = vm_vmd_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int v30 = 138412546;
          id v31 = v17;
          __int16 v32 = 2112;
          id v33 = v12;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Ignoring handling pendingStateRequest: %@, context: %@", (uint8_t *)&v30, 0x16u);
        }
      }
    }
    else
    {
      v22 = vm_vmd_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100080640((uint64_t)self, v22);
      }
    }
  }
}

- (VMTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_messageCenter, 0);
}

@end