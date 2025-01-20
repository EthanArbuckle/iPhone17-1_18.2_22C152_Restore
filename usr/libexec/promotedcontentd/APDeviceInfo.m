@interface APDeviceInfo
+ (APDeviceInfo)current;
- (APDeviceInfo)init;
- (APTelephony)telephony;
- (BOOL)educationModeEnabled;
- (BOOL)networkDataValid;
- (BOOL)personalizedAdsAcknowledged;
- (BOOL)personalizedAdsEnabled;
- (BOOL)telephonyDataValid;
- (NSNumber)signalStrength;
- (NSString)buildVersion;
- (NSString)deviceModel;
- (NSString)osVersionAndBuild;
- (NSString)systemName;
- (NSString)systemVersion;
- (id)notificationObject;
- (id)userAgentStringForBundleID:(id)a3 storefront:(id)a4;
- (int64_t)connectionType;
- (void)_retrievePersonalizedAdsValue;
- (void)setNotificationObject:(id)a3;
- (void)setPersonalizedAdsEnabled:(BOOL)a3;
- (void)setTelephony:(id)a3;
@end

@implementation APDeviceInfo

+ (APDeviceInfo)current
{
  if (qword_100289708 != -1) {
    dispatch_once(&qword_100289708, &stru_100234A40);
  }
  v2 = (void *)qword_100289700;

  return (APDeviceInfo *)v2;
}

- (APDeviceInfo)init
{
  v14.receiver = self;
  v14.super_class = (Class)APDeviceInfo;
  v2 = [(APDeviceInfo *)&v14 init];
  if (v2)
  {
    uint64_t v3 = +[APTelephony telephony];
    telephony = v2->_telephony;
    v2->_telephony = (APTelephony *)v3;

    [(APDeviceInfo *)v2 _retrievePersonalizedAdsValue];
    objc_initWeak(&location, v2);
    v5 = +[NSDistributedNotificationCenter defaultCenter];
    uint64_t v6 = kAPAccountChangedNotification;
    uint64_t v7 = kAPAdLibBundleID;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100082408;
    v11[3] = &unk_100234A68;
    objc_copyWeak(&v12, &location);
    uint64_t v8 = [v5 addObserverForName:v6 object:v7 queue:0 usingBlock:v11];
    id notificationObject = v2->_notificationObject;
    v2->_id notificationObject = (id)v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)_retrievePersonalizedAdsValue
{
  id v3 = objc_alloc_init((Class)ADTrackingTransparency);
  -[APDeviceInfo setPersonalizedAdsEnabled:](self, "setPersonalizedAdsEnabled:", [v3 personalizedAds]);
  self->_personalizedAdsAcknowledged = (uint64_t)[v3 acknowledgedVersionForPersonalizedAds] > 0;
}

- (NSString)deviceModel
{
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")&& (+[APDeviceInfoSettings settings](APDeviceInfoSettings, "settings"), v2 = objc_claimAutoreleasedReturnValue(), [v2 deviceTypeOverride], id v3 = objc_claimAutoreleasedReturnValue(), v3, v2, v3))
  {
    v4 = +[APDeviceInfoSettings settings];
    v5 = [v4 deviceTypeOverride];
  }
  else
  {
    v5 = +[APSystemInfo deviceModel];
  }

  return (NSString *)v5;
}

- (NSString)systemName
{
  return (NSString *)+[APSystemInfo osName];
}

- (NSString)systemVersion
{
  return (NSString *)+[APSystemInfo osVersion];
}

- (NSString)buildVersion
{
  return (NSString *)+[APSystemInfo longBuildVersion];
}

- (NSString)osVersionAndBuild
{
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")&& (+[APDeviceInfoSettings settings](APDeviceInfoSettings, "settings"), v2 = objc_claimAutoreleasedReturnValue(), [v2 osVersionOverride], id v3 = objc_claimAutoreleasedReturnValue(), v3, v2, v3))
  {
    v4 = +[APDeviceInfoSettings settings];
    v5 = [v4 osVersionOverride];
  }
  else
  {
    v5 = +[APSystemInfo systemDescription];
  }

  return (NSString *)v5;
}

- (id)userAgentStringForBundleID:(id)a3 storefront:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(APDeviceInfo *)self deviceModel];
  v9 = [(APDeviceInfo *)self osVersionAndBuild];
  v10 = +[NSString stringWithFormat:@"%@; %@; %@; %@", v8, v9, v7, v6];

  return v10;
}

- (BOOL)educationModeEnabled
{
  v2 = +[UMUserManager sharedManager];
  unsigned __int8 v3 = [v2 isSharedIPad];

  return v3;
}

- (int64_t)connectionType
{
  if (![(APTelephony *)self->_telephony networkDataValid]) {
    return -1;
  }
  telephony = self->_telephony;

  return [(APTelephony *)telephony networkType];
}

- (NSNumber)signalStrength
{
  return [(APTelephony *)self->_telephony signalStrength];
}

- (BOOL)networkDataValid
{
  return [(APTelephony *)self->_telephony networkDataValid];
}

- (BOOL)telephonyDataValid
{
  return [(APTelephony *)self->_telephony telephonyDataValid];
}

- (BOOL)personalizedAdsAcknowledged
{
  if (self->_personalizedAdsAcknowledged) {
    return 1;
  }
  id v4 = objc_alloc_init((Class)ADTrackingTransparency);
  self->_personalizedAdsAcknowledged = (uint64_t)[v4 acknowledgedVersionForPersonalizedAds] > 0;

  return self->_personalizedAdsAcknowledged;
}

- (BOOL)personalizedAdsEnabled
{
  return self->_personalizedAdsEnabled;
}

- (void)setPersonalizedAdsEnabled:(BOOL)a3
{
  self->_personalizedAdsEnabled = a3;
}

- (APTelephony)telephony
{
  return (APTelephony *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTelephony:(id)a3
{
}

- (id)notificationObject
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setNotificationObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationObject, 0);

  objc_storeStrong((id *)&self->_telephony, 0);
}

@end