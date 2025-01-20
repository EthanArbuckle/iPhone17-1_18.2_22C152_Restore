@interface PLAssetComputeSyncJournalEntryPayload
+ (BOOL)shouldIncludeOCR;
+ (id)detectedFacePropertiesDescription;
+ (id)entityName;
+ (id)mediaAnalysisAttributesPropertiesDictionary;
+ (id)modelProperties;
+ (id)modelPropertiesDescription;
+ (id)payloadAdapterForManagedObject:(id)a3;
+ (id)payloadClassID;
+ (id)persistedPropertyNamesForEntityNames;
+ (id)sceneClassificationPropertiesDescription;
+ (unsigned)payloadVersion;
+ (void)setShouldIncludeOCR:(BOOL)a3;
- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5;
- (NSNumber)mediaAnalysisImageVersion;
- (int64_t)characterRecognitionVersion;
- (int64_t)faceAnalysisVersion;
- (int64_t)imageEmbeddingVersion;
- (int64_t)mediaAnalysisVersion;
- (int64_t)sceneAnalysisVersion;
- (int64_t)videoEmbeddingVersion;
- (int64_t)visualSearchVersion;
- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6 payloadDictionary:(id)a7 info:(id)a8;
@end

@implementation PLAssetComputeSyncJournalEntryPayload

- (int64_t)videoEmbeddingVersion
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"videoEmbeddingVersion"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (int64_t)imageEmbeddingVersion
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"imageEmbeddingVersion"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (int64_t)visualSearchVersion
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"vsAlgorithmVersion"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (int64_t)characterRecognitionVersion
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"crAlgorithmVersion"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (NSNumber)mediaAnalysisImageVersion
{
  return (NSNumber *)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"mediaAnalysisImageVersion"];
}

- (int64_t)mediaAnalysisVersion
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"mediaAnalysisVersion"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (int64_t)faceAnalysisVersion
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"faceAnalysisVersion"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (int64_t)sceneAnalysisVersion
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"sceneAnalysisVersion"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 parentProperty];
  if ([v11 isEqualToKey:@"generatedAssetDescriptions"])
  {
    int v12 = [v10 isEqualToKey:@"analysisVersion"];

    if (v12) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  if (([v10 isEqualToKey:@"mediaAnalysisVersion"] & 1) == 0
    && ([v10 isEqualToKey:@"mediaAnalysisImageVersion"] & 1) == 0
    && ([v10 isEqualToKey:@"imageEmbeddingVersion"] & 1) == 0
    && ![v10 isEqualToKey:@"videoEmbeddingVersion"])
  {
    if (([v10 isEqualToKey:@"imageCaptionVersion"] & 1) != 0
      || ([v10 isEqualToKey:@"videoCaptionVersion"] & 1) != 0)
    {
      goto LABEL_11;
    }
LABEL_14:
    v15.receiver = self;
    v15.super_class = (Class)PLAssetComputeSyncJournalEntryPayload;
    BOOL v13 = [(PLManagedObjectJournalEntryPayload *)&v15 comparePayloadValue:v8 toObjectDictionaryValue:v9 forPayloadProperty:v10];
    goto LABEL_15;
  }
LABEL_9:
  if ([v9 integerValue] != 1 || !objc_msgSend(v8, "integerValue")) {
    goto LABEL_14;
  }
LABEL_11:
  BOOL v13 = 1;
LABEL_15:

  return v13;
}

- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6 payloadDictionary:(id)a7 info:(id)a8
{
  id v14 = a3;
  id v82 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = [v14 parentProperty];
  int v20 = [v19 isToManySubRelationship];

  if (v20)
  {
    v122.receiver = self;
    v122.super_class = (Class)PLAssetComputeSyncJournalEntryPayload;
    [(PLManagedObjectJournalEntryPayload *)&v122 applyPayloadProperty:v14 toManagedObject:v82 key:v15 payloadAttributesToUpdate:v16 payloadDictionary:v17 info:v18];
    goto LABEL_9;
  }
  if (([v14 isEqualToKey:@"sceneClassifications"] & 1) != 0
    || [v14 isEqualToKey:@"temporalSceneClassifications"])
  {
    v21 = [v14 key];
    v22 = [v17 objectForKeyedSubscript:v21];

    if ([v22 count])
    {
      v23 = v18;
      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v120[0] = MEMORY[0x1E4F143A8];
      v120[1] = 3221225472;
      v120[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke;
      v120[3] = &unk_1E5871D18;
      id v121 = v24;
      id v78 = v24;
      [v22 enumerateObjectsUsingBlock:v120];
      [v82 valueForKey:v15];
      id v80 = v15;
      id v25 = v17;
      v27 = v26 = v16;
      v28 = (void *)[v27 mutableCopy];

      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v118[0] = MEMORY[0x1E4F143A8];
      v118[1] = 3221225472;
      v118[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_2;
      v118[3] = &unk_1E586A8D0;
      id v30 = v29;
      id v119 = v30;
      [v28 enumerateObjectsUsingBlock:v118];
      v110[0] = MEMORY[0x1E4F143A8];
      v110[1] = 3221225472;
      v110[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_3;
      v110[3] = &unk_1E586A948;
      id v111 = v14;
      id v31 = v82;
      id v112 = v31;
      v113 = self;
      id v114 = v26;
      id v115 = v23;
      id v116 = v30;
      id v117 = v28;
      id v32 = v28;
      id v33 = v30;
      id v16 = v26;
      id v17 = v25;
      id v15 = v80;
      id v34 = v33;
      [v78 enumerateKeysAndObjectsUsingBlock:v110];
      v35 = v31;
      id v18 = v23;
      [v35 setValue:v32 forKey:v80];
    }
    goto LABEL_9;
  }
  if (([v14 isEqualToKey:@"detectedFaces"] & 1) != 0
    || [v14 isEqualToKey:@"temporalDetectedFaces"])
  {
    v79 = v16;
    v81 = v18;
    id v36 = v82;
    v37 = [v36 managedObjectContext];
    v38 = [v14 key];
    v39 = [v17 objectForKeyedSubscript:v38];

    v40 = v39;
    if ([v39 count])
    {
      v76 = v37;
      v77 = v36;
      uint64_t v106 = 0;
      v107 = &v106;
      uint64_t v108 = 0x2020000000;
      char v109 = 0;
      v41 = [v14 subRelationshipProperties];
      v102[0] = MEMORY[0x1E4F143A8];
      v102[1] = 3221225472;
      v102[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_7;
      v102[3] = &unk_1E586A970;
      v105 = &v106;
      id v42 = v81;
      id v103 = v42;
      v104 = self;
      [v41 enumerateKeysAndObjectsUsingBlock:v102];

      if (*((unsigned char *)v107 + 24))
      {
        char v43 = [v14 isEqualToKey:@"temporalDetectedFaces"];
        id v44 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v93[0] = MEMORY[0x1E4F143A8];
        v93[1] = 3221225472;
        v93[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_8;
        v93[3] = &unk_1E586A998;
        id v45 = v76;
        id v94 = v45;
        id v46 = v77;
        id v95 = v46;
        char v101 = v43;
        id v47 = v44;
        id v96 = v47;
        id v97 = v14;
        v98 = self;
        id v99 = v79;
        id v100 = v42;
        [v40 enumerateObjectsUsingBlock:v93];
        v48 = [v46 valueForKey:v15];
        v49 = (void *)[v48 mutableCopy];

        id v50 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v89[0] = MEMORY[0x1E4F143A8];
        v89[1] = 3221225472;
        v89[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_10;
        v89[3] = &unk_1E586A9C0;
        id v51 = v47;
        id v90 = v51;
        id v91 = v45;
        id v52 = v50;
        id v92 = v52;
        [v49 enumerateObjectsUsingBlock:v89];
        [v49 unionSet:v51];
        [v49 minusSet:v52];
        [v46 setValue:v49 forKey:v15];
      }
      _Block_object_dispose(&v106, 8);
      v37 = v76;
      id v36 = v77;
    }

    id v16 = v79;
    id v18 = v81;
    goto LABEL_9;
  }
  if ([v14 isEqualToKey:@"generatedAssetDescriptions"])
  {
    id v53 = v15;
    id v54 = v17;
    id v55 = v16;
    payloadAttributes = self->super._payloadAttributes;
    [v14 key];
    v58 = id v57 = v18;
    v59 = [(NSMutableDictionary *)payloadAttributes objectForKeyedSubscript:v58];

    id v18 = v57;
    id v60 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_11;
    v86[3] = &unk_1E586AF70;
    id v87 = v14;
    id v88 = v60;
    id v61 = v60;
    [v59 enumerateObjectsUsingBlock:v86];
    +[PLGeneratedAssetDescription setGeneratedAssetDescriptionForAsset:v82 fromDictionaries:v61];

    id v16 = v55;
    id v17 = v54;
    id v15 = v53;

    goto LABEL_9;
  }
  if ([v14 isEqualToKey:@"mediaAnalysisVersion"]
    && [(PLAssetComputeSyncJournalEntryPayload *)self mediaAnalysisVersion] >= 1)
  {
    [v82 setMediaAnalysisVersion:1];
    goto LABEL_9;
  }
  if ([v14 isEqualToKey:@"mediaAnalysisImageVersion"])
  {
    [(PLAssetComputeSyncJournalEntryPayload *)self mediaAnalysisImageVersion];
    id v62 = v15;
    id v63 = v17;
    v65 = id v64 = v16;
    id v66 = v18;
    uint64_t v67 = [v65 integerValue];

    id v16 = v64;
    id v17 = v63;
    id v15 = v62;
    BOOL v68 = v67 < 1;
    id v18 = v66;
    if (!v68)
    {
      [v82 setMediaAnalysisImageVersion:1];
      goto LABEL_9;
    }
  }
  if ([v14 isEqualToKey:@"imageEmbeddingVersion"]
    && [(PLAssetComputeSyncJournalEntryPayload *)self imageEmbeddingVersion] >= 1)
  {
    [v82 setImageEmbeddingVersion:1];
    goto LABEL_9;
  }
  if ([v14 isEqualToKey:@"videoEmbeddingVersion"]
    && [(PLAssetComputeSyncJournalEntryPayload *)self videoEmbeddingVersion] >= 1)
  {
    [v82 setVideoEmbeddingVersion:1];
    goto LABEL_9;
  }
  if (([v14 isEqualToKey:@"imageCaptionVersion"] & 1) == 0
    && ([v14 isEqualToKey:@"videoCaptionVersion"] & 1) == 0)
  {
    if ([v14 isEqualToKey:@"sceneAnalysisVersion"])
    {
      id v69 = v18;
      v70 = v17;
      id v71 = v16;
      id v72 = v82;
      v73 = [v70 objectForKeyedSubscript:@"packedPreferredCropRect"];

      if (v73)
      {
        v85[0] = self;
        v85[1] = PLAssetComputeSyncJournalEntryPayload;
        v74 = (objc_super *)v85;
LABEL_39:
        id v16 = v71;
        [(objc_super *)v74 applyPayloadProperty:v14 toManagedObject:v72 key:v15 payloadAttributesToUpdate:v71 payloadDictionary:v70 info:v69];
LABEL_44:
        id v17 = v70;

        id v18 = v69;
        goto LABEL_9;
      }
      [v72 setSceneAnalysisVersion:0];
    }
    else
    {
      if (![v14 isEqualToKey:@"sceneAnalysisTimestamp"])
      {
        v83.receiver = self;
        v83.super_class = (Class)PLAssetComputeSyncJournalEntryPayload;
        [(PLManagedObjectJournalEntryPayload *)&v83 applyPayloadProperty:v14 toManagedObject:v82 key:v15 payloadAttributesToUpdate:v16 payloadDictionary:v17 info:v18];
        goto LABEL_9;
      }
      id v69 = v18;
      v70 = v17;
      id v71 = v16;
      id v72 = v82;
      v75 = [v70 objectForKeyedSubscript:@"packedPreferredCropRect"];

      if (v75)
      {
        v84.receiver = self;
        v84.super_class = (Class)PLAssetComputeSyncJournalEntryPayload;
        v74 = &v84;
        goto LABEL_39;
      }
      [v72 setSceneAnalysisTimestamp:0];
    }
    id v16 = v71;
    goto LABEL_44;
  }
LABEL_9:
}

void __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  int64_t v3 = [v5 objectForKeyedSubscript:@"classificationType"];
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (!v4)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  }
  [v4 addObject:v5];
}

void __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  int64_t v3 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v5, "classificationType"));
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (!v4)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  }
  [v4 addObject:v5];
}

