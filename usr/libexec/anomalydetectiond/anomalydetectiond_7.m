uint64_t CLKappaEstimatesAlgCrash::reset(CLKappaEstimatesAlgCrash *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 4) + 24))();
}

uint64_t CLKappaEstimatesAlgCrash::lowSensitivityDetector(CLKappaEstimatesAlgCrash *this, int a2)
{
  v2 = (float *)*((void *)this + 4);
  v3 = v2 + 34;
  v4 = v2 + 35;
  v5 = v2 + 36;
  v6 = v2 + 37;
  v7 = v2 + 38;
  v8 = v2 + 39;
  v9 = v2 + 28;
  v10 = v2 + 29;
  v11 = v2 + 30;
  v12 = v2 + 31;
  v13 = v2 + 32;
  v14 = v2 + 33;
  if (a2) {
    v7 = v13;
  }
  else {
    v14 = v8;
  }
  if (a2)
  {
    v6 = v12;
    v5 = v11;
    v4 = v10;
    v3 = v9;
  }
  float v15 = *((float *)this + 16);
  if (v15 >= *v3)
  {
    float v17 = *v4;
    if (v15 >= *v5) {
      int v18 = 3;
    }
    else {
      int v18 = -1;
    }
    if (v15 >= *v5) {
      int v19 = v18;
    }
    else {
      int v19 = 2;
    }
    if (v15 >= v17) {
      int v16 = v19;
    }
    else {
      int v16 = 1;
    }
  }
  else
  {
    int v16 = 0;
  }
  if (*((unsigned char *)this + 48)) {
    BOOL v20 = *((float *)this + 21) >= *v7;
  }
  else {
    BOOL v20 = 0;
  }
  float v21 = *v6;
  int v22 = *((unsigned __int8 *)this + 50);
  if (*((unsigned char *)this + 50)) {
    int v22 = *((float *)this + 22) >= *v14;
  }
  if (*((unsigned char *)this + 49)) {
    LODWORD(v23) = 1;
  }
  else {
    LODWORD(v23) = v20;
  }
  if (*((float *)this + 14) >= v21) {
    uint64_t v23 = v23;
  }
  else {
    uint64_t v23 = 0;
  }
  if (v16 != 3)
  {
    if (v16 == 2)
    {
      if (v23) {
        return (*((unsigned __int8 *)this + 53) | v22) != 0;
      }
    }
    else
    {
      LODWORD(v23) = v23 & v22;
      if (v16 == 1) {
        return v23;
      }
      else {
        return 0;
      }
    }
  }
  return v23;
}

void CLKappaEstimatesAlgCrash::epochFinalize(CLKappaEstimatesAlgCrash *this, uint64_t a2)
{
  if (*((unsigned char *)this + 80))
  {
    if (qword_1003DB6A0 != -1) {
      dispatch_once(&qword_1003DB6A0, &stru_1003B7600);
    }
    v4 = qword_1003DB6A8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v43) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[C] using audio thresholds", (uint8_t *)&v43, 2u);
    }
    v5 = (float *)*((void *)this + 4);
    v6 = v5 + 4;
    v7 = v5 + 5;
    v8 = v5 + 6;
    v9 = v5 + 7;
  }
  else
  {
    if (qword_1003DB6A0 != -1) {
      dispatch_once(&qword_1003DB6A0, &stru_1003B7600);
    }
    v10 = qword_1003DB6A8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v43) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[C] without audio thresholds", (uint8_t *)&v43, 2u);
    }
    v5 = (float *)*((void *)this + 4);
    v6 = v5 + 8;
    v7 = v5 + 9;
    v8 = v5 + 10;
    v9 = v5 + 11;
  }
  float v11 = *v6;
  float v12 = *v7;
  float v13 = *v8;
  float v14 = *v9;
  float v15 = CLSafetyAlgorithmsMath::computeSigmoidalThreshold(v5 + 16, *((float *)this + 16));
  float v16 = CLSafetyAlgorithmsMath::computeSigmoidalThreshold((float *)(*((void *)this + 4) + 80), *((float *)this + 16));
  float v17 = CLSafetyAlgorithmsMath::computeSigmoidalThreshold((float *)(*((void *)this + 4) + 96), *((float *)this + 16));
  BOOL v18 = *((float *)this + 17) >= v15 && *((float *)this + 18) >= v16 && *((float *)this + 19) >= v17;
  *((unsigned char *)this + 52) = v18;
  if (!*((unsigned char *)this + 51)) {
    BOOL v18 = 0;
  }
  int v19 = *((_DWORD *)this + 23);
  BOOL v21 = 0;
  if (v19 != -1)
  {
    BOOL v20 = (float *)*((void *)this + 4);
    if (v20[40] > (float)v19 && *((float *)this + 22) < v20[41] && *((float *)this + 21) < v20[42]) {
      BOOL v21 = 1;
    }
  }
  *((unsigned char *)this + 53) = v18 && !v21;
  float v22 = *((float *)this + 16);
  if (v22 >= v11)
  {
    if (v22 >= v12)
    {
      if (v22 >= v13) {
        int v23 = 3;
      }
      else {
        int v23 = 2;
      }
    }
    else
    {
      int v23 = 1;
    }
  }
  else
  {
    int v23 = 0;
  }
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B7600);
  }
  v24 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    int v25 = *((unsigned __int8 *)this + 100);
    int v26 = *((unsigned __int8 *)this + 96);
    int v27 = *((unsigned __int8 *)this + 97);
    int v28 = *((unsigned __int8 *)this + 98);
    int v29 = *((unsigned __int8 *)this + 99);
    int v30 = *((unsigned __int8 *)this + 48);
    int v31 = *((unsigned __int8 *)this + 49);
    int v32 = *((unsigned __int8 *)this + 50);
    int v33 = *((unsigned __int8 *)this + 51);
    int v34 = *((_DWORD *)this + 26);
    int v43 = 67111424;
    BOOL v44 = v25;
    __int16 v45 = 1024;
    int v46 = v26;
    __int16 v47 = 1024;
    int v48 = v27;
    __int16 v49 = 1024;
    int v50 = v28;
    __int16 v51 = 1024;
    int v52 = v29;
    __int16 v53 = 1024;
    int v54 = v30;
    __int16 v55 = 1024;
    int v56 = v31;
    __int16 v57 = 1024;
    int v58 = v32;
    __int16 v59 = 1024;
    int v60 = v33;
    __int16 v61 = 1024;
    int v62 = v34;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[C] force %d %d %d %d %d is %d %d %d %d regime %d", (uint8_t *)&v43, 0x3Eu);
  }
  if (*((_DWORD *)this + 26) != -1)
  {
    if (qword_1003DB6A0 != -1) {
      dispatch_once(&qword_1003DB6A0, &stru_1003B7600);
    }
    v35 = qword_1003DB6A8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
    {
      int v36 = *((_DWORD *)this + 26);
      int v43 = 67109120;
      BOOL v44 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "[C] forcing re to %d", (uint8_t *)&v43, 8u);
    }
    int v23 = *((_DWORD *)this + 26);
    *((_DWORD *)this + 26) = -1;
  }
  BOOL v38 = *((float *)this + 14) >= v14 && (*((unsigned __int8 *)this + 49) | *((unsigned __int8 *)this + 48)) != 0;
  if (v23 != 3)
  {
    if (v23 == 2)
    {
      if (!v38) {
        goto LABEL_56;
      }
      int v39 = *((unsigned __int8 *)this + 50) | *((unsigned __int8 *)this + 53);
      goto LABEL_54;
    }
    if (v23 == 1)
    {
      if (!v38) {
        goto LABEL_56;
      }
      int v39 = *((unsigned __int8 *)this + 50);
LABEL_54:
      BOOL v38 = v39 != 0;
      goto LABEL_56;
    }
    BOOL v38 = 0;
  }
LABEL_56:
  int v40 = CLKappaEstimatesAlgCrash::lowSensitivityDetector(this, *((unsigned __int8 *)this + 80));
  if (*((unsigned char *)this + 100))
  {
    *((unsigned char *)this + 100) = 0;
    BOOL v38 = 1;
  }
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B7600);
  }
  v41 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEFAULT))
  {
    int v43 = 67240704;
    BOOL v44 = v38;
    __int16 v45 = 1026;
    int v46 = v23;
    __int16 v47 = 1026;
    int v48 = v40;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "[C] de %{public}d re %{public}d low %{public}d", (uint8_t *)&v43, 0x14u);
  }
  uint64_t v42 = *((void *)this + 4);
  *(unsigned char *)(v42 + 176) = v38;
  *(void *)(v42 + 184) = a2;
  *(unsigned char *)(v42 + 177) = v40;
  *(unsigned char *)(v42 + 192) = *((unsigned char *)this + 80);
  *(void *)(v42 + 200) = *((void *)this + 7);
  *(_DWORD *)(v42 + 208) = *((_DWORD *)this + 16);
  *(_DWORD *)(v42 + 196) = v23;
  *(_DWORD *)(v42 + 212) = *((_DWORD *)this + 12);
  *(void *)(v42 + 216) = *(void *)((char *)this + 68);
  *(_DWORD *)(v42 + 224) = *((_DWORD *)this + 19);
  *(float *)(v42 + 228) = v15;
  *(float *)(v42 + 232) = v16;
  *(float *)(v42 + 236) = v17;
  *(_WORD *)(v42 + 240) = *((_WORD *)this + 26);
  *(unsigned char *)(v42 + 242) = *((unsigned char *)this + 82);
  *(_DWORD *)(v42 + 244) = *((_DWORD *)this + 23);
  *(unsigned char *)(v42 + 248) = v21;
  *(int32x2_t *)(v42 + 252) = vrev64_s32(*(int32x2_t *)((char *)this + 84));
}

void virtual thunk to'CLKappaEstimatesAlgCrash::epochFinalize(CLKappaEstimatesAlgCrash *this, uint64_t a2)
{
}

float CLKappaEstimatesAlgCrash::feedFeatures(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 96))
  {
    if (qword_1003DB6A0 != -1) {
      dispatch_once(&qword_1003DB6A0, &stru_1003B7600);
    }
    v4 = qword_1003DB6A8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[C] forcing pu", v7, 2u);
    }
    *(unsigned char *)(a1 + 48) = 1;
    *(unsigned char *)(a1 + 96) = 0;
  }
  else
  {
    *(unsigned char *)(a1 + 48) = *(unsigned char *)a2;
  }
  int v5 = *(_DWORD *)(a2 + 96);
  *(_DWORD *)(a1 + 60) = *(_DWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 64) = v5;
  float result = *(float *)(a2 + 16);
  *(float *)(a1 + 84) = result;
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 64);
  return result;
}

{
  NSObject *v4;
  float result;
  uint8_t v6[16];

  if (*(unsigned char *)(a1 + 98))
  {
    if (qword_1003DB6A0 != -1) {
      dispatch_once(&qword_1003DB6A0, &stru_1003B7600);
    }
    v4 = qword_1003DB6A8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[C] forcing ba", v6, 2u);
    }
    *(unsigned char *)(a1 + 50) = 1;
    *(unsigned char *)(a1 + 98) = 0;
  }
  else
  {
    *(unsigned char *)(a1 + 50) = *(unsigned char *)(a2 + 52) != 0;
  }
  float result = *(float *)(a2 + 32);
  *(float *)(a1 + 88) = result;
  return result;
}

{
  NSObject *v3;
  float result;
  uint8_t v5[16];

  if (*(unsigned char *)(a1 + 97))
  {
    if (qword_1003DB6A0 != -1) {
      dispatch_once(&qword_1003DB6A0, &stru_1003B7600);
    }
    v3 = qword_1003DB6A8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[C] forcing ff", v5, 2u);
    }
    *(unsigned char *)(a1 + 49) = 1;
    *(unsigned char *)(a1 + 97) = 0;
  }
  else
  {
    float result = *(float *)(a2 + 20);
    *(float *)(a1 + 56) = result;
    *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 44);
  }
  return result;
}

float virtual thunk to'CLKappaEstimatesAlgCrash::feedFeatures(void *a1, uint64_t a2)
{
  return CLKappaEstimatesAlgCrash::feedFeatures((uint64_t)a1 + *(void *)(*a1 - 32), a2);
}

{
  return CLKappaEstimatesAlgCrash::feedFeatures((uint64_t)a1 + *(void *)(*a1 - 56), a2);
}

{
  return CLKappaEstimatesAlgCrash::feedFeatures((uint64_t)a1 + *(void *)(*a1 - 112), a2);
}

void CLKappaEstimatesAlgCrash::feedFeatures(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 99))
  {
    if (qword_1003DB6A0 != -1) {
      dispatch_once(&qword_1003DB6A0, &stru_1003B7600);
    }
    v3 = qword_1003DB6A8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[C] forcing au", v5, 2u);
    }
    *(_WORD *)(a1 + 51) = 257;
    *(int32x2_t *)(a1 + 68) = vdup_n_s32(0x7F7FFFFFu);
    *(_DWORD *)(a1 + 76) = 2139095039;
    *(unsigned char *)(a1 + 53) = 1;
    *(unsigned char *)(a1 + 99) = 0;
  }
  else
  {
    *(unsigned char *)(a1 + 51) = *(unsigned char *)(a2 + 29);
    float v4 = *(float *)(a2 + 8);
    *(unsigned char *)(a1 + 80) = v4 > 0.0;
    *(void *)(a1 + 68) = *(void *)(a2 + 12);
    *(float *)(a1 + 76) = v4;
  }
}

void virtual thunk to'CLKappaEstimatesAlgCrash::feedFeatures(void *a1, uint64_t a2)
{
}

uint64_t CLKappaEstimatesAlgCrash::feedFeatures(uint64_t result, _DWORD *a2)
{
  *(_DWORD *)(result + 92) = *a2;
  return result;
}

void *virtual thunk to'CLKappaEstimatesAlgCrash::feedFeatures(void *result, _DWORD *a2)
{
  *(_DWORD *)((char *)result + *(void *)(*result - 144) + 92) = *a2;
  return result;
}

double CLKappaEstimatesAlgCrash::epochReset(CLKappaEstimatesAlgCrash *this)
{
  if (!*((unsigned char *)this + 96)) {
    *((unsigned char *)this + 48) = 0;
  }
  if (!*((unsigned char *)this + 97)) {
    *((unsigned char *)this + 49) = 0;
  }
  if (!*((unsigned char *)this + 98)) {
    *((unsigned char *)this + 50) = 0;
  }
  if (!*((unsigned char *)this + 99))
  {
    *(_WORD *)((char *)this + 51) = 0;
    *((unsigned char *)this + 53) = 0;
  }
  *((_DWORD *)this + 14) = 0x800000;
  *((unsigned char *)this + 80) = 0;
  uint64_t v1 = *((void *)this + 4);
  *(_WORD *)(v1 + 176) = 0;
  *(void *)(v1 + 184) = 0;
  *(_OWORD *)(v1 + 192) = 0u;
  *(_OWORD *)(v1 + 208) = 0u;
  *(_OWORD *)(v1 + 224) = 0u;
  *(_OWORD *)(v1 + 240) = 0u;
  *(_DWORD *)(v1 + 256) = 0;
  double result = 2.84809454e-306;
  *(void *)((char *)this + 68) = 0x80000000800000;
  *((_DWORD *)this + 19) = 0x800000;
  *((_DWORD *)this + 23) = -1;
  return result;
}

double virtual thunk to'CLKappaEstimatesAlgCrash::epochReset(CLKappaEstimatesAlgCrash *this)
{
  return CLKappaEstimatesAlgCrash::epochReset((CLKappaEstimatesAlgCrash *)((char *)this
                                                                         + *(void *)(*(void *)this - 56)));
}

void sub_1002BB0B0(CLKappaAlgBlock *this)
{
  *(void *)this = off_1003B6AB8;
  *((void *)this + 14) = off_1003B6D68;
  *((void *)this + 15) = off_1003B6EA8;
  *(void *)((char *)this + *(void *)(*(void *)this - 176)) = off_1003B6F88;
  v2 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v2) {
    sub_10000BB9C(v2);
  }

  CLKappaAlgBlock::~CLKappaAlgBlock(this, (uint64_t *)off_1003B6FD8);
}

void sub_1002BB1A0(CLKappaAlgBlock *this)
{
  *(void *)this = off_1003B6AB8;
  *((void *)this + 14) = off_1003B6D68;
  *((void *)this + 15) = off_1003B6EA8;
  *((void *)this + 16) = off_1003B6F88;
  v2 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v2) {
    sub_10000BB9C(v2);
  }
  CLKappaAlgBlock::~CLKappaAlgBlock(this, (uint64_t *)off_1003B6FD8);

  operator delete();
}

void sub_1002BB2A0(void *a1)
{
  uint64_t v1 = (CLKappaAlgBlock *)((char *)a1 + *(void *)(*a1 - 24));
  *(void *)uint64_t v1 = off_1003B6AB8;
  *((void *)v1 + 14) = off_1003B6D68;
  *((void *)v1 + 15) = off_1003B6EA8;
  *((void *)v1 + 16) = off_1003B6F88;
  v2 = (std::__shared_weak_count *)*((void *)v1 + 5);
  if (v2) {
    sub_10000BB9C(v2);
  }

  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B6FD8);
}

void sub_1002BB378(void *a1)
{
  uint64_t v1 = (CLKappaAlgBlock *)((char *)a1 + *(void *)(*a1 - 24));
  *(void *)uint64_t v1 = off_1003B6AB8;
  *((void *)v1 + 14) = off_1003B6D68;
  *((void *)v1 + 15) = off_1003B6EA8;
  *((void *)v1 + 16) = off_1003B6F88;
  v2 = (std::__shared_weak_count *)*((void *)v1 + 5);
  if (v2) {
    sub_10000BB9C(v2);
  }
  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B6FD8);

  operator delete();
}

void sub_1002BB464(void *a1)
{
  uint64_t v1 = (CLKappaAlgBlock *)((char *)a1 + *(void *)(*a1 - 24));
  *(void *)uint64_t v1 = off_1003B6AB8;
  *((void *)v1 + 14) = off_1003B6D68;
  *((void *)v1 + 15) = off_1003B6EA8;
  *((void *)v1 + 16) = off_1003B6F88;
  v2 = (std::__shared_weak_count *)*((void *)v1 + 5);
  if (v2) {
    sub_10000BB9C(v2);
  }

  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B6FD8);
}

void sub_1002BB53C(void *a1)
{
  uint64_t v1 = (CLKappaAlgBlock *)((char *)a1 + *(void *)(*a1 - 24));
  *(void *)uint64_t v1 = off_1003B6AB8;
  *((void *)v1 + 14) = off_1003B6D68;
  *((void *)v1 + 15) = off_1003B6EA8;
  *((void *)v1 + 16) = off_1003B6F88;
  v2 = (std::__shared_weak_count *)*((void *)v1 + 5);
  if (v2) {
    sub_10000BB9C(v2);
  }
  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B6FD8);

  operator delete();
}

void sub_1002BB64C(void *a1)
{
  uint64_t v1 = (CLKappaAlgBlock *)((char *)a1 + *(void *)(*a1 - 24));
  *(void *)uint64_t v1 = off_1003B6AB8;
  *((void *)v1 + 14) = off_1003B6D68;
  *((void *)v1 + 15) = off_1003B6EA8;
  *((void *)v1 + 16) = off_1003B6F88;
  v2 = (std::__shared_weak_count *)*((void *)v1 + 5);
  if (v2) {
    sub_10000BB9C(v2);
  }

  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B6FD8);
}

void sub_1002BB724(void *a1)
{
  uint64_t v1 = (CLKappaAlgBlock *)((char *)a1 + *(void *)(*a1 - 24));
  *(void *)uint64_t v1 = off_1003B6AB8;
  *((void *)v1 + 14) = off_1003B6D68;
  *((void *)v1 + 15) = off_1003B6EA8;
  *((void *)v1 + 16) = off_1003B6F88;
  v2 = (std::__shared_weak_count *)*((void *)v1 + 5);
  if (v2) {
    sub_10000BB9C(v2);
  }
  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B6FD8);

  operator delete();
}

void sub_1002BB810(id a1)
{
  qword_1003DB6A8 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "Alg");

  _objc_release_x1();
}

void sub_1002BB854(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_1003B7630;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1002BB874(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_1003B7630;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_1002BB8C8(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

double sub_1002BB8F0(uint64_t a1)
{
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(void *)a1 = &off_1003A1C08;
  *(_OWORD *)(a1 + 16) = xmmword_10033F040;
  *(_OWORD *)(a1 + 32) = xmmword_10033F050;
  *(_OWORD *)(a1 + 48) = xmmword_10033F050;
  *(_OWORD *)(a1 + 64) = xmmword_10033F060;
  *(_OWORD *)(a1 + 80) = xmmword_10033F070;
  *(_OWORD *)(a1 + 96) = xmmword_10033F080;
  *(_OWORD *)(a1 + 112) = xmmword_10033F090;
  *(_OWORD *)(a1 + 128) = xmmword_10033F0A0;
  *(_OWORD *)(a1 + 144) = xmmword_10033F0B0;
  double result = 9.79983509e18;
  *(void *)(a1 + 160) = 0x43E1000042F00000;
  *(_DWORD *)(a1 + 168) = 1088421888;
  return result;
}

void sub_1002BC2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40)
{
  objc_destroyWeak((id *)(v45 - 184));
  _Unwind_Resume(a1);
}

id sub_1002BC464()
{
  if (qword_1003DB7E0 != -1) {
    dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
  }
  v0 = (void *)qword_1003DB7E8;

  return v0;
}

id sub_1002BC4B8(uint64_t a1)
{
  if (qword_1003DB7E0 != -1) {
    dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
  }
  v2 = qword_1003DB7E8;
  if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)float v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "DetectionSM timeout", v4, 2u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 16) signal:9 data:0];
}

__CFString *sub_1002BC55C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  switch(a2)
  {
    case 4:
      [*(id *)(a1 + 32) clearAll];
      goto LABEL_7;
    case 3:
      switch(a3)
      {
        case 10:
          goto LABEL_11;
        case 4:
          float v4 = *(void **)(*(void *)(a1 + 32) + 56);
          goto LABEL_13;
        case 1:
LABEL_11:
          float v4 = *(void **)(*(void *)(a1 + 32) + 32);
LABEL_13:
          v3 = objc_retainBlock(v4);
          goto LABEL_14;
      }
LABEL_7:
      v3 = 0;
      break;
    case 1:
      v3 = @"idle";
      break;
    default:
      v3 = 0;
      break;
  }
LABEL_14:

  return v3;
}

__CFString *sub_1002BC5E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 3)
  {
    v3 = 0;
    switch(a3)
    {
      case 2:
      case 10:
        [*(id *)(*(void *)(a1 + 32) + 128) setBool:1 forKey:@"ActiveKappaDecision"];
        int v5 = *(void **)(*(void *)(a1 + 32) + 40);
        goto LABEL_9;
      case 3:
        int v5 = *(void **)(*(void *)(a1 + 32) + 24);
        goto LABEL_9;
      case 4:
        int v5 = *(void **)(*(void *)(a1 + 32) + 56);
LABEL_9:
        v3 = objc_retainBlock(v5);
        break;
      default:
        break;
    }
  }
  else if (a2 == 1)
  {
    v3 = @"potentialCrash";
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

__CFString *sub_1002BC6C0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *src)
{
  int v5 = 0;
  switch(a2)
  {
    case 1:
      int v5 = @"crashStaging";
      break;
    case 3:
      if ((unint64_t)(a3 - 9) >= 2)
      {
        if (a3 != 4) {
          goto LABEL_14;
        }
        [*(id *)(*(void *)(a1 + 32) + 128) setBool:0 forKey:@"ActiveKappaDecision"];
        float v15 = *(void **)(*(void *)(a1 + 32) + 56);
      }
      else
      {
        *(unsigned char *)(*(void *)(a1 + 32) + 112) = 1;
        float v15 = *(void **)(*(void *)(a1 + 32) + 48);
      }
      int v5 = objc_retainBlock(v15);
      break;
    case 4:
      memset(dst, 0, sizeof(dst));
      uuid_copy(dst, src);
      v6 = *(void **)(a1 + 32);
      id v7 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:dst];
      [v6 updateLocalUUID:v7];

      if (!*(void *)(*(void *)(a1 + 32) + 80))
      {
        if (qword_1003DB7E0 != -1) {
          dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
        }
        v8 = qword_1003DB7E8;
        if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)float v17 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Local trigger UUID is nil in crashStagingState", v17, 2u);
        }
      }
      v9 = +[CSPersistentConfiguration sharedConfiguration];
      v10 = [v9 objectForKey:@"KappaCompanionWaitDuration"];

      float v11 = +[CSPersistentConfiguration sharedConfiguration];
      [v11 floatForKey:@"KappaCompanionWaitDuration"];
      float v13 = v12;

      double v14 = v13;
      if (v10 == 0 || v13 < 0.0) {
        double v14 = 1.0;
      }
      [*(id *)(a1 + 32) startTimer:v14];
      goto LABEL_14;
    case 6:
      [*(id *)(*(void *)(a1 + 32) + 128) removeObjectForKey:@"KappaCompanionWaitDuration"];
      [*(id *)(a1 + 32) stopTimer];
LABEL_14:
      int v5 = 0;
      break;
    default:
      break;
  }

  return v5;
}

void sub_1002BC914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_1002BC94C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float v4 = 0;
  switch(a2)
  {
    case 1:
      float v4 = @"notifyingCompanionState";
      break;
    case 3:
      if (a3 != 9) {
        goto LABEL_7;
      }
      float v4 = (__CFString *)objc_retainBlock(*(id *)(*(void *)(a1 + 32) + 56));
      break;
    case 4:
      [*(id *)(*(void *)(a1 + 32) + 72) notifyCompanionOfLocalCrash:*(void *)(*(void *)(a1 + 32) + 80) forMode:*(unsigned __int8 *)(*(void *)(a1 + 32) + 64) martyIsBicycle:*(unsigned __int8 *)(*(void *)(a1 + 32) + 65)];
      [*(id *)(a1 + 32) startTimer:0.5];
      goto LABEL_7;
    case 6:
      [*(id *)(a1 + 32) stopTimer];
LABEL_7:
      float v4 = 0;
      break;
    default:
      break;
  }

  return v4;
}

__CFString *sub_1002BCA18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float v4 = 0;
  switch(a2)
  {
    case 1:
      float v4 = @"crashProcessing";
      break;
    case 3:
      switch(a3)
      {
        case 6:
        case 9:
        case 10:
          goto LABEL_12;
        case 7:
          [*(id *)(*(void *)(a1 + 32) + 120) didReceiveSOSStatusUpdate:*(void *)(*(void *)(a1 + 32) + 144) forMode:*(unsigned __int8 *)(*(void *)(a1 + 32) + 64)];
          int v5 = *(void **)(*(void *)(a1 + 32) + 56);
          goto LABEL_13;
        case 8:
          [*(id *)(*(void *)(a1 + 32) + 120) didReceiveSOSStatusUpdate:*(void *)(*(void *)(a1 + 32) + 144) forMode:*(unsigned __int8 *)(*(void *)(a1 + 32) + 64)];
LABEL_12:
          int v5 = *(void **)(*(void *)(a1 + 32) + 24);
LABEL_13:
          float v4 = objc_retainBlock(v5);
          break;
        default:
          goto LABEL_10;
      }
      break;
    case 4:
      v6 = *(unsigned char **)(a1 + 32);
      if (!v6[112]) {
        goto LABEL_9;
      }
      [v6 notifySOSDaemon];
      goto LABEL_8;
    case 6:
      [*(id *)(a1 + 32) stopTimer];
LABEL_8:
      v6 = *(unsigned char **)(a1 + 32);
LABEL_9:
      [v6 startTimer:60.0];
LABEL_10:
      float v4 = 0;
      break;
    default:
      break;
  }

  return v4;
}

void sub_1002BCBB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  v10 = v9;

  a9.super_class = (Class)CSSafetySOSStateMachine;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1002BD080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002BD36C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002BD4F4(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v3 = a2;
  unint64_t v12 = a2;
  id v5 = a3;
  if (qword_1003DB7E0 != -1) {
    dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
  }
  v6 = qword_1003DB7E8;
  if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v14 = v3;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SOS ACK block response:%ld, SOS UUID: %@", buf, 0x16u);
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[16] setBool:0 forKey:@"ActiveKappaDecision"];
  [WeakRetained[16] setBool:0 forKey:@"WaitingForSOSAck"];
  id v8 = WeakRetained[16];
  v9 = +[SOSKappaManager currentSOSStatus];
  v10 = [v9 uuid];
  float v11 = [v10 UUIDString];
  [v8 setObject:v11 forKey:@"KappaSOSUUID"];

  if (v3 <= 5)
  {
    if (((1 << v3) & 0x1A) != 0)
    {
      [WeakRetained[2] signal:6 data:&v12];
      unint64_t v3 = v12;
    }
    else if (((1 << v3) & 0x21) != 0)
    {
      [WeakRetained[16] setInteger:*((unsigned __int8 *)WeakRetained + 64) forKey:kSOSEventKey];
      [WeakRetained notifyCompanionOfSafetyEventType:*((unsigned __int8 *)WeakRetained + 64)];
    }
  }
  [WeakRetained[15] didReceiveSOSAck:v3 forMode:*(unsigned __int8 *)(*(void *)(a1 + 32) + 64)];
}

void sub_1002BD6F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002BD83C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002BDB3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002BDEC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1002BE150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002BE264(id a1)
{
  qword_1003DB7E8 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "SOSStateMachine");

  _objc_release_x1();
}

void sub_1002BE2A8(id a1)
{
  qword_1003DB718 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "Companion");

  _objc_release_x1();
}

uint64_t sub_1002BE2EC(id *a1)
{
  [*a1 removeObjectForKey:@"SimulateCrashProbability"];
  uint64_t v1 = sub_1002BC464();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
  {
    sub_10000BDD8();
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Simulating crash\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  v2 = sub_1002BC464();
  if (os_signpost_enabled(v2))
  {
    sub_10000BDD8();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Simulating crash", "{\"msg%{public}.0s\":\"Simulating crash\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  unint64_t v3 = sub_1002BC464();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    sub_10000BDD8();
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Simulating crash\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  uint64_t result = abort_report_np();
  __break(1u);
  return result;
}

void CLKappaDeescalatorTriggerClusters::CLKappaDeescalatorTriggerClusters(CLKappaDeescalatorTriggerClusters *this)
{
  *(void *)this = off_10039C308;
  *((unsigned char *)this + 8) = 0;
  *((unsigned char *)this + 16) = 0;
  *((void *)this + 3) = 0;
  *((unsigned char *)this + 32) = 1;
  *((_DWORD *)this + 9) = 0;
  *((unsigned char *)this + 40) = 0;
  v2 = (char *)sub_100007BC0((void *)this + 6, "none");
  *(void *)this = &off_1003B76E8;
  *((unsigned char *)this + 72) = 0;
  *((unsigned char *)this + 80) = 0;
  *((unsigned char *)this + 88) = 0;
  if (*((char *)this + 71) < 0)
  {
    *((void *)this + 7) = 5;
    v2 = (char *)*((void *)this + 6);
  }
  else
  {
    *((unsigned char *)this + 71) = 5;
  }
  strcpy(v2, "de-TC");
}

unint64_t CLKappaDeescalatorTriggerClusters::resetConfiguration(CLKappaDeescalatorTriggerClusters *this)
{
  *((unsigned char *)this + 40) = CLKappaDeescalator::shouldForceNoop(this, "ForceTriggerCluster");
  unint64_t result = CLKappaDeescalator::shouldForceDeescalate(this, "ForceTriggerCluster");
  *((_DWORD *)this + 9) = result;
  return result;
}

void CLKappaDeescalatorTriggerClusters::log(CLKappaDeescalatorTriggerClusters *this, uint64_t a2)
{
  if (*((unsigned char *)this + 88)) {
    uint64_t v4 = *((void *)this + 10);
  }
  else {
    uint64_t v4 = 0;
  }
  int v5 = *((unsigned __int8 *)this + 72);
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B7768);
  }
  v6 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *((_DWORD *)this + 6);
    int v8 = *((unsigned __int8 *)this + 32);
    int v9 = 134350080;
    uint64_t v10 = a2;
    __int16 v11 = 1026;
    int v12 = v7;
    __int16 v13 = 1026;
    int v14 = v8;
    __int16 v15 = 1026;
    int v16 = v5;
    __int16 v17 = 2050;
    uint64_t v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[de-TC] summary,A,%{public}llu,B,%{public}u,mode,%{public}u,debug-1a,%{public}u,debug-1b,%{public}llu", (uint8_t *)&v9, 0x28u);
  }
}

uint64_t CLKappaDeescalatorTriggerClusters::assertReady(CLKappaDeescalatorTriggerClusters *this, uint64_t a2, const char *a3)
{
  uint64_t result = CLKappaDeescalator::assertCrashTimestamp(this, a2, a3);
  if (*((unsigned char *)this + 72))
  {
    uint64_t v6 = *((unsigned __int8 *)this + 88);
    return CLKappaDeescalator::raiseUnless(v6, (BOOL)"[de-TC] condition met but missing window boundary", v5);
  }
  return result;
}

float CLKappaDeescalatorTriggerClusters::updateWithTriggerClustersFeatures(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 72) && *(unsigned char *)(a2 + 8) && *(unsigned char *)(a2 + 9) && !*(unsigned char *)(a2 + 10))
  {
    *(unsigned char *)(a1 + 72) = 1;
    *(void *)(a1 + 80) = *(void *)(a2 + 16);
    *(unsigned char *)(a1 + 88) = 1;
    if (qword_1003DB6A0 != -1) {
      dispatch_once(&qword_1003DB6A0, &stru_1003B7768);
    }
    unint64_t v3 = qword_1003DB6A8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
    {
      int v5 = *(unsigned __int8 *)(a2 + 8);
      int v6 = *(unsigned __int8 *)(a2 + 9);
      int v7 = *(unsigned __int8 *)(a2 + 10);
      uint64_t v8 = *(void *)(a2 + 16);
      v9[0] = 67109888;
      v9[1] = v5;
      __int16 v10 = 1024;
      int v11 = v6;
      __int16 v12 = 1024;
      int v13 = v7;
      __int16 v14 = 2048;
      uint64_t v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[de-TC] condition met - isTriggerCluster:%d, isClusterInBeginningOfDrive:%d, isBTHintDetected:%d, rightBoundaryTs:%llu", (uint8_t *)v9, 0x1Eu);
    }
  }
  return result;
}

uint64_t CLKappaDeescalatorTriggerClusters::deescalationCondition(uint64_t this, unint64_t a2, unint64_t a3)
{
  if (a2 <= a3) {
    return this;
  }
  else {
    return 0;
  }
}

uint64_t CLKappaDeescalatorTriggerClusters::onEvaluateBetweenMinAndMaxHoldDuration(CLKappaDeescalatorTriggerClusters *this)
{
  if (*((unsigned char *)this + 88)) {
    unint64_t v1 = *((void *)this + 10);
  }
  else {
    unint64_t v1 = 0;
  }
  v2 = (unint64_t *)((char *)this + 8);
  if (!*((unsigned char *)this + 16)) {
    v2 = (unint64_t *)&unk_10033F190;
  }
  if (*v2 > v1 || *((unsigned char *)this + 72) == 0) {
    return 0;
  }
  else {
    return 4;
  }
}

uint64_t CLKappaDeescalatorTriggerClusters::onEvaluateAtBoundary(CLKappaDeescalatorTriggerClusters *this)
{
  if (*((unsigned char *)this + 88)) {
    unint64_t v2 = *((void *)this + 10);
  }
  else {
    unint64_t v2 = 0;
  }
  if (*((unsigned char *)this + 16)) {
    unint64_t v3 = (unint64_t *)((char *)this + 8);
  }
  else {
    unint64_t v3 = (unint64_t *)&unk_10033F190;
  }
  unint64_t v4 = *v3;
  if (*((unsigned char *)this + 72)) {
    BOOL v5 = v4 > v2;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return 0;
  }
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B7768);
  }
  int v7 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
  {
    if (*((unsigned char *)this + 16)) {
      uint64_t v8 = (uint64_t *)((char *)this + 8);
    }
    else {
      uint64_t v8 = (uint64_t *)&unk_10033F190;
    }
    uint64_t v9 = *v8;
    int v10 = 134218240;
    uint64_t v11 = v9;
    __int16 v12 = 2048;
    unint64_t v13 = v2;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[de-TC] deescalated at boundary, crashTimestamp:%llu, deescalationBoundary:%llu", (uint8_t *)&v10, 0x16u);
  }
  return 4;
}

void sub_1002BE9C0(void **a1)
{
  CLKappaDeescalator::~CLKappaDeescalator(a1);

  operator delete();
}

void sub_1002BE9F8(id a1)
{
  qword_1003DB6A8 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "Alg");

  _objc_release_x1();
}

void KappaTriggerSample::KappaTriggerSample(KappaTriggerSample *this)
{
  *(void *)this = off_1003B7798;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((_DWORD *)this + 30) = 0;
}

{
  *(void *)this = off_1003B7798;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((_DWORD *)this + 30) = 0;
}

void KappaTriggerSample::~KappaTriggerSample(KappaTriggerSample *this)
{
  *(void *)this = off_1003B7798;
  unint64_t v2 = (void *)*((void *)this + 1);
  if (v2)
  {
    *((void *)this + 2) = v2;
    operator delete(v2);
  }

  PB::Base::~Base(this);
}

{
  uint64_t vars8;

  KappaTriggerSample::~KappaTriggerSample(this);

  operator delete();
}

void KappaTriggerSample::KappaTriggerSample(KappaTriggerSample *this, const KappaTriggerSample *a2)
{
  *(void *)this = off_1003B7798;
  *((void *)this + 1) = 0;
  unint64_t v4 = (char *)this + 8;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((_DWORD *)this + 30) = 0;
  int v5 = *((_DWORD *)a2 + 30);
  if ((v5 & 4) != 0)
  {
    uint64_t v7 = *((void *)a2 + 6);
    int v6 = 4;
    *((_DWORD *)this + 30) = 4;
    *((void *)this + 6) = v7;
    int v5 = *((_DWORD *)a2 + 30);
    if ((v5 & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int v6 = 0;
  if ((v5 & 0x2000) != 0)
  {
LABEL_5:
    int v8 = *((_DWORD *)a2 + 25);
    v6 |= 0x2000u;
    *((_DWORD *)this + 30) = v6;
    *((_DWORD *)this + 25) = v8;
    int v5 = *((_DWORD *)a2 + 30);
  }
LABEL_6:
  if ((v5 & 0x8000) != 0)
  {
    int v12 = *((_DWORD *)a2 + 27);
    v6 |= 0x8000u;
    *((_DWORD *)this + 30) = v6;
    *((_DWORD *)this + 27) = v12;
    int v5 = *((_DWORD *)a2 + 30);
    if ((v5 & 0x400) == 0)
    {
LABEL_8:
      if ((v5 & 0x10000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_29;
    }
  }
  else if ((v5 & 0x400) == 0)
  {
    goto LABEL_8;
  }
  int v13 = *((_DWORD *)a2 + 22);
  v6 |= 0x400u;
  *((_DWORD *)this + 30) = v6;
  *((_DWORD *)this + 22) = v13;
  int v5 = *((_DWORD *)a2 + 30);
  if ((v5 & 0x10000) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  int v14 = *((_DWORD *)a2 + 28);
  v6 |= 0x10000u;
  *((_DWORD *)this + 30) = v6;
  *((_DWORD *)this + 28) = v14;
  int v5 = *((_DWORD *)a2 + 30);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v15 = *((void *)a2 + 7);
  v6 |= 8u;
  *((_DWORD *)this + 30) = v6;
  *((void *)this + 7) = v15;
  int v5 = *((_DWORD *)a2 + 30);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  int v16 = *((_DWORD *)a2 + 18);
  v6 |= 0x40u;
  *((_DWORD *)this + 30) = v6;
  *((_DWORD *)this + 18) = v16;
  int v5 = *((_DWORD *)a2 + 30);
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  int v17 = *((_DWORD *)a2 + 21);
  v6 |= 0x200u;
  *((_DWORD *)this + 30) = v6;
  *((_DWORD *)this + 21) = v17;
  int v5 = *((_DWORD *)a2 + 30);
  if ((v5 & 0x4000) == 0)
  {
LABEL_13:
    if ((v5 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  int v18 = *((_DWORD *)a2 + 26);
  v6 |= 0x4000u;
  *((_DWORD *)this + 30) = v6;
  *((_DWORD *)this + 26) = v18;
  int v5 = *((_DWORD *)a2 + 30);
  if ((v5 & 0x100) == 0)
  {
LABEL_14:
    if ((v5 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  int v19 = *((_DWORD *)a2 + 20);
  v6 |= 0x100u;
  *((_DWORD *)this + 30) = v6;
  *((_DWORD *)this + 20) = v19;
  int v5 = *((_DWORD *)a2 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_15:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  int v20 = *((_DWORD *)a2 + 16);
  v6 |= 0x10u;
  *((_DWORD *)this + 30) = v6;
  *((_DWORD *)this + 16) = v20;
  int v5 = *((_DWORD *)a2 + 30);
  if ((v5 & 0x20000) == 0)
  {
LABEL_16:
    if ((v5 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  v6 |= 0x20000u;
  *((_DWORD *)this + 29) = *((_DWORD *)a2 + 29);
  *((_DWORD *)this + 30) = v6;
  int v5 = *((_DWORD *)a2 + 30);
  if ((v5 & 0x20) == 0)
  {
LABEL_17:
    if ((v5 & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_37:
  int v21 = *((_DWORD *)a2 + 17);
  v6 |= 0x20u;
  *((_DWORD *)this + 30) = v6;
  *((_DWORD *)this + 17) = v21;
  if ((*((_DWORD *)a2 + 30) & 2) != 0)
  {
LABEL_18:
    uint64_t v9 = *((void *)a2 + 5);
    *((_DWORD *)this + 30) = v6 | 2;
    *((void *)this + 5) = v9;
  }
LABEL_19:
  if (this != a2) {
    sub_100024308(v4, *((char **)a2 + 1), *((void *)a2 + 2), (uint64_t)(*((void *)a2 + 2) - *((void *)a2 + 1)) >> 2);
  }
  int v10 = *((_DWORD *)a2 + 30);
  if ((v10 & 0x1000) != 0)
  {
    int v22 = *((_DWORD *)a2 + 24);
    *((_DWORD *)this + 30) |= 0x1000u;
    *((_DWORD *)this + 24) = v22;
    int v10 = *((_DWORD *)a2 + 30);
    if ((v10 & 0x80) == 0)
    {
LABEL_23:
      if ((v10 & 0x800) == 0) {
        goto LABEL_24;
      }
      goto LABEL_41;
    }
  }
  else if ((v10 & 0x80) == 0)
  {
    goto LABEL_23;
  }
  int v23 = *((_DWORD *)a2 + 19);
  *((_DWORD *)this + 30) |= 0x80u;
  *((_DWORD *)this + 19) = v23;
  int v10 = *((_DWORD *)a2 + 30);
  if ((v10 & 0x800) == 0)
  {
LABEL_24:
    if ((v10 & 1) == 0) {
      return;
    }
    goto LABEL_25;
  }
LABEL_41:
  int v24 = *((_DWORD *)a2 + 23);
  *((_DWORD *)this + 30) |= 0x800u;
  *((_DWORD *)this + 23) = v24;
  if ((*((_DWORD *)a2 + 30) & 1) == 0) {
    return;
  }
LABEL_25:
  uint64_t v11 = *((void *)a2 + 4);
  *((_DWORD *)this + 30) |= 1u;
  *((void *)this + 4) = v11;
}

KappaTriggerSample *KappaTriggerSample::operator=(KappaTriggerSample *a1, const KappaTriggerSample *a2)
{
  if (a1 != a2)
  {
    KappaTriggerSample::KappaTriggerSample((KappaTriggerSample *)v4, a2);
    swap(a1, (KappaTriggerSample *)v4);
    KappaTriggerSample::~KappaTriggerSample((KappaTriggerSample *)v4);
  }
  return a1;
}

double swap(KappaTriggerSample *a1, KappaTriggerSample *a2)
{
  int v2 = *((_DWORD *)a1 + 30);
  *((_DWORD *)a1 + 30) = *((_DWORD *)a2 + 30);
  *((_DWORD *)a2 + 30) = v2;
  double result = *((double *)a1 + 6);
  *((void *)a1 + 6) = *((void *)a2 + 6);
  int v4 = *((_DWORD *)a1 + 18);
  *((_DWORD *)a1 + 18) = *((_DWORD *)a2 + 18);
  *((_DWORD *)a2 + 18) = v4;
  int v5 = *((_DWORD *)a1 + 21);
  *((_DWORD *)a1 + 21) = *((_DWORD *)a2 + 21);
  int v6 = *((_DWORD *)a1 + 25);
  *((_DWORD *)a1 + 25) = *((_DWORD *)a2 + 25);
  *((_DWORD *)a2 + 25) = v6;
  int v7 = *((_DWORD *)a1 + 27);
  *((_DWORD *)a1 + 27) = *((_DWORD *)a2 + 27);
  *((_DWORD *)a2 + 27) = v7;
  int v8 = *((_DWORD *)a1 + 22);
  *((_DWORD *)a1 + 22) = *((_DWORD *)a2 + 22);
  *((_DWORD *)a2 + 22) = v8;
  int v9 = *((_DWORD *)a1 + 28);
  *((_DWORD *)a1 + 28) = *((_DWORD *)a2 + 28);
  *((_DWORD *)a2 + 28) = v9;
  uint64_t v10 = *((void *)a1 + 7);
  *((void *)a1 + 7) = *((void *)a2 + 7);
  *((void *)a2 + 7) = v10;
  LODWORD(v10) = *((_DWORD *)a1 + 26);
  *((_DWORD *)a1 + 26) = *((_DWORD *)a2 + 26);
  *((_DWORD *)a2 + 26) = v10;
  LODWORD(v10) = *((_DWORD *)a1 + 20);
  *((_DWORD *)a1 + 20) = *((_DWORD *)a2 + 20);
  *((_DWORD *)a2 + 20) = v10;
  LODWORD(v10) = *((_DWORD *)a1 + 16);
  *((_DWORD *)a1 + 16) = *((_DWORD *)a2 + 16);
  *((_DWORD *)a2 + 16) = v10;
  LODWORD(v10) = *((_DWORD *)a1 + 29);
  *((_DWORD *)a1 + 29) = *((_DWORD *)a2 + 29);
  *((_DWORD *)a2 + 29) = v10;
  LODWORD(v10) = *((_DWORD *)a1 + 17);
  *((_DWORD *)a1 + 17) = *((_DWORD *)a2 + 17);
  *((_DWORD *)a2 + 17) = v10;
  uint64_t v11 = *((void *)a1 + 5);
  *((void *)a1 + 5) = *((void *)a2 + 5);
  *((void *)a2 + 5) = v11;
  uint64_t v12 = *((void *)a1 + 1);
  *((void *)a1 + 1) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v12;
  uint64_t v13 = *((void *)a1 + 2);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v13;
  LODWORD(v13) = *((_DWORD *)a1 + 24);
  *((_DWORD *)a1 + 24) = *((_DWORD *)a2 + 24);
  *((_DWORD *)a2 + 24) = v13;
  LODWORD(v13) = *((_DWORD *)a1 + 19);
  *((_DWORD *)a1 + 19) = *((_DWORD *)a2 + 19);
  *((_DWORD *)a2 + 19) = v13;
  LODWORD(v13) = *((_DWORD *)a1 + 23);
  *((_DWORD *)a1 + 23) = *((_DWORD *)a2 + 23);
  uint64_t v14 = *((void *)a1 + 3);
  uint64_t v15 = *((void *)a1 + 4);
  uint64_t v16 = *((void *)a2 + 4);
  *((void *)a1 + 3) = *((void *)a2 + 3);
  *((void *)a1 + 4) = v16;
  *((double *)a2 + 6) = result;
  *((_DWORD *)a2 + 21) = v5;
  *((_DWORD *)a2 + 23) = v13;
  *((void *)a2 + 3) = v14;
  *((void *)a2 + 4) = v15;
  return result;
}

uint64_t KappaTriggerSample::KappaTriggerSample(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_1003B7798;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 120) = *(_DWORD *)(a2 + 120);
  *(_DWORD *)(a2 + 120) = 0;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_DWORD *)(a1 + 100) = *(_DWORD *)(a2 + 100);
  *(_DWORD *)(a1 + 108) = *(_DWORD *)(a2 + 108);
  *(_DWORD *)(a1 + 88) = *(_DWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(_DWORD *)(a1 + 84) = *(_DWORD *)(a2 + 84);
  *(_DWORD *)(a1 + 104) = *(_DWORD *)(a2 + 104);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_DWORD *)(a1 + 116) = *(_DWORD *)(a2 + 116);
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a2 + 68);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  sub_100274A30(a1 + 8, (__n128 *)(a2 + 8));
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 92);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

KappaTriggerSample *KappaTriggerSample::operator=(KappaTriggerSample *a1, uint64_t a2)
{
  if (a1 != (KappaTriggerSample *)a2)
  {
    KappaTriggerSample::KappaTriggerSample((uint64_t)v4, a2);
    swap(a1, (KappaTriggerSample *)v4);
    KappaTriggerSample::~KappaTriggerSample((KappaTriggerSample *)v4);
  }
  return a1;
}

uint64_t KappaTriggerSample::formatText(KappaTriggerSample *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  int v5 = *((_DWORD *)this + 30);
  if ((v5 & 0x10) != 0)
  {
    PB::TextFormatter::format(a2, "basebandHint", *((_DWORD *)this + 16));
    int v5 = *((_DWORD *)this + 30);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(a2, "btHint", *((_DWORD *)this + 17));
  int v5 = *((_DWORD *)this + 30);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  PB::TextFormatter::format(a2, "companionAopTs", *((void *)this + 4));
  int v5 = *((_DWORD *)this + 30);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  PB::TextFormatter::format(a2, "decel", *((float *)this + 18));
  int v5 = *((_DWORD *)this + 30);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  PB::TextFormatter::format(a2, "enableMode", *((_DWORD *)this + 19));
  int v5 = *((_DWORD *)this + 30);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  PB::TextFormatter::format(a2, "gpsHint", *((_DWORD *)this + 20));
  int v5 = *((_DWORD *)this + 30);
  if ((v5 & 0x200) == 0)
  {
LABEL_8:
    if ((v5 & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  PB::TextFormatter::format(a2, "impact", *((float *)this + 21));
  int v5 = *((_DWORD *)this + 30);
  if ((v5 & 0x400) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  PB::TextFormatter::format(a2, "kappaArmedSeconds", *((_DWORD *)this + 22));
  int v5 = *((_DWORD *)this + 30);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  PB::TextFormatter::format(a2, "lastValidImuTimestamp", *((void *)this + 5));
  int v5 = *((_DWORD *)this + 30);
  if ((v5 & 0x800) == 0)
  {
LABEL_11:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  PB::TextFormatter::format(a2, "martyArmedSeconds", *((_DWORD *)this + 23));
  int v5 = *((_DWORD *)this + 30);
  if ((v5 & 0x1000) == 0)
  {
LABEL_12:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  PB::TextFormatter::format(a2, "martyPath", *((_DWORD *)this + 24));
  int v5 = *((_DWORD *)this + 30);
  if ((v5 & 0x2000) == 0)
  {
LABEL_13:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  PB::TextFormatter::format(a2, "meta", *((_DWORD *)this + 25));
  int v5 = *((_DWORD *)this + 30);
  if ((v5 & 0x4000) == 0)
  {
LABEL_14:
    if ((v5 & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  PB::TextFormatter::format(a2, "motionHint", *((_DWORD *)this + 26));
  int v5 = *((_DWORD *)this + 30);
  if ((v5 & 4) == 0)
  {
LABEL_15:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  PB::TextFormatter::format(a2, "now", *((double *)this + 6));
  int v5 = *((_DWORD *)this + 30);
  if ((v5 & 0x8000) == 0)
  {
LABEL_16:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  PB::TextFormatter::format(a2, "path", *((_DWORD *)this + 27));
  int v5 = *((_DWORD *)this + 30);
  if ((v5 & 0x10000) == 0)
  {
LABEL_17:
    if ((v5 & 8) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_41:
  PB::TextFormatter::format(a2, "rmsSN", *((_DWORD *)this + 28));
  if ((*((_DWORD *)this + 30) & 8) != 0) {
LABEL_18:
  }
    PB::TextFormatter::format(a2, "timestamp", *((void *)this + 7));
LABEL_19:
  int v6 = (float *)*((void *)this + 1);
  int v7 = (float *)*((void *)this + 2);
  while (v6 != v7)
  {
    float v8 = *v6++;
    PB::TextFormatter::format(a2, "vehicleProbabilityLongTermMean", v8);
  }
  if ((*((unsigned char *)this + 122) & 2) != 0) {
    PB::TextFormatter::format(a2, "wifiHint", *((_DWORD *)this + 29));
  }

  return PB::TextFormatter::endObject(a2);
}

BOOL KappaTriggerSample::readFrom(KappaTriggerSample *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    float v8 = (void **)((char *)this + 8);
    int v9 = (char *)this + 24;
    while (1)
    {
      uint64_t v10 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        unint64_t v14 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v15 = *(unsigned char *)(v10 + v2);
        v13 |= (unint64_t)(v15 & 0x7F) << v11;
        if ((v15 & 0x80) == 0) {
          break;
        }
        v11 += 7;
        unint64_t v2 = v14;
        BOOL v16 = v12++ > 8;
        if (v16) {
          goto LABEL_20;
        }
      }
LABEL_21:
      int v22 = v13 & 7;
      if (v22 == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      switch((v13 >> 3))
      {
        case 1u:
          *((_DWORD *)this + 30) |= 4u;
          unint64_t v23 = *((void *)a2 + 1);
          if (v23 > 0xFFFFFFFFFFFFFFF7 || v23 + 8 > *((void *)a2 + 2)) {
            goto LABEL_348;
          }
          *((void *)this + 6) = *(void *)(*(void *)a2 + v23);
          uint64_t v24 = *((void *)a2 + 1) + 8;
          goto LABEL_351;
        case 2u:
          *((_DWORD *)this + 30) |= 0x2000u;
          unint64_t v25 = *((void *)a2 + 1);
          unint64_t v26 = *((void *)a2 + 2);
          uint64_t v27 = *(void *)a2;
          if (v25 <= 0xFFFFFFFFFFFFFFF5 && v25 + 10 <= v26)
          {
            char v28 = 0;
            unsigned int v29 = 0;
            uint64_t v30 = 0;
            do
            {
              unint64_t v31 = v25 + 1;
              *((void *)a2 + 1) = v25 + 1;
              char v32 = *(unsigned char *)(v27 + v25);
              v30 |= (unint64_t)(v32 & 0x7F) << v28;
              if ((v32 & 0x80) == 0) {
                goto LABEL_295;
              }
              v28 += 7;
              unint64_t v25 = v31;
              BOOL v16 = v29++ > 8;
            }
            while (!v16);
LABEL_169:
            LODWORD(v30) = 0;
            goto LABEL_295;
          }
          char v161 = 0;
          unsigned int v162 = 0;
          uint64_t v30 = 0;
          if (v26 <= v25) {
            unint64_t v26 = *((void *)a2 + 1);
          }
          while (2)
          {
            if (v26 == v25)
            {
              LODWORD(v30) = 0;
              *((unsigned char *)a2 + 24) = 1;
            }
            else
            {
              unint64_t v163 = v25 + 1;
              char v164 = *(unsigned char *)(v27 + v25);
              *((void *)a2 + 1) = v163;
              v30 |= (unint64_t)(v164 & 0x7F) << v161;
              if (v164 < 0)
              {
                v161 += 7;
                unint64_t v25 = v163;
                BOOL v16 = v162++ > 8;
                if (v16) {
                  goto LABEL_169;
                }
                continue;
              }
              if (*((unsigned char *)a2 + 24)) {
                LODWORD(v30) = 0;
              }
            }
            break;
          }
LABEL_295:
          *((_DWORD *)this + 25) = v30;
          goto LABEL_352;
        case 3u:
          *((_DWORD *)this + 30) |= 0x8000u;
          unint64_t v33 = *((void *)a2 + 1);
          unint64_t v34 = *((void *)a2 + 2);
          uint64_t v35 = *(void *)a2;
          if (v33 <= 0xFFFFFFFFFFFFFFF5 && v33 + 10 <= v34)
          {
            char v36 = 0;
            unsigned int v37 = 0;
            uint64_t v38 = 0;
            do
            {
              unint64_t v39 = v33 + 1;
              *((void *)a2 + 1) = v33 + 1;
              char v40 = *(unsigned char *)(v35 + v33);
              v38 |= (unint64_t)(v40 & 0x7F) << v36;
              if ((v40 & 0x80) == 0) {
                goto LABEL_298;
              }
              v36 += 7;
              unint64_t v33 = v39;
              BOOL v16 = v37++ > 8;
            }
            while (!v16);
LABEL_176:
            LODWORD(v38) = 0;
            goto LABEL_298;
          }
          char v165 = 0;
          unsigned int v166 = 0;
          uint64_t v38 = 0;
          if (v34 <= v33) {
            unint64_t v34 = *((void *)a2 + 1);
          }
          while (2)
          {
            if (v34 == v33)
            {
              LODWORD(v38) = 0;
              *((unsigned char *)a2 + 24) = 1;
            }
            else
            {
              unint64_t v167 = v33 + 1;
              char v168 = *(unsigned char *)(v35 + v33);
              *((void *)a2 + 1) = v167;
              v38 |= (unint64_t)(v168 & 0x7F) << v165;
              if (v168 < 0)
              {
                v165 += 7;
                unint64_t v33 = v167;
                BOOL v16 = v166++ > 8;
                if (v16) {
                  goto LABEL_176;
                }
                continue;
              }
              if (*((unsigned char *)a2 + 24)) {
                LODWORD(v38) = 0;
              }
            }
            break;
          }
LABEL_298:
          *((_DWORD *)this + 27) = v38;
          goto LABEL_352;
        case 4u:
          *((_DWORD *)this + 30) |= 0x400u;
          unint64_t v41 = *((void *)a2 + 1);
          unint64_t v42 = *((void *)a2 + 2);
          uint64_t v43 = *(void *)a2;
          if (v41 <= 0xFFFFFFFFFFFFFFF5 && v41 + 10 <= v42)
          {
            char v44 = 0;
            unsigned int v45 = 0;
            uint64_t v46 = 0;
            do
            {
              unint64_t v47 = v41 + 1;
              *((void *)a2 + 1) = v41 + 1;
              char v48 = *(unsigned char *)(v43 + v41);
              v46 |= (unint64_t)(v48 & 0x7F) << v44;
              if ((v48 & 0x80) == 0) {
                goto LABEL_301;
              }
              v44 += 7;
              unint64_t v41 = v47;
              BOOL v16 = v45++ > 8;
            }
            while (!v16);
LABEL_183:
            LODWORD(v46) = 0;
            goto LABEL_301;
          }
          char v169 = 0;
          unsigned int v170 = 0;
          uint64_t v46 = 0;
          if (v42 <= v41) {
            unint64_t v42 = *((void *)a2 + 1);
          }
          while (2)
          {
            if (v42 == v41)
            {
              LODWORD(v46) = 0;
              *((unsigned char *)a2 + 24) = 1;
            }
            else
            {
              unint64_t v171 = v41 + 1;
              char v172 = *(unsigned char *)(v43 + v41);
              *((void *)a2 + 1) = v171;
              v46 |= (unint64_t)(v172 & 0x7F) << v169;
              if (v172 < 0)
              {
                v169 += 7;
                unint64_t v41 = v171;
                BOOL v16 = v170++ > 8;
                if (v16) {
                  goto LABEL_183;
                }
                continue;
              }
              if (*((unsigned char *)a2 + 24)) {
                LODWORD(v46) = 0;
              }
            }
            break;
          }
LABEL_301:
          *((_DWORD *)this + 22) = v46;
          goto LABEL_352;
        case 5u:
          *((_DWORD *)this + 30) |= 0x10000u;
          unint64_t v49 = *((void *)a2 + 1);
          unint64_t v50 = *((void *)a2 + 2);
          uint64_t v51 = *(void *)a2;
          if (v49 <= 0xFFFFFFFFFFFFFFF5 && v49 + 10 <= v50)
          {
            char v52 = 0;
            unsigned int v53 = 0;
            uint64_t v54 = 0;
            do
            {
              unint64_t v55 = v49 + 1;
              *((void *)a2 + 1) = v49 + 1;
              char v56 = *(unsigned char *)(v51 + v49);
              v54 |= (unint64_t)(v56 & 0x7F) << v52;
              if ((v56 & 0x80) == 0) {
                goto LABEL_304;
              }
              v52 += 7;
              unint64_t v49 = v55;
              BOOL v16 = v53++ > 8;
            }
            while (!v16);
LABEL_190:
            LODWORD(v54) = 0;
            goto LABEL_304;
          }
          char v173 = 0;
          unsigned int v174 = 0;
          uint64_t v54 = 0;
          if (v50 <= v49) {
            unint64_t v50 = *((void *)a2 + 1);
          }
          while (2)
          {
            if (v50 == v49)
            {
              LODWORD(v54) = 0;
              *((unsigned char *)a2 + 24) = 1;
            }
            else
            {
              unint64_t v175 = v49 + 1;
              char v176 = *(unsigned char *)(v51 + v49);
              *((void *)a2 + 1) = v175;
              v54 |= (unint64_t)(v176 & 0x7F) << v173;
              if (v176 < 0)
              {
                v173 += 7;
                unint64_t v49 = v175;
                BOOL v16 = v174++ > 8;
                if (v16) {
                  goto LABEL_190;
                }
                continue;
              }
              if (*((unsigned char *)a2 + 24)) {
                LODWORD(v54) = 0;
              }
            }
            break;
          }
LABEL_304:
          *((_DWORD *)this + 28) = v54;
          goto LABEL_352;
        case 6u:
          *((_DWORD *)this + 30) |= 8u;
          unint64_t v57 = *((void *)a2 + 1);
          unint64_t v58 = *((void *)a2 + 2);
          uint64_t v59 = *(void *)a2;
          if (v57 <= 0xFFFFFFFFFFFFFFF5 && v57 + 10 <= v58)
          {
            char v60 = 0;
            unsigned int v61 = 0;
            uint64_t v62 = 0;
            do
            {
              unint64_t v63 = v57 + 1;
              *((void *)a2 + 1) = v57 + 1;
              char v64 = *(unsigned char *)(v59 + v57);
              v62 |= (unint64_t)(v64 & 0x7F) << v60;
              if ((v64 & 0x80) == 0) {
                goto LABEL_307;
              }
              v60 += 7;
              unint64_t v57 = v63;
              BOOL v16 = v61++ > 8;
            }
            while (!v16);
LABEL_197:
            uint64_t v62 = 0;
            goto LABEL_307;
          }
          char v177 = 0;
          unsigned int v178 = 0;
          uint64_t v62 = 0;
          if (v58 <= v57) {
            unint64_t v58 = *((void *)a2 + 1);
          }
          while (2)
          {
            if (v58 == v57)
            {
              uint64_t v62 = 0;
              *((unsigned char *)a2 + 24) = 1;
            }
            else
            {
              unint64_t v179 = v57 + 1;
              char v180 = *(unsigned char *)(v59 + v57);
              *((void *)a2 + 1) = v179;
              v62 |= (unint64_t)(v180 & 0x7F) << v177;
              if (v180 < 0)
              {
                v177 += 7;
                unint64_t v57 = v179;
                BOOL v16 = v178++ > 8;
                if (v16) {
                  goto LABEL_197;
                }
                continue;
              }
              if (*((unsigned char *)a2 + 24)) {
                uint64_t v62 = 0;
              }
            }
            break;
          }
LABEL_307:
          *((void *)this + 7) = v62;
          goto LABEL_352;
        case 7u:
          *((_DWORD *)this + 30) |= 0x40u;
          unint64_t v65 = *((void *)a2 + 1);
          if (v65 > 0xFFFFFFFFFFFFFFFBLL || v65 + 4 > *((void *)a2 + 2)) {
            goto LABEL_348;
          }
          *((_DWORD *)this + 18) = *(_DWORD *)(*(void *)a2 + v65);
          goto LABEL_350;
        case 8u:
          *((_DWORD *)this + 30) |= 0x200u;
          unint64_t v66 = *((void *)a2 + 1);
          if (v66 > 0xFFFFFFFFFFFFFFFBLL || v66 + 4 > *((void *)a2 + 2)) {
            goto LABEL_348;
          }
          *((_DWORD *)this + 21) = *(_DWORD *)(*(void *)a2 + v66);
          goto LABEL_350;
        case 9u:
          *((_DWORD *)this + 30) |= 0x4000u;
          unint64_t v67 = *((void *)a2 + 1);
          unint64_t v68 = *((void *)a2 + 2);
          uint64_t v69 = *(void *)a2;
          if (v67 <= 0xFFFFFFFFFFFFFFF5 && v67 + 10 <= v68)
          {
            char v70 = 0;
            unsigned int v71 = 0;
            uint64_t v72 = 0;
            do
            {
              unint64_t v73 = v67 + 1;
              *((void *)a2 + 1) = v67 + 1;
              char v74 = *(unsigned char *)(v69 + v67);
              v72 |= (unint64_t)(v74 & 0x7F) << v70;
              if ((v74 & 0x80) == 0) {
                goto LABEL_310;
              }
              v70 += 7;
              unint64_t v67 = v73;
              BOOL v16 = v71++ > 8;
            }
            while (!v16);
LABEL_204:
            LODWORD(v72) = 0;
            goto LABEL_310;
          }
          char v181 = 0;
          unsigned int v182 = 0;
          uint64_t v72 = 0;
          if (v68 <= v67) {
            unint64_t v68 = *((void *)a2 + 1);
          }
          while (2)
          {
            if (v68 == v67)
            {
              LODWORD(v72) = 0;
              *((unsigned char *)a2 + 24) = 1;
            }
            else
            {
              unint64_t v183 = v67 + 1;
              char v184 = *(unsigned char *)(v69 + v67);
              *((void *)a2 + 1) = v183;
              v72 |= (unint64_t)(v184 & 0x7F) << v181;
              if (v184 < 0)
              {
                v181 += 7;
                unint64_t v67 = v183;
                BOOL v16 = v182++ > 8;
                if (v16) {
                  goto LABEL_204;
                }
                continue;
              }
              if (*((unsigned char *)a2 + 24)) {
                LODWORD(v72) = 0;
              }
            }
            break;
          }
LABEL_310:
          *((_DWORD *)this + 26) = v72;
          goto LABEL_352;
        case 0xAu:
          *((_DWORD *)this + 30) |= 0x100u;
          unint64_t v75 = *((void *)a2 + 1);
          unint64_t v76 = *((void *)a2 + 2);
          uint64_t v77 = *(void *)a2;
          if (v75 <= 0xFFFFFFFFFFFFFFF5 && v75 + 10 <= v76)
          {
            char v78 = 0;
            unsigned int v79 = 0;
            uint64_t v80 = 0;
            do
            {
              unint64_t v81 = v75 + 1;
              *((void *)a2 + 1) = v75 + 1;
              char v82 = *(unsigned char *)(v77 + v75);
              v80 |= (unint64_t)(v82 & 0x7F) << v78;
              if ((v82 & 0x80) == 0) {
                goto LABEL_313;
              }
              v78 += 7;
              unint64_t v75 = v81;
              BOOL v16 = v79++ > 8;
            }
            while (!v16);
LABEL_211:
            LODWORD(v80) = 0;
            goto LABEL_313;
          }
          char v185 = 0;
          unsigned int v186 = 0;
          uint64_t v80 = 0;
          if (v76 <= v75) {
            unint64_t v76 = *((void *)a2 + 1);
          }
          while (2)
          {
            if (v76 == v75)
            {
              LODWORD(v80) = 0;
              *((unsigned char *)a2 + 24) = 1;
            }
            else
            {
              unint64_t v187 = v75 + 1;
              char v188 = *(unsigned char *)(v77 + v75);
              *((void *)a2 + 1) = v187;
              v80 |= (unint64_t)(v188 & 0x7F) << v185;
              if (v188 < 0)
              {
                v185 += 7;
                unint64_t v75 = v187;
                BOOL v16 = v186++ > 8;
                if (v16) {
                  goto LABEL_211;
                }
                continue;
              }
              if (*((unsigned char *)a2 + 24)) {
                LODWORD(v80) = 0;
              }
            }
            break;
          }
LABEL_313:
          *((_DWORD *)this + 20) = v80;
          goto LABEL_352;
        case 0xBu:
          *((_DWORD *)this + 30) |= 0x10u;
          unint64_t v83 = *((void *)a2 + 1);
          unint64_t v84 = *((void *)a2 + 2);
          uint64_t v85 = *(void *)a2;
          if (v83 <= 0xFFFFFFFFFFFFFFF5 && v83 + 10 <= v84)
          {
            char v86 = 0;
            unsigned int v87 = 0;
            uint64_t v88 = 0;
            do
            {
              unint64_t v89 = v83 + 1;
              *((void *)a2 + 1) = v83 + 1;
              char v90 = *(unsigned char *)(v85 + v83);
              v88 |= (unint64_t)(v90 & 0x7F) << v86;
              if ((v90 & 0x80) == 0) {
                goto LABEL_316;
              }
              v86 += 7;
              unint64_t v83 = v89;
              BOOL v16 = v87++ > 8;
            }
            while (!v16);
LABEL_218:
            LODWORD(v88) = 0;
            goto LABEL_316;
          }
          char v189 = 0;
          unsigned int v190 = 0;
          uint64_t v88 = 0;
          if (v84 <= v83) {
            unint64_t v84 = *((void *)a2 + 1);
          }
          while (2)
          {
            if (v84 == v83)
            {
              LODWORD(v88) = 0;
              *((unsigned char *)a2 + 24) = 1;
            }
            else
            {
              unint64_t v191 = v83 + 1;
              char v192 = *(unsigned char *)(v85 + v83);
              *((void *)a2 + 1) = v191;
              v88 |= (unint64_t)(v192 & 0x7F) << v189;
              if (v192 < 0)
              {
                v189 += 7;
                unint64_t v83 = v191;
                BOOL v16 = v190++ > 8;
                if (v16) {
                  goto LABEL_218;
                }
                continue;
              }
              if (*((unsigned char *)a2 + 24)) {
                LODWORD(v88) = 0;
              }
            }
            break;
          }
LABEL_316:
          *((_DWORD *)this + 16) = v88;
          goto LABEL_352;
        case 0xCu:
          *((_DWORD *)this + 30) |= 0x20000u;
          unint64_t v91 = *((void *)a2 + 1);
          unint64_t v92 = *((void *)a2 + 2);
          uint64_t v93 = *(void *)a2;
          if (v91 <= 0xFFFFFFFFFFFFFFF5 && v91 + 10 <= v92)
          {
            char v94 = 0;
            unsigned int v95 = 0;
            uint64_t v96 = 0;
            do
            {
              unint64_t v97 = v91 + 1;
              *((void *)a2 + 1) = v91 + 1;
              char v98 = *(unsigned char *)(v93 + v91);
              v96 |= (unint64_t)(v98 & 0x7F) << v94;
              if ((v98 & 0x80) == 0) {
                goto LABEL_319;
              }
              v94 += 7;
              unint64_t v91 = v97;
              BOOL v16 = v95++ > 8;
            }
            while (!v16);
LABEL_225:
            LODWORD(v96) = 0;
            goto LABEL_319;
          }
          char v193 = 0;
          unsigned int v194 = 0;
          uint64_t v96 = 0;
          if (v92 <= v91) {
            unint64_t v92 = *((void *)a2 + 1);
          }
          while (2)
          {
            if (v92 == v91)
            {
              LODWORD(v96) = 0;
              *((unsigned char *)a2 + 24) = 1;
            }
            else
            {
              unint64_t v195 = v91 + 1;
              char v196 = *(unsigned char *)(v93 + v91);
              *((void *)a2 + 1) = v195;
              v96 |= (unint64_t)(v196 & 0x7F) << v193;
              if (v196 < 0)
              {
                v193 += 7;
                unint64_t v91 = v195;
                BOOL v16 = v194++ > 8;
                if (v16) {
                  goto LABEL_225;
                }
                continue;
              }
              if (*((unsigned char *)a2 + 24)) {
                LODWORD(v96) = 0;
              }
            }
            break;
          }
LABEL_319:
          *((_DWORD *)this + 29) = v96;
          goto LABEL_352;
        case 0xDu:
          *((_DWORD *)this + 30) |= 0x20u;
          unint64_t v99 = *((void *)a2 + 1);
          unint64_t v100 = *((void *)a2 + 2);
          uint64_t v101 = *(void *)a2;
          if (v99 <= 0xFFFFFFFFFFFFFFF5 && v99 + 10 <= v100)
          {
            char v102 = 0;
            unsigned int v103 = 0;
            uint64_t v104 = 0;
            do
            {
              unint64_t v105 = v99 + 1;
              *((void *)a2 + 1) = v99 + 1;
              char v106 = *(unsigned char *)(v101 + v99);
              v104 |= (unint64_t)(v106 & 0x7F) << v102;
              if ((v106 & 0x80) == 0) {
                goto LABEL_322;
              }
              v102 += 7;
              unint64_t v99 = v105;
              BOOL v16 = v103++ > 8;
            }
            while (!v16);
LABEL_232:
            LODWORD(v104) = 0;
            goto LABEL_322;
          }
          char v197 = 0;
          unsigned int v198 = 0;
          uint64_t v104 = 0;
          if (v100 <= v99) {
            unint64_t v100 = *((void *)a2 + 1);
          }
          while (2)
          {
            if (v100 == v99)
            {
              LODWORD(v104) = 0;
              *((unsigned char *)a2 + 24) = 1;
            }
            else
            {
              unint64_t v199 = v99 + 1;
              char v200 = *(unsigned char *)(v101 + v99);
              *((void *)a2 + 1) = v199;
              v104 |= (unint64_t)(v200 & 0x7F) << v197;
              if (v200 < 0)
              {
                v197 += 7;
                unint64_t v99 = v199;
                BOOL v16 = v198++ > 8;
                if (v16) {
                  goto LABEL_232;
                }
                continue;
              }
              if (*((unsigned char *)a2 + 24)) {
                LODWORD(v104) = 0;
              }
            }
            break;
          }
LABEL_322:
          *((_DWORD *)this + 17) = v104;
          goto LABEL_352;
        case 0xEu:
          *((_DWORD *)this + 30) |= 2u;
          unint64_t v107 = *((void *)a2 + 1);
          unint64_t v108 = *((void *)a2 + 2);
          uint64_t v109 = *(void *)a2;
          if (v107 <= 0xFFFFFFFFFFFFFFF5 && v107 + 10 <= v108)
          {
            char v110 = 0;
            unsigned int v111 = 0;
            uint64_t v112 = 0;
            do
            {
              unint64_t v113 = v107 + 1;
              *((void *)a2 + 1) = v107 + 1;
              char v114 = *(unsigned char *)(v109 + v107);
              v112 |= (unint64_t)(v114 & 0x7F) << v110;
              if ((v114 & 0x80) == 0) {
                goto LABEL_325;
              }
              v110 += 7;
              unint64_t v107 = v113;
              BOOL v16 = v111++ > 8;
            }
            while (!v16);
LABEL_239:
            uint64_t v112 = 0;
            goto LABEL_325;
          }
          char v201 = 0;
          unsigned int v202 = 0;
          uint64_t v112 = 0;
          if (v108 <= v107) {
            unint64_t v108 = *((void *)a2 + 1);
          }
          while (2)
          {
            if (v108 == v107)
            {
              uint64_t v112 = 0;
              *((unsigned char *)a2 + 24) = 1;
            }
            else
            {
              unint64_t v203 = v107 + 1;
              char v204 = *(unsigned char *)(v109 + v107);
              *((void *)a2 + 1) = v203;
              v112 |= (unint64_t)(v204 & 0x7F) << v201;
              if (v204 < 0)
              {
                v201 += 7;
                unint64_t v107 = v203;
                BOOL v16 = v202++ > 8;
                if (v16) {
                  goto LABEL_239;
                }
                continue;
              }
              if (*((unsigned char *)a2 + 24)) {
                uint64_t v112 = 0;
              }
            }
            break;
          }
LABEL_325:
          *((void *)this + 5) = v112;
          goto LABEL_352;
        case 0xFu:
          if (v22 == 2)
          {
            if (PB::Reader::placeMark()) {
              return 0;
            }
            unint64_t v115 = *((void *)a2 + 1);
            unint64_t v116 = *((void *)a2 + 2);
            while (v115 < v116 && !*((unsigned char *)a2 + 24))
            {
              v118 = (char *)*((void *)this + 2);
              unint64_t v117 = *((void *)this + 3);
              if ((unint64_t)v118 >= v117)
              {
                v120 = (char *)*v8;
                uint64_t v121 = (v118 - (unsigned char *)*v8) >> 2;
                unint64_t v122 = v121 + 1;
                if ((unint64_t)(v121 + 1) >> 62) {
                  goto LABEL_362;
                }
                uint64_t v123 = v117 - (void)v120;
                if (v123 >> 1 > v122) {
                  unint64_t v122 = v123 >> 1;
                }
                if ((unint64_t)v123 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v124 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v124 = v122;
                }
                if (v124)
                {
                  v125 = (char *)sub_100024458((uint64_t)v9, v124);
                  v120 = (char *)*((void *)this + 1);
                  v118 = (char *)*((void *)this + 2);
                }
                else
                {
                  v125 = 0;
                }
                v126 = &v125[4 * v121];
                *(_DWORD *)v126 = 0;
                v119 = v126 + 4;
                while (v118 != v120)
                {
                  int v127 = *((_DWORD *)v118 - 1);
                  v118 -= 4;
                  *((_DWORD *)v126 - 1) = v127;
                  v126 -= 4;
                }
                *((void *)this + 1) = v126;
                *((void *)this + 2) = v119;
                *((void *)this + 3) = &v125[4 * v124];
                if (v120) {
                  operator delete(v120);
                }
              }
              else
              {
                *(_DWORD *)v118 = 0;
                v119 = v118 + 4;
              }
              *((void *)this + 2) = v119;
              unint64_t v128 = *((void *)a2 + 1);
              if (v128 > 0xFFFFFFFFFFFFFFFBLL || v128 + 4 > *((void *)a2 + 2))
              {
                *((unsigned char *)a2 + 24) = 1;
                break;
              }
              *(v119 - 1) = *(_DWORD *)(*(void *)a2 + v128);
              unint64_t v116 = *((void *)a2 + 2);
              unint64_t v115 = *((void *)a2 + 1) + 4;
              *((void *)a2 + 1) = v115;
            }
            PB::Reader::recallMark();
          }
          else
          {
            v206 = (char *)*((void *)this + 2);
            unint64_t v205 = *((void *)this + 3);
            if ((unint64_t)v206 >= v205)
            {
              v224 = (char *)*v8;
              uint64_t v225 = (v206 - (unsigned char *)*v8) >> 2;
              unint64_t v226 = v225 + 1;
              if ((unint64_t)(v225 + 1) >> 62) {
LABEL_362:
              }
                sub_10000EE98();
              uint64_t v227 = v205 - (void)v224;
              if (v227 >> 1 > v226) {
                unint64_t v226 = v227 >> 1;
              }
              if ((unint64_t)v227 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v228 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v228 = v226;
              }
              if (v228)
              {
                v229 = (char *)sub_100024458((uint64_t)v9, v228);
                v224 = (char *)*((void *)this + 1);
                v206 = (char *)*((void *)this + 2);
              }
              else
              {
                v229 = 0;
              }
              v230 = &v229[4 * v225];
              *(_DWORD *)v230 = 0;
              v207 = v230 + 4;
              while (v206 != v224)
              {
                int v231 = *((_DWORD *)v206 - 1);
                v206 -= 4;
                *((_DWORD *)v230 - 1) = v231;
                v230 -= 4;
              }
              *((void *)this + 1) = v230;
              *((void *)this + 2) = v207;
              *((void *)this + 3) = &v229[4 * v228];
              if (v224) {
                operator delete(v224);
              }
            }
            else
            {
              *(_DWORD *)v206 = 0;
              v207 = v206 + 4;
            }
            *((void *)this + 2) = v207;
            unint64_t v232 = *((void *)a2 + 1);
            if (v232 <= 0xFFFFFFFFFFFFFFFBLL && v232 + 4 <= *((void *)a2 + 2))
            {
              *(v207 - 1) = *(_DWORD *)(*(void *)a2 + v232);
LABEL_350:
              uint64_t v24 = *((void *)a2 + 1) + 4;
LABEL_351:
              *((void *)a2 + 1) = v24;
            }
            else
            {
LABEL_348:
              *((unsigned char *)a2 + 24) = 1;
            }
          }
LABEL_352:
          unint64_t v2 = *((void *)a2 + 1);
          unint64_t v3 = *((void *)a2 + 2);
          int v4 = *((unsigned __int8 *)a2 + 24);
          if (v2 >= v3 || v4 != 0) {
            return v4 == 0;
          }
          break;
        case 0x10u:
          *((_DWORD *)this + 30) |= 0x1000u;
          unint64_t v129 = *((void *)a2 + 1);
          unint64_t v130 = *((void *)a2 + 2);
          uint64_t v131 = *(void *)a2;
          if (v129 <= 0xFFFFFFFFFFFFFFF5 && v129 + 10 <= v130)
          {
            char v132 = 0;
            unsigned int v133 = 0;
            uint64_t v134 = 0;
            do
            {
              unint64_t v135 = v129 + 1;
              *((void *)a2 + 1) = v129 + 1;
              char v136 = *(unsigned char *)(v131 + v129);
              v134 |= (unint64_t)(v136 & 0x7F) << v132;
              if ((v136 & 0x80) == 0) {
                goto LABEL_328;
              }
              v132 += 7;
              unint64_t v129 = v135;
              BOOL v16 = v133++ > 8;
            }
            while (!v16);
LABEL_248:
            LODWORD(v134) = 0;
            goto LABEL_328;
          }
          char v208 = 0;
          unsigned int v209 = 0;
          uint64_t v134 = 0;
          if (v130 <= v129) {
            unint64_t v130 = *((void *)a2 + 1);
          }
          while (2)
          {
            if (v130 == v129)
            {
              LODWORD(v134) = 0;
              *((unsigned char *)a2 + 24) = 1;
            }
            else
            {
              unint64_t v210 = v129 + 1;
              char v211 = *(unsigned char *)(v131 + v129);
              *((void *)a2 + 1) = v210;
              v134 |= (unint64_t)(v211 & 0x7F) << v208;
              if (v211 < 0)
              {
                v208 += 7;
                unint64_t v129 = v210;
                BOOL v16 = v209++ > 8;
                if (v16) {
                  goto LABEL_248;
                }
                continue;
              }
              if (*((unsigned char *)a2 + 24)) {
                LODWORD(v134) = 0;
              }
            }
            break;
          }
LABEL_328:
          *((_DWORD *)this + 24) = v134;
          goto LABEL_352;
        case 0x11u:
          *((_DWORD *)this + 30) |= 0x80u;
          unint64_t v137 = *((void *)a2 + 1);
          unint64_t v138 = *((void *)a2 + 2);
          uint64_t v139 = *(void *)a2;
          if (v137 <= 0xFFFFFFFFFFFFFFF5 && v137 + 10 <= v138)
          {
            char v140 = 0;
            unsigned int v141 = 0;
            uint64_t v142 = 0;
            do
            {
              unint64_t v143 = v137 + 1;
              *((void *)a2 + 1) = v137 + 1;
              char v144 = *(unsigned char *)(v139 + v137);
              v142 |= (unint64_t)(v144 & 0x7F) << v140;
              if ((v144 & 0x80) == 0) {
                goto LABEL_331;
              }
              v140 += 7;
              unint64_t v137 = v143;
              BOOL v16 = v141++ > 8;
            }
            while (!v16);
LABEL_255:
            LODWORD(v142) = 0;
            goto LABEL_331;
          }
          char v212 = 0;
          unsigned int v213 = 0;
          uint64_t v142 = 0;
          if (v138 <= v137) {
            unint64_t v138 = *((void *)a2 + 1);
          }
          while (2)
          {
            if (v138 == v137)
            {
              LODWORD(v142) = 0;
              *((unsigned char *)a2 + 24) = 1;
            }
            else
            {
              unint64_t v214 = v137 + 1;
              char v215 = *(unsigned char *)(v139 + v137);
              *((void *)a2 + 1) = v214;
              v142 |= (unint64_t)(v215 & 0x7F) << v212;
              if (v215 < 0)
              {
                v212 += 7;
                unint64_t v137 = v214;
                BOOL v16 = v213++ > 8;
                if (v16) {
                  goto LABEL_255;
                }
                continue;
              }
              if (*((unsigned char *)a2 + 24)) {
                LODWORD(v142) = 0;
              }
            }
            break;
          }
LABEL_331:
          *((_DWORD *)this + 19) = v142;
          goto LABEL_352;
        case 0x12u:
          *((_DWORD *)this + 30) |= 0x800u;
          unint64_t v145 = *((void *)a2 + 1);
          unint64_t v146 = *((void *)a2 + 2);
          uint64_t v147 = *(void *)a2;
          if (v145 <= 0xFFFFFFFFFFFFFFF5 && v145 + 10 <= v146)
          {
            char v148 = 0;
            unsigned int v149 = 0;
            uint64_t v150 = 0;
            do
            {
              unint64_t v151 = v145 + 1;
              *((void *)a2 + 1) = v145 + 1;
              char v152 = *(unsigned char *)(v147 + v145);
              v150 |= (unint64_t)(v152 & 0x7F) << v148;
              if ((v152 & 0x80) == 0) {
                goto LABEL_334;
              }
              v148 += 7;
              unint64_t v145 = v151;
              BOOL v16 = v149++ > 8;
            }
            while (!v16);
LABEL_262:
            LODWORD(v150) = 0;
            goto LABEL_334;
          }
          char v216 = 0;
          unsigned int v217 = 0;
          uint64_t v150 = 0;
          if (v146 <= v145) {
            unint64_t v146 = *((void *)a2 + 1);
          }
          while (2)
          {
            if (v146 == v145)
            {
              LODWORD(v150) = 0;
              *((unsigned char *)a2 + 24) = 1;
            }
            else
            {
              unint64_t v218 = v145 + 1;
              char v219 = *(unsigned char *)(v147 + v145);
              *((void *)a2 + 1) = v218;
              v150 |= (unint64_t)(v219 & 0x7F) << v216;
              if (v219 < 0)
              {
                v216 += 7;
                unint64_t v145 = v218;
                BOOL v16 = v217++ > 8;
                if (v16) {
                  goto LABEL_262;
                }
                continue;
              }
              if (*((unsigned char *)a2 + 24)) {
                LODWORD(v150) = 0;
              }
            }
            break;
          }
LABEL_334:
          *((_DWORD *)this + 23) = v150;
          goto LABEL_352;
        case 0x13u:
          *((_DWORD *)this + 30) |= 1u;
          unint64_t v153 = *((void *)a2 + 1);
          unint64_t v154 = *((void *)a2 + 2);
          uint64_t v155 = *(void *)a2;
          if (v153 <= 0xFFFFFFFFFFFFFFF5 && v153 + 10 <= v154)
          {
            char v156 = 0;
            unsigned int v157 = 0;
            uint64_t v158 = 0;
            do
            {
              unint64_t v159 = v153 + 1;
              *((void *)a2 + 1) = v153 + 1;
              char v160 = *(unsigned char *)(v155 + v153);
              v158 |= (unint64_t)(v160 & 0x7F) << v156;
              if ((v160 & 0x80) == 0) {
                goto LABEL_337;
              }
              v156 += 7;
              unint64_t v153 = v159;
              BOOL v16 = v157++ > 8;
            }
            while (!v16);
LABEL_269:
            uint64_t v158 = 0;
            goto LABEL_337;
          }
          char v220 = 0;
          unsigned int v221 = 0;
          uint64_t v158 = 0;
          if (v154 <= v153) {
            unint64_t v154 = *((void *)a2 + 1);
          }
          while (2)
          {
            if (v154 == v153)
            {
              uint64_t v158 = 0;
              *((unsigned char *)a2 + 24) = 1;
            }
            else
            {
              unint64_t v222 = v153 + 1;
              char v223 = *(unsigned char *)(v155 + v153);
              *((void *)a2 + 1) = v222;
              v158 |= (unint64_t)(v223 & 0x7F) << v220;
              if (v223 < 0)
              {
                v220 += 7;
                unint64_t v153 = v222;
                BOOL v16 = v221++ > 8;
                if (v16) {
                  goto LABEL_269;
                }
                continue;
              }
              if (*((unsigned char *)a2 + 24)) {
                uint64_t v158 = 0;
              }
            }
            break;
          }
LABEL_337:
          *((void *)this + 4) = v158;
          goto LABEL_352;
        default:
          if ((PB::Reader::skip(a2, v13 >> 3, v22, 0) & 1) == 0) {
            return 0;
          }
          goto LABEL_352;
      }
    }
    char v17 = 0;
    unsigned int v18 = 0;
    unint64_t v13 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v19 = v2 + 1;
      char v20 = *(unsigned char *)(v10 + v2);
      *((void *)a2 + 1) = v19;
      v13 |= (unint64_t)(v20 & 0x7F) << v17;
      if ((v20 & 0x80) == 0) {
        goto LABEL_21;
      }
      v17 += 7;
      unint64_t v2 = v19;
      if (v18++ >= 9)
      {
LABEL_20:
        unint64_t v13 = 0;
        goto LABEL_21;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t KappaTriggerSample::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  int v4 = *(_DWORD *)(this + 120);
  if ((v4 & 4) != 0)
  {
    this = PB::Writer::write(a2, *(double *)(this + 48), 1u);
    int v4 = *(_DWORD *)(v3 + 120);
    if ((v4 & 0x2000) == 0)
    {
LABEL_3:
      if ((v4 & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((v4 & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  this = PB::Writer::writeVarInt(a2, *(_DWORD *)(v3 + 100), 2u);
  int v4 = *(_DWORD *)(v3 + 120);
  if ((v4 & 0x8000) == 0)
  {
LABEL_4:
    if ((v4 & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  this = PB::Writer::writeVarInt(a2, *(_DWORD *)(v3 + 108), 3u);
  int v4 = *(_DWORD *)(v3 + 120);
  if ((v4 & 0x400) == 0)
  {
LABEL_5:
    if ((v4 & 0x10000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  this = PB::Writer::writeVarInt(a2, *(_DWORD *)(v3 + 88), 4u);
  int v4 = *(_DWORD *)(v3 + 120);
  if ((v4 & 0x10000) == 0)
  {
LABEL_6:
    if ((v4 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  this = PB::Writer::writeVarInt(a2, *(_DWORD *)(v3 + 112), 5u);
  int v4 = *(_DWORD *)(v3 + 120);
  if ((v4 & 8) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  this = PB::Writer::writeVarInt(a2, *(void *)(v3 + 56), 6u);
  int v4 = *(_DWORD *)(v3 + 120);
  if ((v4 & 0x40) == 0)
  {
LABEL_8:
    if ((v4 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  this = PB::Writer::write(a2, *(float *)(v3 + 72), 7u);
  int v4 = *(_DWORD *)(v3 + 120);
  if ((v4 & 0x200) == 0)
  {
LABEL_9:
    if ((v4 & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  this = PB::Writer::write(a2, *(float *)(v3 + 84), 8u);
  int v4 = *(_DWORD *)(v3 + 120);
  if ((v4 & 0x4000) == 0)
  {
LABEL_10:
    if ((v4 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  this = PB::Writer::writeVarInt(a2, *(_DWORD *)(v3 + 104), 9u);
  int v4 = *(_DWORD *)(v3 + 120);
  if ((v4 & 0x100) == 0)
  {
LABEL_11:
    if ((v4 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  this = PB::Writer::writeVarInt(a2, *(_DWORD *)(v3 + 80), 0xAu);
  int v4 = *(_DWORD *)(v3 + 120);
  if ((v4 & 0x10) == 0)
  {
LABEL_12:
    if ((v4 & 0x20000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  this = PB::Writer::writeVarInt(a2, *(_DWORD *)(v3 + 64), 0xBu);
  int v4 = *(_DWORD *)(v3 + 120);
  if ((v4 & 0x20000) == 0)
  {
LABEL_13:
    if ((v4 & 0x20) == 0) {
      goto LABEL_14;
    }
LABEL_36:
    this = PB::Writer::writeVarInt(a2, *(_DWORD *)(v3 + 68), 0xDu);
    if ((*(_DWORD *)(v3 + 120) & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_35:
  this = PB::Writer::writeVarInt(a2, *(_DWORD *)(v3 + 116), 0xCu);
  int v4 = *(_DWORD *)(v3 + 120);
  if ((v4 & 0x20) != 0) {
    goto LABEL_36;
  }
LABEL_14:
  if ((v4 & 2) != 0) {
LABEL_15:
  }
    this = PB::Writer::writeVarInt(a2, *(void *)(v3 + 40), 0xEu);
LABEL_16:
  int v5 = *(float **)(v3 + 8);
  int v6 = *(float **)(v3 + 16);
  while (v5 != v6)
  {
    float v7 = *v5++;
    this = PB::Writer::write(a2, v7, 0xFu);
  }
  int v8 = *(_DWORD *)(v3 + 120);
  if ((v8 & 0x1000) != 0)
  {
    this = PB::Writer::writeVarInt(a2, *(_DWORD *)(v3 + 96), 0x10u);
    int v8 = *(_DWORD *)(v3 + 120);
    if ((v8 & 0x80) == 0)
    {
LABEL_21:
      if ((v8 & 0x800) == 0) {
        goto LABEL_22;
      }
LABEL_40:
      this = PB::Writer::writeVarInt(a2, *(_DWORD *)(v3 + 92), 0x12u);
      if ((*(_DWORD *)(v3 + 120) & 1) == 0) {
        return this;
      }
      goto LABEL_41;
    }
  }
  else if ((v8 & 0x80) == 0)
  {
    goto LABEL_21;
  }
  this = PB::Writer::writeVarInt(a2, *(_DWORD *)(v3 + 76), 0x11u);
  int v8 = *(_DWORD *)(v3 + 120);
  if ((v8 & 0x800) != 0) {
    goto LABEL_40;
  }
LABEL_22:
  if ((v8 & 1) == 0) {
    return this;
  }
LABEL_41:
  unint64_t v9 = *(void *)(v3 + 32);

  return PB::Writer::writeVarInt(a2, v9, 0x13u);
}

BOOL KappaTriggerSample::operator==(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 120);
  int v3 = *(_DWORD *)(a2 + 120);
  if ((v2 & 4) != 0)
  {
    if ((v3 & 4) == 0 || *(double *)(a1 + 48) != *(double *)(a2 + 48)) {
      return 0;
    }
  }
  else if ((v3 & 4) != 0)
  {
    return 0;
  }
  if ((v2 & 0x2000) != 0)
  {
    if ((v3 & 0x2000) == 0 || *(_DWORD *)(a1 + 100) != *(_DWORD *)(a2 + 100)) {
      return 0;
    }
  }
  else if ((v3 & 0x2000) != 0)
  {
    return 0;
  }
  if ((v2 & 0x8000) != 0)
  {
    if ((v3 & 0x8000) == 0 || *(_DWORD *)(a1 + 108) != *(_DWORD *)(a2 + 108)) {
      return 0;
    }
  }
  else if ((v3 & 0x8000) != 0)
  {
    return 0;
  }
  if ((v2 & 0x400) != 0)
  {
    if ((v3 & 0x400) == 0 || *(_DWORD *)(a1 + 88) != *(_DWORD *)(a2 + 88)) {
      return 0;
    }
  }
  else if ((v3 & 0x400) != 0)
  {
    return 0;
  }
  if ((v2 & 0x10000) != 0)
  {
    if ((v3 & 0x10000) == 0 || *(_DWORD *)(a1 + 112) != *(_DWORD *)(a2 + 112)) {
      return 0;
    }
  }
  else if ((v3 & 0x10000) != 0)
  {
    return 0;
  }
  if ((v2 & 8) != 0)
  {
    if ((v3 & 8) == 0 || *(void *)(a1 + 56) != *(void *)(a2 + 56)) {
      return 0;
    }
  }
  else if ((v3 & 8) != 0)
  {
    return 0;
  }
  if ((v2 & 0x40) != 0)
  {
    if ((v3 & 0x40) == 0 || *(float *)(a1 + 72) != *(float *)(a2 + 72)) {
      return 0;
    }
  }
  else if ((v3 & 0x40) != 0)
  {
    return 0;
  }
  if ((v2 & 0x200) != 0)
  {
    if ((v3 & 0x200) == 0 || *(float *)(a1 + 84) != *(float *)(a2 + 84)) {
      return 0;
    }
  }
  else if ((v3 & 0x200) != 0)
  {
    return 0;
  }
  if ((v2 & 0x4000) != 0)
  {
    if ((v3 & 0x4000) == 0 || *(_DWORD *)(a1 + 104) != *(_DWORD *)(a2 + 104)) {
      return 0;
    }
  }
  else if ((v3 & 0x4000) != 0)
  {
    return 0;
  }
  if ((v2 & 0x100) != 0)
  {
    if ((v3 & 0x100) == 0 || *(_DWORD *)(a1 + 80) != *(_DWORD *)(a2 + 80)) {
      return 0;
    }
  }
  else if ((v3 & 0x100) != 0)
  {
    return 0;
  }
  if ((v2 & 0x10) != 0)
  {
    if ((v3 & 0x10) == 0 || *(_DWORD *)(a1 + 64) != *(_DWORD *)(a2 + 64)) {
      return 0;
    }
  }
  else if ((v3 & 0x10) != 0)
  {
    return 0;
  }
  if ((v2 & 0x20000) != 0)
  {
    if ((v3 & 0x20000) == 0 || *(_DWORD *)(a1 + 116) != *(_DWORD *)(a2 + 116)) {
      return 0;
    }
  }
  else if ((v3 & 0x20000) != 0)
  {
    return 0;
  }
  if ((v2 & 0x20) != 0)
  {
    if ((v3 & 0x20) == 0 || *(_DWORD *)(a1 + 68) != *(_DWORD *)(a2 + 68)) {
      return 0;
    }
  }
  else if ((v3 & 0x20) != 0)
  {
    return 0;
  }
  if ((v2 & 2) != 0)
  {
    if ((v3 & 2) == 0 || *(void *)(a1 + 40) != *(void *)(a2 + 40)) {
      return 0;
    }
  }
  else if ((v3 & 2) != 0)
  {
    return 0;
  }
  int v5 = *(float **)(a1 + 8);
  int v4 = *(float **)(a1 + 16);
  int v6 = *(float **)(a2 + 8);
  if ((char *)v4 - (char *)v5 != *(void *)(a2 + 16) - (void)v6) {
    return 0;
  }
  while (v5 != v4)
  {
    if (*v5 != *v6) {
      return 0;
    }
    ++v5;
    ++v6;
  }
  if ((v2 & 0x1000) != 0)
  {
    if ((v3 & 0x1000) == 0 || *(_DWORD *)(a1 + 96) != *(_DWORD *)(a2 + 96)) {
      return 0;
    }
  }
  else if ((v3 & 0x1000) != 0)
  {
    return 0;
  }
  if ((v2 & 0x80) != 0)
  {
    if ((v3 & 0x80) == 0 || *(_DWORD *)(a1 + 76) != *(_DWORD *)(a2 + 76)) {
      return 0;
    }
  }
  else if ((v3 & 0x80) != 0)
  {
    return 0;
  }
  if ((v2 & 0x800) != 0)
  {
    if ((v3 & 0x800) == 0 || *(_DWORD *)(a1 + 92) != *(_DWORD *)(a2 + 92)) {
      return 0;
    }
  }
  else if ((v3 & 0x800) != 0)
  {
    return 0;
  }
  BOOL v7 = (*(_DWORD *)(a2 + 120) & 1) == 0;
  if (v2) {
    return (v3 & 1) != 0 && *(void *)(a1 + 32) == *(void *)(a2 + 32);
  }
  return v7;
}

uint64_t KappaTriggerSample::hash_value(KappaTriggerSample *this)
{
  int v2 = *((_DWORD *)this + 30);
  if ((v2 & 4) != 0)
  {
    double v14 = *((double *)this + 6);
    if (v14 == 0.0) {
      double v14 = 0.0;
    }
    double v26 = v14;
    if ((v2 & 0x2000) != 0)
    {
LABEL_3:
      uint64_t v25 = *((int *)this + 25);
      if ((v2 & 0x8000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else
  {
    double v26 = 0.0;
    if ((v2 & 0x2000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v25 = 0;
  if ((v2 & 0x8000) != 0)
  {
LABEL_4:
    uint64_t v24 = *((int *)this + 27);
    if ((v2 & 0x400) != 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v24 = 0;
  if ((v2 & 0x400) != 0)
  {
LABEL_5:
    uint64_t v23 = *((int *)this + 22);
    if ((v2 & 0x10000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v23 = 0;
  if ((v2 & 0x10000) != 0)
  {
LABEL_6:
    uint64_t v22 = *((int *)this + 28);
    if ((v2 & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v22 = 0;
  if ((v2 & 8) != 0)
  {
LABEL_7:
    uint64_t v3 = *((void *)this + 7);
    if ((v2 & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_30:
    uint64_t v5 = 0;
    if ((v2 & 0x200) != 0) {
      goto LABEL_12;
    }
LABEL_31:
    uint64_t v7 = 0;
    if ((v2 & 0x4000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_32;
  }
LABEL_29:
  uint64_t v3 = 0;
  if ((v2 & 0x40) == 0) {
    goto LABEL_30;
  }
LABEL_8:
  float v4 = *((float *)this + 18);
  if (v4 == 0.0) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = LODWORD(v4);
  }
  if ((v2 & 0x200) == 0) {
    goto LABEL_31;
  }
LABEL_12:
  float v6 = *((float *)this + 21);
  if (v6 == 0.0) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = LODWORD(v6);
  }
  if ((v2 & 0x4000) != 0)
  {
LABEL_16:
    uint64_t v8 = *((int *)this + 26);
    if ((v2 & 0x100) != 0) {
      goto LABEL_17;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v8 = 0;
  if ((v2 & 0x100) != 0)
  {
LABEL_17:
    uint64_t v9 = *((int *)this + 20);
    if ((v2 & 0x10) != 0) {
      goto LABEL_18;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v9 = 0;
  if ((v2 & 0x10) != 0)
  {
LABEL_18:
    uint64_t v10 = *((int *)this + 16);
    if ((v2 & 0x20000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v10 = 0;
  if ((v2 & 0x20000) != 0)
  {
LABEL_19:
    uint64_t v11 = *((int *)this + 29);
    if ((v2 & 0x20) != 0) {
      goto LABEL_20;
    }
LABEL_36:
    uint64_t v12 = 0;
    if ((v2 & 2) != 0) {
      goto LABEL_21;
    }
    goto LABEL_37;
  }
LABEL_35:
  uint64_t v11 = 0;
  if ((v2 & 0x20) == 0) {
    goto LABEL_36;
  }
LABEL_20:
  uint64_t v12 = *((int *)this + 17);
  if ((v2 & 2) != 0)
  {
LABEL_21:
    uint64_t v13 = *((void *)this + 5);
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v13 = 0;
LABEL_38:
  uint64_t v15 = PBHashBytes();
  int v16 = *((_DWORD *)this + 30);
  if ((v16 & 0x1000) != 0)
  {
    uint64_t v17 = *((int *)this + 24);
    if ((v16 & 0x80) != 0)
    {
LABEL_40:
      uint64_t v18 = *((int *)this + 19);
      if ((v16 & 0x800) != 0) {
        goto LABEL_41;
      }
LABEL_45:
      uint64_t v19 = 0;
      if (v16) {
        goto LABEL_42;
      }
LABEL_46:
      uint64_t v20 = 0;
      return v25 ^ *(void *)&v26 ^ v24 ^ v23 ^ v22 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v17 ^ v15 ^ v18 ^ v19 ^ v20;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if ((v16 & 0x80) != 0) {
      goto LABEL_40;
    }
  }
  uint64_t v18 = 0;
  if ((v16 & 0x800) == 0) {
    goto LABEL_45;
  }
LABEL_41:
  uint64_t v19 = *((int *)this + 23);
  if ((v16 & 1) == 0) {
    goto LABEL_46;
  }
LABEL_42:
  uint64_t v20 = *((void *)this + 4);
  return v25 ^ *(void *)&v26 ^ v24 ^ v23 ^ v22 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v17 ^ v15 ^ v18 ^ v19 ^ v20;
}

uint64_t CLKappaFeaturesAlgGPSResult::reset(uint64_t this)
{
  *(unsigned char *)(this + 8) = 0;
  *(_DWORD *)(this + 12) = 0;
  *(void *)(this + 32) = 0;
  *(_WORD *)(this + 40) = 0;
  *(void *)(this + 48) = 0;
  *(_DWORD *)(this + 56) = 2143289344;
  *(void *)(this + 64) = 0;
  *(_DWORD *)(this + 72) = 2143289344;
  *(void *)(this + 80) = 0;
  *(_DWORD *)(this + 88) = 2143289344;
  *(void *)(this + 96) = 0;
  *(_DWORD *)(this + 104) = 0;
  *(unsigned char *)(this + 108) = 0;
  return this;
}

double CLKappaFeaturesAlgGPSResult::log(CLKappaFeaturesAlgGPSResult *this)
{
  return CLKappaFeaturesAlgGPSResult::logInternal(this, 1);
}

double CLKappaFeaturesAlgGPSResult::logInternal(CLKappaFeaturesAlgGPSResult *this, int a2)
{
  if (a2)
  {
    if (qword_1003DB6A0 != -1) {
      dispatch_once(&qword_1003DB6A0, &stru_1003B83D0);
    }
    uint64_t v3 = qword_1003DB6A8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *((void *)this + 4);
      int v6 = *((unsigned __int8 *)this + 40);
      int v7 = *((unsigned __int8 *)this + 41);
      uint64_t v8 = *((void *)this + 6);
      double v9 = *((float *)this + 14);
      uint64_t v10 = *((void *)this + 8);
      double v11 = *((float *)this + 18);
      uint64_t v12 = *((void *)this + 10);
      double v13 = *((float *)this + 22);
      double v14 = *((float *)this + 4);
      double v15 = *((float *)this + 5);
      double v16 = *((float *)this + 6);
      double v17 = *((float *)this + 7);
      uint64_t v18 = *((void *)this + 12);
      float v19 = *((float *)this + 26);
      int v20 = *((unsigned __int8 *)this + 108);
      int v21 = 134353408;
      uint64_t v22 = v5;
      __int16 v23 = 1026;
      int v24 = v6;
      __int16 v25 = 1026;
      int v26 = v7;
      __int16 v27 = 2050;
      uint64_t v28 = v8;
      __int16 v29 = 2050;
      double v30 = v9;
      __int16 v31 = 2050;
      uint64_t v32 = v10;
      __int16 v33 = 2050;
      double v34 = v11;
      __int16 v35 = 2050;
      uint64_t v36 = v12;
      __int16 v37 = 2050;
      double v38 = v13;
      __int16 v39 = 2050;
      double v40 = v14;
      __int16 v41 = 2050;
      double v42 = v15;
      __int16 v43 = 2050;
      double v44 = v16;
      __int16 v45 = 2050;
      double v46 = v17;
      __int16 v47 = 2050;
      uint64_t v48 = v18;
      __int16 v49 = 2050;
      double v50 = v19;
      __int16 v51 = 2050;
      double v52 = (float)(v19 / 0.44704);
      __int16 v53 = 1026;
      int v54 = v20;
      __int16 v55 = 1026;
      int v56 = 1;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[GP] summary,A,%{public}llu,B,%{public}d,C,%{public}d,D,%{public}llu,E,%{public}f,F,%{public}llu,G,%{public}f,H,%{public}llu,I,%{public}f,config-1,%{public}f,config-2,%{public}f,config-3,%{public}f,config-4,%{public}f,debug-1,%{public}llu,debug-2%{public}f,debug-3,%{public}f,debug-4,%{public}d,debug-5,%{public}d\n", (uint8_t *)&v21, 0xA6u);
    }
  }
  return result;
}

void CLKappaFeaturesAlgGPS::CLKappaFeaturesAlgGPS(CLKappaFeaturesAlgGPS *this, uint64_t *a2)
{
  CLKappaAlgBlock::CLKappaAlgBlock(this, a2 + 1);
  uint64_t v4 = *a2;
  uint64_t *v5 = *a2;
  *(void *)((char *)this + *(void *)(v4 - 152)) = a2[6];
  *(void *)((char *)this + *(void *)(*(void *)this - 160)) = a2[7];
  *(void *)((char *)this + *(void *)(*(void *)this - 168)) = a2[8];
  *(void *)((char *)this + *(void *)(*(void *)this - 176)) = a2[9];
  *((void *)this + 4) = 0;
  *((_WORD *)this + 20) = 1;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 6) = 0;
  *((int32x2_t *)this + 9) = vdup_n_s32(0x7FC00000u);
  *((_DWORD *)this + 20) = 2143289344;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  int v6 = (char *)operator new(0x88uLL);
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = 0;
  *(void *)int v6 = off_1003B8400;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 6) = 0u;
  *((_OWORD *)v6 + 7) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((_OWORD *)v6 + 5) = 0u;
  *((void *)v6 + 16) = 0;
  *((void *)v6 + 3) = &off_1003A16C8;
  *(_OWORD *)(v6 + 40) = xmmword_10033F1D0;
  *((_DWORD *)v6 + 20) = 2143289344;
  *((_DWORD *)v6 + 24) = 2143289344;
  *((_DWORD *)v6 + 28) = 2143289344;
  int v7 = (std::__shared_weak_count *)*((void *)this + 2);
  *((void *)this + 1) = v6 + 24;
  *((void *)this + 2) = v6;
  if (v7)
  {
    sub_10000BB9C(v7);
    int v6 = (char *)*((void *)this + 2);
    uint64_t v10 = (char *)*((void *)this + 1);
    double v11 = (std::__shared_weak_count *)v6;
    if (!v6) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v10 = v6 + 24;
    double v11 = (std::__shared_weak_count *)v6;
  }
  atomic_fetch_add_explicit((atomic_ullong *volatile)v6 + 1, 1uLL, memory_order_relaxed);
LABEL_6:
  sub_1002C1170((uint64_t)&v10, &v12);
  long long v8 = v12;
  long long v12 = 0uLL;
  double v9 = (std::__shared_weak_count *)*((void *)this + 12);
  *(_OWORD *)((char *)this + 88) = v8;
  if (v9)
  {
    sub_10000BB9C(v9);
    if (*((void *)&v12 + 1)) {
      sub_10000BB9C(*((std::__shared_weak_count **)&v12 + 1));
    }
  }
  if (v11) {
    sub_10000BB9C(v11);
  }
  (*(void (**)(CLKappaFeaturesAlgGPS *))(*(void *)this + 312))(this);
}

void sub_1002C1138(_Unwind_Exception *a1)
{
  uint64_t v4 = (std::__shared_weak_count *)*((void *)v1 + 14);
  if (v4) {
    sub_10000BB9C(v4);
  }
  uint64_t v5 = (std::__shared_weak_count *)*((void *)v1 + 12);
  if (v5) {
    sub_10000BB9C(v5);
  }
  CLKappaAlgBlock::~CLKappaAlgBlock(v1, v2);
  _Unwind_Resume(a1);
}

void *sub_1002C1170@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  double result = *(void **)a1;
  if (result
  {
    uint64_t v5 = *(void *)(a1 + 8);
    *a2 = result;
    a2[1] = v5;
    if (v5) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
  }
  return result;
}

void CLKappaFeaturesAlgGPS::CLKappaFeaturesAlgGPS(CLKappaFeaturesAlgGPS *this)
{
  *(void *)this = off_100399F60;
  *((void *)this + 15) = off_10039A008;
  *((void *)this + 16) = off_10039A0D0;
  *((void *)this + 17) = off_10039A180;
  CLKappaAlgBlock::CLKappaAlgBlock(this, (uint64_t *)off_1003B7DA8);
  *(void *)uint64_t v2 = off_1003B7888;
  *(void *)(v2 + 120) = off_1003B7B38;
  *(void *)(v2 + 128) = off_1003B7C78;
  *(void *)(v2 + 136) = off_1003B7D58;
  *(void *)(v2 + 32) = 0;
  *(_WORD *)(v2 + 40) = 1;
  *(void *)(v2 + 56) = 0;
  *(void *)(v2 + 64) = 0;
  *(void *)(v2 + 48) = 0;
  *(int32x2_t *)(v2 + 72) = vdup_n_s32(0x7FC00000u);
  *(_DWORD *)(v2 + 80) = 2143289344;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 104) = 0u;
  uint64_t v3 = (char *)operator new(0x88uLL);
  *((void *)v3 + 1) = 0;
  *((void *)v3 + 2) = 0;
  *(void *)uint64_t v3 = off_1003B8400;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_OWORD *)v3 + 6) = 0u;
  *((_OWORD *)v3 + 7) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  *((_OWORD *)v3 + 5) = 0u;
  *((void *)v3 + 16) = 0;
  *((void *)v3 + 3) = &off_1003A16C8;
  *(_OWORD *)(v3 + 40) = xmmword_10033F1D0;
  *((_DWORD *)v3 + 20) = 2143289344;
  *((_DWORD *)v3 + 24) = 2143289344;
  *((_DWORD *)v3 + 28) = 2143289344;
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 2);
  *((void *)this + 1) = v3 + 24;
  *((void *)this + 2) = v3;
  if (v4)
  {
    sub_10000BB9C(v4);
    uint64_t v3 = (char *)*((void *)this + 2);
    int v7 = (char *)*((void *)this + 1);
    long long v8 = (std::__shared_weak_count *)v3;
    if (!v3) {
      goto LABEL_6;
    }
  }
  else
  {
    int v7 = v3 + 24;
    long long v8 = (std::__shared_weak_count *)v3;
  }
  atomic_fetch_add_explicit((atomic_ullong *volatile)v3 + 1, 1uLL, memory_order_relaxed);
LABEL_6:
  sub_1002C1170((uint64_t)&v7, &v9);
  long long v5 = v9;
  long long v9 = 0uLL;
  int v6 = (std::__shared_weak_count *)*((void *)this + 12);
  *(_OWORD *)((char *)this + 88) = v5;
  if (v6)
  {
    sub_10000BB9C(v6);
    if (*((void *)&v9 + 1)) {
      sub_10000BB9C(*((std::__shared_weak_count **)&v9 + 1));
    }
  }
  if (v8) {
    sub_10000BB9C(v8);
  }
  (*(void (**)(CLKappaFeaturesAlgGPS *))(*(void *)this + 312))(this);
}

void sub_1002C1470(_Unwind_Exception *a1)
{
  uint64_t v3 = (std::__shared_weak_count *)*((void *)v1 + 14);
  if (v3) {
    sub_10000BB9C(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)v1 + 12);
  if (v4) {
    sub_10000BB9C(v4);
  }
  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B7DA8);
  _Unwind_Resume(a1);
}

uint64_t CLKappaFeaturesAlgGPS::reset(CLKappaFeaturesAlgGPS *this)
{
  uint64_t result = (*(uint64_t (**)(void))(**((void **)this + 11) + 24))(*((void *)this + 11));
  *((unsigned char *)this + 40) = 1;
  return result;
}

void CLKappaFeaturesAlgGPS::resetConfiguration(CLKappaFeaturesAlgGPS *this)
{
  id v26 = +[CSPersistentConfiguration configBaseKey:"FeaturesAlgGPSConfig" forFeatureMode:*((unsigned __int8 *)this + 24)];
  if (*((unsigned char *)this + 24) == 2)
  {
    float v2 = 6.0;
    int v3 = 1099894125;
    int v4 = 1074728301;
    int v5 = 1050253722;
  }
  else
  {
    int v3 = 1106925439;
    int v4 = 1068214710;
    int v5 = 1038174126;
    float v2 = 1.01;
  }
  int v6 = +[CSPersistentConfiguration sharedConfiguration];
  LODWORD(v7) = 1096193060;
  LODWORD(v8) = 1106925439;
  LODWORD(v9) = v3;
  [v6 algorithmThresholdNumber:0 inArrayForKey:v26 withMinValue:v7 maxValue:v8 defaultValue:v9];
  LODWORD(v27) = v10;

  double v11 = +[CSPersistentConfiguration sharedConfiguration];
  LODWORD(v12) = 1068214710;
  LODWORD(v13) = 1083116909;
  LODWORD(v14) = v4;
  [v11 algorithmThresholdNumber:1 inArrayForKey:v26 withMinValue:v12 maxValue:v13 defaultValue:v14];
  DWORD1(v27) = v15;

  double v16 = +[CSPersistentConfiguration sharedConfiguration];
  LODWORD(v17) = 1036831949;
  LODWORD(v18) = 0.5;
  LODWORD(v19) = v5;
  [v16 algorithmThresholdNumber:2 inArrayForKey:v26 withMinValue:v17 maxValue:v18 defaultValue:v19];
  DWORD2(v27) = v20;

  int v21 = +[CSPersistentConfiguration sharedConfiguration];
  LODWORD(v22) = 1.0;
  LODWORD(v23) = 20.0;
  *(float *)&double v24 = v2;
  [v21 algorithmThresholdNumber:3 inArrayForKey:v26 withMinValue:v22 maxValue:v23 defaultValue:v24];
  HIDWORD(v27) = v25;

  CLKappaFeaturesAlgGPS::setConfig((uint64_t)this, &v27);
}

void sub_1002C16A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

double CLKappaFeaturesAlgGPS::setConfig(uint64_t a1, _OWORD *a2)
{
  *(_OWORD *)(*(void *)(a1 + 88) + 16) = *a2;
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B83D0);
  }
  int v3 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
  {
    double v4 = *(float *)(*(void *)(a1 + 88) + 16);
    int v12 = 134217984;
    double v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[GPS] config-1,%f", (uint8_t *)&v12, 0xCu);
  }
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B83D0);
  }
  int v5 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
  {
    double v6 = *(float *)(*(void *)(a1 + 88) + 20);
    int v12 = 134217984;
    double v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[GPS] config-2,%f", (uint8_t *)&v12, 0xCu);
  }
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B83D0);
  }
  double v7 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
  {
    double v8 = *(float *)(*(void *)(a1 + 88) + 24);
    int v12 = 134217984;
    double v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[GPS] config-3,%f", (uint8_t *)&v12, 0xCu);
  }
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B83D0);
  }
  double v9 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
  {
    double v11 = *(float *)(*(void *)(a1 + 88) + 28);
    int v12 = 134217984;
    double v13 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[GPS] config-4,%f", (uint8_t *)&v12, 0xCu);
  }
  return result;
}

uint64_t CLKappaFeaturesAlgGPS::feedGPS(uint64_t this, const CSSPUGps_Struct *a2)
{
  uint64_t v2 = *(void *)(this + 88);
  unint64_t timestamp = a2->timestamp;
  float speedMS = a2->speedMS;
  float v6 = *(float *)(v2 + 16);
  float v5 = *(float *)(v2 + 20);
  BOOL v7 = a2->speedMS < v6 && a2->speedMS >= v5;
  int v8 = *(unsigned __int8 *)(this + 40);
  if (v8 == 1)
  {
    *(unsigned char *)(this + 41) = 0;
    if (speedMS < v6)
    {
      unint64_t v9 = *(void *)(this + 32);
      *(void *)(this + 48) = v9;
      *(_DWORD *)(this + 72) = 2143289344;
LABEL_12:
      LOBYTE(v8) = 1;
      goto LABEL_17;
    }
    LOBYTE(v8) = 2;
    *(unsigned char *)(this + 40) = 2;
    *(void *)(this + 48) = timestamp;
    *(float *)(this + 72) = speedMS;
LABEL_16:
    unint64_t v9 = timestamp;
    goto LABEL_17;
  }
  if (v8 != 2)
  {
    unint64_t v9 = *(void *)(this + 48);
    goto LABEL_17;
  }
  if (speedMS >= v6)
  {
    *(void *)(this + 48) = timestamp;
    *(float *)(this + 72) = speedMS;
    LOBYTE(v8) = 2;
    goto LABEL_16;
  }
  unint64_t v9 = *(void *)(this + 48);
  unint64_t v10 = v9 + (unint64_t)((float)(*(float *)(v2 + 24) + *(float *)(v2 + 28)) * 1000000.0);
  if (v7 && timestamp <= v10)
  {
    LOBYTE(v8) = 2;
    goto LABEL_17;
  }
  if ((((speedMS >= v5) ^ v7) & 1) == 0 && timestamp > v10)
  {
    LOBYTE(v8) = 1;
    *(unsigned char *)(this + 40) = 1;
    unint64_t v9 = *(void *)(this + 32);
    *(void *)(this + 48) = v9;
    *(_DWORD *)(this + 72) = 2143289344;
    goto LABEL_17;
  }
  LOBYTE(v8) = 2;
  if (speedMS < v5 && timestamp <= v10)
  {
    *(_WORD *)(this + 40) = 257;
    int v14 = *(_DWORD *)(this + 72);
    *(void *)(this + 56) = v9;
    *(void *)(this + 64) = timestamp;
    *(_DWORD *)(this + 76) = v14;
    *(float *)(this + 80) = speedMS;
    goto LABEL_12;
  }
LABEL_17:
  int v11 = *(_DWORD *)(this + 76);
  *(_DWORD *)(v2 + 56) = *(_DWORD *)(this + 72);
  *(void *)(v2 + 32) = timestamp;
  char v12 = *(unsigned char *)(this + 41);
  *(unsigned char *)(v2 + 40) |= v12;
  *(unsigned char *)(v2 + 41) = v8;
  *(void *)(v2 + 48) = v9;
  uint64_t v13 = *(void *)(this + 64);
  *(void *)(v2 + 64) = *(void *)(this + 56);
  *(_DWORD *)(v2 + 72) = v11;
  *(void *)(v2 + 80) = v13;
  *(_DWORD *)(v2 + 88) = *(_DWORD *)(this + 80);
  *(void *)(v2 + 96) = timestamp;
  *(float *)(v2 + 104) = speedMS;
  *(unsigned char *)(v2 + 108) = v12;
  return this;
}

uint64_t virtual thunk to'CLKappaFeaturesAlgGPS::feedGPS(CLKappaFeaturesAlgGPS *this, const CSSPUGps_Struct *a2)
{
  return CLKappaFeaturesAlgGPS::feedGPS((uint64_t)this + *(void *)(*(void *)this - 96), a2);
}

uint64_t CLKappaFeaturesAlgGPS::epochFinalize(uint64_t this, uint64_t a2)
{
  *(void *)(*(void *)(this + 88) + 32) = a2;
  return this;
}

void *virtual thunk to'CLKappaFeaturesAlgGPS::epochFinalize(void *this, uint64_t a2)
{
  *(void *)(*(void *)((char *)this + *(void *)(*this - 48) + 88) + 32) = a2;
  return this;
}

uint64_t CLKappaFeaturesAlgGPS::epochReset(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 88);
  *(void *)(v1 + 32) = 0;
  *(_WORD *)(v1 + 40) = 0;
  *(void *)(v1 + 48) = 0;
  *(_DWORD *)(v1 + 56) = 2143289344;
  *(void *)(v1 + 64) = 0;
  *(_DWORD *)(v1 + 72) = 2143289344;
  *(void *)(v1 + 80) = 0;
  *(_DWORD *)(v1 + 88) = 2143289344;
  uint64_t v2 = *(void *)(this + 88);
  *(void *)(v2 + 96) = 0;
  *(_DWORD *)(v2 + 104) = 0;
  *(unsigned char *)(v2 + 108) = 0;
  return this;
}

void *virtual thunk to'CLKappaFeaturesAlgGPS::epochReset(void *this)
{
  uint64_t v1 = (char *)this + *(void *)(*this - 56);
  uint64_t v2 = *((void *)v1 + 11);
  *(void *)(v2 + 32) = 0;
  *(_WORD *)(v2 + 40) = 0;
  *(void *)(v2 + 48) = 0;
  *(_DWORD *)(v2 + 56) = 2143289344;
  *(void *)(v2 + 64) = 0;
  *(_DWORD *)(v2 + 72) = 2143289344;
  *(void *)(v2 + 80) = 0;
  *(_DWORD *)(v2 + 88) = 2143289344;
  uint64_t v3 = *((void *)v1 + 11);
  *(void *)(v3 + 96) = 0;
  *(_DWORD *)(v3 + 104) = 0;
  *(unsigned char *)(v3 + 108) = 0;
  return this;
}

void sub_1002C1B6C(CLKappaAlgBlock *this)
{
  *(void *)this = off_1003B7888;
  *((void *)this + 15) = off_1003B7B38;
  *((void *)this + 16) = off_1003B7C78;
  *(void *)((char *)this + *(void *)(*(void *)this - 176)) = off_1003B7D58;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 14);
  if (v2) {
    sub_10000BB9C(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 12);
  if (v3) {
    sub_10000BB9C(v3);
  }

  CLKappaAlgBlock::~CLKappaAlgBlock(this, (uint64_t *)off_1003B7DA8);
}

void sub_1002C1C68(CLKappaAlgBlock *this)
{
  *(void *)this = off_1003B7888;
  *((void *)this + 15) = off_1003B7B38;
  *((void *)this + 16) = off_1003B7C78;
  *((void *)this + 17) = off_1003B7D58;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 14);
  if (v2) {
    sub_10000BB9C(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 12);
  if (v3) {
    sub_10000BB9C(v3);
  }
  CLKappaAlgBlock::~CLKappaAlgBlock(this, (uint64_t *)off_1003B7DA8);

  operator delete();
}

void sub_1002C1D50(void *a1)
{
  uint64_t v1 = (CLKappaAlgBlock *)((char *)a1 + *(void *)(*a1 - 24));
  *(void *)uint64_t v1 = off_1003B7888;
  *((void *)v1 + 15) = off_1003B7B38;
  *((void *)v1 + 16) = off_1003B7C78;
  *((void *)v1 + 17) = off_1003B7D58;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)v1 + 14);
  if (v2) {
    sub_10000BB9C(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)v1 + 12);
  if (v3) {
    sub_10000BB9C(v3);
  }

  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B7DA8);
}

void sub_1002C1E34(void *a1)
{
  uint64_t v1 = (CLKappaAlgBlock *)((char *)a1 + *(void *)(*a1 - 24));
  *(void *)uint64_t v1 = off_1003B7888;
  *((void *)v1 + 15) = off_1003B7B38;
  *((void *)v1 + 16) = off_1003B7C78;
  *((void *)v1 + 17) = off_1003B7D58;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)v1 + 14);
  if (v2) {
    sub_10000BB9C(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)v1 + 12);
  if (v3) {
    sub_10000BB9C(v3);
  }
  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B7DA8);

  operator delete();
}

void sub_1002C1F2C(void *a1)
{
  uint64_t v1 = (CLKappaAlgBlock *)((char *)a1 + *(void *)(*a1 - 24));
  *(void *)uint64_t v1 = off_1003B7888;
  *((void *)v1 + 15) = off_1003B7B38;
  *((void *)v1 + 16) = off_1003B7C78;
  *((void *)v1 + 17) = off_1003B7D58;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)v1 + 14);
  if (v2) {
    sub_10000BB9C(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)v1 + 12);
  if (v3) {
    sub_10000BB9C(v3);
  }

  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B7DA8);
}

void sub_1002C2010(void *a1)
{
  uint64_t v1 = (CLKappaAlgBlock *)((char *)a1 + *(void *)(*a1 - 24));
  *(void *)uint64_t v1 = off_1003B7888;
  *((void *)v1 + 15) = off_1003B7B38;
  *((void *)v1 + 16) = off_1003B7C78;
  *((void *)v1 + 17) = off_1003B7D58;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)v1 + 14);
  if (v2) {
    sub_10000BB9C(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)v1 + 12);
  if (v3) {
    sub_10000BB9C(v3);
  }
  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B7DA8);

  operator delete();
}

void sub_1002C2108(void *a1)
{
  uint64_t v1 = (CLKappaAlgBlock *)((char *)a1 + *(void *)(*a1 - 24));
  *(void *)uint64_t v1 = off_1003B7888;
  *((void *)v1 + 15) = off_1003B7B38;
  *((void *)v1 + 16) = off_1003B7C78;
  *((void *)v1 + 17) = off_1003B7D58;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)v1 + 14);
  if (v2) {
    sub_10000BB9C(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)v1 + 12);
  if (v3) {
    sub_10000BB9C(v3);
  }

  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B7DA8);
}

void sub_1002C21EC(void *a1)
{
  uint64_t v1 = (CLKappaAlgBlock *)((char *)a1 + *(void *)(*a1 - 24));
  *(void *)uint64_t v1 = off_1003B7888;
  *((void *)v1 + 15) = off_1003B7B38;
  *((void *)v1 + 16) = off_1003B7C78;
  *((void *)v1 + 17) = off_1003B7D58;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)v1 + 14);
  if (v2) {
    sub_10000BB9C(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)v1 + 12);
  if (v3) {
    sub_10000BB9C(v3);
  }
  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B7DA8);

  operator delete();
}

void sub_1002C22E4(id a1)
{
  qword_1003DB6A8 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "Alg");

  _objc_release_x1();
}

void sub_1002C2328(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_1003B8400;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1002C2348(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_1003B8400;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_1002C239C(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void CLSafetyDeescalatorJointDetection::CLSafetyDeescalatorJointDetection(CLSafetyDeescalatorJointDetection *this)
{
  *(void *)this = off_10039C308;
  *((unsigned char *)this + 8) = 0;
  *((unsigned char *)this + 16) = 0;
  *((void *)this + 3) = 0;
  *((unsigned char *)this + 32) = 1;
  *((_DWORD *)this + 9) = 0;
  *((unsigned char *)this + 40) = 0;
  uint64_t v2 = (char *)sub_100007BC0((void *)this + 6, "none");
  *(void *)this = &off_1003B8450;
  *((unsigned char *)this + 72) = 0;
  *((unsigned char *)this + 80) = 0;
  *((unsigned char *)this + 88) = 0;
  *((unsigned char *)this + 136) = 0;
  *((unsigned char *)this + 144) = 0;
  *((unsigned char *)this + 160) = 0;
  *((unsigned char *)this + 168) = 0;
  *((unsigned char *)this + 172) = 0;
  if (*((char *)this + 71) < 0)
  {
    *((void *)this + 7) = 5;
    uint64_t v2 = (char *)*((void *)this + 6);
  }
  else
  {
    *((unsigned char *)this + 71) = 5;
  }
  strcpy(v2, "de-JD");
  *((unsigned char *)this + 84) = 1;
}

uint64_t CLSafetyDeescalatorJointDetection::assertReady(CLSafetyDeescalatorJointDetection *this, uint64_t a2, const char *a3)
{
  CLKappaDeescalator::raiseUnless(*((unsigned __int8 *)this + 160), (BOOL)"[de-JD] has not received local JD output", a3);
  CLKappaDeescalator::raiseUnless(1, (BOOL)"[de-JD] internal enum has been changed", v4);
  uint64_t v6 = *((unsigned __int8 *)this + 80);

  return CLKappaDeescalator::raiseUnless(v6, (BOOL)"[de-JD] missing config", v5);
}

uint64_t CLSafetyDeescalatorJointDetection::setConfig(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  if (!*(unsigned char *)(result + 80)) {
    *(unsigned char *)(result + 80) = 1;
  }
  *(void *)(result + 72) = v2;
  return result;
}

void CLSafetyDeescalatorJointDetection::resetConfiguration(CLSafetyDeescalatorJointDetection *this)
{
  id v5 = +[CSPersistentConfiguration configBaseKey:"DeescalatorJDConfig" forFeatureMode:*((unsigned __int8 *)this + 32)];
  uint64_t v2 = +[CSPersistentConfiguration sharedConfiguration];
  unsigned int v3 = [v2 BOOLThreshold:&CLSafetyDeescalatorJointDetection::kConfigurationDefaults forKey:v5];
  [v2 floatThreshold:&unk_10033F284 forKey:v5];
  if (!*((unsigned char *)this + 80)) {
    *((unsigned char *)this + 80) = 1;
  }
  *((_DWORD *)this + 18) = v3;
  *((_DWORD *)this + 19) = v4;
  *((unsigned char *)this + 40) = CLKappaDeescalator::shouldForceNoop(this, "ForceJointDetection");
  *((_DWORD *)this + 9) = CLKappaDeescalator::shouldForceDeescalate(this, "ForceJointDetection");
}

void sub_1002C2604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void CLSafetyDeescalatorJointDetection::log(CLSafetyDeescalatorJointDetection *this, uint64_t a2)
{
  if (*((unsigned char *)this + 160)) {
    uint64_t v4 = *((void *)this + 19);
  }
  else {
    uint64_t v4 = 0;
  }
  if (*((unsigned char *)this + 136))
  {
    uint64_t v6 = *((void *)this + 14);
    uint64_t v5 = *((void *)this + 15);
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  if (*((unsigned char *)this + 172)) {
    double v7 = *((float *)this + 42);
  }
  else {
    double v7 = 0.0;
  }
  if (!*((unsigned char *)this + 80)) {
    sub_100007D1C();
  }
  int v8 = *((unsigned __int8 *)this + 84);
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
  }
  unint64_t v9 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *((_DWORD *)this + 6);
    int v11 = *((unsigned __int8 *)this + 32);
    int v12 = *((unsigned __int8 *)this + 72);
    double v13 = *((float *)this + 19);
    int v14 = 134351360;
    uint64_t v15 = a2;
    __int16 v16 = 1026;
    int v17 = v10;
    __int16 v18 = 1026;
    int v19 = v11;
    __int16 v20 = 1026;
    int v21 = v12;
    __int16 v22 = 2050;
    double v23 = v13;
    __int16 v24 = 2050;
    uint64_t v25 = v4;
    __int16 v26 = 2050;
    uint64_t v27 = v5;
    __int16 v28 = 2050;
    uint64_t v29 = v6;
    __int16 v30 = 1026;
    int v31 = v8;
    __int16 v32 = 2050;
    double v33 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[de-JD] summary,A,%{public}llu,B,%{public}u,mode,%{public}u,config-1,%{public}u,config-1,%{public}f,debug-1a,%{public}llu,debug-1b,%{public}llu,debug-1c,%{public}llu,debug-1d,%{public}u,debug-1e,%{public}f", (uint8_t *)&v14, 0x56u);
  }
}

id sub_1002C27C8()
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
  }
  v0 = (void *)qword_1003DB6A8;

  return v0;
}

void CLSafetyDeescalatorJointDetection::updateWithRemoteSample(CLSafetyDeescalatorJointDetection *this, const CSRemoteSample_Struct *a2)
{
  unint64_t v4 = a2->receivedAtTimestamp - a2->createdAtTimestamp;
  unint64_t lastRealTriggerTimestamp = a2->lastRealTriggerTimestamp;
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
  }
  unint64_t v6 = v4 + lastRealTriggerTimestamp;
  double v7 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v9 = a2->lastRealTriggerTimestamp;
    if (v9) {
      unint64_t v10 = v6;
    }
    else {
      unint64_t v10 = 0;
    }
    int v41 = 134218240;
    *(void *)double v42 = v9;
    *(_WORD *)&v42[8] = 2048;
    unint64_t v43 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[de-JD] received remote sample: [remote=%llu local=%llu]", (uint8_t *)&v41, 0x16u);
  }
  if (*((unsigned char *)this + 84) == 2)
  {
    if (qword_1003DB6A0 != -1) {
      dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
    }
    int v11 = qword_1003DB6A8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v41) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[de-JD] already latched to sure-real", (uint8_t *)&v41, 2u);
    }
    return;
  }
  if (*((unsigned __int8 *)this + 32) != a2->mode)
  {
    if (qword_1003DB6A0 != -1) {
      dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
    }
    int v17 = qword_1003DB6A8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
    {
      int v18 = *((unsigned __int8 *)this + 32);
      int mode = a2->mode;
      int v41 = 67109376;
      *(_DWORD *)double v42 = v18;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = mode;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[de-JD] got sample for other mode me=%u other=%u: UNSURE", (uint8_t *)&v41, 0xEu);
    }
    *((unsigned char *)this + 84) = 1;
    return;
  }
  CLKappaDeescalator::raiseUnless(1, (BOOL)"[de-JD] Precondition not met: different modes", v8);
  if (*((unsigned char *)this + 84) != 3)
  {
    *((unsigned char *)this + 84) = 1;
    CLKappaDeescalator::raiseUnless(1, (BOOL)"[de-JD] Precondition not met: not unsure", v12);
    unint64_t v20 = CLSafetyDeescalatorJointDetection::sameEventRegionBoundary(this);
    if (v21)
    {
      unint64_t v22 = v20;
      if (a2->receivedAtTimestamp < v20)
      {
        if (qword_1003DB6A0 != -1) {
          dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
        }
        double v23 = qword_1003DB6A8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v41) = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "[de-JD] RS was inside 'same event region'", (uint8_t *)&v41, 2u);
        }
        int v25 = *((unsigned __int8 *)this + 136);
        long long v27 = *(_OWORD *)&a2->createdAtTimestamp;
        long long v26 = *(_OWORD *)&a2->lastRealTriggerTimestamp;
        *(_OWORD *)((char *)this + 88) = *(_OWORD *)&a2->mode;
        *(_OWORD *)((char *)this + 104) = v27;
        *(_OWORD *)((char *)this + 120) = v26;
        if (!v25) {
          *((unsigned char *)this + 136) = 1;
        }
        __int16 v28 = this;
        int v29 = 0;
LABEL_54:
        CLSafetyDeescalatorJointDetection::verifySameEvent(v28, v29, v24);
        return;
      }
      if (qword_1003DB6A0 != -1) {
        dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
      }
      int v31 = qword_1003DB6A8;
      if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v41) = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "[de-JD] RS was outside 'same event region'", (uint8_t *)&v41, 2u);
      }
      if (!a2->lastRealTriggerTimestamp)
      {
        double v34 = sub_1002C27C8();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v41) = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "[de-JD] RS did not have a trigger: no blind spot", (uint8_t *)&v41, 2u);
        }

        goto LABEL_51;
      }
      __int16 v32 = sub_1002C27C8();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG);
      if (v6 < v22)
      {
        if (v33)
        {
          LOWORD(v41) = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "[de-JD] RS had a trigger but no blind spot", (uint8_t *)&v41, 2u);
        }

LABEL_51:
        int v35 = *((unsigned __int8 *)this + 136);
        long long v37 = *(_OWORD *)&a2->createdAtTimestamp;
        long long v36 = *(_OWORD *)&a2->lastRealTriggerTimestamp;
        *(_OWORD *)((char *)this + 88) = *(_OWORD *)&a2->mode;
        *(_OWORD *)((char *)this + 104) = v37;
        *(_OWORD *)((char *)this + 120) = v36;
        if (!v35) {
          *((unsigned char *)this + 136) = 1;
        }
        __int16 v28 = this;
        int v29 = 1;
        goto LABEL_54;
      }
      if (v33)
      {
        LOWORD(v41) = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "[de-JD] RS had a trigger that could have a blind spot: UNSURE", (uint8_t *)&v41, 2u);
      }
    }
    else
    {
      if (qword_1003DB6A0 != -1) {
        dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
      }
      __int16 v30 = qword_1003DB6A8;
      if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v41) = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "[de-JD] 'same event region' is undefined: UNSURE", (uint8_t *)&v41, 2u);
      }
    }
    *((unsigned char *)this + 84) = 1;
    int v38 = *((unsigned __int8 *)this + 136);
    long long v40 = *(_OWORD *)&a2->createdAtTimestamp;
    long long v39 = *(_OWORD *)&a2->lastRealTriggerTimestamp;
    *(_OWORD *)((char *)this + 88) = *(_OWORD *)&a2->mode;
    *(_OWORD *)((char *)this + 104) = v40;
    *(_OWORD *)((char *)this + 120) = v39;
    if (v38) {
      return;
    }
    goto LABEL_59;
  }
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
  }
  double v13 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v41) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[de-JD] new remote sample does not change our SURE-NONE state", (uint8_t *)&v41, 2u);
  }
  int v14 = *((unsigned __int8 *)this + 136);
  long long v16 = *(_OWORD *)&a2->createdAtTimestamp;
  long long v15 = *(_OWORD *)&a2->lastRealTriggerTimestamp;
  *(_OWORD *)((char *)this + 88) = *(_OWORD *)&a2->mode;
  *(_OWORD *)((char *)this + 104) = v16;
  *(_OWORD *)((char *)this + 120) = v15;
  if (!v14) {
LABEL_59:
  }
    *((unsigned char *)this + 136) = 1;
}

unint64_t CLSafetyDeescalatorJointDetection::sameEventRegionBoundary(CLSafetyDeescalatorJointDetection *this)
{
  if (!*((unsigned char *)this + 160))
  {
    uint64_t v1 = 0;
    goto LABEL_6;
  }
  uint64_t v1 = *((void *)this + 19);
  if (!v1)
  {
LABEL_6:
    unint64_t v2 = 0;
    return v2 | v1;
  }
  if (!*((unsigned char *)this + 80)) {
    sub_100007D1C();
  }
  v1 += (unint64_t)(float)(*((float *)this + 19) * 1000000.0);
  unint64_t v2 = v1 & 0xFFFFFFFFFFFFFF00;
  uint64_t v1 = v1;
  return v2 | v1;
}

void CLSafetyDeescalatorJointDetection::verifySameEvent(CLSafetyDeescalatorJointDetection *this, int a2, const char *a3)
{
  CLKappaDeescalator::raiseUnless(*((unsigned __int8 *)this + 84) == 1, (BOOL)"[de-JD] precondition failed: verify same event but not unsure", a3);
  if (!*((unsigned char *)this + 160))
  {
    if (!a2)
    {
      if (qword_1003DB6A0 != -1) {
        dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
      }
      uint64_t v13 = qword_1003DB6A8;
      if (!os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG)) {
        return;
      }
      LOWORD(v23) = 0;
      int v14 = "[de-JD] verifying same event: no JD feature (hold, UNSURE)";
      goto LABEL_60;
    }
    if (qword_1003DB6A0 != -1) {
      dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
    }
    uint64_t v11 = qword_1003DB6A8;
    if (!os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_45;
    }
    LOWORD(v23) = 0;
    int v12 = "[de-JD] verifying same event: no JD feature (SURE-NONE)";
LABEL_43:
    int v17 = v11;
    uint32_t v18 = 2;
    goto LABEL_44;
  }
  uint64_t v5 = *((void *)this + 19);
  if (!v5)
  {
    if (!a2)
    {
      if (qword_1003DB6A0 != -1) {
        dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
      }
      uint64_t v13 = qword_1003DB6A8;
      if (!os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG)) {
        return;
      }
      LOWORD(v23) = 0;
      int v14 = "[de-JD] verifying same event: no local real trigger (hold, UNSURE)";
      goto LABEL_60;
    }
    if (qword_1003DB6A0 != -1) {
      dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
    }
    uint64_t v11 = qword_1003DB6A8;
    if (!os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_45;
    }
    LOWORD(v23) = 0;
    int v12 = "[de-JD] verifying same event: no local real trigger (SURE-NONE)";
    goto LABEL_43;
  }
  if (!*((unsigned char *)this + 136))
  {
    if (a2)
    {
      if (qword_1003DB6A0 != -1) {
        dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
      }
      long long v15 = qword_1003DB6A8;
      if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[de-JD] verifying same event: no communication (UNSURE)", (uint8_t *)&v23, 2u);
      }
      char v16 = 1;
      goto LABEL_46;
    }
    if (qword_1003DB6A0 != -1) {
      dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
    }
    uint64_t v13 = qword_1003DB6A8;
    if (!os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG)) {
      return;
    }
    LOWORD(v23) = 0;
    int v14 = "[de-JD] verifying same event: no communication (hold, UNSURE)";
    goto LABEL_60;
  }
  uint64_t v6 = *((void *)this + 15);
  if (!v6)
  {
    if (a2)
    {
      if (qword_1003DB6A0 != -1) {
        dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
      }
      uint64_t v11 = qword_1003DB6A8;
      if (!os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_45;
      }
      LOWORD(v23) = 0;
      int v12 = "[de-JD] verifying same event: no remote real trigger (SURE-NONE)";
      goto LABEL_43;
    }
    if (qword_1003DB6A0 != -1) {
      dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
    }
    uint64_t v13 = qword_1003DB6A8;
    if (!os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG)) {
      return;
    }
    LOWORD(v23) = 0;
    int v14 = "[de-JD] verifying same event: no remote real trigger (hold)";
LABEL_60:
    unint64_t v20 = v13;
    uint32_t v21 = 2;
LABEL_61:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v23, v21);
    return;
  }
  uint64_t v7 = v5 + *((void *)this + 13) - (v6 + *((void *)this + 14));
  if (v7 < 0) {
    uint64_t v7 = -v7;
  }
  if (!*((unsigned char *)this + 80)) {
    sub_100007D1C();
  }
  float v8 = (float)v7 / 1000000.0;
  float v9 = *((float *)this + 19);
  *((float *)this + 42) = v8;
  *((unsigned char *)this + 172) = 1;
  if (v8 < v9)
  {
    if (qword_1003DB6A0 != -1) {
      dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
    }
    unint64_t v10 = qword_1003DB6A8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 134218240;
      double v24 = v8;
      __int16 v25 = 2048;
      double v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[de-JD] verifying same event: SURE-REAL (%f < %f)", (uint8_t *)&v23, 0x16u);
    }
    *((unsigned char *)this + 84) = 2;
    return;
  }
  if (a2)
  {
    if (qword_1003DB6A0 != -1) {
      dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
    }
    uint64_t v19 = qword_1003DB6A8;
    if (!os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_45;
    }
    int v23 = 134218240;
    double v24 = v8;
    __int16 v25 = 2048;
    double v26 = v9;
    int v12 = "[de-JD] verifying same event: SURE-NONE (%f >= %f)";
    int v17 = v19;
    uint32_t v18 = 22;
LABEL_44:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v23, v18);
LABEL_45:
    char v16 = 3;
LABEL_46:
    *((unsigned char *)this + 84) = v16;
    return;
  }
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
  }
  uint64_t v22 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 134218240;
    double v24 = v8;
    __int16 v25 = 2048;
    double v26 = v9;
    int v14 = "[de-JD] verifying same event: (hold, UNSURE) (%f >= %f)";
    unint64_t v20 = v22;
    uint32_t v21 = 22;
    goto LABEL_61;
  }
}

void CLSafetyDeescalatorJointDetection::updateWithJointDetectionOutput(uint64_t a1, uint64_t a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
  }
  unint64_t v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a2 + 8);
    int v12 = 134217984;
    uint64_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[de-JD] received local lastRealTriggerTimestamp: %llu", (uint8_t *)&v12, 0xCu);
  }
  if (*(unsigned char *)(a1 + 84) != 2)
  {
    float v9 = (_OWORD *)(a1 + 144);
    if (*(unsigned char *)(a1 + 160))
    {
      if (*(void *)(a2 + 8) == *(void *)(a1 + 152))
      {
        if (qword_1003DB6A0 != -1) {
          dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
        }
        unint64_t v10 = qword_1003DB6A8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v12) = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[de-JD]: lack of new local trigger does not change our mind", (uint8_t *)&v12, 2u);
        }
        int v11 = *(unsigned __int8 *)(a1 + 160);
        _OWORD *v9 = *(_OWORD *)a2;
        if (!v11) {
          goto LABEL_19;
        }
        return;
      }
      *(unsigned char *)(a1 + 84) = 1;
      _OWORD *v9 = *(_OWORD *)a2;
    }
    else
    {
      *(unsigned char *)(a1 + 84) = 1;
      _OWORD *v9 = *(_OWORD *)a2;
      *(unsigned char *)(a1 + 160) = 1;
    }
    CLSafetyDeescalatorJointDetection::verifySameEvent((CLSafetyDeescalatorJointDetection *)a1, 0, v5);
    return;
  }
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
  }
  uint64_t v7 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[de-JD] already latched to sure-real", (uint8_t *)&v12, 2u);
  }
  int v8 = *(unsigned __int8 *)(a1 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)a2;
  if (!v8) {
LABEL_19:
  }
    *(unsigned char *)(a1 + 160) = 1;
}

uint64_t CLSafetyDeescalatorJointDetection::onEvaluateAtMinHoldDuration(CLSafetyDeescalatorJointDetection *this)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
  }
  unint64_t v2 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "[de-JD] evaluating at min hold duration", buf, 2u);
  }
  if (!*((unsigned char *)this + 80)) {
    sub_100007D1C();
  }
  if (!*((unsigned char *)this + 72))
  {
    if (qword_1003DB6A0 != -1) {
      dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
    }
    uint64_t v7 = qword_1003DB6A8;
    if (!os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG)) {
      return 6;
    }
    __int16 v16 = 0;
    int v8 = "[de-JD] disabled";
    float v9 = (uint8_t *)&v16;
LABEL_33:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, v8, v9, 2u);
    return 6;
  }
  int v3 = *((unsigned __int8 *)this + 84);
  if (v3 != 3)
  {
    if (v3 == 2)
    {
      if (qword_1003DB6A0 != -1) {
        dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
      }
      unint64_t v4 = qword_1003DB6A8;
      if (!os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG)) {
        return 1;
      }
      *(_WORD *)uint64_t v13 = 0;
      uint64_t v5 = "[de-JD] final - no-decision: SURE-REAL";
      uint64_t v6 = v13;
      goto LABEL_27;
    }
    if (v3 == 1)
    {
      if (qword_1003DB6A0 != -1) {
        dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
      }
      unint64_t v4 = qword_1003DB6A8;
      if (!os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG)) {
        return 1;
      }
      __int16 v15 = 0;
      uint64_t v5 = "[de-JD] final - no-decision: UNSURE";
      uint64_t v6 = (uint8_t *)&v15;
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, v5, v6, 2u);
      return 1;
    }
    if (qword_1003DB6A0 != -1) {
      dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
    }
    uint64_t v7 = qword_1003DB6A8;
    if (!os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG)) {
      return 6;
    }
    __int16 v12 = 0;
    int v8 = "[de-JD] final - no-decision";
    float v9 = (uint8_t *)&v12;
    goto LABEL_33;
  }
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B84D0);
  }
  unint64_t v10 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[de-JD] final - de-escalate: SURE-NONE", v14, 2u);
  }
  return 4;
}

void sub_1002C3824(void **a1)
{
  CLKappaDeescalator::~CLKappaDeescalator(a1);

  operator delete();
}

void sub_1002C385C(id a1)
{
  qword_1003DB6A8 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "Alg");

  _objc_release_x1();
}

double CLMartyEstimatesAlgUncoupledCrashResult::reset(CLMartyEstimatesAlgUncoupledCrashResult *this)
{
  *((unsigned char *)this + 8) = 0;
  *((_DWORD *)this + 3) = 0;
  *((_WORD *)this + 28) = 0;
  *((unsigned char *)this + 58) = 0;
  *((void *)this + 8) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *((_DWORD *)this + 38) = 0;
  return result;
}

double CLMartyEstimatesAlgUncoupledCrashResult::log(CLMartyEstimatesAlgUncoupledCrashResult *this)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B90E8);
  }
  unint64_t v2 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *((void *)this + 8);
    int v5 = *((unsigned __int8 *)this + 56);
    int v6 = *((unsigned __int8 *)this + 58);
    double v7 = *((float *)this + 18);
    double v8 = *((float *)this + 19);
    double v9 = *((float *)this + 20);
    double v10 = *((float *)this + 21);
    double v11 = *((float *)this + 22);
    double v12 = *((float *)this + 23);
    double v13 = *((float *)this + 24);
    double v14 = *((float *)this + 25);
    double v15 = *((float *)this + 26);
    double v16 = *((float *)this + 27);
    double v17 = *((float *)this + 28);
    double v18 = *((float *)this + 29);
    double v19 = *((float *)this + 30);
    double v20 = *((float *)this + 31);
    double v21 = *((float *)this + 32);
    double v22 = *((float *)this + 33);
    double v23 = *((float *)this + 34);
    double v24 = *((float *)this + 35);
    double v25 = *((float *)this + 36);
    double v26 = *((float *)this + 37);
    double v27 = *((float *)this + 38);
    int v28 = 134354944;
    uint64_t v29 = v4;
    __int16 v30 = 1026;
    int v31 = v5;
    __int16 v32 = 1026;
    int v33 = v6;
    __int16 v34 = 2050;
    double v35 = v7;
    __int16 v36 = 2050;
    double v37 = v8;
    __int16 v38 = 2050;
    double v39 = v9;
    __int16 v40 = 2050;
    double v41 = v10;
    __int16 v42 = 2050;
    double v43 = v11;
    __int16 v44 = 2050;
    double v45 = v12;
    __int16 v46 = 2050;
    double v47 = v13;
    __int16 v48 = 2050;
    double v49 = v14;
    __int16 v50 = 2050;
    double v51 = v15;
    __int16 v52 = 2050;
    double v53 = v16;
    __int16 v54 = 2050;
    double v55 = v17;
    __int16 v56 = 2050;
    double v57 = v18;
    __int16 v58 = 2050;
    double v59 = v19;
    __int16 v60 = 2050;
    double v61 = v20;
    __int16 v62 = 2050;
    double v63 = v21;
    __int16 v64 = 2050;
    double v65 = v22;
    __int16 v66 = 2050;
    double v67 = v23;
    __int16 v68 = 2050;
    double v69 = v24;
    __int16 v70 = 2050;
    double v71 = v25;
    __int16 v72 = 2050;
    double v73 = v26;
    __int16 v74 = 2050;
    double v75 = v27;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[M][UC] AlgBlock summary,A,%{public}llu,B,%{public}d,C,%{public}d,debug-1,%{public}f,debug-2,%{public}f,debug-3,%{public}f,debug-4,%{public}f,debug-5,%{public}f,debug-6,%{public}f,debug-7,%{public}f,debug-8,%{public}f,debug-9,%{public}f,debug-10,%{public}f,debug-11,%{public}f,debug-12,%{public}f,debug-13,%{public}f,debug-14,%{public}f,debug-15,%{public}f,debug-16,%{public}f,debug-17,%{public}f,debug-18,%{public}f,debug-19,%{public}f,debug-20,%{public}f,debug-21,%{public}f", (uint8_t *)&v28, 0xEAu);
  }
  return result;
}

void CLMartyEstimatesAlgUncoupledCrash::CLMartyEstimatesAlgUncoupledCrash(CLMartyEstimatesAlgUncoupledCrash *this, uint64_t *a2)
{
  CLKappaAlgBlock::CLKappaAlgBlock(this, a2 + 1);
  uint64_t v4 = *a2;
  uint64_t *v5 = *a2;
  *(void *)((char *)this + *(void *)(v4 - 152)) = a2[6];
  *(void *)((char *)this + *(void *)(*(void *)this - 160)) = a2[7];
  *(void *)((char *)this + *(void *)(*(void *)this - 168)) = a2[8];
  *(void *)((char *)this + *(void *)(*(void *)this - 176)) = a2[9];
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *(void *)&long long v6 = 0x80000000800000;
  *((void *)&v6 + 1) = 0x80000000800000;
  *((_OWORD *)this + 3) = v6;
  *((_OWORD *)this + 4) = xmmword_10033F2F0;
  *((_OWORD *)this + 5) = xmmword_10033F300;
  *((_OWORD *)this + 6) = v6;
  sub_1002C4EA8(&v14);
  double v7 = (std::__shared_weak_count *)*((void *)&v14 + 1);
  unint64_t v8 = v14;
  long long v14 = 0uLL;
  double v9 = (std::__shared_weak_count *)*((void *)this + 2);
  *(_OWORD *)((char *)this + 8) = __PAIR128__((unint64_t)v7, v8);
  if (v9)
  {
    sub_10000BB9C(v9);
    if (*((void *)&v14 + 1)) {
      sub_10000BB9C(*((std::__shared_weak_count **)&v14 + 1));
    }
    double v7 = (std::__shared_weak_count *)*((void *)this + 2);
  }
  uint64_t v12 = *((void *)this + 1);
  double v13 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_1002C3DA8((uint64_t)&v12, &v14);
  long long v10 = v14;
  long long v14 = 0uLL;
  double v11 = (std::__shared_weak_count *)*((void *)this + 5);
  *((_OWORD *)this + 2) = v10;
  if (v11)
  {
    sub_10000BB9C(v11);
    if (*((void *)&v14 + 1)) {
      sub_10000BB9C(*((std::__shared_weak_count **)&v14 + 1));
    }
  }
  if (v13) {
    sub_10000BB9C(v13);
  }
  (*(void (**)(CLMartyEstimatesAlgUncoupledCrash *))(*(void *)this + 312))(this);
}

void sub_1002C3D80(_Unwind_Exception *a1)
{
  uint64_t v4 = (std::__shared_weak_count *)*((void *)v1 + 5);
  if (v4) {
    sub_10000BB9C(v4);
  }
  CLKappaAlgBlock::~CLKappaAlgBlock(v1, v2);
  _Unwind_Resume(a1);
}

void *sub_1002C3DA8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  double result = *(void **)a1;
  if (result
  {
    uint64_t v5 = *(void *)(a1 + 8);
    *a2 = result;
    a2[1] = v5;
    if (v5) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
  }
  return result;
}

void CLMartyEstimatesAlgUncoupledCrash::CLMartyEstimatesAlgUncoupledCrash(CLMartyEstimatesAlgUncoupledCrash *this)
{
  *(void *)this = off_100399F60;
  *((void *)this + 14) = off_10039A008;
  *((void *)this + 15) = off_10039A0D0;
  *((void *)this + 16) = off_10039A180;
  CLKappaAlgBlock::CLKappaAlgBlock(this, (uint64_t *)off_1003B8AC0);
  *(void *)uint64_t v2 = off_1003B85A0;
  *(void *)(v2 + 112) = off_1003B8850;
  *(void *)(v2 + 120) = off_1003B8990;
  *(void *)(v2 + 128) = off_1003B8A70;
  *(void *)(v2 + 32) = 0;
  *(void *)(v2 + 40) = 0;
  *(void *)&long long v3 = 0x80000000800000;
  *((void *)&v3 + 1) = 0x80000000800000;
  *(_OWORD *)(v2 + 48) = v3;
  *(_OWORD *)(v2 + 64) = xmmword_10033F2F0;
  *(_OWORD *)(v2 + 80) = xmmword_10033F300;
  *(_OWORD *)(v2 + 96) = v3;
  sub_1002C4EA8(&v11);
  uint64_t v4 = (std::__shared_weak_count *)*((void *)&v11 + 1);
  unint64_t v5 = v11;
  long long v11 = 0uLL;
  long long v6 = (std::__shared_weak_count *)*((void *)this + 2);
  *(_OWORD *)((char *)this + 8) = __PAIR128__((unint64_t)v4, v5);
  if (v6)
  {
    sub_10000BB9C(v6);
    if (*((void *)&v11 + 1)) {
      sub_10000BB9C(*((std::__shared_weak_count **)&v11 + 1));
    }
    uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 2);
  }
  uint64_t v9 = *((void *)this + 1);
  long long v10 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_1002C3DA8((uint64_t)&v9, &v11);
  long long v7 = v11;
  long long v11 = 0uLL;
  unint64_t v8 = (std::__shared_weak_count *)*((void *)this + 5);
  *((_OWORD *)this + 2) = v7;
  if (v8)
  {
    sub_10000BB9C(v8);
    if (*((void *)&v11 + 1)) {
      sub_10000BB9C(*((std::__shared_weak_count **)&v11 + 1));
    }
  }
  if (v10) {
    sub_10000BB9C(v10);
  }
  (*(void (**)(CLMartyEstimatesAlgUncoupledCrash *))(*(void *)this + 312))(this);
}

void sub_1002C403C(_Unwind_Exception *a1)
{
  long long v3 = (std::__shared_weak_count *)*((void *)v1 + 5);
  if (v3) {
    sub_10000BB9C(v3);
  }
  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B8AC0);
  _Unwind_Resume(a1);
}

void CLMartyEstimatesAlgUncoupledCrash::resetConfiguration(CLMartyEstimatesAlgUncoupledCrash *this)
{
  id v42 = +[CSPersistentConfiguration configBaseKey:"EstimatesAlgUCConfig" forFeatureMode:*((unsigned __int8 *)this + 24)];
  uint64_t v2 = +[CSPersistentConfiguration sharedConfiguration];
  LODWORD(v3) = 0.5;
  LODWORD(v4) = 11.5;
  LODWORD(v5) = 1193033728;
  [v2 algorithmThresholdNumber:0 inArrayForKey:v42 withMinValue:v3 maxValue:v5 defaultValue:v4];
  LODWORD(v43) = v6;

  long long v7 = +[CSPersistentConfiguration sharedConfiguration];
  LODWORD(v8) = 1117782016;
  LODWORD(v9) = 1110704128;
  [v7 algorithmThresholdNumber:1 inArrayForKey:v42 withMinValue:0.0 maxValue:v8 defaultValue:v9];
  DWORD1(v43) = v10;

  long long v11 = +[CSPersistentConfiguration sharedConfiguration];
  LODWORD(v12) = 5.0;
  LODWORD(v13) = -1138501878;
  [v11 algorithmThresholdNumber:2 inArrayForKey:v42 withMinValue:v13 maxValue:v12 defaultValue:0.0];
  DWORD2(v43) = v14;

  double v15 = +[CSPersistentConfiguration sharedConfiguration];
  LODWORD(v16) = 1132068864;
  LODWORD(v17) = 1159479296;
  [v15 algorithmThresholdNumber:3 inArrayForKey:v42 withMinValue:0.0 maxValue:v17 defaultValue:v16];
  HIDWORD(v43) = v18;

  double v19 = +[CSPersistentConfiguration sharedConfiguration];
  LODWORD(v20) = 19.0;
  LODWORD(v21) = 1159479296;
  [v19 algorithmThresholdNumber:4 inArrayForKey:v42 withMinValue:0.0 maxValue:v21 defaultValue:v20];
  int v44 = v22;

  double v23 = +[CSPersistentConfiguration sharedConfiguration];
  LODWORD(v24) = 1118568448;
  LODWORD(v25) = 1159479296;
  [v23 algorithmThresholdNumber:5 inArrayForKey:v42 withMinValue:0.0 maxValue:v25 defaultValue:v24];
  int v45 = v26;

  double v27 = +[CSPersistentConfiguration sharedConfiguration];
  LODWORD(v28) = 0.5;
  LODWORD(v29) = 20.0;
  LODWORD(v30) = 1193033728;
  [v27 algorithmThresholdNumber:6 inArrayForKey:v42 withMinValue:v28 maxValue:v30 defaultValue:v29];
  int v46 = v31;

  __int16 v32 = +[CSPersistentConfiguration sharedConfiguration];
  LODWORD(v33) = 6.0;
  LODWORD(v34) = -1138501878;
  LODWORD(v35) = 1193033728;
  [v32 algorithmThresholdNumber:7 inArrayForKey:v42 withMinValue:v34 maxValue:v35 defaultValue:v33];
  int v47 = v36;

  double v37 = +[CSPersistentConfiguration sharedConfiguration];
  LODWORD(v38) = 1112014848;
  LODWORD(v39) = 4.0;
  LODWORD(v40) = -1138501878;
  [v37 algorithmThresholdNumber:8 inArrayForKey:v42 withMinValue:v40 maxValue:v38 defaultValue:v39];
  int v48 = v41;

  CLMartyEstimatesAlgUncoupledCrash::setConfig((uint64_t)this, &v43);
}

void sub_1002C42E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

double CLMartyEstimatesAlgUncoupledCrash::setConfig(uint64_t a1, long long *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  long long v4 = *a2;
  long long v5 = a2[1];
  *(_DWORD *)(v3 + 48) = *((_DWORD *)a2 + 8);
  *(_OWORD *)(v3 + 16) = v4;
  *(_OWORD *)(v3 + 32) = v5;
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B90E8);
  }
  int v6 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_DEBUG))
  {
    double v8 = *(float **)(a1 + 32);
    double v9 = v8[4];
    double v10 = v8[5];
    double v11 = v8[6];
    double v12 = v8[7];
    double v13 = v8[8];
    double v14 = v8[9];
    double v15 = v8[10];
    double v16 = v8[11];
    double v17 = v8[12];
    int v18 = 134220032;
    double v19 = v9;
    __int16 v20 = 2048;
    double v21 = v10;
    __int16 v22 = 2048;
    double v23 = v11;
    __int16 v24 = 2048;
    double v25 = v12;
    __int16 v26 = 2048;
    double v27 = v13;
    __int16 v28 = 2048;
    double v29 = v14;
    __int16 v30 = 2048;
    double v31 = v15;
    __int16 v32 = 2048;
    double v33 = v16;
    __int16 v34 = 2048;
    double v35 = v17;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[M][UC] config-1,%f,config-2,%f,config-3,%f,config-4,%f,config-5,%f,config-6,%f,config-7,%f,config-8,%f,config-9,%f", (uint8_t *)&v18, 0x5Cu);
  }
  return result;
}

uint64_t CLMartyEstimatesAlgUncoupledCrash::reset(CLMartyEstimatesAlgUncoupledCrash *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 4) + 24))();
}

double CLMartyEstimatesAlgUncoupledCrash::epochFinalize(CLMartyEstimatesAlgUncoupledCrash *this, uint64_t a2)
{
  uint64_t v2 = *((void *)this + 4);
  float v3 = *(float *)(v2 + 32);
  float v4 = *(float *)(v2 + 36);
  float v5 = *((float *)this + 21);
  BOOL v6 = v5 < v3 && *((float *)this + 23) < v3;
  float v7 = *(float *)(v2 + 16);
  float v8 = *((float *)this + 12);
  float v9 = *((float *)this + 22);
  BOOL v10 = v9 < v4 && *((float *)this + 24) < v4;
  float v11 = *(float *)(v2 + 20);
  float v12 = *(float *)(v2 + 24);
  float v13 = *(float *)(v2 + 28);
  float v15 = *(float *)(v2 + 40);
  float v14 = *(float *)(v2 + 44);
  float v16 = *(float *)(v2 + 48);
  float v18 = *((float *)this + 15);
  float v17 = *((float *)this + 16);
  float v20 = *((float *)this + 25);
  float v19 = *((float *)this + 26);
  float v21 = *((float *)this + 27);
  float v22 = *((float *)this + 14);
  if (v8 >= v7)
  {
    BOOL v24 = v22 < v11;
    if (v17 < v13) {
      BOOL v24 = 1;
    }
    char v23 = (v20 >= v15) & ~(v24 || v6 || v10);
    if (v19 < v14) {
      char v23 = 0;
    }
    if (v21 < v16) {
      char v23 = 0;
    }
    if (v18 < v12) {
      char v23 = 0;
    }
  }
  else
  {
    char v23 = 0;
  }
  float v25 = *((float *)this + 17);
  BOOL v26 = v18 >= *((float *)this + 19);
  if (v22 < *((float *)this + 18) || v17 < *((float *)this + 20)) {
    BOOL v26 = 0;
  }
  *(void *)(v2 + 64) = a2;
  if (v8 < v25) {
    BOOL v26 = 0;
  }
  *(unsigned char *)(v2 + 56) = v23;
  *(unsigned char *)(v2 + 57) = v23;
  *(float *)(v2 + 72) = v7;
  *(float *)(v2 + 76) = v11;
  *(float *)(v2 + 80) = v12;
  *(float *)(v2 + 84) = v13;
  int v27 = *((_DWORD *)this + 13);
  *(float *)(v2 + 96) = v8;
  *(_DWORD *)(v2 + 100) = v27;
  *(float *)(v2 + 104) = v22;
  *(float *)(v2 + 108) = v18;
  *(unsigned char *)(v2 + 58) = v26;
  *(float *)(v2 + 88) = v3;
  *(float *)(v2 + 92) = v4;
  *(float *)(v2 + 112) = v17;
  *(float *)(v2 + 116) = v5;
  *(float *)(v2 + 120) = v9;
  double result = *(double *)((char *)this + 92);
  *(double *)(v2 + 124) = result;
  *(float *)(v2 + 132) = v20;
  *(float *)(v2 + 136) = v15;
  *(float *)(v2 + 140) = v19;
  *(float *)(v2 + 144) = v14;
  *(float *)(v2 + 148) = v21;
  *(float *)(v2 + 152) = v16;
  return result;
}

double virtual thunk to'CLMartyEstimatesAlgUncoupledCrash::epochFinalize(CLMartyEstimatesAlgUncoupledCrash *this, uint64_t a2)
{
  return CLMartyEstimatesAlgUncoupledCrash::epochFinalize((CLMartyEstimatesAlgUncoupledCrash *)((char *)this + *(void *)(*(void *)this - 48)), a2);
}

double CLMartyEstimatesAlgUncoupledCrash::feedFeatures(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 12);
  double result = *(double *)(a1 + 84);
  *(void *)&long long v3 = *(void *)(a2 + 44);
  *((double *)&v3 + 1) = result;
  *(_OWORD *)(a1 + 84) = v3;
  return result;
}

double virtual thunk to'CLMartyEstimatesAlgUncoupledCrash::feedFeatures(void *a1, uint64_t a2)
{
  uint64_t v2 = (char *)a1 + *(void *)(*a1 - 96);
  *((_DWORD *)v2 + 16) = *(_DWORD *)(a2 + 12);
  double result = *(double *)(v2 + 84);
  *(void *)&long long v4 = *(void *)(a2 + 44);
  *((double *)&v4 + 1) = result;
  *(_OWORD *)(v2 + 84) = v4;
  return result;
}

float CLMartyEstimatesAlgUncoupledCrash::feedFeatures(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 68);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 52) = v2;
  float result = *(float *)(a2 + 268);
  *(_DWORD *)(a1 + 108) = *(_DWORD *)(a2 + 16);
  int v4 = *(_DWORD *)(a2 + 96);
  *(float *)(a1 + 100) = result;
  *(_DWORD *)(a1 + 104) = v4;
  return result;
}

{
  float result;
  int v3;

  float result = *(float *)(a2 + 20);
  long long v3 = *(_DWORD *)(a2 + 28);
  *(float *)(a1 + 56) = result;
  *(_DWORD *)(a1 + 60) = v3;
  return result;
}

float virtual thunk to'CLMartyEstimatesAlgUncoupledCrash::feedFeatures(void *a1, uint64_t a2)
{
  int v2 = (char *)a1 + *(void *)(*a1 - 32);
  int v3 = *(_DWORD *)(a2 + 68);
  *((_DWORD *)v2 + 12) = *(_DWORD *)(a2 + 88);
  *((_DWORD *)v2 + 13) = v3;
  float result = *(float *)(a2 + 268);
  *((_DWORD *)v2 + 27) = *(_DWORD *)(a2 + 16);
  int v5 = *(_DWORD *)(a2 + 96);
  *((float *)v2 + 25) = result;
  *((_DWORD *)v2 + 26) = v5;
  return result;
}

{
  float *v2;
  float result;
  int v4;

  int v2 = (float *)((char *)a1 + *(void *)(*a1 - 112));
  float result = *(float *)(a2 + 20);
  int v4 = *(_DWORD *)(a2 + 28);
  v2[14] = result;
  *((_DWORD *)v2 + 15) = v4;
  return result;
}

double CLMartyEstimatesAlgUncoupledCrash::epochReset(CLMartyEstimatesAlgUncoupledCrash *this)
{
  uint64_t v1 = *((void *)this + 4);
  *(_WORD *)(v1 + 56) = 0;
  *(unsigned char *)(v1 + 58) = 0;
  *(void *)(v1 + 64) = 0;
  double result = 0.0;
  *(_OWORD *)(v1 + 72) = 0u;
  *(_OWORD *)(v1 + 88) = 0u;
  *(_OWORD *)(v1 + 104) = 0u;
  *(_OWORD *)(v1 + 120) = 0u;
  *(_OWORD *)(v1 + 136) = 0u;
  *(_DWORD *)(v1 + 152) = 0;
  return result;
}

double virtual thunk to'CLMartyEstimatesAlgUncoupledCrash::epochReset(CLMartyEstimatesAlgUncoupledCrash *this)
{
  uint64_t v1 = *(void *)((char *)this + *(void *)(*(void *)this - 56) + 32);
  *(_WORD *)(v1 + 56) = 0;
  *(unsigned char *)(v1 + 58) = 0;
  double result = 0.0;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  *(_OWORD *)(v1 + 96) = 0u;
  *(_OWORD *)(v1 + 112) = 0u;
  *(_OWORD *)(v1 + 128) = 0u;
  *(_OWORD *)(v1 + 140) = 0u;
  return result;
}

void sub_1002C474C(CLKappaAlgBlock *this)
{
  *(void *)this = off_1003B85A0;
  *((void *)this + 14) = off_1003B8850;
  *((void *)this + 15) = off_1003B8990;
  *(void *)((char *)this + *(void *)(*(void *)this - 176)) = off_1003B8A70;
  int v2 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v2) {
    sub_10000BB9C(v2);
  }

  CLKappaAlgBlock::~CLKappaAlgBlock(this, (uint64_t *)off_1003B8AC0);
}

void sub_1002C483C(CLKappaAlgBlock *this)
{
  *(void *)this = off_1003B85A0;
  *((void *)this + 14) = off_1003B8850;
  *((void *)this + 15) = off_1003B8990;
  *((void *)this + 16) = off_1003B8A70;
  int v2 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v2) {
    sub_10000BB9C(v2);
  }
  CLKappaAlgBlock::~CLKappaAlgBlock(this, (uint64_t *)off_1003B8AC0);

  operator delete();
}

void sub_1002C4918(void *a1)
{
  uint64_t v1 = (CLKappaAlgBlock *)((char *)a1 + *(void *)(*a1 - 24));
  *(void *)uint64_t v1 = off_1003B85A0;
  *((void *)v1 + 14) = off_1003B8850;
  *((void *)v1 + 15) = off_1003B8990;
  *((void *)v1 + 16) = off_1003B8A70;
  int v2 = (std::__shared_weak_count *)*((void *)v1 + 5);
  if (v2) {
    sub_10000BB9C(v2);
  }

  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B8AC0);
}

void sub_1002C49F0(void *a1)
{
  uint64_t v1 = (CLKappaAlgBlock *)((char *)a1 + *(void *)(*a1 - 24));
  *(void *)uint64_t v1 = off_1003B85A0;
  *((void *)v1 + 14) = off_1003B8850;
  *((void *)v1 + 15) = off_1003B8990;
  *((void *)v1 + 16) = off_1003B8A70;
  int v2 = (std::__shared_weak_count *)*((void *)v1 + 5);
  if (v2) {
    sub_10000BB9C(v2);
  }
  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B8AC0);

  operator delete();
}

void sub_1002C4ADC(void *a1)
{
  uint64_t v1 = (CLKappaAlgBlock *)((char *)a1 + *(void *)(*a1 - 24));
  *(void *)uint64_t v1 = off_1003B85A0;
  *((void *)v1 + 14) = off_1003B8850;
  *((void *)v1 + 15) = off_1003B8990;
  *((void *)v1 + 16) = off_1003B8A70;
  int v2 = (std::__shared_weak_count *)*((void *)v1 + 5);
  if (v2) {
    sub_10000BB9C(v2);
  }

  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B8AC0);
}

void sub_1002C4BB4(void *a1)
{
  uint64_t v1 = (CLKappaAlgBlock *)((char *)a1 + *(void *)(*a1 - 24));
  *(void *)uint64_t v1 = off_1003B85A0;
  *((void *)v1 + 14) = off_1003B8850;
  *((void *)v1 + 15) = off_1003B8990;
  *((void *)v1 + 16) = off_1003B8A70;
  int v2 = (std::__shared_weak_count *)*((void *)v1 + 5);
  if (v2) {
    sub_10000BB9C(v2);
  }
  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B8AC0);

  operator delete();
}

void sub_1002C4CA0(void *a1)
{
  uint64_t v1 = (CLKappaAlgBlock *)((char *)a1 + *(void *)(*a1 - 24));
  *(void *)uint64_t v1 = off_1003B85A0;
  *((void *)v1 + 14) = off_1003B8850;
  *((void *)v1 + 15) = off_1003B8990;
  *((void *)v1 + 16) = off_1003B8A70;
  int v2 = (std::__shared_weak_count *)*((void *)v1 + 5);
  if (v2) {
    sub_10000BB9C(v2);
  }

  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B8AC0);
}

void sub_1002C4D78(void *a1)
{
  uint64_t v1 = (CLKappaAlgBlock *)((char *)a1 + *(void *)(*a1 - 24));
  *(void *)uint64_t v1 = off_1003B85A0;
  *((void *)v1 + 14) = off_1003B8850;
  *((void *)v1 + 15) = off_1003B8990;
  *((void *)v1 + 16) = off_1003B8A70;
  int v2 = (std::__shared_weak_count *)*((void *)v1 + 5);
  if (v2) {
    sub_10000BB9C(v2);
  }
  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B8AC0);

  operator delete();
}

void sub_1002C4E64(id a1)
{
  qword_1003DB6A8 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "Alg");

  _objc_release_x1();
}

double sub_1002C4EA8@<D0>(void *a1@<X8>)
{
  int v2 = (char *)operator new(0xB8uLL);
  *((void *)v2 + 1) = 0;
  *((void *)v2 + 2) = 0;
  *(void *)int v2 = off_1003B9118;
  *((_OWORD *)v2 + 2) = 0u;
  *((_OWORD *)v2 + 3) = 0u;
  *((_OWORD *)v2 + 4) = 0u;
  *((_OWORD *)v2 + 5) = 0u;
  *((_OWORD *)v2 + 6) = 0u;
  *((_OWORD *)v2 + 7) = 0u;
  *((_OWORD *)v2 + 8) = 0u;
  *((_OWORD *)v2 + 9) = 0u;
  *((_OWORD *)v2 + 10) = 0u;
  *((void *)v2 + 22) = 0;
  *((void *)v2 + 3) = &off_1003A1D88;
  *((void *)v2 + 5) = 0x4234000041380000;
  *(_OWORD *)(v2 + 52) = xmmword_10033F320;
  double result = 512.000124;
  *(void *)(v2 + 68) = 0x4080000040C00000;
  *a1 = v2 + 24;
  a1[1] = v2;
  return result;
}

void sub_1002C4F54(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_1003B9118;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1002C4F74(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_1003B9118;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_1002C4FC8(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void CMFourierTransformSafety::CMFourierTransformSafety(CMFourierTransformSafety *this)
{
  *((void *)this + 18) = (char *)this + 152;
  *((void *)this + 1) = 1024;
  *(_DWORD *)this = 10;
  int v2 = &_mh_execute_header;
  uint64_t v3 = 152;
  float64x2_t v10 = (float64x2_t)vdupq_n_s64(0x3F60000000000000uLL);
  float64x2_t v11 = (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL);
  do
  {
    int32x2_t v4 = vneg_s32((int32x2_t)v2);
    v5.i64[0] = v4.i32[0];
    v5.i64[1] = v4.i32[1];
    float32x2_t v6 = vcvt_f32_f64(vmulq_f64(vmulq_f64(vcvtq_f64_s64(v5), v11), v10));
    float v12 = v6.f32[0];
    __float2 v7 = __sincosf_stret(v6.f32[1]);
    __float2 v8 = __sincosf_stret(v12);
    v13.val[1] = (float32x2_t)__PAIR64__(LODWORD(v7.__sinval), LODWORD(v8.__sinval));
    v13.val[0] = (float32x2_t)__PAIR64__(LODWORD(v7.__cosval), LODWORD(v8.__cosval));
    float v9 = (float *)((char *)this + v3);
    vst2_f32(v9, v13);
    int v2 = (const mach_header_64 *)vadd_s32((int32x2_t)v2, (int32x2_t)0x200000002);
    v3 += 16;
  }
  while (v3 != 8344);
  kf_factor_cs(1024, (int *)this + 4);
}

uint64_t CMFourierTransformSafety::findExponent(CMFourierTransformSafety *this, int a2)
{
  uint64_t result = 0;
  if ((a2 & 1) == 0)
  {
    do
    {
      char v3 = a2;
      uint64_t result = (result + 1);
      a2 >>= 1;
    }
    while ((v3 & 2) == 0);
  }
  return result;
}

uint64_t kf_factor_cs(uint64_t result, int *a2)
{
  float v2 = sqrtf((float)(int)result);
  int v3 = 4;
  do
  {
    while ((int)result % v3)
    {
      int v4 = v3 + 2;
      if (v3 == 2) {
        int v4 = 3;
      }
      if (v3 == 4) {
        int v3 = 2;
      }
      else {
        int v3 = v4;
      }
      if (v2 < (float)v3) {
        int v3 = result;
      }
    }
    uint64_t result = ((int)result / v3);
    *a2 = v3;
    a2[1] = result;
    a2 += 2;
  }
  while ((int)result > 1);
  return result;
}

void CMFourierTransformSafety::forward(uint64_t a1, _DWORD *a2, unsigned __int16 *a3)
{
  int64x2_t v5 = (int *)(a1 + 8);
  bzero(&v13, 8 * *(int *)(a1 + 8));
  sub_1002C5438(&v13, a3, 0, 1, 1u, v5 + 2, (uint64_t)v5);
  *a2 = 0;
  unint64_t v6 = *v5;
  if ((int)v6 >= 4)
  {
    unint64_t v7 = v6 >> 1;
    float v8 = (float)(int)v6;
    float v9 = (float *)(a2 + 1);
    float64x2_t v10 = (float32x2_t *)&v14;
    unint64_t v11 = v7 - 1;
    do
    {
      float32x2_t v12 = *v10++;
      *v9++ = sqrtf(vaddv_f32(vmul_f32(v12, v12)) / v8);
      --v11;
    }
    while (v11);
  }
}

float kiss_fft_cs(uint64_t a1, unsigned __int16 *a2, float *a3)
{
  return sub_1002C5438(a3, a2, 0, 1, 1u, (int *)(a1 + 8), a1);
}

void CMFourierTransformSafety::forward_wide(uint64_t a1)
{
  uint64_t v1 = __chkstk_darwin(a1);
  int v3 = v2;
  int64x2_t v5 = v4;
  unint64_t v6 = (int *)(v1 + 8);
  bzero(v11, 8 * *(int *)(v1 + 8));
  sub_1002C5438(v11, v3, 0, 1, 1u, v6 + 2, (uint64_t)v6);
  uint64_t v7 = *v6;
  if ((int)v7 >= 1)
  {
    float v8 = (float)(int)v7;
    float v9 = (float32x2_t *)v11;
    do
    {
      float32x2_t v10 = *v9++;
      *v5++ = sqrtf(vaddv_f32(vmul_f32(v10, v10)) / v8);
      --v7;
    }
    while (v7);
  }
}

float CMFourierTransformSafety::forward_real(uint64_t a1)
{
  uint64_t v1 = __chkstk_darwin(a1);
  int v3 = v2;
  int64x2_t v5 = v4;
  unint64_t v6 = (int *)(v1 + 8);
  bzero(v11, 8 * *(int *)(v1 + 8));
  float result = sub_1002C5438(v11, v3, 0, 1, 1u, v6 + 2, (uint64_t)v6);
  uint64_t v8 = *v6;
  if ((int)v8 >= 1)
  {
    float v9 = v11;
    do
    {
      float v10 = *v9;
      v9 += 2;
      float result = v10;
      *v5++ = v10;
      --v8;
    }
    while (v8);
  }
  return result;
}

float kiss_fft_stride_cs(uint64_t a1, unsigned __int16 *a2, float *a3, unsigned int a4)
{
  return sub_1002C5438(a3, a2, 0, 1, a4, (int *)(a1 + 8), a1);
}

float sub_1002C5438(float *a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, unsigned int a5, int *a6, uint64_t a7)
{
  float v9 = a1;
  int v10 = a6[1];
  uint64_t v11 = *a6;
  uint64_t v12 = v10;
  uint64_t v13 = v10 * (int)v11;
  int v70 = *a6;
  if (v10 == 1)
  {
    int v14 = a4 * a5;
    uint64_t v15 = 8 * v13;
    float v16 = a1;
    do
    {
      *float v16 = *(float *)sub_10003D860(a2, (int)a3);
      v16 += 2;
      LODWORD(a3) = a3 + v14;
      v15 -= 8;
    }
    while (v15);
  }
  else
  {
    unint64_t v17 = 0;
    double v71 = a6 + 2;
    uint64_t v18 = v11 * a4;
    uint64_t v19 = 8 * v13;
    int v20 = a4 * a5;
    do
    {
      sub_1002C5438(&v9[v17 / 4], a2, a3, v18, a5, v71, a7);
      a3 = (a3 + v20);
      v17 += 8 * v10;
    }
    while (v19 != v17);
  }
  if (v70 == 2)
  {
    __int16 v60 = (float *)(*(void *)(a7 + 136) + 4);
    uint64_t v61 = 2 * v10;
    do
    {
      __int16 v62 = &v9[v61];
      float v63 = *(v60 - 1);
      float v64 = v9[2 * v12];
      float v65 = v9[v61 + 1];
      float v66 = (float)(v64 * v63) - (float)(v65 * *v60);
      float v67 = (float)(v63 * v65) + (float)(v64 * *v60);
      float v68 = v9[1] - v67;
      *__int16 v62 = *v9 - v66;
      v62[1] = v68;
      float result = v67 + v9[1];
      float *v9 = v66 + *v9;
      v9[1] = result;
      v9 += 2;
      v60 += 2 * a4;
      --v10;
    }
    while (v10);
  }
  else
  {
    if (v70 != 4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1002C5714(v70);
      }
      __assert_rtn("kf_work", "CMFourierTransformSafety.cpp", 253, "false");
    }
    uint64_t v21 = 2 * v10;
    float v22 = v9 + 1;
    char v23 = (float *)(*(void *)(a7 + 136) + 4);
    uint64_t v24 = 4 * v10;
    int v25 = *(_DWORD *)(a7 + 4);
    uint64_t v26 = 6 * v10;
    int v27 = v23;
    __int16 v28 = v23;
    do
    {
      double v29 = &v22[v21];
      float v30 = *(v23 - 1);
      float v31 = v22[v21 - 1];
      float v32 = v22[2 * v10];
      float v33 = (float)(v31 * v30) - (float)(v32 * *v23);
      float v34 = (float)(v30 * v32) + (float)(v31 * *v23);
      double v35 = &v22[v24];
      float v36 = *(v27 - 1);
      float v37 = v22[v24 - 1];
      float v38 = v22[4 * v10];
      float v39 = (float)(v37 * v36) - (float)(v38 * *v27);
      float v40 = (float)(v36 * v38) + (float)(v37 * *v27);
      int v41 = &v22[v26];
      float v42 = *(v28 - 1);
      float v43 = v22[v26 - 1];
      float v44 = v22[6 * v10];
      float v45 = (float)(v43 * v42) - (float)(v44 * *v28);
      float v46 = (float)(v42 * v44) + (float)(v43 * *v28);
      float v47 = *(v22 - 1);
      float v48 = v47 - v39;
      float v49 = *v22 - v40;
      float v50 = v39 + v47;
      float v51 = v40 + *v22;
      *(v22 - 1) = v50;
      *float v22 = v51;
      float v52 = v34 + v46;
      float v53 = v33 - v45;
      float v54 = v34 - v46;
      *(v35 - 1) = v50 - (float)(v33 + v45);
      float *v35 = v51 - v52;
      float v55 = v52 + *v22;
      *(v22 - 1) = (float)(v33 + v45) + *(v22 - 1);
      *float v22 = v55;
      if (v25)
      {
        float result = v48 + v54;
        float v57 = v49 - v53;
        float v58 = v48 - v54;
        float v59 = v49 + v53;
      }
      else
      {
        float v58 = v48 + v54;
        float v59 = v49 - v53;
        float result = v48 - v54;
        float v57 = v49 + v53;
      }
      v22[2 * v10] = v59;
      v22[6 * v10] = v57;
      v22 += 2;
      v28 += 6 * a4;
      *(v29 - 1) = v58;
      v27 += 4 * a4;
      v23 += 2 * a4;
      *(v41 - 1) = result;
      --v12;
    }
    while (v12);
  }
  return result;
}

void sub_1002C5714(int a1)
{
  int v2 = 134218498;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  __int16 v4 = 2080;
  int64x2_t v5 = "void kf_work(kiss_fft_cpx *, const CMQueue<scalar_32> &, int, const size_t, int, const int *, const kiss_fft_state *)";
  __int16 v6 = 1024;
  int v7 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "ERROR,Die,Time,%.3f,Function,\"%s\",Error in FFT,p,%d\n", (uint8_t *)&v2, 0x1Cu);
}

void sub_1002C5BB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1002C5BE4()
{
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  v0 = (void *)qword_1003DB6C8;

  return v0;
}

void sub_1002C5D38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002C64A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  objc_destroyWeak((id *)(v17 - 136));
  _Unwind_Resume(a1);
}

__CFString *sub_1002C658C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  switch(a2)
  {
    case 4:
      __int16 v4 = *(unsigned char **)(a1 + 32);
      if (v4[416]) {
        [v4 resetSession];
      }
LABEL_10:
      int v3 = 0;
      break;
    case 3:
      if (a3 == 1)
      {
        int v3 = (__CFString *)objc_retainBlock(*(id *)(*(void *)(a1 + 32) + 64));
        break;
      }
      goto LABEL_10;
    case 1:
      int v3 = @"idle";
      break;
    default:
      int v3 = 0;
      break;
  }

  return v3;
}

__CFString *sub_1002C6604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  switch(a2)
  {
    case 4:
      [*(id *)(a1 + 32) start];
LABEL_7:
      __int16 v4 = 0;
      break;
    case 3:
      switch(a3)
      {
        case 1:
          if (qword_1003DB6C0 != -1) {
            dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
          }
          __int16 v6 = qword_1003DB6C8;
          if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
          {
            v8[0] = 67109120;
            v8[1] = 600;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "reset timeout to  %u sec", (uint8_t *)v8, 8u);
          }
          [*(id *)(*(void *)(a1 + 32) + 96) setNextFireDelay:600.0 interval:1.79769313e308];
          int64x2_t v5 = *(void **)(*(void *)(a1 + 32) + 64);
          break;
        case 2:
        case 3:
          int64x2_t v5 = *(void **)(*(void *)(a1 + 32) + 56);
          break;
        case 4:
          int64x2_t v5 = *(void **)(*(void *)(a1 + 32) + 72);
          break;
        case 5:
          int64x2_t v5 = *(void **)(*(void *)(a1 + 32) + 80);
          break;
        default:
          goto LABEL_7;
      }
      __int16 v4 = objc_retainBlock(v5);
      break;
    case 1:
      __int16 v4 = @"reading";
      break;
    default:
      __int16 v4 = 0;
      break;
  }

  return v4;
}

__CFString *sub_1002C67A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v4 = 0;
  switch(a2)
  {
    case 1:
      __int16 v4 = @"waitForPOI";
      break;
    case 3:
      goto LABEL_13;
    case 4:
      if (qword_1003DB6C0 != -1) {
        dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
      }
      __int16 v6 = qword_1003DB6C8;
      if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "set timer for POI resolution timeout", buf, 2u);
      }
      [*(id *)(*(void *)(a1 + 32) + 96) setNextFireDelay:10.0 interval:1.79769313e308];
LABEL_15:
      __int16 v4 = 0;
      break;
    case 6:
      if (qword_1003DB6C0 != -1) {
        dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
      }
      int v7 = qword_1003DB6C8;
      if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "cancel POI timeout timer", v12, 2u);
      }
      [*(id *)(*(void *)(a1 + 32) + 96) setNextFireDelay:1.79769313e308 interval:1.79769313e308];
LABEL_13:
      __int16 v4 = 0;
      switch(a3)
      {
        case 1:
          if (qword_1003DB6C0 != -1) {
            dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
          }
          uint64_t v8 = qword_1003DB6C8;
          if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)uint64_t v11 = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "ignoring trigger in wait state while waiting for POI resolution", v11, 2u);
          }
          float v9 = *(void **)(*(void *)(a1 + 32) + 80);
          goto LABEL_23;
        case 2:
        case 6:
          [*(id *)(a1 + 32) evaluateCrashWithPOI];
          goto LABEL_15;
        case 3:
          float v9 = *(void **)(*(void *)(a1 + 32) + 56);
          goto LABEL_23;
        case 4:
          float v9 = *(void **)(*(void *)(a1 + 32) + 72);
LABEL_23:
          __int16 v4 = objc_retainBlock(v9);
          break;
        default:
          goto LABEL_24;
      }
      break;
    default:
      break;
  }
LABEL_24:

  return v4;
}

__CFString *sub_1002C6A20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v4 = 0;
  switch(a2)
  {
    case 1:
      __int16 v4 = @"waitForSOS";
      goto LABEL_31;
    case 3:
      if (a3 == 7 || a3 == 2) {
        goto LABEL_29;
      }
      if (a3 != 1) {
        goto LABEL_24;
      }
      if (!*(unsigned char *)(*(void *)(a1 + 32) + 417)) {
        goto LABEL_29;
      }
      if (qword_1003DB6C0 != -1) {
        dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
      }
      int64x2_t v5 = qword_1003DB6C8;
      if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "ignoring trigger in wait state while waiting for SOS resolution", v13, 2u);
      }
      __int16 v6 = *(void **)(*(void *)(a1 + 32) + 72);
      goto LABEL_30;
    case 4:
      if (*(unsigned char *)(*(void *)(a1 + 32) + 417))
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        int v7 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "wait for 30s for SOS resolution", buf, 2u);
        }
        uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 96);
        double v9 = 30.0;
LABEL_23:
        [v8 setNextFireDelay:v9 interval:1.79769313e308];
LABEL_24:
        __int16 v4 = 0;
      }
      else
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        uint64_t v11 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)float v16 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "SOSInProgress false while in wait state", v16, 2u);
        }
LABEL_29:
        __int16 v6 = *(void **)(*(void *)(a1 + 32) + 56);
LABEL_30:
        __int16 v4 = objc_retainBlock(v6);
      }
LABEL_31:
      return v4;
    case 6:
      if (qword_1003DB6C0 != -1) {
        dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
      }
      int v10 = qword_1003DB6C8;
      if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "cancel sos timeout timer", v14, 2u);
      }
      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 96);
      double v9 = 1.79769313e308;
      goto LABEL_23;
    default:
      goto LABEL_31;
  }
}

id sub_1002C6CC0(uint64_t a1)
{
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  int v2 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int16 v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Trigger timeout expired", v4, 2u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 48) signal:2 data:0];
}

void sub_1002C7054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  int v20 = v15;

  _Unwind_Resume(a1);
}

void sub_1002C70B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  float v22 = v5;
  id v23 = a3;
  if (v23)
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    uint64_t v6 = qword_1003DB6C8;
    if (!os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543362;
    id v30 = v23;
    int v7 = "geoservices place lookup failed with error: %{public}@";
    uint64_t v8 = v6;
    uint32_t v9 = 12;
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v7, buf, v9);
LABEL_7:
    *(unsigned char *)(*(void *)(a1 + 32) + 218) = 1;
    goto LABEL_25;
  }
  if (!v5)
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    uint64_t v21 = qword_1003DB6C8;
    if (!os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    int v7 = "geoservices place unexpectedly received a nil result but no error";
    uint64_t v8 = v21;
    uint32_t v9 = 2;
    goto LABEL_6;
  }
  int v10 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
  uint64_t v11 = [v5 mapItemsForSpatialLookupParameters:v10];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v26;
    do
    {
      int v14 = 0;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v14);
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        float v16 = (id)qword_1003DB6C8;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v17 = [v15 name];
          uint64_t v18 = [v15 spatialMappedPlaceCategories];
          [v15 centerCoordinate];
          GEOCalculateDistance();
          *(_DWORD *)buf = 134218755;
          id v30 = v15;
          __int16 v31 = 2113;
          float v32 = v17;
          __int16 v33 = 2112;
          float v34 = v18;
          __int16 v35 = 2048;
          uint64_t v36 = v19;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "geoservices mapItem %p name %{private}@ category %@ distance %f", buf, 0x2Au);
        }
        *(unsigned char *)(*(void *)(a1 + 32) + 216) = 1;
        int v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [obj countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v12);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 218) = 1;
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  int v20 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "geoservices lookup done", buf, 2u);
  }
  [*(id *)(*(void *)(a1 + 32) + 48) signal:6 data:0 v22];

LABEL_25:
}

void sub_1002C7498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1002C7A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18)
{
  if (a14) {
    sub_10000BB9C(a14);
  }
  if (a18) {
    sub_10000BB9C(a18);
  }
  _Unwind_Resume(a1);
}

void sub_1002C7F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a12) {
    sub_10000BB9C(a12);
  }
  if (a16) {
    sub_10000BB9C(a16);
  }
  _Unwind_Resume(a1);
}

void sub_1002C8064(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002C8100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_1002C82A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002C83AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002C8844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002C8C30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002C8EB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002C92F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002C956C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1002C96CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1002C96F8()
{
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003B91E8);
  }
  v0 = (void *)qword_1003DB718;

  return v0;
}

void sub_1002C9B54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002C9C4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002C9E78()
{
}

void sub_1002CA3E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a12) {
    sub_10000BB9C(a12);
  }
  if (a16) {
    sub_10000BB9C(a16);
  }
  _Unwind_Resume(a1);
}

void sub_1002CA6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11)
{
  if (a11) {
    sub_10000BB9C(a11);
  }
  _Unwind_Resume(a1);
}

void sub_1002CABF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24)
{
  if (a24) {
    sub_10000BB9C(a24);
  }
  if (v24) {
    sub_10000BB9C(v24);
  }
  _Unwind_Resume(a1);
}

void sub_1002CAEA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (v19) {
    sub_10000BB9C(v19);
  }
  if (v18) {
    sub_10000BB9C(v18);
  }
  if (a16) {
    sub_10000BB9C(a16);
  }
  if (v17) {
    sub_10000BB9C(v17);
  }
  float v22 = *(std::__shared_weak_count **)(v20 - 56);
  if (v22) {
    sub_10000BB9C(v22);
  }
  if (v16) {
    sub_10000BB9C(v16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1002CB5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22,uint64_t a23,uint64_t a24,uint64_t a25,std::__shared_weak_count *a26)
{
  if (a14) {
    sub_10000BB9C(a14);
  }
  if (v30) {
    sub_10000BB9C(v30);
  }
  if (a18) {
    sub_10000BB9C(a18);
  }
  if (v29) {
    sub_10000BB9C(v29);
  }
  if (a22) {
    sub_10000BB9C(a22);
  }
  if (v28) {
    sub_10000BB9C(v28);
  }
  if (a26) {
    sub_10000BB9C(a26);
  }
  if (v27) {
    sub_10000BB9C(v27);
  }
  float v34 = *(std::__shared_weak_count **)(v32 - 136);
  if (v34) {
    sub_10000BB9C(v34);
  }
  if (v26) {
    sub_10000BB9C(v26);
  }
  _Unwind_Resume(a1);
}

void sub_1002CB870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002CB91C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002CBB40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002CC1F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22)
{
  if (a22) {
    sub_10000BB9C(a22);
  }
  if (v22) {
    sub_10000BB9C(v22);
  }
  _Unwind_Resume(a1);
}

void *sub_1002CC260(void *result)
{
  *(void *)(result[4] + 376) = result[5];
  uint64_t v1 = result[4];
  if (*(unsigned char *)(v1 + 219))
  {
    if (!*(unsigned char *)(v1 + 417)) {
      return result;
    }
    goto LABEL_5;
  }
  if (*(unsigned char *)(v1 + 417))
  {
LABEL_5:
    int v2 = *(void **)(v1 + 48);
    return [v2 signal:4 data:0];
  }
  int v3 = result;
  [*(id *)(v1 + 40) feedDetectionDecision:0 uuid:0 forMode:1];
  [*(id *)(v3[4] + 48) signal:3 data:0];
  __int16 v4 = *(void **)(v3[4] + 176);

  return [v4 releasePowerAssertion];
}

void sub_1002CC734(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_10000BB9C(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1002CC764(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[C] force de %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 100) = a2;
}

void sub_1002CC83C(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[C] force pu %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 96) = a2;
}

void sub_1002CC914(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[C] force ff %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 97) = a2;
}

void sub_1002CC9EC(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[C] force ba %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 98) = a2;
}

void sub_1002CCAC4(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[C] force au %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 99) = a2;
}

void sub_1002CCB9C(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[C] force re %d", (uint8_t *)v5, 8u);
  }
  *(_DWORD *)(a1 + 104) = a2;
}

void sub_1002CCFF8(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_10000BB9C(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1002CD028(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[HSC] setting force de %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 81) = a2;
}

void sub_1002CD100(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[HSC] setting force pu %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 76) = a2;
}

void sub_1002CD1D8(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[HSC] setting force ff %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 77) = a2;
}

void sub_1002CD2B0(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[HSC] setting force ba %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 78) = a2;
}

void sub_1002CD388(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[HSC] setting force au %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 79) = a2;
}

void sub_1002CD460(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[HSC] setting force gp %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 80) = a2;
}

void sub_1002CD7D4(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_10000BB9C(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1002CD7FC(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[RC] setting force de %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 108) = a2;
}

void sub_1002CD8D4(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[RC] setting force ba %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 109) = a2;
}

void sub_1002CD9AC(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[RC] setting force ro %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 111) = a2;
}

void sub_1002CDA84(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[RC] setting force re %d", (uint8_t *)v5, 8u);
  }
  *(_DWORD *)(a1 + 112) = a2;
}

void sub_1002CDEE0(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_10000BB9C(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1002CDF18(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[SC] setting force de %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 549) = a2;
}

void sub_1002CDFF0(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[SC] setting force c %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 545) = a2;
}

void sub_1002CE0C8(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[SC] setting force roc %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 546) = a2;
}

void sub_1002CE1A0(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[SC] setting force hsc %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 547) = a2;
}

void sub_1002CE278(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[SC] setting force desc %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 548) = a2;
}

void sub_1002CE350(uint64_t a1, int a2)
{
  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9208);
  }
  __int16 v4 = qword_1003DB6A8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[SC] setting force au %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 550) = a2;
}

void sub_1002CE4F8(uint64_t a1, int a2)
{
  if (qword_1003DB690 != -1) {
    dispatch_once(&qword_1003DB690, &stru_1003B9228);
  }
  __int16 v4 = qword_1003DB698;
  if (os_log_type_enabled((os_log_t)qword_1003DB698, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "setting force participation %d", (uint8_t *)v5, 8u);
  }
  *(unsigned char *)(a1 + 40) = a2;
}

void sub_1002CE894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002CE990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002CED38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002CF120(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    sub_10000BB9C(a12);
  }
  if (v12) {
    sub_10000BB9C(v12);
  }
  _Unwind_Resume(exception_object);
}

void sub_1002CF4D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002CFB84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::__shared_weak_count *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_10000BB9C(a16);
  }
  if (a9) {
    sub_10000BB9C(a9);
  }
  _Unwind_Resume(a1);
}

void sub_1002CFF08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002D00F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002D035C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002D0CD4(_Unwind_Exception *a1)
{
  __int16 v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1002D0E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002D0F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13)
{
  _Unwind_Resume(a1);
}

void sub_1002D0FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13)
{
  _Unwind_Resume(a1);
}

void sub_1002D1084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13)
{
  _Unwind_Resume(a1);
}

void sub_1002D1298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002D1340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13)
{
  _Unwind_Resume(a1);
}

void sub_1002D13E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13)
{
  _Unwind_Resume(a1);
}

void sub_1002D14B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13)
{
  _Unwind_Resume(a1);
}

void sub_1002D155C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13)
{
  _Unwind_Resume(a1);
}

void sub_1002D1600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13)
{
  _Unwind_Resume(a1);
}

void sub_1002D16D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13)
{
  _Unwind_Resume(a1);
}

void sub_1002D1778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13)
{
  _Unwind_Resume(a1);
}

void sub_1002D181C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13)
{
  _Unwind_Resume(a1);
}

void sub_1002D18C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13)
{
  _Unwind_Resume(a1);
}

void sub_1002D1E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002D2030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002D2630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002D2DA8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_1003DD728);

  _Unwind_Resume(a1);
}

void sub_1002D2EB8(id a1)
{
  uint64_t v1 = +[NSFileManager defaultManager];
  int v2 = NSTemporaryDirectory();
  int v3 = [v2 stringByAppendingPathComponent:@"kappaTestTTRSpooler"];
  [v1 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];

  __int16 v4 = [CSKappaTap2Radar alloc];
  id v5 = NSTemporaryDirectory();
  uint64_t v6 = [v5 stringByAppendingPathComponent:@"kappaTestTTRSpooler"];
  int v7 = [(CSKappaTap2Radar *)v4 initWithSpoolerFolder:v6 andConfiguration:qword_1003DD720];
  uint64_t v8 = (void *)qword_1003DD730;
  qword_1003DD730 = (uint64_t)v7;

  id v11 = 0;
  [(id)qword_1003DD730 startMonitoringWithError:&v11];
  id v9 = v11;
  if (v9)
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    int v10 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[TTR] Error monitoring for TTR test: %@", buf, 0xCu);
    }
  }
}

void sub_1002D305C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002D31C0(_Unwind_Exception *a1)
{
  int v3 = v1;

  _Unwind_Resume(a1);
}

void sub_1002D3498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002D36B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002D39A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002D3BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002D3E18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002D4394(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1002D453C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[51] uploadUserInfoWithHandler:v6];
  }
}

void sub_1002D45A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1002D485C(id a1)
{
  qword_1003DB6C8 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "KappaDetection");

  _objc_release_x1();
}

void sub_1002D48A0(id a1)
{
  qword_1003DB688 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "AnomalyEvent");

  _objc_release_x1();
}

void sub_1002D48E4(id a1)
{
  qword_1003DB718 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "Companion");

  _objc_release_x1();
}

void sub_1002D4928(id a1)
{
  qword_1003DB6A8 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "Alg");

  _objc_release_x1();
}

void sub_1002D496C(id a1)
{
  qword_1003DB698 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "Flow");

  _objc_release_x1();
}

#error "1002D4A24: call analysis failed (funcsize=63)"

#error "1002D4B50: call analysis failed (funcsize=60)"

#error "1002D4C6C: call analysis failed (funcsize=60)"

#error "1002D4D8C: call analysis failed (funcsize=63)"

#error "1002D4EBC: call analysis failed (funcsize=63)"

#error "1002D4FEC: call analysis failed (funcsize=62)"

#error "1002D5114: call analysis failed (funcsize=62)"

#error "1002D523C: call analysis failed (funcsize=62)"

#error "1002D5364: call analysis failed (funcsize=62)"

#error "1002D548C: call analysis failed (funcsize=63)"

#error "1002D55BC: call analysis failed (funcsize=63)"

#error "1002D56EC: call analysis failed (funcsize=63)"

#error "1002D581C: call analysis failed (funcsize=63)"

#error "1002D594C: call analysis failed (funcsize=63)"

#error "1002D5A78: call analysis failed (funcsize=60)"

#error "1002D5B98: call analysis failed (funcsize=63)"

#error "1002D5CC4: call analysis failed (funcsize=60)"

#error "1002D5DE4: call analysis failed (funcsize=63)"

#error "1002D5F10: call analysis failed (funcsize=60)"

#error "1002D6030: call analysis failed (funcsize=63)"

#error "1002D615C: call analysis failed (funcsize=60)"

#error "1002D627C: call analysis failed (funcsize=62)"

#error "1002D63A4: call analysis failed (funcsize=63)"

#error "1002D64D0: call analysis failed (funcsize=60)"

#error "1002D65EC: call analysis failed (funcsize=60)"

#error "1002D6708: call analysis failed (funcsize=60)"

#error "1002D6828: call analysis failed (funcsize=63)"

#error "1002D6954: call analysis failed (funcsize=60)"

#error "1002D6A70: call analysis failed (funcsize=60)"

#error "1002D6B8C: call analysis failed (funcsize=60)"

#error "1002D6CA8: call analysis failed (funcsize=60)"

#error "1002D6DC8: call analysis failed (funcsize=63)"

#error "1002D6EF4: call analysis failed (funcsize=60)"

#error "1002D7010: call analysis failed (funcsize=60)"

#error "1002D712C: call analysis failed (funcsize=60)"

#error "1002D724C: call analysis failed (funcsize=63)"

#error "1002D7378: call analysis failed (funcsize=60)"

#error "1002D7494: call analysis failed (funcsize=60)"

#error "1002D75B0: call analysis failed (funcsize=60)"

#error "1002D76CC: call analysis failed (funcsize=60)"

#error "1002D77E8: call analysis failed (funcsize=60)"

#error "1002D7904: call analysis failed (funcsize=60)"

#error "1002D7A20: call analysis failed (funcsize=60)"

void CLKappaFeaturesAlgDataIntegrityResult::CLKappaFeaturesAlgDataIntegrityResult(CLKappaFeaturesAlgDataIntegrityResult *this)
{
  *((unsigned char *)this + 8) = 0;
  *(void *)this = off_1003B9258;
  *((_DWORD *)this + 82) = 0;
}

{
  *((unsigned char *)this + 8) = 0;
  *(void *)this = off_1003B9258;
  *((_DWORD *)this + 82) = 0;
}

void CLKappaFeaturesAlgDataIntegrityResult::~CLKappaFeaturesAlgDataIntegrityResult(CLKappaFeaturesAlgDataIntegrityResult *this)
{
  CLKappaAlgBlockResult::~CLKappaAlgBlockResult(this);

  operator delete();
}

_OWORD *CLKappaFeaturesAlgDataIntegrityResult::reset(CLKappaFeaturesAlgDataIntegrityResult *this)
{
  *(_OWORD *)((char *)this + 40) = 0u;
  float result = (_OWORD *)((char *)this + 40);
  *((void *)result - 3) = 0;
  *((void *)result - 2) = 0;
  *((void *)result - 1) = 0;
  result[1] = 0u;
  result[2] = 0u;
  result[3] = 0u;
  result[4] = 0u;
  result[5] = 0u;
  result[6] = 0u;
  result[7] = 0u;
  result[8] = 0u;
  result[9] = 0u;
  result[10] = 0u;
  result[11] = 0u;
  result[12] = 0u;
  result[13] = 0u;
  result[14] = 0u;
  result[15] = 0u;
  result[16] = 0u;
  result[17] = 0u;
  return result;
}

void CLKappaFeaturesAlgDataIntegrity::CLKappaFeaturesAlgDataIntegrity(CLKappaFeaturesAlgDataIntegrity *this, uint64_t *a2)
{
  CLKappaAlgBlock::CLKappaAlgBlock((CLKappaAlgBlock *)this, a2 + 1);
  uint64_t v4 = *a2;
  uint64_t *v5 = *a2;
  *(void *)((char *)this + *(void *)(v4 - 152)) = a2[6];
  *(void *)((char *)this + *(void *)(*(void *)this - 160)) = a2[7];
  *(void *)((char *)this + *(void *)(*(void *)this - 168)) = a2[8];
  *(void *)((char *)this + *(void *)(*(void *)this - 176)) = a2[9];
  *((unsigned char *)this + 120) = 0;
  *((unsigned char *)this + 128) = 0;
  *(void *)((char *)this + 140) = 0;
  *(void *)((char *)this + 132) = 0;
  *((void *)this + 19) = 0;
  *((void *)this + 20) = 0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((unsigned char *)this + 64) = 0;
  id v6 = (std::__shared_weak_count *)operator new(0x170uLL);
  v6->__shared_owners_ = 0;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)off_1003B9ED0;
  LOBYTE(v6[1].__shared_owners_) = 0;
  v6[1].__vftable = (std::__shared_weak_count_vtbl *)off_1003B9258;
  LODWORD(v6[14].__shared_weak_owners_) = 0;
  int v7 = (std::__shared_weak_count *)*((void *)this + 2);
  *((void *)this + 1) = v6 + 1;
  *((void *)this + 2) = v6;
  if (v7)
  {
    sub_10000BB9C(v7);
    id v6 = (std::__shared_weak_count *)*((void *)this + 2);
    int v10 = (std::__shared_weak_count *)*((void *)this + 1);
    id v11 = v6;
    if (!v6) {
      goto LABEL_6;
    }
  }
  else
  {
    int v10 = v6 + 1;
    id v11 = v6;
  }
  atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_6:
  sub_1002D7E8C((uint64_t)&v10, &v12);
  long long v8 = v12;
  long long v12 = 0uLL;
  id v9 = (std::__shared_weak_count *)*((void *)this + 5);
  *((_OWORD *)this + 2) = v8;
  if (v9)
  {
    sub_10000BB9C(v9);
    if (*((void *)&v12 + 1)) {
      sub_10000BB9C(*((std::__shared_weak_count **)&v12 + 1));
    }
  }
  if (v11) {
    sub_10000BB9C(v11);
  }
  (*(void (**)(CLKappaFeaturesAlgDataIntegrity *))(*(void *)this + 304))(this);
}

void sub_1002D7E54(_Unwind_Exception *a1)
{
  uint64_t v4 = (std::__shared_weak_count *)*((void *)v1 + 7);
  if (v4) {
    sub_10000BB9C(v4);
  }
  id v5 = (std::__shared_weak_count *)*((void *)v1 + 5);
  if (v5) {
    sub_10000BB9C(v5);
  }
  CLKappaAlgBlock::~CLKappaAlgBlock(v1, v2);
  _Unwind_Resume(a1);
}

void *sub_1002D7E8C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  float result = *(void **)a1;
  if (result
  {
    uint64_t v5 = *(void *)(a1 + 8);
    *a2 = result;
    a2[1] = v5;
    if (v5) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
  }
  return result;
}

void CLKappaFeaturesAlgDataIntegrity::CLKappaFeaturesAlgDataIntegrity(CLKappaFeaturesAlgDataIntegrity *this)
{
  *(void *)this = off_100399F60;
  *((void *)this + 21) = off_10039A008;
  *((void *)this + 22) = off_10039A0D0;
  *((void *)this + 23) = off_10039A180;
  CLKappaAlgBlock::CLKappaAlgBlock((CLKappaAlgBlock *)this, (uint64_t *)off_1003B9860);
  *(void *)uint64_t v2 = off_1003B9340;
  *(void *)(v2 + 160) = 0;
  *(void *)(v2 + 168) = off_1003B95F0;
  *(void *)(v2 + 176) = off_1003B9730;
  *(void *)(v2 + 184) = off_1003B9810;
  *(unsigned char *)(v2 + 120) = 0;
  *(unsigned char *)(v2 + 128) = 0;
  *(void *)(v2 + 140) = 0;
  *(void *)(v2 + 132) = 0;
  *(void *)(v2 + 152) = 0;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(unsigned char *)(v2 + 64) = 0;
  int v3 = (std::__shared_weak_count *)operator new(0x170uLL);
  v3->__shared_owners_ = 0;
  v3->__shared_weak_owners_ = 0;
  v3->__vftable = (std::__shared_weak_count_vtbl *)off_1003B9ED0;
  LOBYTE(v3[1].__shared_owners_) = 0;
  v3[1].__vftable = (std::__shared_weak_count_vtbl *)off_1003B9258;
  LODWORD(v3[14].__shared_weak_owners_) = 0;
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 2);
  *((void *)this + 1) = v3 + 1;
  *((void *)this + 2) = v3;
  if (v4)
  {
    sub_10000BB9C(v4);
    int v3 = (std::__shared_weak_count *)*((void *)this + 2);
    int v7 = (std::__shared_weak_count *)*((void *)this + 1);
    long long v8 = v3;
    if (!v3) {
      goto LABEL_6;
    }
  }
  else
  {
    int v7 = v3 + 1;
    long long v8 = v3;
  }
  atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_6:
  sub_1002D7E8C((uint64_t)&v7, &v9);
  long long v5 = v9;
  long long v9 = 0uLL;
  id v6 = (std::__shared_weak_count *)*((void *)this + 5);
  *((_OWORD *)this + 2) = v5;
  if (v6)
  {
    sub_10000BB9C(v6);
    if (*((void *)&v9 + 1)) {
      sub_10000BB9C(*((std::__shared_weak_count **)&v9 + 1));
    }
  }
  if (v8) {
    sub_10000BB9C(v8);
  }
  (*(void (**)(CLKappaFeaturesAlgDataIntegrity *))(*(void *)this + 304))(this);
}

void sub_1002D8158(_Unwind_Exception *a1)
{
  int v3 = (std::__shared_weak_count *)*((void *)v1 + 7);
  if (v3) {
    sub_10000BB9C(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)v1 + 5);
  if (v4) {
    sub_10000BB9C(v4);
  }
  CLKappaAlgBlock::~CLKappaAlgBlock(v1, (uint64_t *)off_1003B9860);
  _Unwind_Resume(a1);
}

void CLKappaFeaturesAlgDataIntegrity::~CLKappaFeaturesAlgDataIntegrity(CLKappaFeaturesAlgDataIntegrity *this, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(void *)this = *a2;
  *(void *)((char *)this + *(void *)(v4 - 152)) = a2[6];
  *(void *)((char *)this + *(void *)(*(void *)this - 160)) = a2[7];
  *(void *)((char *)this + *(void *)(*(void *)this - 168)) = a2[8];
  *(void *)((char *)this + *(void *)(*(void *)this - 176)) = a2[9];
  long long v5 = (std::__shared_weak_count *)*((void *)this + 7);
  if (v5) {
    sub_10000BB9C(v5);
  }
  id v6 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v6) {
    sub_10000BB9C(v6);
  }

  CLKappaAlgBlock::~CLKappaAlgBlock((CLKappaAlgBlock *)this, a2 + 1);
}

void CLKappaFeaturesAlgDataIntegrity::~CLKappaFeaturesAlgDataIntegrity(CLKappaFeaturesAlgDataIntegrity *this)
{
}

{
  uint64_t vars8;

  operator delete();
}

void virtual thunk to'CLKappaFeaturesAlgDataIntegrity::~CLKappaFeaturesAlgDataIntegrity(void *a1)
{
}

{
}

{
}

{
  uint64_t vars8;

  operator delete();
}

{
  uint64_t vars8;

  operator delete();
}

{
  uint64_t vars8;

  operator delete();
}

void virtual thunk to'CLKappaFeaturesAlgDataIntegrity::~CLKappaFeaturesAlgDataIntegrity(CLKappaFeaturesAlgDataIntegrity *this)
{
}

{
  uint64_t vars8;

  operator delete();
}

uint64_t CLKappaFeaturesAlgDataIntegrity::reset(CLKappaFeaturesAlgDataIntegrity *this)
{
  uint64_t v2 = *((void *)this + 1);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }

  return TrustedAudioHelper::reset((uint64_t)this + 128);
}

void CLKappaFeaturesAlgDataIntegrity::streamInfo(CLKappaFeaturesAlgDataIntegrity *this@<X0>, NSArray *a2@<X1>, uint64_t a3@<X8>)
{
  long long v9 = a2;
  uint64_t v4 = [(NSArray *)v9 count];
  if (v4)
  {
    long long v5 = [(NSArray *)v9 objectAtIndex:0];
    id v6 = [v5 timestamp];

    int v7 = [(NSArray *)v9 objectAtIndex:v4 - 1];
    id v8 = [v7 timestamp];
  }
  else
  {
    id v8 = 0;
    id v6 = 0;
  }
  *(_DWORD *)a3 = v4;
  *(void *)(a3 + 8) = v6;
  *(void *)(a3 + 16) = v8;
}

void sub_1002D86B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t CLKappaFeaturesAlgDataIntegrity::epochFinalize(CLKappaFeaturesAlgDataIntegrity *this, NSArray *a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *((void *)this + 4);
  *(void *)(v4 + 16) = a2;
  ++*(_DWORD *)(v4 + 328);
  long long v5 = (CLKappaFeaturesAlgDataIntegrity *)*(id *)(*((void *)this + 6) + 24);
  CLKappaFeaturesAlgDataIntegrity::streamInfo(v5, (NSArray *)v5, (uint64_t)buf);
  *(_DWORD *)(v4 + 88) = *(_DWORD *)buf;
  uint64_t v6 = v83;
  *(void *)(v4 + 136) = *(void *)&buf[8];
  *(void *)(v4 + 232) = v6;

  int v7 = (CLKappaFeaturesAlgDataIntegrity *)*(id *)(*((void *)this + 6) + 32);
  CLKappaFeaturesAlgDataIntegrity::streamInfo(v7, (NSArray *)v7, (uint64_t)buf);
  *(_DWORD *)(v4 + 92) = *(_DWORD *)buf;
  uint64_t v8 = v83;
  *(void *)(v4 + 144) = *(void *)&buf[8];
  *(void *)(v4 + 240) = v8;

  long long v9 = (CLKappaFeaturesAlgDataIntegrity *)*(id *)(*((void *)this + 6) + 96);
  CLKappaFeaturesAlgDataIntegrity::streamInfo(v9, (NSArray *)v9, (uint64_t)buf);
  *(_DWORD *)(v4 + 96) = *(_DWORD *)buf;
  uint64_t v10 = v83;
  *(void *)(v4 + 152) = *(void *)&buf[8];
  *(void *)(v4 + 248) = v10;

  id v11 = (CLKappaFeaturesAlgDataIntegrity *)*(id *)(*((void *)this + 6) + 72);
  CLKappaFeaturesAlgDataIntegrity::streamInfo(v11, (NSArray *)v11, (uint64_t)buf);
  *(_DWORD *)(v4 + 100) = *(_DWORD *)buf;
  uint64_t v12 = v83;
  *(void *)(v4 + 160) = *(void *)&buf[8];
  *(void *)(v4 + 256) = v12;

  id v13 = (CLKappaFeaturesAlgDataIntegrity *)*(id *)(*((void *)this + 6) + 48);
  CLKappaFeaturesAlgDataIntegrity::streamInfo(v13, (NSArray *)v13, (uint64_t)buf);
  *(_DWORD *)(v4 + 104) = *(_DWORD *)buf;
  uint64_t v14 = v83;
  *(void *)(v4 + 168) = *(void *)&buf[8];
  *(void *)(v4 + 264) = v14;

  uint64_t v15 = (CLKappaFeaturesAlgDataIntegrity *)*(id *)(*((void *)this + 6) + 56);
  CLKappaFeaturesAlgDataIntegrity::streamInfo(v15, (NSArray *)v15, (uint64_t)buf);
  *(_DWORD *)(v4 + 108) = *(_DWORD *)buf;
  uint64_t v16 = v83;
  *(void *)(v4 + 176) = *(void *)&buf[8];
  *(void *)(v4 + 272) = v16;

  uint64_t v17 = (CLKappaFeaturesAlgDataIntegrity *)*(id *)(*((void *)this + 6) + 80);
  CLKappaFeaturesAlgDataIntegrity::streamInfo(v17, (NSArray *)v17, (uint64_t)buf);
  *(_DWORD *)(v4 + 112) = *(_DWORD *)buf;
  uint64_t v18 = v83;
  *(void *)(v4 + 184) = *(void *)&buf[8];
  *(void *)(v4 + 280) = v18;

  uint64_t v19 = (CLKappaFeaturesAlgDataIntegrity *)*(id *)(*((void *)this + 6) + 64);
  CLKappaFeaturesAlgDataIntegrity::streamInfo(v19, (NSArray *)v19, (uint64_t)buf);
  *(_DWORD *)(v4 + 116) = *(_DWORD *)buf;
  uint64_t v20 = v83;
  *(void *)(v4 + 192) = *(void *)&buf[8];
  *(void *)(v4 + 288) = v20;

  uint64_t v21 = (CLKappaFeaturesAlgDataIntegrity *)*(id *)(*((void *)this + 6) + 112);
  CLKappaFeaturesAlgDataIntegrity::streamInfo(v21, (NSArray *)v21, (uint64_t)buf);
  *(_DWORD *)(v4 + 120) = *(_DWORD *)buf;
  uint64_t v22 = v83;
  *(void *)(v4 + 200) = *(void *)&buf[8];
  *(void *)(v4 + 296) = v22;

  id v23 = (CLKappaFeaturesAlgDataIntegrity *)*(id *)(*((void *)this + 6) + 120);
  CLKappaFeaturesAlgDataIntegrity::streamInfo(v23, (NSArray *)v23, (uint64_t)buf);
  *(_DWORD *)(v4 + 124) = *(_DWORD *)buf;
  uint64_t v24 = v83;
  *(void *)(v4 + 208) = *(void *)&buf[8];
  *(void *)(v4 + 304) = v24;

  long long v25 = (CLKappaFeaturesAlgDataIntegrity *)*(id *)(*((void *)this + 6) + 128);
  CLKappaFeaturesAlgDataIntegrity::streamInfo(v25, (NSArray *)v25, (uint64_t)buf);
  *(_DWORD *)(v4 + 128) = *(_DWORD *)buf;
  uint64_t v26 = v83;
  *(void *)(v4 + 216) = *(void *)&buf[8];
  *(void *)(v4 + 312) = v26;

  long long v27 = (CLKappaFeaturesAlgDataIntegrity *)*(id *)(*((void *)this + 6) + 88);
  CLKappaFeaturesAlgDataIntegrity::streamInfo(v27, (NSArray *)v27, (uint64_t)buf);
  *(_DWORD *)(v4 + 132) = *(_DWORD *)buf;
  uint64_t v28 = v83;
  *(void *)(v4 + 224) = *(void *)&buf[8];
  *(void *)(v4 + 320) = v28;

  if (qword_1003DB6A0 != -1) {
    dispatch_once(&qword_1003DB6A0, &stru_1003B9EA0);
  }
  double v29 = (id)qword_1003DB6A8;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v77 = v2;
    int v49 = *(_DWORD *)(v4 + 88);
    int v50 = *(_DWORD *)(*((void *)this + 4) + 328);
    int v30 = *(_DWORD *)(v4 + 96);
    int v48 = *(_DWORD *)(v4 + 92);
    uint64_t v32 = *(void *)(v4 + 136);
    uint64_t v31 = *(void *)(v4 + 144);
    uint64_t v34 = *(void *)(v4 + 232);
    uint64_t v33 = *(void *)(v4 + 240);
    int v51 = *(_DWORD *)(v4 + 100);
    uint64_t v35 = *(void *)(v4 + 152);
    uint64_t v36 = *(void *)(v4 + 248);
    int v55 = *(_DWORD *)(v4 + 108);
    int v56 = *(_DWORD *)(v4 + 104);
    uint64_t v54 = *(void *)(v4 + 168);
    uint64_t v57 = *(void *)(v4 + 256);
    uint64_t v58 = *(void *)(v4 + 176);
    uint64_t v52 = *(void *)(v4 + 160);
    uint64_t v53 = *(void *)(v4 + 264);
    int v62 = *(_DWORD *)(v4 + 112);
    int v63 = *(_DWORD *)(v4 + 116);
    uint64_t v59 = *(void *)(v4 + 184);
    uint64_t v60 = *(void *)(v4 + 272);
    uint64_t v61 = *(void *)(v4 + 280);
    int v68 = *(_DWORD *)(v4 + 120);
    int v69 = *(_DWORD *)(v4 + 124);
    uint64_t v64 = *(void *)(v4 + 192);
    uint64_t v65 = *(void *)(v4 + 200);
    uint64_t v66 = *(void *)(v4 + 288);
    uint64_t v67 = *(void *)(v4 + 296);
    uint64_t v37 = *(void *)(v4 + 304);
    int v74 = *(_DWORD *)(v4 + 128);
    int v75 = *(_DWORD *)(v4 + 132);
    uint64_t v70 = *(void *)(v4 + 208);
    uint64_t v71 = *(void *)(v4 + 216);
    uint64_t v76 = *(void *)(v4 + 224);
    uint64_t v38 = *(void *)(v4 + 312);
    uint64_t v39 = *(void *)(v4 + 320);
    uint64_t v72 = v37;
    uint64_t v73 = v38;
    unint64_t v40 = +[CSTimeManager SPU_estimate_current_timestamp];
    if (*((unsigned char *)this + 120)) {
      int v41 = *((float *)this + 18) > 0.0;
    }
    else {
      int v41 = -1;
    }
    *(_DWORD *)&uint8_t buf[4] = v50;
    *(_DWORD *)&buf[10] = v49;
    uint64_t v83 = v32;
    uint64_t v85 = v34;
    int v87 = v48;
    uint64_t v89 = v31;
    uint64_t v91 = v33;
    int v93 = v30;
    uint64_t v95 = v35;
    uint64_t v97 = v36;
    *(_DWORD *)buf = 67119104;
    int v99 = v51;
    *(_WORD *)&buf[8] = 1024;
    uint64_t v101 = v52;
    *(_WORD *)&buf[14] = 2048;
    __int16 v84 = 2048;
    __int16 v86 = 1024;
    __int16 v88 = 2048;
    __int16 v90 = 2048;
    __int16 v92 = 1024;
    __int16 v94 = 2048;
    __int16 v96 = 2048;
    __int16 v98 = 1024;
    __int16 v100 = 2048;
    __int16 v102 = 2048;
    uint64_t v103 = v57;
    __int16 v104 = 1024;
    int v105 = v56;
    __int16 v106 = 2048;
    uint64_t v107 = v54;
    __int16 v108 = 2048;
    uint64_t v109 = v53;
    __int16 v110 = 1024;
    int v111 = v55;
    __int16 v112 = 2048;
    uint64_t v113 = v58;
    __int16 v114 = 2048;
    uint64_t v115 = v60;
    __int16 v116 = 1024;
    int v117 = v62;
    __int16 v118 = 2048;
    uint64_t v119 = v59;
    __int16 v120 = 2048;
    uint64_t v121 = v61;
    __int16 v122 = 1024;
    int v123 = v63;
    __int16 v124 = 2048;
    uint64_t v125 = v64;
    __int16 v126 = 2048;
    uint64_t v127 = v66;
    __int16 v128 = 1024;
    int v129 = v68;
    __int16 v130 = 2048;
    uint64_t v131 = v65;
    __int16 v132 = 2048;
    uint64_t v133 = v67;
    __int16 v134 = 1024;
    int v135 = v69;
    __int16 v136 = 2048;
    uint64_t v137 = v70;
    __int16 v138 = 2048;
    uint64_t v139 = v72;
    __int16 v140 = 1024;
    int v141 = v74;
    __int16 v142 = 2048;
    uint64_t v143 = v71;
    __int16 v144 = 2048;
    uint64_t v145 = v73;
    __int16 v146 = 1024;
    int v147 = v75;
    __int16 v148 = 2048;
    uint64_t v2 = v77;
    uint64_t v149 = v76;
    __int16 v150 = 2048;
    uint64_t v151 = v39;
    __int16 v152 = 2048;
    unint64_t v153 = v77;
    __int16 v154 = 2048;
    unint64_t v155 = v40;
    __int16 v156 = 1024;
    int v157 = v41;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "[DataIntegrity] Stream=count [min_ts max_ts] epoch %d accel800=%u [%llu %llu] hgaccel=%u [%llu %llu] trigger=%u [%llu %llu] dm6=%u [%llu %llu] gps=%u [%llu %llu] steps=%u [%llu %llu] audio=%u [%llu %llu] pressure=%u [%llu %llu] hertzSample=%u [%llu %llu] companionStatus=%u [%llu %llu] remoteSample=%u [%llu %llu] ta=%u [%llu %llu] ts %llu now %llu la=%d ", buf, 0x15Au);
  }

  float v42 = +[CSPlatformInfo sharedInstance];
  unsigned int v43 = [v42 isMDevice];

  if (v43)
  {
    uint64_t v44 = *((void *)this + 6);
    float v45 = *(NSArray **)(v44 + 88);
    float v46 = (TrustedAudioHelper *)*(id *)(v44 + 24);
    TrustedAudioHelper::summarizeTrusted(v46, v45, v2, (uint64_t)&v80);
    *(_OWORD *)buf = v80;
    uint64_t v83 = v81;
  }
  else
  {
    TrustedAudioHelper::summarizeUntrusted(*(void **)(*((void *)this + 6) + 24), (uint64_t)this + 64, (uint64_t)v2, (uint64_t)&v80);
    *(_OWORD *)buf = v80;
    uint64_t v83 = v81;
  }
  long long v78 = *(_OWORD *)buf;
  uint64_t v79 = v83;
  return TrustedAudioHelper::update((uint64_t)this + 128, (uint64_t)&v78);
}

void sub_1002D8DC4(_Unwind_Exception *exception_object)
{
}

uint64_t virtual thunk to'CLKappaFeaturesAlgDataIntegrity::epochFinalize(CLKappaFeaturesAlgDataIntegrity *this, NSArray *a2)
{
  return CLKappaFeaturesAlgDataIntegrity::epochFinalize((CLKappaFeaturesAlgDataIntegrity *)((char *)this + *(void *)(*(void *)this - 48)), a2);
}

uint64_t CLKappaFeaturesAlgDataIntegrity::epochReset(CLKappaFeaturesAlgDataIntegrity *this)
{
  uint64_t result = (*(uint64_t (**)(void))(**((void **)this + 4) + 24))(*((void *)this + 4));
  if (*((unsigned char *)this + 120)) {
    *((unsigned char *)this + 120) = 0;
  }
  return result;
}

uint64_t virtual thunk to'CLKappaFeaturesAlgDataIntegrity::epochReset(CLKappaFeaturesAlgDataIntegrity *this)
{
  uint64_t v1 = (char *)this + *(void *)(*(void *)this - 56);
  uint64_t result = (*(uint64_t (**)(void))(**((void **)v1 + 4) + 24))(*((void *)v1 + 4));
  if (v1[120]) {
    v1[120] = 0;
  }
  return result;
}

__n128 CLKappaFeaturesAlgDataIntegrity::feedFeatures(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (__n128 *)(a1 + 64);
  __n128 result = *(__n128 *)a2;
  long long v4 = *(_OWORD *)(a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  if (*(unsigned char *)(a1 + 120))
  {
    *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 80) = v4;
    *(_OWORD *)(a1 + 96) = v5;
    __n128 *v2 = result;
  }
  else
  {
    *(void *)(a1 + 112) = *(void *)(a2 + 48);
    *(_OWORD *)(a1 + 80) = v4;
    *(_OWORD *)(a1 + 96) = v5;
    __n128 *v2 = result;
    *(unsigned char *)(a1 + 120) = 1;
  }
  return result;
}

__n128 virtual thunk to'CLKappaFeaturesAlgDataIntegrity::feedFeatures(void *a1, __n128 *a2)
{
  uint64_t v2 = (__n128 *)((char *)a1 + *(void *)(*a1 - 88));
  int v3 = v2 + 4;
  __n128 result = *a2;
  __n128 v5 = a2[1];
  __n128 v6 = a2[2];
  if (v2[7].n128_u8[8])
  {
    v2[7].n128_u32[0] = a2[3].n128_u32[0];
    v2[5] = v5;
    v2[6] = v6;
    __n128 *v3 = result;
  }
  else
  {
    v2[7].n128_u64[0] = a2[3].n128_u64[0];
    v2[5] = v5;
    v2[6] = v6;
    __n128 *v3 = result;
    v2[7].n128_u8[8] = 1;
  }
  return result;
}

uint64_t sub_1002D8FB0()
{
  return 0;
}

void sub_1002D8FB8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  long long v4 = *(std::__shared_weak_count **)(a1 + 56);
  *(void *)(a1 + 48) = v3;
  *(void *)(a1 + 56) = v2;
  if (v4) {
    sub_10000BB9C(v4);
  }
}

void sub_1002D8FE4(void *a1, uint64_t *a2)
{
  uint64_t v2 = (char *)a1 + *(void *)(*a1 - 32);
  uint64_t v4 = *a2;
  uint64_t v3 = a2[1];
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  __n128 v5 = (std::__shared_weak_count *)*((void *)v2 + 7);
  *((void *)v2 + 6) = v4;
  *((void *)v2 + 7) = v3;
  if (v5) {
    sub_10000BB9C(v5);
  }
}

void sub_1002D9024(id a1)
{
  qword_1003DB6A8 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "Alg");

  _objc_release_x1();
}

void sub_1002D9068(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_1003B9ED0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1002D9088(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_1003B9ED0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_1002D90DC(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

double GPBCodedInputStreamReadDouble(void *a1)
{
  sub_1002D95F0(a1, 8);
  uint64_t v2 = a1[2];
  double result = *(double *)(*a1 + v2);
  a1[2] = v2 + 8;
  return result;
}

float GPBCodedInputStreamReadFloat(void *a1)
{
  sub_1002D95F0(a1, 4);
  uint64_t v2 = a1[2];
  float result = *(float *)(*a1 + v2);
  a1[2] = v2 + 4;
  return result;
}

uint64_t GPBCodedInputStreamReadInt64_0(uint64_t *a1)
{
  unint64_t v2 = 0;
  uint64_t v3 = 0;
  while (v2 <= 0x3F)
  {
    sub_1002D95F0(a1, 1);
    uint64_t v4 = *a1;
    uint64_t v5 = a1[2];
    a1[2] = v5 + 1;
    LOBYTE(v4) = *(unsigned char *)(v4 + v5);
    v3 |= (v4 & 0x7F) << v2;
    v2 += 7;
    if ((v4 & 0x80) == 0) {
      return v3;
    }
  }
  sub_1002D9464(-105, @"Invalid VarInt64");
  return 0;
}

uint64_t GPBCodedInputStreamReadUInt32(uint64_t *a1)
{
  return GPBCodedInputStreamReadInt64_0(a1);
}

uint64_t GPBCodedInputStreamReadInt32(uint64_t *a1)
{
  return GPBCodedInputStreamReadInt64_0(a1);
}

uint64_t GPBCodedInputStreamReadFixed64(void *a1)
{
  sub_1002D95F0(a1, 8);
  uint64_t v2 = a1[2];
  uint64_t result = *(void *)(*a1 + v2);
  a1[2] = v2 + 8;
  return result;
}

uint64_t GPBCodedInputStreamReadFixed32(void *a1)
{
  sub_1002D95F0(a1, 4);
  uint64_t v2 = a1[2];
  uint64_t result = *(unsigned int *)(*a1 + v2);
  a1[2] = v2 + 4;
  return result;
}

uint64_t GPBCodedInputStreamReadEnum(uint64_t *a1)
{
  return GPBCodedInputStreamReadInt64_0(a1);
}

uint64_t GPBCodedInputStreamReadSFixed32(void *a1)
{
  sub_1002D95F0(a1, 4);
  uint64_t v2 = a1[2];
  uint64_t result = *(unsigned int *)(*a1 + v2);
  a1[2] = v2 + 4;
  return result;
}

uint64_t GPBCodedInputStreamReadSFixed64(void *a1)
{
  sub_1002D95F0(a1, 8);
  uint64_t v2 = a1[2];
  uint64_t result = *(void *)(*a1 + v2);
  a1[2] = v2 + 8;
  return result;
}

uint64_t GPBCodedInputStreamReadSInt32(uint64_t *a1)
{
  unsigned int Int64_0 = GPBCodedInputStreamReadInt64_0(a1);
  return -(Int64_0 & 1) ^ (Int64_0 >> 1);
}

unint64_t GPBCodedInputStreamReadSInt64(uint64_t *a1)
{
  unint64_t Int64_0 = GPBCodedInputStreamReadInt64_0(a1);
  return -(uint64_t)(Int64_0 & 1) ^ (Int64_0 >> 1);
}

BOOL GPBCodedInputStreamReadBool(uint64_t *a1)
{
  return GPBCodedInputStreamReadInt64_0(a1) != 0;
}

uint64_t GPBCodedInputStreamReadTag(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a1 + 8) || v2 == *(void *)(a1 + 24))
  {
    uint64_t Int64_0 = 0;
    *(_DWORD *)(a1 + 32) = 0;
  }
  else
  {
    uint64_t Int64_0 = GPBCodedInputStreamReadInt64_0((uint64_t *)a1);
    *(_DWORD *)(a1 + 32) = Int64_0;
    if (!GPBWireFormatIsValidTag(Int64_0))
    {
      sub_1002D9464(-103, @"Invalid wireformat in tag.");
      uint64_t Int64_0 = *(unsigned int *)(a1 + 32);
    }
    if (!GPBWireFormatGetTagFieldNumber(Int64_0))
    {
      sub_1002D9464(-103, @"A zero field number on the wire is invalid.");
      return *(unsigned int *)(a1 + 32);
    }
  }
  return Int64_0;
}

BOOL GPBCodedInputStreamIsAtEnd(void *a1)
{
  uint64_t v1 = a1[2];
  return v1 == a1[1] || v1 == a1[3];
}

id sub_1002D9464(uint64_t a1, void *a2)
{
  if ([a2 length])
  {
    CFStringRef v8 = @"Reason";
    long long v9 = a2;
    uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  }
  else
  {
    uint64_t v4 = 0;
  }
  CFStringRef v6 = @"GPBCodedInputStreamUnderlyingErrorKey";
  int v7 = +[NSError errorWithDomain:@"GPBCodedInputStreamErrorDomain" code:a1 userInfo:v4];
  return [+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", @"GPBCodedInputStreamException", a2, +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1]) raise];
}

CFStringRef GPBCodedInputStreamReadRetainedString(uint64_t *a1)
{
  int Int64_0 = GPBCodedInputStreamReadInt64_0(a1);
  if (!Int64_0) {
    return &stru_1003BC4E8;
  }
  sub_1002D95F0(a1, Int64_0);
  CFStringRef result = (const __CFString *)[objc_alloc((Class)NSString) initWithBytes:*a1 + a1[2] length:Int64_0 encoding:4];
  a1[2] += Int64_0;
  if (!result)
  {
    sub_1002D9464(-104, 0);
    return 0;
  }
  return result;
}

void *sub_1002D95F0(void *result, uint64_t a2)
{
  uint64_t v2 = result;
  unint64_t v3 = result[2] + a2;
  if (v3 > result[1]) {
    CFStringRef result = sub_1002D9464(-100, 0);
  }
  unint64_t v4 = v2[3];
  if (v3 > v4)
  {
    v2[2] = v4;
    return sub_1002D9464(-101, 0);
  }
  return result;
}

id GPBCodedInputStreamReadRetainedBytes(uint64_t *a1)
{
  unsigned int Int64_0 = GPBCodedInputStreamReadInt64_0(a1);
  if ((Int64_0 & 0x80000000) != 0) {
    return 0;
  }
  sub_1002D95F0(a1, Int64_0);
  id result = [objc_alloc((Class)NSData) initWithBytes:*a1 + a1[2] length:Int64_0];
  a1[2] += Int64_0;
  return result;
}

id GPBCodedInputStreamReadRetainedBytesNoCopy(uint64_t *a1)
{
  unsigned int Int64_0 = GPBCodedInputStreamReadInt64_0(a1);
  if ((Int64_0 & 0x80000000) != 0) {
    return 0;
  }
  sub_1002D95F0(a1, Int64_0);
  id result = [objc_alloc((Class)NSData) initWithBytesNoCopy:*a1 + a1[2] length:Int64_0 freeWhenDone:0];
  a1[2] += Int64_0;
  return result;
}

unint64_t GPBCodedInputStreamPushLimit(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a1 + 24);
  unint64_t v4 = *(void *)(a1 + 16) + a2;
  if (v4 > v3) {
    sub_1002D9464(-102, 0);
  }
  *(void *)(a1 + 24) = v4;
  return v3;
}

uint64_t GPBCodedInputStreamPopLimit(uint64_t result, uint64_t a2)
{
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t GPBCodedInputStreamBytesUntilLimit(uint64_t a1)
{
  return *(void *)(a1 + 24) - *(void *)(a1 + 16);
}

_DWORD *GPBCodedInputStreamCheckLastTagWas(_DWORD *result, int a2)
{
  if (result[8] != a2) {
    return sub_1002D9464(-103, @"Unexpected tag read");
  }
  return result;
}

SEL sub_1002DAFA4(char *__s, char *str, const char *a3, int a4)
{
  if (!__s && !a3 && (a4 & 1) == 0)
  {
    return sel_getUid(str);
  }
  if (__s) {
    size_t v9 = strlen(__s);
  }
  else {
    size_t v9 = 0;
  }
  size_t v10 = strlen(str);
  size_t v11 = v10;
  if (a3)
  {
    size_t v10 = strlen(a3);
    size_t v12 = v10;
  }
  else
  {
    size_t v12 = 0;
  }
  uint64_t v19 = (uint64_t)&v19;
  size_t v13 = v11 + v9 + v12;
  uint64_t v14 = 1;
  if (a4) {
    uint64_t v14 = 2;
  }
  size_t v15 = v13 + v14;
  __chkstk_darwin(v10);
  uint64_t v17 = (char *)&v19 - v16;
  uint64_t v18 = (char *)&v19 - v16;
  if (!__s)
  {
    memcpy(v18, str, v11);
    if (!a3) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  memcpy(v18, __s, v9);
  memcpy((void *)&v17[v9], str, v11);
  v17[v9] = __toupper(v17[v9]);
  if (a3) {
LABEL_17:
  }
    memcpy((void *)&v17[v9 + v11], a3, v12);
LABEL_18:
  if (a4) {
    v17[v13] = 58;
  }
  v17[v15 - 1] = 0;
  return sel_getUid(v17);
}

uint64_t GPBFieldTag(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  unsigned int v2 = *(unsigned __int16 *)(v1 + 28);
  if ((v2 & 0xF00) != 0)
  {
    int v3 = 15;
    LOBYTE(v4) = 0;
  }
  else
  {
    int v3 = *(unsigned __int8 *)(v1 + 30);
    int v4 = (v2 >> 2) & 1;
  }
  int v5 = GPBWireFormatForType(v3, v4);
  int v6 = *(_DWORD *)(v1 + 16);

  return GPBWireFormatMakeTag(v6, v5);
}

uint64_t GPBFieldAlternateTag(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  __int16 v2 = *(_WORD *)(v1 + 28);
  if ((v2 & 2) == 0)
  {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"uint32_t GPBFieldAlternateTag(GPBFieldDescriptor *)"] file:@"GPBDescriptor.m" lineNumber:456 description:@"Only valid on repeated fields"];
    __int16 v2 = *(_WORD *)(v1 + 28);
  }
  int v3 = GPBWireFormatForType(*(unsigned __int8 *)(v1 + 30), (v2 & 4) == 0);
  int v4 = *(_DWORD *)(v1 + 16);

  return GPBWireFormatMakeTag(v4, v3);
}

void sub_1002DBEB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t GPBWireFormatMakeTag(int a1, int a2)
{
  return a2 | (8 * a1);
}

uint64_t GPBWireFormatGetTagWireType(char a1)
{
  return a1 & 7;
}

uint64_t GPBWireFormatGetTagFieldNumber(unsigned int a1)
{
  return a1 >> 3;
}

BOOL GPBWireFormatIsValidTag(int a1)
{
  return (~a1 & 6) != 0;
}

uint64_t GPBWireFormatForType(int a1, char a2)
{
  if (a2) {
    return 2;
  }
  else {
    return dword_10033F534[a1];
  }
}

void *GPBCreateMessageWithAutocreator(objc_class *a1, uint64_t a2, void *a3)
{
  int v5 = objc_alloc_init(a1);
  v5[4] = a2;
  v5[5] = a3;
  return v5;
}

BOOL GPBWasMessageAutocreatedBy(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

id GPBBecomeVisibleToAutocreator(void *a1)
{
  id result = (id)a1[4];
  if (result)
  {
    uint64_t v3 = a1[5];
    if (v3) {
      return (id)GPBSetObjectIvarWithFieldPrivate((uint64_t)result, v3, a1);
    }
    else {
      return [result setExtension:a1[6]];
    }
  }
  return result;
}

id GPBAutocreatedArrayModified(void *a1, uint64_t a2)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v4 = (void *)*((void *)[(id)objc_opt_class() descriptor] + 1);
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        size_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 fieldType] == 1
          && GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)a1, (uint64_t)v9) == a2)
        {
          if (*(unsigned __int8 *)(v9[1] + 30) - 13 >= 4) {
            size_t v11 = &OBJC_IVAR___GPBInt32Array__autocreator;
          }
          else {
            size_t v11 = &OBJC_IVAR___GPBAutocreatedArray__autocreator;
          }
          *(void *)(a2 + *v11) = 0;
          return GPBBecomeVisibleToAutocreator(a1);
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  return [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void GPBAutocreatedArrayModified(GPBMessage *, id)"], @"GPBMessage.m", 719, @"Unknown autocreated %@ for %@.", objc_opt_class(), a1 file lineNumber description];
}

id GPBAutocreatedDictionaryModified(void *a1, uint64_t a2)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v4 = (void *)*((void *)[(id)objc_opt_class() descriptor] + 1);
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        size_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 fieldType] == 2
          && GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)a1, (uint64_t)v9) == a2)
        {
          if ([v9 mapKeyDataType] == 14
            && *(unsigned __int8 *)(v9[1] + 30) - 13 < 4)
          {
            size_t v11 = &OBJC_IVAR___GPBAutocreatedDictionary__autocreator;
          }
          else
          {
            size_t v11 = &OBJC_IVAR___GPBInt32Int32Dictionary__autocreator;
          }
          *(void *)(a2 + *v11) = 0;
          return GPBBecomeVisibleToAutocreator(a1);
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  return [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void GPBAutocreatedDictionaryModified(GPBMessage *, id)"], @"GPBMessage.m", 742, @"Unknown autocreated %@ for %@.", objc_opt_class(), a1 file lineNumber description];
}

void GPBClearMessageAutocreator(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)(a1 + 32))
    {
      *(void *)(a1 + 32) = 0;

      *(void *)(a1 + 40) = 0;
      *(void *)(a1 + 48) = 0;
    }
  }
}

void GPBPrepareReadOnlySemaphore(uint64_t a1)
{
  uint64_t v1 = (atomic_ullong *)(a1 + 56);
  if (!atomic_load((unint64_t *)(a1 + 56)))
  {
    uint64_t v3 = dispatch_semaphore_create(1);
    uint64_t v4 = 0;
    atomic_compare_exchange_strong(v1, (unint64_t *)&v4, (unint64_t)v3);
    if (v4)
    {
      dispatch_release(v3);
    }
  }
}

NSError *sub_1002DCEB8(void *a1)
{
  if (!objc_msgSend(objc_msgSend(a1, "name"), "isEqual:", @"GPBCodedInputStreamException")
    || (id result = (NSError *)objc_msgSend(objc_msgSend(a1, "userInfo"), "objectForKeyedSubscript:", @"GPBCodedInputStreamUnderlyingErrorKey")) == 0)
  {
    id v3 = [a1 reason];
    if ([v3 length])
    {
      CFStringRef v5 = @"Reason";
      id v6 = v3;
      uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
    }
    else
    {
      uint64_t v4 = 0;
    }
    return +[NSError errorWithDomain:@"GPBMessageErrorDomain" code:-100 userInfo:v4];
  }
  return result;
}

void sub_1002DD530(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [a3 copyWithZone:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setObject:v5 forKey:a2];
}

NSMutableDictionary *sub_1002DD614(void *a1, uint64_t a2)
{
  if (![a1 count]) {
    return 0;
  }
  uint64_t v4 = -[NSMutableDictionary initWithCapacity:](+[NSMutableDictionary allocWithZone:](NSMutableDictionary, "allocWithZone:", a2), "initWithCapacity:", [a1 count]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = [a1 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v29;
    uint64_t v21 = *(void *)v29;
    uint64_t v22 = v4;
    do
    {
      CFStringRef v8 = 0;
      id v23 = v6;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(a1);
        }
        size_t v9 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v8);
        id v10 = [a1 objectForKey:v9];
        unsigned int v11 = *(unsigned __int8 *)(v9[1] + 44) - 15;
        if ([v9 isRepeated])
        {
          if (v11 > 1)
          {
            id v18 = [v10 mutableCopyWithZone:a2];
            goto LABEL_20;
          }
          id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v10 count]];
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v13 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v25;
            do
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v25 != v15) {
                  objc_enumerationMutation(v10);
                }
                id v17 = [*(id *)(*((void *)&v24 + 1) + 8 * i) copyWithZone:a2];
                [v12 addObject:v17];
              }
              id v14 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v14);
          }
          uint64_t v4 = v22;
          [(NSMutableDictionary *)v22 setObject:v12 forKey:v9];

          uint64_t v7 = v21;
          id v6 = v23;
        }
        else
        {
          if (v11 <= 1)
          {
            id v18 = [v10 copyWithZone:a2];
LABEL_20:
            uint64_t v19 = v18;
            [(NSMutableDictionary *)v4 setObject:v18 forKey:v9];

            goto LABEL_22;
          }
          [(NSMutableDictionary *)v4 setObject:v10 forKey:v9];
        }
LABEL_22:
        CFStringRef v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      id v6 = [a1 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v6);
  }
  return v4;
}

void *GPBGetObjectIvarWithField(uint64_t a1, void *a2)
{
  uint64_t v4 = a2[1];
  if ((*(_WORD *)(v4 + 28) & 0xF02) != 0)
  {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"id GPBGetObjectIvarWithField(GPBMessage *, GPBFieldDescriptor *)"] file:@"GPBMessage.m" lineNumber:3364 description:@"Shouldn't get here"];
    uint64_t v4 = a2[1];
  }
  if (*(unsigned __int8 *)(v4 + 30) - 15 >= 2)
  {
    if (GPBGetHasIvar(a1, *(_DWORD *)(v4 + 20), *(_DWORD *)(v4 + 16))) {
      return *(void **)(*(void *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
    }
    else {
      return [a2 defaultValue];
    }
  }
  else
  {
    id v5 = (unint64_t *)(*(void *)(a1 + 64) + *(unsigned int *)(v4 + 24));
    id v6 = (void *)atomic_load(v5);
    if (!v6)
    {
      id v6 = objc_alloc_init((Class)[a2 msgClass]);
      v6[4] = a1;
      uint64_t v7 = a2;
      uint64_t v8 = 0;
      v6[5] = v7;
      atomic_compare_exchange_strong((atomic_ullong *volatile)v5, (unint64_t *)&v8, (unint64_t)v6);
      if (v8)
      {
        GPBClearMessageAutocreator((uint64_t)v6);

        return (void *)v8;
      }
    }
  }
  return v6;
}

void sub_1002DE128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_1002DE148(void *result, void *a2, void *a3, unsigned char *a4)
{
  if (*(unsigned __int8 *)(a2[1] + 44) - 15 <= 1)
  {
    id v6 = result;
    if ([a2 isRepeated])
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id result = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (!result) {
        return result;
      }
      id v7 = result;
      uint64_t v8 = *(void *)v11;
LABEL_5:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(a3);
        }
        id result = [*(id *)(*((void *)&v10 + 1) + 8 * v9) isInitialized];
        if (!result) {
          break;
        }
        if (v7 == (id)++v9)
        {
          id result = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
          id v7 = result;
          if (result) {
            goto LABEL_5;
          }
          return result;
        }
      }
    }
    else
    {
      id result = [a3 isInitialized];
      if (result) {
        return result;
      }
    }
    *(unsigned char *)(*(void *)(v6[4] + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

uint64_t sub_1002DF46C(uint64_t a1, void *a2)
{
  [a2 containingMessageClass];
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) == 0) {
    return (uint64_t)[NSException raise:format:](NSException, @"raise:format:", NSInvalidArgumentException, @"Extension %@ used on wrong class (%@ instead of %@)", [a2 singletonName], objc_opt_class(), objc_msgSend(a2, @"containingMessageClass"));
  }
  return result;
}

uint64_t sub_1002DFE44(void *a1)
{
  uint64_t result = a1[1];
  if (!result)
  {
    a1[1] = objc_alloc_init(GPBUnknownFieldSet);
    GPBBecomeVisibleToAutocreator(a1);
    return a1[1];
  }
  return result;
}

uint64_t sub_1002E05D0(void *a1, void *a2, int a3, uint64_t a4)
{
  int v5 = *(unsigned __int8 *)(a2[1] + 30);
  id v6 = (uint64_t *)(a4 + 8);
  id v7 = GPBGetMessageRepeatedField_0(a1, a2);
  int Int32 = GPBCodedInputStreamReadInt32(v6);
  unint64_t v14 = GPBCodedInputStreamPushLimit((uint64_t)v6, Int32);
  while (GPBCodedInputStreamBytesUntilLimit((uint64_t)v6))
  {
    switch(v5)
    {
      case 0:
        uint64_t Bool = GPBCodedInputStreamReadBool(v6);
        goto LABEL_21;
      case 1:
        uint64_t Bool = GPBCodedInputStreamReadFixed32(v6);
        goto LABEL_21;
      case 2:
        uint64_t Bool = GPBCodedInputStreamReadSFixed32(v6);
        goto LABEL_21;
      case 3:
        *(float *)&double v10 = GPBCodedInputStreamReadFloat(v6);
        [v7 addValue:v10];
        break;
      case 4:
        uint64_t Bool = GPBCodedInputStreamReadFixed64(v6);
        goto LABEL_21;
      case 5:
        uint64_t Bool = GPBCodedInputStreamReadSFixed64(v6);
        goto LABEL_21;
      case 6:
        [v7 addValue:GPBCodedInputStreamReadDouble(v6)];
        break;
      case 7:
        uint64_t Bool = GPBCodedInputStreamReadInt32(v6);
        goto LABEL_21;
      case 8:
        uint64_t Bool = GPBCodedInputStreamReadInt64(v6);
        goto LABEL_21;
      case 9:
        uint64_t Bool = GPBCodedInputStreamReadSInt32(v6);
        goto LABEL_21;
      case 10:
        uint64_t Bool = GPBCodedInputStreamReadSInt64(v6);
        goto LABEL_21;
      case 11:
        uint64_t Bool = GPBCodedInputStreamReadUInt32(v6);
        goto LABEL_21;
      case 12:
        uint64_t Bool = GPBCodedInputStreamReadUInt64(v6);
LABEL_21:
        [v7 addValue:Bool];
        break;
      case 13:
      case 14:
      case 15:
      case 16:
        [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void MergeRepeatedPackedFieldFromCodedInputStream(GPBMessage *, GPBFieldDescriptor *, GPBFileSyntax, GPBCodedInputStream *)"] file:@"GPBMessage.m" lineNumber:2288 description:@"Non primitive types can't be packed"];
        break;
      case 17:
        uint64_t Enum = GPBCodedInputStreamReadEnum(v6);
        if (a3 == 3 || [a2 isValidEnumValue:Enum]) {
          [v7 addRawValue:Enum];
        }
        else {
          [(id)sub_1002DFE44(a1) mergeVarintField:*(unsigned int *)(a2[1] + 16) value:Enum];
        }
        break;
      default:
        break;
    }
  }

  return GPBCodedInputStreamPopLimit((uint64_t)v6, v14);
}

void sub_1002E0880(void *a1, void *a2, int a3, uint64_t *a4, uint64_t a5)
{
  double v10 = GPBGetMessageRepeatedField_0(a1, a2);
  long long v11 = a4 + 1;
  switch(*(unsigned char *)(a2[1] + 30))
  {
    case 0:
      GPBCodedInputStreamReadBool(v11);
      goto LABEL_12;
    case 1:
      GPBCodedInputStreamReadFixed32(v11);
      goto LABEL_12;
    case 2:
      GPBCodedInputStreamReadSFixed32(v11);
      goto LABEL_12;
    case 3:
      *(float *)&double Double = GPBCodedInputStreamReadFloat(v11);
      long long v13 = v10;
      goto LABEL_7;
    case 4:
      GPBCodedInputStreamReadFixed64(v11);
      goto LABEL_31;
    case 5:
      GPBCodedInputStreamReadSFixed64(v11);
      goto LABEL_31;
    case 6:
      double Double = GPBCodedInputStreamReadDouble(v11);
      long long v13 = v10;
      goto LABEL_7;
    case 7:
      GPBCodedInputStreamReadInt32(v11);
      goto LABEL_12;
    case 8:
      GPBCodedInputStreamReadInt64(v11);
      goto LABEL_31;
    case 9:
      GPBCodedInputStreamReadSInt32(v11);
      goto LABEL_12;
    case 0xA:
      GPBCodedInputStreamReadSInt64(v11);
      goto LABEL_31;
    case 0xB:
      GPBCodedInputStreamReadUInt32(v11);
LABEL_12:
      long long v13 = v10;
      goto LABEL_7;
    case 0xC:
      GPBCodedInputStreamReadUInt64(v11);
LABEL_31:
      long long v13 = v10;
LABEL_7:
      [v13 addValue:Double];
      return;
    case 0xD:
      RetainedBytes = GPBCodedInputStreamReadRetainedBytes(v11);
      goto LABEL_35;
    case 0xE:
      RetainedBytes = (void *)GPBCodedInputStreamReadRetainedString(v11);
LABEL_35:
      id v16 = RetainedBytes;
      id v20 = RetainedBytes;
      uint64_t v15 = v10;
      goto LABEL_36;
    case 0xF:
      id v20 = objc_alloc_init((Class)[a2 msgClass]);
      [a4 readMessage:v20 extensionRegistry:a5];
      goto LABEL_19;
    case 0x10:
      id v20 = objc_alloc_init((Class)[a2 msgClass]);
      [a4 readGroup:*(unsigned int *)(a2[1] + 16) message:v20 extensionRegistry:a5];
LABEL_19:
      uint64_t v15 = v10;
      id v16 = v20;
LABEL_36:
      [v15 addObject:v16];

      break;
    case 0x11:
      uint64_t Enum = GPBCodedInputStreamReadEnum(v11);
      if (a3 == 3 || [a2 isValidEnumValue:Enum])
      {
        [v10 addRawValue:Enum];
      }
      else
      {
        id v18 = (void *)sub_1002DFE44(a1);
        uint64_t v19 = *(unsigned int *)(a2[1] + 16);
        [v18 mergeVarintField:v19 value:Enum];
      }
      break;
    default:
      return;
  }
}

void *GPBGetMessageMapField_0(void *a1, void *a2)
{
  uint64_t v4 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)a1, (uint64_t)a2);
  if (!v4)
  {
    uint64_t v4 = sub_1002E4104(a2, 0);
    GPBSetRetainedObjectIvarWithFieldPrivate(a1, a2, v4);
  }
  return v4;
}

void *GPBGetMessageRepeatedField_0(void *a1, void *a2)
{
  uint64_t v4 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)a1, (uint64_t)a2);
  if (!v4)
  {
    uint64_t v4 = sub_1002E4984(a2, 0);
    GPBSetRetainedObjectIvarWithFieldPrivate(a1, a2, v4);
  }
  return v4;
}

void sub_1002E26B0(_Unwind_Exception *a1)
{
}

uint64_t sub_1002E27C8(uint64_t a1)
{
  uint64_t result = GPBComputeBoolSizeNoTag();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002E2804(uint64_t a1)
{
  uint64_t result = GPBComputeFixed32SizeNoTag();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002E2840(uint64_t a1)
{
  uint64_t result = GPBComputeSFixed32SizeNoTag();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002E287C(uint64_t a1)
{
  uint64_t result = GPBComputeFloatSizeNoTag();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002E28B4(uint64_t a1)
{
  uint64_t result = GPBComputeFixed64SizeNoTag();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002E28F0(uint64_t a1)
{
  uint64_t result = GPBComputeSFixed64SizeNoTag();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002E292C(uint64_t a1)
{
  uint64_t result = GPBComputeDoubleSizeNoTag();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002E2964(uint64_t a1, unsigned int a2)
{
  uint64_t result = GPBComputeInt32SizeNoTag(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002E29A0(uint64_t a1, uint64_t a2)
{
  uint64_t result = GPBComputeInt64SizeNoTag(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002E29DC(uint64_t a1, int a2)
{
  uint64_t result = GPBComputeSInt32SizeNoTag(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002E2A18(uint64_t a1, uint64_t a2)
{
  uint64_t result = GPBComputeSInt64SizeNoTag(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002E2A54(uint64_t a1, unsigned int a2)
{
  uint64_t result = GPBComputeUInt32SizeNoTag(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002E2A90(uint64_t a1, uint64_t a2)
{
  uint64_t result = GPBComputeUInt64SizeNoTag(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002E2ACC(uint64_t a1, unsigned int a2)
{
  uint64_t result = GPBComputeEnumSizeNoTag(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

BOOL sub_1002E3D28(uint64_t a1, uint64_t a2)
{
  return GPBGetHasIvar(a2, *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36));
}

void *sub_1002E3D38(uint64_t a1, void *a2, int a3)
{
  if (a3)
  {
    uint64_t v5 = objc_opt_class();
    if (*(void *)(*(void *)(a1 + 32) + 48)) {
      id v6 = *(const char **)(*(void *)(a1 + 32) + 48);
    }
    else {
      id v6 = 0;
    }
    +[NSException raise:NSInvalidArgumentException, @"%@: %@ can only be set to NO (to clear field).", v5, NSStringFromSelector(v6) format];
  }
  uint64_t v7 = *(void *)(a1 + 32);

  return GPBClearMessageField(a2, v7);
}

uint64_t sub_1002E3E14(uint64_t a1, uint64_t a2)
{
  return GPBGetHasOneof(a2, *(unsigned int *)(a1 + 32));
}

GPBAutocreatedArray *sub_1002E3E24(uint64_t a1, objc_class *a2)
{
  __int16 v2 = *(void **)(a1 + 32);
  id v3 = (unint64_t *)(*((void *)a2 + 8) + *(unsigned int *)(v2[1] + 24));
  uint64_t result = (GPBAutocreatedArray *)atomic_load(v3);
  if (!result)
  {
    uint64_t result = sub_1002E4984(v2, a2);
    uint64_t v5 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)v3, (unint64_t *)&v5, (unint64_t)result);
    if (v5)
    {
      if (*(unsigned __int8 *)(v2[1] + 30) - 13 >= 4) {
        id v6 = &OBJC_IVAR___GPBInt32Array__autocreator;
      }
      else {
        id v6 = &OBJC_IVAR___GPBAutocreatedArray__autocreator;
      }
      *(Class *)((char *)&result->super.super.super.isa + *v6) = 0;

      return (GPBAutocreatedArray *)v5;
    }
  }
  return result;
}

GPBAutocreatedDictionary *sub_1002E3EC0(uint64_t a1, objc_class *a2)
{
  __int16 v2 = *(void **)(a1 + 32);
  id v3 = (unint64_t *)(*((void *)a2 + 8) + *(unsigned int *)(v2[1] + 24));
  uint64_t v4 = (GPBAutocreatedDictionary *)atomic_load(v3);
  if (!v4)
  {
    uint64_t v4 = sub_1002E4104(*(void **)(a1 + 32), a2);
    uint64_t v5 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)v3, (unint64_t *)&v5, (unint64_t)v4);
    if (v5)
    {
      if ([v2 mapKeyDataType] == 14
        && *(unsigned __int8 *)(v2[1] + 30) - 13 < 4)
      {
        id v6 = &OBJC_IVAR___GPBAutocreatedDictionary__autocreator;
      }
      else
      {
        id v6 = &OBJC_IVAR___GPBInt32Int32Dictionary__autocreator;
      }
      *(Class *)((char *)&v4->super.super.super.isa + *v6) = 0;

      return (GPBAutocreatedDictionary *)v5;
    }
  }
  return v4;
}

uint64_t sub_1002E3F80(uint64_t a1, uint64_t a2, void *a3)
{
  return GPBSetObjectIvarWithFieldPrivate(a2, *(void *)(a1 + 32), a3);
}

id sub_1002E3F90(uint64_t a1, uint64_t a2)
{
  __int16 v2 = (void *)GPBGetObjectIvarWithFieldNoAutocreate(a2, *(void *)(a1 + 32));

  return [v2 count];
}

GPBAutocreatedDictionary *sub_1002E4104(void *a1, objc_class *a2)
{
  unsigned int v4 = [a1 mapKeyDataType];
  int v5 = *(unsigned __int8 *)(a1[1] + 30);
  switch(v4)
  {
    case 0u:
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          long long v11 = GPBBoolBoolDictionary;
          goto LABEL_74;
        case 1:
        case 0xB:
          long long v11 = GPBBoolUInt32Dictionary;
          goto LABEL_74;
        case 2:
        case 7:
        case 9:
          long long v11 = GPBBoolInt32Dictionary;
          goto LABEL_74;
        case 3:
          long long v11 = GPBBoolFloatDictionary;
          goto LABEL_74;
        case 4:
        case 0xC:
          long long v11 = GPBBoolUInt64Dictionary;
          goto LABEL_74;
        case 5:
        case 8:
        case 0xA:
          long long v11 = GPBBoolInt64Dictionary;
          goto LABEL_74;
        case 6:
          long long v11 = GPBBoolDoubleDictionary;
          goto LABEL_74;
        case 0xD:
        case 0xE:
        case 0xF:
          long long v11 = GPBBoolObjectDictionary;
          goto LABEL_74;
        case 0x10:
          id v17 = +[NSAssertionHandler currentHandler];
          uint64_t v7 = +[NSString stringWithUTF8String:"id CreateMapForField(GPBFieldDescriptor *, GPBMessage *)"];
          uint64_t v8 = v17;
          uint64_t v9 = 307;
          goto LABEL_3;
        case 0x11:
          long long v13 = GPBBoolEnumDictionary;
          goto LABEL_83;
        default:
          goto LABEL_16;
      }
    case 1u:
    case 0xBu:
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          long long v11 = GPBUInt32BoolDictionary;
          goto LABEL_74;
        case 1:
        case 0xB:
          long long v11 = GPBUInt32UInt32Dictionary;
          goto LABEL_74;
        case 2:
        case 7:
        case 9:
          long long v11 = GPBUInt32Int32Dictionary;
          goto LABEL_74;
        case 3:
          long long v11 = GPBUInt32FloatDictionary;
          goto LABEL_74;
        case 4:
        case 0xC:
          long long v11 = GPBUInt32UInt64Dictionary;
          goto LABEL_74;
        case 5:
        case 8:
        case 0xA:
          long long v11 = GPBUInt32Int64Dictionary;
          goto LABEL_74;
        case 6:
          long long v11 = GPBUInt32DoubleDictionary;
          goto LABEL_74;
        case 0xD:
        case 0xE:
        case 0xF:
          long long v11 = GPBUInt32ObjectDictionary;
          goto LABEL_74;
        case 0x10:
          uint64_t v15 = +[NSAssertionHandler currentHandler];
          uint64_t v7 = +[NSString stringWithUTF8String:"id CreateMapForField(GPBFieldDescriptor *, GPBMessage *)"];
          uint64_t v8 = v15;
          uint64_t v9 = 351;
          goto LABEL_3;
        case 0x11:
          long long v13 = GPBUInt32EnumDictionary;
          goto LABEL_83;
        default:
          goto LABEL_16;
      }
    case 2u:
    case 7u:
    case 9u:
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          long long v11 = GPBInt32BoolDictionary;
          goto LABEL_74;
        case 1:
        case 0xB:
          long long v11 = GPBInt32UInt32Dictionary;
          goto LABEL_74;
        case 2:
        case 7:
        case 9:
          long long v11 = GPBInt32Int32Dictionary;
          goto LABEL_74;
        case 3:
          long long v11 = GPBInt32FloatDictionary;
          goto LABEL_74;
        case 4:
        case 0xC:
          long long v11 = GPBInt32UInt64Dictionary;
          goto LABEL_74;
        case 5:
        case 8:
        case 0xA:
          long long v11 = GPBInt32Int64Dictionary;
          goto LABEL_74;
        case 6:
          long long v11 = GPBInt32DoubleDictionary;
          goto LABEL_74;
        case 0xD:
        case 0xE:
        case 0xF:
          long long v11 = GPBInt32ObjectDictionary;
          goto LABEL_74;
        case 0x10:
          long long v12 = +[NSAssertionHandler currentHandler];
          uint64_t v7 = +[NSString stringWithUTF8String:"id CreateMapForField(GPBFieldDescriptor *, GPBMessage *)"];
          uint64_t v8 = v12;
          uint64_t v9 = 396;
          goto LABEL_3;
        case 0x11:
          long long v13 = GPBInt32EnumDictionary;
          goto LABEL_83;
        default:
          goto LABEL_16;
      }
    case 3u:
    case 6u:
    case 0xDu:
    case 0xFu:
    case 0x10u:
    case 0x11u:
      id v6 = +[NSAssertionHandler currentHandler];
      uint64_t v7 = +[NSString stringWithUTF8String:"id CreateMapForField(GPBFieldDescriptor *, GPBMessage *)"];
      uint64_t v8 = v6;
      uint64_t v9 = 543;
LABEL_3:
      [(NSAssertionHandler *)v8 handleFailureInFunction:v7 file:@"GPBMessage.m" lineNumber:v9 description:@"shouldn't happen"];
      uint64_t result = 0;
      break;
    case 4u:
    case 0xCu:
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          long long v11 = GPBUInt64BoolDictionary;
          goto LABEL_74;
        case 1:
        case 0xB:
          long long v11 = GPBUInt64UInt32Dictionary;
          goto LABEL_74;
        case 2:
        case 7:
        case 9:
          long long v11 = GPBUInt64Int32Dictionary;
          goto LABEL_74;
        case 3:
          long long v11 = GPBUInt64FloatDictionary;
          goto LABEL_74;
        case 4:
        case 0xC:
          long long v11 = GPBUInt64UInt64Dictionary;
          goto LABEL_74;
        case 5:
        case 8:
        case 0xA:
          long long v11 = GPBUInt64Int64Dictionary;
          goto LABEL_74;
        case 6:
          long long v11 = GPBUInt64DoubleDictionary;
          goto LABEL_74;
        case 0xD:
        case 0xE:
        case 0xF:
          long long v11 = GPBUInt64ObjectDictionary;
          goto LABEL_74;
        case 0x10:
          id v16 = +[NSAssertionHandler currentHandler];
          uint64_t v7 = +[NSString stringWithUTF8String:"id CreateMapForField(GPBFieldDescriptor *, GPBMessage *)"];
          uint64_t v8 = v16;
          uint64_t v9 = 440;
          goto LABEL_3;
        case 0x11:
          long long v13 = GPBUInt64EnumDictionary;
          goto LABEL_83;
        default:
          goto LABEL_16;
      }
    case 5u:
    case 8u:
    case 0xAu:
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          long long v11 = GPBInt64BoolDictionary;
          goto LABEL_74;
        case 1:
        case 0xB:
          long long v11 = GPBInt64UInt32Dictionary;
          goto LABEL_74;
        case 2:
        case 7:
        case 9:
          long long v11 = GPBInt64Int32Dictionary;
          goto LABEL_74;
        case 3:
          long long v11 = GPBInt64FloatDictionary;
          goto LABEL_74;
        case 4:
        case 0xC:
          long long v11 = GPBInt64UInt64Dictionary;
          goto LABEL_74;
        case 5:
        case 8:
        case 0xA:
          long long v11 = GPBInt64Int64Dictionary;
          goto LABEL_74;
        case 6:
          long long v11 = GPBInt64DoubleDictionary;
          goto LABEL_74;
        case 0xD:
        case 0xE:
        case 0xF:
          long long v11 = GPBInt64ObjectDictionary;
          goto LABEL_74;
        case 0x10:
          unint64_t v14 = +[NSAssertionHandler currentHandler];
          uint64_t v7 = +[NSString stringWithUTF8String:"id CreateMapForField(GPBFieldDescriptor *, GPBMessage *)"];
          uint64_t v8 = v14;
          uint64_t v9 = 485;
          goto LABEL_3;
        case 0x11:
          long long v13 = GPBInt64EnumDictionary;
          goto LABEL_83;
        default:
          goto LABEL_16;
      }
    case 0xEu:
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          long long v11 = GPBStringBoolDictionary;
          goto LABEL_74;
        case 1:
        case 0xB:
          long long v11 = GPBStringUInt32Dictionary;
          goto LABEL_74;
        case 2:
        case 7:
        case 9:
          long long v11 = GPBStringInt32Dictionary;
          goto LABEL_74;
        case 3:
          long long v11 = GPBStringFloatDictionary;
          goto LABEL_74;
        case 4:
        case 0xC:
          long long v11 = GPBStringUInt64Dictionary;
          goto LABEL_74;
        case 5:
        case 8:
        case 0xA:
          long long v11 = GPBStringInt64Dictionary;
          goto LABEL_74;
        case 6:
          long long v11 = GPBStringDoubleDictionary;
LABEL_74:
          uint64_t result = (GPBAutocreatedDictionary *)objc_alloc_init(v11);
          if (a2) {
            goto LABEL_75;
          }
          return result;
        case 0xD:
        case 0xE:
        case 0xF:
          if (a2)
          {
            uint64_t result = objc_alloc_init(GPBAutocreatedDictionary);
            goto LABEL_77;
          }
          uint64_t result = (GPBAutocreatedDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          break;
        case 0x10:
          uint64_t v19 = +[NSAssertionHandler currentHandler];
          uint64_t v7 = +[NSString stringWithUTF8String:"id CreateMapForField(GPBFieldDescriptor *, GPBMessage *)"];
          uint64_t v8 = v19;
          uint64_t v9 = 532;
          goto LABEL_3;
        case 0x11:
          long long v13 = GPBStringEnumDictionary;
LABEL_83:
          uint64_t result = (GPBAutocreatedDictionary *)[v13 initWithValidationFunction:[objc_msgSend(objc_msgSend(a1, "enumDescriptor"), "enumVerifier")]];
          if (a2) {
            goto LABEL_75;
          }
          return result;
        default:
          goto LABEL_16;
      }
      break;
    default:
LABEL_16:
      uint64_t result = 0;
      if (a2)
      {
LABEL_75:
        if (v4 == 14 && (v5 - 13) <= 3) {
LABEL_77:
        }
          id v18 = &OBJC_IVAR___GPBAutocreatedDictionary__autocreator;
        else {
          id v18 = &OBJC_IVAR___GPBInt32Int32Dictionary__autocreator;
        }
        *(Class *)((char *)&result->super.super.super.isa + *v1_Block_object_dispose(&STACK[0x410], 8) = a2;
      }
      break;
  }
  return result;
}

GPBAutocreatedArray *sub_1002E4984(void *a1, objc_class *a2)
{
  int v3 = *(unsigned __int8 *)(a1[1] + 30);
  switch(*(unsigned char *)(a1[1] + 30))
  {
    case 0:
      int v5 = GPBBoolArray;
      goto LABEL_16;
    case 1:
    case 0xB:
      int v5 = GPBUInt32Array;
      goto LABEL_16;
    case 2:
    case 7:
    case 9:
      int v5 = GPBInt32Array;
      goto LABEL_16;
    case 3:
      int v5 = GPBFloatArray;
      goto LABEL_16;
    case 4:
    case 0xC:
      int v5 = GPBUInt64Array;
      goto LABEL_16;
    case 5:
    case 8:
    case 0xA:
      int v5 = GPBInt64Array;
      goto LABEL_16;
    case 6:
      int v5 = GPBDoubleArray;
LABEL_16:
      uint64_t result = (GPBAutocreatedArray *)objc_alloc_init(v5);
      if (a2) {
        goto LABEL_17;
      }
      return result;
    case 0xD:
    case 0xE:
    case 0xF:
    case 0x10:
      if (a2)
      {
        uint64_t result = objc_alloc_init(GPBAutocreatedArray);
LABEL_18:
        id v6 = &OBJC_IVAR___GPBAutocreatedArray__autocreator;
LABEL_20:
        *(Class *)((char *)&result->super.super.super.isa + *v6) = a2;
      }
      else
      {
        return (GPBAutocreatedArray *)objc_alloc_init((Class)NSMutableArray);
      }
      return result;
    case 0x11:
      uint64_t result = [[GPBEnumArray alloc] initWithValidationFunction:[objc_msgSend(objc_msgSend(a1, "enumDescriptor"), "enumVerifier")]];
      if (!a2) {
        return result;
      }
      goto LABEL_17;
    default:
      uint64_t result = 0;
      if (!a2) {
        return result;
      }
LABEL_17:
      if ((v3 - 13) <= 3) {
        goto LABEL_18;
      }
      id v6 = &OBJC_IVAR___GPBInt32Array__autocreator;
      goto LABEL_20;
  }
}

unint64_t sub_1002E4B30(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageBoolField(a2, *(void **)(a1 + 32));
}

id sub_1002E4B40(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageUInt32Field(a2, *(void **)(a1 + 32));
}

id sub_1002E4B50(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageInt32Field(a2, *(void **)(a1 + 32));
}

float sub_1002E4B60(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageFloatField(a2, *(void **)(a1 + 32));
}

id sub_1002E4B70(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageUInt64Field(a2, *(void **)(a1 + 32));
}

id sub_1002E4B80(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageInt64Field(a2, *(void **)(a1 + 32));
}

double sub_1002E4B90(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageDoubleField(a2, *(void **)(a1 + 32));
}

id sub_1002E4BA0(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageInt32Field(a2, *(void **)(a1 + 32));
}

id sub_1002E4BB0(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageInt64Field(a2, *(void **)(a1 + 32));
}

id sub_1002E4BC0(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageInt32Field(a2, *(void **)(a1 + 32));
}

id sub_1002E4BD0(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageInt64Field(a2, *(void **)(a1 + 32));
}

id sub_1002E4BE0(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageUInt32Field(a2, *(void **)(a1 + 32));
}

id sub_1002E4BF0(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageUInt64Field(a2, *(void **)(a1 + 32));
}

void *sub_1002E4C00(uint64_t a1, uint64_t a2)
{
  return GPBGetObjectIvarWithField(a2, *(void **)(a1 + 32));
}

void *sub_1002E4C10(uint64_t a1, uint64_t a2)
{
  return GPBGetObjectIvarWithField(a2, *(void **)(a1 + 32));
}

void *sub_1002E4C20(uint64_t a1, uint64_t a2)
{
  return GPBGetObjectIvarWithField(a2, *(void **)(a1 + 32));
}

void *sub_1002E4C30(uint64_t a1, uint64_t a2)
{
  return GPBGetObjectIvarWithField(a2, *(void **)(a1 + 32));
}

uint64_t sub_1002E4C40(uint64_t a1, void *a2)
{
  return GPBGetMessageEnumField(a2, *(void **)(a1 + 32));
}

id sub_1002E4C50(uint64_t a1, void *a2, int a3)
{
  return GPBSetBoolIvarWithFieldPrivate(a2, *(void *)(a1 + 32), a3);
}

id sub_1002E4C60(uint64_t a1, void *a2, int a3)
{
  return GPBSetUInt32IvarWithFieldPrivate(a2, *(void *)(a1 + 32), a3);
}

id sub_1002E4C70(uint64_t a1, void *a2, int a3)
{
  return GPBSetInt32IvarWithFieldPrivate(a2, *(void *)(a1 + 32), a3);
}

id sub_1002E4C80(uint64_t a1, void *a2, float a3)
{
  return GPBSetFloatIvarWithFieldPrivate(a2, *(void *)(a1 + 32), a3);
}

id sub_1002E4C90(uint64_t a1, void *a2, uint64_t a3)
{
  return GPBSetUInt64IvarWithFieldPrivate(a2, *(void *)(a1 + 32), a3);
}

id sub_1002E4CA0(uint64_t a1, void *a2, uint64_t a3)
{
  return GPBSetInt64IvarWithFieldPrivate(a2, *(void *)(a1 + 32), a3);
}

id sub_1002E4CB0(uint64_t a1, void *a2, double a3)
{
  return GPBSetDoubleIvarWithFieldPrivate(a2, *(void *)(a1 + 32), a3);
}

id sub_1002E4CC0(uint64_t a1, void *a2, int a3)
{
  return GPBSetInt32IvarWithFieldPrivate(a2, *(void *)(a1 + 32), a3);
}

id sub_1002E4CD0(uint64_t a1, void *a2, uint64_t a3)
{
  return GPBSetInt64IvarWithFieldPrivate(a2, *(void *)(a1 + 32), a3);
}

id sub_1002E4CE0(uint64_t a1, void *a2, int a3)
{
  return GPBSetInt32IvarWithFieldPrivate(a2, *(void *)(a1 + 32), a3);
}

id sub_1002E4CF0(uint64_t a1, void *a2, uint64_t a3)
{
  return GPBSetInt64IvarWithFieldPrivate(a2, *(void *)(a1 + 32), a3);
}

id sub_1002E4D00(uint64_t a1, void *a2, int a3)
{
  return GPBSetUInt32IvarWithFieldPrivate(a2, *(void *)(a1 + 32), a3);
}

id sub_1002E4D10(uint64_t a1, void *a2, uint64_t a3)
{
  return GPBSetUInt64IvarWithFieldPrivate(a2, *(void *)(a1 + 32), a3);
}

id sub_1002E4D20(uint64_t a1, void *a2, void *a3)
{
  unsigned int v4 = *(void **)(a1 + 32);
  id v5 = [a3 copy];

  return GPBSetRetainedObjectIvarWithFieldPrivate(a2, v4, v5);
}

id sub_1002E4D68(uint64_t a1, void *a2, void *a3)
{
  unsigned int v4 = *(void **)(a1 + 32);
  id v5 = [a3 copy];

  return GPBSetRetainedObjectIvarWithFieldPrivate(a2, v4, v5);
}

uint64_t sub_1002E4DB0(uint64_t a1, uint64_t a2, void *a3)
{
  return GPBSetObjectIvarWithFieldPrivate(a2, *(void *)(a1 + 32), a3);
}

uint64_t sub_1002E4DC0(uint64_t a1, uint64_t a2, void *a3)
{
  return GPBSetObjectIvarWithFieldPrivate(a2, *(void *)(a1 + 32), a3);
}

id sub_1002E4DD0(uint64_t a1, void *a2, uint64_t a3)
{
  return GPBSetEnumIvarWithFieldPrivate(a2, *(void **)(a1 + 32), a3);
}

void sub_1002E5590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
}

uint64_t sub_1002E55C0(uint64_t a1, unint64_t a2)
{
  uint64_t result = GPBComputeUInt64Size(*(_DWORD *)(a1 + 40), a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002E55FC(uint64_t a1)
{
  uint64_t result = GPBComputeFixed32Size(*(_DWORD *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002E5638(uint64_t a1)
{
  uint64_t result = GPBComputeFixed64Size(*(_DWORD *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

id sub_1002E5B40(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"\t%llu\n", a2];
}

id sub_1002E5B70(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"\t%u\n", a2];
}

id sub_1002E5BA0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"\t%llu\n", a2];
}

uint64_t GPBEmptyNSData()
{
  if (qword_1003DD750 != -1) {
    dispatch_once(&qword_1003DD750, &stru_1003BA380);
  }
  return qword_1003DD758;
}

void sub_1002E608C(id a1)
{
  qword_1003DD758 = (uint64_t)objc_alloc_init((Class)NSData);
}

id GPBMessageDropUnknownFieldsRecursively(id result)
{
  if (result)
  {
    uint64_t v1 = +[NSMutableArray arrayWithObject:result];
    uint64_t result = [(NSMutableArray *)v1 count];
    if (result)
    {
      long long v29 = v41;
      long long v30 = v43;
      long long v31 = v39;
      long long v27 = v37;
      long long v28 = v45;
      long long v26 = v47;
      do
      {
        __int16 v2 = [(NSMutableArray *)v1 lastObject];
        [(NSMutableArray *)v1 removeLastObject];
        [v2 setUnknownFields:0];
        int v3 = [(id)objc_opt_class() descriptor];
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        unsigned int v4 = (void *)v3[1];
        id v5 = [v4 countByEnumeratingWithState:&v48 objects:v53 count:16];
        if (v5)
        {
          id v6 = v5;
          uint64_t v7 = *(void *)v49;
          do
          {
            for (i = 0; i != v6; i = (char *)i + 1)
            {
              if (*(void *)v49 != v7) {
                objc_enumerationMutation(v4);
              }
              uint64_t v9 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              if (*(unsigned __int8 *)(v9[1] + 30) - 15 <= 1)
              {
                unsigned int v10 = [*(id *)(*((void *)&v48 + 1) + 8 * i) fieldType];
                if (v10 == 2)
                {
                  uint64_t v15 = v2[8];
                  if (v15) {
                    id v16 = *(void **)(v15 + *(unsigned int *)(v9[1] + 24));
                  }
                  else {
                    id v16 = 0;
                  }
                  switch([v9 mapKeyDataType])
                  {
                    case 0u:
                      v46[0] = _NSConcreteStackBlock;
                      v46[1] = 3221225472;
                      v47[0] = sub_1002E66C0;
                      v47[1] = &unk_1003BA3A8;
                      v47[2] = v1;
                      id v17 = v46;
                      goto LABEL_34;
                    case 1u:
                    case 0xBu:
                      v44[0] = _NSConcreteStackBlock;
                      v44[1] = 3221225472;
                      v45[0] = sub_1002E66C8;
                      v45[1] = &unk_1003BA3D0;
                      v45[2] = v1;
                      id v17 = v44;
                      goto LABEL_34;
                    case 2u:
                    case 7u:
                    case 9u:
                      v42[0] = _NSConcreteStackBlock;
                      v42[1] = 3221225472;
                      v43[0] = sub_1002E66D0;
                      v43[1] = &unk_1003BA3F8;
                      v43[2] = v1;
                      id v17 = v42;
                      goto LABEL_34;
                    case 3u:
                    case 6u:
                    case 0xDu:
                    case 0xFu:
                    case 0x10u:
                    case 0x11u:
                      [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void GPBMessageDropUnknownFieldsRecursively(GPBMessage * _Nonnull)"] file:@"GPBUtilities.m" lineNumber:174 description:@"Aren't valid key types."];
                      continue;
                    case 4u:
                    case 0xCu:
                      v40[0] = _NSConcreteStackBlock;
                      v40[1] = 3221225472;
                      v41[0] = sub_1002E66D8;
                      v41[1] = &unk_1003BA420;
                      v41[2] = v1;
                      id v17 = v40;
                      goto LABEL_34;
                    case 5u:
                    case 8u:
                    case 0xAu:
                      v38[0] = _NSConcreteStackBlock;
                      v38[1] = 3221225472;
                      v39[0] = sub_1002E66E0;
                      v39[1] = &unk_1003BA448;
                      v39[2] = v1;
                      id v17 = v38;
                      goto LABEL_34;
                    case 0xEu:
                      v36[0] = _NSConcreteStackBlock;
                      v36[1] = 3221225472;
                      v37[0] = sub_1002E66E8;
                      v37[1] = &unk_1003BA470;
                      v37[2] = v1;
                      id v17 = v36;
LABEL_34:
                      [v16 enumerateKeysAndObjectsUsingBlock:v17];
                      break;
                    default:
                      continue;
                  }
                }
                else if (v10 == 1)
                {
                  uint64_t v13 = v2[8];
                  if (v13) {
                    unint64_t v14 = *(void **)(v13 + *(unsigned int *)(v9[1] + 24));
                  }
                  else {
                    unint64_t v14 = 0;
                  }
                  if ([v14 count]) {
                    [(NSMutableArray *)v1 addObjectsFromArray:v14];
                  }
                }
                else if (!v10 && GPBGetHasIvar((uint64_t)v2, *(_DWORD *)(v9[1] + 20), *(_DWORD *)(v9[1] + 16)))
                {
                  uint64_t v11 = v2[8];
                  if (v11) {
                    uint64_t v12 = *(void *)(v11 + *(unsigned int *)(v9[1] + 24));
                  }
                  else {
                    uint64_t v12 = 0;
                  }
                  [(NSMutableArray *)v1 addObject:v12];
                }
              }
            }
            id v6 = [v4 countByEnumeratingWithState:&v48 objects:v53 count:16];
          }
          while (v6);
        }
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v18 = [v2 extensionsCurrentlySet];
        id v19 = [v18 countByEnumeratingWithState:&v32 objects:v52 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v33;
          do
          {
            for (j = 0; j != v20; j = (char *)j + 1)
            {
              if (*(void *)v33 != v21) {
                objc_enumerationMutation(v18);
              }
              id v23 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
              if ([v23 dataType] - 15 <= 1)
              {
                unsigned int v24 = [v23 isRepeated];
                id v25 = [v2 getExtension:v23];
                if (v24) {
                  [(NSMutableArray *)v1 addObjectsFromArray:v25];
                }
                else {
                  [(NSMutableArray *)v1 addObject:v25];
                }
              }
            }
            id v20 = [v18 countByEnumeratingWithState:&v32 objects:v52 count:16];
          }
          while (v20);
        }
        uint64_t result = [(NSMutableArray *)v1 count];
      }
      while (result);
    }
  }
  return result;
}

uint64_t GPBGetObjectIvarWithFieldNoAutocreate(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2) {
    return *(void *)(v2 + *(unsigned int *)(*(void *)(a2 + 8) + 24));
  }
  else {
    return 0;
  }
}

id sub_1002E66C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

id sub_1002E66C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

id sub_1002E66D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

id sub_1002E66D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

id sub_1002E66E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

id sub_1002E66E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

id GPBCheckRuntimeVersionSupport(id result)
{
  if ((int)result >= 30005) {
    return +[NSException raise:NSInternalInconsistencyException, @"Linked to ProtocolBuffer runtime version %d, but code compiled needing at least %d!", 30004, result format];
  }
  if ((int)result <= 30000) {
    return +[NSException raise:NSInternalInconsistencyException, @"Proto generation source compiled against runtime version %d, but this version of the runtime only supports back to %d!", result, 30001 format];
  }
  return result;
}

id GPBCheckRuntimeVersionInternal(id result)
{
  if (result != 30001) {
    return +[NSException raise:NSInternalInconsistencyException, @"Linked to ProtocolBuffer runtime version %d, but code compiled with version %d!", 30001, result, v1, v2 format];
  }
  return result;
}

BOOL GPBMessageHasFieldNumberSet(void *a1, uint64_t a2)
{
  id v3 = [objc_msgSend(a1, "descriptor") fieldWithNumber:a2];

  return GPBMessageHasFieldSet((uint64_t)a1, (uint64_t)v3);
}

BOOL GPBMessageHasFieldSet(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (!a1 || !a2) {
    return v2;
  }
  uint64_t v3 = *(void *)(a2 + 8);
  if ((*(_WORD *)(v3 + 28) & 0xF02) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if (v4) {
      id v5 = *(void **)(v4 + *(unsigned int *)(v3 + 24));
    }
    else {
      id v5 = 0;
    }
    return [v5 count] != 0;
  }
  int v7 = *(_DWORD *)(v3 + 16);
  unsigned int v6 = *(_DWORD *)(v3 + 20);

  return GPBGetHasIvar(a1, v6, v7);
}

void *GPBClearMessageField(void *a1, uint64_t a2)
{
  uint64_t result = (void *)GPBGetHasIvar((uint64_t)a1, *(_DWORD *)(*(void *)(a2 + 8) + 20), *(_DWORD *)(*(void *)(a2 + 8) + 16));
  if (result)
  {
    uint64_t v5 = *(void *)(a2 + 8);
    if ((*(_WORD *)(v5 + 28) & 0xF02) != 0 || *(unsigned __int8 *)(v5 + 30) - 13 <= 3)
    {
      uint64_t v6 = a1[8];
      uint64_t v7 = *(unsigned int *)(v5 + 24);

      *(void *)(v6 + v7) = 0;
    }
    int v9 = *(_DWORD *)(v5 + 16);
    unsigned int v8 = *(_DWORD *)(v5 + 20);
    return GPBSetHasIvar(a1, v8, v9, 0);
  }
  return result;
}

void *GPBSetHasIvar(void *result, unsigned int a2, int a3, int a4)
{
  uint64_t v6 = result;
  if ((a2 & 0x80000000) != 0)
  {
    if (!a3) {
      uint64_t result = [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void GPBSetHasIvar(GPBMessage *, int32_t, uint32_t, BOOL)"] file:@"GPBUtilities.m" lineNumber:328 description:@"Invalid field number."];
    }
    if (a4) {
      int v12 = a3;
    }
    else {
      int v12 = 0;
    }
    *(_DWORD *)(v6[8] + 4 * -a2) = v12;
  }
  else
  {
    if (a2 == 0x7FFFFFFF) {
      uint64_t result = [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void GPBSetHasIvar(GPBMessage *, int32_t, uint32_t, BOOL)"] file:@"GPBUtilities.m" lineNumber:332 description:@"Invalid has bit."];
    }
    uint64_t v7 = v6[8];
    unsigned int v8 = a2 >> 5;
    int v9 = 1 << a2;
    if (a4) {
      int v10 = *(_DWORD *)(v7 + 4 * v8) | v9;
    }
    else {
      int v10 = *(_DWORD *)(v7 + 4 * v8) & ~v9;
    }
    *(_DWORD *)(v7 + 4 * v_Block_object_dispose(&STACK[0x410], 8) = v10;
  }
  return result;
}

void *GPBClearOneof(void *a1, id *a2)
{
  uint64_t v4 = *(unsigned int *)(*((void *)[a2[2] objectAtIndexedSubscript:0] + 1) + 20);

  return sub_1002E6B0C(a1, a2, v4, 0);
}

void *sub_1002E6B0C(void *a1, void *a2, uint64_t a3, int a4)
{
  unsigned int v5 = a3;
  uint64_t result = (void *)GPBGetHasOneof((uint64_t)a1, a3);
  if (result != a4)
  {
    int v9 = result;
    if (result)
    {
      int v10 = [a2 fieldWithNumber:result];
      if (v10)
      {
        uint64_t v11 = v10[1];
        if ((*(_WORD *)(v11 + 28) & 0xF02) != 0 || *(unsigned __int8 *)(v11 + 30) - 13 <= 3)
        {
          uint64_t v12 = a1[8];
          uint64_t v13 = *(unsigned int *)(v11 + 24);

          *(void *)(v12 + v13) = 0;
        }
      }
      else
      {
        [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void GPBMaybeClearOneofPrivate(GPBMessage *, GPBOneofDescriptor *, int32_t, uint32_t)"], @"GPBUtilities.m", 359, @"%@: oneof set to something (%u) not in the oneof?", objc_opt_class(), v9 file lineNumber description];
      }
      return GPBSetHasIvar(a1, v5, 1, 0);
    }
  }
  return result;
}

BOOL GPBGetHasIvar(uint64_t a1, unsigned int a2, int a3)
{
  if (*(void *)(a1 + 64))
  {
    if ((a2 & 0x80000000) == 0)
    {
LABEL_3:
      if (a2 == 0x7FFFFFFF) {
        [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"BOOL GPBGetHasIvar(GPBMessage *, int32_t, uint32_t)"] file:@"GPBUtilities.m" lineNumber:309 description:@"Invalid has bit."];
      }
      return (*(_DWORD *)(*(void *)(a1 + 64) + 4 * (a2 >> 5)) >> a2) & 1;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"BOOL GPBGetHasIvar(GPBMessage *, int32_t, uint32_t)"], @"GPBUtilities.m", 303, @"%@: All messages should have storage (from init)", objc_opt_class() file lineNumber description];
    if ((a2 & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  if (!a3) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"BOOL GPBGetHasIvar(GPBMessage *, int32_t, uint32_t)"] file:@"GPBUtilities.m" lineNumber:305 description:@"Invalid field number."];
  }
  return *(_DWORD *)(*(void *)(a1 + 64) + 4 * -a2) == a3;
}

uint64_t GPBGetHasOneof(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  if ((a2 & 0x80000000) == 0) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"uint32_t GPBGetHasOneof(GPBMessage *, int32_t)"], @"GPBUtilities.m", 320, @"%@: invalid index (%d) for oneof.", objc_opt_class(), a2 file lineNumber description];
  }
  return *(unsigned int *)(*(void *)(a1 + 64) - 4 * v2);
}

void GPBClearAutocreatedMessageIvarWithField(uint64_t a1, uint64_t a2)
{
  if (!GPBGetHasIvar(a1, *(_DWORD *)(*(void *)(a2 + 8) + 20), *(_DWORD *)(*(void *)(a2 + 8) + 16)))
  {
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v5 = *(unsigned int *)(*(void *)(a2 + 8) + 24);
    uint64_t v6 = *(void *)(v4 + v5);
    id v7 = (id)v6;
    *(void *)(v4 + v5) = 0;
    GPBClearMessageAutocreator(v6);
  }
}

uint64_t GPBSetObjectIvarWithFieldPrivate(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;

  return GPBSetRetainedObjectIvarWithFieldPrivate(a1, a2, v5);
}

id GPBSetRetainedObjectIvarWithFieldPrivate(void *a1, void *a2, void *a3)
{
  if (!a1[8]) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void GPBSetRetainedObjectIvarWithFieldPrivate(GPBMessage *, GPBFieldDescriptor *, id)"], @"GPBUtilities.m", 553, @"%@: All messages should have storage (from init)", objc_opt_class() file lineNumber description];
  }
  uint64_t v6 = a2[1];
  int v7 = *(unsigned __int8 *)(v6 + 30);
  __int16 v8 = *(_WORD *)(v6 + 28);
  if ((v8 & 0xF02) != 0)
  {
    uint64_t v9 = a1[8];
    uint64_t v10 = *(unsigned int *)(v6 + 24);
    uint64_t v11 = *(char **)(v9 + v10);
    *(void *)(v9 + v10) = a3;
    if (!v11) {
      goto LABEL_27;
    }
    if ([a2 fieldType] == 1)
    {
      if ((v7 - 13) <= 3)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = &OBJC_IVAR___GPBAutocreatedArray__autocreator;
          goto LABEL_24;
        }
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v12 = &OBJC_IVAR___GPBInt32Array__autocreator;
    }
    else if ([a2 mapKeyDataType] == 14 && (v7 - 13) <= 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_26;
      }
      uint64_t v12 = &OBJC_IVAR___GPBAutocreatedDictionary__autocreator;
    }
    else
    {
      uint64_t v12 = &OBJC_IVAR___GPBInt32Int32Dictionary__autocreator;
    }
LABEL_24:
    uint64_t v17 = *v12;
    if (*(void **)&v11[v17] == a1) {
      *(void *)&v11[v17] = 0;
    }
    goto LABEL_26;
  }
  uint64_t v13 = (void *)a2[2];
  if (v13)
  {
    sub_1002E6B0C(a1, v13, *(unsigned int *)(v6 + 20), *(_DWORD *)(v6 + 16));
    __int16 v8 = *(_WORD *)(v6 + 28);
  }
  BOOL v14 = a3 != 0;
  if ((v8 & 0x20) != 0 && ![a3 length])
  {

    BOOL v14 = 0;
    a3 = 0;
  }
  GPBSetHasIvar(a1, *(_DWORD *)(v6 + 20), *(_DWORD *)(v6 + 16), v14);
  uint64_t v15 = a1[8];
  uint64_t v16 = *(unsigned int *)(v6 + 24);
  uint64_t v11 = *(char **)(v15 + v16);
  *(void *)(v15 + v16) = a3;
  if (v11)
  {
    if ((v7 - 15) <= 1 && GPBWasMessageAutocreatedBy((uint64_t)v11, (uint64_t)a1)) {
      GPBClearMessageAutocreator((uint64_t)v11);
    }
    goto LABEL_26;
  }
LABEL_27:

  return GPBBecomeVisibleToAutocreator(a1);
}

uint64_t GPBGetMessageEnumField(void *a1, void *a2)
{
  id v4 = GPBGetMessageInt32Field((uint64_t)a1, a2);
  if (objc_msgSend(objc_msgSend(objc_msgSend(a1, "descriptor"), "file"), "syntax") == 3)
  {
    if ([a2 isValidEnumValue:v4]) {
      return v4;
    }
    else {
      return 4222467823;
    }
  }
  return (uint64_t)v4;
}

id GPBGetMessageInt32Field(uint64_t a1, void *a2)
{
  if (GPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16))) {
    return (id)*(unsigned int *)(*(void *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  }
  else {
    return [a2 defaultValue];
  }
}

id GPBSetEnumIvarWithFieldPrivate(void *a1, void *a2, uint64_t a3)
{
  if ((objc_msgSend(a2, "isValidEnumValue:") & 1) == 0) {
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, @"%@.%@: Attempt to set an unknown enum value (%d)", objc_opt_class(), [a2 name], a3);
  }

  return GPBSetInt32IvarWithFieldPrivate(a1, (uint64_t)a2, a3);
}

id GPBSetInt32IvarWithFieldPrivate(void *a1, uint64_t a2, int a3)
{
  uint64_t v6 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 8);
  if (v6) {
    sub_1002E6B0C(a1, v6, *(unsigned int *)(v7 + 20), *(_DWORD *)(v7 + 16));
  }
  *(_DWORD *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  if (a3) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = (*(_WORD *)(v7 + 28) & 0x20) == 0;
  }
  GPBSetHasIvar(a1, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16), v8);

  return GPBBecomeVisibleToAutocreator(a1);
}

unint64_t GPBGetMessageBoolField(uint64_t a1, void *a2)
{
  if (!GPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16))) {
    return (unint64_t)[a2 defaultValue] & 1;
  }
  uint64_t v4 = a2[1];
  unsigned int v5 = *(_DWORD *)(v4 + 24);
  int v6 = *(_DWORD *)(v4 + 16);

  return GPBGetHasIvar(a1, v5, v6);
}

void *GPBSetMessageBoolField(void *a1, uint64_t a2, int a3)
{
  if (a1)
  {
    if (a2) {
      return GPBSetBoolIvarWithFieldPrivate(a1, a2, a3);
    }
  }
  return a1;
}

id GPBSetBoolIvarWithFieldPrivate(void *a1, uint64_t a2, int a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  int v6 = *(void **)(a2 + 16);
  if (v6) {
    sub_1002E6B0C(a1, v6, *(unsigned int *)(v5 + 20), *(_DWORD *)(v5 + 16));
  }
  GPBSetHasIvar(a1, *(_DWORD *)(v5 + 24), *(_DWORD *)(v5 + 16), a3);
  int v7 = (a3 & 1) != 0 || (*(_WORD *)(v5 + 28) & 0x20) == 0;
  GPBSetHasIvar(a1, *(_DWORD *)(v5 + 20), *(_DWORD *)(v5 + 16), v7);

  return GPBBecomeVisibleToAutocreator(a1);
}

void *GPBSetMessageInt32Field(void *a1, uint64_t a2, int a3)
{
  if (a1)
  {
    if (a2) {
      return GPBSetInt32IvarWithFieldPrivate(a1, a2, a3);
    }
  }
  return a1;
}

id GPBGetMessageUInt32Field(uint64_t a1, void *a2)
{
  if (GPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16))) {
    return (id)*(unsigned int *)(*(void *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  }
  else {
    return [a2 defaultValue];
  }
}

void *GPBSetMessageUInt32Field(void *a1, uint64_t a2, int a3)
{
  if (a1)
  {
    if (a2) {
      return GPBSetUInt32IvarWithFieldPrivate(a1, a2, a3);
    }
  }
  return a1;
}

id GPBSetUInt32IvarWithFieldPrivate(void *a1, uint64_t a2, int a3)
{
  int v6 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 8);
  if (v6) {
    sub_1002E6B0C(a1, v6, *(unsigned int *)(v7 + 20), *(_DWORD *)(v7 + 16));
  }
  *(_DWORD *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  if (a3) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = (*(_WORD *)(v7 + 28) & 0x20) == 0;
  }
  GPBSetHasIvar(a1, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16), v8);

  return GPBBecomeVisibleToAutocreator(a1);
}

id GPBGetMessageInt64Field(uint64_t a1, void *a2)
{
  if (GPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16))) {
    return *(id *)(*(void *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  }

  return [a2 defaultValue];
}

void *GPBSetMessageInt64Field(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a2) {
      return GPBSetInt64IvarWithFieldPrivate(a1, a2, a3);
    }
  }
  return a1;
}

id GPBSetInt64IvarWithFieldPrivate(void *a1, uint64_t a2, uint64_t a3)
{
  int v6 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 8);
  if (v6) {
    sub_1002E6B0C(a1, v6, *(unsigned int *)(v7 + 20), *(_DWORD *)(v7 + 16));
  }
  *(void *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  if (a3) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = (*(_WORD *)(v7 + 28) & 0x20) == 0;
  }
  GPBSetHasIvar(a1, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16), v8);

  return GPBBecomeVisibleToAutocreator(a1);
}

id GPBGetMessageUInt64Field(uint64_t a1, void *a2)
{
  if (GPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16))) {
    return *(id *)(*(void *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  }

  return [a2 defaultValue];
}

void *GPBSetMessageUInt64Field(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a2) {
      return GPBSetUInt64IvarWithFieldPrivate(a1, a2, a3);
    }
  }
  return a1;
}

id GPBSetUInt64IvarWithFieldPrivate(void *a1, uint64_t a2, uint64_t a3)
{
  int v6 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 8);
  if (v6) {
    sub_1002E6B0C(a1, v6, *(unsigned int *)(v7 + 20), *(_DWORD *)(v7 + 16));
  }
  *(void *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  if (a3) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = (*(_WORD *)(v7 + 28) & 0x20) == 0;
  }
  GPBSetHasIvar(a1, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16), v8);

  return GPBBecomeVisibleToAutocreator(a1);
}

float GPBGetMessageFloatField(uint64_t a1, void *a2)
{
  if (GPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16))) {
    return *(float *)(*(void *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  }
  LODWORD(result) = [a2 defaultValue];
  return result;
}

void *GPBSetMessageFloatField(void *a1, uint64_t a2, float a3)
{
  if (a1)
  {
    if (a2) {
      return GPBSetFloatIvarWithFieldPrivate(a1, a2, a3);
    }
  }
  return a1;
}

id GPBSetFloatIvarWithFieldPrivate(void *a1, uint64_t a2, float a3)
{
  int v6 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 8);
  if (v6) {
    sub_1002E6B0C(a1, v6, *(unsigned int *)(v7 + 20), *(_DWORD *)(v7 + 16));
  }
  *(float *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  int v8 = a3 != 0.0 || (*(_WORD *)(v7 + 28) & 0x20) == 0;
  GPBSetHasIvar(a1, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16), v8);

  return GPBBecomeVisibleToAutocreator(a1);
}

double GPBGetMessageDoubleField(uint64_t a1, void *a2)
{
  if (GPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16))) {
    return *(double *)(*(void *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  }
  else {
    return COERCE_DOUBLE([a2 defaultValue]);
  }
}

void *GPBSetMessageDoubleField(void *a1, uint64_t a2, double a3)
{
  if (a1)
  {
    if (a2) {
      return GPBSetDoubleIvarWithFieldPrivate(a1, a2, a3);
    }
  }
  return a1;
}

id GPBSetDoubleIvarWithFieldPrivate(void *a1, uint64_t a2, double a3)
{
  int v6 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 8);
  if (v6) {
    sub_1002E6B0C(a1, v6, *(unsigned int *)(v7 + 20), *(_DWORD *)(v7 + 16));
  }
  *(double *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  int v8 = a3 != 0.0 || (*(_WORD *)(v7 + 28) & 0x20) == 0;
  GPBSetHasIvar(a1, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16), v8);

  return GPBBecomeVisibleToAutocreator(a1);
}

void *GPBSetMessageStringField(void *result, void *a2, void *a3)
{
  if (result && a2)
  {
    uint64_t v4 = result;
    id v5 = [a3 copy];
    return GPBSetRetainedObjectIvarWithFieldPrivate(v4, a2, v5);
  }
  return result;
}

void *GPBSetMessageBytesField(void *result, void *a2, void *a3)
{
  if (result && a2)
  {
    uint64_t v4 = result;
    id v5 = [a3 copy];
    return GPBSetRetainedObjectIvarWithFieldPrivate(v4, a2, v5);
  }
  return result;
}

void *GPBSetMessageGroupField_0(void *result, void *a2, void *a3)
{
  if (result && a2)
  {
    uint64_t v4 = result;
    id v5 = a3;
    return GPBSetRetainedObjectIvarWithFieldPrivate(v4, a2, v5);
  }
  return result;
}

char *GPBMessageEncodingForSelector(const char *a1, BOOL a2)
{
  Protocol = objc_getProtocol("GPBMessageSignatureProtocol");
  if (!Protocol) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"const char *GPBMessageEncodingForSelector(SEL, BOOL)"] file:@"GPBUtilities.m" lineNumber:1555 description:@"Missing GPBMessageSignatureProtocol"];
  }
  objc_method_description MethodDescription = protocol_getMethodDescription(Protocol, a1, 0, a2);
  if (MethodDescription.name) {
    BOOL v6 = MethodDescription.types == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"const char *GPBMessageEncodingForSelector(SEL, BOOL)"], @"GPBUtilities.m", 1559, @"Missing method for selector %@", NSStringFromSelector(a1) file lineNumber description];
  }
  return MethodDescription.types;
}

__CFString *GPBTextFormatForMessage(void *a1, __CFString *a2)
{
  int v2 = &stru_1003BC4E8;
  if (a1)
  {
    if (a2) {
      uint64_t v4 = a2;
    }
    else {
      uint64_t v4 = &stru_1003BC4E8;
    }
    int v2 = (__CFString *)+[NSMutableString string];
    sub_1002E7E38(a1, v2, v4);
  }
  return v2;
}

id sub_1002E7E38(void *a1, void *a2, __CFString *a3)
{
  id v5 = a1;
  BOOL v6 = [a1 descriptor];
  uint64_t v7 = (void *)v6[1];
  int v8 = (char *)[v7 count];
  uint64_t v9 = [v6 extensionRanges];
  unsigned int v10 = [v6 extensionRangesCount];
  id v11 = [[objc_msgSend(v5, "extensionsCurrentlySet") sortedArrayUsingSelector:@"compareByFieldNumber:"];
  if (v8) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = v10 == 0;
  }
  if (!v12)
  {
    uint64_t v13 = v11;
    BOOL v14 = 0;
    unint64_t v15 = v10;
    unint64_t v16 = 0;
    uint64_t v58 = v76;
    uint64_t v59 = v72;
    int v68 = v5;
    id v61 = v11;
    int v62 = v9;
    uint64_t v65 = a3;
    unint64_t v66 = v15;
    int v63 = v8;
    uint64_t v64 = v7;
    while (1)
    {
      if (v14 == v8)
      {
        uint64_t v17 = v16++;
        sub_1002E9140(v5, v13, v9[v17], a2, a3);
        BOOL v14 = v8;
        goto LABEL_94;
      }
      if (v16 != v15)
      {
        id v18 = [v7 objectAtIndexedSubscript:v14];
        id v19 = &v9[v16];
        if (*(_DWORD *)(v18[1] + 16) >= *(_DWORD *)v19)
        {
          ++v16;
          sub_1002E9140(v5, v13, *v19, a2, a3);
          goto LABEL_94;
        }
      }
      int v69 = v14 + 1;
      uint64_t v70 = [v7 objectAtIndexedSubscript:v14];
      unsigned int v20 = [v70 fieldType];
      unsigned int v21 = v20;
      if (v20 == 2) {
        break;
      }
      if (v20 == 1)
      {
        uint64_t v25 = v5[8];
        long long v26 = v70;
        unint64_t v67 = v16;
        if (v25)
        {
LABEL_19:
          id v23 = *(void **)(v25 + *(unsigned int *)(v26[1] + 24));
          goto LABEL_22;
        }
LABEL_21:
        id v23 = 0;
LABEL_22:
        unint64_t v24 = (unint64_t)[v23 count];
        if (v24) {
          goto LABEL_23;
        }
        goto LABEL_14;
      }
      if (v20)
      {
        BOOL v14 = v69;
        goto LABEL_94;
      }
      unint64_t v67 = v16;
      BOOL HasIvar = GPBGetHasIvar((uint64_t)v5, *(_DWORD *)(v70[1] + 20), *(_DWORD *)(v70[1] + 16));
      id v23 = 0;
      unint64_t v24 = HasIvar;
      if (HasIvar)
      {
LABEL_23:
        long long v27 = (NSString *)[v70 textFormatName];
        if ([(NSString *)v27 length]) {
          goto LABEL_26;
        }
        long long v27 = +[NSString stringWithFormat:@"%u", *(unsigned int *)(v70[1] + 16)];
        if (v24 < 2)
        {
          a3 = v65;
          id v5 = v68;
          CFStringRef v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"  # %@", [v70 name]);
        }
        else
        {
          [a2 appendFormat:@"%@# %@\n", a3, [v70 name]];
LABEL_26:
          CFStringRef v28 = &stru_1003BC4E8;
        }
        if (v21 == 2)
        {
          unsigned int v29 = [v70 mapKeyDataType];
          a3 = v65;
          int v30 = *(unsigned __int8 *)(v70[1] + 30);
          uint64_t v60 = +[NSString stringWithFormat:@"%@%@ {%@\n", v65, v27, v28, v58, v59];
          long long v31 = +[NSString stringWithFormat:@"%@%@ {\n", v65, v27];
          long long v32 = +[NSString stringWithFormat:@"%@}\n", v65];
          long long v33 = +[NSString stringWithFormat:@"%@  key: ", v65];
          long long v34 = ":";
          if ((v30 - 15) < 2) {
            long long v34 = "";
          }
          long long v35 = +[NSString stringWithFormat:@"%@  value%s ", v65, v34];
          v78[0] = 0;
          v78[1] = v78;
          v78[2] = 0x2020000000;
          char v79 = 1;
          if (v29 == 14 && (v30 - 13) <= 3)
          {
            v75[0] = _NSConcreteStackBlock;
            v75[1] = 3221225472;
            v76[0] = sub_1002E9720;
            v76[1] = &unk_1003BA4E8;
            v76[2] = a2;
            v76[3] = v60;
            v76[4] = v31;
            v76[5] = v33;
            char v77 = v30;
            v76[6] = v35;
            v76[7] = v65;
            v76[8] = v32;
            v76[9] = v78;
            [v23 enumerateKeysAndObjectsUsingBlock:v75];
          }
          else
          {
            v71[0] = _NSConcreteStackBlock;
            v71[1] = 3221225472;
            v72[0] = sub_1002E98B4;
            v72[1] = &unk_1003BA510;
            v72[9] = v32;
            v72[10] = v78;
            v72[2] = a2;
            v72[3] = v60;
            char v73 = v29;
            v72[4] = v31;
            v72[5] = v33;
            char v74 = v30;
            v72[6] = v35;
            v72[7] = v65;
            v72[8] = v70;
            [v23 enumerateForTextFormat:v71];
          }
          _Block_object_dispose(v78, 8);
          id v5 = v68;
          BOOL v14 = v69;
        }
        else
        {
          uint64_t v36 = 0;
          int v37 = *(unsigned __int8 *)(v70[1] + 30);
          if ((v37 - 15) >= 2) {
            uint64_t v38 = ":";
          }
          else {
            uint64_t v38 = "";
          }
          do
          {
            [a2 appendFormat:@"%@%@%s ", a3, v27, v38];
            switch(v37)
            {
              case 0:
                if (v23) {
                  unsigned int v44 = [v23 valueAtIndex:v36];
                }
                else {
                  unsigned int v44 = GPBGetMessageBoolField((uint64_t)v5, v70);
                }
                if (v44) {
                  CFStringRef v52 = @"true";
                }
                else {
                  CFStringRef v52 = @"false";
                }
                [a2 appendString:v52];
                break;
              case 1:
              case 11:
                if (v23) {
                  id v41 = [v23 valueAtIndex:v36];
                }
                else {
                  id v41 = GPBGetMessageUInt32Field((uint64_t)v5, v70);
                }
                [a2 appendFormat:@"%u", v41, v57];
                break;
              case 2:
              case 7:
              case 9:
                if (v23) {
                  id v39 = [v23 valueAtIndex:v36];
                }
                else {
                  id v39 = GPBGetMessageInt32Field((uint64_t)v5, v70);
                }
                [a2 appendFormat:@"%d", v39, v57];
                break;
              case 3:
                if (v23) {
                  [v23 valueAtIndex:v36];
                }
                else {
                  float v45 = GPBGetMessageFloatField((uint64_t)v5, v70);
                }
                [a2 appendFormat:@"%.*g", 6, v45];
                break;
              case 4:
              case 12:
                if (v23) {
                  id v42 = [v23 valueAtIndex:v36];
                }
                else {
                  id v42 = GPBGetMessageUInt64Field((uint64_t)v5, v70);
                }
                [a2 appendFormat:@"%llu", v42, v57];
                break;
              case 5:
              case 8:
              case 10:
                if (v23) {
                  id v40 = [v23 valueAtIndex:v36];
                }
                else {
                  id v40 = GPBGetMessageInt64Field((uint64_t)v5, v70);
                }
                [a2 appendFormat:@"%lld", v40, v57];
                break;
              case 6:
                if (v23) {
                  [v23 valueAtIndex:v36];
                }
                else {
                  double v46 = GPBGetMessageDoubleField((uint64_t)v5, v70);
                }
                [a2 appendFormat:@"%.*lg", 15, *(void *)&v46];
                break;
              case 13:
                if (v23) {
                  float v47 = [v23 objectAtIndex:v36];
                }
                else {
                  float v47 = GPBGetObjectIvarWithField((uint64_t)v5, v70);
                }
                sub_1002E8C1C(v47, a2);
                break;
              case 14:
                if (v23) {
                  long long v48 = [v23 objectAtIndex:v36];
                }
                else {
                  long long v48 = GPBGetObjectIvarWithField((uint64_t)v5, v70);
                }
                sub_1002E9588(v48, a2);
                break;
              case 15:
              case 16:
                if (v23) {
                  unsigned int v43 = [v23 objectAtIndex:v36];
                }
                else {
                  unsigned int v43 = GPBGetObjectIvarWithField((uint64_t)v5, v70);
                }
                long long v51 = v43;
                [a2 appendFormat:@"{%@\n", v28];
                sub_1002E7E38(v51, a2, [(__CFString *)a3 stringByAppendingString:@"  "]);
                [a2 appendFormat:@"%@}", a3];
                CFStringRef v28 = &stru_1003BC4E8;
                id v5 = v68;
                break;
              case 17:
                if (v23)
                {
                  id v49 = [v23 rawValueAtIndex:v36];
                  long long v50 = v70;
                }
                else
                {
                  long long v50 = v70;
                  id v49 = GPBGetMessageInt32Field((uint64_t)v5, v70);
                }
                id v53 = [v50 enumDescriptor];
                if (v53 && (id v54 = [v53 textFormatNameForValue:v49]) != 0) {
                  [a2 appendString:v54];
                }
                else {
                  [a2 appendFormat:@"%d", v49];
                }
                id v5 = v68;
                a3 = v65;
                break;
              default:
                break;
            }
            [a2 appendFormat:@"%@\n", v28];
            ++v36;
          }
          while (v24 != v36);
          BOOL v14 = v69;
        }
        int v8 = v63;
        uint64_t v7 = v64;
        uint64_t v13 = v61;
        uint64_t v9 = v62;
        goto LABEL_93;
      }
LABEL_14:
      BOOL v14 = v69;
LABEL_93:
      unint64_t v15 = v66;
      unint64_t v16 = v67;
LABEL_94:
      if (v14 >= v8 && v16 >= v15) {
        goto LABEL_98;
      }
    }
    uint64_t v25 = v5[8];
    unint64_t v67 = v16;
    if (v25)
    {
      long long v26 = v70;
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_98:
  int v55 = GPBTextFormatForUnknownFieldSet([v5 unknownFields], a3);
  id result = [(__CFString *)v55 length];
  if (result)
  {
    [a2 appendFormat:@"%@# --- Unknown fields ---\n", a3];
    return [a2 appendString:v55];
  }
  return result;
}

void sub_1002E870C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

__CFString *GPBTextFormatForUnknownFieldSet(void *a1, const __CFString *a2)
{
  int v2 = &stru_1003BC4E8;
  if (a1)
  {
    uint64_t v4 = a2 ? (__CFString *)a2 : &stru_1003BC4E8;
    int v2 = (__CFString *)+[NSMutableString string];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = [a1 sortedFields];
    id v26 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v26)
    {
      uint64_t v25 = *(void *)v44;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v44 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = v5;
          BOOL v6 = *(void **)(*((void *)&v43 + 1) + 8 * v5);
          id v7 = [v6 number];
          id v8 = [v6 varintList];
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_1002E8B68;
          void v41[3] = &unk_1003BA498;
          v41[4] = v2;
          v41[5] = v4;
          int v42 = (int)v7;
          [v8 enumerateValuesWithBlock:v41];
          id v9 = [v6 fixed32List];
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_1002E8BA4;
          void v39[3] = &unk_1003BA4C0;
          v39[4] = v2;
          v39[5] = v4;
          int v40 = (int)v7;
          [v9 enumerateValuesWithBlock:v39];
          id v10 = [v6 fixed64List];
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_1002E8BE0;
          void v37[3] = &unk_1003BA498;
          v37[4] = v2;
          v37[5] = v4;
          int v38 = (int)v7;
          [v10 enumerateValuesWithBlock:v37];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v27 = v6;
          id v11 = [v6 lengthDelimitedList];
          id v12 = [v11 countByEnumeratingWithState:&v33 objects:v48 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v34;
            do
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v34 != v14) {
                  objc_enumerationMutation(v11);
                }
                unint64_t v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                [(__CFString *)v2 appendFormat:@"%@%d: ", v4, v7];
                sub_1002E8C1C(v16, v2);
                [(__CFString *)v2 appendString:@"\n"];
              }
              id v13 = [v11 countByEnumeratingWithState:&v33 objects:v48 count:16];
            }
            while (v13);
          }
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v17 = [v27 groupList];
          id v18 = [v17 countByEnumeratingWithState:&v29 objects:v47 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v30;
            do
            {
              for (j = 0; j != v19; j = (char *)j + 1)
              {
                if (*(void *)v30 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * (void)j);
                [(__CFString *)v2 appendFormat:@"%@%d: {\n", v4, v7];
                [(__CFString *)v2 appendString:GPBTextFormatForUnknownFieldSet(v22, [(__CFString *)v4 stringByAppendingString:@"  "])];
                [(__CFString *)v2 appendFormat:@"%@}\n", v4];
              }
              id v19 = [v17 countByEnumeratingWithState:&v29 objects:v47 count:16];
            }
            while (v19);
          }
          uint64_t v5 = v28 + 1;
        }
        while ((id)(v28 + 1) != v26);
        id v26 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v26);
    }
  }
  return v2;
}

id sub_1002E8B68(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@%d: %llu\n", *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), a2];
}

id sub_1002E8BA4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@%d: 0x%X\n", *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), a2];
}

id sub_1002E8BE0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@%d: 0x%llX\n", *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), a2];
}

id sub_1002E8C1C(void *a1, void *a2)
{
  uint64_t v4 = (char *)[a1 bytes];
  uint64_t v5 = (uint64_t)[a1 length];
  [a2 appendString:@"\""];
  if (v5 >= 1)
  {
    BOOL v6 = &v4[v5];
    do
    {
      uint64_t v7 = *v4;
      if ((int)v7 > 33)
      {
        switch(v7)
        {
          case '""':
            id v8 = a2;
            CFStringRef v9 = @"\\\"";
            goto LABEL_16;
          case '\'':
            id v8 = a2;
            CFStringRef v9 = @"\\'";
            goto LABEL_16;
          case '\\':
            id v8 = a2;
            CFStringRef v9 = @"\\\\"";
            goto LABEL_16;
        }
      }
      else
      {
        switch(v7)
        {
          case 9:
            id v8 = a2;
            CFStringRef v9 = @"\\t";
            goto LABEL_16;
          case 0xA:
            id v8 = a2;
            CFStringRef v9 = @"\\n";
            goto LABEL_16;
          case 0xD:
            id v8 = a2;
            CFStringRef v9 = @"\\r";
LABEL_16:
            [v8 appendString:v9];
            goto LABEL_17;
        }
      }
      if ((v7 & 0x80000000) != 0)
      {
        if (!__maskrune(*v4, 0x40000uLL))
        {
LABEL_23:
          [a2 appendFormat:@"\\%03o", v7];
          goto LABEL_17;
        }
      }
      else if ((_DefaultRuneLocale.__runetype[v7] & 0x40000) == 0)
      {
        goto LABEL_23;
      }
      [a2 appendFormat:@"%c", v7];
LABEL_17:
      ++v4;
    }
    while (v4 < v6);
  }

  return [a2 appendString:@"\""];
}

NSString *GPBDecodeTextFormatName(char *a1, int a2, void *a3)
{
  uint64_t v3 = 0;
  if (a1 && a3)
  {
    id v23 = a1;
    int v6 = sub_1002E8FB8(&v23);
    if (v6 < 1)
    {
      return 0;
    }
    else
    {
      int v7 = v6;
      while (1)
      {
        int v8 = sub_1002E8FB8(&v23);
        CFStringRef v9 = v23;
        if (v8 == a2) {
          break;
        }
        id v10 = v23 + 1;
        while (*v10++)
          ;
        id v23 = v10;
        if (v7-- < 2) {
          return 0;
        }
      }
      if (*v23)
      {
        uint64_t v3 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", [a3 length]);
        char v14 = *v9;
        if (*v9)
        {
          uint64_t v15 = 0;
          while (1)
          {
            if (v14 < 0)
            {
              [(NSMutableString *)v3 appendString:@"_"];
              char v14 = *v9;
            }
            int v16 = v14 & 0x1F;
            int v17 = v14 & 0x60;
            if (v17 == 32) {
              break;
            }
            if (v17 == 64)
            {
              uint64_t v18 = __toupper((char)[a3 characterAtIndex:v15]);
LABEL_21:
              [(NSMutableString *)v3 appendFormat:@"%c", v18];
              ++v15;
              --v16;
            }
            if (v16 >= 1)
            {
              uint64_t v19 = v16;
              uint64_t v20 = v15;
              do
              {
                id v21 = [a3 characterAtIndex:v20];
                if (v17 == 96) {
                  [(NSMutableString *)v3 appendFormat:@"%c", __toupper((char)v21)];
                }
                else {
                  [(NSMutableString *)v3 appendFormat:@"%C", v21];
                }
                ++v20;
                --v19;
              }
              while (v19);
            }
            v15 += v16;
            int v22 = *++v9;
            char v14 = v22;
            if (!v22) {
              return (NSString *)v3;
            }
          }
          uint64_t v18 = __tolower((char)[a3 characterAtIndex:v15]);
          goto LABEL_21;
        }
      }
      else
      {
        return +[NSString stringWithUTF8String:v23 + 1];
      }
    }
  }
  return (NSString *)v3;
}

uint64_t sub_1002E8FB8(char **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = *(*a1)++;
  if ((v2 & 0x80000000) != 0)
  {
    unsigned int v3 = v2 & 0x7F;
    int v4 = v1[1];
    *a1 = v1 + 2;
    int v5 = v4 << 7;
    if ((v4 & 0x80000000) == 0) {
      return v5 | v3;
    }
    v3 |= v5 & 0x3F80;
    int v6 = v1[2];
    *a1 = v1 + 3;
    int v5 = v6 << 14;
    if ((v6 & 0x80000000) == 0) {
      return v5 | v3;
    }
    v3 |= v5 & 0x1FC000;
    int v7 = v1[3];
    *a1 = v1 + 4;
    int v5 = v7 << 21;
    if (v7 < 0)
    {
      int v9 = v1[4];
      *a1 = v1 + 5;
      uint64_t v2 = v5 & 0xFE00000 | (v9 << 28) | v3;
      if (v9 < 0)
      {
        uint64_t v10 = 0;
        while (1)
        {
          int v11 = v1[v10 + 5];
          *a1 = &v1[v10 + 6];
          if ((v11 & 0x80000000) == 0) {
            break;
          }
          if (++v10 == 5)
          {
            +[NSException raise:NSParseErrorException format:@"Unable to read varint32"];
            return v2;
          }
        }
      }
    }
    else
    {
      return v5 | v3;
    }
  }
  return v2;
}

void *GPBSetInt32IvarWithFieldInternal(void *a1, uint64_t a2, int a3)
{
  if (a1)
  {
    if (a2) {
      return GPBSetInt32IvarWithFieldPrivate(a1, a2, a3);
    }
  }
  return a1;
}

void *GPBMaybeClearOneof(void *a1, void *a2, uint64_t a3)
{
  return sub_1002E6B0C(a1, a2, a3, 0);
}

BOOL GPBClassHasSel(objc_class *a1, const char *a2)
{
  unsigned int outCount = 0;
  unsigned int v3 = class_copyMethodList(a1, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      SEL Name = method_getName(v3[i]);
      BOOL v6 = Name == a2;
      if (Name == a2) {
        break;
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  free(v3);
  return v6;
}

id sub_1002E9140(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id result = [a2 countByEnumeratingWithState:&v32 objects:v36 count:16];
  id v28 = result;
  if (result)
  {
    uint64_t v27 = *(void *)v33;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(a2);
        }
        uint64_t v30 = v7;
        int v8 = *(void **)(*((void *)&v32 + 1) + 8 * v7);
        id result = [v8 fieldNumber];
        if (result >= a3)
        {
          id v9 = result;
          if (result >= HIDWORD(a3)) {
            return result;
          }
          id v10 = [a1 getExtension:v8];
          unsigned int v11 = [v8 isRepeated];
          if (v11)
          {
            uint64_t v12 = (uint64_t)[v10 count];
            id v13 = [v8 singletonName];
            if (v12 != 1)
            {
              [a4 appendFormat:@"%@# [%@]\n", a5, v13];
              unsigned int v14 = [v8 dataType];
              if (!v12) {
                goto LABEL_7;
              }
              unsigned int v15 = v14;
              CFStringRef v16 = &stru_1003BC4E8;
              goto LABEL_16;
            }
          }
          else
          {
            id v13 = [v8 singletonName];
          }
          CFStringRef v16 = +[NSString stringWithFormat:@"  # [%@]", v13];
          unsigned int v15 = [v8 dataType];
          uint64_t v12 = 1;
LABEL_16:
          uint64_t v17 = 0;
          if (v15 - 15 >= 2) {
            uint64_t v18 = ":";
          }
          else {
            uint64_t v18 = "";
          }
          do
          {
            id v19 = v10;
            if (v11) {
              id v19 = [v10 objectAtIndex:v17];
            }
            [a4 appendFormat:@"%@%u%s ", a5, v9, v18];
            switch(v15)
            {
              case 0u:
                if ([v19 BOOLValue]) {
                  CFStringRef v22 = @"true";
                }
                else {
                  CFStringRef v22 = @"false";
                }
                [a4 appendString:v22];
                break;
              case 1u:
              case 0xBu:
                [a4 appendFormat:@"%u", [v19 unsignedIntValue], v24];
                break;
              case 2u:
                id v20 = [v19 unsignedIntValue];
                goto LABEL_34;
              case 3u:
                [v19 floatValue];
                [a4 appendFormat:@"%.*g", 6, v21];
                break;
              case 4u:
              case 0xCu:
                [a4 appendFormat:@"%llu", [v19 unsignedLongLongValue], v24];
                break;
              case 5u:
              case 8u:
              case 0xAu:
                [a4 appendFormat:@"%lld", [v19 longLongValue], v24];
                break;
              case 6u:
                [v19 doubleValue];
                [a4 appendFormat:@"%.*lg", 15, v23];
                break;
              case 7u:
              case 9u:
              case 0x11u:
                id v20 = [v19 intValue];
LABEL_34:
                [a4 appendFormat:@"%d", v20, v24];
                break;
              case 0xDu:
                sub_1002E8C1C(v19, a4);
                break;
              case 0xEu:
                sub_1002E9588(v19, a4);
                break;
              case 0xFu:
              case 0x10u:
                [a4 appendFormat:@"{%@\n", v16];
                sub_1002E7E38(v19, a4, [a5 stringByAppendingString:@"  "]);
                [a4 appendFormat:@"%@}", a5];
                CFStringRef v16 = &stru_1003BC4E8;
                break;
              default:
                break;
            }
            [a4 appendFormat:@"%@\n", v16];
            ++v17;
          }
          while (v12 != v17);
        }
LABEL_7:
        uint64_t v7 = v30 + 1;
      }
      while ((id)(v30 + 1) != v28);
      id result = [a2 countByEnumeratingWithState:&v32 objects:v36 count:16];
      id v28 = result;
    }
    while (result);
  }
  return result;
}

id sub_1002E9588(void *a1, void *a2)
{
  [a2 appendString:@"\""];
  int v4 = (char *)[a1 length];
  if (v4)
  {
    int v5 = v4;
    for (unint64_t i = 0; v5 != i; ++i)
    {
      id v7 = [a1 characterAtIndex:i];
      if ((int)v7 > 33)
      {
        switch(v7)
        {
          case '""':
            int v8 = a2;
            CFStringRef v9 = @"\\\"";
            break;
          case '\'':
            int v8 = a2;
            CFStringRef v9 = @"\\'";
            break;
          case '\\':
            int v8 = a2;
            CFStringRef v9 = @"\\\\"";
            break;
          default:
LABEL_19:
            if (v7 > 0x1F) {
              [a2 appendFormat:@"%C", v7, v11, v12];
            }
            else {
              [a2 appendFormat:@"\\%d%d%d", 0, v7 >> 3, v7 & 7];
            }
            continue;
        }
      }
      else
      {
        switch(v7)
        {
          case 9:
            int v8 = a2;
            CFStringRef v9 = @"\\t";
            break;
          case 0xA:
            int v8 = a2;
            CFStringRef v9 = @"\\n";
            break;
          case 0xD:
            int v8 = a2;
            CFStringRef v9 = @"\\r";
            break;
          default:
            goto LABEL_19;
        }
      }
      [v8 appendString:v9];
    }
  }

  return [a2 appendString:@"\""];
}

id sub_1002E9720(uint64_t a1, void *a2, void *a3)
{
  BOOL v6 = *(void **)(a1 + 32);
  uint64_t v7 = 40;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
    uint64_t v7 = 48;
  }
  [v6 appendString:*(void *)(a1 + v7)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
  [*(id *)(a1 + 32) appendString:*(void *)(a1 + 56)];
  sub_1002E9588(a2, *(void **)(a1 + 32));
  [*(id *)(a1 + 32) appendString:@"\n"];
  [*(id *)(a1 + 32) appendString:*(void *)(a1 + 64)];
  int v8 = *(unsigned __int8 *)(a1 + 96);
  switch(v8)
  {
    case 13:
      sub_1002E8C1C(a3, *(void **)(a1 + 32));
      break;
    case 15:
      [*(id *)(a1 + 32) appendString:@"{\n"];
      sub_1002E7E38(a3, *(void *)(a1 + 32), [*(id *)(a1 + 72) stringByAppendingString:@"    "]);
      [*(id *)(a1 + 32) appendFormat:@"%@  }", *(void *)(a1 + 72)];
      break;
    case 14:
      sub_1002E9588(a3, *(void **)(a1 + 32));
      break;
    default:
      [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void AppendTextFormatForMapMessageField(id, GPBFieldDescriptor *, NSMutableString *, NSString *, NSString *, NSString *)_block_invoke"] file:@"GPBUtilities.m" lineNumber:1672 description:@"Can't happen"];
      break;
  }
  [*(id *)(a1 + 32) appendString:@"\n"];
  CFStringRef v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 80);

  return [v9 appendString:v10];
}

id sub_1002E98B4(uint64_t a1, void *a2, void *a3)
{
  BOOL v6 = *(void **)(a1 + 32);
  uint64_t v7 = 40;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
    uint64_t v7 = 48;
  }
  [v6 appendString:*(void *)(a1 + v7)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 0;
  int v8 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 104) == 14)
  {
    [v8 appendString:*(void *)(a1 + 56)];
    sub_1002E9588(a2, *(void **)(a1 + 32));
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
  else
  {
    [v8 appendFormat:@"%@%@\n", *(void *)(a1 + 56), a2];
  }
  [*(id *)(a1 + 32) appendString:*(void *)(a1 + 64)];
  switch(*(unsigned char *)(a1 + 105))
  {
    case 0xD:
      sub_1002E8C1C(a3, *(void **)(a1 + 32));
      goto LABEL_18;
    case 0xE:
      sub_1002E9588(a3, *(void **)(a1 + 32));
      goto LABEL_18;
    case 0xF:
      [*(id *)(a1 + 32) appendString:@"{\n"];
      sub_1002E7E38(a3, *(void *)(a1 + 32), [*(id *)(a1 + 72) stringByAppendingString:@"    "]);
      [*(id *)(a1 + 32) appendFormat:@"%@  }", *(void *)(a1 + 72)];
      goto LABEL_18;
    case 0x10:
      [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void AppendTextFormatForMapMessageField(id, GPBFieldDescriptor *, NSMutableString *, NSString *, NSString *, NSString *)_block_invoke_2"] file:@"GPBUtilities.m" lineNumber:1731 description:@"Can't happen"];
      goto LABEL_16;
    case 0x11:
      id v9 = [a3 intValue];
      id v10 = [*(id *)(a1 + 80) enumDescriptor];
      if (v10 && (id v11 = [v10 textFormatNameForValue:v9]) != 0)
      {
        id v12 = v11;
        id v13 = *(void **)(a1 + 32);
LABEL_17:
        [v13 appendString:v12];
      }
      else
      {
        [*(id *)(a1 + 32) appendFormat:@"%d", v9];
      }
LABEL_18:
      [*(id *)(a1 + 32) appendString:@"\n"];
      unsigned int v14 = *(void **)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 88);
      return [v14 appendString:v15];
    default:
LABEL_16:
      id v13 = *(void **)(a1 + 32);
      id v12 = a3;
      goto LABEL_17;
  }
}

GPBFileDescriptor *sub_1002E9B88()
{
  id result = (GPBFileDescriptor *)qword_1003DD790;
  if (!qword_1003DD790)
  {
    id result = [[GPBFileDescriptor alloc] initWithPackage:@"CSHWProto" objcPrefix:@"CSHWProto" syntax:2];
    qword_1003DD790 = (uint64_t)result;
  }
  return result;
}

unint64_t CSHWProtoValue_ValueType_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&qword_1003DD770))
  {
    id v1 = +[GPBEnumDescriptor allocDescriptorForName:@"CSHWProtoValue_ValueType" valueNames:"ValueTypeNull" values:&unk_10033F5E0 count:4 enumVerifier:CSHWProtoValue_ValueType_IsValidValue extraTextFormatInfo:&unk_10033F5F0];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&qword_1003DD770, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&qword_1003DD770);
}

BOOL CSHWProtoValue_ValueType_IsValidValue(int a1)
{
  return (a1 - 1) < 4;
}

void sub_1002E9F24(uint64_t a1, void *a2, void *a3)
{
  id v4 = [a2 copy];
  [a3 addField:v4];
}

int sub_1002EA238(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 == *(void *)a3) {
    int v3 = 0;
  }
  else {
    int v3 = -1;
  }
  if (*(void *)a2 > *(void *)a3) {
    return 1;
  }
  else {
    return v3;
  }
}

int sub_1002EA388(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 == *(void *)a3) {
    int v3 = 0;
  }
  else {
    int v3 = -1;
  }
  if (*(void *)a2 > *(void *)a3) {
    return 1;
  }
  else {
    return v3;
  }
}

id sub_1002EA460(uint64_t a1, void *a2, void *a3)
{
  id result = [a2 serializedSize];
  *a3 += result;
  return result;
}

id sub_1002EA4B4(uint64_t a1, void *a2)
{
  return [a2 writeAsMessageSetExtensionToOutput:];
}

id sub_1002EA500(uint64_t a1, void *a2, void *a3)
{
  id result = [a2 serializedSizeAsMessageSetExtension];
  *a3 += result;
  return result;
}

void sub_1002EA718(uint64_t a1, void *a2, void *a3)
{
  id v5 = [a2 number];
  if (!v5) {
    +[NSException raise:NSInvalidArgumentException format:@"Zero is not a valid field number."];
  }
  id v6 = [a3 mutableFieldForNumber:v5 create:0];
  if (v6)
  {
    [v6 mergeFromField:a2];
  }
  else
  {
    id v7 = [a2 copy];
    [a3 addField:v7];
  }
}

uint64_t GPBDictionaryComputeSizeInternalHelper(void *a1, uint64_t a2)
{
  unsigned int v4 = *(unsigned __int8 *)(*(void *)(a2 + 8) + 30);
  id v5 = [a1 keyEnumerator];
  id v6 = [v5 nextObject];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0;
    do
    {
      id v9 = [a1 objectForKeyedSubscript:v7];
      id v10 = GPBComputeStringSize(1, v7);
      id v11 = &v10[(void)sub_1002EAD24(v9, v4)];
      v8 += (uint64_t)&v11[GPBComputeRawVarint32SizeForInteger(v11)];
      id v7 = [v5 nextObject];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v12 = GPBComputeWireFormatTagSize(*(_DWORD *)(*(void *)(a2 + 8) + 16), 15);
  return v8 + (void)[a1 count] * v12;
}

char *sub_1002EAD24(void *a1, unsigned int a2)
{
  switch(a2)
  {
    case 0xDu:
      return GPBComputeBytesSize(2, a1);
    case 0xEu:
      return GPBComputeStringSize(2, a1);
    case 0xFu:
      return GPBComputeMessageSize(2, a1);
    default:
      [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"size_t ComputeDictObjectFieldSize(id, uint32_t, GPBDataType)"], @"GPBDictionary.m", 312, @"Unexpected type %d", a2 file lineNumber description];
      return 0;
  }
}

id GPBDictionaryWriteToStreamInternalHelper(void *a1, void *a2, void *a3)
{
  if ([a3 mapKeyDataType] != 14) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void GPBDictionaryWriteToStreamInternalHelper(GPBCodedOutputStream *, NSDictionary *, GPBFieldDescriptor *)"] file:@"GPBDictionary.m" lineNumber:351 description:@"Unexpected key type"];
  }
  uint64_t v6 = a3[1];
  unsigned int v7 = *(unsigned __int8 *)(v6 + 30);
  uint64_t Tag = GPBWireFormatMakeTag(*(_DWORD *)(v6 + 16), 2);
  id v9 = [a2 keyEnumerator];
  id result = [v9 nextObject];
  if (result)
  {
    id v11 = result;
    do
    {
      id v12 = [a2 objectForKeyedSubscript:v11];
      [a1 writeInt32NoTag:Tag];
      unsigned int v13 = GPBComputeStringSize(1, v11);
      [a1 writeInt32NoTag:sub_1002EAD24(v12, v7) + v13];
      [a1 writeString:1 value:v11];
      sub_1002EAF6C(a1, (uint64_t)v12, v7);
      id result = [v9 nextObject];
      id v11 = result;
    }
    while (result);
  }
  return result;
}

id sub_1002EAF6C(void *a1, uint64_t a2, unsigned int a3)
{
  switch(a3)
  {
    case 0xDu:
      return [a1 writeBytes:2 value:a2];
    case 0xEu:
      return [a1 writeString:2 value:a2];
    case 0xFu:
      return [a1 writeMessage:2 value:a2];
    default:
      return [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void WriteDictObjectField(GPBCodedOutputStream *, id, uint32_t, GPBDataType)"], @"GPBDictionary.m", 325, @"Unexpected type %d", a3 file lineNumber description];
  }
}

BOOL GPBDictionaryIsInitializedInternalHelper(void *a1, void *a2)
{
  if ([a2 mapKeyDataType] != 14) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"BOOL GPBDictionaryIsInitializedInternalHelper(NSDictionary *, GPBFieldDescriptor *)"] file:@"GPBDictionary.m" lineNumber:372 description:@"Unexpected key type"];
  }
  if (*(unsigned char *)(a2[1] + 30) != 15) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"BOOL GPBDictionaryIsInitializedInternalHelper(NSDictionary *, GPBFieldDescriptor *)"] file:@"GPBDictionary.m" lineNumber:373 description:@"Unexpected value type"];
  }
  id v4 = [a1 objectEnumerator];
  do
  {
    id v5 = [v4 nextObject];
    id v6 = v5;
  }
  while (v5 && ([v5 isInitialized] & 1) != 0);
  return v6 == 0;
}

void GPBDictionaryReadEntry(void *a1, uint64_t *a2, uint64_t a3, void *a4, void *a5)
{
  id v10 = [a4 mapKeyDataType];
  int v11 = *(unsigned __int8 *)(a4[1] + 30);
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  if (v11 == 17) {
    uint64_t v24 = (__CFString *)[a4 defaultValue];
  }
  int v12 = GPBWireFormatForType((int)v10, 0);
  int Tag = GPBWireFormatMakeTag(1, v12);
  int v14 = GPBWireFormatForType(v11, 0);
  int v15 = GPBWireFormatMakeTag(2, v14);
  while (1)
  {
    while (1)
    {
      uint64_t v16 = GPBCodedInputStreamReadTag((uint64_t)(a2 + 1));
      if (v16 == Tag)
      {
        uint64_t v17 = (id *)&v25;
        uint64_t v18 = a2;
        int v19 = (int)v10;
        goto LABEL_8;
      }
      uint64_t v20 = v16;
      if (v16 != v15) {
        break;
      }
      uint64_t v17 = (id *)&v24;
      uint64_t v18 = a2;
      int v19 = v11;
LABEL_8:
      sub_1002EB418(v18, v17, v19, a3, a4);
    }
    if (!v16) {
      break;
    }
    if (([a2 skipField:v16] & 1) == 0) {
      goto LABEL_32;
    }
  }
  float v21 = v25;
  if (v10 == 14 && !v25)
  {
    float v21 = &stru_1003BC4E8;
    uint64_t v25 = v21;
  }
  CFStringRef v22 = v24;
  if ((v11 - 13) > 3u || v24) {
    goto LABEL_25;
  }
  switch(v11)
  {
    case 13:
      uint64_t v23 = (__CFString *)(id)GPBEmptyNSData();
LABEL_23:
      CFStringRef v22 = v23;
      uint64_t v24 = v23;
      goto LABEL_25;
    case 15:
      uint64_t v23 = (__CFString *)[a4 msgClass:v20];
      goto LABEL_23;
    case 14:
      uint64_t v23 = &stru_1003BC4E8;
      goto LABEL_23;
  }
  CFStringRef v22 = 0;
LABEL_25:
  if (v10 == 14 && (v11 - 13) <= 3u)
  {
    [a1 setObject:v22 forKey:v21];
    goto LABEL_34;
  }
  if (v11 != 17
    || objc_msgSend(objc_msgSend(objc_msgSend(a5, "descriptor", v20), "file"), "syntax") == 3
    || [a4 isValidEnumValue:v22])
  {
    [a1 setGPBGenericValue:&v24 forGPBGenericValueKey:&v25];
  }
  else
  {
    [a5 addUnknownMapEntry:*(unsigned int *)(a4[1] + 16) value:[a1 serializedDataForUnknownValue:v22 forKey:&v25 keyDataType:v10]];
  }
LABEL_32:
  if (((_BYTE)v10 - 13) > 3u) {
    goto LABEL_35;
  }
  float v21 = v25;
LABEL_34:

LABEL_35:
  if ((v11 - 13) <= 3u) {
}
  }

void sub_1002EB418(uint64_t *a1, id *a2, int a3, uint64_t a4, void *a5)
{
  switch(a3)
  {
    case 0:
      *(unsigned char *)a2 = GPBCodedInputStreamReadBool(a1 + 1);
      return;
    case 1:
      int Fixed32 = GPBCodedInputStreamReadFixed32(a1 + 1);
      goto LABEL_23;
    case 2:
      int Fixed32 = GPBCodedInputStreamReadSFixed32(a1 + 1);
      goto LABEL_23;
    case 3:
      *(float *)a2 = GPBCodedInputStreamReadFloat(a1 + 1);
      return;
    case 4:
      uint64_t Fixed64 = GPBCodedInputStreamReadFixed64(a1 + 1);
      goto LABEL_17;
    case 5:
      uint64_t Fixed64 = GPBCodedInputStreamReadSFixed64(a1 + 1);
      goto LABEL_17;
    case 6:
      *(double *)a2 = GPBCodedInputStreamReadDouble(a1 + 1);
      return;
    case 7:
      int Fixed32 = GPBCodedInputStreamReadInt32(a1 + 1);
      goto LABEL_23;
    case 8:
      uint64_t Fixed64 = GPBCodedInputStreamReadInt64(a1 + 1);
      goto LABEL_17;
    case 9:
      int Fixed32 = GPBCodedInputStreamReadSInt32(a1 + 1);
      goto LABEL_23;
    case 10:
      uint64_t Fixed64 = GPBCodedInputStreamReadSInt64(a1 + 1);
      goto LABEL_17;
    case 11:
      int Fixed32 = GPBCodedInputStreamReadUInt32(a1 + 1);
      goto LABEL_23;
    case 12:
      uint64_t Fixed64 = GPBCodedInputStreamReadUInt64(a1 + 1);
      goto LABEL_17;
    case 13:

      uint64_t Fixed64 = (uint64_t)GPBCodedInputStreamReadRetainedBytes(a1 + 1);
      goto LABEL_17;
    case 14:

      uint64_t Fixed64 = (uint64_t)GPBCodedInputStreamReadRetainedString(a1 + 1);
LABEL_17:
      *a2 = (id)Fixed64;
      break;
    case 15:
      id v10 = objc_alloc_init((Class)[a5 msgClass]);
      [a1 readMessage:v10 extensionRegistry:a4];

      *a2 = v10;
      break;
    case 16:
      int v11 = +[NSAssertionHandler currentHandler];
      int v12 = +[NSString stringWithUTF8String:"void ReadValue(GPBCodedInputStream *, GPBGenericValue *, GPBDataType, GPBExtensionRegistry *, GPBFieldDescriptor *)"];
      [(NSAssertionHandler *)v11 handleFailureInFunction:v12 file:@"GPBDictionary.m" lineNumber:447 description:@"Can't happen"];
      break;
    case 17:
      int Fixed32 = GPBCodedInputStreamReadEnum(a1 + 1);
LABEL_23:
      *(_DWORD *)a2 = Fixed32;
      break;
    default:
      return;
  }
}

uint64_t sub_1002EBB94(unsigned int a1, int a2, unsigned int a3)
{
  if (a3 == 1)
  {
    return GPBComputeFixed32Size(a2);
  }
  else if (a3 == 11)
  {
    return GPBComputeUInt32Size(a2, a1);
  }
  else
  {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"size_t ComputeDictUInt32FieldSize(uint32_t, uint32_t, GPBDataType)"], @"GPBDictionary.m", 183, @"Unexpected type %d", a3 file lineNumber description];
    return 0;
  }
}

id sub_1002EBDA8(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a4 == 1)
  {
    return [a1 writeFixed32:a3 value:a2];
  }
  else if (a4 == 11)
  {
    return [a1 writeUInt32:a3 value:a2];
  }
  else
  {
    return [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void WriteDictUInt32Field(GPBCodedOutputStream *, uint32_t, uint32_t, GPBDataType)"], @"GPBDictionary.m", 194, @"Unexpected type %d", a4 file lineNumber description];
  }
}

uint64_t sub_1002EBF48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%u", a2];
  id v6 = +[NSString stringWithFormat:@"%u", a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002EC618(unsigned int a1, int a2, unsigned int a3)
{
  switch(a3)
  {
    case 2u:
      return GPBComputeSFixed32Size(a2);
    case 9u:
      return GPBComputeSInt32Size(a2, a1);
    case 7u:
      return GPBComputeInt32Size(a2, a1);
    default:
      [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"size_t ComputeDictInt32FieldSize(int32_t, uint32_t, GPBDataType)"], @"GPBDictionary.m", 160, @"Unexpected type %d", a3 file lineNumber description];
      return 0;
  }
}

id sub_1002EC85C(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  switch(a4)
  {
    case 2u:
      return [a1 writeSFixed32:a3 value:a2];
    case 9u:
      return [a1 writeSInt32:a3 value:a2];
    case 7u:
      return [a1 writeInt32:a3 value:a2];
    default:
      return [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void WriteDictInt32Field(GPBCodedOutputStream *, int32_t, uint32_t, GPBDataType)"], @"GPBDictionary.m", 173, @"Unexpected type %d", a4 file lineNumber description];
  }
}

uint64_t sub_1002ECA28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%u", a2];
  id v6 = +[NSString stringWithFormat:@"%d", a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002ED0F0(unint64_t a1, int a2, unsigned int a3)
{
  if (a3 == 4)
  {
    return GPBComputeFixed64Size(a2);
  }
  else if (a3 == 12)
  {
    return GPBComputeUInt64Size(a2, a1);
  }
  else
  {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"size_t ComputeDictUInt64FieldSize(uint64_t, uint32_t, GPBDataType)"], @"GPBDictionary.m", 229, @"Unexpected type %d", a3 file lineNumber description];
    return 0;
  }
}

id sub_1002ED304(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a4 == 4)
  {
    return [a1 writeFixed64:a3 value:a2];
  }
  else if (a4 == 12)
  {
    return [a1 writeUInt64:a3 value:a2];
  }
  else
  {
    return [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void WriteDictUInt64Field(GPBCodedOutputStream *, uint64_t, uint32_t, GPBDataType)"], @"GPBDictionary.m", 240, @"Unexpected type %d", a4 file lineNumber description];
  }
}

uint64_t sub_1002ED4A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%u", a2];
  id v6 = +[NSString stringWithFormat:@"%llu", a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002EDB6C(unint64_t a1, int a2, unsigned int a3)
{
  switch(a3)
  {
    case 5u:
      return GPBComputeSFixed64Size(a2);
    case 0xAu:
      return GPBComputeSInt64Size(a2, a1);
    case 8u:
      return GPBComputeInt64Size(a2, a1);
    default:
      [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"size_t ComputeDictInt64FieldSize(int64_t, uint32_t, GPBDataType)"], @"GPBDictionary.m", 206, @"Unexpected type %d", a3 file lineNumber description];
      return 0;
  }
}

id sub_1002EDDB0(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  switch(a4)
  {
    case 5u:
      return [a1 writeSFixed64:a3 value:a2];
    case 0xAu:
      return [a1 writeSInt64:a3 value:a2];
    case 8u:
      return [a1 writeInt64:a3 value:a2];
    default:
      return [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void WriteDictInt64Field(GPBCodedOutputStream *, int64_t, uint32_t, GPBDataType)"], @"GPBDictionary.m", 219, @"Unexpected type %d", a4 file lineNumber description];
  }
}

uint64_t sub_1002EDF7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%u", a2];
  id v6 = +[NSString stringWithFormat:@"%lld", a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002EE644(uint64_t a1, int a2, unsigned int a3)
{
  if (a3) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"size_t ComputeDictBoolFieldSize(BOOL, uint32_t, GPBDataType)"], @"GPBDictionary.m", 245, @"bad type: %d", a3 file lineNumber description];
  }

  return GPBComputeBoolSize(a2);
}

id sub_1002EE820(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a4) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void WriteDictBoolField(GPBCodedOutputStream *, BOOL, uint32_t, GPBDataType)"], @"GPBDictionary.m", 251, @"bad type: %d", a4 file lineNumber description];
  }

  return [a1 writeBool:a3 value:a2];
}

uint64_t sub_1002EE9A8(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%u", a2];
  if (a3) {
    CFStringRef v6 = @"true";
  }
  else {
    CFStringRef v6 = @"false";
  }
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, const __CFString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002EF05C(unsigned int a1)
{
  if (a1 != 3) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"size_t ComputeDictFloatFieldSize(float, uint32_t, GPBDataType)"], @"GPBDictionary.m", 269, @"bad type: %d", a1 file lineNumber description];
  }

  return GPBComputeFloatSize(2);
}

id sub_1002EF230(void *a1, unsigned int a2, double a3)
{
  int v3 = LODWORD(a3);
  if (a2 != 3) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void WriteDictFloatField(GPBCodedOutputStream *, float, uint32_t, GPBDataType)"], @"GPBDictionary.m", 275, @"bad type: %d", a2 file lineNumber description];
  }
  LODWORD(a3) = v3;

  return [a1 writeFloat:2 value:a3];
}

uint64_t sub_1002EF3B8(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%u", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*g", 6, a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002EFA8C(unsigned int a1)
{
  if (a1 != 6) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"size_t ComputeDictDoubleFieldSize(double, uint32_t, GPBDataType)"], @"GPBDictionary.m", 281, @"bad type: %d", a1 file lineNumber description];
  }

  return GPBComputeDoubleSize(2);
}

id sub_1002EFC60(void *a1, unsigned int a2, double a3)
{
  if (a2 != 6) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void WriteDictDoubleField(GPBCodedOutputStream *, double, uint32_t, GPBDataType)"], @"GPBDictionary.m", 287, @"bad type: %d", a2 file lineNumber description];
  }

  return [a1 writeDouble:2 value:a3];
}

uint64_t sub_1002EFDE8(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%u", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*lg", 15, *(void *)&a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

BOOL sub_1002F011C(int a1)
{
  return a1 != -72499473;
}

uint64_t sub_1002F0510(unsigned int a1, unsigned int a2)
{
  if (a2 != 17) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"size_t ComputeDictEnumFieldSize(int32_t, uint32_t, GPBDataType)"], @"GPBDictionary.m", 257, @"bad type: %d", a2 file lineNumber description];
  }

  return GPBComputeEnumSize(2, a1);
}

id sub_1002F06E4(void *a1, uint64_t a2, unsigned int a3)
{
  if (a3 != 17) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void WriteDictEnumField(GPBCodedOutputStream *, int32_t, uint32_t, GPBDataType)"], @"GPBDictionary.m", 263, @"bad type: %d", a3 file lineNumber description];
  }

  return [a1 writeEnum:2 value:a2];
}

uint64_t sub_1002F0910(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%u", a2];
  CFStringRef v6 = +[NSNumber numberWithInt:a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSNumber *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002F1588(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%u", a2];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, NSString *, uint64_t))(v4 + 16);

  return v6(v4, v5, a3);
}

uint64_t sub_1002F1E30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%u", a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002F2704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%d", a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002F2FE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%llu", a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002F38B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%lld", a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002F4188(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%d", a2];
  if (a3) {
    CFStringRef v6 = @"true";
  }
  else {
    CFStringRef v6 = @"false";
  }
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, const __CFString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002F4A40(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*g", 6, a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002F5318(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*lg", 15, *(void *)&a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002F5CDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSNumber numberWithInt:a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSNumber *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002F6954(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, NSString *, uint64_t))(v4 + 16);

  return v6(v4, v5, a3);
}

uint64_t sub_1002F71FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%u", a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002F7AD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%d", a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002F83A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%llu", a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002F8C80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%lld", a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002F9554(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%llu", a2];
  if (a3) {
    CFStringRef v6 = @"true";
  }
  else {
    CFStringRef v6 = @"false";
  }
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, const __CFString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002F9E0C(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*g", 6, a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002FA6E4(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*lg", 15, *(void *)&a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002FB0A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSNumber numberWithInt:a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSNumber *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002FBD20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, NSString *, uint64_t))(v4 + 16);

  return v6(v4, v5, a3);
}

uint64_t sub_1002FC5C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%u", a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002FCE9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%d", a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002FD770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%llu", a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002FE044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%lld", a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002FE920(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%lld", a2];
  if (a3) {
    CFStringRef v6 = @"true";
  }
  else {
    CFStringRef v6 = @"false";
  }
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, const __CFString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002FF1D8(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*g", 6, a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1002FFAB0(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*lg", 15, *(void *)&a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_100300474(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSNumber numberWithInt:a3];
  unsigned int v7 = *(uint64_t (**)(uint64_t, NSString *, NSNumber *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1003010EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, NSString *, uint64_t))(v4 + 16);

  return v6(v4, v5, a3);
}

char *sub_100301794(void *a1, unsigned int a2)
{
  if (a2 != 14) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"size_t ComputeDictStringFieldSize(NSString *, uint32_t, GPBDataType)"], @"GPBDictionary.m", 293, @"bad type: %d", a2 file lineNumber description];
  }

  return GPBComputeStringSize(1, a1);
}

id sub_10030195C(void *a1, uint64_t a2, unsigned int a3)
{
  if (a3 != 14) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void WriteDictStringField(GPBCodedOutputStream *, NSString *, uint32_t, GPBDataType)"], @"GPBDictionary.m", 299, @"bad type: %d", a3 file lineNumber description];
  }

  return [a1 writeString:1 value:a2];
}

uint64_t sub_100301AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%u", a3];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, uint64_t, NSString *))(v4 + 16);

  return v6(v4, a2, v5);
}

uint64_t sub_100302318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%d", a3];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, uint64_t, NSString *))(v4 + 16);

  return v6(v4, a2, v5);
}

uint64_t sub_100302B6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%llu", a3];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, uint64_t, NSString *))(v4 + 16);

  return v6(v4, a2, v5);
}

uint64_t sub_1003033C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%lld", a3];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, uint64_t, NSString *))(v4 + 16);

  return v6(v4, a2, v5);
}

uint64_t sub_100303C14(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3) {
    CFStringRef v4 = @"true";
  }
  else {
    CFStringRef v4 = @"false";
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, const __CFString *))(v3 + 16))(v3, a2, v4);
}

uint64_t sub_100304418(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%.*g", 6, a3];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, uint64_t, NSString *))(v4 + 16);

  return v6(v4, a2, v5);
}

uint64_t sub_100304C74(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[NSString stringWithFormat:@"%.*lg", 15, *(void *)&a3];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, uint64_t, NSString *))(v4 + 16);

  return v6(v4, a2, v5);
}

uint64_t sub_1003055B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, NSNumber *))(v3 + 16);

  return v5(v3, a2, v4);
}

uint64_t sub_10030A4CC(uint64_t a1, uint64_t a2)
{
  return a2;
}

CFStringRef sub_10030A4D8(char *cStr)
{
  return CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
}

BOOL sub_10030A4F4(const char *a1, const char *a2)
{
  return strcmp(a1, a2) == 0;
}

uint64_t sub_10030A514(unsigned char *a1)
{
  LOBYTE(v1) = *a1;
  if (*a1)
  {
    unsigned int v2 = 0;
    unsigned int v3 = 1;
    do
    {
      unsigned int v2 = (1025 * (v2 + (char)v1)) ^ ((1025 * (v2 + (char)v1)) >> 6);
      int v1 = a1[v3++];
    }
    while (v1);
    unsigned int v4 = 9 * v2;
  }
  else
  {
    unsigned int v4 = 0;
  }
  return 32769 * (v4 ^ (v4 >> 11));
}

uint64_t GPBResolveExtensionClassMethod(objc_class *a1, const char *a2)
{
  uint64_t result = (uint64_t)sub_10030A6AC(a1, a2);
  if (result)
  {
    uint64_t v5 = result;
    CFStringRef v6 = GPBMessageEncodingForSelector("getClassValue", 0);
    SEL Name = class_getName(a1);
    MetaClass = objc_getMetaClass(Name);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10030A838;
    block[3] = &unk_1003BABE0;
    block[4] = v5;
    id v9 = imp_implementationWithBlock(block);
    return class_addMethod(MetaClass, a2, v9, v6) || GPBClassHasSel(MetaClass, a2);
  }
  return result;
}

const void *sub_10030A6AC(objc_class *a1, SEL sel)
{
  SEL Name = sel_getName(sel);
  int v5 = *(unsigned __int8 *)Name;
  if (v5 == 95) {
    return 0;
  }
  unsigned int v7 = Name;
  uint64_t v8 = 1;
  if (*Name)
  {
    while (v5 != 58)
    {
      int v5 = Name[v8++];
      if (!v5) {
        goto LABEL_6;
      }
    }
    return 0;
  }
LABEL_6:
  id v9 = class_getName(a1);
  size_t v10 = strlen(v9);
  __chkstk_darwin(v10);
  int v12 = (char *)&v14 - v11;
  memcpy((char *)&v14 - v11, v9, v10);
  v12[v10] = 95;
  memcpy(&v12[v10 + 1], v7, v8 - 1);
  v12[v10 + v8] = 0;
  if (!qword_1003DD798) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:sel object:a1 file:@"GPBRootObject.m" lineNumber:190 description:@"Startup order broken!"];
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_1003DD7A0, 0xFFFFFFFFFFFFFFFFLL);
  Value = CFDictionaryGetValue((CFDictionaryRef)qword_1003DD798, v12);
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_1003DD7A0);
  return Value;
}

uint64_t sub_10030A838(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t *sub_10030AAA0(uint64_t *result, uint64_t a2)
{
  unsigned int v3 = result;
  uint64_t v4 = result[2];
  if (v4 == result[1])
  {
    uint64_t result = sub_10030DC4C(result);
    uint64_t v4 = v3[2];
  }
  uint64_t v5 = *v3;
  v3[2] = v4 + 1;
  *(unsigned char *)(v5 + v4) = a2;
  uint64_t v6 = v3[2];
  if (v6 == v3[1])
  {
    uint64_t result = sub_10030DC4C(v3);
    uint64_t v6 = v3[2];
  }
  uint64_t v7 = *v3;
  v3[2] = v6 + 1;
  *(unsigned char *)(v7 + v6) = BYTE1(a2);
  uint64_t v8 = v3[2];
  if (v8 == v3[1])
  {
    uint64_t result = sub_10030DC4C(v3);
    uint64_t v8 = v3[2];
  }
  uint64_t v9 = *v3;
  v3[2] = v8 + 1;
  *(unsigned char *)(v9 + v_Block_object_dispose(&STACK[0x410], 8) = BYTE2(a2);
  uint64_t v10 = v3[2];
  if (v10 == v3[1])
  {
    uint64_t result = sub_10030DC4C(v3);
    uint64_t v10 = v3[2];
  }
  uint64_t v11 = *v3;
  v3[2] = v10 + 1;
  *(unsigned char *)(v11 + v10) = BYTE3(a2);
  uint64_t v12 = v3[2];
  if (v12 == v3[1])
  {
    uint64_t result = sub_10030DC4C(v3);
    uint64_t v12 = v3[2];
  }
  uint64_t v13 = *v3;
  v3[2] = v12 + 1;
  *(unsigned char *)(v13 + v12) = BYTE4(a2);
  uint64_t v14 = v3[2];
  if (v14 == v3[1])
  {
    uint64_t result = sub_10030DC4C(v3);
    uint64_t v14 = v3[2];
  }
  uint64_t v15 = *v3;
  v3[2] = v14 + 1;
  *(unsigned char *)(v15 + v14) = BYTE5(a2);
  uint64_t v16 = v3[2];
  if (v16 == v3[1])
  {
    uint64_t result = sub_10030DC4C(v3);
    uint64_t v16 = v3[2];
  }
  uint64_t v17 = *v3;
  v3[2] = v16 + 1;
  *(unsigned char *)(v17 + v16) = BYTE6(a2);
  uint64_t v18 = v3[2];
  if (v18 == v3[1])
  {
    uint64_t result = sub_10030DC4C(v3);
    uint64_t v18 = v3[2];
  }
  uint64_t v19 = *v3;
  v3[2] = v18 + 1;
  *(unsigned char *)(v19 + v1_Block_object_dispose(&STACK[0x410], 8) = HIBYTE(a2);
  return result;
}

uint64_t *sub_10030AC88(uint64_t *result, int a2)
{
  unsigned int v3 = result;
  uint64_t v4 = result[2];
  if (v4 == result[1])
  {
    uint64_t result = sub_10030DC4C(result);
    uint64_t v4 = v3[2];
  }
  uint64_t v5 = *v3;
  v3[2] = v4 + 1;
  *(unsigned char *)(v5 + v4) = a2;
  uint64_t v6 = v3[2];
  if (v6 == v3[1])
  {
    uint64_t result = sub_10030DC4C(v3);
    uint64_t v6 = v3[2];
  }
  uint64_t v7 = *v3;
  v3[2] = v6 + 1;
  *(unsigned char *)(v7 + v6) = BYTE1(a2);
  uint64_t v8 = v3[2];
  if (v8 == v3[1])
  {
    uint64_t result = sub_10030DC4C(v3);
    uint64_t v8 = v3[2];
  }
  uint64_t v9 = *v3;
  v3[2] = v8 + 1;
  *(unsigned char *)(v9 + v_Block_object_dispose(&STACK[0x410], 8) = BYTE2(a2);
  uint64_t v10 = v3[2];
  if (v10 == v3[1])
  {
    uint64_t result = sub_10030DC4C(v3);
    uint64_t v10 = v3[2];
  }
  uint64_t v11 = *v3;
  v3[2] = v10 + 1;
  *(unsigned char *)(v11 + v10) = HIBYTE(a2);
  return result;
}

uint64_t *sub_10030ADC0(uint64_t *result, unint64_t a2)
{
  unint64_t v2 = a2;
  unsigned int v3 = result;
  if (a2 >= 0x80)
  {
    do
    {
      uint64_t v5 = v3[2];
      if (v5 == v3[1])
      {
        uint64_t result = sub_10030DC4C(v3);
        uint64_t v5 = v3[2];
      }
      uint64_t v6 = *v3;
      v3[2] = v5 + 1;
      *(unsigned char *)(v6 + v5) = v2 | 0x80;
      unint64_t v4 = v2 >> 7;
      BOOL v7 = v2 >= 0x4000;
      v2 >>= 7;
    }
    while (v7);
  }
  else
  {
    LOBYTE(v4) = a2;
  }
  uint64_t v8 = v3[2];
  if (v8 == v3[1])
  {
    uint64_t result = sub_10030DC4C(v3);
    uint64_t v8 = v3[2];
  }
  uint64_t v9 = *v3;
  v3[2] = v8 + 1;
  *(unsigned char *)(v9 + v_Block_object_dispose(&STACK[0x410], 8) = v4;
  return result;
}

uint64_t *sub_10030AF20(uint64_t *result, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0) {
    return sub_10030ADC0(result, (int)a2);
  }
  else {
    return sub_10030B2F8(result, a2);
  }
}

uint64_t *sub_10030B2F8(uint64_t *result, unsigned int a2)
{
  unsigned int v2 = a2;
  unsigned int v3 = result;
  if (a2 >= 0x80)
  {
    do
    {
      uint64_t v5 = v3[2];
      if (v5 == v3[1])
      {
        uint64_t result = sub_10030DC4C(v3);
        uint64_t v5 = v3[2];
      }
      uint64_t v6 = *v3;
      v3[2] = v5 + 1;
      *(unsigned char *)(v6 + v5) = v2 | 0x80;
      unsigned int v4 = v2 >> 7;
      BOOL v7 = v2 >= 0x4000;
      v2 >>= 7;
    }
    while (v7);
  }
  else
  {
    LOBYTE(v4) = a2;
  }
  uint64_t v8 = v3[2];
  if (v8 == v3[1])
  {
    uint64_t result = sub_10030DC4C(v3);
    uint64_t v8 = v3[2];
  }
  uint64_t v9 = *v3;
  v3[2] = v8 + 1;
  *(unsigned char *)(v9 + v_Block_object_dispose(&STACK[0x410], 8) = v4;
  return result;
}

uint64_t *sub_10030B70C(uint64_t *a1, int a2, unsigned int a3)
{
  unsigned int Tag = GPBWireFormatMakeTag(a2, 0);
  sub_10030B2F8(a1, Tag);

  return sub_10030B2F8(a1, a3);
}

void sub_10030BAE0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10030BAF8(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 8;
  return result;
}

uint64_t GPBComputeDoubleSizeNoTag()
{
  return 8;
}

id sub_10030BB18(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeDoubleNoTag:];
}

id sub_10030BB20(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeDouble:*(unsigned int *)(a1 + 40)];
}

void sub_10030BCC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10030BCD8(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t GPBComputeFloatSizeNoTag()
{
  return 4;
}

id sub_10030BCF8(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeFloatNoTag:];
}

id sub_10030BD00(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeFloat:*(unsigned int *)(a1 + 40)];
}

void sub_10030BEA0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10030BEB8(uint64_t a1, unint64_t a2)
{
  uint64_t result = GPBComputeRawVarint64Size(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

id sub_10030BEF8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeUInt64NoTag:a2];
}

id sub_10030BF04(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeUInt64:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10030C0A8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10030C0C0(uint64_t a1, unint64_t a2)
{
  uint64_t result = GPBComputeRawVarint64Size(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

id sub_10030C100(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeInt64NoTag:a2];
}

id sub_10030C10C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeInt64:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10030C2B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10030C2C8(uint64_t result, unsigned int a2)
{
  uint64_t v2 = 10;
  uint64_t v3 = 1;
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (a2 >> 28) {
    uint64_t v6 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (a2 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (a2 >= 0x80) {
    uint64_t v3 = v4;
  }
  if ((a2 & 0x80000000) == 0) {
    uint64_t v2 = v3;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t GPBComputeInt32SizeNoTag(unsigned int a1)
{
  uint64_t v1 = 1;
  uint64_t v2 = 2;
  uint64_t v3 = 3;
  uint64_t v4 = 4;
  if (a1 >> 28) {
    uint64_t v4 = 5;
  }
  if (a1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (a1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x80) {
    uint64_t v1 = v2;
  }
  if ((a1 & 0x80000000) == 0) {
    return v1;
  }
  else {
    return 10;
  }
}

id sub_10030C364(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeInt32NoTag:a2];
}

id sub_10030C370(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeInt32:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10030C514(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10030C52C(uint64_t result, unsigned int a2)
{
  uint64_t v2 = 1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (a2 >> 28) {
    uint64_t v5 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (a2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (a2 >= 0x80) {
    uint64_t v2 = v3;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t GPBComputeUInt32SizeNoTag(unsigned int a1)
{
  uint64_t v1 = 2;
  uint64_t v2 = 3;
  uint64_t v3 = 4;
  if (a1 >> 28) {
    uint64_t v3 = 5;
  }
  if (a1 >= 0x200000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x4000) {
    uint64_t v1 = v2;
  }
  if (a1 >= 0x80) {
    return v1;
  }
  else {
    return 1;
  }
}

id sub_10030C5B0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeUInt32NoTag:a2];
}

id sub_10030C5BC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeUInt32:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10030C760(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10030C778(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 8;
  return result;
}

uint64_t GPBComputeFixed64SizeNoTag()
{
  return 8;
}

id sub_10030C798(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeFixed64NoTag:a2];
}

id sub_10030C7A4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeFixed64:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10030C948(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10030C960(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t GPBComputeFixed32SizeNoTag()
{
  return 4;
}

id sub_10030C980(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeFixed32NoTag:a2];
}

id sub_10030C98C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeFixed32:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10030CB30(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10030CB48(uint64_t result, int a2)
{
  unsigned int v2 = (2 * a2) ^ (a2 >> 31);
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (v2 >> 28) {
    uint64_t v5 = 5;
  }
  if (v2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v2 >= 0x80) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 1;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v6;
  return result;
}

uint64_t GPBComputeSInt32SizeNoTag(int a1)
{
  unsigned int v1 = (2 * a1) ^ (a1 >> 31);
  uint64_t v2 = 2;
  uint64_t v3 = 3;
  uint64_t v4 = 4;
  if (v1 >> 28) {
    uint64_t v4 = 5;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    return v2;
  }
  else {
    return 1;
  }
}

id sub_10030CBDC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSInt32NoTag:a2];
}

id sub_10030CBE8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSInt32:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10030CD8C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10030CDA4(uint64_t a1, uint64_t a2)
{
  uint64_t result = GPBComputeRawVarint64Size((2 * a2) ^ (a2 >> 63));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t GPBComputeSInt64SizeNoTag(uint64_t a1)
{
  return GPBComputeRawVarint64Size((2 * a1) ^ (a1 >> 63));
}

id sub_10030CDF0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSInt64NoTag:a2];
}

id sub_10030CDFC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSInt64:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10030CFA0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10030CFB8(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 8;
  return result;
}

uint64_t GPBComputeSFixed64SizeNoTag()
{
  return 8;
}

id sub_10030CFD8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSFixed64NoTag:a2];
}

id sub_10030CFE4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSFixed64:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10030D188(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10030D1A0(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t GPBComputeSFixed32SizeNoTag()
{
  return 4;
}

id sub_10030D1C0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSFixed32NoTag:a2];
}

id sub_10030D1CC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSFixed32:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10030D370(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10030D388(uint64_t result)
{
  return result;
}

uint64_t GPBComputeBoolSizeNoTag()
{
  return 1;
}

id sub_10030D3A8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeBoolNoTag:a2];
}

id sub_10030D3B4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeBool:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10030D558(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10030D570(uint64_t result, unsigned int a2)
{
  uint64_t v2 = 10;
  uint64_t v3 = 1;
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (a2 >> 28) {
    uint64_t v6 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (a2 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (a2 >= 0x80) {
    uint64_t v3 = v4;
  }
  if ((a2 & 0x80000000) == 0) {
    uint64_t v2 = v3;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t GPBComputeEnumSizeNoTag(unsigned int a1)
{
  uint64_t v1 = 1;
  uint64_t v2 = 2;
  uint64_t v3 = 3;
  uint64_t v4 = 4;
  if (a1 >> 28) {
    uint64_t v4 = 5;
  }
  if (a1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (a1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x80) {
    uint64_t v1 = v2;
  }
  if ((a1 & 0x80000000) == 0) {
    return v1;
  }
  else {
    return 10;
  }
}

id sub_10030D60C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeEnumNoTag:a2];
}

id sub_10030D618(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeEnum:*(unsigned int *)(a1 + 40) value:a2];
}

void *sub_10030DC4C(void *result)
{
  uint64_t v1 = result;
  if (!result[3]) {
    uint64_t result = +[NSException raise:@"OutOfSpace" format:&stru_1003BC4E8];
  }
  if (v1[2])
  {
    uint64_t result = [v1[3] write:*v1];
    if (result != (void *)v1[2]) {
      uint64_t result = +[NSException raise:@"WriteFailed" format:&stru_1003BC4E8];
    }
    v1[2] = 0;
  }
  return result;
}

uint64_t GPBComputeRawVarint64Size(unint64_t a1)
{
  if (a1 < 0x80) {
    return 1;
  }
  if (a1 < 0x4000) {
    return 2;
  }
  if (a1 < 0x200000) {
    return 3;
  }
  if (!(a1 >> 28)) {
    return 4;
  }
  if (!(a1 >> 35)) {
    return 5;
  }
  if (!(a1 >> 42)) {
    return 6;
  }
  if (!(a1 >> 49)) {
    return 7;
  }
  uint64_t v2 = 9;
  if ((a1 & 0x8000000000000000) != 0) {
    uint64_t v2 = 10;
  }
  if (HIBYTE(a1)) {
    return v2;
  }
  else {
    return 8;
  }
}

uint64_t GPBComputeRawVarint32Size(unsigned int a1)
{
  uint64_t v1 = 2;
  uint64_t v2 = 3;
  uint64_t v3 = 4;
  if (a1 >> 28) {
    uint64_t v3 = 5;
  }
  if (a1 >= 0x200000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x4000) {
    uint64_t v1 = v2;
  }
  if (a1 >= 0x80) {
    return v1;
  }
  else {
    return 1;
  }
}

uint64_t GPBComputeSizeTSizeAsInt32NoTag(unsigned int a1)
{
  uint64_t v1 = 1;
  uint64_t v2 = 2;
  uint64_t v3 = 3;
  uint64_t v4 = 4;
  if (a1 >> 28) {
    uint64_t v4 = 5;
  }
  if (a1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (a1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x80) {
    uint64_t v1 = v2;
  }
  if ((a1 & 0x80000000) == 0) {
    return v1;
  }
  else {
    return 10;
  }
}

char *GPBComputeStringSizeNoTag(void *a1)
{
  uint64_t v1 = (char *)[a1 lengthOfBytesUsingEncoding:4];
  uint64_t v2 = 1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (v1 >> 28) {
    uint64_t v5 = 5;
  }
  if (v1 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v1 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x80) {
    uint64_t v2 = v3;
  }
  return &v1[v2];
}

uint64_t GPBComputeRawVarint32SizeForInteger(unsigned int a1)
{
  uint64_t v1 = 2;
  uint64_t v2 = 3;
  uint64_t v3 = 4;
  if (a1 >> 28) {
    uint64_t v3 = 5;
  }
  if (a1 >= 0x200000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x4000) {
    uint64_t v1 = v2;
  }
  if (a1 >= 0x80) {
    return v1;
  }
  else {
    return 1;
  }
}

char *GPBComputeMessageSizeNoTag(void *a1)
{
  uint64_t v1 = (char *)[a1 serializedSize];
  uint64_t v2 = 1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (v1 >> 28) {
    uint64_t v5 = 5;
  }
  if (v1 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v1 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x80) {
    uint64_t v2 = v3;
  }
  return &v1[v2];
}

char *GPBComputeBytesSizeNoTag(void *a1)
{
  uint64_t v1 = (char *)[a1 length];
  uint64_t v2 = 1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (v1 >> 28) {
    uint64_t v5 = 5;
  }
  if (v1 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v1 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x80) {
    uint64_t v2 = v3;
  }
  return &v1[v2];
}

uint64_t GPBComputeDoubleSize(int a1)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v2 = 10;
  uint64_t v3 = 11;
  uint64_t v4 = 12;
  if (Tag >> 28) {
    uint64_t v4 = 13;
  }
  if (Tag >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (Tag >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (Tag >= 0x80) {
    return v2;
  }
  else {
    return 9;
  }
}

uint64_t GPBComputeTagSize(int a1)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v2 = 2;
  uint64_t v3 = 3;
  uint64_t v4 = 4;
  if (Tag >> 28) {
    uint64_t v4 = 5;
  }
  if (Tag >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (Tag >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (Tag >= 0x80) {
    return v2;
  }
  else {
    return 1;
  }
}

uint64_t GPBComputeFloatSize(int a1)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v2 = 6;
  uint64_t v3 = 7;
  uint64_t v4 = 8;
  if (Tag >> 28) {
    uint64_t v4 = 9;
  }
  if (Tag >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (Tag >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (Tag >= 0x80) {
    return v2;
  }
  else {
    return 5;
  }
}

uint64_t GPBComputeUInt64Size(int a1, unint64_t a2)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (Tag >> 28) {
    uint64_t v6 = 5;
  }
  if (Tag >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (Tag >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (Tag >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 1;
  }
  return GPBComputeRawVarint64Size(a2) + v7;
}

uint64_t GPBComputeInt64Size(int a1, unint64_t a2)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (Tag >> 28) {
    uint64_t v6 = 5;
  }
  if (Tag >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (Tag >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (Tag >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 1;
  }
  return GPBComputeRawVarint64Size(a2) + v7;
}

uint64_t GPBComputeInt32Size(int a1, unsigned int a2)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v4 = 1;
  uint64_t v5 = 2;
  uint64_t v6 = 3;
  uint64_t v7 = 4;
  if (Tag >> 28) {
    uint64_t v7 = 5;
  }
  if (Tag >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (Tag >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (Tag >= 0x80) {
    uint64_t v4 = v5;
  }
  uint64_t v8 = 10;
  uint64_t v9 = 1;
  uint64_t v10 = 2;
  uint64_t v11 = 3;
  uint64_t v12 = 4;
  if (a2 >> 28) {
    uint64_t v12 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v11 = v12;
  }
  if (a2 >= 0x4000) {
    uint64_t v10 = v11;
  }
  if (a2 >= 0x80) {
    uint64_t v9 = v10;
  }
  if ((a2 & 0x80000000) == 0) {
    uint64_t v8 = v9;
  }
  return v8 + v4;
}

uint64_t GPBComputeFixed64Size(int a1)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v2 = 10;
  uint64_t v3 = 11;
  uint64_t v4 = 12;
  if (Tag >> 28) {
    uint64_t v4 = 13;
  }
  if (Tag >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (Tag >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (Tag >= 0x80) {
    return v2;
  }
  else {
    return 9;
  }
}

uint64_t GPBComputeFixed32Size(int a1)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v2 = 6;
  uint64_t v3 = 7;
  uint64_t v4 = 8;
  if (Tag >> 28) {
    uint64_t v4 = 9;
  }
  if (Tag >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (Tag >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (Tag >= 0x80) {
    return v2;
  }
  else {
    return 5;
  }
}

uint64_t GPBComputeBoolSize(int a1)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v2 = 3;
  uint64_t v3 = 4;
  uint64_t v4 = 5;
  if (Tag >> 28) {
    uint64_t v4 = 6;
  }
  if (Tag >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (Tag >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (Tag >= 0x80) {
    return v2;
  }
  else {
    return 2;
  }
}

char *GPBComputeStringSize(int a1, void *a2)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (Tag >> 28) {
    uint64_t v6 = 5;
  }
  if (Tag >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (Tag >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (Tag >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 1;
  }
  uint64_t v8 = (char *)[a2 lengthOfBytesUsingEncoding:4];
  uint64_t v9 = 1;
  uint64_t v10 = 2;
  uint64_t v11 = 3;
  uint64_t v12 = 4;
  if (v8 >> 28) {
    uint64_t v12 = 5;
  }
  if (v8 >= 0x200000) {
    uint64_t v11 = v12;
  }
  if (v8 >= 0x4000) {
    uint64_t v10 = v11;
  }
  if (v8 >= 0x80) {
    uint64_t v9 = v10;
  }
  return &v8[v7 + v9];
}

char *GPBComputeGroupSize(int a1, void *a2)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v4 = 4;
  uint64_t v5 = 6;
  uint64_t v6 = 10;
  if (!(Tag >> 28)) {
    uint64_t v6 = 8;
  }
  if (Tag >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (Tag >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (Tag >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 2;
  }
  return (char *)[a2 serializedSize] + v7;
}

char *GPBComputeUnknownGroupSize(int a1, void *a2)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v4 = 4;
  uint64_t v5 = 6;
  uint64_t v6 = 10;
  if (!(Tag >> 28)) {
    uint64_t v6 = 8;
  }
  if (Tag >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (Tag >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (Tag >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 2;
  }
  return (char *)[a2 serializedSize] + v7;
}

char *GPBComputeMessageSize(int a1, void *a2)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (Tag >> 28) {
    uint64_t v6 = 5;
  }
  if (Tag >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (Tag >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (Tag >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 1;
  }
  uint64_t v8 = (char *)[a2 serializedSize];
  uint64_t v9 = 1;
  uint64_t v10 = 2;
  uint64_t v11 = 3;
  uint64_t v12 = 4;
  if (v8 >> 28) {
    uint64_t v12 = 5;
  }
  if (v8 >= 0x200000) {
    uint64_t v11 = v12;
  }
  if (v8 >= 0x4000) {
    uint64_t v10 = v11;
  }
  if (v8 >= 0x80) {
    uint64_t v9 = v10;
  }
  return &v8[v7 + v9];
}

char *GPBComputeBytesSize(int a1, void *a2)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (Tag >> 28) {
    uint64_t v6 = 5;
  }
  if (Tag >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (Tag >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (Tag >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 1;
  }
  uint64_t v8 = (char *)[a2 length];
  uint64_t v9 = 1;
  uint64_t v10 = 2;
  uint64_t v11 = 3;
  uint64_t v12 = 4;
  if (v8 >> 28) {
    uint64_t v12 = 5;
  }
  if (v8 >= 0x200000) {
    uint64_t v11 = v12;
  }
  if (v8 >= 0x4000) {
    uint64_t v10 = v11;
  }
  if (v8 >= 0x80) {
    uint64_t v9 = v10;
  }
  return &v8[v7 + v9];
}

uint64_t GPBComputeUInt32Size(int a1, unsigned int a2)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v4 = 1;
  uint64_t v5 = 2;
  uint64_t v6 = 3;
  uint64_t v7 = 4;
  if (Tag >> 28) {
    uint64_t v7 = 5;
  }
  if (Tag >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (Tag >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (Tag >= 0x80) {
    uint64_t v4 = v5;
  }
  uint64_t v8 = 1;
  uint64_t v9 = 2;
  uint64_t v10 = 3;
  uint64_t v11 = 4;
  if (a2 >> 28) {
    uint64_t v11 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v10 = v11;
  }
  if (a2 >= 0x4000) {
    uint64_t v9 = v10;
  }
  if (a2 >= 0x80) {
    uint64_t v8 = v9;
  }
  return v8 + v4;
}

uint64_t GPBComputeEnumSize(int a1, unsigned int a2)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v4 = 1;
  uint64_t v5 = 2;
  uint64_t v6 = 3;
  uint64_t v7 = 4;
  if (Tag >> 28) {
    uint64_t v7 = 5;
  }
  if (Tag >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (Tag >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (Tag >= 0x80) {
    uint64_t v4 = v5;
  }
  uint64_t v8 = 10;
  uint64_t v9 = 1;
  uint64_t v10 = 2;
  uint64_t v11 = 3;
  uint64_t v12 = 4;
  if (a2 >> 28) {
    uint64_t v12 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v11 = v12;
  }
  if (a2 >= 0x4000) {
    uint64_t v10 = v11;
  }
  if (a2 >= 0x80) {
    uint64_t v9 = v10;
  }
  if ((a2 & 0x80000000) == 0) {
    uint64_t v8 = v9;
  }
  return v8 + v4;
}

uint64_t GPBComputeSFixed32Size(int a1)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v2 = 6;
  uint64_t v3 = 7;
  uint64_t v4 = 8;
  if (Tag >> 28) {
    uint64_t v4 = 9;
  }
  if (Tag >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (Tag >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (Tag >= 0x80) {
    return v2;
  }
  else {
    return 5;
  }
}

uint64_t GPBComputeSFixed64Size(int a1)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v2 = 10;
  uint64_t v3 = 11;
  uint64_t v4 = 12;
  if (Tag >> 28) {
    uint64_t v4 = 13;
  }
  if (Tag >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (Tag >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (Tag >= 0x80) {
    return v2;
  }
  else {
    return 9;
  }
}

uint64_t GPBComputeSInt32Size(int a1, int a2)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v4 = 1;
  uint64_t v5 = 2;
  uint64_t v6 = 3;
  uint64_t v7 = 4;
  if (Tag >> 28) {
    uint64_t v7 = 5;
  }
  if (Tag >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (Tag >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (Tag >= 0x80) {
    uint64_t v4 = v5;
  }
  unsigned int v8 = (2 * a2) ^ (a2 >> 31);
  uint64_t v9 = 2;
  uint64_t v10 = 3;
  uint64_t v11 = 4;
  if (v8 >> 28) {
    uint64_t v11 = 5;
  }
  if (v8 >= 0x200000) {
    uint64_t v10 = v11;
  }
  if (v8 >= 0x4000) {
    uint64_t v9 = v10;
  }
  if (v8 >= 0x80) {
    uint64_t v12 = v9;
  }
  else {
    uint64_t v12 = 1;
  }
  return v12 + v4;
}

uint64_t GPBComputeSInt64Size(int a1, uint64_t a2)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (Tag >> 28) {
    uint64_t v6 = 5;
  }
  if (Tag >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (Tag >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (Tag >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 1;
  }
  return GPBComputeRawVarint64Size((2 * a2) ^ (a2 >> 63)) + v7;
}

char *GPBComputeMessageSetExtensionSize(unsigned int a1, void *a2)
{
  unsigned int Tag = GPBWireFormatMakeTag(1, 0);
  uint64_t v5 = 4;
  uint64_t v6 = 6;
  uint64_t v7 = 10;
  if (!(Tag >> 28)) {
    uint64_t v7 = 8;
  }
  if (Tag >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (Tag >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (Tag >= 0x80) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = 2;
  }
  uint64_t v9 = GPBComputeUInt32Size(2, a1) + v8;
  return &GPBComputeMessageSize(3, a2)[v9];
}

char *GPBComputeRawMessageSetExtensionSize(unsigned int a1, void *a2)
{
  unsigned int Tag = GPBWireFormatMakeTag(1, 0);
  uint64_t v5 = 4;
  uint64_t v6 = 6;
  uint64_t v7 = 10;
  if (!(Tag >> 28)) {
    uint64_t v7 = 8;
  }
  if (Tag >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (Tag >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (Tag >= 0x80) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = 2;
  }
  uint64_t v9 = GPBComputeUInt32Size(2, a1) + v8;
  return &GPBComputeBytesSize(3, a2)[v9];
}

uint64_t GPBComputeWireFormatTagSize(int a1, int a2)
{
  unsigned int Tag = GPBWireFormatMakeTag(a1, 0);
  uint64_t v4 = 1;
  uint64_t v5 = 2;
  uint64_t v6 = 3;
  uint64_t v7 = 4;
  if (Tag >> 28) {
    uint64_t v7 = 5;
  }
  if (Tag >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (Tag >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (Tag >= 0x80) {
    uint64_t v4 = v5;
  }
  return v4 << (a2 == 16);
}

void sub_10030EDF8(void *key, const __CFDictionary *a2, CFDictionaryRef theDict)
{
  Value = (void *)CFDictionaryGetValue(theDict, key);
  if (Value)
  {
    CFDictionaryApplyFunction(a2, (CFDictionaryApplierFunction)sub_10030EEB0, Value);
  }
  else
  {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, a2);
    CFDictionarySetValue(theDict, key, MutableCopy);
    CFRelease(MutableCopy);
  }
}

void sub_10030EEB0(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

BOOL sub_10031345C(int a1)
{
  return a1 != -72499473;
}

void GPBExtensionMergeFromInputStream(void *a1, int a2, uint64_t *a3, uint64_t a4, void *a5)
{
  uint64_t v9 = a1[1];
  if (a2)
  {
    if ((*(unsigned char *)(v9 + 45) & 1) == 0) {
      [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void GPBExtensionMergeFromInputStream(GPBExtensionDescriptor *, BOOL, GPBCodedInputStream *, GPBExtensionRegistry *, GPBMessage *)"] file:@"GPBExtensionInternals.m" lineNumber:282 description:@"How was it packed if it isn't repeated?"];
    }
    int Int32 = GPBCodedInputStreamReadInt32(a3 + 1);
    unint64_t v11 = GPBCodedInputStreamPushLimit((uint64_t)(a3 + 1), Int32);
    while (GPBCodedInputStreamBytesUntilLimit((uint64_t)(a3 + 1)))
    {
      uint64_t v12 = (__CFString *)sub_1003146E4(a1, a3, a4, 0);
      [a5 addExtension:a1 value:v12];
    }
    GPBCodedInputStreamPopLimit((uint64_t)(a3 + 1), v11);
  }
  else
  {
    if (*(unsigned char *)(v9 + 45))
    {
      uint64_t v14 = (__CFString *)sub_1003146E4(a1, a3, a4, 0);
      [a5 addExtension:a1];
    }
    else
    {
      if (*(unsigned __int8 *)(v9 + 44) - 15 > 1) {
        id v13 = 0;
      }
      else {
        id v13 = [a5 getExistingExtension:a1];
      }
      uint64_t v14 = (__CFString *)sub_1003146E4(a1, a3, a4, v13);
      [a5 setExtension:a1];
    }
  }
}

CFStringRef sub_1003146E4(void *a1, uint64_t *a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a1[1];
  uint64_t v6 = a2 + 1;
  switch(*(unsigned char *)(v4 + 44))
  {
    case 0:
      id v18 = objc_alloc((Class)NSNumber);
      BOOL Bool = GPBCodedInputStreamReadBool(v6);
      return (const __CFString *)[v18 initWithBool:Bool];
    case 1:
      id v15 = objc_alloc((Class)NSNumber);
      uint64_t Fixed32 = GPBCodedInputStreamReadFixed32(v6);
      goto LABEL_23;
    case 2:
      id v9 = objc_alloc((Class)NSNumber);
      Suint64_t Fixed32 = GPBCodedInputStreamReadSFixed32(v6);
      goto LABEL_40;
    case 3:
      id v11 = objc_alloc((Class)NSNumber);
      GPBCodedInputStreamReadFloat(v6);
      return (const __CFString *)[v11 initWithFloat:v12];
    case 4:
      id v13 = objc_alloc((Class)NSNumber);
      uint64_t Fixed64 = GPBCodedInputStreamReadFixed64(v6);
      goto LABEL_12;
    case 5:
      id v20 = objc_alloc((Class)NSNumber);
      Suint64_t Fixed64 = GPBCodedInputStreamReadSFixed64(v6);
      goto LABEL_33;
    case 6:
      id v22 = objc_alloc((Class)NSNumber);
      GPBCodedInputStreamReadDouble(v6);
      return (const __CFString *)[v22 initWithDouble:v23];
    case 7:
      id v9 = objc_alloc((Class)NSNumber);
      Suint64_t Fixed32 = GPBCodedInputStreamReadInt32(v6);
      goto LABEL_40;
    case 8:
      id v20 = objc_alloc((Class)NSNumber);
      Suint64_t Fixed64 = GPBCodedInputStreamReadInt64(v6);
      goto LABEL_33;
    case 9:
      id v9 = objc_alloc((Class)NSNumber);
      Suint64_t Fixed32 = GPBCodedInputStreamReadSInt32(v6);
      goto LABEL_40;
    case 0xA:
      id v20 = objc_alloc((Class)NSNumber);
      Suint64_t Fixed64 = GPBCodedInputStreamReadSInt64(v6);
LABEL_33:
      return (const __CFString *)[v20 initWithLongLong:SFixed64];
    case 0xB:
      id v15 = objc_alloc((Class)NSNumber);
      uint64_t Fixed32 = GPBCodedInputStreamReadUInt32(v6);
LABEL_23:
      return (const __CFString *)[v15 initWithUnsignedInt:Fixed32];
    case 0xC:
      id v13 = objc_alloc((Class)NSNumber);
      uint64_t Fixed64 = GPBCodedInputStreamReadUInt64(v6);
LABEL_12:
      return (const __CFString *)[v13 initWithUnsignedLongLong:Fixed64];
    case 0xD:
      return (const __CFString *)GPBCodedInputStreamReadRetainedBytes(a2 + 1);
    case 0xE:
      return GPBCodedInputStreamReadRetainedString(a2 + 1);
    case 0xF:
    case 0x10:
      if (a4) {
        id v8 = a4;
      }
      else {
        id v8 = [objc_alloc_init((Class)[objc_msgSend(objc_msgSend(a1, "msgClass"), "descriptor") messageClass]);
      }
      id v17 = v8;
      if (*(unsigned char *)(v4 + 44) == 16)
      {
        [a2 readGroup:*(unsigned int *)(v4 + 40) message:v8 extensionRegistry:a3];
      }
      else if ((*(unsigned char *)(v4 + 45) & 4) != 0)
      {
        [v8 mergeFromCodedInputStream:a2 extensionRegistry:a3];
      }
      else
      {
        [a2 readMessage:v8 extensionRegistry:a3];
      }
      return (const __CFString *)v17;
    case 0x11:
      id v9 = objc_alloc((Class)NSNumber);
      Suint64_t Fixed32 = GPBCodedInputStreamReadEnum(v6);
LABEL_40:
      return (const __CFString *)[v9 initWithInt:SFixed32];
    default:
      return 0;
  }
}

id GPBWriteExtensionValueToOutputStream(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 8);
  if (*(unsigned char *)(v5 + 45))
  {
    if ((*(unsigned char *)(v5 + 45) & 2) != 0)
    {
      [a3 writeTag:*(unsigned int *)(v5 + 40) format:2];
      unint64_t v10 = *(char *)(v5 + 44);
      if (v10 > 6)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v13 = [a2 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v12 = 0;
          uint64_t v15 = *(void *)v25;
          do
          {
            for (unint64_t i = 0; i != v14; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(a2);
              }
              v12 += sub_1003159C8(*(unsigned __int8 *)(v5 + 44), *(void **)(*((void *)&v24 + 1) + 8 * i));
            }
            id v14 = [a2 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v14);
        }
        else
        {
          uint64_t v12 = 0;
        }
      }
      else
      {
        uint64_t v11 = qword_10033F628[v10];
        uint64_t v12 = (void)[a2 count] * v11;
      }
      [a3 writeRawVarintSizeTAs32:v12];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id result = [a2 countByEnumeratingWithState:&v20 objects:&v28 count:16];
      if (result)
      {
        id v17 = result;
        uint64_t v18 = *(void *)v21;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v21 != v18) {
              objc_enumerationMutation(a2);
            }
            switch(*(unsigned char *)(v5 + 44))
            {
              case 0:
                [a3 writeBoolNoTag:[v20 BOOLValue]];
                break;
              case 1:
                [a3 writeFixed32NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) unsignedIntValue]];
                break;
              case 2:
                [a3 writeSFixed32NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) intValue]];
                break;
              case 3:
                [*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) floatValue];
                [a3 writeFloatNoTag:];
                break;
              case 4:
                [a3 writeFixed64NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) unsignedLongLongValue]];
                break;
              case 5:
                [a3 writeSFixed64NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) longLongValue]];
                break;
              case 6:
                [*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) doubleValue];
                [a3 writeDoubleNoTag:];
                break;
              case 7:
                [a3 writeInt32NoTag:[(*(id *)(*((void *)&v20 + 1) + 8 * (void)v19)) intValue]];
                break;
              case 8:
                [a3 writeInt64NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) longLongValue]];
                break;
              case 9:
                [a3 writeSInt32NoTag:[v20 intValue]];
                break;
              case 0xA:
                [a3 writeSInt64NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) longLongValue]];
                break;
              case 0xB:
                [a3 writeUInt32NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) unsignedIntValue]];
                break;
              case 0xC:
                [a3 writeUInt64NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) unsignedLongLongValue]];
                break;
              case 0xD:
                [a3 writeBytesNoTag:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19)];
                break;
              case 0xE:
                [a3 writeStringNoTag:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19)];
                break;
              case 0xF:
                [a3 writeMessageNoTag:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19)];
                break;
              case 0x10:
                [a3 writeGroupNoTag:*(unsigned int *)(v5 + 40) value:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19)];
                break;
              case 0x11:
                [a3 writeEnumNoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) intValue]];
                break;
              default:
                break;
            }
            uint64_t v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          id result = [a2 countByEnumeratingWithState:&v20 objects:&v28 count:16];
          id v17 = result;
        }
        while (result);
      }
    }
    else
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id result = [a2 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (result)
      {
        id v7 = result;
        uint64_t v8 = *(void *)v29;
        do
        {
          id v9 = 0;
          do
          {
            if (*(void *)v29 != v8) {
              objc_enumerationMutation(a2);
            }
            sub_100314F98(*(id *)(*((void *)&v28 + 1) + 8 * (void)v9), v5, a3);
            id v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          id result = [a2 countByEnumeratingWithState:&v28 objects:v32 count:16];
          id v7 = result;
        }
        while (result);
      }
    }
  }
  else
  {
    return sub_100314F98(a2, v5, a3);
  }
  return result;
}

id sub_100314F98(id result, uint64_t a2, void *a3)
{
  switch(*(unsigned char *)(a2 + 44))
  {
    case 0:
      uint64_t v4 = *(unsigned int *)(a2 + 40);
      id v5 = [result BOOLValue];
      id result = [a3 writeBool:v4 value:v5];
      break;
    case 1:
      uint64_t v13 = *(unsigned int *)(a2 + 40);
      [result unsignedIntValue];
      id result = [a3 writeFixed32:v13];
      break;
    case 2:
      uint64_t v6 = *(unsigned int *)(a2 + 40);
      [result intValue];
      id result = [a3 writeSFixed32:v6 value:];
      break;
    case 3:
      uint64_t v14 = *(unsigned int *)(a2 + 40);
      [result floatValue];
      id result = [a3 writeFloat:v14 value:];
      break;
    case 4:
      uint64_t v7 = *(unsigned int *)(a2 + 40);
      [result unsignedLongLongValue];
      id result = [a3 writeFixed64:v7];
      break;
    case 5:
      uint64_t v15 = *(unsigned int *)(a2 + 40);
      [result longLongValue];
      id result = [a3 writeSFixed64:v15];
      break;
    case 6:
      uint64_t v16 = *(unsigned int *)(a2 + 40);
      [result doubleValue];
      id result = [a3 writeDouble:v16];
      break;
    case 7:
      uint64_t v17 = *(unsigned int *)(a2 + 40);
      [result intValue];
      id result = [a3 writeInt32:v17];
      break;
    case 8:
      uint64_t v18 = *(unsigned int *)(a2 + 40);
      [result longLongValue];
      id result = [a3 writeInt64:v18 value:];
      break;
    case 9:
      uint64_t v8 = *(unsigned int *)(a2 + 40);
      [result intValue];
      id result = [a3 writeSInt32:v8 value:];
      break;
    case 0xA:
      uint64_t v19 = *(unsigned int *)(a2 + 40);
      [result longLongValue];
      id result = [a3 writeSInt64:v19];
      break;
    case 0xB:
      uint64_t v9 = *(unsigned int *)(a2 + 40);
      [result unsignedIntValue];
      id result = [a3 writeUInt32:v9 value:];
      break;
    case 0xC:
      uint64_t v10 = *(unsigned int *)(a2 + 40);
      [result unsignedLongLongValue];
      id result = [a3 writeUInt64:v10 value:];
      break;
    case 0xD:
      uint64_t v20 = *(unsigned int *)(a2 + 40);
      id result = [a3 writeBytes:v20 value:result];
      break;
    case 0xE:
      uint64_t v11 = *(unsigned int *)(a2 + 40);
      id result = [a3 writeString:v11 value:result];
      break;
    case 0xF:
      uint64_t v21 = *(unsigned int *)(a2 + 40);
      if ((*(unsigned char *)(a2 + 45) & 4) != 0)
      {
        id result = [a3 writeMessageSetExtension:v21];
      }
      else
      {
        id result = [a3 writeMessage:v21 value:result];
      }
      break;
    case 0x10:
      uint64_t v12 = *(unsigned int *)(a2 + 40);
      id result = [a3 writeGroup:v12 value:result];
      break;
    case 0x11:
      uint64_t v22 = *(unsigned int *)(a2 + 40);
      id v23 = [result intValue];
      id result = [a3 writeEnum:v22 value:v23];
      break;
    default:
      return result;
  }
  return result;
}

uint64_t GPBComputeExtensionSerializedSizeIncludingTag(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (*(unsigned char *)(v3 + 45))
  {
    if ((*(unsigned char *)(v3 + 45) & 2) != 0)
    {
      unint64_t v11 = *(char *)(v3 + 44);
      if (v11 > 6)
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v14 = [a2 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v13 = 0;
          uint64_t v16 = *(void *)v20;
          do
          {
            for (unint64_t i = 0; i != v15; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v20 != v16) {
                objc_enumerationMutation(a2);
              }
              v13 += sub_1003159C8(*(unsigned __int8 *)(v3 + 44), *(void **)(*((void *)&v19 + 1) + 8 * i));
            }
            id v15 = [a2 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v15);
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      else
      {
        uint64_t v12 = qword_10033F628[v11];
        uint64_t v13 = (void)[a2 count] * v12;
      }
      uint64_t v18 = GPBComputeTagSize(*(_DWORD *)(v3 + 40));
      return v18 + v13 + GPBComputeRawVarint32SizeForInteger(v13);
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v6 = [a2 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = 0;
        uint64_t v9 = *(void *)v20;
        do
        {
          for (j = 0; j != v7; j = (char *)j + 1)
          {
            if (*(void *)v20 != v9) {
              objc_enumerationMutation(a2);
            }
            v8 += sub_1003155FC(v3, *(void **)(*((void *)&v19 + 1) + 8 * (void)j));
          }
          id v7 = [a2 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v7);
      }
      else
      {
        return 0;
      }
    }
    return v8;
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 8);
    return sub_1003155FC(v4, a2);
  }
}

uint64_t sub_1003155FC(uint64_t result, void *a2)
{
  switch(*(unsigned char *)(result + 44))
  {
    case 0:
      int v2 = *(_DWORD *)(result + 40);
      [a2 BOOLValue];
      id result = GPBComputeBoolSize(v2);
      break;
    case 1:
      int v13 = *(_DWORD *)(result + 40);
      [a2 unsignedIntValue];
      id result = GPBComputeFixed32Size(v13);
      break;
    case 2:
      int v3 = *(_DWORD *)(result + 40);
      [a2 intValue];
      id result = GPBComputeSFixed32Size(v3);
      break;
    case 3:
      int v14 = *(_DWORD *)(result + 40);
      [a2 floatValue];
      id result = GPBComputeFloatSize(v14);
      break;
    case 4:
      int v4 = *(_DWORD *)(result + 40);
      [a2 unsignedLongLongValue];
      id result = GPBComputeFixed64Size(v4);
      break;
    case 5:
      int v15 = *(_DWORD *)(result + 40);
      [a2 longLongValue];
      id result = GPBComputeSFixed64Size(v15);
      break;
    case 6:
      int v16 = *(_DWORD *)(result + 40);
      [a2 doubleValue];
      id result = GPBComputeDoubleSize(v16);
      break;
    case 7:
      int v17 = *(_DWORD *)(result + 40);
      unsigned int v18 = [a2 intValue];
      id result = GPBComputeInt32Size(v17, v18);
      break;
    case 8:
      int v19 = *(_DWORD *)(result + 40);
      id v20 = [a2 longLongValue];
      id result = GPBComputeInt64Size(v19, (unint64_t)v20);
      break;
    case 9:
      int v5 = *(_DWORD *)(result + 40);
      int v6 = [a2 intValue];
      id result = GPBComputeSInt32Size(v5, v6);
      break;
    case 0xA:
      int v21 = *(_DWORD *)(result + 40);
      id v22 = [a2 longLongValue];
      id result = GPBComputeSInt64Size(v21, (uint64_t)v22);
      break;
    case 0xB:
      int v7 = *(_DWORD *)(result + 40);
      unsigned int v8 = [a2 unsignedIntValue];
      id result = GPBComputeUInt32Size(v7, v8);
      break;
    case 0xC:
      int v9 = *(_DWORD *)(result + 40);
      id v10 = [a2 unsignedLongLongValue];
      id result = GPBComputeUInt64Size(v9, (unint64_t)v10);
      break;
    case 0xD:
      int v23 = *(_DWORD *)(result + 40);
      id result = (uint64_t)GPBComputeBytesSize(v23, a2);
      break;
    case 0xE:
      int v11 = *(_DWORD *)(result + 40);
      id result = (uint64_t)GPBComputeStringSize(v11, a2);
      break;
    case 0xF:
      char v24 = *(unsigned char *)(result + 45);
      unsigned int v25 = *(_DWORD *)(result + 40);
      if ((v24 & 4) != 0)
      {
        id result = (uint64_t)GPBComputeMessageSetExtensionSize(v25, a2);
      }
      else
      {
        id result = (uint64_t)GPBComputeMessageSize(v25, a2);
      }
      break;
    case 0x10:
      int v12 = *(_DWORD *)(result + 40);
      id result = (uint64_t)GPBComputeGroupSize(v12, a2);
      break;
    case 0x11:
      int v26 = *(_DWORD *)(result + 40);
      unsigned int v27 = [a2 intValue];
      id result = GPBComputeEnumSize(v26, v27);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1003159C8(uint64_t result, void *a2)
{
  switch((int)result)
  {
    case 0:
      [a2 BOOLValue];
      id result = GPBComputeBoolSizeNoTag();
      break;
    case 1:
      [a2 unsignedIntValue];
      id result = GPBComputeFixed32SizeNoTag();
      break;
    case 2:
      [a2 intValue];
      id result = GPBComputeSFixed32SizeNoTag();
      break;
    case 3:
      [a2 floatValue];
      id result = GPBComputeFloatSizeNoTag();
      break;
    case 4:
      [a2 unsignedLongLongValue];
      id result = GPBComputeFixed64SizeNoTag();
      break;
    case 5:
      [a2 longLongValue];
      id result = GPBComputeSFixed64SizeNoTag();
      break;
    case 6:
      [a2 doubleValue];
      id result = GPBComputeDoubleSizeNoTag();
      break;
    case 7:
      unsigned int v2 = [a2 intValue];
      id result = GPBComputeInt32SizeNoTag(v2);
      break;
    case 8:
      id v3 = [a2 longLongValue];
      id result = GPBComputeInt64SizeNoTag(v3);
      break;
    case 9:
      int v4 = [a2 intValue];
      id result = GPBComputeSInt32SizeNoTag(v4);
      break;
    case 10:
      id v5 = [a2 longLongValue];
      id result = GPBComputeSInt64SizeNoTag((uint64_t)v5);
      break;
    case 11:
      unsigned int v6 = [a2 unsignedIntValue];
      id result = GPBComputeUInt32SizeNoTag(v6);
      break;
    case 12:
      id v7 = [a2 unsignedLongLongValue];
      id result = GPBComputeUInt64SizeNoTag(v7);
      break;
    case 13:
      id result = (uint64_t)GPBComputeBytesSizeNoTag(a2);
      break;
    case 14:
      id result = (uint64_t)GPBComputeStringSizeNoTag(a2);
      break;
    case 15:
      id result = (uint64_t)GPBComputeMessageSizeNoTag(a2);
      break;
    case 16:
      id result = GPBComputeGroupSizeNoTag(a2);
      break;
    case 17:
      unsigned int v8 = [a2 intValue];
      id result = GPBComputeEnumSizeNoTag(v8);
      break;
    default:
      return result;
  }
  return result;
}

void sub_100315E40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

id sub_100315E88()
{
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  v0 = (void *)qword_1003DB718;

  return v0;
}

void sub_100315EDC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateIDSStatus];
}

void sub_100315F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1003168E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_100316C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100316F84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100317264(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100317448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100317634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003177EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100317874(id a1)
{
  qword_1003DD7B0 = (uint64_t)[objc_alloc((Class)CLDispatchSilo) initWithIdentifier:@"CSCompanionServiceSilo"];

  _objc_release_x1();
}

void sub_100317A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100317A80(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v8 = WeakRetained;
  if (v6)
  {
    if (qword_1003DB710 != -1) {
      dispatch_once(&qword_1003DB710, &stru_1003BAF80);
    }
    int v9 = qword_1003DB718;
    if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_FAULT))
    {
      uint64_t buf = 68289282;
      __int16 v31 = 2082;
      long long v32 = "";
      __int16 v33 = 2114;
      id v34 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"IDS service failed to initialize\", \"Error\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }
    if (qword_1003DB710 != -1) {
      dispatch_once(&qword_1003DB710, &stru_1003BAF80);
    }
    id v10 = qword_1003DB718;
    if (os_signpost_enabled((os_log_t)qword_1003DB718))
    {
      uint64_t buf = 68289282;
      __int16 v31 = 2082;
      long long v32 = "";
      __int16 v33 = 2114;
      id v34 = v6;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "IDS service failed to initialize", "{\"msg%{public}.0s\":\"IDS service failed to initialize\", \"Error\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }
  }
  else
  {
    [WeakRetained setIdsService:v5];
    int v11 = [CompanionDelegate alloc];
    int v12 = [v8 silo];
    int v13 = [v8 idsService];
    int v14 = [(CompanionDelegate *)v11 initWithSilo:v12 idsService:v13];
    [v8 setDelegate:v14];

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100317FE0;
    v28[3] = &unk_1003BAE48;
    v28[4] = *(void *)(a1 + 32);
    objc_copyWeak(&v29, (id *)(a1 + 40));
    int v15 = [v8 delegate];
    [v15 setTestTriggerHandler:v28];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100318120;
    v26[3] = &unk_1003BAE98;
    v26[4] = *(void *)(a1 + 32);
    objc_copyWeak(&v27, (id *)(a1 + 40));
    int v16 = [v8 delegate];
    [v16 setMessageHandler:v26];

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1003182A4;
    v24[3] = &unk_1003BAEE8;
    v24[4] = *(void *)(a1 + 32);
    objc_copyWeak(&v25, (id *)(a1 + 40));
    int v17 = [v8 delegate];
    [v17 setStatusHandler:v24];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100318428;
    v22[3] = &unk_1003BAF38;
    v22[4] = *(void *)(a1 + 32);
    objc_copyWeak(&v23, (id *)(a1 + 40));
    unsigned int v18 = [v8 delegate];
    [v18 setCompanionStatusHandler:v22];

    int v19 = [*(id *)(a1 + 32) silo];
    id v20 = [v19 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100318588;
    block[3] = &unk_10039F568;
    block[4] = v8;
    dispatch_async(v20, block);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
  }
}

void sub_100317F18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v7);
  objc_destroyWeak(v6);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);

  _Unwind_Resume(a1);
}

void sub_100317FE0(uint64_t a1, double a2)
{
  int v4 = [*(id *)(a1 + 32) silo];
  id v5 = [v4 queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003180BC;
  v6[3] = &unk_1003BAE20;
  objc_copyWeak(v7, (id *)(a1 + 40));
  v7[1] = *(id *)&a2;
  dispatch_async(v5, v6);

  objc_destroyWeak(v7);
}

void sub_1003180AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003180BC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained testTriggerHandler:*(double *)(a1 + 40)];
}

void sub_10031810C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100318120(uint64_t a1, int a2, void *a3, double a4)
{
  id v7 = a3;
  unsigned int v8 = [*(id *)(a1 + 32) silo];
  int v9 = [v8 queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100318238;
  v11[3] = &unk_1003BAE70;
  objc_copyWeak(v13, (id *)(a1 + 40));
  int v14 = a2;
  id v12 = v7;
  v13[1] = *(id *)&a4;
  id v10 = v7;
  dispatch_async(v9, v11);

  objc_destroyWeak(v13);
}

void sub_10031821C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100318238(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained messageHandler:*(unsigned int *)(a1 + 56) data:*(void *)(a1 + 32) timestamp:*(double *)(a1 + 48)];
}

void sub_100318290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1003182A4(uint64_t a1, char a2, void *a3, double a4)
{
  id v7 = a3;
  unsigned int v8 = [*(id *)(a1 + 32) silo];
  int v9 = [v8 queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003183BC;
  v11[3] = &unk_1003BAEC0;
  objc_copyWeak(v13, (id *)(a1 + 40));
  char v14 = a2;
  id v12 = v7;
  v13[1] = *(id *)&a4;
  id v10 = v7;
  dispatch_async(v9, v11);

  objc_destroyWeak(v13);
}

void sub_1003183A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003183BC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained statusHandler:*(unsigned __int8 *)(a1 + 56) pairedDevice:*(void *)(a1 + 32) timestamp:*(double *)(a1 + 48)];
}

void sub_100318414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100318428(uint64_t a1, void *a2, int a3, double a4)
{
  unsigned int v8 = [*(id *)(a1 + 32) silo];
  int v9 = [v8 queue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10031851C;
  v10[3] = &unk_1003BAF10;
  objc_copyWeak(v11, (id *)(a1 + 40));
  int v12 = a3;
  v11[1] = *(id *)&a4;
  v11[2] = a2;
  dispatch_async(v9, v10);

  objc_destroyWeak(v11);
}

void sub_10031850C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10031851C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained onCompanionConnectionStatusUpdate:*(unsigned int *)(a1 + 56) cftime:*(void *)(a1 + 48) sputime:*(double *)(a1 + 40)];
}

void sub_100318574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_100318588(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyCompanionOfForwardMsgCompatibility];
}

void sub_10031871C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003188AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100318AD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100318C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100318D6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100318E34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100318FAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10031923C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100319344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100319468(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10031953C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100319644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003197C4(id a1)
{
  qword_1003DB718 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "Companion");

  _objc_release_x1();
}

void sub_100319808(NSObject **a1)
{
  unsigned int v2 = sub_100315E88();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    sub_10001A968();
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Invalid client mode\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, 0x26u);
  }

  id v3 = sub_100315E88();
  if (os_signpost_enabled(v3))
  {
    sub_10001A968();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Invalid client mode", "{\"msg%{public}.0s\":\"Invalid client mode\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, 0x26u);
  }

  int v4 = sub_100315E88();
  *a1 = v4;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    sub_10001A968();
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Invalid client mode\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, 0x26u);
  }
}

void sub_100319A14(uint64_t a1)
{
  if (qword_1003DB6E0 != -1) {
    dispatch_once(&qword_1003DB6E0, &stru_1003BB020);
  }
  unsigned int v2 = qword_1003DB6E8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6E8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 134217984;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "creating CSPlatformInfo shared Instance with hardware %lu", (uint8_t *)&v6, 0xCu);
  }
  int v4 = [[CSPlatformInfo alloc] initWithHardware:*(void *)(a1 + 32)];
  id v5 = (void *)qword_1003DD7C0;
  qword_1003DD7C0 = (uint64_t)v4;
}

id sub_100319B04()
{
  if (qword_1003DB6E0 != -1) {
    dispatch_once(&qword_1003DB6E0, &stru_1003BB020);
  }
  v0 = (void *)qword_1003DB6E8;

  return v0;
}

void sub_100319BAC(id a1)
{
  if (qword_1003DB6E0 != -1) {
    dispatch_once(&qword_1003DB6E0, &stru_1003BB020);
  }
  uint64_t v1 = qword_1003DB6E8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6E8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "creating CSPlatformInfo shared instance", v4, 2u);
  }
  unsigned int v2 = objc_alloc_init(CSPlatformInfo);
  uint64_t v3 = (void *)qword_1003DD7C0;
  qword_1003DD7C0 = (uint64_t)v2;
}

void sub_10031AC78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10031AD3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10031AD94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10031B134(id a1)
{
  CFStringRef v1 = (const __CFString *)MGCopyAnswer();
  if (!v1) {
    return;
  }
  CFStringRef v2 = v1;
  CFTypeID v3 = CFGetTypeID(v1);
  if (v3 == CFStringGetTypeID())
  {
    if (CFEqual(v2, @"Beta"))
    {
      int v4 = 0;
      goto LABEL_18;
    }
    if (CFEqual(v2, @"Carrier"))
    {
      int v4 = 1;
      goto LABEL_18;
    }
    if (CFEqual(v2, @"Internal"))
    {
      int v4 = 2;
      goto LABEL_18;
    }
    if (CFEqual(v2, @"Desense"))
    {
      int v4 = 3;
      goto LABEL_18;
    }
    if (CFEqual(v2, @"Lite Internal"))
    {
      int v4 = 4;
      goto LABEL_18;
    }
    if (CFEqual(v2, @"Vendor"))
    {
      int v4 = 5;
      goto LABEL_18;
    }
    if (CFEqual(v2, @"NonUI"))
    {
      int v4 = 6;
LABEL_18:
      dword_1003DD548 = v4;
    }
  }

  CFRelease(v2);
}

void sub_10031B3C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10031B3E0(id a1)
{
  CFBooleanRef v1 = (const __CFBoolean *)MGCopyAnswer();
  if (v1)
  {
    CFBooleanRef v2 = v1;
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 == CFBooleanGetTypeID() && CFBooleanGetValue(v2) == 1) {
      byte_1003DD7D8 = 1;
    }
    CFRelease(v2);
  }
}

uint64_t sub_10031B594(uint64_t a1)
{
  qword_1003DD7E8 = [*(id *)(a1 + 32) getSystem:"hw.model"];

  return _objc_release_x1();
}

void sub_10031B6E4(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_10031B7F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10031B8AC(uint64_t a1)
{
  CFBooleanRef v2 = (const __CFBoolean *)MGCopyAnswer();
  if (v2)
  {
    CFBooleanRef v3 = v2;
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3)) {
      uint64_t v5 = 24;
    }
    else {
      uint64_t v5 = (uint64_t)[*(id *)(a1 + 32) queryEmbeddedSystemHardware];
    }
    qword_1003DD7F8 = v5;
    CFRelease(v3);
  }
  else
  {
    qword_1003DD7F8 = (uint64_t)[*(id *)(a1 + 32) queryEmbeddedSystemHardware];
  }
}

void sub_10031E298(id a1)
{
  CFDictionaryRef v1 = IOServiceMatching("IOPlatformExpertDevice");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v1);
  if (MatchingService)
  {
    io_object_t v3 = MatchingService;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"IOPlatformSerialNumber", kCFAllocatorDefault, 0);
    if (CFProperty) {
      objc_storeStrong((id *)&qword_1003DD808, CFProperty);
    }
    IOObjectRelease(v3);
  }
}

void sub_10031E354(id a1)
{
  qword_1003DB6E8 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "Platform");

  _objc_release_x1();
}

void sub_10031E424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10031E5F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10031EB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10031EE4C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,id location,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a29 < 0) {
    operator delete(__p);
  }
  operator delete();
}

void sub_10031EEF0(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_10031F7DC(&v20, a2);
  int v6 = [CSConnection alloc];
  uint64_t v18 = v20;
  int v19 = v21;
  if (v21) {
    atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v7 = (std::__shared_weak_count *)a3[1];
  uint64_t v16 = *a3;
  int v17 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unsigned int v8 = [(CSConnection *)v6 initWithConnection:&v18 message:&v16 delegate:WeakRetained];
  if (v17) {
    sub_10000BB9C(v17);
  }
  if (v19) {
    sub_10000BB9C(v19);
  }
  int v9 = [WeakRetained mutableConnections];
  [v9 addObject:v8];

  [(CSConnection *)v8 start];
  id v10 = [CSConnectionMessage alloc];
  int v11 = (std::__shared_weak_count *)a3[1];
  uint64_t v14 = *a3;
  int v15 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v12 = [(CSConnectionMessage *)v10 initWithConnectionMessage:&v14];
  if (v15) {
    sub_10000BB9C(v15);
  }
  int v13 = [WeakRetained delegate];
  [v13 connectionCreated:v8 withMessage:v12];

  if (v21) {
    sub_10000BB9C(v21);
  }
}

void sub_10031F03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  uint64_t v20 = v18;

  if (a16) {
    sub_10000BB9C(a16);
  }

  _Unwind_Resume(a1);
}

void sub_10031F134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v10 = v9;

  a9.super_class = (Class)CSConnectionServer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

CLConnectionServer *sub_10031F170(CLConnectionServer **a1, CLConnectionServer *a2)
{
  id result = *a1;
  *a1 = a2;
  if (result)
  {
    CLConnectionServer::~CLConnectionServer(result);
    operator delete();
  }
  return result;
}

void sub_10031F22C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10031F3B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10031F524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10031F688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10031F798(id a1)
{
  qword_1003DB728 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "CSConnection");

  _objc_release_x1();
}

uint64_t *sub_10031F7DC(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *id result = *a2;
  if (v2) {
    operator new();
  }
  result[1] = 0;
  *a2 = 0;
  return result;
}

void sub_10031F860(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

CLConnection *sub_10031F898(uint64_t a1)
{
  id result = *(CLConnection **)(a1 + 24);
  if (result) {
    return (CLConnection *)CLConnection::deferredDelete(result);
  }
  return result;
}

uint64_t sub_10031F8BC(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else {
    return 0;
  }
}

void sub_10031F954(id a1)
{
  qword_1003DD820 = objc_alloc_init(CSPower);

  _objc_release_x1();
}

void sub_10031FB58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10031FBF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)CSPower;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10031FD5C(uint64_t a1)
{
  ++*(_DWORD *)(*(void *)(a1 + 32) + 48);
  if (qword_1003DB760 != -1) {
    dispatch_once(&qword_1003DB760, &stru_1003BB160);
  }
  uint64_t v2 = qword_1003DB768;
  if (os_log_type_enabled((os_log_t)qword_1003DB768, OS_LOG_TYPE_DEBUG))
  {
    int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 48);
    *(_DWORD *)uint64_t buf = 67109120;
    int v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "createPowerAssertion ref %d", buf, 8u);
  }
  if (([*(id *)(a1 + 32) isAssertionActive] & 1) == 0)
  {
    if (*(void *)(*(void *)(a1 + 32) + 40))
    {
      if (qword_1003DB760 != -1) {
        dispatch_once(&qword_1003DB760, &stru_1003BB160);
      }
      CFTypeID v4 = qword_1003DB768;
      if (os_log_type_enabled((os_log_t)qword_1003DB768, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "os_transaction_object not nil before power assertion", buf, 2u);
      }
    }
    else
    {
      [*(id *)(a1 + 40) UTF8String];
      uint64_t v5 = os_transaction_create();
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    *(void *)(*(void *)(a1 + 32) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = CFStringCreateWithFormat(0, 0, @"%@(%s)", *(void *)(*(void *)(a1 + 32) + 8), [*(id *)(a1 + 40) UTF8String]);
    *(void *)(*(void *)(a1 + 32) + 16) = 0;
    if (&_CPPowerAssertionCreate)
    {
      *(void *)(*(void *)(a1 + 32) + 16) = CPPowerAssertionCreate();
      CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 24));
      *(void *)(*(void *)(a1 + 32) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
      if (!*(void *)(*(void *)(a1 + 32) + 16))
      {
        if (qword_1003DB760 != -1) {
          dispatch_once(&qword_1003DB760, &stru_1003BB160);
        }
        uint64_t v8 = qword_1003DB768;
        if (os_log_type_enabled((os_log_t)qword_1003DB768, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)uint64_t buf = 0;
          int v9 = "Power assertion failed";
          id v10 = v8;
          os_log_type_t v11 = OS_LOG_TYPE_FAULT;
LABEL_22:
          _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, 2u);
        }
      }
    }
    else
    {
      if (qword_1003DB760 != -1) {
        dispatch_once(&qword_1003DB760, &stru_1003BB160);
      }
      uint64_t v12 = qword_1003DB768;
      if (os_log_type_enabled((os_log_t)qword_1003DB768, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t buf = 0;
        int v9 = "Power assertion failed, no CPPowerAssertionCreate";
        id v10 = v12;
        os_log_type_t v11 = OS_LOG_TYPE_ERROR;
        goto LABEL_22;
      }
    }
  }
}

void sub_100320090(uint64_t a1)
{
  if (qword_1003DB760 != -1) {
    dispatch_once(&qword_1003DB760, &stru_1003BB160);
  }
  uint64_t v2 = qword_1003DB768;
  if (os_log_type_enabled((os_log_t)qword_1003DB768, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "releasePowerAssertion", (uint8_t *)v13, 2u);
  }
  if ([*(id *)(a1 + 32) isAssertionActive])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(_DWORD *)(v3 + 48);
    if (!v4)
    {
      if (qword_1003DB760 != -1) {
        dispatch_once(&qword_1003DB760, &stru_1003BB160);
      }
      uint64_t v5 = qword_1003DB768;
      if (os_log_type_enabled((os_log_t)qword_1003DB768, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v13[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "double release of power assertion", (uint8_t *)v13, 2u);
      }
      uint64_t v3 = *(void *)(a1 + 32);
      int v4 = *(_DWORD *)(v3 + 48);
    }
    *(_DWORD *)(v3 + 4_Block_object_dispose(&STACK[0x410], 8) = v4 - 1;
    if (qword_1003DB760 != -1) {
      dispatch_once(&qword_1003DB760, &stru_1003BB160);
    }
    uint64_t v6 = qword_1003DB768;
    if (os_log_type_enabled((os_log_t)qword_1003DB768, OS_LOG_TYPE_DEBUG))
    {
      int v7 = *(_DWORD *)(*(void *)(a1 + 32) + 48);
      v13[0] = 67109120;
      v13[1] = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "releasePowerAssertion ref %d", (uint8_t *)v13, 8u);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    if (*(int *)(v8 + 48) <= 0)
    {
      CFRelease(*(CFTypeRef *)(v8 + 16));
      *(void *)(*(void *)(a1 + 32) + 16) = 0;
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = 0;

LABEL_27:
      *(_DWORD *)(*(void *)(a1 + 32) + 4_Block_object_dispose(&STACK[0x410], 8) = 0;
    }
  }
  else
  {
    if (qword_1003DB760 != -1) {
      dispatch_once(&qword_1003DB760, &stru_1003BB160);
    }
    os_log_type_t v11 = qword_1003DB768;
    if (os_log_type_enabled((os_log_t)qword_1003DB768, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Attempting to release power assertion when there is none", (uint8_t *)v13, 2u);
    }
    if (*(_DWORD *)(*(void *)(a1 + 32) + 48))
    {
      if (qword_1003DB760 != -1) {
        dispatch_once(&qword_1003DB760, &stru_1003BB160);
      }
      uint64_t v12 = qword_1003DB768;
      if (os_log_type_enabled((os_log_t)qword_1003DB768, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v13[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "ref count is not zero but there is no power assertion", (uint8_t *)v13, 2u);
      }
      goto LABEL_27;
    }
  }
}

void sub_1003203CC(uint64_t a1)
{
  if (qword_1003DB760 != -1) {
    dispatch_once(&qword_1003DB760, &stru_1003BB160);
  }
  uint64_t v2 = qword_1003DB768;
  if (os_log_type_enabled((os_log_t)qword_1003DB768, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "releaseAllCFObjects", v6, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(const void **)(v3 + 24);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(*(void *)(a1 + 32) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    uint64_t v3 = *(void *)(a1 + 32);
  }
  uint64_t v5 = *(const void **)(v3 + 16);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(*(void *)(a1 + 32) + 16) = 0;
  }
}

void sub_100320578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10032066C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003206F8(uint64_t a1)
{
  if (qword_1003DB760 != -1) {
    dispatch_once(&qword_1003DB760, &stru_1003BB160);
  }
  uint64_t v2 = qword_1003DB768;
  if (os_log_type_enabled((os_log_t)qword_1003DB768, OS_LOG_TYPE_DEBUG))
  {
    int v3 = *(_DWORD *)(a1 + 48);
    v14[0] = 67109120;
    v14[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "powerlogActivity reason:%d", (uint8_t *)v14, 8u);
  }
  int v4 = [*(id *)(*(void *)(a1 + 32) + 64) objectAtIndex:*(unsigned int *)(a1 + 48)];
  uint64_t v5 = +[NSNull null];
  BOOL v6 = v4 == v5;

  int v7 = *(id **)(a1 + 32);
  if (v6)
  {
    id v11 = v7[8];
    uint64_t v12 = *(unsigned int *)(a1 + 48);
    int v13 = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
    [v11 replaceObjectAtIndex:v12 withObject:v13];
  }
  else
  {
    uint64_t v8 = *(unsigned int *)(a1 + 48);
    uint64_t v9 = [v7[8] objectAtIndex:v8];
    id v10 = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
    [v7 sendPowerlogMetrics:v8 start:v9 end:v10];

    [*(id *)(a1 + 32) clearPowerloggingInfo:*(unsigned int *)(a1 + 48)];
  }
}

void sub_1003208A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100320A44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100320AF4(uint64_t a1)
{
  if (qword_1003DB760 != -1) {
    dispatch_once(&qword_1003DB760, &stru_1003BB160);
  }
  uint64_t v2 = qword_1003DB768;
  if (os_log_type_enabled((os_log_t)qword_1003DB768, OS_LOG_TYPE_DEBUG))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    v28[0] = 67109120;
    v28[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "onKappaSessionUpdate type:%d", (uint8_t *)v28, 8u);
  }
  int v4 = *(_DWORD *)(a1 + 40);
  if (v4 == 3)
  {
    if (!*(_DWORD *)(*(void *)(a1 + 32) + 52))
    {
      if (qword_1003DB760 != -1) {
        dispatch_once(&qword_1003DB760, &stru_1003BB160);
      }
      uint64_t v9 = qword_1003DB768;
      if (os_log_type_enabled((os_log_t)qword_1003DB768, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v28[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "No powerlogging sessionType set before session finished", (uint8_t *)v28, 2u);
      }
    }
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(unsigned int *)(v11 + 52);
    int v13 = [*(id *)(v11 + 64) objectAtIndex:v12];
    int v14 = +[NSNumber numberWithDouble:Current];
    [(id)v11 sendPowerlogMetrics:v12 start:v13 end:v14];

    [*(id *)(a1 + 32) clearPowerloggingInfo:*(unsigned int *)(*(void *)(a1 + 32) + 52)];
  }
  else if (v4 == 2)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    unsigned int v16 = *(_DWORD *)(v15 + 52);
    if (!v16)
    {
      if (qword_1003DB760 != -1) {
        dispatch_once(&qword_1003DB760, &stru_1003BB160);
      }
      int v17 = qword_1003DB768;
      if (os_log_type_enabled((os_log_t)qword_1003DB768, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v28[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "No powerlogging sessionType set before trigger found", (uint8_t *)v28, 2u);
      }
      uint64_t v15 = *(void *)(a1 + 32);
      unsigned int v16 = *(_DWORD *)(v15 + 52);
    }
    uint64_t v18 = [*(id *)(v15 + 64) objectAtIndex:v16];
    int v19 = +[NSNull null];
    BOOL v20 = v18 == v19;

    if (v20)
    {
      CFAbsoluteTime v21 = CFAbsoluteTimeGetCurrent();
      uint64_t v22 = *(void *)(a1 + 32);
      id v23 = *(void **)(v22 + 64);
      uint64_t v24 = *(unsigned int *)(v22 + 52);
      id v25 = +[NSNumber numberWithDouble:v21];
      [v23 replaceObjectAtIndex:v24 withObject:v25];
    }
  }
  else
  {
    if (v4) {
      return;
    }
    uint64_t v5 = +[CSPlatformInfo sharedInstance];
    unsigned int v6 = [v5 isKappaDetectionDevice];

    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 1;
    }
    else
    {
      int v26 = +[CSPlatformInfo sharedInstance];
      unsigned int v27 = [v26 isKappaLoggingDevice];

      if (!v27) {
        return;
      }
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 2;
    }
    *(_DWORD *)(v7 + 52) = v8;
  }
}

void sub_100320E08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100320E8C(id a1)
{
  qword_1003DB768 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "Power");

  _objc_release_x1();
}

CSHSM::State *CSHSM::State::State(CSHSM::State *this, const char *a2)
{
  *(void *)this = &off_1003BB190;
  *(_OWORD *)((char *)this + _Block_object_dispose(&STACK[0x410], 8) = 0u;
  *(_OWORD *)((char *)this + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0u;
  *((void *)this + 5) = a2;
  CSHSM::State::initializeChain(this);
  return this;
}

void sub_100320F24(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)(v1 + 16);
  if (v3)
  {
    *(void *)(v1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void CSHSM::State::initializeChain(CSHSM::State *this)
{
  if (this)
  {
    uint64_t v2 = (char **)((char *)this + 16);
    int v3 = (char *)this + 32;
    int v4 = (CSHSM::State **)*((void *)this + 3);
    uint64_t v5 = this;
    do
    {
      unint64_t v6 = *((void *)this + 4);
      if ((unint64_t)v4 >= v6)
      {
        uint64_t v7 = ((char *)v4 - *v2) >> 3;
        if ((unint64_t)(v7 + 1) >> 61) {
          sub_10000EE98();
        }
        uint64_t v8 = v6 - (void)*v2;
        uint64_t v9 = v8 >> 2;
        if (v8 >> 2 <= (unint64_t)(v7 + 1)) {
          uint64_t v9 = v7 + 1;
        }
        if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v10 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v10 = v9;
        }
        if (v10) {
          uint64_t v11 = (char *)sub_10000EEB0((uint64_t)v3, v10);
        }
        else {
          uint64_t v11 = 0;
        }
        uint64_t v12 = (CSHSM::State **)&v11[8 * v7];
        NSObject *v12 = v5;
        int v4 = v12 + 1;
        int v14 = (char *)*((void *)this + 2);
        int v13 = (char *)*((void *)this + 3);
        if (v13 != v14)
        {
          do
          {
            uint64_t v15 = (CSHSM::State *)*((void *)v13 - 1);
            v13 -= 8;
            *--uint64_t v12 = v15;
          }
          while (v13 != v14);
          int v13 = *v2;
        }
        *((void *)this + 2) = v12;
        *((void *)this + 3) = v4;
        *((void *)this + 4) = &v11[8 * v10];
        if (v13) {
          operator delete(v13);
        }
      }
      else
      {
        *v4++ = v5;
      }
      *((void *)this + 3) = v4;
      uint64_t v5 = (CSHSM::State *)*((void *)v5 + 1);
    }
    while (v5);
  }
}

CSHSM::State *CSHSM::State::State(CSHSM::State *this, const char *a2, CSHSM::State *a3)
{
  *(void *)this = &off_1003BB190;
  *((void *)this + 1) = a3;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = a2;
  CSHSM::State::initializeChain(this);
  return this;
}

void sub_10032109C(_Unwind_Exception *exception_object)
{
  int v3 = v2;
  uint64_t v5 = *v3;
  if (*v3)
  {
    *(void *)(v1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v5;
    operator delete(v5);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CSHSM::State::initial(CSHSM::State *this)
{
  return 0;
}

uint64_t CSHSM::State::trigger(CSHSM::State *this, unint64_t a2, const void *a3)
{
  return 0;
}

BOOL CSHSM::isIn(CSHSM *this, CSHSM::State *a2)
{
  uint64_t v3 = *(void *)(*(void *)this + 16);
  uint64_t v2 = *(void *)(*(void *)this + 24);
  if (v3 == v2) {
    return 0;
  }
  uint64_t v4 = v3 + 8;
  do
  {
    uint64_t v5 = *(CSHSM::State **)(v4 - 8);
    BOOL result = v5 == a2;
    BOOL v7 = v5 == a2 || v4 == v2;
    v4 += 8;
  }
  while (!v7);
  return result;
}

CSHSM::State *CSHSM::initial(CSHSM *this, CSHSM::State *a2)
{
  uint64_t v4 = a2;
  do
  {
    *(void *)this = v4;
    uint64_t v5 = *((void *)this + 1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *((void *)v4 + 5);
      *(_DWORD *)uint64_t buf = 136315138;
      uint64_t v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "initial, enter(%s)", buf, 0xCu);
      uint64_t v4 = *(CSHSM::State **)this;
    }
    (*(void (**)(CSHSM::State *, void, void))(*(void *)v4 + 24))(v4, 0, 0);
    BOOL result = (CSHSM::State *)(*(uint64_t (**)(CSHSM::State *))(*(void *)a2 + 8))(a2);
    uint64_t v4 = result;
  }
  while (result);
  return result;
}

void CSHSM::signal(CSHSM *this, uint64_t a2, const void *a3)
{
  uint64_t v3 = *(void **)this;
  if (*(void *)this)
  {
    while (1)
    {
      uint64_t v7 = (*(uint64_t (**)(void *, uint64_t, const void *))*v3)(v3, a2, a3);
      if (v7) {
        break;
      }
      uint64_t v3 = (void *)v3[1];
      if (!v3) {
        return;
      }
    }
    uint64_t v8 = v7;
    if ((void *)v7 == v3)
    {
      int v14 = *(void (**)(void *, uint64_t, const void *))(*v3 + 16);
      v14(v3, a2, a3);
    }
    else
    {
      uint64_t v9 = *(void **)this;
      unsigned int v27 = 0;
      uint64_t v28 = 0;
      int v26 = 0;
      sub_1003216D0(&v26, (const void *)v9[2], v9[3], (uint64_t)(v9[3] - v9[2]) >> 3);
      __p = 0;
      uint64_t v25 = 0;
      id v23 = 0;
      sub_1003216D0(&v23, *(const void **)(v8 + 16), *(void *)(v8 + 24), (uint64_t)(*(void *)(v8 + 24) - *(void *)(v8 + 16)) >> 3);
      unint64_t v10 = v26;
      if (v26 != v27)
      {
        uint64_t v11 = (char *)__p - 8;
        uint64_t v12 = v27 - 8;
        while (v11 + 1 != (void *)v23 && *(void *)v12 == *v11)
        {
          unsigned int v27 = v12;
          __p = v11--;
          BOOL v13 = v12 == v26;
          v12 -= 8;
          if (v13) {
            goto LABEL_20;
          }
        }
        uint64_t v15 = v12 + 8;
        if (v12 + 8 != v26)
        {
          do
          {
            uint64_t v16 = *v10;
            (*(void (**)(void, uint64_t, const void *))(*(void *)*v10 + 32))(*v10, a2, a3);
            int v17 = *((void *)this + 1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              uint64_t v18 = *(void *)(v16 + 40);
              *(_DWORD *)uint64_t buf = 134218242;
              uint64_t v30 = a2;
              __int16 v31 = 2080;
              uint64_t v32 = v18;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "event %llu, exit(%s)", buf, 0x16u);
            }
            ++v10;
          }
          while (v15 != v10);
        }
      }
LABEL_20:
      (*(void (**)(void *, uint64_t, const void *))(*v3 + 16))(v3, a2, a3);
      for (unint64_t i = (char *)__p; i != v23; i -= 8)
      {
        BOOL v20 = *((void *)this + 1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = *(void *)(*((void *)i - 1) + 40);
          *(_DWORD *)uint64_t buf = 134218242;
          uint64_t v30 = a2;
          __int16 v31 = 2080;
          uint64_t v32 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "event %llu, enter(%s)", buf, 0x16u);
        }
        uint64_t v22 = *((void *)i - 1);
        (*(void (**)(uint64_t, uint64_t, const void *))(*(void *)v22 + 24))(v22, a2, a3);
      }
      *(void *)this = v8;
      if (i)
      {
        __p = i;
        operator delete(i);
      }
      if (v26)
      {
        unsigned int v27 = (char *)v26;
        operator delete(v26);
      }
    }
  }
}

void sub_1003215CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, void *a14, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  if (a14) {
    operator delete(a14);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100321610(void *a1)
{
  *a1 = &off_1003BB190;
  uint64_t v2 = (void *)a1[2];
  if (v2)
  {
    a1[3] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_100321660(void *a1)
{
  *a1 = &off_1003BB190;
  uint64_t v2 = (void *)a1[2];
  if (v2)
  {
    a1[3] = v2;
    operator delete(v2);
  }

  operator delete();
}

void *sub_1003216D0(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    BOOL result = sub_100010F2C(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      BOOL result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_100321730(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x410], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t getKappaToken(int a1)
{
  return sub_1003217AC(a1, @"CSKappaTokenReplenishTimestamp", @"CSKappaTokenCount", @"CSKappaTokenReplenishPeriod", @"CSKappaTokenCountDefault", 1);
}

uint64_t sub_1003217AC(int a1, void *a2, void *a3, void *a4, void *a5, int a6)
{
  LODWORD(v6) = a6;
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = +[CSPermissions sharedInstance];
  unsigned __int8 v16 = [v15 isAuthorizedToCollectData];

  if (v16)
  {
    int v17 = +[CSPersistentConfiguration sharedConfiguration];
    [v17 doubleForKey:v11];
    double v19 = v18;
    uint64_t v20 = (uint64_t)[v17 integerForKey:v12];
    id v21 = [v17 integerForKey:v13];
    double Current = CFAbsoluteTimeGetCurrent();
    unsigned int v23 = [v17 integerForKey:v14];
    if (v23) {
      uint64_t v6 = v23;
    }
    else {
      uint64_t v6 = v6;
    }
    if (v21) {
      uint64_t v24 = (uint64_t)v21;
    }
    else {
      uint64_t v24 = 86400;
    }
    if (qword_1003DB680 != -1) {
      dispatch_once(&qword_1003DB680, &stru_1003BB1D8);
    }
    uint64_t v25 = qword_1003DB688;
    if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEBUG))
    {
      if (v19 == 0.0) {
        double v26 = (double)v24;
      }
      else {
        double v26 = Current - v19;
      }
      int v29 = 134218240;
      double v30 = v26;
      __int16 v31 = 1024;
      int v32 = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "tokenTS delta %f threshold %d", (uint8_t *)&v29, 0x12u);
    }
    if (v19 == 0.0 || Current - v19 >= (double)v24)
    {
      if ((a1 & 1) == 0) {
        goto LABEL_28;
      }
    }
    else
    {
      if (v20 < 1 || v20 <= v6)
      {
        if (v20 < 1)
        {
          uint64_t v6 = 0;
        }
        else
        {
          if (a1) {
            [v17 setInteger:v20 - 1 forKey:v12];
          }
          uint64_t v6 = v20;
        }
        goto LABEL_28;
      }
      if (!a1)
      {
LABEL_28:

        goto LABEL_29;
      }
    }
    [v17 setDouble:v11 forKey:Current];
    [v17 setInteger:(v6 - 1) forKey:v12];
    goto LABEL_28;
  }
  if (qword_1003DB680 != -1) {
    dispatch_once(&qword_1003DB680, &stru_1003BB1D8);
  }
  unsigned int v27 = qword_1003DB688;
  if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v29) = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Not authorized to collect data, returning 0 tokens", (uint8_t *)&v29, 2u);
  }
  uint64_t v6 = 0;
LABEL_29:

  return v6;
}

void sub_100321A7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t getMartyPunchThruToken(int a1)
{
  return sub_1003217AC(a1, @"CSMartyPunchThruTokenReplenishTimestamp", @"CSMartyPunchThruTokenCount", @"CSMartyPunchThruTokenReplenishPeriod", @"CSMartyPunchThruTokenCountDefault", 10);
}

uint64_t getMartyToken(int a1)
{
  return sub_1003217AC(a1, @"CSMartyTokenReplenishTimestamp", @"CSMartyTokenCount", @"CSMartyTokenReplenishPeriod", @"CSMartyTokenCountDefault", 2);
}

uint64_t getMartyAlphaCrashToken(int a1)
{
  return sub_1003217AC(a1, @"CSMartyAlphaCrashTokenReplenishTimestamp", @"CSMartyAlphaCrashTokenCount", @"CSMartyAlphaCrashTokenReplenishPeriod", @"CSMartyAlphaCrashTokenCountDefault", 2);
}

uint64_t getMartyEarlyCrashToken(int a1)
{
  return sub_1003217AC(a1, @"CSMartyEarlyCrashTokenReplenishTimestamp", @"CSMartyEarlyCrashTokenCount", @"CSMartyEarlyCrashTokenReplenishPeriod", @"CSMartyEarlyCrashTokenCountDefault", 2);
}

uint64_t getIgneousToken(int a1)
{
  return sub_1003217AC(a1, @"CSIgneousTokenReplenishTimestamp", @"CSIgneousTokenCount", @"CSIgneousTokenReplenishPeriod", @"CSIgneousTokenCountDefault", 3);
}

void sub_100321B94(id a1)
{
  qword_1003DB688 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "AnomalyEvent");

  _objc_release_x1();
}

void sub_100321CE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_10000BB9C(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_100321D70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_10000BB9C(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_100321E0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_10000BB9C(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_100321EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_10000BB9C(a10);
  }

  _Unwind_Resume(a1);
}

void sub_100321F7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100321FE0(id a1)
{
  qword_1003DD830 = objc_alloc_init(CSPersistentConfiguration);

  _objc_release_x1();
}

void sub_10032215C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100322200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100322308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100322598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1003226A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100322734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003227D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100322878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100322914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1003229B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100322A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100322B4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100322C20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100322D08(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100322DF4(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100322ED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003230D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, __int16 buf)
{
  if (a2 == 1)
  {
    id v16 = objc_begin_catch(a1);
    int v17 = [v16 name];
    unsigned int v18 = [v17 isEqual:NSRangeException];

    if (v18)
    {
      double v19 = sub_1003231F4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Index out of bounds for server configuration value", (uint8_t *)&buf, 2u);
      }

      objc_end_catch();
      JUMPOUT(0x1003230A4);
    }
    objc_exception_throw(v16);
  }

  _Unwind_Resume(a1);
}

id sub_1003231F4()
{
  if (qword_1003DB7C0 != -1) {
    dispatch_once(&qword_1003DB7C0, &stru_1003BB260);
  }
  v0 = (void *)qword_1003DB7C8;

  return v0;
}

void sub_100323404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003234EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100323684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100323734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003237C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003238E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100323CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_100323D28(uint64_t a1, void *a2)
{
  activity = a2;
  if (!xpc_activity_get_state(activity))
  {
    uint64_t v3 = +[CSPower sharedInstance];
    [v3 powerlogActivity:3 state:CFAbsoluteTimeGetCurrent()];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v5 = [*(id *)(a1 + 32) objectForKey:@"CLPersistentConfigurationServerDefaults"];
    uint64_t v6 = v5;
    if (v5 && [v5 unsignedLongLongValue] != (id)WeakRetained[3])
    {
      xpc_object_t v7 = xpc_activity_copy_criteria(activity);
      xpc_dictionary_set_int64(v7, XPC_ACTIVITY_INTERVAL, (int64_t)[v6 unsignedLongLongValue]);
      xpc_activity_set_criteria(activity, v7);
      WeakRetained[3] = [v6 unsignedLongLongValue];
    }
    size_t v8 = +[CSPower sharedInstance];
    [v8 powerlogActivity:3 state:CFAbsoluteTimeGetCurrent()];
  }
}

void sub_100323E54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100323EE0(id a1)
{
  qword_1003DB6A8 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "Alg");

  _objc_release_x1();
}

void sub_100323F24(id a1)
{
  qword_1003DB7C8 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "PersistentConfiguration");

  _objc_release_x1();
}

void sub_100323FBC(id a1)
{
  if (qword_1003DB6F0 != -1) {
    dispatch_once(&qword_1003DB6F0, &stru_1003BB2A0);
  }
  uint64_t v1 = qword_1003DB6F8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6F8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "creating CSPermissions", v4, 2u);
  }
  uint64_t v2 = objc_alloc_init(CSPermissions);
  uint64_t v3 = (void *)qword_1003DD838;
  qword_1003DD838 = (uint64_t)v2;
}

void sub_1003240B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100324208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100324408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100324430(id a1)
{
  qword_1003DB6F8 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "Permissions");

  _objc_release_x1();
}

void sub_1003247E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  _Unwind_Resume(a1);
}

void sub_1003248B8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained delegate];
  [v1 connectionHandleDisconnection:WeakRetained];
}

void sub_100324914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100324934(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained delegate];
  [v1 connectionHandleInterruption:WeakRetained];
}

void sub_100324990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1003249B0(uint64_t a1, uint64_t *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained name];
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Connection, name: %@, pid: %d", v4, [WeakRetained remotePid]);

  uint64_t v6 = [WeakRetained delegate];
  xpc_object_t v7 = [CSConnectionMessage alloc];
  size_t v8 = (std::__shared_weak_count *)a2[1];
  uint64_t v10 = *a2;
  id v11 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = [(CSConnectionMessage *)v7 initWithConnectionMessage:&v10];
  [v6 connection:WeakRetained handleMessage:v9];

  if (v11) {
    sub_10000BB9C(v11);
  }
}

void sub_100324A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    sub_10000BB9C(a12);
  }

  _Unwind_Resume(a1);
}

void sub_100324B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)CSConnection;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100324BA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_10000BB9C(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_100324C70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a11) {
    sub_10000BB9C(a11);
  }
  _Unwind_Resume(exception_object);
}

void sub_100324D10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_10000BB9C(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_100324DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, void *__p, std::__shared_weak_count *a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, std::__shared_weak_count *a19)
{
  if (a11) {
    sub_10000BB9C(a11);
  }
  if (a13) {
    sub_10000BB9C(a13);
  }
  if (a19) {
    sub_10000BB9C(a19);
  }

  _Unwind_Resume(a1);
}

void sub_100324FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, std::__shared_weak_count *a15, void *__p, std::__shared_weak_count *a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15) {
    sub_10000BB9C(a15);
  }
  if (a17) {
    sub_10000BB9C(a17);
  }
  uint64_t v25 = *(std::__shared_weak_count **)(v23 - 56);
  if (v25) {
    sub_10000BB9C(v25);
  }

  _Unwind_Resume(a1);
}

void sub_100325024(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [CSConnectionMessage alloc];
  id v5 = (std::__shared_weak_count *)a2[1];
  uint64_t v7 = *a2;
  size_t v8 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = [(CSConnectionMessage *)v4 initWithConnectionMessage:&v7];
  (*(void (**)(uint64_t, CSConnectionMessage *))(v3 + 16))(v3, v6);

  if (v8) {
    sub_10000BB9C(v8);
  }
}

void sub_1003250A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_10000BB9C(a10);
  }
  _Unwind_Resume(a1);
}

void sub_100325180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100325220(id a1)
{
  qword_1003DB728 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "CSConnection");

  _objc_release_x1();
}

void *sub_100325264@<X0>(void *a1@<X8>)
{
  uint64_t v2 = operator new(0x70uLL);
  BOOL result = sub_1003252C8(v2);
  *a1 = v2 + 3;
  a1[1] = v2;
  return result;
}

void sub_1003252B4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_1003252C8(void *a1)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_1003B2158;
  CLConnectionMessage::CLConnectionMessage();
  return a1;
}

void sub_100325314(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_100325328()
{
}

void sub_100325354()
{
  __assert_rtn("-[CSHealthWrapEncryptor _writeStream:length:hash:error:]", "CSHealthWrapEncryptor.m", 278, "(size_t)bytesWritten <= length");
}

uint64_t sub_1003253A0()
{
  v0 = sub_100008BCC();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    sub_10000BDD8();
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Q empty\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  uint64_t v1 = sub_100008BCC();
  if (os_signpost_enabled(v1))
  {
    sub_10000BDD8();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v1, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Q empty", "{\"msg%{public}.0s\":\"Q empty\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  uint64_t v2 = sub_100008BCC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    sub_10000BDD8();
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Q empty\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  uint64_t v3 = abort_report_np();
  return sub_100325510(v3);
}

void sub_100325510(NSObject **a1)
{
  uint64_t v2 = sub_100019090();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    sub_10001A968();
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"invalid kappa TTR type\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, 0x26u);
  }

  uint64_t v3 = sub_100019090();
  if (os_signpost_enabled(v3))
  {
    sub_10001A968();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "invalid kappa TTR type", "{\"msg%{public}.0s\":\"invalid kappa TTR type\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, 0x26u);
  }

  uint64_t v4 = sub_100019090();
  *a1 = v4;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    sub_10001A968();
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"invalid kappa TTR type\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, 0x26u);
  }
}

void sub_10032567C()
{
  CFAbsoluteTimeGetCurrent();
  sub_100024A44();
  sub_100024A58();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "ERROR,Die,Time,%.3f,Function,\"%s\",invalid index %zu >= %zu\n", v0, 0x2Au);
}

void sub_100325714()
{
  CFAbsoluteTimeGetCurrent();
  sub_100024A44();
  uint64_t v1 = "Element CMVectorBufferBase<float, 3>::front() const [T = float, N = 3]";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "ERROR,Die,Time,%.3f,Function,\"%s\",front() on empty buffer\n", v0, 0x16u);
}

void sub_1003257A0(uint64_t a1)
{
  CFAbsoluteTimeGetCurrent();
  sub_100024A44();
  uint64_t v3 = "Element &CMVectorBufferBase<float, 3>::operator[](const size_t) [T = float, N = 3]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "ERROR,Die,Time,%.3f,Function,\"%s\",out of buffer range %zu\n", v2, 0x20u);
}

void sub_100325844()
{
  CFAbsoluteTimeGetCurrent();
  sub_100024A44();
  sub_100024A58();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "ERROR,Die,Time,%.3f,Function,\"%s\",invalid index %zu >= %zu\n", v0, 0x2Au);
}

void sub_1003258DC(NSObject **a1)
{
  uint64_t v2 = sub_1000258C4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    sub_10001A968();
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"cannot raise none type marty TTR\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, 0x26u);
  }

  uint64_t v3 = sub_1000258C4();
  if (os_signpost_enabled(v3))
  {
    sub_10001A968();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "cannot raise none type marty TTR", "{\"msg%{public}.0s\":\"cannot raise none type marty TTR\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, 0x26u);
  }

  __int16 v4 = sub_1000258C4();
  *a1 = v4;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    sub_10001A968();
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"cannot raise none type marty TTR\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, 0x26u);
  }
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return _CCCryptorCreate(op, alg, options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorFinal(CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return _CCCryptorFinal(cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return _CCCryptorRelease(cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return _CCCryptorUpdate(cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return _CFHash(cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

void CFWriteStreamSetDispatchQueue(CFWriteStreamRef stream, dispatch_queue_t q)
{
}

uint64_t CPPowerAssertionCreate()
{
  return _CPPowerAssertionCreate();
}

uint64_t GEOCalculateDistance()
{
  return _GEOCalculateDistance();
}

uint64_t GEOCalculateDistanceHighPrecision()
{
  return _GEOCalculateDistanceHighPrecision();
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return _IOCreatePlugInInterfaceForService(service, pluginType, interfaceType, theInterface, theScore);
}

kern_return_t IODestroyPlugInInterface(IOCFPlugInInterface **interface)
{
  return _IODestroyPlugInInterface(interface);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return _IOObjectCopyClass(object);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetChildEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *child)
{
  return _IORegistryEntryGetChildEntry(entry, plane, child);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return _IORegistryEntryGetChildIterator(entry, plane, iterator);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return _IORegistryEntryGetName(entry, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGIsDeviceOfType()
{
  return _MGIsDeviceOfType();
}

uint64_t MGIsDeviceOneOfType()
{
  return _MGIsDeviceOneOfType();
}

id NSAllocateObject(Class aClass, NSUInteger extraBytes, NSZone *zone)
{
  return _NSAllocateObject(aClass, extraBytes, zone);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

NSZone *__cdecl NSZoneFromPointer(void *ptr)
{
  return _NSZoneFromPointer(ptr);
}

uint64_t PBHashBytes()
{
  return _PBHashBytes();
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return _SecCertificateCopyData(certificate);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return _SecCertificateCopyKey(certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return _SecCertificateCreateWithData(allocator, data);
}

CFDataRef SecKeyCreateEncryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef plaintext, CFErrorRef *error)
{
  return _SecKeyCreateEncryptedData(key, algorithm, plaintext, error);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return _SecRandomCopyBytes(rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopyServerVersionDictionary()
{
  return __CFCopyServerVersionDictionary();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

void _Exit(int a1)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t CLConnection::sendMessage()
{
  return CLConnection::sendMessage();
}

{
  return CLConnection::sendMessage();
}

uint64_t CLConnection::getRemotePid(CLConnection *this)
{
  return CLConnection::getRemotePid(this);
}

uint64_t CLConnection::deferredDelete(CLConnection *this)
{
  return CLConnection::deferredDelete(this);
}

uint64_t CLConnection::setInterruptionHandler()
{
  return CLConnection::setInterruptionHandler();
}

uint64_t CLConnection::setDisconnectionHandler()
{
  return CLConnection::setDisconnectionHandler();
}

uint64_t CLConnection::setDefaultMessageHandler()
{
  return CLConnection::setDefaultMessageHandler();
}

uint64_t CLConnection::start(CLConnection *this)
{
  return CLConnection::start(this);
}

uint64_t CLConnection::getName(CLConnection *this)
{
  return CLConnection::getName(this);
}

uint64_t CLConnectionClient::sendMessage()
{
  return CLConnectionClient::sendMessage();
}

{
  return CLConnectionClient::sendMessage();
}

uint64_t CLConnectionClient::setInterruptionHandler()
{
  return CLConnectionClient::setInterruptionHandler();
}

uint64_t CLConnectionClient::setDefaultMessageHandler()
{
  return CLConnectionClient::setDefaultMessageHandler();
}

uint64_t CLConnectionClient::start(CLConnectionClient *this)
{
  return CLConnectionClient::start(this);
}

uint64_t CLConnectionClient::CLConnectionClient()
{
  return CLConnectionClient::CLConnectionClient();
}

uint64_t CLConnectionServer::CLConnectionServer()
{
  return CLConnectionServer::CLConnectionServer();
}

void CLConnectionServer::~CLConnectionServer(CLConnectionServer *this)
{
}

uint64_t CLConnectionMessage::isReply(CLConnectionMessage *this)
{
  return CLConnectionMessage::isReply(this);
}

uint64_t CLConnectionMessage::sendReply()
{
  return CLConnectionMessage::sendReply();
}

uint64_t CLConnectionMessage::CLConnectionMessage()
{
  return CLConnectionMessage::CLConnectionMessage();
}

{
  return CLConnectionMessage::CLConnectionMessage();
}

uint64_t PB::TextFormatter::beginObject(PB::TextFormatter *this, const char *a2)
{
  return PB::TextFormatter::beginObject(this, a2);
}

uint64_t PB::TextFormatter::format()
{
  return PB::TextFormatter::format();
}

{
  return PB::TextFormatter::format();
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, BOOL a3)
{
  return PB::TextFormatter::format(this, a2, a3);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, double a3)
{
  return PB::TextFormatter::format(this, a2, a3);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, float a3)
{
  return PB::TextFormatter::format(this, a2, a3);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, int a3)
{
  return PB::TextFormatter::format(this, a2, a3);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, unsigned int a3)
{
  return PB::TextFormatter::format(this, a2, a3);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, uint64_t a3)
{
  return PB::TextFormatter::format(this, a2, a3);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, unint64_t a3)
{
  return PB::TextFormatter::format(this, a2, a3);
}

void PB::Base::~Base(PB::Base *this)
{
}

uint64_t PB::Data::Data()
{
  return PB::Data::Data();
}

uint64_t PB::Reader::recallMark()
{
  return PB::Reader::recallMark();
}

uint64_t PB::Reader::read()
{
  return PB::Reader::read();
}

{
  return PB::Reader::read();
}

uint64_t PB::Reader::skip(PB::Reader *this, unsigned int a2, unsigned __int8 a3, int a4)
{
  return PB::Reader::skip(this, a2, a3, a4);
}

uint64_t PB::Reader::placeMark()
{
  return PB::Reader::placeMark();
}

uint64_t PB::Reader::Reader(PB::Reader *this, const unsigned __int8 *a2, unint64_t a3)
{
  return PB::Reader::Reader(this, a2, a3);
}

uint64_t PB::Writer::writeVarInt(PB::Writer *this, int a2, unsigned int a3)
{
  return PB::Writer::writeVarInt(this, a2, a3);
}

uint64_t PB::Writer::writeVarInt(PB::Writer *this, unsigned int a2, unsigned int a3)
{
  return PB::Writer::writeVarInt(this, a2, a3);
}

uint64_t PB::Writer::writeVarInt(PB::Writer *this, uint64_t a2, unsigned int a3)
{
  return PB::Writer::writeVarInt(this, a2, a3);
}

uint64_t PB::Writer::writeVarInt(PB::Writer *this, unint64_t a2, unsigned int a3)
{
  return PB::Writer::writeVarInt(this, a2, a3);
}

uint64_t PB::Writer::writeSubmessage(PB::Writer *this, const PB::Base *a2, unsigned int a3)
{
  return PB::Writer::writeSubmessage(this, a2, a3);
}

uint64_t PB::Writer::write()
{
  return PB::Writer::write();
}

{
  return PB::Writer::write();
}

uint64_t PB::Writer::write(PB::Writer *this, BOOL a2, unsigned int a3)
{
  return PB::Writer::write(this, a2, a3);
}

uint64_t PB::Writer::write(PB::Writer *this, double a2, unsigned int a3)
{
  return PB::Writer::write(this, a2, a3);
}

uint64_t PB::Writer::write(PB::Writer *this, float a2, unsigned int a3)
{
  return PB::Writer::write(this, a2, a3);
}

uint64_t PB::Writer::writeSInt(PB::Writer *this, int a2, unsigned int a3)
{
  return PB::Writer::writeSInt(this, a2, a3);
}

uint64_t PB::Writer::writeSInt(PB::Writer *this, uint64_t a2, unsigned int a3)
{
  return PB::Writer::writeSInt(this, a2, a3);
}

uint64_t PB::Writer::Writer(PB::Writer *this)
{
  return PB::Writer::Writer(this);
}

void PB::Writer::~Writer(PB::Writer *this)
{
}

uint64_t CLConnectionMessage::getDictionary(CLConnectionMessage *this)
{
  return CLConnectionMessage::getDictionary(this);
}

uint64_t CLConnectionMessage::getDictionaryOfClasses(CLConnectionMessage *this, NSSet *a2)
{
  return CLConnectionMessage::getDictionaryOfClasses(this, a2);
}

uint64_t CLConnectionMessage::name(CLConnectionMessage *this)
{
  return CLConnectionMessage::name(this);
}

uint64_t PB::Data::operator==()
{
  return PB::Data::operator==();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

uint64_t std::__sort<std::__less<float,float> &,float *>()
{
  return std::__sort<std::__less<float,float> &,float *>();
}

uint64_t std::__sort<std::__less<unsigned long long,unsigned long long> &,unsigned long long *>()
{
  return std::__sort<std::__less<unsigned long long,unsigned long long> &,unsigned long long *>();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)___dynamic_cast(lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return ___error();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  __float2 v3 = ___sincosf_stret(a1);
  float cosval = v3.__cosval;
  float sinval = v3.__sinval;
  result.__float cosval = cosval;
  result.__float sinval = sinval;
  return result;
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return ___tolower(a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return ___toupper(a1);
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

long double acos(long double __x)
{
  return _acos(__x);
}

float acosf(float a1)
{
  return _acosf(a1);
}

long double asin(long double __x)
{
  return _asin(__x);
}

float asinf(float a1)
{
  return _asinf(a1);
}

long double atan(long double __x)
{
  return _atan(__x);
}

long double atan2(long double __y, long double __x)
{
  return _atan2(__y, __x);
}

float atan2f(float a1, float a2)
{
  return _atan2f(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return _class_addMethod(cls, name, imp, types);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return _class_copyMethodList(cls, outCount);
}

size_t class_getInstanceSize(Class cls)
{
  return _class_getInstanceSize(cls);
}

const char *__cdecl class_getName(Class cls)
{
  return _class_getName(cls);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

int close(int a1)
{
  return _close(a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return _compression_stream_destroy(stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return _compression_stream_init(stream, operation, algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return _compression_stream_process(stream, flags);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

long double cos(long double __x)
{
  return _cos(__x);
}

float cosf(float a1)
{
  return _cosf(a1);
}

int deflate(z_streamp strm, int flush)
{
  return _deflate(strm, flush);
}

int deflateEnd(z_streamp strm)
{
  return _deflateEnd(strm);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return _deflateInit_(strm, level, version, stream_size);
}

int deflateReset(z_streamp strm)
{
  return _deflateReset(strm);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return _dispatch_data_create(buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_io_barrier(dispatch_io_t channel, dispatch_block_t barrier)
{
}

dispatch_io_t dispatch_io_create(dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return _dispatch_io_create(type, fd, queue, cleanup_handler);
}

void dispatch_io_write(dispatch_io_t channel, off_t offset, dispatch_data_t data, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

double drand48(void)
{
  return _drand48();
}

long double exp(long double __x)
{
  return _exp(__x);
}

float expf(float a1)
{
  return _expf(a1);
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fsync(int a1)
{
  return _fsync(a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

IMP imp_implementationWithBlock(id block)
{
  return _imp_implementationWithBlock(block);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

SEL method_getName(Method m)
{
  return _method_getName(m);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

float modff(float a1, float *a2)
{
  return _modff(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

Class objc_getMetaClass(const char *name)
{
  return _objc_getMetaClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return _objc_getProtocol(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

Class objc_lookUpClass(const char *name)
{
  return _objc_lookUpClass(name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void perror(const char *a1)
{
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  objc_method_description MethodDescription = _protocol_getMethodDescription(p, aSel, isRequiredMethod, isInstanceMethod);
  types = MethodDescription.types;
  name = MethodDescription.name;
  result.types = types;
  result.name = name;
  return result;
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return _pwrite(__fd, __buf, __nbyte, a4);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

int raise(int a1)
{
  return _raise(a1);
}

int rand(void)
{
  return _rand();
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return _reallocf(__ptr, __size);
}

const char *__cdecl sel_getName(SEL sel)
{
  return _sel_getName(sel);
}

SEL sel_getUid(const char *str)
{
  return _sel_getUid(str);
}

int sigignore(int a1)
{
  return _sigignore(a1);
}

long double sin(long double __x)
{
  return _sin(__x);
}

float sinf(float a1)
{
  return _sinf(a1);
}

void srand48(uint64_t a1)
{
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

long double tan(long double __x)
{
  return _tan(__x);
}

float tanf(float a1)
{
  return _tanf(a1);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return _xpc_dictionary_send_reply();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_DSLPublisher(void *a1, const char *a2, ...)
{
  return [a1 DSLPublisher];
}

id objc_msgSend_Device(void *a1, const char *a2, ...)
{
  return [a1 Device];
}

id objc_msgSend_MIMEType(void *a1, const char *a2, ...)
{
  return [a1 MIMEType];
}

id objc_msgSend_ScreenLocked(void *a1, const char *a2, ...)
{
  return [a1 ScreenLocked];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingPathExtension];
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__cleanup(void *a1, const char *a2, ...)
{
  return [a1 _cleanup];
}

id objc_msgSend__deliverDestinationContent(void *a1, const char *a2, ...)
{
  return [a1 _deliverDestinationContent];
}

id objc_msgSend__initializeStream(void *a1, const char *a2, ...)
{
  return [a1 _initializeStream];
}

id objc_msgSend__updateArmingTimes(void *a1, const char *a2, ...)
{
  return [a1 _updateArmingTimes];
}

id objc_msgSend_abortSession(void *a1, const char *a2, ...)
{
  return [a1 abortSession];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_actionQueue(void *a1, const char *a2, ...)
{
  return [a1 actionQueue];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowBattery(void *a1, const char *a2, ...)
{
  return [a1 allowBattery];
}

id objc_msgSend_allowOnBattery(void *a1, const char *a2, ...)
{
  return [a1 allowOnBattery];
}

id objc_msgSend_alternateWireType(void *a1, const char *a2, ...)
{
  return [a1 alternateWireType];
}

id objc_msgSend_appLaunch(void *a1, const char *a2, ...)
{
  return [a1 appLaunch];
}

id objc_msgSend_applicationData(void *a1, const char *a2, ...)
{
  return [a1 applicationData];
}

id objc_msgSend_armedSec(void *a1, const char *a2, ...)
{
  return [a1 armedSec];
}

id objc_msgSend_armedSecMartyBicycle(void *a1, const char *a2, ...)
{
  return [a1 armedSecMartyBicycle];
}

id objc_msgSend_armedSecMartyLocal(void *a1, const char *a2, ...)
{
  return [a1 armedSecMartyLocal];
}

id objc_msgSend_armedSecMartyRemote(void *a1, const char *a2, ...)
{
  return [a1 armedSecMartyRemote];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auth(void *a1, const char *a2, ...)
{
  return [a1 auth];
}

id objc_msgSend_authorization(void *a1, const char *a2, ...)
{
  return [a1 authorization];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return [a1 body];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cacheUserInfo(void *a1, const char *a2, ...)
{
  return [a1 cacheUserInfo];
}

id objc_msgSend_calcValueNameOffsets(void *a1, const char *a2, ...)
{
  return [a1 calcValueNameOffsets];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_centerCoordinate(void *a1, const char *a2, ...)
{
  return [a1 centerCoordinate];
}

id objc_msgSend_certificate(void *a1, const char *a2, ...)
{
  return [a1 certificate];
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return [a1 channel];
}

id objc_msgSend_checkForPersistedRegistration(void *a1, const char *a2, ...)
{
  return [a1 checkForPersistedRegistration];
}

id objc_msgSend_checkIntervalInSeconds(void *a1, const char *a2, ...)
{
  return [a1 checkIntervalInSeconds];
}

id objc_msgSend_classInjectionMap(void *a1, const char *a2, ...)
{
  return [a1 classInjectionMap];
}

id objc_msgSend_clearAll(void *a1, const char *a2, ...)
{
  return [a1 clearAll];
}

id objc_msgSend_clearCAStats(void *a1, const char *a2, ...)
{
  return [a1 clearCAStats];
}

id objc_msgSend_clearSessionInfo(void *a1, const char *a2, ...)
{
  return [a1 clearSessionInfo];
}

id objc_msgSend_clearUserInfo(void *a1, const char *a2, ...)
{
  return [a1 clearUserInfo];
}

id objc_msgSend_clients(void *a1, const char *a2, ...)
{
  return [a1 clients];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return [a1 config];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_containingMessageClass(void *a1, const char *a2, ...)
{
  return [a1 containingMessageClass];
}

id objc_msgSend_containingType(void *a1, const char *a2, ...)
{
  return [a1 containingType];
}

id objc_msgSend_coolDownPeriodInSeconds(void *a1, const char *a2, ...)
{
  return [a1 coolDownPeriodInSeconds];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countOfFields(void *a1, const char *a2, ...)
{
  return [a1 countOfFields];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_createSession(void *a1, const char *a2, ...)
{
  return [a1 createSession];
}

id objc_msgSend_createSubmitterIfRegistered(void *a1, const char *a2, ...)
{
  return [a1 createSubmitterIfRegistered];
}

id objc_msgSend_curationSampling(void *a1, const char *a2, ...)
{
  return [a1 curationSampling];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentCountrySupportsDirections(void *a1, const char *a2, ...)
{
  return [a1 currentCountrySupportsDirections];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentSOSStatus(void *a1, const char *a2, ...)
{
  return [a1 currentSOSStatus];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataType(void *a1, const char *a2, ...)
{
  return [a1 dataType];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_decideToShowTTR(void *a1, const char *a2, ...)
{
  return [a1 decideToShowTTR];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultValue(void *a1, const char *a2, ...)
{
  return [a1 defaultValue];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_defaultsRegistrationDateKeyName(void *a1, const char *a2, ...)
{
  return [a1 defaultsRegistrationDateKeyName];
}

id objc_msgSend_defaultsSubjectAuthTokenKeyName(void *a1, const char *a2, ...)
{
  return [a1 defaultsSubjectAuthTokenKeyName];
}

id objc_msgSend_defaultsSubjectIDKeyName(void *a1, const char *a2, ...)
{
  return [a1 defaultsSubjectIDKeyName];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return [a1 deviceType];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_disableCompression(void *a1, const char *a2, ...)
{
  return [a1 disableCompression];
}

id objc_msgSend_dispatchSilo(void *a1, const char *a2, ...)
{
  return [a1 dispatchSilo];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dumpMetadata(void *a1, const char *a2, ...)
{
  return [a1 dumpMetadata];
}

id objc_msgSend_enableMode(void *a1, const char *a2, ...)
{
  return [a1 enableMode];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_encryptMonitor(void *a1, const char *a2, ...)
{
  return [a1 encryptMonitor];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_enumDescriptor(void *a1, const char *a2, ...)
{
  return [a1 enumDescriptor];
}

id objc_msgSend_enumVerifier(void *a1, const char *a2, ...)
{
  return [a1 enumVerifier];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_escalateCrashDecision(void *a1, const char *a2, ...)
{
  return [a1 escalateCrashDecision];
}

id objc_msgSend_escalateUI(void *a1, const char *a2, ...)
{
  return [a1 escalateUI];
}

id objc_msgSend_evaluateCrashWithPOI(void *a1, const char *a2, ...)
{
  return [a1 evaluateCrashWithPOI];
}

id objc_msgSend_evaluatePossibleCrashDetectorDecision(void *a1, const char *a2, ...)
{
  return [a1 evaluatePossibleCrashDetectorDecision];
}

id objc_msgSend_evaluateSamplingAlgFeatures(void *a1, const char *a2, ...)
{
  return [a1 evaluateSamplingAlgFeatures];
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return [a1 eventBody];
}

id objc_msgSend_extension(void *a1, const char *a2, ...)
{
  return [a1 extension];
}

id objc_msgSend_extensionRanges(void *a1, const char *a2, ...)
{
  return [a1 extensionRanges];
}

id objc_msgSend_extensionRangesCount(void *a1, const char *a2, ...)
{
  return [a1 extensionRangesCount];
}

id objc_msgSend_extensionRegistry(void *a1, const char *a2, ...)
{
  return [a1 extensionRegistry];
}

id objc_msgSend_extensionsCurrentlySet(void *a1, const char *a2, ...)
{
  return [a1 extensionsCurrentlySet];
}

id objc_msgSend_feedCompanionDetected(void *a1, const char *a2, ...)
{
  return [a1 feedCompanionDetected];
}

id objc_msgSend_fieldNumber(void *a1, const char *a2, ...)
{
  return [a1 fieldNumber];
}

id objc_msgSend_fieldType(void *a1, const char *a2, ...)
{
  return [a1 fieldType];
}

id objc_msgSend_file(void *a1, const char *a2, ...)
{
  return [a1 file];
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return [a1 fileCreationDate];
}

id objc_msgSend_fileProtectionType(void *a1, const char *a2, ...)
{
  return [a1 fileProtectionType];
}

id objc_msgSend_finishAnomalyEvent(void *a1, const char *a2, ...)
{
  return [a1 finishAnomalyEvent];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return [a1 finishDecoding];
}

id objc_msgSend_finishEncoding(void *a1, const char *a2, ...)
{
  return [a1 finishEncoding];
}

id objc_msgSend_finishSession(void *a1, const char *a2, ...)
{
  return [a1 finishSession];
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return [a1 finishTasksAndInvalidate];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstOrThirdPartyEnabled(void *a1, const char *a2, ...)
{
  return [a1 firstOrThirdPartyEnabled];
}

id objc_msgSend_fixed32List(void *a1, const char *a2, ...)
{
  return [a1 fixed32List];
}

id objc_msgSend_fixed64List(void *a1, const char *a2, ...)
{
  return [a1 fixed64List];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_flowState(void *a1, const char *a2, ...)
{
  return [a1 flowState];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return [a1 flush];
}

id objc_msgSend_folderURL(void *a1, const char *a2, ...)
{
  return [a1 folderURL];
}

id objc_msgSend_forceDetectionDevice(void *a1, const char *a2, ...)
{
  return [a1 forceDetectionDevice];
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return [a1 fullName];
}

id objc_msgSend_getDataIntegrityBlock(void *a1, const char *a2, ...)
{
  return [a1 getDataIntegrityBlock];
}

id objc_msgSend_getDeescalationPath(void *a1, const char *a2, ...)
{
  return [a1 getDeescalationPath];
}

id objc_msgSend_getKappaThirdPartyDisplayNameForApp(void *a1, const char *a2, ...)
{
  return [a1 getKappaThirdPartyDisplayNameForApp];
}

id objc_msgSend_getMaxTriggerSessionInSecondsDefault(void *a1, const char *a2, ...)
{
  return [a1 getMaxTriggerSessionInSecondsDefault];
}

id objc_msgSend_getNextSortedArray(void *a1, const char *a2, ...)
{
  return [a1 getNextSortedArray];
}

id objc_msgSend_getSecondsSinceReboot(void *a1, const char *a2, ...)
{
  return [a1 getSecondsSinceReboot];
}

id objc_msgSend_getSerialNumber(void *a1, const char *a2, ...)
{
  return [a1 getSerialNumber];
}

id objc_msgSend_getSystemHardware(void *a1, const char *a2, ...)
{
  return [a1 getSystemHardware];
}

id objc_msgSend_getSystemModel(void *a1, const char *a2, ...)
{
  return [a1 getSystemModel];
}

id objc_msgSend_getSystemReleaseType(void *a1, const char *a2, ...)
{
  return [a1 getSystemReleaseType];
}

id objc_msgSend_getSystemVersionDescription(void *a1, const char *a2, ...)
{
  return [a1 getSystemVersionDescription];
}

id objc_msgSend_getSystemVersionDescriptionNoBuild(void *a1, const char *a2, ...)
{
  return [a1 getSystemVersionDescriptionNoBuild];
}

id objc_msgSend_groupList(void *a1, const char *a2, ...)
{
  return [a1 groupList];
}

id objc_msgSend_hardware(void *a1, const char *a2, ...)
{
  return [a1 hardware];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_idsService(void *a1, const char *a2, ...)
{
  return [a1 idsService];
}

id objc_msgSend_igneousCMPrototypingConfiguration(void *a1, const char *a2, ...)
{
  return [a1 igneousCMPrototypingConfiguration];
}

id objc_msgSend_igneousGMConfiguration(void *a1, const char *a2, ...)
{
  return [a1 igneousGMConfiguration];
}

id objc_msgSend_igneousStagingConfiguration(void *a1, const char *a2, ...)
{
  return [a1 igneousStagingConfiguration];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_inertialX(void *a1, const char *a2, ...)
{
  return [a1 inertialX];
}

id objc_msgSend_inertialY(void *a1, const char *a2, ...)
{
  return [a1 inertialY];
}

id objc_msgSend_inertialZ(void *a1, const char *a2, ...)
{
  return [a1 inertialZ];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initFlowController(void *a1, const char *a2, ...)
{
  return [a1 initFlowController];
}

id objc_msgSend_initSession(void *a1, const char *a2, ...)
{
  return [a1 initSession];
}

id objc_msgSend_initStateMachine(void *a1, const char *a2, ...)
{
  return [a1 initStateMachine];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interruptionHandler(void *a1, const char *a2, ...)
{
  return [a1 interruptionHandler];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return [a1 invalidateAndCancel];
}

id objc_msgSend_isArmed(void *a1, const char *a2, ...)
{
  return [a1 isArmed];
}

id objc_msgSend_isAssertionActive(void *a1, const char *a2, ...)
{
  return [a1 isAssertionActive];
}

id objc_msgSend_isAuthorizedForIS(void *a1, const char *a2, ...)
{
  return [a1 isAuthorizedForIS];
}

id objc_msgSend_isAuthorizedToCollectData(void *a1, const char *a2, ...)
{
  return [a1 isAuthorizedToCollectData];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isDOEDeviceDefaultSet(void *a1, const char *a2, ...)
{
  return [a1 isDOEDeviceDefaultSet];
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 isDefaultPairedDevice];
}

id objc_msgSend_isExtendedPretriggerDMDevice(void *a1, const char *a2, ...)
{
  return [a1 isExtendedPretriggerDMDevice];
}

id objc_msgSend_isExtendedPretriggerMagDevice(void *a1, const char *a2, ...)
{
  return [a1 isExtendedPretriggerMagDevice];
}

id objc_msgSend_isIdle(void *a1, const char *a2, ...)
{
  return [a1 isIdle];
}

id objc_msgSend_isInitialized(void *a1, const char *a2, ...)
{
  return [a1 isInitialized];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isInternalInstall];
}

id objc_msgSend_isKappaDetectionDevice(void *a1, const char *a2, ...)
{
  return [a1 isKappaDetectionDevice];
}

id objc_msgSend_isKappaEnabled(void *a1, const char *a2, ...)
{
  return [a1 isKappaEnabled];
}

id objc_msgSend_isKappaFlow(void *a1, const char *a2, ...)
{
  return [a1 isKappaFlow];
}

id objc_msgSend_isKappaFlowActive(void *a1, const char *a2, ...)
{
  return [a1 isKappaFlowActive];
}

id objc_msgSend_isKappaLoggingDevice(void *a1, const char *a2, ...)
{
  return [a1 isKappaLoggingDevice];
}

id objc_msgSend_isKappaVisible(void *a1, const char *a2, ...)
{
  return [a1 isKappaVisible];
}

id objc_msgSend_isLocallyPaired(void *a1, const char *a2, ...)
{
  return [a1 isLocallyPaired];
}

id objc_msgSend_isMDevice(void *a1, const char *a2, ...)
{
  return [a1 isMDevice];
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return [a1 isNearby];
}

id objc_msgSend_isOptional(void *a1, const char *a2, ...)
{
  return [a1 isOptional];
}

id objc_msgSend_isPackable(void *a1, const char *a2, ...)
{
  return [a1 isPackable];
}

id objc_msgSend_isPairedDeviceStatus(void *a1, const char *a2, ...)
{
  return [a1 isPairedDeviceStatus];
}

id objc_msgSend_isRepeated(void *a1, const char *a2, ...)
{
  return [a1 isRepeated];
}

id objc_msgSend_isRequired(void *a1, const char *a2, ...)
{
  return [a1 isRequired];
}

id objc_msgSend_isSafetyDataSubmissionAllowed(void *a1, const char *a2, ...)
{
  return [a1 isSafetyDataSubmissionAllowed];
}

id objc_msgSend_isStarting(void *a1, const char *a2, ...)
{
  return [a1 isStarting];
}

id objc_msgSend_isWireFormat(void *a1, const char *a2, ...)
{
  return [a1 isWireFormat];
}

id objc_msgSend_kappaArmedSeconds(void *a1, const char *a2, ...)
{
  return [a1 kappaArmedSeconds];
}

id objc_msgSend_kappaCMPrototypingConfiguration(void *a1, const char *a2, ...)
{
  return [a1 kappaCMPrototypingConfiguration];
}

id objc_msgSend_kappaGMConfiguration(void *a1, const char *a2, ...)
{
  return [a1 kappaGMConfiguration];
}

id objc_msgSend_kappaInternalConfiguration(void *a1, const char *a2, ...)
{
  return [a1 kappaInternalConfiguration];
}

id objc_msgSend_kappaStagingConfiguration(void *a1, const char *a2, ...)
{
  return [a1 kappaStagingConfiguration];
}

id objc_msgSend_kappaTriggersEmergencySOS(void *a1, const char *a2, ...)
{
  return [a1 kappaTriggersEmergencySOS];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_keyValuePairs(void *a1, const char *a2, ...)
{
  return [a1 keyValuePairs];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lengthDelimitedList(void *a1, const char *a2, ...)
{
  return [a1 lengthDelimitedList];
}

id objc_msgSend_limitPending(void *a1, const char *a2, ...)
{
  return [a1 limitPending];
}

id objc_msgSend_logAudioStats(void *a1, const char *a2, ...)
{
  return [a1 logAudioStats];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_lookBack(void *a1, const char *a2, ...)
{
  return [a1 lookBack];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mapKeyDataType(void *a1, const char *a2, ...)
{
  return [a1 mapKeyDataType];
}

id objc_msgSend_mapMissBehavior(void *a1, const char *a2, ...)
{
  return [a1 mapMissBehavior];
}

id objc_msgSend_martyArmedSecondsLocal(void *a1, const char *a2, ...)
{
  return [a1 martyArmedSecondsLocal];
}

id objc_msgSend_maxTemp(void *a1, const char *a2, ...)
{
  return [a1 maxTemp];
}

id objc_msgSend_mcc1(void *a1, const char *a2, ...)
{
  return [a1 mcc1];
}

id objc_msgSend_mcc2(void *a1, const char *a2, ...)
{
  return [a1 mcc2];
}

id objc_msgSend_medTocFactoryTemp(void *a1, const char *a2, ...)
{
  return [a1 medTocFactoryTemp];
}

id objc_msgSend_medianToc(void *a1, const char *a2, ...)
{
  return [a1 medianToc];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_messageClass(void *a1, const char *a2, ...)
{
  return [a1 messageClass];
}

id objc_msgSend_messageUUID(void *a1, const char *a2, ...)
{
  return [a1 messageUUID];
}

id objc_msgSend_meta(void *a1, const char *a2, ...)
{
  return [a1 meta];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_mnc1(void *a1, const char *a2, ...)
{
  return [a1 mnc1];
}

id objc_msgSend_mnc2(void *a1, const char *a2, ...)
{
  return [a1 mnc2];
}

id objc_msgSend_modelIdentifier(void *a1, const char *a2, ...)
{
  return [a1 modelIdentifier];
}

id objc_msgSend_monitoring(void *a1, const char *a2, ...)
{
  return [a1 monitoring];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return [a1 month];
}

id objc_msgSend_msgClass(void *a1, const char *a2, ...)
{
  return [a1 msgClass];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableConnections(void *a1, const char *a2, ...)
{
  return [a1 mutableConnections];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newOutputFileURL(void *a1, const char *a2, ...)
{
  return [a1 newOutputFileURL];
}

id objc_msgSend_newTimer(void *a1, const char *a2, ...)
{
  return [a1 newTimer];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_notifyCompanionOfUploadedCompanionUUID(void *a1, const char *a2, ...)
{
  return [a1 notifyCompanionOfUploadedCompanionUUID];
}

id objc_msgSend_notifySOSDaemon(void *a1, const char *a2, ...)
{
  return [a1 notifySOSDaemon];
}

id objc_msgSend_notifySOStoAOP(void *a1, const char *a2, ...)
{
  return [a1 notifySOStoAOP];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_number(void *a1, const char *a2, ...)
{
  return [a1 number];
}

id objc_msgSend_objcPrefix(void *a1, const char *a2, ...)
{
  return [a1 objcPrefix];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_oobMetadataMonitor(void *a1, const char *a2, ...)
{
  return [a1 oobMetadataMonitor];
}

id objc_msgSend_oobTimeout(void *a1, const char *a2, ...)
{
  return [a1 oobTimeout];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 outgoingResponseIdentifier];
}

id objc_msgSend_package(void *a1, const char *a2, ...)
{
  return [a1 package];
}

id objc_msgSend_pairedDevice(void *a1, const char *a2, ...)
{
  return [a1 pairedDevice];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_payloadIdentifier(void *a1, const char *a2, ...)
{
  return [a1 payloadIdentifier];
}

id objc_msgSend_payloadObject(void *a1, const char *a2, ...)
{
  return [a1 payloadObject];
}

id objc_msgSend_payloadType(void *a1, const char *a2, ...)
{
  return [a1 payloadType];
}

id objc_msgSend_performanceSampling(void *a1, const char *a2, ...)
{
  return [a1 performanceSampling];
}

id objc_msgSend_periodInSeconds(void *a1, const char *a2, ...)
{
  return [a1 periodInSeconds];
}

id objc_msgSend_persistentConfiguration(void *a1, const char *a2, ...)
{
  return [a1 persistentConfiguration];
}

id objc_msgSend_persistentConfigurationIgneous(void *a1, const char *a2, ...)
{
  return [a1 persistentConfigurationIgneous];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return [a1 pointerValue];
}

id objc_msgSend_populateSessionDetails(void *a1, const char *a2, ...)
{
  return [a1 populateSessionDetails];
}

id objc_msgSend_postfix(void *a1, const char *a2, ...)
{
  return [a1 postfix];
}

id objc_msgSend_printSamplingDefaults(void *a1, const char *a2, ...)
{
  return [a1 printSamplingDefaults];
}

id objc_msgSend_productBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 productBuildVersion];
}

id objc_msgSend_publisher(void *a1, const char *a2, ...)
{
  return [a1 publisher];
}

id objc_msgSend_queryEmbeddedSystemHardware(void *a1, const char *a2, ...)
{
  return [a1 queryEmbeddedSystemHardware];
}

id objc_msgSend_queryIfNearAmusementPark(void *a1, const char *a2, ...)
{
  return [a1 queryIfNearAmusementPark];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return [a1 raise];
}

id objc_msgSend_readSamples(void *a1, const char *a2, ...)
{
  return [a1 readSamples];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_registerForCoreAnalyticsUserInfo(void *a1, const char *a2, ...)
{
  return [a1 registerForCoreAnalyticsUserInfo];
}

id objc_msgSend_registerForCoreAnalyticsUserInfoWithExplicitCriteria(void *a1, const char *a2, ...)
{
  return [a1 registerForCoreAnalyticsUserInfoWithExplicitCriteria];
}

id objc_msgSend_registerForFolderMonitorActivity(void *a1, const char *a2, ...)
{
  return [a1 registerForFolderMonitorActivity];
}

id objc_msgSend_registered(void *a1, const char *a2, ...)
{
  return [a1 registered];
}

id objc_msgSend_registrationPeriodInSeconds(void *a1, const char *a2, ...)
{
  return [a1 registrationPeriodInSeconds];
}

id objc_msgSend_releaseAllCFObjects(void *a1, const char *a2, ...)
{
  return [a1 releaseAllCFObjects];
}

id objc_msgSend_releasePowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 releasePowerAssertion];
}

id objc_msgSend_remotePid(void *a1, const char *a2, ...)
{
  return [a1 remotePid];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_replyToXPCMessage(void *a1, const char *a2, ...)
{
  return [a1 replyToXPCMessage];
}

id objc_msgSend_requestDeviceInfo(void *a1, const char *a2, ...)
{
  return [a1 requestDeviceInfo];
}

id objc_msgSend_requestLocation(void *a1, const char *a2, ...)
{
  return [a1 requestLocation];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetAllPersistedValues(void *a1, const char *a2, ...)
{
  return [a1 resetAllPersistedValues];
}

id objc_msgSend_resetSession(void *a1, const char *a2, ...)
{
  return [a1 resetSession];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_retentionPeriodInSeconds(void *a1, const char *a2, ...)
{
  return [a1 retentionPeriodInSeconds];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_runAllConfigurationUpdateCallbacks(void *a1, const char *a2, ...)
{
  return [a1 runAllConfigurationUpdateCallbacks];
}

id objc_msgSend_scanGroup(void *a1, const char *a2, ...)
{
  return [a1 scanGroup];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return [a1 second];
}

id objc_msgSend_sendDeviceInfo(void *a1, const char *a2, ...)
{
  return [a1 sendDeviceInfo];
}

id objc_msgSend_sendDeviceInfoProtobuf(void *a1, const char *a2, ...)
{
  return [a1 sendDeviceInfoProtobuf];
}

id objc_msgSend_sendLocalAudioToWatch(void *a1, const char *a2, ...)
{
  return [a1 sendLocalAudioToWatch];
}

id objc_msgSend_sendLocalKappaSessionInfoToCompanion(void *a1, const char *a2, ...)
{
  return [a1 sendLocalKappaSessionInfoToCompanion];
}

id objc_msgSend_sendSessionInfoToCoreAnalytics(void *a1, const char *a2, ...)
{
  return [a1 sendSessionInfoToCoreAnalytics];
}

id objc_msgSend_sendUserInfoToCoreAnalytics(void *a1, const char *a2, ...)
{
  return [a1 sendUserInfoToCoreAnalytics];
}

id objc_msgSend_serializedSize(void *a1, const char *a2, ...)
{
  return [a1 serializedSize];
}

id objc_msgSend_serializedSizeAsMessageSet(void *a1, const char *a2, ...)
{
  return [a1 serializedSizeAsMessageSet];
}

id objc_msgSend_serializedSizeAsMessageSetExtension(void *a1, const char *a2, ...)
{
  return [a1 serializedSizeAsMessageSetExtension];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_setPreTriggerForcedCompanionTrigger(void *a1, const char *a2, ...)
{
  return [a1 setPreTriggerForcedCompanionTrigger];
}

id objc_msgSend_setupXPCHandler(void *a1, const char *a2, ...)
{
  return [a1 setupXPCHandler];
}

id objc_msgSend_sex(void *a1, const char *a2, ...)
{
  return [a1 sex];
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sharedConfiguration];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_shouldKeepCrashTTR(void *a1, const char *a2, ...)
{
  return [a1 shouldKeepCrashTTR];
}

id objc_msgSend_shouldKeepEarlyCrashTTR(void *a1, const char *a2, ...)
{
  return [a1 shouldKeepEarlyCrashTTR];
}

id objc_msgSend_shouldKeepTriggerTTR(void *a1, const char *a2, ...)
{
  return [a1 shouldKeepTriggerTTR];
}

id objc_msgSend_shouldUpload(void *a1, const char *a2, ...)
{
  return [a1 shouldUpload];
}

id objc_msgSend_shouldUploadRecording(void *a1, const char *a2, ...)
{
  return [a1 shouldUploadRecording];
}

id objc_msgSend_silo(void *a1, const char *a2, ...)
{
  return [a1 silo];
}

id objc_msgSend_singletonName(void *a1, const char *a2, ...)
{
  return [a1 singletonName];
}

id objc_msgSend_singletonNameC(void *a1, const char *a2, ...)
{
  return [a1 singletonNameC];
}

id objc_msgSend_sinkContent(void *a1, const char *a2, ...)
{
  return [a1 sinkContent];
}

id objc_msgSend_sinkContentFinished(void *a1, const char *a2, ...)
{
  return [a1 sinkContentFinished];
}

id objc_msgSend_skipMessage(void *a1, const char *a2, ...)
{
  return [a1 skipMessage];
}

id objc_msgSend_sortedFields(void *a1, const char *a2, ...)
{
  return [a1 sortedFields];
}

id objc_msgSend_sosActivated(void *a1, const char *a2, ...)
{
  return [a1 sosActivated];
}

id objc_msgSend_sosKappaState(void *a1, const char *a2, ...)
{
  return [a1 sosKappaState];
}

id objc_msgSend_sosStatus(void *a1, const char *a2, ...)
{
  return [a1 sosStatus];
}

id objc_msgSend_sourceContentFinished(void *a1, const char *a2, ...)
{
  return [a1 sourceContentFinished];
}

id objc_msgSend_spatialMappedPlaceCategories(void *a1, const char *a2, ...)
{
  return [a1 spatialMappedPlaceCategories];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startIgneousUploader(void *a1, const char *a2, ...)
{
  return [a1 startIgneousUploader];
}

id objc_msgSend_startUploader(void *a1, const char *a2, ...)
{
  return [a1 startUploader];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_statusCodeIndicatesSucess(void *a1, const char *a2, ...)
{
  return [a1 statusCodeIndicatesSucess];
}

id objc_msgSend_stopRecurringScanning(void *a1, const char *a2, ...)
{
  return [a1 stopRecurringScanning];
}

id objc_msgSend_stopSession(void *a1, const char *a2, ...)
{
  return [a1 stopSession];
}

id objc_msgSend_stopTimer(void *a1, const char *a2, ...)
{
  return [a1 stopTimer];
}

id objc_msgSend_streamError(void *a1, const char *a2, ...)
{
  return [a1 streamError];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_studyUUID(void *a1, const char *a2, ...)
{
  return [a1 studyUUID];
}

id objc_msgSend_studyUuid(void *a1, const char *a2, ...)
{
  return [a1 studyUuid];
}

id objc_msgSend_subjectAuthorizationToken(void *a1, const char *a2, ...)
{
  return [a1 subjectAuthorizationToken];
}

id objc_msgSend_subjectID(void *a1, const char *a2, ...)
{
  return [a1 subjectID];
}

id objc_msgSend_subjectToken(void *a1, const char *a2, ...)
{
  return [a1 subjectToken];
}

id objc_msgSend_subjectUUID(void *a1, const char *a2, ...)
{
  return [a1 subjectUUID];
}

id objc_msgSend_submitMonitor(void *a1, const char *a2, ...)
{
  return [a1 submitMonitor];
}

id objc_msgSend_submitter(void *a1, const char *a2, ...)
{
  return [a1 submitter];
}

id objc_msgSend_superclass(void *a1, const char *a2, ...)
{
  return [a1 superclass];
}

id objc_msgSend_syntax(void *a1, const char *a2, ...)
{
  return [a1 syntax];
}

id objc_msgSend_tap2RadarUserConfiguration(void *a1, const char *a2, ...)
{
  return [a1 tap2RadarUserConfiguration];
}

id objc_msgSend_taskDescription(void *a1, const char *a2, ...)
{
  return [a1 taskDescription];
}

id objc_msgSend_textFormatName(void *a1, const char *a2, ...)
{
  return [a1 textFormatName];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_timestampedComparator(void *a1, const char *a2, ...)
{
  return [a1 timestampedComparator];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_trailingHmaclength(void *a1, const char *a2, ...)
{
  return [a1 trailingHmaclength];
}

id objc_msgSend_trailingShalength(void *a1, const char *a2, ...)
{
  return [a1 trailingShalength];
}

id objc_msgSend_ttrManagedMsl(void *a1, const char *a2, ...)
{
  return [a1 ttrManagedMsl];
}

id objc_msgSend_turnByTurnDirectionsEnabled(void *a1, const char *a2, ...)
{
  return [a1 turnByTurnDirectionsEnabled];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unknownFields(void *a1, const char *a2, ...)
{
  return [a1 unknownFields];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateCompanion(void *a1, const char *a2, ...)
{
  return [a1 updateCompanion];
}

id objc_msgSend_updateIDSStatus(void *a1, const char *a2, ...)
{
  return [a1 updateIDSStatus];
}

id objc_msgSend_updatePersistedUserInfo(void *a1, const char *a2, ...)
{
  return [a1 updatePersistedUserInfo];
}

id objc_msgSend_updateTrustedAudioMetadata(void *a1, const char *a2, ...)
{
  return [a1 updateTrustedAudioMetadata];
}

id objc_msgSend_updateUserInfoSettings(void *a1, const char *a2, ...)
{
  return [a1 updateUserInfoSettings];
}

id objc_msgSend_updateUserStats(void *a1, const char *a2, ...)
{
  return [a1 updateUserStats];
}

id objc_msgSend_uppercaseLetterCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 uppercaseLetterCharacterSet];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_urlToCopyToOnStop(void *a1, const char *a2, ...)
{
  return [a1 urlToCopyToOnStop];
}

id objc_msgSend_userAge(void *a1, const char *a2, ...)
{
  return [a1 userAge];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInfoUploader(void *a1, const char *a2, ...)
{
  return [a1 userInfoUploader];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_validationFunc(void *a1, const char *a2, ...)
{
  return [a1 validationFunc];
}

id objc_msgSend_varintList(void *a1, const char *a2, ...)
{
  return [a1 varintList];
}

id objc_msgSend_vendor(void *a1, const char *a2, ...)
{
  return [a1 vendor];
}

id objc_msgSend_wireType(void *a1, const char *a2, ...)
{
  return [a1 wireType];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}