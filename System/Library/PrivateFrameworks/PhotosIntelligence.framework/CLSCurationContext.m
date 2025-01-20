@interface CLSCurationContext
+ (double)mergeCandidateConfidenceThreshold;
- (CLSCurationContext)initWithPhotoLibrary:(id)a3;
- (CLSCurationContext)initWithPhotoLibrary:(id)a3 curationSession:(id)a4;
- (CLSCurationContext)initWithUserFeedbackCalculator:(id)a3 curationSession:(id)a4;
- (CLSCurationSession)curationSession;
- (PHPhotoLibrary)photoLibrary;
- (PHUserFeedbackCalculator)userFeedbackCalculator;
- (id)_mergeCandidateUUIDsForPerson:(id)a3;
- (id)description;
- (id)hiddenOrBlockedPersonUUIDs;
- (id)nonPetFacedPersonLocalIdentifiers;
- (id)personUUIDByMergeCandidateUUID;
- (id)verifiedPersonUUIDs;
- (void)_loadNonPetFacedPersonLocalIdentifiers;
- (void)_loadPersonAndMergeCandidateUUIDs;
@end

@implementation CLSCurationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationSession, 0);
  objc_storeStrong((id *)&self->_userFeedbackCalculator, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_personUUIDByMergeCandidateUUID, 0);
  objc_storeStrong((id *)&self->_nonPetFacedPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_hiddenOrBlockedPersonUUIDs, 0);
  objc_storeStrong((id *)&self->_verifiedPersonUUIDs, 0);
}

- (CLSCurationSession)curationSession
{
  return self->_curationSession;
}

- (PHUserFeedbackCalculator)userFeedbackCalculator
{
  return self->_userFeedbackCalculator;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (id)_mergeCandidateUUIDsForPerson:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5 = [v3 photoLibrary];
  v6 = [v5 librarySpecificFetchOptions];

  [v6 setIncludeOnlyPersonsWithVisibleKeyFaces:1];
  v7 = (void *)MEMORY[0x263F08A98];
  [(id)objc_opt_class() mergeCandidateConfidenceThreshold];
  v9 = objc_msgSend(v7, "predicateWithFormat:", @"%K == %d && %K >= %f", @"verifiedType", 0, @"mergeCandidateConfidence", v8);
  [v6 setPredicate:v9];

  v10 = [MEMORY[0x263F14E88] fetchMergeCandidateWithConfidencePersonsForPerson:v3 options:v6];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) uuid];
        [v4 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v4;
}

- (void)_loadNonPetFacedPersonLocalIdentifiers
{
  v30[1] = *MEMORY[0x263EF8340];
  id v3 = &_os_log_internal;
  id v4 = &_os_log_internal;
  os_signpost_id_t v5 = os_signpost_id_generate(v3);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  v6 = v3;
  unint64_t v7 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_BEGIN, v5, "LoadNonPetFacedPersonLocalIdentifiers", "", buf, 2u);
  }
  os_signpost_id_t spid = v5;

  uint64_t v24 = mach_absolute_time();
  uint64_t v8 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v8 setMinimumVerifiedFaceCount:1];
  [v8 setMinimumUnverifiedFaceCount:1];
  v30[0] = *MEMORY[0x263F15100];
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
  [v8 setFetchPropertySets:v9];

  v10 = [MEMORY[0x263F14E88] fetchPersonsWithOptions:v8];
  uint64_t v11 = [v10 count];
  uint64_t v12 = (NSSet *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:v11];
  if (v11)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      v14 = (void *)MEMORY[0x25A2E0AC0]();
      v15 = [v10 objectAtIndexedSubscript:i];
      v16 = [v15 localIdentifier];
      [(NSSet *)v12 addObject:v16];
    }
  }
  nonPetFacedPersonLocalIdentifiers = self->_nonPetFacedPersonLocalIdentifiers;
  self->_nonPetFacedPersonLocalIdentifiers = v12;

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = self;
    _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Finished loading %@", buf, 0xCu);
  }
  uint64_t v18 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  id v21 = &_os_log_internal;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_END, spid, "LoadNonPetFacedPersonLocalIdentifiers", "", buf, 2u);
  }
  uint64_t v22 = &_os_log_internal;

  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v27 = (CLSCurationContext *)"LoadNonPetFacedPersonLocalIdentifiers";
    __int16 v28 = 2048;
    double v29 = (float)((float)((float)((float)(v18 - v24) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

- (void)_loadPersonAndMergeCandidateUUIDs
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v3 = &_os_log_internal;
  id v4 = &_os_log_internal;
  os_signpost_id_t v5 = os_signpost_id_generate(v3);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  v6 = v3;
  unint64_t v38 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_BEGIN, v5, "LoadPersonAndMergeCandidateUUIDs", "", buf, 2u);
  }
  os_signpost_id_t spid = v5;

  uint64_t v37 = mach_absolute_time();
  unint64_t v7 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v7 setPersonContext:1];
  v39 = v7;
  uint64_t v8 = [MEMORY[0x263F14E88] fetchPersonsWithOptions:v7];
  v43 = (NSSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v9 = objc_alloc(MEMORY[0x263EFF9C0]);
  v10 = [(CLSCurationContext *)self userFeedbackCalculator];
  uint64_t v11 = [v10 personUUIDsWithNegativeFeedback];
  v42 = (NSSet *)[v9 initWithSet:v11];

  uint64_t v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v13 = objc_alloc_init(MEMORY[0x263F08760]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v8;
  uint64_t v14 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
  uint64_t v44 = v14;
  if (v14)
  {
    uint64_t v41 = *(void *)v51;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v51 != v41) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v50 + 1) + 8 * v15);
        context = (void *)MEMORY[0x25A2E0AC0](v14);
        long long v17 = objc_msgSend(v16, "uuid", spid);
        if ([v16 type] == -1) {
          uint64_t v18 = v42;
        }
        else {
          uint64_t v18 = v43;
        }
        [(NSSet *)v18 addObject:v17];
        long long v19 = self;
        long long v20 = [(CLSCurationContext *)self _mergeCandidateUUIDsForPerson:v16];
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v46 objects:v59 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v47 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void *)(*((void *)&v46 + 1) + 8 * i);
              [v13 addObject:v25];
              if ([v13 countForObject:v25] == 1) {
                [(NSDictionary *)v12 setObject:v17 forKeyedSubscript:v25];
              }
              else {
                [(NSDictionary *)v12 removeObjectForKey:v25];
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v46 objects:v59 count:16];
          }
          while (v22);
        }

        ++v15;
        self = v19;
      }
      while (v15 != v44);
      uint64_t v14 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
      uint64_t v44 = v14;
    }
    while (v14);
  }

  verifiedPersonUUIDs = self->_verifiedPersonUUIDs;
  self->_verifiedPersonUUIDs = v43;
  v27 = v43;

  hiddenOrBlockedPersonUUIDs = self->_hiddenOrBlockedPersonUUIDs;
  self->_hiddenOrBlockedPersonUUIDs = v42;
  double v29 = v42;

  personUUIDByMergeCandidateUUID = self->_personUUIDByMergeCandidateUUID;
  self->_personUUIDByMergeCandidateUUID = v12;

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v56 = self;
    _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Finished loading %@", buf, 0xCu);
  }
  uint64_t v31 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  id v34 = &_os_log_internal;
  if (v38 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_END, spid, "LoadPersonAndMergeCandidateUUIDs", "", buf, 2u);
  }
  v35 = &_os_log_internal;

  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v56 = (CLSCurationContext *)"LoadPersonAndMergeCandidateUUIDs";
    __int16 v57 = 2048;
    double v58 = (float)((float)((float)((float)(v31 - v37) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

- (id)personUUIDByMergeCandidateUUID
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_personUUIDByMergeCandidateUUID) {
    [(CLSCurationContext *)v2 _loadPersonAndMergeCandidateUUIDs];
  }
  objc_sync_exit(v2);

  personUUIDByMergeCandidateUUID = v2->_personUUIDByMergeCandidateUUID;
  return personUUIDByMergeCandidateUUID;
}

- (id)nonPetFacedPersonLocalIdentifiers
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_nonPetFacedPersonLocalIdentifiers) {
    [(CLSCurationContext *)v2 _loadNonPetFacedPersonLocalIdentifiers];
  }
  objc_sync_exit(v2);

  nonPetFacedPersonLocalIdentifiers = v2->_nonPetFacedPersonLocalIdentifiers;
  return nonPetFacedPersonLocalIdentifiers;
}

