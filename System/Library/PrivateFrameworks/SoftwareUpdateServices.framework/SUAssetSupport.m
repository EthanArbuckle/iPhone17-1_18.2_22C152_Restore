@interface SUAssetSupport
+ (BOOL)updateIsPreCRelease:(id)a3;
+ (id)OSVersionComponent:(unint64_t)a3 osVersion:(id)a4;
+ (id)_gestaltValueForKey:(__CFString *)a3;
+ (id)assetDownloadOptionsForDocumentation;
+ (id)assetDownloadOptionsFromMetadata:(id)a3 descriptor:(id)a4 priority:(int)a5 forBrain:(BOOL)a6;
+ (id)copyInstalledAssets;
+ (id)copySUAssetForAssetID:(id)a3;
+ (id)copySuAssetInCatalogMatchingDescriptor:(id)a3;
+ (id)copySuAssetInCatalogMatchingDescriptor:(id)a3 exactAssetIdMatch:(BOOL)a4 installedOnly:(BOOL)a5;
+ (id)copySuAssetInstalledExactlyMatchingDescriptor:(id)a3;
+ (id)defaultAssetDownloadOptionsWithPriority:(int)a3;
+ (id)filterSuAssets:(id)a3 MatchingDescriptor:(id)a4;
+ (id)findAssetWithMatcher:(id)a3 localSearch:(BOOL)a4 error:(id *)a5;
+ (id)findAssetWithMatcher:(id)a3 localSearch:(BOOL)a4 releaseDate:(id *)a5 error:(id *)a6;
+ (id)findExactMatchInAssets:(id)a3 forAssetId:(id)a4;
+ (id)getInstalledDocumentationAssetFromSoftwareUpdateAssetIfExists:(id)a3;
+ (id)getLocalDefaultSoftwareUpdateAssetIfExists;
+ (id)getLocalDefaultSoftwareUpdateAssetIfExistsWithReleaseDate:(id *)a3;
+ (id)minorOSVersion:(id)a3;
+ (id)queryMetaDataOfType:(id)a3 WithFilter:(id)a4 installedOnly:(BOOL)a5 error:(id *)a6;
+ (id)tryCreateDescriptorFromSoftwareUpdateAsset:(id)a3 withReleaseDate:(id)a4;
+ (int64_t)requestCatalogDownload:(id)a3;
+ (void)_cleanupAllAssetsOfType:(id)a3;
+ (void)_queue_cleanupAllInstalledAssetsOfType:(id)a3;
+ (void)cleanupAllInstalledAssets:(id)a3;
+ (void)cleanupAllSoftwareUpdateAndRelatedAssets;
+ (void)cleanupAllSoftwareUpdateAssets;
+ (void)purgeMSUUpdate:(id)a3;
+ (void)setAssetQueryFilters:(id)a3;
+ (void)setSUFilters:(id)a3;
@end

@implementation SUAssetSupport

