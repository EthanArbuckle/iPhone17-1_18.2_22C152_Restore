@interface PXPhotoKitPersonActionManager
- (BOOL)canPerformActionType:(id)a3;
- (BOOL)isDestructiveActionType:(id)a3;
- (Class)_validatedPerformerClassForActionType:(id)a3 checkIfCanPerformAction:(BOOL)a4;
- (NSDictionary)performerClassByType;
- (NSDictionary)personActionTypeByGenericType;
- (PHFetchResult)people;
- (PHPhotoLibrary)photoLibrary;
- (PXPhotoKitPersonActionManager)init;
- (PXPhotoKitPersonActionManager)initWithPeople:(id)a3;
- (PXPhotoKitPersonActionManager)initWithPerson:(id)a3;
- (id)_actionPerformerForActionType:(id)a3 checkIfCanPerformAction:(BOOL)a4;
- (id)actionPerformerForActionType:(id)a3;
- (id)actionPerformerForActionType:(id)a3 parameters:(id)a4;
- (id)actionTypeForGenericType:(id)a3;
- (id)contextMenuElementsWithHandler:(id)a3;
- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4;
- (id)systemImageNameForActionType:(id)a3;
@end

@implementation PXPhotoKitPersonActionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personActionTypeByGenericType, 0);
  objc_storeStrong((id *)&self->_performerClassByType, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_people, 0);
}

- (NSDictionary)personActionTypeByGenericType
{
  return self->_personActionTypeByGenericType;
}

- (NSDictionary)performerClassByType
{
  return self->_performerClassByType;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PHFetchResult)people
{
  return self->_people;
}

- (id)contextMenuElementsWithHandler:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  v19[0] = @"PXPhotoKitPersonActionTypeFavorite";
  v19[1] = @"PXPhotoKitPersonActionTypeCustomize";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v7 = [(PXActionManager *)self actionItemsForActionTypes:v6 handler:v4];
  [v5 addObjectsFromArray:v7];

  v8 = objc_opt_new();
  [v5 addObject:v8];

  v18[0] = @"PXPhotoKitPersonActionTypeBlock";
  v18[1] = @"PXPhotoKitPersonActionTypeRemove";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v10 = [(PXActionManager *)self actionItemsForActionTypes:v9 handler:v4];
  [v5 addObjectsFromArray:v10];

  v11 = +[PXRootSettings sharedInstance];
  LODWORD(v10) = [v11 canShowInternalUI];

  if (v10)
  {
    v12 = objc_opt_new();
    [v5 addObject:v12];

    v17[0] = @"PXPhotoKitPersonActionTypeCopyInternalURL";
    v17[1] = @"PXPhotoKitPersonActionTypeMagic";
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v14 = [(PXActionManager *)self actionItemsForActionTypes:v13 handler:v4];
    v15 = +[PXActionMenu menuWithTitle:@" Internal" childElements:v14];
    [v5 addObject:v15];
  }
  return v5;
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4 = a3;
  if ([(PXActionManager *)self isActionTypeAllowed:v4]) {
    BOOL v5 = [(PXPhotoKitPersonActionManager *)self _validatedPerformerClassForActionType:v4 checkIfCanPerformAction:1] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isDestructiveActionType:(id)a3
{
  v3 = [(PXPhotoKitPersonActionManager *)self _validatedPerformerClassForActionType:a3 checkIfCanPerformAction:0];
  return [(objc_class *)v3 isActionDestructive];
}

- (id)systemImageNameForActionType:(id)a3
{
  id v4 = [(PXPhotoKitPersonActionManager *)self _validatedPerformerClassForActionType:a3 checkIfCanPerformAction:0];
  BOOL v5 = [(PXPhotoKitPersonActionManager *)self people];
  v6 = [v5 firstObject];
  v7 = [(objc_class *)v4 systemImageNameForPerson:v6];

  return v7;
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4
{
  BOOL v5 = [(PXPhotoKitPersonActionManager *)self _validatedPerformerClassForActionType:a3 checkIfCanPerformAction:0];
  v6 = [(PXPhotoKitPersonActionManager *)self people];
  v7 = [v6 firstObject];
  v8 = [(objc_class *)v5 localizedTitleForPerson:v7];

  return v8;
}

- (id)actionPerformerForActionType:(id)a3 parameters:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (![v7 isEqualToString:@"PXPhotoKitPersonActionTypeMove"])
  {
    if (![v7 isEqualToString:@"PXPhotoKitPersonActionTypeAddContent"])
    {
      id v16 = [(PXPhotoKitPersonActionManager *)self actionPerformerForActionType:v7];
      goto LABEL_32;
    }
    v17 = [v8 objectForKeyedSubscript:*(void *)off_1E5DAAE78];
    if (v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_14:
        v18 = [(PXPhotoKitPersonActionManager *)self people];
        v19 = [v18 fetchedObjects];
        v20 = [v19 arrayByAddingObjectsFromArray:v17];

        id v16 = [(PXPhotoKitPersonActionManager *)self _actionPerformerForActionType:@"PXPhotoKitPersonActionTypeMerge" checkIfCanPerformAction:0];
        v21 = [(PXPhotoKitPersonActionManager *)self photoLibrary];
        v22 = +[PXPeopleUtilities peopleFetchResultFromFastEnumeration:v20 photoLibrary:v21];
        [v16 setPeople:v22];

        goto LABEL_32;
      }
      v38 = [MEMORY[0x1E4F28B00] currentHandler];
      v43 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v43);
      v44 = objc_msgSend(v17, "px_descriptionForAssertionMessage");
      [v38 handleFailureInMethod:a2, self, @"PXPhotoKitPersonActionManager.m", 164, @"%@ should be an instance inheriting from %@, but it is %@", @"parameters[PXActionParameterKeyContent]", v40, v44 object file lineNumber description];
    }
    else
    {
      v38 = [MEMORY[0x1E4F28B00] currentHandler];
      v39 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v39);
      [v38 handleFailureInMethod:a2, self, @"PXPhotoKitPersonActionManager.m", 164, @"%@ should be an instance inheriting from %@, but it is nil", @"parameters[PXActionParameterKeyContent]", v40 object file lineNumber description];
    }

    goto LABEL_14;
  }
  v9 = [v8 objectForKeyedSubscript:*(void *)off_1E5DAAE80];
  if (!v9)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    [v29 handleFailureInMethod:a2, self, @"PXPhotoKitPersonActionManager.m", 122, @"%@ should be an instance inheriting from %@, but it is nil", @"parameters[PXActionParameterKeySourceObjects]", v31 object file lineNumber description];
