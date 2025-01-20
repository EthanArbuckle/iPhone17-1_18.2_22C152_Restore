@interface PLShare
+ (BOOL)_shouldRecordCloudDeletionForShare:(id)a3;
+ (BOOL)getShareIfNecessary:(id *)a3 forCPLRecordWithClass:(Class)a4 scopedIdentifier:(id)a5 inLibrary:(id)a6;
+ (BOOL)incrementallyDeleteAndSaveShares:(id)a3 logMessagePrefix:(id)a4 error:(id *)a5;
+ (BOOL)shouldAllowFetchURLWithScopeChange:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
+ (BOOL)supportsCPLScopeType:(int64_t)a3;
+ (BOOL)validateCPLScopeChange:(id)a3;
+ (NSString)cloudUUIDKeyForDeletion;
+ (id)_basePredicateIncludeTrashedShares:(BOOL)a3;
+ (id)_registeredSubclasses;
+ (id)createOwnedShareWithUUID:(id)a3 creationDate:(id)a4 title:(id)a5 inPhotoLibrary:(id)a6;
+ (id)entityName;
+ (id)insertInPhotoLibrary:(id)a3;
+ (id)insertOrUpdateShareWithCPLScopeChange:(id)a3 inPhotoLibrary:(id)a4;
+ (id)predicateToExcludeExpiredShares;
+ (id)predicateToExcludeTrashedShares;
+ (id)scopeIdentifierPrefix;
+ (id)shareWithScopeIdentifier:(id)a3 includeTrashed:(BOOL)a4 inManagedObjectContext:(id)a5;
+ (id)shareWithScopeIdentifiers:(id)a3 includeTrashed:(BOOL)a4 inManagedObjectContext:(id)a5;
+ (id)shareWithScopedIdentifier:(id)a3 includeTrashed:(BOOL)a4 inManagedObjectContext:(id)a5;
+ (id)shareWithShareURL:(id)a3 includeTrashed:(BOOL)a4 inManagedObjectContext:(id)a5;
+ (id)shareWithUUID:(id)a3 includeTrashed:(BOOL)a4 inManagedObjectContext:(id)a5;
+ (id)sharesWithPredicate:(id)a3 fetchLimit:(unint64_t)a4 inManagedObjectContext:(id)a5;
+ (int64_t)_cloudDeletionTypeForScopeType:(int64_t)a3;
+ (int64_t)_cloudDeletionTypeForStatus:(signed __int16)a3;
+ (int64_t)cloudDeletionTypeForTombstone:(id)a3;
+ (void)_abortIfCalledOnBaseClass;
+ (void)deleteAllSharesInManagedObjectContext:(id)a3;
+ (void)deleteExpiredSharesInManagedObjectContext:(id)a3;
+ (void)deleteOldTrashedSharesInManagedObjectContext:(id)a3;
+ (void)fetchShareFromShareURL:(id)a3 inPhotoLibrary:(id)a4 completionHandler:(id)a5;
- (BOOL)incrementallyDeleteAndSaveWithError:(id *)a3;
- (BOOL)isCurrentUserOwner;
- (id)_statusDescription;
- (id)compactDescription;
- (id)cplScopeChange;
- (id)currentUserParticipant;
- (id)owner;
- (int64_t)cloudDeletionType;
- (int64_t)publicPermission;
- (int64_t)scopeType;
- (void)_updateShareStatusWithCurrentUser:(id)a3;
- (void)acceptWithCompletionHandler:(id)a3;
- (void)prepareForDeletion;
- (void)publishWithCompletionHandler:(id)a3;
- (void)setPublicPermission:(int64_t)a3;
- (void)setScopeType:(int64_t)a3;
- (void)trash;
- (void)untrash;
- (void)updateShareWithCPLShare:(id)a3 inPhotoLibrary:(id)a4;
@end

@implementation PLShare

+ (id)predicateToExcludeExpiredShares
{
  v2 = (void *)MEMORY[0x1E4F28F60];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = [v2 predicateWithFormat:@"expiryDate == nil OR expiryDate > %@", v3];

  return v4;
}

+ (id)predicateToExcludeTrashedShares
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(trashedState) == %d", 0);
}

- (id)_statusDescription
{
  unsigned int v2 = [(PLShare *)self status];
  if (v2 > 3) {
    return @"owned";
  }
  else {
    return off_1E5869A50[(unsigned __int16)v2];
  }
}

- (id)compactDescription
{
  v15 = NSString;
  v3 = [(NSManagedObject *)self pl_shortDescription];
  v4 = [(PLShare *)self uuid];
  v5 = [(PLShare *)self scopeIdentifier];
  v6 = [(PLShare *)self title];
  int v7 = [(PLShare *)self status];
  v8 = [(PLShare *)self shareURL];
  v9 = objc_msgSend(v8, "pl_redactedShareURL");
  v10 = [(PLShare *)self creationDate];
  v11 = [(PLShare *)self expiryDate];
  v12 = [(PLShare *)self trashedDate];
  v13 = [v15 stringWithFormat:@"%@ - UUID: %@, ScopeIdentifier: %@, Title: %@, Status: %d, ShareURL: %@, CreationDate: %@, ExpiryDate: %@, TrashedDate: %@", v3, v4, v5, v6, v7, v9, v10, v11, v12];

  return v13;
}

