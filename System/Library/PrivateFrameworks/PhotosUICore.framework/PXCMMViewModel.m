@interface PXCMMViewModel
- (BOOL)containsUnverifiedPersons;
- (BOOL)isLoadingPeopleSuggestions;
- (BOOL)isSelecting;
- (BOOL)oneUpDisabled;
- (BOOL)selectionEnabled;
- (BOOL)shouldShowPlaceholder;
- (NSArray)recipients;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSSet)disabledActionTypes;
- (NSString)originalTitle;
- (NSString)shareUUID;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)shareURL;
- (PXDisplayAsset)posterAsset;
- (PXRecipient)originatorRecipient;
- (PXSectionedSelectionManager)selectionManager;
- (PXUIImageProvider)posterMediaProvider;
- (int64_t)aggregateMediaType;
- (int64_t)aggregateMediaTypeForSelection;
- (int64_t)photosCount;
- (int64_t)selectedCount;
- (int64_t)selectedPhotosCount;
- (int64_t)selectedVideosCount;
- (int64_t)totalCount;
- (int64_t)videosCount;
- (unint64_t)numberOfReceivedAssets;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)setContainsUnverifiedPersons:(BOOL)a3;
- (void)setDisabledActionTypes:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setLoadingPeopleSuggestions:(BOOL)a3;
- (void)setNumberOfReceivedAssets:(unint64_t)a3;
- (void)setOneUpDisabled:(BOOL)a3;
- (void)setOriginalTitle:(id)a3;
- (void)setOriginatorRecipient:(id)a3;
- (void)setPhotosCount:(int64_t)a3;
- (void)setPosterAsset:(id)a3 posterMediaProvider:(id)a4;
- (void)setRecipients:(id)a3;
- (void)setSelectedCount:(int64_t)a3;
- (void)setSelectedPhotosCount:(int64_t)a3;
- (void)setSelectedVideosCount:(int64_t)a3;
- (void)setSelecting:(BOOL)a3;
- (void)setSelectionEnabled:(BOOL)a3;
- (void)setSelectionManager:(id)a3;
- (void)setShareURL:(id)a3;
- (void)setShareUUID:(id)a3;
- (void)setShouldShowPlaceholder:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTotalCount:(int64_t)a3;
- (void)setVideosCount:(int64_t)a3;
@end

@implementation PXCMMViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledActionTypes, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_posterMediaProvider, 0);
  objc_storeStrong((id *)&self->_posterAsset, 0);
  objc_storeStrong((id *)&self->_originatorRecipient, 0);
  objc_storeStrong((id *)&self->_shareUUID, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_originalTitle, 0);
}

- (BOOL)isLoadingPeopleSuggestions
{
  return self->_loadingPeopleSuggestions;
}

- (BOOL)containsUnverifiedPersons
{
  return self->_containsUnverifiedPersons;
}

- (BOOL)shouldShowPlaceholder
{
  return self->_shouldShowPlaceholder;
}

- (NSSet)disabledActionTypes
{
  return self->_disabledActionTypes;
}

- (int64_t)selectedCount
{
  return self->_selectedCount;
}

- (int64_t)selectedVideosCount
{
  return self->_selectedVideosCount;
}

- (int64_t)selectedPhotosCount
{
  return self->_selectedPhotosCount;
}

- (int64_t)totalCount
{
  return self->_totalCount;
}

- (int64_t)videosCount
{
  return self->_videosCount;
}

- (int64_t)photosCount
{
  return self->_photosCount;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (PXUIImageProvider)posterMediaProvider
{
  return self->_posterMediaProvider;
}

- (PXDisplayAsset)posterAsset
{
  return self->_posterAsset;
}

- (unint64_t)numberOfReceivedAssets
{
  return self->_numberOfReceivedAssets;
}

- (PXRecipient)originatorRecipient
{
  return self->_originatorRecipient;
}

- (BOOL)oneUpDisabled
{
  return self->_oneUpDisabled;
}

- (BOOL)selectionEnabled
{
  return self->_selectionEnabled;
}

- (BOOL)isSelecting
{
  return self->_selecting;
}

- (NSString)shareUUID
{
  return self->_shareUUID;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)originalTitle
{
  return self->_originalTitle;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXSelectionManagerObservationContext != a5)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PXCMMViewModel.m" lineNumber:369 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v10 = v9;
  if (v6)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __47__PXCMMViewModel_observable_didChange_context___block_invoke;
    v18[3] = &unk_1E5DCCFD0;
    v18[4] = self;
    [(PXCMMViewModel *)self performChanges:v18];
    v11 = [(PXCMMViewModel *)self selectionManager];
    v12 = [v11 selectionSnapshot];
    v13 = [v12 dataSource];

    char v14 = [v13 containsAnyItems];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __47__PXCMMViewModel_observable_didChange_context___block_invoke_2;
    v16[3] = &__block_descriptor_33_e33_v16__0___PXCMMMutableViewModel__8l;
    char v17 = v14 ^ 1;
    [(PXCMMViewModel *)self performChanges:v16];
  }
}

