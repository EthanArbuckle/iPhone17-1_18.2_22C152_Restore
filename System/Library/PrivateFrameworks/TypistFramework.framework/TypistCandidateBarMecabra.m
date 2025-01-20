@interface TypistCandidateBarMecabra
- (BOOL)hasCandidate:(id)a3 withAlternativeText:(id)a4;
- (BOOL)hasCandidate:(id)a3 withAlternativeText:(id)a4 inRange:(_NSRange)a5;
- (BOOL)hasVisibleCandidate:(id)a3;
- (BOOL)isExtendedCandidateViewMode;
- (BOOL)scrollCandidateBar:(int)a3;
- (BOOL)scrollCandidateBarByOneScreen;
- (BOOL)scrollToCandidateOnBar:(id)a3;
- (BOOL)scrollToCandidateOnBarByPosition:(int64_t)a3;
- (TypistCandidateBarMecabra)init;
- (id)candidateUIInformation:(id)a3;
- (id)getAllCandidates;
- (id)getVisibleCandidates;
- (int64_t)getIndexOfCandidate:(id)a3;
- (int64_t)getIndexOfCandidate:(id)a3 withAlternativeText:(id)a4;
- (int64_t)selectCandidate:(id)a3;
- (int64_t)selectCandidateAtIndex:(int64_t)a3;
- (void)hideExtendedCandidateView;
- (void)showExtendedCandidateView;
- (void)toggleExtendedCandidateViewMode;
@end

@implementation TypistCandidateBarMecabra

- (TypistCandidateBarMecabra)init
{
  v3.receiver = self;
  v3.super_class = (Class)TypistCandidateBarMecabra;
  return [(TypistCandidateBar *)&v3 init];
}

- (id)candidateUIInformation:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__9;
  v14 = __Block_byref_object_dispose__9;
  id v15 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__TypistCandidateBarMecabra_candidateUIInformation___block_invoke;
  v7[3] = &unk_265559758;
  id v4 = v3;
  id v8 = v4;
  v9 = &v10;
  +[TypistKeyboardUtilities runOnMainThread:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __52__TypistCandidateBarMecabra_candidateUIInformation___block_invoke(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F1CBC8] allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v61;
    id v4 = @"TUICandidateCell";
    id v48 = v1;
    uint64_t v40 = *(void *)v61;
    do
    {
      uint64_t v5 = 0;
      uint64_t v41 = v2;
      do
      {
        if (*(void *)v61 != v3) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v60 + 1) + 8 * v5);
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        v46 = v6;
        v7 = [v6 allSubViews];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v56 objects:v67 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v57;
          v49 = v7;
          uint64_t v42 = *(void *)v57;
          uint64_t v43 = v5;
          do
          {
            uint64_t v11 = 0;
            uint64_t v44 = v9;
            do
            {
              if (*(void *)v57 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v56 + 1) + 8 * v11);
              NSClassFromString(&cfstr_Uikeyboardcand_2.isa);
              if ((objc_opt_isKindOfClass() & 1) != 0
                || (NSClassFromString(&cfstr_Tuicandidatevi.isa), (objc_opt_isKindOfClass() & 1) != 0))
              {
                uint64_t v45 = v11;
                long long v54 = 0u;
                long long v55 = 0u;
                long long v52 = 0u;
                long long v53 = 0u;
                v47 = v12;
                id obj = [v12 allSubViews];
                uint64_t v13 = [obj countByEnumeratingWithState:&v52 objects:v66 count:16];
                if (v13)
                {
                  uint64_t v14 = v13;
                  uint64_t v15 = *(void *)v53;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v14; ++i)
                    {
                      if (*(void *)v53 != v15) {
                        objc_enumerationMutation(obj);
                      }
                      v17 = *(void **)(*((void *)&v52 + 1) + 8 * i);
                      NSClassFromString(&v4->isa);
                      if (objc_opt_isKindOfClass())
                      {
                        v18 = v4;
                        v19 = [v17 performSelector:sel_textLabel];
                        v20 = [v17 performSelector:sel_candidateNumberLabel];
                        v21 = [v19 text];
                        char v22 = [v21 isEqualToString:*(void *)(a1 + 32)];

                        if (v22)
                        {
                          v23 = [v17 superview];
                          [v47 frame];
                          objc_msgSend(v23, "convertRect:toView:", v46);
                          UIRectGetCenter();
                          double v25 = v24;
                          double v27 = v26;

                          v28 = [v20 text];
                          BOOL v29 = [v17 performSelector:sel_isFocused] != 0;
                          uint64_t v30 = [v20 isHidden] ^ 1;
                          uint64_t v31 = *(void *)(a1 + 32);
                          v64[0] = @"candidateString";
                          v64[1] = @"candidateNumberString";
                          v32 = &stru_270C5A038;
                          if (v28) {
                            v32 = v28;
                          }
                          v65[0] = v31;
                          v65[1] = v32;
                          v64[2] = @"isFocused";
                          v33 = [NSNumber numberWithBool:v29];
                          v65[2] = v33;
                          v64[3] = @"rowSelected";
                          v34 = [NSNumber numberWithBool:v30];
                          v65[3] = v34;
                          v64[4] = @"centerX";
                          v35 = [NSNumber numberWithDouble:v25];
                          v65[4] = v35;
                          v64[5] = @"centerY";
                          v36 = [NSNumber numberWithDouble:v27];
                          v65[5] = v36;
                          uint64_t v37 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:6];
                          uint64_t v38 = *(void *)(*(void *)(a1 + 40) + 8);
                          v39 = *(void **)(v38 + 40);
                          *(void *)(v38 + 40) = v37;

                          id v1 = v48;
                          goto LABEL_32;
                        }

                        id v4 = v18;
                      }
                    }
                    uint64_t v14 = [obj countByEnumeratingWithState:&v52 objects:v66 count:16];
                    if (v14) {
                      continue;
                    }
                    break;
                  }
                }

                id v1 = v48;
                v7 = v49;
                uint64_t v10 = v42;
                uint64_t v5 = v43;
                uint64_t v9 = v44;
                uint64_t v11 = v45;
              }
              ++v11;
            }
            while (v11 != v9);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v56 objects:v67 count:16];
          }
          while (v9);
        }

        ++v5;
        uint64_t v3 = v40;
      }
      while (v5 != v41);
      uint64_t v2 = [v1 countByEnumeratingWithState:&v60 objects:v68 count:16];
    }
    while (v2);
  }
