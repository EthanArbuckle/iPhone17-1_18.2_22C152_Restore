@interface TTS_AXDialectMapWrapper
- (AXDialectMap)dialectMap;
- (NSString)languageNameAndLocaleInCurrentLocale;
- (NSString)languageNameInCurrentLocale;
- (NSString)languageNameInNativeLocale;
- (NSString)localeNameInCurrentLocale;
- (TTS_AXDialectMapWrapper)initWithDialectMap:(id)a3;
- (void)setDialectMap:(id)a3;
@end

@implementation TTS_AXDialectMapWrapper

- (TTS_AXDialectMapWrapper)initWithDialectMap:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TTS_AXDialectMapWrapper;
  v6 = [(TTS_AXDialectMapWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dialectMap, a3);
  }

  return v7;
}

- (NSString)languageNameInCurrentLocale
{
  v2 = [(TTS_AXDialectMapWrapper *)self dialectMap];
  v3 = [v2 languageNameInCurrentLocale];

  return (NSString *)v3;
}

- (NSString)languageNameAndLocaleInCurrentLocale
{
  v2 = [(TTS_AXDialectMapWrapper *)self dialectMap];
  v3 = [v2 languageNameAndLocaleInCurrentLocale];

  return (NSString *)v3;
}

- (NSString)languageNameInNativeLocale
{
  v2 = [(TTS_AXDialectMapWrapper *)self dialectMap];
  v3 = [v2 languageNameInNativeLocale];

  return (NSString *)v3;
}

- (NSString)localeNameInCurrentLocale
{
  v2 = [(TTS_AXDialectMapWrapper *)self dialectMap];
  v3 = [v2 localeNameInCurrentLocale];

  return (NSString *)v3;
}

- (AXDialectMap)dialectMap
{
  return self->_dialectMap;
}

- (void)setDialectMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end