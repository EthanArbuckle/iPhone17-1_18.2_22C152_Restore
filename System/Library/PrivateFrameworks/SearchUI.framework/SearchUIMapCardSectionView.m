@interface SearchUIMapCardSectionView
+ (BOOL)fillsBackgroundWithContentForRowModel:(id)a3;
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
+ (id)_postalAddressFromPlacemark:(id)a3;
- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5;
- (CLPlacemark)currentPlacemark;
- (MKMapSnapshotter)mapSnapshotter;
- (MKPinAnnotationView)pinAnnotationView;
- (TLKImageView)snapshotView;
- (TLKLabel)footnoteDescriptorLabel;
- (TLKLabel)footnoteLabel;
- (TLKStackView)labelsStackView;
- (UITapGestureRecognizer)tapRecognizer;
- (double)requestedMapHeight;
- (id)_clLocationFromSFLatLng:(id)a3;
- (id)setupContentView;
- (void)_mapButtonPressed;
- (void)_updateSnapshot;
- (void)_updateSnapshotWithSize:(CGSize)a3;
- (void)dealloc;
- (void)sendMapFeedbackWithTriggerEvent:(unint64_t)a3 placemarkData:(id)a4;
- (void)setCurrentPlacemark:(id)a3;
- (void)setFootnoteDescriptorLabel:(id)a3;
- (void)setFootnoteLabel:(id)a3;
- (void)setLabelsStackView:(id)a3;
- (void)setMapSnapshotter:(id)a3;
- (void)setPinAnnotationView:(id)a3;
- (void)setSnapshotView:(id)a3;
- (void)setTapRecognizer:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIMapCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (BOOL)fillsBackgroundWithContentForRowModel:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  v3 = objc_opt_new();
  [v3 setDelegate:self];
  [v3 setSpacing:0.0];
  [v3 setAxis:1];
  v4 = objc_opt_new();
  [(SearchUIMapCardSectionView *)self setSnapshotView:v4];

  v5 = [(SearchUIMapCardSectionView *)self snapshotView];
  [v5 setPlaceholderVisibility:1];

  v6 = [(SearchUIMapCardSectionView *)self snapshotView];
  [v3 addArrangedSubview:v6];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__mapButtonPressed];
  [(SearchUIMapCardSectionView *)self setTapRecognizer:v7];

  v8 = [(SearchUIMapCardSectionView *)self snapshotView];
  v9 = [(SearchUIMapCardSectionView *)self tapRecognizer];
  [v8 addGestureRecognizer:v9];

  v10 = objc_opt_new();
  [v10 setSpacing:10.0];
  [v10 setAlignment:2];
  [v10 setLayoutMarginsRelativeArrangement:1];
  objc_msgSend(v10, "setLayoutMargins:", 16.0, 16.0, 16.0, 16.0);
  [(SearchUIMapCardSectionView *)self setLabelsStackView:v10];
  [v3 addArrangedSubview:v10];
  v11 = objc_opt_new();
  v12 = [MEMORY[0x1E4FAE090] footnoteFont];
  [v11 setFont:v12];

  +[SearchUIAutoLayout requireIntrinsicSizeForView:v11];
  [(SearchUIMapCardSectionView *)self setFootnoteDescriptorLabel:v11];
  [v10 addArrangedSubview:v11];
  v13 = objc_opt_new();
  v14 = [MEMORY[0x1E4FAE090] subheadFont];
  [v13 setFont:v14];

  [(SearchUIMapCardSectionView *)self setFootnoteLabel:v13];
  [v10 addArrangedSubview:v13];
  [(SearchUIMapCardSectionView *)self setClipsToBounds:1];
  v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v15 addObserver:self selector:sel__updateSnapshot name:*MEMORY[0x1E4FB32A8] object:0];

  return v3;
}

- (void)_updateSnapshot
{
  id v5 = [(SearchUIMapCardSectionView *)self snapshotView];
  [v5 frame];
  -[SearchUIMapCardSectionView _updateSnapshotWithSize:](self, "_updateSnapshotWithSize:", v3, v4);
}

