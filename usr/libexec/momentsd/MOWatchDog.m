@interface MOWatchDog
- (BOOL)setCadenceSeconds:(float)a3;
- (MOWatchDog)initWithName:(id)a3 cadenceInSeconds:(float)a4 andHandler:(id)a5;
- (double)_pet;
- (float)getCadenceSeconds;
- (void)_cancel;
- (void)_pet;
- (void)cancel;
- (void)dealloc;
- (void)pet;
@end

@implementation MOWatchDog

- (MOWatchDog)initWithName:(id)a3 cadenceInSeconds:(float)a4 andHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v27.receiver = self;
  v27.super_class = (Class)MOWatchDog;
  id v10 = [(MOWatchDog *)&v27 init];
  if (v10)
  {
    id v11 = [v8 copy];
    v12 = (void *)*((void *)v10 + 1);
    *((void *)v10 + 1) = v11;

    id v13 = +[NSString stringWithFormat:@"MOWatchDog:%@", v8];
    v14 = (const char *)[v13 UTF8String];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create(v14, v15);
    v17 = (void *)*((void *)v10 + 4);
    *((void *)v10 + 4) = v16;

    dispatch_source_t v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v10 + 4));
    v19 = (void *)*((void *)v10 + 3);
    *((void *)v10 + 3) = v18;

    objc_initWeak(&location, v10);
    v20 = *((void *)v10 + 3);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = __55__MOWatchDog_initWithName_cadenceInSeconds_andHandler___block_invoke;
    handler[3] = &unk_1002CB2B0;
    objc_copyWeak(&v25, &location);
    dispatch_source_set_event_handler(v20, handler);
    dispatch_resume(*((dispatch_object_t *)v10 + 3));
    *(float *)&double v21 = a4;
    [v10 setCadenceSeconds:v21];
    id v22 = v10;
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return (MOWatchDog *)v10;
}

void __55__MOWatchDog_initWithName_cadenceInSeconds_andHandler___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    int v3 = *((_DWORD *)WeakRetained + 5);
    v4 = _mo_log_facility_get_os_log(&MOLogFacilityWatchDog);
    v5 = v4;
    if (v3 >= 18)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        __55__MOWatchDog_initWithName_cadenceInSeconds_andHandler___block_invoke_cold_1();
      }

      v26[0] = @"Name";
      id v13 = [v2[1] copy];
      v27[0] = v13;
      v26[1] = @"SuccessiveWarningCount";
      v14 = +[NSNumber numberWithInt:*((unsigned int *)v2 + 5)];
      v26[2] = @"Fatal";
      v27[1] = v14;
      v27[2] = &off_1002F4D78;
      v15 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
      AnalyticsSendEvent();

      exit(255);
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v2[1] UTF8String];
      double v7 = *((float *)v2 + 4);
      int v8 = *((_DWORD *)v2 + 5);
      *(_DWORD *)buf = 134218754;
      v19 = v2;
      __int16 v20 = 2080;
      id v21 = v6;
      __int16 v22 = 2048;
      double v23 = v7;
      __int16 v24 = 1024;
      int v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Watch dog [0x%p:%s] was not petted on time; [%f] seconds elapsed, this happened %i time(s) before!",
        buf,
        0x26u);
    }

    ++*((_DWORD *)v2 + 5);
    id v9 = [v2[1] copy:@"Name"];
    v17[0] = v9;
    v16[1] = @"SuccessiveWarningCount";
    id v10 = +[NSNumber numberWithInt:*((unsigned int *)v2 + 5)];
    v16[2] = @"Fatal";
    v17[1] = v10;
    v17[2] = &off_1002F4D90;
    id v11 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
    AnalyticsSendEvent();

    v12 = (void (**)(id, void))v2[5];
    if (v12) {
      v12[2](v12, *((unsigned int *)v2 + 5));
    }
  }
}

- (void)dealloc
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_1(v0);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v1, v2, "Watch dog [0x%p:%s] destructing", v3, v4, v5, v6, v7);
}

- (float)getCadenceSeconds
{
  return self->_cadenceSeconds;
}

- (BOOL)setCadenceSeconds:(float)a3
{
  if (a3 <= 0.0)
  {
    uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityWatchDog);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[MOWatchDog setCadenceSeconds:](v4, a3);
    }
  }
  else
  {
    self->_cadenceSeconds = a3;
    [(MOWatchDog *)self pet];
  }
  return a3 > 0.0;
}

- (void)pet
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __17__MOWatchDog_pet__block_invoke;
  v4[3] = &unk_1002CB2B0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __17__MOWatchDog_pet__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _pet];
    id WeakRetained = v2;
  }
}

- (void)_pet
{
  if (self->_failureCount)
  {
    uint64_t v3 = _mo_log_facility_get_os_log(&MOLogFacilityWatchDog);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [(NSString *)self->_name UTF8String];
      int failureCount = self->_failureCount;
      int v10 = 134218498;
      id v11 = self;
      __int16 v12 = 2080;
      id v13 = v4;
      __int16 v14 = 1024;
      int v15 = failureCount;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Watch dog [0x%p:%s] recovered from %i earlier failures!", (uint8_t *)&v10, 0x1Cu);
    }
  }
  [(MOWatchDog *)self _cancel];
  uint64_t v6 = _mo_log_facility_get_os_log(&MOLogFacilityWatchDog);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[MOWatchDog _pet]();
  }

  unint64_t v7 = (unint64_t)(float)(self->_cadenceSeconds * 1000000000.0);
  source = self->_source;
  dispatch_time_t v9 = dispatch_time(0, v7);
  dispatch_source_set_timer(source, v9, v7, 0);
}

- (void)cancel
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __20__MOWatchDog_cancel__block_invoke;
  v4[3] = &unk_1002CB2B0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __20__MOWatchDog_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _cancel];
    id WeakRetained = v2;
  }
}

- (void)_cancel
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_1(v0);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v1, v2, "Watch dog [0x%p:%s] canceling check-in callback", v3, v4, v5, v6, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

void __55__MOWatchDog_initWithName_cadenceInSeconds_andHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_1(v1);
  OUTLINED_FUNCTION_0_10();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Watch dog [0x%p:%s] died of no petting - Exiting process!", v2, 0x16u);
}

- (void)setCadenceSeconds:(os_log_t)log .cold.1(os_log_t log, float a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid cadence value %f", (uint8_t *)&v2, 0xCu);
}

- (double)_pet
{
  OUTLINED_FUNCTION_2_3();
  id v3 = [*(id *)(v2 + 8) UTF8String];
  double v4 = *(float *)(v1 + 16);
  int v6 = 134218498;
  uint64_t v7 = v1;
  __int16 v8 = 2080;
  id v9 = v3;
  __int16 v10 = 2048;
  double v11 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Watch dog [0x%p:%s] scheduling check-in callback (%f seconds timeout)", (uint8_t *)&v6, 0x20u);
  return result;
}

@end