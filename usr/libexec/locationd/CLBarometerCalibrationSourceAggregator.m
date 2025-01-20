@interface CLBarometerCalibrationSourceAggregator
+ (uint64_t)isLocationUsefulForCalibration:(uint64_t)a3;
- (BOOL)goodSurfaceCalibration:(float)a3;
- (BOOL)isInOutdoorWorkout;
- (CLBarometerCalibrationAggregatorClient)delegate;
- (CLBarometerCalibrationSourceAggregator)initWithUniverse:(id)a3 buffers:(void *)a4;
- (array<std::deque<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>,)copyDataBuffersForTrack:(CLBarometerCalibrationSourceAggregator *)self;
- (double)getLastAltitude;
- (double)getLastAltitudeAccuracy;
- (double)getLastAltitudeTime;
- (id).cxx_construct;
- (void)dealloc;
- (void)didUpdateSource:(unint64_t)a3 withData:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>)a4;
- (void)disableSources:(id)a3 forContext:(id)a4;
- (void)enableSources:(id)a3 forContext:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setInOutdoorWorkout:(BOOL)a3;
- (void)setLastAltitude:(double)a3;
- (void)setLastAltitudeAccuracy:(double)a3;
- (void)setLastAltitudeTime:(double)a3;
- (void)wetStateUpdated:(unint64_t)a3;
@end

@implementation CLBarometerCalibrationSourceAggregator

