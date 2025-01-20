@interface CLElevationThresholdManager
- (BOOL)removeClient:(id)a3;
- (BOOL)updateWithAltitude:(float)a3 andAccuracy:(float)a4 upperBound:(float *)a5 lowerBound:(float *)a6;
- (CLElevationThresholdManager)init;
- (id).cxx_construct;
- (multimap<float,)getElevationThresholdProxyMap;
- (void)clearShouldAlert;
- (void)initializeThresholdsGivenAltitude:(float)a3 andAccuracy:(float)a4;
- (void)insertClient:(id)a3 withThreshold:(float)a4;
- (void)sendAnalyticsEventForId:(id)a3;
- (void)thresholdBoundsForElevation:(float)a3 andAccuracy:(float)a4 upperBound:(float *)a5 lowerBound:(float *)a6;
- (void)thresholdUpdated:(ThresholdClient *)a3 initialized:(BOOL)a4 above:(BOOL)a5;
- (void)updateAnalyticsWithAltitude:(float)a3;
- (void)updateInitializedThresholdsWithAltitude:(float)a3;
@end

@implementation CLElevationThresholdManager

- (CLElevationThresholdManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLElevationThresholdManager;
  v2 = [(CLElevationThresholdManager *)&v6 init];
  if (v2)
  {
    sub_101A22680(v4, "ElevationThresholdHysteresisBand", dword_101D52DD0, 0);
    v2->_hysteresisBand = v5;
  }
  return v2;
}

- (void)thresholdBoundsForElevation:(float)a3 andAccuracy:(float)a4 upperBound:(float *)a5 lowerBound:(float *)a6
{
  if (self->_elevationThresholdMap.__tree_.__pair3_.__value_)
  {
    begin_node = (CLElevationThresholdManager *)self->_elevationThresholdMap.__tree_.__begin_node_;
    p_pair1 = &self->_elevationThresholdMap.__tree_.__pair1_;
    if (begin_node != (CLElevationThresholdManager *)&self->_elevationThresholdMap.__tree_.__pair1_)
    {
      v11 = (float *)self->_elevationThresholdMap.__tree_.__begin_node_;
      do
      {
        if (a4 < 100.0)
        {
          float v12 = v11[8];
          if (v12 < a3)
          {
            if (*((unsigned char *)v11 + 40)) {
              *a6 = v12;
            }
          }
        }
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)*((void *)v11 + 1);
        if (left)
        {
          do
          {
            v14 = left;
            left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)left->__value_.__left_;
          }
          while (left);
        }
        else
        {
          do
          {
            v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)*((void *)v11 + 2);
            BOOL v15 = v14->__value_.__left_ == v11;
            v11 = (float *)v14;
          }
          while (!v15);
        }
        v11 = (float *)v14;
      }
      while (v14 != p_pair1);
      do
      {
        v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)p_pair1->__value_.__left_;
        if (a4 < 100.0)
        {
          v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)p_pair1->__value_.__left_;
          v18 = p_pair1;
          if (v16)
          {
            do
            {
              v19 = v17;
              v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)v17[1];
            }
            while (v17);
          }
          else
          {
            do
            {
              v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)v18[2].__value_.__left_;
              BOOL v15 = *v19 == v18;
              v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)v19;
            }
            while (v15);
          }
          if (*((float *)v19 + 8) > a3)
          {
            v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)p_pair1->__value_.__left_;
            v21 = p_pair1;
            if (v16)
            {
              do
              {
                v22 = v20;
                v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)v20[1];
              }
              while (v20);
            }
            else
            {
              do
              {
                v22 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)v21[2].__value_.__left_;
                BOOL v15 = *v22 == v21;
                v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)v22;
              }
              while (v15);
            }
            if (*((unsigned char *)v22 + 40))
            {
              v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)p_pair1->__value_.__left_;
              v24 = p_pair1;
              if (v16)
              {
                do
                {
                  v25 = v23;
                  v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)v23[1];
                }
                while (v23);
              }
              else
              {
                do
                {
                  v25 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)v24[2].__value_.__left_;
                  BOOL v15 = *v25 == v24;
                  v24 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)v25;
                }
                while (v15);
              }
              *a5 = *((float *)v25 + 8);
            }
          }
        }
        if (v16)
        {
          do
          {
            v26 = v16;
            v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)v16[1].__value_.__left_;
          }
          while (v16);
        }
        else
        {
          do
          {
            v26 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)p_pair1[2].__value_.__left_;
            BOOL v15 = v26->__value_.__left_ == p_pair1;
            p_pair1 = v26;
          }
          while (v15);
        }
        p_pair1 = v26;
      }
      while (v26 != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)begin_node);
    }
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022D3948);
    }
    v27 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      double v28 = *a6;
      double v29 = *a5;
      *(_DWORD *)buf = 134218496;
      double v32 = a3;
      __int16 v33 = 2048;
      double v34 = v28;
      __int16 v35 = 2048;
      double v36 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "currentAltitude,%f,thresholdLowerBound,%f,thresholdUpperBound,%f", buf, 0x20u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022D3948);
      }
      v30 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationThresholdManager thresholdBoundsForElevation:andAccuracy:upperBound:lowerBound:]", "%s\n", v30);
      if (v30 != (char *)buf) {
        free(v30);
      }
    }
  }
}

