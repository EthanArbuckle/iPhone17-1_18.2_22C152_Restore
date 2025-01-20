@interface PXPeopleUtilities
+ (BOOL)_hasRecentlyHandledBootstrapOrSuggestionForPerson:(id)a3;
+ (BOOL)_isPhotosProcess;
+ (BOOL)canShowSuggestionForPerson:(id)a3;
+ (BOOL)isDetectionTypeHuman:(signed __int16)a3;
+ (BOOL)isFavoritePerson:(id)a3;
+ (BOOL)isGreenTeaAndContactsAccessDenied;
+ (BOOL)isPersonHiddenFromPeopleHome:(id)a3;
+ (BOOL)mergePersons:(id)a3 withPerson:(id)a4;
+ (BOOL)shouldShowBootstrapForPerson:(id)a3;
+ (BOOL)shouldShowBootstrapForPerson:(id)a3 context:(id)a4;
+ (BOOL)showBootstrapIfNeededWithContext:(id)a3 fromParentVC:(id)a4;
+ (BOOL)showBootstrapIfNeededWithContext:(id)a3 fromParentVC:(id)a4 delegate:(id)a5;
+ (BOOL)showBootstrapIfNeededWithContext:(id)a3 fromParentVC:(id)a4 force:(BOOL)a5 delegate:(id)a6;
+ (BOOL)showBootstrapIfNeededWithContext:(id)a3 fromParentVC:(id)a4 force:(BOOL)a5 flowDelegate:(id)a6 presentationDelegate:(id)a7;
+ (CGRect)faceRectForPeopleFaceTile:(id)a3;
+ (NSArray)reverseSortDescriptorsForManualSort;
+ (NSArray)sortDescriptorsForManualSort;
+ (id)_daysDictionary;
+ (id)_peopleHomeFetchResultForPersonType:(int64_t)a3;
+ (id)_titleStringForPeople:(id)a3 singlePersonFallback:(id)a4 groupFallback:(id)a5;
+ (id)_untaggingLog;
+ (id)alertControllerForRevertingSuggestLess:(id)a3 completion:(id)a4;
+ (id)alertControllerForUntaggingPerson:(id)a3 asset:(id)a4 completion:(id)a5;
+ (id)assetCollectionListFetchResultForPeople:(id)a3 assetCollectionFetchResults:(id *)a4;
+ (id)assetCollectionListFetchResultForPerson:(id)a3;
+ (id)bootstrapViewControllerForContext:(id)a3 delegate:(id)a4;
+ (id)comparatorByPeopleHomeSortingType:(unint64_t)a3;
+ (id)contactViewControllerForContact:(id)a3 target:(id)a4 selector:(SEL)a5;
+ (id)defaultTitleStringForSocialGroup:(id)a3;
+ (id)facesForPerson:(id)a3 inAssets:(id)a4;
+ (id)fetchMeContact;
+ (id)fetchPeopleAndPetsInSocialGroup:(id)a3;
+ (id)fetchPeopleWithUUIDs:(id)a3 photoLibrary:(id)a4;
+ (id)finalMergeTargetPersonForPersonWithUUID:(id)a3;
+ (id)generateNewFaceTileFromFaceTile:(id)a3;
+ (id)identifiersForPeople:(id)a3;
+ (id)keyAssetForPerson:(id)a3 face:(id)a4;
+ (id)keyFaceForPerson:(id)a3;
+ (id)lastManuallySortedPersonInSectionOfType:(int64_t)a3;
+ (id)locKeyForHasHumans:(BOOL)a3 hasPets:(BOOL)a4 key:(id)a5;
+ (id)locKeyForPeople:(id)a3 key:(id)a4;
+ (id)locKeyForPersonOrPet:(id)a3 key:(id)a4;
+ (id)locKeyForPersonOrPet:(id)a3 withVisibility:(unint64_t)a4 key:(id)a5;
+ (id)makeLemonadeDetailViewControllerForPerson:(id)a3 allPeople:(id)a4;
+ (id)memoryTitleStringFromPeople:(id)a3;
+ (id)peopleArrayFromFastEnumeration:(id)a3;
+ (id)peopleFetchResultFromFastEnumeration:(id)a3 photoLibrary:(id)a4;
+ (id)peopleWithPersonUris:(id)a3;
+ (id)personFaceTileByPersonIdForPersons:(id)a3;
+ (id)personWithLocalIdentifier:(id)a3;
+ (id)personWithLocalIdentifier:(id)a3 propertySets:(id)a4;
+ (id)personWithPersonUri:(id)a3;
+ (id)sharedContactStore;
+ (id)slideshowTitleStringForPeople:(id)a3;
+ (id)socialGroupFetchResultFromFastEnumeration:(id)a3 photoLibrary:(id)a4;
+ (id)sortDescriptorsWithPersonAssetSortOrder:(int64_t)a3;
+ (id)sortedPersons:(id)a3 byPersonMemoryFeatures:(id)a4;
+ (id)suggestLessOptionSelectionViewController:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
+ (id)summaryTitleForLibrary:(id)a3 count:(int64_t)a4;
+ (id)titleStringForPeople:(id)a3;
+ (id)titleStringForPerson:(id)a3;
+ (id)titleStringForSocialGroup:(id)a3;
+ (int64_t)changeTypeForPeople:(id)a3;
+ (int64_t)manualOrderForInsertingAtEndOfSectionWithType:(int64_t)a3;
+ (unint64_t)currentSortOrderFor:(id)a3;
+ (void)_alertStringsForPerson:(id)a3 alertTitle:(id *)a4 alertMessage:(id *)a5 alternativeLevelActionTitle:(id *)a6 resetActionTitle:(id *)a7;
+ (void)_peopleFaceTilesForFaces:(id)a3 asset:(id)a4 options:(id)a5 completion:(id)a6;
+ (void)_setDaysDictionary:(id)a3;
+ (void)_unlinkContactfromPerson:(id)a3 completion:(id)a4;
+ (void)handleUnlinkContact:(id)a3 person:(id)a4 presentationEnvironment:(id)a5 sourceItem:(id)a6 handleUnlinkageInternally:(BOOL)a7 completion:(id)a8;
+ (void)people:(id)a3 hasHumans:(BOOL *)a4 hasPets:(BOOL *)a5;
+ (void)peopleFaceTilesForAsset:(id)a3 options:(id)a4 completion:(id)a5;
+ (void)peopleFaceTilesForFaces:(id)a3 asset:(id)a4 options:(id)a5 completion:(id)a6;
+ (void)performSetSocialGroupKeyPhotoWithAsset:(id)a3 socialGroup:(id)a4 undoManager:(id)a5 completionHandler:(id)a6;
+ (void)resetTemporarilySuppressedBootstrapOrSuggestions;
+ (void)setSortOrder:(unint64_t)a3 toPhotoLibrary:(id)a4;
+ (void)temporarilySuppressBootstrapOrSuggestionForPerson:(id)a3;
+ (void)unblockPersonsInLibrary:(id)a3 completion:(id)a4;
+ (void)unlinkContactInfoForPerson:(id)a3 completion:(id)a4;
@end

@implementation PXPeopleUtilities

+ (id)keyAssetForPerson:(id)a3 face:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:0 orObject:v8];
    [v9 setIncludeHiddenAssets:0];
    [v9 setFetchLimit:1];
    v10 = (void *)MEMORY[0x1E4F38EB8];
    v17[0] = v8;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    v12 = [v10 fetchAssetsForFaces:v11 options:v9];
  }
  else
  {
    if (!v7)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, a1, @"PXPeopleUtilities.m", 882, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
    }
    v13 = [v7 photoLibrary];
    v14 = [v13 librarySpecificFetchOptions];

    id v9 = v14;
    [v9 setIncludeHiddenAssets:0];
    [v9 setFetchLimit:1];

    v12 = [MEMORY[0x1E4F38EB8] fetchKeyAssetForPerson:v7 options:v9];
  }

  return v12;
}

+ (id)sharedContactStore
{
  if (sharedContactStore_onceToken != -1) {
    dispatch_once(&sharedContactStore_onceToken, &__block_literal_global_301);
  }
  v2 = (void *)sharedContactStore_contactStore;
  return v2;
}

+ (id)locKeyForPersonOrPet:(id)a3 withVisibility:(unint64_t)a4 key:(id)a5
{
  v6 = +[PXPeopleUtilities locKeyForPersonOrPet:a3 key:a5];
  id v7 = v6;
  if (a4 == 1)
  {
    id v8 = @"__People";
  }
  else
  {
    if (a4 != 2) {
      goto LABEL_6;
    }
    id v8 = @"__Pets";
  }
  uint64_t v9 = [v6 stringByAppendingString:v8];

  id v7 = (void *)v9;
LABEL_6:
  return v7;
}

+ (id)locKeyForPersonOrPet:(id)a3 key:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && !objc_msgSend(v5, "px_isHuman"))
  {
    id v7 = [v6 stringByAppendingString:@"_Pet"];
  }
  else
  {
    id v7 = v6;
  }
  id v8 = v7;

  return v8;
}

void __39__PXPeopleUtilities_sharedContactStore__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  v1 = (void *)sharedContactStore_contactStore;
  sharedContactStore_contactStore = (uint64_t)v0;
}

+ (id)keyFaceForPerson:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PXPeopleUtilities.m", 867, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
  }
  id v6 = [v5 photoLibrary];
  id v7 = [v6 librarySpecificFetchOptions];

  [v7 setFetchLimit:1];
  id v8 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v7 setIncludedDetectionTypes:v8];

  [v7 setIncludeTorsoAndFaceDetectionData:1];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F39050], "px_fetchKeyFaceForPerson:options:", v5, v7);
  v10 = [v9 firstObject];

  return v10;
}