+ (id)tryCreateDescriptorFromSoftwareUpdateAsset:(id)a3 withReleaseDate:(id)a4
{
  if (!a3)
  {
    v64 = @"Unable to create descriptor from nil asset.";
    goto LABEL_82;
  }
  if (![a3 attributes] || !objc_msgSend((id)objc_msgSend(a3, "attributes"), "count"))
  {
    v64 = @"Unable to create descriptor from asset without attributes.";
LABEL_82:
    SULogDebug(v64, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, v104);
    return 0;
  }
  v10 = objc_alloc_init(SUDescriptor);
  v11 = (void *)[a3 attributes];
  uint64_t v105 = [a3 assetId];
  uint64_t v12 = [v11 objectForKey:@"OSVersion"];
  if (v12)
  {
    v13 = (void *)v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((unint64_t)[v13 length] >= 4
        && objc_msgSend(v13, "rangeOfString:options:range:", @"9.9.", 0, 0, 4) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", 0, 4, &stru_26CE93248);
        SULogInfo(@"9.9. replaced. New version string: %@", v14, v15, v16, v17, v18, v19, v20, (uint64_t)v13);
      }
      [(SUDescriptor *)v10 setProductVersion:v13];
    }
  }
  uint64_t v21 = [v11 objectForKey:@"Build"];
  if (v21)
  {
    uint64_t v22 = v21;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUDescriptor *)v10 setProductBuildVersion:v22];
    }
  }
  uint64_t v23 = [v11 objectForKey:@"SUProductSystemName"];
  if (v23)
  {
    uint64_t v24 = v23;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUDescriptor *)v10 setProductSystemName:v24];
    }
  }
  v25 = (void *)[v11 objectForKey:@"ReleaseType"];
  if (v25)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUDescriptor *)v10 setReleaseType:v25];
    }
  }
  uint64_t v26 = [v11 objectForKey:@"SUPublisher"];
  if (v26)
  {
    uint64_t v27 = v26;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUDescriptor *)v10 setPublisher:v27];
    }
  }
  uint64_t v28 = [v11 objectForKey:@"AllowableOTA"];
  if (v28)
  {
    v29 = (void *)v28;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUDescriptor setDownloadable:](v10, "setDownloadable:", [v29 BOOLValue]);
    }
  }
  uint64_t v30 = [v11 objectForKey:@"AutomaticDownloadOver3G"];
  if (v30)
  {
    v31 = (void *)v30;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUDescriptor setAutoDownloadAllowableForCellular:](v10, "setAutoDownloadAllowableForCellular:", [v31 BOOLValue]);
    }
  }
  uint64_t v32 = [v11 objectForKey:@"AllowableOverCellular"];
  if (v32)
  {
    v33 = (void *)v32;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUDescriptor setDownloadableOverCellular:](v10, "setDownloadableOverCellular:", [v33 BOOLValue]);
    }
  }
  uint64_t v34 = [v11 objectForKey:*MEMORY[0x263F55888]];
  if (v34)
  {
    v35 = (void *)v34;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUDescriptor setDownloadSize:](v10, "setDownloadSize:", [v35 unsignedLongLongValue]);
    }
  }
  uint64_t v36 = [v11 objectForKey:*MEMORY[0x263F558A0]];
  if (v36)
  {
    v37 = (void *)v36;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUDescriptor _setUnarchiveSize:](v10, "_setUnarchiveSize:", [v37 unsignedLongLongValue]);
    }
  }
  uint64_t v38 = [v11 objectForKey:@"ActualMinimumSystemPartition"];
  if (v38)
  {
    v39 = (void *)v38;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUDescriptor setMinimumSystemPartitionSize:](v10, "setMinimumSystemPartitionSize:", [v39 unsignedLongLongValue] << 20);
    }
  }
  uint64_t v40 = [v11 objectForKey:*MEMORY[0x263F55890]];
  if (v40)
  {
    v41 = (void *)v40;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUDescriptor _setStreamingZipCapable:](v10, "_setStreamingZipCapable:", [v41 BOOLValue]);
    }
  }
  uint64_t v42 = [v11 objectForKey:@"SUDisableSiriVoiceDeletion"];
  if (v42)
  {
    v43 = (void *)v42;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUDescriptor _setDisableSiriVoiceDeletion:](v10, "_setDisableSiriVoiceDeletion:", [v43 BOOLValue]);
    }
  }
  uint64_t v44 = [v11 objectForKey:@"SUDisableCDLevel4"];
  if (v44)
  {
    v45 = (void *)v44;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUDescriptor _setDisableCDLevel4:](v10, "_setDisableCDLevel4:", [v45 BOOLValue]);
    }
  }
  uint64_t v46 = [v11 objectForKey:@"SUDisableAppDemotion"];
  if (v46)
  {
    v47 = (void *)v46;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUDescriptor _setDisableAppDemotion:](v10, "_setDisableAppDemotion:", [v47 BOOLValue]);
    }
  }
  uint64_t v48 = [v11 objectForKey:@"SUInstallTonightEnabled"];
  if (v48)
  {
    v49 = (void *)v48;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v49 BOOLValue] & 1) == 0) {
      [(SUDescriptor *)v10 _setDisableInstallTonight:1];
    }
  }
  uint64_t v50 = [v11 objectForKey:@"Ramp"];
  if (v50)
  {
    v51 = (void *)v50;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v51 BOOLValue]) {
        [(SUDescriptor *)v10 setRampEnabled:1];
      }
    }
  }
  uint64_t v52 = [v11 objectForKey:@"GranularlyRamped"];
  if (v52)
  {
    v53 = (void *)v52;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v53 BOOLValue]) {
        [(SUDescriptor *)v10 setGranularlyRamped:1];
      }
    }
  }
  uint64_t v54 = [v11 objectForKey:@"AutoUpdate"];
  if (v54)
  {
    v55 = (void *)v54;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v55 BOOLValue]) {
        [(SUDescriptor *)v10 setAutoUpdateEnabled:1];
      }
    }
  }
  uint64_t v56 = [v11 objectForKey:@"SystemPartitionPadding"];
  if (v56)
  {
    uint64_t v57 = v56;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUDescriptor *)v10 setSystemPartitionPadding:v57];
    }
  }
  uint64_t v58 = [v11 objectForKey:@"SEPDigest"];
  if (v58)
  {
    uint64_t v59 = v58;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUDescriptor *)v10 setSEPDigest:v59];
    }
  }
  uint64_t v60 = [v11 objectForKey:@"RSEPDigest"];
  if (v60)
  {
    uint64_t v61 = v60;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUDescriptor *)v10 setRSEPDigest:v61];
    }
  }
  uint64_t v62 = [v11 objectForKey:@"SEPTBMDigests"];
  if (v62)
  {
    uint64_t v63 = v62;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(SUDescriptor *)v10 setSEPTBMDigest:v63];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v65 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v63 options:1];
        if (v65)
        {
          v66 = (void *)v65;
          [(SUDescriptor *)v10 setSEPTBMDigest:v65];
        }
      }
    }
  }
  uint64_t v67 = [v11 objectForKey:@"RSEPTBMDigests"];
  if (v67)
  {
    uint64_t v68 = v67;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(SUDescriptor *)v10 setRSEPTBMDigest:v68];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v69 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v68 options:1];
        if (v69)
        {
          v70 = (void *)v69;
          [(SUDescriptor *)v10 setRSEPTBMDigest:v69];
        }
      }
    }
  }
  if (a4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(SUDescriptor *)v10 setReleaseDate:a4];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v71 = objc_alloc_init(MEMORY[0x263F08790]);
        [v71 setDateFormat:@"yyyy-MM-dd"];
        v72 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
        [v71 setLocale:v72];
        uint64_t v73 = [v71 dateFromString:a4];

        if (v73)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(SUDescriptor *)v10 setReleaseDate:v73];
          }
        }
      }
    }
  }
  uint64_t v74 = [v11 objectForKey:@"MDMDelayInterval"];
  if (v74)
  {
    v75 = (void *)v74;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUDescriptor setMdmDelayInterval:](v10, "setMdmDelayInterval:", [v75 unsignedLongLongValue]);
    }
  }
  uint64_t v76 = [v11 objectForKey:@"SetupCritical"];
  if (v76)
  {
    uint64_t v77 = v76;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUDescriptor *)v10 setSetupCritical:v77];
    }
  }
  uint64_t v78 = [v11 objectForKey:@"SetupCriticalCellularOverride"];
  if (v78)
  {
    v79 = (void *)v78;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v79 BOOLValue]) {
        v80 = @"WifiAndCellular";
      }
      else {
        v80 = @"WifiOnly";
      }
      [(SUDescriptor *)v10 setCriticalDownloadPolicy:v80];
    }
  }
  uint64_t v81 = [v11 objectForKey:@"SetupCriticalUpdateOutOfBoxOnly"];
  if (v81)
  {
    v82 = (void *)v81;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUDescriptor setCriticalOutOfBoxOnly:](v10, "setCriticalOutOfBoxOnly:", [v82 BOOLValue]);
    }
  }
  uint64_t v83 = [v11 objectForKey:@"PrerequisiteBuild"];
  if (v83)
  {
    uint64_t v84 = v83;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUDescriptor *)v10 setPrerequisiteBuild:v84];
    }
  }
  uint64_t v85 = [v11 objectForKey:@"PrerequisiteOSVersion"];
  if (v85)
  {
    uint64_t v86 = v85;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUDescriptor *)v10 setPrerequisiteOS:v86];
    }
  }
  uint64_t v87 = [v11 objectForKey:@"__HideInstallAlert"];
  if (v87 && (v88 = (void *)v87, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v89 = [v88 BOOLValue];
  }
  else
  {
    if ([v25 isEqualToString:@"Beta"]) {
      goto LABEL_127;
    }
    uint64_t v89 = +[SUAssetSupport updateIsPreCRelease:[(SUDescriptor *)v10 productVersion]];
  }
  [(SUDescriptor *)v10 setHideInstallAlert:v89];
LABEL_127:
  uint64_t v90 = [v11 objectForKey:@"ForcePasscodeRequired"];
  if (v90)
  {
    v91 = (void *)v90;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUDescriptor setForcePasscodeRequired:](v10, "setForcePasscodeRequired:", [v91 BOOLValue]);
    }
  }
  if (v105) {
    -[SUDescriptor setAssetID:](v10, "setAssetID:");
  }
  uint64_t v92 = [v11 objectForKey:@"MacBuddyEligibleUpdate"];
  if (v92)
  {
    v93 = (void *)v92;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(SUDescriptor *)v10 setMandatoryUpdateEligible:1];
      uint64_t v94 = [v93 objectForKey:@"VersionMin"];
      if (v94)
      {
        uint64_t v95 = v94;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(SUDescriptor *)v10 setMandatoryUpdateVersionMin:v95];
        }
      }
      uint64_t v96 = [v93 objectForKey:@"VersionMax"];
      if (v96)
      {
        uint64_t v97 = v96;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(SUDescriptor *)v10 setMandatoryUpdateVersionMin:v97];
        }
      }
      uint64_t v98 = [v93 objectForKey:@"Optional"];
      if (v98)
      {
        v99 = (void *)v98;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          -[SUDescriptor setMandatoryUpdateOptional:](v10, "setMandatoryUpdateOptional:", [v99 BOOLValue]);
        }
      }
      uint64_t v100 = [v93 objectForKey:@"RestrictedToOutOfTheBox"];
      if (v100)
      {
        v101 = (void *)v100;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          -[SUDescriptor setMandatoryUpdateRestrictedToOutOfTheBox:](v10, "setMandatoryUpdateRestrictedToOutOfTheBox:", [v101 BOOLValue]);
        }
      }
    }
  }
  MSUAssetCalculateApplySize();
  MSUAssetCalculatePrepareSize();
  [(SUDescriptor *)v10 _setMsuPrepareSize:0];
  [(SUDescriptor *)v10 setInstallationSize:0];
  if ([a3 isEmergencyUpdate])
  {
    uint64_t v102 = 3;
  }
  else
  {
    uint64_t v102 = 1;
    if (![v11 objectForKey:@"PrerequisiteBuild"])
    {
      if ([v11 objectForKey:@"PrerequisiteOSVersion"]) {
        uint64_t v102 = 1;
      }
      else {
        uint64_t v102 = 2;
      }
    }
  }
  [(SUDescriptor *)v10 setUpdateType:v102];
  return v10;
}