LABEL_32:
}

- (id)getVisibleCandidates
{
  uint64_t v2 = +[TypistKeyboardData keyboardData];
  return (id)[(objc_class *)v2 getVisibleCandidateList:@"typistCandidateBarTypeMecabra"];
}

- (BOOL)hasVisibleCandidate:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(TypistCandidateBarMecabra *)self getVisibleCandidates];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "candidate", (void)v12);
        char v10 = [v9 isEqualToString:v4];

        if (v10)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)hasCandidate:(id)a3 withAlternativeText:(id)a4
{
  return [(TypistCandidateBarMecabra *)self getIndexOfCandidate:a3 withAlternativeText:a4] != -1;
}

- (BOOL)hasCandidate:(id)a3 withAlternativeText:(id)a4 inRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v7 = [(TypistCandidateBarMecabra *)self getIndexOfCandidate:a3 withAlternativeText:a4];
  BOOL v9 = v7 >= location && v7 - location < length;
  return v7 >= 0 && v9;
}

- (id)getAllCandidates
{
  int v3 = 50;
  do
  {
    if ([(TypistCandidateBar *)self hasCandidates]) {
      break;
    }
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    TYLogl(OS_LOG_TYPE_DEBUG, @"%@: Waiting for visible candidates", v6, v7, v8, v9, v10, v11, (char)v5);

    +[TypistKeyboardUtilities waitFor:0.1];
    --v3;
  }
  while (v3);
  v14.receiver = self;
  v14.super_class = (Class)TypistCandidateBarMecabra;
  long long v12 = [(TypistCandidateBar *)&v14 getAllCandidates];
  return v12;
}

- (int64_t)getIndexOfCandidate:(id)a3
{
  return [(TypistCandidateBarMecabra *)self getIndexOfCandidate:a3 withAlternativeText:0];
}

