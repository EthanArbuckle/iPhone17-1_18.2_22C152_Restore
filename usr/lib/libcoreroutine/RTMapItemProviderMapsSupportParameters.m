@interface RTMapItemProviderMapsSupportParameters
- (RTMapItemProviderMapsSupportParameters)init;
- (RTMapItemProviderMapsSupportParameters)initWithDefaultsManager:(id)a3;
- (RTMapItemProviderMapsSupportParameters)initWithFavoriteConfidence:(double)a3 historyEntryRouteConfidence:(double)a4 historyEntryPlaceDisplayConfidence:(double)a5;
- (double)favoriteConfidence;
- (double)historyEntryPlaceDisplayConfidence;
- (double)historyEntryRouteConfidence;
- (id)description;
@end

@implementation RTMapItemProviderMapsSupportParameters

- (RTMapItemProviderMapsSupportParameters)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithFavoriteConfidence_historyEntryRouteConfidence_historyEntryPlaceDisplayConfidence_);
}

- (RTMapItemProviderMapsSupportParameters)initWithFavoriteConfidence:(double)a3 historyEntryRouteConfidence:(double)a4 historyEntryPlaceDisplayConfidence:(double)a5
{
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: RTCommonValidConfidence(favoriteConfidence)";
LABEL_13:
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_14;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: RTCommonValidConfidence(historyEntryRouteConfidence)";
    goto LABEL_13;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v12 = "Invalid parameter not satisfying: RTCommonValidConfidence(historyEntryPlaceDisplayConfidence)";
      goto LABEL_13;
    }
LABEL_14:

    v10 = 0;
    goto LABEL_15;
  }
  v14.receiver = self;
  v14.super_class = (Class)RTMapItemProviderMapsSupportParameters;
  v9 = [(RTMapItemProviderMapsSupportParameters *)&v14 init];
  if (v9)
  {
    v9->_favoriteConfidence = a3;
    v9->_historyEntryRouteConfidence = a4;
    v9->_historyEntryPlaceDisplayConfidence = a5;
  }
  self = v9;
  v10 = self;
LABEL_15:

  return v10;
}

- (RTMapItemProviderMapsSupportParameters)initWithDefaultsManager:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"RTDefaultsMapItemProviderMapsSupportFavoriteConfidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      double v8 = v7;
    }
    else
    {
      double v8 = 0.9;
    }
    v11 = [v5 objectForKey:@"RTDefaultsMapItemProviderMapsSupportHistoryEntryRouteConfidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 doubleValue];
      double v13 = v12;
    }
    else
    {
      double v13 = 0.95;
    }
    objc_super v14 = [v5 objectForKey:@"RTDefaultsMapItemProviderMapsSupportHistoryEntryPlaceDisplayConfidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 doubleValue];
      double v16 = v15;
    }
    else
    {
      double v16 = 0.8;
    }
    self = [(RTMapItemProviderMapsSupportParameters *)self initWithFavoriteConfidence:v8 historyEntryRouteConfidence:v13 historyEntryPlaceDisplayConfidence:v16];

    v10 = self;
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v18, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"favoriteConfidence, %.3f, historyEntryRouteConfidence, %.3f, historyEntryPlaceDisplayConfidence, %.3f", *(void *)&self->_favoriteConfidence, *(void *)&self->_historyEntryRouteConfidence, *(void *)&self->_historyEntryPlaceDisplayConfidence];
}

- (double)favoriteConfidence
{
  return self->_favoriteConfidence;
}

- (double)historyEntryRouteConfidence
{
  return self->_historyEntryRouteConfidence;
}

- (double)historyEntryPlaceDisplayConfidence
{
  return self->_historyEntryPlaceDisplayConfidence;
}

@end