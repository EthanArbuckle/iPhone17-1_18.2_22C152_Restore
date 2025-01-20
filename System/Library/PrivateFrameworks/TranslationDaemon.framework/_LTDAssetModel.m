@interface _LTDAssetModel
+ (id)descriptionForAssetState:(unint64_t)a3;
+ (id)localeIdentifiersForLanguageName:(id)a3;
- (BOOL)_isCompatibleWithThisDevice;
- (BOOL)canBePurged;
- (BOOL)isANEModel;
- (BOOL)isASRModel;
- (BOOL)isAvailable;
- (BOOL)isConfig;
- (BOOL)isDownloading;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInstalled;
- (BOOL)isMTModel;
- (BOOL)isMultiLocaleAsset;
- (BOOL)isNewerCompatibleVersionThan:(id)a3;
- (BOOL)isNewerVersionThan:(id)a3;
- (BOOL)isPhrasebook;
- (BOOL)isPremiumTextLID;
- (BOOL)isTTSModel;
- (BOOL)refreshState;
- (BOOL)shouldPurgeWithLocale;
- (BOOL)supportsLocale:(id)a3;
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
- (_LTDAssetModel)initWithProvider:(id)a3;
- (_LTDAssetModelProtocol)provider;
- (id)localeIdentifiers;
- (id)stateDescription;
- (id)status;
- (int64_t)assetVersion;
- (int64_t)compareAssetVersionReversed:(id)a3;
- (int64_t)compareDownloadPriority:(id)a3;
- (int64_t)contentVersion;
- (int64_t)downloadSize;
- (int64_t)formatVersion;
- (int64_t)requiredCapabilityIdentifier;
- (int64_t)unarchivedSize;
- (unint64_t)assetType;
- (unint64_t)downloadPriority;
- (unint64_t)state;
- (void)setProvider:(id)a3;
@end

@implementation _LTDAssetModel

- (_LTDAssetModel)initWithProvider:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_LTDAssetModel;
  v6 = [(_LTDAssetModel *)&v11 init];
  v7 = v6;
  if (!v6)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v6->_provider, a3);
  if (!v5)
  {
    v9 = _LTOSLogAssets();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_LTDAssetModel initWithProvider:](v9);
    }
    goto LABEL_6;
  }
  v8 = v7;
LABEL_7:

  return v8;
}

+ (id)descriptionForAssetState:(unint64_t)a3
{
  if (a3 > 6) {
    return @"Undefined";
  }
  else {
    return off_265546228[a3];
  }
}

- (NSString)identifier
{
  return (NSString *)[(_LTDAssetModelProtocol *)self->_provider identifier];
}

- (_LTAssetProgress)progress
{
  return (_LTAssetProgress *)[(_LTDAssetModelProtocol *)self->_provider progress];
}

- (NSString)assetId
{
  return (NSString *)[(_LTDAssetModelProtocol *)self->_provider assetId];
}

- (NSString)assetLanguage
{
  return (NSString *)[(_LTDAssetModelProtocol *)self->_provider assetLanguage];
}

- (NSString)assetName
{
  return (NSString *)[(_LTDAssetModelProtocol *)self->_provider assetName];
}

- (NSString)coreAssetName
{
  return (NSString *)[(_LTDAssetModelProtocol *)self->_provider coreAssetName];
}

- (NSString)assetTypeName
{
  return (NSString *)[(_LTDAssetModelProtocol *)self->_provider assetTypeName];
}

- (int64_t)assetVersion
{
  return [(_LTDAssetModelProtocol *)self->_provider assetVersion];
}

- (NSString)assetBuild
{
  return (NSString *)[(_LTDAssetModelProtocol *)self->_provider assetBuild];
}

- (int64_t)contentVersion
{
  return [(_LTDAssetModelProtocol *)self->_provider contentVersion];
}

- (int64_t)downloadSize
{
  return [(_LTDAssetModelProtocol *)self->_provider downloadSize];
}

- (int64_t)formatVersion
{
  return [(_LTDAssetModelProtocol *)self->_provider formatVersion];
}

- (NSURL)getLocalFileUrl
{
  return (NSURL *)[(_LTDAssetModelProtocol *)self->_provider getLocalFileUrl];
}

- (BOOL)isPremiumTextLID
{
  return [(_LTDAssetModelProtocol *)self->_provider isPremiumTextLID];
}

- (NSString)managedAssetType
{
  return (NSString *)[(_LTDAssetModelProtocol *)self->_provider managedAssetType];
}

