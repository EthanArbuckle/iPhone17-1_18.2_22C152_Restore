@interface TTS_AXLanguageManagerWrapper
+ (id)dialectForLanguageId:(id)a3;
@end

@implementation TTS_AXLanguageManagerWrapper

+ (id)dialectForLanguageId:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v4 = (void *)getAXLanguageManagerClass_softClass;
  uint64_t v14 = getAXLanguageManagerClass_softClass;
  if (!getAXLanguageManagerClass_softClass)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __getAXLanguageManagerClass_block_invoke;
    v10[3] = &unk_26553BEC0;
    v10[4] = &v11;
    __getAXLanguageManagerClass_block_invoke((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v11, 8);
  v6 = [v5 sharedInstance];
  v7 = [v6 dialectForLanguageID:v3];

  v8 = [[TTS_AXDialectMapWrapper alloc] initWithDialectMap:v7];

  return v8;
}

@end