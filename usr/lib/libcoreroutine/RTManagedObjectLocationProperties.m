@interface RTManagedObjectLocationProperties
- (NSArray)latitudePropertyPath;
- (NSArray)longitudePropertyPath;
- (NSArray)referenceFramePropertyPath;
- (RTManagedObjectLocationProperties)initWithLatitudePropertyPath:(id)a3 longitudePropertyPath:(id)a4 referenceFramePropertyPath:(id)a5;
- (void)setLatitudePropertyPath:(id)a3;
- (void)setLongitudePropertyPath:(id)a3;
- (void)setReferenceFramePropertyPath:(id)a3;
@end

@implementation RTManagedObjectLocationProperties

- (RTManagedObjectLocationProperties)initWithLatitudePropertyPath:(id)a3 longitudePropertyPath:(id)a4 referenceFramePropertyPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: latitudePropertyPath";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    goto LABEL_18;
  }
  if (!v10)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: longitudePropertyPath";
    goto LABEL_17;
  }
  uint64_t v12 = [v9 count];
  if (v12 != [v10 count])
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: latitudePropertyPath.count == longitudePropertyPath.count";
    goto LABEL_17;
  }
  if (v11)
  {
    uint64_t v13 = [v9 count];
    if (v13 != [v11 count])
    {
      v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v18 = "Invalid parameter not satisfying: latitudePropertyPath.count == referenceFramePropertyPath.count";
        goto LABEL_17;
      }
LABEL_18:

      v16 = 0;
      goto LABEL_19;
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)RTManagedObjectLocationProperties;
  v14 = [(RTManagedObjectLocationProperties *)&v20 init];
  p_isa = (id *)&v14->super.isa;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_latitudePropertyPath, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }
  self = p_isa;
  v16 = self;
LABEL_19:

  return v16;
}

- (NSArray)latitudePropertyPath
{
  return self->_latitudePropertyPath;
}

- (void)setLatitudePropertyPath:(id)a3
{
}

- (NSArray)longitudePropertyPath
{
  return self->_longitudePropertyPath;
}

- (void)setLongitudePropertyPath:(id)a3
{
}

- (NSArray)referenceFramePropertyPath
{
  return self->_referenceFramePropertyPath;
}

- (void)setReferenceFramePropertyPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceFramePropertyPath, 0);
  objc_storeStrong((id *)&self->_longitudePropertyPath, 0);

  objc_storeStrong((id *)&self->_latitudePropertyPath, 0);
}

@end