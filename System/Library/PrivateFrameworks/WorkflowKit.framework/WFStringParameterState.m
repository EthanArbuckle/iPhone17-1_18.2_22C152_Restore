@interface WFStringParameterState
+ (Class)processingValueClass;
- (BOOL)isEqual:(id)a3;
- (NSArray)containedVariables;
- (NSString)string;
- (WFStringParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFStringParameterState)initWithString:(id)a3;
- (unint64_t)hash;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFStringParameterState

- (void).cxx_destruct
{
}

- (NSString)string
{
  return self->_string;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v7 = a5;
  id v8 = [(WFStringParameterState *)self string];
  (*((void (**)(id, id, void))a5 + 2))(v7, v8, 0);
}

- (NSArray)containedVariables
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (unint64_t)hash
{
  v2 = [(WFStringParameterState *)self string];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFStringParameterState *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFStringParameterState *)v4 string];
      v6 = [(WFStringParameterState *)self string];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (WFStringParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self = [(WFStringParameterState *)self initWithString:v6];
    char v7 = self;
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (WFStringParameterState)initWithString:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFStringParameterState.m", 16, @"Invalid parameter not satisfying: %@", @"string" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFStringParameterState;
  id v6 = [(WFStringParameterState *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    string = v6->_string;
    v6->_string = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end