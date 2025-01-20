@interface PBFPosterGalleryPreviewComplicationContentView
- (BOOL)_hasComplications;
- (BOOL)_isComplicationSnapshotRequestOurs:(id)a3;
- (BOOL)isIconViewRecycled:(id)a3;
- (BOOL)preferredCornerRadius;
- (CGRect)_scaledFrameForElements:(unint64_t)a3;
- (PBFPosterGalleryPreviewComplicationContentView)initWithFrame:(CGRect)a3;
- (PBFPosterPreview)posterPreview;
- (double)_contentScaleForWidgetGridViewController;
- (double)_cornerRadiusForComplicationSnapshotRequest:(id)a3;
- (double)posterPreviewScale;
- (id)_imageViewForComplication:(id)a3 snapshotRequest:(id)a4;
- (id)_layoutController;
- (id)_placeImageViewForSubtitleComplication:(id)a3 withSuperview:(id)a4 snapshotRequest:(id)a5;
- (id)customImageViewControllerForIconView:(id)a3;
- (id)dequeueReusableIconViewOfClass:(Class)a3;
- (id)pbf_displayContext;
- (int64_t)layoutOrientation;
- (void)_enumerateImageViewsForComplicationSnapshotRequest:(id)a3 usingBlock:(id)a4;
- (void)_stopUsingComplicationImageView:(id)a3;
- (void)_updatePreviewWithComplicationImage:(id)a3 error:(id)a4 complicationSnapshotRequest:(id)a5 posterPreview:(id)a6;
- (void)configureIconView:(id)a3 forIcon:(id)a4;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)prepareComplicationPreviewWithGenerator:(id)a3;
- (void)prepareForReuse;
- (void)setComplicationImage:(id)a3 forComplicationSnapshotRequest:(id)a4;
- (void)setLayoutOrientation:(int64_t)a3;
- (void)setPosterPreview:(id)a3;
- (void)setPosterPreviewScale:(double)a3;
- (void)setPreferredCornerRadius:(BOOL)a3;
@end

@implementation PBFPosterGalleryPreviewComplicationContentView

- (PBFPosterGalleryPreviewComplicationContentView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PBFPosterGalleryPreviewComplicationContentView;
  v3 = -[PBFPosterGalleryPreviewComplicationContentView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    inlineComplicationContainerView = v3->_inlineComplicationContainerView;
    v3->_inlineComplicationContainerView = v4;

    id v6 = objc_alloc(MEMORY[0x1E4F92718]);
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
    v8 = (void *)[v6 initWithComplicationDescriptors:MEMORY[0x1E4F1CBF0] iconLayout:0 type:0];
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F92728]) initWithModel:v8 iconViewProvider:v3];
    widgetGridViewController = v3->_widgetGridViewController;
    v3->_widgetGridViewController = (PRWidgetGridViewController *)v9;

    v11 = (void *)[objc_alloc(MEMORY[0x1E4F92718]) initWithComplicationDescriptors:v7 iconLayout:0 type:1];
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F92728]) initWithModel:v11 iconViewProvider:v3];
    sidebarWidgetGridViewController = v3->_sidebarWidgetGridViewController;
    v3->_sidebarWidgetGridViewController = (PRWidgetGridViewController *)v12;
  }
  return v3;
}

- (void)dealloc
{
  [(PRWidgetGridViewController *)self->_widgetGridViewController invalidate];
  [(PRWidgetGridViewController *)self->_sidebarWidgetGridViewController invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PBFPosterGalleryPreviewComplicationContentView;
  [(PBFPosterGalleryPreviewComplicationContentView *)&v3 dealloc];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)PBFPosterGalleryPreviewComplicationContentView;
  [(PBFPosterGalleryPreviewComplicationContentView *)&v4 didMoveToWindow];
  id v3 = [(PBFPosterGalleryPreviewComplicationContentView *)self _layoutController];
  [(PBFPosterGalleryPreviewComplicationContentView *)self setNeedsLayout];
}

- (id)pbf_displayContext
{
  v6.receiver = self;
  v6.super_class = (Class)PBFPosterGalleryPreviewComplicationContentView;
  id v3 = [(UIView *)&v6 pbf_displayContext];
  objc_super v4 = objc_msgSend(v3, "displayContextWithUpdatedInterfaceOrientation:", -[PBFPosterGalleryPreviewComplicationContentView layoutOrientation](self, "layoutOrientation"));

  return v4;
}

