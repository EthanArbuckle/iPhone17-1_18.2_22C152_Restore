@interface PXSharedLibraryMock
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)fetchItemCounts;
- (BOOL)canDeleteParticipants:(id)a3;
- (BOOL)canEditParticipants;
- (BOOL)canMoveAssetsToPersonalLibrary:(id)a3;
- (BOOL)canMoveAssetsToSharedLibrary:(id)a3;
- (BOOL)canRemoveAssetSharingSuggestions:(id)a3;
- (BOOL)isDeclined;
- (BOOL)isExiting;
- (BOOL)isInLocalMode;
- (BOOL)isInPreview;
- (BOOL)isOwned;
- (BOOL)isPublished;
- (NSArray)participants;
- (NSDate)creationDate;
- (NSString)description;
- (NSString)identifier;
- (NSURL)shareURL;
- (PXSharedLibraryMock)init;
- (PXSharedLibraryParticipant)owner;
- (PXSharedLibraryRule)rule;
- (id)sourceLibraryInfo;
- (unint64_t)cloudItemCount;
- (unint64_t)cloudPhotoCount;
- (unint64_t)cloudVideoCount;
- (void)acceptInvitationWithRule:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)addAssetSharingSuggestions:(id)a3 completion:(id)a4;
- (void)addParticipantsWithEmailAddresses:(id)a3 phoneNumbers:(id)a4 presentationEnvironment:(id)a5 withCompletion:(id)a6;
- (void)addPersonUUIDsToPersonCondition:(id)a3 completion:(id)a4;
- (void)declineInvitationWithCompletion:(id)a3;
- (void)deleteParticipants:(id)a3 presentationEnvironment:(id)a4 withCompletion:(id)a5;
- (void)exitPreviewWithPresentationEnvironment:(id)a3 completion:(id)a4;
- (void)exitWithRetentionPolicy:(int64_t)a3 presentationEnvironment:(id)a4 progress:(id)a5 completion:(id)a6;
- (void)moveAssetsToPersonalLibrary:(id)a3 completion:(id)a4;
- (void)moveAssetsToSharedLibrary:(id)a3 completion:(id)a4;
- (void)moveAssetsWithLocalIdentifiersToSharedLibrary:(id)a3 completion:(id)a4;
- (void)previewInvitationWithRule:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)publishPreviewWithPresentationEnvironment:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)removeAssetSharingSuggestions:(id)a3 completion:(id)a4;
- (void)removePersonUUIDsFromPersonCondition:(id)a3 completion:(id)a4;
- (void)restoreDeclinedInvitationWithCompletion:(id)a3;
- (void)setIsDeclined:(BOOL)a3;
- (void)setIsExiting:(BOOL)a3;
- (void)setIsInPreview:(BOOL)a3;
- (void)setIsOwned:(BOOL)a3;
- (void)setIsPublished:(BOOL)a3;
- (void)setOwner:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setRule:(id)a3;
@end

@implementation PXSharedLibraryMock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_rule, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setIsDeclined:(BOOL)a3
{
  self->_isDeclined = a3;
}

- (BOOL)isDeclined
{
  return self->_isDeclined;
}

- (void)setIsExiting:(BOOL)a3
{
  self->_isExiting = a3;
}

- (BOOL)isExiting
{
  return self->_isExiting;
}

- (void)setIsPublished:(BOOL)a3
{
  self->_isPublished = a3;
}

- (BOOL)isPublished
{
  return self->_isPublished;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (BOOL)isInLocalMode
{
  return self->_isInLocalMode;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setIsOwned:(BOOL)a3
{
  self->_isOwned = a3;
}

- (BOOL)isOwned
{
  return self->_isOwned;
}

- (void)setIsInPreview:(BOOL)a3
{
  self->_isInPreview = a3;
}

- (BOOL)isInPreview
{
  return self->_isInPreview;
}

- (unint64_t)cloudItemCount
{
  return self->_cloudItemCount;
}

- (unint64_t)cloudVideoCount
{
  return self->_cloudVideoCount;
}

- (unint64_t)cloudPhotoCount
{
  return self->_cloudPhotoCount;
}

- (void)setRule:(id)a3
{
}

- (PXSharedLibraryRule)rule
{
  return self->_rule;
}

- (void)setParticipants:(id)a3
{
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setOwner:(id)a3
{
}

- (PXSharedLibraryParticipant)owner
{
  return self->_owner;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)removePersonUUIDsFromPersonCondition:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, void))a4;
  v8 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Removing personUUIDs: %@, from shared library: %@", (uint8_t *)&v9, 0x16u);
  }

  if (v7) {
    v7[2](v7, 1, 0);
  }
}

