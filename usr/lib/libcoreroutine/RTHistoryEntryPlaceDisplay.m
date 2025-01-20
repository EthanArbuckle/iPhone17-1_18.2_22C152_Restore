@interface RTHistoryEntryPlaceDisplay
- (NSDate)usageDate;
- (NSUUID)identifier;
- (RTHistoryEntryPlaceDisplay)init;
- (RTHistoryEntryPlaceDisplay)initWithIdentifier:(id)a3 usageDate:(id)a4 location:(id)a5 mapItem:(id)a6;
- (RTLocation)location;
- (RTMapItem)mapItem;
- (id)description;
@end

@implementation RTHistoryEntryPlaceDisplay

- (RTHistoryEntryPlaceDisplay)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_usageDate_location_mapItem_);
}

- (RTHistoryEntryPlaceDisplay)initWithIdentifier:(id)a3 usageDate:(id)a4 location:(id)a5 mapItem:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (!v12)
  {
    v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTHistoryEntryPlaceDisplay initWithIdentifier:usageDate:location:mapItem:]";
      __int16 v27 = 1024;
      int v28 = 31;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location (in %s:%d)", buf, 0x12u);
    }

    if (v14) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (!v13)
  {
LABEL_9:
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTHistoryEntryPlaceDisplay initWithIdentifier:usageDate:location:mapItem:]";
      __int16 v27 = 1024;
      int v28 = 32;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem (in %s:%d)", buf, 0x12u);
    }

LABEL_12:
    v20 = 0;
    goto LABEL_13;
  }
  v24.receiver = self;
  v24.super_class = (Class)RTHistoryEntryPlaceDisplay;
  v15 = [(RTHistoryEntryPlaceDisplay *)&v24 init];
  if (v15)
  {
    uint64_t v16 = [v10 copy];
    identifier = v15->_identifier;
    v15->_identifier = (NSUUID *)v16;

    uint64_t v18 = [v11 copy];
    usageDate = v15->_usageDate;
    v15->_usageDate = (NSDate *)v18;

    objc_storeStrong((id *)&v15->_location, a5);
    objc_storeStrong((id *)&v15->_mapItem, a6);
  }
  self = v15;
  v20 = self;
LABEL_13:

  return v20;
}

- (id)description
{
  v3 = NSString;
  identifier = self->_identifier;
  v5 = [(NSDate *)self->_usageDate stringFromDate];
  v6 = [v3 stringWithFormat:@"identifier, %@, usageDate, %@, location, %@, mapItem, %@", identifier, v5, self->_location, self->_mapItem];

  return v6;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)usageDate
{
  return self->_usageDate;
}

- (RTLocation)location
{
  return self->_location;
}

- (RTMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_usageDate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end