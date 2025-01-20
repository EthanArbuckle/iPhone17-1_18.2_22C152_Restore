@interface CMStrideCalibrationElevationBuffer
- (id).cxx_construct;
- (void)ageOutElevationArray;
- (void)feedElevationData:(const NotificationData *)a3;
- (void)updateGradient:(id)a3;
@end

@implementation CMStrideCalibrationElevationBuffer

- (void)ageOutElevationArray
{
  double Current = CFAbsoluteTimeGetCurrent();
  unint64_t value = self->fElevationWindow.__size_.__value_;
  if (value)
  {
    double v5 = Current;
    do
    {
      if (v5
         - (*(CLElevationChangeEntry **)((char *)self->fElevationWindow.__map_.__begin_
                                       + ((self->fElevationWindow.__start_ >> 3) & 0x1FFFFFFFFFFFFFF8)))[self->fElevationWindow.__start_ & 0x3F].var1 <= 600.0)
        break;
      ++self->fElevationWindow.__start_;
      self->fElevationWindow.__size_.__value_ = value - 1;
      sub_10017E0A8((uint64_t)&self->fElevationWindow, 1);
      unint64_t value = self->fElevationWindow.__size_.__value_;
    }
    while (value);
  }
}

- (void)feedElevationData:(const NotificationData *)a3
{
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_102320790);
  }
  double v5 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)a3;
    uint64_t v7 = *((void *)a3 + 1);
    int v8 = *((_DWORD *)a3 + 4);
    int v9 = *((_DWORD *)a3 + 5);
    *(_DWORD *)buf = 134218752;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    __int16 v15 = 1024;
    int v16 = v8;
    __int16 v17 = 1024;
    int v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Elevation, %f, %f, %d, %d", buf, 0x22u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_102320790);
    }
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrationElevationBuffer feedElevationData:]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  [(CMStrideCalibrationElevationBuffer *)self ageOutElevationArray];
  sub_101329DA8(&self->fElevationWindow.__map_.__first_, (long long *)a3);
}