void __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_alloc_init(v5);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_4;
  v16[3] = &unk_1E586A920;
  id v17 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  v11 = *(void **)(a1 + 56);
  id v18 = v9;
  uint64_t v19 = v10;
  id v20 = v11;
  id v21 = *(id *)(a1 + 64);
  id v12 = v8;
  id v22 = v12;
  [v6 enumerateObjectsUsingBlock:v16];

  BOOL v13 = [*(id *)(a1 + 72) objectForKeyedSubscript:v7];

  if (v13)
  {
    [*(id *)(a1 + 80) minusSet:v13];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_6;
    v14[3] = &unk_1E586A8D0;
    id v15 = *(id *)(a1 + 40);
    [v13 enumerateObjectsUsingBlock:v14];
  }
  [*(id *)(a1 + 80) unionSet:v12];
}

void __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_7(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = (void *)a1[4];
  if (v8) {
    char v9 = [v8 shouldApplyWithPayloadProperty:v7 andPayload:a1[5]];
  }
  else {
    char v9 = 1;
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v9;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    *a4 = 1;
  }
}

void __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PLFaceRebuildHelper alloc] initWithContext:*(void *)(a1 + 32)];
  id v5 = [[PLAssetComputeCacheFaceRebuildDescription alloc] initWithPayloadAttributes:v3];
  id v6 = [(PLFaceRebuildHelper *)v4 findExistingDetectedFaceForRebuildFace:v5 onAsset:*(void *)(a1 + 40)];
  if (!v6)
  {
    id v6 = +[PLManagedObject insertInManagedObjectContext:*(void *)(a1 + 32)];
  }
  if (!*(unsigned char *)(a1 + 88))
  {
    id v7 = [(PLAssetComputeCacheFaceRebuildDescription *)v5 sourceWidth];
    if (v7)
    {
    }
    else
    {
      id v8 = [(PLAssetComputeCacheFaceRebuildDescription *)v5 sourceHeight];

      if (!v8)
      {
        objc_msgSend(v6, "setSourceWidth:", objc_msgSend(*(id *)(a1 + 40), "width"));
        objc_msgSend(v6, "setSourceHeight:", objc_msgSend(*(id *)(a1 + 40), "height"));
      }
    }
  }
  [*(id *)(a1 + 48) addObject:v6];
  char v9 = [*(id *)(a1 + 56) subRelationshipProperties];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_9;
  v13[3] = &unk_1E586A8F8;
  id v10 = *(void **)(a1 + 72);
  v13[4] = *(void *)(a1 + 64);
  id v14 = v6;
  id v15 = v10;
  id v16 = v3;
  id v17 = *(id *)(a1 + 80);
  id v11 = v3;
  id v12 = v6;
  [v9 enumerateKeysAndObjectsUsingBlock:v13];
}

