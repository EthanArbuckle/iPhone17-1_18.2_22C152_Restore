@interface PXPhotosViewEventTracker
+ (double)selectModeImpressionMinimumDuration;
+ (id)analyticsViewNameForDataSource:(id)a3;
- (NSNumber)isInSelectModeValue;
- (PXPhotosViewEventTracker)initWithViewModel:(id)a3;
- (PXPhotosViewEventTracker)initWithViewName:(id)a3;
- (PXPhotosViewModel)viewModel;
- (double)isInSelectModeValueTimestamp;
- (void)_invalidateTrackedValues;
- (void)_updateTrackedValues;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setIsInSelectModeValue:(id)a3;
@end

@implementation PXPhotosViewEventTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isInSelectModeValue, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (double)isInSelectModeValueTimestamp
{
  return self->_isInSelectModeValueTimestamp;
}

- (NSNumber)isInSelectModeValue
{
  return self->_isInSelectModeValue;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)EventTrackerObserverContext_214090 == a5)
  {
    if ((a4 & 8) == 0) {
      goto LABEL_6;
    }
LABEL_5:
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__PXPhotosViewEventTracker_observable_didChange_context___block_invoke;
    v9[3] = &unk_1E5DD0FA8;
    v9[4] = self;
    [(PXPhotosViewEventTracker *)self performChanges:v9];
    goto LABEL_6;
  }
  if ((void *)ViewModelObservationContext_214091 == a5)
  {
    if ((a4 & 5) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v10.receiver = self;
  v10.super_class = (Class)PXPhotosViewEventTracker;
  [(PXMediaViewControllerEventTracker *)&v10 observable:v8 didChange:a4 context:a5];
LABEL_6:
}

uint64_t __57__PXPhotosViewEventTracker_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateTrackedValues];
}

- (void)setIsInSelectModeValue:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v5 = (NSNumber *)a3;
  v6 = self->_isInSelectModeValue;
  if (v6 == v5)
  {
  }
  else
  {
    v7 = v6;
    char v8 = [(NSNumber *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      if ([(NSNumber *)self->_isInSelectModeValue BOOLValue])
      {
        [(PXUserInterfaceElementEventTracker *)self timeIntervalSinceTimestamp:self->_isInSelectModeValueTimestamp];
        double v10 = v9;
        [(id)objc_opt_class() selectModeImpressionMinimumDuration];
        if (v10 >= v11)
        {
          v12 = (void *)MEMORY[0x1E4F56658];
          uint64_t v17 = *MEMORY[0x1E4F56560];
          v13 = [(PXMediaViewControllerEventTracker *)self viewName];
          v18[0] = v13;
          v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
          v15 = [(PXUserInterfaceElementEventTracker *)self finalPayloadWithPayload:v14];
          [v12 sendEvent:@"com.apple.photos.CPAnalytics.selectModeEntered" withPayload:v15];
        }
      }
      objc_storeStrong((id *)&self->_isInSelectModeValue, a3);
      [(PXUserInterfaceElementEventTracker *)self currentTimestamp];
      self->_isInSelectModeValueTimestamp = v16;
    }
  }
}

- (void)_updateTrackedValues
{
  if ([(PXViewControllerEventTracker *)self isViewVisible])
  {
    v3 = [(PXPhotosViewEventTracker *)self viewModel];
    v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isInSelectMode"));
    v5 = [v3 currentDataSource];
    v6 = [v5 containerCollection];

    if ([v6 conformsToProtocol:&unk_1F0352298]) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v9 = v7;

    id v8 = v9;
  }
  else
  {
    v4 = 0;
    id v8 = 0;
  }
  id v10 = v8;
  [(PXMediaViewControllerEventTracker *)self setDisplayedAssetCollection:v8];
  [(PXPhotosViewEventTracker *)self setIsInSelectModeValue:v4];
}

- (void)_invalidateTrackedValues
{
  id v2 = [(PXUserInterfaceElementEventTracker *)self updater];
  [v2 setNeedsUpdateOf:sel__updateTrackedValues];
}

- (PXPhotosViewEventTracker)initWithViewModel:(id)a3
{
  id v5 = a3;
  v6 = objc_opt_class();
  id v7 = [v5 currentDataSource];
  id v8 = [v6 analyticsViewNameForDataSource:v7];

  v13.receiver = self;
  v13.super_class = (Class)PXPhotosViewEventTracker;
  id v9 = [(PXMediaViewControllerEventTracker *)&v13 initWithViewName:v8];
  id v10 = v9;
  if (v9)
  {
    [(PXPhotosViewEventTracker *)v9 registerChangeObserver:v9 context:EventTrackerObserverContext_214090];
    objc_storeStrong((id *)&v10->_viewModel, a3);
    [(PXPhotosViewModel *)v10->_viewModel registerChangeObserver:v10 context:ViewModelObservationContext_214091];
    double v11 = [(PXUserInterfaceElementEventTracker *)v10 updater];
    [v11 addUpdateSelector:sel__updateTrackedValues];
  }
  return v10;
}

