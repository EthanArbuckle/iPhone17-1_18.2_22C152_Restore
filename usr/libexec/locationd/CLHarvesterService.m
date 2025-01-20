@interface CLHarvesterService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CLHarvesterService)init;
- (NSString)lastCountryCode;
- (id).cxx_construct;
- (id)jsonObject;
- (void)beginService;
- (void)constructController;
- (void)constructMonitors;
- (void)constructPolicies;
- (void)constructSubHarvesters;
- (void)endService;
- (void)fetchStateWithReply:(id)a3;
- (void)notifyPassKitPayment:(id)a3 transaction:(id)a4 info:(id)a5;
- (void)setHarvestingEnabled:(BOOL)a3;
- (void)setLastCountryCode:(id)a3;
- (void)setPrivateMode:(BOOL)a3;
- (void)shutdown;
- (void)submitSample:(id)a3;
@end

@implementation CLHarvesterService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10247ABE8 != -1) {
    dispatch_once(&qword_10247ABE8, &stru_1022B41A8);
  }
  return (id)qword_10247ABE0;
}

+ (BOOL)isSupported
{
  if (qword_10247ABF8 != -1) {
    dispatch_once(&qword_10247ABF8, &stru_1022B41C8);
  }
  return byte_10247ABF0;
}

- (CLHarvesterService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLHarvesterService;
  return [(CLHarvesterService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLHarvesterProtocol outboundProtocol:&OBJC_PROTOCOL___CLHarvesterClientProtocol];
}

- (void)constructController
{
  id v7 = [(CLHarvesterService *)self universe];
  id v5 = [(CLHarvesterService *)self universe];
  sub_100497740(&v5, &v6);
  sub_100497898((uint64_t *)&v7, &v6, &v8);
  shared_ptr<CLHarvestController> v3 = v8;
  shared_ptr<CLHarvestController> v8 = (shared_ptr<CLHarvestController>)0;
  cntrl = self->_harvestController.__cntrl_;
  self->_harvestController = v3;
  if (cntrl)
  {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
    if (v8.__cntrl_) {
      sub_1000DB0A0((std::__shared_weak_count *)v8.__cntrl_);
    }
  }
  if (*((void *)&v6 + 1)) {
    sub_1000DB0A0(*((std::__shared_weak_count **)&v6 + 1));
  }
}

- (void)constructMonitors
{
  p_harvestController = (uint64_t *)&self->_harvestController;
  if (self->_harvestController.__ptr_)
  {
    id v10 = [(CLHarvesterService *)self universe];
    id v8 = [(CLHarvesterService *)self universe];
    sub_100497A70(&v8, &v9);
    sub_100497BC8((uint64_t *)&v10, &v9, p_harvestController, p_harvestController, buf);
    shared_ptr<CLMonitorGps> v4 = *(shared_ptr<CLMonitorGps> *)buf;
    memset(buf, 0, sizeof(buf));
    cntrl = self->_monitorGps.__cntrl_;
    self->_monitorGps = v4;
    if (cntrl)
    {
      sub_1000DB0A0((std::__shared_weak_count *)cntrl);
      if (*(void *)&buf[8]) {
        sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
      }
    }
    if (*((void *)&v9 + 1)) {
      sub_1000DB0A0(*((std::__shared_weak_count **)&v9 + 1));
    }
  }
  else
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1022B4270);
    }
    long long v6 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Service attempting to construct monitors without controller", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1022B4270);
      }
      LOWORD(v9) = 0;
      id v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLHarvesterService constructMonitors]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
}

- (void)constructPolicies
{
  p_harvestController = (uint64_t *)&self->_harvestController;
  if (!self->_harvestController.__ptr_) {
    sub_101A613D0();
  }
  p_monitorGps = (uint64_t *)&self->_monitorGps;
  if (!self->_monitorGps.__ptr_) {
    sub_101A6155C();
  }
  id v11 = [(CLHarvesterService *)self universe];
  id v9 = [(CLHarvesterService *)self universe];
  sub_100497E40(&v9, &v10);
  sub_100497F98((uint64_t *)&v11, &v10, p_harvestController, p_harvestController, p_monitorGps, p_harvestController, &v12);
  shared_ptr<CLPolicyProactive> v5 = (shared_ptr<CLPolicyProactive>)v12;
  shared_ptr<CLPolicyTrip> v12 = (shared_ptr<CLPolicyTrip>)0;
  cntrl = self->_policyProactive.__cntrl_;
  self->_policyProactive = v5;
  if (cntrl)
  {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
    if (v12.__cntrl_) {
      sub_1000DB0A0((std::__shared_weak_count *)v12.__cntrl_);
    }
  }
  if (*((void *)&v10 + 1)) {
    sub_1000DB0A0(*((std::__shared_weak_count **)&v10 + 1));
  }
  id v11 = [(CLHarvesterService *)self universe];
  sub_1004982AC((uint64_t *)&v11, &v10);
  sub_100498404(&v10, p_harvestController, p_monitorGps, (uint64_t *)&self->_policyProactive, &v12);
  shared_ptr<CLPolicyTrip> v7 = v12;
  shared_ptr<CLPolicyTrip> v12 = (shared_ptr<CLPolicyTrip>)0;
  id v8 = self->_policyTrip.__cntrl_;
  self->_policyTrip = v7;
  if (v8)
  {
    sub_1000DB0A0((std::__shared_weak_count *)v8);
    if (v12.__cntrl_) {
      sub_1000DB0A0((std::__shared_weak_count *)v12.__cntrl_);
    }
  }
  if (*((void *)&v10 + 1)) {
    sub_1000DB0A0(*((std::__shared_weak_count **)&v10 + 1));
  }
}

