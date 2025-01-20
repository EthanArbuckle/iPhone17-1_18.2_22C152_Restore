@interface NoteAttachmentObject
+ (BOOL)applyFileAttributesForAttachment:(id)a3 error:(id *)a4;
+ (BOOL)migrateAttachmentRelatedFilesInContext:(id)a3 error:(id *)a4;
+ (BOOL)migrateFileForAttachment:(id)a3 toCurrentAttachmentPathWithError:(id *)a4;
+ (id)attachmentDirectoryPathForAttachmentObjectID:(id)a3 error:(id *)a4;
+ (id)attachmentDirectoryURLForAttachmentObjectID:(id)a3 error:(id *)a4;
- (BOOL)persistAttachmentData:(id)a3 error:(id *)a4;
- (id)attachmentDataFileURLWithError:(id *)a3;
- (id)attachmentDataWithError:(id *)a3;
- (void)prepareForDeletion;
@end

@implementation NoteAttachmentObject

+ (id)attachmentDirectoryURLForAttachmentObjectID:(id)a3 error:(id *)a4
{
  v4 = [a1 attachmentDirectoryPathForAttachmentObjectID:a3 error:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)attachmentDirectoryPathForAttachmentObjectID:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = NoteContextRootDirectoryPath();
  v6 = [v5 stringByAppendingPathComponent:@"attachments"];

  v7 = [v4 URIRepresentation];

  v8 = [v7 absoluteString];

  v9 = (__CFString *)CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v8, 0, @"/", 0x8000100u);
  v10 = [v6 stringByAppendingPathComponent:v9];

  return v10;
}

- (BOOL)persistAttachmentData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  v8 = NoteAttachmentObjectDataBasePath(self, (uint64_t)a4);
  if (v8
    && (([v7 fileExistsAtPath:v8] & 1) != 0
     || [v7 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:a4]))
  {
    v9 = NoteAttachmentObjectDataPath(self, (uint64_t)a4);
    if (v9
      && (![v7 fileExistsAtPath:v9]
       || [v7 removeItemAtPath:v9 error:a4]))
    {
      v10 = +[NoteContext fileProtectionOption];
      uint64_t v11 = DataWritingOptionForFileProtectionOption(v10);
      id v12 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      id v13 = v6;
      v14 = objc_msgSend(v12, "initWithBytes:length:", objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
      char v15 = [v14 writeToFile:v9 options:v11 error:a4];
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (id)attachmentDataFileURLWithError:(id *)a3
{
  v3 = NoteAttachmentObjectDataPath(self, (uint64_t)a3);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)attachmentDataWithError:(id *)a3
{
  id v4 = -[NoteAttachmentObject attachmentDataFileURLWithError:](self, "attachmentDataFileURLWithError:");
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4 options:0 error:a3];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)prepareForDeletion
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v16 = 0;
  id v4 = NoteAttachmentObjectDataPath(self, (uint64_t)&v16);
  id v5 = v16;
  id v15 = v5;
  id v6 = NoteAttachmentObjectDataBasePath(self, (uint64_t)&v15);
  id v7 = v15;

  if (v4)
  {
    id v14 = v7;
    char v8 = [v3 removeItemAtPath:v4 error:&v14];
    id v9 = v14;

    id v7 = v9;
    if (v8)
    {
      if (v6) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = v7;
  }
  NSLog(&cfstr_CanTRemoveAtta.isa, v4, v7);
  if (v6)
  {
LABEL_4:
    id v13 = v9;
    char v10 = [v3 removeItemAtPath:v6 error:&v13];
    id v11 = v13;

    id v9 = v11;
    if (v10) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_8:
  id v11 = v9;
LABEL_9:
  NSLog(&cfstr_CanTRemoveAtta_0.isa, v6, v9);
LABEL_10:
  v12.receiver = self;
  v12.super_class = (Class)NoteAttachmentObject;
  [(NoteAttachmentObject *)&v12 prepareForDeletion];
}

+ (BOOL)migrateAttachmentRelatedFilesInContext:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"NoteAttachment"];
  char v8 = [v6 executeFetchRequest:v7 error:a4];
  id v9 = v8;
  if (v8)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if (!objc_msgSend(a1, "migrateFileForAttachment:toCurrentAttachmentPathWithError:", v15, a4, (void)v18)|| !objc_msgSend(a1, "applyFileAttributesForAttachment:error:", v15, a4))
          {
            BOOL v16 = 0;
            goto LABEL_15;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        BOOL v16 = 1;
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v16 = 1;
    }
LABEL_15:
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

+ (BOOL)migrateFileForAttachment:(id)a3 toCurrentAttachmentPathWithError:(id *)a4
{
  id v5 = a3;
  id v6 = NoteAttachmentObjectDataPathBetween12A173And12A189(v5, (uint64_t)a4);
  if (v6)
  {
    char v17 = 0;
    id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    if ([v7 fileExistsAtPath:v6 isDirectory:&v17]) {
      BOOL v8 = v17 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (!v8)
    {
LABEL_6:
      LOBYTE(v9) = 1;
LABEL_17:

      goto LABEL_18;
    }
    id v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v10 UUIDString];

    uint64_t v12 = [v6 stringByDeletingLastPathComponent];
    uint64_t v13 = [v12 stringByAppendingPathComponent:v11];

    if ([v7 moveItemAtPath:v6 toPath:v13 error:a4])
    {
      id v14 = NoteAttachmentObjectDataBasePath(v5, (uint64_t)a4);
      if (v14
        && [v7 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:a4])
      {
        uint64_t v15 = NoteAttachmentObjectDataPath(v5, (uint64_t)a4);

        if (v15)
        {
          int v9 = [v7 moveItemAtPath:v13 toPath:v15 error:a4];

          if (!v9) {
            goto LABEL_17;
          }
          goto LABEL_6;
        }
        id v14 = 0;
      }
    }
    LOBYTE(v9) = 0;
    goto LABEL_17;
  }
  LOBYTE(v9) = 0;
LABEL_18:

  return v9;
}

+ (BOOL)applyFileAttributesForAttachment:(id)a3 error:(id *)a4
{
  id v21 = 0;
  id v5 = NoteAttachmentObjectDataPath(a3, (uint64_t)&v21);
  id v6 = v21;
  if (!v5)
  {
    BOOL v13 = 0;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:0];
  id v20 = 0;
  uint64_t v8 = *MEMORY[0x1E4F1C590];
  id v19 = 0;
  int v9 = [v7 getResourceValue:&v20 forKey:v8 error:&v19];
  id v10 = v20;
  id v11 = v19;

  if (v9)
  {
    uint64_t v12 = +[NoteContext fileURLProtectionOption];
    if (v12 && ([v10 isEqualToString:v12] & 1) == 0)
    {
      id v18 = v11;
      char v14 = [v7 setResourceValue:v12 forKey:v8 error:&v18];
      id v15 = v18;

      if (v14)
      {
        BOOL v13 = 1;
      }
      else
      {
        BOOL v16 = [v7 path];
        NSLog(&cfstr_CanTSetDataPro.isa, v16, v15);

        BOOL v13 = 0;
      }
      id v11 = v15;
    }
    else
    {
      BOOL v13 = 1;
    }
  }
  else
  {
    uint64_t v12 = [v7 path];
    NSLog(&cfstr_CanTGetDataPro.isa, v12, v11);
    BOOL v13 = 0;
  }

  id v6 = v11;
  if (a4) {
LABEL_14:
  }
    *a4 = v6;
LABEL_15:

  return v13;
}

@end