LABEL_38:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    v32 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v32);
    v33 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
    [v29 handleFailureInMethod:a2, self, @"PXPhotoKitPersonActionManager.m", 122, @"%@ should be an instance inheriting from %@, but it is %@", @"parameters[PXActionParameterKeySourceObjects]", v31, v33 object file lineNumber description];

    goto LABEL_38;
  }
LABEL_4:
  v10 = [v8 objectForKeyedSubscript:*(void *)off_1E5DAAE88];
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v34 = [MEMORY[0x1E4F28B00] currentHandler];
      v35 = (objc_class *)objc_opt_class();
      v36 = NSStringFromClass(v35);
      v37 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
      [v34 handleFailureInMethod:a2, self, @"PXPhotoKitPersonActionManager.m", 123, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"parameters[PXActionParameterKeyTargetObject]", v36, v37 object file lineNumber description];
    }
  }
  v11 = [v9 firstObject];
  v12 = [v10 localIdentifier];
  v13 = [v11 localIdentifier];
  int v14 = [v13 isEqualToString:v12];

  if (!v14)
  {
    SEL v52 = a2;
    if (v10)
    {
      uint64_t v23 = [v11 type];
      if (v23 == [v10 type])
      {
        unint64_t v24 = [v11 manualOrder];
        if (v24 >= [v10 manualOrder]) {
          uint64_t v25 = 0;
        }
        else {
          uint64_t v25 = -1;
        }
      }
      else
      {
        uint64_t v25 = 0;
      }
      uint64_t v54 = [v10 manualOrder] + v25;
      uint64_t v53 = [v10 type];
    }
    else
    {
      v26 = +[PXPeopleUtilities lastManuallySortedPersonInSectionOfType:0];
      if (!v26)
      {
        v26 = +[PXPeopleUtilities lastManuallySortedPersonInSectionOfType:1];
        if (!v26)
        {
          v47 = [MEMORY[0x1E4F28B00] currentHandler];
          [v47 handleFailureInMethod:v52, self, @"PXPhotoKitPersonActionManager.m", 154, @"Invalid parameter not satisfying: %@", @"lastPerson" object file lineNumber description];
        }
      }
      uint64_t v54 = [v26 manualOrder] + 1;
      uint64_t v53 = [v26 type];
    }
    id v16 = [(PXPhotoKitPersonActionManager *)self actionPerformerForActionType:v7];
    if (v16)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_29:
        [v16 setSourcePeople:v9];
        [v16 setDestinationManualOrder:v54];
        [v16 setDestinationType:v53];
        goto LABEL_30;
      }
      v50 = [MEMORY[0x1E4F28B00] currentHandler];
      v45 = (objc_class *)objc_opt_class();
      uint64_t v46 = NSStringFromClass(v45);
      v49 = objc_msgSend(v16, "px_descriptionForAssertionMessage");
      uint64_t v48 = v46;
      v51 = (void *)v46;
      v41 = v50;
      [v50 handleFailureInMethod:v52, self, @"PXPhotoKitPersonActionManager.m", 158, @"%@ should be an instance inheriting from %@, but it is %@", @"[self actionPerformerForActionType:actionType]", v48, v49 object file lineNumber description];
    }
    else
    {
      v41 = [MEMORY[0x1E4F28B00] currentHandler];
      v42 = (objc_class *)objc_opt_class();
      v51 = NSStringFromClass(v42);
      [v41 handleFailureInMethod:v52, self, @"PXPhotoKitPersonActionManager.m", 158, @"%@ should be an instance inheriting from %@, but it is nil", @"[self actionPerformerForActionType:actionType]", v51 object file lineNumber description];
    }

    goto LABEL_29;
  }
  v15 = PLUIGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v56 = v12;
    _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "Not performing person reorder because the source and target people are the same: %@", buf, 0xCu);
  }

  id v16 = 0;
