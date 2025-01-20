@interface PUCurationClassificationSignalAssetBrowserDebugViewController
- (BOOL)_writeDiagnosticsToURL:(id)a3 incorrectAssets:(id)a4;
- (BOOL)shouldShowToolbar;
- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)newToolbarItems;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)_doneEditingSettings:(id)a3;
- (void)_editSettings:(id)a3;
- (void)_fileRadarWithIncorrectAssets:(id)a3;
- (void)_presentTapToRadar;
- (void)_setMaximum:(id)a3;
- (void)_setMinimum:(id)a3;
- (void)_setShowsVideos:(id)a3;
- (void)_update;
- (void)getTitle:(id *)a3 prompt:(id *)a4 shouldHideBackButton:(BOOL *)a5 leftBarButtonItems:(id *)a6 rightBarButtonItems:(id *)a7;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setSignalConfidenceByAssetUUID:(id)a3 withSignalName:(id)a4 operatingPoint:(double)a5 highPrecisionOperatingPoint:(double)a6 highRecallOperatingPoint:(double)a7;
- (void)viewDidLoad;
@end

@implementation PUCurationClassificationSignalAssetBrowserDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortPickerView, 0);
  objc_storeStrong((id *)&self->_signalConfidenceByAssetUUID, 0);
  objc_storeStrong((id *)&self->_signalName, 0);
}

- (BOOL)_writeDiagnosticsToURL:(id)a3 incorrectAssets:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v60 = 0;
  v47 = v6;
  char v9 = [v8 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v60];
  v10 = v60;

  if (v9)
  {
    v41 = self;
    v42 = v10;
    v11 = objc_opt_new();
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v43 = v7;
    id obj = v7;
    uint64_t v48 = [obj countByEnumeratingWithState:&v56 objects:v71 count:16];
    if (v48)
    {
      uint64_t v45 = *(void *)v57;
      v46 = v11;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v57 != v45) {
            objc_enumerationMutation(obj);
          }
          uint64_t v50 = v12;
          v13 = *(void **)(*((void *)&v56 + 1) + 8 * v12);
          v49 = objc_msgSend(MEMORY[0x1E4F90200], "cloneAsset:resourceType:toDirectory:", v13, 1, v47, v41);
          v14 = NSStringFromSelector(sel_sceneIdentifier);
          v15 = objc_opt_new();
          v16 = [v13 sceneClassifications];
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v52 objects:v70 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v53;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v53 != v19) {
                  objc_enumerationMutation(v16);
                }
                v21 = *(void **)(*((void *)&v52 + 1) + 8 * i);
                v68[0] = v14;
                v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v21, "extendedSceneIdentifier"));
                v68[1] = @"confidence";
                v69[0] = v22;
                v23 = NSNumber;
                [v21 confidence];
                v24 = objc_msgSend(v23, "numberWithDouble:");
                v69[1] = v24;
                v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:2];

                [v15 addObject:v25];
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v52 objects:v70 count:16];
            }
            while (v18);
          }
          v26 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v14 ascending:1];
          v67 = v26;
          v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
          [v15 sortUsingDescriptors:v27];

          v65[0] = @"image";
          uint64_t v28 = [v49 lastPathComponent];
          v29 = (void *)v28;
          v30 = &stru_1F06BE7B8;
          if (v28) {
            v30 = (__CFString *)v28;
          }
          v65[1] = @"classifications";
          v66[0] = v30;
          v66[1] = v15;
          v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:2];

          v11 = v46;
          [v46 addObject:v31];

          uint64_t v12 = v50 + 1;
        }
        while (v50 + 1 != v48);
        uint64_t v48 = [obj countByEnumeratingWithState:&v56 objects:v71 count:16];
      }
      while (v48);
    }

    v63[0] = @"type";
    v63[1] = @"signalName";
    signalName = v41->_signalName;
    v64[0] = @"classification signals";
    v64[1] = signalName;
    v63[2] = @"report";
    v61 = @"FP";
    v62 = v11;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    v64[2] = v33;
    v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:3];

    v51 = v42;
    v35 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v34 options:1 error:&v51];
    v36 = v51;

    if (v35)
    {
      v37 = [v47 URLByAppendingPathComponent:@"report.json"];
      BOOL v38 = 1;
      if ([v35 writeToURL:v37 atomically:1])
      {
LABEL_29:

        id v7 = v43;
        goto LABEL_30;
      }
      v39 = PLUIGetLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v73 = v37;
        __int16 v74 = 2112;
        v75 = v36;
        _os_log_impl(&dword_1AE9F8000, v39, OS_LOG_TYPE_ERROR, "Failed to write JSON radar report to path: %@, error: %@", buf, 0x16u);
      }
    }
    else
    {
      v37 = PLUIGetLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v73 = v36;
        _os_log_impl(&dword_1AE9F8000, v37, OS_LOG_TYPE_ERROR, "Failed to create JSON data with error: %@", buf, 0xCu);
      }
    }
    BOOL v38 = 0;
    goto LABEL_29;
  }
  v11 = PLUIGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v73 = v47;
    __int16 v74 = 2112;
    v75 = v10;
    _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "Failed to create directory for feedback files at path: %@, error: %@", buf, 0x16u);
  }
  BOOL v38 = 0;
  v36 = v10;
