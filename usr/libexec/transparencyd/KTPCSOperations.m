@interface KTPCSOperations
+ (id)PCSOperationWithSpecificUser:(id)a3;
- (KTPCSOperations)initWithSpecificUser:(id)a3;
- (NSString)altDSID;
- (NSString)dsid;
- (_PCSIdentitySetData)set;
- (id)getCurrentKTPCSIdentity:(id)a3 error:(id *)a4;
- (void)createManateeIdentity:(id)a3 service:(id)a4 complete:(id)a5;
- (void)dealloc;
- (void)setAltDSID:(id)a3;
- (void)setDsid:(id)a3;
- (void)setSet:(_PCSIdentitySetData *)a3;
@end

@implementation KTPCSOperations

+ (id)PCSOperationWithSpecificUser:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithSpecificUser:v4];

  return v5;
}

- (KTPCSOperations)initWithSpecificUser:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)KTPCSOperations;
  CFTypeRef cf = 0;
  id v5 = [(KTPCSOperations *)&v17 init];
  if (!v5)
  {
LABEL_9:
    v13 = 0;
    goto LABEL_18;
  }
  v6 = [v4 dsid];
  [(KTPCSOperations *)v5 setDsid:v6];

  v7 = [(KTPCSOperations *)v5 dsid];

  if (!v7)
  {
    if (qword_10032F070 != -1) {
      dispatch_once(&qword_10032F070, &stru_1002C6198);
    }
    v14 = qword_10032F078;
    if (os_log_type_enabled((os_log_t)qword_10032F078, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "initWithSpecificUser dsid is NULL", buf, 2u);
    }
    goto LABEL_9;
  }
  v8 = [v4 altDSID];
  [(KTPCSOperations *)v5 setAltDSID:v8];

  uint64_t v21 = kPCSSetupDSID;
  v9 = [(KTPCSOperations *)v5 dsid];
  v22 = v9;
  v10 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v11 = [v10 mutableCopy];

  v12 = [(KTPCSOperations *)v5 altDSID];
  [v11 setObject:v12 forKeyedSubscript:kPCSSetupAltDSID];

  [(KTPCSOperations *)v5 setSet:PCSIdentitySetCreate()];
  if ([(KTPCSOperations *)v5 set])
  {
    v13 = v5;
  }
  else
  {
    if (qword_10032F070 != -1) {
      dispatch_once(&qword_10032F070, &stru_1002C61B8);
    }
    v15 = qword_10032F078;
    if (os_log_type_enabled((os_log_t)qword_10032F078, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v20 = cf;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "PCSIdentitySetCreate: %@", buf, 0xCu);
    }
    if (cf) {
      CFRelease(cf);
    }
    v13 = 0;
  }

LABEL_18:
  return v13;
}

- (void)dealloc
{
  set = self->_set;
  if (set)
  {
    CFRelease(set);
    self->_set = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)KTPCSOperations;
  [(KTPCSOperations *)&v4 dealloc];
}

- (void)createManateeIdentity:(id)a3 service:(id)a4 complete:(id)a5
{
  id v8 = a5;
  v16[0] = kPCSSetupDSID;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(KTPCSOperations *)self dsid];
  v16[1] = kPCSSetupSyncIdentity;
  v17[0] = v11;
  v17[1] = &__kCFBooleanTrue;
  v12 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  id v13 = [v12 mutableCopy];

  v14 = [(KTPCSOperations *)self altDSID];
  [v13 setObject:v14 forKeyedSubscript:kPCSSetupAltDSID];

  LODWORD(v14) = [v10 roll];
  if (v14) {
    [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:kPCSSetupRollIdentity];
  }
  [(KTPCSOperations *)self set];
  id v15 = v8;
  PCSIdentitySetCreateManatee();
}

- (id)getCurrentKTPCSIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = kTransparencyFlagForceCDPWaiting;
  if (+[TransparencySettings getBool:kTransparencyFlagForceCDPWaiting defaultValue:0])
  {
    id v8 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal, -350, @"Identity creation failed: %@ set", v7 code description];
    id v9 = v8;
    if (a4 && v8) {
      *a4 = v8;
    }

LABEL_6:
    id v10 = 0;
    goto LABEL_12;
  }
  [(KTPCSOperations *)self set];
  id v10 = PCSIdentitySetCopyCurrentIdentityPointer();
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(KTPCSOperations *)self dsid];
      v12 = [(KTPCSOperations *)self altDSID];
      *(_DWORD *)buf = 138412802;
      id v15 = v11;
      __int16 v16 = 2112;
      objc_super v17 = v12;
      __int16 v18 = 2112;
      uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PCSIdentitySetCopyCurrentIdentityWithError: %@[%@] %@", buf, 0x20u);
    }
    if (!a4) {
      goto LABEL_6;
    }
    id v10 = 0;
    *a4 = 0;
  }
LABEL_12:

  return v10;
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDsid:(id)a3
{
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAltDSID:(id)a3
{
}

- (_PCSIdentitySetData)set
{
  return self->_set;
}

- (void)setSet:(_PCSIdentitySetData *)a3
{
  self->_set = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_dsid, 0);
}

@end