+ (void)_queue_cleanupAllInstalledAssetsOfType:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:a3];
  [v3 returnTypes:1];
  [v3 setDoNotBlockBeforeFirstUnlock:1];
  uint64_t v4 = [v3 queryMetaDataSync];
  if (v4)
  {
    SULogInfo(@"queryMetaDataSync failed in _queue_cleanupAllInstalledAssetsOfType: %ld", v5, v6, v7, v8, v9, v10, v11, v4);
  }
  else
  {
    uint64_t v12 = (void *)[v3 results];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ([v17 purgeSync]) {
            SULogInfo(@"purgeSync for asset:%@ failed in _queue_cleanupAllInstalledAssetsOfType: %ld", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v17);
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v14);
    }
  }
}

+ (void)cleanupAllInstalledAssets:(id)a3
{
  uint64_t v4 = +[SUUtility taskQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SUAssetSupport_cleanupAllInstalledAssets___block_invoke;
  block[3] = &unk_26447CC88;
  block[4] = a3;
  dispatch_async(v4, block);
}

uint64_t __44__SUAssetSupport_cleanupAllInstalledAssets___block_invoke(uint64_t a1)
{
  +[SUAssetSupport _queue_cleanupAllInstalledAssetsOfType:@"com.apple.MobileAsset.SoftwareUpdate"];
  +[SUAssetSupport _queue_cleanupAllInstalledAssetsOfType:@"com.apple.MobileAsset.SoftwareUpdateDocumentation"];
  +[SUAssetSupport _queue_cleanupAllInstalledAssetsOfType:*MEMORY[0x263F77CA8]];
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

+ (void)_cleanupAllAssetsOfType:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:a3];
  [v5 returnTypes:1];
  if (([a3 isEqualToString:@"com.apple.MobileAsset.SoftwareUpdate"] & 1) != 0
    || [a3 isEqualToString:*MEMORY[0x263F77CA8]])
  {
    [a1 setSUFilters:v5];
  }
  uint64_t v6 = [v5 queryMetaDataSync];
  if (v6)
  {
    SULogInfo(@"queryMetaDataSync failed in _cleanupAllAssetsOfType: %d", v7, v8, v9, v10, v11, v12, v13, v6);
  }
  else
  {
    uint64_t v14 = (void *)[v5 results];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * v18++) cleanupAsset];
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }
  }
}