- (void)didUpdateSource:(unint64_t)a3 withData:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>)a4
{
  var0 = a4.var0;
  switch(a3)
  {
    case 0uLL:
      dataBuffers = self->_dataBuffers;
      if (dataBuffers[5] >= 0x258uLL) {
        sub_1000962A4(dataBuffers);
      }
      v8 = *(std::string::size_type **)var0;
      v7 = (std::__shared_weak_count *)*((void *)var0 + 1);
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1023139E0);
      }
      v9 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        std::string::size_type v10 = *v8;
        std::string::size_type v11 = v8[1];
        std::string::size_type v13 = v8[2];
        std::string::size_type v12 = v8[3];
        int v14 = *((unsigned __int8 *)v8 + 128);
        std::string::size_type v15 = v8[14];
        std::string::size_type v16 = v8[15];
        std::string::size_type v17 = v8[4];
        std::string::size_type v18 = v8[5];
        std::string::size_type v19 = v8[6];
        std::string::size_type v20 = v8[7];
        int v21 = *((_DWORD *)v8 + 24);
        int v22 = *((_DWORD *)v8 + 25);
        std::string::size_type v23 = v8[8];
        std::string::size_type v24 = v8[9];
        std::string::size_type v25 = v8[10];
        std::string::size_type v26 = v8[11];
        int v27 = *((_DWORD *)v8 + 26);
        int v28 = *((unsigned __int16 *)v8 + 65);
        *(_DWORD *)buf = 68294147;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2049;
        *(void *)&buf[20] = v12;
        *(_WORD *)&buf[28] = 2049;
        *(void *)&buf[30] = v10;
        *(_WORD *)&buf[38] = 2049;
        *(void *)&buf[40] = v11;
        *(_WORD *)&buf[48] = 2049;
        *(void *)&buf[50] = v13;
        *(_WORD *)&buf[58] = 1025;
        *(_DWORD *)&buf[60] = v22;
        LOWORD(v177) = 1025;
        *(_DWORD *)((char *)&v177 + 2) = v14;
        HIWORD(v177) = 2049;
        *(void *)v178 = v15;
        *(_WORD *)&v178[8] = 2049;
        std::string::size_type v179 = v16;
        __int16 v180 = 2049;
        std::string::size_type v181 = v19;
        __int16 v182 = 2049;
        std::string::size_type v183 = v17;
        __int16 v184 = 2049;
        std::string::size_type v185 = v18;
        __int16 v186 = 2049;
        std::string::size_type v187 = v20;
        __int16 v188 = 1025;
        int v189 = v21;
        __int16 v190 = 2049;
        std::string::size_type v191 = v23;
        __int16 v192 = 2049;
        std::string::size_type v193 = v24;
        __int16 v194 = 2049;
        std::string::size_type v195 = v25;
        __int16 v196 = 2049;
        std::string::size_type v197 = v26;
        __int16 v198 = 1025;
        int v199 = v27;
        __int16 v200 = 1025;
        int v201 = v28;
        __int16 v202 = 1025;
        int v203 = v22;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"location source updated with\", \"altitude\":\"%{private}f\", \"time_s\":\"%{private}.09f\", \"lat\":\"%{private}f\", \"long\":\"%{private}f\", \"type\":%{private}d, \"isPrefilteredLocation\":%{private}d, \"rawAltitude\":\"%{private}f\", \"rawVerticalAccuracy\":\"%{private}f\", \"DEM\":\"%{private}f\", \"horizontalAccuracy\":\"%{private}f\", \"verticalAccuracy\":\"%{private}f\", \"DEMUncertainty\":\"%{private}f\", \"Environment\":%{private}d, \"Slope\":\"%{private}f\", \"MaxAbsSlope\":\"%{private}f\", \"Speed\":\"%{private}f\", \"SpeedAccuracy\":\"%{private}f\", \"MatchQuality\":%{private}d, \"AltitudeState\":%{private}d, \"RefProvider\":%{private}d}", buf, 0xC2u);
      }
      sub_100095870((void *)self->_dataBuffers, (long long *)var0);
      [(CLBarometerCalibrationSourceAggregator *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [(CLBarometerCalibrationAggregatorClient *)[(CLBarometerCalibrationSourceAggregator *)self delegate] didUpdateDataBuffer:0];
      }
      goto LABEL_172;
    case 1uLL:
      v81 = self->_dataBuffers;
      if (v81[11] >= 0x258uLL) {
        sub_1000962A4(v81 + 6);
      }
      v82 = *(std::string::size_type **)var0;
      v7 = (std::__shared_weak_count *)*((void *)var0 + 1);
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1023139E0);
      }
      v83 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        std::string::size_type v84 = *v82;
        std::string::size_type v85 = v82[1];
        std::string::size_type v86 = v82[2];
        *(_DWORD *)buf = 68289795;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(void *)&buf[20] = v84;
        *(_WORD *)&buf[28] = 2049;
        *(void *)&buf[30] = v85;
        *(_WORD *)&buf[38] = 2049;
        *(void *)&buf[40] = v86;
        _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"pressure source updated with\", \"time_s\":\"%{public}.09f\", \"pressure\":\"%{private}f\", \"temperature\":\"%{private}f\"}", buf, 0x30u);
      }
      sub_100095870((void *)self->_dataBuffers + 6, (long long *)var0);
      if (objc_opt_respondsToSelector()) {
        [(CLBarometerCalibrationAggregatorClient *)self->_delegate didUpdateDataBuffer:1];
      }
      goto LABEL_172;
    case 2uLL:
      v45 = self->_dataBuffers;
      if (v45[17] >= 0x4B0uLL) {
        sub_1000962A4(v45 + 12);
      }
      v46 = *(std::string::size_type **)var0;
      v7 = (std::__shared_weak_count *)*((void *)var0 + 1);
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1023139E0);
      }
      v47 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        std::string::size_type v48 = *v46;
        sub_10006DE8C(&__p);
        v49 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? &__p
            : (std::string *)__p.__r_.__value_.__r.__words[0];
        int v50 = *((_DWORD *)v46 + 4);
        int v51 = *((_DWORD *)v46 + 6);
        int v52 = *((unsigned __int8 *)v46 + 20);
        *(_DWORD *)buf = 68290307;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2049;
        *(void *)&buf[20] = v48;
        *(_WORD *)&buf[28] = 2081;
        *(void *)&buf[30] = v49;
        *(_WORD *)&buf[38] = 1025;
        *(_DWORD *)&buf[40] = v50;
        *(_WORD *)&buf[44] = 1025;
        *(_DWORD *)&buf[46] = v51;
        *(_WORD *)&buf[50] = 1025;
        *(_DWORD *)&buf[52] = v52;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"wifi source updated with\", \"scanTimestamp_s\":\"%{private}.09f\", \"mac\":%{private, location:escape_only}s, \"channel\":%{private}d, \"rssi\":%{private}d, \"hidden\":%{private}hhd}", buf, 0x38u);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
      sub_100095870((void *)self->_dataBuffers + 12, (long long *)var0);
      if (objc_opt_respondsToSelector()) {
        [(CLBarometerCalibrationAggregatorClient *)self->_delegate didUpdateDataBuffer:2];
      }
      goto LABEL_172;
    case 3uLL:
      v53 = self->_dataBuffers;
      if (v53[23] >= 0x258uLL) {
        sub_1000962A4(v53 + 18);
      }
      v54 = *(std::string::size_type **)var0;
      v7 = (std::__shared_weak_count *)*((void *)var0 + 1);
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1023139E0);
      }
      v55 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        std::string::size_type v56 = *v54;
        int v57 = *((_DWORD *)v54 + 2);
        *(_DWORD *)buf = 68289539;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2049;
        *(void *)&buf[20] = v56;
        *(_WORD *)&buf[28] = 1025;
        *(_DWORD *)&buf[30] = v57;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"elevation source updated with\", \"timestamp_s\":\"%{private}.09f\", \"elevation\":%{private}d}", buf, 0x22u);
      }
      sub_100095870((void *)self->_dataBuffers + 18, (long long *)var0);
      if (objc_opt_respondsToSelector()) {
        [(CLBarometerCalibrationAggregatorClient *)self->_delegate didUpdateDataBuffer:3];
      }
      goto LABEL_172;
    case 4uLL:
      v29 = self->_dataBuffers;
      if (v29[29] >= 0x258uLL) {
        sub_1000962A4(v29 + 24);
      }
      v30 = *(std::string::size_type **)var0;
      v7 = (std::__shared_weak_count *)*((void *)var0 + 1);
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1023139E0);
      }
      v31 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        std::string::size_type v32 = *v30;
        std::string::size_type v33 = v30[1];
        std::string::size_type v34 = v30[2];
        *(_DWORD *)buf = 68289795;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2049;
        *(void *)&buf[20] = v32;
        *(_WORD *)&buf[28] = 2049;
        *(void *)&buf[30] = v33;
        *(_WORD *)&buf[38] = 2049;
        *(void *)&buf[40] = v34;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"companion source updated with\", \"timestamp_s\":\"%{private}.09f\", \"biasInMeters\":\"%{private}f\", \"uncertaintyInMeters\":\"%{private}f\"}", buf, 0x30u);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1023139E0);
        }
      }
      v35 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        std::string::size_type v36 = *v30;
        std::string::size_type v37 = v30[1];
        std::string::size_type v38 = v30[2];
        *(_DWORD *)buf = 134218496;
        *(void *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v37;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = v38;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "companion source updated with timestamp %f, altitude %f, uncertainty %f", buf, 0x20u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1023139E0);
        }
        std::string::size_type v120 = *v30;
        std::string::size_type v121 = v30[1];
        std::string::size_type v122 = v30[2];
        LODWORD(__p.__r_.__value_.__l.__data_) = 134218496;
        *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = v120;
        WORD2(__p.__r_.__value_.__r.__words[1]) = 2048;
        *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = v121;
        HIWORD(__p.__r_.__value_.__r.__words[2]) = 2048;
        *(void *)v167 = v122;
        v123 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:]", "%s\n", v123);
        if (v123 != buf) {
          free(v123);
        }
      }
      sub_100095870((void *)self->_dataBuffers + 24, (long long *)var0);
      if (objc_opt_respondsToSelector()) {
        [(CLBarometerCalibrationAggregatorClient *)self->_delegate didUpdateDataBuffer:4];
      }
      goto LABEL_172;
    case 5uLL:
      v87 = self->_dataBuffers;
      if (v87[35] >= 9uLL) {
        sub_1000962A4(v87 + 30);
      }
      v88 = *(std::string::size_type **)var0;
      v7 = (std::__shared_weak_count *)*((void *)var0 + 1);
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1023139E0);
      }
      v89 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        std::string::size_type v90 = *v88;
        std::string::size_type v91 = v88[1];
        std::string::size_type v92 = v88[2];
        std::string::size_type v93 = v88[3];
        *(_DWORD *)buf = 68290051;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2049;
        *(void *)&buf[20] = v90;
        *(_WORD *)&buf[28] = 2049;
        *(void *)&buf[30] = v92;
        *(_WORD *)&buf[38] = 2049;
        *(void *)&buf[40] = v91;
        *(_WORD *)&buf[48] = 2049;
        *(void *)&buf[50] = v93;
        _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"kfPressure source updated with\", \"timestamp_s\":\"%{private}.09f\", \"kfPressure\":\"%{private}f\", \"kfElevation\":\"%{private}f\", \"absAltUncertainty\":\"%{private}f\"}", buf, 0x3Au);
      }
      sub_100095870((void *)self->_dataBuffers + 30, (long long *)var0);
      if (objc_opt_respondsToSelector()) {
        [(CLBarometerCalibrationAggregatorClient *)self->_delegate didUpdateDataBuffer:5];
      }
      goto LABEL_172;
    case 6uLL:
      v94 = self->_dataBuffers;
      if (v94[41] >= 0x258uLL) {
        sub_1000962A4(v94 + 36);
      }
      v95 = *(std::string::size_type **)var0;
      v7 = (std::__shared_weak_count *)*((void *)var0 + 1);
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1023139E0);
      }
      v96 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        std::string::size_type v97 = *v95;
        std::string::size_type v98 = v95[1];
        std::string::size_type v100 = v95[2];
        std::string::size_type v99 = v95[3];
        int v101 = *((_DWORD *)v95 + 25);
        int v102 = *((unsigned __int8 *)v95 + 128);
        std::string::size_type v103 = v95[14];
        std::string::size_type v104 = v95[15];
        std::string::size_type v105 = v95[6];
        *(_DWORD *)buf = 68291331;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2049;
        *(void *)&buf[20] = v99;
        *(_WORD *)&buf[28] = 2049;
        *(void *)&buf[30] = v97;
        *(_WORD *)&buf[38] = 2049;
        *(void *)&buf[40] = v98;
        *(_WORD *)&buf[48] = 2049;
        *(void *)&buf[50] = v100;
        *(_WORD *)&buf[58] = 1025;
        *(_DWORD *)&buf[60] = v101;
        LOWORD(v177) = 1025;
        *(_DWORD *)((char *)&v177 + 2) = v102;
        HIWORD(v177) = 2049;
        *(void *)v178 = v103;
        *(_WORD *)&v178[8] = 2049;
        std::string::size_type v179 = v104;
        __int16 v180 = 2049;
        std::string::size_type v181 = v105;
        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"prefiltered location source updated with\", \"altitude\":\"%{private}f\", \"time_s\":\"%{private}.09f\", \"lat\":\"%{private}f\", \"long\":\"%{private}f\", \"type\":%{private}d, \"isPrefilteredLocation\":%{private}d, \"rawAltitude\":\"%{private}f\", \"rawVerticalAccuracy\":\"%{private}f\", \"DEM\":\"%{private}f\"}", buf, 0x64u);
      }
      sub_100095870((void *)self->_dataBuffers + 36, (long long *)var0);
      [(CLBarometerCalibrationSourceAggregator *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [(CLBarometerCalibrationAggregatorClient *)[(CLBarometerCalibrationSourceAggregator *)self delegate] didUpdateDataBuffer:6];
      }
      goto LABEL_172;
    case 7uLL:
      uint64_t v58 = *(void *)a4.var0;
      v7 = (std::__shared_weak_count *)*((void *)a4.var0 + 1);
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      double v59 = *(double *)(v58 + 8);
      *(float *)&double v59 = v59;
      if ([(CLBarometerCalibrationSourceAggregator *)self goodSurfaceCalibration:v59])
      {
        sub_100134750(v164, "NULL");
        sub_100134750(v162, "NULL");
        sub_100134750(v160, "NULL");
        sub_100134750(v158, "NULL");
        int v135 = *(_DWORD *)(v58 + 16);
        p_double fSurfacePressure = &self->_prevSurfCalLocation.fSurfacePressure;
        double fSurfacePressure = self->_prevSurfCalLocation.fSurfacePressure;
        if (fSurfacePressure != 1.79769313e308)
        {
          double v62 = *(double *)(v58 + 8);
          v155 = 0;
          v156 = 0;
          uint64_t v157 = 0;
          sub_10010F834(&v155, (const void *)qword_1024859A0, qword_1024859A8, (qword_1024859A8 - qword_1024859A0) >> 2);
          float v63 = v62 - fSurfacePressure;
          sub_1003B1E08((uint64_t)&v155, buf, v63);
          if (SHIBYTE(v165) < 0) {
            operator delete(v164[0]);
          }
          *(_OWORD *)v164 = *(_OWORD *)buf;
          uint64_t v165 = *(void *)&buf[16];
          buf[23] = 0;
          buf[0] = 0;
          if (v155)
          {
            v156 = v155;
            operator delete(v155);
          }
          double v64 = *(double *)v58;
          double fTimestamp = self->_prevSurfCalLocation.fTimestamp;
          v153 = 0;
          uint64_t v154 = 0;
          v152 = 0;
          sub_10010F834(&v152, (const void *)qword_1024859B8, qword_1024859C0, (qword_1024859C0 - qword_1024859B8) >> 2);
          float v66 = v64 - fTimestamp;
          sub_1003B1E08((uint64_t)&v152, buf, v66);
          if (SHIBYTE(v163) < 0) {
            operator delete(v162[0]);
          }
          *(_OWORD *)v162 = *(_OWORD *)buf;
          uint64_t v163 = *(void *)&buf[16];
          buf[23] = 0;
          buf[0] = 0;
          if (v152)
          {
            v153 = v152;
            operator delete(v152);
          }
        }
        p_prevSurfCalLocation = &self->_prevSurfCalLocation;
        v67 = &self->_prevSurfCalMotion.fSurfacePressure;
        double v68 = self->_prevSurfCalMotion.fSurfacePressure;
        p_prevSurfCalMotion = &self->_prevSurfCalMotion;
        if (v68 != 1.79769313e308)
        {
          double v69 = *(double *)(v58 + 8);
          v149 = 0;
          v150 = 0;
          uint64_t v151 = 0;
          sub_10010F834(&v149, (const void *)qword_1024859A0, qword_1024859A8, (qword_1024859A8 - qword_1024859A0) >> 2);
          float v70 = v69 - v68;
          sub_1003B1E08((uint64_t)&v149, buf, v70);
          if (SHIBYTE(v161) < 0) {
            operator delete(v160[0]);
          }
          *(_OWORD *)v160 = *(_OWORD *)buf;
          uint64_t v161 = *(void *)&buf[16];
          buf[23] = 0;
          buf[0] = 0;
          if (v149)
          {
            v150 = v149;
            operator delete(v149);
          }
          double v71 = *(double *)v58;
          double v72 = p_prevSurfCalMotion->fTimestamp;
          v147 = 0;
          uint64_t v148 = 0;
          v146 = 0;
          sub_10010F834(&v146, (const void *)qword_1024859B8, qword_1024859C0, (qword_1024859C0 - qword_1024859B8) >> 2);
          float v73 = v71 - v72;
          sub_1003B1E08((uint64_t)&v146, buf, v73);
          if (SHIBYTE(v159) < 0) {
            operator delete(v158[0]);
          }
          *(_OWORD *)v158 = *(_OWORD *)buf;
          uint64_t v159 = *(void *)&buf[16];
          buf[23] = 0;
          buf[0] = 0;
          if (v146)
          {
            v147 = v146;
            operator delete(v146);
          }
        }
        v74 = &qword_102419000;
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1023139E0);
        }
        v75 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
        {
          double v76 = p_prevSurfCalLocation->fTimestamp;
          double v77 = *v67;
          double v78 = p_prevSurfCalMotion->fTimestamp;
          double v80 = *(double *)v58;
          double v79 = *(double *)(v58 + 8);
          *(double *)&buf[4] = *p_fSurfacePressure;
          *(double *)&buf[14] = v76;
          *(double *)&buf[24] = v77;
          *(double *)&buf[34] = v78;
          *(_DWORD *)buf = 134219776;
          *(_WORD *)&buf[12] = 2048;
          *(_WORD *)&buf[22] = 2048;
          *(_WORD *)&buf[32] = 2048;
          *(_WORD *)&buf[42] = 2048;
          *(double *)&buf[44] = v79 - *(double *)&buf[4];
          *(_WORD *)&buf[52] = 2048;
          *(double *)&buf[54] = v80 - v76;
          *(_WORD *)&buf[62] = 2048;
          double v177 = v79 - v77;
          *(_WORD *)v178 = 2048;
          *(double *)&v178[2] = v80 - v78;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "prevLocationPressure,%f,prevLocationTimestamp,%f,prevMotionPressure,%f,prevMotionTimestamp,%f,pressureDiffLastLocation,%f,timeDiffLastLocation,%f,pressureDiffLastMotion,%f,timeDiffLastMotion,%f", buf, 0x52u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1023139E0);
          }
          double v124 = p_prevSurfCalLocation->fTimestamp;
          double v125 = *v67;
          double v126 = p_prevSurfCalMotion->fTimestamp;
          double v128 = *(double *)v58;
          double v127 = *(double *)(v58 + 8);
          *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = *(std::string::size_type *)p_fSurfacePressure;
          *(double *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = v124;
          *(double *)v167 = v125;
          *(double *)&v167[10] = v126;
          LODWORD(__p.__r_.__value_.__l.__data_) = 134219776;
          WORD2(__p.__r_.__value_.__r.__words[1]) = 2048;
          HIWORD(__p.__r_.__value_.__r.__words[2]) = 2048;
          *(_WORD *)&v167[8] = 2048;
          __int16 v168 = 2048;
          double v169 = v127 - *(double *)((char *)__p.__r_.__value_.__r.__words + 4);
          __int16 v170 = 2048;
          double v171 = v128 - v124;
          __int16 v172 = 2048;
          double v173 = v127 - v125;
          __int16 v174 = 2048;
          double v175 = v128 - v126;
          v129 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:]", "%s\n", v129);
          if (v129 != buf) {
            free(v129);
          }
          v74 = &qword_102419000;
        }
        if ((v135 | 2) != 2)
        {
          p_prevSurfCalLocation = &self->_prevSurfCalMotion;
          p_double fSurfacePressure = &self->_prevSurfCalMotion.fSurfacePressure;
        }
        p_prevSurfCalLocation->double fTimestamp = *(double *)v58;
        double *p_fSurfacePressure = *(double *)(v58 + 8);
        if (v7) {
          atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if (SHIBYTE(v165) < 0)
        {
          sub_1000DC48C(&v138, v164[0], (unint64_t)v164[1]);
        }
        else
        {
          long long v138 = *(_OWORD *)v164;
          uint64_t v139 = v165;
        }
        if (SHIBYTE(v163) < 0)
        {
          sub_1000DC48C(&v140, v162[0], (unint64_t)v162[1]);
        }
        else
        {
          long long v140 = *(_OWORD *)v162;
          uint64_t v141 = v163;
        }
        if (SHIBYTE(v161) < 0)
        {
          sub_1000DC48C(&v142, v160[0], (unint64_t)v160[1]);
        }
        else
        {
          long long v142 = *(_OWORD *)v160;
          uint64_t v143 = v161;
        }
        if (SHIBYTE(v159) < 0)
        {
          sub_1000DC48C(&v144, v158[0], (unint64_t)v158[1]);
        }
        else
        {
          long long v144 = *(_OWORD *)v158;
          uint64_t v145 = v159;
        }
        AnalyticsSendEventLazy();
        v111 = self->_dataBuffers;
        if (v111[47] >= 0x64uLL) {
          sub_1000962A4(v111 + 42);
        }
        if (v74[60] != -1) {
          dispatch_once(&qword_1024191E0, &stru_1023139E0);
        }
        v112 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
        {
          double v113 = *(double *)v58;
          uint64_t v114 = *(void *)(v58 + 8);
          *(_DWORD *)buf = 68289539;
          *(_DWORD *)&buf[4] = 0;
          *(_WORD *)&buf[8] = 2082;
          *(void *)&buf[10] = "";
          *(_WORD *)&buf[18] = 2050;
          *(double *)&buf[20] = v113;
          *(_WORD *)&buf[28] = 2049;
          *(void *)&buf[30] = v114;
          _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"surface calibration pressure source updated with\", \"time_s\":\"%{public}.09f\", \"pressure\":\"%{private}f\"}", buf, 0x26u);
          if (v74[60] != -1) {
            dispatch_once(&qword_1024191E0, &stru_1023139E0);
          }
        }
        v115 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
        {
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          int v117 = *(_DWORD *)(v58 + 16);
          double v119 = *(double *)v58;
          uint64_t v118 = *(void *)(v58 + 8);
          *(_DWORD *)buf = 134218752;
          *(CFAbsoluteTime *)&buf[4] = Current;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v118;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = v117;
          *(_WORD *)&buf[28] = 2048;
          *(double *)&buf[30] = v119;
          _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "surface pressure calibration,timestamp,%f,pressure,%f,type,%d,pressureTimestamp,%f", buf, 0x26u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (v74[60] != -1) {
            dispatch_once(&qword_1024191E0, &stru_1023139E0);
          }
          CFAbsoluteTime v130 = CFAbsoluteTimeGetCurrent();
          int v131 = *(_DWORD *)(v58 + 16);
          double v133 = *(double *)v58;
          std::string::size_type v132 = *(void *)(v58 + 8);
          LODWORD(__p.__r_.__value_.__l.__data_) = 134218752;
          *(CFAbsoluteTime *)((char *)__p.__r_.__value_.__r.__words + 4) = v130;
          WORD2(__p.__r_.__value_.__r.__words[1]) = 2048;
          *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = v132;
          HIWORD(__p.__r_.__value_.__r.__words[2]) = 1024;
          *(_DWORD *)v167 = v131;
          *(_WORD *)&v167[4] = 2048;
          *(double *)&v167[6] = v133;
          v134 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:]", "%s\n", v134);
          if (v134 != buf) {
            free(v134);
          }
        }
        sub_100095870((void *)self->_dataBuffers + 42, (long long *)var0);
        if (objc_opt_respondsToSelector()) {
          [(CLBarometerCalibrationAggregatorClient *)self->_delegate didUpdateDataBuffer:7];
        }
        if (SHIBYTE(v145) < 0) {
          operator delete((void *)v144);
        }
        if (SHIBYTE(v143) < 0) {
          operator delete((void *)v142);
        }
        if (SHIBYTE(v141) < 0) {
          operator delete((void *)v140);
        }
        if (SHIBYTE(v139) < 0) {
          operator delete((void *)v138);
        }
        if (v7) {
          sub_1000DB0A0(v7);
        }
        if (SHIBYTE(v159) < 0) {
          operator delete(v158[0]);
        }
        if (SHIBYTE(v161) < 0) {
          operator delete(v160[0]);
        }
        if (SHIBYTE(v163) < 0) {
          operator delete(v162[0]);
        }
        if (SHIBYTE(v165) < 0) {
          operator delete(v164[0]);
        }
      }
      goto LABEL_172;
    case 8uLL:
      v106 = self->_dataBuffers;
      if (v106[53] >= 5uLL) {
        sub_1000962A4(v106 + 48);
      }
      v107 = *(std::string::size_type **)var0;
      v7 = (std::__shared_weak_count *)*((void *)var0 + 1);
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1023139E0);
      }
      v108 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        std::string::size_type v109 = *v107;
        uint64_t v110 = *((unsigned __int8 *)v107 + 8);
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(void *)&buf[20] = v109;
        *(_WORD *)&buf[28] = 2050;
        *(void *)&buf[30] = v110;
        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"water submersion source updated with\", \"time_s\":\"%{public}.09f\", \"water submersion state\":%{public, location:CMSubmersion_Types::CMSubmersionStates}lld}", buf, 0x26u);
      }
      sub_100095870((void *)self->_dataBuffers + 48, (long long *)var0);
      if (objc_opt_respondsToSelector()) {
        [(CLBarometerCalibrationAggregatorClient *)self->_delegate didUpdateDataBuffer:8];
      }
      goto LABEL_172;
    case 9uLL:
      v39 = self->_dataBuffers;
      if (v39[59] >= 0x258uLL) {
        sub_1000962A4(v39 + 54);
      }
      v40 = *(std::string::size_type **)var0;
      v7 = (std::__shared_weak_count *)*((void *)var0 + 1);
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1023139E0);
      }
      v41 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        std::string::size_type v42 = *v40;
        std::string::size_type v43 = v40[1];
        std::string::size_type v44 = v40[2];
        *(_DWORD *)buf = 68289794;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(void *)&buf[20] = v42;
        *(_WORD *)&buf[28] = 2050;
        *(void *)&buf[30] = v43;
        *(_WORD *)&buf[38] = 2050;
        *(void *)&buf[40] = v44;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"companion pressure source updated with\", \"time_s\":\"%{public}.09f\", \"pressure (pascals)\":\"%{public}f\", \"uncertainty (pascals)\":\"%{public}f\"}", buf, 0x30u);
      }
      sub_100095870((void *)self->_dataBuffers + 54, (long long *)var0);
      if (objc_opt_respondsToSelector()) {
        [(CLBarometerCalibrationAggregatorClient *)self->_delegate didUpdateDataBuffer:9];
      }
