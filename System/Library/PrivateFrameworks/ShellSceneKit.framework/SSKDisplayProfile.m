@interface SSKDisplayProfile
+ (id)mirroringMainDisplayProfileWithDelegate:(id)a3;
+ (id)sceneHostingProfileWithDelegate:(id)a3 builder:(id)a4;
- (BOOL)evaluatePhysicalDisplay:(id)a3;
- (BOOL)shouldTransformConnectingDisplays;
- (BOOL)usesRootDisplay;
- (NSString)description;
- (SSKDisplayProfile)initWithPriority:(unint64_t)a3 displayTransformer:(id)a4 provider:(id)a5 delegate:(id)a6;
- (SSKDisplayProfile)initWithSwiftConfiguration:(id)a3 delegate:(id)a4;
- (SSKDisplayProfileDelegate)delegate;
- (id)displayControllerForDisplay:(id)a3 configuration:(id)a4;
- (id)provider:(id)a3 rootSceneWindowForDisplayConfiguration:(id)a4;
- (unint64_t)deactivationReasonsWhenActive;
- (unint64_t)priorityLevel;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)provider:(id)a3 modifyInitialSceneParameters:(id)a4;
- (void)setDelegate:(id)a3;
- (void)transformPhysicalDisplayWithBuilder:(id)a3;
@end

@implementation SSKDisplayProfile

- (SSKDisplayProfile)initWithPriority:(unint64_t)a3 displayTransformer:(id)a4 provider:(id)a5 delegate:(id)a6
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v12)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SSKDisplayProfile.m", 32, @"Invalid parameter not satisfying: %@", @"displayTransformer" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)SSKDisplayProfile;
  v15 = [(SSKDisplayProfile *)&v19 init];
  v16 = v15;
  if (v15)
  {
    v15->_priorityLevel = a3;
    objc_storeStrong((id *)&v15->_displayTransformer, a4);
    objc_storeStrong((id *)&v16->_provider, a5);
    objc_storeWeak((id *)&v16->_delegate, v14);
  }

  return v16;
}

- (SSKDisplayProfile)initWithSwiftConfiguration:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SSKDisplayProfile.m", 44, @"Invalid parameter not satisfying: %@", @"[swiftProfileConfiguration isKindOfClass:[SSKDisplayProfileConfiguration class]]" object file lineNumber description];
  }
  v9 = [[SSKSceneHostingDisplayControllerProvider alloc] initWithProfileConfiguration:v7];
  v10 = -[SSKDisplayProfile initWithPriority:displayTransformer:provider:delegate:](self, "initWithPriority:displayTransformer:provider:delegate:", [v7 priority], v7, v9, v8);

  if (v10) {
    [(SSKSceneHostingDisplayControllerProvider *)v9 setDelegate:v10];
  }

  return v10;
}

+ (id)sceneHostingProfileWithDelegate:(id)a3 builder:(id)a4
{
  v6 = (void (**)(id, SSKLegacyDisplayProfileBuilder *))a4;
  id v7 = a3;
  id v8 = objc_alloc_init(SSKLegacyDisplayProfileBuilder);
  v6[2](v6, v8);

  id v9 = objc_alloc((Class)a1);
  v10 = [(SSKLegacyDisplayProfileBuilder *)v8 createDisplayProfileConfiguration];
  v11 = (void *)[v9 initWithSwiftConfiguration:v10 delegate:v7];

  return v11;
}

+ (id)mirroringMainDisplayProfileWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SSKMirroredDisplayControllerProvider);
  v6 = objc_alloc_init(SSKMirroredDisplayTransformer);
  id v7 = (void *)[objc_alloc((Class)a1) initWithPriority:1 displayTransformer:v6 provider:v5 delegate:v4];

  return v7;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x263F29C48] descriptionForRootObject:self];
}

- (unint64_t)priorityLevel
{
  return self->_priorityLevel;
}

- (unint64_t)deactivationReasonsWhenActive
{
  return 0;
}

- (id)displayControllerForDisplay:(id)a3 configuration:(id)a4
{
  return (id)[(SSKDisplayControllerProviding *)self->_provider displayControllerForDisplay:a3 configuration:a4];
}

- (id)provider:(id)a3 rootSceneWindowForDisplayConfiguration:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v7 = [WeakRetained displayProfile:self rootSceneWindowForDisplayConfiguration:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)provider:(id)a3 modifyInitialSceneParameters:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained displayProfile:self modifyInitialSceneParameters:v6];
  }
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  [v8 appendProem:self block:&__block_literal_global_2];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__SSKDisplayProfile_appendDescriptionToFormatter___block_invoke_2;
  v14[3] = &unk_2654B15F8;
  id v9 = v8;
  id v15 = v9;
  v16 = self;
  [v9 appendBodySectionWithName:@"transformer" block:v14];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__SSKDisplayProfile_appendDescriptionToFormatter___block_invoke_3;
  v11[3] = &unk_2654B15F8;
  id v12 = v9;
  id v13 = self;
  id v10 = v9;
  [v10 appendBodySectionWithName:@"provider" block:v11];
}

id __50__SSKDisplayProfile_appendDescriptionToFormatter___block_invoke_2(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:0];
}

id __50__SSKDisplayProfile_appendDescriptionToFormatter___block_invoke_3(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:0];
}

- (void)transformPhysicalDisplayWithBuilder:(id)a3
{
}

- (BOOL)evaluatePhysicalDisplay:(id)a3
{
  id v5 = a3;
  id v6 = [v5 identity];
  char v7 = [v6 isRootIdentity];

  if ((v7 & 1) == 0)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SSKDisplayProfile.m", 132, @"Invalid parameter not satisfying: %@", @"[[rootDisplayConfiguration identity] isRootIdentity]" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = [WeakRetained displayProfile:self shouldConnectToDisplay:v5];

  return v9;
}

- (BOOL)usesRootDisplay
{
  return [(SSKDisplayControllerTransforming *)self->_displayTransformer derivesDisplays] ^ 1;
}

- (BOOL)shouldTransformConnectingDisplays
{
  return [(SSKDisplayControllerTransforming *)self->_displayTransformer shouldTransformConnectingDisplays];
}

- (SSKDisplayProfileDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SSKDisplayProfileDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_displayTransformer, 0);
}

@end