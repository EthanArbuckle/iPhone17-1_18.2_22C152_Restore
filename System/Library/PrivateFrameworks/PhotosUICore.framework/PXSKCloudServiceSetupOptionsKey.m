@interface PXSKCloudServiceSetupOptionsKey
+ (NSString)action;
+ (NSString)affiliateToken;
+ (NSString)campaignToken;
+ (NSString)iTunesItemIdentifier;
+ (NSString)messageIdentifier;
@end

@implementation PXSKCloudServiceSetupOptionsKey

+ (NSString)messageIdentifier
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v2 = (void **)getSKCloudServiceSetupOptionsMessageIdentifierKeySymbolLoc_ptr;
  uint64_t v11 = getSKCloudServiceSetupOptionsMessageIdentifierKeySymbolLoc_ptr;
  if (!getSKCloudServiceSetupOptionsMessageIdentifierKeySymbolLoc_ptr)
  {
    v3 = StoreKitLibrary();
    v9[3] = (uint64_t)dlsym(v3, "SKCloudServiceSetupOptionsMessageIdentifierKey");
    getSKCloudServiceSetupOptionsMessageIdentifierKeySymbolLoc_ptr = v9[3];
    v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    v4 = *v2;
    return (NSString *)v4;
  }
  else
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = [NSString stringWithUTF8String:"SKCloudServiceSetupOptionsKey getSKCloudServiceSetupOptionsMessageIdentifierKey(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"StoreKit+PhotosUICore.m", 22, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (NSString)campaignToken
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v2 = (void **)getSKCloudServiceSetupOptionsCampaignTokenKeySymbolLoc_ptr;
  uint64_t v11 = getSKCloudServiceSetupOptionsCampaignTokenKeySymbolLoc_ptr;
  if (!getSKCloudServiceSetupOptionsCampaignTokenKeySymbolLoc_ptr)
  {
    v3 = StoreKitLibrary();
    v9[3] = (uint64_t)dlsym(v3, "SKCloudServiceSetupOptionsCampaignTokenKey");
    getSKCloudServiceSetupOptionsCampaignTokenKeySymbolLoc_ptr = v9[3];
    v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    v4 = *v2;
    return (NSString *)v4;
  }
  else
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = [NSString stringWithUTF8String:"SKCloudServiceSetupOptionsKey getSKCloudServiceSetupOptionsCampaignTokenKey(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"StoreKit+PhotosUICore.m", 21, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (NSString)affiliateToken
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v2 = (void **)getSKCloudServiceSetupOptionsAffiliateTokenKeySymbolLoc_ptr;
  uint64_t v11 = getSKCloudServiceSetupOptionsAffiliateTokenKeySymbolLoc_ptr;
  if (!getSKCloudServiceSetupOptionsAffiliateTokenKeySymbolLoc_ptr)
  {
    v3 = StoreKitLibrary();
    v9[3] = (uint64_t)dlsym(v3, "SKCloudServiceSetupOptionsAffiliateTokenKey");
    getSKCloudServiceSetupOptionsAffiliateTokenKeySymbolLoc_ptr = v9[3];
    v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    v4 = *v2;
    return (NSString *)v4;
  }
  else
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = [NSString stringWithUTF8String:"SKCloudServiceSetupOptionsKey getSKCloudServiceSetupOptionsAffiliateTokenKey(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"StoreKit+PhotosUICore.m", 20, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (NSString)iTunesItemIdentifier
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v2 = (void **)getSKCloudServiceSetupOptionsITunesItemIdentifierKeySymbolLoc_ptr;
  uint64_t v11 = getSKCloudServiceSetupOptionsITunesItemIdentifierKeySymbolLoc_ptr;
  if (!getSKCloudServiceSetupOptionsITunesItemIdentifierKeySymbolLoc_ptr)
  {
    v3 = StoreKitLibrary();
    v9[3] = (uint64_t)dlsym(v3, "SKCloudServiceSetupOptionsITunesItemIdentifierKey");
    getSKCloudServiceSetupOptionsITunesItemIdentifierKeySymbolLoc_ptr = v9[3];
    v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    v4 = *v2;
    return (NSString *)v4;
  }
  else
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = [NSString stringWithUTF8String:"SKCloudServiceSetupOptionsKey getSKCloudServiceSetupOptionsITunesItemIdentifierKey(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"StoreKit+PhotosUICore.m", 19, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (NSString)action
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v2 = (void **)getSKCloudServiceSetupOptionsActionKeySymbolLoc_ptr;
  uint64_t v11 = getSKCloudServiceSetupOptionsActionKeySymbolLoc_ptr;
  if (!getSKCloudServiceSetupOptionsActionKeySymbolLoc_ptr)
  {
    v3 = StoreKitLibrary();
    v9[3] = (uint64_t)dlsym(v3, "SKCloudServiceSetupOptionsActionKey");
    getSKCloudServiceSetupOptionsActionKeySymbolLoc_ptr = v9[3];
    v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    v4 = *v2;
    return (NSString *)v4;
  }
  else
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = [NSString stringWithUTF8String:"SKCloudServiceSetupOptionsKey getSKCloudServiceSetupOptionsActionKey(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"StoreKit+PhotosUICore.m", 18, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

@end