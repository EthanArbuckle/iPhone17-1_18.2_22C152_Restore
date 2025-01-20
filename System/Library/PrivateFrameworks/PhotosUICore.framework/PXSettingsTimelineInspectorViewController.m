@interface PXSettingsTimelineInspectorViewController
- (BOOL)showFilteredContent;
- (CGSize)widgetSize;
- (NSArray)filteredContent;
- (NSArray)timeline;
- (NSDate)currentTime;
- (NSMutableDictionary)assetByAssetLocalIdentifier;
- (PXSettingsTimelineInspectorViewController)initWithWidgetSizeClass:(unint64_t)a3 timeline:(id)a4 dataSource:(id)a5;
- (PXTimelineEntry)entryInDisplay;
- (UIImageView)imageView;
- (UILabel)showFilteredContentLabel;
- (UILabel)sliderValueLabel;
- (UISlider)timeSlider;
- (UISwitch)showFilteredContentSwitch;
- (UITextView)entryInfoTextView;
- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (void)displayFilteredContentIndex:(unint64_t)a3;
- (void)displaySliderTime:(id)a3;
- (void)displayTimelineEntry:(id)a3;
- (void)handleTap:(id)a3;
- (void)setAssetByAssetLocalIdentifier:(id)a3;
- (void)setCurrentTime:(id)a3;
- (void)setEntryInDisplay:(id)a3;
- (void)setEntryInfoTextView:(id)a3;
- (void)setFilteredContent:(id)a3;
- (void)setImageView:(id)a3;
- (void)setShowFilteredContent:(BOOL)a3;
- (void)setShowFilteredContentLabel:(id)a3;
- (void)setShowFilteredContentSwitch:(id)a3;
- (void)setSliderValueLabel:(id)a3;
- (void)setTimeSlider:(id)a3;
- (void)setTimeline:(id)a3;
- (void)setWidgetSize:(CGSize)a3;
- (void)sliderValueChanged:(id)a3;
- (void)strokeRectFromCropRect:originalImageRect:targetImageRect:;
- (void)switchValueChanged:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PXSettingsTimelineInspectorViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetByAssetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_showFilteredContentSwitch, 0);
  objc_storeStrong((id *)&self->_showFilteredContentLabel, 0);
  objc_storeStrong((id *)&self->_timeSlider, 0);
  objc_storeStrong((id *)&self->_sliderValueLabel, 0);
  objc_storeStrong((id *)&self->_entryInfoTextView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_entryInDisplay, 0);
  objc_storeStrong((id *)&self->_filteredContent, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_storeStrong((id *)&self->_currentTime, 0);
}

- (void)setAssetByAssetLocalIdentifier:(id)a3
{
}

- (NSMutableDictionary)assetByAssetLocalIdentifier
{
  return self->_assetByAssetLocalIdentifier;
}

- (void)setWidgetSize:(CGSize)a3
{
  self->_widgetSize = a3;
}

