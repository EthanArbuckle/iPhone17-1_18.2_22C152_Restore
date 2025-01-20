@interface NTKSwissWorldClockComplicationGraphicRectangularView
- (BOOL)_shouldGenerate:(id)a3 date:(id)a4;
- (BOOL)isPrivacy;
- (BOOL)shouldShowIdealizedTime;
- (CGPoint)_locationMarkerOffsetForCoordinate:(id)a3;
- (CLKClockTimerToken)timeUpdateToken;
- (CLKDevice)device;
- (CLKMonochromeFilterProvider)filterProvider;
- (NSArray)cities;
- (NSArray)locationViews;
- (NSDate)generatedDate;
- (NSDate)overrideDate;
- (NSNumber)cityLatitude;
- (NSNumber)cityLongitude;
- (NSObject)significantTimeChangeObserver;
- (NTKWorldClockHighlightedMapLocationView)highlightedLocationView;
- (UIColor)strokeColor;
- (UIColor)tintColor;
- (UIImage)nightMask;
- (UIImageView)mapView;
- (UIImageView)nightMaskView;
- (UIView)terminatorView;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (void)_reloadCities;
- (void)_updateNightMaskImage;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setCities:(id)a3;
- (void)setCityLatitude:(id)a3;
- (void)setCityLongitude:(id)a3;
- (void)setFilterProvider:(id)a3;
- (void)setGeneratedDate:(id)a3;
- (void)setHighlightedLocationView:(id)a3;
- (void)setIsPrivacy:(BOOL)a3;
- (void)setLocationViews:(id)a3;
- (void)setMapView:(id)a3;
- (void)setNightMask:(id)a3;
- (void)setNightMaskView:(id)a3;
- (void)setOverrideDate:(id)a3;
- (void)setShowIdealizedTime:(BOOL)a3;
- (void)setSignificantTimeChangeObserver:(id)a3;
- (void)setTerminatorView:(id)a3;
- (void)setTimeUpdateToken:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKSwissWorldClockComplicationGraphicRectangularView

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F196B0] sharedInstance];
  v4 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self timeUpdateToken];
  [v3 stopUpdatesForToken:v4];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self significantTimeChangeObserver];
  [v5 removeObserver:v6];

  v7.receiver = self;
  v7.super_class = (Class)NTKSwissWorldClockComplicationGraphicRectangularView;
  [(NTKSwissWorldClockComplicationGraphicRectangularView *)&v7 dealloc];
}

