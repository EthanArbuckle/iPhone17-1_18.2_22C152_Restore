@interface WFNumberParameterState
+ (Class)processingValueClass;
- (BOOL)isEqual:(id)a3;
- (NSArray)containedVariables;
- (NSNumber)number;
- (WFNumberParameterState)initWithNumber:(id)a3;
- (WFNumberParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (unint64_t)hash;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFNumberParameterState

- (void).cxx_destruct
{
}

- (NSNumber)number
{
  return self->_number;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v7 = a5;
  id v8 = [(WFNumberParameterState *)self number];
  (*((void (**)(id, id, void))a5 + 2))(v7, v8, 0);
}

- (NSArray)containedVariables
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (unint64_t)hash
{
  v2 = [(WFNumberParameterState *)self number];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFNumberParameterState *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFNumberParameterState *)v4 number];
      v6 = [(WFNumberParameterState *)self number];
      char v7 = [v5 isEqualToNumber:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (WFNumberParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self = [(WFNumberParameterState *)self initWithNumber:v6];
    char v7 = self;
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (WFNumberParameterState)initWithNumber:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFNumberParameterState.m", 16, @"Invalid parameter not satisfying: %@", @"number != nil" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFNumberParameterState;
  char v7 = [(WFNumberParameterState *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_number, a3);
    v9 = v8;
  }

  return v8;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end