+ (void)cleanupAllSoftwareUpdateAssets
{
  v2 = +[SUUtility taskQueue];
  dispatch_async(v2, &__block_literal_global_1);
}

uint64_t __48__SUAssetSupport_cleanupAllSoftwareUpdateAssets__block_invoke()
{
  +[SUAssetSupport _cleanupAllAssetsOfType:@"com.apple.MobileAsset.SoftwareUpdate"];
  uint64_t v0 = *MEMORY[0x263F77CA8];
  return +[SUAssetSupport _cleanupAllAssetsOfType:v0];
}

+ (void)cleanupAllSoftwareUpdateAndRelatedAssets
{
  v3 = +[SUUtility taskQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__SUAssetSupport_cleanupAllSoftwareUpdateAndRelatedAssets__block_invoke;
  block[3] = &unk_26447CCB0;
  block[4] = a1;
  dispatch_async(v3, block);
}

uint64_t __58__SUAssetSupport_cleanupAllSoftwareUpdateAndRelatedAssets__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) getLocalDefaultSoftwareUpdateAssetIfExists];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v11 = 0;
    if ((objc_msgSend((id)objc_msgSend(objc_alloc(MEMORY[0x263F55A88]), "initWithUpdateAsset:", v1), "cancel:", &v11) & 1) == 0)SULogInfo(@"Unable to cleanup brain for default asset: %@", v3, v4, v5, v6, v7, v8, v9, v2); {
  }
    }
  +[SUAssetSupport _cleanupAllAssetsOfType:@"com.apple.MobileAsset.SoftwareUpdate"];
  +[SUAssetSupport _cleanupAllAssetsOfType:@"com.apple.MobileAsset.SoftwareUpdateDocumentation"];
  +[SUAssetSupport _cleanupAllAssetsOfType:*MEMORY[0x263F77CA8]];
  return +[SUUtility purgeV1SUAssets];
}

+ (int64_t)requestCatalogDownload:(id)a3
{
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 3;
  uint64_t v4 = dispatch_semaphore_create(0);
  uint64_t v5 = objc_opt_new();
  [a3 modifyMADownloadOptions:v5];
  uint64_t v6 = [a3 assetType];
  SULogInfo(@"requesting %@ catalog download", v7, v8, v9, v10, v11, v12, v13, v6);
  uint64_t v14 = (void *)MEMORY[0x263F55938];
  uint64_t v15 = [a3 assetType];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __41__SUAssetSupport_requestCatalogDownload___block_invoke;
  v19[3] = &unk_26447CCD8;
  v19[5] = v4;
  v19[6] = &v20;
  v19[4] = a3;
  [v14 startCatalogDownload:v15 options:v5 then:v19];
  dispatch_time_t v16 = dispatch_time(0, 90000000000);
  dispatch_semaphore_wait(v4, v16);
  dispatch_release(v4);

  int64_t v17 = v21[3];
  _Block_object_dispose(&v20, 8);
  return v17;
}

intptr_t __41__SUAssetSupport_requestCatalogDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  switch(v3)
  {
    case 0:
      goto LABEL_4;
    case 18:
      uint64_t v28 = [*(id *)(a1 + 32) assetType];
      SULogInfo(@"Pallas found no matching asset for %@", v11, v12, v13, v14, v15, v16, v17, v28);
      break;
    case 10:
LABEL_4:
      uint64_t v27 = [*(id *)(a1 + 32) assetType];
      SULogInfo(@"Successfully downloaded %@ catalog", v4, v5, v6, v7, v8, v9, v10, v27);
      break;
    default:
      uint64_t v29 = [*(id *)(a1 + 32) assetType];
      SULogInfo(@"failed to download %@ catalog: %d", v18, v19, v20, v21, v22, v23, v24, v29);
      break;
  }
  long long v25 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v25);
}

+ (id)_gestaltValueForKey:(__CFString *)a3
{
  uint64_t v3 = (void *)MGCopyAnswer();
  return v3;
}

+ (id)findAssetWithMatcher:(id)a3 localSearch:(BOOL)a4 error:(id *)a5
{
  return (id)[a1 findAssetWithMatcher:a3 localSearch:a4 releaseDate:0 error:a5];
}

