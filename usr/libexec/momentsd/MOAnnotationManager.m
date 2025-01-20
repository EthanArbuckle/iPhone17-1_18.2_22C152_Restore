@interface MOAnnotationManager
- (MOAnnotationManager)initWithUniverse:(id)a3;
- (MODaemonUniverse)fUniverse;
- (MOTimeZoneManager)timeZoneManager;
- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5;
@end

@implementation MOAnnotationManager

- (MOAnnotationManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MOAnnotationManager;
  v6 = [(MOAnnotationManager *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fUniverse, a3);
    fUniverse = v7->_fUniverse;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    uint64_t v11 = [(MODaemonUniverse *)fUniverse getService:v10];
    timeZoneManager = v7->_timeZoneManager;
    v7->_timeZoneManager = (MOTimeZoneManager *)v11;
  }
  return v7;
}

- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5
{
  v7 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MOAnnotationManager performAnnotationWithEvents:withPatternEvents:handler:](v7);
  }

  v8 = +[NSAssertionHandler currentHandler];
  [v8 handleFailureInMethod:a2 object:self file:@"MOAnnotationManager.m" lineNumber:36 description:@"Use the derived class (in %s:%d)", "-[MOAnnotationManager performAnnotationWithEvents:withPatternEvents:handler:]", 36];
}

- (MODaemonUniverse)fUniverse
{
  return self->_fUniverse;
}

- (MOTimeZoneManager)timeZoneManager
{
  return self->_timeZoneManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneManager, 0);

  objc_storeStrong((id *)&self->_fUniverse, 0);
}

- (void)performAnnotationWithEvents:(os_log_t)log withPatternEvents:handler:.cold.1(os_log_t log)
{
  int v1 = 136315394;
  v2 = "-[MOAnnotationManager performAnnotationWithEvents:withPatternEvents:handler:]";
  __int16 v3 = 1024;
  int v4 = 36;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Use the derived class (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end