void __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_10(id *a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(a1[4], "containsObject:") & 1) == 0)
  {
    [a1[5] deleteObject:v3];
    [a1[6] removeObject:v3];
  }
}

void __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"analysisSourceType"];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = [*(id *)(a1 + 32) subRelationshipProperties];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    id v10 = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_12;
    id v11 = &unk_1E586A9E8;
    id v12 = v3;
    id v13 = v5;
    id v7 = v5;
    [v6 enumerateKeysAndObjectsUsingBlock:&v8];

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v4, v8, v9, v10, v11);
  }
}

void __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v6 key];
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];

  LODWORD(v5) = [v6 isEqualToKey:@"analysisVersion"];
  if (v5 && [v8 integerValue] >= 1)
  {
    uint64_t v9 = *(void **)(a1 + 40);
    id v10 = &unk_1EEBEE778;
  }
  else
  {
    uint64_t v9 = *(void **)(a1 + 40);
    id v10 = v8;
  }
  [v9 setObject:v10 forKeyedSubscript:v11];
}

uint64_t __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) applyPayloadProperty:a3 toManagedObject:*(void *)(a1 + 40) key:a2 payloadAttributesToUpdate:*(void *)(a1 + 48) payloadDictionary:*(void *)(a1 + 56) info:*(void *)(a1 + 64)];
}

void __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F1C0A8];
  id v5 = [*(id *)(a1 + 32) subRelationshipEntityName];
  id v6 = [*(id *)(a1 + 40) managedObjectContext];
  id v7 = [v4 insertNewObjectForEntityForName:v5 inManagedObjectContext:v6];

  uint64_t v8 = [*(id *)(a1 + 32) subRelationshipProperties];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_5;
  v12[3] = &unk_1E586A8F8;
  uint64_t v9 = *(void **)(a1 + 56);
  v12[4] = *(void *)(a1 + 48);
  id v13 = v7;
  id v14 = v9;
  id v15 = v3;
  id v16 = *(id *)(a1 + 64);
  id v10 = v3;
  id v11 = v7;
  [v8 enumerateKeysAndObjectsUsingBlock:v12];

  [*(id *)(a1 + 72) addObject:v11];
}

void __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 managedObjectContext];
  [v4 deleteObject:v3];
}

uint64_t __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) applyPayloadProperty:a3 toManagedObject:*(void *)(a1 + 40) key:a2 payloadAttributesToUpdate:*(void *)(a1 + 48) payloadDictionary:*(void *)(a1 + 56) info:*(void *)(a1 + 64)];
}

+ (unsigned)payloadVersion
{
  return 1;
}

+ (id)entityName
{
  return +[PLManagedAsset entityName];
}

+ (id)payloadClassID
{
  v2 = [a1 entityName];
  id v3 = [v2 stringByAppendingString:@"ComputeSync"];

  return v3;
}

+ (id)payloadAdapterForManagedObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = off_1E585E000;
  if ((isKindOfClass & 1) == 0) {
    id v5 = off_1E585E008;
  }
  id v6 = (void *)[objc_alloc(*v5) initWithManagedObject:v3];

  return v6;
}

+ (id)persistedPropertyNamesForEntityNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PLAssetComputeSyncJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_47429 != -1) {
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_47429, block);
  }
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_47430;
  return v2;
}

void __77__PLAssetComputeSyncJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) persistedPropertyNamesForEntityNamesFromModelProperties];
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_47430;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_47430 = v1;
}

+ (id)modelProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PLAssetComputeSyncJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_47431 != -1) {
    dispatch_once(&modelProperties_onceToken_47431, block);
  }
  v2 = (void *)modelProperties_modelProperties_47432;
  return v2;
}

uint64_t __56__PLAssetComputeSyncJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modelPropertiesDescription];
  id v3 = (void *)modelProperties_modelProperties_47432;
  modelProperties_modelProperties_47432 = v2;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = modelProperties_modelProperties_47432;
  return [v4 loadModelPropertiesDescription:v5 parentPayloadProperty:0];
}