- (BOOL)incrementallyDeleteAndSaveWithError:(id *)a3
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__40242;
  v25 = __Block_byref_object_dispose__40243;
  id v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v5 = [(PLShare *)self managedObjectContext];
  v6 = [(PLManagedObject *)self photoLibrary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__PLShare_incrementallyDeleteAndSaveWithError___block_invoke;
  v12[3] = &unk_1E5874900;
  id v7 = v5;
  id v13 = v7;
  v14 = self;
  v15 = &v17;
  v16 = &v21;
  [v6 performBlockAndWait:v12];

  LODWORD(v6) = *((unsigned __int8 *)v18 + 24);
  id v8 = (id)v22[5];
  v9 = v8;
  if (!v6 && a3) {
    *a3 = v8;
  }

  char v10 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v10;
}

void __47__PLShare_incrementallyDeleteAndSaveWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) deleteObject:*(void *)(a1 + 40)];
  unsigned int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = [v2 save:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
}

- (int64_t)cloudDeletionType
{
  uint64_t v3 = objc_opt_class();
  int64_t v4 = [(PLShare *)self scopeType];
  return [v3 _cloudDeletionTypeForScopeType:v4];
}

- (void)untrash
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [(PLShare *)self setTrashedState:0];
  [(PLShare *)self setTrashedDate:0];
  uint64_t v3 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int64_t v4 = [(PLShare *)self compactDescription];
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "Setting share to untrashed state: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)trash
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(PLShare *)self setTrashedState:1];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  [(PLShare *)self setTrashedDate:v3];

  int64_t v4 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = [(PLShare *)self compactDescription];
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, "Setting share to trashed state: %@", (uint8_t *)&v7, 0xCu);
  }
  v6 = [(PLShare *)self managedObjectContext];
  if ([(id)objc_opt_class() _shouldRecordCloudDeletionForShare:self]) {
    [v6 recordCloudDeletionForObject:self];
  }
}

- (void)_updateShareStatusWithCurrentUser:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(id)objc_opt_class() _abortIfCalledOnBaseClass];
  uint64_t v6 = [v5 role];
  if ((unint64_t)(v6 - 2) < 2)
  {
    switch([v5 acceptanceStatus])
    {
      case 0:
      case 3:
        uint64_t v9 = PLBackendSharingGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          char v10 = [(PLShare *)self compactDescription];
          *(_DWORD *)buf = 138412546;
          id v15 = v5;
          __int16 v16 = 2112;
          uint64_t v17 = v10;
          _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Un-expected status from %@ for share %@", buf, 0x16u);
        }
        int v7 = self;
        uint64_t v8 = 0;
        goto LABEL_16;
      case 1:
        int v7 = self;
        uint64_t v8 = 2;
        goto LABEL_16;
      case 2:
        int v7 = self;
        uint64_t v8 = 3;
        goto LABEL_16;
      default:
        break;
    }
  }
  else if (v6)
  {
    if (v6 == 1)
    {
      if ([v5 acceptanceStatus] != 2)
      {
        v12 = [MEMORY[0x1E4F28B00] currentHandler];
        id v13 = [(PLShare *)self compactDescription];
        [v12 handleFailureInMethod:a2, self, @"PLShare.m", 524, @"Owner %@ of a share %@ should have the accepted status", v5, v13 object file lineNumber description];
      }
      int v7 = self;
      uint64_t v8 = 1;
LABEL_16:
      [(PLShare *)v7 setStatus:v8];
    }
  }
  else
  {
    v11 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Unknown share participant type for %@", buf, 0xCu);
    }
  }
}

- (BOOL)isCurrentUserOwner
{
  uint64_t v3 = [(PLShare *)self owner];
  int64_t v4 = [v3 userIdentifier];
  id v5 = [(PLShare *)self currentUserParticipant];
  uint64_t v6 = [v5 userIdentifier];
  BOOL v7 = v4 == v6;

  return v7;
}

