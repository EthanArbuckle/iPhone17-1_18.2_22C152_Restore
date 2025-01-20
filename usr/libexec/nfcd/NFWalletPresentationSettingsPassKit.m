@interface NFWalletPresentationSettingsPassKit
+ (id)defaultSetting;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (BOOL)isEligible;
- (NFWalletPresentationSettingsPassKit)initWithSuiteName:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setIsEligible:(BOOL)a3;
@end

@implementation NFWalletPresentationSettingsPassKit

- (BOOL)isEligible
{
  return self->_isEligible;
}

+ (id)defaultSetting
{
  v2 = [[NFWalletPresentationSettingsPassKit alloc] initWithSuiteName:@"com.apple.passd.class-d"];

  return v2;
}

- (NFWalletPresentationSettingsPassKit)initWithSuiteName:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NFWalletPresentationSettingsPassKit;
  v3 = [(NFWalletPresentationSettings *)&v8 initWithSuiteName:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(NFWalletPresentationSettings *)v3 defaults];
    [v5 addObserver:v4 forKeyPath:@"pre-arm-available" options:5 context:off_100346DF8];

    v6 = v4;
  }

  return v4;
}

- (void)dealloc
{
  v3 = [(NFWalletPresentationSettings *)self defaults];
  [v3 removeObserver:self forKeyPath:@"pre-arm-available"];

  v4.receiver = self;
  v4.super_class = (Class)NFWalletPresentationSettingsPassKit;
  [(NFWalletPresentationSettingsPassKit *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_100346DF8 != a6)
  {
    v31.receiver = self;
    v31.super_class = (Class)NFWalletPresentationSettingsPassKit;
    -[NFWalletPresentationSettingsPassKit observeValueForKeyPath:ofObject:change:context:](&v31, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
    return;
  }
  objc_super v8 = [a5 objectForKeyedSubscript:NSKeyValueChangeNewKey, a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 BOOLValue];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v29 = [(NFWalletPresentationSettingsPassKit *)self isEligible];
      uint64_t v16 = 45;
      if (isMetaClass) {
        uint64_t v16 = 43;
      }
      v11(6, "%c[%{public}s %{public}s]:%i existing=%{public}d, new=%{public}d", v16, ClassName, Name, 221, v29, v9);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v17 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    v18 = object_getClass(self);
    if (class_isMetaClass(v18)) {
      int v19 = 43;
    }
    else {
      int v19 = 45;
    }
    *(_DWORD *)buf = 67110402;
    int v33 = v19;
    __int16 v34 = 2082;
    v35 = object_getClassName(self);
    __int16 v36 = 2082;
    v37 = sel_getName(a2);
    __int16 v38 = 1024;
    int v39 = 221;
    __int16 v40 = 1026;
    unsigned int v41 = [(NFWalletPresentationSettingsPassKit *)self isEligible];
    __int16 v42 = 1026;
    int v43 = (int)v9;
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i existing=%{public}d, new=%{public}d", buf, 0x2Eu);
LABEL_24:

    [(NFWalletPresentationSettingsPassKit *)self setIsEligible:v9];
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 BOOLValue];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v20 = NFLogGetLogger();
    if (v20)
    {
      v21 = (void (*)(uint64_t, const char *, ...))v20;
      v22 = object_getClass(self);
      BOOL v23 = class_isMetaClass(v22);
      v24 = object_getClassName(self);
      v25 = sel_getName(a2);
      uint64_t v30 = [(NFWalletPresentationSettingsPassKit *)self isEligible];
      uint64_t v26 = 45;
      if (v23) {
        uint64_t v26 = 43;
      }
      v21(6, "%c[%{public}s %{public}s]:%i existing=%{public}d, new=%{public}d", v26, v24, v25, 225, v30, v9);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v17 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    v27 = object_getClass(self);
    if (class_isMetaClass(v27)) {
      int v28 = 43;
    }
    else {
      int v28 = 45;
    }
    *(_DWORD *)buf = 67110402;
    int v33 = v28;
    __int16 v34 = 2082;
    v35 = object_getClassName(self);
    __int16 v36 = 2082;
    v37 = sel_getName(a2);
    __int16 v38 = 1024;
    int v39 = 225;
    __int16 v40 = 1026;
    unsigned int v41 = [(NFWalletPresentationSettingsPassKit *)self isEligible];
    __int16 v42 = 1026;
    int v43 = (int)v9;
    goto LABEL_23;
  }
LABEL_25:
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___NFWalletPresentationSettingsPassKit;
  id v3 = a3;
  objc_super v4 = [v8 keyPathsForValuesAffectingValueForKey:v3];
  unsigned int v5 = [v3 isEqualToString:@"isEligibleForDoubleClick" v8.receiver, v8.super_class];

  if (v5)
  {
    uint64_t v6 = [v4 setByAddingObject:@"isEligible"];

    objc_super v4 = (void *)v6;
  }

  return v4;
}

- (void)setIsEligible:(BOOL)a3
{
  self->_isEligible = a3;
}

@end