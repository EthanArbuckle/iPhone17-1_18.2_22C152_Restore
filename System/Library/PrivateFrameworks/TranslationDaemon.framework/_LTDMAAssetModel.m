@interface _LTDMAAssetModel
+ (id)modelFromAsset:(id)a3;
+ (id)splitANECapabilityFromIdentifier:(id)a3;
- (BOOL)_localFileExists;
- (BOOL)canBePurged;
- (BOOL)isAvailable;
- (BOOL)isDownloading;
- (BOOL)isInstalled;
- (BOOL)isPremiumTextLID;
- (BOOL)refreshState;
- (MAAsset)maAsset;
- (NSArray)supportedLanguages;
- (NSString)assetBuild;
- (NSString)assetId;
- (NSString)assetLanguage;
- (NSString)assetName;
- (NSString)assetTypeName;
- (NSString)coreAssetName;
- (NSString)debugDescription;
- (NSString)identifier;
- (NSString)managedAssetType;
- (NSURL)getLocalFileUrl;
- (_LTAssetProgress)progress;
- (_LTDMAAssetModel)initWithMAAsset:(id)a3;
- (id)_attributes;
- (int64_t)assetVersion;
- (int64_t)contentVersion;
- (int64_t)downloadSize;
- (int64_t)formatVersion;
- (int64_t)requiredCapabilityIdentifier;
- (int64_t)unarchivedSize;
- (unint64_t)assetType;
- (unint64_t)state;
- (void)assetType;
- (void)coreAssetName;
- (void)identifier;
- (void)setMaAsset:(id)a3;
@end

@implementation _LTDMAAssetModel

- (_LTDMAAssetModel)initWithMAAsset:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LTDMAAssetModel;
  v6 = [(_LTDMAAssetModel *)&v15 init];
  v7 = v6;
  if (!v6)
  {
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v6->_maAsset, a3);
  if (!v7->_maAsset)
  {
    v13 = _LTOSLogAssets();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_LTDMAAssetModel initWithMAAsset:](v13);
    }
    goto LABEL_8;
  }
  v8 = (void *)MEMORY[0x263F1C0A0];
  v9 = [(_LTDMAAssetModel *)v7 identifier];
  uint64_t v10 = objc_msgSend(v8, "discreteProgressWithIdentifier:totalUnitCount:", v9, -[_LTDMAAssetModel downloadSize](v7, "downloadSize"));
  progress = v7->_progress;
  v7->_progress = (_LTAssetProgress *)v10;

  if ([(_LTDMAAssetModel *)v7 isInstalled]) {
    [(_LTAssetProgress *)v7->_progress setOfflineState:2];
  }
  v12 = v7;
LABEL_9:

  return v12;
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

- (id)_attributes
{
  return (id)[(MAAsset *)self->_maAsset attributes];
}

- (NSString)identifier
{
  p_identifier = &self->_identifier;
  identifier = self->_identifier;
  if (!identifier)
  {
    id v5 = [(_LTDMAAssetModel *)self assetName];
    if ([v5 length])
    {
      objc_storeStrong((id *)p_identifier, v5);
LABEL_15:

      identifier = *p_identifier;
      goto LABEL_16;
    }
    unint64_t v6 = [(_LTDMAAssetModel *)self assetType];
    switch(v6)
    {
      case 5uLL:
        uint64_t v10 = *p_identifier;
        v11 = @"LanguageDetectorAssets-en-US";
        break;
      case 4uLL:
        uint64_t v10 = *p_identifier;
        v11 = @"SpeechEndpoint-en-US";
        break;
      case 2uLL:
        v7 = [(_LTDMAAssetModel *)self assetLanguage];
        v8 = [@"ASR-" stringByAppendingString:v7];
        v9 = self->_identifier;
        self->_identifier = v8;

        goto LABEL_15;
      default:
        v12 = _LTOSLogAssets();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          [(_LTDMAAssetModel *)(uint64_t)self identifier];
        }
        v19 = [(_LTDMAAssetModel *)self assetId];
        uint64_t v10 = self->_identifier;
        self->_identifier = v19;
LABEL_14:

        goto LABEL_15;
    }
    *p_identifier = &v11->isa;
    goto LABEL_14;
  }