+ (id)contactViewControllerForContact:(id)a3 target:(id)a4 selector:(SEL)a5
{
  id v7 = (void *)MEMORY[0x1E4F1BBA8];
  id v8 = a4;
  uint64_t v9 = [v7 viewControllerForContact:a3];
  v10 = [v9 contentViewController];
  v11 = [v10 cardFooterGroup];
  v12 = PXLocalizedStringFromTable(@"PXPeopleInfoUnlinkContactButton", @"PhotosUICore");
  [v10 addActionWithTitle:v12 target:v8 selector:a5 inGroup:v11 destructive:1];

  return v9;
}

+ (void)_unlinkContactfromPerson:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__PXPeopleUtilities_UI___unlinkContactfromPerson_completion___block_invoke;
  v9[3] = &unk_1E5DD2B90;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  +[PXPeopleUtilities unlinkContactInfoForPerson:v8 completion:v9];
}

void __61__PXPeopleUtilities_UI___unlinkContactfromPerson_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLUIGetLog();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) localIdentifier];
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      uint64_t v9 = "Unlinked contact info for person %{public}@ from contact details";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v10, v11, v9, buf, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v8 = [*(id *)(a1 + 32) localIdentifier];
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    __int16 v17 = 2112;
    id v18 = v5;
    uint64_t v9 = "Failed to unlink contact info for person %{public}@ from contact details with error %@";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PXPeopleUtilities_UI___unlinkContactfromPerson_completion___block_invoke_341;
  block[3] = &unk_1E5DD3128;
  id v14 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __61__PXPeopleUtilities_UI___unlinkContactfromPerson_completion___block_invoke_341(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)handleUnlinkContact:(id)a3 person:(id)a4 presentationEnvironment:(id)a5 sourceItem:(id)a6 handleUnlinkageInternally:(BOOL)a7 completion:(id)a8
{
  id v13 = a4;
  id v14 = a8;
  id v15 = a6;
  id v30 = a5;
  id v16 = a3;
  v29 = PXLocalizedStringFromTable(@"PXPeopleInfoUnlinkContactAlertTitle", @"PhotosUICore");
  v31 = [MEMORY[0x1E4F391F0] fullNameFromContact:v16];

  __int16 v17 = PXLocalizedStringFromTable(@"PXPeopleInfoUnlinkContactAlertMessage", @"PhotosUICore");
  id v18 = PXLocalizedStringWithValidatedFormat(v17, @"%@");

  uint64_t v19 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", v29, v18, 0, v31);
  v20 = (void *)MEMORY[0x1E4FB1410];
  v21 = PXLocalizedStringFromTable(@"PXPeopleInfoUnlinkContactConfirmationAction", @"PhotosUICore");
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __124__PXPeopleUtilities_UI__handleUnlinkContact_person_presentationEnvironment_sourceItem_handleUnlinkageInternally_completion___block_invoke;
  v32[3] = &unk_1E5DB7BB8;
  BOOL v35 = a7;
  id v33 = v13;
  id v34 = v14;
  id v22 = v14;
  id v23 = v13;
  v24 = [v20 actionWithTitle:v21 style:2 handler:v32];
  [v19 addAction:v24];

  v25 = (void *)MEMORY[0x1E4FB1410];
  v26 = PXLocalizedStringFromTable(@"PXPeopleInfoUnlinkContactCancelAction", @"PhotosUICore");
  v27 = [v25 actionWithTitle:v26 style:1 handler:0];
  [v19 addAction:v27];

  v28 = [v19 popoverPresentationController];
  [v28 setSourceItem:v15];

  [v30 presentViewController:v19 animated:1 completionHandler:0];
}

void __124__PXPeopleUtilities_UI__handleUnlinkContact_person_presentationEnvironment_sourceItem_handleUnlinkageInternally_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id v5 = v3;
    +[PXPeopleUtilities _unlinkContactfromPerson:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (!v4) {
      goto LABEL_6;
    }
    id v5 = v3;
    (*(void (**)(void))(v4 + 16))();
  }
  id v3 = v5;
LABEL_6:
}

+ (id)suggestLessOptionSelectionViewController:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[_TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController alloc] initWithPeople:v9 delegate:v8 completionHandler:v7];

  return v10;
}

+ (void)_alertStringsForPerson:(id)a3 alertTitle:(id *)a4 alertMessage:(id *)a5 alternativeLevelActionTitle:(id *)a6 resetActionTitle:(id *)a7
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  os_log_type_t v11 = objc_msgSend(v10, "px_localizedName");
  uint32_t v12 = [v10 userFeedbackProperties];
  id v13 = [v12 userFeedback];
  uint64_t v14 = [v13 type];

  v33[0] = *MEMORY[0x1E4F1AD88];
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  id v16 = [v10 linkedContactWithKeysToFetch:v15];
  __int16 v17 = [v16 termsOfAddress];

  if (v14 == 3)
  {
    if ([v11 length])
    {
      uint64_t v19 = PXLocalizedStringForPersonOrPetAndVisibility(v10, 0, @"PXPeopleBlockPersonRevertAlertTitleNamed_FromNeverFeature");
      id v30 = v11;
      PXStringWithValidatedFormat();
      id v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PXLocalizedStringForPersonOrPetAndVisibility(v10, 0, @"PXPeopleBlockPersonRevertAlertTitleNoName_FromNeverFeature");
      id v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v23 = @"PXPeopleBlockPersonRevertAlertInformativeText_FromNeverFeature";
    v24 = @"PXPeopleBlockPersonRevertAlertChangeLevelActionTitle_FromNeverFeature";
  }
  else
  {
    if (v14 != 2)
    {
      v20 = v17;
      id v32 = 0;
      v21 = 0;
      id v22 = 0;
      goto LABEL_13;
    }
    if ([v11 length])
    {
      id v18 = PXLocalizedStringForPersonOrPetAndVisibility(v10, 0, @"PXPeopleBlockPersonRevertAlertTitleNamed_FromFeatureLess");
      id v30 = v11;
      PXStringWithValidatedFormat();
      id v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PXLocalizedStringForPersonOrPetAndVisibility(v10, 0, @"PXPeopleBlockPersonRevertAlertTitleNoName_FromFeatureLess");
      id v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v23 = @"PXPeopleBlockPersonRevertAlertInformativeText_FromFeatureLess";
    v24 = @"PXPeopleBlockPersonRevertAlertChangeLevelActionTitle_FromFeatureLess";
  }
  id v22 = PXLocalizedStringForPersonOrPetAndVisibility(v10, 0, v24);
  v20 = v17;
  v21 = PXLocalizedAttributedStringForPersonOrPet(v10, 0, v17, v23);
LABEL_13:
  if (objc_msgSend(v11, "length", v30))
  {
    PXLocalizedStringForPersonOrPetAndVisibility(v10, 0, @"PXPeopleBlockPersonRevertResetActionTitleNamed");
    v25 = a5;
    v26 = a6;
    v28 = v27 = a7;
    v29 = PXStringWithValidatedFormat();

    a7 = v27;
    a6 = v26;
    a5 = v25;
  }
  else
  {
    v29 = PXLocalizedStringForPersonOrPetAndVisibility(v10, 0, @"PXPeopleBlockPersonRevertResetActionTitleNoName");
  }
  if (a4) {
    *a4 = v32;
  }
  if (a5) {
    *a5 = v21;
  }
  if (a6) {
    *a6 = v22;
  }
  if (a7) {
    *a7 = v29;
  }
}

+ (id)alertControllerForRevertingSuggestLess:(id)a3 completion:(id)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v27 = PXLocalizedStringFromTable(@"PXBlockConfirmationDialogButtonTitle_Cancel", @"PhotosUICore");
  id v41 = 0;
  id v42 = 0;
  id v39 = 0;
  id v40 = 0;
  [a1 _alertStringsForPerson:v6 alertTitle:&v42 alertMessage:&v41 alternativeLevelActionTitle:&v40 resetActionTitle:&v39];
  id v28 = v42;
  id v26 = v41;
  id v8 = v40;
  id v25 = v39;
  id v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v28 message:0 preferredStyle:0];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v26];
  uint64_t v43 = *MEMORY[0x1E4FB06F8];
  os_log_type_t v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v44[0] = v11;
  uint32_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
  objc_msgSend(v10, "addAttributes:range:", v12, 0, objc_msgSend(v10, "length"));

  [v9 _setAttributedMessage:v10];
  id v13 = (void *)MEMORY[0x1E4FB1410];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke;
  v35[3] = &unk_1E5DAEA28;
  id v14 = v6;
  id v36 = v14;
  id v38 = a1;
  id v15 = v7;
  id v37 = v15;
  id v16 = [v13 actionWithTitle:v8 style:2 handler:v35];
  [v9 addAction:v16];

  __int16 v17 = (void *)MEMORY[0x1E4FB1410];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_2;
  v31[3] = &unk_1E5DAEA28;
  id v32 = v14;
  id v34 = a1;
  id v18 = v15;
  id v33 = v18;
  id v19 = v14;
  v20 = [v17 actionWithTitle:v25 style:2 handler:v31];
  [v9 addAction:v20];

  v21 = (void *)MEMORY[0x1E4FB1410];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_5;
  v29[3] = &unk_1E5DCE788;
  id v30 = v18;
  id v22 = v18;
  id v23 = [v21 actionWithTitle:v27 style:1 handler:v29];
  [v9 addAction:v23];

  return v9;
}

