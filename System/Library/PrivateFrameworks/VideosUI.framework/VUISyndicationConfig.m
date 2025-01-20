@interface VUISyndicationConfig
- (VUISyndicationConfig)init;
- (unint64_t)highlightsFetchLimit;
- (void)setHighlightsFetchLimit:(unint64_t)a3;
@end

@implementation VUISyndicationConfig

- (void)setHighlightsFetchLimit:(unint64_t)a3
{
  self->_highlightsFetchLimit = a3;
}

- (VUISyndicationConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUISyndicationConfig;
  result = [(VUISyndicationConfig *)&v3 init];
  if (result) {
    result->_highlightsFetchLimit = 50;
  }
  return result;
}

- (unint64_t)highlightsFetchLimit
{
  return self->_highlightsFetchLimit;
}

@end