LABEL_30:

  return v38;
}

- (void)_fileRadarWithIncorrectAssets:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:@"Collecting data for radar..." preferredStyle:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __95__PUCurationClassificationSignalAssetBrowserDebugViewController__fileRadarWithIncorrectAssets___block_invoke;
  v8[3] = &unk_1E5F2E908;
  v8[4] = self;
  id v9 = v4;
  id v10 = v5;
  id v6 = v5;
  id v7 = v4;
  [(PUCurationClassificationSignalAssetBrowserDebugViewController *)self presentViewController:v6 animated:1 completion:v8];
}

void __95__PUCurationClassificationSignalAssetBrowserDebugViewController__fileRadarWithIncorrectAssets___block_invoke(id *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] assetCollectionAssets];
  unint64_t v3 = [v2 count];

  unint64_t v4 = [a1[5] count];
  v5 = (void *)MEMORY[0x1E4F28EE0];
  id v6 = [NSNumber numberWithDouble:(double)v4 / (double)v3];
  id v7 = [v5 localizedStringFromNumber:v6 numberStyle:3];

  v8 = [NSString stringWithFormat:@"[CLC] \"%@\" has %ld incorrect classification(s)", *((void *)a1[4] + 222), v4];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v9 appendString:@"— Classification Signal Feedback —\n"];
  [v9 appendFormat:@"Classification Signal: \"%@\"\n", *((void *)a1[4] + 222)];
  [v9 appendFormat:@"Incorrect Classification(s): %ld of %ld (%@)\n", v4, v3, v7];
  id v10 = NSTemporaryDirectory();
  v11 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v12 = [v11 UUIDString];
  v13 = [v10 stringByAppendingPathComponent:v12];

  v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:1];
  if (([a1[4] _writeDiagnosticsToURL:v14 incorrectAssets:a1[5]] & 1) == 0)
  {
    v15 = PLUIGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v14;
      _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_ERROR, "Failed to write diagnostics to URL: %@", buf, 0xCu);
    }
  }
  v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v28 = 0;
  uint64_t v17 = [v16 contentsOfDirectoryAtURL:v14 includingPropertiesForKeys:0 options:4 error:&v28];
  id v18 = v28;
  if (!v17)
  {
    uint64_t v19 = PLUIGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v14;
      __int16 v31 = 2112;
      id v32 = v18;
      _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "Failed to find diagnostic files at URL: %@, error: %@", buf, 0x16u);
    }
  }
  v20 = (void *)MEMORY[0x1E4F90200];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __95__PUCurationClassificationSignalAssetBrowserDebugViewController__fileRadarWithIncorrectAssets___block_invoke_375;
  v24[3] = &unk_1E5F2B8C8;
  v24[4] = a1[4];
  id v25 = a1[6];
  id v26 = v16;
  id v27 = v14;
  id v21 = v14;
  id v22 = v16;
  LOBYTE(v23) = 0;
  [v20 fileRadarWithTitle:v8 description:v9 classification:@"Other Bug" componentID:@"721490" componentName:@"Photos Scene Classification" componentVersion:@"all" keyword:&stru_1F06BE7B8 attachmentURLs:v17 includeSysDiagnose:v23 completionHandler:v24];
}

