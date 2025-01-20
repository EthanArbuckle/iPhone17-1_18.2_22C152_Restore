@interface PRMutableEditingLookProperties
- (PRMutableEditingLookProperties)initWithTimeFontConfiguration:(id)a3 titlePosterColor:(id)a4;
- (PRPosterColor)titlePosterColor;
- (PRTimeFontConfiguration)timeFontConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setTimeFontConfiguration:(id)a3;
- (void)setTitlePosterColor:(id)a3;
@end

@implementation PRMutableEditingLookProperties

- (PRMutableEditingLookProperties)initWithTimeFontConfiguration:(id)a3 titlePosterColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRMutableEditingLookProperties;
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

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PREditingLookProperties alloc];
  return [(PREditingLookProperties *)v4 initWithProperties:self];
}

- (PRTimeFontConfiguration)timeFontConfiguration
{
  return self->_timeFontConfiguration;
}

- (void)setTimeFontConfiguration:(id)a3
{
}

- (PRPosterColor)titlePosterColor
{
  return self->_titlePosterColor;
}

- (void)setTitlePosterColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titlePosterColor, 0);
  objc_storeStrong((id *)&self->_timeFontConfiguration, 0);
}

@end