- (id)currentUserParticipant
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() _abortIfCalledOnBaseClass];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [(PLShare *)self participants];
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        BOOL v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 isCurrentUser])
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)owner
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() _abortIfCalledOnBaseClass];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [(PLShare *)self participants];
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        BOOL v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 role] == 1)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)updateShareWithCPLShare:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v67 = a4;
  [(id)objc_opt_class() _abortIfCalledOnBaseClass];
  BOOL v7 = [v6 URL];
  [(PLShare *)self setShareURL:v7];

  -[PLShare setPublicPermission:](self, "setPublicPermission:", [v6 publicPermission]);
  uint64_t v8 = [(PLShare *)self participants];
  long long v9 = [v8 valueForKey:@"uuid"];
  long long v10 = (void *)[v9 mutableCopy];

  id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
  long long v12 = [v6 participants];
  v66 = objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count"));

  id v68 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v64 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v65 = v6;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v13 = [v6 participants];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v82 objects:v95 count:16];
  id v15 = off_1E585F000;
  v69 = v10;
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v83 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        char v20 = [(__objc2_class *)v15[302] participantWithCPLShareParticipant:v19 inShare:self];
        if (v20)
        {
          uint64_t v21 = v20;
          if ([v20 acceptanceStatus] == 1 && objc_msgSend(v19, "acceptanceStatus") == 2)
          {
            v22 = PLBackendSharingGetLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              uint64_t v23 = [v21 uuid];
              *(_DWORD *)buf = 138543362;
              v90 = v23;
              _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_INFO, "Participant acceptance status changes from pending to accepted: %{public}@", buf, 0xCu);
            }
            [v66 addObject:v21];
          }
        }
        else
        {
          v24 = v15[302];
          v25 = [(PLManagedObject *)self photoLibrary];
          uint64_t v21 = [(__objc2_class *)v24 insertInPhotoLibrary:v25];

          [v21 setShare:self];
          id v26 = [v21 uuid];
          [v68 addObject:v26];
        }
        [v21 updateWithCPLShareParticipant:v19 inShare:self];
        v27 = [v21 uuid];
        [v10 removeObject:v27];

        if ([v19 isCurrentUser])
        {
          v28 = PLBackendSharingGetLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v29 = [(PLShare *)self uuid];
            v30 = [v21 uuid];
            *(_DWORD *)buf = 138543874;
            v90 = v29;
            __int16 v91 = 2114;
            v92 = v30;
            __int16 v93 = 2112;
            v94 = v19;
            _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_INFO, "Updating status for %{public}@ from current user: %{public}@, %@", buf, 0x20u);

            long long v10 = v69;
          }

          [(PLShare *)self _updateShareStatusWithCurrentUser:v19];
        }

        id v15 = off_1E585F000;
      }
      uint64_t v16 = [v13 countByEnumeratingWithState:&v82 objects:v95 count:16];
    }
    while (v16);
  }

  if ([v66 count] && -[PLShare isCurrentUserOwner](self, "isCurrentUserOwner"))
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v31 = v66;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v78 objects:v88 count:16];
    if (!v32) {
      goto LABEL_33;
    }
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v79;
    while (1)
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v79 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v78 + 1) + 8 * j);
        v37 = [v36 shortName];
        if (v37)
        {
          v38 = +[PLNotificationManager sharedManager];
          v39 = [(PLShare *)self scopeIdentifier];
          v40 = [MEMORY[0x1E4F1C9C8] now];
          [v38 postNotificationForAcceptedSharedLibraryWithScopeIdentifier:v39 participantName:v37 library:v67 notificationDeliveryDate:v40];

          long long v10 = v69;
        }
        else
        {
          v38 = PLBackendSharingGetLog();
          if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            goto LABEL_31;
          }
          v39 = [v36 uuid];
          *(_DWORD *)buf = 138543362;
          v90 = v39;
          _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "Accepted participant does not have a short name for notification: %{public}@", buf, 0xCu);
        }

LABEL_31:
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v78 objects:v88 count:16];
      if (!v33)
      {
LABEL_33:

        id v15 = off_1E585F000;
        break;
      }
    }
  }
  if ([v10 count])
  {
    v41 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      v42 = [(PLShare *)self uuid];
      *(_DWORD *)buf = 138412546;
      v90 = v10;
      __int16 v91 = 2112;
      v92 = v42;
      _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_INFO, "Deleting participants %@ in share %@", buf, 0x16u);
    }
    v43 = [v10 allObjects];
    v44 = +[PLShareParticipant participantsWithUUIDs:v43 inPhotoLibrary:v67];

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v45 = v44;
    uint64_t v46 = [v45 countByEnumeratingWithState:&v74 objects:v87 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v75;
      do
      {
        for (uint64_t k = 0; k != v47; ++k)
        {
          if (*(void *)v75 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = [*(id *)(*((void *)&v74 + 1) + 8 * k) uuid];
          [v64 addObject:v50];
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v74 objects:v87 count:16];
      }
      while (v47);
    }

    id v15 = off_1E585F000;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v68 count])
    {
      v51 = [v68 allObjects];
      id v15 = off_1E585F000;
      +[PLLibraryScope informRapportToAddShareParticipantUUIDs:v51 photoLibrary:v67];
    }
    if ([v64 count])
    {
      v52 = [v64 allObjects];
      v53 = [v67 libraryBundle];
      id v15 = off_1E585F000;
      +[PLLibraryScope informRapportToRemoveShareParticipantUUIDs:v52 photoLibraryBundle:v53];
    }
  }
  if ([v64 count])
  {
    v54 = v15[302];
    v55 = [v64 allObjects];
    v56 = [(__objc2_class *)v54 participantsWithUUIDs:v55 inPhotoLibrary:v67];

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v57 = v56;
    uint64_t v58 = [v57 countByEnumeratingWithState:&v70 objects:v86 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v71;
      do
      {
        for (uint64_t m = 0; m != v59; ++m)
        {
          if (*(void *)v71 != v60) {
            objc_enumerationMutation(v57);
          }
          uint64_t v62 = *(void *)(*((void *)&v70 + 1) + 8 * m);
          v63 = [v67 managedObjectContext];
          [v63 deleteObject:v62];
        }
        uint64_t v59 = [v57 countByEnumeratingWithState:&v70 objects:v86 count:16];
      }
      while (v59);
    }

    long long v10 = v69;
  }
}