void __95__PUCurationClassificationSignalAssetBrowserDebugViewController__fileRadarWithIncorrectAssets___block_invoke_375(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setEditing:0 animated:0];
  [*(id *)(a1 + 40) dismissViewControllerAnimated:1 completion:0];
  v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  id v8 = 0;
  char v4 = [v2 removeItemAtURL:v3 error:&v8];
  id v5 = v8;
  if ((v4 & 1) == 0)
  {
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Failed to cleanup temporary Tap-To-Radar item at URL: %@, error: %@", buf, 0x16u);
    }
  }
}

- (void)_presentTapToRadar
{
  uint64_t v3 = [(PUPhotosGridViewController *)self photoSelectionManager];
  char v4 = [(PUPhotosAlbumViewController *)self assetCollection];
  char v5 = [v3 isAnyAssetSelectedInAssetCollection:v4];

  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__PUCurationClassificationSignalAssetBrowserDebugViewController__presentTapToRadar__block_invoke_2;
    v9[3] = &unk_1E5F2CEE8;
    v9[4] = self;
    [MEMORY[0x1E4F90200] presentTermsAndConditionsForUIViewController:self completion:v9];
  }
  else
  {
    id v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"File Radar" message:@"File radar without attaching photos?\nSelecting incorrect photos can help improve the classification features." preferredStyle:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __83__PUCurationClassificationSignalAssetBrowserDebugViewController__presentTapToRadar__block_invoke;
    v10[3] = &unk_1E5F2BF98;
    v10[4] = self;
    uint64_t v7 = [MEMORY[0x1E4FB1410] actionWithTitle:@"File Radar" style:0 handler:v10];
    id v8 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
    [v6 addAction:v7];
    [v6 addAction:v8];
    [(PUCurationClassificationSignalAssetBrowserDebugViewController *)self presentViewController:v6 animated:1 completion:0];
  }
}

uint64_t __83__PUCurationClassificationSignalAssetBrowserDebugViewController__presentTapToRadar__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fileRadarWithIncorrectAssets:0];
}

void __83__PUCurationClassificationSignalAssetBrowserDebugViewController__presentTapToRadar__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) selectedAssets];
    [*(id *)(a1 + 32) _fileRadarWithIncorrectAssets:v3];
  }
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  if (self->_sortPickerView == a3) {
    self->_sortsAscending = a4 == 0;
  }
  [(PUCurationClassificationSignalAssetBrowserDebugViewController *)self _update];
}

- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4
{
  return 20.0;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  if (self->_sortPickerView == a3)
  {
    id v6 = @"Descending";
    if (!a4) {
      id v6 = @"Ascending";
    }
    char v5 = v6;
  }
  else
  {
    char v5 = 0;
  }
  return v5;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return 2 * (self->_sortPickerView == a3);
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v24.receiver = self;
  v24.super_class = (Class)PUCurationClassificationSignalAssetBrowserDebugViewController;
  id v6 = a4;
  uint64_t v7 = [(PUPhotosGridViewController *)&v24 collectionView:a3 cellForItemAtIndexPath:v6];
  id v8 = [(PUPhotosAlbumViewController *)self assetCollectionAssets];
  uint64_t v9 = [v6 item];

  uint64_t v10 = [v8 objectAtIndex:v9];

  signalConfidenceByAssetUUID = self->_signalConfidenceByAssetUUID;
  id v12 = [v10 uuid];
  uint64_t v13 = [(NSDictionary *)signalConfidenceByAssetUUID objectForKeyedSubscript:v12];
  [v13 doubleValue];
  uint64_t v15 = v14;

  v16 = [NSString stringWithFormat:@"%.2f", v15];
  [v7 setScore:v16];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__PUCurationClassificationSignalAssetBrowserDebugViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  block[3] = &unk_1E5F2D2C8;
  id v17 = v7;
  uint64_t v23 = v15;
  id v21 = v17;
  id v22 = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  id v18 = v17;

  return v18;
}