- (void)insertClient:(id)a3 withThreshold:(float)a4
{
  *(float *)buf = a4;
  *(_WORD *)&buf[8] = 0;
  *(void *)&buf[16] = a3;
  LOBYTE(v22) = 0;
  sub_1009110A0((uint64_t **)&self->_elevationThresholdMap, buf);
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *)self->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_;
  v7 = left;
  if (!left) {
    goto LABEL_12;
  }
  v10 = p_pair1;
  do
  {
    unint64_t v11 = (unint64_t)v7[4].__value_.__left_;
    _CF = v11 >= (unint64_t)a3;
    if (v11 >= (unint64_t)a3) {
      v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> **)v7;
    }
    else {
      v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> **)&v7[1];
    }
    if (_CF) {
      v10 = v7;
    }
    v7 = *v13;
  }
  while (*v13);
  if (v10 == p_pair1 || v10[4].__value_.__left_ > a3)
  {
LABEL_12:
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    *(void *)buf = a3;
    __asm { FMOV            V1.2D, #-1.0 }
    *(_OWORD *)&buf[8] = _Q1;
    unint64_t v22 = 0xBFF0000000000000;
    double v23 = a4;
    CFAbsoluteTime v24 = Current;
    sub_100911138((uint64_t **)&p_pair1[-1], (unint64_t *)buf, buf);
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022D3948);
  }
  v19 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a4;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "threshold client registered,client,%p,threshold,%f", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022D3948);
    }
    v20 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationThresholdManager insertClient:withThreshold:]", "%s\n", v20);
    if (v20 != buf) {
      free(v20);
    }
  }
}

- (BOOL)removeClient:(id)a3
{
  p_elevationThresholdMap = (uint64_t **)&self->_elevationThresholdMap;
  begin_node = (CLElevationThresholdManager *)self->_elevationThresholdMap.__tree_.__begin_node_;
  p_pair1 = &self->_elevationThresholdMap.__tree_.__pair1_;
  if (begin_node == (CLElevationThresholdManager *)&self->_elevationThresholdMap.__tree_.__pair1_)
  {
    int v7 = 0;
  }
  else
  {
    int v7 = 0;
    do
    {
      if ([begin_node->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_.__value_.__left_ isEqual:a3])
      {
        v8 = sub_1000F0A30(p_elevationThresholdMap, (uint64_t *)begin_node);
        operator delete(begin_node);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022D3948);
        }
        v9 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = a3;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "threshold client removed,client,%p", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022D3948);
          }
          float v12 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationThresholdManager removeClient:]", "%s\n", v12);
          if (v12 != buf) {
            free(v12);
          }
        }
        ++v7;
        begin_node = (CLElevationThresholdManager *)v8;
      }
      else
      {
        isa = (CLElevationThresholdManager *)begin_node->_elevationThresholdMap.__tree_.__begin_node_;
        if (isa)
        {
          do
          {
            begin_node = isa;
            isa = (CLElevationThresholdManager *)isa->super.isa;
          }
          while (isa);
        }
        else
        {
          do
          {
            unint64_t v11 = (objc_class *)begin_node;
            begin_node = (CLElevationThresholdManager *)begin_node->_elevationThresholdMap.__tree_.__pair1_.__value_.__left_;
          }
          while (begin_node->super.isa != v11);
        }
      }
    }
    while (begin_node != (CLElevationThresholdManager *)p_pair1);
  }
  *(void *)buf = a3;
  sub_100700910((uint64_t)&self->_elevationThresholdClientAnalyticsMap, (unint64_t *)buf);
  return v7 > 0;
}

