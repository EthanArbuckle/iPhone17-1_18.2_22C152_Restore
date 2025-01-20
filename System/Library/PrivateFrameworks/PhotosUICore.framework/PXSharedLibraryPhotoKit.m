@interface PXSharedLibraryPhotoKit
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)fetchItemCounts;
- (BOOL)canAddParticipantsWithEmailAddresses:(id)a3 phoneNumbers:(id)a4;
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
- (PHLibraryScope)libraryScope;
- (PXSharedLibraryParticipant)owner;
- (PXSharedLibraryPhotoKit)init;
- (PXSharedLibraryPhotoKit)initWithLibraryScope:(id)a3;
- (PXSharedLibraryRule)rule;
- (id)sourceLibraryInfo;
- (unint64_t)cloudItemCount;
- (unint64_t)cloudPhotoCount;
- (unint64_t)cloudVideoCount;
- (void)_updateOwner;
- (void)_updateParticipants;
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
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
- (void)previewInvitationWithRule:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)publishPreviewWithPresentationEnvironment:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)removeAssetSharingSuggestions:(id)a3 completion:(id)a4;
- (void)removePersonUUIDsFromPersonCondition:(id)a3 completion:(id)a4;
- (void)restoreDeclinedInvitationWithCompletion:(id)a3;
@end

@implementation PXSharedLibraryPhotoKit

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryScope, 0);
  objc_storeStrong((id *)&self->_rule, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_owner, 0);
}

- (PHLibraryScope)libraryScope
{
  return self->_libraryScope;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  v4 = [a3 changeDetailsForFetchResult:self->_participants];
  if (v4)
  {
    id v8 = v4;
    v5 = [v4 fetchResultAfterChanges];
    participants = self->_participants;
    self->_participants = v5;

    [(PXSharedLibraryPhotoKit *)self _updateOwner];
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"PXSharedLibraryParticipantsDidChange" object:self userInfo:0];

    v4 = v8;
  }
}

- (void)_updateParticipants
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (!self->_participants)
  {
    v3 = [(PHLibraryScope *)self->_libraryScope photoLibrary];
    objc_msgSend(v3, "px_registerChangeObserver:", self);
  }
  v4 = [(PHLibraryScope *)self->_libraryScope photoLibrary];
  v5 = [v4 librarySpecificFetchOptions];

  v6 = (void *)MEMORY[0x1E4F29008];
  v7 = NSStringFromSelector(sel_isCurrentUser);
  id v8 = [v6 sortDescriptorWithKey:v7 ascending:0];
  v12[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v5 setSortDescriptors:v9];

  v10 = [MEMORY[0x1E4F392E8] fetchParticipantsInShare:self->_libraryScope options:v5];
  participants = self->_participants;
  self->_participants = v10;

  [(PXSharedLibraryPhotoKit *)self _updateOwner];
  [(PHLibraryScope *)self->_libraryScope previewState];
}

- (void)_updateOwner
{
  participants = self->_participants;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__PXSharedLibraryPhotoKit__updateOwner__block_invoke;
  v3[3] = &unk_1E5DB7CA8;
  v3[4] = self;
  [(PHFetchResult *)participants enumerateObjectsUsingBlock:v3];
}

void __39__PXSharedLibraryPhotoKit__updateOwner__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ([v9 role] == 1)
  {
    uint64_t v6 = [v9 copy];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 8);
    *(void *)(v7 + 8) = v6;

    *a4 = 1;
  }
}

- (void)removePersonUUIDsFromPersonCondition:(id)a3 completion:(id)a4
{
}

- (void)addPersonUUIDsToPersonCondition:(id)a3 completion:(id)a4
{
}

- (void)addAssetSharingSuggestions:(id)a3 completion:(id)a4
{
}

- (void)removeAssetSharingSuggestions:(id)a3 completion:(id)a4
{
}

- (BOOL)canRemoveAssetSharingSuggestions:(id)a3
{
  return PXSharedLibraryCanRejectAssetsSharingSuggestionsForLibraryScope((uint64_t)self, a3);
}

- (void)moveAssetsToPersonalLibrary:(id)a3 completion:(id)a4
{
}

- (BOOL)canMoveAssetsToPersonalLibrary:(id)a3
{
  return PXSharedLibraryCanMoveAssetsToSPLPersonalLibrary(self->_libraryScope, a3);
}

- (void)moveAssetsWithLocalIdentifiersToSharedLibrary:(id)a3 completion:(id)a4
{
}

- (void)moveAssetsToSharedLibrary:(id)a3 completion:(id)a4
{
}

- (BOOL)canMoveAssetsToSharedLibrary:(id)a3
{
  return PXSharedLibraryCanMoveAssetsToLibraryScope(self->_libraryScope, a3);
}