- (void)setLayoutOrientation:(int64_t)a3
{
  if (self->_layoutOrientation != a3)
  {
    if (BSInterfaceOrientationIsLandscape())
    {
      v5 = [(PRWidgetGridViewController *)self->_widgetGridViewController view];
      [v5 removeFromSuperview];

      objc_super v6 = [(BSUIVibrancyEffectView *)self->_vibrancyEffectView contentView];
      uint64_t v7 = [(PRWidgetGridViewController *)self->_sidebarWidgetGridViewController view];
      [v6 addSubview:v7];
    }
    else
    {
      v8 = [(BSUIVibrancyEffectView *)self->_vibrancyEffectView contentView];
      uint64_t v9 = [(PRWidgetGridViewController *)self->_widgetGridViewController view];
      [v8 addSubview:v9];

      objc_super v6 = [(PRWidgetGridViewController *)self->_sidebarWidgetGridViewController view];
      [v6 removeFromSuperview];
    }

    layoutController = self->_layoutController;
    self->_layoutController = 0;

    self->_layoutOrientation = a3;
    [(PBFPosterGalleryPreviewComplicationContentView *)self invalidateIntrinsicContentSize];
    [(PBFPosterGalleryPreviewComplicationContentView *)self setNeedsLayout];
  }
}

- (void)setPosterPreview:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v5 = (PBFPosterPreview *)a3;
  if (self->_posterPreview != v5)
  {
    [(PBFPosterGalleryPreviewComplicationContentView *)self prepareForReuse];
    [(PBFPosterGalleryPreviewComplicationContentView *)self setContentMode:3];
    objc_storeStrong((id *)&self->_posterPreview, a3);
    uint64_t v6 = [(PBFPosterPreview *)v5 subtitleComplication];
    if (v6)
    {
      uint64_t v7 = +[PBFComplicationSnapshotRequest requestForComplicationLookupInfo:v6];
      inlineComplicationSnapshotRequest = self->_inlineComplicationSnapshotRequest;
      self->_inlineComplicationSnapshotRequest = v7;

      id v9 = [(PBFPosterGalleryPreviewComplicationContentView *)self _placeImageViewForSubtitleComplication:v6 withSuperview:self->_inlineComplicationContainerView snapshotRequest:self->_inlineComplicationSnapshotRequest];
    }
    v51 = (void *)v6;
    v10 = [(PBFPosterPreview *)v5 suggestedComplications];
    v11 = objc_msgSend(v10, "bs_mapNoNulls:", &__block_literal_global_15);

    p_widgetGridViewController = &self->_widgetGridViewController;
    uint64_t v12 = [(PRWidgetGridViewController *)self->_widgetGridViewController model];
    [v12 setComplicationDescriptors:v11 iconLayout:0];

    v52 = v5;
    v13 = [(PBFPosterPreview *)v5 suggestedLandscapeComplications];
    uint64_t v14 = objc_msgSend(v13, "bs_mapNoNulls:", &__block_literal_global_15);

    p_sidebarWidgetGridViewController = &self->_sidebarWidgetGridViewController;
    objc_super v15 = [(PRWidgetGridViewController *)self->_sidebarWidgetGridViewController model];
    [v15 setComplicationDescriptors:v14 iconLayout:0];

    v49 = (void *)v14;
    v50 = v11;
    v16 = [v11 arrayByAddingObjectsFromArray:v14];
    id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    iconImageViewsByUniqueIdentifier = self->_iconImageViewsByUniqueIdentifier;
    v54 = self;
    self->_iconImageViewsByUniqueIdentifier = v17;

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = v16;
    uint64_t v19 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v57 != v21) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          v24 = [v23 widget];
          v25 = [MEMORY[0x1E4F92730] sharedInstance];
          v26 = [v25 systemMetricsForWidget:v24];

          v27 = [[PBFComplicationSnapshotRequest alloc] initWithWidget:v24 metrics:v26];
          [v55 addObject:v27];
          v28 = [(PBFPosterGalleryPreviewComplicationContentView *)v54 _imageViewForComplication:v23 snapshotRequest:v27];
          v29 = v54->_iconImageViewsByUniqueIdentifier;
          v30 = [v23 uniqueIdentifier];
          [(NSMutableDictionary *)v29 setObject:v28 forKeyedSubscript:v30];
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
      }
      while (v20);
    }

    uint64_t v31 = [v55 copy];
    modularComplicationSnapshotRequests = v54->_modularComplicationSnapshotRequests;
    v54->_modularComplicationSnapshotRequests = (NSArray *)v31;

    if (!v54->_vibrancyEffectView
      && [(PBFPosterGalleryPreviewComplicationContentView *)v54 _hasComplications])
    {
      id v33 = objc_alloc(MEMORY[0x1E4F4F8F0]);
      [(PBFPosterGalleryPreviewComplicationContentView *)v54 bounds];
      uint64_t v34 = objc_msgSend(v33, "initWithFrame:");
      vibrancyEffectView = v54->_vibrancyEffectView;
      v54->_vibrancyEffectView = (BSUIVibrancyEffectView *)v34;

      [(PBFPosterGalleryPreviewComplicationContentView *)v54 addSubview:v54->_vibrancyEffectView];
    }
    v36 = [(BSUIVibrancyEffectView *)v54->_vibrancyEffectView contentView];
    [v36 addSubview:v54->_inlineComplicationContainerView];

    LODWORD(v36) = BSInterfaceOrientationIsLandscape();
    v37 = [(BSUIVibrancyEffectView *)v54->_vibrancyEffectView contentView];
    v38 = (id *)p_widgetGridViewController;
    if (v36) {
      v38 = (id *)p_sidebarWidgetGridViewController;
    }
    v39 = [*v38 view];
    [v37 addSubview:v39];

    v5 = v52;
    if ([(NSArray *)v54->_modularComplicationSnapshotRequests count] || v54->_inlineComplicationSnapshotRequest)
    {
      v40 = [(PBFPosterPreview *)v52 posterDescriptorLookupInfo];
      v41 = [v40 posterDescriptorExtension];
      v42 = [v41 posterExtensionBundle];

      v43 = v54->_vibrancyEffectView;
      v44 = [(PBFPosterPreview *)v52 titleStyleConfiguration];
      v45 = [v44 vibrancyConfigurationWithExtensionBundle:v42];
      [(BSUIVibrancyEffectView *)v43 setConfiguration:v45];

      [(BSUIVibrancyEffectView *)v54->_vibrancyEffectView setHidden:0];
    }
    else
    {
      [(BSUIVibrancyEffectView *)v54->_vibrancyEffectView setHidden:1];
    }
    [(PBFPosterGalleryPreviewComplicationContentView *)v54 setNeedsLayout];
    v46 = [(PBFPosterGalleryPreviewComplicationContentView *)v54 window];

    if (v46) {
      [(PBFPosterGalleryPreviewComplicationContentView *)v54 layoutIfNeeded];
    }
  }
}