- (PXPhotosViewEventTracker)initWithViewName:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosViewEventTracker.m", 109, @"%s is not available as initializer", "-[PXPhotosViewEventTracker initWithViewName:]");

  abort();
}

+ (double)selectModeImpressionMinimumDuration
{
  return 1.0;
}

+ (id)analyticsViewNameForDataSource:(id)a3
{
  id v3 = a3;
  v4 = [v3 containerCollection];
  id v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "px_isRecentsSmartAlbum"))
    {
      v6 = @"PhotosView_smartAlbumRecents";
      goto LABEL_30;
    }
    if (objc_msgSend(v5, "px_isOwnedSharedAlbum"))
    {
      v6 = @"PhotosView_sharedAlbumOwned";
      goto LABEL_30;
    }
    if (objc_msgSend(v5, "px_isImportedAlbum"))
    {
      v6 = @"PhotosView_smartImported";
      goto LABEL_30;
    }
    if (objc_msgSend(v5, "px_isAllLibraryDuplicatesSmartAlbum"))
    {
      v6 = @"DuplicatesAlbum";
      goto LABEL_30;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = @"PhotosView";
    goto LABEL_30;
  }
  id v7 = v5;
  if (![v7 isTransient]
    || ([v7 transientIdentifier], id v8 = objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
    double v11 = [v3 container];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    objc_super v13 = [v3 container];
    v14 = v13;
    if (isKindOfClass)
    {
      int v15 = [v13 detectionType];
      double v16 = @"PhotosView_personUnknown";
      if ((unsigned __int16)v15 == 3) {
        double v16 = @"PhotosView_personDog";
      }
      if ((unsigned __int16)v15 == 4) {
        uint64_t v17 = @"PhotosView_personCat";
      }
      else {
        uint64_t v17 = v16;
      }
      if (v15 == 1) {
        v6 = @"PhotosView_personHuman";
      }
      else {
        v6 = v17;
      }
    }
    else
    {
      objc_opt_class();
      char v18 = objc_opt_isKindOfClass();

      if (v18)
      {
        v6 = @"PhotosView_socialGroup";
        goto LABEL_29;
      }
      v14 = objc_msgSend(MEMORY[0x1E4F38EE8], "descriptionForSubtype:", objc_msgSend(v7, "assetCollectionSubtype"));
      v6 = [NSString stringWithFormat:@"PhotosView_%@", v14];
    }
LABEL_28:

    goto LABEL_29;
  }
  id v9 = [v7 transientIdentifier];
  char v10 = [v9 hasPrefix:@"PXFeaturedPhotosVirtualCollection"];

  if ((v10 & 1) == 0)
  {
    if (objc_msgSend(v7, "px_isSavedTodayCollection"))
    {
      v6 = @"PhotosView_PXTransientCollectionIdentifierSavedToday";
      goto LABEL_29;
    }
    v20 = NSString;
    v21 = [v7 transientIdentifier];
    v14 = [v20 stringWithFormat:@"PhotosView_%@", v21];

    if ([v14 hasPrefix:@"PhotosView_utility-"])
    {
      if ([v14 isEqualToString:@"PhotosView_utility-1"])
      {
        v6 = @"PhotosView_genericDocument";
        goto LABEL_28;
      }
      if ([v14 isEqualToString:@"PhotosView_utility-2"])
      {
        v6 = @"PhotosView_receipts";
        goto LABEL_28;
      }
      if ([v14 isEqualToString:@"PhotosView_utility-3"])
      {
        v6 = @"PhotosView_illustrations";
        goto LABEL_28;
      }
      if ([v14 isEqualToString:@"PhotosView_utility-4"])
      {
        v6 = @"PhotosView_handwriting";
        goto LABEL_28;
      }
      if ([v14 isEqualToString:@"PhotosView_utility-5"])
      {
        v6 = @"PhotosView_qrCodes";
        goto LABEL_28;
      }
    }
    v22 = NSString;
    v23 = [v7 transientIdentifier];
    v6 = [v22 stringWithFormat:@"PhotosView_%@", v23];

    goto LABEL_28;
  }
  v6 = @"PhotosView_PXFeaturedPhotosVirtualCollection";
LABEL_29:

LABEL_30:
  return v6;
}

@end