@interface OBCapabilities
+ (id)sharedCapabilities;
- (BOOL)deviceSupportsGenerativeModels;
- (BOOL)eligibleForChlorine;
- (BOOL)isWAPI;
- (BOOL)preventOpeningSafari;
- (BOOL)preventURLDataDetection;
- (NSNumber)overrideEligibleForChlorine;
- (NSString)overrideAdditionalDisplayLanguage;
- (id)_potentialAdditionalDisplayLanguage;
- (id)additionalDisplayLanguageForDisplayLanguage:(id)a3;
- (void)eligibleForChlorine;
- (void)setOverrideAdditionalDisplayLanguage:(id)a3;
- (void)setOverrideEligibleForChlorine:(id)a3;
- (void)setPreventOpeningSafari:(BOOL)a3;
- (void)setPreventURLDataDetection:(BOOL)a3;
@end

@implementation OBCapabilities

- (BOOL)eligibleForChlorine
{
  v2 = self;
  objc_sync_enter(v2);
  overrideEligibleForChlorine = v2->_overrideEligibleForChlorine;
  if (overrideEligibleForChlorine)
  {
    BOOL v4 = [(NSNumber *)overrideEligibleForChlorine BOOLValue];
    objc_sync_exit(v2);
  }
  else
  {
    objc_sync_exit(v2);

    int domain_answer = os_eligibility_get_domain_answer();
    v6 = _OBLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(OBCapabilities *)domain_answer eligibleForChlorine];
    }

    return 0;
  }
  return v4;
}

+ (id)sharedCapabilities
{
  if (sharedCapabilities_onceToken != -1) {
    dispatch_once(&sharedCapabilities_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedCapabilities_sharedInstance;
  return v2;
}

uint64_t __36__OBCapabilities_sharedCapabilities__block_invoke()
{
  sharedCapabilities_sharedInstance = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (BOOL)isWAPI
{
  if (isWAPI_onceToken != -1) {
    dispatch_once(&isWAPI_onceToken, &__block_literal_global_2);
  }
  return isWAPI_wapi;
}

uint64_t __24__OBCapabilities_isWAPI__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isWAPI_wapi = result;
  return result;
}

- (BOOL)deviceSupportsGenerativeModels
{
  return MGGetBoolAnswer();
}

- (NSNumber)overrideEligibleForChlorine
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_overrideEligibleForChlorine;
  objc_sync_exit(v2);

  return v3;
}

- (void)setOverrideEligibleForChlorine:(id)a3
{
  BOOL v4 = (NSNumber *)a3;
  obj = self;
  objc_sync_enter(obj);
  overrideEligibleForChlorine = obj->_overrideEligibleForChlorine;
  obj->_overrideEligibleForChlorine = v4;

  objc_sync_exit(obj);
}

- (id)additionalDisplayLanguageForDisplayLanguage:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  overrideAdditionalDisplayLanguage = v5->_overrideAdditionalDisplayLanguage;
  if (overrideAdditionalDisplayLanguage)
  {
    v7 = overrideAdditionalDisplayLanguage;
    objc_sync_exit(v5);
LABEL_3:

    goto LABEL_4;
  }
  objc_sync_exit(v5);

  v7 = [(OBCapabilities *)v5 _potentialAdditionalDisplayLanguage];
  if (v7)
  {
    v5 = (OBCapabilities *)v4;
    if (!v5)
    {
      v9 = [MEMORY[0x1E4F1CA20] currentLocale];
      v5 = [v9 languageCode];
    }
    if ([(NSString *)v7 isEqualToString:v5])
    {

      v7 = 0;
    }
    goto LABEL_3;
  }
LABEL_4:

  return v7;
}

- (id)_potentialAdditionalDisplayLanguage
{
  return 0;
}

- (NSString)overrideAdditionalDisplayLanguage
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_overrideAdditionalDisplayLanguage;
  objc_sync_exit(v2);

  return v3;
}

- (void)setOverrideAdditionalDisplayLanguage:(id)a3
{
  id v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  overrideAdditionalDisplayLanguage = obj->_overrideAdditionalDisplayLanguage;
  obj->_overrideAdditionalDisplayLanguage = v4;

  objc_sync_exit(obj);
}

- (BOOL)preventURLDataDetection
{
  return self->_preventURLDataDetection;
}

- (void)setPreventURLDataDetection:(BOOL)a3
{
  self->_preventURLDataDetection = a3;
}

- (BOOL)preventOpeningSafari
{
  return self->_preventOpeningSafari;
}

- (void)setPreventOpeningSafari:(BOOL)a3
{
  self->_preventOpeningSafari = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideAdditionalDisplayLanguage, 0);
  objc_storeStrong((id *)&self->_overrideEligibleForChlorine, 0);
}

- (void)eligibleForChlorine
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_19BF0F000, a2, OS_LOG_TYPE_ERROR, "Failed to get eligibility for chlorine with error %d", (uint8_t *)v2, 8u);
}

@end