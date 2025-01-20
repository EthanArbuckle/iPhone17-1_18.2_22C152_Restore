@interface UIWindowSceneDescriptionWithMultilinePrefix
@end

@implementation UIWindowSceneDescriptionWithMultilinePrefix

void ___UIWindowSceneDescriptionWithMultilinePrefix_block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) session];
  v4 = [v3 role];
  id v5 = (id)[v2 appendObject:v4 withName:@"sessionRole"];

  v6 = *(void **)(a1 + 32);
  v7 = _NSStringFromUISceneActivationState([*(id *)(a1 + 40) activationState]);
  id v8 = (id)[v6 appendObject:v7 withName:@"activationState"];

  v9 = *(void **)(a1 + 32);
  v10 = [*(id *)(a1 + 40) _sceneIdentifier];
  id v11 = (id)[v9 appendObject:v10 withName:@"identifier"];

  v12 = [*(id *)(a1 + 40) _screen];
  v13 = [*(id *)(a1 + 32) activeMultilinePrefix];
  v14 = [MEMORY[0x1E4F4F718] builderWithObject:v12];
  [v14 setActiveMultilinePrefix:v13];
  v15 = [v14 activeMultilinePrefix];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = ___UIScreenDescriptionWithMultilinePrefix_block_invoke;
  v22 = &unk_1E52D9F98;
  id v23 = v14;
  v24 = v12;
  id v16 = v14;
  [v16 appendBodySectionWithName:0 multilinePrefix:v15 block:&v19];

  v17 = objc_msgSend(v16, "build", v19, v20, v21, v22);

  id v18 = (id)[*(id *)(a1 + 32) appendObject:v17 withName:@"screen"];
}

@end