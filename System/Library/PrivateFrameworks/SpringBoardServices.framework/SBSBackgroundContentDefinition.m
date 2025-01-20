@interface SBSBackgroundContentDefinition
- (NSString)clientBundleIdentifier;
- (NSString)description;
- (NSString)sceneIdentifier;
- (SBSBackgroundContentDefinition)init;
- (SBSBackgroundContentDefinition)initWithSceneIdentifier:(id)a3 clientBundleIdentifier:(id)a4;
- (SBSBackgroundContentDefinition)initWithXPCDictionary:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation SBSBackgroundContentDefinition

- (SBSBackgroundContentDefinition)init
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = [v3 UUIDString];

  v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v6 = [v5 bundleIdentifier];

  v7 = [(SBSBackgroundContentDefinition *)self initWithSceneIdentifier:v4 clientBundleIdentifier:v6];
  return v7;
}

- (SBSBackgroundContentDefinition)initWithSceneIdentifier:(id)a3 clientBundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBSBackgroundContentDefinition.m", 23, @"Invalid parameter not satisfying: %@", @"clientBundleIdentifier" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"SBSBackgroundContentDefinition.m", 24, @"Invalid parameter not satisfying: %@", @"sceneIdentifier" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)SBSBackgroundContentDefinition;
  v9 = [(SBSBackgroundContentDefinition *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    clientBundleIdentifier = v9->_clientBundleIdentifier;
    v9->_clientBundleIdentifier = (NSString *)v10;

    uint64_t v12 = [v7 copy];
    sceneIdentifier = v9->_sceneIdentifier;
    v9->_sceneIdentifier = (NSString *)v12;
  }
  return v9;
}

- (NSString)description
{
  return (NSString *)[(SBSBackgroundContentDefinition *)self descriptionWithMultilinePrefix:0];
}

- (SBSBackgroundContentDefinition)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v5 = BSDeserializeStringFromXPCDictionaryWithKey();
  v6 = BSDeserializeStringFromXPCDictionaryWithKey();

  id v7 = [(SBSBackgroundContentDefinition *)self initWithSceneIdentifier:v6 clientBundleIdentifier:v5];
  return v7;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    BSSerializeStringToXPCDictionaryWithKey();
    BSSerializeStringToXPCDictionaryWithKey();
  }
}

- (id)succinctDescription
{
  v2 = [(SBSBackgroundContentDefinition *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBSBackgroundContentDefinition *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(SBSBackgroundContentDefinition *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__SBSBackgroundContentDefinition_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E566BB08;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __72__SBSBackgroundContentDefinition_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"clientBundleIdentifier"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"sceneIdentifier"];
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
}

@end