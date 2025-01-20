@interface _LTDTTSAssetModel
+ (id)modelFromAsset:(id)a3;
- (BOOL)canBePurged;
- (BOOL)isAvailable;
- (BOOL)isDownloading;
- (BOOL)isInstalled;
- (BOOL)isPremiumTextLID;
- (NSArray)supportedLanguages;
- (NSString)assetBuild;
- (NSString)assetLanguage;
- (NSString)assetName;
- (NSString)assetTypeName;
- (NSString)coreAssetName;
- (NSString)managedAssetType;
- (NSURL)getLocalFileUrl;
- (TTSAsset)ttsAsset;
- (_LTAssetProgress)progress;
- (_LTDTTSAssetModel)initWithAssetIdentifier:(id)a3;
- (int64_t)assetVersion;
- (int64_t)contentVersion;
- (int64_t)downloadSize;
- (int64_t)formatVersion;
- (int64_t)requiredCapabilityIdentifier;
- (int64_t)unarchivedSize;
- (unint64_t)assetType;
- (unint64_t)state;
@end

@implementation _LTDTTSAssetModel

- (_LTDTTSAssetModel)initWithAssetIdentifier:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_LTDTTSAssetModel;
  v6 = [(_LTDTTSAssetModel *)&v31 init];
  if (v6)
  {
    if ([v5 hasPrefix:@"TTS-"])
    {
      objc_storeStrong((id *)&v6->_assetName, a3);
      v7 = [v5 substringFromIndex:objc_msgSend(@"TTS-", "length")];
      v8 = [v7 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

      objc_storeStrong((id *)&v6->_ltIdentifier, v8);
      v9 = _LTLocaleIdentifierMappedForTTS();
      uint64_t v10 = [v8 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
      language = v6->_language;
      v6->_language = (NSString *)v10;

      v12 = _LTOSLogAssets();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        ltIdentifier = v6->_ltIdentifier;
        v30 = v6->_language;
        *(_DWORD *)buf = 138412802;
        v33 = v9;
        __int16 v34 = 2112;
        v35 = ltIdentifier;
        __int16 v36 = 2112;
        v37 = v30;
        _os_log_debug_impl(&dword_2600DC000, v12, OS_LOG_TYPE_DEBUG, "Initializing LTDTTSAssetModel with: ttsIdentifier %@ | _ltIdentifier %@ | _language %@", buf, 0x20u);
      }
      uint64_t v13 = +[_LTDTTSAssetService ttsAssetForLocaleIdentifier:v9];
      ttsAsset = v6->_ttsAsset;
      v6->_ttsAsset = (TTSAsset *)v13;

      v15 = v6->_ttsAsset;
      if (!v15)
      {
        v27 = _LTOSLogAssets();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          [(_LTDTTSAssetModel *)(uint64_t)v5 initWithAssetIdentifier:v27];
        }
        v26 = 0;
        goto LABEL_21;
      }
      v16 = (void *)MEMORY[0x263F1C0A0];
      assetName = v6->_assetName;
      v18 = [(TTSAsset *)v15 diskSize];
      uint64_t v19 = [v18 integerValue];

      if (v19 <= 100) {
        uint64_t v20 = 100;
      }
      else {
        uint64_t v20 = v19;
      }
      uint64_t v21 = [v16 discreteProgressWithIdentifier:assetName totalUnitCount:v20];
      progress = v6->_progress;
      v6->_progress = (_LTAssetProgress *)v21;

      uint64_t v23 = [(_LTDTTSAssetModel *)v6 state];
      if (v23 == 1)
      {
        uint64_t v24 = 2;
      }
      else
      {
        if (v23 != 2)
        {
LABEL_20:
          v26 = v6;
LABEL_21:

          goto LABEL_22;
        }
        uint64_t v24 = 1;
      }
      [(_LTAssetProgress *)v6->_progress setOfflineState:v24];
      goto LABEL_20;
    }
    v25 = _LTOSLogAssets();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[_LTDTTSAssetModel initWithAssetIdentifier:]((uint64_t)v5, v25);
    }
  }
  v26 = 0;
LABEL_22:

  return v26;
}

+ (id)modelFromAsset:(id)a3
{
  id v3 = a3;
  v4 = [v3 provider];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [v3 provider];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)assetLanguage
{
  return self->_ltIdentifier;
}

- (NSString)assetName
{
  return self->_assetName;
}

- (NSString)coreAssetName
{
  return self->_assetName;
}

- (NSString)assetTypeName
{
  return (NSString *)@"TTS";
}

- (unint64_t)assetType
{
  return 8;
}

- (int64_t)assetVersion
{
  return [(TTSAsset *)self->_ttsAsset versionNumber];
}

- (NSString)assetBuild
{
  return 0;
}

- (int64_t)contentVersion
{
  return 0;
}

- (int64_t)downloadSize
{
  return [(_LTAssetProgress *)self->_progress totalUnitCount];
}

- (int64_t)formatVersion
{
  return 0;
}

- (NSURL)getLocalFileUrl
{
  return 0;
}

- (BOOL)isPremiumTextLID
{
  return 0;
}

- (NSString)managedAssetType
{
  return (NSString *)@"com.apple.MobileAsset.Trial.Siri.SiriTextToSpeech";
}

- (int64_t)requiredCapabilityIdentifier
{
  return 0;
}

- (unint64_t)state
{
  if ([(TTSAsset *)self->_ttsAsset locallyAvailable]) {
    return 1;
  }
  if ([(TTSAsset *)self->_ttsAsset downloading]) {
    return 2;
  }
  return 3;
}

- (NSArray)supportedLanguages
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self->_language;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (int64_t)unarchivedSize
{
  return [(_LTAssetProgress *)self->_progress totalUnitCount];
}

- (BOOL)canBePurged
{
  v2 = [(_LTDTTSAssetModel *)self ttsAsset];
  char v3 = [v2 purgeable];

  return v3;
}

- (BOOL)isAvailable
{
  return [(_LTDTTSAssetModel *)self state] == 3;
}

- (BOOL)isDownloading
{
  return [(_LTDTTSAssetModel *)self state] == 2;
}

- (BOOL)isInstalled
{
  return [(_LTDTTSAssetModel *)self state] == 1;
}

- (_LTAssetProgress)progress
{
  return self->_progress;
}

- (TTSAsset)ttsAsset
{
  return self->_ttsAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttsAsset, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_ltIdentifier, 0);
  objc_storeStrong((id *)&self->_assetName, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

- (void)initWithAssetIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Failed  initialize a LTDTTSAssetModel for %{public}@ via LT identifier: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)initWithAssetIdentifier:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2600DC000, a2, OS_LOG_TYPE_ERROR, "Cannot initialize a LTDTTSAssetModel using a non-TTS identifier: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end