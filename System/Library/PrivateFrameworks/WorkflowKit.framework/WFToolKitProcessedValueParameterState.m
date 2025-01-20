@interface WFToolKitProcessedValueParameterState
+ (Class)processingValueClass;
- (BOOL)isEqual:(id)a3;
- (NSArray)containedVariables;
- (WFPropertyListObject)serializedRepresentation;
- (WFToolKitProcessedValueParameterState)initWithProcessedValue:(id)a3;
- (id)processedValue;
- (unint64_t)hash;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
- (void)setProcessedValue:(id)a3;
@end

@implementation WFToolKitProcessedValueParameterState

- (void).cxx_destruct
{
}

- (void)setProcessedValue:(id)a3
{
}

- (id)processedValue
{
  return self->_processedValue;
}

- (WFPropertyListObject)serializedRepresentation
{
  return 0;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v7 = a5;
  id v8 = [(WFToolKitProcessedValueParameterState *)self processedValue];
  (*((void (**)(id, id, void))a5 + 2))(v7, v8, 0);
}

- (unint64_t)hash
{
  v2 = [(WFToolKitProcessedValueParameterState *)self processedValue];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSArray)containedVariables
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;
  id v7 = [(WFToolKitProcessedValueParameterState *)self processedValue];
  id v8 = [v6 processedValue];

  id v9 = v7;
  id v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {
    char v12 = 1;
  }
  else
  {
    char v12 = 0;
    if (v9 && v10) {
      char v12 = [v9 isEqual:v10];
    }
  }

  return v12;
}

- (WFToolKitProcessedValueParameterState)initWithProcessedValue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFToolKitProcessedValueParameterState;
  id v6 = [(WFToolKitProcessedValueParameterState *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_processedValue, a3);
    id v8 = v7;
  }

  return v7;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end