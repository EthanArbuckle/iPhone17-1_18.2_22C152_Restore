@interface PUExportUnmodifiedOriginalsActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (UIDocumentPickerViewController)cachedDocumentPickerViewController;
- (id)_createDocumentPickerViewControllerForExportedItems:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)prepareWithActivityItems:(id)a3;
- (void)setCachedDocumentPickerViewController:(id)a3;
@end

@implementation PUExportUnmodifiedOriginalsActivity

- (void).cxx_destruct
{
}

- (void)setCachedDocumentPickerViewController:(id)a3
{
}

- (UIDocumentPickerViewController)cachedDocumentPickerViewController
{
  return self->_cachedDocumentPickerViewController;
}

- (void)documentPickerWasCancelled:(id)a3
{
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
}

- (id)_createDocumentPickerViewControllerForExportedItems:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    id v24 = v5;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
            id v12 = v11;
          }
          else {
            id v12 = 0;
          }

          [v4 addObject:v12];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          id v13 = v10;
          if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
            id v14 = v13;
          }
          else {
            id v14 = 0;
          }

          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v12 = v14;
          uint64_t v15 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v26;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v26 != v17) {
                  objc_enumerationMutation(v12);
                }
                id v19 = *(id *)(*((void *)&v25 + 1) + 8 * j);
                if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
                {
                  id v20 = v19;

                  if (v20) {
                    [v4 addObject:v20];
                  }
                }
                else
                {

                  id v20 = 0;
                }
              }
              uint64_t v16 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v16);
          }

          id v5 = v24;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v7);
  }

  v21 = (void *)[objc_alloc(MEMORY[0x1E4FB16F0]) initForExportingURLs:v4 asCopy:1];
  [v21 setDelegate:self];
  [v21 _setAutomaticallyDismissesAfterCompletion:0];

  return v21;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4 = [(PUExportUnmodifiedOriginalsActivity *)self _createDocumentPickerViewControllerForExportedItems:a3];
  [(PUExportUnmodifiedOriginalsActivity *)self setCachedDocumentPickerViewController:v4];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v3 = [(PXActivity *)self itemSourceController];
  if ([v3 isPreparingIndividualItems])
  {
    id v4 = [v3 assets];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_systemImageName
{
  return @"folder";
}

- (id)activityTitle
{
  v2 = [(PXActivity *)self itemSourceController];
  id v3 = [v2 assets];
  if ([v3 count] == 1) {
    id v4 = @"SHARING_EXPORT_UNMODIFIED_ORIGINALS_TITLE";
  }
  else {
    id v4 = @"SHARING_EXPORT_UNMODIFIED_ORIGINALS_MULTIPLE_TITLE";
  }
  BOOL v5 = PULocalizedString(v4);

  return v5;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F909F8];
}

@end