- (int64_t)requiredCapabilityIdentifier
{
  return [(_LTDAssetModelProtocol *)self->_provider requiredCapabilityIdentifier];
}

- (unint64_t)state
{
  return [(_LTDAssetModelProtocol *)self->_provider state];
}

- (NSArray)supportedLanguages
{
  return (NSArray *)[(_LTDAssetModelProtocol *)self->_provider supportedLanguages];
}

- (int64_t)unarchivedSize
{
  return [(_LTDAssetModelProtocol *)self->_provider unarchivedSize];
}

- (unint64_t)assetType
{
  return [(_LTDAssetModelProtocol *)self->_provider assetType];
}

- (BOOL)shouldPurgeWithLocale
{
  unint64_t v3 = [(_LTDAssetModel *)self assetType];
  if (v3 > 8 || ((1 << v3) & 0x1C4) == 0) {
    return 0;
  }
  return [(_LTDAssetModel *)self canBePurged];
}

- (BOOL)isMultiLocaleAsset
{
  return [(_LTDAssetModel *)self assetType] == 6;
}

- (BOOL)isANEModel
{
  return [(_LTDAssetModel *)self requiredCapabilityIdentifier] != 0;
}

- (BOOL)isASRModel
{
  return [(_LTDAssetModel *)self assetType] == 2;
}

- (BOOL)isConfig
{
  return [(_LTDAssetModel *)self assetType] == 3;
}

- (BOOL)isEmpty
{
  return [(_LTDAssetModel *)self assetType] == 1;
}

- (BOOL)isMTModel
{
  return [(_LTDAssetModel *)self assetType] == 6;
}

- (BOOL)isPhrasebook
{
  return [(_LTDAssetModel *)self assetType] == 7;
}

- (BOOL)isTTSModel
{
  return [(_LTDAssetModel *)self assetType] == 8;
}

- (id)stateDescription
{
  unint64_t v3 = objc_opt_class();
  uint64_t v4 = [(_LTDAssetModelProtocol *)self->_provider state];
  return (id)[v3 descriptionForAssetState:v4];
}

- (id)status
{
  id v3 = objc_alloc(MEMORY[0x263F1C0D8]);
  uint64_t v4 = [(_LTDAssetModel *)self identifier];
  id v5 = [(_LTDAssetModel *)self progress];
  v6 = (void *)[v3 initWithLocaleIdentifier:v4 progress:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_LTDAssetModel *)a3;
  if (self == v4)
  {
    BOOL v20 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(_LTDAssetModelProtocol *)self->_provider identifier];
      v7 = [(_LTDAssetModel *)v5 identifier];
      int v8 = [v6 isEqualToString:v7];

      if (!v8) {
        goto LABEL_13;
      }
      v9 = [(_LTDAssetModelProtocol *)self->_provider managedAssetType];
      v10 = [(_LTDAssetModel *)v5 managedAssetType];
      int v11 = [v9 isEqualToString:v10];

      if (!v11) {
        goto LABEL_13;
      }
      uint64_t v12 = [(_LTDAssetModelProtocol *)self->_provider assetType];
      if (v12 != [(_LTDAssetModel *)v5 assetType]) {
        goto LABEL_13;
      }
      v13 = [(_LTDAssetModelProtocol *)self->_provider assetName];
      v14 = [(_LTDAssetModel *)v5 assetName];
      int v15 = [v13 isEqualToString:v14];

      if (!v15) {
        goto LABEL_13;
      }
      if ([(_LTDAssetModel *)self assetType] != 2 && [(_LTDAssetModel *)self assetType] != 5
        || ([(_LTDAssetModelProtocol *)self->_provider assetLanguage],
            v16 = objc_claimAutoreleasedReturnValue(),
            [(_LTDAssetModel *)v5 assetLanguage],
            v17 = objc_claimAutoreleasedReturnValue(),
            int v18 = [v16 isEqualToString:v17],
            v17,
            v16,
            v18))
      {
        uint64_t v19 = [(_LTDAssetModelProtocol *)self->_provider requiredCapabilityIdentifier];
        BOOL v20 = v19 == [(_LTDAssetModel *)v5 requiredCapabilityIdentifier];
      }
      else
      {
LABEL_13:
        BOOL v20 = 0;
      }
    }
    else
    {
      BOOL v20 = 0;
    }
  }

  return v20;
}

- (BOOL)refreshState
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  provider = self->_provider;
  return [(_LTDAssetModelProtocol *)provider refreshState];
}

- (BOOL)isAvailable
{
  return [(_LTDAssetModelProtocol *)self->_provider isAvailable];
}

