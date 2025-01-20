@interface SEMAppIdMapper
+ (id)_buildKnownIdentifierToUniversalOriginAppIdMap;
+ (id)_getKnownAppIdMap;
+ (id)convertToUniversalAppId:(id)a3;
@end

@implementation SEMAppIdMapper

+ (id)convertToUniversalAppId:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v7 = objc_msgSend__getKnownAppIdMap(SEMAppIdMapper, v4, v5, v6);
  v10 = objc_msgSend_valueForKey_(v7, v8, (uint64_t)v3, v9);

  v11 = v3;
  if (v10)
  {
    v12 = qword_26B3549D8;
    BOOL v13 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO);
    v11 = v10;
    if (v13)
    {
      int v16 = 136315650;
      v17 = "+[SEMAppIdMapper convertToUniversalAppId:]";
      __int16 v18 = 2112;
      id v19 = v3;
      __int16 v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_25C7CA000, v12, OS_LOG_TYPE_INFO, "%s Convert %@ to a universal appId: %@", (uint8_t *)&v16, 0x20u);
      v11 = v10;
    }
  }
  id v14 = v11;

  return v14;
}

+ (id)_getKnownAppIdMap
{
  if (qword_26B354A10 != -1) {
    dispatch_once(&qword_26B354A10, &unk_2709E01B8);
  }
  v2 = (void *)qword_26B354A08;
  return v2;
}

+ (id)_buildKnownIdentifierToUniversalOriginAppIdMap
{
  v8[6] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F737E8];
  v7[0] = @"com.apple.siriVoiceShortcuts";
  v7[1] = @"com.apple.VoiceShortcuts";
  v8[0] = v2;
  v8[1] = v2;
  uint64_t v3 = *MEMORY[0x263F737D8];
  v7[2] = @"com.apple.MobileSMS";
  v7[3] = @"com.apple.iChat";
  v8[2] = v3;
  v8[3] = v3;
  uint64_t v4 = *MEMORY[0x263F737E0];
  v7[4] = @"com.apple.mobileslideshow";
  v7[5] = @"com.apple.Photos";
  v8[4] = v4;
  v8[5] = v4;
  uint64_t v5 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v8, (uint64_t)v7, 6);
  return v5;
}

@end