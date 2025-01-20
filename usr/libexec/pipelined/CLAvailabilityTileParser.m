@interface CLAvailabilityTileParser
+ (BOOL)generateAvlTileFromJSON:(id)a3 atPath:(id)a4;
+ (void)_setParamOverrides:(void *)a3 fromDict:(id)a4;
- (BOOL)_openTileFileForIncrementalIO;
- (BOOL)getNextVenueBoundsIncrementally:(void *)a3;
- (BOOL)tileIsOpenForIncrementalIO;
- (CLAvailabilityTileParser)init;
- (CLAvailabilityTileParser)initWithEmptyTile;
- (CLAvailabilityTileParser)initWithTilePathIncrementalIO:(id)a3;
- (NSURL)path;
- (id).cxx_construct;
- (int)numTotalExpectedExteriorsInVenues;
- (int)numVenuesExpected;
- (unint64_t)venuesCount;
- (void)getAvlTile;
@end

@implementation CLAvailabilityTileParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  cntrl = self->_avlTile.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (CLAvailabilityTileParser)initWithTilePathIncrementalIO:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLAvailabilityTileParser;
  v6 = [(CLAvailabilityTileParser *)&v10 init];
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_path, a3),
        ![(CLAvailabilityTileParser *)v7 _openTileFileForIncrementalIO]))
  {
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (BOOL)_openTileFileForIncrementalIO
{
  path = self->_path;
  if (!path)
  {
    if (qword_10047BEE8 == -1)
    {
      v9 = qword_10047BEF0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEE8, &stru_100452A10);
      v9 = qword_10047BEF0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
    }
    LOWORD(v21) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "_openTileFileForIncrementalIO: Must specify a valid path to deserialize the availability tile!", (uint8_t *)&v21, 2u);
    return 0;
  }
  id v4 = [(NSURL *)path path];
  id v5 = (const char *)[v4 UTF8String];
  size_t v6 = strlen(v5);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1000A6968();
  }
  std::string::size_type v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v11 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v11 = v6 | 7;
    }
    uint64_t v12 = v11 + 1;
    p_dst = (std::string *)operator new(v11 + 1);
    __dst.__r_.__value_.__l.__size_ = v7;
    __dst.__r_.__value_.__r.__words[2] = v12 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_13;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v6;
  p_dst = &__dst;
  if (v6) {
LABEL_13:
  }
    memmove(p_dst, v5, v7);
  p_dst->__r_.__value_.__s.__data_[v7] = 0;

  sub_100056B28((const char *)&__dst, 0, (int *)&v21);
  if (v21 > 1)
  {
    char v30 = 1;
    sub_100066E98(&__dst, &v30, (uint64_t)&v21);
    v13 = (char *)operator new(0x80uLL);
    *((void *)v13 + 1) = 0;
    *((void *)v13 + 2) = 0;
    *(void *)v13 = off_100452A40;
    *(_OWORD *)(v13 + 24) = v21;
    long long v21 = 0uLL;
    v13[40] = v22;
    *((void *)v13 + 6) = v23;
    *(_OWORD *)(v13 + 56) = *(_OWORD *)__p;
    *((void *)v13 + 9) = v25;
    __p[1] = 0;
    uint64_t v25 = 0;
    uint64_t v23 = 0;
    __p[0] = 0;
    *((_OWORD *)v13 + 5) = v26;
    v14 = v28;
    v28 = 0;
    *((void *)v13 + 12) = v27;
    *((void *)v13 + 13) = v14;
    *((_OWORD *)v13 + 7) = v29;
    cntrl = self->_avlTile.__cntrl_;
    self->_avlTile.__ptr_ = (AvailabilityTile *)(v13 + 24);
    self->_avlTile.__cntrl_ = (__shared_weak_count *)v13;
    if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
    v16 = v28;
    v28 = 0;
    if (v16)
    {
      sub_10006D968(v16);
      operator delete();
    }
    if (SHIBYTE(v25) < 0) {
      operator delete(__p[0]);
    }
    uint64_t v17 = v23;
    uint64_t v23 = 0;
    if (v17) {
      (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
    }
    v18 = (std::__shared_weak_count *)*((void *)&v21 + 1);
    if (*((void *)&v21 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v21 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
    BOOL v10 = v30 != 0;
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_33;
    }
    return v10;
  }
  if (qword_10047BEE8 == -1)
  {
    v19 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  dispatch_once(&qword_10047BEE8, &stru_100452A10);
  v19 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_ERROR))
  {
LABEL_31:
    LOWORD(v21) = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "_openTileFileForIncrementalIO: tile doesn't exist on-disk. attempting to deserialize will fail", (uint8_t *)&v21, 2u);
  }
LABEL_32:
  BOOL v10 = 0;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
LABEL_33:
  }
    operator delete(__dst.__r_.__value_.__l.__data_);
  return v10;
}

- (BOOL)tileIsOpenForIncrementalIO
{
  return *((unsigned char *)self->_avlTile.__ptr_ + 16);
}

