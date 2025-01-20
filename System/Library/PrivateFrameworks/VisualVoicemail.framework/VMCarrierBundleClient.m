@interface VMCarrierBundleClient
- (BOOL)isGreetingChangeSupportedForSubscription:(id)a3;
- (BOOL)isPasswordChangeSupportedForDefaultSubscription;
- (BOOL)isPasswordChangeSupportedForSubscription:(id)a3;
- (BOOL)isServiceSupportedForSubscription:(id)a3;
- (BOOL)isServiceSupportedOnInternetForSubscription:(id)a3;
- (NSMutableDictionary)values;
- (OS_dispatch_queue)queue;
- (VMCarrierBundleClient)initWithTelephonyClient:(id)a3 queue:(id)a4;
- (VMTelephonyClient)telephonyClient;
- (double)maximumGreetingDurationForSubscription:(id)a3;
- (id)cbValueForDomain:(id)a3 key:(id)a4 subscription:(id)a5;
- (id)cbValueForKey:(id)a3 subscription:(id)a4;
- (id)serviceNameForSubscription:(id)a3;
- (id)valuesForContext:(id)a3;
- (os_unfair_lock_s)accessorLock;
- (void)carrierBundleChange:(id)a3;
- (void)dealloc;
- (void)setQueue:(id)a3;
- (void)setTelephonyClient:(id)a3;
- (void)setValues:(id)a3;
@end

@implementation VMCarrierBundleClient

- (VMCarrierBundleClient)initWithTelephonyClient:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VMCarrierBundleClient;
  v8 = [(VMCarrierBundleClient *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(VMCarrierBundleClient *)v8 setTelephonyClient:v6];
    [(VMCarrierBundleClient *)v9 setQueue:v7];
    [v6 addDelegate:v9 queue:v7];
    v10 = objc_opt_new();
    [(VMCarrierBundleClient *)v9 setValues:v10];

    v9->_accessorLock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (void)dealloc
{
  v3 = [(VMCarrierBundleClient *)self telephonyClient];
  [v3 removeDelegate:self];

  v4.receiver = self;
  v4.super_class = (Class)VMCarrierBundleClient;
  [(VMCarrierBundleClient *)&v4 dealloc];
}

- (BOOL)isGreetingChangeSupportedForSubscription:(id)a3
{
  v3 = [(VMCarrierBundleClient *)self cbValueForKey:@"VVMGreetingChangesSupported" subscription:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (double)maximumGreetingDurationForSubscription:(id)a3
{
  v3 = [(VMCarrierBundleClient *)self cbValueForDomain:@"com.apple.voicemail.imap" key:@"MaxGreetingDuration" subscription:a3];
  objc_opt_class();
  double v4 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v4 = v5;
  }

  return v4;
}

- (BOOL)isPasswordChangeSupportedForDefaultSubscription
{
  v3 = [(VMCarrierBundleClient *)self telephonyClient];
  double v4 = [v3 contexts];

  double v5 = [v4 voicePreferred];
  id v6 = [v4 findForUuid:v5];

  if (v6)
  {
    id v7 = [v6 context];
    BOOL v8 = [(VMCarrierBundleClient *)self isPasswordChangeSupportedForSubscription:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isPasswordChangeSupportedForSubscription:(id)a3
{
  v3 = [(VMCarrierBundleClient *)self cbValueForKey:@"VVMPasswordChangesSupported" subscription:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (id)serviceNameForSubscription:(id)a3
{
  v3 = [(VMCarrierBundleClient *)self cbValueForKey:@"VisualVoicemailServiceName" subscription:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)isServiceSupportedForSubscription:(id)a3
{
  id v4 = a3;
  double v5 = [(VMCarrierBundleClient *)self cbValueForKey:@"SupportsVoicemail" subscription:v4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v5 BOOLValue])
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    id v6 = [(VMCarrierBundleClient *)self cbValueForKey:@"ShouldHideAllVoicemailUI" subscription:v4];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned int v7 = [v6 BOOLValue] ^ 1;
    }
    else {
      LOBYTE(v7) = 1;
    }
    double v5 = v6;
  }

  return v7;
}

- (id)valuesForContext:(id)a3
{
  id v4 = a3;
  double v5 = [(VMCarrierBundleClient *)self values];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v6 = objc_opt_new();
    unsigned int v7 = [(VMCarrierBundleClient *)self values];
    [v7 setObject:v6 forKey:v4];
  }
  return v6;
}

- (id)cbValueForKey:(id)a3 subscription:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock_with_options();
  v10 = [v8 uuid];
  v11 = [(VMCarrierBundleClient *)self valuesForContext:v10];

  objc_super v12 = [v11 objectForKey:v7];
  if (!v12)
  {
    v13 = [(VMCarrierBundleClient *)self telephonyClient];
    id v28 = v7;
    v14 = +[NSArray arrayWithObjects:&v28 count:1];
    id v21 = 0;
    objc_super v12 = [v13 context:v8 getCarrierBundleValue:v14 error:&v21];
    id v15 = v21;

    if (v15)
    {
      v16 = vm_vmd_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_opt_class();
        id v19 = v18;
        v20 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v23 = v18;
        __int16 v24 = 2112;
        v25 = v20;
        __int16 v26 = 2112;
        id v27 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", buf, 0x20u);
      }
    }
    else
    {
      if (!v12) {
        goto LABEL_6;
      }
      [v11 setObject:v12 forKey:v7];
      v16 = vm_vmd_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "fetched CB key:%@", buf, 0xCu);
      }
    }

LABEL_6:
  }
  os_unfair_lock_unlock(p_accessorLock);

  return v12;
}

