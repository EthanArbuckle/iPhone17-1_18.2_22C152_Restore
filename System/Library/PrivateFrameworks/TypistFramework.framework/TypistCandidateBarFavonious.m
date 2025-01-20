@interface TypistCandidateBarFavonious
- (BOOL)hasVisibleCandidate:(id)a3;
- (id)candidateUIInformation:(id)a3;
- (id)getAllCandidates;
- (id)getVisibleCandidates;
- (int64_t)getIndexOfCandidate:(id)a3;
- (int64_t)selectCandidate:(id)a3;
- (int64_t)selectCandidateAtIndex:(int64_t)a3;
@end

@implementation TypistCandidateBarFavonious

- (id)candidateUIInformation:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__10;
  v14 = __Block_byref_object_dispose__10;
  id v15 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__TypistCandidateBarFavonious_candidateUIInformation___block_invoke;
  v7[3] = &unk_265559758;
  id v4 = v3;
  id v8 = v4;
  v9 = &v10;
  +[TypistKeyboardUtilities runOnMainThread:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __54__TypistCandidateBarFavonious_candidateUIInformation___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F1CBC8] allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v38;
    uint64_t v27 = *(void *)v38;
    do
    {
      uint64_t v4 = 0;
      uint64_t v28 = v2;
      do
      {
        if (*(void *)v38 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v37 + 1) + 8 * v4);
        NSClassFromString(&cfstr_Uiremotekeyboa.isa);
        if (objc_opt_isKindOfClass())
        {
          v30 = v5;
          uint64_t v31 = v4;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          v6 = [v5 allSubViews];
          uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v43 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void *)v34;
            while (2)
            {
              for (uint64_t i = 0; i != v8; ++i)
              {
                if (*(void *)v34 != v9) {
                  objc_enumerationMutation(v6);
                }
                v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                NSClassFromString(&cfstr_Uimorphinglabe.isa);
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v12 = [v11 performSelector:sel_textLabel];
                  v13 = [v12 text];
                  int v14 = [v13 isEqualToString:*(void *)(a1 + 32)];

                  if (v14)
                  {
                    id v15 = [v11 superview];
                    [v11 frame];
                    objc_msgSend(v15, "convertRect:toView:", v30);
                    UIRectGetCenter();
                    double v17 = v16;
                    double v19 = v18;

                    BOOL v20 = [v11 performSelector:sel_isFocused] != 0;
                    v42[0] = *(void *)(a1 + 32);
                    v41[0] = @"candidateString";
                    v41[1] = @"isFocused";
                    v21 = [NSNumber numberWithBool:v20];
                    v42[1] = v21;
                    v41[2] = @"centerX";
                    v22 = [NSNumber numberWithDouble:v17];
                    v42[2] = v22;
                    v41[3] = @"centerY";
                    v23 = [NSNumber numberWithDouble:v19];
                    v42[3] = v23;
                    uint64_t v24 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:4];
                    uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8);
                    v26 = *(void **)(v25 + 40);
                    *(void *)(v25 + 40) = v24;

                    goto LABEL_19;
                  }
                }
              }
              uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v43 count:16];
              if (v8) {
                continue;
              }
              break;
            }
          }
LABEL_19:

          uint64_t v3 = v27;
          uint64_t v2 = v28;
          uint64_t v4 = v31;
        }
        ++v4;
      }
      while (v4 != v2);
      uint64_t v2 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v2);
  }
}

- (id)getAllCandidates
{
  v8.receiver = self;
  v8.super_class = (Class)TypistCandidateBarFavonious;
  uint64_t v2 = [(TypistCandidateBar *)&v8 getAllCandidates];
  uint64_t v3 = (void *)[v2 mutableCopy];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__TypistCandidateBarFavonious_getAllCandidates__block_invoke;
  v6[3] = &unk_265559E80;
  id v4 = v3;
  id v7 = v4;
  [v4 enumerateObjectsUsingBlock:v6];

  return v4;
}

void __47__TypistCandidateBarFavonious_getAllCandidates__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = [a2 candidate];
  id v5 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v6 = [v7 stringByTrimmingCharactersInSet:v5];
  [*(id *)(a1 + 32) setObject:v6 atIndexedSubscript:a3];
}

