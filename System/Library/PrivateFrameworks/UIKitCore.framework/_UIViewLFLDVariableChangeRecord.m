@interface _UIViewLFLDVariableChangeRecord
- (NSISVariable)variable;
- (UIView)variableDelegate;
- (_UIViewLFLDVariableChangeRecord)initWithVariable:(id)a3 inLayoutEngine:(id)a4;
- (double)value;
- (id)description;
@end

@implementation _UIViewLFLDVariableChangeRecord

- (_UIViewLFLDVariableChangeRecord)initWithVariable:(id)a3 inLayoutEngine:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UIViewLFLDVariableChangeRecord;
  v9 = [(_UIViewLFLDChangeRecord *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_variable, a3);
    [v8 valueForVariable:v7];
    double v12 = v11;
    self;
    v10->_value = v12 / 360.0;
    uint64_t v13 = [v7 delegate];
    variableDelegate = v10->_variableDelegate;
    v10->_variableDelegate = (UIView *)v13;
  }
  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ = %g>", self->_variable, *(void *)&self->_value];
}

- (NSISVariable)variable
{
  return self->_variable;
}

- (double)value
{
  return self->_value;
}

- (UIView)variableDelegate
{
  return self->_variableDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variableDelegate, 0);
  objc_storeStrong((id *)&self->_variable, 0);
}

@end