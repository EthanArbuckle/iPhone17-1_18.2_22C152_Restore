@interface _PSMediaAnalysisProcessingTask
+ (id)interactionStore;
- (BOOL)attachmentsContainsPersonId:(id)a3;
- (BOOL)skipAttachmentProcessing:(id)a3;
- (BOOL)updatePlistWithDict:(id)a3;
- (_PSMediaAnalysisProcessingTask)initWithBookmark:(id)a3 interactionStore:(id)a4;
- (id)updatedAttachmentsWithPeopleIdForAttachments:(id)a3 forBundleID:(id)a4;
- (void)dealloc;
- (void)executeTaskWithCompletionHandler:(id)a3;
- (void)saveBookmark;
@end

@implementation _PSMediaAnalysisProcessingTask

- (_PSMediaAnalysisProcessingTask)initWithBookmark:(id)a3 interactionStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)_PSMediaAnalysisProcessingTask;
  v9 = [(_PSMediaAnalysisProcessingTask *)&v25 init];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v11 = [v10 initWithMachServiceName:*MEMORY[0x1E4F5B610] options:4096];
    connection = v9->_connection;
    v9->_connection = (NSXPCConnection *)v11;

    v13 = _CDInteractionNSXPCInterface();
    [(NSXPCConnection *)v9->_connection setRemoteObjectInterface:v13];

    if (v8)
    {
      v14 = (_CDInteractionStore *)v8;
    }
    else
    {
      v14 = +[_PSMediaAnalysisProcessingTask interactionStore];
    }
    interactionStore = v9->_interactionStore;
    v9->_interactionStore = v14;

    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2050000000;
    v16 = (void *)getMADPersonIdentificationRequestClass_softClass_0;
    uint64_t v34 = getMADPersonIdentificationRequestClass_softClass_0;
    if (!getMADPersonIdentificationRequestClass_softClass_0)
    {
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      v28 = __getMADPersonIdentificationRequestClass_block_invoke_0;
      v29 = &unk_1E5ADE858;
      v30 = &v31;
      MediaAnalysisServicesLibraryCore_0();
      Class Class = objc_getClass("MADPersonIdentificationRequest");
      *(void *)(v30[1] + 24) = Class;
      getMADPersonIdentificationRequestClass_softClass_0 = *(void *)(v30[1] + 24);
      v16 = (void *)v32[3];
    }
    id v18 = v16;
    _Block_object_dispose(&v31, 8);
    uint64_t v19 = objc_opt_new();
    personIdentificationRequest = v9->_personIdentificationRequest;
    v9->_personIdentificationRequest = (MADPersonIdentificationRequest *)v19;

    [(MADPersonIdentificationRequest *)v9->_personIdentificationRequest setMaximumFaceCount:4];
    [(MADPersonIdentificationRequest *)v9->_personIdentificationRequest setAllowOnDemand:1];
    [(MADPersonIdentificationRequest *)v9->_personIdentificationRequest setAllowUnverifiedIdentity:1];
    objc_storeStrong((id *)&v9->_bookmark, a3);
    v21 = [MEMORY[0x1E4F5B420] peopleDirectory];
    uint64_t v22 = [v21 stringByAppendingPathComponent:@"MediaAnalysisProcessing"];
    mediaAnalysisConfigurationPath = v9->_mediaAnalysisConfigurationPath;
    v9->_mediaAnalysisConfigurationPath = (NSString *)v22;

    [(NSXPCConnection *)v9->_connection resume];
  }

  return v9;
}

+ (id)interactionStore
{
  v2 = (void *)MEMORY[0x1E4F5B400];
  v3 = [MEMORY[0x1E4F5B400] defaultDatabaseDirectory];
  v4 = [v2 storeWithDirectory:v3 readOnly:1];

  [v4 setReadConcurrently:1];

  return v4;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_PSMediaAnalysisProcessingTask;
  [(_PSMediaAnalysisProcessingTask *)&v3 dealloc];
}

