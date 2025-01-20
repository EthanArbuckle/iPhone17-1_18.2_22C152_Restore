@interface SiriNLUTypesRedactionUtils
+ (id)getRedactedUsoGraph:(id)a3;
+ (id)redactUserParse:(id)a3;
@end

@implementation SiriNLUTypesRedactionUtils

+ (id)redactUserParse:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v75 = a3;
  v4 = [v75 userDialogActs];
  id v78 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v79 objects:v83 count:16];
  if (v5)
  {
    char v6 = 0;
    uint64_t v77 = *(void *)v80;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v80 != v77) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        v9 = (void *)[v8 copy];
        if ([v8 hasUserStatedTask])
        {
          v10 = [v8 userStatedTask];
          int v11 = [v10 hasTask];

          if (v11)
          {
            v12 = [v8 userStatedTask];
            v13 = [v12 task];
            v14 = (void *)[v13 copy];
            v15 = [a1 getRedactedUsoGraph:v14];
            v16 = [v9 userStatedTask];
            [v16 setTask:v15];
          }
          char v6 = 1;
        }
        if ([v8 hasAccepted])
        {
          v17 = [v8 accepted];
          int v18 = [v17 hasReference];

          if (v18)
          {
            v19 = [v8 accepted];
            v20 = [v19 reference];
            v21 = (void *)[v20 copy];
            v22 = [a1 getRedactedUsoGraph:v21];
            v23 = [v9 accepted];
            [v23 setReference:v22];
          }
          char v6 = 1;
        }
        if ([v8 hasRejected])
        {
          v24 = [v8 rejected];
          int v25 = [v24 hasReference];

          if (v25)
          {
            v26 = [v8 rejected];
            v27 = [v26 reference];
            v28 = (void *)[v27 copy];
            v29 = [a1 getRedactedUsoGraph:v28];
            v30 = [v9 rejected];
            [v30 setReference:v29];
          }
          char v6 = 1;
        }
        if ([v8 hasCancelled])
        {
          v31 = [v8 cancelled];
          int v32 = [v31 hasReference];

          if (v32)
          {
            v33 = [v8 cancelled];
            v34 = [v33 reference];
            v35 = (void *)[v34 copy];
            v36 = [a1 getRedactedUsoGraph:v35];
            v37 = [v9 cancelled];
            [v37 setReference:v36];
          }
          char v6 = 1;
        }
        if ([v8 hasWantedToRepeat])
        {
          v38 = [v8 wantedToRepeat];
          int v39 = [v38 hasReference];

          if (v39)
          {
            v40 = [v8 wantedToRepeat];
            v41 = [v40 reference];
            v42 = (void *)[v41 copy];
            v43 = [a1 getRedactedUsoGraph:v42];
            v44 = [v9 wantedToRepeat];
            [v44 setReference:v43];
          }
          char v6 = 1;
        }
        if ([v8 hasAcknowledged])
        {
          v45 = [v8 acknowledged];
          int v46 = [v45 hasReference];

          if (v46)
          {
            v47 = [v8 acknowledged];
            v48 = [v47 reference];
            v49 = (void *)[v48 copy];
            v50 = [a1 getRedactedUsoGraph:v49];
            v51 = [v9 acknowledged];
            [v51 setReference:v50];
          }
          char v6 = 1;
        }
        if ([v8 hasWantedToProceed])
        {
          v52 = [v8 wantedToProceed];
          int v53 = [v52 hasReference];

          if (v53)
          {
            v54 = [v8 wantedToProceed];
            v55 = [v54 reference];
            v56 = (void *)[v55 copy];
            v57 = [a1 getRedactedUsoGraph:v56];
            v58 = [v9 wantedToProceed];
            [v58 setReference:v57];
          }
          char v6 = 1;
        }
        if ([v8 hasWantedToPause])
        {
          v59 = [v8 wantedToPause];
          int v60 = [v59 hasReference];

          if (v60)
          {
            v61 = [v8 wantedToPause];
            v62 = [v61 reference];
            v63 = (void *)[v62 copy];
            v64 = [a1 getRedactedUsoGraph:v63];
            v65 = [v9 wantedToPause];
            [v65 setReference:v64];
          }
          char v6 = 1;
        }
        if ([v8 hasWantedToUndo])
        {
          v66 = [v8 wantedToUndo];
          int v67 = [v66 hasReference];

          if (v67)
          {
            v68 = [v8 wantedToUndo];
            v69 = [v68 reference];
            v70 = (void *)[v69 copy];
            v71 = [a1 getRedactedUsoGraph:v70];
            v72 = [v9 wantedToUndo];
            [v72 setReference:v71];
          }
        }
        else if ((v6 & 1) == 0)
        {

          goto LABEL_46;
        }
        [v78 addObject:v9];

        char v6 = 1;
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v79 objects:v83 count:16];
      if (v5) {
        continue;
      }
      break;
    }

    v73 = (void *)[v75 copy];
    [v73 setUserDialogActs:v78];
  }
  else
  {
LABEL_46:

    v73 = 0;
  }

  return v73;
}

+ (id)getRedactedUsoGraph:(id)a3
{
  v3 = (siri::ontology *)a3;
  SharedUsoVocabManager = (uint64_t *)siri::ontology::getSharedUsoVocabManager(v3);
  uint64_t v6 = *SharedUsoVocabManager;
  uint64_t v5 = (std::__shared_weak_count *)SharedUsoVocabManager[1];
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  +[SiriNLUTypesConverterUtils convertUsoGraphFromObjCToCpp:v3];
  if (v5)
  {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v8 = v6;
    v9 = v5;
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  else
  {
    uint64_t v8 = v6;
    v9 = 0;
  }
  siri::ontology::UsoGraphProtoReader::fromProtobuf((siri::ontology::UsoGraphProtoReader *)&v8, v10);
}

@end