- (void)constructSubHarvesters
{
  v204 = self;
  if (self->_harvestController.__ptr_)
  {
    if (self->_monitorGps.__ptr_)
    {
      if (self->_policyProactive.__ptr_ && self->_policyTrip.__ptr_)
      {
        *(void *)&long long v202 = [(CLHarvesterService *)self universe];
        *(void *)&long long v201 = [(CLHarvesterService *)self universe];
        sub_1004986A0(&v201, &v204, &buf);
        sub_100498804((uint64_t *)&v202, &buf, &v204->_harvestController.__ptr_, &v204->_harvestController.__ptr_, (uint64_t *)&v204->_harvestController, &v204->_networkController, &v204->_requestStore, &v203);
        if (*((void *)&buf + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&buf + 1));
        }
        sub_100C88900(v203, v204->_mescalSigner);
        p_subHarvesters = (uint64_t *)&v204->_subHarvesters;
        long long v4 = v203;
        uint64_t v5 = *((void *)&v203 + 1);
        if (*((void *)&v203 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v203 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        unint64_t v6 = p_subHarvesters[2];
        shared_ptr<CLPolicyTrip> v7 = (void *)p_subHarvesters[1];
        if ((unint64_t)v7 >= v6)
        {
          long long v176 = v4;
          uint64_t v13 = ((uint64_t)v7 - *p_subHarvesters) >> 4;
          unint64_t v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 60) {
            sub_1001D7FD4();
          }
          uint64_t v15 = v6 - *p_subHarvesters;
          if (v15 >> 3 > v14) {
            unint64_t v14 = v15 >> 3;
          }
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v16 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v16 = v14;
          }
          v208 = p_subHarvesters + 2;
          v17 = (char *)sub_1000C571C((uint64_t)(p_subHarvesters + 2), v16);
          v18 = &v17[16 * v13];
          *(void *)&long long buf = v17;
          *((void *)&buf + 1) = v18;
          v207 = &v17[16 * v19];
          *(_OWORD *)v18 = v176;
          v206 = v18 + 16;
          sub_1000C5754(p_subHarvesters, &buf);
          id v8 = (void *)p_subHarvesters[1];
          sub_1000C5898((void **)&buf);
        }
        else
        {
          *shared_ptr<CLPolicyTrip> v7 = v4;
          v7[1] = v5;
          id v8 = v7 + 2;
          p_subHarvesters[1] = (uint64_t)(v7 + 2);
        }
        p_subHarvesters[1] = (uint64_t)v8;
        if (objc_opt_class())
        {
          *(void *)&long long v201 = [(CLHarvesterService *)v204 universe];
          *(void *)&long long v200 = [(CLHarvesterService *)v204 universe];
          sub_100498B00(&v200, &buf);
          sub_100498C58((uint64_t)&v199, (uint64_t *)&v201, &buf, &v204->_harvestController.__ptr_, &v204->_harvestController.__ptr_, (uint64_t *)&v204->_harvestController, (uint64_t *)&v204->_networkController, (uint64_t *)&v204->_requestStore);
        }
        *(void *)&long long v201 = [(CLHarvesterService *)v204 universe];
        *(void *)&long long v200 = [(CLHarvesterService *)v204 universe];
        sub_100498F58((uint64_t *)&v200, &buf);
        sub_1004990B0((uint64_t *)&v201, &buf, &v204->_harvestController.__ptr_, &v204->_harvestController.__ptr_, (uint64_t *)&v204->_harvestController, (uint64_t *)&v204->_monitorGps, (uint64_t *)&v204->_networkController, &v202, (uint64_t *)&v204->_requestStore);
        if (*((void *)&buf + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&buf + 1));
        }
        v20 = (uint64_t *)&v204->_subHarvesters;
        long long v21 = v202;
        uint64_t v22 = *((void *)&v202 + 1);
        if (*((void *)&v202 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v202 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        unint64_t v23 = v20[2];
        v24 = (void *)v20[1];
        if ((unint64_t)v24 >= v23)
        {
          long long v177 = v21;
          uint64_t v26 = ((uint64_t)v24 - *v20) >> 4;
          unint64_t v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 60) {
            sub_1001D7FD4();
          }
          uint64_t v28 = v23 - *v20;
          if (v28 >> 3 > v27) {
            unint64_t v27 = v28 >> 3;
          }
          if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v29 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v29 = v27;
          }
          v208 = v20 + 2;
          v30 = (char *)sub_1000C571C((uint64_t)(v20 + 2), v29);
          v31 = &v30[16 * v26];
          *(void *)&long long buf = v30;
          *((void *)&buf + 1) = v31;
          v207 = &v30[16 * v32];
          *(_OWORD *)v31 = v177;
          v206 = v31 + 16;
          sub_1000C5754(v20, &buf);
          v25 = (void *)v20[1];
          sub_1000C5898((void **)&buf);
        }
        else
        {
          void *v24 = v21;
          v24[1] = v22;
          v25 = v24 + 2;
          v20[1] = (uint64_t)(v24 + 2);
        }
        v20[1] = (uint64_t)v25;
        *(void *)&long long v200 = [(CLHarvesterService *)v204 universe];
        *(void *)&long long v199 = [(CLHarvesterService *)v204 universe];
        sub_100498F58((uint64_t *)&v199, &buf);
        sub_100499400((uint64_t *)&v200, &buf, &v204->_harvestController.__ptr_, &v204->_harvestController.__ptr_, (uint64_t *)&v204->_harvestController, (uint64_t *)&v204->_monitorGps, (uint64_t *)&v204->_networkController, &v201, (uint64_t *)&v204->_requestStore);
        if (*((void *)&buf + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&buf + 1));
        }
        v33 = (uint64_t *)&v204->_subHarvesters;
        long long v34 = v201;
        uint64_t v35 = *((void *)&v201 + 1);
        if (*((void *)&v201 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v201 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        unint64_t v36 = v33[2];
        v37 = (void *)v33[1];
        if ((unint64_t)v37 >= v36)
        {
          long long v178 = v34;
          uint64_t v39 = ((uint64_t)v37 - *v33) >> 4;
          unint64_t v40 = v39 + 1;
          if ((unint64_t)(v39 + 1) >> 60) {
            sub_1001D7FD4();
          }
          uint64_t v41 = v36 - *v33;
          if (v41 >> 3 > v40) {
            unint64_t v40 = v41 >> 3;
          }
          if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v42 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v42 = v40;
          }
          v208 = v33 + 2;
          v43 = (char *)sub_1000C571C((uint64_t)(v33 + 2), v42);
          v44 = &v43[16 * v39];
          *(void *)&long long buf = v43;
          *((void *)&buf + 1) = v44;
          v207 = &v43[16 * v45];
          *(_OWORD *)v44 = v178;
          v206 = v44 + 16;
          sub_1000C5754(v33, &buf);
          v38 = (void *)v33[1];
          sub_1000C5898((void **)&buf);
        }
        else
        {
          void *v37 = v34;
          v37[1] = v35;
          v38 = v37 + 2;
          v33[1] = (uint64_t)(v37 + 2);
        }
        v33[1] = (uint64_t)v38;
        *(void *)&long long v199 = [(CLHarvesterService *)v204 universe];
        *(void *)&long long v198 = [(CLHarvesterService *)v204 universe];
        sub_100499750((uint64_t *)&v198, &buf);
        sub_1004998A8((uint64_t *)&v199, &buf, &v204->_harvestController.__ptr_, &v204->_harvestController.__ptr_, (uint64_t *)&v204->_harvestController, &v204->_networkController, &v204->_requestStore, &v200);
        if (*((void *)&buf + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&buf + 1));
        }
        v46 = (uint64_t *)&v204->_subHarvesters;
        long long v47 = v200;
        uint64_t v48 = *((void *)&v200 + 1);
        if (*((void *)&v200 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v200 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        unint64_t v49 = v46[2];
        v50 = (void *)v46[1];
        if ((unint64_t)v50 >= v49)
        {
          long long v179 = v47;
          uint64_t v52 = ((uint64_t)v50 - *v46) >> 4;
          unint64_t v53 = v52 + 1;
          if ((unint64_t)(v52 + 1) >> 60) {
            sub_1001D7FD4();
          }
          uint64_t v54 = v49 - *v46;
          if (v54 >> 3 > v53) {
            unint64_t v53 = v54 >> 3;
          }
          if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v55 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v55 = v53;
          }
          v208 = v46 + 2;
          v56 = (char *)sub_1000C571C((uint64_t)(v46 + 2), v55);
          v57 = &v56[16 * v52];
          *(void *)&long long buf = v56;
          *((void *)&buf + 1) = v57;
          v207 = &v56[16 * v58];
          *(_OWORD *)v57 = v179;
          v206 = v57 + 16;
          sub_1000C5754(v46, &buf);
          v51 = (void *)v46[1];
          sub_1000C5898((void **)&buf);
        }
        else
        {
          void *v50 = v47;
          v50[1] = v48;
          v51 = v50 + 2;
          v46[1] = (uint64_t)(v50 + 2);
        }
        v46[1] = (uint64_t)v51;
        *(void *)&long long v198 = [(CLHarvesterService *)v204 universe];
        *(void *)&long long v197 = [(CLHarvesterService *)v204 universe];
        sub_100499750((uint64_t *)&v197, &buf);
        sub_100499BA4((uint64_t *)&v198, &buf, &v204->_harvestController.__ptr_, &v204->_harvestController.__ptr_, (uint64_t *)&v204->_harvestController, &v204->_networkController, &v204->_requestStore, &v199);
        if (*((void *)&buf + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&buf + 1));
        }
        v59 = (uint64_t *)&v204->_subHarvesters;
        long long v60 = v199;
        uint64_t v61 = *((void *)&v199 + 1);
        if (*((void *)&v199 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v199 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        unint64_t v62 = v59[2];
        v63 = (void *)v59[1];
        if ((unint64_t)v63 >= v62)
        {
          long long v180 = v60;
          uint64_t v65 = ((uint64_t)v63 - *v59) >> 4;
          unint64_t v66 = v65 + 1;
          if ((unint64_t)(v65 + 1) >> 60) {
            sub_1001D7FD4();
          }
          uint64_t v67 = v62 - *v59;
          if (v67 >> 3 > v66) {
            unint64_t v66 = v67 >> 3;
          }
          if ((unint64_t)v67 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v68 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v68 = v66;
          }
          v208 = v59 + 2;
          v69 = (char *)sub_1000C571C((uint64_t)(v59 + 2), v68);
          v70 = &v69[16 * v65];
          *(void *)&long long buf = v69;
          *((void *)&buf + 1) = v70;
          v207 = &v69[16 * v71];
          *(_OWORD *)v70 = v180;
          v206 = v70 + 16;
          sub_1000C5754(v59, &buf);
          v64 = (void *)v59[1];
          sub_1000C5898((void **)&buf);
        }
        else
        {
          void *v63 = v60;
          v63[1] = v61;
          v64 = v63 + 2;
          v59[1] = (uint64_t)(v63 + 2);
        }
        v59[1] = (uint64_t)v64;
        *(void *)&long long v197 = [(CLHarvesterService *)v204 universe];
        *(void *)&long long v196 = [(CLHarvesterService *)v204 universe];
        sub_100499EA0((uint64_t *)&v196, &buf);
        sub_100499FF8((uint64_t *)&v197, &buf, &v204->_harvestController.__ptr_, &v204->_harvestController.__ptr_, (uint64_t *)&v204->_harvestController, (uint64_t *)&v204->_monitorGps, (uint64_t *)&v204->_policyTrip, &v198, (uint64_t *)&v204->_networkController, (uint64_t *)&v204->_requestStore);
        if (*((void *)&buf + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&buf + 1));
        }
        v72 = (uint64_t *)&v204->_subHarvesters;
        long long v73 = v198;
        uint64_t v74 = *((void *)&v198 + 1);
        if (*((void *)&v198 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v198 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        unint64_t v75 = v72[2];
        v76 = (void *)v72[1];
        if ((unint64_t)v76 >= v75)
        {
          long long v181 = v73;
          uint64_t v78 = ((uint64_t)v76 - *v72) >> 4;
          unint64_t v79 = v78 + 1;
          if ((unint64_t)(v78 + 1) >> 60) {
            sub_1001D7FD4();
          }
          uint64_t v80 = v75 - *v72;
          if (v80 >> 3 > v79) {
            unint64_t v79 = v80 >> 3;
          }
          if ((unint64_t)v80 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v81 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v81 = v79;
          }
          v208 = v72 + 2;
          v82 = (char *)sub_1000C571C((uint64_t)(v72 + 2), v81);
          v83 = &v82[16 * v78];
          *(void *)&long long buf = v82;
          *((void *)&buf + 1) = v83;
          v207 = &v82[16 * v84];
          *(_OWORD *)v83 = v181;
          v206 = v83 + 16;
          sub_1000C5754(v72, &buf);
          v77 = (void *)v72[1];
          sub_1000C5898((void **)&buf);
        }
        else
        {
          void *v76 = v73;
          v76[1] = v74;
          v77 = v76 + 2;
          v72[1] = (uint64_t)(v76 + 2);
        }
        v72[1] = (uint64_t)v77;
        *(void *)&long long v196 = [(CLHarvesterService *)v204 universe];
        *(void *)&long long v195 = [(CLHarvesterService *)v204 universe];
        sub_10049A370((uint64_t *)&v195, &buf);
        sub_10049A4C8((uint64_t *)&v196, &buf, &v204->_harvestController.__ptr_, &v204->_harvestController.__ptr_, (uint64_t *)&v204->_harvestController, &v204->_networkController, &v204->_requestStore, &v197);
        if (*((void *)&buf + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&buf + 1));
        }
        sub_100C88900(v197, v204->_mescalSigner);
        v85 = (uint64_t *)&v204->_subHarvesters;
        long long v86 = v197;
        uint64_t v87 = *((void *)&v197 + 1);
        if (*((void *)&v197 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v197 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        unint64_t v88 = v85[2];
        v89 = (void *)v85[1];
        if ((unint64_t)v89 >= v88)
        {
          long long v182 = v86;
          uint64_t v91 = ((uint64_t)v89 - *v85) >> 4;
          unint64_t v92 = v91 + 1;
          if ((unint64_t)(v91 + 1) >> 60) {
            sub_1001D7FD4();
          }
          uint64_t v93 = v88 - *v85;
          if (v93 >> 3 > v92) {
            unint64_t v92 = v93 >> 3;
          }
          if ((unint64_t)v93 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v94 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v94 = v92;
          }
          v208 = v85 + 2;
          v95 = (char *)sub_1000C571C((uint64_t)(v85 + 2), v94);
          v96 = &v95[16 * v91];
          *(void *)&long long buf = v95;
          *((void *)&buf + 1) = v96;
          v207 = &v95[16 * v97];
          *(_OWORD *)v96 = v182;
          v206 = v96 + 16;
          sub_1000C5754(v85, &buf);
          v90 = (void *)v85[1];
          sub_1000C5898((void **)&buf);
        }
        else
        {
          void *v89 = v86;
          v89[1] = v87;
          v90 = v89 + 2;
          v85[1] = (uint64_t)(v89 + 2);
        }
        v85[1] = (uint64_t)v90;
        *(void *)&long long v195 = [(CLHarvesterService *)v204 universe];
        *(void *)&long long v194 = [(CLHarvesterService *)v204 universe];
        sub_10049A7C4((uint64_t *)&v194, &buf);
        sub_10049A91C((uint64_t *)&v195, &buf, &v204->_harvestController.__ptr_, &v204->_harvestController.__ptr_, (uint64_t *)&v204->_harvestController, (uint64_t *)&v204->_networkController, (uint64_t *)&v204->_requestStore, &v196);
        if (*((void *)&buf + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&buf + 1));
        }
        v98 = (uint64_t *)&v204->_subHarvesters;
        long long v99 = v196;
        uint64_t v100 = *((void *)&v196 + 1);
        if (*((void *)&v196 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v196 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        unint64_t v101 = v98[2];
        v102 = (void *)v98[1];
        if ((unint64_t)v102 >= v101)
        {
          long long v183 = v99;
          uint64_t v104 = ((uint64_t)v102 - *v98) >> 4;
          unint64_t v105 = v104 + 1;
          if ((unint64_t)(v104 + 1) >> 60) {
            sub_1001D7FD4();
          }
          uint64_t v106 = v101 - *v98;
          if (v106 >> 3 > v105) {
            unint64_t v105 = v106 >> 3;
          }
          if ((unint64_t)v106 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v107 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v107 = v105;
          }
          v208 = v98 + 2;
          v108 = (char *)sub_1000C571C((uint64_t)(v98 + 2), v107);
          v109 = &v108[16 * v104];
          *(void *)&long long buf = v108;
          *((void *)&buf + 1) = v109;
          v207 = &v108[16 * v110];
          *(_OWORD *)v109 = v183;
          v206 = v109 + 16;
          sub_1000C5754(v98, &buf);
          v103 = (void *)v98[1];
          sub_1000C5898((void **)&buf);
        }
        else
        {
          void *v102 = v99;
          v102[1] = v100;
          v103 = v102 + 2;
          v98[1] = (uint64_t)(v102 + 2);
        }
        v98[1] = (uint64_t)v103;
        *(void *)&long long v194 = [(CLHarvesterService *)v204 universe];
        *(void *)&long long v193 = [(CLHarvesterService *)v204 universe];
        sub_10049AC18((uint64_t *)&v193, &buf);
        sub_10049AD70((uint64_t *)&v194, &buf, &v204->_harvestController.__ptr_, &v204->_harvestController.__ptr_, (uint64_t *)&v204->_harvestController, &v204->_networkController, &v204->_requestStore, &v195);
        if (*((void *)&buf + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&buf + 1));
        }
        v111 = (uint64_t *)&v204->_subHarvesters;
        long long v112 = v195;
        uint64_t v113 = *((void *)&v195 + 1);
        if (*((void *)&v195 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v195 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        unint64_t v114 = v111[2];
        v115 = (void *)v111[1];
        if ((unint64_t)v115 >= v114)
        {
          long long v184 = v112;
          uint64_t v117 = ((uint64_t)v115 - *v111) >> 4;
          unint64_t v118 = v117 + 1;
          if ((unint64_t)(v117 + 1) >> 60) {
            sub_1001D7FD4();
          }
          uint64_t v119 = v114 - *v111;
          if (v119 >> 3 > v118) {
            unint64_t v118 = v119 >> 3;
          }
          if ((unint64_t)v119 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v120 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v120 = v118;
          }
          v208 = v111 + 2;
          v121 = (char *)sub_1000C571C((uint64_t)(v111 + 2), v120);
          v122 = &v121[16 * v117];
          *(void *)&long long buf = v121;
          *((void *)&buf + 1) = v122;
          v207 = &v121[16 * v123];
          *(_OWORD *)v122 = v184;
          v206 = v122 + 16;
          sub_1000C5754(v111, &buf);
          v116 = (void *)v111[1];
          sub_1000C5898((void **)&buf);
        }
        else
        {
          void *v115 = v112;
          v115[1] = v113;
          v116 = v115 + 2;
          v111[1] = (uint64_t)(v115 + 2);
        }
        v111[1] = (uint64_t)v116;
        *(void *)&long long v193 = [(CLHarvesterService *)v204 universe];
        *(void *)&long long v192 = [(CLHarvesterService *)v204 universe];
        sub_10049B06C((uint64_t *)&v192, &buf);
        sub_10049B1C4((uint64_t *)&v193, &buf, &v204->_harvestController.__ptr_, &v204->_harvestController.__ptr_, (uint64_t *)&v204->_harvestController, (uint64_t *)&v204->_monitorGps, (uint64_t *)&v204->_policyProactive, &v194, (uint64_t *)&v204->_policyTrip, (uint64_t *)&v204->_networkController, (uint64_t *)&v204->_requestStore);
        if (*((void *)&buf + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&buf + 1));
        }
        v124 = (uint64_t *)&v204->_subHarvesters;
        long long v125 = v194;
        uint64_t v126 = *((void *)&v194 + 1);
        if (*((void *)&v194 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v194 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        unint64_t v127 = v124[2];
        v128 = (void *)v124[1];
        if ((unint64_t)v128 >= v127)
        {
          long long v185 = v125;
          uint64_t v130 = ((uint64_t)v128 - *v124) >> 4;
          unint64_t v131 = v130 + 1;
          if ((unint64_t)(v130 + 1) >> 60) {
            sub_1001D7FD4();
          }
          uint64_t v132 = v127 - *v124;
          if (v132 >> 3 > v131) {
            unint64_t v131 = v132 >> 3;
          }
          if ((unint64_t)v132 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v133 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v133 = v131;
          }
          v208 = v124 + 2;
          v134 = (char *)sub_1000C571C((uint64_t)(v124 + 2), v133);
          v135 = &v134[16 * v130];
          *(void *)&long long buf = v134;
          *((void *)&buf + 1) = v135;
          v207 = &v134[16 * v136];
          *(_OWORD *)v135 = v185;
          v206 = v135 + 16;
          sub_1000C5754(v124, &buf);
          v129 = (void *)v124[1];
          sub_1000C5898((void **)&buf);
        }
        else
        {
          void *v128 = v125;
          v128[1] = v126;
          v129 = v128 + 2;
          v124[1] = (uint64_t)(v128 + 2);
        }
        v124[1] = (uint64_t)v129;
        *(void *)&long long v192 = [(CLHarvesterService *)v204 universe];
        *(void *)&long long v190 = [(CLHarvesterService *)v204 universe];
        sub_10049B590((uint64_t *)&v190, &buf);
        sub_10049B6E8((uint64_t *)&v192, &buf, &v204->_harvestController.__ptr_, &v204->_harvestController.__ptr_, (uint64_t *)&v204->_harvestController, (uint64_t *)&v204->_monitorGps, (uint64_t *)&v204->_networkController, &v193, (uint64_t *)&v204->_requestStore);
        if (*((void *)&buf + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&buf + 1));
        }
        v137 = (uint64_t *)&v204->_subHarvesters;
        long long v138 = v193;
        uint64_t v139 = *((void *)&v193 + 1);
        if (*((void *)&v193 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v193 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        unint64_t v140 = v137[2];
        v141 = (void *)v137[1];
        if ((unint64_t)v141 >= v140)
        {
          long long v186 = v138;
          uint64_t v143 = ((uint64_t)v141 - *v137) >> 4;
          unint64_t v144 = v143 + 1;
          if ((unint64_t)(v143 + 1) >> 60) {
            sub_1001D7FD4();
          }
          uint64_t v145 = v140 - *v137;
          if (v145 >> 3 > v144) {
            unint64_t v144 = v145 >> 3;
          }
          if ((unint64_t)v145 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v146 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v146 = v144;
          }
          v208 = v137 + 2;
          v147 = (char *)sub_1000C571C((uint64_t)(v137 + 2), v146);
          v148 = &v147[16 * v143];
          *(void *)&long long buf = v147;
          *((void *)&buf + 1) = v148;
          v207 = &v147[16 * v149];
          *(_OWORD *)v148 = v186;
          v206 = v148 + 16;
          sub_1000C5754(v137, &buf);
          v142 = (void *)v137[1];
          sub_1000C5898((void **)&buf);
        }
        else
        {
          void *v141 = v138;
          v141[1] = v139;
          v142 = v141 + 2;
          v137[1] = (uint64_t)(v141 + 2);
        }
        v137[1] = (uint64_t)v142;
        *(void *)&long long v190 = [(CLHarvesterService *)v204 universe];
        id v191 = [(CLHarvesterService *)v204 universe];
        sub_10049BA38(&v191, &buf);
        sub_10049BB90((uint64_t *)&v190, &buf, &v204->_harvestController.__ptr_, &v204->_harvestController.__ptr_, (uint64_t *)&v204->_harvestController, &v204->_networkController, &v204->_requestStore, &v192);
        if (*((void *)&buf + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&buf + 1));
        }
        v150 = (uint64_t *)&v204->_subHarvesters;
        long long v151 = v192;
        uint64_t v152 = *((void *)&v192 + 1);
        if (*((void *)&v192 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v192 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        unint64_t v153 = v150[2];
        v154 = (void *)v150[1];
        if ((unint64_t)v154 >= v153)
        {
          long long v187 = v151;
          uint64_t v156 = ((uint64_t)v154 - *v150) >> 4;
          unint64_t v157 = v156 + 1;
          if ((unint64_t)(v156 + 1) >> 60) {
            sub_1001D7FD4();
          }
          uint64_t v158 = v153 - *v150;
          if (v158 >> 3 > v157) {
            unint64_t v157 = v158 >> 3;
          }
          if ((unint64_t)v158 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v159 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v159 = v157;
          }
          v208 = v150 + 2;
          v160 = (char *)sub_1000C571C((uint64_t)(v150 + 2), v159);
          v161 = &v160[16 * v156];
          *(void *)&long long buf = v160;
          *((void *)&buf + 1) = v161;
          v207 = &v160[16 * v162];
          *(_OWORD *)v161 = v187;
          v206 = v161 + 16;
          sub_1000C5754(v150, &buf);
          v155 = (void *)v150[1];
          sub_1000C5898((void **)&buf);
        }
        else
        {
          void *v154 = v151;
          v154[1] = v152;
          v155 = v154 + 2;
          v150[1] = (uint64_t)(v154 + 2);
        }
        v150[1] = (uint64_t)v155;
        id v191 = [(CLHarvesterService *)v204 universe];
        id v189 = [(CLHarvesterService *)v204 universe];
        sub_10049BE8C((uint64_t *)&v189, &buf);
        sub_10049BFE4((uint64_t *)&v191, &buf, &v204->_harvestController.__ptr_, &v204->_harvestController.__ptr_, (uint64_t *)&v204->_harvestController, &v204->_networkController, &v204->_requestStore, &v190);
        if (*((void *)&buf + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&buf + 1));
        }
        v163 = (uint64_t *)&v204->_subHarvesters;
        long long v164 = v190;
        uint64_t v165 = *((void *)&v190 + 1);
        if (*((void *)&v190 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v190 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        unint64_t v166 = v163[2];
        v167 = (void *)v163[1];
        if ((unint64_t)v167 >= v166)
        {
          long long v188 = v164;
          uint64_t v169 = ((uint64_t)v167 - *v163) >> 4;
          unint64_t v170 = v169 + 1;
          if ((unint64_t)(v169 + 1) >> 60) {
            sub_1001D7FD4();
          }
          uint64_t v171 = v166 - *v163;
          if (v171 >> 3 > v170) {
            unint64_t v170 = v171 >> 3;
          }
          if ((unint64_t)v171 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v172 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v172 = v170;
          }
          v208 = v163 + 2;
          v173 = (char *)sub_1000C571C((uint64_t)(v163 + 2), v172);
          v174 = &v173[16 * v169];
          *(void *)&long long buf = v173;
          *((void *)&buf + 1) = v174;
          v207 = &v173[16 * v175];
          *(_OWORD *)v174 = v188;
          v206 = v174 + 16;
          sub_1000C5754(v163, &buf);
          v168 = (void *)v163[1];
          sub_1000C5898((void **)&buf);
        }
        else
        {
          void *v167 = v164;
          v167[1] = v165;
          v168 = v167 + 2;
          v163[1] = (uint64_t)(v167 + 2);
        }
        v163[1] = (uint64_t)v168;
        if (*((void *)&v190 + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&v190 + 1));
        }
        if (*((void *)&v192 + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&v192 + 1));
        }
        if (*((void *)&v193 + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&v193 + 1));
        }
        if (*((void *)&v194 + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&v194 + 1));
        }
        if (*((void *)&v195 + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&v195 + 1));
        }
        if (*((void *)&v196 + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&v196 + 1));
        }
        if (*((void *)&v197 + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&v197 + 1));
        }
        if (*((void *)&v198 + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&v198 + 1));
        }
        if (*((void *)&v199 + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&v199 + 1));
        }
        if (*((void *)&v200 + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&v200 + 1));
        }
        if (*((void *)&v201 + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&v201 + 1));
        }
        if (*((void *)&v202 + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&v202 + 1));
        }
        if (*((void *)&v203 + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&v203 + 1));
        }
        return;
      }
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1022B4270);
      }
      long long v10 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Service attempting to construct subharvesters without policies", (uint8_t *)&buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_102419560 == -1)
        {
LABEL_31:
          LOWORD(v203) = 0;
          shared_ptr<CLPolicyTrip> v12 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLHarvesterService constructSubHarvesters]", "%s\n", v12);
          if (v12 != (char *)&buf) {
            free(v12);
          }
          return;
        }
