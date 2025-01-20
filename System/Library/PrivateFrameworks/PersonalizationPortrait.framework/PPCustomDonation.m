@interface PPCustomDonation
+ (BOOL)donateLabeledStrings:(id)a3 bundleId:(id)a4 groupId:(id)a5 documentId:(id)a6 error:(id *)a7;
+ (BOOL)donateNotification:(id)a3 error:(id *)a4;
+ (BOOL)donateParsecNamedEntitiesAndTopics:(id)a3 rawQuery:(id)a4 reformulatedQuery:(id)a5 source:(id)a6 error:(id *)a7;
+ (BOOL)donatePhotosLocationNamedEntities:(id)a3 bundleId:(id)a4 error:(id *)a5;
+ (BOOL)donatePhotosNamedEntities:(id)a3 bundleId:(id)a4 date:(id)a5 error:(id *)a6;
+ (BOOL)donatePhotosOneUpLocationNamedEntities:(id)a3 bundleId:(id)a4 error:(id *)a5;
+ (BOOL)donatePhotosTopics:(id)a3 bundleId:(id)a4 date:(id)a5 error:(id *)a6;
+ (BOOL)donateSiriQuery:(id)a3 results:(id)a4 error:(id *)a5;
@end

@implementation PPCustomDonation

+ (BOOL)donateLabeledStrings:(id)a3 bundleId:(id)a4 groupId:(id)a5 documentId:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.suggestd.PersonalizationPortrait.StringDonation" options:0];
  v16 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA7AD08];
  [v15 setRemoteObjectInterface:v16];

  [v15 resume];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__6751;
  v26 = __Block_byref_object_dispose__6752;
  id v27 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __75__PPCustomDonation_donateLabeledStrings_bundleId_groupId_documentId_error___block_invoke;
  v21[3] = &unk_1E550F638;
  v21[4] = &v22;
  v17 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v21];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __75__PPCustomDonation_donateLabeledStrings_bundleId_groupId_documentId_error___block_invoke_108;
  v20[3] = &unk_1E550F638;
  v20[4] = &v22;
  [v17 donateLabeledStrings:v11 bundleId:v12 groupId:v13 documentId:v14 completion:v20];
  [v15 invalidate];
  if (a7) {
    *a7 = (id) v23[5];
  }
  BOOL v18 = v23[5] == 0;

  _Block_object_dispose(&v22, 8);
  return v18;
}