- (int64_t)getIndexOfCandidate:(id)a3 withAlternativeText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[TypistKeyboardUtilities hasMarkedText])
  {
    uint64_t v8 = +[TypistKeyboardUtilities markedText];
    char v9 = [v8 isEqualToString:v6];

    if (v9)
    {
      unint64_t v10 = 0;
      goto LABEL_18;
    }
  }
  uint64_t v11 = [(TypistCandidateBarMecabra *)self getAllCandidates];
  if (![v11 count]) {
    goto LABEL_16;
  }
  unint64_t v10 = 0;
  while (1)
  {
    long long v12 = [v11 objectAtIndex:v10];
    long long v13 = [v12 candidate];
    if (([v6 isEqualToString:v13] & 1) == 0)
    {

      goto LABEL_11;
    }
    if (!v7) {
      break;
    }
    objc_super v14 = [v12 alternativeText];
    char v15 = [v7 isEqualToString:v14];

    if (v15) {
      goto LABEL_14;
    }
LABEL_11:
    ++v10;

    if (v10 >= [v11 count])
    {
      unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_15;
    }
  }

LABEL_14:
LABEL_15:
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
LABEL_16:
  }
    unint64_t v10 = -1;

LABEL_18:
  return v10;
}

- (BOOL)scrollCandidateBarByOneScreen
{
  if ([(TypistCandidateBarMecabra *)self isExtendedCandidateViewMode]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  return [(TypistCandidateBarMecabra *)self scrollCandidateBar:v3];
}

- (int64_t)selectCandidate:(id)a3
{
  id v4 = a3;
  if ([(TypistCandidateBar *)self hasCandidate:v4])
  {
    unint64_t v5 = [(TypistCandidateBarMecabra *)self getIndexOfCandidate:v4];
    if ([(TypistCandidateBar *)self hasCandidate:v4])
    {
      if (![(TypistCandidateBarMecabra *)self hasVisibleCandidate:v4])
      {
        TYLog(@"Looking for candidate [%@] in the candidate bar...", v6, v7, v8, v9, v10, v11, v12, (char)v4);
        if ([(TypistCandidateBarMecabra *)self scrollCandidateBarByOneScreen])
        {
          while (![(TypistCandidateBarMecabra *)self hasVisibleCandidate:v4]
               && [(TypistCandidateBarMecabra *)self scrollCandidateBarByOneScreen])
            ;
        }
      }
    }
    if (v5 <= 0x7FFFFFFFFFFFFFFELL)
    {
      [(TypistCandidateBar *)self centerOfCandidate:v4];
      uint64_t v14 = v13;
      uint64_t v16 = v15;
      uint64_t v17 = (void *)MEMORY[0x263F62CF8];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __45__TypistCandidateBarMecabra_selectCandidate___block_invoke;
      v20[3] = &unk_265559DD8;
      id v21 = v4;
      uint64_t v22 = v14;
      uint64_t v23 = v16;
      v18 = [v17 eventStreamWithEventActions:v20];
      +[TypistKeyboardUtilities launchRecapWithSyntheticEventStream:v18];
      +[TypistKeyboardUtilities waitFor:0.2];
    }
  }
  else
  {
    unint64_t v5 = -1;
  }

  return v5;
}

void __45__TypistCandidateBarMecabra_selectCandidate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F62CC8];
  id v14 = a2;
  id v4 = [v3 touchScreenDigitizerSender];
  [v14 setSenderProperties:v4];

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v13 = NSStringFromCGPoint(*(CGPoint *)(a1 + 40));
  TYLog(@"Tapping [%@] candidate center at: %@", v6, v7, v8, v9, v10, v11, v12, v5);

  objc_msgSend(v14, "tap:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (int64_t)selectCandidateAtIndex:(int64_t)a3
{
  uint64_t v5 = [(TypistCandidateBarMecabra *)self getAllCandidates];
  if ([v5 count] <= (unint64_t)a3)
  {
    int64_t v15 = -1;
  }
  else
  {
    [(objc_class *)+[TypistKeyboardData keyboardData] showCandidateAtIndex:a3];
    uint64_t v6 = [v5 objectAtIndex:a3];
    uint64_t v7 = [v6 candidate];

    uint64_t v8 = [NSNumber numberWithInteger:a3];
    TYLogl(OS_LOG_TYPE_DEBUG, @"The candidate at position %@ is %@", v9, v10, v11, v12, v13, v14, (char)v8);

    int64_t v15 = [(TypistCandidateBarMecabra *)self selectCandidate:v7];
  }

  return v15;
}

- (void)showExtendedCandidateView
{
  if (![(TypistCandidateBarMecabra *)self isExtendedCandidateViewMode])
  {
    [(TypistCandidateBarMecabra *)self toggleExtendedCandidateViewMode];
  }
}

- (void)hideExtendedCandidateView
{
  if ([(TypistCandidateBarMecabra *)self isExtendedCandidateViewMode])
  {
    [(TypistCandidateBarMecabra *)self toggleExtendedCandidateViewMode];
  }
}

- (void)toggleExtendedCandidateViewMode
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x3010000000;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = &unk_26042309E;
  [(objc_class *)+[TypistKeyboardData keyboardData] getExtendedCandidateViewToggleButtonCenter];
  uint64_t v11 = v2;
  uint64_t v12 = v3;
  if (v8[4] != *MEMORY[0x263F00148] || v8[5] != *(double *)(MEMORY[0x263F00148] + 8))
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60__TypistCandidateBarMecabra_toggleExtendedCandidateViewMode__block_invoke;
    v6[3] = &unk_265559E00;
    v6[4] = &v7;
    uint64_t v5 = [MEMORY[0x263F62CF8] eventStreamWithEventActions:v6];
    +[TypistKeyboardUtilities launchRecapWithSyntheticEventStream:v5];
    +[TypistKeyboardUtilities waitFor:0.5];
  }
  _Block_object_dispose(&v7, 8);
}

