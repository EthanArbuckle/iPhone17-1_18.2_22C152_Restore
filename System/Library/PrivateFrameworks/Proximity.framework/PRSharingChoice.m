@interface PRSharingChoice
- (BOOL)currentlyInitiating;
- (BOOL)useRegionBasedEstimator;
- (OS_os_log)logger;
- (PRSharingChoice)init;
- (PRSharingChoice)initWithQueue:(id)a3;
- (id).cxx_construct;
- (id)newScoresHandler;
- (void)addBluetoothProximityEstimate:(NeighborMeasurements *)a3 currentMachContTime:;
- (void)addRoseSolutions:(id)a3 currentMachContTime:(double)a4;
- (void)createEstimators;
- (void)heartbeatTimeout:(double)a3 currentMachContTime:(double)a4 useUpdatedScores:(BOOL)a5;
- (void)reportScoresToClientAlways:(BOOL)a3 useUpdatedScoreList:(BOOL)a4 currentMachContTime:(double)a5;
- (void)setCurrentlyInitiating:(BOOL)a3;
- (void)setLogger:(id)a3;
- (void)setNewScoresHandler:(id)a3;
- (void)setUseRegionBasedEstimator:(BOOL)a3;
- (void)updateScoresForTime:(double)a3;
- (void)updateScoresWithNewMeasurement:(const void *)a3;
@end

@implementation PRSharingChoice

- (PRSharingChoice)init
{
  return 0;
}

- (PRSharingChoice)initWithQueue:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PRSharingChoice;
  v6 = [(PRSharingChoice *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    *(_WORD *)&v7->_useRegionBasedEstimator = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    scores = v7->_scores;
    v7->_scores = v8;

    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v7->_lastScoreReportMachContinuousTime = _Q0;
    lastBigHeadMacAddress = v7->_lastBigHeadMacAddress;
    v7->_lastBigHeadMacAddress = 0;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"score" ascending:0];
    scoreSortDescriptor = v7->_scoreSortDescriptor;
    v7->_scoreSortDescriptor = (NSSortDescriptor *)v16;
  }
  return v7;
}

- (void)createEstimators
{
  if (!self->_estimatorRangeOnly.__ptr_.__value_)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_19DFF5000, logger, OS_LOG_TYPE_DEFAULT, "Initializing SharingImportanceManager", v3, 2u);
    }
    operator new();
  }
}