void __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) photoLibrary];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__2797;
  v22[4] = __Block_byref_object_dispose__2798;
  id v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  uint64_t v21 = 0;
  id v5 = [*(id *)(a1 + 32) userFeedbackProperties];
  id v6 = [v5 userFeedback];
  uint64_t v7 = [v6 type];

  uint64_t v21 = v7;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_291;
  v14[3] = &unk_1E5DCA520;
  id v16 = v20;
  __int16 v17 = v19;
  id v18 = v22;
  id v15 = *(id *)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_293;
  v10[3] = &unk_1E5DAEA00;
  id v9 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint32_t v12 = v22;
  uint64_t v13 = v8;
  id v11 = v9;
  [v4 performChanges:v14 completionHandler:v10];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
}

void __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) photoLibrary];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_3;
  v7[3] = &unk_1E5DD36F8;
  id v8 = *(id *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_4;
  v5[3] = &unk_1E5DAEA50;
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 performChanges:v7 completionHandler:v5];
}

void __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"User cancelled confirmation alert");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

void __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_3(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F39200] changeRequestForPerson:*(void *)(a1 + 32)];
  [v1 setUserFeedback:0];
}

void __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    long long v6 = (void *)MEMORY[0x1E4F56658];
    uint64_t v11 = *MEMORY[0x1E4F56560];
    uint64_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    v12[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v6 sendEvent:@"com.apple.photos.CPAnalytics.userFeedback.reverted.suggestLess.person" withPayload:v9];
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);
  }
}

void __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_291(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = *(void *)(*(void *)(a1[5] + 8) + 24);
  if (v2 < 2)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = 0;
    goto LABEL_6;
  }
  if (v2 == 2)
  {
LABEL_6:
    *(void *)(*(void *)(a1[6] + 8) + 24) = 3;
    uint64_t v3 = *(void *)(a1[7] + 8);
    long long v4 = @"com.apple.photos.CPAnalytics.userFeedback.avoid.person";
    goto LABEL_7;
  }
  if (v2 != 3) {
    goto LABEL_8;
  }
  *(void *)(*(void *)(a1[6] + 8) + 24) = 2;
  uint64_t v3 = *(void *)(a1[7] + 8);
  long long v4 = @"com.apple.photos.CPAnalytics.userFeedback.dislike.person";
LABEL_7:
  id v5 = v4;
  long long v6 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v4;

LABEL_8:
  if (*(void *)(*(void *)(a1[6] + 8) + 24))
  {
    id v11 = [MEMORY[0x1E4F39200] changeRequestForPerson:a1[4]];
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F39330]) initWithType:*(void *)(*(void *)(a1[6] + 8) + 24) feature:0 context:0];
    [v11 setUserFeedback:v7];
  }
  else
  {
    id v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[4];
      uint64_t v10 = *(void *)(*(void *)(a1[5] + 8) + 24);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2048;
      uint64_t v15 = v10;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "Failed to get a new feedback type from person: %@ (current feedback type (%ld))", buf, 0x16u);
    }
  }
}

void __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_293(uint64_t a1, uint64_t a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    long long v6 = (void *)MEMORY[0x1E4F56658];
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v12 = *MEMORY[0x1E4F56560];
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    v13[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    [v6 sendEvent:v7 withPayload:v10];
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);
  }
}

+ (id)_untaggingLog
{
  if (_untaggingLog_onceToken != -1) {
    dispatch_once(&_untaggingLog_onceToken, &__block_literal_global_282);
  }
  unint64_t v2 = (void *)_untaggingLog_untaggingLog;
  return v2;
}

void __38__PXPeopleUtilities_UI___untaggingLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.people", "PXPeopleUtilitiesUntagging");
  id v1 = (void *)_untaggingLog_untaggingLog;
  _untaggingLog_untaggingLog = (uint64_t)v0;
}

+ (id)alertControllerForUntaggingPerson:(id)a3 asset:(id)a4 completion:(id)a5
{
  v77[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v61 = a5;
  uint64_t v9 = objc_msgSend(v7, "px_localizedName");
  uint64_t v10 = [v9 length];
  uint64_t v11 = [v8 mediaType];
  v60 = v9;
  if (v10)
  {
    if (v11 == 2) {
      uint64_t v12 = @"PXPeopleUntagPersonDescriptionNamedVideo";
    }
    else {
      uint64_t v12 = @"PXPeopleUntagPersonDescriptionNamedPhoto";
    }
    uint64_t v13 = PXLocalizedStringForPersonOrPetAndVisibility(v7, 0, v12);
    uint64_t v14 = PXStringWithValidatedFormat();
  }
  else
  {
    if (v11 == 2) {
      uint64_t v15 = @"PXPeopleUntagPersonDescriptionNoNameVideo";
    }
    else {
      uint64_t v15 = @"PXPeopleUntagPersonDescriptionNoNamePhoto";
    }
    uint64_t v14 = PXLocalizedStringForPersonOrPetAndVisibility(v7, 0, v15);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke;
  aBlock[3] = &unk_1E5DAE960;
  id v16 = v7;
  id v75 = v16;
  id v17 = v8;
  id v76 = v17;
  id v18 = _Block_copy(aBlock);
  id v19 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  v59 = (void *)v14;
  v57 = [[PXPeopleAlertContentViewController alloc] initWithPerson:v16 message:v14];
  objc_msgSend(v19, "setContentViewController:");
  v20 = (void *)MEMORY[0x1E4F390A0];
  uint64_t v21 = [v17 photoLibrary];
  id v22 = [v20 fetchOptionsWithPhotoLibrary:v21 orObject:0];

  [v22 setIncludeTorsoAndFaceDetectionData:1];
  id v23 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v22 setIncludedDetectionTypes:v23];

  v24 = (void *)MEMORY[0x1E4F28F60];
  id v25 = [v16 uuid];
  id v26 = [v24 predicateWithFormat:@"%K = %@", @"personForFace.personUUID", v25];
  [v22 setInternalPredicate:v26];

  v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v77[0] = v27;
  id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:1];
  [v22 setSortDescriptors:v28];

  v58 = v17;
  v29 = [MEMORY[0x1E4F39050] fetchFacesInAsset:v17 options:v22];
  if ([v29 count] == 1) {
    goto LABEL_11;
  }
  if ([v29 count] == 2)
  {
    id v36 = [v29 firstObject];
    [v36 centerX];
    if (v37 == 0.0)
    {
      id v38 = [v29 lastObject];
      [v38 centerX];
      double v40 = v39;

      if (v40 != 0.0)
      {
        id v30 = v61;
        uint64_t v31 = [v29 lastObject];
        goto LABEL_12;
      }
    }
    else
    {
    }
    id v33 = [v29 firstObject];
    [v33 centerX];
    if (v41 == 0.0)
    {
      id v56 = 0;
      goto LABEL_13;
    }
    id v42 = [v29 lastObject];
    [v42 centerX];
    double v44 = v43;

    if (v44 == 0.0)
    {
LABEL_11:
      id v30 = v61;
      uint64_t v31 = [v29 firstObject];
LABEL_12:
      id v32 = (void *)v31;
      id v33 = PXLocalizedStringForPersonOrPetAndVisibility(v16, 0, @"PXPeopleTagWithNewName");
      id v34 = (void *)MEMORY[0x1E4FB1410];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_253;
      v68[3] = &unk_1E5DAE9B0;
      id v56 = v32;
      id v69 = v56;
      id v72 = v18;
      id v70 = v29;
      id v71 = v16;
      id v73 = v30;
      BOOL v35 = [v34 actionWithTitle:v33 style:0 handler:v68];
      [v19 addAction:v35];

LABEL_13:
      goto LABEL_22;
    }
  }
  id v56 = 0;
LABEL_22:
  v45 = (void *)MEMORY[0x1E4FB1410];
  v46 = PXLocalizedStringFromTable(@"PXPeopleUntagPerson", @"PhotosUICore");
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_3;
  v64[3] = &unk_1E5DAE9D8;
  id v65 = v29;
  id v66 = v18;
  id v47 = v61;
  id v67 = v47;
  id v48 = v29;
  id v49 = v18;
  v50 = [v45 actionWithTitle:v46 style:2 handler:v64];

  [v19 addAction:v50];
  v51 = (void *)MEMORY[0x1E4FB1410];
  v52 = PXLocalizedStringFromTable(@"PXPeopleUntagPersonCancel", @"PhotosUICore");
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_6;
  v62[3] = &unk_1E5DCE788;
  id v63 = v47;
  id v53 = v47;
  v54 = [v51 actionWithTitle:v52 style:1 handler:v62];

  [v19 addAction:v54];
  return v19;
}