- (id)cplScopeChange
{
  unsigned int v2 = self;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (int64_t)scopeType
{
  [(PLShare *)self willAccessValueForKey:@"scopeType"];
  id v3 = [(PLShare *)self primitiveValueForKey:@"scopeType"];
  int64_t v4 = [v3 integerValue];

  [(PLShare *)self didAccessValueForKey:@"scopeType"];
  return v4;
}

- (void)setScopeType:(int64_t)a3
{
  [(PLShare *)self willChangeValueForKey:@"scopeType"];
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  [(PLShare *)self setPrimitiveValue:v5 forKey:@"scopeType"];

  [(PLShare *)self didChangeValueForKey:@"scopeType"];
}

- (int64_t)publicPermission
{
  [(PLShare *)self willAccessValueForKey:@"publicPermission"];
  id v3 = [(PLShare *)self primitiveValueForKey:@"publicPermission"];
  int64_t v4 = [v3 integerValue];

  [(PLShare *)self didAccessValueForKey:@"publicPermission"];
  return v4;
}

- (void)setPublicPermission:(int64_t)a3
{
  [(PLShare *)self willChangeValueForKey:@"publicPermission"];
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  [(PLShare *)self setPrimitiveValue:v5 forKey:@"publicPermission"];

  [(PLShare *)self didChangeValueForKey:@"publicPermission"];
}

- (void)acceptWithCompletionHandler:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(id)objc_opt_class() _abortIfCalledOnBaseClass];
  uint64_t v5 = [(PLManagedObject *)self photoLibrary];
  id v6 = [v5 libraryServicesManager];
  BOOL v7 = [v6 cloudPhotoLibraryManager];

  if (v7)
  {
    uint64_t v8 = [(PLShare *)self cplScopeChange];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39__PLShare_acceptWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E58734E8;
    void v12[4] = self;
    id v13 = v4;
    [v7 acceptCPLShare:v8 completionHandler:v12];
  }
  else
  {
    long long v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F8C500];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = @"PLCloudPhotoLibraryManager is not available";
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v11 = [v9 errorWithDomain:v10 code:41004 userInfo:v8];
    (*((void (**)(id, void *))v4 + 2))(v4, v11);
  }
}

void __39__PLShare_acceptWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) photoLibrary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39__PLShare_acceptWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E5875E18;
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v13 = v5;
  uint64_t v14 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__PLShare_acceptWithCompletionHandler___block_invoke_77;
  v9[3] = &unk_1E58742F0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [v4 performTransaction:v12 completionHandler:v9 withPriority:1];
}

void __39__PLShare_acceptWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = PLBackendSharingGetLog();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v5 = [*(id *)(a1 + 40) compactDescription];
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138412546;
      long long v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Failed to accept share %@ : %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v7 = [*(id *)(a1 + 40) compactDescription];
      int v8 = 138412290;
      long long v9 = v7;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, "Accepted share %@", (uint8_t *)&v8, 0xCu);
    }
    [*(id *)(a1 + 40) setStatus:3];
  }
}

uint64_t __39__PLShare_acceptWithCompletionHandler___block_invoke_77(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)publishWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = self;
  PLAbstractMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)prepareForDeletion
{
  v4.receiver = self;
  v4.super_class = (Class)PLShare;
  [(PLManagedObject *)&v4 prepareForDeletion];
  id v3 = [(PLShare *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 mergingChanges] & 1) == 0
    && [(id)objc_opt_class() _shouldRecordCloudDeletionForShare:self])
  {
    [v3 recordCloudDeletionForObject:self];
  }
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)@"scopeIdentifier";
}

+ (int64_t)_cloudDeletionTypeForStatus:(signed __int16)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ((a3 - 2) < 2) {
    return 7;
  }
  if (a3)
  {
    if (a3 == 1) {
      return 6;
    }
    else {
      return 0;
    }
  }
  else
  {
    objc_super v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      id v5 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid share status for cloud deletetion: %d", 0);
      *(_DWORD *)buf = 138412290;
      id v7 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
    }
    return 0;
  }
}

