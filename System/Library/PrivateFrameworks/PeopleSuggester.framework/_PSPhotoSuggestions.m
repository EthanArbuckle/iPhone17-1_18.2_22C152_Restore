@interface _PSPhotoSuggestions
+ (id)allOutstandingRequestsLock;
+ (id)mdPersonIDsOfPeopleInSharedPhotoAttachments:(id)a3 forBundleID:(id)a4;
+ (id)peopleInSharedPhotoAttachments:(id)a3 forBundleID:(id)a4 shouldUseMDID:(BOOL)a5 withCompletion:(id)a6;
+ (id)phPersonIdentifiersOfPeopleInSharedPhotoAttachments:(id)a3 forBundleID:(id)a4 withCompletion:(id)a5;
+ (id)sharedMADService;
+ (id)suggestionTemplateForPhotoContactIdWithMessages:(id)a3 cdInteraction:(id)a4 reason:(id)a5 reasonType:(id)a6;
+ (void)cancelRequestWithToken:(id)a3;
@end

@implementation _PSPhotoSuggestions

+ (id)sharedMADService
{
  if (sharedMADService__pasOnceToken1 != -1) {
    dispatch_once(&sharedMADService__pasOnceToken1, &__block_literal_global_39);
  }
  v2 = (void *)sharedMADService__pasExprOnceResult;

  return v2;
}

+ (id)allOutstandingRequestsLock
{
  if (allOutstandingRequestsLock__pasOnceToken2 != -1) {
    dispatch_once(&allOutstandingRequestsLock__pasOnceToken2, &__block_literal_global_350);
  }
  v2 = (void *)allOutstandingRequestsLock__pasExprOnceResult;

  return v2;
}

+ (id)phPersonIdentifiersOfPeopleInSharedPhotoAttachments:(id)a3 forBundleID:(id)a4 withCompletion:(id)a5
{
  return +[_PSPhotoSuggestions peopleInSharedPhotoAttachments:a3 forBundleID:a4 shouldUseMDID:0 withCompletion:a5];
}

+ (id)mdPersonIDsOfPeopleInSharedPhotoAttachments:(id)a3 forBundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__20;
  v19 = __Block_byref_object_dispose__20;
  id v20 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79___PSPhotoSuggestions_mdPersonIDsOfPeopleInSharedPhotoAttachments_forBundleID___block_invoke;
  v12[3] = &unk_1E5ADEE48;
  v14 = &v15;
  v8 = v7;
  v13 = v8;
  id v9 = +[_PSPhotoSuggestions peopleInSharedPhotoAttachments:v5 forBundleID:v6 shouldUseMDID:1 withCompletion:v12];
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v10;
}

