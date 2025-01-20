@interface ExternalSequenceNumberToAttachmentNoteBodyToAttachmentMigrationPolicy
- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6;
- (BOOL)createRelationshipsForDestinationInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6;
- (BOOL)endEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5;
- (id)unarchiveObjectWithExternalRepresentation:(id)a3;
@end

@implementation ExternalSequenceNumberToAttachmentNoteBodyToAttachmentMigrationPolicy

- (id)unarchiveObjectWithExternalRepresentation:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1D25DE560]();
  id v22 = 0;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v22];
  id v6 = v22;
  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ExternalSequenceNumberToAttachmentNoteBodyToAttachmentMigrationPolicy unarchiveObjectWithExternalRepresentation:]((uint64_t)v6, v7);
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = [MEMORY[0x1E4F73500] supportedArchivedClassNames];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        [v5 setClass:objc_opt_class() forClassName:*(void *)(*((void *)&v18 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v10);
  }

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v16 = [v5 decodeObjectOfClasses:v15 forKey:*MEMORY[0x1E4F284E8]];

  [v5 finishDecoding];

  return v16;
}

- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v42 = a4;
  id v43 = a5;
  v44 = v9;
  uint64_t v38 = [v9 valueForKey:@"externalRepresentation"];
  if (v38)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v11 = [(ExternalSequenceNumberToAttachmentNoteBodyToAttachmentMigrationPolicy *)self unarchiveObjectWithExternalRepresentation:v38];
    if ([v11 conformsToProtocol:&unk_1F267A580]
      && [v11 conformsToProtocol:&unk_1F26830D8])
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v50 != v14) {
              objc_enumerationMutation(v12);
            }
            v16 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = [v16 contentID];
              BOOL v18 = [v17 length] == 0;

              if (!v18) {
                [v10 addObject:v16];
              }
            }
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v49 objects:v54 count:16];
        }
        while (v13);
      }
    }
    if ([v10 count])
    {
      long long v19 = [v43 destinationContext];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id obj = v10;
      uint64_t v20 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v20)
      {
        long long v21 = &selRef_setIc_searchResultType_;
        uint64_t v22 = *(void *)v46;
        while (2)
        {
          uint64_t v23 = 0;
          uint64_t v24 = v21[252];
          do
          {
            if (*(void *)v46 != v22) {
              objc_enumerationMutation(obj);
            }
            v25 = *(void **)(*((void *)&v45 + 1) + 8 * v23);
            v26 = objc_msgSend(MEMORY[0x1E4F1C0A8], "insertNewObjectForEntityForName:inManagedObjectContext:", @"NoteAttachment", v19, v38);
            v27 = [v25 contentID];
            [v26 setValue:v27 forKey:@"contentID"];

            v28 = [v25 preferredFilename];
            if (v28)
            {
              [v26 setValue:v28 forKey:@"filename"];
            }
            else
            {
              v29 = [v25 filename];
              [v26 setValue:v29 forKey:@"filename"];
            }
            v30 = [v25 mimeType];
            [v26 setValue:v30 forKey:@"mimeType"];

            v31 = [v25 regularFileContents];
            v32 = (objc_class *)objc_opt_class();
            IMP MethodImplementation = class_getMethodImplementation(v32, v24);
            if ((((uint64_t (*)(void *, const char *, void *, id *))MethodImplementation)(v26, v24, v31, a6) & 1) == 0)
            {

              int v34 = 0;
              goto LABEL_30;
            }
            [v43 associateSourceInstance:v44 withDestinationInstance:v26 forEntityMapping:v42];

            ++v23;
          }
          while (v20 != v23);
          uint64_t v20 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
          long long v21 = &selRef_setIc_searchResultType_;
          if (v20) {
            continue;
          }
          break;
        }
      }
      int v34 = 1;
LABEL_30:
    }
    else
    {
      int v34 = 1;
    }

    BOOL v35 = v34 != 0;
  }
  else
  {
    BOOL v35 = 1;
  }
  v36 = objc_msgSend(v44, "managedObjectContext", v38);
  [v36 refreshObject:v44 mergeChanges:0];

  return v35;
}

- (BOOL)createRelationshipsForDestinationInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [a4 name];
  v29[0] = v9;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  uint64_t v13 = [v10 sourceInstancesForEntityMappingNamed:v11 destinationInstances:v12];
  uint64_t v14 = [v13 lastObject];

  v15 = [v14 valueForKey:@"owner"];
  v28 = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v17 = [v10 destinationInstancesForEntityMappingNamed:@"NoteToNote" sourceInstances:v16];

  BOOL v18 = [v17 lastObject];

  if (v18)
  {
    [v9 setValue:v18 forKey:@"note"];
  }
  else if (a6)
  {
    long long v19 = NSString;
    uint64_t v20 = [v9 valueForKey:@"contentID"];
    long long v21 = [v19 stringWithFormat:@"Can't find destination note for attachment with CID: %@", v20];

    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F836C8];
    uint64_t v26 = *MEMORY[0x1E4F836D0];
    v27 = v21;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    *a6 = [v22 errorWithDomain:v23 code:100 userInfo:v24];
  }
  return v18 != 0;
}