void __47__PXCMMViewModel_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 selectionManager];
  id v5 = [v4 selectionSnapshot];

  PXCMMUpdateCountsWithSelectionSnapshot(v3, v5);
}

uint64_t __47__PXCMMViewModel_observable_didChange_context___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setShouldShowPlaceholder:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setOneUpDisabled:(BOOL)a3
{
  if (self->_oneUpDisabled != a3)
  {
    self->_oneUpDisabled = a3;
    [(PXCMMViewModel *)self signalChange:0x20000];
  }
}

- (void)setDisabledActionTypes:(id)a3
{
  id v5 = (NSSet *)a3;
  if (self->_disabledActionTypes != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_disabledActionTypes, a3);
    [(PXCMMViewModel *)self signalChange:0x2000];
    id v5 = v6;
  }
}

- (void)setContainsUnverifiedPersons:(BOOL)a3
{
  if (self->_containsUnverifiedPersons != a3)
  {
    self->_containsUnverifiedPersons = a3;
    [(PXCMMViewModel *)self signalChange:0x8000];
  }
}

- (void)setShouldShowPlaceholder:(BOOL)a3
{
  if (self->_shouldShowPlaceholder != a3)
  {
    self->_shouldShowPlaceholder = a3;
    [(PXCMMViewModel *)self signalChange:4096];
  }
}

- (void)setLoadingPeopleSuggestions:(BOOL)a3
{
  if (self->_loadingPeopleSuggestions != a3)
  {
    self->_loadingPeopleSuggestions = a3;
    [(PXCMMViewModel *)self signalChange:2048];
  }
}

- (void)setTotalCount:(int64_t)a3
{
  if (self->_totalCount != a3)
  {
    self->_totalCount = a3;
    [(PXCMMViewModel *)self signalChange:512];
  }
}

- (void)setVideosCount:(int64_t)a3
{
  if (self->_videosCount != a3)
  {
    self->_videosCount = a3;
    [(PXCMMViewModel *)self signalChange:512];
  }
}

- (void)setPhotosCount:(int64_t)a3
{
  if (self->_photosCount != a3)
  {
    self->_photosCount = a3;
    [(PXCMMViewModel *)self signalChange:512];
  }
}

- (void)setSelectedCount:(int64_t)a3
{
  if (self->_selectedCount != a3)
  {
    self->_selectedCount = a3;
    [(PXCMMViewModel *)self signalChange:0x10000];
  }
}

- (void)setSelectedVideosCount:(int64_t)a3
{
  if (self->_selectedVideosCount != a3)
  {
    self->_selectedVideosCount = a3;
    [(PXCMMViewModel *)self signalChange:0x10000];
  }
}

- (void)setSelectedPhotosCount:(int64_t)a3
{
  if (self->_selectedPhotosCount != a3)
  {
    self->_selectedPhotosCount = a3;
    [(PXCMMViewModel *)self signalChange:0x10000];
  }
}

- (void)setEndDate:(id)a3
{
  v7 = (NSDate *)a3;
  id v5 = self->_endDate;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSDate *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_endDate, a3);
      [(PXCMMViewModel *)self signalChange:256];
    }
  }
}

- (void)setStartDate:(id)a3
{
  v7 = (NSDate *)a3;
  id v5 = self->_startDate;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSDate *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_startDate, a3);
      [(PXCMMViewModel *)self signalChange:256];
    }
  }
}

- (void)setPosterAsset:(id)a3 posterMediaProvider:(id)a4
{
  char v14 = (PXDisplayAsset *)a3;
  v7 = (PXUIImageProvider *)a4;
  v8 = self->_posterAsset;
  if (v8 == v14)
  {
  }
  else
  {
    int v9 = [(PXDisplayAsset *)v14 isEqual:v8];

    if (!v9)
    {
LABEL_7:
      objc_storeStrong((id *)&self->_posterAsset, a3);
      objc_storeStrong((id *)&self->_posterMediaProvider, a4);
      [(PXCMMViewModel *)self signalChange:128];
      goto LABEL_9;
    }
  }
  v10 = self->_posterMediaProvider;
  if (v10 != v7)
  {
    v11 = v10;
    v12 = v7;
    char v13 = [(PXUIImageProvider *)v12 isEqual:v11];

    if (v13) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

LABEL_9:
}

- (void)setShareUUID:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_shareUUID;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSString *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      char v6 = (NSString *)[(NSString *)v8 copy];
      shareUUID = self->_shareUUID;
      self->_shareUUID = v6;

      [(PXCMMViewModel *)self signalChange:64];
    }
  }
}