- (void)addRoseSolutions:(id)a3 currentMachContTime:(double)a4
{
  double v61 = a4;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
    *(double *)((char *)buf.__r_.__value_.__r.__words + 4) = v61;
    _os_log_impl(&dword_19DFF5000, logger, OS_LOG_TYPE_DEFAULT, "addRoseSolutions: current mach continuous time %lf", (uint8_t *)&buf, 0xCu);
  }
  v79[0] = 0;
  v79[1] = 0;
  v78 = (uint64_t *)v79;
  v6 = self->_logger;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    std::string::size_type v7 = [v62 count];
    LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v7;
    _os_log_impl(&dword_19DFF5000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "PRSharingSession: Got %lu solutions", (uint8_t *)&buf, 0xCu);
  }

  v63 = self;
  long long v77 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v74 = 0u;
  id v8 = v62;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v74 objects:v103 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v75;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v75 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v74 + 1) + 8 * v11);
        __str.__r_.__value_.__r.__words[0] = 0;
        unint64_t v13 = objc_msgSend(v12, "mac_addr", *(void *)&v61);
        __str.__r_.__value_.__r.__words[0] = v13;
        v14 = v79[0];
        if (!v79[0]) {
          goto LABEL_19;
        }
        v15 = v79;
        do
        {
          uint64_t v16 = v14;
          v17 = v15;
          unint64_t v18 = v14[4];
          objc_super v19 = v14 + 1;
          if (v18 >= v13)
          {
            objc_super v19 = v16;
            v15 = (void **)v16;
          }
          v14 = (void *)*v19;
        }
        while (v14);
        if (v15 == v79) {
          goto LABEL_19;
        }
        if (v18 < v13) {
          uint64_t v16 = v17;
        }
        if (v13 >= v16[4])
        {
          if ([v12 variant] == 1)
          {
            buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&__str;
            *((unsigned char *)std::__tree<std::__value_type<unsigned long long,BOOL>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,BOOL>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(&v78, (unint64_t *)&__str, (uint64_t)&std::piecewise_construct, &buf)+ 40) = 1;
          }
        }
        else
        {
LABEL_19:
          uint64_t v20 = [v12 variant];
          buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&__str;
          *((unsigned char *)std::__tree<std::__value_type<unsigned long long,BOOL>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,BOOL>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(&v78, (unint64_t *)&__str, (uint64_t)&std::piecewise_construct, &buf)+ 40) = v20 == 1;
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v21 = [v8 countByEnumeratingWithState:&v74 objects:v103 count:16];
      uint64_t v9 = v21;
    }
    while (v21);
  }

  p_isa = (id *)&v63->super.isa;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = v8;
  uint64_t v23 = [obj countByEnumeratingWithState:&v70 objects:v102 count:16];
  if (v23)
  {
    uint64_t v67 = *(void *)v71;
    int64x2_t v66 = vdupq_n_s64(0x7FF4000000000000uLL);
    do
    {
      uint64_t v68 = v23;
      for (uint64_t i = 0; i != v68; ++i)
      {
        if (*(void *)v71 != v67) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        if (objc_msgSend(v25, "variant", *(void *)&v61) != 1)
        {
          __str.__r_.__value_.__r.__words[0] = objc_msgSend(v25, "mac_addr");
          buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&__str;
          if (*((unsigned char *)std::__tree<std::__value_type<unsigned long long,BOOL>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,BOOL>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(&v78, (unint64_t *)&__str, (uint64_t)&std::piecewise_construct, &buf)+ 40))continue; {
        }
          }
        __str.__r_.__value_.__r.__words[0] = objc_msgSend(v25, "mac_addr");
        buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&__str;
        if (!*((unsigned char *)std::__tree<std::__value_type<unsigned long long,BOOL>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,BOOL>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(&v78, (unint64_t *)&__str, (uint64_t)&std::piecewise_construct, &buf)+ 40))
        {
          v26 = p_isa[14];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            std::string::size_type v27 = objc_msgSend(v25, "mac_addr");
            LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v27;
            _os_log_impl(&dword_19DFF5000, v26, OS_LOG_TYPE_DEFAULT, "PRSharingSession: Using raw measurement solution for MAC: 0x%016llx", (uint8_t *)&buf, 0xCu);
          }
        }
        if ([v25 variant] == 1)
        {
          v28 = p_isa[14];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            std::string::size_type v29 = objc_msgSend(v25, "mac_addr");
            LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v29;
            _os_log_impl(&dword_19DFF5000, v28, OS_LOG_TYPE_DEFAULT, "PRSharingSession: Using sensor-fused measurement solution for MAC: 0x%016llx", (uint8_t *)&buf, 0xCu);
          }
        }
        v30 = p_isa[14];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = "false";
          std::string::size_type v32 = objc_msgSend(v25, "mac_addr");
          objc_msgSend(v25, "mach_absolute_time_sec");
          std::string::size_type v65 = v33;
          if (objc_msgSend(v25, "mach_continuous_time_valid")) {
            v34 = "true";
          }
          else {
            v34 = "false";
          }
          objc_msgSend(v25, "mach_continuous_time_sec");
          uint64_t v36 = v35;
          objc_msgSend(v25, "range_m");
          uint64_t v38 = v37;
          objc_msgSend(v25, "range_unc_m");
          uint64_t v40 = v39;
          if (objc_msgSend(v25, "az_valid")) {
            v41 = "true";
          }
          else {
            v41 = "false";
          }
          objc_msgSend(v25, "az_deg");
          uint64_t v43 = v42;
          objc_msgSend(v25, "az_unc_deg");
          uint64_t v45 = v44;
          if (objc_msgSend(v25, "el_valid")) {
            v31 = "true";
          }
          objc_msgSend(v25, "el_deg");
          uint64_t v47 = v46;
          objc_msgSend(v25, "el_unc_deg");
          uint64_t v49 = v48;
          objc_msgSend(v25, "fov_confidence");
          uint64_t v51 = v50;
          unint64_t v52 = objc_msgSend(v25, "antenna_type");
          v53 = @"InvalidEnumValue";
          if (v52 <= 4) {
            v53 = off_1E599A238[v52];
          }
          uint64_t v54 = [(__CFString *)v53 UTF8String];
          int v55 = objc_msgSend(v25, "soi_rssi_valid");
          objc_msgSend(v25, "soi_rssi_dbm");
          LODWORD(buf.__r_.__value_.__l.__data_) = 134221826;
          v57 = "false";
          if (v55) {
            v57 = "true";
          }
          *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v32;
          WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
          *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v65;
          HIWORD(buf.__r_.__value_.__r.__words[2]) = 2080;
          uint64_t v81 = (uint64_t)v34;
          __int16 v82 = 2048;
          *(void *)v83 = v36;
          *(_WORD *)&v83[8] = 2048;
          *(void *)&v83[10] = v38;
          *(_WORD *)&v83[18] = 2048;
          *(void *)&v83[20] = v40;
          *(_WORD *)&v83[28] = 2080;
          v84 = v41;
          *(_WORD *)v85 = 2048;
          *(void *)&v85[2] = v43;
          __int16 v86 = 2048;
          uint64_t v87 = v45;
          __int16 v88 = 2080;
          v89 = v31;
          __int16 v90 = 2048;
          uint64_t v91 = v47;
          __int16 v92 = 2048;
          uint64_t v93 = v49;
          __int16 v94 = 2048;
          uint64_t v95 = v51;
          __int16 v96 = 2080;
          uint64_t v97 = v54;
          __int16 v98 = 2080;
          v99 = v57;
          __int16 v100 = 2048;
          uint64_t v101 = v56;
          _os_log_impl(&dword_19DFF5000, v30, OS_LOG_TYPE_DEFAULT, "PRSharingSession: new PRRoseSolution sent to estimator:\n MAC: 0x%016llx\n MAT: %f\n MCT_valid: %s\n MCT: %f\n range: %f\n range_unc: %f\n az_valid: %s\n az_deg: %f\n az_deg_unc: %f\n el_valid: %s\n el_deg: %f\n el_deg_unc: %f\n fov_confidence: %f\n antenna_type: %s\n soi_rssi_valid: %s\n"
            " soi_rssi_dbm: %f",
            (uint8_t *)&buf,
            0xA2u);
          p_isa = (id *)&v63->super.isa;
        }

        +[PRSharingSessionHelper UIntToHexString:len:](PRSharingSessionHelper, "UIntToHexString:len:", objc_msgSend(v25, "mac_addr"), 6);
        memset(&buf, 0, sizeof(buf));
        uint64_t v81 = 0x7FF4000000000000;
        __int16 v82 = 0;
        *(int64x2_t *)&v83[6] = v66;
        v83[22] = 0;
        *(_DWORD *)&v83[26] = 3;
        LOBYTE(v84) = 0;
        *(void *)v85 = 0x7FF4000000000000;
        *(_WORD *)&v85[8] = 0;
        std::string::operator=(&buf, &__str);
        objc_msgSend(v25, "mach_absolute_time_sec");
        uint64_t v81 = v58;
        LOBYTE(v82) = 1;
        objc_msgSend(v25, "range_m");
        *(void *)&v83[6] = v59;
        LOBYTE(v84) = objc_msgSend(v25, "soi_rssi_valid");
        objc_msgSend(v25, "soi_rssi_dbm");
        *(void *)v85 = v60;
        HIBYTE(v82) = 0;
        *(void *)&v83[14] = 0xC00921FB54442D18;
        v83[22] = 0;
        *(_DWORD *)&v83[26] = 3;
        *(_WORD *)&v85[8] = 0;
        [p_isa updateScoresWithNewMeasurement:&buf];
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(buf.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__str.__r_.__value_.__l.__data_);
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v70 objects:v102 count:16];
    }
    while (v23);
  }

  [p_isa reportScoresToClientAlways:0 useUpdatedScoreList:1 currentMachContTime:v61];
  std::__tree<Region>::destroy((uint64_t)&v78, v79[0]);
}