+ (id)peopleInSharedPhotoAttachments:(id)a3 forBundleID:(id)a4 shouldUseMDID:(BOOL)a5 withCompletion:(id)a6
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v34 = a4;
  id v43 = a6;
  v35 = objc_msgSend(a3, "_pas_filteredArrayWithTest:", &__block_literal_global_357);
  if ([v35 count])
  {
    v8 = +[_PSPhotoSuggestions allOutstandingRequestsLock];
    [v8 tryWithLockAcquired:&__block_literal_global_361];

    id v9 = objc_alloc(MEMORY[0x1E4F93B70]);
    id v10 = objc_opt_new();
    v41 = (void *)[v9 initWithGuardedData:v10];

    id v63 = 0;
    v33 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v34 allowPlaceholder:0 error:&v63];
    id v31 = v63;
    v11 = v33;
    if (!v33)
    {
      v12 = +[_PSLogging heuristicsChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[_PSPhotoSuggestions peopleInSharedPhotoAttachments:forBundleID:shouldUseMDID:withCompletion:]((uint64_t)v31, v12);
      }

      v11 = 0;
    }
    int v13 = objc_msgSend(v11, "developerType", v31);
    v14 = +[_PSLogging heuristicsChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      *(void *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v13 == 1;
      _os_log_impl(&dword_1A314B000, v14, OS_LOG_TYPE_DEFAULT, "IDsOfPeopleInSharedPhotoAssets with attachments %{private}@, isFirstParty: %d", buf, 0x12u);
    }

    id v42 = (id)objc_opt_new();
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x2020000000;
    v62[3] = [v35 count];
    v40 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5B660] code:*MEMORY[0x1E4F5B688] userInfo:&unk_1EF6768E0];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = v35;
    uint64_t v15 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
    if (v15)
    {
      uint64_t v37 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v59 != v37) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v58 + 1) + 8 * i);
          uint64_t v64 = 0;
          v65 = &v64;
          uint64_t v66 = 0x2050000000;
          v18 = (void *)getMADPersonIdentificationRequestClass_softClass;
          uint64_t v67 = getMADPersonIdentificationRequestClass_softClass;
          if (!getMADPersonIdentificationRequestClass_softClass)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __getMADPersonIdentificationRequestClass_block_invoke;
            v70 = &unk_1E5ADE858;
            v71 = &v64;
            MediaAnalysisServicesLibraryCore();
            Class Class = objc_getClass("MADPersonIdentificationRequest");
            *(void *)(v71[1] + 24) = Class;
            getMADPersonIdentificationRequestClass_softClass Class = *(void *)(v71[1] + 24);
            v18 = (void *)v65[3];
          }
          id v20 = v18;
          _Block_object_dispose(&v64, 8);
          id v21 = objc_alloc_init(v20);
          [v21 setMaximumFaceCount:4];
          [v21 setAllowOnDemand:1];
          [v21 setAllowUnverifiedIdentity:1];
          [v21 setUseLowResolutionPicture:1];
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          LODWORD(v70) = 0;
          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_371;
          v51[3] = &unk_1E5AE15E0;
          id v22 = v21;
          id v52 = v22;
          BOOL v57 = a5;
          id v53 = v41;
          id v23 = v40;
          id v54 = v23;
          v56 = v62;
          id v55 = v43;
          v24 = (void *)MEMORY[0x1A6243AD0](v51);
          v25 = +[_PSPhotoSuggestions allOutstandingRequestsLock];
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_378;
          v44[3] = &unk_1E5AE1658;
          id v26 = v24;
          id v48 = v26;
          v49 = buf;
          v44[4] = v17;
          id v50 = a1;
          id v27 = v22;
          id v45 = v27;
          id v46 = v23;
          id v47 = v42;
          [v25 runWithLockAcquired:v44];

          _Block_object_dispose(buf, 8);
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
      }
      while (v15);
    }

    _Block_object_dispose(v62, 8);
    v28 = v43;
  }
  else
  {
    v29 = [MEMORY[0x1E4F1CAD0] set];
    v28 = v43;
    (*((void (**)(id, void *))v43 + 2))(v43, v29);

    id v42 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v42;
}

