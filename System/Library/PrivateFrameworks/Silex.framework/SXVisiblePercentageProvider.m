@interface SXVisiblePercentageProvider
- (SXVisiblePercentageProvider)initWithVisiblePercentage:(double)a3;
- (double)visiblePercentage;
- (void)setVisiblePercentage:(double)a3;
@end

@implementation SXVisiblePercentageProvider

- (SXVisiblePercentageProvider)initWithVisiblePercentage:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXVisiblePercentageProvider;
  result = [(SXVisiblePercentageProvider *)&v5 init];
  if (result) {
    result->_visiblePercentage = a3;
  }
  return result;
}

- (double)visiblePercentage
{
  return self->_visiblePercentage;
}

- (void)setVisiblePercentage:(double)a3
{
  self->_visiblePercentage = a3;
}

@end