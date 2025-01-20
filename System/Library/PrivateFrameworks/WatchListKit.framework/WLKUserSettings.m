@interface WLKUserSettings
- (BOOL)activeUser;
- (BOOL)ageVerified;
- (BOOL)favoritesSyncEnabled;
- (BOOL)globalAccountConsent;
- (BOOL)nextEpisodeAutoPlayEnabled;
- (BOOL)recommendedItemsAutoPlayEnabled;
- (NSDictionary)brandSidebarSetting;
- (NSString)country;
- (WLKPostPlayAutoPlaySettings)postPlayAutoPlaySettings;
- (WLKUserSettings)initWithBrandId:(id)a3 shouldHide:(BOOL)a4;
- (WLKUserSettings)initWithBrandSidebarSetting;
- (WLKUserSettings)initWithDictionary:(id)a3;
- (WLKUserSettings)initWithFavoritesSync;
- (WLKUserSettings)initWithFavoritesSyncEnabled:(BOOL)a3;
- (WLKUserSettings)initWithPostPlayAutoPlaySetting;
- (WLKUserSettings)initWithPostPlayAutoPlaySettings:(id)a3;
- (WLKUserSettings)initWithTabId:(id)a3 shouldPin:(BOOL)a4;
- (id)_patchData;
- (id)_patchJSONDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)postPlayAutoPlayType;
- (void)setInitWithBrandSidebarSetting:(BOOL)a3;
- (void)setInitWithFavoritesSync:(BOOL)a3;
- (void)setInitWithPostPlayAutoPlaySetting:(BOOL)a3;
- (void)setPostPlayAutoPlaySettings:(id)a3;
- (void)setPostPlayAutoPlayType:(unint64_t)a3;
@end

@implementation WLKUserSettings

- (WLKUserSettings)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WLKUserSettings;
  v5 = [(WLKUserSettings *)&v20 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "wlk_dictionaryForKey:", @"data");
    v5->_activeUser = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", @"activeUser", 0);
    v5->_ageVerified = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", @"ageVerified", 0);
    uint64_t v7 = objc_msgSend(v6, "wlk_stringForKey:", @"country");
    country = v5->_country;
    v5->_country = (NSString *)v7;

    v5->_favoritesSyncEnabled = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", @"favoritesSyncEnabled", 0);
    v5->_recommendedItemsAutoPlayEnabled = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", @"postPlayAutoPlayEnabled", 1);
    v5->_nextEpisodeAutoPlayEnabled = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", @"nextEpisodeAutoPlayEnabled", 1);
    v5->_globalAccountConsent = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", @"gac", 0);
    uint64_t v9 = objc_msgSend(v6, "wlk_dictionaryForKey:", @"brandSidebarSetting");
    brandSidebarSetting = v5->_brandSidebarSetting;
    v5->_brandSidebarSetting = (NSDictionary *)v9;

    *(_WORD *)&v5->_initWithFavoritesSync = 0;
    v5->_initWithPostPlayAutoPlaySetting = 0;
    v11 = objc_alloc_init(WLKPostPlayAutoPlaySettings);
    postPlayAutoPlaySettings = v5->_postPlayAutoPlaySettings;
    v5->_postPlayAutoPlaySettings = v11;

    v13 = objc_msgSend(v6, "wlk_numberForKey:", @"postPlayAutoPlayEnabled");

    if (v13)
    {
      v14 = v5->_postPlayAutoPlaySettings;
      v15 = [NSNumber numberWithBool:v5->_recommendedItemsAutoPlayEnabled];
      [(WLKPostPlayAutoPlaySettings *)v14 setRecommendedItemsSettingValue:v15];
    }
    v16 = objc_msgSend(v6, "wlk_numberForKey:", @"nextEpisodeAutoPlayEnabled");

    if (v16)
    {
      v17 = v5->_postPlayAutoPlaySettings;
      v18 = [NSNumber numberWithBool:v5->_nextEpisodeAutoPlayEnabled];
      [(WLKPostPlayAutoPlaySettings *)v17 setNextEpisodeSettingValue:v18];
    }
  }

  return v5;
}

