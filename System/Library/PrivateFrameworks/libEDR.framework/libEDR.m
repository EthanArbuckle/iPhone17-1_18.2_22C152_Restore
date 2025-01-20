uint64_t sub_1CFE13AD0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void sub_1CFE13AE8(uint64_t a1)
{
  for (i = *(uint64_t **)(a1 + 272); i; i = (uint64_t *)*i)
    *((unsigned char *)i + 24) = 0;
  sub_1CFE13B4C(a1);
  double v4 = v3 + sub_1CFE1438C();
  sub_1CFE15FC4(a1, v4);
}

uint64_t sub_1CFE13B4C(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if (sub_1CFE13C24(a1 + 32))
  {
    uint64_t result = sub_1CFE13C24(a1 + 80);
    if (result)
    {
      *(unsigned char *)(a1 + 1) = 0;
      return result;
    }
  }
  if (sub_1CFE13C24(v2) || !sub_1CFE13C24(a1 + 80))
  {
    if (!sub_1CFE13C24(v2) || sub_1CFE13C24(a1 + 80))
    {
      sub_1CFE23D20(v2, v4, v5, v6);
      return sub_1CFE23D20(a1 + 80, v8, v9, v10);
    }
    uint64_t v7 = a1 + 80;
  }
  else
  {
    *(unsigned char *)(a1 + 1) = 0;
    uint64_t v7 = v2;
  }
  return sub_1CFE23D20(v7, v4, v5, v6);
}

BOOL sub_1CFE13C24(uint64_t a1)
{
  return sub_1CFE1438C() >= *(double *)(a1 + 8) + *(double *)(a1 + 16);
}

void sub_1CFE13C58(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  ++qword_1EBD0F920;
  double v3 = sub_1CFE1438C();
  double v7 = *(double *)(a1 + 40);
  __n128 v6 = (double *)(a1 + 40);
  double v8 = v7;
  double v9 = v3 - v7;
  if (v3 - v7 > 0.0)
  {
    uint64_t v10 = ++qword_1EBD0F930;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v30 = "ScheduleSetBrightnessIn_block_invoke";
      __int16 v31 = 2048;
      double v32 = v9;
      __int16 v33 = 2048;
      uint64_t v34 = v10;
      __int16 v35 = 2048;
      uint64_t v36 = qword_1EBD0F920;
      _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: enter WaitUntil late %f millisecond (%llu / %llu)", buf, 0x2Au);
      double v8 = *v6;
    }
  }
  sub_1CFE15EFC(v8, v4, v5);
  double v11 = sub_1CFE1438C() - *v6;
  if (v11 > 1.0)
  {
    uint64_t v12 = ++qword_1EBD0F928;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 136315906;
    v30 = "ScheduleSetBrightnessIn_block_invoke";
    __int16 v31 = 2048;
    double v32 = v11;
    __int16 v33 = 2048;
    uint64_t v34 = v12;
    __int16 v35 = 2048;
    uint64_t v36 = qword_1EBD0F920;
    v13 = MEMORY[0x1E4F14500];
    v14 = "%s: exit WaitUntil late %f millisecond (%llu / %llu)";
    goto LABEL_10;
  }
  if (v11 < -0.100000001)
  {
    uint64_t v15 = ++qword_1EA6238D0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v30 = "ScheduleSetBrightnessIn_block_invoke";
      __int16 v31 = 2048;
      double v32 = -v11;
      __int16 v33 = 2048;
      uint64_t v34 = v15;
      __int16 v35 = 2048;
      uint64_t v36 = qword_1EBD0F920;
      v13 = MEMORY[0x1E4F14500];
      v14 = "%s: exit WaitUntil early %f millisecond (%llu / %llu)";
LABEL_10:
      _os_log_impl(&dword_1CFE12000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0x2Au);
    }
  }
LABEL_11:
  std::mutex::lock((std::mutex *)(v2 + 136));
  v16 = sub_1CFE15DF0((void *)(v2 + 256), v6);
  v18 = (uint64_t *)v16;
  v19 = v17;
  if (v16 != v17)
  {
    v20 = v16;
    while (!*((unsigned char *)v20 + 24))
    {
      v20 = *(double **)v20;
      if (v20 == v17) {
        goto LABEL_24;
      }
    }
    if (v20 == v17)
    {
      do
      {
LABEL_24:
        uint64_t v28 = *v18;
        sub_1CFE15C78((void *)(v2 + 256), v18);
        v18 = (uint64_t *)v28;
      }
      while ((double *)v28 != v19);
      goto LABEL_25;
    }
    do
    {
      uint64_t v21 = *v18;
      sub_1CFE15C78((void *)(v2 + 256), v18);
      v18 = (uint64_t *)v21;
    }
    while ((double *)v21 != v19);
    if (*(void *)(v2 + 128))
    {
      sub_1CFE1426C((unsigned char *)v2);
      double v22 = sub_1CFE1438C();
      (*(void (**)(void))(*(void *)(v2 + 128) + 16))();
      double v23 = sub_1CFE1438C() - v22;
      if (v23 > 1.0)
      {
        uint64_t v24 = ++qword_1EBD0F938;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v30 = "ScheduleSetBrightnessIn_block_invoke";
          __int16 v31 = 2048;
          double v32 = v23;
          __int16 v33 = 2048;
          uint64_t v34 = v24;
          __int16 v35 = 2048;
          uint64_t v36 = qword_1EBD0F920;
          _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: callback takes %f millisecond (%llu / %llu)", buf, 0x2Au);
        }
      }
    }
    sub_1CFE13B4C(v2);
    double v26 = v25;
    if (v25 > 0.0)
    {
      double v27 = sub_1CFE1438C();
      sub_1CFE15FC4(v2, v26 + v27);
    }
  }
LABEL_25:
  std::condition_variable::notify_all((std::condition_variable *)(v2 + 208));
  std::mutex::unlock((std::mutex *)(v2 + 136));
}

void sub_1CFE14030(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  std::mutex::unlock(v11);
  if (a2 == 1)
  {
    v14 = __cxa_begin_catch(a1);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = (*(uint64_t (**)(void *))(*(void *)v14 + 16))(v14);
      LODWORD(buf) = 136315394;
      *(void *)((char *)&buf + 4) = "ScheduleSetBrightnessIn_block_invoke";
      WORD6(buf) = 2080;
      *(void *)((char *)&buf + 14) = v15;
      _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: exception %s", (uint8_t *)&buf, 0x16u);
    }
    sub_1CFE16344();
    exception = __cxa_allocate_exception(8uLL);
    void *exception = MEMORY[0x1E4FBA510] + 16;
    __cxa_throw(exception, MEMORY[0x1E4FBA368], MEMORY[0x1E4FBA2C8]);
  }
  _Unwind_Resume(a1);
}

unsigned char *sub_1CFE1416C(unsigned char *result)
{
  v1 = result;
  if (*result)
  {
    v2.n128_f64[0] = sub_1CFE1438C();
    return (unsigned char *)sub_1CFE1430C((uint64_t)(v1 + 80), v2, v3, v4);
  }
  return result;
}

float sub_1CFE14204(uint64_t a1)
{
  __n128 v2 = (std::mutex *)(a1 + 136);
  std::mutex::lock((std::mutex *)(a1 + 136));
  float v3 = sub_1CFE1426C((unsigned char *)a1);
  std::mutex::unlock(v2);
  return v3;
}

void sub_1CFE14258(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

float sub_1CFE1426C(unsigned char *a1)
{
  v2.n128_f64[0] = sub_1CFE1438C();
  unint64_t v3 = v2.n128_u64[0];
  sub_1CFE1430C((uint64_t)(a1 + 32), v2, v4, v5);
  float v9 = v6.n128_f32[0];
  if (a1[1])
  {
    v6.n128_u64[0] = v3;
    sub_1CFE1430C((uint64_t)(a1 + 80), v6, v7, v8);
  }
  else
  {
    sub_1CFE1416C(a1);
  }
  float v11 = 0.000001;
  float v12 = 0.000001;
  if (v9 >= 0.000001)
  {
    float v12 = 1.0;
    if (v9 <= 1.0) {
      float v12 = v9;
    }
  }
  if (v10 >= 0.000001)
  {
    float v11 = 1.0;
    if (v10 <= 1.0) {
      float v11 = v10;
    }
  }
  if (v11 < v12) {
    float v11 = v12;
  }
  return v12 / v11;
}

uint64_t sub_1CFE1430C(uint64_t result, __n128 a2, __n128 a3, __n128 a4)
{
  __n128 v4 = *(uint64_t (**)(__n128, __n128, __n128))(result + 32);
  if (!v4) {
    sub_1CFE244F4();
  }
  double v5 = *(double *)(result + 8);
  double v6 = *(double *)(result + 16);
  if (v5 > a2.n128_f64[0]) {
    a2.n128_u64[0] = *(void *)(result + 8);
  }
  if (v6 != 0.0 && a2.n128_f64[0] <= v5 + v6)
  {
    a2.n128_f64[0] = a2.n128_f64[0] - v5;
    a2.n128_f32[0] = a2.n128_f64[0];
    a3.n128_f64[0] = a2.n128_f32[0];
    float v8 = v6;
    if (v6 >= a2.n128_f32[0]) {
      float v8 = a2.n128_f32[0];
    }
    a2.n128_u32[0] = *(_DWORD *)result;
    a3.n128_u32[0] = *(_DWORD *)(result + 4);
    a4.n128_f64[0] = v8 / v6;
    a4.n128_f32[0] = a4.n128_f64[0];
    return v4(a2, a3, a4);
  }
  return result;
}

double sub_1CFE1438C()
{
  if (qword_1EBD11A50 != -1) {
    dispatch_once(&qword_1EBD11A50, &unk_1F2686E58);
  }
  unsigned int v0 = qword_1EBD11A48;
  unint64_t v1 = HIDWORD(qword_1EBD11A48);
  return (double)(mach_absolute_time() * v0 / v1) / 1000000.0;
}

void sub_1CFE143FC(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  float v8 = *(std::mutex **)(a1 + 32);
  std::mutex::lock(v8);
  unsigned int v9 = 0;
  if (a3 && a4 >= 4) {
    unsigned int v9 = *a3;
  }
  float v10 = *(void **)(a1 + 32);
  if (a2 == 3)
  {
    uint64_t v11 = v10[12];
    if (!v11) {
      goto LABEL_16;
    }
    float v12 = v10 + 12;
    do
    {
      unsigned int v13 = *(_DWORD *)(v11 + 32);
      BOOL v14 = v13 >= v9;
      if (v13 >= v9) {
        uint64_t v15 = (uint64_t *)v11;
      }
      else {
        uint64_t v15 = (uint64_t *)(v11 + 8);
      }
      if (v14) {
        float v12 = (void *)v11;
      }
      uint64_t v11 = *v15;
    }
    while (*v15);
    if (v12 == v10 + 12 || v9 < *((_DWORD *)v12 + 8)) {
LABEL_16:
    }
      operator new[]();
    uint64_t v36 = 0;
    uint64_t v37 = v12[5];
    do
    {
      *(_DWORD *)(v37 + v36 * 4) = a3[v36 + 1];
      ++v36;
    }
    while (v36 != 6);
  }
  v16 = (void *)v10[8];
  if (v16 != v10 + 9)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    do
    {
      if (sub_1CFE14C30(*((_DWORD *)v16 + 8)) == v9)
      {
        v18 = (void (**)(void, void))v16[6];
        if (v16[7])
        {
          v19 = _Block_copy(v18);
          v20 = v16[7];
          block[0] = v17;
          block[1] = 3221225472;
          block[2] = sub_1CFE13AD0;
          block[3] = &unk_1E6872E68;
          id v46 = v19;
          int v47 = a2;
          id v21 = v19;
          dispatch_async(v20, block);
        }
        else
        {
          v18[2](v18, a2);
        }
      }
      double v22 = (void *)v16[1];
      if (v22)
      {
        do
        {
          double v23 = v22;
          double v22 = (void *)*v22;
        }
        while (v22);
      }
      else
      {
        do
        {
          double v23 = (void *)v16[2];
          BOOL v24 = *v23 == (void)v16;
          v16 = v23;
        }
        while (!v24);
      }
      float v10 = *(void **)(a1 + 32);
      v16 = v23;
    }
    while (v23 != v10 + 9);
  }
  if (a2 != 3)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_49;
    }
    if (a2 > 5) {
      double v32 = "UnknownNotification";
    }
    else {
      double v32 = off_1E6875218[(int)a2];
    }
    int buf = 136315394;
    buf_4 = v32;
    __int16 v50 = 1024;
    unsigned int v51 = v9;
    __int16 v33 = MEMORY[0x1E4F14500];
    uint64_t v34 = "libEDR - NotificationCallback: (type: %s, display: %d)\n";
    uint32_t v35 = 18;
LABEL_48:
    _os_log_impl(&dword_1CFE12000, v33, OS_LOG_TYPE_INFO, v34, (uint8_t *)&buf, v35);
    goto LABEL_49;
  }
  uint64_t v27 = v10[12];
  double v25 = v10 + 12;
  uint64_t v26 = v27;
  if (v27)
  {
    uint64_t v28 = v25;
    do
    {
      unsigned int v29 = *(_DWORD *)(v26 + 32);
      BOOL v30 = v29 >= v9;
      if (v29 >= v9) {
        __int16 v31 = (uint64_t *)v26;
      }
      else {
        __int16 v31 = (uint64_t *)(v26 + 8);
      }
      if (v30) {
        uint64_t v28 = (void *)v26;
      }
      uint64_t v26 = *v31;
    }
    while (*v31);
    if (v28 != v25 && v9 >= *((_DWORD *)v28 + 8))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_49;
      }
      v38 = (float *)v28[5];
      double v39 = *v38;
      double v40 = v38[1];
      double v41 = v38[2];
      double v42 = v38[3];
      double v43 = v38[4];
      double v44 = v38[5];
      int buf = 136316930;
      buf_4 = "kEDRNotifyBrightness";
      __int16 v50 = 1024;
      unsigned int v51 = v9;
      __int16 v52 = 2048;
      double v53 = v39;
      __int16 v54 = 2048;
      double v55 = v40;
      __int16 v56 = 2048;
      double v57 = v41;
      __int16 v58 = 2048;
      double v59 = v42;
      __int16 v60 = 2048;
      double v61 = v43;
      __int16 v62 = 2048;
      double v63 = v44;
      __int16 v33 = MEMORY[0x1E4F14500];
      uint64_t v34 = "libEDR - NotificationCallback: (type: %s, display: %d, brightness: %f, backlight: %f, edrScaler: %f, maxLumi"
            "nance: %f, ambientIlluminance: %f, brightnessScaler: %f)\n";
      uint32_t v35 = 78;
      goto LABEL_48;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    sub_1CFE24048(v9);
  }
LABEL_49:
  std::mutex::unlock(v8);
}

void sub_1CFE14804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::mutex *a10)
{
  std::mutex::unlock(v10);
  _Unwind_Resume(a1);
}

void EDRServerSetDisplayBrightnessForDisplay(int a1, float a2, float a3, float a4, float a5)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  __int16 v33 = (std::mutex *)qword_1EBD0F980;
  char v34 = 1;
  std::mutex::lock((std::mutex *)qword_1EBD0F980);
  uint64_t v10 = sub_1CFE14B9C(a1);
  if (!v10) {
    goto LABEL_33;
  }
  uint64_t v11 = v10;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int buf = 136316418;
    *(void *)uint64_t v36 = "EDRServerSetDisplayBrightnessForDisplay";
    *(_WORD *)&v36[8] = 1024;
    *(_DWORD *)&v36[10] = a1;
    __int16 v37 = 2048;
    double v38 = a2;
    __int16 v39 = 2048;
    double v40 = a3;
    __int16 v41 = 2048;
    double v42 = a4;
    __int16 v43 = 2048;
    double v44 = a5;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: (display: %d, targetBrightness: %f, maxLuminance: %f, ambientIlluminance: %f, brightnessScaler: %f)\n", buf, 0x3Au);
  }
  float v12 = *(float *)(v11 + 364);
  float v13 = vabds_f32(v12, a2);
  BOOL v14 = v13 > 0.01 && (v12 < 0.01 || a2 < 0.01);
  BOOL v15 = v13 > 0.01;
  float v16 = vabds_f32(*(float *)(v11 + 556), a5);
  float v17 = 0.000001;
  float v18 = vabds_f32(*(float *)(v11 + 356), a3);
  if (v16 > 0.000001) {
    BOOL v15 = 1;
  }
  *(float *)(v11 + 364) = a2;
  *(float *)(v11 + 356) = a3;
  *(float *)(v11 + 360) = a4;
  *(float *)(v11 + 556) = a5;
  int v19 = v18 > 0.01 || v15;
  if (v19 == 1)
  {
    BOOL v20 = v16 <= 0.000001;
    if (v18 > 0.01) {
      BOOL v20 = 0;
    }
    unsigned __int8 v21 = *(float *)(v11 + 324) < 1.0 && v20;
    if ((float)(a2 / a3) >= 0.000001)
    {
      float v17 = a2 / a3;
      if ((float)(a2 / a3) > 1.0) {
        float v17 = 1.0;
      }
    }
    sub_1CFE15348(v11, v21, v17);
  }
  float v22 = sub_1CFE14204(v11);
  uint64_t v23 = 0;
  *(_DWORD *)(v11 + 320) = a1;
  *(float *)(v11 + 560) = v22 * v24;
  *(float *)(v11 + 564) = v22;
  *(float *)(v11 + 568) = v24;
  *(void *)(v11 + 572) = *(void *)(v11 + 356);
  *(_DWORD *)(v11 + 580) = *(_DWORD *)(v11 + 556);
  v32[0] = a1;
  do
  {
    v32[v23 + 1] = *(_DWORD *)(v11 + 560 + v23 * 4);
    ++v23;
  }
  while (v23 != 6);
  if (v14) {
    sub_1CFE18CCC();
  }
  sub_1CFE15304((uint64_t)&v33);
  if (v19) {
    sub_1CFE15588(a1, 1);
  }
  sub_1CFE14CD4(3, v32, 28);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v25 = *(_DWORD *)(v11 + 320);
    double v26 = *(float *)(v11 + 560);
    double v27 = *(float *)(v11 + 564);
    double v28 = *(float *)(v11 + 568);
    double v29 = *(float *)(v11 + 572);
    double v30 = *(float *)(v11 + 576);
    double v31 = *(float *)(v11 + 580);
    *(_DWORD *)int buf = 67110656;
    *(_DWORD *)uint64_t v36 = v25;
    *(_WORD *)&v36[4] = 2048;
    *(double *)&v36[6] = v26;
    __int16 v37 = 2048;
    double v38 = v27;
    __int16 v39 = 2048;
    double v40 = v28;
    __int16 v41 = 2048;
    double v42 = v29;
    __int16 v43 = 2048;
    double v44 = v30;
    __int16 v45 = 2048;
    double v46 = v31;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - PostNotification: (display: %d, brightness: %f, backlight: %f, edrScaling: %f, maxLuminance: %f, ambientIlluminance: %f, brightnessScaler: %f)\n", buf, 0x44u);
  }
  if (v34) {
LABEL_33:
  }
    std::mutex::unlock(v33);
}

void sub_1CFE14B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::mutex *a13, char a14)
{
}

uint64_t sub_1CFE14B9C(int a1)
{
  if (a1 == -559038737)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      sub_1CFE23ED8();
    }
    return 0;
  }
  else
  {
    uint64_t result = qword_1EBD0F978;
    uint64_t v3 = 16;
    while (*(_DWORD *)(result + 320) != a1)
    {
      result += 584;
      if (!--v3)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          sub_1CFE23F50();
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_1CFE14C30(unsigned int a1)
{
  uint64_t v1 = dword_1EBD0F918;
  if (!qword_1EBD0F9E0) {
    operator new();
  }
  uint64_t v2 = *(void *)(qword_1EBD0F9E0 + 8);
  if (v2)
  {
    uint64_t v3 = qword_1EBD0F9E0 + 8;
    do
    {
      unsigned int v4 = *(_DWORD *)(v2 + 28);
      BOOL v5 = v4 >= a1;
      if (v4 >= a1) {
        double v6 = (uint64_t *)v2;
      }
      else {
        double v6 = (uint64_t *)(v2 + 8);
      }
      if (v5) {
        uint64_t v3 = v2;
      }
      uint64_t v2 = *v6;
    }
    while (*v6);
    if (v3 != qword_1EBD0F9E0 + 8 && *(_DWORD *)(v3 + 28) <= a1) {
      return *(unsigned int *)(v3 + 32);
    }
  }
  return v1;
}

uint64_t sub_1CFE14CD4(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1CFE14F38();
  int v22 = a1;
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  if (a3 >= 0x21)
  {
    syslog(3, "EDR - %s: data size %d exceeds max data size %d\n", "post_notification", a3, 32);
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = v6;
  sub_1CFE14FC4(v6, a1, (uint64_t)a2, a3, 1);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v9 + 232));
  int v21 = 0;
  uint64_t v10 = sub_1CFE14E64((void *)(v9 + 40), &v21);
  if (v10 == v11)
  {
    uint64_t v7 = 0;
    char v14 = 0;
  }
  else
  {
    float v12 = v10;
    float v13 = v11;
    char v14 = 0;
    LODWORD(v7) = 0;
    do
    {
      int v15 = sub_1CFE21844(*((unsigned int *)v12 + 9), a1, a2, a3, 0);
      v14 |= v15 == 1;
      if (v15) {
        uint64_t v7 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v7 = v7;
      }
      float v12 = (uint64_t *)*v12;
    }
    while (v12 != v13);
  }
  float v16 = sub_1CFE14E64((void *)(v9 + 40), &v22);
  if (v16 != v17)
  {
    float v18 = v16;
    int v19 = v17;
    do
    {
      int v20 = sub_1CFE21844(*((unsigned int *)v18 + 9), a1, a2, a3, 0);
      v14 |= v20 == 1;
      if (v20) {
        uint64_t v7 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v7 = v7;
      }
      float v18 = (uint64_t *)*v18;
    }
    while (v18 != v19);
  }
  pthread_rwlock_unlock((pthread_rwlock_t *)(v9 + 232));
  if (v14) {
    sub_1CFE221D8(v9);
  }
  return v7;
}

uint64_t *sub_1CFE14E64(void *a1, int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  uint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  uint64_t result = *v6;
  if (!*v6) {
    return result;
  }
  while (1)
  {
    unint64_t v8 = result[1];
    if (v8 == v3) {
      break;
    }
    if (v4.u32[0] > 1uLL)
    {
      if (v8 >= *(void *)&v2) {
        v8 %= *(void *)&v2;
      }
    }
    else
    {
      v8 &= *(void *)&v2 - 1;
    }
    if (v8 != v5) {
      return 0;
    }
LABEL_16:
    uint64_t result = (uint64_t *)*result;
    if (!result) {
      return result;
    }
  }
  if (*((_DWORD *)result + 4) != v3) {
    goto LABEL_16;
  }
  uint64_t v9 = result;
  do
    uint64_t v9 = (uint64_t *)*v9;
  while (v9 && *((_DWORD *)v9 + 4) == v3);
  return result;
}

uint64_t sub_1CFE14F38()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBD0F970, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EBD0F970))
  {
    operator new();
  }
  return qword_1EBD11A40;
}

void sub_1CFE14FAC(_Unwind_Exception *a1)
{
}

uint64_t sub_1CFE14FC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  int v28 = a2;
  uint64_t v10 = (pthread_rwlock_t *)(a1 + 232);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 232));
  uint64_t v11 = (void *)(a1 + 192);
  int v27 = 0;
  float v12 = sub_1CFE150F0(v11, &v27);
  if (v12 != v13)
  {
    char v14 = v12;
    int v15 = v13;
    do
    {
      long long v16 = *(_OWORD *)(v14 + 5);
      v26[0] = *(_OWORD *)(v14 + 3);
      v26[1] = v16;
      long long v17 = *(_OWORD *)(v14 + 9);
      v26[2] = *(_OWORD *)(v14 + 7);
      v26[3] = v17;
      sub_1CFE151F0(v26, a2, a3, a4, a5);
      char v14 = (uint64_t *)*v14;
    }
    while (v14 != v15);
  }
  float v18 = sub_1CFE150F0(v11, &v28);
  if (v18 != v19)
  {
    int v20 = v18;
    int v21 = v19;
    do
    {
      long long v22 = *(_OWORD *)(v20 + 5);
      v25[0] = *(_OWORD *)(v20 + 3);
      v25[1] = v22;
      long long v23 = *(_OWORD *)(v20 + 9);
      v25[2] = *(_OWORD *)(v20 + 7);
      v25[3] = v23;
      sub_1CFE151F0(v25, a2, a3, a4, a5);
      int v20 = (uint64_t *)*v20;
    }
    while (v20 != v21);
  }
  return pthread_rwlock_unlock(v10);
}

uint64_t *sub_1CFE150F0(void *a1, int *a2)
{
  uint64_t result = sub_1CFE1513C(a1, a2);
  if (result)
  {
    uint8x8_t v4 = result;
    do
      uint8x8_t v4 = (uint64_t *)*v4;
    while (v4 && *((_DWORD *)v4 + 4) == *a2);
  }
  return result;
}

uint64_t *sub_1CFE1513C(void *a1, int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  uint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (uint64_t result = *v6; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == v3) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }
      else
      {
        v8 &= *(void *)&v2 - 1;
      }
      if (v8 != v5) {
        return 0;
      }
    }
  }
  return result;
}

void sub_1CFE151F0(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) != 0 || !*((unsigned char *)a1 + 56))
  {
    uint64_t v9 = *(NSObject **)a1;
    if (*(void *)a1)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 0x40000000;
      v15[2] = sub_1CFE222E4;
      v15[3] = &unk_1E68752F8;
      long long v10 = a1[1];
      long long v16 = *a1;
      long long v17 = v10;
      long long v11 = a1[3];
      long long v18 = a1[2];
      long long v19 = v11;
      uint64_t v20 = a3;
      int v21 = a2;
      int v22 = a4;
      dispatch_sync(v9, v15);
    }
    else
    {
      uint64_t v12 = *((void *)a1 + 2);
      if (v12) {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(v12 + 16))(v12, a2, a3, a4, *((void *)a1 + 4));
      }
      float v13 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))*((void *)a1 + 5);
      if (v13)
      {
        uint64_t v14 = *((void *)a1 + 6);
        v13(a2, a3, a4, v14);
      }
    }
  }
}

void sub_1CFE15304(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    std::mutex::unlock(*(std::mutex **)a1);
    *(unsigned char *)(a1 + 8) = 0;
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::unlock: not locked");
    sub_1CFE15348();
  }
}

void sub_1CFE15348(uint64_t a1, unsigned __int8 a2, float a3)
{
  uint64_t v6 = (std::mutex *)(a1 + 136);
  std::mutex::lock((std::mutex *)(a1 + 136));
  if (vabds_f32(a3, sub_1CFE15580(a1 + 32)) >= 0.000001)
  {
    float v7 = sub_1CFE1426C((unsigned char *)a1);
    float v9 = v8;
    nullsub_1(a1 + 32);
    double v10 = 0.0;
    if (((*(unsigned char *)(a1 + 26) != 0) & a2) != 0) {
      double v10 = 100.0;
    }
    sub_1CFE15FAC(a1 + 32, v7 * v9, a3, v10);
    sub_1CFE15F80(a1 + 32);
    sub_1CFE13AE8(a1);
  }
  std::mutex::unlock(v6);
}

void sub_1CFE15454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  std::mutex::unlock(v9);
  if (a2 == 1)
  {
    uint64_t v12 = __cxa_begin_catch(a1);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = (*(uint64_t (**)(void *))(*(void *)v12 + 16))(v12);
      LODWORD(a9) = 136315394;
      *(void *)((char *)&a9 + 4) = "SetBrightness";
      WORD6(a9) = 2080;
      *(void *)((char *)&a9 + 14) = v13;
      _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: exception %s", (uint8_t *)&a9, 0x16u);
    }
    sub_1CFE16344();
    exception = __cxa_allocate_exception(8uLL);
    void *exception = MEMORY[0x1E4FBA510] + 16;
    __cxa_throw(exception, MEMORY[0x1E4FBA368], MEMORY[0x1E4FBA2C8]);
  }
  _Unwind_Resume(a1);
}

float sub_1CFE15580(uint64_t a1)
{
  return *(float *)(a1 + 4);
}

void sub_1CFE15588(int a1, char a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v26 = a1;
  float v24 = (std::mutex *)qword_1EBD0F980;
  char v25 = 1;
  std::mutex::lock((std::mutex *)qword_1EBD0F980);
  uint64_t v4 = sub_1CFE14B9C(a1);
  if (!v4) {
    goto LABEL_46;
  }
  uint64_t v5 = v4;
  uint64_t v6 = (_DWORD *)(v4 + 376);
  memset_pattern16((void *)(v4 + 376), &unk_1CFE24ED0, 0x18uLL);
  if (*(void *)(v5 + 312))
  {
    float v7 = *(float **)(v5 + 296);
    if (v7 == (float *)(v5 + 304)) {
      goto LABEL_14;
    }
    char v8 = 0;
    float v9 = 1.0;
    do
    {
      BOOL v10 = v7[10] >= 0.000001 && v9 > v7[10];
      if (v10) {
        float v9 = v7[10];
      }
      long long v11 = (float *)*((void *)v7 + 1);
      if (v11)
      {
        do
        {
          uint64_t v12 = v11;
          long long v11 = *(float **)v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          uint64_t v12 = (float *)*((void *)v7 + 2);
          BOOL v13 = *(void *)v12 == (void)v7;
          float v7 = v12;
        }
        while (!v13);
      }
      v8 |= v10;
      float v7 = v12;
    }
    while (v12 != (float *)(v5 + 304));
    if ((v8 & 1) == 0) {
LABEL_14:
    }
      float v9 = *(float *)(v5 + 324);
  }
  else
  {
    *(_DWORD *)(v5 + 340) = *(_DWORD *)(v5 + 324);
    float v9 = 0.0;
  }
  float v14 = (float)(*(float *)(v5 + 364) * *(float *)(v5 + 556)) / *(float *)(v5 + 356);
  *(float *)(v5 + 380) = v14;
  float v15 = 0.000001;
  if (v14 < 0.000001 || (float v15 = 1.0, v14 > 1.0)) {
    *(float *)(v5 + 380) = v15;
  }
  *(float *)(v5 + 384) = v9;
  float v16 = *(float *)(v5 + 324);
  *(float *)(v5 + 376) = v16;
  *(_DWORD *)(v5 + 388) = *(_DWORD *)(v5 + 444);
  if (*(unsigned char *)(v5 + 400)) {
    *(_DWORD *)(v5 + 392) = 1065353216;
  }
  if (*(unsigned char *)(v5 + 368)) {
    *(_DWORD *)(v5 + 396) = 1065353216;
  }
  for (uint64_t i = 380; i != 400; i += 4)
  {
    if (v16 < *(float *)(v5 + i))
    {
      float v16 = *(float *)(v5 + i);
      uint64_t v6 = (_DWORD *)(v5 + i);
    }
  }
  *(_DWORD *)(v5 + 340) = *v6;
  *(_DWORD *)(v5 + 372) = 897988541;
  float v18 = 0.000001;
  for (uint64_t j = 376; j != 400; j += 4)
  {
    if (j != 388)
    {
      float v20 = *(float *)(v5 + j);
      if (v20 > v18)
      {
        *(float *)(v5 + 372) = v20;
        float v18 = v20;
      }
    }
  }
  float v21 = sub_1CFE14204(v5);
  *(float *)(v5 + 372) = fmaxf(*(float *)(v5 + 372), v21 * v22);
  if (*(void *)(v5 + 312))
  {
    if ((sub_1CFE15AB4(v5) & 1) == 0)
    {
      sub_1CFE166AC(v5, 1);
      sub_1CFE15304((uint64_t)&v24);
      sub_1CFE14CD4(1, &v26, 4);
      if (*(unsigned char *)(v5 + 552))
      {
        if (!sub_1CFE1DDC8(v26))
        {
          if (*(unsigned char *)(v5 + 440))
          {
            sub_1CFE1DF0C(v26, 1);
            if (sub_1CFE1DDC8(v26)) {
              sub_1CFE1E08C(v26);
            }
          }
        }
      }
    }
  }
  else if (sub_1CFE15AB4(v5))
  {
    sub_1CFE166AC(v5, 0);
    sub_1CFE15304((uint64_t)&v24);
    sub_1CFE14CD4(2, &v26, 4);
    if (*(unsigned char *)(v5 + 552))
    {
      if (sub_1CFE1DDC8(v26))
      {
        sub_1CFE18480(v26);
        sub_1CFE1DF0C(v26, 0);
      }
    }
  }
  sub_1CFE15A48(v5, 1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    double v23 = *(float *)(v5 + 340);
    *(_DWORD *)int buf = 136315394;
    int v28 = "EDRServerUpdateMinScalingFactor";
    __int16 v29 = 2048;
    double v30 = v23;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s min scaling factor set to: %f\n", buf, 0x16u);
  }
  sub_1CFE1592C(v5, a2, *(float *)(v5 + 340));
  if (v25) {
LABEL_46:
  }
    std::mutex::unlock(v24);
}

