@interface UIKeyWindowEvaluator
@end

@implementation UIKeyWindowEvaluator

void __85___UIKeyWindowEvaluator__updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85___UIKeyWindowEvaluator__updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest___block_invoke_2;
  v5[3] = &__block_descriptor_40_e23_B16__0__UIWindowScene_8l;
  v5[4] = a1[6];
  -[_UIKeyWindowSceneStack migrateFromEvaluationStrategy:toEvaluationStrategy:windowScenesPassingTest:](a2, v3, v4, (uint64_t)v5);
}

void __69___UIKeyWindowEvaluator_windowScene_willTransitionToActivationState___block_invoke_2(uint64_t a1, uint64_t *a2)
{
}

void __69___UIKeyWindowEvaluator_windowScene_willTransitionToActivationState___block_invoke(uint64_t a1)
{
  _NSStringFromUISceneActivationState(*(void *)(a1 + 48));
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  v2 = _NSStringFromUISceneActivationState(*(void *)(a1 + 56));
  uint64_t v3 = -[_UIKeyWindowEvaluator _stackForWindowScene:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v4 = -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v3);
  v5 = *(void **)(a1 + 40);

  if (*(unsigned char *)(a1 + 64) && v4 != v5)
  {
    v6 = [NSString stringWithFormat:@"%@: %p: Window scene transitioned from %@ to %@", objc_opt_class(), *(void *)(a1 + 40), v20, v2];
    v7 = -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v3);
    uint64_t v8 = -[_UIKeyWindowEvaluator _evaluationStrategyForScene:](*(void *)(a1 + 32), *(void **)(a1 + 40));
    v9 = -[UIWindowScene _keyWindow](*(id **)(a1 + 40));

    if (*(unsigned char *)(a1 + 65) && !v8 && v9)
    {
      -[_UIKeyWindowSceneStack pushWindowScene:withEvaluationStrategy:forReason:](v3, *(void **)(a1 + 40), 0, v6);
    }
    else if (v3)
    {
      -[_UIKeyWindowSceneStack _evaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene:forReason:](v3, 0, v6);
    }
    uint64_t v15 = -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v3);
    v11 = (void *)v15;
    if (!v3 || (*(unsigned char *)(v3 + 32) & 1) == 0 || (void *)v15 == v7) {
      goto LABEL_23;
    }
    uint64_t v17 = *(void *)(a1 + 32);
    v16 = *(id **)(a1 + 40);
    id v18 = v6;
    v6 = v18;
    if (v17)
    {
      -[_UIKeyWindowEvaluator _evaluateApplicationKeyWindowWithComparisonWindowScene:changingKeyWindowSceneActions:sceneKeyWindowActions:ignoringOldKeyWindow:sceneResignKeyWindowActions:andSceneBecomeKeyWindowActions:forReason:](v17, v16, (uint64_t)&__block_literal_global_104, 0, 0, 0, 0, v19, v18, 0);
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (*(unsigned char *)(a1 + 66) && v4 == v5)
  {
    v6 = [NSString stringWithFormat:@"%@: %p: Window scene transitioned from %@ to %@", objc_opt_class(), *(void *)(a1 + 40), v20, v2];
    v7 = -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v3);
    if (!v3)
    {
      v11 = -[_UIKeyWindowSceneStack keyWindowSceneInStack](0);
      goto LABEL_23;
    }
    -[_UIKeyWindowSceneStack _evaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene:forReason:](v3, 0, v6);
    uint64_t v10 = -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v3);
    v11 = (void *)v10;
    if ((*(unsigned char *)(v3 + 32) & 1) == 0 || (void *)v10 == v7) {
      goto LABEL_23;
    }
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = v6;
    v6 = v13;
    if (v12)
    {
      -[_UIKeyWindowEvaluator _evaluateApplicationKeyWindowWithComparisonWindowScene:changingKeyWindowSceneActions:sceneKeyWindowActions:ignoringOldKeyWindow:sceneResignKeyWindowActions:andSceneBecomeKeyWindowActions:forReason:](v12, 0, (uint64_t)&__block_literal_global_106, 0, 0, 0, 0, v14, v13, 0);
LABEL_23:

      goto LABEL_24;
    }
LABEL_22:

    goto LABEL_23;
  }
LABEL_24:
}

void __63___UIKeyWindowEvaluator_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  for (uint64_t i = 1; i != 12; ++i)
  {
    if (*(void *)(*(void *)(a1 + 32) + 8 * i))
    {
      uint64_t v3 = *(void **)(a1 + 40);
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      v5 = _NSStringFromUIUserInterfaceIdiom(i - 2);
      id v6 = (id)[v3 appendObject:v4 withName:v5];
    }
  }
}

