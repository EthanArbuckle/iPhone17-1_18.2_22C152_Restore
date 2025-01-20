@interface MobileAssetManager
+ (id)sharedInstance;
- (BillingRegionAndLocationAsset)podcastsTranscriptsAsset;
- (CountryAndGracePeriodAsset)berylliumAsset;
- (CountryAndGracePeriodAsset)boronAsset;
- (CountryAndGracePeriodAsset)heliumAsset;
- (CountryAndGracePeriodAsset)lithiumAsset;
- (CountryAndGracePeriodAsset)potassiumAsset;
- (CountryAndGracePeriodAsset)vanadiumAsset;
- (CountryAndRegionAsset)rubidiumAsset;
- (CountryAsset)aluminumAsset;
- (CountryAsset)argonAsset;
- (CountryAsset)arsenicAsset;
- (CountryAsset)bromineAsset;
- (CountryAsset)carbonAsset;
- (CountryAsset)chlorineAsset;
- (CountryAsset)chromiumAsset;
- (CountryAsset)cobaltAsset;
- (CountryAsset)fluorineAsset;
- (CountryAsset)galliumAsset;
- (CountryAsset)germaniumAsset;
- (CountryAsset)greymatterAsset;
- (CountryAsset)hydrogenAsset;
- (CountryAsset)ironAsset;
- (CountryAsset)lotXAsset;
- (CountryAsset)magnesiumAsset;
- (CountryAsset)manganeseAsset;
- (CountryAsset)neonAsset;
- (CountryAsset)nickelAsset;
- (CountryAsset)nitrogenAsset;
- (CountryAsset)oxygenAsset;
- (CountryAsset)scandiumAsset;
- (CountryAsset)searchMarketplacesAsset;
- (CountryAsset)seleniumAsset;
- (CountryAsset)siliconAsset;
- (CountryAsset)sodiumAsset;
- (CountryAsset)strontiumAsset;
- (CountryAsset)swiftAssistAsset;
- (CountryAsset)titaniumAsset;
- (CountryAsset)xcodeLLMAsset;
- (CountryAsset)yttriumAsset;
- (EligibilityAsset)copperAsset;
- (MobileAssetManager)init;
- (NSNumber)assetVersion;
- (NSNumber)fallbackVersion;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_queue)mobileAssetQueue;
- (PolicyAndGracePeriodAsset)kryptonAsset;
- (PolicyAndGracePeriodAsset)phosphorusAsset;
- (PolicyAndGracePeriodAsset)sulfurAsset;
- (id)debugDescription;
- (void)_initDomainsWithConfigPlist:(id)a3;
- (void)_onMobileAssetQueue_fetchMobileAssetContentWithCompletion:(id)a3;
- (void)_onMobileAssetQueue_markInterestInMobileAssetWithCompletion:(id)a3;
- (void)asyncRefetchMobileAsset;
- (void)registerForMobileAssetUpdateNotification;
- (void)setAluminumAsset:(id)a3;
- (void)setArgonAsset:(id)a3;
- (void)setArsenicAsset:(id)a3;
- (void)setAssetVersion:(id)a3;
- (void)setBerylliumAsset:(id)a3;
- (void)setBoronAsset:(id)a3;
- (void)setBromineAsset:(id)a3;
- (void)setCarbonAsset:(id)a3;
- (void)setChlorineAsset:(id)a3;
- (void)setChromiumAsset:(id)a3;
- (void)setCobaltAsset:(id)a3;
- (void)setCopperAsset:(id)a3;
- (void)setFallbackVersion:(id)a3;
- (void)setFluorineAsset:(id)a3;
- (void)setGalliumAsset:(id)a3;
- (void)setGermaniumAsset:(id)a3;
- (void)setGreymatterAsset:(id)a3;
- (void)setHeliumAsset:(id)a3;
- (void)setHydrogenAsset:(id)a3;
- (void)setIronAsset:(id)a3;
- (void)setKryptonAsset:(id)a3;
- (void)setLithiumAsset:(id)a3;
- (void)setLotXAsset:(id)a3;
- (void)setMagnesiumAsset:(id)a3;
- (void)setManganeseAsset:(id)a3;
- (void)setNeonAsset:(id)a3;
- (void)setNickelAsset:(id)a3;
- (void)setNitrogenAsset:(id)a3;
- (void)setOxygenAsset:(id)a3;
- (void)setPhosphorusAsset:(id)a3;
- (void)setPodcastsTranscriptsAsset:(id)a3;
- (void)setPotassiumAsset:(id)a3;
- (void)setRubidiumAsset:(id)a3;
- (void)setScandiumAsset:(id)a3;
- (void)setSearchMarketplacesAsset:(id)a3;
- (void)setSeleniumAsset:(id)a3;
- (void)setSiliconAsset:(id)a3;
- (void)setSodiumAsset:(id)a3;
- (void)setStrontiumAsset:(id)a3;
- (void)setSulfurAsset:(id)a3;
- (void)setSwiftAssistAsset:(id)a3;
- (void)setTitaniumAsset:(id)a3;
- (void)setVanadiumAsset:(id)a3;
- (void)setXcodeLLMAsset:(id)a3;
- (void)setYttriumAsset:(id)a3;
@end