- (void)executeTaskWithCompletionHandler:(id)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  uint64_t v27 = (void (**)(void))a3;
  v29 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_43];
  uint64_t v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"startDate > %@ AND direction == %@ AND mechanism IN %@", self->_bookmark, &unk_1EF675BB8, &unk_1EF6765A8];
  interactionStore = self->_interactionStore;
  v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v39[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  v28 = [(_CDInteractionStore *)interactionStore queryInteractionsUsingPredicate:v26 sortDescriptors:v6 limit:-1 offset:0 error:0];

  BOOL v7 = [v28 count] == 0;
  id v8 = +[_PSLogging mediaAnalysisChannel];
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      bookmark = self->_bookmark;
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = bookmark;
      _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_DEFAULT, "No interactions to process for %{public}@-now. Returning.", buf, 0xCu);
    }

    v24 = [MEMORY[0x1E4F1C9C8] date];
    objc_super v25 = self->_bookmark;
    self->_bookmark = v24;

    [(_PSMediaAnalysisProcessingTask *)self saveBookmark];
    goto LABEL_27;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v28 count];
    uint64_t v11 = self->_bookmark;
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_INFO, "Fetched %tu interactions for media analysis (Interval: %{public}@ - now)", buf, 0x16u);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = v28;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (!v13) {
    goto LABEL_26;
  }
  uint64_t v14 = *(void *)v32;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v32 != v14) {
        objc_enumerationMutation(v12);
      }
      v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      if (([v16 forcePersistInteraction] & 1) == 0) {
        [v16 setForcePersistInteraction:1];
      }
      v17 = [v16 attachments];
      if (![(_PSMediaAnalysisProcessingTask *)self skipAttachmentProcessing:v17])
      {
        if (![(_PSMediaAnalysisProcessingTask *)self attachmentsContainsPersonId:v17])
        {
          id v18 = [v16 bundleId];
          uint64_t v19 = [(_PSMediaAnalysisProcessingTask *)self updatedAttachmentsWithPeopleIdForAttachments:v17 forBundleID:v18];

          if (!v19 || ![v19 count])
          {

            goto LABEL_19;
          }
          [v16 setAttachments:v19];
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        char v37 = 0;
        v35 = v16;
        v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __67___PSMediaAnalysisProcessingTask_executeTaskWithCompletionHandler___block_invoke_356;
        v30[3] = &unk_1E5AE1768;
        v30[4] = v16;
        v30[5] = buf;
        [v29 updateInteractions:v20 enforceDataLimits:0 enforcePrivacy:0 reply:v30];

        if (!*(unsigned char *)(*(void *)&buf[8] + 24))
        {
          _Block_object_dispose(buf, 8);

          goto LABEL_26;
        }
        v21 = [v16 startDate];
        uint64_t v22 = self->_bookmark;
        self->_bookmark = v21;

        [(_PSMediaAnalysisProcessingTask *)self saveBookmark];
        _Block_object_dispose(buf, 8);
      }
LABEL_19:
    }
    uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v13) {
      continue;
    }
    break;
  }
LABEL_26:

LABEL_27:
  if (v27) {
    v27[2]();
  }
}

