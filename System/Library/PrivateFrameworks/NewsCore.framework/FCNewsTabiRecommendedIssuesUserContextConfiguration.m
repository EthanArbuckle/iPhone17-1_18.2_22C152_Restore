@interface FCNewsTabiRecommendedIssuesUserContextConfiguration
- (FCNewsTabiRecommendedIssuesUserContextConfiguration)init;
- (FCNewsTabiRecommendedIssuesUserContextConfiguration)initWithDictionary:(id)a3;
- (FCNewsTabiRecommendedIssuesUserContextConfiguration)initWithMaximumTagCount:(int64_t)a3 maximumTopicTagsPerHeadline:(int64_t)a4;
- (id)description;
- (int64_t)maximumTagCount;
- (int64_t)maximumTopicTagsPerHeadline;
- (void)setMaximumTagCount:(int64_t)a3;
- (void)setMaximumTopicTagsPerHeadline:(int64_t)a3;
@end

@implementation FCNewsTabiRecommendedIssuesUserContextConfiguration

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"\n\tmaximumTagCount: %lu;",
    [(FCNewsTabiRecommendedIssuesUserContextConfiguration *)self maximumTagCount]);
  objc_msgSend(v3, "appendFormat:", @"\n\tmaximumTopicTagsPerHeadline: %lu;",
    [(FCNewsTabiRecommendedIssuesUserContextConfiguration *)self maximumTopicTagsPerHeadline]);
  [v3 appendString:@"\n>"];
  return v3;
}

- (FCNewsTabiRecommendedIssuesUserContextConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCNewsTabiRecommendedIssuesUserContextConfiguration;
  v5 = [(FCNewsTabiRecommendedIssuesUserContextConfiguration *)&v9 init];
  if (v5)
  {
    v6 = FCAppConfigurationNumberValue(v4, @"maximumTagCount", &unk_1EF8D87F0);
    v5->_maximumTagCount = [v6 integerValue];

    v7 = FCAppConfigurationNumberValue(v4, @"maximumTopicTagsPerHeadline", &unk_1EF8D8808);
    v5->_maximumTopicTagsPerHeadline = [v7 integerValue];
  }
  return v5;
}

- (int64_t)maximumTopicTagsPerHeadline
{
  return self->_maximumTopicTagsPerHeadline;
}

- (int64_t)maximumTagCount
{
  return self->_maximumTagCount;
}

- (FCNewsTabiRecommendedIssuesUserContextConfiguration)init
{
  return [(FCNewsTabiRecommendedIssuesUserContextConfiguration *)self initWithDictionary:0];
}

- (FCNewsTabiRecommendedIssuesUserContextConfiguration)initWithMaximumTagCount:(int64_t)a3 maximumTopicTagsPerHeadline:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)FCNewsTabiRecommendedIssuesUserContextConfiguration;
  result = [(FCNewsTabiRecommendedIssuesUserContextConfiguration *)&v7 init];
  if (result)
  {
    result->_maximumTagCount = a3;
    result->_maximumTopicTagsPerHeadline = a4;
  }
  return result;
}

- (void)setMaximumTagCount:(int64_t)a3
{
  self->_maximumTagCount = a3;
}

- (void)setMaximumTopicTagsPerHeadline:(int64_t)a3
{
  self->_maximumTopicTagsPerHeadline = a3;
}

@end