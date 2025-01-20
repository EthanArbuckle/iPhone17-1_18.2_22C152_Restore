@interface FCNewsTabiRecommendedTagsContextConfiguration
- (FCNewsTabiRecommendedTagsContextConfiguration)init;
- (FCNewsTabiRecommendedTagsContextConfiguration)initWithDictionary:(id)a3;
- (id)description;
- (int64_t)maximumTagCount;
- (void)setMaximumTagCount:(int64_t)a3;
@end

@implementation FCNewsTabiRecommendedTagsContextConfiguration

- (FCNewsTabiRecommendedTagsContextConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FCNewsTabiRecommendedTagsContextConfiguration;
  v5 = [(FCNewsTabiRecommendedTagsContextConfiguration *)&v8 init];
  if (v5)
  {
    v6 = FCAppConfigurationNumberValue(v4, @"maximumTagCount", &unk_1EF8D7698);
    v5->_maximumTagCount = [v6 integerValue];
  }
  return v5;
}

- (FCNewsTabiRecommendedTagsContextConfiguration)init
{
  return [(FCNewsTabiRecommendedTagsContextConfiguration *)self initWithDictionary:0];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"\n\tmaximumTagCount: %ld;",
    [(FCNewsTabiRecommendedTagsContextConfiguration *)self maximumTagCount]);
  [v3 appendString:@"\n>"];
  return v3;
}

- (int64_t)maximumTagCount
{
  return self->_maximumTagCount;
}

- (void)setMaximumTagCount:(int64_t)a3
{
  self->_maximumTagCount = a3;
}

@end