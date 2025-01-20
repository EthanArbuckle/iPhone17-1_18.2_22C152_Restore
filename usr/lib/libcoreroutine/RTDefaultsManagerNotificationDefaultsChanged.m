@interface RTDefaultsManagerNotificationDefaultsChanged
- (NSArray)updatedKeys;
- (RTDefaultsManagerNotificationDefaultsChanged)init;
- (RTDefaultsManagerNotificationDefaultsChanged)initWithUpdatedKeys:(id)a3;
@end

@implementation RTDefaultsManagerNotificationDefaultsChanged

- (void).cxx_destruct
{
}

- (NSArray)updatedKeys
{
  return self->_updatedKeys;
}

- (RTDefaultsManagerNotificationDefaultsChanged)initWithUpdatedKeys:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count])
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[RTDefaultsManagerNotificationDefaultsChanged initWithUpdatedKeys:]";
      __int16 v14 = 1024;
      int v15 = 83;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: updatedKeys.count (in %s:%d)", buf, 0x12u);
    }
  }
  if ([v4 count])
  {
    v11.receiver = self;
    v11.super_class = (Class)RTDefaultsManagerNotificationDefaultsChanged;
    v6 = [(RTNotification *)&v11 init];
    if (v6)
    {
      uint64_t v7 = [v4 copy];
      updatedKeys = v6->_updatedKeys;
      v6->_updatedKeys = (NSArray *)v7;
    }
    self = v6;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (RTDefaultsManagerNotificationDefaultsChanged)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithUpdatedKeys_);
}

@end