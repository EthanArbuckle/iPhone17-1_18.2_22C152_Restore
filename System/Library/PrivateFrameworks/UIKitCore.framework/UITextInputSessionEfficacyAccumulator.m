@interface UITextInputSessionEfficacyAccumulator
@end

@implementation UITextInputSessionEfficacyAccumulator

void __79___UITextInputSessionEfficacyAccumulator_computeSessionActionsStringOnSession___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  v6 = [MEMORY[0x1E4F1CA98] null];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v8 = _UITextInputActionsSessionActionsEnumValueFromSource(a3);
    uint64_t v23 = v8;
    if (v8 == 1)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __79___UITextInputSessionEfficacyAccumulator_computeSessionActionsStringOnSession___block_invoke_2;
      v14[3] = &unk_1E530C618;
      uint64_t v9 = *(void *)(a1 + 56);
      unint64_t v18 = a3;
      uint64_t v19 = v9;
      uint64_t v10 = *(void *)(a1 + 32);
      v11 = *(void **)(a1 + 40);
      v17 = &v20;
      v14[4] = v10;
      id v15 = v11;
      id v16 = *(id *)(a1 + 48);
      [v5 enumerateObjectsUsingBlock:v14];
    }
    else
    {
      [*(id *)(a1 + 40) setObject:MEMORY[0x1E4F1CC38] atIndexedSubscript:v8];
      if ([*(id *)(a1 + 48) sessionHasOnlyPrimaryInput]) {
        uint64_t v12 = [*(id *)(a1 + 32) isPrimaryInput:v21[3]];
      }
      else {
        uint64_t v12 = 0;
      }
      [*(id *)(a1 + 48) setSessionHasOnlyPrimaryInput:v12];
      BOOL v13 = ([*(id *)(a1 + 48) sessionHasDictation] & 1) != 0 || v21[3] == 3;
      [*(id *)(a1 + 48) setSessionHasDictation:v13];
    }
    _Block_object_dispose(&v20, 8);
  }
}

void __79___UITextInputSessionEfficacyAccumulator_computeSessionActionsStringOnSession___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x1E4F1CA98];
  id v6 = a2;
  char v7 = [v5 null];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = _UITextInputActionsSessionActionsEnumValueFromSourceAndType(*(void *)(a1 + 64), a3);
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 1)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 32) file:@"UITextInputSessionEfficacyAccumulator.m" lineNumber:484 description:@"Received sessionActions of NotYetKnown despite providing action type"];
    }
    objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", MEMORY[0x1E4F1CC38]);
    if ([*(id *)(a1 + 48) sessionHasOnlyPrimaryInput]) {
      uint64_t v9 = [*(id *)(a1 + 32) isPrimaryInput:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    }
    else {
      uint64_t v9 = 0;
    }
    [*(id *)(a1 + 48) setSessionHasOnlyPrimaryInput:v9];
    BOOL v10 = ([*(id *)(a1 + 48) sessionHasDictation] & 1) != 0
       || *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 3;
    v11 = *(void **)(a1 + 48);
    [v11 setSessionHasDictation:v10];
  }
}

void __79___UITextInputSessionEfficacyAccumulator_computeSessionActionsStringOnSession___block_invoke_78(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    id v10 = v5;
    int v7 = [v5 BOOLValue];
    id v6 = v10;
    if (v7)
    {
      char v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      uint64_t v9 = _UITextInputActionsSessionActionsStringFromEnumValue(a3);
      [v8 appendString:v9];

      id v6 = v10;
    }
  }
}

void __77___UITextInputSessionEfficacyAccumulator_enumerateTextInputActionsAnalytics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  char v8 = [v6 computeSessionActionsStringOnSession:v7];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77___UITextInputSessionEfficacyAccumulator_enumerateTextInputActionsAnalytics___block_invoke_2;
  v14[3] = &unk_1E530C708;
  v14[4] = *(void *)(a1 + 32);
  id v15 = v5;
  uint64_t v9 = *(void *)(a1 + 56);
  id v16 = v8;
  uint64_t v18 = v9;
  long long v13 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v13;
  long long v17 = v13;
  id v11 = v8;
  id v12 = v5;
  [v7 enumerateObjectsUsingBlock:v14];
}

