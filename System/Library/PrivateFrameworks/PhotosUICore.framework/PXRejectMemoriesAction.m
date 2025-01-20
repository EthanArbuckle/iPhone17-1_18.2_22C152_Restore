@interface PXRejectMemoriesAction
- (NSDictionary)redoMemoryFeatures;
- (NSDictionary)redoPhotosGraphDataValues;
- (NSDictionary)redoUserFeedbacks;
- (NSDictionary)undoPhotosGraphDataValues;
- (NSDictionary)undoUserFeedbacks;
- (id)actionIdentifier;
- (id)actionSystemImageName;
- (id)localizedActionName;
- (unint64_t)featureType;
- (unint64_t)rejectReason;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
- (void)setFeatureType:(unint64_t)a3;
- (void)setRedoMemoryFeatures:(id)a3;
- (void)setRedoPhotosGraphDataValues:(id)a3;
- (void)setRedoUserFeedbacks:(id)a3;
- (void)setRejectReason:(unint64_t)a3;
- (void)setUndoPhotosGraphDataValues:(id)a3;
- (void)setUndoUserFeedbacks:(id)a3;
@end

@implementation PXRejectMemoriesAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoPhotosGraphDataValues, 0);
  objc_storeStrong((id *)&self->_redoPhotosGraphDataValues, 0);
  objc_storeStrong((id *)&self->_undoUserFeedbacks, 0);
  objc_storeStrong((id *)&self->_redoUserFeedbacks, 0);
  objc_storeStrong((id *)&self->_redoMemoryFeatures, 0);
}

- (void)setUndoPhotosGraphDataValues:(id)a3
{
}

- (NSDictionary)undoPhotosGraphDataValues
{
  return self->_undoPhotosGraphDataValues;
}

- (void)setRedoPhotosGraphDataValues:(id)a3
{
}

- (NSDictionary)redoPhotosGraphDataValues
{
  return self->_redoPhotosGraphDataValues;
}

- (void)setUndoUserFeedbacks:(id)a3
{
}

- (NSDictionary)undoUserFeedbacks
{
  return self->_undoUserFeedbacks;
}

- (void)setRedoUserFeedbacks:(id)a3
{
}

- (NSDictionary)redoUserFeedbacks
{
  return self->_redoUserFeedbacks;
}

- (void)setRedoMemoryFeatures:(id)a3
{
}

- (NSDictionary)redoMemoryFeatures
{
  return self->_redoMemoryFeatures;
}

- (unint64_t)rejectReason
{
  return self->_rejectReason;
}

- (unint64_t)featureType
{
  return self->_featureType;
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  v5 = [(PXRejectMemoriesAction *)self undoUserFeedbacks];
  v6 = [(PXRejectMemoriesAction *)self undoPhotosGraphDataValues];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__PXRejectMemoriesAction_performUndo___block_invoke;
  v9[3] = &unk_1E5DBBAE0;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  [(PXMemoriesAction *)self performMemoryChanges:v9 completionHandler:v4];
}

void __38__PXRejectMemoriesAction_performUndo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  [v8 setRejected:0];
  [v8 setBlacklistedFeature:0];
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (v6) {
    [v8 setUserFeedback:v6];
  }
  id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
  if (v7) {
    [v8 setPhotosGraphData:v7];
  }
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  id v5 = [(PXRejectMemoriesAction *)self redoMemoryFeatures];
  v6 = [(PXRejectMemoriesAction *)self redoUserFeedbacks];
  id v7 = [(PXRejectMemoriesAction *)self redoPhotosGraphDataValues];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__PXRejectMemoriesAction_performAction___block_invoke;
  v11[3] = &unk_1E5DBBAB8;
  id v12 = v5;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = v5;
  [(PXMemoriesAction *)self performMemoryChanges:v11 completionHandler:v4];
}

void __40__PXRejectMemoriesAction_performAction___block_invoke(id *a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  [v9 setRejected:1];
  v6 = [a1[4] objectForKeyedSubscript:v5];
  if (v6) {
    [v9 setBlacklistedFeature:v6];
  }
  id v7 = [a1[5] objectForKeyedSubscript:v5];
  if (v7) {
    [v9 setUserFeedback:v7];
  }
  id v8 = [a1[6] objectForKeyedSubscript:v5];
  if (v8) {
    [v9 setPhotosGraphData:v8];
  }
}

- (id)actionSystemImageName
{
  return @"trash";
}

- (id)localizedActionName
{
  return PXLocalizedStringFromTable(@"PXMemoriesFeedMultiDeleteActionTitle", @"PhotosUICore");
}

- (id)actionIdentifier
{
  return @"RejectMemories";
}

- (void)setRejectReason:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(PXAction *)self executionStarted])
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXRejectMemoriesAction.m", 59, @"%s cannot be called after the receiver has started executing.", "-[PXRejectMemoriesAction setRejectReason:]");
  }
  if (self->_rejectReason != a3)
  {
    self->_rejectReason = a3;
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v20 = self;
    id obj = [(PXMemoriesAction *)self collections];
    uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v13 = objc_msgSend(v12, "px_mutatedPhotosGraphPropertiesWithRejectReason:", a3);
          id v14 = [v12 localIdentifier];
          [v6 setObject:v13 forKeyedSubscript:v14];

          v15 = (void *)MEMORY[0x1E4F39160];
          v16 = [v12 photosGraphProperties];
          v17 = objc_msgSend(v15, "px_photosGraphDataFromProperties:error:", v16, 0);
          v18 = [v12 localIdentifier];
          [v7 setObject:v17 forKeyedSubscript:v18];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    [(PXRejectMemoriesAction *)v20 setRedoPhotosGraphDataValues:v6];
    [(PXRejectMemoriesAction *)v20 setUndoPhotosGraphDataValues:v7];
  }
}

- (void)setFeatureType:(unint64_t)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ([(PXAction *)self executionStarted])
  {
    long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXRejectMemoriesAction.m", 34, @"%s cannot be called after the receiver has started executing.", "-[PXRejectMemoriesAction setFeatureType:]");
  }
  if (self->_featureType != a3)
  {
    self->_featureType = a3;
    v28 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v27 = [MEMORY[0x1E4F1CA60] dictionary];
    v26 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v24 = self;
    id obj = [(PXMemoriesAction *)self collections];
    uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v11 = [v10 blockableFeatures];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v30;
            while (2)
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v30 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v29 + 1) + 8 * j);
                if (([v16 type] & a3) != 0)
                {
                  v17 = [v10 localIdentifier];
                  [v28 setObject:v16 forKeyedSubscript:v17];

                  [v10 fetchPropertySetsIfNeeded];
                  v18 = [v10 userFeedbackProperties];
                  v19 = [v18 userFeedback];

                  v20 = [MEMORY[0x1E4F39330] negativeUserFeedbackForMemoryFeature:v16 existingFeedback:v19];
                  v21 = [v10 localIdentifier];
                  [v27 setObject:v20 forKeyedSubscript:v21];

                  long long v22 = [v10 localIdentifier];
                  [v26 setObject:v19 forKeyedSubscript:v22];

                  goto LABEL_19;
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }
LABEL_19:
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v7);
    }

    [(PXRejectMemoriesAction *)v24 setRedoMemoryFeatures:v28];
    [(PXRejectMemoriesAction *)v24 setRedoUserFeedbacks:v27];
    [(PXRejectMemoriesAction *)v24 setUndoUserFeedbacks:v26];
  }
}

@end