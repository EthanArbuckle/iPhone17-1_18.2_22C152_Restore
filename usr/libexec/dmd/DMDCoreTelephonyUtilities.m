@interface DMDCoreTelephonyUtilities
+ (BOOL)_supportsVoiceRoaming;
+ (BOOL)dataRoamingEnabled;
+ (BOOL)hasCDMA;
+ (BOOL)hasGSM;
+ (BOOL)isRoaming;
+ (BOOL)isSubscriptionRoaming:(id)a3 client:(id)a4;
+ (BOOL)voiceRoamingEnabled;
+ (NSString)ICCID;
+ (NSString)IMEI;
+ (NSString)MEID;
+ (NSString)carrierBundleVersion;
+ (NSString)carrierName;
+ (NSString)currentMobileCountryCode;
+ (NSString)currentMobileNetworkCode;
+ (NSString)currentNetworkName;
+ (NSString)modemFirmwareVersion;
+ (id)formattedICCIDStringFromString:(id)a3;
+ (id)formattedIMEIStringFromString:(id)a3;
+ (void)setDataRoamingEnabled:(BOOL)a3;
+ (void)setVoiceRoamingEnabled:(BOOL)a3;
+ (void)withCurrentDataServiceDescriptorDo:(id)a3;
@end

@implementation DMDCoreTelephonyUtilities

+ (id)formattedIMEIStringFromString:(id)a3
{
  if (a3)
  {
    v3 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:");
    if ((unint64_t)[v3 length] >= 3) {
      [v3 insertString:@" " atIndex:2];
    }
    if ((unint64_t)[v3 length] >= 0xA) {
      [v3 insertString:@" " atIndex:9];
    }
    if ((unint64_t)[v3 length] >= 0x11) {
      [v3 insertString:@" " atIndex:16];
    }
    id v4 = [v3 copy];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)formattedICCIDStringFromString:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[NSMutableString stringWithString:v3];
    if ((unint64_t)[v3 length] >= 4 && (unint64_t)objc_msgSend(v3, "length") >= 5)
    {
      int v5 = 0;
      unint64_t v6 = 4;
      do
      {
        if ((unint64_t)[v3 length] > v6)
        {
          [v4 insertString:@" " atIndex:(v5 + v6)];
          ++v5;
        }
        unint64_t v6 = (v6 + 4);
      }
      while ((unint64_t)[v3 length] > v6);
    }
    id v7 = [v4 copy];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (NSString)IMEI
{
  id v3 = sub_100037628();
  id v4 = [v3 IMEI];

  if ([v4 length])
  {
    int v5 = [a1 formattedIMEIStringFromString:v4];
  }
  else
  {
    int v5 = 0;
  }

  return (NSString *)v5;
}

+ (NSString)MEID
{
  if (qword_1000FBAB0 != -1) {
    dispatch_once(&qword_1000FBAB0, &stru_1000CACD0);
  }
  v2 = (void *)qword_1000FBAA8;

  return (NSString *)v2;
}

+ (NSString)modemFirmwareVersion
{
  if (+[DMDMobileGestalt hasCellularDataCapability])
  {
    if (qword_1000FBAC0 != -1) {
      dispatch_once(&qword_1000FBAC0, &stru_1000CACF0);
    }
    id v2 = (id)qword_1000FBAB8;
  }
  else
  {
    id v2 = 0;
  }

  return (NSString *)v2;
}

+ (NSString)ICCID
{
  if (+[DMDMobileGestalt hasCellularDataCapability])
  {
    id v3 = sub_100037628();
    id v4 = [v3 ICCID];

    if ([v4 length])
    {
      int v5 = [a1 formattedICCIDStringFromString:v4];
    }
    else
    {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = 0;
  }

  return (NSString *)v5;
}

+ (NSString)currentNetworkName
{
  if (!+[DMDMobileGestalt hasCellularDataCapability])
  {
    id v6 = 0;
    goto LABEL_13;
  }
  id v2 = sub_100037C7C();
  id v3 = sub_100037CD0(v2);
  if (v3)
  {
    id v8 = 0;
    id v4 = [v2 getLocalizedOperatorName:v3 error:&v8];
    id v5 = v8;
    if (v4)
    {
      if ([v4 length])
      {
        id v6 = v4;
LABEL_11:

        goto LABEL_12;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100082BAC();
    }
    id v6 = 0;
    goto LABEL_11;
  }
  id v6 = 0;
LABEL_12:

LABEL_13:

  return (NSString *)v6;
}

+ (NSString)carrierName
{
  id v2 = sub_100037C7C();
  id v3 = sub_100037CD0(v2);
  id v4 = [objc_alloc((Class)CTBundle) initWithBundleType:1];
  id v8 = 0;
  id v5 = [v2 copyCarrierBundleValue:v3 key:@"CarrierName" bundleType:v4 error:&v8];
  id v6 = v8;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100082C64();
  }

  return (NSString *)v5;
}

+ (NSString)carrierBundleVersion
{
  id v2 = sub_100037C7C();
  id v3 = sub_100037CD0(v2);
  if (v3)
  {
    id v8 = 0;
    id v4 = [v2 copyCarrierBundleVersion:v3 error:&v8];
    id v5 = v8;
    if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100082CD4();
    }
    id v6 = v4;
  }
  else
  {
    id v6 = 0;
  }

  return (NSString *)v6;
}

+ (NSString)currentMobileCountryCode
{
  if (!+[DMDMobileGestalt hasCellularDataCapability]) {
    goto LABEL_11;
  }
  id v2 = sub_100037C7C();
  uint64_t v3 = sub_100037CD0(v2);
  if (!v3)
  {
LABEL_10:

LABEL_11:
    id v5 = 0;
    goto LABEL_12;
  }
  id v4 = (void *)v3;
  id v8 = 0;
  id v5 = [v2 copyMobileCountryCode:v3 error:&v8];
  id v6 = v8;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100082D44();
    }

    goto LABEL_10;
  }
  if (![v5 length])
  {

    id v5 = 0;
  }