+ (id)modelPropertiesDescription
{
  v90[15] = *MEMORY[0x1E4F143B8];
  id v3 = [[PLJournalEntryPayloadPropertyInfoAssetCompute alloc] initWithAnalysisStage:100 versionType:1];
  id v4 = [[PLJournalEntryPayloadPropertyInfoAssetCompute alloc] initWithAnalysisStage:200 versionType:2];
  uint64_t v5 = [[PLJournalEntryPayloadPropertyInfoAssetCompute alloc] initWithAnalysisStage:950 versionType:3];
  id v46 = [[PLJournalEntryPayloadPropertyInfoAssetCompute alloc] initWithAnalysisStage:0 versionType:1];
  char v43 = [[PLJournalEntryPayloadPropertyInfoAssetCompute alloc] initWithAnalysisStage:0 versionType:3];
  v89[0] = @"cloudAssetGUID";
  id v80 = +[PLJournalEntryPayloadProperty payloadPropertyForUUID];
  v90[0] = v80;
  v89[1] = @"iconicScore";
  v79 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v90[1] = v79;
  v89[2] = @"overallAestheticScore";
  id v78 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v90[2] = v78;
  v89[3] = @"stickerConfidenceScore";
  v77 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v90[3] = v77;
  void v89[4] = @"faceAdjustmentVersion";
  v49 = v4;
  v76 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"assetFaceAdjustmentVersion" andType:900 info:v4];
  v90[4] = v76;
  v89[5] = @"packedPreferredCropRect";
  v75 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v90[5] = v75;
  v89[6] = @"packedAcceptableCropRect";
  v74 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v90[6] = v74;
  v89[7] = @"videoKeyFrameValue";
  v73 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v90[7] = v73;
  v89[8] = @"videoKeyFrameTimeScale";
  id v72 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v90[8] = v72;
  v89[9] = @"mediaAnalysisAttributes";
  id v71 = +[PLMediaAnalysisAssetAttributes entityName];
  v70 = [a1 mediaAnalysisAttributesPropertiesDictionary];
  id v69 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"mediaAnalysisAttributes" subRelationshipProperties:v70 subRelationshipEntityName:v71 isToMany:0 isAdditionalEntityName:1 info:0];
  v90[9] = v69;
  v89[10] = @"computedAttributes";
  id v51 = +[PLComputedAssetAttributes entityName];
  v87[0] = @"failureScore";
  BOOL v68 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[0] = v68;
  v87[1] = @"harmoniousColorScore";
  uint64_t v67 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[1] = v67;
  v87[2] = @"immersivenessScore";
  id v66 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[2] = v66;
  v87[3] = @"interactionScore";
  v65 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[3] = v65;
  v87[4] = @"interestingSubjectScore";
  id v64 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[4] = v64;
  v87[5] = @"intrusiveObjectPresenceScore";
  id v63 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[5] = v63;
  v87[6] = @"livelyColorScore";
  id v62 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[6] = v62;
  v87[7] = @"lowLight";
  id v61 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[7] = v61;
  v87[8] = @"noiseScore";
  id v60 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[8] = v60;
  v87[9] = @"pleasantCameraTiltScore";
  v59 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[9] = v59;
  v87[10] = @"pleasantCompositionScore";
  v58 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[10] = v58;
  v87[11] = @"pleasantLightingScore";
  id v57 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[11] = v57;
  v87[12] = @"pleasantPatternScore";
  v56 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[12] = v56;
  v87[13] = @"pleasantPerspectiveScore";
  id v55 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[13] = v55;
  v87[14] = @"pleasantPostProcessingScore";
  id v54 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[14] = v54;
  v87[15] = @"pleasantReflectionsScore";
  id v53 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[15] = v53;
  v87[16] = @"pleasantSymmetryScore";
  id v52 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[16] = v52;
  v87[17] = @"sharplyFocusedSubjectScore";
  id v50 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[17] = v50;
  v87[18] = @"tastefullyBlurredScore";
  v48 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[18] = v48;
  v87[19] = @"wellChosenSubjectScore";
  id v47 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[19] = v47;
  v87[20] = @"wellFramedSubjectScore";
  id v45 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[20] = v45;
  v87[21] = @"wellTimedShotScore";
  id v44 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v88[21] = v44;
  id v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:22];
  v41 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"computedAssetAttributes" subRelationshipProperties:v42 subRelationshipEntityName:v51 isToMany:0 isAdditionalEntityName:1 info:v3];
  v90[10] = v41;
  v89[11] = @"additionalAttributes";
  v26 = +[PLAdditionalAssetAttributes entityName];
  v85[0] = @"objectSaliencyRectsData";
  v39 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"objectSaliencyRectData" andType:1000 info:v3];
  v86[0] = v39;
  v85[1] = @"variationSuggestionStates";
  v38 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v86[1] = v38;
  void v85[2] = @"sceneAnalysisTimestamp";
  v37 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v86[2] = v37;
  v85[3] = @"sceneAnalysisVersion";
  v40 = v3;
  id v36 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v86[3] = v36;
  v85[4] = @"faceAnalysisVersion";
  v35 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  void v86[4] = v35;
  v85[5] = @"sceneClassifications";
  id v34 = +[PLSceneClassification entityName];
  id v33 = [a1 sceneClassificationPropertiesDescription];
  id v32 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"sceneClassifications" subRelationshipProperties:v33 subRelationshipEntityName:v34 isToMany:1 isAdditionalEntityName:1 info:v46];
  v86[5] = v32;
  v85[6] = @"temporalSceneClassifications";
  id v31 = +[PLSceneClassification entityName];
  id v30 = [a1 sceneClassificationPropertiesDescription];
  id v29 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"temporalSceneClassifications" subRelationshipProperties:v30 subRelationshipEntityName:v31 isToMany:1 isAdditionalEntityName:1 info:v43];
  v86[6] = v29;
  v85[7] = @"sceneprint";
  id v24 = +[PLSceneprint entityName];
  v83[0] = @"data";
  v28 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"spData" andType:1000 info:0];
  v84[0] = v28;
  v83[1] = @"duplicateMatchingAlternateData";
  v27 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"spDuplicateMatchingAlternateData" andType:1000 info:0];
  v84[1] = v27;
  v83[2] = @"duplicateMatchingData";
  id v25 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"spDuplicateMatchingData" andType:1000 info:0];
  v84[2] = v25;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:3];
  id v22 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"sceneprint" subRelationshipProperties:v23 subRelationshipEntityName:v24 isToMany:0 isAdditionalEntityName:1 info:v3];
  v86[7] = v22;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:8];
  id v20 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"additionalAssetAttributes" subRelationshipProperties:v21 subRelationshipEntityName:v26 isToMany:0 isAdditionalEntityName:1 info:0];
  v90[11] = v20;
  v89[12] = @"detectedFaces";
  uint64_t v19 = +[PLDetectedFace entityName];
  id v18 = [a1 detectedFacePropertiesDescription];
  id v17 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"detectedFaces" subRelationshipProperties:v18 subRelationshipEntityName:v19 isToMany:1 isAdditionalEntityName:1 info:0];
  v90[12] = v17;
  v89[13] = @"temporalDetectedFaces";
  id v16 = +[PLDetectedFace entityName];
  id v6 = [a1 detectedFacePropertiesDescription];
  id v7 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"temporalDetectedFaces" subRelationshipProperties:v6 subRelationshipEntityName:v16 isToMany:1 isAdditionalEntityName:1 info:v5];
  v90[13] = v7;
  v89[14] = @"generatedAssetDescriptionNodes";
  uint64_t v8 = +[PLGraphNode entityName];
  v81[0] = @"descriptionText";
  uint64_t v9 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v82[0] = v9;
  v81[1] = @"analysisVersion";
  id v10 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v82[1] = v10;
  v81[2] = @"analysisSourceType";
  id v11 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v82[2] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:3];
  id v13 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"generatedAssetDescriptions" subRelationshipProperties:v12 subRelationshipEntityName:v8 isToMany:1 isAdditionalEntityName:1 info:v5];
  v90[14] = v13;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:15];

  return v15;
}

