@interface SUCoreDocumentation
+ (BOOL)supportsSecureCoding;
- (BOOL)isRecommendedUpdateApplicable;
- (BOOL)notificationEnabled;
- (BOOL)recommendedUpdateApplicable;
- (BOOL)recommendedUpdateEnabled;
- (NSData)licenseAgreement;
- (NSData)releaseNotes;
- (NSData)releaseNotesSummary;
- (NSData)serverAssetMeasurement;
- (NSNumber)recommendedUpdateNotificationFrequencyDays;
- (NSNumber)slaVersion;
- (NSString)humanReadableMoreInfoLink;
- (NSString)humanReadableUpdateName;
- (NSString)humanReadableUpdateTitle;
- (NSString)humanReadableUpdateVersion;
- (NSString)language;
- (NSString)licenseAgreementFileName;
- (NSString)mandatoryUpdateBodyString;
- (NSString)notificationBodyString;
- (NSString)notificationTitleString;
- (NSString)preferencesIconFileName;
- (NSString)productVersion;
- (NSString)recommendedUpdateAlertBodyString;
- (NSString)recommendedUpdateMaxOSVersion;
- (NSString)recommendedUpdateMinOSVersion;
- (NSString)recommendedUpdateTitleString;
- (NSString)releaseNotesFileName;
- (NSString)releaseNotesSummaryFileName;
- (NSString)serverAssetAlgorithm;
- (NSURL)localBundleURL;
- (NSURL)serverAssetURL;
- (SUCoreDocumentation)initWithCoder:(id)a3;
- (SUCoreDocumentation)initWithDocumentationAsset:(id)a3;
- (SUCoreDocumentation)initWithLocalBundleURL:(id)a3 attributes:(id)a4;
- (id)_extendDocumentationProperties;
- (id)_extendDocumentationPropertiesWithSimulateEvent:(id)a3;
- (id)_resourceFromBundle:(__CFBundle *)a3 forKey:(id)a4;
- (id)description;
- (id)extendDocumentationProperties;
- (id)softwareUpdateIconImage;
- (id)softwareUpdateIconImagePath;
- (id)summary;
- (int64_t)serverAssetChunkSize;
- (void)encodeWithCoder:(id)a3;
- (void)isRecommendedUpdateApplicable;
- (void)setHumanReadableMoreInfoLink:(id)a3;
- (void)setHumanReadableUpdateName:(id)a3;
- (void)setHumanReadableUpdateTitle:(id)a3;
- (void)setHumanReadableUpdateVersion:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLicenseAgreement:(id)a3;
- (void)setLicenseAgreementFileName:(id)a3;
- (void)setLocalBundleURL:(id)a3;
- (void)setMandatoryUpdateBodyString:(id)a3;
- (void)setNotificationBodyString:(id)a3;
- (void)setNotificationEnabled:(BOOL)a3;
- (void)setNotificationTitleString:(id)a3;
- (void)setPreferencesIconFileName:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setRecommendedUpdateAlertBodyString:(id)a3;
- (void)setRecommendedUpdateApplicable:(BOOL)a3;
- (void)setRecommendedUpdateEnabled:(BOOL)a3;
- (void)setRecommendedUpdateMaxOSVersion:(id)a3;
- (void)setRecommendedUpdateMinOSVersion:(id)a3;
- (void)setRecommendedUpdateNotificationFrequencyDays:(id)a3;
- (void)setRecommendedUpdateTitleString:(id)a3;
- (void)setReleaseNotes:(id)a3;
- (void)setReleaseNotesFileName:(id)a3;
- (void)setReleaseNotesSummary:(id)a3;
- (void)setReleaseNotesSummaryFileName:(id)a3;
- (void)setServerAssetAlgorithm:(id)a3;
- (void)setServerAssetChunkSize:(int64_t)a3;
- (void)setServerAssetMeasurement:(id)a3;
- (void)setServerAssetURL:(id)a3;
- (void)setSlaVersion:(id)a3;
- (void)softwareUpdateIconImage;
- (void)softwareUpdateIconImagePath;
@end

@implementation SUCoreDocumentation

- (SUCoreDocumentation)initWithDocumentationAsset:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v26 = [MEMORY[0x263F77DA8] sharedDiag];
    v27 = v26;
    v28 = @"unable to create SU documentation: nil update asset";
    goto LABEL_21;
  }
  uint64_t v6 = [v4 attributes];
  if (!v6
    || (v7 = (void *)v6,
        [v5 attributes],
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        v7,
        !v9))
  {
    v26 = [MEMORY[0x263F77DA8] sharedDiag];
    v27 = v26;
    v28 = @"unable to create SU documentation: documentation asset without attributes";
LABEL_21:
    [v26 trackError:@"[DOCUMENTATION]" forReason:v28 withResult:8100 withError:0];

    v25 = 0;
    goto LABEL_22;
  }
  v10 = [v5 getLocalUrl];
  if (!v10)
  {
    v11 = [MEMORY[0x263F77DE8] sharedLogger];
    v12 = [v11 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v12, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Attempting to create a documentation instance with no localBundleURL (non-fatal)", buf, 2u);
    }
  }
  v13 = [v5 attributes];
  v14 = [(SUCoreDocumentation *)self initWithLocalBundleURL:v10 attributes:v13];

  v15 = [v5 assetServerUrl];
  [(SUCoreDocumentation *)v14 setServerAssetURL:v15];

  v16 = [MEMORY[0x263F77DA0] sharedDevice];
  int v17 = [v16 isBootedOSSecureInternal];

  if (v17)
  {
    v18 = [MEMORY[0x263F08850] defaultManager];
    if (([v18 fileExistsAtPath:&stru_26C1810A0] & 1) == 0)
    {
      v19 = [MEMORY[0x263F77DE8] sharedLogger];
      v20 = [v19 oslog];

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20C8EA000, v20, OS_LOG_TYPE_DEFAULT, "[SU Documentation Preview] Plist not found... creating a default plist", buf, 2u);
      }

      id v30 = 0;
      char v21 = [@"<?xml version=\"1.0\" encoding=\"UTF-8\"?>     <!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">     <plist version=\"1.0\">     <dict>         <key>MobileAssetNewPath</key>         <string></string>     </dict>     </plist>" writeToFile:&stru_26C1810A0 atomically:1 encoding:4 error:&v30];
      id v22 = v30;
      if ((v21 & 1) == 0)
      {
        v23 = [MEMORY[0x263F77DE8] sharedLogger];
        v24 = [v23 oslog];

        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v32 = v22;
          _os_log_impl(&dword_20C8EA000, v24, OS_LOG_TYPE_DEFAULT, "[SU Documentation Preview] Error creating plist: %@", buf, 0xCu);
        }
      }
    }
  }
  self = v14;

  v25 = self;
LABEL_22:

  return v25;
}