id __67__PBFPosterGalleryPreviewComplicationContentView_setPosterPreview___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F58CC0];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 complicationExtensionBundleIdentifier];
  uint64_t v6 = [v3 complicationContainingBundleIdentifier];
  uint64_t v7 = (void *)[v4 initWithExtensionBundleIdentifier:v5 containerBundleIdentifier:v6 deviceIdentifier:0];

  id v8 = objc_alloc(MEMORY[0x1E4F58DD8]);
  id v9 = [v3 complicationWidgetKind];
  v10 = [v3 complicationWidgetFamily];
  uint64_t v11 = [v10 unsignedIntegerValue];
  uint64_t v12 = [v3 complicationIntent];

  v13 = (void *)[v8 initWithExtensionIdentity:v7 kind:v9 family:v11 intent:v12 activityIdentifier:0];
  id v14 = objc_alloc(MEMORY[0x1E4F92560]);
  objc_super v15 = [MEMORY[0x1E4F29128] UUID];
  v16 = [v15 UUIDString];
  v17 = (void *)[v14 initWithUniqueIdentifier:v16 widget:v13];

  return v17;
}

- (void)prepareForReuse
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = (void *)[(NSMutableArray *)self->_complicationImageViews copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        [(PBFPosterGalleryPreviewComplicationContentView *)self _stopUsingComplicationImageView:*(void *)(*((void *)&v16 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  id v8 = [(PRWidgetGridViewController *)self->_widgetGridViewController model];
  uint64_t v9 = MEMORY[0x1E4F1CBF0];
  [v8 setComplicationDescriptors:MEMORY[0x1E4F1CBF0] iconLayout:0];

  v10 = [(PRWidgetGridViewController *)self->_sidebarWidgetGridViewController model];
  [v10 setComplicationDescriptors:v9 iconLayout:0];

  iconImageViewsByUniqueIdentifier = self->_iconImageViewsByUniqueIdentifier;
  self->_iconImageViewsByUniqueIdentifier = 0;

  imageViewsForComplicationSnapshotRequest = self->_imageViewsForComplicationSnapshotRequest;
  self->_imageViewsForComplicationSnapshotRequest = 0;

  imageViewForComplication = self->_imageViewForComplication;
  self->_imageViewForComplication = 0;

  modularComplicationSnapshotRequests = self->_modularComplicationSnapshotRequests;
  self->_modularComplicationSnapshotRequests = 0;

  inlineComplicationSnapshotRequest = self->_inlineComplicationSnapshotRequest;
  self->_inlineComplicationSnapshotRequest = 0;
}

- (void)setComplicationImage:(id)a3 forComplicationSnapshotRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PBFPosterGalleryPreviewComplicationContentView *)self _isComplicationSnapshotRequestOurs:v7])
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __102__PBFPosterGalleryPreviewComplicationContentView_setComplicationImage_forComplicationSnapshotRequest___block_invoke;
    uint64_t v12 = &unk_1E6982E10;
    id v13 = v6;
    id v14 = self;
    [(PBFPosterGalleryPreviewComplicationContentView *)self _enumerateImageViewsForComplicationSnapshotRequest:v7 usingBlock:&v9];
    -[NSMapTable removeObjectForKey:](self->_imageViewsForComplicationSnapshotRequest, "removeObjectForKey:", v7, v9, v10, v11, v12);
    [(PBFPosterGalleryPreviewComplicationContentView *)self setNeedsLayout];
    id v8 = [(PBFPosterGalleryPreviewComplicationContentView *)self window];

    if (v8) {
      [(PBFPosterGalleryPreviewComplicationContentView *)self layoutIfNeeded];
    }
  }
}

