@interface PSCoreMLScoringModel
@end

@implementation PSCoreMLScoringModel

id __49___PSCoreMLScoringModel_featureOrderFromMetadata__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [a2 description];
  uint64_t v3 = [v2 length];
  if (v3 && (uint64_t v4 = v3, [v2 characterAtIndex:0] - 97 <= 0x19))
  {
    unint64_t v5 = (2 * v4) | 1;
    memptr = 0;
    uint64_t v13 = 0;
    if (v5 > 0x200)
    {
      int v9 = malloc_type_posix_memalign(&memptr, 8uLL, 2 * v4, 0x1000040BDFB0063uLL);
      LOBYTE(v13) = 0;
      if (v9)
      {
        id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
        objc_exception_throw(v10);
      }
      v6 = memptr;
    }
    else
    {
      v6 = (_WORD *)((char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
      bzero(v6, (2 * v4) | 1);
    }
    [v2 getCharacters:v6];
    *v6 -= 32;
    v7 = (void *)[[NSString alloc] initWithCharacters:v6 length:v4];

    if (v5 >= 0x201) {
      free(v6);
    }
  }
  else
  {
    v7 = v2;
  }

  return v7;
}

void __90___PSCoreMLScoringModel_reformatCandidateDictionaryIntoFeatureTensor_candidateList_error___block_invoke(uint64_t a1, char *a2, size_t a3, void *a4)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v26 = a2;
  bzero(a2, a3);
  v8 = [v7 objectAtIndexedSubscript:*(void *)(a1 + 80)];
  int v9 = [v8 intValue];

  v22 = v7;
  id v10 = [v7 objectAtIndexedSubscript:*(void *)(a1 + 80) + 1];
  int v11 = [v10 intValue];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v12 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = a2;
    v24 = &a2[a3];
    uint64_t v25 = v11;
    uint64_t v15 = *(void *)v38;
    uint64_t v16 = 4 * v9;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        v19 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __90___PSCoreMLScoringModel_reformatCandidateDictionaryIntoFeatureTensor_candidateList_error___block_invoke_2;
        v27[3] = &unk_1E5AE1870;
        id v28 = v19;
        v20 = *(void **)(a1 + 48);
        id v29 = *(id *)(a1 + 56);
        v33 = v14;
        uint64_t v34 = v25;
        v35 = v24;
        v36 = v26;
        id v30 = *(id *)(a1 + 64);
        id v31 = *(id *)(a1 + 72);
        uint64_t v32 = v18;
        id v21 = v19;
        [v20 enumerateObjectsUsingBlock:v27];

        v14 += v16;
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v13);
  }
}

void __90___PSCoreMLScoringModel_reformatCandidateDictionaryIntoFeatureTensor_candidateList_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  CFNumberRef v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if ((v6
     || ([*(id *)(a1 + 40) objectForKeyedSubscript:v5],
         (CFNumberRef v6 = (const __CFNumber *)objc_claimAutoreleasedReturnValue()) != 0))
    && ([(__CFNumber *)v6 doubleValue], fabs(v7) != INFINITY))
  {
    v8 = (void *)(*(void *)(a1 + 72) + 4 * *(void *)(a1 + 80) * a3);
    if ((unint64_t)v8 > *(void *)(a1 + 88) - 4)
    {
      uint64_t v13 = *(void *)(a1 + 72) + 4 * *(void *)(a1 + 80) * a3;
      int v9 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        uint64_t v11 = *(void *)(a1 + 88);
        uint64_t v10 = *(void *)(a1 + 96);
        uint64_t v12 = *(void *)(a1 + 80);
        *(_DWORD *)buf = 134219266;
        uint64_t v15 = v13;
        __int16 v16 = 2048;
        uint64_t v17 = v10;
        __int16 v18 = 2048;
        uint64_t v19 = v11;
        __int16 v20 = 2114;
        id v21 = v5;
        __int16 v22 = 2048;
        uint64_t v23 = a3;
        __int16 v24 = 2048;
        uint64_t v25 = v12;
        _os_log_fault_impl(&dword_1A314B000, v9, OS_LOG_TYPE_FAULT, "Pointer %p out of range %p - %p (featureName=%{public}@, featureIdx=%tu, colStride=%tu)", buf, 0x3Eu);
      }

      if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
        abort();
      }
    }
    else
    {
      CFNumberGetValue(v6, kCFNumberFloat32Type, v8);
    }
  }
  else
  {
    [*(id *)(a1 + 48) addObject:v5];
    [*(id *)(a1 + 56) addObject:*(void *)(a1 + 64)];
  }
}

id __56___PSCoreMLScoringModel_scoreCandidatesWithCoreMLModel___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[_PSCandidate selfCandidate];
  if ([v2 isEqual:v3]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = v2;
  }
  id v5 = v4;

  return v5;
}

void __56___PSCoreMLScoringModel_scoreCandidatesWithCoreMLModel___block_invoke_154(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 objectAtIndexedSubscript:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

void __58___PSCoreMLScoringModel_batchPredictWithFeatureDictArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  id v5 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
    id v7 = NSNumber;
    [v6 doubleValue];
    v8 = objc_msgSend(v7, "numberWithDouble:");
    [*(id *)(a1 + 40) setObject:v8 atIndexedSubscript:a3];
  }
  else
  {
    [*(id *)(a1 + 40) setObject:&unk_1EF676808 atIndexedSubscript:a3];
  }
}

uint64_t __147___PSCoreMLScoringModel_getSuggestionProxiesForCandidateToFeatureVectorDictGetter_predictionContext_messageInteractionCache_shareInteractionCache___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

@end