- (SUCoreDocumentation)initWithLocalBundleURL:(id)a3 attributes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v56.receiver = self;
    v56.super_class = (Class)SUCoreDocumentation;
    uint64_t v9 = [(SUCoreDocumentation *)&v56 init];
    if (v9)
    {
      uint64_t v10 = [v8 safeStringForKey:@"OSVersion"];
      productVersion = v9->_productVersion;
      v9->_productVersion = (NSString *)v10;

      uint64_t v12 = [v8 safeObjectForKey:@"SUSLAVersionRequired" ofClass:objc_opt_class()];
      slaVersion = v9->_slaVersion;
      v9->_slaVersion = (NSNumber *)v12;

      objc_storeStrong((id *)&v9->_localBundleURL, a3);
      serverAssetURL = v9->_serverAssetURL;
      v9->_serverAssetURL = 0;

      uint64_t v15 = [v8 safeDataForKey:@"_Measurement"];
      serverAssetMeasurement = v9->_serverAssetMeasurement;
      v9->_serverAssetMeasurement = (NSData *)v15;

      uint64_t v17 = [v8 safeStringForKey:@"_MeasurementAlgorithm"];
      serverAssetAlgorithm = v9->_serverAssetAlgorithm;
      v9->_serverAssetAlgorithm = (NSString *)v17;

      v19 = [v8 safeObjectForKey:@"_DownloadSize" ofClass:objc_opt_class()];
      v9->_serverAssetChunkSize = [v19 longLongValue];

      v9->_notificationEnabled = [v8 safeBooleanForKey:@"NotificationEnabled"];
      v20 = [v8 safeDictionaryForKey:@"RecommendedUpdate"];
      char v21 = v20;
      if (v20)
      {
        v9->_recommendedUpdateEnabled = [v20 safeBooleanForKey:@"Enabled"];
        uint64_t v22 = [v21 safeStringForKey:@"MinOSVersion"];
        recommendedUpdateMinOSVersion = v9->_recommendedUpdateMinOSVersion;
        v9->_recommendedUpdateMinOSVersion = (NSString *)v22;

        uint64_t v24 = [v21 safeStringForKey:@"MaxOSVersion"];
        recommendedUpdateMaxOSVersion = v9->_recommendedUpdateMaxOSVersion;
        v9->_recommendedUpdateMaxOSVersion = (NSString *)v24;

        v9->_recommendedUpdateApplicable = [(SUCoreDocumentation *)v9 isRecommendedUpdateApplicable];
        v26 = [v21 objectForKey:@"NotificationFrequencyDays"];

        if (v26) {
          objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v21, "safeIntegerForKey:", @"NotificationFrequencyDays"));
        }
        else {
        uint64_t v27 = [NSNumber numberWithInt:3];
        }
        recommendedUpdateNotificationFrequencyDays = v9->_recommendedUpdateNotificationFrequencyDays;
        v9->_recommendedUpdateNotificationFrequencyDays = (NSNumber *)v27;
      }
      else
      {
        *(_WORD *)&v9->_recommendedUpdateEnabled = 0;
        id v30 = v9->_recommendedUpdateMinOSVersion;
        v9->_recommendedUpdateMinOSVersion = 0;

        v31 = v9->_recommendedUpdateMaxOSVersion;
        v9->_recommendedUpdateMaxOSVersion = 0;

        recommendedUpdateNotificationFrequencyDays = v9->_recommendedUpdateNotificationFrequencyDays;
        v9->_recommendedUpdateNotificationFrequencyDays = 0;
      }

      uint64_t v33 = [v8 safeStringForKey:@"ReleaseNotesSummaryFileName"];
      releaseNotesSummaryFileName = v9->_releaseNotesSummaryFileName;
      v9->_releaseNotesSummaryFileName = (NSString *)v33;

      if (!v9->_releaseNotesSummaryFileName)
      {
        v9->_releaseNotesSummaryFileName = (NSString *)@"ReadMeSummary";
      }
      uint64_t v35 = [v8 safeStringForKey:@"ReleaseNotesFileName"];
      releaseNotesFileName = v9->_releaseNotesFileName;
      v9->_releaseNotesFileName = (NSString *)v35;

      if (!v9->_releaseNotesFileName)
      {
        v9->_releaseNotesFileName = (NSString *)@"ReadMe";
      }
      uint64_t v37 = [v8 safeStringForKey:@"LicenseAgreementFileName"];
      licenseAgreementFileName = v9->_licenseAgreementFileName;
      v9->_licenseAgreementFileName = (NSString *)v37;

      if (!v9->_licenseAgreementFileName)
      {
        v9->_licenseAgreementFileName = (NSString *)@"License";
      }
      uint64_t v39 = [v8 safeStringForKey:@"PreferencesIconFileName"];
      preferencesIconFileName = v9->_preferencesIconFileName;
      v9->_preferencesIconFileName = (NSString *)v39;

      if (!v9->_preferencesIconFileName)
      {
        v9->_preferencesIconFileName = (NSString *)@"PreferencesIcon";
      }
      language = v9->_language;
      v9->_language = (NSString *)@"en";

      v42 = [MEMORY[0x263EFF960] preferredLanguages];
      v43 = v42;
      if (v42 && [v42 count])
      {
        uint64_t v44 = [v43 objectAtIndex:0];
        v45 = v9->_language;
        v9->_language = (NSString *)v44;
      }
      humanReadableUpdateName = v9->_humanReadableUpdateName;
      v9->_humanReadableUpdateName = 0;

      humanReadableUpdateTitle = v9->_humanReadableUpdateTitle;
      v9->_humanReadableUpdateTitle = 0;

      humanReadableUpdateVersion = v9->_humanReadableUpdateVersion;
      v9->_humanReadableUpdateVersion = 0;

      humanReadableMoreInfoLink = v9->_humanReadableMoreInfoLink;
      v9->_humanReadableMoreInfoLink = 0;

      notificationTitleString = v9->_notificationTitleString;
      v9->_notificationTitleString = 0;

      notificationBodyString = v9->_notificationBodyString;
      v9->_notificationBodyString = 0;

      recommendedUpdateTitleString = v9->_recommendedUpdateTitleString;
      v9->_recommendedUpdateTitleString = 0;

      recommendedUpdateAlertBodyString = v9->_recommendedUpdateAlertBodyString;
      v9->_recommendedUpdateAlertBodyString = 0;

      mandatoryUpdateBodyString = v9->_mandatoryUpdateBodyString;
      v9->_mandatoryUpdateBodyString = 0;
    }
    self = v9;
    v29 = self;
  }
  else
  {
    v28 = [MEMORY[0x263F77DA8] sharedDiag];
    [v28 trackError:@"[DOCUMENTATION]" forReason:@"unable to create SU documentation with no attributes dictionary" withResult:8100 withError:0];

    v29 = 0;
  }

  return v29;
}

