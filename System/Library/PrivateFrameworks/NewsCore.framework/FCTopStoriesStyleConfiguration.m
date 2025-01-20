@interface FCTopStoriesStyleConfiguration
- (BOOL)isEqual:(id)a3;
- (FCColor)dark_style_foreground_color;
- (FCColor)foreground_color;
- (FCTopStoriesStyleConfiguration)initWithConfigDictionary:(id)a3;
- (NSString)label;
- (NSString)stringType;
- (unint64_t)hash;
- (unint64_t)storyType;
@end

@implementation FCTopStoriesStyleConfiguration

- (FCTopStoriesStyleConfiguration)initWithConfigDictionary:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FCTopStoriesStyleConfiguration;
  v6 = [(FCTopStoriesStyleConfiguration *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configDict, a3);
    uint64_t v8 = FCAppConfigurationStringValue(v5, @"type", 0);
    stringType = v7->_stringType;
    v7->_stringType = (NSString *)v8;

    v7->_storyType = FCArticleStoryTypeForStoryTypeString(v7->_stringType);
    uint64_t v10 = FCAppConfigurationStringValue(v5, @"label", 0);
    label = v7->_label;
    v7->_label = (NSString *)v10;

    v12 = FCAppConfigurationStringValue(v5, @"foregroundColor", 0);
    uint64_t v13 = +[FCColor nullableColorWithHexString:v12];
    foreground_color = v7->_foreground_color;
    v7->_foreground_color = (FCColor *)v13;

    v15 = FCAppConfigurationStringValue(v5, @"alternateForegroundColor", 0);
    uint64_t v16 = +[FCColor nullableColorWithHexString:v15];
    dark_style_foreground_color = v7->_dark_style_foreground_color;
    v7->_dark_style_foreground_color = (FCColor *)v16;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringType, 0);
  objc_storeStrong((id *)&self->_dark_style_foreground_color, 0);
  objc_storeStrong((id *)&self->_foreground_color, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_configDict, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  v6 = v5;

  if (v6) {
    char v7 = objc_msgSend(MEMORY[0x1E4FBA8A8], "nf_object:isEqualToObject:", self->_configDict, v6[1]);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_configDict hash];
}

- (unint64_t)storyType
{
  return self->_storyType;
}

- (NSString)label
{
  return self->_label;
}

- (FCColor)foreground_color
{
  return self->_foreground_color;
}

- (FCColor)dark_style_foreground_color
{
  return self->_dark_style_foreground_color;
}

- (NSString)stringType
{
  return self->_stringType;
}

@end