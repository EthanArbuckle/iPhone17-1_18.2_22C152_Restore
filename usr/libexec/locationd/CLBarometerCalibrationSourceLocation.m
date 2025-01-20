@interface CLBarometerCalibrationSourceLocation
- (CLBarometerCalibrationSourceLocation)initWithUniverse:(id)a3 delegate:(id)a4;
- (id).cxx_construct;
- (void)disableSource;
- (void)enableSource;
- (void)onLocationNotification:(int)a3 data:(NotificationData *)a4;
@end

@implementation CLBarometerCalibrationSourceLocation

- (void)onLocationNotification:(int)a3 data:(NotificationData *)a4
{
  sub_1000EF97C((uint64_t)v72, (uint64_t)a4);
  unsigned __int8 v7 = +[CLBarometerCalibrationSourceAggregator isLocationUsefulForCalibration:v72];

  if (v77) {
    sub_1000DB0A0(v77);
  }
  if (v76 < 0) {
    operator delete(__p);
  }
  if (v74) {
    sub_1000DB0A0(v74);
  }
  if (v73) {
    sub_1000DB0A0(v73);
  }
  if (a3 == 4) {
    unsigned __int8 v8 = v7;
  }
  else {
    unsigned __int8 v8 = 0;
  }
  if (v8)
  {
    sub_100802130(&v70);
    v9 = v70;
    uint64_t *v70 = *(void *)((char *)a4 + 76);
    *(_OWORD *)(v9 + 1) = *(_OWORD *)((char *)a4 + 4);
    *(int8x16_t *)(v9 + 3) = vextq_s8(*(int8x16_t *)((char *)a4 + 20), *(int8x16_t *)((char *)a4 + 20), 8uLL);
    v9[5] = *(void *)((char *)a4 + 36);
    *((_DWORD *)v9 + 25) = *((_DWORD *)a4 + 24);
    *((_DWORD *)v9 + 24) = *((_DWORD *)a4 + 35);
    *((_DWORD *)v9 + 26) = *((_DWORD *)a4 + 54);
    *((_OWORD *)v9 + 3) = *(_OWORD *)((char *)a4 + 536);
    *((_OWORD *)v9 + 4) = *(_OWORD *)((char *)a4 + 520);
    *((_OWORD *)v9 + 5) = *(_OWORD *)((char *)a4 + 44);
    *((_OWORD *)v9 + 7) = *((_OWORD *)a4 + 44);
    *((unsigned char *)v9 + 156) = *((unsigned char *)a4 + 736);
    *(_OWORD *)(v9 + 17) = *(_OWORD *)((char *)a4 + 744);
    *((_DWORD *)v9 + 38) = *((_DWORD *)a4 + 62);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022CA720);
    }
    v10 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      [(CLBarometerCalibrationSourceClient *)self->super._delegate getLastAltitude];
      uint64_t v12 = v11;
      [(CLBarometerCalibrationSourceClient *)self->super._delegate getLastAltitudeTime];
      uint64_t v13 = *v70;
      uint64_t v15 = v70[17];
      uint64_t v14 = v70[18];
      int v16 = *((unsigned __int8 *)v70 + 156);
      int v17 = *((_DWORD *)v70 + 38);
      *(_DWORD *)buf = 134219521;
      *(void *)v84 = v12;
      *(_WORD *)&v84[8] = 2048;
      *(void *)&v84[10] = v18;
      *(_WORD *)&v84[18] = 2048;
      *(void *)&v84[20] = v13;
      *(_WORD *)&v84[28] = 2049;
      *(void *)&v84[30] = v14;
      *(_WORD *)&v84[38] = 2049;
      *(void *)&v84[40] = v15;
      *(_WORD *)&v84[48] = 1025;
      *(_DWORD *)&v84[50] = v16;
      __int16 v85 = 1025;
      int v86 = v17;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "location last altitude %.3lf last time %.3lf last location time %.3lf,indoorConfidence,%{private}.3lf, outdoorConfidence,%{private}.3lf,PositionOutdoorState,%{private}u,mapMatchType,%{private}u", buf, 0x40u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022CA720);
      }
      [(CLBarometerCalibrationSourceClient *)self->super._delegate getLastAltitude];
      uint64_t v49 = v48;
      [(CLBarometerCalibrationSourceClient *)self->super._delegate getLastAltitudeTime];
      uint64_t v50 = *v70;
      uint64_t v52 = v70[17];
      uint64_t v51 = v70[18];
      int v53 = *((unsigned __int8 *)v70 + 156);
      int v54 = *((_DWORD *)v70 + 38);
      int v79 = 134219521;
      *(void *)v80 = v49;
      *(_WORD *)&v80[8] = 2048;
      *(void *)&v80[10] = v55;
      *(_WORD *)&v80[18] = 2048;
      *(void *)&v80[20] = v50;
      *(_WORD *)&v80[28] = 2049;
      *(void *)&v80[30] = v51;
      *(_WORD *)&v80[38] = 2049;
      *(void *)&v80[40] = v52;
      *(_WORD *)&v80[48] = 1025;
      *(_DWORD *)&v80[50] = v53;
      __int16 v81 = 1025;
      int v82 = v54;
      v56 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceLocation onLocationNotification:data:]", "%s\n", v56);
      if (v56 != (char *)buf) {
        free(v56);
      }
    }
    if (*((_DWORD *)v70 + 25) != 1
      || (double v19 = *(double *)v70,
          [(CLBarometerCalibrationSourceClient *)self->super._delegate getLastAltitudeTime],
          vabdd_f64(v19, v20) >= 5.0))
    {
      self->_BOOL currentUnderDEM = 0;
LABEL_29:
      if (self->_currentUnderDEM) {
        *((_WORD *)v70 + 65) |= 1u;
      }
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022CA720);
      }
      v29 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        int v30 = *((unsigned __int16 *)v70 + 65);
        int v31 = *((_DWORD *)v70 + 25);
        uint64_t v32 = *v70;
        *(_DWORD *)buf = 136316418;
        *(void *)v84 = "state";
        *(_WORD *)&v84[8] = 1024;
        *(_DWORD *)&v84[10] = v30;
        *(_WORD *)&v84[14] = 2080;
        *(void *)&v84[16] = "type";
        *(_WORD *)&v84[24] = 1024;
        *(_DWORD *)&v84[26] = v31;
        *(_WORD *)&v84[30] = 2080;
        *(void *)&v84[32] = "timestamp";
        *(_WORD *)&v84[40] = 2048;
        *(void *)&v84[42] = v32;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "location altitude information,%s,%u,%s,%d,%s,%f", buf, 0x36u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022CA720);
        }
        int v57 = *((unsigned __int16 *)v70 + 65);
        int v58 = *((_DWORD *)v70 + 25);
        uint64_t v59 = *v70;
        int v79 = 136316418;
        *(void *)v80 = "state";
        *(_WORD *)&v80[8] = 1024;
        *(_DWORD *)&v80[10] = v57;
        *(_WORD *)&v80[14] = 2080;
        *(void *)&v80[16] = "type";
        *(_WORD *)&v80[24] = 1024;
        *(_DWORD *)&v80[26] = v58;
        *(_WORD *)&v80[30] = 2080;
        *(void *)&v80[32] = "timestamp";
        *(_WORD *)&v80[40] = 2048;
        *(void *)&v80[42] = v59;
        v60 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceLocation onLocationNotification:data:]", "%s\n", v60);
        if (v60 != (char *)buf) {
          free(v60);
        }
      }
      v34 = v70;
      v33 = v71;
      *((unsigned char *)v70 + 128) = 0;
      delegate = self->super._delegate;
      v68 = v34;
      v69 = v33;
      if (v33) {
        atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      [(CLBarometerCalibrationSourceClient *)delegate didUpdateSource:0 withData:&v68];
      if (v69) {
        sub_1000DB0A0(v69);
      }
      if (v71) {
        sub_1000DB0A0(v71);
      }
      return;
    }
    unsigned int v21 = [(CLBarometerCalibrationSourceClient *)self->super._delegate isInOutdoorWorkout];
    v22 = (double *)v70;
    if (v21) {
      *((_WORD *)v70 + 65) |= 2u;
    }
    if (v22[7] <= 0.0) {
      goto LABEL_29;
    }
    if (*((_DWORD *)v22 + 26) == 2) {
      *((_WORD *)v22 + 65) |= 4u;
    }
    [(CLBarometerCalibrationSourceClient *)self->super._delegate getLastAltitudeAccuracy];
    double v24 = *((double *)v70 + 6);
    double v25 = v23 + 20.0 + *((double *)v70 + 7);
    v26 = self->super._delegate;
    if (self->_currentUnderDEM)
    {
      [(CLBarometerCalibrationSourceClient *)v26 getLastAltitude];
      if (v24 - v27 < v25 + -3.0)
      {
        BOOL v28 = 0;
LABEL_46:
        self->_BOOL currentUnderDEM = v28;
      }
    }
    else
    {
      [(CLBarometerCalibrationSourceClient *)v26 getLastAltitude];
      if (v24 - v36 > v25)
      {
        BOOL v28 = 1;
        goto LABEL_46;
      }
    }
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022CA720);
    }
    v37 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
    {
      BOOL currentUnderDEM = self->_currentUnderDEM;
      [(CLBarometerCalibrationSourceClient *)self->super._delegate getLastAltitude];
      uint64_t v40 = v39;
      [(CLBarometerCalibrationSourceClient *)self->super._delegate getLastAltitudeAccuracy];
      uint64_t v42 = v70[6];
      uint64_t v41 = v70[7];
      *(_DWORD *)buf = 67110400;
      *(_DWORD *)v84 = currentUnderDEM;
      *(_WORD *)&v84[4] = 2048;
      *(void *)&v84[6] = v40;
      *(_WORD *)&v84[14] = 2048;
      *(void *)&v84[16] = v43;
      *(_WORD *)&v84[24] = 2048;
      *(void *)&v84[26] = v42;
      *(_WORD *)&v84[34] = 2048;
      *(void *)&v84[36] = v41;
      *(_WORD *)&v84[44] = 2048;
      *(double *)&v84[46] = v25;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "underDEM, %d, altitude, %f, uncertainty, %f, demAltitude, %f, demUncertainty, %f, threshold, %f", buf, 0x3Au);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022CA720);
      }
      BOOL v61 = self->_currentUnderDEM;
      [(CLBarometerCalibrationSourceClient *)self->super._delegate getLastAltitude];
      uint64_t v63 = v62;
      [(CLBarometerCalibrationSourceClient *)self->super._delegate getLastAltitudeAccuracy];
      uint64_t v65 = v70[6];
      uint64_t v64 = v70[7];
      int v79 = 67110400;
      *(_DWORD *)v80 = v61;
      *(_WORD *)&v80[4] = 2048;
      *(void *)&v80[6] = v63;
      *(_WORD *)&v80[14] = 2048;
      *(void *)&v80[16] = v66;
      *(_WORD *)&v80[24] = 2048;
      *(void *)&v80[26] = v65;
      *(_WORD *)&v80[34] = 2048;
      *(void *)&v80[36] = v64;
      *(_WORD *)&v80[44] = 2048;
      *(double *)&v80[46] = v25;
      v67 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceLocation onLocationNotification:data:]", "%s\n", v67);
      if (v67 != (char *)buf) {
        free(v67);
      }
    }
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022CA720);
    }
    v44 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      int v45 = *((unsigned __int16 *)v70 + 65);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v84 = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "good DEM data: location altitude state is %u", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022CA720);
      }
      int v46 = *((unsigned __int16 *)v70 + 65);
      int v79 = 67109120;
      *(_DWORD *)v80 = v46;
      v47 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceLocation onLocationNotification:data:]", "%s\n", v47);
      if (v47 != (char *)buf) {
        free(v47);
      }
    }
    goto LABEL_29;
  }
}

