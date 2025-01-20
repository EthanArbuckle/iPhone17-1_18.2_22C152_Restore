@interface MOTrendBundler
- (BOOL)configure:(id)a3;
- (MOTrendBundler)init;
- (MOTrendBundler)initWithPredicate:(id)a3 andAnnotator:(id)a4;
- (NSString)trendDetectorName;
- (id)processPatternEvents:(id)a3 withEvents:(id)a4;
- (void)setAnnotator:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setTrendDetectorName:(id)a3;
@end

@implementation MOTrendBundler

- (MOTrendBundler)init
{
  v8.receiver = self;
  v8.super_class = (Class)MOTrendBundler;
  v2 = [(MOTrendBundler *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    configuration = v2->_configuration;
    v2->_configuration = (NSDictionary *)v3;

    predicate = v2->_predicate;
    v2->_predicate = 0;

    annotator = v2->_annotator;
    v2->_annotator = 0;
  }
  return v2;
}

- (MOTrendBundler)initWithPredicate:(id)a3 andAnnotator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MOTrendBundler;
  objc_super v8 = [(MOTrendBundler *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    configuration = v8->_configuration;
    v8->_configuration = (NSDictionary *)v9;

    [(MOTrendBundler *)v8 setPredicate:v6];
    [(MOTrendBundler *)v8 setAnnotator:v7];
  }

  return v8;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
  id v5 = a3;
  [(MOTrendBundlerPredicate *)self->_predicate configure:self->_configuration];
}

- (void)setAnnotator:(id)a3
{
  objc_storeStrong((id *)&self->_annotator, a3);
  id v5 = a3;
  [(MOTrendBundlerAnnotator *)self->_annotator configure:self->_configuration];
}

- (BOOL)configure:(id)a3
{
  v4 = (NSDictionary *)[a3 copy];
  configuration = self->_configuration;
  self->_configuration = v4;

  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    unsigned int v6 = [(MOTrendBundlerPredicate *)self->_predicate configure:self->_configuration];
  }
  else {
    unsigned int v6 = 1;
  }
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    v6 &= [(MOTrendBundlerAnnotator *)self->_annotator configure:self->_configuration];
  }
  return v6;
}

- (id)processPatternEvents:(id)a3 withEvents:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    trendDetectorName = self->_trendDetectorName;
    *(_DWORD *)buf = 138412290;
    v26 = trendDetectorName;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Creating trend bundles from events for %@...", buf, 0xCu);
  }

  if (!self->_predicate)
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MOTrendBundler processPatternEvents:withEvents:]((uint64_t)self);
    }

    objc_super v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MOTrendBundler.m", 77, @"No trend bundle predicate strategy was defined for %@ (in %s:%d)", self->_trendDetectorName, "-[MOTrendBundler processPatternEvents:withEvents:]", 77 object file lineNumber description];
  }
  if (!self->_annotator)
  {
    v13 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MOTrendBundler processPatternEvents:withEvents:]((uint64_t)self);
    }

    v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"MOTrendBundler.m", 78, @"No trend bundle annotator strategy was defined for %@ (in %s:%d)", self->_trendDetectorName, "-[MOTrendBundler processPatternEvents:withEvents:]", 78 object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    [(MOTrendBundlerPredicate *)self->_predicate reset];
  }
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    [(MOTrendBundlerAnnotator *)self->_annotator reset];
  }
  v15 = [(MOTrendBundlerPredicate *)self->_predicate filterEvents:v7];
  v16 = [(MOTrendBundlerAnnotator *)self->_annotator createTrendBundlesFrom:v15 withEvents:v8];

  if (v16 && [v16 count])
  {
    v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      goto LABEL_22;
    }
    v18 = (NSString *)[v16 count];
    v19 = self->_trendDetectorName;
    *(_DWORD *)buf = 134218242;
    v26 = v18;
    __int16 v27 = 2112;
    v28 = v19;
    v20 = "Detected %lu trend bundles for %@";
    v21 = v17;
    uint32_t v22 = 22;
  }
  else
  {
    v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      goto LABEL_22;
    }
    v23 = self->_trendDetectorName;
    *(_DWORD *)buf = 138412290;
    v26 = v23;
    v20 = "No trend bundles detected for %@";
    v21 = v17;
    uint32_t v22 = 12;
  }
  _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v20, buf, v22);
LABEL_22:

  return v16;
}

- (NSString)trendDetectorName
{
  return self->_trendDetectorName;
}

- (void)setTrendDetectorName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendDetectorName, 0);
  objc_storeStrong((id *)&self->_annotator, 0);
  objc_storeStrong((id *)&self->_predicate, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)processPatternEvents:(uint64_t)a1 withEvents:.cold.1(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v3 = 138412802;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_0_3();
  int v5 = 78;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "No trend bundle annotator strategy was defined for %@ (in %s:%d)", (uint8_t *)&v3, 0x1Cu);
}

- (void)processPatternEvents:(uint64_t)a1 withEvents:.cold.2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v3 = 138412802;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_0_3();
  int v5 = 77;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "No trend bundle predicate strategy was defined for %@ (in %s:%d)", (uint8_t *)&v3, 0x1Cu);
}

@end