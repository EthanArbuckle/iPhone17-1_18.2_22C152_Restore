@interface InputManager
+ (id)sharedInstance;
- (BOOL)_saveInputsWithError:(id *)a3;
- (BOOL)setInput:(id)a3 withError:(id *)a4;
- (InputManager)init;
- (NSDictionary)debugDictionary;
- (NSDictionary)eligibilityInputs;
- (id)_createDefaultInputs;
- (id)_loadInputsWithError:(id *)a3;
- (id)objectForInputValue:(unint64_t)a3;
- (void)setEligibilityInputs:(id)a3;
@end

@implementation InputManager

- (void).cxx_destruct
{
}

- (void)setEligibilityInputs:(id)a3
{
}

- (NSDictionary)eligibilityInputs
{
  return self->_eligibilityInputs;
}

- (NSDictionary)debugDictionary
{
  v3 = objc_opt_new();
  v4 = [(InputManager *)self eligibilityInputs];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100009D7C;
  v8[3] = &unk_100038A00;
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  id v6 = [v5 copy];

  return (NSDictionary *)v6;
}

- (BOOL)_saveInputsWithError:(id *)a3
{
  v21 = 0;
  if (asprintf(&v21, "%s%s", "/", "/private/var/db/eligibilityd/eligibility_inputs.plist") == -1)
  {
    id v5 = sub_10000D0EC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "copy_eligibility_domain_input_manager_plist_path";
      __int16 v24 = 2080;
      v25 = "/private/var/db/eligibilityd/eligibility_inputs.plist";
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
    }
  }
  id v6 = v21;
  if (v21)
  {
    v7 = +[NSString stringWithUTF8String:v21];
    id v8 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    id v9 = [(InputManager *)self eligibilityInputs];
    [v8 encodeObject:v9 forKey:NSKeyedArchiveRootObjectKey];

    v10 = [v8 encodedData];

    v11 = +[NSURL fileURLWithPath:v7 isDirectory:0];
    id v20 = 0;
    unsigned int v12 = [v10 writeToURL:v11 options:268435457 error:&v20];
    id v13 = v20;
    if (v12)
    {
      free(v6);
      BOOL v14 = 1;
      goto LABEL_16;
    }
    v16 = sub_10000D0EC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = [(InputManager *)self eligibilityInputs];
      v19 = [v11 path];
      *(_DWORD *)buf = 136315906;
      v23 = "-[InputManager _saveInputsWithError:]";
      __int16 v24 = 2112;
      v25 = v18;
      __int16 v26 = 2112;
      v27 = v19;
      __int16 v28 = 2112;
      id v29 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: Failed to write eligibility data %@ to disk at %@: %@", buf, 0x2Au);
    }
  }
  else
  {
    v15 = sub_10000D0EC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[InputManager _saveInputsWithError:]";
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: Failed to copy input manager plist path", buf, 0xCu);
    }

    v7 = 0;
    v11 = 0;
    v10 = 0;
    id v13 = 0;
  }
  free(v6);
  if (a3)
  {
    id v13 = v13;
    BOOL v14 = 0;
    *a3 = v13;
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_16:

  return v14;
}