- (void)setShareURL:(id)a3
{
  v8 = (NSURL *)a3;
  v4 = self->_shareURL;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSURL *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      char v6 = (NSURL *)[(NSURL *)v8 copy];
      shareURL = self->_shareURL;
      self->_shareURL = v6;

      [(PXCMMViewModel *)self signalChange:32];
    }
  }
}

- (void)setNumberOfReceivedAssets:(unint64_t)a3
{
  if (self->_numberOfReceivedAssets != a3)
  {
    self->_numberOfReceivedAssets = a3;
    [(PXCMMViewModel *)self signalChange:16];
  }
}

- (void)setOriginatorRecipient:(id)a3
{
  char v5 = (PXRecipient *)a3;
  if (self->_originatorRecipient != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_originatorRecipient, a3);
    [(PXCMMViewModel *)self signalChange:8];
    char v5 = v6;
  }
}

- (void)setRecipients:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_recipients, "isEqualToArray:"))
  {
    v4 = (NSArray *)[v6 copy];
    recipients = self->_recipients;
    self->_recipients = v4;

    [(PXCMMViewModel *)self signalChange:4];
  }
}

- (void)setSelectionEnabled:(BOOL)a3
{
  if (self->_selectionEnabled != a3)
  {
    self->_selectionEnabled = a3;
    [(PXCMMViewModel *)self signalChange:0x4000];
  }
}

- (void)setSelecting:(BOOL)a3
{
  if (self->_selecting != a3)
  {
    self->_selecting = a3;
    [(PXCMMViewModel *)self signalChange:1024];
  }
}

- (void)setSelectionManager:(id)a3
{
  char v5 = (PXSectionedSelectionManager *)a3;
  selectionManager = self->_selectionManager;
  int v9 = v5;
  if (selectionManager != v5)
  {
    [(PXSectionedSelectionManager *)selectionManager unregisterChangeObserver:self context:PXSelectionManagerObservationContext];
    objc_storeStrong((id *)&self->_selectionManager, a3);
    v7 = [(PXSectionedSelectionManager *)v9 selectionSnapshot];
    PXCMMUpdateCountsWithSelectionSnapshot(self, v7);
    v8 = [v7 dataSource];
    -[PXCMMViewModel setShouldShowPlaceholder:](self, "setShouldShowPlaceholder:", [v8 containsAnyItems] ^ 1);

    [(PXSectionedSelectionManager *)self->_selectionManager registerChangeObserver:self context:PXSelectionManagerObservationContext];
    [(PXCMMViewModel *)self signalChange:2];
  }
}

- (void)setSubtitle:(id)a3
{
  v11 = (NSString *)a3;
  if (!v11)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXCMMViewModel.m", 109, @"Invalid parameter not satisfying: %@", @"subtitle" object file lineNumber description];
  }
  char v5 = self->_subtitle;
  if (v5 == v11)
  {
  }
  else
  {
    id v6 = v5;
    BOOL v7 = [(NSString *)v5 isEqualToString:v11];

    if (!v7)
    {
      v8 = (NSString *)[(NSString *)v11 copy];
      subtitle = self->_subtitle;
      self->_subtitle = v8;

      [(PXCMMViewModel *)self signalChange:1];
    }
  }
}

- (void)setTitle:(id)a3
{
  v11 = (NSString *)a3;
  if (!v11)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXCMMViewModel.m", 98, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];
  }
  char v5 = self->_title;
  if (v5 == v11)
  {
  }
  else
  {
    id v6 = v5;
    BOOL v7 = [(NSString *)v5 isEqualToString:v11];

    if (!v7)
    {
      v8 = (NSString *)[(NSString *)v11 copy];
      title = self->_title;
      self->_title = v8;

      [(PXCMMViewModel *)self signalChange:1];
    }
  }
}

- (void)setOriginalTitle:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_originalTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      id v6 = (NSString *)[(NSString *)v8 copy];
      originalTitle = self->_originalTitle;
      self->_originalTitle = v6;

      [(PXCMMViewModel *)self signalChange:1];
    }
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXCMMViewModel;
  [(PXCMMViewModel *)&v3 performChanges:a3];
}

- (int64_t)aggregateMediaTypeForSelection
{
  int64_t v3 = [(PXCMMViewModel *)self selectedPhotosCount];
  int64_t v4 = [(PXCMMViewModel *)self selectedVideosCount];
  int64_t result = [(PXCMMViewModel *)self selectedCount];
  if (result)
  {
    if (v4 || v3 != result)
    {
      if (v4 == result && v3 == 0) {
        return 2;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (int64_t)aggregateMediaType
{
  int64_t v3 = [(PXCMMViewModel *)self photosCount];
  int64_t v4 = [(PXCMMViewModel *)self videosCount];
  int64_t result = [(PXCMMViewModel *)self totalCount];
  if (result)
  {
    if (v4 || v3 != result)
    {
      if (v4 == result && v3 == 0) {
        return 2;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

@end