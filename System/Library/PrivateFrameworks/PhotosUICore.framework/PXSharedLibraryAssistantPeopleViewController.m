@interface PXSharedLibraryAssistantPeopleViewController
+ (id)_fetchedPeople:(id)a3 sortedByLocalIdentifiers:(id)a4;
- (BOOL)_hasPeople;
- (BOOL)_isPeopleCellRepresentedAtSection:(int64_t)a3;
- (NSString)textForFooter;
- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate;
- (PXSharedLibraryAssistantPeopleViewController)initWithViewModel:(id)a3;
- (PXSharedLibraryAssistantViewModel)viewModel;
- (PXSharedLibraryIncludedPeopleDataSourceManager)dataSourceManager;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)alertConfigurationForIdentifyingPeopleInfos:(id)a3 action:(id)a4;
- (id)peopleInfosToIdentifyInDataSource:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_advanceToNextStep;
- (void)_fixupStalePersonForUUID:(id)a3 loneParticipantInfo:(id)a4;
- (void)_presentPickerForInfos:(id)a3;
- (void)_suggestedStartDateChanged;
- (void)_updateButtonCell;
- (void)_updateContinueButton;
- (void)_updateFooterText;
- (void)_updateHeaderDetailText;
- (void)addLaterButtonTapped:(id)a3;
- (void)completeRulesStep;
- (void)continueButtonTapped:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)setAssistantViewControllerDelegate:(id)a3;
- (void)setupLibraryChangeListening;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateWithPerson:(id)a3 loneParticipantInfo:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PXSharedLibraryAssistantPeopleViewController

- (void)_fixupStalePersonForUUID:(id)a3 loneParticipantInfo:(id)a4
{
  id v46 = a3;
  id v7 = a4;
  v8 = [(PXSharedLibraryAssistantPeopleViewController *)self viewModel];
  v9 = [(PXSharedLibraryAssistantPeopleViewController *)self dataSourceManager];
  v10 = [v8 sourceLibraryInfo];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    v35 = (objc_class *)objc_opt_class();
    v34 = NSStringFromClass(v35);
    v36 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v32 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantPeopleViewController+Internal.m", 110, @"%@ should be an instance inheriting from %@, but it is %@", @"viewModel.sourceLibraryInfo", v34, v36 object file lineNumber description];
  }
  else
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    v33 = (objc_class *)objc_opt_class();
    v34 = NSStringFromClass(v33);
    [v32 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantPeopleViewController+Internal.m", 110, @"%@ should be an instance inheriting from %@, but it is nil", @"viewModel.sourceLibraryInfo", v34 object file lineNumber description];
  }