- (id)extendDocumentationProperties
{
  v3 = [MEMORY[0x263F77E20] sharedSimulator];
  id v4 = [v3 begin:@"documentation" atFunction:@"extendDocumentationProperties"];

  if (v4)
  {
    v5 = [(SUCoreDocumentation *)self _extendDocumentationPropertiesWithSimulateEvent:v4];
  }
  else
  {
    v5 = [(SUCoreDocumentation *)self _extendDocumentationProperties];
    uint64_t v6 = [MEMORY[0x263F77E20] sharedSimulator];
    id v7 = [v6 end:@"documentation" atFunction:@"extendDocumentationProperties"];

    if (v7)
    {
      uint64_t v8 = [(SUCoreDocumentation *)self _extendDocumentationPropertiesWithSimulateEvent:v7];

      v5 = (void *)v8;
    }
  }

  return v5;
}

- (id)_extendDocumentationPropertiesWithSimulateEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 simAction];
  if (v5 == 3)
  {
    id v7 = [NSURL URLWithString:@"SimulatedLocalBundelURL"];
    [(SUCoreDocumentation *)self setLocalBundleURL:v7];

    [(SUCoreDocumentation *)self setHumanReadableUpdateName:@"SimulatedHumanReadableUpdateName"];
    [(SUCoreDocumentation *)self setHumanReadableUpdateTitle:@"SimulatedHumanReadableUpdateTitle"];
    [(SUCoreDocumentation *)self setHumanReadableUpdateVersion:@"SimulatedHumanReadableUpdateVersion"];
    [(SUCoreDocumentation *)self setHumanReadableMoreInfoLink:@"SimulatedHumanReadableMoreInfoLink"];
    [(SUCoreDocumentation *)self setNotificationEnabled:1];
    [(SUCoreDocumentation *)self setNotificationTitleString:@"SimulatedNotificationTitleString"];
    [(SUCoreDocumentation *)self setNotificationBodyString:@"SimulatedNotificationBodyString"];
    [(SUCoreDocumentation *)self setRecommendedUpdateEnabled:1];
    [(SUCoreDocumentation *)self setRecommendedUpdateApplicable:1];
    uint64_t v8 = [NSNumber numberWithInt:1];
    [(SUCoreDocumentation *)self setRecommendedUpdateNotificationFrequencyDays:v8];

    [(SUCoreDocumentation *)self setRecommendedUpdateMinOSVersion:@"SimulatedRecommendedUpdateMinOSVersion"];
    [(SUCoreDocumentation *)self setRecommendedUpdateMaxOSVersion:@"SimulatedRecommendedUpdateMaxOSVersion"];
    [(SUCoreDocumentation *)self setRecommendedUpdateTitleString:@"SimulatedRecommendedUpdateTitleString"];
    [(SUCoreDocumentation *)self setRecommendedUpdateAlertBodyString:@"SimulatedRecommendedUpdateAlertBodyString"];
    [(SUCoreDocumentation *)self setMandatoryUpdateBodyString:@"SimulatedMandatoryUpdateBodyString"];
    uint64_t v9 = [@"SimulatedReleaseNotesSummary" dataUsingEncoding:4];
    [(SUCoreDocumentation *)self setReleaseNotesSummary:v9];

    uint64_t v10 = [@"SimulatedReleaseNotes" dataUsingEncoding:4];
    [(SUCoreDocumentation *)self setReleaseNotes:v10];

    v11 = [@"SimulatedLicenseAgreement" dataUsingEncoding:4];
    [(SUCoreDocumentation *)self setLicenseAgreement:v11];
  }
  else
  {
    if (v5 == 1)
    {
      uint64_t v6 = [v4 buildErrorWithDescription:@"Simulated extendDocumentationProperties error"];
      goto LABEL_7;
    }
    uint64_t v12 = [MEMORY[0x263F77DA8] sharedDiag];
    v13 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v4];
    [v12 trackAnomaly:@"_extendDocumentationPropertiesWithSimulateEvent" forReason:v13 withResult:8113 withError:0];
  }
  uint64_t v6 = 0;
LABEL_7:

  return v6;
}

- (id)_extendDocumentationProperties
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F77DA0] sharedDevice];
  int v4 = [v3 isBootedOSSecureInternal];

  if (v4)
  {
    uint64_t v5 = [NSDictionary dictionaryWithContentsOfFile:&stru_26C1810A0];
    uint64_t v6 = [v5 valueForKey:@"MobileAssetNewPath"];
    if (v6)
    {
      id v7 = [MEMORY[0x263F08850] defaultManager];
      int v8 = [v7 fileExistsAtPath:v6];

      uint64_t v9 = [MEMORY[0x263F77DE8] sharedLogger];
      uint64_t v10 = [v9 oslog];

      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v11)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "[SU Documentation Preview] Overriding documentation assets with custom path", buf, 2u);
        }

        uint64_t v12 = [NSURL fileURLWithPath:v6];
        [(SUCoreDocumentation *)self setLocalBundleURL:v12];

        v13 = [MEMORY[0x263F77DE8] sharedLogger];
        uint64_t v10 = [v13 oslog];

        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v14 = [(SUCoreDocumentation *)self localBundleURL];
          *(_DWORD *)buf = 138412290;
          v88 = v14;
          _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "[SU Documentation Preview] New Local Bundle: %@", buf, 0xCu);
        }
        goto LABEL_13;
      }
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        v88 = v6;
        v16 = "[SU Documentation Preview] Invalid Update path: %@";
        uint64_t v17 = v10;
        uint32_t v18 = 12;
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v15 = [MEMORY[0x263F77DE8] sharedLogger];
      uint64_t v10 = [v15 oslog];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = "[SU Documentation Preview] Unable to find alternate local bundle URL";
        uint64_t v17 = v10;
        uint32_t v18 = 2;
