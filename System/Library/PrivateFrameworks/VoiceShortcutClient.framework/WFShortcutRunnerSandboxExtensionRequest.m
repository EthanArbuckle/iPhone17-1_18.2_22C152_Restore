@interface WFShortcutRunnerSandboxExtensionRequest
+ (id)all;
- (NSSet)accessResourceClassNames;
- (WFShortcutRunnerSandboxExtensionRequest)initWithAccessResourceClassNames:(id)a3;
@end

@implementation WFShortcutRunnerSandboxExtensionRequest

- (void).cxx_destruct
{
}

- (NSSet)accessResourceClassNames
{
  return self->_accessResourceClassNames;
}

- (WFShortcutRunnerSandboxExtensionRequest)initWithAccessResourceClassNames:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFShortcutRunnerSandboxExtensionManager.m", 37, @"Invalid parameter not satisfying: %@", @"accessResourceClassNames" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFShortcutRunnerSandboxExtensionRequest;
  v7 = [(WFShortcutRunnerSandboxExtensionRequest *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_accessResourceClassNames, a3);
    v9 = v8;
  }

  return v8;
}

+ (id)all
{
  id v2 = objc_alloc((Class)a1);
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = [&unk_1F0CB1E18 allKeys];
  v5 = [v3 setWithArray:v4];
  id v6 = (void *)[v2 initWithAccessResourceClassNames:v5];

  return v6;
}

@end