LABEL_3:
  SEL v40 = a2;
  v11 = [v10 photoLibrary];
  v12 = [v11 librarySpecificFetchOptions];

  v13 = [v9 dataSource];
  v14 = [v13 allPersonUUIDs];

  v15 = [MEMORY[0x1E4F391F0] fetchFinalMergeTargetPersonsForPersonWithUUID:v46 options:v12];
  v16 = [v15 firstObject];

  if (!v7)
  {
    v17 = [v9 dataSource];
    v18 = [v17 infosWithoutPeople];
    id v7 = [v18 firstObject];
  }
  v45 = [v7 participant];
  v44 = v14;
  if (([v14 containsObject:v46] & 1) == 0)
  {
    v19 = [v16 uuid];
    char v20 = [v14 containsObject:v19];

    if ((v20 & 1) == 0)
    {
      v21 = [[PXSharedLibraryIncludedPeopleInfo alloc] initWithParticipant:v45 person:v16];
      [v9 replaceInfo:v7 withInfo:v21];
      goto LABEL_25;
    }
  }
  v41 = v12;
  v21 = [v16 uuid];
  v22 = [v9 dataSource];
  uint64_t v23 = [v22 infoForPersonUUID:v46];

  v24 = [v9 dataSource];
  uint64_t v25 = [v24 infoForPersonUUID:v21];

  v42 = v10;
  v43 = v8;
  if (!(v23 | v25))
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:v40, self, @"PXSharedLibraryAssistantPeopleViewController+Internal.m", 128, @"Invalid parameter not satisfying: %@", @"stalePersonInfo || refreshedPersonInfo" object file lineNumber description];

    goto LABEL_32;
  }
  if (v23 && !v25)
  {
    id v26 = (id)v23;
    goto LABEL_14;
  }
  if (v23 || !v25)
  {
LABEL_32:
    if (v7)
    {
      id v27 = (id)v25;
      if ([v46 isEqualToString:v21]) {
        v38 = 0;
      }
      else {
        v38 = (void *)v23;
      }
      id v30 = v38;
      id v31 = v7;
      v29 = [[PXSharedLibraryIncludedPeopleInfo alloc] initWithParticipant:v45 person:v16];
      if (v27) {
        goto LABEL_16;
      }
    }
    else
    {
      if ([v46 isEqualToString:v21]) {
        v39 = 0;
      }
      else {
        v39 = (void *)v23;
      }
      id v30 = v39;
      id v31 = (id)v25;
      v29 = [[PXSharedLibraryIncludedPeopleInfo alloc] initWithPerson:v16];
      id v27 = 0;
    }
LABEL_17:
    if (v30) {
      [v9 removeInfo:v30];
    }
    if (!v31) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  id v26 = (id)v25;
LABEL_14:
  id v27 = v26;
  if (v7)
  {
    id v28 = v7;
    v29 = [[PXSharedLibraryIncludedPeopleInfo alloc] initWithParticipant:v45 person:v16];
    id v30 = 0;
LABEL_16:
    [v9 removeInfo:v27];
    id v31 = v7;
    goto LABEL_17;
  }
  v29 = [[PXSharedLibraryIncludedPeopleInfo alloc] initWithPerson:v16];
  id v30 = 0;
  id v31 = v27;
  id v27 = 0;
LABEL_23:
  [v9 replaceInfo:v31 withInfo:v29];

LABEL_24:
  v10 = v42;
  v8 = v43;
  v12 = v41;
LABEL_25:
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(PXSharedLibraryAssistantPeopleViewController *)self dataSourceManager];
  v6 = [v5 dataSource];
  id v7 = [v6 allInfos];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v15 + 1) + 8 * v11) person];
        if (v12)
        {
          v13 = [v4 changeDetailsForObject:v12];
          if (v13)
          {
            v14 = [v12 uuid];
            [(PXSharedLibraryAssistantPeopleViewController *)self _fixupStalePersonForUUID:v14 loneParticipantInfo:0];
          }
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)updateWithPerson:(id)a3 loneParticipantInfo:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [v14 uuid];
  uint64_t v8 = [(PXSharedLibraryAssistantPeopleViewController *)self dataSourceManager];
  uint64_t v9 = [v6 participant];
  uint64_t v10 = [v8 dataSource];
  uint64_t v11 = [v10 infoForPersonUUID:v7];

  if (v11)
  {
    v12 = [v11 participant];

    if (v12) {
      goto LABEL_6;
    }
    v13 = [v14 uuid];
    [(PXSharedLibraryAssistantPeopleViewController *)self _fixupStalePersonForUUID:v13 loneParticipantInfo:v6];
  }
  else
  {
    v13 = [[PXSharedLibraryIncludedPeopleInfo alloc] initWithParticipant:v9 person:v14];
    [v8 replaceInfo:v6 withInfo:v13];
  }

LABEL_6:
}