void __77___UITextInputSessionEfficacyAccumulator_enumerateTextInputActionsAnalytics___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [MEMORY[0x1E4F1CA98] null];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77___UITextInputSessionEfficacyAccumulator_enumerateTextInputActionsAnalytics___block_invoke_3;
    v13[3] = &unk_1E530C6E0;
    char v8 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v8;
    uint64_t v18 = a3;
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 72);
    id v15 = v9;
    uint64_t v17 = v10;
    long long v12 = *(_OWORD *)(a1 + 56);
    id v11 = (id)v12;
    long long v16 = v12;
    [v5 enumerateObjectsUsingBlock:v13];
  }
}

void __77___UITextInputSessionEfficacyAccumulator_enumerateTextInputActionsAnalytics___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [MEMORY[0x1E4F1CA98] null];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77___UITextInputSessionEfficacyAccumulator_enumerateTextInputActionsAnalytics___block_invoke_4;
    v15[3] = &unk_1E530C6B8;
    char v8 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    id v9 = v8;
    uint64_t v10 = *(void *)(a1 + 80);
    id v16 = v9;
    uint64_t v20 = v10;
    uint64_t v21 = a3;
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 72);
    id v17 = v11;
    uint64_t v19 = v12;
    long long v14 = *(_OWORD *)(a1 + 56);
    id v13 = (id)v14;
    long long v18 = v14;
    [v5 enumerateObjectsUsingBlock:v15];
  }
}

void __77___UITextInputSessionEfficacyAccumulator_enumerateTextInputActionsAnalytics___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [MEMORY[0x1E4F1CA98] null];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77___UITextInputSessionEfficacyAccumulator_enumerateTextInputActionsAnalytics___block_invoke_5;
    v13[3] = &unk_1E530C690;
    char v8 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v8;
    uint64_t v18 = a3;
    long long v19 = *(_OWORD *)(a1 + 80);
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 72);
    id v15 = v9;
    uint64_t v17 = v10;
    long long v12 = *(_OWORD *)(a1 + 56);
    id v11 = (id)v12;
    long long v16 = v12;
    [v5 enumerateKeysAndObjectsUsingBlock:v13];
  }
}