- (BOOL)getNextVenueBoundsIncrementally:(void *)a3
{
  return sub_10006C00C((uint64_t)self->_avlTile.__ptr_, (uint64_t)a3);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (int)numVenuesExpected
{
  if ([(CLAvailabilityTileParser *)self tileIsOpenForIncrementalIO]) {
    return *((_DWORD *)self->_avlTile.__ptr_ + 14);
  }
  else {
    return [(CLAvailabilityTileParser *)self venuesCount];
  }
}

- (int)numTotalExpectedExteriorsInVenues
{
  return sub_10009C458((uint64_t)self->_avlTile.__ptr_);
}

- (void)getAvlTile
{
  return self->_avlTile.__ptr_;
}

- (CLAvailabilityTileParser)init
{
  v7.receiver = self;
  v7.super_class = (Class)CLAvailabilityTileParser;
  v2 = [(CLAvailabilityTileParser *)&v7 init];
  v3 = v2;
  if (!v2) {
    return v3;
  }
  path = v2->_path;
  v2->_path = 0;

  cntrl = (std::__shared_weak_count *)v3->_avlTile.__cntrl_;
  v3->_avlTile.__ptr_ = 0;
  v3->_avlTile.__cntrl_ = 0;
  if (!cntrl || atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return v3;
  }
  ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
  std::__shared_weak_count::__release_weak(cntrl);
  return v3;
}

- (CLAvailabilityTileParser)initWithEmptyTile
{
  v9.receiver = self;
  v9.super_class = (Class)CLAvailabilityTileParser;
  v2 = [(CLAvailabilityTileParser *)&v9 init];
  v3 = v2;
  if (!v2) {
    return v3;
  }
  path = v2->_path;
  v2->_path = 0;

  id v5 = (__shared_weak_count *)operator new(0x80uLL);
  *((void *)v5 + 1) = 0;
  *((void *)v5 + 2) = 0;
  *(void *)id v5 = off_100452A40;
  uint64_t v6 = sub_1001E0E2C((uint64_t)v5 + 24);
  cntrl = (std::__shared_weak_count *)v3->_avlTile.__cntrl_;
  v3->_avlTile.__ptr_ = (AvailabilityTile *)v6;
  v3->_avlTile.__cntrl_ = v5;
  if (!cntrl || atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return v3;
  }
  ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
  std::__shared_weak_count::__release_weak(cntrl);
  return v3;
}

- (unint64_t)venuesCount
{
  return (int)sub_1001E0EE0((uint64_t)self->_avlTile.__ptr_);
}

+ (void)_setParamOverrides:(void *)a3 fromDict:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 valueForKey:@"notifyIntervalNanos"];

  if (v6)
  {
    objc_super v7 = [v5 objectForKeyedSubscript:@"notifyIntervalNanos"];
    unsigned int v8 = [v7 unsignedIntValue];
    *((_DWORD *)a3 + 75) |= 1u;
    *((void *)a3 + 2) = v8;
  }
  objc_super v9 = [v5 valueForKey:@"numParticles"];

  if (v9)
  {
    BOOL v10 = [v5 objectForKeyedSubscript:@"numParticles"];
    unsigned int v11 = [v10 unsignedIntValue];
    *((_DWORD *)a3 + 75) |= 2u;
    *((_DWORD *)a3 + 6) = v11;
  }
  uint64_t v12 = [v5 valueForKey:@"localizerType"];

  if (v12)
  {
    v13 = [v5 objectForKeyedSubscript:@"localizerType"];
    unsigned int v14 = [v13 unsignedIntValue];
    *((_DWORD *)a3 + 75) |= 4u;
    *((_DWORD *)a3 + 7) = v14;
  }
  v15 = [v5 valueForKey:@"modeEstimator"];

  if (v15)
  {
    v16 = [v5 objectForKeyedSubscript:@"modeEstimator"];
    unsigned int v17 = [v16 unsignedIntValue];
    *((_DWORD *)a3 + 75) |= 0x10u;
    *((_DWORD *)a3 + 9) = v17;
  }
  v18 = [v5 valueForKey:@"confidenceFactor"];

  if (v18)
  {
    v19 = [v5 objectForKeyedSubscript:@"confidenceFactor"];
    [v19 floatValue];
    *((_DWORD *)a3 + 75) |= 0x20u;
    *((_DWORD *)a3 + 10) = v20;
  }
  long long v21 = [v5 valueForKey:@"motionPdrUnmodelledHeadingVariancePerSecond"];

  if (v21)
  {
    char v22 = [v5 objectForKeyedSubscript:@"motionPdrUnmodelledHeadingVariancePerSecond"];
    [v22 floatValue];
    *((_DWORD *)a3 + 75) |= 0x40u;
    *((_DWORD *)a3 + 11) = v23;
  }
  v24 = [v5 valueForKey:@"time2dMotionVariancePerSecond"];

  if (v24)
  {
    uint64_t v25 = [v5 objectForKeyedSubscript:@"time2dMotionVariancePerSecond"];
    [v25 floatValue];
    *((_DWORD *)a3 + 75) |= 0x800u;
    *((_DWORD *)a3 + 24) = v26;
  }
  uint64_t v27 = [v5 valueForKey:@"secondsBetweenVenueTransitions"];

  if (v27)
  {
    v28 = [v5 objectForKeyedSubscript:@"secondsBetweenVenueTransitions"];
    [v28 doubleValue];
    *((_DWORD *)a3 + 75) |= 0x8000u;
    *((void *)a3 + 14) = v29;
  }
  char v30 = [v5 valueForKey:@"coarseIndoorFloorSelection"];

  if (v30)
  {
    v31 = [v5 objectForKeyedSubscript:@"coarseIndoorFloorSelection"];
    unsigned int v32 = [v31 unsignedIntValue];
    *((_DWORD *)a3 + 75) |= 1u;
    *((void *)a3 + 2) = v32;
  }
  v33 = [v5 valueForKey:@"gpsStrobeDistance"];

  if (v33)
  {
    v34 = [v5 objectForKeyedSubscript:@"gpsStrobeDistance"];
    [v34 floatValue];
    *((_DWORD *)a3 + 75) |= 0x20000u;
    *((_DWORD *)a3 + 30) = v35;
  }
  v36 = [v5 valueForKey:@"lifespanDeepIndoors"];

  if (v36)
  {
    v37 = [v5 objectForKeyedSubscript:@"lifespanDeepIndoors"];
    [v37 floatValue];
    *((_DWORD *)a3 + 75) |= 0x40000u;
    *((_DWORD *)a3 + 31) = v38;
  }
  v39 = [v5 valueForKey:@"lifespanNearVenueEdge"];

  if (v39)
  {
    v40 = [v5 objectForKeyedSubscript:@"lifespanNearVenueEdge"];
    [v40 floatValue];
    *((_DWORD *)a3 + 75) |= 0x80000u;
    *((_DWORD *)a3 + 32) = v41;
  }
  v42 = [v5 valueForKey:@"lifespanAuxiliary"];

  if (v42)
  {
    v43 = [v5 objectForKeyedSubscript:@"lifespanAuxiliary"];
    [v43 floatValue];
    *((_DWORD *)a3 + 75) |= 0x100000u;
    *((_DWORD *)a3 + 33) = v44;
  }
  v45 = [v5 valueForKey:@"wifiLikelihoodOnMapPriorFactor"];

  if (v45)
  {
    v46 = [v5 objectForKeyedSubscript:@"wifiLikelihoodOnMapPriorFactor"];
    [v46 floatValue];
    *((_DWORD *)a3 + 75) |= 0x200000u;
    *((_DWORD *)a3 + 34) = v47;
  }
  v48 = [v5 valueForKey:@"coarseIndoorRadioOddsTransform"];

  if (v48)
  {
    v49 = [v5 objectForKeyedSubscript:@"coarseIndoorRadioOddsTransform"];
    unsigned int v50 = [v49 unsignedIntValue];
    *((_DWORD *)a3 + 75) |= 0x800000u;
    *((_DWORD *)a3 + 35) = v50;
  }
  v51 = [v5 valueForKey:@"feasibleLocationRequiredPrbIndoor"];

  if (v51)
  {
    v52 = [v5 objectForKeyedSubscript:@"feasibleLocationRequiredPrbIndoor"];
    [v52 doubleValue];
    *((_DWORD *)a3 + 75) |= 0x1000000u;
    *((void *)a3 + 19) = v53;
  }
  v54 = [v5 valueForKey:@"assignFloorWeightsByLikelihood"];

  if (v54)
  {
    v55 = [v5 objectForKeyedSubscript:@"assignFloorWeightsByLikelihood"];
    unsigned __int8 v56 = [v55 BOOLValue];
    *((_DWORD *)a3 + 75) |= 0x10000000u;
    *((unsigned char *)a3 + 192) = v56;
  }
  v57 = [v5 valueForKey:@"priorOnMapWeightFraction"];

  if (v57)
  {
    v58 = [v5 objectForKeyedSubscript:@"priorOnMapWeightFraction"];
    [v58 doubleValue];
    *((_DWORD *)a3 + 75) |= 0x20000000u;
    *((void *)a3 + 23) = v59;
  }
  v60 = [v5 valueForKey:@"enableBaroAidedFloorTransition"];

  if (v60)
  {
    v61 = [v5 objectForKeyedSubscript:@"enableBaroAidedFloorTransition"];
    unsigned __int8 v62 = [v61 BOOLValue];
    *((_DWORD *)a3 + 75) |= 0x40000000u;
    *((unsigned char *)a3 + 193) = v62;
  }
  v63 = [v5 valueForKey:@"time2dMotionVariancePerSecondWifi2"];

  if (v63)
  {
    v64 = [v5 objectForKeyedSubscript:@"time2dMotionVariancePerSecondWifi2"];
    [v64 floatValue];
    *((_DWORD *)a3 + 75) |= 0x80000000;
    *((_DWORD *)a3 + 49) = v65;
  }
  v66 = [v5 valueForKey:@"bilinearObservations"];

  if (v66)
  {
    v67 = [v5 objectForKeyedSubscript:@"bilinearObservations"];
    unsigned __int8 v68 = [v67 BOOLValue];
    *((_DWORD *)a3 + 76) |= 2u;
    *((unsigned char *)a3 + 194) = v68;
  }
  v69 = [v5 valueForKey:@"walkableBlueDotSearchRadius"];

  if (v69)
  {
    v70 = [v5 objectForKeyedSubscript:@"walkableBlueDotSearchRadius"];
    [v70 floatValue];
    *((_DWORD *)a3 + 76) |= 0x10u;
    *((_DWORD *)a3 + 56) = v71;
  }
  v72 = [v5 valueForKey:@"motionPdrUnmodelledHeadingVariancePerSecondWifi2"];

  if (v72)
  {
    v73 = [v5 objectForKeyedSubscript:@"motionPdrUnmodelledHeadingVariancePerSecondWifi2"];
    [v73 floatValue];
    *((_DWORD *)a3 + 76) |= 0x40u;
    *((_DWORD *)a3 + 57) = v74;
  }
  v75 = [v5 valueForKey:@"particleFilterOffMapProbabilityFloor"];

  if (v75)
  {
    v76 = [v5 objectForKeyedSubscript:@"particleFilterOffMapProbabilityFloor"];
    [v76 floatValue];
    *((_DWORD *)a3 + 76) |= 0x100u;
    *((_DWORD *)a3 + 62) = v77;
  }
  v78 = [v5 valueForKey:@"coarseOutdoorProbabilityFloor"];

  if (v78)
  {
    v79 = [v5 objectForKeyedSubscript:@"coarseOutdoorProbabilityFloor"];
    [v79 floatValue];
    *((_DWORD *)a3 + 76) |= 0x200u;
    *((_DWORD *)a3 + 63) = v80;
  }
  v81 = [v5 valueForKey:@"pdr"];

  if (v81)
  {
    if (qword_10047BEE8 == -1)
    {
      v82 = (id)qword_10047BEF0;
      if (!os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
LABEL_55:

        goto LABEL_56;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEE8, &stru_100452A10);
      v82 = (id)qword_10047BEF0;
      if (!os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_55;
      }
    }
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning pdr is not currently supported", v113, 2u);
    goto LABEL_55;
  }