+ (int64_t)_cloudDeletionTypeForScopeType:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
    case 1:
    case 6:
      objc_super v4 = PLBackendGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        id v5 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid scope type for cloud deletetion: %ld", a3);
        *(_DWORD *)buf = 138412290;
        uint64_t v8 = v5;
        _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
      }
      goto LABEL_5;
    case 2:
      int64_t result = 6;
      break;
    case 3:
      int64_t result = 7;
      break;
    case 4:
      int64_t result = 11;
      break;
    case 5:
      int64_t result = 12;
      break;
    default:
LABEL_5:
      int64_t result = 0;
      break;
  }
  return result;
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"scopeType"];
  id v6 = v5;
  if (v5)
  {
    int64_t v7 = objc_msgSend(a1, "_cloudDeletionTypeForScopeType:", (int)objc_msgSend(v5, "intValue"));
  }
  else
  {
    uint64_t v8 = [v4 objectForKeyedSubscript:@"status"];
    int64_t v7 = objc_msgSend(a1, "_cloudDeletionTypeForStatus:", (__int16)objc_msgSend(v8, "intValue"));
  }
  return v7;
}

+ (BOOL)shouldAllowFetchURLWithScopeChange:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a1;
  PLAbstractMethodException();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v10);
}

+ (BOOL)supportsCPLScopeType:(int64_t)a3
{
  id v3 = a1;
  PLAbstractMethodException();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

+ (BOOL)validateCPLScopeChange:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 creationDate];

    if (v4)
    {
LABEL_3:
      BOOL v5 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    id v6 = [v3 share];
    id v7 = [v6 creationDate];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v8 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Triggering tap to radar for CPLScopeChange with nil creationDate", buf, 2u);
  }

  id v9 = NSString;
  id v10 = objc_msgSend(MEMORY[0x1E4F59960], "descriptionForScopeType:", objc_msgSend(v3, "scopeType"));
  uint64_t v11 = [v9 stringWithFormat:@"TTR: Inconsistent %@ scope detected", v10];

  uint64_t v12 = NSString;
  id v13 = objc_msgSend(MEMORY[0x1E4F59960], "descriptionForScopeType:", objc_msgSend(v3, "scopeType"));
  uint64_t v14 = [v3 scopeIdentifier];
  id v15 = [v12 stringWithFormat:@"A %@ scope was detected in an inconsistent state and ignored: %@", v13, v14];

  +[PLDiagnostics fileRadarUserNotificationWithHeader:@"Inconsistent Scope State Detected" message:@"Your photo library has experienced an unexpected state, please file a Radar against Photos to help us diagnose the issue" radarTitle:v11 radarDescription:v15];
  uint64_t v16 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = v15;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_FAULT, "%{public}@", buf, 0xCu);
  }

  BOOL v5 = 0;
LABEL_10:

  return v5;
}

+ (void)deleteOldTrashedSharesInManagedObjectContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x19F38D3B0]();
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = objc_opt_new();
  [v7 setMonth:-3];
  id v8 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  id v9 = [v8 dateByAddingComponents:v7 toDate:v6 options:0];

  id v10 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v9;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Deleting trashed shares older than %@", buf, 0xCu);
  }

  uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"trashedDate != nil AND trashedDate < %@", v9];
  uint64_t v12 = [a1 sharesWithPredicate:v11 fetchLimit:0 inManagedObjectContext:v4];
  [a1 incrementallyDeleteAndSaveShares:v12 logMessagePrefix:@"old trashed" error:0];
}

+ (void)deleteExpiredSharesInManagedObjectContext:(id)a3
{
  id v9 = a3;
  id v4 = (void *)MEMORY[0x19F38D3B0]();
  BOOL v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = [v5 predicateWithFormat:@"expiryDate != nil AND expiryDate < %@", v6];

  id v8 = [a1 sharesWithPredicate:v7 fetchLimit:0 inManagedObjectContext:v9];
  [a1 incrementallyDeleteAndSaveShares:v8 logMessagePrefix:@"expired" error:0];
}

+ (void)deleteAllSharesInManagedObjectContext:(id)a3
{
  id v7 = a3;
  id v4 = (void *)MEMORY[0x19F38D3B0]();
  BOOL v5 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  id v6 = [a1 sharesWithPredicate:v5 fetchLimit:0 inManagedObjectContext:v7];

  [a1 incrementallyDeleteAndSaveShares:v6 logMessagePrefix:@"all" error:0];
}

