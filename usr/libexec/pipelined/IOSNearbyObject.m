@interface IOSNearbyObject
- (BOOL)sensorPresent;
- (IOSNearbyObject)init;
- (IOSNearbyObject)initWithType:(int)a3 reducedRate:(BOOL)a4;
- (id).cxx_construct;
- (void)getSensor;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5;
- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4;
- (void)sessionSuspensionEnded:(id)a3;
- (void)sessionWasSuspended:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation IOSNearbyObject

- (IOSNearbyObject)initWithType:(int)a3 reducedRate:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)IOSNearbyObject;
  if ([(IOSNearbyObject *)&v5 init]) {
    operator new();
  }
  return 0;
}

- (BOOL)sensorPresent
{
  return +[NISession isSupported];
}

- (void)getSensor
{
  return self->_sensor.__ptr_.__value_;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

- (IOSNearbyObject)init
{
  return 0;
}

- (void)start
{
  if (qword_10047BED8 == -1)
  {
    v3 = qword_10047BEE0;
    if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG))
    {
LABEL_3:
      int64_t updateRate = self->_updateRate;
      if (self->_type == 1) {
        objc_super v5 = "anchor";
      }
      else {
        objc_super v5 = "mobile";
      }
      *(_DWORD *)buf = 136380931;
      v17 = v5;
      __int16 v18 = 1025;
      int v19 = updateRate;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Start ranging as %{private}s, rate %{private}d", buf, 0x12u);
    }
  }
  else
  {
    dispatch_once(&qword_10047BED8, &stru_1004690A8);
    v3 = qword_10047BEE0;
    if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_3;
    }
  }
  id v6 = objc_alloc((Class)NIRegionPredicate);
  LODWORD(v7) = 1112014848;
  id v8 = [v6 initWithName:@"LargeRange" radius:self->_updateRate preferredUpdateRate:v7];
  id v9 = objc_alloc((Class)NIHomeDeviceConfiguration);
  id v15 = v8;
  uint64_t v10 = +[NSArray arrayWithObjects:&v15 count:1];
  id v11 = [v9 initWithRegions:v10];

  [v11 setAnchor:self->_type == 1];
  [v11 setAllowedDevices:2];
  self->_running = 1;
  v12 = [(NISession *)self->_session discoveryToken];
  LOBYTE(v10) = v12 == 0;

  if ((v10 & 1) == 0) {
    [(NISession *)self->_session invalidate];
  }
  v13 = (NISession *)objc_alloc_init((Class)NISession);
  session = self->_session;
  self->_session = v13;

  [(NISession *)self->_session setDelegate:self];
  [(NISession *)self->_session runWithConfiguration:v11];
}

- (void)stop
{
  if (qword_10047BED8 != -1)
  {
    dispatch_once(&qword_10047BED8, &stru_1004690A8);
    v3 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v3 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Stop ranging", v4, 2u);
  }
LABEL_4:
  self->_running = 0;
  [(NISession *)self->_session invalidate];
}

- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4
{
  id v49 = a3;
  id v50 = a4;
  double v5 = sub_100016BAC();
  uint64_t v47 = sub_100042EE0();
  double v6 = sub_100016C70();
  double Current = CFAbsoluteTimeGetCurrent();
  v65 = 0;
  v66 = 0;
  unint64_t v67 = 0;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v50;
  id v8 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v62;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        while (1)
        {
          if (*(void *)v62 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          sub_10011C578((uint64_t)&v54);
          [v11 distance:v47];
          v60 |= 8u;
          *(double *)&long long v58 = v12;
          if (([v11 relationship] & 2) != 0)
          {
            v60 |= 4u;
            int v14 = 2;
          }
          else
          {
            unsigned __int8 v13 = [v11 relationship];
            v60 |= 4u;
            int v14 = v13 & 1;
          }
          LODWORD(v59) = v14;
          id v15 = [v11 discoveryToken];
          id v16 = [v15 rawToken];
          v17 = (const std::string::value_type *)[v16 bytes];
          __int16 v18 = [v11 discoveryToken];
          int v19 = [v18 rawToken];
          id v20 = [v19 length];
          v60 |= 1u;
          if (v56 == (std::string *)&wireless_diagnostics::google::protobuf::internal::kEmptyString) {
            operator new();
          }
          std::string::assign(v56, v17, (std::string::size_type)v20);

          v21 = [v11 discoveryToken];
          id v22 = [v21 hash];
          v60 |= 2u;
          id v57 = v22;

          v60 |= 0x10u;
          uint64_t v23 = *((void *)&v58 + 1);
          if (!*((void *)&v58 + 1)) {
            operator new();
          }
          [v11 direction];
          *(_DWORD *)(v23 + 48) |= 2u;
          *(double *)(v23 + 16) = v24;
          v60 |= 0x10u;
          uint64_t v25 = *((void *)&v58 + 1);
          if (!*((void *)&v58 + 1)) {
            operator new();
          }
          [v11 direction];
          *(_DWORD *)(v25 + 48) |= 4u;
          *(double *)(v25 + 24) = v26;
          v60 |= 0x10u;
          uint64_t v27 = *((void *)&v58 + 1);
          if (!*((void *)&v58 + 1)) {
            operator new();
          }
          [v11 direction];
          *(_DWORD *)(v27 + 48) |= 8u;
          *(double *)(v27 + 32) = v28;
          v29 = v66;
          if ((unint64_t)v66 < v67) {
            break;
          }
          v66 = (char *)sub_10034A7C0(&v65, (uint64_t)&v54);
          sub_10011D50C(&v54);
          i = (char *)i + 1;
          if (v8 == i) {
            goto LABEL_20;
          }
        }
        sub_10011D458((uint64_t)v66, (uint64_t)&v54);
        v66 = v29 + 88;
        sub_10011D50C(&v54);
      }
LABEL_20:
      id v8 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
    }
    while (v8);
  }

  value = self->_sensor.__ptr_.__value_;
  sub_10035F1D4((uint64_t)&v54, v47, (uint64_t *)&v65, v5, v6, Current);
  v31 = operator new(0x108uLL);
  v31[1] = 0;
  v31[2] = 0;
  void *v31 = off_100454870;
  v32 = __p;
  v31[4] = v54;
  v31[5] = 0;
  v31[6] = 0;
  v31[7] = 0;
  sub_10034AA1C((uint64_t)(v31 + 5), (uint64_t)v32, (uint64_t)v56, 0x2E8BA2E8BA2E8BA3 * (((char *)v56 - v32) >> 3));
  *((_OWORD *)v31 + 4) = v58;
  v31[10] = v59;
  *((_DWORD *)v31 + 6) = 16;
  v52 = (char *)(v31 + 3);
  v53 = (std::__shared_weak_count *)v31;
  sub_100045938((uint64_t)value, (uint64_t)&v52);
  v33 = v53;
  if (v53 && !atomic_fetch_add(&v53->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
    std::__shared_weak_count::__release_weak(v33);
  }
  v34 = (std::string *)__p;
  if (__p)
  {
    v35 = __p;
    if (v56 != __p)
    {
      v36 = &v56[-4].__r_.__value_.__s.__data_[8];
      v37 = (std::string *)((char *)v56 - 88);
      p_size = &v56[-4].__r_.__value_.__l.__size_;
      do
      {
        v39 = (void (**)(char *))*p_size;
        p_size -= 11;
        (*v39)((char *)v37);
        v36 -= 88;
        BOOL v40 = v37 == v34;
        v37 = (std::string *)p_size;
      }
      while (!v40);
      v35 = __p;
    }
    v56 = v34;
    operator delete(v35);
  }
  v41 = (char *)v65;
  if (v65)
  {
    v42 = v65;
    if (v66 != v65)
    {
      v43 = v66 - 88;
      v44 = v66 - 88;
      v45 = (void (***)(char *))(v66 - 88);
      do
      {
        v46 = *v45;
        v45 -= 11;
        (*v46)(v44);
        v43 -= 88;
        BOOL v40 = v44 == v41;
        v44 = (char *)v45;
      }
      while (!v40);
      v42 = v65;
    }
    v66 = v41;
    operator delete(v42);
  }
}

- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10047BED8 != -1)
  {
    dispatch_once(&qword_10047BED8, &stru_1004690A8);
    id v8 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v8 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Ranging removed objects", v9, 2u);
  }
LABEL_4:
}

- (void)sessionWasSuspended:(id)a3
{
  id v3 = a3;
  if (qword_10047BED8 != -1)
  {
    dispatch_once(&qword_10047BED8, &stru_1004690A8);
    v4 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v4 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)double v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Ranging suspended", v5, 2u);
  }
LABEL_4:
}

- (void)sessionSuspensionEnded:(id)a3
{
  id v4 = a3;
  if (qword_10047BED8 == -1)
  {
    double v5 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BED8, &stru_1004690A8);
  double v5 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Ranging suspension ended", v6, 2u);
  }
LABEL_4:
  if (self->_running) {
    [(IOSNearbyObject *)self start];
  }
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10047BED8 == -1)
  {
    id v8 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BED8, &stru_1004690A8);
  id v8 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Ranging invalidated", v9, 2u);
  }
LABEL_4:
  if (self->_running) {
    [(IOSNearbyObject *)self start];
  }
}

- (void).cxx_destruct
{
  value = self->_sensor.__ptr_.__value_;
  self->_sensor.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(IOSNearbyObjectSensor *, SEL))(*(void *)value + 8))(value, a2);
  }

  objc_storeStrong((id *)&self->_session, 0);
}

@end