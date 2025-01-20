@interface WLKChannelDetails
+ (void)sui_fetchSeasonTitlesSettingWithCompletionHandler:(id)a3;
- (BOOL)isApSubscription;
- (BOOL)isAppInstalled;
- (BOOL)isConsented;
- (BOOL)isFirstParty;
- (BOOL)isSubscribed;
- (BOOL)isWatchListEnabled;
- (BOOL)isiTunes;
- (BOOL)shouldTrackPlayActivity;
- (NSArray)appAdamIDs;
- (NSArray)appBundleIDs;
- (NSDictionary)rateLimit;
- (NSString)appName;
- (NSString)appStoreURLString;
- (NSString)channelID;
- (NSString)description;
- (NSString)minRequiredAppVersion;
- (NSString)name;
- (NSString)title;
- (NSURL)appStoreURL;
- (WLKArtworkVariantListing)images;
- (WLKChannelDetails)init;
- (WLKChannelDetails)initWithDictionary:(id)a3;
- (id)appIconURLForSize:(CGSize)a3;
- (id)sui_channelName;
- (id)sui_seasonEpisodeLabel:(BOOL)a3 seasonTitleAvailable:(BOOL)a4 seasonNumber:(id)a5 episodeNumber:(id)a6;
- (unint64_t)channelType;
- (void)setAppStoreURLString:(id)a3;
- (void)setConsented:(BOOL)a3;
@end

@implementation WLKChannelDetails

- (id)sui_channelName
{
  v3 = [(WLKChannelDetails *)self title];
  if ([(WLKChannelDetails *)self isiTunes])
  {
    v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WatchListKit"];
    uint64_t v5 = [v4 localizedStringForKey:@"ITUNES_CHANNEL_NAME" value:&stru_1F13BCF18 table:@"WatchListKit"];

    v3 = (void *)v5;
  }

  return v3;
}

+ (void)sui_fetchSeasonTitlesSettingWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = +[WLKConfigurationManager sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90__WLKChannelDetails_SearchUIAdditions__sui_fetchSeasonTitlesSettingWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E620A218;
  id v7 = v3;
  id v5 = v3;
  [v4 fetchConfigurationWithCompletionHandler:v6];
}

void __90__WLKChannelDetails_SearchUIAdditions__sui_fetchSeasonTitlesSettingWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = WLKSystemLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __90__WLKChannelDetails_SearchUIAdditions__sui_fetchSeasonTitlesSettingWithCompletionHandler___block_invoke_cold_1((uint64_t)v5, v6);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v7 = [a2 features];
    objc_msgSend(v7, "wlk_BOOLForKey:defaultValue:", @"seasonTitles", 0);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)sui_seasonEpisodeLabel:(BOOL)a3 seasonTitleAvailable:(BOOL)a4 seasonNumber:(id)a5 episodeNumber:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v9 = a5;
  id v10 = a6;
  v11 = v10;
  if (v8 && v7)
  {
    if (v10)
    {
      v12 = NSString;
      v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WatchListKit"];
      v14 = [v13 localizedStringForKey:@"EPISODE_FORMAT" value:&stru_1F13BCF18 table:@"WatchListKit"];
      objc_msgSend(v12, "stringWithFormat:", v14, v11, v21);
LABEL_8:
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    v17 = WLKSystemLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v18 = "WLKChannelDetails+SearchUIAdditions - WLK episodeNumber is nil";
      v19 = buf;
      goto LABEL_13;
    }
  }
  else
  {
    if (v9 && v10)
    {
      v15 = NSString;
      v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WatchListKit"];
      v14 = [v13 localizedStringForKey:@"SEASON_EPISODE_FORMAT" value:&stru_1F13BCF18 table:@"WatchListKit"];
      objc_msgSend(v15, "stringWithFormat:", v14, v9, v11);
      goto LABEL_8;
    }
    v17 = WLKSystemLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = 0;
      v18 = "WLKChannelDetails+SearchUIAdditions - WLK seasonNumber or episodeNumber is nil";
      v19 = (uint8_t *)&v22;
LABEL_13:
      _os_log_impl(&dword_1BA2E8000, v17, OS_LOG_TYPE_DEFAULT, v18, v19, 2u);
    }
  }

  v16 = &stru_1F13BCF18;