+ (id)mediaAnalysisAttributesPropertiesDictionary
{
  v61[32] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [[PLJournalEntryPayloadPropertyInfoAssetCompute alloc] initWithAnalysisStage:100 versionType:1];
  id v52 = [[PLJournalEntryPayloadPropertyInfoAssetCompute alloc] initWithAnalysisStage:200 versionType:4];
  id v53 = [[PLJournalEntryPayloadPropertyInfoAssetCompute alloc] initWithAnalysisStage:200 versionType:5];
  id v3 = [[PLJournalEntryPayloadPropertyInfoAssetCompute alloc] initWithAnalysisStage:950 versionType:3];
  v60[0] = @"activityScore";
  v49 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[0] = v49;
  v60[1] = @"animatedStickerRangeDurationTimeScale";
  v48 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[1] = v48;
  v60[2] = @"animatedStickerRangeDurationValue";
  id v47 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[2] = v47;
  v60[3] = @"animatedStickerRangeStartTimeScale";
  id v46 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[3] = v46;
  v60[4] = @"animatedStickerRangeStartValue";
  id v45 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[4] = v45;
  v60[5] = @"audioClassification";
  id v44 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[5] = v44;
  v60[6] = @"audioScore";
  char v43 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[6] = v43;
  v60[7] = @"autoplaySuggestionScore";
  id v42 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[7] = v42;
  v60[8] = @"bestVideoRangeDurationTimeScale";
  v41 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[8] = v41;
  v60[9] = @"bestVideoRangeDurationValue";
  v40 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[9] = v40;
  v60[10] = @"bestVideoRangeStartTimeScale";
  v39 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[10] = v39;
  v60[11] = @"bestVideoRangeStartValue";
  v38 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[11] = v38;
  v60[12] = @"blurrinessScore";
  v37 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[12] = v37;
  v60[13] = @"colorNormalizationData";
  id v36 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[13] = v36;
  v60[14] = @"exposureScore";
  v35 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[14] = v35;
  v60[15] = @"faceCount";
  id v34 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[15] = v34;
  v60[16] = @"mediaAnalysisTimeStamp";
  id v33 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[16] = v33;
  v60[17] = @"mediaAnalysisVersion";
  id v32 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[17] = v32;
  v60[18] = @"mediaAnalysisImageVersion";
  id v31 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[18] = v31;
  v60[19] = @"packedBestPlaybackRect";
  id v30 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[19] = v30;
  v60[20] = @"probableRotationDirection";
  id v29 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[20] = v29;
  v60[21] = @"probableRotationDirectionConfidence";
  v28 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[21] = v28;
  v60[22] = @"screenTimeDeviceImageSensitivity";
  v27 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[22] = v27;
  v60[23] = @"settlingEffectScore";
  v26 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[23] = v26;
  v60[24] = @"imageEmbeddingVersion";
  id v25 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[24] = v25;
  v60[25] = @"videoEmbeddingVersion";
  id v24 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[25] = v24;
  v60[26] = @"videoScore";
  v23 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[26] = v23;
  v60[27] = @"videoStickerSuggestionScore";
  id v22 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[27] = v22;
  v60[28] = @"wallpaperScore";
  id v50 = v2;
  id v21 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61[28] = v21;
  v60[29] = @"visualSearchVersion";
  id v4 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"vsAlgorithmVersion" andType:100 info:0];
  v61[29] = v4;
  v60[30] = @"visualSearchStickerConfidenceVersion";
  uint64_t v5 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"vsStickerConfidenceAlgorithmVersion" andType:100 info:0];
  v61[30] = v5;
  v60[31] = @"visualSearchAttributes";
  id v6 = +[PLVisualSearchAttributes entityName];
  v58[0] = @"adjustmentVersion";
  id v7 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"vsAdjustmentVersion" andType:900 info:0];
  v58[1] = @"visualSearchData";
  v59[0] = v7;
  uint64_t v8 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v59[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
  id v10 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"visualSearchAttributes" subRelationshipProperties:v9 subRelationshipEntityName:v6 isToMany:0 isAdditionalEntityName:1 info:v53];
  v61[31] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:32];
  id v51 = (id)[v11 mutableCopy];

  if ([(id)objc_opt_class() shouldIncludeOCR])
  {
    v56[0] = @"characterRecognitionVersion";
    id v12 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"crAlgorithmVersion" andType:100 info:0];
    v56[1] = @"characterRecognitionAttributes";
    v57[0] = v12;
    id v13 = +[PLCharacterRecognitionAttributes entityName];
    v54[0] = @"adjustmentVersion";
    id v14 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"crAdjustmentVersion" andType:900 info:0];
    v55[0] = v14;
    v54[1] = @"characterRecognitionData";
    id v15 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
    v55[1] = v15;
    v54[2] = @"machineReadableCodeData";
    id v16 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"crMachineReadableCodeData" andType:1000 info:0];
    v55[2] = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];
    id v18 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"characterRecognitionAttributes" subRelationshipProperties:v17 subRelationshipEntityName:v13 isToMany:0 isAdditionalEntityName:1 info:v52];
    v57[1] = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
    [v51 addEntriesFromDictionary:v19];
  }
  return v51;
}

