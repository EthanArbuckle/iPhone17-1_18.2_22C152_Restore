@interface SUScrollRequest
- (BOOL)isAnimated;
- (NSValue)contentOffsetValue;
- (NSValue)frameValue;
- (id)completionHandler;
- (void)dealloc;
- (void)setAnimated:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setContentOffsetValue:(id)a3;
- (void)setFrameValue:(id)a3;
@end

@implementation SUScrollRequest

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScrollRequest;
  [(SUScrollRequest *)&v3 dealloc];
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSValue)contentOffsetValue
{
  return (NSValue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContentOffsetValue:(id)a3
{
}

- (NSValue)frameValue
{
  return (NSValue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFrameValue:(id)a3
{
}

@end