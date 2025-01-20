@interface SSSearchInAppResultBuilder
+ (id)buildResultWithAppName:(id)a3 appBundleId:(id)a4 searchString:(id)a5 searchInAppType:(int)a6;
- (NSString)appBundleId;
- (NSString)appName;
- (NSString)searchString;
- (SSSearchInAppResultBuilder)initWithAppName:(id)a3 appBundleId:(id)a4 searchString:(id)a5 searchInAppType:(int)a6;
- (id)buildCommand;
- (id)buildInlineCardSections;
- (id)buildResult;
- (int)searchInAppType;
- (void)setAppBundleId:(id)a3;
- (void)setAppName:(id)a3;
- (void)setSearchInAppType:(int)a3;
- (void)setSearchString:(id)a3;
@end

@implementation SSSearchInAppResultBuilder

+ (id)buildResultWithAppName:(id)a3 appBundleId:(id)a4 searchString:(id)a5 searchInAppType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [[SSSearchInAppResultBuilder alloc] initWithAppName:v11 appBundleId:v10 searchString:v9 searchInAppType:v6];

  v13 = [(SSSearchInAppResultBuilder *)v12 buildResult];

  return v13;
}

- (SSSearchInAppResultBuilder)initWithAppName:(id)a3 appBundleId:(id)a4 searchString:(id)a5 searchInAppType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SSSearchInAppResultBuilder;
  v13 = [(SSSearchInAppResultBuilder *)&v17 init];
  v14 = v13;
  if (v13)
  {
    [(SSSearchInAppResultBuilder *)v13 setAppName:v10];
    [(SSSearchInAppResultBuilder *)v14 setAppBundleId:v11];
    [(SSSearchInAppResultBuilder *)v14 setSearchString:v12];
    v15 = objc_opt_new();
    [(SSResultBuilder *)v14 setResult:v15];

    [(SSSearchInAppResultBuilder *)v14 setSearchInAppType:v6];
  }

  return v14;
}

- (id)buildResult
{
  v3 = [(SSSearchInAppResultBuilder *)self appBundleId];
  v4 = [v3 componentsSeparatedByString:@"."];
  v5 = [v4 lastObject];

  uint64_t v6 = [@"com.apple.other:search_" stringByAppendingString:v5];
  id v7 = objc_alloc(MEMORY[0x1E4F9A3C8]);
  v8 = [(SSSearchInAppResultBuilder *)self searchString];
  id v9 = [(SSSearchInAppResultBuilder *)self searchString];
  id v10 = (void *)[v7 initWithSuggestion:v8 query:v9 score:13 type:0.0];

  id v11 = [(SSSearchInAppResultBuilder *)self appBundleId];
  [v10 setBundleIdentifier:v11];

  v15.receiver = self;
  v15.super_class = (Class)SSSearchInAppResultBuilder;
  id v12 = [(SSResultBuilder *)&v15 buildResult];
  [v12 setResultBundleId:v6];
  [v12 setIdentifier:v6];
  [v12 setType:16];
  [v12 setSuggestion:v10];
  v13 = [(SSSearchInAppResultBuilder *)self appBundleId];
  [v12 setApplicationBundleIdentifier:v13];

  return v12;
}

- (id)buildInlineCardSections
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SSSearchInAppResultBuilder *)self appBundleId];
  int v4 = [v3 isEqual:@"com.apple.AppStore"];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"SEARCH_APP_STORE" value:&stru_1F1824018 table:@"SpotlightServices"];
  }
  else
  {
    id v7 = NSString;
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v8 = [v5 localizedStringForKey:@"SEARCH_IN_APP" value:&stru_1F1824018 table:@"SpotlightServices"];
    id v9 = [(SSSearchInAppResultBuilder *)self appName];
    uint64_t v6 = objc_msgSend(v7, "stringWithFormat:", v8, v9);
  }
  id v10 = [MEMORY[0x1E4F9A0E0] textWithString:v6];
  [v10 setIsEmphasized:1];
  id v11 = objc_opt_new();
  v20[0] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v11 setFormattedTextPieces:v12];

  v13 = objc_opt_new();
  v14 = [(SSSearchInAppResultBuilder *)self appBundleId];
  [v13 setBundleIdentifier:v14];

  objc_super v15 = objc_opt_new();
  [v15 setSuggestionText:v11];
  [v15 setSuggestionType:2];
  [v15 setThumbnail:v13];
  v16 = [(SSSearchInAppResultBuilder *)self buildCommand];
  [v15 setCommand:v16];

  v19 = v15;
  objc_super v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];

  return v17;
}

- (id)buildCommand
{
  v3 = objc_opt_new();
  int v4 = [(SSSearchInAppResultBuilder *)self searchString];
  [v3 setSearchString:v4];

  v5 = [(SSSearchInAppResultBuilder *)self appBundleId];
  [v3 setApplicationBundleIdentifier:v5];

  objc_msgSend(v3, "setSearchInAppType:", -[SSSearchInAppResultBuilder searchInAppType](self, "searchInAppType"));
  return v3;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (int)searchInAppType
{
  return self->_searchInAppType;
}

- (void)setSearchInAppType:(int)a3
{
  self->_searchInAppType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_appName, 0);
}

@end