+ (id)detectedFacePropertiesDescription
{
  v76[54] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [[PLJournalEntryPayloadPropertyInfoAssetCompute alloc] initWithAnalysisStage:200 versionType:2];
  v70 = [[PLJournalEntryPayloadPropertyInfoAssetCompute alloc] initWithAnalysisStage:950 versionType:3];
  v75[0] = @"sourceWidth";
  id v69 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[0] = v69;
  v75[1] = @"sourceHeight";
  BOOL v68 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[1] = v68;
  v75[2] = @"centerX";
  uint64_t v67 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[2] = v67;
  v75[3] = @"centerY";
  id v66 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[3] = v66;
  v75[4] = @"size";
  v65 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[4] = v65;
  v75[5] = @"bodyCenterX";
  id v64 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[5] = v64;
  v75[6] = @"bodyCenterY";
  id v63 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[6] = v63;
  v75[7] = @"bodyWidth";
  id v62 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[7] = v62;
  v75[8] = @"bodyHeight";
  id v61 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[8] = v61;
  v75[9] = @"detectionType";
  id v60 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[9] = v60;
  v75[10] = @"nameSource";
  v59 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[10] = v59;
  v75[11] = @"cloudNameSource";
  v58 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[11] = v58;
  v75[12] = @"hidden";
  id v57 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[12] = v57;
  v75[13] = @"manual";
  v56 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[13] = v56;
  v75[14] = @"faceAlgorithmVersion";
  id v55 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[14] = v55;
  v75[15] = @"adjustmentVersion";
  id v54 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[15] = v54;
  v75[16] = @"ageType";
  id v53 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[16] = v53;
  v75[17] = @"assetVisible";
  id v52 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[17] = v52;
  v75[18] = @"blurScore";
  id v51 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[18] = v51;
  v75[19] = @"clusterSequenceNumber";
  id v50 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[19] = v50;
  v75[20] = @"confirmedFaceCropGenerationState";
  v49 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[20] = v49;
  v75[21] = @"eyeMakeupType";
  v48 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[21] = v48;
  v75[22] = @"duration";
  id v47 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"duration" andType:500 info:v2];
  v76[22] = v47;
  v75[23] = @"eyesState";
  id v46 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[23] = v46;
  v75[24] = @"facialHairType";
  id v45 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[24] = v45;
  v75[25] = @"genderType";
  id v44 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[25] = v44;
  v75[26] = @"glassesType";
  char v43 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[26] = v43;
  v75[27] = @"groupingIdentifier";
  id v42 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[27] = v42;
  v75[28] = @"hairColorType";
  v41 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[28] = v41;
  v75[29] = @"hasSmile";
  v40 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[29] = v40;
  v75[30] = @"isLeftEyeClosed";
  v39 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[30] = v39;
  v75[31] = @"isRightEyeClosed";
  v38 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[31] = v38;
  v75[32] = @"lipMakeupType";
  v37 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[32] = v37;
  v75[33] = @"faceExpressionType";
  id v36 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[33] = v36;
  v75[34] = @"headgearType";
  v35 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[34] = v35;
  v75[35] = @"hairType";
  id v34 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[35] = v34;
  v75[36] = @"poseType";
  id v33 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[36] = v33;
  v75[37] = @"skintoneType";
  id v32 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[37] = v32;
  v75[38] = @"ethnicityType";
  id v31 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[38] = v31;
  v75[39] = @"hasFaceMask";
  id v30 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[39] = v30;
  v75[40] = @"gazeType";
  id v29 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[40] = v29;
  v75[41] = @"gazeCenterX";
  v28 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[41] = v28;
  v75[42] = @"gazeCenterY";
  v27 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[42] = v27;
  v75[43] = @"gazeRectString";
  v26 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[43] = v26;
  v75[44] = @"gazeAngle";
  id v25 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[44] = v25;
  v75[45] = @"gazeConfidence";
  id v24 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[45] = v24;
  v75[46] = @"roll";
  v23 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[46] = v23;
  v75[47] = @"poseYaw";
  id v22 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[47] = v22;
  v75[48] = @"qualityMeasure";
  id v21 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[48] = v21;
  v75[49] = @"quality";
  id v20 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[49] = v20;
  v75[50] = @"smileType";
  uint64_t v19 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v76[50] = v19;
  v75[51] = @"startTime";
  id v18 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"startTime" andType:500 info:v2];
  v76[51] = v18;
  v75[52] = @"faceprint";
  id v15 = +[PLDetectedFaceprint entityName];
  v73[0] = @"data";
  id v17 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"faceprintData" andType:1000 info:0];
  v74[0] = v17;
  v73[1] = @"faceprintVersion";
  id v16 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v74[1] = v16;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:2];
  id v13 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"faceprint" subRelationshipProperties:v14 subRelationshipEntityName:v15 isToMany:0 isAdditionalEntityName:1 info:v2];
  v76[52] = v13;
  v75[53] = @"detectionTraits";
  id v3 = +[PLDetectionTrait entityName];
  v71[0] = @"duration";
  id v4 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"duration" andType:500 info:0];
  v72[0] = v4;
  v71[1] = @"score";
  uint64_t v5 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v72[1] = v5;
  v71[2] = @"startTime";
  id v6 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"startTime" andType:500 info:0];
  v72[2] = v6;
  v71[3] = @"type";
  id v7 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v72[3] = v7;
  v71[4] = @"value";
  uint64_t v8 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v72[4] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:5];
  id v10 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"detectionTraits" subRelationshipProperties:v9 subRelationshipEntityName:v3 isToMany:1 isAdditionalEntityName:1 info:v70];
  v76[53] = v10;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:54];

  return v12;
}

+ (id)sceneClassificationPropertiesDescription
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v10[0] = @"classificationType";
  uint64_t v2 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v11[0] = v2;
  v10[1] = @"confidence";
  id v3 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v11[1] = v3;
  v10[2] = @"duration";
  id v4 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v11[2] = v4;
  v10[3] = @"packedBoundingBoxRect";
  uint64_t v5 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v11[3] = v5;
  v10[4] = @"sceneIdentifier";
  id v6 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v11[4] = v6;
  v10[5] = @"startTime";
  id v7 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v11[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];

  return v8;
}

+ (void)setShouldIncludeOCR:(BOOL)a3
{
  if (MEMORY[0x19F38C0C0](a1, a2)) {
    shouldIncludeOCR = a3;
  }
}

+ (BOOL)shouldIncludeOCR
{
  if (MEMORY[0x19F38C0C0](a1, a2)) {
    return shouldIncludeOCR;
  }
  return MEMORY[0x1F4140198]();
}

@end