- (void)addPersonUUIDsToPersonCondition:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, void))a4;
  v8 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Adding personUUIDs: %@, from shared library: %@", (uint8_t *)&v9, 0x16u);
  }

  if (v7) {
    v7[2](v7, 1, 0);
  }
}

- (void)addAssetSharingSuggestions:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, void))a4;
  v8 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Adding sharing suggestions for assets: %@, from shared library: %@", (uint8_t *)&v9, 0x16u);
  }

  if (v7) {
    v7[2](v7, 1, 0);
  }
}

- (void)removeAssetSharingSuggestions:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, void))a4;
  v8 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Removing sharing suggestions for assets: %@, from shared library: %@", (uint8_t *)&v9, 0x16u);
  }

  if (v7) {
    v7[2](v7, 1, 0);
  }
}

- (BOOL)canRemoveAssetSharingSuggestions:(id)a3
{
  return 1;
}

- (void)moveAssetsToPersonalLibrary:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    v17 = self;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Moving assets: %@, from shared library: %@", buf, 0x16u);
  }

  if (v7)
  {
    int v9 = +[PXSharedLibrarySettings sharedInstance];
    uint64_t v10 = [v9 simulateErrorType];

    if (v10 == 25)
    {
      dispatch_time_t v11 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__PXSharedLibraryMock_moveAssetsToPersonalLibrary_completion___block_invoke;
      block[3] = &unk_1E5DD3128;
      id v13 = v7;
      dispatch_after(v11, MEMORY[0x1E4F14428], block);
    }
    else
    {
      (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
    }
  }
}

void __62__PXSharedLibraryMock_moveAssetsToPersonalLibrary_completion___block_invoke(uint64_t a1)
{
  v2 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Move Assets to Personal Library Failed", v4, 2u);
  }

  v3 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"Simulated Error: Move Assets to Personal Library Failed");
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)canMoveAssetsToPersonalLibrary:(id)a3
{
  return 1;
}

- (void)moveAssetsWithLocalIdentifiersToSharedLibrary:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  v8 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Moving assets with local identifiers: %@, to shared library: %@", (uint8_t *)&v9, 0x16u);
  }

  if (v7) {
    v7[2](v7, 1, 0);
  }
}

- (void)moveAssetsToSharedLibrary:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    v17 = self;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Moving assets: %@, to shared library: %@", buf, 0x16u);
  }

  if (v7)
  {
    int v9 = +[PXSharedLibrarySettings sharedInstance];
    uint64_t v10 = [v9 simulateErrorType];

    if (v10 == 25)
    {
      dispatch_time_t v11 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__PXSharedLibraryMock_moveAssetsToSharedLibrary_completion___block_invoke;
      block[3] = &unk_1E5DD3128;
      id v13 = v7;
      dispatch_after(v11, MEMORY[0x1E4F14428], block);
    }
    else
    {
      (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
    }
  }
}

void __60__PXSharedLibraryMock_moveAssetsToSharedLibrary_completion___block_invoke(uint64_t a1)
{
  v2 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Move Assets to Shared Library Failed", v4, 2u);
  }

  v3 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"Simulated Error: Move Assets to Shared Library Failed");
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)canMoveAssetsToSharedLibrary:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "participatesInLibraryScope", (void)v10))
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (void)deleteParticipants:(id)a3 presentationEnvironment:(id)a4 withCompletion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 count])
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXSharedLibraryMock.m", 240, @"Invalid parameter not satisfying: %@", @"participants.count" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"PXSharedLibraryMock.m", 241, @"Invalid parameter not satisfying: %@", @"presentationEnvironment" object file lineNumber description];