- (CLBarometerCalibrationSourceLocation)initWithUniverse:(id)a3 delegate:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CLBarometerCalibrationSourceLocation;
  v4 = [(CLBarometerCalibrationSource *)&v7 initWithUniverse:a3 delegate:a4];
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022CA720);
  }
  v5 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v9 = 2082;
    v10 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"initialized location source\"}", buf, 0x12u);
  }
  if (v4) {
    sub_100681630();
  }
  return 0;
}

- (void)enableSource
{
  if (!self->super._sourceEnabled)
  {
    [*((id *)self->fLocationControllerClient.__ptr_.__value_ + 2) register:*((void *)self->fLocationControllerClient.__ptr_.__value_ + 1) forNotification:4 registrationInfo:0];
    [*((id *)self->fLocationControllerClient.__ptr_.__value_ + 2) register:*((void *)self->fLocationControllerClient.__ptr_.__value_ + 1) forNotification:33 registrationInfo:0];
    self->super._sourceEnabled = 1;
  }
}

- (void)disableSource
{
  if (self->super._sourceEnabled)
  {
    [*((id *)self->fLocationControllerClient.__ptr_.__value_ + 2) unregister:*((void *)self->fLocationControllerClient.__ptr_.__value_ + 1) forNotification:4];
    [*((id *)self->fLocationControllerClient.__ptr_.__value_ + 2) unregister:*((void *)self->fLocationControllerClient.__ptr_.__value_ + 1) forNotification:33];
    self->super._sourceEnabled = 0;
  }
}

- (void).cxx_destruct
{
  value = self->fLocationControllerClient.__ptr_.__value_;
  self->fLocationControllerClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  return self;
}

@end