@implementation MobileAssetManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackVersion, 0);
  objc_storeStrong((id *)&self->_mobileAssetQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_yttriumAsset, 0);
  objc_storeStrong((id *)&self->_strontiumAsset, 0);
  objc_storeStrong((id *)&self->_rubidiumAsset, 0);
  objc_storeStrong((id *)&self->_kryptonAsset, 0);
  objc_storeStrong((id *)&self->_bromineAsset, 0);
  objc_storeStrong((id *)&self->_seleniumAsset, 0);
  objc_storeStrong((id *)&self->_arsenicAsset, 0);
  objc_storeStrong((id *)&self->_germaniumAsset, 0);
  objc_storeStrong((id *)&self->_galliumAsset, 0);
  objc_storeStrong((id *)&self->_copperAsset, 0);
  objc_storeStrong((id *)&self->_nickelAsset, 0);
  objc_storeStrong((id *)&self->_cobaltAsset, 0);
  objc_storeStrong((id *)&self->_ironAsset, 0);
  objc_storeStrong((id *)&self->_manganeseAsset, 0);
  objc_storeStrong((id *)&self->_chromiumAsset, 0);
  objc_storeStrong((id *)&self->_vanadiumAsset, 0);
  objc_storeStrong((id *)&self->_titaniumAsset, 0);
  objc_storeStrong((id *)&self->_scandiumAsset, 0);
  objc_storeStrong((id *)&self->_potassiumAsset, 0);
  objc_storeStrong((id *)&self->_argonAsset, 0);
  objc_storeStrong((id *)&self->_chlorineAsset, 0);
  objc_storeStrong((id *)&self->_sulfurAsset, 0);
  objc_storeStrong((id *)&self->_phosphorusAsset, 0);
  objc_storeStrong((id *)&self->_siliconAsset, 0);
  objc_storeStrong((id *)&self->_aluminumAsset, 0);
  objc_storeStrong((id *)&self->_magnesiumAsset, 0);
  objc_storeStrong((id *)&self->_sodiumAsset, 0);
  objc_storeStrong((id *)&self->_neonAsset, 0);
  objc_storeStrong((id *)&self->_fluorineAsset, 0);
  objc_storeStrong((id *)&self->_oxygenAsset, 0);
  objc_storeStrong((id *)&self->_nitrogenAsset, 0);
  objc_storeStrong((id *)&self->_carbonAsset, 0);
  objc_storeStrong((id *)&self->_boronAsset, 0);
  objc_storeStrong((id *)&self->_berylliumAsset, 0);
  objc_storeStrong((id *)&self->_lithiumAsset, 0);
  objc_storeStrong((id *)&self->_heliumAsset, 0);
  objc_storeStrong((id *)&self->_hydrogenAsset, 0);
  objc_storeStrong((id *)&self->_swiftAssistAsset, 0);
  objc_storeStrong((id *)&self->_searchMarketplacesAsset, 0);
  objc_storeStrong((id *)&self->_podcastsTranscriptsAsset, 0);
  objc_storeStrong((id *)&self->_xcodeLLMAsset, 0);
  objc_storeStrong((id *)&self->_greymatterAsset, 0);

  objc_storeStrong((id *)&self->_lotXAsset, 0);
}

