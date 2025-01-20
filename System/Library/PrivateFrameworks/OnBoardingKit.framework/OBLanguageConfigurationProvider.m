@interface OBLanguageConfigurationProvider
+ (id)defaultConfiguration;
- (NSBundle)bundle;
- (NSString)displayLanguage;
- (NSString)tableName;
- (OBLanguageConfigurationProvider)initWithBundle:(id)a3 andTable:(id)a4;
- (unint64_t)spansAllLines;
- (void)setBundle:(id)a3;
- (void)setDisplayLanguage:(id)a3;
- (void)setTableName:(id)a3;
@end

@implementation OBLanguageConfigurationProvider

- (OBLanguageConfigurationProvider)initWithBundle:(id)a3 andTable:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OBLanguageConfigurationProvider;
  v9 = [(OBLanguageConfigurationProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tableName, a4);
    objc_storeStrong((id *)&v10->_bundle, a3);
  }

  return v10;
}

+ (id)defaultConfiguration
{
  v2 = [OBLanguageConfigurationProvider alloc];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [(OBLanguageConfigurationProvider *)v2 initWithBundle:v3 andTable:@"OBLanguageConfiguration"];

  return v4;
}

- (unint64_t)spansAllLines
{
  v3 = [(OBLanguageConfigurationProvider *)self tableName];
  v4 = [(OBLanguageConfigurationProvider *)self bundle];
  v5 = [(OBLanguageConfigurationProvider *)self displayLanguage];
  v6 = +[OBUtilities localizedString:@"spansAllLines" forTable:v3 inBundle:v4 forLanguage:v5];

  id v7 = [v6 lowercaseString];

  id v8 = [&unk_1EEC37AC0 objectForKeyedSubscript:v7];
  unint64_t v9 = (int)[v8 intValue];

  return v9;
}

- (NSString)displayLanguage
{
  return self->_displayLanguage;
}

- (void)setDisplayLanguage:(id)a3
{
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void)setTableName:(id)a3
{
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_displayLanguage, 0);
}

@end