+ (void)cancelRequestWithToken:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  v25 = v3;
  if (objc_opt_isKindOfClass())
  {
    v4 = v3;
    v24 = v4;
    if ([v4 count])
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v5 = v4;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v43 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v35;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v35 != v7) {
              objc_enumerationMutation(v5);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v22 = +[_PSLogging heuristicsChannel];
              if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
                +[_PSPhotoSuggestions cancelRequestWithToken:]((uint64_t)v5, v22);
              }

              goto LABEL_30;
            }
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }

      uint64_t v23 = [v5 count];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id obj = v5;
      uint64_t v9 = 0;
      uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
      if (v10)
      {
        uint64_t v27 = *(void *)v31;
        do
        {
          for (uint64_t j = 0; j != v10; ++j)
          {
            if (*(void *)v31 != v27) {
              objc_enumerationMutation(obj);
            }
            v12 = *(void **)(*((void *)&v30 + 1) + 8 * j);
            uint64_t v13 = objc_msgSend(v12, "integerValue", v23);
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v39 = __Block_byref_object_copy__383;
            v40 = __Block_byref_object_dispose__384;
            id v41 = 0;
            v14 = [a1 allOutstandingRequestsLock];
            v29[0] = MEMORY[0x1E4F143A8];
            v29[1] = 3221225472;
            v29[2] = __46___PSPhotoSuggestions_cancelRequestWithToken___block_invoke;
            v29[3] = &unk_1E5AE1680;
            v29[4] = v12;
            v29[5] = buf;
            [v14 runWithLockAcquired:v29];

            uint64_t v15 = *(void *)(*(void *)&buf[8] + 40);
            if (v15)
            {
              (*(void (**)(void))(v15 + 16))();
              v16 = [a1 sharedMADService];
              [v16 cancelRequestID:v13];

              ++v9;
            }
            _Block_object_dispose(buf, 8);
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
        }
        while (v10);
      }

      id v5 = +[_PSLogging heuristicsChannel];
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v23;
      uint64_t v17 = "_PSPhotoSuggestions request cancelled (%tu of %tu attachments were still in-flight)";
      v18 = v5;
      uint32_t v19 = 22;
    }
    else
    {
      id v5 = +[_PSLogging heuristicsChannel];
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:

        id v21 = v24;
        goto LABEL_31;
      }
      *(_WORD *)buf = 0;
      uint64_t v17 = "_PSPhotoSuggestions request cancelled (no-op because request was for 0 items)";
      v18 = v5;
      uint32_t v19 = 2;
    }
    _os_log_impl(&dword_1A314B000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    goto LABEL_30;
  }
  id v20 = +[_PSLogging heuristicsChannel];
  id v21 = v20;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    +[_PSPhotoSuggestions cancelRequestWithToken:]((uint64_t)v25, v20);
    id v21 = v20;
  }
LABEL_31:
}

+ (id)suggestionTemplateForPhotoContactIdWithMessages:(id)a3 cdInteraction:(id)a4 reason:(id)a5 reasonType:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v10 sender];
  v14 = [v13 personId];
  int v15 = [v14 isEqualToString:v9];

  if (v15)
  {
    v16 = [v10 sender];
    uint64_t v17 = [v16 identifier];
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v16 = [v10 recipients];
    uint64_t v17 = (void *)[v16 countByEnumeratingWithState:&v37 objects:v44 count:16];
    if (v17)
    {
      id v35 = v11;
      uint64_t v18 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v16);
          }
          id v20 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          id v21 = [v20 personId];
          int v22 = [v21 isEqualToString:v9];

          if (v22)
          {
            uint64_t v17 = [v20 identifier];
            goto LABEL_13;
          }
        }
        uint64_t v17 = (void *)[v16 countByEnumeratingWithState:&v37 objects:v44 count:16];
        if (v17) {
          continue;
        }
        break;
      }
LABEL_13:
      id v11 = v35;
    }
  }

  if (v17)
  {
    uint64_t v23 = [_PSSuggestionTemplate alloc];
    uint64_t v24 = +[_PSConstants mobileMessagesBundleId];
    long long v36 = [MEMORY[0x1E4F29128] UUID];
    v25 = [v36 UUIDString];
    id v43 = v9;
    id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
    id v41 = v9;
    id v42 = v17;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    id v27 = v10;
    id v28 = v12;
    long long v30 = v29 = v11;
    long long v31 = v23;
    long long v32 = (void *)v24;
    long long v33 = [(_PSSuggestionTemplate *)v31 initWithBundleID:v24 interactionRecipients:v25 image:0 groupName:0 recipientContactIDs:v26 recipientEmailAddresses:0 recipientPhoneNumbers:0 recipientDisplayNames:0 contactIdToHandleMapping:v30 reason:v29 reasonType:v28];

    id v11 = v29;
    id v12 = v28;
    id v10 = v27;
  }
  else
  {
    long long v33 = 0;
  }

  return v33;
}

+ (void)peopleInSharedPhotoAttachments:(uint64_t)a1 forBundleID:(NSObject *)a2 shouldUseMDID:withCompletion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "appRecord lookup failed with error: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)cancelRequestWithToken:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A314B000, a2, OS_LOG_TYPE_FAULT, "unexpected cancel token (some items are not NSNumber): %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)cancelRequestWithToken:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A314B000, a2, OS_LOG_TYPE_FAULT, "unexpected cancel token (not array): %{public}@", (uint8_t *)&v2, 0xCu);
}

@end