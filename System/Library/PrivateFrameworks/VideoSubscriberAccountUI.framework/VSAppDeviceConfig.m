@interface VSAppDeviceConfig
- (BOOL)isTimeZoneSet;
- (CGSize)screenSize;
- (NSOperationQueue)privateQueue;
- (VSAppDeviceConfig)init;
- (id)storeFrontCountryCode;
- (id)systemLanguage;
- (id)timeZone;
- (unint64_t)preferredVideoFormat;
- (unint64_t)preferredVideoPreviewFormat;
- (void)setPrivateQueue:(id)a3;
@end

@implementation VSAppDeviceConfig

- (VSAppDeviceConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSAppDeviceConfig;
  v2 = [(VSAppDeviceConfig *)&v6 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v3;

    [(NSOperationQueue *)v2->_privateQueue setName:@"VSAppDeviceConfig"];
  }
  return v2;
}

- (unint64_t)preferredVideoFormat
{
  return 0;
}

- (unint64_t)preferredVideoPreviewFormat
{
  return 0;
}

- (CGSize)screenSize
{
  v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)isTimeZoneSet
{
  return objc_msgSend(MEMORY[0x263EFFA18], "vs_isTimeZoneSet");
}

- (id)systemLanguage
{
  return (id)[MEMORY[0x263EFF960] _deviceLanguage];
}

- (id)storeFrontCountryCode
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  id v2 = objc_alloc_init(MEMORY[0x263F1E2A0]);
  [v2 start];
  [v2 waitUntilFinished];
  double v3 = [v2 result];
  double v4 = [v3 forceUnwrapObject];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__VSAppDeviceConfig_storeFrontCountryCode__block_invoke;
  v7[3] = &unk_2650771C8;
  v7[4] = &v8;
  [v4 unwrapObject:v7 error:&__block_literal_global_5];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __42__VSAppDeviceConfig_storeFrontCountryCode__block_invoke(uint64_t a1, void *a2)
{
}

void __42__VSAppDeviceConfig_storeFrontCountryCode__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __42__VSAppDeviceConfig_storeFrontCountryCode__block_invoke_2_cold_1((uint64_t)v2, v3);
  }
}

- (id)timeZone
{
  id v2 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  double v3 = [v2 objectForKey:*MEMORY[0x263EFF4B8]];
  double v4 = [v3 timeZone];

  return v4;
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

void __42__VSAppDeviceConfig_storeFrontCountryCode__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F9AB000, a2, OS_LOG_TYPE_ERROR, "Error fetching bag store country code: %@", (uint8_t *)&v2, 0xCu);
}

@end