- (WLKUserSettings)initWithPostPlayAutoPlaySettings:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WLKUserSettings;
  v6 = [(WLKUserSettings *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 nextEpisodeSettingValue];

    if (v7)
    {
      v8 = [v5 nextEpisodeSettingValue];
      v6->_nextEpisodeAutoPlayEnabled = [v8 BOOLValue];
    }
    uint64_t v9 = [v5 recommendedItemsSettingValue];

    if (v9)
    {
      v10 = [v5 recommendedItemsSettingValue];
      v6->_recommendedItemsAutoPlayEnabled = [v10 BOOLValue];
    }
    *(_WORD *)&v6->_initWithFavoritesSync = 0;
    v6->_initWithPostPlayAutoPlaySetting = 1;
    objc_storeStrong((id *)&v6->_postPlayAutoPlaySettings, a3);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (v5)
  {
    *(unsigned char *)(v5 + 8) = self->_activeUser;
    *(unsigned char *)(v5 + 9) = self->_ageVerified;
    uint64_t v7 = [(NSString *)self->_country copyWithZone:a3];
    v8 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v7;

    *(unsigned char *)(v6 + 10) = self->_favoritesSyncEnabled;
    *(unsigned char *)(v6 + 11) = self->_recommendedItemsAutoPlayEnabled;
    *(unsigned char *)(v6 + 12) = self->_nextEpisodeAutoPlayEnabled;
    *(unsigned char *)(v6 + 13) = self->_globalAccountConsent;
    uint64_t v9 = [(NSDictionary *)self->_brandSidebarSetting copyWithZone:a3];
    v10 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v9;

    id v11 = [(WLKPostPlayAutoPlaySettings *)self->_postPlayAutoPlaySettings copyWithZone:a3];
    objc_super v12 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v11;
  }
  return (id)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postPlayAutoPlaySettings, 0);
  objc_storeStrong((id *)&self->_brandSidebarSetting, 0);

  objc_storeStrong((id *)&self->_country, 0);
}

- (WLKPostPlayAutoPlaySettings)postPlayAutoPlaySettings
{
  return self->_postPlayAutoPlaySettings;
}

- (WLKUserSettings)initWithFavoritesSyncEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WLKUserSettings;
  result = [(WLKUserSettings *)&v5 init];
  if (result)
  {
    result->_favoritesSyncEnabled = a3;
    *(_WORD *)&result->_initWithFavoritesSync = 1;
    result->_initWithPostPlayAutoPlaySetting = 0;
  }
  return result;
}