- (NSString)textForFooter
{
  v2 = [(PXSharedLibraryAssistantPeopleViewController *)self viewModel];
  uint64_t v8 = 0;
  v3 = [v2 localizedSelectedPeopleWithAdditionalPeopleCount:&v8];
  uint64_t v4 = [v3 count];
  uint64_t v5 = v8;
  if (v2) {
    [v2 shareCounts];
  }
  if (v5 + v4 < 1)
  {
    id v6 = &stru_1F00B0030;
  }
  else
  {
    PXSharedLibraryAssistantPeopleSelectionFooterTitle(v3, v8);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v6;
}

- (id)alertConfigurationForIdentifyingPeopleInfos:(id)a3 action:(id)a4
{
  id v4 = a4;
  PXMap();
}

uint64_t __109__PXSharedLibraryAssistantPeopleViewController_Internal__alertConfigurationForIdentifyingPeopleInfos_action___block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (id)peopleInfosToIdentifyInDataSource:(id)a3
{
  v3 = [a3 infosWithoutPeople];
  unint64_t v4 = [v3 count];
  if (v4)
  {
    if (v4 >= 3) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = v4;
    }
    id v6 = objc_msgSend(v3, "subarrayWithRange:", 0, v5);
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (void)setupLibraryChangeListening
{
  v3 = [(PXSharedLibraryAssistantPeopleViewController *)self viewModel];
  unint64_t v4 = [v3 sourceLibraryInfo];

  id v7 = v4;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v7;
  }
  else {
    id v5 = 0;
  }

  id v6 = [v5 photoLibrary];

  objc_msgSend(v6, "px_registerChangeObserver:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
  objc_storeStrong((id *)&self->_buttonCell, 0);
  objc_storeStrong((id *)&self->_peopleCell, 0);
  objc_storeStrong((id *)&self->_peopleSectionFooterView, 0);
  objc_storeStrong((id *)&self->_peopleSectionHeaderView, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
}

- (PXSharedLibraryIncludedPeopleDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXSharedLibraryAssistantViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setAssistantViewControllerDelegate:(id)a3
{
}

- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->assistantViewControllerDelegate);
  return (PXAssistantViewControllerDelegate *)WeakRetained;
}

- (void)_presentPickerForInfos:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_Rules_IdentifyPerson_Named");
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v11 = objc_alloc_init(MEMORY[0x1E4F399B0]);
        v12 = [v10 name];
        v13 = PXStringWithValidatedFormat();
        objc_msgSend(v11, "setPurpose:", v13, v12);

        [v11 setAllowsEditingCollection:1];
        [v4 addObject:v11];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v7);
  }

  id v14 = [(PXSharedLibraryAssistantPeopleViewController *)self viewModel];
  long long v15 = [v14 sourceLibraryInfo];

  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_10;
    }
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = (objc_class *)objc_opt_class();
    uint64_t v23 = NSStringFromClass(v24);
    uint64_t v25 = objc_msgSend(v15, "px_descriptionForAssertionMessage");
    [v21 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantPeopleViewController+iOS.m", 441, @"%@ should be an instance inheriting from %@, but it is %@", @"self.viewModel.sourceLibraryInfo", v23, v25 object file lineNumber description];
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = (objc_class *)objc_opt_class();
    uint64_t v23 = NSStringFromClass(v22);
    [v21 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantPeopleViewController+iOS.m", 441, @"%@ should be an instance inheriting from %@, but it is nil", @"self.viewModel.sourceLibraryInfo", v23 object file lineNumber description];
  }

LABEL_10:
  id v16 = objc_alloc(MEMORY[0x1E4F39930]);
  long long v17 = [v15 photoLibrary];
  long long v18 = (void *)[v16 initWithPhotoLibrary:v17];

  [v18 setSelectionLimit:0];
  [v18 _setSourceType:1];
  [v18 _setFollowupPeopleConfigurations:v4];
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F39948]) initWithConfiguration:v18];
  [v19 setDelegate:self];
  uint64_t v20 = [(PXSharedLibraryAssistantPeopleViewController *)self assistantViewControllerDelegate];
  if (!v20) {
    PXAssertGetLog();
  }
  [v20 assistantViewController:self presentViewController:v19 animated:1];
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [(PXSharedLibraryAssistantPeopleViewController *)self assistantViewControllerDelegate];
  if (!v6) {
    PXAssertGetLog();
  }
  [v6 assistantViewController:self dismissViewControllerAnimated:1];
  PXMap();
}

uint64_t __72__PXSharedLibraryAssistantPeopleViewController_picker_didFinishPicking___block_invoke(uint64_t a1, void *a2)
{
  return [a2 itemIdentifier];
}

- (void)_updateFooterText
{
  id v9 = [MEMORY[0x1E4FB1948] footerConfiguration];
  id v3 = [(PXSharedLibraryAssistantPeopleViewController *)self textForFooter];
  [v9 setText:v3];

  id v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  id v5 = [v9 textProperties];
  [v5 setFont:v4];

  uint64_t v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  uint64_t v7 = [v9 textProperties];
  [v7 setColor:v6];

  [v9 directionalLayoutMargins];
  [v9 setDirectionalLayoutMargins:7.0];
  uint64_t v8 = [v9 textProperties];
  [v8 setAdjustsFontForContentSizeCategory:1];

  [(UITableViewHeaderFooterView *)self->_peopleSectionFooterView setContentConfiguration:v9];
}