uint64_t __102__PBFPosterGalleryPreviewComplicationContentView_setComplicationImage_forComplicationSnapshotRequest___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32)) {
    return objc_msgSend(a2, "setImage:");
  }
  else {
    return [*(id *)(a1 + 40) _stopUsingComplicationImageView:a2];
  }
}

- (void)layoutSubviews
{
  v54.receiver = self;
  v54.super_class = (Class)PBFPosterGalleryPreviewComplicationContentView;
  [(PBFPosterGalleryPreviewComplicationContentView *)&v54 layoutSubviews];
  widgetGridViewController = self->_widgetGridViewController;
  [(PBFPosterGalleryPreviewComplicationContentView *)self _contentScaleForWidgetGridViewController];
  -[PRWidgetGridViewController setIconContentScale:](widgetGridViewController, "setIconContentScale:");
  [(PBFPosterGalleryPreviewComplicationContentView *)self _scaledFrameForElements:8];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(PRWidgetGridViewController *)self->_widgetGridViewController view];
  double v53 = v9;
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  sidebarWidgetGridViewController = self->_sidebarWidgetGridViewController;
  [(PBFPosterGalleryPreviewComplicationContentView *)self _contentScaleForWidgetGridViewController];
  -[PRWidgetGridViewController setIconContentScale:](sidebarWidgetGridViewController, "setIconContentScale:");
  [(PBFPosterGalleryPreviewComplicationContentView *)self _scaledFrameForElements:16];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = [(PRWidgetGridViewController *)self->_sidebarWidgetGridViewController view];
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  v23 = [(PBFPosterGalleryPreviewComplicationContentView *)self posterPreview];
  v24 = [v23 subtitleComplication];
  [(PBFPosterGalleryPreviewComplicationContentView *)self bounds];
  double v27 = v25;
  double v28 = v26;
  double v51 = v30;
  double v52 = v29;
  if (v24)
  {
    double v48 = v26;
    double v49 = v25;
    double v50 = v5;
    uint64_t v31 = [(NSMapTable *)self->_imageViewForComplication objectForKey:v24];
    [(PBFPosterGalleryPreviewComplicationContentView *)self _scaledFrameForElements:4];
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    objc_msgSend(v31, "setFrame:");
    v55.origin.x = v33;
    v55.origin.y = v35;
    v55.size.width = v37;
    v55.size.height = v39;
    double MaxY = 0.0;
    if (CGRectGetMaxY(v55) > 0.0)
    {
      v56.origin.x = v33;
      v56.origin.y = v35;
      v56.size.width = v37;
      v56.size.height = v39;
      double MaxY = CGRectGetMaxY(v56);
    }
    v57.origin.x = v33;
    v57.origin.y = v35;
    v57.size.width = v37;
    v57.size.height = v39;
    double MinY = 1.79769313e308;
    if (CGRectGetMinY(v57) < 1.79769313e308)
    {
      v58.origin.x = v33;
      v58.origin.y = v35;
      v58.size.width = v37;
      v58.size.height = v39;
      double MinY = CGRectGetMinY(v58);
    }

    double v27 = v49;
    double v5 = v50;
    double v28 = v48;
  }
  else
  {
    double MaxY = 0.0;
    double MinY = 1.79769313e308;
  }
  v59.origin.x = v5;
  v59.origin.y = v7;
  v59.size.width = v53;
  v59.size.height = v11;
  if (CGRectGetMaxY(v59) > MaxY)
  {
    v60.origin.x = v5;
    v60.origin.y = v7;
    v60.size.width = v53;
    v60.size.height = v11;
    double MaxY = CGRectGetMaxY(v60);
  }
  v61.origin.x = v5;
  v61.origin.y = v7;
  v61.size.width = v53;
  v61.size.height = v11;
  if (CGRectGetMinY(v61) < MinY)
  {
    v62.origin.x = v5;
    v62.origin.y = v7;
    v62.size.width = v53;
    v62.size.height = v11;
    double MinY = CGRectGetMinY(v62);
  }
  if ((BSInterfaceOrientationIsPortrait() & 1) != 0
    || ([v23 suggestedLandscapeComplications],
        v42 = objc_claimAutoreleasedReturnValue(),
        uint64_t v43 = [v42 count],
        v42,
        !v43))
  {
    double v44 = MaxY - MinY;
    v45 = [(PRWidgetGridViewController *)self->_widgetGridViewController view];
    objc_msgSend(v45, "setFrame:", v5, v7 - MinY, v53, v11);

    v46 = [(NSMapTable *)self->_imageViewForComplication objectForKey:v24];
    [(PBFPosterGalleryPreviewComplicationContentView *)self _scaledFrameForElements:4];
    objc_msgSend(v46, "setFrame:");
  }
  else
  {
    double MinY = v28;
    double v44 = v51;
  }
  -[BSUIVibrancyEffectView setFrame:](self->_vibrancyEffectView, "setFrame:", v27, MinY, v52, v44);
  inlineComplicationContainerView = self->_inlineComplicationContainerView;
  [(BSUIVibrancyEffectView *)self->_vibrancyEffectView bounds];
  -[UIView setFrame:](inlineComplicationContainerView, "setFrame:");
}