void sub_1CFE15910(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::mutex *a10, char a11)
{
  if (a11) {
    std::mutex::unlock(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_1CFE1592C(uint64_t a1, char a2, float a3)
{
  uint64_t v6 = (std::mutex *)(a1 + 136);
  std::mutex::lock((std::mutex *)(a1 + 136));
  *(unsigned char *)(a1 + 1) = a2;
  float v7 = 0.001;
  if (a3 >= 0.001) {
    float v7 = a3;
  }
  *(float *)(a1 + 4) = v7;
  if (v7 >= 0.5)
  {
    float v9 = 1.0;
    float v10 = 1.0 - v7;
    float v11 = 0.0;
    float v12 = v7;
  }
  else
  {
    float v8 = 0.5 - v7 + 0.5 - v7;
    float v9 = (float)(v7 * -2.0) / (float)(v8 + -1.0);
    float v10 = (float)(1.0 - v8) / (float)(v9 + v9);
    float v11 = (float)(v9 * v8) / (float)(v8 + -1.0);
    float v12 = (float)(v9 + (float)((float)(v8 * -2.0) * v9)) / (float)((float)(v8 * -2.0) + 2.0);
  }
  *(float *)(a1 + 8) = v10;
  *(float *)(a1 + 12) = v11;
  *(float *)(a1 + 16) = v12;
  *(float *)(a1 + 20) = v9;
  if (*(unsigned char *)(a1 + 26)) {
    sub_1CFE16720(a1, v7);
  }
  std::mutex::unlock(v6);
}

void sub_1CFE15A34(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CFE15A48(uint64_t a1, char a2)
{
  uint64_t v4 = (std::mutex *)(a1 + 136);
  std::mutex::lock((std::mutex *)(a1 + 136));
  *(unsigned char *)(a1 + 25) = a2;
  sub_1CFE15ABC(a1);
  std::mutex::unlock(v4);
}

void sub_1CFE15AA0(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1CFE15AB4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 26);
}

void sub_1CFE15ABC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 24))
  {
    int v1 = *(unsigned __int8 *)(a1 + 25);
    if (*(unsigned __int8 *)(a1 + 26) == v1) {
      return;
    }
    *(unsigned char *)(a1 + 26) = v1;
    if (v1)
    {
      float v2 = *(float *)(a1 + 4);
LABEL_5:
      sub_1CFE16720(a1, v2);
      return;
    }
LABEL_8:
    float v2 = 1.0;
    goto LABEL_5;
  }
  if (*(unsigned char *)(a1 + 26))
  {
    *(unsigned char *)(a1 + 26) = 0;
    goto LABEL_8;
  }
}

double sub_1CFE15AFC(uint64_t a1, float *a2)
{
  uint64_t v3 = 0;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  float v4 = *a2;
  uint64_t v5 = *(void *)(a1 + 32);
  *(float *)(v5 + 564) = *a2;
  float v6 = a2[1];
  *(void *)(v5 + 572) = *(void *)(v5 + 356);
  *(float *)(v5 + 568) = v6;
  *(float *)(v5 + 560) = v4 * v6;
  *(_DWORD *)(v5 + 580) = *(_DWORD *)(v5 + 556);
  v16[0] = *(_DWORD *)(v5 + 320);
  do
  {
    v16[v3 + 1] = *(_DWORD *)(v5 + 560 + v3 * 4);
    ++v3;
  }
  while (v3 != 6);
  sub_1CFE14CD4(3, v16, 28);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(_DWORD *)(v8 + 320);
    double v10 = *(float *)(v8 + 560);
    double v11 = *(float *)(v8 + 564);
    double v12 = *(float *)(v8 + 568);
    double v13 = *(float *)(v8 + 572);
    double v14 = *(float *)(v8 + 576);
    double v15 = *(float *)(v8 + 580);
    *(_DWORD *)int buf = 67110656;
    int v18 = v9;
    __int16 v19 = 2048;
    double v20 = v10;
    __int16 v21 = 2048;
    double v22 = v11;
    __int16 v23 = 2048;
    double v24 = v12;
    __int16 v25 = 2048;
    double v26 = v13;
    __int16 v27 = 2048;
    double v28 = v14;
    __int16 v29 = 2048;
    double v30 = v15;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - PostNotification: (display: %d, brightness: %f, backlight: %f, edrScaling: %f, maxLuminance: %f, ambientIlluminance: %f, brightnessScaler: %f)\n", buf, 0x44u);
  }
  return result;
}

uint64_t sub_1CFE15C78(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  sub_1CFE15CBC(a1, a2, (uint64_t)&__p);
  uint64_t v3 = __p;
  __p = 0;
  if (v3) {
    operator delete(v3);
  }
  return v2;
}

void *sub_1CFE15CBC@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  float v6 = *(void **)(*result + 8 * v4);
  do
  {
    float v7 = v6;
    float v6 = (void *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2) {
    goto LABEL_18;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v3) {
      v8 %= *(void *)&v3;
    }
  }
  else
  {
    v8 &= *(void *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }
    else
    {
      v9 &= *(void *)&v3 - 1;
    }
    if (v9 != v4) {
LABEL_19:
    }
      *(void *)(*result + 8 * v4) = 0;
  }
  uint64_t v10 = *a2;
  if (*a2)
  {
    unint64_t v11 = *(void *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v3) {
        v11 %= *(void *)&v3;
      }
    }
    else
    {
      v11 &= *(void *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }
  *float v7 = v10;
  *a2 = 0;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

double *sub_1CFE15DF0(void *a1, double *a2)
{
  double result = sub_1CFE15E3C(a1, a2);
  if (result)
  {
    unint64_t v4 = result;
    do
      unint64_t v4 = *(double **)v4;
    while (v4 && v4[2] == *a2);
  }
  return result;
}

double *sub_1CFE15E3C(void *a1, double *a2)
{
  double v2 = *a2;
  if (*a2 == 0.0) {
    double v2 = 0.0;
  }
  int8x8_t v3 = (int8x8_t)a1[1];
  if (!*(void *)&v3) {
    return 0;
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    double v5 = v2;
    if (*(void *)&v2 >= *(void *)&v3) {
      *(void *)&double v5 = *(void *)&v2 % *(void *)&v3;
    }
  }
  else
  {
    *(void *)&double v5 = (*(void *)&v3 - 1) & *(void *)&v2;
  }
  float v6 = *(double ***)(*a1 + 8 * *(void *)&v5);
  if (!v6) {
    return 0;
  }
  for (double result = *v6; result; double result = *(double **)result)
  {
    unint64_t v8 = *((void *)result + 1);
    if (v8 == *(void *)&v2)
    {
      if (result[2] == *a2) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v3) {
          v8 %= *(void *)&v3;
        }
      }
      else
      {
        v8 &= *(void *)&v3 - 1;
      }
      if (v8 != *(void *)&v5) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_1CFE15EFC(double a1, double a2, double a3)
{
  if (qword_1EBD11A50 != -1) {
    dispatch_once(&qword_1EBD11A50, &unk_1F2686E58);
  }
  LODWORD(a2) = HIDWORD(qword_1EBD11A48);
  LODWORD(a3) = qword_1EBD11A48;
  return mach_wait_until((unint64_t)(a1
                                          * 1000000.0
                                          * (double)*(unint64_t *)&a2
                                          / (double)*(unint64_t *)&a3));
}

void sub_1CFE15F80(uint64_t a1)
{
  *(double *)(a1 + 8) = sub_1CFE1438C();
}

double sub_1CFE15FAC(uint64_t a1, float a2, float a3, double a4)
{
  *(float *)a1 = a2;
  *(float *)(a1 + 4) = a3;
  double result = a4 / *(float *)(a1 + 24);
  *(double *)(a1 + 16) = result;
  return result;
}

void sub_1CFE15FC4(uint64_t a1, double a2)
{
  if (!*(unsigned char *)(a1 + 200))
  {
    *(double *)float v6 = a2;
    v6[1] = 1;
    sub_1CFE16078((void *)(a1 + 256), (uint64_t)v6);
    global_queue = dispatch_get_global_queue(2, 0);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 0x40000000;
    v5[2] = sub_1CFE13C58;
    v5[3] = &unk_1E6872DD8;
    v5[4] = a1;
    *(double *)&v5[5] = a2;
    dispatch_async(global_queue, v5);
  }
}

void *sub_1CFE16078(void *a1, uint64_t a2)
{
  uint8x8_t v4 = operator new(0x20uLL);
  double v5 = v4;
  double v6 = *(double *)a2;
  *((void *)v4 + 2) = *(void *)a2;
  *((unsigned char *)v4 + 24) = *(unsigned char *)(a2 + 8);
  if (v6 == 0.0) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = *(void *)&v6;
  }
  *(void *)uint8x8_t v4 = 0;
  *((void *)v4 + 1) = v7;
  unint64_t v8 = (void *)sub_1CFE16104((uint64_t)a1, v7, (double *)v4 + 2);
  sub_1CFE1625C(a1, v5, v8);
  return v5;
}

void sub_1CFE160F0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1CFE16104(uint64_t a1, unint64_t a2, double *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    uint64_t v9 = 2 * v6;
    BOOL v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    size_t v11 = v10 | v9;
    unint64_t v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12) {
      size_t v13 = v12;
    }
    else {
      size_t v13 = v11;
    }
    sub_1CFE16B34(a1, v13);
    unint64_t v6 = *(void *)(a1 + 8);
  }
  uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    unint64_t v15 = a2;
    if (v6 <= a2) {
      unint64_t v15 = a2 % v6;
    }
  }
  else
  {
    unint64_t v15 = (v6 - 1) & a2;
  }
  uint64_t v16 = *(void *)(*(void *)a1 + 8 * v15);
  if (!v16) {
    return 0;
  }
  int v17 = 0;
  do
  {
    uint64_t result = v16;
    uint64_t v16 = *(void *)v16;
    if (!v16) {
      break;
    }
    unint64_t v19 = *(void *)(v16 + 8);
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v20 = *(void *)(v16 + 8);
      if (v19 >= v6) {
        unint64_t v20 = v19 % v6;
      }
    }
    else
    {
      unint64_t v20 = v19 & (v6 - 1);
    }
    if (v20 != v15) {
      break;
    }
    BOOL v21 = v19 == a2 && *(double *)(v16 + 16) == *a3;
    int v22 = v17 & !v21;
    v17 |= v21;
  }
  while (v22 != 1);
  return result;
}

void *sub_1CFE1625C(void *result, void *a2, void *a3)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(void *)(*result + 8 * v4) = result + 2;
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
LABEL_18:
    *(void *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
    if (v6 != v4) {
      goto LABEL_18;
    }
  }
LABEL_19:
  ++result[3];
  return result;
}

void sub_1CFE16344()
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  *(_OWORD *)float v8 = 0u;
  long long v9 = 0u;
  int v0 = backtrace(v8, 128);
  int v1 = backtrace_symbols(v8, v0);
  if (v0 >= 1)
  {
    double v2 = v1;
    uint64_t v3 = v0;
    unint64_t v4 = MEMORY[0x1E4F14500];
    do
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint8x8_t v5 = *v2;
        *(_DWORD *)int buf = 136315138;
        float v7 = v5;
        _os_log_impl(&dword_1CFE12000, v4, OS_LOG_TYPE_DEFAULT, "%s\n", buf, 0xCu);
      }
      ++v2;
      --v3;
    }
    while (v3);
  }
}

double sub_1CFE16480(uint64_t a1, float a2, float a3, float a4)
{
  *(float *)(a1 + 4) = a4;
  uint64_t v7 = a1 + 32;
  sub_1CFE23D08(a1 + 32, (uint64_t)sub_1CFE169A4);
  sub_1CFE23D10(v7, (uint64_t)sub_1CFE169D4);
  uint64_t v8 = a1 + 80;
  sub_1CFE23D08(v8, (uint64_t)sub_1CFE16A5C);
  sub_1CFE23D10(v8, (uint64_t)sub_1CFE16A90);
  sub_1CFE15FAC(v7, a2 * a3, a2 * a3, 0.0);
  return sub_1CFE15FAC(v8, a3, a3, 0.0);
}

uint64_t sub_1CFE16550(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "libEDR - EDRDisplay::~EDRDisplay() - Enter\n", buf, 2u);
  }
  *(unsigned char *)(a1 + 200) = 1;
  sub_1CFE16628(a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "libEDR - EDRDisplay::~EDRDisplay() - Exit\n", v3, 2u);
  }
  sub_1CFE16AB4(a1 + 256);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 208));
  std::mutex::~mutex((std::mutex *)(a1 + 136));
  return a1;
}

void sub_1CFE16628(uint64_t a1)
{
  v2.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(a1 + 136);
  v2.__owns_ = 1;
  std::mutex::lock((std::mutex *)(a1 + 136));
  if (!*(void *)(a1 + 280)) {
    goto LABEL_4;
  }
  do
    std::condition_variable::wait((std::condition_variable *)(a1 + 208), &v2);
  while (*(void *)(a1 + 280));
  if (v2.__owns_) {
LABEL_4:
  }
    std::mutex::unlock(v2.__m_);
}

void sub_1CFE16694(void *a1)
{
}

void sub_1CFE166AC(uint64_t a1, char a2)
{
  unint64_t v4 = (std::mutex *)(a1 + 136);
  std::mutex::lock((std::mutex *)(a1 + 136));
  *(unsigned char *)(a1 + 24) = a2;
  sub_1CFE15ABC(a1);
  std::mutex::unlock(v4);
}

void sub_1CFE16704(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

unsigned char *sub_1CFE16718(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

void sub_1CFE16720(uint64_t a1, float a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1 + 80;
  v5.n128_f64[0] = sub_1CFE1438C();
  sub_1CFE1430C(v4, v5, v6, v7);
  float v9 = v8;
  if (vabds_f32(v8, a2) >= 0.000001)
  {
    float v10 = fabsf(log2f(v8 / a2));
    nullsub_1(v4);
    double v11 = (float)(v10 * 1000.0);
    sub_1CFE15FAC(v4, v9, a2, v11);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315906;
      long long v13 = "TransitionToEDRScalingFactor";
      __int16 v14 = 2048;
      double v15 = v9;
      __int16 v16 = 2048;
      double v17 = a2;
      __int16 v18 = 2048;
      double v19 = v11;
      _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "libEDR - %s: start = %f, stop = %f, duration = %f\n", (uint8_t *)&v12, 0x2Au);
    }
    sub_1CFE15F80(v4);
    sub_1CFE13AE8(a1);
  }
}

uint64_t sub_1CFE16870(uint64_t a1, float a2)
{
  return sub_1CFE23D18(a1 + 80, a2);
}

void sub_1CFE16878(float a1)
{
  dword_1EA6238C8 = LODWORD(a1);
}

void sub_1CFE16884(float a1)
{
  dword_1EBD0F888 = LODWORD(a1);
}

float sub_1CFE16890(uint64_t a1)
{
  std::unique_lock<std::mutex> v2 = (std::mutex *)(a1 + 136);
  std::mutex::lock((std::mutex *)(a1 + 136));
  float v3 = sub_1CFE15580(a1 + 32);
  std::mutex::unlock(v2);
  return v3;
}

void sub_1CFE168DC(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

double sub_1CFE168F0(uint64_t a1)
{
  std::unique_lock<std::mutex> v2 = (std::mutex *)(a1 + 136);
  std::mutex::lock((std::mutex *)(a1 + 136));
  sub_1CFE13B4C(a1);
  double v4 = v3;
  std::mutex::unlock(v2);
  return v4;
}

void sub_1CFE1693C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CFE16950(uint64_t a1, void *aBlock)
{
  std::unique_lock<std::mutex> v2 = *(const void **)(a1 + 128);
  *(void *)(a1 + 128) = _Block_copy(aBlock);
  if (v2)
  {
    _Block_release(v2);
  }
}

float sub_1CFE169A4(float a1, float a2, float a3)
{
  if (a2 >= a1) {
    float v3 = a1;
  }
  else {
    float v3 = a2;
  }
  if (a2 < a1)
  {
    float v4 = 1.0 - a3;
  }
  else
  {
    a1 = a2;
    float v4 = a3;
  }
  float v5 = sqrtf(v3);
  float v6 = sqrtf(a1);
  return (float)(v5 + (float)(v4 * (float)(v6 - v5))) * (float)(v5 + (float)(v4 * (float)(v6 - v5)));
}

double sub_1CFE169D4(float a1, float a2, double a3)
{
  if (a1 <= a2) {
    float v4 = a1;
  }
  else {
    float v4 = a2;
  }
  if (a1 <= a2) {
    a1 = a2;
  }
  if (v4 < 0.001) {
    float v4 = 0.001;
  }
  if (a1 < 0.001) {
    a1 = 0.001;
  }
  float v5 = *(float *)&dword_1EA6238C8 + *(float *)&dword_1EA6238C8;
  float v6 = logf(a1 / v4);
  return a3 / ceilf(v6 / logf((float)(v5 + 100.0) / 100.0));
}

float sub_1CFE16A5C(float a1, float a2, float a3)
{
  return powf(fabsf(a1 / a2), -a3) * a1;
}

double sub_1CFE16A90()
{
  return 1000.0 / (float)(*(float *)&dword_1EBD0F888 * 30.0);
}

uint64_t sub_1CFE16AB4(uint64_t a1)
{
  std::unique_lock<std::mutex> v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      float v3 = (void *)*v2;
      operator delete(v2);
      std::unique_lock<std::mutex> v2 = v3;
    }
    while (v3);
  }
  float v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void sub_1CFE16B00()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  int v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void sub_1CFE16B34(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_1CFE16C24(a1, prime);
    }
  }
}

void sub_1CFE16C24(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_1CFE16B00();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(uint64_t ***)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = (unint64_t)v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      for (uint64_t i = *v7; *v7; uint64_t i = *v7)
      {
        unint64_t v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2) {
            v12 %= a2;
          }
        }
        else
        {
          v12 &= a2 - 1;
        }
        if (v12 == v8)
        {
          uint64_t v7 = (uint64_t **)i;
        }
        else
        {
          long long v13 = i;
          if (*(void *)(*(void *)a1 + 8 * v12))
          {
            do
            {
              __int16 v14 = v13;
              long long v13 = (uint64_t *)*v13;
            }
            while (v13 && *((double *)i + 2) == *((double *)v13 + 2));
            *uint64_t v7 = v13;
            void *v14 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = i;
          }
          else
          {
            *(void *)(*(void *)a1 + 8 * v12) = v7;
            uint64_t v7 = (uint64_t **)i;
            unint64_t v8 = v12;
          }
        }
      }
    }
  }
  else
  {
    float v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void sub_1CFE16D98(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (sub_1CFE17298(@"UseSimpleCurve", 1) != 0.0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 136315138;
      double v17 = "EDRServerContextInitialze";
      _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: UseSimpleCurve\n", buf, 0xCu);
    }
    sub_1CFE16718((unsigned char *)a1, 1);
  }
  std::unique_lock<std::mutex> v2 = (float *)(a1 + 324);
  float v3 = sub_1CFE173B0();
  float v4 = sub_1CFE1731C(@"MinEDRScalingFactorLimit", v3);
  if (*(_DWORD *)(a1 + 320) != dword_1EBD0F918) {
    float v4 = 0.000001;
  }
  *(float *)(a1 + 324) = v4;
  if (v4 < 0.000001 || v4 > 1.0) {
    *std::unique_lock<std::mutex> v2 = sub_1CFE173B0();
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    double v6 = *v2;
    *(_DWORD *)int buf = 136315394;
    double v17 = "EDRServerContextInitialze";
    __int16 v18 = 2048;
    double v19 = v6;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: DefaultMinScalingFactor=%f\n", buf, 0x16u);
  }
  *(_DWORD *)(a1 + 372) = *(_DWORD *)(a1 + 324);
  float v7 = sub_1CFE1731C(@"RampingSpeedFactor", 0.5);
  if (v7 <= 0.0) {
    float v7 = 0.5;
  }
  *(float *)(a1 + 328) = v7;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    double v8 = *(float *)(a1 + 328);
    *(_DWORD *)int buf = 136315394;
    double v17 = "EDRServerContextInitialze";
    __int16 v18 = 2048;
    double v19 = v8;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: DefaultRampingSpeedFactor=%f\n", buf, 0x16u);
  }
  float v9 = sub_1CFE1731C(@"BrightnessAnimationTimeStepFactor", 1.0);
  if (v9 <= 0.0) {
    float v9 = 1.0;
  }
  *(float *)(a1 + 332) = v9;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    double v10 = *(float *)(a1 + 332);
    *(_DWORD *)int buf = 136315394;
    double v17 = "EDRServerContextInitialze";
    __int16 v18 = 2048;
    double v19 = v10;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: DefaultBrightnessAnimationTimeStepFactor=%f\n", buf, 0x16u);
  }
  float v11 = sub_1CFE1731C(@"TransitionAnimationTimeStepFactor", 2.0);
  if (v11 <= 0.0) {
    float v11 = 2.0;
  }
  *(float *)(a1 + 336) = v11;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    double v12 = *(float *)(a1 + 336);
    *(_DWORD *)int buf = 136315394;
    double v17 = "EDRServerContextInitialze";
    __int16 v18 = 2048;
    double v19 = v12;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: DefaultTransitionAnimationTimeStepFactor=%f\n", buf, 0x16u);
  }
  *(_OWORD *)(a1 + 340) = *(_OWORD *)(a1 + 324);
  *(_DWORD *)(a1 + 356) = 1140457472;
  *(void *)(a1 + 360) = 0x43FA0000447A0000;
  *(unsigned char *)(a1 + 368) = 0;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBD0F958, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EBD0F958))
  {
    if (qword_1EBD11A18 != -1) {
      dispatch_once(&qword_1EBD11A18, &unk_1F2686ED8);
    }
    __cxa_guard_release(&qword_1EBD0F958);
  }
  *(_OWORD *)(a1 + 456) = xmmword_1EBD0F8F0;
  int v13 = HIDWORD(xmmword_1EBD0F900);
  *(_OWORD *)(a1 + 472) = xmmword_1EBD0F900;
  int v14 = dword_1EBD0F910;
  *(_DWORD *)(a1 + 488) = dword_1EBD0F910;
  *(_DWORD *)(a1 + 492) = v13;
  *(_DWORD *)(a1 + 496) = v14;
  *(unsigned char *)(a1 + 440) = sub_1CFE17298(@"BIM", 1) != 0.0;
  byte_1EA6238D8 = sub_1CFE17298(@"BIMInfoLogging", 0) != 0.0;
  *(float *)(a1 + 472) = sub_1CFE1731C(@"DeltaFactor", *(float *)(a1 + 472));
  *(float *)(a1 + 476) = sub_1CFE1731C(@"MinutesPerStopMitigate", *(float *)(a1 + 476));
  *(float *)(a1 + 480) = sub_1CFE1731C(@"MinutesPerStopRecovery", *(float *)(a1 + 480));
  *(float *)(a1 + 484) = sub_1CFE1731C(@"FloatSbimAboveMax", *(float *)(a1 + 484));
  *(float *)(a1 + 488) = sub_1CFE1731C(@"SbimSustainMax", *(float *)(a1 + 488));
  *(_DWORD *)(a1 + 444) = *(_DWORD *)(a1 + 324);
  *(_DWORD *)(a1 + 556) = 1065353216;
  sub_1CFE16480(a1, 1.0, 1.0, 0.125);
  sub_1CFE16870(a1, *(float *)(a1 + 344));
  sub_1CFE16878(*(float *)(a1 + 348));
  sub_1CFE16884(*(float *)(a1 + 352));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1CFE15AFC;
  aBlock[3] = &unk_1E6872DF8;
  aBlock[4] = a1;
  sub_1CFE16950(a1, aBlock);
}

float sub_1CFE17298(const __CFString *a1, BOOL a2)
{
  CFBooleanRef v3 = (const __CFBoolean *)CFPreferencesCopyValue(a1, @"com.apple.libEDR", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  if (v3)
  {
    CFBooleanRef v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFBooleanGetTypeID()) {
      a2 = CFBooleanGetValue(v4) != 0;
    }
    CFRelease(v4);
  }
  return (float)a2;
}

float sub_1CFE1731C(const __CFString *a1, float a2)
{
  float v2 = a2;
  float valuePtr = a2;
  CFNumberRef v3 = (const __CFNumber *)CFPreferencesCopyValue(a1, @"com.apple.libEDR", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  if (v3)
  {
    CFNumberRef v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFNumberGetTypeID()) {
      CFNumberGetValue(v4, kCFNumberFloatType, &valuePtr);
    }
    CFRelease(v4);
    return valuePtr;
  }
  return v2;
}

float sub_1CFE173B0()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBD0F948, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EBD0F948))
  {
    if (qword_1EBD11A18 != -1) {
      dispatch_once(&qword_1EBD11A18, &unk_1F2686ED8);
    }
    __cxa_guard_release(&qword_1EBD0F948);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBD0F950, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EBD0F950))
  {
    dword_1EBD11A00 = dword_1EBD0F8D8;
    __cxa_guard_release(&qword_1EBD0F950);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v1 = 136315394;
    float v2 = "MinScalingFactorByModel";
    __int16 v3 = 2048;
    double v4 = *(float *)&dword_1EBD11A00;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: min scaling value=%f\n", (uint8_t *)&v1, 0x16u);
  }
  return *(float *)&dword_1EBD11A00;
}

void EDRServerStartService()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int buf = 136315138;
    double v6 = "EDRServerStartService";
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s\n", buf, 0xCu);
  }
  *(void *)double v4 = 0x200000006;
  size_t v3 = 32;
  xmmword_1EBD0F989 = 0u;
  unk_1EBD0F999 = 0u;
  sysctl(v4, 2u, &xmmword_1EBD0F989, &v3, 0, 0);
  *(void *)double v4 = 0x4100000001;
  size_t v3 = 32;
  xmmword_1EBD0F9A9 = 0u;
  unk_1EBD0F9B9 = 0u;
  sysctl(v4, 2u, &xmmword_1EBD0F9A9, &v3, 0, 0);
  if (!qword_1EBD0F980) {
    operator new();
  }
  if (!qword_1EBD11AB8)
  {
    dispatch_queue_t v0 = dispatch_queue_create("com.apple.libEDR", 0);
    int v1 = (void *)qword_1EBD11AB8;
    qword_1EBD11AB8 = (uint64_t)v0;

    if (!qword_1EBD11AB8)
    {
      qword_1EBD11AB8 = dispatch_get_global_queue(0, 0);
    }
  }
  if (!qword_1EBD0F978) {
    operator new[]();
  }
  sub_1CFE20364();
  sub_1CFE20620(qword_1EBD11AB8, 0, sub_1CFE179E0, 0);
  notify_register_dispatch("com.apple.system.lowpowermode", (int *)&unk_1EBD0F9D0, (dispatch_queue_t)qword_1EBD11AB8, &unk_1F2686E18);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int buf = 136315138;
    double v6 = "EDRServerRegisterForDumpStateToSysDiagnose";
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s\n", buf, 0xCu);
  }
  float v2 = dispatch_get_global_queue(0, 0);
  os_state_add_handler();

  if (qword_1EBD11A10 != -1) {
    dispatch_once(&qword_1EBD11A10, &unk_1F2686E98);
  }
}

void sub_1CFE1794C(_Unwind_Exception *exception_object)
{
}

uint64_t sub_1CFE17990(uint64_t a1)
{
  sub_1CFE1B8FC(a1 + 296, *(void **)(a1 + 304));
  return sub_1CFE166A8(a1);
}

void sub_1CFE179E0(uint64_t a1, int a2, unsigned int *a3, uint64_t a4, int *a5, int *a6, _DWORD *a7)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  switch(a2)
  {
    case 0:
      unsigned int v10 = 0;
      goto LABEL_7;
    case 6:
      int v12 = ++dword_1EBD119F8;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 136315394;
        *(void *)&uint8_t buf[4] = "EDRServerCreateClientID";
        __int16 v50 = 1024;
        int v51 = v12;
        _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d\n", buf, 0x12u);
        int v12 = dword_1EBD119F8;
      }
      *a5 = 0;
      *a7 = 4;
      *a6 = v12;
      return;
    case 7:
      unsigned int v10 = *a3;
LABEL_7:
      sub_1CFE1B950(a1, v10);
      return;
    case 8:
      *a5 = 1;
      unsigned int v13 = *a3;
      int v14 = a3[1];
      int v15 = 1;
      goto LABEL_12;
    case 9:
      *a5 = 2;
      unsigned int v13 = *a3;
      int v14 = a3[1];
      int v15 = 0;
LABEL_12:
      sub_1CFE189F8(a1, v13, v14, v15);
      return;
    case 10:
      int v16 = a3[1];
      if (EDRServerIsEnabledForDisplay(v16)) {
        int v17 = 1;
      }
      else {
        int v17 = 2;
      }
      goto LABEL_68;
    case 11:
      int v18 = *a3;
      int v19 = a3[1];
      int v20 = 1;
      goto LABEL_20;
    case 12:
      int v18 = *a3;
      int v19 = a3[1];
      int v20 = 0;
LABEL_20:
      sub_1CFE1BBB4(a1, v18, v19, v20);
      return;
    case 13:
      int v16 = a3[1];
      uint64_t v21 = sub_1CFE14B9C(v16);
      if (!v21) {
        goto LABEL_67;
      }
      int v22 = *(unsigned __int8 *)(v21 + 368);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        long long v23 = "Yes";
        *(void *)&uint8_t buf[4] = "EDRServerHasAccessibilityLimit";
        *(_DWORD *)int buf = 136315650;
        if (!v22) {
          long long v23 = "No";
        }
        __int16 v50 = 1024;
        int v51 = v16;
        __int16 v52 = 2080;
        *(void *)double v53 = v23;
        _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: did=%d enabled=%s\n", buf, 0x1Cu);
      }
      if (v22) {
        int v17 = 4;
      }
      else {
LABEL_67:
      }
        int v17 = 5;
