@interface PLLegacyChangeEventBuilder
+ (id)createXPCDictionaryFromChangedObjectIDs:(id)a3 redundantDeletes:(id)a4 uuidsForCloudDeletion:(id)a5 updatedAttributesByObjectID:(id)a6 updatedRelationshipsByObjectID:(id)a7 updatedOrderKeys:(id)a8 changeSource:(int)a9 syncChangeMarker:(BOOL)a10;
@end

@implementation PLLegacyChangeEventBuilder

+ (id)createXPCDictionaryFromChangedObjectIDs:(id)a3 redundantDeletes:(id)a4 uuidsForCloudDeletion:(id)a5 updatedAttributesByObjectID:(id)a6 updatedRelationshipsByObjectID:(id)a7 updatedOrderKeys:(id)a8 changeSource:(int)a9 syncChangeMarker:(BOOL)a10
{
  v125[3] = *MEMORY[0x1E4F143B8];
  id v68 = a3;
  id v82 = a4;
  id v72 = a5;
  id v79 = a6;
  id v78 = a7;
  id v67 = a8;
  uint64_t v112 = 0;
  v113 = &v112;
  uint64_t v114 = 0x3032000000;
  v115 = __Block_byref_object_copy__18529;
  v116 = __Block_byref_object_dispose__18530;
  id v117 = 0;
  v110[0] = MEMORY[0x1E4F143A8];
  v110[1] = 3221225472;
  v110[2] = __215__PLLegacyChangeEventBuilder_createXPCDictionaryFromChangedObjectIDs_redundantDeletes_uuidsForCloudDeletion_updatedAttributesByObjectID_updatedRelationshipsByObjectID_updatedOrderKeys_changeSource_syncChangeMarker___block_invoke;
  v110[3] = &unk_1E586C768;
  v110[4] = &v112;
  int v111 = a9;
  v70 = (void (**)(void))MEMORY[0x19F38D650](v110);
  uint64_t v15 = *MEMORY[0x1E4F1BFA0];
  v125[0] = *MEMORY[0x1E4F1BDF0];
  v125[1] = v15;
  uint64_t v65 = v15;
  uint64_t v66 = *MEMORY[0x1E4F1BDB8];
  v125[2] = *MEMORY[0x1E4F1BDB8];
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v125 count:3];
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  obuint64_t j = [v72 allKeys];
  id v76 = (id)v16;
  xpc_object_t xarray = (xpc_object_t)[obj countByEnumeratingWithState:&v106 objects:v124 count:16];
  if (xarray)
  {
    uint64_t v17 = *(void *)v107;
    uint64_t v18 = (uint64_t)xarray;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v107 != v17) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v106 + 1) + 8 * i);
        v21 = [v72 objectForKey:v20];
        if (v21)
        {
          v70[2]();
          xpc_object_t v22 = xpc_array_create(0, 0);
          xpc_dictionary_set_value((xpc_object_t)v113[5], (const char *)[v20 UTF8String], v22);
          long long v104 = 0u;
          long long v105 = 0u;
          long long v102 = 0u;
          long long v103 = 0u;
          id v23 = v21;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v102 objects:v123 count:16];
          if (v24)
          {
            uint64_t v25 = *(void *)v103;
            do
            {
              for (uint64_t j = 0; j != v24; ++j)
              {
                if (*(void *)v103 != v25) {
                  objc_enumerationMutation(v23);
                }
                xpc_array_set_string(v22, 0xFFFFFFFFFFFFFFFFLL, (const char *)[*(id *)(*((void *)&v102 + 1) + 8 * j) UTF8String]);
              }
              uint64_t v24 = [v23 countByEnumeratingWithState:&v102 objects:v123 count:16];
            }
            while (v24);
          }
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v106 objects:v124 count:16];
    }
    while (v18);
  }

  if (xarray != 0 || a10)
  {
    v70[2]();
    xpc_dictionary_set_BOOL((xpc_object_t)v113[5], "syncChangeMarker", 1);
  }
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v63 = v76;
  uint64_t v69 = [v63 countByEnumeratingWithState:&v98 objects:v122 count:16];
  if (v69)
  {
    uint64_t v64 = *(void *)v99;
    do
    {
      for (uint64_t k = 0; k != v69; ++k)
      {
        if (*(void *)v99 != v64) {
          objc_enumerationMutation(v63);
        }
        id v73 = *(id *)(*((void *)&v98 + 1) + 8 * k);
        objc_msgSend(v68, "objectForKeyedSubscript:");
        id v77 = (id)objc_claimAutoreleasedReturnValue();
        if ([v73 isEqualToString:v66] && objc_msgSend(v82, "count"))
        {
          long long v96 = 0u;
          long long v97 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          id v77 = v77;
          uint64_t v27 = [v77 countByEnumeratingWithState:&v94 objects:v121 count:16];
          if (!v27)
          {
            id v32 = v77;
            goto LABEL_40;
          }
          v28 = 0;
          uint64_t v29 = *(void *)v95;
          do
          {
            for (uint64_t m = 0; m != v27; ++m)
            {
              if (*(void *)v95 != v29) {
                objc_enumerationMutation(v77);
              }
              uint64_t v31 = *(void *)(*((void *)&v94 + 1) + 8 * m);
              if ([v82 containsObject:v31])
              {
                if (!v28) {
                  v28 = (void *)[v77 mutableCopy];
                }
                [v28 removeObject:v31];
              }
            }
            uint64_t v27 = [v77 countByEnumeratingWithState:&v94 objects:v121 count:16];
          }
          while (v27);

          if (v28)
          {
            id v32 = v28;

LABEL_40:
            id v77 = v32;
          }
        }
        int v33 = [v73 isEqualToString:v65];
        if (v33) {
          BOOL v34 = [v67 count] != 0;
        }
        else {
          BOOL v34 = 0;
        }
        v35 = v77;
        if (v77) {
          BOOL v36 = 0;
        }
        else {
          BOOL v36 = !v34;
        }
        if (!v36)
        {
          xpc_object_t xarraya = xpc_array_create(0, 0);
          if (v33)
          {
            xpc_object_t value = xpc_array_create(0, 0);
            xpc_object_t v74 = xpc_array_create(0, 0);
          }
          else
          {
            xpc_object_t v74 = 0;
            xpc_object_t value = 0;
          }
          id obja = (id)[v67 mutableCopy];
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          id v37 = v77;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v90 objects:v120 count:16];
          if (v38)
          {
            uint64_t v39 = *(void *)v91;
            do
            {
              for (uint64_t n = 0; n != v38; ++n)
              {
                if (*(void *)v91 != v39) {
                  objc_enumerationMutation(v37);
                }
                v41 = *(void **)(*((void *)&v90 + 1) + 8 * n);
                if (!v33)
                {
                  uint64_t v43 = 0;
                  uint64_t v45 = 0;
                  if (!v41) {
                    continue;
                  }
LABEL_62:
                  if (v43) {
                    char v47 = 1;
                  }
                  else {
                    char v47 = v33 ^ 1;
                  }
                  if ((v47 & 1) != 0 || v45)
                  {
                    CFURLRef v48 = [v41 URIRepresentation];
                    int64_t v49 = CFURLGetBytes(v48, buffer, 160);
                    if (v49 < 1)
                    {
                      v50 = PLChangeHandlingGetLog();
                      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_19B3C7000, v50, OS_LOG_TYPE_ERROR, "Unable to get data from object URI.", buf, 2u);
                      }
                    }
                    else
                    {
                      xpc_array_set_data(xarraya, 0xFFFFFFFFFFFFFFFFLL, buffer, v49);
                      if (v33)
                      {
                        xpc_array_set_uint64(value, 0xFFFFFFFFFFFFFFFFLL, v43);
                        xpc_array_set_uint64(v74, 0xFFFFFFFFFFFFFFFFLL, v45);
                      }
                    }
                  }
                  continue;
                }
                v42 = [v79 objectForKey:*(void *)(*((void *)&v90 + 1) + 8 * n)];
                uint64_t v43 = [v42 unsignedLongLongValue];

                v44 = [v78 objectForKey:v41];
                uint64_t v45 = [v44 unsignedLongLongValue];

                v46 = [obja objectForKey:v41];
                if (v46)
                {
                  [obja removeObjectForKey:v41];
                  v45 |= [v46 unsignedLongLongValue];
                }

                if (v41) {
                  goto LABEL_62;
                }
              }
              uint64_t v38 = [v37 countByEnumeratingWithState:&v90 objects:v120 count:16];
            }
            while (v38);
          }

          if (v33)
          {
            long long v87 = 0u;
            long long v88 = 0u;
            long long v85 = 0u;
            long long v86 = 0u;
            id v51 = obja;
            uint64_t v52 = [v51 countByEnumeratingWithState:&v85 objects:v118 count:16];
            if (v52)
            {
              uint64_t v53 = *(void *)v86;
              do
              {
                for (iuint64_t i = 0; ii != v52; ++ii)
                {
                  if (*(void *)v86 != v53) {
                    objc_enumerationMutation(v51);
                  }
                  v55 = *(void **)(*((void *)&v85 + 1) + 8 * ii);
                  v56 = [v51 objectForKey:v55];
                  uint64_t v57 = [v56 unsignedLongLongValue];

                  CFURLRef v58 = [v55 URIRepresentation];
                  int64_t v59 = CFURLGetBytes(v58, buffer, 160);
                  if (v59 < 1)
                  {
                    v60 = PLChangeHandlingGetLog();
                    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_19B3C7000, v60, OS_LOG_TYPE_ERROR, "Unable to get data from object URI.", buf, 2u);
                    }
                  }
                  else
                  {
                    xpc_array_set_data(xarraya, 0xFFFFFFFFFFFFFFFFLL, buffer, v59);
                    xpc_array_set_uint64(value, 0xFFFFFFFFFFFFFFFFLL, 0);
                    xpc_array_set_uint64(v74, 0xFFFFFFFFFFFFFFFFLL, v57);
                  }
                }
                uint64_t v52 = [v51 countByEnumeratingWithState:&v85 objects:v118 count:16];
              }
              while (v52);
            }

            if (xpc_array_get_count(value))
            {
              v70[2]();
              xpc_dictionary_set_value((xpc_object_t)v113[5], "PLUpdatedAttributesKey", value);
            }
            if (xpc_array_get_count(v74))
            {
              v70[2]();
              xpc_dictionary_set_value((xpc_object_t)v113[5], "PLUpdatedRelationshipsKey", v74);
            }
          }
          if (xpc_array_get_count(xarraya))
          {
            v70[2]();
            xpc_dictionary_set_value((xpc_object_t)v113[5], (const char *)[v73 UTF8String], xarraya);
          }

          v35 = v77;
        }
      }
      uint64_t v69 = [v63 countByEnumeratingWithState:&v98 objects:v122 count:16];
    }
    while (v69);
  }

  id v61 = (id)v113[5];
  _Block_object_dispose(&v112, 8);

  return v61;
}

void __215__PLLegacyChangeEventBuilder_createXPCDictionaryFromChangedObjectIDs_redundantDeletes_uuidsForCloudDeletion_updatedAttributesByObjectID_updatedRelationshipsByObjectID_updatedOrderKeys_changeSource_syncChangeMarker___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    xpc_dictionary_set_uint64(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "eventKind", 1uLL);
    v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int64_t v6 = *(int *)(a1 + 40);
    xpc_dictionary_set_int64(v5, "changeSource", v6);
  }
}

@end