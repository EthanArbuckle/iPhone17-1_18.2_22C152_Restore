@interface NSPDeviceIdentityCertificate
+ (BOOL)deviceSupportsDeviceIdentityWithSerialNumber;
+ (BOOL)supportsSecureCoding;
+ (id)sharedDeviceIdentity;
+ (void)removeFromPreferences;
- (NSPDeviceIdentityCertificate)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)deviceIdentityAuthenticationFailed;
- (void)encodeWithCoder:(id)a3;
- (void)resetDeviceIdentityInfo;
- (void)signData:(id)a3 andFetchDeviceIdentityCertificate:(id)a4;
@end

@implementation NSPDeviceIdentityCertificate

- (id)description
{
  if (self)
  {
    id v3 = [objc_alloc((Class)NSMutableString) initWithCapacity:0];
    v4 = +[NSDateFormatter localizedStringFromDate:self->_deviceIdentityFetchDate dateStyle:1 timeStyle:2];
    sub_1000482D4(v3, v4, @"Device Identity Fetch Date", 0, 14);

    sub_1000482D4(v3, self->_deviceIdentityRetryCount, @"Device Identity Retry Count", 0, 14);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[NSPDeviceIdentityCertificate allocWithZone:a3] init];
  p_isa = (id *)&v4->super.isa;
  if (self)
  {
    v4->_diskVersion = self->_diskVersion;
    deviceIdentityFetchDate = self->_deviceIdentityFetchDate;
  }
  else
  {
    deviceIdentityFetchDate = 0;
    v4->_diskVersion = 0;
  }
  objc_storeStrong((id *)&v4->_deviceIdentityFetchDate, deviceIdentityFetchDate);
  if (self) {
    deviceIdentityRetryCount = self->_deviceIdentityRetryCount;
  }
  else {
    deviceIdentityRetryCount = 0;
  }
  objc_storeStrong(p_isa + 4, deviceIdentityRetryCount);
  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPDeviceIdentityCertificate)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NSPDeviceIdentityCertificate;
  v5 = [(NSPDeviceIdentityCertificate *)&v14 init];
  if (v5)
  {
    v5->_diskVersion = (int64_t)[v4 decodeIntegerForKey:@"DiskVersion"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceIdentityFetchDate"];
    deviceIdentityFetchDate = v5->_deviceIdentityFetchDate;
    v5->_deviceIdentityFetchDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceIdentityRetryCount"];
    deviceIdentityRetryCount = v5->_deviceIdentityRetryCount;
    v5->_deviceIdentityRetryCount = (NSNumber *)v8;

    v10 = v5;
  }
  else
  {
    v12 = nplog_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "[super init] failed", v13, 2u);
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:1 forKey:@"DiskVersion"];
  if (self)
  {
    [v5 encodeObject:self->_deviceIdentityFetchDate forKey:@"DeviceIdentityFetchDate"];
    deviceIdentityRetryCount = self->_deviceIdentityRetryCount;
  }
  else
  {
    [v5 encodeObject:0 forKey:@"DeviceIdentityFetchDate"];
    deviceIdentityRetryCount = 0;
  }
  [v5 encodeObject:deviceIdentityRetryCount forKey:@"DeviceIdentityRetryCount"];
}

+ (void)removeFromPreferences
{
  _CFPreferencesSetFileProtectionClass();
  CFPreferencesSetAppValue(@"DeviceIdentityInfo", 0, kCFPreferencesCurrentApplication);
  int v2 = CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
  id v3 = nplog_obj();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removed device identity info from preference file", v5, 2u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to remove device identity info from preference file", buf, 2u);
  }
}

+ (BOOL)deviceSupportsDeviceIdentityWithSerialNumber
{
  return _DeviceIdentityIsSupported(a1, a2);
}

+ (id)sharedDeviceIdentity
{
  if (qword_100123208 != -1) {
    dispatch_once(&qword_100123208, &stru_100105EA0);
  }
  int v2 = (void *)qword_100123200;

  return v2;
}

- (void)resetDeviceIdentityInfo
{
  if (self)
  {
    id v3 = self->_deviceIdentityFetchDate;
    if (v3)
    {
      BOOL v4 = 1;
      goto LABEL_6;
    }
    deviceIdentityRetryCount = self->_deviceIdentityRetryCount;
  }
  else
  {
    deviceIdentityRetryCount = 0;
  }
  id v3 = 0;
  BOOL v4 = deviceIdentityRetryCount != 0;
LABEL_6:

  sub_10001088C((uint64_t)self, 0);
  sub_100022CA0((uint64_t)self, 0);
  if (self) {
    self->_ignoreExistingKeychainIdentity = 0;
  }
  if (v4)
  {
    sub_100050FE8(self);
  }
}

