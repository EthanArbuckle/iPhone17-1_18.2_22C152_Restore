@interface UIWindowSceneStackRecord
@end

@implementation UIWindowSceneStackRecord

void __67___UIWindowSceneStackRecord_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67___UIWindowSceneStackRecord_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

void __67___UIWindowSceneStackRecord_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = _NSStringFromUIKeyWindowEvaluationStrategy(*(void *)(*(void *)(a1 + 40) + 16));
  id v4 = (id)[v2 appendObject:v3 withName:@"evaluationStrategy"];

  id v5 = (id)[*(id *)(a1 + 32) appendUInt64:*(void *)(*(void *)(a1 + 40) + 24) withName:@"lastPushedTime"];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = [*(id *)(a1 + 32) activeMultilinePrefix];
  uint64_t v8 = [MEMORY[0x1E4F4F718] builderWithObject:v6];
  [v8 setActiveMultilinePrefix:v7];
  v9 = [v8 activeMultilinePrefix];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = ___UIWindowSceneDescriptionWithMultilinePrefix_block_invoke;
  v16 = &unk_1E52D9F98;
  id v17 = v8;
  uint64_t v18 = v6;
  id v10 = v8;
  [v10 appendBodySectionWithName:0 multilinePrefix:v9 block:&v13];

  v11 = objc_msgSend(v10, "build", v13, v14, v15, v16);

  id v12 = (id)[*(id *)(a1 + 32) appendObject:v11 withName:@"windowScene"];
}

@end