void __75__PPCustomDonation_donateLabeledStrings_bundleId_groupId_documentId_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = pp_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    v8 = @"com.apple.suggestd.PersonalizationPortrait.StringDonation";
    _os_log_error_impl(&dword_18CAA6000, v4, OS_LOG_TYPE_ERROR, "PPStringDonation: connection to %@ interrupted.", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __75__PPCustomDonation_donateLabeledStrings_bundleId_groupId_documentId_error___block_invoke_108(uint64_t a1, void *a2)
{
}

+ (BOOL)donateParsecNamedEntitiesAndTopics:(id)a3 rawQuery:(id)a4 reformulatedQuery:(id)a5 source:(id)a6 error:(id *)a7
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = (__CFString *)a4;
  id v13 = (__CFString *)a5;
  id v14 = a6;
  v15 = pp_default_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v11 count];
    _os_log_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEFAULT, "Received donation of %tu entity groups(s) from parsec", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__6751;
  v59 = __Block_byref_object_dispose__6752;
  id v60 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__6751;
  v50 = __Block_byref_object_dispose__6752;
  id v51 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  if ([v11 count])
  {
    v16 = pp_entities_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v54 = 138739971;
      v55 = v12;
      _os_log_debug_impl(&dword_18CAA6000, v16, OS_LOG_TYPE_DEBUG, "Raw Parsec query: %{sensitive}@", v54, 0xCu);
    }

    v17 = pp_entities_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v54 = 138739971;
      v55 = v13;
      _os_log_debug_impl(&dword_18CAA6000, v17, OS_LOG_TYPE_DEBUG, "Reformulated Parsec query: %{sensitive}@", v54, 0xCu);
    }

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __95__PPCustomDonation_donateParsecNamedEntitiesAndTopics_rawQuery_reformulatedQuery_source_error___block_invoke;
    v32[3] = &unk_1E550F598;
    v34 = &v42;
    id v33 = v14;
    p_long long buf = &buf;
    v36 = &v38;
    v37 = &v46;
    [v11 enumerateKeysAndObjectsUsingBlock:v32];
    if (*((unsigned char *)v43 + 24))
    {
      if (*((unsigned char *)v39 + 24))
      {
        BOOL v18 = objc_opt_new();
        id v31 = 0;
        char v19 = [v18 flushDonationsWithError:&v31];
        v20 = (__CFString *)v31;

        if ((v19 & 1) == 0)
        {
          v21 = pp_default_log_handle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v54 = 138412290;
            v55 = v20;
            _os_log_impl(&dword_18CAA6000, v21, OS_LOG_TYPE_DEFAULT, "PPCustomDonation: donateParsecNamedEntitiesAndTopics: Warning: failed to flush: %@", v54, 0xCu);
          }
        }
        if (*((unsigned char *)v43 + 24)) {
          BOOL v22 = *((unsigned char *)v39 + 24) != 0;
        }
        else {
          BOOL v22 = 0;
        }

        goto LABEL_31;
      }
      if (a7)
      {
        v29 = (void *)v47[5];
        if (v29)
        {
          *a7 = v29;
          v28 = v39;
          goto LABEL_26;
        }
      }
    }
    else if (a7)
    {
      id v27 = *(void **)(*((void *)&buf + 1) + 40);
      if (v27)
      {
        *a7 = v27;
        v28 = v43;
LABEL_26:
        BOOL v22 = *((unsigned char *)v28 + 24) != 0;
LABEL_31:
        v25 = v33;
        goto LABEL_32;
      }
    }
    BOOL v22 = 0;
    goto LABEL_31;
  }
  v23 = pp_default_log_handle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v54 = 138412290;
    v55 = @"No entity groups donated by parsec";
    _os_log_error_impl(&dword_18CAA6000, v23, OS_LOG_TYPE_ERROR, "%@", v54, 0xCu);
  }

  if (a7)
  {
    id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
    v52 = @"PPErrorInfoKey";
    v53 = @"No entity groups donated by parsec";
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    id v26 = (id)[v24 initWithDomain:@"PPErrorDomain" code:5 userInfo:v25];
    BOOL v22 = 0;
    *a7 = v26;
LABEL_32:

    goto LABEL_33;
  }
  BOOL v22 = 0;
LABEL_33:
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&buf, 8);
  return v22;
}

void __95__PPCustomDonation_donateParsecNamedEntitiesAndTopics_rawQuery_reformulatedQuery_source_error___block_invoke(void *a1, void *a2, void *a3)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = [v5 item];
  v8 = [v7 name];
  uint64_t v9 = [v8 length];

  if (!v9)
  {
    v15 = pp_entities_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEFAULT, "Skipping empty named entity received from Parsec donation", buf, 2u);
    }
    goto LABEL_7;
  }
  v10 = objc_opt_new();
  v28[0] = v5;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  uint64_t v12 = a1[4];
  uint64_t v13 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v13 + 40);
  char v14 = [v10 donateNamedEntities:v11 source:v12 algorithm:12 cloudSync:1 sentimentScore:&obj error:0.0];
  objc_storeStrong((id *)(v13 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v14;

  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    v15 = pp_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(*(void *)(a1[6] + 8) + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v27 = v16;
      _os_log_error_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_ERROR, "Error donating named entities from Parsec query: %@", buf, 0xCu);
    }
LABEL_7:
  }
  v17 = objc_msgSend(v6, "_pas_filteredArrayWithTest:", &__block_literal_global_99);
  if ([v17 count])
  {
    BOOL v18 = objc_opt_new();
    uint64_t v19 = a1[4];
    uint64_t v20 = *(void *)(a1[8] + 8);
    id v24 = *(id *)(v20 + 40);
    char v21 = [v18 donateTopics:v17 source:v19 algorithm:7 cloudSync:1 sentimentScore:0 exactMatchesInSourceText:&v24 error:0.0];
    objc_storeStrong((id *)(v20 + 40), v24);
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v21;

    if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
    {
      BOOL v22 = pp_default_log_handle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = *(void *)(*(void *)(a1[8] + 8) + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v27 = v23;
        _os_log_error_impl(&dword_18CAA6000, v22, OS_LOG_TYPE_ERROR, "Error donating topics from Parsec query: %@", buf, 0xCu);
      }
    }
  }
}

