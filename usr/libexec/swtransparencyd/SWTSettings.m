@interface SWTSettings
- (BOOL)allowsInternalSecurityPolicies;
- (SWTSettings)init;
- (SWTSettings)initWithTransparencySettings:(id)a3;
- (TransparencySettingsProtocol)transparencySettings;
- (unint64_t)atEnvironment;
- (unint64_t)pccEnvironment;
- (void)determineATEnvironmentFromPCCEnvironment:(id)a3 completion:(id)a4;
- (void)initializeATEnvironmentWithCompletion:(id)a3;
- (void)readPCCPreferences:(id)a3;
- (void)setAtEnvironment:(unint64_t)a3;
- (void)setPccEnvironment:(unint64_t)a3;
- (void)setTransparencySettings:(id)a3;
@end

@implementation SWTSettings

- (SWTSettings)initWithTransparencySettings:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SWTSettings;
  v5 = [(SWTSettings *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(SWTSettings *)v5 setPccEnvironment:0];
    [(SWTSettings *)v6 setAtEnvironment:0];
    [(SWTSettings *)v6 setTransparencySettings:v4];
  }

  return v6;
}

- (SWTSettings)init
{
  id v3 = objc_alloc_init((Class)TransparencySettings);
  id v4 = [(SWTSettings *)self initWithTransparencySettings:v3];

  return v4;
}

- (BOOL)allowsInternalSecurityPolicies
{
  return _os_variant_allows_internal_security_policies("com.apple.Transparency", a2);
}

