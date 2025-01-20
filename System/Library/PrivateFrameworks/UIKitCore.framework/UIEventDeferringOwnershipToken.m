@interface UIEventDeferringOwnershipToken
@end

@implementation UIEventDeferringOwnershipToken

void __73___UIEventDeferringOwnershipToken_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73___UIEventDeferringOwnershipToken_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

id __73___UIEventDeferringOwnershipToken_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"ownerClass"];
  unint64_t v3 = *(void *)(*(void *)(a1 + 40) + 40);
  if (v3 > 3) {
    id v4 = &stru_1ED0E84C0;
  }
  else {
    id v4 = off_1E52DD018[v3];
  }
  id v5 = (id)[*(id *)(a1 + 32) appendObject:v4 withName:@"owningInterfaceElementCategory"];
  id v6 = (id)[*(id *)(a1 + 32) appendPointer:*(void *)(*(void *)(a1 + 40) + 48) withName:@"ownerPointer"];
  id v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 64), "count"), @"environments.count");
  id v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "count"), @"environmentsPendingInvalidation.count");
  id v9 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 72) withName:@"target"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 80) withName:@"reason"];
}

@end