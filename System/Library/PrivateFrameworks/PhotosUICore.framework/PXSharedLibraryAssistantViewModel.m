@interface PXSharedLibraryAssistantViewModel
+ (unint64_t)shareCountChangeDescriptors;
+ (unint64_t)suggestedStartDateChangeDescriptors;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)shareCounts;
- (BOOL)autoShareEnabled;
- (BOOL)hasChangedUserInputValues;
- (BOOL)isCancelingAssistant;
- (BOOL)previewIsOutdated;
- (NSArray)assetLocalIdentifiers;
- (NSArray)emailAddresses;
- (NSArray)infosWithBothPeopleAndParticipants;
- (NSArray)personUUIDs;
- (NSArray)phoneNumbers;
- (NSDate)startDate;
- (NSDate)suggestedStartDate;
- (NSString)localizedParticipantList;
- (PXSharedLibrary)sharedLibrary;
- (PXSharedLibraryAssistantViewModel)init;
- (PXSharedLibraryParticipantDataSource)participantDataSource;
- (PXSharedLibraryParticipantDataSourceManager)participantDataSourceManager;
- (PXSharedLibraryRule)sharedLibraryRule;
- (PXSharedLibrarySourceLibraryInfo)sourceLibraryInfo;
- (UIImage)participantsImage;
- (id)localizedSelectedPeopleWithAdditionalPeopleCount:(int64_t *)a3;
- (int64_t)autoSharePolicy;
- (int64_t)mode;
- (int64_t)selectedRuleType;
- (int64_t)shouldShowPeopleState;
- (void)_didChangePreviewRelatedProperty;
- (void)_didChangeShareCountRelatedProperty;
- (void)_didChangeSuggestedStartDateRelatedProperty;
- (void)_recalculateCustomShareCountsWithCompletion:(id)a3;
- (void)_recalculateEverythingShareCountsWithCompletion:(id)a3;
- (void)_recalculateManualSelectionShareCountsWithCompletion:(id)a3;
- (void)_recalculateShareCountsIfNeeded;
- (void)_recalculateSuggestedStartDateIfNeeded;
- (void)_setCachedShareCounts:(id *)a3;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)performChanges:(id)a3 shareCountsCompletionHandler:(id)a4;
- (void)performInitialChanges:(id)a3;
- (void)setAssetLocalIdentifiers:(id)a3;
- (void)setAutoShareEnabled:(BOOL)a3;
- (void)setAutoSharePolicy:(int64_t)a3;
- (void)setInfosWithBothPeopleAndParticipants:(id)a3;
- (void)setIsCancelingAssistant:(BOOL)a3;
- (void)setMode:(int64_t)a3;
- (void)setParticipantDataSource:(id)a3;
- (void)setParticipantsImage:(id)a3;
- (void)setPersonUUIDs:(id)a3;
- (void)setSelectedRuleType:(int64_t)a3;
- (void)setSharedLibrary:(id)a3;
- (void)setShouldShowPeopleState:(int64_t)a3;
- (void)setSourceLibraryInfo:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setSuggestedStartDate:(id)a3;
@end

@implementation PXSharedLibraryAssistantViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedStartDate, 0);
  objc_storeStrong((id *)&self->_infosWithBothPeopleAndParticipants, 0);
  objc_storeStrong((id *)&self->_assetLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourceLibraryInfo, 0);
  objc_storeStrong((id *)&self->_sharedLibrary, 0);
  objc_storeStrong((id *)&self->_participantsImage, 0);
  objc_storeStrong((id *)&self->_personUUIDs, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_shareCountsCompletionHandler, 0);
  objc_storeStrong((id *)&self->_participantDataSourceManager, 0);
}

- (NSDate)suggestedStartDate
{
  return self->_suggestedStartDate;
}

- (void)setShouldShowPeopleState:(int64_t)a3
{
  self->_shouldShowPeopleState = a3;
}

- (BOOL)previewIsOutdated
{
  return self->_previewIsOutdated;
}

