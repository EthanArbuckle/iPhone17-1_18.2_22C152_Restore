@interface PXChangePeopleTypeAction
- (PXChangePeopleTypeAction)initWithPeople:(id)a3 type:(int64_t)a4;
- (id)actionIdentifier;
- (id)collections;
- (id)localizedActionName;
- (int64_t)type;
- (unint64_t)firstManualOrder;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
- (void)setFirstManualOrder:(unint64_t)a3;
@end

@implementation PXChangePeopleTypeAction

- (void).cxx_destruct
{
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)firstManualOrder
{
  return self->_firstManualOrder;
}

- (id)collections
{
  return self->_collections;
}

- (void)performUndo:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__PXChangePeopleTypeAction_performUndo___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXPhotosAction *)self performChanges:v3 completionHandler:a3];
}

void __40__PXChangePeopleTypeAction_performUndo___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "collections", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        v7 = [MEMORY[0x1E4F39200] changeRequestForPerson:v6];
        objc_msgSend(v7, "setType:", objc_msgSend(v6, "type"));
        objc_msgSend(v7, "setManualOrder:verified:", objc_msgSend(v6, "manualOrder"), 0);
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

- (void)performAction:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__PXChangePeopleTypeAction_performAction___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXPhotosAction *)self performChanges:v3 completionHandler:a3];
}

void __42__PXChangePeopleTypeAction_performAction___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) type];
  uint64_t v3 = [*(id *)(a1 + 32) firstManualOrder];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v3 = +[PXPeopleUtilities manualOrderForInsertingAtEndOfSectionWithType:v2];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "collections", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = [MEMORY[0x1E4F39200] changeRequestForPerson:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        [v9 setType:v2];
        [v9 setManualOrder:v3 verified:1];
        v3 += v2 != -1;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)localizedActionName
{
  uint64_t v2 = self;
  int64_t v3 = [(PXChangePeopleTypeAction *)self type];
  if (v3 == -1)
  {
    uint64_t v5 = [v2 photoLibrary];
    uint64_t v6 = objc_msgSend(v5, "px_peoplePetsHomeVisibility");

    uint64_t v7 = [v2 collections];
    long long v8 = PXLocalizedStringForPeople(v7, @"PXPeopleHomeRemovePeopleButton");
    long long v10 = PXLocalizedStringForPeoplePetsHomeTitle(v6);
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

- (void)setFirstManualOrder:(unint64_t)a3
{
  if ([(PXAction *)self executionStarted])
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXChangePeopleTypeAction.m", 46, @"%s cannot be called after the receiver has started executing.", "-[PXChangePeopleTypeAction setFirstManualOrder:]");
  }
  self->_firstManualOrder = a3;
}

- (PXChangePeopleTypeAction)initWithPeople:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 firstObject];
  long long v8 = v7;
  if (v7)
  {
    long long v9 = [v7 photoLibrary];
    v15.receiver = self;
    v15.super_class = (Class)PXChangePeopleTypeAction;
    long long v10 = [(PXPhotosAction *)&v15 initWithPhotoLibrary:v9];

    if (v10)
    {
      uint64_t v11 = [v6 copy];
      collections = v10->_collections;
      v10->_collections = (PXFastEnumeration *)v11;

      v10->_type = a4;
      v10->_firstManualOrder = 0x7FFFFFFFFFFFFFFFLL;
    }
    self = v10;
    long long v13 = self;
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

@end