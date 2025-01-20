@interface PXSKCloudServiceSetupAction
+ (NSString)subscribe;
@end

@implementation PXSKCloudServiceSetupAction

+ (NSString)subscribe
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v2 = (void **)getSKCloudServiceSetupActionSubscribeSymbolLoc_ptr;
  uint64_t v11 = getSKCloudServiceSetupActionSubscribeSymbolLoc_ptr;
  if (!getSKCloudServiceSetupActionSubscribeSymbolLoc_ptr)
  {
    v3 = StoreKitLibrary();
    v9[3] = (uint64_t)dlsym(v3, "SKCloudServiceSetupActionSubscribe");
    getSKCloudServiceSetupActionSubscribeSymbolLoc_ptr = v9[3];
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
    v7 = [NSString stringWithUTF8String:"SKCloudServiceSetupAction getSKCloudServiceSetupActionSubscribe(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"StoreKit+PhotosUICore.m", 24, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

@end