- (BOOL)isDownloading
{
  return [(_LTDAssetModelProtocol *)self->_provider isDownloading];
}

- (BOOL)isInstalled
{
  return [(_LTDAssetModelProtocol *)self->_provider isInstalled];
}

- (BOOL)canBePurged
{
  return [(_LTDAssetModelProtocol *)self->_provider canBePurged];
}

- (BOOL)supportsLocale:(id)a3
{
  id v4 = a3;
  if (([(_LTDAssetModel *)self assetType] & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    id v5 = [(_LTDAssetModel *)self supportedLanguages];
    v6 = [v4 _ltCsLocaleIdentifier];

    char v7 = [v5 containsObject:v6];
  }
  else
  {
    id v5 = [(_LTDAssetModel *)self assetLanguage];
    v6 = [v4 _ltLocaleIdentifier];

    char v7 = [v5 isEqualToString:v6];
  }
  BOOL v8 = v7;

  return v8;
}

- (int64_t)compareAssetVersionReversed:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(_LTDAssetModel *)self assetVersion];
  if (v5 == [v4 assetVersion])
  {
    int64_t v6 = [(_LTDAssetModel *)self requiredCapabilityIdentifier];
    if (v6 == [v4 requiredCapabilityIdentifier])
    {
      int64_t v7 = 0;
      goto LABEL_9;
    }
    int64_t v8 = [(_LTDAssetModel *)self requiredCapabilityIdentifier];
    uint64_t v9 = [v4 requiredCapabilityIdentifier];
  }
  else
  {
    int64_t v8 = [(_LTDAssetModel *)self assetVersion];
    uint64_t v9 = [v4 assetVersion];
  }
  if (v8 > v9) {
    int64_t v7 = -1;
  }
  else {
    int64_t v7 = 1;
  }
LABEL_9:

  return v7;
}

