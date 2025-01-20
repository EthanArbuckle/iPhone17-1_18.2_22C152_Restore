@interface WFParameterValueWrapper
- (NSString)readableTitle;
- (WFParameterState)value;
- (WFParameterValuePickable)parameter;
- (WFParameterValueWrapper)initWithValue:(id)a3 parameter:(id)a4;
@end

@implementation WFParameterValueWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (WFParameterValuePickable)parameter
{
  return self->_parameter;
}

- (WFParameterState)value
{
  return self->_value;
}

- (NSString)readableTitle
{
  v3 = [(WFParameterValueWrapper *)self parameter];
  v4 = [(WFParameterValueWrapper *)self value];
  v5 = objc_msgSend(v3, "wf_pickerLocalizedTitleForState:", v4);

  return (NSString *)v5;
}

- (WFParameterValueWrapper)initWithValue:(id)a3 parameter:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFParameterValuePickerDataSource.m", 29, @"Invalid parameter not satisfying: %@", @"value" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFParameterValuePickerDataSource.m", 30, @"Invalid parameter not satisfying: %@", @"parameter" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFParameterValueWrapper;
  v11 = [(WFParameterValueWrapper *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_value, a3);
    objc_storeStrong((id *)&v12->_parameter, a4);
    v13 = v12;
  }

  return v12;
}

@end