+ (void)setAssetQueryFilters:(id)a3
{
  v36[5] = *MEMORY[0x263EF8340];
  if ((__CFString *)[a3 assetType] == @"com.apple.MobileAsset.SoftwareUpdate")
  {
    uint64_t v5 = [a1 _gestaltValueForKey:@"ProductType"];
    uint64_t v6 = [a1 _gestaltValueForKey:@"ReleaseType"];
    uint64_t v7 = [a1 _gestaltValueForKey:@"BuildVersion"];
    uint64_t v8 = [a1 _gestaltValueForKey:@"ProductVersion"];
    uint64_t v9 = [a1 _gestaltValueForKey:@"HWModelStr"];
    uint64_t v10 = [MEMORY[0x263EFF9D0] null];
    uint64_t v11 = v10;
    if (!v6) {
      uint64_t v6 = v10;
    }
    if ([+[SUPreferences sharedInstance] forceFullReplacement])
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v11, 0);
      uint64_t v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v11, 0, v29);
    }
    else
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v7, v11, 0);
      uint64_t v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v8, v11, 0);
    }
    uint64_t v14 = v13;
    v35[0] = @"SupportedDevices";
    v36[0] = [MEMORY[0x263EFF980] arrayWithObject:v5];
    v35[1] = @"SupportedDeviceModels";
    v36[1] = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v11, v9, 0);
    v35[2] = @"ReleaseType";
    v36[2] = [MEMORY[0x263EFF980] arrayWithObject:v6];
    v36[3] = v12;
    v35[3] = @"PrerequisiteBuild";
    v35[4] = @"PrerequisiteOSVersion";
    v36[4] = v14;
    uint64_t v15 = (void *)[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:5];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v16 = (void *)[v15 allKeys];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          if (objc_msgSend(a3, "addKeyValueArray:with:", v21, objc_msgSend(v15, "objectForKey:", v21))) {
            SULogInfo(@"error setting filter for: %@", v22, v23, v24, v25, v26, v27, v28, v21);
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v18);
    }
  }
}

+ (void)setSUFilters:(id)a3
{
  v28[2] = *MEMORY[0x263EF8340];
  if ((__CFString *)[a3 assetType] == @"com.apple.MobileAsset.SoftwareUpdate")
  {
    uint64_t v5 = [a1 _gestaltValueForKey:@"ProductType"];
    uint64_t v6 = [a1 _gestaltValueForKey:@"HWModelStr"];
    uint64_t v7 = [MEMORY[0x263EFF9D0] null];
    v27[0] = @"SupportedDevices";
    v27[1] = @"SupportedDeviceModels";
    v28[0] = [MEMORY[0x263EFF980] arrayWithObject:v5];
    v28[1] = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v7, v6, 0);
    uint64_t v8 = (void *)[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v9 = (void *)[v8 allKeys];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          if (objc_msgSend(a3, "addKeyValueArray:with:", v14, objc_msgSend(v8, "objectForKey:", v14))) {
            SULogInfo(@"error setting filter for: %@", v15, v16, v17, v18, v19, v20, v21, v14);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }
  }
}

+ (id)copySUAssetForAssetID:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:@"com.apple.MobileAsset.SoftwareUpdate"];
  [v4 returnTypes:2];
  +[SUAssetSupport setSUFilters:v4];
  if ([v4 queryMetaDataSync])
  {
    SULogInfo(@"Failed to query matching assetID: %@ QueryResult: %d", v5, v6, v7, v8, v9, v10, v11, (uint64_t)a3);
LABEL_3:
    uint64_t v19 = 0;
    uint64_t v20 = @"Failed to find asset matching assetID: %@";
    goto LABEL_4;
  }
  long long v22 = (void *)[v4 results];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v23) {
    goto LABEL_3;
  }
  uint64_t v24 = v23;
  uint64_t v25 = *(void *)v30;
LABEL_7:
  uint64_t v26 = 0;
  while (1)
  {
    if (*(void *)v30 != v25) {
      objc_enumerationMutation(v22);
    }
    uint64_t v27 = *(void **)(*((void *)&v29 + 1) + 8 * v26);
    if (objc_msgSend((id)objc_msgSend(v27, "assetId"), "isEqualToString:", a3)) {
      break;
    }
    if (v24 == ++v26)
    {
      uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v24) {
        goto LABEL_7;
      }
      goto LABEL_3;
    }
  }
  id v28 = v27;
  if (!v28) {
    goto LABEL_3;
  }
  uint64_t v19 = v28;
  uint64_t v20 = @"Found SU asset matching assetID: %@";
LABEL_4:
  SULogInfo(v20, v12, v13, v14, v15, v16, v17, v18, (uint64_t)a3);

  return v19;
}

+ (id)copyInstalledAssets
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:@"com.apple.MobileAsset.SoftwareUpdate"];
  [v2 returnTypes:1];
  [v2 setDoNotBlockBeforeFirstUnlock:1];
  uint64_t v3 = [v2 queryInstalledAssetIds];
  if (v3)
  {
    SULogInfo(@"Failed to query for installed builds: %d", v4, v5, v6, v7, v8, v9, v10, v3);
    id v11 = 0;
  }
  else
  {
    id v11 = (id)[v2 assetIds];
    uint64_t v12 = [v11 count];
    [v11 count];
    SULogInfo(@"MobileAsset found %d installed build%s: assetIDs: %@", v13, v14, v15, v16, v17, v18, v19, v12);
  }

  return v11;
}