LABEL_16:
  return identifier;
}

- (NSString)assetId
{
  return (NSString *)[(MAAsset *)self->_maAsset assetId];
}

- (NSString)assetName
{
  id v3 = [(MAAsset *)self->_maAsset attributes];
  v4 = [v3 objectForKeyedSubscript:@"AssetName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(MAAsset *)self->_maAsset attributes];
    unint64_t v6 = [v5 objectForKeyedSubscript:@"AssetName"];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return (NSString *)v6;
}

- (NSString)coreAssetName
{
  id v3 = [(_LTDMAAssetModel *)self assetName];
  if ([(_LTDMAAssetModel *)self assetType] == 6
    && ([v3 containsString:@"-partial"] & 1) != 0)
  {
    v4 = [v3 componentsSeparatedByString:@"-"];
    id v5 = (void *)[v4 mutableCopy];

    if ((unint64_t)[v5 count] >= 4
      && (objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v5, "count") - 3),
          unint64_t v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v6 isEqualToString:@"partial"],
          v6,
          v7))
    {
      objc_msgSend(v5, "removeObjectAtIndex:", objc_msgSend(v5, "count") - 2);
      objc_msgSend(v5, "removeObjectAtIndex:", objc_msgSend(v5, "count") - 2);
      id v8 = [v5 componentsJoinedByString:@"-"];
    }
    else
    {
      uint64_t v10 = _LTOSLogAssets();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        [(_LTDMAAssetModel *)(uint64_t)self coreAssetName];
      }
      id v8 = v3;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = v3;
  }

  return (NSString *)v9;
}

- (NSString)assetTypeName
{
  id v3 = [(MAAsset *)self->_maAsset attributes];
  v4 = [v3 objectForKeyedSubscript:@"Type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(MAAsset *)self->_maAsset attributes];
    unint64_t v6 = [v5 objectForKeyedSubscript:@"Type"];
  }
  else
  {
    unint64_t v6 = objc_opt_new();
  }

  return (NSString *)v6;
}

- (unint64_t)assetType
{
  unint64_t v2 = (unint64_t)self;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [(_LTDMAAssetModel *)self assetTypeName];
  if ([v3 length])
  {
    int v4 = [v3 characterAtIndex:0];
    if (v4 > 76)
    {
      switch(v4)
      {
        case 'M':
          BOOL v5 = [v3 hasPrefix:@"MT"] == 0;
          uint64_t v6 = 6;
          break;
        case 'P':
          BOOL v5 = [v3 hasPrefix:@"PB"] == 0;
          uint64_t v6 = 7;
          break;
        case 'e':
          BOOL v5 = [v3 hasPrefix:@"endpointer"] == 0;
          uint64_t v6 = 4;
          break;
        default:
LABEL_27:
          uint64_t v17 = _LTOSLogAssets();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            int v22 = 138543362;
            v23 = v3;
            _os_log_impl(&dword_2600DC000, v17, OS_LOG_TYPE_INFO, "No matching MA asset model type for %{public}@", (uint8_t *)&v22, 0xCu);
          }
          uint64_t v18 = [(id)v2 _attributes];
          v19 = [v18 objectForKeyedSubscript:@"__Empty"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v20 = [(id)v2 _attributes];
            v21 = [v20 objectForKeyedSubscript:@"__Empty"];
            LODWORD(v2) = [v21 isEqualToString:@"Empty"];
          }
          else
          {
            LODWORD(v2) = [0 isEqualToString:@"Empty"];
          }

          unint64_t v2 = v2;
          goto LABEL_26;
      }
    }
    else
    {
      switch(v4)
      {
        case 'A':
          BOOL v5 = [v3 hasPrefix:@"ASR"] == 0;
          uint64_t v6 = 2;
          break;
        case 'C':
          BOOL v5 = [v3 hasPrefix:@"Config"] == 0;
          uint64_t v6 = 3;
          break;
        case 'L':
          BOOL v5 = [v3 hasPrefix:@"LID"] == 0;
          uint64_t v6 = 5;
          break;
        default:
          goto LABEL_27;
      }
    }
    if (v5) {
      unint64_t v2 = 0;
    }
    else {
      unint64_t v2 = v6;
    }
    goto LABEL_26;
  }
  int v7 = [(id)v2 maAsset];
  id v8 = [v7 assetType];

  if ([v8 hasPrefix:@"com.apple.MobileAsset.SpeechEndpointAssets"])
  {
    unint64_t v2 = 4;
  }
  else if ([v8 hasPrefix:@"com.apple.MobileAsset.LanguageDetectorAssets"])
  {
    unint64_t v2 = 5;
  }
  else
  {
    id v9 = _LTOSLogAssets();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(_LTDMAAssetModel *)v2 assetType];
    }
    unint64_t v2 = 0;
  }

