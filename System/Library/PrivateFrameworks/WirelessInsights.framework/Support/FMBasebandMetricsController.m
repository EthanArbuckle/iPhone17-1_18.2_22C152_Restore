@interface FMBasebandMetricsController
+ (id)extractFMCongestionMetricFrom:(id)a3;
- (FMBasebandMetricsController)initWithFMModel:(id)a3 withSubscribedMetrics:(id)a4;
- (FMModel)fmModel;
- (dispatch_queue_s)queue;
- (id).cxx_construct;
- (shared_ptr<FMTelemetryObserver>)observer;
- (void)dealloc;
- (void)handleIncomingMetric:(id)a3 withXPCPayload:(dict)a4;
- (void)setFmModel:(id)a3;
- (void)setObserver:(shared_ptr<FMTelemetryObserver>)a3;
- (void)setQueue:(dispatch_queue_s *)a3;
@end

@implementation FMBasebandMetricsController

- (void)handleIncomingMetric:(id)a3 withXPCPayload:(dict)a4
{
  id v6 = a3;
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_100140318();
  }
  v7 = *(void **)a4.var0.fObj;
  xpc_object_t object = v7;
  if (v7) {
    xpc_retain(v7);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  id v12 = 0;
  v8 = +[WISXPCUtils dictionaryFromPrimitivesXPCDict:&object error:&v12];
  id v9 = v12;
  xpc_release(object);
  xpc_object_t object = 0;
  v10 = *(NSObject **)(qword_1001D8080 + 136);
  if (v9 || !v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001402A4();
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100140220();
    }
    v11 = [(FMBasebandMetricsController *)self fmModel];
    [v11 handleIncomingMetric:v6 withPayload:v8];
  }
}