void __77___UITextInputSessionEfficacyAccumulator_enumerateTextInputActionsAnalytics___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  v56[26] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (([v6 isAllZeroes] & 1) == 0)
  {
    id v52 = v5;
    char v7 = [v5 componentsSeparatedByString:@"|"];
    uint64_t v8 = [*(id *)(a1 + 32) cleanIdForPublishing:*(void *)(a1 + 40)];
    uint64_t v9 = *(void *)(a1 + 80) & 1;
    uint64_t v10 = (*(void *)(a1 + 80) >> 2) & 1;
    id v43 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v55[0] = @"src";
    v48 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 88)];
    v56[0] = v48;
    v55[1] = @"type";
    v47 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 96)];
    v56[1] = v47;
    v55[2] = @"netChars";
    v46 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "netCharacters"));
    v56[2] = v46;
    v55[3] = @"usrRmChars";
    v45 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "userRemovedCharacters"));
    v56[3] = v45;
    v55[4] = @"netEmojis";
    v44 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "netEmojiCharacters"));
    v56[4] = v44;
    v55[5] = @"usrRmEmojis";
    v42 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "userRemovedEmojiCharacters"));
    v56[5] = v42;
    v55[6] = @"isEmojiSearch";
    v41 = [NSNumber numberWithBool:v9];
    v56[6] = v41;
    v55[7] = @"isMarkedText";
    v40 = [NSNumber numberWithBool:v10];
    v56[7] = v40;
    v55[8] = @"inputActionCount";
    v39 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "inputActions"));
    v56[8] = v39;
    v55[9] = @"largestSessionInsertion";
    unint64_t v11 = *(void *)(*(void *)(a1 + 32) + 72);
    if (v11)
    {
      if (v11 >= 0xA)
      {
        if (v11 >> 4 < 0x271) {
          int v13 = 4;
        }
        else {
          int v13 = 5;
        }
        if (v11 >= 0x3E8) {
          unsigned int v14 = v13;
        }
        else {
          unsigned int v14 = 3;
        }
        if (v11 >= 0x64) {
          uint64_t v12 = v14;
        }
        else {
          uint64_t v12 = 2;
        }
      }
      else
      {
        uint64_t v12 = 1;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
    v38 = [NSNumber numberWithUnsignedInt:v12];
    v56[9] = v38;
    v55[10] = @"largestSessionDeletion";
    unint64_t v15 = *(void *)(*(void *)(a1 + 32) + 80);
    id v51 = v6;
    if (v15)
    {
      if (v15 >= 0xA)
      {
        if (v15 >> 4 < 0x271) {
          int v17 = 4;
        }
        else {
          int v17 = 5;
        }
        if (v15 >= 0x3E8) {
          unsigned int v18 = v17;
        }
        else {
          unsigned int v18 = 3;
        }
        if (v15 >= 0x64) {
          uint64_t v16 = v18;
        }
        else {
          uint64_t v16 = 2;
        }
      }
      else
      {
        uint64_t v16 = 1;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
    v37 = [NSNumber numberWithUnsignedInt:v16];
    v56[10] = v37;
    v55[11] = @"sessionNetChars";
    uint64_t v19 = [NSNumber numberWithInt:_UITextInputActionsNSIntegerToLog10Integer(*(void *)(*(void *)(a1 + 32) + 88))];
    v36 = (void *)v19;
    uint64_t v20 = MEMORY[0x1E4F1CC28];
    if (*(void *)(*(void *)(a1 + 32) + 104) + *(void *)(*(void *)(a1 + 32) + 112)) {
      uint64_t v20 = MEMORY[0x1E4F1CC38];
    }
    v56[11] = v19;
    v56[12] = v20;
    v55[12] = @"sessionStartedWithDeletion";
    v55[13] = @"initialUsrRmChars";
    v35 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    v56[13] = v35;
    v55[14] = @"initialUsrRmEmojis";
    v34 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(a1 + 32) + 112)];
    v56[14] = v34;
    v55[15] = @"sessionIsModeless";
    v33 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 56)];
    v56[15] = v33;
    v55[16] = @"sessionActions";
    v32 = [*(id *)(a1 + 48) sessionActionString];
    v56[16] = v32;
    v55[17] = @"sessionHasPrimaryInput";
    uint64_t v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "sessionHasOnlyPrimaryInput"));
    v56[17] = v21;
    v55[18] = @"sessionHasDictation";
    uint64_t v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "sessionHasDictation"));
    v56[18] = v22;
    v55[19] = @"language";
    uint64_t v23 = [v7 objectAtIndexedSubscript:0];
    v56[19] = v23;
    v55[20] = @"region";
    v24 = [v7 objectAtIndexedSubscript:1];
    v56[20] = v24;
    v55[21] = @"kbVariant";
    v25 = [v7 objectAtIndexedSubscript:2];
    v56[21] = v25;
    v55[22] = @"kbLayout";
    v26 = [v7 objectAtIndexedSubscript:3];
    v56[22] = v26;
    v55[23] = @"kbType";
    v50 = v7;
    v27 = [v7 objectAtIndexedSubscript:4];
    v56[23] = v27;
    v49 = (void *)v8;
    v56[24] = v8;
    v55[24] = @"bundleId";
    v55[25] = @"internalProcId";
    v56[25] = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:26];
    v29 = (void *)[v43 initWithDictionary:v28];

    if (*(void *)(*(void *)(a1 + 32) + 128)) {
      objc_msgSend(v29, "addEntriesFromDictionary:");
    }
    uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    id v6 = v51;
    id v5 = v52;
    if (v30)
    {
      v53 = @"errors";
      uint64_t v54 = v30;
      v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      [v29 addEntriesFromDictionary:v31];
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

@end