- (void)updateGradient:(id)a3
{
  if ([a3 gradientValidity] == (id)-1)
  {
    [objc_msgSend(objc_msgSend(objc_msgSend(a3, "track"), "start"), "timeIntervalSinceReferenceDate");
    double v6 = v5;
    [objc_msgSend(objc_msgSend(objc_msgSend(a3, "track"), "stop"), "timeIntervalSinceReferenceDate");
    unint64_t start = self->fElevationWindow.__start_;
    begin = self->fElevationWindow.__map_.__begin_;
    end = self->fElevationWindow.__map_.__end_;
    v11 = (char *)&begin[start >> 6];
    if (end == begin)
    {
      unint64_t v12 = 0;
      unint64_t v15 = 0;
      unint64_t v13 = self->fElevationWindow.__size_.__value_ + start;
      uint64_t v14 = (char *)&begin[v13 >> 6];
    }
    else
    {
      unint64_t v12 = *(void *)v11 + ((self->fElevationWindow.__start_ & 0x3F) << 6);
      unint64_t v13 = self->fElevationWindow.__size_.__value_ + start;
      uint64_t v14 = (char *)&begin[v13 >> 6];
      unint64_t v15 = *(void *)v14 + ((v13 & 0x3F) << 6);
    }
    if (v15 != v12)
    {
      uint64_t v16 = ((uint64_t)(v15 - *(void *)v14) >> 6) + 8 * (v14 - v11);
      unint64_t v17 = v16 - ((uint64_t)(v12 - *(void *)v11) >> 6);
      if (v16 != (uint64_t)(v12 - *(void *)v11) >> 6)
      {
        int v18 = &begin[start >> 6];
        do
        {
          unint64_t v19 = v17 >> 1;
          if (v17 == 1)
          {
            unint64_t v20 = v12;
            v21 = v18;
          }
          else
          {
            uint64_t v22 = v19 + ((uint64_t)(v12 - (void)*v18) >> 6);
            if (v22 < 1)
            {
              unint64_t v23 = 63 - v22;
              LOBYTE(v22) = ~(63 - v22);
              v21 = &v18[-(v23 >> 6)];
            }
            else
            {
              v21 = &v18[(unint64_t)v22 >> 6];
            }
            unint64_t v20 = (unint64_t)&(*v21)[(unint64_t)(v22 & 0x3F)];
          }
          if (*(double *)(v20 + 8) < v6)
          {
            unint64_t v12 = v20 + 64;
            if (v20 + 64 - (void)*v21 == 4096)
            {
              unint64_t v24 = (unint64_t)v21[1];
              ++v21;
              unint64_t v12 = v24;
            }
            unint64_t v19 = v17 + ~v19;
            int v18 = v21;
          }
          unint64_t v17 = v19;
        }
        while (v19);
      }
    }
    if (end == begin)
    {
      unint64_t v25 = 0;
      unint64_t v26 = 0;
    }
    else
    {
      unint64_t v25 = *(void *)v11 + ((self->fElevationWindow.__start_ & 0x3F) << 6);
      unint64_t v26 = *(void *)v14 + ((v13 & 0x3F) << 6);
    }
    if (v26 != v25)
    {
      uint64_t v27 = ((uint64_t)(v26 - *(void *)v14) >> 6) + 8 * (v14 - v11);
      unint64_t v28 = v27 - ((uint64_t)(v25 - *(void *)v11) >> 6);
      if (v27 != (uint64_t)(v25 - *(void *)v11) >> 6)
      {
        do
        {
          unint64_t v29 = v28 >> 1;
          if (v28 == 1)
          {
            unint64_t v30 = v25;
            v31 = v11;
          }
          else
          {
            uint64_t v32 = v29 + ((uint64_t)(v25 - *(void *)v11) >> 6);
            if (v32 < 1)
            {
              unint64_t v33 = 63 - v32;
              LOBYTE(v32) = ~(63 - v32);
              v31 = &v11[-8 * (v33 >> 6)];
            }
            else
            {
              v31 = &v11[8 * ((unint64_t)v32 >> 6)];
            }
            unint64_t v30 = *(void *)v31 + ((unint64_t)(v32 & 0x3F) << 6);
          }
          if (*(double *)(v30 + 8) < v7)
          {
            unint64_t v25 = v30 + 64;
            if (v30 + 64 - *(void *)v31 == 4096)
            {
              unint64_t v34 = *((void *)v31 + 1);
              v31 += 8;
              unint64_t v25 = v34;
            }
            unint64_t v29 = v28 + ~v29;
            v11 = v31;
          }
          unint64_t v28 = v29;
        }
        while (v29);
      }
    }
    if (end == begin)
    {
      if (!v12) {
        return;
      }
      unint64_t v35 = 0;
    }
    else
    {
      unint64_t v35 = *(void *)v14 + ((v13 & 0x3F) << 6);
      if (v35 == v12) {
        return;
      }
    }
    if (v35 != v25)
    {
      unsigned int v36 = *(_DWORD *)(v25 + 16) - *(_DWORD *)(v12 + 16);
      unsigned int v37 = *(_DWORD *)(v25 + 20) - *(_DWORD *)(v12 + 20);
      [objc_msgSend(a3, "track") distanceGps];
      [a3 setGradient:((double)v36 - (double)v37) / v38];
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_102320790);
      }
      v39 = qword_102419038;
      if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
      {
        if ([a3 gradientValidity]) {
          v40 = "Success";
        }
        else {
          v40 = "Fail";
        }
        *(_DWORD *)buf = 136315906;
        v43 = v40;
        __int16 v44 = 2080;
        id v45 = [[objc_msgSend(a3, "description") UTF8String];
        __int16 v46 = 1024;
        unsigned int v47 = v36;
        __int16 v48 = 1024;
        unsigned int v49 = v37;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "TrackCalibration,%s,CalData,%s,ElevationAscended,%d,ElevationDescended,%d", buf, 0x22u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419030 != -1) {
          dispatch_once(&qword_102419030, &stru_102320790);
        }
        [a3 gradientValidity];
        [objc_msgSend(a3, "description") UTF8String];
        v41 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrationElevationBuffer updateGradient:]", "%s\n", v41);
        if (v41 != (char *)buf) {
          free(v41);
        }
      }
    }
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end