- (id)_loadInputsWithError:(id *)a3
{
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v30 = 0;
  if (asprintf(&v30, "%s%s", "/", "/private/var/db/eligibilityd/eligibility_inputs.plist") == -1)
  {
    v7 = sub_10000D0EC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "copy_eligibility_domain_input_manager_plist_path";
      __int16 v33 = 2080;
      v34 = "/private/var/db/eligibilityd/eligibility_inputs.plist";
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
    }
  }
  id v8 = v30;
  if (!v30)
  {
    v18 = sub_10000D0EC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[InputManager _loadInputsWithError:]";
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s: Failed to copy input manager plist path", buf, 0xCu);
    }

    v10 = 0;
    v11 = 0;
    id v9 = 0;
    id v13 = 0;
    id v12 = 0;
    goto LABEL_22;
  }
  id v9 = +[NSString stringWithUTF8String:v30];
  v10 = +[NSURL fileURLWithPath:v9 isDirectory:0];
  id v29 = 0;
  v11 = +[NSData dataWithContentsOfURL:v10 options:3 error:&v29];
  id v12 = v29;
  if (!v11)
  {
    v19 = sub_10000D0EC();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = [v10 path];
      *(_DWORD *)buf = 136315650;
      v32 = "-[InputManager _loadInputsWithError:]";
      __int16 v33 = 2112;
      v34 = v24;
      __int16 v35 = 2112;
      uint64_t v36 = (uint64_t)v12;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s: Failed to deserialize data in %@: %@", buf, 0x20u);
    }
    v11 = 0;
    id v13 = 0;
    goto LABEL_22;
  }
  id v28 = v12;
  id v13 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v11 error:&v28];
  BOOL v14 = (char *)v28;

  if (!v13)
  {
    id v20 = sub_10000D0EC();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[InputManager _loadInputsWithError:]";
      __int16 v33 = 2112;
      v34 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s: Failed to create unarchiver: %@", buf, 0x16u);
    }

    id v13 = 0;
    id v17 = 0;
    goto LABEL_18;
  }
  uint64_t v15 = [v13 decodeObjectOfClasses:v6 forKey:NSKeyedArchiveRootObjectKey];
  if (!v15)
  {
    v21 = sub_10000D0EC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v27 = [v10 path];
      uint64_t v25 = [v13 error];
      *(_DWORD *)buf = 136315650;
      v32 = "-[InputManager _loadInputsWithError:]";
      __int16 v33 = 2112;
      v34 = v27;
      __int16 v35 = 2112;
      uint64_t v36 = v25;
      __int16 v26 = (void *)v25;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s: Failed to decode input from data at %@ : %@", buf, 0x20u);
    }
    id v12 = [v13 error];

LABEL_22:
    id v17 = 0;
    goto LABEL_23;
  }
  v16 = (void *)v15;
  [v13 finishDecoding];
  id v17 = v16;
LABEL_18:
  id v12 = v14;
LABEL_23:
  free(v8);
  if (a3 && !v17) {
    *a3 = v12;
  }
  id v22 = v17;

  return v22;
}

- (BOOL)setInput:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v7 = sub_10000CE98((unint64_t)[v6 type]);
  if (v7)
  {
    id v8 = +[NSString stringWithUTF8String:v7];
    id v9 = [(InputManager *)self eligibilityInputs];
    id v10 = [v9 mutableCopy];

    [v10 setObject:v6 forKeyedSubscript:v8];
    v11 = (NSDictionary *)[v10 copy];
    eligibilityInputs = self->_eligibilityInputs;
    self->_eligibilityInputs = v11;

    BOOL v13 = [(InputManager *)self _saveInputsWithError:a4];
  }
  else
  {
    BOOL v14 = sub_10000D0EC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      id v17 = "-[InputManager setInput:withError:]";
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Unknown input %@", (uint8_t *)&v16, 0x16u);
    }

    if (a4)
    {
      +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      BOOL v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (id)objectForInputValue:(unint64_t)a3
{
  uint64_t v5 = sub_10000CE98(a3);
  if (v5)
  {
    id v6 = +[NSString stringWithUTF8String:v5];
    v7 = [(InputManager *)self eligibilityInputs];
    id v8 = [v7 objectForKeyedSubscript:v6];
  }
  else
  {
    id v9 = sub_10000D0EC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      id v12 = "-[InputManager objectForInputValue:]";
      __int16 v13 = 2048;
      unint64_t v14 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Unknown input %llu", (uint8_t *)&v11, 0x16u);
    }

    id v8 = 0;
  }

  return v8;
}