- (void)_enumerateImageViewsForComplicationSnapshotRequest:(id)a3 usingBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v6 = (void (**)(id, void))a4;
  double v7 = [(NSMapTable *)self->_imageViewsForComplicationSnapshotRequest objectForKey:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)_imageViewForComplication:(id)a3 snapshotRequest:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableArray *)self->_unusedComplicationImageViews lastObject];
  if (v8)
  {
    id v9 = (id)v8;
    [(NSMutableArray *)self->_unusedComplicationImageViews removeLastObject];
    [v9 setHidden:0];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  }
  complicationImageViews = self->_complicationImageViews;
  if (!complicationImageViews)
  {
    uint64_t v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v12 = self->_complicationImageViews;
    self->_complicationImageViews = v11;

    complicationImageViews = self->_complicationImageViews;
  }
  [(NSMutableArray *)complicationImageViews addObject:v9];
  imageViewForComplication = self->_imageViewForComplication;
  if (!imageViewForComplication)
  {
    long long v14 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:517 valueOptions:0];
    long long v15 = self->_imageViewForComplication;
    self->_imageViewForComplication = v14;

    imageViewForComplication = self->_imageViewForComplication;
  }
  [(NSMapTable *)imageViewForComplication setObject:v9 forKey:v6];
  double v16 = [(NSMapTable *)self->_imageViewsForComplicationSnapshotRequest objectForKey:v7];
  if (v16)
  {
    uint64_t v17 = v16;
    double v18 = [v16 arrayByAddingObject:v9];
  }
  else
  {
    v23[0] = v9;
    double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  }
  imageViewsForComplicationSnapshotRequest = self->_imageViewsForComplicationSnapshotRequest;
  if (!imageViewsForComplicationSnapshotRequest)
  {
    double v20 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    double v21 = self->_imageViewsForComplicationSnapshotRequest;
    self->_imageViewsForComplicationSnapshotRequest = v20;

    imageViewsForComplicationSnapshotRequest = self->_imageViewsForComplicationSnapshotRequest;
  }
  [(NSMapTable *)imageViewsForComplicationSnapshotRequest setObject:v18 forKey:v7];

  return v9;
}

