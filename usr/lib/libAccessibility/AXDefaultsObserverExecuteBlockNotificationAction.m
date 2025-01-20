@interface AXDefaultsObserverExecuteBlockNotificationAction
- (AXDefaultsObserverExecuteBlockNotificationAction)initWithBlock:(id)a3;
- (id)block;
- (void)performForChangedDefault:(id)a3;
- (void)setBlock:(id)a3;
@end

@implementation AXDefaultsObserverExecuteBlockNotificationAction

- (AXDefaultsObserverExecuteBlockNotificationAction)initWithBlock:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXDefaultsObserverExecuteBlockNotificationAction;
  v5 = [(AXDefaultsObserverExecuteBlockNotificationAction *)&v8 init];
  v6 = v5;
  if (v5) {
    [(AXDefaultsObserverExecuteBlockNotificationAction *)v5 setBlock:v4];
  }

  return v6;
}

- (void)performForChangedDefault:(id)a3
{
  id v3 = [(AXDefaultsObserverExecuteBlockNotificationAction *)self block];
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end