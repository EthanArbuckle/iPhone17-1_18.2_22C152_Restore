@interface MOHDBSCANClustering
- (MOHDBSCANClustering)initWithParameters:(id)a3;
- (double)_getEmbeddingDistanceFrom:(id)a3 to:(id)a4;
- (id).cxx_construct;
- (id)getClusterLabels;
- (id)getMembershipProbability;
- (id)getNormalizedClusterLabels;
- (id)getOutlierScoreDict;
- (vector<std::vector<double>,)_getDistanceMatrixFrom:(MOHDBSCANClustering *)self;
- (void)loadDistanceMatrix:()vector<std:(std::allocator<std::vector<double>>> *)a3 :vector<double>;
- (void)runHDBSCANClusteringOn:(id)a3;
@end

@implementation MOHDBSCANClustering

- (MOHDBSCANClustering)initWithParameters:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MOHDBSCANClustering;
  v6 = [(MOHDBSCANClustering *)&v8 init];
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clusteringParams, a3);
    operator new();
  }

  return 0;
}

- (void)runHDBSCANClusteringOn:(id)a3
{
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Start running HDBSCAN clustering", buf, 2u);
  }

  v6 = objc_opt_new();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __46__MOHDBSCANClustering_runHDBSCANClusteringOn___block_invoke;
  v18[3] = &unk_1002CD620;
  id v7 = v6;
  id v19 = v7;
  [v4 enumerateObjectsUsingBlock:v18];
  objc_storeStrong((id *)&self->_bundleIDs, v6);
  [(MOHDBSCANClustering *)self _getDistanceMatrixFrom:v4];
  if (self->_HDBSCAN.__ptr_.__value_)
  {
    memset(v15, 0, sizeof(v15));
    std::vector<std::vector<double>>::__init_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>(v15, *(uint64_t *)buf, v17, 0xAAAAAAAAAAAAAAABLL * ((v17 - *(void *)buf) >> 3));
    [(MOHDBSCANClustering *)self loadDistanceMatrix:v15];
    *(void *)v20 = v15;
    std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)v20);
    objc_super v8 = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unint64_t v9 = 0xAAAAAAAAAAAAAAABLL
         * ((uint64_t)(*((void *)self->_HDBSCAN.__ptr_.__value_ + 14) - *((void *)self->_HDBSCAN.__ptr_.__value_ + 13)) >> 3);
      *(_DWORD *)v20 = 134217984;
      *(void *)&v20[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "loaded distance matrix with size:%lu", v20, 0xCu);
    }

    int v10 = [(MOClusteringParams *)self->_clusteringParams minPoints];
    int v11 = [(MOClusteringParams *)self->_clusteringParams minClusterSize];
    value = (uint64_t *)self->_HDBSCAN.__ptr_.__value_;
    std::string::basic_string[abi:ne180100]<0>(&__p, "");
    Hdbscan::execute(value, v10, v11, &__p);
  }
  v13 = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[MOHDBSCANClustering runHDBSCANClusteringOn:](v13);
  }

  *(void *)v20 = buf;
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)v20);
}

void __46__MOHDBSCANClustering_runHDBSCANClusteringOn___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 bundleIdentifier];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    v6 = [v3 bundleIdentifier];
    id v7 = [v6 UUIDString];
    [v5 addObject:v7];
  }
  else
  {
    v6 = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46__MOHDBSCANClustering_runHDBSCANClusteringOn___block_invoke_cold_1((uint64_t)v3, v6);
    }
  }
}

- (id)getClusterLabels
{
  id v3 = objc_opt_new();
  uint64_t v4 = *((void *)self->_HDBSCAN.__ptr_.__value_ + 16);
  if (*((void *)self->_HDBSCAN.__ptr_.__value_ + 17) == v4)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Cluster label is empty", v9, 2u);
    }
  }
  else
  {
    unint64_t v5 = 0;
    do
    {
      v6 = +[NSNumber numberWithInt:*(unsigned int *)(v4 + 4 * v5)];
      [v3 addObject:v6];

      ++v5;
      uint64_t v4 = *((void *)self->_HDBSCAN.__ptr_.__value_ + 16);
    }
    while (v5 < (*((void *)self->_HDBSCAN.__ptr_.__value_ + 17) - v4) >> 2);
  }

  return v3;
}

- (id)getNormalizedClusterLabels
{
  id v3 = objc_opt_new();
  uint64_t v4 = *((void *)self->_HDBSCAN.__ptr_.__value_ + 19);
  if (*((void *)self->_HDBSCAN.__ptr_.__value_ + 20) == v4)
  {
    objc_super v8 = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Normalized cluster label is empty", v10, 2u);
    }

    id v7 = 0;
  }
  else
  {
    unint64_t v5 = 0;
    do
    {
      v6 = +[NSNumber numberWithInt:*(unsigned int *)(v4 + 4 * v5)];
      [v3 addObject:v6];

      ++v5;
      uint64_t v4 = *((void *)self->_HDBSCAN.__ptr_.__value_ + 19);
    }
    while (v5 < (*((void *)self->_HDBSCAN.__ptr_.__value_ + 20) - v4) >> 2);
    id v7 = v3;
  }

  return v7;
}

