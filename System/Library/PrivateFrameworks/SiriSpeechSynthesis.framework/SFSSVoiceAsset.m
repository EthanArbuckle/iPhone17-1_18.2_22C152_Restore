@interface SFSSVoiceAsset
+ (id)generateVoiceAssetFromVoiceKeyString:(id)a3;
- (NSString)assetPath;
- (NSString)language;
- (NSString)name;
- (SFSSVoiceAsset)initWithPath:(id)a3;
- (id)init:(id)a3 gender:(int64_t)a4 name:(id)a5 type:(int64_t)a6 footprint:(int64_t)a7 contentVersion:(int64_t)a8;
- (id)key;
- (int64_t)contentVersion;
- (int64_t)footprint;
- (int64_t)gender;
- (int64_t)type;
- (void)setAssetPath:(id)a3;
@end

@implementation SFSSVoiceAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_assetPath, 0);
}

- (int64_t)contentVersion
{
  return self->_contentVersion;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)footprint
{
  return self->_footprint;
}

- (int64_t)gender
{
  return self->_gender;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)name
{
  return self->_name;
}

- (void)setAssetPath:(id)a3
{
}

- (NSString)assetPath
{
  return self->_assetPath;
}

- (id)key
{
  v3 = NSString;
  language = self->_language;
  v5 = +[SFSpeechSynthesisUtils genderStringFromGender:self->_gender];
  name = self->_name;
  v7 = +[SFSpeechSynthesisUtils typeStringFromType:self->_type];
  v8 = +[SFSpeechSynthesisUtils footprintStringFromFootprint:self->_footprint];
  v9 = [NSNumber numberWithInteger:self->_contentVersion];
  v10 = [v9 stringValue];
  v11 = [v3 stringWithFormat:@"%@:%@:%@:%@:%@:%@", language, v5, name, v7, v8, v10];

  return v11;
}

- (id)init:(id)a3 gender:(int64_t)a4 name:(id)a5 type:(int64_t)a6 footprint:(int64_t)a7 contentVersion:(int64_t)a8
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SFSSVoiceAsset;
  v16 = [(SFSSVoiceAsset *)&v22 init];
  if (v16)
  {
    uint64_t v17 = [v14 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    language = v16->_language;
    v16->_language = (NSString *)v17;

    v16->_gender = a4;
    objc_storeStrong((id *)&v16->_name, a5);
    v16->_footprint = a7;
    v16->_type = a6;
    v16->_contentVersion = a8;
  }
  v19 = SFSSGetLogObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = [(SFSSVoiceAsset *)v16 key];
    *(_DWORD *)buf = 138412290;
    v24 = v20;
    _os_log_impl(&dword_22B575000, v19, OS_LOG_TYPE_INFO, "Init VoiceAsset with key=%@", buf, 0xCu);
  }
  return v16;
}

- (SFSSVoiceAsset)initWithPath:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFSSVoiceAsset;
  v6 = [(SFSSVoiceAsset *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetPath, a3);
    v8 = SFSSGetLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      assetPath = v7->_assetPath;
      *(_DWORD *)buf = 138412290;
      v13 = assetPath;
      _os_log_impl(&dword_22B575000, v8, OS_LOG_TYPE_INFO, "Init VoiceAsset with assetPath=%@", buf, 0xCu);
    }
  }
  return v7;
}

+ (id)generateVoiceAssetFromVoiceKeyString:(id)a3
{
  v3 = [a3 componentsSeparatedByString:@":"];
  v4 = [v3 objectAtIndex:0];
  id v5 = [v3 objectAtIndex:1];
  int64_t v6 = +[SFSpeechSynthesisUtils genderFromString:v5];

  v7 = [v3 objectAtIndex:2];
  v8 = [v3 objectAtIndex:3];
  int64_t v9 = +[SFSpeechSynthesisUtils typeFromString:v8];

  v10 = [v3 objectAtIndex:4];
  int64_t v11 = +[SFSpeechSynthesisUtils footprintFromString:v10];

  v12 = [v3 objectAtIndex:5];
  uint64_t v13 = [v12 integerValue];

  id v14 = [[SFSSVoiceAsset alloc] init:v4 gender:v6 name:v7 type:v9 footprint:v11 contentVersion:v13];
  return v14;
}

@end