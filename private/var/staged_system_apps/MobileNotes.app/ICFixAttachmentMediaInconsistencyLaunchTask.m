@interface ICFixAttachmentMediaInconsistencyLaunchTask
- (ICFixAttachmentMediaInconsistencyLaunchTask)init;
- (NSSet)recordIDsMarkedForDeletion;
- (NSSet)recordIDsProcessed;
- (NSSet)recordIDsUnmarkedForDeletion;
- (void)enumerateObjectsThatShouldBeConsistentForAttachment:(id)a3 withBlock:(id)a4;
- (void)resolveByConsultingNoteBodyForAttachment:(id)a3 context:(id)a4;
- (void)resolveInconsistencies:(id)a3 context:(id)a4;
- (void)resolveViaDeletionWithAttachment:(id)a3 context:(id)a4;
- (void)resolveViaResurrectionWithAttachment:(id)a3 context:(id)a4;
- (void)runLaunchTask;
- (void)setRecordIDsMarkedForDeletion:(id)a3;
- (void)setRecordIDsProcessed:(id)a3;
- (void)setRecordIDsUnmarkedForDeletion:(id)a3;
@end

@implementation ICFixAttachmentMediaInconsistencyLaunchTask

- (ICFixAttachmentMediaInconsistencyLaunchTask)init
{
  v10.receiver = self;
  v10.super_class = (Class)ICFixAttachmentMediaInconsistencyLaunchTask;
  v2 = [(ICFixAttachmentMediaInconsistencyLaunchTask *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    recordIDsProcessed = v2->_recordIDsProcessed;
    v2->_recordIDsProcessed = (NSSet *)v3;

    uint64_t v5 = objc_opt_new();
    recordIDsMarkedForDeletion = v2->_recordIDsMarkedForDeletion;
    v2->_recordIDsMarkedForDeletion = (NSSet *)v5;

    uint64_t v7 = objc_opt_new();
    recordIDsUnmarkedForDeletion = v2->_recordIDsUnmarkedForDeletion;
    v2->_recordIDsUnmarkedForDeletion = (NSSet *)v7;
  }
  return v2;
}

- (void)runLaunchTask
{
  [(ICWorkerContextLaunchTask *)self workerContext];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F4D3C;
  v4[3] = &unk_100625860;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = self;
  id v3 = v5;
  [v3 performBlockAndWait:v4];
}

- (void)resolveInconsistencies:(id)a3 context:(id)a4
{
  id v6 = a3;
  v34 = self;
  id v35 = a4;
  uint64_t v7 = [(ICFixAttachmentMediaInconsistencyLaunchTask *)self recordIDsProcessed];
  id v8 = [v7 mutableCopy];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = +[NSMutableSet set];
  }
  v11 = v10;

  v12 = ICKeyPathFromSelector();
  v13 = [v6 valueForKey:v12];
  [v11 addObjectsFromArray:v13];

  id v14 = [v11 copy];
  [(ICFixAttachmentMediaInconsistencyLaunchTask *)self setRecordIDsProcessed:v14];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v15 = v6;
  id v16 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v37;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        objc_opt_class();
        v21 = ICDynamicCast();
        if (([v20 isUnsupported] & 1) == 0
          && ([v20 needsInitialFetchFromCloudCheckingParent] & 1) == 0)
        {
          v22 = [v21 media];
          unsigned __int8 v23 = [v22 needsInitialFetchFromCloud];

          if ((v23 & 1) == 0)
          {
            if (!v21) {
              goto LABEL_16;
            }
            if ([v21 attachmentType])
            {
              uint64_t v24 = [v21 parentAttachment];
              if (!v24
                || (v25 = (void *)v24,
                    [v21 parentAttachment],
                    v26 = objc_claimAutoreleasedReturnValue(),
                    unsigned int v27 = [v26 attachmentType],
                    v26,
                    v25,
                    v27))
              {
LABEL_16:
                v28 = [v20 note];
                unsigned int v29 = [v28 markedForDeletion];

                if (v29)
                {
                  v30 = os_log_create("com.apple.notes", "LaunchTask");
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                  {
                    v33 = [v20 note];
                    v31 = [v33 ic_loggingIdentifier];
                    v32 = [v20 ic_loggingIdentifier];
                    *(_DWORD *)buf = 138412546;
                    v41 = v31;
                    __int16 v42 = 2112;
                    v43 = v32;
                    _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Note (%@) containing attachment (%@) is marked for deletion", buf, 0x16u);
                  }
                  [(ICFixAttachmentMediaInconsistencyLaunchTask *)v34 resolveViaDeletionWithAttachment:v20 context:v35];
                }
                else
                {
                  [(ICFixAttachmentMediaInconsistencyLaunchTask *)v34 resolveByConsultingNoteBodyForAttachment:v20 context:v35];
                }
              }
            }
          }
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v17);
  }

  [v35 ic_save];
}

