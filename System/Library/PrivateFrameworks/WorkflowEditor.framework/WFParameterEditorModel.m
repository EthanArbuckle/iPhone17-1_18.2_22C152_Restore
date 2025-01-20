@interface WFParameterEditorModel
- (BOOL)becomeFirstResponder;
- (NSError)resourceError;
- (WFGradient)buttonGradient;
- (WFParameter)parameter;
- (WFParameterEditorModel)initWithParameter:(id)a3 state:(id)a4;
- (WFParameterEditorModel)initWithParameter:(id)a3 state:(id)a4 widgetFamily:(int64_t)a5;
- (WFParameterEditorModel)initWithResourceError:(id)a3 buttonGradient:(id)a4;
- (WFParameterState)state;
- (int64_t)widgetFamily;
- (void)setBecomeFirstResponder:(BOOL)a3;
@end

@implementation WFParameterEditorModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonGradient, 0);
  objc_storeStrong((id *)&self->_resourceError, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_parameter, 0);
}

- (void)setBecomeFirstResponder:(BOOL)a3
{
  self->_becomeFirstResponder = a3;
}

- (BOOL)becomeFirstResponder
{
  return self->_becomeFirstResponder;
}

- (int64_t)widgetFamily
{
  return self->_widgetFamily;
}

- (WFGradient)buttonGradient
{
  return self->_buttonGradient;
}

- (NSError)resourceError
{
  return self->_resourceError;
}

- (WFParameterState)state
{
  return self->_state;
}

- (WFParameter)parameter
{
  return self->_parameter;
}

- (WFParameterEditorModel)initWithResourceError:(id)a3 buttonGradient:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFParameterEditorHostingCell.mm", 35, @"Invalid parameter not satisfying: %@", @"resourceError" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)WFParameterEditorModel;
  v10 = [(WFParameterEditorModel *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_resourceError, a3);
    objc_storeStrong((id *)&v11->_buttonGradient, a4);
    v12 = v11;
  }

  return v11;
}

- (WFParameterEditorModel)initWithParameter:(id)a3 state:(id)a4 widgetFamily:(int64_t)a5
{
  id v10 = a3;
  id v11 = a4;
  if (!v10)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFParameterEditorHostingCell.mm", 22, @"Invalid parameter not satisfying: %@", @"parameter" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)WFParameterEditorModel;
  v12 = [(WFParameterEditorModel *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_parameter, a3);
    objc_storeStrong((id *)&v13->_state, a4);
    v13->_widgetFamily = a5;
    v14 = v13;
  }

  return v13;
}

- (WFParameterEditorModel)initWithParameter:(id)a3 state:(id)a4
{
  return [(WFParameterEditorModel *)self initWithParameter:a3 state:a4 widgetFamily:3];
}

@end