- (CGSize)widgetSize
{
  double width = self->_widgetSize.width;
  double height = self->_widgetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setShowFilteredContent:(BOOL)a3
{
  self->_showFilteredContent = a3;
}

- (BOOL)showFilteredContent
{
  return self->_showFilteredContent;
}

- (void)setShowFilteredContentSwitch:(id)a3
{
}

- (UISwitch)showFilteredContentSwitch
{
  return self->_showFilteredContentSwitch;
}

- (void)setShowFilteredContentLabel:(id)a3
{
}

- (UILabel)showFilteredContentLabel
{
  return self->_showFilteredContentLabel;
}

- (void)setTimeSlider:(id)a3
{
}

- (UISlider)timeSlider
{
  return self->_timeSlider;
}

- (void)setSliderValueLabel:(id)a3
{
}

- (UILabel)sliderValueLabel
{
  return self->_sliderValueLabel;
}

- (void)setEntryInfoTextView:(id)a3
{
}

- (UITextView)entryInfoTextView
{
  return self->_entryInfoTextView;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setEntryInDisplay:(id)a3
{
}

- (PXTimelineEntry)entryInDisplay
{
  return self->_entryInDisplay;
}

- (void)setFilteredContent:(id)a3
{
}

- (NSArray)filteredContent
{
  return self->_filteredContent;
}

- (void)setTimeline:(id)a3
{
}

- (NSArray)timeline
{
  return self->_timeline;
}

- (void)setCurrentTime:(id)a3
{
}

- (NSDate)currentTime
{
  return self->_currentTime;
}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)PXSettingsTimelineInspectorViewController;
  v5 = -[UIViewController px_diagnosticsItemProvidersForPoint:inCoordinateSpace:](&v16, sel_px_diagnosticsItemProvidersForPoint_inCoordinateSpace_, a4, a3.x, a3.y);
  v6 = (void *)[v5 mutableCopy];

  v7 = [(PXSettingsTimelineInspectorViewController *)self assetByAssetLocalIdentifier];
  v8 = [(PXSettingsTimelineInspectorViewController *)self entryInDisplay];
  v9 = [v8 assetLocalIdentifier];
  v10 = [v7 objectForKeyedSubscript:v9];

  v11 = objc_alloc_init(PXDiagnosticsItemProvider);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __99__PXSettingsTimelineInspectorViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke;
  v14[3] = &unk_1E5DD2988;
  id v15 = v10;
  id v12 = v10;
  [(PXDiagnosticsItemProvider *)v11 registerItemForIdentifier:@"PXDiagnosticsItemIdentifierAsset" loadHandler:v14];
  [v6 addObject:v11];

  return v6;
}

id __99__PXSettingsTimelineInspectorViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  return 2;
}

- (void)handleTap:(id)a3
{
  id v26 = a3;
  v4 = [(PXSettingsTimelineInspectorViewController *)self imageView];
  [v26 locationInView:v4];
  double v6 = v5;

  v7 = [(PXSettingsTimelineInspectorViewController *)self imageView];
  [v7 frame];
  double v9 = v8;

  if ([(PXSettingsTimelineInspectorViewController *)self showFilteredContent]) {
    [(PXSettingsTimelineInspectorViewController *)self filteredContent];
  }
  else {
  v10 = [(PXSettingsTimelineInspectorViewController *)self timeline];
  }
  if ([v10 count])
  {
    unint64_t v11 = 0;
    unint64_t v12 = 0;
    do
    {
      v13 = [(PXSettingsTimelineInspectorViewController *)self entryInDisplay];
      v14 = [v10 objectAtIndex:v11];

      if (v13 == v14) {
        unint64_t v12 = v11;
      }
      ++v11;
    }
    while (v11 < [v10 count]);
  }
  else
  {
    unint64_t v12 = 0;
  }
  if (v6 > v9 * 0.5) {
    unint64_t v15 = v12 + 1;
  }
  else {
    unint64_t v15 = v12 - 1;
  }
  if (v15 < [v10 count])
  {
    objc_super v16 = [v10 objectAtIndex:v15];
    [(PXSettingsTimelineInspectorViewController *)self displayTimelineEntry:v16];
    if ([(PXSettingsTimelineInspectorViewController *)self showFilteredContent])
    {
      [(PXSettingsTimelineInspectorViewController *)self displayFilteredContentIndex:v15];
      float v17 = (float)v15;
      v18 = [(PXSettingsTimelineInspectorViewController *)self timeSlider];
      *(float *)&double v19 = v17;
      [v18 setValue:v19];
    }
    else
    {
      v20 = [v16 startTime];
      [(PXSettingsTimelineInspectorViewController *)self displaySliderTime:v20];

      v18 = [v16 startTime];
      v21 = [(PXSettingsTimelineInspectorViewController *)self currentTime];
      [v18 timeIntervalSinceDate:v21];
      float v23 = v22;
      v24 = [(PXSettingsTimelineInspectorViewController *)self timeSlider];
      *(float *)&double v25 = v23;
      [v24 setValue:v25];
    }
  }
}

