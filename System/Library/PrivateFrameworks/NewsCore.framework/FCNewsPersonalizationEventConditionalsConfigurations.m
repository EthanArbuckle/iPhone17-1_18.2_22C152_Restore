@interface FCNewsPersonalizationEventConditionalsConfigurations
- (FCNewsPersonalizationArticleReadEventConditionals)articleReadEventConditionals;
- (FCNewsPersonalizationEventConditionalsConfigurations)initWithDictionary:(id)a3;
- (id)description;
- (void)setArticleReadEventConditionals:(id)a3;
@end

@implementation FCNewsPersonalizationEventConditionalsConfigurations

- (FCNewsPersonalizationEventConditionalsConfigurations)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FCNewsPersonalizationEventConditionalsConfigurations;
  v5 = [(FCNewsPersonalizationEventConditionalsConfigurations *)&v10 init];
  if (v5)
  {
    v6 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"articleRead", 0);
    v7 = [[FCNewsPersonalizationArticleReadEventConditionals alloc] initWithDictionary:v6];
    articleReadEventConditionals = v5->_articleReadEventConditionals;
    v5->_articleReadEventConditionals = v7;
  }
  return v5;
}

- (FCNewsPersonalizationArticleReadEventConditionals)articleReadEventConditionals
{
  return self->_articleReadEventConditionals;
}

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  id v4 = [(FCNewsPersonalizationEventConditionalsConfigurations *)self articleReadEventConditionals];
  [v3 appendFormat:@"; articleReadEventConditionals: %@", v4];

  [v3 appendString:@">"];
  return v3;
}

- (void)setArticleReadEventConditionals:(id)a3
{
}

@end