@interface PXContentSyndicationCountsController
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)actualDetailedCounts;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)detailedCounts;
- (NSString)savedCountDescription;
- (NSString)totalCountDescription;
- (PXContentSyndicationCountsController)init;
- (PXDisplayAssetCollection)assetCollection;
- (int64_t)actualSavedCount;
- (int64_t)savedCount;
- (void)performChanges:(id)a3;
- (void)setAssetCollection:(id)a3;
- (void)setDetailedCounts:(id *)a3;
- (void)setSavedCount:(int64_t)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation PXContentSyndicationCountsController

- (void).cxx_destruct
{
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5 = a4;
  v6 = NSStringFromSelector(sel_mockNumberOfAssetsSaved);
  if ([v5 isEqualToString:v6])
  {

LABEL_4:
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__PXContentSyndicationCountsController_settings_changedValueForKey___block_invoke;
    v9[3] = &unk_1E5DB1BA8;
    v9[4] = self;
    [(PXContentSyndicationCountsController *)self performChanges:v9];
    goto LABEL_5;
  }
  v7 = NSStringFromSelector(sel_footerMockType);
  int v8 = [v5 isEqualToString:v7];

  if (v8) {
    goto LABEL_4;
  }
LABEL_5:
}

uint64_t __68__PXContentSyndicationCountsController_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) signalChange:2];
  v2 = *(void **)(a1 + 32);
  return [v2 signalChange:1];
}

- (void)setSavedCount:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_savedCount != a3)
  {
    id v5 = PXContentSyndicationCountsControllerGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = objc_opt_class();
      if (a3 == -1)
      {
        v7 = @"-";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%td", a3);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v9 = v6;
      __int16 v10 = 2048;
      v11 = self;
      __int16 v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "<%@:%p> >>> Saved Count: %{public}@", buf, 0x20u);
    }
    self->_savedCount = a3;
    [(PXContentSyndicationCountsController *)self signalChange:1];
  }
}

- (int64_t)actualSavedCount
{
  return self->_savedCount;
}

- (int64_t)savedCount
{
  int64_t v2 = [(PXContentSyndicationCountsController *)self actualSavedCount];
  v3 = +[PXContentSyndicationSettings sharedInstance];
  if ([v3 mockNumberOfAssetsSaved])
  {
    unint64_t v4 = [v3 footerMockType];
    if (v4 < 3) {
      int64_t v2 = v4;
    }
  }

  return v2;
}

- (void)setDetailedCounts:(id *)a3
{
  p_detailedCounts = &self->_detailedCounts;
  if (self->_detailedCounts.photosCount != a3->var0
    || self->_detailedCounts.videosCount != a3->var1
    || self->_detailedCounts.othersCount != a3->var2)
  {
    int v8 = PXContentSyndicationCountsControllerGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_opt_class();
      PXDisplayAssetDetailedCountsDescription();
    }

    long long v9 = *(_OWORD *)&a3->var0;
    p_detailedCounts->othersCount = a3->var2;
    *(_OWORD *)&p_detailedCounts->photosCount = v9;
    [(PXContentSyndicationCountsController *)self signalChange:2];
  }
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)actualDetailedCounts
{
  *($C8986E5AD9146E03F7E851F39E835596 *)retstr = ($C8986E5AD9146E03F7E851F39E835596)self[4];
  return self;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)detailedCounts
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  [(PXContentSyndicationCountsController *)self actualDetailedCounts];
  id v5 = +[PXContentSyndicationSettings sharedInstance];
  if ([v5 mockNumberOfAssetsSaved])
  {
    retstr->var1 = 0;
    retstr->var2 = 0;
    retstr->var0 = 2;
  }

  return result;
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXContentSyndicationCountsController;
  [(PXContentSyndicationCountsController *)&v3 performChanges:a3];
}

