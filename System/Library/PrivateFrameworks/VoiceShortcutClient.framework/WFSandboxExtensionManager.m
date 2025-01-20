@interface WFSandboxExtensionManager
+ (BOOL)hasExtensionForResourceClassName:(id)a3;
+ (NSSet)allAvailableExtensionResourceClassNames;
- (NSDictionary)extensionClassesPerResource;
- (NSSet)extensionResourcesClassNames;
- (WFSandboxExtensionManager)init;
- (WFSandboxExtensionManager)initWithExtensionClassesPerResource:(id)a3;
- (id)requestSandboxExtensionForResources:(id)a3 destinationProcessAuditToken:(id *)a4 unauthorizedResources:(id *)a5;
@end

@implementation WFSandboxExtensionManager

- (WFSandboxExtensionManager)init
{
  id v3 = &unk_1F0CB1E18;
  v4 = [(WFSandboxExtensionManager *)self initWithExtensionClassesPerResource:&unk_1F0CB1E18];

  return v4;
}

- (WFSandboxExtensionManager)initWithExtensionClassesPerResource:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFSandboxExtensionManager;
  v5 = [(WFSandboxExtensionManager *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    extensionClassesPerResource = v5->_extensionClassesPerResource;
    v5->_extensionClassesPerResource = (NSDictionary *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v9 = [(WFSandboxExtensionManager *)v5 extensionClassesPerResource];
    v10 = [v9 allKeys];
    uint64_t v11 = [v8 setWithArray:v10];
    extensionResourcesClassNames = v5->_extensionResourcesClassNames;
    v5->_extensionResourcesClassNames = (NSSet *)v11;

    v13 = v5;
  }

  return v5;
}

- (NSDictionary)extensionClassesPerResource
{
  return self->_extensionClassesPerResource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionClassesPerResource, 0);
  objc_storeStrong((id *)&self->_extensionResourcesClassNames, 0);
}

- (NSSet)extensionResourcesClassNames
{
  return self->_extensionResourcesClassNames;
}

- (id)requestSandboxExtensionForResources:(id)a3 destinationProcessAuditToken:(id *)a4 unauthorizedResources:(id *)a5
{
  v8 = (void *)MEMORY[0x1E4F1CA80];
  id v9 = a3;
  v10 = [v8 set];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __116__WFSandboxExtensionManager_requestSandboxExtensionForResources_destinationProcessAuditToken_unauthorizedResources___block_invoke;
  v18 = &unk_1E60789C0;
  v19 = self;
  id v11 = v10;
  id v20 = v11;
  long long v12 = *(_OWORD *)&a4->var0[4];
  long long v21 = *(_OWORD *)a4->var0;
  long long v22 = v12;
  v13 = objc_msgSend(v9, "if_compactMap:", &v15);

  if (a5) {
    *a5 = (id)objc_msgSend(v11, "copy", v15, v16, v17, v18, v19);
  }

  return v13;
}

id __116__WFSandboxExtensionManager_requestSandboxExtensionForResources_destinationProcessAuditToken_unauthorizedResources___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) extensionClassesPerResource];
  v5 = [v4 objectForKeyedSubscript:v3];

  if (!v5)
  {
    [*(id *)(a1 + 40) addObject:v3];
LABEL_10:
    id v11 = 0;
    goto LABEL_11;
  }
  [v5 UTF8String];
  long long v6 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)buf = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&buf[16] = v6;
  uint64_t v7 = sandbox_extension_issue_generic_to_process();
  uint64_t v8 = v7;
  if (!v7)
  {
    long long v12 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[WFSandboxExtensionManager requestSandboxExtensionForResources:destinationProcessAuditToken:"
                           "unauthorizedResources:]_block_invoke";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v3;
      _os_log_impl(&dword_1B3C5C000, v12, OS_LOG_TYPE_FAULT, "%s Cannot issue sandbox extension for resource %{public}@", buf, 0x16u);
    }

    [*(id *)(a1 + 40) addObject:v3];
    goto LABEL_10;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__WFSandboxExtensionManager_requestSandboxExtensionForResources_destinationProcessAuditToken_unauthorizedResources___block_invoke_47;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = v7;
  id v9 = (void (**)(void))_Block_copy(aBlock);
  v10 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[WFSandboxExtensionManager requestSandboxExtensionForResources:destinationProcessAuditToken:un"
                         "authorizedResources:]_block_invoke_2";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v3;
    _os_log_impl(&dword_1B3C5C000, v10, OS_LOG_TYPE_DEFAULT, "%s Sandbox extension issued for resource %{public}@", buf, 0x16u);
  }

  id v11 = [NSString stringWithUTF8String:v8];
  v9[2](v9);

LABEL_11:
  return v11;
}

void __116__WFSandboxExtensionManager_requestSandboxExtensionForResources_destinationProcessAuditToken_unauthorizedResources___block_invoke_47(uint64_t a1)
{
}

+ (BOOL)hasExtensionForResourceClassName:(id)a3
{
  id v3 = a3;
  id v4 = &unk_1F0CB1E18;
  v5 = [&unk_1F0CB1E18 objectForKey:v3];

  return v5 != 0;
}

+ (NSSet)allAvailableExtensionResourceClassNames
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = &unk_1F0CB1E18;
  id v4 = [&unk_1F0CB1E18 allKeys];
  v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

@end