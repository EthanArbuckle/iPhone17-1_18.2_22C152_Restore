@interface APOdmlDefaults
+ (BOOL)BOOLForKey:(id)a3;
+ (double)doubleForKey:(id)a3;
+ (id)_defaultValueForKey:(id)a3 valueClass:(Class)a4;
+ (id)arrayForKey:(id)a3;
+ (id)sharedInstance;
+ (id)stringForKey:(id)a3;
+ (int64_t)integerForKey:(id)a3;
+ (void)_setDefaultValue:(id)a3 forKey:(id)a4;
+ (void)setBool:(BOOL)a3 forKey:(id)a4;
+ (void)setDouble:(double)a3 forKey:(id)a4;
+ (void)setInteger:(int64_t)a3 forKey:(id)a4;
- (APOdmlDefaults)init;
- (NSMutableDictionary)factoryDefaults;
- (__CFString)defaultsBundleID;
- (void)setDefaultsBundleID:(__CFString *)a3;
- (void)setFactoryDefaults:(id)a3;
@end

@implementation APOdmlDefaults

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1BBC49250;
  block[3] = &unk_1E624A510;
  block[4] = a1;
  if (qword_1EB9F98B0 != -1) {
    dispatch_once(&qword_1EB9F98B0, block);
  }
  v2 = (void *)qword_1EB9F9898;

  return v2;
}

- (APOdmlDefaults)init
{
  v13.receiver = self;
  v13.super_class = (Class)APOdmlDefaults;
  v2 = [(APOdmlDefaults *)&v13 init];
  if (v2)
  {
    uint64_t v3 = CPCopySharedResourcesPreferencesDomainForDomain();
    v2->_defaultsBundleID = (__CFString *)v3;
    if (!v3) {
      APOdmlSimulateCrash(5, @"Unable to initialize the defaults domain bundle identifier.", 0);
    }
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    factoryDefaults = v2->_factoryDefaults;
    v2->_factoryDefaults = v4;

    if (MGGetBoolAnswer())
    {
      objc_msgSend_setObject_forKeyedSubscript_(v2->_factoryDefaults, v6, (uint64_t)&stru_1F14FE8B8, @"ODMLpTTROverride");
      objc_msgSend_setObject_forKeyedSubscript_(v2->_factoryDefaults, v7, (uint64_t)&stru_1F14FE8B8, @"ODMLAppVectorVersionOverride");
      objc_msgSend_setObject_forKeyedSubscript_(v2->_factoryDefaults, v8, (uint64_t)&stru_1F14FE8B8, @"ODMLAppVectorVectorOverride");
      uint64_t v9 = MEMORY[0x1E4F1CC28];
      objc_msgSend_setObject_forKeyedSubscript_(v2->_factoryDefaults, v10, MEMORY[0x1E4F1CC28], @"ODMLEnableOverrides");
      objc_msgSend_setObject_forKeyedSubscript_(v2->_factoryDefaults, v11, v9, @"VerboseLogging");
    }
  }
  return v2;
}

+ (id)_defaultValueForKey:(id)a3 valueClass:(Class)a4
{
  v4 = (__CFString *)a3;
  objc_msgSend_sharedInstance(APOdmlDefaults, v5, v6);
  v7 = (CFStringRef *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)CFPreferencesCopyAppValue(v4, v7[2]);

  if (!v8)
  {
    objc_msgSend_sharedInstance(APOdmlDefaults, v9, v10);
    v11 = (void **)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend_objectForKeyedSubscript_(v11[1], v12, (uint64_t)v4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v8 = 0;
  }

  return v8;
}

+ (void)_setDefaultValue:(id)a3 forKey:(id)a4
{
  v5 = (__CFString *)a4;
  id v6 = a3;
  objc_msgSend_sharedInstance(APOdmlDefaults, v7, v8);
  uint64_t v9 = (CFStringRef *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(v5, v6, v9[2]);

  objc_msgSend_sharedInstance(APOdmlDefaults, v10, v11);
  v12 = (CFStringRef *)objc_claimAutoreleasedReturnValue();
  CFPreferencesAppSynchronize(v12[2]);
}

+ (BOOL)BOOLForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend__defaultValueForKey_valueClass_(a1, v6, (uint64_t)v4, v5);

  char v10 = objc_msgSend_BOOLValue(v7, v8, v9);
  return v10;
}

+ (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSNumber;
  id v7 = a4;
  objc_msgSend_numberWithBool_(v6, v8, v4);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setDefaultValue_forKey_(a1, v9, (uint64_t)v10, v7);
}

+ (int64_t)integerForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v7 = objc_msgSend__defaultValueForKey_valueClass_(a1, v6, (uint64_t)v4, v5);

  int64_t v10 = objc_msgSend_integerValue(v7, v8, v9);
  return v10;
}

+ (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  id v6 = NSNumber;
  id v7 = a4;
  objc_msgSend_numberWithInteger_(v6, v8, a3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setDefaultValue_forKey_(a1, v9, (uint64_t)v10, v7);
}

+ (double)doubleForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v7 = objc_msgSend__defaultValueForKey_valueClass_(a1, v6, (uint64_t)v4, v5);

  objc_msgSend_doubleValue(v7, v8, v9);
  double v11 = v10;

  return v11;
}

+ (void)setDouble:(double)a3 forKey:(id)a4
{
  id v6 = NSNumber;
  id v7 = a4;
  objc_msgSend_numberWithDouble_(v6, v8, v9, a3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setDefaultValue_forKey_(a1, v10, (uint64_t)v11, v7);
}

+ (id)stringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v7 = objc_msgSend__defaultValueForKey_valueClass_(a1, v6, (uint64_t)v4, v5);

  return v7;
}

+ (id)arrayForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v7 = objc_msgSend__defaultValueForKey_valueClass_(a1, v6, (uint64_t)v4, v5);

  return v7;
}

- (NSMutableDictionary)factoryDefaults
{
  return self->_factoryDefaults;
}

- (void)setFactoryDefaults:(id)a3
{
}

- (__CFString)defaultsBundleID
{
  return self->_defaultsBundleID;
}

- (void)setDefaultsBundleID:(__CFString *)a3
{
  self->_defaultsBundleID = a3;
}

- (void).cxx_destruct
{
}

@end