- (void)_updateButtonCell
{
  id v5 = [(UITableViewCell *)self->_buttonCell contentConfiguration];
  if ([(PXSharedLibraryAssistantPeopleViewController *)self _hasPeople]) {
    id v3 = @"PXSharedLibraryAssistant_PeopleSelection_ButtonTitle_AddOthers";
  }
  else {
    id v3 = @"PXSharedLibraryAssistant_PeopleSelection_ButtonTitle_Add";
  }
  id v4 = PXLocalizedSharedLibraryString(v3);
  [v5 setText:v4];

  [(UITableViewCell *)self->_buttonCell setContentConfiguration:v5];
}

- (void)_updateHeaderDetailText
{
  PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_PeopleSelection_Subtitle");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [(PXSharedLibraryAssistantPeopleViewController *)self headerView];
  [v3 setDetailText:v4];
}

- (void)_updateContinueButton
{
  BOOL v3 = [(PXSharedLibraryAssistantPeopleViewController *)self _hasPeople];
  continueButton = self->_continueButton;
  [(OBBoldTrayButton *)continueButton setEnabled:v3];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v9 = a3;
  if ((void *)PXSharedLibraryAssistantViewModelObservationContext_279155 == a5)
  {
    if ((v6 & 8) != 0)
    {
      [(PXSharedLibraryAssistantPeopleViewController *)self _updateContinueButton];
      [(PXSharedLibraryAssistantPeopleViewController *)self _updateHeaderDetailText];
      if ((v6 & 0x800) == 0)
      {
LABEL_7:
        if ((v6 & 0x2000) == 0) {
          goto LABEL_9;
        }
LABEL_8:
        [(PXSharedLibraryAssistantPeopleViewController *)self _suggestedStartDateChanged];
        goto LABEL_9;
      }
    }
    else if ((v6 & 0x800) == 0)
    {
      goto LABEL_7;
    }
    [(PXSharedLibraryAssistantPeopleViewController *)self _updateFooterText];
    if ((v6 & 0x2000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if ((void *)PXSharedLibraryIncludedPeopleDataSourceManagerObservationContext != a5)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryAssistantPeopleViewController+iOS.m" lineNumber:338 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    uint64_t v10 = [(OBTableWelcomeController *)self tableView];
    [v10 reloadData];

    [(PXSharedLibraryAssistantPeopleViewController *)self _updateFooterText];
    [(PXSharedLibraryAssistantPeopleViewController *)self _updateButtonCell];
    id v11 = [(PXSectionedDataSourceManager *)self->_dataSourceManager dataSource];
    v12 = [(PXSharedLibraryAssistantPeopleViewController *)self viewModel];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__PXSharedLibraryAssistantPeopleViewController_observable_didChange_context___block_invoke;
    v15[3] = &unk_1E5DD07C0;
    id v16 = v11;
    id v13 = v11;
    [v12 performChanges:v15];
  }
LABEL_9:
}

void __77__PXSharedLibraryAssistantPeopleViewController_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 infosWithBothPeopleAndParticipants];
  [v4 setInfosWithBothPeopleAndParticipants:v5];

  id v6 = [*(id *)(a1 + 32) allPersonUUIDs];
  [v4 setPersonUUIDs:v6];
}

- (void)_advanceToNextStep
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  self->_wantsToContinueToNextStep = 0;
  BOOL v3 = [(PXSharedLibraryAssistantPeopleViewController *)self assistantViewControllerDelegate];
  if (!v3) {
    PXAssertGetLog();
  }
  [v3 stepForwardInAssistantForAssistantViewController:self];
}

- (void)_suggestedStartDateChanged
{
  BOOL v3 = [(PXSharedLibraryAssistantViewModel *)self->_viewModel suggestedStartDate];

  if (v3 && self->_wantsToContinueToNextStep)
  {
    [(OBBoldTrayButton *)self->_continueButton hidesBusyIndicator];
    [(PXSharedLibraryAssistantPeopleViewController *)self _advanceToNextStep];
  }
}

- (void)completeRulesStep
{
  self->_wantsToContinueToNextStep = 1;
  BOOL v3 = [(PXSectionedDataSourceManager *)self->_dataSourceManager dataSource];
  uint64_t v4 = [v3 allInfos];
  uint64_t v5 = [v4 count];

  id v6 = [(PXSharedLibraryAssistantViewModel *)self->_viewModel suggestedStartDate];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    continueButton = self->_continueButton;
    [(OBBoldTrayButton *)continueButton showsBusyIndicator];
  }
  else
  {
    [(PXSharedLibraryAssistantPeopleViewController *)self _advanceToNextStep];
  }
}