LABEL_30:

  if (v14)
  {
    v27 = 0;
    goto LABEL_33;
  }
LABEL_32:
  id v16 = v16;
  v27 = v16;
LABEL_33:

  return v27;
}

- (id)actionTypeForGenericType:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXPhotoKitPersonActionManager *)self personActionTypeByGenericType];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)_actionPerformerForActionType:(id)a3 checkIfCanPerformAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PXPhotoKitPersonActionManager *)self _validatedPerformerClassForActionType:v6 checkIfCanPerformAction:v4];
  id v8 = (void *)MEMORY[0x1E4F38EE8];
  v9 = [(PXPhotoKitPersonActionManager *)self photoLibrary];
  v10 = [v8 transientAssetCollectionWithAssets:MEMORY[0x1E4F1CBF0] title:0 identifier:0 photoLibrary:v9];

  id v11 = objc_alloc((Class)off_1E5DA55C0);
  long long v12 = *((_OWORD *)off_1E5DAB028 + 1);
  v19[0] = *(_OWORD *)off_1E5DAB028;
  v19[1] = v12;
  v13 = (void *)[v11 initWithAssetCollection:v10 keyAssetReference:0 indexPath:v19];
  int v14 = [[PXDisplayTitleInfo alloc] initWithAssetCollection:v10 useVerboseSmartDescription:0];
  v15 = (void *)[[v7 alloc] initWithActionType:v6 assetCollectionReference:v13 displayTitleInfo:v14];

  id v16 = [(PXActionManager *)self performerDelegate];
  [v15 setDelegate:v16];

  v17 = [(PXPhotoKitPersonActionManager *)self people];
  [v15 setPeople:v17];

  return v15;
}

- (id)actionPerformerForActionType:(id)a3
{
  return [(PXPhotoKitPersonActionManager *)self _actionPerformerForActionType:a3 checkIfCanPerformAction:1];
}

