@interface TIStandardTypingSessionConfidenceEvaluator
+ (double)calculateAlignedTypingSessionConfidence:(id)a3;
+ (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4;
@end

@implementation TIStandardTypingSessionConfidenceEvaluator

+ (double)calculateAlignedTypingSessionConfidence:(id)a3
{
  id v3 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v4 = [v3 alignedEntries];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__TIStandardTypingSessionConfidenceEvaluator_calculateAlignedTypingSessionConfidence___block_invoke;
  v11[3] = &unk_1E6E2A7C8;
  v11[4] = &v12;
  [v4 enumerateObjectsUsingBlock:v11];

  v5 = [v3 alignedEntries];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    double v7 = (double)(unint64_t)v13[3];
    v8 = [v3 alignedEntries];
    double v9 = v7 / ((double)(unint64_t)[v8 count] * 3.0);
  }
  else
  {
    double v9 = 1.0;
  }
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __86__TIStandardTypingSessionConfidenceEvaluator_calculateAlignedTypingSessionConfidence___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 inSessionAlignmentConfidence];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

+ (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v4 = [a3 userActionHistory];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    id v8 = 0;
    char v9 = 0;
    uint64_t v10 = *(void *)v23;
    unint64_t v11 = 2;
    do
    {
      uint64_t v12 = 0;
      int v20 = v7;
      int v21 = -v7;
      do
      {
        v13 = v8;
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
        switch([v14 actionType])
        {
          case 0u:
            BOOL v15 = (v9 & 1) == 0;
            char v9 = 0;
            goto LABEL_12;
          case 1u:
            char v9 = 0;
            BOOL v15 = [v13 actionType] == 0;
LABEL_12:
            if (!v15) {
              unint64_t v11 = 1;
            }
            break;
          case 2u:
            v16 = [v14 documentState];
            v17 = [v16 contextAfterInput];
            BOOL v18 = v17 != 0;

            v9 |= v18;
            break;
          case 3u:
            if (v21 != v12) {
              unint64_t v11 = 0;
            }
            break;
          case 4u:
          case 7u:
          case 8u:
          case 9u:
          case 0xAu:
          case 0xBu:
            break;
          case 6u:
            char v9 = 1;
            break;
          case 0xCu:
            unint64_t v11 = 1;
            break;
          default:
            unint64_t v11 = 0;
            break;
        }
        id v8 = v14;

        ++v12;
      }
      while (v6 != v12);
      int v7 = v20 + v6;
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v11 = 2;
  }

  return v11;
}

@end