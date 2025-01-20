@interface PNPersonDeduper
- (PNPersonDeduper)initWithPersonClusterManager:(id)a3 andInvalidCandidatesMapping:(id)a4 profile:(id)a5;
- (PNPersonPromoter)personPromoter;
- (PNPersonPromoterDelegate)delegate;
- (PNPetPromoter)petPromoter;
- (id)basicSequence;
- (id)dedupeNewVerifiedPersons:(id)a3 withExistingVerifiedPersons:(id)a4 updateBlock:(id)a5;
- (id)dedupeUnverifiedPersons:(id)a3 updateBlock:(id)a4;
- (id)dedupeUnverifiedPersons:(id)a3 withVerifiedPersons:(id)a4 updateBlock:(id)a5;
- (void)_executeStepsInSequences:(id)a3 forPersons:(id)a4 andOtherPersons:(id)a5 updateBlock:(id)a6 resultBlock:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setPersonPromoter:(id)a3;
- (void)setPetPromoter:(id)a3;
@end

@implementation PNPersonDeduper

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_personPromoter);
  objc_destroyWeak((id *)&self->_petPromoter);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_invalidCandidatesMapping, 0);
  objc_storeStrong((id *)&self->_personClusterManager, 0);
}

- (void)setPersonPromoter:(id)a3
{
}

- (PNPersonPromoter)personPromoter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_personPromoter);
  return (PNPersonPromoter *)WeakRetained;
}

- (void)setPetPromoter:(id)a3
{
}

- (PNPetPromoter)petPromoter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_petPromoter);
  return (PNPetPromoter *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PNPersonPromoterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PNPersonPromoterDelegate *)WeakRetained;
}

- (id)dedupeNewVerifiedPersons:(id)a3 withExistingVerifiedPersons:(id)a4 updateBlock:(id)a5
{
  v38[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PNPersonDeduper.m", 218, @"Invalid parameter not satisfying: %@", @"existingVerifiedPersons" object file lineNumber description];
  }
  v12 = v9;
  if (v9)
  {
    if (v11) {
      goto LABEL_5;
    }
  }
  else
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PNPersonDeduper.m", 219, @"Invalid parameter not satisfying: %@", @"newVerifiedPersons" object file lineNumber description];

    v12 = 0;
    if (v11) {
      goto LABEL_5;
    }
  }
  v26 = v12;
  v27 = [MEMORY[0x263F08690] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"PNPersonDeduper.m", 220, @"Invalid parameter not satisfying: %@", @"updateBlock" object file lineNumber description];

  v12 = v26;
LABEL_5:
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3433;
  v35 = __Block_byref_object_dispose__3434;
  v28 = v12;
  id v36 = (id)[v12 mutableCopy];
  v13 = (void *)[(PNPersonDeduperProfile *)self->_profile copy];
  [v13 setShouldRelaxThreshold:1];
  v14 = [(PNPersonDeduperStep *)[PNPersonDeduperSocialGroupTimeWarpingStep alloc] initWithPersonClusterManager:self->_personClusterManager invalidCandidatesMapping:self->_invalidCandidatesMapping profile:v13];
  v15 = [(PNPersonDeduper *)self delegate];
  [(PNPersonDeduperStep *)v14 setDelegate:v15];

  v38[0] = v14;
  v16 = [(PNPersonDeduperStep *)[PNPersonDeduperTimeStep alloc] initWithPersonClusterManager:self->_personClusterManager invalidCandidatesMapping:self->_invalidCandidatesMapping profile:v13];
  v38[1] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];

  uint64_t v18 = v32[5];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __84__PNPersonDeduper_dedupeNewVerifiedPersons_withExistingVerifiedPersons_updateBlock___block_invoke;
  v30[3] = &unk_26544F440;
  v30[4] = &v31;
  [(PNPersonDeduper *)self _executeStepsInSequences:v17 forPersons:v10 andOtherPersons:v18 updateBlock:v11 resultBlock:v30];
  if ((unint64_t)[(id)v32[5] count] >= 2)
  {
    v19 = [(PNPersonDeduperStep *)[PNPersonDeduperTimeStep alloc] initWithPersonClusterManager:self->_personClusterManager invalidCandidatesMapping:self->_invalidCandidatesMapping profile:v13];
    v37 = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];

    uint64_t v21 = v32[5];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __84__PNPersonDeduper_dedupeNewVerifiedPersons_withExistingVerifiedPersons_updateBlock___block_invoke_2;
    v29[3] = &unk_26544F440;
    v29[4] = &v31;
    [(PNPersonDeduper *)self _executeStepsInSequences:v20 forPersons:v21 andOtherPersons:v21 updateBlock:v11 resultBlock:v29];
  }
  id v22 = (id)v32[5];

  _Block_object_dispose(&v31, 8);
  return v22;
}

