@interface WFMediaPickerParameter
- (BOOL)parameterStateIsValid:(id)a3;
- (Class)singleStateClass;
- (WFAction)action;
- (id)localizedLabelForState:(id)a3;
- (void)setAction:(id)a3;
@end

@implementation WFMediaPickerParameter

- (void).cxx_destruct
{
}

- (WFAction)action
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  return (WFAction *)WeakRetained;
}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v4 = a3;
  v5 = [v4 variable];

  if (v5)
  {
    v8.receiver = self;
    v8.super_class = (Class)WFMediaPickerParameter;
    BOOL v6 = [(WFParameter *)&v8 parameterStateIsValid:v4];
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (id)localizedLabelForState:(id)a3
{
  v3 = [a3 value];
  id v4 = [v3 itemName];

  return v4;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (void)setAction:(id)a3
{
  id obj = a3;
  p_action = &self->_action;
  id WeakRetained = objc_loadWeakRetained((id *)p_action);

  BOOL v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_action, obj);
    BOOL v6 = obj;
  }
}

@end