+ (id)findAssetWithMatcher:(id)a3 localSearch:(BOOL)a4 releaseDate:(id *)a5 error:(id *)a6
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SUAssetSupport.m", 681, @"Matcher must be non-nil for a query.");
  }
  id v67 = 0;
  if (a4
    || ((int64_t v11 = +[SUAssetSupport requestCatalogDownload:a3]) != 0
      ? (BOOL v12 = v11 == 10)
      : (BOOL v12 = 1),
        v12))
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263F55950]), "initWithType:", objc_msgSend(a3, "assetType"));
    [v13 augmentResultsWithState:1];
    [a1 setAssetQueryFilters:v13];
    uint64_t v14 = [v13 queryMetaDataSync];
    if (v14)
    {
      SULogInfo(@"asset query failed: %d", v15, v16, v17, v18, v19, v20, v21, v14);
      id v67 = +[SUUtility errorWithCode:58];
      if (v67)
      {
        long long v22 = 0;
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v24 = (void *)[v13 results];
      uint64_t v25 = [v24 count];
      SULogInfo(@"MobileAsset returned %d matching assets", v26, v27, v28, v29, v30, v31, v32, v25);
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      uint64_t v33 = [v24 countByEnumeratingWithState:&v63 objects:v68 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v64;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v64 != v35) {
              objc_enumerationMutation(v24);
            }
            uint64_t v37 = [*(id *)(*((void *)&v63 + 1) + 8 * i) attributes];
            SULogInfo(@"Asset info: %@", v38, v39, v40, v41, v42, v43, v44, v37);
          }
          uint64_t v34 = [v24 countByEnumeratingWithState:&v63 objects:v68 count:16];
        }
        while (v34);
      }
      if (v24)
      {
        long long v22 = (void *)[a3 findMatchFromCandidates:v24 error:&v67];
        if (v22)
        {
          if ([v13 postedDate])
          {
            uint64_t v52 = [v13 postedDate];
          }
          else
          {
            SULogInfo(@"Asset query did not return posting date. Setting posting date to now", v45, v46, v47, v48, v49, v50, v51, v62);
            uint64_t v52 = [MEMORY[0x263EFF910] date];
          }
          uint64_t v61 = (void *)v52;
          if (a5)
          {
            SULogInfo(@"release date of update is %@", v53, v54, v55, v56, v57, v58, v59, v52);
            *a5 = v61;
          }
        }
LABEL_12:
        id v23 = v67;
        if (!v67)
        {
LABEL_14:

          return v22;
        }
LABEL_13:
        +[SUUtility assignError:a6 withError:v23 translate:0];
        goto LABEL_14;
      }
    }
    id v23 = +[SUUtility errorWithCode:-1];
    long long v22 = 0;
    id v67 = v23;
    if (!v23) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v11 != 18) {
    +[SUUtility assignError:withError:translate:](SUUtility, "assignError:withError:translate:", a6, +[SUUtility errorWithCode:57], 0);
  }
  return 0;
}

+ (id)findExactMatchInAssets:(id)a3 forAssetId:(id)a4
{
  id v4 = 0;
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a3 && a4)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(a3);
          }
          int64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (objc_msgSend(a4, "isEqualToString:", objc_msgSend(v11, "assetId")))
          {
            id v4 = v11;
            uint64_t v12 = [v11 assetId];
            SULogInfo(@"Found asset matching assetId:%@", v13, v14, v15, v16, v17, v18, v19, v12);
            return v4;
          }
        }
        uint64_t v8 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
        id v4 = 0;
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

+ (id)filterSuAssets:(id)a3 MatchingDescriptor:(id)a4
{
  id v5 = a3;
  uint64_t v88 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a3 count];
  [v5 count];
  SULogInfo(@"Found %lu asset%s matching descriptor", v7, v8, v9, v10, v11, v12, v13, v6);
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  uint64_t v15 = [v5 countByEnumeratingWithState:&v82 objects:v87 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v77 = *(void *)v83;
    id v74 = v5;
    v75 = v14;
    do
    {
      uint64_t v17 = 0;
      uint64_t v76 = v16;
      do
      {
        if (*(void *)v83 != v77) {
          objc_enumerationMutation(v5);
        }
        uint64_t v18 = *(void **)(*((void *)&v82 + 1) + 8 * v17);
        uint64_t v19 = [v18 assetProperty:@"PrerequisiteBuild"];
        uint64_t v20 = [v18 assetProperty:@"PrerequisiteOSVersion"];
        if (![a4 prerequisiteBuild] || !objc_msgSend(a4, "prerequisiteOS"))
        {
          if (v19 | v20) {
            goto LABEL_27;
          }
LABEL_26:
          [v14 addObject:v18];
          goto LABEL_27;
        }
        if (objc_msgSend((id)v19, "isEqual:", objc_msgSend(a4, "prerequisiteBuild"))
          && objc_msgSend((id)v20, "isEqual:", objc_msgSend(a4, "prerequisiteOS")))
        {
          goto LABEL_26;
        }
        uint64_t v21 = [v18 assetProperty:@"ComboAsset"];
        if (v21)
        {
          long long v22 = (void *)v21;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            uint64_t v30 = [v22 countByEnumeratingWithState:&v78 objects:v86 count:16];
            if (v30)
            {
              uint64_t v31 = v30;
              uint64_t v32 = *(void *)v79;
              do
              {
                for (uint64_t i = 0; i != v31; ++i)
                {
                  if (*(void *)v79 != v32) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v34 = *(void **)(*((void *)&v78 + 1) + 8 * i);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v42 = (void *)[v34 valueForKey:@"PrerequisiteBuild"];
                    uint64_t v43 = (void *)[v34 valueForKey:@"PrerequisiteOSVersion"];
                    if (objc_msgSend(v42, "isEqual:", objc_msgSend(a4, "prerequisiteBuild"))
                      && objc_msgSend(v43, "isEqual:", objc_msgSend(a4, "prerequisiteOS")))
                    {
                      id v14 = v75;
                      [v75 addObject:v18];
                      id v5 = v74;
                      uint64_t v16 = v76;
                      goto LABEL_27;
                    }
                  }
                  else
                  {
                    SULogInfo(@"ComboAsset array item is not a dictionary, skipping", v35, v36, v37, v38, v39, v40, v41, v70);
                  }
                }
                uint64_t v31 = [v22 countByEnumeratingWithState:&v78 objects:v86 count:16];
                id v5 = v74;
                id v14 = v75;
                uint64_t v16 = v76;
              }
              while (v31);
            }
          }
          else
          {
            SULogInfo(@"ComboAsset value is not an array, skipping", v23, v24, v25, v26, v27, v28, v29, v70);
          }
        }
LABEL_27:
        ++v17;
      }
      while (v17 != v16);
      uint64_t v44 = [v5 countByEnumeratingWithState:&v82 objects:v87 count:16];
      uint64_t v16 = v44;
    }
    while (v44);
  }
  uint64_t v45 = [v14 count];
  [v14 count];
  SULogInfo(@"Found %lu asset%s matching descriptor prerequisite build & version", v46, v47, v48, v49, v50, v51, v52, v45);
  uint64_t v53 = objc_msgSend(a1, "findExactMatchInAssets:forAssetId:", v14, objc_msgSend(a4, "assetID"));
  if (!v53)
  {
    id v54 = (id)[v14 firstObject];
    uint64_t v53 = v54;
    if (v54)
    {
      uint64_t v72 = [v54 assetId];
      SULogInfo(@"Taking the first asset, assetId:%@", v62, v63, v64, v65, v66, v67, v68, v72);
    }
    else
    {
      SULogInfo(@"Could not find matching asset", v55, v56, v57, v58, v59, v60, v61, v71);
    }
  }

  return v53;
}