- (NSArray)infosWithBothPeopleAndParticipants
{
  return self->_infosWithBothPeopleAndParticipants;
}

- (BOOL)isCancelingAssistant
{
  return self->_isCancelingAssistant;
}

- (int64_t)selectedRuleType
{
  return self->_selectedRuleType;
}

- (NSArray)assetLocalIdentifiers
{
  return self->_assetLocalIdentifiers;
}

- (PXSharedLibrarySourceLibraryInfo)sourceLibraryInfo
{
  return self->_sourceLibraryInfo;
}

- (PXSharedLibrary)sharedLibrary
{
  return self->_sharedLibrary;
}

- (PXSharedLibraryParticipantDataSourceManager)participantDataSourceManager
{
  return self->_participantDataSourceManager;
}

- (UIImage)participantsImage
{
  return self->_participantsImage;
}

- (NSArray)personUUIDs
{
  return self->_personUUIDs;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (BOOL)autoShareEnabled
{
  return self->_autoShareEnabled;
}

- (int64_t)autoSharePolicy
{
  return self->_autoSharePolicy;
}

- (int64_t)mode
{
  return self->_mode;
}

- (BOOL)hasChangedUserInputValues
{
  return self->_hasChangedUserInputValues;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)_PXSharedLibraryParticipantDataSourceManagerObservationContext != a5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryAssistantViewModel.m" lineNumber:461 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v10 = v9;
  if (v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__PXSharedLibraryAssistantViewModel_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E5DD07C0;
    v12[4] = self;
    [(PXSharedLibraryAssistantViewModel *)self performChanges:v12];
    [(PXSharedLibraryAssistantViewModel *)self _didChangePreviewRelatedProperty];
  }
}

uint64_t __66__PXSharedLibraryAssistantViewModel_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalChange:32];
}

- (void)_recalculateSuggestedStartDateIfNeeded
{
  uint64_t v3 = [(PXSharedLibraryAssistantViewModel *)self currentChanges];
  if (([(id)objc_opt_class() suggestedStartDateChangeDescriptors] & v3) != 0
    && !self->_suggestedStartDate)
  {
    objc_initWeak(&location, self);
    v4 = [(PXSharedLibraryAssistantViewModel *)self sourceLibraryInfo];
    v5 = [(PXSharedLibraryAssistantViewModel *)self personUUIDs];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75__PXSharedLibraryAssistantViewModel__recalculateSuggestedStartDateIfNeeded__block_invoke;
    v6[3] = &unk_1E5DD0798;
    objc_copyWeak(&v7, &location);
    [v4 fetchSuggestedStartDateForPersonUUIDs:v5 completion:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __75__PXSharedLibraryAssistantViewModel__recalculateSuggestedStartDateIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F1C9C8] now];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__PXSharedLibraryAssistantViewModel__recalculateSuggestedStartDateIfNeeded__block_invoke_2;
  v8[3] = &unk_1E5DD0770;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  id v6 = v3;
  id v9 = v6;
  id v7 = v4;
  id v10 = v7;
  [WeakRetained performChanges:v8];

  objc_destroyWeak(&v11);
}

void __75__PXSharedLibraryAssistantViewModel__recalculateSuggestedStartDateIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  if (v3)
  {
    v4 = [*(id *)(a1 + 32) earlierDate:*(void *)(a1 + 40)];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setSuggestedStartDate:v4];

  if (v3) {
}
  }

- (void)setSuggestedStartDate:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToDate:self->_suggestedStartDate] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_suggestedStartDate, a3);
    [(PXSharedLibraryAssistantViewModel *)self signalChange:0x2000];
  }
}

- (void)_didChangeSuggestedStartDateRelatedProperty
{
}