LABEL_172:
      if (v7) {
        sub_1000DB0A0(v7);
      }
      break;
    default:
      return;
  }
}

+ (uint64_t)isLocationUsefulForCalibration:(uint64_t)a3
{
  return (*(_DWORD *)(a3 + 96) < 0xCu) & (0xC12u >> *(_DWORD *)(a3 + 96));
}

- (CLBarometerCalibrationSourceAggregator)initWithUniverse:(id)a3 buffers:(void *)a4
{
  v19.receiver = self;
  v19.super_class = (Class)CLBarometerCalibrationSourceAggregator;
  v6 = [(CLBarometerCalibrationSourceAggregator *)&v19 init];
  v7 = v6;
  if (v6)
  {
    v6->_universe = (CLIntersiloUniverse *)a3;
    v6->_dataBuffers = a4;
    for (uint64_t i = 48; i != 128; i += 8)
      *(Class *)((char *)&v7->super.isa + i) = (Class)objc_opt_new();
    v7->_lastTimestampPressureBuffer = 1.79769313e308;
    v7->_currentWetState = 0;
    v9 = [[CLBarometerCalibrationSourceWifi alloc] initWithUniverse:a3 delegate:v7];
    unsigned int v18 = 2;
    std::string::size_type v20 = &v18;
    sub_100042490((uint64_t **)&v7->_sources, &v18, (uint64_t)&unk_101D0B290, &v20)[5] = (uint64_t *)v9;
    std::string::size_type v10 = [[CLBarometerCalibrationSourcePressure alloc] initWithUniverse:a3 delegate:v7];
    unsigned int v18 = 1;
    std::string::size_type v20 = &v18;
    sub_100042490((uint64_t **)&v7->_sources, &v18, (uint64_t)&unk_101D0B290, &v20)[5] = (uint64_t *)v10;
    std::string::size_type v11 = [[CLBarometerCalibrationSourceLocation alloc] initWithUniverse:a3 delegate:v7];
    unsigned int v18 = 0;
    std::string::size_type v20 = &v18;
    sub_100042490((uint64_t **)&v7->_sources, &v18, (uint64_t)&unk_101D0B290, &v20)[5] = (uint64_t *)v11;
    std::string::size_type v12 = [[CLBarometerCalibrationSourceCompanion alloc] initWithUniverse:a3 delegate:v7];
    unsigned int v18 = 4;
    std::string::size_type v20 = &v18;
    sub_100042490((uint64_t **)&v7->_sources, &v18, (uint64_t)&unk_101D0B290, &v20)[5] = (uint64_t *)v12;
    std::string::size_type v13 = [[CLBarometerCalibrationSourceSurfaceCalibration alloc] initWithUniverse:a3 delegate:v7];
    unsigned int v18 = 7;
    std::string::size_type v20 = &v18;
    sub_100042490((uint64_t **)&v7->_sources, &v18, (uint64_t)&unk_101D0B290, &v20)[5] = (uint64_t *)v13;
    int v14 = [[CLBarometerCalibrationSourceSubmersionState alloc] initWithUniverse:a3 delegate:v7];
    unsigned int v18 = 8;
    std::string::size_type v20 = &v18;
    std::string::size_type v15 = sub_100042490((uint64_t **)&v7->_sources, &v18, (uint64_t)&unk_101D0B290, &v20);
    int64x2_t v16 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v15[5] = (uint64_t *)v14;
    *(int64x2_t *)&v7->_prevSurfCalLocation.double fTimestamp = v16;
    v7->_prevSurfCalLocation.fCalibrationSource = 3;
    *(int64x2_t *)&v7->_prevSurfCalMotion.double fTimestamp = v16;
    v7->_prevSurfCalMotion.fCalibrationSource = 3;
  }
  return v7;
}