LABEL_56:
  v83 = [v5 valueForKey:@"pedomCompassMotionWifi2"];

  if (!v83) {
    goto LABEL_61;
  }
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452A10);
    v84 = (id)qword_10047BEF0;
    if (!os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
  v84 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
  {
LABEL_59:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning pedomCompassMotionWifi2 is not currently supported", v113, 2u);
  }
LABEL_60:

LABEL_61:
  v85 = [v5 valueForKey:@"deadReckoning"];

  if (!v85) {
    goto LABEL_66;
  }
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452A10);
    v86 = (id)qword_10047BEF0;
    if (!os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }
  v86 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
  {
LABEL_64:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning deadReckoning is not currently supported", v113, 2u);
  }
LABEL_65:

LABEL_66:
  v87 = [v5 valueForKey:@"coarseIndoor"];

  if (!v87) {
    goto LABEL_71;
  }
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452A10);
    v88 = (id)qword_10047BEF0;
    if (!os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_70;
    }
    goto LABEL_69;
  }
  v88 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
  {
LABEL_69:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning coarseIndoor is not currently supported", v113, 2u);
  }
LABEL_70:

LABEL_71:
  v89 = [v5 valueForKey:@"gpsFusionGlobalParams"];

  if (!v89) {
    goto LABEL_76;
  }
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452A10);
    v90 = (id)qword_10047BEF0;
    if (!os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_75;
    }
    goto LABEL_74;
  }
  v90 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
  {
LABEL_74:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning gpsFusionGlobalParams is not currently supported", v113, 2u);
  }