- (void)_updateSnapshotWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v5 = [(SearchUIMapCardSectionView *)self mapSnapshotter];
  [v5 cancel];

  v6 = objc_opt_new();
  v7 = [(SearchUIMapCardSectionView *)self snapshotView];
  [v7 setTlkImage:v6];

  v67 = [(SearchUICardSectionView *)self section];
  if (v67)
  {
    [(SearchUIMapCardSectionView *)self requestedMapHeight];
    if (height == v8)
    {
      v66 = [v67 boundingMapRegion];
      v65 = objc_opt_new();
      objc_msgSend(v65, "setSize:", width, height);
      v69 = objc_opt_new();
      v70 = objc_opt_new();
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      obuint64_t j = [v67 pins];
      uint64_t v9 = [obj countByEnumeratingWithState:&v82 objects:v87 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v83;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v83 != v10) {
              objc_enumerationMutation(obj);
            }
            v12 = *(void **)(*((void *)&v82 + 1) + 8 * i);
            id v13 = objc_alloc_init(MEMORY[0x1E4F30FD8]);
            v14 = [v12 label];
            [v13 setTitle:v14];

            v15 = [v12 location];
            v16 = [(SearchUIMapCardSectionView *)self _clLocationFromSFLatLng:v15];
            [v16 coordinate];
            objc_msgSend(v13, "setCoordinate:");

            [v69 addObject:v13];
            v17 = (void *)[objc_alloc(MEMORY[0x1E4F30F58]) initWithAnnotation:v13 reuseIdentifier:0];
            v18 = [v12 pinText];
            [v17 setGlyphText:v18];

            v19 = [MEMORY[0x1E4FB1618] systemRedColor];
            [v17 setMarkerTintColor:v19];

            v20 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
            [v17 setGlyphTintColor:v20];

            [v70 addObject:v17];
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v82 objects:v87 count:16];
        }
        while (v9);
      }

      v21 = [v70 reverseObjectEnumerator];
      v22 = [v21 allObjects];
      [v65 setAnnotationViews:v22];

      if (v66 && ([v66 altitudeInMeters], v23 == 0.0))
      {
        [v66 northLat];
        double v41 = v40;
        [v66 southLat];
        double v43 = v42;
        [v66 eastLng];
        double v45 = v44;
        [v66 westLng];
        double v47 = v45 - v46;
        if (v45 - v46 >= 0.0) {
          double v48 = 0.0;
        }
        else {
          double v48 = 360.0;
        }
        [v66 northLat];
        double v50 = v49;
        [v66 eastLng];
        double v51 = v41 - v43;
        double v53 = v52 + (v47 + v48) * -0.5;
        double v54 = 0.0;
        if (v53 <= -180.0) {
          double v54 = 360.0;
        }
        CLLocationCoordinate2D v55 = CLLocationCoordinate2DMake(v50 + v51 * -0.5, v53 + v54);
        objc_msgSend(v65, "setRegion:", v55.latitude, v55.longitude, v51, v47 + v48);
      }
      else
      {
        v24 = [v67 location];

        if (v24)
        {
          v25 = [v67 location];
          v26 = [(SearchUIMapCardSectionView *)self _clLocationFromSFLatLng:v25];
          [v26 coordinate];
          double v28 = v27;
          double v30 = v29;

          MEMORY[0x1E4E83DF0](v28, v30, 500.0, 500.0);
          objc_msgSend(v65, "setRegion:");
        }
        else
        {
          long long v80 = 0u;
          long long v81 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          id v31 = v69;
          uint64_t v32 = [v31 countByEnumeratingWithState:&v78 objects:v86 count:16];
          if (v32)
          {
            uint64_t v33 = *(void *)v79;
            double y = INFINITY;
            double v35 = -INFINITY;
            double v36 = -INFINITY;
            double x = INFINITY;
            do
            {
              for (uint64_t j = 0; j != v32; ++j)
              {
                if (*(void *)v79 != v33) {
                  objc_enumerationMutation(v31);
                }
                [*(id *)(*((void *)&v78 + 1) + 8 * j) coordinate];
                MKMapPoint v39 = MKMapPointForCoordinate(v89);
                if (v39.x < x) {
                  double x = v39.x;
                }
                if (v39.y < y) {
                  double y = v39.y;
                }
                if (v39.x >= v36) {
                  double v36 = v39.x;
                }
                if (v39.y >= v35) {
                  double v35 = v39.y;
                }
              }
              uint64_t v32 = [v31 countByEnumeratingWithState:&v78 objects:v86 count:16];
            }
            while (v32);
          }
          else
          {
            double y = INFINITY;
            double v35 = -INFINITY;
            double v36 = -INFINITY;
            double x = INFINITY;
          }

          v56 = [v67 pins];
          v57 = [v56 firstObject];
          v58 = [v57 pinText];
          if (v58) {
            double v59 = 0.5;
          }
          else {
            double v59 = 0.2;
          }

          v90.size.double width = v36 - x;
          v90.size.double height = v35 - y;
          v90.origin.double x = x;
          v90.origin.double y = y;
          MKMapRect v91 = MKMapRectInset(v90, -(v59 * (v36 - x)), -(v59 * (v35 - y)));
          objc_msgSend(v65, "setMapRect:", v91.origin.x, v91.origin.y, v91.size.width, v91.size.height);
        }
      }
      [v66 altitudeInMeters];
      if (v60 != 0.0)
      {
        [v66 altitudeInMeters];
        double v62 = v61;
        v63 = [v65 camera];
        [v63 setAltitude:v62];
      }
      v64 = (void *)[objc_alloc(MEMORY[0x1E4F30F48]) initWithOptions:v65];
      [(SearchUIMapCardSectionView *)self setMapSnapshotter:v64];
      objc_initWeak(&location, self);
      objc_initWeak(&from, v64);
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __54__SearchUIMapCardSectionView__updateSnapshotWithSize___block_invoke;
      v72[3] = &unk_1E6E72F80;
      objc_copyWeak(&v74, &location);
      objc_copyWeak(&v75, &from);
      id v73 = v67;
      [v64 startWithCompletionHandler:v72];

      objc_destroyWeak(&v75);
      objc_destroyWeak(&v74);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
}

