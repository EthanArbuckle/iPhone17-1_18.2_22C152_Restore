@interface PLLegacyChangeEvent
+ (BOOL)isEmptyEvent:(id)a3;
+ (id)_descriptionForEvent:(id)a3;
+ (id)_descriptionForEvent:(id)a3 withPersistentStoreCoordinator:(id)a4;
+ (id)localChangeEventFromChangeHubEvent:(id)a3 withLibraryBundle:(id)a4;
@end

@implementation PLLegacyChangeEvent

+ (BOOL)isEmptyEvent:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3 && xpc_dictionary_get_count(v3))
  {
    if (xpc_dictionary_get_uint64(v4, "eventKind") == 1)
    {
      v5 = xpc_dictionary_get_value(v4, (const char *)[(id)*MEMORY[0x1E4F1BDF0] UTF8String]);
      v6 = v5;
      if (v5 && xpc_array_get_count(v5))
      {
        BOOL v7 = 0;
      }
      else
      {
        v8 = xpc_dictionary_get_value(v4, (const char *)[(id)*MEMORY[0x1E4F1BFA0] UTF8String]);
        v9 = v8;
        if (v8 && xpc_array_get_count(v8))
        {
          BOOL v7 = 0;
        }
        else
        {
          v10 = xpc_dictionary_get_value(v4, (const char *)[(id)*MEMORY[0x1E4F1BDB8] UTF8String]);
          v11 = v10;
          if (v10 && xpc_array_get_count(v10))
          {
            BOOL v7 = 0;
          }
          else
          {
            long long v23 = 0u;
            long long v24 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            v12 = PLAllCloudDeletionKeys();
            uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v22;
              while (2)
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v22 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  id v17 = *(id *)(*((void *)&v21 + 1) + 8 * i);
                  v18 = xpc_dictionary_get_value(v4, (const char *)objc_msgSend(v17, "UTF8String", (void)v21));
                  v19 = v18;
                  if (v18 && xpc_array_get_count(v18))
                  {

                    BOOL v7 = 0;
                    goto LABEL_26;
                  }
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
                if (v14) {
                  continue;
                }
                break;
              }
            }
            BOOL v7 = 1;
LABEL_26:
          }
        }
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

+ (id)_descriptionForEvent:(id)a3 withPersistentStoreCoordinator:(id)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    long long v21 = @"<empty>";
    goto LABEL_37;
  }
  v8 = (void *)MEMORY[0x19F38D3B0]();
  v9 = [MEMORY[0x1E4F1CA48] array];
  v10 = v6;
  unsigned int uint64 = xpc_dictionary_get_uint64(v6, "eventKind");
  xpc_object_t xdict = v10;
  if (uint64 != 5)
  {
    long long v22 = objc_msgSend(NSString, "stringWithFormat:", @"index: #%llu", xpc_dictionary_get_uint64(v10, "eventIndex"));
    [v9 addObject:v22];

    if (xpc_dictionary_get_uuid(v10, "eventUUID"))
    {
      memset(out, 0, 37);
      uuid = xpc_dictionary_get_uuid(v10, "eventUUID");
      uuid_unparse(uuid, out);
      long long v24 = [NSString stringWithUTF8String:out];
      uint64_t v13 = [v24 substringToIndex:8];
    }
    else
    {
      uint64_t v13 = @"assetsd";
    }
    xpc_dictionary_get_remote_connection(v10);
    v25 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = v25;
    if (v25)
    {
      uint64_t v26 = [(__CFString *)v13 stringByAppendingFormat:@" (pid %d)", xpc_connection_get_pid(v25)];

      uint64_t v13 = (__CFString *)v26;
    }
    v27 = [NSString stringWithFormat:@"origin: %@", v13];
    [v9 addObject:v27];

    switch(uint64)
    {
      case 4u:
        [v9 addObject:@"kind: GetPendingEvents"];
        id v6 = xdict;
        v20 = objc_msgSend(NSString, "stringWithFormat:", @"last index: %llu", xpc_dictionary_get_uint64(xdict, "eventLastIndex"));
        [v9 addObject:v20];
        break;
      case 3u:
        [v9 addObject:@"kind: SetConnectionUUID"];
        id v6 = xdict;
        v63 = xpc_dictionary_get_value(xdict, "eventUUID");
        v20 = v63;
        if (v63)
        {
          memset(out, 0, 37);
          bytes = xpc_uuid_get_bytes(v63);
          uuid_unparse(bytes, out);
          v65 = objc_msgSend(NSString, "stringWithFormat:", @"UUID: %s", out);
          [v9 addObject:v65];
        }
        break;
      case 1u:
        v71 = v13;
        v72 = v8;
        [v9 addObject:@"kind: ContextDidSave"];
        id v6 = xdict;
        v28 = objc_msgSend(NSString, "stringWithFormat:", @"change source: %lld", xpc_dictionary_get_int64(xdict, "changeSource"));
        [v9 addObject:v28];

        v29 = objc_msgSend(NSString, "stringWithFormat:", @"sync change marker: %d", xpc_dictionary_get_BOOL(xdict, "syncChangeMarker"));
        [v9 addObject:v29];

        v30 = xpc_dictionary_get_value(xdict, (const char *)[(id)*MEMORY[0x1E4F1BDF0] UTF8String]);
        v31 = v30;
        if (v30)
        {
          v32 = NSString;
          size_t count = xpc_array_get_count(v30);
          v34 = _descriptionOfManagedObjectIDArray(v31, 0, 0, v7);
          v35 = [v32 stringWithFormat:@"%lu inserts: {%@}", count, v34];
          [v9 addObject:v35];
        }
        v70 = v31;
        v74 = v9;
        v36 = xpc_dictionary_get_value(xdict, (const char *)[(id)*MEMORY[0x1E4F1BFA0] UTF8String]);
        v37 = v36;
        if (v36)
        {
          v38 = NSString;
          size_t v39 = xpc_array_get_count(v36);
          v40 = xpc_dictionary_get_value(xdict, "PLUpdatedAttributesKey");
          v41 = xpc_dictionary_get_value(xdict, "PLUpdatedRelationshipsKey");
          v42 = _descriptionOfManagedObjectIDArray(v37, v40, v41, v7);
          v43 = [v38 stringWithFormat:@"%lu updates: {%@}", v39, v42];
          [v74 addObject:v43];
        }
        v69 = v37;
        v44 = xpc_dictionary_get_value(xdict, (const char *)[(id)*MEMORY[0x1E4F1BDB8] UTF8String]);
        v45 = v44;
        if (v44)
        {
          v46 = NSString;
          size_t v47 = xpc_array_get_count(v44);
          v48 = _descriptionOfManagedObjectIDArray(v45, 0, 0, v7);
          v49 = [v46 stringWithFormat:@"%lu deletes: {%@}", v47, v48];
          [v74 addObject:v49];
        }
        v68 = v45;
        id v73 = v7;
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        v50 = PLAllCloudDeletionKeys();
        uint64_t v51 = [v50 countByEnumeratingWithState:&v79 objects:v87 count:16];
        if (v51)
        {
          uint64_t v52 = v51;
          uint64_t v53 = *(void *)v80;
          do
          {
            for (uint64_t i = 0; i != v52; ++i)
            {
              if (*(void *)v80 != v53) {
                objc_enumerationMutation(v50);
              }
              id v55 = *(id *)(*((void *)&v79 + 1) + 8 * i);
              v56 = xpc_dictionary_get_value(v6, (const char *)[v55 UTF8String]);
              v57 = v56;
              if (v56)
              {
                v58 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:xpc_array_get_count(v56)];
                v76[0] = MEMORY[0x1E4F143A8];
                v76[1] = 3221225472;
                v76[2] = __75__PLLegacyChangeEvent__descriptionForEvent_withPersistentStoreCoordinator___block_invoke_2;
                v76[3] = &unk_1E586E2F0;
                v76[4] = v55;
                id v77 = v6;
                id v78 = v58;
                id v59 = v58;
                xpc_array_apply(v57, v76);
                v60 = NSString;
                size_t v67 = xpc_array_get_count(v57);
                v61 = v60;
                id v6 = xdict;
                v62 = [v61 stringWithFormat:@"%lu %@: {%@}", v67, v55, v59];
                [v74 addObject:v62];
              }
            }
            uint64_t v52 = [v50 countByEnumeratingWithState:&v79 objects:v87 count:16];
          }
          while (v52);
        }

        v9 = v74;
        +[PLDelayedFiledSystemDeletions appendDescriptionForEvent:v6 toComponents:v74];

        v8 = v72;
        id v7 = v73;
        uint64_t v13 = v71;
        v20 = v70;
        break;
      default:
        v20 = objc_msgSend(NSString, "stringWithFormat:", @"kind: invalid (%lu)", uint64);
        [v9 addObject:v20];
        id v6 = xdict;
        break;
    }
    goto LABEL_35;
  }
  [v9 addObject:@"kind: PendingEvents"];
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"last index: %llu", xpc_dictionary_get_uint64(v10, "eventLastIndex"));
  [v9 addObject:v12];

  xpc_dictionary_get_value(v10, "events");
  uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __75__PLLegacyChangeEvent__descriptionForEvent_withPersistentStoreCoordinator___block_invoke;
    applier[3] = &unk_1E586DB08;
    v84 = v14;
    id v86 = a1;
    id v85 = v7;
    uint64_t v15 = v14;
    xpc_array_apply(v13, applier);
    v16 = NSString;
    size_t v17 = xpc_array_get_count(v13);
    v18 = [(_xpc_connection_s *)v15 componentsJoinedByString:@"\n"];
    v19 = [v16 stringWithFormat:@"events: %zu (\n%@\n)", v17, v18];
    [v9 addObject:v19];

    id v6 = xdict;
    v20 = v84;