id __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = +[PXPeopleUtilities _untaggingLog];
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  id v5 = v3;
  long long v6 = v5;
  unint64_t v7 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "untagPersonTotal", "", buf, 2u);
  }

  if ([v2 count])
  {
    id v8 = v6;
    uint64_t v9 = v8;
    if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v4, "untagPersonPerformChanges", "", buf, 2u);
    }

    uint64_t v10 = [*(id *)(a1 + 32) photoLibrary];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_232;
    v60[3] = &unk_1E5DD32A8;
    id v61 = *(id *)(a1 + 32);
    id v11 = v2;
    id v62 = v11;
    id v59 = 0;
    int v12 = [v10 performChangesAndWait:v60 error:&v59];
    uint64_t v13 = v59;

    uint64_t v14 = v9;
    uint64_t v15 = v14;
    if (v7 > 0xFFFFFFFFFFFFFFFDLL)
    {

      if (v13) {
        int v21 = 0;
      }
      else {
        int v21 = v12;
      }
      if (v21 == 1)
      {
        id v49 = v13;
        unint64_t v51 = v4 - 1;
        id v22 = v15;
LABEL_25:
        v50 = v6;
        os_signpost_id_t v52 = v4;
        id v48 = v15;

        id v23 = (void *)MEMORY[0x1E4F390A0];
        v24 = [*(id *)(a1 + 32) photoLibrary];
        id v25 = [v23 fetchOptionsWithPhotoLibrary:v24 orObject:0];

        id v26 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
        [v25 setIncludedDetectionTypes:v26];

        [v25 setMinimumVerifiedFaceCount:0];
        [v25 setMinimumUnverifiedFaceCount:0];
        [v25 setIncludeTorsoOnlyPerson:1];
        [v25 setFetchLimit:1];
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id obj = v11;
        uint64_t v27 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          v20 = 0;
          uint64_t v29 = *(void *)v56;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v56 != v29) {
                objc_enumerationMutation(obj);
              }
              uint64_t v31 = objc_msgSend(MEMORY[0x1E4F391F0], "fetchPersonWithFace:options:", *(void *)(*((void *)&v55 + 1) + 8 * i), v25, v48);
              id v32 = [v31 fetchedObjects];
              uint64_t v33 = [v32 count];

              if (v33)
              {
                id v34 = [v31 fetchedObjects];
                BOOL v35 = [v34 firstObject];

                id v36 = [*(id *)(a1 + 32) localIdentifier];
                double v37 = [v35 localIdentifier];
                char v38 = [v36 isEqualToString:v37];

                if ((v38 & 1) == 0)
                {
                  double v39 = PLUIGetLog();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                  {
                    double v40 = [v35 localIdentifier];
                    *(_DWORD *)buf = 138543362;
                    id v65 = v40;
                    _os_log_impl(&dword_1A9AE7000, v39, OS_LOG_TYPE_DEFAULT, "Marking newly created person as needing key face: %{public}@", buf, 0xCu);
                  }
                  [v35 markAsNeedingKeyFace];
                }
                v20 = v35;
              }
            }
            uint64_t v28 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
          }
          while (v28);
        }
        else
        {
          v20 = 0;
        }

        double v43 = v48;
        double v44 = v43;
        unint64_t v7 = v51;
        os_signpost_id_t v4 = v52;
        if (v51 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v44, OS_SIGNPOST_INTERVAL_END, v52, "untagPersonDetermineNewPerson", "", buf, 2u);
        }

        uint64_t v13 = v49;
        long long v6 = v50;
LABEL_47:

        goto LABEL_48;
      }
    }
    else
    {
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v15, OS_SIGNPOST_INTERVAL_END, v4, "untagPersonPerformChanges", "", buf, 2u);
      }

      if (v13) {
        char v16 = 0;
      }
      else {
        char v16 = v12;
      }
      if (v16)
      {
        id v49 = v13;
        unint64_t v51 = v4 - 1;
        id v17 = v15;
        if (os_signpost_enabled(v17))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v4, "untagPersonDetermineNewPerson", "", buf, 2u);
        }
        goto LABEL_25;
      }
    }
    id v25 = PLUIGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      double v41 = *(void **)(a1 + 32);
      uint64_t v42 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      id v65 = v41;
      __int16 v66 = 2112;
      uint64_t v67 = v42;
      __int16 v68 = 2112;
      id v69 = v13;
      _os_log_impl(&dword_1A9AE7000, v25, OS_LOG_TYPE_ERROR, "Failed to untag person: %@ asset: %@ error: %@", buf, 0x20u);
    }
    v20 = 0;
    goto LABEL_47;
  }
  uint64_t v13 = PLUIGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v18 = *(void **)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    id v65 = v18;
    __int16 v66 = 2112;
    uint64_t v67 = v19;
    _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "Failed to link any asset's face to the person we're untagging (person: %@, asset: %@)", buf, 0x16u);
  }
  v20 = 0;
LABEL_48:

  v45 = v6;
  v46 = v45;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v46, OS_SIGNPOST_INTERVAL_END, v4, "untagPersonTotal", "", buf, 2u);
  }

  return v20;
}

void __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_253(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  int v12 = __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_2;
  uint64_t v13 = &unk_1E5DAE988;
  id v15 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 40);
  uint64_t v3 = +[PXPeopleBootstrapContext contextWithFace:v2 type:1 delayedPersonBlock:&v10];
  [v3 setWantsToBeAddedToPeopleAlbum:1];
  [v3 setSourcePerson:*(void *)(a1 + 48)];
  os_signpost_id_t v4 = NSString;
  id v5 = [MEMORY[0x1E4F28F80] processInfo];
  long long v6 = [v5 processName];
  unint64_t v7 = [@"/Library/Caches/com.apple.xbs/Sources/Photos_UICore/workspaces/photosshared/PhotosUICore/PhotosUICore/People/Shared/PXPeopleUtilities+UI.m" lastPathComponent];
  id v8 = [v4 stringWithFormat:@"%@:%@:%s:%d", v6, v7, "+[PXPeopleUtilities(UI) alertControllerForUntaggingPerson:asset:completion:]_block_invoke", 240, v10, v11, v12, v13];
  [v3 setCallerInfo:v8];

  uint64_t v9 = +[PXPeopleUtilities bootstrapViewControllerForContext:v3 delegate:0];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.people.untag.newTagTapped" withPayload:MEMORY[0x1E4F1CC08]];
}

void __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_3(id *a1)
{
  uint64_t v2 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_4;
  block[3] = &unk_1E5DCAF58;
  id v5 = a1[5];
  id v4 = a1[4];
  id v6 = a1[6];
  dispatch_async(v2, block);
}

uint64_t __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v1 = (void *)MEMORY[0x1E4F56658];
  uint64_t v2 = MEMORY[0x1E4F1CC08];
  return [v1 sendEvent:@"com.apple.photos.CPAnalytics.people.untag.cancelTapped" withPayload:v2];
}

void __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_4(uint64_t a1)
{
  id v2 = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_5;
  block[3] = &unk_1E5DD3128;
  id v5 = *(id *)(a1 + 48);
  dispatch_async(v3, block);

  [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.people.untag.untagTapped" withPayload:MEMORY[0x1E4F1CC08]];
}

uint64_t __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_232(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F39200] changeRequestForPerson:*(void *)(a1 + 32)];
  if (([*(id *)(a1 + 32) isVerified] & 1) == 0) {
    [v2 setVerified:1];
  }
  [v2 addRejectedFaces:*(void *)(a1 + 40) forCluster:0];
}

+ (BOOL)showBootstrapIfNeededWithContext:(id)a3 fromParentVC:(id)a4 force:(BOOL)a5 flowDelegate:(id)a6 presentationDelegate:(id)a7
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v28 = a7;
  id v15 = [v12 sourcePerson];
  char v16 = [v15 localIdentifier];
  v30[0] = *MEMORY[0x1E4F397E0];
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  id v18 = +[PXPeopleUtilities personWithLocalIdentifier:v16 propertySets:v17];

  if ((a5
     || +[PXPeopleUtilities shouldShowBootstrapForPerson:](PXPeopleUtilities, "shouldShowBootstrapForPerson:", v18))&& ([v12 setSourcePerson:v18], objc_msgSend(a1, "bootstrapViewControllerForContext:delegate:", v12, v14), (uint64_t v19 = (PXChangePeopleTypeAction *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v20 = v19;
    [(PXChangePeopleTypeAction *)v19 setModalPresentationStyle:2];
    int v21 = [(PXChangePeopleTypeAction *)v20 presentationController];
    id v22 = v28;
    [v21 setDelegate:v28];

    BOOL v23 = 1;
    [v13 presentViewController:v20 animated:1 completion:0];
  }
  else
  {
    if (([v12 didCommitPreBootstrapAction] & 1) != 0 || objc_msgSend(v12, "bootstrapType"))
    {
      v20 = [(PXPeopleBootstrapFlowController *)[PXUIPeopleBootstrapFlowController alloc] initEmptyFlowWithContext:v12];
      [(PXChangePeopleTypeAction *)v20 done:v13];
    }
    else
    {
      id v25 = [PXChangePeopleTypeAction alloc];
      uint64_t v29 = v18;
      id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
      v20 = [(PXChangePeopleTypeAction *)v25 initWithPeople:v26 type:1];

      uint64_t v27 = [v13 undoManager];
      [(PXAction *)v20 executeWithUndoManager:v27 completionHandler:&__block_literal_global_2849];
    }
    BOOL v23 = 0;
    id v22 = v28;
  }

  return v23;
}

+ (BOOL)showBootstrapIfNeededWithContext:(id)a3 fromParentVC:(id)a4 force:(BOOL)a5 delegate:(id)a6
{
  return [a1 showBootstrapIfNeededWithContext:a3 fromParentVC:a4 force:a5 flowDelegate:a6 presentationDelegate:0];
}

+ (BOOL)showBootstrapIfNeededWithContext:(id)a3 fromParentVC:(id)a4 delegate:(id)a5
{
  return [a1 showBootstrapIfNeededWithContext:a3 fromParentVC:a4 force:0 delegate:a5];
}

+ (BOOL)showBootstrapIfNeededWithContext:(id)a3 fromParentVC:(id)a4
{
  return [a1 showBootstrapIfNeededWithContext:a3 fromParentVC:a4 force:0 delegate:0];
}

+ (id)bootstrapViewControllerForContext:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = [(PXPeopleBootstrapFlowController *)[PXUIPeopleBootstrapFlowController alloc] initWithContext:v6];

  [(PXPeopleBootstrapFlowController *)v7 setBootstrapDelegate:v5];
  if ([(PXPeopleBootstrapFlowController *)v7 hasNextViewController]
    || (+[PXPeopleUISettings sharedInstance],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 alwaysShowBootstrap],
        v8,
        v9))
  {
    uint64_t v10 = [[PXPeopleFlowNavigationController alloc] initWithFlowController:v7];
    [(PXPeopleFlowNavigationController *)v10 setModalPresentationStyle:2];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)makeLemonadeDetailViewControllerForPerson:(id)a3 allPeople:(id)a4
{
  return +[PXLemonadePeoplePhotosPagingGridUtilities detailViewControllerFor:a3 people:a4];
}

+ (void)performSetSocialGroupKeyPhotoWithAsset:(id)a3 socialGroup:(id)a4 undoManager:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[PXSocialGroupMakeKeyPhotoAction alloc] initWithSocialGroup:v11 newKeyAsset:v12];

  [(PXAction *)v13 executeWithUndoManager:v10 completionHandler:v9];
}