- (id)_placeImageViewForSubtitleComplication:(id)a3 withSuperview:(id)a4 snapshotRequest:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [(PBFPosterGalleryPreviewComplicationContentView *)self _imageViewForComplication:a3 snapshotRequest:v8];
  [v9 addSubview:v10];

  uint64_t v11 = [(PBFPosterGalleryPreviewComplicationContentView *)self window];

  if (v11)
  {
    [(PBFPosterGalleryPreviewComplicationContentView *)self _scaledFrameForElements:4];
    objc_msgSend(v10, "setFrame:");
  }
  [v10 setClipsToBounds:1];
  long long v12 = [v10 layer];
  [(PBFPosterGalleryPreviewComplicationContentView *)self _cornerRadiusForComplicationSnapshotRequest:v8];
  double v14 = v13;

  [v12 setCornerRadius:v14];
  return v10;
}

- (void)_stopUsingComplicationImageView:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setImage:0];
  objc_msgSend(v4, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setHidden:1];
  unusedComplicationImageViews = self->_unusedComplicationImageViews;
  if (!unusedComplicationImageViews)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = self->_unusedComplicationImageViews;
    self->_unusedComplicationImageViews = v6;

    unusedComplicationImageViews = self->_unusedComplicationImageViews;
  }
  [(NSMutableArray *)unusedComplicationImageViews addObject:v4];
  [(NSMutableArray *)self->_complicationImageViews removeObject:v4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = self->_imageViewForComplication;
  uint64_t v9 = [(NSMapTable *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v8);
      }
      double v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
      -[NSMapTable objectForKey:](self->_imageViewForComplication, "objectForKey:", v13, (void)v16);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14 == v4) {
        break;
      }

      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSMapTable *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          goto LABEL_5;
        }
        goto LABEL_14;
      }
    }
    long long v15 = v13;

    if (!v15) {
      goto LABEL_15;
    }
    [(NSMapTable *)self->_imageViewForComplication removeObjectForKey:v15];
    id v8 = v15;
  }
LABEL_14:

LABEL_15:
}

- (CGRect)_scaledFrameForElements:(unint64_t)a3
{
  double v5 = [(PBFPosterGalleryPreviewComplicationContentView *)self pbf_displayContext];
  if (v5 && [(PBFPosterGalleryPreviewComplicationContentView *)self _hasComplications])
  {
    objc_msgSend(v5, "pbf_frame");
    double v7 = v6;
    double v9 = v8;
    [(PBFPosterGalleryPreviewComplicationContentView *)self bounds];
    double v11 = v10;
    double v13 = v12;
    id v14 = [(PBFPosterGalleryPreviewComplicationContentView *)self traitCollection];
    [v14 displayScale];

    memset(&v37, 0, sizeof(v37));
    CGAffineTransformMakeScale(&v37, v11 / v7, v13 / v9);
    long long v15 = [(PBFPosterGalleryPreviewComplicationContentView *)self _layoutController];
    objc_msgSend(v15, "frameForElements:withBoundingRect:", a3, 0.0, 0.0, v7, v9);
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;

    CGAffineTransform v36 = v37;
    v38.origin.x = v17;
    v38.origin.y = v19;
    v38.size.width = v21;
    v38.size.height = v23;
    CGRectApplyAffineTransform(v38, &v36);
    UIRectRoundToScale();
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
  }
  else
  {
    double v25 = *MEMORY[0x1E4F1DB28];
    double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v29 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v31 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v32 = v25;
  double v33 = v27;
  double v34 = v29;
  double v35 = v31;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (double)_contentScaleForWidgetGridViewController
{
  id v3 = [(PBFPosterGalleryPreviewComplicationContentView *)self pbf_displayContext];
  id v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "pbf_frame");
    double v6 = v5;
    [(PBFPosterGalleryPreviewComplicationContentView *)self bounds];
    double v8 = v7 / v6;
  }
  else
  {
    double v8 = 1.0;
  }

  return v8;
}

- (double)_cornerRadiusForComplicationSnapshotRequest:(id)a3
{
  id v4 = a3;
  double v5 = [(PBFPosterGalleryPreviewComplicationContentView *)self pbf_displayContext];
  double v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "pbf_frame");
    double v8 = v7;
    [(PBFPosterGalleryPreviewComplicationContentView *)self bounds];
    double v10 = v9 / v8;
    double v11 = [v4 metrics];
    [v11 _effectiveCornerRadius];
    double v13 = v12 * v10;
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