- (void)addLaterButtonTapped:(id)a3
{
  [(PXSharedLibraryIncludedPeopleDataSourceManager *)self->_dataSourceManager setViewModelSyncingDisabled:1];
  [(PXSharedLibraryAssistantPeopleViewController *)self completeRulesStep];
}

- (void)continueButtonTapped:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_pickerWasPresentedFromContinueButton = 1;
  uint64_t v5 = [(PXSectionedDataSourceManager *)self->_dataSourceManager dataSource];
  id v6 = [(PXSharedLibraryAssistantPeopleViewController *)self peopleInfosToIdentifyInDataSource:v5];

  if (![v6 count])
  {
    self->_pickerWasPresentedFromContinueButton = 0;
    id v9 = [(PXSectionedDataSourceManager *)self->_dataSourceManager dataSource];
    [v9 allInfos];
    objc_claimAutoreleasedReturnValue();

    PXMap();
  }
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__PXSharedLibraryAssistantPeopleViewController_continueButtonTapped___block_invoke;
  v10[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v12, &location);
  id v11 = v6;
  BOOL v7 = [(PXSharedLibraryAssistantPeopleViewController *)self alertConfigurationForIdentifyingPeopleInfos:v11 action:v10];
  [v7 setStyle:0];
  [v7 setSourceItem:v4];
  uint64_t v8 = [(PXSharedLibraryAssistantPeopleViewController *)self assistantViewControllerDelegate];
  if (!v8) {
    PXAssertGetLog();
  }
  [v8 assistantViewController:self presentAlertWithConfiguration:v7 animated:1];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __69__PXSharedLibraryAssistantPeopleViewController_continueButtonTapped___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _presentPickerForInfos:*(void *)(a1 + 32)];
}

uint64_t __69__PXSharedLibraryAssistantPeopleViewController_continueButtonTapped___block_invoke_245(uint64_t a1, void *a2)
{
  return [a2 person];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [a3 deselectRowAtIndexPath:a4 animated:1];
  uint64_t v5 = [(PXSharedLibraryAssistantPeopleViewController *)self viewModel];
  id v6 = [v5 sourceLibraryInfo];

  id v7 = v6;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  id v9 = [v8 photoLibrary];

  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F39930]) initWithPhotoLibrary:v9];
    [v10 setSelectionLimit:0];
    [v10 _setSourceType:1];
    id v11 = objc_alloc_init(MEMORY[0x1E4F399B0]);
    id v12 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_Rules_AddPeople");
    [v11 setPurpose:v12];

    [v11 setAllowsEditingCollection:1];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v14 = [(PXSharedLibraryAssistantViewModel *)self->_viewModel personUUIDs];
    if ([v14 count]) {
      PXMap();
    }
    [v11 setDisabledIdentifiers:v13];
    [v10 _setPeopleConfiguration:v11];
    long long v15 = (void *)[objc_alloc(MEMORY[0x1E4F39948]) initWithConfiguration:v10];
    [v15 setDelegate:self];
    self->_pickerWasPresentedFromContinueButton = 0;
    id v16 = [(PXSharedLibraryAssistantPeopleViewController *)self assistantViewControllerDelegate];
    if (!v16) {
      PXAssertGetLog();
    }
    [v16 assistantViewController:self presentViewController:v15 animated:1];
  }
  else
  {
    uint64_t v10 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v7;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "Unable to present PHPickerViewController since %@ does not provide a PHPhotoLibrary.", (uint8_t *)&v17, 0xCu);
    }
  }
}

