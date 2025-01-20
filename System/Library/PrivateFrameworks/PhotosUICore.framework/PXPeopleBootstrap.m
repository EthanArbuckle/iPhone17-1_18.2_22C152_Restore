@interface PXPeopleBootstrap
+ (BOOL)_namePerson:(id)a3 toContact:(id)a4 changeRequest:(id)a5 context:(id)a6;
+ (CGSize)preferredBootstrapSize;
+ (void)_favoritePersonWithChangeRequest:(id)a3;
+ (void)_mergePerson:(id)a3 context:(id)a4 toPerson:(id)a5;
+ (void)_namePerson:(id)a3 context:(id)a4 withChangeRequest:(id)a5;
+ (void)_namePerson:(id)a3 toContact:(id)a4 withChangeRequest:(id)a5;
+ (void)_namePerson:(id)a3 toString:(id)a4 withChangeRequest:(id)a5;
+ (void)_unfavoritePersonWithChangeRequest:(id)a3;
+ (void)nameAndVerifyPerson:(id)a3 toContact:(id)a4 photoLibrary:(id)a5 completionHandler:(id)a6;
+ (void)nameAndVerifyPerson:(id)a3 toName:(id)a4 photoLibrary:(id)a5 completionHandler:(id)a6;
+ (void)performBootstrapWithSourcePerson:(id)a3 context:(id)a4 synchronous:(BOOL)a5 completion:(id)a6;
@end

@implementation PXPeopleBootstrap

+ (void)_mergePerson:(id)a3 context:(id)a4 toPerson:(id)a5
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (v7
    && v9
    && ([v7 isEqual:v9] & 1) == 0
    && objc_msgSend(v7, "px_isSameDetectionTypeAsPerson:", v10))
  {
    uint64_t v11 = [v10 type];
    uint64_t v12 = [v7 type];
    if (v11 >= v12) {
      v13 = v10;
    }
    else {
      v13 = v7;
    }
    if (v11 >= v12) {
      v14 = v7;
    }
    else {
      v14 = v10;
    }
    id v15 = v13;
    id v16 = v14;
    v17 = (void *)MEMORY[0x1E4F39200];
    v22[0] = v16;
    v22[1] = v15;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    v19 = [v15 localIdentifier];
    v20 = [v17 changeRequestForMergingPersons:v18 nominalTargetIdentifier:v19];

    v21 = [v20 targetPerson];
    [v8 setTargetPerson:v21];
  }
}

+ (void)_namePerson:(id)a3 toContact:(id)a4 withChangeRequest:(id)a5
{
  id v12 = a4;
  id v6 = a5;
  id v7 = [v12 identifier];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F391F0] fullNameFromContact:v12];
    id v9 = [MEMORY[0x1E4F391F0] displayNameFromContact:v12];
    v10 = +[PXPeopleUtilities sharedContactStore];
    uint64_t v11 = [MEMORY[0x1E4F8A768] matchingDictionaryForContact:v12 contactStore:v10];
    [v6 setContactMatchingDictionary:v11];
    [v6 setPersonUri:v7];
    [v6 setName:v8];
    [v6 setDisplayName:v9];
  }
}

+ (void)_namePerson:(id)a3 toString:(id)a4 withChangeRequest:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v12 displayName];
  if (([v9 isEqualToString:v7] & 1) == 0)
  {

    goto LABEL_5;
  }
  v10 = [v12 personUri];
  uint64_t v11 = [v10 length];

  if (v11)
  {
LABEL_5:
    [v8 setName:v7];
    [v8 setDisplayName:v7];
    [v8 setPersonUri:&stru_1F00B0030];
    [v8 setContactMatchingDictionary:MEMORY[0x1E4F1CC08]];
  }
}

