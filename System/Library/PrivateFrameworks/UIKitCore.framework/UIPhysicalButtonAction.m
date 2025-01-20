@interface UIPhysicalButtonAction
@end

@implementation UIPhysicalButtonAction

void __65___UIPhysicalButtonAction_descriptionBuilderWithMultilinePrefix___block_invoke(int8x16_t *a1)
{
  v2 = (void *)a1[2].i64[0];
  v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65___UIPhysicalButtonAction_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  int8x16_t v5 = a1[2];
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

void __65___UIPhysicalButtonAction_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  _NSStringFromUIPhysicalButton(*(void *)(*(void *)(a1 + 32) + 8));
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendString:withName:");
  v2 = _NSStringFromUIPhysicalButtonState(*(void *)(*(void *)(a1 + 32) + 16));
  [*(id *)(a1 + 40) appendString:v2 withName:@"state"];
  v3 = _NSStringFromUIPhysicalButtonBehavior(*(void *)(*(void *)(a1 + 32) + 24));
  [*(id *)(a1 + 40) appendString:v3 withName:@"behavior"];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 48);
  if (v5)
  {
    id v6 = (id)[*(id *)(a1 + 40) appendObject:v5 withName:@"contact"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  id v7 = (id)[*(id *)(a1 + 40) appendUnsignedInteger:*(void *)(v4 + 56) withName:@"stage"];
  id v8 = (id)[*(id *)(a1 + 40) appendUnsignedInteger:*(void *)(*(void *)(a1 + 32) + 64) withName:@"numberOfStages"];
  unint64_t v9 = *(void *)(*(void *)(a1 + 32) + 72);
  if (v9 > 3) {
    v10 = &stru_1ED0E84C0;
  }
  else {
    v10 = off_1E5308918[v9];
  }
  [*(id *)(a1 + 40) appendString:v10 withName:@"stagePhase"];
  id v11 = (id)[*(id *)(a1 + 40) appendFloat:@"normalizedForce" withName:3 decimalPrecision:*(double *)(*(void *)(a1 + 32) + 80)];
  id v12 = (id)[*(id *)(a1 + 40) appendFloat:@"normalizedForceVelocity" withName:3 decimalPrecision:*(double *)(*(void *)(a1 + 32) + 88)];
  id v13 = (id)[*(id *)(a1 + 40) appendFloat:@"releaseStageForceThreshold" withName:3 decimalPrecision:*(double *)(*(void *)(a1 + 32) + 96)];
  id v14 = (id)[*(id *)(a1 + 40) appendFloat:@"pressedStageForceThreshold" withName:3 decimalPrecision:*(double *)(*(void *)(a1 + 32) + 104)];
  id v15 = (id)[*(id *)(a1 + 40) appendFloat:@"nextStageForceThreshold" withName:3 decimalPrecision:*(double *)(*(void *)(a1 + 32) + 112)];
}

@end