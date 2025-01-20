@interface TUIAXCustomAction
- (BOOL)isDefault;
- (BOOL)isReference;
- (NSString)label;
- (NSString)refId;
- (NSString)trigger;
- (TUIAXCustomAction)initWithRefId:(id)a3 trigger:(id)a4;
- (TUIAXCustomAction)initWithTrigger:(id)a3 actionData:(id)a4 actionObject:(id)a5 actionDelegate:(id)a6 controlIdentifier:(id)a7;
- (TUIActionHandlerDelegate)actionDelegate;
- (TUIElementBehaviorArgumentsMap)actionData;
- (TUIIdentifier)controlIdentifier;
- (id)actionObject;
- (id)copyFromReference:(id)a3;
- (id)dereferenceByCollector:(id)a3;
- (void)invokeWithArguments:(id)a3;
- (void)setControlIdentifier:(id)a3;
- (void)setIsDefault:(BOOL)a3;
- (void)setLabel:(id)a3;
@end

@implementation TUIAXCustomAction

- (TUIAXCustomAction)initWithTrigger:(id)a3 actionData:(id)a4 actionObject:(id)a5 actionDelegate:(id)a6 controlIdentifier:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TUIAXCustomAction;
  v18 = [(TUIAXCustomAction *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_trigger, a3);
    objc_storeStrong((id *)&v19->_actionData, a4);
    objc_storeWeak((id *)&v19->_actionDelegate, v16);
    objc_storeStrong(&v19->_actionObject, a5);
    objc_storeStrong((id *)&v19->_controlIdentifier, a7);
  }

  return v19;
}

- (TUIAXCustomAction)initWithRefId:(id)a3 trigger:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIAXCustomAction;
  v9 = [(TUIAXCustomAction *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_refId, a3);
    objc_storeStrong((id *)&v10->_trigger, a4);
  }

  return v10;
}

- (id)copyFromReference:(id)a3
{
  id v4 = a3;
  v5 = [TUIAXCustomAction alloc];
  v6 = [v4 trigger];
  id v7 = [v4 actionData];
  id v8 = [v4 actionObject];
  v9 = [v4 actionDelegate];
  v10 = [v4 controlIdentifier];

  v11 = [(TUIAXCustomAction *)v5 initWithTrigger:v6 actionData:v7 actionObject:v8 actionDelegate:v9 controlIdentifier:v10];
  objc_super v12 = [(TUIAXCustomAction *)self label];
  [(TUIAXCustomAction *)v11 setLabel:v12];

  [(TUIAXCustomAction *)v11 setIsDefault:[(TUIAXCustomAction *)self isDefault]];
  return v11;
}

- (id)dereferenceByCollector:(id)a3
{
  trigger = (__CFString *)self->_trigger;
  if (!trigger) {
    trigger = @"press";
  }
  v6 = trigger;
  id v7 = [a3 customActionByRefIdAndTrigger];
  id v8 = [v7 objectForKeyedSubscript:self->_refId];
  v9 = [v8 objectForKeyedSubscript:v6];

  return v9;
}

- (BOOL)isReference
{
  return self->_refId != 0;
}

- (void)invokeWithArguments:(id)a3
{
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  if (WeakRetained)
  {
    v5 = self->_actionData;
    v6 = [(TUIElementBehaviorArgumentsMap *)v5 arguments];
    id v7 = [v6 dictionaryByAddingEntriesFromDictionary:v10];

    id v8 = [(TUIElementBehaviorArgumentsMap *)v5 behavior];
    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_actionDelegate);
      [v9 handleActionForObject:self->_actionObject withName:v8 arguments:v7];
    }
  }
}

- (NSString)refId
{
  return self->_refId;
}

- (NSString)trigger
{
  return self->_trigger;
}

- (TUIElementBehaviorArgumentsMap)actionData
{
  return self->_actionData;
}

- (id)actionObject
{
  return self->_actionObject;
}

- (TUIActionHandlerDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (TUIActionHandlerDelegate *)WeakRetained;
}

- (TUIIdentifier)controlIdentifier
{
  return self->_controlIdentifier;
}

- (void)setControlIdentifier:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void)setIsDefault:(BOOL)a3
{
  self->_isDefault = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_controlIdentifier, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong(&self->_actionObject, 0);
  objc_storeStrong((id *)&self->_actionData, 0);
  objc_storeStrong((id *)&self->_trigger, 0);

  objc_storeStrong((id *)&self->_refId, 0);
}

@end