- (WLKUserSettings)initWithBrandId:(id)a3 shouldHide:(BOOL)a4
{
  BOOL v4 = a4;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WLKUserSettings;
  uint64_t v7 = [(WLKUserSettings *)&v13 init];
  if (v7)
  {
    id v16 = v6;
    v14 = @"isHidden";
    v8 = [NSNumber numberWithBool:v4];
    v15 = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v17[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    brandSidebarSetting = v7->_brandSidebarSetting;
    v7->_brandSidebarSetting = (NSDictionary *)v10;

    *(_WORD *)&v7->_initWithFavoritesSync = 256;
    v7->_initWithPostPlayAutoPlaySetting = 0;
  }

  return v7;
}

- (WLKUserSettings)initWithTabId:(id)a3 shouldPin:(BOOL)a4
{
  BOOL v4 = a4;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WLKUserSettings;
  uint64_t v7 = [(WLKUserSettings *)&v13 init];
  if (v7)
  {
    id v16 = v6;
    v14 = @"isPinned";
    v8 = [NSNumber numberWithBool:v4];
    v15 = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v17[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    brandSidebarSetting = v7->_brandSidebarSetting;
    v7->_brandSidebarSetting = (NSDictionary *)v10;

    *(_WORD *)&v7->_initWithFavoritesSync = 256;
    v7->_initWithPostPlayAutoPlaySetting = 0;
  }

  return v7;
}

- (id)_patchJSONDictionary
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (self->_initWithFavoritesSync)
  {
    v14 = @"favoritesSyncEnabled";
    id v3 = [NSNumber numberWithBool:self->_favoritesSyncEnabled];
    v15[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
LABEL_3:
    objc_super v5 = (void *)v4;

    goto LABEL_6;
  }
  if (self->_initWithBrandSidebarSetting)
  {
    brandSidebarSetting = self->_brandSidebarSetting;
    objc_super v12 = @"brandSidebarSetting";
    objc_super v13 = brandSidebarSetting;
    objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  }
  else
  {
    if (self->_initWithPostPlayAutoPlaySetting)
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v8 = [(WLKPostPlayAutoPlaySettings *)self->_postPlayAutoPlaySettings nextEpisodeSettingValue];

      if (v8)
      {
        uint64_t v9 = [NSNumber numberWithBool:self->_nextEpisodeAutoPlayEnabled];
        [v3 setObject:v9 forKey:@"nextEpisodeAutoPlayEnabled"];
      }
      uint64_t v10 = [(WLKPostPlayAutoPlaySettings *)self->_postPlayAutoPlaySettings recommendedItemsSettingValue];

      if (v10)
      {
        id v11 = [NSNumber numberWithBool:self->_recommendedItemsAutoPlayEnabled];
        [v3 setObject:v11 forKey:@"postPlayAutoPlayEnabled"];
      }
      uint64_t v4 = [v3 copy];
      goto LABEL_3;
    }
    objc_super v5 = 0;
  }
LABEL_6:

  return v5;
}

- (id)_patchData
{
  v2 = [(WLKUserSettings *)self _patchJSONDictionary];
  uint64_t v7 = 0;
  id v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:&v7];
  uint64_t v4 = v3;
  id v5 = 0;
  if (!v7) {
    id v5 = v3;
  }

  return v5;
}

- (BOOL)activeUser
{
  return self->_activeUser;
}

- (BOOL)ageVerified
{
  return self->_ageVerified;
}

- (NSString)country
{
  return self->_country;
}

- (BOOL)favoritesSyncEnabled
{
  return self->_favoritesSyncEnabled;
}

- (BOOL)recommendedItemsAutoPlayEnabled
{
  return self->_recommendedItemsAutoPlayEnabled;
}

- (BOOL)nextEpisodeAutoPlayEnabled
{
  return self->_nextEpisodeAutoPlayEnabled;
}

- (BOOL)globalAccountConsent
{
  return self->_globalAccountConsent;
}

- (NSDictionary)brandSidebarSetting
{
  return self->_brandSidebarSetting;
}

- (void)setPostPlayAutoPlaySettings:(id)a3
{
}

- (WLKUserSettings)initWithFavoritesSync
{
  return (WLKUserSettings *)self->_initWithFavoritesSync;
}

- (void)setInitWithFavoritesSync:(BOOL)a3
{
  self->_initWithFavoritesSync = a3;
}

- (WLKUserSettings)initWithBrandSidebarSetting
{
  return (WLKUserSettings *)self->_initWithBrandSidebarSetting;
}

- (void)setInitWithBrandSidebarSetting:(BOOL)a3
{
  self->_initWithBrandSidebarSetting = a3;
}

- (WLKUserSettings)initWithPostPlayAutoPlaySetting
{
  return (WLKUserSettings *)self->_initWithPostPlayAutoPlaySetting;
}

- (void)setInitWithPostPlayAutoPlaySetting:(BOOL)a3
{
  self->_initWithPostPlayAutoPlaySetting = a3;
}

- (unint64_t)postPlayAutoPlayType
{
  return self->_postPlayAutoPlayType;
}

- (void)setPostPlayAutoPlayType:(unint64_t)a3
{
  self->_postPlayAutoPlayType = a3;
}

@end