- (BOOL)isNewerVersionThan:(id)a3
{
  id v4 = a3;
  if ([(_LTDAssetModel *)self isEqual:v4])
  {
    uint64_t v5 = [(_LTDAssetModel *)self assetVersion];
    BOOL v6 = v5 > [v4 assetVersion];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isNewerCompatibleVersionThan:(id)a3
{
  id v4 = a3;
  if ([(_LTDAssetModel *)self _isCompatibleWithThisDevice]) {
    BOOL v5 = [(_LTDAssetModel *)self isNewerVersionThan:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_isCompatibleWithThisDevice
{
  int64_t v3 = [(_LTDAssetModel *)self requiredCapabilityIdentifier];
  if (v3 > +[_LTDANEService capability]) {
    return 0;
  }
  int64_t v5 = [(_LTDAssetModel *)self formatVersion];
  if (!v5) {
    return 1;
  }
  int64_t v6 = v5;
  int64_t v7 = [MEMORY[0x263F3B410] minimumSupportedConfigurationVersion];
  uint64_t v8 = [v7 integerValue];

  uint64_t v9 = [MEMORY[0x263F3B410] maximumSupportedConfigurationVersion];
  uint64_t v10 = [v9 integerValue];

  return v6 >= v8 && v6 <= v10;
}

- (unint64_t)downloadPriority
{
  unint64_t v2 = [(_LTDAssetModel *)self assetType];
  if (v2 > 8) {
    return 99;
  }
  else {
    return qword_26027B5C8[v2];
  }
}

- (int64_t)compareDownloadPriority:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(_LTDAssetModel *)self downloadPriority];
  unint64_t v6 = [v4 downloadPriority];

  if (v5 > v6) {
    return 1;
  }
  else {
    return -1;
  }
}

+ (id)localeIdentifiersForLanguageName:(id)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = _LTPreferencesSupportedLocales(1);
  unint64_t v5 = [MEMORY[0x263EFF980] array];
  unint64_t v6 = [v3 componentsSeparatedByString:@"_"];
  if ([v6 count] == 2)
  {
    int64_t v7 = [v6 objectAtIndexedSubscript:1];
    int v8 = [v7 isEqualToString:@"Var"];

    if (!v8)
    {
      v29[0] = v3;
      uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
      goto LABEL_16;
    }
    v23 = v5;
    v21 = v6;
    uint64_t v9 = [v6 objectAtIndexedSubscript:0];

    id v3 = (id)v9;
  }
  else
  {
    v21 = v6;
    v23 = v5;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v22 = v4;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = [*(id *)(*((void *)&v24 + 1) + 8 * i) _ltLocaleIdentifier];
        v16 = [v15 componentsSeparatedByString:@"_"];
        v17 = [v16 objectAtIndexedSubscript:0];
        int v18 = [v3 isEqualToString:v17];

        if (v18) {
          [v23 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }

  unint64_t v5 = v23;
  uint64_t v19 = (void *)[v23 copy];
  unint64_t v6 = v21;
  id v4 = v22;
LABEL_16:

  return v19;
}

- (id)localeIdentifiers
{
  v43[1] = *MEMORY[0x263EF8340];
  localeIdentifiers = self->_localeIdentifiers;
  if (localeIdentifiers)
  {
LABEL_2:
    id v3 = localeIdentifiers;
    goto LABEL_5;
  }
  unint64_t v5 = self;
  objc_sync_enter(v5);
  unint64_t v6 = self->_localeIdentifiers;
  if (!v6)
  {
    int v8 = [(_LTDAssetModel *)v5 identifier];
    v37 = [v8 componentsSeparatedByString:@"-"];

    switch([(_LTDAssetModel *)v5 assetType])
    {
      case 2uLL:
      case 8uLL:
        if ([v37 count] != 2) {
          goto LABEL_27;
        }
        uint64_t v9 = [v37 objectAtIndexedSubscript:1];
        v43[0] = v9;
        id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:1];
        uint64_t v11 = self->_localeIdentifiers;
        self->_localeIdentifiers = v10;

        break;
      case 4uLL:
      case 5uLL:
        uint64_t v12 = objc_opt_new();
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v13 = [(_LTDAssetModel *)v5 supportedLanguages];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v39 != v15) {
                objc_enumerationMutation(v13);
              }
              v17 = [*(id *)(*((void *)&v38 + 1) + 8 * i) stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
              [v12 addObject:v17];
            }
            uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
          }
          while (v14);
        }

        int v18 = (NSArray *)[v12 copy];
        uint64_t v19 = self->_localeIdentifiers;
        self->_localeIdentifiers = v18;

        break;
      case 6uLL:
        BOOL v20 = objc_opt_new();
        uint64_t v21 = [v37 indexOfObject:@"partial"];
        if (v21 == 0x7FFFFFFFFFFFFFFFLL)
        {
          for (unint64_t j = 2; j < [v37 count]; ++j)
          {
            v23 = [v37 objectAtIndexedSubscript:j];
            long long v24 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
            uint64_t v25 = [v23 rangeOfCharacterFromSet:v24];

            if (v25 == 0x7FFFFFFFFFFFFFFFLL)
            {
              long long v26 = objc_opt_class();
              long long v27 = [v37 objectAtIndexedSubscript:j];
              v28 = [v26 localeIdentifiersForLanguageName:v27];

              [v20 addObjectsFromArray:v28];
            }
          }
        }
        else
        {
          uint64_t v32 = v21 + 1;
          if (v21 + 1 < (unint64_t)[v37 count])
          {
            v33 = objc_opt_class();
            v34 = [v37 objectAtIndexedSubscript:v32];
            v35 = [v33 localeIdentifiersForLanguageName:v34];

            [v20 addObjectsFromArray:v35];
          }
        }
        v30 = (NSArray *)[v20 copy];
        goto LABEL_31;
      case 7uLL:
        if ([v37 count] != 2) {
          goto LABEL_27;
        }
        v29 = objc_opt_class();
        BOOL v20 = [v37 objectAtIndexedSubscript:1];
        v30 = [v29 localeIdentifiersForLanguageName:v20];
LABEL_31:
        v36 = self->_localeIdentifiers;
        self->_localeIdentifiers = v30;

        break;
      default:
LABEL_27:
        v31 = self->_localeIdentifiers;
        self->_localeIdentifiers = (NSArray *)MEMORY[0x263EFFA68];

        break;
    }

    objc_sync_exit(v5);
    localeIdentifiers = self->_localeIdentifiers;
    goto LABEL_2;
  }
  id v3 = v6;
  objc_sync_exit(v5);

LABEL_5:
  return v3;
}

- (NSString)debugDescription
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  unint64_t v6 = [(_LTDAssetModel *)self identifier];
  int64_t v7 = [(_LTDAssetModel *)self assetTypeName];
  int v8 = [(_LTDAssetModel *)self stateDescription];
  uint64_t v9 = [(_LTDAssetModel *)self progress];
  id v10 = [v3 stringWithFormat:@"<%@: %p; %@ (%@) %@ %@>", v5, self, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (_LTDAssetModelProtocol)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_localeIdentifiers, 0);
}

- (void)initWithProvider:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Cannot initialize an LTDAssetModel with a nil provider", v1, 2u);
}

@end