LABEL_68:
      *a5 = v17;
      *a6 = v16;
      return;
    case 14:
      uint64_t v25 = *a3;
      int v24 = a3[1];
      float v26 = *((float *)a3 + 2);
      float v27 = 1.0;
      if (v26 >= 1.0) {
        float v28 = 1.0 / v26;
      }
      else {
        float v28 = 1.0;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 136316162;
        *(void *)&uint8_t buf[4] = "EDRServerSetDisplayEDRScalingFactorLimit";
        __int16 v50 = 1024;
        int v51 = a1;
        __int16 v52 = 1024;
        *(_DWORD *)double v53 = v25;
        *(_WORD *)&v53[4] = 1024;
        *(_DWORD *)&v53[6] = v24;
        *(_WORD *)&v53[10] = 2048;
        *(double *)&v53[12] = v28;
        _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: pid=%d cid=%d did=%d limit=%f\n", buf, 0x28u);
      }
      unint64_t v29 = v25 | (a1 << 32);
      BOOL v30 = v28 > 1.0 || v28 < 0.000001;
      long long v31 = (std::mutex *)qword_1EBD0F980;
      if (!v30) {
        float v27 = v28;
      }
      unint64_t v48 = v29;
      *(void *)int buf = qword_1EBD0F980;
      buf[8] = 1;
      std::mutex::lock((std::mutex *)qword_1EBD0F980);
      uint64_t v32 = sub_1CFE14B9C(v24);
      if (!v32) {
        goto LABEL_63;
      }
      long long v33 = (uint64_t **)(v32 + 296);
      sub_1CFE1C158(v32 + 296, &v48);
      if (v27 < 1.0)
      {
        v47[0] = v48;
        v47[1] = LODWORD(v27);
        sub_1CFE1C1D4(v33, v47, (uint64_t)v47);
      }
      sub_1CFE18CCC();
      sub_1CFE15304((uint64_t)buf);
      sub_1CFE15588(v24, 1);
      if (buf[8])
      {
        long long v31 = *(std::mutex **)buf;
LABEL_63:
        std::mutex::unlock(v31);
      }
      return;
    case 15:
      int v34 = a3[1];
      float v35 = *((float *)a3 + 2);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 136315906;
        *(void *)&uint8_t buf[4] = "EDRServerSetRampingSpeedFactor";
        __int16 v50 = 1024;
        int v51 = a1;
        __int16 v52 = 1024;
        *(_DWORD *)double v53 = v34;
        *(_WORD *)&v53[4] = 2048;
        *(double *)&v53[6] = v35;
        _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: pid=%d did=%d factor=%f\n", buf, 0x22u);
      }
      long long v31 = (std::mutex *)qword_1EBD0F980;
      std::mutex::lock((std::mutex *)qword_1EBD0F980);
      uint64_t v36 = sub_1CFE14B9C(v34);
      if (v36)
      {
        *(float *)(v36 + 344) = v35;
        if (v35 <= 0.0)
        {
          float v35 = *(float *)(v36 + 328);
          *(float *)(v36 + 344) = v35;
        }
        sub_1CFE16870(v36, v35);
      }
      goto LABEL_63;
    case 16:
      int v37 = a3[1];
      float v38 = *((float *)a3 + 2);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 136315906;
        *(void *)&uint8_t buf[4] = "EDRServerSetBrightnessAnimationTimeStepFactor";
        __int16 v50 = 1024;
        int v51 = a1;
        __int16 v52 = 1024;
        *(_DWORD *)double v53 = v37;
        *(_WORD *)&v53[4] = 2048;
        *(double *)&v53[6] = v38;
        _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: pid=%d did=%d factor=%f\n", buf, 0x22u);
      }
      long long v31 = (std::mutex *)qword_1EBD0F980;
      std::mutex::lock((std::mutex *)qword_1EBD0F980);
      uint64_t v39 = sub_1CFE14B9C(v37);
      if (v39)
      {
        *(float *)(v39 + 348) = v38;
        if (v38 <= 0.0)
        {
          float v38 = *(float *)(v39 + 332);
          *(float *)(v39 + 348) = v38;
        }
        sub_1CFE16878(v38);
      }
      goto LABEL_63;
    case 17:
      int v40 = a3[1];
      float v41 = *((float *)a3 + 2);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 136315906;
        *(void *)&uint8_t buf[4] = "EDRServerSetTransitionAnimationTimeStepFactor";
        __int16 v50 = 1024;
        int v51 = a1;
        __int16 v52 = 1024;
        *(_DWORD *)double v53 = v40;
        *(_WORD *)&v53[4] = 2048;
        *(double *)&v53[6] = v41;
        _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: pid=%d did=%d factor=%f\n", buf, 0x22u);
      }
      long long v31 = (std::mutex *)qword_1EBD0F980;
      std::mutex::lock((std::mutex *)qword_1EBD0F980);
      uint64_t v42 = sub_1CFE14B9C(v40);
      if (v42)
      {
        *(float *)(v42 + 352) = v41;
        if (v41 <= 0.0)
        {
          float v41 = *(float *)(v42 + 336);
          *(float *)(v42 + 352) = v41;
        }
        sub_1CFE16884(v41);
      }
      goto LABEL_63;
    case 18:
      int v43 = a3[1];
      *a5 = 18;
      double v44 = (std::mutex *)qword_1EBD0F980;
      std::mutex::lock((std::mutex *)qword_1EBD0F980);
      uint64_t v45 = sub_1CFE14B9C(v43);
      if (v45)
      {
        float v46 = *(float *)(v45 + 324);
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 136315906;
          *(void *)&uint8_t buf[4] = "EDRServerGetDefaultMinScalingFactor";
          __int16 v50 = 1024;
          int v51 = a1;
          __int16 v52 = 1024;
          *(_DWORD *)double v53 = v43;
          *(_WORD *)&v53[4] = 2048;
          *(double *)&v53[6] = v46;
          _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: pid=%d did=%d factor=%f\n", buf, 0x22u);
        }
      }
      else
      {
        float v46 = 1.0;
      }
      std::mutex::unlock(v44);
      *(float *)a6 = v46;
      return;
    default:
      return;
  }
}

void sub_1CFE18178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  std::mutex::unlock(v14);
  _Unwind_Resume(a1);
}

void sub_1CFE18200(int a1, int token)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    if (state64) {
      float v2 = "On";
    }
    else {
      float v2 = "Off";
    }
    *(_DWORD *)int buf = 136315138;
    *(void *)&uint8_t buf[4] = v2;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - LowPowerMode => %s\n", buf, 0xCu);
  }
  uint64_t v3 = 400;
  uint64_t v4 = 16;
  do
  {
    *(void *)int buf = qword_1EBD0F980;
    buf[8] = 1;
    std::mutex::lock((std::mutex *)qword_1EBD0F980);
    int v5 = *(_DWORD *)(qword_1EBD0F978 + v3 - 80);
    if (v5 == -559038737)
    {
      sub_1CFE15304((uint64_t)buf);
    }
    else
    {
      *(unsigned char *)(qword_1EBD0F978 + v3) = state64 != 0;
      sub_1CFE15304((uint64_t)buf);
      sub_1CFE15588(v5, 1);
    }
    if (buf[8]) {
      std::mutex::unlock(*(std::mutex **)buf);
    }
    v3 += 584;
    --v4;
  }
  while (v4);
}

void sub_1CFE1836C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, char a12)
{
  if (a12) {
    std::mutex::unlock(a11);
  }
  _Unwind_Resume(exception_object);
}

NSObject *EDRServerStopService()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "EDRServerStopService";
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s\n", (uint8_t *)&v4, 0xCu);
  }
  uint64_t v0 = qword_1EBD0F978;
  uint64_t v1 = -9344;
  do
  {
    int v2 = *(_DWORD *)(v0 + v1 + 9664);
    if (v2 != -559038737)
    {
      sub_1CFE18480(v2);
      uint64_t v0 = qword_1EBD0F978;
    }
    v1 += 584;
  }
  while (v1);
  sub_1CFE20688(0);
  return sub_1CFE2057C();
}

void sub_1CFE18480(int a1)
{
  if (dword_1EBD0F918 == a1)
  {
    uint64_t v1 = sub_1CFE14B9C(a1);
    if (v1)
    {
      uint64_t v2 = v1;
      *(_DWORD *)(v1 + 444) = *(_DWORD *)(v1 + 324);
      uint64_t v3 = *(NSObject **)(v1 + 424);
      if (v3)
      {
        dispatch_source_cancel(v3);
        int v4 = *(void **)(v2 + 424);
        *(void *)(v2 + 424) = 0;
      }
      int v5 = *(NSObject **)(v2 + 432);
      if (v5)
      {
        dispatch_source_cancel(v5);
        uint64_t v6 = *(void **)(v2 + 432);
        *(void *)(v2 + 432) = 0;
      }
    }
  }
}

void EDRServerAddDisplay(int a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1 == -559038737)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      sub_1CFE23D58();
    }
  }
  else if (sub_1CFE14B9C(a1))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      sub_1CFE23E5C();
    }
  }
  else
  {
    uint64_t v2 = 0;
    for (uint64_t i = 320; ; i += 584)
    {
      int v4 = (std::mutex *)qword_1EBD0F980;
      unsigned int v13 = (std::mutex *)qword_1EBD0F980;
      char v14 = 1;
      std::mutex::lock((std::mutex *)qword_1EBD0F980);
      if (*(_DWORD *)(qword_1EBD0F978 + i) == -559038737) {
        break;
      }
      std::mutex::unlock(v4);
      if (++v2 == 16)
      {
        BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v5) {
          sub_1CFE23DD0(v5, v6, v7, v8, v9, v10, v11, v12);
        }
        return;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 136315650;
      int v16 = "EDRServerAddDisplay";
      __int16 v17 = 1024;
      int v18 = v2;
      __int16 v19 = 1024;
      int v20 = a1;
      _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: add context %d for display %d\n", buf, 0x18u);
    }
    *(_DWORD *)(qword_1EBD0F978 + i) = a1;
    sub_1CFE15304((uint64_t)&v13);
    sub_1CFE16D98(qword_1EBD0F978 + i - 320);
    if (v14) {
      std::mutex::unlock(v13);
    }
  }
}

void sub_1CFE186CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::mutex *a9, char a10)
{
  if (a10) {
    std::mutex::unlock(a9);
  }
  _Unwind_Resume(exception_object);
}

void EDRServerRemoveDisplay(int a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1 != -559038737)
  {
    uint64_t v2 = (std::mutex *)qword_1EBD0F980;
    std::mutex::lock((std::mutex *)qword_1EBD0F980);
    uint64_t v3 = 0;
    uint64_t v4 = 320;
    while (*(_DWORD *)(qword_1EBD0F978 + v4) != a1)
    {
      ++v3;
      v4 += 584;
      if (v3 == 16)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          sub_1CFE23FCC();
        }
        goto LABEL_10;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v5 = 136315650;
      uint64_t v6 = "EDRServerRemoveDisplay";
      __int16 v7 = 1024;
      int v8 = v3;
      __int16 v9 = 1024;
      int v10 = a1;
      _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: remove context %d for display %d\n", (uint8_t *)&v5, 0x18u);
    }
    *(_DWORD *)(qword_1EBD0F978 + v4) = -559038737;
LABEL_10:
    std::mutex::unlock(v2);
  }
}

void EDRServerAddMainDisplay(int a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v2 = 136315394;
    uint64_t v3 = "EDRServerAddMainDisplay";
    __int16 v4 = 1024;
    int v5 = a1;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: display = %d\n", (uint8_t *)&v2, 0x12u);
  }
  dword_1EBD0F918 = a1;
  if (!sub_1CFE14B9C(a1)) {
    EDRServerAddDisplay(a1);
  }
}

void EDRServerEnableForDisplay(int a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    __int16 v4 = "No";
    uint64_t v6 = "EDRServerEnableForDisplay";
    int v5 = 136315650;
    if (a2) {
      __int16 v4 = "Yes";
    }
    __int16 v7 = 1024;
    int v8 = a1;
    __int16 v9 = 2080;
    int v10 = v4;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: did=%d enable=%s\n", (uint8_t *)&v5, 0x1Cu);
  }
  sub_1CFE189F8(0, 0, a1, a2);
}

void sub_1CFE189F8(unsigned int a1, unsigned int a2, int a3, int a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v8 = "No";
    *(_DWORD *)int buf = 136316162;
    *(void *)&uint8_t buf[4] = "EDRServerEnable";
    if (a4) {
      int v8 = "Yes";
    }
    __int16 v21 = 1024;
    unsigned int v22 = a1;
    __int16 v23 = 1024;
    unsigned int v24 = a2;
    __int16 v25 = 1024;
    int v26 = a3;
    __int16 v27 = 2080;
    float v28 = v8;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: pid=%d cid=%d did=%d enable=%s\n", buf, 0x28u);
  }
  if (sub_1CFE173B0() <= 1.0)
  {
    *(void *)int buf = qword_1EBD0F980;
    buf[8] = 1;
    std::mutex::lock((std::mutex *)qword_1EBD0F980);
    uint64_t v9 = sub_1CFE14B9C(a3);
    if (!v9) {
      goto LABEL_27;
    }
    int v10 = (void *)v9;
    uint64_t v11 = a1;
    unint64_t v18 = a2 | ((unint64_t)a1 << 32);
    if (a4)
    {
      __int16 v19 = &v18;
      *((_DWORD *)sub_1CFE1FC10((uint64_t **)(v9 + 296), &v18, (uint64_t)&unk_1CFE265C4, &v19) + 10) = 0;
    }
    else if (a2 | a1)
    {
      uint64_t v12 = (uint64_t **)(v9 + 296);
      if (!a1 || a2)
      {
        sub_1CFE1C158(v9 + 296, &v18);
      }
      else
      {
        unsigned int v13 = *(uint64_t **)(v9 + 296);
        char v14 = (uint64_t *)(v9 + 304);
        if (v13 != (uint64_t *)(v9 + 304))
        {
          do
          {
            if (*((_DWORD *)v13 + 9) == v11)
            {
              int v15 = sub_1CFE1BD60(v12, v13);
              operator delete(v13);
            }
            else
            {
              int v16 = (uint64_t *)v13[1];
              if (v16)
              {
                do
                {
                  int v15 = v16;
                  int v16 = (uint64_t *)*v16;
                }
                while (v16);
              }
              else
              {
                do
                {
                  int v15 = (uint64_t *)v13[2];
                  BOOL v17 = *v15 == (void)v13;
                  unsigned int v13 = v15;
                }
                while (!v17);
              }
            }
            unsigned int v13 = v15;
          }
          while (v15 != v14);
        }
      }
    }
    else
    {
      sub_1CFE1B8FC(v9 + 296, *(void **)(v9 + 304));
      v10[38] = 0;
      v10[39] = 0;
      v10[37] = v10 + 38;
    }
    sub_1CFE18CCC();
    sub_1CFE15304((uint64_t)buf);
    sub_1CFE15588(a3, 1);
    if (buf[8]) {
LABEL_27:
    }
      std::mutex::unlock(*(std::mutex **)buf);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int buf = 136315138;
    *(void *)&uint8_t buf[4] = "EDRServerEnable";
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: non-EDR device\n", buf, 0xCu);
  }
}

void sub_1CFE18CA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::mutex *a13, char a14)
{
  if (a14) {
    std::mutex::unlock(a13);
  }
  _Unwind_Resume(exception_object);
}

void sub_1CFE18CCC()
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = qword_1EBD0F978;
  uint64_t v1 = 16;
  while (*(_DWORD *)(v0 + 320) != dword_1EBD0F918)
  {
    v0 += 584;
    if (!--v1) {
      return;
    }
  }
  memset(v44, 0, sizeof(v44));
  int v2 = *(float **)(v0 + 296);
  if ((float *)(v0 + 304) != v2)
  {
    unint64_t v3 = 0;
    do
    {
      if (v3 <= 0x3E)
      {
        int v4 = snprintf((char *)v44 + v3, 63 - v3, "(%d, %f)", *((void *)v2 + 4), v2[10]);
        if (v4) {
          v3 += v4;
        }
      }
      int v5 = (float *)*((void *)v2 + 1);
      if (v5)
      {
        do
        {
          uint64_t v6 = v5;
          int v5 = *(float **)v5;
        }
        while (v5);
      }
      else
      {
        do
        {
          uint64_t v6 = (float *)*((void *)v2 + 2);
          BOOL v7 = *(void *)v6 == (void)v2;
          int v2 = v6;
        }
        while (!v7);
      }
      int v2 = v6;
    }
    while ((float *)(v0 + 304) != v6);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v8 = sub_1CFE15AB4(v0);
    uint64_t v9 = "NO";
    if (v8) {
      uint64_t v9 = "YES";
    }
    double v10 = *(float *)(v0 + 340);
    double v11 = *(float *)(v0 + 324);
    double v12 = *(float *)(v0 + 364);
    double v13 = *(float *)(v0 + 356);
    double v14 = *(float *)(v0 + 360);
    double v15 = *(float *)(v0 + 556);
    uint64_t v16 = *(int *)(v0 + 448);
    if (v16 > 3) {
      BOOL v17 = "UnknownMitigationStage";
    }
    else {
      BOOL v17 = off_1E6875248[v16];
    }
    *(_DWORD *)int buf = 136317954;
    __int16 v21 = "UpdateAnalytics";
    __int16 v22 = 2080;
    __int16 v23 = &xmmword_1EBD0F989;
    __int16 v24 = 2080;
    __int16 v25 = &xmmword_1EBD0F9A9;
    __int16 v26 = 2080;
    __int16 v27 = v9;
    __int16 v28 = 2048;
    double v29 = v10;
    __int16 v30 = 2080;
    long long v31 = v44;
    __int16 v32 = 2048;
    double v33 = v11;
    __int16 v34 = 2048;
    double v35 = v12;
    __int16 v36 = 2048;
    double v37 = v13;
    __int16 v38 = 2048;
    double v39 = v14;
    __int16 v40 = 2048;
    double v41 = v15;
    __int16 v42 = 2080;
    int v43 = v17;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: Hardware=%s, Software=%s, IsEDREnabled=%s, MinScalingFactor=%f, ScalingFactorLimits=[%s], DefaultMinScalingFactor=%f, TargetBrightness=%f, MaxLuminance=%f, AmbientIlluminance=%f, BrightnessScaler=%f, MitigationState=%s\n", buf, 0x7Au);
  }
  __int16 v19 = [NSString stringWithCString:v44 encoding:1];
  id v18 = v19;
  AnalyticsSendEventLazy();
}

void sub_1CFE18FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

float EDRServerGetDisplayBrightnessForDisplay(int a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v2 = (std::mutex *)qword_1EBD0F980;
  std::mutex::lock((std::mutex *)qword_1EBD0F980);
  uint64_t v3 = sub_1CFE14B9C(a1);
  if (v3)
  {
    float v4 = sub_1CFE16890(v3) * *(float *)(v3 + 356);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v6 = 136315650;
      BOOL v7 = "EDRServerGetDisplayBrightnessForDisplay";
      __int16 v8 = 1024;
      int v9 = a1;
      __int16 v10 = 2048;
      double v11 = v4;
      _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: did=%d val=%f\n", (uint8_t *)&v6, 0x1Cu);
    }
  }
  else
  {
    float v4 = 0.0;
  }
  std::mutex::unlock(v2);
  return v4;
}

void sub_1CFE19104(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t EDRServerIsEnabledForDisplay(int a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v2 = (std::mutex *)qword_1EBD0F980;
  std::mutex::lock((std::mutex *)qword_1EBD0F980);
  uint64_t v3 = sub_1CFE14B9C(a1);
  if (v3)
  {
    uint64_t v4 = sub_1CFE15AB4(v3);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v5 = "No";
      __int16 v8 = "EDRServerIsEnabledForDisplay";
      int v7 = 136315650;
      if (v4) {
        int v5 = "Yes";
      }
      __int16 v9 = 1024;
      int v10 = a1;
      __int16 v11 = 2080;
      uint64_t v12 = v5;
      _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: did=%d enabled=%s\n", (uint8_t *)&v7, 0x1Cu);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  std::mutex::unlock(v2);
  return v4;
}

void sub_1CFE19230(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void EDRServerGetCurrentDisplayPropertiesForDisplay(int a1, float *a2, float *a3, float *a4, float *a5, float *a6)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = (std::mutex *)qword_1EBD0F980;
  std::mutex::lock((std::mutex *)qword_1EBD0F980);
  uint64_t v13 = sub_1CFE14B9C(a1);
  if (v13)
  {
    uint64_t v14 = v13;
    *a2 = sub_1CFE14204(v13) * *(float *)(v13 + 356);
    *(_DWORD *)a3 = v15;
    *a4 = *(float *)(v14 + 356);
    *a5 = *(float *)(v14 + 360);
    *a6 = *(float *)(v14 + 556);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v16 = sub_1CFE15AB4(v14);
      BOOL v17 = "disabled";
      if (v16) {
        BOOL v17 = "enabled";
      }
      double v18 = *a2;
      double v19 = *a3;
      double v20 = *a4;
      double v21 = *a5;
      double v22 = *a6;
      double v23 = *(float *)(v14 + 340);
      int v24 = 136317186;
      __int16 v25 = "EDRServerGetCurrentDisplayPropertiesForDisplay";
      __int16 v26 = 1024;
      int v27 = a1;
      __int16 v28 = 2080;
      double v29 = v17;
      __int16 v30 = 2048;
      double v31 = v18;
      __int16 v32 = 2048;
      double v33 = v19;
      __int16 v34 = 2048;
      double v35 = v20;
      __int16 v36 = 2048;
      double v37 = v21;
      __int16 v38 = 2048;
      double v39 = v22;
      __int16 v40 = 2048;
      double v41 = v23;
      _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: (display: %d, EDR: %s, backlight: %f, edrScaling: %f, maxLuminance: %f, ambientIlluminance: %f, brightnessScaler: %f, gMinScalingFactor: %f)\n", (uint8_t *)&v24, 0x58u);
    }
  }
  std::mutex::unlock(v12);
}

void sub_1CFE19408(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void EDRServerRegisterCallbackBlockOnQueue(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    int v6 = "EDRServerRegisterCallbackBlockOnQueue";
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s\n", (uint8_t *)&v5, 0xCu);
  }
  EDRRegisterCallbackBlockOnQueue(0, v3, v4);
}

void sub_1CFE194F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void EDRRegisterCallbackBlockOnQueue(unsigned int a1, void *a2, void *a3)
{
  unsigned int v4 = a1;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unsigned int v17 = a1;
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int buf = 136315394;
    double v19 = "EDRRegisterCallbackBlockOnQueue";
    __int16 v20 = 1024;
    *(_DWORD *)double v21 = v4;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d\n", buf, 0x12u);
  }
  uint64_t v7 = sub_1CFE1A734();
  std::mutex::lock((std::mutex *)v7);
  if (v6)
  {
    uint64_t v8 = *(void *)(v7 + 72);
    if (v8)
    {
      uint64_t v9 = v7 + 72;
      do
      {
        unsigned int v10 = *(_DWORD *)(v8 + 32);
        BOOL v11 = v10 >= v4;
        if (v10 >= v4) {
          uint64_t v12 = (uint64_t *)v8;
        }
        else {
          uint64_t v12 = (uint64_t *)(v8 + 8);
        }
        if (v11) {
          uint64_t v9 = v8;
        }
        uint64_t v8 = *v12;
      }
      while (*v12);
      if (v9 != v7 + 72 && *(_DWORD *)(v9 + 32) <= v4)
      {
        _Block_release(*(const void **)(v9 + 48));
        sub_1CFE200C0(v7 + 64, &v17);
        unsigned int v4 = v17;
      }
    }
    id v13 = v5;
    uint64_t v14 = _Block_copy(v6);
    *(_DWORD *)int buf = v17;
    HIDWORD(v19) = v4;
    *(void *)&v21[2] = _Block_copy(v14);
    id v15 = v13;
    id v22 = v15;
    sub_1CFE2016C((uint64_t **)(v7 + 64), (unsigned int *)buf, (uint64_t)buf);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1CFE1B064;
  v16[3] = &unk_1E6872EA8;
  v16[4] = v7;
  if (qword_1EBD0F9D8 != -1) {
    dispatch_once(&qword_1EBD0F9D8, v16);
  }
  std::mutex::unlock((std::mutex *)v7);
}

void sub_1CFE19744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  std::mutex::unlock(v20);

  _Unwind_Resume(a1);
}

void EDRServerRegisterCallbackBlock(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    unsigned int v4 = "EDRServerRegisterCallbackBlock";
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s\n", (uint8_t *)&v3, 0xCu);
  }
  int v2 = dispatch_get_global_queue(0, 0);
  EDRServerRegisterCallbackBlockOnQueue(v2, v1);
}

void sub_1CFE19870(_Unwind_Exception *a1)
{
  int v3 = v2;

  _Unwind_Resume(a1);
}

void EDRServerUnregisterCallbackBlock()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v0 = 136315138;
    id v1 = "EDRServerUnregisterCallbackBlock";
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s\n", (uint8_t *)&v0, 0xCu);
  }
  EDRUnregisterCallbackBlock(0);
}

void EDRUnregisterCallbackBlock(unsigned int a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unsigned int v8 = a1;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int buf = 136315394;
    unsigned int v10 = "EDRUnregisterCallbackBlock";
    __int16 v11 = 1024;
    unsigned int v12 = a1;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d\n", buf, 0x12u);
  }
  uint64_t v2 = sub_1CFE1A734();
  std::mutex::lock((std::mutex *)v2);
  uint64_t v3 = *(void *)(v2 + 72);
  if (v3)
  {
    uint64_t v4 = v2 + 72;
    do
    {
      unsigned int v5 = *(_DWORD *)(v3 + 32);
      BOOL v6 = v5 >= a1;
      if (v5 >= a1) {
        uint64_t v7 = (uint64_t *)v3;
      }
      else {
        uint64_t v7 = (uint64_t *)(v3 + 8);
      }
      if (v6) {
        uint64_t v4 = v3;
      }
      uint64_t v3 = *v7;
    }
    while (*v7);
    if (v4 != v2 + 72 && *(_DWORD *)(v4 + 32) <= a1)
    {
      _Block_release(*(const void **)(v4 + 48));
      sub_1CFE200C0(v2 + 64, &v8);
    }
  }
  std::mutex::unlock((std::mutex *)v2);
}

void sub_1CFE19A60(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t EDRCreateClientForDisplay(uint64_t a1)
{
  return sub_1CFE19A84(a1, 0x1388u);
}

uint64_t sub_1CFE19A84(uint64_t a1, mach_msg_timeout_t a2)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  memset(v12, 0, 24);
  int v5 = 16;
  int v6 = 0;
  sub_1CFE208B0(a2, 6, 0, 0, &v6, v12, &v5);
  uint64_t v3 = LODWORD(v12[0]);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int buf = 136315650;
    *(void *)&uint8_t buf[4] = "EDRCreateClientForDisplayWithTimeout";
    __int16 v8 = 1024;
    int v9 = v3;
    __int16 v10 = 1024;
    int v11 = a1;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d\n", buf, 0x18u);
  }
  if (!qword_1EBD0F9E0) {
    operator new();
  }
  *(void *)int buf = v3 | (a1 << 32);
  sub_1CFE20004((uint64_t **)qword_1EBD0F9E0, (unsigned int *)buf, (uint64_t *)buf);
  return v3;
}

void EDRCreateClientForDisplayWithTimeoutAndCallback(int a1, int a2, void *a3)
{
  id v5 = a3;
  int v6 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1CFE19C90;
  v8[3] = &unk_1E6872E40;
  int v10 = a1;
  int v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t sub_1CFE19C90(uint64_t a1)
{
  sub_1CFE19A84(*(unsigned int *)(a1 + 40), *(_DWORD *)(a1 + 44));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

void EDRCreateClientWithTimeoutAndCallback(int a1, void *a2)
{
}

uint64_t EDRReleaseClient(unsigned int a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = a1;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int buf = 136315394;
    id v5 = "EDRReleaseClient";
    __int16 v6 = 1024;
    unsigned int v7 = a1;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d\n", buf, 0x12u);
  }
  EDRUnregisterCallbackBlock(a1);
  return sub_1CFE20740(7, &v3, 4);
}

uint64_t EDREnable(unsigned int a1, int a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v4 = sub_1CFE14C30(a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id v5 = "No";
    int v8 = 136315906;
    id v9 = "EDREnable";
    if (a2) {
      id v5 = "Yes";
    }
    __int16 v10 = 1024;
    unsigned int v11 = a1;
    __int16 v12 = 1024;
    int v13 = v4;
    __int16 v14 = 2080;
    id v15 = v5;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d enable=%s\n", (uint8_t *)&v8, 0x22u);
  }
  if (a2) {
    uint64_t v6 = 8;
  }
  else {
    uint64_t v6 = 9;
  }
  int v8 = a1;
  LODWORD(v9) = v4;
  return sub_1CFE20740(v6, &v8, 8);
}

BOOL EDRIsEnabled(unsigned int a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v5 = 0;
  int v6 = sub_1CFE14C30(a1);
  sub_1CFE208B0(0x1388u, 10, &v6, 4, &v5, 0, 0);
  int v2 = v5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    unsigned int v3 = "No";
    int v8 = "EDRIsEnabled";
    *(_DWORD *)int buf = 136315906;
    if (v2 == 1) {
      unsigned int v3 = "Yes";
    }
    __int16 v9 = 1024;
    unsigned int v10 = a1;
    __int16 v11 = 1024;
    int v12 = v6;
    __int16 v13 = 2080;
    __int16 v14 = v3;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d enabled=%s\n", buf, 0x22u);
  }
  return v2 == 1;
}

uint64_t EDRRequestAccessibilityLimit(unsigned int a1, int a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v4 = sub_1CFE14C30(a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v5 = "No";
    int v8 = 136315906;
    __int16 v9 = "EDRRequestAccessibilityLimit";
    if (a2) {
      int v5 = "Yes";
    }
    __int16 v10 = 1024;
    unsigned int v11 = a1;
    __int16 v12 = 1024;
    int v13 = v4;
    __int16 v14 = 2080;
    uint64_t v15 = v5;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d enable=%s\n", (uint8_t *)&v8, 0x22u);
  }
  if (a2) {
    uint64_t v6 = 11;
  }
  else {
    uint64_t v6 = 12;
  }
  int v8 = a1;
  LODWORD(v9) = v4;
  return sub_1CFE20740(v6, &v8, 8);
}

BOOL EDRHasAccessibilityLimit(unsigned int a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v5 = 0;
  int v6 = sub_1CFE14C30(a1);
  sub_1CFE208B0(0x1388u, 13, &v6, 4, &v5, 0, 0);
  int v2 = v5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    unsigned int v3 = "No";
    int v8 = "EDRHasAccessibilityLimit";
    *(_DWORD *)int buf = 136315906;
    if (v2 == 4) {
      unsigned int v3 = "Yes";
    }
    __int16 v9 = 1024;
    unsigned int v10 = a1;
    __int16 v11 = 1024;
    int v12 = v6;
    __int16 v13 = 2080;
    __int16 v14 = v3;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d enable=%s\n", buf, 0x22u);
  }
  return v2 == 4;
}

uint64_t EDRRequestDisplayHeadroomLimit(unsigned int a1, float a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = sub_1CFE14C30(a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    unsigned int v7 = "EDRRequestDisplayHeadroomLimit";
    __int16 v8 = 1024;
    unsigned int v9 = a1;
    __int16 v10 = 1024;
    unsigned int v11 = v4;
    __int16 v12 = 2048;
    double v13 = a2;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d limit=%f\n", (uint8_t *)&v6, 0x22u);
  }
  int v6 = a1;
  unsigned int v7 = (const char *)__PAIR64__(LODWORD(a2), v4);
  return sub_1CFE20740(14, &v6, 12);
}

uint64_t EDRRequestRampingSpeedFactor(unsigned int a1, float a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = sub_1CFE14C30(a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    unsigned int v7 = "EDRRequestRampingSpeedFactor";
    __int16 v8 = 1024;
    unsigned int v9 = a1;
    __int16 v10 = 1024;
    unsigned int v11 = v4;
    __int16 v12 = 2048;
    double v13 = a2;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d factor=%f\n", (uint8_t *)&v6, 0x22u);
  }
  int v6 = a1;
  unsigned int v7 = (const char *)__PAIR64__(LODWORD(a2), v4);
  return sub_1CFE20740(15, &v6, 12);
}

uint64_t EDRRequestBrightnessAnimationTimeStepFactor(unsigned int a1, float a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = sub_1CFE14C30(a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    unsigned int v7 = "EDRRequestBrightnessAnimationTimeStepFactor";
    __int16 v8 = 1024;
    unsigned int v9 = a1;
    __int16 v10 = 1024;
    unsigned int v11 = v4;
    __int16 v12 = 2048;
    double v13 = a2;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d factor=%f\n", (uint8_t *)&v6, 0x22u);
  }
  int v6 = a1;
  unsigned int v7 = (const char *)__PAIR64__(LODWORD(a2), v4);
  return sub_1CFE20740(16, &v6, 12);
}

uint64_t EDRRequestTransitionAnimationTimeStepFactor(unsigned int a1, float a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = sub_1CFE14C30(a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    unsigned int v7 = "EDRRequestTransitionAnimationTimeStepFactor";
    __int16 v8 = 1024;
    unsigned int v9 = a1;
    __int16 v10 = 1024;
    unsigned int v11 = v4;
    __int16 v12 = 2048;
    double v13 = a2;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d factor=%f\n", (uint8_t *)&v6, 0x22u);
  }
  int v6 = a1;
  unsigned int v7 = (const char *)__PAIR64__(LODWORD(a2), v4);
  return sub_1CFE20740(17, &v6, 12);
}

float EDRGetDisplayBrightness(unsigned int a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = sub_1CFE14C30(a1);
  uint64_t v3 = sub_1CFE1A734();
  uint64_t v6 = *(void *)(v3 + 96);
  uint64_t v4 = v3 + 96;
  uint64_t v5 = v6;
  float v7 = 1.0;
  if (v6)
  {
    uint64_t v8 = v4;
    do
    {
      unsigned int v9 = *(_DWORD *)(v5 + 32);
      BOOL v10 = v9 >= v2;
      if (v9 >= v2) {
        unsigned int v11 = (uint64_t *)v5;
      }
      else {
        unsigned int v11 = (uint64_t *)(v5 + 8);
      }
      if (v10) {
        uint64_t v8 = v5;
      }
      uint64_t v5 = *v11;
    }
    while (*v11);
    float v7 = 1.0;
    if (v8 != v4 && v2 >= *(_DWORD *)(v8 + 32)) {
      float v7 = **(float **)(v8 + 40);
    }
  }
  if (v7 > 1.0 || v7 < 0.0) {
    float v13 = 1.0;
  }
  else {
    float v13 = v7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v15 = 136315906;
    uint64_t v16 = "EDRGetDisplayBrightness";
    __int16 v17 = 1024;
    unsigned int v18 = a1;
    __int16 v19 = 1024;
    unsigned int v20 = v2;
    __int16 v21 = 2048;
    double v22 = v13;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d val=%f\n", (uint8_t *)&v15, 0x22u);
  }
  return v13;
}

