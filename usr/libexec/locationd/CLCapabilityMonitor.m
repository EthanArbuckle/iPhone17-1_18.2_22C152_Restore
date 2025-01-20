@interface CLCapabilityMonitor
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)hasCapability:(id)a3;
- (BOOL)iCloudManagedAppleID;
- (BOOL)iTunesManagedAppleID;
- (BOOL)installedEducationProfile;
- (BOOL)stewieSupported;
- (BOOL)supervised;
- (BOOL)syncgetForceCacheUpdate;
- (CLCapabilityMonitor)init;
- (NSMutableSet)capabilityChangeClients;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)onCapabilityChange;
- (void)onDarwinNotification:(int)a3 data:(id)a4;
- (void)onTelephonyNotification:(int)a3 data:(void *)a4;
- (void)setCapabilityChangeClients:(id)a3;
- (void)setICloudManagedAppleID:(BOOL)a3;
- (void)setITunesManagedAppleID:(BOOL)a3;
- (void)setInstalledEducationProfile:(BOOL)a3;
- (void)setStewieSupported:(BOOL)a3;
- (void)setSupervised:(BOOL)a3;
- (void)startMonitoringCapabilityChangeForClient:(id)a3;
- (void)stopMonitoringCapabilityChangeForClient:(id)a3;
- (void)updateICloudManagedAppleID;
- (void)updateITunesManagedAppleID;
- (void)updateInstalledEducationProfile;
- (void)updateLocationDictionaryCachedCapabilities;
- (void)updateSupervised;
@end

@implementation CLCapabilityMonitor

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_102480A78 != -1) {
    dispatch_once(&qword_102480A78, &stru_1022F12E0);
  }
  return (id)qword_102480A70;
}

- (CLCapabilityMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLCapabilityMonitor;
  return [(CLCapabilityMonitor *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLCapabilityMonitorServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLCapabilityMonitorClientProtocol];
}

- (void)beginService
{
}

- (void)endService
{
  [self universe].silo
  value = self->_darwinClient.__ptr_.__value_;
  self->_darwinClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }
  v4 = self->_telephonyClient.__ptr_.__value_;
  self->_telephonyClient.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(Client *))(*(void *)v4 + 8))(v4);
  }
  [(CLCapabilityMonitor *)self setSupervised:0];
  [(CLCapabilityMonitor *)self setICloudManagedAppleID:0];
  [(CLCapabilityMonitor *)self setITunesManagedAppleID:0];
  [(CLCapabilityMonitor *)self setInstalledEducationProfile:0];
  [(CLCapabilityMonitor *)self setCapabilityChangeClients:0];

  [(CLCapabilityMonitor *)self setStewieSupported:0];
}

- (void)updateSupervised
{
  [self universe].silo
  if (objc_opt_class()) {
    id v3 = [[+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection") isSupervised];
  }
  else {
    id v3 = 0;
  }

  [(CLCapabilityMonitor *)self setSupervised:v3];
}

- (void)setSupervised:(BOOL)a3
{
  BOOL v3 = a3;
  [self universe].silo
  if (self->_supervised != v3)
  {
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_1022F1408);
    }
    unint64_t v5 = qword_102419638;
    if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEBUG))
    {
      BOOL supervised = self->_supervised;
      *(_DWORD *)buf = 67109376;
      BOOL v9 = supervised;
      __int16 v10 = 1024;
      BOOL v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "supervised capability changed from, %d, to, %d", buf, 0xEu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_1022F1408);
      }
      v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCapabilityMonitor setSupervised:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    self->_BOOL supervised = v3;
    [(CLCapabilityMonitor *)self onCapabilityChange];
  }
}

- (void)updateICloudManagedAppleID
{
  [self universe].silo
  if (objc_opt_class())
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100CA93AC;
    v3[3] = &unk_1022F1358;
    id v4 = objc_alloc_init((Class)ACAccountStore);
    unint64_t v5 = self;
    [v4 accountTypeWithIdentifier:ACAccountTypeIdentifierAppleAccount completion:v3];
  }
}