+ (id)copySuAssetInCatalogMatchingDescriptor:(id)a3 exactAssetIdMatch:(BOOL)a4 installedOnly:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v21[4] = *MEMORY[0x263EF8340];
  uint64_t v19 = 0;
  uint64_t v9 = [a1 _gestaltValueForKey:@"ProductType"];
  uint64_t v10 = [a1 _gestaltValueForKey:@"HWModelStr"];
  uint64_t v11 = [MEMORY[0x263EFF9D0] null];
  uint64_t v12 = [a3 releaseType];
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = v11;
  }
  v20[0] = @"SupportedDevices";
  v21[0] = [MEMORY[0x263EFF980] arrayWithObject:v9];
  v20[1] = @"SupportedDeviceModels";
  v21[1] = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v11, v10, 0);
  v20[2] = @"ReleaseType";
  v21[2] = [MEMORY[0x263EFF980] arrayWithObject:v13];
  v20[3] = @"Build";
  v21[3] = [a3 productBuildVersion];
  uint64_t v14 = objc_msgSend(a1, "queryMetaDataOfType:WithFilter:installedOnly:error:", @"com.apple.MobileAsset.SoftwareUpdate", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 4), v5, &v19);
  if (!v14) {
    return 0;
  }
  uint64_t v15 = (void *)v14;
  if (v6) {
    uint64_t v16 = objc_msgSend(a1, "findExactMatchInAssets:forAssetId:", v14, objc_msgSend(a3, "assetID"));
  }
  else {
    uint64_t v16 = [a1 filterSuAssets:v14 MatchingDescriptor:a3];
  }
  uint64_t v17 = (void *)v16;

  return v17;
}

+ (id)copySuAssetInCatalogMatchingDescriptor:(id)a3
{
  return (id)[a1 copySuAssetInCatalogMatchingDescriptor:a3 exactAssetIdMatch:0 installedOnly:0];
}

+ (id)copySuAssetInstalledExactlyMatchingDescriptor:(id)a3
{
  return (id)[a1 copySuAssetInCatalogMatchingDescriptor:a3 exactAssetIdMatch:1 installedOnly:1];
}

+ (id)queryMetaDataOfType:(id)a3 WithFilter:(id)a4 installedOnly:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:a3];
  [v8 setDoNotBlockBeforeFirstUnlock:1];
  if (v6) {
    [v8 returnTypes:1];
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v9 = (void *)[a4 allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v45;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v44 + 1) + 8 * v13);
        uint64_t v15 = [a4 objectForKey:v14];
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          if (![v8 addKeyValueArray:v14 with:v15]) {
            goto LABEL_12;
          }
LABEL_11:
          SULogInfo(@"error setting filter for: %@", v16, v17, v18, v19, v20, v21, v22, v14);
          goto LABEL_12;
        }
        if ([v8 addKeyValuePair:v14 with:v15]) {
          goto LABEL_11;
        }
LABEL_12:
        ++v13;
      }
      while (v11 != v13);
      uint64_t v23 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
      uint64_t v11 = v23;
    }
    while (v23);
  }
  uint64_t v24 = [v8 queryMetaDataSync];
  if (v24 && (v24 == 9 ? (BOOL v32 = !v6) : (BOOL v32 = 1), v32))
  {
    if (a6)
    {
      SULogInfo(@"asset query failed: %d", v25, v26, v27, v28, v29, v30, v31, v24);
      id v33 = 0;
      *a6 = +[SUUtility errorWithCode:58];
    }
    else
    {
      id v33 = 0;
    }
  }
  else
  {
    id v33 = (id)[v8 results];
    uint64_t v34 = [v33 count];
    SULogInfo(@"MobileAsset returned %d matching assets", v35, v36, v37, v38, v39, v40, v41, v34);
  }

  return v33;
}