- (void)addBluetoothProximityEstimate:(NeighborMeasurements *)a3 currentMachContTime:
{
  double v4 = v3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = v4;
    _os_log_impl(&dword_19DFF5000, logger, OS_LOG_TYPE_DEFAULT, "addBluetoothProximityEstimate: current mach continuous time %lf", (uint8_t *)&v8, 0xCu);
  }
  [(PRSharingChoice *)self updateScoresWithNewMeasurement:a3];
  [(PRSharingChoice *)self reportScoresToClientAlways:0 useUpdatedScoreList:1 currentMachContTime:v4];
}

- (void)heartbeatTimeout:(double)a3 currentMachContTime:(double)a4 useUpdatedScores:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    double v11 = a4;
    _os_log_impl(&dword_19DFF5000, logger, OS_LOG_TYPE_DEFAULT, "heartbeatTimeout: current mach continuous time %lf", (uint8_t *)&v10, 0xCu);
  }
  if (v5) {
    [(PRSharingChoice *)self updateScoresForTime:a3];
  }
  [(PRSharingChoice *)self reportScoresToClientAlways:1 useUpdatedScoreList:v5 currentMachContTime:a4];
}

- (void)reportScoresToClientAlways:(BOOL)a3 useUpdatedScoreList:(BOOL)a4 currentMachContTime:(double)a5
{
  v80[1] = *MEMORY[0x1E4F143B8];
  BOOL v73 = a3;
  if (!a3 && !a4) {
    return;
  }
  if (a3 && !a4 && self->_newScoresHandler && [(NSArray *)self->_lastReportedScores count])
  {
    std::string::size_type v7 = (void (*)(void))*((void *)self->_newScoresHandler + 2);
    v7();
    return;
  }
  if (self->_lastScoreReportMachContinuousTime + 0.05 <= a5 || v73)
  {
    double v9 = [(NSMutableDictionary *)self->_scores allValues];
    v80[0] = self->_scoreSortDescriptor;
    int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:1];
    double v11 = [v9 sortedArrayUsingDescriptors:v10];
    uint64_t v12 = (void *)[v11 mutableCopy];

    unint64_t v13 = 0;
    unsigned int v14 = 0;
    while ([v12 count] > v13)
    {
      v15 = [v12 objectAtIndex:v13];
      uint64_t v16 = [v15 angle];
      int v17 = v16 != 0;

      v14 += v17;
      ++v13;
    }
    if (v14)
    {
      unint64_t v18 = 0;
      unsigned int v19 = -1;
      double v20 = -1.0;
      while ([v12 count] > v18)
      {
        uint64_t v21 = [v12 objectAtIndex:v18];
        v22 = [v21 angle];
        BOOL v23 = v22 == 0;

        if (!v23)
        {
          [v21 score];
          if (v20 >= v24)
          {
            [v21 score];
            if (v20 == v26)
            {
              std::string::size_type v27 = self->_logger;
              if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
              {
                [v21 score];
                *(_DWORD *)std::string buf = 134217984;
                long long v75 = v28;
                _os_log_impl(&dword_19DFF5000, (os_log_t)v27, OS_LOG_TYPE_DEFAULT, "Big Head Selection: multiple candidates with same score %f!", buf, 0xCu);
              }

              unsigned int v19 = -1;
            }
          }
          else
          {
            [v21 score];
            double v20 = v25;
            unsigned int v19 = v18;
          }
        }

        ++v18;
      }
      BOOL v29 = (v19 & 0x80000000) == 0;
      if (v14 >= 2 && (v19 & 0x80000000) == 0)
      {
        v30 = [v12 objectAtIndex:v19];
        v31 = self->_logger;
        if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
        {
          std::string::size_type v32 = [v30 btAddress];
          [v30 score];
          *(_DWORD *)std::string buf = 138412546;
          long long v75 = v32;
          __int16 v76 = 2048;
          uint64_t v77 = v33;
          _os_log_impl(&dword_19DFF5000, (os_log_t)v31, OS_LOG_TYPE_DEFAULT, "Big Head Selection: selected big head device %@ with score %f", buf, 0x16u);
        }
        BOOL v29 = 1;
      }
      BOOL v71 = v29;
    }
    else
    {
      BOOL v71 = 0;
      unsigned int v19 = -1;
    }
    unint64_t v34 = 0;
    uint64_t v35 = v19;
    while ([v12 count] > v34)
    {
      uint64_t v36 = [v12 objectAtIndex:v34];
      uint64_t v37 = [v36 angle];
      if (v37) {
        BOOL v38 = v35 == v34;
      }
      else {
        BOOL v38 = 1;
      }
      int v39 = !v38;

      if (v39)
      {
        uint64_t v40 = self->_logger;
        if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = [v36 angle];
          [v41 measurement];
          uint64_t v43 = v42;
          id v44 = [v36 btAddress];
          [v36 score];
          *(_DWORD *)std::string buf = 134218498;
          long long v75 = v43;
          __int16 v76 = 2112;
          uint64_t v77 = (uint64_t)v44;
          __int16 v78 = 2048;
          v79 = v45;
          _os_log_impl(&dword_19DFF5000, (os_log_t)v40, OS_LOG_TYPE_DEFAULT, "Big Head Selection: nil out angle %f for device %@ with score %f (II)", buf, 0x20u);
        }
        uint64_t v46 = [PRDeviceScore alloc];
        uint64_t v47 = [v36 btAddress];
        uint64_t v48 = [v36 proximity];
        uint64_t v49 = [v36 range];
        [v36 score];
        double v51 = v50;
        [v36 scoreUncertainty];
        v53 = [(PRDeviceScore *)v46 initWithValues:v47 proximity:v48 range:v49 angle:0 score:v51 scoreUncertainty:v52];

        [v36 timestamp];
        -[PRDeviceScore setTimestamp:](v53, "setTimestamp:");
        [v12 replaceObjectAtIndex:v34 withObject:v53];
      }
      ++v34;
    }
    if (v71)
    {
      uint64_t v54 = [v12 objectAtIndex:v35];
      [v54 btAddress];
      id obj = p_lastBigHeadMacAddress = &self->_lastBigHeadMacAddress;
      if (([obj isEqual:self->_lastBigHeadMacAddress] & 1) == 0)
      {
        if (self->_lastBigHeadFirstReportTime + 0.5 > a5)
        {
          if (v73 && self->_newScoresHandler)
          {
            logger = self->_logger;
            if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
            {
              v57 = *p_lastBigHeadMacAddress;
              *(_DWORD *)std::string buf = 138412802;
              long long v75 = v57;
              __int16 v76 = 2048;
              uint64_t v77 = 0x3FE0000000000000;
              __int16 v78 = 2112;
              v79 = obj;
              _os_log_impl(&dword_19DFF5000, logger, OS_LOG_TYPE_DEFAULT, "Big Head Selection: last big head %@ less than %f second(s), reporting previously reported big head %@", buf, 0x20u);
            }
            (*((void (**)(void))self->_newScoresHandler + 2))();
          }
          else
          {
            v69 = self->_logger;
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              long long v70 = *p_lastBigHeadMacAddress;
              *(_DWORD *)std::string buf = 138412802;
              long long v75 = v70;
              __int16 v76 = 2048;
              uint64_t v77 = 0x3FE0000000000000;
              __int16 v78 = 2112;
              v79 = obj;
              _os_log_impl(&dword_19DFF5000, v69, OS_LOG_TYPE_DEFAULT, "Big Head Selection: last big head %@ less than %f second(s), skip reporting current big head %@", buf, 0x20u);
            }
          }

LABEL_73:
          return;
        }
        self->_lastBigHeadFirstReportTime = a5;
        objc_storeStrong((id *)&self->_lastBigHeadMacAddress, obj);
      }
    }
    else
    {
      id obj = 0;
    }
    uint64_t v58 = [v12 count];
    if (v58 == [(NSArray *)self->_lastReportedScores count])
    {
      unint64_t v59 = 0;
      while ([v12 count] > v59)
      {
        uint64_t v60 = [v12 objectAtIndex:v59];
        double v61 = [(NSArray *)self->_lastReportedScores objectAtIndex:v59];
        id v62 = [v60 btAddress];
        v63 = [v61 btAddress];
        char v64 = [v62 isEqual:v63];

        if ((v64 & 1) == 0)
        {

          goto LABEL_68;
        }
        std::string::size_type v65 = [v60 angle];
        int64x2_t v66 = [v61 angle];
        BOOL v67 = v66 == 0;

        ++v59;
        if ((((v65 != 0) ^ v67) & 1) == 0) {
          goto LABEL_68;
        }
      }
      if (v73) {
        goto LABEL_68;
      }
    }
    else
    {
LABEL_68:
      self->_lastScoreReportMachContinuousTime = a5;
      objc_storeStrong((id *)&self->_lastReportedScores, v12);
      newScoresHandler = (void (**)(id, void *))self->_newScoresHandler;
      if (newScoresHandler) {
        newScoresHandler[2](newScoresHandler, v12);
      }
    }
    goto LABEL_73;
  }
}