- (void)setICloudManagedAppleID:(BOOL)a3
{
  BOOL v3 = a3;
  [self universe].silo
  if (self->_iCloudManagedAppleID != v3)
  {
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_1022F1408);
    }
    unint64_t v5 = qword_102419638;
    if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEBUG))
    {
      BOOL iCloudManagedAppleID = self->_iCloudManagedAppleID;
      *(_DWORD *)buf = 67109376;
      BOOL v9 = iCloudManagedAppleID;
      __int16 v10 = 1024;
      BOOL v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "iCloud managed apple ID capability changed from, %d, to, %d", buf, 0xEu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_1022F1408);
      }
      v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCapabilityMonitor setICloudManagedAppleID:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    self->_BOOL iCloudManagedAppleID = v3;
    [(CLCapabilityMonitor *)self onCapabilityChange];
  }
}

- (void)updateInstalledEducationProfile
{
  [self universe].silo
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  if (objc_opt_class())
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100CA98CC;
    v3[3] = &unk_1022F13A8;
    void v3[4] = &v4;
    [[+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection") installedProfileIdentifiers] enumerateObjectsUsingBlock:v3];
  }
  [(CLCapabilityMonitor *)self setInstalledEducationProfile:*((unsigned __int8 *)v5 + 24)];
  _Block_object_dispose(&v4, 8);
}

- (void)setInstalledEducationProfile:(BOOL)a3
{
  BOOL v3 = a3;
  [self universe].silo
  if (self->_installedEducationProfile != v3)
  {
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_1022F1408);
    }
    unint64_t v5 = qword_102419638;
    if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEBUG))
    {
      BOOL installedEducationProfile = self->_installedEducationProfile;
      *(_DWORD *)buf = 67109376;
      BOOL v9 = installedEducationProfile;
      __int16 v10 = 1024;
      BOOL v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "installed education profile capability changed from, %d, to, %d", buf, 0xEu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_1022F1408);
      }
      char v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCapabilityMonitor setInstalledEducationProfile:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    self->_BOOL installedEducationProfile = v3;
    [(CLCapabilityMonitor *)self onCapabilityChange];
  }
}

- (void)updateITunesManagedAppleID
{
  [self universe].silo
  if (&_SSActiveAccountIsManagedAppleID)
  {
    uint64_t IsManagedAppleID = SSActiveAccountIsManagedAppleID();
    [(CLCapabilityMonitor *)self setITunesManagedAppleID:IsManagedAppleID];
  }
}

- (void)setITunesManagedAppleID:(BOOL)a3
{
  BOOL v3 = a3;
  [[-[CLCapabilityMonitor universe](self, "universe") silo];
  if (self->_iTunesManagedAppleID != v3)
  {
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_1022F1408);
    }
    unint64_t v5 = qword_102419638;
    if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEBUG))
    {
      BOOL iTunesManagedAppleID = self->_iTunesManagedAppleID;
      *(_DWORD *)buf = 67109376;
      BOOL v9 = iTunesManagedAppleID;
      __int16 v10 = 1024;
      BOOL v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "iTunes managed apple ID capability changed from, %d, to, %d", buf, 0xEu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_1022F1408);
      }
      char v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCapabilityMonitor setITunesManagedAppleID:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    self->_BOOL iTunesManagedAppleID = v3;
    [(CLCapabilityMonitor *)self onCapabilityChange];
  }
}

- (void)onDarwinNotification:(int)a3 data:(id)a4
{
  [self universe:a3 silo:a4.var0];
  switch(a3)
  {
    case 2:
      [(CLCapabilityMonitor *)self updateSupervised];
      break;
    case 3:
      [(CLCapabilityMonitor *)self updateICloudManagedAppleID];
      break;
    case 4:
      [(CLCapabilityMonitor *)self updateInstalledEducationProfile];
      break;
    case 5:
      [(CLCapabilityMonitor *)self updateITunesManagedAppleID];
      break;
    default:
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_1022F1408);
      }
      uint64_t v6 = qword_102419638;
      if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67240192;
        int v9 = a3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "received unhandled notification, %{public}d", buf, 8u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419630 != -1) {
          dispatch_once(&qword_102419630, &stru_1022F1408);
        }
        char v7 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLCapabilityMonitor onDarwinNotification:data:]", "%s\n", v7);
        if (v7 != (char *)buf) {
          free(v7);
        }
      }
      break;
  }
}