- (id)hiddenOrBlockedPersonUUIDs
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_hiddenOrBlockedPersonUUIDs) {
    [(CLSCurationContext *)v2 _loadPersonAndMergeCandidateUUIDs];
  }
  objc_sync_exit(v2);

  hiddenOrBlockedPersonUUIDs = v2->_hiddenOrBlockedPersonUUIDs;
  return hiddenOrBlockedPersonUUIDs;
}

- (id)verifiedPersonUUIDs
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_verifiedPersonUUIDs) {
    [(CLSCurationContext *)v2 _loadPersonAndMergeCandidateUUIDs];
  }
  objc_sync_exit(v2);

  verifiedPersonUUIDs = v2->_verifiedPersonUUIDs;
  return verifiedPersonUUIDs;
}

- (id)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CLSCurationContext;
  id v4 = [(CLSCurationContext *)&v7 description];
  os_signpost_id_t v5 = [v3 stringWithFormat:@"%@: %tu verified persons, %tu hidden/blocked persons, %tu merge candidates", v4, -[NSSet count](self->_verifiedPersonUUIDs, "count"), -[NSSet count](self->_hiddenOrBlockedPersonUUIDs, "count"), -[NSDictionary count](self->_personUUIDByMergeCandidateUUID, "count")];

  return v5;
}

- (CLSCurationContext)initWithPhotoLibrary:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F14F60];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithPhotoLibrary:v5];

  objc_super v7 = objc_alloc_init(CLSCurationSession);
  uint64_t v8 = [(CLSCurationContext *)self initWithUserFeedbackCalculator:v6 curationSession:v7];

  return v8;
}

- (CLSCurationContext)initWithUserFeedbackCalculator:(id)a3 curationSession:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLSCurationContext;
  id v9 = [(CLSCurationContext *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userFeedbackCalculator, a3);
    uint64_t v11 = [v7 photoLibrary];
    photoLibrary = v10->_photoLibrary;
    v10->_photoLibrary = (PHPhotoLibrary *)v11;

    objc_storeStrong((id *)&v10->_curationSession, a4);
  }

  return v10;
}

- (CLSCurationContext)initWithPhotoLibrary:(id)a3 curationSession:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263F14F60];
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[[v6 alloc] initWithPhotoLibrary:v8];

  v10 = [(CLSCurationContext *)self initWithUserFeedbackCalculator:v9 curationSession:v7];
  return v10;
}

+ (double)mergeCandidateConfidenceThreshold
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v3 = [v2 objectForKey:@"CLSCurationContextMergeCandidateConfidenceUserDefaults"];

  if (v3)
  {
    [v2 doubleForKey:@"CLSCurationContextMergeCandidateConfidenceUserDefaults"];
    double v5 = v4;
  }
  else
  {
    double v5 = *MEMORY[0x263F150F0];
  }

  return v5;
}

@end