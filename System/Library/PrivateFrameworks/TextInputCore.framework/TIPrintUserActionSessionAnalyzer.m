@interface TIPrintUserActionSessionAnalyzer
- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5;
- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4;
@end

@implementation TIPrintUserActionSessionAnalyzer

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v30 = a4;
  v31 = v6;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v7 = [v6 userActionHistory];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v10 = 0;
    uint64_t v11 = *(void *)v33;
LABEL_3:
    uint64_t v12 = 0;
    while (2)
    {
      if (*(void *)v33 != v11) {
        objc_enumerationMutation(v7);
      }
      v13 = *(void **)(*((void *)&v32 + 1) + 8 * v12);
      v14 = [v13 documentState];
      id v15 = [v14 contextBeforeInput];
      printf("%s: ", (const char *)[v15 UTF8String]);

      switch([v13 actionType])
      {
        case 0u:
          id v16 = v13;

          v17 = [v16 originalCandidate];

          if (v17)
          {
            v18 = [v16 originalCandidate];
            int v19 = [v18 isContinuousPathConversion];

            id v20 = [v16 originalAcceptedString];
            [v20 UTF8String];
            id v21 = [v16 acceptedString];
            [v21 UTF8String];
            if (v19) {
              printf("{%s}<-PB-%s-\n");
            }
            else {
              printf("[%s]<-PB-%s-\n");
            }
          }
          else
          {
            v25 = [v16 acceptedCandidate];
            int v26 = [v25 isContinuousPathConversion];

            id v27 = [v16 acceptedString];
            [v27 UTF8String];
            if (v26) {
              printf("{%s}\n");
            }
            else {
              printf("[%s]\n");
            }
          }
          v10 = v16;
          goto LABEL_17;
        case 1u:
          v22 = "<-DEL-";
          goto LABEL_16;
        case 2u:
          puts("CM");
          v23 = [v13 documentState];
          v24 = [v23 contextAfterInput];

          if (!v24) {
            goto LABEL_17;
          }
          v22 = "MOVEMENT FOUND";
LABEL_16:
          puts(v22);
LABEL_17:
          if (v9 != ++v12) {
            continue;
          }
          uint64_t v28 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
          uint64_t v9 = v28;
          if (!v28) {
            goto LABEL_29;
          }
          goto LABEL_3;
        case 3u:
          v22 = "DOC STATE CHANGE";
          goto LABEL_16;
        case 4u:
          v22 = "PATH";
          goto LABEL_16;
        default:
          v22 = "OTHER";
          goto LABEL_16;
      }
    }
  }
  v10 = 0;
LABEL_29:

  return 1;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return 2;
}

@end