- (void)setStewieSupported:(BOOL)a3
{
  BOOL v3 = a3;
  [self universe].silo
  if (_os_feature_enabled_impl())
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022F1428);
    }
    unint64_t v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      BOOL stewieSupported = self->_stewieSupported;
      v7[0] = 68289538;
      v7[1] = 0;
      __int16 v8 = 2082;
      int v9 = "";
      __int16 v10 = 1026;
      BOOL v11 = stewieSupported;
      __int16 v12 = 1026;
      BOOL v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CapabilityMonitor update stewieSupported\", \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v7, 0x1Eu);
    }
  }
  if (self->_stewieSupported != v3)
  {
    self->_BOOL stewieSupported = v3;
    [(CLCapabilityMonitor *)self onCapabilityChange];
  }
}

- (void)onTelephonyNotification:(int)a3 data:(void *)a4
{
  int v15 = a3;
  [objc_msgSend(a1, "universe") silo];
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022F1428);
  }
  uint64_t v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = (const __CFString *)sub_1000FA17C(&v15);
    sub_1000FECE0(v7, (uint64_t)__p);
    __int16 v8 = v14 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 68289282;
    int v17 = 0;
    __int16 v18 = 2082;
    v19 = "";
    __int16 v20 = 2082;
    v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CapabilityMonitor onTelephonyNotification\", \"notification\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (v14 < 0) {
      operator delete(__p[0]);
    }
  }
  int v9 = (const void *)sub_1000FA17C(&v15);
  if (CFEqual(@"kStewieSupportNotification", v9))
  {
    buf[0] = 0;
    sub_101334B5C(*a4, buf);
    [a1 setStewieSupported:buf[0]];
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022F1428);
    }
    __int16 v10 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v11 = (const __CFString *)sub_1000FA17C(&v15);
      sub_1000FECE0(v11, (uint64_t)__p);
      if (v14 >= 0) {
        __int16 v12 = __p;
      }
      else {
        __int16 v12 = (void **)__p[0];
      }
      *(_DWORD *)buf = 68289282;
      int v17 = 0;
      __int16 v18 = 2082;
      v19 = "";
      __int16 v20 = 2082;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CapabilityMonitor received unhandled notification, skipping\", \"notification\":%{public, location:escape_only}s}", buf, 0x1Cu);
      if (v14 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

- (BOOL)hasCapability:(id)a3
{
  [self universe].silo
  if (!a3) {
    return 0;
  }
  if ([a3 isEqualToString:@"CLNONEDU"])
  {
    unsigned __int8 v5 = sub_10074056C();
    return v5 ^ 1;
  }
  if ([a3 isEqualToString:@"CLSupervised"])
  {
    return [(CLCapabilityMonitor *)self supervised];
  }
  if ([a3 isEqualToString:@"CLNonSupervised"])
  {
    unsigned __int8 v5 = [(CLCapabilityMonitor *)self supervised];
    return v5 ^ 1;
  }
  if ([a3 isEqualToString:@"CLInstalledProfileEducation"])
  {
    return [(CLCapabilityMonitor *)self installedEducationProfile];
  }
  if ([a3 isEqualToString:@"CLNonManagedAppleID"])
  {
    if (![(CLCapabilityMonitor *)self iCloudManagedAppleID])
    {
      unsigned __int8 v5 = [(CLCapabilityMonitor *)self iTunesManagedAppleID];
      return v5 ^ 1;
    }
    return 0;
  }
  if ([a3 isEqualToString:@"CLHeadingCompass"]) {
    return sub_10074157C() & 1;
  }
  if ([a3 isEqualToString:@"CLSystemCustomization"])
  {
    if ((sub_10073D06C() & 1) == 0)
    {
      unsigned __int8 v5 = sub_1000F08D4();
      return v5 ^ 1;
    }
    return 0;
  }
  if ([a3 isEqualToString:@"CLBifrostSupported"])
  {
    return [(CLCapabilityMonitor *)self stewieSupported];
  }
  else
  {
    return sub_10009DF30((uint64_t)a3);
  }
}

- (void)updateLocationDictionaryCachedCapabilities
{
  [self universe].silo
  v5[0] = @"CLNONEDU";
  v6[0] = +[NSNumber numberWithBool:sub_10074056C() ^ 1];
  v5[1] = @"CLSupervised";
  v6[1] = +[NSNumber numberWithBool:[(CLCapabilityMonitor *)self supervised]];
  v5[2] = @"CLNonSupervised";
  v6[2] = +[NSNumber numberWithBool:[(CLCapabilityMonitor *)self supervised] ^ 1];
  v5[3] = @"CLInstalledProfileEducation";
  v6[3] = +[NSNumber numberWithBool:[(CLCapabilityMonitor *)self installedEducationProfile]];
  v5[4] = @"CLNonManagedAppleID";
  if ([(CLCapabilityMonitor *)self iCloudManagedAppleID]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [(CLCapabilityMonitor *)self iTunesManagedAppleID] ^ 1;
  }
  v6[4] = +[NSNumber numberWithBool:v3];
  v5[5] = @"CLHeadingCompass";
  v6[5] = +[NSNumber numberWithBool:sub_10074157C() & 1];
  v5[6] = @"CLSystemCustomization";
  if (sub_10073D06C()) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = sub_1000F08D4() ^ 1;
  }
  v6[6] = +[NSNumber numberWithBool:v4];
  v5[7] = @"CLBifrostSupported";
  v6[7] = +[NSNumber numberWithBool:[(CLCapabilityMonitor *)self stewieSupported]];
  sub_100EC710C(+[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:8]);
}