LABEL_12:
        _os_log_impl(&dword_20C8EA000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
LABEL_13:
  }
  v19 = [(SUCoreDocumentation *)self localBundleURL];

  if (v19)
  {
    CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFURLRef v21 = [(SUCoreDocumentation *)self localBundleURL];
    uint64_t v22 = CFBundleCreate(v20, v21);

    if (v22)
    {
      v23 = (SUCoreDocumentation *)CFBundleCopyLocalizedString(v22, @"HumanReadableUpdateName", 0, @"documentation");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (int v25 = [(SUCoreDocumentation *)v23 isEqualToString:@"HumanReadableUpdateName"],
            uint64_t v24 = v23,
            v25))
      {
        v26 = objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger", v24);
        uint64_t v27 = [v26 oslog];

        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = v23;
          _os_log_impl(&dword_20C8EA000, v27, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Unable to load humanReadableUpdateName: %{public}@", buf, 0xCu);
        }

        uint64_t v24 = 0;
      }
      [(SUCoreDocumentation *)self setHumanReadableUpdateName:v24];
      v28 = (__CFString *)CFBundleCopyLocalizedString(v22, @"HumanReadableUpdateTitle", 0, @"documentation");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (int v30 = [(__CFString *)v28 isEqualToString:@"HumanReadableUpdateTitle"],
            v29 = v28,
            v30))
      {
        v31 = objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger", v29);
        id v32 = [v31 oslog];

        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v28;
          _os_log_impl(&dword_20C8EA000, v32, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Unable to load humanReadableUpdateTitle: %{public}@", buf, 0xCu);
        }

        v29 = 0;
      }
      [(SUCoreDocumentation *)self setHumanReadableUpdateTitle:v29];
      uint64_t v33 = (__CFString *)CFBundleCopyLocalizedString(v22, @"HumanReadableUpdateVersion", 0, @"documentation");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (int v35 = [(__CFString *)v33 isEqualToString:@"HumanReadableUpdateVersion"],
            v34 = v33,
            v35))
      {
        v36 = objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger", v34);
        uint64_t v37 = [v36 oslog];

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v33;
          _os_log_impl(&dword_20C8EA000, v37, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Unable to load humanReadableUpdateVersion: %{public}@", buf, 0xCu);
        }

        v34 = 0;
      }
      [(SUCoreDocumentation *)self setHumanReadableUpdateVersion:v34];
      v38 = (__CFString *)CFBundleCopyLocalizedString(v22, @"HumanReadableMoreInfoLink", 0, @"documentation");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (int v40 = [(__CFString *)v38 isEqualToString:@"HumanReadableMoreInfoLink"],
            uint64_t v39 = v38,
            v40))
      {
        v41 = objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger", v39);
        v42 = [v41 oslog];

        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v38;
          _os_log_impl(&dword_20C8EA000, v42, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Unable to load humanReadableMoreInfoLink: %{public}@", buf, 0xCu);
        }

        uint64_t v39 = 0;
      }
      v86 = v28;
      [(SUCoreDocumentation *)self setHumanReadableMoreInfoLink:v39];
      v43 = (__CFString *)CFBundleCopyLocalizedString(v22, @"NotificationTitleString", 0, @"documentation");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (int v45 = [(__CFString *)v43 isEqualToString:@"NotificationTitleString"],
            uint64_t v44 = v43,
            v45))
      {
        v46 = objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger", v44);
        v47 = [v46 oslog];

        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v43;
          _os_log_impl(&dword_20C8EA000, v47, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Unable to load notificationTitleString: %{public}@", buf, 0xCu);
        }

        uint64_t v44 = 0;
      }
      v85 = v33;
      [(SUCoreDocumentation *)self setNotificationTitleString:v44];
      v48 = (__CFString *)CFBundleCopyLocalizedString(v22, @"NotificationBodyString", 0, @"documentation");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (int v50 = [(__CFString *)v48 isEqualToString:@"NotificationBodyString"],
            v49 = v48,
            v50))
      {
        v51 = objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger", v49);
        v52 = [v51 oslog];

        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v48;
          _os_log_impl(&dword_20C8EA000, v52, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Unable to load notificationBodyString: %{public}@", buf, 0xCu);
        }

        v49 = 0;
      }
      v84 = v38;
      [(SUCoreDocumentation *)self setNotificationBodyString:v49];
      v53 = (__CFString *)CFBundleCopyLocalizedString(v22, @"RecommendedUpdateTitleString", 0, @"documentation");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (int v55 = [(__CFString *)v53 isEqualToString:@"RecommendedUpdateTitleString"],
            v54 = v53,
            v55))
      {
        objc_super v56 = objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger", v54);
        v57 = [v56 oslog];

        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v53;
          _os_log_impl(&dword_20C8EA000, v57, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Unable to load recommendedUpdateTitleString: %{public}@", buf, 0xCu);
        }

        v54 = 0;
      }
      [(SUCoreDocumentation *)self setRecommendedUpdateTitleString:v54];
      v58 = (__CFString *)CFBundleCopyLocalizedString(v22, @"RecommendedUpdateAlertBodyString", 0, @"documentation");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (int v60 = [(__CFString *)v58 isEqualToString:@"RecommendedUpdateAlertBodyString"],
            v59 = v58,
            v60))
      {
        v61 = objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger", v59);
        v62 = [v61 oslog];

        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v58;
          _os_log_impl(&dword_20C8EA000, v62, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Unable to load recommendedUpdateAlertBodyString: %{public}@", buf, 0xCu);
        }

        v59 = 0;
      }
      [(SUCoreDocumentation *)self setRecommendedUpdateAlertBodyString:v59];
      v63 = (__CFString *)CFBundleCopyLocalizedString(v22, @"MandatoryUpdateBodyString", 0, @"documentation");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (int v65 = [(__CFString *)v63 isEqualToString:@"MandatoryUpdateBodyString"],
            v64 = v63,
            v65))
      {
        v66 = objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger", v64);
        v67 = [v66 oslog];

        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v63;
          _os_log_impl(&dword_20C8EA000, v67, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Unable to load mandatoryUpdateBodyString: %{public}@", buf, 0xCu);
        }

        v64 = 0;
      }
      [(SUCoreDocumentation *)self setMandatoryUpdateBodyString:v64];
      v68 = [(SUCoreDocumentation *)self releaseNotesSummaryFileName];
      v69 = [(SUCoreDocumentation *)self _resourceFromBundle:v22 forKey:v68];
      [(SUCoreDocumentation *)self setReleaseNotesSummary:v69];

      v70 = [(SUCoreDocumentation *)self releaseNotesFileName];
      v71 = [(SUCoreDocumentation *)self _resourceFromBundle:v22 forKey:v70];
      [(SUCoreDocumentation *)self setReleaseNotes:v71];

      v72 = [(SUCoreDocumentation *)self licenseAgreementFileName];
      v73 = [(SUCoreDocumentation *)self _resourceFromBundle:v22 forKey:v72];
      [(SUCoreDocumentation *)self setLicenseAgreement:v73];

      v74 = [MEMORY[0x263F77DE8] sharedLogger];
      v75 = [v74 oslog];

      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v88 = self;
        _os_log_impl(&dword_20C8EA000, v75, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Successfully extended documentation properties: %{public}@", buf, 0xCu);
      }

      CFRelease(v22);
      v76 = 0;
    }
    else
    {
      v78 = [MEMORY[0x263F77D78] sharedCore];
      v79 = NSString;
      v80 = [(SUCoreDocumentation *)self localBundleURL];
      v81 = [v79 stringWithFormat:@"unable to load asset bundle for the local bundle URL of the documentation asset: %@", v80];
      v76 = [v78 buildError:8100 underlying:0 description:v81];

      v23 = [MEMORY[0x263F77DA8] sharedDiag];
      v82 = [v76 localizedDescription];
      [(SUCoreDocumentation *)v23 trackError:@"[DOCUMENTATION]" forReason:v82 withResult:8100 withError:v76];
    }
  }
  else
  {
    v77 = [MEMORY[0x263F77D78] sharedCore];
    v76 = [v77 buildError:8101 underlying:0 description:@"unable to find local bundle URL for documentation asset"];

    v23 = [MEMORY[0x263F77DA8] sharedDiag];
    [(SUCoreDocumentation *)v23 trackError:@"[DOCUMENTATION]" forReason:@"unable to find local bundle URL for documentation asset" withResult:8101 withError:v76];
  }

  return v76;
}