- (void)deleteParticipants:(id)a3 presentationEnvironment:(id)a4 withCompletion:(id)a5
{
}

- (BOOL)canDeleteParticipants:(id)a3
{
  return PXSharedLibraryCanDeleteParticipantsFromLibraryScope(self->_libraryScope, a3);
}

- (void)addParticipantsWithEmailAddresses:(id)a3 phoneNumbers:(id)a4 presentationEnvironment:(id)a5 withCompletion:(id)a6
{
}

- (BOOL)canAddParticipantsWithEmailAddresses:(id)a3 phoneNumbers:(id)a4
{
  return PXSharedLibraryCanAddParticipantsToLibraryScope(self->_libraryScope, a3, a4);
}

- (BOOL)canEditParticipants
{
  return PXSharedLibraryCanEditParticipantsInLibraryScope(self->_libraryScope);
}

- (void)exitWithRetentionPolicy:(int64_t)a3 presentationEnvironment:(id)a4 progress:(id)a5 completion:(id)a6
{
  if (a3 == 2) {
    unint64_t v6 = 2;
  }
  else {
    unint64_t v6 = a3 == 1;
  }
  PXSharedLibraryExitLibraryScope(self->_libraryScope, v6, a5, a4, a6);
}

- (void)exitPreviewWithPresentationEnvironment:(id)a3 completion:(id)a4
{
}

- (void)publishPreviewWithPresentationEnvironment:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8 = a5;
  libraryScope = self->_libraryScope;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__PXSharedLibraryPhotoKit_publishPreviewWithPresentationEnvironment_progress_completion___block_invoke;
  v11[3] = &unk_1E5DCDEA0;
  id v12 = v8;
  id v10 = v8;
  PXSharedLibraryPublishPreviewLibraryScope(libraryScope, a4, a3, v11);
}

void __89__PXSharedLibraryPhotoKit_publishPreviewWithPresentationEnvironment_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    v3 = [[PXSharedLibraryPhotoKit alloc] initWithLibraryScope:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)restoreDeclinedInvitationWithCompletion:(id)a3
{
  id v4 = a3;
  libraryScope = self->_libraryScope;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__PXSharedLibraryPhotoKit_restoreDeclinedInvitationWithCompletion___block_invoke;
  v7[3] = &unk_1E5DCDEA0;
  id v8 = v4;
  id v6 = v4;
  PXSharedLibraryRestoreDeclinedLibraryScopeInvitation(libraryScope, v7);
}

void __67__PXSharedLibraryPhotoKit_restoreDeclinedInvitationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    v3 = [[PXSharedLibraryPhotoKit alloc] initWithLibraryScope:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)declineInvitationWithCompletion:(id)a3
{
}

- (void)acceptInvitationWithRule:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(PXSharedLibraryPhotoKit *)self isInPreview])
  {
    PXSharedLibraryAcceptLibraryScopeInvitationPreview(self->_libraryScope, v9);
  }
  else
  {
    uint64_t v10 = [v14 autoSharePolicy];
    if (v10 == 2) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v10 == 1;
    }
    id v12 = [v14 startDate];
    v13 = [v14 personUUIDs];
    PXSharedLibraryAcceptLibraryScopeInvitation(self->_libraryScope, v11, v12, v13, v8, v9);
  }
}

- (void)previewInvitationWithRule:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 autoSharePolicy];
  if (v11 == 2) {
    __int16 v12 = 2;
  }
  else {
    __int16 v12 = v11 == 1;
  }
  id v14 = [v10 startDate];
  v13 = [v10 personUUIDs];

  PXSharedLibraryPreviewLibraryScopeInvitation(self->_libraryScope, v12, v14, v13, v9, v8);
}

- (id)sourceLibraryInfo
{
  v3 = [PXSharedLibrarySourceLibraryInfoPhotoKit alloc];
  id v4 = [(PXSharedLibraryPhotoKit *)self libraryScope];
  v5 = [v4 photoLibrary];
  id v6 = [(PXSharedLibrarySourceLibraryInfoPhotoKit *)v3 initWithPhotoLibrary:v5];

  return v6;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)fetchItemCounts
{
  id v4 = [(PXSharedLibraryPhotoKit *)self libraryScope];
  v5 = [v4 photoLibrary];
  id v12 = [v5 librarySpecificFetchOptions];

  id v6 = [MEMORY[0x1E4F8A950] predicateToIncludeSharedLibraryAssetsAllowingIndexingOnParticipationState:1];
  [v12 setInternalPredicate:v6];

  uint64_t v7 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v12];
  *retstr = *($F99D9A4FB75BC57F3386B8DC8EE08D7A *)off_1E5DAAEE8;
  if ([v7 count])
  {
    unint64_t v8 = [v7 countOfAssetsWithMediaType:1];
    unint64_t v9 = [v7 countOfAssetsWithMediaType:2];
    unint64_t v10 = [v7 countOfAssetsWithMediaType:3];
    retstr->var0 = v8;
    retstr->var1 = v9;
    retstr->var2 = v10;
  }

  return result;
}