- (void)dealloc
{
  self->_universe = 0;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, CLBarometerCalibrationSource *>, void *>>> *)self->_sources.__tree_.__begin_node_;
  p_pair1 = &self->_sources.__tree_.__pair1_;
  if (begin_node != &self->_sources.__tree_.__pair1_)
  {
    do
    {

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, CLBarometerCalibrationSource *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v6 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, CLBarometerCalibrationSource *>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v6 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, CLBarometerCalibrationSource *>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v7 = v6->__value_.__left_ == begin_node;
          begin_node = v6;
        }
        while (!v7);
      }
      begin_node = v6;
    }
    while (v6 != p_pair1);
  }
  for (uint64_t i = 48; i != 128; i += 8)

  v9.receiver = self;
  v9.super_class = (Class)CLBarometerCalibrationSourceAggregator;
  [(CLBarometerCalibrationSourceAggregator *)&v9 dealloc];
}

- (void)enableSources:(id)a3 forContext:(id)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    clientsForSource = self->_clientsForSource;
    p_sources = (uint64_t **)&self->_sources;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(a3);
        }
        id v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) integerValue];
        unsigned int v14 = v13;
        std::string::size_type v15 = clientsForSource[(void)v13];
        [(NSMutableSet *)v15 addObject:a4];
        if ([(NSMutableSet *)v15 count])
        {
          unsigned int v16 = v14;
          int v21 = &v16;
          [sub_100042490(p_sources, &v16, (uint64_t)&unk_101D0B290, &v21)[5] enableSource];
        }
      }
      id v8 = [a3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v8);
  }
}

