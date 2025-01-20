@interface NFWalletPresentationSettings
- (NFWalletPresentationSettings)initWithSuiteName:(id)a3;
- (NSUserDefaults)defaults;
@end

@implementation NFWalletPresentationSettings

- (NFWalletPresentationSettings)initWithSuiteName:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NFWalletPresentationSettings;
  v6 = [(NFWalletPresentationSettings *)&v23 init];
  if (!v6)
  {
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  v7 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:v5];
  defaults = v6->_defaults;
  v6->_defaults = v7;

  if (!v6->_defaults)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v6);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v6);
      Name = sel_getName(a2);
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v11(3, "%c[%{public}s %{public}s]:%i Fail to initialize suite %@", v14, ClassName, Name, 25, v5);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = object_getClass(v6);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      v18 = object_getClassName(v6);
      v19 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v25 = v17;
      __int16 v26 = 2082;
      v27 = v18;
      __int16 v28 = 2082;
      v29 = v19;
      __int16 v30 = 1024;
      int v31 = 25;
      __int16 v32 = 2112;
      id v33 = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Fail to initialize suite %@", buf, 0x2Cu);
    }

    goto LABEL_14;
  }
  v9 = v6;
LABEL_15:

  return v9;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void).cxx_destruct
{
}

@end