- (multimap<float,)getElevationThresholdProxyMap
{
  return (multimap<float, CLBarometerCalibration_Types::ThresholdClient, std::less<float>, std::allocator<std::pair<const float, CLBarometerCalibration_Types::ThresholdClient>>> *)sub_1009111FC((uint64_t)retstr, (uint64_t)&self->_elevationThresholdMap);
}

- (void)initializeThresholdsGivenAltitude:(float)a3 andAccuracy:(float)a4
{
  begin_node = (float *)self->_elevationThresholdMap.__tree_.__begin_node_;
  p_pair1 = &self->_elevationThresholdMap.__tree_.__pair1_;
  if (begin_node != (float *)&self->_elevationThresholdMap.__tree_.__pair1_)
  {
    double v8 = a3;
    do
    {
      float v9 = begin_node[8];
      float hysteresisBand = self->_hysteresisBand;
      BOOL v11 = v9 <= (float)(hysteresisBand + a3) && v9 >= (float)(a3 - hysteresisBand);
      if (!*((unsigned char *)begin_node + 40) && !v11)
      {
        -[CLElevationThresholdManager thresholdUpdated:initialized:above:](self, "thresholdUpdated:initialized:above:");
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022D3948);
        }
        float v12 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
        {
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          double v14 = begin_node[8];
          double v15 = self->_hysteresisBand;
          int v16 = *((unsigned __int8 *)begin_node + 40);
          *(_DWORD *)buf = 134219008;
          CFAbsoluteTime v22 = Current;
          __int16 v23 = 2048;
          double v24 = v14;
          __int16 v25 = 2048;
          double v26 = v8;
          __int16 v27 = 2048;
          double v28 = v15;
          __int16 v29 = 1024;
          int v30 = v16;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "threshold initialized,timestamp,%f,threshold,%f,altitude,%f,hysteresis,%f,initialized,%d", buf, 0x30u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022D3948);
          }
          CFAbsoluteTimeGetCurrent();
          v20 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationThresholdManager initializeThresholdsGivenAltitude:andAccuracy:]", "%s\n", v20);
          if (v20 != (char *)buf) {
            free(v20);
          }
        }
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)*((void *)begin_node + 1);
      if (left)
      {
        do
        {
          v18 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)*((void *)begin_node + 2);
          BOOL v19 = v18->__value_.__left_ == begin_node;
          begin_node = (float *)v18;
        }
        while (!v19);
      }
      begin_node = (float *)v18;
    }
    while (v18 != p_pair1);
  }
}

- (void)thresholdUpdated:(ThresholdClient *)a3 initialized:(BOOL)a4 above:(BOOL)a5
{
  if (a3->var0 != a4 || a3->var1 != a5)
  {
    a3->var0 = a4;
    a3->var1 = a5;
    a3->var3 = 1;
  }
}

- (BOOL)updateWithAltitude:(float)a3 andAccuracy:(float)a4 upperBound:(float *)a5 lowerBound:(float *)a6
{
  [(CLElevationThresholdManager *)self clearShouldAlert];
  *(float *)&double v11 = a3;
  [(CLElevationThresholdManager *)self updateAnalyticsWithAltitude:v11];
  *(float *)&double v12 = a3;
  [(CLElevationThresholdManager *)self updateInitializedThresholdsWithAltitude:v12];
  *(float *)&double v13 = a3;
  *(float *)&double v14 = a4;
  [(CLElevationThresholdManager *)self initializeThresholdsGivenAltitude:v13 andAccuracy:v14];
  *(float *)&double v15 = a3;
  *(float *)&double v16 = a4;
  [(CLElevationThresholdManager *)self thresholdBoundsForElevation:a5 andAccuracy:a6 upperBound:v15 lowerBound:v16];
  if (*a5 == self->_currentElevationThreshold.upper && *a6 == self->_currentElevationThreshold.lower) {
    return 0;
  }
  self->_currentElevationThreshold.upper = *a5;
  self->_currentElevationThreshold.lower = *a6;
  return 1;
}

