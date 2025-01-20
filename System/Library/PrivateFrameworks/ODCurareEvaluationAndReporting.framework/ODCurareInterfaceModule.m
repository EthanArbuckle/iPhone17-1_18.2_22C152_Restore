@interface ODCurareInterfaceModule
- (BOOL)evaluateModelsWithEvaluationModels:(id)a3 error:(id *)a4;
- (BOOL)personalizeModelsWithPersonalizableModels:(id)a3 personalizationPolicy:(id)a4 error:(id *)a5;
- (ODCurareInterfaceModule)initWithBundleIdentifier:(id)a3 evaluationInstance:(id)a4 personalizationInstance:(id)a5 pruningPolicy:(id)a6 error:(id *)a7;
- (ODCurareInterfaceModuleInternal)underlyingObject;
- (id)getSelectedModelWithDefaultModel:(id)a3 selectionPolicy:(id)a4 error:(id *)a5;
- (void)generateCAReportAndReturnError:(id *)a3;
@end

@implementation ODCurareInterfaceModule

- (ODCurareInterfaceModule)initWithBundleIdentifier:(id)a3 evaluationInstance:(id)a4 personalizationInstance:(id)a5 pruningPolicy:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ODCurareInterfaceModule;
  v16 = [(ODCurareInterfaceModule *)&v20 init];
  if (v16)
  {
    v17 = [[ODCurareInterfaceModuleInternal alloc] initWithBundleIdentifier:v12 evaluationInstance:v13 personalizationInstance:v14 pruningPolicy:v15 error:a7];
    underlyingObject = v16->_underlyingObject;
    v16->_underlyingObject = v17;
  }
  return v16;
}

- (BOOL)evaluateModelsWithEvaluationModels:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(ODCurareInterfaceModule *)self underlyingObject];
  v8 = [v7 evaluateModelsWithEvaluationModels:v6 error:a4];

  LOBYTE(v7) = [v8 BOOLValue];
  return (char)v7;
}

- (BOOL)personalizeModelsWithPersonalizableModels:(id)a3 personalizationPolicy:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(ODCurareInterfaceModule *)self underlyingObject];
  v11 = [v10 personalizeModelsWithPersonalizableModels:v9 personalizationPolicy:v8 error:a5];

  LOBYTE(v9) = [v11 BOOLValue];
  return (char)v9;
}

- (id)getSelectedModelWithDefaultModel:(id)a3 selectionPolicy:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(ODCurareInterfaceModule *)self underlyingObject];
  v11 = [v10 getSelectedModelWithDefaultModel:v9 selectionPolicy:v8 error:a5];

  return v11;
}

- (void)generateCAReportAndReturnError:(id *)a3
{
  id v4 = [(ODCurareInterfaceModule *)self underlyingObject];
  [v4 generateCAReportAndReturnError:a3];
}

- (ODCurareInterfaceModuleInternal)underlyingObject
{
  return (ODCurareInterfaceModuleInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end