- (void)layoutSubviews
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v59.receiver = self;
  v59.super_class = (Class)NTKSwissWorldClockComplicationGraphicRectangularView;
  [(NTKSwissWorldClockComplicationGraphicRectangularView *)&v59 layoutSubviews];
  [(NTKSwissWorldClockComplicationGraphicRectangularView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self locationViews];
  [v11 makeObjectsPerformSelector:sel_removeFromSuperview];

  if (![(NTKSwissWorldClockComplicationGraphicRectangularView *)self isPrivacy])
  {
    v12 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self cities];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      v14 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self device];
      _LayoutConstants_18(v14);
      double v16 = v15;

      v17 = (void *)MEMORY[0x1E4F1CA48];
      v18 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self cities];
      v19 = objc_msgSend(v17, "arrayWithCapacity:", objc_msgSend(v18, "count"));

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      v20 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self cities];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v55 objects:v60 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v56 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v55 + 1) + 8 * i);
            v26 = -[NTKWorldClockMapLocationView initWithFrame:]([NTKWorldClockMapLocationView alloc], "initWithFrame:", 0.0, 0.0, v16, v16);
            [v19 addObject:v26];
            [(NTKSwissWorldClockComplicationGraphicRectangularView *)self addSubview:v26];
            v27 = [v25 alCity];
            [v27 latitude];
            double v29 = v28;
            [v27 longitude];
            double v31 = v30;

            -[NTKSwissWorldClockComplicationGraphicRectangularView _locationMarkerOffsetForCoordinate:](self, "_locationMarkerOffsetForCoordinate:", v29, v31);
            -[NTKWorldClockMapLocationView positionAtPoint:withinBounds:](v26, "positionAtPoint:withinBounds:", NTKWorldClock_MapPointForLocationOnMap(v29, v31, v8, v10, v32));
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v55 objects:v60 count:16];
        }
        while (v22);
      }

      v33 = (void *)[v19 copy];
      [(NTKSwissWorldClockComplicationGraphicRectangularView *)self setLocationViews:v33];
    }
  }
  if (![(NTKSwissWorldClockComplicationGraphicRectangularView *)self isPrivacy]
    && ([(NTKSwissWorldClockComplicationGraphicRectangularView *)self cityLatitude],
        (uint64_t v34 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v35 = (void *)v34,
        [(NTKSwissWorldClockComplicationGraphicRectangularView *)self cityLongitude],
        v36 = objc_claimAutoreleasedReturnValue(),
        v36,
        v35,
        v36))
  {
    v37 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self cityLatitude];
    [v37 doubleValue];
    double v39 = v38;

    v40 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self cityLongitude];
    [v40 doubleValue];
    double v42 = v41;

    -[NTKSwissWorldClockComplicationGraphicRectangularView _locationMarkerOffsetForCoordinate:](self, "_locationMarkerOffsetForCoordinate:", v39, v42);
    double v44 = NTKWorldClock_MapPointForLocationOnMap(v39, v42, v8, v10, v43);
    double v46 = v45;
    v47 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self highlightedLocationView];
    objc_msgSend(v47, "positionAtPoint:withinBounds:", v44, v46, v4, v6, v8, v10);

    v48 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self highlightedLocationView];
    [(NTKSwissWorldClockComplicationGraphicRectangularView *)self bringSubviewToFront:v48];

    v49 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self highlightedLocationView];
    v50 = v49;
    uint64_t v51 = 0;
  }
  else
  {
    v49 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self highlightedLocationView];
    v50 = v49;
    uint64_t v51 = 1;
  }
  [v49 setHidden:v51];

  v52 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self mapView];
  objc_msgSend(v52, "setFrame:", v4, v6, v8, v10);

  v53 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self nightMaskView];
  objc_msgSend(v53, "setFrame:", v4, v6, v8, v10);

  if (self->_showGossamerUI)
  {
    v54 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self terminatorView];
    objc_msgSend(v54, "setFrame:", v4, v6, v8, v10);
  }
  [(NTKSwissWorldClockComplicationGraphicRectangularView *)self _updateNightMaskImage];
}

- (CGPoint)_locationMarkerOffsetForCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  double v5 = -1.5;
  double v6 = 0.5;
  if (var1 > 0.0)
  {
    double v6 = var1 * -10.0 / 180.0;
    if (var0 < 0.0) {
      double v5 = var0 * -10.0 / 90.0;
    }
  }
  result.y = v5;
  result.x = v6;
  return result;
}

- (void)_reloadCities
{
  double v3 = +[NTKWorldClockManager sharedManager];
  [v3 loadCities];

  double v4 = +[NTKWorldClockManager sharedManager];
  id v5 = [v4 cities];

  [(NTKSwissWorldClockComplicationGraphicRectangularView *)self setCities:v5];
}

- (void)_updateNightMaskImage
{
  if ([(NTKSwissWorldClockComplicationGraphicRectangularView *)self isPrivacy]
    || ([(NTKSwissWorldClockComplicationGraphicRectangularView *)self overrideDate],
        double v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    uint64_t v4 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self overrideDate];
  }
  else
  {
    if ([(NTKSwissWorldClockComplicationGraphicRectangularView *)self shouldShowIdealizedTime])
    {
      NTKIdealizedDate();
    }
    else
    {
      [MEMORY[0x1E4F19A20] complicationDate];
    uint64_t v4 = };
  }
  id v28 = (id)v4;
  [(NTKSwissWorldClockComplicationGraphicRectangularView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  BOOL showGossamerUI = self->_showGossamerUI;
  double v10 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self nightMask];
  BOOL v11 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self _shouldGenerate:v10 date:v28];

  if (showGossamerUI)
  {
    if (v11)
    {
      v12 = objc_msgSend(MEMORY[0x1E4FB1818], "ntk_gossamer_nightMaskForDate:size:", v28, v6, v8);
      [(NTKSwissWorldClockComplicationGraphicRectangularView *)self setNightMask:v12];
      uint64_t v13 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self terminatorView];
      v14 = [v13 subviews];
      [v14 makeObjectsPerformSelector:sel_removeFromSuperview];

      double v15 = objc_msgSend(MEMORY[0x1E4FB1EB0], "ntk_gossamer_terminatorViewForDate:size:", v28, v6, v8);
      double v16 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self terminatorView];
      [v16 addSubview:v15];

      v17 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self nightMask];
      v18 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self nightMaskView];
      [v18 setImage:v17];

      [(NTKSwissWorldClockComplicationGraphicRectangularView *)self setGeneratedDate:v28];
      goto LABEL_10;
    }
  }
  else if (v11)
  {
    v19 = objc_msgSend(MEMORY[0x1E4FB1818], "ntk_pregossamer_nightMaskForDate:size:", v28, v6, v8);
    [(NTKSwissWorldClockComplicationGraphicRectangularView *)self setNightMask:v19];

    [(NTKSwissWorldClockComplicationGraphicRectangularView *)self setGeneratedDate:v28];
  }
  v20 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self nightMask];
  uint64_t v21 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self nightMaskView];
  [v21 setImage:v20];

