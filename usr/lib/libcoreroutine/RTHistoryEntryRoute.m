@interface RTHistoryEntryRoute
- (BOOL)navigationWasInterrupted;
- (NSDate)usageDate;
- (NSUUID)identifier;
- (RTHistoryEntryRoute)init;
- (RTHistoryEntryRoute)initWithIdentifier:(id)a3 usageDate:(id)a4 originLocation:(id)a5 originMapItem:(id)a6 destinationLocation:(id)a7 destinationMapItem:(id)a8 navigationWasInterrupted:(BOOL)a9;
- (RTLocation)destinationLocation;
- (RTLocation)originLocation;
- (RTMapItem)destinationMapItem;
- (RTMapItem)originMapItem;
- (id)description;
@end

@implementation RTHistoryEntryRoute

- (RTHistoryEntryRoute)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_usageDate_originLocation_originMapItem_destinationLocation_destinationMapItem_navigationWasInterrupted_);
}

- (RTHistoryEntryRoute)initWithIdentifier:(id)a3 usageDate:(id)a4 originLocation:(id)a5 originMapItem:(id)a6 destinationLocation:(id)a7 destinationMapItem:(id)a8 navigationWasInterrupted:(BOOL)a9
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v30 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = v19;
  if (!v18)
  {
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[RTHistoryEntryRoute initWithIdentifier:usageDate:originLocation:originMapItem:destinationLocation:destinat"
            "ionMapItem:navigationWasInterrupted:]";
      __int16 v34 = 1024;
      int v35 = 33;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationLocation (in %s:%d)", buf, 0x12u);
    }

    if (v20) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (!v19)
  {
LABEL_9:
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[RTHistoryEntryRoute initWithIdentifier:usageDate:originLocation:originMapItem:destinationLocation:destinat"
            "ionMapItem:navigationWasInterrupted:]";
      __int16 v34 = 1024;
      int v35 = 34;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationMapItem (in %s:%d)", buf, 0x12u);
    }

LABEL_12:
    v26 = 0;
    goto LABEL_13;
  }
  v31.receiver = self;
  v31.super_class = (Class)RTHistoryEntryRoute;
  v21 = [(RTHistoryEntryRoute *)&v31 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    identifier = v21->_identifier;
    v21->_identifier = (NSUUID *)v22;

    uint64_t v24 = [v16 copy];
    usageDate = v21->_usageDate;
    v21->_usageDate = (NSDate *)v24;

    objc_storeStrong((id *)&v21->_originLocation, a5);
    objc_storeStrong((id *)&v21->_originMapItem, a6);
    objc_storeStrong((id *)&v21->_destinationLocation, a7);
    objc_storeStrong((id *)&v21->_destinationMapItem, a8);
    v21->_navigationWasInterrupted = a9;
  }
  self = v21;
  v26 = self;
LABEL_13:

  return v26;
}

- (id)description
{
  v3 = NSString;
  identifier = self->_identifier;
  uint64_t v5 = [(NSDate *)self->_usageDate stringFromDate];
  v6 = (void *)v5;
  if (self->_navigationWasInterrupted) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v8 = [v3 stringWithFormat:@"identifier, %@, usageDate, %@, originLocation, %@, originMapItem, %@, destinationLocation, %@, destinationMapItem, %@, navigationWasInterrupted, %@", identifier, v5, *(_OWORD *)&self->_originLocation, self->_destinationLocation, self->_destinationMapItem, v7];

  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)usageDate
{
  return self->_usageDate;
}

- (RTLocation)originLocation
{
  return self->_originLocation;
}

- (RTMapItem)originMapItem
{
  return self->_originMapItem;
}

- (RTLocation)destinationLocation
{
  return self->_destinationLocation;
}

- (RTMapItem)destinationMapItem
{
  return self->_destinationMapItem;
}

- (BOOL)navigationWasInterrupted
{
  return self->_navigationWasInterrupted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationMapItem, 0);
  objc_storeStrong((id *)&self->_destinationLocation, 0);
  objc_storeStrong((id *)&self->_originMapItem, 0);
  objc_storeStrong((id *)&self->_originLocation, 0);
  objc_storeStrong((id *)&self->_usageDate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end