+ (void)_namePerson:(id)a3 context:(id)a4 withChangeRequest:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 nameSelection];
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 selectionType];
    switch(v12)
    {
      case 1:
        id v16 = [v11 person];
        [a1 _mergePerson:v18 context:v8 toPerson:v16];

        [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.people.naming.personChosen" withPayload:MEMORY[0x1E4F1CC08]];
        [v18 verifiedType];
        goto LABEL_16;
      case 2:
        v17 = [v11 contact];
        BOOL v15 = +[PXPeopleBootstrap _namePerson:v18 toContact:v17 changeRequest:v9 context:v8];
        [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.people.naming.contactChosen" withPayload:MEMORY[0x1E4F1CC08]];

        break;
      case 3:
        v13 = [v11 name];
        [a1 _namePerson:v18 toString:v13 withChangeRequest:v9];

        [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.people.naming.stringChosen" withPayload:MEMORY[0x1E4F1CC08]];
        v14 = v18;
        BOOL v15 = 0;
LABEL_12:
        if (![v14 verifiedType] && !v15 && objc_msgSend(v8, "bootstrapType") == 1) {
          objc_msgSend(v9, "setManualOrder:", +[PXPeopleUtilities manualOrderForInsertingAtEndOfSectionWithType:](PXPeopleUtilities, "manualOrderForInsertingAtEndOfSectionWithType:", 0));
        }
        goto LABEL_16;
      default:
        BOOL v15 = 0;
        break;
    }
    v14 = v18;
    goto LABEL_12;
  }
  if ([v8 wantsContactUnlinkage])
  {
    [v9 setName:&stru_1F00B0030];
    [v9 setDisplayName:&stru_1F00B0030];
    [v9 setPersonUri:&stru_1F00B0030];
    [v9 setContactMatchingDictionary:MEMORY[0x1E4F1CC08]];
  }
LABEL_16:
}

+ (BOOL)_namePerson:(id)a3 toContact:(id)a4 changeRequest:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v11 identifier];
  uint64_t v15 = +[PXPeopleUtilities personWithPersonUri:v14];
  if (v15)
  {
    id v16 = (void *)v15;
    id v24 = v13;
    v17 = [MEMORY[0x1E4F39200] changeRequestForPerson:v15];
    [a1 _namePerson:v16 toContact:v11 withChangeRequest:v17];
    char v18 = [v16 isEqual:v10];
    if (v18)
    {
      [a1 _namePerson:v10 toContact:v11 withChangeRequest:v12];
    }
    else
    {
      v23 = [MEMORY[0x1E4F39200] changeRequestForPerson:v16];
      [a1 _namePerson:v16 toContact:v11 withChangeRequest:v23];
      v20 = [v16 localIdentifier];
      uint64_t v21 = +[PXPeopleUtilities personWithLocalIdentifier:v20];

      id v13 = v24;
      [a1 _mergePerson:v10 context:v24 toPerson:v21];

      id v16 = (void *)v21;
    }
    char v19 = v18 ^ 1;
  }
  else
  {
    [a1 _namePerson:v10 toContact:v11 withChangeRequest:v12];
    char v19 = 0;
  }

  return v19;
}

+ (void)_unfavoritePersonWithChangeRequest:(id)a3
{
  id v3 = a3;
  [v3 setType:0];
  objc_msgSend(v3, "setManualOrder:", +[PXPeopleUtilities manualOrderForInsertingAtEndOfSectionWithType:](PXPeopleUtilities, "manualOrderForInsertingAtEndOfSectionWithType:", 0));
}

+ (void)_favoritePersonWithChangeRequest:(id)a3
{
  id v3 = a3;
  [v3 setType:1];
  objc_msgSend(v3, "setManualOrder:", +[PXPeopleUtilities manualOrderForInsertingAtEndOfSectionWithType:](PXPeopleUtilities, "manualOrderForInsertingAtEndOfSectionWithType:", 1));
}

+ (void)nameAndVerifyPerson:(id)a3 toName:(id)a4 photoLibrary:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__PXPeopleBootstrap_nameAndVerifyPerson_toName_photoLibrary_completionHandler___block_invoke;
  v13[3] = &unk_1E5DD32A8;
  id v14 = v9;
  id v15 = v10;
  id v11 = v10;
  id v12 = v9;
  [a5 performChanges:v13 completionHandler:a6];
}

void __79__PXPeopleBootstrap_nameAndVerifyPerson_toName_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F39200] changeRequestForPerson:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 32) verifiedType] != 1) {
    [v2 setVerifiedType:1];
  }
  [v2 setName:*(void *)(a1 + 40)];
  [v2 setDisplayName:*(void *)(a1 + 40)];
}

+ (void)nameAndVerifyPerson:(id)a3 toContact:(id)a4 photoLibrary:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__PXPeopleBootstrap_nameAndVerifyPerson_toContact_photoLibrary_completionHandler___block_invoke;
  v13[3] = &unk_1E5DD32A8;
  id v14 = v9;
  id v15 = v10;
  id v11 = v10;
  id v12 = v9;
  [a5 performChanges:v13 completionHandler:a6];
}

void __82__PXPeopleBootstrap_nameAndVerifyPerson_toContact_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F39200] changeRequestForPerson:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 32) verifiedType] != 1) {
    [v2 setVerifiedType:1];
  }
  +[PXPeopleBootstrap _namePerson:*(void *)(a1 + 32) toContact:*(void *)(a1 + 40) changeRequest:v2 context:0];
}

