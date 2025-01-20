@interface SBSRemoteAlertDefinition
- (BOOL)isForCarPlay;
- (BOOL)prefersEmbeddedDisplayPresentation;
- (BOOL)supportsMultipleDisplayPresentations;
- (NSDictionary)userInfo;
- (NSString)configurationIdentifier;
- (NSString)description;
- (NSString)impersonatedCarPlayAppIdentifier;
- (NSString)secondaryConfigurationIdentifier;
- (NSString)secondaryViewControllerClassName;
- (NSString)serviceName;
- (NSString)viewControllerClassName;
- (RBSProcessIdentity)sceneProvidingProcess;
- (SBSRemoteAlertDefinition)initWithSceneProvidingProcess:(id)a3 configurationIdentifier:(id)a4;
- (SBSRemoteAlertDefinition)initWithServiceName:(id)a3 viewControllerClassName:(id)a4;
- (SBSRemoteAlertDefinition)initWithXPCDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setForCarPlay:(BOOL)a3;
- (void)setImpersonatedCarPlayAppIdentifier:(id)a3;
- (void)setPrefersEmbeddedDisplayPresentation:(BOOL)a3;
- (void)setSecondaryConfigurationIdentifier:(id)a3;
- (void)setSecondaryViewControllerClassName:(id)a3;
- (void)setSupportsMultipleDisplayPresentations:(BOOL)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation SBSRemoteAlertDefinition

- (SBSRemoteAlertDefinition)initWithServiceName:(id)a3 viewControllerClassName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBSRemoteAlertDefinition.m", 17, @"Invalid parameter not satisfying: %@", @"serviceName" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"SBSRemoteAlertDefinition.m", 18, @"Invalid parameter not satisfying: %@", @"viewControllerClassName" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)SBSRemoteAlertDefinition;
  v10 = [(SBSRemoteAlertDefinition *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    serviceName = v10->_serviceName;
    v10->_serviceName = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    viewControllerClassName = v10->_viewControllerClassName;
    v10->_viewControllerClassName = (NSString *)v13;
  }
  return v10;
}

- (SBSRemoteAlertDefinition)initWithSceneProvidingProcess:(id)a3 configurationIdentifier:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBSRemoteAlertDefinition.m", 27, @"Invalid parameter not satisfying: %@", @"sceneProvidingProcess" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)SBSRemoteAlertDefinition;
  v10 = [(SBSRemoteAlertDefinition *)&v16 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_sceneProvidingProcess, a3);
    uint64_t v12 = [v9 copy];
    configurationIdentifier = v11->_configurationIdentifier;
    v11->_configurationIdentifier = (NSString *)v12;
  }
  return v11;
}

- (NSString)description
{
  return (NSString *)[(SBSRemoteAlertDefinition *)self descriptionWithMultilinePrefix:0];
}

- (SBSRemoteAlertDefinition)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  BSDeserializeStringFromXPCDictionaryWithKey();
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  BSDeserializeStringFromXPCDictionaryWithKey();
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v7 = (void *)BSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  id v8 = BSDeserializeStringFromXPCDictionaryWithKey();
  if (v7)
  {
    id v9 = [(SBSRemoteAlertDefinition *)self initWithSceneProvidingProcess:v7 configurationIdentifier:v8];
  }
  else
  {
    if (v5) {
      v10 = v5;
    }
    else {
      v10 = &stru_1EDF30888;
    }
    if (v6) {
      uint64_t v11 = v6;
    }
    else {
      uint64_t v11 = &stru_1EDF30888;
    }
    id v9 = [(SBSRemoteAlertDefinition *)self initWithServiceName:v10 viewControllerClassName:v11];
  }
  uint64_t v12 = v9;
  if (v9)
  {
    uint64_t v13 = BSDeserializeCFValueFromXPCDictionaryWithKey();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SBSRemoteAlertDefinition *)v12 setUserInfo:v13];
    }
    if (v7)
    {
      BOOL v14 = xpc_dictionary_get_BOOL(v4, "supportsMultipleDisplayPresentations");
      v15 = BSDeserializeStringFromXPCDictionaryWithKey();
      [(SBSRemoteAlertDefinition *)v12 setSupportsMultipleDisplayPresentations:v14];
      [(SBSRemoteAlertDefinition *)v12 setSecondaryConfigurationIdentifier:v15];
    }
    else
    {
      v15 = BSDeserializeStringFromXPCDictionaryWithKey();
      [(SBSRemoteAlertDefinition *)v12 setSecondaryViewControllerClassName:v15];
    }

    [(SBSRemoteAlertDefinition *)v12 setPrefersEmbeddedDisplayPresentation:xpc_dictionary_get_BOOL(v4, "prefersEmbeddedDisplayPresentation")];
    objc_super v16 = BSDeserializeStringFromXPCDictionaryWithKey();
    [(SBSRemoteAlertDefinition *)v12 setImpersonatedCarPlayAppIdentifier:v16];

    [(SBSRemoteAlertDefinition *)v12 setForCarPlay:xpc_dictionary_get_BOOL(v4, "forCarPlay")];
  }

  return v12;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    xpc_object_t xdict = v4;
    if (self->_sceneProvidingProcess)
    {
      BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
      BSSerializeStringToXPCDictionaryWithKey();
      if (self->_supportsMultipleDisplayPresentations) {
        xpc_dictionary_set_BOOL(xdict, "supportsMultipleDisplayPresentations", 1);
      }
    }
    else
    {
      BSSerializeStringToXPCDictionaryWithKey();
      BSSerializeStringToXPCDictionaryWithKey();
    }
    BSSerializeStringToXPCDictionaryWithKey();
    if (self->_prefersEmbeddedDisplayPresentation) {
      xpc_dictionary_set_BOOL(xdict, "prefersEmbeddedDisplayPresentation", 1);
    }
    BSSerializeCFValueToXPCDictionaryWithKey();
    BSSerializeStringToXPCDictionaryWithKey();
    if (self->_forCarPlay) {
      xpc_dictionary_set_BOOL(xdict, "forCarPlay", 1);
    }
  }
  MEMORY[0x1F4181820]();
}