- (void)_recalculateManualSelectionShareCountsWithCompletion:(id)a3
{
  long long v10 = 0uLL;
  uint64_t v11 = 0;
  v4 = a3;
  id v5 = [(PXSharedLibraryAssistantViewModel *)self sourceLibraryInfo];
  id v6 = [(PXSharedLibraryAssistantViewModel *)self assetLocalIdentifiers];
  if (v5)
  {
    [v5 assetsCountsForAssetLocalIdentifiers:v6];
  }
  else
  {
    long long v10 = 0uLL;
    uint64_t v11 = 0;
  }

  id v7 = (void (*)(void *, long long *))v4[2];
  long long v8 = v10;
  uint64_t v9 = v11;
  v7(v4, &v8);
}

- (void)_recalculateCustomShareCountsWithCompletion:(id)a3
{
  id v8 = a3;
  v4 = [(PXSharedLibraryAssistantViewModel *)self startDate];
  id v5 = [(PXSharedLibraryAssistantViewModel *)self personUUIDs];
  id v6 = v5;
  if (v4 || [v5 count])
  {
    id v7 = [(PXSharedLibraryAssistantViewModel *)self sourceLibraryInfo];
    [v7 fetchEstimatedAssetsCountsForStartDate:v4 personUUIDs:v6 completion:v8];
  }
}

- (void)_recalculateEverythingShareCountsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PXSharedLibraryAssistantViewModel *)self sourceLibraryInfo];
  [v5 fetchEstimatedAssetsCountsShareEverythingPolicyWithCompletion:v4];
}

- (void)_recalculateShareCountsIfNeeded
{
  uint64_t v3 = [(PXSharedLibraryAssistantViewModel *)self currentChanges];
  if (([(id)objc_opt_class() shareCountChangeDescriptors] & v3) != 0)
  {
    BOOL v4 = self->_cachedShareCounts.photosCount == 0x7FFFFFFFFFFFFFFFLL
      || self->_cachedShareCounts.videosCount == 0x7FFFFFFFFFFFFFFFLL;
    if (v4 || self->_cachedShareCounts.othersCount == 0x7FFFFFFFFFFFFFFFLL)
    {
      id shareCountsCompletionHandler = self->_shareCountsCompletionHandler;
      if (shareCountsCompletionHandler)
      {
        id v7 = _Block_copy(shareCountsCompletionHandler);
        id v8 = self->_shareCountsCompletionHandler;
        self->_id shareCountsCompletionHandler = 0;
      }
      else
      {
        id v7 = 0;
      }
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      v14 = __68__PXSharedLibraryAssistantViewModel__recalculateShareCountsIfNeeded__block_invoke;
      v15 = &unk_1E5DD0748;
      v16 = self;
      id v17 = v7;
      id v9 = v7;
      long long v10 = _Block_copy(&v12);
      int64_t v11 = [(PXSharedLibraryAssistantViewModel *)self autoSharePolicy];
      switch(v11)
      {
        case 2:
          [(PXSharedLibraryAssistantViewModel *)self _recalculateCustomShareCountsWithCompletion:v10];
          break;
        case 1:
          [(PXSharedLibraryAssistantViewModel *)self _recalculateEverythingShareCountsWithCompletion:v10];
          break;
        case 0:
          [(PXSharedLibraryAssistantViewModel *)self _recalculateManualSelectionShareCountsWithCompletion:v10];
          break;
      }
    }
  }
}

void __68__PXSharedLibraryAssistantViewModel__recalculateShareCountsIfNeeded__block_invoke(uint64_t a1, long long *a2)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__PXSharedLibraryAssistantViewModel__recalculateShareCountsIfNeeded__block_invoke_2;
  v3[3] = &unk_1E5DD0720;
  v3[4] = v2;
  long long v5 = *a2;
  uint64_t v6 = *((void *)a2 + 2);
  id v4 = *(id *)(a1 + 40);
  [v2 performChanges:v3];
}