- (void)updateScoresForTime:(double)a3
{
  v21[0] = 0;
  v21[1] = 0;
  double v20 = v21;
  SharingImportanceManager::getImportanceEstimates((uint64_t)self->_estimatorRangeOnly.__ptr_.__value_, (uint64_t)&v20, a3);
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v6 = [(NSMutableDictionary *)self->_scores allKeys];
  std::string::size_type v7 = (void *)[v5 initWithArray:v6];

  int v8 = v20;
  if (v20 != v21)
  {
    do
    {
      double v9 = +[PRSharingSessionHelper convertMacStringToNSData:v8 + 4];
      int v10 = +[PRSharingSessionHelper reverseNSData:v9];

      if ((_BYTE)v8[9])
      {
        double v11 = *((double *)v8 + 7);
        double v12 = *((double *)v8 + 8);
        uint64_t v13 = *((unsigned int *)v8 + 26);
        if ((_BYTE)v8[11])
        {
          unsigned int v14 = +[PRRangeMeasurement measurementWithRange:*((double *)v8 + 12) uncertainty:0.0];
        }
        else
        {
          unsigned int v14 = 0;
        }
        v15 = [[PRDeviceScore alloc] initWithValues:v10 proximity:+[PRSharingSessionHelper CoarseRangeToProx:v13] range:v14 angle:0 score:v11 scoreUncertainty:v12];
        [(NSMutableDictionary *)self->_scores setObject:v15 forKeyedSubscript:v10];

        uint64_t v16 = [(NSMutableDictionary *)self->_scores objectForKeyedSubscript:v10];
        [v16 setTimestamp:a3];

        [v7 removeObject:v10];
      }

      int v17 = v8[1];
      if (v17)
      {
        do
        {
          unint64_t v18 = (char **)v17;
          int v17 = *(char **)v17;
        }
        while (v17);
      }
      else
      {
        do
        {
          unint64_t v18 = (char **)v8[2];
          BOOL v19 = *v18 == (char *)v8;
          int v8 = v18;
        }
        while (!v19);
      }
      int v8 = v18;
    }
    while (v18 != v21);
  }
  [(NSMutableDictionary *)self->_scores removeObjectsForKeys:v7];

  std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::destroy((uint64_t)&v20, v21[0]);
}