void __103__PUCurationClassificationSignalAssetBrowserDebugViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  id v3 = *(double **)(a1 + 40);
  if (v2 >= v3[224])
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] systemGreenColor];
  }
  else if (v2 >= v3[223])
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] labelColor];
  }
  else
  {
    if (v2 >= v3[225]) {
      [MEMORY[0x1E4FB1618] systemYellowColor];
    }
    else {
    uint64_t v4 = [MEMORY[0x1E4FB1618] systemRedColor];
    }
  }
  id v5 = (id)v4;
  [*(id *)(a1 + 32) setColor:v4];
}

- (void)setSignalConfidenceByAssetUUID:(id)a3 withSignalName:(id)a4 operatingPoint:(double)a5 highPrecisionOperatingPoint:(double)a6 highRecallOperatingPoint:(double)a7
{
  id v15 = a3;
  uint64_t v13 = (NSString *)a4;
  objc_storeStrong((id *)&self->_signalConfidenceByAssetUUID, a3);
  signalName = self->_signalName;
  self->_signalName = v13;

  self->_operatingPoint = a5;
  self->_highPrecisionOperatingPoint = a6;
  self->_highRecallOperatingPoint = a7;
  if ([(PUCurationClassificationSignalAssetBrowserDebugViewController *)self isViewLoaded]) {
    [(PUCurationClassificationSignalAssetBrowserDebugViewController *)self _update];
  }
}

- (void)_doneEditingSettings:(id)a3
{
}

- (void)_setShowsVideos:(id)a3
{
  self->_showsVideos = [a3 isOn];
  [(PUCurationClassificationSignalAssetBrowserDebugViewController *)self _update];
}

- (void)_setMaximum:(id)a3
{
  uint64_t v4 = [a3 text];
  [v4 doubleValue];
  self->_maximumValue = v5;

  [(PUCurationClassificationSignalAssetBrowserDebugViewController *)self _update];
}

- (void)_setMinimum:(id)a3
{
  uint64_t v4 = [a3 text];
  [v4 doubleValue];
  self->_minimumValue = v5;

  [(PUCurationClassificationSignalAssetBrowserDebugViewController *)self _update];
}

