@interface UIRemoteControlEvent
- (id)_allWindows;
- (id)_init;
- (int64_t)subtype;
- (int64_t)type;
- (void)_sendEventToResponder:(id)a3;
- (void)_setSubtype:(int64_t)a3;
- (void)_simpleRemoteActionNotification:(id)a3;
- (void)dealloc;
@end

@implementation UIRemoteControlEvent

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)UIRemoteControlEvent;
  id v2 = [(UIEvent *)&v5 _init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__simpleRemoteActionNotification_ name:@"UIApplicationSimpleRemoteActionNotification" object:UIApp];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIApplicationSimpleRemoteActionNotification" object:UIApp];

  v4.receiver = self;
  v4.super_class = (Class)UIRemoteControlEvent;
  [(UIEvent *)&v4 dealloc];
}

- (int64_t)type
{
  return 2;
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (void)_setSubtype:(int64_t)a3
{
  self->_subtype = a3;
}

- (id)_allWindows
{
  id v2 = [(id)UIApp keyWindow];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_sendEventToResponder:(id)a3
{
}

- (void)_simpleRemoteActionNotification:(id)a3
{
  objc_super v4 = [a3 userInfo];
  objc_super v5 = [v4 objectForKey:@"UIApplicationSimpleRemoteActionType"];
  unint64_t v6 = [v5 integerValue];

  if (v6 <= 0x15 && ((0x3BC0E7u >> v6) & 1) != 0)
  {
    uint64_t v7 = qword_186B9BCF8[v6];
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._eventEnvironment);
    }
    else {
      id WeakRetained = 0;
    }
    id v9 = WeakRetained;
    -[UIEventEnvironment _sendRemoteControlEvent:]((uint64_t)WeakRetained, v7);
  }
}

@end