+ (void)performBootstrapWithSourcePerson:(id)a3 context:(id)a4 synchronous:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = v11;
  [v12 setTargetPerson:v14];
  id v15 = +[PXPeopleUISettings sharedInstance];
  if (([v15 enableBootstrapDemoMode] & 1) != 0
    || [v15 useBootstrapMockDataSource])
  {
LABEL_3:
    id v16 = v14;
    if (v13)
    {
      (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
      id v16 = v14;
    }
    goto LABEL_12;
  }
  v17 = [v12 delayedPersonBlock];

  char v18 = v14;
  if (v17)
  {
    char v19 = [v12 delayedPersonBlock];
    char v18 = v19[2]();

    if (!v18) {
      goto LABEL_3;
    }
    [v12 setTargetPerson:v18];
  }
  uint64_t v20 = [v12 bootstrapType];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PXPeopleBootstrap_performBootstrapWithSourcePerson_context_synchronous_completion___block_invoke;
  aBlock[3] = &unk_1E5DD01F0;
  id v21 = v18;
  id v42 = v21;
  id v22 = v12;
  id v43 = v22;
  uint64_t v44 = v20;
  SEL v45 = a2;
  id v46 = a1;
  v30 = _Block_copy(aBlock);
  v23 = [v21 photoLibrary];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __85__PXPeopleBootstrap_performBootstrapWithSourcePerson_context_synchronous_completion___block_invoke_2;
  v34[3] = &unk_1E5DCCF30;
  id v35 = v22;
  id v16 = v21;
  id v36 = v16;
  id v24 = v23;
  id v37 = v24;
  SEL v39 = a2;
  id v40 = a1;
  id v38 = v13;
  v25 = _Block_copy(v34);
  v26 = (void (**)(void, void, void))v25;
  if (v7)
  {
    id v33 = 0;
    v27 = v30;
    uint64_t v28 = [v24 performChangesAndWait:v30 error:&v33];
    id v29 = v33;
    ((void (**)(void, uint64_t, id))v26)[2](v26, v28, v29);
  }
  else
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __85__PXPeopleBootstrap_performBootstrapWithSourcePerson_context_synchronous_completion___block_invoke_218;
    v31[3] = &unk_1E5DCDD58;
    id v32 = v25;
    v27 = v30;
    [v24 performChanges:v30 completionHandler:v31];
    id v29 = v32;
  }

LABEL_12:
}

void __85__PXPeopleBootstrap_performBootstrapWithSourcePerson_context_synchronous_completion___block_invoke(uint64_t a1)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F39200] changeRequestForPerson:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 32) verifiedType] != 1) {
    [v2 setVerifiedType:1];
  }
  if (([*(id *)(a1 + 40) skipInitialAction] & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3 != 2)
    {
      if (!v3)
      {
        +[PXPeopleBootstrap _favoritePersonWithChangeRequest:v2];
        goto LABEL_9;
      }
      if (![*(id *)(a1 + 40) wantsToBeAddedToPeopleAlbum]) {
        goto LABEL_9;
      }
    }
    +[PXPeopleBootstrap _addToPeopleAlbumWithChangeRequest:v2];
  }
LABEL_9:
  if (![*(id *)(a1 + 40) skipInitialAction] || *(void *)(a1 + 48) != 1) {
    +[PXPeopleBootstrap _namePerson:*(void *)(a1 + 32) context:*(void *)(a1 + 40) withChangeRequest:v2];
  }
  uint64_t v4 = [*(id *)(a1 + 40) keyAsset];
  v5 = (void *)v4;
  if (v4)
  {
    id v6 = off_1E5DA7000;
    uint64_t v7 = *(void *)(a1 + 32);
    v28[0] = v4;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    id v9 = +[PXPeopleUtilities facesForPerson:v7 inAssets:v8];
    id v10 = [v9 firstObject];

    if (v10)
    {
LABEL_17:
      [v2 setKeyFace:v10];

      goto LABEL_18;
    }
    id v11 = [*(id *)(a1 + 40) nameSelection];
    id v12 = [v11 person];

    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_16:
        id v13 = v6[251];
        v27 = v5;
        id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
        id v15 = [(__objc2_class *)v13 facesForPerson:v12 inAssets:v14];
        id v10 = [v15 firstObject];

        goto LABEL_17;
      }
      uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v23 = *(void *)(a1 + 56);
      uint64_t v24 = *(void *)(a1 + 64);
      char v19 = (void *)v22;
      v25 = (objc_class *)objc_opt_class();
      id v21 = NSStringFromClass(v25);
      v26 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
      [v19 handleFailureInMethod:v23, v24, @"PXPeopleBootstrap.m", 101, @"%@ should be an instance inheriting from %@, but it is %@", @"context.nameSelection.person", v21, v26 object file lineNumber description];

      id v6 = off_1E5DA7000;
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v17 = *(void *)(a1 + 56);
      uint64_t v18 = *(void *)(a1 + 64);
      char v19 = (void *)v16;
      uint64_t v20 = (objc_class *)objc_opt_class();
      id v21 = NSStringFromClass(v20);
      [v19 handleFailureInMethod:v17, v18, @"PXPeopleBootstrap.m", 101, @"%@ should be an instance inheriting from %@, but it is nil", @"context.nameSelection.person", v21 object file lineNumber description];
    }

    goto LABEL_16;
  }
