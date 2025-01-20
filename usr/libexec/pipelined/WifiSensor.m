@interface WifiSensor
- (BOOL)sensorPresent;
- (WifiSensor)init;
- (id).cxx_construct;
- (id)currentScanOptions;
- (void)dealloc;
- (void)getSensor;
- (void)invalidate;
- (void)start;
- (void)stop;
- (void)strategyChanged:(const void *)a3;
- (void)updateWifiSettingsForNextScan:(id)a3;
- (void)wifiScanData:(id)a3 forSettings:(id)a4;
- (void)wifiScanFailed:(id)a3;
@end

@implementation WifiSensor

- (void)updateWifiSettingsForNextScan:(id)a3
{
  id v4 = a3;
  if (!self->_nextSettings)
  {
    sub_1000AE4B0(v6, "");
    sub_100270144("No settings available for scan", &__p);
    sub_10016A2C4((uint64_t)v6, (uint64_t)&__p, 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v7 < 0) {
      operator delete(v6[0]);
    }
    sub_1000D11E0((uint64_t)&v5);
  }
  [v4 updateFrom:];
}

- (void)start
{
  if (qword_10047BED8 == -1)
  {
    v3 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BED8, &stru_100468E88);
  v3 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting wifi scanning", v6, 2u);
  }
LABEL_4:
  if (self->_previousScanTimestamp.m_initialized) {
    self->_previousScanTimestamp.m_initialized = 0;
  }
  (*(void (**)(WifiScanStrategy *, void, void))(*(void *)self->_scanStrategy.__ptr_ + 40))(self->_scanStrategy.__ptr_, 0, 0);
  id v4 = (WifiScannerSettings *)objc_claimAutoreleasedReturnValue();
  nextSettings = self->_nextSettings;
  self->_nextSettings = v4;

  [(NewWifiScanner *)self->_scanner startListeningCachedScans];
  [(NewWifiScanner *)self->_scanner startScanning];
}