- (void)_editSettings:(id)a3
{
  id v35 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  uint64_t v4 = [v35 view];
  double v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  id v6 = [v5 colorWithAlphaComponent:0.75];
  [v4 setBackgroundColor:v6];

  id v7 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v34 = v4;
  [v4 bounds];
  uint64_t v9 = objc_msgSend(v7, "initWithFrame:", 10.0, 10.0, v8 + -20.0, 100.0);
  [v9 setAutoresizingMask:34];
  uint64_t v10 = [v9 layer];
  [v10 setCornerRadius:6.0];

  __int16 v11 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [v9 setBackgroundColor:v11];

  [v4 addSubview:v9];
  [v9 bounds];
  double v13 = v12 + -20.0 + -20.0 + -120.0;
  uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB14D0]), "initWithFrame:", 20.0, 20.0, 120.0, 40.0);
  [v14 setAutoresizingMask:36];
  [v14 setTitle:@"Done" forState:0];
  id v15 = [MEMORY[0x1E4FB1618] blueColor];
  [v14 setTitleColor:v15 forState:0];

  [v14 addTarget:self action:sel__doneEditingSettings_ forControlEvents:0xFFFFFFFFLL];
  [v9 addSubview:v14];
  [v14 sizeToFit];
  uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 20.0, 76.0, 120.0, 40.0);
  [v33 setAutoresizingMask:36];
  [v33 setText:@"Sort:"];
  [v9 addSubview:v33];
  v16 = (UIPickerView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1A98]), "initWithFrame:", 140.0, 66.0, v13, 60.0);
  sortPickerView = self->_sortPickerView;
  self->_sortPickerView = v16;

  id v18 = [(UIPickerView *)self->_sortPickerView layer];
  [v18 setCornerRadius:6.0];

  uint64_t v19 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(UIPickerView *)self->_sortPickerView setBackgroundColor:v19];

  [(UIPickerView *)self->_sortPickerView setDataSource:self];
  [(UIPickerView *)self->_sortPickerView setDelegate:self];
  [(UIPickerView *)self->_sortPickerView selectRow:!self->_sortsAscending inComponent:0 animated:0];
  [v9 addSubview:self->_sortPickerView];
  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 20.0, 132.0, 120.0, 40.0);
  [v20 setAutoresizingMask:36];
  [v20 setText:@"Minimum:"];
  [v9 addSubview:v20];
  id v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D70]), "initWithFrame:", 140.0, 132.0, 50.0, 40.0);
  [v21 setAutoresizingMask:36];
  id v22 = [v21 layer];
  [v22 setCornerRadius:6.0];

  uint64_t v23 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v21 setBackgroundColor:v23];

  [v21 setTextAlignment:1];
  [v21 setKeyboardType:8];
  objc_super v24 = objc_msgSend(NSString, "stringWithFormat:", @"%.3g", *(void *)&self->_minimumValue);
  [v21 setText:v24];

  [v21 addTarget:self action:sel__setMinimum_ forControlEvents:0x40000];
  [v9 addSubview:v21];
  id v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 20.0, 188.0, 120.0, 40.0);
  [v25 setAutoresizingMask:36];
  [v25 setText:@"Maximum:"];
  [v9 addSubview:v25];
  id v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D70]), "initWithFrame:", 140.0, 188.0, 50.0, 40.0);
  [v26 setAutoresizingMask:36];
  id v27 = [v26 layer];
  [v27 setCornerRadius:6.0];

  id v28 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v26 setBackgroundColor:v28];

  [v26 setTextAlignment:1];
  [v26 setKeyboardType:8];
  v29 = objc_msgSend(NSString, "stringWithFormat:", @"%.3g", *(void *)&self->_maximumValue);
  [v26 setText:v29];

  [v26 addTarget:self action:sel__setMaximum_ forControlEvents:0x40000];
  [v9 addSubview:v26];
  v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 20.0, 244.0, 120.0, 40.0);
  [v30 setAutoresizingMask:36];
  [v30 setText:@"Show Videos:"];
  [v9 addSubview:v30];
  __int16 v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1CD0]), "initWithFrame:", 140.0, 244.0, 50.0, 40.0);
  [v31 setAutoresizingMask:36];
  [v31 setOn:self->_showsVideos];
  [v31 addTarget:self action:sel__setShowsVideos_ forControlEvents:4096];
  [v9 addSubview:v31];
  [v34 bounds];
  objc_msgSend(v9, "setFrame:", 10.0, 10.0, v32 + -20.0, 300.0);
  [(PUCurationClassificationSignalAssetBrowserDebugViewController *)self setModalPresentationStyle:7];
  [(PUCurationClassificationSignalAssetBrowserDebugViewController *)self presentViewController:v35 animated:1 completion:0];
}