- (void)setFallbackVersion:(id)a3
{
}

- (NSNumber)fallbackVersion
{
  return self->_fallbackVersion;
}

- (OS_dispatch_queue)mobileAssetQueue
{
  return self->_mobileAssetQueue;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setAssetVersion:(id)a3
{
}

- (void)setYttriumAsset:(id)a3
{
}

- (void)setStrontiumAsset:(id)a3
{
}

- (void)setRubidiumAsset:(id)a3
{
}

- (void)setKryptonAsset:(id)a3
{
}

- (void)setBromineAsset:(id)a3
{
}

- (void)setSeleniumAsset:(id)a3
{
}

- (void)setArsenicAsset:(id)a3
{
}

- (void)setGermaniumAsset:(id)a3
{
}

- (void)setGalliumAsset:(id)a3
{
}

- (void)setCopperAsset:(id)a3
{
}

- (void)setNickelAsset:(id)a3
{
}

- (void)setCobaltAsset:(id)a3
{
}

- (void)setIronAsset:(id)a3
{
}

- (void)setManganeseAsset:(id)a3
{
}

- (void)setChromiumAsset:(id)a3
{
}

- (void)setVanadiumAsset:(id)a3
{
}

- (void)setTitaniumAsset:(id)a3
{
}

- (void)setScandiumAsset:(id)a3
{
}

- (void)setPotassiumAsset:(id)a3
{
}

- (void)setArgonAsset:(id)a3
{
}

- (void)setChlorineAsset:(id)a3
{
}

- (void)setSulfurAsset:(id)a3
{
}

- (void)setPhosphorusAsset:(id)a3
{
}

- (void)setSiliconAsset:(id)a3
{
}

- (void)setAluminumAsset:(id)a3
{
}

- (void)setMagnesiumAsset:(id)a3
{
}

- (void)setSodiumAsset:(id)a3
{
}

- (void)setNeonAsset:(id)a3
{
}

- (void)setFluorineAsset:(id)a3
{
}

- (void)setOxygenAsset:(id)a3
{
}

- (void)setNitrogenAsset:(id)a3
{
}

- (void)setCarbonAsset:(id)a3
{
}

- (void)setBoronAsset:(id)a3
{
}

- (void)setBerylliumAsset:(id)a3
{
}

- (void)setLithiumAsset:(id)a3
{
}

- (void)setHeliumAsset:(id)a3
{
}

- (void)setHydrogenAsset:(id)a3
{
}

- (void)setSwiftAssistAsset:(id)a3
{
}

- (void)setSearchMarketplacesAsset:(id)a3
{
}

- (void)setPodcastsTranscriptsAsset:(id)a3
{
}

- (void)setXcodeLLMAsset:(id)a3
{
}

- (void)setGreymatterAsset:(id)a3
{
}

- (void)setLotXAsset:(id)a3
{
}

- (id)debugDescription
{
  v3 = [(MobileAssetManager *)self fallbackVersion];
  v4 = [(MobileAssetManager *)self assetVersion];
  v5 = +[NSString stringWithFormat:@"<MobileAssetManager fallbackVersion: %@ assetVersion: %@>", v3, v4];

  return v5;
}

- (void)_onMobileAssetQueue_fetchMobileAssetContentWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(MobileAssetManager *)self mobileAssetQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [objc_alloc((Class)MAAutoAssetSelector) initForAssetType:@"com.apple.MobileAsset.OSEligibility" withAssetSpecifier:@"Parameters"];
  id v7 = objc_alloc((Class)MAAutoAsset);
  v8 = [(MobileAssetManager *)self mobileAssetQueue];
  id v15 = 0;
  id v9 = [v7 initForClientName:@"eligibilityd:lockContent" selectingAsset:v6 completingFromQueue:v8 error:&v15];
  id v10 = v15;

  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100012208;
    v12[3] = &unk_100038DE0;
    id v14 = v4;
    v12[4] = self;
    id v13 = v9;
    [v13 lockContent:@"lockEligibilityConfigOptions" withTimeout:-1 completion:v12];
  }
  else
  {
    v11 = sub_10000D0EC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]";
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s: Unable to create auto-asset instance: %@", buf, 0x16u);
    }

    (*((void (**)(id, id))v4 + 2))(v4, v10);
  }
}