- (WifiSensor)init
{
  v9.receiver = self;
  v9.super_class = (Class)WifiSensor;
  id v2 = [(WifiSensor *)&v9 init];
  if (v2)
  {
    uint64_t v3 = sub_100058E7C();
    sub_1000A189C(v3, &v8);
    long long v4 = v8;
    long long v8 = 0uLL;
    v5 = (std::__shared_weak_count *)*((void *)v2 + 5);
    *((_OWORD *)v2 + 2) = v4;
    if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    v6 = (std::__shared_weak_count *)*((void *)&v8 + 1);
    if (*((void *)&v8 + 1))
    {
      if (!atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v8 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    operator new();
  }
  return 0;
}

- (void)strategyChanged:(const void *)a3
{
  long long v4 = *(WifiScanStrategy **)a3;
  uint64_t v3 = *((void *)a3 + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_scanStrategy.__cntrl_;
  self->_scanStrategy.__ptr_ = v4;
  self->_scanStrategy.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (BOOL)sensorPresent
{
  return [(NewWifiScanner *)self->_scanner sensorPresent];
}

- (void)getSensor
{
  return self->fSensorBridge.__ptr_.__value_;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((unsigned char *)self + 56) = 0;
  return self;
}

- (void)dealloc
{
  [(WifiSensor *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)WifiSensor;
  [(WifiSensor *)&v3 dealloc];
}

- (void)invalidate
{
  [(NewWifiScanner *)self->_scanner invalidate];
  uint64_t v3 = atomic_exchange((atomic_ullong *volatile)&self->_strategyChangeListener, 0);
  if (v3)
  {
    uint64_t v4 = sub_100058E7C();
    sub_10033C1C4(v4, v3);
  }
}

- (void)stop
{
  if (qword_10047BED8 == -1)
  {
    uint64_t v3 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BED8, &stru_100468E88);
  uint64_t v3 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Stopping wifi scanning", v4, 2u);
  }
LABEL_4:
  [(NewWifiScanner *)self->_scanner stopListeningCachedScans];
  [(NewWifiScanner *)self->_scanner stopScanning];
  if (self->_previousScanTimestamp.m_initialized) {
    self->_previousScanTimestamp.m_initialized = 0;
  }
}

- (void)wifiScanData:(id)a3 forSettings:(id)a4
{
  id v60 = a3;
  id v61 = a4;
  if (([v61 cachedScan] & 1) == 0)
  {
    (*(void (**)(WifiScanStrategy *, id, id))(*(void *)self->_scanStrategy.__ptr_ + 40))(self->_scanStrategy.__ptr_, [v61 timestamp], v60);
    v6 = (WifiScannerSettings *)objc_claimAutoreleasedReturnValue();
    nextSettings = self->_nextSettings;
    self->_nextSettings = v6;
  }
  v78 = 0;
  v79 = 0;
  unint64_t v80 = 0;
  sub_100347054((uint64_t)&v78, (unint64_t)[v60 count]);
  if (self->_previousScanTimestamp.m_initialized) {
    double v8 = (double)((unint64_t)[v61 timestamp]
  }
                - *(void *)((char *)&self->_previousScanTimestamp.m_storage.dummy_.aligner_ + 7))
       / 1000000.0;
  else {
    double v8 = 1.79769313e308;
  }
  id v9 = [v61 timestamp];
  if (!self->_previousScanTimestamp.m_initialized) {
    self->_previousScanTimestamp.m_initialized = 1;
  }
  v59 = self;
  *(void *)((char *)&self->_previousScanTimestamp.m_storage.dummy_.aligner_ + 7) = v9;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  v10 = v60;
  id v11 = [v10 countByEnumeratingWithState:&v74 objects:v89 count:16];
  v12 = &OBJC_METACLASS___CLPrefetchFloorRequest;
  if (!v11)
  {
    unint64_t v14 = 0;
    unint64_t v13 = 0;
    unint64_t v62 = 0;
    v35 = v10;
    goto LABEL_88;
  }
  unint64_t v62 = 0;
  unint64_t v13 = 0;
  unint64_t v14 = 0;
  unint64_t v63 = 0;
  uint64_t v64 = *(void *)v75;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v75 != v64) {
        objc_enumerationMutation(v10);
      }
      v16 = *(void **)(*((void *)&v74 + 1) + 8 * i);
      v17 = [v16 bssid];
      v18 = v17;
      if (v17) {
        [v17 ps_STLString];
      }
      else {
        memset(&buf, 0, sizeof(buf));
      }
      sub_10035FBE0((unint64_t)&buf, (uint64_t)v84);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf.__r_.__value_.__l.__data_);
      }

      if (!v84[0])
      {
        if (v12[95].isa == (__objc2_class *)-1)
        {
          v20 = (id)qword_10047BEE0;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            goto LABEL_25;
          }
        }
        else
        {
          dispatch_once(&qword_10047BED8, &stru_100468E88);
          v20 = (id)qword_10047BEE0;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
LABEL_25:
            v21 = [v16 bssid];
            v22 = v21;
            if (v21)
            {
              [v21 ps_STLString];
              p_std::string buf = &buf;
              if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
              }
            }
            else
            {
              memset(&buf, 0, sizeof(buf));
              p_std::string buf = &buf;
            }
            LODWORD(v82.__r_.__value_.__l.__data_) = 136380675;
            *(std::string::size_type *)((char *)v82.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_buf;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "ap %{private}s filtered out. invalid mac address", (uint8_t *)&v82, 0xCu);
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(buf.__r_.__value_.__l.__data_);
            }
          }
        }

        ++v63;
        if (v88 < 0) {
          goto LABEL_11;
        }
        continue;
      }
      int v19 = *(int *)&v84[8] >> 31;
      if (*(int *)&v84[8] >> 31 == *(_DWORD *)&v84[8])
      {
        v82.__r_.__value_.__l.__size_ = *(void *)&v86[2];
        int v19 = *(_DWORD *)&v84[8];
      }
      else
      {
        *(_OWORD *)&v82.__r_.__value_.__r.__words[1] = *(_OWORD *)&v86[2];
        int v83 = v87;
      }
      LODWORD(v82.__r_.__value_.__l.__data_) = v19 ^ *(_DWORD *)&v84[8];
      if (v8 * 1000000.0 <= (double)(uint64_t)[v16 age])
      {
        if (v12[95].isa == (__objc2_class *)-1)
        {
          v24 = (id)qword_10047BEE0;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_33;
          }
        }
        else
        {
          dispatch_once(&qword_10047BED8, &stru_100468E88);
          v24 = (id)qword_10047BEE0;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
LABEL_33:
            v66.__r_.__value_.__r.__words[0] = (std::string::size_type)&v67;
            if (LODWORD(v82.__r_.__value_.__l.__data_) != SLODWORD(v82.__r_.__value_.__l.__data_) >> 31) {
              sub_1001E7354();
            }
            std::to_string(&v81, v82.__r_.__value_.__l.__size_);
            v26 = v10;
            int v27 = SHIBYTE(v81.__r_.__value_.__r.__words[2]);
            std::string::size_type v28 = v81.__r_.__value_.__r.__words[0];
            id v29 = [v16 age];
            v30 = &v81;
            if (v27 < 0) {
              v30 = (std::string *)v28;
            }
            LODWORD(buf.__r_.__value_.__l.__data_) = 136381187;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v30;
            WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
            *(double *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (double)(uint64_t)v29 / 1000000.0;
            HIWORD(buf.__r_.__value_.__r.__words[2]) = 2048;
            double v91 = v8;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "ap %{private}s filtered out. %f ms old, %f ms since last scan", (uint8_t *)&buf, 0x20u);
            if (SHIBYTE(v81.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v81.__r_.__value_.__l.__data_);
            }
            v10 = v26;
            v12 = &OBJC_METACLASS___CLPrefetchFloorRequest;
          }
        }

        ++v14;
        if (v88 < 0) {
          goto LABEL_11;
        }
        continue;
      }
      if ([v16 personalHotspot])
      {
        if (v12[95].isa == (__objc2_class *)-1)
        {
          v25 = (id)qword_10047BEE0;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_38;
          }
        }
        else
        {
          dispatch_once(&qword_10047BED8, &stru_100468E88);
          v25 = (id)qword_10047BEE0;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
LABEL_38:
            v66.__r_.__value_.__r.__words[0] = (std::string::size_type)&v67;
            if (LODWORD(v82.__r_.__value_.__l.__data_) != SLODWORD(v82.__r_.__value_.__l.__data_) >> 31) {
              sub_1001E7354();
            }
            std::to_string(&buf, v82.__r_.__value_.__l.__size_);
            v34 = &buf;
            if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              v34 = (std::string *)buf.__r_.__value_.__r.__words[0];
            }
            LODWORD(v81.__r_.__value_.__l.__data_) = 136380675;
            *(std::string::size_type *)((char *)v81.__r_.__value_.__r.__words + 4) = (std::string::size_type)v34;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "ap %{private}s filtered out - personal hotspot", (uint8_t *)&v81, 0xCu);
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(buf.__r_.__value_.__l.__data_);
            }
          }
        }

        ++v13;
        if (v88 < 0) {
          goto LABEL_11;
        }
        continue;
      }
      if ([v16 requestsAnonymity])
      {
        ++v62;
        if (v88 < 0) {
          goto LABEL_11;
        }
      }
      else
      {
        v66.__r_.__value_.__r.__words[0] = 0;
        v66.__r_.__value_.__r.__words[0] = (std::string::size_type)[v61 timestamp];
        unsigned int v73 = [v16 rssi];
        unsigned int v72 = [v16 channelFlags];
        int v71 = sub_10005AFC4((int)[v16 channel]);
        char v70 = [v16 adHoc] ^ 1;
        char v69 = [v16 personalHotspot];
        unsigned int v68 = [v16 mode];
        double v31 = (double)(uint64_t)[v16 age] / 1000000000.0;
        double v67 = v31;
        v32 = v79;
        if ((unint64_t)v79 >= v80)
        {
          v79 = (char *)sub_100349238(&v78, (int *)&v82, (int *)&v73, (int *)&v72, &v71, &v70, &v69, (int *)&v68, &v67, (uint64_t *)&v66);
          if (v88 < 0) {
            goto LABEL_11;
          }
        }
        else
        {
          int data = SLODWORD(v82.__r_.__value_.__l.__data_) >> 31;
          if (SLODWORD(v82.__r_.__value_.__l.__data_) >> 31 == LODWORD(v82.__r_.__value_.__l.__data_))
          {
            buf.__r_.__value_.__l.__size_ = v82.__r_.__value_.__l.__size_;
            int data = (int)v82.__r_.__value_.__l.__data_;
          }
          else
          {
            *(_OWORD *)&buf.__r_.__value_.__r.__words[1] = *(_OWORD *)&v82.__r_.__value_.__r.__words[1];
            LODWORD(v91) = v83;
          }
          LODWORD(buf.__r_.__value_.__l.__data_) = data ^ LODWORD(v82.__r_.__value_.__l.__data_);
          HIDWORD(v81.__r_.__value_.__r.__words[0]) = v72;
          v81.__r_.__value_.__s.__data_[0] = 1;
          sub_10036C0A0((uint64_t)v79, &buf, (uint64_t)&v81, v71, v70, v69, v68, (uint64_t)v66.__r_.__value_.__l.__data_, (double)(int)v73, v31);
          v79 = v32 + 88;
          if (v88 < 0)
          {
LABEL_11:
            operator delete(*((void **)&v87 + 1));
            continue;
          }
        }
      }
    }
    id v11 = [v10 countByEnumeratingWithState:&v74 objects:v89 count:16];
  }
  while (v11);

  if (v63)
  {
    if (v12[95].isa == (__objc2_class *)-1)
    {
      v35 = (id)qword_10047BEE0;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
LABEL_82:
        std::to_string((std::string *)v84, v63);
        if (v86[9] >= 0) {
          v36 = v84;
        }
        else {
          v36 = *(unsigned char **)v84;
        }
        LODWORD(buf.__r_.__value_.__l.__data_) = 136380675;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Omitting %{private}s APs with invalid mac address", (uint8_t *)&buf, 0xCu);
        if ((v86[9] & 0x80000000) != 0) {
          operator delete(*(void **)v84);
        }
      }
    }
    else
    {
      dispatch_once(&qword_10047BED8, &stru_100468E88);
      v35 = (id)qword_10047BEE0;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        goto LABEL_82;
      }
    }
