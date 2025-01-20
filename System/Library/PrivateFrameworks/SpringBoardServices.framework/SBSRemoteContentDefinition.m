@interface SBSRemoteContentDefinition
- (NSDictionary)userInfo;
- (NSString)description;
- (NSString)serviceName;
- (NSString)viewControllerClassName;
- (OS_xpc_object)xpcEndpoint;
- (SBSRemoteContentDefinition)init;
- (SBSRemoteContentDefinition)initWithServiceName:(id)a3 viewControllerClassName:(id)a4;
- (SBSRemoteContentDefinition)initWithServiceName:(id)a3 viewControllerClassName:(id)a4 xpcEndpoint:(id)a5 userInfo:(id)a6;
- (SBSRemoteContentDefinition)initWithXPCDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setXpcEndpoint:(id)a3;
@end

@implementation SBSRemoteContentDefinition

- (SBSRemoteContentDefinition)init
{
  return [(SBSRemoteContentDefinition *)self initWithServiceName:0 viewControllerClassName:0];
}

- (SBSRemoteContentDefinition)initWithServiceName:(id)a3 viewControllerClassName:(id)a4
{
  return [(SBSRemoteContentDefinition *)self initWithServiceName:a3 viewControllerClassName:a4 xpcEndpoint:0 userInfo:0];
}

- (SBSRemoteContentDefinition)initWithServiceName:(id)a3 viewControllerClassName:(id)a4 xpcEndpoint:(id)a5 userInfo:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SBSRemoteContentDefinition.m", 30, @"Invalid parameter not satisfying: %@", @"serviceName" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"SBSRemoteContentDefinition.m", 31, @"Invalid parameter not satisfying: %@", @"viewControllerClassName" object file lineNumber description];

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)SBSRemoteContentDefinition;
  v15 = [(SBSRemoteContentDefinition *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    serviceName = v15->_serviceName;
    v15->_serviceName = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    viewControllerClassName = v15->_viewControllerClassName;
    v15->_viewControllerClassName = (NSString *)v18;

    objc_storeStrong((id *)&v15->_xpcEndpoint, a5);
    objc_storeStrong((id *)&v15->_userInfo, a6);
  }

  return v15;
}

- (NSString)description
{
  return (NSString *)[(SBSRemoteContentDefinition *)self descriptionWithMultilinePrefix:0];
}

- (SBSRemoteContentDefinition)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  BSDeserializeStringFromXPCDictionaryWithKey();
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  BSDeserializeStringFromXPCDictionaryWithKey();
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = xpc_dictionary_get_value(v4, "endpoint");
  v8 = BSDeserializeCFValueFromXPCDictionaryWithKey();

  if (v5) {
    v9 = v5;
  }
  else {
    v9 = &stru_1EDF30888;
  }
  if (v6) {
    v10 = v6;
  }
  else {
    v10 = &stru_1EDF30888;
  }
  id v11 = [(SBSRemoteContentDefinition *)self initWithServiceName:v9 viewControllerClassName:v10 xpcEndpoint:v7 userInfo:v8];

  return v11;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  if (a3)
  {
    xpc_object_t xdict = a3;
    BSSerializeStringToXPCDictionaryWithKey();
    BSSerializeStringToXPCDictionaryWithKey();
    xpc_dictionary_set_value(xdict, "endpoint", self->_xpcEndpoint);
    BSSerializeCFValueToXPCDictionaryWithKey();
  }
}

- (id)succinctDescription
{
  v2 = [(SBSRemoteContentDefinition *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBSRemoteContentDefinition *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(SBSRemoteContentDefinition *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__SBSRemoteContentDefinition_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E566BB08;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __68__SBSRemoteContentDefinition_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"service"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"vcClass"];
  id v4 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"xpcEndpoint" skipIfNil:1];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"userInfo" skipIfNil:1];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [objc_alloc((Class)objc_opt_class()) initWithServiceName:self->_serviceName viewControllerClassName:self->_viewControllerClassName];
  if (v4)
  {
    uint64_t v5 = [(NSDictionary *)self->_userInfo copy];
    id v6 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v5;

    objc_storeStrong((id *)(v4 + 24), self->_xpcEndpoint);
  }
  return (id)v4;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)viewControllerClassName
{
  return self->_viewControllerClassName;
}

- (OS_xpc_object)xpcEndpoint
{
  return self->_xpcEndpoint;
}

- (void)setXpcEndpoint:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);
  objc_storeStrong((id *)&self->_viewControllerClassName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end