- (void)resolveByConsultingNoteBodyForAttachment:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 note];
  v9 = [v8 document];
  if (v9 && ([v8 isPasswordProtectedAndLocked] & 1) == 0)
  {
    unsigned __int8 v10 = [v8 mergeUnappliedEncryptedRecord];

    if (v10)
    {
      uint64_t v25 = 0;
      v26 = &v25;
      uint64_t v27 = 0x2020000000;
      char v28 = 0;
      [v6 rootParentAttachment];
      v19 = _NSConcreteStackBlock;
      uint64_t v20 = 3221225472;
      v21 = sub_1000F55AC;
      v22 = &unk_100629C98;
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      id v23 = v11;
      uint64_t v24 = &v25;
      [v8 enumerateAbstractAttachmentsInOrderUsingBlock:&v19];
      BOOL v12 = *((unsigned char *)v26 + 24) == 0;
      v13 = os_log_create("com.apple.notes", "LaunchTask");
      id v14 = v13;
      if (v12)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v17 = [v11 ic_loggingIdentifier:v19, v20, v21, v22];
          uint64_t v18 = [v8 ic_loggingIdentifier];
          *(_DWORD *)buf = 138412546;
          v30 = v17;
          __int16 v31 = 2112;
          v32 = v18;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Root attachment (%@) not found in note (%@) body", buf, 0x16u);
        }
        [(ICFixAttachmentMediaInconsistencyLaunchTask *)self resolveViaDeletionWithAttachment:v6 context:v7];
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          id v15 = [v11 ic_loggingIdentifier:v19, v20, v21, v22];
          id v16 = [v8 ic_loggingIdentifier];
          sub_1004DBBF8(v15, v16, buf, v14);
        }

        [(ICFixAttachmentMediaInconsistencyLaunchTask *)self resolveViaResurrectionWithAttachment:v6 context:v7];
      }

      _Block_object_dispose(&v25, 8);
    }
  }
  else
  {
  }
}

- (void)resolveViaResurrectionWithAttachment:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = [(ICFixAttachmentMediaInconsistencyLaunchTask *)self recordIDsUnmarkedForDeletion];
  id v7 = [v6 mutableCopy];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = +[NSMutableSet set];
  }
  unsigned __int8 v10 = v9;

  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_1000F56E0;
  id v16 = &unk_100629CC0;
  id v17 = v10;
  id v18 = v5;
  id v11 = v5;
  id v12 = v10;
  [(ICFixAttachmentMediaInconsistencyLaunchTask *)self enumerateObjectsThatShouldBeConsistentForAttachment:v11 withBlock:&v13];
  -[ICFixAttachmentMediaInconsistencyLaunchTask setRecordIDsUnmarkedForDeletion:](self, "setRecordIDsUnmarkedForDeletion:", v12, v13, v14, v15, v16);
}

- (void)resolveViaDeletionWithAttachment:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = [(ICFixAttachmentMediaInconsistencyLaunchTask *)self recordIDsMarkedForDeletion];
  id v7 = [v6 mutableCopy];
  id v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_opt_new();
  }
  unsigned __int8 v10 = v9;

  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_1000F58F8;
  id v16 = &unk_100629CC0;
  id v17 = v10;
  id v18 = v5;
  id v11 = v5;
  id v12 = v10;
  [(ICFixAttachmentMediaInconsistencyLaunchTask *)self enumerateObjectsThatShouldBeConsistentForAttachment:v11 withBlock:&v13];
  -[ICFixAttachmentMediaInconsistencyLaunchTask setRecordIDsMarkedForDeletion:](self, "setRecordIDsMarkedForDeletion:", v12, v13, v14, v15, v16);
}

- (void)enumerateObjectsThatShouldBeConsistentForAttachment:(id)a3 withBlock:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  objc_opt_class();
  id v7 = ICDynamicCast();
  uint64_t v8 = [v5 parentAttachment];
  if (v8)
  {
    id v9 = (void *)v8;
    do
    {
      v6[2](v6, v9);
      uint64_t v10 = [v9 parentAttachment];

      id v9 = (void *)v10;
    }
    while (v10);
  }
  v6[2](v6, v5);
  if (v7)
  {
    id v11 = [v7 media];

    if (v11)
    {
      id v12 = [v7 media];
      v6[2](v6, v12);
    }
    else
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v12 = [v7 subAttachments];
      id v13 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v27;
        do
        {
          id v16 = 0;
          do
          {
            if (*(void *)v27 != v15) {
              objc_enumerationMutation(v12);
            }
            v6[2](v6, *(void **)(*((void *)&v26 + 1) + 8 * (void)v16));
            id v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v14);
      }
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v17 = [v7 inlineAttachments];
    id v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v23;
      do
      {
        v21 = 0;
        do
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v17);
          }
          v6[2](v6, *(void **)(*((void *)&v22 + 1) + 8 * (void)v21));
          v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v19);
    }
  }
}

- (NSSet)recordIDsProcessed
{
  return self->_recordIDsProcessed;
}

- (void)setRecordIDsProcessed:(id)a3
{
}

- (NSSet)recordIDsMarkedForDeletion
{
  return self->_recordIDsMarkedForDeletion;
}

- (void)setRecordIDsMarkedForDeletion:(id)a3
{
}

- (NSSet)recordIDsUnmarkedForDeletion
{
  return self->_recordIDsUnmarkedForDeletion;
}

- (void)setRecordIDsUnmarkedForDeletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDsUnmarkedForDeletion, 0);
  objc_storeStrong((id *)&self->_recordIDsMarkedForDeletion, 0);

  objc_storeStrong((id *)&self->_recordIDsProcessed, 0);
}

@end