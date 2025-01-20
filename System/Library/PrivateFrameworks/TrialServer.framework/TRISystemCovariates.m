@interface TRISystemCovariates
- (TRISystemCovariates)initWithPaths:(id)a3;
- (id)dictionary;
- (id)objectForKey:(id)a3;
- (id)tri_contextValueWithName:(id)a3;
@end

@implementation TRISystemCovariates

- (TRISystemCovariates)initWithPaths:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRISystemCovariates;
  v5 = [(TRISystemCovariates *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4FB0258]) initWithPaths:v4];
    sysConfig = v5->_sysConfig;
    v5->_sysConfig = (TRISystemConfiguration *)v6;
  }
  return v5;
}

- (id)tri_contextValueWithName:(id)a3
{
  id v4 = a3;
  v5 = [(TRISystemCovariates *)self dictionary];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    objc_super v9 = [NSString stringWithFormat:@"The system covariates do not contain the key %@", v4];
    id v10 = [v8 exceptionWithName:@"KeyNotFoundException" reason:v9 userInfo:0];

    objc_exception_throw(v10);
  }

  return v6;
}

- (id)dictionary
{
  v51[28] = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  dictionary = v2->_dictionary;
  if (!dictionary)
  {
    id v4 = [MEMORY[0x1E4FB0258] sharedInstance];
    int v5 = [v4 isInternalBuild];

    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      uint64_t v7 = [v6 objectForKey:@"systemCovariatesOverride"];
      v8 = v2->_dictionary;
      v2->_dictionary = (NSDictionary *)v7;

      objc_super v9 = v2->_dictionary;
      if (v9)
      {
        id v10 = v9;

        goto LABEL_22;
      }
    }
    sysConfig = v2->_sysConfig;
    if (sysConfig)
    {
      [(TRISystemConfiguration *)sysConfig marketingOSVersion];
      sysConfig = v2->_sysConfig;
    }
    v50[0] = @"OS";
    v12 = [(TRISystemConfiguration *)sysConfig osType];
    v51[0] = v12;
    v50[1] = @"OSBuild";
    v49 = [(TRISystemConfiguration *)v2->_sysConfig osBuild];
    v51[1] = v49;
    v50[2] = @"DeviceModelCode";
    v48 = [(TRISystemConfiguration *)v2->_sysConfig deviceModelCode];
    v51[2] = v48;
    v50[3] = @"DeviceClass";
    v47 = [(TRISystemConfiguration *)v2->_sysConfig deviceClass];
    v51[3] = v47;
    v50[4] = @"DeviceId";
    v46 = [(TRISystemConfiguration *)v2->_sysConfig deviceId];
    v13 = v46;
    if (!v46) {
      v13 = &stru_1F3455898;
    }
    v51[4] = v13;
    v50[5] = @"iCloudId";
    v45 = [(TRISystemConfiguration *)v2->_sysConfig iCloudId];
    v14 = v45;
    if (!v45) {
      v14 = &stru_1F3455898;
    }
    v51[5] = v14;
    v50[6] = @"DeviceLocale";
    v44 = [(TRISystemConfiguration *)v2->_sysConfig userSettingsLanguageCode];
    v51[6] = v44;
    v50[7] = @"IsInternalBuild";
    v43 = objc_msgSend(NSNumber, "numberWithBool:", -[TRISystemConfiguration isInternalBuild](v2->_sysConfig, "isInternalBuild"));
    v51[7] = v43;
    v50[8] = @"IsBetaBuild";
    v42 = objc_msgSend(NSNumber, "numberWithBool:", -[TRISystemConfiguration isBetaBuild](v2->_sysConfig, "isBetaBuild"));
    v51[8] = v42;
    v50[9] = @"IsBetaUser";
    v41 = objc_msgSend(NSNumber, "numberWithBool:", -[TRISystemConfiguration isBetaUserWithIsStale:](v2->_sysConfig, "isBetaUserWithIsStale:", 0));
    v51[9] = v41;
    v50[10] = @"UserSettingsLanguageCode";
    v40 = [(TRISystemConfiguration *)v2->_sysConfig userSettingsLanguageCode];
    v51[10] = v40;
    v50[11] = @"UserSettingsRegionCode";
    v39 = [(TRISystemConfiguration *)v2->_sysConfig userSettingsRegionCode];
    v15 = v39;
    if (!v39) {
      v15 = &stru_1F3455898;
    }
    v51[11] = v15;
    v50[12] = @"UserKeyboardEnabledInputModeIdentifiers";
    v38 = [(TRISystemConfiguration *)v2->_sysConfig enabledInputModeIdentifiers];
    v51[12] = v38;
    v50[13] = @"MarketingOSMajor";
    v37 = [NSNumber numberWithInteger:0];
    v51[13] = v37;
    v50[14] = @"MarketingOSMinor";
    v36 = [NSNumber numberWithInteger:0];
    v51[14] = v36;
    v50[15] = @"MarketingOSPatch";
    v35 = [NSNumber numberWithInteger:0];
    v51[15] = v35;
    v50[16] = @"TrialVersionTag";
    v34 = [(TRISystemConfiguration *)v2->_sysConfig trialVersionTag];
    v51[16] = v34;
    v50[17] = @"TrialVersionMajor";
    v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TRISystemConfiguration trialVersionMajor](v2->_sysConfig, "trialVersionMajor"));
    v51[17] = v33;
    v50[18] = @"TrialVersionMinor";
    v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TRISystemConfiguration trialVersionMinor](v2->_sysConfig, "trialVersionMinor"));
    v51[18] = v32;
    v50[19] = @"UserSettingsSiriLocale";
    uint64_t v16 = [(TRISystemConfiguration *)v2->_sysConfig userSettingsSiriLocale];
    v17 = (void *)v16;
    if (v16) {
      v18 = (__CFString *)v16;
    }
    else {
      v18 = &stru_1F3455898;
    }
    v51[19] = v18;
    v50[20] = @"BCP47DeviceLocale";
    v31 = [(TRISystemConfiguration *)v2->_sysConfig userSettingsBCP47DeviceLocale];
    v51[20] = v31;
    v50[21] = @"CarrierBundleIdentifier";
    v19 = [(TRISystemConfiguration *)v2->_sysConfig carrierBundleIdentifier];
    v51[21] = v19;
    v50[22] = @"CarrierCountryIsoCode";
    v20 = [(TRISystemConfiguration *)v2->_sysConfig carrierCountryIsoCode];
    v51[22] = v20;
    v50[23] = @"DiagnosticsUsageEnabled";
    v21 = objc_msgSend(NSNumber, "numberWithBool:", -[TRISystemConfiguration isDiagnosticsAndUsageEnabled](v2->_sysConfig, "isDiagnosticsAndUsageEnabled"));
    v51[23] = v21;
    v50[24] = @"HasANE";
    v22 = objc_msgSend(NSNumber, "numberWithBool:", -[TRISystemConfiguration hasAne](v2->_sysConfig, "hasAne"));
    v51[24] = v22;
    v50[25] = @"ANEVersion";
    uint64_t v23 = [(TRISystemConfiguration *)v2->_sysConfig aneVersion];
    v24 = (void *)v23;
    if (v23) {
      v25 = (__CFString *)v23;
    }
    else {
      v25 = &stru_1F3455898;
    }
    v51[25] = v25;
    v50[26] = @"IsAutomatedTestDevice";
    v26 = objc_msgSend(NSNumber, "numberWithBool:", -[TRISystemConfiguration isAutomatedTestDevice](v2->_sysConfig, "isAutomatedTestDevice"));
    v51[26] = v26;
    v50[27] = @"SiriUserActivitySegment";
    v27 = [(TRISystemConfiguration *)v2->_sysConfig siriUserActivitySegment];
    v51[27] = v27;
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:28];
    v29 = v2->_dictionary;
    v2->_dictionary = (NSDictionary *)v28;

    dictionary = v2->_dictionary;
  }
  id v10 = dictionary;
LABEL_22:
  objc_sync_exit(v2);

  return v10;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  int v5 = [(TRISystemCovariates *)self dictionary];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_sysConfig, 0);
}

@end