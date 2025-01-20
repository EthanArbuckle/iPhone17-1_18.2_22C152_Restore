@interface FCNewsTabiChannelPickerSuggestionsUserContextConfiguration
- (FCNewsTabiChannelPickerSuggestionsUserContextConfiguration)init;
- (FCNewsTabiChannelPickerSuggestionsUserContextConfiguration)initWithDictionary:(id)a3;
- (id)description;
- (int64_t)maximumTagCount;
- (int64_t)maximumTopicTagsPerHeadline;
- (void)setMaximumTagCount:(int64_t)a3;
- (void)setMaximumTopicTagsPerHeadline:(int64_t)a3;
@end

@implementation FCNewsTabiChannelPickerSuggestionsUserContextConfiguration

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"\n\tmaximumTagCount: %ld;",
    [(FCNewsTabiChannelPickerSuggestionsUserContextConfiguration *)self maximumTagCount]);
  objc_msgSend(v3, "appendFormat:", @"\n\tmaximumTopicTagsPerHeadline: %ld;",
    [(FCNewsTabiChannelPickerSuggestionsUserContextConfiguration *)self maximumTopicTagsPerHeadline]);
  [v3 appendString:@"\n>"];
  return v3;
}

- (FCNewsTabiChannelPickerSuggestionsUserContextConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCNewsTabiChannelPickerSuggestionsUserContextConfiguration;
  v5 = [(FCNewsTabiChannelPickerSuggestionsUserContextConfiguration *)&v9 init];
  if (v5)
  {
    v6 = FCAppConfigurationNumberValue(v4, @"maximumTagCount", &unk_1EF8D7E90);
    v5->_maximumTagCount = [v6 integerValue];

    v7 = FCAppConfigurationNumberValue(v4, @"maximumTopicTagsPerHeadline", &unk_1EF8D7EA8);
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

- (FCNewsTabiChannelPickerSuggestionsUserContextConfiguration)init
{
  return [(FCNewsTabiChannelPickerSuggestionsUserContextConfiguration *)self initWithDictionary:0];
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