- (void)switchValueChanged:(id)a3
{
  -[PXSettingsTimelineInspectorViewController setShowFilteredContent:](self, "setShowFilteredContent:", [a3 isOn]);
  v4 = [(PXSettingsTimelineInspectorViewController *)self timeSlider];
  [v4 setMinimumValue:0.0];

  double v5 = [(PXSettingsTimelineInspectorViewController *)self timeSlider];
  [v5 setValue:0.0];

  if ([(PXSettingsTimelineInspectorViewController *)self showFilteredContent])
  {
    double v6 = [(PXSettingsTimelineInspectorViewController *)self filteredContent];
    uint64_t v7 = [v6 count] - 1;

    double v8 = [(PXSettingsTimelineInspectorViewController *)self timeSlider];
    *(float *)&double v9 = (float)(unint64_t)v7;
    [v8 setMaximumValue:v9];

    v10 = [(PXSettingsTimelineInspectorViewController *)self filteredContent];
    id v21 = [v10 firstObject];

    [(PXSettingsTimelineInspectorViewController *)self displayFilteredContentIndex:0];
  }
  else
  {
    unint64_t v11 = [(PXSettingsTimelineInspectorViewController *)self timeline];
    unint64_t v12 = [v11 lastObject];
    v13 = [v12 endTime];
    v14 = [(PXSettingsTimelineInspectorViewController *)self currentTime];
    [v13 timeIntervalSinceDate:v14];
    float v16 = v15 + -1.0;
    float v17 = [(PXSettingsTimelineInspectorViewController *)self timeSlider];
    *(float *)&double v18 = v16;
    [v17 setMaximumValue:v18];

    double v19 = [(PXSettingsTimelineInspectorViewController *)self timeline];
    id v21 = [v19 firstObject];

    v20 = [(PXSettingsTimelineInspectorViewController *)self currentTime];
    [(PXSettingsTimelineInspectorViewController *)self displaySliderTime:v20];
  }
  [(PXSettingsTimelineInspectorViewController *)self displayTimelineEntry:v21];
}

- (void)sliderValueChanged:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PXSettingsTimelineInspectorViewController *)self showFilteredContent])
  {
    [v4 value];
    unint64_t v6 = (unint64_t)v5;
    uint64_t v7 = [(PXSettingsTimelineInspectorViewController *)self filteredContent];
    double v8 = [v7 objectAtIndex:v6];
    [(PXSettingsTimelineInspectorViewController *)self displayTimelineEntry:v8];

    [(PXSettingsTimelineInspectorViewController *)self displayFilteredContentIndex:v6];
  }
  else
  {
    double v9 = [(PXSettingsTimelineInspectorViewController *)self currentTime];
    id v21 = v4;
    [v4 value];
    unint64_t v11 = [v9 dateByAddingTimeInterval:v10];

    [(PXSettingsTimelineInspectorViewController *)self displaySliderTime:v11];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    unint64_t v12 = [(PXSettingsTimelineInspectorViewController *)self timeline];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          float v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          double v18 = [v17 startTime];
          double v19 = [v17 endTime];
          int v20 = objc_msgSend(v11, "px_isBetweenDate:andDate:", v18, v19);

          if (v20)
          {
            [(PXSettingsTimelineInspectorViewController *)self displayTimelineEntry:v17];
            goto LABEL_13;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    id v4 = v21;
  }
}

- (void)displayFilteredContentIndex:(unint64_t)a3
{
  id v4 = NSString;
  unint64_t v5 = a3 + 1;
  id v8 = [(PXSettingsTimelineInspectorViewController *)self filteredContent];
  unint64_t v6 = objc_msgSend(v4, "stringWithFormat:", @"%lu of %lu", v5, objc_msgSend(v8, "count"));
  uint64_t v7 = [(PXSettingsTimelineInspectorViewController *)self sliderValueLabel];
  [v7 setText:v6];
}

- (void)displaySliderTime:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28C10];
  id v5 = a3;
  id v10 = objc_alloc_init(v4);
  [v10 setDateFormat:@"yyyy-MM-dd HH:mm"];
  unint64_t v6 = NSString;
  uint64_t v7 = [v10 stringFromDate:v5];

  id v8 = [v6 stringWithFormat:@"%@ (Local Time)", v7];
  double v9 = [(PXSettingsTimelineInspectorViewController *)self sliderValueLabel];
  [v9 setText:v8];
}

- (void)strokeRectFromCropRect:originalImageRect:targetImageRect:
{
}

