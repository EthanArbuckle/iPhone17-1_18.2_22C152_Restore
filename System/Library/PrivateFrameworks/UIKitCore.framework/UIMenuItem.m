@interface UIMenuItem
- (BOOL)dontDismiss;
- (NSString)title;
- (SEL)action;
- (UIMenuItem)init;
- (UIMenuItem)initWithTitle:(NSString *)title action:(SEL)action;
- (void)setAction:(SEL)action;
- (void)setDontDismiss:(BOOL)a3;
- (void)setTitle:(NSString *)title;
@end

@implementation UIMenuItem

- (UIMenuItem)init
{
  return [(UIMenuItem *)self initWithTitle:&stru_1ED0E84C0 action:sel_self];
}

- (UIMenuItem)initWithTitle:(NSString *)title action:(SEL)action
{
  v6 = title;
  v10.receiver = self;
  v10.super_class = (Class)UIMenuItem;
  v7 = [(UIMenuItem *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(UIMenuItem *)v7 setTitle:v6];
    [(UIMenuItem *)v8 setAction:action];
  }

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(NSString *)title
{
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)action
{
  self->_action = action;
}

- (BOOL)dontDismiss
{
  return self->_dontDismiss;
}

- (void)setDontDismiss:(BOOL)a3
{
  self->_dontDismiss = a3;
}

- (void).cxx_destruct
{
}

@end