+ (int64_t)changeTypeForPeople:(id)a3
{
  id v5 = a3;
  id v6 = [v5 firstObject];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  id v8 = [v7 photoLibrary];

  if (!v8)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PXPeopleUtilities.m", 977, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  id v9 = +[PXPeopleUtilities peopleFetchResultFromFastEnumeration:v5 photoLibrary:v8];
  int64_t v10 = +[PXPeopleChangeTypeActionPerformer changeTypeFor:v9];

  return v10;
}

+ (BOOL)isDetectionTypeHuman:(signed __int16)a3
{
  return a3 > 4 || (a3 & 0x1F) == 1;
}

+ (id)locKeyForPeople:(id)a3 key:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PXPeopleUtilities.m", 937, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];
  }
  __int16 v12 = 0;
  +[PXPeopleUtilities people:v7 hasHumans:(char *)&v12 + 1 hasPets:&v12];
  id v9 = +[PXPeopleUtilities locKeyForHasHumans:HIBYTE(v12) hasPets:v12 key:v8];

  return v9;
}

+ (id)locKeyForHasHumans:(BOOL)a3 hasPets:(BOOL)a4 key:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v7 = a5;
  id v8 = v7;
  if (v6 && v5)
  {
    id v9 = @"_PeoplePet";
LABEL_6:
    id v10 = [v7 stringByAppendingString:v9];
    goto LABEL_8;
  }
  if (v5)
  {
    id v9 = @"_Pet";
    goto LABEL_6;
  }
  id v10 = v7;
LABEL_8:
  id v11 = v10;

  return v11;
}

+ (void)people:(id)a3 hasHumans:(BOOL *)a4 hasPets:(BOOL *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!a4 || !a5)
  {
    int v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"PXPeopleUtilities.m", 896, @"Invalid parameter not satisfying: %@", @"outHasHumans != nil && outHasPets != nil" object file lineNumber description];
  }
  *a4 = 0;
  *a5 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v22 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          id v17 = PLUIGetLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v27 = v15;
            id v18 = v17;
            uint64_t v19 = "PXPeopleUtilities: %@ does not respond to isHuman.";
            goto LABEL_18;
          }
LABEL_19:

          goto LABEL_20;
        }
        if (!*a4) {
          *a4 = objc_msgSend(v15, "px_isHuman");
        }
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          id v17 = PLUIGetLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v27 = v15;
            id v18 = v17;
            uint64_t v19 = "PXPeopleUtilities: %@ does not respond to isPet.";
LABEL_18:
            _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEBUG, v19, buf, 0xCu);
          }
          goto LABEL_19;
        }
        if (*a5)
        {
          int v16 = 1;
        }
        else
        {
          int v16 = objc_msgSend(v15, "px_isPet");
          *a5 = v16;
        }
        if (*a4 && v16) {
          goto LABEL_27;
        }
LABEL_20:
        ++v14;
      }
      while (v12 != v14);
      uint64_t v20 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
      uint64_t v12 = v20;
    }
    while (v20);
  }
LABEL_27:
}

+ (id)fetchPeopleAndPetsInSocialGroup:(id)a3
{
  id v3 = a3;
  id v4 = [v3 photoLibrary];
  BOOL v5 = [v4 librarySpecificFetchOptions];

  BOOL v6 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v5 setIncludedDetectionTypes:v6];

  id v7 = [MEMORY[0x1E4F391F0] fetchPersonsInSocialGroup:v3 option:v5];

  return v7;
}

+ (id)socialGroupFetchResultFromFastEnumeration:(id)a3 photoLibrary:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v8 = v7;

    if (v8) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  id v9 = v7;
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_11:
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(v10, "addObject:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    goto LABEL_19;
  }
  id v10 = v9;

  if (!v10) {
    goto LABEL_11;
  }
LABEL_19:
  id v16 = objc_alloc(MEMORY[0x1E4F39150]);
  id v17 = [MEMORY[0x1E4F39300] fetchType];
  id v8 = (id)[v16 initWithObjects:v10 photoLibrary:v6 fetchType:v17 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

LABEL_20:
  return v8;
}

+ (id)peopleFetchResultFromFastEnumeration:(id)a3 photoLibrary:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v8 = v7;

    if (v8) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  id v9 = v7;
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_11:
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(v10, "addObject:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    goto LABEL_19;
  }
  id v10 = v9;

  if (!v10) {
    goto LABEL_11;
  }
LABEL_19:
  id v16 = objc_alloc(MEMORY[0x1E4F39150]);
  id v17 = [MEMORY[0x1E4F391F0] fetchType];
  id v8 = (id)[v16 initWithObjects:v10 photoLibrary:v6 fetchType:v17 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

LABEL_20:
  return v8;
}

+ (id)peopleArrayFromFastEnumeration:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = v3;

    if (v4) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  id v5 = v3;
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_11;
  }
  id v6 = v5;

  if (!v6)
  {
LABEL_11:
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v7, "addObject:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }

    id v4 = (id)[v7 copy];
    id v6 = 0;
    goto LABEL_19;
  }
  id v4 = [v6 fetchedObjects];
LABEL_19:

LABEL_20:
  return v4;
}

+ (id)sortedPersons:(id)a3 byPersonMemoryFeatures:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v13 type] == 1)
        {
          long long v14 = [v13 personLocalIdentifier];
          [v7 addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __58__PXPeopleUtilities_sortedPersons_byPersonMemoryFeatures___block_invoke;
  v18[3] = &unk_1E5DBED00;
  id v19 = v7;
  id v15 = v7;
  long long v16 = [v5 sortedArrayUsingComparator:v18];

  return v16;
}

uint64_t __58__PXPeopleUtilities_sortedPersons_byPersonMemoryFeatures___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = NSNumber;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = [a2 localIdentifier];
  uint64_t v9 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", v8));
  uint64_t v10 = NSNumber;
  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = [v7 localIdentifier];

  uint64_t v13 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "indexOfObject:", v12));
  uint64_t v14 = [v9 compare:v13];

  return v14;
}

+ (void)unblockPersonsInLibrary:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F39160];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 memoriesWithBlockedPersonFeatureInPhotoLibrary:v7];
  uint64_t v9 = (void *)MEMORY[0x1E4F391F0];
  uint64_t v10 = [v7 librarySpecificFetchOptions];
  uint64_t v11 = [v9 fetchPersonsWithUserFeedbackWithOptions:v10];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__PXPeopleUtilities_unblockPersonsInLibrary_completion___block_invoke;
  v14[3] = &unk_1E5DD32A8;
  id v15 = v8;
  id v16 = v11;
  id v12 = v11;
  id v13 = v8;
  [v7 performChanges:v14 completionHandler:v6];
}

void __56__PXPeopleUtilities_unblockPersonsInLibrary_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F39170] unblockPersonsInMemoriesWithBlockedPersonFeature:*(void *)(a1 + 32)];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(MEMORY[0x1E4F39200], "changeRequestForPerson:", *(void *)(*((void *)&v8 + 1) + 8 * v6), (void)v8);
        [v7 setUserFeedback:0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

+ (id)summaryTitleForLibrary:(id)a3 count:(int64_t)a4
{
  uint64_t v4 = objc_msgSend(a1, "locKeyForPersonOrPet:withVisibility:key:", 0, objc_msgSend(a3, "px_peoplePetsHomeVisibility"), @"PXPeopleHomeSummaryQuantitySubtitle");
  uint64_t v5 = PXLocalizedStringWithCount(v4);

  return v5;
}

+ (id)memoryTitleStringFromPeople:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PXLocalizedStringFromTable(@"PXRelatedPeoplePortraitOf", @"PhotosUICore");
  uint64_t v6 = PXLocalizedStringFromTable(@"PXRelatedPeopleTogether", @"PhotosUICore");
  id v7 = [a1 _titleStringForPeople:v4 singlePersonFallback:v5 groupFallback:v6];

  return v7;
}

+ (id)slideshowTitleStringForPeople:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PXLocalizedStringFromTable(@"PXRelatedPeopleTogether", @"PhotosUICore");
  uint64_t v6 = [a1 _titleStringForPeople:v4 singlePersonFallback:&stru_1F00B0030 groupFallback:v5];

  return v6;
}

+ (id)_titleStringForPeople:(id)a3 singlePersonFallback:(id)a4 groupFallback:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [v8 count];
  id v12 = [a1 titleStringForPeople:v8];
  long long v25 = 0u;
  long long v26 = 0u;
  BOOL v13 = (unint64_t)[v12 length] > 0x16;
  long long v27 = 0u;
  long long v28 = 0u;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "px_localizedName", (void)v25);
        long long v20 = v19;
        if (!v19 || ![v19 length])
        {

          BOOL v13 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  if (v11 == 1 && (v21 = v9, v13) || (v11 > 3 ? (int v22 = 1) : (int v22 = v13), v21 = v10, v22 == 1))
  {
    id v23 = v21;

    id v12 = v23;
  }

  return v12;
}

