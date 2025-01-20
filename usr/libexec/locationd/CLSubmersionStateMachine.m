@interface CLSubmersionStateMachine
- (CLSubmersionStateMachine)initWithType:(int64_t)a3;
- (double)deepThreshold;
- (double)nearDepthLimitThreshold;
- (double)pastMaxDepthThreshold;
- (double)sensorErrorThreshold;
- (int64_t)getType;
- (int64_t)stateFromDepth:(id)a3 forceSubmersion:(BOOL)a4;
- (int64_t)type;
- (void)initializeThresholds;
- (void)setType:(int64_t)a3;
@end

@implementation CLSubmersionStateMachine

- (CLSubmersionStateMachine)initWithType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLSubmersionStateMachine;
  v4 = [(CLSubmersionStateMachine *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    [(CLSubmersionStateMachine *)v4 initializeThresholds];
  }
  return v5;
}

- (void)initializeThresholds
{
  double v3 = 6.0;
  if (self->_type != 1) {
    goto LABEL_9;
  }
  self->_double maxDepth = 40.0;
  int v4 = MGGetSInt32Answer();
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_102305C40);
  }
  v5 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    float v21 = *(float *)&v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Max depth from gestalt, %d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_102305C40);
    }
    float v16 = 1.5047e-36;
    int v17 = v4;
    v15 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSubmersionStateMachine initializeThresholds]", "%s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
  }
  if (v4 >= 1)
  {
    double v3 = (double)v4;
LABEL_9:
    self->_double maxDepth = v3;
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_102305C40);
  }
  v6 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    int64_t type = self->_type;
    double maxDepth = self->_maxDepth;
    *(_DWORD *)buf = 67109376;
    float v21 = *(float *)&type;
    __int16 v22 = 2048;
    double v23 = maxDepth;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "initializing submersion thresholds,type,%d,maxdepth,%f", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_102305C40);
    }
    int64_t v12 = self->_type;
    double v13 = self->_maxDepth;
    float v16 = 1.5047e-36;
    int v17 = v12;
    __int16 v18 = 2048;
    double v19 = v13;
    v14 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSubmersionStateMachine initializeThresholds]", "%s\n", v14);
    if (v14 != (char *)buf) {
      free(v14);
    }
  }
  float v16 = 1.0;
  sub_101A22680(buf, "DeepDepthMeters", &v16, 0);
  self->_deepThreshold = v21;
  float v9 = self->_maxDepth * 0.875;
  float v16 = v9;
  sub_101A22680(buf, "NearDepthLimitMeters", &v16, 0);
  self->_nearDepthLimitThreshold = v21;
  float v10 = self->_maxDepth;
  float v16 = v10;
  sub_101A22680(buf, "PastMaxDepthMeters", &v16, 0);
  self->_pastMaxDepthThreshold = v21;
  float v11 = self->_maxDepth * 1.1;
  float v16 = v11;
  sub_101A22680(buf, "SensorErrorDepthMeters", &v16, 0);
  self->_sensorErrorThreshold = v21;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
  [(CLSubmersionStateMachine *)self initializeThresholds];
}

- (int64_t)getType
{
  return self->_type;
}

- (int64_t)stateFromDepth:(id)a3 forceSubmersion:(BOOL)a4
{
  if ((uint64_t)[a3 state] > 199 || a4)
  {
    [a3 depth];
    if (v11 <= self->_sensorErrorThreshold)
    {
      [a3 depth];
      if (v12 <= self->_pastMaxDepthThreshold)
      {
        [a3 depth];
        if (v13 <= self->_nearDepthLimitThreshold)
        {
          [a3 depth];
          if (v14 <= self->_deepThreshold) {
            return 200;
          }
          else {
            return 300;
          }
        }
        else
        {
          return 400;
        }
      }
      else
      {
        return 500;
      }
    }
    else
    {
      return 600;
    }
  }
  else
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_102305C40);
    }
    objc_super v7 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [a3 state];
      [a3 depth];
      *(_DWORD *)buf = 134218240;
      id v17 = v8;
      __int16 v18 = 2048;
      uint64_t v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "not updating client state because not submerged,state,%ld,depth,%f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_102305C40);
      }
      [a3 state];
      [a3 depth];
      v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSubmersionStateMachine stateFromDepth:forceSubmersion:]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
    return (int64_t)[a3 state];
  }
}

- (double)deepThreshold
{
  return self->_deepThreshold;
}

- (double)nearDepthLimitThreshold
{
  return self->_nearDepthLimitThreshold;
}

- (double)pastMaxDepthThreshold
{
  return self->_pastMaxDepthThreshold;
}

- (double)sensorErrorThreshold
{
  return self->_sensorErrorThreshold;
}

- (int64_t)type
{
  return self->_type;
}

@end