@interface RKAssets
+ (id)alternativeInversions;
+ (id)appreciationKeywords;
+ (id)categoryKeywordMap;
+ (id)constantClasses;
+ (id)contractedResponses;
+ (id)fixedPhrases;
+ (id)localizedStrings;
+ (id)momentsPhrases;
+ (id)polarTagKeywords;
+ (id)sensitiveSubjectRegularExpressionPatterns;
+ (id)synonyms;
- (RKAssets)init;
- (RKAssets)initWithPlistURL:(id)a3;
@end

@implementation RKAssets

- (RKAssets)init
{
  v5.receiver = self;
  v5.super_class = (Class)RKAssets;
  v2 = [(RKAssets *)&v5 init];
  if (v2)
  {
    v3 = (void *)plistURL;
    plistURL = 0;
  }
  return v2;
}

- (RKAssets)initWithPlistURL:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RKAssets;
  v6 = [(RKAssets *)&v8 init];
  if (v6) {
    objc_storeStrong((id *)&plistURL, a3);
  }

  return v6;
}

+ (id)constantClasses
{
  return &unk_26C8EFA70;
}

+ (id)categoryKeywordMap
{
  v2 = [a1 constantClasses];
  v3 = [v2 objectForKeyedSubscript:@"categoryClassifiersByLanguageAndScript"];

  return v3;
}

+ (id)fixedPhrases
{
  v2 = [a1 constantClasses];
  v3 = [v2 objectForKeyedSubscript:@"fixedPhrasesByLanguageAndScript"];

  return v3;
}

+ (id)momentsPhrases
{
  v2 = [a1 constantClasses];
  v3 = [v2 objectForKeyedSubscript:@"fullScreenMomentsKeywordsByLanguageAndScript"];

  return v3;
}

+ (id)synonyms
{
  v2 = [a1 constantClasses];
  v3 = [v2 objectForKeyedSubscript:@"synonymsByLanguageID"];

  return v3;
}

+ (id)sensitiveSubjectRegularExpressionPatterns
{
  v2 = [a1 constantClasses];
  v3 = [v2 objectForKeyedSubscript:@"sensitiveSubjectRegularExpressionPatternsByLanguageCode"];

  return v3;
}

+ (id)polarTagKeywords
{
  v2 = [a1 constantClasses];
  v3 = [v2 objectForKeyedSubscript:@"polarTagKeywordsByLanguageCode"];

  return v3;
}

+ (id)contractedResponses
{
  v2 = [a1 constantClasses];
  v3 = [v2 objectForKeyedSubscript:@"contractedResponseByLanguageCode"];

  return v3;
}

+ (id)alternativeInversions
{
  v2 = [a1 constantClasses];
  v3 = [v2 objectForKeyedSubscript:@"alternativeInversionsByLanguageCode"];

  return v3;
}

+ (id)localizedStrings
{
  v2 = [a1 constantClasses];
  v3 = [v2 objectForKeyedSubscript:@"localizedStringsByLanguageID"];

  return v3;
}

+ (id)appreciationKeywords
{
  v2 = [a1 constantClasses];
  v3 = [v2 objectForKeyedSubscript:@"appreciationKeywordsByLanguageCode"];

  return v3;
}

@end