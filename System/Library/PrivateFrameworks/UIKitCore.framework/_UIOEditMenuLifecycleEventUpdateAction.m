@interface _UIOEditMenuLifecycleEventUpdateAction
- (NSString)menuIdentifier;
- (_UIOEditMenuLifecycleEventUpdateAction)initWithMenuIdentifier:(id)a3 event:(int64_t)a4;
- (id)identifier;
- (int64_t)lifecycleEvent;
- (void)handleClientActionToOverlayService:(id)a3;
@end

@implementation _UIOEditMenuLifecycleEventUpdateAction

- (_UIOEditMenuLifecycleEventUpdateAction)initWithMenuIdentifier:(id)a3 event:(int64_t)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setObject:v6 forSetting:0];

  v8 = [NSNumber numberWithInteger:a4];
  [v7 setObject:v8 forSetting:1];

  v11.receiver = self;
  v11.super_class = (Class)_UIOEditMenuLifecycleEventUpdateAction;
  v9 = [(_UIOEditMenuLifecycleEventUpdateAction *)&v11 initWithInfo:v7 responder:0];

  return v9;
}

- (id)identifier
{
  v2 = [(_UIOEditMenuLifecycleEventUpdateAction *)self info];
  v3 = [v2 objectForSetting:0];

  return v3;
}

- (int64_t)lifecycleEvent
{
  v2 = [(_UIOEditMenuLifecycleEventUpdateAction *)self info];
  v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)handleClientActionToOverlayService:(id)a3
{
  id v7 = a3;
  v5 = [v7 delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v5, "handleLifecycleEvent:", -[_UIOEditMenuLifecycleEventUpdateAction lifecycleEvent](self, "lifecycleEvent"));
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_UIOEditMenuLifecycleEventUpdateAction.m", 47, @"Cannot handle response to unknown overlay service: %@", v7 object file lineNumber description];
  }
}

- (NSString)menuIdentifier
{
  return self->_menuIdentifier;
}

- (void).cxx_destruct
{
}

@end