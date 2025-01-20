@interface UIPhysicalButtonBSAction
@end

@implementation UIPhysicalButtonBSAction

void __67___UIPhysicalButtonBSAction_descriptionBuilderWithMultilinePrefix___block_invoke(int8x16_t *a1)
{
  v2 = (void *)a1[2].i64[0];
  v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67___UIPhysicalButtonBSAction_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  int8x16_t v5 = a1[2];
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

void __67___UIPhysicalButtonBSAction_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  _NSStringFromUIPhysicalButtonActionSetting(0);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  v2 = _NSStringFromUIPhysicalButton([*(id *)(a1 + 32) button]);
  [*(id *)(a1 + 40) appendString:v2 withName:v15];
  v3 = _NSStringFromUIPhysicalButtonActionSetting(1uLL);
  id v4 = _NSStringFromUIPhysicalButtonBehavior([*(id *)(a1 + 32) behavior]);
  [*(id *)(a1 + 40) appendString:v4 withName:v3];
  int8x16_t v5 = _NSStringFromUIPhysicalButtonActionSetting(3uLL);
  v6 = _NSStringFromUIPhysicalButtonState([*(id *)(a1 + 32) state]);
  [*(id *)(a1 + 40) appendString:v6 withName:v5];
  int8x16_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = [*(id *)(a1 + 32) generation];
  v9 = _NSStringFromUIPhysicalButtonActionSetting(2uLL);
  id v10 = (id)[v7 appendUInt64:v8 withName:v9];

  v11 = *(void **)(a1 + 40);
  v12 = [*(id *)(a1 + 32) info];
  v13 = [v12 succinctDescription];
  id v14 = (id)[v11 appendObject:v13 withName:@"settings"];
}

@end