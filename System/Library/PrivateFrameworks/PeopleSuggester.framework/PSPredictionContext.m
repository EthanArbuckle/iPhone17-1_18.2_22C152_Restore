@interface PSPredictionContext
@end

@implementation PSPredictionContext

void __46___PSPredictionContext_supportsZKWSuggestions__block_invoke()
{
  v15 = (void *)MEMORY[0x1E4F1CAD0];
  v20 = +[_PSConstants mobileMessagesBundleId];
  v14 = +[_PSConstants mobileMessagesComposeBundleId];
  v19 = +[_PSConstants mobileFacetimeBundleId];
  v13 = +[_PSConstants macFacetimeBundleId];
  v18 = +[_PSConstants mobilePhoneBundleId];
  v12 = +[_PSConstants mobileSharePlayPeoplePickerBundleId];
  v17 = +[_PSConstants macSharePlayPeoplePickerBundleId];
  v16 = +[_PSConstants mobileMailAccountSettingsBundleId];
  v11 = +[_PSConstants preferencesBundleId];
  v10 = +[_PSConstants findMyBundleId];
  v0 = +[_PSConstants passwordsAppBundleId];
  v9 = +[_PSConstants macSafariBundleId];
  v1 = +[_PSConstants macSafariTechnologyPreviewBundleId];
  v2 = +[_PSConstants macSafariPlatformSupportBundleId];
  v3 = +[_PSConstants realityLauncherBundleId];
  v4 = +[_PSConstants peoplePickerBundleId];
  v5 = +[_PSConstants peoplePickerTesterBundleId];
  v6 = +[_PSConstants CKTesterBundleId];
  objc_msgSend(v15, "setWithObjects:", v20, v14, v19, v13, v18, v12, v17, v16, v11, v10, v0, v9, v1, v2, v3, v4, v5,
    v6,
  uint64_t v7 = 0);
  v8 = (void *)supportsZKWSuggestions_supportedBundleIds;
  supportsZKWSuggestions_supportedBundleIds = v7;
}

@end