@interface SSLocalWebResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (BOOL)supportsResult:(id)a3;
+ (id)stringWithUrl:(id)a3;
- (NSString)cloudTabDeviceName;
- (NSString)siteName;
- (NSURL)url;
- (SSLocalWebResultBuilder)initWithResult:(id)a3;
- (id)buildCommand;
- (id)buildDescriptions;
- (id)buildResult;
- (void)setCloudTabDeviceName:(id)a3;
- (void)setSiteName:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation SSLocalWebResultBuilder

+ (BOOL)supportsResult:(id)a3
{
  v3 = [a3 contentType];
  char v4 = [&unk_1F1864700 containsObject:v3];

  return v4;
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

+ (id)stringWithUrl:(id)a3
{
  id v3 = a3;
  char v4 = objc_msgSend(v3, "_lp_simplifiedDisplayString");
  v5 = [v3 absoluteString];

  if (!v4)
  {
    uint64_t v6 = [v5 rangeOfString:@"."];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v8 = v6 + v7, v9 = [v5 length], v10 = v9 - v8, v9 <= v8))
    {
      char v4 = 0;
    }
    else
    {
      uint64_t v11 = objc_msgSend(v5, "rangeOfString:options:range:", @"/", 0, v8, v10);
      if (v11 != 0x7FFFFFFFFFFFFFFFLL
        || (uint64_t v11 = objc_msgSend(v5, "rangeOfString:options:range:", @"?", 0, v8, v10),
            char v4 = 0,
            v11 != 0x7FFFFFFFFFFFFFFFLL))
      {
        char v4 = [v5 substringToIndex:v11];
      }
    }
  }

  return v4;
}

- (SSLocalWebResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SSLocalWebResultBuilder;
  v5 = [(SSResultBuilder *)&v14 initWithResult:v4];
  if (v5)
  {
    uint64_t v6 = [v4 valueForAttribute:*MEMORY[0x1E4F23658] withType:objc_opt_class()];
    [(SSLocalWebResultBuilder *)v5 setSiteName:v6];

    uint64_t v7 = *MEMORY[0x1E4F22C70];
    uint64_t v8 = [v4 valueForAttribute:*MEMORY[0x1E4F22C70] withType:objc_opt_class()];
    if (v8)
    {
      [(SSLocalWebResultBuilder *)v5 setUrl:v8];
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v10 = [v4 valueForAttribute:v7 withType:objc_opt_class()];
      uint64_t v11 = [v9 URLWithString:v10];
      [(SSLocalWebResultBuilder *)v5 setUrl:v11];
    }
    v12 = [v4 valueForAttribute:*MEMORY[0x1E4F23570] withType:objc_opt_class()];
    [(SSLocalWebResultBuilder *)v5 setCloudTabDeviceName:v12];
  }
  return v5;
}

- (id)buildResult
{
  v10.receiver = self;
  v10.super_class = (Class)SSLocalWebResultBuilder;
  id v3 = [(SSResultBuilder *)&v10 buildResult];
  id v4 = objc_opt_class();
  v5 = [(SSLocalWebResultBuilder *)self url];
  uint64_t v6 = [v4 stringWithUrl:v5];
  uint64_t v7 = [MEMORY[0x1E4F28B88] controlCharacterSet];
  uint64_t v8 = [v6 stringByTrimmingCharactersInSet:v7];
  [v3 setCompletion:v8];

  return v3;
}

- (id)buildCommand
{
  id v3 = [(SSLocalWebResultBuilder *)self url];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F9A2F8];
    v5 = [(SSLocalWebResultBuilder *)self url];
    uint64_t v6 = [v4 punchoutWithURL:v5];

    uint64_t v7 = objc_opt_new();
    [v7 setPunchout:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SSLocalWebResultBuilder;
    uint64_t v7 = [(SSResultBuilder *)&v9 buildCommand];
  }
  return v7;
}

- (id)buildDescriptions
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  id v4 = objc_opt_new();
  v5 = objc_opt_class();
  uint64_t v6 = [(SSLocalWebResultBuilder *)self url];
  uint64_t v7 = [v5 stringWithUrl:v6];

  if ([v7 length]) {
    [v4 addObject:v7];
  }
  uint64_t v8 = [(SSLocalWebResultBuilder *)self cloudTabDeviceName];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    objc_super v10 = NSString;
    uint64_t v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"FROM_CLOUD_TAB_DEVICE_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];
    v13 = [(SSLocalWebResultBuilder *)self cloudTabDeviceName];
    objc_super v14 = objc_msgSend(v10, "stringWithFormat:", v12, v13);
    [v4 addObject:v14];
  }
  v15 = [v4 componentsJoinedByString:@" · "];
  if ([v15 length])
  {
    if (buildDescriptions_onceToken != -1) {
      dispatch_once(&buildDescriptions_onceToken, &__block_literal_global_38);
    }
    v16 = (void *)buildDescriptions_symbolNamesForContentTypes;
    v17 = [(SSResultBuilder *)self result];
    v18 = [v17 contentType];
    v19 = [v16 objectForKeyedSubscript:v18];

    if (v19)
    {
      v20 = objc_opt_new();
      [v20 setSymbolName:v19];
      [v20 setIsTemplate:1];
      v21 = objc_opt_new();
      [v21 setGlyph:v20];
      v22 = (void *)MEMORY[0x1E4F9A0E0];
      v23 = [NSString stringWithFormat:@" %@", v15];
      v24 = [v22 textWithString:v23];

      v29[0] = v21;
      v29[1] = v24;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
      [v3 setFormattedTextPieces:v25];
    }
    else
    {
      [v3 setText:v15];
    }
    [v3 setMaxLines:1];
    v28 = v3;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

void __44__SSLocalWebResultBuilder_buildDescriptions__block_invoke()
{
  v0 = (void *)buildDescriptions_symbolNamesForContentTypes;
  buildDescriptions_symbolNamesForContentTypes = (uint64_t)&unk_1F18649C0;
}

- (NSString)siteName
{
  return self->_siteName;
}

- (void)setSiteName:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)cloudTabDeviceName
{
  return self->_cloudTabDeviceName;
}

- (void)setCloudTabDeviceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudTabDeviceName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_siteName, 0);
}

@end