+ (id)titleStringForPeople:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 count];
  uint64_t v5 = &stru_1F00B0030;
  if (v4)
  {
    uint64_t v6 = v4;
    if (v4 == 1)
    {
      id v7 = [v3 firstObject];
      uint64_t v8 = objc_msgSend(v7, "px_localizedName");
      id v9 = (void *)v8;
      if (v8) {
        id v10 = (__CFString *)v8;
      }
      else {
        id v10 = &stru_1F00B0030;
      }
      uint64_t v5 = v10;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v11 = v3;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "px_localizedName");
            uint64_t v17 = v16;
            if (v16 && [v16 length]) {
              [v7 addObject:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v13);
      }

      uint64_t v18 = [v7 count];
      if (v18)
      {
        uint64_t v19 = v6 - v18;
        if (v6 == v18)
        {
          uint64_t v5 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v7];
        }
        else
        {
          long long v20 = (void *)MEMORY[0x1E4F28DF8];
          long long v21 = PXLocalizedStringFromTable(@"PXSocialGroupTitleOthers", @"PhotosUICore");
          int v22 = PXStringWithValidatedFormat();
          id v23 = objc_msgSend(v7, "arrayByAddingObject:", v22, v19);
          uint64_t v5 = [v20 localizedStringByJoiningStrings:v23];
        }
      }
      else
      {
        uint64_t v5 = &stru_1F00B0030;
      }
    }
  }
  return v5;
}

+ (id)defaultTitleStringForSocialGroup:(id)a3
{
  return (id)objc_msgSend(a3, "px_defaultTitle");
}

+ (id)titleStringForSocialGroup:(id)a3
{
  return (id)objc_msgSend(a3, "px_title");
}

+ (id)titleStringForPerson:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  uint64_t v5 = [v3 arrayWithObjects:&v8 count:1];
  uint64_t v6 = +[PXPeopleUtilities titleStringForPeople:](PXPeopleUtilities, "titleStringForPeople:", v5, v8, v9);

  return v6;
}

+ (BOOL)_isPhotosProcess
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];

  if ([v3 isEqualToString:@"com.apple.Photos"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"com.apple.mobileslideshow"];
  }

  return v4;
}

+ (void)_setDaysDictionary:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v5 = [v3 standardUserDefaults];
  [v5 setObject:v4 forKey:@"PXPeopleCandidateWidgetKey"];
}

+ (id)_daysDictionary
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"PXPeopleCandidateWidgetKey"];

  if (v3) {
    id v4 = (void *)v3;
  }
  else {
    id v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v4;
}

+ (BOOL)_hasRecentlyHandledBootstrapOrSuggestionForPerson:(id)a3
{
  id v4 = a3;
  if (+[PXPeopleUtilities _isPhotosProcess])
  {
    id v5 = [a1 _daysDictionary];
    uint64_t v6 = +[PXPeopleCandidateWidgetUtilities removeAllPreviousNotNowPersonsIfNeededForDaysDictionary:v5];
    if (([v5 isEqualToDictionary:v6] & 1) == 0) {
      +[PXPeopleUtilities _setDaysDictionary:v6];
    }
    BOOL v7 = !+[PXPeopleCandidateWidgetUtilities shouldFetchCandidatesForPerson:v4 forDaysDictionary:v6];
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (BOOL)canShowSuggestionForPerson:(id)a3
{
  return [a1 _hasRecentlyHandledBootstrapOrSuggestionForPerson:a3] ^ 1;
}

+ (void)resetTemporarilySuppressedBootstrapOrSuggestions
{
  if (+[PXPeopleUtilities _isPhotosProcess])
  {
    uint64_t v2 = MEMORY[0x1E4F1CC08];
    +[PXPeopleUtilities _setDaysDictionary:v2];
  }
}

+ (void)temporarilySuppressBootstrapOrSuggestionForPerson:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[PXPeopleUtilities _isPhotosProcess])
  {
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_INFO, "People UI: temporarilySuppressBootstrapOrSuggestionForPerson: %@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v6 = [a1 _daysDictionary];
    BOOL v7 = +[PXPeopleCandidateWidgetUtilities insertPerson:v4 forDaysDictionary:v6];

    id v8 = +[PXPeopleCandidateWidgetUtilities removeAllPreviousNotNowPersonsIfNeededForDaysDictionary:v7];

    +[PXPeopleUtilities _setDaysDictionary:v8];
  }
}

+ (BOOL)shouldShowBootstrapForPerson:(id)a3 context:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = +[PXPeopleUtilities _hasRecentlyHandledBootstrapOrSuggestionForPerson:v5];
  id v8 = +[PXPeopleUISettings sharedInstance];
  int v9 = [v8 alwaysShowBootstrap];

  if (v5) {
    char v10 = !v7 | v9;
  }
  else {
    char v10 = 0;
  }
  if (v7)
  {
    uint64_t v11 = PLUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_INFO, "People UI: Should not show bootstrap; bootstrap has been handled recently for person: %@ context: %@",
        (uint8_t *)&v16,
        0x16u);
    }

    if (v5)
    {
LABEL_6:
      if (!v9) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }
  }
  else if (v5)
  {
    goto LABEL_6;
  }
  uint64_t v12 = PLUIGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_INFO, "People UI: Should not show bootstrap; person is nil for context: %@",
      (uint8_t *)&v16,
      0xCu);
  }

  if (!v9)
  {
LABEL_7:
    if (v10) {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
LABEL_15:
  uint64_t v13 = PLUIGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412546;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_INFO, "People UI: Always show bootstrap flag is enabled for person: %@ context: %@", (uint8_t *)&v16, 0x16u);
  }

  if ((v10 & 1) == 0)
  {
LABEL_18:
    uint64_t v14 = PLUIGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_INFO, "People UI: Should not show bootstrap; the resolved BOOL is NO for person: %@ context: %@",
        (uint8_t *)&v16,
        0x16u);
    }
  }
LABEL_21:

  return v10;
}

+ (BOOL)shouldShowBootstrapForPerson:(id)a3
{
  return +[PXPeopleUtilities shouldShowBootstrapForPerson:a3 context:0];
}

+ (void)_peopleFaceTilesForFaces:(id)a3 asset:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v44 = a5;
  uint64_t v11 = (void (**)(id, void *, id))a6;
  id v12 = v10;
  uint64_t v42 = v11;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v15 = v9;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v51 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        long long v21 = [[PXPeopleFaceTile alloc] initWithFace:v20 asset:v12 person:0];
        int v22 = [v20 personLocalIdentifier];
        if (v22) {
          [v13 setObject:v21 forKey:v22];
        }
        id v23 = [v20 localIdentifier];
        [v14 setObject:v21 forKey:v23];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v17);
  }
  double v43 = v12;
  double v41 = v15;

  uint64_t v24 = (void *)MEMORY[0x1E4F391F0];
  long long v25 = [v13 allKeys];
  long long v26 = [v24 fetchPersonsWithLocalIdentifiers:v25 options:v44];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v26;
  uint64_t v27 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v47 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = *(void **)(*((void *)&v46 + 1) + 8 * j);
        id v32 = [v31 localIdentifier];
        uint64_t v33 = [v13 objectForKeyedSubscript:v32];

        id v34 = [PXPeopleFaceTile alloc];
        BOOL v35 = [v33 face];
        id v36 = [v33 asset];
        double v37 = [(PXPeopleFaceTile *)v34 initWithFace:v35 asset:v36 person:v31];

        char v38 = [(PXPeopleFaceTile *)v37 face];
        double v39 = [v38 localIdentifier];
        [v14 setObject:v37 forKey:v39];
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v28);
  }

  double v40 = [v14 allValues];
  v42[2](v42, v40, obj);
}

+ (CGRect)faceRectForPeopleFaceTile:(id)a3
{
  id v3 = a3;
  id v4 = [v3 asset];
  id v5 = [v3 face];

  objc_msgSend(v5, "px_cropRectWithCropFactor:", 1.5);
  [v4 pixelWidth];
  [v4 pixelHeight];
  PXRectDenormalize();
}

+ (id)personFaceTileByPersonIdForPersons:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_msgSend(v3, "_pl_indexBy:", &__block_literal_global_323_143681);
    id v5 = [MEMORY[0x1E4F39050] fetchKeyFaceByPersonLocalIdentifierForPersons:v3 options:0];
    id v6 = (void *)MEMORY[0x1E4F38EB8];
    BOOL v7 = [v5 allValues];
    id v8 = [v6 fetchAssetsGroupedByFaceUUIDForFaces:v7];

    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__PXPeopleUtilities_personFaceTileByPersonIdForPersons___block_invoke_2;
    v15[3] = &unk_1E5DBECD8;
    id v16 = v4;
    id v17 = v8;
    id v18 = v9;
    id v10 = v9;
    id v11 = v8;
    id v12 = v4;
    [v5 enumerateKeysAndObjectsUsingBlock:v15];
    id v13 = (void *)[v10 copy];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v13;
}

void __56__PXPeopleUtilities_personFaceTileByPersonIdForPersons___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
  BOOL v7 = *(void **)(a1 + 40);
  id v8 = [v5 uuid];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = [[PXPeopleFaceTile alloc] initWithFace:v5 asset:v9 person:v6];
    [*(id *)(a1 + 48) setObject:v10 forKey:v11];
  }
}