- (void)disableSources:(id)a3 forContext:(id)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    clientsForSource = self->_clientsForSource;
    p_sources = (uint64_t **)&self->_sources;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(a3);
        }
        id v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) integerValue];
        unsigned int v14 = v13;
        std::string::size_type v15 = clientsForSource[(void)v13];
        [(NSMutableSet *)v15 removeObject:a4];
        if (![(NSMutableSet *)v15 count])
        {
          unsigned int v16 = v14;
          int v21 = &v16;
          [sub_100042490(p_sources, &v16, (uint64_t)&unk_101D0B290, &v21)[5] disableSource];
        }
      }
      id v8 = [a3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v8);
  }
}

- (array<std::deque<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>,)copyDataBuffersForTrack:(CLBarometerCalibrationSourceAggregator *)self
{
  uint64_t v6 = 0;
  dataBuffers = (char *)self->_dataBuffers;
  do
  {
    result = (array<std::deque<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>, 10UL> *)sub_100096374((uint64_t)retstr + v6, &dataBuffers[v6]);
    v6 += 48;
  }
  while (v6 != 480);
  if (a4 == 3)
  {
    unint64_t start = retstr->__elems_[2].__start_;
    begin = retstr->__elems_[2].__map_.__begin_;
    std::string::size_type v11 = (char *)&begin[start >> 8];
    if (retstr->__elems_[2].__map_.__end_ == begin)
    {
      std::string::size_type v12 = 0;
      std::string::size_type v15 = 0;
      unsigned int v14 = (char *)&begin[(retstr->__elems_[2].__size_.__value_ + start) >> 8];
    }
    else
    {
      std::string::size_type v12 = (double **)(*(void *)v11 + 16 * start);
      unint64_t v13 = retstr->__elems_[2].__size_.__value_ + start;
      unsigned int v14 = (char *)&begin[v13 >> 8];
      std::string::size_type v15 = (double **)(*(void *)v14 + 16 * v13);
    }
    if (v15 == v12
      || (uint64_t v16 = (((uint64_t)v15 - *(void *)v14) >> 4) + 32 * (v14 - v11),
          uint64_t v17 = (uint64_t)v12 - *(void *)v11,
          v16 == v17 >> 4))
    {
      unint64_t v18 = 0;
    }
    else
    {
      unint64_t v18 = 63 - __clz(v16 - (v17 >> 4));
    }
    sub_10113D38C(v11, v12, v14, v15, 2 * v18, 1);
  }
  return result;
}

