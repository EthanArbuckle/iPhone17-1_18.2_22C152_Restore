@interface NSExtensionItem(WorkflowEditor)
- (id)wf_actionInterfaceRequest;
- (id)wf_parameterEditingRequest;
- (id)wf_parameterEditingResponse;
- (void)wf_setActionInterfaceRequest:()WorkflowEditor;
- (void)wf_setParameterEditingRequest:()WorkflowEditor;
- (void)wf_setParameterEditingResponse:()WorkflowEditor;
@end

@implementation NSExtensionItem(WorkflowEditor)

- (id)wf_actionInterfaceRequest
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"wf_actionInterfaceRequest"];

  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)wf_setActionInterfaceRequest:()WorkflowEditor
{
  id v10 = a3;
  v4 = [a1 userInfo];
  v5 = (void *)[v4 mutableCopy];
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  v8 = v7;

  if (v10)
  {
    v9 = [MEMORY[0x263F08910] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:0];
  }
  else
  {
    v9 = 0;
  }
  [v8 setObject:v9 forKeyedSubscript:@"wf_actionInterfaceRequest"];
  [a1 setUserInfo:v8];
}

- (id)wf_parameterEditingResponse
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"wf_parameterEditingResponse"];

  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)wf_setParameterEditingResponse:()WorkflowEditor
{
  id v10 = a3;
  v4 = [a1 userInfo];
  v5 = (void *)[v4 mutableCopy];
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  v8 = v7;

  if (v10)
  {
    v9 = [MEMORY[0x263F08910] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:0];
  }
  else
  {
    v9 = 0;
  }
  [v8 setObject:v9 forKeyedSubscript:@"wf_parameterEditingResponse"];
  [a1 setUserInfo:v8];
}

- (id)wf_parameterEditingRequest
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"wf_parameterEditingRequest"];

  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)wf_setParameterEditingRequest:()WorkflowEditor
{
  id v10 = a3;
  v4 = [a1 userInfo];
  v5 = (void *)[v4 mutableCopy];
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  v8 = v7;

  if (v10)
  {
    v9 = [MEMORY[0x263F08910] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:0];
  }
  else
  {
    v9 = 0;
  }
  [v8 setObject:v9 forKeyedSubscript:@"wf_parameterEditingRequest"];
  [a1 setUserInfo:v8];
}

@end