LABEL_26:
  return v2;
}

- (NSString)managedAssetType
{
  id v3 = [(MAAsset *)self->_maAsset attributes];
  int v4 = [v3 objectForKeyedSubscript:@"AssetType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(MAAsset *)self->_maAsset attributes];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"AssetType"];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }

  return (NSString *)v6;
}

- (int64_t)assetVersion
{
  id v3 = [(MAAsset *)self->_maAsset attributes];
  int v4 = [v3 objectForKeyedSubscript:@"AssetVersion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(MAAsset *)self->_maAsset attributes];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"AssetVersion"];
    int64_t v7 = [v6 integerValue];
  }
  else
  {
    int64_t v7 = [0 integerValue];
  }

  return v7;
}

- (NSString)assetBuild
{
  id v3 = [(MAAsset *)self->_maAsset attributes];
  int v4 = [v3 objectForKeyedSubscript:@"Build"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(MAAsset *)self->_maAsset attributes];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"Build"];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSString *)v6;
}

- (int64_t)formatVersion
{
  id v3 = [(MAAsset *)self->_maAsset attributes];
  int v4 = [v3 objectForKeyedSubscript:@"FormatVersion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(MAAsset *)self->_maAsset attributes];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"FormatVersion"];
    int64_t v7 = [v6 integerValue];
  }
  else
  {
    int64_t v7 = [0 integerValue];
  }

  return v7;
}

- (int64_t)contentVersion
{
  id v3 = [(MAAsset *)self->_maAsset attributes];
  uint64_t v4 = *MEMORY[0x263F55880];
  BOOL v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F55880]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(MAAsset *)self->_maAsset attributes];
    int64_t v7 = [v6 objectForKeyedSubscript:v4];
    int64_t v8 = [v7 integerValue];
  }
  else
  {
    int64_t v8 = [0 integerValue];
  }

  return v8;
}

- (NSURL)getLocalFileUrl
{
  return (NSURL *)[(MAAsset *)self->_maAsset getLocalFileUrl];
}

- (int64_t)downloadSize
{
  id v3 = [(MAAsset *)self->_maAsset attributes];
  uint64_t v4 = *MEMORY[0x263F55888];
  BOOL v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F55888]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(MAAsset *)self->_maAsset attributes];
    int64_t v7 = [v6 objectForKeyedSubscript:v4];
    int64_t v8 = [v7 integerValue];
  }
  else
  {
    int64_t v8 = [0 integerValue];
  }

  return v8;
}

- (int64_t)unarchivedSize
{
  id v3 = [(MAAsset *)self->_maAsset attributes];
  uint64_t v4 = *MEMORY[0x263F558A0];
  BOOL v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F558A0]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(MAAsset *)self->_maAsset attributes];
    int64_t v7 = [v6 objectForKeyedSubscript:v4];
    int64_t v8 = [v7 integerValue];
  }
  else
  {
    int64_t v8 = [0 integerValue];
  }

  return v8;
}

- (BOOL)isPremiumTextLID
{
  id v3 = [(MAAsset *)self->_maAsset attributes];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"Footprint"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(MAAsset *)self->_maAsset attributes];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"Footprint"];
    char v7 = [v6 isEqualToString:@"Premium"];
  }
  else
  {
    char v7 = [0 isEqualToString:@"Premium"];
  }

  return v7;
}