+ (void)purgeMSUUpdate:(id)a3
{
  id v4 = +[SUUtility taskQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SUAssetSupport_purgeMSUUpdate___block_invoke;
  block[3] = &unk_26447CC88;
  block[4] = a3;
  dispatch_async(v4, block);
}

void __33__SUAssetSupport_purgeMSUUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x223C18220]();
  SULogInfo(@"Attempting to purge prepared and suspended update from disk.", v3, v4, v5, v6, v7, v8, v9, v11);
  MSUPurgeSuspendedUpdate();
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, 0);
  }
}

+ (id)getLocalDefaultSoftwareUpdateAssetIfExists
{
  return (id)[a1 getLocalDefaultSoftwareUpdateAssetIfExistsWithReleaseDate:0];
}

+ (id)getLocalDefaultSoftwareUpdateAssetIfExistsWithReleaseDate:(id *)a3
{
  id v4 = +[SUSoftwareUpdateAssetMatcher matcherForCurrentDeviceWithInterestedStates:0];
  [v4 setCompareWithTatsuForEligibility:0];
  return +[SUAssetSupport findAssetWithMatcher:v4 localSearch:1 releaseDate:a3 error:0];
}

+ (id)getInstalledDocumentationAssetFromSoftwareUpdateAssetIfExists:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SUAssetSupport.m", 944, @"SoftwareUpdateAsset must be non-nil to fetch documentation from.");
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "assetType"), "isEqualToString:", @"com.apple.MobileAsset.SoftwareUpdate") & 1) == 0)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SUAssetSupport.m", 945, @"Asset passed in must be a software update asset"); {
  id v6 = +[SUDocumentationAssetMatcher matcherForInstalledDocumentationFromAsset:a3];
  }
  return +[SUAssetSupport findAssetWithMatcher:v6 localSearch:1 error:0];
}

+ (id)defaultAssetDownloadOptionsWithPriority:(int)a3
{
  id v4 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = v4;
  if (a3 == 1)
  {
    id v6 = (void *)MEMORY[0x263F558F8];
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    id v6 = (void *)MEMORY[0x263F558F0];
LABEL_5:
    [v4 setSafeObject:*v6 forKey:*MEMORY[0x263F558E0]];
  }
  return v5;
}

+ (id)assetDownloadOptionsForDocumentation
{
  uint64_t v2 = (void *)[a1 defaultAssetDownloadOptionsWithPriority:2];
  uint64_t v3 = [NSNumber numberWithBool:1];
  [v2 setSafeObject:v3 forKey:*MEMORY[0x263F558D0]];
  uint64_t v4 = [NSNumber numberWithBool:1];
  [v2 setSafeObject:v4 forKey:*MEMORY[0x263F558A8]];
  uint64_t v5 = [NSNumber numberWithBool:1];
  [v2 setSafeObject:v5 forKey:*MEMORY[0x263F558B0]];
  uint64_t v6 = [NSNumber numberWithBool:1];
  [v2 setSafeObject:v6 forKey:*MEMORY[0x263F558B8]];
  uint64_t v7 = [NSNumber numberWithBool:1];
  [v2 setSafeObject:v7 forKey:*MEMORY[0x263F558C0]];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[SUNetworkMonitor isCellularDataRoamingEnabled](+[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance"), "isCellularDataRoamingEnabled"));
  [v2 setSafeObject:v8 forKey:*MEMORY[0x263F558C8]];
  return v2;
}

+ (id)assetDownloadOptionsFromMetadata:(id)a3 descriptor:(id)a4 priority:(int)a5 forBrain:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v9 = (void *)[a1 defaultAssetDownloadOptionsWithPriority:*(void *)&a5];
  uint64_t v10 = v9;
  if (v6) {
    [v9 setSafeObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F558E8]];
  }
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "isEnabledForWifi"));
  [v10 setSafeObject:v11 forKey:*MEMORY[0x263F558D0]];
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "isEnabledFor2G"));
  [v10 setSafeObject:v12 forKey:*MEMORY[0x263F558A8]];
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "isEnabledFor3G"));
  [v10 setSafeObject:v13 forKey:*MEMORY[0x263F558B0]];
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "isEnabledFor4G"));
  [v10 setSafeObject:v14 forKey:*MEMORY[0x263F558B8]];
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "isEnabledOnBatteryPower"));
  [v10 setSafeObject:v15 forKey:*MEMORY[0x263F558C0]];
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "isEnabledForCellularRoaming"));
  [v10 setSafeObject:v16 forKey:*MEMORY[0x263F558C8]];
  uint64_t v17 = [NSString stringWithFormat:@"%@:%@", objc_msgSend(a4, "productVersion"), objc_msgSend(a4, "productBuildVersion")];
  [v10 setSafeObject:v17 forKey:*MEMORY[0x263F558D8]];
  return v10;
}

+ (BOOL)updateIsPreCRelease:(id)a3
{
  id v3 = +[SUAssetSupport minorOSVersion:a3];
  if (v3) {
    LOBYTE(v3) = [v3 compare:&unk_26CEBCFA0] == -1;
  }
  return (char)v3;
}

+ (id)minorOSVersion:(id)a3
{
  return +[SUAssetSupport OSVersionComponent:1 osVersion:a3];
}

+ (id)OSVersionComponent:(unint64_t)a3 osVersion:(id)a4
{
  uint64_t v5 = (void *)[a4 componentsSeparatedByString:@"."];
  if (!v5) {
    return 0;
  }
  BOOL v6 = v5;
  if ([v5 count] <= a3) {
    return 0;
  }
  uint64_t v7 = [v6 objectAtIndexedSubscript:a3];
  id v8 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v8 setNumberStyle:1];
  uint64_t v9 = (void *)[v8 numberFromString:v7];

  return v9;
}

@end