void __60__TypistCandidateBarMecabra_toggleExtendedCandidateViewMode__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F62CC8];
  id v13 = a2;
  id v4 = [v3 touchScreenDigitizerSender];
  [v13 setSenderProperties:v4];

  uint64_t v5 = NSStringFromCGPoint(*(CGPoint *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
  TYLog(@"Tapping center of toggle button: %@", v6, v7, v8, v9, v10, v11, v12, (char)v5);

  objc_msgSend(v13, "tap:", *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
}

- (BOOL)scrollCandidateBar:(int)a3
{
  if ((a3 & 0xFFFFFFFE) == 2)
  {
    if ([(TypistCandidateBarMecabra *)self isExtendedCandidateViewMode])
    {
LABEL_9:
      BOOL v12 = [(TypistCandidateBarMecabra *)self isExtendedCandidateViewMode];
      v19 = @"Bar View";
      if (v12) {
        v19 = @"Extended View";
      }
      TYLogl(OS_LOG_TYPE_ERROR, @"scrollCandidateBar: Invalid scroll direction for candidate view mode: %@", v13, v14, v15, v16, v17, v18, (char)v19);
      LOBYTE(v11) = 0;
      return v11;
    }
  }
  else if (a3 <= 1 {
         && ![(TypistCandidateBarMecabra *)self isExtendedCandidateViewMode])
  }
  {
    goto LABEL_9;
  }
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0x3FF0000000000000;
  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x3032000000;
  double v26 = __Block_byref_object_copy__9;
  double v27 = __Block_byref_object_dispose__9;
  id v28 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __48__TypistCandidateBarMecabra_scrollCandidateBar___block_invoke;
  v21[3] = &unk_265559E50;
  v21[4] = self;
  v21[5] = v29;
  int v22 = a3;
  v21[6] = &v23;
  +[TypistKeyboardUtilities runOnMainThread:v21];
  if (v24[5])
  {
    +[TypistKeyboardUtilities launchRecapWithSyntheticEventStream:](TypistKeyboardUtilities, "launchRecapWithSyntheticEventStream:");
    +[TypistKeyboardUtilities waitFor:0.5];
  }
  uint64_t v5 = [(TypistCandidateBarMecabra *)self getVisibleCandidates];
  uint64_t v6 = [v5 lastObject];
  uint64_t v7 = [v6 candidate];
  uint64_t v8 = [(TypistCandidateBarMecabra *)self getAllCandidates];
  uint64_t v9 = [v8 lastObject];
  uint64_t v10 = [v9 candidate];
  int v11 = [v7 isEqualToString:v10] ^ 1;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(v29, 8);
  return v11;
}

void __48__TypistCandidateBarMecabra_scrollCandidateBar___block_invoke(uint64_t a1)
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id obj = [*(id *)(a1 + 32) getVisibleCandidates];
  unint64_t v2 = [obj count];
  uint64_t v3 = [*(id *)(a1 + 32) getAllCandidates];
  if (v2 >= [v3 count])
  {
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) getVisibleCandidates];
    uint64_t v5 = [v4 lastObject];
    uint64_t v6 = [v5 candidate];
    uint64_t v71 = a1;
    uint64_t v7 = [*(id *)(a1 + 32) getAllCandidates];
    uint64_t v8 = [v7 lastObject];
    uint64_t v9 = [v8 candidate];
    char v10 = [v6 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      [MEMORY[0x263F1CBC8] allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id obja = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [obja countByEnumeratingWithState:&v86 objects:v92 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v87;
        double v14 = 0.0;
        double v15 = 0.0;
        double v16 = 0.0;
        double v17 = 0.0;
        uint64_t v18 = v71;
        uint64_t v70 = *(void *)v87;
        do
        {
          uint64_t v19 = 0;
          uint64_t v72 = v12;
          do
          {
            if (*(void *)v87 != v13) {
              objc_enumerationMutation(obja);
            }
            v20 = *(void **)(*((void *)&v86 + 1) + 8 * v19);
            NSClassFromString(&cfstr_Uiremotekeyboa.isa);
            if (objc_opt_isKindOfClass())
            {
              id v21 = [v20 allSubViews];
              long long v82 = 0u;
              long long v83 = 0u;
              long long v84 = 0u;
              long long v85 = 0u;
              id v22 = v21;
              uint64_t v23 = [v22 countByEnumeratingWithState:&v82 objects:v91 count:16];
              if (v23)
              {
                uint64_t v24 = v23;
                uint64_t v25 = *(void *)v83;
                while (2)
                {
                  for (uint64_t i = 0; i != v24; ++i)
                  {
                    if (*(void *)v83 != v25) {
                      objc_enumerationMutation(v22);
                    }
                    double v27 = *(void **)(*((void *)&v82 + 1) + 8 * i);
                    NSClassFromString(&cfstr_Uikeyboardcand_3.isa);
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      NSClassFromString(&cfstr_Uikeyboardcand_4.isa);
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        NSClassFromString(&cfstr_Tuicandidatevi.isa);
                        if ((objc_opt_isKindOfClass() & 1) == 0) {
                          continue;
                        }
                      }
                    }
                    id v28 = v27;
                    if ([*(id *)(v18 + 32) isExtendedCandidateViewMode])
                    {
                      long long v81 = 0u;
                      long long v79 = 0u;
                      long long v80 = 0u;
                      long long v78 = 0u;
                      BOOL v29 = [v28 allSubViews];
                      uint64_t v30 = [v29 countByEnumeratingWithState:&v78 objects:v90 count:16];
                      if (v30)
                      {
                        uint64_t v31 = v30;
                        uint64_t v32 = *(void *)v79;
                        while (2)
                        {
                          for (uint64_t j = 0; j != v31; ++j)
                          {
                            if (*(void *)v79 != v32) {
                              objc_enumerationMutation(v29);
                            }
                            v34 = *(void **)(*((void *)&v78 + 1) + 8 * j);
                            NSClassFromString(&cfstr_Uicollectionvi.isa);
                            if (objc_opt_isKindOfClass())
                            {
                              id v35 = v34;

                              id v28 = v35;
                              goto LABEL_31;
                            }
                          }
                          uint64_t v31 = [v29 countByEnumeratingWithState:&v78 objects:v90 count:16];
                          if (v31) {
                            continue;
                          }
                          break;
                        }
                      }
LABEL_31:
                    }
                    v36 = [v28 superview];
                    [v28 frame];
                    double v38 = v37;
                    double v40 = v39;
                    double v42 = v41;
                    double v44 = v43;
                    uint64_t v45 = [v20 rootViewController];
                    v46 = [v45 view];
                    objc_msgSend(v36, "convertRect:toView:", v46, v38, v40, v42, v44);
                    double v17 = v47;
                    double v16 = v48;

                    v49 = [v28 superview];
                    [v28 frame];
                    double v51 = v50;
                    double v53 = v52;
                    double v55 = v54;
                    double v57 = v56;
                    long long v58 = [MEMORY[0x263F1C408] sharedApplication];
                    long long v59 = [v58 delegate];
                    long long v60 = [v59 window];
                    long long v61 = [v60 rootViewController];
                    long long v62 = [v61 view];
                    objc_msgSend(v49, "convertRect:toView:", v62, v51, v53, v55, v57);
                    UIRectGetCenter();
                    double v15 = v63;
                    double v14 = v64;

                    uint64_t v18 = v71;
                    goto LABEL_33;
                  }
                  uint64_t v24 = [v22 countByEnumeratingWithState:&v82 objects:v91 count:16];
                  if (v24) {
                    continue;
                  }
                  break;
                }
LABEL_33:
                uint64_t v13 = v70;
                uint64_t v12 = v72;
              }
            }
            ++v19;
          }
          while (v19 != v12);
          uint64_t v12 = [obja countByEnumeratingWithState:&v86 objects:v92 count:16];
        }
        while (v12);
      }
      else
      {
        double v14 = 0.0;
        double v15 = 0.0;
        double v16 = 0.0;
        double v17 = 0.0;
        uint64_t v18 = v71;
      }
      *(double *)(*(void *)(*(void *)(v18 + 40) + 8) + 24) = v17 / 300.0;
      double v76 = 0.0;
      double v77 = 0.0;
      switch(*(_DWORD *)(v18 + 56))
      {
        case 0:
          double v65 = -0.5;
          goto LABEL_45;
        case 1:
          double v65 = 0.5;
LABEL_45:
          double v77 = v16 * v65 + 0.0;
          break;
        case 2:
          double v66 = -0.5;
          goto LABEL_48;
        case 3:
          double v66 = 0.5;
LABEL_48:
          double v76 = v17 * v66 + 0.0;
          break;
        default:
          break;
      }
      +[TypistKeyboardUtilities correctForRotation:orientation:](TypistKeyboardUtilities, "correctForRotation:orientation:", &v76, +[TypistKeyboardUtilities toUIDeviceOrientation:](TypistKeyboardUtilities, "toUIDeviceOrientation:", +[TypistKeyboardUtilities getUIInterfaceOrientation]));
      v75[0] = MEMORY[0x263EF8330];
      v75[1] = 3221225472;
      v75[2] = __48__TypistCandidateBarMecabra_scrollCandidateBar___block_invoke_2;
      v75[3] = &unk_265559E28;
      *(double *)&v75[5] = v15;
      *(double *)&v75[6] = v14;
      *(double *)&v75[7] = v15 + v76;
      *(double *)&v75[8] = v14 + v77;
      v75[4] = *(void *)(v18 + 40);
      uint64_t v67 = [MEMORY[0x263F62CF8] eventStreamWithEventActions:v75];
      uint64_t v68 = *(void *)(*(void *)(v18 + 48) + 8);
      uint64_t v69 = *(void **)(v68 + 40);
      *(void *)(v68 + 40) = v67;
    }
  }
}

void __48__TypistCandidateBarMecabra_scrollCandidateBar___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F62CC8];
  id v14 = a2;
  id v4 = [v3 touchScreenDigitizerSender];
  [v14 setSenderProperties:v4];

  uint64_t v5 = NSStringFromCGPoint(*(CGPoint *)(a1 + 40));
  uint64_t v13 = NSStringFromCGPoint(*(CGPoint *)(a1 + 56));
  TYLog(@"Scrolling candidate bar...dragging from %@ to %@", v6, v7, v8, v9, v10, v11, v12, (char)v5);

  objc_msgSend(v14, "dragWithStartPoint:endPoint:duration:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

- (BOOL)scrollToCandidateOnBar:(id)a3
{
  return 1;
}

- (BOOL)scrollToCandidateOnBarByPosition:(int64_t)a3
{
  return 1;
}

- (BOOL)isExtendedCandidateViewMode
{
  unint64_t v2 = +[TypistKeyboardData keyboardData];
  return [(objc_class *)v2 isExtendedCandidateViewMode];
}

@end