LABEL_15:

  return v16;
}

- (id)appIconURLForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(WLKChannelDetails *)self images];
  v6 = objc_msgSend(v5, "bestArtworkVariantOfType:forSize:", 10, width, height);
  BOOL v7 = objc_msgSend(v6, "artworkURLForSize:format:", @"png", width, height);

  return v7;
}

- (WLKChannelDetails)initWithDictionary:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)WLKChannelDetails;
  id v5 = [(WLKChannelDetails *)&v55 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "wlk_stringForKey:", @"id");
    uint64_t v7 = [v6 copy];
    channelID = v5->_channelID;
    v5->_channelID = (NSString *)v7;

    id v9 = objc_msgSend(v4, "wlk_stringForKey:", @"title");
    uint64_t v10 = [v9 copy];
    title = v5->_title;
    v5->_title = (NSString *)v10;

    v12 = objc_msgSend(v4, "wlk_stringForKey:", @"name");
    uint64_t v13 = [v12 copy];
    name = v5->_name;
    v5->_name = (NSString *)v13;

    v15 = objc_msgSend(v4, "wlk_arrayForKey:", @"appAdamIds");
    uint64_t v16 = [v15 copy];
    appAdamIDs = v5->_appAdamIDs;
    v5->_appAdamIDs = (NSArray *)v16;

    v18 = objc_msgSend(v4, "wlk_arrayForKey:", @"appBundleIds");
    uint64_t v19 = [v18 copy];
    appBundleIDs = v5->_appBundleIDs;
    v5->_appBundleIDs = (NSArray *)v19;

    uint64_t v21 = objc_msgSend(v4, "wlk_stringForKey:", @"appName");
    uint64_t v22 = [v21 copy];
    appName = v5->_appName;
    v5->_appName = (NSString *)v22;

    v24 = objc_msgSend(v4, "wlk_stringForKey:", @"appStoreUrl");
    uint64_t v25 = [v24 copy];
    appStoreURLString = v5->_appStoreURLString;
    v5->_appStoreURLString = (NSString *)v25;

    v5->_subscribed = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", @"isSubscribed", 0);
    v5->_itunes = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", @"isItunes", 0);
    v5->_firstParty = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", @"isFirstParty", 0);
    v5->_watchListEnabled = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", @"isWatchlistEnabled", 0);
    v27 = [WLKArtworkVariantListing alloc];
    v28 = objc_msgSend(v4, "wlk_dictionaryForKey:", @"images");
    uint64_t v29 = [(WLKArtworkVariantListing *)v27 initWithArtworkDictionary:v28];
    images = v5->_images;
    v5->_images = (WLKArtworkVariantListing *)v29;

    v31 = objc_msgSend(v4, "wlk_dictionaryForKey:", @"rateLimit");
    uint64_t v32 = [v31 copy];
    rateLimit = v5->_rateLimit;
    v5->_rateLimit = (NSDictionary *)v32;

    v5->_shouldTrackPlayActivity = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", @"shouldTrackPlayActivity", 1);
    v5->_consented = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", @"isConsented", 0);
    v5->_apSubscription = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", @"isApSubscription", 0);
    uint64_t v34 = objc_msgSend(v4, "wlk_stringForKey:", @"minWatchlistAppVersion");
    minRequiredAppVersion = v5->_minRequiredAppVersion;
    v5->_minRequiredAppVersion = (NSString *)v34;

    v36 = objc_msgSend(v4, "wlk_numberForKey:", @"channelType");
    unsigned int v37 = [v36 unsignedIntValue];
    v5->_channelType = v37;
    if (v5->_itunes
      || v37 == 1
      || (objc_msgSend(v4, "wlk_numberForKey:", @"isInstalled"),
          v38 = objc_claimAutoreleasedReturnValue(),
          int v39 = [v38 isEqual:&unk_1F13D9908],
          v38,
          v39))
    {
      v5->_appInstalled = 1;
    }
    else
    {
      id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v41 = +[WLKAppLibrary defaultAppLibrary];
      v42 = [v41 allAppBundleIdentifiers];
      [v40 addObjectsFromArray:v42];

      v43 = +[WLKAppLibrary defaultAppLibrary];
      v44 = [v43 _nonConformingAppBundleIdentifiers];
      [v40 addObjectsFromArray:v44];

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      v45 = v5->_appBundleIDs;
      uint64_t v46 = [(NSArray *)v45 countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v52;
        while (2)
        {
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v52 != v48) {
              objc_enumerationMutation(v45);
            }
            if (objc_msgSend(v40, "containsObject:", *(void *)(*((void *)&v51 + 1) + 8 * i), (void)v51))
            {
              v5->_appInstalled = 1;
              goto LABEL_16;
            }
          }
          uint64_t v47 = [(NSArray *)v45 countByEnumeratingWithState:&v51 objects:v56 count:16];
          if (v47) {
            continue;
          }
          break;
        }
      }