- (id)_layoutController
{
  id v3 = [(PBFPosterGalleryPreviewComplicationContentView *)self pbf_displayContext];
  if (v3)
  {
    layoutController = self->_layoutController;
    if (!layoutController
      || ([(CSProminentLayoutController *)layoutController traitEnvironment],
          double v5 = objc_claimAutoreleasedReturnValue(),
          [(PBFPosterGalleryPreviewComplicationContentView *)self window],
          double v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v5 isEqual:v6],
          v6,
          v5,
          (v7 & 1) == 0))
    {
      id v8 = objc_alloc(MEMORY[0x1E4F5E4D0]);
      double v9 = [(PBFPosterGalleryPreviewComplicationContentView *)self window];
      double v10 = (CSProminentLayoutController *)[v8 initWithTraitEnvironment:v9];
      double v11 = self->_layoutController;
      self->_layoutController = v10;
    }
    double v12 = self->_layoutController;
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (BOOL)_hasComplications
{
  return [(NSArray *)self->_modularComplicationSnapshotRequests count]
      || self->_inlineComplicationSnapshotRequest != 0;
}

- (BOOL)_isComplicationSnapshotRequestOurs:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PBFComplicationSnapshotRequest *)self->_inlineComplicationSnapshotRequest isEqual:v4])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    double v6 = self->_modularComplicationSnapshotRequests;
    uint64_t v5 = [(NSArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "isEqual:", v4, (void)v10))
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v5 = [(NSArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v5;
}

- (void)prepareComplicationPreviewWithGenerator:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v4 = [(PBFPosterGalleryPreviewComplicationContentView *)self posterPreview];
  objc_initWeak(&location, self);
  uint64_t v5 = [v4 suggestedComplications];
  if (![v5 count])
  {
    double v6 = [v4 suggestedLandscapeComplications];
    if (![v6 count])
    {
      double v20 = [v4 subtitleComplication];
      BOOL v21 = v20 == 0;

      if (v21) {
        goto LABEL_17;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  uint64_t v7 = [v4 subtitleComplication];
  BOOL v23 = v7 != 0;
  id v8 = [v4 suggestedComplications];
  uint64_t v22 = [v8 count];
  double v9 = [v4 suggestedLandscapeComplications];
  uint64_t v10 = [v9 count];

  long long v11 = [v24 preparedComplicationPreviewImagesForPreview:v4];
  long long v12 = v11;
  if (v11)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v13 = [v11 keyEnumerator];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          double v18 = [v12 objectForKey:v17];
          [(PBFPosterGalleryPreviewComplicationContentView *)self _updatePreviewWithComplicationImage:v18 error:0 complicationSnapshotRequest:v17 posterPreview:v4];
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v14);
    }
  }
  if ([v12 count] != v22 + v23 + v10)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __90__PBFPosterGalleryPreviewComplicationContentView_prepareComplicationPreviewWithGenerator___block_invoke;
    v28[3] = &unk_1E6982E38;
    objc_copyWeak(&v30, &location);
    id v19 = v4;
    id v29 = v19;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __90__PBFPosterGalleryPreviewComplicationContentView_prepareComplicationPreviewWithGenerator___block_invoke_3;
    v25[3] = &unk_1E6982E60;
    objc_copyWeak(&v27, &location);
    id v26 = v19;
    [v24 fetchComplicationPreviewImagesForPreview:v26 complicationSnapshotReceivedHandler:v28 errorHandler:v25 completion:0];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v30);
  }

LABEL_17:
  objc_destroyWeak(&location);
}

void __90__PBFPosterGalleryPreviewComplicationContentView_prepareComplicationPreviewWithGenerator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__PBFPosterGalleryPreviewComplicationContentView_prepareComplicationPreviewWithGenerator___block_invoke_2;
  v9[3] = &unk_1E6981F50;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v6;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
}

void __90__PBFPosterGalleryPreviewComplicationContentView_prepareComplicationPreviewWithGenerator___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _updatePreviewWithComplicationImage:*(void *)(a1 + 32) error:0 complicationSnapshotRequest:*(void *)(a1 + 40) posterPreview:*(void *)(a1 + 48)];
}

void __90__PBFPosterGalleryPreviewComplicationContentView_prepareComplicationPreviewWithGenerator___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__PBFPosterGalleryPreviewComplicationContentView_prepareComplicationPreviewWithGenerator___block_invoke_4;
  v9[3] = &unk_1E6981F50;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v6;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
}

void __90__PBFPosterGalleryPreviewComplicationContentView_prepareComplicationPreviewWithGenerator___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _updatePreviewWithComplicationImage:0 error:*(void *)(a1 + 32) complicationSnapshotRequest:*(void *)(a1 + 40) posterPreview:*(void *)(a1 + 48)];
}

- (void)_updatePreviewWithComplicationImage:(id)a3 error:(id)a4 complicationSnapshotRequest:(id)a5 posterPreview:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (PBFPosterPreview *)a6;
  if (!v13)
  {
    id v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"complicationSnapshotRequest"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterGalleryPreviewComplicationContentView _updatePreviewWithComplicationImage:error:complicationSnapshotRequest:posterPreview:](a2, (uint64_t)self, (uint64_t)v19);
    }