- (id)succinctDescription
{
  v2 = [(SBSRemoteAlertDefinition *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBSRemoteAlertDefinition *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(SBSRemoteAlertDefinition *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__SBSRemoteAlertDefinition_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E566BB08;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __66__SBSRemoteAlertDefinition_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"service" skipIfNil:1];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"vcClass" skipIfNil:1];
  id v4 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 56) withName:@"secondaryVCClass" skipIfNil:1];
  id v5 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"sceneProvidingProcess" skipIfNil:1];
  id v6 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"configurationIdentifier" skipIfNil:1];
  uint64_t v7 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v7 + 8))
  {
    id v8 = (id)[*(id *)(a1 + 32) appendBool:1 withName:@"supportsMultipleDisplayPresentations"];
    uint64_t v7 = *(void *)(a1 + 40);
  }
  id v9 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(v7 + 32) withName:@"secondaryConfigurationIdentifier" skipIfNil:1];
  uint64_t v10 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v10 + 9))
  {
    id v11 = (id)[*(id *)(a1 + 32) appendBool:1 withName:@"prefersEmbeddedDisplayPresentation"];
    uint64_t v10 = *(void *)(a1 + 40);
  }
  if (*(unsigned char *)(v10 + 10))
  {
    id v12 = (id)[*(id *)(a1 + 32) appendBool:1 withName:@"forCarPlay"];
    uint64_t v10 = *(void *)(a1 + 40);
  }
  id v13 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(v10 + 72) withName:@"impersonatesCarPlayApp" skipIfNil:1];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 64) withName:@"userInfo" skipIfNil:1];
}

- (id)copyWithZone:(_NSZone *)a3
{
  sceneProvidingProcess = self->_sceneProvidingProcess;
  id v5 = objc_alloc((Class)objc_opt_class());
  if (sceneProvidingProcess) {
    uint64_t v6 = [v5 initWithSceneProvidingProcess:self->_sceneProvidingProcess configurationIdentifier:self->_configurationIdentifier];
  }
  else {
    uint64_t v6 = [v5 initWithServiceName:self->_serviceName viewControllerClassName:self->_viewControllerClassName];
  }
  uint64_t v7 = v6;
  if (v6)
  {
    *(unsigned char *)(v6 + 10) = self->_forCarPlay;
    uint64_t v8 = [(NSString *)self->_impersonatedCarPlayAppIdentifier copy];
    id v9 = *(void **)(v7 + 72);
    *(void *)(v7 + 72) = v8;

    uint64_t v10 = [(NSDictionary *)self->_userInfo copy];
    id v11 = *(void **)(v7 + 64);
    *(void *)(v7 + 64) = v10;

    uint64_t v12 = [(NSString *)self->_secondaryViewControllerClassName copy];
    id v13 = *(void **)(v7 + 56);
    *(void *)(v7 + 56) = v12;

    *(unsigned char *)(v7 + 8) = self->_supportsMultipleDisplayPresentations;
    uint64_t v14 = [(NSString *)self->_secondaryConfigurationIdentifier copy];
    v15 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = v14;

    *(unsigned char *)(v7 + 9) = self->_prefersEmbeddedDisplayPresentation;
  }
  return (id)v7;
}

- (RBSProcessIdentity)sceneProvidingProcess
{
  return self->_sceneProvidingProcess;
}

- (NSString)configurationIdentifier
{
  return self->_configurationIdentifier;
}

- (BOOL)supportsMultipleDisplayPresentations
{
  return self->_supportsMultipleDisplayPresentations;
}

- (void)setSupportsMultipleDisplayPresentations:(BOOL)a3
{
  self->_supportsMultipleDisplayPresentations = a3;
}

- (NSString)secondaryConfigurationIdentifier
{
  return self->_secondaryConfigurationIdentifier;
}

- (void)setSecondaryConfigurationIdentifier:(id)a3
{
}

- (BOOL)prefersEmbeddedDisplayPresentation
{
  return self->_prefersEmbeddedDisplayPresentation;
}

- (void)setPrefersEmbeddedDisplayPresentation:(BOOL)a3
{
  self->_prefersEmbeddedDisplayPresentation = a3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)viewControllerClassName
{
  return self->_viewControllerClassName;
}

- (NSString)secondaryViewControllerClassName
{
  return self->_secondaryViewControllerClassName;
}

- (void)setSecondaryViewControllerClassName:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSString)impersonatedCarPlayAppIdentifier
{
  return self->_impersonatedCarPlayAppIdentifier;
}

- (void)setImpersonatedCarPlayAppIdentifier:(id)a3
{
}

- (BOOL)isForCarPlay
{
  return self->_forCarPlay;
}

- (void)setForCarPlay:(BOOL)a3
{
  self->_forCarPlay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impersonatedCarPlayAppIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_secondaryViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_viewControllerClassName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_secondaryConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneProvidingProcess, 0);
}

@end