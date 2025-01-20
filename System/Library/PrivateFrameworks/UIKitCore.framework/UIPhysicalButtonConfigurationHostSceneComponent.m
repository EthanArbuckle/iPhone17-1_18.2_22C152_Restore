@interface UIPhysicalButtonConfigurationHostSceneComponent
@end

@implementation UIPhysicalButtonConfigurationHostSceneComponent

uint64_t __78___UIPhysicalButtonConfigurationHostSceneComponent_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasSuccinctStyle]) {
    return (uint64_t)(id)[*(id *)(a1 + 32) appendBool:(*(unsigned __int8 *)(*(void *)(a1 + 40) + 24) >> 1) & 1 withName:@"sceneIsEligibleForProxyInteraction"];
  }
  uint64_t result = [*(id *)(a1 + 32) hasDebugStyle];
  if ((result & 1) == 0) {
    return (uint64_t)(id)[*(id *)(a1 + 32) appendBool:(*(unsigned __int8 *)(*(void *)(a1 + 40) + 24) >> 1) & 1 withName:@"sceneIsEligibleForProxyInteraction"];
  }
  return result;
}

void __78___UIPhysicalButtonConfigurationHostSceneComponent_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned char *)(*(void *)(a1 + 40) + 24) & 1 withName:@"needsSceneEligibilityEvaluation"];
  id v3 = (id)[*(id *)(a1 + 32) appendBool:(*(unsigned __int8 *)(*(void *)(a1 + 40) + 24) >> 1) & 1 withName:@"sceneIsEligibleForProxyInteraction"];
  uint64_t v4 = *(void *)(a1 + 40);
  v5 = *(void **)(v4 + 32);
  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    v7 = NSString;
    id v8 = v5;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = [v7 stringWithFormat:@"<%@: %p>", v10, v8];

    id v12 = (id)[v6 appendObject:v11 withName:@"clientPhysicalButtonConfigurations"];
    uint64_t v4 = *(void *)(a1 + 40);
  }
  v13 = *(void **)(v4 + 40);
  if (v13)
  {
    v14 = *(void **)(a1 + 32);
    v15 = NSString;
    id v16 = v13;
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    id v20 = [v15 stringWithFormat:@"<%@: %p>", v18, v16];

    id v19 = (id)[v14 appendObject:v20 withName:@"proxyPhysicalButtonInteraction"];
  }
}

@end