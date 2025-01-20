@interface FCNewsPersonalizationFeatureConfiguration
+ (int64_t)defaultArticleLengthLongThreshold;
+ (int64_t)defaultArticleLengthMediumThreshold;
+ (int64_t)defaultPublisherTopicPairPublisherEventCountThreshold;
+ (int64_t)defaultPublisherTopicPairTopicEventCountThreshold;
- (FCNewsPersonalizationFeatureConfiguration)initWithDictionary:(id)a3;
- (id)description;
- (int64_t)articleLengthLongThreshold;
- (int64_t)articleLengthMediumThreshold;
- (int64_t)publisherTopicPairPublisherEventCountThreshold;
- (int64_t)publisherTopicPairTopicEventCountThreshold;
- (void)setArticleLengthLongThreshold:(int64_t)a3;
- (void)setArticleLengthMediumThreshold:(int64_t)a3;
- (void)setPublisherTopicPairPublisherEventCountThreshold:(int64_t)a3;
- (void)setPublisherTopicPairTopicEventCountThreshold:(int64_t)a3;
@end

@implementation FCNewsPersonalizationFeatureConfiguration

- (FCNewsPersonalizationFeatureConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCNewsPersonalizationFeatureConfiguration;
  v5 = [(FCNewsPersonalizationFeatureConfiguration *)&v7 init];
  if (v5)
  {
    v5->_articleLengthMediumThreshold = FCAppConfigurationPositiveIntegerValue(v4, @"articleLengthMediumThreshold", +[FCNewsPersonalizationFeatureConfiguration defaultArticleLengthMediumThreshold]);
    v5->_articleLengthLongThreshold = FCAppConfigurationPositiveIntegerValue(v4, @"articleLengthLongThreshold", +[FCNewsPersonalizationFeatureConfiguration defaultArticleLengthLongThreshold]);
    v5->_publisherTopicPairPublisherEventCountThreshold = FCAppConfigurationPositiveIntegerValue(v4, @"publisherTopicPairPublisherEventCountThreshold", +[FCNewsPersonalizationFeatureConfiguration defaultPublisherTopicPairPublisherEventCountThreshold]);
    v5->_publisherTopicPairTopicEventCountThreshold = FCAppConfigurationPositiveIntegerValue(v4, @"publisherTopicPairTopicEventCountThreshold", +[FCNewsPersonalizationFeatureConfiguration defaultPublisherTopicPairTopicEventCountThreshold]);
  }

  return v5;
}

+ (int64_t)defaultPublisherTopicPairTopicEventCountThreshold
{
  return 5;
}

+ (int64_t)defaultPublisherTopicPairPublisherEventCountThreshold
{
  return 5;
}

+ (int64_t)defaultArticleLengthMediumThreshold
{
  return 300;
}

+ (int64_t)defaultArticleLengthLongThreshold
{
  return 1000;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"; articleLengthMediumThreshold: %lu",
    [(FCNewsPersonalizationFeatureConfiguration *)self articleLengthMediumThreshold]);
  objc_msgSend(v3, "appendFormat:", @"; articleLengthLongThreshold: %lu",
    [(FCNewsPersonalizationFeatureConfiguration *)self articleLengthLongThreshold]);
  objc_msgSend(v3, "appendFormat:", @"; publisherTopicPairPublisherEventCountThreshold: %lu",
    [(FCNewsPersonalizationFeatureConfiguration *)self publisherTopicPairPublisherEventCountThreshold]);
  objc_msgSend(v3, "appendFormat:", @"; publisherTopicPairTopicEventCountThreshold: %lu",
    [(FCNewsPersonalizationFeatureConfiguration *)self publisherTopicPairTopicEventCountThreshold]);
  [v3 appendString:@">"];
  return v3;
}

- (int64_t)articleLengthMediumThreshold
{
  return self->_articleLengthMediumThreshold;
}

- (void)setArticleLengthMediumThreshold:(int64_t)a3
{
  self->_articleLengthMediumThreshold = a3;
}

- (int64_t)articleLengthLongThreshold
{
  return self->_articleLengthLongThreshold;
}

- (void)setArticleLengthLongThreshold:(int64_t)a3
{
  self->_articleLengthLongThreshold = a3;
}

- (int64_t)publisherTopicPairPublisherEventCountThreshold
{
  return self->_publisherTopicPairPublisherEventCountThreshold;
}

- (void)setPublisherTopicPairPublisherEventCountThreshold:(int64_t)a3
{
  self->_publisherTopicPairPublisherEventCountThreshold = a3;
}

- (int64_t)publisherTopicPairTopicEventCountThreshold
{
  return self->_publisherTopicPairTopicEventCountThreshold;
}

- (void)setPublisherTopicPairTopicEventCountThreshold:(int64_t)a3
{
  self->_publisherTopicPairTopicEventCountThreshold = a3;
}

@end