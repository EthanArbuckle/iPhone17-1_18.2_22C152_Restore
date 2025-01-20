@interface NSManagedObjectModel(NewObjectModel)
+ (id)modelCandidatesForCloudRecordings;
+ (id)modelCompatibleWithStoreMetadata:()NewObjectModel forStoreURL:;
+ (id)mutableModelForModelFileName:()NewObjectModel;
+ (id)rc_currentObjectModel;
+ (id)rc_newObjectModel;
+ (id)rc_v10ObjectModel;
+ (id)rc_v11ObjectModel;
+ (id)rc_v12ObjectModel;
+ (id)rc_v13ObjectModel;
+ (id)rc_v6ObjectModel;
+ (id)rc_v7ObjectModel;
+ (id)rc_v7bObjectModel;
+ (id)rc_v8ObjectModel;
+ (id)rc_v9ObjectModel;
+ (uint64_t)updateAudioFutureAttribute:()NewObjectModel;
+ (void)rc_newObjectModel;
+ (void)updateAllowsCloudEncryptionAttributes:()NewObjectModel;
@end

@implementation NSManagedObjectModel(NewObjectModel)

+ (id)rc_newObjectModel
{
  v1 = objc_msgSend(a1, "rc_currentObjectModel");
  if (!v1)
  {
    v2 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      +[NSManagedObjectModel(NewObjectModel) rc_newObjectModel](v2);
    }
  }
  return v1;
}

+ (id)rc_currentObjectModel
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 URLForResource:@"VoiceMemos" withExtension:@"momd"];

  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C120]) initWithContentsOfURL:v3];
  v5 = (void *)[v4 mutableCopy];

  [a1 updateAudioFutureAttribute:v5];
  [a1 updateAllowsCloudEncryptionAttributes:v5];

  return v5;
}

+ (uint64_t)updateAudioFutureAttribute:()NewObjectModel
{
  id v12 = a3;
  if ([MEMORY[0x1E4F1C008] instancesRespondToSelector:sel_isFileBackedFuture])
  {
    v3 = [v12 entitiesByName];
    v4 = [v3 objectForKeyedSubscript:@"CloudRecording"];
    v5 = [v4 attributesByName];
    v6 = [v5 objectForKeyedSubscript:@"audioFuture"];

    if (([v6 isFileBackedFuture] & 1) == 0)
    {
      v7 = [v12 entitiesByName];
      v8 = [v7 objectForKeyedSubscript:@"CloudRecording"];
      v9 = [v8 attributesByName];
      v10 = [v9 objectForKeyedSubscript:@"audioFuture"];

      [v10 setIsFileBackedFuture:1];
    }
  }
  return MEMORY[0x1F41817F8]();
}

+ (void)updateAllowsCloudEncryptionAttributes:()NewObjectModel
{
  v19[7] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v19[0] = @"encryptedAudioFuture";
  v19[1] = @"encryptedCustomLabel";
  v19[2] = @"encryptedDate";
  v19[3] = @"encryptedDuration";
  v19[4] = @"encryptedEvictionDate";
  v19[5] = @"encryptedSharedFlags";
  v19[6] = @"encryptedUniqueID";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:7];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        v10 = objc_msgSend(v3, "entitiesByName", (void)v14);
        v11 = [v10 objectForKey:@"CloudRecording"];
        id v12 = [v11 attributesByName];
        v13 = [v12 objectForKey:v9];
        [v13 setAllowsCloudEncryption:1];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

+ (id)rc_v13ObjectModel
{
  v2 = [a1 mutableModelForModelFileName:@"VoiceMemos13.mom"];
  [a1 updateAudioFutureAttribute:v2];
  [a1 updateAllowsCloudEncryptionAttributes:v2];
  return v2;
}

+ (id)rc_v12ObjectModel
{
  v2 = [a1 mutableModelForModelFileName:@"VoiceMemos12.mom"];
  [a1 updateAudioFutureAttribute:v2];
  [a1 updateAllowsCloudEncryptionAttributes:v2];
  return v2;
}

+ (id)rc_v11ObjectModel
{
  v2 = [a1 mutableModelForModelFileName:@"VoiceMemos11.mom"];
  [a1 updateAudioFutureAttribute:v2];
  [a1 updateAllowsCloudEncryptionAttributes:v2];
  return v2;
}

+ (id)rc_v10ObjectModel
{
  v2 = [a1 mutableModelForModelFileName:@"VoiceMemos10.mom"];
  [a1 updateAudioFutureAttribute:v2];
  [a1 updateAllowsCloudEncryptionAttributes:v2];
  return v2;
}