- (BOOL)endEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v55.receiver = self;
  v55.super_class = (Class)ExternalSequenceNumberToAttachmentNoteBodyToAttachmentMigrationPolicy;
  id v30 = a3;
  id v31 = a4;
  v29 = a5;
  if (-[NSEntityMigrationPolicy endEntityMapping:manager:error:](&v55, sel_endEntityMapping_manager_error_, v30))
  {
    uint64_t v49 = 0;
    long long v50 = &v49;
    uint64_t v51 = 0x3032000000;
    long long v52 = __Block_byref_object_copy_;
    v53 = __Block_byref_object_dispose_;
    id v54 = 0;
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __104__ExternalSequenceNumberToAttachmentNoteBodyToAttachmentMigrationPolicy_endEntityMapping_manager_error___block_invoke;
    v48[3] = &unk_1E686E0A0;
    v48[4] = &v49;
    uint64_t v26 = (void *)MEMORY[0x1D25DE760](v48);
    v28 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"NoteAttachment"];
    v7 = [v31 destinationContext];
    v27 = [v7 executeFetchRequest:v28 error:a5];

    if (!v27) {
      goto LABEL_34;
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v27;
    uint64_t v8 = [obj countByEnumeratingWithState:&v44 objects:v57 count:16];
    if (v8)
    {
      uint64_t v34 = *(void *)v45;
      do
      {
        uint64_t v9 = 0;
        uint64_t v35 = v8;
        do
        {
          if (*(void *)v45 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v38 = v9;
          id v10 = *(void **)(*((void *)&v44 + 1) + 8 * v9);
          context = (void *)MEMORY[0x1D25DE560]();
          uint64_t v11 = [v10 valueForKeyPath:@"note.body.externalRepresentation"];
          v36 = (void *)v11;
          if (v11)
          {
            id v12 = [(ExternalSequenceNumberToAttachmentNoteBodyToAttachmentMigrationPolicy *)self unarchiveObjectWithExternalRepresentation:v11];
            id v39 = (void *)[v12 mutableCopy];
            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            id v13 = v12;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v56 count:16];
            if (v14)
            {
              char v15 = 0;
              uint64_t v16 = *(void *)v41;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v41 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  BOOL v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    long long v19 = [v18 contentID];
                    uint64_t v20 = [v10 valueForKey:@"contentID"];
                    int v21 = [v19 isEqual:v20];

                    if (v21)
                    {
                      [v39 removeObject:v18];
                      char v15 = 1;
                    }
                  }
                }
                uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v56 count:16];
              }
              while (v14);

              if (v15)
              {
                if ([v39 count])
                {
                  uint64_t v22 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v39 requiringSecureCoding:1 error:0];
                }
                else
                {
                  uint64_t v22 = 0;
                }
                [v10 setValue:v22 forKeyPath:@"note.body.externalRepresentation"];
              }
            }
            else
            {
            }
          }

          uint64_t v9 = v38 + 1;
        }
        while (v38 + 1 != v35);
        uint64_t v8 = [obj countByEnumeratingWithState:&v44 objects:v57 count:16];
      }
      while (v8);
    }

    uint64_t v23 = (void *)v50[5];
    if (!v23)
    {
      BOOL v24 = 1;
      goto LABEL_36;
    }
    if (v29)
    {
      BOOL v24 = 0;
      id *v29 = v23;
    }
    else
    {
LABEL_34:
      BOOL v24 = 0;
    }
LABEL_36:

    _Block_object_dispose(&v49, 8);
    goto LABEL_37;
  }
  BOOL v24 = 0;
LABEL_37:

  return v24;
}

void __104__ExternalSequenceNumberToAttachmentNoteBodyToAttachmentMigrationPolicy_endEntityMapping_manager_error___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F836C8];
  uint64_t v11 = *MEMORY[0x1E4F836D0];
  v12[0] = a2;
  v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a2;
  v7 = [v5 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v8 = [v3 errorWithDomain:v4 code:100 userInfo:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)unarchiveObjectWithExternalRepresentation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1CFDA4000, a2, OS_LOG_TYPE_ERROR, "Error creating unarchiver: %@", (uint8_t *)&v2, 0xCu);
}

@end