uint64_t sub_1CFE1A734()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBD0F940, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EBD0F940))
  {
    operator new();
  }
  return qword_1EBD0F9E8;
}

void sub_1CFE1A7DC(_Unwind_Exception *a1)
{
}

float EDRGetDisplayBacklightBrightness(unsigned int a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = sub_1CFE14C30(a1);
  uint64_t v3 = sub_1CFE1A734();
  uint64_t v6 = *(void *)(v3 + 96);
  uint64_t v4 = v3 + 96;
  uint64_t v5 = v6;
  float v7 = 1.0;
  if (v6)
  {
    uint64_t v8 = v4;
    do
    {
      unsigned int v9 = *(_DWORD *)(v5 + 32);
      BOOL v10 = v9 >= v2;
      if (v9 >= v2) {
        unsigned int v11 = (uint64_t *)v5;
      }
      else {
        unsigned int v11 = (uint64_t *)(v5 + 8);
      }
      if (v10) {
        uint64_t v8 = v5;
      }
      uint64_t v5 = *v11;
    }
    while (*v11);
    float v7 = 1.0;
    if (v8 != v4 && v2 >= *(_DWORD *)(v8 + 32)) {
      float v7 = *(float *)(*(void *)(v8 + 40) + 4);
    }
  }
  if (v7 > 1.0 || v7 < 0.0) {
    float v13 = 1.0;
  }
  else {
    float v13 = v7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v15 = 136315906;
    uint64_t v16 = "EDRGetDisplayBacklightBrightness";
    __int16 v17 = 1024;
    unsigned int v18 = a1;
    __int16 v19 = 1024;
    unsigned int v20 = v2;
    __int16 v21 = 2048;
    double v22 = v13;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d val=%f\n", (uint8_t *)&v15, 0x22u);
  }
  return v13;
}

float EDRGetDisplayScalingFactor(unsigned int a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = sub_1CFE14C30(a1);
  uint64_t v3 = sub_1CFE1A734();
  uint64_t v6 = *(void *)(v3 + 96);
  uint64_t v4 = v3 + 96;
  uint64_t v5 = v6;
  float v7 = 1.0;
  if (v6)
  {
    uint64_t v8 = v4;
    do
    {
      unsigned int v9 = *(_DWORD *)(v5 + 32);
      BOOL v10 = v9 >= v2;
      if (v9 >= v2) {
        unsigned int v11 = (uint64_t *)v5;
      }
      else {
        unsigned int v11 = (uint64_t *)(v5 + 8);
      }
      if (v10) {
        uint64_t v8 = v5;
      }
      uint64_t v5 = *v11;
    }
    while (*v11);
    if (v8 != v4 && v2 >= *(_DWORD *)(v8 + 32)) {
      float v7 = *(float *)(*(void *)(v8 + 40) + 8);
    }
  }
  if (v7 >= 0.000001) {
    float v12 = v7;
  }
  else {
    float v12 = 0.000001;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v14 = 136315906;
    int v15 = "EDRGetDisplayScalingFactor";
    __int16 v16 = 1024;
    unsigned int v17 = a1;
    __int16 v18 = 1024;
    unsigned int v19 = v2;
    __int16 v20 = 2048;
    double v21 = v12;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d val=%f\n", (uint8_t *)&v14, 0x22u);
  }
  return v12;
}

float EDRGetDisplayHeadroom(unsigned int a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = sub_1CFE14C30(a1);
  uint64_t v3 = sub_1CFE1A734();
  uint64_t v6 = *(void *)(v3 + 96);
  uint64_t v4 = v3 + 96;
  uint64_t v5 = v6;
  float v7 = 1.0;
  if (v6)
  {
    uint64_t v8 = v4;
    do
    {
      unsigned int v9 = *(_DWORD *)(v5 + 32);
      BOOL v10 = v9 >= v2;
      if (v9 >= v2) {
        unsigned int v11 = (uint64_t *)v5;
      }
      else {
        unsigned int v11 = (uint64_t *)(v5 + 8);
      }
      if (v10) {
        uint64_t v8 = v5;
      }
      uint64_t v5 = *v11;
    }
    while (*v11);
    float v7 = 1.0;
    if (v8 != v4 && v2 >= *(_DWORD *)(v8 + 32)) {
      float v7 = *(float *)(*(void *)(v8 + 40) + 8);
    }
  }
  if (v7 >= 0.000001) {
    float v12 = 1.0 / v7;
  }
  else {
    float v12 = 1000000.0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v14 = 136315906;
    int v15 = "EDRGetDisplayHeadroom";
    __int16 v16 = 1024;
    unsigned int v17 = a1;
    __int16 v18 = 1024;
    unsigned int v19 = v2;
    __int16 v20 = 2048;
    double v21 = v12;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d val=%f\n", (uint8_t *)&v14, 0x22u);
  }
  return v12;
}

float EDRGetDisplayMaxLuminance(unsigned int a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = sub_1CFE14C30(a1);
  uint64_t v3 = sub_1CFE1A734();
  uint64_t v6 = *(void *)(v3 + 96);
  uint64_t v4 = v3 + 96;
  uint64_t v5 = v6;
  if (!v6) {
    goto LABEL_12;
  }
  uint64_t v7 = v4;
  do
  {
    unsigned int v8 = *(_DWORD *)(v5 + 32);
    BOOL v9 = v8 >= v2;
    if (v8 >= v2) {
      BOOL v10 = (uint64_t *)v5;
    }
    else {
      BOOL v10 = (uint64_t *)(v5 + 8);
    }
    if (v9) {
      uint64_t v7 = v5;
    }
    uint64_t v5 = *v10;
  }
  while (*v10);
  if (v7 != v4 && v2 >= *(_DWORD *)(v7 + 32)) {
    float v11 = *(float *)(*(void *)(v7 + 40) + 12);
  }
  else {
LABEL_12:
  }
    float v11 = 500.0;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v13 = 136315906;
    int v14 = "EDRGetDisplayMaxLuminance";
    __int16 v15 = 1024;
    unsigned int v16 = a1;
    __int16 v17 = 1024;
    unsigned int v18 = v2;
    __int16 v19 = 2048;
    double v20 = v11;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d val=%f\n", (uint8_t *)&v13, 0x22u);
  }
  return v11;
}

float EDRGetAmbientIlluminance(unsigned int a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = sub_1CFE14C30(a1);
  uint64_t v3 = sub_1CFE1A734();
  uint64_t v6 = *(void *)(v3 + 96);
  uint64_t v4 = v3 + 96;
  uint64_t v5 = v6;
  if (!v6) {
    goto LABEL_12;
  }
  uint64_t v7 = v4;
  do
  {
    unsigned int v8 = *(_DWORD *)(v5 + 32);
    BOOL v9 = v8 >= v2;
    if (v8 >= v2) {
      BOOL v10 = (uint64_t *)v5;
    }
    else {
      BOOL v10 = (uint64_t *)(v5 + 8);
    }
    if (v9) {
      uint64_t v7 = v5;
    }
    uint64_t v5 = *v10;
  }
  while (*v10);
  if (v7 != v4 && v2 >= *(_DWORD *)(v7 + 32)) {
    float v11 = *(float *)(*(void *)(v7 + 40) + 16);
  }
  else {
LABEL_12:
  }
    float v11 = 1000.0;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v13 = 136315906;
    int v14 = "EDRGetAmbientIlluminance";
    __int16 v15 = 1024;
    unsigned int v16 = a1;
    __int16 v17 = 1024;
    unsigned int v18 = v2;
    __int16 v19 = 2048;
    double v20 = v11;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d val=%f\n", (uint8_t *)&v13, 0x22u);
  }
  return v11;
}

float EDRGetBrightnessScaler(unsigned int a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = sub_1CFE14C30(a1);
  uint64_t v3 = sub_1CFE1A734();
  uint64_t v6 = *(void *)(v3 + 96);
  uint64_t v4 = v3 + 96;
  uint64_t v5 = v6;
  float v7 = 1.0;
  if (v6)
  {
    uint64_t v8 = v4;
    do
    {
      unsigned int v9 = *(_DWORD *)(v5 + 32);
      BOOL v10 = v9 >= v2;
      if (v9 >= v2) {
        float v11 = (uint64_t *)v5;
      }
      else {
        float v11 = (uint64_t *)(v5 + 8);
      }
      if (v10) {
        uint64_t v8 = v5;
      }
      uint64_t v5 = *v11;
    }
    while (*v11);
    if (v8 != v4 && v2 >= *(_DWORD *)(v8 + 32)) {
      float v7 = *(float *)(*(void *)(v8 + 40) + 20);
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v13 = 136315906;
    int v14 = "EDRGetBrightnessScaler";
    __int16 v15 = 1024;
    unsigned int v16 = a1;
    __int16 v17 = 1024;
    unsigned int v18 = v2;
    __int16 v19 = 2048;
    double v20 = v7;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d val=%f\n", (uint8_t *)&v13, 0x22u);
  }
  return v7;
}

float EDRGetDefaultMinScalingFactor(unsigned int a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v2 = sub_1CFE14C30(a1);
  int v6 = 0;
  float v7 = 1.0;
  int v5 = 0;
  v4[0] = a1;
  v4[1] = v2;
  sub_1CFE208B0(0x1388u, 18, v4, 8, &v6, &v7, &v5);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int buf = 136315906;
    unsigned int v9 = "EDRGetDefaultMinScalingFactor";
    __int16 v10 = 1024;
    unsigned int v11 = a1;
    __int16 v12 = 1024;
    int v13 = v2;
    __int16 v14 = 2048;
    double v15 = v7;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d val=%f\n", buf, 0x22u);
  }
  return v7;
}

uint64_t sub_1CFE1B064(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1CFE143FC;
  v2[3] = &unk_1E6872E88;
  v2[4] = *(void *)(a1 + 32);
  return sub_1CFE205B0(0x1388u, 0, v2, 0);
}

void EDRRegisterCallbackBlock(unsigned int a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    int v6 = "EDRRegisterCallbackBlock";
    __int16 v7 = 1024;
    unsigned int v8 = a1;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d\n", (uint8_t *)&v5, 0x12u);
  }
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  EDRRegisterCallbackBlockOnQueue(a1, v4, v3);
}

void sub_1CFE1B1D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1CFE1B1EC()
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  memset(__s, 0, sizeof(__s));
  size_t v20 = 128;
  if (sysctlbyname("hw.model", __s, &v20, 0, 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      sub_1CFE240C8();
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int buf = 136315394;
    *(void *)&uint8_t buf[4] = "getModel_block_invoke";
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = __s;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: model = %s\n", buf, 0x16u);
  }
  int v0 = &xmmword_1E6872EE8;
  uint64_t v1 = 8840;
  do
  {
    size_t v2 = strlen((const char *)__s);
    uint64_t result = sub_1CFE1B840((size_t *)v0, (char *)__s, v2);
    if (result)
    {
      long long v9 = v0[7];
      xmmword_1EBD0F8F0 = v0[6];
      xmmword_1EBD0F900 = v9;
      dword_1EBD0F910 = *((_DWORD *)v0 + 32);
      long long v10 = v0[3];
      xmmword_1EBD0F8B0 = v0[2];
      unk_1EBD0F8C0 = v10;
      long long v11 = v0[5];
      unk_1EBD0F8D0 = v0[4];
      *(_OWORD *)&qword_1EBD0F8E0 = v11;
      long long v13 = *v0;
      long long v12 = v0[1];
LABEL_45:
      xmmword_1EBD0F890 = v13;
      unk_1EBD0F8A0 = v12;
      return result;
    }
    int v0 = (long long *)((char *)v0 + 136);
    v1 -= 136;
  }
  while (v1);
  CFStringRef v4 = (const __CFString *)MGCopyAnswer();
  uint64_t result = MGCopyAnswer();
  if (v4)
  {
    uint64_t v5 = result;
    if (result)
    {
      *(void *)buffer = 0;
      uint64_t v27 = 0;
      CFStringGetCString(v4, buffer, 16, 0x8000100u);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        BOOL v6 = v5 == *MEMORY[0x1E4F1CFD0];
        *(_DWORD *)int buf = 136315650;
        *(void *)&uint8_t buf[4] = "getModel_block_invoke";
        if (v6) {
          __int16 v7 = "YES";
        }
        else {
          __int16 v7 = "NO";
        }
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = buffer;
        *(_WORD *)&buf[22] = 2080;
        *(void *)&unsigned char buf[24] = v7;
        _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: platform = %s, oled = %s\n", buf, 0x20u);
      }
      uint64_t result = CFStringCompare(v4, @"t8011", 0);
      if (result == -1)
      {
        uint64_t v14 = 0;
        memset(&buf[8], 0, 64);
        *(_DWORD *)&buf[72] = 1065353216;
        long long v22 = 0uLL;
        int v25 = 1077936128;
        long long v23 = xmmword_1CFE25A2C;
        long long v24 = unk_1CFE25A3C;
        do
        {
          buf[v14 + 8] = byte_1CFE265A8[v14 & 3] ^ aGeneric1x[v14];
          ++v14;
        }
        while (v14 != 10);
      }
      else
      {
        uint64_t result = CFStringCompare(v4, @"t8011", 0);
        if (result == 1 && v5 == *MEMORY[0x1E4F1CFC8])
        {
          uint64_t v8 = 0;
          memset(&buf[8], 0, 64);
          *(_DWORD *)&buf[72] = 1056964608;
          long long v22 = 0uLL;
          int v25 = 1077936128;
          long long v23 = xmmword_1CFE25A2C;
          long long v24 = unk_1CFE25A3C;
          do
          {
            buf[v8 + 8] = byte_1CFE265A8[v8 & 3] ^ aGeneric2x[v8];
            ++v8;
          }
          while (v8 != 10);
        }
        else
        {
          uint64_t result = CFStringCompare(v4, @"t8011", 0);
          uint64_t v15 = *MEMORY[0x1E4F1CFD0];
          if (result || v5 != v15)
          {
            uint64_t result = CFStringCompare(v4, @"t8020", 0);
            if (result || v5 != v15)
            {
              uint64_t result = CFStringCompare(v4, @"t8030", 0);
              if (result || v5 != v15)
              {
                if (v5 != v15) {
                  return result;
                }
                uint64_t v19 = 0;
                memset(&buf[8], 0, 64);
                *(_DWORD *)&buf[72] = 1040187392;
                *(void *)&long long v22 = &unk_1CFE25624;
                *((void *)&v22 + 1) = 86;
                int v25 = 1077936128;
                long long v23 = xmmword_1CFE25A2C;
                long long v24 = unk_1CFE25A3C;
                do
                {
                  buf[v19 + 8] = byte_1CFE265A8[v19 & 3] ^ aGeneric8x[v19];
                  ++v19;
                }
                while (v19 != 10);
              }
              else
              {
                uint64_t v18 = 0;
                memset(&buf[8], 0, 64);
                *(_DWORD *)&buf[72] = 1040187392;
                *(void *)&long long v22 = &unk_1CFE2521C;
                *((void *)&v22 + 1) = 86;
                int v25 = 1077936128;
                long long v23 = xmmword_1CFE25A2C;
                long long v24 = unk_1CFE25A3C;
                do
                {
                  buf[v18 + 8] = byte_1CFE265A8[v18 & 3] ^ aGeneric8x[v18];
                  ++v18;
                }
                while (v18 != 10);
              }
            }
            else
            {
              uint64_t v17 = 0;
              memset(&buf[8], 0, 64);
              *(_DWORD *)&buf[72] = 1048576000;
              *(void *)&long long v22 = &unk_1CFE24EE0;
              *((void *)&v22 + 1) = 69;
              int v25 = 1077936128;
              long long v23 = xmmword_1CFE25A2C;
              long long v24 = unk_1CFE25A3C;
              do
              {
                buf[v17 + 8] = byte_1CFE265A8[v17 & 3] ^ aGeneric4x[v17];
                ++v17;
              }
              while (v17 != 10);
            }
          }
          else
          {
            uint64_t v16 = 0;
            memset(&buf[8], 0, 64);
            *(_DWORD *)&buf[72] = 1048576000;
            *(void *)&long long v22 = &unk_1CFE24EE0;
            *((void *)&v22 + 1) = 69;
            int v25 = 1077936128;
            long long v23 = xmmword_1CFE25A2C;
            long long v24 = unk_1CFE25A3C;
            do
            {
              buf[v16 + 8] = byte_1CFE265A8[v16 & 3] ^ aGeneric4x[v16];
              ++v16;
            }
            while (v16 != 10);
          }
        }
      }
      *(void *)int buf = 9;
      xmmword_1EBD0F8F0 = v23;
      xmmword_1EBD0F900 = v24;
      dword_1EBD0F910 = v25;
      xmmword_1EBD0F8B0 = *(_OWORD *)&buf[32];
      unk_1EBD0F8C0 = *(_OWORD *)&buf[48];
      unk_1EBD0F8D0 = *(_OWORD *)&buf[64];
      *(_OWORD *)&qword_1EBD0F8E0 = v22;
      long long v13 = *(_OWORD *)buf;
      long long v12 = *(_OWORD *)&buf[16];
      goto LABEL_45;
    }
  }
  return result;
}

BOOL sub_1CFE1B840(size_t *a1, char *__s1, size_t a3)
{
  uint64_t v3 = 0;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  __s2[64] = 0;
  do
  {
    char v4 = byte_1CFE265A8[v3 & 3] ^ *((unsigned char *)a1 + v3 + 8);
    __s2[v3] = v4;
    if (!v4) {
      break;
    }
  }
  while (v3++ != 63);
  return *a1 <= a3 && !strncmp(__s1, __s2, *a1);
}

void sub_1CFE1B8FC(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_1CFE1B8FC(a1, *a2);
    sub_1CFE1B8FC(a1, a2[1]);
    operator delete(a2);
  }
}

void sub_1CFE1B950(unsigned int a1, unsigned int a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int buf = 136315650;
    *(void *)&uint8_t buf[4] = "EDRServerReleaseClient";
    __int16 v16 = 1024;
    unsigned int v17 = a1;
    __int16 v18 = 1024;
    unsigned int v19 = a2;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: pid=%d cid=%d\n", buf, 0x18u);
  }
  uint64_t v4 = 0;
  int v13 = a2 | a1;
  if (a1) {
    BOOL v5 = a2 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  int v6 = v5;
  int v12 = v6;
  unint64_t v14 = a2 | ((unint64_t)a1 << 32);
  do
  {
    *(void *)int buf = qword_1EBD0F980;
    buf[8] = 1;
    std::mutex::lock((std::mutex *)qword_1EBD0F980);
    int v7 = *(_DWORD *)(qword_1EBD0F978 + 584 * v4 + 320);
    if (v7 == -559038737)
    {
      sub_1CFE15304((uint64_t)buf);
    }
    else
    {
      uint64_t v8 = qword_1EBD0F978 + 584 * v4 + 296;
      if (v13)
      {
        if (v12)
        {
          long long v9 = *(uint64_t **)v8;
          if (*(void *)(qword_1EBD0F978 + 584 * v4 + 296) != qword_1EBD0F978 + 584 * v4 + 304)
          {
            do
            {
              if (*((_DWORD *)v9 + 9) == (unint64_t)a1)
              {
                long long v10 = sub_1CFE1BD60((uint64_t **)v8, v9);
                operator delete(v9);
              }
              else
              {
                long long v11 = (uint64_t *)v9[1];
                if (v11)
                {
                  do
                  {
                    long long v10 = v11;
                    long long v11 = (uint64_t *)*v11;
                  }
                  while (v11);
                }
                else
                {
                  do
                  {
                    long long v10 = (uint64_t *)v9[2];
                    BOOL v5 = *v10 == (void)v9;
                    long long v9 = v10;
                  }
                  while (!v5);
                }
              }
              long long v9 = v10;
            }
            while (v10 != (uint64_t *)(v8 + 8));
          }
        }
        else
        {
          sub_1CFE1C158(v8, &v14);
        }
      }
      else
      {
        sub_1CFE1B8FC(qword_1EBD0F978 + 584 * v4 + 296, *(void **)(qword_1EBD0F978 + 584 * v4 + 304));
        *(void *)uint64_t v8 = v8 + 8;
        *(void *)(v8 + 16) = 0;
        *(void *)(v8 + 8) = 0;
      }
      sub_1CFE15304((uint64_t)buf);
      sub_1CFE15588(v7, 1);
    }
    if (buf[8]) {
      std::mutex::unlock(*(std::mutex **)buf);
    }
    ++v4;
  }
  while (v4 != 16);
}

void sub_1CFE1BB8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, char a12)
{
  if (a12) {
    std::mutex::unlock(a11);
  }
  _Unwind_Resume(exception_object);
}

void sub_1CFE1BBB4(int a1, int a2, int a3, int a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v12 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = "No";
    *(_DWORD *)int buf = 136316162;
    *(void *)&uint8_t buf[4] = "EDRServerEnableAccessibilityLimit";
    int v15 = a1;
    __int16 v14 = 1024;
    if (a4) {
      uint64_t v8 = "Yes";
    }
    __int16 v16 = 1024;
    int v17 = a2;
    __int16 v18 = 1024;
    int v19 = a3;
    __int16 v20 = 2080;
    uint64_t v21 = v8;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: pid=%d cid=%d did=%d enable=%s\n", buf, 0x28u);
  }
  *(void *)int buf = qword_1EBD0F980;
  buf[8] = 1;
  std::mutex::lock((std::mutex *)qword_1EBD0F980);
  uint64_t v9 = sub_1CFE14B9C(a3);
  if (!v9
    || (uint64_t v10 = v9, *(unsigned __int8 *)(v9 + 368) == a4)
    || ((*(unsigned char *)(v9 + 368) = a4,
         sub_1CFE18CCC(),
         sub_1CFE15304((uint64_t)buf),
         sub_1CFE15588(a3, 0),
         *(unsigned char *)(v10 + 368))
      ? (uint64_t v11 = 4)
      : (uint64_t v11 = 5),
        sub_1CFE14CD4(v11, &v12, 4),
        buf[8]))
  {
    std::mutex::unlock(*(std::mutex **)buf);
  }
}

void sub_1CFE1BD38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, char a12)
{
  if (a12) {
    std::mutex::unlock(a11);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_1CFE1BD60(uint64_t **a1, uint64_t *a2)
{
  size_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      uint64_t v3 = v2;
      size_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = a2;
    do
    {
      uint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  int v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  sub_1CFE1BDD4(v6, a2);
  return v3;
}

uint64_t *sub_1CFE1BDD4(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      uint64_t v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  int v6 = (uint64_t **)v3[2];
  int v7 = *v6;
  if (*v6 == v3)
  {
    *int v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      int v7 = 0;
      uint64_t result = (uint64_t *)v2;
    }
    else
    {
      int v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    *uint64_t v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      int v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      uint64_t *v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        uint64_t result = v7;
      }
      int v7 = *(uint64_t **)(*v7 + 8);
    }
    int v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      __int16 v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *int v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        __int16 v16 = v7;
      }
      else
      {
        int v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      long long v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      *long long v24 = v23;
      goto LABEL_72;
    }
    __int16 v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    int v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      int v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    int v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      uint64_t result = v7;
    }
    int v7 = *(uint64_t **)v12;
  }
  int v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  __int16 v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    int v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    __int16 v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    uint64_t *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    int v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  long long v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