LABEL_239:
        dispatch_once(&qword_102419560, &stru_1022B4270);
        goto LABEL_31;
      }
    }
    else
    {
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1022B4270);
      }
      id v11 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Service attempting to construct subharvesters without gps monitor", (uint8_t *)&buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_102419560 == -1) {
          goto LABEL_31;
        }
        goto LABEL_239;
      }
    }
  }
  else
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1022B4270);
    }
    id v9 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Service attempting to construct subharvesters without controller", (uint8_t *)&buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_102419560 == -1) {
        goto LABEL_31;
      }
      goto LABEL_239;
    }
  }
}

- (void)beginService
{
  shared_ptr<CLHarvestController> v3 = [objc_msgSend(-[CLHarvesterService universe](self, "universe") silo) queue];
  [(CLHarvesterService *)self constructController];
  [(CLHarvesterService *)self constructMonitors];
  self->_endpointSelector = objc_alloc_init(CLHEndpointSelector);
  long long v4 = [[CLHNetworkController alloc] initWithQueue:v3];
  self->_networkController = v4;
  [(CLHNetworkController *)v4 setEndpointSelector:self->_endpointSelector];
  uint64_t v5 = [[CLHLocationClassifier alloc] initInUniverse:[(CLHarvesterService *)self universe]];
  self->_classifier = v5;
  [(CLHLocationClassifier *)v5 fetchLocationsOfInterestIfPossibleWithCompletionHandler:&stru_1022B41E8];
  id v6 = [objc_alloc((Class)NSURL) initFileURLWithPath:@"/var/root/Library/Caches/locationd/harvest/" isDirectory:1];
  self->_requestStore = [[CLHRequestStore alloc] initWithRootDirectory:v6 classifier:self->_classifier];

  self->_mescalSigner = (CLMescalSigner *)[[CLMescalSigner alloc] initInSilo:[CLHarvesterService universe](self, "universe") silo];
  [(CLHarvesterService *)self constructPolicies];
  [(CLHarvesterService *)self constructSubHarvesters];
  sub_100103240();
  if (sub_10073E30C())
  {
    out_token[0] = 0;
    notify_register_dispatch("persistHarvestData", out_token, v3, &stru_1022B4228);
  }
  +[CLPMeta updateRegulatoryDomainEstimates];
  ptr = self->_harvestController.__ptr_;
  cntrl = self->_monitorGps.__cntrl_;
  unint64_t v16 = self->_monitorGps.__ptr_;
  v17 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  id v9 = self->_policyProactive.__cntrl_;
  unint64_t v14 = self->_policyProactive.__ptr_;
  uint64_t v15 = v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v9 + 1, 1uLL, memory_order_relaxed);
  }
  long long v10 = self->_policyTrip.__cntrl_;
  shared_ptr<CLPolicyTrip> v12 = self->_policyTrip.__ptr_;
  uint64_t v13 = v10;
  if (v10) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v10 + 1, 1uLL, memory_order_relaxed);
  }
  memset(v11, 0, sizeof(v11));
  sub_10049C2E0(v11, (void *)self->_subHarvesters.__begin_, (void *)self->_subHarvesters.__end_, ((char *)self->_subHarvesters.__end_ - (char *)self->_subHarvesters.__begin_) >> 4);
  sub_100547710(ptr, (uint64_t *)&v16, (uint64_t *)&v14, (uint64_t *)&v12, v11);
  *(void *)out_token = v11;
  sub_1000C5954((void ***)out_token);
  if (v13) {
    sub_1000DB0A0((std::__shared_weak_count *)v13);
  }
  if (v15) {
    sub_1000DB0A0((std::__shared_weak_count *)v15);
  }
  if (v17) {
    sub_1000DB0A0((std::__shared_weak_count *)v17);
  }
  [self.universe silo];
  [(CLHarvesterService *)self universe];
  operator new();
}

