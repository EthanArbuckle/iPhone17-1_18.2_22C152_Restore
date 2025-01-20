@interface PBFBasicPosterGalleryLayoutProvider
- (BOOL)wantsFetchGalleryLayoutAfterHandlePosterDescriptorsDidChange;
- (NSDictionary)posterDescriptorsByExtensionBundleIdentifier;
- (NSLocale)locale;
- (PRSPosterGalleryLayout)galleryLayout;
- (void)fetchGalleryLayoutWithCompletion:(id)a3;
- (void)handlePosterDescriptorsDidChange:(id)a3 withCompletion:(id)a4;
- (void)setGalleryLayout:(id)a3;
- (void)setLocale:(id)a3;
- (void)setPosterDescriptorsByExtensionBundleIdentifier:(id)a3;
@end

@implementation PBFBasicPosterGalleryLayoutProvider

- (void)fetchGalleryLayoutWithCompletion:(id)a3
{
  v4 = (void (**)(id, id, void))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_galleryLayout
    && ([MEMORY[0x1E4F1CA20] currentLocale],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqual:v5->_locale],
        v6,
        v7))
  {
    v8 = v5->_galleryLayout;
  }
  else
  {
    v9 = [(NSDictionary *)v5->_posterDescriptorsByExtensionBundleIdentifier allKeys];
    v10 = [v9 sortedArrayUsingSelector:sel_localizedCompare_];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72__PBFBasicPosterGalleryLayoutProvider_fetchGalleryLayoutWithCompletion___block_invoke;
    v12[3] = &unk_1E69834A0;
    v12[4] = v5;
    v11 = objc_msgSend(v10, "bs_mapNoNulls:", v12);
    v8 = (PRSPosterGalleryLayout *)[objc_alloc(MEMORY[0x1E4F92300]) initWithSections:v11 locale:v5->_locale];
    objc_storeStrong((id *)&v5->_galleryLayout, v8);
  }
  objc_sync_exit(v5);

  v4[2](v4, v8, 0);
}

id __72__PBFBasicPosterGalleryLayoutProvider_fetchGalleryLayoutWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F223A0];
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 error:0];
  id v6 = objc_alloc(MEMORY[0x1E4F28B50]);
  int v7 = [v5 URL];
  v8 = (void *)[v6 _initUniqueWithURL:v7];

  v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  v10 = [v9 fontName];

  v11 = [MEMORY[0x1E4F4F6E0] blackColor];
  v12 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v4];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72__PBFBasicPosterGalleryLayoutProvider_fetchGalleryLayoutWithCompletion___block_invoke_2;
  v22[3] = &unk_1E6983478;
  id v13 = v8;
  id v23 = v13;
  id v14 = v10;
  id v24 = v14;
  id v15 = v11;
  id v25 = v15;
  v16 = objc_msgSend(v12, "bs_map:", v22);
  if ([v16 count])
  {
    BOOL v17 = (unint64_t)[v16 count] > 2;
    id v18 = objc_alloc(MEMORY[0x1E4F92308]);
    v19 = [v5 localizedName];
    v20 = (void *)[v18 initWithType:v17 localizedTitle:v19 localizedSubtitle:0 localizedDescriptiveText:0 symbolImageName:0 symbolColorName:0 unityDescription:0 items:v16];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

id __72__PBFBasicPosterGalleryLayoutProvider_fetchGalleryLayoutWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 extensionBundleIdentifier];
  v5 = [v3 identifier];
  id v6 = [NSString stringWithFormat:@"'%@'-'%@'", v4, v5];
  int v7 = [v3 galleryOptions];

  v8 = [v7 displayNameLocalizationKey];

  uint64_t v9 = [*(id *)(a1 + 32) localizedStringForKey:v8 value:0 table:0];
  v10 = (void *)v9;
  v11 = &stru_1F2A71F00;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  v12 = v11;

  LOWORD(v15) = 0;
  id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F922F0]), "initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:localizedDisplayName:localizedSubtitle:titleFontName:titleColor:subtitleComplication:layoutType:modeSemanticType:modeUUID:complications:landscapeComplications:blankTemplate:shouldShowAsShuffleStack:source:", v6, v5, v4, 0, 0, 0, v12, 0, *(void *)(a1 + 40), *(void *)(a1 + 48), 0, 0, 0, 0,
                  0,
                  0,
                  v15,
                  0);

  return v13;
}

- (void)handlePosterDescriptorsDidChange:(id)a3 withCompletion:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  int v7 = self;
  objc_sync_enter(v7);
  if (([v13 isEqualToDictionary:v7->_posterDescriptorsByExtensionBundleIdentifier] & 1) == 0)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v13 copyItems:1];
    posterDescriptorsByExtensionBundleIdentifier = v7->_posterDescriptorsByExtensionBundleIdentifier;
    v7->_posterDescriptorsByExtensionBundleIdentifier = (NSDictionary *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA20] currentLocale];
    locale = v7->_locale;
    v7->_locale = (NSLocale *)v10;

    galleryLayout = v7->_galleryLayout;
    v7->_galleryLayout = 0;
  }
  objc_sync_exit(v7);

  (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 1, 0);
}

- (BOOL)wantsFetchGalleryLayoutAfterHandlePosterDescriptorsDidChange
{
  return 1;
}

- (NSDictionary)posterDescriptorsByExtensionBundleIdentifier
{
  return self->_posterDescriptorsByExtensionBundleIdentifier;
}

- (void)setPosterDescriptorsByExtensionBundleIdentifier:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (PRSPosterGalleryLayout)galleryLayout
{
  return self->_galleryLayout;
}

- (void)setGalleryLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryLayout, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_posterDescriptorsByExtensionBundleIdentifier, 0);
}

@end