uint64_t __56__PXPeopleUtilities_personFaceTileByPersonIdForPersons___block_invoke(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

+ (id)generateNewFaceTileFromFaceTile:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 face];
  id v5 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:0 orObject:v4];
  id v6 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v5 setIncludedDetectionTypes:v6];

  BOOL v7 = (void *)MEMORY[0x1E4F39050];
  id v8 = [v4 localIdentifier];
  v23[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v10 = [v7 fetchFacesWithLocalIdentifiers:v9 options:v5];
  id v11 = [v10 firstObject];

  uint64_t v12 = [v11 personLocalIdentifier];
  id v13 = (void *)v12;
  if (v12)
  {
    id v14 = (void *)MEMORY[0x1E4F391F0];
    uint64_t v22 = v12;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    id v16 = [v14 fetchPersonsWithLocalIdentifiers:v15 options:v5];
    id v17 = [v16 firstObject];
  }
  else
  {
    id v17 = 0;
  }
  id v18 = [PXPeopleFaceTile alloc];
  id v19 = [v3 asset];

  uint64_t v20 = [(PXPeopleFaceTile *)v18 initWithFace:v11 asset:v19 person:v17];
  return v20;
}

+ (void)peopleFaceTilesForFaces:(id)a3 asset:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 count];
  if (v11 && v14)
  {
    if (!v12)
    {
      id v12 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:0 orObject:v11];
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __70__PXPeopleUtilities_peopleFaceTilesForFaces_asset_options_completion___block_invoke;
    v15[3] = &unk_1E5DBECB0;
    id v16 = v13;
    [a1 _peopleFaceTilesForFaces:v10 asset:v11 options:v12 completion:v15];
  }
  else
  {
    (*((void (**)(id, void))v13 + 2))(v13, MEMORY[0x1E4F1CBF0]);
  }
}

uint64_t __70__PXPeopleUtilities_peopleFaceTilesForFaces_asset_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)peopleFaceTilesForAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v9 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:0 orObject:v8];
    id v11 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
    [v9 setIncludedDetectionTypes:v11];

    [v9 setIncludeTorsoAndFaceDetectionData:1];
  }
  id v12 = [MEMORY[0x1E4F39050] fetchFacesInAsset:v8 options:v9];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__PXPeopleUtilities_peopleFaceTilesForAsset_options_completion___block_invoke;
  v15[3] = &unk_1E5DBEC88;
  id v16 = v12;
  id v17 = v10;
  id v13 = v12;
  id v14 = v10;
  [a1 _peopleFaceTilesForFaces:v13 asset:v8 options:v9 completion:v15];
}

uint64_t __64__PXPeopleUtilities_peopleFaceTilesForAsset_options_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

+ (BOOL)isFavoritePerson:(id)a3
{
  return [a3 type] == 1;
}

+ (id)lastManuallySortedPersonInSectionOfType:(int64_t)a3
{
  if (a3 < 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PXPeopleUtilities.m", 453, @"Invalid parameter not satisfying: %@", @"type >= PHPersonTypeOrdinary" object file lineNumber description];
  }
  id v5 = [a1 _peopleHomeFetchResultForPersonType:a3];
  id v6 = [v5 fetchedObjects];
  BOOL v7 = [a1 comparatorByPeopleHomeSortingType:0];
  id v8 = [v6 sortedArrayUsingComparator:v7];

  id v9 = [v8 lastObject];

  return v9;
}

+ (int64_t)manualOrderForInsertingAtEndOfSectionWithType:(int64_t)a3
{
  if (a3 < 0) {
    return 0;
  }
  id v3 = +[PXPeopleUtilities lastManuallySortedPersonInSectionOfType:](PXPeopleUtilities, "lastManuallySortedPersonInSectionOfType:");
  int64_t v4 = [v3 manualOrder] + 1;

  return v4;
}

+ (void)setSortOrder:(unint64_t)a3 toPhotoLibrary:(id)a4
{
  id v5 = a4;
  +[PXPeopleSwiftUtilities setWithSortOrder:to:](PXPeopleSwiftUtilities, "setWithSortOrder:to:", +[PXPeopleSwiftUtilities sortOrderFor:a3], v5);
}

+ (unint64_t)currentSortOrderFor:(id)a3
{
  int64_t v3 = +[PXPeopleSwiftUtilities currentSortOrderFor:a3];
  return +[PXPeopleSwiftUtilities rawValueFor:v3];
}

+ (NSArray)reverseSortDescriptorsForManualSort
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"manualOrder" ascending:0];
  v6[0] = v2;
  int64_t v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v6[1] = v3;
  int64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return (NSArray *)v4;
}

+ (NSArray)sortDescriptorsForManualSort
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"manualOrder" ascending:1];
  v6[0] = v2;
  int64_t v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v6[1] = v3;
  int64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return (NSArray *)v4;
}

+ (id)comparatorByPeopleHomeSortingType:(unint64_t)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke;
  aBlock[3] = &__block_descriptor_48_e18___PHPerson_16__0_8l;
  void aBlock[4] = a2;
  aBlock[5] = a1;
  int64_t v4 = _Block_copy(aBlock);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke_2;
  v27[3] = &unk_1E5DBEBE8;
  id v5 = v4;
  id v28 = v5;
  id v6 = _Block_copy(v27);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke_4;
  v25[3] = &unk_1E5DBEC10;
  id v26 = v5;
  id v7 = v5;
  id v8 = _Block_copy(v25);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke_5;
  void v20[3] = &unk_1E5DBEC38;
  id v21 = v6;
  id v22 = &__block_literal_global_313;
  unint64_t v24 = a3;
  id v9 = v8;
  id v23 = v9;
  id v10 = v6;
  id v11 = _Block_copy(v20);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke_6;
  v16[3] = &unk_1E5DBEC60;
  id v18 = v9;
  unint64_t v19 = a3;
  id v17 = v11;
  id v12 = v9;
  id v13 = v11;
  id v14 = _Block_copy(v16);

  return v14;
}

id __55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:*(void *)(a1 + 32), *(void *)(a1 + 40), @"PXPeopleUtilities.m", 354, @"Unexpected object type: %@", v3 object file lineNumber description];

      abort();
    }
    id v4 = [v3 modelObject];
  }
  id v5 = v4;

  return v5;
}

__CFString *__55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke_2(uint64_t a1)
{
  id v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  objc_msgSend(v1, "px_localizedName");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (!v2) {
    uint64_t v2 = &stru_1F00B0030;
  }
  id v4 = v2;

  return v4;
}

uint64_t __55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  unint64_t v8 = [v7 manualOrder];

  id v9 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  unint64_t v10 = [v9 manualOrder];

  if (v8 <= v10)
  {
    if (v8 >= v10)
    {
      id v12 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      id v13 = [v12 uuid];
      id v14 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      id v15 = [v14 uuid];
      uint64_t v11 = [v13 compare:v15];
    }
    else
    {
      uint64_t v11 = -1;
    }
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

uint64_t __55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke_5(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (*(void (**)(void))(a1[4] + 16))();
  unint64_t v8 = (*(void (**)(void))(a1[4] + 16))();
  int v9 = (*(uint64_t (**)(void))(a1[5] + 16))();
  int v10 = (*(uint64_t (**)(void))(a1[5] + 16))();
  int v11 = v10 ^ 1;
  if ((v9 ^ 1) & 1) != 0 || (v11)
  {
    if ((v9 ^ 1 | v10) == 1)
    {
      if ((v9 | v11) == 1) {
        uint64_t v13 = (*(uint64_t (**)(void))(a1[6] + 16))();
      }
      else {
        uint64_t v13 = 1;
      }
    }
    else
    {
      uint64_t v13 = -1;
    }
  }
  else
  {
    uint64_t v12 = [v7 localizedStandardCompare:v8];
    if (a1[7] == 1) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = -v12;
    }
  }

  return v13;
}

uint64_t __55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = *(void *)(a1 + 48);
  if (!v8)
  {
    uint64_t v9 = a1 + 40;
    goto LABEL_6;
  }
  if (v8 == 2 || v8 == 1)
  {
    uint64_t v9 = a1 + 32;
LABEL_6:
    uint64_t v3 = (*(uint64_t (**)(void))(*(void *)v9 + 16))();
  }

  return v3;
}

BOOL __55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 length] != 0;
}

+ (void)unlinkContactInfoForPerson:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 photoLibrary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__PXPeopleUtilities_unlinkContactInfoForPerson_completion___block_invoke;
  v9[3] = &unk_1E5DD36F8;
  id v10 = v5;
  id v8 = v5;
  [v7 performChanges:v9 completionHandler:v6];
}

void __59__PXPeopleUtilities_unlinkContactInfoForPerson_completion___block_invoke(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F39200] changeRequestForPerson:*(void *)(a1 + 32)];
  [v1 setName:0];
  [v1 setDisplayName:0];
  [v1 setContactMatchingDictionary:MEMORY[0x1E4F1CC08]];
  [v1 setPersonUri:&stru_1F00B0030];
}

+ (id)fetchMeContact
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PXPeopleUtilities sharedContactStore];
  v13[0] = *MEMORY[0x1E4F1AF98];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v8 = 0;
  id v4 = [v2 _crossPlatformUnifiedMeContactWithKeysToFetch:v3 error:&v8];
  id v5 = v8;

  if (v5)
  {
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v10 = "+[PXPeopleUtilities fetchMeContact]";
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "%s: Error fetching the me contact: %@", buf, 0x16u);
    }

    id v4 = 0;
  }

  return v4;
}

+ (BOOL)isGreenTeaAndContactsAccessDenied
{
  if (isGreenTeaAndContactsAccessDenied_onceToken != -1) {
    dispatch_once(&isGreenTeaAndContactsAccessDenied_onceToken, &__block_literal_global_304_143704);
  }
  return isGreenTeaAndContactsAccessDenied_isGreenTeaAndAccessDenied;
}