- (void)endService
{
  value = self->fHarvestSettings.__ptr_.__value_;
  if (value) {
    sub_10106AFD4(value);
  }

  notify_cancel(self->_countryCodeNotificationToken);
  dispatch_queue_set_specific((dispatch_queue_t)[objc_msgSend(-[CLHarvesterService universe](self, "universe"), "silo") queue], &unk_10247AC00, &unk_10247AC00, 0);
  if (dispatch_get_specific(&unk_10247AC00) == &unk_10247AC00)
  {
    cntrl = self->_harvestController.__cntrl_;
    self->_harvestController.__ptr_ = 0;
    self->_harvestController.__cntrl_ = 0;
    if (cntrl) {
      sub_1000DB0A0((std::__shared_weak_count *)cntrl);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100496B6C;
    v8[3] = &unk_10229FED8;
    v8[4] = self;
    [objc_msgSend(-[CLHarvesterService universe](self, "universe"), "silo") sync:v8];
  }
  uint64_t v5 = self->_monitorGps.__cntrl_;
  self->_monitorGps.__ptr_ = 0;
  self->_monitorGps.__cntrl_ = 0;
  if (v5) {
    sub_1000DB0A0((std::__shared_weak_count *)v5);
  }
  id v6 = self->_policyTrip.__cntrl_;
  self->_policyTrip.__ptr_ = 0;
  self->_policyTrip.__cntrl_ = 0;
  if (v6) {
    sub_1000DB0A0((std::__shared_weak_count *)v6);
  }
  shared_ptr<CLPolicyTrip> v7 = self->_policyProactive.__cntrl_;
  self->_policyProactive.__ptr_ = 0;
  self->_policyProactive.__cntrl_ = 0;
  if (v7) {
    sub_1000DB0A0((std::__shared_weak_count *)v7);
  }
  sub_1000C59A8((uint64_t *)&self->_subHarvesters);
}

- (void)setPrivateMode:(BOOL)a3
{
}

- (void)setHarvestingEnabled:(BOOL)a3
{
}

- (void)shutdown
{
}

- (id)jsonObject
{
  v5[0] = @"endpointSelector";
  id v3 = [(CLHEndpointSelector *)self->_endpointSelector jsonObject];
  v5[1] = @"locationClassifier";
  v6[0] = v3;
  v6[1] = [(CLHLocationClassifier *)self->_classifier jsonObject];
  return +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
}

- (void)submitSample:(id)a3
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1022B4270);
  }
  uint64_t v5 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 68289026;
    int v18 = 0;
    __int16 v19 = 2082;
    v20 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"-submitSample: called\"}", (uint8_t *)&v17, 0x12u);
  }
  if (sub_100496F78(+[NSXPCConnection currentConnection], @"com.apple.locationd.harvest.contribute"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      begin = (uint64_t *)self->_subHarvesters.__begin_;
      end = (uint64_t *)self->_subHarvesters.__end_;
      if (begin != end)
      {
        while (1)
        {
          uint64_t v8 = *begin;
          id v9 = (std::__shared_weak_count *)begin[1];
          if (v9) {
            atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          int v10 = sub_10012FD50(v8);
          if (v9) {
            sub_1000DB0A0(v9);
          }
          if (v10 == 9) {
            break;
          }
          begin += 2;
          if (begin == end)
          {
            begin = end;
            break;
          }
        }
      }
      uint64_t v11 = *begin;
      shared_ptr<CLPolicyTrip> v12 = (std::__shared_weak_count *)begin[1];
      if (v12) {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      sub_1003C10AC(v11, a3);
      if (v12) {
        sub_1000DB0A0(v12);
      }
    }
    else
    {
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1022B4270);
      }
      uint64_t v13 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_FAULT))
      {
        uint64_t v14 = objc_opt_class();
        int v17 = 68289282;
        int v18 = 0;
        __int16 v19 = 2082;
        v20 = "";
        __int16 v21 = 2114;
        uint64_t v22 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"received sample of unrecognized type\", \"class\":%{public, location:escape_only}@}", (uint8_t *)&v17, 0x1Cu);
        if (qword_102419560 != -1) {
          dispatch_once(&qword_102419560, &stru_1022B4270);
        }
      }
      uint64_t v15 = qword_102419568;
      if (os_signpost_enabled((os_log_t)qword_102419568))
      {
        uint64_t v16 = objc_opt_class();
        int v17 = 68289282;
        int v18 = 0;
        __int16 v19 = 2082;
        v20 = "";
        __int16 v21 = 2114;
        uint64_t v22 = v16;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "received sample of unrecognized type", "{\"msg%{public}.0s\":\"received sample of unrecognized type\", \"class\":%{public, location:escape_only}@}", (uint8_t *)&v17, 0x1Cu);
      }
    }
  }
}

