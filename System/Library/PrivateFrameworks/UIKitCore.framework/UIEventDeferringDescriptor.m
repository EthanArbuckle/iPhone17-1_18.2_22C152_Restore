@interface UIEventDeferringDescriptor
@end

@implementation UIEventDeferringDescriptor

void __69___UIEventDeferringDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69___UIEventDeferringDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

uint64_t __69___UIEventDeferringDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 24);
  id v4 = &stru_1ED0E84C0;
  if (v3 == 1) {
    id v4 = @"remote";
  }
  if (v3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = @"local";
  }
  id v6 = (id)[v2 appendObject:v5 withName:@"scope"];
  id v7 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) withName:@"compatibility"];
  id v8 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"environment"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 40) withName:@"displayIdentifier"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 48) withName:@"predicateSceneIdentity" skipIfEmpty:1];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(unsigned int *)(v9 + 12);
  if (v10)
  {
    id v11 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:v10 withName:@"predicateContextID" format:1];
    uint64_t v9 = *(void *)(a1 + 40);
  }
  uint64_t v12 = *(int *)(v9 + 16);
  if (v12)
  {
    id v13 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:v12 withName:@"targetPID"];
    uint64_t v9 = *(void *)(a1 + 40);
  }
  uint64_t v14 = *(unsigned int *)(v9 + 20);
  if (v14)
  {
    id v15 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:v14 withName:@"targetContextID" format:1];
    uint64_t v9 = *(void *)(a1 + 40);
  }
  v16 = *(void **)(a1 + 32);
  uint64_t v17 = *(void *)(v9 + 64);
  return [v16 appendString:v17 withName:@"targetSceneIdentity"];
}

@end