- (id)cbValueForDomain:(id)a3 key:(id)a4 subscription:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock_with_options();
  v13 = [v11 uuid];
  v14 = [(VMCarrierBundleClient *)self valuesForContext:v13];

  id v15 = [v14 objectForKey:v9];
  if (v15)
  {
    v16 = v15;
    v17 = [v15 objectForKey:v10];
    if (v17) {
      goto LABEL_11;
    }
  }
  else
  {
    v16 = objc_opt_new();
    [v14 setValue:v16 forKey:v9];
  }
  aSelector = a2;
  id v27 = &self->_accessorLock;
  v18 = [(VMCarrierBundleClient *)self telephonyClient];
  v35[0] = v9;
  v35[1] = v10;
  id v19 = +[NSArray arrayWithObjects:v35 count:2];
  id v28 = 0;
  v17 = [v18 context:v11 getCarrierBundleValue:v19 error:&v28];
  id v20 = v28;

  if (v20)
  {
    id v21 = vm_vmd_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v23 = objc_opt_class();
      id v25 = v23;
      __int16 v24 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138412802;
      id v30 = v23;
      __int16 v31 = 2112;
      id v32 = v24;
      __int16 v33 = 2112;
      id v34 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", buf, 0x20u);
    }
    p_accessorLock = v27;
  }
  else
  {
    p_accessorLock = &self->_accessorLock;
    if (!v17) {
      goto LABEL_10;
    }
    [v16 setValue:v17 forKey:v10];
    id v21 = vm_vmd_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v10;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "fetched CB key:%@ domain:%@", buf, 0x16u);
    }
  }

LABEL_10:
LABEL_11:
  os_unfair_lock_unlock(p_accessorLock);

  return v17;
}

- (BOOL)isServiceSupportedOnInternetForSubscription:(id)a3
{
  id v4 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock_with_options();
  id v6 = [(VMCarrierBundleClient *)self telephonyClient];
  id v7 = [v4 context];
  CFStringRef v23 = @"AllowedServicesTypeMaskOnInternet";
  id v8 = +[NSArray arrayWithObjects:&v23 count:1];
  id v16 = 0;
  id v9 = [v6 context:v7 getCarrierBundleValue:v8 error:&v16];
  id v10 = v16;

  id v11 = vm_vmd_log();
  objc_super v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100080540((uint64_t)v4, (uint64_t)v10, v12);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v18 = @"AllowedServicesTypeMaskOnInternet";
      __int16 v19 = 2112;
      CFStringRef v20 = v9;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Retrieved carrier bundle key %@ value %@ for context %@", buf, 0x20u);
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      LODWORD(v12) = ([(__CFString *)v9 unsignedIntValue] >> 1) & 1;
      goto LABEL_5;
    }
    objc_super v12 = vm_vmd_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (__CFString *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      CFStringRef v18 = v14;
      __int16 v19 = 2112;
      CFStringRef v20 = @"AllowedServicesTypeMaskOnInternet";
      id v15 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Invalid type <%@> for carrier bundle key %@", buf, 0x16u);
    }
  }

  LOBYTE(v12) = 0;
LABEL_5:
  os_unfair_lock_unlock(p_accessorLock);

  return (char)v12;
}

- (void)carrierBundleChange:(id)a3
{
  id v4 = a3;
  double v5 = [(VMCarrierBundleClient *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = vm_vmd_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ received carrier bundle change callback for context %@", (uint8_t *)&v10, 0x16u);
  }

  id v7 = [(VMCarrierBundleClient *)self values];
  id v8 = objc_opt_new();
  id v9 = [v4 uuid];
  [v7 setObject:v8 forKey:v9];
}

- (VMTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
}

@end