- (void)updateInitializedThresholdsWithAltitude:(float)a3
{
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)self->_elevationThresholdMap.__tree_.__begin_node_;
  p_pair1 = &self->_elevationThresholdMap.__tree_.__pair1_;
  if (begin_node != &self->_elevationThresholdMap.__tree_.__pair1_)
  {
    p_elevationThresholdClientAnalyticsMap = &self->_elevationThresholdClientAnalyticsMap;
    do
    {
      float v8 = *(float *)&begin_node[4].__value_.__left_;
      if (BYTE1(begin_node[5].__value_.__left_) != v8 < a3 && LOBYTE(begin_node[5].__value_.__left_))
      {
        [(CLElevationThresholdManager *)self thresholdUpdated:&begin_node[5] initialized:0 above:v8 < a3];
        [(CLElevationThresholdManager *)self sendAnalyticsEventForId:begin_node[6].__value_.__left_];
        sub_100700910((uint64_t)p_elevationThresholdClientAnalyticsMap, (unint64_t *)&begin_node[6]);
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v10 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v11 = v10->__value_.__left_ == begin_node;
          begin_node = v10;
        }
        while (!v11);
      }
      begin_node = v10;
    }
    while (v10 != p_pair1);
  }
}

- (void)clearShouldAlert
{
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)self->_elevationThresholdMap.__tree_.__begin_node_;
  if (begin_node != &self->_elevationThresholdMap.__tree_.__pair1_)
  {
    do
    {
      LOBYTE(begin_node[7].__value_.__left_) = 0;
      left = (CLElevationThresholdManager *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v4 = left;
          left = (CLElevationThresholdManager *)left->super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          v4 = (CLElevationThresholdManager *)begin_node[2].__value_.__left_;
          BOOL v5 = v4->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)v4;
        }
        while (!v5);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)v4;
    }
    while (v4 != (CLElevationThresholdManager *)&self->_elevationThresholdMap.__tree_.__pair1_);
  }
}

- (void)updateAnalyticsWithAltitude:(float)a3
{
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *)self->_elevationThresholdClientAnalyticsMap.__tree_.__begin_node_;
  if (begin_node != &self->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_)
  {
    double v4 = a3;
    do
    {
      double v5 = vabdd_f64(v4, *(double *)&begin_node[8].__value_.__left_);
      if (*(double *)&begin_node[5].__value_.__left_ < 0.0) {
        *(double *)&begin_node[5].__value_.__left_ = v5;
      }
      if (*(double *)&begin_node[7].__value_.__left_ >= v5) {
        double v5 = *(double *)&begin_node[7].__value_.__left_;
      }
      *(double *)&begin_node[7].__value_.__left_ = v5;
      left = (CLElevationThresholdManager *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          int v7 = left;
          left = (CLElevationThresholdManager *)left->super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          int v7 = (CLElevationThresholdManager *)begin_node[2].__value_.__left_;
          BOOL v8 = v7->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *)v7;
        }
        while (!v8);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *)v7;
    }
    while (v7 != (CLElevationThresholdManager *)&self->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_);
  }
}

