@interface VUIJSApplication
- (NSDictionary)traitCollection;
- (void)launchAppWithOptions:(id)a3;
- (void)reload:(id)a3 :(id)a4;
- (void)resumeAppWithOptions:(id)a3;
- (void)suspendAppWithOptions:(id)a3;
@end

@implementation VUIJSApplication

void __35__VUIJSApplication_traitCollection__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) appContext];
  uint64_t v2 = [v5 _appTraitCollection];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)launchAppWithOptions:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v8 count:1];

  id v7 = [(VUIJSObject *)self invokeMethod:@"onLaunch", v6, v8, v9 withArguments];
}

- (NSDictionary)traitCollection
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__23;
  v11 = __Block_byref_object_dispose__23;
  id v12 = 0;
  uint64_t v3 = [(VUIJSObject *)self appContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__VUIJSApplication_traitCollection__block_invoke;
  v6[3] = &unk_1E6DFA828;
  v6[4] = self;
  v6[5] = &v7;
  [v3 evaluateDelegateBlockSync:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (void)suspendAppWithOptions:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v8 count:1];

  id v7 = [(VUIJSObject *)self invokeMethod:@"onSuspend", v6, v8, v9 withArguments];
}

- (void)resumeAppWithOptions:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v8 count:1];

  id v7 = [(VUIJSObject *)self invokeMethod:@"onResume", v6, v8, v9 withArguments];
}

- (void)reload:(id)a3 :(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v13 = [v7 objectForKeyedSubscript:@"when"];
  unsigned int v8 = [v13 isEqualToString:@"onResume"];
  uint64_t v9 = [v7 objectForKeyedSubscript:@"minSuspensionTime"];

  if ([v9 length])
  {
    [v9 doubleValue];
    double v11 = v10;
  }
  else
  {
    double v11 = 0.0;
  }
  id v12 = [(VUIJSObject *)self appContext];
  [v12 handleReloadWithUrgencyType:v8 minInterval:v6 data:v11];
}

@end