- (void)_update
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  signalConfidenceByAssetUUID = self->_signalConfidenceByAssetUUID;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __72__PUCurationClassificationSignalAssetBrowserDebugViewController__update__block_invoke;
  v24[3] = &unk_1E5F22D78;
  v24[4] = self;
  id v5 = v3;
  id v25 = v5;
  [(NSDictionary *)signalConfidenceByAssetUUID enumerateKeysAndObjectsUsingBlock:v24];
  id v6 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v7 = [v6 librarySpecificFetchOptions];

  if (!self->_showsVideos)
  {
    double v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"mediaType != %d", 2);
    [v7 setPredicate:v8];
  }
  uint64_t v9 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v5 options:v7];
  BOOL sortsAscending = self->_sortsAscending;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __72__PUCurationClassificationSignalAssetBrowserDebugViewController__update__block_invoke_2;
  v23[3] = &unk_1E5F22DC0;
  v23[4] = self;
  __int16 v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:sortsAscending comparator:v23];
  v27[0] = v11;
  double v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v27[1] = v12;
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];

  uint64_t v14 = [v9 fetchedObjects];
  id v15 = [v14 sortedArrayUsingDescriptors:v13];

  v16 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v15 title:self->_signalName];
  id v17 = (void *)MEMORY[0x1E4F39008];
  id v26 = v16;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  uint64_t v19 = [v16 localizedTitle];
  v20 = [v17 transientCollectionListWithCollections:v18 title:v19];

  id v21 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v20 options:0];
  [(PUPhotosAlbumViewController *)self setAssetCollection:v16 fetchResultContainingAssetCollection:v21 filterPredicate:0];
  id v22 = [(PUCurationClassificationSignalAssetBrowserDebugViewController *)self collectionView];
  [v22 reloadData];
}

void __72__PUCurationClassificationSignalAssetBrowserDebugViewController__update__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  [a3 doubleValue];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5 >= *(double *)(v6 + 1816) && v5 <= *(double *)(v6 + 1824)) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

uint64_t __72__PUCurationClassificationSignalAssetBrowserDebugViewController__update__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  double v5 = *(void **)(*(void *)(a1 + 32) + 1808);
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:a2];
  double v8 = [*(id *)(*(void *)(a1 + 32) + 1808) objectForKeyedSubscript:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (void)getTitle:(id *)a3 prompt:(id *)a4 shouldHideBackButton:(BOOL *)a5 leftBarButtonItems:(id *)a6 rightBarButtonItems:(id *)a7
{
  v16[1] = *MEMORY[0x1E4F143B8];
  double v13 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", @"PUTTR");
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithImage:v13 style:0 target:self action:sel__presentTapToRadar];
  v15.receiver = self;
  v15.super_class = (Class)PUCurationClassificationSignalAssetBrowserDebugViewController;
  [(PUPhotosGridViewController *)&v15 getTitle:a3 prompt:a4 shouldHideBackButton:a5 leftBarButtonItems:a6 rightBarButtonItems:a7];
  if (*a6)
  {
    [*a6 arrayByAddingObject:v14];
  }
  else
  {
    v16[0] = v14;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  }
  *a6 = (id)objc_claimAutoreleasedReturnValue();
}

- (id)newToolbarItems
{
  v7[3] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:2 target:self action:sel__editSettings_];
  v7[0] = v3;
  v7[1] = v4;
  v7[2] = v3;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

- (BOOL)shouldShowToolbar
{
  return 1;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PUCurationClassificationSignalAssetBrowserDebugViewController;
  [(PUPhotosAlbumViewController *)&v5 viewDidLoad];
  id v3 = [(PUCurationClassificationSignalAssetBrowserDebugViewController *)self navigationItem];
  [v3 setLeftItemsSupplementBackButton:1];

  [(PUCurationClassificationSignalAssetBrowserDebugViewController *)self setDefinesPresentationContext:1];
  uint64_t v4 = [(PUCurationClassificationSignalAssetBrowserDebugViewController *)self collectionView];
  [v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PUPhotoCell"];

  self->_minimumValue = 0.0;
  self->_maximumValue = 1.0;
  [(PUCurationClassificationSignalAssetBrowserDebugViewController *)self _update];
}

@end