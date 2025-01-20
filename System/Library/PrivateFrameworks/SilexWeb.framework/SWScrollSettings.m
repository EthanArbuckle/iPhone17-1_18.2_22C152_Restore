@interface SWScrollSettings
- (BOOL)scrollEnabled;
- (BOOL)scrollsToTop;
- (BOOL)showsVerticalScrollIndicator;
- (SWScrollSettings)initWithScrollEnabled:(BOOL)a3 scrollsToTop:(BOOL)a4 showsVerticalScrollIndicator:(BOOL)a5;
@end

@implementation SWScrollSettings

- (SWScrollSettings)initWithScrollEnabled:(BOOL)a3 scrollsToTop:(BOOL)a4 showsVerticalScrollIndicator:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SWScrollSettings;
  result = [(SWScrollSettings *)&v9 init];
  if (result)
  {
    result->_scrollEnabled = a3;
    result->_scrollsToTop = a4;
    result->_showsVerticalScrollIndicator = a5;
  }
  return result;
}

- (BOOL)scrollEnabled
{
  return self->_scrollEnabled;
}

- (BOOL)scrollsToTop
{
  return self->_scrollsToTop;
}

- (BOOL)showsVerticalScrollIndicator
{
  return self->_showsVerticalScrollIndicator;
}

@end