LABEL_88:
  }
  if (!(v14 | v13))
  {
    unint64_t v13 = 0;
    goto LABEL_109;
  }
  if (v12[95].isa != (__objc2_class *)-1)
  {
    dispatch_once(&qword_10047BED8, &stru_100468E88);
    v37 = (id)qword_10047BEE0;
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO)) {
      goto LABEL_108;
    }
LABEL_92:
    unint64_t v38 = v14;
    unint64_t v39 = v13;
    unint64_t v40 = v38;
    std::to_string(&buf, v38);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v41 = &buf;
    }
    else {
      v41 = (std::string *)buf.__r_.__value_.__r.__words[0];
    }
    std::to_string(&v82, v39);
    int v42 = SHIBYTE(v82.__r_.__value_.__r.__words[2]);
    std::string::size_type v43 = v82.__r_.__value_.__r.__words[0];
    std::to_string(&v81, v62);
    v44 = &v82;
    if (v42 < 0) {
      v44 = (std::string *)v43;
    }
    if ((v81.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v45 = &v81;
    }
    else {
      v45 = (std::string *)v81.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)v84 = 136381187;
    *(void *)&v84[4] = v41;
    __int16 v85 = 2081;
    *(void *)v86 = v44;
    *(_WORD *)&v86[8] = 2081;
    *(void *)&v86[10] = v45;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Omitting %{private}s old APs, %{private}s hotspots, and %{private}s private APs", v84, 0x20u);
    if (SHIBYTE(v81.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v81.__r_.__value_.__l.__data_);
      unint64_t v13 = v39;
      v12 = &OBJC_METACLASS___CLPrefetchFloorRequest;
      if ((SHIBYTE(v82.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_102:
        unint64_t v14 = v40;
        if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_108;
        }
LABEL_107:
        operator delete(buf.__r_.__value_.__l.__data_);
        goto LABEL_108;
      }
    }
    else
    {
      unint64_t v13 = v39;
      v12 = &OBJC_METACLASS___CLPrefetchFloorRequest;
      if ((SHIBYTE(v82.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_102;
      }
    }
    operator delete(v82.__r_.__value_.__l.__data_);
    unint64_t v14 = v40;
    if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_108;
    }
    goto LABEL_107;
  }
  v37 = (id)qword_10047BEE0;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO)) {
    goto LABEL_92;
  }