LABEL_10:
  if ([(NTKSwissWorldClockComplicationGraphicRectangularView *)self isPrivacy])
  {
    uint64_t v22 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self mapView];
    [v22 setMaskView:0];

    uint64_t v23 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self terminatorView];
    v24 = v23;
    uint64_t v25 = 1;
  }
  else
  {
    v26 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self nightMaskView];
    v27 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self mapView];
    [v27 setMaskView:v26];

    uint64_t v23 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self terminatorView];
    v24 = v23;
    uint64_t v25 = 0;
  }
  [v23 setHidden:v25];
}

- (BOOL)_shouldGenerate:(id)a3 date:(id)a4
{
  id v5 = a3;
  if ([(NTKSwissWorldClockComplicationGraphicRectangularView *)self isPrivacy])
  {
    BOOL v6 = 0;
  }
  else
  {
    [(NTKSwissWorldClockComplicationGraphicRectangularView *)self bounds];
    double v8 = v7;
    double v10 = v9;
    uint64_t v11 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self generatedDate];
    v12 = (void *)v11;
    BOOL v6 = 1;
    if (v5)
    {
      if (v11)
      {
        [v5 size];
        if (v8 == v14 && v10 == v13)
        {
          double v15 = [MEMORY[0x1E4F1C9C8] now];
          [v15 timeIntervalSinceDate:v12];
          BOOL v6 = v16 > 86400.0 / v8;
        }
      }
    }
  }
  return v6;
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NTKSwissWorldClockComplicationGraphicRectangularView;
  BOOL v6 = -[NTKSwissWorldClockComplicationGraphicRectangularView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1618], "ntk_wc_sunYellowColor");
    tintColor = v7->_tintColor;
    v7->_tintColor = (UIColor *)v8;

    uint64_t v10 = [MEMORY[0x1E4FB1618] whiteColor];
    strokeColor = v7->_strokeColor;
    v7->_strokeColor = (UIColor *)v10;

    id v12 = objc_alloc(MEMORY[0x1E4FB1838]);
    NTKImageNamed(@"WCGraphicRectangularMap");
  }

  return 0;
}

void __89__NTKSwissWorldClockComplicationGraphicRectangularView_initFullColorImageViewWithDevice___block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateNightMaskImage];
}

__CFString *__89__NTKSwissWorldClockComplicationGraphicRectangularView_initFullColorImageViewWithDevice___block_invoke_73()
{
  return @"NTKCityListManager";
}

void __89__NTKSwissWorldClockComplicationGraphicRectangularView_initFullColorImageViewWithDevice___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateNightMaskImage];
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v10 = [a3 metadata];
  id v5 = [v10 objectForKeyedSubscript:@"Latitude"];
  [(NTKSwissWorldClockComplicationGraphicRectangularView *)self setCityLatitude:v5];

  id v6 = [v10 objectForKeyedSubscript:@"Longitude"];
  [(NTKSwissWorldClockComplicationGraphicRectangularView *)self setCityLongitude:v6];

  double v7 = [v10 objectForKeyedSubscript:@"OverrideDate"];
  [(NTKSwissWorldClockComplicationGraphicRectangularView *)self setOverrideDate:v7];

  uint64_t v8 = [v10 objectForKeyedSubscript:@"ShowIdealizedTime"];
  -[NTKSwissWorldClockComplicationGraphicRectangularView setShowIdealizedTime:](self, "setShowIdealizedTime:", [v8 BOOLValue]);

  double v9 = [v10 objectForKeyedSubscript:@"IsPrivacy"];
  -[NTKSwissWorldClockComplicationGraphicRectangularView setIsPrivacy:](self, "setIsPrivacy:", [v9 BOOLValue]);

  [(NTKSwissWorldClockComplicationGraphicRectangularView *)self _updateNightMaskImage];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  uint64_t v4 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self filterProvider];
  [(NTKSwissWorldClockComplicationGraphicRectangularView *)self tintColor];
  objc_claimAutoreleasedReturnValue();
  [v4 colorForView:self accented:1];
  objc_claimAutoreleasedReturnValue();
  CLKUIInterpolateBetweenColors();
}