- (void)asyncRefetchMobileAsset
{
  v3 = [(MobileAssetManager *)self mobileAssetQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000128E8;
  v4[3] = &unk_100038F30;
  v4[4] = self;
  sub_100018B7C(v3, v4);
}

- (void)_onMobileAssetQueue_markInterestInMobileAssetWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(MobileAssetManager *)self mobileAssetQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [objc_alloc((Class)MAAutoAssetSelector) initForAssetType:@"com.apple.MobileAsset.OSEligibility" withAssetSpecifier:@"Parameters"];
  id v7 = objc_alloc((Class)MAAutoAsset);
  v8 = [(MobileAssetManager *)self mobileAssetQueue];
  id v14 = 0;
  id v9 = [v7 initForClientName:@"eligibilityd:interestInContent" selectingAsset:v6 completingFromQueue:v8 error:&v14];
  id v10 = v14;

  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100012BB8;
    v12[3] = &unk_100038D98;
    id v13 = v4;
    [v9 interestInContent:@"EligibilityConfig" completion:v12];
  }
  else
  {
    v11 = sub_10000D0EC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[MobileAssetManager _onMobileAssetQueue_markInterestInMobileAssetWithCompletion:]";
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s: Unable to create auto-asset instance: %@", buf, 0x16u);
    }

    (*((void (**)(id, id))v4 + 2))(v4, v10);
  }
}

- (void)registerForMobileAssetUpdateNotification
{
  +[MAAutoAssetNotifications notifyRegistrationName:@"ASSET_VERSION_DOWNLOADED" forAssetType:@"com.apple.MobileAsset.OSEligibility"];
  int out_token = -1;
  id v3 = objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)[v3 UTF8String];
  v5 = [(MobileAssetManager *)self mobileAssetQueue];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100012E28;
  handler[3] = &unk_100038D70;
  id v8 = v3;
  id v9 = self;
  id v6 = v3;
  notify_register_dispatch(v4, &out_token, v5, handler);
}

- (MobileAssetManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)MobileAssetManager;
  v2 = [(MobileAssetManager *)&v14 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.eligibility.MobileAssetManager.mobileAsset", v3);

    mobileAssetQueue = v2->_mobileAssetQueue;
    v2->_mobileAssetQueue = (OS_dispatch_queue *)v4;
    id v6 = v4;

    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.eligibility.MobileAssetManager.internal", v7);

    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v8;
    id v10 = v8;

    [(MobileAssetManager *)v2 _initDomainsWithConfigPlist:0];
    [(MobileAssetManager *)v2 registerForMobileAssetUpdateNotification];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100013170;
    v12[3] = &unk_100038F30;
    id v13 = v2;
    sub_100018B7C(v6, v12);
  }
  return v2;
}