+ (id)rc_v9ObjectModel
{
  v2 = [a1 mutableModelForModelFileName:@"VoiceMemos9.mom"];
  [a1 updateAudioFutureAttribute:v2];
  [a1 updateAllowsCloudEncryptionAttributes:v2];
  return v2;
}

+ (id)rc_v8ObjectModel
{
  v2 = [a1 mutableModelForModelFileName:@"VoiceMemos8.mom"];
  [a1 updateAudioFutureAttribute:v2];
  [a1 updateAllowsCloudEncryptionAttributes:v2];
  return v2;
}

+ (id)rc_v7bObjectModel
{
  v2 = [a1 mutableModelForModelFileName:@"VoiceMemos7b.mom"];
  [a1 updateAudioFutureAttribute:v2];
  return v2;
}

+ (id)rc_v7ObjectModel
{
  v2 = [a1 mutableModelForModelFileName:@"VoiceMemos7.mom"];
  [a1 updateAudioFutureAttribute:v2];
  return v2;
}

+ (id)rc_v6ObjectModel
{
  v2 = [a1 mutableModelForModelFileName:@"VoiceMemos6.mom"];
  [a1 updateAudioFutureAttribute:v2];
  return v2;
}

+ (id)modelCompatibleWithStoreMetadata:()NewObjectModel forStoreURL:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 modelCandidatesForCloudRecordings];
  v28 = v4;
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1BF78]];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v29 = *(void *)v35;
    v26 = @"Cloud";
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v29) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "entityVersionHashesByName", v26);
        id v12 = [v11 objectForKeyedSubscript:@"CloudRecording"];
        v13 = [v6 objectForKeyedSubscript:@"CloudRecording"];
        int v14 = [v12 isEqual:v13];

        long long v15 = [v6 objectForKeyedSubscript:@"Folder"];
        long long v16 = [v11 objectForKeyedSubscript:@"Folder"];
        if (v15 == v16) {
          int v17 = 1;
        }
        else {
          int v17 = [v15 isEqual:v16];
        }
        if (v14 & v17) == 1 && ([v10 isConfiguration:v26 compatibleWithStoreMetadata:v28])
        {
          id v24 = v10;

          goto LABEL_25;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v18 = obj;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v31;
    while (2)
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        if ([v23 isConfiguration:@"Cloud" compatibleWithStoreMetadata:v28])
        {
          id v24 = v23;
          goto LABEL_25;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
      id v24 = 0;
      if (v20) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v24 = 0;
  }
LABEL_25:

  return v24;
}

+ (id)mutableModelForModelFileName:()NewObjectModel
{
  id v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  uint64_t v5 = [v3 bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 URLForResource:@"VoiceMemos" withExtension:@"momd"];

  uint64_t v7 = [v6 URLByAppendingPathComponent:v4];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C120]) initWithContentsOfURL:v7];
  uint64_t v9 = (void *)[v8 mutableCopy];

  return v9;
}

+ (id)modelCandidatesForCloudRecordings
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(a1, "rc_v13ObjectModel");
  id v3 = objc_msgSend(a1, "rc_v12ObjectModel", v2);
  v13[1] = v3;
  id v4 = objc_msgSend(a1, "rc_v11ObjectModel");
  v13[2] = v4;
  uint64_t v5 = objc_msgSend(a1, "rc_v10ObjectModel");
  v13[3] = v5;
  uint64_t v6 = objc_msgSend(a1, "rc_v9ObjectModel");
  v13[4] = v6;
  uint64_t v7 = objc_msgSend(a1, "rc_v8ObjectModel");
  v13[5] = v7;
  uint64_t v8 = objc_msgSend(a1, "rc_v7bObjectModel");
  v13[6] = v8;
  uint64_t v9 = objc_msgSend(a1, "rc_v7ObjectModel");
  v13[7] = v9;
  v10 = objc_msgSend(a1, "rc_v6ObjectModel");
  v13[8] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

+ (void)rc_newObjectModel
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "+[NSManagedObjectModel(NewObjectModel) rc_newObjectModel]";
  _os_log_fault_impl(&dword_1C3964000, log, OS_LOG_TYPE_FAULT, "%s -- ERROR: Attempt to load model into NSManagedObjectModel failed, possibly due to file handle exhaustion...", (uint8_t *)&v1, 0xCu);
}

@end