- (NSString)savedCountDescription
{
  [(PXContentSyndicationCountsController *)self detailedCounts];
  int64_t v3 = [(PXContentSyndicationCountsController *)self savedCount];
  if ((void)v13 == 0x7FFFFFFFFFFFFFFFLL
    || *((void *)&v13 + 1) == 0x7FFFFFFFFFFFFFFFLL
    || v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 0;
    goto LABEL_18;
  }
  uint64_t v6 = 0;
  if (v3 != -1)
  {
    uint64_t v7 = *((void *)&v13 + 1) + v13 + v14;
    if (v7)
    {
      if (!v3)
      {
        long long v15 = v13;
        uint64_t v16 = v14;
        int v8 = @"PXContentSyndicationPhotosSavedNoneTitle";
        long long v9 = @"PXContentSyndicationVideosSavedNoneTitle";
        __int16 v10 = @"PXContentSyndicationItemsSavedNoneTitle";
        goto LABEL_16;
      }
      if (v7 == v3)
      {
        long long v15 = v13;
        uint64_t v16 = v14;
        int v8 = @"PXContentSyndicationPhotosSavedAllTitle";
        long long v9 = @"PXContentSyndicationVideosSavedAllTitle";
        __int16 v10 = @"PXContentSyndicationItemsSavedAllTitle";
LABEL_16:
        uint64_t v6 = PXLocalizedStringForDetailedCounts(&v15, v8, v9, v10);
        goto LABEL_18;
      }
      long long v15 = v13;
      uint64_t v16 = v14;
      v11 = PXLocalizedStringForDetailedCounts(&v15, @"PXContentSyndicationPhotosSavedTitleFormat", @"PXContentSyndicationVideosSavedTitleFormat", @"PXContentSyndicationItemsSavedTitleFormat");
      uint64_t v6 = PXLocalizedStringWithValidatedFormat(v11, @"%ld %ld");
    }
  }
LABEL_18:
  return (NSString *)v6;
}

- (NSString)totalCountDescription
{
  [(PXContentSyndicationCountsController *)self detailedCounts];
  BOOL v3 = v6 == 0x7FFFFFFFFFFFFFFFLL || v7 == 0x7FFFFFFFFFFFFFFFLL || v8 == 0x7FFFFFFFFFFFFFFFLL;
  if (!v3 && v7 + v6 + v8)
  {
    unint64_t v4 = PLLocalizedCountDescription();
  }
  else
  {
    unint64_t v4 = 0;
  }
  return (NSString *)v4;
}

- (void)setAssetCollection:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = (PXDisplayAssetCollection *)a3;
  if (!v5)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXContentSyndicationCountsController.m", 58, @"Invalid parameter not satisfying: %@", @"assetCollection" object file lineNumber description];
  }
  uint64_t v6 = self->_assetCollection;
  if (v6 == v5)
  {
  }
  else
  {
    uint64_t v7 = v6;
    char v8 = [(PXDisplayAssetCollection *)v6 isEqual:v5];

    if ((v8 & 1) == 0)
    {
      long long v9 = PXContentSyndicationCountsControllerGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = objc_opt_class();
        v11 = v5;
        __int16 v12 = [(PXDisplayAssetCollection *)v11 px_cheapLogIdentifier];
        long long v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          id v14 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), v11];
        }
        long long v15 = v14;

        *(_DWORD *)buf = 138412802;
        uint64_t v20 = v10;
        __int16 v21 = 2048;
        v22 = self;
        __int16 v23 = 2114;
        v24 = v15;
        _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "<%@:%p> Set Asset Collection: %{public}@", buf, 0x20u);
      }
      uint64_t v16 = (PXDisplayAssetCollection *)[(PXDisplayAssetCollection *)v5 copyWithZone:0];
      assetCollection = self->_assetCollection;
      self->_assetCollection = v16;

      [(PXContentSyndicationCountsController *)self didSetAssetCollection:v5];
    }
  }
}

- (PXContentSyndicationCountsController)init
{
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXContentSyndicationCountsController.m", 44, @"%s is not available as initializer", "-[PXContentSyndicationCountsController init]");

    abort();
  }
  v10.receiver = self;
  v10.super_class = (Class)PXContentSyndicationCountsController;
  id v5 = [(PXContentSyndicationCountsController *)&v10 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_savedCount = -1;
    v5->_detailedCounts.othersCount = *((void *)off_1E5DAAEE0 + 2);
    *(_OWORD *)&v5->_detailedCounts.photosCount = *(_OWORD *)off_1E5DAAEE0;
    uint64_t v7 = +[PXContentSyndicationSettings sharedInstance];
    [v7 addDeferredKeyObserver:v6];
  }
  return v6;
}

@end