- (void)updateScoresWithNewMeasurement:(const void *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  end = self->_measurements.userSharingInput.__end_;
  p_measurements = (uint64_t *)&self->_measurements;
  if (end >= self->_measurements.userSharingInput.__end_cap_.__value_)
  {
    std::string::size_type v7 = (NeighborMeasurements *)std::vector<NeighborMeasurements>::__push_back_slow_path<NeighborMeasurements const&>(p_measurements, (long long *)a3);
  }
  else
  {
    std::vector<NeighborMeasurements>::__construct_one_at_end[abi:ne180100]<NeighborMeasurements const&>((uint64_t)p_measurements, (long long *)a3);
    std::string::size_type v7 = (NeighborMeasurements *)((char *)end + 88);
  }
  self->_measurements.userSharingInput.__end_ = v7;
  SharingImportanceManager::handleMeasurements(self->_estimatorRangeOnly.__ptr_.__value_, &self->_measurements);
  std::vector<NeighborMeasurements>::__clear[abi:ne180100]((uint64_t *)&self->_measurements);
  [(PRSharingChoice *)self updateScoresForTime:*((double *)a3 + 3)];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *((void *)a3 + 3);
    int v10 = 134217984;
    uint64_t v11 = v9;
    _os_log_impl(&dword_19DFF5000, logger, OS_LOG_TYPE_DEFAULT, "measurement time %lf", (uint8_t *)&v10, 0xCu);
  }
  kdebug_trace();
}

- (id)newScoresHandler
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setNewScoresHandler:(id)a3
{
}

- (BOOL)useRegionBasedEstimator
{
  return self->_useRegionBasedEstimator;
}

- (void)setUseRegionBasedEstimator:(BOOL)a3
{
  self->_useRegionBasedEstimator = a3;
}

- (BOOL)currentlyInitiating
{
  return self->_currentlyInitiating;
}

- (void)setCurrentlyInitiating:(BOOL)a3
{
  self->_currentlyInitiating = a3;
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong(&self->_newScoresHandler, 0);
  std::unique_ptr<SharingImportanceManager>::reset[abi:ne180100](&self->_estimatorRangeOnly.__ptr_.__value_, 0);
  objc_storeStrong((id *)&self->_scoreSortDescriptor, 0);
  p_measurements = &self->_measurements;
  std::vector<NeighborMeasurements>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_measurements);
  objc_storeStrong((id *)&self->_lastReportedScores, 0);
  objc_storeStrong((id *)&self->_lastBigHeadMacAddress, 0);
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 11) = 0;
  return self;
}

@end