- (void)displayTimelineEntry:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PXSettingsTimelineInspectorViewController *)self entryInDisplay];

  if (v5 != v4)
  {
    [(PXSettingsTimelineInspectorViewController *)self setEntryInDisplay:v4];
    unint64_t v6 = [NSString stringWithFormat:@"%@", v4];
    uint64_t v7 = [(PXSettingsTimelineInspectorViewController *)self entryInfoTextView];
    [v7 setText:v6];

    id v8 = [v4 assetLocalIdentifier];
    if (![v8 length])
    {
      id v10 = PLMemoriesGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v4;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "[TimelineInspector] TimelineEntry has nil assetLocalIdentifier: %@", buf, 0xCu);
      }
      goto LABEL_10;
    }
    double v9 = [(PXSettingsTimelineInspectorViewController *)self assetByAssetLocalIdentifier];
    id v10 = [v9 objectForKeyedSubscript:v8];

    if (!v10)
    {
      unint64_t v11 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
      id v10 = [v11 librarySpecificFetchOptions];

      uint64_t v28 = *MEMORY[0x1E4F394E0];
      unint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
      [v10 setFetchPropertySets:v12];

      uint64_t v13 = (void *)MEMORY[0x1E4F38EB8];
      uint64_t v27 = v8;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
      uint64_t v15 = [v13 fetchAssetsWithLocalIdentifiers:v14 options:v10];
      uint64_t v16 = [v15 firstObject];

      if (!v16)
      {
        long long v22 = PLMemoriesGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v4;
          _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_ERROR, "[TimelineInspector] key asset is nil for entry: %@", buf, 0xCu);
        }
        goto LABEL_7;
      }
      float v17 = [(PXSettingsTimelineInspectorViewController *)self assetByAssetLocalIdentifier];
      [v17 setObject:v16 forKeyedSubscript:v8];

      id v10 = v16;
    }
    [(PXSettingsTimelineInspectorViewController *)self widgetSize];
    double v19 = v18 + v18;
    [(PXSettingsTimelineInspectorViewController *)self widgetSize];
    double v21 = v20 + v20;
    long long v22 = objc_alloc_init(MEMORY[0x1E4F390D8]);
    [v22 setDeliveryMode:1];
    [v22 setResizeMode:1];
    long long v23 = [MEMORY[0x1E4F390D0] defaultManager];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __66__PXSettingsTimelineInspectorViewController_displayTimelineEntry___block_invoke;
    v24[3] = &unk_1E5DCBF98;
    id v25 = v4;
    id v26 = self;
    objc_msgSend(v23, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v10, 0, v22, v24, v19, v21);

LABEL_7:
LABEL_10:
  }
}

void __66__PXSettingsTimelineInspectorViewController_displayTimelineEntry___block_invoke(uint64_t a1, void *a2)
{
  id v43 = a2;
  v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) entryInDisplay];

  if (v3 == v4)
  {
    unint64_t v6 = [*(id *)(a1 + 40) assetByAssetLocalIdentifier];
    uint64_t v7 = [*(id *)(a1 + 40) entryInDisplay];
    id v8 = [v7 assetLocalIdentifier];
    double v9 = [v6 objectForKeyedSubscript:v8];

    double v10 = (double)(unint64_t)[v9 pixelWidth];
    double v11 = (double)(unint64_t)[v9 pixelHeight];
    [v43 size];
    uint64_t v13 = v12;
    [v43 size];
    uint64_t v15 = v14;
    uint64_t v16 = [*(id *)(a1 + 32) suggestedCrop];

    if (!v16)
    {
      [*(id *)(a1 + 40) widgetSize];
      float v17 = +[PXTimelineCrop cropForAsset:withTargetSize:](PXTimelineCrop, "cropForAsset:withTargetSize:", v9);
      [*(id *)(a1 + 32) setSuggestedCrop:v17];
    }
    double v18 = [*(id *)(a1 + 32) suggestedCrop];
    [v18 cropRect];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;

    objc_msgSend(*(id *)(a1 + 40), "strokeRectFromCropRect:originalImageRect:targetImageRect:", v20, v22, v24, v26, 0.0, 0.0, v10, v11, 0, 0, v13, v15);
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    v35 = NSString;
    [*(id *)(a1 + 40) widgetSize];
    v36 = NSStringFromCGSize(v45);
    v37 = [*(id *)(a1 + 32) suggestedCrop];
    [v37 cropScore];
    v39 = [v35 stringWithFormat:@"%@ %.4f", v36, v38];

    v40 = [MEMORY[0x1E4FB1618] systemGreenColor];
    uint64_t v41 = objc_msgSend(v43, "px_debugImageWithStrokeRect:color:text:", v40, v39, v28, v30, v32, v34);

    v42 = [*(id *)(a1 + 40) imageView];
    [v42 setImage:v41];

    id v5 = (void *)v41;
  }
  else
  {
    id v5 = v43;
  }
}

