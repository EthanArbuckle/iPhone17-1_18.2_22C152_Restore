@interface AXDefaultsObserverPostDarwinNotificationAction
- (AXDefaultsObserverPostDarwinNotificationAction)initWithDarwinNotification:(id)a3 postGlobally:(BOOL)a4;
- (BOOL)shouldPostGlobally;
- (NSString)note;
- (void)performForChangedDefault:(id)a3;
- (void)setNote:(id)a3;
- (void)setShouldPostGlobally:(BOOL)a3;
@end

@implementation AXDefaultsObserverPostDarwinNotificationAction

- (AXDefaultsObserverPostDarwinNotificationAction)initWithDarwinNotification:(id)a3 postGlobally:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AXDefaultsObserverPostDarwinNotificationAction;
  v7 = [(AXDefaultsObserverPostDarwinNotificationAction *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(AXDefaultsObserverPostDarwinNotificationAction *)v7 setNote:v6];
    [(AXDefaultsObserverPostDarwinNotificationAction *)v8 setShouldPostGlobally:v4];
  }

  return v8;
}

- (void)setShouldPostGlobally:(BOOL)a3
{
  self->_shouldPostGlobally = a3;
}

- (void)setNote:(id)a3
{
}

- (void)performForChangedDefault:(id)a3
{
  if (self->_shouldPostGlobally) {
    CFNotificationCenterRef DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  }
  else {
    CFNotificationCenterRef DarwinNotifyCenter = CFNotificationCenterGetLocalCenter();
  }
  v5 = DarwinNotifyCenter;
  id v6 = [(AXDefaultsObserverPostDarwinNotificationAction *)self note];
  CFNotificationCenterPostNotification(v5, v6, 0, 0, 1u);
}

- (NSString)note
{
  return self->_note;
}

- (BOOL)shouldPostGlobally
{
  return self->_shouldPostGlobally;
}

- (void).cxx_destruct
{
}

@end