LABEL_75:

LABEL_76:
  v91 = [v5 valueForKey:@"wifi"];

  if (!v91) {
    goto LABEL_81;
  }
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452A10);
    v92 = (id)qword_10047BEF0;
    if (!os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_80;
    }
    goto LABEL_79;
  }
  v92 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
  {
LABEL_79:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning wifi is not currently supported", v113, 2u);
  }
LABEL_80:

LABEL_81:
  v93 = [v5 valueForKey:@"bodyFixed"];

  if (!v93) {
    goto LABEL_86;
  }
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452A10);
    v94 = (id)qword_10047BEF0;
    if (!os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_85;
    }
    goto LABEL_84;
  }
  v94 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
  {
LABEL_84:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning bodyFixed is not currently supported", v113, 2u);
  }
LABEL_85:

LABEL_86:
  v95 = [v5 valueForKey:@"motionTruth"];

  if (!v95) {
    goto LABEL_91;
  }
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452A10);
    v96 = (id)qword_10047BEF0;
    if (!os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_90;
    }
    goto LABEL_89;
  }
  v96 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
  {
LABEL_89:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning motionTruth is not currently supported", v113, 2u);
  }
LABEL_90:

LABEL_91:
  v97 = [v5 valueForKey:@"multiphoneDbm"];

  if (!v97) {
    goto LABEL_96;
  }
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452A10);
    v98 = (id)qword_10047BEF0;
    if (!os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_95;
    }
    goto LABEL_94;
  }
  v98 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
  {
LABEL_94:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning multiphoneDbm is not currently supported", v113, 2u);
  }
LABEL_95:

LABEL_96:
  v99 = [v5 valueForKey:@"pedomCompassMotion"];

  if (!v99) {
    goto LABEL_101;
  }
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452A10);
    v100 = (id)qword_10047BEF0;
    if (!os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_100;
    }
    goto LABEL_99;
  }
  v100 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
  {
LABEL_99:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning pedomCompassMotion is not currently supported", v113, 2u);
  }
LABEL_100:

LABEL_101:
  v101 = [v5 valueForKey:@"injection"];

  if (!v101) {
    goto LABEL_106;
  }
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452A10);
    v102 = (id)qword_10047BEF0;
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_105;
    }
    goto LABEL_104;
  }
  v102 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
  {
LABEL_104:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning injection is not currently supported", v113, 2u);
  }
LABEL_105:

LABEL_106:
  v103 = [v5 valueForKey:@"beacon"];

  if (!v103) {
    goto LABEL_111;
  }
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452A10);
    v104 = (id)qword_10047BEF0;
    if (!os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_110;
    }
    goto LABEL_109;
  }
  v104 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
  {
LABEL_109:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning beacon is not currently supported", v113, 2u);
  }
LABEL_110:

LABEL_111:
  v105 = [v5 valueForKey:@"wallBehavior"];

  if (!v105) {
    goto LABEL_116;
  }
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452A10);
    v106 = (id)qword_10047BEF0;
    if (!os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_115;
    }
    goto LABEL_114;
  }
  v106 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
  {
LABEL_114:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning wallBehavior is not currently supported", v113, 2u);
  }
LABEL_115:

LABEL_116:
  v107 = [v5 valueForKey:@"dynamicUniverseParameters"];

  if (!v107) {
    goto LABEL_121;
  }
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452A10);
    v108 = (id)qword_10047BEF0;
    if (!os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_120;
    }
    goto LABEL_119;
  }
  v108 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
  {
LABEL_119:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning dynamicUniverseParameters is not currently supported", v113, 2u);
  }
LABEL_120:

LABEL_121:
  v109 = [v5 valueForKey:@"dynamicUniverseParameters"];

  if (!v109) {
    goto LABEL_126;
  }
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452A10);
    v110 = (id)qword_10047BEF0;
    if (!os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_125;
    }
    goto LABEL_124;
  }
  v110 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
  {
LABEL_124:
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning dynamicUniverseParameters is not currently supported", v113, 2u);
  }
LABEL_125:

LABEL_126:
  v111 = [v5 valueForKey:@"altitude"];

  if (v111)
  {
    if (qword_10047BEE8 == -1)
    {
      v112 = (id)qword_10047BEF0;
      if (!os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
      {
LABEL_130:

        goto LABEL_131;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEE8, &stru_100452A10);
      v112 = (id)qword_10047BEF0;
      if (!os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_130;
      }
    }
    *(_WORD *)v113 = 0;
    _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "@IndoorAvl, generateAvlTileFromJSON, #warning altitude is not currently supported", v113, 2u);
    goto LABEL_130;
  }
LABEL_131:
}