- (id)getVisibleCandidates
{
  uint64_t v2 = +[TypistKeyboardData keyboardData];
  return (id)[(objc_class *)v2 getVisibleCandidateList:@"typistCandidateBarTypeFavonious"];
}

- (int64_t)getIndexOfCandidate:(id)a3
{
  id v4 = a3;
  id v5 = [(TypistCandidateBarFavonious *)self getAllCandidates];
  unint64_t v6 = 0;
  while (v6 < [v5 count])
  {
    id v7 = [v5 objectAtIndex:v6];
    int v8 = [v7 isEqualToString:v4];
    ++v6;

    if (v8)
    {
      if (v6 != 0x8000000000000000)
      {
        int64_t v9 = v6 - 1;
        goto LABEL_7;
      }
      break;
    }
  }
  int64_t v9 = -1;
LABEL_7:

  return v9;
}

- (BOOL)hasVisibleCandidate:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(TypistCandidateBarFavonious *)self getVisibleCandidates];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v6) {
    goto LABEL_17;
  }
  uint64_t v7 = *(void *)v23;
  while (2)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v23 != v7) {
        objc_enumerationMutation(v5);
      }
      int64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [v9 candidate];
LABEL_10:
        v11 = v10;
        goto LABEL_12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v9;
        goto LABEL_10;
      }
      uint64_t v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      TYLogl(OS_LOG_TYPE_ERROR, @"TypistCandidateBarFavonious - unrecognized candidate type: %@", v14, v15, v16, v17, v18, v19, (char)v13);

      v11 = 0;
LABEL_12:
      char v20 = [v11 isEqualToString:v4];

      if (v20)
      {
        LOBYTE(v6) = 1;
        goto LABEL_17;
      }
    }
    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_17:

  return v6;
}

- (int64_t)selectCandidate:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(TypistCandidateBarFavonious *)self getIndexOfCandidate:v4];
  if (v5 < 0) {
    goto LABEL_9;
  }
  int64_t v6 = v5;
  if (![(TypistCandidateBarFavonious *)self hasVisibleCandidate:v4])
  {
    double v7 = 0.0;
    do
    {
      +[TypistKeyboardUtilities waitFor:0.02];
      double v7 = v7 + 0.02;
    }
    while (![(TypistCandidateBarFavonious *)self hasVisibleCandidate:v4] && v7 < 2.0);
    if (v7 >= 2.0)
    {
      TYLogl(OS_LOG_TYPE_ERROR, @"TypistCandidateBar: Failed to find %@ in the favonious candidate bar after %fs.", v8, v9, v10, v11, v12, v13, (char)v4);
LABEL_9:
      int64_t v14 = -1;
      goto LABEL_10;
    }
  }
  int64_t v14 = [(TypistCandidateBarFavonious *)self selectCandidateAtIndex:v6];
LABEL_10:

  return v14;
}

- (int64_t)selectCandidateAtIndex:(int64_t)a3
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__TypistCandidateBarFavonious_selectCandidateAtIndex___block_invoke;
  v6[3] = &__block_descriptor_40_e34_v16__0___RCPEventStreamComposer__8l;
  void v6[4] = a3;
  id v4 = [MEMORY[0x263F62CF8] eventStreamWithEventActions:v6];
  +[TypistKeyboardUtilities launchRecapWithSyntheticEventStream:v4];

  return a3;
}

void __54__TypistCandidateBarFavonious_selectCandidateAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F62CC8];
  id v16 = a2;
  id v4 = [v3 touchScreenDigitizerSender];
  [v16 setSenderProperties:v4];

  [(objc_class *)+[TypistKeyboardData keyboardData] getCandidateCenterAtIndex:*(void *)(a1 + 32)];
  double x = v18.x;
  double y = v18.y;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v15 = NSStringFromCGPoint(v18);
  TYLog(@"Tapping index %li candidate center at: %@", v8, v9, v10, v11, v12, v13, v14, v7);

  objc_msgSend(v16, "tap:", x, y);
}

@end