LABEL_18:
}

void __85__PXPeopleBootstrap_performBootstrapWithSourcePerson_context_synchronous_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = [*(id *)(a1 + 32) targetPerson];
    uint64_t v7 = [*(id *)(a1 + 32) suggestionManager];
    uint64_t v8 = [v7 commitUserResponsesToPerson:v6];
    id v9 = (void *)v8;
    if (v8) {
      id v10 = (void *)v8;
    }
    else {
      id v10 = v6;
    }
    [*(id *)(a1 + 32) setTargetPerson:v10];

    id v11 = [*(id *)(a1 + 32) targetPerson];

    +[PXPeopleUtilities temporarilySuppressBootstrapOrSuggestionForPerson:v11];
    if (v11 != *(NSObject **)(a1 + 40)) {
      +[PXPeopleUtilities temporarilySuppressBootstrapOrSuggestionForPerson:](PXPeopleUtilities, "temporarilySuppressBootstrapOrSuggestionForPerson:");
    }
    id v12 = [*(id *)(a1 + 48) librarySpecificFetchOptions];
    id v13 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
    [v12 setIncludedDetectionTypes:v13];

    id v14 = (void *)MEMORY[0x1E4F391F0];
    id v15 = [*(id *)(a1 + 40) localIdentifier];
    v37[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    uint64_t v17 = [v14 fetchPersonsWithLocalIdentifiers:v16 options:v12];

    uint64_t v18 = [v17 firstObject];
    char v19 = [*(id *)(a1 + 32) personSuggestion];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_11;
    }
    id v21 = [*(id *)(a1 + 32) personSuggestion];
    if (v21)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_10:
        uint64_t v22 = [v21 personSuggestionUpdatedPerson:v18];
        [*(id *)(a1 + 32) setPersonSuggestion:v22];

LABEL_11:
        goto LABEL_14;
      }
      uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v30 = *(void *)(a1 + 72);
      uint64_t v32 = *(void *)(a1 + 64);
      v27 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v27);
      uint64_t v28 = objc_msgSend(v21, "px_descriptionForAssertionMessage");
      [v24 handleFailureInMethod:v32, v30, @"PXPeopleBootstrap.m", 128, @"%@ should be an instance inheriting from %@, but it is %@", @"context.personSuggestion", v26, v28 object file lineNumber description];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v29 = *(void *)(a1 + 72);
      uint64_t v31 = *(void *)(a1 + 64);
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      [v24 handleFailureInMethod:v31, v29, @"PXPeopleBootstrap.m", 128, @"%@ should be an instance inheriting from %@, but it is nil", @"context.personSuggestion", v26 object file lineNumber description];
    }

    goto LABEL_10;
  }
  id v11 = PLUIGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v5;
    __int16 v35 = 2080;
    id v36 = "+[PXPeopleBootstrap performBootstrapWithSourcePerson:context:synchronous:completion:]_block_invoke_2";
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "People bootstrap change request error: %@ (%s)", buf, 0x16u);
  }
LABEL_14:

  uint64_t v23 = *(void *)(a1 + 56);
  if (v23) {
    (*(void (**)(uint64_t, uint64_t, id))(v23 + 16))(v23, a2, v5);
  }
}

void __85__PXPeopleBootstrap_performBootstrapWithSourcePerson_context_synchronous_completion___block_invoke_218(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PXPeopleBootstrap_performBootstrapWithSourcePerson_context_synchronous_completion___block_invoke_2_219;
  block[3] = &unk_1E5DD1758;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __85__PXPeopleBootstrap_performBootstrapWithSourcePerson_context_synchronous_completion___block_invoke_2_219(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

+ (CGSize)preferredBootstrapSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

@end