+ (id)extractFMCongestionMetricFrom:(id)a3
{
  id v3 = a3;
  v55[0] = 0;
  v52 = +[FMUtil extractValueFromDict:v3 atKey:@"timestamp" ofExpectedClass:objc_opt_class() error:v55];
  id v4 = v55[0];
  id v54 = v4;
  v5 = +[FMUtil extractValueFromDict:v3 atKey:@"gci" ofExpectedClass:objc_opt_class() error:&v54];
  id v6 = v54;

  id v53 = v6;
  v7 = +[FMUtil extractValueFromDict:v3 atKey:@"subs_id" ofExpectedClass:objc_opt_class() error:&v53];
  id v8 = v53;

  v51 = v8;
  if (v8)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
      sub_10014038C();
    }
    id v9 = 0;
  }
  else
  {
    v48 = v5;
    v46 = v7;
    v50 = +[FMUtil extractValueFromDict:v3 atKey:@"arfcn" ofExpectedClass:objc_opt_class() orDefault:&off_1001C37F0];
    v49 = +[FMUtil extractValueFromDict:v3 atKey:@"rsrp_ewma" ofExpectedClass:objc_opt_class() orDefault:&off_1001C37F0];
    v47 = +[FMUtil extractValueFromDict:v3 atKey:@"rsrq_ewma" ofExpectedClass:objc_opt_class() orDefault:&off_1001C37F0];
    v45 = +[FMUtil extractValueFromDict:v3 atKey:@"sinr_ewma" ofExpectedClass:objc_opt_class() orDefault:&off_1001C37F0];
    v44 = +[FMUtil extractValueFromDict:v3 atKey:@"dl_bottleneck_score_invalid" ofExpectedClass:objc_opt_class() orDefault:&off_1001C37F0];
    v43 = +[FMUtil extractValueFromDict:v3 atKey:@"dl_bottleneck_score_no" ofExpectedClass:objc_opt_class() orDefault:&off_1001C37F0];
    v42 = +[FMUtil extractValueFromDict:v3 atKey:@"dl_bottleneck_score_low" ofExpectedClass:objc_opt_class() orDefault:&off_1001C37F0];
    v41 = +[FMUtil extractValueFromDict:v3 atKey:@"dl_bottleneck_score_medium" ofExpectedClass:objc_opt_class() orDefault:&off_1001C37F0];
    v40 = +[FMUtil extractValueFromDict:v3 atKey:@"dl_bottleneck_score_high" ofExpectedClass:objc_opt_class() orDefault:&off_1001C37F0];
    v39 = +[FMUtil extractValueFromDict:v3 atKey:@"ul_bottleneck_score_invalid" ofExpectedClass:objc_opt_class() orDefault:&off_1001C37F0];
    v38 = +[FMUtil extractValueFromDict:v3 atKey:@"ul_bottleneck_score_no" ofExpectedClass:objc_opt_class() orDefault:&off_1001C37F0];
    v37 = +[FMUtil extractValueFromDict:v3 atKey:@"ul_bottleneck_score_low" ofExpectedClass:objc_opt_class() orDefault:&off_1001C37F0];
    v36 = +[FMUtil extractValueFromDict:v3 atKey:@"ul_bottleneck_score_medium" ofExpectedClass:objc_opt_class() orDefault:&off_1001C37F0];
    v35 = +[FMUtil extractValueFromDict:v3 atKey:@"ul_bottleneck_score_high" ofExpectedClass:objc_opt_class() orDefault:&off_1001C37F0];
    v34 = +[FMUtil extractValueFromDict:v3 atKey:@"data_stall_indicator_avs" ofExpectedClass:objc_opt_class() orDefault:&off_1001C37F0];
    v33 = +[FMUtil extractValueFromDict:v3 atKey:@"data_stall_indicator_ul" ofExpectedClass:objc_opt_class() orDefault:&off_1001C37F0];
    v32 = +[FMUtil extractValueFromDict:v3 atKey:@"is_subway" ofExpectedClass:objc_opt_class() orDefault:&off_1001C37F0];
    v31 = +[FMUtil extractValueFromDict:v3 atKey:@"ps_pref" ofExpectedClass:objc_opt_class() orDefault:&off_1001C37F0];
    v30 = [FMCongestionMetric alloc];
    id v29 = [v52 unsignedLongValue];
    unsigned int v28 = [v50 unsignedIntValue];
    unsigned int v27 = [v49 intValue];
    unsigned int v26 = [v47 intValue];
    unsigned int v25 = [v45 intValue];
    unsigned int v24 = [v44 unsignedIntValue];
    unsigned int v23 = [v43 unsignedIntValue];
    unsigned int v22 = [v42 unsignedIntValue];
    unsigned int v21 = [v41 unsignedIntValue];
    HIDWORD(v20) = [v40 unsignedIntValue];
    unsigned int v10 = [v39 unsignedIntValue];
    unsigned int v11 = [v38 unsignedIntValue];
    unsigned int v12 = [v37 unsignedIntValue];
    unsigned int v13 = [v36 unsignedIntValue];
    unsigned int v14 = [v35 unsignedIntValue];
    unsigned int v15 = [v34 unsignedIntValue];
    unsigned int v16 = [v33 unsignedIntValue];
    unsigned int v17 = [v32 unsignedIntValue];
    unsigned int v18 = [v31 unsignedIntValue];
    LODWORD(v20) = [v46 unsignedIntValue];
    id v9 = -[FMCongestionMetric init:gci:arfnc:rsrp:rsrq:sinr:dlBottleneckScoreInvalid:dlBottleneckScoreNo:dlBottleneckScoreLow:dlBottleneckScoreMedium:dlBottleneckScoreHigh:ulBottleneckScoreInvalid:ulBottleneckScoreNo:ulBottleneckScoreLow:ulBottleneckScoreMedium:ulBottleneckScoreHigh:dataStallIndicatorAVS:dataStallIndicatorUL:isSubway:psPref:subsId:](v30, "init:gci:arfnc:rsrp:rsrq:sinr:dlBottleneckScoreInvalid:dlBottleneckScoreNo:dlBottleneckScoreLow:dlBottleneckScoreMedium:dlBottleneckScoreHigh:ulBottleneckScoreInvalid:ulBottleneckScoreNo:ulBottleneckScoreLow:ulBottleneckScoreMedium:ulBottleneckScoreHigh:dataStallIndicatorAVS:dataStallIndicatorUL:isSubway:psPref:subsId:", v29, v48, v28, v27, v26, v25, __PAIR64__(v23, v24), __PAIR64__(v21, v22), __PAIR64__(v10, HIDWORD(v20)), __PAIR64__(v12, v11), __PAIR64__(v14, v13), __PAIR64__(v16, v15), __PAIR64__(v18, v17), v20);

    v5 = v48;
    v7 = v46;
  }

  return v9;
}