void __63___UIKeyWindowEvaluator_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1)
{
  for (uint64_t i = 12; i != 23; ++i)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8 * i);
    if (v3 != -1)
    {
      uint64_t v4 = *(void **)(a1 + 40);
      if (v3 == 1) {
        v5 = @"SystemShellManaged";
      }
      else {
        v5 = &stru_1ED0E84C0;
      }
      if (v3) {
        id v6 = v5;
      }
      else {
        id v6 = @"LastOneWins";
      }
      v7 = v6;
      uint64_t v8 = _NSStringFromUIUserInterfaceIdiom(i - 13);
      id v9 = (id)[v4 appendObject:v7 withName:v8];
    }
  }
}

void __40___UIKeyWindowEvaluator_sharedEvaluator__block_invoke()
{
  v0 = [_UIKeyWindowEvaluator alloc];
  if (v0
    && (v7.receiver = v0,
        v7.super_class = (Class)_UIKeyWindowEvaluator,
        (v1 = objc_msgSendSuper2(&v7, sel_init)) != 0))
  {
    v1[22] = -1;
    *(void *)&long long v2 = -1;
    *((void *)&v2 + 1) = -1;
    *((_OWORD *)v1 + 9) = v2;
    *((_OWORD *)v1 + 10) = v2;
    *((_OWORD *)v1 + 7) = v2;
    *((_OWORD *)v1 + 8) = v2;
    *((_OWORD *)v1 + 6) = v2;
    uint64_t v3 = v1;
    uint64_t v4 = BSLogAddStateCaptureBlockWithTitle();
    v5 = (void *)v3[26];
    v3[26] = v4;
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v6 = (void *)qword_1EB262E18;
  qword_1EB262E18 = (uint64_t)v3;
}

id __30___UIKeyWindowEvaluator__init__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) descriptionBuilderWithMultilinePrefix:&stru_1ED0E84C0];
  long long v2 = [v1 build];

  return v2;
}

void __63___UIKeyWindowEvaluator_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63___UIKeyWindowEvaluator_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

BOOL __85___UIKeyWindowEvaluator__updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [a2 _FBSScene];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [a2 _screen];
  uint64_t v6 = [v5 _userInterfaceIdiom];

  return v6 == *(void *)(a1 + 32);
}

void __63___UIKeyWindowEvaluator_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 200) withName:@"applicationKeyWindow"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 184) withName:@"keyWindowSceneStack"];
  id v4 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 192) withName:@"excludedSceneStack"];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v5 activeMultilinePrefix];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63___UIKeyWindowEvaluator_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v15[3] = &unk_1E52D9F98;
  int8x16_t v11 = *(int8x16_t *)(a1 + 32);
  id v7 = (id)v11.i64[0];
  int8x16_t v16 = vextq_s8(v11, v11, 8uLL);
  [v5 appendBodySectionWithName:@"countOfFBSSceneBackedScenesByIdiom" multilinePrefix:v6 block:v15];

  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = [v8 activeMultilinePrefix];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63___UIKeyWindowEvaluator_descriptionBuilderWithMultilinePrefix___block_invoke_4;
  v13[3] = &unk_1E52D9F98;
  int8x16_t v12 = *(int8x16_t *)(a1 + 32);
  id v10 = (id)v12.i64[0];
  int8x16_t v14 = vextq_s8(v12, v12, 8uLL);
  [v8 appendBodySectionWithName:@"defaultEvaluationStrategyByIdiom" multilinePrefix:v9 block:v13];
}

void __87___UIKeyWindowEvaluator_windowSceneDidBecomeTargetOfKeyboardEventDeferringEnvironment___block_invoke(uint64_t a1, uint64_t *a2)
{
}

BOOL __56___UIKeyWindowEvaluator_keyWindowForUserInterfaceIdiom___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 _screen];
  uint64_t v4 = [v3 _userInterfaceIdiom];

  return v4 == *(void *)(a1 + 32);
}

void __69___UIKeyWindowEvaluator_windowScene_willTransitionToActivationState___block_invoke_3(uint64_t a1, uint64_t *a2)
{
}

void __51___UIKeyWindowEvaluator_windowSceneWillInvalidate___block_invoke(uint64_t a1, uint64_t *a2)
{
}

BOOL __51___UIKeyWindowEvaluator_windowSceneWillInvalidate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) != a2;
}

@end