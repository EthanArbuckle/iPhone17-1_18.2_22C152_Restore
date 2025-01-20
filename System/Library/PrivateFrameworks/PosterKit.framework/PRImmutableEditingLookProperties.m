@interface PRImmutableEditingLookProperties
- (PRImmutableEditingLookProperties)initWithTimeFontConfiguration:(id)a3 titlePosterColor:(id)a4;
- (id)timeFontConfiguration;
- (id)titlePosterColor;
@end

@implementation PRImmutableEditingLookProperties

- (PRImmutableEditingLookProperties)initWithTimeFontConfiguration:(id)a3 titlePosterColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRImmutableEditingLookProperties;
  v8 = [(PREditingLookProperties *)&v14 initWithTimeFontConfiguration:v6 titlePosterColor:v7];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    timeFontConfiguration = v8->_timeFontConfiguration;
    v8->_timeFontConfiguration = (PRTimeFontConfiguration *)v9;

    uint64_t v11 = [v7 copy];
    titlePosterColor = v8->_titlePosterColor;
    v8->_titlePosterColor = (PRPosterColor *)v11;
  }
  return v8;
}

- (id)timeFontConfiguration
{
  return self->_timeFontConfiguration;
}

- (id)titlePosterColor
{
  return self->_titlePosterColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titlePosterColor, 0);
  objc_storeStrong((id *)&self->_timeFontConfiguration, 0);
}

@end