+ (BOOL)generateAvlTileFromJSON:(id)a3 atPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v175 = v5;
  v170 = v6;
  if (v5)
  {
    if (v6)
    {
      [v5 dataUsingEncoding:4];
      v169 = uint64_t v201 = 0;
      v176 = +[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:");
      id v172 = 0;
      if (v172)
      {
        if (qword_10047BEE8 != -1) {
          dispatch_once(&qword_10047BEE8, &stru_100452A10);
        }
        log = (id)qword_10047BEF0;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          id v7 = [v172 description];
          id v8 = [v7 UTF8String];
          id v9 = [v175 UTF8String];
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v9;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "@IndoorAvl, generateAvlTileFromJSON, failed to generate, error=%s, str=\n%s\n", buf, 0x16u);
        }
        BOOL v10 = 0;
        goto LABEL_154;
      }
      unsigned int v11 = [v176 objectForKey:@"venues"];
      uint64_t v12 = v11;
      if (v11)
      {
        if ([v11 count])
        {
          sub_10006D9A4((uint64_t)buf);
          v166 = v12;
          if (qword_10047BEE8 != -1) {
            dispatch_once(&qword_10047BEE8, &stru_100452A10);
          }
          v13 = (id)qword_10047BEF0;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            id v14 = [v166 count];
            LODWORD(v202[0]) = 134217984;
            *(void **)((char *)v202 + 4) = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "@IndoorAvl, generateAvlTileFromJSON, adding %lu venues", (uint8_t *)v202, 0xCu);
          }

          long long v199 = 0u;
          long long v200 = 0u;
          long long v197 = 0u;
          long long v198 = 0u;
          log = v166;
          id v167 = [log countByEnumeratingWithState:&v197 objects:v206 count:16];
          if (v167)
          {
            uint64_t v168 = *(void *)v198;
            do
            {
              for (i = 0; i != v167; i = (char *)i + 1)
              {
                if (*(void *)v198 != v168) {
                  objc_enumerationMutation(log);
                }
                v174 = *(void **)(*((void *)&v197 + 1) + 8 * i);
                int v15 = *(_DWORD *)v208;
                uint64_t v16 = *(int *)&buf[24];
                if (*(int *)&buf[24] >= *(int *)v208)
                {
                  if (*(_DWORD *)v208 == *(_DWORD *)&v208[4])
                  {
                    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)&buf[16], *(_DWORD *)v208 + 1);
                    int v15 = *(_DWORD *)v208;
                  }
                  *(_DWORD *)v208 = v15 + 1;
                  operator new();
                }
                ++*(_DWORD *)&buf[24];
                uint64_t v17 = *(void *)(*(void *)&buf[16] + 8 * v16);
                v18 = [v174 objectForKey:@"exteriors"];
                long long v195 = 0u;
                long long v196 = 0u;
                long long v193 = 0u;
                long long v194 = 0u;
                obunint64_t j = v18;
                id v19 = [obj countByEnumeratingWithState:&v193 objects:v205 count:16];
                id v20 = v19;
                if (v19)
                {
                  uint64_t v178 = *(void *)v194;
                  do
                  {
                    long long v21 = 0;
                    do
                    {
                      if (*(void *)v194 != v178) {
                        objc_enumerationMutation(obj);
                      }
                      char v22 = *(void **)(*((void *)&v193 + 1) + 8 * (void)v21);
                      int v23 = *(_DWORD *)(v17 + 52);
                      uint64_t v24 = *(int *)(v17 + 48);
                      if ((int)v24 >= v23)
                      {
                        if (v23 == *(_DWORD *)(v17 + 56))
                        {
                          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)(v17 + 40), v23 + 1);
                          int v23 = *(_DWORD *)(v17 + 52);
                        }
                        *(_DWORD *)(v17 + 52) = v23 + 1;
                        operator new();
                      }
                      uint64_t v25 = *(void *)(v17 + 40);
                      *(_DWORD *)(v17 + 48) = v24 + 1;
                      uint64_t v26 = *(void *)(v25 + 8 * v24);
                      uint64_t v27 = [v22 objectForKey:@"latitude"];
                      v179 = v22;
                      v28 = [v22 objectForKey:@"longitude"];
                      if (qword_10047BEE8 != -1) {
                        dispatch_once(&qword_10047BEE8, &stru_100452A10);
                      }
                      uint64_t v29 = (id)qword_10047BEF0;
                      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                      {
                        id v30 = [v27 count];
                        LODWORD(v202[0]) = 134217984;
                        *(void **)((char *)v202 + 4) = v30;
                        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "@IndoorAvl, generateAvlTileFromJSON, adding %lu exterior points", (uint8_t *)v202, 0xCu);
                      }

                      for (unint64_t j = 0; j < (unint64_t)[v27 count]; ++j)
                      {
                        unsigned int v32 = [v27 objectAtIndex:j];
                        [v32 doubleValue];
                        int v34 = *(_DWORD *)(v26 + 24);
                        if (v34 == *(_DWORD *)(v26 + 28))
                        {
                          if (2 * v34 <= v34 + 1) {
                            int v35 = v34 + 1;
                          }
                          else {
                            int v35 = 2 * v34;
                          }
                          if (v35 <= 4) {
                            int v35 = 4;
                          }
                          *(_DWORD *)(v26 + 28) = v35;
                          operator new[]();
                        }
                        uint64_t v36 = *(void *)(v26 + 16);
                        *(_DWORD *)(v26 + 24) = v34 + 1;
                        *(void *)(v36 + 8 * v34) = v33;

                        v37 = [v28 objectAtIndex:j];
                        [v37 doubleValue];
                        int v39 = *(_DWORD *)(v26 + 48);
                        if (v39 == *(_DWORD *)(v26 + 52))
                        {
                          if (2 * v39 <= v39 + 1) {
                            int v40 = v39 + 1;
                          }
                          else {
                            int v40 = 2 * v39;
                          }
                          if (v40 <= 4) {
                            int v40 = 4;
                          }
                          *(_DWORD *)(v26 + 52) = v40;
                          operator new[]();
                        }
                        uint64_t v41 = *(void *)(v26 + 40);
                        *(_DWORD *)(v26 + 48) = v39 + 1;
                        *(void *)(v41 + 8 * v39) = v38;
                      }
                      v42 = [v179 valueForKey:@"tolerance"];
                      [v42 doubleValue];
                      *(_DWORD *)(v26 + 76) |= 4u;
                      *(void *)(v26 + 64) = v43;

                      long long v21 = (char *)v21 + 1;
                    }
                    while (v21 != v20);
                    id v20 = [obj countByEnumeratingWithState:&v193 objects:v205 count:16];
                  }
                  while (v20);
                }

                long long v191 = 0u;
                long long v192 = 0u;
                long long v190 = 0u;
                long long v189 = 0u;
                int v44 = [v174 objectForKey:@"ids"];
                id v45 = [v44 countByEnumeratingWithState:&v189 objects:v204 count:16];
                if (v45)
                {
                  uint64_t v46 = *(void *)v190;
                  do
                  {
                    for (k = 0; k != v45; k = (char *)k + 1)
                    {
                      if (*(void *)v190 != v46) {
                        objc_enumerationMutation(v44);
                      }
                      id v48 = *(id *)(*((void *)&v189 + 1) + 8 * (void)k);
                      v49 = (wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)[v48 UTF8String];
                      unsigned int v50 = (const std::string::value_type *)v49;
                      int v51 = *(_DWORD *)(v17 + 28);
                      uint64_t v52 = *(int *)(v17 + 24);
                      if ((int)v52 >= v51)
                      {
                        if (v51 == *(_DWORD *)(v17 + 32))
                        {
                          v49 = (wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)(v17 + 16), v51 + 1);
                          int v51 = *(_DWORD *)(v17 + 28);
                        }
                        *(_DWORD *)(v17 + 28) = v51 + 1;
                        v54 = (std::string *)wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New(v49);
                        uint64_t v55 = *(void *)(v17 + 16);
                        uint64_t v56 = *(int *)(v17 + 24);
                        *(_DWORD *)(v17 + 24) = v56 + 1;
                        *(void *)(v55 + 8 * v56) = v54;
                      }
                      else
                      {
                        uint64_t v53 = *(void *)(v17 + 16);
                        *(_DWORD *)(v17 + 24) = v52 + 1;
                        v54 = *(std::string **)(v53 + 8 * v52);
                      }
                      std::string::assign(v54, v50);
                      if (qword_10047BEE8 != -1) {
                        dispatch_once(&qword_10047BEE8, &stru_100452A10);
                      }
                      v57 = (id)qword_10047BEF0;
                      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                      {
                        id v58 = [v48 UTF8String];
                        LODWORD(v202[0]) = 136315138;
                        *(void **)((char *)v202 + 4) = v58;
                        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "@IndoorAvl, generateAvlTileFromJSON, added venue ID %s", (uint8_t *)v202, 0xCu);
                      }
                    }
                    id v45 = [v44 countByEnumeratingWithState:&v189 objects:v204 count:16];
                  }
                  while (v45);
                }

                uint64_t v59 = [v174 valueForKey:@"context"];
                unsigned int v60 = [v59 intValue];

                if (v60 - 1 < 2)
                {
                  *(_DWORD *)(v17 + 104) |= 8u;
                  *(_DWORD *)(v17 + 96) = v60;
                }
                v61 = [v174 objectForKey:@"tileDownloadConfiguration"];
                unsigned __int8 v62 = [v61 objectForKey:@"floorIdxsForWifiDownloadOnly"];
                *(_DWORD *)(v17 + 104) |= 4u;
                uint64_t v63 = *(void *)(v17 + 64);
                if (!v63) {
                  operator new();
                }
                long long v187 = 0u;
                long long v188 = 0u;
                long long v185 = 0u;
                long long v186 = 0u;
                id v64 = v62;
                id v65 = [v64 countByEnumeratingWithState:&v185 objects:v203 count:16];
                if (v65)
                {
                  uint64_t v66 = *(void *)v186;
                  do
                  {
                    for (m = 0; m != v65; m = (char *)m + 1)
                    {
                      if (*(void *)v186 != v66) {
                        objc_enumerationMutation(v64);
                      }
                      unsigned int v69 = [*(id *)(*((void *)&v185 + 1) + 8 * (void)m) unsignedIntValue];
                      int v70 = *(_DWORD *)(v63 + 24);
                      if (v70 == *(_DWORD *)(v63 + 28))
                      {
                        if (2 * v70 <= v70 + 1) {
                          int v71 = v70 + 1;
                        }
                        else {
                          int v71 = 2 * v70;
                        }
                        if (v71 <= 4) {
                          int v71 = 4;
                        }
                        *(_DWORD *)(v63 + 28) = v71;
                        operator new[]();
                      }
                      uint64_t v68 = *(void *)(v63 + 16);
                      *(_DWORD *)(v63 + 24) = v70 + 1;
                      *(_DWORD *)(v68 + 4 * v70) = v69;
                    }
                    id v65 = [v64 countByEnumeratingWithState:&v185 objects:v203 count:16];
                  }
                  while (v65);
                }
              }
              id v167 = [log countByEnumeratingWithState:&v197 objects:v206 count:16];
            }
            while (v167);
          }

          v72 = [v176 valueForKey:@"parameterOverrides"];
          BOOL v73 = v72 == 0;

          if (!v73)
          {
            v223 |= 2u;
            uint64_t v74 = v209;
            if (!v209) {
              operator new();
            }
            v75 = [v176 objectForKeyedSubscript:@"parameterOverrides"];
            +[CLAvailabilityTileParser _setParamOverrides:v74 fromDict:v75];
          }
          v76 = [v176 objectForKey:@"motionActivityDebounceParameters"];
          BOOL v77 = v76 == 0;

          if (!v77)
          {
            v78 = [v176 objectForKey:@"motionActivityDebounceParameters"];
            v79 = [v78 valueForKey:@"nonFitnessToCyclingSeconds"];
            BOOL v80 = v79 == 0;

            if (!v80)
            {
              v223 |= 0x4000u;
              uint64_t v81 = v221;
              if (!v221) {
                operator new();
              }
              v82 = [v78 valueForKey:@"nonFitnessToCyclingSeconds"];
              unsigned int v83 = [v82 unsignedIntValue];
              *(_DWORD *)(v81 + 36) |= 1u;
              *(_DWORD *)(v81 + 16) = v83;
            }
            v84 = [v78 valueForKey:@"nonFitnessToRunningSeconds"];
            BOOL v85 = v84 == 0;

            if (!v85)
            {
              v223 |= 0x4000u;
              uint64_t v86 = v221;
              if (!v221) {
                operator new();
              }
              v87 = [v78 valueForKey:@"nonFitnessToRunningSeconds"];
              unsigned int v88 = [v87 unsignedIntValue];
              *(_DWORD *)(v86 + 36) |= 2u;
              *(_DWORD *)(v86 + 20) = v88;
            }
            v89 = [v78 valueForKey:@"runningToNonFitnessSeconds"];
            BOOL v90 = v89 == 0;

            if (!v90)
            {
              v223 |= 0x4000u;
              uint64_t v91 = v221;
              if (!v221) {
                operator new();
              }
              v92 = [v78 valueForKey:@"runningToNonFitnessSeconds"];
              unsigned int v93 = [v92 unsignedIntValue];
              *(_DWORD *)(v91 + 36) |= 4u;
              *(_DWORD *)(v91 + 24) = v93;
            }
            v94 = [v78 valueForKey:@"cyclingToNonFitnessSeconds"];
            BOOL v95 = v94 == 0;

            if (!v95)
            {
              v223 |= 0x4000u;
              uint64_t v96 = v221;
              if (!v221) {
                operator new();
              }
              v97 = [v78 valueForKey:@"cyclingToNonFitnessSeconds"];
              unsigned int v98 = [v97 unsignedIntValue];
              *(_DWORD *)(v96 + 36) |= 8u;
              *(_DWORD *)(v96 + 28) = v98;
            }
          }
          v99 = [v176 valueForKey:@"availabilityZScoreConfidenceInterval"];
          BOOL v100 = v99 == 0;

          if (!v100)
          {
            v101 = [v176 valueForKey:@"availabilityZScoreConfidenceInterval"];
            [v101 doubleValue];
            v223 |= 4u;
            uint64_t v210 = v102;
          }
          v103 = [v176 valueForKey:@"indoorPrefetchRadiusKM"];
          BOOL v104 = v103 == 0;

          if (!v104)
          {
            v105 = [v176 valueForKey:@"indoorPrefetchRadiusKM"];
            unsigned int v106 = [v105 unsignedIntValue];
            v223 |= 8u;
            unsigned int v211 = v106;
          }
          v107 = [v176 valueForKey:@"regionalPrefetchRadiusKM"];
          BOOL v108 = v107 == 0;

          if (!v108)
          {
            v109 = [v176 valueForKey:@"regionalPrefetchRadiusKM"];
            unsigned int v110 = [v109 unsignedIntValue];
            v223 |= 0x10u;
            unsigned int v212 = v110;
          }
          v111 = [v176 valueForKey:@"indoorPrefetchMaxFloorCount"];
          BOOL v112 = v111 == 0;

          if (!v112)
          {
            v113 = [v176 valueForKey:@"indoorPrefetchMaxFloorCount"];
            unsigned int v114 = [v113 unsignedIntValue];
            v223 |= 0x20u;
            unsigned int v213 = v114;
          }
          v115 = [v176 valueForKey:@"regionalPrefetchMaxFloorCount"];
          BOOL v116 = v115 == 0;

          if (!v116)
          {
            v117 = [v176 valueForKey:@"regionalPrefetchMaxFloorCount"];
            unsigned int v118 = [v117 unsignedIntValue];
            v223 |= 0x40u;
            unsigned int v214 = v118;
          }
          v119 = [v176 valueForKey:@"indoorPrefetchMaxTotalBytes"];
          BOOL v120 = v119 == 0;

          if (!v120)
          {
            v121 = [v176 valueForKey:@"indoorPrefetchMaxTotalBytes"];
            unsigned int v122 = [v121 unsignedIntValue];
            v223 |= 0x80u;
            unsigned int v215 = v122;
          }
          v123 = [v176 valueForKey:@"regionalPrefetchMaxTotalBytes"];
          BOOL v124 = v123 == 0;

          if (!v124)
          {
            v125 = [v176 valueForKey:@"regionalPrefetchMaxTotalBytes"];
            unsigned int v126 = [v125 unsignedIntValue];
            v223 |= 0x100u;
            unsigned int v216 = v126;
          }
          v127 = [v176 valueForKey:@"indoorLocationOfInterestMergeRadiusKM"];
          BOOL v128 = v127 == 0;

          if (!v128)
          {
            v129 = [v176 valueForKey:@"indoorLocationOfInterestMergeRadiusKM"];
            unsigned int v130 = [v129 unsignedIntValue];
            v223 |= 0x200u;
            unsigned int v217 = v130;
          }
          v131 = [v176 valueForKey:@"regionalLocationOfInterestMergeRadiusKM"];
          BOOL v132 = v131 == 0;

          if (!v132)
          {
            v133 = [v176 valueForKey:@"regionalLocationOfInterestMergeRadiusKM"];
            unsigned int v134 = [v133 unsignedIntValue];
            v223 |= 0x400u;
            unsigned int v218 = v134;
          }
          v135 = [v176 valueForKey:@"preferPredictionWithinNActivityCycles"];
          BOOL v136 = v135 == 0;

          if (!v136)
          {
            v137 = [v176 valueForKey:@"preferPredictionWithinNActivityCycles"];
            unsigned int v138 = [v137 unsignedIntValue];
            v223 |= 0x800u;
            unsigned int v219 = v138;
          }
          v139 = [v176 valueForKey:@"indoorNumberOfDaysBeforeTileRedownload"];
          BOOL v140 = v139 == 0;

          if (!v140)
          {
            v141 = [v176 valueForKey:@"indoorNumberOfDaysBeforeTileRedownload"];
            [v141 floatValue];
            v223 |= 0x1000u;
            int v220 = v142;
          }
          v143 = [v176 valueForKey:@"regionalNumberOfDaysBeforeTileRedownload"];
          BOOL v144 = v143 == 0;

          if (!v144)
          {
            v145 = [v176 valueForKey:@"regionalNumberOfDaysBeforeTileRedownload"];
            [v145 floatValue];
            v223 |= 0x2000u;
            int v222 = v146;
          }
          id v147 = [v170 path];
          v148 = (const char *)[v147 UTF8String];
          size_t v149 = strlen(v148);
          if (v149 >= 0x7FFFFFFFFFFFFFF8) {
            sub_1000A6968();
          }
          size_t v150 = v149;
          if (v149 >= 0x17)
          {
            uint64_t v157 = (v149 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v149 | 7) != 0x17) {
              uint64_t v157 = v149 | 7;
            }
            uint64_t v158 = v157 + 1;
            p_dst = (long long *)operator new(v157 + 1);
            *((void *)&__dst + 1) = v150;
            int64_t v184 = v158 | 0x8000000000000000;
            *(void *)&long long __dst = p_dst;
          }
          else
          {
            HIBYTE(v184) = v149;
            p_dst = &__dst;
            if (!v149) {
              goto LABEL_159;
            }
          }
          memmove(p_dst, v148, v150);