uint64_t __82__PXSharedLibraryAssistantPeopleViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F391F0] localIdentifierWithUUID:a2];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  if (-[PXSharedLibraryAssistantPeopleViewController _isPeopleCellRepresentedAtSection:](self, "_isPeopleCellRepresentedAtSection:", [a4 section]))
  {
    id v7 = [(PXSectionedDataSourceManager *)self->_dataSourceManager dataSource];
    uint64_t v8 = [v7 totalNumberOfItems];

    [v6 layoutMargins];
    double v10 = v9;
    double v12 = v11;
    [v6 bounds];
    +[PXSharedLibraryIncludedPeopleTableViewCell heightForWidth:v8 numberOfItems:v13 - (v10 + v12)];
    double v15 = v14;
  }
  else
  {
    double v15 = *MEMORY[0x1E4FB2F28];
  }

  return v15;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if ([(PXSharedLibraryAssistantPeopleViewController *)self _isPeopleCellRepresentedAtSection:a4])
  {
    peopleSectionFooterView = self->_peopleSectionFooterView;
  }
  else
  {
    peopleSectionFooterView = 0;
  }
  return peopleSectionFooterView;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4) {
    return 0;
  }
  else {
    return self->_peopleSectionHeaderView;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  BOOL v5 = -[PXSharedLibraryAssistantPeopleViewController _isPeopleCellRepresentedAtSection:](self, "_isPeopleCellRepresentedAtSection:", objc_msgSend(a4, "section", a3));
  id v6 = &OBJC_IVAR___PXSharedLibraryAssistantPeopleViewController__buttonCell;
  if (v5) {
    id v6 = &OBJC_IVAR___PXSharedLibraryAssistantPeopleViewController__peopleCell;
  }
  id v7 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v6);
  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(PXSharedLibraryAssistantPeopleViewController *)self _hasPeople]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)_isPeopleCellRepresentedAtSection:(int64_t)a3
{
  return !a3 && [(PXSharedLibraryAssistantPeopleViewController *)self _hasPeople];
}

- (BOOL)_hasPeople
{
  v2 = [(PXSectionedDataSourceManager *)self->_dataSourceManager dataSource];
  BOOL v3 = [v2 totalNumberOfItems] > 0;

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXSharedLibraryAssistantPeopleViewController;
  [(OBTableWelcomeController *)&v4 viewWillAppear:a3];
  [(PXSharedLibraryAssistantPeopleViewController *)self _updateContinueButton];
  [(PXSharedLibraryIncludedPeopleDataSourceManager *)self->_dataSourceManager setViewModelSyncingDisabled:0];
}

