@interface NWPathEvaluator(WFAdditions)
+ (id)wf_pathEvaluatorForURL:()WFAdditions;
- (BOOL)wf_isReachable;
@end

@implementation NWPathEvaluator(WFAdditions)

+ (id)wf_pathEvaluatorForURL:()WFAdditions
{
  id v3 = a3;
  v4 = [v3 host];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [v3 host];
    v7 = [v3 port];
    uint64_t v8 = [v7 stringValue];
    v9 = (void *)v8;
    v10 = @"80";
    if (v8) {
      v10 = (__CFString *)v8;
    }
    v11 = v10;

    v12 = [MEMORY[0x263F14400] endpointWithHostname:v6 port:v11];

    v13 = (void *)[objc_alloc(MEMORY[0x263F14420]) initWithEndpoint:v12 parameters:0];
  }
  else
  {
    v13 = [MEMORY[0x263F14420] sharedDefaultEvaluator];
  }

  return v13;
}

- (BOOL)wf_isReachable
{
  v1 = [a1 path];
  uint64_t v2 = [v1 status];

  return (v2 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

@end