+ (BOOL)incrementallyDeleteAndSaveShares:(id)a3 logMessagePrefix:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v25 = a4;
  id v8 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v33 = [v7 count];
    __int16 v34 = 2112;
    id v35 = v25;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_INFO, "Deleting %lu (%@) shares...", buf, 0x16u);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v10)
  {
    uint64_t v13 = 0;
    id v12 = v9;
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v11 = v10;
  v24 = a5;
  id v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = *(void *)v28;
  do
  {
    uint64_t v15 = 0;
    uint64_t v16 = v12;
    do
    {
      if (*(void *)v28 != v14) {
        objc_enumerationMutation(v9);
      }
      uint64_t v17 = *(void **)(*((void *)&v27 + 1) + 8 * v15);
      uint64_t v18 = (void *)MEMORY[0x19F38D3B0]();
      id v26 = v16;
      char v19 = [v17 incrementallyDeleteAndSaveWithError:&v26];
      id v12 = v26;

      if (v19)
      {
        ++v13;
      }
      else
      {
        uint64_t v20 = PLBackendSharingGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v33 = (uint64_t)v25;
          __int16 v34 = 2112;
          id v35 = v12;
          _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed to delete (%@) share: %@", buf, 0x16u);
        }
      }
      ++v15;
      uint64_t v16 = v12;
    }
    while (v11 != v15);
    uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v11);

  if (v13 >= 1)
  {
    uint64_t v21 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v33 = v13;
      __int16 v34 = 2112;
      id v35 = v25;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_INFO, "Deleted %lu (%@) shares", buf, 0x16u);
    }
  }
  if (v12)
  {
    if (v24)
    {
      id v12 = v12;
      id *v24 = v12;
    }
    goto LABEL_23;
  }
LABEL_24:
  BOOL v22 = v13 == [v9 count];

  return v22;
}

+ (void)fetchShareFromShareURL:(id)a3 inPhotoLibrary:(id)a4 completionHandler:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 libraryServicesManager];
  id v12 = [v11 cloudPhotoLibraryManager];

  if (v12)
  {
    uint64_t v13 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = objc_msgSend(v8, "pl_redactedShareURL");
      *(_DWORD *)buf = 138412290;
      id v26 = v14;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "Fetching share from URL: %@", buf, 0xCu);
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __67__PLShare_fetchShareFromShareURL_inPhotoLibrary_completionHandler___block_invoke;
    v19[3] = &unk_1E5869A30;
    id v20 = v8;
    id v23 = v10;
    id v24 = a1;
    id v21 = v9;
    id v22 = v12;
    [v22 fetchShareFromShareURL:v20 completionHandler:v19];

    uint64_t v15 = v20;
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F8C500];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28[0] = @"PLCloudPhotoLibraryManager is not available";
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    uint64_t v18 = [v16 errorWithDomain:v17 code:41004 userInfo:v15];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v18);
  }
}

void __67__PLShare_fetchShareFromShareURL_inPhotoLibrary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v22 = a3;
  if (v22)
  {
    id v6 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_msgSend(*(id *)(a1 + 32), "pl_redactedShareURL");
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v22;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Failed to fetch share from %{public}@: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = [*(id *)(a1 + 64) _registeredSubclasses];
    uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v8)
    {
      uint64_t v10 = *(void *)v35;
      *(void *)&long long v9 = 138412546;
      long long v21 = v9;
LABEL_7:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v34 + 1) + 8 * v11);
        if (objc_msgSend(v12, "supportsCPLScopeType:", objc_msgSend(v5, "scopeType", v21)))
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v43 = __Block_byref_object_copy__40242;
          v44 = __Block_byref_object_dispose__40243;
          id v45 = 0;
          v32[0] = 0;
          v32[1] = v32;
          v32[2] = 0x3032000000;
          v32[3] = __Block_byref_object_copy__40242;
          v32[4] = __Block_byref_object_dispose__40243;
          id v33 = 0;
          uint64_t v13 = [*(id *)(a1 + 40) libraryServicesManager];
          uint64_t v14 = [v13 libraryBundle];
          id v15 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "+[PLShare fetchShareFromShareURL:inPhotoLibrary:completionHandler:]_block_invoke", v14);

          id v31 = 0;
          char v16 = [v12 shouldAllowFetchURLWithScopeChange:v5 photoLibrary:v15 error:&v31];
          id v17 = v31;
          if (v16)
          {
            uint64_t v18 = *(void **)(a1 + 48);
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __67__PLShare_fetchShareFromShareURL_inPhotoLibrary_completionHandler___block_invoke_74;
            v24[3] = &unk_1E5869A08;
            id v25 = v15;
            long long v28 = v32;
            long long v30 = v12;
            id v26 = v5;
            long long v29 = buf;
            id v27 = *(id *)(a1 + 56);
            [v18 performTransactionOnLibraryScopeSynchronizationQueue:v24];
          }
          else
          {
            char v19 = PLBackendSharingGetLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              id v20 = objc_msgSend(*(id *)(a1 + 32), "pl_redactedShareURL");
              *(_DWORD *)v38 = v21;
              v39 = v20;
              __int16 v40 = 2114;
              id v41 = v17;
              _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Not ingesting shareURL: %@ due to %{public}@", v38, 0x16u);
            }
            (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          }

          _Block_object_dispose(v32, 8);
          _Block_object_dispose(buf, 8);

          if (v16) {
            break;
          }
        }
        if (v8 == ++v11)
        {
          uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v46 count:16];
          if (v8) {
            goto LABEL_7;
          }
          break;
        }
      }
    }
  }
}