void __54__SearchUIMapCardSectionView__updateSnapshotWithSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v15 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained mapSnapshotter];
    id v8 = objc_loadWeakRetained((id *)(a1 + 48));

    if (!a3 && v7 == v8)
    {
      uint64_t v9 = [v6 section];
      uint64_t v10 = *(void **)(a1 + 32);

      if (v9 == v10)
      {
        id v11 = objc_alloc(MEMORY[0x1E4FAE0C0]);
        v12 = [v15 image];
        id v13 = (void *)[v11 initWithImage:v12];

        v14 = [v6 snapshotView];
        [v14 setTlkImage:v13];
      }
    }
  }
}

- (void)updateWithRowModel:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)SearchUIMapCardSectionView;
  [(SearchUICardSectionView *)&v26 updateWithRowModel:a3];
  double v4 = [(SearchUICardSectionView *)self section];
  id v5 = [(SearchUICardSectionView *)self section];
  int v6 = [v5 interactive];

  uint64_t v7 = v6 ^ 1u;
  id v8 = [(SearchUIMapCardSectionView *)self tapRecognizer];
  [v8 setEnabled:v7];

  uint64_t v9 = [(SearchUIMapCardSectionView *)self snapshotView];
  double v10 = *MEMORY[0x1E4F4BEC8];
  [(SearchUIMapCardSectionView *)self requestedMapHeight];
  LODWORD(v11) = 1148846080;
  objc_msgSend(v9, "setLayoutSize:withContentPriority:", v10, v12, v11);

  [(SearchUIMapCardSectionView *)self _updateSnapshot];
  id v13 = [v4 footnoteLabel];
  if (v13)
  {
    id v8 = [v4 footnoteLabel];
    uint64_t v14 = [v8 isEqualToString:&stru_1F40279D8];
  }
  else
  {
    uint64_t v14 = 1;
  }
  id v15 = [(SearchUIMapCardSectionView *)self footnoteDescriptorLabel];
  [v15 setHidden:v14];

  if (v13) {
  v16 = [v4 footnoteLabel];
  }
  v17 = [(SearchUIMapCardSectionView *)self footnoteDescriptorLabel];
  [v17 setText:v16];

  v18 = [v4 footnote];
  if (v18)
  {
    v17 = [v4 footnote];
    uint64_t v19 = [v17 isEqualToString:&stru_1F40279D8];
  }
  else
  {
    uint64_t v19 = 1;
  }
  v20 = [(SearchUIMapCardSectionView *)self footnoteLabel];
  [v20 setHidden:v19];

  if (v18) {
  v21 = [v4 footnote];
  }
  v22 = [(SearchUIMapCardSectionView *)self footnoteLabel];
  [v22 setText:v21];

  double v23 = [v4 footnoteLabel];
  if (v23)
  {
    BOOL v24 = 0;
  }
  else
  {
    v22 = [v4 footnote];
    BOOL v24 = v22 == 0;
  }
  v25 = [(SearchUIMapCardSectionView *)self labelsStackView];
  [v25 setHidden:v24];

  if (!v23) {
}
  }

