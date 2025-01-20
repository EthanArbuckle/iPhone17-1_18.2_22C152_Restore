@interface WFAddButtonParameterStateUpdate
- (NSString)parameterKey;
- (WFAddButtonParameterStateUpdate)initWithParameterKey:(id)a3 parameterState:(id)a4;
- (WFParameterState)parameterState;
@end

@implementation WFAddButtonParameterStateUpdate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterState, 0);
  objc_storeStrong((id *)&self->_parameterKey, 0);
}

- (WFParameterState)parameterState
{
  return self->_parameterState;
}

- (NSString)parameterKey
{
  return self->_parameterKey;
}

- (WFAddButtonParameterStateUpdate)initWithParameterKey:(id)a3 parameterState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFAddButtonParameterStateUpdate;
  v8 = [(WFAddButtonParameterStateUpdate *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    parameterKey = v8->_parameterKey;
    v8->_parameterKey = (NSString *)v9;

    objc_storeStrong((id *)&v8->_parameterState, a4);
    v11 = v8;
  }

  return v8;
}

@end