uint64_t __68__PXSharedLibraryAssistantViewModel__recalculateShareCountsIfNeeded__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 64);
  [v2 _setCachedShareCounts:&v4];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_setCachedShareCounts:(id *)a3
{
  if (self->_cachedShareCounts.photosCount != a3->var0
    || self->_cachedShareCounts.videosCount != a3->var1
    || self->_cachedShareCounts.othersCount != a3->var2)
  {
    long long v5 = *(_OWORD *)&a3->var0;
    self->_cachedShareCounts.othersCount = a3->var2;
    *(_OWORD *)&self->_cachedShareCounts.photosCount = v5;
    [(PXSharedLibraryAssistantViewModel *)self signalChange:2048];
  }
}

- (void)_didChangeShareCountRelatedProperty
{
  long long v2 = *(_OWORD *)off_1E5DAAEE0;
  uint64_t v3 = *((void *)off_1E5DAAEE0 + 2);
  [(PXSharedLibraryAssistantViewModel *)self _setCachedShareCounts:&v2];
}

- (void)_didChangePreviewRelatedProperty
{
  if (!self->_performingInitialChanges && !self->_previewIsOutdated)
  {
    uint64_t v3 = [(PXSharedLibraryAssistantViewModel *)self sharedLibrary];
    int v4 = [v3 isInPreview];

    if (v4) {
      self->_previewIsOutdated = 1;
    }
  }
}

- (void)setInfosWithBothPeopleAndParticipants:(id)a3
{
  id v8 = (NSArray *)a3;
  int v4 = self->_infosWithBothPeopleAndParticipants;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (NSArray *)[(NSArray *)v8 copy];
      infosWithBothPeopleAndParticipants = self->_infosWithBothPeopleAndParticipants;
      self->_infosWithBothPeopleAndParticipants = v6;

      [(PXSharedLibraryAssistantViewModel *)self signalChange:0x4000];
    }
  }
}

- (void)setSelectedRuleType:(int64_t)a3
{
  if (self->_selectedRuleType != a3)
  {
    self->_selectedRuleType = a3;
    [(PXSharedLibraryAssistantViewModel *)self signalChange:1024];
    [(PXSharedLibraryAssistantViewModel *)self _didChangePreviewRelatedProperty];
    [(PXSharedLibraryAssistantViewModel *)self _didChangeShareCountRelatedProperty];
  }
}

- (void)setSourceLibraryInfo:(id)a3
{
  char v5 = (PXSharedLibrarySourceLibraryInfo *)a3;
  if (self->_sourceLibraryInfo != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_sourceLibraryInfo, a3);
    [(PXSharedLibraryAssistantViewModel *)self signalChange:256];
    char v5 = v6;
  }
}

- (void)setSharedLibrary:(id)a3
{
  char v5 = (PXSharedLibrary *)a3;
  if (self->_sharedLibrary != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_sharedLibrary, a3);
    [(PXSharedLibraryAssistantViewModel *)self signalChange:64];
    int v6 = [(PXSharedLibrary *)self->_sharedLibrary isInPreview];
    char v5 = v7;
    if (v6) {
      self->_hasChangedUserInputValues = 1;
    }
  }
}

- (PXSharedLibraryParticipantDataSource)participantDataSource
{
  return (PXSharedLibraryParticipantDataSource *)[(PXSectionedDataSourceManager *)self->_participantDataSourceManager dataSource];
}

- (void)setParticipantDataSource:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantViewModel.m", 307, @"Invalid parameter not satisfying: %@", @"participantDataSource" object file lineNumber description];
  }
  participantDataSourceManager = self->_participantDataSourceManager;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PXSharedLibraryAssistantViewModel_setParticipantDataSource___block_invoke;
  v9[3] = &unk_1E5DD06F8;
  id v10 = v5;
  id v7 = v5;
  [(PXSharedLibraryParticipantDataSourceManager *)participantDataSourceManager performChanges:v9];
}

uint64_t __62__PXSharedLibraryAssistantViewModel_setParticipantDataSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 replaceDataSourceWithDataSource:*(void *)(a1 + 32)];
}

- (void)setIsCancelingAssistant:(BOOL)a3
{
  if (self->_isCancelingAssistant != a3)
  {
    self->_isCancelingAssistant = a3;
    [(PXSharedLibraryAssistantViewModel *)self signalChange:4096];
  }
}