void __84__PNPersonDeduper_dedupeNewVerifiedPersons_withExistingVerifiedPersons_updateBlock___block_invoke(uint64_t a1, int a2, id obj)
{
}

void __84__PNPersonDeduper_dedupeNewVerifiedPersons_withExistingVerifiedPersons_updateBlock___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)dedupeUnverifiedPersons:(id)a3 updateBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PNPersonDeduper.m", 204, @"Invalid parameter not satisfying: %@", @"unverifiedPersons" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x263F08690] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"PNPersonDeduper.m", 205, @"Invalid parameter not satisfying: %@", @"updateBlock" object file lineNumber description];

LABEL_3:
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3433;
  v20 = __Block_byref_object_dispose__3434;
  id v21 = (id)[v7 mutableCopy];
  id v10 = [(PNPersonDeduper *)self basicSequence];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __55__PNPersonDeduper_dedupeUnverifiedPersons_updateBlock___block_invoke;
  v15[3] = &unk_26544F440;
  v15[4] = &v16;
  [(PNPersonDeduper *)self _executeStepsInSequences:v10 forPersons:v7 andOtherPersons:v7 updateBlock:v9 resultBlock:v15];

  id v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

void __55__PNPersonDeduper_dedupeUnverifiedPersons_updateBlock___block_invoke(uint64_t a1, void *a2)
{
}

- (id)dedupeUnverifiedPersons:(id)a3 withVerifiedPersons:(id)a4 updateBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PNPersonDeduper.m", 188, @"Invalid parameter not satisfying: %@", @"verifiedPersons" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PNPersonDeduper.m", 187, @"Invalid parameter not satisfying: %@", @"unverifiedPersons" object file lineNumber description];

  if (!v10) {
    goto LABEL_10;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_11:
  v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PNPersonDeduper.m", 189, @"Invalid parameter not satisfying: %@", @"updateBlock" object file lineNumber description];

LABEL_4:
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__3433;
  v23 = __Block_byref_object_dispose__3434;
  id v24 = (id)[v9 mutableCopy];
  if ([v10 count])
  {
    v12 = [(PNPersonDeduper *)self basicSequence];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __75__PNPersonDeduper_dedupeUnverifiedPersons_withVerifiedPersons_updateBlock___block_invoke;
    v18[3] = &unk_26544F440;
    v18[4] = &v19;
    [(PNPersonDeduper *)self _executeStepsInSequences:v12 forPersons:v10 andOtherPersons:v9 updateBlock:v11 resultBlock:v18];
  }
  id v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __75__PNPersonDeduper_dedupeUnverifiedPersons_withVerifiedPersons_updateBlock___block_invoke(uint64_t a1, int a2, id obj)
{
}

- (id)basicSequence
{
  v10[4] = *MEMORY[0x263EF8340];
  v3 = [(PNPersonDeduperStep *)[PNPersonDeduperTimeStep alloc] initWithPersonClusterManager:self->_personClusterManager invalidCandidatesMapping:self->_invalidCandidatesMapping profile:self->_profile];
  v4 = [(PNPersonDeduperStep *)[PNPersonDeduperLocationStep alloc] initWithPersonClusterManager:self->_personClusterManager invalidCandidatesMapping:self->_invalidCandidatesMapping profile:self->_profile];
  v5 = [(PNPersonDeduperStep *)[PNPersonDeduperSocialGroupComplementStep alloc] initWithPersonClusterManager:self->_personClusterManager invalidCandidatesMapping:self->_invalidCandidatesMapping profile:self->_profile];
  v6 = [(PNPersonDeduperStep *)[PNPersonDeduperSocialGroupOverlaps alloc] initWithPersonClusterManager:self->_personClusterManager invalidCandidatesMapping:self->_invalidCandidatesMapping profile:self->_profile];
  id v7 = [(PNPersonDeduper *)self delegate];
  [(PNPersonDeduperStep *)v4 setDelegate:v7];
  [(PNPersonDeduperStep *)v5 setDelegate:v7];
  [(PNPersonDeduperStep *)v6 setDelegate:v7];
  v10[0] = v3;
  v10[1] = v4;
  v10[2] = v5;
  v10[3] = v6;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];

  return v8;
}

