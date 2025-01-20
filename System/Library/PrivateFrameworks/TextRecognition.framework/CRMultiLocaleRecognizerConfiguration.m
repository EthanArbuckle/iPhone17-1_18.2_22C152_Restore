@interface CRMultiLocaleRecognizerConfiguration
- (CRMultiLocaleRecognizerConfiguration)initWithImageReaderOptions:(id)a3 error:(id *)a4;
- (NSOrderedSet)languages;
- (id)initV2DefaultConfigWithOptions:(id)a3;
- (id)initV3DefaultConfigWithOptions:(id)a3;
- (id)textFeatureFilter;
@end

@implementation CRMultiLocaleRecognizerConfiguration

- (CRMultiLocaleRecognizerConfiguration)initWithImageReaderOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRMultiLocaleRecognizerConfiguration;
  v7 = [(CRRecognizerConfiguration *)&v14 initWithImageReaderOptions:v6 error:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"CRImageReaderLanguageKey"];

    if (v8)
    {
      v9 = [v6 objectForKeyedSubscript:@"CRImageReaderLanguageKey"];
      v10 = +[CRRecognizerConfiguration supportedLanguagesForVersion:[(CRRecognizerConfiguration *)v7 revision]];
      uint64_t v11 = +[CRRecognizerConfiguration languageSetFromInputLanguages:v9 supportedLanguages:v10];
      languages = v7->_languages;
      v7->_languages = (NSOrderedSet *)v11;
    }
  }

  return v7;
}

- (id)initV2DefaultConfigWithOptions:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRMultiLocaleRecognizerConfiguration;
  v3 = [(CRRecognizerConfiguration *)&v9 initV2DefaultConfigWithOptions:a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CAA0]);
    v5 = +[CRRecognizerConfiguration supportedLanguagesForVersion:2];
    uint64_t v6 = [v4 initWithArray:v5];
    v7 = (void *)v3[10];
    v3[10] = v6;
  }
  return v3;
}

- (id)initV3DefaultConfigWithOptions:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRMultiLocaleRecognizerConfiguration;
  v3 = [(CRRecognizerConfiguration *)&v9 initV3DefaultConfigWithOptions:a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CAA0]);
    v5 = +[CRRecognizerConfiguration supportedLanguagesForVersion:3];
    uint64_t v6 = [v4 initWithArray:v5];
    v7 = (void *)v3[10];
    v3[10] = v6;
  }
  return v3;
}

- (id)textFeatureFilter
{
  v3 = [(CRRecognizerConfiguration *)self cachedTextFeatureFilter];

  if (!v3)
  {
    if ([(CRRecognizerConfiguration *)self revision] > 2)
    {
      v5 = [CRTextFeaturesFilterV2 alloc];
      id v4 = [(CRMultiLocaleRecognizerConfiguration *)self languages];
      uint64_t v6 = [v4 firstObject];
      v7 = [(CRTextFeaturesFilterV2 *)v5 initWithLocale:v6];
      [(CRRecognizerConfiguration *)self setCachedTextFeatureFilter:v7];
    }
    else
    {
      id v4 = objc_opt_new();
      [(CRRecognizerConfiguration *)self setCachedTextFeatureFilter:v4];
    }
  }
  return [(CRRecognizerConfiguration *)self cachedTextFeatureFilter];
}

- (NSOrderedSet)languages
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
}

@end