- (void)onCapabilityChange
{
  [self universe].silo
  [(CLCapabilityMonitor *)self updateLocationDictionaryCachedCapabilities];
  uint64_t v3 = [(CLCapabilityMonitor *)self capabilityChangeClients];

  [(NSMutableSet *)v3 enumerateObjectsUsingBlock:&stru_1022F13E8];
}

- (void)startMonitoringCapabilityChangeForClient:(id)a3
{
  [self universe].silo
  unsigned __int8 v5 = [(CLCapabilityMonitor *)self capabilityChangeClients];

  [(NSMutableSet *)v5 addObject:a3];
}

- (void)stopMonitoringCapabilityChangeForClient:(id)a3
{
  [[-[CLCapabilityMonitor universe](self, "universe") silo];
  unsigned __int8 v5 = [(CLCapabilityMonitor *)self capabilityChangeClients];

  [(NSMutableSet *)v5 removeObject:a3];
}

- (BOOL)syncgetForceCacheUpdate
{
  return 1;
}

- (BOOL)supervised
{
  return self->_supervised;
}

- (BOOL)iCloudManagedAppleID
{
  return self->_iCloudManagedAppleID;
}

- (BOOL)iTunesManagedAppleID
{
  return self->_iTunesManagedAppleID;
}

- (BOOL)installedEducationProfile
{
  return self->_installedEducationProfile;
}

- (BOOL)stewieSupported
{
  return self->_stewieSupported;
}

- (NSMutableSet)capabilityChangeClients
{
  return self->_capabilityChangeClients;
}

- (void)setCapabilityChangeClients:(id)a3
{
}

- (void).cxx_destruct
{
  value = self->_telephonyClient.__ptr_.__value_;
  self->_telephonyClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  uint64_t v4 = self->_darwinClient.__ptr_.__value_;
  self->_darwinClient.__ptr_.__value_ = 0;
  if (v4)
  {
    unsigned __int8 v5 = *(void (**)(void))(*(void *)v4 + 8);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end