LABEL_3:
  long long v12 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "Deleting participants: %{public}@, from shared library: %@", buf, 0x16u);
  }

  long long v13 = +[PXSharedLibrarySettings sharedInstance];
  BOOL v14 = [v13 simulateErrorType] == 21;

  if (v14)
  {
    dispatch_time_t v15 = dispatch_time(0, 5000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__PXSharedLibraryMock_deleteParticipants_presentationEnvironment_withCompletion___block_invoke;
    block[3] = &unk_1E5DD3128;
    id v27 = v11;
    dispatch_after(v15, MEMORY[0x1E4F14428], block);
    id v16 = v27;
  }
  else
  {
    v17 = (void *)[(NSArray *)self->_participants mutableCopy];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v29 = __Block_byref_object_copy__214880;
    v30 = __Block_byref_object_dispose__214881;
    id v31 = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __81__PXSharedLibraryMock_deleteParticipants_presentationEnvironment_withCompletion___block_invoke_86;
    v23[3] = &unk_1E5DC5DE8;
    id v16 = v17;
    id v24 = v16;
    v25 = buf;
    [v9 enumerateObjectsUsingBlock:v23];
    uint64_t v18 = *(void *)(*(void *)&buf[8] + 40);
    if (!v18)
    {
      v19 = (NSArray *)[v16 copy];
      participants = self->_participants;
      self->_participants = v19;
    }
    if (v11) {
      (*((void (**)(id, BOOL, void))v11 + 2))(v11, v18 == 0, *(void *)(*(void *)&buf[8] + 40));
    }

    _Block_object_dispose(buf, 8);
  }
}

void __81__PXSharedLibraryMock_deleteParticipants_presentationEnvironment_withCompletion___block_invoke(uint64_t a1)
{
  v2 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Deleting Participants Failed", v4, 2u);
  }

  id v3 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"Simulated Error: Deleting Participants Failed");
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__PXSharedLibraryMock_deleteParticipants_presentationEnvironment_withCompletion___block_invoke_86(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__PXSharedLibraryMock_deleteParticipants_presentationEnvironment_withCompletion___block_invoke_2;
  v13[3] = &unk_1E5DC5DC0;
  id v14 = v6;
  id v8 = v6;
  uint64_t v9 = [v7 indexOfObjectPassingTest:v13];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"Failed to delete participants: Email address not found");
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
  }
  else
  {
    [*(id *)(a1 + 32) removeObjectAtIndex:v9];
  }
}

uint64_t __81__PXSharedLibraryMock_deleteParticipants_presentationEnvironment_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 emailAddress];
  uint64_t v4 = [*(id *)(a1 + 32) emailAddress];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (BOOL)canDeleteParticipants:(id)a3
{
  uint64_t v4 = [a3 indexOfObjectPassingTest:&__block_literal_global_214899];
  BOOL result = [(PXSharedLibraryMock *)self canEditParticipants];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  return result;
}

uint64_t __45__PXSharedLibraryMock_canDeleteParticipants___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCurrentUser];
}

- (void)addParticipantsWithEmailAddresses:(id)a3 phoneNumbers:(id)a4 presentationEnvironment:(id)a5 withCompletion:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (![v11 count])
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PXSharedLibraryMock.m", 201, @"Invalid parameter not satisfying: %@", @"emailAddresses.count > 0" object file lineNumber description];
  }
  if ([v12 count])
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PXSharedLibraryMock.m", 202, @"Invalid parameter not satisfying: %@", @"phoneNumbers.count == 0" object file lineNumber description];

    if (a5) {
      goto LABEL_5;
    }
  }
  else if (a5)
  {
    goto LABEL_5;
  }
  id v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"PXSharedLibraryMock.m", 203, @"Invalid parameter not satisfying: %@", @"presentationEnvironment" object file lineNumber description];

LABEL_5:
  id v14 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v30 = v11;
    __int16 v31 = 2112;
    uint64_t v32 = self;
    _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "Adding participants with email addresses: %{public}@, to shared library: %@", buf, 0x16u);
  }

  dispatch_time_t v15 = +[PXSharedLibrarySettings sharedInstance];
  uint64_t v16 = [v15 simulateErrorType];

  if (v16 == 21)
  {
    dispatch_time_t v17 = dispatch_time(0, 5000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __109__PXSharedLibraryMock_addParticipantsWithEmailAddresses_phoneNumbers_presentationEnvironment_withCompletion___block_invoke;
    block[3] = &unk_1E5DD3128;
    id v28 = v13;
    dispatch_after(v17, MEMORY[0x1E4F14428], block);
    id v18 = v28;
  }
  else
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __109__PXSharedLibraryMock_addParticipantsWithEmailAddresses_phoneNumbers_presentationEnvironment_withCompletion___block_invoke_76;
    v25[3] = &unk_1E5DCAEA0;
    id v18 = v19;
    id v26 = v18;
    [v11 enumerateObjectsUsingBlock:v25];
    v20 = [(NSArray *)self->_participants arrayByAddingObjectsFromArray:v18];
    participants = self->_participants;
    self->_participants = v20;

    if (v13) {
      (*((void (**)(id, uint64_t, void))v13 + 2))(v13, 1, 0);
    }
  }
}