- (void)deviceIdentityAuthenticationFailed
{
  if (self) {
    self->_ignoreExistingKeychainIdentity = 1;
  }
}

- (void)signData:(id)a3 andFetchDeviceIdentityCertificate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self
    || (uint64_t v8 = self->_deviceIdentityFetchDate) == 0
    || (v9 = v8,
        [(NSDate *)self->_deviceIdentityFetchDate timeIntervalSinceNow],
        double v11 = v10,
        v9,
        v11 <= 0.0))
  {
LABEL_12:
    v35[0] = kMAOptionsBAAValidity;
    v35[1] = kMAOptionsBAASCRTAttestation;
    v36[0] = &off_10010F670;
    v36[1] = &off_10010F688;
    v35[2] = kMAOptionsBAAOIDSToInclude;
    v34[0] = kMAOptionsBAAOIDUCRTDeviceIdentifiers;
    v34[1] = kMAOptionsBAAOIDDeviceIdentifiers;
    v34[2] = kMAOptionsBAAOIDDeviceOSInformation;
    v20 = +[NSArray arrayWithObjects:v34 count:3];
    v36[2] = v20;
    v35[3] = kMAOptionsBAANetworkTimeoutInterval;
    v35[4] = kMAOptionsBAAKeychainLabel;
    v36[3] = &off_10010F6A0;
    v36[4] = @"PrivacyProxy";
    v35[5] = kMAOptionsBAADeleteDuplicateKeychainItems;
    v36[5] = &off_10010F6B8;
    v21 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:6];

    if (qword_1001231F8 != -1) {
      dispatch_once(&qword_1001231F8, &stru_100105E80);
    }
    if (byte_1001231F0 == 1)
    {
      objc_initWeak((id *)buf, self);
      v22 = +[NSMutableDictionary dictionaryWithDictionary:v21];
      [v22 setObject:&off_10010F6B8 forKeyedSubscript:kMAOptionsBAASkipNetworkRequest];
      v23 = NPGetInternalQueue();
      v31[1] = _NSConcreteStackBlock;
      v31[2] = (id)3221225472;
      v31[3] = sub_100051C38;
      v31[4] = &unk_100105EC8;
      objc_copyWeak(&v33, (id *)buf);
      id v32 = v7;
      DeviceIdentityCreateHostSignatureWithCompletion();

      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (self && self->_ignoreExistingKeychainIdentity)
      {
        v28 = +[NSMutableDictionary dictionaryWithDictionary:v21];
        [v28 setObject:&off_10010F6B8 forKeyedSubscript:kMAOptionsBAAIgnoreExistingKeychainItems];
        self->_ignoreExistingKeychainIdentity = 0;
      }
      objc_initWeak((id *)buf, self);
      v24 = NPGetInternalQueue();
      objc_copyWeak(v31, (id *)buf);
      id v29 = v6;
      id v30 = v7;
      DeviceIdentityIssueClientCertificateWithCompletion();

      objc_destroyWeak(v31);
      objc_destroyWeak((id *)buf);
    }

    goto LABEL_21;
  }
  v12 = self->_deviceIdentityRetryCount;
  if (!v12
    || (v13 = v12,
        unsigned int v14 = [(NSNumber *)self->_deviceIdentityRetryCount unsignedIntValue],
        v13,
        v14 <= 4))
  {
    v15 = nplog_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = [(NSNumber *)self->_deviceIdentityRetryCount unsignedIntValue];
      *(_DWORD *)buf = 67109120;
      LODWORD(v38) = v16 + 1;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "previously failed to fetch device identity, allowing retry %u", buf, 8u);
    }

    v17 = +[NSNumber numberWithUnsignedInt:[(NSNumber *)self->_deviceIdentityRetryCount unsignedIntValue] + 1];
    deviceIdentityRetryCount = self->_deviceIdentityRetryCount;
    self->_deviceIdentityRetryCount = v17;

    if ((sub_100050FE8(self) & 1) == 0)
    {
      v19 = nplog_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to write device identity info to file", buf, 2u);
      }
    }
    goto LABEL_12;
  }
  v25 = nplog_obj();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = self->_deviceIdentityFetchDate;
    v27 = +[NSDateFormatter localizedStringFromDate:v26 dateStyle:1 timeStyle:2];
    *(_DWORD *)buf = 138412290;
    v38 = v27;
    _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "deferring fetching device identity until %@", buf, 0xCu);
  }
  (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
LABEL_21:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentityRetryCount, 0);

  objc_storeStrong((id *)&self->_deviceIdentityFetchDate, 0);
}

@end