BOOL __95__PPCustomDonation_donateParsecNamedEntitiesAndTopics_rawQuery_reformulatedQuery_source_error___block_invoke_96(uint64_t a1, void *a2)
{
  v2 = [a2 item];
  id v3 = [v2 topicIdentifier];

  if ([v3 hasPrefix:@"Q"])
  {
    v4 = [v3 substringFromIndex:1];
    BOOL v5 = [v4 intValue] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)donatePhotosTopics:(id)a3 bundleId:(id)a4 date:(id)a5 error:(id *)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = pp_topics_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    uint64_t v32 = [v9 count];
    __int16 v33 = 2112;
    id v34 = v10;
    _os_log_impl(&dword_18CAA6000, v12, OS_LOG_TYPE_DEFAULT, "Received donation of %tu topic(s) from %@", buf, 0x16u);
  }

  if ([v9 count])
  {
    uint64_t v13 = objc_opt_new();
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __59__PPCustomDonation_donatePhotosTopics_bundleId_date_error___block_invoke;
    v27[3] = &unk_1E550F548;
    v28 = v13;
    id v14 = v13;
    [v9 enumerateKeysAndObjectsUsingBlock:v27];
    v15 = [PPSource alloc];
    id v16 = [NSString alloc];
    [v11 timeIntervalSinceReferenceDate];
    BOOL v18 = (void *)[v16 initWithFormat:@"%@-%f", @"photos-unmapped", v17];
    uint64_t v19 = [(PPSource *)v15 initWithBundleId:v10 groupId:@"com.apple.proactive.PersonalizationPortrait.PhotosGraphDonation" documentId:v18 date:v11];

    uint64_t v20 = objc_opt_new();
    char v21 = [v20 donateTopics:v14 source:v19 algorithm:5 cloudSync:0 sentimentScore:0 exactMatchesInSourceText:a6 error:0.0];

    BOOL v22 = v28;
  }
  else
  {
    id v14 = (id)[[NSString alloc] initWithFormat:@"No topics donated by %@", v10];
    uint64_t v23 = pp_default_log_handle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v32 = (uint64_t)v14;
      _os_log_error_impl(&dword_18CAA6000, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    if (!a6)
    {
      char v21 = 0;
      goto LABEL_10;
    }
    id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
    v29 = @"PPErrorInfoKey";
    id v30 = v14;
    BOOL v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v25 = (id)[v24 initWithDomain:@"PPErrorDomain" code:5 userInfo:v22];
    char v21 = 0;
    *a6 = v25;
  }

LABEL_10:
  return v21;
}

void __59__PPCustomDonation_donatePhotosTopics_bundleId_date_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v11 = [[PPTopic alloc] initWithTopicIdentifier:v6];

  int v7 = [PPScoredItem alloc];
  [v5 doubleValue];
  double v9 = v8;

  id v10 = [(PPScoredItem *)v7 initWithItem:v11 score:v9];
  [*(id *)(a1 + 32) addObject:v10];
}