- (void)dealloc
{
  double v3 = [(SearchUIMapCardSectionView *)self mapSnapshotter];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)SearchUIMapCardSectionView;
  [(NUIContainerStackView *)&v4 dealloc];
}

- (double)requestedMapHeight
{
  v2 = [(SearchUICardSectionView *)self section];
  double v3 = dbl_1E46B6730[[v2 sizeFormat] == 1];

  return v3;
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v10 = a4;
  id v11 = [(SearchUIMapCardSectionView *)self snapshotView];
  if (v11 == v10)
  {
    double v12 = [(SearchUIMapCardSectionView *)self snapshotView];
    [v12 frame];
    double v14 = v13;
    double v16 = v15;

    if (width != v14 || height != v16) {
      -[SearchUIMapCardSectionView _updateSnapshotWithSize:](self, "_updateSnapshotWithSize:", width, height);
    }
  }
  else
  {
  }
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (void)_mapButtonPressed
{
}

- (void)sendMapFeedbackWithTriggerEvent:(unint64_t)a3 placemarkData:(id)a4
{
  id v12 = a4;
  int v6 = [(SearchUICardSectionView *)self feedbackDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F9A1E8]);
    uint64_t v9 = [(SearchUICardSectionView *)self section];
    id v10 = (void *)[v8 initWithCardSection:v9 destination:0 triggerEvent:a3 actionCardType:1];

    [v10 setModifiedPlacemarkData:v12];
    id v11 = [(SearchUICardSectionView *)self feedbackDelegate];
    [v11 didEngageCardSection:v10];
  }
}

- (id)_clLocationFromSFLatLng:(id)a3
{
  double v3 = (objc_class *)MEMORY[0x1E4F1E5F0];
  id v4 = a3;
  id v5 = [v3 alloc];
  [v4 lat];
  double v7 = v6;
  [v4 lng];
  double v9 = v8;

  id v10 = (void *)[v5 initWithLatitude:v7 longitude:v9];
  return v10;
}

+ (id)_postalAddressFromPlacemark:(id)a3
{
  double v3 = (objc_class *)MEMORY[0x1E4F1BA58];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  double v6 = [v4 thoroughfare];
  [v5 setStreet:v6];

  double v7 = [v4 locality];
  [v5 setCity:v7];

  double v8 = [v4 administrativeArea];
  [v5 setState:v8];

  double v9 = [v4 country];
  [v5 setCountry:v9];

  id v10 = [v4 postalCode];

  [v5 setPostalCode:v10];
  id v11 = (void *)[v5 copy];

  return v11;
}

- (TLKLabel)footnoteDescriptorLabel
{
  return self->_footnoteDescriptorLabel;
}

- (void)setFootnoteDescriptorLabel:(id)a3
{
}

- (TLKLabel)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void)setFootnoteLabel:(id)a3
{
}

- (MKPinAnnotationView)pinAnnotationView
{
  return self->_pinAnnotationView;
}

- (void)setPinAnnotationView:(id)a3
{
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
}

- (CLPlacemark)currentPlacemark
{
  return self->_currentPlacemark;
}

- (void)setCurrentPlacemark:(id)a3
{
}

- (TLKStackView)labelsStackView
{
  return self->_labelsStackView;
}

- (void)setLabelsStackView:(id)a3
{
}

- (TLKImageView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
}

- (MKMapSnapshotter)mapSnapshotter
{
  return self->_mapSnapshotter;
}

- (void)setMapSnapshotter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapSnapshotter, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_currentPlacemark, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_pinAnnotationView, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_footnoteDescriptorLabel, 0);
}

@end