- (void)_initDomainsWithConfigPlist:(id)a3
{
  id v4 = a3;
  v5 = &off_10003FED0;
  id v6 = &off_10003FED0;
  id v7 = [&off_10003FED0 objectForKeyedSubscript:@"Version"];
  objc_opt_class();
  id v8 = v7;
  if (objc_opt_isKindOfClass()) {
    id v9 = (_UNKNOWN **)v8;
  }
  else {
    id v9 = 0;
  }

  if (!v9)
  {
    id v10 = sub_10000D0EC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v165 = "-[MobileAssetManager _initDomainsWithConfigPlist:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "%s: Fallback Mobile Asset is malformed: Missing version key", buf, 0xCu);
    }

    id v9 = &off_10003C750;
  }
  [(MobileAssetManager *)self setFallbackVersion:v9];
  if (v4
    && (([v4 objectForKeyedSubscript:@"Version"],
         v11 = objc_claimAutoreleasedReturnValue(),
         objc_opt_class(),
         id v12 = v11,
         (objc_opt_isKindOfClass() & 1) == 0)
      ? (id v13 = 0)
      : (id v13 = v12),
        v12,
        v12,
        v13))
  {
    v55 = v13;
    if ([v9 compare:v13] == (id)-1)
    {
      objc_super v14 = (_UNKNOWN **)v4;

      goto LABEL_17;
    }
  }
  else
  {
    v55 = 0;
  }
  objc_super v14 = &off_10003FED0;