- (void)setAutoShareEnabled:(BOOL)a3
{
  if (self->_autoShareEnabled != a3)
  {
    self->_autoShareEnabled = a3;
    [(PXSharedLibraryAssistantViewModel *)self signalChange:2];
  }
}

- (void)setAssetLocalIdentifiers:(id)a3
{
  id v8 = (NSArray *)a3;
  id v5 = self->_assetLocalIdentifiers;
  if (v5 == v8)
  {
  }
  else
  {
    int v6 = v5;
    char v7 = [(NSArray *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_assetLocalIdentifiers, a3);
      [(PXSharedLibraryAssistantViewModel *)self signalChange:512];
      [(PXSharedLibraryAssistantViewModel *)self _didChangePreviewRelatedProperty];
      [(PXSharedLibraryAssistantViewModel *)self _didChangeShareCountRelatedProperty];
    }
  }
}

- (void)setParticipantsImage:(id)a3
{
  id v8 = (UIImage *)a3;
  int v4 = self->_participantsImage;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(UIImage *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      int v6 = (UIImage *)[(UIImage *)v8 copy];
      participantsImage = self->_participantsImage;
      self->_participantsImage = v6;

      [(PXSharedLibraryAssistantViewModel *)self signalChange:16];
    }
  }
}

- (void)setPersonUUIDs:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantViewModel.m", 260, @"Invalid parameter not satisfying: %@", @"personUUIDs" object file lineNumber description];

    id v5 = 0;
  }
  int v6 = (NSArray *)[v5 copy];
  personUUIDs = self->_personUUIDs;
  self->_personUUIDs = v6;

  [(PXSharedLibraryAssistantViewModel *)self signalChange:8];
  [(PXSharedLibraryAssistantViewModel *)self _didChangeSuggestedStartDateRelatedProperty];
  [(PXSharedLibraryAssistantViewModel *)self _didChangePreviewRelatedProperty];
  [(PXSharedLibraryAssistantViewModel *)self _didChangeShareCountRelatedProperty];
}

- (void)setStartDate:(id)a3
{
  id v8 = (NSDate *)a3;
  int v4 = self->_startDate;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDate *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      int v6 = (NSDate *)[(NSDate *)v8 copy];
      startDate = self->_startDate;
      self->_startDate = v6;

      [(PXSharedLibraryAssistantViewModel *)self signalChange:4];
      [(PXSharedLibraryAssistantViewModel *)self _didChangePreviewRelatedProperty];
      [(PXSharedLibraryAssistantViewModel *)self _didChangeShareCountRelatedProperty];
    }
  }
}

- (void)setAutoSharePolicy:(int64_t)a3
{
  if (self->_autoSharePolicy != a3)
  {
    self->_autoSharePolicy = a3;
    [(PXSharedLibraryAssistantViewModel *)self signalChange:128];
    [(PXSharedLibraryAssistantViewModel *)self _didChangePreviewRelatedProperty];
    [(PXSharedLibraryAssistantViewModel *)self _didChangeShareCountRelatedProperty];
  }
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    [(PXSharedLibraryAssistantViewModel *)self signalChange:1];
  }
}

- (void)performInitialChanges:(id)a3
{
  id v4 = a3;
  BOOL performingInitialChanges = self->_performingInitialChanges;
  self->_BOOL performingInitialChanges = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__PXSharedLibraryAssistantViewModel_performInitialChanges___block_invoke;
  v7[3] = &unk_1E5DD06D0;
  id v8 = v4;
  id v6 = v4;
  [(PXSharedLibraryAssistantViewModel *)self performChanges:v7];
  self->_BOOL performingInitialChanges = performingInitialChanges;
}

