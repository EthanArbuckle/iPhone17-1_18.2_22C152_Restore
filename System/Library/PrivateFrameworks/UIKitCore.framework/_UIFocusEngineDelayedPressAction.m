@interface _UIFocusEngineDelayedPressAction
+ (void)sendDelayedPressWithType:(int64_t)a3 timestamp:(double)a4 sender:(id)a5;
- (_UIFocusEventRecognizer)sender;
- (double)timestamp;
- (id)_initWithPressType:(int64_t)a3 timestamp:(double)a4 sender:(id)a5;
- (int64_t)pressType;
- (void)_sendPressEvent;
@end

@implementation _UIFocusEngineDelayedPressAction

- (id)_initWithPressType:(int64_t)a3 timestamp:(double)a4 sender:(id)a5
{
  id v9 = a5;
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_UIFocusEventRecognizer.m", 3499, @"Invalid parameter not satisfying: %@", @"sender" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)_UIFocusEngineDelayedPressAction;
  v10 = [(_UIFocusEngineDelayedPressAction *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_sender, v9);
    v11->_pressType = a3;
    v11->_timestamp = a4;
  }

  return v11;
}

+ (void)sendDelayedPressWithType:(int64_t)a3 timestamp:(double)a4 sender:(id)a5
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = [[_UIFocusEngineDelayedPressAction alloc] _initWithPressType:a3 timestamp:v7 sender:a4];

  v10[0] = *MEMORY[0x1E4F1C4B0];
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v8 performSelector:sel__sendPressEvent withObject:0 afterDelay:v9 inModes:0.0];
}

- (void)_sendPressEvent
{
  uint64_t v3 = [(_UIFocusEngineDelayedPressAction *)self sender];
  if (v3)
  {
    v15 = (UIPressInfo *)v3;
    v4 = [(_UIFocusEngineDelayedPressAction *)self sender];
    v5 = [v4 owningView];
    v6 = [v5 _window];
    if ([v6 _contextId])
    {
      id v7 = [(_UIFocusEngineDelayedPressAction *)self sender];
      id v8 = [v7 owningView];
      id v9 = [v8 _window];
      v10 = [v9 windowScene];

      if (!v10) {
        return;
      }
      v15 = objc_alloc_init(UIPressInfo);
      [(UIPressInfo *)v15 setType:[(_UIFocusEngineDelayedPressAction *)self pressType]];
      [(_UIFocusEngineDelayedPressAction *)self timestamp];
      -[UIPressInfo setTimestamp:](v15, "setTimestamp:");
      [(UIPressInfo *)v15 setSource:3];
      v11 = [(_UIFocusEngineDelayedPressAction *)self sender];
      v4 = [v11 owningView];

      v12 = [(_UIFocusEngineDelayedPressAction *)self sender];
      v13 = [v12 owningView];
      objc_super v14 = [v13 _window];
      -[UIPressInfo setContextID:](v15, "setContextID:", [v14 _contextId]);

      [(UIPressInfo *)v15 setPhase:0];
      [(UIPressInfo *)v15 setForce:1.0];
      [(id)UIApp _sendButtonEventWithPressInfo:v15];
      [(UIPressInfo *)v15 setPhase:3];
      [(UIPressInfo *)v15 setForce:0.0];
      [(id)UIApp _sendButtonEventWithPressInfo:v15];
    }
    else
    {
    }
  }
}

- (_UIFocusEventRecognizer)sender
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sender);
  return (_UIFocusEventRecognizer *)WeakRetained;
}

- (int64_t)pressType
{
  return self->_pressType;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
}

@end