- (BOOL)isInOutdoorWorkout
{
  BOOL result = [(CLBarometerCalibrationAggregatorClient *)[(CLBarometerCalibrationSourceAggregator *)self delegate] isInOutdoorWorkout];
  self->_inOutdoorWorkout = result;
  return result;
}

- (double)getLastAltitude
{
  [(CLBarometerCalibrationAggregatorClient *)[(CLBarometerCalibrationSourceAggregator *)self delegate] getLastAltitude];
  self->_lastAltitude = result;
  return result;
}

- (double)getLastAltitudeTime
{
  [(CLBarometerCalibrationAggregatorClient *)[(CLBarometerCalibrationSourceAggregator *)self delegate] getLastAltitudeTime];
  self->_lastAltitudeTime = result;
  return result;
}

- (double)getLastAltitudeAccuracy
{
  [(CLBarometerCalibrationAggregatorClient *)[(CLBarometerCalibrationSourceAggregator *)self delegate] getLastAltitudeAccuracy];
  self->_lastAltitudeAccuracy = result;
  return result;
}

- (void)wetStateUpdated:(unint64_t)a3
{
  if (self->_currentWetState != a3) {
    self->_currentWetState = a3 != 0;
  }
}

- (BOOL)goodSurfaceCalibration:(float)a3
{
  sub_100096374((uint64_t)v19, (void *)self->_dataBuffers + 42);
  if (v21)
  {
    v5 = (uint64_t *)(*(void *)(v19[1] + (((unint64_t)(v21 + v20 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                   + 16 * (v21 + v20 - 1));
    uint64_t v7 = *v5;
    uint64_t v6 = (std::__shared_weak_count *)v5[1];
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    float v8 = a3 - *(double *)(v7 + 8);
    float v9 = fabsf(v8);
    if (v6) {
      sub_1000DB0A0(v6);
    }
    double v10 = v9;
    BOOL v11 = v9 > 3.0 || !self->_currentWetState;
  }
  else
  {
    BOOL v11 = 1;
    double v10 = -1.0;
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1023139E0);
  }
  std::string::size_type v12 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    BOOL currentWetState = self->_currentWetState;
    *(_DWORD *)buf = 134219008;
    CFAbsoluteTime v33 = Current;
    __int16 v34 = 2048;
    double v35 = a3;
    __int16 v36 = 2048;
    double v37 = v10;
    __int16 v38 = 1024;
    BOOL v39 = currentWetState;
    __int16 v40 = 1024;
    BOOL v41 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "surface cal check,timestamp,%f,pressure,%f,lastCalDiff,%f,wetState,%d,pass,%d", buf, 0x2Cu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1023139E0);
    }
    CFAbsoluteTime v16 = CFAbsoluteTimeGetCurrent();
    BOOL v17 = self->_currentWetState;
    int v22 = 134219008;
    CFAbsoluteTime v23 = v16;
    __int16 v24 = 2048;
    double v25 = a3;
    __int16 v26 = 2048;
    double v27 = v10;
    __int16 v28 = 1024;
    BOOL v29 = v17;
    __int16 v30 = 1024;
    BOOL v31 = v11;
    unint64_t v18 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceAggregator goodSurfaceCalibration:]", "%s\n", v18);
    if (v18 != (char *)buf) {
      free(v18);
    }
  }
  sub_1000DAF68(v19);
  return v11;
}

- (void)setInOutdoorWorkout:(BOOL)a3
{
  self->_inOutdoorWorkout = a3;
}

- (void)setLastAltitude:(double)a3
{
  self->_lastAltitude = a3;
}

- (void)setLastAltitudeTime:(double)a3
{
  self->_lastAltitudeTime = a3;
}

- (void)setLastAltitudeAccuracy:(double)a3
{
  self->_lastAltitudeAccuracy = a3;
}

- (CLBarometerCalibrationAggregatorClient)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLBarometerCalibrationAggregatorClient *)a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 3) = (char *)self + 32;
  int64x2_t v2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *((int64x2_t *)self + 9) = v2;
  *((_DWORD *)self + 40) = 3;
  *(int64x2_t *)((char *)self + 168) = v2;
  *((_DWORD *)self + 46) = 3;
  return self;
}

@end