uint64_t __59__PXSharedLibraryAssistantViewModel_performInitialChanges___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibraryAssistantViewModel;
  [(PXSharedLibraryAssistantViewModel *)&v3 didPerformChanges];
  if (!self->_performingInitialChanges && !self->_hasChangedUserInputValues) {
    self->_hasChangedUserInputValues = ([(PXSharedLibraryAssistantViewModel *)self currentChanges] & 0x6AE) != 0;
  }
  [(PXSharedLibraryAssistantViewModel *)self _recalculateShareCountsIfNeeded];
  [(PXSharedLibraryAssistantViewModel *)self _recalculateSuggestedStartDateIfNeeded];
}

- (void)performChanges:(id)a3 shareCountsCompletionHandler:(id)a4
{
  id v6 = a3;
  char v7 = (void *)[a4 copy];
  id shareCountsCompletionHandler = self->_shareCountsCompletionHandler;
  self->_id shareCountsCompletionHandler = v7;

  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibraryAssistantViewModel;
  [(PXSharedLibraryAssistantViewModel *)&v11 performChanges:v6];

  id v9 = (void (**)(void))self->_shareCountsCompletionHandler;
  if (v9)
  {
    v9[2]();
    id v10 = self->_shareCountsCompletionHandler;
    self->_id shareCountsCompletionHandler = 0;
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibraryAssistantViewModel;
  [(PXSharedLibraryAssistantViewModel *)&v3 performChanges:a3];
}

- (NSArray)phoneNumbers
{
  long long v2 = [(PXSharedLibraryAssistantViewModel *)self participantDataSource];
  objc_super v3 = [v2 phoneNumbers];
  id v4 = [v3 allObjects];

  return (NSArray *)v4;
}

- (NSArray)emailAddresses
{
  long long v2 = [(PXSharedLibraryAssistantViewModel *)self participantDataSource];
  objc_super v3 = [v2 emailAddresses];
  id v4 = [v3 allObjects];

  return (NSArray *)v4;
}

- (int64_t)shouldShowPeopleState
{
  int64_t result = self->_shouldShowPeopleState;
  if (!result)
  {
    id v4 = [(PXSharedLibraryAssistantViewModel *)self sourceLibraryInfo];
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }

    id v6 = [v5 photoLibrary];

    if (v6)
    {
      char v7 = [[PXPeopleProgressManager alloc] initWithPhotoLibrary:v6];
      BOOL v8 = [(PXPeopleProgressManager *)v7 featureUnlocked];
      int64_t v9 = 1;
      if (!v8) {
        int64_t v9 = 2;
      }
      self->_shouldShowPeopleState = v9;
    }
    else
    {
      self->_shouldShowPeopleState = 2;
    }

    return self->_shouldShowPeopleState;
  }
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)shareCounts
{
  *retstr = *($F99D9A4FB75BC57F3386B8DC8EE08D7A *)off_1E5DAAEE8;
  id v5 = [(PXSharedLibraryAssistantViewModel *)self sharedLibrary];
  if ([v5 isInPreview]) {
    BOOL v6 = !self->_previewIsOutdated;
  }
  else {
    BOOL v6 = 0;
  }

  char v7 = [(PXSharedLibraryAssistantViewModel *)self sharedLibrary];
  if ([v7 isPublished])
  {
    BOOL v8 = [(PXSharedLibraryAssistantViewModel *)self sharedLibrary];
    int v9 = [v8 isOwned];
  }
  else
  {
    int v9 = 0;
  }

  if ((v6 | v9) == 1)
  {
    objc_super v11 = [(PXSharedLibraryAssistantViewModel *)self sharedLibrary];
    uint64_t v12 = v11;
    if (v11)
    {
      [v11 fetchItemCounts];
    }
    else
    {
      long long v13 = 0uLL;
      unint64_t v14 = 0;
    }
    *(_OWORD *)&retstr->var0 = v13;
    retstr->var2 = v14;
  }
  else
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_cachedShareCounts.photosCount;
    retstr->var2 = self->_cachedShareCounts.othersCount;
  }
  return result;
}