LABEL_16:
    }
  }

  return v5;
}

- (WLKChannelDetails)init
{
  return 0;
}

- (NSURL)appStoreURL
{
  if (self->_appStoreURLString)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
  }
  else
  {
    v2 = 0;
  }

  return (NSURL *)v2;
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)WLKChannelDetails;
  id v3 = [(WLKChannelDetails *)&v9 description];
  id v4 = (void *)[v3 mutableCopy];

  channelID = self->_channelID;
  title = self->_title;
  uint64_t v7 = [(NSArray *)self->_appBundleIDs componentsJoinedByString:@","];
  [v4 appendFormat:@" %@ - ID: %@ - Bundles: %@", title, channelID, v7];

  return (NSString *)v4;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)appAdamIDs
{
  return self->_appAdamIDs;
}

- (NSArray)appBundleIDs
{
  return self->_appBundleIDs;
}

- (NSString)appName
{
  return self->_appName;
}

- (WLKArtworkVariantListing)images
{
  return self->_images;
}

- (BOOL)isSubscribed
{
  return self->_subscribed;
}

- (BOOL)isiTunes
{
  return self->_itunes;
}

- (BOOL)isFirstParty
{
  return self->_firstParty;
}

- (BOOL)isWatchListEnabled
{
  return self->_watchListEnabled;
}

- (BOOL)isConsented
{
  return self->_consented;
}

- (void)setConsented:(BOOL)a3
{
  self->_consented = a3;
}

- (BOOL)isApSubscription
{
  return self->_apSubscription;
}

- (NSDictionary)rateLimit
{
  return self->_rateLimit;
}

- (BOOL)shouldTrackPlayActivity
{
  return self->_shouldTrackPlayActivity;
}

- (unint64_t)channelType
{
  return self->_channelType;
}

- (NSString)minRequiredAppVersion
{
  return self->_minRequiredAppVersion;
}

- (BOOL)isAppInstalled
{
  return self->_appInstalled;
}

- (NSString)appStoreURLString
{
  return self->_appStoreURLString;
}

- (void)setAppStoreURLString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStoreURLString, 0);
  objc_storeStrong((id *)&self->_minRequiredAppVersion, 0);
  objc_storeStrong((id *)&self->_rateLimit, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appBundleIDs, 0);
  objc_storeStrong((id *)&self->_appAdamIDs, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_channelID, 0);
}

void __90__WLKChannelDetails_SearchUIAdditions__sui_fetchSeasonTitlesSettingWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BA2E8000, a2, OS_LOG_TYPE_ERROR, "WLKChannelDetails+SearchUIAdditions - WLK init config fetch error %@", (uint8_t *)&v2, 0xCu);
}

@end