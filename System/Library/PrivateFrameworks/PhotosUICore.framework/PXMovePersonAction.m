@interface PXMovePersonAction
- (NSArray)modifiedDestinationPeople;
- (NSArray)modifiedOtherPeople;
- (NSArray)sourcePeople;
- (NSNumber)sourceSortingType;
- (PXFastEnumeration)destinationPeople;
- (PXFastEnumeration)otherPeople;
- (PXMovePersonAction)initWithSourcePeople:(id)a3 destinationPeople:(id)a4 destinationManualOrder:(int64_t)a5 destinationType:(int64_t)a6 otherPeople:(id)a7;
- (PXPhotoLibraryLocalDefaults)localDefaults;
- (id)actionIdentifier;
- (id)localizedActionName;
- (int64_t)destinationManualOrder;
- (int64_t)destinationType;
- (void)changeRequestForUndo:(id)a3 updateType:(BOOL)a4;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
- (void)setModifiedDestinationPeople:(id)a3;
- (void)setModifiedOtherPeople:(id)a3;
- (void)setSourceSortingType:(id)a3;
@end

@implementation PXMovePersonAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceSortingType, 0);
  objc_storeStrong((id *)&self->_localDefaults, 0);
  objc_storeStrong((id *)&self->_modifiedOtherPeople, 0);
  objc_storeStrong((id *)&self->_otherPeople, 0);
  objc_storeStrong((id *)&self->_modifiedDestinationPeople, 0);
  objc_storeStrong((id *)&self->_destinationPeople, 0);
  objc_storeStrong((id *)&self->_sourcePeople, 0);
}

- (void)setSourceSortingType:(id)a3
{
}

- (NSNumber)sourceSortingType
{
  return self->_sourceSortingType;
}

- (PXPhotoLibraryLocalDefaults)localDefaults
{
  return self->_localDefaults;
}

- (void)setModifiedOtherPeople:(id)a3
{
}

- (NSArray)modifiedOtherPeople
{
  return self->_modifiedOtherPeople;
}

- (PXFastEnumeration)otherPeople
{
  return self->_otherPeople;
}

- (void)setModifiedDestinationPeople:(id)a3
{
}

- (NSArray)modifiedDestinationPeople
{
  return self->_modifiedDestinationPeople;
}

- (int64_t)destinationType
{
  return self->_destinationType;
}

- (int64_t)destinationManualOrder
{
  return self->_destinationManualOrder;
}

- (PXFastEnumeration)destinationPeople
{
  return self->_destinationPeople;
}

- (NSArray)sourcePeople
{
  return self->_sourcePeople;
}

- (void)changeRequestForUndo:(id)a3 updateType:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
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
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v11 = [MEMORY[0x1E4F39200] changeRequestForPerson:v10];
        objc_msgSend(v11, "setManualOrder:", objc_msgSend(v10, "manualOrder"));
        if (v4) {
          objc_msgSend(v11, "setType:", objc_msgSend(v10, "type"));
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)performUndo:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__PXMovePersonAction_performUndo___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXPhotosAction *)self performChanges:v3 completionHandler:a3];
}

void __34__PXMovePersonAction_performUndo___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 modifiedDestinationPeople];
  [v2 changeRequestForUndo:v3 updateType:0];

  BOOL v4 = *(void **)(a1 + 32);
  id v5 = [v4 modifiedOtherPeople];
  [v4 changeRequestForUndo:v5 updateType:0];

  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v6 sourcePeople];
  [v6 changeRequestForUndo:v7 updateType:1];

  uint64_t v8 = *(void **)(a1 + 32);
  v9 = (void *)v8[18];
  id v10 = [v8 sourceSortingType];
  [v9 setNumber:v10 forKey:@"PXPeopleHomeSortingType"];
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  id v5 = [(PXMovePersonAction *)self sourcePeople];
  int64_t v6 = [(PXMovePersonAction *)self destinationType];
  uint64_t v7 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__PXMovePersonAction_performAction___block_invoke;
  v10[3] = &unk_1E5DD1508;
  v10[4] = self;
  id v11 = v5;
  id v12 = v7;
  int64_t v13 = v6;
  id v8 = v7;
  id v9 = v5;
  [(PXPhotosAction *)self performChanges:v10 completionHandler:v4];
}