LABEL_108:

LABEL_109:
  if (v78 != v79 || ![v10 count]) {
    goto LABEL_132;
  }
  if (v12[95].isa != (__objc2_class *)-1)
  {
    dispatch_once(&qword_10047BED8, &stru_100468E88);
    v46 = (id)qword_10047BEE0;
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_131;
    }
LABEL_113:
    unint64_t v47 = v13;
    v48 = &buf;
    std::to_string(&buf, (unint64_t)[v10 count]);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      v48 = (std::string *)buf.__r_.__value_.__r.__words[0];
    }
    v49 = &v82;
    std::to_string(&v82, v14);
    if ((v82.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      v49 = (std::string *)v82.__r_.__value_.__r.__words[0];
    }
    std::to_string(&v81, v47);
    int v50 = SHIBYTE(v81.__r_.__value_.__r.__words[2]);
    std::string::size_type v51 = v81.__r_.__value_.__r.__words[0];
    std::to_string(&v66, v62);
    v52 = &v81;
    if (v50 < 0) {
      v52 = (std::string *)v51;
    }
    if ((v66.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v53 = &v66;
    }
    else {
      v53 = (std::string *)v66.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)v84 = 136381443;
    *(void *)&v84[4] = v48;
    __int16 v85 = 2081;
    *(void *)v86 = v49;
    *(_WORD *)&v86[8] = 2081;
    *(void *)&v86[10] = v52;
    LOWORD(v87) = 2081;
    *(void *)((char *)&v87 + 2) = v53;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "All aps filtered out (actually received %{private}s). %{private}s were too old. %{private}s were personal. %{private}s were private", v84, 0x2Au);
    if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v66.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v81.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_124:
        if ((SHIBYTE(v82.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_125;
        }
        goto LABEL_129;
      }
    }
    else if ((SHIBYTE(v81.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_124;
    }
    operator delete(v81.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v82.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_125:
      if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_131;
      }
LABEL_130:
      operator delete(buf.__r_.__value_.__l.__data_);
      goto LABEL_131;
    }
LABEL_129:
    operator delete(v82.__r_.__value_.__l.__data_);
    if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_131;
    }
    goto LABEL_130;
  }
  v46 = (id)qword_10047BEE0;
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_113;
  }