- (id)updatedAttachmentsWithPeopleIdForAttachments:(id)a3 forBundleID:(id)a4
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v88 = objc_opt_new();
  v81 = objc_opt_new();
  id v109 = 0;
  v75 = v6;
  v77 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v109];
  id v76 = v109;
  id v8 = v77;
  if (!v77)
  {
    v9 = +[_PSLogging mediaAnalysisChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_PSMediaAnalysisProcessingTask updatedAttachmentsWithPeopleIdForAttachments:forBundleID:]((uint64_t)v76, v9, v10, v11, v12, v13, v14, v15);
    }

    id v8 = 0;
  }
  int v16 = [v8 developerType];
  v17 = +[_PSLogging mediaAnalysisChannel];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = [NSNumber numberWithBool:v16 == 1];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v18;
    _os_log_impl(&dword_1A314B000, v17, OS_LOG_TYPE_INFO, "Attachments %@, isFirstParty: %@", buf, 0x16u);
  }
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  obuint64_t j = v5;
  uint64_t v83 = [obj countByEnumeratingWithState:&v105 objects:v119 count:16];
  if (!v83)
  {

    goto LABEL_69;
  }
  char v74 = 0;
  uint64_t v82 = *(void *)v106;
  do
  {
    for (uint64_t i = 0; i != v83; ++i)
    {
      if (*(void *)v106 != v82) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void **)(*((void *)&v105 + 1) + 8 * i);
      [v88 addObject:v19];
      v20 = [v19 photoLocalIdentifier];
      BOOL v21 = v20 == 0;

      if (!v21)
      {
        uint64_t v22 = [v19 photoLocalIdentifier];
        char v23 = [v81 containsObject:v22];

        if ((v23 & 1) == 0)
        {
          v24 = [v19 contentURL];
          if (v24
            && ([v19 contentURL],
                objc_super v25 = objc_claimAutoreleasedReturnValue(),
                int v26 = [v25 isFileURL],
                v25,
                v24,
                v26))
          {
            uint64_t v27 = +[_PSLogging mediaAnalysisChannel];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A314B000, v27, OS_LOG_TYPE_INFO, "Fetching attachment info from fileURL", buf, 2u);
            }

            v28 = [getMADServiceClass() service];
            personIdentificationRequest = self->_personIdentificationRequest;
            v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&personIdentificationRequest count:1];
            v30 = [v19 contentURL];
            long long v31 = [v19 photoLocalIdentifier];
            id v104 = 0;
            char v32 = [v28 performRequests:v29 onImageURL:v30 withIdentifier:v31 error:&v104];
            id v79 = v104;

            if ((v32 & 1) == 0) {
              goto LABEL_19;
            }
LABEL_28:
            v44 = [v19 photoLocalIdentifier];

            if (v44)
            {
              v45 = [v19 photoLocalIdentifier];
              [v81 addObject:v45];
            }
            v46 = [(MADPersonIdentificationRequest *)self->_personIdentificationRequest results];
            v47 = +[_PSLogging mediaAnalysisChannel];
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              v48 = [v19 photoLocalIdentifier];
              uint64_t v49 = [v46 count];
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v48;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v49;
              _os_log_impl(&dword_1A314B000, v47, OS_LOG_TYPE_INFO, "For PhotoId: %@, fetched %tu photo results", buf, 0x16u);
            }
            long long v101 = 0u;
            long long v102 = 0u;
            long long v99 = 0u;
            long long v100 = 0u;
            os_log_t oslog = v46;
            uint64_t v87 = [oslog countByEnumeratingWithState:&v99 objects:v116 count:16];
            if (v87)
            {
              uint64_t v86 = *(void *)v100;
              do
              {
                uint64_t v50 = 0;
                do
                {
                  if (*(void *)v100 != v86)
                  {
                    uint64_t v51 = v50;
                    objc_enumerationMutation(oslog);
                    uint64_t v50 = v51;
                  }
                  uint64_t v89 = v50;
                  id v90 = *(id *)(*((void *)&v99 + 1) + 8 * v50);
                  v52 = +[_PSLogging mediaAnalysisChannel];
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
                  {
                    v53 = [v19 photoLocalIdentifier];
                    v54 = [v90 resultItems];
                    uint64_t v55 = [v54 count];
                    *(_DWORD *)buf = 138412546;
                    *(void *)&buf[4] = v53;
                    *(_WORD *)&buf[12] = 2048;
                    *(void *)&buf[14] = v55;
                    _os_log_impl(&dword_1A314B000, v52, OS_LOG_TYPE_INFO, "PhotoId: %@ has %tu personId", buf, 0x16u);
                  }
                  long long v97 = 0u;
                  long long v98 = 0u;
                  long long v95 = 0u;
                  long long v96 = 0u;
                  v56 = [v90 resultItems];
                  uint64_t v57 = [v56 countByEnumeratingWithState:&v95 objects:v115 count:16];
                  if (v57)
                  {
                    uint64_t v58 = *(void *)v96;
                    do
                    {
                      for (uint64_t j = 0; j != v57; ++j)
                      {
                        if (*(void *)v96 != v58) {
                          objc_enumerationMutation(v56);
                        }
                        v60 = [*(id *)(*((void *)&v95 + 1) + 8 * j) personIdentifier];
                        if (v60)
                        {
                          [v7 addObject:v60];
                          v61 = +[_PSLogging mediaAnalysisChannel];
                          if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                          {
                            v62 = [v19 photoLocalIdentifier];
                            *(_DWORD *)buf = 138412547;
                            *(void *)&buf[4] = v62;
                            *(_WORD *)&buf[12] = 2113;
                            *(void *)&buf[14] = v60;
                            _os_log_impl(&dword_1A314B000, v61, OS_LOG_TYPE_INFO, "PhotoId: %@, adding personIdentifier: %{private}@", buf, 0x16u);
                          }
                        }
                      }
                      uint64_t v57 = [v56 countByEnumeratingWithState:&v95 objects:v115 count:16];
                    }
                    while (v57);
                  }

                  uint64_t v50 = v89 + 1;
                }
                while (v89 + 1 != v87);
                uint64_t v87 = [oslog countByEnumeratingWithState:&v99 objects:v116 count:16];
              }
              while (v87);
            }

            v63 = +[_PSLogging mediaAnalysisChannel];
            if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
            {
              v64 = [v19 photoLocalIdentifier];
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v64;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v7;
              _os_log_impl(&dword_1A314B000, v63, OS_LOG_TYPE_INFO, "PhotoId: %@, asset identifiers %@", buf, 0x16u);
            }
            if ([v7 count])
            {
              long long v93 = 0u;
              long long v94 = 0u;
              long long v91 = 0u;
              long long v92 = 0u;
              id v65 = v7;
              uint64_t v66 = [v65 countByEnumeratingWithState:&v91 objects:v114 count:16];
              if (v66)
              {
                uint64_t v67 = *(void *)v92;
                do
                {
                  for (uint64_t k = 0; k != v66; ++k)
                  {
                    if (*(void *)v92 != v67) {
                      objc_enumerationMutation(v65);
                    }
                    uint64_t v69 = *(void *)(*((void *)&v91 + 1) + 8 * k);
                    v70 = (void *)[v19 copy];
                    [v70 setPersonInPhoto:v69];
                    v71 = [v19 photoLocalIdentifier];
                    [v70 setPhotoLocalIdentifier:v71];

                    [v88 addObject:v70];
                  }
                  uint64_t v66 = [v65 countByEnumeratingWithState:&v91 objects:v114 count:16];
                }
                while (v66);
              }

              char v74 = 1;
            }
          }
          else
          {
            v35 = [v19 photoLocalIdentifier];

            if (!v35) {
              continue;
            }
            v36 = +[_PSLogging mediaAnalysisChannel];
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              char v37 = [v19 photoLocalIdentifier];
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v37;
              _os_log_impl(&dword_1A314B000, v36, OS_LOG_TYPE_INFO, "Fetching attachment info from photoLocalIdentifier %@", buf, 0xCu);
            }
            v38 = [getMADServiceClass() service];
            v117 = self->_personIdentificationRequest;
            v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v117 count:1];
            v40 = [v19 photoLocalIdentifier];
            uint64_t v110 = 0;
            v111 = &v110;
            uint64_t v112 = 0x2050000000;
            v41 = (void *)getPHPhotoLibraryClass_softClass_2;
            uint64_t v113 = getPHPhotoLibraryClass_softClass_2;
            if (!getPHPhotoLibraryClass_softClass_2)
            {
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __getPHPhotoLibraryClass_block_invoke_2;
              v121 = &unk_1E5ADE858;
              v122 = &v110;
              __getPHPhotoLibraryClass_block_invoke_2((uint64_t)buf);
              v41 = (void *)v111[3];
            }
            id v42 = v41;
            _Block_object_dispose(&v110, 8);
            v43 = [v42 systemPhotoLibraryURL];
            id v103 = 0;
            LODWORD(v42) = [v38 performRequests:v39 assetLocalIdentifier:v40 photoLibraryURL:v43 error:&v103];
            id v79 = v103;

            if (v42) {
              goto LABEL_28;
            }