+ (BOOL)donatePhotosNamedEntities:(id)a3 bundleId:(id)a4 date:(id)a5 error:(id *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = pp_entities_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    uint64_t v27 = [v9 count];
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl(&dword_18CAA6000, v12, OS_LOG_TYPE_DEFAULT, "Received donation of %tu named entities(s) from %@", buf, 0x16u);
  }

  uint64_t v13 = [PPSource alloc];
  id v14 = [NSString alloc];
  [v11 timeIntervalSinceReferenceDate];
  id v16 = objc_msgSend(v14, "initWithFormat:", @"photos-%f", v15);
  uint64_t v17 = [(PPSource *)v13 initWithBundleId:v10 groupId:@"com.apple.proactive.PersonalizationPortrait.PhotosGraphDonation" documentId:v16 date:v11];

  BOOL v18 = objc_opt_new();
  int v19 = [v18 donateNamedEntities:v9 source:v17 algorithm:11 cloudSync:0 sentimentScore:a6 error:0.0];

  if (v19)
  {
    uint64_t v20 = objc_opt_new();
    id v25 = 0;
    char v21 = [v20 flushDonationsWithError:&v25];
    id v22 = v25;

    if ((v21 & 1) == 0)
    {
      uint64_t v23 = pp_default_log_handle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v27 = (uint64_t)v22;
        _os_log_impl(&dword_18CAA6000, v23, OS_LOG_TYPE_DEFAULT, "PPCustomDonation: donatePhotosNamedEntities: Warning: failed to flush: %@", buf, 0xCu);
      }
    }
  }

  return v19;
}

+ (BOOL)donatePhotosLocationNamedEntities:(id)a3 bundleId:(id)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = pp_entities_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218242;
    uint64_t v15 = [v7 count];
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_18CAA6000, v9, OS_LOG_TYPE_DEFAULT, "Received donation of %tu graph location named entities(s) from %@", (uint8_t *)&v14, 0x16u);
  }

  id v10 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_6797);

  id v11 = objc_opt_new();
  char v12 = [v11 donateLocationNamedEntities:v10 bundleId:v8 groupId:@"com.apple.proactive.PersonalizationPortrait.PhotosGraphDonation" error:a5];

  return v12;
}

id __69__PPCustomDonation_donatePhotosLocationNamedEntities_bundleId_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 documentId];

  if (!v3)
  {
    id v4 = [NSString alloc];
    id v5 = objc_opt_new();
    [v5 timeIntervalSinceReferenceDate];
    id v7 = objc_msgSend(v4, "initWithFormat:", @"photos-%f", floor(v6));
    [v2 setDocumentId:v7];
  }
  return v2;
}

+ (BOOL)donatePhotosOneUpLocationNamedEntities:(id)a3 bundleId:(id)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = pp_entities_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218242;
    uint64_t v14 = [v7 count];
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_18CAA6000, v9, OS_LOG_TYPE_DEFAULT, "Received donation of %tu one-up location named entities(s) from %@", (uint8_t *)&v13, 0x16u);
  }

  id v10 = objc_opt_new();
  char v11 = [v10 donateLocationNamedEntities:v7 bundleId:v8 groupId:@"com.apple.proactive.PersonalizationPortrait.PhotosOneUpDonation" error:a5];

  return v11;
}

+ (BOOL)donateNotification:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = pp_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v26 = v6;
    __int16 v27 = 2112;
    __int16 v28 = @"com.apple.proactive.PersonalizationPortrait.Notifications";
    _os_log_impl(&dword_18CAA6000, v7, OS_LOG_TYPE_DEFAULT, "PPCustomDonation: received notification: %@ groupId: %@", buf, 0x16u);
  }

  id v8 = objc_opt_new();
  id v9 = [v8 UUIDString];

  v23[0] = @"textContent";
  id v10 = [v6 message];
  v24[0] = v10;
  v23[1] = @"title";
  uint64_t v11 = [v6 title];
  char v12 = (void *)v11;
  if (v11) {
    int v13 = (__CFString *)v11;
  }
  else {
    int v13 = &stru_1EDA56F70;
  }
  v24[1] = v13;
  v23[2] = @"contentDescription";
  uint64_t v14 = [v6 subtitle];
  __int16 v15 = (void *)v14;
  if (v14) {
    id v16 = (__CFString *)v14;
  }
  else {
    id v16 = &stru_1EDA56F70;
  }
  v24[2] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  uint64_t v18 = [v6 bundleId];
  id v22 = 0;
  [a1 donateLabeledStrings:v17 bundleId:v18 groupId:@"com.apple.proactive.PersonalizationPortrait.Notifications" documentId:v9 error:&v22];
  id v19 = v22;

  if (v19)
  {
    uint64_t v20 = pp_default_log_handle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v26 = v19;
      _os_log_error_impl(&dword_18CAA6000, v20, OS_LOG_TYPE_ERROR, "Error donating notification to PersonalizationPortrait: %@", buf, 0xCu);
    }

    if (a4) {
      *a4 = v19;
    }
  }

  return v19 == 0;
}

