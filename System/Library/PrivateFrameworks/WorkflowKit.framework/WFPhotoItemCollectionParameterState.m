@interface WFPhotoItemCollectionParameterState
+ (id)processingValueClasses;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFPhotoItemCollectionParameterState

+ (id)serializedRepresentationFromValue:(id)a3
{
  return (id)[a3 serializedRepresentation];
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  v7 = (objc_class *)MEMORY[0x1E4F72D10];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v7 alloc] initWithSerializedRepresentation:v10 variableProvider:v9 parameter:v8];

  return v11;
}

+ (id)processingValueClasses
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v10 = a3;
  v7 = (void (**)(id, void *, void))a5;
  id v8 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v8)
  {
    id v9 = [(WFVariableSubstitutableParameterState *)self variable];
    [v9 getContentWithContext:v10 completionHandler:v7];
  }
  else
  {
    id v9 = [(WFVariableSubstitutableParameterState *)self value];
    v7[2](v7, v9, 0);
  }
}

@end