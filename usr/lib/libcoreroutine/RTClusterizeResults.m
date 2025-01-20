@interface RTClusterizeResults
- (NSArray)clusters;
- (NSArray)objectIDs;
- (RTClusterizeResults)initWithClusters:(id)a3 objectIDs:(id)a4;
- (void)setClusters:(id)a3;
- (void)setObjectIDs:(id)a3;
@end

@implementation RTClusterizeResults

- (RTClusterizeResults)initWithClusters:(id)a3 objectIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v12 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: clusters";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: objectIDs";
    goto LABEL_12;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTClusterizeResults;
  v10 = [(RTClusterizeResults *)&v16 init];
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_clusters, a3);
    objc_storeStrong(p_isa + 2, a4);
  }
  self = p_isa;
  v12 = self;
LABEL_10:

  return v12;
}

- (NSArray)clusters
{
  return self->_clusters;
}

- (void)setClusters:(id)a3
{
}

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (void)setObjectIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDs, 0);

  objc_storeStrong((id *)&self->_clusters, 0);
}

@end