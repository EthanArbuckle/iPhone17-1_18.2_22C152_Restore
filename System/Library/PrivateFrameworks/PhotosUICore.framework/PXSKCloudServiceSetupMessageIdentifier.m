@interface PXSKCloudServiceSetupMessageIdentifier
+ (NSString)addMusic;
+ (NSString)connect;
+ (NSString)join;
+ (NSString)playMusic;
@end

@implementation PXSKCloudServiceSetupMessageIdentifier

+ (NSString)playMusic
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v2 = (void **)getSKCloudServiceSetupMessageIdentifierPlayMusicSymbolLoc_ptr;
  uint64_t v11 = getSKCloudServiceSetupMessageIdentifierPlayMusicSymbolLoc_ptr;
  if (!getSKCloudServiceSetupMessageIdentifierPlayMusicSymbolLoc_ptr)
  {
    v3 = StoreKitLibrary();
    v9[3] = (uint64_t)dlsym(v3, "SKCloudServiceSetupMessageIdentifierPlayMusic");
    getSKCloudServiceSetupMessageIdentifierPlayMusicSymbolLoc_ptr = v9[3];
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
    v7 = [NSString stringWithUTF8String:"SKCloudServiceSetupMessageIdentifier getSKCloudServiceSetupMessageIdentifierPlayMusic(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"StoreKit+PhotosUICore.m", 29, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (NSString)addMusic
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v2 = (void **)getSKCloudServiceSetupMessageIdentifierAddMusicSymbolLoc_ptr;
  uint64_t v11 = getSKCloudServiceSetupMessageIdentifierAddMusicSymbolLoc_ptr;
  if (!getSKCloudServiceSetupMessageIdentifierAddMusicSymbolLoc_ptr)
  {
    v3 = StoreKitLibrary();
    v9[3] = (uint64_t)dlsym(v3, "SKCloudServiceSetupMessageIdentifierAddMusic");
    getSKCloudServiceSetupMessageIdentifierAddMusicSymbolLoc_ptr = v9[3];
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
    v7 = [NSString stringWithUTF8String:"SKCloudServiceSetupMessageIdentifier getSKCloudServiceSetupMessageIdentifierAddMusic(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"StoreKit+PhotosUICore.m", 28, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (NSString)connect
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v2 = (void **)getSKCloudServiceSetupMessageIdentifierConnectSymbolLoc_ptr;
  uint64_t v11 = getSKCloudServiceSetupMessageIdentifierConnectSymbolLoc_ptr;
  if (!getSKCloudServiceSetupMessageIdentifierConnectSymbolLoc_ptr)
  {
    v3 = StoreKitLibrary();
    v9[3] = (uint64_t)dlsym(v3, "SKCloudServiceSetupMessageIdentifierConnect");
    getSKCloudServiceSetupMessageIdentifierConnectSymbolLoc_ptr = v9[3];
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
    v7 = [NSString stringWithUTF8String:"SKCloudServiceSetupMessageIdentifier getSKCloudServiceSetupMessageIdentifierConnect(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"StoreKit+PhotosUICore.m", 27, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (NSString)join
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v2 = (void **)getSKCloudServiceSetupMessageIdentifierJoinSymbolLoc_ptr;
  uint64_t v11 = getSKCloudServiceSetupMessageIdentifierJoinSymbolLoc_ptr;
  if (!getSKCloudServiceSetupMessageIdentifierJoinSymbolLoc_ptr)
  {
    v3 = StoreKitLibrary();
    v9[3] = (uint64_t)dlsym(v3, "SKCloudServiceSetupMessageIdentifierJoin");
    getSKCloudServiceSetupMessageIdentifierJoinSymbolLoc_ptr = v9[3];
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
    v7 = [NSString stringWithUTF8String:"SKCloudServiceSetupMessageIdentifier getSKCloudServiceSetupMessageIdentifierJoin(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"StoreKit+PhotosUICore.m", 26, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

@end