void __109__PXSharedLibraryMock_addParticipantsWithEmailAddresses_phoneNumbers_presentationEnvironment_withCompletion___block_invoke(uint64_t a1)
{
  v2 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Adding Participants Failed", v4, 2u);
  }

  id v3 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"Simulated Error: Adding Participants Failed");
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __109__PXSharedLibraryMock_addParticipantsWithEmailAddresses_phoneNumbers_presentationEnvironment_withCompletion___block_invoke_76(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(PXSharedLibraryMockParticipant);
  [(PXSharedLibraryMockParticipant *)v4 setEmailAddress:v3];

  [*(id *)(a1 + 32) addObject:v4];
}

- (BOOL)canEditParticipants
{
  return [(PXSharedLibraryParticipant *)self->_owner isCurrentUser];
}

- (void)exitWithRetentionPolicy:(int64_t)a3 presentationEnvironment:(id)a4 progress:(id)a5 completion:(id)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a6;
  uint64_t v9 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = PXSharedLibraryExitRetentionPolicyDescription(a3);
    *(_DWORD *)buf = 138412546;
    dispatch_time_t v17 = self;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Exiting shared library: %@ with policy: %@", buf, 0x16u);
  }
  if (v8)
  {
    id v11 = +[PXSharedLibrarySettings sharedInstance];
    uint64_t v12 = [v11 simulateErrorType];

    if (v12 == 5)
    {
      dispatch_time_t v13 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __91__PXSharedLibraryMock_exitWithRetentionPolicy_presentationEnvironment_progress_completion___block_invoke;
      block[3] = &unk_1E5DD3128;
      id v15 = v8;
      dispatch_after(v13, MEMORY[0x1E4F14428], block);
    }
    else
    {
      (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 1, 0);
    }
  }
}

void __91__PXSharedLibraryMock_exitWithRetentionPolicy_presentationEnvironment_progress_completion___block_invoke(uint64_t a1)
{
  v2 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Exit Failed", v4, 2u);
  }

  id v3 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"Simulated Error: Exit Failed");
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)exitPreviewWithPresentationEnvironment:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    dispatch_time_t v13 = self;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Exiting shared library preview: %@", buf, 0xCu);
  }

  if (v5)
  {
    id v7 = +[PXSharedLibrarySettings sharedInstance];
    uint64_t v8 = [v7 simulateErrorType];

    if (v8 == 5)
    {
      dispatch_time_t v9 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__PXSharedLibraryMock_exitPreviewWithPresentationEnvironment_completion___block_invoke;
      block[3] = &unk_1E5DD3128;
      id v11 = v5;
      dispatch_after(v9, MEMORY[0x1E4F14428], block);
    }
    else
    {
      (*((void (**)(id, uint64_t, void))v5 + 2))(v5, 1, 0);
    }
  }
}

void __73__PXSharedLibraryMock_exitPreviewWithPresentationEnvironment_completion___block_invoke(uint64_t a1)
{
  v2 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Exit from Preview Failed", v4, 2u);
  }

  id v3 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"Simulated Error: Exit from Preview Failed");
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)publishPreviewWithPresentationEnvironment:(id)a3 progress:(id)a4 completion:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = self;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Publish shared library preview: %@", buf, 0xCu);
  }

  if (v6)
  {
    uint64_t v8 = +[PXSharedLibrarySettings sharedInstance];
    uint64_t v9 = [v8 simulateErrorType];

    if (v9 == 4)
    {
      dispatch_time_t v10 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __85__PXSharedLibraryMock_publishPreviewWithPresentationEnvironment_progress_completion___block_invoke;
      block[3] = &unk_1E5DD3128;
      id v12 = v6;
      dispatch_after(v10, MEMORY[0x1E4F14428], block);
    }
    else
    {
      [(PXSharedLibraryMock *)self setIsPublished:1];
      (*((void (**)(id, PXSharedLibraryMock *, void))v6 + 2))(v6, self, 0);
    }
  }
}