- (void)updateMonochromeColor
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v3 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self filterProvider];
  uint64_t v4 = [v3 colorForView:self accented:1];
  id v5 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self highlightedLocationView];
  [v5 setFillColor:v4];

  id v6 = [v3 colorForView:self accented:0];
  double v7 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self highlightedLocationView];
  [v7 setStrokeColor:v6];

  if (self->_showGossamerUI)
  {
    uint64_t v8 = [v3 filtersForView:self style:2];
    double v9 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self terminatorView];
    id v10 = [v9 layer];
    [v10 setFilters:v8];

    uint64_t v11 = [v3 filtersForView:self style:0];
    id v12 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self mapView];
    double v13 = [v12 layer];
    [v13 setFilters:v11];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v14 = [(NTKSwissWorldClockComplicationGraphicRectangularView *)self locationViews];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v20 + 1) + 8 * i) layer];
          [v19 setFilters:v11];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v16);
    }
  }
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (CLKDevice)device
{
  return self->_device;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (CLKClockTimerToken)timeUpdateToken
{
  return self->_timeUpdateToken;
}

- (void)setTimeUpdateToken:(id)a3
{
}

- (NSObject)significantTimeChangeObserver
{
  return self->_significantTimeChangeObserver;
}

- (void)setSignificantTimeChangeObserver:(id)a3
{
}

- (UIImageView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (UIImageView)nightMaskView
{
  return self->_nightMaskView;
}

- (void)setNightMaskView:(id)a3
{
}

- (UIView)terminatorView
{
  return self->_terminatorView;
}

- (void)setTerminatorView:(id)a3
{
}

- (NTKWorldClockHighlightedMapLocationView)highlightedLocationView
{
  return self->_highlightedLocationView;
}

- (void)setHighlightedLocationView:(id)a3
{
}

- (NSArray)locationViews
{
  return self->_locationViews;
}

- (void)setLocationViews:(id)a3
{
}

- (NSDate)generatedDate
{
  return self->_generatedDate;
}

- (void)setGeneratedDate:(id)a3
{
}

- (UIImage)nightMask
{
  return self->_nightMask;
}

- (void)setNightMask:(id)a3
{
}

- (NSNumber)cityLatitude
{
  return self->_cityLatitude;
}

- (void)setCityLatitude:(id)a3
{
}

- (NSNumber)cityLongitude
{
  return self->_cityLongitude;
}

- (void)setCityLongitude:(id)a3
{
}

- (NSArray)cities
{
  return self->_cities;
}

- (void)setCities:(id)a3
{
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (void)setOverrideDate:(id)a3
{
}

- (BOOL)shouldShowIdealizedTime
{
  return self->_showIdealizedTime;
}

- (void)setShowIdealizedTime:(BOOL)a3
{
  self->_showIdealizedTime = a3;
}

- (BOOL)isPrivacy
{
  return self->_isPrivacy;
}

- (void)setIsPrivacy:(BOOL)a3
{
  self->_isPrivacy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_cities, 0);
  objc_storeStrong((id *)&self->_cityLongitude, 0);
  objc_storeStrong((id *)&self->_cityLatitude, 0);
  objc_storeStrong((id *)&self->_nightMask, 0);
  objc_storeStrong((id *)&self->_generatedDate, 0);
  objc_storeStrong((id *)&self->_locationViews, 0);
  objc_storeStrong((id *)&self->_highlightedLocationView, 0);
  objc_storeStrong((id *)&self->_terminatorView, 0);
  objc_storeStrong((id *)&self->_nightMaskView, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_significantTimeChangeObserver, 0);
  objc_storeStrong((id *)&self->_timeUpdateToken, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
}

@end