- (void)viewWillLayoutSubviews
{
  v70.receiver = self;
  v70.super_class = (Class)PXSettingsTimelineInspectorViewController;
  [(PXSettingsTimelineInspectorViewController *)&v70 viewWillLayoutSubviews];
  v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v4 = [v3 windows];
  id v5 = [v4 firstObject];

  unint64_t v6 = [v5 windowScene];
  uint64_t v7 = [v6 statusBarManager];
  [v7 statusBarFrame];
  double v9 = v8;

  double v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;

  [v5 safeAreaInsets];
  double v16 = v9 + v15;
  [v5 safeAreaInsets];
  double v18 = v17;
  double v19 = [(PXSettingsTimelineInspectorViewController *)self imageView];
  objc_msgSend(v19, "setFrame:", 0.0, v16, v12, v12);

  double v20 = [(PXSettingsTimelineInspectorViewController *)self timeSlider];
  objc_msgSend(v20, "setFrame:", 0.0, 0.0, v12 + -60.0, 35.0);

  double v21 = v12 * 0.5;
  double v22 = [(PXSettingsTimelineInspectorViewController *)self timeSlider];
  [v22 frame];
  double v24 = v14 - v18 - v23;
  double v25 = [(PXSettingsTimelineInspectorViewController *)self timeSlider];
  objc_msgSend(v25, "setCenter:", v21, v24);

  double v26 = [(PXSettingsTimelineInspectorViewController *)self timeSlider];
  [v26 frame];
  double v28 = v27;
  double v29 = [(PXSettingsTimelineInspectorViewController *)self sliderValueLabel];
  objc_msgSend(v29, "setFrame:", 0.0, 0.0, v28, 30.0);

  double v30 = [(PXSettingsTimelineInspectorViewController *)self timeSlider];
  [v30 center];
  double v32 = v31;
  double v33 = [(PXSettingsTimelineInspectorViewController *)self timeSlider];
  [v33 frame];
  double MinY = CGRectGetMinY(v71);
  v35 = [(PXSettingsTimelineInspectorViewController *)self sliderValueLabel];
  [v35 frame];
  double v37 = MinY - v36 * 0.5 + -20.0;
  uint64_t v38 = [(PXSettingsTimelineInspectorViewController *)self sliderValueLabel];
  objc_msgSend(v38, "setCenter:", v32, v37);

  v39 = [(PXSettingsTimelineInspectorViewController *)self sliderValueLabel];
  [v39 frame];
  double v40 = CGRectGetMinY(v72);
  uint64_t v41 = [(PXSettingsTimelineInspectorViewController *)self sliderValueLabel];
  [v41 frame];
  double v43 = v40 - v42 + -5.0;

  v44 = [(PXSettingsTimelineInspectorViewController *)self sliderValueLabel];
  [v44 frame];
  double MinX = CGRectGetMinX(v73);
  v46 = [(PXSettingsTimelineInspectorViewController *)self sliderValueLabel];
  [v46 frame];
  double v48 = v47 * 3.0 * 0.25;
  v49 = [(PXSettingsTimelineInspectorViewController *)self showFilteredContentLabel];
  objc_msgSend(v49, "setFrame:", MinX, v43, v48, 30.0);

  v50 = [(PXSettingsTimelineInspectorViewController *)self showFilteredContentLabel];
  [v50 frame];
  double MaxX = CGRectGetMaxX(v74);
  v52 = [(PXSettingsTimelineInspectorViewController *)self sliderValueLabel];
  [v52 frame];
  double v54 = v53 * 0.25;
  v55 = [(PXSettingsTimelineInspectorViewController *)self showFilteredContentSwitch];
  objc_msgSend(v55, "setFrame:", MaxX, v43, v54, 30.0);

  v56 = [(PXSettingsTimelineInspectorViewController *)self showFilteredContentLabel];
  [v56 frame];
  double v57 = CGRectGetMinY(v75);
  v58 = [(PXSettingsTimelineInspectorViewController *)self imageView];
  [v58 frame];
  double v59 = v57 - CGRectGetMaxY(v76) + -10.0;

  v60 = [(PXSettingsTimelineInspectorViewController *)self sliderValueLabel];
  [v60 frame];
  double v62 = v61;
  v63 = [(PXSettingsTimelineInspectorViewController *)self entryInfoTextView];
  objc_msgSend(v63, "setFrame:", 0.0, 0.0, v62, v59);

  v64 = [(PXSettingsTimelineInspectorViewController *)self sliderValueLabel];
  [v64 center];
  double v66 = v65;
  v67 = [(PXSettingsTimelineInspectorViewController *)self showFilteredContentLabel];
  [v67 frame];
  CGFloat v68 = CGRectGetMinY(v77) - v59 * 0.5 + -10.0;
  v69 = [(PXSettingsTimelineInspectorViewController *)self entryInfoTextView];
  objc_msgSend(v69, "setCenter:", v66, v68);
}