- (void)_executeStepsInSequences:(id)a3 forPersons:(id)a4 andOtherPersons:(id)a5 updateBlock:(id)a6 resultBlock:(id)a7
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v26 = a5;
  id v13 = (void (**)(id, unsigned char *, float))a6;
  v25 = (void (**)(id, uint64_t, uint64_t))a7;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__3433;
  v50 = __Block_byref_object_dispose__3434;
  id v24 = v12;
  id v51 = (id)[v12 mutableCopy];
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__3433;
  v44 = __Block_byref_object_dispose__3434;
  id v45 = (id)[v26 mutableCopy];
  signed __int16 v28 = [(PNPersonClusterManager *)self->_personClusterManager detectionType];
  unsigned __int8 v39 = 0;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v52 count:16];
  if (v15)
  {
    uint64_t v16 = 0;
    uint64_t v27 = *(void *)v36;
    while (2)
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void **)(*((void *)&v35 + 1) + 8 * v17);
        uint64_t v19 = (void *)MEMORY[0x25A2E0AC0]();
        v20 = [MEMORY[0x263EFF910] date];
        uint64_t v21 = v47[5];
        uint64_t v22 = v41[5];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __95__PNPersonDeduper__executeStepsInSequences_forPersons_andOtherPersons_updateBlock_resultBlock___block_invoke;
        v30[3] = &unk_26544F418;
        v32 = &v46;
        uint64_t v33 = &v40;
        signed __int16 v34 = v28;
        v30[4] = self;
        void v30[5] = v18;
        id v23 = v20;
        id v31 = v23;
        [v18 dedupePersons:v21 withOtherPersons:v22 updateBlock:v13 resultBlock:v30];
        v13[2](v13, &v39, (float)(unint64_t)(v16 + v17) / (float)(unint64_t)[v14 count]);
        LODWORD(v18) = v39;

        if (v18)
        {

          goto LABEL_11;
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v52 count:16];
      v16 += v17;
      if (v15) {
        continue;
      }
      break;
    }
  }

  v25[2](v25, v47[5], v41[5]);
LABEL_11:
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
}

void __95__PNPersonDeduper__executeStepsInSequences_forPersons_andOtherPersons_updateBlock_resultBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF9C0] setWithObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  [v7 unionSet:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  id v8 = [MEMORY[0x263EFF9C0] setWithObject:v5];
  [v8 unionSet:v6];
  uint64_t v9 = [v7 count];
  uint64_t v10 = v9 - [v8 count];
  id v11 = *(void **)(a1 + 32);
  if (*(_WORD *)(a1 + 72) == 1)
  {
    id v12 = [v11 personPromoter];
    id v13 = [*(id *)(a1 + 40) metricsKey];
    [v12 incrementMetricForKey:v13 withValue:v10];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      id v14 = [*(id *)(a1 + 40) name];
      uint64_t v15 = [MEMORY[0x263EFF910] date];
      [v15 timeIntervalSinceDate:*(void *)(a1 + 48)];
      int v27 = 138412802;
      signed __int16 v28 = v14;
      __int16 v29 = 2048;
      uint64_t v30 = v16;
      __int16 v31 = 2048;
      uint64_t v32 = v10;
      uint64_t v17 = &_os_log_internal;
      uint64_t v18 = "[PersonPromoter] [Step: %@] (%.4fs) - %ld persons merged";
LABEL_6:
      _os_log_impl(&dword_25934C000, v17, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v27, 0x20u);
    }
  }
  else
  {
    uint64_t v19 = [v11 petPromoter];
    v20 = [*(id *)(a1 + 40) metricsKey];
    [v19 incrementMetricForKey:v20 withValue:v10];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      id v14 = [*(id *)(a1 + 40) name];
      uint64_t v15 = [MEMORY[0x263EFF910] date];
      [v15 timeIntervalSinceDate:*(void *)(a1 + 48)];
      int v27 = 138412802;
      signed __int16 v28 = v14;
      __int16 v29 = 2048;
      uint64_t v30 = v21;
      __int16 v31 = 2048;
      uint64_t v32 = v10;
      uint64_t v17 = &_os_log_internal;
      uint64_t v18 = "[PersonPromoter] [Step: %@] (%.4fs) - %ld pets merged";
      goto LABEL_6;
    }
  }
  uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
  id v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v5;
  id v24 = v5;

  uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8);
  id v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = v6;
}

- (PNPersonDeduper)initWithPersonClusterManager:(id)a3 andInvalidCandidatesMapping:(id)a4 profile:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PNPersonDeduper;
  id v12 = [(PNPersonDeduper *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_personClusterManager, a3);
    objc_storeStrong((id *)&v13->_invalidCandidatesMapping, a4);
    objc_storeStrong((id *)&v13->_profile, a5);
  }

  return v13;
}

@end