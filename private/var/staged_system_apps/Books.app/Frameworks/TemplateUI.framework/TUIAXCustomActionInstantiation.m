@interface TUIAXCustomActionInstantiation
- (BOOL)invoke;
- (TUIAXCustomAction)customAction;
- (TUIAXCustomActionInstantiation)initWithCustomAction:(id)a3 arguments:(id)a4 axElement:(id)a5;
- (TUIAXElement)triggerAXElement;
- (TUIElementBehaviorArgumentsMap)additionalArguments;
@end

@implementation TUIAXCustomActionInstantiation

- (TUIAXCustomActionInstantiation)initWithCustomAction:(id)a3 arguments:(id)a4 axElement:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUIAXCustomActionInstantiation;
  v12 = [(TUIAXCustomActionInstantiation *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_customAction, a3);
    objc_storeStrong((id *)&v13->_additionalArguments, a4);
    objc_storeWeak((id *)&v13->_triggerAXElement, v11);
  }

  return v13;
}

- (BOOL)invoke
{
  v3 = [(TUIElementBehaviorArgumentsMap *)self->_additionalArguments arguments];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_triggerAXElement);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = [v3 objectForKeyedSubscript:@"sourceView"];

    if (!v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_triggerAXElement);
      v8 = [(TUIAXCustomAction *)self->_customAction controlIdentifier];
      id v9 = [v7 controlViewForOverrideIdentifier:v8];

      if (v9)
      {
        id v10 = [(TUIElementBehaviorArgumentsMap *)self->_additionalArguments mutableCopy];
        id v11 = v10;
        if (v10) {
          id v12 = v10;
        }
        else {
          id v12 = (id)objc_opt_new();
        }
        v13 = v12;

        [v13 setObject:v9 forKeyedSubscript:@"sourceView"];
        v3 = v13;
      }
    }
  }
  [(TUIAXCustomAction *)self->_customAction invokeWithArguments:v3];

  return 1;
}

- (TUIAXCustomAction)customAction
{
  return self->_customAction;
}

- (TUIElementBehaviorArgumentsMap)additionalArguments
{
  return self->_additionalArguments;
}

- (TUIAXElement)triggerAXElement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_triggerAXElement);

  return (TUIAXElement *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_triggerAXElement);
  objc_storeStrong((id *)&self->_additionalArguments, 0);

  objc_storeStrong((id *)&self->_customAction, 0);
}

@end