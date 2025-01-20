@interface TUIFeedRendererOptions
- (TUIFeedRendererOptions)initWithResourceTimeout:(double)a3;
- (double)timeout;
@end

@implementation TUIFeedRendererOptions

- (TUIFeedRendererOptions)initWithResourceTimeout:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TUIFeedRendererOptions;
  result = [(TUIFeedRendererOptions *)&v5 init];
  if (result) {
    result->_timeout = a3;
  }
  return result;
}

- (double)timeout
{
  return self->_timeout;
}

@end