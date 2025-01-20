@interface WFContentItemAction
- (BOOL)inputsMultipleItems;
- (BOOL)outputsMultipleItems;
- (WFContentItemAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5;
- (WFContentProperty)defaultProperty;
- (id)description;
- (id)inputContentClasses;
@end

@implementation WFContentItemAction

- (void).cxx_destruct
{
}

- (BOOL)outputsMultipleItems
{
  return 1;
}

- (BOOL)inputsMultipleItems
{
  return 1;
}

- (id)inputContentClasses
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)WFContentItemAction;
  v3 = [(WFAction *)&v8 inputContentClasses];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)WFContentItemAction;
    v5 = [(WFAction *)&v7 inputContentClasses];
  }
  else
  {
    v9[0] = [(WFAction *)self contentItemClass];
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WFAction *)self identifier];
  objc_super v7 = NSStringFromClass([(WFAction *)self contentItemClass]);
  objc_super v8 = [v3 stringWithFormat:@"<%@: %p, identifier: %@, contentItemClass: %@>", v5, self, v6, v7];

  return v8;
}

- (WFContentProperty)defaultProperty
{
  defaultProperty = self->_defaultProperty;
  if (!defaultProperty)
  {
    uint64_t v4 = [(WFAction *)self contentItemClass];
    v5 = [(WFAction *)self definition];
    v6 = [v5 objectForKey:@"WFContentItemDefaultProperty"];
    objc_super v7 = [(objc_class *)v4 propertyForName:v6];
    objc_super v8 = self->_defaultProperty;
    self->_defaultProperty = v7;

    defaultProperty = self->_defaultProperty;
  }
  return defaultProperty;
}

- (WFContentItemAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 objectForKey:@"WFContentItemClass"];
  v12 = (WFContentItemAction *)NSClassFromString(v11);

  if (v12)
  {
    if ([(WFContentItemAction *)v12 isSubclassOfClass:objc_opt_class()])
    {
      v14.receiver = self;
      v14.super_class = (Class)WFContentItemAction;
      self = [(WFAction *)&v14 initWithIdentifier:v8 definition:v9 serializedParameters:v10];
      v12 = self;
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

@end