- (void)fetchStateWithReply:(id)a3
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1022B4270);
  }
  uint64_t v5 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 68289026;
    int v9 = 0;
    __int16 v10 = 2082;
    uint64_t v11 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"-fetchStateWithReply: called\"}", buf, 0x12u);
  }
  if (sub_100496F78(+[NSXPCConnection currentConnection], @"com.apple.locationd.harvest.introspection"))
  {
    v7[0] = [(CLHEndpointSelector *)self->_endpointSelector jsonObject];
    v6[1] = @"classifier";
    v7[1] = [(CLHLocationClassifier *)self->_classifier jsonObject];
    void v6[2] = @"requestStore";
    v7[2] = [(CLHRequestStore *)self->_requestStore jsonObject];
    (*((void (**)(id, NSDictionary *))a3 + 2))(a3, +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3]);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1022B4270);
  }
  id v6 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "received connection request", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1022B4270);
    }
    uint64_t v14 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHarvesterService listener:shouldAcceptNewConnection:]", "%s\n", v14);
    if (v14 != (char *)buf) {
      free(v14);
    }
  }
  BOOL v7 = sub_100496F78(a4, @"com.apple.locationd.harvest.introspection");
  int v8 = v7 | sub_100496F78(a4, @"com.apple.locationd.harvest.contribute");
  if (v8 == 1)
  {
    int v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CLHarvesterServerInterface];
    [(NSXPCInterface *)v9 setClass:objc_opt_class() forSelector:"submitSample:" argumentIndex:0 ofReply:0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    [(NSXPCInterface *)v9 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0) forSelector:"fetchStateWithReply:" argumentIndex:0 ofReply:1];
    [a4 setExportedInterface:v9];
    [a4 setExportedObject:self];
    [a4 _setQueue:[objc_msgSend(-[CLHarvesterService universe](self, "universe"), "silo") queue]];
    [a4 resume];
  }
  return v8;
}

- (void)notifyPassKitPayment:(id)a3 transaction:(id)a4 info:(id)a5
{
}

- (NSString)lastCountryCode
{
  return self->_lastCountryCode;
}

- (void)setLastCountryCode:(id)a3
{
}

- (void).cxx_destruct
{
  sub_10049C430((uint64_t *)&self->fHarvestSettings, 0);
  p_subHarvesters = &self->_subHarvesters;
  sub_1000C5954((void ***)&p_subHarvesters);
  cntrl = self->_policyProactive.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  long long v4 = self->_policyTrip.__cntrl_;
  if (v4) {
    sub_1000DB0A0((std::__shared_weak_count *)v4);
  }
  uint64_t v5 = self->_monitorGps.__cntrl_;
  if (v5) {
    sub_1000DB0A0((std::__shared_weak_count *)v5);
  }
  id v6 = self->_harvestController.__cntrl_;
  if (v6) {
    sub_1000DB0A0((std::__shared_weak_count *)v6);
  }
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 19) = 0;
  return self;
}

@end