void __67__PLShare_fetchShareFromShareURL_inPhotoLibrary_completionHandler___block_invoke_74(uint64_t a1)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__PLShare_fetchShareFromShareURL_inPhotoLibrary_completionHandler___block_invoke_2;
  v11[3] = &unk_1E58699E0;
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v16 = v2;
  id v3 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 64);
  id v13 = v4;
  uint64_t v15 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__PLShare_fetchShareFromShareURL_inPhotoLibrary_completionHandler___block_invoke_3;
  v8[3] = &unk_1E5873410;
  long long v7 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v7;
  long long v9 = v7;
  uint64_t v10 = *(void *)(a1 + 64);
  [v3 performTransactionAndWait:v11 completionHandler:v8];
}

void __67__PLShare_fetchShareFromShareURL_inPhotoLibrary_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 64) insertOrUpdateShareWithCPLScopeChange:*(void *)(a1 + 32) inPhotoLibrary:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) uuid];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __67__PLShare_fetchShareFromShareURL_inPhotoLibrary_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) autoAcceptShareIfNecessary];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

+ (id)_basePredicateIncludeTrashedShares:(BOOL)a3
{
  if (a3) {
    [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  else {
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"trashedState", 0);
  }
  return v3;
}

+ (BOOL)getShareIfNecessary:(id *)a3 forCPLRecordWithClass:(Class)a4 scopedIdentifier:(id)a5 inLibrary:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  if ([v10 isInAMomentShare])
  {
    id v12 = [v11 managedObjectContext];
    BOOL v13 = 1;
    uint64_t v14 = [a1 shareWithScopedIdentifier:v10 includeTrashed:1 inManagedObjectContext:v12];

    if (!v14)
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v15 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          int v22 = 138543618;
          Class v23 = a4;
          __int16 v24 = 2112;
          id v25 = v10;
          _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to find moment share for <%{public}@ %@>", (uint8_t *)&v22, 0x16u);
        }
LABEL_11:

        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v16 = [v10 scopeIdentifier];
    id v17 = [v11 mainScopeIdentifier];
    char v18 = [v16 isEqualToString:v17];

    if ((v18 & 1) == 0)
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v15 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          char v19 = [v11 mainScopeIdentifier];
          int v22 = 138543874;
          Class v23 = a4;
          __int16 v24 = 2112;
          id v25 = v10;
          __int16 v26 = 2112;
          id v27 = v19;
          _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Invalid scope identifier for  <%{public}@ %@> (expecting %@)", (uint8_t *)&v22, 0x20u);
        }
        goto LABEL_11;
      }
LABEL_12:
      uint64_t v14 = 0;
      BOOL v13 = 0;
      goto LABEL_13;
    }
    uint64_t v14 = 0;
    BOOL v13 = 1;
  }
LABEL_13:
  id v20 = v14;
  *a3 = v20;

  return v13;
}

+ (id)sharesWithPredicate:(id)a3 fetchLimit:(unint64_t)a4 inManagedObjectContext:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __65__PLShare_sharesWithPredicate_fetchLimit_inManagedObjectContext___block_invoke;
  v29[3] = &unk_1E58699B8;
  id v10 = v8;
  id v30 = v10;
  unint64_t v32 = a4;
  id v11 = v9;
  id v31 = v11;
  id v12 = (void (**)(void, void))MEMORY[0x19F38D650](v29);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = objc_opt_class();
  if (v14 == objc_opt_class())
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v16 = [a1 _registeredSubclasses];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      id v24 = v10;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = [*(id *)(*((void *)&v25 + 1) + 8 * i) entityName];
          int v22 = ((void (**)(void, void *))v12)[2](v12, v21);

          if (v22) {
            [v13 addObjectsFromArray:v22];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v18);
      id v10 = v24;
    }
  }
  else
  {
    uint64_t v15 = [a1 entityName];
    uint64_t v16 = ((void (**)(void, void *))v12)[2](v12, v15);

    if (v16) {
      [v13 addObjectsFromArray:v16];
    }
  }

  return v13;
}

id __65__PLShare_sharesWithPredicate_fetchLimit_inManagedObjectContext___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:a2];
  [v3 setPredicate:a1[4]];
  if (a1[6]) {
    objc_msgSend(v3, "setFetchLimit:");
  }
  id v4 = (void *)a1[5];
  id v10 = 0;
  uint64_t v5 = [v4 executeFetchRequest:v3 error:&v10];
  id v6 = v10;
  if (!v5)
  {
    long long v7 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[4];
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch shares with predicate %@: %@", buf, 0x16u);
    }
  }
  return v5;
}

