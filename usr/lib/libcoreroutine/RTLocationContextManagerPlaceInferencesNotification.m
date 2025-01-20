@interface RTLocationContextManagerPlaceInferencesNotification
- (NSArray)placeInferences;
- (RTLocationContextManagerPlaceInferencesNotification)init;
- (RTLocationContextManagerPlaceInferencesNotification)initWithPlaceInferences:(id)a3;
@end

@implementation RTLocationContextManagerPlaceInferencesNotification

- (RTLocationContextManagerPlaceInferencesNotification)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPlaceInferences_);
}

- (RTLocationContextManagerPlaceInferencesNotification)initWithPlaceInferences:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[RTLocationContextManagerPlaceInferencesNotification initWithPlaceInferences:]";
      __int16 v13 = 1024;
      int v14 = 62;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeInferences (in %s:%d)", buf, 0x12u);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)RTLocationContextManagerPlaceInferencesNotification;
  v6 = [(RTNotification *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [v4 copy];
    placeInferences = v6->_placeInferences;
    v6->_placeInferences = (NSArray *)v7;
  }
  return v6;
}

- (NSArray)placeInferences
{
  return self->_placeInferences;
}

- (void).cxx_destruct
{
}

@end