LABEL_35:

    goto LABEL_36;
  }
  id v6 = v10;
LABEL_36:

  long long v21 = [v9 componentsJoinedByString:@", "];

LABEL_37:

  return v21;
}

uint64_t __75__PLLegacyChangeEvent__descriptionForEvent_withPersistentStoreCoordinator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  v4 = [*(id *)(a1 + 48) _descriptionForEvent:a3 withPersistentStoreCoordinator:*(void *)(a1 + 40)];
  [v3 addObject:v4];

  return 1;
}

uint64_t __75__PLLegacyChangeEvent__descriptionForEvent_withPersistentStoreCoordinator___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  string_ptr = xpc_string_get_string_ptr(v5);
  if (string_ptr)
  {
    id v7 = [NSString stringWithUTF8String:string_ptr];
    if (v7) {
      [*(id *)(a1 + 48) addObject:v7];
    }
  }
  else
  {
    v8 = PLChangeHandlingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      int v12 = 138413058;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v5;
      __int16 v16 = 2048;
      uint64_t v17 = a2;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "xpc_string_get_string_ptr returns nil while processing %@ for value = %@, index = %zu, event = %@", (uint8_t *)&v12, 0x2Au);
    }
  }
  return 1;
}

+ (id)_descriptionForEvent:(id)a3
{
  id v4 = a3;
  id v5 = +[PLPhotoLibraryBundleController sharedBundleController];
  id v6 = [MEMORY[0x1E4F8B980] systemLibraryURL];
  id v7 = [v5 bundleForLibraryURL:v6];

  v8 = [v7 persistentContainer];
  uint64_t v9 = [v8 sharedPersistentStoreCoordinator];

  uint64_t v10 = [a1 _descriptionForEvent:v4 withPersistentStoreCoordinator:v9];

  return v10;
}