uint64_t sub_1CFE1C158(uint64_t a1, unint64_t *a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (!v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  do
  {
    unint64_t v5 = v2[4];
    BOOL v6 = v5 >= v3;
    if (v5 >= v3) {
      int v7 = v2;
    }
    else {
      int v7 = v2 + 1;
    }
    if (v6) {
      uint64_t v4 = v2;
    }
    uint64_t v2 = (void *)*v7;
  }
  while (*v7);
  if (v4 == (uint64_t *)(a1 + 8) || v3 < v4[4]) {
    return 0;
  }
  sub_1CFE1BD60((uint64_t **)a1, v4);
  operator delete(v4);
  return 1;
}

uint64_t **sub_1CFE1C1D4(uint64_t **a1, unint64_t *a2, uint64_t a3)
{
  BOOL v6 = a1 + 1;
  unint64_t v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        int v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        unint64_t v5 = *v8;
        BOOL v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      unint64_t v5 = v8[1];
      if (!v5)
      {
        BOOL v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    int v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = operator new(0x30uLL);
    v10[4] = *(void *)a3;
    *((_DWORD *)v10 + 10) = *(_DWORD *)(a3 + 8);
    sub_1CFE1C298(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t *sub_1CFE1C298(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  unint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = sub_1CFE1C2F0(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_1CFE1C2F0(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      unint64_t v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), unint64_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            unint64_t v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              unint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *unint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            unint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *unint64_t v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), unint64_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            unint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          unint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *uint64_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *unint64_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

char *sub_1CFE1C488(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a2 + 16) != 3) {
    return 0;
  }
  sub_1CFE1C64C();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    uint64_t v13 = "EDRServerDumpStateToSysDiagnose";
    __int16 v14 = 2048;
    int v15 = byte_1EBD0F9F4;
    __int16 v16 = 1024;
    int v17 = strlen(byte_1EBD0F9F4);
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: data => %p size = %d\n", (uint8_t *)&v12, 0x1Cu);
  }
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef v3 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], byte_1EBD0F9F4, 0x8000100u);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  CFDataRef Data = CFPropertyListCreateData(v2, v3, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (!Data)
  {
    unint64_t v9 = 0;
    goto LABEL_10;
  }
  CFDataRef v6 = Data;
  size_t Length = CFDataGetLength(Data);
  int v8 = (char *)malloc_type_calloc(1uLL, Length + 200, 0xA713A156uLL);
  unint64_t v9 = v8;
  if (v8)
  {
    *(_DWORD *)int v8 = 1;
    *((_DWORD *)v8 + 1) = Length;
    strcpy(v8 + 136, "libEDR Server State");
    BytePtr = CFDataGetBytePtr(v6);
    memcpy(v9 + 200, BytePtr, Length);
    CFRelease(v4);
    uint64_t v4 = v6;
LABEL_10:
    CFRelease(v4);
  }
  return v9;
}

void sub_1CFE1C64C()
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  bzero(byte_1EBD0F9F4, 0x2000uLL);
  time_t v113 = time(0);
  int v0 = localtime(&v113);
  uint64_t v1 = asctime(v0);
  unsigned int v2 = snprintf(byte_1EBD0F9F4, 0x1FFFuLL, "TimeStamp: %s", v1);
  uint64_t v3 = v2 & ~((int)v2 >> 31);
  if (v3 > 0x1FFE) {
    goto LABEL_7;
  }
  size_t v4 = 0x1FFFLL - v3;
  int v5 = snprintf(&byte_1EBD0F9F4[v3], v4, "Hardware: %s\n", (const char *)&xmmword_1EBD0F989);
  if (v5 < 1)
  {
    v2 &= ~((int)v2 >> 31);
  }
  else
  {
    unsigned int v2 = v5 + v3;
    if ((v5 + v3) > 0x1FFE) {
      goto LABEL_7;
    }
    size_t v4 = 0x1FFFLL - v2;
    uint64_t v3 = (v5 + v3);
  }
  int v6 = snprintf(&byte_1EBD0F9F4[v3], v4, "Software: %s\n", (const char *)&xmmword_1EBD0F9A9);
  v2 += v6 & ~(v6 >> 31);
LABEL_7:
  CFStringRef v7 = (const __CFString *)MGCopyAnswer();
  if (v7 && CFStringGetCString(v7, buffer, 32, 0x8000100u) && v2 <= 0x1FFE)
  {
    int v8 = snprintf(&byte_1EBD0F9F4[v2], 0x1FFFLL - v2, "Platform: %s\n", buffer);
    v2 += v8 & ~(v8 >> 31);
  }
  uint64_t v9 = MGCopyAnswer();
  if (v9 && v2 <= 0x1FFE)
  {
    uint64_t v10 = "NO";
    if (v9 == *MEMORY[0x1E4F1CFD0]) {
      uint64_t v10 = "YES";
    }
    int v11 = snprintf(&byte_1EBD0F9F4[v2], 0x1FFFLL - v2, "OLEDDisplay: %s\n", v10);
    v2 += v11 & ~(v11 >> 31);
  }
  int v12 = snprintf(&byte_1EBD0F9F4[v2], 0x1FFFLL - (int)v2, "MainDisplay: %d\n", dword_1EBD0F918);
  v112 = (std::mutex *)qword_1EBD0F980;
  std::mutex::lock((std::mutex *)qword_1EBD0F980);
  uint64_t v13 = 0;
  LODWORD(v14) = v12 + v2;
  do
  {
    uint64_t v15 = qword_1EBD0F978;
    uint64_t v16 = qword_1EBD0F978 + 584 * v13;
    if (*(_DWORD *)(v16 + 320) == -559038737) {
      goto LABEL_229;
    }
    if (v14 <= 0x1FFE)
    {
      size_t v17 = 0x1FFFLL - v14;
      int v18 = snprintf(&byte_1EBD0F9F4[v14], v17, "Display: %d\n", *(_DWORD *)(v16 + 320));
      if (v18 <= 0)
      {
        uint64_t v19 = v14;
      }
      else
      {
        uint64_t v14 = (v18 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_47;
        }
        size_t v17 = 0x1FFFLL - v14;
        uint64_t v19 = v14;
      }
      int v20 = snprintf(&byte_1EBD0F9F4[v19], v17, "    gEDRDisplay:\n");
      if (v20 < 1)
      {
        LODWORD(v21) = v14;
      }
      else
      {
        LODWORD(v21) = v20 + v14;
        LODWORD(v14) = v21;
        if (v21 > 0x1FFE) {
          goto LABEL_47;
        }
      }
      int v22 = sub_1CFE15AB4(v16);
      size_t v23 = 0x1FFFLL - v21;
      long long v24 = "NO";
      if (v22) {
        long long v24 = "YES";
      }
      int v25 = snprintf(&byte_1EBD0F9F4[v21], 0x1FFFLL - v21, "        IsEDREnabled = %s\n", v24);
      if (v25 < 1)
      {
        uint64_t v26 = v21;
      }
      else
      {
        uint64_t v21 = (v25 + v21);
        if (v21 > 0x1FFE) {
          goto LABEL_44;
        }
        size_t v23 = 0x1FFFLL - v21;
        uint64_t v26 = v21;
      }
      int v27 = snprintf(&byte_1EBD0F9F4[v26], v23, "        CurrentBrightness:\n");
      if (v27 < 1 || (LODWORD(v21) = v27 + v21, LODWORD(v14) = v21, v21 <= 0x1FFE))
      {
        float v28 = sub_1CFE14204(v16);
        int v29 = snprintf(&byte_1EBD0F9F4[v21], 0x1FFFLL - v21, "            backlightBrightness = %f\n", v28);
        if (v29 <= 0 || (LODWORD(v21) = v29 + v21, LODWORD(v14) = v21, v21 <= 0x1FFE))
        {
          sub_1CFE14204(v16);
          int v31 = snprintf(&byte_1EBD0F9F4[v21], 0x1FFFLL - v21, "            edrScalingValue = %f\n", v30);
          if (v31 <= 0 || (LODWORD(v21) = v31 + v21, LODWORD(v14) = v21, v21 <= 0x1FFE))
          {
            float v32 = sub_1CFE16890(v16);
            int v33 = snprintf(&byte_1EBD0F9F4[v21], 0x1FFFLL - v21, "        TargetBrightness = %f\n", v32);
            if (v33 < 1 || (LODWORD(v21) = v33 + v21, LODWORD(v14) = v21, v21 <= 0x1FFE))
            {
              double v34 = sub_1CFE168F0(v16);
              size_t v35 = 0x1FFFLL - v21;
              int v36 = snprintf(&byte_1EBD0F9F4[v21], v35, "        TimeStep = %f\n", v34);
              if (v36 < 1)
              {
                uint64_t v37 = v21;
              }
              else
              {
                uint64_t v21 = (v36 + v21);
                if (v21 > 0x1FFE)
                {
LABEL_44:
                  LODWORD(v14) = v21;
                  goto LABEL_47;
                }
                size_t v35 = 0x1FFFLL - v21;
                uint64_t v37 = v21;
              }
              int v38 = snprintf(&byte_1EBD0F9F4[v37], v35, "    gScalingFactorLimits: (pid, cid) -> limit\n");
              LODWORD(v14) = (v38 & ~(v38 >> 31)) + v21;
            }
          }
        }
      }
    }
LABEL_47:
    uint64_t v39 = v15 + 584 * v13;
    __int16 v40 = *(float **)(v39 + 296);
    double v41 = (float *)(v39 + 304);
    if (v40 != (float *)(v39 + 304))
    {
      do
      {
        if (v14 <= 0x1FFE)
        {
          int v42 = snprintf(&byte_1EBD0F9F4[v14], 0x1FFFLL - v14, "        (%d, %d) -> %f\n", HIDWORD(*((void *)v40 + 4)), *((void *)v40 + 4), v40[10]);
          LODWORD(v14) = (v42 & ~(v42 >> 31)) + v14;
        }
        int v43 = (float *)*((void *)v40 + 1);
        if (v43)
        {
          do
          {
            double v44 = v43;
            int v43 = *(float **)v43;
          }
          while (v43);
        }
        else
        {
          do
          {
            double v44 = (float *)*((void *)v40 + 2);
            BOOL v45 = *(void *)v44 == (void)v40;
            __int16 v40 = v44;
          }
          while (!v45);
        }
        __int16 v40 = v44;
      }
      while (v44 != v41);
    }
    if (v14 < 0x1FFF)
    {
      size_t v46 = 0x1FFFLL - v14;
      int v47 = snprintf(&byte_1EBD0F9F4[v14], v46, "    gDefaultMinScalingFactor = %f\n", *(float *)(v15 + 584 * v13 + 324));
      if (v47 < 1)
      {
        uint64_t v48 = v14;
      }
      else
      {
        uint64_t v14 = (v47 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v49 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gDefaultRampingSpeedFactor = %f\n", *(float *)(v15 + 584 * v13 + 328));
      if (v49 >= 1)
      {
        uint64_t v14 = (v49 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v50 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gDefaultBrightnessAnimationTimeStepFactor = %f\n", *(float *)(v15 + 584 * v13 + 332));
      if (v50 >= 1)
      {
        uint64_t v14 = (v50 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v51 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gDefaultTransitionAnimationTimeStepFactor = %f\n", *(float *)(v15 + 584 * v13 + 336));
      if (v51 >= 1)
      {
        uint64_t v14 = (v51 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v52 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gMinScalingFactor = %f\n", *(float *)(v15 + 584 * v13 + 340));
      if (v52 >= 1)
      {
        uint64_t v14 = (v52 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v53 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gRampingSpeedFactor = %f\n", *(float *)(v15 + 584 * v13 + 344));
      if (v53 >= 1)
      {
        uint64_t v14 = (v53 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v54 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gBrightnessAnimationTimeStepFactor = %f\n", *(float *)(v15 + 584 * v13 + 348));
      if (v54 >= 1)
      {
        uint64_t v14 = (v54 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v55 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gTransitionAnimationTimeStepFactor = %f\n", *(float *)(v15 + 584 * v13 + 352));
      if (v55 >= 1)
      {
        uint64_t v14 = (v55 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v56 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gMaxLuminance = %f\n", *(float *)(v15 + 584 * v13 + 356));
      if (v56 >= 1)
      {
        uint64_t v14 = (v56 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v57 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gAmbientIlluminance = %f\n", *(float *)(v15 + 584 * v13 + 360));
      if (v57 >= 1)
      {
        uint64_t v14 = (v57 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v58 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gTargetBrightness = %f\n", *(float *)(v15 + 584 * v13 + 364));
      if (v58 >= 1)
      {
        uint64_t v14 = (v58 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      double v59 = "Yes";
      if (!*(unsigned char *)(v15 + 584 * v13 + 368)) {
        double v59 = "No";
      }
      int v60 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gAccessibilityLimit = %s\n", v59);
      if (v60 >= 1)
      {
        uint64_t v14 = (v60 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v61 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gSBIMRequestedScalingFactor = %f\n", *(float *)(v15 + 584 * v13 + 372));
      if (v61 >= 1)
      {
        uint64_t v14 = (v61 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v62 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gScalingConstraints:\n");
      if (v62 >= 1)
      {
        uint64_t v14 = (v62 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v63 = snprintf(&byte_1EBD0F9F4[v48], v46, "        SystemDefault = %f\n", *(float *)(v15 + 584 * v13 + 376));
      if (v63 >= 1)
      {
        uint64_t v14 = (v63 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v64 = snprintf(&byte_1EBD0F9F4[v48], v46, "        Brightness = %f\n", *(float *)(v15 + 584 * v13 + 380));
      if (v64 >= 1)
      {
        uint64_t v14 = (v64 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v65 = snprintf(&byte_1EBD0F9F4[v48], v46, "        ClientMaximum = %f\n", *(float *)(v15 + 584 * v13 + 384));
      if (v65 >= 1)
      {
        uint64_t v14 = (v65 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v66 = snprintf(&byte_1EBD0F9F4[v48], v46, "        SBIM = %f\n", *(float *)(v15 + 584 * v13 + 388));
      if (v66 >= 1)
      {
        uint64_t v14 = (v66 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v67 = snprintf(&byte_1EBD0F9F4[v48], v46, "        kLowPowerMode = %f\n", *(float *)(v15 + 584 * v13 + 392));
      if (v67 >= 1)
      {
        uint64_t v14 = (v67 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v68 = snprintf(&byte_1EBD0F9F4[v48], v46, "        Accessibility = %f\n", *(float *)(v15 + 584 * v13 + 396));
      if (v68 >= 1)
      {
        uint64_t v14 = (v68 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      v69 = "Yes";
      if (!*(unsigned char *)(v15 + 584 * v13 + 400)) {
        v69 = "No";
      }
      int v70 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gLowPowerMode = %s\n", v69);
      if (v70 >= 1)
      {
        uint64_t v14 = (v70 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v71 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gFramebuffer => %p\n", *(const void **)(v15 + 584 * v13 + 408));
      if (v71 >= 1)
      {
        uint64_t v14 = (v71 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v72 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gService = %d\n", *(_DWORD *)(v15 + 584 * v13 + 416));
      if (v72 >= 1)
      {
        uint64_t v14 = (v72 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v73 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gSBIMTimer => %p\n", *(const void **)(v15 + 584 * v13 + 424));
      if (v73 >= 1)
      {
        uint64_t v14 = (v73 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v74 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gMitigationTimer => %p\n", *(const void **)(v15 + 584 * v13 + 432));
      if (v74 >= 1)
      {
        uint64_t v14 = (v74 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      v75 = "Yes";
      if (!*(unsigned char *)(v15 + 584 * v13 + 440)) {
        v75 = "No";
      }
      int v76 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gBurnInMitigatinEnabled = %s\n", v75);
      if (v76 >= 1)
      {
        uint64_t v14 = (v76 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v77 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gMinScalingFactorBySBIM = %f\n", *(float *)(v15 + 584 * v13 + 444));
      if (v77 >= 1)
      {
        uint64_t v14 = (v77 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v78 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gMitigationState:\n");
      if (v78 >= 1)
      {
        uint64_t v14 = (v78 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      uint64_t v79 = *(int *)(v15 + 584 * v13 + 448);
      v80 = "UnknownMitigationStage";
      if (v79 <= 3) {
        v80 = off_1E6875248[v79];
      }
      int v81 = snprintf(&byte_1EBD0F9F4[v48], v46, "        state = %s\n", v80);
      if (v81 >= 1)
      {
        uint64_t v14 = (v81 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      v82 = "Yes";
      if (!*(unsigned char *)(v15 + 584 * v13 + 452)) {
        v82 = "No";
      }
      int v83 = snprintf(&byte_1EBD0F9F4[v48], v46, "        violation = %s\n", v82);
      if (v83 >= 1)
      {
        uint64_t v14 = (v83 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v84 = snprintf(&byte_1EBD0F9F4[v48], v46, "        sbim_timer_interval = %d\n", *(_DWORD *)(v15 + 584 * v13 + 460));
      if (v84 >= 1)
      {
        uint64_t v14 = (v84 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v85 = snprintf(&byte_1EBD0F9F4[v48], v46, "        mitigation_timer_interval = %d\n", *(_DWORD *)(v15 + 584 * v13 + 464));
      if (v85 >= 1)
      {
        uint64_t v14 = (v85 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v86 = snprintf(&byte_1EBD0F9F4[v48], v46, "        sbim_timer_size = %d\n", *(_DWORD *)(v15 + 584 * v13 + 468));
      if (v86 >= 1)
      {
        uint64_t v14 = (v86 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v87 = snprintf(&byte_1EBD0F9F4[v48], v46, "        delta_factor = %f\n", *(float *)(v15 + 584 * v13 + 472));
      if (v87 >= 1)
      {
        uint64_t v14 = (v87 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v88 = snprintf(&byte_1EBD0F9F4[v48], v46, "        minutes_per_stop_mitigate = %f\n", *(float *)(v15 + 584 * v13 + 476));
      if (v88 >= 1)
      {
        uint64_t v14 = (v88 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v89 = snprintf(&byte_1EBD0F9F4[v48], v46, "        minutes_per_stop_recovery = %f\n", *(float *)(v15 + 584 * v13 + 480));
      if (v89 >= 1)
      {
        uint64_t v14 = (v89 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v90 = snprintf(&byte_1EBD0F9F4[v48], v46, "        sbim_above_max = %f\n", *(float *)(v15 + 584 * v13 + 484));
      if (v90 >= 1)
      {
        uint64_t v14 = (v90 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v91 = snprintf(&byte_1EBD0F9F4[v48], v46, "        sbim_sustain_max = %f\n", *(float *)(v15 + 584 * v13 + 488));
      if (v91 >= 1)
      {
        uint64_t v14 = (v91 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v92 = snprintf(&byte_1EBD0F9F4[v48], v46, "        sbim_above_num = %f\n", *(float *)(v15 + 584 * v13 + 492));
      if (v92 >= 1)
      {
        uint64_t v14 = (v92 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v93 = snprintf(&byte_1EBD0F9F4[v48], v46, "        sbim_sustain_num = %f\n", *(float *)(v15 + 584 * v13 + 496));
      if (v93 >= 1)
      {
        uint64_t v14 = (v93 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v94 = snprintf(&byte_1EBD0F9F4[v48], v46, "        lastStateUpdate_ = %f\n", *(double *)(v15 + 584 * v13 + 504));
      if (v94 >= 1)
      {
        uint64_t v14 = (v94 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v95 = snprintf(&byte_1EBD0F9F4[v48], v46, "        sbim_read_stage = %d\n", *(_DWORD *)(v15 + 584 * v13 + 512));
      if (v95 >= 1)
      {
        uint64_t v14 = (v95 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v96 = snprintf(&byte_1EBD0F9F4[v48], v46, "        lastSBIMBlock_:\n");
      if (v96 >= 1)
      {
        uint64_t v14 = (v96 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v97 = snprintf(&byte_1EBD0F9F4[v48], v46, "            version = %d\n", *(_DWORD *)(v15 + 584 * v13 + 520));
      if (v97 >= 1)
      {
        uint64_t v14 = (v97 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v98 = snprintf(&byte_1EBD0F9F4[v48], v46, "            sbim = (%d, %d, %d)\n", *(_DWORD *)(v15 + 584 * v13 + 528), *(_DWORD *)(v15 + 584 * v13 + 532), *(_DWORD *)(v15 + 584 * v13 + 536));
      if (v98 >= 1)
      {
        uint64_t v14 = (v98 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v99 = snprintf(&byte_1EBD0F9F4[v48], v46, "            duration_us = %lld\n", *(void *)(v15 + 584 * v13 + 544));
      if (v99 >= 1)
      {
        uint64_t v14 = (v99 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v100 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gBrightnessScaler = %f\n", *(float *)(v15 + 584 * v13 + 556));
      if (v100 >= 1)
      {
        uint64_t v14 = (v100 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      v101 = "Yes";
      if (!*(unsigned char *)(v15 + 584 * v13 + 552)) {
        v101 = "No";
      }
      int v102 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gSBIMSupported = %s\n", v101);
      if (v102 >= 1)
      {
        uint64_t v14 = (v102 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v103 = snprintf(&byte_1EBD0F9F4[v48], v46, "    gServerData:\n");
      if (v103 >= 1)
      {
        uint64_t v14 = (v103 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v104 = snprintf(&byte_1EBD0F9F4[v48], v46, "        Brightness = %f\n", *(float *)(v15 + 584 * v13 + 560));
      if (v104 >= 1)
      {
        uint64_t v14 = (v104 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v105 = snprintf(&byte_1EBD0F9F4[v48], v46, "        Backlight = %f\n", *(float *)(v15 + 584 * v13 + 564));
      if (v105 >= 1)
      {
        uint64_t v14 = (v105 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v106 = snprintf(&byte_1EBD0F9F4[v48], v46, "        EDRScalingValue = %f\n", *(float *)(v15 + 584 * v13 + 568));
      if (v106 >= 1)
      {
        uint64_t v14 = (v106 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v107 = snprintf(&byte_1EBD0F9F4[v48], v46, "        MaxLuminance = %f\n", *(float *)(v15 + 584 * v13 + 572));
      if (v107 >= 1)
      {
        uint64_t v14 = (v107 + v14);
        if (v14 > 0x1FFE) {
          goto LABEL_229;
        }
        size_t v46 = 0x1FFFLL - v14;
        uint64_t v48 = v14;
      }
      int v108 = snprintf(&byte_1EBD0F9F4[v48], v46, "        Ambient = %f\n", *(float *)(v15 + 584 * v13 + 576));
      LODWORD(v14) = (v108 & ~(v108 >> 31)) + v14;
    }
LABEL_229:
    ++v13;
  }
  while (v13 != 16);
  int v109 = open("/var/tmp/libEDR_Server_State.txt", 1793, 420);
  int v110 = v109;
  if (v109 >= 1)
  {
    size_t v111 = strlen(byte_1EBD0F9F4);
    write(v110, byte_1EBD0F9F4, v111);
    close(v110);
  }
  std::mutex::unlock(v112);
}

void sub_1CFE1DB20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::mutex *a12)
{
}

void sub_1CFE1DB48()
{
  int v0 = dispatch_get_global_queue(0, 0);
  notify_register_dispatch("com.apple.libEDR.DumpState", &dword_1EBD11A0C, v0, &unk_1F2686EB8);
}

void sub_1CFE1DBB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1CFE1DBC8()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  sub_1CFE1C64C();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int buf = 136315650;
    int v5 = "EDRServerDumpStateToSysLog";
    __int16 v6 = 2048;
    CFStringRef v7 = byte_1EBD0F9F4;
    __int16 v8 = 1024;
    int v9 = strlen(byte_1EBD0F9F4);
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: data => %p size = %d\n", buf, 0x1Cu);
  }
  __lasts = 0;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - Server State Begin\n", buf, 2u);
  }
  int v0 = strtok_r(byte_1EBD0F9F4, "\n", &__lasts);
  if (v0)
  {
    uint64_t v1 = v0;
    unsigned int v2 = MEMORY[0x1E4F14500];
    do
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 136315138;
        int v5 = v1;
        _os_log_impl(&dword_1CFE12000, v2, OS_LOG_TYPE_INFO, "libEDR - Server State: %s\n", buf, 0xCu);
      }
      uint64_t v1 = strtok_r(0, "\n", &__lasts);
    }
    while (v1);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - Server State End\n", buf, 2u);
  }
}

BOOL sub_1CFE1DDC8(int a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (dword_1EBD0F918 != a1) {
    return 0;
  }
  uint64_t v2 = sub_1CFE14B9C(a1);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  sub_1CFE1E3D4(a1);
  io_registry_entry_t v4 = *(_DWORD *)(v3 + 416);
  if (!v4) {
    return 0;
  }
  CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v4, @"enableSBIM", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (CFProperty)
  {
    CFBooleanRef v6 = CFProperty;
    BOOL v7 = CFBooleanGetValue(CFProperty) != 0;
    CFRelease(v6);
  }
  else
  {
    BOOL v7 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v9 = "No";
    if (v7) {
      int v9 = "Yes";
    }
    int v10 = 136315394;
    int v11 = "EDRServerSBIMIsEnabled";
    __int16 v12 = 2080;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s => %s\n", (uint8_t *)&v10, 0x16u);
  }
  return v7;
}

void sub_1CFE1DF0C(int a1, int a2)
{
  kern_return_t v9;
  kern_return_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  size_t v17 = *MEMORY[0x1E4F143B8];
  if (dword_1EBD0F918 == a1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      io_registry_entry_t v4 = "No";
      __int16 v12 = "EDRServerEnableSBIM";
      int v11 = 136315650;
      if (a2) {
        io_registry_entry_t v4 = "Yes";
      }
      uint64_t v13 = 1024;
      uint64_t v14 = a1;
      uint64_t v15 = 2080;
      uint64_t v16 = v4;
      _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: did=%d enable=%s\n", (uint8_t *)&v11, 0x1Cu);
    }
    uint64_t v5 = sub_1CFE14B9C(a1);
    if (v5)
    {
      uint64_t v6 = v5;
      sub_1CFE1E3D4(a1);
      io_registry_entry_t v7 = *(_DWORD *)(v6 + 416);
      if (v7)
      {
        if (*(unsigned char *)(v6 + 552))
        {
          __int16 v8 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
          if (!a2) {
            __int16 v8 = (CFTypeRef *)MEMORY[0x1E4F1CFC8];
          }
          int v9 = IORegistryEntrySetCFProperty(v7, @"enableSBIM", *v8);
          if (v9)
          {
            int v10 = v9;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              sub_1CFE24144();
            }
            if (v10 == -536870201) {
              *(unsigned char *)(v6 + 552) = 0;
            }
          }
        }
      }
    }
  }
}

void sub_1CFE1E08C(int a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (dword_1EBD0F918 == a1)
  {
    uint64_t v2 = sub_1CFE14B9C(a1);
    if (v2)
    {
      uint64_t v3 = v2;
      *(_DWORD *)(v2 + 444) = *(_DWORD *)(v2 + 324);
      if (!*(void *)(v2 + 424))
      {
        io_registry_entry_t v4 = dispatch_get_global_queue(0, 0);
        dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
        uint64_t v6 = *(void **)(v3 + 424);
        *(void *)(v3 + 424) = v5;

        *(_DWORD *)(v3 + 512) = 0;
        if (*(_DWORD *)(v3 + 448))
        {
          for (unsigned int i = fmin((double)vcvtad_u64_f64((sub_1CFE1438C() - *(double *)(v3 + 504))/ (double)(60 * *(_DWORD *)(v3 + 460))), 6.0); i; --i)
            sub_1CFE1ECDC(v3 + 448, (long long *)(v3 + 520), 0, 0.0, 0.0, 100.0);
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            int v8 = *(_DWORD *)(v3 + 448);
            *(_DWORD *)int buf = 136315394;
            int v22 = "FastForwardMitigationState";
            __int16 v23 = 1024;
            int v24 = v8;
            _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: fastforward sbim to stage %d\n", buf, 0x12u);
          }
        }
        int v9 = *(NSObject **)(v3 + 424);
        if (v9)
        {
          dispatch_time_t v10 = dispatch_time(0, 1000000000);
          dispatch_source_set_timer(v9, v10, 1000000000 * *(unsigned int *)(v3 + 460), 1000000000 * *(unsigned int *)(v3 + 460));
          int v11 = *(NSObject **)(v3 + 424);
          handler[0] = MEMORY[0x1E4F143A8];
          handler[1] = 3221225472;
          handler[2] = sub_1CFE1E47C;
          handler[3] = &unk_1E6875190;
          int v20 = a1;
          dispatch_source_set_event_handler(v11, handler);
          dispatch_resume(*(dispatch_object_t *)(v3 + 424));
          dispatch_source_t v12 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
          uint64_t v13 = *(void **)(v3 + 432);
          *(void *)(v3 + 432) = v12;

          uint64_t v14 = *(NSObject **)(v3 + 432);
          if (v14)
          {
            dispatch_time_t v15 = dispatch_time(0, 1000000000);
            dispatch_source_set_timer(v14, v15, 1000000000 * *(unsigned int *)(v3 + 464), 1000000000 * *(unsigned int *)(v3 + 464));
            uint64_t v16 = *(NSObject **)(v3 + 432);
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = sub_1CFE1E7F8;
            v17[3] = &unk_1E6875190;
            int v18 = a1;
            dispatch_source_set_event_handler(v16, v17);
            dispatch_resume(*(dispatch_object_t *)(v3 + 432));
LABEL_17:

            return;
          }
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            sub_1CFE24248();
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          sub_1CFE241C0();
        }
        sub_1CFE18480(a1);
        goto LABEL_17;
      }
    }
  }
}

void sub_1CFE1E3B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CFE1E3D4(int a1)
{
  uint64_t v1 = sub_1CFE14B9C(a1);
  if (v1 && !*(_DWORD *)(v1 + 416))
  {
    uint64_t v2 = (_DWORD *)(v1 + 416);
    uint64_t v3 = (void *)(v1 + 408);
    if (IOMobileFramebufferGetMainDisplay())
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        sub_1CFE24350();
      }
LABEL_6:
      *uint64_t v3 = 0;
      *uint64_t v2 = 0;
      return;
    }
    int ServiceObject = IOMobileFramebufferGetServiceObject();
    *uint64_t v2 = ServiceObject;
    if (!ServiceObject)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        sub_1CFE242D0();
      }
      goto LABEL_6;
    }
  }
}

void sub_1CFE1E47C(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int v1 = *(_DWORD *)(a1 + 32);
  uint64_t v2 = (std::mutex *)qword_1EBD0F980;
  std::mutex::lock((std::mutex *)qword_1EBD0F980);
  uint64_t v3 = sub_1CFE14B9C(v1);
  if (v3)
  {
    uint64_t v4 = v3;
    BOOL v23 = *(_DWORD *)(v3 + 512) == 0;
    int Block = IOMobileFramebufferGetBlock();
    if (Block)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 136315394;
        *(void *)&uint8_t buf[4] = "sbimTimerHandler";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = Block;
        _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: IOMobileFramebufferGetBlock() => 0x%x\n", buf, 0x12u);
      }
    }
    else
    {
      float v6 = sub_1CFE14204(v4);
      float v8 = v7;
      float v9 = log2f(1.0 / v7);
      float v10 = log2f(1.0 / *(float *)(v4 + 372));
      float v11 = v6 * (float)(v8 * *(float *)(v4 + 356));
      uint64_t v12 = *(unsigned int *)(v4 + 468);
      if (v12)
      {
        uint64_t v13 = (_DWORD *)&v21 + 2;
        do
        {
          *v13++ *= 2;
          --v12;
        }
        while (v12);
      }
      char v15 = *(_DWORD *)(v4 + 512) == 1 || v23;
      sub_1CFE1ECDC(v4 + 448, &v21, v15, v9, v10, v11);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = *(int *)(v4 + 448);
        if (v16 > 3) {
          size_t v17 = "UnknownMitigationStage";
        }
        else {
          size_t v17 = off_1E6875248[v16];
        }
        int v18 = *(unsigned __int8 *)(v4 + 452);
        *(double *)&unint64_t v19 = *(float *)(v4 + 492);
        int v20 = *(_DWORD *)(v4 + 512);
        *(_DWORD *)int buf = 136318210;
        *(void *)&uint8_t buf[4] = "sbimTimerHandler";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = DWORD2(v21);
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = HIDWORD(v21);
        LOWORD(v25) = 1024;
        *(_DWORD *)((char *)&v25 + 2) = v22;
        HIWORD(v25) = 2048;
        *(void *)uint64_t v26 = *((void *)&v22 + 1);
        *(_WORD *)&v26[8] = 2048;
        *(double *)&v26[10] = v11;
        *(_WORD *)&v26[18] = 2048;
        *(double *)&v26[20] = v10;
        *(_WORD *)&v26[28] = 2048;
        *(double *)&v26[30] = v9;
        *(_WORD *)&v26[38] = 2080;
        int v27 = v17;
        LOWORD(v28) = 1024;
        *(_DWORD *)((char *)&v28 + 2) = v18;
        HIWORD(v28) = 2048;
        unint64_t v29 = v19;
        __int16 v30 = 1024;
        int v31 = v20;
        __int16 v32 = 1024;
        BOOL v33 = v23;
        _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: SBIM rgb=(%u, %u, %u), duration=%llu, refWhite: %f, HR_request: %f, HR_in: %f, state: %s, violation: %d, sbim_above: %f, sbim_read_stage: %d, sbim_reset: %d", buf, 0x6Cu);
      }
      *(void *)int buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = sub_1CFE1F64C;
      uint64_t v25 = &unk_1E68751B0;
      *(_OWORD *)uint64_t v26 = v21;
      *(_OWORD *)&v26[16] = v22;
      unint64_t v28 = __PAIR64__(LODWORD(v10), LODWORD(v11));
      unint64_t v29 = __PAIR64__(v23, LODWORD(v9));
      *(void *)&v26[32] = v4;
      int v27 = (const char *)(v4 + 512);
      AnalyticsSendEventLazy();
      *(_DWORD *)(v4 + 512) = (*(_DWORD *)(v4 + 512) + 1) % *(_DWORD *)(v4 + 456);
      sub_1CFE18CCC();
    }
  }
  std::mutex::unlock(v2);
}

void sub_1CFE1E7DC(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CFE1E7F8(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(unsigned int *)(a1 + 32);
  uint64_t v2 = (std::mutex *)qword_1EBD0F980;
  uint64_t v22 = qword_1EBD0F980;
  char v23 = 1;
  std::mutex::lock((std::mutex *)qword_1EBD0F980);
  uint64_t v3 = sub_1CFE14B9C(v1);
  if (!v3) {
    goto LABEL_26;
  }
  uint64_t v4 = v3;
  float v5 = sub_1CFE14204(v3);
  float v7 = v6;
  float v8 = log2f(1.0 / v6);
  float v9 = log2f(1.0 / *(float *)(v4 + 372));
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBD11A60, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EBD11A60))
  {
    *(float *)&dword_1EBD11A90 = (float)*(unsigned int *)(v4 + 464) / (float)(*(float *)(v4 + 476) * 60.0);
    __cxa_guard_release(&qword_1EBD11A60);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBD11A68, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EBD11A68))
  {
    *(float *)&dword_1EBD11A88 = (float)*(unsigned int *)(v4 + 464) / (float)(*(float *)(v4 + 480) * 60.0);
    __cxa_guard_release(&qword_1EBD11A68);
  }
  float v10 = v9;
  switch(*(_DWORD *)(v4 + 448))
  {
    case 0:
      break;
    case 1:
      goto LABEL_8;
    case 2:
      float v10 = v8;
      if (!*(unsigned char *)(v4 + 452)) {
        break;
      }
      goto LABEL_8;
    case 3:
      if (*(unsigned char *)(v4 + 452))
      {
LABEL_8:
        float v10 = fmax((float)(v8 - *(float *)&dword_1EBD11A90), 0.0);
      }
      else if (v8 <= v9)
      {
        float v10 = v8 + *(float *)&dword_1EBD11A88;
      }
      else
      {
        float v10 = fmaxf(v9, v8 - *(float *)&dword_1EBD11A88);
      }
      break;
    default:
      float v10 = 0.0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        sub_1CFE243CC();
      }
      break;
  }
  float v11 = fminf(v9, v10);
  double v12 = exp2(v11);
  float v13 = v5 * (float)(v7 * *(float *)(v4 + 356));
  int v14 = byte_1EA6238D8;
  BOOL v15 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (!v15) {
      goto LABEL_21;
    }
    uint64_t v16 = *(int *)(v4 + 448);
    if (v16 > 3) {
      size_t v17 = "UnknownMitigationStage";
    }
    else {
      size_t v17 = off_1E6875248[v16];
    }
  }
  else
  {
    if (!v15) {
      goto LABEL_21;
    }
    uint64_t v18 = *(int *)(v4 + 448);
    if (v18 > 3) {
      size_t v17 = "UnknownMitigationStage";
    }
    else {
      size_t v17 = off_1E6875248[v18];
    }
  }
  int v19 = *(unsigned __int8 *)(v4 + 452);
  double v20 = *(float *)(v4 + 492);
  *(_DWORD *)int buf = 136316930;
  *(void *)&uint8_t buf[4] = "mitigationTimerHandler";
  *(_WORD *)&unsigned char buf[12] = 2048;
  *(double *)&buf[14] = v13;
  *(_WORD *)&buf[22] = 2048;
  double v25 = v9;
  *(_WORD *)uint64_t v26 = 2048;
  *(double *)&v26[2] = v8;
  *(_WORD *)&v26[10] = 2048;
  double v27 = v11;
  *(_WORD *)unint64_t v28 = 2080;
  *(void *)&v28[2] = v17;
  __int16 v29 = 1024;
  int v30 = v19;
  __int16 v31 = 2048;
  double v32 = v20;
  _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: SBIM refWhite: %f, HR_request: %f, HR_current: %f, HR_out: %f, state: %s, violation: %d, sbim_above: %f\n", buf, 0x4Eu);
LABEL_21:
  *(void *)int buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = sub_1CFE1F9C4;
  double v25 = COERCE_DOUBLE(&unk_1E68751D0);
  *(float *)&v26[8] = v13;
  double v27 = COERCE_DOUBLE(__PAIR64__(LODWORD(v8), LODWORD(v9)));
  *(float *)unint64_t v28 = v11;
  *(void *)uint64_t v26 = v4;
  AnalyticsSendEventLazy();
  if (*(unsigned char *)(v4 + 452))
  {
    if (vabdd_f64(*(float *)(v4 + 444), 1.0 / v12) / *(float *)(v4 + 444) > 0.0001)
    {
      float v21 = 1.0 / v12;
      *(float *)(v4 + 444) = v21;
      sub_1CFE15304((uint64_t)&v22);
      sub_1CFE15588(v1, 0);
    }
  }
  if (v23)
  {
    uint64_t v2 = (std::mutex *)v22;
LABEL_26:
    std::mutex::unlock(v2);
  }
}

void sub_1CFE1EC9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
}

void sub_1CFE1ECDC(uint64_t a1, long long *a2, char a3, float a4, float a5, float a6)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBD11A58, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EBD11A58))
  {
    unint64_t v43 = *(unsigned int *)(a1 + 20);
    qword_1EBD11AA8 = 0;
    unk_1EBD11AB0 = 0;
    sub_1CFE1F480((uint64_t)&qword_1EBD11AA8, v43, 0.0);
    __cxa_atexit((void (*)(void *))sub_1CFE1F3A4, &qword_1EBD11AA8, &dword_1CFE12000);
    __cxa_guard_release(&qword_1EBD11A58);
  }
  unint64_t v12 = *(unsigned int *)(a1 + 20);
  size_t v46 = 0;
  int v47 = 0;
  if (v12)
  {
    float v13 = (char *)operator new(4 * v12);
    size_t v46 = v13;
    bzero(v13, 4 * v12);
    int v14 = &v13[4 * v12];
    int v47 = v14;
    BOOL v15 = (char *)operator new(4 * v12);
    bzero(v15, 4 * v12);
    uint64_t v16 = 0;
    size_t v17 = &v15[4 * v12];
    if (v12 <= 1) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = v12;
    }
    uint64_t v19 = 4 * v18;
    do
    {
      *(float *)&v15[v16] = (float)*(unsigned int *)((char *)a2 + v16 + 8);
      v16 += 4;
    }
    while (v19 != v16);
    unint64_t v20 = v12;
  }
  else
  {
    unint64_t v20 = 0;
    BOOL v15 = 0;
    size_t v17 = 0;
    int v14 = 0;
    float v13 = 0;
  }
  uint64_t v21 = (v14 - v13) >> 2;
  if (a3)
  {
    if (v21 != v20) {
      sub_1CFE1F480((uint64_t)&v46, v20, 0.0);
    }
    if (v12)
    {
      uint64_t v22 = (float *)v46;
      char v23 = (float *)v15;
      do
      {
        float v24 = *v23++;
        *v22++ = v24 * 0.03125;
        --v20;
      }
      while (v20);
    }
  }
  else
  {
    if (v21 != v20) {
      sub_1CFE1F480((uint64_t)&v46, v20, 0.0);
    }
    if (v12)
    {
      double v25 = (float *)v46;
      uint64_t v26 = (float *)qword_1EBD11AA8;
      double v27 = (float *)v15;
      do
      {
        float v28 = *v27++;
        float v29 = v28;
        float v30 = *v26++;
        *v25++ = (float)(v29 - v30) * 0.03125;
        --v20;
      }
      while (v20);
    }
  }
  sub_1CFE1F50C((uint64_t)&qword_1EBD11AA8, v15, v17);
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBD11A78, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EBD11A78))
  {
    if (qword_1EBD11A18 != -1) {
      dispatch_once(&qword_1EBD11A18, &unk_1F2686ED8);
    }
    __cxa_guard_release(&qword_1EBD11A78);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBD11A70, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EBD11A70))
  {
    qword_1EBD11A98 = qword_1EBD0F8E0;
    __cxa_guard_release(&qword_1EBD11A70);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBD11A80, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EBD11A80))
  {
    qword_1EBD11AA0 = qword_1EBD0F8E8;
    __cxa_guard_release(&qword_1EBD11A80);
  }
  if (!qword_1EBD11AA0) {
    __assert_rtn("SBIMLimitsByModel", "EDR.mm", 1976, "0 != curveSize");
  }
  int v31 = vcvtmd_s64_f64(a6 / 10.0 + 0.5);
  int v32 = qword_1EBD11AA0 - 1;
  int v33 = v31 & ~(v31 >> 31);
  if (v33 < (int)qword_1EBD11AA0 - 1) {
    int v32 = v33;
  }
  sub_1CFE1F5D4(&__p, (const void *)(qword_1EBD11A98 + 12 * v32), *(unsigned int *)(a1 + 20));
  *(void *)&v49[4] = &v46;
  *(void *)&v49[12] = &__p;
  BOOL v34 = sub_1CFE1F3F8((uint64_t)buf);
  *(unsigned char *)(a1 + 4) = v34;
  switch(*(_DWORD *)a1)
  {
    case 0:
      if (v34)
      {
        float v35 = *(float *)(a1 + 44) + -1.0;
        *(float *)(a1 + 44) = v35;
        if (v35 != 0.0) {
          break;
        }
        *(_DWORD *)a1 = 1;
      }
      *(_DWORD *)(a1 + 44) = *(_DWORD *)(a1 + 36);
      break;
    case 1:
      if (!v34)
      {
        *(_DWORD *)a1 = 2;
        *(_DWORD *)(a1 + 48) = *(_DWORD *)(a1 + 40);
      }
      break;
    case 2:
      float v36 = *(float *)(a1 + 48) + -1.0;
      *(float *)(a1 + 48) = v36;
      if (v36 == 0.0)
      {
        *(_DWORD *)a1 = 3;
        *(void *)(a1 + 44) = *(void *)(a1 + 36);
      }
      break;
    case 3:
      if (vabds_f32(a4, a5) < (float)((float)(*(float *)(a1 + 24) * (float)*(unsigned int *)(a1 + 16))
                                     / (float)(fminf(*(float *)(a1 + 28), *(float *)(a1 + 32)) * 60.0)))
        *(_DWORD *)a1 = 0;
      break;
    default:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        sub_1CFE24448();
      }
      break;
  }
  int v37 = byte_1EA6238D8;
  BOOL v38 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
  if (v37)
  {
    if (!v38) {
      goto LABEL_46;
    }
  }
  else if (!v38)
  {
    goto LABEL_46;
  }
  double v39 = *(float *)__p;
  double v40 = *((float *)__p + 1);
  double v41 = *((float *)__p + 2);
  *(_DWORD *)int buf = 136315906;
  *(void *)int v49 = "UpdateMitigationState";
  *(_WORD *)&v49[8] = 2048;
  *(double *)&v49[10] = v39;
  *(_WORD *)&v49[18] = 2048;
  double v50 = v40;
  __int16 v51 = 2048;
  double v52 = v41;
  _os_log_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "libEDR - %s: SBIM limits [R: %f, G: %f, B: %f]\n", buf, 0x2Au);
LABEL_46:
  *(double *)(a1 + 56) = sub_1CFE1438C();
  long long v42 = *a2;
  *(_OWORD *)(a1 + 88) = a2[1];
  *(_OWORD *)(a1 + 72) = v42;
  if (__p)
  {
    if (v45 != __p) {
      v45 += ((unsigned char *)__p - v45 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    }
    operator delete(__p);
  }
  if (v15) {
    operator delete(v15);
  }
  if (v46)
  {
    if (v47 != v46) {
      v47 += ((unsigned char *)v46 - v47 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    }
    operator delete(v46);
  }
}

void sub_1CFE1F2E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, void *__p, uint64_t a12)
{
}

uint64_t sub_1CFE1F3A4(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)a1;
  if (v2)
  {
    uint64_t v3 = *(unsigned char **)(a1 + 8);
    if (v3 != v2) {
      *(void *)(a1 + 8) = &v3[(v2 - v3 + 3) & 0xFFFFFFFFFFFFFFFCLL];
    }
    operator delete(v2);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
  }
  return a1;
}

BOOL sub_1CFE1F3F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t v2 = *(float **)v1;
  uint64_t v3 = *(void *)(v1 + 8) - *(void *)v1;
  if (v3) {
    BOOL v4 = *v2 > ***(float ***)(a1 + 16);
  }
  else {
    BOOL v4 = 0;
  }
  if ((unint64_t)v3 >= 5)
  {
    unint64_t v5 = v3 >> 2;
    if (v5 <= 2) {
      unint64_t v5 = 2;
    }
    unint64_t v6 = v5 - 1;
    float v7 = v2 + 1;
    float v8 = (float *)(**(void **)(a1 + 16) + 4);
    do
    {
      float v9 = *v7++;
      float v10 = v9;
      float v11 = *v8++;
      BOOL v12 = v10 > v11;
      if (v12 && !v4) {
        BOOL v4 = v12;
      }
      --v6;
    }
    while (v6);
  }
  return v4;
}

void sub_1CFE1F480(uint64_t a1, unint64_t a2, float a3)
{
  unint64_t v6 = *(unsigned char **)a1;
  if (v6)
  {
    float v7 = *(unsigned char **)(a1 + 8);
    if (v7 != v6) {
      *(void *)(a1 + 8) = &v7[(v6 - v7 + 3) & 0xFFFFFFFFFFFFFFFCLL];
    }
    operator delete(v6);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
  }
  if (a2)
  {
    if (a2 >> 62) {
      sub_1CFE16B00();
    }
    float v8 = (float *)operator new(4 * a2);
    *(void *)a1 = v8;
    do
    {
      *v8++ = a3;
      --a2;
    }
    while (a2);
    *(void *)(a1 + 8) = v8;
  }
}

uint64_t sub_1CFE1F50C(uint64_t a1, unsigned char *__src, unsigned char *a3)
{
  size_t v6 = a3 - __src;
  uint64_t v7 = (a3 - __src) >> 2;
  float v8 = *(unsigned char **)a1;
  float v9 = *(unsigned char **)(a1 + 8);
  if (v7 == (v9 - v8) >> 2)
  {
    if (a3 != __src) {
      memmove(v8, __src, a3 - __src);
    }
  }
  else
  {
    if (v8)
    {
      if (v9 != v8) {
        *(void *)(a1 + 8) = &v9[(v8 - v9 + 3) & 0xFFFFFFFFFFFFFFFCLL];
      }
      operator delete(v8);
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
    }
    if ((v6 & 0x8000000000000000) != 0) {
      sub_1CFE16B00();
    }
    float v11 = (char *)operator new(v6);
    *(void *)a1 = v11;
    *(void *)(a1 + 8) = &v11[4 * v7];
    if (__src != a3) {
      memcpy(v11, __src, ((v6 - 4) & 0xFFFFFFFFFFFFFFFCLL) + 4);
    }
  }
  return a1;
}

void *sub_1CFE1F5D4(void *a1, const void *a2, unint64_t a3)
{
  *a1 = 0;
  a1[1] = 0;
  if (a3)
  {
    if (a3 >> 62) {
      sub_1CFE16B00();
    }
    size_t v6 = (char *)operator new(4 * a3);
    *a1 = v6;
    memcpy(v6, a2, 4 * a3);
    a1[1] = &v6[4 * a3];
  }
  return a1;
}

id sub_1CFE1F64C(uint64_t a1)
{
  v23[12] = *MEMORY[0x1E4F143B8];
  v22[0] = @"SBIM_red";
  uint64_t v21 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  v23[0] = v21;
  v22[1] = @"SBIM_green";
  unint64_t v20 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 44)];
  v23[1] = v20;
  v22[2] = @"SBIM_blue";
  uint64_t v19 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  v23[2] = v19;
  v22[3] = @"SBIM_duration";
  uint64_t v2 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  v23[3] = v2;
  v22[4] = @"refWhite";
  LODWORD(v3) = *(_DWORD *)(a1 + 80);
  BOOL v4 = [NSNumber numberWithFloat:v3];
  v23[4] = v4;
  v22[5] = @"HR_request";
  LODWORD(v5) = *(_DWORD *)(a1 + 84);
  size_t v6 = [NSNumber numberWithFloat:v5];
  v23[5] = v6;
  v22[6] = @"HR_current";
  LODWORD(v7) = *(_DWORD *)(a1 + 88);
  float v8 = [NSNumber numberWithFloat:v7];
  v23[6] = v8;
  v22[7] = @"state";
  uint64_t v9 = *(int *)(*(void *)(a1 + 64) + 448);
  if (v9 > 3) {
    float v10 = "UnknownMitigationStage";
  }
  else {
    float v10 = off_1E6875248[v9];
  }
  float v11 = [NSString stringWithUTF8String:v10];
  v23[7] = v11;
  v22[8] = @"violation";
  BOOL v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 64) + 452)];
  v23[8] = v12;
  v22[9] = @"above";
  LODWORD(v13) = *(_DWORD *)(*(void *)(a1 + 64) + 492);
  int v14 = [NSNumber numberWithFloat:v13];
  v23[9] = v14;
  v22[10] = @"read_stage";
  BOOL v15 = [NSNumber numberWithUnsignedInt:**(unsigned int **)(a1 + 72)];
  v23[10] = v15;
  v22[11] = @"reset";
  uint64_t v16 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
  v23[11] = v16;
  size_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:12];

  return v17;
}

void sub_1CFE1F91C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

id sub_1CFE1F9C4(uint64_t a1, double a2)
{
  v19[7] = *MEMORY[0x1E4F143B8];
  v18[0] = @"refWhite";
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  double v3 = [NSNumber numberWithFloat:a2];
  v19[0] = v3;
  v18[1] = @"HR_request";
  LODWORD(v4) = *(_DWORD *)(a1 + 44);
  double v5 = [NSNumber numberWithFloat:v4];
  v19[1] = v5;
  v18[2] = @"HR_current";
  LODWORD(v6) = *(_DWORD *)(a1 + 48);
  double v7 = [NSNumber numberWithFloat:v6];
  v19[2] = v7;
  v18[3] = @"HR_out";
  LODWORD(v8) = *(_DWORD *)(a1 + 52);
  uint64_t v9 = [NSNumber numberWithFloat:v8];
  v19[3] = v9;
  v18[4] = @"state";
  uint64_t v10 = *(int *)(*(void *)(a1 + 32) + 448);
  if (v10 > 3) {
    float v11 = "UnknownMitigationStage";
  }
  else {
    float v11 = off_1E6875248[v10];
  }
  BOOL v12 = [NSString stringWithUTF8String:v11];
  v19[4] = v12;
  v18[5] = @"violation";
  double v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 452)];
  v19[5] = v13;
  v18[6] = @"above";
  LODWORD(v14) = *(_DWORD *)(*(void *)(a1 + 32) + 492);
  BOOL v15 = [NSNumber numberWithFloat:v14];
  v19[6] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:7];

  return v16;
}

void sub_1CFE1FBB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t **sub_1CFE1FC10(uint64_t **a1, unint64_t *a2, uint64_t a3, void **a4)
{
  double v7 = a1 + 1;
  double v6 = a1[1];
  if (v6)
  {
    unint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        unint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        double v6 = *v9;
        double v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      double v6 = v9[1];
      if (!v6)
      {
        double v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    float v11 = operator new(0x30uLL);
    v11[4] = **a4;
    *((_DWORD *)v11 + 10) = 0;
    sub_1CFE1C298(a1, (uint64_t)v9, v7, v11);
    return (uint64_t **)v11;
  }
  return v9;
}

id sub_1CFE1FCD4(uint64_t a1)
{
  v26[11] = *MEMORY[0x1E4F143B8];
  v25[0] = @"Hardware";
  float v24 = [NSString stringWithUTF8String:&xmmword_1EBD0F989];
  v26[0] = v24;
  v25[1] = @"Software";
  uint64_t v23 = [NSString stringWithUTF8String:&xmmword_1EBD0F9A9];
  v26[1] = v23;
  v25[2] = @"IsEDREnabled";
  uint64_t v2 = [NSNumber numberWithBool:sub_1CFE15AB4(*(void *)(a1 + 40))];
  v26[2] = v2;
  v25[3] = @"MinScalingFactor";
  LODWORD(v3) = *(_DWORD *)(*(void *)(a1 + 40) + 340);
  double v4 = [NSNumber numberWithFloat:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v26[3] = v4;
  long long v26[4] = v5;
  long long v25[4] = @"ScalingFactorLimits";
  v25[5] = @"DefaultMinScalingFactor";
  LODWORD(v7) = *(_DWORD *)(v6 + 324);
  unint64_t v8 = [NSNumber numberWithFloat:v7];
  v26[5] = v8;
  v25[6] = @"TargetBrightness";
  LODWORD(v9) = *(_DWORD *)(*(void *)(a1 + 40) + 364);
  unint64_t v10 = [NSNumber numberWithFloat:v9];
  v26[6] = v10;
  v25[7] = @"MaxLuminance";
  LODWORD(v11) = *(_DWORD *)(*(void *)(a1 + 40) + 356);
  BOOL v12 = [NSNumber numberWithFloat:v11];
  v26[7] = v12;
  v25[8] = @"AmbientIlluminance";
  LODWORD(v13) = *(_DWORD *)(*(void *)(a1 + 40) + 360);
  double v14 = [NSNumber numberWithFloat:v13];
  v26[8] = v14;
  v25[9] = @"BrightnessScaler";
  LODWORD(v15) = *(_DWORD *)(*(void *)(a1 + 40) + 556);
  uint64_t v16 = [NSNumber numberWithFloat:v15];
  v26[9] = v16;
  v25[10] = @"MitigationState";
  uint64_t v17 = *(int *)(*(void *)(a1 + 40) + 448);
  if (v17 > 3) {
    uint64_t v18 = "UnknownMitigationStage";
  }
  else {
    uint64_t v18 = off_1E6875248[v17];
  }
  uint64_t v19 = (void *)v23;
  unint64_t v20 = objc_msgSend(NSString, "stringWithUTF8String:", v18, v23);
  v26[10] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:11];

  return v21;
}

void sub_1CFE1FF78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t *sub_1CFE20004(uint64_t **a1, unsigned int *a2, uint64_t *a3)
{
  uint64_t v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    unsigned int v7 = *a2;
    while (1)
    {
      while (1)
      {
        unint64_t v8 = (uint64_t **)v5;
        unsigned int v9 = *((_DWORD *)v5 + 7);
        if (v7 >= v9) {
          break;
        }
        uint64_t v5 = *v8;
        uint64_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      uint64_t v5 = v8[1];
      if (!v5)
      {
        uint64_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    unint64_t v8 = a1 + 1;
LABEL_10:
    unint64_t v10 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v10 + 28) = *a3;
    sub_1CFE1C298(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t sub_1CFE200C0(uint64_t a1, unsigned int *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2) {
    return 0;
  }
  unsigned int v3 = *a2;
  uint64_t v4 = a1 + 8;
  do
  {
    unsigned int v5 = *(_DWORD *)(v2 + 32);
    BOOL v6 = v5 >= v3;
    if (v5 >= v3) {
      unsigned int v7 = (uint64_t *)v2;
    }
    else {
      unsigned int v7 = (uint64_t *)(v2 + 8);
    }
    if (v6) {
      uint64_t v4 = v2;
    }
    uint64_t v2 = *v7;
  }
  while (*v7);
  if (v4 == a1 + 8 || v3 < *(_DWORD *)(v4 + 32)) {
    return 0;
  }
  sub_1CFE20128((uint64_t **)a1, v4);
  return 1;
}

uint64_t *sub_1CFE20128(uint64_t **a1, uint64_t a2)
{
  unsigned int v3 = sub_1CFE1BD60(a1, (uint64_t *)a2);

  operator delete((void *)a2);
  return v3;
}

uint64_t **sub_1CFE2016C(uint64_t **a1, unsigned int *a2, uint64_t a3)
{
  BOOL v6 = a1 + 1;
  unsigned int v5 = a1[1];
  if (v5)
  {
    unsigned int v7 = *a2;
    while (1)
    {
      while (1)
      {
        unint64_t v8 = (uint64_t **)v5;
        unsigned int v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9) {
          break;
        }
        unsigned int v5 = *v8;
        BOOL v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      unsigned int v5 = v8[1];
      if (!v5)
      {
        BOOL v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    unint64_t v8 = a1 + 1;
LABEL_10:
    unint64_t v10 = operator new(0x40uLL);
    v10[8] = *(_DWORD *)a3;
    v10[10] = *(_DWORD *)(a3 + 8);
    long long v11 = *(_OWORD *)(a3 + 16);
    *(void *)(a3 + 16) = 0;
    *(void *)(a3 + 24) = 0;
    *((_OWORD *)v10 + 3) = v11;
    sub_1CFE1C298(a1, (uint64_t)v8, v6, (uint64_t *)v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t **sub_1CFE2023C(uint64_t **a1, unsigned int *a2, uint64_t a3)
{
  BOOL v6 = a1 + 1;
  unsigned int v5 = a1[1];
  if (v5)
  {
    unsigned int v7 = *a2;
    while (1)
    {
      while (1)
      {
        unint64_t v8 = (uint64_t **)v5;
        unsigned int v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9) {
          break;
        }
        unsigned int v5 = *v8;
        BOOL v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      unsigned int v5 = v8[1];
      if (!v5)
      {
        BOOL v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    unint64_t v8 = a1 + 1;
LABEL_10:
    unint64_t v10 = operator new(0x30uLL);
    v10[8] = *(_DWORD *)a3;
    *((void *)v10 + 5) = *(void *)(a3 + 8);
    sub_1CFE1C298(a1, (uint64_t)v8, v6, (uint64_t *)v10);
    return (uint64_t **)v10;
  }
  return v8;
}

void sub_1CFE20300(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t sub_1CFE20364()
{
  uint64_t v0 = sub_1CFE14F38();
  if (!v0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2000000000;
  uint64_t v19 = v0;
  pthread_rwlock_wrlock((pthread_rwlock_t *)(v0 + 232));
  *(void *)v17[3] = "com.apple.libEDR.Notification";
  uint64_t v1 = v17[3];
  *(_DWORD *)(v1 + 20) = 0;
  int v2 = sub_1CFE20A14("com.apple.libEDR.Notification", (mach_port_name_t *)(v1 + 20));
  uint64_t v3 = v17[3];
  if (v2) {
    goto LABEL_3;
  }
  sub_1CFE20BD4((void *)(v3 + 40));
  *(_DWORD *)(v17[3] + 8) = sub_1CFE20C3C();
  *(_DWORD *)(v17[3] + 12) = sub_1CFE20C90();
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2, 0);
  unsigned int v7 = v17;
  *(void *)(v17[3] + 24) = global_queue;
  uint64_t v3 = v7[3];
  unint64_t v8 = *(NSObject **)(v3 + 24);
  if (!v8) {
    goto LABEL_3;
  }
  dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F14458], *(unsigned int *)(v3 + 20), 0, v8);
  unint64_t v10 = v17;
  *(void *)(v17[3] + 32) = v9;
  uint64_t v3 = v10[3];
  long long v11 = *(NSObject **)(v3 + 32);
  if (v11)
  {
    dispatch_retain(v11);
    pthread_rwlock_unlock((pthread_rwlock_t *)(v17[3] + 232));
    BOOL v12 = *(NSObject **)(v17[3] + 32);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 0x40000000;
    handler[2] = sub_1CFE20CE4;
    handler[3] = &unk_1E6875270;
    void handler[4] = &v16;
    dispatch_source_set_event_handler(v12, handler);
    double v13 = *(NSObject **)(v17[3] + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 0x40000000;
    v14[2] = sub_1CFE21A28;
    v14[3] = &unk_1E6875298;
    v14[4] = &v16;
    dispatch_source_set_cancel_handler(v13, v14);
    dispatch_resume(*(dispatch_object_t *)(v17[3] + 32));
    uint64_t v4 = 0;
  }
  else
  {
LABEL_3:
    pthread_rwlock_unlock((pthread_rwlock_t *)(v3 + 232));
    uint64_t v4 = 0xFFFFFFFFLL;
  }
  _Block_object_dispose(&v16, 8);
  return v4;
}

void sub_1CFE20564(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

NSObject *sub_1CFE2057C()
{
  uint64_t v0 = sub_1CFE14F38();
  if (!v0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = *(NSObject **)(v0 + 32);
  if (result)
  {
    dispatch_source_cancel(result);
    return 0;
  }
  return result;
}

uint64_t sub_1CFE205B0(unsigned int a1, int a2, const void *a3, uint64_t a4)
{
  uint64_t v8 = sub_1CFE14F38();
  if (v8) {
    return sub_1CFE22680(v8, a1, 0, a2, a3, a4, 0, 0, 0);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_1CFE20620(uint64_t a1, int a2, const void *a3, uint64_t a4)
{
  uint64_t v8 = sub_1CFE14F38();
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  sub_1CFE235F8(v8, a1, a2, 0, 0, a3, a4, 0);
  return 0;
}

uint64_t sub_1CFE20688(int a1)
{
  uint64_t v2 = sub_1CFE14F38();
  int v9 = a1;
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = v2;
  uint64_t v4 = (pthread_rwlock_t *)(v2 + 232);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(v2 + 232));
  unsigned int v5 = sub_1CFE1513C((void *)(v3 + 80), &v9);
  if (v5)
  {
    v5[3] = 0;
    BOOL v6 = (const void *)v5[5];
    if (v6) {
      _Block_release(v6);
    }
  }
  syslog(5, "EDR - client remove handlers client = %d type = %d\n", *(_DWORD *)(v3 + 160), a1);
  unsigned int v7 = sub_1CFE1513C((void *)(v3 + 80), &v9);
  if (v7) {
    sub_1CFE23BBC((void *)(v3 + 80), v7);
  }
  pthread_rwlock_unlock(v4);
  return 0;
}

uint64_t sub_1CFE20740(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = sub_1CFE14F38();
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = v6;
  if (sub_1CFE227A8("com.apple.libEDR.Notification", v6, 0x2710u)) {
    return 0xFFFFFFFFLL;
  }
  if (a3 >= 0x21)
  {
    syslog(3, "EDR - %s: data size %d exceeds max data size %d\n", "send_request", a3, 32);
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = *(unsigned int *)(v7 + 8);
  if (v9 == *(_DWORD *)(v7 + 160))
  {
    uint64_t v11 = 0;
    memset(v12, 0, sizeof(v12));
    sub_1CFE21744(v7, v9, a1, (uint64_t)a2, a3, (uint64_t)&v11 + 4, (uint64_t)v12, (uint64_t)&v11, 1);
    sub_1CFE14FC4(v7, HIDWORD(v11), (uint64_t)v12, v11, 1);
    return 0;
  }
  else
  {
    pthread_rwlock_wrlock((pthread_rwlock_t *)(v7 + 232));
    uint64_t v10 = sub_1CFE21844(*(unsigned int *)(v7 + 140), a1, a2, a3, 0);
    pthread_rwlock_unlock((pthread_rwlock_t *)(v7 + 232));
    return v10;
  }
}

uint64_t sub_1CFE208B0(mach_msg_timeout_t a1, uint64_t a2, const void *a3, uint64_t a4, _DWORD *a5, void *a6, _DWORD *a7)
{
  uint64_t v14 = sub_1CFE14F38();
  if (v14)
  {
    uint64_t v15 = v14;
    if (!sub_1CFE227A8("com.apple.libEDR.Notification", v14, 0x2710u))
    {
      if (a4 < 0x21)
      {
        uint64_t v18 = *(unsigned int *)(v15 + 8);
        if (v18 != *(_DWORD *)(v15 + 160))
        {
          pthread_rwlock_wrlock((pthread_rwlock_t *)(v15 + 232));
          uint64_t v16 = sub_1CFE22354(*(unsigned int *)(v15 + 140), a2, a3, a4, *(unsigned int *)(v15 + 172), &v21, &v20, a5, a6, a7, &v19, a1);
          pthread_rwlock_unlock((pthread_rwlock_t *)(v15 + 232));
          return v16;
        }
        sub_1CFE21744(v15, v18, a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, 1);
        if (a7)
        {
          sub_1CFE14FC4(v15, *a5, (uint64_t)a6, *a7, 1);
          return 0;
        }
      }
      else
      {
        syslog(3, "EDR - %s: data size %d exceeds max data size %d\n", "send_request_sync", a4, 32);
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_1CFE20A14(const char *a1, mach_port_name_t *a2)
{
  mach_port_name_t name = 0;
  if (a1)
  {
    special_port.flags = 0;
    mach_error_t v4 = task_get_special_port(*MEMORY[0x1E4F14960], 4, &special_port.flags);
    if (v4)
    {
      mach_error_string(v4);
      syslog(3, "EDR - %s: task_get_bootstrap_port() => %s (%d)\n");
LABEL_12:
      sub_1CFE21BE4(name);
      return 0xFFFFFFFFLL;
    }
    syslog(5, "EDR - Bootstrap Port: %d\n", special_port.flags);
    mach_port_name_t name = 0;
    mach_error_t v8 = bootstrap_check_in(special_port.flags, a1, &name);
    if (v8)
    {
      mach_error_string(v8);
      syslog(3, "EDR - %s: bootstrap_check_in() => %s (%d)\n");
      goto LABEL_12;
    }
    syslog(5, "EDR - Local Port: %d (%s)\n");
LABEL_10:
    uint64_t result = mach_port_insert_right(*MEMORY[0x1E4F14960], name, name, 0x14u);
    if (!result)
    {
      *a2 = name;
      return result;
    }
    mach_error_string(result);
    syslog(3, "EDR - %s: mach_port_insert_right() => %s (%d)\n");
    goto LABEL_12;
  }
  special_port.reserved[1] = 0;
  *(_OWORD *)&special_port.flags = xmmword_1CFE265E0;
  mach_error_t v5 = mach_port_construct(*MEMORY[0x1E4F14960], &special_port, 0, &name);
  if (!v5)
  {
    syslog(5, "EDR - Local Port: %d\n");
    goto LABEL_10;
  }
  mach_error_t v6 = v5;
  uint64_t v7 = mach_error_string(v5);
  syslog(3, "EDR - %s: mach_port_construct() => %s (%d)\n", "setup_local_port", v7, v6);
  return 0xFFFFFFFFLL;
}

void *sub_1CFE20BD4(void *result)
{
  if (result[3])
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[2];
    if (result)
    {
      do
      {
        uint64_t v2 = (void *)*result;
        operator delete(result);
        uint64_t result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

uint64_t sub_1CFE20C3C()
{
  if (qword_1EBD11A30 != -1) {
    dispatch_once(&qword_1EBD11A30, &unk_1F2686E38);
  }
  if (qword_1EBD11A38) {
    return *(unsigned int *)(qword_1EBD11A38 + 20);
  }
  else {
    return 0;
  }
}

uint64_t sub_1CFE20C90()
{
  if (qword_1EBD11A30 != -1) {
    dispatch_once(&qword_1EBD11A30, &unk_1F2686E38);
  }
  if (qword_1EBD11A38) {
    return *(unsigned int *)(qword_1EBD11A38 + 28);
  }
  else {
    return 0;
  }
}

void sub_1CFE20CE4(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  uint64_t v62 = 0;
  mach_port_t v61 = 0;
  memset(v67, 0, sizeof(v67));
  if (sub_1CFE21480(*(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 20), (_DWORD *)&v64 + 1, &v64, (_DWORD *)&v63 + 1, (mach_port_t *)&v63, (mach_msg_size_t *)&v62 + 1, v67, (mach_port_t *)&v62, &v61))return; {
  switch(HIDWORD(v63))
  }
  {
    case 3:
      uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      int v6 = v63;
      uint64_t v7 = (pthread_rwlock_t *)(v5 + 232);
      pthread_rwlock_wrlock((pthread_rwlock_t *)(v5 + 232));
      mach_error_t v8 = (uint64_t *)(v5 + 56);
      while (1)
      {
        mach_error_t v8 = (uint64_t *)*v8;
        if (!v8) {
          break;
        }
        if (*((_DWORD *)v8 + 9) == v6)
        {
          uint64_t v9 = *((unsigned int *)v8 + 6);
          goto LABEL_28;
        }
      }
      uint64_t v9 = 0;
LABEL_28:
      pthread_rwlock_unlock(v7);
      uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      uint64_t v26 = (pthread_rwlock_t *)(v25 + 232);
      pthread_rwlock_wrlock((pthread_rwlock_t *)(v25 + 232));
      uint64_t v27 = *(void *)(v25 + 56);
      if (v27)
      {
        float v28 = (void *)(v25 + 40);
        do
        {
          while (*(_DWORD *)(v27 + 36) != v6)
          {
            uint64_t v27 = *(void *)v27;
            if (!v27) {
              goto LABEL_36;
            }
          }
          syslog(5, "EDR - server remove client = %d type = %d port = %d\n", *(_DWORD *)(v27 + 24), *(_DWORD *)(v27 + 32), v6);
          uint64_t v29 = *(unsigned int *)(v27 + 36);
          if (v29)
          {
            sub_1CFE21B5C(v29);
            *(_DWORD *)(v27 + 36) = 0;
          }
          uint64_t v27 = sub_1CFE21E5C(v28, (uint64_t *)v27);
        }
        while (v27);
      }
LABEL_36:
      pthread_rwlock_unlock(v26);
      sub_1CFE21744(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v9, 0, 0, 0, 0, 0, 0, 0);
      break;
    case 2:
      unsigned int v59 = 0;
      int v60 = 0;
      *(_OWORD *)previous = 0u;
      long long v66 = 0u;
      sub_1CFE21744(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), HIDWORD(v64), HIDWORD(v62), (uint64_t)v67, v62, (uint64_t)&v60, (uint64_t)previous, (uint64_t)&v59, 0);
      if (v61 == 1) {
        sub_1CFE21844(v63, v60, previous, v59, 2);
      }
      break;
    case 1:
      int v2 = v64;
      int v3 = HIDWORD(v64);
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      if (v64 == __PAIR64__(*(_DWORD *)(v4 + 8), *(_DWORD *)(v4 + 12)))
      {
        syslog(5, "EDR - server local client = %d type = %d port = %d\n", HIDWORD(v64), HIDWORD(v62), v63);
        return;
      }
      int v11 = HIDWORD(v62);
      mach_port_name_t v10 = v63;
      previous[0] = HIDWORD(v62);
      BOOL v12 = (pthread_rwlock_t *)(v4 + 232);
      pthread_rwlock_wrlock((pthread_rwlock_t *)(v4 + 232));
      uint64_t v13 = (void **)(v4 + 40);
      uint64_t v14 = sub_1CFE14E64((void *)(v4 + 40), (int *)previous);
      if (v14 != v15)
      {
        char v16 = 0;
        do
        {
          v16 |= *((_DWORD *)v14 + 9) == v10;
          uint64_t v14 = (uint64_t *)*v14;
        }
        while (v14 != v15);
        if (v16) {
          goto LABEL_108;
        }
      }
      uint64_t v17 = operator new(0x38uLL);
      void v17[4] = v11;
      v17[6] = v3;
      v17[7] = v2;
      v17[8] = v11;
      v17[9] = v10;
      *((void *)v17 + 5) = 0;
      *((void *)v17 + 6) = 0;
      *(void *)uint64_t v17 = 0;
      *((void *)v17 + 1) = v11;
      unint64_t v18 = *(void *)(v4 + 48);
      float v19 = (float)(unint64_t)(*(void *)(v4 + 64) + 1);
      float v20 = *(float *)(v4 + 72);
      if (v18 && (float)(v20 * (float)v18) >= v19) {
        goto LABEL_71;
      }
      BOOL v21 = (v18 & (v18 - 1)) == 0;
      if (v18 < 3) {
        BOOL v21 = 0;
      }
      unint64_t v22 = (2 * v18) | !v21;
      unint64_t v23 = vcvtps_u32_f32(v19 / v20);
      if (v22 <= v23) {
        int8x8_t prime = (int8x8_t)v23;
      }
      else {
        int8x8_t prime = (int8x8_t)v22;
      }
      if (*(void *)&prime == 1)
      {
        int8x8_t prime = (int8x8_t)2;
      }
      else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
      {
        int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
        unint64_t v18 = *(void *)(v4 + 48);
      }
      if (*(void *)&prime > v18) {
        goto LABEL_40;
      }
      if (*(void *)&prime < v18)
      {
        unint64_t v36 = vcvtps_u32_f32((float)*(unint64_t *)(v4 + 64) / *(float *)(v4 + 72));
        if (v18 < 3 || (uint8x8_t v37 = (uint8x8_t)vcnt_s8((int8x8_t)v18), v37.i16[0] = vaddlv_u8(v37), v37.u32[0] > 1uLL))
        {
          unint64_t v36 = std::__next_prime(v36);
        }
        else
        {
          uint64_t v38 = 1 << -(char)__clz(v36 - 1);
          if (v36 >= 2) {
            unint64_t v36 = v38;
          }
        }
        if (*(void *)&prime <= v36) {
          int8x8_t prime = (int8x8_t)v36;
        }
        if (*(void *)&prime < v18)
        {
          if (prime)
          {
LABEL_40:
            if (*(void *)&prime >> 61) {
              sub_1CFE16B00();
            }
            float v30 = operator new(8 * *(void *)&prime);
            int v31 = *v13;
            NSObject *v13 = v30;
            if (v31) {
              operator delete(v31);
            }
            uint64_t v32 = 0;
            *(int8x8_t *)(v4 + 48) = prime;
            do
              *((void *)*v13 + v32++) = 0;
            while (*(void *)&prime != v32);
            int v33 = *(uint64_t ***)(v4 + 56);
            if (v33)
            {
              unint64_t v34 = (unint64_t)v33[1];
              uint8x8_t v35 = (uint8x8_t)vcnt_s8(prime);
              v35.i16[0] = vaddlv_u8(v35);
              if (v35.u32[0] > 1uLL)
              {
                if (v34 >= *(void *)&prime) {
                  v34 %= *(void *)&prime;
                }
              }
              else
              {
                v34 &= *(void *)&prime - 1;
              }
              *((void *)*v13 + v34) = v4 + 56;
              for (uint64_t i = *v33; *v33; uint64_t i = *v33)
              {
                unint64_t v40 = i[1];
                if (v35.u32[0] > 1uLL)
                {
                  if (v40 >= *(void *)&prime) {
                    v40 %= *(void *)&prime;
                  }
                }
                else
                {
                  v40 &= *(void *)&prime - 1;
                }
                if (v40 == v34)
                {
                  int v33 = (uint64_t **)i;
                }
                else
                {
                  double v41 = i;
                  if (*((void *)*v13 + v40))
                  {
                    do
                    {
                      long long v42 = v41;
                      double v41 = (uint64_t *)*v41;
                    }
                    while (v41 && *((_DWORD *)i + 4) == *((_DWORD *)v41 + 4));
                    *int v33 = v41;
                    *long long v42 = **((void **)*v13 + v40);
                    **((void **)*v13 + v40) = i;
                  }
                  else
                  {
                    *((void *)*v13 + v40) = v33;
                    int v33 = (uint64_t **)i;
                    unint64_t v34 = v40;
                  }
                }
              }
            }
            unint64_t v18 = (unint64_t)prime;
            goto LABEL_70;
          }
          int v58 = *v13;
          NSObject *v13 = 0;
          BOOL v12 = (pthread_rwlock_t *)(v4 + 232);
          if (v58) {
            operator delete(v58);
          }
          unint64_t v18 = 0;
          *(void *)(v4 + 48) = 0;
LABEL_71:
          uint8x8_t v43 = (uint8x8_t)vcnt_s8((int8x8_t)v18);
          v43.i16[0] = vaddlv_u8(v43);
          if (v43.u32[0] > 1uLL)
          {
            unint64_t v44 = v11;
            if (v18 <= v11) {
              unint64_t v44 = v11 % v18;
            }
          }
          else
          {
            unint64_t v44 = (v18 - 1) & v11;
          }
          BOOL v45 = *v13;
          size_t v46 = (uint64_t *)*((void *)*v13 + v44);
          if (v46)
          {
            int v47 = 0;
            do
            {
              uint64_t v48 = v46;
              size_t v46 = (uint64_t *)*v46;
              if (!v46) {
                break;
              }
              unint64_t v49 = v46[1];
              if (v43.u32[0] > 1uLL)
              {
                unint64_t v50 = v46[1];
                if (v49 >= v18) {
                  unint64_t v50 = v49 % v18;
                }
              }
              else
              {
                unint64_t v50 = v49 & (v18 - 1);
              }
              if (v50 != v44) {
                break;
              }
              BOOL v51 = v49 == v11 && *((_DWORD *)v46 + 4) == v17[4];
              int v52 = v47 & !v51;
              v47 |= v51;
            }
            while (v52 != 1);
          }
          else
          {
            uint64_t v48 = 0;
          }
          unint64_t v53 = *((void *)v17 + 1);
          if (v43.u32[0] > 1uLL)
          {
            if (v53 >= v18) {
              v53 %= v18;
            }
          }
          else
          {
            v53 &= v18 - 1;
          }
          if (v48)
          {
            *(void *)uint64_t v17 = *v48;
            *uint64_t v48 = v17;
            if (!*(void *)v17) {
              goto LABEL_107;
            }
            unint64_t v54 = *(void *)(*(void *)v17 + 8);
            if (v43.u32[0] > 1uLL)
            {
              if (v54 >= v18) {
                v54 %= v18;
              }
            }
            else
            {
              v54 &= v18 - 1;
            }
            if (v54 == v53) {
              goto LABEL_107;
            }
          }
          else
          {
            *(void *)uint64_t v17 = *(void *)(v4 + 56);
            *(void *)(v4 + 56) = v17;
            v45[v53] = v4 + 56;
            if (!*(void *)v17)
            {
LABEL_107:
              ++*(void *)(v4 + 64);
              syslog(5, "EDR - server insert client = %d type = %d port = %d\n", v3, v11, v10);
LABEL_108:
              pthread_rwlock_unlock(v12);
              previous[0] = 0;
              mach_error_t v55 = mach_port_request_notification(*MEMORY[0x1E4F14960], v10, 72, 1u, *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 20), 0x15u, previous);
              mach_error_t v56 = v55;
              if (v55)
              {
                int v57 = mach_error_string(v55);
                syslog(3, "EDR - %s: mach_port_request_notification() => %s (%d)\n", "start_notification_service_block_invoke", v57, v56);
              }
              return;
            }
            unint64_t v54 = *(void *)(*(void *)v17 + 8);
            if (v43.u32[0] > 1uLL)
            {
              if (v54 >= v18) {
                v54 %= v18;
              }
            }
            else
            {
              v54 &= v18 - 1;
            }
          }
          *((void *)*v13 + v54) = v17;
          goto LABEL_107;
        }
        unint64_t v18 = *(void *)(v4 + 48);
      }
LABEL_70:
      BOOL v12 = (pthread_rwlock_t *)(v4 + 232);
      goto LABEL_71;
    default:
      return;
  }
}

void sub_1CFE21464(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1CFE21480(mach_port_name_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, mach_port_t *a5, mach_msg_size_t *a6, void *a7, mach_port_t *a8, mach_port_t *a9)
{
  mach_msg_return_t v18;
  mach_msg_return_t v19;
  char *v20;
  uint64_t v21;
  _DWORD *v23;
  mach_msg_id_t msgh_id;
  size_t msgh_local_port;
  mach_port_t *p_msgh_remote_port;
  mach_msg_header_t *msg;
  mach_msg_header_t *v28;

  sub_1CFE21CFC(&msg, 0x1000uLL);
  uint64_t v17 = msg;
  unint64_t v18 = mach_msg(msg, 50331650, 0, v28 - msg, a1, 0, 0);
  float v19 = v18;
  if (v18)
  {
    float v20 = mach_error_string(v18);
    syslog(3, "EDR - %s: mach_msg() => %s (%d), port: %d, local port: %d", "recv_msg", v20, v19, *a5, a1);
LABEL_3:
    BOOL v21 = 0xFFFFFFFFLL;
    goto LABEL_4;
  }
  unint64_t v23 = (mach_msg_bits_t *)((char *)&v17->msgh_bits + ((v17->msgh_size + 3) & 0x1FFFFFFFCLL));
  if (!*v23 && v23[1] >= 0x34u)
  {
    *a2 = v23[10];
    *a3 = v23[12];
  }
  *a4 = 0;
  if ((v17->msgh_bits & 0x80000000) == 0)
  {
    msgh_id = v17->msgh_id;
    if (msgh_id)
    {
      if (msgh_id != 72 || v23[3])
      {
        syslog(3, "EDR - %s: unknown message id = %d\n", "recv_msg", msgh_id);
LABEL_30:
        mach_msg_destroy(v17);
        BOOL v21 = 0;
        goto LABEL_4;
      }
      p_msgh_remote_port = &v17[1].msgh_remote_port;
      *a4 = 3;
LABEL_29:
      *a5 = *p_msgh_remote_port;
      goto LABEL_30;
    }
    *a4 = 2;
    *a5 = v17->msgh_remote_port;
    *a6 = v17[1].msgh_size;
    *a9 = v17[1].msgh_remote_port;
    p_msgh_remote_port = &v17[1].msgh_local_port;
    msgh_local_port = v17[1].msgh_local_port;
    if ((msgh_local_port & 0x80000000) != 0)
    {
      syslog(3, "EDR - %s: data size negative %d\n", "recv_msg", msgh_local_port);
    }
    else if (msgh_local_port <= 0x20)
    {
      if ((unint64_t)v17->msgh_size - 40 >= msgh_local_port)
      {
        if (!a7) {
          goto LABEL_30;
        }
        memcpy(a7, &v17[1].msgh_voucher_port, msgh_local_port);
        a5 = a8;
        goto LABEL_29;
      }
      syslog(3, "EDR - %s: data size %d exceeds message data size %ud\n");
    }
    else
    {
      syslog(3, "EDR - %s: data size %d exceeds max data size %d\n");
    }
    mach_msg_destroy(v17);
    goto LABEL_3;
  }
  if (!v17[1].msgh_bits || HIWORD(v17[1].msgh_local_port) << 16 != 1114112)
  {
    syslog(3, "EDR - %s: invalid port descriptor\n", "recv_msg");
    mach_msg_destroy(v17);
    goto LABEL_3;
  }
  BOOL v21 = 0;
  *a4 = 1;
  *a5 = v17[1].msgh_size;
LABEL_4:
  if (msg)
  {
    float v28 = msg;
    operator delete(msg);
  }
  return v21;
}

void sub_1CFE2171C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1CFE21744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  v27[0] = a3;
  char v16 = (pthread_rwlock_t *)(a1 + 232);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 232));
  uint64_t v17 = (void *)(a1 + 80);
  int v26 = 0;
  unint64_t v18 = sub_1CFE1513C((void *)(a1 + 80), &v26);
  if (v18)
  {
    float v19 = (long long *)&v25;
  }
  else
  {
    if (!sub_1CFE1513C(v17, v27)) {
      goto LABEL_6;
    }
    float v19 = (long long *)&v24;
  }
  long long v20 = *(_OWORD *)(v18 + 5);
  long long *v19 = *(_OWORD *)(v18 + 3);
  v19[1] = v20;
  long long v21 = *(_OWORD *)(v18 + 9);
  v19[2] = *(_OWORD *)(v18 + 7);
  v19[3] = v21;
  sub_1CFE21FB0(v19, a2, a3, a4, a5, a6, a7, a8, a9);
LABEL_6:
  return pthread_rwlock_unlock(v16);
}

uint64_t sub_1CFE21844(uint64_t a1, int a2, const void *a3, unsigned int a4, int a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a4 >= 0x21)
  {
    syslog(3, "EDR - %s: data size %d exceeds max data size %d\n");
    return 0xFFFFFFFFLL;
  }
  mach_port_t v6 = a1;
  if (!a1)
  {
    syslog(3, "EDR - %s: no remote port\n");
    return 0xFFFFFFFFLL;
  }
  int v16 = 0;
  mach_error_t v10 = MEMORY[0x1D25E0C10](*MEMORY[0x1E4F14960], a1, 0, &v16);
  if (v10)
  {
    mach_error_t v11 = v10;
    BOOL v12 = mach_error_string(v10);
    syslog(3, "EDR - %s: mach_port_get_refs() => %s (%d)\n", "send_data", v12, v11);
  }
  if (!v16)
  {
    syslog(3, "EDR - %s: remote port %d has no send right\n", "send_data", v6);
    return 1;
  }
  long long v18 = 0u;
  memset(v19, 0, sizeof(v19));
  *(void *)&msg.msgh_bits = 0x4800000013;
  msg.msgh_remote_port = v6;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0;
  DWORD1(v18) = a2;
  if (a3)
  {
    memcpy(v19, a3, a4);
    HIDWORD(v18) = a4;
  }
  DWORD2(v18) = a5;
  uint64_t result = mach_msg(&msg, 17, 0x48u, 0, 0, 1u, 0);
  if (result)
  {
    int v14 = result;
    uint64_t v15 = mach_error_string(result);
    syslog(3, "EDR - %s: mach_msg() => %s (%d), remote port: %d", "send_data", v15, v14, v6);
    if ((v14 - 268435459) <= 1) {
      mach_msg_destroy(&msg);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_1CFE21A28(uint64_t a1)
{
  pthread_rwlock_rdlock((pthread_rwlock_t *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 232));
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  int v3 = *(uint64_t **)(v2 + 56);
  if (v3)
  {
    do
    {
      if (*((_DWORD *)v3 + 9))
      {
        syslog(5, "EDR - server free client port = %d\n", *((_DWORD *)v3 + 9));
        sub_1CFE21B5C(*((unsigned int *)v3 + 9));
        *((_DWORD *)v3 + 9) = 0;
      }
      int v3 = (uint64_t *)*v3;
    }
    while (v3);
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  sub_1CFE20BD4((void *)(v2 + 40));
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v5 = *(NSObject **)(v4 + 32);
  if (v5)
  {
    dispatch_release(v5);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 32) = 0;
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  if (*(_DWORD *)(v4 + 20))
  {
    syslog(5, "EDR - server delete server port = %d\n", *(_DWORD *)(v4 + 20));
    sub_1CFE21B5C(*(unsigned int *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 20));
    *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 20) = 0;
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return pthread_rwlock_unlock((pthread_rwlock_t *)(v4 + 232));
}

void sub_1CFE21B5C(uint64_t a1)
{
  mach_port_name_t v1 = a1;
  int v6 = 0;
  uint64_t v2 = (ipc_space_t *)MEMORY[0x1E4F14960];
  if (MEMORY[0x1D25E0C10](*MEMORY[0x1E4F14960], a1, 4, &v6) != 15)
  {
    mach_error_t v3 = mach_port_deallocate(*v2, v1);
    if (v3)
    {
      mach_error_t v4 = v3;
      uint64_t v5 = mach_error_string(v3);
      syslog(3, "EDR - %s: mach_port_deallocate() => %s (%d)\n", "release_port", v5, v4);
    }
  }
}

void sub_1CFE21BE4(uint64_t a1)
{
  int v6 = 0;
  uint64_t v2 = (unsigned int *)MEMORY[0x1E4F14960];
  if (MEMORY[0x1D25E0C10](*MEMORY[0x1E4F14960], a1, 4, &v6) != 15)
  {
    mach_error_t v3 = MEMORY[0x1D25E0C00](*v2, a1);
    if (v3)
    {
      mach_error_t v4 = v3;
      uint64_t v5 = mach_error_string(v3);
      syslog(3, "EDR - %s: mach_port_destroy() => %s (%d)\n", "destroy_port", v5, v4);
    }
  }
}

void sub_1CFE21C6C()
{
  kern_return_t v0;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];

  task_info_outCnt = 8;
  uint64_t v0 = task_info(*MEMORY[0x1E4F14960], 0xFu, task_info_out, &task_info_outCnt);
  if (!v0) {
    operator new();
  }
  syslog(3, "EDR - %s: failed to get audit token for current process: %llx", "get_audit_token_self_block_invoke", v0);
}

void *sub_1CFE21CFC(void *a1, size_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1CFE21D70(a1, a2);
    mach_error_t v4 = (char *)a1[1];
    uint64_t v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_1CFE21D54(_Unwind_Exception *exception_object)
{
  mach_error_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1CFE21D70(void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    sub_1CFE21DB4();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void sub_1CFE21DB4()
{
}

void sub_1CFE21DCC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1CFE21E28(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E6872D60, MEMORY[0x1E4FBA1C8]);
}

void sub_1CFE21E14(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1CFE21E28(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

uint64_t sub_1CFE21E5C(void *a1, uint64_t *__p)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  uint64_t v4 = *__p;
  unint64_t v3 = __p[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v2);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v3 >= *(void *)&v2) {
      v3 %= *(void *)&v2;
    }
  }
  else
  {
    v3 &= *(void *)&v2 - 1;
  }
  int v6 = *(uint64_t **)(*a1 + 8 * v3);
  do
  {
    uint64_t v7 = v6;
    int v6 = (uint64_t *)*v6;
  }
  while (v6 != __p);
  if (v7 == a1 + 2) {
    goto LABEL_31;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v2) {
      v8 %= *(void *)&v2;
    }
  }
  else
  {
    v8 &= *(void *)&v2 - 1;
  }
  uint64_t v9 = *__p;
  if (v8 != v3)
  {
LABEL_31:
    if (v4)
    {
      unint64_t v10 = *(void *)(v4 + 8);
      if (v5.u32[0] > 1uLL)
      {
        unint64_t v11 = *(void *)(v4 + 8);
        if (v10 >= *(void *)&v2) {
          unint64_t v11 = v10 % *(void *)&v2;
        }
      }
      else
      {
        unint64_t v11 = v10 & (*(void *)&v2 - 1);
      }
      uint64_t v9 = *__p;
      if (v11 == v3) {
        goto LABEL_22;
      }
    }
    *(void *)(*a1 + 8 * v3) = 0;
    uint64_t v9 = *__p;
  }
  if (!v9) {
    goto LABEL_28;
  }
  unint64_t v10 = *(void *)(v9 + 8);
LABEL_22:
  if (v5.u32[0] > 1uLL)
  {
    if (v10 >= *(void *)&v2) {
      v10 %= *(void *)&v2;
    }
  }
  else
  {
    v10 &= *(void *)&v2 - 1;
  }
  if (v10 != v3)
  {
    *(void *)(*a1 + 8 * v10) = v7;
    uint64_t v9 = *__p;
  }
LABEL_28:
  *uint64_t v7 = v9;
  void *__p = 0;
  --a1[3];
  operator delete(__p);
  return v4;
}

void sub_1CFE21FB0(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if ((a9 & 1) != 0 || !*((unsigned char *)a1 + 56))
  {
    uint64_t v9 = *(NSObject **)a1;
    if (*(void *)a1)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 0x40000000;
      block[2] = sub_1CFE220C0;
      block[3] = &unk_1E68752D8;
      long long v10 = a1[1];
      long long v16 = *a1;
      long long v17 = v10;
      long long v11 = a1[3];
      long long v18 = a1[2];
      long long v19 = v11;
      int v24 = a2;
      int v25 = a3;
      int v26 = a5;
      uint64_t v20 = a4;
      uint64_t v21 = a6;
      uint64_t v22 = a7;
      uint64_t v23 = a8;
      dispatch_sync(v9, block);
    }
    else
    {
      uint64_t v12 = *((void *)a1 + 2);
      if (v12)
      {
        (*(void (**)(uint64_t))(v12 + 16))(v12);
      }
      else
      {
        uint64_t v13 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*((void *)a1 + 5);
        if (v13)
        {
          uint64_t v14 = *((void *)a1 + 6);
          v13(a2, a3, a4, a5, a6, a7, a8, v14);
        }
      }
    }
  }
}

uint64_t sub_1CFE220C0(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 48);
  if (v1) {
    return (*(uint64_t (**)(uint64_t, void, void, void, void, void, void, void, void))(v1 + 16))(v1, *(unsigned int *)(result + 128), *(unsigned int *)(result + 132), *(void *)(result + 96), *(unsigned int *)(result + 136), *(void *)(result + 104), *(void *)(result + 112), *(void *)(result + 120), *(void *)(result + 64));
  }
  int8x8_t v2 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(result + 72);
  if (v2)
  {
    uint64_t v3 = *(unsigned int *)(result + 132);
    uint64_t v4 = *(unsigned int *)(result + 136);
    uint64_t v5 = *(void *)(result + 96);
    uint64_t v6 = *(void *)(result + 104);
    uint64_t v7 = *(void *)(result + 112);
    uint64_t v8 = *(void *)(result + 120);
    uint64_t v9 = *(void *)(result + 80);
    uint64_t v10 = *(unsigned int *)(result + 128);
    return v2(v10, v3, v5, v4, v6, v7, v8, v9);
  }
  return result;
}

double sub_1CFE22148(uint64_t a1)
{
  *(void *)a1 = 0;
  double result = NAN;
  *(void *)(a1 + 8) = -1;
  *(_DWORD *)(a1 + 16) = -1;
  *(_OWORD *)(a1 + 20) = 0u;
  *(_OWORD *)(a1 + 36) = 0u;
  *(_OWORD *)(a1 + 52) = 0u;
  *(void *)(a1 + 68) = 0x3F80000000000000;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_DWORD *)(a1 + 112) = 1065353216;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = -1;
  *(_DWORD *)(a1 + 136) = -1;
  *(void *)(a1 + 148) = 0;
  *(void *)(a1 + 140) = 0;
  *(_DWORD *)(a1 + 156) = 0;
  *(void *)(a1 + 160) = -1;
  *(_DWORD *)(a1 + 168) = -1;
  *(_OWORD *)(a1 + 204) = 0u;
  *(_OWORD *)(a1 + 188) = 0u;
  *(_OWORD *)(a1 + 172) = 0u;
  *(void *)(a1 + 220) = 0x3F80000000000000;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 400) = 0u;
  *(_OWORD *)(a1 + 416) = 0u;
  *(void *)(a1 + 232) = 766030772;
  return result;
}

uint64_t sub_1CFE221D8(uint64_t a1)
{
  int8x8_t v2 = (pthread_rwlock_t *)(a1 + 232);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 232));
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3)
  {
    uint64_t v4 = (void *)(a1 + 40);
    uint64_t v5 = (unsigned int *)MEMORY[0x1E4F14960];
    do
    {
      while (1)
      {
        int v11 = 0;
        mach_error_t v6 = MEMORY[0x1D25E0C10](*v5, *(unsigned int *)(v3 + 36), 0, &v11);
        if (v6)
        {
          mach_error_t v7 = v6;
          uint64_t v8 = mach_error_string(v6);
          syslog(3, "EDR - %s: mach_port_get_refs() => %s (%d)\n", "server_remove_client_with_no_send_right", v8, v7);
        }
        if (!v11) {
          break;
        }
        uint64_t v3 = *(void *)v3;
        if (!v3) {
          return pthread_rwlock_unlock(v2);
        }
      }
      syslog(5, "EDR - server remove client = %d type = %d port = %d\n", *(_DWORD *)(v3 + 24), *(_DWORD *)(v3 + 32), *(_DWORD *)(v3 + 36));
      uint64_t v9 = *(unsigned int *)(v3 + 36);
      if (v9)
      {
        sub_1CFE21B5C(v9);
        *(_DWORD *)(v3 + 36) = 0;
      }
      uint64_t v3 = sub_1CFE21E5C(v4, (uint64_t *)v3);
    }
    while (v3);
  }
  return pthread_rwlock_unlock(v2);
}

uint64_t sub_1CFE222E4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void, void))(result + 16))(result, *(unsigned int *)(a1 + 104), *(void *)(a1 + 96), *(unsigned int *)(a1 + 108), *(void *)(a1 + 64));
  }
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 72);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 96);
    uint64_t v5 = *(unsigned int *)(a1 + 104);
    uint64_t v6 = *(unsigned int *)(a1 + 108);
    uint64_t v7 = *(void *)(a1 + 80);
    return v3(v5, v4, v6, v7);
  }
  return result;
}

uint64_t sub_1CFE22354(uint64_t a1, int a2, const void *a3, unsigned int a4, uint64_t a5, _DWORD *a6, _DWORD *a7, _DWORD *a8, void *__dst, _DWORD *a10, _DWORD *a11, mach_msg_timeout_t timeout)
{
  mach_msg_return_t v26;
  mach_msg_return_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v31;
  _DWORD *v32;
  int v33;
  int v35;
  unsigned char msg[36];
  size_t __n[2];
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  uint64_t v42;
  uint64_t v43;

  uint8x8_t v43 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    syslog(3, "EDR - %s: no remote port\n");
    return 0xFFFFFFFFLL;
  }
  if (!a5)
  {
    syslog(3, "EDR - %s: no local port\n");
    return 0xFFFFFFFFLL;
  }
  unsigned int v18 = a1;
  uint8x8_t v35 = 0;
  long long v19 = (unsigned int *)MEMORY[0x1E4F14960];
  mach_error_t v20 = MEMORY[0x1D25E0C10](*MEMORY[0x1E4F14960], a1, 0, &v35);
  if (v20)
  {
    mach_error_t v21 = v20;
    uint64_t v22 = mach_error_string(v20);
    syslog(3, "EDR - %s: mach_port_get_refs() => %s (%d)\n", "transceive_data", v22, v21);
  }
  if (!v35)
  {
    syslog(3, "EDR - %s: remote port %d has no send right\n", "transceive_data", v18);
    return 1;
  }
  uint8x8_t v35 = 0;
  mach_error_t v23 = MEMORY[0x1D25E0C10](*v19, a5, 1, &v35);
  if (v23)
  {
    mach_error_t v24 = v23;
    int v25 = mach_error_string(v23);
    syslog(3, "EDR - %s: mach_port_get_refs() => %s (%d)\n", "transceive_data", v25, v24);
  }
  if (!v35)
  {
    syslog(3, "EDR - %s: local port %d has no receive right\n");
    return 0xFFFFFFFFLL;
  }
  memset(&msg[4], 0, 32);
  long long v42 = 0;
  double v41 = 0u;
  unint64_t v40 = 0u;
  double v39 = 0u;
  uint64_t v38 = 0u;
  *(_OWORD *)__n = 0u;
  *(void *)&msg[8] = __PAIR64__(a5, v18);
  *(_DWORD *)mach_msg_header_t msg = 4883;
  *(_DWORD *)&msg[28] = a2;
  if (a3)
  {
    memcpy((char *)__n + 4, a3, a4);
    LODWORD(__n[0]) = a4;
  }
  *(_DWORD *)&msg[32] = 1;
  int v26 = mach_msg((mach_msg_header_t *)msg, 50331923, 0x48u, 0x7Cu, a5, timeout, 0);
  if (!v26)
  {
    int v31 = *(unsigned int *)&msg[4];
    uint64_t v32 = &msg[(*(unsigned int *)&msg[4] + 3) & 0x1FFFFFFFCLL];
    if (!*v32 && v32[1] >= 0x34u)
    {
      *a6 = v32[10];
      *a7 = v32[12];
    }
    *a8 = *(_DWORD *)&msg[28];
    if (__dst)
    {
      int v33 = __n[0];
      if (LODWORD(__n[0]) >= 0x21)
      {
        syslog(3, "EDR - %s: data size %d exceeds max data size %d\n");
LABEL_28:
        uint64_t v29 = 0xFFFFFFFFLL;
LABEL_31:
        mach_msg_destroy((mach_msg_header_t *)msg);
        return v29;
      }
      if (v31 - 40 < (unint64_t)LODWORD(__n[0]))
      {
        syslog(3, "EDR - %s: data size %d exceeds message data size %u\n");
        goto LABEL_28;
      }
      memcpy(__dst, (char *)__n + 4, LODWORD(__n[0]));
      *a10 = v33;
    }
    uint64_t v29 = 0;
    *a11 = *(_DWORD *)&msg[32];
    goto LABEL_31;
  }
  uint64_t v27 = v26;
  float v28 = mach_error_string(v26);
  syslog(3, "EDR - %s: mach_msg() => %s (%d), remote port: %d, local port: %d", "transceive_data", v28, v27, v18, a5);
  uint64_t v29 = 0xFFFFFFFFLL;
  if ((v27 - 268435459) < 2) {
    goto LABEL_31;
  }
  return v29;
}

uint64_t sub_1CFE22680(uint64_t a1, unsigned int a2, uint64_t a3, int a4, const void *a5, uint64_t a6, const void *a7, uint64_t a8, char a9)
{
  uint64_t v15 = sub_1CFE227A8("com.apple.libEDR.Notification", a1, a2);
  if (a5)
  {
    sub_1CFE230BC(a1, a3, a4, a5, a6, 0, 0, a9);
    if (a9) {
      long long v16 = "true";
    }
    else {
      long long v16 = "false";
    }
    syslog(5, "EDR - client insert callback block client = %d type = %d block = %p local_olny = %s\n", *(_DWORD *)(a1 + 160), a4, a5, v16);
  }
  if (a7)
  {
    sub_1CFE230BC(a1, a3, a4, 0, 0, (uint64_t)a7, a8, a9);
    if (a9) {
      long long v17 = "true";
    }
    else {
      long long v17 = "false";
    }
    syslog(5, "EDR - client insert callback function client = %d type = %d function = %p local_olny = %s\n", *(_DWORD *)(a1 + 160), a4, a7, v17);
  }
  return v15;
}

uint64_t sub_1CFE227A8(const char *a1, uint64_t a2, unsigned int a3)
{
  if (a2)
  {
    uint64_t v3 = a2;
    uint64_t v47 = 0;
    uint64_t v48 = &v47;
    uint64_t v49 = 0x2000000000;
    uint64_t v50 = a2;
    if (*(_DWORD *)(a2 + 140)) {
      goto LABEL_3;
    }
    pthread_rwlock_wrlock((pthread_rwlock_t *)(a2 + 232));
    int v11 = v48;
    *(void *)(v48[3] + 120) = a1;
    uint64_t v12 = v11[3];
    *(_DWORD *)(v12 + 140) = 0;
    pthread_rwlock_unlock((pthread_rwlock_t *)(v12 + 232));
    syslog(5, "EDR - client setup_remote_port\n");
    uint64_t v13 = v48[3];
    if (qword_1EBD11A28 != -1) {
      dispatch_once(&qword_1EBD11A28, &unk_1F2686E78);
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBD0F968, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1EBD0F968))
    {
      __cxa_guard_release(&qword_1EBD0F968);
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBD0F960, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1EBD0F960))
    {
      __cxa_guard_release(&qword_1EBD0F960);
    }
    mach_port_t special_port = 0;
    uint64_t v14 = (unsigned int *)MEMORY[0x1E4F14960];
    mach_error_t v15 = task_get_special_port(*MEMORY[0x1E4F14960], 4, &special_port);
    mach_error_t v16 = v15;
    if (v15)
    {
      long long v17 = mach_error_string(v15);
      syslog(3, "EDR - %s: task_get_bootstrap_port() => %s (%d)\n", "setup_remote_port", v17, v16);
    }
    else
    {
      syslog(5, "EDR - Bootstrap Port: %d\n", special_port);
      mach_port_t sp = 0;
      mach_error_t v23 = bootstrap_look_up(special_port, a1, &sp);
      mach_error_t v24 = v23;
      if (v23)
      {
        int v25 = mach_error_string(v23);
        syslog(3, "EDR - %s: bootstrap_look_up() => %s (%d)\n", "setup_remote_port", v25, v24);
      }
      else
      {
        mach_absolute_time();
        int v51 = 0;
        mach_error_t v26 = MEMORY[0x1D25E0C10](*v14, sp, 4, &v51);
        mach_error_t v27 = v26;
        if (!(v26 | v51))
        {
          syslog(5, "EDR - Remote Port: %d (%s)\n", sp, a1);
          *(_DWORD *)(v13 + 140) = sp;
          uint64_t v3 = v48[3];
LABEL_3:
          int v4 = *(_DWORD *)(v3 + 8);
          if (v4 == sub_1CFE20C3C())
          {
            int v5 = *(_DWORD *)(v48[3] + 12);
            if (v5 == sub_1CFE20C90())
            {
              *(_DWORD *)(v48[3] + 160) = sub_1CFE20C3C();
              uint64_t v6 = 0;
              *(_DWORD *)(v48[3] + 164) = sub_1CFE20C90();
LABEL_37:
              _Block_object_dispose(&v47, 8);
              return v6;
            }
          }
          uint64_t v7 = v48[3];
          int v8 = *(_DWORD *)(v7 + 172);
          if (v8)
          {
            sub_1CFE22DA8(*(_DWORD *)(v7 + 140), v8);
LABEL_9:
            uint64_t v6 = 0;
            goto LABEL_37;
          }
          *(_DWORD *)(v7 + 172) = 0;
          syslog(5, "EDR - client setup_local_port\n");
          if (!sub_1CFE20A14(0, (mach_port_name_t *)(v48[3] + 172)))
          {
            *(_DWORD *)(v48[3] + 160) = sub_1CFE20C3C();
            int v18 = sub_1CFE20C90();
            long long v19 = (_DWORD *)v48[3];
            v19[41] = v18;
            if (!sub_1CFE22DA8(v19[35], v19[43]))
            {
              mach_port_t special_port = 0;
              mach_error_t v20 = mach_port_request_notification(*MEMORY[0x1E4F14960], *(_DWORD *)(v48[3] + 140), 72, 1u, *(_DWORD *)(v48[3] + 172), 0x15u, &special_port);
              mach_error_t v21 = v20;
              if (v20)
              {
                uint64_t v22 = mach_error_string(v20);
                syslog(3, "EDR - %s: mach_port_request_notification() => %s (%d)\n", "initialize_client_context", v22, v21);
              }
              else
              {
                pthread_rwlock_wrlock((pthread_rwlock_t *)(v48[3] + 232));
                dispatch_queue_global_t global_queue = dispatch_get_global_queue(2, 0);
                unint64_t v34 = v48;
                *(void *)(v48[3] + 176) = global_queue;
                uint64_t v35 = v34[3];
                unint64_t v36 = *(NSObject **)(v35 + 176);
                if (v36)
                {
                  dispatch_source_t v37 = dispatch_source_create(MEMORY[0x1E4F14458], *(unsigned int *)(v35 + 172), 0, v36);
                  uint64_t v38 = v48;
                  *(void *)(v48[3] + 184) = v37;
                  uint64_t v35 = v38[3];
                  double v39 = *(NSObject **)(v35 + 184);
                  if (v39)
                  {
                    dispatch_retain(v39);
                    pthread_rwlock_unlock((pthread_rwlock_t *)(v48[3] + 232));
                    unint64_t v40 = *(NSObject **)(v48[3] + 184);
                    handler[0] = MEMORY[0x1E4F143A8];
                    handler[1] = 0x40000000;
                    handler[2] = sub_1CFE22E70;
                    handler[3] = &unk_1E6875340;
                    void handler[4] = &v47;
                    dispatch_source_set_event_handler(v40, handler);
                    double v41 = *(NSObject **)(v48[3] + 184);
                    v43[0] = MEMORY[0x1E4F143A8];
                    v43[1] = 0x40000000;
                    v43[2] = sub_1CFE22FD8;
                    v43[3] = &unk_1E6875368;
                    v43[4] = &v47;
                    dispatch_source_set_cancel_handler(v41, v43);
                    dispatch_resume(*(dispatch_object_t *)(v48[3] + 184));
                    goto LABEL_9;
                  }
                }
                pthread_rwlock_unlock((pthread_rwlock_t *)(v35 + 232));
              }
            }
          }
LABEL_36:
          uint64_t v6 = 0xFFFFFFFFLL;
          goto LABEL_37;
        }
        float v28 = mach_error_string(v26);
        syslog(3, "EDR - %s: The port seems dead. mach_port_get_refs() => %s (%d), DEAD_NAME refs: %d", "setup_remote_port", v28, v27, v51);
      }
    }
    if ((a3 & 0x80000000) == 0)
    {
      int v29 = a3 - 1000;
      if (a3 < 0x3E9) {
        int v29 = -1;
      }
      if (a3) {
        int v30 = v29;
      }
      else {
        int v30 = 0;
      }
      dispatch_time_t v31 = dispatch_time(0, 1000000000);
      uint64_t v32 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 0x40000000;
      block[2] = sub_1CFE22D60;
      block[3] = &unk_1E6875318;
      void block[4] = a1;
      block[5] = v3;
      int v46 = v30;
      dispatch_after(v31, v32, block);
      uint64_t v6 = 1;
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  return 0xFFFFFFFFLL;
}

void sub_1CFE22D44(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1CFE22D60(uint64_t a1)
{
  syslog(5, "EDR - initialize client context retry\n");
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned int *)(a1 + 48);
  return sub_1CFE227A8(v2, v3, v4);
}

uint64_t sub_1CFE22DA8(mach_port_t a1, int a2)
{
  *(void *)&msg.msgh_voucher_port = 0;
  int v8 = 1;
  uint64_t v10 = 0x13000000000000;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_bits = 0x2880000013;
  int v9 = a2;
  uint64_t result = mach_msg(&msg, 17, 0x28u, 0, 0, 1u, 0);
  if (result)
  {
    int v5 = result;
    uint64_t v6 = mach_error_string(result);
    syslog(3, "EDR - %s: mach_msg() => %s (%d), remote port: %d, port: %d", "send_port", v6, v5, a1, a2);
    if ((v5 - 268435459) <= 1) {
      mach_msg_destroy(&msg);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

void sub_1CFE22E70(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  mach_port_t v3 = 0;
  memset(v8, 0, sizeof(v8));
  if (!sub_1CFE21480(*(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 172), &v7, &v6, (_DWORD *)&v5 + 1, (mach_port_t *)&v5, (mach_msg_size_t *)&v4 + 1, v8, (mach_port_t *)&v4, &v3))
  {
    if (HIDWORD(v5) == 2)
    {
      sub_1CFE14FC4(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), HIDWORD(v4), (uint64_t)v8, v4, 0);
      if (v3 == 1) {
        sub_1CFE21844(*(unsigned int *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 140), 0, 0, 0, 2);
      }
    }
    else if (HIDWORD(v5) == 3)
    {
      uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      if (*(_DWORD *)(v2 + 140))
      {
        syslog(5, "EDR - client free server port = %d\n", *(_DWORD *)(v2 + 140));
        sub_1CFE21B5C(*(unsigned int *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 140));
        *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 140) = 0;
        uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      }
      dispatch_source_cancel(*(dispatch_source_t *)(v2 + 184));
    }
  }
}

uint64_t sub_1CFE22FD8(uint64_t a1)
{
  pthread_rwlock_rdlock((pthread_rwlock_t *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 232));
  uint64_t v2 = *(_DWORD **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  syslog(5, "EDR - client cancel client = %d type = %d port = %d\n", v2[40], v2[42], v2[43]);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v4 = *(NSObject **)(v3 + 184);
  if (v4)
  {
    dispatch_release(v4);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 184) = 0;
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  uint64_t v5 = *(unsigned int *)(v3 + 172);
  if (v5)
  {
    sub_1CFE21B5C(v5);
    *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 172) = 0;
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return pthread_rwlock_unlock((pthread_rwlock_t *)(v3 + 232));
}

uint64_t sub_1CFE230B0()
{
  return mach_timebase_info(&stru_1EBD11A20);
}

uint64_t sub_1CFE230BC(uint64_t a1, uint64_t a2, int a3, const void *a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  int v63 = a3;
  mach_error_t v16 = (pthread_rwlock_t *)(a1 + 232);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 232));
  uint64_t v17 = a1;
  int v18 = (void **)(a1 + 192);
  long long v19 = sub_1CFE150F0(v18, &v63);
  if (v19 == v20) {
    goto LABEL_9;
  }
  char v21 = 0;
  do
  {
    if ((const void *)v19[6] == a4 && v19[7] == a5 && v19[8] == a6) {
      v21 |= v19[9] == a7;
    }
    long long v19 = (uint64_t *)*v19;
  }
  while (v19 != v20);
  if ((v21 & 1) == 0)
  {
LABEL_9:
    uint64_t v62 = v16;
    uint64_t v22 = _Block_copy(a4);
    mach_error_t v23 = operator new(0x58uLL);
    char v24 = a8;
    int v25 = v23;
    v23[4] = a3;
    *((void *)v23 + 3) = a2;
    v23[8] = a3;
    v23[9] = 0;
    *((void *)v23 + 5) = v22;
    *((void *)v23 + 6) = a4;
    *((void *)v23 + 7) = a5;
    *((void *)v23 + 8) = a6;
    *((void *)v23 + 9) = a7;
    *((unsigned char *)v23 + 80) = v24;
    *(_DWORD *)((char *)v23 + 81) = 0;
    v23[21] = 0;
    unint64_t v26 = a3;
    *(void *)mach_error_t v23 = 0;
    *((void *)v23 + 1) = a3;
    uint64_t v27 = v17;
    unint64_t v28 = *(void *)(v17 + 200);
    float v29 = (float)(unint64_t)(*(void *)(v17 + 216) + 1);
    float v30 = *(float *)(v17 + 224);
    if (!v28 || (float)(v30 * (float)v28) < v29)
    {
      BOOL v31 = (v28 & (v28 - 1)) == 0;
      if (v28 < 3) {
        BOOL v31 = 0;
      }
      unint64_t v32 = (2 * v28) | !v31;
      unint64_t v33 = vcvtps_u32_f32(v29 / v30);
      if (v32 <= v33) {
        int8x8_t prime = (int8x8_t)v33;
      }
      else {
        int8x8_t prime = (int8x8_t)v32;
      }
      if (*(void *)&prime == 1)
      {
        int8x8_t prime = (int8x8_t)2;
      }
      else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
      {
        int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
        unint64_t v28 = *(void *)(v27 + 200);
      }
      if (*(void *)&prime > v28) {
        goto LABEL_103;
      }
      if (*(void *)&prime >= v28) {
        goto LABEL_51;
      }
      unint64_t v41 = vcvtps_u32_f32((float)*(unint64_t *)(v27 + 216) / *(float *)(v27 + 224));
      if (v28 < 3 || (uint8x8_t v42 = (uint8x8_t)vcnt_s8((int8x8_t)v28), v42.i16[0] = vaddlv_u8(v42), v42.u32[0] > 1uLL))
      {
        unint64_t v41 = std::__next_prime(v41);
      }
      else
      {
        uint64_t v43 = 1 << -(char)__clz(v41 - 1);
        if (v41 >= 2) {
          unint64_t v41 = v43;
        }
      }
      if (*(void *)&prime <= v41) {
        int8x8_t prime = (int8x8_t)v41;
      }
      if (*(void *)&prime >= v28)
      {
        unint64_t v28 = *(void *)(v27 + 200);
        goto LABEL_51;
      }
      if (prime)
      {
LABEL_103:
        if (*(void *)&prime >> 61) {
          sub_1CFE16B00();
        }
        uint64_t v35 = operator new(8 * *(void *)&prime);
        unint64_t v36 = *v18;
        uint64_t *v18 = v35;
        if (v36) {
          operator delete(v36);
        }
        uint64_t v37 = 0;
        *(int8x8_t *)(v27 + 200) = prime;
        do
          *((void *)*v18 + v37++) = 0;
        while (*(void *)&prime != v37);
        uint64_t v38 = *(uint64_t ***)(v27 + 208);
        if (v38)
        {
          unint64_t v39 = (unint64_t)v38[1];
          uint8x8_t v40 = (uint8x8_t)vcnt_s8(prime);
          v40.i16[0] = vaddlv_u8(v40);
          if (v40.u32[0] > 1uLL)
          {
            if (v39 >= *(void *)&prime) {
              v39 %= *(void *)&prime;
            }
          }
          else
          {
            v39 &= *(void *)&prime - 1;
          }
          *((void *)*v18 + v39) = v27 + 208;
          for (uint64_t i = *v38; *v38; uint64_t i = *v38)
          {
            unint64_t v45 = i[1];
            if (v40.u32[0] > 1uLL)
            {
              if (v45 >= *(void *)&prime) {
                v45 %= *(void *)&prime;
              }
            }
            else
            {
              v45 &= *(void *)&prime - 1;
            }
            if (v45 == v39)
            {
              uint64_t v38 = (uint64_t **)i;
            }
            else
            {
              int v46 = i;
              if (*((void *)*v18 + v45))
              {
                do
                {
                  uint64_t v47 = v46;
                  int v46 = (uint64_t *)*v46;
                }
                while (v46 && *((_DWORD *)i + 4) == *((_DWORD *)v46 + 4));
                uint64_t *v38 = v46;
                *uint64_t v47 = **((void **)*v18 + v45);
                **((void **)*v18 + v45) = i;
              }
              else
              {
                *((void *)*v18 + v45) = v38;
                uint64_t v38 = (uint64_t **)i;
                unint64_t v39 = v45;
              }
            }
          }
        }
        unint64_t v28 = (unint64_t)prime;
      }
      else
      {
        mach_port_t v61 = *v18;
        uint64_t *v18 = 0;
        if (v61) {
          operator delete(v61);
        }
        unint64_t v28 = 0;
        *(void *)(v27 + 200) = 0;
      }
    }
LABEL_51:
    uint8x8_t v48 = (uint8x8_t)vcnt_s8((int8x8_t)v28);
    v48.i16[0] = vaddlv_u8(v48);
    if (v48.u32[0] > 1uLL)
    {
      unint64_t v49 = v26;
      if (v28 <= v26) {
        unint64_t v49 = v26 % v28;
      }
    }
    else
    {
      unint64_t v49 = (v28 - 1) & v26;
    }
    uint64_t v50 = *v18;
    int v51 = (uint64_t *)*((void *)*v18 + v49);
    if (v51)
    {
      int v52 = 0;
      do
      {
        unint64_t v53 = v51;
        int v51 = (uint64_t *)*v51;
        if (!v51) {
          break;
        }
        unint64_t v54 = v51[1];
        if (v48.u32[0] > 1uLL)
        {
          unint64_t v55 = v51[1];
          if (v54 >= v28) {
            unint64_t v55 = v54 % v28;
          }
        }
        else
        {
          unint64_t v55 = v54 & (v28 - 1);
        }
        if (v55 != v49) {
          break;
        }
        BOOL v56 = v54 == v26 && *((_DWORD *)v51 + 4) == v25[4];
        int v57 = v52 & !v56;
        v52 |= v56;
      }
      while (v57 != 1);
    }
    else
    {
      unint64_t v53 = 0;
    }
    unint64_t v58 = *((void *)v25 + 1);
    if (v48.u32[0] > 1uLL)
    {
      if (v58 >= v28) {
        v58 %= v28;
      }
    }
    else
    {
      v58 &= v28 - 1;
    }
    if (v53)
    {
      *(void *)int v25 = *v53;
      *unint64_t v53 = v25;
      if (!*(void *)v25) {
        goto LABEL_87;
      }
      unint64_t v59 = *(void *)(*(void *)v25 + 8);
      if (v48.u32[0] > 1uLL)
      {
        if (v59 >= v28) {
          v59 %= v28;
        }
      }
      else
      {
        v59 &= v28 - 1;
      }
      if (v59 == v58) {
        goto LABEL_87;
      }
    }
    else
    {
      *(void *)int v25 = *(void *)(v27 + 208);
      *(void *)(v27 + 208) = v25;
      v50[v58] = v27 + 208;
      if (!*(void *)v25)
      {
LABEL_87:
        ++*(void *)(v27 + 216);
        mach_error_t v16 = v62;
        goto LABEL_88;
      }
      unint64_t v59 = *(void *)(*(void *)v25 + 8);
      if (v48.u32[0] > 1uLL)
      {
        if (v59 >= v28) {
          v59 %= v28;
        }
      }
      else
      {
        v59 &= v28 - 1;
      }
    }
    *((void *)*v18 + v59) = v25;
    goto LABEL_87;
  }
LABEL_88:
  return pthread_rwlock_unlock(v16);
}

void sub_1CFE235E4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1CFE235F8(uint64_t a1, uint64_t a2, int a3, const void *a4, uint64_t a5, const void *a6, uint64_t a7, int a8)
{
  if (a4)
  {
    sub_1CFE236F8(a1, a2, a3, a4, a5, 0, 0, a8);
    if (a8) {
      mach_error_t v15 = "true";
    }
    else {
      mach_error_t v15 = "false";
    }
    syslog(5, "EDR - server insert handler block server = %d type = %d block = %p local_only = %s\n", *(_DWORD *)(a1 + 8), a3, a4, v15);
  }
  if (a6)
  {
    sub_1CFE236F8(a1, a2, a3, 0, 0, (uint64_t)a6, a7, a8);
    if (a8) {
      mach_error_t v16 = "true";
    }
    else {
      mach_error_t v16 = "false";
    }
    syslog(5, "EDR - server insert handler function server = %d type = %d function = %p local_only = %s\n", *(_DWORD *)(a1 + 8), a3, a6, v16);
  }
}

uint64_t sub_1CFE236F8(uint64_t a1, uint64_t a2, int a3, const void *a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  int v50 = a3;
  uint64_t v13 = (pthread_rwlock_t *)(a1 + 232);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 232));
  uint64_t v14 = (void *)(a1 + 80);
  mach_error_t v15 = sub_1CFE1513C((void *)(a1 + 80), &v50);
  if (!v15 || (const void *)v15[6] != a4 || v15[7] != a5 || v15[8] != a6 || v15[9] != a7)
  {
    mach_error_t v16 = _Block_copy(a4);
    unint64_t v17 = *(void *)(a1 + 88);
    unint64_t v45 = v13;
    if (v17)
    {
      uint8x8_t v18 = (uint8x8_t)vcnt_s8((int8x8_t)v17);
      v18.i16[0] = vaddlv_u8(v18);
      if (v18.u32[0] > 1uLL)
      {
        unint64_t v8 = a3;
        if (v17 <= a3) {
          unint64_t v8 = a3 % v17;
        }
      }
      else
      {
        unint64_t v8 = (v17 - 1) & a3;
      }
      long long v19 = *(uint64_t ***)(*v14 + 8 * v8);
      if (v19)
      {
        for (uint64_t i = *v19; i; uint64_t i = (uint64_t *)*i)
        {
          unint64_t v21 = i[1];
          if (v21 == a3)
          {
            if (*((_DWORD *)i + 4) == a3) {
              goto LABEL_79;
            }
          }
          else
          {
            if (v18.u32[0] > 1uLL)
            {
              if (v21 >= v17) {
                v21 %= v17;
              }
            }
            else
            {
              v21 &= v17 - 1;
            }
            if (v21 != v8) {
              break;
            }
          }
        }
      }
    }
    uint64_t v22 = (char *)operator new(0x58uLL);
    *(void *)uint64_t v22 = 0;
    *((void *)v22 + 1) = a3;
    *((_DWORD *)v22 + 4) = a3;
    *((void *)v22 + 3) = a2;
    *((_DWORD *)v22 + 8) = a3;
    *((_DWORD *)v22 + 9) = 0;
    *((void *)v22 + 5) = v16;
    *((void *)v22 + 6) = a4;
    *((void *)v22 + 7) = a5;
    *((void *)v22 + 8) = a6;
    *((void *)v22 + 9) = a7;
    v22[80] = a8;
    *(_DWORD *)(v22 + 81) = 0;
    *((_DWORD *)v22 + 21) = 0;
    float v23 = (float)(unint64_t)(*(void *)(a1 + 104) + 1);
    float v24 = *(float *)(a1 + 112);
    if (v17 && (float)(v24 * (float)v17) >= v23)
    {
LABEL_69:
      uint8x8_t v40 = (void *)*v14;
      unint64_t v41 = *(void **)(*v14 + 8 * v8);
      if (v41)
      {
        *(void *)uint64_t v22 = *v41;
      }
      else
      {
        *(void *)uint64_t v22 = *(void *)(a1 + 96);
        *(void *)(a1 + 96) = v22;
        v40[v8] = a1 + 96;
        if (!*(void *)v22)
        {
LABEL_78:
          ++*(void *)(a1 + 104);
          uint64_t v13 = v45;
          goto LABEL_79;
        }
        unint64_t v42 = *(void *)(*(void *)v22 + 8);
        if ((v17 & (v17 - 1)) != 0)
        {
          if (v42 >= v17) {
            v42 %= v17;
          }
        }
        else
        {
          v42 &= v17 - 1;
        }
        unint64_t v41 = (void *)(*v14 + 8 * v42);
      }
      *unint64_t v41 = v22;
      goto LABEL_78;
    }
    BOOL v25 = (v17 & (v17 - 1)) == 0;
    if (v17 < 3) {
      BOOL v25 = 0;
    }
    unint64_t v26 = (2 * v17) | !v25;
    unint64_t v27 = vcvtps_u32_f32(v23 / v24);
    if (v26 <= v27) {
      int8x8_t prime = (int8x8_t)v27;
    }
    else {
      int8x8_t prime = (int8x8_t)v26;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v17 = *(void *)(a1 + 88);
    }
    if (*(void *)&prime > v17) {
      goto LABEL_35;
    }
    if (*(void *)&prime < v17)
    {
      unint64_t v35 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 104) / *(float *)(a1 + 112));
      if (v17 < 3 || (uint8x8_t v36 = (uint8x8_t)vcnt_s8((int8x8_t)v17), v36.i16[0] = vaddlv_u8(v36), v36.u32[0] > 1uLL))
      {
        unint64_t v35 = std::__next_prime(v35);
      }
      else
      {
        uint64_t v37 = 1 << -(char)__clz(v35 - 1);
        if (v35 >= 2) {
          unint64_t v35 = v37;
        }
      }
      if (*(void *)&prime <= v35) {
        int8x8_t prime = (int8x8_t)v35;
      }
      if (*(void *)&prime >= v17)
      {
        unint64_t v17 = *(void *)(a1 + 88);
      }
      else
      {
        if (prime)
        {
LABEL_35:
          if (*(void *)&prime >> 61) {
            sub_1CFE16B00();
          }
          float v29 = operator new(8 * *(void *)&prime);
          float v30 = (void *)*v14;
          void *v14 = v29;
          if (v30) {
            operator delete(v30);
          }
          uint64_t v31 = 0;
          *(int8x8_t *)(a1 + 88) = prime;
          do
            *(void *)(*v14 + 8 * v31++) = 0;
          while (*(void *)&prime != v31);
          unint64_t v32 = *(void **)(a1 + 96);
          if (v32)
          {
            unint64_t v33 = v32[1];
            uint8x8_t v34 = (uint8x8_t)vcnt_s8(prime);
            v34.i16[0] = vaddlv_u8(v34);
            if (v34.u32[0] > 1uLL)
            {
              if (v33 >= *(void *)&prime) {
                v33 %= *(void *)&prime;
              }
            }
            else
            {
              v33 &= *(void *)&prime - 1;
            }
            *(void *)(*v14 + 8 * v33) = a1 + 96;
            uint64_t v38 = (void *)*v32;
            if (*v32)
            {
              do
              {
                unint64_t v39 = v38[1];
                if (v34.u32[0] > 1uLL)
                {
                  if (v39 >= *(void *)&prime) {
                    v39 %= *(void *)&prime;
                  }
                }
                else
                {
                  v39 &= *(void *)&prime - 1;
                }
                if (v39 != v33)
                {
                  if (!*(void *)(*v14 + 8 * v39))
                  {
                    *(void *)(*v14 + 8 * v39) = v32;
                    goto LABEL_60;
                  }
                  *unint64_t v32 = *v38;
                  void *v38 = **(void **)(*v14 + 8 * v39);
                  **(void **)(*v14 + 8 * v39) = v38;
                  uint64_t v38 = v32;
                }
                unint64_t v39 = v33;
LABEL_60:
                unint64_t v32 = v38;
                uint64_t v38 = (void *)*v38;
                unint64_t v33 = v39;
              }
              while (v38);
            }
          }
          unint64_t v17 = (unint64_t)prime;
          goto LABEL_64;
        }
        unint64_t v44 = (void *)*v14;
        void *v14 = 0;
        if (v44) {
          operator delete(v44);
        }
        unint64_t v17 = 0;
        *(void *)(a1 + 88) = 0;
      }
    }
LABEL_64:
    if ((v17 & (v17 - 1)) != 0)
    {
      if (v17 <= a3) {
        unint64_t v8 = a3 % v17;
      }
      else {
        unint64_t v8 = a3;
      }
    }
    else
    {
      unint64_t v8 = (v17 - 1) & a3;
    }
    goto LABEL_69;
  }
LABEL_79:
  return pthread_rwlock_unlock(v13);
}

void sub_1CFE23BA8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1CFE23BBC(void *a1, uint64_t *__p)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  uint64_t v3 = *__p;
  unint64_t v4 = __p[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v2);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v2) {
      v4 %= *(void *)&v2;
    }
  }
  else
  {
    v4 &= *(void *)&v2 - 1;
  }
  int v6 = *(uint64_t **)(*a1 + 8 * v4);
  do
  {
    int v7 = v6;
    int v6 = (uint64_t *)*v6;
  }
  while (v6 != __p);
  if (v7 != a1 + 2)
  {
    unint64_t v8 = v7[1];
    if (v5.u32[0] > 1uLL)
    {
      if (v8 >= *(void *)&v2) {
        v8 %= *(void *)&v2;
      }
    }
    else
    {
      v8 &= *(void *)&v2 - 1;
    }
    if (v8 == v4)
    {
LABEL_20:
      if (!v3) {
        goto LABEL_27;
      }
      goto LABEL_21;
    }
  }
  if (!v3) {
    goto LABEL_19;
  }
  unint64_t v9 = *(void *)(v3 + 8);
  if (v5.u32[0] > 1uLL)
  {
    if (v9 >= *(void *)&v2) {
      v9 %= *(void *)&v2;
    }
  }
  else
  {
    v9 &= *(void *)&v2 - 1;
  }
  if (v9 != v4)
  {
LABEL_19:
    *(void *)(*a1 + 8 * v4) = 0;
    uint64_t v3 = *__p;
    goto LABEL_20;
  }
LABEL_21:
  unint64_t v10 = *(void *)(v3 + 8);
  if (v5.u32[0] > 1uLL)
  {
    if (v10 >= *(void *)&v2) {
      v10 %= *(void *)&v2;
    }
  }
  else
  {
    v10 &= *(void *)&v2 - 1;
  }
  if (v10 != v4)
  {
    *(void *)(*a1 + 8 * v10) = v7;
    uint64_t v3 = *__p;
  }
LABEL_27:
  *int v7 = v3;
  void *__p = 0;
  --a1[3];
  operator delete(__p);
}

uint64_t sub_1CFE23CE4()
{
  return mach_timebase_info((mach_timebase_info_t)&qword_1EBD11A48);
}

uint64_t sub_1CFE23CF0(uint64_t result)
{
  *(void *)uint64_t result = 0;
  *(void *)(result + 8) = 0;
  *(void *)(result + 16) = 0;
  *(_DWORD *)(result + 24) = 1065353216;
  *(void *)(result + 32) = 0;
  return result;
}

uint64_t sub_1CFE23D08(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = a2;
  return result;
}

uint64_t sub_1CFE23D10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = a2;
  return result;
}

uint64_t sub_1CFE23D18(uint64_t result, float a2)
{
  *(float *)(result + 24) = a2;
  return result;
}

uint64_t sub_1CFE23D20(uint64_t a1, __n128 a2, __n128 a3, __n128 a4)
{
  unint64_t v4 = *(uint64_t (**)(__n128, __n128, __n128))(a1 + 40);
  if (!v4) {
    sub_1CFE244C8();
  }
  a2.n128_u32[0] = *(_DWORD *)a1;
  a3.n128_u32[0] = *(_DWORD *)(a1 + 4);
  a4.n128_u64[0] = *(void *)(a1 + 16);
  return v4(a2, a3, a4);
}

void sub_1CFE23D58()
{
  sub_1CFE20330();
  sub_1CFE20300(&dword_1CFE12000, MEMORY[0x1E4F14500], v0, "libEDR - %s: displayID %d is not permitted number\n", v1, v2, v3, v4, v5);
}

void sub_1CFE23DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1CFE23E5C()
{
  sub_1CFE2031C();
  sub_1CFE20300(&dword_1CFE12000, MEMORY[0x1E4F14500], v0, "libEDR - %s: displays %d context exists\n", v1, v2, v3, v4, 2u);
}

void sub_1CFE23ED8()
{
  sub_1CFE20330();
  sub_1CFE20300(&dword_1CFE12000, MEMORY[0x1E4F14500], v0, "libEDR - %s: attempt to use invalid display number %d\n", v1, v2, v3, v4, v5);
}

void sub_1CFE23F50()
{
  sub_1CFE2031C();
  sub_1CFE20300(&dword_1CFE12000, MEMORY[0x1E4F14500], v0, "libEDR - %s: displays %d context not found\n", v1, v2, v3, v4, 2u);
}

void sub_1CFE23FCC()
{
  sub_1CFE2031C();
  sub_1CFE20300(&dword_1CFE12000, MEMORY[0x1E4F14500], v0, "libEDR - %s: displays %d context not found\n", v1, v2, v3, v4, 2u);
}

void sub_1CFE24048(int a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "libEDR - NotificationCallback: can not find data for display %d\n", (uint8_t *)v1, 8u);
}

void sub_1CFE240C8()
{
  sub_1CFE2031C();
  sub_1CFE20300(&dword_1CFE12000, MEMORY[0x1E4F14500], v0, "libEDR - %s: sysctlbyname() => 0x%x\n", v1, v2, v3, v4, 2u);
}

void sub_1CFE24144()
{
  sub_1CFE2031C();
  sub_1CFE20300(&dword_1CFE12000, MEMORY[0x1E4F14500], v0, "libEDR - %s: IORegistryEntrySetCFProperty() => 0x%x\n", v1, v2, v3, v4, 2u);
}

void sub_1CFE241C0()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136315138;
  uint64_t v1 = "EDRServerStartSBIMTimer";
  _os_log_error_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "libEDR - %s: Unable to create dispatch source for SBIM data pull\n", (uint8_t *)&v0, 0xCu);
}

void sub_1CFE24248()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136315138;
  uint64_t v1 = "EDRServerStartSBIMTimer";
  _os_log_error_impl(&dword_1CFE12000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "libEDR - %s: Unable to create dispatch source for SBIM mitigation\n", (uint8_t *)&v0, 0xCu);
}

void sub_1CFE242D0()
{
  sub_1CFE20350();
  sub_1CFE20300(&dword_1CFE12000, MEMORY[0x1E4F14500], v0, "libEDR - %s: IOMobileFramebufferGetMainDisplay() => %d\n", v1, v2, v3, v4, 2u);
}

void sub_1CFE24350()
{
  sub_1CFE2031C();
  sub_1CFE20300(&dword_1CFE12000, MEMORY[0x1E4F14500], v0, "libEDR - %s: IOMobileFramebufferGetMainDisplay() => 0x%x\n", v1, v2, v3, v4, 2u);
}

void sub_1CFE243CC()
{
  sub_1CFE2031C();
  sub_1CFE20300(&dword_1CFE12000, MEMORY[0x1E4F14500], v0, "libEDR - %s: unknown SBIM mitigation stage %d, ignoring ... \n", v1, v2, v3, v4, 2u);
}

void sub_1CFE24448()
{
  sub_1CFE20350();
  sub_1CFE20300(&dword_1CFE12000, MEMORY[0x1E4F14500], v0, "libEDR - %s: SBIM unknown mitigation stage %d, ignoring ... \n", v1, v2, v3, v4, 2u);
}

void sub_1CFE244C8()
{
}

void sub_1CFE244F4()
{
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

uint64_t IOMobileFramebufferGetBlock()
{
  return MEMORY[0x1F4124A20]();
}

uint64_t IOMobileFramebufferGetMainDisplay()
{
  return MEMORY[0x1F4124A88]();
}

uint64_t IOMobileFramebufferGetServiceObject()
{
  return MEMORY[0x1F4124AB0]();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x1F40E9220](*(void *)&entry, propertyName, property);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
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
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1F40C9B60](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
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
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

char *__cdecl asctime(const tm *a1)
{
  return (char *)MEMORY[0x1F40CA3C8](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1F40CA4F8](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1F40CA508](a1, *(void *)&a2);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA538](*(void *)&bp, service_name, sp);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA548](*(void *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
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
  return MEMORY[0x1F40CBD30](when, delta);
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1F40CC868](a1);
}

float log2f(float a1)
{
  MEMORY[0x1F40CC8B0](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x1F40CC8C0](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_construct(ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  return MEMORY[0x1F40CC9A8](*(void *)&task, options, context, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_destroy(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9C0](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_get_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_urefs_t *refs)
{
  return MEMORY[0x1F40CC9F0](*(void *)&task, *(void *)&name, *(void *)&right, refs);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1F40CCA08](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1F40CCA28](*(void *)&task, *(void *)&name, *(void *)&msgid, *(void *)&sync, *(void *)&notify, *(void *)&notifyPoly, previous);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

kern_return_t mach_wait_until(uint64_t deadline)
{
  return MEMORY[0x1F40CCAD0](deadline);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDAF8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB10](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB18](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x1F40CE298](__str, __sep, __lasts);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x1F40CE460](*(void *)&task, *(void *)&which_port, special_port);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}