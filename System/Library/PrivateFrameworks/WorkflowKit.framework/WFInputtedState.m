@interface WFInputtedState
- (NSString)parameterKey;
- (WFInputtedState)initWithParameterKey:(id)a3 parameterState:(id)a4;
- (WFParameterState)parameterState;
- (void)setParameterKey:(id)a3;
- (void)setParameterState:(id)a3;
@end

@implementation WFInputtedState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterState, 0);
  objc_storeStrong((id *)&self->_parameterKey, 0);
}

- (void)setParameterState:(id)a3
{
}

- (WFParameterState)parameterState
{
  return self->_parameterState;
}

- (void)setParameterKey:(id)a3
{
}

- (NSString)parameterKey
{
  return self->_parameterKey;
}

- (WFInputtedState)initWithParameterKey:(id)a3 parameterState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFInputtedState;
  v8 = [(WFInputtedState *)&v13 init];
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