LABEL_19:
            if (!v79) {
              continue;
            }
            os_log_t oslog = +[_PSLogging mediaAnalysisChannel];
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              long long v33 = [v19 photoLocalIdentifier];
              long long v34 = [v79 localizedDescription];
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v33;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v34;
              _os_log_error_impl(&dword_1A314B000, oslog, OS_LOG_TYPE_ERROR, "PhotoId: %@, Media Analysis returned an error %@", buf, 0x16u);
            }
          }

          continue;
        }
      }
    }
    uint64_t v83 = [obj countByEnumeratingWithState:&v105 objects:v119 count:16];
  }
  while (v83);

  if (v74)
  {
    id v72 = v88;
    goto LABEL_70;
  }
LABEL_69:
  id v72 = (id)MEMORY[0x1E4F1CBF0];
LABEL_70:

  return v72;
}

- (BOOL)skipAttachmentProcessing:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "photoLocalIdentifier", (void)v13);

          if (v10)
          {
            BOOL v11 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 1;
LABEL_14:
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (void)saveBookmark
{
}

- (BOOL)updatePlistWithDict:(id)a3
{
  id v9 = 0;
  v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:&v9];
  id v5 = v9;
  if (v4)
  {
    char v6 = [v4 writeToFile:self->_mediaAnalysisConfigurationPath atomically:1];
  }
  else
  {
    uint64_t v7 = +[_PSLogging mediaAnalysisChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_PSMediaAnalysisProcessingTask updatePlistWithDict:](v5, v7);
    }

    char v6 = 0;
  }

  return v6;
}

- (BOOL)attachmentsContainsPersonId:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaAnalysisConfigurationPath, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_personIdentificationRequest, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)updatedAttachmentsWithPeopleIdForAttachments:(uint64_t)a3 forBundleID:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updatePlistWithDict:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 localizedDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Error encountered while updating plist: %@", (uint8_t *)&v4, 0xCu);
}

@end