- (void)readPCCPreferences:(id)a3
{
  id v4 = (void (**)(id, unint64_t))a3;
  if (qword_10015B3A0 != -1) {
    dispatch_once(&qword_10015B3A0, &stru_100136BD8);
  }
  v5 = qword_10015B3A8;
  if (os_log_type_enabled((os_log_t)qword_10015B3A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Using PrivateCloudCompute soft-link fallback", buf, 2u);
  }
  CFPropertyListRef v6 = CFPreferencesCopyAppValue(@"environment", @"com.apple.privateCloudCompute");
  if (v6 && (v7 = (void *)v6, CFTypeID v8 = CFGetTypeID(v6), v8 == CFStringGetTypeID()))
  {
    [(SWTSettings *)self determineATEnvironmentFromPCCEnvironment:v7 completion:v4];
  }
  else
  {
    if (qword_10015B3A0 != -1) {
      dispatch_once(&qword_10015B3A0, &stru_100136BF8);
    }
    v9 = qword_10015B3A8;
    if (os_log_type_enabled((os_log_t)qword_10015B3A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Using PrivateCloudCompute environment (soft-link fallback): carry", v10, 2u);
    }
    [(SWTSettings *)self setPccEnvironment:6];
    [(SWTSettings *)self setAtEnvironment:[(SWTSettings *)self pccEnvironment]];
    v4[2](v4, [(SWTSettings *)self atEnvironment]);
  }
}

- (void)determineATEnvironmentFromPCCEnvironment:(id)a3 completion:(id)a4
{
  CFPropertyListRef v6 = (__CFString *)a3;
  v7 = (void (**)(id, unint64_t))a4;
  if ([(__CFString *)v6 isEqualToString:@"dev"])
  {
    uint64_t v8 = 1;
LABEL_20:
    [(SWTSettings *)self setPccEnvironment:v8];
    goto LABEL_21;
  }
  if ([(__CFString *)v6 isEqualToString:@"ephemeral"])
  {
    uint64_t v8 = 2;
    goto LABEL_20;
  }
  if ([(__CFString *)v6 isEqualToString:@"perf"])
  {
    uint64_t v8 = 3;
    goto LABEL_20;
  }
  if ([(__CFString *)v6 isEqualToString:@"qa"])
  {
    uint64_t v8 = 4;
    goto LABEL_20;
  }
  if ([(__CFString *)v6 isEqualToString:@"staging"])
  {
    uint64_t v8 = 5;
    goto LABEL_20;
  }
  if ([(__CFString *)v6 isEqualToString:@"production"])
  {
    uint64_t v8 = 7;
    goto LABEL_20;
  }
  if ([(__CFString *)v6 isEqualToString:@"qa2Primary"])
  {
    uint64_t v8 = 8;
    goto LABEL_20;
  }
  if ([(__CFString *)v6 isEqualToString:@"qa2Internal"])
  {
    uint64_t v8 = 9;
    goto LABEL_20;
  }
  if (([(__CFString *)v6 isEqual:@"carry"] & 1) != 0
    || [(__CFString *)v6 isEqual:@"uat"])
  {
    uint64_t v8 = 6;
    goto LABEL_20;
  }
LABEL_21:
  if (![(SWTSettings *)self pccEnvironment])
  {
    [(SWTSettings *)self setPccEnvironment:7];

    CFPropertyListRef v6 = @"production";
  }
  [(SWTSettings *)self setAtEnvironment:[(SWTSettings *)self pccEnvironment]];
  if (qword_10015B3A0 != -1) {
    dispatch_once(&qword_10015B3A0, &stru_100136C18);
  }
  v9 = qword_10015B3A8;
  if (os_log_type_enabled((os_log_t)qword_10015B3A8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Using PrivateCloudCompute environment: %{public}@", (uint8_t *)&v10, 0xCu);
  }
  v7[2](v7, [(SWTSettings *)self atEnvironment]);
}

- (void)initializeATEnvironmentWithCompletion:(id)a3
{
  id v4 = (void (**)(id, unint64_t))a3;
  v5 = [(SWTSettings *)self transparencySettings];
  unsigned int v6 = [v5 allowsInternalSecurityPolicies];

  if (!v6) {
    goto LABEL_24;
  }
  CFPropertyListRef v7 = CFPreferencesCopyAppValue(@"ATEnvironment", @"com.apple.swtransparency");
  if (!v7) {
    goto LABEL_24;
  }
  id v8 = (id)v7;
  CFTypeID v9 = CFGetTypeID(v7);
  if (v9 != CFStringGetTypeID()) {
    goto LABEL_24;
  }
  if ([v8 isEqualToString:@"prod"])
  {
    uint64_t v10 = 7;
LABEL_16:
    [(SWTSettings *)self setAtEnvironment:v10];
    goto LABEL_17;
  }
  if ([v8 isEqualToString:@"carry"])
  {
    uint64_t v10 = 6;
    goto LABEL_16;
  }
  if ([v8 isEqualToString:@"QA1"])
  {
    uint64_t v10 = 5;
    goto LABEL_16;
  }
  if ([v8 isEqualToString:@"InternalQA1"])
  {
    uint64_t v10 = 1;
    goto LABEL_16;
  }
  if ([v8 isEqualToString:@"QA2"])
  {
    uint64_t v10 = 8;
    goto LABEL_16;
  }
  if ([v8 isEqualToString:@"InternalQA2"])
  {
    uint64_t v10 = 9;
    goto LABEL_16;
  }
LABEL_17:
  if ([(SWTSettings *)self atEnvironment])
  {
    if (qword_10015B3A0 != -1) {
      dispatch_once(&qword_10015B3A0, &stru_100136C38);
    }
    v11 = qword_10015B3A8;
    if (os_log_type_enabled((os_log_t)qword_10015B3A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Using PrivateCloudCompute environment (swt override): %{public}@", buf, 0xCu);
    }
    v4[2](v4, [(SWTSettings *)self atEnvironment]);
    goto LABEL_27;
  }

LABEL_24:
  if (![(SWTSettings *)self pccEnvironment])
  {
    id v8 = objc_alloc_init((Class)PCCServerEnvironment);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000177A8;
    v12[3] = &unk_100136C80;
    v12[4] = self;
    v13 = v4;
    [v8 selectedEnvironmentNameWithCompletionHandler:v12];

LABEL_27:
    goto LABEL_28;
  }
  [(SWTSettings *)self setAtEnvironment:[(SWTSettings *)self pccEnvironment]];
  v4[2](v4, [(SWTSettings *)self atEnvironment]);
LABEL_28:
}

- (TransparencySettingsProtocol)transparencySettings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTransparencySettings:(id)a3
{
}

- (unint64_t)pccEnvironment
{
  return self->_pccEnvironment;
}

- (void)setPccEnvironment:(unint64_t)a3
{
  self->_pccEnvironment = a3;
}

- (unint64_t)atEnvironment
{
  return self->_atEnvironment;
}

- (void)setAtEnvironment:(unint64_t)a3
{
  self->_atEnvironment = a3;
}

- (void).cxx_destruct
{
}

@end