- (id)_resourceFromBundle:(__CFBundle *)a3 forKey:(id)a4
{
  CFURLRef v4 = CFBundleCopyResourceURL(a3, (CFStringRef)a4, @"html", 0);
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isRecommendedUpdateApplicable
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ([(SUCoreDocumentation *)self recommendedUpdateEnabled])
  {
    v3 = [MEMORY[0x263F77DA0] sharedDevice];
    CFURLRef v4 = [v3 productVersion];

    uint64_t v5 = [(SUCoreDocumentation *)self recommendedUpdateMinOSVersion];
    if (v5
      && (uint64_t v6 = (void *)v5,
          [(SUCoreDocumentation *)self recommendedUpdateMaxOSVersion],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7)
      && v4)
    {
      int v8 = [(SUCoreDocumentation *)self recommendedUpdateMinOSVersion];
      uint64_t v9 = [v8 compare:v4 options:64];

      uint64_t v10 = [(SUCoreDocumentation *)self recommendedUpdateMaxOSVersion];
      uint64_t v11 = [v4 compare:v10 options:64];

      BOOL v13 = v9 != 1 && v11 != 1;
      v14 = [MEMORY[0x263F77DE8] sharedLogger];
      uint64_t v15 = [v14 oslog];

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [(SUCoreDocumentation *)self recommendedUpdateMinOSVersion];
        uint64_t v17 = [(SUCoreDocumentation *)self recommendedUpdateMaxOSVersion];
        uint32_t v18 = (void *)v17;
        v19 = @"NO";
        int v23 = 138544130;
        uint64_t v24 = v16;
        if (v13) {
          v19 = @"YES";
        }
        __int16 v25 = 2114;
        v26 = v4;
        __int16 v27 = 2114;
        uint64_t v28 = v17;
        __int16 v29 = 2114;
        int v30 = v19;
        _os_log_impl(&dword_20C8EA000, v15, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] recommendedUpdateMinOSVersion=%{public}@ <= currentOSVersion=%{public}@ <= recommendedUpdateMaxOSVersion=%{public}@ | isRecommendedUpdateApplicable=%{public}@", (uint8_t *)&v23, 0x2Au);
      }
    }
    else
    {
      CFURLRef v21 = [MEMORY[0x263F77DE8] sharedLogger];
      uint64_t v15 = [v21 oslog];

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        [(SUCoreDocumentation *)self isRecommendedUpdateApplicable];
      }
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    CFAllocatorRef v20 = [MEMORY[0x263F77DE8] sharedLogger];
    CFURLRef v4 = [v20 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDocumentation isRecommendedUpdateApplicable]();
    }
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (id)softwareUpdateIconImagePath
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [(SUCoreDocumentation *)self localBundleURL];

  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v10 = [v11 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDocumentation softwareUpdateIconImagePath]();
    }
    goto LABEL_9;
  }
  CFURLRef v4 = [(SUCoreDocumentation *)self preferencesIconFileName];

  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v10 = [v12 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDocumentation softwareUpdateIconImagePath]();
    }
LABEL_9:
    int v8 = 0;
    goto LABEL_10;
  }
  uint64_t v5 = [(SUCoreDocumentation *)self localBundleURL];
  uint64_t v6 = [v5 path];
  id v7 = [(SUCoreDocumentation *)self preferencesIconFileName];
  int v8 = [v6 stringByAppendingPathComponent:v7];

  uint64_t v9 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v10 = [v9 oslog];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    uint64_t v15 = v8;
    _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Using icon path: %{public}@", (uint8_t *)&v14, 0xCu);
  }
LABEL_10:

  return v8;
}

- (id)softwareUpdateIconImage
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  getUIImageClass();
  if (!objc_opt_class())
  {
    uint64_t v17 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v6 = [v17 oslog];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDocumentation softwareUpdateIconImage]();
    }
    goto LABEL_16;
  }
  v3 = [(SUCoreDocumentation *)self localBundleURL];

  if (!v3)
  {
    uint32_t v18 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v6 = [v18 oslog];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDocumentation softwareUpdateIconImage]();
    }
    goto LABEL_16;
  }
  CFURLRef v4 = [(SUCoreDocumentation *)self preferencesIconFileName];

  uint64_t v5 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v6 = [v5 oslog];

  if (!v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDocumentation softwareUpdateIconImage]();
    }
LABEL_16:
    BOOL v13 = 0;
    goto LABEL_23;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(SUCoreDocumentation *)self localBundleURL];
    int v8 = [(SUCoreDocumentation *)self preferencesIconFileName];
    int v21 = 138543618;
    uint64_t v22 = v7;
    __int16 v23 = 2114;
    uint64_t v24 = v8;
    _os_log_impl(&dword_20C8EA000, v6, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Loading bundle with localBundleURL:%{public}@ preferencesIconFileName:%{public}@", (uint8_t *)&v21, 0x16u);
  }
  uint64_t v9 = (void *)MEMORY[0x263F086E0];
  uint64_t v10 = [(SUCoreDocumentation *)self localBundleURL];
  uint64_t v6 = [v9 bundleWithURL:v10];

  if (v6)
  {
    id UIImageClass = getUIImageClass();
    uint64_t v12 = [(SUCoreDocumentation *)self preferencesIconFileName];
    BOOL v13 = [UIImageClass imageNamed:v12 inBundle:v6 withConfiguration:0];

    int v14 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v15 = [v14 oslog];

    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [(SUCoreDocumentation *)self preferencesIconFileName];
        int v21 = 138543362;
        uint64_t v22 = v16;
        _os_log_impl(&dword_20C8EA000, v15, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Successfully loaded update icon bundle with name: %{public}@", (uint8_t *)&v21, 0xCu);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[SUCoreDocumentation softwareUpdateIconImage].cold.5(self);
    }
  }
  else
  {
    v19 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v15 = [v19 oslog];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDocumentation softwareUpdateIconImage].cold.4(self);
    }
    BOOL v13 = 0;
  }

LABEL_23:

  return v13;
}

