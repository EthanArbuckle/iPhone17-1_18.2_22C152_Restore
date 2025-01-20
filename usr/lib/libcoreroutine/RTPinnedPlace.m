@interface RTPinnedPlace
- (RTMapItem)mapItem;
- (RTPinnedPlace)init;
- (RTPinnedPlace)initWithType:(unint64_t)a3 mapItem:(id)a4;
- (id)description;
- (unint64_t)type;
@end

@implementation RTPinnedPlace

- (RTPinnedPlace)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithType_mapItem_);
}

- (RTPinnedPlace)initWithType:(unint64_t)a3 mapItem:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v10 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: mapItem";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_9;
  }
  if (a3 >= 5)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: (type >= RTLearnedPlaceTypeUnknown && type <= RTLearnedPlaceTypeGym)";
    goto LABEL_12;
  }
  v14.receiver = self;
  v14.super_class = (Class)RTPinnedPlace;
  v8 = [(RTPinnedPlace *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_mapItem, a4);
  }
  self = v9;
  v10 = self;
LABEL_10:

  return v10;
}

- (id)description
{
  v3 = NSString;
  v4 = [(id)objc_opt_class() placeTypeToString:self->_type];
  v5 = [v3 stringWithFormat:@"type, %@, mapItem, %@", v4, self->_mapItem];

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (RTMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
}

@end