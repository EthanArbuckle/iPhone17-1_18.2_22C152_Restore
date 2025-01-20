@interface UIKeyWindowSceneStack
@end

@implementation UIKeyWindowSceneStack

void __92___UIKeyWindowSceneStack__evaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene_forReason___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (qword_1EB25EE90 != -1) {
    dispatch_once(&qword_1EB25EE90, &__block_literal_global_7);
  }
  int v7 = _MergedGlobals_930;
  if (a2)
  {
    char v8 = [*(id *)(a2 + 8) _isConnecting];
    v9 = *(void **)(a2 + 8);
    if (v9)
    {
      if (![*(id *)(a2 + 8) activationState])
      {
LABEL_12:
        v12 = *(void **)(a2 + 8);
LABEL_13:
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v12);
        *a4 = 1;
        return;
      }
      BOOL v10 = [v9 activationState] == 1;
    }
    else
    {
      BOOL v10 = 0;
    }
    if (v7) {
      char v11 = 1;
    }
    else {
      char v11 = v8;
    }
    if ((v11 & 1) != 0 || v10) {
      goto LABEL_12;
    }
  }
  else
  {
    char v13 = [0 _isConnecting];
    v12 = 0;
    if (v7 || (v13 & 1) != 0) {
      goto LABEL_13;
    }
  }
}

void __64___UIKeyWindowSceneStack_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64___UIKeyWindowSceneStack_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

void __64___UIKeyWindowSceneStack_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned char *)(*(void *)(a1 + 40) + 32) & 1 withName:@"affectsApplicationKeyWindow"];
  id v3 = (id)[*(id *)(a1 + 32) appendBool:(*(unsigned __int8 *)(*(void *)(a1 + 40) + 32) >> 1) & 1 withName:@"hasViewServiceEntitlement"];
  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "count"), @"windowSceneRecords.count");
  if (*(void *)(*(void *)(a1 + 40) + 16))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    v6 = [v5 activeMultilinePrefix];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64___UIKeyWindowSceneStack_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v9[3] = &unk_1E52D9F98;
    int8x16_t v8 = *(int8x16_t *)(a1 + 32);
    id v7 = (id)v8.i64[0];
    int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
    [v5 appendBodySectionWithName:@"orderedWindowSceneRecords" multilinePrefix:v6 block:v9];
  }
}

void __64___UIKeyWindowSceneStack_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(void *)(*((void *)&v8 + 1) + 8 * v6++), 0, (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

uint64_t __99___UIKeyWindowSceneStack__sortAndEvaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene_forReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a2)
  {
    uint64_t v5 = a2[2];
    if (a3)
    {
LABEL_3:
      uint64_t v6 = a3[2];
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
LABEL_4:
  uint64_t v7 = *(void *)(a1 + 32);
  if (a2) {
    long long v8 = (void *)a2[1];
  }
  else {
    long long v8 = 0;
  }
  char v25 = *(unsigned char *)(v7 + 32);
  int v9 = [v8 _isTargetOfKeyboardEventDeferringEnvironment];
  if (a3) {
    long long v10 = (void *)a3[1];
  }
  else {
    long long v10 = 0;
  }
  int v11 = [v10 _isTargetOfKeyboardEventDeferringEnvironment];
  if (a2) {
    v12 = (void *)a2[1];
  }
  else {
    v12 = 0;
  }
  uint64_t v13 = [v12 session];
  v14 = [v13 role];
  int v15 = [v14 isEqualToString:@"UIWindowSceneSessionTypeCoverSheet"];

  if (a3) {
    v16 = (void *)a3[1];
  }
  else {
    v16 = 0;
  }
  v17 = [v16 session];
  v18 = [v17 role];
  int v19 = [v18 isEqualToString:@"UIWindowSceneSessionTypeCoverSheet"];

  if ((v15 | v19 ^ 1) != 1) {
    return -1;
  }
  if ((v15 ^ 1 | v19) != 1) {
    return 1;
  }
  if (v5 | v6 && ((v15 ^ 1 | v19 ^ 1) & 1) != 0)
  {
    if (v5 == 1 && v6 == 1)
    {
      if ((v9 ^ 1 | v11) == 1)
      {
        if ((v9 | v11 ^ 1) == 1) {
          goto LABEL_35;
        }
        return -1;
      }
      return 1;
    }
    if (v5 || v6 != 1)
    {
      if (v5 == 1 && !v6)
      {
        char v22 = (v25 & 2) != 0 ? v9 : 1;
        if (v22) {
          return 1;
        }
      }
    }
    else
    {
      if ((v25 & 2) != 0) {
        char v20 = v11;
      }
      else {
        char v20 = 1;
      }
      if (v20) {
        return -1;
      }
    }
  }
LABEL_35:
  if (a3)
  {
    unint64_t v23 = a3[3];
    if (a2)
    {
LABEL_37:
      unint64_t v24 = a2[3];
      goto LABEL_38;
    }
  }
  else
  {
    unint64_t v23 = 0;
    if (a2) {
      goto LABEL_37;
    }
  }
  unint64_t v24 = 0;
LABEL_38:
  if (v23 > v24) {
    return -1;
  }
  else {
    return 1;
  }
}

void __59___UIKeyWindowSceneStack_keyWindowSceneInStackPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = a2;
  uint64_t v7 = *(void *)(a1 + 32);
  if (a2) {
    a2 = *(void *)(a2 + 8);
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2))
  {
    if (v5) {
      long long v8 = *(void **)(v5 + 8);
    }
    else {
      long long v8 = 0;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);
    *a4 = 1;
  }
}

@end