- (NSDate)creationDate
{
  return (NSDate *)[(PHLibraryScope *)self->_libraryScope creationDate];
}

- (BOOL)isOwned
{
  return [(PHLibraryScope *)self->_libraryScope status] == 1;
}

- (BOOL)isDeclined
{
  return [(PHLibraryScope *)self->_libraryScope trashedState] == 1;
}

- (BOOL)isExiting
{
  return [(PHLibraryScope *)self->_libraryScope exitState] != 0;
}

- (BOOL)isPublished
{
  return [(PHLibraryScope *)self->_libraryScope publishState] == 2;
}

- (BOOL)isInLocalMode
{
  return [(PHLibraryScope *)self->_libraryScope libraryScopeInLocalMode];
}

- (NSURL)shareURL
{
  return (NSURL *)[(PHLibraryScope *)self->_libraryScope shareURL];
}

- (unint64_t)cloudItemCount
{
  return [(PHLibraryScope *)self->_libraryScope cloudItemCount];
}

- (unint64_t)cloudVideoCount
{
  return [(PHLibraryScope *)self->_libraryScope cloudVideoCount];
}

- (unint64_t)cloudPhotoCount
{
  return [(PHLibraryScope *)self->_libraryScope cloudPhotoCount];
}

- (BOOL)isInPreview
{
  return [(PHLibraryScope *)self->_libraryScope previewState] == 1;
}

- (PXSharedLibraryRule)rule
{
  rule = self->_rule;
  if (!rule)
  {
    id v4 = self->_libraryScope;
    int v5 = [(PHLibraryScope *)v4 autoSharePolicy];
    uint64_t v6 = v5 == 1;
    if (v5 == 2) {
      uint64_t v6 = 2;
    }
    if (v6 == 2)
    {
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__85283;
      v23 = __Block_byref_object_dispose__85284;
      id v24 = 0;
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v9 = [(PHLibraryScope *)v4 photoLibrary];
      unint64_t v10 = [v9 librarySpecificFetchOptions];

      uint64_t v11 = [MEMORY[0x1E4F39130] fetchLibraryScopeRulesForLibraryScope:v4 options:v10];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = ___RuleForLibraryScope_block_invoke;
      v15[3] = &unk_1E5DB7CD8;
      v18 = &v19;
      v16 = v4;
      id v12 = v8;
      id v17 = v12;
      [v11 enumerateObjectsUsingBlock:v15];
      uint64_t v7 = +[PXSharedLibraryRule customizedRuleWithStartDate:v20[5] personUUIDs:v12];

      _Block_object_dispose(&v19, 8);
    }
    else
    {
      if (v6 == 1) {
        +[PXSharedLibraryRule everythingRule];
      }
      else {
      uint64_t v7 = +[PXSharedLibraryRule manualRule];
      }
    }

    v13 = self->_rule;
    self->_rule = v7;

    rule = self->_rule;
  }
  return rule;
}

- (NSArray)participants
{
  participants = self->_participants;
  if (!participants)
  {
    [(PXSharedLibraryPhotoKit *)self _updateParticipants];
    participants = self->_participants;
  }
  return (NSArray *)[(PHFetchResult *)participants fetchedObjects];
}

- (PXSharedLibraryParticipant)owner
{
  owner = self->_owner;
  if (!owner)
  {
    [(PXSharedLibraryPhotoKit *)self _updateParticipants];
    owner = self->_owner;
  }
  return owner;
}

- (NSString)identifier
{
  return (NSString *)[(PHLibraryScope *)self->_libraryScope uuid];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p, libraryScope:\"%@\", owner:%@, participants:%@, rule:%@>", objc_opt_class(), self, self->_libraryScope, self->_owner, self->_participants, self->_rule];
}

- (PXSharedLibraryPhotoKit)initWithLibraryScope:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXSharedLibraryPhotoKit.m", 46, @"Invalid parameter not satisfying: %@", @"libraryScope" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibraryPhotoKit;
  uint64_t v7 = [(PXSharedLibraryPhotoKit *)&v11 init];
  id v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_libraryScope, a3);
  }

  return v8;
}

- (PXSharedLibraryPhotoKit)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibraryPhotoKit.m", 42, @"%s is not available as initializer", "-[PXSharedLibraryPhotoKit init]");

  abort();
}

@end