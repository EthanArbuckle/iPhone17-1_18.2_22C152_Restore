@interface SFSSymbolAssetInfo
+ (id)infoForName:(id)a3 allowsPrivate:(BOOL)a4 locale:(id)a5;
+ (id)localeAgnosticInfo:(id)a3 allowsPrivate:(BOOL)a4;
+ (id)localeSpecificInfo:(id)a3 locale:(id)a4;
- (NSBundle)bundle;
- (NSString)name;
- (SFSSymbolAssetInfo)initWithName:(id)a3 bundle:(id)a4 andType:(int64_t)a5;
- (int64_t)bundleType;
@end

@implementation SFSSymbolAssetInfo

+ (id)infoForName:(id)a3 allowsPrivate:(BOOL)a4 locale:(id)a5
{
  return +[SFSSymbolAssetInfo localeAgnosticInfo:allowsPrivate:](SFSSymbolAssetInfo, "localeAgnosticInfo:allowsPrivate:", a3, a4, a5);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->bundle, 0);
  objc_storeStrong((id *)&self->name, 0);
}

+ (id)localeAgnosticInfo:(id)a3 allowsPrivate:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (localeAgnosticInfo_allowsPrivate__once != -1) {
    dispatch_once(&localeAgnosticInfo_allowsPrivate__once, &__block_literal_global_0);
  }
  v6 = [(id)localeAgnosticInfo_allowsPrivate___ResolvedCoreGlyphsNameToBundleType objectForKeyedSubscript:v5];
  if (v6)
  {
    v7 = v6;
    v8 = SFSResolveNameAndStatus(v5, v6, v4);
    goto LABEL_13;
  }
  v9 = [&unk_26E102E08 objectForKeyedSubscript:v5];
  v10 = [(id)localeAgnosticInfo_allowsPrivate___ResolvedCoreGlyphsNameToBundleType objectForKeyedSubscript:v9];
  if (v10)
  {
    v7 = v10;
    v8 = SFSResolveNameAndStatus(v9, v10, v4);
  }
  else
  {
    if (v4)
    {
      v11 = [&unk_26E102E58 objectForKeyedSubscript:v5];

      v12 = [(id)localeAgnosticInfo_allowsPrivate___ResolvedCoreGlyphsNameToBundleType objectForKeyedSubscript:v11];
      if (v12)
      {
        v7 = v12;
        v8 = SFSResolveNameAndStatus(v11, v12, 1);
      }
      else
      {
        v14 = [&unk_26E102E80 objectForKeyedSubscript:v5];
        v7 = [(id)localeAgnosticInfo_allowsPrivate___ResolvedCoreGlyphsNameToBundleType objectForKeyedSubscript:v14];
        if (v7)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
            +[SFSSymbolAssetInfo localeAgnosticInfo:allowsPrivate:]((uint64_t)v5, (uint64_t)v14);
          }
          v8 = SFSResolveNameAndStatus(v14, v7, 1);
        }
        else
        {

          v8 = 0;
        }
      }
      goto LABEL_12;
    }
    v7 = 0;
    v8 = 0;
  }
  v11 = v9;
LABEL_12:

LABEL_13:
  return v8;
}

- (SFSSymbolAssetInfo)initWithName:(id)a3 bundle:(id)a4 andType:(int64_t)a5
{
  v8 = (NSString *)a3;
  v9 = (NSBundle *)a4;
  v15.receiver = self;
  v15.super_class = (Class)SFSSymbolAssetInfo;
  v10 = [(SFSSymbolAssetInfo *)&v15 init];
  name = v10->name;
  v10->name = v8;
  v12 = v8;

  bundle = v10->bundle;
  v10->bundle = v9;

  v10->bundleType = a5;
  return v10;
}

void __55__SFSSymbolAssetInfo_localeAgnosticInfo_allowsPrivate___block_invoke()
{
}

+ (id)localeSpecificInfo:(id)a3 locale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v6 = [MEMORY[0x263EFF960] currentLocale];
  }
  v7 = [v5 name];
  v8 = [&unk_26E0FE218 objectForKeyedSubscript:v7];
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 integerValue];
    v11 = +[X objectForKeyedSubscript:v7];
    v12 = v11;
    switch(v10)
    {
      case 0:
        goto LABEL_10;
      case 1:
        goto LABEL_13;
      case 2:
        v13 = resolveNumeralForLocale(v11, v6);
        if (!v13) {
          goto LABEL_15;
        }
        goto LABEL_14;
      case 3:
        v13 = resolveLanguageForLocale(v11, v6);
        if (!v13) {
          goto LABEL_10;
        }
        goto LABEL_14;
      case 4:
        v13 = resolveNumeralForLocale(v11, v6);
        if (v13) {
          goto LABEL_14;
        }
LABEL_10:
        v13 = resolveDirectionForLocale(v12, v6);
        if (!v13) {
          goto LABEL_15;
        }
        goto LABEL_14;
      case 5:
        v13 = resolveNumeralForLocale(v11, v6);
        if (v13) {
          goto LABEL_14;
        }
LABEL_13:
        v13 = resolveLanguageForLocale(v12, v6);
        if (v13)
        {
LABEL_14:
          v14 = (void *)v5[1];
          v5[1] = v13;
          id v15 = v13;
        }
LABEL_15:

        break;
      default:
        goto LABEL_15;
    }
  }

  return v5;
}

- (NSBundle)bundle
{
  return (NSBundle *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)bundleType
{
  return self->bundleType;
}

+ (void)localeAgnosticInfo:(uint64_t)a1 allowsPrivate:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_fault_impl(&dword_22D317000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Client requested a temporary SFSymbol alias '%@' and should migrate to the latest name '%@'", (uint8_t *)&v2, 0x16u);
}

@end