uint64_t __54__PXPeopleUtilities_isGreenTeaAndContactsAccessDenied__block_invoke()
{
  uint64_t result = PLIsChinaSKU();
  if (result)
  {
    uint64_t result = [MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0];
    isGreenTeaAndContactsAccessDenied_isGreenTeaAndAccessDenied = (unint64_t)(result - 1) < 2;
  }
  return result;
}

+ (id)facesForPerson:(id)a3 inAssets:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 fetchedObjectIDs];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v26 + 1) + 8 * i) objectID];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v10);
    }
  }
  id v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in (%@)", @"assetForFace", v7, (void)v26];
  id v15 = (void *)MEMORY[0x1E4F28F60];
  id v16 = [v5 objectID];
  id v17 = [v15 predicateWithFormat:@"noindex:(%K) = %@", @"personForFace", v16];

  id v18 = (void *)MEMORY[0x1E4F28BA0];
  v30[0] = v14;
  v30[1] = v17;
  unint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  uint64_t v20 = [v18 andPredicateWithSubpredicates:v19];

  id v21 = [v5 photoLibrary];
  id v22 = [v21 librarySpecificFetchOptions];

  [v22 setInternalPredicate:v20];
  [v22 setIncludeTorsoAndFaceDetectionData:1];
  id v23 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v22 setIncludedDetectionTypes:v23];

  unint64_t v24 = [MEMORY[0x1E4F39050] fetchFacesWithOptions:v22];

  return v24;
}

+ (BOOL)isPersonHiddenFromPeopleHome:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 type] == -1 || objc_msgSend(v3, "verifiedType") == 0;

  return v4;
}

+ (id)sortDescriptorsWithPersonAssetSortOrder:(int64_t)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"dateCreated" ascending:a3 == 1];
  v7[0] = v3;
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"uuid" ascending:1];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)assetCollectionListFetchResultForPeople:(id)a3 assetCollectionFetchResults:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 firstObject];
  id v6 = [v5 photoLibrary];
  id v7 = [v6 librarySpecificFetchOptions];
  v40[0] = *MEMORY[0x1E4F39440];
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  [v7 setFetchPropertySets:v8];

  [v7 setIncludeTorsoAndFaceDetectionData:1];
  uint64_t v32 = v7;
  uint64_t v33 = v6;
  uint64_t v31 = v5;
  if ([v4 count] == 1)
  {
    int v9 = objc_msgSend(v5, "px_isHuman");
    uint64_t v10 = @"PXPetVirtualCollection";
    if (v9) {
      uint64_t v10 = @"PXPersonVirtualCollection";
    }
    uint64_t v11 = v10;
    id v12 = [v5 localIdentifier];
    uint64_t v13 = [MEMORY[0x1E4F38EB8] fetchAssetsForPersons:v4 options:v7];
  }
  else
  {
    id v14 = +[PXPeopleUtilities identifiersForPeople:v4];
    id v34 = 0;
    id v15 = [v6 assetIdentifiersForPersonIdentifiers:v14 error:&v34];
    id v16 = v34;
    if ([v15 count])
    {
      uint64_t v13 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v15 options:v32];
    }
    else
    {
      if (v16)
      {
        id v17 = PLUIGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v18 = [v16 localizedDescription];
          *(_DWORD *)buf = 138412290;
          double v39 = v18;
          _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_ERROR, "Error while getting assets for social group: %@", buf, 0xCu);
        }
      }
      uint64_t v13 = 0;
    }
    uint64_t v11 = @"PXSocialGroupVirtualCollection";
    unint64_t v19 = @"PXSocialGroupVirtualCollection";
    uint64_t v20 = [MEMORY[0x1E4F29128] UUID];
    id v12 = [v20 UUIDString];

    id v6 = v33;
  }
  id v21 = [(__CFString *)v11 stringByAppendingFormat:@"-%@", v12];
  if ([v13 count])
  {
    id v22 = +[PXPeopleUtilities titleStringForPeople:v4];
    id v23 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v13 title:v22 identifier:v21];
    unint64_t v24 = (void *)MEMORY[0x1E4F39008];
    double v37 = v23;
    long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    long long v26 = [v24 transientCollectionListWithCollections:v25 title:v22];

    long long v27 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:v6 orObject:0];
    long long v28 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v26 options:v27];
    if (a4)
    {
      BOOL v35 = v23;
      id v36 = v13;
      *a4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    }
  }
  else
  {
    long long v28 = 0;
  }

  return v28;
}

+ (id)assetCollectionListFetchResultForPerson:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F38EB8];
  v15[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:v15 count:1];
  id v7 = [v3 fetchAssetsForPersons:v6 options:0];

  id v8 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v7 title:0];
  int v9 = (void *)MEMORY[0x1E4F39008];
  id v14 = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  uint64_t v11 = [v9 transientCollectionListWithCollections:v10 title:0];

  id v12 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v11 options:0];

  return v12;
}

+ (id)identifiersForPeople:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "localIdentifier", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)mergePersons:(id)a3 withPerson:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [MEMORY[0x1E4F1CA80] setWithArray:a3];
  [v6 addObject:v5];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        [v13 fetchPropertySetsIfNeeded];
        long long v14 = [v13 userFeedbackProperties];
        long long v15 = [v14 userFeedback];

        if (v13) {
          BOOL v16 = v15 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16) {
          uint64_t v10 = objc_msgSend(MEMORY[0x1E4F39330], "mergeFeedbackType:withOtherFeedbackType:", objc_msgSend(v15, "type"), v10);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  uint64_t v17 = [v5 photoLibrary];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __45__PXPeopleUtilities_mergePersons_withPerson___block_invoke;
  v25[3] = &unk_1E5DD0D90;
  id v18 = v7;
  id v26 = v18;
  id v19 = v5;
  id v27 = v19;
  uint64_t v28 = v10;
  id v24 = 0;
  char v20 = [v17 performChangesAndWait:v25 error:&v24];
  id v21 = v24;

  if ((v20 & 1) == 0)
  {
    id v22 = PLUIGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v21;
      _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_ERROR, "People merging failed with error: %@", buf, 0xCu);
    }
  }
  return v20;
}

void __45__PXPeopleUtilities_mergePersons_withPerson___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F39200];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) localIdentifier];
  id v10 = [v2 changeRequestForMergingPersons:v3 nominalTargetIdentifier:v4];

  id v5 = [v10 targetPerson];
  uint64_t v6 = [v5 userFeedbackProperties];
  id v7 = [v6 userFeedback];
  uint64_t v8 = [v7 type];

  if (*(void *)(a1 + 48) != v8)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F39330]) initWithType:*(void *)(a1 + 48) feature:0 context:0];
    [v10 setUserFeedback:v9];
  }
}

+ (id)_peopleHomeFetchResultForPersonType:(int64_t)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v5 = [v4 librarySpecificFetchOptions];

  [v5 setPersonContext:1];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v5 setIncludedDetectionTypes:v6];

  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != -1", @"manualOrder");
  [v5 setPredicate:v7];

  uint64_t v8 = [MEMORY[0x1E4F391F0] fetchPersonsWithType:a3 options:v5];

  return v8;
}

+ (id)personWithLocalIdentifier:(id)a3 propertySets:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F39228];
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v6, "px_deprecated_appPhotoLibrary");
  uint64_t v9 = [v8 librarySpecificFetchOptions];

  [v9 setFetchLimit:1];
  id v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"localIdentifier = %@", v7];

  [v9 setPredicate:v10];
  [v9 setMinimumUnverifiedFaceCount:1];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v9 setIncludedDetectionTypes:v11];

  if (v5 && [v5 count]) {
    [v9 setFetchPropertySets:v5];
  }
  long long v12 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v9];
  long long v13 = [v12 firstObject];

  return v13;
}

+ (id)personWithLocalIdentifier:(id)a3
{
  return (id)[a1 personWithLocalIdentifier:a3 propertySets:0];
}

+ (id)finalMergeTargetPersonForPersonWithUUID:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F390A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setFetchLimit:1];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  [v5 setPhotoLibrary:v6];

  id v7 = [MEMORY[0x1E4F391F0] fetchFinalMergeTargetPersonsForPersonWithUUID:v4 options:v5];

  uint64_t v8 = [v7 firstObject];

  return v8;
}

+ (id)fetchPeopleWithUUIDs:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 librarySpecificFetchOptions];
  [v6 setPersonContext:1];
  id v7 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v6 setIncludedDetectionTypes:v7];

  PXMap();
}

uint64_t __55__PXPeopleUtilities_fetchPeopleWithUUIDs_photoLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F391F0] localIdentifierWithUUID:a2];
}

+ (id)peopleWithPersonUris:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PXPeopleUtilities.m", 88, @"Invalid parameter not satisfying: %@", @"personUris" object file lineNumber description];
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v7 = [v6 librarySpecificFetchOptions];

  [v7 setPersonContext:1];
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"personUri IN (%@)", v5];
  [v7 setPredicate:v8];

  uint64_t v9 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v7];

  return v9;
}

+ (id)personWithPersonUri:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PXPeopleUtilities.m", 77, @"Invalid parameter not satisfying: %@", @"personUri" object file lineNumber description];
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v7 = [v6 librarySpecificFetchOptions];

  [v7 setPersonContext:1];
  [v7 setFetchLimit:1];
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"personUri = %@", v5];
  [v7 setPredicate:v8];

  uint64_t v9 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v7];
  id v10 = [v9 firstObject];

  return v10;
}

@end