LABEL_159:
          *((unsigned char *)p_dst + v150) = 0;

          if (SHIBYTE(v184) < 0)
          {
            sub_1000559FC(__p, (void *)__dst, *((unint64_t *)&__dst + 1));
          }
          else
          {
            *(_OWORD *)__p = __dst;
            int64_t v182 = v184;
          }
          HIBYTE(v202[2]) = 16;
          strcpy((char *)v202, ".protoToFile-tmp");
          sub_1000535A8((uint64_t)__p, (uint64_t)v202);
          if (SHIBYTE(v202[2]) < 0) {
            operator delete(v202[0]);
          }
          sub_1001E1134((uint64_t)__p, 2, &v180);
          wireless_diagnostics::google::protobuf::io::FileOutputStream::FileOutputStream((wireless_diagnostics::google::protobuf::io::FileOutputStream *)v202, v180, -1);
          sub_1000BDB98((uint64_t)buf);
          wireless_diagnostics::google::protobuf::io::FileOutputStream::~FileOutputStream((wireless_diagnostics::google::protobuf::io::FileOutputStream *)v202);
          sub_10006D968(&v180);
          sub_100002D10((uint64_t)__p, (uint64_t)&__dst, 0);
          if (qword_10047BEE8 != -1) {
            dispatch_once(&qword_10047BEE8, &stru_100452A10);
          }
          v159 = (id)qword_10047BEF0;
          if (os_log_type_enabled(v159, OS_LOG_TYPE_DEBUG))
          {
            v160 = &__dst;
            if (v184 < 0) {
              v160 = (long long *)__dst;
            }
            LODWORD(v202[0]) = 136315138;
            *(void **)((char *)v202 + 4) = v160;
            _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_DEBUG, "@IndoorAvl, generateAvlTileFromJSON, find tile at %s", (uint8_t *)v202, 0xCu);
          }

          if (SHIBYTE(v182) < 0) {
            operator delete(__p[0]);
          }
          if (SHIBYTE(v184) < 0) {
            operator delete((void *)__dst);
          }
          sub_10006DC34(buf);
          BOOL v10 = 1;
          goto LABEL_154;
        }
        if (qword_10047BEE8 != -1) {
          dispatch_once(&qword_10047BEE8, &stru_100452A10);
        }
        v152 = v12;
        v153 = (id)qword_10047BEF0;
        if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
        {
          id v155 = [v175 UTF8String];
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v155;
          _os_log_impl((void *)&_mh_execute_header, v153, OS_LOG_TYPE_ERROR, "@IndoorAvl, generateAvlTileFromJSON, expected at least one venue, str=\n%s\n", buf, 0xCu);
        }
      }
      else
      {
        if (qword_10047BEE8 != -1) {
          dispatch_once(&qword_10047BEE8, &stru_100452A10);
        }
        v152 = 0;
        v153 = (id)qword_10047BEF0;
        if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
        {
          id v154 = [v175 UTF8String];
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v154;
          _os_log_impl((void *)&_mh_execute_header, v153, OS_LOG_TYPE_ERROR, "@IndoorAvl, generateAvlTileFromJSON, no venues given in avl tile json??, str=\n%s\n", buf, 0xCu);
        }
      }

      BOOL v10 = 0;
      log = v152;