+ (id)localChangeEventFromChangeHubEvent:(id)a3 withLibraryBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__PLLegacyChangeEvent_localChangeEventFromChangeHubEvent_withLibraryBundle___block_invoke;
  v11[3] = &unk_1E586DAD0;
  id v12 = v6;
  id v13 = v5;
  id v7 = v5;
  id v8 = v6;
  uint64_t v9 = +[PLLocalChangeEventBuilder localEventWithBuilderBlock:v11];

  return v9;
}

void __76__PLLegacyChangeEvent_localChangeEventFromChangeHubEvent_withLibraryBundle___block_invoke(uint64_t a1, void *a2)
{
  v41[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v26 = [v4 sharedPersistentStoreCoordinator];

  v25 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "PLUpdatedAttributesKey");
  long long v24 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "PLUpdatedRelationshipsKey");
  uint64_t v5 = *MEMORY[0x1E4F1BFA0];
  v41[0] = *MEMORY[0x1E4F1BDF0];
  v41[1] = v5;
  v41[2] = *MEMORY[0x1E4F1BDB8];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:3];
  id v7 = PLAllCloudDeletionKeys();
  id v8 = [v6 arrayByAddingObjectsFromArray:v7];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        __int16 v14 = *(void **)(a1 + 40);
        id v15 = *(id *)(*((void *)&v36 + 1) + 8 * i);
        __int16 v16 = xpc_dictionary_get_value(v14, (const char *)[v15 UTF8String]);
        if (v16)
        {
          uint64_t v17 = PLAllCloudDeletionKeys();
          int v18 = [v17 containsObject:v15];

          if (v18)
          {
            uint64_t v19 = [v3 recordDeletedCloudGUIDBlockForChangeKey:v15];
            applier[0] = MEMORY[0x1E4F143A8];
            applier[1] = 3221225472;
            applier[2] = __76__PLLegacyChangeEvent_localChangeEventFromChangeHubEvent_withLibraryBundle___block_invoke_2;
            applier[3] = &unk_1E586DA70;
            void applier[4] = v15;
            v35 = v19;
            id v20 = v19;
            xpc_array_apply(v16, applier);
            long long v21 = v35;
          }
          else
          {
            long long v22 = [v3 recordChangedObjectIDBlockForChangeKey:v15];
            v27[0] = MEMORY[0x1E4F143A8];
            v27[1] = 3221225472;
            v27[2] = __76__PLLegacyChangeEvent_localChangeEventFromChangeHubEvent_withLibraryBundle___block_invoke_28;
            v27[3] = &unk_1E586DA98;
            id v23 = v26;
            id v33 = v22;
            id v28 = v23;
            id v29 = v15;
            id v30 = v25;
            id v31 = v24;
            id v32 = v3;
            id v20 = v22;
            xpc_array_apply(v16, v27);

            long long v21 = v28;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v11);
  }

  objc_msgSend(v3, "setCoalescedEvent:", xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 40), "coalescedEvent"));
  objc_msgSend(v3, "setSyncChange:", xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 40), "syncChangeMarker"));
}