- (Class)_validatedPerformerClassForActionType:(id)a3 checkIfCanPerformAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (!v7) {
    goto LABEL_7;
  }
  id v8 = [(PXPhotoKitPersonActionManager *)self performerClassByType];
  v9 = (void *)[v8 objectForKeyedSubscript:v7];

  if (([v9 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    int v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXPhotoKitPersonActionManager.m", 87, @"Invalid parameter not satisfying: %@", @"[performerClass isSubclassOfClass:PXAssetCollectionActionPerformer.class]" object file lineNumber description];
  }
  if ([v9 conformsToProtocol:&unk_1F02F2E48])
  {
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXPhotoKitPersonActionManager.m", 88, @"Invalid parameter not satisfying: %@", @"[performerClass conformsToProtocol:@protocol(PXPhotoKitPersonActionPerformer)]" object file lineNumber description];

    if (!v4) {
      goto LABEL_8;
    }
  }
  v10 = [(PXPhotoKitPersonActionManager *)self people];
  int v11 = [v9 canPerformOn:v10];

  if (!v11) {
LABEL_7:
  }
    v9 = 0;
LABEL_8:
  long long v12 = v9;

  return v12;
}

- (PXPhotoKitPersonActionManager)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotoKitPersonActionManager.m", 78, @"%s is not available as initializer", "-[PXPhotoKitPersonActionManager init]");

  abort();
}

- (PXPhotoKitPersonActionManager)initWithPerson:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  BOOL v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v9 count:1];

  id v7 = -[PXPhotoKitPersonActionManager initWithPeople:](self, "initWithPeople:", v6, v9, v10);
  return v7;
}

- (PXPhotoKitPersonActionManager)initWithPeople:(id)a3
{
  v24[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PXPhotoKitPersonActionManager;
  id v5 = [(PXPhotoKitPersonActionManager *)&v20 init];
  if (v5)
  {
    id v6 = [v4 firstObject];
    id v7 = [v6 photoLibrary];

    id v8 = (void *)[v4 copy];
    uint64_t v9 = +[PXPeopleUtilities peopleFetchResultFromFastEnumeration:v8 photoLibrary:v7];
    people = v5->_people;
    v5->_people = (PHFetchResult *)v9;

    photoLibrary = v5->_photoLibrary;
    v5->_photoLibrary = v7;
    long long v12 = v7;

    v23[0] = @"PXPhotoKitPersonActionTypeFavorite";
    v24[0] = objc_opt_class();
    v23[1] = @"PXPhotoKitPersonActionTypeCustomize";
    v24[1] = objc_opt_class();
    v23[2] = @"PXPhotoKitPersonActionTypeBlock";
    v24[2] = objc_opt_class();
    v23[3] = @"PXPhotoKitPersonActionTypeRemove";
    v24[3] = objc_opt_class();
    v23[4] = @"PXPhotoKitPersonActionTypeMerge";
    v24[4] = objc_opt_class();
    v23[5] = @"PXPhotoKitPersonActionTypeMove";
    v24[5] = objc_opt_class();
    v23[6] = @"PXPhotoKitPersonActionTypeCopyInternalURL";
    v24[6] = objc_opt_class();
    v23[7] = @"PXPhotoKitPersonActionTypeMagic";
    v24[7] = objc_opt_class();
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:8];
    performerClassByType = v5->_performerClassByType;
    v5->_performerClassByType = (NSDictionary *)v13;

    uint64_t v15 = *(void *)off_1E5DAAEC0;
    v21[0] = *(void *)off_1E5DAAEA0;
    v21[1] = v15;
    v22[0] = @"PXPhotoKitPersonActionTypeFavorite";
    v22[1] = @"PXPhotoKitPersonActionTypeRemove";
    uint64_t v16 = *(void *)off_1E5DAAE90;
    v21[2] = *(void *)off_1E5DAAEA8;
    v21[3] = v16;
    v22[2] = @"PXPhotoKitPersonActionTypeMerge";
    v22[3] = @"PXPhotoKitPersonActionTypeAddContent";
    v21[4] = *(void *)off_1E5DAAEB8;
    v22[4] = @"PXPhotoKitPersonActionTypeMove";
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];
    personActionTypeByGenericType = v5->_personActionTypeByGenericType;
    v5->_personActionTypeByGenericType = (NSDictionary *)v17;
  }
  return v5;
}

@end