- (id)_createDefaultInputs
{
  v2 = objc_opt_new();
  v3 = [[LocatedCountryInput alloc] initWithCountryCodes:0 status:1 process:0];
  if (v3) {
    [v2 setObject:v3 forKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION"];
  }

  uint64_t v4 = [[CountryBillingInput alloc] initWithBillingCountry:0 status:1 process:0];
  if (v4) {
    [v2 setObject:v4 forKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_BILLING"];
  }

  uint64_t v5 = objc_alloc_init(DeviceClassInput);
  if (v5) {
    [v2 setObject:v5 forKeyedSubscript:@"OS_ELIGIBILITY_INPUT_DEVICE_CLASS"];
  }

  id v6 = [[DeviceLocaleInput alloc] initWithDeviceLocale:0 status:1 process:0];
  if (v6) {
    [v2 setObject:v6 forKeyedSubscript:@"OS_ELIGIBILITY_INPUT_DEVICE_LOCALE"];
  }

  v7 = objc_alloc_init(ChinaCellularInput);
  if (v7) {
    [v2 setObject:v7 forKeyedSubscript:@"OS_ELIGIBILITY_INPUT_CHINA_CELLULAR"];
  }

  id v8 = objc_alloc_init(DeviceRegionCodeInput);
  if (v8) {
    [v2 setObject:v8 forKeyedSubscript:@"OS_ELIGIBILITY_INPUT_DEVICE_REGION_CODE"];
  }

  id v9 = objc_alloc_init(DeviceLanguageInput);
  if (v9) {
    [v2 setObject:v9 forKeyedSubscript:@"OS_ELIGIBILITY_INPUT_DEVICE_LANGUAGE"];
  }

  id v10 = objc_alloc_init(GenerativeModelSystemInput);
  if (v10) {
    [v2 setObject:v10 forKeyedSubscript:@"OS_ELIGIBILITY_INPUT_GENERATIVE_MODEL_SYSTEM"];
  }

  id v11 = [[GreymatterQueueInput alloc] initOnQueue:0 status:1 process:0];
  if (v11) {
    [v2 setObject:v11 forKeyedSubscript:@"OS_ELIGIBILITY_INPUT_GREYMATTER_ON_QUEUE"];
  }

  id v12 = objc_alloc_init(SiriLanguageInput);
  if (v12) {
    [v2 setObject:v12 forKeyedSubscript:@"OS_ELIGIBILITY_INPUT_SIRI_LANGUAGE"];
  }

  __int16 v13 = objc_alloc_init(ExternalBootDriveInput);
  if (v13) {
    [v2 setObject:v13 forKeyedSubscript:@"OS_ELIGIBILITY_INPUT_EXTERNAL_BOOT_DRIVE"];
  }

  unint64_t v14 = objc_alloc_init(SharediPadInput);
  if (v14) {
    [v2 setObject:v14 forKeyedSubscript:@"OS_ELIGIBILITY_INPUT_SHARED_IPAD"];
  }

  uint64_t v15 = [[EligibilityInput alloc] initWithInputType:13 status:0 process:@"eligibilityd"];
  if (v15) {
    [v2 setObject:v15 forKeyedSubscript:@"OS_ELIGIBILITY_INPUT_DEVICE_AND_SIRI_LANGUAGE_MATCH"];
  }

  int v16 = [[InitialSetupLocationInput alloc] initWithLocations:0 status:1 process:0];
  if (v16) {
    [v2 setObject:v16 forKeyedSubscript:@"OS_ELIGIBILITY_INPUT_INITIAL_SETUP_LOCATION"];
  }

  id v17 = [[BirthdateInput alloc] initWithDate:0 status:1 process:0];
  if (v17) {
    [v2 setObject:v17 forKeyedSubscript:@"OS_ELIGIBILITY_INPUT_BIRTHDATE"];
  }

  id v18 = [v2 copy];

  return v18;
}

- (InputManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)InputManager;
  v2 = [(InputManager *)&v13 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(InputManager *)v2 _createDefaultInputs];
    id v5 = [v4 mutableCopy];

    id v12 = 0;
    id v6 = [(InputManager *)v3 _loadInputsWithError:&v12];
    id v7 = v12;
    if (v6)
    {
      [v5 addEntriesFromDictionary:v6];
    }
    else
    {
      id v8 = sub_10000D0EC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v15 = "-[InputManager init]";
        __int16 v16 = 2112;
        id v17 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Unable to load inputs from disk, initing with empty values: %@", buf, 0x16u);
      }
    }
    id v9 = (NSDictionary *)[v5 copy];
    eligibilityInputs = v3->_eligibilityInputs;
    v3->_eligibilityInputs = v9;
  }
  return v3;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AEC8;
  block[3] = &unk_100038E50;
  block[4] = a1;
  if (qword_10004C7F0 != -1) {
    dispatch_once(&qword_10004C7F0, block);
  }
  v2 = (void *)qword_10004C7E8;

  return v2;
}

@end