LABEL_154:

      return v10;
    }
    v164 = sub_1000BA78C();
    if (os_log_type_enabled(v164, OS_LOG_TYPE_FAULT))
    {
      *(void *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "assert";
      *(_WORD *)v208 = 2081;
      *(void *)&v208[2] = "path != nullptr";
      _os_log_impl((void *)&_mh_execute_header, v164, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate at nil path\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v165 = sub_1000BA78C();
    if (os_signpost_enabled(v165))
    {
      *(void *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "assert";
      *(_WORD *)v208 = 2081;
      *(void *)&v208[2] = "path != nullptr";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v165, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "@IndoorAvl, generateAvlTileFromJSON, cannot generate at nil path", "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate at nil path\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v163 = sub_1000BA78C();
    if (os_log_type_enabled(v163, OS_LOG_TYPE_INFO))
    {
      *(void *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "assert";
      *(_WORD *)v208 = 2081;
      *(void *)&v208[2] = "path != nullptr";
      _os_log_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate at nil path\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
  }
  else
  {
    v161 = sub_1000BA78C();
    if (os_log_type_enabled(v161, OS_LOG_TYPE_FAULT))
    {
      *(void *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "assert";
      *(_WORD *)v208 = 2081;
      *(void *)&v208[2] = "jsonStr != nullptr";
      _os_log_impl((void *)&_mh_execute_header, v161, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate from nil string\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v162 = sub_1000BA78C();
    if (os_signpost_enabled(v162))
    {
      *(void *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "assert";
      *(_WORD *)v208 = 2081;
      *(void *)&v208[2] = "jsonStr != nullptr";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v162, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "@IndoorAvl, generateAvlTileFromJSON, cannot generate from nil string", "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate from nil string\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v163 = sub_1000BA78C();
    if (os_log_type_enabled(v163, OS_LOG_TYPE_INFO))
    {
      *(void *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "assert";
      *(_WORD *)v208 = 2081;
      *(void *)&v208[2] = "jsonStr != nullptr";
      _os_log_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"@IndoorAvl, generateAvlTileFromJSON, cannot generate from nil string\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
  }

  BOOL result = abort_report_np();
  __break(1u);
  return result;
}

- (NSURL)path
{
  return self->_path;
}

@end