uint64_t __76__PLLegacyChangeEvent_localChangeEventFromChangeHubEvent_withLibraryBundle___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  string_ptr = xpc_string_get_string_ptr(v4);
  if (string_ptr)
  {
    id v6 = [NSString stringWithUTF8String:string_ptr];
    if (v6) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    id v6 = PLChangeHandlingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "xpc_string_get_string_ptr returns nil for value, changeKey = %@, value = %@", (uint8_t *)&v9, 0x16u);
    }
  }

  return 1;
}

uint64_t __76__PLLegacyChangeEvent_localChangeEventFromChangeHubEvent_withLibraryBundle___block_invoke_28(uint64_t a1, size_t a2)
{
  id v4 = PLManagedObjectIDFromXPCValue();
  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    if ([*(id *)(a1 + 40) isEqualToString:*MEMORY[0x1E4F1BFA0]])
    {
      uint64_t v5 = *(void **)(a1 + 48);
      if (v5)
      {
        if (*(void *)(a1 + 56))
        {
          id v6 = *(void **)(a1 + 64);
          uint64_t uint64 = xpc_array_get_uint64(v5, a2);
          objc_msgSend(v6, "recordUpdatedAttributes:andRelationships:forObjectID:", uint64, xpc_array_get_uint64(*(xpc_object_t *)(a1 + 56), a2), v4);
        }
      }
    }
  }

  return 1;
}

@end