- (void)viewDidLoad
{
  v63.receiver = self;
  v63.super_class = (Class)PXSettingsTimelineInspectorViewController;
  [(PXSettingsTimelineInspectorViewController *)&v63 viewDidLoad];
  v3 = [(PXSettingsTimelineInspectorViewController *)self navigationController];
  [v3 setDelegate:self];

  id v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  id v5 = [(PXSettingsTimelineInspectorViewController *)self view];
  [v5 setBackgroundColor:v4];

  unint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  [(PXSettingsTimelineInspectorViewController *)self setCurrentTime:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(PXSettingsTimelineInspectorViewController *)self setAssetByAssetLocalIdentifier:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  [(PXSettingsTimelineInspectorViewController *)self setImageView:v8];

  double v9 = [(PXSettingsTimelineInspectorViewController *)self imageView];
  [v9 setContentMode:1];

  double v10 = [(PXSettingsTimelineInspectorViewController *)self imageView];
  [v10 setUserInteractionEnabled:1];

  double v11 = [(PXSettingsTimelineInspectorViewController *)self view];
  double v12 = [(PXSettingsTimelineInspectorViewController *)self imageView];
  [v11 addSubview:v12];

  double v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_handleTap_];
  double v14 = [(PXSettingsTimelineInspectorViewController *)self imageView];
  [v14 addGestureRecognizer:v13];

  id v15 = objc_alloc_init(MEMORY[0x1E4FB1DD8]);
  [(PXSettingsTimelineInspectorViewController *)self setEntryInfoTextView:v15];

  double v16 = [(PXSettingsTimelineInspectorViewController *)self entryInfoTextView];
  [v16 setTextAlignment:0];

  double v17 = [(PXSettingsTimelineInspectorViewController *)self entryInfoTextView];
  [v17 setEditable:0];

  double v18 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  double v19 = [(PXSettingsTimelineInspectorViewController *)self entryInfoTextView];
  [v19 setFont:v18];

  double v20 = [MEMORY[0x1E4FB1618] labelColor];
  double v21 = [(PXSettingsTimelineInspectorViewController *)self entryInfoTextView];
  [v21 setTextColor:v20];

  double v22 = [(PXSettingsTimelineInspectorViewController *)self view];
  double v23 = [(PXSettingsTimelineInspectorViewController *)self entryInfoTextView];
  [v22 addSubview:v23];

  id v24 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(PXSettingsTimelineInspectorViewController *)self setSliderValueLabel:v24];

  double v25 = [(PXSettingsTimelineInspectorViewController *)self sliderValueLabel];
  [v25 setTextAlignment:1];

  double v26 = [(PXSettingsTimelineInspectorViewController *)self view];
  double v27 = [(PXSettingsTimelineInspectorViewController *)self sliderValueLabel];
  [v26 addSubview:v27];

  id v28 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(PXSettingsTimelineInspectorViewController *)self setShowFilteredContentLabel:v28];

  double v29 = [(PXSettingsTimelineInspectorViewController *)self showFilteredContentLabel];
  [v29 setTextAlignment:1];

  double v30 = [(PXSettingsTimelineInspectorViewController *)self filteredContent];
  BOOL v31 = [v30 count] != 0;
  double v32 = [(PXSettingsTimelineInspectorViewController *)self showFilteredContentLabel];
  [v32 setEnabled:v31];

  double v33 = [(PXSettingsTimelineInspectorViewController *)self showFilteredContentLabel];
  if ([v33 isEnabled]) {
    double v34 = @"Show Filtered Content";
  }
  else {
    double v34 = @"No Filtered Content";
  }
  v35 = [(PXSettingsTimelineInspectorViewController *)self showFilteredContentLabel];
  [v35 setText:v34];

  double v36 = [(PXSettingsTimelineInspectorViewController *)self view];
  double v37 = [(PXSettingsTimelineInspectorViewController *)self showFilteredContentLabel];
  [v36 addSubview:v37];

  id v38 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
  [(PXSettingsTimelineInspectorViewController *)self setShowFilteredContentSwitch:v38];

  v39 = [(PXSettingsTimelineInspectorViewController *)self showFilteredContentSwitch];
  [v39 setOn:0];

  double v40 = [(PXSettingsTimelineInspectorViewController *)self filteredContent];
  BOOL v41 = [v40 count] != 0;
  double v42 = [(PXSettingsTimelineInspectorViewController *)self showFilteredContentSwitch];
  [v42 setEnabled:v41];

  double v43 = [(PXSettingsTimelineInspectorViewController *)self showFilteredContentSwitch];
  [v43 addTarget:self action:sel_switchValueChanged_ forControlEvents:4096];

  v44 = [(PXSettingsTimelineInspectorViewController *)self view];
  CGSize v45 = [(PXSettingsTimelineInspectorViewController *)self showFilteredContentSwitch];
  [v44 addSubview:v45];

  id v46 = objc_alloc_init(MEMORY[0x1E4FB1C38]);
  [(PXSettingsTimelineInspectorViewController *)self setTimeSlider:v46];

  double v47 = [(PXSettingsTimelineInspectorViewController *)self timeSlider];
  [v47 addTarget:self action:sel_sliderValueChanged_ forControlEvents:4096];

  double v48 = [(PXSettingsTimelineInspectorViewController *)self timeSlider];
  [v48 setMinimumValue:0.0];

  v49 = [(PXSettingsTimelineInspectorViewController *)self timeline];
  v50 = [v49 lastObject];
  v51 = [v50 endTime];
  v52 = [(PXSettingsTimelineInspectorViewController *)self currentTime];
  [v51 timeIntervalSinceDate:v52];
  float v54 = v53 + -1.0;
  v55 = [(PXSettingsTimelineInspectorViewController *)self timeSlider];
  *(float *)&double v56 = v54;
  [v55 setMaximumValue:v56];

  double v57 = [(PXSettingsTimelineInspectorViewController *)self timeSlider];
  [v57 setValue:0.0];

  v58 = [(PXSettingsTimelineInspectorViewController *)self view];
  double v59 = [(PXSettingsTimelineInspectorViewController *)self timeSlider];
  [v58 addSubview:v59];

  v60 = [(PXSettingsTimelineInspectorViewController *)self timeline];
  double v61 = [v60 firstObject];
  [(PXSettingsTimelineInspectorViewController *)self displayTimelineEntry:v61];

  double v62 = [(PXSettingsTimelineInspectorViewController *)self currentTime];
  [(PXSettingsTimelineInspectorViewController *)self displaySliderTime:v62];
}

- (PXSettingsTimelineInspectorViewController)initWithWidgetSizeClass:(unint64_t)a3 timeline:(id)a4 dataSource:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PXSettingsTimelineInspectorViewController;
  double v11 = [(PXSettingsTimelineInspectorViewController *)&v19 init];
  double v12 = v11;
  if (v11)
  {
    p_widgetSize = &v11->_widgetSize;
    +[PXTimelineSize widgetSizeForSizeClass:a3];
    *(void *)&p_widgetSize->double width = v14;
    v12->_widgetSize.double height = v15;
    objc_storeStrong((id *)&v12->_timeline, a4);
    uint64_t v16 = [v10 filteredContent];
    filteredContent = v12->_filteredContent;
    v12->_filteredContent = (NSArray *)v16;
  }
  return v12;
}

@end