LABEL_17:
  id v15 = +[GlobalConfiguration sharedInstance];
  unsigned int v16 = [v15 hasInternalContent];

  v58 = v9;
  v59 = v4;
  if (v16)
  {
    v163 = 0;
    if (asprintf(&v163, "%s%s", "/", "/private/var/db/eligibilityd/mobileAssetParametersOverride.plist") == -1)
    {
      __int16 v17 = sub_10000D0EC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v165 = "copy_eligibility_domain_mobile_asset_override_path";
        __int16 v166 = 2080;
        v167 = "/private/var/db/eligibilityd/mobileAssetParametersOverride.plist";
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
      }
    }
    id v18 = v163;
    if (v163)
    {
      id v19 = +[NSString stringWithUTF8String:v163];
      free(v18);
      v20 = +[NSURL fileURLWithPath:v19 isDirectory:0];
      v21 = +[NSDictionary dictionaryWithContentsOfURL:v20 error:0];
      if (v21)
      {
        v22 = sub_10000D0EC();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = [v20 path];
          *(_DWORD *)buf = 136315394;
          v165 = "-[MobileAssetManager _initDomainsWithConfigPlist:]";
          __int16 v166 = 2112;
          v167 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s: Found Mobile Asset override plist at path %@; Using that instead instead of real values",
            buf,
            0x16u);
        }
        v24 = v21;

        objc_super v14 = v24;
      }
    }
    else
    {
      id v19 = sub_10000D0EC();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v165 = "-[MobileAssetManager _initDomainsWithConfigPlist:]";
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s: Failed to copy mobile asset override path; Ignoring it",
          buf,
          0xCu);
      }
    }
  }
  id v116 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Lot X" withDictionary:v14];
  id v117 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Greymatter" withDictionary:v14];
  id v114 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Xcode LLM" withDictionary:v14];
  id v115 = [[BillingRegionAndLocationAsset alloc] initForMobileAssetRootKey:@"Podcasts Transcripts" withDictionary:v14];
  id v112 = [[CountryAsset alloc] initForMobileAssetRootKey:@"SearchMarketplaces" withDictionary:v14];
  id v113 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Swift Assist" withDictionary:v14];
  id v110 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Hydrogen" withDictionary:v14];
  id v111 = [[CountryAndGracePeriodAsset alloc] initForMobileAssetRootKey:@"Helium" withDictionary:v14];
  id v106 = [[CountryAndGracePeriodAsset alloc] initForMobileAssetRootKey:@"Lithium" withDictionary:v14];
  id v108 = [[CountryAndGracePeriodAsset alloc] initForMobileAssetRootKey:@"Beryllium" withDictionary:v14];
  id v104 = [[CountryAndGracePeriodAsset alloc] initForMobileAssetRootKey:@"Boron" withDictionary:v14];
  id v102 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Carbon" withDictionary:v14];
  id v100 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Nitrogen" withDictionary:v14];
  id v98 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Oxygen" withDictionary:v14];
  id v96 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Fluorine" withDictionary:v14];
  id v94 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Neon" withDictionary:v14];
  id v92 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Sodium" withDictionary:v14];
  id v90 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Magnesium" withDictionary:v14];
  id v88 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Aluminum" withDictionary:v14];
  id v86 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Silicon" withDictionary:v14];
  id v84 = [[PolicyAndGracePeriodAsset alloc] initForMobileAssetRootKey:@"Phosphorus" withDictionary:v14];
  id v82 = [[PolicyAndGracePeriodAsset alloc] initForMobileAssetRootKey:@"Sulfur" withDictionary:v14];
  id v80 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Chlorine" withDictionary:v14];
  id v78 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Argon" withDictionary:v14];
  id v76 = [[CountryAndGracePeriodAsset alloc] initForMobileAssetRootKey:@"Potassium" withDictionary:v14];
  id v74 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Scandium" withDictionary:v14];
  id v72 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Titanium" withDictionary:v14];
  id v70 = [[CountryAndGracePeriodAsset alloc] initForMobileAssetRootKey:@"Vanadium" withDictionary:v14];
  id v68 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Chromium" withDictionary:v14];
  id v66 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Manganese" withDictionary:v14];
  id v64 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Iron" withDictionary:v14];
  id v62 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Cobalt" withDictionary:v14];
  id v60 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Nickel" withDictionary:v14];
  id v25 = [[EligibilityAsset alloc] initForMobileAssetRootKey:@"Copper" withDictionary:v14];
  id v26 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Gallium" withDictionary:v14];
  id v27 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Germanium" withDictionary:v14];
  v28 = v14;
  v40 = v14;
  id v29 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Arsenic" withDictionary:v14];
  id v30 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Selenium" withDictionary:v14];
  id v47 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Bromine" withDictionary:v28];
  id v31 = [[PolicyAndGracePeriodAsset alloc] initForMobileAssetRootKey:@"Krypton" withDictionary:v28];
  id v51 = [[CountryAndRegionAsset alloc] initForMobileAssetRootKey:@"Rubidium" withDictionary:v28];
  id v53 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Strontium" withDictionary:v28];
  id v49 = [[CountryAsset alloc] initForMobileAssetRootKey:@"Yttrium" withDictionary:v28];
  queue = [(MobileAssetManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001438C;
  block[3] = &unk_100038CC0;
  block[4] = self;
  id v119 = v116;
  id v120 = v117;
  id v121 = v114;
  id v122 = v115;
  id v123 = v112;
  id v124 = v113;
  id v125 = v110;
  id v126 = v111;
  id v127 = v106;
  id v128 = v108;
  id v129 = v104;
  id v130 = v102;
  id v131 = v100;
  id v132 = v98;
  id v133 = v96;
  id v134 = v94;
  id v135 = v92;
  id v136 = v90;
  id v137 = v88;
  id v138 = v86;
  id v139 = v84;
  id v140 = v82;
  id v141 = v80;
  id v142 = v78;
  id v143 = v76;
  id v144 = v74;
  id v145 = v72;
  id v146 = v70;
  id v147 = v68;
  id v148 = v66;
  id v149 = v64;
  id v150 = v62;
  id v151 = v60;
  id v152 = v25;
  id v153 = v26;
  id v154 = v27;
  id v155 = v29;
  id v156 = v30;
  id v157 = v47;
  id v158 = v31;
  id v159 = v51;
  id v160 = v53;
  id v161 = v49;
  id v162 = v55;
  id v57 = v55;
  id v56 = v49;
  id v54 = v53;
  id v52 = v51;
  id v50 = v31;
  id v48 = v47;
  id v46 = v30;
  id v45 = v29;
  id v44 = v27;
  id v43 = v26;
  id v42 = v25;
  id v61 = v60;
  id v63 = v62;
  id v65 = v64;
  id v67 = v66;
  id v69 = v68;
  id v71 = v70;
  id v73 = v72;
  id v75 = v74;
  id v77 = v76;
  id v79 = v78;
  id v81 = v80;
  id v83 = v82;
  id v85 = v84;
  id v87 = v86;
  id v89 = v88;
  id v91 = v90;
  id v93 = v92;
  id v95 = v94;
  id v97 = v96;
  id v99 = v98;
  id v101 = v100;
  id v103 = v102;
  id v105 = v104;
  id v109 = v108;
  id v107 = v106;
  id v32 = v111;
  id v33 = v110;
  id v34 = v113;
  id v35 = v112;
  id v36 = v115;
  id v37 = v114;
  id v38 = v117;
  id v39 = v116;
  dispatch_sync(queue, block);
}

- (NSNumber)assetVersion
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000146F8;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

- (CountryAsset)yttriumAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014828;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)strontiumAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014958;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAndRegionAsset)rubidiumAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014A88;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAndRegionAsset *)v4;
}