void __36__PXMovePersonAction_performAction___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) destinationManualOrder];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v3 = [*(id *)(a1 + 32) destinationPeople];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v37;
    uint64_t v7 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (([*(id *)(a1 + 40) containsObject:v9] & 1) == 0)
        {
          if (v7 == v2) {
            uint64_t v7 = [*(id *)(a1 + 40) count] + v2;
          }
          if ([v9 manualOrder] != v7)
          {
            id v10 = [MEMORY[0x1E4F39200] changeRequestForPerson:v9];
            [v10 setManualOrder:v7 verified:0];
            [*(id *)(a1 + 48) addObject:v9];
          }
          ++v7;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 32) setModifiedDestinationPeople:*(void *)(a1 + 48)];
  v27 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = [*(id *)(a1 + 32) otherPeople];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v33;
    uint64_t v15 = 1;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        if (([*(id *)(a1 + 40) containsObject:v17] & 1) == 0)
        {
          if ([v17 manualOrder] != v15)
          {
            v18 = [MEMORY[0x1E4F39200] changeRequestForPerson:v17];
            [v18 setManualOrder:v15 verified:0];
            [v27 addObject:v17];
          }
          ++v15;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v13);
  }

  [*(id *)(a1 + 32) setModifiedOtherPeople:v27];
  v19 = [*(id *)(*(void *)(a1 + 32) + 144) numberForKey:@"PXPeopleHomeSortingType"];
  [*(id *)(a1 + 32) setSourceSortingType:v19];

  [*(id *)(*(void *)(a1 + 32) + 144) setNumber:&unk_1F02D9B20 forKey:@"PXPeopleHomeSortingType"];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v20 = [*(id *)(a1 + 32) sourcePeople];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v28 + 1) + 8 * k);
        v26 = [MEMORY[0x1E4F39200] changeRequestForPerson:v25];
        [v26 setManualOrder:v2 + k verified:1];
        if ([v25 type] != *(void *)(a1 + 56)) {
          objc_msgSend(v26, "setType:");
        }
      }
      v2 += k;
      uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v22);
  }
}

- (id)localizedActionName
{
  uint64_t v2 = self;
  int64_t v3 = [(PXMovePersonAction *)self destinationType];
  if (v3 == -1)
  {
    uint64_t v5 = [v2 photoLibrary];
    uint64_t v6 = objc_msgSend(v5, "px_peoplePetsHomeVisibility");

    uint64_t v7 = [v2 sourcePeople];
    id v8 = [v7 firstObject];
    id v9 = PXLocalizedStringForPersonOrPetAndVisibility(v8, 0, @"PXPeopleHomeRemovePersonButton");
    id v11 = PXLocalizedStringForPeoplePetsHomeTitle(v6);
    uint64_t v2 = PXStringWithValidatedFormat();
  }
  else
  {
    if (v3)
    {
      if (v3 != 1) {
        goto LABEL_8;
      }
      uint64_t v4 = @"PXAddToFavoritesActionName";
    }
    else
    {
      uint64_t v4 = @"PXRemoveFromFavoritesActionName";
    }
    uint64_t v2 = PXLocalizedStringFromTable(v4, @"PhotosUICore");
  }
LABEL_8:
  return v2;
}

- (id)actionIdentifier
{
  return @"ChangePeopleType";
}

- (PXMovePersonAction)initWithSourcePeople:(id)a3 destinationPeople:(id)a4 destinationManualOrder:(int64_t)a5 destinationType:(int64_t)a6 otherPeople:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v16 = [v13 firstObject];
  uint64_t v17 = [v16 photoLibrary];
  v27.receiver = self;
  v27.super_class = (Class)PXMovePersonAction;
  v18 = [(PXPhotosAction *)&v27 initWithPhotoLibrary:v17];

  if (v18)
  {
    objc_storeStrong((id *)&v18->_sourcePeople, a3);
    uint64_t v19 = [v14 copy];
    destinationPeople = v18->_destinationPeople;
    v18->_destinationPeople = (PXFastEnumeration *)v19;

    v18->_destinationManualOrder = a5;
    v18->_destinationType = a6;
    uint64_t v21 = [v15 copy];
    otherPeople = v18->_otherPeople;
    v18->_otherPeople = (PXFastEnumeration *)v21;

    uint64_t v23 = [(PXPhotosAction *)v18 photoLibrary];
    uint64_t v24 = objc_msgSend(v23, "px_localDefaults");
    localDefaults = v18->_localDefaults;
    v18->_localDefaults = (PXPhotoLibraryLocalDefaults *)v24;
  }
  return v18;
}

@end