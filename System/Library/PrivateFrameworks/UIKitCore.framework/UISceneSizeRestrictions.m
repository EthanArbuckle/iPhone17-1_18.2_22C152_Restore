@interface UISceneSizeRestrictions
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)allowsFullScreen;
- (CGSize)maximumSize;
- (CGSize)minimumSize;
- (id)_initWithScene:(id)a3;
- (void)setAllowsFullScreen:(BOOL)allowsFullScreen;
- (void)setMaximumSize:(CGSize)maximumSize;
- (void)setMinimumSize:(CGSize)minimumSize;
@end

@implementation UISceneSizeRestrictions

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 isEqualToString:@"contentSize"] & 1) == 0
    && ![v3 isEqualToString:@"windowOrigin"];

  return v4;
}

- (id)_initWithScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UISceneSizeRestrictions;
  v5 = [(UISceneSizeRestrictions *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    *(_WORD *)&v6->_hasAutomaticMinimumSize = 257;
  }

  return v6;
}

- (void)setMinimumSize:(CGSize)minimumSize
{
  self->_hasAutomaticMinimumSize = 0;
  self->_minimumSize = minimumSize;
}

- (void)setMaximumSize:(CGSize)maximumSize
{
  self->_hasAutomaticMaximumSize = 0;
  self->_maximumSize = maximumSize;
}

- (CGSize)minimumSize
{
  double width = self->_minimumSize.width;
  double height = self->_minimumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)maximumSize
{
  double width = self->_maximumSize.width;
  double height = self->_maximumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)allowsFullScreen
{
  return self->_allowsFullScreen;
}

- (void)setAllowsFullScreen:(BOOL)allowsFullScreen
{
  self->_allowsFullScreen = allowsFullScreen;
}

- (void).cxx_destruct
{
}

@end