- (void)sendAnalyticsEventForId:(id)a3
{
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *)self->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_;
  double v4 = left;
  if (left)
  {
    objc_super v6 = p_pair1;
    do
    {
      unint64_t v7 = (unint64_t)v4[4].__value_.__left_;
      BOOL v8 = v7 >= (unint64_t)a3;
      if (v7 >= (unint64_t)a3) {
        float v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> **)v4;
      }
      else {
        float v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> **)&v4[1];
      }
      if (v8) {
        objc_super v6 = v4;
      }
      double v4 = *v9;
    }
    while (*v9);
    if (v6 != p_pair1 && v6[4].__value_.__left_ <= a3)
    {
      *(CFAbsoluteTime *)&v6[6].__value_.__left_ = CFAbsoluteTimeGetCurrent() - *(double *)&v6[9].__value_.__left_;
      double v10 = *(double *)&v6[5].__value_.__left_;
      v42 = 0;
      uint64_t v43 = 0;
      __p = 0;
      sub_1001DD364(&__p, (const void *)qword_10247EE48, qword_10247EE50, (qword_10247EE50 - qword_10247EE48) >> 3);
      sub_100910A34((uint64_t)&__p, v44, v10);
      if (__p)
      {
        v42 = __p;
        operator delete(__p);
      }
      double v11 = *(double *)&v6[7].__value_.__left_;
      v37 = 0;
      uint64_t v38 = 0;
      double v36 = 0;
      sub_1001DD364(&v36, (const void *)qword_10247EE48, qword_10247EE50, (qword_10247EE50 - qword_10247EE48) >> 3);
      sub_100910A34((uint64_t)&v36, v39, v11);
      if (v36)
      {
        v37 = v36;
        operator delete(v36);
      }
      double v12 = *(double *)&v6[6].__value_.__left_;
      double v32 = 0;
      uint64_t v33 = 0;
      v31 = 0;
      sub_1001DD364(&v31, (const void *)qword_10247EE60, qword_10247EE68, (qword_10247EE68 - qword_10247EE60) >> 3);
      sub_100910A34((uint64_t)&v31, v34, v12);
      if (v31)
      {
        double v32 = v31;
        operator delete(v31);
      }
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022D3948);
      }
      double v13 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        double v15 = v6[4].__value_.__left_;
        double v16 = v6[5].__value_.__left_;
        v18 = v6[6].__value_.__left_;
        v17 = v6[7].__value_.__left_;
        *(_DWORD *)buf = 134219008;
        CFAbsoluteTime v57 = Current;
        __int16 v58 = 2048;
        v59 = v15;
        __int16 v60 = 2048;
        v61 = v16;
        __int16 v62 = 2048;
        v63 = v17;
        __int16 v64 = 2048;
        v65 = v18;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "threshold crossing analytics,timestamp,%f,client,%p,deltaElevationToThreshold,%f,maxDeltaElevationToCrossing,%f,timeToCrossing,%f", buf, 0x34u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022D3948);
        }
        CFAbsoluteTime v19 = CFAbsoluteTimeGetCurrent();
        v20 = v6[4].__value_.__left_;
        v21 = v6[5].__value_.__left_;
        __int16 v23 = v6[6].__value_.__left_;
        CFAbsoluteTime v22 = v6[7].__value_.__left_;
        int v46 = 134219008;
        CFAbsoluteTime v47 = v19;
        __int16 v48 = 2048;
        v49 = v20;
        __int16 v50 = 2048;
        v51 = v21;
        __int16 v52 = 2048;
        v53 = v22;
        __int16 v54 = 2048;
        v55 = v23;
        double v24 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationThresholdManager sendAnalyticsEventForId:]", "%s\n", v24);
        if (v24 != (char *)buf) {
          free(v24);
        }
      }
      if (SHIBYTE(v45) < 0)
      {
        sub_1000DC48C(&v25, v44[0], (unint64_t)v44[1]);
      }
      else
      {
        long long v25 = *(_OWORD *)v44;
        uint64_t v26 = v45;
      }
      if (SHIBYTE(v40) < 0)
      {
        sub_1000DC48C(&v27, v39[0], (unint64_t)v39[1]);
      }
      else
      {
        long long v27 = *(_OWORD *)v39;
        uint64_t v28 = v40;
      }
      if (SHIBYTE(v35) < 0)
      {
        sub_1000DC48C(&v29, v34[0], (unint64_t)v34[1]);
      }
      else
      {
        long long v29 = *(_OWORD *)v34;
        uint64_t v30 = v35;
      }
      AnalyticsSendEventLazy();
      if (SHIBYTE(v30) < 0) {
        operator delete((void *)v29);
      }
      if (SHIBYTE(v28) < 0) {
        operator delete((void *)v27);
      }
      if (SHIBYTE(v26) < 0) {
        operator delete((void *)v25);
      }
      if (SHIBYTE(v35) < 0) {
        operator delete(v34[0]);
      }
      if (SHIBYTE(v40) < 0) {
        operator delete(v39[0]);
      }
      if (SHIBYTE(v45) < 0) {
        operator delete(v44[0]);
      }
    }
  }
}

- (void).cxx_destruct
{
  sub_1000F5BB0((uint64_t)&self->_elevationThresholdClientAnalyticsMap, (void *)self->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_.__value_.__left_);
  left = self->_elevationThresholdMap.__tree_.__pair1_.__value_.__left_;

  sub_1000F5BB0((uint64_t)&self->_elevationThresholdMap, left);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 5) = (char *)self + 48;
  *((void *)self + 8) = 0xFF7FFFFF7F7FFFFFLL;
  return self;
}

@end