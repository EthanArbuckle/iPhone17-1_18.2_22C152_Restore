@interface RTVisit(RTExtensions)
- (id)initWithLearnedVisit:()RTExtensions;
@end

@implementation RTVisit(RTExtensions)

- (id)initWithLearnedVisit:()RTExtensions
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 creationDate];
    v7 = [v5 exitDate];
    if (v7) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = 1;
    }
    v9 = [v5 location];
    v10 = [v9 location];
    v11 = [v5 entryDate];
    v12 = [v5 exitDate];
    v13 = [v5 location];
    uint64_t v14 = [v13 dataPointCount];
    a1 = (id)[a1 initWithDate:v6 type:v8 location:v10 entry:v11 exit:v12 dataPointCount:v14 confidence:*MEMORY[0x1E4F5D010] placeInference:0];

    id v15 = a1;
  }
  else
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedVisit", buf, 2u);
    }

    id v15 = 0;
  }

  return v15;
}

@end