- (PolicyAndGracePeriodAsset)kryptonAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014BB8;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PolicyAndGracePeriodAsset *)v4;
}

- (CountryAsset)bromineAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014CE8;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)seleniumAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014E18;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)arsenicAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014F48;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)germaniumAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015078;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)galliumAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000151A8;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (EligibilityAsset)copperAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000152D8;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (EligibilityAsset *)v4;
}

- (CountryAsset)nickelAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015408;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)cobaltAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015538;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)ironAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015668;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)manganeseAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015798;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)chromiumAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000158C8;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAndGracePeriodAsset)vanadiumAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000159F8;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAndGracePeriodAsset *)v4;
}

- (CountryAsset)titaniumAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015B28;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)scandiumAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015C58;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAndGracePeriodAsset)potassiumAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015D88;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAndGracePeriodAsset *)v4;
}

- (CountryAsset)argonAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015EB8;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)chlorineAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015FE8;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (PolicyAndGracePeriodAsset)sulfurAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016118;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PolicyAndGracePeriodAsset *)v4;
}

- (PolicyAndGracePeriodAsset)phosphorusAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016248;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PolicyAndGracePeriodAsset *)v4;
}

- (CountryAsset)siliconAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016378;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)aluminumAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000164A8;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)magnesiumAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000165D8;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)sodiumAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016708;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)neonAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016838;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)fluorineAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016968;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)oxygenAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016A98;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)nitrogenAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016BC8;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)carbonAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016CF8;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAndGracePeriodAsset)boronAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016E28;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAndGracePeriodAsset *)v4;
}

- (CountryAndGracePeriodAsset)berylliumAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016F58;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAndGracePeriodAsset *)v4;
}

- (CountryAndGracePeriodAsset)lithiumAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100017088;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAndGracePeriodAsset *)v4;
}

- (CountryAndGracePeriodAsset)heliumAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000171B8;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAndGracePeriodAsset *)v4;
}

- (CountryAsset)hydrogenAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000172E8;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)swiftAssistAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100017418;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)searchMarketplacesAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100017548;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (BillingRegionAndLocationAsset)podcastsTranscriptsAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100017678;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (BillingRegionAndLocationAsset *)v4;
}

- (CountryAsset)xcodeLLMAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000177A8;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)greymatterAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000178D8;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)lotXAsset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000146E0;
  v11 = sub_1000146F0;
  id v12 = 0;
  id v3 = [(MobileAssetManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100017A08;
  v6[3] = &unk_100039020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017ABC;
  block[3] = &unk_100038E50;
  block[4] = a1;
  if (qword_10004C848 != -1) {
    dispatch_once(&qword_10004C848, block);
  }
  v2 = (void *)qword_10004C840;

  return v2;
}

@end