void __85__PXSharedLibraryMock_publishPreviewWithPresentationEnvironment_progress_completion___block_invoke(uint64_t a1)
{
  v2 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Publish Shared Library Preview Failed", v4, 2u);
  }

  id v3 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"Simulated Error: Publish Shared Library Preview Failed");
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)restoreDeclinedInvitationWithCompletion:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, PXSharedLibraryMock *, void))a3;
  id v5 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Restore previously declined shared library invitation: %@", (uint8_t *)&v6, 0xCu);
  }

  if (v4) {
    v4[2](v4, self, 0);
  }
}

- (void)declineInvitationWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = self;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Declining shared library invitation: %@", buf, 0xCu);
  }

  if (v4)
  {
    int v6 = +[PXSharedLibrarySettings sharedInstance];
    uint64_t v7 = [v6 simulateErrorType];

    if (v7 == 19)
    {
      uint64_t v8 = PLSharedLibraryGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "Simulated Error: Decline Invitation Failed", buf, 2u);
      }

      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"Simulated Error: Decline Invitation Failed");
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __55__PXSharedLibraryMock_declineInvitationWithCompletion___block_invoke;
      v11[3] = &unk_1E5DD3280;
      id v12 = v9;
      id v13 = v4;
      id v10 = v9;
      dispatch_async(MEMORY[0x1E4F14428], v11);
    }
    else
    {
      (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
    }
  }
}

uint64_t __55__PXSharedLibraryMock_declineInvitationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)acceptInvitationWithRule:(id)a3 progress:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = self;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Accepting shared library invitation: %@ with rule: %@", buf, 0x16u);
  }

  if (v8)
  {
    id v10 = +[PXSharedLibrarySettings sharedInstance];
    uint64_t v11 = [v10 simulateErrorType];

    if (v11 == 16)
    {
      id v12 = PLSharedLibraryGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "Simulated Error: Accept Invitation Failed", buf, 2u);
      }

      id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"Simulated Error: Accept Invitation Failed");
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__PXSharedLibraryMock_acceptInvitationWithRule_progress_completion___block_invoke;
      block[3] = &unk_1E5DD3280;
      id v19 = v13;
      id v20 = v8;
      id v14 = v13;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      dispatch_time_t v15 = dispatch_time(0, 3000000000);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __68__PXSharedLibraryMock_acceptInvitationWithRule_progress_completion___block_invoke_2;
      v16[3] = &unk_1E5DD3128;
      id v17 = v8;
      dispatch_after(v15, MEMORY[0x1E4F14428], v16);
      id v14 = v17;
    }
  }
}

uint64_t __68__PXSharedLibraryMock_acceptInvitationWithRule_progress_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __68__PXSharedLibraryMock_acceptInvitationWithRule_progress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)previewInvitationWithRule:(id)a3 progress:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = self;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Preview shared library invitation: %@ with rule: %@", buf, 0x16u);
  }

  if (v8)
  {
    id v10 = +[PXSharedLibrarySettings sharedInstance];
    uint64_t v11 = [v10 simulateErrorType];

    if (v11 == 3)
    {
      dispatch_time_t v12 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__PXSharedLibraryMock_previewInvitationWithRule_progress_completion___block_invoke;
      block[3] = &unk_1E5DD3128;
      id v14 = v8;
      dispatch_after(v12, MEMORY[0x1E4F14428], block);
    }
    else
    {
      (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 1, 0);
    }
  }
}

void __69__PXSharedLibraryMock_previewInvitationWithRule_progress_completion___block_invoke(uint64_t a1)
{
  v2 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Create Invitation Preview Failed", v4, 2u);
  }

  id v3 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"Simulated Error: Create Invitation Preview Failed");
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)fetchItemCounts
{
  *retstr = *($F99D9A4FB75BC57F3386B8DC8EE08D7A *)off_1E5DAAEE0;
  return self;
}

- (id)sourceLibraryInfo
{
  v2 = objc_alloc_init(PXSharedLibrarySourceLibraryInfoMock);
  return v2;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p, identifier:\"%@\", participants:%@, rule:%@>", objc_opt_class(), self, self->_identifier, self->_participants, self->_rule];
}

- (PXSharedLibraryMock)init
{
  v12.receiver = self;
  v12.super_class = (Class)PXSharedLibraryMock;
  v2 = [(PXSharedLibraryMock *)&v12 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F29128] UUID];
    id v4 = [v3 UUIDString];
    uint64_t v5 = [v4 copy];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://share.icloud.com/shared_library/123"];
    shareURL = v2->_shareURL;
    v2->_shareURL = (NSURL *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v2->_creationDate;
    v2->_creationDate = (NSDate *)v9;
  }
  return v2;
}

@end