+ (BOOL)donateSiriQuery:(id)a3 results:(id)a4 error:(id *)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = pp_default_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v68 = [v9 count];
    _os_log_impl(&dword_18CAA6000, v10, OS_LOG_TYPE_DEFAULT, "Received donation of %tu result(s) from Siri", buf, 0xCu);
  }

  uint64_t v11 = objc_opt_new();
  char v12 = [v11 UUIDString];

  v65 = @"textContent";
  id v66 = v8;
  int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
  id v63 = 0;
  [a1 donateLabeledStrings:v13 bundleId:@"com.apple.siri.assistant_service" groupId:@"com.apple.proactive.PersonalizationPortrait.SiriDonation" documentId:v12 error:&v63];
  id v14 = v63;

  if (v14)
  {
    __int16 v15 = pp_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v68 = (uint64_t)v14;
      _os_log_error_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_ERROR, "Error piping Siri query into suggestd: %@", buf, 0xCu);
    }

    char v16 = 0;
    if (a5) {
      *a5 = v14;
    }
  }
  else
  {
    v56 = a5;
    uint64_t v17 = objc_opt_new();
    uint64_t v18 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v19 = [v18 languageCode];

    uint64_t v20 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    unint64_t v21 = [v20 count];

    id v57 = v8;
    if (v21 >= 2)
    {
      id v22 = v12;
      id v23 = v9;
      id v24 = (void *)MEMORY[0x1E4F89D60];
      id v25 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      id v26 = [MEMORY[0x1E4F1CA20] preferredLanguages];
      __int16 v27 = (void *)[v25 initWithArray:v26];
      __int16 v28 = [v24 detectLanguageFromTextHeuristicallyWithLanguages:v8 languages:v27 defaultLanguage:0];
      uint64_t v29 = v28;
      if (v28)
      {
        id v30 = v28;
      }
      else
      {
        id v31 = [MEMORY[0x1E4F1CA20] currentLocale];
        id v30 = [v31 languageCode];

        id v19 = v31;
      }

      id v19 = v30;
      id v8 = v57;
      id v9 = v23;
      char v12 = v22;
    }
    uint64_t v32 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v19];
    uint64_t v33 = [v32 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];

    id v34 = -[PPSourceMetadata initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:]([PPSourceMetadata alloc], "initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:", 0, 0, [v8 length], 0, 0, 0);
    uint64_t v35 = [PPSource alloc];
    v36 = objc_opt_new();
    v54 = v34;
    v55 = (void *)v33;
    v53 = [(PPSource *)v35 initWithBundleId:@"com.apple.siri.assistant_service" groupId:@"com.apple.proactive.PersonalizationPortrait.SiriDonation" documentId:v12 date:v36 relevanceDate:0 contactHandles:0 language:v33 metadata:v34];

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v37 = v9;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v60 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          v43 = [v42 qid];

          if (v43)
          {
            uint64_t v44 = [PPTopic alloc];
            char v45 = [v42 qid];
            uint64_t v46 = [(PPTopic *)v44 initWithTopicIdentifier:v45];

            v47 = [PPScoredItem alloc];
            uint64_t v48 = [v42 confidence];
            [v48 doubleValue];
            v49 = -[PPScoredItem initWithItem:score:](v47, "initWithItem:score:", v46);
            [v17 addObject:v49];
          }
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v59 objects:v64 count:16];
      }
      while (v39);
    }

    v50 = objc_opt_new();
    id v58 = 0;
    char v16 = [v50 donateTopics:v17 source:v53 algorithm:2 cloudSync:1 sentimentScore:0 exactMatchesInSourceText:&v58 error:0.0];
    id v51 = v58;

    if (v56 && v51) {
      id *v56 = v51;
    }

    id v8 = v57;
    id v14 = 0;
  }

  return v16;
}

@end