LABEL_131:

LABEL_132:
  uint64_t value = (uint64_t)v59->fSensorBridge.__ptr_.__value_;
  id v55 = [v61 timestamp];
  sub_1003471F0(&v65, v61);
  sub_10036D3B8(value, (uint64_t)v55, &v65, (uint64_t *)&v78);
  v56 = (std::__shared_weak_count *)*((void *)&v65 + 1);
  if (*((void *)&v65 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v65 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
    std::__shared_weak_count::__release_weak(v56);
  }
  v57 = (char *)v78;
  if (v78)
  {
    for (j = v79; j != v57; j -= 88)
    {
      if (*(j - 48)) {
        *(j - 48) = 0;
      }
    }
    v79 = v57;
    operator delete(v57);
  }
}

- (void)wifiScanFailed:(id)a3
{
  id v4 = a3;
  if (([v4 cachedScan] & 1) == 0)
  {
    (*(void (**)(WifiScanStrategy *, id, void))(*(void *)self->_scanStrategy.__ptr_ + 40))(self->_scanStrategy.__ptr_, [v4 timestamp], 0);
    v5 = (WifiScannerSettings *)objc_claimAutoreleasedReturnValue();
    nextSettings = self->_nextSettings;
    self->_nextSettings = v5;
  }
  uint64_t value = self->fSensorBridge.__ptr_.__value_;
  id v8 = [v4 timestamp];
  sub_1003471F0(&v10, v4);
  sub_10036D650((uint64_t)value, (uint64_t)v8, &v10);
  id v9 = (std::__shared_weak_count *)*((void *)&v10 + 1);
  if (*((void *)&v10 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v10 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  else
  {
  }
}

- (id)currentScanOptions
{
  return self->_nextSettings;
}

- (void).cxx_destruct
{
  if (self->_previousScanTimestamp.m_initialized) {
    self->_previousScanTimestamp.m_initialized = 0;
  }
  objc_storeStrong((id *)&self->_nextSettings, 0);
  cntrl = self->_scanStrategy.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    objc_storeStrong((id *)&self->_scanner, 0);
    uint64_t value = self->fSensorBridge.__ptr_.__value_;
    self->fSensorBridge.__ptr_.__value_ = 0;
    if (!value) {
      return;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_scanner, 0);
    uint64_t value = self->fSensorBridge.__ptr_.__value_;
    self->fSensorBridge.__ptr_.__value_ = 0;
    if (!value) {
      return;
    }
  }
  v5 = *(void (**)(void))(*(void *)value + 8);

  v5();
}

@end