- (id)getOutlierScoreDict
{
  id v3 = objc_opt_new();
  if (*((void *)self->_HDBSCAN.__ptr_.__value_ + 23) == *((void *)self->_HDBSCAN.__ptr_.__value_ + 22)
    || (NSUInteger v4 = [(NSArray *)self->_bundleIDs count],
        value = self->_HDBSCAN.__ptr_.__value_,
        uint64_t v7 = *((void *)value + 22),
        uint64_t v6 = *((void *)value + 23),
        v4 != 0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3)))
  {
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "OutlierScores is empty or bundle id count and score count do not match. Returning empty dict", buf, 2u);
    }
  }
  else
  {
    for (; v7 != v6; v7 += 24)
    {
      double v8 = *(double *)(v7 + 8);
      int v9 = *(_DWORD *)(v7 + 16);
      int v11 = [(NSArray *)self->_bundleIDs objectAtIndex:v9];
      if (v11)
      {
        v12 = +[NSNumber numberWithDouble:v8];
        [v3 setObject:v12 forKeyedSubscript:v11];
      }
      v13 = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109634;
        int v17 = v9;
        __int16 v18 = 2112;
        id v19 = v11;
        __int16 v20 = 2048;
        double v21 = v8;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Current outlierScore: idx %d,bundleID %@,score %.3f", buf, 0x1Cu);
      }
    }
  }

  return v3;
}

- (id)getMembershipProbability
{
  id v3 = objc_opt_new();
  uint64_t v4 = *((void *)self->_HDBSCAN.__ptr_.__value_ + 25);
  if (*((void *)self->_HDBSCAN.__ptr_.__value_ + 26) == v4)
  {
    uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "MembershipProbability is empty", v9, 2u);
    }
  }
  else
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = +[NSNumber numberWithDouble:*(double *)(v4 + 8 * v5)];
      [v3 addObject:v6];

      ++v5;
      uint64_t v4 = *((void *)self->_HDBSCAN.__ptr_.__value_ + 25);
    }
    while (v5 < (*((void *)self->_HDBSCAN.__ptr_.__value_ + 26) - v4) >> 3);
  }

  return v3;
}

- (vector<std::vector<double>,)_getDistanceMatrixFrom:(MOHDBSCANClustering *)self
{
  id v17 = a4;
  int v6 = [v17 count];
  unint64_t v7 = v6;
  std::vector<std::vector<double>>::vector(retstr, v6);
  if (v6 >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v6;
    do
    {
      std::vector<double>::resize((uint64_t)retstr->var0 + 24 * v8, v7);
      if (v8)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          int v11 = [v17 objectAtIndex:v8];
          v12 = [v17 objectAtIndex:i];
          [(MOHDBSCANClustering *)self _getEmbeddingDistanceFrom:v11 to:v12];
          uint64_t v14 = v13;

          var0 = retstr->var0;
          *(void *)(*((void *)retstr->var0 + 3 * v8) + 8 * i) = v14;
          *(void *)(var0[3 * i] + 8 * v8) = v14;
        }
      }
      ++v8;
    }
    while (v8 != v9);
  }

  return result;
}

- (double)_getEmbeddingDistanceFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MOClusteringParams *)self->_clusteringParams embeddingDistanceWeights];
  [v6 getDistanceFrom:v7 withWeights:v8];
  double v10 = v9;

  return v10;
}

- (void)loadDistanceMatrix:()vector<std:(std::allocator<std::vector<double>>> *)a3 :vector<double>
{
  value = self->_HDBSCAN.__ptr_.__value_;
  if (value)
  {
    memset(v5, 0, sizeof(v5));
    std::vector<std::vector<double>>::__init_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>(v5, (uint64_t)a3->var0, (uint64_t)a3->var1, 0xAAAAAAAAAAAAAAABLL * (((char *)a3->var1 - (char *)a3->var0) >> 3));
    Hdbscan::loadDistanceMatrix((uint64_t)value, v5);
    *(void *)buf = v5;
    std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Distance matrix is loaded", buf, 2u);
    }
  }
  else
  {
    uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[MOHDBSCANClustering loadDistanceMatrix:](v4);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_clusteringParams, 0);

  std::unique_ptr<Hdbscan>::reset[abi:ne180100](&self->_HDBSCAN.__ptr_.__value_, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void)runHDBSCANClusteringOn:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "HDBSCAN was not instantiated", v1, 2u);
}

void __46__MOHDBSCANClustering_runHDBSCANClusteringOn___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Embedding has nil bundleID:%@. Early exit from clustering", (uint8_t *)&v2, 0xCu);
}

- (void)loadDistanceMatrix:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to load distance matrix since HDBSCAN was not instantiated", v1, 2u);
}

@end