+ (id)shareWithShareURL:(id)a3 includeTrashed:(BOOL)a4 inManagedObjectContext:(id)a5
{
  BOOL v5 = a4;
  v18[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 _basePredicateIncludeTrashedShares:v5];
  id v11 = (void *)MEMORY[0x1E4F28BA0];
  v18[0] = v10;
  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"shareURL", v9];

  v18[1] = v12;
  __int16 v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  id v14 = [v11 andPredicateWithSubpredicates:v13];

  uint64_t v15 = [a1 sharesWithPredicate:v14 fetchLimit:1 inManagedObjectContext:v8];

  uint64_t v16 = [v15 firstObject];

  return v16;
}

+ (id)shareWithUUID:(id)a3 includeTrashed:(BOOL)a4 inManagedObjectContext:(id)a5
{
  BOOL v5 = a4;
  v18[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 _basePredicateIncludeTrashedShares:v5];
  id v11 = (void *)MEMORY[0x1E4F28BA0];
  v18[0] = v10;
  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"uuid", v9];

  v18[1] = v12;
  __int16 v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  id v14 = [v11 andPredicateWithSubpredicates:v13];

  uint64_t v15 = [a1 sharesWithPredicate:v14 fetchLimit:1 inManagedObjectContext:v8];

  uint64_t v16 = [v15 firstObject];

  return v16;
}

+ (id)shareWithScopeIdentifiers:(id)a3 includeTrashed:(BOOL)a4 inManagedObjectContext:(id)a5
{
  BOOL v5 = a4;
  v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 _basePredicateIncludeTrashedShares:v5];
  id v11 = (void *)MEMORY[0x1E4F28BA0];
  v17[0] = v10;
  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"scopeIdentifier", v9];

  v17[1] = v12;
  __int16 v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v14 = [v11 andPredicateWithSubpredicates:v13];

  uint64_t v15 = [a1 sharesWithPredicate:v14 fetchLimit:0 inManagedObjectContext:v8];

  return v15;
}

+ (id)shareWithScopeIdentifier:(id)a3 includeTrashed:(BOOL)a4 inManagedObjectContext:(id)a5
{
  BOOL v5 = a4;
  v18[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 _basePredicateIncludeTrashedShares:v5];
  id v11 = (void *)MEMORY[0x1E4F28BA0];
  v18[0] = v10;
  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"scopeIdentifier", v9];

  v18[1] = v12;
  __int16 v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  id v14 = [v11 andPredicateWithSubpredicates:v13];

  uint64_t v15 = [a1 sharesWithPredicate:v14 fetchLimit:1 inManagedObjectContext:v8];

  uint64_t v16 = [v15 firstObject];

  return v16;
}

+ (id)shareWithScopedIdentifier:(id)a3 includeTrashed:(BOOL)a4 inManagedObjectContext:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([v8 isInAMomentShare])
  {
    id v10 = [v8 scopeIdentifier];
    id v11 = [a1 shareWithScopeIdentifier:v10 includeTrashed:v6 inManagedObjectContext:v9];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (BOOL)_shouldRecordCloudDeletionForShare:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 status]
    && [v3 scopeType] != 4
    && [v3 scopeType] != 5;

  return v4;
}

+ (id)insertOrUpdateShareWithCPLScopeChange:(id)a3 inPhotoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  PLAbstractMethodException();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

+ (id)createOwnedShareWithUUID:(id)a3 creationDate:(id)a4 title:(id)a5 inPhotoLibrary:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [a1 _abortIfCalledOnBaseClass];
  id v14 = [a1 insertInPhotoLibrary:v10];

  [v14 setTitle:v11];
  [v14 setCreationDate:v12];

  [v14 setUuid:v13];
  [v14 setStatus:1];
  return v14;
}

+ (id)insertInPhotoLibrary:(id)a3
{
  id v4 = a3;
  [a1 _abortIfCalledOnBaseClass];
  BOOL v5 = [v4 managedObjectContext];

  id v6 = [a1 entityName];
  id v7 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v6, (uint64_t)v5, 0);

  id v8 = [MEMORY[0x1E4F8BA08] UUIDString];
  [v7 setUuid:v8];

  id v9 = NSString;
  id v10 = [a1 scopeIdentifierPrefix];
  id v11 = [MEMORY[0x1E4F8BA08] UUIDString];
  id v12 = [v9 stringWithFormat:@"%@%@", v10, v11];

  [v7 setScopeIdentifier:v12];
  return v7;
}

+ (id)entityName
{
  id v2 = a1;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)scopeIdentifierPrefix
{
  id v2 = a1;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (void)_abortIfCalledOnBaseClass
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    id v4 = a1;
    PLAbstractMethodException();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
}

+ (id)_registeredSubclasses
{
  if (_registeredSubclasses_onceToken != -1) {
    dispatch_once(&_registeredSubclasses_onceToken, &__block_literal_global_40428);
  }
  id v2 = (void *)_registeredSubclasses_subclasses;
  return v2;
}

void __32__PLShare__registeredSubclasses__block_invoke()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];
  v1 = (void *)_registeredSubclasses_subclasses;
  _registeredSubclasses_subclasses = v0;
}

@end