LABEL_17:
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324C250);
  }
  uint64_t v15 = v14;
  if (!v14)
  {
    id v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"posterPreview"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterGalleryPreviewComplicationContentView _updatePreviewWithComplicationImage:error:complicationSnapshotRequest:posterPreview:](a2, (uint64_t)self, (uint64_t)v19);
    }
    goto LABEL_17;
  }
  if (self->_posterPreview == v14)
  {
    double v16 = PBFLogGallery();
    uint64_t v17 = v16;
    if (v12)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterGalleryPreviewComplicationContentView _updatePreviewWithComplicationImage:error:complicationSnapshotRequest:posterPreview:].cold.4();
      }
      id v18 = 0;
    }
    else
    {
      id v18 = v11;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        -[PBFPosterGalleryPreviewComplicationContentView _updatePreviewWithComplicationImage:error:complicationSnapshotRequest:posterPreview:]();
        id v18 = v11;
      }
    }

    [(PBFPosterGalleryPreviewComplicationContentView *)self setComplicationImage:v18 forComplicationSnapshotRequest:v13];
  }
}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  return 0;
}

- (BOOL)isIconViewRecycled:(id)a3
{
  return 0;
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v5 = a3;
  [v5 setIconContentScalingEnabled:1];
  [v5 setDelegate:self];
}

- (id)customImageViewControllerForIconView:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(PBFWidgetIconViewController);
  id v6 = [v4 icon];

  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      double v9 = v8;
    }
    else {
      double v9 = 0;
    }
  }
  else
  {
    double v9 = 0;
  }
  id v10 = v9;

  id v11 = [v10 leafIdentifier];

  id v12 = [(NSMutableDictionary *)self->_iconImageViewsByUniqueIdentifier objectForKeyedSubscript:v11];
  [(PBFWidgetIconViewController *)v5 setIconImageView:v12];

  return v5;
}

- (PBFPosterPreview)posterPreview
{
  return self->_posterPreview;
}

- (double)posterPreviewScale
{
  return self->_posterPreviewScale;
}

- (void)setPosterPreviewScale:(double)a3
{
  self->_posterPreviewScale = a3;
}

- (BOOL)preferredCornerRadius
{
  return self->_preferredCornerRadius;
}

- (void)setPreferredCornerRadius:(BOOL)a3
{
  self->_preferredCornerRadius = a3;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterPreview, 0);
  objc_storeStrong((id *)&self->_sidebarWidgetGridViewController, 0);
  objc_storeStrong((id *)&self->_widgetGridViewController, 0);
  objc_storeStrong((id *)&self->_inlineComplicationContainerView, 0);
  objc_storeStrong((id *)&self->_vibrancyEffectView, 0);
  objc_storeStrong((id *)&self->_inlineComplicationSnapshotRequest, 0);
  objc_storeStrong((id *)&self->_modularComplicationSnapshotRequests, 0);
  objc_storeStrong((id *)&self->_unusedComplicationImageViews, 0);
  objc_storeStrong((id *)&self->_complicationImageViews, 0);
  objc_storeStrong((id *)&self->_imageViewForComplication, 0);
  objc_storeStrong((id *)&self->_imageViewsForComplicationSnapshotRequest, 0);
  objc_storeStrong((id *)&self->_iconImageViewsByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_layoutController, 0);
}

- (void)_updatePreviewWithComplicationImage:(uint64_t)a3 error:complicationSnapshotRequest:posterPreview:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  double v9 = @"PBFPosterGalleryPreviewComplicationContentView.m";
  __int16 v10 = 1024;
  int v11 = 487;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)_updatePreviewWithComplicationImage:(uint64_t)a3 error:complicationSnapshotRequest:posterPreview:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  double v9 = @"PBFPosterGalleryPreviewComplicationContentView.m";
  __int16 v10 = 1024;
  int v11 = 488;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)_updatePreviewWithComplicationImage:error:complicationSnapshotRequest:posterPreview:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_1D31CE000, v0, OS_LOG_TYPE_DEBUG, "Laying out poster preview complication request '%{public}@' for poster preview '%{public}@'", v1, 0x16u);
}

- (void)_updatePreviewWithComplicationImage:error:complicationSnapshotRequest:posterPreview:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_1D31CE000, v0, OS_LOG_TYPE_ERROR, "Error laying out complications for poster preview '%{public}@': %{public}@", v1, 0x16u);
}

@end