- (NSString)localizedParticipantList
{
  long long v2 = [(PXSharedLibraryAssistantViewModel *)self participantDataSource];
  objc_super v3 = [v2 names];

  id v4 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v3];

  return (NSString *)v4;
}

- (id)localizedSelectedPeopleWithAdditionalPeopleCount:(int64_t *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantViewModel.m", 110, @"Invalid parameter not satisfying: %@", @"additionalPeopleCount" object file lineNumber description];
  }
  id v5 = [(PXSharedLibraryAssistantViewModel *)self sourceLibraryInfo];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  char v7 = [v6 photoLibrary];

  if (v7)
  {
    BOOL v8 = [(PXSharedLibraryAssistantViewModel *)self personUUIDs];
    int v9 = [v7 librarySpecificFetchOptions];
    id v10 = [MEMORY[0x1E4F391F0] fetchPersonsWithLocalIdentifiers:v8 options:v9];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "px_localizedName");
          if ([v17 length])
          {
            [v11 addObject:v17];
            if ((unint64_t)[v11 count] >= 3)
            {

              goto LABEL_20;
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_20:

    uint64_t v19 = [v12 count];
    int64_t v18 = v19 - [v11 count];

    if (v18 && [v11 count] == 3)
    {
      ++v18;
      uint64_t v20 = objc_msgSend(v11, "subarrayWithRange:", 0, objc_msgSend(v11, "count") - 1);

      id v11 = (id)v20;
    }
  }
  else
  {
    int64_t v18 = 0;
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }
  *a3 = v18;

  return v11;
}

- (PXSharedLibraryRule)sharedLibraryRule
{
  int64_t v3 = [(PXSharedLibraryAssistantViewModel *)self autoSharePolicy];
  if (v3 == 2)
  {
    id v6 = [(PXSharedLibraryAssistantViewModel *)self startDate];
    char v7 = [(PXSharedLibraryAssistantViewModel *)self personUUIDs];
    id v5 = +[PXSharedLibraryRule customizedRuleWithStartDate:v6 personUUIDs:v7];
  }
  else if (v3 == 1)
  {
    id v5 = +[PXSharedLibraryRule everythingRule];
  }
  else if (v3)
  {
    id v5 = 0;
  }
  else
  {
    id v4 = [(PXSharedLibraryAssistantViewModel *)self assetLocalIdentifiers];
    id v5 = +[PXSharedLibraryRule manualRuleWithAssetLocalIdentifiers:v4];
  }
  return (PXSharedLibraryRule *)v5;
}

- (PXSharedLibraryAssistantViewModel)init
{
  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryAssistantViewModel;
  long long v2 = [(PXSharedLibraryAssistantViewModel *)&v10 init];
  int64_t v3 = v2;
  if (v2)
  {
    v2->_mode = 0;
    v2->_autoSharePolicy = 0;
    personUUIDs = v2->_personUUIDs;
    v2->_personUUIDs = (NSArray *)MEMORY[0x1E4F1CBF0];

    v3->_autoShareEnabled = 0;
    id v5 = objc_alloc_init(PXSharedLibraryParticipantDataSourceManager);
    participantDataSourceManager = v3->_participantDataSourceManager;
    v3->_participantDataSourceManager = v5;

    [(PXSectionedDataSourceManager *)v3->_participantDataSourceManager registerChangeObserver:v3 context:_PXSharedLibraryParticipantDataSourceManagerObservationContext];
    v3->_selectedRuleType = 0;
    v3->_cachedShareCounts.othersCount = *((void *)off_1E5DAAEE0 + 2);
    *(_OWORD *)&v3->_cachedShareCounts.photosCount = *(_OWORD *)off_1E5DAAEE0;
    char v7 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    infosWithBothPeopleAndParticipants = v3->_infosWithBothPeopleAndParticipants;
    v3->_infosWithBothPeopleAndParticipants = v7;
  }
  return v3;
}

+ (unint64_t)suggestedStartDateChangeDescriptors
{
  return 136;
}

+ (unint64_t)shareCountChangeDescriptors
{
  return 2764;
}

@end