- (SUCoreDocumentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)SUCoreDocumentation;
  uint64_t v5 = [(SUCoreDocumentation *)&v60 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReleaseNotesSummary"];
    releaseNotesSummary = v5->_releaseNotesSummary;
    v5->_releaseNotesSummary = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReleaseNotes"];
    releaseNotes = v5->_releaseNotes;
    v5->_releaseNotes = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LicenseAgreement"];
    licenseAgreement = v5->_licenseAgreement;
    v5->_licenseAgreement = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HumanReadableUpdateName"];
    humanReadableUpdateName = v5->_humanReadableUpdateName;
    v5->_humanReadableUpdateName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HumanReadableUpdateTitle"];
    humanReadableUpdateTitle = v5->_humanReadableUpdateTitle;
    v5->_humanReadableUpdateTitle = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HumanReadableUpdateVersion"];
    humanReadableUpdateVersion = v5->_humanReadableUpdateVersion;
    v5->_humanReadableUpdateVersion = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HumanReadableMoreInfoLink"];
    humanReadableMoreInfoLink = v5->_humanReadableMoreInfoLink;
    v5->_humanReadableMoreInfoLink = (NSString *)v18;

    v5->_notificationEnabled = [v4 decodeBoolForKey:@"NotificationEnabled"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NotificationTitleString"];
    notificationTitleString = v5->_notificationTitleString;
    v5->_notificationTitleString = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NotificationBodyString"];
    notificationBodyString = v5->_notificationBodyString;
    v5->_notificationBodyString = (NSString *)v22;

    v5->_recommendedUpdateEnabled = [v4 decodeBoolForKey:@"RecommendedUpdateEnabled"];
    v5->_recommendedUpdateApplicable = [v4 decodeBoolForKey:@"RecommendedUpdateApplicable"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecommendedUpdateNotificationFrequencyDays"];
    recommendedUpdateNotificationFrequencyDays = v5->_recommendedUpdateNotificationFrequencyDays;
    v5->_recommendedUpdateNotificationFrequencyDays = (NSNumber *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecommendedUpdateMinOSVersion"];
    recommendedUpdateMinOSVersion = v5->_recommendedUpdateMinOSVersion;
    v5->_recommendedUpdateMinOSVersion = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecommendedUpdateMaxOSVersion"];
    recommendedUpdateMaxOSVersion = v5->_recommendedUpdateMaxOSVersion;
    v5->_recommendedUpdateMaxOSVersion = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecommendedUpdateTitleString"];
    recommendedUpdateTitleString = v5->_recommendedUpdateTitleString;
    v5->_recommendedUpdateTitleString = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecommendedUpdateAlertBodyString"];
    recommendedUpdateAlertBodyString = v5->_recommendedUpdateAlertBodyString;
    v5->_recommendedUpdateAlertBodyString = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MandatoryUpdateBodyString"];
    mandatoryUpdateBodyString = v5->_mandatoryUpdateBodyString;
    v5->_mandatoryUpdateBodyString = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductVersion"];
    productVersion = v5->_productVersion;
    v5->_productVersion = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SLAVersion"];
    slaVersion = v5->_slaVersion;
    v5->_slaVersion = (NSNumber *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LocalBundleURL"];
    localBundleURL = v5->_localBundleURL;
    v5->_localBundleURL = (NSURL *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServerAssetURL"];
    serverAssetURL = v5->_serverAssetURL;
    v5->_serverAssetURL = (NSURL *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServerAssetMeasurement"];
    serverAssetMeasurement = v5->_serverAssetMeasurement;
    v5->_serverAssetMeasurement = (NSData *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServerAssetAlgorithm"];
    serverAssetAlgorithm = v5->_serverAssetAlgorithm;
    v5->_serverAssetAlgorithm = (NSString *)v46;

    v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServerAssetChuckSize"];
    v5->_serverAssetChunkSize = [v48 longLongValue];

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReleaseNotesSummaryFileName"];
    releaseNotesSummaryFileName = v5->_releaseNotesSummaryFileName;
    v5->_releaseNotesSummaryFileName = (NSString *)v49;

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReleaseNotesFileName"];
    releaseNotesFileName = v5->_releaseNotesFileName;
    v5->_releaseNotesFileName = (NSString *)v51;

    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LicenseAgreementFileName"];
    licenseAgreementFileName = v5->_licenseAgreementFileName;
    v5->_licenseAgreementFileName = (NSString *)v53;

    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreferencesIconFileName"];
    preferencesIconFileName = v5->_preferencesIconFileName;
    v5->_preferencesIconFileName = (NSString *)v55;

    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Language"];
    language = v5->_language;
    v5->_language = (NSString *)v57;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUCoreDocumentation *)self releaseNotesSummary];
  [v4 encodeObject:v5 forKey:@"ReleaseNotesSummary"];

  uint64_t v6 = [(SUCoreDocumentation *)self releaseNotes];
  [v4 encodeObject:v6 forKey:@"ReleaseNotes"];

  id v7 = [(SUCoreDocumentation *)self licenseAgreement];
  [v4 encodeObject:v7 forKey:@"LicenseAgreement"];

  uint64_t v8 = [(SUCoreDocumentation *)self humanReadableUpdateName];
  [v4 encodeObject:v8 forKey:@"HumanReadableUpdateName"];

  uint64_t v9 = [(SUCoreDocumentation *)self humanReadableUpdateTitle];
  [v4 encodeObject:v9 forKey:@"HumanReadableUpdateTitle"];

  uint64_t v10 = [(SUCoreDocumentation *)self humanReadableUpdateVersion];
  [v4 encodeObject:v10 forKey:@"HumanReadableUpdateVersion"];

  uint64_t v11 = [(SUCoreDocumentation *)self humanReadableMoreInfoLink];
  [v4 encodeObject:v11 forKey:@"HumanReadableMoreInfoLink"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SUCoreDocumentation notificationEnabled](self, "notificationEnabled"), @"NotificationEnabled");
  uint64_t v12 = [(SUCoreDocumentation *)self notificationTitleString];
  [v4 encodeObject:v12 forKey:@"NotificationTitleString"];

  BOOL v13 = [(SUCoreDocumentation *)self notificationBodyString];
  [v4 encodeObject:v13 forKey:@"NotificationBodyString"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SUCoreDocumentation recommendedUpdateEnabled](self, "recommendedUpdateEnabled"), @"RecommendedUpdateEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCoreDocumentation recommendedUpdateApplicable](self, "recommendedUpdateApplicable"), @"RecommendedUpdateApplicable");
  uint64_t v14 = [(SUCoreDocumentation *)self recommendedUpdateNotificationFrequencyDays];
  [v4 encodeObject:v14 forKey:@"RecommendedUpdateNotificationFrequencyDays"];

  uint64_t v15 = [(SUCoreDocumentation *)self recommendedUpdateMinOSVersion];
  [v4 encodeObject:v15 forKey:@"RecommendedUpdateMinOSVersion"];

  uint64_t v16 = [(SUCoreDocumentation *)self recommendedUpdateMaxOSVersion];
  [v4 encodeObject:v16 forKey:@"RecommendedUpdateMaxOSVersion"];

  uint64_t v17 = [(SUCoreDocumentation *)self recommendedUpdateTitleString];
  [v4 encodeObject:v17 forKey:@"RecommendedUpdateTitleString"];

  uint64_t v18 = [(SUCoreDocumentation *)self recommendedUpdateAlertBodyString];
  [v4 encodeObject:v18 forKey:@"RecommendedUpdateAlertBodyString"];

  v19 = [(SUCoreDocumentation *)self mandatoryUpdateBodyString];
  [v4 encodeObject:v19 forKey:@"MandatoryUpdateBodyString"];

  uint64_t v20 = [(SUCoreDocumentation *)self productVersion];
  [v4 encodeObject:v20 forKey:@"ProductVersion"];

  int v21 = [(SUCoreDocumentation *)self slaVersion];
  [v4 encodeObject:v21 forKey:@"SLAVersion"];

  uint64_t v22 = [(SUCoreDocumentation *)self localBundleURL];
  [v4 encodeObject:v22 forKey:@"LocalBundleURL"];

  __int16 v23 = [(SUCoreDocumentation *)self serverAssetURL];
  [v4 encodeObject:v23 forKey:@"ServerAssetURL"];

  uint64_t v24 = [(SUCoreDocumentation *)self serverAssetMeasurement];
  [v4 encodeObject:v24 forKey:@"ServerAssetMeasurement"];

  uint64_t v25 = [(SUCoreDocumentation *)self serverAssetAlgorithm];
  [v4 encodeObject:v25 forKey:@"ServerAssetAlgorithm"];

  uint64_t v26 = objc_msgSend(NSNumber, "numberWithLongLong:", -[SUCoreDocumentation serverAssetChunkSize](self, "serverAssetChunkSize"));
  [v4 encodeObject:v26 forKey:@"ServerAssetChuckSize"];

  __int16 v27 = [(SUCoreDocumentation *)self releaseNotesSummaryFileName];
  [v4 encodeObject:v27 forKey:@"ReleaseNotesSummaryFileName"];

  uint64_t v28 = [(SUCoreDocumentation *)self releaseNotesFileName];
  [v4 encodeObject:v28 forKey:@"ReleaseNotesFileName"];

  __int16 v29 = [(SUCoreDocumentation *)self licenseAgreementFileName];
  [v4 encodeObject:v29 forKey:@"LicenseAgreementFileName"];

  uint64_t v30 = [(SUCoreDocumentation *)self preferencesIconFileName];
  [v4 encodeObject:v30 forKey:@"PreferencesIconFileName"];

  id v31 = [(SUCoreDocumentation *)self language];
  [v4 encodeObject:v31 forKey:@"Language"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v22 = [NSString alloc];
  int v35 = [(SUCoreDocumentation *)self releaseNotesSummary];
  uint64_t v37 = [(SUCoreDocumentation *)self releaseNotes];
  uint64_t v32 = [(SUCoreDocumentation *)self licenseAgreement];
  uint64_t v36 = [(SUCoreDocumentation *)self humanReadableUpdateName];
  uint64_t v34 = [(SUCoreDocumentation *)self humanReadableUpdateTitle];
  int v21 = [(SUCoreDocumentation *)self humanReadableUpdateVersion];
  uint64_t v33 = [(SUCoreDocumentation *)self humanReadableMoreInfoLink];
  if ([(SUCoreDocumentation *)self notificationEnabled]) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  uint64_t v20 = v3;
  id v31 = [(SUCoreDocumentation *)self notificationTitleString];
  v19 = [(SUCoreDocumentation *)self notificationBodyString];
  if ([(SUCoreDocumentation *)self recommendedUpdateEnabled]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  uint64_t v18 = v4;
  if ([(SUCoreDocumentation *)self recommendedUpdateApplicable]) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  uint64_t v17 = v5;
  uint64_t v30 = [(SUCoreDocumentation *)self recommendedUpdateNotificationFrequencyDays];
  __int16 v29 = [(SUCoreDocumentation *)self recommendedUpdateMinOSVersion];
  uint64_t v28 = [(SUCoreDocumentation *)self recommendedUpdateMaxOSVersion];
  __int16 v27 = [(SUCoreDocumentation *)self recommendedUpdateTitleString];
  uint64_t v26 = [(SUCoreDocumentation *)self recommendedUpdateAlertBodyString];
  uint64_t v25 = [(SUCoreDocumentation *)self mandatoryUpdateBodyString];
  uint64_t v24 = [(SUCoreDocumentation *)self productVersion];
  uint64_t v16 = [(SUCoreDocumentation *)self slaVersion];
  uint64_t v15 = [(SUCoreDocumentation *)self localBundleURL];
  uint64_t v6 = [(SUCoreDocumentation *)self serverAssetURL];
  id v7 = [(SUCoreDocumentation *)self serverAssetMeasurement];
  uint64_t v8 = [(SUCoreDocumentation *)self serverAssetAlgorithm];
  uint64_t v9 = [(SUCoreDocumentation *)self language];
  uint64_t v10 = [(SUCoreDocumentation *)self releaseNotesSummaryFileName];
  uint64_t v11 = [(SUCoreDocumentation *)self releaseNotesFileName];
  uint64_t v12 = [(SUCoreDocumentation *)self licenseAgreementFileName];
  BOOL v13 = [(SUCoreDocumentation *)self preferencesIconFileName];
  __int16 v23 = objc_msgSend(v22, "initWithFormat:", @"\n[>>>\n                        releaseNotesSummary: %@\n                               releaseNotes: %@\n                           licenseAgreement: %@\n                    humanReadableUpdateName: %@\n                   humanReadableUpdateTitle: %@\n                 humanReadableUpdateVersion: %@\n                  humanReadableMoreInfoLink: %@\n                        notificationEnabled: %@\n                    notificationTitleString: %@\n                     notificationBodyString: %@\n                   recommendedUpdateEnabled: %@\n                recommendedUpdateApplicable: %@\n recommendedUpdateNotificationFrequencyDays: %@\n              recommendedUpdateMinOSVersion: %@\n              recommendedUpdateMaxOSVersion: %@\n               recommendedUpdateTitleString: %@\n           recommendedUpdateAlertBodyString: %@\n                  mandatoryUpdateBodyString: %@\n                             productVersion: %@\n                                 slaVersion: %@\n                             localBundleURL: %@\n                             serverAssetURL: %@\n                     serverAssetMeasurement: %@\n                       serverAssetAlgorithm: %@\n                                   language: %@\n                releaseNotesSummaryFileName: %@\n                       releaseNotesFileName: %@\n                   licenseAgreementFileName: %@\n                    preferencesIconFileName: %@\n<<<]", v35, v37, v32, v36, v34, v21, v33, v20, v31, v19, v18, v17, v30, v29, v28, v27,
                  v26,
                  v25,
                  v24,
                  v16,
                  v15,
                  v6,
                  v7,
                  v8,
                  v9,
                  v10,
                  v11,
                  v12,
                  v13);

  return v23;
}

- (id)summary
{
  id v3 = [NSString alloc];
  id v4 = [(SUCoreDocumentation *)self localBundleURL];
  uint64_t v5 = [(SUCoreDocumentation *)self serverAssetURL];
  uint64_t v6 = (void *)[v3 initWithFormat:@"localBundleURL:%@, serverAssetURL:%@", v4, v5];

  return v6;
}

- (NSData)releaseNotesSummary
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setReleaseNotesSummary:(id)a3
{
}

- (NSData)releaseNotes
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReleaseNotes:(id)a3
{
}

- (NSData)licenseAgreement
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLicenseAgreement:(id)a3
{
}

- (NSString)humanReadableUpdateName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHumanReadableUpdateName:(id)a3
{
}

- (NSString)humanReadableUpdateTitle
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHumanReadableUpdateTitle:(id)a3
{
}

- (NSString)humanReadableUpdateVersion
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHumanReadableUpdateVersion:(id)a3
{
}

- (NSString)humanReadableMoreInfoLink
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHumanReadableMoreInfoLink:(id)a3
{
}

- (BOOL)notificationEnabled
{
  return self->_notificationEnabled;
}

- (void)setNotificationEnabled:(BOOL)a3
{
  self->_notificationEnabled = a3;
}

- (NSString)notificationTitleString
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNotificationTitleString:(id)a3
{
}

- (NSString)notificationBodyString
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNotificationBodyString:(id)a3
{
}

- (BOOL)recommendedUpdateEnabled
{
  return self->_recommendedUpdateEnabled;
}

- (void)setRecommendedUpdateEnabled:(BOOL)a3
{
  self->_recommendedUpdateEnabled = a3;
}

- (BOOL)recommendedUpdateApplicable
{
  return self->_recommendedUpdateApplicable;
}

- (void)setRecommendedUpdateApplicable:(BOOL)a3
{
  self->_recommendedUpdateApplicable = a3;
}

- (NSNumber)recommendedUpdateNotificationFrequencyDays
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRecommendedUpdateNotificationFrequencyDays:(id)a3
{
}

- (NSString)recommendedUpdateMinOSVersion
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRecommendedUpdateMinOSVersion:(id)a3
{
}

- (NSString)recommendedUpdateMaxOSVersion
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRecommendedUpdateMaxOSVersion:(id)a3
{
}

- (NSString)recommendedUpdateTitleString
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRecommendedUpdateTitleString:(id)a3
{
}

- (NSString)recommendedUpdateAlertBodyString
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setRecommendedUpdateAlertBodyString:(id)a3
{
}

- (NSString)mandatoryUpdateBodyString
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setMandatoryUpdateBodyString:(id)a3
{
}

- (NSString)productVersion
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setProductVersion:(id)a3
{
}

- (NSNumber)slaVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSlaVersion:(id)a3
{
}

- (NSURL)localBundleURL
{
  return (NSURL *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLocalBundleURL:(id)a3
{
}

- (NSURL)serverAssetURL
{
  return (NSURL *)objc_getProperty(self, a2, 160, 1);
}

- (void)setServerAssetURL:(id)a3
{
}

- (NSData)serverAssetMeasurement
{
  return (NSData *)objc_getProperty(self, a2, 168, 1);
}

- (void)setServerAssetMeasurement:(id)a3
{
}

- (NSString)serverAssetAlgorithm
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setServerAssetAlgorithm:(id)a3
{
}

- (int64_t)serverAssetChunkSize
{
  return self->_serverAssetChunkSize;
}

- (void)setServerAssetChunkSize:(int64_t)a3
{
  self->_serverAssetChunkSize = a3;
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLanguage:(id)a3
{
}

- (NSString)releaseNotesSummaryFileName
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setReleaseNotesSummaryFileName:(id)a3
{
}

- (NSString)releaseNotesFileName
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setReleaseNotesFileName:(id)a3
{
}

- (NSString)licenseAgreementFileName
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setLicenseAgreementFileName:(id)a3
{
}

- (NSString)preferencesIconFileName
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setPreferencesIconFileName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferencesIconFileName, 0);
  objc_storeStrong((id *)&self->_licenseAgreementFileName, 0);
  objc_storeStrong((id *)&self->_releaseNotesFileName, 0);
  objc_storeStrong((id *)&self->_releaseNotesSummaryFileName, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_serverAssetAlgorithm, 0);
  objc_storeStrong((id *)&self->_serverAssetMeasurement, 0);
  objc_storeStrong((id *)&self->_serverAssetURL, 0);
  objc_storeStrong((id *)&self->_localBundleURL, 0);
  objc_storeStrong((id *)&self->_slaVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_mandatoryUpdateBodyString, 0);
  objc_storeStrong((id *)&self->_recommendedUpdateAlertBodyString, 0);
  objc_storeStrong((id *)&self->_recommendedUpdateTitleString, 0);
  objc_storeStrong((id *)&self->_recommendedUpdateMaxOSVersion, 0);
  objc_storeStrong((id *)&self->_recommendedUpdateMinOSVersion, 0);
  objc_storeStrong((id *)&self->_recommendedUpdateNotificationFrequencyDays, 0);
  objc_storeStrong((id *)&self->_notificationBodyString, 0);
  objc_storeStrong((id *)&self->_notificationTitleString, 0);
  objc_storeStrong((id *)&self->_humanReadableMoreInfoLink, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateVersion, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateTitle, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateName, 0);
  objc_storeStrong((id *)&self->_licenseAgreement, 0);
  objc_storeStrong((id *)&self->_releaseNotes, 0);

  objc_storeStrong((id *)&self->_releaseNotesSummary, 0);
}

- (void)isRecommendedUpdateApplicable
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20C8EA000, v0, v1, "[DOCUMENTATION] recommendedUpdateEnabled=NO | isRecommendedUpdateApplicable=NO", v2, v3, v4, v5, v6);
}

- (void)softwareUpdateIconImagePath
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20C8EA000, v0, v1, "[DOCUMENTATION] Failed to determine icon path due to no preferences icon file name", v2, v3, v4, v5, v6);
}

- (void)softwareUpdateIconImage
{
  uint64_t v1 = [a1 preferencesIconFileName];
  OUTLINED_FUNCTION_0(&dword_20C8EA000, v2, v3, "[DOCUMENTATION] Failed to load update icon bundle with name: %{public}@", v4, v5, v6, v7, 2u);
}

@end