- (void)viewDidLoad
{
  v44.receiver = self;
  v44.super_class = (Class)PXSharedLibraryAssistantPeopleViewController;
  [(OBTableWelcomeController *)&v44 viewDidLoad];
  [(PXSharedLibraryAssistantPeopleViewController *)self _updateHeaderDetailText];
  BOOL v3 = [[PXSharedLibraryIncludedPeopleDataSourceManager alloc] initWithViewModel:self->_viewModel];
  dataSourceManager = self->_dataSourceManager;
  self->_dataSourceManager = v3;

  [(PXSectionedDataSourceManager *)self->_dataSourceManager registerChangeObserver:self context:PXSharedLibraryIncludedPeopleDataSourceManagerObservationContext];
  id v5 = objc_alloc(MEMORY[0x1E4FB1D00]);
  id v6 = objc_msgSend(v5, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v6 setBackgroundColor:v7];

  [v6 setDelegate:self];
  [v6 setDataSource:self];
  [(OBTableWelcomeController *)self setTableView:v6];
  uint64_t v8 = [MEMORY[0x1E4FB1948] headerConfiguration];
  double v9 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_PeopleSelection_PickerDetail");
  [v8 setText:v9];

  double v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  double v11 = [v8 textProperties];
  [v11 setFont:v10];

  double v12 = [MEMORY[0x1E4FB1618] labelColor];
  double v13 = [v8 textProperties];
  [v13 setColor:v12];

  double v14 = [v8 textProperties];
  [v14 setAdjustsFontForContentSizeCategory:1];

  double v15 = (UITableViewHeaderFooterView *)objc_alloc_init(MEMORY[0x1E4FB1D30]);
  peopleSectionHeaderView = self->_peopleSectionHeaderView;
  self->_peopleSectionHeaderView = v15;

  [(UITableViewHeaderFooterView *)self->_peopleSectionHeaderView setContentConfiguration:v8];
  [(UITableViewHeaderFooterView *)self->_peopleSectionHeaderView setAutomaticallyUpdatesContentConfiguration:1];
  int v17 = [[PXSharedLibraryIncludedPeopleTableViewCell alloc] initWithDataSourceManager:self->_dataSourceManager];
  peopleCell = self->_peopleCell;
  self->_peopleCell = v17;

  uint64_t v19 = (UITableViewHeaderFooterView *)objc_alloc_init(MEMORY[0x1E4FB1D30]);
  peopleSectionFooterView = self->_peopleSectionFooterView;
  self->_peopleSectionFooterView = v19;

  v21 = (UITableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:0];
  buttonCell = self->_buttonCell;
  self->_buttonCell = v21;

  uint64_t v23 = [(UITableViewCell *)self->_buttonCell defaultContentConfiguration];
  v24 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E4FB28C8], 0x8000, 2);
  uint64_t v25 = [v23 textProperties];
  [v25 setFont:v24];

  id v26 = [(PXSharedLibraryAssistantPeopleViewController *)self view];
  id v27 = [v26 tintColor];
  id v28 = [v23 textProperties];
  [v28 setColor:v27];

  long long v29 = [v23 textProperties];
  [v29 setAdjustsFontForContentSizeCategory:1];

  long long v30 = PXSharedLibraryCellSystemImageNamed(@"plus");
  [v23 setImage:v30];

  [(UITableViewCell *)self->_buttonCell setContentConfiguration:v23];
  long long v31 = [MEMORY[0x1E4FB1498] listPlainCellConfiguration];
  long long v32 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [v31 setBackgroundColor:v32];

  [(UITableViewCell *)self->_buttonCell setBackgroundConfiguration:v31];
  [(PXSharedLibraryAssistantPeopleViewController *)self _updateButtonCell];
  v33 = [MEMORY[0x1E4F83A80] boldButton];
  continueButton = self->_continueButton;
  self->_continueButton = v33;

  v35 = self->_continueButton;
  v36 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_ButtonTitle_Continue");
  [(OBBoldTrayButton *)v35 setTitle:v36 forState:0];

  [(OBBoldTrayButton *)self->_continueButton addTarget:self action:sel_continueButtonTapped_ forControlEvents:0x2000];
  v37 = [(PXSharedLibraryAssistantPeopleViewController *)self buttonTray];
  [v37 addButton:self->_continueButton];

  v38 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\r" modifierFlags:0 action:sel_continueButtonTapped_];
  [(PXSharedLibraryAssistantPeopleViewController *)self addKeyCommand:v38];

  v39 = [MEMORY[0x1E4F83AB8] linkButton];
  SEL v40 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_ButtonTitle_Skip");
  [v39 setTitle:v40 forState:0];

  [v39 addTarget:self action:sel_addLaterButtonTapped_ forControlEvents:0x2000];
  v41 = [(PXSharedLibraryAssistantPeopleViewController *)self buttonTray];
  [v41 addButton:v39];

  v42 = [MEMORY[0x1E4FB1618] tableCellBlueTextColor];
  v43 = [(PXSharedLibraryAssistantPeopleViewController *)self view];
  [v43 setTintColor:v42];
}

- (PXSharedLibraryAssistantPeopleViewController)initWithViewModel:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantPeopleViewController+iOS.m", 62, @"Invalid parameter not satisfying: %@", @"viewModel" object file lineNumber description];
  }
  id v7 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_PeopleSelection_Title");
  v15.receiver = self;
  v15.super_class = (Class)PXSharedLibraryAssistantPeopleViewController;
  uint64_t v8 = [(OBTableWelcomeController *)&v15 initWithTitle:v7 detailText:0 icon:0 adoptTableViewScrollView:1];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_viewModel, a3);
    [(PXSharedLibraryAssistantViewModel *)v9->_viewModel registerChangeObserver:v9 context:PXSharedLibraryAssistantViewModelObservationContext_279155];
    id v10 = [v6 sourceLibraryInfo];
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    double v12 = [v11 photoLibrary];

    objc_msgSend(v12, "px_registerChangeObserver:", v9);
  }

  return v9;
}

+ (id)_fetchedPeople:(id)a3 sortedByLocalIdentifiers:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        double v14 = NSNumber;
        objc_super v15 = objc_msgSend(v13, "localIdentifier", (void)v19);
        id v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", v15));
        [v7 setObject:v16 forKeyedSubscript:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  int v17 = [v7 keysSortedByValueUsingComparator:&__block_literal_global_281_279211];

  return v17;
}

uint64_t __88__PXSharedLibraryAssistantPeopleViewController__fetchedPeople_sortedByLocalIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

@end