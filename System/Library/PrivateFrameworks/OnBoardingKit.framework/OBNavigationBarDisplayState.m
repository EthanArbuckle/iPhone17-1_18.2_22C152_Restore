@interface OBNavigationBarDisplayState
+ (id)displayStateForNavigationBar:(id)a3;
- (OBNavigationBarDisplayState)initWithNavigationBar:(id)a3;
- (double)backgroundOpacity;
- (double)titleOpacity;
- (void)applyState:(id)a3;
- (void)setBackgroundOpacity:(double)a3;
- (void)setTitleOpacity:(double)a3;
@end

@implementation OBNavigationBarDisplayState

- (OBNavigationBarDisplayState)initWithNavigationBar:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OBNavigationBarDisplayState;
  v5 = [(OBNavigationBarDisplayState *)&v9 init];
  if (v5)
  {
    [v4 _titleOpacity];
    v5->_titleOpacity = v6;
    [v4 _backgroundOpacity];
    v5->_backgroundOpacity = v7;
  }

  return v5;
}

- (void)applyState:(id)a3
{
  id v4 = a3;
  [(OBNavigationBarDisplayState *)self titleOpacity];
  objc_msgSend(v4, "_setTitleOpacity:");
  [(OBNavigationBarDisplayState *)self backgroundOpacity];
  objc_msgSend(v4, "_setBackgroundOpacity:");
}

+ (id)displayStateForNavigationBar:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithNavigationBar:v4];

  return v5;
}

- (double)backgroundOpacity
{
  return self->_backgroundOpacity;
}

- (void)setBackgroundOpacity:(double)a3
{
  self->_backgroundOpacity = a3;
}

- (double)titleOpacity
{
  return self->_titleOpacity;
}

- (void)setTitleOpacity:(double)a3
{
  self->_titleOpacity = a3;
}

@end