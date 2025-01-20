@interface PXPeopleUserFeedbackAction
- (NSDictionary)undoUserFeedbacks;
- (PHUserFeedback)userFeedback;
- (PXPeopleUserFeedbackAction)initWithPeople:(id)a3 feedbackType:(unint64_t)a4;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (id)collections;
- (void)performAction:(id)a3;
- (void)performRedo:(id)a3;
- (void)performUndo:(id)a3;
- (void)setUndoUserFeedbacks:(id)a3;
@end

@implementation PXPeopleUserFeedbackAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoUserFeedbacks, 0);
  objc_storeStrong((id *)&self->_userFeedback, 0);
  objc_storeStrong((id *)&self->_collections, 0);
}

- (void)setUndoUserFeedbacks:(id)a3
{
}

- (NSDictionary)undoUserFeedbacks
{
  return self->_undoUserFeedbacks;
}

- (PHUserFeedback)userFeedback
{
  return self->_userFeedback;
}

- (id)collections
{
  return self->_collections;
}

- (void)performRedo:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__PXPeopleUserFeedbackAction_performRedo___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXPhotosAction *)self performChanges:v3 completionHandler:a3];
}

void __42__PXPeopleUserFeedbackAction_performRedo___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "collections", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        v8 = [*(id *)(a1 + 32) userFeedback];
        v9 = [MEMORY[0x1E4F39200] changeRequestForPerson:v7];
        [v9 setUserFeedback:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXPeopleUserFeedbackAction *)self undoUserFeedbacks];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__PXPeopleUserFeedbackAction_performUndo___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PXPhotosAction *)self performChanges:v7 completionHandler:v4];
}

void __42__PXPeopleUserFeedbackAction_performUndo___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "collections", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v8 = [MEMORY[0x1E4F39200] changeRequestForPerson:v7];
        v9 = *(void **)(a1 + 40);
        long long v10 = [v7 localIdentifier];
        long long v11 = [v9 objectForKeyedSubscript:v10];
        [v8 setUserFeedback:v11];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

- (void)performAction:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__PXPeopleUserFeedbackAction_performAction___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXPhotosAction *)self performChanges:v3 completionHandler:a3];
}

void __44__PXPeopleUserFeedbackAction_performAction___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [*(id *)(a1 + 32) collections];
  uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v7 fetchPropertySetsIfNeeded];
        id v8 = [v7 userFeedbackProperties];
        v9 = [v8 userFeedback];
        long long v10 = [v7 localIdentifier];
        [v2 setObject:v9 forKeyedSubscript:v10];

        long long v11 = [*(id *)(a1 + 32) userFeedback];
        long long v12 = [MEMORY[0x1E4F39200] changeRequestForPerson:v7];
        [v12 setUserFeedback:v11];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 32) setUndoUserFeedbacks:v2];
}

- (id)actionNameLocalizationKey
{
  v2 = [(PXPeopleUserFeedbackAction *)self userFeedback];
  uint64_t v3 = [v2 type];

  uint64_t v4 = @"PXNeverFeatureActionName";
  if (v3 != 2) {
    uint64_t v4 = 0;
  }
  if (v3 == 3) {
    return @"PXFeatureLessActionName";
  }
  else {
    return v4;
  }
}

- (id)actionIdentifier
{
  return @"PeopleUserFeedback";
}

- (PXPeopleUserFeedbackAction)initWithPeople:(id)a3 feedbackType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 firstObject];
  id v8 = v7;
  if (v7)
  {
    v9 = [v7 photoLibrary];
    v17.receiver = self;
    v17.super_class = (Class)PXPeopleUserFeedbackAction;
    long long v10 = [(PXPhotosAction *)&v17 initWithPhotoLibrary:v9];

    if (v10)
    {
      uint64_t v11 = [v6 copy];
      collections = v10->_collections;
      v10->_collections = (PXFastEnumeration *)v11;

      uint64_t v13 = [objc_alloc(MEMORY[0x1E4F39330]) initWithType:a4 feature:0 context:0];
      userFeedback = v10->_userFeedback;
      v10->_userFeedback = (PHUserFeedback *)v13;
    }
    self = v10;
    long long v15 = self;
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

@end