+ (id)splitANECapabilityFromIdentifier:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 componentsSeparatedByString:@"-"];
  BOOL v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [v5 lastObject];
  if (([v6 isEqualToString:@"0"] & 1) != 0 || objc_msgSend(v6, "integerValue") >= 1)
  {
    [v5 removeLastObject];
    char v7 = [v5 componentsJoinedByString:@"-"];
    v11[0] = v7;
    v11[1] = v6;
    int64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  }
  else
  {
    v10[0] = v3;
    v10[1] = @"0";
    int64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  }

  return v8;
}

- (int64_t)requiredCapabilityIdentifier
{
  if ([(_LTDMAAssetModel *)self assetType] != 6) {
    return 0;
  }
  id v3 = objc_opt_class();
  uint64_t v4 = [(_LTDMAAssetModel *)self assetName];
  BOOL v5 = [v3 splitANECapabilityFromIdentifier:v4];
  uint64_t v6 = [v5 lastObject];
  int64_t v7 = [v6 integerValue];

  return v7;
}

- (NSString)assetLanguage
{
  id v3 = [(MAAsset *)self->_maAsset attributes];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"Language"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(MAAsset *)self->_maAsset attributes];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"Language"];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSString *)v6;
}

- (NSArray)supportedLanguages
{
  unint64_t v2 = [(MAAsset *)self->_maAsset attributes];
  id v3 = [v2 objectForKeyedSubscript:@"Languages"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (objc_msgSend(v3, "lt_ensureElementType:", objc_opt_class())) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {

    id v3 = 0;
    uint64_t v4 = 0;
  }
  BOOL v5 = v4;

  return v5;
}

- (unint64_t)state
{
  if (![(MAAsset *)self->_maAsset state]) {
    [(MAAsset *)self->_maAsset refreshState];
  }
  [(MAAsset *)self->_maAsset state];
  id v3 = [(_LTDMAAssetModel *)self progress];
  unint64_t v4 = [v3 offlineState];

  if (v4 >= 4) {
    return 2;
  }
  else {
    return 3 - v4;
  }
}

- (BOOL)refreshState
{
  return [(MAAsset *)self->_maAsset refreshState];
}

- (BOOL)isAvailable
{
  return [(_LTDMAAssetModel *)self state] == 3 || [(_LTDMAAssetModel *)self state] == 0;
}

- (BOOL)isDownloading
{
  return [(_LTDMAAssetModel *)self state] == 2;
}

- (BOOL)canBePurged
{
  return [(_LTDMAAssetModel *)self state] != 4;
}

- (BOOL)_localFileExists
{
  unint64_t v2 = [(_LTDMAAssetModel *)self getLocalFileUrl];
  id v3 = [v2 path];

  unint64_t v4 = [MEMORY[0x263F08850] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  return v5;
}

- (BOOL)isInstalled
{
  unint64_t v3 = [(_LTDMAAssetModel *)self state];
  if (v3 - 4 >= 3)
  {
    if (v3)
    {
      if (v3 == 1) {
        goto LABEL_4;
      }
      return 0;
    }
    else
    {
      char v5 = [(_LTDMAAssetModel *)self progress];
      if ([v5 isFinished]) {
        BOOL v6 = [(_LTDMAAssetModel *)self _localFileExists];
      }
      else {
        BOOL v6 = 0;
      }
    }
    return v6;
  }
LABEL_4:
  return [(_LTDMAAssetModel *)self _localFileExists];
}

- (NSString)debugDescription
{
  unint64_t v2 = [(MAAsset *)self->_maAsset attributes];
  unint64_t v3 = [v2 debugDescription];

  return (NSString *)v3;
}

- (_LTAssetProgress)progress
{
  return self->_progress;
}

- (MAAsset)maAsset
{
  return self->_maAsset;
}

- (void)setMaAsset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_maAsset, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithMAAsset:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Failed to initialize an LTDMAAssetModel with a nil MAAsset", v1, 2u);
}

- (void)identifier
{
}

- (void)coreAssetName
{
}

- (void)assetType
{
}

@end