- (dispatch_queue_s)queue
{
  return self->_queue;
}

- (FMModel)fmModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fmModel);

  return (FMModel *)WeakRetained;
}

- (FMBasebandMetricsController)initWithFMModel:(id)a3 withSubscribedMetrics:(id)a4
{
  id v17 = a3;
  id v16 = a4;
  v28.receiver = self;
  v28.super_class = (Class)FMBasebandMetricsController;
  id v6 = [(FMBasebandMetricsController *)&v28 init];
  v7 = v6;
  if (v6)
  {
    [(FMBasebandMetricsController *)v6 setFmModel:v17];
    [(FMBasebandMetricsController *)v7 setQueue:dispatch_queue_create("com.apple.wirelessinsightsd.FederatedMobility.BasebandMetricsController", 0)];
    if ([(FMBasebandMetricsController *)v7 queue])
    {
      v27[0] = 0;
      v27[1] = 0;
      unsigned int v26 = v27;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v8 = v16;
      id v9 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v23;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(v8);
            }
            unsigned int v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            unsigned int v13 = *(NSObject **)(qword_1001D8080 + 136);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(__p[0]) = 138412290;
              *(void **)((char *)__p + 4) = v12;
              _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMBasebandMetricsController]:#D Registering for metric: %@", (uint8_t *)__p, 0xCu);
            }
            sub_100018888(__p, (char *)[v12 UTF8String]);
            sub_10001FAA0(&v26, (const void **)__p, (uint64_t)__p);
            if (v30 < 0) {
              operator delete(__p[0]);
            }
          }
          id v9 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
        }
        while (v9);
      }

      objc_initWeak(&location, v7);
      sub_10001FB34(&location, (const void ***)&v26, &v19);
      [(FMBasebandMetricsController *)v7 setObserver:&v19];
      if (v20) {
        sub_10000B678(v20);
      }
      pthread_mutex_lock(&stru_1001D66E0);
      unsigned int v14 = (void *)xmmword_1001D6720;
      if (!(void)xmmword_1001D6720) {
        sub_100070FD4();
      }
      if (*((void *)&xmmword_1001D6720 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_1001D6720 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      pthread_mutex_unlock(&stru_1001D66E0);
      [(FMBasebandMetricsController *)v7 observer];
      long long v18 = *(_OWORD *)__p;
      __p[0] = 0;
      __p[1] = 0;
      sub_100071A34(v14, &v18);
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    sub_100140178();
  }

  return 0;
}

- (void)dealloc
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_1001401EC();
  }
  if ([(FMBasebandMetricsController *)self queue]) {
    dispatch_release((dispatch_object_t)[(FMBasebandMetricsController *)self queue]);
  }
  v3.receiver = self;
  v3.super_class = (Class)FMBasebandMetricsController;
  [(FMBasebandMetricsController *)&v3 dealloc];
}

- (void)setFmModel:(id)a3
{
}

- (void)setQueue:(dispatch_queue_s *)a3
{
  self->_queue = a3;
}

- (shared_ptr<FMTelemetryObserver>)observer
{
  objc_copyCppObjectAtomic(v2, &self->_observer, (void (__cdecl *)(void *, const void *))sub_10001F4D0);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setObserver:(shared_ptr<FMTelemetryObserver>)a3
{
}

- (void).cxx_destruct
{
  cntrl = self->_observer.__cntrl_;
  if (cntrl) {
    sub_10000B678((std::__shared_weak_count *)cntrl);
  }

  objc_destroyWeak((id *)&self->_fmModel);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end