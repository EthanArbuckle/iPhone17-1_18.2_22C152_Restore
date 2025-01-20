@interface DebugItem
- (DebugItem)initWithTitle:(id)a3 target:(id)a4 action:(SEL)a5;
- (NSString)title;
- (SEL)action;
- (id)target;
- (void)dealloc;
@end

@implementation DebugItem

- (DebugItem)initWithTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  v11.receiver = self;
  v11.super_class = (Class)DebugItem;
  v8 = [(DebugItem *)&v11 init];
  if (v8)
  {
    v8->_title = (NSString *)[a3 copy];
    v8->_target = a4;
    if (a5) {
      SEL v9 = a5;
    }
    else {
      SEL v9 = 0;
    }
    v8->_action = v9;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DebugItem;
  [(DebugItem *)&v3 dealloc];
}

- (NSString)title
{
  return self->_title;
}

- (id)target
{
  return self->_target;
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

@end