@interface UIPhysicalButtonConfiguration
@end

@implementation UIPhysicalButtonConfiguration

id __74___UIPhysicalButtonConfiguration__cameraShutterConfigurationsWithOptions___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __72___UIPhysicalButtonConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(int8x16_t *a1)
{
  v2 = (void *)a1[2].i64[0];
  v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72___UIPhysicalButtonConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  int8x16_t v5 = a1[2];
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

void __72___UIPhysicalButtonConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  _NSStringFromUIPhysicalButton(*(void *)(*(void *)(a1 + 32) + 16));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) appendString:v10 withName:@"button"];
  v2 = _NSStringFromUIPhysicalButtonBehavior(*(void *)(*(void *)(a1 + 32) + 24));
  [*(id *)(a1 + 40) appendString:v2 withName:@"behavior"];
  id v3 = (id)[*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 32) withName:@"behaviorOptions" skipIfNil:1];
  [*(id *)(a1 + 40) appendString:*(void *)(*(void *)(a1 + 32) + 56) withName:@"name" skipIfEmpty:1];
  id v4 = (id)[*(id *)(a1 + 40) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 8) withName:@"wantsSystemShellExclusivePriority" ifEqualTo:1];
  id v5 = (id)[*(id *)(a1 + 40) appendUInt64:*(void *)(*(void *)(a1 + 32) + 40) withName:@"generation"];
  v6 = NSString;
  int8x16_t v7 = (objc_class *)objc_opt_class();
  objc_msgSend(v6, "stringWithFormat:", @"<%s: %p; pid: %i>",
    class_getName(v7),
    *(void *)(*(void *)(a1 + 32) + 48),
  v8 = [*(id *)(*(void *)(a1 + 32) + 48) pid]);
  id v9 = (id)[*(id *)(a1 + 40) appendObject:v8 withName:@"auditToken"];
}

@end