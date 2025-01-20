@interface PSSearchableItem
- (NSArray)keywords;
- (NSArray)requiredCapabilities;
- (NSArray)requiredCapabilitiesOr;
- (NSNumber)rankingHint;
- (NSString)bundleID;
- (NSString)category;
- (NSString)classIdentifier;
- (NSString)contentDescription;
- (NSString)identifier;
- (NSString)name;
- (NSString)url;
- (id)toAutomationDictionary;
- (id)toCSSearchableItem;
- (id)toManifestDictionary;
- (void)setBundleID:(id)a3;
- (void)setCategory:(id)a3;
- (void)setClassIdentifier:(id)a3;
- (void)setContentDescription:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeywords:(id)a3;
- (void)setName:(id)a3;
- (void)setRankingHint:(id)a3;
- (void)setRequiredCapabilities:(id)a3;
- (void)setRequiredCapabilitiesOr:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation PSSearchableItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredCapabilitiesOr, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_rankingHint, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_contentDescription, 0);
  objc_storeStrong((id *)&self->_classIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (id)toCSSearchableItem
{
  id v3 = objc_alloc(MEMORY[0x1E4F23850]);
  v4 = [(PSSearchableItem *)self classIdentifier];
  v5 = (void *)[v3 initWithItemContentType:v4];

  v6 = [(PSSearchableItem *)self name];
  [v5 setSubject:v6];

  v7 = [(PSSearchableItem *)self contentDescription];
  [v5 setContentDescription:v7];

  v8 = [(PSSearchableItem *)self keywords];
  [v5 setKeywords:v8];

  v9 = [(PSSearchableItem *)self category];

  if (v9) {
    [(PSSearchableItem *)self category];
  }
  else {
  v10 = [(PSSearchableItem *)self identifier];
  }
  [v5 setTheme:v10];

  v11 = [(PSSearchableItem *)self url];
  [v5 setIdentifier:v11];

  v12 = [(PSSearchableItem *)self rankingHint];
  [v5 setRankingHint:v12];

  v13 = [MEMORY[0x1E4F28B50] mainBundle];
  v14 = [v13 bundleIdentifier];
  int v15 = [@"com.apple.Preferences" isEqualToString:v14];

  if (v15)
  {
    v16 = [(PSSearchableItem *)self name];
    [v5 setTitle:v16];

    v17 = [(PSSearchableItem *)self contentDescription];
    [v5 setSubtitle:v17];
  }
  v18 = [(PSSearchableItem *)self url];
  int v19 = [v18 hasPrefix:@"settings-navigation:"];

  if (v19)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F1CB10]);
    v21 = [(PSSearchableItem *)self url];
    v22 = (void *)[v20 initWithString:v21];

    v23 = [v22 pathComponents];
    v24 = [v22 host];
    if ([@"com.apple.Settings.Apps" isEqualToString:v24])
    {
      unint64_t v25 = [v23 count];

      if (v25 < 2)
      {
LABEL_11:

        goto LABEL_12;
      }
      v24 = [v23 objectAtIndexedSubscript:1];
      [v5 setRelatedAppBundleIdentifier:v24];
    }

    goto LABEL_11;
  }
LABEL_12:
  id v26 = objc_alloc(MEMORY[0x1E4F23840]);
  v27 = [(PSSearchableItem *)self url];
  v28 = [(PSSearchableItem *)self classIdentifier];
  v29 = (void *)[v26 initWithUniqueIdentifier:v27 domainIdentifier:v28 attributeSet:v5];

  return v29;
}

- (NSString)url
{
  return self->_url;
}

- (NSString)classIdentifier
{
  return self->_classIdentifier;
}

- (NSString)category
{
  return self->_category;
}

- (void)setUrl:(id)a3
{
}

- (void)setRequiredCapabilitiesOr:(id)a3
{
}

- (void)setRequiredCapabilities:(id)a3
{
}

- (void)setRankingHint:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setKeywords:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void)setContentDescription:(id)a3
{
}

- (void)setClassIdentifier:(id)a3
{
}

- (void)setCategory:(id)a3
{
}

- (void)setBundleID:(id)a3
{
}

- (NSNumber)rankingHint
{
  return self->_rankingHint;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)keywords
{
  return self->_keywords;
}

- (NSString)contentDescription
{
  return self->_contentDescription;
}

- (id)toManifestDictionary
{
  id v3 = objc_opt_new();
  v4 = [(PSSearchableItem *)self name];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [(PSSearchableItem *)self name];
    [v3 setObject:v6 forKeyedSubscript:@"label"];
  }
  v7 = [(PSSearchableItem *)self url];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    v9 = [(PSSearchableItem *)self url];
    [v3 setObject:v9 forKeyedSubscript:@"searchURL"];
  }
  v10 = [(PSSearchableItem *)self category];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    uint64_t v12 = [(PSSearchableItem *)self category];
  }
  else
  {
    v13 = [(PSSearchableItem *)self identifier];
    uint64_t v14 = [v13 length];

    if (!v14) {
      goto LABEL_10;
    }
    uint64_t v12 = [(PSSearchableItem *)self identifier];
  }
  int v15 = (void *)v12;
  [v3 setObject:v12 forKeyedSubscript:@"searchSectionID"];

LABEL_10:
  v16 = [(PSSearchableItem *)self keywords];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    v18 = [(PSSearchableItem *)self keywords];
    int v19 = [v18 componentsJoinedByString:@","];
    [v3 setObject:v19 forKeyedSubscript:@"keywords"];
  }
  id v20 = [(PSSearchableItem *)self requiredCapabilities];
  uint64_t v21 = [v20 count];

  if (v21)
  {
    v22 = [(PSSearchableItem *)self requiredCapabilities];
    [v3 setObject:v22 forKeyedSubscript:@"requiredCapabilities"];
  }
  v23 = [(PSSearchableItem *)self requiredCapabilitiesOr];
  uint64_t v24 = [v23 count];

  if (v24)
  {
    unint64_t v25 = [(PSSearchableItem *)self requiredCapabilitiesOr];
    [v3 setObject:v25 forKeyedSubscript:@"requiredCapabilitiesOr"];
  }
  id v26 = [(PSSearchableItem *)self contentDescription];
  uint64_t v27 = [v26 length];

  if (v27)
  {
    v28 = [(PSSearchableItem *)self contentDescription];
    [v3 setObject:v28 forKeyedSubscript:@"contentDescription"];
  }
  v29 = (void *)[v3 copy];

  return v29;
}

- (id)toAutomationDictionary
{
  id v3 = objc_opt_new();
  v4 = [(PSSearchableItem *)self name];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [(PSSearchableItem *)self name];
    [v3 setObject:v6 forKeyedSubscript:@"title"];
  }
  v7 = [(PSSearchableItem *)self contentDescription];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    v9 = [(PSSearchableItem *)self contentDescription];
    [v3 setObject:v9 forKeyedSubscript:@"subtitle"];
  }
  v10 = [(PSSearchableItem *)self url];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    uint64_t v12 = [(PSSearchableItem *)self url];
    [v3 setObject:v12 forKeyedSubscript:@"url"];
  }
  v13 = [(PSSearchableItem *)self keywords];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    int v15 = [(PSSearchableItem *)self keywords];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"keywords"];
  }
  uint64_t v17 = (void *)[v3 copy];

  return v17;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSArray)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (NSArray)requiredCapabilitiesOr
{
  return self->_requiredCapabilitiesOr;
}

@end