LABEL_12:

  return (NSString *)v5;
}

+ (NSString)currentMobileNetworkCode
{
  if (!+[DMDMobileGestalt hasCellularDataCapability]) {
    goto LABEL_11;
  }
  id v2 = sub_100037C7C();
  uint64_t v3 = sub_100037CD0(v2);
  if (!v3)
  {
LABEL_10:

LABEL_11:
    id v5 = 0;
    goto LABEL_12;
  }
  id v4 = (void *)v3;
  id v8 = 0;
  id v5 = [v2 copyMobileNetworkCode:v3 error:&v8];
  id v6 = v8;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100082DB4();
    }

    goto LABEL_10;
  }
  if (![v5 length])
  {

    id v5 = 0;
  }

LABEL_12:

  return (NSString *)v5;
}

+ (BOOL)dataRoamingEnabled
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  if (+[DMDMobileGestalt hasCellularDataCapability])
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100038334;
    v4[3] = &unk_1000CAD18;
    v4[4] = &v5;
    [(id)objc_opt_class() withCurrentDataServiceDescriptorDo:v4];
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (void)setDataRoamingEnabled:(BOOL)a3
{
  if (+[DMDMobileGestalt hasCellularDataCapability])
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000384B8;
    v4[3] = &unk_1000CAD38;
    BOOL v5 = a3;
    [(id)objc_opt_class() withCurrentDataServiceDescriptorDo:v4];
  }
}

+ (void)withCurrentDataServiceDescriptorDo:(id)a3
{
  BOOL v5 = (void (**)(id, void *, id))a3;
  if (!v5)
  {
    v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"DMDCoreTelephonyUtilities+iphoneOS-tvOS.m" lineNumber:451 description:@"block parameter to withCurrentDataServiceDescriptionDo: was nil"];
  }
  id v6 = sub_100037C7C();
  id v10 = 0;
  uint64_t v7 = [v6 getCurrentDataServiceDescriptorSync:&v10];
  id v8 = v10;
  v5[2](v5, v7, v8);
}

+ (BOOL)isSubscriptionRoaming:(id)a3 client:(id)a4
{
  id v8 = 0;
  id v4 = [a4 copyRegistrationStatus:a3 error:&v8];
  id v5 = v8;
  if (v4)
  {
    unsigned __int8 v6 = [v4 isEqualToString:kCTRegistrationStatusRegisteredRoaming];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100082FE4((uint64_t)v5);
    }
    unsigned __int8 v6 = 0;
  }

  return v6;
}

+ (BOOL)isRoaming
{
  BOOL v2 = +[DMDMobileGestalt hasCellularDataCapability];
  if (v2)
  {
    uint64_t v3 = sub_100037C7C();
    id v4 = sub_100037CD0(v3);
    unsigned __int8 v5 = [(id)objc_opt_class() isSubscriptionRoaming:v4 client:v3];

    LOBYTE(v2) = v5;
  }
  return v2;
}

+ (BOOL)voiceRoamingEnabled
{
  if (![a1 _supportsVoiceRoaming]) {
    return 0;
  }
  uint64_t v2 = _CTServerConnectionCreate();
  if (!v2) {
    return 0;
  }
  uint64_t v3 = (const void *)v2;
  BOOL v4 = (unint64_t)_CTServerConnectionGetEnableOnlyHomeNetwork() >> 32 == 0;
  CFRelease(v3);
  return v4;
}

+ (void)setVoiceRoamingEnabled:(BOOL)a3
{
  int v3 = a3;
  if ([a1 _supportsVoiceRoaming])
  {
    if ([a1 voiceRoamingEnabled] == v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100083078(v3);
      }
    }
    else
    {
      uint64_t v5 = _CTServerConnectionCreate();
      if (v5)
      {
        unsigned __int8 v6 = (const void *)v5;
        _CTServerConnectionSetEnableOnlyHomeNetwork();
        CFRelease(v6);
      }
    }
  }
}

+ (BOOL)hasGSM
{
  uint64_t v2 = [a1 IMEI];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (BOOL)hasCDMA
{
  uint64_t v2 = [a1 MEID];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (BOOL)_supportsVoiceRoaming
{
  if (!+[DMDMobileGestalt hasTelephonyCapability])
  {
    unsigned int v7 = 0;
    goto LABEL_12;
  }
  uint64_t v2 = sub_100037C7C();
  BOOL v3 = sub_100037CD0(v2);
  id v4 = [objc_alloc((Class)CTBundle) initWithBundleType:1];
  id v11 = 0;
  id v5 = [v2 copyCarrierBundleValue:v3 key:@"ShowVoiceRoamingSwitch" bundleType:v4 error:&v11];
  id v6 = v11;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v7 = [v5 BOOLValue];
      int v8 = 1;
      goto LABEL_11;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100083168();
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000830F8();
  }
  int v8 = 0;
  unsigned int v7 = 0;
LABEL_11:

  if (!v8)
  {
    LOBYTE(v7) = 0;
    return v7;
  }
LABEL_12:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    CFStringRef v9 = @"NO";
    if (v7) {
      CFStringRef v9 = @"YES";
    }
    *(_DWORD *)buf = 138543362;
    CFStringRef v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "device supports voice roaming: %{public}@", buf, 0xCu);
  }
  return v7;
}

@end