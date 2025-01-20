@interface SPSearchAppEntity
+ (BOOL)supportsSecureCoding;
- (BOOL)isAppEntitySearch;
- (BOOL)isScopedSearch;
- (NSString)bundleIdentifier;
- (SPSearchAppEntity)initWithBundleIdentifier:(id)a3 appName:(id)a4 fromSuggestion:(BOOL)a5;
- (SPSearchAppEntity)initWithCoder:(id)a3;
- (id)spotlightQueryString;
- (void)appendToQuery:(id)a3 key:(id)a4 value:(id)a5 additions:(id)a6 flags:(id)a7;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPSearchAppEntity

- (SPSearchAppEntity)initWithBundleIdentifier:(id)a3 appName:(id)a4 fromSuggestion:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SPSearchAppEntity;
  v11 = [(SPSearchAppEntity *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(SPSearchEntity *)v11 setTokenString:v10];
    [(SPSearchEntity *)v12 setDisplayString:v10];
    objc_storeStrong((id *)&v12->_bundleIdentifier, a3);
    [(SPSearchEntity *)v12 setIsSuggestion:v5];
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SPSearchAppEntity;
  id v4 = a3;
  [(SPSearchEntity *)&v6 encodeWithCoder:v4];
  BOOL v5 = [(SPSearchAppEntity *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:kAppIdentifierKey];

  objc_msgSend(v4, "encodeBool:forKey:", -[SPSearchEntity isSuggestion](self, "isSuggestion"), @"isSuggestion");
}

- (SPSearchAppEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  if (initWithCoder__onceAppClassesToken != -1) {
    dispatch_once(&initWithCoder__onceAppClassesToken, &__block_literal_global_380);
  }
  v9.receiver = self;
  v9.super_class = (Class)SPSearchAppEntity;
  BOOL v5 = [(SPSearchEntity *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClasses:initWithCoder__appClassesToDecode forKey:kAppIdentifierKey];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    -[SPSearchEntity setIsSuggestion:](v5, "setIsSuggestion:", [v4 decodeBoolForKey:@"isSuggestion"]);
  }

  return v5;
}

void __35__SPSearchAppEntity_initWithCoder___block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:3];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v3 = (void *)initWithCoder__appClassesToDecode;
  initWithCoder__appClassesToDecode = v2;
}

- (BOOL)isAppEntitySearch
{
  return 1;
}

- (BOOL)isScopedSearch
{
  return 1;
}

- (void)appendToQuery:(id)a3 key:(id)a4 value:(id)a5 additions:(id)a6 flags:(id)a7
{
  id v20 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_super v14 = (__CFString *)a7;
  if ([v12 length])
  {
    if ([v20 length]) {
      [v20 appendString:@" || "];
    }
    uint64_t v15 = [(__CFString *)v14 length];
    v16 = &stru_1F1824018;
    if (v15) {
      v16 = v14;
    }
    if (v13) {
      [v20 appendFormat:@"(%@=\"%@\"%@ || (kMDItemDisplayName=\"%@\" && _kMDItemBundleID=\"com.apple.application\"], v11, v12, v16, v13, @"!(FieldMatch(@\"_kMDItemDomainIdentifier\",@\"com.apple.siri.interactions\", @\"com.apple.siri.interactions\", @\"com.apple.siri.upcomingmedia\"))", @"(_kMDItemUserActivityEligibleForPublicIndexing != 1 && _kMDItemUserActivityEligibleForPublicIndexing != 0)", @"kMDItemContentType != \"public.folder\", @"_kMDItemIsGroupThread!=*");
    }
    else {
      [v20 appendFormat:@"(%@=\"%@\"%@) && (%@) && (%@)", v11, v12, v16, @"!(FieldMatch(@\"_kMDItemDomainIdentifier\",@\"com.apple.siri.interactions\", @\"com.apple.siri.interactions\", @\"com.apple.siri.upcomingmedia\"))", @"(_kMDItemUserActivityEligibleForPublicIndexing != 1 && _kMDItemUserActivityEligibleForPublicIndexing != 0)", v17, v18, v19];
    }
  }
}

- (id)spotlightQueryString
{
  v3 = objc_opt_new();
  uint64_t v4 = [(SPSearchAppEntity *)self bundleIdentifier];
  uint64_t v5 = [(SPSearchAppEntity *)self bundleIdentifier];
  int v6 = [v5 isEqualToString:@"com.apple.DocumentsApp"];

  if (v6)
  {

    uint64_t v4 = @"com.apple.CloudDocs.MobileDocumentsFileProvider";
  }
  if ([(SPSearchEntity *)self hasWords])
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [(SPSearchEntity *)self tokenText];
  }
  [(SPSearchAppEntity *)self appendToQuery:v3 key:*MEMORY[0x1E4F22B50] value:v4 additions:v7 flags:0];

  return v3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
}

@end