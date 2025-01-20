uint64_t sil_argb8888_to_b3a8(uint64_t result, unsigned int a2, uint64_t a3, int a4, void *a5, unsigned int a6, int a7, int a8)
{
  int v8;
  unsigned int v9;
  int16x8_t v10;
  int16x8_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint8x16_t v16;
  uint16x8_t v17;
  uint16x8_t v18;
  uint16x8_t v19;
  int32x4_t *v20;
  int8x16x2_t v21;

  if ((a2 & 0x1F) != 0) {
    sil_argb8888_to_b3a8_cold_1();
  }
  if (a8)
  {
    v8 = 0;
    v9 = 4 * a7 + 31;
    v10 = vdupq_n_s16(0x180u);
    v11 = vdupq_n_s16(0xD80u);
    v12 = v9 >> 5;
    if (v9 >> 5 <= 1) {
      v12 = 1;
    }
    v13 = 32 * v12;
    do
    {
      if (v9 >= 0x20)
      {
        v14 = 0;
        v15 = a5;
        do
        {
          v21 = *(int8x16x2_t *)(result + v14);
          v16 = (uint8x16_t)vqtbl2q_s8(v21, (int8x16_t)xmmword_25B69CD80);
          v17 = (uint16x8_t)vaddq_s16((int16x8_t)vshll_n_u8(*(uint8x8_t *)v16.i8, 1uLL), v10);
          v18 = (uint16x8_t)vaddq_s16((int16x8_t)vshll_high_n_u8(v16, 1uLL), v10);
          v19 = (uint16x8_t)vaddq_s16((int16x8_t)vshll_n_u8((uint8x8_t)*(_OWORD *)&vqtbl2q_s8(v21, (int8x16_t)xmmword_25B69CD90), 1uLL), v11);
          v20 = (int32x4_t *)(a3 + v14);
          *v20 = vaddq_s32((int32x4_t)vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v18.i8, 0xAuLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v17.i8)), vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v19.i8), 0x14uLL));
          v20[1] = vaddq_s32((int32x4_t)vorrq_s8((int8x16_t)vshll_high_n_u16(v18, 0xAuLL), (int8x16_t)vmovl_high_u16(v17)), vshlq_n_s32((int32x4_t)vmovl_high_u16(v19), 0x14uLL));
          *v15++ = vqtbl2q_s8(v21, (int8x16_t)xmmword_25B69CDA0).u64[0];
          v14 += 32;
        }
        while (v13 != v14);
      }
      result += a2;
      a5 = (void *)((char *)a5 + a6);
      ++v8;
      a3 += a4 & 0xFFFFFFFC;
    }
    while (v8 != a8);
  }
  return result;
}

uint64_t SILServer_createSILServerClient(void)
{
  uint64_t v11 = 0;
  v0 = xnu_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25B66B000, v0, OS_LOG_TYPE_INFO, "Attempting to launch conclaves...", buf, 2u);
  }
  int v1 = tb_conclave_endpoint_for_service();
  if (v1)
  {
    int v2 = v1;
    uint64_t v3 = 3758097084;
    v4 = xnu_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      SILServer_createSILServerClient(v2, v4);
    }
  }
  else
  {
    int v5 = silmanager_silmanager__init(&silServerConnection);
    v6 = xnu_log();
    v7 = v6;
    if (v5)
    {
      uint64_t v3 = 3758097084;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        SILServer_createSILServerClient(v5, v7);
      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_25B66B000, v7, OS_LOG_TYPE_INFO, "Created conclave endpoint for SILServer", v9, 2u);
      }
      return 0;
    }
  }
  return v3;
}

uint64_t SILServer_createRenderer(void)
{
  int v1 = &silServerConnection;
  return do_tightbeam_call<unsigned int,tb_error_t (*)(silmanager_silmanager_s const*,void({block_pointer})),silmanager_silmanager_s*>((uint64_t)"SILServer_createRenderer", (uint64_t (*)(uint64_t, void *))silmanager_silmanager_createrenderer, (uint64_t *)&v1);
}

uint64_t do_tightbeam_call<unsigned int,tb_error_t (*)(silmanager_silmanager_s const*,void({block_pointer})(unsigned int)),silmanager_silmanager_s*>(uint64_t a1, uint64_t (*a2)(uint64_t, void *), uint64_t *a3)
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 513;
  if (!silServerConnection)
  {
    if (SILServer_createSILServerClient()) {
      goto LABEL_7;
    }
    if (!silServerConnection) {
      __assert_rtn("do_tightbeam_call", "SILServerInterface.mm", 54, "silServerConnection.connection != nullptr");
    }
  }
  uint64_t v6 = *a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = ___ZL17do_tightbeam_callIjPF10tb_error_tPK23silmanager_silmanager_sU13block_pointerFvjEEJPS1_EET_PKcT0_DpOT1__block_invoke;
  v11[3] = &unk_265497ED0;
  v11[4] = &v12;
  int v7 = a2(v6, v11);
  if (v7)
  {
    v8 = xnu_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      do_tightbeam_call<unsigned int,tb_error_t (*)(silmanager_silmanager_s const*,void({block_pointer})),silmanager_silmanager_s*>(a1, v7, v8);
    }
  }
LABEL_7:
  uint64_t v9 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v9;
}

void sub_25B66D70C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SILServer_setPower()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  int v6 = 513;
  if (!silServerConnection)
  {
    if (SILServer_createSILServerClient()) {
      goto LABEL_7;
    }
    if (!silServerConnection) {
      __assert_rtn("do_tightbeam_call", "SILServerInterface.mm", 54, "silServerConnection.connection != nullptr");
    }
  }
  if (silmanager_silmanager_setpower())
  {
    v0 = xnu_log();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      SILServer_setPower();
    }
  }
LABEL_7:
  uint64_t v1 = *((unsigned int *)v4 + 6);
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_25B66D860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SILServer_swap(unsigned __int8 a1, int a2, double a3, double a4, float a5, unsigned __int16 a6, float a7, unint64_t *a8)
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x4012000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = "";
  long long v19 = xmmword_25B69CDE0;
  if (!silServerConnection)
  {
    if (SILServer_createSILServerClient()) {
      goto LABEL_7;
    }
    if (!silServerConnection) {
      __assert_rtn("do_tightbeam_call", "SILServerInterface.mm", 54, "silServerConnection.connection != nullptr");
    }
  }
  if (silmanager_silmanager_swap())
  {
    uint64_t v9 = xnu_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      SILServer_swap();
    }
  }
LABEL_7:
  unint64_t v10 = v14[7];
  uint64_t v11 = *((unsigned int *)v14 + 12);
  _Block_object_dispose(&v13, 8);
  *a8 = v10;
  return v11;
}

void sub_25B66DA38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SILServer_turnOffIndicators(int a1, BOOL a2, unint64_t *a3)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x4012000000;
  uint64_t v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  uint64_t v13 = "";
  long long v14 = xmmword_25B69CDE0;
  if (!silServerConnection)
  {
    if (SILServer_createSILServerClient()) {
      goto LABEL_7;
    }
    if (!silServerConnection) {
      __assert_rtn("do_tightbeam_call", "SILServerInterface.mm", 54, "silServerConnection.connection != nullptr");
    }
  }
  if (silmanager_silmanager_turnoffindicators())
  {
    v4 = xnu_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      SILServer_turnOffIndicators();
    }
  }
LABEL_7:
  unint64_t v5 = v9[7];
  uint64_t v6 = *((unsigned int *)v9 + 12);
  _Block_object_dispose(&v8, 8);
  *a3 = v5;
  return v6;
}

void sub_25B66DBD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SILServer_swapEnd(void)
{
  uint64_t v1 = &silServerConnection;
  return do_tightbeam_call<unsigned int,tb_error_t (*)(silmanager_silmanager_s const*,void({block_pointer})),silmanager_silmanager_s*>((uint64_t)"SILServer_swapEnd", (uint64_t (*)(uint64_t, void *))silmanager_silmanager_swapend, (uint64_t *)&v1);
}

uint64_t SILServer_setLogLevel()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  int v6 = 513;
  if (!silServerConnection)
  {
    if (SILServer_createSILServerClient()) {
      goto LABEL_7;
    }
    if (!silServerConnection) {
      __assert_rtn("do_tightbeam_call", "SILServerInterface.mm", 54, "silServerConnection.connection != nullptr");
    }
  }
  if (silmanager_silmanager_setloglevel())
  {
    v0 = xnu_log();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      SILServer_setLogLevel();
    }
  }
LABEL_7:
  uint64_t v1 = *((unsigned int *)v4 + 6);
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_25B66DD6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZL17do_tightbeam_callIjPF10tb_error_tPK23silmanager_silmanager_sU13block_pointerFvjEEJPS1_EET_PKcT0_DpOT1__block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t ___ZL17do_tightbeam_callIjPF10tb_error_tPK23silmanager_silmanager_sbbU13block_pointerFvjEEJPS1_RbS9_EET_PKcT0_DpOT1__block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

__n128 __Block_byref_object_copy_(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t ___ZL17do_tightbeam_callI23silmanager_swapreturn_sPF10tb_error_tPK23silmanager_silmanager_shiddftfU13block_pointerFvS0_EEJPS2_RhRiRdSC_RfRtSD_EET_PKcT0_DpOT1__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  *(void *)(v3 + 48) = a2;
  *(void *)(v3 + 56) = a3;
  return result;
}

uint64_t ___ZL17do_tightbeam_callI23silmanager_swapreturn_sPF10tb_error_tPK23silmanager_silmanager_sibU13block_pointerFvS0_EEJPS2_RiRbEET_PKcT0_DpOT1__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  *(void *)(v3 + 48) = a2;
  *(void *)(v3 + 56) = a3;
  return result;
}

uint64_t ___ZL17do_tightbeam_callIjPF10tb_error_tPK23silmanager_silmanager_shU13block_pointerFvjEEJPS1_RhEET_PKcT0_DpOT1__block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t SILStateMachineCreate(void *a1)
{
  if (a1)
  {
    uint64_t v1 = [a1 objectForKeyedSubscript:@"IndicatorID"];
    if (v1)
    {
      id v2 = [+[SILManifest manifest] indicatorFromName:v1 error:0];
      if (v2)
      {
        uint64_t v3 = (void *)[v2 flipbook];
        if ([v3 states])
        {
          if (objc_msgSend((id)objc_msgSend(v3, "states"), "count")) {
            operator new();
          }
        }
      }
    }
  }
  return 0;
}

uint64_t SILStateMachineStateList(uint64_t a1)
{
  return *(void *)(a1 + 80);
}

uint64_t SILStateMachineTick(uint64_t a1, _WORD *a2, double a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  std::mutex::lock((std::mutex *)a1);
  int v6 = *(void **)(a1 + 104);
  if (v6 == *(void **)(a1 + 112) || *(unsigned char *)(a1 + 130))
  {
    int v7 = (void *)[v6 selfTransition];
    int v8 = 0;
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
    int v7 = *(void **)(a1 + 120);
    int v8 = 1;
  }
  current_range = find_current_range(v7, *(unsigned __int16 *)(a1 + 128));
  if ((unint64_t)current_range >= [v7 end])
  {
    uint64_t v13 = [v7 begin];
LABEL_11:
    current_range = (unsigned __int16 *)v13;
    goto LABEL_12;
  }
  if (*(unsigned __int16 *)(a1 + 128) < current_range[1]) {
    goto LABEL_12;
  }
  unint64_t v11 = [v7 end];
  uint64_t v12 = current_range + 4;
  if (v9)
  {
    current_range += 4;
    if ((unint64_t)v12 < v11) {
      goto LABEL_12;
    }
    uint64_t v13 = [v7 ranges];
    goto LABEL_11;
  }
  if ((unint64_t)v12 < v11) {
    current_range += 4;
  }
LABEL_12:
  double v14 = *(double *)(a1 + 88) - *(double *)(a1 + 96);
  if (v14 - *((float *)current_range + 1) >= 0.0) {
    double v15 = v14 - *((float *)current_range + 1);
  }
  else {
    double v15 = 0.0;
  }
  unsigned int v16 = *current_range;
  unsigned __int16 v17 = current_range[1] + 1;
  if (v16 <= v17)
  {
    v28 = *(void **)(a1 + 64);
    uint64_t v29 = [v28 frames];
    unsigned int v30 = [v28 framesCount];
    unsigned int v18 = 0xFFFF;
    if (v30 >= v16 && v30 >= v17)
    {
      v31 = (const SILFrameDesc *)(v29 + 20 * v16);
      float var0 = v31->var0;
      float v33 = *(float *)(v29 + 20 * (v17 - 1));
      +[SILFlipBookDesc kFrameDuration];
      float v34 = v15;
      double v36 = (float)(v33 + (float)(v35 * 0.5)) - var0;
      if (v36 >= v34) {
        char v37 = 1;
      }
      else {
        char v37 = v9;
      }
      if (v37)
      {
        float v38 = fmod(v34, v36) + var0;
        unsigned int v18 = (unsigned __int16)(-13107
                               * ((closest_frame_for_time(v31, (const SILFrameDesc *)(v29 + 20 * v17), v38)- v29) >> 2));
      }
      else
      {
        unsigned int v18 = (unsigned __int16)(v17 - 1);
      }
    }
  }
  else
  {
    unsigned int v18 = 0xFFFF;
  }
  unsigned int v19 = *(unsigned __int16 *)(a1 + 128);
  if (v18 != v19 && v14 > 0.0 && frame_distance(v7, v19, v18) >= 2)
  {
    v20 = xnu_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v21 = *(unsigned __int16 *)(a1 + 128);
      *(_DWORD *)v47 = 67109376;
      *(_DWORD *)&v47[4] = v21;
      *(_WORD *)&v47[8] = 1024;
      *(_DWORD *)&v47[10] = v18;
      _os_log_impl(&dword_25B66B000, v20, OS_LOG_TYPE_INFO, "SILStateMachine dropped frame. Last frame %u new frame %u", v47, 0xEu);
    }
  }
  *(double *)(a1 + 88) = *(double *)(a1 + 88) + a3;
  if (*(unsigned char *)(a1 + 130))
  {
    unsigned int v22 = [*(id *)(a1 + 120) startFrame];
    unsigned int v23 = frame_distance(*(void **)(a1 + 120), current_range, current_range, *(unsigned __int16 *)(a1 + 128), v18);
    if (v23 >= frame_distance(*(void **)(a1 + 120), current_range, current_range, *(unsigned __int16 *)(a1 + 128), v22))
    {
      *(unsigned char *)(a1 + 130) = 0;
      *(void *)(a1 + 96) = *(void *)(a1 + 88);
      v39 = xnu_log();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        uint64_t v40 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 104), "name"), "UTF8String");
        int v41 = *current_range;
        int v42 = current_range[1];
        *(_DWORD *)v47 = 136315906;
        *(void *)&v47[4] = v40;
        *(_WORD *)&v47[12] = 1024;
        *(_DWORD *)&v47[14] = v22;
        *(_WORD *)&v47[18] = 1024;
        *(_DWORD *)&v47[20] = v41;
        LOWORD(v48) = 1024;
        *(_DWORD *)((char *)&v48 + 2) = v42;
        v25 = "SILStateMachine starting transition to %s with jump frame %u -> [%u,%u]";
        v26 = v39;
        uint32_t v27 = 30;
        goto LABEL_35;
      }
    }
    else
    {
      v24 = xnu_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v47 = 67109376;
        *(_DWORD *)&v47[4] = v18;
        *(_WORD *)&v47[8] = 1024;
        *(_DWORD *)&v47[10] = v22;
        v25 = "SILStateMachine pending transition cur : %u jump frame : %u";
        v26 = v24;
        uint32_t v27 = 14;
LABEL_35:
        _os_log_impl(&dword_25B66B000, v26, OS_LOG_TYPE_INFO, v25, v47, v27);
      }
    }
  }
  if (v8)
  {
    if (current_range == (unsigned __int16 *)([v7 end] - 8)
      && *(unsigned __int16 *)(a1 + 128) == current_range[1])
    {
      LOWORD(v18) = *(_WORD *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 112), "selfTransition"), "begin");
      *(void *)(a1 + 120) = 0;
      *(void *)(a1 + 104) = *(void *)(a1 + 112);
      *(void *)(a1 + 96) = *(void *)(a1 + 88);
      v43 = xnu_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        uint64_t v44 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 104), "name"), "UTF8String");
        *(_DWORD *)v47 = 136315138;
        *(void *)&v47[4] = v44;
        _os_log_impl(&dword_25B66B000, v43, OS_LOG_TYPE_INFO, "SILStateMachine finished transition %s", v47, 0xCu);
      }
    }
  }
  *(_WORD *)(a1 + 128) = v18;
  if (a2) {
    *a2 = v18;
  }
  uint64_t v45 = objc_msgSend(*(id *)(a1 + 104), "name", *(_OWORD *)v47, *(void *)&v47[16], v48);
  std::mutex::unlock((std::mutex *)a1);
  return v45;
}

void sub_25B66E3F4(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

unsigned __int16 *find_current_range(void *a1, unsigned int a2)
{
  for (i = (unsigned __int16 *)[a1 begin];
        (unint64_t)i < [a1 end] && (*i > a2 || i[1] < a2);
  return i;
}

uint64_t frame_distance(void *a1, unsigned int a2, unsigned int a3)
{
  current_range = find_current_range(a1, a2);
  int v7 = find_current_range(a1, a3);
  if (current_range == (unsigned __int16 *)[a1 end]) {
    frame_distance();
  }
  if (v7 == (unsigned __int16 *)[a1 end]) {
    frame_distance();
  }
  return frame_distance(a1, current_range, v7, a2, a3);
}

uint64_t frame_distance(void *a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned int a4, unsigned int a5)
{
  unsigned int v5 = *a2;
  if (v5 > a4 || (unsigned int v6 = a2[1], v7 = v6 - a4, v6 < a4)) {
    frame_distance();
  }
  if (*a3 > a5 || a3[1] < a5) {
    frame_distance();
  }
  if (a2 == a3)
  {
    unsigned int v17 = a5 - a4 - v5 + v6;
    if (a5 >= a4) {
      return a5 - a4;
    }
    else {
      return v17;
    }
  }
  else
  {
    unint64_t v11 = a2 + 4;
    if ((unint64_t)(a2 + 4) >= [a1 end]) {
      unint64_t v11 = (unsigned __int16 *)[a1 ranges];
    }
    while (v11 != a3)
    {
      int v12 = v11[1];
      int v14 = *v11;
      v11 += 4;
      int v13 = v14;
      if ((unint64_t)v11 >= [a1 end]) {
        unint64_t v11 = (unsigned __int16 *)[a1 ranges];
      }
      unsigned int v7 = v7 + v12 - v13;
    }
    unsigned int v15 = *a3;
    if (v15 > a5) {
      frame_distance();
    }
    return v7 + a5 - v15;
  }
}

uint64_t SILStateMachineTransitionSupported(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    return [*(id *)(a1 + 72) transitionSupportedFromState:a2 toState:a3];
  }
  else {
    return 1;
  }
}

uint64_t SILStateMachineTransitionToState(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 72), "statesInfo"), "objectForKeyedSubscript:", a2);
  if (v4)
  {
    std::mutex::lock((std::mutex *)v3);
    if (objc_msgSend((id)objc_msgSend(*(id *)(v3 + 104), "name"), "isEqualToString:", a2))
    {
      uint64_t v4 = 1;
LABEL_7:
      std::mutex::unlock((std::mutex *)v3);
      return v4;
    }
    unsigned int v5 = *(void **)(v3 + 104);
    if (v5 != *(void **)(v3 + 112) || *(unsigned char *)(v3 + 130))
    {
LABEL_6:
      uint64_t v4 = 0;
      goto LABEL_7;
    }
    if (a2)
    {
      unsigned int v7 = *(unsigned __int16 *)(v3 + 128);
      int v8 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 104), "transitions"), "objectForKeyedSubscript:", a2);
      if (!v8) {
        goto LABEL_6;
      }
      if (find_current_range((void *)[v5 selfTransition], v7))
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v9)
        {
          uint64_t v18 = v4;
          uint64_t v19 = v3;
          uint64_t v10 = 0;
          uint64_t v11 = *(void *)v21;
          uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v21 != v11) {
                objc_enumerationMutation(v8);
              }
              int v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
              unsigned int v15 = frame_distance(objc_msgSend(v5, "selfTransition", v18), v7, objc_msgSend(v14, "startFrame"));
              if (v12 > v15) {
                uint64_t v10 = v14;
              }
              if (v12 >= v15) {
                uint64_t v12 = v15;
              }
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v9);
          if (v10)
          {
            uint64_t v3 = v19;
            *(void *)(v19 + 112) = v18;
            *(void *)(v19 + 120) = v10;
            uint64_t v4 = 1;
            *(unsigned char *)(v19 + 130) = 1;
          }
          else
          {
            uint64_t v4 = 0;
            uint64_t v3 = v19;
          }
          goto LABEL_7;
        }
        goto LABEL_6;
      }
      unsigned int v16 = "find_current_range (from.selfTransition, current_frame) != nil";
      int v17 = 155;
    }
    else
    {
      unsigned int v16 = "to != nil";
      int v17 = 149;
    }
    __assert_rtn("get_best_transition", "SILStateMachine.mm", v17, v16);
  }
  return v4;
}

void sub_25B66E878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::mutex *a10)
{
}

BOOL SILStateMachineForceTransitionToState(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 72), "statesInfo"), "objectForKeyedSubscript:", a2);
  uint64_t v4 = v3;
  if (v3)
  {
    *(void *)(a1 + 104) = v3;
    *(void *)(a1 + 112) = v3;
    *(void *)(a1 + 120) = 0;
    *(unsigned char *)(a1 + 130) = 0;
    *(void *)(a1 + 96) = *(void *)(a1 + 88);
    *(_WORD *)(a1 + 128) = objc_msgSend((id)objc_msgSend(v3, "selfTransition"), "startFrame");
  }
  return v4 != 0;
}

std::mutex *SILStateMachineRelease(std::mutex *result)
{
  if (result)
  {
    std::mutex::~mutex(result);
    JUMPOUT(0x261165F80);
  }
  return result;
}

uint64_t xnu_log()
{
  if (xnu_log::token != -1) {
    dispatch_once(&xnu_log::token, &__block_literal_global);
  }
  return xnu_log::xnu_log;
}

os_log_t __xnu_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.SILManager", "SILManager");
  xnu_log::xnu_log = (uint64_t)result;
  return result;
}

uint64_t SILManagerCreate(uint64_t a1)
{
  NSUInteger v2 = [(NSArray *)[+[SILManifest manifest] indicators] count];
  uint64_t result = 0;
  if (a1 && v2)
  {
    if (xnu_log::token != -1) {
      dispatch_once(&xnu_log::token, &__block_literal_global);
    }
    uint64_t v4 = xnu_log::xnu_log;
    if (os_log_type_enabled((os_log_t)xnu_log::xnu_log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_25B66B000, v4, OS_LOG_TYPE_INFO, "Creating SIL Manager...", v11, 2u);
    }
    int SILServerClient = SILServer_createSILServerClient();
    if (SILServerClient)
    {
      int v6 = SILServerClient;
      if (xnu_log::token != -1) {
        dispatch_once(&xnu_log::token, &__block_literal_global);
      }
      unsigned int v7 = xnu_log::xnu_log;
      if (os_log_type_enabled((os_log_t)xnu_log::xnu_log, OS_LOG_TYPE_ERROR)) {
        SILManagerCreate_cold_2(v6, v7);
      }
    }
    else
    {
      int Renderer = SILServer_createRenderer();
      if (!Renderer) {
        operator new();
      }
      int v9 = Renderer;
      if (xnu_log::token != -1) {
        dispatch_once(&xnu_log::token, &__block_literal_global);
      }
      uint64_t v10 = xnu_log::xnu_log;
      if (os_log_type_enabled((os_log_t)xnu_log::xnu_log, OS_LOG_TYPE_ERROR)) {
        SILManagerCreate_cold_1(v9, v10);
      }
    }
    return 0;
  }
  return result;
}

uint64_t SILManagerSetLogLevel()
{
  return SILServer_setLogLevel();
}

CFStringRef SILManagerCopyManifestDescription(unsigned int a1, unsigned int a2)
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  memset(&v81, 0, sizeof(v81));
  std::string::reserve(&v81, 0x800uLL);
  unint64_t v4 = 0x26B347000uLL;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  obunsigned int j = [+[SILManifest manifest] indicators];
  uint64_t v56 = [(NSArray *)obj countByEnumeratingWithState:&v77 objects:v89 count:16];
  if (v56)
  {
    uint64_t v57 = *(void *)v78;
    double v5 = (double)a1;
    double v6 = (double)a2;
    v54 = @"IndicatorID";
    do
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v78 != v57) {
          objc_enumerationMutation(obj);
        }
        unsigned int v7 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "name", v54), "UTF8String");
        uint64_t v9 = [v7 type];
        uint64_t v92 = 0;
        uint64_t v93 = 140;
        v90[0] = v8;
        uint64_t v91 = v9;
        v83 = 0;
        uint64_t v84 = 0;
        __p = 0;
        uint64_t v73 = 2;
        double v74 = COERCE_DOUBLE(v90);
        uint64_t v75 = 140;
        std::__vformat_to[abi:ne180100]<std::back_insert_iterator<std::string>,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>((uint64_t)&__p, "{} ({})\n", 8, &v73);
        if (v84 >= 0) {
          p_p = (const std::string::value_type *)&__p;
        }
        else {
          p_p = (const std::string::value_type *)__p;
        }
        if (v84 >= 0) {
          std::string::size_type v11 = HIBYTE(v84);
        }
        else {
          std::string::size_type v11 = (std::string::size_type)v83;
        }
        std::string::append(&v81, p_p, v11);
        if (SHIBYTE(v84) < 0) {
          operator delete(__p);
        }
        uint64_t v12 = [v7 extent];
        uint64_t v13 = [v7 extent];
        v90[0] = v12;
        v90[1] = 0;
        uint64_t v92 = 0;
        uint64_t v93 = 132;
        uint64_t v91 = v13;
        v83 = 0;
        uint64_t v84 = 0;
        __p = 0;
        uint64_t v73 = 2;
        double v74 = COERCE_DOUBLE(v90);
        uint64_t v75 = 132;
        std::__vformat_to[abi:ne180100]<std::back_insert_iterator<std::string>,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>((uint64_t)&__p, "\tsize: {}x{}\n", 13, &v73);
        if (v84 >= 0) {
          int v14 = (const std::string::value_type *)&__p;
        }
        else {
          int v14 = (const std::string::value_type *)__p;
        }
        if (v84 >= 0) {
          std::string::size_type v15 = HIBYTE(v84);
        }
        else {
          std::string::size_type v15 = (std::string::size_type)v83;
        }
        std::string::append(&v81, v14, v15);
        if (SHIBYTE(v84) < 0) {
          operator delete(__p);
        }
        uint64_t v16 = objc_msgSend((id)objc_msgSend(v7, "blobName"), "UTF8String");
        uint64_t v17 = objc_msgSend((id)objc_msgSend(v7, "constraintsFile"), "UTF8String");
        unsigned int v18 = [v7 framesCount];
        v90[0] = v16;
        uint64_t v91 = v17;
        uint64_t v94 = 0;
        uint64_t v95 = 6540;
        uint64_t v93 = v18;
        v83 = 0;
        uint64_t v84 = 0;
        __p = 0;
        uint64_t v73 = 3;
        double v74 = COERCE_DOUBLE(v90);
        uint64_t v75 = 6540;
        std::__vformat_to[abi:ne180100]<std::back_insert_iterator<std::string>,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>((uint64_t)&__p, "\tdata: '{}'\n\tconstraints: '{}'\n\tframe_count: {}\n", 48, &v73);
        if (v84 >= 0) {
          uint64_t v19 = (const std::string::value_type *)&__p;
        }
        else {
          uint64_t v19 = (const std::string::value_type *)__p;
        }
        if (v84 >= 0) {
          std::string::size_type v20 = HIBYTE(v84);
        }
        else {
          std::string::size_type v20 = (std::string::size_type)v83;
        }
        std::string::append(&v81, v19, v20);
        if (SHIBYTE(v84) < 0) {
          operator delete(__p);
        }
        uint64_t v21 = objc_msgSend((id)objc_msgSend(v7, "blobName"), "UTF8String");
        unsigned int v22 = [v7 framesCount];
        uint64_t v92 = 0;
        uint64_t v93 = 204;
        v90[0] = v21;
        uint64_t v91 = v22;
        v83 = 0;
        uint64_t v84 = 0;
        __p = 0;
        uint64_t v73 = 2;
        double v74 = COERCE_DOUBLE(v90);
        uint64_t v75 = 204;
        std::__vformat_to[abi:ne180100]<std::back_insert_iterator<std::string>,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>((uint64_t)&__p, "\tvalid_positions:\n", 18, &v73);
        if (v84 >= 0) {
          long long v23 = (const std::string::value_type *)&__p;
        }
        else {
          long long v23 = (const std::string::value_type *)__p;
        }
        if (v84 >= 0) {
          std::string::size_type v24 = HIBYTE(v84);
        }
        else {
          std::string::size_type v24 = (std::string::size_type)v83;
        }
        std::string::append(&v81, v23, v24);
        if (SHIBYTE(v84) < 0) {
          operator delete(__p);
        }
        uint64_t v25 = objc_msgSend((id)objc_msgSend((id)(v4 + 3432), "manifest"), "indicatorFromType:error:", objc_msgSend(v7, "type"), 0);
        v26 = (void *)[v25 boundingBoxes];
        for (unsigned int j = 0; [v26 count] > (unint64_t)j; ++j)
        {
          objc_msgSend((id)objc_msgSend(v26, "objectAtIndexedSubscript:", j), "getValue:", &v73);
          v90[0] = round(*(double *)&v73 * v5);
          uint64_t v91 = round(v74 * v6);
          uint64_t v96 = 338250;
          uint64_t v93 = round(*(double *)&v75 * v5);
          uint64_t v95 = round(v76 * v6);
          std::string::size_type v71 = 0;
          uint64_t v72 = 0;
          v70 = 0;
          __p = (void *)4;
          v83 = v90;
          uint64_t v84 = 338250;
          std::__vformat_to[abi:ne180100]<std::back_insert_iterator<std::string>,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>((uint64_t)&v70, "\t\t[x:{:4}, y:{:4}, w:{:4}, h:{:4}]\n", 35, (uint64_t *)&__p);
          if (v72 >= 0) {
            v28 = (const std::string::value_type *)&v70;
          }
          else {
            v28 = (const std::string::value_type *)v70;
          }
          if (v72 >= 0) {
            std::string::size_type v29 = HIBYTE(v72);
          }
          else {
            std::string::size_type v29 = v71;
          }
          std::string::append(&v81, v28, v29);
          if (SHIBYTE(v72) < 0) {
            operator delete(v70);
          }
        }
        unsigned int v30 = (void *)[v25 dynamicBoundingBoxes];
        for (unsigned int k = 0; [v30 count] > (unint64_t)k; ++k)
        {
          objc_msgSend((id)objc_msgSend(v30, "objectAtIndexedSubscript:", k), "getValue:", &v73);
          v90[0] = round(*(double *)&v73 * v5);
          uint64_t v91 = round(v74 * v6);
          uint64_t v96 = 338250;
          uint64_t v93 = round(*(double *)&v75 * v5);
          uint64_t v95 = round(v76 * v6);
          std::string::size_type v71 = 0;
          uint64_t v72 = 0;
          v70 = 0;
          __p = (void *)4;
          v83 = v90;
          uint64_t v84 = 338250;
          std::__vformat_to[abi:ne180100]<std::back_insert_iterator<std::string>,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>((uint64_t)&v70, "\t\t[x:{:4}, y:{:4}, w:{:4}, h:{:4} (dynamic)]\n", 45, (uint64_t *)&__p);
          if (v72 >= 0) {
            v32 = (const std::string::value_type *)&v70;
          }
          else {
            v32 = (const std::string::value_type *)v70;
          }
          if (v72 >= 0) {
            std::string::size_type v33 = HIBYTE(v72);
          }
          else {
            std::string::size_type v33 = v71;
          }
          std::string::append(&v81, v32, v33);
          if (SHIBYTE(v72) < 0) {
            operator delete(v70);
          }
        }
        if ([v7 flipbook])
        {
          __p = 0;
          v83 = 0;
          uint64_t v84 = 0;
          v90[0] = 0;
          std::__vformat_to[abi:ne180100]<std::back_insert_iterator<std::string>,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>((uint64_t)&__p, "\tstates:\n", 9, v90);
          if (v84 >= 0) {
            float v34 = (const std::string::value_type *)&__p;
          }
          else {
            float v34 = (const std::string::value_type *)__p;
          }
          if (v84 >= 0) {
            std::string::size_type v35 = HIBYTE(v84);
          }
          else {
            std::string::size_type v35 = (std::string::size_type)v83;
          }
          std::string::append(&v81, v34, v35);
          if (SHIBYTE(v84) < 0) {
            operator delete(__p);
          }
          v87 = v54;
          uint64_t v88 = [v7 name];
          double v36 = (std::mutex *)SILStateMachineCreate((void *)[NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1]);
          char v37 = (void *)SILStateMachineStateList((uint64_t)v36);
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v66 objects:v86 count:16];
          if (v38)
          {
            uint64_t v59 = *(void *)v67;
            do
            {
              uint64_t v39 = 0;
              uint64_t v60 = v38;
              do
              {
                if (*(void *)v67 != v59) {
                  objc_enumerationMutation(v37);
                }
                uint64_t v40 = *(void **)(*((void *)&v66 + 1) + 8 * v39);
                uint64_t v41 = [v40 UTF8String];
                uint64_t v91 = 12;
                v90[0] = v41;
                std::string::size_type v71 = 0;
                uint64_t v72 = 0;
                v70 = 0;
                __p = (void *)1;
                v83 = v90;
                uint64_t v84 = 12;
                std::__vformat_to[abi:ne180100]<std::back_insert_iterator<std::string>,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>((uint64_t)&v70, "\t\t{:20} Transitions : ", 22, (uint64_t *)&__p);
                if (v72 >= 0) {
                  int v42 = (const std::string::value_type *)&v70;
                }
                else {
                  int v42 = (const std::string::value_type *)v70;
                }
                if (v72 >= 0) {
                  std::string::size_type v43 = HIBYTE(v72);
                }
                else {
                  std::string::size_type v43 = v71;
                }
                std::string::append(&v81, v42, v43);
                if (SHIBYTE(v72) < 0) {
                  operator delete(v70);
                }
                long long v62 = 0u;
                long long v63 = 0u;
                long long v64 = 0u;
                long long v65 = 0u;
                uint64_t v44 = [v37 countByEnumeratingWithState:&v62 objects:v85 count:16];
                uint64_t v61 = v39;
                if (v44)
                {
                  uint64_t v45 = *(void *)v63;
                  do
                  {
                    for (uint64_t m = 0; m != v44; ++m)
                    {
                      if (*(void *)v63 != v45) {
                        objc_enumerationMutation(v37);
                      }
                      v47 = *(void **)(*((void *)&v62 + 1) + 8 * m);
                      if (v40 != v47
                        && SILStateMachineTransitionSupported((uint64_t)v36, (uint64_t)v40, *(void *)(*((void *)&v62 + 1) + 8 * m)))
                      {
                        uint64_t v48 = [v47 UTF8String];
                        uint64_t v91 = 12;
                        v90[0] = v48;
                        std::string::size_type v71 = 0;
                        uint64_t v72 = 0;
                        v70 = 0;
                        __p = (void *)1;
                        v83 = v90;
                        uint64_t v84 = 12;
                        std::__vformat_to[abi:ne180100]<std::back_insert_iterator<std::string>,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>((uint64_t)&v70, "{}, ", 4, (uint64_t *)&__p);
                        uint64_t v49 = v72 >= 0 ? (const std::string::value_type *)&v70 : (const std::string::value_type *)v70;
                        std::string::size_type v50 = v72 >= 0 ? HIBYTE(v72) : v71;
                        std::string::append(&v81, v49, v50);
                        if (SHIBYTE(v72) < 0) {
                          operator delete(v70);
                        }
                      }
                    }
                    uint64_t v44 = [v37 countByEnumeratingWithState:&v62 objects:v85 count:16];
                  }
                  while (v44);
                }
                std::string::push_back(&v81, 10);
                uint64_t v39 = v61 + 1;
              }
              while (v61 + 1 != v60);
              uint64_t v38 = [v37 countByEnumeratingWithState:&v66 objects:v86 count:16];
            }
            while (v38);
          }
          SILStateMachineRelease(v36);
          unint64_t v4 = 0x26B347000;
        }
        std::string::append(&v81, "\n\n", 2uLL);
      }
      uint64_t v56 = [(NSArray *)obj countByEnumeratingWithState:&v77 objects:v89 count:16];
    }
    while (v56);
  }
  if ((v81.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v51 = &v81;
  }
  else {
    v51 = (std::string *)v81.__r_.__value_.__r.__words[0];
  }
  CFStringRef v52 = CFStringCreateWithCString(0, (const char *)v51, 0x8000100u);
  if (SHIBYTE(v81.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v81.__r_.__value_.__l.__data_);
  }
  return v52;
}

void sub_25B66F464(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,void *__p,uint64_t a53,int a54,__int16 a55,char a56,char a57,void *a58,uint64_t a59,int a60,__int16 a61,char a62,char a63)
{
  if (a57 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SILManagerSetPower(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (xnu_log::token != -1) {
    dispatch_once(&xnu_log::token, &__block_literal_global);
  }
  unint64_t v4 = xnu_log::xnu_log;
  if (os_log_type_enabled((os_log_t)xnu_log::xnu_log, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = a2;
    _os_log_impl(&dword_25B66B000, v4, OS_LOG_TYPE_INFO, "SILManagerSetPower %u", (uint8_t *)v8, 8u);
  }
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(a2, 1);
  if (v5)
  {
    if (xnu_log::token != -1) {
      dispatch_once(&xnu_log::token, &__block_literal_global);
    }
    double v6 = xnu_log::xnu_log;
    if (os_log_type_enabled((os_log_t)xnu_log::xnu_log, OS_LOG_TYPE_ERROR)) {
      SILManagerSetPower_cold_1(a2, v6);
    }
  }
  return v5;
}

uint64_t SILManagerTrySetPower(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (xnu_log::token != -1) {
    dispatch_once(&xnu_log::token, &__block_literal_global);
  }
  unint64_t v4 = xnu_log::xnu_log;
  if (os_log_type_enabled((os_log_t)xnu_log::xnu_log, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_25B66B000, v4, OS_LOG_TYPE_INFO, "SILManagerTrySetPower %u", (uint8_t *)v6, 8u);
  }
  return (*(uint64_t (**)(uint64_t, void))(a1 + 8))(a2, 0);
}

uint64_t SILManagerSwap(uint64_t (**a1)(void, void, void, uint64_t *, double, double, float, float), float *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v14 = 0;
  uint64_t v3 = (*a1)(*(unsigned __int8 *)a2, *((unsigned int *)a2 + 1), *((unsigned __int16 *)a2 + 12), &v14, a2[2], a2[3], a2[4], a2[5]);
  uint64_t v4 = v3;
  if (v3)
  {
    if (v3 == 9)
    {
      if (xnu_log::token != -1) {
        dispatch_once(&xnu_log::token, &__block_literal_global);
      }
      uint64_t v5 = xnu_log::xnu_log;
      if (os_log_type_enabled((os_log_t)xnu_log::xnu_log, OS_LOG_TYPE_ERROR)) {
        SILManagerSwap_cold_1(v5);
      }
    }
    else
    {
      if (xnu_log::token != -1) {
        dispatch_once(&xnu_log::token, &__block_literal_global);
      }
      double v6 = xnu_log::xnu_log;
      if (os_log_type_enabled((os_log_t)xnu_log::xnu_log, OS_LOG_TYPE_ERROR))
      {
        int v8 = *(unsigned __int8 *)a2;
        int v9 = *((_DWORD *)a2 + 1);
        int v10 = *((unsigned __int16 *)a2 + 12);
        double v11 = a2[2];
        double v12 = a2[3];
        double v13 = a2[5];
        *(_DWORD *)buf = 67110656;
        int v16 = v8;
        __int16 v17 = 1024;
        int v18 = v9;
        __int16 v19 = 1024;
        int v20 = v10;
        __int16 v21 = 2048;
        double v22 = v11;
        __int16 v23 = 2048;
        double v24 = v12;
        __int16 v25 = 2048;
        double v26 = v13;
        __int16 v27 = 1024;
        int v28 = v4;
        _os_log_error_impl(&dword_25B66B000, v6, OS_LOG_TYPE_ERROR, "SILManager failed to swap region %u with indicator %u, frame %u at [%fx%f] opacity %f err : 0x%x", buf, 0x38u);
      }
    }
  }
  return v4;
}

uint64_t SILManagerTurnOffRegions(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 0;
  }
  uint64_t v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a1 + 24))(a2, a3, &v4);
}

uint64_t SILManagerSwapEnd(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t SILManagerIndicatorTypeIDFromName(uint64_t a1)
{
  id v1 = -[SILManifest indicatorFromName:error:](+[SILManifest manifest](_TtC10SILManager11SILManifest, "manifest"), "indicatorFromName:error:", [NSString stringWithCString:a1 encoding:4], 0);
  if (v1) {
    return [v1 type];
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

id SILManagerIndicatorNameFromType(unsigned int a1)
{
  id result = [+[SILManifest manifest] indicatorFromType:a1 error:0];
  if (result)
  {
    NSUInteger v2 = (void *)[result name];
    return (id)[v2 UTF8String];
  }
  return result;
}

uint64_t SILManagerFrameNumberFromBounds(unsigned int a1, int *a2)
{
  id v3 = [+[SILManifest manifest] indicatorFromType:a1 error:0];
  if (v3 && (uint64_t v4 = v3, [v3 framesCount]))
  {
    unint64_t v5 = [v4 frames];
    uint64_t v6 = [v4 frames];
    unsigned int v7 = [v4 framesCount];
    int v8 = *a2;
    v12[0] = 0;
    uint64_t v13 = 0;
    int v14 = 0;
    v12[1] = v8;
    unint64_t v9 = closest_value<SILFrameDesc const*,SILFrameDesc&>(v5, v6 + 20 * v7, (unint64_t)v12, (float (*)(unint64_t, unint64_t))closest_frame_for_extent(SILFrameDesc const*,SILFrameDesc const*,float)::$_0::__invoke<SILFrameDesc,SILFrameDesc>);
    return (unsigned __int16)(-858993459 * ((v9 - [v4 frames]) >> 2));
  }
  else
  {
    LOWORD(v10) = -1;
  }
  return (unsigned __int16)v10;
}

unint64_t closest_frame_for_extent(const SILFrameDesc *a1, const SILFrameDesc *a2, float a3)
{
  v4[0] = 0;
  uint64_t v5 = 0;
  int v6 = 0;
  *(float *)&v4[1] = a3;
  return closest_value<SILFrameDesc const*,SILFrameDesc&>((unint64_t)a1, (unint64_t)a2, (unint64_t)v4, (float (*)(unint64_t, unint64_t))closest_frame_for_extent(SILFrameDesc const*,SILFrameDesc const*,float)::$_0::__invoke<SILFrameDesc,SILFrameDesc>);
}

id SILManagerIndicatorExtent(unsigned int a1)
{
  id result = [+[SILManifest manifest] indicatorFromType:a1 error:0];
  if (result) {
    return (id)[result extent];
  }
  return result;
}

uint64_t SILManagerIndicatorFrameExtent(unsigned int a1, unsigned int a2, _DWORD *a3)
{
  id v5 = [+[SILManifest manifest] indicatorFromType:a1 error:0];
  int v6 = v5;
  if (v5) {
    LODWORD(v5) = [v5 framesCount];
  }
  if (a3) {
    *a3 = v5;
  }
  if (v6) {
    BOOL v7 = v5 > a2;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    return *(float *)([v6 frames] + 20 * a2 + 4);
  }
  else {
    return 0;
  }
}

uint64_t SILManagerIndicatorValidPositions(unsigned int a1)
{
  id v1 = [+[SILManifest manifest] indicatorFromType:a1 error:0];
  return [v1 boundingBoxes];
}

uint64_t SILManagerIndicatorValidDynamicPositions(unsigned int a1)
{
  id v1 = [+[SILManifest manifest] indicatorFromType:a1 error:0];
  return [v1 dynamicBoundingBoxes];
}

unint64_t closest_value<SILFrameDesc const*,SILFrameDesc&>(unint64_t a1, unint64_t a2, unint64_t a3, float (*a4)(unint64_t, unint64_t))
{
  unint64_t v7 = a1;
  unint64_t v8 = a2;
  if (a2 != a1)
  {
    unint64_t v9 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(a2 - a1) >> 2);
    unint64_t v8 = a1;
    do
    {
      if (a4(a3, v8 + 20 * (v9 >> 1)) < 0.0)
      {
        v9 >>= 1;
      }
      else
      {
        v8 += 20 * (v9 >> 1) + 20;
        v9 += ~(v9 >> 1);
      }
    }
    while (v9);
  }
  if (v8 != v7)
  {
    if (v8 == a2)
    {
      return a2 - 20;
    }
    else
    {
      unint64_t v7 = v8 - 20;
      float v10 = a4(v8, a3);
      if (v10 < a4(v8 - 20, a3)) {
        return v8;
      }
    }
  }
  return v7;
}

unint64_t closest_frame_for_time(const SILFrameDesc *a1, const SILFrameDesc *a2, float a3)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  float v4 = a3;
  return closest_value<SILFrameDesc const*,SILFrameDesc&>((unint64_t)a1, (unint64_t)a2, (unint64_t)&v4, (float (*)(unint64_t, unint64_t))closest_frame_for_time(SILFrameDesc const*,SILFrameDesc const*,float)::$_0::__invoke<SILFrameDesc,SILFrameDesc>);
}

void __clang_call_terminate(void *a1)
{
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_265497E98, MEMORY[0x263F8C060]);
}

void sub_25B66FE5C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  id result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

float closest_frame_for_extent(SILFrameDesc const*,SILFrameDesc const*,float)::$_0::__invoke<SILFrameDesc,SILFrameDesc>(uint64_t a1, uint64_t a2)
{
  return *(float *)(a1 + 4) - *(float *)(a2 + 4);
}

float closest_frame_for_time(SILFrameDesc const*,SILFrameDesc const*,float)::$_0::__invoke<SILFrameDesc,SILFrameDesc>(float *a1, float *a2)
{
  return *a1 - *a2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> std::__vformat_to[abi:ne180100]<std::back_insert_iterator<std::string>,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(uint64_t a1, char *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  __int16 v17 = v16;
  long long v18 = xmmword_25B69CE10;
  __int16 v19 = std::__format::__output_buffer<char>::__output_buffer[abi:ne180100]<std::__format::__format_buffer<std::back_insert_iterator<std::string>,char>>(char *,unsigned long,std::__format::__format_buffer<std::back_insert_iterator<std::string>,char> *)::{lambda(char *,unsigned long,void *)#1}::__invoke;
  int v20 = v16;
  uint64_t v4 = *a4;
  v12[0] = a2;
  v12[1] = &a2[a3];
  int v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = v4;
  long long v8 = *(_OWORD *)a4;
  uint64_t v9 = a4[2];
  char v5 = 0;
  char v6 = 0;
  unint64_t v7 = &v17;
  LOBYTE(v10.__locale_) = 0;
  char v11 = 0;
  std::__format::__vformat_to[abi:ne180100]<std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(v12, (uint64_t **)&v7);
  if (v11) {
    std::locale::~locale(&v10);
  }
  v19(v17, *((void *)&v18 + 1), (uint64_t)v20);
}

void sub_25B66FFC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

uint64_t *std::__format::__vformat_to[abi:ne180100]<std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char **a1, uint64_t **a2)
{
  id v3 = *a1;
  uint64_t v4 = a1[1];
  char v5 = *a2;
  if (*a1 != v4)
  {
    while (1)
    {
      int v7 = *v3;
      if (v7 == 125) {
        break;
      }
      if (v7 != 123) {
        goto LABEL_10;
      }
      if (++v3 == v4) {
        std::__throw_format_error[abi:ne180100]("The format string terminates at a '{'");
      }
      if (*v3 == 123)
      {
LABEL_10:
        long long v8 = v3 + 1;
        std::locale v10 = v5;
        std::back_insert_iterator<std::__format::__output_buffer<char>>::operator=[abi:ne180100](&v10, v3);
        id v3 = v8;
        if (v8 == v4) {
          return v5;
        }
      }
      else
      {
        *a2 = v5;
        id v3 = std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(v3, v4, a1, a2);
        char v5 = *a2;
        if (v3 == v4) {
          return v5;
        }
      }
    }
    if (++v3 == v4 || *v3 != 125) {
      std::__throw_format_error[abi:ne180100]("The format string contains an invalid escape sequence");
    }
    goto LABEL_10;
  }
  return v5;
}

uint64_t std::__format::__output_buffer<char>::__output_buffer[abi:ne180100]<std::__format::__format_buffer<std::back_insert_iterator<std::string>,char>>(char *,unsigned long,std::__format::__format_buffer<std::back_insert_iterator<std::string>,char> *)::{lambda(char *,unsigned long,void *)#1}::__invoke(std::string::value_type *a1, std::string::size_type __n_add, uint64_t a3)
{
  uint64_t v4 = *(std::string **)(a3 + 296);
  if (SHIBYTE(v4->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::size_type v6 = v4->__r_.__value_.__r.__words[0];
    std::string::size_type size = v4->__r_.__value_.__l.__size_;
  }
  else
  {
    std::string::size_type size = HIBYTE(v4->__r_.__value_.__r.__words[2]);
    std::string::size_type v6 = *(void *)(a3 + 296);
  }
  return std::string::__insert_with_size<char *,char *>(v4, v6 + size, a1, &a1[__n_add], __n_add);
}

uint64_t std::string::__insert_with_size<char *,char *>(std::string *this, uint64_t a2, std::string::value_type *a3, std::string::value_type *a4, std::string::size_type __n_add)
{
  std::string::size_type v6 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    uint64_t v9 = (std::string *)this->__r_.__value_.__r.__words[0];
    std::string::size_type v7 = a2 - this->__r_.__value_.__r.__words[0];
    if (__n_add)
    {
      std::string::size_type size = this->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    std::string::size_type v6 = (std::string *)this->__r_.__value_.__r.__words[0];
    return (uint64_t)v6 + v7;
  }
  std::string::size_type v7 = a2 - (void)this;
  if (!__n_add) {
    return (uint64_t)v6 + v7;
  }
  std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
  uint64_t v9 = this;
LABEL_6:
  if (v9 <= (std::string *)a3 && (char *)&v9->__r_.__value_.__l.__data_ + size + 1 > a3)
  {
    std::string::__init_with_sentinel[abi:ne180100]<char *,char *>(&__p, a3, a4);
    std::string::size_type v10 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type v10 = __p.__r_.__value_.__l.__size_;
    }
    uint64_t v12 = std::string::__insert_from_safe_copy[abi:ne180100]<char *,char *>(v6, __n_add, v7, (char *)p_p, (char *)p_p + v10);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    return v12;
  }
  return std::string::__insert_from_safe_copy[abi:ne180100]<char *,char *>(this, __n_add, v7, a3, a4);
}

void sub_25B670238(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::string::__insert_from_safe_copy[abi:ne180100]<char *,char *>(std::string *this, std::string::size_type __n_add, std::string::size_type __n_copy, char *a4, char *a5)
{
  uint64_t v9 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    std::string::size_type v11 = (this->__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v11 - size >= __n_add)
    {
      uint64_t v12 = (std::string *)this->__r_.__value_.__r.__words[0];
      goto LABEL_7;
    }
  }
  else
  {
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v11 = 22;
    uint64_t v12 = this;
    if (22 - size >= __n_add)
    {
LABEL_7:
      size_t v13 = size - __n_copy;
      if (size == __n_copy) {
        std::string::size_type size = __n_copy;
      }
      else {
        memmove((char *)v12 + __n_copy + __n_add, (char *)v12 + __n_copy, v13);
      }
      goto LABEL_10;
    }
  }
  std::string::__grow_by(this, v11, size + __n_add - v11, size, __n_copy, 0, __n_add);
  v9->__r_.__value_.__l.__size_ = size + __n_add;
  uint64_t v12 = (std::string *)v9->__r_.__value_.__r.__words[0];
LABEL_10:
  std::string::size_type v14 = size + __n_add;
  if (SHIBYTE(v9->__r_.__value_.__r.__words[2]) < 0) {
    v9->__r_.__value_.__l.__size_ = v14;
  }
  else {
    *((unsigned char *)&v9->__r_.__value_.__s + 23) = v14 & 0x7F;
  }
  v12->__r_.__value_.__s.__data_[v14] = 0;
  if (a4 != a5)
  {
    uint64_t v15 = (char *)v12 + __n_copy;
    do
    {
      char v16 = *a4++;
      *v15++ = v16;
    }
    while (a4 != a5);
  }
  if (SHIBYTE(v9->__r_.__value_.__r.__words[2]) < 0) {
    uint64_t v9 = (std::string *)v9->__r_.__value_.__r.__words[0];
  }
  return (uint64_t)v9 + __n_copy;
}

void std::string::__init_with_sentinel[abi:ne180100]<char *,char *>(std::string *this, std::string::value_type *a2, std::string::value_type *a3)
{
  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  if (a2 != a3)
  {
    uint64_t v4 = a2;
    do
      std::string::push_back(this, *v4++);
    while (v4 != a3);
  }
}

void sub_25B6703C8(void *a1)
{
  __cxa_begin_catch(a1);
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  __cxa_rethrow();
}

void sub_25B6703E4(_Unwind_Exception *a1)
{
}

void std::__throw_format_error[abi:ne180100](const char *a1)
{
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::format_error::format_error[abi:ne180100](exception, a1);
}

void sub_25B670440(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char *a1, char *a2, char **a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  std::string::size_type v7 = std::__format::__parse_arg_id[abi:ne180100]<char const*,std::basic_format_parse_context<char>>(a1, a2, (uint64_t)a3);
  if (v7 == a2) {
    goto LABEL_14;
  }
  int v9 = *v7;
  BOOL v20 = v9 == 58;
  if (v9 == 125) {
    goto LABEL_5;
  }
  if (v9 != 58) {
LABEL_14:
  }
    std::__throw_format_error[abi:ne180100]("The argument index should end with a ':' or a '}'");
  ++v7;
LABEL_5:
  *a3 = v7;
  v19[0] = (uint64_t)a3;
  v19[1] = (uint64_t)a4;
  v19[2] = (uint64_t)&v20;
  unint64_t v10 = a4[1];
  if (v10 <= v8)
  {
    LOBYTE(v22) = 0;
  }
  else if (v10 > 0xC)
  {
    uint64_t v15 = (long long *)(a4[2] + 32 * v8);
    long long v16 = v15[1];
    long long v21 = *v15;
    long long v22 = v16;
  }
  else
  {
    std::string::size_type v11 = (uint64_t *)(a4[2] + 16 * v8);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    uint64_t v14 = (a4[3] >> (5 * v8)) & 0x1FLL;
    *(void *)&long long v21 = v13;
    *((void *)&v21 + 1) = v12;
    LOBYTE(v22) = v14;
  }
  std::__visit_format_arg[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(v19, (uint64_t)&v21);
  __int16 v17 = *a3;
  if (*a3 == a2 || *v17 != 125) {
    std::__throw_format_error[abi:ne180100]("The replacement field misses a terminating '}'");
  }
  return v17 + 1;
}

uint64_t **std::back_insert_iterator<std::__format::__output_buffer<char>>::operator=[abi:ne180100](uint64_t **a1, char *a2)
{
  id v3 = *a1;
  char v4 = *a2;
  uint64_t v5 = **a1;
  uint64_t v6 = (*a1)[2];
  v3[2] = v6 + 1;
  *(unsigned char *)(v5 + v6) = v4;
  if (v3[2] == v3[1])
  {
    ((void (*)(uint64_t))v3[3])(*v3);
    v3[2] = 0;
  }
  return a1;
}

std::runtime_error *std::format_error::format_error[abi:ne180100](std::runtime_error *a1, const char *a2)
{
  id result = std::runtime_error::runtime_error(a1, a2);
  result->__vftable = (std::runtime_error_vtbl *)&unk_270904210;
  return result;
}

void std::format_error::~format_error(std::runtime_error *this)
{
  std::runtime_error::~runtime_error(this);
  JUMPOUT(0x261165F80);
}

char *std::__format::__parse_arg_id[abi:ne180100]<char const*,std::basic_format_parse_context<char>>(char *a1, char *a2, uint64_t a3)
{
  id v3 = a1;
  int v4 = *a1;
  if (v4 == 125 || v4 == 58)
  {
    std::basic_format_parse_context<char>::next_arg_id[abi:ne180100](a3);
    return v3;
  }
  if (v4 == 48)
  {
    int v5 = *(_DWORD *)(a3 + 16);
    if (v5)
    {
      if (v5 == 2) {
        std::__throw_format_error[abi:ne180100]("Using manual argument numbering in automatic argument numbering mode");
      }
    }
    else
    {
      *(_DWORD *)(a3 + 16) = 1;
    }
    return a1 + 1;
  }
  if ((v4 - 58) <= 0xF5u) {
    std::__throw_format_error[abi:ne180100]("The argument index starts with an invalid character");
  }
  return std::__format::__detail::__parse_manual[abi:ne180100]<char const*,std::basic_format_parse_context<char>>((unint64_t)a1, a2, a3);
}

void *std::__visit_format_arg[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(uint64_t *a1, uint64_t a2)
{
  switch(*(unsigned char *)(a2 + 16))
  {
    case 1:
      id result = std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},BOOL &>((uint64_t)a1, (unsigned __int8 *)a2);
      break;
    case 2:
      id result = std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},char &>((uint64_t)a1, (unsigned __int8 *)a2);
      break;
    case 3:
      id result = std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},int &>((uint64_t)a1, (int *)a2);
      break;
    case 4:
      id result = std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},long long &>((uint64_t)a1, (uint64_t *)a2);
      break;
    case 5:
      id result = std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},long long &>((uint64_t)a1, (unint64_t *)a2);
      break;
    case 6:
      id result = std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},unsigned int &>((uint64_t)a1, (unsigned int *)a2);
      break;
    case 7:
      id result = std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},unsigned long long &>((uint64_t)a1, (unint64_t *)a2);
      break;
    case 8:
      id result = std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},unsigned long long &>((uint64_t)a1, (unint64_t *)a2);
      break;
    case 9:
      id result = std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},float &>((uint64_t)a1, (float *)a2);
      break;
    case 0xA:
      id result = std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},double &>((uint64_t)a1, (double *)a2);
      break;
    case 0xB:
      id result = std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},long double &>((uint64_t)a1, (double *)a2);
      break;
    case 0xC:
      id result = std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},char const*&>((uint64_t)a1, (char **)a2);
      break;
    case 0xD:
      id result = std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},std::string_view &>((uint64_t)a1, a2);
      break;
    case 0xE:
      id result = std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},void const*&>((uint64_t)a1, (unint64_t *)a2);
      break;
    case 0xF:
      uint64_t v3 = a1[1];
      uint64_t v4 = *(void *)a2;
      int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 8);
      uint64_t v6 = *a1;
      id result = (void *)v5(v6, v3, v4);
      break;
    default:
      std::__throw_format_error[abi:ne180100]("The argument index value is too large for the number of arguments supplied");
  }
  return result;
}

char *std::__format::__detail::__parse_manual[abi:ne180100]<char const*,std::basic_format_parse_context<char>>(unint64_t a1, char *a2, uint64_t a3)
{
  id result = std::__format::__parse_number[abi:ne180100]<char const*>(a1, a2);
  int v5 = *(_DWORD *)(a3 + 16);
  if (v5)
  {
    if (v5 == 2) {
      std::__throw_format_error[abi:ne180100]("Using manual argument numbering in automatic argument numbering mode");
    }
  }
  else
  {
    *(_DWORD *)(a3 + 16) = 1;
  }
  return result;
}

uint64_t std::basic_format_parse_context<char>::next_arg_id[abi:ne180100](uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16);
  if (v1)
  {
    if (v1 == 1) {
      std::__throw_format_error[abi:ne180100]("Using automatic argument numbering in manual argument numbering mode");
    }
  }
  else
  {
    *(_DWORD *)(a1 + 16) = 2;
  }
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v2 + 1;
  return v2;
}

char *std::__format::__parse_number[abi:ne180100]<char const*>(unint64_t a1, char *a2)
{
  if ((uint64_t)&a2[-a1] <= 9) {
    uint64_t v2 = (unsigned __int8 *)a2;
  }
  else {
    uint64_t v2 = (unsigned __int8 *)(a1 + 9);
  }
  uint64_t v3 = (unsigned __int8 *)(a1 + 1);
  unsigned int v4 = *(char *)a1 - 48;
  if ((unsigned __int8 *)(a1 + 1) == v2)
  {
LABEL_8:
    if (v2 == (unsigned __int8 *)a2)
    {
      return a2;
    }
    else
    {
      uint64_t v6 = *v2;
      if ((v6 - 48) > 9)
      {
        return (char *)v2;
      }
      else if ((v6 + 10 * (unint64_t)v4 - 48) >> 31 {
             || (uint64_t v3 = (unsigned __int8 *)(a1 + 2), (char *)(a1 + 2) != a2) && *v3 - 48 <= 9)
      }
      {
        std::__throw_format_error[abi:ne180100]("The numeric value of the format specifier is too large");
      }
    }
  }
  else
  {
    a1 += (unint64_t)&v2[~a1];
    while (1)
    {
      int v5 = *v3;
      if ((v5 - 58) < 0xFFFFFFF6) {
        break;
      }
      unsigned int v4 = v5 + 10 * v4 - 48;
      if (++v3 == v2) {
        goto LABEL_8;
      }
    }
  }
  return (char *)v3;
}

void *std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},BOOL &>(uint64_t a1, unsigned __int8 *a2)
{
  int v3 = *a2;
  uint64_t v8 = 0;
  int v9 = -1;
  char v10 = 32;
  __int16 v11 = 0;
  char v12 = 0;
  if (**(unsigned char **)(a1 + 16))
  {
    unsigned int v4 = *(unsigned __int8 ***)a1;
    int v5 = std::__format_spec::__parser<char>::__parse[abi:ne180100]<std::basic_format_parse_context<char>>(&v8, *(unsigned __int8 ***)a1, 0x137u);
    std::__format_spec::__process_parsed_BOOL[abi:ne180100]<char>((uint64_t)&v8, "a BOOL");
    std::string::value_type *v4 = v5;
  }
  uint64_t v6 = *(void **)(a1 + 8);
  id result = std::formatter<BOOL,char>::format[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((uint64_t)&v8, v3 != 0, v6);
  void *v6 = result;
  return result;
}

void *std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},char &>(uint64_t a1, unsigned __int8 *a2)
{
  unsigned __int8 v3 = *a2;
  uint64_t v8 = 0;
  int v9 = -1;
  char v10 = 32;
  __int16 v11 = 0;
  char v12 = 0;
  if (**(unsigned char **)(a1 + 16))
  {
    unsigned int v4 = *(unsigned __int8 ***)a1;
    int v5 = std::__format_spec::__parser<char>::__parse[abi:ne180100]<std::basic_format_parse_context<char>>(&v8, *(unsigned __int8 ***)a1, 0x137u);
    std::__format_spec::__process_parsed_char[abi:ne180100]<char>((uint64_t)&v8, "a character");
    std::string::value_type *v4 = v5;
  }
  uint64_t v6 = *(void **)(a1 + 8);
  id result = std::__formatter_char<char>::format[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((uint64_t)&v8, v3, v6);
  void *v6 = result;
  return result;
}

void *std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},int &>(uint64_t a1, int *a2)
{
  int v3 = *a2;
  uint64_t v8 = 0;
  int v9 = -1;
  char v10 = 32;
  __int16 v11 = 0;
  char v12 = 0;
  if (**(unsigned char **)(a1 + 16))
  {
    unsigned int v4 = *(unsigned __int8 ***)a1;
    int v5 = std::__format_spec::__parser<char>::__parse[abi:ne180100]<std::basic_format_parse_context<char>>(&v8, *(unsigned __int8 ***)a1, 0x137u);
    std::__format_spec::__process_parsed_integer[abi:ne180100]<char>((uint64_t)&v8, "an integer");
    std::string::value_type *v4 = v5;
  }
  uint64_t v6 = *(void **)(a1 + 8);
  id result = std::__formatter_integer<char>::format[abi:ne180100]<int,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((char *)&v8, v3, v6);
  void *v6 = result;
  return result;
}

void *std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},long long &>(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v8 = 0;
  int v9 = -1;
  char v10 = 32;
  __int16 v11 = 0;
  char v12 = 0;
  if (**(unsigned char **)(a1 + 16))
  {
    unsigned int v4 = *(unsigned __int8 ***)a1;
    int v5 = std::__format_spec::__parser<char>::__parse[abi:ne180100]<std::basic_format_parse_context<char>>(&v8, *(unsigned __int8 ***)a1, 0x137u);
    std::__format_spec::__process_parsed_integer[abi:ne180100]<char>((uint64_t)&v8, "an integer");
    std::string::value_type *v4 = v5;
  }
  uint64_t v6 = *(void **)(a1 + 8);
  id result = std::__formatter_integer<char>::format[abi:ne180100]<long long,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((char *)&v8, v3, v6);
  void *v6 = result;
  return result;
}

void *std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},long long &>(uint64_t a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  uint64_t v3 = a2[1];
  uint64_t v9 = 0;
  int v10 = -1;
  char v11 = 32;
  __int16 v12 = 0;
  char v13 = 0;
  if (**(unsigned char **)(a1 + 16))
  {
    int v5 = *(unsigned __int8 ***)a1;
    uint64_t v6 = std::__format_spec::__parser<char>::__parse[abi:ne180100]<std::basic_format_parse_context<char>>(&v9, *(unsigned __int8 ***)a1, 0x137u);
    std::__format_spec::__process_parsed_integer[abi:ne180100]<char>((uint64_t)&v9, "an integer");
    *int v5 = v6;
  }
  std::string::size_type v7 = *(void **)(a1 + 8);
  id result = std::__formatter_integer<char>::format[abi:ne180100]<__int128,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((char *)&v9, v4, v3, v7);
  void *v7 = result;
  return result;
}

void *std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},unsigned int &>(uint64_t a1, unsigned int *a2)
{
  unsigned int v3 = *a2;
  uint64_t v8 = 0;
  int v9 = -1;
  char v10 = 32;
  __int16 v11 = 0;
  char v12 = 0;
  if (**(unsigned char **)(a1 + 16))
  {
    unint64_t v4 = *(unsigned __int8 ***)a1;
    int v5 = std::__format_spec::__parser<char>::__parse[abi:ne180100]<std::basic_format_parse_context<char>>(&v8, *(unsigned __int8 ***)a1, 0x137u);
    std::__format_spec::__process_parsed_integer[abi:ne180100]<char>((uint64_t)&v8, "an integer");
    std::string::value_type *v4 = v5;
  }
  uint64_t v6 = *(void **)(a1 + 8);
  id result = std::__formatter_integer<char>::format[abi:ne180100]<unsigned int,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((char *)&v8, v3, v6);
  void *v6 = result;
  return result;
}

void *std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},unsigned long long &>(uint64_t a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  uint64_t v8 = 0;
  int v9 = -1;
  char v10 = 32;
  __int16 v11 = 0;
  char v12 = 0;
  if (**(unsigned char **)(a1 + 16))
  {
    unint64_t v4 = *(unsigned __int8 ***)a1;
    int v5 = std::__format_spec::__parser<char>::__parse[abi:ne180100]<std::basic_format_parse_context<char>>(&v8, *(unsigned __int8 ***)a1, 0x137u);
    std::__format_spec::__process_parsed_integer[abi:ne180100]<char>((uint64_t)&v8, "an integer");
    std::string::value_type *v4 = v5;
  }
  uint64_t v6 = *(void **)(a1 + 8);
  id result = std::__formatter_integer<char>::format[abi:ne180100]<unsigned long long,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((char *)&v8, v3, v6);
  void *v6 = result;
  return result;
}

void *std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},unsigned long long &>(uint64_t a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  uint64_t v9 = 0;
  int v10 = -1;
  char v11 = 32;
  __int16 v12 = 0;
  char v13 = 0;
  if (**(unsigned char **)(a1 + 16))
  {
    int v5 = *(unsigned __int8 ***)a1;
    uint64_t v6 = std::__format_spec::__parser<char>::__parse[abi:ne180100]<std::basic_format_parse_context<char>>(&v9, *(unsigned __int8 ***)a1, 0x137u);
    std::__format_spec::__process_parsed_integer[abi:ne180100]<char>((uint64_t)&v9, "an integer");
    *int v5 = v6;
  }
  std::string::size_type v7 = *(void **)(a1 + 8);
  id result = std::__formatter_integer<char>::format[abi:ne180100]<unsigned __int128,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((char *)&v9, v4, v3, v7);
  void *v7 = result;
  return result;
}

uint64_t *std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},float &>(uint64_t a1, float *a2)
{
  float v3 = *a2;
  uint64_t v11 = 0;
  int v12 = -1;
  char v13 = 32;
  __int16 v14 = 0;
  char v15 = 0;
  if (**(unsigned char **)(a1 + 16))
  {
    unint64_t v4 = *(unsigned __int8 ***)a1;
    int v5 = std::__format_spec::__parser<char>::__parse[abi:ne180100]<std::basic_format_parse_context<char>>(&v11, *(unsigned __int8 ***)a1, 0x13Fu);
    if (BYTE1(v11) - 13 >= 6)
    {
      if (BYTE1(v11) > 0xCu || ((1 << SBYTE1(v11)) & 0x1801) == 0) {
        std::__format_spec::__throw_invalid_type_format_error[abi:ne180100]("a floating-point");
      }
    }
    else if ((SWORD1(v11) & 0x80000000) == 0 && v12 == -1)
    {
      int v12 = 6;
    }
    std::string::value_type *v4 = v5;
  }
  std::string::size_type v7 = *(uint64_t ***)(a1 + 8);
  unint64_t v8 = std::__format_spec::__parser<char>::__get_parsed_std_specifications[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((char *)&v11, v7);
  id result = std::__formatter::__format_floating_point[abi:ne180100]<float,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(v7, v8, v9, v3);
  void *v7 = result;
  return result;
}

uint64_t *std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},double &>(uint64_t a1, double *a2)
{
  double v3 = *a2;
  uint64_t v11 = 0;
  int v12 = -1;
  char v13 = 32;
  __int16 v14 = 0;
  char v15 = 0;
  if (**(unsigned char **)(a1 + 16))
  {
    unint64_t v4 = *(unsigned __int8 ***)a1;
    int v5 = std::__format_spec::__parser<char>::__parse[abi:ne180100]<std::basic_format_parse_context<char>>(&v11, *(unsigned __int8 ***)a1, 0x13Fu);
    if (BYTE1(v11) - 13 >= 6)
    {
      if (BYTE1(v11) > 0xCu || ((1 << SBYTE1(v11)) & 0x1801) == 0) {
        std::__format_spec::__throw_invalid_type_format_error[abi:ne180100]("a floating-point");
      }
    }
    else if ((SWORD1(v11) & 0x80000000) == 0 && v12 == -1)
    {
      int v12 = 6;
    }
    std::string::value_type *v4 = v5;
  }
  std::string::size_type v7 = *(uint64_t ***)(a1 + 8);
  unint64_t v8 = std::__format_spec::__parser<char>::__get_parsed_std_specifications[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((char *)&v11, v7);
  id result = std::__formatter::__format_floating_point[abi:ne180100]<double,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(v7, v8, v9, v3);
  void *v7 = result;
  return result;
}

uint64_t *std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},long double &>(uint64_t a1, double *a2)
{
  double v3 = *a2;
  uint64_t v11 = 0;
  int v12 = -1;
  char v13 = 32;
  __int16 v14 = 0;
  char v15 = 0;
  if (**(unsigned char **)(a1 + 16))
  {
    unint64_t v4 = *(unsigned __int8 ***)a1;
    int v5 = std::__format_spec::__parser<char>::__parse[abi:ne180100]<std::basic_format_parse_context<char>>(&v11, *(unsigned __int8 ***)a1, 0x13Fu);
    if (BYTE1(v11) - 13 >= 6)
    {
      if (BYTE1(v11) > 0xCu || ((1 << SBYTE1(v11)) & 0x1801) == 0) {
        std::__format_spec::__throw_invalid_type_format_error[abi:ne180100]("a floating-point");
      }
    }
    else if ((SWORD1(v11) & 0x80000000) == 0 && v12 == -1)
    {
      int v12 = 6;
    }
    std::string::value_type *v4 = v5;
  }
  std::string::size_type v7 = *(uint64_t ***)(a1 + 8);
  unint64_t v8 = std::__format_spec::__parser<char>::__get_parsed_std_specifications[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((char *)&v11, v7);
  id result = std::__formatter::__format_floating_point[abi:ne180100]<long double,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(v7, v8, v9, v3);
  void *v7 = result;
  return result;
}

uint64_t *std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},char const*&>(uint64_t a1, char **a2)
{
  double v3 = *a2;
  int v7 = 1;
  unint64_t v8 = 0xFFFFFFFF00000000;
  char v9 = 32;
  __int16 v10 = 0;
  char v11 = 0;
  if (**(unsigned char **)(a1 + 16))
  {
    unint64_t v4 = *(unsigned __int8 ***)a1;
    std::string::value_type *v4 = std::__formatter_string<char>::parse[abi:ne180100]<std::basic_format_parse_context<char>>(&v7, *(unsigned __int8 ***)a1);
  }
  int v5 = *(uint64_t ***)(a1 + 8);
  id result = std::formatter<char const*,char>::format[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((char *)&v7, v3, v5);
  *int v5 = result;
  return result;
}

void *std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},std::string_view &>(uint64_t a1, uint64_t a2)
{
  double v3 = *(char **)a2;
  size_t v4 = *(void *)(a2 + 8);
  int v11 = 1;
  unint64_t v12 = 0xFFFFFFFF00000000;
  char v13 = 32;
  __int16 v14 = 0;
  char v15 = 0;
  if (**(unsigned char **)(a1 + 16))
  {
    int v5 = *(unsigned __int8 ***)a1;
    *int v5 = std::__formatter_string<char>::parse[abi:ne180100]<std::basic_format_parse_context<char>>(&v11, *(unsigned __int8 ***)a1);
  }
  uint64_t v6 = *(void **)(a1 + 8);
  int v7 = (void *)*v6;
  unint64_t v8 = std::__format_spec::__parser<char>::__get_parsed_std_specifications[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((char *)&v11, v6);
  id result = std::__formatter::__write_string[abi:ne180100]<char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(v3, v4, v7, v8, v9);
  void *v6 = result;
  return result;
}

void *std::invoke[abi:ne180100]<char const* std::__format::__handle_replacement_field[abi:ne180100]<char const*,std::basic_format_parse_context<char>,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char const*,char const*,std::basic_format_parse_context<char> &,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char> &)::{lambda(char const*)#1},void const*&>(uint64_t a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  uint64_t v7 = 0;
  int v8 = -1;
  char v9 = 32;
  __int16 v10 = 0;
  char v11 = 0;
  if (**(unsigned char **)(a1 + 16))
  {
    size_t v4 = *(unsigned __int8 ***)a1;
    std::string::value_type *v4 = std::__formatter_pointer<char>::parse[abi:ne180100]<std::basic_format_parse_context<char>>(&v7, *(unsigned __int8 ***)a1);
  }
  int v5 = *(void **)(a1 + 8);
  id result = std::__formatter_pointer<char>::format[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((char *)&v7, v3, v5);
  *int v5 = result;
  return result;
}

void *std::formatter<BOOL,char>::format[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(uint64_t a1, unsigned int a2, void *a3)
{
  if (*(unsigned __int8 *)(a1 + 1) > 1u)
  {
    unint64_t v9 = std::__format_spec::__parser<char>::__get_parsed_std_specifications[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((char *)a1, a3);
    return std::__formatter::__format_integer[abi:ne180100]<unsigned int,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a2, (void **)a3, v9, v8, 0);
  }
  else
  {
    unint64_t v6 = std::__format_spec::__parser<char>::__get_parsed_std_specifications[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((char *)a1, a3);
    return std::__formatter::__format_BOOL[abi:ne180100]<char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a2, (void **)a3, v6, v5);
  }
}

unsigned __int8 *std::__format_spec::__parser<char>::__parse[abi:ne180100]<std::basic_format_parse_context<char>>(unsigned char *a1, unsigned __int8 **a2, unsigned __int16 a3)
{
  unint64_t v3 = *a2;
  size_t v4 = a2[1];
  __int16 v17 = (char *)v3;
  if (v3 == v4) {
    return v3;
  }
  int v8 = std::__format_spec::__parser<char>::__parse_fill_align[abi:ne180100]<char const*>(a1, (unsigned __int8 **)&v17, v4, (a3 >> 6) & 1);
  unint64_t v9 = (unsigned __int8 *)v17;
  if (v8) {
    BOOL v10 = v17 == (char *)v4;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10)
  {
    if ((a3 & 1) == 0) {
      goto LABEL_14;
    }
    int v11 = *v17;
    switch(v11)
    {
      case ' ':
        char v12 = *a1 | 0x18;
        break;
      case '+':
        char v12 = *a1 & 0xE7 | 0x10;
        break;
      case '-':
        char v12 = *a1 & 0xE7 | 8;
        break;
      default:
LABEL_14:
        if ((a3 & 2) == 0 || *v9 != 35 || (*a1 |= 0x20u, ++v9, __int16 v17 = (char *)v9, v9 != v4))
        {
          if ((a3 & 4) == 0 || *v9 != 48) {
            goto LABEL_22;
          }
          if ((*a1 & 7) == 0) {
            *a1 = *a1 & 0xF8 | 4;
          }
          __int16 v17 = (char *)(v9 + 1);
          if (v9 + 1 != v4)
          {
LABEL_22:
            int v13 = std::__format_spec::__parser<char>::__parse_width[abi:ne180100]<char const*,std::basic_format_parse_context<char>>((uint64_t)a1, (unint64_t *)&v17, (char *)v4, (uint64_t)a2);
            __int16 v14 = (unsigned __int8 *)v17;
            if (!v13 || v17 != (char *)v4)
            {
              if ((a3 & 8) == 0
                || (v16 = std::__format_spec::__parser<char>::__parse_precision[abi:ne180100]<char const*,std::basic_format_parse_context<char>>((uint64_t)a1, &v17, (char *)v4, (uint64_t)a2), __int16 v14 = (unsigned __int8 *)v17, !v16)|| v17 != (char *)v4)
              {
                if ((a3 & 0x10) == 0 || *v14 != 76 || (*a1 |= 0x40u, ++v14, __int16 v17 = (char *)v14, v14 != v4))
                {
                  if ((a3 & 0x80) == 0 || *v14 != 110 || (*a1 |= 0x80u, __int16 v17 = (char *)(v14 + 1), v14 + 1 != v4))
                  {
                    if ((a3 & 0x20) != 0) {
                      std::__format_spec::__parser<char>::__parse_type[abi:ne180100]<char const*>((uint64_t)a1, &v17);
                    }
                    unint64_t v3 = (unsigned __int8 *)v17;
                    if ((a3 & 0x100) == 0) {
                      return v3;
                    }
                    if (v17 != (char *)v4)
                    {
                      size_t v4 = (unsigned __int8 *)v17;
                      if (*v17 != 125) {
                        std::__throw_format_error[abi:ne180100]("The format specifier should consume the input or end with a '}'");
                      }
                    }
                  }
                }
              }
            }
          }
        }
        return v4;
    }
    *a1 = v12;
    __int16 v17 = (char *)++v9;
    if (v9 == v4) {
      return v4;
    }
    goto LABEL_14;
  }
  return v4;
}

uint64_t std::__format_spec::__process_parsed_BOOL[abi:ne180100]<char>(uint64_t result, const char *a2)
{
  unsigned int v2 = *(unsigned __int8 *)(result + 1);
  if (v2 - 2 >= 6)
  {
    if (v2 > 1) {
      std::__format_spec::__throw_invalid_type_format_error[abi:ne180100](a2);
    }
    unint64_t v3 = (unsigned char *)result;
    id result = std::__format_spec::__parser<char>::__validate[abi:ne180100](result, 48, a2, -1);
    if ((*v3 & 7) == 0) {
      *unint64_t v3 = *v3 & 0xF8 | 1;
    }
  }
  return result;
}

uint64_t std::__format_spec::__parser<char>::__parse_fill_align[abi:ne180100]<char const*>(unsigned char *a1, unsigned __int8 **a2, unsigned __int8 *a3, int a4)
{
  v17[0] = *a2;
  v17[1] = a3;
  if ((std::__unicode::__code_point_view<char>::__consume[abi:ne180100](v17) & 0x80000000) != 0) {
    std::__throw_format_error[abi:ne180100]("The format specifier contains malformed Unicode characters");
  }
  int v8 = v17[0];
  if (v17[0] >= a3) {
    goto LABEL_7;
  }
  int v9 = (char)*v17[0];
  switch(v9)
  {
    case '<':
      char v10 = 1;
      goto LABEL_17;
    case '>':
      char v10 = 3;
LABEL_17:
      *a1 = *a1 & 0xF8 | v10;
      char v15 = *a2;
      size_t v16 = v8 - *a2;
      if (v16 == 1)
      {
        std::__format_spec::__parser<char>::__validate_fill_character[abi:ne180100]((uint64_t)a1, (char)*v15, a4);
        char v15 = *a2;
      }
      else if (v8 == v15)
      {
LABEL_21:
        int v13 = &v8[v16];
        goto LABEL_22;
      }
      memmove(a1 + 12, v15, v16);
      int v8 = *a2;
      goto LABEL_21;
    case '^':
      char v10 = 2;
      goto LABEL_17;
  }
LABEL_7:
  int v11 = (char)**a2;
  switch(v11)
  {
    case '<':
      char v12 = 1;
      break;
    case '>':
      char v12 = 3;
      break;
    case '^':
      char v12 = 2;
      break;
    default:
      return 0;
  }
  *a1 = *a1 & 0xF8 | v12;
  int v13 = *a2;
LABEL_22:
  *a2 = v13 + 1;
  return 1;
}

uint64_t std::__format_spec::__parser<char>::__parse_width[abi:ne180100]<char const*,std::basic_format_parse_context<char>>(uint64_t a1, unint64_t *a2, char *a3, uint64_t a4)
{
  unint64_t v6 = *a2;
  int v7 = *(unsigned __int8 *)*a2;
  if (v7 == 123)
  {
    int v9 = (char *)(v6 + 1);
    *a2 = (unint64_t)v9;
    char v10 = std::__format_spec::__parse_arg_id[abi:ne180100]<char const*,std::basic_format_parse_context<char>>(v9, a3, a4);
    *(_WORD *)(a1 + 2) |= 0x4000u;
  }
  else
  {
    if (v7 == 48) {
      std::__throw_format_error[abi:ne180100]("The width option should not have a leading zero");
    }
    if ((v7 - 58) < 0xFFFFFFF6) {
      return 0;
    }
    char v10 = std::__format::__parse_number[abi:ne180100]<char const*>(v6, a3);
  }
  *(_DWORD *)(a1 + 4) = v11;
  *a2 = (unint64_t)v10;
  return 1;
}

BOOL std::__format_spec::__parser<char>::__parse_precision[abi:ne180100]<char const*,std::basic_format_parse_context<char>>(uint64_t a1, char **a2, char *a3, uint64_t a4)
{
  size_t v4 = *a2;
  int v5 = **a2;
  if (v5 == 46)
  {
    int v8 = (unsigned __int8 *)(v4 + 1);
    *a2 = v4 + 1;
    if (v4 + 1 == a3) {
      std::__throw_format_error[abi:ne180100]("End of input while parsing format specifier precision");
    }
    int v9 = *v8;
    if (v9 == 123)
    {
      *a2 = v4 + 2;
      char v10 = std::__format_spec::__parse_arg_id[abi:ne180100]<char const*,std::basic_format_parse_context<char>>(v4 + 2, a3, a4);
      *(_WORD *)(a1 + 2) |= 0x8000u;
      *(_DWORD *)(a1 + 8) = v11;
    }
    else
    {
      if ((v9 - 58) <= 0xFFFFFFF5) {
        std::__throw_format_error[abi:ne180100]("The precision option does not contain a value or an argument index");
      }
      char v10 = std::__format::__parse_number[abi:ne180100]<char const*>((unint64_t)v8, a3);
      *(_DWORD *)(a1 + 8) = v12;
      *(_WORD *)(a1 + 2) &= ~0x8000u;
    }
    *a2 = v10;
  }
  return v5 == 46;
}

uint64_t std::__format_spec::__parser<char>::__parse_type[abi:ne180100]<char const*>(uint64_t result, char **a2)
{
  unsigned int v2 = *a2;
  int v3 = **a2;
  if (v3 <= 96)
  {
    int v5 = v3 - 65;
    char v4 = 12;
    switch(v5)
    {
      case 0:
        goto LABEL_19;
      case 1:
        char v4 = 3;
        goto LABEL_19;
      case 4:
        char v4 = 14;
        goto LABEL_19;
      case 5:
        char v4 = 16;
        goto LABEL_19;
      case 6:
        char v4 = 18;
LABEL_19:
        *(unsigned char *)(result + 1) = v4;
        *a2 = v2 + 1;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(**a2)
    {
      case 'a':
        char v4 = 11;
        goto LABEL_19;
      case 'b':
        char v4 = 2;
        goto LABEL_19;
      case 'c':
        char v4 = 10;
        goto LABEL_19;
      case 'd':
        char v4 = 5;
        goto LABEL_19;
      case 'e':
        char v4 = 13;
        goto LABEL_19;
      case 'f':
        char v4 = 15;
        goto LABEL_19;
      case 'g':
        char v4 = 17;
        goto LABEL_19;
      case 'o':
        char v4 = 4;
        goto LABEL_19;
      case 'p':
        char v4 = 8;
        goto LABEL_19;
      case 's':
        char v4 = 1;
        goto LABEL_19;
      case 'x':
        char v4 = 6;
        goto LABEL_19;
      default:
        return result;
    }
  }
  return result;
}

uint64_t std::__unicode::__code_point_view<char>::__consume[abi:ne180100](unsigned __int8 **a1)
{
  int v1 = *a1;
  int v2 = **a1;
  unsigned int v3 = __clz(v2 ^ 0xFF) - 24;
  if (v2 == 255) {
    int v4 = 8;
  }
  else {
    int v4 = v3;
  }
  switch(v4)
  {
    case 0:
      *a1 = v1 + 1;
      uint64_t v5 = *v1;
      break;
    case 2:
      if (a1[1] - v1 < 2 || (v1[1] & 0xC0) != 0x80) {
        goto LABEL_35;
      }
      *a1 = v1 + 1;
      char v6 = *v1;
      *a1 = v1 + 2;
      unsigned int v7 = v1[1] & 0x3F | ((v6 & 0x1F) << 6);
      if (v7 >= 0x80) {
        uint64_t v5 = v7;
      }
      else {
        uint64_t v5 = 2147549181;
      }
      break;
    case 3:
      if (a1[1] - v1 < 3) {
        goto LABEL_35;
      }
      uint64_t v8 = 1;
      do
        int v9 = v1[v8] & 0xC0;
      while (v9 == 128 && v8++ != 2);
      if (v9 != 128) {
        goto LABEL_35;
      }
      uint64_t v5 = 2147549181;
      *a1 = v1 + 1;
      int v11 = *v1 & 0xF;
      *a1 = v1 + 2;
      int v12 = (v11 << 12) | ((v1[1] & 0x3F) << 6);
      *a1 = v1 + 3;
      unsigned int v13 = v12 & 0xFFFFFFC0 | v1[2] & 0x3F;
      if (v13 >= 0x800)
      {
        if ((v12 & 0xF800) == 0xD800) {
          uint64_t v5 = 2147549181;
        }
        else {
          uint64_t v5 = v13;
        }
      }
      break;
    case 4:
      if (a1[1] - v1 < 4) {
        goto LABEL_35;
      }
      uint64_t v14 = 1;
      do
        int v15 = v1[v14] & 0xC0;
      while (v15 == 128 && v14++ != 3);
      if (v15 != 128) {
        goto LABEL_35;
      }
      uint64_t v5 = 2147549181;
      *a1 = v1 + 1;
      int v17 = *v1 & 7;
      *a1 = v1 + 2;
      int v18 = (v17 << 12) | ((v1[1] & 0x3F) << 6);
      *a1 = v1 + 3;
      unsigned int v19 = v18 & 0xFFFFFFC0 | v1[2] & 0x3F;
      *a1 = v1 + 4;
      unsigned int v20 = v1[3] & 0x3F | (v19 << 6);
      if (v20 >= 0x10000)
      {
        if (v20 >= 0x110000) {
          uint64_t v5 = 2147549181;
        }
        else {
          uint64_t v5 = v20;
        }
      }
      break;
    default:
LABEL_35:
      uint64_t v5 = 2147549181;
      *a1 = v1 + 1;
      break;
  }
  return v5;
}

void std::__format_spec::__parser<char>::__validate_fill_character[abi:ne180100](uint64_t a1, int a2, int a3)
{
  if (a3 && a2 == 58 || a2 == 125 || a2 == 123) {
    std::__throw_format_error[abi:ne180100]("The fill option contains an invalid value");
  }
}

char *std::__format_spec::__parse_arg_id[abi:ne180100]<char const*,std::basic_format_parse_context<char>>(char *a1, char *a2, uint64_t a3)
{
  if (a1 == a2) {
    std::__throw_format_error[abi:ne180100]("End of input while parsing an argument index");
  }
  int v4 = std::__format::__parse_arg_id[abi:ne180100]<char const*,std::basic_format_parse_context<char>>(a1, a2, a3);
  if (v4 == a2 || *v4 != 125) {
    std::__throw_format_error[abi:ne180100]("The argument index is invalid");
  }
  return v4 + 1;
}

void std::__format_spec::__throw_invalid_type_format_error[abi:ne180100](const char *a1)
{
  std::string::basic_string[abi:ne180100]<0>(&v8, "The type option contains an invalid value for ");
  size_t v2 = strlen(a1);
  unsigned int v3 = std::string::append(&v8, a1, v2);
  long long v4 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
  v9.__r_.__value_.__r.__words[2] = v3->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v9.__r_.__value_.__l.__data_ = v4;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  uint64_t v5 = std::string::append(&v9, " formatting argument", 0x14uLL);
  long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  int64_t v11 = v5->__r_.__value_.__r.__words[2];
  long long v10 = v6;
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  if (v11 >= 0) {
    unsigned int v7 = (const char *)&v10;
  }
  else {
    unsigned int v7 = (const char *)v10;
  }
  std::__throw_format_error[abi:ne180100](v7);
}

void sub_25B671EB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (*(char *)(v21 - 25) < 0) {
    operator delete(*(void **)(v21 - 48));
  }
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__format_spec::__parser<char>::__validate[abi:ne180100](uint64_t result, char a2, const char *a3, int a4)
{
  if ((a2 & 1) == 0 && (*(unsigned char *)result & 0x18) != 0)
  {
    long long v6 = "sign";
    goto LABEL_23;
  }
  if ((a2 & 2) == 0 && (*(unsigned char *)result & 0x20) != 0)
  {
    long long v6 = "alternate form";
    goto LABEL_23;
  }
  if ((a2 & 4) == 0 && (*(unsigned char *)result & 7) == 4)
  {
    long long v6 = "zero-padding";
    goto LABEL_23;
  }
  if ((a2 & 8) == 0 && *(_DWORD *)(result + 8) != -1)
  {
    long long v6 = "precision";
    goto LABEL_23;
  }
  if ((a2 & 0x10) == 0 && (*(unsigned char *)result & 0x40) != 0)
  {
    long long v6 = "locale-specific form";
LABEL_23:
    std::__format_spec::__throw_invalid_option_format_error[abi:ne180100](a3, v6);
  }
  unsigned int v4 = *(unsigned __int8 *)(result + 1);
  if (*(unsigned char *)(result + 1))
  {
    if (v4 >= 0x20) {
      std::__throw_format_error[abi:ne180100]("The type does not fit in the mask");
    }
    int v5 = 1 << v4;
  }
  else
  {
    int v5 = 1;
  }
  if ((v5 & a4) == 0) {
    std::__format_spec::__throw_invalid_type_format_error[abi:ne180100](a3);
  }
  return result;
}

void std::__format_spec::__throw_invalid_option_format_error[abi:ne180100](const char *a1, const char *a2)
{
  std::string::basic_string[abi:ne180100]<0>(&v15, "The format specifier for ");
  size_t v4 = strlen(a1);
  int v5 = std::string::append(&v15, a1, v4);
  long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  v16.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v6;
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  unsigned int v7 = std::string::append(&v16, " does not allow the ", 0x14uLL);
  long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
  v17.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v8;
  v7->__r_.__value_.__l.__size_ = 0;
  v7->__r_.__value_.__r.__words[2] = 0;
  v7->__r_.__value_.__r.__words[0] = 0;
  size_t v9 = strlen(a2);
  long long v10 = std::string::append(&v17, a2, v9);
  long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v18.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v18.__r_.__value_.__l.__data_ = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  int v12 = std::string::append(&v18, " option", 7uLL);
  long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  int64_t v20 = v12->__r_.__value_.__r.__words[2];
  long long v19 = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  if (v20 >= 0) {
    uint64_t v14 = (const char *)&v19;
  }
  else {
    uint64_t v14 = (const char *)v19;
  }
  std::__throw_format_error[abi:ne180100](v14);
}

void sub_25B6720E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (*(char *)(v28 - 25) < 0) {
    operator delete(*(void **)(v28 - 48));
  }
  if (*(char *)(v28 - 57) < 0) {
    operator delete(*(void **)(v28 - 80));
  }
  if (a28 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    long long v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    long long v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void *std::__formatter::__format_BOOL[abi:ne180100]<char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(int a1, void **a2, uint64_t a3, unint64_t a4)
{
  if ((a3 & 0x40) != 0)
  {
    std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>::locale[abi:ne180100]((uint64_t)a2, &v17);
    int v12 = std::locale::use_facet(&v17, MEMORY[0x263F8C150]);
    std::locale::~locale(&v17);
    long long v13 = v12->__vftable;
    if (a1) {
      ((void (*)(std::locale *__return_ptr, const std::locale::facet *))v13[2].~facet)(&v17, v12);
    }
    else {
      ((void (*)(std::locale *__return_ptr, const std::locale::facet *))v13[2].~facet_0)(&v17, v12);
    }
    if ((v19 & 0x80u) == 0) {
      locale = (char *)&v17;
    }
    else {
      locale = (char *)v17.__locale_;
    }
    if ((v19 & 0x80u) == 0) {
      size_t v15 = v19;
    }
    else {
      size_t v15 = v18;
    }
    std::string v16 = std::__formatter::__write_string_no_precision[abi:ne180100]<char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(locale, v15, *a2, a3, a4);
    if ((char)v19 < 0) {
      operator delete(v17.__locale_);
    }
    return v16;
  }
  else
  {
    if (a1) {
      size_t v8 = 4;
    }
    else {
      size_t v8 = 5;
    }
    size_t v9 = *a2;
    if (a1) {
      long long v10 = "true";
    }
    else {
      long long v10 = "false";
    }
    return std::__formatter::__write[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(v10, v8, v9, a3, a4, v8);
  }
}

void sub_25B67237C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

unint64_t std::__format_spec::__parser<char>::__get_parsed_std_specifications[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char *a1, void *a2)
{
  char v4 = *a1;
  uint64_t v5 = a1[1];
  unint64_t v6 = std::__format_spec::__parser<char>::__get_width[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((uint64_t)a1, a2);
  std::__format_spec::__parser<char>::__get_precision[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((uint64_t)a1, a2);
  return (v5 << 8) | (v6 << 32) | v4 & 0x7F;
}

void *std::__formatter::__format_integer[abi:ne180100]<unsigned int,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(unsigned int a1, void **a2, unint64_t a3, unint64_t a4, char a5)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  switch(BYTE1(a3))
  {
    case 1:
      __break(1u);
      JUMPOUT(0x25B672560);
    case 2:
      unint64_t v6 = a3 & 0xFFFFFFFFFFFF00FFLL | 0x200;
      uint64_t v7 = &v13;
      unsigned int v9 = 2;
      size_t v8 = "0b";
      goto LABEL_11;
    case 3:
      unint64_t v6 = a3 & 0xFFFFFFFFFFFF00FFLL | 0x300;
      uint64_t v7 = &v13;
      unsigned int v9 = 2;
      size_t v8 = "0B";
      goto LABEL_11;
    case 4:
      unint64_t v6 = a3 & 0xFFFFFFFFFFFF00FFLL | 0x400;
      uint64_t v7 = (uint64_t *)v12;
      if (a1) {
        size_t v8 = "0";
      }
      else {
        size_t v8 = 0;
      }
      unsigned int v9 = 8;
      goto LABEL_11;
    case 6:
      unint64_t v6 = a3 & 0xFFFFFFFFFFFF00FFLL | 0x600;
      uint64_t v7 = (uint64_t *)v11;
      unsigned int v9 = 16;
      size_t v8 = "0x";
      goto LABEL_11;
    case 7:
      unint64_t v6 = a3 & 0xFFFFFFFFFFFF00FFLL | 0x700;
      uint64_t v7 = (uint64_t *)v11;
      unsigned int v9 = 16;
      size_t v8 = "0X";
LABEL_11:
      id result = std::__formatter::__format_integer[abi:ne180100]<unsigned int,char *,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a1, a2, v6, a4, a5, v10, (uint64_t)v7, v8, v9);
      break;
    default:
      id result = std::__formatter::__format_integer[abi:ne180100]<unsigned int,char *,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a1, a2, a3, a4, a5, v10, (uint64_t)v11, 0, 0xAu);
      break;
  }
  return result;
}

std::locale *std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>::locale[abi:ne180100]@<X0>(uint64_t a1@<X0>, std::locale *a2@<X8>)
{
  unsigned int v3 = (std::locale *)(a1 + 32);
  if (!*(unsigned char *)(a1 + 40))
  {
    MEMORY[0x261165EA0](&v5);
    std::optional<std::locale>::operator=[abi:ne180100]<std::locale,void>(v3, &v5);
    std::locale::~locale(&v5);
  }
  return std::locale::locale(a2, v3);
}

void sub_25B6725DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

void *std::__formatter::__write_string_no_precision[abi:ne180100]<char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(char *__src, size_t __len, void *a3, uint64_t a4, unint64_t a5)
{
  if (a4 <= 0)
  {
    std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(a3, __src, __len);
    return a3;
  }
  else
  {
    uint64_t v10 = std::__format_spec::__estimate_column_width[abi:ne180100]<char,char const*>((unsigned __int8 *)__src, __len, HIDWORD(a4), 1);
    return std::__formatter::__write[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(__src, __len, a3, a4, a5, v10);
  }
}

std::locale *std::optional<std::locale>::operator=[abi:ne180100]<std::locale,void>(std::locale *this, const std::locale *a2)
{
  if (LOBYTE(this[1].__locale_))
  {
    std::locale::operator=(this, a2);
  }
  else
  {
    std::locale::locale(this, a2);
    LOBYTE(this[1].__locale_) = 1;
  }
  return this;
}

uint64_t std::__format_spec::__estimate_column_width[abi:ne180100]<char,char const*>(unsigned __int8 *a1, uint64_t a2, unint64_t a3, int a4)
{
  uint64_t result = 0;
  if (a2 && a3)
  {
    if ((char)*a1 < 0)
    {
      size_t v8 = a1;
    }
    else
    {
      uint64_t v7 = 0;
      size_t v8 = &a1[a3 - 1];
      while (1)
      {
        if (a2 - 1 == v7) {
          return a2;
        }
        if (a3 - 1 == v7) {
          break;
        }
        int v9 = (char)a1[++v7];
        if (v9 < 0)
        {
          a3 = a3 - v7 + 1;
          size_t v8 = &a1[v7 - 1];
          return v8
               - a1
               + std::__format_spec::__detail::__estimate_column_width_grapheme_clustering[abi:ne180100]<char const*>(v8, &a1[a2], a3, a4);
        }
      }
      if (((char)a1[a3] & 0x80000000) == 0) {
        return a3;
      }
      a3 = 1;
    }
    return v8
         - a1
         + std::__format_spec::__detail::__estimate_column_width_grapheme_clustering[abi:ne180100]<char const*>(v8, &a1[a2], a3, a4);
  }
  return result;
}

void *std::__formatter::__write[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(char *__src, size_t __len, void *a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  size_t v9 = (a4 >> 32) - a6;
  if (a4 >> 32 <= a6)
  {
    std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(a3, __src, __len);
    return a3;
  }
  else
  {
    unint64_t v10 = HIDWORD(a5);
    size_t v11 = 0;
    switch(a4 & 7)
    {
      case 1:
        break;
      case 2:
        size_t v11 = v9 >> 1;
        v9 -= v9 >> 1;
        break;
      default:
        size_t v11 = (a4 >> 32) - a6;
        size_t v9 = 0;
        break;
    }
    uint64_t v13 = std::__formatter::__fill[abi:ne180100]<char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(a3, v11, SHIDWORD(a5));
    std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(v13, __src, __len);
    return std::__formatter::__fill[abi:ne180100]<char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(v13, v9, v10);
  }
}

void *std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(void *result, char *__src, size_t __len)
{
  size_t v3 = __len;
  std::locale v5 = result;
  size_t v7 = result[1];
  uint64_t v6 = result[2];
  if (v6 + __len >= v7)
  {
    uint64_t result = (void *)((uint64_t (*)(void))result[3])(*result);
    uint64_t v6 = 0;
    v5[2] = 0;
    size_t v7 = v5[1];
  }
  if (v3 >= v7)
  {
    do
    {
      if (v5[1] >= v3) {
        size_t v8 = v3;
      }
      else {
        size_t v8 = v5[1];
      }
      if (v8) {
        memmove((void *)(*v5 + v6), __src, v8);
      }
      v5[2] = v8;
      __src += v8;
      v3 -= v8;
      uint64_t result = (void *)((uint64_t (*)(void, size_t, void))v5[3])(*v5, v8, v5[4]);
      uint64_t v6 = 0;
      v5[2] = 0;
    }
    while (v3);
  }
  else
  {
    if (v3)
    {
      uint64_t result = memmove((void *)(*v5 + v6), __src, v3);
      uint64_t v6 = v5[2];
    }
    v5[2] = v6 + v3;
  }
  return result;
}

uint64_t std::__format_spec::__detail::__estimate_column_width_grapheme_clustering[abi:ne180100]<char const*>(unsigned __int8 *a1, unsigned __int8 *a2, unint64_t a3, int a4)
{
  uint64_t v14 = a1;
  size_t v15 = a2;
  unsigned int v16 = std::__unicode::__code_point_view<char>::__consume[abi:ne180100](&v14) & 0x7FFFFFFF;
  char v17 = std::__extended_grapheme_custer_property_boundary::__get_property[abi:ne180100](v16);
  if (a1 == a2) {
    return 0;
  }
  uint64_t v8 = 0;
  do
  {
    unsigned int v9 = v16;
    unint64_t v10 = v14;
    if (v14 == v15) {
      char v17 = 15;
    }
    else {
      unint64_t v10 = std::__unicode::__extended_grapheme_cluster_view<char>::__get_break[abi:ne180100]((uint64_t)&v14);
    }
    int v11 = std::__width_estimation_table::__estimated_width[abi:ne180100](v9);
    unint64_t v12 = v8 + v11;
    if (!a4 && v12 > a3) {
      break;
    }
    if (v10 == a2)
    {
      v8 += v11;
      return v8;
    }
    v8 += v11;
  }
  while (v12 <= a3);
  return v8;
}

uint64_t std::__width_estimation_table::__estimated_width[abi:ne180100](unsigned int a1)
{
  if (a1 - 262142 < 0xFFFC1102) {
    return 1;
  }
  unint64_t v2 = 108;
  size_t v3 = (unsigned int *)&std::__width_estimation_table::__entries;
  do
  {
    unint64_t v4 = v2 >> 1;
    std::locale v5 = &v3[v2 >> 1];
    unsigned int v7 = *v5;
    uint64_t v6 = v5 + 1;
    v2 += ~(v2 >> 1);
    if (((a1 << 14) | 0x3FFF) < v7) {
      unint64_t v2 = v4;
    }
    else {
      size_t v3 = v6;
    }
  }
  while (v2);
  uint64_t v1 = 1;
  if (v3 != (unsigned int *)&std::__width_estimation_table::__entries)
  {
    if ((*(v3 - 1) & 0x3FFF) + (*(v3 - 1) >> 14) < a1) {
      return 1;
    }
    else {
      return 2;
    }
  }
  return v1;
}

uint64_t std::__extended_grapheme_custer_property_boundary::__get_property[abi:ne180100](unsigned int a1)
{
  unint64_t v1 = 1496;
  unint64_t v2 = (unsigned int *)&std::__extended_grapheme_custer_property_boundary::__entries;
  do
  {
    unint64_t v3 = v1 >> 1;
    unint64_t v4 = &v2[v1 >> 1];
    unsigned int v6 = *v4;
    std::locale v5 = v4 + 1;
    v1 += ~(v1 >> 1);
    if (((a1 << 11) | 0x7FF) < v6) {
      unint64_t v1 = v3;
    }
    else {
      unint64_t v2 = v5;
    }
  }
  while (v1);
  uint64_t v7 = 16;
  if (v2 != (unsigned int *)&std::__extended_grapheme_custer_property_boundary::__entries)
  {
    unsigned int v8 = *(v2 - 1);
    unsigned int v9 = ((v8 >> 4) & 0x7F) + (v8 >> 11);
    unsigned int v10 = v8 & 0xF;
    if (v9 >= a1) {
      return v10;
    }
    else {
      return 16;
    }
  }
  return v7;
}

unsigned __int8 *std::__unicode::__extended_grapheme_cluster_view<char>::__get_break[abi:ne180100](uint64_t a1)
{
  int v2 = 0;
  char v8 = 1;
  while (1)
  {
    unint64_t v3 = *(unsigned __int8 **)a1;
    if (*(void *)a1 == *(void *)(a1 + 8)) {
      break;
    }
    unsigned int v4 = *(unsigned __int8 *)(a1 + 20);
    unsigned int v5 = std::__unicode::__code_point_view<char>::__consume[abi:ne180100]((unsigned __int8 **)a1) & 0x7FFFFFFF;
    *(_DWORD *)(a1 + 16) = v5;
    unsigned int v6 = std::__extended_grapheme_custer_property_boundary::__get_property[abi:ne180100](v5);
    *(unsigned char *)(a1 + 20) = v6;
    v2 |= v4 == 3;
    if (std::__unicode::__at_extended_grapheme_cluster_break[abi:ne180100](&v8, v2 & 1, v4, v6)) {
      return v3;
    }
  }
  *(unsigned char *)(a1 + 20) = 15;
  return v3;
}

BOOL std::__unicode::__at_extended_grapheme_cluster_break[abi:ne180100](unsigned char *a1, int a2, unsigned int a3, unsigned int a4)
{
  if (!a3 && a4 == 5) {
    return 0;
  }
  if (a3 > 5 || (BOOL v4 = 1, ((1 << a3) & 0x23) == 0))
  {
    if (a4 > 5 || (BOOL v4 = 1, ((1 << a4) & 0x23) == 0))
    {
      if (a3 == 12 || a3 == 6)
      {
        if ((a4 - 11) >= 2u) {
          goto LABEL_16;
        }
      }
      else if (a3 != 4 || a4 - 4 >= 9 || ((0x10Du >> (a4 - 4)) & 1) == 0)
      {
LABEL_16:
        BOOL v6 = a3 == 11 || a3 == 7;
        if (v6 && a4 == 11 || a4 <= 0xD && ((1 << a4) & 0x2404) != 0 || a3 == 8 || a3 == 13 && a2 && a4 == 3) {
          return 0;
        }
        BOOL v4 = 1;
        if (a3 == 9 && a4 == 9)
        {
          BOOL v4 = *a1 == 0;
          *a1 ^= 1u;
        }
        return v4;
      }
      return 0;
    }
  }
  return v4;
}

void *std::__formatter::__fill[abi:ne180100]<char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(void *a1, size_t __len, int a3)
{
  size_t v3 = __len;
  unsigned int v5 = __clz(~(_BYTE)a3) - 24;
  int __src = a3;
  if ((_BYTE)a3 == 0xFF) {
    size_t v6 = 8;
  }
  else {
    size_t v6 = v5;
  }
  if (v6)
  {
    if (__len)
    {
      do
      {
        std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(a1, (char *)&__src, v6);
        --v3;
      }
      while (v3);
    }
  }
  else
  {
    std::__format::__output_buffer<char>::__fill[abi:ne180100](a1, __len, (char)a3);
  }
  return a1;
}

void *std::__format::__output_buffer<char>::__fill[abi:ne180100](void *result, size_t __len, int __c)
{
  uint64_t v5 = (uint64_t)result;
  size_t v7 = result[1];
  uint64_t v6 = result[2];
  if (v6 + __len >= v7)
  {
    uint64_t result = (void *)((uint64_t (*)(void))result[3])(*result);
    uint64_t v6 = 0;
    *(void *)(v5 + 16) = 0;
    size_t v7 = *(void *)(v5 + 8);
  }
  if (v7 <= __len)
  {
    do
    {
      uint64_t v8 = *(void *)v5;
      if (*(void *)(v5 + 8) >= __len) {
        size_t v9 = __len;
      }
      else {
        size_t v9 = *(void *)(v5 + 8);
      }
      if (v9)
      {
        memset((void *)(v8 + v6), __c, v9);
        uint64_t v8 = *(void *)v5;
      }
      *(void *)(v5 + 16) = v9;
      __len -= v9;
      uint64_t result = (void *)(*(uint64_t (**)(uint64_t, size_t, void))(v5 + 24))(v8, v9, *(void *)(v5 + 32));
      uint64_t v6 = 0;
      *(void *)(v5 + 16) = 0;
    }
    while (__len);
  }
  else
  {
    if (__len)
    {
      uint64_t result = memset((void *)(*(void *)v5 + v6), __c, __len);
      uint64_t v6 = *(void *)(v5 + 16);
    }
    *(void *)(v5 + 16) = v6 + __len;
  }
  return result;
}

unint64_t std::__format_spec::__parser<char>::__get_width[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(uint64_t a1, void *a2)
{
  *(void *)&v14[23] = *MEMORY[0x263EF8340];
  __int16 v3 = *(_WORD *)(a1 + 2);
  unint64_t result = *(unsigned int *)(a1 + 4);
  if ((v3 & 0x4000) != 0)
  {
    unint64_t v5 = (int)result;
    unint64_t v6 = a2[1];
    if (v6 <= (int)result)
    {
      LOBYTE(v8) = 0;
    }
    else if (v6 > 0xC)
    {
      uint64_t v9 = a2[2] + 32 * (int)result;
      unint64_t v2 = *(void *)v9;
      unint64_t v5 = *(void *)(v9 + 8);
      LOBYTE(v8) = *(unsigned char *)(v9 + 16);
      v11[0] = *(void *)(v9 + 17);
      *(void *)((char *)v11 + 7) = *(void *)(v9 + 24);
    }
    else
    {
      uint64_t v7 = a2[2];
      uint64_t v8 = (a2[3] >> (5 * result)) & 0x1FLL;
      unint64_t v2 = *(void *)(v7 + 16 * (int)result);
      unint64_t v5 = *(void *)(v7 + 16 * (int)result + 8);
    }
    v12[0] = v2;
    v12[1] = v5;
    char v13 = v8;
    *(void *)uint64_t v14 = v11[0];
    *(void *)&v14[7] = *(void *)((char *)v11 + 7);
    return std::__visit_format_arg[abi:ne180100]<unsigned int std::__format_spec::__substitute_arg_id[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(std::basic_format_arg<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>)::{lambda(std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>)#1},std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((uint64_t)&v10, v12);
  }
  return result;
}

unint64_t std::__format_spec::__parser<char>::__get_precision[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(uint64_t a1, void *a2)
{
  *(void *)&v14[23] = *MEMORY[0x263EF8340];
  int v3 = *(__int16 *)(a1 + 2);
  unint64_t result = *(unsigned int *)(a1 + 8);
  if (v3 < 0)
  {
    unint64_t v5 = (int)result;
    unint64_t v6 = a2[1];
    if (v6 <= (int)result)
    {
      LOBYTE(v8) = 0;
    }
    else if (v6 > 0xC)
    {
      uint64_t v9 = a2[2] + 32 * (int)result;
      unint64_t v2 = *(void *)v9;
      unint64_t v5 = *(void *)(v9 + 8);
      LOBYTE(v8) = *(unsigned char *)(v9 + 16);
      v11[0] = *(void *)(v9 + 17);
      *(void *)((char *)v11 + 7) = *(void *)(v9 + 24);
    }
    else
    {
      uint64_t v7 = a2[2];
      uint64_t v8 = (a2[3] >> (5 * result)) & 0x1FLL;
      unint64_t v2 = *(void *)(v7 + 16 * (int)result);
      unint64_t v5 = *(void *)(v7 + 16 * (int)result + 8);
    }
    v12[0] = v2;
    v12[1] = v5;
    char v13 = v8;
    *(void *)uint64_t v14 = v11[0];
    *(void *)&v14[7] = *(void *)((char *)v11 + 7);
    return std::__visit_format_arg[abi:ne180100]<unsigned int std::__format_spec::__substitute_arg_id[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(std::basic_format_arg<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>)::{lambda(std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>)#1},std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((uint64_t)&v10, v12);
  }
  return result;
}

unint64_t std::__visit_format_arg[abi:ne180100]<unsigned int std::__format_spec::__substitute_arg_id[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(std::basic_format_arg<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>)::{lambda(std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>)#1},std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(uint64_t a1, unint64_t *a2)
{
  switch(*((unsigned char *)a2 + 16))
  {
    case 1:
    case 2:
    case 5:
    case 8:
    case 9:
    case 0xA:
    case 0xB:
    case 0xC:
    case 0xD:
    case 0xE:
    case 0xF:
      std::__throw_format_error[abi:ne180100]("Replacement argument isn't a standard signed or unsigned integer type");
    case 3:
      unint64_t result = *(unsigned int *)a2;
      if ((result & 0x80000000) != 0) {
        std::__throw_format_error[abi:ne180100]("An argument index may not have a negative value");
      }
      return result;
    case 4:
      return std::invoke[abi:ne180100]<unsigned int std::__format_spec::__substitute_arg_id[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(std::basic_format_arg<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>)::{lambda(std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>)#1},long long &>(a1, a2);
    case 6:
      unint64_t result = *(unsigned int *)a2;
      if ((result & 0x80000000) != 0) {
        goto LABEL_8;
      }
      return result;
    case 7:
      unint64_t result = *a2;
      if (*a2 >> 31) {
LABEL_8:
      }
        std::__throw_format_error[abi:ne180100]("The value of the argument index exceeds its maximum value");
      return result;
    default:
      std::__throw_format_error[abi:ne180100]("The argument index value is too large for the number of arguments supplied");
  }
}

unint64_t std::invoke[abi:ne180100]<unsigned int std::__format_spec::__substitute_arg_id[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(std::basic_format_arg<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>)::{lambda(std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>)#1},long long &>(uint64_t a1, unint64_t *a2)
{
  unint64_t result = *a2;
  if ((*a2 & 0x8000000000000000) != 0) {
    std::__throw_format_error[abi:ne180100]("An argument index may not have a negative value");
  }
  if (result >> 31) {
    std::__throw_format_error[abi:ne180100]("The value of the argument index exceeds its maximum value");
  }
  return result;
}

void *std::__formatter::__format_integer[abi:ne180100]<unsigned int,char *,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(unsigned int a1, void **a2, unint64_t a3, unint64_t a4, char a5, char *a6, uint64_t a7, unsigned char *a8, unsigned int a9)
{
  uint64_t v9 = a6;
  char v13 = a3;
  if (a5)
  {
    char v14 = 45;
LABEL_7:
    *a6 = v14;
    unsigned int v16 = a6 + 1;
    goto LABEL_8;
  }
  int v15 = (a3 >> 3) & 3;
  if (v15 == 2)
  {
    char v14 = 43;
    goto LABEL_7;
  }
  unsigned int v16 = a6;
  if (v15 == 3)
  {
    char v14 = 32;
    goto LABEL_7;
  }
LABEL_8:
  if ((a3 & 0x20) != 0)
  {
    if (a8)
    {
      char v17 = *a8;
      if (*a8)
      {
        size_t v18 = a8 + 1;
        do
        {
          *(unsigned char *)unsigned int v16 = v17;
          unsigned int v16 = (_WORD *)((char *)v16 + 1);
          int v19 = *v18++;
          char v17 = v19;
        }
        while (v19);
      }
    }
  }
  int64_t v20 = std::__to_chars_integral[abi:ne180100]<unsigned int>(v16, a7, a1, a9);
  if ((v13 & 0x40) == 0) {
    goto LABEL_44;
  }
  std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>::locale[abi:ne180100]((uint64_t)a2, &v45);
  uint64_t v21 = std::locale::use_facet(&v45, MEMORY[0x263F8C150]);
  std::locale::~locale(&v45);
  ((void (*)(std::locale *__return_ptr, const std::locale::facet *))v21->__vftable[1].__on_zero_shared)(&v45, v21);
  if ((char)v47 < 0)
  {
    locale = (char *)v45.__locale_;
    if (!v46)
    {
LABEL_43:
      operator delete(locale);
      goto LABEL_44;
    }
  }
  else
  {
    if (!v47) {
      goto LABEL_44;
    }
    locale = (char *)&v45;
  }
  if (v20 - (char *)v16 <= *locale)
  {
    if ((v47 & 0x80) != 0)
    {
      locale = (char *)v45.__locale_;
      goto LABEL_43;
    }
LABEL_44:
    unint64_t v35 = HIDWORD(a3);
    if ((v13 & 7) == 4)
    {
      std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(*a2, v9, (char *)v16 - v9);
      unsigned __int8 v36 = a3 & 0xF8 | 3;
      if (SHIDWORD(a3) >= (int)v16 - (int)v9) {
        int v37 = v16 - v9;
      }
      else {
        int v37 = HIDWORD(a3);
      }
      unint64_t v35 = (HIDWORD(a3) - v37);
      unsigned __int8 v38 = 48;
      uint64_t v9 = (char *)v16;
    }
    else
    {
      unsigned __int8 v38 = BYTE4(a4);
      unsigned __int8 v36 = a3;
    }
    uint64_t v39 = *a2;
    uint64_t v40 = a3 & 0xFFFFFF00 | (v35 << 32) | v36;
    unint64_t v41 = a4 & 0xFFFFFF00FFFFFFFFLL | ((unint64_t)v38 << 32);
    if ((a3 & 0xFF00) == 0x700) {
      return std::__formatter::__write_transformed[abi:ne180100]<char *,char,char,char (*)(char),std::back_insert_iterator<std::__format::__output_buffer<char>>>(v9, v20, v39, v40, v41, (uint64_t (*)(void))std::__formatter::__hex_to_upper[abi:ne180100]);
    }
    else {
      return std::__formatter::__write[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(v9, v20 - v9, v39, v40, v41, v20 - v9);
    }
  }
  uint64_t v23 = *a2;
  memset(&__p, 0, sizeof(__p));
  if ((v47 & 0x80u) == 0) {
    double v24 = (std::string::value_type *)&v45;
  }
  else {
    double v24 = (std::string::value_type *)v45.__locale_;
  }
  if ((v47 & 0x80u) == 0) {
    __int16 v25 = (char *)&v45 + v47;
  }
  else {
    __int16 v25 = (char *)v45.__locale_ + v46;
  }
  std::string::value_type v26 = *v24;
  uint64_t v27 = v20 - (char *)v16 - *v24;
  if (v27 >= 1)
  {
    uint64_t v28 = v25 - 1;
    do
    {
      std::string::push_back(&__p, v26);
      if (v24 == v28)
      {
        std::string::value_type v26 = *v28;
        double v24 = v28;
      }
      else
      {
        uint64_t v29 = v24 + 1;
        unsigned int v30 = v24 + 1;
        do
        {
          int v31 = *v30++;
          std::string::value_type v26 = v31;
          if (v31) {
            BOOL v32 = 1;
          }
          else {
            BOOL v32 = v29 == v28;
          }
          uint64_t v29 = v30;
        }
        while (!v32);
        double v24 = v30 - 1;
      }
      v27 -= v26;
    }
    while (v27 > 0);
  }
  std::string::push_back(&__p, v26 + v27);
  char v33 = ((uint64_t (*)(const std::locale::facet *))v21->__vftable[1].~facet_0)(v21);
  float v34 = std::__formatter::__write_using_decimal_separators[abi:ne180100]<std::back_insert_iterator<std::__format::__output_buffer<char>>,char *,char>(v23, v9, (char *)v16, (int)v20, (uint64_t *)&__p, v33, a3, a4);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if ((char)v47 < 0) {
    operator delete(v45.__locale_);
  }
  return v34;
}

void sub_25B673444(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, std::locale a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15.__locale_);
  }
  _Unwind_Resume(exception_object);
}

void *std::__formatter::__write_using_decimal_separators[abi:ne180100]<std::back_insert_iterator<std::__format::__output_buffer<char>>,char *,char>(void *a1, char *__src, char *a3, int a4, uint64_t *a5, char a6, uint64_t a7, unint64_t a8)
{
  unsigned __int16 v8 = a7;
  int v11 = a3;
  char v13 = a1;
  unint64_t v14 = HIDWORD(a7);
  unint64_t v15 = HIDWORD(a8);
  size_t v16 = a3 - __src;
  LODWORD(v17) = *((unsigned __int8 *)a5 + 23);
  if ((v17 & 0x80u) != 0) {
    uint64_t v17 = a5[1];
  }
  int v18 = a4 - __src - 1 + v17;
  if ((a7 & 7) == 4)
  {
    std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(a1, __src, a3 - __src);
    if ((int)v14 > v18) {
      std::__format::__output_buffer<char>::__fill[abi:ne180100](v13, (int)v14 - v18, 48);
    }
    size_t v19 = 0;
  }
  else
  {
    if (SHIDWORD(a7) <= v18)
    {
      size_t v19 = 0;
    }
    else
    {
      size_t v19 = (a7 >> 32) - v18;
      size_t v20 = 0;
      switch(a7 & 7)
      {
        case 1:
          break;
        case 2:
          size_t v20 = v19 >> 1;
          v19 -= v19 >> 1;
          break;
        default:
          size_t v20 = (a7 >> 32) - v18;
          size_t v19 = 0;
          break;
      }
      char v13 = std::__formatter::__fill[abi:ne180100]<char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(a1, v20, SHIDWORD(a8));
    }
    std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(v13, __src, v16);
  }
  uint64_t v21 = *((unsigned __int8 *)a5 + 23);
  int v22 = (char)v21;
  uint64_t v23 = (char *)a5 + v21;
  if (v22 >= 0) {
    double v24 = v23;
  }
  else {
    double v24 = (char *)(*a5 + a5[1]);
  }
  if (v22 >= 0) {
    __int16 v25 = a5;
  }
  else {
    __int16 v25 = (uint64_t *)*a5;
  }
  std::string::value_type v26 = (char *)v25 + 1;
  uint64_t v27 = v8 & 0xFF00;
  while (1)
  {
    uint64_t v29 = v24 - 1;
    size_t v28 = *(v24 - 1);
    if (v27 == 1792)
    {
      unsigned int v30 = &v11[v28];
      std::__format::__output_buffer<char>::__transform[abi:ne180100]<char *,char (*)(char),char>((uint64_t)v13, v11, &v11[v28], (uint64_t (*)(void))std::__formatter::__hex_to_upper[abi:ne180100]);
      int v11 = v30;
    }
    else
    {
      std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(v13, v11, v28);
      v11 += *v29;
    }
    if (v24 == v26) {
      break;
    }
    uint64_t v31 = *v13;
    uint64_t v32 = v13[2];
    v13[2] = v32 + 1;
    *(unsigned char *)(v31 + v32) = a6;
    --v24;
    if (v13[2] == v13[1])
    {
      ((void (*)(void))v13[3])(*v13);
      v13[2] = 0;
      double v24 = v29;
    }
  }
  return std::__formatter::__fill[abi:ne180100]<char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(v13, v19, v15);
}

void *std::__formatter::__write_transformed[abi:ne180100]<char *,char,char,char (*)(char),std::back_insert_iterator<std::__format::__output_buffer<char>>>(char *a1, char *a2, void *a3, uint64_t a4, unint64_t a5, uint64_t (*a6)(void))
{
  size_t v10 = (a4 >> 32) - (a2 - a1);
  if (a4 >> 32 <= a2 - a1)
  {
    std::__format::__output_buffer<char>::__transform[abi:ne180100]<char *,char (*)(char),char>((uint64_t)a3, a1, a2, a6);
    return a3;
  }
  else
  {
    unint64_t v11 = HIDWORD(a5);
    size_t v12 = 0;
    switch(a4 & 7)
    {
      case 1:
        break;
      case 2:
        size_t v12 = v10 >> 1;
        v10 -= v10 >> 1;
        break;
      default:
        size_t v12 = v10;
        size_t v10 = 0;
        break;
    }
    unint64_t v14 = std::__formatter::__fill[abi:ne180100]<char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(a3, v12, SHIDWORD(a5));
    std::__format::__output_buffer<char>::__transform[abi:ne180100]<char *,char (*)(char),char>((uint64_t)v14, a1, a2, a6);
    return std::__formatter::__fill[abi:ne180100]<char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(v14, v10, v11);
  }
}

uint64_t std::__formatter::__hex_to_upper[abi:ne180100](int a1)
{
  if ((a1 - 97) >= 6) {
    return (char)a1;
  }
  else {
    return (char)(a1 - 32);
  }
}

char *std::__to_chars_integral[abi:ne180100]<unsigned int>(_WORD *a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  BOOL v4 = (char *)a2;
  HIDWORD(v6) = a4;
  LODWORD(v6) = a4 - 2;
  int v5 = v6 >> 1;
  if (v5 != 4)
  {
    if (!v5) {
      return (char *)std::__itoa::__integral<2u>::__to_chars[abi:ne180100]<unsigned int>((uint64_t)a1, a2, a3);
    }
    if (v5 == 3) {
      return (char *)std::__itoa::__integral<8u>::__to_chars[abi:ne180100]<unsigned int>((uint64_t)a1, a2, a3);
    }
    if (v5 != 7)
    {
      uint64_t v10 = a2 - (void)a1;
      int v11 = std::__to_chars_integral_width[abi:ne180100]<unsigned int>(a3, a4);
      if (v10 < v11) {
        return (char *)a2;
      }
      BOOL v4 = (char *)a1 + v11;
      size_t v12 = v4 - 1;
      unsigned int v13 = a3;
      do
      {
        *v12-- = a0123456789abcd[v13 % a4];
        BOOL v14 = v13 >= a4;
        v13 /= a4;
      }
      while (v14);
      return v4;
    }
    return (char *)std::__itoa::__integral<16u>::__to_chars[abi:ne180100]<unsigned int>((uint64_t)a1, a2, a3);
  }
  if (a2 - (uint64_t)a1 > 9) {
    return (char *)std::__itoa::__base_10_u32[abi:ne180100](a1, a3);
  }
  unsigned int v7 = (1233 * (32 - __clz(a3 | 1))) >> 12;
  if (a2 - (uint64_t)a1 >= (((__PAIR64__(v7, a3) - std::__itoa::__pow10_32[v7]) >> 32) + 1)) {
    return (char *)std::__itoa::__base_10_u32[abi:ne180100](a1, a3);
  }
  return v4;
}

uint64_t std::__to_chars_integral_width[abi:ne180100]<unsigned int>(unsigned int a1, unsigned int a2)
{
  if (a1 < a2) {
    return 1;
  }
  unsigned int v3 = a1;
  unsigned int v4 = a2 * a2;
  unsigned int v5 = v4 * v4;
  uint64_t result = 4;
  while (1)
  {
    if (v3 < v4) {
      return (result - 2);
    }
    if (v3 < a2 * a2 * a2) {
      break;
    }
    if (v3 < v5) {
      return result;
    }
    v3 /= v5;
    uint64_t result = (result + 4);
    if (v3 < a2) {
      return (result - 3);
    }
  }
  return (result - 1);
}

_WORD *std::__itoa::__base_10_u32[abi:ne180100](_WORD *a1, unsigned int a2)
{
  if (a2 >= 0xF4240)
  {
    if (a2 >= 0x5F5E100)
    {
      if (a2 > 0x3B9AC9FF)
      {
        return std::__itoa::__append10[abi:ne180100]<unsigned int>(a1, a2);
      }
      else
      {
        *(unsigned char *)a1 = a2 / 0x5F5E100 + 48;
        *(_WORD *)((char *)a1 + 1) = std::__itoa::__digits_base_10[a2 % 0x5F5E100 / 0xF4240];
        unsigned int v7 = a2 % 0x5F5E100 % 0xF4240;
        *(_WORD *)((char *)a1 + 3) = std::__itoa::__digits_base_10[v7 / 0x2710uLL];
        v7 %= 0x2710u;
        *(_WORD *)((char *)a1 + 5) = std::__itoa::__digits_base_10[(unsigned __int16)v7 / 0x64u];
        *(_WORD *)((char *)a1 + 7) = std::__itoa::__digits_base_10[(unsigned __int16)v7 % 0x64u];
        return (_WORD *)((char *)a1 + 9);
      }
    }
    else
    {
      unsigned int v3 = a2 / 0xF4240;
      if (a2 > 0x98967F)
      {
        *a1 = std::__itoa::__digits_base_10[v3];
        a1[1] = std::__itoa::__digits_base_10[a2 % 0xF4240 / 0x2710uLL];
        unsigned int v9 = a2 % 0xF4240 % 0x2710;
        a1[2] = std::__itoa::__digits_base_10[(unsigned __int16)v9 / 0x64u];
        a1[3] = std::__itoa::__digits_base_10[(unsigned __int16)v9 % 0x64u];
        return a1 + 4;
      }
      else
      {
        *(unsigned char *)a1 = v3 + 48;
        unint64_t v4 = (429497 * (unint64_t)(a2 % 0xF4240)) >> 32;
        *(_WORD *)((char *)a1 + 1) = std::__itoa::__digits_base_10[v4];
        unsigned __int16 v5 = a2 % 0xF4240 - 10000 * v4;
        *(_WORD *)((char *)a1 + 3) = std::__itoa::__digits_base_10[v5 / 0x64u];
        *(_WORD *)((char *)a1 + 5) = std::__itoa::__digits_base_10[v5 % 0x64u];
        return (_WORD *)((char *)a1 + 7);
      }
    }
  }
  else if (a2 >> 4 > 0x270)
  {
    unsigned int v6 = a2 / 0x2710;
    if (a2 >> 5 > 0xC34)
    {
      *a1 = std::__itoa::__digits_base_10[v6];
      unsigned __int16 v10 = a2 % 0x2710;
      a1[1] = std::__itoa::__digits_base_10[v10 / 0x64u];
      a1[2] = std::__itoa::__digits_base_10[v10 % 0x64u];
      return a1 + 3;
    }
    else
    {
      *(unsigned char *)a1 = v6 + 48;
      *(_WORD *)((char *)a1 + 1) = std::__itoa::__digits_base_10[(5243 * (a2 % 0x2710)) >> 19];
      *(_WORD *)((char *)a1 + 3) = std::__itoa::__digits_base_10[(unsigned __int16)(a2 % 0x2710
                                                                                  - 100
                                                                                  * ((unsigned __int16)((5243 * (a2 % 0x2710)) >> 16) >> 3))];
      return (_WORD *)((char *)a1 + 5);
    }
  }
  else if (a2 > 0x63)
  {
    unsigned int v8 = (unsigned __int16)a2 / 0x64u;
    if (a2 > 0x3E7)
    {
      *a1 = std::__itoa::__digits_base_10[v8];
      a1[1] = std::__itoa::__digits_base_10[(unsigned __int16)a2 % 0x64u];
      return a1 + 2;
    }
    else
    {
      *(unsigned char *)a1 = v8 + 48;
      *(_WORD *)((char *)a1 + 1) = std::__itoa::__digits_base_10[(unsigned __int16)a2 % 0x64u];
      return (_WORD *)((char *)a1 + 3);
    }
  }
  else if (a2 > 9)
  {
    *a1 = std::__itoa::__digits_base_10[a2];
    return a1 + 1;
  }
  else
  {
    *(unsigned char *)a1 = a2 + 48;
    return (_WORD *)((char *)a1 + 1);
  }
}

_WORD *std::__itoa::__append10[abi:ne180100]<unsigned int>(_WORD *a1, unsigned int a2)
{
  *a1 = std::__itoa::__digits_base_10[a2 / 0x5F5E100uLL];
  a1[1] = std::__itoa::__digits_base_10[a2 % 0x5F5E100 / 0xF4240uLL];
  unsigned int v2 = a2 % 0x5F5E100 % 0xF4240;
  a1[2] = std::__itoa::__digits_base_10[v2 / 0x2710uLL];
  v2 %= 0x2710u;
  a1[3] = std::__itoa::__digits_base_10[(unsigned __int16)v2 / 0x64u];
  a1[4] = std::__itoa::__digits_base_10[(unsigned __int16)v2 % 0x64u];
  return a1 + 5;
}

uint64_t std::__itoa::__integral<2u>::__to_chars[abi:ne180100]<unsigned int>(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = 32 - __clz(a3 | 1);
  if (a2 - a1 < v3) {
    return a2;
  }
  uint64_t v4 = a1 + v3;
  if (a3 < 0x11)
  {
    unsigned int v6 = a3;
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = a1 + v3;
    do
    {
      unsigned int v6 = a3 >> 4;
      *(_DWORD *)(v5 - 4) = std::__itoa::__base_2_lut[a3 & 0xF];
      v5 -= 4;
      BOOL v7 = a3 > 0x10F;
      a3 >>= 4;
    }
    while (v7);
  }
  unsigned int v8 = (unsigned char *)(v5 - 1);
  do
  {
    *v8-- = a01[v6 & 1];
    BOOL v7 = v6 > 1;
    v6 >>= 1;
  }
  while (v7);
  return v4;
}

uint64_t std::__itoa::__integral<8u>::__to_chars[abi:ne180100]<unsigned int>(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = (86 * (34 - __clz(a3 | 1))) >> 8;
  if (a2 - a1 < v3) {
    return a2;
  }
  uint64_t v4 = a1 + v3;
  if (a3 < 0x41)
  {
    unsigned int v6 = a3;
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = a1 + v3;
    do
    {
      unsigned int v6 = a3 >> 6;
      *(_WORD *)(v5 - 2) = std::__itoa::__base_8_lut[a3 & 0x3F];
      v5 -= 2;
      a3 = v6;
    }
    while (v6 > 0x40);
  }
  BOOL v7 = (unsigned char *)(v5 - 1);
  do
  {
    *v7-- = a01234567[v6 & 7];
    BOOL v8 = v6 > 7;
    v6 >>= 3;
  }
  while (v8);
  return v4;
}

uint64_t std::__itoa::__integral<16u>::__to_chars[abi:ne180100]<unsigned int>(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = (35 - __clz(a3 | 1)) >> 2;
  if (a2 - a1 < v3) {
    return a2;
  }
  uint64_t v4 = a1 + v3;
  if (a3 < 0x101)
  {
    unsigned int v6 = a3;
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = a1 + v3;
    do
    {
      unsigned int v6 = a3 >> 8;
      *(_WORD *)(v5 - 2) = std::__itoa::__base_16_lut[a3];
      v5 -= 2;
      a3 = v6;
    }
    while (v6 > 0x100);
  }
  BOOL v7 = (unsigned char *)(v5 - 1);
  do
  {
    *v7-- = a0123456789abcd_0[v6 & 0xF];
    BOOL v8 = v6 > 0xF;
    v6 >>= 4;
  }
  while (v8);
  return v4;
}

uint64_t std::__format::__output_buffer<char>::__transform[abi:ne180100]<char *,char (*)(char),char>(uint64_t result, char *a2, char *a3, uint64_t (*a4)(void))
{
  unsigned int v6 = a2;
  uint64_t v7 = result;
  unint64_t v8 = a3 - a2;
  unint64_t v10 = *(void *)(result + 8);
  uint64_t v9 = *(void *)(result + 16);
  if (v9 + v8 >= v10)
  {
    uint64_t result = (*(uint64_t (**)(void))(result + 24))(*(void *)result);
    uint64_t v9 = 0;
    *(void *)(v7 + 16) = 0;
    unint64_t v10 = *(void *)(v7 + 8);
  }
  if (v8 >= v10)
  {
    do
    {
      uint64_t v13 = *(void *)v7;
      if (*(void *)(v7 + 8) >= v8) {
        unint64_t v14 = v8;
      }
      else {
        unint64_t v14 = *(void *)(v7 + 8);
      }
      if (v14)
      {
        unint64_t v15 = (unsigned char *)(v13 + v9);
        unint64_t v16 = v14;
        uint64_t v17 = v6;
        do
        {
          unsigned int v18 = *v17++;
          *v15++ = a4(v18);
          --v16;
        }
        while (v16);
        uint64_t v13 = *(void *)v7;
      }
      v6 += v14;
      *(void *)(v7 + 16) = v14;
      v8 -= v14;
      uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, void))(v7 + 24))(v13, v14, *(void *)(v7 + 32));
      uint64_t v9 = 0;
      *(void *)(v7 + 16) = 0;
    }
    while (v8);
  }
  else
  {
    if (v6 != a3)
    {
      int v11 = (unsigned char *)(*(void *)v7 + v9);
      do
      {
        unsigned int v12 = *v6++;
        uint64_t result = a4(v12);
        *v11++ = result;
      }
      while (v6 != a3);
      uint64_t v9 = *(void *)(v7 + 16);
    }
    *(void *)(v7 + 16) = v9 + v8;
  }
  return result;
}

void *std::__formatter_char<char>::format[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(uint64_t a1, unsigned __int8 a2, void *a3)
{
  int v5 = *(unsigned __int8 *)(a1 + 1);
  if (v5 == 10 || v5 == 0)
  {
    uint64_t v7 = (void *)*a3;
    unint64_t v8 = std::__format_spec::__parser<char>::__get_parsed_std_specifications[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((char *)a1, a3);
    unsigned __int8 __src = a2;
    return std::__formatter::__write[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>((char *)&__src, 1uLL, v7, v8, v9, 1);
  }
  else
  {
    unint64_t v11 = std::__format_spec::__parser<char>::__get_parsed_std_specifications[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>((char *)a1, a3);
    return std::__formatter::__format_integer[abi:ne180100]<unsigned int,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a2, (void **)a3, v11, v12, 0);
  }
}

uint64_t std::__format_spec::__process_parsed_char[abi:ne180100]<char>(uint64_t result, const char *a2)
{
  unsigned int v2 = *(unsigned __int8 *)(result + 1);
  if (v2 - 2 >= 6)
  {
    BOOL v3 = v2 > 0x13;
    int v4 = (1 << v2) & 0x80401;
    if (v3 || v4 == 0) {
      std::__format_spec::__throw_invalid_type_format_error[abi:ne180100](a2);
    }
    unsigned int v6 = (unsigned char *)result;
    uint64_t result = std::__format_spec::__parser<char>::__validate[abi:ne180100](result, 48, a2, -1);
    if ((*v6 & 7) == 0) {
      unsigned char *v6 = *v6 & 0xF8 | 1;
    }
  }
  return result;
}

void *std::__formatter_integer<char>::format[abi:ne180100]<int,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char *a1, int a2, void *a3)
{
  unint64_t v6 = std::__format_spec::__parser<char>::__get_parsed_std_specifications[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a1, a3);
  unint64_t v7 = v5;
  if ((v6 & 0xFF00) == 0xA00)
  {
    unint64_t v8 = (void *)*a3;
    return std::__formatter::__format_char[abi:ne180100]<char,int,std::back_insert_iterator<std::__format::__output_buffer<char>>>(a2, v8, v6, v7);
  }
  else
  {
    if (a2 >= 0) {
      unsigned int v10 = a2;
    }
    else {
      unsigned int v10 = -a2;
    }
    return std::__formatter::__format_integer[abi:ne180100]<unsigned int,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(v10, (void **)a3, v6, v5, a2 < 0);
  }
}

uint64_t std::__format_spec::__process_parsed_integer[abi:ne180100]<char>(uint64_t result, const char *a2)
{
  int v2 = *(unsigned __int8 *)(result + 1);
  if ((v2 - 2) >= 6 && v2 != 0)
  {
    if (v2 != 10) {
      std::__format_spec::__throw_invalid_type_format_error[abi:ne180100](a2);
    }
    int v4 = (unsigned char *)result;
    uint64_t result = std::__format_spec::__parser<char>::__validate[abi:ne180100](result, 48, a2, -1);
    if ((*v4 & 7) == 0) {
      unsigned char *v4 = *v4 & 0xF8 | 1;
    }
  }
  return result;
}

void *std::__formatter::__format_char[abi:ne180100]<char,int,std::back_insert_iterator<std::__format::__output_buffer<char>>>(int a1, void *a2, uint64_t a3, unint64_t a4)
{
  if (a1 != (char)a1) {
    std::__throw_format_error[abi:ne180100]("Integral value outside the range of the char type");
  }
  char __src = a1;
  return std::__formatter::__write[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(&__src, 1uLL, a2, a3, a4, 1);
}

void *std::__formatter_integer<char>::format[abi:ne180100]<long long,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char *a1, uint64_t a2, void *a3)
{
  unint64_t v6 = std::__format_spec::__parser<char>::__get_parsed_std_specifications[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a1, a3);
  unint64_t v7 = v5;
  if ((v6 & 0xFF00) == 0xA00)
  {
    unint64_t v8 = (void *)*a3;
    return std::__formatter::__format_char[abi:ne180100]<char,long long,std::back_insert_iterator<std::__format::__output_buffer<char>>>(a2, v8, v6, v7);
  }
  else
  {
    if (a2 >= 0) {
      unint64_t v10 = a2;
    }
    else {
      unint64_t v10 = -a2;
    }
    return std::__formatter::__format_integer[abi:ne180100]<unsigned long long,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(v10, (void **)a3, v6, v5, a2 < 0);
  }
}

void *std::__formatter::__format_char[abi:ne180100]<char,long long,std::back_insert_iterator<std::__format::__output_buffer<char>>>(uint64_t a1, void *a2, uint64_t a3, unint64_t a4)
{
  if (a1 != (char)a1) {
    std::__throw_format_error[abi:ne180100]("Integral value outside the range of the char type");
  }
  char __src = a1;
  return std::__formatter::__write[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(&__src, 1uLL, a2, a3, a4, 1);
}

void *std::__formatter::__format_integer[abi:ne180100]<unsigned long long,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(unint64_t a1, void **a2, unint64_t a3, unint64_t a4, char a5)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  switch(BYTE1(a3))
  {
    case 1:
      __break(1u);
      JUMPOUT(0x25B674498);
    case 2:
      unint64_t v6 = a3 & 0xFFFFFFFFFFFF00FFLL | 0x200;
      unint64_t v7 = &v13;
      signed int v9 = 2;
      unint64_t v8 = "0b";
      goto LABEL_11;
    case 3:
      unint64_t v6 = a3 & 0xFFFFFFFFFFFF00FFLL | 0x300;
      unint64_t v7 = &v13;
      signed int v9 = 2;
      unint64_t v8 = "0B";
      goto LABEL_11;
    case 4:
      unint64_t v6 = a3 & 0xFFFFFFFFFFFF00FFLL | 0x400;
      unint64_t v7 = (uint64_t *)&v12[3];
      if (a1) {
        unint64_t v8 = "0";
      }
      else {
        unint64_t v8 = 0;
      }
      signed int v9 = 8;
      goto LABEL_11;
    case 6:
      unint64_t v6 = a3 & 0xFFFFFFFFFFFF00FFLL | 0x600;
      unint64_t v7 = (uint64_t *)v11;
      signed int v9 = 16;
      unint64_t v8 = "0x";
      goto LABEL_11;
    case 7:
      unint64_t v6 = a3 & 0xFFFFFFFFFFFF00FFLL | 0x700;
      unint64_t v7 = (uint64_t *)v11;
      signed int v9 = 16;
      unint64_t v8 = "0X";
LABEL_11:
      uint64_t result = std::__formatter::__format_integer[abi:ne180100]<unsigned long long,char *,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a1, a2, v6, a4, a5, v10, (uint64_t)v7, v8, v9);
      break;
    default:
      uint64_t result = std::__formatter::__format_integer[abi:ne180100]<unsigned long long,char *,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a1, a2, a3, a4, a5, v10, (uint64_t)v12, 0, 10);
      break;
  }
  return result;
}

void *std::__formatter::__format_integer[abi:ne180100]<unsigned long long,char *,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(unint64_t a1, void **a2, unint64_t a3, unint64_t a4, char a5, char *a6, uint64_t a7, unsigned char *a8, signed int a9)
{
  signed int v9 = a6;
  char v13 = a3;
  if (a5)
  {
    char v14 = 45;
LABEL_7:
    *a6 = v14;
    unint64_t v16 = a6 + 1;
    goto LABEL_8;
  }
  int v15 = (a3 >> 3) & 3;
  if (v15 == 2)
  {
    char v14 = 43;
    goto LABEL_7;
  }
  unint64_t v16 = a6;
  if (v15 == 3)
  {
    char v14 = 32;
    goto LABEL_7;
  }
LABEL_8:
  if ((a3 & 0x20) != 0)
  {
    if (a8)
    {
      char v17 = *a8;
      if (*a8)
      {
        unsigned int v18 = a8 + 1;
        do
        {
          *(unsigned char *)unint64_t v16 = v17;
          unint64_t v16 = (_WORD *)((char *)v16 + 1);
          int v19 = *v18++;
          char v17 = v19;
        }
        while (v19);
      }
    }
  }
  size_t v20 = std::__to_chars_integral[abi:ne180100]<unsigned long long>(v16, a7, a1, a9);
  if ((v13 & 0x40) == 0) {
    goto LABEL_44;
  }
  std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>::locale[abi:ne180100]((uint64_t)a2, &v45);
  uint64_t v21 = std::locale::use_facet(&v45, MEMORY[0x263F8C150]);
  std::locale::~locale(&v45);
  ((void (*)(std::locale *__return_ptr, const std::locale::facet *))v21->__vftable[1].__on_zero_shared)(&v45, v21);
  if ((char)v47 < 0)
  {
    locale = (char *)v45.__locale_;
    if (!v46)
    {
LABEL_43:
      operator delete(locale);
      goto LABEL_44;
    }
  }
  else
  {
    if (!v47) {
      goto LABEL_44;
    }
    locale = (char *)&v45;
  }
  if (v20 - (char *)v16 <= *locale)
  {
    if ((v47 & 0x80) != 0)
    {
      locale = (char *)v45.__locale_;
      goto LABEL_43;
    }
LABEL_44:
    unint64_t v35 = HIDWORD(a3);
    if ((v13 & 7) == 4)
    {
      std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(*a2, v9, (char *)v16 - v9);
      unsigned __int8 v36 = a3 & 0xF8 | 3;
      if (SHIDWORD(a3) >= (int)v16 - (int)v9) {
        int v37 = v16 - v9;
      }
      else {
        int v37 = HIDWORD(a3);
      }
      unint64_t v35 = (HIDWORD(a3) - v37);
      unsigned __int8 v38 = 48;
      signed int v9 = (char *)v16;
    }
    else
    {
      unsigned __int8 v38 = BYTE4(a4);
      unsigned __int8 v36 = a3;
    }
    uint64_t v39 = *a2;
    uint64_t v40 = a3 & 0xFFFFFF00 | (v35 << 32) | v36;
    unint64_t v41 = a4 & 0xFFFFFF00FFFFFFFFLL | ((unint64_t)v38 << 32);
    if ((a3 & 0xFF00) == 0x700) {
      return std::__formatter::__write_transformed[abi:ne180100]<char *,char,char,char (*)(char),std::back_insert_iterator<std::__format::__output_buffer<char>>>(v9, v20, v39, v40, v41, (uint64_t (*)(void))std::__formatter::__hex_to_upper[abi:ne180100]);
    }
    else {
      return std::__formatter::__write[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(v9, v20 - v9, v39, v40, v41, v20 - v9);
    }
  }
  uint64_t v23 = *a2;
  memset(&__p, 0, sizeof(__p));
  if ((v47 & 0x80u) == 0) {
    double v24 = (std::string::value_type *)&v45;
  }
  else {
    double v24 = (std::string::value_type *)v45.__locale_;
  }
  if ((v47 & 0x80u) == 0) {
    __int16 v25 = (char *)&v45 + v47;
  }
  else {
    __int16 v25 = (char *)v45.__locale_ + v46;
  }
  std::string::value_type v26 = *v24;
  uint64_t v27 = v20 - (char *)v16 - *v24;
  if (v27 >= 1)
  {
    size_t v28 = v25 - 1;
    do
    {
      std::string::push_back(&__p, v26);
      if (v24 == v28)
      {
        std::string::value_type v26 = *v28;
        double v24 = v28;
      }
      else
      {
        uint64_t v29 = v24 + 1;
        unsigned int v30 = v24 + 1;
        do
        {
          int v31 = *v30++;
          std::string::value_type v26 = v31;
          if (v31) {
            BOOL v32 = 1;
          }
          else {
            BOOL v32 = v29 == v28;
          }
          uint64_t v29 = v30;
        }
        while (!v32);
        double v24 = v30 - 1;
      }
      v27 -= v26;
    }
    while (v27 > 0);
  }
  std::string::push_back(&__p, v26 + v27);
  char v33 = ((uint64_t (*)(const std::locale::facet *))v21->__vftable[1].~facet_0)(v21);
  float v34 = std::__formatter::__write_using_decimal_separators[abi:ne180100]<std::back_insert_iterator<std::__format::__output_buffer<char>>,char *,char>(v23, v9, (char *)v16, (int)v20, (uint64_t *)&__p, v33, a3, a4);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if ((char)v47 < 0) {
    operator delete(v45.__locale_);
  }
  return v34;
}

void sub_25B6747D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, std::locale a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15.__locale_);
  }
  _Unwind_Resume(exception_object);
}

char *std::__to_chars_integral[abi:ne180100]<unsigned long long>(_WORD *a1, uint64_t a2, unint64_t a3, signed int a4)
{
  int v4 = (char *)a2;
  HIDWORD(v6) = a4;
  LODWORD(v6) = a4 - 2;
  int v5 = v6 >> 1;
  if (v5 != 4)
  {
    if (!v5) {
      return (char *)std::__itoa::__integral<2u>::__to_chars[abi:ne180100]<unsigned long long>((uint64_t)a1, a2, a3);
    }
    if (v5 == 3) {
      return (char *)std::__itoa::__integral<8u>::__to_chars[abi:ne180100]<unsigned long long>((uint64_t)a1, a2, a3);
    }
    if (v5 != 7)
    {
      uint64_t v10 = a2 - (void)a1;
      int v11 = std::__to_chars_integral_width[abi:ne180100]<unsigned long long>(a3, a4);
      if (v10 < v11) {
        return (char *)a2;
      }
      int v4 = (char *)a1 + v11;
      unint64_t v12 = v4 - 1;
      unint64_t v13 = a3;
      do
      {
        *v12-- = a0123456789abcd[(v13 % a4)];
        BOOL v14 = v13 >= a4;
        v13 /= (unint64_t)a4;
      }
      while (v14);
      return v4;
    }
    return (char *)std::__itoa::__integral<16u>::__to_chars[abi:ne180100]<unsigned long long>((uint64_t)a1, a2, a3);
  }
  if (a2 - (uint64_t)a1 > 19) {
    return (char *)std::__itoa::__traits_base<unsigned long long,void>::__convert[abi:ne180100](a1, a3);
  }
  unsigned int v7 = (1233 * (64 - __clz(a3 | 1))) >> 12;
  if (a2 - (uint64_t)a1 >= v7 - (std::__itoa::__pow10_64[v7] > a3) + 1) {
    return (char *)std::__itoa::__traits_base<unsigned long long,void>::__convert[abi:ne180100](a1, a3);
  }
  return v4;
}

uint64_t std::__to_chars_integral_width[abi:ne180100]<unsigned long long>(unint64_t a1, unsigned int a2)
{
  if (a2 > a1) {
    return 1;
  }
  unint64_t v3 = a1;
  unint64_t v4 = a2 * a2;
  unint64_t v5 = (v4 * v4);
  uint64_t result = 4;
  while (1)
  {
    if (v3 < v4) {
      return (result - 2);
    }
    if (v3 < v4 * a2) {
      break;
    }
    if (v3 < v5) {
      return result;
    }
    v3 /= v5;
    uint64_t result = (result + 4);
    if (v3 < a2) {
      return (result - 3);
    }
  }
  return (result - 1);
}

_WORD *std::__itoa::__traits_base<unsigned long long,void>::__convert[abi:ne180100](_WORD *a1, unint64_t a2)
{
  unint64_t v2 = a2;
  if (HIDWORD(a2))
  {
    if (a2 > 0x2540BE3FFLL)
    {
      a1 = std::__itoa::__base_10_u32[abi:ne180100](a1, a2 / 0x2540BE400);
      v2 %= 0x2540BE400uLL;
    }
    return std::__itoa::__append10[abi:ne180100]<unsigned long long>(a1, v2);
  }
  else
  {
    return std::__itoa::__base_10_u32[abi:ne180100](a1, a2);
  }
}

_WORD *std::__itoa::__append10[abi:ne180100]<unsigned long long>(_WORD *a1, unint64_t a2)
{
  *a1 = std::__itoa::__digits_base_10[(a2 / 0x5F5E100)];
  unsigned int v2 = a2 % 0x5F5E100;
  a1[1] = std::__itoa::__digits_base_10[v2 / 0xF4240uLL];
  v2 %= 0xF4240u;
  a1[2] = std::__itoa::__digits_base_10[v2 / 0x2710uLL];
  v2 %= 0x2710u;
  a1[3] = std::__itoa::__digits_base_10[(unsigned __int16)v2 / 0x64u];
  a1[4] = std::__itoa::__digits_base_10[(unsigned __int16)v2 % 0x64u];
  return a1 + 5;
}

uint64_t std::__itoa::__integral<2u>::__to_chars[abi:ne180100]<unsigned long long>(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int64_t v3 = 64 - __clz(a3 | 1);
  if (a2 - a1 < v3) {
    return a2;
  }
  uint64_t v4 = a1 + v3;
  if (a3 < 0x11)
  {
    unint64_t v6 = a3;
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = a1 + v3;
    do
    {
      unint64_t v6 = a3 >> 4;
      *(_DWORD *)(v5 - 4) = std::__itoa::__base_2_lut[a3 & 0xF];
      v5 -= 4;
      BOOL v7 = a3 > 0x10F;
      a3 >>= 4;
    }
    while (v7);
  }
  unint64_t v8 = (unsigned char *)(v5 - 1);
  do
  {
    *v8-- = a01[v6 & 1];
    BOOL v7 = v6 > 1;
    v6 >>= 1;
  }
  while (v7);
  return v4;
}

uint64_t std::__itoa::__integral<8u>::__to_chars[abi:ne180100]<unsigned long long>(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = (86 * (66 - __clz(a3 | 1))) >> 8;
  if (a2 - a1 < v3) {
    return a2;
  }
  uint64_t v4 = a1 + v3;
  if (a3 < 0x41)
  {
    unint64_t v6 = a3;
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = a1 + v3;
    do
    {
      unint64_t v6 = a3 >> 6;
      *(_WORD *)(v5 - 2) = std::__itoa::__base_8_lut[a3 & 0x3F];
      v5 -= 2;
      a3 = v6;
    }
    while (v6 > 0x40);
  }
  BOOL v7 = (unsigned char *)(v5 - 1);
  do
  {
    *v7-- = a01234567[v6 & 7];
    BOOL v8 = v6 > 7;
    v6 >>= 3;
  }
  while (v8);
  return v4;
}

uint64_t std::__itoa::__integral<16u>::__to_chars[abi:ne180100]<unsigned long long>(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3 = 67 - __clz(a3 | 1);
  if (a2 - a1 < (uint64_t)(v3 >> 2)) {
    return a2;
  }
  uint64_t v4 = a1 + (v3 >> 2);
  if (a3 < 0x101)
  {
    unint64_t v6 = a3;
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = a1 + (v3 >> 2);
    do
    {
      unint64_t v6 = a3 >> 8;
      *(_WORD *)(v5 - 2) = std::__itoa::__base_16_lut[a3];
      v5 -= 2;
      a3 = v6;
    }
    while (v6 > 0x100);
  }
  BOOL v7 = (unsigned char *)(v5 - 1);
  do
  {
    *v7-- = a0123456789abcd_0[v6 & 0xF];
    BOOL v8 = v6 > 0xF;
    v6 >>= 4;
  }
  while (v8);
  return v4;
}

void *std::__formatter_integer<char>::format[abi:ne180100]<__int128,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char *a1, unint64_t a2, uint64_t a3, void *a4)
{
  unint64_t v8 = std::__format_spec::__parser<char>::__get_parsed_std_specifications[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a1, a4);
  if ((v8 & 0xFF00) == 0xA00)
  {
    signed int v9 = (void *)*a4;
    return std::__formatter::__format_char[abi:ne180100]<char,__int128,std::back_insert_iterator<std::__format::__output_buffer<char>>>(a2, a3, v9, v8, v7);
  }
  else
  {
    unsigned long long v11 = __PAIR128__(a3 ^ (unint64_t)(a3 >> 63), a2 ^ (a3 >> 63)) - __PAIR128__(a3 >> 63, a3 >> 63);
    return std::__formatter::__format_integer[abi:ne180100]<unsigned __int128,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(v11, *((unint64_t *)&v11 + 1), (void **)a4, v8, v7, a3 < 0);
  }
}

void *std::__formatter::__format_char[abi:ne180100]<char,__int128,std::back_insert_iterator<std::__format::__output_buffer<char>>>(unint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  if (__PAIR128__(-1, -257) >= __PAIR128__((unint64_t)(a1 >= 0x80) + a2 - 1, a1 - 128)) {
    std::__throw_format_error[abi:ne180100]("Integral value outside the range of the char type");
  }
  char __src = a1;
  return std::__formatter::__write[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(&__src, 1uLL, a3, a4, a5, 1);
}

void *std::__formatter::__format_integer[abi:ne180100]<unsigned __int128,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(unint64_t a1, unint64_t a2, void **a3, unint64_t a4, unint64_t a5, char a6)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  switch(BYTE1(a4))
  {
    case 1:
      __break(1u);
      JUMPOUT(0x25B674F5CLL);
    case 2:
      unint64_t v7 = a4 & 0xFFFFFFFFFFFF00FFLL | 0x200;
      unint64_t v8 = &v15;
      signed int v10 = 2;
      signed int v9 = "0b";
      goto LABEL_11;
    case 3:
      unint64_t v7 = a4 & 0xFFFFFFFFFFFF00FFLL | 0x300;
      unint64_t v8 = &v15;
      signed int v10 = 2;
      signed int v9 = "0B";
      goto LABEL_11;
    case 4:
      unint64_t v7 = a4 & 0xFFFFFFFFFFFF00FFLL | 0x400;
      unint64_t v8 = (uint64_t *)v14;
      if (a1 | a2) {
        signed int v9 = "0";
      }
      else {
        signed int v9 = 0;
      }
      signed int v10 = 8;
      goto LABEL_11;
    case 6:
      unint64_t v7 = a4 & 0xFFFFFFFFFFFF00FFLL | 0x600;
      unint64_t v8 = (uint64_t *)v12;
      signed int v10 = 16;
      signed int v9 = "0x";
      goto LABEL_11;
    case 7:
      unint64_t v7 = a4 & 0xFFFFFFFFFFFF00FFLL | 0x700;
      unint64_t v8 = (uint64_t *)v12;
      signed int v10 = 16;
      signed int v9 = "0X";
LABEL_11:
      uint64_t result = std::__formatter::__format_integer[abi:ne180100]<unsigned __int128,char *,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a1, a2, a3, v7, a5, a6, v11, (uint64_t)v8, v9, v10);
      break;
    default:
      uint64_t result = std::__formatter::__format_integer[abi:ne180100]<unsigned __int128,char *,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a1, a2, a3, a4, a5, a6, v11, (uint64_t)v13, 0, 10);
      break;
  }
  return result;
}

void *std::__formatter::__format_integer[abi:ne180100]<unsigned __int128,char *,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(unint64_t a1, unint64_t a2, void **a3, unint64_t a4, unint64_t a5, char a6, char *a7, uint64_t a8, unsigned char *a9, signed int a10)
{
  signed int v10 = a7;
  char v14 = a4;
  if (a6)
  {
    char v15 = 45;
LABEL_7:
    *a7 = v15;
    char v17 = a7 + 1;
    goto LABEL_8;
  }
  int v16 = (a4 >> 3) & 3;
  if (v16 == 2)
  {
    char v15 = 43;
    goto LABEL_7;
  }
  char v17 = a7;
  if (v16 == 3)
  {
    char v15 = 32;
    goto LABEL_7;
  }
LABEL_8:
  if ((a4 & 0x20) != 0)
  {
    if (a9)
    {
      char v18 = *a9;
      if (*a9)
      {
        int v19 = a9 + 1;
        do
        {
          *v17++ = v18;
          int v20 = *v19++;
          char v18 = v20;
        }
        while (v20);
      }
    }
  }
  uint64_t v21 = (char *)std::__to_chars_integral[abi:ne180100]<unsigned __int128>(v17, a8, a1, a2, a10);
  if ((v14 & 0x40) == 0) {
    goto LABEL_44;
  }
  std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>::locale[abi:ne180100]((uint64_t)a3, &v46);
  int v22 = std::locale::use_facet(&v46, MEMORY[0x263F8C150]);
  std::locale::~locale(&v46);
  ((void (*)(std::locale *__return_ptr, const std::locale::facet *))v22->__vftable[1].__on_zero_shared)(&v46, v22);
  if ((char)v48 < 0)
  {
    locale = (char *)v46.__locale_;
    if (!v47)
    {
LABEL_43:
      operator delete(locale);
      goto LABEL_44;
    }
  }
  else
  {
    if (!v48) {
      goto LABEL_44;
    }
    locale = (char *)&v46;
  }
  if (v21 - v17 <= *locale)
  {
    if ((v48 & 0x80) != 0)
    {
      locale = (char *)v46.__locale_;
      goto LABEL_43;
    }
LABEL_44:
    unint64_t v36 = HIDWORD(a4);
    if ((v14 & 7) == 4)
    {
      std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(*a3, v10, v17 - v10);
      unsigned __int8 v37 = a4 & 0xF8 | 3;
      if (SHIDWORD(a4) >= (int)v17 - (int)v10) {
        int v38 = v17 - v10;
      }
      else {
        int v38 = HIDWORD(a4);
      }
      unint64_t v36 = (HIDWORD(a4) - v38);
      unsigned __int8 v39 = 48;
      signed int v10 = v17;
    }
    else
    {
      unsigned __int8 v39 = BYTE4(a5);
      unsigned __int8 v37 = a4;
    }
    uint64_t v40 = *a3;
    uint64_t v41 = a4 & 0xFFFFFF00 | (v36 << 32) | v37;
    unint64_t v42 = a5 & 0xFFFFFF00FFFFFFFFLL | ((unint64_t)v39 << 32);
    if ((a4 & 0xFF00) == 0x700) {
      return std::__formatter::__write_transformed[abi:ne180100]<char *,char,char,char (*)(char),std::back_insert_iterator<std::__format::__output_buffer<char>>>(v10, v21, v40, v41, v42, (uint64_t (*)(void))std::__formatter::__hex_to_upper[abi:ne180100]);
    }
    else {
      return std::__formatter::__write[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(v10, v21 - v10, v40, v41, v42, v21 - v10);
    }
  }
  double v24 = *a3;
  memset(&__p, 0, sizeof(__p));
  if ((v48 & 0x80u) == 0) {
    __int16 v25 = (std::string::value_type *)&v46;
  }
  else {
    __int16 v25 = (std::string::value_type *)v46.__locale_;
  }
  if ((v48 & 0x80u) == 0) {
    std::string::value_type v26 = (char *)&v46 + v48;
  }
  else {
    std::string::value_type v26 = (char *)v46.__locale_ + v47;
  }
  std::string::value_type v27 = *v25;
  uint64_t v28 = v21 - v17 - *v25;
  if (v28 >= 1)
  {
    uint64_t v29 = v26 - 1;
    do
    {
      std::string::push_back(&__p, v27);
      if (v25 == v29)
      {
        std::string::value_type v27 = *v29;
        __int16 v25 = v29;
      }
      else
      {
        unsigned int v30 = v25 + 1;
        int v31 = v25 + 1;
        do
        {
          int v32 = *v31++;
          std::string::value_type v27 = v32;
          if (v32) {
            BOOL v33 = 1;
          }
          else {
            BOOL v33 = v30 == v29;
          }
          unsigned int v30 = v31;
        }
        while (!v33);
        __int16 v25 = v31 - 1;
      }
      v28 -= v27;
    }
    while (v28 > 0);
  }
  std::string::push_back(&__p, v27 + v28);
  char v34 = ((uint64_t (*)(const std::locale::facet *))v22->__vftable[1].~facet_0)(v22);
  unint64_t v35 = std::__formatter::__write_using_decimal_separators[abi:ne180100]<std::back_insert_iterator<std::__format::__output_buffer<char>>,char *,char>(v24, v10, v17, (int)v21, (uint64_t *)&__p, v34, a4, a5);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if ((char)v48 < 0) {
    operator delete(v46.__locale_);
  }
  return v35;
}

void sub_25B6752A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, std::locale a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15.__locale_);
  }
  _Unwind_Resume(exception_object);
}

_WORD *std::__to_chars_integral[abi:ne180100]<unsigned __int128>(unsigned char *a1, uint64_t a2, unint64_t a3, unint64_t a4, signed int a5)
{
  unint64_t v5 = a4;
  unint64_t v6 = a3;
  unint64_t v7 = (unsigned char *)a2;
  HIDWORD(v9) = a5;
  LODWORD(v9) = a5 - 2;
  int v8 = v9 >> 1;
  if (v8 != 4)
  {
    if (!v8) {
      return (_WORD *)std::__itoa::__integral<2u>::__to_chars[abi:ne180100]<unsigned __int128>((uint64_t)a1, a2, a3, a4);
    }
    if (v8 == 3) {
      return (_WORD *)std::__itoa::__integral<8u>::__to_chars[abi:ne180100]<unsigned __int128>((uint64_t)a1, a2, a3, a4);
    }
    if (v8 != 7)
    {
      uint64_t v18 = a2 - (void)a1;
      int v19 = std::__to_chars_integral_width[abi:ne180100]<unsigned __int128>(a3, a4, a5);
      if (v18 >= v19)
      {
        unint64_t v7 = &a1[v19];
        int v20 = v7 - 1;
        do
        {
          uint64_t v21 = __udivti3();
          BOOL v22 = __PAIR128__(v5, v6) >= a5;
          *v20-- = a0123456789abcd[(v6 - v21 * a5)];
          unint64_t v6 = v21;
          unint64_t v5 = v23;
        }
        while (v22);
      }
      return v7;
    }
    return (_WORD *)std::__itoa::__integral<16u>::__to_chars[abi:ne180100]<unsigned __int128>((uint64_t)a1, a2, a3, a4);
  }
  uint64_t v10 = a2 - (void)a1;
  if (a4)
  {
    if (v10 > 38) {
      return std::__itoa::__base_10_u128[abi:ne180100](a1, a3, a4);
    }
    unsigned int v11 = (1233 * (128 - __clz(a4))) >> 12;
    if (v10 >= v11 - (__PAIR128__(a4, a3) < std::__itoa::__pow10_128[v11]) + 1) {
      return std::__itoa::__base_10_u128[abi:ne180100](a1, a3, a4);
    }
  }
  else
  {
    if (v10 > 19) {
      return std::__itoa::__traits_base<unsigned long long,void>::__convert[abi:ne180100](a1, a3);
    }
    unsigned int v13 = (1233 * (64 - __clz(a3 | 1))) >> 12;
    if (v10 >= v13 - (std::__itoa::__pow10_64[v13] > a3) + 1) {
      return std::__itoa::__traits_base<unsigned long long,void>::__convert[abi:ne180100](a1, a3);
    }
  }
  return v7;
}

uint64_t std::__to_chars_integral_width[abi:ne180100]<unsigned __int128>(uint64_t a1, unint64_t a2, unsigned int a3)
{
  if (__PAIR128__(a2, a1) < a3) {
    return 1;
  }
  unsigned int v5 = a3 * a3;
  unsigned int v6 = a3 * a3 * a3;
  uint64_t v3 = 4;
  while (1)
  {
    if (__PAIR128__(a2, a1) < v5) {
      return (v3 - 2);
    }
    if (__PAIR128__(a2, a1) < v6) {
      break;
    }
    if (__PAIR128__(a2, a1) < v5 * v5) {
      return v3;
    }
    a1 = __udivti3();
    uint64_t v3 = (v3 + 4);
    if (__PAIR128__(a2, a1) < a3) {
      return (v3 - 3);
    }
  }
  return (v3 - 1);
}

_WORD *std::__itoa::__base_10_u128[abi:ne180100](unsigned char *a1, unint64_t a2, unint64_t a3)
{
  uint64_t v3 = a1;
  if (__PAIR128__(a3, a2) >= __PAIR128__(0x4B3B4CA85A86C47ALL, 0x98A224000000000))
  {
    *a1 = __udivti3() | 0x30;
    unsigned int v7 = __udivti3();
    *((unsigned char *)v3 + 1) = v7 / 0x5F5E100 + 48;
    v3[1] = std::__itoa::__digits_base_10[v7 % 0x5F5E100 / 0xF4240];
    unsigned int v8 = v7 % 0x5F5E100 % 0xF4240;
    v3[2] = std::__itoa::__digits_base_10[v8 / 0x2710uLL];
    v8 %= 0x2710u;
    v3[3] = std::__itoa::__digits_base_10[(unsigned __int16)v8 / 0x64u];
    v3[4] = std::__itoa::__digits_base_10[(unsigned __int16)v8 % 0x64u];
    unint64_t v9 = __udivti3();
    uint64_t v10 = v3 + 5;
  }
  else
  {
    unint64_t v4 = __udivti3();
    unint64_t v5 = v4;
    if (!HIDWORD(v4))
    {
      unsigned int v6 = std::__itoa::__base_10_u32[abi:ne180100](v3, v4);
      goto LABEL_9;
    }
    if (v4 > 0x2540BE3FFLL)
    {
      uint64_t v3 = std::__itoa::__base_10_u32[abi:ne180100](v3, v4 / 0x2540BE400);
      v5 %= 0x2540BE400uLL;
    }
    uint64_t v10 = v3;
    unint64_t v9 = v5;
  }
  unsigned int v6 = std::__itoa::__append10[abi:ne180100]<unsigned long long>(v10, v9);
LABEL_9:
  unsigned int v11 = v6;
  unint64_t v12 = __umodti3();
  *(unsigned char *)unsigned int v11 = v12 / 0x2540BE400 / 0x5F5E100 + 48;
  unsigned int v13 = v12 / 0x2540BE400 % 0x5F5E100;
  *(_WORD *)((char *)v11 + 1) = std::__itoa::__digits_base_10[v13 / 0xF4240];
  v13 %= 0xF4240u;
  *(_WORD *)((char *)v11 + 3) = std::__itoa::__digits_base_10[v13 / 0x2710uLL];
  v13 %= 0x2710u;
  *(_WORD *)((char *)v11 + 5) = std::__itoa::__digits_base_10[(unsigned __int16)v13 / 0x64u];
  *(_WORD *)((char *)v11 + 7) = std::__itoa::__digits_base_10[(unsigned __int16)v13 % 0x64u];
  return std::__itoa::__append10[abi:ne180100]<unsigned long long>((_WORD *)((char *)v11 + 9), v12 % 0x2540BE400);
}

uint64_t std::__itoa::__integral<2u>::__to_chars[abi:ne180100]<unsigned __int128>(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v4 = __clz(a3 | 1) | 0x40;
  unint64_t v5 = __clz(a4);
  if (a4) {
    unint64_t v4 = v5;
  }
  int64_t v6 = 128 - v4;
  if (a2 - a1 < v6) {
    return a2;
  }
  uint64_t v7 = a1 + v6;
  if (__PAIR128__(a4, a3) < 0x11)
  {
    unint64_t v9 = a3;
    unint64_t v12 = a4;
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = a1 + v6;
    do
    {
      *((void *)&v10 + 1) = a4;
      *(void *)&long long v10 = a3;
      unint64_t v9 = v10 >> 4;
      BOOL v11 = a3 <= 0x10F;
      unint64_t v12 = a4 >> 4;
      *(_DWORD *)(v8 - 4) = std::__itoa::__base_2_lut[a3 & 0xF];
      v8 -= 4;
      a3 = v9;
      a4 >>= 4;
    }
    while (!v11);
  }
  unsigned int v13 = (unsigned char *)(v8 - 1);
  do
  {
    unint64_t v14 = v9 & 1;
    BOOL v11 = v9 <= 1;
    *((void *)&v15 + 1) = v12;
    *(void *)&long long v15 = v9;
    unint64_t v9 = v15 >> 1;
    v12 >>= 1;
    *v13-- = a01[v14];
  }
  while (!v11);
  return v7;
}

uint64_t std::__itoa::__integral<8u>::__to_chars[abi:ne180100]<unsigned __int128>(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  char v4 = __clz(a3 | 1) | 0x40;
  char v5 = __clz(a4);
  if (a4) {
    char v4 = v5;
  }
  uint64_t v6 = (-126 - v4) / 3u;
  if (a2 - a1 < v6) {
    return a2;
  }
  uint64_t v7 = a1 + v6;
  if (__PAIR128__(a4, a3) < 0x41)
  {
    unint64_t v9 = a3;
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = a1 + v6;
    do
    {
      *((void *)&v10 + 1) = a4;
      *(void *)&long long v10 = a3;
      unint64_t v9 = v10 >> 6;
      a4 >>= 6;
      *(_WORD *)(v8 - 2) = std::__itoa::__base_8_lut[a3 & 0x3F];
      v8 -= 2;
      a3 = v9;
    }
    while (v9 > 0x40);
  }
  BOOL v11 = (unsigned char *)(v8 - 1);
  do
  {
    unint64_t v12 = v9 & 7;
    BOOL v13 = v9 <= 7;
    *((void *)&v14 + 1) = a4;
    *(void *)&long long v14 = v9;
    unint64_t v9 = v14 >> 3;
    a4 >>= 3;
    *v11-- = a01234567[v12];
  }
  while (!v13);
  return v7;
}

uint64_t std::__itoa::__integral<16u>::__to_chars[abi:ne180100]<unsigned __int128>(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v4 = __clz(a3 | 1) | 0x40;
  unint64_t v5 = __clz(a4);
  if (a4) {
    unint64_t v4 = v5;
  }
  unint64_t v6 = 131 - v4;
  if (a2 - a1 < (uint64_t)(v6 >> 2)) {
    return a2;
  }
  uint64_t v7 = a1 + (v6 >> 2);
  if (__PAIR128__(a4, a3) < 0x101)
  {
    unint64_t v9 = a3;
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = a1 + (v6 >> 2);
    do
    {
      *((void *)&v10 + 1) = a4;
      *(void *)&long long v10 = a3;
      unint64_t v9 = v10 >> 8;
      a4 >>= 8;
      *(_WORD *)(v8 - 2) = std::__itoa::__base_16_lut[a3];
      v8 -= 2;
      a3 = v9;
    }
    while (v9 > 0x100);
  }
  BOOL v11 = (unsigned char *)(v8 - 1);
  do
  {
    unint64_t v12 = v9 & 0xF;
    BOOL v13 = v9 <= 0xF;
    *((void *)&v14 + 1) = a4;
    *(void *)&long long v14 = v9;
    unint64_t v9 = v14 >> 4;
    a4 >>= 4;
    *v11-- = a0123456789abcd_0[v12];
  }
  while (!v13);
  return v7;
}

void *std::__formatter_integer<char>::format[abi:ne180100]<unsigned int,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char *a1, unsigned int a2, void *a3)
{
  unint64_t v6 = std::__format_spec::__parser<char>::__get_parsed_std_specifications[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a1, a3);
  unint64_t v7 = v5;
  if ((v6 & 0xFF00) == 0xA00)
  {
    uint64_t v8 = (void *)*a3;
    return std::__formatter::__format_char[abi:ne180100]<char,unsigned int,std::back_insert_iterator<std::__format::__output_buffer<char>>>(a2, v8, v6, v7);
  }
  else
  {
    return std::__formatter::__format_integer[abi:ne180100]<unsigned int,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a2, (void **)a3, v6, v5, 0);
  }
}

void *std::__formatter::__format_char[abi:ne180100]<char,unsigned int,std::back_insert_iterator<std::__format::__output_buffer<char>>>(unsigned int a1, void *a2, uint64_t a3, unint64_t a4)
{
  if (a1 >= 0x80) {
    std::__throw_format_error[abi:ne180100]("Integral value outside the range of the char type");
  }
  char __src = a1;
  return std::__formatter::__write[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(&__src, 1uLL, a2, a3, a4, 1);
}

void *std::__formatter_integer<char>::format[abi:ne180100]<unsigned long long,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char *a1, unint64_t a2, void *a3)
{
  unint64_t v6 = std::__format_spec::__parser<char>::__get_parsed_std_specifications[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a1, a3);
  unint64_t v7 = v5;
  if ((v6 & 0xFF00) == 0xA00)
  {
    uint64_t v8 = (void *)*a3;
    return std::__formatter::__format_char[abi:ne180100]<char,unsigned long long,std::back_insert_iterator<std::__format::__output_buffer<char>>>(a2, v8, v6, v7);
  }
  else
  {
    return std::__formatter::__format_integer[abi:ne180100]<unsigned long long,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a2, (void **)a3, v6, v5, 0);
  }
}

void *std::__formatter::__format_char[abi:ne180100]<char,unsigned long long,std::back_insert_iterator<std::__format::__output_buffer<char>>>(unint64_t a1, void *a2, uint64_t a3, unint64_t a4)
{
  if (a1 >= 0x80) {
    std::__throw_format_error[abi:ne180100]("Integral value outside the range of the char type");
  }
  char __src = a1;
  return std::__formatter::__write[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(&__src, 1uLL, a2, a3, a4, 1);
}

void *std::__formatter_integer<char>::format[abi:ne180100]<unsigned __int128,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char *a1, unint64_t a2, unint64_t a3, void *a4)
{
  unint64_t v8 = std::__format_spec::__parser<char>::__get_parsed_std_specifications[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a1, a4);
  if ((v8 & 0xFF00) == 0xA00)
  {
    unint64_t v9 = (void *)*a4;
    return std::__formatter::__format_char[abi:ne180100]<char,unsigned __int128,std::back_insert_iterator<std::__format::__output_buffer<char>>>(a2, a3, v9, v8, v7);
  }
  else
  {
    return std::__formatter::__format_integer[abi:ne180100]<unsigned __int128,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a2, a3, (void **)a4, v8, v7, 0);
  }
}

void *std::__formatter::__format_char[abi:ne180100]<char,unsigned __int128,std::back_insert_iterator<std::__format::__output_buffer<char>>>(unint64_t a1, unint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  if (__PAIR128__(a2, a1) >= 0x80) {
    std::__throw_format_error[abi:ne180100]("Integral value outside the range of the char type");
  }
  char __src = a1;
  return std::__formatter::__write[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(&__src, 1uLL, a3, a4, a5, 1);
}

void *std::__formatter::__format_floating_point[abi:ne180100]<float,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(uint64_t **a1, uint64_t a2, unint64_t a3, float a4)
{
  v46[32] = *MEMORY[0x263EF8340];
  int v7 = LODWORD(a4) >> 31;
  if ((LODWORD(a4) & 0x7FFFFFFFu) < 0x7F800000)
  {
    unint64_t v8 = (unint64_t)a2 >> 8;
    if (a4 >= 0.0) {
      float v9 = a4;
    }
    else {
      float v9 = -a4;
    }
    if (a3 == -1) {
      int v10 = 149;
    }
    else {
      int v10 = a3;
    }
    int v42 = v10;
    int v43 = 0;
    if (v10 < 150)
    {
      unint64_t v44 = v10 + 45;
      if ((v10 + 45) >= 0x101)
      {
        BOOL v11 = operator new(v10 + 45);
LABEL_13:
        std::string __p = v11;
        std::__formatter::__format_buffer[abi:ne180100]<float,float>((unsigned int *)&v42, v7, (a3 & 0x80000000) == 0, (a2 >> 3) & 3, v8, (std::__1 **)&v38, v9);
        if ((a2 & 0x20) != 0)
        {
          unint64_t v12 = v39;
          if (v39 == *(char **)v41)
          {
            *(void *)uint64_t v41 = v39 + 1;
            char *v39 = 46;
            BOOL v13 = v40;
            long long v14 = (char *)(*(void *)v41 - 1);
            if (v40 != (char *)(*(void *)v41 - 1))
            {
              if (v40 + 1 == v14)
              {
                char v16 = *v40;
                *uint64_t v40 = *v14;
                *long long v14 = v16;
              }
              else
              {
                char v15 = *(unsigned char *)(*(void *)v41 - 1);
                memmove(v40 + 1, v40, *(void *)v41 - 1 - (void)v40);
                char *v13 = v15;
              }
            }
            unint64_t v12 = v40;
            unsigned __int8 v39 = v40++;
          }
          if ((BYTE1(a2) - 17) <= 1u)
          {
            if (a3 <= 1) {
              int v17 = 1;
            }
            else {
              int v17 = a3;
            }
            if ((a3 & 0x80000000) != 0) {
              int v17 = 6;
            }
            if (v40 == *(char **)v41) {
              int v18 = v38 - v12;
            }
            else {
              int v18 = -1;
            }
            int v19 = v18 + v17;
            int v20 = &v40[~(unint64_t)v12];
            if ((uint64_t)v20 < v19) {
              v43 += v19 - v20;
            }
          }
        }
        if ((a2 & 0x40) != 0)
        {
          uint64_t v28 = *a1;
          std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>::locale[abi:ne180100]((uint64_t)a1, &v37);
          uint64_t v29 = std::__formatter::__format_locale_specific_form[abi:ne180100]<std::back_insert_iterator<std::__format::__output_buffer<char>>,float,char>(v28, (uint64_t)&v42, &v38, &v37, a2, a3);
          std::locale::~locale(&v37);
        }
        else
        {
          uint64_t v21 = *(void *)v41;
          BOOL v22 = (char *)__p;
          uint64_t v23 = *(void *)v41 - (void)__p;
          size_t v24 = v43;
          if (*(void *)v41 - (void)__p + v43 >= a2 >> 32)
          {
            if (!v43 || (unsigned int v30 = v40, v40 == *(char **)v41))
            {
              uint64_t v29 = *a1;
              std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(*a1, (char *)__p, *(void *)v41 - (void)__p);
              std::__format::__output_buffer<char>::__fill[abi:ne180100](v29, v24, 48);
            }
            else
            {
              uint64_t v29 = *a1;
              std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(*a1, (char *)__p, v40 - (unsigned char *)__p);
              std::__format::__output_buffer<char>::__fill[abi:ne180100](v29, v24, 48);
              std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(v29, v30, v21 - (void)v30);
            }
          }
          else
          {
            __int16 v25 = *a1;
            if ((a2 & 7) == 4)
            {
              if (__p != v38)
              {
                unint64_t v36 = v25;
                std::back_insert_iterator<std::__format::__output_buffer<char>>::operator=[abi:ne180100](&v36, (char *)__p);
                ++v22;
              }
              unsigned __int8 v26 = a2 & 0xF8 | 3;
              unsigned __int8 v27 = 48;
            }
            else
            {
              unsigned __int8 v27 = BYTE4(a3);
              unsigned __int8 v26 = a2;
            }
            unint64_t v31 = a2 & 0xFFFFFFFFFFFFFF00 | v26;
            unint64_t v32 = a3 & 0xFFFFFF00FFFFFFFFLL | ((unint64_t)v27 << 32);
            if (v24) {
              BOOL v33 = std::__formatter::__write_using_trailing_zeros[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(v22, *(uint64_t *)v41, v25, v31, v32, v23, v40, v24);
            }
            else {
              BOOL v33 = std::__formatter::__write[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(v22, *(void *)v41 - (void)v22, v25, v31, v32, v23);
            }
            uint64_t v29 = v33;
          }
        }
        if (v44 >= 0x101) {
          operator delete(__p);
        }
        return v29;
      }
    }
    else
    {
      int v42 = 149;
      int v43 = v10 - 149;
      unint64_t v44 = 194;
    }
    BOOL v11 = v46;
    goto LABEL_13;
  }
  unint64_t v35 = *a1;
  return std::__formatter::__format_floating_point_non_finite[abi:ne180100]<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>(v35, a2, a3, a4 < 0.0, 0);
}

void sub_25B676118(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t a16, void *__p)
{
  if (a16 >= 0x101) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__formatter::__format_floating_point_non_finite[abi:ne180100]<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>(void *a1, uint64_t a2, unint64_t a3, char a4, int a5)
{
  if (a4)
  {
    char v5 = 45;
  }
  else
  {
    int v6 = (a2 >> 3) & 3;
    if (v6 == 2)
    {
      char v5 = 43;
    }
    else
    {
      if (v6 != 3)
      {
        p_src = &__src;
        goto LABEL_8;
      }
      char v5 = 32;
    }
  }
  p_src = v14;
  char __src = v5;
LABEL_8:
  if (BYTE1(a2) <= 0x10u && ((1 << SBYTE1(a2)) & 0x15000) != 0)
  {
    uint64_t v8 = 6;
  }
  else
  {
    uint64_t v8 = 6;
    if (BYTE1(a2) != 18) {
      uint64_t v8 = 0;
    }
  }
  uint64_t v9 = 3;
  if (!a5) {
    uint64_t v9 = 0;
  }
  int v10 = &aInfnaninfnan[v8 + v9];
  *(_WORD *)p_src = *(_WORD *)v10;
  p_src[2] = v10[2];
  if ((a2 & 7) == 4) {
    unsigned __int8 v11 = a2 & 0xF8 | 3;
  }
  else {
    unsigned __int8 v11 = a2;
  }
  return std::__formatter::__write[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(&__src, p_src - &__src + 3, a1, a2 & 0xFFFFFFFFFFFFFF00 | v11, a3, p_src - &__src + 3);
}

uint64_t std::__formatter::__format_buffer[abi:ne180100]<float,float>@<X0>(unsigned int *a1@<X0>, char a2@<W1>, int a3@<W2>, int a4@<W3>, int a5@<W4>, std::__1 **a6@<X8>, float a7@<S0>)
{
  uint64_t v9 = (std::__1 *)*((void *)a1 + 2);
  if (a2)
  {
    char v10 = 45;
  }
  else if (a4 == 2)
  {
    char v10 = 43;
  }
  else
  {
    if (a4 != 3) {
      goto LABEL_8;
    }
    char v10 = 32;
  }
  *(unsigned char *)uint64_t v9 = v10;
  uint64_t v9 = (std::__1 *)((char *)v9 + 1);
LABEL_8:
  switch(a5)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
      __break(1u);
      JUMPOUT(0x25B67640CLL);
    case 11:
      if (a3) {
        int v14 = *a1;
      }
      else {
        int v14 = -1;
      }
      return std::__formatter::__format_buffer_hexadecimal_lower_case[abi:ne180100]<float,float>((uint64_t)a1, v14, (uint64_t)v9, a6);
    case 12:
      if (a3) {
        int v17 = *a1;
      }
      else {
        int v17 = -1;
      }
      return std::__formatter::__format_buffer_hexadecimal_upper_case[abi:ne180100]<float,float>((uint64_t)a1, v17, (uint64_t)v9, a6);
    case 13:
      uint64_t v18 = *a1;
      return std::__formatter::__format_buffer_scientific_lower_case[abi:ne180100]<float,float>((uint64_t)a1, v18, (uint64_t)v9, a6);
    case 14:
      uint64_t result = std::__formatter::__format_buffer_scientific_lower_case[abi:ne180100]<float,float>((uint64_t)a1, *a1, (uint64_t)v9, a6);
      char v16 = a6[2];
      goto LABEL_25;
    case 15:
    case 16:
      uint64_t v11 = *a1;
      *a6 = v9;
      uint64_t result = MEMORY[0x261165F50](v9, *((void *)a1 + 2) + *((void *)a1 + 1), 2, v11);
      a6[2] = (std::__1 *)result;
      a6[3] = (std::__1 *)result;
      if (v11) {
        int v13 = v11 + 1;
      }
      else {
        int v13 = 0;
      }
      a6[1] = (std::__1 *)(result - v13);
      return result;
    case 17:
      goto LABEL_20;
    case 18:
      uint64_t result = (uint64_t)std::__formatter::__format_buffer_general_lower_case[abi:ne180100]<float,float>((uint64_t)a1, *a1, (uint64_t)v9, a6);
      char v16 = a6[2];
      if (v16 != a6[3]) {
LABEL_25:
      }
        *(unsigned char *)char v16 = 69;
      break;
    default:
      if (a3)
      {
LABEL_20:
        uint64_t v15 = *a1;
        uint64_t result = (uint64_t)std::__formatter::__format_buffer_general_lower_case[abi:ne180100]<float,float>((uint64_t)a1, v15, (uint64_t)v9, a6);
      }
      else
      {
        uint64_t result = (uint64_t)std::__formatter::__format_buffer_default[abi:ne180100]<float,float>(v9, (uint64_t)a1, (char *)v9, a6, a7);
      }
      break;
  }
  return result;
}

void *std::__formatter::__format_locale_specific_form[abi:ne180100]<std::back_insert_iterator<std::__format::__output_buffer<char>>,float,char>(void *a1, uint64_t a2, char **a3, std::locale *this, uint64_t a5, unint64_t a6)
{
  uint64_t v11 = std::locale::use_facet(this, MEMORY[0x263F8C150]);
  ((void (*)(std::string *__return_ptr))v11->__vftable[1].__on_zero_shared)(&__p);
  unint64_t v12 = a3[2];
  int v13 = *a3;
  if (v12 >= a3[1]) {
    unint64_t v12 = a3[1];
  }
  int64_t __len = v12 - v13;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
    if (!__p.__r_.__value_.__l.__size_) {
      goto LABEL_29;
    }
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if (__len <= *__p.__r_.__value_.__l.__data_)
    {
      *__p.__r_.__value_.__l.__data_ = 0;
      __p.__r_.__value_.__l.__size_ = 0;
      goto LABEL_29;
    }
    std::string::size_type v16 = __p.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((unsigned char *)&__p.__r_.__value_.__s + 23)) {
      goto LABEL_29;
    }
    if (__len <= __p.__r_.__value_.__s.__data_[0])
    {
      __p.__r_.__value_.__s.__data_[0] = 0;
      *((unsigned char *)&__p.__r_.__value_.__s + 23) = 0;
      goto LABEL_29;
    }
    p_p = &__p;
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
    std::string::size_type v16 = __p.__r_.__value_.__r.__words[0];
  }
  memset(&v56, 0, sizeof(v56));
  int v17 = (char *)(v16 + size);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v17 = (char *)&__p + HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  std::string::value_type v18 = p_p->__r_.__value_.__s.__data_[0];
  uint64_t v19 = __len - p_p->__r_.__value_.__s.__data_[0];
  if (v19 >= 1)
  {
    int v20 = v17 - 1;
    do
    {
      std::string::push_back(&v56, v18);
      if (p_p == (std::string *)v20)
      {
        std::string::value_type v18 = *v20;
        p_p = (std::string *)v20;
      }
      else
      {
        uint64_t v21 = &p_p->__r_.__value_.__s.__data_[1];
        BOOL v22 = &p_p->__r_.__value_.__s.__data_[1];
        do
        {
          int v23 = *v22++;
          std::string::value_type v18 = v23;
          if (v23) {
            BOOL v24 = 1;
          }
          else {
            BOOL v24 = v21 == v20;
          }
          uint64_t v21 = v22;
        }
        while (!v24);
        p_p = (std::string *)(v22 - 1);
      }
      v19 -= v18;
    }
    while (v19 > 0);
  }
  std::string::push_back(&v56, v18 + v19);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::string __p = v56;
LABEL_29:
  unint64_t v25 = HIDWORD(a6);
  unsigned __int8 v26 = *(char **)(a2 + 16);
  std::string::size_type v27 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v27 = __p.__r_.__value_.__l.__size_;
  }
  int64_t v28 = a3[3] - v26 + *(int *)(a2 + 4) + v27 - (v27 != 0);
  int v29 = a5 & 7;
  size_t v30 = (a5 >> 32) - v28;
  if (a5 >> 32 <= v28)
  {
    size_t v34 = 0;
    size_t v33 = 0;
    unsigned __int8 v31 = v25;
  }
  else
  {
    if (v29 == 4) {
      unsigned __int8 v31 = 48;
    }
    else {
      unsigned __int8 v31 = v25;
    }
    if (v29 == 4) {
      uint64_t v32 = 3;
    }
    else {
      uint64_t v32 = a5 & 7;
    }
    size_t v33 = 0;
    size_t v34 = (a5 >> 32) - v28;
    switch(v32)
    {
      case 1:
        break;
      case 2:
        size_t v33 = v30 >> 1;
        size_t v34 = v30 - (v30 >> 1);
        break;
      default:
        size_t v34 = 0;
        size_t v33 = v30;
        break;
    }
  }
  size_t v54 = v34;
  if (v29 == 4 && v13 != v26)
  {
    v56.__r_.__value_.__r.__words[0] = (std::string::size_type)a1;
    std::back_insert_iterator<std::__format::__output_buffer<char>>::operator=[abi:ne180100]((uint64_t **)&v56, v26);
  }
  int v35 = v25 & 0xFFFFFF00 | v31;
  unint64_t v36 = std::__formatter::__fill[abi:ne180100]<char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(a1, v33, v35);
  std::locale v37 = v36;
  if (v29 != 4)
  {
    int v38 = *(char **)(a2 + 16);
    if (v13 != v38)
    {
      v56.__r_.__value_.__r.__words[0] = (std::string::size_type)v36;
      std::back_insert_iterator<std::__format::__output_buffer<char>>::operator=[abi:ne180100]((uint64_t **)&v56, v38);
    }
  }
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    std::string::size_type v39 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if (*((unsigned char *)&__p.__r_.__value_.__s + 23))
    {
      uint64_t v40 = &__p.__r_.__value_.__s.__data_[1];
      uint64_t v41 = &__p;
      goto LABEL_52;
    }
LABEL_56:
    std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(v37, v13, __len);
    goto LABEL_57;
  }
  std::string::size_type v39 = __p.__r_.__value_.__l.__size_;
  if (!__p.__r_.__value_.__l.__size_) {
    goto LABEL_56;
  }
  uint64_t v41 = (std::string *)__p.__r_.__value_.__r.__words[0];
  uint64_t v40 = (char *)(__p.__r_.__value_.__r.__words[0] + 1);
LABEL_52:
  int v42 = (char *)v41 + v39;
  char v43 = ((uint64_t (*)(const std::locale::facet *))v11->__vftable[1].~facet_0)(v11);
  while (1)
  {
    unint64_t v44 = v42 - 1;
    std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(v37, v13, *(v42 - 1));
    if (v42 == v40) {
      break;
    }
    v13 += *(v42 - 1);
    uint64_t v45 = *v37;
    uint64_t v46 = v37[2];
    v37[2] = v46 + 1;
    *(unsigned char *)(v45 + v46) = v43;
    --v42;
    if (v37[2] == v37[1])
    {
      ((void (*)(void))v37[3])(*v37);
      v37[2] = 0;
      int v42 = v44;
    }
  }
LABEL_57:
  uint64_t v47 = a3[1];
  if (v47 != a3[3])
  {
    char v48 = ((uint64_t (*)(const std::locale::facet *))v11->__vftable[1].~facet)(v11);
    uint64_t v49 = *v37;
    uint64_t v50 = v37[2];
    v37[2] = v50 + 1;
    *(unsigned char *)(v49 + v50) = v48;
    if (v37[2] == v37[1])
    {
      ((void (*)(void))v37[3])(*v37);
      v37[2] = 0;
    }
    std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(v37, a3[1] + 1, a3[2] - (a3[1] + 1));
    std::__format::__output_buffer<char>::__fill[abi:ne180100](v37, *(int *)(a2 + 4), 48);
    uint64_t v47 = a3[3];
  }
  v51 = a3[2];
  if (v51 != v47) {
    std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(v37, v51, v47 - v51);
  }
  CFStringRef v52 = std::__formatter::__fill[abi:ne180100]<char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(v37, v54, v35);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v52;
}

void sub_25B6768CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__formatter::__write_using_trailing_zeros[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(char *a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5, uint64_t a6, char *a7, size_t a8)
{
  size_t v8 = (a4 >> 32) - (a6 + a8);
  size_t v13 = 0;
  switch(a4 & 7)
  {
    case 1:
      break;
    case 2:
      size_t v13 = v8 >> 1;
      v8 -= v8 >> 1;
      break;
    default:
      size_t v13 = (a4 >> 32) - (a6 + a8);
      size_t v8 = 0;
      break;
  }
  unint64_t v14 = HIDWORD(a5);
  uint64_t v15 = std::__formatter::__fill[abi:ne180100]<char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(a3, v13, SHIDWORD(a5));
  std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(v15, a1, a7 - a1);
  std::__format::__output_buffer<char>::__fill[abi:ne180100](v15, a8, 48);
  std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(v15, a7, a2 - (void)a7);
  return std::__formatter::__fill[abi:ne180100]<char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(v15, v8, v14);
}

unsigned char *std::__formatter::__format_buffer_general_lower_case[abi:ne180100]<float,float>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *(_DWORD *)(a1 + 4) = 0;
  *a4 = a3;
  uint64_t v6 = MEMORY[0x261165F50](a3, *(void *)(a1 + 16) + *(void *)(a1 + 8), 3, a2);
  a4[3] = v6;
  uint64_t result = (unsigned char *)(a3 + 1);
  if (a3 + 1 != v6)
  {
    size_t v8 = v6 - (void)result;
    if (v6 - (uint64_t)result < 4)
    {
LABEL_8:
      a4[2] = v6;
    }
    else
    {
      uint64_t v9 = 6;
      if (v8 < 6) {
        uint64_t v9 = v6 - (void)result;
      }
      uint64_t v10 = -v9;
      while (*(unsigned char *)(v6 + v10) != 101)
      {
        if (++v10 == -3) {
          goto LABEL_8;
        }
      }
      a4[2] = v6 + v10;
      if (v10)
      {
        if (*result == 46) {
          uint64_t v11 = (unsigned char *)(a3 + 1);
        }
        else {
          uint64_t v11 = (unsigned char *)v6;
        }
        goto LABEL_12;
      }
    }
    uint64_t result = memchr(result, 46, v8);
    if (result) {
      uint64_t v11 = result;
    }
    else {
      uint64_t v11 = (unsigned char *)v6;
    }
LABEL_12:
    a4[1] = v11;
    return result;
  }
  a4[1] = v6;
  a4[2] = v6;
  return result;
}

unsigned char *std::__formatter::__format_buffer_default[abi:ne180100]<float,float>@<X0>(std::__1 *this@<X1>, uint64_t a2@<X0>, char *a3@<X2>, void *a4@<X8>, float a5@<S0>)
{
  *a4 = this;
  uint64_t v7 = std::to_chars(this, (char *)(*(void *)(a2 + 16) + *(void *)(a2 + 8)), a3, a5);
  size_t v8 = (unsigned char *)v7;
  a4[3] = v7;
  unint64_t v9 = v7 - (void)this;
  uint64_t v10 = (unsigned char *)v7;
  if (v7 - (uint64_t)this >= 4)
  {
    if (v9 >= 6) {
      unint64_t v9 = 6;
    }
    uint64_t v11 = -(uint64_t)v9;
    while (*(unsigned char *)(v7 + v11) != 101)
    {
      if (++v11 == -3)
      {
        uint64_t v10 = (unsigned char *)v7;
        goto LABEL_9;
      }
    }
    uint64_t v10 = (unsigned char *)(v7 + v11);
  }
LABEL_9:
  a4[2] = v10;
  uint64_t result = memchr((char *)this + 1, 46, v10 - ((char *)this + 1));
  if (result) {
    size_t v13 = result;
  }
  else {
    size_t v13 = v10;
  }
  if (v13 == v10) {
    size_t v13 = v8;
  }
  a4[1] = v13;
  return result;
}

uint64_t std::__formatter::__format_buffer_hexadecimal_lower_case[abi:ne180100]<float,float>@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = a3;
  if (a2 == -1) {
    uint64_t result = std::to_chars();
  }
  else {
    uint64_t result = MEMORY[0x261165F50](a3, *(void *)(a1 + 16) + *(void *)(a1 + 8), 4);
  }
  a4[3] = result;
  int v8 = *(unsigned __int8 *)(a3 + 1);
  uint64_t v7 = a3 + 1;
  if (v8 == 46)
  {
    uint64_t v9 = result - 2;
    uint64_t v10 = memchr((void *)(result - 5), 112, 3uLL);
    uint64_t result = v7;
    if (v10) {
      uint64_t v7 = (uint64_t)v10;
    }
    else {
      uint64_t v7 = v9;
    }
  }
  a4[1] = result;
  a4[2] = v7;
  return result;
}

uint64_t std::__formatter::__format_buffer_hexadecimal_upper_case[abi:ne180100]<float,float>@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t result = std::__formatter::__format_buffer_hexadecimal_lower_case[abi:ne180100]<float,float>(a1, a2, a3, a4);
  uint64_t v6 = (unsigned char *)*a4;
  uint64_t v7 = (unsigned char *)a4[2];
  if ((unsigned char *)*a4 != v7)
  {
    do
    {
      int v8 = (char)*v6;
      if ((v8 - 97) < 6) {
        LOBYTE(v8) = v8 - 32;
      }
      *v6++ = v8;
    }
    while (v6 != v7);
    uint64_t v6 = (unsigned char *)a4[2];
  }
  unsigned char *v6 = 80;
  return result;
}

uint64_t std::__formatter::__format_buffer_scientific_lower_case[abi:ne180100]<float,float>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = a3;
  uint64_t result = MEMORY[0x261165F50](a3, *(void *)(a1 + 16) + *(void *)(a1 + 8), 1, a2);
  a4[3] = result;
  uint64_t v7 = a3 + 1;
  if (*(unsigned char *)(a3 + 1) == 46)
  {
    a4[1] = v7;
    uint64_t v8 = result - a3 - 2;
    uint64_t v7 = result;
    if (v8 >= 4)
    {
      uint64_t v9 = 6;
      if ((unint64_t)v8 < 6) {
        uint64_t v9 = result - a3 - 2;
      }
      uint64_t v10 = -v9;
      while (*(unsigned char *)(result + v10) != 101)
      {
        if (++v10 == -3)
        {
          uint64_t v7 = result;
          goto LABEL_11;
        }
      }
      uint64_t v7 = result + v10;
    }
  }
  else
  {
    a4[1] = result;
  }
LABEL_11:
  a4[2] = v7;
  return result;
}

void *std::__formatter::__format_floating_point[abi:ne180100]<double,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(uint64_t **a1, uint64_t a2, unint64_t a3, double a4)
{
  v47[128] = *MEMORY[0x263EF8340];
  uint64_t v7 = *(void *)&a4 >> 63;
  if ((*(void *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
  {
    unint64_t v8 = (unint64_t)a2 >> 8;
    if (a4 >= 0.0) {
      double v9 = a4;
    }
    else {
      double v9 = -a4;
    }
    if (a3 == -1) {
      int v10 = 1074;
    }
    else {
      int v10 = a3;
    }
    int v43 = v10;
    int v44 = 0;
    if (v10 < 1075)
    {
      size_t v11 = v10 + 316;
      unint64_t v45 = v11;
      if ((v10 + 316) < 0x401)
      {
        unint64_t v12 = v47;
        goto LABEL_13;
      }
    }
    else
    {
      int v43 = 1074;
      int v44 = v10 - 1074;
      size_t v11 = 1390;
      unint64_t v45 = 1390;
    }
    unint64_t v12 = operator new(v11);
LABEL_13:
    std::string __p = v12;
    std::__formatter::__format_buffer[abi:ne180100]<double,double>((unsigned int *)&v43, v7, (a3 & 0x80000000) == 0, (a2 >> 3) & 3, v8, (std::__1 **)&v39, v9);
    if ((a2 & 0x20) != 0)
    {
      size_t v13 = v40;
      if (v40 == *(char **)v42)
      {
        *(void *)int v42 = v40 + 1;
        *uint64_t v40 = 46;
        unint64_t v14 = v41;
        uint64_t v15 = (char *)(*(void *)v42 - 1);
        if (v41 != (char *)(*(void *)v42 - 1))
        {
          if (v41 + 1 == v15)
          {
            char v17 = *v41;
            *uint64_t v41 = *v15;
            *uint64_t v15 = v17;
          }
          else
          {
            char v16 = *(unsigned char *)(*(void *)v42 - 1);
            memmove(v41 + 1, v41, *(void *)v42 - 1 - (void)v41);
            *unint64_t v14 = v16;
          }
        }
        size_t v13 = v41;
        uint64_t v40 = v41++;
      }
      if ((BYTE1(a2) - 17) <= 1u)
      {
        if (a3 <= 1) {
          int v18 = 1;
        }
        else {
          int v18 = a3;
        }
        if ((a3 & 0x80000000) != 0) {
          int v18 = 6;
        }
        if (v41 == *(char **)v42) {
          int v19 = v39 - v13;
        }
        else {
          int v19 = -1;
        }
        int v20 = v19 + v18;
        uint64_t v21 = &v41[~(unint64_t)v13];
        if ((uint64_t)v21 < v20) {
          v44 += v20 - v21;
        }
      }
    }
    if ((a2 & 0x40) != 0)
    {
      int v29 = *a1;
      std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>::locale[abi:ne180100]((uint64_t)a1, &v38);
      size_t v30 = std::__formatter::__format_locale_specific_form[abi:ne180100]<std::back_insert_iterator<std::__format::__output_buffer<char>>,double,char>(v29, (uint64_t)&v43, &v39, &v38, a2, a3);
      std::locale::~locale(&v38);
    }
    else
    {
      uint64_t v22 = *(void *)v42;
      int v23 = (char *)__p;
      uint64_t v24 = *(void *)v42 - (void)__p;
      size_t v25 = v44;
      if (*(void *)v42 - (void)__p + v44 >= a2 >> 32)
      {
        if (!v44 || (unsigned __int8 v31 = v41, v41 == *(char **)v42))
        {
          size_t v30 = *a1;
          std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(*a1, (char *)__p, *(void *)v42 - (void)__p);
          std::__format::__output_buffer<char>::__fill[abi:ne180100](v30, v25, 48);
        }
        else
        {
          size_t v30 = *a1;
          std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(*a1, (char *)__p, v41 - (unsigned char *)__p);
          std::__format::__output_buffer<char>::__fill[abi:ne180100](v30, v25, 48);
          std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(v30, v31, v22 - (void)v31);
        }
      }
      else
      {
        unsigned __int8 v26 = *a1;
        if ((a2 & 7) == 4)
        {
          if (__p != v39)
          {
            std::locale v37 = v26;
            std::back_insert_iterator<std::__format::__output_buffer<char>>::operator=[abi:ne180100](&v37, (char *)__p);
            ++v23;
          }
          unsigned __int8 v27 = a2 & 0xF8 | 3;
          unsigned __int8 v28 = 48;
        }
        else
        {
          unsigned __int8 v28 = BYTE4(a3);
          unsigned __int8 v27 = a2;
        }
        unint64_t v32 = a2 & 0xFFFFFFFFFFFFFF00 | v27;
        unint64_t v33 = a3 & 0xFFFFFF00FFFFFFFFLL | ((unint64_t)v28 << 32);
        if (v25) {
          size_t v34 = std::__formatter::__write_using_trailing_zeros[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(v23, *(uint64_t *)v42, v26, v32, v33, v24, v41, v25);
        }
        else {
          size_t v34 = std::__formatter::__write[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(v23, *(void *)v42 - (void)v23, v26, v32, v33, v24);
        }
        size_t v30 = v34;
      }
    }
    if (v45 >= 0x401) {
      operator delete(__p);
    }
    return v30;
  }
  unint64_t v36 = *a1;
  return std::__formatter::__format_floating_point_non_finite[abi:ne180100]<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>(v36, a2, a3, a4 < 0.0, 0);
}

void sub_25B677134(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t a16, void *__p)
{
  if (a16 >= 0x401) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__formatter::__format_buffer[abi:ne180100]<double,double>@<X0>(unsigned int *a1@<X0>, char a2@<W1>, int a3@<W2>, int a4@<W3>, int a5@<W4>, std::__1 **a6@<X8>, double a7@<D0>)
{
  double v9 = (std::__1 *)*((void *)a1 + 2);
  if (a2)
  {
    char v10 = 45;
  }
  else if (a4 == 2)
  {
    char v10 = 43;
  }
  else
  {
    if (a4 != 3) {
      goto LABEL_8;
    }
    char v10 = 32;
  }
  *(unsigned char *)double v9 = v10;
  double v9 = (std::__1 *)((char *)v9 + 1);
LABEL_8:
  switch(a5)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
      __break(1u);
      JUMPOUT(0x25B677320);
    case 11:
      if (a3) {
        int v14 = *a1;
      }
      else {
        int v14 = -1;
      }
      return std::__formatter::__format_buffer_hexadecimal_lower_case[abi:ne180100]<double,double>((uint64_t)a1, v14, (uint64_t)v9, a6);
    case 12:
      if (a3) {
        int v17 = *a1;
      }
      else {
        int v17 = -1;
      }
      return std::__formatter::__format_buffer_hexadecimal_upper_case[abi:ne180100]<double,double>((uint64_t)a1, v17, (uint64_t)v9, a6);
    case 13:
      uint64_t v18 = *a1;
      return std::__formatter::__format_buffer_scientific_lower_case[abi:ne180100]<double,double>((uint64_t)a1, v18, (uint64_t)v9, a6);
    case 14:
      uint64_t result = std::__formatter::__format_buffer_scientific_lower_case[abi:ne180100]<double,double>((uint64_t)a1, *a1, (uint64_t)v9, a6);
      char v16 = a6[2];
      goto LABEL_25;
    case 15:
    case 16:
      uint64_t v11 = *a1;
      *a6 = v9;
      uint64_t result = MEMORY[0x261165EF0](v9, *((void *)a1 + 2) + *((void *)a1 + 1), 2, v11);
      a6[2] = (std::__1 *)result;
      a6[3] = (std::__1 *)result;
      if (v11) {
        int v13 = v11 + 1;
      }
      else {
        int v13 = 0;
      }
      a6[1] = (std::__1 *)(result - v13);
      return result;
    case 17:
      goto LABEL_20;
    case 18:
      uint64_t result = (uint64_t)std::__formatter::__format_buffer_general_lower_case[abi:ne180100]<double,double>((uint64_t)a1, *a1, (uint64_t)v9, a6);
      char v16 = a6[2];
      if (v16 != a6[3]) {
LABEL_25:
      }
        *(unsigned char *)char v16 = 69;
      break;
    default:
      if (a3)
      {
LABEL_20:
        uint64_t v15 = *a1;
        uint64_t result = (uint64_t)std::__formatter::__format_buffer_general_lower_case[abi:ne180100]<double,double>((uint64_t)a1, v15, (uint64_t)v9, a6);
      }
      else
      {
        uint64_t result = (uint64_t)std::__formatter::__format_buffer_default[abi:ne180100]<double,double>(v9, (uint64_t)a1, (char *)v9, a6, a7);
      }
      break;
  }
  return result;
}

void *std::__formatter::__format_locale_specific_form[abi:ne180100]<std::back_insert_iterator<std::__format::__output_buffer<char>>,double,char>(void *a1, uint64_t a2, char **a3, std::locale *this, uint64_t a5, unint64_t a6)
{
  uint64_t v11 = std::locale::use_facet(this, MEMORY[0x263F8C150]);
  ((void (*)(std::string *__return_ptr))v11->__vftable[1].__on_zero_shared)(&__p);
  unint64_t v12 = a3[2];
  int v13 = *a3;
  if (v12 >= a3[1]) {
    unint64_t v12 = a3[1];
  }
  int64_t __len = v12 - v13;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
    if (!__p.__r_.__value_.__l.__size_) {
      goto LABEL_29;
    }
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if (__len <= *__p.__r_.__value_.__l.__data_)
    {
      *__p.__r_.__value_.__l.__data_ = 0;
      __p.__r_.__value_.__l.__size_ = 0;
      goto LABEL_29;
    }
    std::string::size_type v16 = __p.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((unsigned char *)&__p.__r_.__value_.__s + 23)) {
      goto LABEL_29;
    }
    if (__len <= __p.__r_.__value_.__s.__data_[0])
    {
      __p.__r_.__value_.__s.__data_[0] = 0;
      *((unsigned char *)&__p.__r_.__value_.__s + 23) = 0;
      goto LABEL_29;
    }
    p_p = &__p;
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
    std::string::size_type v16 = __p.__r_.__value_.__r.__words[0];
  }
  memset(&v56, 0, sizeof(v56));
  int v17 = (char *)(v16 + size);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v17 = (char *)&__p + HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  std::string::value_type v18 = p_p->__r_.__value_.__s.__data_[0];
  uint64_t v19 = __len - p_p->__r_.__value_.__s.__data_[0];
  if (v19 >= 1)
  {
    int v20 = v17 - 1;
    do
    {
      std::string::push_back(&v56, v18);
      if (p_p == (std::string *)v20)
      {
        std::string::value_type v18 = *v20;
        p_p = (std::string *)v20;
      }
      else
      {
        uint64_t v21 = &p_p->__r_.__value_.__s.__data_[1];
        uint64_t v22 = &p_p->__r_.__value_.__s.__data_[1];
        do
        {
          int v23 = *v22++;
          std::string::value_type v18 = v23;
          if (v23) {
            BOOL v24 = 1;
          }
          else {
            BOOL v24 = v21 == v20;
          }
          uint64_t v21 = v22;
        }
        while (!v24);
        p_p = (std::string *)(v22 - 1);
      }
      v19 -= v18;
    }
    while (v19 > 0);
  }
  std::string::push_back(&v56, v18 + v19);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::string __p = v56;
LABEL_29:
  unint64_t v25 = HIDWORD(a6);
  unsigned __int8 v26 = *(char **)(a2 + 16);
  std::string::size_type v27 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v27 = __p.__r_.__value_.__l.__size_;
  }
  int64_t v28 = a3[3] - v26 + *(int *)(a2 + 4) + v27 - (v27 != 0);
  int v29 = a5 & 7;
  size_t v30 = (a5 >> 32) - v28;
  if (a5 >> 32 <= v28)
  {
    size_t v34 = 0;
    size_t v33 = 0;
    unsigned __int8 v31 = v25;
  }
  else
  {
    if (v29 == 4) {
      unsigned __int8 v31 = 48;
    }
    else {
      unsigned __int8 v31 = v25;
    }
    if (v29 == 4) {
      uint64_t v32 = 3;
    }
    else {
      uint64_t v32 = a5 & 7;
    }
    size_t v33 = 0;
    size_t v34 = (a5 >> 32) - v28;
    switch(v32)
    {
      case 1:
        break;
      case 2:
        size_t v33 = v30 >> 1;
        size_t v34 = v30 - (v30 >> 1);
        break;
      default:
        size_t v34 = 0;
        size_t v33 = v30;
        break;
    }
  }
  size_t v54 = v34;
  if (v29 == 4 && v13 != v26)
  {
    v56.__r_.__value_.__r.__words[0] = (std::string::size_type)a1;
    std::back_insert_iterator<std::__format::__output_buffer<char>>::operator=[abi:ne180100]((uint64_t **)&v56, v26);
  }
  int v35 = v25 & 0xFFFFFF00 | v31;
  unint64_t v36 = std::__formatter::__fill[abi:ne180100]<char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(a1, v33, v35);
  std::locale v37 = v36;
  if (v29 != 4)
  {
    std::locale v38 = *(char **)(a2 + 16);
    if (v13 != v38)
    {
      v56.__r_.__value_.__r.__words[0] = (std::string::size_type)v36;
      std::back_insert_iterator<std::__format::__output_buffer<char>>::operator=[abi:ne180100]((uint64_t **)&v56, v38);
    }
  }
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    std::string::size_type v39 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if (*((unsigned char *)&__p.__r_.__value_.__s + 23))
    {
      uint64_t v40 = &__p.__r_.__value_.__s.__data_[1];
      uint64_t v41 = &__p;
      goto LABEL_52;
    }
LABEL_56:
    std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(v37, v13, __len);
    goto LABEL_57;
  }
  std::string::size_type v39 = __p.__r_.__value_.__l.__size_;
  if (!__p.__r_.__value_.__l.__size_) {
    goto LABEL_56;
  }
  uint64_t v41 = (std::string *)__p.__r_.__value_.__r.__words[0];
  uint64_t v40 = (char *)(__p.__r_.__value_.__r.__words[0] + 1);
LABEL_52:
  int v42 = (char *)v41 + v39;
  char v43 = ((uint64_t (*)(const std::locale::facet *))v11->__vftable[1].~facet_0)(v11);
  while (1)
  {
    int v44 = v42 - 1;
    std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(v37, v13, *(v42 - 1));
    if (v42 == v40) {
      break;
    }
    v13 += *(v42 - 1);
    uint64_t v45 = *v37;
    uint64_t v46 = v37[2];
    v37[2] = v46 + 1;
    *(unsigned char *)(v45 + v46) = v43;
    --v42;
    if (v37[2] == v37[1])
    {
      ((void (*)(void))v37[3])(*v37);
      v37[2] = 0;
      int v42 = v44;
    }
  }
LABEL_57:
  uint64_t v47 = a3[1];
  if (v47 != a3[3])
  {
    char v48 = ((uint64_t (*)(const std::locale::facet *))v11->__vftable[1].~facet)(v11);
    uint64_t v49 = *v37;
    uint64_t v50 = v37[2];
    v37[2] = v50 + 1;
    *(unsigned char *)(v49 + v50) = v48;
    if (v37[2] == v37[1])
    {
      ((void (*)(void))v37[3])(*v37);
      v37[2] = 0;
    }
    std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(v37, a3[1] + 1, a3[2] - (a3[1] + 1));
    std::__format::__output_buffer<char>::__fill[abi:ne180100](v37, *(int *)(a2 + 4), 48);
    uint64_t v47 = a3[3];
  }
  v51 = a3[2];
  if (v51 != v47) {
    std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(v37, v51, v47 - v51);
  }
  CFStringRef v52 = std::__formatter::__fill[abi:ne180100]<char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(v37, v54, v35);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v52;
}

void sub_25B6777E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

unsigned char *std::__formatter::__format_buffer_general_lower_case[abi:ne180100]<double,double>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *(_DWORD *)(a1 + 4) = 0;
  *a4 = a3;
  uint64_t v6 = MEMORY[0x261165EF0](a3, *(void *)(a1 + 16) + *(void *)(a1 + 8), 3, a2);
  a4[3] = v6;
  uint64_t result = (unsigned char *)(a3 + 1);
  if (a3 + 1 != v6)
  {
    size_t v8 = v6 - (void)result;
    if (v6 - (uint64_t)result < 4)
    {
LABEL_8:
      a4[2] = v6;
    }
    else
    {
      uint64_t v9 = 6;
      if (v8 < 6) {
        uint64_t v9 = v6 - (void)result;
      }
      uint64_t v10 = -v9;
      while (*(unsigned char *)(v6 + v10) != 101)
      {
        if (++v10 == -3) {
          goto LABEL_8;
        }
      }
      a4[2] = v6 + v10;
      if (v10)
      {
        if (*result == 46) {
          uint64_t v11 = (unsigned char *)(a3 + 1);
        }
        else {
          uint64_t v11 = (unsigned char *)v6;
        }
        goto LABEL_12;
      }
    }
    uint64_t result = memchr(result, 46, v8);
    if (result) {
      uint64_t v11 = result;
    }
    else {
      uint64_t v11 = (unsigned char *)v6;
    }
LABEL_12:
    a4[1] = v11;
    return result;
  }
  a4[1] = v6;
  a4[2] = v6;
  return result;
}

unsigned char *std::__formatter::__format_buffer_default[abi:ne180100]<double,double>@<X0>(std::__1 *this@<X1>, uint64_t a2@<X0>, char *a3@<X2>, void *a4@<X8>, double a5@<D0>)
{
  *a4 = this;
  uint64_t v7 = std::to_chars(this, (char *)(*(void *)(a2 + 16) + *(void *)(a2 + 8)), a3, a5);
  size_t v8 = (unsigned char *)v7;
  a4[3] = v7;
  unint64_t v9 = v7 - (void)this;
  uint64_t v10 = (unsigned char *)v7;
  if (v7 - (uint64_t)this >= 4)
  {
    if (v9 >= 6) {
      unint64_t v9 = 6;
    }
    uint64_t v11 = -(uint64_t)v9;
    while (*(unsigned char *)(v7 + v11) != 101)
    {
      if (++v11 == -3)
      {
        uint64_t v10 = (unsigned char *)v7;
        goto LABEL_9;
      }
    }
    uint64_t v10 = (unsigned char *)(v7 + v11);
  }
LABEL_9:
  a4[2] = v10;
  uint64_t result = memchr((char *)this + 1, 46, v10 - ((char *)this + 1));
  if (result) {
    int v13 = result;
  }
  else {
    int v13 = v10;
  }
  if (v13 == v10) {
    int v13 = v8;
  }
  a4[1] = v13;
  return result;
}

uint64_t std::__formatter::__format_buffer_hexadecimal_lower_case[abi:ne180100]<double,double>@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = a3;
  if (a2 == -1) {
    uint64_t result = std::to_chars();
  }
  else {
    uint64_t result = MEMORY[0x261165EF0](a3, *(void *)(a1 + 16) + *(void *)(a1 + 8), 4);
  }
  a4[3] = result;
  int v8 = *(unsigned __int8 *)(a3 + 1);
  uint64_t v7 = a3 + 1;
  if (v8 == 46)
  {
    uint64_t v9 = result - 2;
    uint64_t v10 = memchr((void *)(result - 6), 112, 4uLL);
    uint64_t result = v7;
    if (v10) {
      uint64_t v7 = (uint64_t)v10;
    }
    else {
      uint64_t v7 = v9;
    }
  }
  a4[1] = result;
  a4[2] = v7;
  return result;
}

uint64_t std::__formatter::__format_buffer_hexadecimal_upper_case[abi:ne180100]<double,double>@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t result = std::__formatter::__format_buffer_hexadecimal_lower_case[abi:ne180100]<double,double>(a1, a2, a3, a4);
  uint64_t v6 = (unsigned char *)*a4;
  uint64_t v7 = (unsigned char *)a4[2];
  if ((unsigned char *)*a4 != v7)
  {
    do
    {
      int v8 = (char)*v6;
      if ((v8 - 97) < 6) {
        LOBYTE(v8) = v8 - 32;
      }
      *v6++ = v8;
    }
    while (v6 != v7);
    uint64_t v6 = (unsigned char *)a4[2];
  }
  unsigned char *v6 = 80;
  return result;
}

uint64_t std::__formatter::__format_buffer_scientific_lower_case[abi:ne180100]<double,double>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = a3;
  uint64_t result = MEMORY[0x261165EF0](a3, *(void *)(a1 + 16) + *(void *)(a1 + 8), 1, a2);
  a4[3] = result;
  uint64_t v7 = a3 + 1;
  if (*(unsigned char *)(a3 + 1) == 46)
  {
    a4[1] = v7;
    uint64_t v8 = result - a3 - 2;
    uint64_t v7 = result;
    if (v8 >= 4)
    {
      uint64_t v9 = 6;
      if ((unint64_t)v8 < 6) {
        uint64_t v9 = result - a3 - 2;
      }
      uint64_t v10 = -v9;
      while (*(unsigned char *)(result + v10) != 101)
      {
        if (++v10 == -3)
        {
          uint64_t v7 = result;
          goto LABEL_11;
        }
      }
      uint64_t v7 = result + v10;
    }
  }
  else
  {
    a4[1] = result;
  }
LABEL_11:
  a4[2] = v7;
  return result;
}

void *std::__formatter::__format_floating_point[abi:ne180100]<long double,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(uint64_t **a1, uint64_t a2, unint64_t a3, double a4)
{
  v47[128] = *MEMORY[0x263EF8340];
  uint64_t v7 = *(void *)&a4 >> 63;
  if ((*(void *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
  {
    unint64_t v8 = (unint64_t)a2 >> 8;
    if (a4 >= 0.0) {
      double v9 = a4;
    }
    else {
      double v9 = -a4;
    }
    if (a3 == -1) {
      int v10 = 1074;
    }
    else {
      int v10 = a3;
    }
    int v43 = v10;
    int v44 = 0;
    if (v10 < 1075)
    {
      size_t v11 = v10 + 316;
      unint64_t v45 = v11;
      if ((v10 + 316) < 0x401)
      {
        unint64_t v12 = v47;
        goto LABEL_13;
      }
    }
    else
    {
      int v43 = 1074;
      int v44 = v10 - 1074;
      size_t v11 = 1390;
      unint64_t v45 = 1390;
    }
    unint64_t v12 = operator new(v11);
LABEL_13:
    std::string __p = v12;
    std::__formatter::__format_buffer[abi:ne180100]<double,long double>((unsigned int *)&v43, v7, (a3 & 0x80000000) == 0, (a2 >> 3) & 3, v8, (std::__1 **)&v39, v9);
    if ((a2 & 0x20) != 0)
    {
      int v13 = v40;
      if (v40 == *(char **)v42)
      {
        *(void *)int v42 = v40 + 1;
        *uint64_t v40 = 46;
        int v14 = v41;
        uint64_t v15 = (char *)(*(void *)v42 - 1);
        if (v41 != (char *)(*(void *)v42 - 1))
        {
          if (v41 + 1 == v15)
          {
            char v17 = *v41;
            *uint64_t v41 = *v15;
            *uint64_t v15 = v17;
          }
          else
          {
            char v16 = *(unsigned char *)(*(void *)v42 - 1);
            memmove(v41 + 1, v41, *(void *)v42 - 1 - (void)v41);
            *int v14 = v16;
          }
        }
        int v13 = v41;
        uint64_t v40 = v41++;
      }
      if ((BYTE1(a2) - 17) <= 1u)
      {
        if (a3 <= 1) {
          int v18 = 1;
        }
        else {
          int v18 = a3;
        }
        if ((a3 & 0x80000000) != 0) {
          int v18 = 6;
        }
        if (v41 == *(char **)v42) {
          int v19 = v39 - v13;
        }
        else {
          int v19 = -1;
        }
        int v20 = v19 + v18;
        uint64_t v21 = &v41[~(unint64_t)v13];
        if ((uint64_t)v21 < v20) {
          v44 += v20 - v21;
        }
      }
    }
    if ((a2 & 0x40) != 0)
    {
      int v29 = *a1;
      std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>::locale[abi:ne180100]((uint64_t)a1, &v38);
      size_t v30 = std::__formatter::__format_locale_specific_form[abi:ne180100]<std::back_insert_iterator<std::__format::__output_buffer<char>>,double,char>(v29, (uint64_t)&v43, &v39, &v38, a2, a3);
      std::locale::~locale(&v38);
    }
    else
    {
      uint64_t v22 = *(void *)v42;
      int v23 = (char *)__p;
      uint64_t v24 = *(void *)v42 - (void)__p;
      size_t v25 = v44;
      if (*(void *)v42 - (void)__p + v44 >= a2 >> 32)
      {
        if (!v44 || (unsigned __int8 v31 = v41, v41 == *(char **)v42))
        {
          size_t v30 = *a1;
          std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(*a1, (char *)__p, *(void *)v42 - (void)__p);
          std::__format::__output_buffer<char>::__fill[abi:ne180100](v30, v25, 48);
        }
        else
        {
          size_t v30 = *a1;
          std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(*a1, (char *)__p, v41 - (unsigned char *)__p);
          std::__format::__output_buffer<char>::__fill[abi:ne180100](v30, v25, 48);
          std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(v30, v31, v22 - (void)v31);
        }
      }
      else
      {
        unsigned __int8 v26 = *a1;
        if ((a2 & 7) == 4)
        {
          if (__p != v39)
          {
            std::locale v37 = v26;
            std::back_insert_iterator<std::__format::__output_buffer<char>>::operator=[abi:ne180100](&v37, (char *)__p);
            ++v23;
          }
          unsigned __int8 v27 = a2 & 0xF8 | 3;
          unsigned __int8 v28 = 48;
        }
        else
        {
          unsigned __int8 v28 = BYTE4(a3);
          unsigned __int8 v27 = a2;
        }
        unint64_t v32 = a2 & 0xFFFFFFFFFFFFFF00 | v27;
        unint64_t v33 = a3 & 0xFFFFFF00FFFFFFFFLL | ((unint64_t)v28 << 32);
        if (v25) {
          size_t v34 = std::__formatter::__write_using_trailing_zeros[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(v23, *(uint64_t *)v42, v26, v32, v33, v24, v41, v25);
        }
        else {
          size_t v34 = std::__formatter::__write[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(v23, *(void *)v42 - (void)v23, v26, v32, v33, v24);
        }
        size_t v30 = v34;
      }
    }
    if (v45 >= 0x401) {
      operator delete(__p);
    }
    return v30;
  }
  unint64_t v36 = *a1;
  return std::__formatter::__format_floating_point_non_finite[abi:ne180100]<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>(v36, a2, a3, a4 < 0.0, 0);
}

void sub_25B677F50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t a16, void *__p)
{
  if (a16 >= 0x401) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__formatter::__format_buffer[abi:ne180100]<double,long double>@<X0>(unsigned int *a1@<X0>, char a2@<W1>, int a3@<W2>, int a4@<W3>, int a5@<W4>, std::__1 **a6@<X8>, double a7@<D0>)
{
  double v9 = (std::__1 *)*((void *)a1 + 2);
  if (a2)
  {
    char v10 = 45;
  }
  else if (a4 == 2)
  {
    char v10 = 43;
  }
  else
  {
    if (a4 != 3) {
      goto LABEL_8;
    }
    char v10 = 32;
  }
  *(unsigned char *)double v9 = v10;
  double v9 = (std::__1 *)((char *)v9 + 1);
LABEL_8:
  switch(a5)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
      __break(1u);
      JUMPOUT(0x25B67813CLL);
    case 11:
      if (a3) {
        int v14 = *a1;
      }
      else {
        int v14 = -1;
      }
      return std::__formatter::__format_buffer_hexadecimal_lower_case[abi:ne180100]<double,long double>((uint64_t)a1, v14, (uint64_t)v9, a6);
    case 12:
      if (a3) {
        int v17 = *a1;
      }
      else {
        int v17 = -1;
      }
      return std::__formatter::__format_buffer_hexadecimal_upper_case[abi:ne180100]<double,long double>((uint64_t)a1, v17, (uint64_t)v9, a6);
    case 13:
      uint64_t v18 = *a1;
      return std::__formatter::__format_buffer_scientific_lower_case[abi:ne180100]<double,long double>((uint64_t)a1, v18, (uint64_t)v9, a6);
    case 14:
      uint64_t result = std::__formatter::__format_buffer_scientific_lower_case[abi:ne180100]<double,long double>((uint64_t)a1, *a1, (uint64_t)v9, a6);
      char v16 = a6[2];
      goto LABEL_25;
    case 15:
    case 16:
      uint64_t v11 = *a1;
      *a6 = v9;
      uint64_t result = MEMORY[0x261165F20](v9, *((void *)a1 + 2) + *((void *)a1 + 1), 2, v11);
      a6[2] = (std::__1 *)result;
      a6[3] = (std::__1 *)result;
      if (v11) {
        int v13 = v11 + 1;
      }
      else {
        int v13 = 0;
      }
      a6[1] = (std::__1 *)(result - v13);
      return result;
    case 17:
      goto LABEL_20;
    case 18:
      uint64_t result = (uint64_t)std::__formatter::__format_buffer_general_lower_case[abi:ne180100]<double,long double>((uint64_t)a1, *a1, (uint64_t)v9, a6);
      char v16 = a6[2];
      if (v16 != a6[3]) {
LABEL_25:
      }
        *(unsigned char *)char v16 = 69;
      break;
    default:
      if (a3)
      {
LABEL_20:
        uint64_t v15 = *a1;
        uint64_t result = (uint64_t)std::__formatter::__format_buffer_general_lower_case[abi:ne180100]<double,long double>((uint64_t)a1, v15, (uint64_t)v9, a6);
      }
      else
      {
        uint64_t result = (uint64_t)std::__formatter::__format_buffer_default[abi:ne180100]<double,long double>(v9, (uint64_t)a1, (char *)v9, a6, a7);
      }
      break;
  }
  return result;
}

unsigned char *std::__formatter::__format_buffer_general_lower_case[abi:ne180100]<double,long double>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *(_DWORD *)(a1 + 4) = 0;
  *a4 = a3;
  uint64_t v6 = MEMORY[0x261165F20](a3, *(void *)(a1 + 16) + *(void *)(a1 + 8), 3, a2);
  a4[3] = v6;
  uint64_t result = (unsigned char *)(a3 + 1);
  if (a3 + 1 != v6)
  {
    size_t v8 = v6 - (void)result;
    if (v6 - (uint64_t)result < 4)
    {
LABEL_8:
      a4[2] = v6;
    }
    else
    {
      uint64_t v9 = 6;
      if (v8 < 6) {
        uint64_t v9 = v6 - (void)result;
      }
      uint64_t v10 = -v9;
      while (*(unsigned char *)(v6 + v10) != 101)
      {
        if (++v10 == -3) {
          goto LABEL_8;
        }
      }
      a4[2] = v6 + v10;
      if (v10)
      {
        if (*result == 46) {
          uint64_t v11 = (unsigned char *)(a3 + 1);
        }
        else {
          uint64_t v11 = (unsigned char *)v6;
        }
        goto LABEL_12;
      }
    }
    uint64_t result = memchr(result, 46, v8);
    if (result) {
      uint64_t v11 = result;
    }
    else {
      uint64_t v11 = (unsigned char *)v6;
    }
LABEL_12:
    a4[1] = v11;
    return result;
  }
  a4[1] = v6;
  a4[2] = v6;
  return result;
}

unsigned char *std::__formatter::__format_buffer_default[abi:ne180100]<double,long double>@<X0>(std::__1 *this@<X1>, uint64_t a2@<X0>, char *a3@<X2>, void *a4@<X8>, double a5@<D0>)
{
  *a4 = this;
  uint64_t v7 = std::to_chars(this, (char *)(*(void *)(a2 + 16) + *(void *)(a2 + 8)), a3, a5);
  size_t v8 = (unsigned char *)v7;
  a4[3] = v7;
  unint64_t v9 = v7 - (void)this;
  uint64_t v10 = (unsigned char *)v7;
  if (v7 - (uint64_t)this >= 4)
  {
    if (v9 >= 6) {
      unint64_t v9 = 6;
    }
    uint64_t v11 = -(uint64_t)v9;
    while (*(unsigned char *)(v7 + v11) != 101)
    {
      if (++v11 == -3)
      {
        uint64_t v10 = (unsigned char *)v7;
        goto LABEL_9;
      }
    }
    uint64_t v10 = (unsigned char *)(v7 + v11);
  }
LABEL_9:
  a4[2] = v10;
  uint64_t result = memchr((char *)this + 1, 46, v10 - ((char *)this + 1));
  if (result) {
    int v13 = result;
  }
  else {
    int v13 = v10;
  }
  if (v13 == v10) {
    int v13 = v8;
  }
  a4[1] = v13;
  return result;
}

uint64_t std::__formatter::__format_buffer_hexadecimal_lower_case[abi:ne180100]<double,long double>@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = a3;
  if (a2 == -1) {
    uint64_t result = std::to_chars();
  }
  else {
    uint64_t result = MEMORY[0x261165F20](a3, *(void *)(a1 + 16) + *(void *)(a1 + 8), 4);
  }
  a4[3] = result;
  int v8 = *(unsigned __int8 *)(a3 + 1);
  uint64_t v7 = a3 + 1;
  if (v8 == 46)
  {
    uint64_t v9 = result - 2;
    uint64_t v10 = memchr((void *)(result - 6), 112, 4uLL);
    uint64_t result = v7;
    if (v10) {
      uint64_t v7 = (uint64_t)v10;
    }
    else {
      uint64_t v7 = v9;
    }
  }
  a4[1] = result;
  a4[2] = v7;
  return result;
}

uint64_t std::__formatter::__format_buffer_hexadecimal_upper_case[abi:ne180100]<double,long double>@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t result = std::__formatter::__format_buffer_hexadecimal_lower_case[abi:ne180100]<double,long double>(a1, a2, a3, a4);
  uint64_t v6 = (unsigned char *)*a4;
  uint64_t v7 = (unsigned char *)a4[2];
  if ((unsigned char *)*a4 != v7)
  {
    do
    {
      int v8 = (char)*v6;
      if ((v8 - 97) < 6) {
        LOBYTE(v8) = v8 - 32;
      }
      *v6++ = v8;
    }
    while (v6 != v7);
    uint64_t v6 = (unsigned char *)a4[2];
  }
  unsigned char *v6 = 80;
  return result;
}

uint64_t std::__formatter::__format_buffer_scientific_lower_case[abi:ne180100]<double,long double>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = a3;
  uint64_t result = MEMORY[0x261165F20](a3, *(void *)(a1 + 16) + *(void *)(a1 + 8), 1, a2);
  a4[3] = result;
  uint64_t v7 = a3 + 1;
  if (*(unsigned char *)(a3 + 1) == 46)
  {
    a4[1] = v7;
    uint64_t v8 = result - a3 - 2;
    uint64_t v7 = result;
    if (v8 >= 4)
    {
      uint64_t v9 = 6;
      if ((unint64_t)v8 < 6) {
        uint64_t v9 = result - a3 - 2;
      }
      uint64_t v10 = -v9;
      while (*(unsigned char *)(result + v10) != 101)
      {
        if (++v10 == -3)
        {
          uint64_t v7 = result;
          goto LABEL_11;
        }
      }
      uint64_t v7 = result + v10;
    }
  }
  else
  {
    a4[1] = result;
  }
LABEL_11:
  a4[2] = v7;
  return result;
}

unsigned __int8 *std::__formatter_string<char>::parse[abi:ne180100]<std::basic_format_parse_context<char>>(unsigned char *a1, unsigned __int8 **a2)
{
  uint64_t result = std::__format_spec::__parser<char>::__parse[abi:ne180100]<std::basic_format_parse_context<char>>(a1, a2, 0x128u);
  unsigned int v4 = a1[1];
  if (v4 >= 2 && v4 != 19) {
    std::__throw_format_error[abi:ne180100]("The type option contains an invalid value for a string formatting argument");
  }
  return result;
}

uint64_t *std::formatter<char const*,char>::format[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char *a1, char *a2, uint64_t **a3)
{
  unint64_t v5 = std::__format_spec::__parser<char>::__get_parsed_std_specifications[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a1, a3);
  if (SHIDWORD(v5) > 0 || (v6 & 0x80000000) == 0)
  {
    uint64_t v8 = v5;
    unint64_t v9 = v6;
    size_t v10 = strlen(a2);
    return std::__formatter::__write_string[abi:ne180100]<char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(a2, v10, *a3, v8, v9);
  }
  else
  {
    uint64_t v11 = *a3;
    if (*a2)
    {
      do
      {
        int v14 = v11;
        std::back_insert_iterator<std::__format::__output_buffer<char>>::operator=[abi:ne180100](&v14, a2);
      }
      while (*++a2);
    }
  }
  return v11;
}

void *std::__formatter::__write_string[abi:ne180100]<char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(char *__src, size_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  if ((a5 & 0x80000000) != 0)
  {
    return std::__formatter::__write_string_no_precision[abi:ne180100]<char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(__src, a2, a3, a4, a5);
  }
  else
  {
    int v9 = std::__format_spec::__estimate_column_width[abi:ne180100]<char,char const*>((unsigned __int8 *)__src, a2, a5, 0);
    size_t v11 = v10 - (void)__src;
    return std::__formatter::__write[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(__src, v11, a3, a4, a5, v9);
  }
}

unsigned __int8 *std::__formatter_pointer<char>::parse[abi:ne180100]<std::basic_format_parse_context<char>>(unsigned char *a1, unsigned __int8 **a2)
{
  uint64_t result = std::__format_spec::__parser<char>::__parse[abi:ne180100]<std::basic_format_parse_context<char>>(a1, a2, 0x124u);
  int v4 = a1[1];
  if ((v4 - 8) >= 2 && v4 != 0) {
    std::__format_spec::__throw_invalid_type_format_error[abi:ne180100]("a pointer");
  }
  return result;
}

void *std::__formatter_pointer<char>::format[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(char *a1, unint64_t a2, void *a3)
{
  unint64_t v5 = std::__format_spec::__parser<char>::__get_parsed_std_specifications[abi:ne180100]<std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a1, a3);
  uint64_t v7 = 1536;
  if ((v5 & 0xFF00) == 0x900) {
    uint64_t v7 = 1792;
  }
  return std::__formatter::__format_integer[abi:ne180100]<unsigned long,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a2, (void **)a3, v5 & 0xFFFFFFFFFFFF00FFLL | v7 | 0x20, v6, 0);
}

void *std::__formatter::__format_integer[abi:ne180100]<unsigned long,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(unint64_t a1, void **a2, unint64_t a3, unint64_t a4, char a5)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  switch(BYTE1(a3))
  {
    case 1:
      __break(1u);
      JUMPOUT(0x25B678834);
    case 2:
      unint64_t v6 = a3 & 0xFFFFFFFFFFFF00FFLL | 0x200;
      uint64_t v7 = &v13;
      signed int v9 = 2;
      uint64_t v8 = "0b";
      goto LABEL_11;
    case 3:
      unint64_t v6 = a3 & 0xFFFFFFFFFFFF00FFLL | 0x300;
      uint64_t v7 = &v13;
      signed int v9 = 2;
      uint64_t v8 = "0B";
      goto LABEL_11;
    case 4:
      unint64_t v6 = a3 & 0xFFFFFFFFFFFF00FFLL | 0x400;
      uint64_t v7 = (uint64_t *)&v12[3];
      if (a1) {
        uint64_t v8 = "0";
      }
      else {
        uint64_t v8 = 0;
      }
      signed int v9 = 8;
      goto LABEL_11;
    case 6:
      unint64_t v6 = a3 & 0xFFFFFFFFFFFF00FFLL | 0x600;
      uint64_t v7 = (uint64_t *)v11;
      signed int v9 = 16;
      uint64_t v8 = "0x";
      goto LABEL_11;
    case 7:
      unint64_t v6 = a3 & 0xFFFFFFFFFFFF00FFLL | 0x700;
      uint64_t v7 = (uint64_t *)v11;
      signed int v9 = 16;
      uint64_t v8 = "0X";
LABEL_11:
      uint64_t result = std::__formatter::__format_integer[abi:ne180100]<unsigned long,char *,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a1, a2, v6, a4, a5, v10, (uint64_t)v7, v8, v9);
      break;
    default:
      uint64_t result = std::__formatter::__format_integer[abi:ne180100]<unsigned long,char *,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(a1, a2, a3, a4, a5, v10, (uint64_t)v12, 0, 10);
      break;
  }
  return result;
}

void *std::__formatter::__format_integer[abi:ne180100]<unsigned long,char *,char,std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>>(unint64_t a1, void **a2, unint64_t a3, unint64_t a4, char a5, char *a6, uint64_t a7, unsigned char *a8, signed int a9)
{
  signed int v9 = a6;
  char v13 = a3;
  if (a5)
  {
    char v14 = 45;
LABEL_7:
    *a6 = v14;
    char v16 = a6 + 1;
    goto LABEL_8;
  }
  int v15 = (a3 >> 3) & 3;
  if (v15 == 2)
  {
    char v14 = 43;
    goto LABEL_7;
  }
  char v16 = a6;
  if (v15 == 3)
  {
    char v14 = 32;
    goto LABEL_7;
  }
LABEL_8:
  if ((a3 & 0x20) != 0)
  {
    if (a8)
    {
      char v17 = *a8;
      if (*a8)
      {
        uint64_t v18 = a8 + 1;
        do
        {
          *(unsigned char *)char v16 = v17;
          char v16 = (_WORD *)((char *)v16 + 1);
          int v19 = *v18++;
          char v17 = v19;
        }
        while (v19);
      }
    }
  }
  int v20 = std::__to_chars_integral[abi:ne180100]<unsigned long long>(v16, a7, a1, a9);
  if ((v13 & 0x40) == 0) {
    goto LABEL_44;
  }
  std::basic_format_context<std::back_insert_iterator<std::__format::__output_buffer<char>>,char>::locale[abi:ne180100]((uint64_t)a2, &v45);
  uint64_t v21 = std::locale::use_facet(&v45, MEMORY[0x263F8C150]);
  std::locale::~locale(&v45);
  ((void (*)(std::locale *__return_ptr, const std::locale::facet *))v21->__vftable[1].__on_zero_shared)(&v45, v21);
  if ((char)v47 < 0)
  {
    locale = (char *)v45.__locale_;
    if (!v46)
    {
LABEL_43:
      operator delete(locale);
      goto LABEL_44;
    }
  }
  else
  {
    if (!v47) {
      goto LABEL_44;
    }
    locale = (char *)&v45;
  }
  if (v20 - (char *)v16 <= *locale)
  {
    if ((v47 & 0x80) != 0)
    {
      locale = (char *)v45.__locale_;
      goto LABEL_43;
    }
LABEL_44:
    unint64_t v35 = HIDWORD(a3);
    if ((v13 & 7) == 4)
    {
      std::__format::__output_buffer<char>::__copy[abi:ne180100]<char>(*a2, v9, (char *)v16 - v9);
      unsigned __int8 v36 = a3 & 0xF8 | 3;
      if (SHIDWORD(a3) >= (int)v16 - (int)v9) {
        int v37 = v16 - v9;
      }
      else {
        int v37 = HIDWORD(a3);
      }
      unint64_t v35 = (HIDWORD(a3) - v37);
      unsigned __int8 v38 = 48;
      signed int v9 = (char *)v16;
    }
    else
    {
      unsigned __int8 v38 = BYTE4(a4);
      unsigned __int8 v36 = a3;
    }
    std::string::size_type v39 = *a2;
    uint64_t v40 = a3 & 0xFFFFFF00 | (v35 << 32) | v36;
    unint64_t v41 = a4 & 0xFFFFFF00FFFFFFFFLL | ((unint64_t)v38 << 32);
    if ((a3 & 0xFF00) == 0x700) {
      return std::__formatter::__write_transformed[abi:ne180100]<char *,char,char,char (*)(char),std::back_insert_iterator<std::__format::__output_buffer<char>>>(v9, v20, v39, v40, v41, (uint64_t (*)(void))std::__formatter::__hex_to_upper[abi:ne180100]);
    }
    else {
      return std::__formatter::__write[abi:ne180100]<char,char,std::back_insert_iterator<std::__format::__output_buffer<char>>>(v9, v20 - v9, v39, v40, v41, v20 - v9);
    }
  }
  int v23 = *a2;
  memset(&__p, 0, sizeof(__p));
  if ((v47 & 0x80u) == 0) {
    uint64_t v24 = (std::string::value_type *)&v45;
  }
  else {
    uint64_t v24 = (std::string::value_type *)v45.__locale_;
  }
  if ((v47 & 0x80u) == 0) {
    size_t v25 = (char *)&v45 + v47;
  }
  else {
    size_t v25 = (char *)v45.__locale_ + v46;
  }
  std::string::value_type v26 = *v24;
  uint64_t v27 = v20 - (char *)v16 - *v24;
  if (v27 >= 1)
  {
    unsigned __int8 v28 = v25 - 1;
    do
    {
      std::string::push_back(&__p, v26);
      if (v24 == v28)
      {
        std::string::value_type v26 = *v28;
        uint64_t v24 = v28;
      }
      else
      {
        int v29 = v24 + 1;
        size_t v30 = v24 + 1;
        do
        {
          int v31 = *v30++;
          std::string::value_type v26 = v31;
          if (v31) {
            BOOL v32 = 1;
          }
          else {
            BOOL v32 = v29 == v28;
          }
          int v29 = v30;
        }
        while (!v32);
        uint64_t v24 = v30 - 1;
      }
      v27 -= v26;
    }
    while (v27 > 0);
  }
  std::string::push_back(&__p, v26 + v27);
  char v33 = ((uint64_t (*)(const std::locale::facet *))v21->__vftable[1].~facet_0)(v21);
  size_t v34 = std::__formatter::__write_using_decimal_separators[abi:ne180100]<std::back_insert_iterator<std::__format::__output_buffer<char>>,char *,char>(v23, v9, (char *)v16, (int)v20, (uint64_t *)&__p, v33, a3, a4);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if ((char)v47 < 0) {
    operator delete(v45.__locale_);
  }
  return v34;
}

void sub_25B678B74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, std::locale a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15.__locale_);
  }
  _Unwind_Resume(exception_object);
}

uint64_t silmanager_silmanager_createrenderer()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    tb_client_connection_message_destruct();
    if ((v0 & 0xFFFFFFF7) == 0) {
      return 4;
    }
  }
  return v0;
}

uint64_t silmanager_silmanager_setpower()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_BOOL();
    tb_message_encode_BOOL();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    tb_client_connection_message_destruct();
    if ((v0 & 0xFFFFFFF7) == 0) {
      return 4;
    }
  }
  return v0;
}

uint64_t silmanager_silmanager_swap()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u8();
    tb_message_encode_s32();
    tb_message_encode_f64();
    tb_message_encode_f64();
    tb_message_encode_f32();
    tb_message_encode_u16();
    tb_message_encode_f32();
    tb_message_complete();
    uint64_t v1 = tb_connection_send_query();
    if ((v1 & 0xFFFFFFF7) != 0)
    {
      uint64_t v0 = v1;
      tb_client_connection_message_destruct();
    }
    else
    {
      tb_client_connection_message_destruct();
      return 4;
    }
  }
  return v0;
}

uint64_t silmanager_silmanager_turnoffindicators()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_s32();
    tb_message_encode_BOOL();
    tb_message_complete();
    uint64_t v1 = tb_connection_send_query();
    if ((v1 & 0xFFFFFFF7) != 0)
    {
      uint64_t v0 = v1;
      tb_client_connection_message_destruct();
    }
    else
    {
      tb_client_connection_message_destruct();
      return 4;
    }
  }
  return v0;
}

uint64_t silmanager_silmanager_swapend()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    tb_client_connection_message_destruct();
    if ((v0 & 0xFFFFFFF7) == 0) {
      return 4;
    }
  }
  return v0;
}

uint64_t silmanager_silmanager_setloglevel()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u8();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    tb_client_connection_message_destruct();
    if ((v0 & 0xFFFFFFF7) == 0) {
      return 4;
    }
  }
  return v0;
}

uint64_t silmanager_silmanager__init(uint64_t *a1)
{
  tb_endpoint_set_interface_identifier();
  uint64_t v2 = tb_client_connection_create_with_endpoint();
  uint64_t result = tb_client_connection_activate();
  if (!result) {
    *a1 = v2;
  }
  return result;
}

uint64_t type metadata accessor for SILMgrCommonBase()
{
  return self;
}

id SILMgrCommonBase.__deallocating_deinit()
{
  return SILMgrCommonBase.__deallocating_deinit(type metadata accessor for SILMgrCommonBase);
}

id FrameDesc.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return FrameDesc.init(from:)(a1);
}

id FrameDesc.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<FrameDesc.CodingKeys>);
  uint64_t v20 = *(void *)(v4 - 8);
  uint64_t v21 = v4;
  MEMORY[0x270FA5388]();
  unint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  uint64_t v22 = a1;
  uint64_t v8 = __swift_project_boxed_opaque_existential_1(a1, v7);
  lazy protocol witness table accessor for type FrameDesc.CodingKeys and conformance FrameDesc.CodingKeys();
  signed int v9 = v1;
  uint64_t v10 = v6;
  id v11 = v8;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    type metadata accessor for FrameDesc();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v12 = v20;
    uint64_t v13 = v21;
    char v24 = 0;
    *(_DWORD *)&v9[OBJC_IVAR____TtC10SILManager9FrameDesc_dataOffset] = KeyedDecodingContainer.decode(_:forKey:)();
    char v24 = 1;
    *(_DWORD *)&v9[OBJC_IVAR____TtC10SILManager9FrameDesc_dataSize] = KeyedDecodingContainer.decode(_:forKey:)();
    char v24 = 2;
    KeyedDecodingContainer.decode(_:forKey:)();
    *(_DWORD *)&v9[OBJC_IVAR____TtC10SILManager9FrameDesc_time] = v15;
    char v24 = 3;
    KeyedDecodingContainer.decode(_:forKey:)();
    *(_DWORD *)&v9[OBJC_IVAR____TtC10SILManager9FrameDesc_size] = v16;
    char v24 = 4;
    v9[OBJC_IVAR____TtC10SILManager9FrameDesc_unnoticeable] = KeyedDecodingContainer.decodeIfPresent(_:forKey:)() & 1;
    char v24 = 5;
    char v17 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v13);
    v9[OBJC_IVAR____TtC10SILManager9FrameDesc_skipEic] = v17 & 1;

    uint64_t v18 = (objc_class *)type metadata accessor for FrameDesc();
    v23.receiver = v9;
    v23.super_class = v18;
    id v11 = objc_msgSendSuper2(&v23, sel_init);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  }
  return v11;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type FrameDesc.CodingKeys and conformance FrameDesc.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type FrameDesc.CodingKeys and conformance FrameDesc.CodingKeys;
  if (!lazy protocol witness table cache variable for type FrameDesc.CodingKeys and conformance FrameDesc.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FrameDesc.CodingKeys and conformance FrameDesc.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FrameDesc.CodingKeys and conformance FrameDesc.CodingKeys;
  if (!lazy protocol witness table cache variable for type FrameDesc.CodingKeys and conformance FrameDesc.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FrameDesc.CodingKeys and conformance FrameDesc.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FrameDesc.CodingKeys and conformance FrameDesc.CodingKeys;
  if (!lazy protocol witness table cache variable for type FrameDesc.CodingKeys and conformance FrameDesc.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FrameDesc.CodingKeys and conformance FrameDesc.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FrameDesc.CodingKeys and conformance FrameDesc.CodingKeys;
  if (!lazy protocol witness table cache variable for type FrameDesc.CodingKeys and conformance FrameDesc.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FrameDesc.CodingKeys and conformance FrameDesc.CodingKeys);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t type metadata accessor for FrameDesc()
{
  return self;
}

SILFrameDesc __swiftcall FrameDesc.getSILFrameDesc()()
{
  float v1 = *(float *)(v0 + OBJC_IVAR____TtC10SILManager9FrameDesc_time);
  float v2 = *(float *)(v0 + OBJC_IVAR____TtC10SILManager9FrameDesc_size);
  unint64_t v3 = *(unsigned int *)(v0 + OBJC_IVAR____TtC10SILManager9FrameDesc_dataOffset) | ((unint64_t)*(unsigned int *)(v0 + OBJC_IVAR____TtC10SILManager9FrameDesc_dataSize) << 32);
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC10SILManager9FrameDesc_skipEic)) {
    __int16 v4 = 256;
  }
  else {
    __int16 v4 = 0;
  }
  __int16 v5 = v4 | *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10SILManager9FrameDesc_unnoticeable);
  result.var2 = v3;
  result.var3 = HIDWORD(v3);
  result.var1 = v2;
  result.float var0 = v1;
  result.var4 = v5;
  result.var5 = HIBYTE(v5);
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance FrameDesc.CodingKeys(unsigned __int8 *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

uint64_t specialized == infix<A>(_:_:)(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x7365676E6172;
  }
  else {
    uint64_t v3 = 0x6172467472617473;
  }
  if (v2) {
    unint64_t v4 = 0xEA0000000000656DLL;
  }
  else {
    unint64_t v4 = 0xE600000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x7365676E6172;
  }
  else {
    uint64_t v5 = 0x6172467472617473;
  }
  if (a2) {
    unint64_t v6 = 0xE600000000000000;
  }
  else {
    unint64_t v6 = 0xEA0000000000656DLL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t specialized == infix<A>(_:_:)(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1701667182;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 1701667182;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 1701869940;
      break;
    case 2:
      unint64_t v3 = 0xE300000000000000;
      unint64_t v5 = 7499842;
      break;
    case 3:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v5 = 0x746E65747865;
      break;
    case 4:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v5 = 0x73656D617266;
      break;
    case 5:
      unint64_t v5 = 0x6143726F736E6573;
      unint64_t v3 = 0xEE0079726F676574;
      break;
    case 6:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x656D614E626F6C62;
      break;
    case 7:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x6B6F6F6270696C66;
      break;
    case 8:
      unint64_t v3 = 0x800000025B6A0700;
      unint64_t v5 = 0xD000000000000015;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      if (v5 == 1701869940) {
        goto LABEL_25;
      }
      goto LABEL_28;
    case 2:
      unint64_t v6 = 0xE300000000000000;
      if (v5 != 7499842) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 3:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x746E65747865) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 4:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x73656D617266) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 5:
      unint64_t v6 = 0xEE0079726F676574;
      if (v5 != 0x6143726F736E6573) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 6:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x656D614E626F6C62) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 7:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v2 = 0x6B6F6F6270696C66;
      goto LABEL_24;
    case 8:
      unint64_t v6 = 0x800000025B6A0700;
      if (v5 != 0xD000000000000015) {
        goto LABEL_28;
      }
      goto LABEL_25;
    default:
LABEL_24:
      if (v5 != v2) {
        goto LABEL_28;
      }
LABEL_25:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_28:
      }
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  uint64_t v2 = 0x73656369766564;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 0x73656369766564;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x676E69646E756F62;
      unint64_t v3 = 0xED00007365786F42;
      break;
    case 2:
      unint64_t v5 = 0xD000000000000014;
      unint64_t v3 = 0x800000025B6A0690;
      break;
    case 3:
      unint64_t v3 = 0x800000025B6A06B0;
      unint64_t v5 = 0xD000000000000010;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xED00007365786F42;
      if (v5 == 0x676E69646E756F62) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      uint64_t v2 = 0xD000000000000014;
      unint64_t v6 = 0x800000025B6A0690;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0x800000025B6A06B0;
      if (v5 == 0xD000000000000010) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  uint64_t v2 = 0xEA00000000007465;
  unint64_t v3 = 0x7366664F61746164;
  uint64_t v4 = a1;
  unint64_t v5 = 0x7366664F61746164;
  unint64_t v6 = 0xEA00000000007465;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      unint64_t v5 = 0x657A695361746164;
      break;
    case 2:
      unint64_t v6 = 0xE400000000000000;
      unint64_t v5 = 1701669236;
      break;
    case 3:
      unint64_t v6 = 0xE400000000000000;
      unint64_t v5 = 1702521203;
      break;
    case 4:
      unint64_t v5 = 0x656369746F6E6E75;
      unint64_t v6 = 0xEC000000656C6261;
      break;
    case 5:
      unint64_t v6 = 0xE700000000000000;
      unint64_t v5 = 0x63694570696B73;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      uint64_t v2 = 0xE800000000000000;
      if (v5 == 0x657A695361746164) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      uint64_t v2 = 0xE400000000000000;
      if (v5 != 1701669236) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      uint64_t v2 = 0xE400000000000000;
      if (v5 != 1702521203) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 4:
      unint64_t v3 = 0x656369746F6E6E75;
      uint64_t v2 = 0xEC000000656C6261;
      goto LABEL_15;
    case 5:
      uint64_t v2 = 0xE700000000000000;
      if (v5 != 0x63694570696B73) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
LABEL_15:
      if (v5 != v3) {
        goto LABEL_19;
      }
LABEL_16:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  uint64_t v2 = 0x6165627468676954;
  unint64_t v3 = 0xE90000000000006DLL;
  uint64_t v4 = a1;
  unint64_t v5 = 0x6165627468676954;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x616C707369445845;
      unint64_t v3 = 0xE900000000000079;
      break;
    case 2:
      unint64_t v5 = 0x6361667275535845;
      unint64_t v3 = 0xE900000000000065;
      break;
    case 3:
      unint64_t v5 = 0x6F4C617461445845;
      unint64_t v3 = 0xEC00000072656461;
      break;
    case 4:
      unint64_t v5 = 0x65646E65524C4953;
      unint64_t v3 = 0xEB00000000726572;
      break;
    case 5:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x646E656B636142;
      break;
    case 6:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v5 = 0x6E6F6D6D6F43;
      break;
    case 7:
      unint64_t v5 = 0x69746164696C6156;
      unint64_t v3 = 0xEA00000000006E6FLL;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE90000000000006DLL;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE900000000000079;
      if (v5 == 0x616C707369445845) {
        goto LABEL_22;
      }
      goto LABEL_25;
    case 2:
      unint64_t v6 = 0xE900000000000065;
      if (v5 != 0x6361667275535845) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 3:
      unint64_t v6 = 0xEC00000072656461;
      if (v5 != 0x6F4C617461445845) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 4:
      unint64_t v6 = 0xEB00000000726572;
      if (v5 != 0x65646E65524C4953) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 5:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x646E656B636142) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 6:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v2 = 0x6E6F6D6D6F43;
      goto LABEL_21;
    case 7:
      unint64_t v6 = 0xEA00000000006E6FLL;
      if (v5 != 0x69746164696C6156) {
        goto LABEL_25;
      }
      goto LABEL_22;
    default:
LABEL_21:
      if (v5 != v2) {
        goto LABEL_25;
      }
LABEL_22:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_25:
      }
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance FrameDesc.CodingKeys()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

Swift::Int specialized RawRepresentable<>.hashValue.getter()
{
  return Hasher._finalize()();
}

{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance FrameDesc.CodingKeys()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

{
  uint64_t vars8;

  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

{
  uint64_t vars8;

  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance FrameDesc.CodingKeys()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  return Hasher._finalize()();
}

{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance FrameDesc.CodingKeys@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized FrameDesc.CodingKeys.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance FrameDesc.CodingKeys(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xEA00000000007465;
  uint64_t v3 = 0x7366664F61746164;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x657A695361746164;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 1701669236;
      *(void *)(a1 + 8) = 0xE400000000000000;
      break;
    case 3:
      *(void *)a1 = 1702521203;
      *(void *)(a1 + 8) = 0xE400000000000000;
      break;
    case 4:
      strcpy((char *)a1, "unnoticeable");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      break;
    case 5:
      *(void *)a1 = 0x63694570696B73;
      *(void *)(a1 + 8) = 0xE700000000000000;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance FrameDesc.CodingKeys()
{
  uint64_t result = 0x7366664F61746164;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x657A695361746164;
      break;
    case 2:
      uint64_t result = 1701669236;
      break;
    case 3:
      uint64_t result = 1702521203;
      break;
    case 4:
      uint64_t result = 0x656369746F6E6E75;
      break;
    case 5:
      uint64_t result = 0x63694570696B73;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance FrameDesc.CodingKeys@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized FrameDesc.CodingKeys.init(rawValue:)(a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance FrameDesc.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance FrameDesc.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FrameDesc.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type FrameDesc.CodingKeys and conformance FrameDesc.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance FrameDesc.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type FrameDesc.CodingKeys and conformance FrameDesc.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

id FrameDesc.__deallocating_deinit()
{
  return SILMgrCommonBase.__deallocating_deinit(type metadata accessor for FrameDesc);
}

uint64_t protocol witness for Decodable.init(from:) in conformance FrameDesc@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 128))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t SILBoundingBoxes.__allocating_init(values:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  SILBoundingBoxes.init(values:)(a1);
  return v2;
}

uint64_t SILBoundingBoxes.init(values:)(uint64_t a1)
{
  uint64_t v2 = v1;
  int64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint64_t v56 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4, 0);
    uint64_t v5 = 0;
    uint64_t v6 = v56;
    while (1)
    {
      uint64_t v7 = *(void *)(a1 + 8 * v5 + 32);
      if (!*(void *)(v7 + 16)) {
        break;
      }
      unint64_t v8 = specialized __RawDictionaryStorage.find<A>(_:)(88, 0xE100000000000000);
      if ((v9 & 1) == 0) {
        goto LABEL_44;
      }
      if (!*(void *)(v7 + 16)) {
        goto LABEL_45;
      }
      uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v8);
      unint64_t v11 = specialized __RawDictionaryStorage.find<A>(_:)(89, 0xE100000000000000);
      if ((v12 & 1) == 0) {
        goto LABEL_46;
      }
      if (!*(void *)(v7 + 16)) {
        goto LABEL_47;
      }
      uint64_t v13 = *(void *)(*(void *)(v7 + 56) + 8 * v11);
      unint64_t v14 = specialized __RawDictionaryStorage.find<A>(_:)(0x6874646957, 0xE500000000000000);
      if ((v15 & 1) == 0) {
        goto LABEL_48;
      }
      if (!*(void *)(v7 + 16)) {
        goto LABEL_49;
      }
      uint64_t v16 = *(void *)(*(void *)(v7 + 56) + 8 * v14);
      unint64_t v17 = specialized __RawDictionaryStorage.find<A>(_:)(0x746867696548, 0xE600000000000000);
      if ((v18 & 1) == 0) {
        goto LABEL_50;
      }
      uint64_t v19 = *(void *)(*(void *)(v7 + 56) + 8 * v17);
      if (*(void *)(v7 + 16)
        && (specialized __RawDictionaryStorage.find<A>(_:)(0x63696D616E7964, 0xE700000000000000), (v20 & 1) != 0))
      {
        if (!*(void *)(v7 + 16)) {
          goto LABEL_51;
        }
        unint64_t v21 = specialized __RawDictionaryStorage.find<A>(_:)(0x63696D616E7964, 0xE700000000000000);
        if ((v22 & 1) == 0) {
          goto LABEL_52;
        }
        BOOL v23 = *(double *)(*(void *)(v7 + 56) + 8 * v21) > 0.0;
      }
      else
      {
        BOOL v23 = 0;
      }
      unint64_t v25 = *(void *)(v56 + 16);
      unint64_t v24 = *(void *)(v56 + 24);
      if (v25 >= v24 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v24 > 1), v25 + 1, 1);
      }
      ++v5;
      *(void *)(v56 + 16) = v25 + 1;
      unint64_t v26 = v56 + 40 * v25;
      *(void *)(v26 + 32) = v10;
      *(void *)(v26 + 40) = v13;
      *(void *)(v26 + 48) = v16;
      *(void *)(v26 + 56) = v19;
      *(unsigned char *)(v26 + 64) = v23;
      if (v4 == v5)
      {
        swift_bridgeObjectRelease();
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = MEMORY[0x263F8EE78];
LABEL_22:
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
LABEL_53:
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v6);
    uint64_t v6 = result;
    uint64_t v28 = *(void *)(result + 16);
    if (!v28)
    {
LABEL_54:
      int64_t v29 = 0;
      *(void *)(v2 + 16) = MEMORY[0x263F8EE78];
      uint64_t v46 = *(void *)(v6 + 16);
      BOOL v45 = v46 <= 0;
      if (v46) {
        goto LABEL_55;
      }
LABEL_42:
      unsigned __int8 v47 = (char *)MEMORY[0x263F8EE78];
LABEL_63:
      *(void *)(v2 + 24) = v47;
      swift_bridgeObjectRelease();
      return v2;
    }
    goto LABEL_24;
  }
  uint64_t v28 = *(void *)(v6 + 16);
  if (!v28) {
    goto LABEL_54;
  }
LABEL_24:
  int64_t v29 = 0;
  while (1)
  {
    uint64_t v34 = v6 + 32 + 40 * v29;
    if (*(unsigned char *)(v34 + 32) == 1) {
      break;
    }
LABEL_26:
    if (++v29 >= v28) {
      goto LABEL_32;
    }
  }
  if (v29 < v28 - 1)
  {
    unint64_t v35 = (unsigned char *)(v6 + 24 + 40 * v28--);
    while (*v35 == 1)
    {
      --v28;
      v35 -= 40;
      if (v29 >= v28) {
        goto LABEL_32;
      }
    }
    long long v30 = *(_OWORD *)v34;
    long long v31 = *(_OWORD *)(v34 + 16);
    uint64_t v32 = *(void *)v35;
    long long v33 = *((_OWORD *)v35 - 1);
    *(_OWORD *)uint64_t v34 = *((_OWORD *)v35 - 2);
    *(_OWORD *)(v34 + 16) = v33;
    *(void *)(v34 + 32) = v32;
    *((_OWORD *)v35 - 2) = v30;
    *((_OWORD *)v35 - 1) = v31;
    *unint64_t v35 = 1;
    goto LABEL_26;
  }
LABEL_32:
  if (*(void *)(v6 + 16) < (unint64_t)v29)
  {
    __break(1u);
    goto LABEL_65;
  }
  if (!v29) {
    goto LABEL_54;
  }
  swift_bridgeObjectRetain();
  unsigned __int8 v36 = (void *)(v6 + 56);
  int v37 = (char *)MEMORY[0x263F8EE78];
  uint64_t v38 = v29;
  do
  {
    uint64_t v39 = *(v36 - 3);
    long long v54 = *((_OWORD *)v36 - 1);
    uint64_t v40 = *v36;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int v37 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v37 + 2) + 1, 1, v37);
    }
    unint64_t v42 = *((void *)v37 + 2);
    unint64_t v41 = *((void *)v37 + 3);
    if (v42 >= v41 >> 1) {
      int v37 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v41 > 1), v42 + 1, 1, v37);
    }
    *((void *)v37 + 2) = v42 + 1;
    int v43 = &v37[32 * v42];
    *((void *)v43 + 4) = v39;
    *(_OWORD *)(v43 + 40) = v54;
    *((void *)v43 + 7) = v40;
    v36 += 5;
    --v38;
  }
  while (v38);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = v37;
  uint64_t v44 = *(void *)(v6 + 16);
  if (v44 < v29)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  uint64_t v46 = v44 - v29;
  BOOL v45 = v44 <= v29;
  if (v44 == v29) {
    goto LABEL_42;
  }
LABEL_55:
  if (!v45)
  {
    swift_bridgeObjectRetain();
    char v48 = (void *)(v6 + 40 * v29 + 56);
    unsigned __int8 v47 = (char *)MEMORY[0x263F8EE78];
    do
    {
      uint64_t v49 = *(v48 - 3);
      long long v55 = *((_OWORD *)v48 - 1);
      uint64_t v50 = *v48;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unsigned __int8 v47 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v47 + 2) + 1, 1, v47);
      }
      unint64_t v52 = *((void *)v47 + 2);
      unint64_t v51 = *((void *)v47 + 3);
      if (v52 >= v51 >> 1) {
        unsigned __int8 v47 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v51 > 1), v52 + 1, 1, v47);
      }
      *((void *)v47 + 2) = v52 + 1;
      v53 = &v47[32 * v52];
      *((void *)v53 + 4) = v49;
      *(_OWORD *)(v53 + 40) = v55;
      *((void *)v53 + 7) = v50;
      v48 += 5;
      --v46;
    }
    while (v46);
    swift_bridgeObjectRelease();
    goto LABEL_63;
  }
LABEL_66:
  __break(1u);
  return result;
}

uint64_t default argument 1 of SILBoundingBoxes.isPositionValid(position:includeDynamicBoundingBoxes:)()
{
  return 1;
}

Swift::Bool __swiftcall SILBoundingBoxes.isPositionValid(position:includeDynamicBoundingBoxes:)(CGPoint position, Swift::Bool includeDynamicBoundingBoxes)
{
  CGFloat y = position.y;
  CGFloat x = position.x;
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    swift_bridgeObjectRetain();
    Swift::Bool result = CGRect.contains(_:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));
    if (result)
    {
LABEL_12:
      Swift::Bool v14 = 1;
LABEL_13:
      swift_bridgeObjectRelease();
      return v14;
    }
    if (v7 != 1)
    {
      uint64_t v9 = v6 + 88;
      uint64_t v10 = 1;
      while (1)
      {
        uint64_t v11 = v10 + 1;
        if (__OFADD__(v10, 1)) {
          break;
        }
        Swift::Bool result = CGRect.contains(_:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));
        if (result) {
          goto LABEL_12;
        }
        v9 += 32;
        ++v10;
        if (v11 == v7) {
          goto LABEL_8;
        }
      }
      __break(1u);
      goto LABEL_24;
    }
LABEL_8:
    swift_bridgeObjectRelease();
  }
  if (!includeDynamicBoundingBoxes) {
    return 0;
  }
  uint64_t v12 = *(void *)(v2 + 24);
  if ((uint64_t v13 = *(void *)(v12 + 16)) == 0) {
    return 0;
  }
  swift_bridgeObjectRetain();
  Swift::Bool result = CGRect.contains(_:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));
  if (result) {
    goto LABEL_12;
  }
  if (v13 == 1)
  {
    Swift::Bool v14 = 0;
    goto LABEL_13;
  }
  uint64_t v15 = v12 + 88;
  uint64_t v16 = 1;
  while (1)
  {
    uint64_t v17 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    Swift::Bool result = CGRect.contains(_:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));
    Swift::Bool v14 = result;
    if (!result)
    {
      v15 += 32;
      ++v16;
      if (v17 != v13) {
        continue;
      }
    }
    goto LABEL_13;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t SILBoundingBoxes.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SILBoundingBoxes.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t SILConstraints.constraintsFile.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC10SILManager14SILConstraints_constraintsFile);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t SILConstraints.constraintsFile.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC10SILManager14SILConstraints_constraintsFile);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*SILConstraints.constraintsFile.modify())()
{
  return SILConstraints.constraintsFile.modify;
}

uint64_t SILConstraints.steadyFrames.getter()
{
  uint64_t v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC10SILManager14SILConstraints_steadyFrames);
  swift_beginAccess();
  return *v1;
}

uint64_t SILConstraints.steadyFrames.setter(__int16 a1, __int16 a2)
{
  uint64_t v5 = (_WORD *)(v2 + OBJC_IVAR____TtC10SILManager14SILConstraints_steadyFrames);
  uint64_t result = swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*SILConstraints.steadyFrames.modify())()
{
  return SILConstraints.steadyFrames.modify;
}

uint64_t SILConstraints.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SILConstraints.init(from:)(a1);
}

uint64_t SILConstraints.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SILConstraints.CodingKeys>);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1[3];
  unint64_t v25 = a1;
  uint64_t v9 = __swift_project_boxed_opaque_existential_1(a1, v8);
  lazy protocol witness table accessor for type SILConstraints.CodingKeys and conformance SILConstraints.CodingKeys();
  unint64_t v26 = v1;
  id v10 = v9;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    uint64_t v11 = v26;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);

    type metadata accessor for SILConstraints();
    swift_deallocPartialClassInstance();
    return (uint64_t)v10;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  char v29 = 0;
  lazy protocol witness table accessor for type [String] and conformance <A> [A](&lazy protocol witness table cache variable for type [String] and conformance <A> [A], &demangling cache variable for type metadata for [String]);
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v12 = v26;
  *(void *)&v26[OBJC_IVAR____TtC10SILManager14SILConstraints_devices] = v27;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [[String : Double]]);
  char v29 = 1;
  lazy protocol witness table accessor for type [[String : Double]] and conformance <A> [A]();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v13 = v27;
  type metadata accessor for SILBoundingBoxes();
  uint64_t v14 = swift_allocObject();
  SILBoundingBoxes.init(values:)(v13);
  *(void *)&v12[OBJC_IVAR____TtC10SILManager14SILConstraints_boundingBoxes] = v14;
  uint64_t v15 = &v12[OBJC_IVAR____TtC10SILManager14SILConstraints_steadyFrames];
  *(_DWORD *)uint64_t v15 = -65536;
  LOBYTE(v27) = 3;
  uint64_t result = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  if (v17)
  {
LABEL_9:
    char v29 = 2;
    int v19 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    if ((v19 & 0x10000) != 0) {
      __int16 v20 = 0;
    }
    else {
      __int16 v20 = v19;
    }
    unint64_t v21 = v26;
    *(_WORD *)&v26[OBJC_IVAR____TtC10SILManager14SILConstraints_noticeableFrame] = v20;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    char v22 = &v21[OBJC_IVAR____TtC10SILManager14SILConstraints_constraintsFile];
    *(void *)char v22 = 0x6E776F6E6B6E753CLL;
    *((void *)v22 + 1) = 0xE90000000000003ELL;

    BOOL v23 = (objc_class *)type metadata accessor for SILConstraints();
    v28.receiver = v21;
    v28.super_class = v23;
    id v10 = objc_msgSendSuper2(&v28, sel_init);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    return (uint64_t)v10;
  }
  if (__OFSUB__(result, 1))
  {
    __break(1u);
  }
  else
  {
    unint64_t v18 = (result - 1) & ~((result - 1) >> 63);
    if (!(v18 >> 16))
    {
      swift_beginAccess();
      *(_WORD *)uint64_t v15 = v18;
      goto LABEL_9;
    }
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance SILConstraints.CodingKeys(unsigned __int8 *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SILConstraints.CodingKeys()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance SILConstraints.CodingKeys()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SILConstraints.CodingKeys()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance SILConstraints.CodingKeys@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized SILConstraints.CodingKeys.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance SILConstraints.CodingKeys(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE700000000000000;
  uint64_t v3 = 0x73656369766564;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xED00007365786F42;
      uint64_t v3 = 0x676E69646E756F62;
      goto LABEL_3;
    case 2:
      *a1 = 0xD000000000000014;
      a1[1] = 0x800000025B6A0690;
      break;
    case 3:
      *a1 = 0xD000000000000010;
      a1[1] = 0x800000025B6A06B0;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance SILConstraints.CodingKeys()
{
  unint64_t result = 0x73656369766564;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x676E69646E756F62;
      break;
    case 2:
      unint64_t result = 0xD000000000000014;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance SILConstraints.CodingKeys@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized SILConstraints.CodingKeys.init(rawValue:)(a1);
  *a2 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance SILConstraints.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SILConstraints.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SILConstraints.CodingKeys and conformance SILConstraints.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SILConstraints.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SILConstraints.CodingKeys and conformance SILConstraints.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SILConstraints.__ivar_destroyer()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

id SILConstraints.__deallocating_deinit()
{
  return SILMgrCommonBase.__deallocating_deinit(type metadata accessor for SILConstraints);
}

uint64_t protocol witness for Decodable.init(from:) in conformance SILConstraints@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 168))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t SILIndicatorDesc.type.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_type;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t SILIndicatorDesc.type.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_type);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*SILIndicatorDesc.type.modify())()
{
  return SILConstraints.constraintsFile.modify;
}

uint64_t SILIndicatorDesc.name.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_name);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SILIndicatorDesc.sensorCategory.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_sensorCategory);
}

uint64_t SILIndicatorDesc.extent.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_extent);
}

uint64_t SILIndicatorDesc.Bpr.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_Bpr);
}

uint64_t SILIndicatorDesc.blobName.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_blobName);
  swift_bridgeObjectRetain();
  return v1;
}

void *SILIndicatorDesc.flipbook.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_flipbook);
  id v2 = v1;
  return v1;
}

uint64_t SILIndicatorDesc.constraintsFile.getter()
{
  uint64_t v1 = (void *)MEMORY[0x263F8EED0];
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
  if (result)
  {
    uint64_t v3 = *(id *)(result + 24);
    uint64_t v4 = swift_release();
    uint64_t v5 = (*(uint64_t (**)(uint64_t))((*v1 & *v3) + 0x78))(v4);

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t SILIndicatorDesc.boundingBoxes.getter()
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
  if (result)
  {
    id v2 = (char *)*(id *)(result + 24);
    swift_release();
    uint64_t v3 = *(void *)&v2[OBJC_IVAR____TtC10SILManager14SILConstraints_boundingBoxes];
    swift_retain();

    uint64_t v4 = *(void *)(v3 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t SILIndicatorDesc.dynamicBoundingBoxes.getter()
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
  if (result)
  {
    id v2 = (char *)*(id *)(result + 24);
    swift_release();
    uint64_t v3 = *(void *)&v2[OBJC_IVAR____TtC10SILManager14SILConstraints_boundingBoxes];
    swift_retain();

    uint64_t v4 = *(void *)(v3 + 24);
    swift_bridgeObjectRetain();
    swift_release();
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

double variable initialization expression of SILIndicatorDesc.blobHandle@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t SILIndicatorDesc.blobHandle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_blobHandle;
  swift_beginAccess();
  return outlined init with copy of SILFileHandle?(v3, a1);
}

uint64_t SILIndicatorDesc.blobHandle.setter(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_blobHandle;
  swift_beginAccess();
  outlined assign with take of SILFileHandle?(a1, v3);
  return swift_endAccess();
}

uint64_t (*SILIndicatorDesc.blobHandle.modify())()
{
  return SILConstraints.constraintsFile.modify;
}

uint64_t variable initialization expression of SILIndicatorDesc.validator()
{
  return 0;
}

uint64_t SILIndicatorDesc.validator.getter()
{
  return swift_retain();
}

uint64_t SILIndicatorDesc.validator.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_validator);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_release();
}

uint64_t (*SILIndicatorDesc.validator.modify())()
{
  return SILConstraints.constraintsFile.modify;
}

unint64_t SILIndicatorDesc.CodingKeys.rawValue.getter(char a1)
{
  unint64_t result = 1701667182;
  switch(a1)
  {
    case 1:
      unint64_t result = 1701869940;
      break;
    case 2:
      unint64_t result = 7499842;
      break;
    case 3:
      unint64_t result = 0x746E65747865;
      break;
    case 4:
      unint64_t result = 0x73656D617266;
      break;
    case 5:
      unint64_t result = 0x6143726F736E6573;
      break;
    case 6:
      unint64_t result = 0x656D614E626F6C62;
      break;
    case 7:
      unint64_t result = 0x6B6F6F6270696C66;
      break;
    case 8:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t SILIndicatorDesc.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result = 1701667182;
  switch(a1)
  {
    case 1:
      unint64_t result = 1701869940;
      break;
    case 2:
      unint64_t result = 7499842;
      break;
    case 3:
      unint64_t result = 0x746E65747865;
      break;
    case 4:
      unint64_t result = 0x73656D617266;
      break;
    case 5:
      unint64_t result = 0x6143726F736E6573;
      break;
    case 6:
      unint64_t result = 0x656D614E626F6C62;
      break;
    case 7:
      unint64_t result = 0x6B6F6F6270696C66;
      break;
    case 8:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance SILIndicatorDesc.CodingKeys(unsigned __int8 *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SILIndicatorDesc.CodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance SILIndicatorDesc.CodingKeys()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SILIndicatorDesc.CodingKeys()
{
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance SILIndicatorDesc.CodingKeys@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized SILIndicatorDesc.CodingKeys.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance SILIndicatorDesc.CodingKeys@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = SILIndicatorDesc.CodingKeys.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance SILIndicatorDesc.CodingKeys()
{
  return SILIndicatorDesc.CodingKeys.stringValue.getter(*v0);
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance SILIndicatorDesc.CodingKeys@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized SILIndicatorDesc.CodingKeys.init(rawValue:)(a1);
  *a2 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance SILIndicatorDesc.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SILIndicatorDesc.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SILIndicatorDesc.CodingKeys and conformance SILIndicatorDesc.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SILIndicatorDesc.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SILIndicatorDesc.CodingKeys and conformance SILIndicatorDesc.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SILIndicatorDesc.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SILIndicatorDesc.init(from:)(a1);
}

uint64_t SILIndicatorDesc.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SILIndicatorDesc.CodingKeys>);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (uint64_t)&v1[OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_blobHandle];
  *(_OWORD *)uint64_t v8 = 0u;
  *(_OWORD *)(v8 + 16) = 0u;
  uint64_t v50 = v8;
  unint64_t v51 = a1;
  *(void *)(v8 + 32) = 0;
  unint64_t v52 = (id *)&v1[OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_validator];
  *(void *)&v1[OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_validator] = 0;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type SILIndicatorDesc.CodingKeys and conformance SILIndicatorDesc.CodingKeys();
  uint64_t v57 = v1;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    id v10 = v57;
    uint64_t v11 = v52;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    outlined destroy of SILFileHandle?(v50);
    id v12 = *v11;

    swift_release();
    type metadata accessor for SILIndicatorDesc();
    swift_deallocPartialClassInstance();
    return (uint64_t)v12;
  }
  uint64_t v49 = v5;
  LOBYTE(v55[0]) = 0;
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v14 = v57;
  uint64_t v15 = (uint64_t *)&v57[OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_name];
  *uint64_t v15 = v9;
  v15[1] = v16;
  LOBYTE(v55[0]) = 5;
  *(void *)&v14[OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_sensorCategory] = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v55[0]) = 3;
  *(void *)&v14[OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_extent] = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v55[0]) = 2;
  *(void *)&v14[OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_Bpr] = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v55[0]) = 6;
  uint64_t v17 = KeyedDecodingContainer.decode(_:forKey:)();
  unint64_t v18 = (uint64_t *)&v14[OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_blobName];
  uint64_t *v18 = v17;
  v18[1] = v19;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [FrameDesc]);
  char v54 = 4;
  lazy protocol witness table accessor for type [FrameDesc] and conformance <A> [A]();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v20 = *(void *)&v55[0];
  if (*(void *)&v55[0] >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v21 = *(void *)((*(void *)&v55[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t result = 20 * v21;
  if ((unsigned __int128)(v21 * (__int128)20) >> 64 == (20 * v21) >> 63)
  {
    uint64_t result = swift_slowAlloc();
    if ((v21 & 0x8000000000000000) == 0)
    {
      uint64_t v48 = v20;
      if (v21)
      {
        uint64_t v22 = 0;
        uint64_t v46 = result;
        unint64_t v47 = v20 & 0xC000000000000001;
        BOOL v23 = (unsigned char *)(result + 17);
        do
        {
          uint64_t v34 = v21;
          if (v47) {
            uint64_t v24 = (void *)MEMORY[0x261165AD0](v22, v20);
          }
          else {
            uint64_t v24 = *(id *)(v20 + 8 * v22 + 32);
          }
          unint64_t v25 = v24;
          ++v22;
          uint64_t v26 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v24) + 0x88))();
          int v28 = v27;
          int v30 = v29;
          uint64_t v31 = v26;
          __int16 v33 = v32;

          *(_DWORD *)(v23 - 17) = v28;
          *(_DWORD *)(v23 - 13) = v30;
          *(void *)(v23 - 9) = v31;
          *(v23 - 1) = v33 & 1;
          *BOOL v23 = HIBYTE(v33) & 1;
          v23 += 20;
          uint64_t v21 = v34;
          uint64_t v20 = v48;
        }
        while (v34 != v22);
        uint64_t v14 = v57;
        *(void *)&v57[OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_frames] = v46;
        if (v34 <= 0xFFFFFFFFLL) {
          goto LABEL_18;
        }
        __break(1u);
      }
      *(void *)&v14[OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_frames] = result;
LABEL_18:
      *(_DWORD *)&v14[OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_framesCount] = v21;
      LOBYTE(v55[0]) = 1;
      uint64_t v35 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
      if (v36) {
        uint64_t v37 = -1;
      }
      else {
        uint64_t v37 = v35;
      }
      *(void *)&v14[OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_type] = v37;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : [String : [String : [Int]]]]);
      char v54 = 7;
      lazy protocol witness table accessor for type [String : [String : [String : [Int]]]] and conformance <> [A : B](&lazy protocol witness table cache variable for type [String : [String : [String : [Int]]]] and conformance <> [A : B], &demangling cache variable for type metadata for [String : [String : [String : [Int]]]], (void (*)(void))lazy protocol witness table accessor for type [String : [String : [Int]]] and conformance <> [A : B]);
      KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
      uint64_t v38 = *(void *)&v55[0];
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
      char v54 = 8;
      lazy protocol witness table accessor for type [String] and conformance <A> [A](&lazy protocol witness table cache variable for type [String] and conformance <A> [A], &demangling cache variable for type metadata for [String]);
      KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
      uint64_t v39 = *(void *)&v55[0];
      if (v38)
      {
        id v40 = objc_allocWithZone((Class)type metadata accessor for SILFlipBookDesc());
        id v41 = SILFlipBookDesc.init(_:_:_:)(v48, v38, v39);
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v41 = 0;
      }
      (*(void (**)(char *, uint64_t))(v49 + 8))(v7, v4);
      unint64_t v42 = v57;
      *(void *)&v57[OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_flipbook] = v41;
      uint64_t v56 = 0;
      memset(v55, 0, sizeof(v55));
      uint64_t v43 = v50;
      swift_beginAccess();
      outlined assign with take of SILFileHandle?((uint64_t)v55, v43);
      swift_endAccess();
      uint64_t v44 = v52;
      swift_beginAccess();
      *uint64_t v44 = 0;

      swift_release();
      BOOL v45 = (objc_class *)type metadata accessor for SILIndicatorDesc();
      v53.receiver = v42;
      v53.super_class = v45;
      id v12 = objc_msgSendSuper2(&v53, sel_init);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
      return (uint64_t)v12;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id SILFlipBookDesc.__allocating_init(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return SILFlipBookDesc.init(_:_:_:)(a1, a2, a3);
}

uint64_t SILIndicatorDesc.__ivar_destroyer()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  outlined destroy of SILFileHandle?(v0 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_blobHandle);
  return swift_release();
}

id SILIndicatorDesc.__deallocating_deinit()
{
  return SILIndicatorDesc.__deallocating_deinit(&OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_frames, (uint64_t (*)(uint64_t))type metadata accessor for SILIndicatorDesc);
}

BOOL static SILIndicatorDesc.== infix(_:_:)(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F8EED0];
  uint64_t v4 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *a1) + 0xA8))();
  return v4 == (*(uint64_t (**)(void))((*v3 & *a2) + 0xA8))();
}

uint64_t protocol witness for Decodable.init(from:) in conformance SILIndicatorDesc@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 264))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t SILFlipBookTransitionPoint.startFrame.getter()
{
  return *(unsigned __int16 *)(v0 + OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame);
}

void SILFlipBookTransitionPoint.__allocating_init(_:_:_:)(uint64_t a1, __int16 a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  SILFlipBookTransitionPoint.init(_:_:_:)(a1, a2, a3);
}

void specialized MutableCollection<>.sort(by:)(char **a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v4 = specialized _ContiguousArrayBuffer._consumeAndCreateNew()((uint64_t)v4);
  }
  uint64_t v5 = *((void *)v4 + 2);
  v6[0] = (uint64_t)(v4 + 32);
  v6[1] = v5;
  specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(v6, a2);
  *a1 = v4;
}

uint64_t specialized MutableCollection<>.sort(by:)(unint64_t *a1, void (*a2)(void *))
{
  unint64_t v4 = *a1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *a1 = v4;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v4 & 0x8000000000000000) != 0
    || (v4 & 0x4000000000000000) != 0)
  {
    specialized _ArrayBuffer._consumeAndCreateNew()(v4);
    unint64_t v4 = v6;
    *a1 = v6;
  }
  uint64_t v7 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v9[0] = (v4 & 0xFFFFFFFFFFFFFF8) + 32;
  v9[1] = v7;
  a2(v9);
  return specialized Array._endMutation()();
}

uint64_t specialized MutableCollection<>.sort(by:)(void **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = specialized _ContiguousArrayBuffer._consumeAndCreateNew()(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  uint64_t result = specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(v5);
  *a1 = v2;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance SILFlipBookTransitionPoint.CodingKeys(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SILFlipBookTransitionPoint.CodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance SILFlipBookTransitionPoint.CodingKeys()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SILFlipBookTransitionPoint.CodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance SILFlipBookTransitionPoint.CodingKeys@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of SILFlipBookTransitionPoint.CodingKeys.init(rawValue:), *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance SILFlipBookTransitionPoint.CodingKeys(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x6172467472617473;
  if (*v1) {
    uint64_t v2 = 0x7365676E6172;
  }
  unint64_t v3 = 0xEA0000000000656DLL;
  if (*v1) {
    unint64_t v3 = 0xE600000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SILFlipBookTransitionPoint.CodingKeys()
{
  if (*v0) {
    return 0x7365676E6172;
  }
  else {
    return 0x6172467472617473;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SILFlipBookTransitionPoint.CodingKeys@<X0>(Swift::String string@<0:X0, 8:X1>, char *a2@<X8>)
{
  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of SILFlipBookTransitionPoint.CodingKeys.init(rawValue:), v3);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance SILFlipBookTransitionPoint.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SILFlipBookTransitionPoint.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SILFlipBookTransitionPoint.CodingKeys and conformance SILFlipBookTransitionPoint.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SILFlipBookTransitionPoint.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SILFlipBookTransitionPoint.CodingKeys and conformance SILFlipBookTransitionPoint.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

void SILFlipBookTransitionPoint.init(_:_:_:)(uint64_t a1, __int16 a2, uint64_t a3)
{
  unint64_t v6 = *(void *)(a3 + 16);
  if (v6 >= 2 && (*(void *)(a3 + 16) & 1) == 0)
  {
    if (v6 >> 61)
    {
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
    }
    else
    {
      unint64_t v28 = v6 >> 1;
      int v30 = v3;
      uint64_t v12 = swift_slowAlloc();
      unint64_t v13 = 0;
      uint64_t v31 = a1 + 32;
      uint64_t v27 = v12;
      uint64_t v14 = (float *)(v12 + 4);
      uint64_t v15 = (unint64_t *)(a3 + 40);
      float v16 = 0.0;
      do
      {
        unint64_t v21 = *(void *)(a3 + 16);
        if (v13 >= v21)
        {
          __break(1u);
LABEL_23:
          __break(1u);
LABEL_24:
          __break(1u);
LABEL_25:
          __break(1u);
LABEL_26:
          __break(1u);
LABEL_27:
          __break(1u);
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
          goto LABEL_30;
        }
        unint64_t v22 = *(v15 - 1);
        if ((v22 & 0x8000000000000000) != 0) {
          goto LABEL_23;
        }
        if (v22 >> 16) {
          goto LABEL_24;
        }
        unint64_t v23 = v13 + 1;
        if (v13 + 1 >= v21) {
          goto LABEL_25;
        }
        unint64_t v24 = *v15;
        if ((*v15 & 0x8000000000000000) != 0) {
          goto LABEL_26;
        }
        if (v24 >> 16) {
          goto LABEL_27;
        }
        *((_WORD *)v14 - 2) = v22;
        *((_WORD *)v14 - 1) = v24;
        *uint64_t v14 = v16;
        if ((a1 & 0xC000000000000001) != 0)
        {
          float v17 = *(float *)(MEMORY[0x261165AD0]() + OBJC_IVAR____TtC10SILManager9FrameDesc_time);
          swift_unknownObjectRelease();
          unint64_t v18 = (char *)MEMORY[0x261165AD0](*v15, a1);
          uint64_t v19 = OBJC_IVAR____TtC10SILManager9FrameDesc_time;
        }
        else
        {
          unint64_t v25 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v22 >= v25) {
            goto LABEL_28;
          }
          if (v24 >= v25) {
            goto LABEL_29;
          }
          uint64_t v19 = OBJC_IVAR____TtC10SILManager9FrameDesc_time;
          float v17 = *(float *)(*(void *)(v31 + 8 * v22) + OBJC_IVAR____TtC10SILManager9FrameDesc_time);
          unint64_t v18 = (char *)*(id *)(v31 + 8 * v24);
        }
        float v20 = *(float *)&v18[v19];

        float v16 = v16 + (float)((float)(v20 + 0.008) - v17);
        v14 += 2;
        v15 += 2;
        unint64_t v13 = v23 + 1;
      }
      while (v23 + 1 < v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_WORD *)&v30[OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame] = a2;
      uint64_t v26 = (uint64_t *)&v30[OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_rangesBuffer];
      uint64_t *v26 = v27;
      v26[1] = v28;
      if (v6 >> 33) {
        goto LABEL_31;
      }
      *(_DWORD *)&v30[OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_rangesCount] = v28;
      *(void *)&v30[OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_ranges] = v27;

      v32.receiver = v30;
      v32.super_class = (Class)type metadata accessor for SILFlipBookTransitionPoint();
      objc_msgSendSuper2(&v32, sel_init);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v8 = Log.unsafeMutableAddressor();
    swift_beginAccess();
    uint64_t v9 = *v8;
    swift_retain();
    _StringGuts.grow(_:)(23);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v33 = v6;
    v10._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, unint64_t, unint64_t))(*(void *)v9 + 144))(6, 0xD000000000000015, 0x800000025B6A0790);
    swift_release();
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type SILError and conformance SILError();
    swift_allocError();
    *(void *)uint64_t v11 = 0;
    *(void *)(v11 + 8) = 0;
    *(unsigned char *)(v11 + 16) = 14;
    swift_willThrow();
    type metadata accessor for SILFlipBookTransitionPoint();
    swift_deallocPartialClassInstance();
  }
}

void *SILFlipBookDesc.kFrameDuration.unsafeMutableAddressor()
{
  return &static SILFlipBookDesc.kFrameDuration;
}

id SILFlipBookTransitionPoint.__deallocating_deinit()
{
  return SILIndicatorDesc.__deallocating_deinit(&OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_ranges, (uint64_t (*)(uint64_t))type metadata accessor for SILFlipBookTransitionPoint);
}

id SILIndicatorDesc.__deallocating_deinit(void *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = MEMORY[0x261166620](*(void *)&v2[*a1], -1, -1);
  v6.receiver = v2;
  v6.super_class = (Class)a2(v4);
  return objc_msgSendSuper2(&v6, sel_dealloc);
}

id @objc SILIndicatorDesc.__deallocating_deinit(char *a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v5 = *(void *)&a1[*a3];
  objc_super v6 = a1;
  uint64_t v7 = MEMORY[0x261166620](v5, -1, -1);
  v9.receiver = v6;
  v9.super_class = (Class)a4(v7);
  return objc_msgSendSuper2(&v9, sel_dealloc);
}

id @objc SILIndicatorDesc.name.getter(uint64_t a1, uint64_t a2, void *a3)
{
  Swift::String v3 = (uint64_t *)(a1 + *a3);
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  swift_bridgeObjectRetain();
  objc_super v6 = (void *)MEMORY[0x261165820](v4, v5);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t SILFlipBookState.name.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC10SILManager16SILFlipBookState_name);
  swift_bridgeObjectRetain();
  return v1;
}

id SILFlipBookState.selfTransition.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC10SILManager16SILFlipBookState_selfTransition);
}

uint64_t SILFlipBookState.transitions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SILFlipBookState.delayed.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10SILManager16SILFlipBookState_delayed);
}

id SILFlipBookState.__allocating_init(_:name:transitions:delayedStates:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v11 = objc_allocWithZone(v5);
  return SILFlipBookState.init(_:name:transitions:delayedStates:)(a1, a2, a3, a4, a5);
}

id SILFlipBookState.init(_:name:transitions:delayedStates:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  v72._uint64_t countAndFlagsBits = a2;
  uint64_t v68 = a4 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(a4 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a4 + 64);
  int64_t v69 = (unint64_t)(v8 + 63) >> 6;
  id v63 = v5;
  id v11 = 0;
  int64_t v12 = 0;
  long long v65 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    uint64_t v75 = v11;
    if (!v10) {
      break;
    }
    unint64_t v13 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v14 = v13 | (v12 << 6);
LABEL_17:
    uint64_t v19 = (uint64_t *)(*(void *)(a4 + 48) + 16 * v14);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    uint64_t v22 = *(void *)(*(void *)(a4 + 56) + 8 * v14);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v23 = specialized static SILFlipBookTransitionPoint.parseTransitionPoints(_:_:)(a1, v22);
    if (v6)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_55;
    }
    unint64_t v24 = v23;
    BOOL v25 = v20 == v72._countAndFlagsBits && v21 == (void)a3;
    if (v25 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v24 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v43 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v43 != 1) {
          goto LABEL_53;
        }
      }
      else if (*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) != 1)
      {
        goto LABEL_53;
      }
      if ((v24 & 0xC000000000000001) != 0)
      {
        int v44 = *(_DWORD *)(MEMORY[0x261165AD0](0, v24)
                        + OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_rangesCount);
        swift_unknownObjectRelease();
        if (v44 != 1) {
          goto LABEL_53;
        }
        unsigned int v45 = *(unsigned __int16 *)(MEMORY[0x261165AD0](0, v24)
                                  + OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame);
        swift_unknownObjectRelease();
        uint64_t v46 = *(unsigned __int16 **)(MEMORY[0x261165AD0](0, v24)
                                   + OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_ranges);
        swift_unknownObjectRelease();
        if (v45 < *v46
          || (unsigned int v47 = *(unsigned __int16 *)(MEMORY[0x261165AD0](0, v24)
                                        + OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame),
              swift_unknownObjectRelease(),
              uint64_t v48 = *(void *)(MEMORY[0x261165AD0](0, v24)
                              + OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_ranges),
              swift_unknownObjectRelease(),
              *(unsigned __int16 *)(v48 + 2) < v47))
        {
LABEL_53:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          uint64_t v49 = Log.unsafeMutableAddressor();
          swift_beginAccess();
          uint64_t v50 = *v49;
          swift_retain();
          _StringGuts.grow(_:)(31);
          swift_bridgeObjectRelease();
          v51._uint64_t countAndFlagsBits = v72._countAndFlagsBits;
          v51._object = a3;
          String.append(_:)(v51);
          swift_bridgeObjectRelease();
          v52._uint64_t countAndFlagsBits = 33;
          v52._object = (void *)0xE100000000000000;
          String.append(_:)(v52);
          (*(void (**)(uint64_t, unint64_t, unint64_t))(*(void *)v50 + 144))(6, 0xD00000000000001CLL, 0x800000025B6A07E0);
          swift_release();
          swift_bridgeObjectRelease();
          lazy protocol witness table accessor for type SILError and conformance SILError();
          swift_allocError();
          *(void *)uint64_t v53 = 0;
          *(void *)(v53 + 8) = 0;
          *(unsigned char *)(v53 + 16) = 14;
          swift_willThrow();
          swift_release();
LABEL_55:

          type metadata accessor for SILFlipBookState();
          return (id)swift_deallocPartialClassInstance();
        }
        int v29 = (char *)MEMORY[0x261165AD0](0, v24);
      }
      else
      {
        if (!*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_72:
          __break(1u);
          goto LABEL_73;
        }
        uint64_t v26 = *(char **)(v24 + 32);
        if (*(_DWORD *)&v26[OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_rangesCount] != 1) {
          goto LABEL_53;
        }
        unsigned int v27 = *(unsigned __int16 *)&v26[OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame];
        unint64_t v28 = *(unsigned __int16 **)&v26[OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_ranges];
        if (v27 < *v28 || v28[1] < v27) {
          goto LABEL_53;
        }
        int v29 = v26;
      }
      id v11 = v29;
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      double v74 = v65;
      unint64_t v31 = specialized __RawDictionaryStorage.find<A>(_:)(v20, v21);
      uint64_t v32 = v65[2];
      BOOL v33 = (v30 & 1) == 0;
      uint64_t v34 = v32 + v33;
      if (__OFADD__(v32, v33)) {
        goto LABEL_74;
      }
      if (v65[3] >= v34)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          char v67 = v30;
          specialized _NativeDictionary.copy()();
          char v30 = v67;
        }
      }
      else
      {
        char v66 = v30;
        specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v34, isUniquelyReferenced_nonNull_native);
        unint64_t v35 = specialized __RawDictionaryStorage.find<A>(_:)(v20, v21);
        int v37 = v36 & 1;
        char v30 = v66;
        if ((v66 & 1) != v37) {
          goto LABEL_77;
        }
        unint64_t v31 = v35;
      }
      uint64_t v38 = v74;
      long long v65 = v74;
      if (v30)
      {
        uint64_t v39 = v74[7];
        swift_bridgeObjectRelease();
        *(void *)(v39 + 8 * v31) = v24;
      }
      else
      {
        v74[(v31 >> 6) + 8] |= 1 << v31;
        id v40 = (uint64_t *)(v38[6] + 16 * v31);
        *id v40 = v20;
        v40[1] = v21;
        *(void *)(v38[7] + 8 * v31) = v24;
        uint64_t v41 = v38[2];
        BOOL v15 = __OFADD__(v41, 1);
        uint64_t v42 = v41 + 1;
        if (v15) {
          goto LABEL_75;
        }
        v38[2] = v42;
        swift_bridgeObjectRetain();
      }
      id v11 = v75;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  BOOL v15 = __OFADD__(v12++, 1);
  if (v15) {
    goto LABEL_72;
  }
  if (v12 >= v69)
  {
    swift_bridgeObjectRelease();
    swift_release();
    long long v55 = v63;
    uint64_t countAndFlagsBits = v72._countAndFlagsBits;
    float v16 = v65;
    goto LABEL_58;
  }
  float v16 = v65;
  unint64_t v17 = *(void *)(v68 + 8 * v12);
  if (v17)
  {
LABEL_16:
    unint64_t v10 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v12 << 6);
    goto LABEL_17;
  }
  int64_t v18 = v12 + 1;
  if (v12 + 1 >= v69) {
    goto LABEL_57;
  }
  unint64_t v17 = *(void *)(v68 + 8 * v18);
  if (v17) {
    goto LABEL_15;
  }
  int64_t v18 = v12 + 2;
  if (v12 + 2 >= v69) {
    goto LABEL_57;
  }
  unint64_t v17 = *(void *)(v68 + 8 * v18);
  if (v17)
  {
LABEL_15:
    int64_t v12 = v18;
    goto LABEL_16;
  }
  int64_t v18 = v12 + 3;
  if (v12 + 3 < v69)
  {
    unint64_t v17 = *(void *)(v68 + 8 * v18);
    if (!v17)
    {
      while (1)
      {
        int64_t v12 = v18 + 1;
        if (__OFADD__(v18, 1)) {
          break;
        }
        if (v12 >= v69) {
          goto LABEL_57;
        }
        unint64_t v17 = *(void *)(v68 + 8 * v12);
        ++v18;
        if (v17) {
          goto LABEL_16;
        }
      }
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
      goto LABEL_76;
    }
    goto LABEL_15;
  }
LABEL_57:
  swift_bridgeObjectRelease();
  swift_release();
  long long v55 = v63;
  uint64_t countAndFlagsBits = v72._countAndFlagsBits;
LABEL_58:
  uint64_t v57 = (uint64_t *)&v55[OBJC_IVAR____TtC10SILManager16SILFlipBookState_name];
  *uint64_t v57 = countAndFlagsBits;
  v57[1] = (uint64_t)a3;
  *(void *)&v55[OBJC_IVAR____TtC10SILManager16SILFlipBookState_transitions] = v16;
  if (v11)
  {
    *(void *)&v55[OBJC_IVAR____TtC10SILManager16SILFlipBookState_selfTransition] = v11;
    char v58 = a5;
    if (a5)
    {
      uint64_t v59 = *(void *)(a5 + 16);
      if (v59)
      {
        uint64_t v60 = (void *)(a5 + 40);
        while (1)
        {
          BOOL v61 = *(v60 - 1) == countAndFlagsBits && *v60 == (void)a3;
          if (v61 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            break;
          }
          v60 += 2;
          if (!--v59) {
            goto LABEL_68;
          }
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char v58 = 1;
      }
      else
      {
LABEL_68:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char v58 = 0;
      }
    }
    v55[OBJC_IVAR____TtC10SILManager16SILFlipBookState_delayed] = v58;

    v72._object = v55;
    uint64_t v73 = type metadata accessor for SILFlipBookState();
    return objc_msgSendSuper2((objc_super *)&v72._object, sel_init);
  }
LABEL_76:
  __break(1u);
LABEL_77:
  id result = (id)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t SILFlipBookState.__ivar_destroyer()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

id SILFlipBookState.__deallocating_deinit()
{
  return SILMgrCommonBase.__deallocating_deinit(type metadata accessor for SILFlipBookState);
}

float static SILFlipBookDesc.kFrameDuration.getter()
{
  return 0.008;
}

Class @objc SILConstraints.devices.getter()
{
  swift_bridgeObjectRetain();
  v0.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v0.super.isa;
}

uint64_t SILFlipBookDesc.states.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SILFlipBookDesc.statesInfo.getter()
{
  return swift_bridgeObjectRetain();
}

id SILFlipBookDesc.init(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v32 = (char *)MEMORY[0x263F8EE80];
  uint64_t v27 = a2 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a2 + 64);
  int64_t v28 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v26 = v3;
  swift_bridgeObjectRetain();
  int64_t v10 = 0;
  if (v9) {
    goto LABEL_6;
  }
LABEL_7:
  if (__OFADD__(v10++, 1))
  {
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    id result = (id)swift_release();
    __break(1u);
    return result;
  }
  if (v10 >= v28) {
    goto LABEL_27;
  }
  unint64_t v15 = *(void *)(v27 + 8 * v10);
  if (v15) {
    goto LABEL_17;
  }
  int64_t v16 = v10 + 1;
  if (v10 + 1 >= v28)
  {
LABEL_27:
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    BOOL v25 = (char *)specialized _copyCollectionToContiguousArray<A>(_:)(a2);
    swift_bridgeObjectRelease();
    unint64_t v31 = v25;
    swift_retain();
    specialized MutableCollection<>.sort(by:)(&v31, (uint64_t *)&v32);
    if (!v4)
    {
      swift_release();
      *(void *)&v26[OBJC_IVAR____TtC10SILManager15SILFlipBookDesc_states] = v31;
      *(void *)&v26[OBJC_IVAR____TtC10SILManager15SILFlipBookDesc_statesInfo] = v32;

      v30.receiver = v26;
      v30.super_class = (Class)type metadata accessor for SILFlipBookDesc();
      return objc_msgSendSuper2(&v30, sel_init);
    }
    goto LABEL_31;
  }
  unint64_t v15 = *(void *)(v27 + 8 * v16);
  if (!v15)
  {
    int64_t v16 = v10 + 2;
    if (v10 + 2 >= v28) {
      goto LABEL_27;
    }
    unint64_t v15 = *(void *)(v27 + 8 * v16);
    if (!v15)
    {
      int64_t v16 = v10 + 3;
      if (v10 + 3 < v28)
      {
        unint64_t v15 = *(void *)(v27 + 8 * v16);
        if (v15) {
          goto LABEL_16;
        }
        while (1)
        {
          int64_t v10 = v16 + 1;
          if (__OFADD__(v16, 1)) {
            goto LABEL_30;
          }
          if (v10 >= v28) {
            goto LABEL_27;
          }
          unint64_t v15 = *(void *)(v27 + 8 * v10);
          ++v16;
          if (v15) {
            goto LABEL_17;
          }
        }
      }
      goto LABEL_27;
    }
  }
LABEL_16:
  int64_t v10 = v16;
LABEL_17:
  unint64_t v9 = (v15 - 1) & v15;
  for (unint64_t i = __clz(__rbit64(v15)) + (v10 << 6); ; unint64_t i = v12 | (v10 << 6))
  {
    unint64_t v17 = (uint64_t *)(*(void *)(a2 + 48) + 16 * i);
    uint64_t v19 = *v17;
    int64_t v18 = (void *)v17[1];
    uint64_t v20 = *(void *)(*(void *)(a2 + 56) + 8 * i);
    objc_allocWithZone((Class)type metadata accessor for SILFlipBookState());
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v21 = SILFlipBookState.init(_:name:transitions:delayedStates:)(a1, v19, v18, v20, a3);
    if (v4) {
      break;
    }
    uint64_t v22 = (uint64_t)v21;
    if (v21)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v31 = v32;
      specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v22, v19, (uint64_t)v18, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!v9) {
        goto LABEL_7;
      }
    }
    else
    {
      id v11 = (void *)specialized Dictionary._Variant.removeValue(forKey:)(v19, (uint64_t)v18);
      swift_bridgeObjectRelease();

      if (!v9) {
        goto LABEL_7;
      }
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  type metadata accessor for SILFlipBookDesc();
  return (id)swift_deallocPartialClassInstance();
}

Swift::Bool __swiftcall SILFlipBookDesc.transitionSupported(fromState:toState:)(Swift::String fromState, Swift::String toState)
{
  uint64_t v3 = *(void *)(v2 + OBJC_IVAR____TtC10SILManager15SILFlipBookDesc_statesInfo);
  if (*(void *)(v3 + 16))
  {
    object = toState._object;
    uint64_t countAndFlagsBits = toState._countAndFlagsBits;
    uint64_t v6 = fromState._object;
    uint64_t v7 = fromState._countAndFlagsBits;
    swift_bridgeObjectRetain();
    unint64_t v8 = specialized __RawDictionaryStorage.find<A>(_:)(v7, (uint64_t)v6);
    if (v9)
    {
      int64_t v10 = (char *)*(id *)(*(void *)(v3 + 56) + 8 * v8);
      swift_bridgeObjectRelease();
      if (*(void *)(*(void *)&v10[OBJC_IVAR____TtC10SILManager16SILFlipBookState_transitions] + 16))
      {
        swift_bridgeObjectRetain();
        specialized __RawDictionaryStorage.find<A>(_:)(countAndFlagsBits, (uint64_t)object);
        if (v11)
        {
          swift_bridgeObjectRetain();

          swift_bridgeObjectRelease();
          Swift::Bool v12 = 1;
LABEL_10:
          swift_bridgeObjectRelease();
          return v12;
        }

        swift_bridgeObjectRelease();
      }
      else
      {
      }
    }
    Swift::Bool v12 = 0;
    goto LABEL_10;
  }
  return 0;
}

uint64_t SILFlipBookDesc.__ivar_destroyer()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id SILFlipBookDesc.__deallocating_deinit()
{
  return SILMgrCommonBase.__deallocating_deinit(type metadata accessor for SILFlipBookDesc);
}

uint64_t SILManifest.indicators.getter()
{
  return swift_bridgeObjectRetain();
}

id SILManifest.__allocating_init(indicators:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return SILManifest.init(indicators:)(a1);
}

id SILManifest.init(indicators:)(uint64_t a1)
{
  uint64_t v2 = OBJC_IVAR____TtC10SILManager11SILManifest_indicators;
  *(void *)&v1[OBJC_IVAR____TtC10SILManager11SILManifest_indicators] = a1;
  id v3 = v1;
  uint64_t countAndFlagsBits = getManifestDirectory()()._countAndFlagsBits;
  uint64_t v5 = getFilesMatching(directoryName:predicate:)(countAndFlagsBits);
  swift_bridgeObjectRelease();
  unint64_t v6 = *(void *)&v1[v2];
  swift_bridgeObjectRetain();

  if (v6 >> 62) {
    goto LABEL_24;
  }
  uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v7)
  {
    unint64_t v8 = 0;
    unint64_t v9 = *(void *)(v5 + 16);
    uint64_t v33 = v6 & 0xFFFFFFFFFFFFFF8;
    unint64_t v34 = v6;
    unint64_t v31 = v3;
    unint64_t v32 = v6 + 32;
    uint64_t v37 = v5 + 32;
    unint64_t v38 = v6 & 0xC000000000000001;
    unint64_t v35 = v9;
    uint64_t v36 = v5;
    while (1)
    {
      if (v38)
      {
        int64_t v10 = (void *)MEMORY[0x261165AD0](v8, v34);
      }
      else
      {
        if (v8 >= *(void *)(v33 + 16)) {
          goto LABEL_23;
        }
        int64_t v10 = *(id *)(v32 + 8 * v8);
      }
      char v11 = v10;
      if (__OFADD__(v8++, 1)) {
        break;
      }
      if (!v9) {
        goto LABEL_27;
      }
      id v3 = (char *)v7;
      unint64_t v13 = (void *)((char *)v10 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_blobName);
      swift_bridgeObjectRetain();
      uint64_t v14 = v37;
      unint64_t v6 = v9;
      while (1)
      {
        outlined init with copy of SILFileHandle(v14, (uint64_t)&v40);
        uint64_t v15 = v41;
        uint64_t v16 = v42;
        __swift_project_boxed_opaque_existential_1(&v40, v41);
        uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 24))(v15, v16);
        int64_t v18 = (void *)MEMORY[0x261165820](v17);
        swift_bridgeObjectRelease();
        id v19 = objc_msgSend(v18, sel_lastPathComponent);

        uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v22 = v21;

        if (v20 == *v13 && v22 == v13[1])
        {
          uint64_t v5 = v36;
          swift_bridgeObjectRelease();
          goto LABEL_5;
        }
        char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v24) {
          break;
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v40);
        v14 += 40;
        if (!--v6)
        {
          swift_bridgeObjectRelease();
LABEL_27:
          uint64_t v26 = Log.unsafeMutableAddressor();
          swift_beginAccess();
          uint64_t v27 = *v26;
          *(void *)&v43[0] = 0;
          *((void *)&v43[0] + 1) = 0xE000000000000000;
          swift_retain();
          _StringGuts.grow(_:)(22);
          swift_bridgeObjectRelease();
          *(void *)&v43[0] = 0xD000000000000014;
          *((void *)&v43[0] + 1) = 0x800000025B6A0840;
          uint64_t v28 = *(void *)((char *)v11 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_blobName);
          int v29 = *(void **)((char *)v11 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_blobName + 8);
          swift_bridgeObjectRetain();
          v30._uint64_t countAndFlagsBits = v28;
          v30._object = v29;
          String.append(_:)(v30);
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, void, void))(*(void *)v27 + 144))(6, *(void *)&v43[0], *((void *)&v43[0] + 1));
          swift_release();
          swift_bridgeObjectRelease();
          abort();
        }
      }
      uint64_t v5 = v36;
LABEL_5:
      unint64_t v9 = v35;
      swift_bridgeObjectRelease();
      outlined init with take of SILFileHandle(&v40, (uint64_t)v43);
      outlined init with take of SILFileHandle(v43, (uint64_t)v44);
      outlined init with copy of SILFileHandle((uint64_t)v44, (uint64_t)v43);
      (*(void (**)(long long *))((*MEMORY[0x263F8EED0] & *v11) + 0xE0))(v43);

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
      uint64_t v7 = (uint64_t)v3;
      if ((char *)v8 == v3)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v3 = v31;
        goto LABEL_26;
      }
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_26:
  v39.receiver = v3;
  v39.super_class = (Class)type metadata accessor for SILManifest();
  return objc_msgSendSuper2(&v39, sel_init);
}

BOOL closure #1 in SILManifest.init(indicators:)()
{
  v0._uint64_t countAndFlagsBits = 1852400174;
  v0._object = (void *)0xE400000000000000;
  return String.hasSuffix(_:)(v0);
}

void *SILManifest.indicatorFrom(type:)(uint64_t a1)
{
  unint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC10SILManager11SILManifest_indicators);
  if (v3 >> 62) {
    goto LABEL_18;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  if (v4)
  {
    while (1)
    {
      uint64_t v5 = (v3 & 0xC000000000000001) != 0 ? (void *)MEMORY[0x261165AD0](0, v3) : *(id *)(v3 + 32);
      unint64_t v6 = v5;
      uint64_t v7 = (void *)MEMORY[0x263F8EED0];
      if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v5) + 0xA8))() == a1) {
        break;
      }

      if (v4 != 1)
      {
        uint64_t v8 = 5;
        while (1)
        {
          unint64_t v9 = (v3 & 0xC000000000000001) != 0
             ? (void *)MEMORY[0x261165AD0](v8 - 4, v3)
             : *(id *)(v3 + 8 * v8);
          unint64_t v6 = v9;
          uint64_t v10 = v8 - 3;
          if (__OFADD__(v8 - 4, 1)) {
            break;
          }
          if ((*(uint64_t (**)(void))((*v7 & *v9) + 0xA8))() == a1) {
            goto LABEL_6;
          }

          ++v8;
          if (v10 == v4) {
            goto LABEL_15;
          }
        }
        __break(1u);
LABEL_18:
        swift_bridgeObjectRetain_n();
        uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
        if (v4) {
          continue;
        }
      }
      goto LABEL_15;
    }
LABEL_6:
    swift_bridgeObjectRelease_n();
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease_n();
    _StringGuts.grow(_:)(22);
    swift_bridgeObjectRelease();
    v11._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v11);
    swift_bridgeObjectRelease();
    v12._uint64_t countAndFlagsBits = 0x756F6620746F6E20;
    v12._object = (void *)0xEA0000000000646ELL;
    String.append(_:)(v12);
    unint64_t v6 = (void *)SILError.log()(0x6F74616369646E69, 0xEA00000000002072, 7u);
    uint64_t v14 = v13;
    char v16 = v15;
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type SILError and conformance SILError();
    swift_allocError();
    *(void *)uint64_t v17 = v6;
    *(void *)(v17 + 8) = v14;
    *(unsigned char *)(v17 + 16) = v16;
    swift_willThrow();
  }
  return v6;
}

void *SILManifest.indicatorFrom(name:)(uint64_t a1, void *a2)
{
  swift_bridgeObjectRetain();
  unint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = specialized Sequence.first(where:)(v4, a1, (uint64_t)a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v5)
  {
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    v6._uint64_t countAndFlagsBits = a1;
    v6._object = a2;
    String.append(_:)(v6);
    v7._uint64_t countAndFlagsBits = 0x6F6620746F6E2027;
    v7._object = (void *)0xEB00000000646E75;
    String.append(_:)(v7);
    uint64_t v8 = SILError.log()(0x6F74616369646E69, 0xEB00000000272072, 7u);
    uint64_t v5 = v9;
    char v11 = v10;
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type SILError and conformance SILError();
    swift_allocError();
    *(void *)uint64_t v12 = v8;
    *(void *)(v12 + 8) = v5;
    *(unsigned char *)(v12 + 16) = v11;
    swift_willThrow();
  }
  return v5;
}

Swift::Int __swiftcall SILManifest.maxIndicatorBpr()()
{
  return SILManifest.maxIndicatorBpr()(&OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_Bpr);
}

Swift::Int __swiftcall SILManifest.maxIndicatorExtent()()
{
  return SILManifest.maxIndicatorBpr()(&OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_extent);
}

uint64_t SILManifest.maxIndicatorBpr()(void *a1)
{
  unint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC10SILManager11SILManifest_indicators);
  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_27:
    swift_bridgeObjectRelease();
    uint64_t v6 = MEMORY[0x263F8EE78];
    unint64_t v15 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (v15) {
      goto LABEL_15;
    }
LABEL_28:
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_29;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
  if (!v4) {
    goto LABEL_27;
  }
LABEL_3:
  uint64_t v29 = MEMORY[0x263F8EE78];
  uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v6 = v29;
    if ((v3 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v8 = *(void *)(MEMORY[0x261165AD0](i, v3) + *a1);
        swift_unknownObjectRelease();
        unint64_t v10 = *(void *)(v29 + 16);
        unint64_t v9 = *(void *)(v29 + 24);
        if (v10 >= v9 >> 1) {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v9 > 1), v10 + 1, 1);
        }
        *(void *)(v29 + 16) = v10 + 1;
        *(void *)(v29 + 8 * v10 + 32) = v8;
      }
    }
    else
    {
      uint64_t v11 = 0;
      unint64_t v12 = *(void *)(v29 + 16);
      do
      {
        uint64_t v13 = *(void *)(*(void *)(v3 + 8 * v11 + 32) + *a1);
        unint64_t v14 = *(void *)(v29 + 24);
        if (v12 >= v14 >> 1) {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v14 > 1), v12 + 1, 1);
        }
        ++v11;
        *(void *)(v29 + 16) = v12 + 1;
        *(void *)(v29 + 8 * v12++ + 32) = v13;
      }
      while (v4 != v11);
    }
    swift_bridgeObjectRelease();
    unint64_t v15 = *(void *)(v29 + 16);
    if (v15)
    {
LABEL_15:
      int64_t v16 = *(void *)(v6 + 32);
      unint64_t v17 = v15 - 1;
      if (v15 != 1)
      {
        if (v15 < 5)
        {
          unint64_t v18 = 1;
          goto LABEL_21;
        }
        unint64_t v18 = v17 & 0xFFFFFFFFFFFFFFFCLL | 1;
        int64x2_t v19 = vdupq_n_s64(v16);
        uint64_t v20 = (int64x2_t *)(v6 + 56);
        unint64_t v21 = v17 & 0xFFFFFFFFFFFFFFFCLL;
        int64x2_t v22 = v19;
        do
        {
          int64x2_t v19 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v19, v20[-1]), (int8x16_t)v19, (int8x16_t)v20[-1]);
          int64x2_t v22 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v22, *v20), (int8x16_t)v22, *(int8x16_t *)v20);
          v20 += 2;
          v21 -= 4;
        }
        while (v21);
        int8x16_t v23 = vbslq_s8((int8x16_t)vcgtq_s64(v19, v22), (int8x16_t)v19, (int8x16_t)v22);
        uint64_t v24 = vextq_s8(v23, v23, 8uLL).u64[0];
        int64_t v16 = (int64_t)vbsl_s8((int8x8_t)vcgtd_s64(v23.i64[0], v24), *(int8x8_t *)v23.i8, (int8x8_t)v24);
        if (v17 != (v17 & 0xFFFFFFFFFFFFFFFCLL))
        {
LABEL_21:
          unint64_t v25 = v15 - v18;
          uint64_t v26 = (int64_t *)(v6 + 8 * v18 + 32);
          do
          {
            int64_t v28 = *v26++;
            int64_t v27 = v28;
            if (v16 <= v28) {
              int64_t v16 = v27;
            }
            --v25;
          }
          while (v25);
        }
      }
      swift_bridgeObjectRelease();
      return v16;
    }
    goto LABEL_28;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t one-time initialization function for manifest()
{
  Swift::String Manifest = getManifestDirectory()();
  getIgnoreManifestFileList(directoryName:)(Manifest._countAndFlagsBits, (uint64_t)Manifest._object);
  uint64_t v2 = v1;
  uint64_t v3 = getFilesMatching(directoryName:predicate:)(Manifest._countAndFlagsBits);
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = specialized _ArrayProtocol.filter(_:)(v3, v2);
    swift_bridgeObjectRelease();
    uint64_t v4 = v5;
  }
  swift_bridgeObjectRelease();
  if (*(void *)(v4 + 16))
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = specialized static SILManifest.manifestFromPlists(plists:)(v4);
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v8 = Log.unsafeMutableAddressor();
    swift_beginAccess();
    uint64_t v9 = *v8;
    swift_retain();
    _StringGuts.grow(_:)(29);
    swift_bridgeObjectRelease();
    String.append(_:)(Manifest);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, unint64_t, unint64_t))(*(void *)v9 + 144))(6, 0xD00000000000001BLL, 0x800000025B6A0FE0);
    swift_bridgeObjectRelease();
    uint64_t result = swift_release();
    uint64_t v6 = 0;
  }
  static SILManifest.manifest = v6;
  return result;
}

BOOL closure #1 in closure #1 in variable initialization expression of static SILManifest.manifest()
{
  v0._uint64_t countAndFlagsBits = 0x7473696C702ELL;
  v0._object = (void *)0xE600000000000000;
  return String.hasSuffix(_:)(v0);
}

uint64_t specialized _ArrayProtocol.filter(_:)(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  unint64_t v4 = a3;
  uint64_t v19 = MEMORY[0x263F8EE78];
  if (a3 >> 62) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      unint64_t v8 = 0;
      uint64_t v16 = v4 & 0xFFFFFFFFFFFFFF8;
      unint64_t v17 = v4 & 0xC000000000000001;
      unint64_t v15 = v4;
      while (v17)
      {
        id v9 = (id)MEMORY[0x261165AD0](v8, v4);
LABEL_9:
        unint64_t v10 = v9;
        unint64_t v11 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_17;
        }
        id v18 = v9;
        uint64_t v12 = a2;
        char v13 = a1(&v18);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return v12;
        }
        if (v13)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          unint64_t v4 = v15;
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
        else
        {
        }
        ++v8;
        if (v11 == v7)
        {
          uint64_t v12 = v19;
          goto LABEL_20;
        }
      }
      if (v8 < *(void *)(v16 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
      if (!v7) {
        goto LABEL_19;
      }
    }
    id v9 = *(id *)(v4 + 8 * v8 + 32);
    goto LABEL_9;
  }
LABEL_19:
  uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t *SILManifest.manifest.unsafeMutableAddressor()
{
  if (one-time initialization token for manifest != -1) {
    swift_once();
  }
  return &static SILManifest.manifest;
}

uint64_t static SILManifest.manifest.getter()
{
  if (one-time initialization token for manifest != -1) {
    swift_once();
  }
  uint64_t v0 = static SILManifest.manifest;
  id v1 = (id)static SILManifest.manifest;
  return v0;
}

uint64_t specialized Array.append<A>(contentsOf:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *id v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x261165AE0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *id v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = specialized Array._copyContents(initializing:)(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return specialized Array._endMutation()();
}

uint64_t SILManifest.__ivar_destroyer()
{
  return swift_bridgeObjectRelease();
}

id SILManifest.__deallocating_deinit()
{
  return SILMgrCommonBase.__deallocating_deinit(type metadata accessor for SILManifest);
}

id SILMgrCommonBase.__deallocating_deinit(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)()
{
  if (*v0) {
    return 0x35646D626F6C62;
  }
  else {
    return 0x6F74616369646E69;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized CodingKeys.init(stringValue:) in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t __deallocating_deinit in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)()
{
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(*(void *)(v0 + 24), *(void *)(v0 + 32));
  return swift_deallocClassInstance();
}

uint64_t init(from:) in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)>);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    type metadata accessor for IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)();
    swift_deallocPartialClassInstance();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SILIndicatorDesc]);
    char v10 = 0;
    lazy protocol witness table accessor for type [SILIndicatorDesc] and conformance <A> [A]();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    *(void *)(v1 + 16) = v9;
    char v10 = 1;
    lazy protocol witness table accessor for type Data and conformance Data();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(_OWORD *)(v1 + 24) = v9;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

uint64_t protocol witness for Decodable.init(from:) in conformance IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)();
  uint64_t v5 = swift_allocObject();
  uint64_t result = init(from:) in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)(a1);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(void *a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CGRect, Bool)>);
    char v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  BOOL v13 = a4 + 32;
  size_t v14 = 40 * v8;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v14);
  }
  swift_release();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    char v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
    char v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

void *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SILFileHandle>);
    char v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    char v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SILFileHandle);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CGRect, Bool)>);
    char v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  BOOL v13 = a4 + 32;
  size_t v14 = 40 * v8;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v14);
  }
  swift_bridgeObjectRelease();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CGRect>);
    char v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 32 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Range<Int>>);
    char v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t specialized _parseInteger<A, B>(ascii:radix:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = String.init<A>(_:)();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    int64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = static String._copying(_:)();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    int64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v7 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
  }
LABEL_7:
  unsigned int v11 = specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 & 0x1FFFF;
}

uint64_t specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(uint64_t *a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = a1[1];
  uint64_t result = _minimumMergeRunLength(_:)(v4);
  if (result >= v4)
  {
    if (v4 < 0) {
      goto LABEL_130;
    }
    if (v4) {
      return specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(0, v4, 1, a1);
    }
    return result;
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_129;
  }
  uint64_t v7 = result;
  v86 = a1;
  if (v4 > 1)
  {
    uint64_t v8 = v6 >> 1;
    type metadata accessor for SILFlipBookTransitionPoint();
    uint64_t result = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
    uint64_t v91 = (char *)((result & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v92 = result;
LABEL_12:
    Swift::Int v10 = 0;
    uint64_t v11 = *a1;
    uint64_t v87 = *a1 - 8;
    uint64_t v9 = MEMORY[0x263F8EE78];
    uint64_t v88 = v7;
    Swift::Int v89 = v4;
    uint64_t v90 = *a1;
    while (1)
    {
      Swift::Int v13 = v10++;
      if (v10 < v4)
      {
        unsigned int v14 = *(unsigned __int16 *)(*(void *)(v11 + 8 * v10)
                                  + OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame);
        unsigned int v15 = *(unsigned __int16 *)(*(void *)(v11 + 8 * v13)
                                  + OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame);
        Swift::Int v10 = v13 + 2;
        if (v13 + 2 < v4)
        {
          unsigned int v16 = v14;
          while (1)
          {
            unsigned int v17 = *(unsigned __int16 *)(*(void *)(v11 + 8 * v10)
                                      + OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame);
            if (v14 < v15 == v17 >= v16) {
              break;
            }
            ++v10;
            unsigned int v16 = v17;
            if (v4 == v10)
            {
              Swift::Int v10 = v4;
              break;
            }
          }
        }
        if (v14 < v15)
        {
          if (v10 < v13) {
            goto LABEL_131;
          }
          if (v13 < v10)
          {
            id v18 = (uint64_t *)(v87 + 8 * v10);
            Swift::Int v19 = v10;
            Swift::Int v20 = v13;
            unint64_t v21 = (uint64_t *)(v11 + 8 * v13);
            do
            {
              if (v20 != --v19)
              {
                if (!v11) {
                  goto LABEL_136;
                }
                uint64_t v22 = *v21;
                *unint64_t v21 = *v18;
                uint64_t *v18 = v22;
              }
              ++v20;
              --v18;
              ++v21;
            }
            while (v20 < v19);
          }
        }
      }
      if (v10 < v4)
      {
        if (__OFSUB__(v10, v13)) {
          goto LABEL_128;
        }
        if (v10 - v13 < v7)
        {
          Swift::Int v23 = v13 + v7;
          if (__OFADD__(v13, v7)) {
            goto LABEL_132;
          }
          if (v23 >= v4) {
            Swift::Int v23 = v4;
          }
          if (v23 < v13)
          {
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
            return result;
          }
          if (v10 != v23)
          {
            uint64_t v24 = (uint64_t *)(v87 + 8 * v10);
            do
            {
              uint64_t v25 = *(void *)(v11 + 8 * v10);
              Swift::Int v26 = v13;
              int64_t v27 = v24;
              do
              {
                uint64_t v28 = *v27;
                if (*(unsigned __int16 *)(v25 + OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame) >= *(unsigned __int16 *)(*v27 + OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame)) {
                  break;
                }
                if (!v11) {
                  goto LABEL_134;
                }
                *int64_t v27 = v25;
                v27[1] = v28;
                --v27;
                ++v26;
              }
              while (v10 != v26);
              ++v10;
              ++v24;
            }
            while (v10 != v23);
            Swift::Int v10 = v23;
          }
        }
      }
      if (v10 < v13) {
        goto LABEL_123;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v9 + 16) + 1, 1, (char *)v9);
        uint64_t v9 = result;
      }
      unint64_t v30 = *(void *)(v9 + 16);
      unint64_t v29 = *(void *)(v9 + 24);
      unint64_t v12 = v30 + 1;
      uint64_t v11 = v90;
      if (v30 >= v29 >> 1)
      {
        uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v29 > 1), v30 + 1, 1, (char *)v9);
        uint64_t v11 = v90;
        uint64_t v9 = result;
      }
      *(void *)(v9 + 16) = v12;
      uint64_t v31 = v9 + 32;
      unint64_t v32 = (Swift::Int *)(v9 + 32 + 16 * v30);
      Swift::Int *v32 = v13;
      v32[1] = v10;
      if (v30)
      {
        while (1)
        {
          unint64_t v33 = v12 - 1;
          if (v12 >= 4)
          {
            unint64_t v38 = v31 + 16 * v12;
            uint64_t v39 = *(void *)(v38 - 64);
            uint64_t v40 = *(void *)(v38 - 56);
            BOOL v44 = __OFSUB__(v40, v39);
            uint64_t v41 = v40 - v39;
            if (v44) {
              goto LABEL_112;
            }
            uint64_t v43 = *(void *)(v38 - 48);
            uint64_t v42 = *(void *)(v38 - 40);
            BOOL v44 = __OFSUB__(v42, v43);
            uint64_t v36 = v42 - v43;
            char v37 = v44;
            if (v44) {
              goto LABEL_113;
            }
            unint64_t v45 = v12 - 2;
            uint64_t v46 = (uint64_t *)(v31 + 16 * (v12 - 2));
            uint64_t v48 = *v46;
            uint64_t v47 = v46[1];
            BOOL v44 = __OFSUB__(v47, v48);
            uint64_t v49 = v47 - v48;
            if (v44) {
              goto LABEL_114;
            }
            BOOL v44 = __OFADD__(v36, v49);
            uint64_t v50 = v36 + v49;
            if (v44) {
              goto LABEL_116;
            }
            if (v50 >= v41)
            {
              uint64_t v68 = (uint64_t *)(v31 + 16 * v33);
              uint64_t v70 = *v68;
              uint64_t v69 = v68[1];
              BOOL v44 = __OFSUB__(v69, v70);
              uint64_t v71 = v69 - v70;
              if (v44) {
                goto LABEL_122;
              }
              BOOL v61 = v36 < v71;
              goto LABEL_82;
            }
          }
          else
          {
            if (v12 != 3)
            {
              uint64_t v62 = *(void *)(v9 + 32);
              uint64_t v63 = *(void *)(v9 + 40);
              BOOL v44 = __OFSUB__(v63, v62);
              uint64_t v55 = v63 - v62;
              char v56 = v44;
              goto LABEL_76;
            }
            uint64_t v35 = *(void *)(v9 + 32);
            uint64_t v34 = *(void *)(v9 + 40);
            BOOL v44 = __OFSUB__(v34, v35);
            uint64_t v36 = v34 - v35;
            char v37 = v44;
          }
          if (v37) {
            goto LABEL_115;
          }
          unint64_t v45 = v12 - 2;
          Swift::String v51 = (uint64_t *)(v31 + 16 * (v12 - 2));
          uint64_t v53 = *v51;
          uint64_t v52 = v51[1];
          BOOL v54 = __OFSUB__(v52, v53);
          uint64_t v55 = v52 - v53;
          char v56 = v54;
          if (v54) {
            goto LABEL_117;
          }
          uint64_t v57 = (uint64_t *)(v31 + 16 * v33);
          uint64_t v59 = *v57;
          uint64_t v58 = v57[1];
          BOOL v44 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v44) {
            goto LABEL_119;
          }
          if (__OFADD__(v55, v60)) {
            goto LABEL_121;
          }
          if (v55 + v60 >= v36)
          {
            BOOL v61 = v36 < v60;
LABEL_82:
            if (v61) {
              unint64_t v33 = v45;
            }
            goto LABEL_84;
          }
LABEL_76:
          if (v56) {
            goto LABEL_118;
          }
          long long v64 = (uint64_t *)(v31 + 16 * v33);
          uint64_t v66 = *v64;
          uint64_t v65 = v64[1];
          BOOL v44 = __OFSUB__(v65, v66);
          uint64_t v67 = v65 - v66;
          if (v44) {
            goto LABEL_120;
          }
          if (v67 < v55) {
            goto LABEL_14;
          }
LABEL_84:
          unint64_t v72 = v33 - 1;
          if (v33 - 1 >= v12)
          {
            __break(1u);
LABEL_109:
            __break(1u);
LABEL_110:
            __break(1u);
LABEL_111:
            __break(1u);
LABEL_112:
            __break(1u);
LABEL_113:
            __break(1u);
LABEL_114:
            __break(1u);
LABEL_115:
            __break(1u);
LABEL_116:
            __break(1u);
LABEL_117:
            __break(1u);
LABEL_118:
            __break(1u);
LABEL_119:
            __break(1u);
LABEL_120:
            __break(1u);
LABEL_121:
            __break(1u);
LABEL_122:
            __break(1u);
LABEL_123:
            __break(1u);
LABEL_124:
            __break(1u);
LABEL_125:
            __break(1u);
LABEL_126:
            __break(1u);
LABEL_127:
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
            goto LABEL_133;
          }
          if (!v11) {
            goto LABEL_135;
          }
          uint64_t v73 = v9;
          double v74 = (uint64_t *)(v31 + 16 * v72);
          uint64_t v75 = *v74;
          double v76 = (void *)(v31 + 16 * v33);
          uint64_t v77 = v76[1];
          uint64_t result = specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v11 + 8 * *v74), (char *)(v11 + 8 * *v76), v11 + 8 * v77, v91);
          if (v1) {
            goto LABEL_92;
          }
          if (v77 < v75) {
            goto LABEL_109;
          }
          if (v33 > *(void *)(v73 + 16)) {
            goto LABEL_110;
          }
          *double v74 = v75;
          *(void *)(v31 + 16 * v72 + 8) = v77;
          unint64_t v78 = *(void *)(v73 + 16);
          if (v33 >= v78) {
            goto LABEL_111;
          }
          uint64_t v9 = v73;
          unint64_t v12 = v78 - 1;
          uint64_t result = (uint64_t)memmove((void *)(v31 + 16 * v33), v76 + 2, 16 * (v78 - 1 - v33));
          *(void *)(v73 + 16) = v78 - 1;
          uint64_t v11 = v90;
          if (v78 <= 2) {
            goto LABEL_14;
          }
        }
      }
      unint64_t v12 = 1;
LABEL_14:
      uint64_t v7 = v88;
      Swift::Int v4 = v89;
      if (v10 >= v89)
      {
        uint64_t v2 = v1;
        goto LABEL_95;
      }
    }
  }
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v92 = MEMORY[0x263F8EE78];
  uint64_t v91 = (char *)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
  if (v4 == 1) {
    goto LABEL_12;
  }
  unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_95:
  uint64_t result = v9;
  if (v12 >= 2)
  {
    uint64_t v79 = *v86;
    do
    {
      unint64_t v80 = v12 - 2;
      if (v12 < 2) {
        goto LABEL_124;
      }
      if (!v79) {
        goto LABEL_137;
      }
      uint64_t v81 = result;
      uint64_t v82 = *(void *)(result + 32 + 16 * v80);
      uint64_t v83 = *(void *)(result + 32 + 16 * (v12 - 1) + 8);
      uint64_t result = specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v79 + 8 * v82), (char *)(v79 + 8 * *(void *)(result + 32 + 16 * (v12 - 1))), v79 + 8 * v83, v91);
      if (v2) {
        break;
      }
      if (v83 < v82) {
        goto LABEL_125;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v81);
        uint64_t v81 = result;
      }
      if (v80 >= *(void *)(v81 + 16)) {
        goto LABEL_126;
      }
      uint64_t v84 = (void *)(v81 + 32 + 16 * v80);
      *uint64_t v84 = v82;
      v84[1] = v83;
      unint64_t v85 = *(void *)(v81 + 16);
      if (v12 > v85) {
        goto LABEL_127;
      }
      memmove((void *)(v81 + 32 + 16 * (v12 - 1)), (const void *)(v81 + 32 + 16 * v12), 16 * (v85 - v12));
      uint64_t result = v81;
      *(void *)(v81 + 16) = v85 - 1;
      unint64_t v12 = v85 - 1;
    }
    while (v85 > 2);
  }
LABEL_92:
  swift_bridgeObjectRelease();
  *(void *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
  specialized Array._endMutation()();
  return swift_bridgeObjectRelease();
}

{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  Swift::Int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  int v20;
  Swift::Int v21;
  Swift::Int v22;
  Swift::Int v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  uint64_t *v28;
  Swift::Int v29;
  Swift::Int v30;
  uint64_t *v31;
  uint64_t v32;
  Swift::Int v33;
  Swift::Int v34;
  uint64_t *v35;
  uint64_t v36;
  Swift::Int v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  void *v42;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  Swift::Int *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  unint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  uint64_t v71;
  char v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  BOOL v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  void *v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  unint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  Swift::Int v109;
  Swift::Int v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;

  uint64_t v2 = v1;
  Swift::Int v4 = a1[1];
  uint64_t result = _minimumMergeRunLength(_:)(v4);
  if (result >= v4)
  {
    if (v4 < 0) {
      goto LABEL_152;
    }
    if (v4) {
      return specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(0, v4, 1, a1);
    }
    return result;
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_151;
  }
  uint64_t v7 = result;
  v106 = a1;
  if (v4 <= 1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    v113 = MEMORY[0x263F8EE78];
    v112 = (char *)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      Swift::Int v13 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_117:
      uint64_t result = v9;
      if (v13 >= 2)
      {
        v99 = *v106;
        do
        {
          v100 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_146;
          }
          if (!v99) {
            goto LABEL_159;
          }
          v101 = result;
          v102 = *(void *)(result + 32 + 16 * v100);
          v103 = *(void *)(result + 32 + 16 * (v13 - 1) + 8);
          uint64_t result = specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v99 + 8 * v102), (char *)(v99 + 8 * *(void *)(result + 32 + 16 * (v13 - 1))), v99 + 8 * v103, v112);
          if (v2) {
            break;
          }
          if (v103 < v102) {
            goto LABEL_147;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v101);
            v101 = result;
          }
          if (v100 >= *(void *)(v101 + 16)) {
            goto LABEL_148;
          }
          v104 = (void *)(v101 + 32 + 16 * v100);
          *v104 = v102;
          v104[1] = v103;
          v105 = *(void *)(v101 + 16);
          if (v13 > v105) {
            goto LABEL_149;
          }
          memmove((void *)(v101 + 32 + 16 * (v13 - 1)), (const void *)(v101 + 32 + 16 * v13), 16 * (v105 - v13));
          uint64_t result = v101;
          *(void *)(v101 + 16) = v105 - 1;
          Swift::Int v13 = v105 - 1;
        }
        while (v105 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(void *)((v113 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      specialized Array._endMutation()();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v8 = v6 >> 1;
    type metadata accessor for SILIndicatorDesc();
    uint64_t result = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
    v112 = (char *)((result & 0xFFFFFFFFFFFFFF8) + 32);
    v113 = result;
  }
  Swift::Int v10 = 0;
  uint64_t v11 = *a1;
  v107 = v11 - 8;
  v108 = v7;
  uint64_t v9 = MEMORY[0x263F8EE78];
  unint64_t v12 = 0x26A506000uLL;
  v109 = v4;
  v111 = v11;
  while (1)
  {
    unsigned int v14 = v10++;
    if (v10 >= v4)
    {
      unint64_t v21 = v14;
    }
    else
    {
      unsigned int v15 = *(void *)(v12 + 3168);
      unsigned int v16 = (uint64_t *)(*(void *)(v11 + 8 * v10) + v15);
      uint64_t result = *v16;
      unsigned int v17 = v16[1];
      id v18 = (void *)(*(void *)(v11 + 8 * v14) + v15);
      if (result == *v18 && v17 == v18[1])
      {
        unint64_t v21 = v14;
        uint64_t v22 = v14 + 2;
        if (v22 >= v4) {
          goto LABEL_42;
        }
        Swift::Int v20 = 0;
        do
        {
LABEL_27:
          uint64_t v24 = (uint64_t *)(*(void *)(v11 + 8 * v22) + v15);
          uint64_t result = *v24;
          uint64_t v25 = v24[1];
          Swift::Int v26 = (void *)(*(void *)(v11 + 8 * v10) + v15);
          if (result == *v26 && v25 == v26[1])
          {
            if (v20) {
              goto LABEL_35;
            }
          }
          else
          {
            uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if ((v20 ^ result)) {
              goto LABEL_34;
            }
            unsigned int v15 = *(void *)(v12 + 3168);
          }
          Swift::Int v23 = v22 + 1;
          Swift::Int v10 = v22;
          uint64_t v22 = v23;
        }
        while (v23 < v4);
        uint64_t v22 = v23;
      }
      else
      {
        uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
        Swift::Int v20 = result;
        unint64_t v21 = v14;
        uint64_t v22 = v14 + 2;
        if (v22 < v4)
        {
          unsigned int v15 = *(void *)(v12 + 3168);
          goto LABEL_27;
        }
      }
LABEL_34:
      Swift::Int v10 = v22;
      if (v20)
      {
LABEL_35:
        if (v22 < v21) {
          goto LABEL_155;
        }
        if (v21 < v22)
        {
          uint64_t v28 = (uint64_t *)(v107 + 8 * v22);
          unint64_t v29 = v22;
          unint64_t v30 = v21;
          uint64_t v31 = (uint64_t *)(v11 + 8 * v21);
          do
          {
            if (v30 != --v29)
            {
              if (!v11) {
                goto LABEL_158;
              }
              unint64_t v32 = *v31;
              char *v31 = *v28;
              unsigned __int16 *v28 = v32;
            }
            ++v30;
            --v28;
            ++v31;
          }
          while (v30 < v29);
        }
LABEL_42:
        Swift::Int v10 = v22;
      }
    }
    if (v10 >= v4) {
      goto LABEL_63;
    }
    if (__OFSUB__(v10, v21)) {
      goto LABEL_150;
    }
    if (v10 - v21 >= v108)
    {
LABEL_63:
      uint64_t v34 = v21;
      goto LABEL_64;
    }
    if (__OFADD__(v21, v108)) {
      goto LABEL_153;
    }
    unint64_t v33 = v21 + v108 >= v4 ? v4 : v21 + v108;
    if (v33 < v21) {
      break;
    }
    uint64_t v34 = v21;
    if (v10 != v33)
    {
      uint64_t v35 = (uint64_t *)(v107 + 8 * v10);
      do
      {
        uint64_t v36 = *(void *)(v11 + 8 * v10);
        char v37 = v34;
        unint64_t v38 = v35;
        do
        {
          uint64_t v39 = *(void *)(v12 + 3168);
          uint64_t v40 = (uint64_t *)(v36 + v39);
          uint64_t result = *v40;
          uint64_t v41 = v40[1];
          uint64_t v42 = (void *)(*v38 + v39);
          if (result == *v42 && v41 == v42[1]) {
            break;
          }
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            break;
          }
          if (!v11) {
            goto LABEL_156;
          }
          BOOL v44 = *v38;
          uint64_t v36 = v38[1];
          *unint64_t v38 = v36;
          v38[1] = v44;
          --v38;
          ++v37;
        }
        while (v10 != v37);
        ++v10;
        ++v35;
      }
      while (v10 != v33);
      Swift::Int v10 = v33;
      if (v33 < v34) {
        goto LABEL_145;
      }
      goto LABEL_65;
    }
LABEL_64:
    if (v10 < v34) {
      goto LABEL_145;
    }
LABEL_65:
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v9 + 16) + 1, 1, (char *)v9);
      uint64_t v9 = result;
    }
    uint64_t v46 = *(void *)(v9 + 16);
    unint64_t v45 = *(void *)(v9 + 24);
    Swift::Int v13 = v46 + 1;
    if (v46 >= v45 >> 1)
    {
      uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v45 > 1), v46 + 1, 1, (char *)v9);
      uint64_t v9 = result;
    }
    *(void *)(v9 + 16) = v13;
    uint64_t v47 = v9 + 32;
    uint64_t v48 = (Swift::Int *)(v9 + 32 + 16 * v46);
    *uint64_t v48 = v34;
    v48[1] = v10;
    if (v46)
    {
      uint64_t v11 = v111;
      v110 = v10;
      while (1)
      {
        uint64_t v49 = v13 - 1;
        if (v13 >= 4)
        {
          BOOL v54 = v47 + 16 * v13;
          uint64_t v55 = *(void *)(v54 - 64);
          char v56 = *(void *)(v54 - 56);
          uint64_t v60 = __OFSUB__(v56, v55);
          uint64_t v57 = v56 - v55;
          if (v60) {
            goto LABEL_134;
          }
          uint64_t v59 = *(void *)(v54 - 48);
          uint64_t v58 = *(void *)(v54 - 40);
          uint64_t v60 = __OFSUB__(v58, v59);
          uint64_t v52 = v58 - v59;
          uint64_t v53 = v60;
          if (v60) {
            goto LABEL_135;
          }
          BOOL v61 = v13 - 2;
          uint64_t v62 = (uint64_t *)(v47 + 16 * (v13 - 2));
          long long v64 = *v62;
          uint64_t v63 = v62[1];
          uint64_t v60 = __OFSUB__(v63, v64);
          uint64_t v65 = v63 - v64;
          if (v60) {
            goto LABEL_136;
          }
          uint64_t v60 = __OFADD__(v52, v65);
          uint64_t v66 = v52 + v65;
          if (v60) {
            goto LABEL_138;
          }
          if (v66 >= v57)
          {
            uint64_t v84 = (uint64_t *)(v47 + 16 * v49);
            v86 = *v84;
            unint64_t v85 = v84[1];
            uint64_t v60 = __OFSUB__(v85, v86);
            uint64_t v87 = v85 - v86;
            if (v60) {
              goto LABEL_144;
            }
            uint64_t v77 = v52 < v87;
            goto LABEL_102;
          }
        }
        else
        {
          if (v13 != 3)
          {
            unint64_t v78 = *(void *)(v9 + 32);
            uint64_t v79 = *(void *)(v9 + 40);
            uint64_t v60 = __OFSUB__(v79, v78);
            uint64_t v71 = v79 - v78;
            unint64_t v72 = v60;
            goto LABEL_96;
          }
          Swift::String v51 = *(void *)(v9 + 32);
          uint64_t v50 = *(void *)(v9 + 40);
          uint64_t v60 = __OFSUB__(v50, v51);
          uint64_t v52 = v50 - v51;
          uint64_t v53 = v60;
        }
        if (v53) {
          goto LABEL_137;
        }
        BOOL v61 = v13 - 2;
        uint64_t v67 = (uint64_t *)(v47 + 16 * (v13 - 2));
        uint64_t v69 = *v67;
        uint64_t v68 = v67[1];
        uint64_t v70 = __OFSUB__(v68, v69);
        uint64_t v71 = v68 - v69;
        unint64_t v72 = v70;
        if (v70) {
          goto LABEL_139;
        }
        uint64_t v73 = (uint64_t *)(v47 + 16 * v49);
        uint64_t v75 = *v73;
        double v74 = v73[1];
        uint64_t v60 = __OFSUB__(v74, v75);
        double v76 = v74 - v75;
        if (v60) {
          goto LABEL_141;
        }
        if (__OFADD__(v71, v76)) {
          goto LABEL_143;
        }
        if (v71 + v76 >= v52)
        {
          uint64_t v77 = v52 < v76;
LABEL_102:
          if (v77) {
            uint64_t v49 = v61;
          }
          goto LABEL_104;
        }
LABEL_96:
        if (v72) {
          goto LABEL_140;
        }
        unint64_t v80 = (uint64_t *)(v47 + 16 * v49);
        uint64_t v82 = *v80;
        uint64_t v81 = v80[1];
        uint64_t v60 = __OFSUB__(v81, v82);
        uint64_t v83 = v81 - v82;
        if (v60) {
          goto LABEL_142;
        }
        if (v83 < v71) {
          goto LABEL_14;
        }
LABEL_104:
        uint64_t v88 = v49 - 1;
        if (v49 - 1 >= v13)
        {
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        if (!v11) {
          goto LABEL_157;
        }
        Swift::Int v89 = v12;
        uint64_t v90 = v9;
        uint64_t v91 = v11;
        uint64_t v92 = (uint64_t *)(v47 + 16 * v88);
        uint64_t v93 = *v92;
        uint64_t v94 = v47;
        uint64_t v95 = v49;
        uint64_t v96 = (void *)(v47 + 16 * v49);
        uint64_t v97 = v96[1];
        uint64_t result = specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v91 + 8 * *v92), (char *)(v91 + 8 * *v96), v91 + 8 * v97, v112);
        if (v1) {
          goto LABEL_114;
        }
        if (v97 < v93) {
          goto LABEL_131;
        }
        if (v95 > *(void *)(v90 + 16)) {
          goto LABEL_132;
        }
        *uint64_t v92 = v93;
        *(void *)(v94 + 16 * v88 + 8) = v97;
        v98 = *(void *)(v90 + 16);
        if (v95 >= v98) {
          goto LABEL_133;
        }
        uint64_t v9 = v90;
        Swift::Int v13 = v98 - 1;
        uint64_t result = (uint64_t)memmove(v96, v96 + 2, 16 * (v98 - 1 - v95));
        uint64_t v47 = v94;
        *(void *)(v90 + 16) = v98 - 1;
        uint64_t v77 = v98 > 2;
        unint64_t v12 = v89;
        Swift::Int v10 = v110;
        uint64_t v11 = v111;
        if (!v77) {
          goto LABEL_14;
        }
      }
    }
    Swift::Int v13 = 1;
    uint64_t v11 = v111;
LABEL_14:
    Swift::Int v4 = v109;
    if (v10 >= v109)
    {
      uint64_t v2 = v1;
      goto LABEL_117;
    }
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  Swift::Int v11;
  Swift::Int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  char v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  Swift::Int v40;
  uint64_t v41;
  Swift::Int v42;
  uint64_t v43;
  uint64_t v44;
  long long v45;
  Swift::Int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v59;
  uint64_t v60;
  uint64_t v61;
  long long v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  Swift::Int *v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  BOOL v78;
  unint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  BOOL v88;
  uint64_t v89;
  char v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  BOOL v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  Swift::Int v124;
  Swift::Int v125;
  Swift::Int v126;
  Swift::Int v127;
  char *v128;
  char v129;
  uint64_t v130;
  uint64_t v131;
  void v132[3];
  uint64_t v133;
  uint64_t v134;
  long long v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t *v138;

  uint64_t v2 = v1;
  v138 = a1;
  uint64_t v3 = a1[1];
  uint64_t result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_153;
    }
    if (v3) {
      return specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(0, v3, 1, v138);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_152;
  }
  v121 = result;
  if (v3 > 1)
  {
    uint64_t v6 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SILFileHandle);
    uint64_t result = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(result + 16) = v6;
    v120 = result;
    v128 = (char *)(result + 32);
LABEL_13:
    uint64_t v8 = 0;
    uint64_t v9 = MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v11 = v8++;
      v127 = v11;
      if (v8 >= v3) {
        goto LABEL_45;
      }
      unint64_t v12 = v11;
      Swift::Int v13 = v2;
      unsigned int v14 = *v138;
      outlined init with copy of SILFileHandle(*v138 + 40 * v8, (uint64_t)&v135);
      v122 = v14;
      outlined init with copy of SILFileHandle(v14 + 40 * v12, (uint64_t)v132);
      unsigned int v15 = v136;
      unsigned int v16 = v137;
      __swift_project_boxed_opaque_existential_1(&v135, v136);
      unsigned int v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 24))(v15, v16);
      Swift::Int v19 = v18;
      Swift::Int v20 = v133;
      unint64_t v21 = v134;
      __swift_project_boxed_opaque_existential_1(v132, v133);
      Swift::Int v23 = v17 == (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 24))(v20, v21) && v19 == v22;
      v129 = v23 ? 0 : _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v132);
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v135);
      uint64_t v8 = v127 + 2;
      uint64_t v2 = v13;
      if (v127 + 2 >= v3) {
        break;
      }
      uint64_t v24 = v122 + 40 * v127 + 40;
      v124 = v3;
      while (1)
      {
        uint64_t v25 = v2;
        outlined init with copy of SILFileHandle(v24 + 40, (uint64_t)&v135);
        outlined init with copy of SILFileHandle(v24, (uint64_t)v132);
        Swift::Int v26 = v136;
        int64_t v27 = v137;
        __swift_project_boxed_opaque_existential_1(&v135, v136);
        uint64_t v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 24))(v26, v27);
        unint64_t v30 = v29;
        unint64_t v32 = v133;
        uint64_t v31 = v134;
        __swift_project_boxed_opaque_existential_1(v132, v133);
        uint64_t v34 = v28 == (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 24))(v32, v31) && v30 == v33;
        uint64_t v35 = v34 ? 0 : _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v132);
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v135);
        uint64_t v36 = v129 ^ v35;
        uint64_t v2 = v25;
        uint64_t v3 = v124;
        if (v36) {
          break;
        }
        ++v8;
        v24 += 40;
        if (v124 == v8)
        {
          uint64_t v8 = v124;
          break;
        }
      }
      uint64_t v11 = v127;
      if (v129) {
        goto LABEL_37;
      }
LABEL_45:
      if (v8 < v3)
      {
        if (__OFSUB__(v8, v11)) {
          goto LABEL_151;
        }
        if (v8 - v11 < v121)
        {
          if (__OFADD__(v11, v121)) {
            goto LABEL_155;
          }
          if (v11 + v121 >= v3) {
            uint64_t v46 = v3;
          }
          else {
            uint64_t v46 = v11 + v121;
          }
          if (v46 < v11)
          {
LABEL_156:
            __break(1u);
LABEL_157:
            __break(1u);
LABEL_158:
            __break(1u);
LABEL_159:
            __break(1u);
LABEL_160:
            __break(1u);
            return result;
          }
          if (v8 != v46)
          {
            v123 = v9;
            v126 = v46;
            v130 = v2;
            uint64_t v47 = 40 * v8 - 40;
            do
            {
              uint64_t v48 = v47;
              while (1)
              {
                uint64_t v49 = *v138 + v48;
                outlined init with copy of SILFileHandle(v49 + 40, (uint64_t)&v135);
                outlined init with copy of SILFileHandle(v49, (uint64_t)v132);
                uint64_t v50 = v136;
                Swift::String v51 = v137;
                __swift_project_boxed_opaque_existential_1(&v135, v136);
                uint64_t v52 = (*(uint64_t (**)(uint64_t, uint64_t))(v51 + 24))(v50, v51);
                BOOL v54 = v53;
                uint64_t v55 = v133;
                char v56 = v134;
                __swift_project_boxed_opaque_existential_1(v132, v133);
                if (v52 == (*(uint64_t (**)(uint64_t, uint64_t))(v56 + 24))(v55, v56) && v54 == v57) {
                  break;
                }
                uint64_t v59 = _stringCompareWithSmolCheck(_:_:expecting:)();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                __swift_destroy_boxed_opaque_existential_1((uint64_t)v132);
                uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v135);
                if ((v59 & 1) == 0) {
                  goto LABEL_56;
                }
                uint64_t v60 = *v138;
                if (!*v138) {
                  goto LABEL_157;
                }
                BOOL v61 = v60 + v48;
                outlined init with take of SILFileHandle((long long *)(v60 + v48 + 40), (uint64_t)&v135);
                uint64_t v62 = *(_OWORD *)(v61 + 16);
                *(_OWORD *)(v61 + 40) = *(_OWORD *)v61;
                *(_OWORD *)(v61 + 56) = v62;
                *(void *)(v61 + 72) = *(void *)(v61 + 32);
                uint64_t result = outlined init with take of SILFileHandle(&v135, v61);
                v48 -= 40;
                if (v8 == ++v11) {
                  goto LABEL_56;
                }
              }
              swift_bridgeObjectRelease_n();
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v132);
              uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v135);
LABEL_56:
              ++v8;
              v47 += 40;
              uint64_t v11 = v127;
            }
            while (v8 != v126);
            uint64_t v8 = v126;
            uint64_t v2 = v130;
            uint64_t v9 = v123;
          }
        }
      }
      if (v8 < v11) {
        goto LABEL_146;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v9 + 16) + 1, 1, (char *)v9);
        uint64_t v9 = result;
      }
      long long v64 = *(void *)(v9 + 16);
      uint64_t v63 = *(void *)(v9 + 24);
      Swift::Int v10 = v64 + 1;
      v131 = v2;
      if (v64 >= v63 >> 1)
      {
        uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v63 > 1), v64 + 1, 1, (char *)v9);
        uint64_t v9 = result;
      }
      *(void *)(v9 + 16) = v10;
      uint64_t v65 = v9 + 32;
      uint64_t v66 = (Swift::Int *)(v9 + 32 + 16 * v64);
      *uint64_t v66 = v11;
      v66[1] = v8;
      if (v64)
      {
        while (1)
        {
          uint64_t v67 = v10 - 1;
          if (v10 >= 4)
          {
            unint64_t v72 = v65 + 16 * v10;
            uint64_t v73 = *(void *)(v72 - 64);
            double v74 = *(void *)(v72 - 56);
            unint64_t v78 = __OFSUB__(v74, v73);
            uint64_t v75 = v74 - v73;
            if (v78) {
              goto LABEL_135;
            }
            uint64_t v77 = *(void *)(v72 - 48);
            double v76 = *(void *)(v72 - 40);
            unint64_t v78 = __OFSUB__(v76, v77);
            uint64_t v70 = v76 - v77;
            uint64_t v71 = v78;
            if (v78) {
              goto LABEL_136;
            }
            uint64_t v79 = v10 - 2;
            unint64_t v80 = (uint64_t *)(v65 + 16 * (v10 - 2));
            uint64_t v82 = *v80;
            uint64_t v81 = v80[1];
            unint64_t v78 = __OFSUB__(v81, v82);
            uint64_t v83 = v81 - v82;
            if (v78) {
              goto LABEL_137;
            }
            unint64_t v78 = __OFADD__(v70, v83);
            uint64_t v84 = v70 + v83;
            if (v78) {
              goto LABEL_139;
            }
            if (v84 >= v75)
            {
              v102 = (uint64_t *)(v65 + 16 * v67);
              v104 = *v102;
              v103 = v102[1];
              unint64_t v78 = __OFSUB__(v103, v104);
              v105 = v103 - v104;
              if (v78) {
                goto LABEL_145;
              }
              uint64_t v95 = v70 < v105;
              goto LABEL_104;
            }
          }
          else
          {
            if (v10 != 3)
            {
              uint64_t v96 = *(void *)(v9 + 32);
              uint64_t v97 = *(void *)(v9 + 40);
              unint64_t v78 = __OFSUB__(v97, v96);
              Swift::Int v89 = v97 - v96;
              uint64_t v90 = v78;
              goto LABEL_98;
            }
            uint64_t v69 = *(void *)(v9 + 32);
            uint64_t v68 = *(void *)(v9 + 40);
            unint64_t v78 = __OFSUB__(v68, v69);
            uint64_t v70 = v68 - v69;
            uint64_t v71 = v78;
          }
          if (v71) {
            goto LABEL_138;
          }
          uint64_t v79 = v10 - 2;
          unint64_t v85 = (uint64_t *)(v65 + 16 * (v10 - 2));
          uint64_t v87 = *v85;
          v86 = v85[1];
          uint64_t v88 = __OFSUB__(v86, v87);
          Swift::Int v89 = v86 - v87;
          uint64_t v90 = v88;
          if (v88) {
            goto LABEL_140;
          }
          uint64_t v91 = (uint64_t *)(v65 + 16 * v67);
          uint64_t v93 = *v91;
          uint64_t v92 = v91[1];
          unint64_t v78 = __OFSUB__(v92, v93);
          uint64_t v94 = v92 - v93;
          if (v78) {
            goto LABEL_142;
          }
          if (__OFADD__(v89, v94)) {
            goto LABEL_144;
          }
          if (v89 + v94 >= v70)
          {
            uint64_t v95 = v70 < v94;
LABEL_104:
            if (v95) {
              uint64_t v67 = v79;
            }
            goto LABEL_106;
          }
LABEL_98:
          if (v90) {
            goto LABEL_141;
          }
          v98 = (uint64_t *)(v65 + 16 * v67);
          v100 = *v98;
          v99 = v98[1];
          unint64_t v78 = __OFSUB__(v99, v100);
          v101 = v99 - v100;
          if (v78) {
            goto LABEL_143;
          }
          if (v101 < v89) {
            goto LABEL_15;
          }
LABEL_106:
          v106 = v67 - 1;
          if (v67 - 1 >= v10)
          {
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
LABEL_139:
            __break(1u);
LABEL_140:
            __break(1u);
LABEL_141:
            __break(1u);
LABEL_142:
            __break(1u);
LABEL_143:
            __break(1u);
LABEL_144:
            __break(1u);
LABEL_145:
            __break(1u);
LABEL_146:
            __break(1u);
LABEL_147:
            __break(1u);
LABEL_148:
            __break(1u);
LABEL_149:
            __break(1u);
LABEL_150:
            __break(1u);
LABEL_151:
            __break(1u);
LABEL_152:
            __break(1u);
LABEL_153:
            __break(1u);
LABEL_154:
            __break(1u);
LABEL_155:
            __break(1u);
            goto LABEL_156;
          }
          if (!*v138) {
            goto LABEL_158;
          }
          v107 = v9;
          v108 = (uint64_t *)(v65 + 16 * v106);
          v109 = *v108;
          v110 = (void *)(v65 + 16 * v67);
          v111 = v110[1];
          uint64_t result = specialized _merge<A>(low:mid:high:buffer:by:)((char *)(*v138 + 40 * *v108), (char *)(*v138 + 40 * *v110), (char *)(*v138 + 40 * v111), v128);
          if (v131)
          {
LABEL_127:
            swift_bridgeObjectRelease();
            *(void *)(v120 + 16) = 0;
            return swift_bridgeObjectRelease();
          }
          if (v111 < v109) {
            goto LABEL_132;
          }
          if (v67 > *(void *)(v107 + 16)) {
            goto LABEL_133;
          }
          *v108 = v109;
          *(void *)(v65 + 16 * v106 + 8) = v111;
          v112 = *(void *)(v107 + 16);
          if (v67 >= v112) {
            goto LABEL_134;
          }
          uint64_t v9 = v107;
          Swift::Int v10 = v112 - 1;
          uint64_t result = (uint64_t)memmove((void *)(v65 + 16 * v67), v110 + 2, 16 * (v112 - 1 - v67));
          *(void *)(v107 + 16) = v112 - 1;
          if (v112 <= 2) {
            goto LABEL_15;
          }
        }
      }
      Swift::Int v10 = 1;
LABEL_15:
      uint64_t v3 = v138[1];
      uint64_t v2 = v131;
      if (v8 >= v3)
      {
        uint64_t v7 = v120;
        goto LABEL_115;
      }
    }
    uint64_t v11 = v127;
    if ((v129 & 1) == 0) {
      goto LABEL_45;
    }
LABEL_37:
    if (v8 < v11) {
      goto LABEL_154;
    }
    if (v11 < v8)
    {
      v125 = v3;
      char v37 = v2;
      unint64_t v38 = v9;
      uint64_t v39 = 40 * v8 - 40;
      uint64_t v40 = v11;
      uint64_t v41 = 40 * v11;
      uint64_t v42 = v8;
      do
      {
        if (v40 != --v42)
        {
          if (!v122) {
            goto LABEL_159;
          }
          uint64_t v43 = v122 + v41;
          outlined init with take of SILFileHandle((long long *)(v122 + v41), (uint64_t)&v135);
          BOOL v44 = *(void *)(v122 + v39 + 32);
          unint64_t v45 = *(_OWORD *)(v122 + v39 + 16);
          *(_OWORD *)uint64_t v43 = *(_OWORD *)(v122 + v39);
          *(_OWORD *)(v43 + 16) = v45;
          *(void *)(v43 + 32) = v44;
          uint64_t result = outlined init with take of SILFileHandle(&v135, v122 + v39);
        }
        ++v40;
        v39 -= 40;
        v41 += 40;
      }
      while (v40 < v42);
      uint64_t v9 = v38;
      uint64_t v2 = v37;
      uint64_t v3 = v125;
      uint64_t v11 = v127;
    }
    goto LABEL_45;
  }
  uint64_t v7 = MEMORY[0x263F8EE78];
  v128 = (char *)(MEMORY[0x263F8EE78] + 32);
  if (v3 == 1)
  {
    v120 = MEMORY[0x263F8EE78];
    goto LABEL_13;
  }
  Swift::Int v10 = *(void *)(MEMORY[0x263F8EE78] + 16);
  uint64_t v9 = MEMORY[0x263F8EE78];
LABEL_115:
  v113 = v9;
  v120 = v7;
  if (v10 >= 2)
  {
    v114 = *v138;
    do
    {
      v115 = v10 - 2;
      if (v10 < 2) {
        goto LABEL_147;
      }
      if (!v114) {
        goto LABEL_160;
      }
      v116 = *(void *)(v113 + 32 + 16 * v115);
      v117 = *(void *)(v113 + 32 + 16 * (v10 - 1) + 8);
      uint64_t result = specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v114 + 40 * v116), (char *)(v114 + 40 * *(void *)(v113 + 32 + 16 * (v10 - 1))), (char *)(v114 + 40 * v117), v128);
      if (v2) {
        goto LABEL_127;
      }
      if (v117 < v116) {
        goto LABEL_148;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v113);
        v113 = result;
      }
      if (v115 >= *(void *)(v113 + 16)) {
        goto LABEL_149;
      }
      v118 = (void *)(v113 + 32 + 16 * v115);
      *v118 = v116;
      v118[1] = v117;
      v119 = *(void *)(v113 + 16);
      if (v10 > v119) {
        goto LABEL_150;
      }
      uint64_t result = (uint64_t)memmove((void *)(v113 + 32 + 16 * (v10 - 1)), (const void *)(v113 + 32 + 16 * v10), 16 * (v119 - v10));
      *(void *)(v113 + 16) = v119 - 1;
      Swift::Int v10 = v119 - 1;
      uint64_t v2 = 0;
    }
    while (v119 > 2);
  }
  swift_bridgeObjectRelease();
  *(void *)(v120 + 16) = 0;
  return swift_bridgeObjectRelease();
}

void specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  Swift::Int v5 = a1[1];
  Swift::Int v6 = _minimumMergeRunLength(_:)(v5);
  if (v6 >= v5)
  {
    if (v5 < 0) {
      goto LABEL_156;
    }
    if (v5) {
      specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(0, v5, 1, a1, a2);
    }
  }
  else
  {
    if (v5 >= 0) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = v5 + 1;
    }
    if (v5 < -1) {
      goto LABEL_155;
    }
    Swift::Int v145 = v5;
    Swift::Int v139 = v6;
    v136 = a1;
    if (v5 > 1)
    {
      uint64_t v8 = v7 >> 1;
      uint64_t v9 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(v9 + 16) = v8;
      uint64_t v138 = v9;
      v148 = (uint64_t *)(v9 + 32);
LABEL_12:
      Swift::Int v11 = 0;
      uint64_t v12 = *a1;
      uint64_t v137 = *a1 + 24;
      Swift::Int v10 = (char *)MEMORY[0x263F8EE78];
      Swift::Int v13 = v145;
      uint64_t v152 = *a1;
      while (1)
      {
        Swift::Int v14 = v11 + 1;
        v141 = v10;
        Swift::Int v144 = v11;
        if (v11 + 1 < v13)
        {
          unsigned int v15 = (uint64_t *)(v12 + 16 * v14);
          uint64_t v16 = *v15;
          uint64_t v17 = v15[1];
          id v18 = (uint64_t *)(v12 + 16 * v11);
          uint64_t v20 = *v18;
          uint64_t v19 = v18[1];
          uint64_t v21 = *a2;
          uint64_t v22 = *(void *)(*a2 + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (!v22) {
            goto LABEL_152;
          }
          swift_bridgeObjectRetain();
          unint64_t v23 = specialized __RawDictionaryStorage.find<A>(_:)(v16, v17);
          if ((v24 & 1) == 0) {
            goto LABEL_168;
          }
          uint64_t v25 = (char *)*(id *)(*(void *)(v21 + 56) + 8 * v23);
          swift_bridgeObjectRelease();
          Swift::Int v26 = (char *)*(id *)&v25[OBJC_IVAR____TtC10SILManager16SILFlipBookState_selfTransition];

          unsigned int v149 = *(unsigned __int16 *)&v26[OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame];
          uint64_t v27 = *a2;
          if (!*(void *)(*a2 + 16)) {
            goto LABEL_153;
          }
          swift_bridgeObjectRetain();
          unint64_t v28 = specialized __RawDictionaryStorage.find<A>(_:)(v20, v19);
          if ((v29 & 1) == 0) {
            goto LABEL_169;
          }
          unint64_t v30 = (char *)*(id *)(*(void *)(v27 + 56) + 8 * v28);
          swift_bridgeObjectRelease();
          uint64_t v31 = (char *)*(id *)&v30[OBJC_IVAR____TtC10SILManager16SILFlipBookState_selfTransition];

          unsigned int v142 = *(unsigned __int16 *)&v31[OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame];
          if (v3) {
            goto LABEL_129;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          Swift::Int v14 = v144 + 2;
          if (v144 + 2 >= v145)
          {
            uint64_t v12 = v152;
          }
          else
          {
            unint64_t v32 = (uint64_t *)(v137 + 16 * v144);
            while (1)
            {
              uint64_t v33 = *a2;
              if (!*(void *)(*a2 + 16)) {
                goto LABEL_134;
              }
              uint64_t v146 = v3;
              Swift::Int v34 = v14;
              uint64_t v35 = v32 + 2;
              uint64_t v36 = v32[2];
              uint64_t v38 = *(v32 - 1);
              uint64_t v37 = *v32;
              uint64_t v39 = v32[1];
              swift_bridgeObjectRetain_n();
              swift_bridgeObjectRetain();
              unint64_t v40 = specialized __RawDictionaryStorage.find<A>(_:)(v39, v36);
              if ((v41 & 1) == 0) {
                goto LABEL_164;
              }
              uint64_t v42 = (char *)*(id *)(*(void *)(v33 + 56) + 8 * v40);
              swift_bridgeObjectRelease();
              uint64_t v43 = (char *)*(id *)&v42[OBJC_IVAR____TtC10SILManager16SILFlipBookState_selfTransition];

              unsigned int v44 = *(unsigned __int16 *)&v43[OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame];
              uint64_t v45 = *a2;
              if (!*(void *)(*a2 + 16)) {
                goto LABEL_135;
              }
              swift_bridgeObjectRetain();
              unint64_t v46 = specialized __RawDictionaryStorage.find<A>(_:)(v38, v37);
              if ((v47 & 1) == 0) {
                goto LABEL_165;
              }
              uint64_t v48 = (char *)*(id *)(*(void *)(v45 + 56) + 8 * v46);
              swift_bridgeObjectRelease();
              uint64_t v49 = (char *)*(id *)&v48[OBJC_IVAR____TtC10SILManager16SILFlipBookState_selfTransition];

              LODWORD(v48) = *(unsigned __int16 *)&v49[OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame];
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();

              if (v149 < v142 == v44 >= v48) {
                break;
              }
              Swift::Int v14 = v34 + 1;
              unint64_t v32 = v35;
              uint64_t v3 = v146;
              Swift::Int v10 = v141;
              uint64_t v12 = v152;
              if (v145 == v14)
              {
                Swift::Int v14 = v145;
                goto LABEL_30;
              }
            }
            Swift::Int v10 = v141;
            uint64_t v12 = v152;
            Swift::Int v14 = v34;
            uint64_t v3 = v146;
          }
LABEL_30:
          if (v149 < v142)
          {
            Swift::Int v50 = v144;
            if (v14 < v144) {
              goto LABEL_159;
            }
            if (v144 < v14)
            {
              uint64_t v51 = 16 * v14;
              uint64_t v52 = 16 * v144;
              Swift::Int v53 = v14;
              do
              {
                if (v50 != --v53)
                {
                  if (!v12) {
                    goto LABEL_166;
                  }
                  uint64_t v54 = v12 + v51;
                  uint64_t v55 = *(void *)(v12 + v52);
                  uint64_t v56 = *(void *)(v12 + v52 + 8);
                  *(_OWORD *)(v12 + v52) = *(_OWORD *)(v12 + v51 - 16);
                  *(void *)(v54 - 16) = v55;
                  *(void *)(v54 - 8) = v56;
                }
                ++v50;
                v51 -= 16;
                v52 += 16;
              }
              while (v50 < v53);
            }
          }
        }
        if (v14 >= v145) {
          goto LABEL_62;
        }
        if (__OFSUB__(v14, v144)) {
          goto LABEL_154;
        }
        if (v14 - v144 >= v139)
        {
LABEL_62:
          if (v14 < v144) {
            goto LABEL_151;
          }
        }
        else
        {
          if (__OFADD__(v144, v139)) {
            goto LABEL_157;
          }
          Swift::Int v57 = v145;
          if (v144 + v139 < v145) {
            Swift::Int v57 = v144 + v139;
          }
          if (v57 < v144)
          {
LABEL_158:
            __break(1u);
LABEL_159:
            __break(1u);
LABEL_160:
            swift_bridgeObjectRelease();
            __break(1u);
LABEL_161:
            swift_bridgeObjectRelease();
            __break(1u);
LABEL_162:
            __break(1u);
LABEL_163:
            __break(1u);
LABEL_164:
            swift_bridgeObjectRelease();
            __break(1u);
LABEL_165:
            swift_bridgeObjectRelease();
            __break(1u);
LABEL_166:
            __break(1u);
LABEL_167:
            __break(1u);
LABEL_168:
            swift_bridgeObjectRelease();
            __break(1u);
LABEL_169:
            swift_bridgeObjectRelease();
            __break(1u);
            return;
          }
          if (v14 != v57)
          {
            uint64_t v147 = v3;
            uint64_t v58 = (uint64_t *)(v12 + 16 * v14);
            Swift::Int v140 = v57;
LABEL_52:
            uint64_t v60 = *(void *)(v12 + 16 * v14 + 8);
            Swift::Int v61 = v144;
            v143 = v58;
            Swift::Int v150 = v14;
            while (1)
            {
              uint64_t v62 = *a2;
              if (!*(void *)(*a2 + 16)) {
                break;
              }
              uint64_t v64 = *(v58 - 2);
              uint64_t v63 = *(v58 - 1);
              uint64_t v65 = *v58;
              swift_bridgeObjectRetain_n();
              swift_bridgeObjectRetain();
              unint64_t v66 = specialized __RawDictionaryStorage.find<A>(_:)(v65, v60);
              if ((v67 & 1) == 0) {
                goto LABEL_160;
              }
              uint64_t v68 = (char *)*(id *)(*(void *)(v62 + 56) + 8 * v66);
              swift_bridgeObjectRelease();
              uint64_t v69 = (char *)*(id *)&v68[OBJC_IVAR____TtC10SILManager16SILFlipBookState_selfTransition];

              unsigned int v70 = *(unsigned __int16 *)&v69[OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame];
              uint64_t v71 = *a2;
              if (!*(void *)(*a2 + 16)) {
                goto LABEL_128;
              }
              swift_bridgeObjectRetain();
              unint64_t v72 = specialized __RawDictionaryStorage.find<A>(_:)(v64, v63);
              if ((v73 & 1) == 0) {
                goto LABEL_161;
              }
              double v74 = (char *)*(id *)(*(void *)(v71 + 56) + 8 * v72);
              swift_bridgeObjectRelease();
              uint64_t v75 = (char *)*(id *)&v74[OBJC_IVAR____TtC10SILManager16SILFlipBookState_selfTransition];

              LODWORD(v74) = *(unsigned __int16 *)&v75[OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame];
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();

              if (v70 >= v74)
              {
                uint64_t v12 = v152;
                Swift::Int v59 = v150;
LABEL_51:
                Swift::Int v14 = v59 + 1;
                uint64_t v58 = v143 + 2;
                if (v14 == v140)
                {
                  Swift::Int v14 = v140;
                  uint64_t v3 = v147;
                  Swift::Int v10 = v141;
                  goto LABEL_62;
                }
                goto LABEL_52;
              }
              uint64_t v12 = v152;
              Swift::Int v59 = v150;
              if (!v152) {
                goto LABEL_162;
              }
              uint64_t v76 = *v58;
              uint64_t v60 = v58[1];
              *(_OWORD *)uint64_t v58 = *((_OWORD *)v58 - 1);
              *(v58 - 1) = v60;
              *(v58 - 2) = v76;
              v58 -= 2;
              if (v150 == ++v61) {
                goto LABEL_51;
              }
            }
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_125;
          }
          if (v14 < v144) {
            goto LABEL_151;
          }
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          Swift::Int v10 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v10 + 2) + 1, 1, v10);
        }
        unint64_t v78 = *((void *)v10 + 2);
        unint64_t v77 = *((void *)v10 + 3);
        unint64_t v79 = v78 + 1;
        uint64_t v12 = v152;
        if (v78 >= v77 >> 1)
        {
          v128 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v77 > 1), v78 + 1, 1, v10);
          uint64_t v12 = v152;
          Swift::Int v10 = v128;
        }
        *((void *)v10 + 2) = v79;
        unint64_t v80 = v10 + 32;
        uint64_t v81 = &v10[16 * v78 + 32];
        *(void *)uint64_t v81 = v144;
        *((void *)v81 + 1) = v14;
        Swift::Int v151 = v14;
        if (v78)
        {
          while (1)
          {
            unint64_t v82 = v79 - 1;
            if (v79 >= 4)
            {
              uint64_t v87 = &v80[16 * v79];
              uint64_t v88 = *((void *)v87 - 8);
              uint64_t v89 = *((void *)v87 - 7);
              BOOL v93 = __OFSUB__(v89, v88);
              uint64_t v90 = v89 - v88;
              if (v93) {
                goto LABEL_136;
              }
              uint64_t v92 = *((void *)v87 - 6);
              uint64_t v91 = *((void *)v87 - 5);
              BOOL v93 = __OFSUB__(v91, v92);
              uint64_t v85 = v91 - v92;
              char v86 = v93;
              if (v93) {
                goto LABEL_137;
              }
              unint64_t v94 = v79 - 2;
              uint64_t v95 = &v80[16 * v79 - 32];
              uint64_t v97 = *(void *)v95;
              uint64_t v96 = *((void *)v95 + 1);
              BOOL v93 = __OFSUB__(v96, v97);
              uint64_t v98 = v96 - v97;
              if (v93) {
                goto LABEL_138;
              }
              BOOL v93 = __OFADD__(v85, v98);
              uint64_t v99 = v85 + v98;
              if (v93) {
                goto LABEL_140;
              }
              if (v99 >= v90)
              {
                v117 = &v80[16 * v82];
                uint64_t v119 = *(void *)v117;
                uint64_t v118 = *((void *)v117 + 1);
                BOOL v93 = __OFSUB__(v118, v119);
                uint64_t v120 = v118 - v119;
                if (v93) {
                  goto LABEL_146;
                }
                BOOL v110 = v85 < v120;
                goto LABEL_99;
              }
            }
            else
            {
              if (v79 != 3)
              {
                uint64_t v111 = *((void *)v10 + 4);
                uint64_t v112 = *((void *)v10 + 5);
                BOOL v93 = __OFSUB__(v112, v111);
                uint64_t v104 = v112 - v111;
                char v105 = v93;
                goto LABEL_93;
              }
              uint64_t v84 = *((void *)v10 + 4);
              uint64_t v83 = *((void *)v10 + 5);
              BOOL v93 = __OFSUB__(v83, v84);
              uint64_t v85 = v83 - v84;
              char v86 = v93;
            }
            if (v86) {
              goto LABEL_139;
            }
            unint64_t v94 = v79 - 2;
            v100 = &v80[16 * v79 - 32];
            uint64_t v102 = *(void *)v100;
            uint64_t v101 = *((void *)v100 + 1);
            BOOL v103 = __OFSUB__(v101, v102);
            uint64_t v104 = v101 - v102;
            char v105 = v103;
            if (v103) {
              goto LABEL_141;
            }
            v106 = &v80[16 * v82];
            uint64_t v108 = *(void *)v106;
            uint64_t v107 = *((void *)v106 + 1);
            BOOL v93 = __OFSUB__(v107, v108);
            uint64_t v109 = v107 - v108;
            if (v93) {
              goto LABEL_143;
            }
            if (__OFADD__(v104, v109)) {
              goto LABEL_145;
            }
            if (v104 + v109 >= v85)
            {
              BOOL v110 = v85 < v109;
LABEL_99:
              if (v110) {
                unint64_t v82 = v94;
              }
              goto LABEL_101;
            }
LABEL_93:
            if (v105) {
              goto LABEL_142;
            }
            v113 = &v80[16 * v82];
            uint64_t v115 = *(void *)v113;
            uint64_t v114 = *((void *)v113 + 1);
            BOOL v93 = __OFSUB__(v114, v115);
            uint64_t v116 = v114 - v115;
            if (v93) {
              goto LABEL_144;
            }
            if (v116 < v104) {
              goto LABEL_110;
            }
LABEL_101:
            unint64_t v121 = v82 - 1;
            if (v82 - 1 >= v79)
            {
              __break(1u);
LABEL_131:
              __break(1u);
LABEL_132:
              __break(1u);
LABEL_133:
              __break(1u);
LABEL_134:
              __break(1u);
LABEL_135:
              __break(1u);
LABEL_136:
              __break(1u);
LABEL_137:
              __break(1u);
LABEL_138:
              __break(1u);
LABEL_139:
              __break(1u);
LABEL_140:
              __break(1u);
LABEL_141:
              __break(1u);
LABEL_142:
              __break(1u);
LABEL_143:
              __break(1u);
LABEL_144:
              __break(1u);
LABEL_145:
              __break(1u);
LABEL_146:
              __break(1u);
LABEL_147:
              __break(1u);
LABEL_148:
              __break(1u);
LABEL_149:
              __break(1u);
LABEL_150:
              __break(1u);
LABEL_151:
              __break(1u);
LABEL_152:
              __break(1u);
LABEL_153:
              __break(1u);
LABEL_154:
              __break(1u);
LABEL_155:
              __break(1u);
LABEL_156:
              __break(1u);
LABEL_157:
              __break(1u);
              goto LABEL_158;
            }
            if (!v12) {
              goto LABEL_163;
            }
            v122 = v10;
            v123 = &v80[16 * v121];
            uint64_t v124 = *(void *)v123;
            v125 = &v80[16 * v82];
            uint64_t v126 = *((void *)v125 + 1);
            specialized _merge<A>(low:mid:high:buffer:by:)((uint64_t *)(v12 + 16 * *(void *)v123), (uint64_t *)(v12 + 16 * *(void *)v125), v12 + 16 * v126, v148, a2);
            if (v3) {
              goto LABEL_125;
            }
            if (v126 < v124) {
              goto LABEL_131;
            }
            if (v82 > *((void *)v122 + 2)) {
              goto LABEL_132;
            }
            *(void *)v123 = v124;
            *(void *)&v80[16 * v121 + 8] = v126;
            unint64_t v127 = *((void *)v122 + 2);
            if (v82 >= v127) {
              goto LABEL_133;
            }
            Swift::Int v10 = v122;
            unint64_t v79 = v127 - 1;
            memmove(&v80[16 * v82], v125 + 16, 16 * (v127 - 1 - v82));
            *((void *)v122 + 2) = v127 - 1;
            uint64_t v12 = v152;
            if (v127 <= 2) {
              goto LABEL_110;
            }
          }
        }
        unint64_t v79 = 1;
LABEL_110:
        Swift::Int v13 = v145;
        Swift::Int v11 = v151;
        if (v151 >= v145) {
          goto LABEL_114;
        }
      }
    }
    Swift::Int v10 = (char *)MEMORY[0x263F8EE78];
    v148 = (uint64_t *)(MEMORY[0x263F8EE78] + 32);
    uint64_t v138 = MEMORY[0x263F8EE78];
    if (v5 == 1) {
      goto LABEL_12;
    }
    unint64_t v79 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_114:
    v129 = v10;
    if (v79 >= 2)
    {
      uint64_t v130 = *v136;
      do
      {
        unint64_t v131 = v79 - 2;
        if (v79 < 2) {
          goto LABEL_147;
        }
        if (!v130) {
          goto LABEL_167;
        }
        uint64_t v132 = *(void *)&v129[16 * v131 + 32];
        uint64_t v133 = *(void *)&v129[16 * v79 + 24];
        specialized _merge<A>(low:mid:high:buffer:by:)((uint64_t *)(v130 + 16 * v132), (uint64_t *)(v130 + 16 * *(void *)&v129[16 * v79 + 16]), v130 + 16 * v133, v148, a2);
        if (v3) {
          break;
        }
        if (v133 < v132) {
          goto LABEL_148;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v129 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v129);
        }
        if (v131 >= *((void *)v129 + 2)) {
          goto LABEL_149;
        }
        v134 = &v129[16 * v131 + 32];
        *(void *)v134 = v132;
        *((void *)v134 + 1) = v133;
        unint64_t v135 = *((void *)v129 + 2);
        if (v79 > v135) {
          goto LABEL_150;
        }
        memmove(&v129[16 * v79 + 16], &v129[16 * v79 + 32], 16 * (v135 - v79));
        *((void *)v129 + 2) = v135 - 1;
        unint64_t v79 = v135 - 1;
      }
      while (v135 > 2);
    }
LABEL_125:
    swift_bridgeObjectRelease();
    *(void *)(v138 + 16) = 0;
    swift_bridgeObjectRelease();
  }
}

void specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(uint64_t *a1)
{
  uint64_t v2 = a1;
  Swift::Int v3 = a1[1];
  Swift::Int v4 = _minimumMergeRunLength(_:)(v3);
  if (v4 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_132;
    }
    if (v3) {
      specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(0, v3, 1, v2);
    }
    return;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_131;
  }
  Swift::Int v107 = v4;
  BOOL v103 = v2;
  uint64_t v115 = v1;
  if (v3 > 1)
  {
    Swift::Int v6 = v2;
    uint64_t v7 = v5 >> 1;
    type metadata accessor for SILIndicatorDesc();
    uint64_t v8 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    uint64_t v2 = v6;
    uint64_t v114 = (void **)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v117 = v8;
LABEL_12:
    Swift::Int v10 = 0;
    uint64_t v11 = *v2;
    uint64_t v104 = *v2 - 8;
    uint64_t v105 = *v2 + 16;
    uint64_t v9 = (char *)MEMORY[0x263F8EE78];
    Swift::Int v111 = v3;
    uint64_t v116 = *v2;
    while (1)
    {
      Swift::Int v13 = v10++;
      Swift::Int v110 = v13;
      if (v10 < v3)
      {
        Swift::Int v14 = *(void **)(v11 + 8 * v10);
        unsigned int v15 = *(void **)(v11 + 8 * v13);
        uint64_t v16 = (void *)MEMORY[0x263F8EED0];
        uint64_t v17 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v14) + 0xA8);
        id v18 = v14;
        uint64_t v19 = v15;
        Swift::Int v3 = v111;
        uint64_t v112 = v17();
        uint64_t v108 = (*(uint64_t (**)(void))((*v16 & *v19) + 0xA8))();

        Swift::Int v10 = v13 + 2;
        if (v13 + 2 < v111)
        {
          uint64_t v20 = (id *)(v105 + 8 * v13);
          while (1)
          {
            uint64_t v21 = *(v20 - 1);
            uint64_t v22 = (void *)MEMORY[0x263F8EED0];
            unint64_t v23 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *(void *)*v20) + 0xA8);
            id v24 = *v20;
            uint64_t v25 = v21;
            uint64_t v26 = v23();
            uint64_t v27 = (*(uint64_t (**)(void))((*v22 & *v25) + 0xA8))();

            if (v112 < v108 == v26 >= v27) {
              break;
            }
            ++v10;
            ++v20;
            Swift::Int v3 = v111;
            if (v111 == v10)
            {
              Swift::Int v10 = v111;
              goto LABEL_22;
            }
          }
          Swift::Int v3 = v111;
        }
LABEL_22:
        uint64_t v11 = v116;
        if (v112 < v108)
        {
          if (v10 < v13) {
            goto LABEL_133;
          }
          if (v13 < v10)
          {
            unint64_t v28 = (uint64_t *)(v104 + 8 * v10);
            Swift::Int v29 = v10;
            Swift::Int v30 = v13;
            uint64_t v31 = (uint64_t *)(v116 + 8 * v13);
            do
            {
              if (v30 != --v29)
              {
                if (!v116) {
                  goto LABEL_138;
                }
                uint64_t v32 = *v31;
                uint64_t *v31 = *v28;
                uint64_t *v28 = v32;
              }
              ++v30;
              --v28;
              ++v31;
            }
            while (v30 < v29);
          }
        }
      }
      if (v10 < v3)
      {
        if (__OFSUB__(v10, v13)) {
          goto LABEL_130;
        }
        if (v10 - v13 < v107)
        {
          if (__OFADD__(v13, v107)) {
            goto LABEL_134;
          }
          if (v13 + v107 >= v3) {
            Swift::Int v33 = v3;
          }
          else {
            Swift::Int v33 = v13 + v107;
          }
          if (v33 < v13)
          {
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
LABEL_139:
            __break(1u);
            return;
          }
          if (v10 != v33)
          {
            v106 = v9;
            uint64_t v34 = v104 + 8 * v10;
            Swift::Int v109 = v33;
            do
            {
              uint64_t v35 = *(void **)(v11 + 8 * v10);
              Swift::Int v36 = v13;
              uint64_t v113 = v34;
              uint64_t v37 = v34;
              while (1)
              {
                uint64_t v38 = *(void **)v37;
                uint64_t v39 = (void *)MEMORY[0x263F8EED0];
                unint64_t v40 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v35) + 0xA8);
                char v41 = v35;
                uint64_t v42 = v38;
                uint64_t v43 = v40();
                uint64_t v44 = (*(uint64_t (**)(void))((*v39 & *v42) + 0xA8))();

                if (v43 >= v44) {
                  break;
                }
                uint64_t v11 = v116;
                if (!v116) {
                  goto LABEL_136;
                }
                uint64_t v45 = *(void **)v37;
                uint64_t v35 = *(void **)(v37 + 8);
                *(void *)uint64_t v37 = v35;
                *(void *)(v37 + 8) = v45;
                v37 -= 8;
                if (v10 == ++v36) {
                  goto LABEL_41;
                }
              }
              uint64_t v11 = v116;
LABEL_41:
              ++v10;
              uint64_t v34 = v113 + 8;
              Swift::Int v13 = v110;
            }
            while (v10 != v109);
            Swift::Int v10 = v109;
            uint64_t v9 = v106;
          }
        }
      }
      if (v10 < v13) {
        goto LABEL_125;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v9 + 2) + 1, 1, v9);
      }
      unint64_t v47 = *((void *)v9 + 2);
      unint64_t v46 = *((void *)v9 + 3);
      unint64_t v12 = v47 + 1;
      uint64_t v11 = v116;
      if (v47 >= v46 >> 1)
      {
        uint64_t v96 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v46 > 1), v47 + 1, 1, v9);
        uint64_t v11 = v116;
        uint64_t v9 = v96;
      }
      *((void *)v9 + 2) = v12;
      uint64_t v48 = v9 + 32;
      uint64_t v49 = &v9[16 * v47 + 32];
      *(void *)uint64_t v49 = v13;
      *((void *)v49 + 1) = v10;
      if (v47)
      {
        while (1)
        {
          unint64_t v50 = v12 - 1;
          if (v12 >= 4)
          {
            uint64_t v55 = &v48[16 * v12];
            uint64_t v56 = *((void *)v55 - 8);
            uint64_t v57 = *((void *)v55 - 7);
            BOOL v61 = __OFSUB__(v57, v56);
            uint64_t v58 = v57 - v56;
            if (v61) {
              goto LABEL_114;
            }
            uint64_t v60 = *((void *)v55 - 6);
            uint64_t v59 = *((void *)v55 - 5);
            BOOL v61 = __OFSUB__(v59, v60);
            uint64_t v53 = v59 - v60;
            char v54 = v61;
            if (v61) {
              goto LABEL_115;
            }
            unint64_t v62 = v12 - 2;
            uint64_t v63 = &v48[16 * v12 - 32];
            uint64_t v65 = *(void *)v63;
            uint64_t v64 = *((void *)v63 + 1);
            BOOL v61 = __OFSUB__(v64, v65);
            uint64_t v66 = v64 - v65;
            if (v61) {
              goto LABEL_116;
            }
            BOOL v61 = __OFADD__(v53, v66);
            uint64_t v67 = v53 + v66;
            if (v61) {
              goto LABEL_118;
            }
            if (v67 >= v58)
            {
              uint64_t v85 = &v48[16 * v50];
              uint64_t v87 = *(void *)v85;
              uint64_t v86 = *((void *)v85 + 1);
              BOOL v61 = __OFSUB__(v86, v87);
              uint64_t v88 = v86 - v87;
              if (v61) {
                goto LABEL_124;
              }
              BOOL v78 = v53 < v88;
              goto LABEL_85;
            }
          }
          else
          {
            if (v12 != 3)
            {
              uint64_t v79 = *((void *)v9 + 4);
              uint64_t v80 = *((void *)v9 + 5);
              BOOL v61 = __OFSUB__(v80, v79);
              uint64_t v72 = v80 - v79;
              char v73 = v61;
              goto LABEL_79;
            }
            uint64_t v52 = *((void *)v9 + 4);
            uint64_t v51 = *((void *)v9 + 5);
            BOOL v61 = __OFSUB__(v51, v52);
            uint64_t v53 = v51 - v52;
            char v54 = v61;
          }
          if (v54) {
            goto LABEL_117;
          }
          unint64_t v62 = v12 - 2;
          uint64_t v68 = &v48[16 * v12 - 32];
          uint64_t v70 = *(void *)v68;
          uint64_t v69 = *((void *)v68 + 1);
          BOOL v71 = __OFSUB__(v69, v70);
          uint64_t v72 = v69 - v70;
          char v73 = v71;
          if (v71) {
            goto LABEL_119;
          }
          double v74 = &v48[16 * v50];
          uint64_t v76 = *(void *)v74;
          uint64_t v75 = *((void *)v74 + 1);
          BOOL v61 = __OFSUB__(v75, v76);
          uint64_t v77 = v75 - v76;
          if (v61) {
            goto LABEL_121;
          }
          if (__OFADD__(v72, v77)) {
            goto LABEL_123;
          }
          if (v72 + v77 >= v53)
          {
            BOOL v78 = v53 < v77;
LABEL_85:
            if (v78) {
              unint64_t v50 = v62;
            }
            goto LABEL_87;
          }
LABEL_79:
          if (v73) {
            goto LABEL_120;
          }
          uint64_t v81 = &v48[16 * v50];
          uint64_t v83 = *(void *)v81;
          uint64_t v82 = *((void *)v81 + 1);
          BOOL v61 = __OFSUB__(v82, v83);
          uint64_t v84 = v82 - v83;
          if (v61) {
            goto LABEL_122;
          }
          if (v84 < v72) {
            goto LABEL_14;
          }
LABEL_87:
          unint64_t v89 = v50 - 1;
          if (v50 - 1 >= v12)
          {
            __break(1u);
LABEL_111:
            __break(1u);
LABEL_112:
            __break(1u);
LABEL_113:
            __break(1u);
LABEL_114:
            __break(1u);
LABEL_115:
            __break(1u);
LABEL_116:
            __break(1u);
LABEL_117:
            __break(1u);
LABEL_118:
            __break(1u);
LABEL_119:
            __break(1u);
LABEL_120:
            __break(1u);
LABEL_121:
            __break(1u);
LABEL_122:
            __break(1u);
LABEL_123:
            __break(1u);
LABEL_124:
            __break(1u);
LABEL_125:
            __break(1u);
LABEL_126:
            __break(1u);
LABEL_127:
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
            goto LABEL_135;
          }
          if (!v11) {
            goto LABEL_137;
          }
          uint64_t v90 = v9;
          uint64_t v91 = &v48[16 * v89];
          uint64_t v92 = *(void *)v91;
          BOOL v93 = &v48[16 * v50];
          uint64_t v94 = *((void *)v93 + 1);
          specialized _merge<A>(low:mid:high:buffer:by:)((void **)(v11 + 8 * *(void *)v91), (id *)(v11 + 8 * *(void *)v93), v11 + 8 * v94, v114);
          if (v1)
          {
LABEL_95:
            swift_bridgeObjectRelease();
            *(void *)((v117 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
            specialized Array._endMutation()();
            swift_bridgeObjectRelease();
            return;
          }
          if (v94 < v92) {
            goto LABEL_111;
          }
          if (v50 > *((void *)v90 + 2)) {
            goto LABEL_112;
          }
          *(void *)uint64_t v91 = v92;
          *(void *)&v48[16 * v89 + 8] = v94;
          unint64_t v95 = *((void *)v90 + 2);
          if (v50 >= v95) {
            goto LABEL_113;
          }
          uint64_t v9 = v90;
          unint64_t v12 = v95 - 1;
          memmove(&v48[16 * v50], v93 + 16, 16 * (v95 - 1 - v50));
          *((void *)v90 + 2) = v95 - 1;
          uint64_t v11 = v116;
          if (v95 <= 2) {
            goto LABEL_14;
          }
        }
      }
      unint64_t v12 = 1;
LABEL_14:
      Swift::Int v3 = v111;
      if (v10 >= v111) {
        goto LABEL_97;
      }
    }
  }
  uint64_t v9 = (char *)MEMORY[0x263F8EE78];
  uint64_t v117 = MEMORY[0x263F8EE78];
  uint64_t v114 = (void **)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
  if (v3 == 1) {
    goto LABEL_12;
  }
  unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_97:
  if (v12 >= 2)
  {
    uint64_t v97 = *v103;
    do
    {
      unint64_t v98 = v12 - 2;
      if (v12 < 2) {
        goto LABEL_126;
      }
      if (!v97) {
        goto LABEL_139;
      }
      uint64_t v99 = *(void *)&v9[16 * v98 + 32];
      uint64_t v100 = *(void *)&v9[16 * v12 + 24];
      specialized _merge<A>(low:mid:high:buffer:by:)((void **)(v97 + 8 * v99), (id *)(v97 + 8 * *(void *)&v9[16 * v12 + 16]), v97 + 8 * v100, v114);
      if (v115) {
        goto LABEL_95;
      }
      if (v100 < v99) {
        goto LABEL_127;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v9);
      }
      if (v98 >= *((void *)v9 + 2)) {
        goto LABEL_128;
      }
      uint64_t v101 = &v9[16 * v98 + 32];
      *(void *)uint64_t v101 = v99;
      *((void *)v101 + 1) = v100;
      unint64_t v102 = *((void *)v9 + 2);
      if (v12 > v102) {
        goto LABEL_129;
      }
      memmove(&v9[16 * v12 + 16], &v9[16 * v12 + 32], 16 * (v102 - v12));
      *((void *)v9 + 2) = v102 - 1;
      unint64_t v12 = v102 - 1;
      uint64_t v115 = 0;
    }
    while (v102 > 2);
  }
  swift_bridgeObjectRelease();
  *(void *)((v117 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
  specialized Array._endMutation()();
  swift_bridgeObjectRelease();
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  Swift::Int v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = specialized Sequence._copySequenceContents(initializing:)((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  outlined consume of [String : [String : [String : [Int]]]].Iterator._Variant();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = *a4;
    uint64_t v5 = *a4 + 8 * a3 - 8;
LABEL_5:
    uint64_t v6 = *(void *)(v4 + 8 * a3);
    uint64_t v7 = result;
    uint64_t v8 = (uint64_t *)v5;
    while (1)
    {
      uint64_t v9 = *v8;
      if (*(unsigned __int16 *)(v6 + OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame) >= *(unsigned __int16 *)(*v8 + OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame))
      {
LABEL_4:
        ++a3;
        v5 += 8;
        if (a3 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v4) {
        break;
      }
      uint64_t *v8 = v6;
      v8[1] = v9;
      --v8;
      if (a3 == ++v7) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  uint64_t v16;

  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 8 * a3 - 8;
LABEL_5:
    uint64_t v9 = *(void *)(v7 + 8 * v4);
    Swift::Int v10 = v6;
    uint64_t v11 = (uint64_t *)v8;
    while (1)
    {
      unint64_t v12 = (uint64_t *)(v9 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_name);
      uint64_t result = *v12;
      Swift::Int v13 = v12[1];
      Swift::Int v14 = (void *)(*v11 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_name);
      unsigned int v15 = result == *v14 && v13 == v14[1];
      if (v15 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 8;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t v16 = *v11;
      uint64_t v9 = v11[1];
      *uint64_t v11 = v9;
      v11[1] = v16;
      --v11;
      if (v4 == ++v10) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  uint64_t v19;
  uint64_t v20;
  long long v21;
  uint64_t v23;
  void v24[3];
  uint64_t v25;
  uint64_t v26;
  long long v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  unint64_t v23 = result;
  if (a3 != a2)
  {
    uint64_t v5 = a3;
    uint64_t v6 = 40 * a3 - 40;
LABEL_6:
    uint64_t v7 = v23;
    Swift::Int v30 = v6;
    while (1)
    {
      uint64_t v8 = *a4 + v6;
      outlined init with copy of SILFileHandle(v8 + 40, (uint64_t)&v27);
      outlined init with copy of SILFileHandle(v8, (uint64_t)v24);
      uint64_t v9 = v28;
      Swift::Int v10 = v29;
      __swift_project_boxed_opaque_existential_1(&v27, v28);
      uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 24))(v9, v10);
      Swift::Int v13 = v12;
      unsigned int v15 = v25;
      Swift::Int v14 = v26;
      __swift_project_boxed_opaque_existential_1(v24, v25);
      if (v11 == (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 24))(v15, v14) && v13 == v16)
      {
        swift_bridgeObjectRelease_n();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v27);
LABEL_5:
        ++v5;
        uint64_t v6 = v30 + 40;
        if (v5 == a2) {
          return result;
        }
        goto LABEL_6;
      }
      id v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v27);
      if ((v18 & 1) == 0) {
        goto LABEL_5;
      }
      uint64_t v19 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v20 = v19 + v6;
      outlined init with take of SILFileHandle((long long *)(v19 + v6 + 40), (uint64_t)&v27);
      uint64_t v21 = *(_OWORD *)(v20 + 16);
      *(_OWORD *)(v20 + 40) = *(_OWORD *)v20;
      *(_OWORD *)(v20 + 56) = v21;
      *(void *)(v20 + 72) = *(void *)(v20 + 32);
      uint64_t result = outlined init with take of SILFileHandle(&v27, v20);
      v6 -= 40;
      if (v5 == ++v7) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  return result;
}

void specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  if (a3 != a2)
  {
    uint64_t v5 = a3;
    uint64_t v27 = *a4;
    uint64_t v6 = (uint64_t *)(*a4 + 16 * a3);
LABEL_5:
    uint64_t v7 = *(void *)(v27 + 16 * v5 + 8);
    uint64_t v8 = a1;
    uint64_t v26 = v6;
    uint64_t v28 = v5;
    while (1)
    {
      uint64_t v9 = *a5;
      if (!*(void *)(*a5 + 16)) {
        break;
      }
      uint64_t v11 = *(v6 - 2);
      uint64_t v10 = *(v6 - 1);
      uint64_t v12 = *v6;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      unint64_t v13 = specialized __RawDictionaryStorage.find<A>(_:)(v12, v7);
      if ((v14 & 1) == 0) {
        goto LABEL_16;
      }
      unsigned int v15 = (char *)*(id *)(*(void *)(v9 + 56) + 8 * v13);
      swift_bridgeObjectRelease();
      uint64_t v16 = (char *)*(id *)&v15[OBJC_IVAR____TtC10SILManager16SILFlipBookState_selfTransition];

      unsigned int v17 = *(unsigned __int16 *)&v16[OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame];
      uint64_t v18 = *a5;
      if (!*(void *)(*a5 + 16)) {
        goto LABEL_15;
      }
      swift_bridgeObjectRetain();
      unint64_t v19 = specialized __RawDictionaryStorage.find<A>(_:)(v11, v10);
      if ((v20 & 1) == 0) {
        goto LABEL_17;
      }
      uint64_t v21 = (char *)*(id *)(*(void *)(v18 + 56) + 8 * v19);
      swift_bridgeObjectRelease();
      uint64_t v22 = (char *)*(id *)&v21[OBJC_IVAR____TtC10SILManager16SILFlipBookState_selfTransition];

      LODWORD(v21) = *(unsigned __int16 *)&v22[OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      if (v17 < v21)
      {
        if (!v27) {
          goto LABEL_18;
        }
        uint64_t v23 = *v6;
        uint64_t v7 = v6[1];
        *(_OWORD *)uint64_t v6 = *((_OWORD *)v6 - 1);
        *(v6 - 1) = v7;
        *(v6 - 2) = v23;
        v6 -= 2;
        if (v28 != ++v8) {
          continue;
        }
      }
      uint64_t v5 = v28 + 1;
      uint64_t v6 = v26 + 2;
      if (v28 + 1 == a2) {
        return;
      }
      goto LABEL_5;
    }
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    swift_bridgeObjectRelease();
    __break(1u);
LABEL_17:
    swift_bridgeObjectRelease();
    __break(1u);
LABEL_18:
    __break(1u);
  }
}

void specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v19 = *a4;
    uint64_t v5 = *a4 + 8 * a3 - 8;
    uint64_t v6 = (void *)MEMORY[0x263F8EED0];
LABEL_5:
    uint64_t v7 = *(void **)(v19 + 8 * v4);
    uint64_t v8 = a1;
    uint64_t v18 = v5;
    while (1)
    {
      uint64_t v9 = *(void **)v5;
      uint64_t v10 = *(uint64_t (**)(void))((*v6 & *v7) + 0xA8);
      uint64_t v11 = v7;
      uint64_t v12 = v9;
      uint64_t v13 = v10();
      uint64_t v14 = (*(uint64_t (**)(void))((*v6 & *v12) + 0xA8))();

      if (v13 >= v14)
      {
LABEL_4:
        ++v4;
        uint64_t v5 = v18 + 8;
        if (v4 == a2) {
          return;
        }
        goto LABEL_5;
      }
      if (!v19) {
        break;
      }
      unsigned int v15 = *(void **)v5;
      uint64_t v7 = *(void **)(v5 + 8);
      *(void *)uint64_t v5 = v7;
      *(void *)(v5 + 8) = v15;
      v5 -= 8;
      if (v4 == ++v8) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

uint64_t specialized _merge<A>(low:mid:high:buffer:by:)(char *__dst, char *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = __src - __dst + 7;
  if (__src - __dst >= 0) {
    int64_t v9 = __src - __dst;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)__src;
  uint64_t v12 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v12 = a3 - (void)__src;
  }
  uint64_t v13 = v12 >> 3;
  if (v10 >= v12 >> 3)
  {
    if (a4 != __src || &__src[8 * v13] <= a4) {
      memmove(a4, __src, 8 * v13);
    }
    uint64_t v14 = &v4[8 * v13];
    if (v7 >= v6 || v11 < 8) {
      goto LABEL_39;
    }
    unsigned int v17 = (char *)(a3 - 8);
    uint64_t v18 = v6;
    while (1)
    {
      uint64_t v19 = v17 + 8;
      uint64_t v21 = *((void *)v18 - 1);
      v18 -= 8;
      uint64_t v20 = v21;
      if (*(unsigned __int16 *)(*((void *)v14 - 1)
                               + OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame) < *(unsigned __int16 *)(v21 + OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame))
        break;
      uint64_t v20 = *((void *)v14 - 1);
      uint64_t v18 = v6;
      if (v19 != v14)
      {
        v14 -= 8;
LABEL_35:
        *(void *)unsigned int v17 = v20;
        goto LABEL_36;
      }
      BOOL v22 = v17 >= v14;
      v14 -= 8;
      if (v22) {
        goto LABEL_35;
      }
LABEL_36:
      if (v18 > v7)
      {
        v17 -= 8;
        uint64_t v6 = v18;
        if (v14 > v4) {
          continue;
        }
      }
      uint64_t v6 = v18;
      goto LABEL_39;
    }
    if (v19 == v6 && v17 < v6) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  if (a4 != __dst || &__dst[8 * v10] <= a4) {
    memmove(a4, __dst, 8 * v10);
  }
  uint64_t v14 = &v4[8 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 8)
  {
    while (1)
    {
      uint64_t v15 = *(void *)v6;
      if (*(unsigned __int16 *)(*(void *)v6 + OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame) >= *(unsigned __int16 *)(*(void *)v4 + OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame)) {
        break;
      }
      BOOL v16 = v7 == v6;
      v6 += 8;
      if (!v16) {
        goto LABEL_16;
      }
LABEL_17:
      v7 += 8;
      if (v4 >= v14 || (unint64_t)v6 >= a3) {
        goto LABEL_19;
      }
    }
    uint64_t v15 = *(void *)v4;
    BOOL v16 = v7 == v4;
    v4 += 8;
    if (v16) {
      goto LABEL_17;
    }
LABEL_16:
    *(void *)uint64_t v7 = v15;
    goto LABEL_17;
  }
LABEL_19:
  uint64_t v6 = v7;
LABEL_39:
  int64_t v23 = v14 - v4 + (v14 - v4 < 0 ? 7uLL : 0);
  if (v6 != v4 || v6 >= &v4[v23 & 0xFFFFFFFFFFFFFFF8]) {
    memmove(v6, v4, 8 * (v23 >> 3));
  }
  return 1;
}

{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  BOOL v29;

  uint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = __src - __dst + 7;
  if (__src - __dst >= 0) {
    int64_t v9 = __src - __dst;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)__src;
  uint64_t v12 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v12 = a3 - (void)__src;
  }
  uint64_t v13 = v12 >> 3;
  if (v10 >= v12 >> 3)
  {
    if (a4 != __src || &__src[8 * v13] <= a4) {
      memmove(a4, __src, 8 * v13);
    }
    uint64_t v14 = &v4[8 * v13];
    if (v7 >= v6 || v11 < 8) {
      goto LABEL_48;
    }
    uint64_t v21 = (char *)(a3 - 8);
    while (1)
    {
      BOOL v22 = v21 + 8;
      int64_t v23 = v6 - 8;
      id v24 = (uint64_t *)(*((void *)v14 - 1) + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_name);
      uint64_t v25 = *v24;
      uint64_t v26 = v24[1];
      uint64_t v27 = (void *)(*((void *)v6 - 1) + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_name);
      uint64_t v28 = v25 == *v27 && v26 == v27[1];
      if (v28 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        int64_t v23 = v14 - 8;
        if (v22 != v14)
        {
          v14 -= 8;
LABEL_45:
          *(void *)uint64_t v21 = *(void *)v23;
          goto LABEL_46;
        }
        Swift::Int v29 = v21 >= v14;
        v14 -= 8;
        if (v29) {
          goto LABEL_45;
        }
      }
      else
      {
        if (v22 != v6)
        {
          v6 -= 8;
          goto LABEL_45;
        }
        Swift::Int v29 = v21 >= v6;
        v6 -= 8;
        if (v29) {
          goto LABEL_45;
        }
      }
LABEL_46:
      if (v6 > v7)
      {
        v21 -= 8;
        if (v14 > v4) {
          continue;
        }
      }
      goto LABEL_48;
    }
  }
  if (a4 != __dst || &__dst[8 * v10] <= a4) {
    memmove(a4, __dst, 8 * v10);
  }
  uint64_t v14 = &v4[8 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 8)
  {
    while (1)
    {
      uint64_t v15 = (uint64_t *)(*(void *)v6 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_name);
      BOOL v16 = *v15;
      unsigned int v17 = v15[1];
      uint64_t v18 = (void *)(*(void *)v4 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_name);
      uint64_t v19 = v16 == *v18 && v17 == v18[1];
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
        break;
      }
      uint64_t v20 = v6;
      uint64_t v19 = v7 == v6;
      v6 += 8;
      if (!v19) {
        goto LABEL_20;
      }
LABEL_21:
      v7 += 8;
      if (v4 >= v14 || (unint64_t)v6 >= a3) {
        goto LABEL_23;
      }
    }
    uint64_t v20 = v4;
    uint64_t v19 = v7 == v4;
    v4 += 8;
    if (v19) {
      goto LABEL_21;
    }
LABEL_20:
    *(void *)uint64_t v7 = *(void *)v20;
    goto LABEL_21;
  }
LABEL_23:
  uint64_t v6 = v7;
LABEL_48:
  if (v6 != v4 || v6 >= &v4[(v14 - v4 + (v14 - v4 < 0 ? 7uLL : 0)) & 0xFFFFFFFFFFFFFFF8]) {
    memmove(v6, v4, 8 * ((v14 - v4) / 8));
  }
  return 1;
}

uint64_t specialized _merge<A>(low:mid:high:buffer:by:)(uint64_t *__src, uint64_t *__dst, unint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v5 = a4;
  uint64_t v6 = __src;
  int64_t v7 = (char *)__dst - (char *)__src;
  int64_t v8 = (char *)__dst - (char *)__src + 15;
  if ((char *)__dst - (char *)__src >= 0) {
    int64_t v8 = (char *)__dst - (char *)__src;
  }
  uint64_t v9 = v8 >> 4;
  uint64_t v10 = a3 - (void)__dst;
  uint64_t v11 = a3 - (void)__dst + 15;
  if ((uint64_t)(a3 - (void)__dst) >= 0) {
    uint64_t v11 = a3 - (void)__dst;
  }
  uint64_t v12 = v11 >> 4;
  if (v9 < v11 >> 4)
  {
    if (a4 != __src || &__src[2 * v9] <= a4)
    {
      uint64_t v13 = __dst;
      memmove(a4, __src, 16 * v9);
      __dst = v13;
    }
    uint64_t v14 = &v5[2 * v9];
    if ((unint64_t)__dst < a3 && v7 >= 16)
    {
      unint64_t v62 = &v5[2 * v9];
      while (1)
      {
        uint64_t v15 = *a5;
        if (!*(void *)(*a5 + 16))
        {
          __break(1u);
          goto LABEL_57;
        }
        BOOL v16 = v6;
        unsigned int v17 = v5;
        uint64_t v18 = *v5;
        uint64_t v19 = v5[1];
        uint64_t v20 = *__dst;
        uint64_t v21 = __dst[1];
        BOOL v22 = __dst;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        unint64_t v23 = specialized __RawDictionaryStorage.find<A>(_:)(v20, v21);
        if ((v24 & 1) == 0) {
          goto LABEL_60;
        }
        uint64_t v25 = (char *)*(id *)(*(void *)(v15 + 56) + 8 * v23);
        swift_bridgeObjectRelease();
        uint64_t v26 = (char *)*(id *)&v25[OBJC_IVAR____TtC10SILManager16SILFlipBookState_selfTransition];

        unsigned int v27 = *(unsigned __int16 *)&v26[OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame];
        uint64_t v28 = *a5;
        if (!*(void *)(*a5 + 16)) {
          goto LABEL_58;
        }
        swift_bridgeObjectRetain();
        unint64_t v29 = specialized __RawDictionaryStorage.find<A>(_:)(v18, v19);
        if ((v30 & 1) == 0) {
          goto LABEL_62;
        }
        uint64_t v31 = (char *)*(id *)(*(void *)(v28 + 56) + 8 * v29);
        swift_bridgeObjectRelease();
        uint64_t v32 = (char *)*(id *)&v31[OBJC_IVAR____TtC10SILManager16SILFlipBookState_selfTransition];

        LODWORD(v31) = *(unsigned __int16 *)&v32[OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        if (v27 < v31) {
          break;
        }
        uint64_t v35 = v17;
        uint64_t v5 = v17 + 2;
        Swift::Int v33 = v22;
        uint64_t v34 = v16;
        uint64_t v14 = v62;
        if (v16 != v17) {
          goto LABEL_23;
        }
LABEL_24:
        uint64_t v6 = v34 + 2;
        if (v5 < v14)
        {
          __dst = v33;
          if ((unint64_t)v33 < a3) {
            continue;
          }
        }
        __dst = v6;
        goto LABEL_52;
      }
      Swift::Int v33 = v22 + 2;
      uint64_t v34 = v16;
      uint64_t v5 = v17;
      uint64_t v35 = v22;
      if (v16 == v22)
      {
        uint64_t v14 = v62;
        if (v16 < v33) {
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v14 = v62;
      }
LABEL_23:
      *(_OWORD *)uint64_t v34 = *(_OWORD *)v35;
      goto LABEL_24;
    }
    __dst = v6;
LABEL_52:
    if (__dst != v5
      || __dst >= (uint64_t *)((char *)v5
                            + (((char *)v14 - (char *)v5 + ((char *)v14 - (char *)v5 < 0 ? 0xFuLL : 0)) & 0xFFFFFFFFFFFFFFF0)))
    {
      memmove(__dst, v5, 16 * (((char *)v14 - (char *)v5) / 16));
    }
    return 1;
  }
  if (a4 != __dst || &__dst[2 * v12] <= a4)
  {
    Swift::Int v36 = __dst;
    memmove(a4, __dst, 16 * v12);
    __dst = v36;
  }
  uint64_t v14 = &v5[2 * v12];
  if (v6 >= __dst || v10 < 16) {
    goto LABEL_52;
  }
  uint64_t v58 = v6;
  uint64_t v37 = (uint64_t *)(a3 - 16);
  uint64_t v59 = v5;
  while (1)
  {
    uint64_t v38 = *a5;
    if (!*(void *)(*a5 + 16)) {
      break;
    }
    uint64_t v39 = v14 - 2;
    BOOL v61 = __dst;
    unint64_t v63 = (unint64_t)v14;
    uint64_t v40 = *(v14 - 1);
    uint64_t v41 = *(__dst - 2);
    uint64_t v43 = *(__dst - 1);
    uint64_t v42 = __dst - 2;
    uint64_t v44 = *(v14 - 2);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    unint64_t v45 = specialized __RawDictionaryStorage.find<A>(_:)(v44, v40);
    if ((v46 & 1) == 0) {
      goto LABEL_61;
    }
    unint64_t v47 = (char *)*(id *)(*(void *)(v38 + 56) + 8 * v45);
    swift_bridgeObjectRelease();
    uint64_t v48 = (char *)*(id *)&v47[OBJC_IVAR____TtC10SILManager16SILFlipBookState_selfTransition];

    unsigned int v49 = *(unsigned __int16 *)&v48[OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame];
    uint64_t v50 = *a5;
    if (!*(void *)(*a5 + 16)) {
      goto LABEL_59;
    }
    swift_bridgeObjectRetain();
    unint64_t v51 = specialized __RawDictionaryStorage.find<A>(_:)(v41, v43);
    if ((v52 & 1) == 0) {
      goto LABEL_63;
    }
    uint64_t v53 = v37 + 2;
    char v54 = (char *)*(id *)(*(void *)(v50 + 56) + 8 * v51);
    swift_bridgeObjectRelease();
    uint64_t v55 = (char *)*(id *)&v54[OBJC_IVAR____TtC10SILManager16SILFlipBookState_selfTransition];

    LODWORD(v54) = *(unsigned __int16 *)&v55[OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (v49 >= v54)
    {
      __dst = v61;
      uint64_t v5 = v59;
      uint64_t v42 = v39;
      if (v53 == (uint64_t *)v63)
      {
        uint64_t v14 = v39;
        unint64_t v56 = (unint64_t)v58;
        if ((unint64_t)v37 < v63) {
          goto LABEL_48;
        }
        goto LABEL_47;
      }
      uint64_t v14 = v39;
    }
    else
    {
      uint64_t v5 = v59;
      uint64_t v14 = (uint64_t *)v63;
      if (v53 == v61)
      {
        __dst = v42;
        unint64_t v56 = (unint64_t)v58;
        if (v37 < v61) {
          goto LABEL_48;
        }
        goto LABEL_47;
      }
      __dst = v42;
    }
    unint64_t v56 = (unint64_t)v58;
LABEL_47:
    *(_OWORD *)uint64_t v37 = *(_OWORD *)v42;
LABEL_48:
    if ((unint64_t)__dst > v56)
    {
      v37 -= 2;
      if (v14 > v5) {
        continue;
      }
    }
    goto LABEL_52;
  }
LABEL_57:
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_61:
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_62:
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_63:
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t specialized _merge<A>(low:mid:high:buffer:by:)(void **__dst, id *__src, unint64_t a3, void **a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = __src;
  uint64_t v6 = __dst;
  int64_t v7 = (char *)__src - (char *)__dst;
  int64_t v8 = (char *)__src - (char *)__dst + 7;
  if ((char *)__src - (char *)__dst >= 0) {
    int64_t v8 = (char *)__src - (char *)__dst;
  }
  uint64_t v9 = v8 >> 3;
  uint64_t v10 = a3 - (void)__src;
  uint64_t v11 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v11 = a3 - (void)__src;
  }
  uint64_t v12 = v11 >> 3;
  if (v9 >= v11 >> 3)
  {
    if (a4 != __src || &__src[v12] <= a4) {
      memmove(a4, __src, 8 * v12);
    }
    uint64_t v13 = &v4[v12];
    if (v6 >= v5 || v10 < 8) {
      goto LABEL_40;
    }
    char v24 = (id *)(a3 - 8);
    uint64_t v37 = v6;
    uint64_t v38 = v4;
    while (1)
    {
      unint64_t v42 = (unint64_t)v13;
      uint64_t v40 = v24 + 1;
      uint64_t v25 = *--v13;
      uint64_t v26 = v5 - 1;
      unsigned int v27 = *(v5 - 1);
      uint64_t v28 = v5;
      unint64_t v29 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v25) + 0xA8);
      char v30 = v25;
      uint64_t v31 = v27;
      uint64_t v32 = v29();
      uint64_t v33 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v31) + 0xA8))();

      if (v32 >= v33) {
        break;
      }
      uint64_t v13 = (void **)v42;
      if (v40 != v28)
      {
        uint64_t v5 = v26;
        goto LABEL_36;
      }
      BOOL v34 = v24 >= v28;
      uint64_t v5 = v26;
      uint64_t v4 = v38;
      unint64_t v35 = (unint64_t)v37;
      if (v34) {
        goto LABEL_37;
      }
LABEL_38:
      if ((unint64_t)v5 > v35)
      {
        --v24;
        if (v13 > v4) {
          continue;
        }
      }
      goto LABEL_40;
    }
    if (v40 == (id *)v42)
    {
      uint64_t v26 = v13;
      uint64_t v4 = v38;
      uint64_t v5 = v28;
      unint64_t v35 = (unint64_t)v37;
      if ((unint64_t)v24 < v42) {
        goto LABEL_38;
      }
    }
    else
    {
      uint64_t v26 = v13;
      uint64_t v5 = v28;
LABEL_36:
      unint64_t v35 = (unint64_t)v37;
      uint64_t v4 = v38;
    }
LABEL_37:
    id *v24 = *v26;
    goto LABEL_38;
  }
  if (a4 != __dst || &__dst[v9] <= a4) {
    memmove(a4, __dst, 8 * v9);
  }
  uint64_t v13 = &v4[v9];
  if ((unint64_t)v5 < a3 && v7 >= 8)
  {
    uint64_t v41 = &v4[v9];
    while (1)
    {
      uint64_t v14 = *v4;
      uint64_t v15 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *(void *)*v5) + 0xA8);
      id v16 = *v5;
      unsigned int v17 = v14;
      uint64_t v18 = v5;
      uint64_t v19 = v17;
      uint64_t v20 = v15();
      uint64_t v21 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v19) + 0xA8))();

      if (v20 >= v21) {
        break;
      }
      BOOL v22 = v18;
      uint64_t v5 = v18 + 1;
      if (v6 != v18) {
        goto LABEL_16;
      }
LABEL_17:
      ++v6;
      uint64_t v13 = v41;
      if (v4 >= v41 || (unint64_t)v5 >= a3) {
        goto LABEL_19;
      }
    }
    BOOL v22 = v4;
    BOOL v23 = v6 == v4++;
    uint64_t v5 = v18;
    if (v23) {
      goto LABEL_17;
    }
LABEL_16:
    uint64_t *v6 = *v22;
    goto LABEL_17;
  }
LABEL_19:
  uint64_t v5 = v6;
LABEL_40:
  if (v5 != v4
    || v5 >= (void **)((char *)v4
                     + (((char *)v13 - (char *)v4 + ((char *)v13 - (char *)v4 < 0 ? 7uLL : 0)) & 0xFFFFFFFFFFFFFFF8)))
  {
    memmove(v5, v4, 8 * (v13 - v4));
  }
  return 1;
}

uint64_t specialized _merge<A>(low:mid:high:buffer:by:)(char *__dst, char *__src, char *a3, char *a4)
{
  uint64_t v5 = __src;
  uint64_t v6 = __dst;
  int64_t v7 = __src - __dst;
  int64_t v8 = (__src - __dst) / 40;
  unint64_t v56 = a3;
  uint64_t v9 = a3 - __src;
  uint64_t v10 = (a3 - __src) / 40;
  if (v8 >= v10)
  {
    uint64_t v12 = a4;
    if (a4 != __src || &__src[40 * v10] <= a4) {
      memmove(a4, __src, 40 * v10);
    }
    uint64_t v11 = &a4[40 * v10];
    if (v6 >= v5 || v9 < 40) {
      goto LABEL_48;
    }
    char v30 = v56 - 40;
    uint64_t v48 = a4;
    while (1)
    {
      unsigned int v49 = v11;
      uint64_t v31 = v11 - 40;
      outlined init with copy of SILFileHandle((uint64_t)(v11 - 40), (uint64_t)v53);
      unint64_t v56 = v5;
      uint64_t v32 = v5 - 40;
      outlined init with copy of SILFileHandle((uint64_t)(v5 - 40), (uint64_t)v50);
      uint64_t v33 = v54;
      uint64_t v34 = v55;
      __swift_project_boxed_opaque_existential_1(v53, v54);
      uint64_t v35 = (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 24))(v33, v34);
      uint64_t v37 = v36;
      uint64_t v38 = v51;
      uint64_t v39 = v52;
      __swift_project_boxed_opaque_existential_1(v50, v51);
      if (v35 == (*(uint64_t (**)(uint64_t, uint64_t))(v39 + 24))(v38, v39) && v37 == v40) {
        char v42 = 0;
      }
      else {
        char v42 = _stringCompareWithSmolCheck(_:_:expecting:)();
      }
      uint64_t v43 = v30 + 40;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
      uint64_t v12 = v48;
      if (v42)
      {
        uint64_t v11 = v49;
        if (v43 == v56)
        {
          uint64_t v5 = v32;
          if (v30 < v56) {
            goto LABEL_46;
          }
        }
        else
        {
          uint64_t v5 = v32;
        }
      }
      else
      {
        uint64_t v5 = v56;
        uint64_t v32 = v31;
        if (v43 == v49)
        {
          uint64_t v11 = v31;
          if (v30 < v49) {
            goto LABEL_46;
          }
        }
        else
        {
          uint64_t v11 = v31;
        }
      }
      long long v44 = *(_OWORD *)v32;
      long long v45 = *((_OWORD *)v32 + 1);
      *((void *)v30 + 4) = *((void *)v32 + 4);
      *(_OWORD *)char v30 = v44;
      *((_OWORD *)v30 + 1) = v45;
LABEL_46:
      if (v11 > v48)
      {
        v30 -= 40;
        if (v5 > v6) {
          continue;
        }
      }
      goto LABEL_48;
    }
  }
  if (a4 != __dst || &__dst[40 * v8] <= a4) {
    memmove(a4, __dst, 40 * v8);
  }
  uint64_t v11 = &a4[40 * v8];
  uint64_t v12 = a4;
  if (v5 < v56 && v7 >= 40)
  {
    while (1)
    {
      uint64_t v13 = v11;
      uint64_t v14 = v5;
      outlined init with copy of SILFileHandle((uint64_t)v5, (uint64_t)v53);
      outlined init with copy of SILFileHandle((uint64_t)v12, (uint64_t)v50);
      uint64_t v15 = v54;
      uint64_t v16 = v55;
      __swift_project_boxed_opaque_existential_1(v53, v54);
      uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 24))(v15, v16);
      uint64_t v19 = v18;
      uint64_t v21 = v51;
      uint64_t v20 = v52;
      __swift_project_boxed_opaque_existential_1(v50, v51);
      if (v17 == (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 24))(v21, v20) && v19 == v22)
      {
        swift_bridgeObjectRelease_n();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
      }
      else
      {
        char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
        if (v24)
        {
          uint64_t v25 = v14;
          uint64_t v26 = v14 + 40;
          if (v6 == v14 && v6 < v26) {
            goto LABEL_21;
          }
          goto LABEL_20;
        }
      }
      unsigned int v27 = v12 + 40;
      uint64_t v26 = v14;
      uint64_t v25 = v12;
      if (v6 == v12)
      {
        v12 += 40;
        if (v6 < v27) {
          goto LABEL_21;
        }
      }
      else
      {
        v12 += 40;
      }
LABEL_20:
      long long v28 = *(_OWORD *)v25;
      long long v29 = *((_OWORD *)v25 + 1);
      *((void *)v6 + 4) = *((void *)v25 + 4);
      *(_OWORD *)uint64_t v6 = v28;
      *((_OWORD *)v6 + 1) = v29;
LABEL_21:
      v6 += 40;
      uint64_t v11 = v13;
      if (v12 < v13)
      {
        uint64_t v5 = v26;
        if (v26 < v56) {
          continue;
        }
      }
      break;
    }
  }
  uint64_t v5 = v6;
LABEL_48:
  uint64_t v46 = (v11 - v12) / 40;
  if (v5 != v12 || v5 >= &v12[40 * v46]) {
    memmove(v5, v12, 40 * v46);
  }
  return 1;
}

char *specialized _ArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, (char *)a1);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, (char *)a1);
}

unsigned __int8 *specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v14 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v15 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v16 = a3 + 55;
        }
        else
        {
          unsigned __int8 v15 = 97;
          unsigned __int8 v16 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v17 = a3 + 48;
        }
        else {
          unsigned __int8 v17 = 58;
        }
        if (result)
        {
          LOWORD(v8) = 0;
          uint64_t v18 = result + 1;
          do
          {
            unsigned int v19 = *v18;
            if (v19 < 0x30 || v19 >= v17)
            {
              if (v19 < 0x41 || v19 >= v16)
              {
                unsigned __int16 v12 = 0;
                int v13 = 1;
                if (v19 < 0x61 || v19 >= v15) {
                  return (unsigned __int8 *)(v12 | (v13 << 16));
                }
                char v20 = -87;
              }
              else
              {
                char v20 = -55;
              }
            }
            else
            {
              char v20 = -48;
            }
            if ((((unsigned __int16)v8 * (unsigned __int16)a3) & 0xFFFF0000) != 0) {
              goto LABEL_72;
            }
            int v8 = (unsigned __int16)(v8 * a3) + (v19 + v20);
            if ((v8 & 0x10000) != 0) {
              goto LABEL_72;
            }
            ++v18;
            --v14;
          }
          while (v14);
LABEL_48:
          int v13 = 0;
          unsigned __int16 v12 = v8;
          return (unsigned __int8 *)(v12 | (v13 << 16));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned __int16 v12 = 0;
      int v13 = 1;
      return (unsigned __int8 *)(v12 | (v13 << 16));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v21 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v22 = a3 + 55;
        }
        else
        {
          unsigned __int8 v21 = 97;
          unsigned __int8 v22 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v23 = a3 + 48;
        }
        else {
          unsigned __int8 v23 = 58;
        }
        if (result)
        {
          LOWORD(v24) = 0;
          do
          {
            unsigned int v25 = *result;
            if (v25 < 0x30 || v25 >= v23)
            {
              if (v25 < 0x41 || v25 >= v22)
              {
                unsigned __int16 v12 = 0;
                int v13 = 1;
                if (v25 < 0x61 || v25 >= v21) {
                  return (unsigned __int8 *)(v12 | (v13 << 16));
                }
                char v26 = -87;
              }
              else
              {
                char v26 = -55;
              }
            }
            else
            {
              char v26 = -48;
            }
            if ((((unsigned __int16)v24 * (unsigned __int16)a3) & 0xFFFF0000) != 0) {
              goto LABEL_72;
            }
            int v24 = (unsigned __int16)(v24 * a3) + (v25 + v26);
            if ((v24 & 0x10000) != 0) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          int v13 = 0;
          unsigned __int16 v12 = v24;
          return (unsigned __int8 *)(v12 | (v13 << 16));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          LOWORD(v8) = 0;
          uint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned __int16 v12 = 0;
                int v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | (v13 << 16));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            if ((((unsigned __int16)v8 * (unsigned __int16)a3) & 0xFFFF0000) != 0) {
              goto LABEL_72;
            }
            int v8 = (unsigned __int16)(v8 * a3) - (v10 + v11);
            if ((v8 & 0xFFFF0000) != 0) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned __int16 v12 = 0;
        int v13 = 0;
        return (unsigned __int8 *)(v12 | (v13 << 16));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t static String._copying(_:)()
{
  unint64_t v0 = String.subscript.getter();
  uint64_t v4 = static String._copying(_:)(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t static String._copying(_:)(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = specialized Collection.count.getter(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v9, 0);
      unint64_t v12 = specialized Sequence._copySequenceContents(initializing:)((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        _StringObject.sharedUTF8.getter();
LABEL_4:
        JUMPOUT(0x261165890);
      }
    }
    else
    {
      char v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x261165890](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x261165890]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t specialized Collection.count.getter(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = _StringGuts._slowEnsureMatchingEncoding(_:)(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = _StringGuts._slowEnsureMatchingEncoding(_:)(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _DWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t specialized Sequence._copySequenceContents(initializing:)(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    void v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = String.UTF8View._foreignSubscript(position:)();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = _StringObject.sharedUTF8.getter();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = String.UTF8View._foreignIndex(after:)();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t _StringGuts._slowEnsureMatchingEncoding(_:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x2611658E0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t specialized Dictionary._Variant.removeValue(forKey:)(uint64_t a1, uint64_t a2)
{
  char v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *char v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    specialized _NativeDictionary.copy()();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  specialized _NativeDictionary._delete(at:)(v6, v9);
  *char v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, [SILFlipBookTransitionPoint]>);
  char v36 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    long long v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *char v3 = v7;
  return result;
}

{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  void *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  char v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, SILFlipBookState>);
  uint64_t v38 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  char v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          char v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    long long v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v33 = v32;
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  int64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *char v3 = v7;
  return result;
}

{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  void *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  char v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Int>);
  uint64_t v37 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  char v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = v2;
  uint64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          char v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    long long v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v3 = v34;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *char v3 = v7;
  return result;
}

unint64_t specialized _NativeDictionary._delete(at:)(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v9 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    specialized _NativeDictionary.copy()();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v15, a4 & 1);
  unint64_t v20 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;
  swift_bridgeObjectRetain();
}

void *specialized _NativeDictionary.copy()()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, [SILFlipBookTransitionPoint]>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Int>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    unint64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    int64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      int64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    char v21 = *(void *)(*(void *)(v2 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  uint64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  int64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    int64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id specialized _NativeDictionary.copy()()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, SILFlipBookState>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void (*specialized protocol witness for Collection.subscript.read in conformance [A](void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = specialized Array.subscript.read(v6, a2, a3);
  return protocol witness for Collection.subscript.read in conformance [A]specialized ;
}

void protocol witness for Collection.subscript.read in conformance [A]specialized (void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*specialized Array.subscript.read(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x261165AD0](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return Array.subscript.readspecialized ;
  }
  __break(1u);
  return result;
}

void Array.subscript.readspecialized (id *a1)
{
}

void specialized _ArrayBuffer._consumeAndCreateNew()(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x261165AE0);
}

uint64_t specialized Array._copyContents(initializing:)(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    id result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
      id result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          lazy protocol witness table accessor for type [SILIndicatorDesc] and conformance [A]();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SILIndicatorDesc]);
            uint64_t v10 = specialized protocol witness for Collection.subscript.read in conformance [A](v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        type metadata accessor for SILIndicatorDesc();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    id result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *specialized _ContiguousArrayBuffer._consumeAndCreateNew()(void *a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

unint64_t specialized FrameDesc.CodingKeys.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of FrameDesc.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 6) {
    return 6;
  }
  else {
    return v3;
  }
}

unint64_t lazy protocol witness table accessor for type SILConstraints.CodingKeys and conformance SILConstraints.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SILConstraints.CodingKeys and conformance SILConstraints.CodingKeys;
  if (!lazy protocol witness table cache variable for type SILConstraints.CodingKeys and conformance SILConstraints.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SILConstraints.CodingKeys and conformance SILConstraints.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SILConstraints.CodingKeys and conformance SILConstraints.CodingKeys;
  if (!lazy protocol witness table cache variable for type SILConstraints.CodingKeys and conformance SILConstraints.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SILConstraints.CodingKeys and conformance SILConstraints.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SILConstraints.CodingKeys and conformance SILConstraints.CodingKeys;
  if (!lazy protocol witness table cache variable for type SILConstraints.CodingKeys and conformance SILConstraints.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SILConstraints.CodingKeys and conformance SILConstraints.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SILConstraints.CodingKeys and conformance SILConstraints.CodingKeys;
  if (!lazy protocol witness table cache variable for type SILConstraints.CodingKeys and conformance SILConstraints.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SILConstraints.CodingKeys and conformance SILConstraints.CodingKeys);
  }
  return result;
}

uint64_t type metadata accessor for SILConstraints()
{
  return self;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [[String : Double]] and conformance <A> [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [[String : Double]] and conformance <A> [A];
  if (!lazy protocol witness table cache variable for type [[String : Double]] and conformance <A> [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [[String : Double]]);
    lazy protocol witness table accessor for type [String : Double] and conformance <> [A : B]();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [[String : Double]] and conformance <A> [A]);
  }
  return result;
}

uint64_t type metadata accessor for SILBoundingBoxes()
{
  return self;
}

void *specialized Sequence.first(where:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_17;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v7 = 4;
    while (1)
    {
      uint64_t v8 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x261165AD0](v7 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v7);
      unint64_t v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      BOOL v11 = *(void *)&v8[OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_name] == a2
         && *(void *)&v8[OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_name + 8] == a3;
      if (v11 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return v9;
      }

      ++v7;
      if (v10 == v6) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

unint64_t specialized SILConstraints.CodingKeys.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of SILConstraints.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 4) {
    return 4;
  }
  else {
    return v3;
  }
}

uint64_t outlined init with copy of SILFileHandle?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SILFileHandle?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined assign with take of SILFileHandle?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SILFileHandle?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t specialized SILIndicatorDesc.CodingKeys.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of SILIndicatorDesc.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 9) {
    return 9;
  }
  else {
    return v3;
  }
}

unint64_t lazy protocol witness table accessor for type SILIndicatorDesc.CodingKeys and conformance SILIndicatorDesc.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SILIndicatorDesc.CodingKeys and conformance SILIndicatorDesc.CodingKeys;
  if (!lazy protocol witness table cache variable for type SILIndicatorDesc.CodingKeys and conformance SILIndicatorDesc.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SILIndicatorDesc.CodingKeys and conformance SILIndicatorDesc.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SILIndicatorDesc.CodingKeys and conformance SILIndicatorDesc.CodingKeys;
  if (!lazy protocol witness table cache variable for type SILIndicatorDesc.CodingKeys and conformance SILIndicatorDesc.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SILIndicatorDesc.CodingKeys and conformance SILIndicatorDesc.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SILIndicatorDesc.CodingKeys and conformance SILIndicatorDesc.CodingKeys;
  if (!lazy protocol witness table cache variable for type SILIndicatorDesc.CodingKeys and conformance SILIndicatorDesc.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SILIndicatorDesc.CodingKeys and conformance SILIndicatorDesc.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SILIndicatorDesc.CodingKeys and conformance SILIndicatorDesc.CodingKeys;
  if (!lazy protocol witness table cache variable for type SILIndicatorDesc.CodingKeys and conformance SILIndicatorDesc.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SILIndicatorDesc.CodingKeys and conformance SILIndicatorDesc.CodingKeys);
  }
  return result;
}

uint64_t outlined destroy of SILFileHandle?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SILFileHandle?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for SILIndicatorDesc()
{
  return self;
}

unint64_t lazy protocol witness table accessor for type [FrameDesc] and conformance <A> [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [FrameDesc] and conformance <A> [A];
  if (!lazy protocol witness table cache variable for type [FrameDesc] and conformance <A> [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [FrameDesc]);
    lazy protocol witness table accessor for type FrameDesc and conformance FrameDesc(&lazy protocol witness table cache variable for type FrameDesc and conformance FrameDesc, (void (*)(void))type metadata accessor for FrameDesc);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [FrameDesc] and conformance <A> [A]);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type [String] and conformance <A> [A](unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for SILFlipBookDesc()
{
  return self;
}

unint64_t specialized static SILFlipBookTransitionPoint.parseTransitionPoints(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  unint64_t v41 = MEMORY[0x263F8EE78];
  uint64_t v5 = a2 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a2 + 64);
  int64_t v39 = (unint64_t)(v6 + 63) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  if (!v8) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v11 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v11 | (v10 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v10 << 6))
  {
    unint64_t v16 = (uint64_t *)(*(void *)(a2 + 48) + 16 * i);
    uint64_t v17 = *v16;
    unint64_t v18 = v16[1];
    uint64_t v19 = *(void *)(*(void *)(a2 + 56) + 8 * i);
    uint64_t v20 = HIBYTE(v18) & 0xF;
    uint64_t v21 = *v16 & 0xFFFFFFFFFFFFLL;
    if ((v18 & 0x2000000000000000) != 0) {
      uint64_t v22 = HIBYTE(v18) & 0xF;
    }
    else {
      uint64_t v22 = *v16 & 0xFFFFFFFFFFFFLL;
    }
    if (!v22)
    {
      unint64_t result = swift_bridgeObjectRetain();
      __break(1u);
LABEL_85:
      __break(1u);
LABEL_86:
      __break(1u);
LABEL_87:
      __break(1u);
      goto LABEL_88;
    }
    if ((v18 & 0x1000000000000000) == 0)
    {
      if ((v18 & 0x2000000000000000) == 0)
      {
        if ((v17 & 0x1000000000000000) != 0) {
          unint64_t v23 = (unsigned __int8 *)((v18 & 0xFFFFFFFFFFFFFFFLL) + 32);
        }
        else {
          unint64_t v23 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
        }
        unsigned int v24 = specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v23, v21, 10);
        LOWORD(v25) = v24;
        int v26 = HIWORD(v24) & 1;
LABEL_55:
        unint64_t result = swift_bridgeObjectRetain();
        if (v26) {
          goto LABEL_89;
        }
        goto LABEL_56;
      }
      v40[0] = v17;
      v40[1] = v18 & 0xFFFFFFFFFFFFFFLL;
      if (v17 == 43)
      {
        if (!v20) {
          goto LABEL_87;
        }
        if (v20 == 1) {
          goto LABEL_47;
        }
        unsigned int v25 = (BYTE1(v17) - 48);
        if (v25 > 9) {
          goto LABEL_47;
        }
        if (v20 == 2) {
          goto LABEL_54;
        }
        if ((BYTE2(v17) - 48) <= 9u)
        {
          LOWORD(v25) = 10 * v25 + (BYTE2(v17) - 48);
          uint64_t v28 = v20 - 3;
          if (v28)
          {
            long long v29 = (unsigned __int8 *)v40 + 3;
            while (1)
            {
              unsigned int v30 = *v29 - 48;
              if (v30 > 9) {
                goto LABEL_47;
              }
              if (((10 * (unsigned __int16)v25) & 0xF0000) != 0) {
                goto LABEL_47;
              }
              unsigned int v25 = (unsigned __int16)(10 * v25) + v30;
              if ((v25 & 0x10000) != 0) {
                goto LABEL_47;
              }
              int v26 = 0;
              ++v29;
              if (!--v28) {
                goto LABEL_55;
              }
            }
          }
          goto LABEL_54;
        }
      }
      else if (v17 == 45)
      {
        if (!v20) {
          goto LABEL_86;
        }
        if (v20 != 1 && (BYTE1(v17) - 48) <= 9u)
        {
          LOWORD(v25) = 0;
          int v27 = -(BYTE1(v17) - 48);
          if ((v27 & 0xFFFF0000) != 0)
          {
LABEL_48:
            int v26 = 1;
            goto LABEL_55;
          }
          if (v20 == 2)
          {
            int v26 = 0;
            LOWORD(v25) = v27;
            goto LABEL_55;
          }
          if ((BYTE2(v17) - 48) <= 9u
            && ((10 * (unsigned __int16)-(BYTE1(v17) - 48)) & 0xF0000) == 0)
          {
            unsigned int v25 = (unsigned __int16)(-10 * (BYTE1(v17) - 48)) - (BYTE2(v17) - 48);
            if ((v25 & 0xFFFF0000) == 0)
            {
              uint64_t v36 = v20 - 3;
              if (v36)
              {
                uint64_t v37 = (unsigned __int8 *)v40 + 3;
                while (1)
                {
                  unsigned int v38 = *v37 - 48;
                  if (v38 > 9) {
                    goto LABEL_47;
                  }
                  if (((10 * (unsigned __int16)v25) & 0xF0000) != 0) {
                    goto LABEL_47;
                  }
                  unsigned int v25 = (unsigned __int16)(10 * v25) - v38;
                  if ((v25 & 0xFFFF0000) != 0) {
                    goto LABEL_47;
                  }
                  int v26 = 0;
                  ++v37;
                  if (!--v36) {
                    goto LABEL_55;
                  }
                }
              }
LABEL_54:
              int v26 = 0;
              goto LABEL_55;
            }
          }
        }
      }
      else if (v20)
      {
        unsigned int v25 = (v17 - 48);
        if (v25 <= 9)
        {
          if (v20 == 1) {
            goto LABEL_54;
          }
          if ((BYTE1(v17) - 48) <= 9u)
          {
            LOWORD(v25) = 10 * v25 + (BYTE1(v17) - 48);
            uint64_t v33 = v20 - 2;
            if (v33)
            {
              int64_t v34 = (unsigned __int8 *)v40 + 2;
              while (1)
              {
                unsigned int v35 = *v34 - 48;
                if (v35 > 9) {
                  goto LABEL_47;
                }
                if (((10 * (unsigned __int16)v25) & 0xF0000) != 0) {
                  goto LABEL_47;
                }
                unsigned int v25 = (unsigned __int16)(10 * v25) + v35;
                if ((v25 & 0x10000) != 0) {
                  goto LABEL_47;
                }
                int v26 = 0;
                ++v34;
                if (!--v33) {
                  goto LABEL_55;
                }
              }
            }
            goto LABEL_54;
          }
        }
      }
LABEL_47:
      LOWORD(v25) = 0;
      goto LABEL_48;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unsigned int v25 = specialized _parseInteger<A, B>(ascii:radix:)(v17, v18, 10);
    unint64_t result = swift_bridgeObjectRelease();
    if ((v25 & 0x10000) != 0) {
      goto LABEL_89;
    }
LABEL_56:
    id v31 = objc_allocWithZone((Class)type metadata accessor for SILFlipBookTransitionPoint());
    uint64_t v32 = swift_bridgeObjectRetain();
    SILFlipBookTransitionPoint.init(_:_:_:)(v32, v25, v19);
    if (v3)
    {
      swift_release();
      return swift_bridgeObjectRelease();
    }
    MEMORY[0x261165950]();
    if (*(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    unint64_t result = specialized Array._endMutation()();
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v10++, 1)) {
      goto LABEL_85;
    }
    if (v10 >= v39) {
      goto LABEL_83;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v10);
    if (!v14) {
      break;
    }
LABEL_15:
    unint64_t v8 = (v14 - 1) & v14;
  }
  int64_t v15 = v10 + 1;
  if (v10 + 1 >= v39) {
    goto LABEL_83;
  }
  unint64_t v14 = *(void *)(v5 + 8 * v15);
  if (v14) {
    goto LABEL_14;
  }
  int64_t v15 = v10 + 2;
  if (v10 + 2 >= v39) {
    goto LABEL_83;
  }
  unint64_t v14 = *(void *)(v5 + 8 * v15);
  if (v14) {
    goto LABEL_14;
  }
  int64_t v15 = v10 + 3;
  if (v10 + 3 >= v39)
  {
LABEL_83:
    swift_release();
    specialized MutableCollection<>.sort(by:)(&v41, (void (*)(void *))specialized UnsafeMutableBufferPointer._stableSortImpl(by:));
    return v41;
  }
  unint64_t v14 = *(void *)(v5 + 8 * v15);
  if (v14)
  {
LABEL_14:
    int64_t v10 = v15;
    goto LABEL_15;
  }
  while (1)
  {
    int64_t v10 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v10 >= v39) {
      goto LABEL_83;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v10);
    ++v15;
    if (v14) {
      goto LABEL_15;
    }
  }
LABEL_88:
  __break(1u);
LABEL_89:
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type SILError and conformance SILError()
{
  unint64_t result = lazy protocol witness table cache variable for type SILError and conformance SILError;
  if (!lazy protocol witness table cache variable for type SILError and conformance SILError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SILError and conformance SILError);
  }
  return result;
}

uint64_t type metadata accessor for SILFlipBookTransitionPoint()
{
  return self;
}

uint64_t type metadata accessor for SILFlipBookState()
{
  return self;
}

uint64_t outlined init with copy of SILFileHandle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t outlined init with take of SILFileHandle(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t type metadata accessor for SILManifest()
{
  return self;
}

uint64_t specialized _ArrayProtocol.filter(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t v20 = *(void *)(a1 + 16);
  if (v20)
  {
    uint64_t v4 = a2;
    uint64_t v5 = 0;
    unint64_t v18 = (void **)(a2 + 40);
    uint64_t v19 = a1 + 32;
    do
    {
      outlined init with copy of SILFileHandle(v19 + 40 * v5, (uint64_t)&v22);
      uint64_t v6 = *(void *)(v4 + 16);
      if (v6)
      {
        swift_bridgeObjectRetain();
        uint64_t v7 = v18;
        do
        {
          uint64_t v9 = (uint64_t)*(v7 - 1);
          unint64_t v8 = *v7;
          uint64_t v10 = v23;
          uint64_t v11 = v24;
          __swift_project_boxed_opaque_existential_1(&v22, v23);
          int64_t v12 = *(void (**)(uint64_t, uint64_t))(v11 + 24);
          swift_bridgeObjectRetain();
          v12(v10, v11);
          v13._uint64_t countAndFlagsBits = v9;
          v13._object = v8;
          LOBYTE(v9) = String.hasSuffix(_:)(v13);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v9)
          {
            uint64_t v4 = a2;
            swift_bridgeObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
            goto LABEL_4;
          }
          v7 += 2;
          --v6;
        }
        while (v6);
        uint64_t v4 = a2;
        swift_bridgeObjectRelease();
      }
      outlined init with take of SILFileHandle(&v22, (uint64_t)v21);
      uint64_t v14 = v25;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v14 + 16) + 1, 1);
        uint64_t v14 = v25;
      }
      unint64_t v16 = *(void *)(v14 + 16);
      unint64_t v15 = *(void *)(v14 + 24);
      if (v16 >= v15 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v15 > 1), v16 + 1, 1);
        uint64_t v14 = v25;
      }
      *(void *)(v14 + 16) = v16 + 1;
      outlined init with take of SILFileHandle(v21, v14 + 40 * v16 + 32);
LABEL_4:
      ++v5;
    }
    while (v5 != v20);
    return v25;
  }
  return result;
}

uint64_t specialized Data.InlineData.init(_:)(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t specialized Data.init(bytes:count:)(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return specialized Data.InlineData.init(_:)(__src, &__src[a2]);
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  __DataStorage.init(bytes:length:)();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  type metadata accessor for Data.RangeReference();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t specialized _ArrayProtocol.filter(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v22 = MEMORY[0x263F8EE78];
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    uint64_t v8 = a1 + 32;
    do
    {
      outlined init with copy of SILFileHandle(v8, (uint64_t)&v19);
      uint64_t v9 = v20;
      uint64_t v10 = v21;
      __swift_project_boxed_opaque_existential_1(&v19, v20);
      *(void *)&v16[0] = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 24))(v9, v10);
      *((void *)&v16[0] + 1) = v11;
      uint64_t v17 = a2;
      uint64_t v18 = a3;
      lazy protocol witness table accessor for type String and conformance String();
      char v12 = StringProtocol.contains<A>(_:)();
      swift_bridgeObjectRelease();
      if (v12)
      {
        outlined init with take of SILFileHandle(&v19, (uint64_t)v16);
        uint64_t v13 = v22;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v13 + 16) + 1, 1);
          uint64_t v13 = v22;
        }
        unint64_t v15 = *(void *)(v13 + 16);
        unint64_t v14 = *(void *)(v13 + 24);
        if (v15 >= v14 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v14 > 1), v15 + 1, 1);
          uint64_t v13 = v22;
        }
        *(void *)(v13 + 16) = v15 + 1;
        outlined init with take of SILFileHandle(v16, v13 + 40 * v15 + 32);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v19);
      }
      v8 += 40;
      --v5;
    }
    while (v5);
    return v22;
  }
  return result;
}

uint64_t specialized static SILManifest.constraintFileFromIndicatorFile(deviceType:indicatorFileName:constraintFiles:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a4;
  uint64_t v65 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void *)MEMORY[0x261165820](a3, a4);
  id v7 = objc_msgSend(v6, sel_lastPathComponent);

  if (!v7) {
    goto LABEL_43;
  }
  id v8 = objc_msgSend(v7, sel_stringByDeletingPathExtension);

  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;

  uint64_t v12 = swift_bridgeObjectRetain();
  uint64_t v13 = specialized _ArrayProtocol.filter(_:)(v12, v9, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for PropertyListDecoder();
  swift_allocObject();
  uint64_t v14 = PropertyListDecoder.init()();
  uint64_t v55 = *(void *)(v13 + 16);
  if (!v55)
  {
    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  uint64_t v51 = v5;
  uint64_t v54 = 0;
  unint64_t v15 = 0;
  uint64_t v57 = v13 + 32;
  uint64_t v58 = 0;
  uint64_t v56 = v13;
  do
  {
    if (v15 >= *(void *)(v13 + 16))
    {
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
    }
    outlined init with copy of SILFileHandle(v57 + 40 * v15, (uint64_t)v62);
    uint64_t v16 = v63;
    uint64_t v17 = v64;
    __swift_project_boxed_opaque_existential_1(v62, v63);
    uint64_t v18 = v63;
    uint64_t v19 = v64;
    __swift_project_boxed_opaque_existential_1(v62, v63);
    uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 16))(v18, v19);
    uint64_t v21 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(v17 + 8))(0, v20, v16, v17);
    if (v4)
    {
      swift_release();
      swift_bridgeObjectRelease();

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
      return v16;
    }
    size_t v22 = *(void *)(v21 + 16);
    if (v22)
    {
      if (v22 <= 0xE)
      {
        *(void *)((char *)&__dst + 6) = 0;
        *(void *)&long long __dst = 0;
        BYTE14(__dst) = v22;
        memcpy(&__dst, (const void *)(v21 + 32), v22);
        uint64_t v24 = __dst;
        uint64_t v26 = DWORD2(__dst);
        uint64_t v27 = BYTE12(__dst);
        uint64_t v28 = v14;
        uint64_t v29 = BYTE13(__dst);
        uint64_t v30 = BYTE14(__dst);
        swift_bridgeObjectRelease();
        uint64_t v31 = v26 | (v27 << 32) | (v29 << 40);
        uint64_t v14 = v28;
        unint64_t v25 = v31 | (v30 << 48);
      }
      else
      {
        type metadata accessor for __DataStorage();
        swift_allocObject();
        uint64_t v23 = __DataStorage.init(bytes:length:)();
        if (v22 >= 0x7FFFFFFF)
        {
          type metadata accessor for Data.RangeReference();
          uint64_t v24 = swift_allocObject();
          *(void *)(v24 + 16) = 0;
          *(void *)(v24 + 24) = v22;
          swift_bridgeObjectRelease();
          unint64_t v25 = v23 | 0x8000000000000000;
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v24 = v22 << 32;
          unint64_t v25 = v23 | 0x4000000000000000;
        }
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v24 = 0;
      unint64_t v25 = 0xC000000000000000;
    }
    type metadata accessor for SILConstraints();
    lazy protocol witness table accessor for type FrameDesc and conformance FrameDesc(&lazy protocol witness table cache variable for type SILConstraints and conformance SILConstraints, (void (*)(void))type metadata accessor for SILConstraints);
    dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
    uint64_t v32 = (void *)__dst;
    uint64_t v33 = v63;
    uint64_t v34 = v64;
    __swift_project_boxed_opaque_existential_1(v62, v63);
    uint64_t v35 = (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 24))(v33, v34);
    uint64_t v36 = (void *)MEMORY[0x261165820](v35);
    swift_bridgeObjectRelease();
    id v37 = objc_msgSend(v36, sel_lastPathComponent);

    uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v40 = v39;

    (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v32) + 0x80))(v38, v40);
    unint64_t v41 = *(void **)((char *)v32 + OBJC_IVAR____TtC10SILManager14SILConstraints_devices);
    uint64_t v42 = v41[2];
    if (v42)
    {
      if (v41[4] == a1 && v41[5] == a2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        outlined consume of Data._Representation(v24, v25);

        uint64_t v58 = v32;
      }
      else if (v42 == 1)
      {
        outlined consume of Data._Representation(v24, v25);
      }
      else
      {
        uint64_t v52 = v14;
        uint64_t v43 = v41 + 7;
        uint64_t v44 = 1;
        while (1)
        {
          uint64_t v45 = v44 + 1;
          if (__OFADD__(v44, 1)) {
            goto LABEL_42;
          }
          BOOL v46 = *(v43 - 1) == a1 && *v43 == a2;
          if (v46 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            break;
          }
          v43 += 2;
          ++v44;
          if (v45 == v42)
          {
            outlined consume of Data._Representation(v24, v25);

            goto LABEL_32;
          }
        }
        outlined consume of Data._Representation(v24, v25);

        uint64_t v58 = v32;
LABEL_32:
        uint64_t v14 = v52;
      }
    }
    else
    {

      outlined consume of Data._Representation(v24, v25);
      uint64_t v54 = v32;
    }
    ++v15;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
    uint64_t v13 = v56;
  }
  while (v15 != v55);
  swift_bridgeObjectRelease();
  uint64_t v5 = v51;
  uint64_t v16 = (uint64_t)v58;
  if (v58)
  {
    swift_release();

    return v16;
  }
  uint64_t v16 = (uint64_t)v54;
  if (v54)
  {
    swift_release();
    return v16;
  }
LABEL_34:
  unint64_t v47 = Log.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v16 = *v47;
  *(void *)&long long __dst = 0;
  *((void *)&__dst + 1) = 0xE000000000000000;
  swift_retain();
  _StringGuts.grow(_:)(37);
  swift_bridgeObjectRelease();
  *(void *)&long long __dst = 0xD000000000000023;
  *((void *)&__dst + 1) = 0x800000025B6A0FB0;
  v48._uint64_t countAndFlagsBits = a3;
  v48._object = v5;
  String.append(_:)(v48);
  (*(void (**)(uint64_t, void, void))(*(void *)v16 + 144))(6, __dst, *((void *)&__dst + 1));
  swift_release();
  swift_bridgeObjectRelease();
  lazy protocol witness table accessor for type SILError and conformance SILError();
  swift_allocError();
  *(void *)uint64_t v49 = 0;
  *(void *)(v49 + 8) = 0;
  *(unsigned char *)(v49 + 16) = 14;
  swift_willThrow();
  swift_release();
  return v16;
}

uint64_t specialized static SILManifest.manifestFromPlists(plists:)(uint64_t a1)
{
  unint64_t v2 = MEMORY[0x263F8EE78];
  uint64_t v124 = (void *)MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v3)
  {
    uint64_t v4 = a1 + 32;
    do
    {
      outlined init with copy of SILFileHandle(v4, (uint64_t)&v132);
      uint64_t v5 = v133;
      uint64_t v6 = v134;
      __swift_project_boxed_opaque_existential_1(&v132, v133);
      *(void *)&long long v131 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 24))(v5, v6);
      *((void *)&v131 + 1) = v7;
      uint64_t v126 = 0x69617274736E6F63;
      unint64_t v127 = 0xEB0000000073746ELL;
      lazy protocol witness table accessor for type String and conformance String();
      char v8 = StringProtocol.contains<A>(_:)();
      swift_bridgeObjectRelease();
      if (v8)
      {
        outlined init with take of SILFileHandle(&v132, (uint64_t)&v131);
        uint64_t v9 = v124;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v124[2] + 1, 1);
          uint64_t v9 = v124;
        }
        unint64_t v11 = v9[2];
        unint64_t v10 = v9[3];
        if (v11 >= v10 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v10 > 1), v11 + 1, 1);
          uint64_t v9 = v124;
        }
        void v9[2] = v11 + 1;
        outlined init with take of SILFileHandle(&v131, (uint64_t)&v9[5 * v11 + 4]);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v132);
      }
      v4 += 40;
      --v3;
    }
    while (v3);
    unint64_t v12 = (unint64_t)v124;
    unint64_t v2 = MEMORY[0x263F8EE78];
  }
  else
  {
    unint64_t v12 = v2;
  }
  unint64_t v106 = v12;
  swift_bridgeObjectRelease();
  *(void *)&long long v132 = a1;
  swift_bridgeObjectRetain();
  uint64_t v13 = 0;
  specialized MutableCollection<>.sort(by:)((void **)&v132);
  uint64_t v14 = v132;
  uint64_t v124 = (void *)v2;
  uint64_t v15 = *(void *)(v132 + 16);
  if (v15)
  {
    unint64_t v121 = 0;
    unint64_t v16 = 0;
    uint64_t v17 = v132 + 32;
    while (v16 < *(void *)(v14 + 16))
    {
      outlined init with copy of SILFileHandle(v17, (uint64_t)&v132);
      uint64_t v18 = v133;
      uint64_t v19 = v134;
      __swift_project_boxed_opaque_existential_1(&v132, v133);
      *(void *)&long long v131 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 24))(v18, v19);
      *((void *)&v131 + 1) = v20;
      uint64_t v126 = 0x69617274736E6F63;
      unint64_t v127 = 0xEB0000000073746ELL;
      lazy protocol witness table accessor for type String and conformance String();
      char v21 = StringProtocol.contains<A>(_:)();
      swift_bridgeObjectRelease();
      if (v21)
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v132);
      }
      else
      {
        outlined init with take of SILFileHandle(&v132, (uint64_t)&v131);
        size_t v22 = v124;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v124[2] + 1, 1);
          size_t v22 = v124;
        }
        unint64_t v24 = v22[2];
        unint64_t v23 = v22[3];
        if (v24 >= v23 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v23 > 1), v24 + 1, 1);
          size_t v22 = v124;
        }
        v22[2] = v24 + 1;
        outlined init with take of SILFileHandle(&v131, (uint64_t)&v22[5 * v24 + 4]);
      }
      ++v16;
      v17 += 40;
      if (v15 == v16)
      {
        unint64_t v25 = (unint64_t)v124;
        uint64_t v13 = v121;
        unint64_t v2 = MEMORY[0x263F8EE78];
        goto LABEL_26;
      }
    }
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  unint64_t v25 = v2;
LABEL_26:
  swift_release();
  id v26 = (id)MobileGestalt_get_current_device();
  if (v26)
  {
    uint64_t v27 = v26;
    id v28 = (id)MobileGestalt_copy_productType_obj();

    if (v28)
    {
      uint64_t v107 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v30 = v29;
    }
    else
    {
      uint64_t v107 = 0;
      uint64_t v30 = 0;
    }
    unint64_t v130 = v2;
    unint64_t v129 = MEMORY[0x263F8EE80];
    uint64_t v120 = *(void *)(v25 + 16);
    if (!v120)
    {
      swift_release();
      swift_release();
      unint64_t v96 = MEMORY[0x263F8EE78];
LABEL_66:
      swift_bridgeObjectRelease();
      if (!(v96 >> 62))
      {
        if (!*(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_77:
          swift_bridgeObjectRelease();
          uint64_t v101 = Log.unsafeMutableAddressor();
          swift_beginAccess();
          unint64_t v102 = *(void (**)(uint64_t, unint64_t, unint64_t))(*(void *)*v101 + 144);
          swift_retain();
          v102(6, 0xD000000000000020, 0x800000025B6A1030);
          swift_release();
          id v99 = 0;
          goto LABEL_78;
        }
LABEL_68:
        specialized MutableCollection<>.sort(by:)(&v130, specialized UnsafeMutableBufferPointer._stableSortImpl(by:));
        uint64_t v97 = v130;
        id v98 = objc_allocWithZone((Class)type metadata accessor for SILManifest());
        id v99 = SILManifest.init(indicators:)(v97);
LABEL_78:
        swift_bridgeObjectRelease();
        return (uint64_t)v99;
      }
LABEL_76:
      swift_bridgeObjectRetain();
      uint64_t v100 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v100) {
        goto LABEL_77;
      }
      goto LABEL_68;
    }
    unint64_t v31 = 0;
    unint64_t v119 = v25 + 32;
    uint64_t v112 = 3;
    uint64_t v114 = 0xD000000000000022;
    uint64_t v113 = (void *)0x800000025B6A1000;
    unint64_t v105 = v25;
    uint64_t v122 = v30;
    while (1)
    {
      if (v31 >= *(void *)(v25 + 16)) {
        goto LABEL_70;
      }
      unint64_t v123 = v31;
      outlined init with copy of SILFileHandle(v119 + 40 * v31, (uint64_t)&v132);
      uint64_t v32 = v133;
      uint64_t v33 = v134;
      __swift_project_boxed_opaque_existential_1(&v132, v133);
      uint64_t v34 = v133;
      uint64_t v35 = v134;
      __swift_project_boxed_opaque_existential_1(&v132, v133);
      uint64_t v36 = (*(uint64_t (**)(uint64_t, uint64_t))(v35 + 16))(v34, v35);
      uint64_t v37 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(v33 + 8))(0, v36, v32, v33);
      uint64_t v38 = v13;
      if (v13)
      {
        uint64_t v13 = 0;
        uint64_t v54 = Log.unsafeMutableAddressor();
        swift_beginAccess();
        uint64_t v55 = *v54;
        uint64_t v124 = 0;
        unint64_t v125 = 0xE000000000000000;
        swift_retain();
        _StringGuts.grow(_:)(41);
        v56._uint64_t countAndFlagsBits = v114;
        v56._object = v113;
        String.append(_:)(v56);
        uint64_t v58 = v133;
        uint64_t v57 = v134;
        __swift_project_boxed_opaque_existential_1(&v132, v133);
        v59._uint64_t countAndFlagsBits = (*(uint64_t (**)(uint64_t, uint64_t))(v57 + 24))(v58, v57);
        String.append(_:)(v59);
        swift_bridgeObjectRelease();
        v60._uint64_t countAndFlagsBits = 2112032;
        v60._object = (void *)0xE300000000000000;
        String.append(_:)(v60);
        v128 = v38;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
        _print_unlocked<A, B>(_:_:)();
        (*(void (**)(uint64_t, void *, unint64_t))(*(void *)v55 + 144))(6, v124, v125);
        swift_release();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v39 = specialized Data.init(bytes:count:)((unsigned char *)(v37 + 32), *(void *)(v37 + 16));
        unint64_t v41 = v40;
        swift_bridgeObjectRelease();
        type metadata accessor for PropertyListDecoder();
        swift_allocObject();
        uint64_t v42 = PropertyListDecoder.init()();
        type metadata accessor for IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)();
        lazy protocol witness table accessor for type IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)();
        dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
        uint64_t v109 = v42;
        uint64_t v110 = v39;
        unint64_t v111 = v41;
        uint64_t v43 = v124;
        uint64_t v44 = v124 + 2;
        uint64_t v45 = swift_beginAccess();
        unint64_t v46 = v43[2];
        MEMORY[0x270FA5388](v45);
        v104[2] = &v129;
        v104[3] = &v132;
        swift_bridgeObjectRetain();
        uint64_t v13 = 0;
        uint64_t v47 = specialized _ArrayProtocol.filter(_:)((uint64_t (*)(id *))partial apply for closure #4 in static SILManifest.manifestFromPlists(plists:), (uint64_t)v104, v46);
        uint64_t v108 = v43;
        long long v43[2] = v47;
        swift_bridgeObjectRelease();
        uint64_t v48 = v122;
        if (!v122)
        {
          __break(1u);
          break;
        }
        uint64_t v49 = v133;
        uint64_t v50 = v134;
        __swift_project_boxed_opaque_existential_1(&v132, v133);
        uint64_t v51 = *(uint64_t (**)(uint64_t, uint64_t))(v50 + 24);
        swift_bridgeObjectRetain();
        uint64_t v52 = v51(v49, v50);
        BOOL v61 = (void *)specialized static SILManifest.constraintFileFromIndicatorFile(deviceType:indicatorFileName:constraintFiles:)(v107, v48, v52, v53);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_beginAccess();
        specialized MutableCollection<>.sort(by:)(v44, (void (*)(void *))specialized UnsafeMutableBufferPointer._stableSortImpl(by:));
        swift_endAccess();
        unint64_t v62 = *v44;
        if (*v44 >> 62)
        {
          swift_bridgeObjectRetain_n();
          uint64_t v63 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v63 = *(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
        }
        uint64_t v64 = (void *)MEMORY[0x263F8EED0];
        if (v63)
        {
          unint64_t v118 = v62 & 0xC000000000000001;
          uint64_t v65 = 4;
          unint64_t v121 = 0;
          uint64_t v117 = v61;
          unint64_t v116 = v62;
          uint64_t v115 = v63;
          do
          {
            if (v118) {
              uint64_t v66 = (void *)MEMORY[0x261165AD0](v65 - 4, v62);
            }
            else {
              uint64_t v66 = *(id *)(v62 + 8 * v65);
            }
            uint64_t v67 = v66;
            if (__OFADD__(v65 - 4, 1)) {
              goto LABEL_71;
            }
            uint64_t v68 = *(uint64_t (**)(void))((*v64 & *v66) + 0xA8);
            if (v68() == -1)
            {
              uint64_t v69 = v112;
              (*(void (**)(uint64_t))((*v64 & *v67) + 0xB0))(v112);
              BOOL v70 = __OFADD__(v69, 1);
              uint64_t v71 = v69 + 1;
              if (v70) {
                goto LABEL_75;
              }
              uint64_t v112 = v71;
            }
            uint64_t v73 = *(void *)((char *)v67 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_name);
            uint64_t v72 = *(void *)((char *)v67 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_name + 8);
            uint64_t v74 = swift_bridgeObjectRetain();
            uint64_t v75 = ((uint64_t (*)(uint64_t))v68)(v74);
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            unint64_t v77 = v129;
            uint64_t v124 = (void *)v129;
            unint64_t v129 = 0x8000000000000000;
            unint64_t v79 = specialized __RawDictionaryStorage.find<A>(_:)(v73, v72);
            uint64_t v80 = *(void *)(v77 + 16);
            BOOL v81 = (v78 & 1) == 0;
            uint64_t v82 = v80 + v81;
            if (__OFADD__(v80, v81)) {
              goto LABEL_72;
            }
            char v83 = v78;
            if (*(void *)(v77 + 24) >= v82)
            {
              if (isUniquelyReferenced_nonNull_native)
              {
                uint64_t v86 = v124;
                if ((v78 & 1) == 0) {
                  goto LABEL_59;
                }
              }
              else
              {
                specialized _NativeDictionary.copy()();
                uint64_t v86 = v124;
                if ((v83 & 1) == 0) {
                  goto LABEL_59;
                }
              }
            }
            else
            {
              specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v82, isUniquelyReferenced_nonNull_native);
              unint64_t v84 = specialized __RawDictionaryStorage.find<A>(_:)(v73, v72);
              if ((v83 & 1) != (v85 & 1)) {
                goto LABEL_81;
              }
              unint64_t v79 = v84;
              uint64_t v86 = v124;
              if ((v83 & 1) == 0)
              {
LABEL_59:
                v86[(v79 >> 6) + 8] |= 1 << v79;
                uint64_t v88 = (uint64_t *)(v86[6] + 16 * v79);
                *uint64_t v88 = v73;
                v88[1] = v72;
                *(void *)(v86[7] + 8 * v79) = v75;
                uint64_t v89 = v86[2];
                BOOL v70 = __OFADD__(v89, 1);
                uint64_t v90 = v89 + 1;
                if (v70) {
                  goto LABEL_74;
                }
                uint64_t v87 = v65 - 3;
                v86[2] = v90;
                swift_bridgeObjectRetain();
                goto LABEL_61;
              }
            }
            uint64_t v87 = v65 - 3;
            *(void *)(v86[7] + 8 * v79) = v75;
LABEL_61:
            unint64_t v129 = (unint64_t)v86;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            type metadata accessor for SILIndicatorValidator();
            unsigned int v91 = *(_DWORD *)((char *)v67 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_framesCount);
            uint64_t v13 = v121;
            uint64_t v64 = (void *)MEMORY[0x263F8EED0];
            BOOL v61 = v117;
            if (HIWORD(v91)) {
              goto LABEL_73;
            }
            uint64_t v92 = *(void **)((char *)v67 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_flipbook);
            id v93 = v92;
            uint64_t v94 = SILIndicatorValidator.__allocating_init(framesCount:constraints:flipbook:)(v91, v61, v92);
            (*(void (**)(uint64_t))((*v64 & *v67) + 0xF8))(v94);

            ++v65;
            unint64_t v62 = v116;
          }
          while (v87 != v115);
        }
        swift_bridgeObjectRelease();
        unint64_t v95 = swift_bridgeObjectRetain();
        specialized Array.append<A>(contentsOf:)(v95);
        swift_release();

        outlined consume of Data._Representation(v110, v111);
        swift_release();
        unint64_t v25 = v105;
      }
      unint64_t v31 = v123 + 1;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v132);
      if (v31 == v120)
      {
        swift_release();
        swift_release();
        unint64_t v96 = v130;
        goto LABEL_66;
      }
    }
  }
  __break(1u);
LABEL_81:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type SILFlipBookTransitionPoint.CodingKeys and conformance SILFlipBookTransitionPoint.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SILFlipBookTransitionPoint.CodingKeys and conformance SILFlipBookTransitionPoint.CodingKeys;
  if (!lazy protocol witness table cache variable for type SILFlipBookTransitionPoint.CodingKeys and conformance SILFlipBookTransitionPoint.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SILFlipBookTransitionPoint.CodingKeys and conformance SILFlipBookTransitionPoint.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SILFlipBookTransitionPoint.CodingKeys and conformance SILFlipBookTransitionPoint.CodingKeys;
  if (!lazy protocol witness table cache variable for type SILFlipBookTransitionPoint.CodingKeys and conformance SILFlipBookTransitionPoint.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SILFlipBookTransitionPoint.CodingKeys and conformance SILFlipBookTransitionPoint.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SILFlipBookTransitionPoint.CodingKeys and conformance SILFlipBookTransitionPoint.CodingKeys;
  if (!lazy protocol witness table cache variable for type SILFlipBookTransitionPoint.CodingKeys and conformance SILFlipBookTransitionPoint.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SILFlipBookTransitionPoint.CodingKeys and conformance SILFlipBookTransitionPoint.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SILFlipBookTransitionPoint.CodingKeys and conformance SILFlipBookTransitionPoint.CodingKeys;
  if (!lazy protocol witness table cache variable for type SILFlipBookTransitionPoint.CodingKeys and conformance SILFlipBookTransitionPoint.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SILFlipBookTransitionPoint.CodingKeys and conformance SILFlipBookTransitionPoint.CodingKeys);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FrameDesc.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FrameDesc.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25B68A5D0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FrameDesc.CodingKeys()
{
  return &type metadata for FrameDesc.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SILConstraints.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SILConstraints.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25B68A768);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for SILConstraints.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for SILConstraints.CodingKeys(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SILConstraints.CodingKeys()
{
  return &type metadata for SILConstraints.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SILIndicatorDesc.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SILIndicatorDesc.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25B68A90CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SILIndicatorDesc.CodingKeys()
{
  return &type metadata for SILIndicatorDesc.CodingKeys;
}

ValueMetadata *type metadata accessor for SILFlipBookTransitionPoint.CodingKeys()
{
  return &type metadata for SILFlipBookTransitionPoint.CodingKeys;
}

uint64_t type metadata accessor for IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)()
{
  return self;
}

void *__swift_memcpy8_4(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SILFlipBookRange(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SILFlipBookRange(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 8) = v3;
  return result;
}

void type metadata accessor for SILFlipBookRange(uint64_t a1)
{
}

__n128 __swift_memcpy20_4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SILFrameDesc(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 20)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SILFrameDesc(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_DWORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 20) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 20) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = a2 + 1;
    }
  }
  return result;
}

void type metadata accessor for SILFrameDesc(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for CGRect(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for CGRect(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CGRect(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

unint64_t lazy protocol witness table accessor for type CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)()
{
  unint64_t result = lazy protocol witness table cache variable for type CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:);
  if (!lazy protocol witness table cache variable for type CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:))
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:));
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:);
  if (!lazy protocol witness table cache variable for type CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:))
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:));
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:);
  if (!lazy protocol witness table cache variable for type CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:))
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:));
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:);
  if (!lazy protocol witness table cache variable for type CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:))
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:));
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [SILIndicatorDesc] and conformance <A> [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [SILIndicatorDesc] and conformance <A> [A];
  if (!lazy protocol witness table cache variable for type [SILIndicatorDesc] and conformance <A> [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [SILIndicatorDesc]);
    lazy protocol witness table accessor for type FrameDesc and conformance FrameDesc(&lazy protocol witness table cache variable for type SILIndicatorDesc and conformance SILIndicatorDesc, (void (*)(void))type metadata accessor for SILIndicatorDesc);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [SILIndicatorDesc] and conformance <A> [A]);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Data and conformance Data()
{
  unint64_t result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t lazy protocol witness table accessor for type FrameDesc and conformance FrameDesc(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)()
{
  unint64_t result = lazy protocol witness table cache variable for type IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:);
  if (!lazy protocol witness table cache variable for type IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:))
  {
    type metadata accessor for IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:) and conformance IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:));
  }
  return result;
}

uint64_t partial apply for closure #4 in static SILManifest.manifestFromPlists(plists:)(void *a1)
{
  if (!*(void *)(**(void **)(v1 + 16) + 16)) {
    return 1;
  }
  uint64_t v2 = *(void **)(v1 + 24);
  char v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_name);
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  swift_bridgeObjectRetain();
  specialized __RawDictionaryStorage.find<A>(_:)(v4, v5);
  char v7 = v6;
  swift_bridgeObjectRelease();
  if ((v7 & 1) == 0) {
    return 1;
  }
  int v8 = Log.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v9 = *v8;
  swift_retain();
  _StringGuts.grow(_:)(30);
  swift_bridgeObjectRelease();
  uint64_t v10 = *v3;
  unint64_t v11 = (void *)v3[1];
  swift_bridgeObjectRetain();
  v12._uint64_t countAndFlagsBits = v10;
  v12._object = v11;
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  v13._uint64_t countAndFlagsBits = 0x206D6F726620;
  v13._object = (void *)0xE600000000000000;
  String.append(_:)(v13);
  uint64_t v14 = v2[3];
  uint64_t v15 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v14);
  v16._uint64_t countAndFlagsBits = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 24))(v14, v15);
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, unint64_t, unint64_t))(*(void *)v9 + 144))(6, 0xD000000000000014, 0x800000025B6A1060);
  swift_bridgeObjectRelease();
  swift_release();
  return 0;
}

unint64_t lazy protocol witness table accessor for type [SILIndicatorDesc] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [SILIndicatorDesc] and conformance [A];
  if (!lazy protocol witness table cache variable for type [SILIndicatorDesc] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [SILIndicatorDesc]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [SILIndicatorDesc] and conformance [A]);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SILFlipBookTransitionPoint.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SILFlipBookTransitionPoint.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25B68B1A8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *destructiveInjectEnumTag for CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

void *type metadata accessor for CodingKeys in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)()
{
  return &unk_2709048F8;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CGSize(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CGSize(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void type metadata accessor for SILFlipBookRange(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t specialized CodingKeys.init(stringValue:) in IndicatorsPlist #1 in static SILManifest.manifestFromPlists(plists:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6F74616369646E69 && a2 == 0xEA00000000007372;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x35646D626F6C62 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

Swift::String __swiftcall getManifestDirectory()()
{
  unint64_t v0 = (void *)0x800000025B6A1080;
  uint64_t v1 = 0xD00000000000006FLL;
  result._object = v0;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

void getIgnoreManifestFileList(directoryName:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CharacterSet();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for String.Encoding();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = specialized static SimulatorFileHandle.getFilesMatching(directoryName:predicate:)(a1, a2);
  uint64_t v10 = v9[2];
  if (!v10) {
    goto LABEL_20;
  }
  if (v10 == 1)
  {
LABEL_5:
    outlined init with copy of SILFileHandle((uint64_t)(v9 + 4), (uint64_t)&v42);
    uint64_t v17 = v44;
    uint64_t v18 = v45;
    __swift_project_boxed_opaque_existential_1(&v42, v44);
    outlined init with copy of SILFileHandle((uint64_t)(v9 + 4), (uint64_t)&v38);
    swift_bridgeObjectRelease();
    uint64_t v19 = v40;
    uint64_t v20 = v41;
    __swift_project_boxed_opaque_existential_1(&v38, v40);
    uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 16))(v19, v20);
    uint64_t v22 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(v18 + 8))(0, v21, v17, v18);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v38);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v42);
    uint64_t v42 = v22;
    static String.Encoding.utf8.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
    lazy protocol witness table accessor for type [UInt8] and conformance [A]();
    uint64_t v23 = String.init<A>(bytes:encoding:)();
    unint64_t v25 = v24;
    swift_bridgeObjectRelease();
    if (v25)
    {
      uint64_t v42 = v23;
      unint64_t v43 = v25;
      static CharacterSet.newlines.getter();
      lazy protocol witness table accessor for type String and conformance String();
      uint64_t v26 = StringProtocol.components(separatedBy:)();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      swift_bridgeObjectRelease();
      uint64_t v27 = *(void *)(v26 + 16);
      if (v27) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v26 = MEMORY[0x263F8EE78];
      uint64_t v27 = *(void *)(MEMORY[0x263F8EE78] + 16);
      if (v27)
      {
LABEL_9:
        id v28 = (uint64_t *)(v26 + 40);
        uint64_t v29 = MEMORY[0x263F8EE78];
        do
        {
          uint64_t v34 = *(v28 - 1);
          uint64_t v33 = *v28;
          uint64_t v35 = HIBYTE(*v28) & 0xF;
          if ((*v28 & 0x2000000000000000) == 0) {
            uint64_t v35 = v34 & 0xFFFFFFFFFFFFLL;
          }
          if (v35)
          {
            swift_bridgeObjectRetain();
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v42 = v29;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v29 + 16) + 1, 1);
              uint64_t v29 = v42;
            }
            unint64_t v31 = *(void *)(v29 + 16);
            unint64_t v30 = *(void *)(v29 + 24);
            if (v31 >= v30 >> 1)
            {
              specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v30 > 1), v31 + 1, 1);
              uint64_t v29 = v42;
            }
            *(void *)(v29 + 16) = v31 + 1;
            unint64_t v32 = v29 + 16 * v31;
            *(void *)(v32 + 32) = v34;
            *(void *)(v32 + 40) = v33;
          }
          v28 += 2;
          --v27;
        }
        while (v27);
      }
    }
LABEL_20:
    swift_bridgeObjectRelease();
    return;
  }
  unint64_t v11 = Log.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v12 = *v11;
  uint64_t v42 = 0;
  unint64_t v43 = 0xE000000000000000;
  swift_retain();
  _StringGuts.grow(_:)(52);
  uint64_t v38 = v42;
  unint64_t v39 = v43;
  v13._uint64_t countAndFlagsBits = 0xD000000000000032;
  v13._object = (void *)0x800000025B6A1110;
  String.append(_:)(v13);
  if (v9[2])
  {
    outlined init with copy of SILFileHandle((uint64_t)(v9 + 4), (uint64_t)&v42);
    uint64_t v14 = v44;
    uint64_t v15 = v45;
    __swift_project_boxed_opaque_existential_1(&v42, v44);
    v16._uint64_t countAndFlagsBits = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 24))(v14, v15);
    String.append(_:)(v16);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v42);
    (*(void (**)(uint64_t, uint64_t, unint64_t))(*(void *)v12 + 144))(4, v38, v39);
    swift_release();
    swift_bridgeObjectRelease();
    if (v9[2]) {
      goto LABEL_5;
    }
    __break(1u);
  }
  __break(1u);
}

void SimulatorFileHandle.__allocating_init(directoryName:fileName:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
}

void SimulatorFileHandle.init(directoryName:fileName:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  uint64_t v35 = *v5;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for URL();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v33 - v18;
  uint64_t v39 = a1;
  uint64_t v40 = a2;
  swift_bridgeObjectRetain();
  v20._uint64_t countAndFlagsBits = a3;
  v20._object = a4;
  String.append(_:)(v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v22 = v39;
  uint64_t v21 = v40;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  String.utf8CString.getter();
  URL.init(fileURLWithFileSystemRepresentation:isDirectory:relativeTo:)();
  outlined destroy of URL?((uint64_t)v12);
  swift_release();
  type metadata accessor for NSFileHandle();
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
  id v23 = @nonobjc NSFileHandle.__allocating_init(forReadingFrom:)((uint64_t)v17);
  uint64_t v5[2] = (uint64_t)v23;
  id v24 = v23;
  uint64_t v25 = NSFileHandle.readToEnd()();
  outlined consume of Data?(v25, v26);

  id v27 = (id)v5[2];
  Swift::UInt64 v34 = NSFileHandle.offset()();
  if (v28)
  {

    swift_bridgeObjectRelease();
    uint64_t v29 = Log.unsafeMutableAddressor();
    swift_beginAccess();
    uint64_t v30 = *v29;
    uint64_t v37 = 0;
    unint64_t v38 = 0xE000000000000000;
    swift_retain();
    _StringGuts.grow(_:)(28);
    v31._object = (void *)0x800000025B6A1150;
    v31._uint64_t countAndFlagsBits = 0xD00000000000001ALL;
    String.append(_:)(v31);
    uint64_t v36 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    _print_unlocked<A, B>(_:_:)();
    (*(void (**)(uint64_t, uint64_t, unint64_t))(*(void *)v30 + 144))(3, v37, v38);
    swift_release();
    swift_bridgeObjectRelease();

    (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
    swift_deallocPartialClassInstance();
  }
  else
  {

    Swift::UInt64 v32 = v34;
    if ((v34 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
      v5[3] = v32;
      v5[4] = v22;
      v5[5] = v21;
    }
  }
}

id @nonobjc NSFileHandle.__allocating_init(forReadingFrom:)(uint64_t a1)
{
  uint64_t v13 = (NSURL *)*MEMORY[0x263EF8340];
  URL._bridgeToObjectiveC()(v13);
  char v3 = v2;
  id v12 = 0;
  id v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fileHandleForReadingFromURL_error_, v2, &v12);

  id v5 = v12;
  if (v4)
  {
    uint64_t v6 = type metadata accessor for URL();
    BOOL v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
    id v8 = v5;
    v7(a1, v6);
  }
  else
  {
    id v9 = v12;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v10 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
  }
  return v4;
}

uint64_t SimulatorFileHandle.read(offset:size:)(uint64_t a1, size_t a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v5 = a1;
  uint64_t v6 = *(void **)(v2 + 16);
  id v24 = 0;
  if (!objc_msgSend(v6, sel_seekToOffset_error_, a1, &v24))
  {
    id v21 = v24;
    _convertNSErrorToError(_:)();

    goto LABEL_7;
  }
  id v7 = v24;
  uint64_t v8 = NSFileHandle.read(upToCount:)();
  if (!v3)
  {
    unint64_t v10 = v9;
    if (v9 >> 60 == 15)
    {
      id v24 = 0;
      uint64_t v25 = 0xE000000000000000;
      _StringGuts.grow(_:)(54);
      v11._object = (void *)0x800000025B6A1170;
      v11._uint64_t countAndFlagsBits = 0xD00000000000001BLL;
      String.append(_:)(v11);
      v12._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v12);
      swift_bridgeObjectRelease();
      v13._uint64_t countAndFlagsBits = 0x7A697320646E6120;
      v13._object = (void *)0xEA00000000002065;
      String.append(_:)(v13);
      v14._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v14);
      swift_bridgeObjectRelease();
      v15._uint64_t countAndFlagsBits = 0x656E727574657220;
      v15._object = (void *)0xED00006C696E2064;
      String.append(_:)(v15);
      uint64_t v5 = SILError.log()((uint64_t)v24, v25, 0xDu);
      uint64_t v17 = v16;
      char v19 = v18;
      swift_bridgeObjectRelease();
      lazy protocol witness table accessor for type SILError and conformance SILError();
      swift_allocError();
      *(void *)uint64_t v20 = v5;
      *(void *)(v20 + 8) = v17;
      *(unsigned char *)(v20 + 16) = v19;
LABEL_7:
      swift_willThrow();
      return v5;
    }
    if ((a2 & 0x8000000000000000) == 0)
    {
      uint64_t v23 = v8;
      if (a2)
      {
        uint64_t v5 = static Array._allocateBufferUninitialized(minimumCapacity:)();
        *(void *)(v5 + 16) = a2;
        bzero((void *)(v5 + 32), a2);
      }
      else
      {
        uint64_t v5 = MEMORY[0x263F8EE78];
      }
      swift_bridgeObjectRetain();
      Data.copyBytes(to:count:)();
      outlined consume of Data?(v23, v10);
      swift_bridgeObjectRelease();
      return v5;
    }
LABEL_15:
    __break(1u);
  }
  return v5;
}

uint64_t SimulatorFileHandle.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t protocol witness for SILFileHandle.read(offset:size:) in conformance SimulatorFileHandle(uint64_t a1, size_t a2)
{
  return SimulatorFileHandle.read(offset:size:)(a1, a2);
}

uint64_t protocol witness for SILFileHandle.size.getter in conformance SimulatorFileHandle()
{
  return *(void *)(*(void *)v0 + 24);
}

uint64_t protocol witness for SILFileHandle.name.getter in conformance SimulatorFileHandle()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

void *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SILFileHandle>);
    unint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    unint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SILFileHandle);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  size_t v11;
  void *v12;

  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<IOSurfaceLike>);
      unint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      Swift::String v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      Swift::String v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  size_t v11;
  void *v12;

  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SILValidator.State?>);
      unint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 88);
      Swift::String v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[11 * v8 + 4]) {
          memmove(v12, a4 + 4, 88 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      Swift::String v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  void *v13;

  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SILRenderer.Region.PageContent>);
      unint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      Swift::String v12 = v11 - 32;
      if (v11 < 32) {
        Swift::String v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      Swift::String v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      Swift::String v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t specialized _ArrayProtocol.filter(_:)(uint64_t result, uint64_t (*a2)(uint64_t, uint64_t))
{
  unint64_t v2 = *(void *)(result + 16);
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
  unint64_t v4 = 0;
  uint64_t v5 = result + 40;
  uint64_t v6 = -(uint64_t)v2;
  uint64_t v7 = MEMORY[0x263F8EE78];
  uint64_t v16 = result + 40;
  unint64_t v17 = *(void *)(result + 16);
  do
  {
    if (v4 <= v2) {
      unint64_t v8 = v2;
    }
    else {
      unint64_t v8 = v4;
    }
    uint64_t v9 = -(uint64_t)v8;
    for (unint64_t i = (uint64_t *)(v5 + 16 * v4++); ; i += 2)
    {
      if (v9 + v4 == 1)
      {
        __break(1u);
        return result;
      }
      uint64_t v12 = *(i - 1);
      uint64_t v11 = *i;
      swift_bridgeObjectRetain();
      if (a2(v12, v11)) {
        break;
      }
      Swift::String result = swift_bridgeObjectRelease();
      ++v4;
      if (v6 + v4 == 1) {
        return v7;
      }
    }
    Swift::String result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0) {
      Swift::String result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v7 + 16) + 1, 1);
    }
    unint64_t v14 = *(void *)(v7 + 16);
    unint64_t v13 = *(void *)(v7 + 24);
    if (v14 >= v13 >> 1) {
      Swift::String result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v13 > 1), v14 + 1, 1);
    }
    *(void *)(v7 + 16) = v14 + 1;
    uint64_t v15 = v7 + 16 * v14;
    *(void *)(v15 + 32) = v12;
    *(void *)(v15 + 40) = v11;
    uint64_t v5 = v16;
    unint64_t v2 = v17;
  }
  while (v6 + v4);
  return v7;
}

void *specialized static SimulatorFileHandle.getFilesMatching(directoryName:predicate:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = objc_msgSend(self, sel_defaultManager);
  uint64_t v7 = (void *)MEMORY[0x261165820](a1, a2);
  *(void *)&long long v31 = 0;
  id v8 = objc_msgSend(v6, sel_contentsOfDirectoryAtPath_error_, v7, &v31);

  uint64_t v9 = (void *)v31;
  if (!v8)
  {
    id v23 = (id)v31;
    id v24 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v25 = Log.unsafeMutableAddressor();
    swift_beginAccess();
    uint64_t v26 = *v25;
    swift_retain();
    _StringGuts.grow(_:)(25);
    swift_bridgeObjectRelease();
    id v27 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    v28._uint64_t countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v28);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, unint64_t, unint64_t))(*(void *)v26 + 144))(3, 0xD000000000000017, 0x800000025B6A11D0);

    swift_release();
    swift_bridgeObjectRelease();

    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = v9;

  uint64_t v12 = specialized _ArrayProtocol.filter(_:)(v10, a3);
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(v12 + 16);
  if (!v13)
  {
    swift_bridgeObjectRelease();

    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v30 = v6;
  uint64_t v14 = type metadata accessor for SimulatorFileHandle();
  swift_bridgeObjectRetain();
  uint64_t v15 = (void **)(v12 + 40);
  uint64_t v16 = (void *)MEMORY[0x263F8EE78];
  do
  {
    uint64_t v17 = (uint64_t)*(v15 - 1);
    char v18 = *v15;
    swift_allocObject();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    SimulatorFileHandle.init(directoryName:fileName:)(a1, a2, v17, v18);
    if (v19)
    {
      uint64_t v20 = v19;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v16[2] + 1, 1, v16);
      }
      unint64_t v22 = v16[2];
      unint64_t v21 = v16[3];
      if (v22 >= v21 >> 1) {
        uint64_t v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v21 > 1), v22 + 1, 1, v16);
      }
      uint64_t v32 = v14;
      uint64_t v33 = &protocol witness table for SimulatorFileHandle;
      *(void *)&long long v31 = v20;
      long long v16[2] = v22 + 1;
      outlined init with take of SILFileHandle(&v31, (uint64_t)&v16[5 * v22 + 4]);
    }
    v15 += 2;
    swift_bridgeObjectRelease();
    --v13;
  }
  while (v13);

  swift_bridgeObjectRelease_n();
  return v16;
}

uint64_t specialized _ArrayProtocol.filter(_:)(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  unint64_t v2 = 0;
  uint64_t v3 = result + 40;
  uint64_t v4 = MEMORY[0x263F8EE78];
  do
  {
    if (v2 <= v1) {
      unint64_t v5 = v1;
    }
    else {
      unint64_t v5 = v2;
    }
    uint64_t v6 = -(uint64_t)v5;
    for (unint64_t i = (uint64_t *)(v3 + 16 * v2++); ; i += 2)
    {
      if (v6 + v2 == 1)
      {
        __break(1u);
        return result;
      }
      uint64_t v9 = *(i - 1);
      uint64_t v8 = *i;
      swift_bridgeObjectRetain();
      v10._uint64_t countAndFlagsBits = 0x6F6E67696C69732ELL;
      v10._object = (void *)0xEA00000000006572;
      if (String.hasSuffix(_:)(v10)) {
        break;
      }
      Swift::String result = swift_bridgeObjectRelease();
      if (++v2 - v1 == 1) {
        return v4;
      }
    }
    Swift::String result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0) {
      Swift::String result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v4 + 16) + 1, 1);
    }
    unint64_t v12 = *(void *)(v4 + 16);
    unint64_t v11 = *(void *)(v4 + 24);
    if (v12 >= v11 >> 1) {
      Swift::String result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
    }
    *(void *)(v4 + 16) = v12 + 1;
    uint64_t v13 = v4 + 16 * v12;
    *(void *)(v13 + 32) = v9;
    *(void *)(v13 + 40) = v8;
  }
  while (v2 != v1);
  return v4;
}

void *specialized static SimulatorFileHandle.getFilesMatching(directoryName:predicate:)(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(self, sel_defaultManager);
  unint64_t v5 = (void *)MEMORY[0x261165820](a1, a2);
  *(void *)&long long v29 = 0;
  id v6 = objc_msgSend(v4, sel_contentsOfDirectoryAtPath_error_, v5, &v29);

  uint64_t v7 = (void *)v29;
  if (!v6)
  {
    id v21 = (id)v29;
    unint64_t v22 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    id v23 = Log.unsafeMutableAddressor();
    swift_beginAccess();
    uint64_t v24 = *v23;
    swift_retain();
    _StringGuts.grow(_:)(25);
    swift_bridgeObjectRelease();
    id v25 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    v26._uint64_t countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v26);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, unint64_t, unint64_t))(*(void *)v24 + 144))(3, 0xD000000000000017, 0x800000025B6A11D0);

    swift_release();
    swift_bridgeObjectRelease();

    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = v7;

  uint64_t v10 = specialized _ArrayProtocol.filter(_:)(v8);
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v10 + 16);
  if (!v11)
  {
    swift_bridgeObjectRelease();

    return (void *)MEMORY[0x263F8EE78];
  }
  Swift::String v28 = v4;
  uint64_t v12 = type metadata accessor for SimulatorFileHandle();
  swift_bridgeObjectRetain();
  uint64_t v13 = (void **)(v10 + 40);
  uint64_t v14 = (void *)MEMORY[0x263F8EE78];
  do
  {
    uint64_t v15 = (uint64_t)*(v13 - 1);
    uint64_t v16 = *v13;
    swift_allocObject();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    SimulatorFileHandle.init(directoryName:fileName:)(a1, a2, v15, v16);
    if (v17)
    {
      uint64_t v18 = v17;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14[2] + 1, 1, v14);
      }
      unint64_t v20 = v14[2];
      unint64_t v19 = v14[3];
      if (v20 >= v19 >> 1) {
        uint64_t v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v19 > 1), v20 + 1, 1, v14);
      }
      uint64_t v30 = v12;
      long long v31 = &protocol witness table for SimulatorFileHandle;
      *(void *)&long long v29 = v18;
      v14[2] = v20 + 1;
      outlined init with take of SILFileHandle(&v29, (uint64_t)&v14[5 * v20 + 4]);
    }
    v13 += 2;
    swift_bridgeObjectRelease();
    --v11;
  }
  while (v11);

  swift_bridgeObjectRelease_n();
  return v14;
}

unint64_t lazy protocol witness table accessor for type [UInt8] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [UInt8] and conformance [A];
  if (!lazy protocol witness table cache variable for type [UInt8] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UInt8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [UInt8] and conformance [A]);
  }
  return result;
}

uint64_t outlined destroy of URL?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t type metadata accessor for NSFileHandle()
{
  unint64_t result = lazy cache variable for type metadata for NSFileHandle;
  if (!lazy cache variable for type metadata for NSFileHandle)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSFileHandle);
  }
  return result;
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
}

uint64_t type metadata accessor for SimulatorFileHandle()
{
  return self;
}

uint64_t LogType.rawValue.getter(int a1)
{
  return (a1 + 1);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance LogType(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance LogType()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1 + 1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance LogType()
{
  Hasher._combine(_:)(*v0 + 1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance LogType()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1 + 1);
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance LogType@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = specialized LogType.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance LogType(unsigned char *a1@<X8>)
{
  *a1 = *v1 + 1;
}

uint64_t LogModule.rawValue.getter(char a1)
{
  uint64_t result = 0x6165627468676954;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x616C707369445845;
      break;
    case 2:
      uint64_t result = 0x6361667275535845;
      break;
    case 3:
      uint64_t result = 0x6F4C617461445845;
      break;
    case 4:
      uint64_t result = 0x65646E65524C4953;
      break;
    case 5:
      uint64_t result = 0x646E656B636142;
      break;
    case 6:
      uint64_t result = 0x6E6F6D6D6F43;
      break;
    case 7:
      uint64_t result = 0x69746164696C6156;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance LogModule(unsigned __int8 *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance LogModule()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance LogModule()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance LogModule()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance LogModule@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized LogModule.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance LogModule(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE90000000000006DLL;
  uint64_t v3 = 0x6165627468676954;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE900000000000079;
      uint64_t v3 = 0x616C707369445845;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 0x6361667275535845;
      *(void *)(a1 + 8) = 0xE900000000000065;
      break;
    case 3:
      strcpy((char *)a1, "EXDataLoader");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      break;
    case 4:
      *(void *)a1 = 0x65646E65524C4953;
      *(void *)(a1 + 8) = 0xEB00000000726572;
      break;
    case 5:
      *(void *)a1 = 0x646E656B636142;
      *(void *)(a1 + 8) = 0xE700000000000000;
      break;
    case 6:
      *(void *)a1 = 0x6E6F6D6D6F43;
      *(void *)(a1 + 8) = 0xE600000000000000;
      break;
    case 7:
      *(void *)a1 = 0x69746164696C6156;
      *(void *)(a1 + 8) = 0xEA00000000006E6FLL;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

uint64_t one-time initialization function for SILLogger()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, SILLogger);
  __swift_project_value_buffer(v0, (uint64_t)SILLogger);
  return Logger.init(subsystem:category:)();
}

uint64_t SILLogger.unsafeMutableAddressor()
{
  return SILLogger.unsafeMutableAddressor(&one-time initialization token for SILLogger, MEMORY[0x263F90268], (uint64_t)SILLogger);
}

uint64_t one-time initialization function for SILSignpost()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for OSSignposter();
  __swift_allocate_value_buffer(v4, SILSignpost);
  __swift_project_value_buffer(v4, (uint64_t)SILSignpost);
  if (one-time initialization token for SILLogger != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)SILLogger);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return OSSignposter.init(logger:)();
}

uint64_t SILSignpost.unsafeMutableAddressor()
{
  return SILLogger.unsafeMutableAddressor(&one-time initialization token for SILSignpost, MEMORY[0x263F90228], (uint64_t)SILSignpost);
}

uint64_t SILLogger.unsafeMutableAddressor(void *a1, uint64_t (*a2)(void), uint64_t a3)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = a2(0);
  return __swift_project_value_buffer(v5, a3);
}

uint64_t variable initialization expression of Logging.logLevel()
{
  return 1;
}

uint64_t Logging.log(logType:logModule:logMsg:printer:)(uint64_t result, uint64_t a2, uint64_t a3, void *a4, void (*a5)(void, unint64_t))
{
  if ((*(unsigned char *)(v5 + 16) + 1) >= (result + 1))
  {
    v9._uint64_t countAndFlagsBits = 91;
    v9._object = (void *)0xE100000000000000;
    String.append(_:)(v9);
    _print_unlocked<A, B>(_:_:)();
    v10._uint64_t countAndFlagsBits = 8285;
    v10._object = (void *)0xE200000000000000;
    String.append(_:)(v10);
    v11._uint64_t countAndFlagsBits = a3;
    v11._object = a4;
    String.append(_:)(v11);
    int v12 = *(unsigned __int8 *)(v5 + 16);
    if (v12 == 3 || !*(unsigned char *)(v5 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_25B69F690;
      v14._uint64_t countAndFlagsBits = 0;
      v14._object = (void *)0xE000000000000000;
      String.append(_:)(v14);
      v15._uint64_t countAndFlagsBits = 10;
      v15._object = (void *)0xE100000000000000;
      String.append(_:)(v15);
      *(void *)(v13 + 56) = MEMORY[0x263F8D310];
      *(void *)(v13 + 32) = 0x5D52474D4C49535BLL;
      *(void *)(v13 + 40) = 0xE800000000000000;
      print(_:separator:terminator:)();
      swift_bridgeObjectRelease();
      int v12 = *(unsigned __int8 *)(v5 + 16);
    }
    if (v12 != 4) {
      a5(0, 0xE000000000000000);
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

Swift::Void __swiftcall Logging.setLogLevel(logType:)(SILManager::LogType logType)
{
  *(unsigned char *)(v1 + 16) = logType;
}

Swift::Void __swiftcall Logging.info(_:_:)(SILManager::LogModule a1, Swift::String a2)
{
}

void closure #1 in Logging.info(_:_:)(uint64_t a1, unint64_t a2)
{
}

Swift::Void __swiftcall Logging.debug(_:_:)(SILManager::LogModule a1, Swift::String a2)
{
}

void closure #1 in Logging.debug(_:_:)(uint64_t a1, unint64_t a2)
{
}

Swift::Void __swiftcall Logging.error(_:_:)(SILManager::LogModule a1, Swift::String a2)
{
}

void closure #1 in Logging.error(_:_:)(uint64_t a1, unint64_t a2)
{
}

Swift::Void __swiftcall Logging.critical(_:_:)(SILManager::LogModule a1, Swift::String a2)
{
}

uint64_t Logging.info(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)v5 + 112))(a4, a1, a2, a3, a5, 0);
}

void closure #1 in Logging.critical(_:_:)(uint64_t a1, unint64_t a2)
{
}

void closure #1 in Logging.info(_:_:)(uint64_t a1, unint64_t a2, uint64_t (*a3)(void))
{
  if (one-time initialization token for SILLogger != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)SILLogger);
  swift_bridgeObjectRetain_n();
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = a3();
  if (os_log_type_enabled(v7, v8))
  {
    Swift::String v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = v10;
    *(_DWORD *)Swift::String v9 = 136315138;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25B66B000, v7, v8, "%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261166620](v10, -1, -1);
    MEMORY[0x261166620](v9, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

Swift::String __swiftcall Logging.getIndicatorName(_:)(Swift::Int a1)
{
  unint64_t v1 = 0xE500000000000000;
  uint64_t v2 = 0x63694D7841;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = 0x6E776F6E6B6E55;
  if (a1 == 1)
  {
    uint64_t v4 = 6515021;
    unint64_t v3 = 0xE300000000000000;
  }
  if (a1 != 2)
  {
    uint64_t v2 = v4;
    unint64_t v1 = v3;
  }
  BOOL v5 = a1 == 0;
  if (a1) {
    uint64_t v6 = v2;
  }
  else {
    uint64_t v6 = 7168323;
  }
  if (v5) {
    uint64_t v7 = (void *)0xE300000000000000;
  }
  else {
    uint64_t v7 = (void *)v1;
  }
  result._object = v7;
  result._uint64_t countAndFlagsBits = v6;
  return result;
}

Swift::String __swiftcall Logging.getIndicatorNamesFromMask(_:)(Swift::Int32 a1)
{
  uint64_t v2 = (void *)0xE000000000000000;
  if (a1 < 1)
  {
    uint64_t v9 = 0;
  }
  else
  {
    unint64_t v3 = a1;
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)v1 + 160);
    do
    {
      unint64_t v5 = __clz(__rbit64(v3));
      uint64_t v6 = (-1 << v5) - 1;
      if (v5 >= 0x40) {
        uint64_t v6 = -1;
      }
      v3 &= v6;
      v11._uint64_t countAndFlagsBits = v4();
      v11._object = v7;
      swift_bridgeObjectRetain();
      v8._uint64_t countAndFlagsBits = 44;
      v8._object = (void *)0xE100000000000000;
      String.append(_:)(v8);
      swift_bridgeObjectRelease();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
    }
    while (v3);
    uint64_t v9 = 0;
    uint64_t v2 = (void *)0xE000000000000000;
  }
  result._object = v2;
  result._uint64_t countAndFlagsBits = v9;
  return result;
}

Swift::Bool __swiftcall Logging.getSignpostsEnabled()()
{
  return *(unsigned char *)(v0 + 16) == 4;
}

uint64_t Logging.deinit()
{
  return v0;
}

uint64_t Logging.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t Logging.__allocating_init()()
{
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = 1;
  return result;
}

uint64_t one-time initialization function for Log()
{
  type metadata accessor for Logging();
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = 1;
  Log = result;
  return result;
}

uint64_t *Log.unsafeMutableAddressor()
{
  if (one-time initialization token for Log != -1) {
    swift_once();
  }
  return &Log;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized LogType.init(rawValue:)(unsigned __int8 a1)
{
  if (a1 <= 5u) {
    return (0x40302010005uLL >> (8 * a1));
  }
  else {
    return 5;
  }
}

unint64_t specialized LogModule.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of LogModule.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 8) {
    return 8;
  }
  else {
    return v3;
  }
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t lazy protocol witness table accessor for type LogType and conformance LogType()
{
  unint64_t result = lazy protocol witness table cache variable for type LogType and conformance LogType;
  if (!lazy protocol witness table cache variable for type LogType and conformance LogType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LogType and conformance LogType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type LogModule and conformance LogModule()
{
  unint64_t result = lazy protocol witness table cache variable for type LogModule and conformance LogModule;
  if (!lazy protocol witness table cache variable for type LogModule and conformance LogModule)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LogModule and conformance LogModule);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for LogType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for LogType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25B68EA40);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LogType()
{
  return &type metadata for LogType;
}

uint64_t getEnumTagSinglePayload for LogModule(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for LogModule(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *unint64_t result = a2 + 7;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25B68EBD4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LogModule()
{
  return &type metadata for LogModule;
}

uint64_t type metadata accessor for Logging()
{
  return self;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t SILError.log()(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3 = specialized SILError.log()(a1, a2, a3);
  outlined copy of SILError(v3, v4, v5);
  return v3;
}

uint64_t protocol witness for Error._domain.getter in conformance SILError()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t protocol witness for Error._code.getter in conformance SILError()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t protocol witness for Error._userInfo.getter in conformance SILError()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance SILError()
{
  return MEMORY[0x270F9FB30]();
}

Swift::UInt32 __swiftcall Error.toUInt32()()
{
  uint64_t v2 = v0;
  ((void (*)())MEMORY[0x270FA5388])();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v1, v2);
  if (swift_dynamicCast())
  {
    switch(v9)
    {
      case 1:
        outlined consume of SILError(v7, v8, 1u);
        Swift::UInt32 result = 514;
        break;
      case 2:
        outlined consume of SILError(v7, v8, 2u);
        Swift::UInt32 result = 515;
        break;
      case 3:
        outlined consume of SILError(v7, v8, 3u);
        Swift::UInt32 result = 518;
        break;
      case 4:
        outlined consume of SILError(v7, v8, 4u);
        Swift::UInt32 result = 519;
        break;
      case 5:
        outlined consume of SILError(v7, v8, 5u);
        Swift::UInt32 result = 522;
        break;
      case 6:
        outlined consume of SILError(v7, v8, 6u);
        Swift::UInt32 result = 1;
        break;
      case 7:
        outlined consume of SILError(v7, v8, 7u);
        Swift::UInt32 result = 2;
        break;
      case 8:
        outlined consume of SILError(v7, v8, 8u);
        Swift::UInt32 result = 3;
        break;
      case 9:
        outlined consume of SILError(v7, v8, 9u);
        Swift::UInt32 result = 4;
        break;
      case 10:
        outlined consume of SILError(v7, v8, 0xAu);
        Swift::UInt32 result = 5;
        break;
      case 11:
        outlined consume of SILError(v7, v8, 0xBu);
        Swift::UInt32 result = 6;
        break;
      case 12:
        outlined consume of SILError(v7, v8, 0xCu);
        Swift::UInt32 result = 7;
        break;
      case 13:
        outlined consume of SILError(v7, v8, 0xDu);
        return 523;
      case 14:
        Swift::UInt32 result = dword_25B69FB54[v7];
        break;
      default:
        outlined consume of SILError(v7, v8, 0);
        Swift::UInt32 result = 513;
        break;
    }
  }
  else
  {
    Error.localizedDescription.getter();
    swift_bridgeObjectRelease();
    return 523;
  }
  return result;
}

double protocol witness for Vec2.x.getter in conformance CGPoint()
{
  return *(double *)v0;
}

void protocol witness for Vec2.x.setter in conformance CGPoint(double a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*protocol witness for Vec2.x.modify in conformance CGPoint())()
{
  return destructiveProjectEnumData for FrameDesc.CodingKeys;
}

void protocol witness for Vec2.y.setter in conformance CGPoint(double a1)
{
  *(double *)(v1 + 8) = a1;
}

uint64_t (*protocol witness for Vec2.y.modify in conformance CGPoint())()
{
  return destructiveProjectEnumData for FrameDesc.CodingKeys;
}

void protocol witness for Vec2.init(x:y:) in conformance CGSize(double *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  *a1 = a2;
  a1[1] = a3;
}

double (*protocol witness for Vec2.x.modify in conformance CGSize(void *a1))(uint64_t a1)
{
  a1[1] = v1;
  *a1 = *v1;
  return protocol witness for Vec2.x.modify in conformance CGSize;
}

double protocol witness for Vec2.x.modify in conformance CGSize(uint64_t a1)
{
  double result = *(double *)a1;
  **(void **)(a1 + 8) = *(void *)a1;
  return result;
}

double protocol witness for Vec2.y.getter in conformance CGSize()
{
  return *(double *)(v0 + 8);
}

double (*protocol witness for Vec2.y.modify in conformance CGSize(void *a1))(uint64_t a1)
{
  a1[1] = v1;
  *a1 = *(void *)(v1 + 8);
  return protocol witness for Vec2.y.modify in conformance CGSize;
}

double protocol witness for Vec2.y.modify in conformance CGSize(uint64_t a1)
{
  double result = *(double *)a1;
  *(void *)(*(void *)(a1 + 8) + 8) = *(void *)a1;
  return result;
}

Swift::Bool __swiftcall CGRect.contains(_:)(CGPoint a1)
{
  double v5 = v1 + v3;
  if (v1 <= a1.x)
  {
    BOOL v7 = v2 == a1.y;
    BOOL v6 = v2 >= a1.y;
  }
  else
  {
    BOOL v6 = 1;
    BOOL v7 = 0;
  }
  BOOL v8 = !v7 && v6 || v5 < a1.x;
  return !v8 && v2 + v4 >= a1.y;
}

uint64_t one-time initialization function for PixelFormats()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(UInt32, PixelFormatInfo)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25B69F810;
  *(_DWORD *)(inited + 32) = 1647534392;
  *(void *)(inited + 40) = 2;
  *(void *)(inited + 48) = &outlined read-only object #0 of one-time initialization function for PixelFormats;
  *(_DWORD *)(inited + 56) = 1111970369;
  *(void *)(inited + 64) = 1;
  *(void *)(inited + 72) = &outlined read-only object #1 of one-time initialization function for PixelFormats;
  double v1 = (void *)specialized Dictionary.init(dictionaryLiteral:)(inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UInt32, PixelFormatInfo));
  uint64_t result = swift_arrayDestroy();
  PixelFormats._rawValue = v1;
  return result;
}

Swift::Void __swiftcall IOSurfaceLike.clear()()
{
  double v2 = v1;
  uint64_t v3 = v0;
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v14 = 403046784;
  size_t v4 = specialized _copyCollectionToContiguousArray<A>(_:)((size_t)&v14, (unint64_t)&v15);
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, void *))v2[6];
  __b = (void *)v13(0, v3, v2);
  double v5 = (uint64_t (*)(uint64_t, uint64_t, void *))v2[7];
  uint64_t v6 = v5(0, v3, v2);
  BOOL v7 = (uint64_t (*)(uint64_t, void *))v2[2];
  uint64_t v8 = v7(v3, v2);
  if ((unsigned __int128)(v6 * (__int128)v8) >> 64 != (v6 * v8) >> 63)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  memset_pattern4(__b, (const void *)(v4 + 32), v6 * v8);
  swift_release();
  char v9 = (void *)v13(1, v3, v2);
  uint64_t v10 = v5(1, v3, v2);
  uint64_t v11 = v7(v3, v2);
  if ((unsigned __int128)(v10 * (__int128)v11) >> 64 != (v10 * v11) >> 63) {
    goto LABEL_5;
  }
  bzero(v9, v10 * v11);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SensorType()
{
  Swift::UInt8 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance SensorType()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SensorType()
{
  Swift::UInt8 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance SensorType@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = specialized SensorType.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance SensorType(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

void one-time initialization function for g_renderers()
{
  g_renderers._rawValue = (void *)MEMORY[0x263F8EE78];
}

void *SILRenderer.Region.__allocating_init(extent:surfaces:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)swift_allocObject();
  v3[2] = 0;
  swift_beginAccess();
  v3[2] = a2;
  swift_bridgeObjectRelease();
  v3[3] = 0;
  size_t v4 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)();
  _DWORD v4[2] = 2;
  v4[4] = 0xFFFFLL;
  v4[5] = -1;
  v4[6] = 0xFFFFLL;
  v4[7] = -1;
  v3[4] = v4;
  return v3;
}

uint64_t SILRenderer.Region.surfaces.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SILRenderer.Region.surfaces.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*SILRenderer.Region.surfaces.modify())()
{
  return SILConstraints.constraintsFile.modify;
}

uint64_t SILRenderer.Region.currentPageID.getter()
{
  swift_beginAccess();
  return *(void *)(v0 + 24);
}

uint64_t SILRenderer.Region.currentPageID.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*SILRenderer.Region.currentPageID.modify())()
{
  return SILConstraints.constraintsFile.modify;
}

uint64_t (*SILRenderer.Region.pageContents.modify())()
{
  return SILConstraints.constraintsFile.modify;
}

uint64_t SILRenderer.Region.needsUpdate(indicator:rotation:frame:blitOffset:)(void *a1, unsigned __int16 a2, unsigned __int8 a3, unsigned __int8 a4, float a5)
{
  unint64_t v11 = (*(uint64_t (**)(void))(*(void *)v5 + 136))();
  uint64_t result = (*(uint64_t (**)(void))(*(void *)v5 + 160))();
  if ((v11 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (v11 >= *(void *)(result + 16))
  {
LABEL_10:
    __break(1u);
    return result;
  }
  unint64_t v13 = result + 16 * v11;
  int v14 = *(unsigned __int16 *)(v13 + 32);
  int v15 = *(unsigned __int8 *)(v13 + 34);
  int v16 = *(unsigned __int8 *)(v13 + 35);
  float v17 = *(float *)(v13 + 36);
  uint64_t v18 = *(void *)(v13 + 40);
  uint64_t v19 = swift_bridgeObjectRelease();
  char v20 = 1;
  if (v15 == a3
    && v16 == a4
    && (BOOL v21 = v18 != (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *a1) + 0xA8))(v19),
        char v20 = v21 || v14 != a2 || v17 != a5,
        !v21))
  {
    int v22 = 0;
  }
  else
  {
    int v22 = 256;
  }
  return v22 | v20 & 1u;
}

uint64_t SILRenderer.Region.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t SILRenderer.displayExtent.getter()
{
  uint64_t result = outlined init with copy of SILBackend?(v0 + 24, (uint64_t)v5);
  uint64_t v2 = v6;
  if (v6)
  {
    uint64_t v3 = v7;
    __swift_project_boxed_opaque_existential_1(v5, v6);
    uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 72))(v2, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t SILRenderer.regions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SILRenderer.regions.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 72) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*SILRenderer.regions.modify())()
{
  return SILConstraints.constraintsFile.modify;
}

uint64_t SILRenderer.decodingBuffer.getter()
{
  swift_beginAccess();
  return *(void *)(v0 + 80);
}

uint64_t SILRenderer.decodingBuffer.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 80) = a1;
  return result;
}

uint64_t (*SILRenderer.decodingBuffer.modify())()
{
  return SILConstraints.steadyFrames.modify;
}

uint64_t SILRenderer.decodingScratchBuffer.getter()
{
  swift_beginAccess();
  return *(void *)(v0 + 88);
}

uint64_t SILRenderer.decodingScratchBuffer.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 88) = a1;
  return result;
}

uint64_t (*SILRenderer.decodingScratchBuffer.modify())()
{
  return SILConstraints.constraintsFile.modify;
}

uint64_t SILRenderer.rotationBuffer.getter()
{
  swift_beginAccess();
  return *(void *)(v0 + 96);
}

uint64_t SILRenderer.rotationBuffer.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 96) = a1;
  return result;
}

uint64_t (*SILRenderer.rotationBuffer.modify())()
{
  return SILConstraints.constraintsFile.modify;
}

uint64_t SILRenderer.curSwap.getter()
{
  swift_beginAccess();
  uint64_t v1 = v0[13];
  outlined copy of (id: UInt64, synchronous: Bool, signpost: OSSignpostIntervalState?)?(v1, v0[14], v0[15]);
  return v1;
}

uint64_t SILRenderer.curSwap.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t v7 = v3[13];
  uint64_t v8 = v3[14];
  uint64_t v9 = v3[15];
  v3[13] = a1;
  v3[14] = a2;
  v3[15] = a3;
  return outlined consume of (id: UInt64, synchronous: Bool, signpost: OSSignpostIntervalState?)?(v7, v8, v9);
}

uint64_t (*SILRenderer.curSwap.modify())()
{
  return SILConstraints.constraintsFile.modify;
}

uint64_t SILRenderer.sentSwap.getter()
{
  swift_beginAccess();
  return *(void *)(v0 + 128);
}

uint64_t SILRenderer.sentSwap.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 128) = a1;
  return result;
}

uint64_t (*SILRenderer.sentSwap.modify())()
{
  return SILConstraints.constraintsFile.modify;
}

uint64_t SILRenderer.validator.getter()
{
  return swift_retain();
}

uint64_t SILRenderer.validator.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 136) = a1;
  return swift_release();
}

uint64_t (*SILRenderer.validator.modify())()
{
  return SILConstraints.constraintsFile.modify;
}

uint64_t SILRenderer.__allocating_init(id:backend:)(int a1, void *a2)
{
  uint64_t v4 = swift_allocObject();
  SILRenderer.init(id:backend:)(a1, a2);
  return v4;
}

uint64_t SILRenderer.init(id:backend:)(int a1, void *a2)
{
  *(void *)(v2 + 72) = MEMORY[0x263F8EE78];
  uint64_t v3 = v2 + 72;
  *(void *)(v2 + 104) = 0;
  uint64_t v4 = (void *)(v2 + 104);
  *(void *)(v3 + 40) = 0;
  *(void *)(v3 + 48) = 1;
  if (one-time initialization token for g_renderers != -1) {
    swift_once();
  }
  swift_beginAccess();
  unint64_t rawValue = (unint64_t)g_renderers._rawValue;
  if ((unint64_t)g_renderers._rawValue >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    if (!v6) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v6 = *(void *)(((unint64_t)g_renderers._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v6) {
      goto LABEL_19;
    }
  }
  if ((rawValue & 0xC000000000000001) != 0)
  {
    int v15 = *(_DWORD *)(MEMORY[0x261165AD0](0, rawValue) + 16);
    swift_unknownObjectRelease();
    if (v15 == a1) {
      goto LABEL_7;
    }
  }
  else if (*(_DWORD *)(*(void *)(rawValue + 32) + 16) == a1)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    _StringGuts.grow(_:)(20);
    swift_bridgeObjectRelease();
    v7._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v7);
    swift_bridgeObjectRelease();
    v8._uint64_t countAndFlagsBits = 0x79646165726C6120;
    v8._object = (void *)0xEF73747369786520;
    String.append(_:)(v8);
    uint64_t v9 = specialized SILError.log()(2114633, 0xE300000000000000, 1u);
    uint64_t v11 = v10;
    unsigned __int8 v13 = v12;
    outlined copy of SILError(v9, v10, v12);
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type SILError and conformance SILError();
    swift_allocError();
    *(void *)uint64_t v14 = v9;
    *(void *)(v14 + 8) = v11;
    *(unsigned char *)(v14 + 16) = v13;
LABEL_42:
    swift_willThrow();
    uint64_t v101 = (uint64_t *)v104;
    swift_bridgeObjectRelease();
    outlined consume of (id: UInt64, synchronous: Bool, signpost: OSSignpostIntervalState?)?(v101[13], v101[14], v101[15]);
    type metadata accessor for SILRenderer();
    swift_deallocPartialClassInstance();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a2);
    return (uint64_t)v101;
  }
  if (v6 != 1)
  {
    uint64_t v16 = 5;
    while (1)
    {
      if ((rawValue & 0xC000000000000001) != 0)
      {
        int v17 = *(_DWORD *)(MEMORY[0x261165AD0](v16 - 4, rawValue) + 16);
        swift_unknownObjectRelease();
        if (v17 == a1) {
          goto LABEL_7;
        }
      }
      else if (*(_DWORD *)(*(void *)(rawValue + 8 * v16) + 16) == a1)
      {
        goto LABEL_7;
      }
      uint64_t v18 = v16 - 3;
      if (__OFADD__(v16 - 4, 1)) {
        break;
      }
      ++v16;
      if (v18 == v6) {
        goto LABEL_19;
      }
    }
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
LABEL_19:
  swift_bridgeObjectRelease();
  uint64_t v19 = (void *)*SILManifest.manifest.unsafeMutableAddressor();
  if (!v19)
  {
    uint64_t v95 = specialized SILError.log()(0, 0, 0xEu);
    uint64_t v97 = v96;
    unsigned __int8 v99 = v98;
    lazy protocol witness table accessor for type SILError and conformance SILError();
    swift_allocError();
    *(void *)uint64_t v100 = v95;
    *(void *)(v100 + 8) = v97;
    *(unsigned char *)(v100 + 16) = v99;
    outlined copy of SILError(v95, v97, v99);
    goto LABEL_42;
  }
  *(_DWORD *)(v104 + 16) = a1;
  outlined init with copy of SILFileHandle((uint64_t)a2, v104 + 24);
  *(void *)(v104 + 64) = v19;
  swift_beginAccess();
  uint64_t v20 = *(void *)(v104 + 104);
  uint64_t v21 = *(void *)(v104 + 112);
  uint64_t v22 = *(void *)(v104 + 120);
  void *v4 = 0;
  v4[1] = 0;
  *(void *)(v104 + 120) = 1;
  id v23 = v19;
  outlined consume of (id: UInt64, synchronous: Bool, signpost: OSSignpostIntervalState?)?(v20, v21, v22);
  *(void *)(v104 + 128) = 0;
  uint64_t v24 = a2[3];
  uint64_t v25 = a2[4];
  Swift::String v26 = v23;
  __swift_project_boxed_opaque_existential_1(a2, v24);
  unint64_t v27 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 72))(v24, v25);
  int v28 = v27;
  unint64_t v29 = HIDWORD(v27);
  type metadata accessor for SILValidator();
  uint64_t v30 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SILValidator.State?);
  uint64_t v31 = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(void *)(v31 + 16) = 4;
  *(_OWORD *)(v31 + 32) = 0u;
  *(_OWORD *)(v31 + 48) = 0u;
  *(_OWORD *)(v31 + 64) = 0u;
  *(_OWORD *)(v31 + 80) = 0u;
  *(_OWORD *)(v31 + 96) = 0u;
  *(_DWORD *)(v31 + 111) = 0;
  *(_OWORD *)(v31 + 120) = 0u;
  *(_OWORD *)(v31 + 136) = 0u;
  *(_OWORD *)(v31 + 152) = 0u;
  *(_OWORD *)(v31 + 168) = 0u;
  *(_OWORD *)(v31 + 184) = 0u;
  *(_DWORD *)(v31 + 199) = 0;
  *(_OWORD *)(v31 + 224) = 0u;
  *(_OWORD *)(v31 + 240) = 0u;
  *(_OWORD *)(v31 + 256) = 0u;
  *(_OWORD *)(v31 + 272) = 0u;
  *(_OWORD *)(v31 + 208) = 0u;
  *(_DWORD *)(v31 + 287) = 0;
  *(_DWORD *)(v31 + 375) = 0;
  *(_OWORD *)(v31 + 344) = 0u;
  *(_OWORD *)(v31 + 360) = 0u;
  *(_OWORD *)(v31 + 312) = 0u;
  *(_OWORD *)(v31 + 328) = 0u;
  *(_OWORD *)(v31 + 296) = 0u;
  *(void *)(v30 + 24) = v31;
  uint64_t v32 = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(void *)(v32 + 16) = 4;
  *(_OWORD *)(v32 + 32) = 0u;
  *(_OWORD *)(v32 + 48) = 0u;
  *(_OWORD *)(v32 + 64) = 0u;
  *(_OWORD *)(v32 + 80) = 0u;
  *(_OWORD *)(v32 + 96) = 0u;
  *(_DWORD *)(v32 + 111) = 0;
  *(_OWORD *)(v32 + 120) = 0u;
  *(_OWORD *)(v32 + 136) = 0u;
  *(_OWORD *)(v32 + 152) = 0u;
  *(_OWORD *)(v32 + 168) = 0u;
  *(_OWORD *)(v32 + 184) = 0u;
  *(_DWORD *)(v32 + 199) = 0;
  *(_OWORD *)(v32 + 224) = 0u;
  *(_OWORD *)(v32 + 240) = 0u;
  *(_OWORD *)(v32 + 256) = 0u;
  *(_OWORD *)(v32 + 272) = 0u;
  *(_OWORD *)(v32 + 208) = 0u;
  *(_DWORD *)(v32 + 287) = 0;
  *(_DWORD *)(v32 + 375) = 0;
  *(_OWORD *)(v32 + 344) = 0u;
  *(_OWORD *)(v32 + 360) = 0u;
  *(_OWORD *)(v32 + 312) = 0u;
  *(_OWORD *)(v32 + 328) = 0u;
  *(_OWORD *)(v32 + 296) = 0u;
  *(void *)(v30 + 32) = v32;
  *(_DWORD *)(v30 + 16) = v28;
  *(_DWORD *)(v30 + 20) = v29;
  *(void *)(v104 + 136) = v30;
  uint64_t v33 = (void *)MEMORY[0x263F8EED0];
  uint64_t v34 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v26) + 0x70))();
  compression_decode_scratch_buffer_size(COMPRESSION_LZFSE);
  uint64_t v35 = *(uint64_t (**)(void))((*v33 & *v26) + 0x78);
  uint64_t v36 = v35();
  if ((unsigned __int128)(v36 * (__int128)v34) >> 64 != (v36 * v34) >> 63) {
    goto LABEL_46;
  }
  *(void *)(v104 + 80) = swift_slowAlloc();
  uint64_t v37 = v35();
  if ((unsigned __int128)(v37 * (__int128)v34) >> 64 != (v37 * v34) >> 63)
  {
LABEL_47:
    __break(1u);
LABEL_48:
    swift_bridgeObjectRetain();
    uint64_t v52 = _CocoaArrayWrapper.endIndex.getter();
    if (!v52) {
      goto LABEL_49;
    }
    goto LABEL_24;
  }
  *(void *)(v104 + 96) = swift_slowAlloc();
  *(void *)(v104 + 88) = swift_slowAlloc();
  uint64_t v113 = MEMORY[0x263F8EE78];
  specialized ContiguousArray.reserveCapacity(_:)();
  type metadata accessor for SILRenderer.Region();
  unint64_t v38 = (void *)swift_allocObject();
  v38[2] = 0;
  swift_beginAccess();
  v38[2] = 0;
  swift_bridgeObjectRelease();
  v38[3] = 0;
  BOOL v103 = v26;
  uint64_t v39 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)();
  v39[2] = 2;
  v39[4] = 0xFFFFLL;
  v39[5] = -1;
  v39[6] = 0xFFFFLL;
  v39[7] = -1;
  v38[4] = v39;
  specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
  specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
  specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized ContiguousArray._endMutation()();
  uint64_t v40 = (void *)swift_allocObject();
  v40[2] = 0;
  swift_beginAccess();
  v40[2] = 0;
  swift_bridgeObjectRelease();
  void v40[3] = 0;
  uint64_t v41 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)();
  int v41[2] = 2;
  v41[4] = 0xFFFFLL;
  v41[5] = -1;
  v41[6] = 0xFFFFLL;
  v41[7] = -1;
  v40[4] = v41;
  specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
  specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
  specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized ContiguousArray._endMutation()();
  uint64_t v42 = (void *)swift_allocObject();
  int v42[2] = 0;
  swift_beginAccess();
  int v42[2] = 0;
  swift_bridgeObjectRelease();
  v42[3] = 0;
  unint64_t v43 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)();
  long long v43[2] = 2;
  v43[4] = 0xFFFFLL;
  v43[5] = -1;
  v43[6] = 0xFFFFLL;
  v43[7] = -1;
  v42[4] = v43;
  specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
  specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
  specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized ContiguousArray._endMutation()();
  uint64_t v44 = (void *)swift_allocObject();
  v44[2] = 0;
  swift_beginAccess();
  v44[2] = 0;
  swift_bridgeObjectRelease();
  v44[3] = 0;
  uint64_t v45 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)();
  v45[2] = 2;
  v45[4] = 0xFFFFLL;
  v45[5] = -1;
  v45[6] = 0xFFFFLL;
  v45[7] = -1;
  v44[4] = v45;
  specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
  specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
  specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized ContiguousArray._endMutation()();
  swift_beginAccess();
  *(void *)(v104 + 72) = v113;
  swift_bridgeObjectRelease();
  unint64_t v46 = Log.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v108 = v46;
  uint64_t v47 = *v46;
  swift_retain();
  _StringGuts.grow(_:)(30);
  swift_bridgeObjectRelease();
  v48._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v48);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, unint64_t, unint64_t))(*(void *)v47 + 152))(4, 0xD00000000000001CLL, 0x800000025B6A14F0);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v49 = a2[3];
  uint64_t v50 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v49);
  (*(void (**)(uint64_t, uint64_t))(v50 + 72))(v49, v50);
  unint64_t v51 = *(void *)((char *)v26 + OBJC_IVAR____TtC10SILManager11SILManifest_indicators);
  unint64_t v106 = v51;
  if (v51 >> 62) {
    goto LABEL_48;
  }
  uint64_t v52 = *(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v52)
  {
LABEL_49:
    swift_bridgeObjectRelease();
    swift_beginAccess();
    uint64_t v101 = (uint64_t *)v104;
    uint64_t v102 = swift_retain();
    MEMORY[0x261165950](v102);
    if (*(void *)(((unint64_t)g_renderers._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)g_renderers._rawValue & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    swift_endAccess();

    __swift_destroy_boxed_opaque_existential_1((uint64_t)a2);
    return (uint64_t)v101;
  }
LABEL_24:
  swift_beginAccess();
  unint64_t v53 = 0;
  uint64_t v107 = v52;
  while (1)
  {
    if ((v106 & 0xC000000000000001) != 0)
    {
      unint64_t v62 = (void *)MEMORY[0x261165AD0](v53, v106);
      BOOL v63 = __OFADD__(v53, 1);
      unint64_t v64 = v53 + 1;
      if (v63) {
        goto LABEL_43;
      }
    }
    else
    {
      if (v53 >= *(void *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_44;
      }
      unint64_t v62 = *(id *)(v106 + 32 + 8 * v53);
      BOOL v63 = __OFADD__(v53, 1);
      unint64_t v64 = v53 + 1;
      if (v63)
      {
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
        goto LABEL_45;
      }
    }
    unint64_t v109 = v64;
    uint64_t v110 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v62) + 0xF0);
    uint64_t v112 = v62;
    uint64_t result = v110();
    if (!result) {
      break;
    }
    uint64_t v66 = (char *)*(id *)(result + 24);
    swift_release();
    uint64_t v67 = *(void *)&v66[OBJC_IVAR____TtC10SILManager14SILConstraints_boundingBoxes];
    swift_retain();

    uint64_t v68 = *(void *)(v67 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    uint64_t v69 = *(void *)(v68 + 16);
    if (v69)
    {
      uint64_t v70 = v68 + 56;
      do
      {
        _StringGuts.grow(_:)(26);
        swift_bridgeObjectRelease();
        v71._uint64_t countAndFlagsBits = Double.description.getter();
        String.append(_:)(v71);
        swift_bridgeObjectRelease();
        v72._uint64_t countAndFlagsBits = 540703008;
        v72._object = (void *)0xE400000000000000;
        String.append(_:)(v72);
        v73._uint64_t countAndFlagsBits = Double.description.getter();
        String.append(_:)(v73);
        swift_bridgeObjectRelease();
        v74._uint64_t countAndFlagsBits = 540702496;
        v74._object = (void *)0xE400000000000000;
        String.append(_:)(v74);
        v75._uint64_t countAndFlagsBits = Double.description.getter();
        String.append(_:)(v75);
        swift_bridgeObjectRelease();
        v76._uint64_t countAndFlagsBits = 540698656;
        v76._object = (void *)0xE400000000000000;
        String.append(_:)(v76);
        v77._uint64_t countAndFlagsBits = Double.description.getter();
        String.append(_:)(v77);
        swift_bridgeObjectRelease();
        v78._uint64_t countAndFlagsBits = 2653;
        v78._object = (void *)0xE200000000000000;
        String.append(_:)(v78);
        v79._uint64_t countAndFlagsBits = 540702811;
        v79._object = (void *)0xE400000000000000;
        String.append(_:)(v79);
        swift_bridgeObjectRelease();
        v70 += 32;
        --v69;
      }
      while (v69);
    }
    uint64_t v80 = swift_bridgeObjectRelease();
    uint64_t result = ((uint64_t (*)(uint64_t))v110)(v80);
    if (!result) {
      goto LABEL_54;
    }
    BOOL v81 = (char *)*(id *)(result + 24);
    swift_release();
    uint64_t v82 = *(void *)&v81[OBJC_IVAR____TtC10SILManager14SILConstraints_boundingBoxes];
    swift_retain();

    uint64_t v83 = *(void *)(v82 + 24);
    swift_bridgeObjectRetain();
    swift_release();
    uint64_t v84 = *(void *)(v83 + 16);
    if (v84)
    {
      uint64_t v85 = v83 + 56;
      do
      {
        _StringGuts.grow(_:)(36);
        swift_bridgeObjectRelease();
        v86._uint64_t countAndFlagsBits = Double.description.getter();
        String.append(_:)(v86);
        swift_bridgeObjectRelease();
        v87._uint64_t countAndFlagsBits = 540703008;
        v87._object = (void *)0xE400000000000000;
        String.append(_:)(v87);
        v88._uint64_t countAndFlagsBits = Double.description.getter();
        String.append(_:)(v88);
        swift_bridgeObjectRelease();
        v89._uint64_t countAndFlagsBits = 540702496;
        v89._object = (void *)0xE400000000000000;
        String.append(_:)(v89);
        v90._uint64_t countAndFlagsBits = Double.description.getter();
        String.append(_:)(v90);
        swift_bridgeObjectRelease();
        v91._uint64_t countAndFlagsBits = 540698656;
        v91._object = (void *)0xE400000000000000;
        String.append(_:)(v91);
        v92._uint64_t countAndFlagsBits = Double.description.getter();
        String.append(_:)(v92);
        swift_bridgeObjectRelease();
        v93._uint64_t countAndFlagsBits = 0x6D616E796428205DLL;
        v93._object = (void *)0xEC0000000A296369;
        String.append(_:)(v93);
        v94._uint64_t countAndFlagsBits = 540702811;
        v94._object = (void *)0xE400000000000000;
        String.append(_:)(v94);
        swift_bridgeObjectRelease();
        v85 += 32;
        --v84;
      }
      while (v84);
    }
    swift_bridgeObjectRelease();
    uint64_t v54 = *v108;
    swift_retain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    uint64_t v55 = *(void *)((char *)v112 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_name);
    Swift::String v56 = *(void **)((char *)v112 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_name + 8);
    swift_bridgeObjectRetain();
    v57._uint64_t countAndFlagsBits = v55;
    v57._object = v56;
    String.append(_:)(v57);
    swift_bridgeObjectRelease();
    v58._uint64_t countAndFlagsBits = 58;
    v58._object = (void *)0xE100000000000000;
    String.append(_:)(v58);
    (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v112) + 0xA8))();
    v59._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v59);
    swift_bridgeObjectRelease();
    v60._uint64_t countAndFlagsBits = 0x7274736E6F63200ALL;
    v60._object = (void *)0xEF203A73746E6961;
    String.append(_:)(v60);
    v61._uint64_t countAndFlagsBits = 0;
    v61._object = (void *)0xE000000000000000;
    String.append(_:)(v61);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, unint64_t, unint64_t))(*(void *)v54 + 152))(4, 0xD00000000000001BLL, 0x800000025B6A1510);
    swift_release();
    swift_bridgeObjectRelease();

    unint64_t v53 = v109;
    if (v109 == v107) {
      goto LABEL_49;
    }
  }
  __break(1u);
LABEL_54:
  __break(1u);
  return result;
}

uint64_t SILValidator.__allocating_init(displaySize:)(int a1, int a2)
{
  uint64_t v4 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SILValidator.State?);
  uint64_t v5 = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(void *)(v5 + 16) = 4;
  *(_OWORD *)(v5 + 32) = 0u;
  *(_OWORD *)(v5 + 48) = 0u;
  *(_OWORD *)(v5 + 64) = 0u;
  *(_OWORD *)(v5 + 80) = 0u;
  *(_OWORD *)(v5 + 96) = 0u;
  *(_DWORD *)(v5 + 111) = 0;
  *(_OWORD *)(v5 + 120) = 0u;
  *(_OWORD *)(v5 + 136) = 0u;
  *(_OWORD *)(v5 + 152) = 0u;
  *(_OWORD *)(v5 + 168) = 0u;
  *(_OWORD *)(v5 + 184) = 0u;
  *(_DWORD *)(v5 + 199) = 0;
  *(_OWORD *)(v5 + 224) = 0u;
  *(_OWORD *)(v5 + 240) = 0u;
  *(_OWORD *)(v5 + 256) = 0u;
  *(_OWORD *)(v5 + 272) = 0u;
  *(void *)(v4 + 24) = v5;
  *(_OWORD *)(v5 + 208) = 0u;
  *(_DWORD *)(v5 + 287) = 0;
  *(_DWORD *)(v5 + 375) = 0;
  *(_OWORD *)(v5 + 344) = 0u;
  *(_OWORD *)(v5 + 360) = 0u;
  *(_OWORD *)(v5 + 312) = 0u;
  *(_OWORD *)(v5 + 328) = 0u;
  *(_OWORD *)(v5 + 296) = 0u;
  uint64_t v6 = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(void *)(v6 + 16) = 4;
  *(_OWORD *)(v6 + 32) = 0u;
  *(_OWORD *)(v6 + 48) = 0u;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_OWORD *)(v6 + 96) = 0u;
  *(_DWORD *)(v6 + 111) = 0;
  *(_OWORD *)(v6 + 120) = 0u;
  *(_OWORD *)(v6 + 136) = 0u;
  *(_OWORD *)(v6 + 152) = 0u;
  *(_OWORD *)(v6 + 168) = 0u;
  *(_OWORD *)(v6 + 184) = 0u;
  *(_DWORD *)(v6 + 199) = 0;
  *(_OWORD *)(v6 + 224) = 0u;
  *(_OWORD *)(v6 + 240) = 0u;
  *(_OWORD *)(v6 + 256) = 0u;
  *(_OWORD *)(v6 + 272) = 0u;
  *(void *)(v4 + 32) = v6;
  *(_OWORD *)(v6 + 208) = 0u;
  *(_DWORD *)(v6 + 287) = 0;
  *(_DWORD *)(v6 + 375) = 0;
  *(_OWORD *)(v6 + 344) = 0u;
  *(_OWORD *)(v6 + 360) = 0u;
  *(_OWORD *)(v6 + 312) = 0u;
  *(_OWORD *)(v6 + 328) = 0u;
  *(_OWORD *)(v6 + 296) = 0u;
  *(_DWORD *)(v4 + 16) = a1;
  *(_DWORD *)(v4 + 20) = a2;
  return v4;
}

uint64_t SILRenderer.__deallocating_deinit()
{
  swift_beginAccess();
  MEMORY[0x261166620](*(void *)(v0 + 80), -1, -1);
  swift_beginAccess();
  MEMORY[0x261166620](*(void *)(v0 + 96), -1, -1);
  swift_beginAccess();
  MEMORY[0x261166620](*(void *)(v0 + 88), -1, -1);
  outlined destroy of SILBackend?(v0 + 24, &demangling cache variable for type metadata for SILBackend?);

  swift_bridgeObjectRelease();
  outlined consume of (id: UInt64, synchronous: Bool, signpost: OSSignpostIntervalState?)?(*(void *)(v0 + 104), *(void *)(v0 + 112), *(void *)(v0 + 120));
  swift_release();
  return swift_deallocClassInstance();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SILRenderer.updateRegionSurfaceSize(region_id:extent:)(Swift::Int region_id, Swift::Int extent)
{
  uint64_t v4 = v2;
  uint64_t v7 = v2 + 24;
  outlined init with copy of SILBackend?(v2 + 24, (uint64_t)&v36);
  uint64_t v8 = v38;
  if (!v38)
  {
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v9 = v39;
  __swift_project_boxed_opaque_existential_1(&v36, v38);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 80))(v8, v9);
  if (v10 > extent) {
    extent = v10;
  }
  uint64_t v11 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
  uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 168))(v11);
  if ((v12 & 0xC000000000000001) == 0)
  {
    if (region_id < 0)
    {
      __break(1u);
    }
    else if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) > (unint64_t)region_id)
    {
      uint64_t v4 = *(void *)(v12 + 8 * region_id + 32);
      swift_retain();
      goto LABEL_8;
    }
    __break(1u);
LABEL_32:
    swift_once();
    goto LABEL_12;
  }
  uint64_t v4 = MEMORY[0x261165AD0](region_id, v12);
LABEL_8:
  uint64_t v13 = swift_bridgeObjectRelease();
  uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 112))(v13);
  if (v14)
  {
    if (!*(void *)(v14 + 16))
    {
LABEL_36:
      __break(1u);
LABEL_37:
      region_id = (Swift::Int)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(region_id + 16) + 1, 1, (void *)region_id);
      goto LABEL_18;
    }
    outlined init with copy of SILFileHandle(v14 + 32, (uint64_t)&v36);
    uint64_t v15 = v38;
    uint64_t v16 = v39;
    __swift_project_boxed_opaque_existential_1(&v36, v38);
    swift_bridgeObjectRelease();
    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v15, v16);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
    if (v17 == extent)
    {
LABEL_28:
      swift_release();
      return;
    }
  }
  uint64_t v18 = Log.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v8 = *v18;
  unint64_t v36 = 0;
  Swift::Int v37 = 0xE000000000000000;
  swift_retain();
  _StringGuts.grow(_:)(34);
  swift_bridgeObjectRelease();
  unint64_t v36 = 0xD000000000000020;
  Swift::Int v37 = 0x800000025B6A1530;
  *(void *)&long long v33 = region_id;
  v19._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v19);
  swift_bridgeObjectRelease();
  region_id = v37;
  (*(void (**)(uint64_t, unint64_t, Swift::Int))(*(void *)v8 + 152))(4, v36, v37);
  swift_release();
  swift_bridgeObjectRelease();
  if (one-time initialization token for PixelFormats != -1) {
    goto LABEL_32;
  }
LABEL_12:
  unint64_t rawValue = PixelFormats._rawValue;
  if (!*((void *)PixelFormats._rawValue + 2))
  {
    __break(1u);
    goto LABEL_34;
  }
  unint64_t v21 = specialized __RawDictionaryStorage.find<A>(_:)(0x62336138u);
  if ((v22 & 1) == 0)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v23 = *(void *)(rawValue[7] + 16 * v21 + 8);
  if (!*(void *)(v23 + 16))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v8 = *(void *)(v23 + 32);
  outlined init with copy of SILBackend?(v7, (uint64_t)&v33);
  uint64_t v24 = v34;
  if (!v34) {
    goto LABEL_39;
  }
  uint64_t v25 = v35;
  __swift_project_boxed_opaque_existential_1(&v33, v34);
  (*(void (**)(unint64_t *__return_ptr, Swift::Int, uint64_t, uint64_t, uint64_t))(v25 + 16))(&v36, extent, v8, v24, v25);
  if (v3)
  {
LABEL_22:
    swift_release();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v33);
    return;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v33);
  outlined init with copy of SILFileHandle((uint64_t)&v36, (uint64_t)&v33);
  region_id = MEMORY[0x263F8EE78];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_37;
  }
LABEL_18:
  unint64_t v27 = *(void *)(region_id + 16);
  unint64_t v26 = *(void *)(region_id + 24);
  if (v27 >= v26 >> 1) {
    region_id = (Swift::Int)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v26 > 1), v27 + 1, 1, (void *)region_id);
  }
  *(void *)(region_id + 16) = v27 + 1;
  outlined init with take of SILFileHandle(&v33, region_id + 40 * v27 + 32);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
  outlined init with copy of SILBackend?(v7, (uint64_t)&v33);
  uint64_t v28 = v34;
  if (v34)
  {
    uint64_t v29 = v35;
    __swift_project_boxed_opaque_existential_1(&v33, v34);
    (*(void (**)(unint64_t *__return_ptr, Swift::Int, uint64_t, uint64_t, uint64_t))(v29 + 16))(&v36, extent, v8, v28, v29);
    if (v3) {
      goto LABEL_22;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v33);
    outlined init with copy of SILFileHandle((uint64_t)&v36, (uint64_t)&v33);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      region_id = (Swift::Int)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(region_id + 16) + 1, 1, (void *)region_id);
    }
    unint64_t v31 = *(void *)(region_id + 16);
    unint64_t v30 = *(void *)(region_id + 24);
    if (v31 >= v30 >> 1) {
      region_id = (Swift::Int)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v30 > 1), v31 + 1, 1, (void *)region_id);
    }
    *(void *)(region_id + 16) = v31 + 1;
    outlined init with take of SILFileHandle(&v33, region_id + 40 * v31 + 32);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
    (*(void (**)(Swift::Int))(*(void *)v4 + 120))(region_id);
    uint64_t v32 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)();
    v32[2] = 2;
    v32[4] = 0xFFFFLL;
    v32[5] = -1;
    v32[6] = 0xFFFFLL;
    v32[7] = -1;
    (*(void (**)(void))(*(void *)v4 + 168))();
    goto LABEL_28;
  }
LABEL_39:
  __break(1u);
}

uint64_t SILRenderer.renderIndicatorToSurface(frame:indicator:zRotation:blitOffset:surface:)(unint64_t a1, double a2, double a3, float a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, void *a9)
{
  unint64_t v121 = a9;
  uint64_t v116 = a8;
  uint64_t v117 = a7;
  uint64_t v131 = *MEMORY[0x263EF8340];
  uint64_t v115 = (const char *)type metadata accessor for OSSignpostError();
  uint64_t v114 = *((void *)v115 - 1);
  MEMORY[0x270FA5388](v115);
  uint64_t v113 = (char *)&v107 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for OSSignpostID();
  uint64_t v123 = *(void *)(v14 - 8);
  uint64_t v124 = v14;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  unint64_t v119 = (char *)&v107 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v122 = (char *)&v107 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v107 - v19;
  uint64_t v21 = type metadata accessor for OSSignposter();
  uint64_t v126 = *(void *)(v21 - 8);
  uint64_t v127 = v21;
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v120 = (char *)&v107 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  unint64_t v26 = (char *)&v107 - v25;
  (*(void (**)(vImage_Buffer *__return_ptr, uint64_t))((*MEMORY[0x263F8EED0] & *a6) + 0xD8))(&src, v24);
  size_t rowBytes = src.rowBytes;
  if (!src.rowBytes) {
LABEL_47:
  }
    __break(1u);
  size_t v28 = HIDWORD(a1);
  uint64_t v29 = v130;
  __swift_project_boxed_opaque_existential_1(&src, src.rowBytes);
  uint64_t v30 = (*(uint64_t (**)(void, unint64_t, size_t, uint64_t))(v29 + 8))(a1, HIDWORD(a1), rowBytes, v29);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&src);
  if (v9) {
    return result;
  }
  uint64_t v110 = 0;
  uint64_t v32 = Log.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v112 = (uint64_t (*)(void))v32;
  long long v33 = *(uint64_t (**)(uint64_t))(*(void *)*v32 + 176);
  uint64_t v34 = swift_retain();
  char v35 = v33(v34);
  uint64_t v36 = swift_release();
  unint64_t v118 = 0;
  if (v35)
  {
    uint64_t v111 = v30;
    uint64_t v37 = SILSignpost.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v126 + 16))(v26, v37, v127);
    static OSSignpostID.exclusive.getter();
    uint64_t v38 = OSSignposter.logHandle.getter();
    int v39 = static os_signpost_type_t.begin.getter();
    if (OS_os_log.signpostsEnabled.getter())
    {
      unint64_t v118 = *(void (**)(char *, char *, uint64_t))(v123 + 16);
      LODWORD(v109) = v39;
      uint64_t v40 = v122;
      v118(v122, v20, v124);
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v41 = 67109120;
      LODWORD(src.data) = HIDWORD(a1);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      os_signpost_id_t v42 = OSSignpostID.rawValue.getter();
      _os_signpost_emit_with_name_impl(&dword_25B66B000, v38, (os_signpost_type_t)v109, v42, "Decompression", "[SILMGR] [Renderer] Decompressing %u bytes Signpost", v41, 8u);
      MEMORY[0x261166620](v41, -1, -1);

      uint64_t v44 = v123;
      uint64_t v43 = v124;
      (*(void (**)(char *, uint64_t))(v123 + 8))(v40, v124);
      v118(v40, v20, v43);
    }
    else
    {

      uint64_t v44 = v123;
      uint64_t v43 = v124;
      (*(void (**)(char *, char *, uint64_t))(v123 + 16))(v122, v20, v124);
    }
    type metadata accessor for OSSignpostIntervalState();
    swift_allocObject();
    unint64_t v118 = (void (*)(char *, char *, uint64_t))OSSignpostIntervalState.init(id:isOpen:)();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v20, v43);
    uint64_t v36 = (*(uint64_t (**)(char *, uint64_t))(v126 + 8))(v26, v127);
    uint64_t v30 = v111;
  }
  size_t v45 = *(void *)((char *)a6 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_Bpr);
  vImagePixelCount v46 = *(void *)((char *)a6 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_extent);
  uint64_t v47 = v125;
  if ((unsigned __int128)((uint64_t)v45 * (__int128)(uint64_t)v46) >> 64 != (uint64_t)(v45 * v46) >> 63)
  {
    __break(1u);
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  Swift::String v48 = *(uint64_t (**)(void))(*(void *)v125 + 192);
  uint64_t v111 = *(void *)v125 + 192;
  uint64_t v49 = (uint8_t *)((uint64_t (*)(uint64_t))v48)(v36);
  uint64_t v50 = (void *)(*(uint64_t (**)(void))(*(void *)v47 + 216))();
  size_t v51 = compression_decode_buffer(v49, v45 * v46, (const uint8_t *)(v30 + 32), v28, v50, COMPRESSION_LZFSE);
  swift_bridgeObjectRelease();
  uint64_t v52 = v112;
  swift_beginAccess();
  unint64_t v53 = *(uint64_t (**)(uint64_t))(**(void **)v52 + 176);
  uint64_t v54 = swift_retain();
  LOBYTE(v52) = v53(v54);
  uint64_t v55 = swift_release();
  Swift::String v56 = v118;
  if (v52)
  {
    size_t v109 = v51;
    uint64_t v57 = SILSignpost.unsafeMutableAddressor();
    Swift::String v58 = v120;
    (*(void (**)(char *, uint64_t, uint64_t))(v126 + 16))(v120, v57, v127);
    if (!v56)
    {
      __break(1u);
      goto LABEL_49;
    }
    swift_retain();
    Swift::String v59 = OSSignposter.logHandle.getter();
    Swift::String v60 = v119;
    OSSignpostIntervalState.signpostID.getter();
    int v108 = static os_signpost_type_t.end.getter();
    char v61 = OS_os_log.signpostsEnabled.getter();
    unint64_t v62 = v122;
    if (v61)
    {
      uint64_t v112 = v48;
      swift_retain();
      BOOL v63 = v113;
      checkForErrorAndConsumeState(state:)();
      swift_release();
      uint64_t v64 = v114;
      uint64_t v65 = v115;
      BOOL v66 = (*(unsigned int (**)(char *, const char *))(v114 + 88))(v63, v115) == *MEMORY[0x263F90238];
      size_t v107 = v45;
      if (v66)
      {
        uint64_t v67 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, const char *))(v64 + 8))(v63, v65);
        uint64_t v67 = "";
      }
      uint64_t v115 = v67;
      Swift::String v48 = v112;
      uint64_t v68 = v123;
      uint64_t v69 = v124;
      (*(void (**)(char *, char *, uint64_t))(v123 + 16))(v62, v60, v124);
      uint64_t v70 = v60;
      Swift::String v71 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v71 = 0;
      os_signpost_id_t v72 = OSSignpostID.rawValue.getter();
      _os_signpost_emit_with_name_impl(&dword_25B66B000, v59, (os_signpost_type_t)v108, v72, "Decompression", v115, v71, 2u);
      MEMORY[0x261166620](v71, -1, -1);
      swift_release();

      Swift::String v73 = *(void (**)(char *, uint64_t))(v68 + 8);
      v73(v70, v69);
      (*(void (**)(char *, uint64_t))(v126 + 8))(v120, v127);
      uint64_t v55 = ((uint64_t (*)(char *, uint64_t))v73)(v62, v69);
      uint64_t v47 = v125;
      size_t v45 = v107;
    }
    else
    {
      swift_release();

      (*(void (**)(char *, uint64_t))(v123 + 8))(v60, v124);
      uint64_t v55 = (*(uint64_t (**)(char *, uint64_t))(v126 + 8))(v58, v127);
    }
    size_t v51 = v109;
  }
  if (!v51)
  {
    uint64_t v100 = specialized SILError.log()(1, 0, 0xEu);
    uint64_t v102 = v101;
    unsigned __int8 v104 = v103;
    lazy protocol witness table accessor for type SILError and conformance SILError();
    swift_allocError();
    *(void *)uint64_t v105 = v100;
    *(void *)(v105 + 8) = v102;
    *(unsigned char *)(v105 + 16) = v104;
    outlined copy of SILError(v100, v102, v104);
    swift_willThrow();
    return swift_release();
  }
  float v74 = roundf((float)(6.2832 - a4) / 1.5708);
  if ((~LODWORD(v74) & 0x7F800000) == 0) {
    goto LABEL_44;
  }
  if (v74 <= -9.2234e18)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  if (v74 >= 9.2234e18)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  if ((uint64_t)v74 <= 0) {
    uint64_t v75 = -(-(uint64_t)v74 & 3);
  }
  else {
    uint64_t v75 = (uint64_t)v74 & 3;
  }
  if (v75)
  {
    Swift::String v76 = (void *)((uint64_t (*)(uint64_t))v48)(v55);
    if ((v46 & 0x8000000000000000) != 0) {
      goto LABEL_49;
    }
    src.data = v76;
    src.height = v46;
    src.width = v46;
    src.size_t rowBytes = v45;
    dest.data = (void *)(*(uint64_t (**)(void))(*(void *)v47 + 240))();
    dest.height = v46;
    dest.width = v46;
    dest.size_t rowBytes = v45;
    if (v75 < 0) {
      goto LABEL_49;
    }
    if (vImageRotate90_ARGB8888(&src, &dest, v75, byte_270904A28, 0x200u))
    {
      uint64_t v77 = specialized SILError.log()(2, 0, 0xEu);
      uint64_t v79 = v78;
      unsigned __int8 v81 = v80;
      lazy protocol witness table accessor for type SILError and conformance SILError();
      swift_allocError();
      *(void *)uint64_t v82 = v77;
      *(void *)(v82 + 8) = v79;
      *(unsigned char *)(v82 + 16) = v81;
      outlined copy of SILError(v77, v79, v81);
      swift_willThrow();
      return swift_release();
    }
  }
  uint64_t v112 = v48;
  uint64_t v83 = v121;
  uint64_t v84 = v121[3];
  uint64_t v85 = v121[4];
  __swift_project_boxed_opaque_existential_1(v121, v84);
  uint64_t v86 = (*(uint64_t (**)(void, uint64_t, uint64_t))(v85 + 48))(0, v84, v85);
  uint64_t v87 = v83[3];
  uint64_t v88 = v83[4];
  __swift_project_boxed_opaque_existential_1(v83, v87);
  unint64_t v89 = (*(uint64_t (**)(void, uint64_t, uint64_t))(v88 + 56))(0, v87, v88);
  if ((v89 & 0x8000000000000000) == 0)
  {
    unint64_t v90 = v89;
    uint64_t v127 = v86;
    if (!HIDWORD(v89))
    {
      Swift::String v91 = v121;
      uint64_t v92 = v121[3];
      uint64_t v93 = v121[4];
      __swift_project_boxed_opaque_existential_1(v121, v92);
      uint64_t v94 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v93 + 48))(1, v92, v93);
      uint64_t v95 = v91[3];
      uint64_t v96 = v91[4];
      __swift_project_boxed_opaque_existential_1(v91, v95);
      unint64_t v97 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v96 + 56))(1, v95, v96);
      if ((v97 & 0x8000000000000000) == 0)
      {
        unsigned int v98 = v97;
        if (!HIDWORD(v97))
        {
          uint64_t v99 = v75 ? (*(uint64_t (**)(void))(*(void *)v125 + 240))() : v112();
          if ((v45 & 0x8000000000000000) == 0 && !HIDWORD(v45) && (v46 & 0x8000000000000000) == 0 && !HIDWORD(v46))
          {
            unint64_t v106 = (v90 >> 2) * v116 + v117;
            sil_argb8888_to_b3a8(v99, v45, v127 + 4 * v106, v90, (void *)(v94 + v106), v98, v46, v46);
            return swift_release();
          }
        }
      }
    }
  }
LABEL_49:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SILRenderer.setPower(power_state:sync:)(Swift::Bool power_state, Swift::Bool sync)
{
  outlined init with copy of SILBackend?(v2 + 24, (uint64_t)v6);
  uint64_t v4 = v7;
  if (v7)
  {
    uint64_t v5 = v8;
    __swift_project_boxed_opaque_existential_1(v6, v7);
    (*(void (**)(Swift::Bool, uint64_t, uint64_t, uint64_t))(v5 + 8))(power_state, 1, v4, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  }
  else
  {
    __break(1u);
  }
}

uint64_t SILRenderer.swapBegin()()
{
  uint64_t v2 = v0;
  uint64_t v3 = type metadata accessor for OSSignpostID();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  char v61 = &v55[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v55[-v8];
  MEMORY[0x270FA5388](v7);
  BOOL v63 = &v55[-v10];
  uint64_t v67 = type metadata accessor for OSSignposter();
  uint64_t v62 = *(void *)(v67 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v67);
  uint64_t v13 = &v55[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = *(uint64_t (**)(void))(*v0 + 264);
  uint64_t v15 = ((uint64_t (*)(uint64_t))v14)(v11);
  uint64_t v17 = v16;
  uint64_t v19 = outlined consume of (id: UInt64, synchronous: Bool, signpost: OSSignpostIntervalState?)?(v15, v18, v16);
  if (v17 != 1)
  {
    uint64_t v25 = ((uint64_t (*)(uint64_t))v14)(v19);
    if (v27 == 1)
    {
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    goto LABEL_10;
  }
  if ((*(uint64_t (**)(uint64_t))(*v2 + 288))(v19))
  {
    uint64_t v20 = v2;
    char v21 = (*(uint64_t (**)(void, uint64_t, void))(*v2 + 384))(0, 1, 0);
    if (v1) {
      return (uint64_t)v20;
    }
    if ((v21 & 1) == 0) {
      return destructiveProjectEnumData for FrameDesc.CodingKeys(520, 0);
    }
  }
  uint64_t v59 = v3;
  uint64_t v60 = v4;
  outlined init with copy of SILBackend?((uint64_t)(v2 + 3), (uint64_t)v64);
  uint64_t v22 = v65;
  if (!v65)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v23 = v66;
  uint64_t v20 = __swift_project_boxed_opaque_existential_1(v64, v65);
  uint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 24))(v22, v23);
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v64);
    return (uint64_t)v20;
  }
  (*(void (**)(uint64_t, void, void))(*v2 + 272))(v24, 0, 0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v64);
  uint64_t v32 = Log.unsafeMutableAddressor();
  swift_beginAccess();
  long long v33 = *(uint64_t (**)(uint64_t))(*(void *)*v32 + 176);
  uint64_t v34 = swift_retain();
  char v35 = v33(v34);
  uint64_t v36 = swift_release();
  if ((v35 & 1) == 0)
  {
LABEL_20:
    uint64_t v25 = ((uint64_t (*)(uint64_t))v14)(v36);
    if (v27 == 1)
    {
      __break(1u);
      goto LABEL_22;
    }
LABEL_10:
    uint64_t v28 = v25;
    uint64_t v29 = v26;
    uint64_t v30 = v27;
    uint64_t v20 = (void *)destructiveProjectEnumData for FrameDesc.CodingKeys(0, v25);
    outlined consume of (id: UInt64, synchronous: Bool, signpost: OSSignpostIntervalState?)?(v28, v29, v30);
    return (uint64_t)v20;
  }
  uint64_t v37 = SILSignpost.unsafeMutableAddressor();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v62 + 16))(v13, v37, v67);
  uint64_t v38 = v63;
  static OSSignpostID.exclusive.getter();
  swift_retain_n();
  int v39 = OSSignposter.logHandle.getter();
  int v40 = static os_signpost_type_t.begin.getter();
  if ((OS_os_log.signpostsEnabled.getter() & 1) == 0)
  {

    swift_release_n();
    uint64_t v49 = v59;
    uint64_t v50 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v60 + 16);
    goto LABEL_18;
  }
  int v56 = v40;
  uint64_t v41 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v60 + 16);
  os_log_t v57 = v39;
  Swift::String v58 = v41;
  v41(v9, v38, v59);
  os_signpost_id_t v42 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)os_signpost_id_t v42 = 134217984;
  uint64_t v43 = v14();
  if (v45 != 1)
  {
    uint64_t v46 = v43;
    outlined consume of (id: UInt64, synchronous: Bool, signpost: OSSignpostIntervalState?)?(v43, v44, v45);
    swift_release();
    v64[0] = v46;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    os_signpost_id_t v47 = OSSignpostID.rawValue.getter();
    os_log_t v48 = v57;
    _os_signpost_emit_with_name_impl(&dword_25B66B000, v57, (os_signpost_type_t)v56, v47, "Swap", "[SILMGR] Swap %llu Begin", v42, 0xCu);
    MEMORY[0x261166620](v42, -1, -1);

    uint64_t v49 = v59;
    (*(void (**)(unsigned char *, uint64_t))(v60 + 8))(v9, v59);
    uint64_t v50 = v58;
LABEL_18:
    size_t v51 = v63;
    v50(v61, v63, v49);
    type metadata accessor for OSSignpostIntervalState();
    swift_allocObject();
    uint64_t v52 = OSSignpostIntervalState.init(id:isOpen:)();
    (*(void (**)(unsigned char *, uint64_t))(v60 + 8))(v51, v49);
    (*(void (**)(unsigned char *, uint64_t))(v62 + 8))(v13, v67);
    uint64_t v54 = (uint64_t (*)(void *, void))(*(uint64_t (**)(void *))(*v2 + 280))(v64);
    if (*(void *)(v53 + 16) == 1)
    {
LABEL_24:
      swift_release();
      __break(1u);
      goto LABEL_25;
    }
    *(void *)(v53 + 16) = v52;
    swift_release();
    uint64_t v36 = v54(v64, 0);
    goto LABEL_20;
  }
LABEL_25:
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

void SILRenderer.swap(region_id:indicator_idx:position:z_rotation:frame_number:opacity:)(unint64_t a1, unint64_t a2, uint64_t a3, double a4, double a5, float a6, float a7)
{
  void (*v49)(void *__return_ptr, void *, unint64_t, char *, uint64_t, double, double, float);
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t);
  uint64_t (*v58)(void);
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  uint64_t v64;
  double v65;
  unint64_t v66;
  double v67;
  __n128 v68;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  Swift::String v76;
  Swift::String v77;
  Swift::String v78;
  Swift::String v79;
  Swift::String v80;
  Swift::String v81;
  Swift::String v82;
  Swift::String v83;
  Swift::String v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  unsigned __int8 v89;
  unsigned __int8 v90;
  uint64_t v91;
  double v93;
  double v94;
  double v95;
  uint64_t v96;
  void *v97;
  unint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  double v103;
  int v107;
  uint64_t v108;
  Swift::String v109;
  Swift::String v110;
  Swift::String v111;
  Swift::String v112;
  Swift::String v113;
  Swift::String v114;
  double v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  uint64_t *v119;
  uint64_t v120;
  Swift::String v121;
  Swift::String v122;
  Swift::String v123;
  Swift::String v124;
  Swift::String v125;
  Swift::String v126;
  Swift::String v127;
  Swift::String v128;
  Swift::String v129;
  Swift::String v130;
  Swift::String v131;
  Swift::String v132;
  Swift::String v133;
  Swift::String v134;
  Swift::String v135;
  Swift::String v136;
  Swift::String v137;
  Swift::String v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  NSObject *v142;
  int v143;
  uint64_t v144;
  char *v145;
  os_signpost_id_t v146;
  os_log_t v147;
  void (*v148)(char *, void *);
  void *v149;
  __int16 v150;
  unint64_t *v151;
  uint64_t v152;
  Swift::String v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void **v157;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v159;
  double v160;
  double v161;
  void *v162;
  void *v163;
  id v164;
  unint64_t *v165;
  char v166;
  unint64_t *v167;
  char v168;
  unint64_t *v169;
  char v170;
  void (*v171)(double *, void);
  unint64_t *v172;
  char v173;
  unint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  BOOL v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t (*v182)(double *);
  unint64_t *v183;
  char v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  unint64_t v189;
  unint64_t v190;
  void *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t *v195;
  uint64_t v196;
  Swift::String v197;
  Swift::String v198;
  double v199;
  void *v200;
  uint64_t v201;
  void *v202;
  os_log_t v203;
  int v204;
  uint64_t v205;
  uint64_t *v206;
  int v207;
  uint64_t v208;
  double v209;
  double v210;
  uint64_t v211;
  uint64_t (*v212)(uint64_t);
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t (*v218)(void);
  int v219;
  double v220;
  double v221;
  void *v222;
  int v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  double v231;
  id v232;
  void *v233;
  double v234;
  double v235;
  uint64_t (*v236)(void);
  uint64_t v237;
  double v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  uint64_t v242;
  void *v243;
  char *v244;
  uint64_t v245;
  double v246;
  uint64_t v247;
  double v248;
  double v249;
  double v250;
  uint64_t v251;
  double v252;
  double v253;
  uint64_t v254;
  void v255[3];
  unsigned __int8 v256;
  double v257;
  double v258;
  unsigned __int16 v259;
  unsigned int v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  unsigned __int16 v264;
  unsigned __int8 v265;
  void v266[4];
  char v267;
  void v268[4];
  char v269;

  *(float *)&double v9 = a6;
  uint64_t v18 = (void *)type metadata accessor for OSSignpostID();
  v245 = *(v18 - 1);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  v244 = (char *)&v203 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  *(void *)&double v22 = (char *)&v203 - v21;
  uint64_t v23 = type metadata accessor for OSSignposter();
  uint64_t v24 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v203 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >= 4)
  {
    v250 = 0.0;
    v251 = 0xE000000000000000;
    _StringGuts.grow(_:)(17);
    swift_bridgeObjectRelease();
    v250 = 1.21790587e-152;
    v251 = 0xEF206E6F69676572;
    v246 = *(double *)&a1;
    v28._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v28);
    swift_bridgeObjectRelease();
    double v29 = v250;
    uint64_t v30 = v251;
    lazy protocol witness table accessor for type SILError and conformance SILError();
    swift_allocError();
    *(double *)uint64_t v31 = v29;
    *(void *)(v31 + 8) = v30;
    *(unsigned char *)(v31 + 16) = 6;
    swift_willThrow();
    return;
  }
  v239 = v25;
  v240 = v24;
  v241 = v18;
  v242 = a3;
  v243 = v7;
  uint64_t v32 = (void *)*SILManifest.manifest.unsafeMutableAddressor();
  if (!v32) {
    goto LABEL_121;
  }
  long long v33 = *(uint64_t (**)(unint64_t))((*MEMORY[0x263F8EED0] & *v32) + 0x60);
  uint64_t v34 = v32;
  uint64_t v35 = v33(a2);
  if (v8)
  {

    return;
  }
  double v36 = *(double *)&a2;
  uint64_t v37 = (char *)v35;
  v235 = v36;

  uint64_t v38 = v242;
  if (*(_DWORD *)&v37[OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_framesCount] <= (unsigned __int16)v242)
  {
    v250 = 0.0;
    v251 = 0xE000000000000000;
    _StringGuts.grow(_:)(19);
    swift_bridgeObjectRelease();
    v250 = -2.31584178e77;
    v251 = 0x800000025B6A1560;
    LOWORD(v246) = v38;
    v44._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v44);
    swift_bridgeObjectRelease();
    double v45 = v250;
    uint64_t v46 = v251;
    lazy protocol witness table accessor for type SILError and conformance SILError();
    swift_allocError();
    *(double *)uint64_t v42 = v45;
    *(void *)(v42 + 8) = v46;
    char v43 = 9;
    goto LABEL_10;
  }
  if (fabsf(remainderf(*(float *)&v9, 1.5708)) > 0.0001)
  {
    v250 = 0.0;
    v251 = 0xE000000000000000;
    _StringGuts.grow(_:)(19);
    v39._uint64_t countAndFlagsBits = 0xD000000000000011;
    v39._object = (void *)0x800000025B6A1660;
    String.append(_:)(v39);
    Float.write<A>(to:)();
    double v40 = v250;
    uint64_t v41 = v251;
    lazy protocol witness table accessor for type SILError and conformance SILError();
    swift_allocError();
    *(double *)uint64_t v42 = v40;
    *(void *)(v42 + 8) = v41;
    char v43 = 10;
LABEL_10:
    *(unsigned char *)(v42 + 16) = v43;
    swift_willThrow();

    return;
  }
  v234 = v22;
  LODWORD(v9) = remainderf(*(float *)&v9, 6.2832);
  os_signpost_id_t v47 = (void *)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v48 = *v243;
  v236 = *(uint64_t (**)(void))(*v243 + 312);
  v237 = v48 + 312;
  uint64_t v49 = *(void (**)(void *__return_ptr, void *, unint64_t, char *, uint64_t, double, double, float))(*(void *)v236() + 176);
  v232 = v47;
  v49(v255, v47, a1, v37, v38, a4, a5, a7);
  v233 = v37;
  v238 = *(double *)&a1;
  v232 = (id)v255[2];
  swift_release();
  v223 = 0;
  uint64_t v50 = v37;
  double v22 = v234;
  v230 = v256;
  a5 = v257;
  a4 = v258;
  v225 = v259;
  v226 = v260;
  v228 = v262;
  v229 = v261;
  v227 = v263;
  LODWORD(v234) = v265;
  LODWORD(v231) = v264;
  size_t v51 = v255[0];
  v224 = v255[1];
  a2 = OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_extent;
  uint64_t v7 = v243;
  uint64_t v52 = (*(uint64_t (**)(unint64_t, void))(*v243 + 344))(a1, *(void *)&v50[OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_extent]);
  v221 = *(double *)&a2;
  v214 = v51;
  uint64_t v53 = *(void *)&v50[OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_frames] + 20 * (unsigned __int16)v242;
  uint64_t v54 = *(unsigned int *)(v53 + 8);
  v215 = *(unsigned int *)(v53 + 12);
  v216 = v54;
  uint64_t v55 = (*(uint64_t (**)(uint64_t))(*v7 + 168))(v52);
  uint64_t v18 = (void *)v55;
  if ((v55 & 0xC000000000000001) != 0) {
    goto LABEL_109;
  }
  if (*(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a1)
  {
    __break(1u);
LABEL_111:
    __break(1u);
LABEL_112:
    __break(1u);
LABEL_113:
    __break(1u);
LABEL_114:
    __break(1u);
LABEL_115:
    __break(1u);
LABEL_116:
    __break(1u);
LABEL_117:
    __break(1u);
LABEL_118:
    __break(1u);
LABEL_119:
    __break(1u);
LABEL_120:
    __break(1u);
LABEL_121:
    __break(1u);
    goto LABEL_122;
  }
  uint64_t v7 = *(void **)(v55 + 8 * a1 + 32);
  swift_retain();
LABEL_14:
  int v56 = swift_bridgeObjectRelease();
  os_log_t v57 = *(uint64_t (**)(uint64_t))(*v7 + 136);
  v213 = *v7 + 136;
  *(double *)&a2 = COERCE_DOUBLE(v57(v56));
  Swift::String v58 = *(uint64_t (**)(void))(*v7 + 112);
  v217 = *v7 + 112;
  v218 = v58;
  uint64_t v59 = v58();
  if (!v59)
  {
LABEL_137:
    __break(1u);
LABEL_138:
    __break(1u);
LABEL_139:
    __break(1u);
    goto LABEL_140;
  }
  if ((a2 & 0x8000000000000000) != 0) {
    goto LABEL_111;
  }
  uint64_t v18 = (void *)v59;
  uint64_t v60 = a2;
  v219 = LODWORD(v9);
  v212 = v57;
  v222 = v7;
  if (a2 >= *(void *)(v59 + 16)) {
    goto LABEL_112;
  }
  *(double *)&a2 = v22;
  v220 = *(double *)&v60;
  outlined init with copy of SILFileHandle(v59 + 40 * v60 + 32, (uint64_t)&v250);
  swift_bridgeObjectRelease();
  double v22 = v253;
  char v61 = v254;
  __swift_project_boxed_opaque_existential_1(&v250, *(uint64_t *)&v253);
  uint64_t v62 = (*(uint64_t (**)(void, double, uint64_t))(v61 + 72))(0, COERCE_DOUBLE(*(void *)&v22), v61);
  BOOL v63 = (double)v62;
  double v10 = (double)(*(uint64_t (**)(void, double, uint64_t))(v61 + 64))(0, COERCE_DOUBLE(*(void *)&v22), v61);
  uint64_t v64 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v250);
  uint64_t v18 = v233;
  double v9 = (double)*(uint64_t *)((char *)v233 + *(void *)&v221);
  double v11 = round(a5 - v9 * 0.5);
  uint64_t v65 = round(a4 - v9 * 0.5);
  v248 = v11;
  v249 = v65;
  uint64_t v7 = v243;
  uint64_t v66 = (*(uint64_t (**)(uint64_t))(*v243 + 160))(v64);
  uint64_t v67 = (double)v66 - (double)v62 + -1.0;
  v68.n128_f64[0] = (double)HIDWORD(v66) - v10 + -1.0;
  if (v67 < v11 || v68.n128_f64[0] < v65)
  {
    uint64_t v70 = v65 - v68.n128_f64[0];
    Swift::String v71 = v65;
    if (v11 - v67 < 0.0) {
      os_signpost_id_t v72 = 0.0;
    }
    else {
      os_signpost_id_t v72 = v11 - v67;
    }
    Swift::String v73 = v11;
    double v11 = (double)v62;
    if (v70 < 0.0) {
      float v74 = 0.0;
    }
    else {
      float v74 = v70;
    }
    if (v67 < v73) {
      Swift::String v73 = (double)v66 - (double)v62 + -1.0;
    }
    if (v68.n128_f64[0] < v71) {
      Swift::String v71 = (double)HIDWORD(v66) - v10 + -1.0;
    }
    v248 = v73;
    v249 = v71;
    if (v72 + v9 > v11 || v74 + v9 > v10)
    {
      v250 = 0.0;
      v251 = 0xE000000000000000;
      _StringGuts.grow(_:)(52);
      v76._uint64_t countAndFlagsBits = 0x66666F2074696C42;
      v76._object = (void *)0xED00002820746573;
      String.append(_:)(v76);
      v77._uint64_t countAndFlagsBits = Double.description.getter();
      String.append(_:)(v77);
      swift_bridgeObjectRelease();
      v78._uint64_t countAndFlagsBits = 8236;
      v78._object = (void *)0xE200000000000000;
      String.append(_:)(v78);
      v79._uint64_t countAndFlagsBits = Double.description.getter();
      String.append(_:)(v79);
      swift_bridgeObjectRelease();
      v80._uint64_t countAndFlagsBits = 0xD00000000000001ALL;
      v80._object = (void *)0x800000025B6A1640;
      String.append(_:)(v80);
      v81._uint64_t countAndFlagsBits = Double.description.getter();
      String.append(_:)(v81);
      swift_bridgeObjectRelease();
      v82._uint64_t countAndFlagsBits = 8236;
      v82._object = (void *)0xE200000000000000;
      String.append(_:)(v82);
      v83._uint64_t countAndFlagsBits = Double.description.getter();
      String.append(_:)(v83);
      swift_bridgeObjectRelease();
      v84._uint64_t countAndFlagsBits = 41;
      v84._object = (void *)0xE100000000000000;
      String.append(_:)(v84);
      uint64_t v85 = specialized SILError.log()(*(uint64_t *)&v250, v251, 4u);
      uint64_t v86 = v18;
      uint64_t v88 = v87;
      unint64_t v90 = v89;
      outlined copy of SILError(v85, v87, v89);
      swift_bridgeObjectRelease();
      lazy protocol witness table accessor for type SILError and conformance SILError();
      swift_allocError();
      *(void *)Swift::String v91 = v85;
      *(void *)(v91 + 8) = v88;
      *(unsigned char *)(v91 + 16) = v90;
      swift_willThrow();

LABEL_37:
      swift_release();
      return;
    }
    if (v72 <= -1.0) {
      goto LABEL_116;
    }
    if (v72 >= 256.0) {
      goto LABEL_117;
    }
    if ((*(void *)&v72 & 0x7FF0000000000000) == 0x7FF0000000000000
      || (*(void *)&v74 & 0x7FF0000000000000) == 0x7FF0000000000000)
    {
      goto LABEL_118;
    }
    if (v74 <= -1.0) {
      goto LABEL_119;
    }
    v68.n128_u64[0] = 0x4070000000000000;
    if (v74 >= 256.0) {
      goto LABEL_120;
    }
    double v22 = *(double *)&a2;
    LODWORD(v211) = (int)v74;
    HIDWORD(v211) = (int)v72;
    BOOL v63 = (double)v62;
    uint64_t v65 = v71;
    double v11 = v73;
  }
  else
  {
    v211 = 0;
    double v22 = *(double *)&a2;
  }
  if ((~*(void *)&v63 & 0x7FF0000000000000) == 0) {
    goto LABEL_113;
  }
  if (v62 < 0) {
    goto LABEL_114;
  }
  v209 = a4;
  v210 = a5;
  v208 = v62;
  if ((unint64_t)v62 >> 16) {
    goto LABEL_115;
  }
  uint64_t v93 = 0.0;
  v207 = LODWORD(v231) | (LODWORD(v234) << 16);
  v231 = v63;
  v234 = v11;
  uint64_t v94 = v11 + v63;
  v221 = v10;
  double v11 = v65;
  uint64_t v95 = v65 + v10;
  a1 = 80;
  double v9 = 0.5;
  do
  {
    if (*(void *)&v238 != *(void *)&v93)
    {
      uint64_t v18 = (void *)((uint64_t (*)(__n128))v236)(v68);
      uint64_t v96 = (*(uint64_t (**)(void))(*v18 + 128))();
      swift_release();
      if (*(void *)&v93 >= *(void *)(v96 + 16))
      {
        __break(1u);
LABEL_108:
        __break(1u);
LABEL_109:
        uint64_t v7 = (void *)MEMORY[0x261165AD0](a1, v18);
        goto LABEL_14;
      }
      unint64_t v97 = *(void **)(v96 + a1 - 32);
      a4 = *(double *)(v96 + a1 - 16);
      double v10 = *(double *)(v96 + a1 - 8);
      unsigned int v98 = *(unsigned __int16 *)(v96 + a1);
      uint64_t v99 = v97;
      uint64_t v100 = swift_bridgeObjectRelease();
      if (v97) {
        goto LABEL_57;
      }
      uint64_t v18 = (void *)((uint64_t (*)(uint64_t))v236)(v100);
      uint64_t v101 = (*(uint64_t (**)(void))(*v18 + 104))();
      swift_release();
      if (*(void *)&v93 >= *(void *)(v101 + 16)) {
        goto LABEL_108;
      }
      unint64_t v97 = *(void **)(v101 + a1 - 32);
      a4 = *(double *)(v101 + a1 - 16);
      double v10 = *(double *)(v101 + a1 - 8);
      unsigned int v98 = *(unsigned __int16 *)(v101 + a1);
      uint64_t v102 = v97;
      uint64_t v66 = swift_bridgeObjectRelease();
      if (v97)
      {
LABEL_57:
        a5 = (double)v98;
        unsigned __int8 v103 = (double)v98 * 0.5;
        a4 = a4 - v103;
        double v10 = v10 - v103;
        if (v234 < a4 + (double)v98 && v11 < v10 + (double)v98 && a4 < v94 && v10 < v95)
        {
          v250 = 0.0;
          v251 = 0xE000000000000000;
          _StringGuts.grow(_:)(69);
          v246 = v250;
          v247 = v251;
          v109._object = (void *)0x800000025B6A1600;
          v109._uint64_t countAndFlagsBits = 0xD000000000000010;
          String.append(_:)(v109);
          v250 = v238;
          v110._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
          String.append(_:)(v110);
          swift_bridgeObjectRelease();
          v111._uint64_t countAndFlagsBits = 544497952;
          v111._object = (void *)0xE400000000000000;
          String.append(_:)(v111);
          v250 = v234;
          v251 = *(void *)&v11;
          v252 = v231;
          v253 = v221;
          type metadata accessor for CGRect(0);
          _print_unlocked<A, B>(_:_:)();
          v112._uint64_t countAndFlagsBits = 0xD00000000000001DLL;
          v112._object = (void *)0x800000025B6A1620;
          String.append(_:)(v112);
          v250 = a4;
          v251 = *(void *)&v10;
          v252 = (double)v98;
          v253 = (double)v98;
          _print_unlocked<A, B>(_:_:)();
          v113._uint64_t countAndFlagsBits = 0x67657220726F6620;
          v113._object = (void *)0xEC000000206E6F69;
          String.append(_:)(v113);
          v250 = v93;
          v114._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
          String.append(_:)(v114);
          swift_bridgeObjectRelease();
          uint64_t v115 = v246;
          uint64_t v116 = v247;
          lazy protocol witness table accessor for type SILError and conformance SILError();
          swift_allocError();
          *(double *)uint64_t v117 = v115;
          *(void *)(v117 + 8) = v116;
          *(unsigned char *)(v117 + 16) = 5;
          swift_willThrow();

          swift_release();
          return;
        }
      }
    }
    a1 += 88;
    ++*(void *)&v93;
  }
  while (a1 != 432);
  size_t v107 = (*(uint64_t (**)(unint64_t))(*v243 + 368))(v66);
  unint64_t v118 = v232;
  if (v107)
  {

    swift_release();
    return;
  }
  v205 = v108;
  unint64_t v119 = Log.unsafeMutableAddressor();
  swift_beginAccess();
  v206 = v119;
  uint64_t v120 = *v119;
  v250 = 0.0;
  v251 = 0xE000000000000000;
  swift_retain();
  _StringGuts.grow(_:)(100);
  v121._uint64_t countAndFlagsBits = 0xD000000000000018;
  v121._object = (void *)0x800000025B6A1580;
  String.append(_:)(v121);
  v246 = v238;
  v122._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v122);
  swift_bridgeObjectRelease();
  v123._object = (void *)0x800000025B6A15A0;
  v123._uint64_t countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v123);
  v246 = v235;
  v124._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v124);
  swift_bridgeObjectRelease();
  v125._uint64_t countAndFlagsBits = 0x2820746120;
  v125._object = (void *)0xE500000000000000;
  String.append(_:)(v125);
  v126._uint64_t countAndFlagsBits = Double.description.getter();
  String.append(_:)(v126);
  swift_bridgeObjectRelease();
  v127._uint64_t countAndFlagsBits = 43;
  v127._object = (void *)0xE100000000000000;
  String.append(_:)(v127);
  LOBYTE(v246) = BYTE4(v211);
  v128._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v128);
  swift_bridgeObjectRelease();
  v129._uint64_t countAndFlagsBits = 8236;
  v129._object = (void *)0xE200000000000000;
  String.append(_:)(v129);
  double v10 = v11;
  v130._uint64_t countAndFlagsBits = Double.description.getter();
  String.append(_:)(v130);
  swift_bridgeObjectRelease();
  v131._uint64_t countAndFlagsBits = 43;
  v131._object = (void *)0xE100000000000000;
  String.append(_:)(v131);
  LOBYTE(v246) = v211;
  v132._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v132);
  swift_bridgeObjectRelease();
  v133._uint64_t countAndFlagsBits = 0x20746F720A29;
  v133._object = (void *)0xE600000000000000;
  String.append(_:)(v133);
  LODWORD(a4) = v219;
  Float.write<A>(to:)();
  v134._uint64_t countAndFlagsBits = 0x20656D61726620;
  v134._object = (void *)0xE700000000000000;
  String.append(_:)(v134);
  LOWORD(v246) = v242;
  v135._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v135);
  swift_bridgeObjectRelease();
  v136._uint64_t countAndFlagsBits = 0x7974696361706F20;
  v136._object = (void *)0xE900000000000020;
  String.append(_:)(v136);
  Float.write<A>(to:)();
  v137._uint64_t countAndFlagsBits = 0x3A44496567617020;
  v137._object = (void *)0xE900000000000020;
  String.append(_:)(v137);
  v246 = v220;
  v138._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v138);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, double, uint64_t))(*(void *)v120 + 128))(4, COERCE_DOUBLE(*(void *)&v250), v251);
  swift_release();
  swift_bridgeObjectRelease();
  Swift::Int v139 = SILSignpost.unsafeMutableAddressor();
  v141 = v239;
  Swift::Int v140 = v240;
  (*(void (**)(char *, uint64_t, uint64_t))(v239 + 16))(v27, v139, v240);
  static OSSignpostID.exclusive.getter();
  unsigned int v142 = OSSignposter.logHandle.getter();
  v143 = static os_signpost_type_t.event.getter();
  if (OS_os_log.signpostsEnabled.getter())
  {
    v204 = v143;
    (*(void (**)(char *, double, void *))(v245 + 16))(v244, COERCE_DOUBLE(*(void *)&v22), v241);
    Swift::Int v144 = swift_slowAlloc();
    *(_DWORD *)Swift::Int v144 = 134219008;
    v250 = v238;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v144 + 12) = 2048;
    v250 = v235;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v144 + 22) = 2048;
    v203 = v142;
    swift_beginAccess();
    v250 = v248;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v144 + 32) = 2048;
    v250 = v249;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v144 + 42) = 2048;
    v250 = a7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    Swift::Int v145 = v244;
    uint64_t v146 = OSSignpostID.rawValue.getter();
    uint64_t v147 = v203;
    _os_signpost_emit_with_name_impl(&dword_25B66B000, v203, (os_signpost_type_t)v204, v146, "Swap", "region: %ld, id: %ld at (%f, (%f), opacity %f", (uint8_t *)v144, 0x34u);
    MEMORY[0x261166620](v144, -1, -1);

    v148 = *(void (**)(char *, void *))(v245 + 8);
    unsigned int v149 = v241;
    v148(*(char **)&v22, v241);
    (*(void (**)(char *, uint64_t))(v141 + 8))(v27, v240);
    v148(v145, v149);
  }
  else
  {

    (*(void (**)(double, void *))(v245 + 8))(COERCE_DOUBLE(*(void *)&v22), v241);
    (*(void (**)(char *, uint64_t))(v141 + 8))(v27, v140);
  }
  double v11 = v231;
  uint64_t v18 = v222;
  a2 = v211;
  *(void *)&double v22 = HIDWORD(v211);
  Swift::Int v150 = (*(uint64_t (**)(void *, uint64_t, void, void, float))(*v222 + 184))(v233, v242, HIDWORD(v211), v211, *(float *)&a4);
  a5 = v209;
  double v9 = v210;
  if ((v150 & 1) == 0 || a7 <= 0.0) {
    goto LABEL_95;
  }
  if ((v150 & 0x100) != 0)
  {
    Swift::Int v151 = (unint64_t *)v206;
    swift_beginAccess();
    a1 = *v151;
    v250 = 0.0;
    v251 = 0xE000000000000000;
    swift_retain();
    _StringGuts.grow(_:)(18);
    swift_bridgeObjectRelease();
    v250 = -2.31584178e77;
    v251 = 0x800000025B6A15E0;
    uint64_t v152 = *(void *)&v220;
    v246 = v220;
    v153._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v153);
    swift_bridgeObjectRelease();
    uint64_t v18 = (void *)v251;
    (*(void (**)(uint64_t, double, uint64_t))(*(void *)a1 + 136))(4, COERCE_DOUBLE(*(void *)&v250), v251);
    swift_release();
    v154 = swift_bridgeObjectRelease();
    v155 = ((uint64_t (*)(uint64_t))v218)(v154);
    if (v155)
    {
      if (v152 >= *(void *)(v155 + 16)) {
        goto LABEL_128;
      }
      outlined init with copy of SILFileHandle(v155 + 40 * v152 + 32, (uint64_t)&v250);
      swift_bridgeObjectRelease();
      __swift_project_boxed_opaque_existential_1(&v250, *(uint64_t *)&v253);
      IOSurfaceLike.clear()();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v250);
      uint64_t v18 = v222;
      goto LABEL_81;
    }
LABEL_141:
    __break(1u);
    goto LABEL_142;
  }
LABEL_81:
  v156 = (*(uint64_t (**)(double *))(*v18 + 128))(&v250);
  uint64_t v7 = *v157;
  if (!*v157)
  {
LABEL_140:
    __break(1u);
    goto LABEL_141;
  }
  a1 = v156;
  uint64_t v18 = v157;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  void *v18 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    goto LABEL_123;
  }
  while (1)
  {
    if (*(uint64_t *)&v220 >= v7[2])
    {
      __break(1u);
LABEL_125:
      __break(1u);
      goto LABEL_126;
    }
    v162 = v233;
    SILRenderer.renderIndicatorToSurface(frame:indicator:zRotation:blitOffset:surface:)(v216 | (v215 << 32), v160, v161, *(float *)&a4, v159, v233, *(uint64_t *)&v22, a2, &v7[5 * *(void *)&v220 + 4]);
    v163 = v222;
    v164 = v232;
    if (v8)
    {
      ((void (*)(double *, uint64_t))a1)(&v250, 1);

      goto LABEL_37;
    }
    ((void (*)(double *, void))a1)(&v250, 0);
    uint64_t v152 = *(void *)(*v163 + 176);
    uint64_t v27 = (char *)((uint64_t (*)(double *))v152)(&v250);
    uint64_t v18 = v165;
    a1 = *v165;
    v166 = swift_isUniquelyReferenced_nonNull_native();
    *(double *)uint64_t v18 = *(double *)&a1;
    if ((v166 & 1) == 0)
    {
LABEL_129:
      *(double *)&a1 = COERCE_DOUBLE(specialized _ArrayBuffer._consumeAndCreateNew()((void *)a1));
      *(double *)uint64_t v18 = *(double *)&a1;
    }
    if (*(uint64_t *)&v220 >= *(void *)(a1 + 16))
    {
      __break(1u);
    }
    else
    {
      *(double *)(a1 + 16 * *(void *)&v220 + 40) = v235;
      ((void (*)(double *, void))v27)(&v250, 0);
      uint64_t v27 = (char *)((uint64_t (*)(double *))v152)(&v250);
      uint64_t v18 = v167;
      a1 = *v167;
      v168 = swift_isUniquelyReferenced_nonNull_native();
      *(double *)uint64_t v18 = *(double *)&a1;
      if (v168) {
        goto LABEL_89;
      }
    }
    *(double *)&a1 = COERCE_DOUBLE(specialized _ArrayBuffer._consumeAndCreateNew()((void *)a1));
    *(double *)uint64_t v18 = *(double *)&a1;
LABEL_89:
    if (*(uint64_t *)&v220 >= *(void *)(a1 + 16))
    {
      __break(1u);
    }
    else
    {
      *(_WORD *)(a1 + 16 * *(void *)&v220 + 32) = v242;
      ((void (*)(double *, void))v27)(&v250, 0);
      uint64_t v27 = (char *)((uint64_t (*)(double *))v152)(&v250);
      uint64_t v18 = v169;
      a1 = *v169;
      v170 = swift_isUniquelyReferenced_nonNull_native();
      *(double *)uint64_t v18 = *(double *)&a1;
      if (v170) {
        goto LABEL_91;
      }
    }
    *(double *)&a1 = COERCE_DOUBLE(specialized _ArrayBuffer._consumeAndCreateNew()((void *)a1));
    *(double *)uint64_t v18 = *(double *)&a1;
LABEL_91:
    v171 = (void (*)(double *, void))v222;
    if (*(uint64_t *)&v220 >= *(void *)(a1 + 16))
    {
      __break(1u);
    }
    else
    {
      *(_DWORD *)(a1 + 16 * *(void *)&v220 + 36) = LODWORD(a4);
      ((void (*)(double *, void))v27)(&v250, 0);
      v171 = (void (*)(double *, void))((uint64_t (*)(double *))v152)(&v250);
      uint64_t v18 = v172;
      a1 = *v172;
      v173 = swift_isUniquelyReferenced_nonNull_native();
      *(double *)uint64_t v18 = *(double *)&a1;
      if (v173) {
        goto LABEL_93;
      }
    }
    *(double *)&a1 = COERCE_DOUBLE(specialized _ArrayBuffer._consumeAndCreateNew()((void *)a1));
    *(double *)uint64_t v18 = *(double *)&a1;
LABEL_93:
    uint64_t v18 = v222;
    if (*(uint64_t *)&v220 >= *(void *)(a1 + 16))
    {
      __break(1u);
      __break(1u);
      __break(1u);
      goto LABEL_137;
    }
    v174 = a1 + 16 * *(void *)&v220;
    *(unsigned char *)(v174 + 34) = BYTE4(v211);
    *(unsigned char *)(v174 + 35) = a2;
    v171(&v250, 0);
LABEL_95:
    uint64_t v27 = (char *)(v243 + 3);
    outlined init with copy of SILBackend?((uint64_t)(v243 + 3), (uint64_t)&v250);
    *(double *)&a1 = v253;
    a2 = (unint64_t)v233;
    if (v253 == 0.0) {
      goto LABEL_138;
    }
    v175 = v254;
    double v22 = COERCE_DOUBLE(__swift_project_boxed_opaque_existential_1(&v250, *(uint64_t *)&v253));
    v176 = v218();
    if (!v176) {
      goto LABEL_139;
    }
    uint64_t v7 = (void *)v176;
    if (*(uint64_t *)&v220 < *(void *)(v176 + 16)) {
      break;
    }
LABEL_122:
    __break(1u);
LABEL_123:
    uint64_t v7 = specialized _ArrayBuffer._consumeAndCreateNew()(v7);
    void *v18 = v7;
  }
  outlined init with copy of SILFileHandle(v176 + 40 * *(void *)&v220 + 32, (uint64_t)&v246);
  swift_bridgeObjectRelease();
  v266[0] = 0;
  v266[1] = 0;
  *(double *)&v266[2] = v11;
  *(double *)&v266[3] = v221;
  v267 = 0;
  *(double *)v268 = v234;
  *(double *)&v268[1] = v10;
  *(double *)&v268[2] = v11;
  *(double *)&v268[3] = v221;
  v269 = 0;
  (*(void (**)(double, unint64_t, double *, void *, void *, uint64_t, uint64_t, unint64_t, float, uint64_t))(v175 + 32))(COERCE_DOUBLE(*(void *)&v238), a2, &v246, v266, v268, v242, v230, a1, a7, v175);
  if (v8)
  {

    swift_release();
    outlined destroy of SILBackend?((uint64_t)&v246, &demangling cache variable for type metadata for IOSurfaceLike?);

    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v250);
    return;
  }
  outlined destroy of SILBackend?((uint64_t)&v246, &demangling cache variable for type metadata for IOSurfaceLike?);
  v177 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v250);
  v178 = v212(v177);
  v179 = __OFSUB__(1, v178);
  v180 = 1 - v178;
  if (v179) {
    goto LABEL_125;
  }
  v181 = (*(uint64_t (**)(uint64_t))(*v18 + 144))(v180);
  v182 = *(uint64_t (**)(double *))(*(void *)((uint64_t (*)(uint64_t))v236)(v181) + 144);
  *(double *)&a1 = COERCE_DOUBLE(v232);
  double v22 = COERCE_DOUBLE(v182(&v250));
  uint64_t v18 = v183;
  a2 = *v183;
  v184 = swift_isUniquelyReferenced_nonNull_native();
  *(double *)uint64_t v18 = *(double *)&a2;
  if (v184) {
    goto LABEL_102;
  }
LABEL_126:
  *(double *)&a2 = COERCE_DOUBLE(specialized _ArrayBuffer._consumeAndCreateNew()((void *)a2));
  *(double *)uint64_t v18 = *(double *)&a2;
LABEL_102:
  v186 = v228;
  v185 = v229;
  v187 = v226;
  v188 = v227;
  uint64_t v152 = (uint64_t)v222;
  if (*(void *)(a2 + 16) <= *(uint64_t *)&v238)
  {
    __break(1u);
LABEL_128:
    __break(1u);
    goto LABEL_129;
  }
  v189 = (unsigned __int16)v208 | (unint64_t)(v225 << 16);
  v190 = a2 + 88 * *(void *)&v238;
  v191 = *(void **)(v190 + 48);
  v192 = v224;
  *(void *)(v190 + 32) = v214;
  *(void *)(v190 + 40) = v192;
  v193 = v189 | (v187 << 32);
  v194 = v230;
  *(double *)(v190 + 48) = *(double *)&a1;
  *(void *)(v190 + 56) = v194;
  *(double *)(v190 + 64) = v9;
  *(double *)(v190 + 72) = a5;
  *(void *)(v190 + 80) = v193;
  *(void *)(v190 + 88) = v185;
  *(void *)(v190 + 96) = v186;
  *(void *)(v190 + 104) = v188;
  LOWORD(v194) = v207;
  *(unsigned char *)(v190 + 114) = BYTE2(v207);
  *(_WORD *)(v190 + 112) = v194;

  (*(void (**)(double *, void))&v22)(&v250, 0);
  swift_release();
  if (v223)
  {

    swift_release();
    return;
  }
  v195 = v206;
  swift_beginAccess();
  v196 = *v195;
  v250 = 0.0;
  v251 = 0xE000000000000000;
  swift_retain();
  _StringGuts.grow(_:)(29);
  v197._uint64_t countAndFlagsBits = 0xD000000000000019;
  v197._object = (void *)0x800000025B6A15C0;
  String.append(_:)(v197);
  Double.write<A>(to:)();
  v198._uint64_t countAndFlagsBits = 8307;
  v198._object = (void *)0xE200000000000000;
  String.append(_:)(v198);
  (*(void (**)(uint64_t, double, uint64_t))(*(void *)v196 + 128))(7, COERCE_DOUBLE(*(void *)&v250), v251);
  swift_release();
  swift_bridgeObjectRelease();
  outlined init with copy of SILBackend?((uint64_t)v27, (uint64_t)&v250);
  v199 = v253;
  v200 = v233;
  if (v253 != 0.0)
  {
    v201 = v254;
    __swift_project_boxed_opaque_existential_1(&v250, *(uint64_t *)&v253);
    v202 = (void *)(*(uint64_t (**)(double, uint64_t, uint64_t, void, double, uint64_t))(v201 + 64))(COERCE_DOUBLE(*(void *)&v238), 1, v192, 0, COERCE_DOUBLE(*(void *)&v199), v201);
    swift_release();

    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v250);
    return;
  }
LABEL_142:
  __break(1u);
}

Swift::Bool __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SILRenderer.swapWait(swapID:type:)(Swift::UInt64_optional swapID, SILManager::SwapWaitType type)
{
  uint64_t v3 = type;
  Swift::Bool is_nil = swapID.is_nil;
  Swift::UInt64 value = swapID.value;
  Swift::Bool result = outlined init with copy of SILBackend?(v2 + 24, (uint64_t)v10);
  uint64_t v7 = v11;
  if (v11)
  {
    uint64_t v8 = v12;
    __swift_project_boxed_opaque_existential_1(v10, v11);
    if (is_nil) {
      Swift::UInt64 value = (*(uint64_t (**)(void))(*(void *)v2 + 288))();
    }
    char v9 = (*(uint64_t (**)(Swift::UInt64, uint64_t, uint64_t, uint64_t))(v8 + 40))(value, v3, v7, v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
    return v9 & 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void (*SILRenderer.turnOffRegions(regionMask:synchronous:)(uint64_t a1, int a2))(uint64_t *, void)
{
  uint64_t v4 = v2;
  int v58 = a2;
  uint64_t v6 = type metadata accessor for OSSignpostID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  double v10 = &v46[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v46[-v11];
  uint64_t v13 = type metadata accessor for OSSignposter();
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = &v46[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if ((a1 - 1) >= 0xF)
  {
    uint64_t v54 = 0;
    uint64_t v55 = 0xE000000000000000;
    _StringGuts.grow(_:)(41);
    swift_bridgeObjectRelease();
    uint64_t v54 = 0xD000000000000014;
    uint64_t v55 = 0x800000025B6A1680;
    int v59 = a1;
    v38._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v38);
    swift_bridgeObjectRelease();
    v39._object = (void *)0x800000025B6A16A0;
    v39._uint64_t countAndFlagsBits = 0xD000000000000013;
    String.append(_:)(v39);
    uint64_t v40 = specialized SILError.log()(v54, v55, 6u);
    uint64_t v42 = v41;
    unsigned __int8 v44 = v43;
    outlined copy of SILError(v40, v41, v43);
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type SILError and conformance SILError();
    swift_allocError();
    *(void *)uint64_t v45 = v40;
    *(void *)(v45 + 8) = v42;
    *(unsigned char *)(v45 + 16) = v44;
    return (void (*)(uint64_t *, void))swift_willThrow();
  }
  uint64_t v52 = v15;
  uint64_t v53 = v7;
  Swift::Bool result = (void (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t))(*(void *)v4 + 368))(v14);
  if (!v3 && !result)
  {
    uint64_t v48 = v19;
    unsigned int v49 = 0;
    uint64_t v50 = v6;
    Swift::Bool result = (void (*)(uint64_t *, void))outlined init with copy of SILBackend?(v4 + 24, (uint64_t)&v54);
    uint64_t v20 = v56;
    if (v56)
    {
      os_log_t v51 = v57;
      __swift_project_boxed_opaque_existential_1(&v54, v56);
      ((void (*)(uint64_t, uint64_t))v51[6].isa)(a1, v20);
      uint64_t v21 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v54);
      uint64_t v22 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 312))(v21);
      (*(void (**)(uint64_t))(*(void *)v22 + 160))(a1);
      uint64_t v23 = swift_release();
      Swift::Bool result = (void (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t))(*(void *)v4 + 264))(v23);
      if (v25 != 1)
      {
        char v26 = v24;
        outlined consume of (id: UInt64, synchronous: Bool, signpost: OSSignpostIntervalState?)?((uint64_t)result, v24, v25);
        Swift::Bool result = (void (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t *))(*(void *)v4 + 280))(&v54);
        if (*(void *)(v27 + 16) != 1)
        {
          *(unsigned char *)(v27 + 8) = (v26 | v58) & 1;
          result(&v54, 0);
          uint64_t v28 = SILSignpost.unsafeMutableAddressor();
          uint64_t v29 = v52;
          (*(void (**)(unsigned char *, uint64_t, uint64_t))(v52 + 16))(v17, v28, v13);
          static OSSignpostID.exclusive.getter();
          uint64_t v30 = OSSignposter.logHandle.getter();
          int v31 = static os_signpost_type_t.event.getter();
          if (OS_os_log.signpostsEnabled.getter())
          {
            (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v53 + 16))(v10, v12, v50);
            uint64_t v32 = (_DWORD *)swift_slowAlloc();
            os_log_t v51 = v30;
            int v47 = v31;
            long long v33 = v32;
            _DWORD *v32 = 67109376;
            LODWORD(v54) = a1;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *((_WORD *)v33 + 4) = 1024;
            LODWORD(v54) = v58 & 1;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            os_signpost_id_t v34 = OSSignpostID.rawValue.getter();
            os_log_t v35 = v51;
            _os_signpost_emit_with_name_impl(&dword_25B66B000, v51, (os_signpost_type_t)v47, v34, "TurnOffRegions", "mask: %d, sync: %{BOOL}d", (uint8_t *)v33, 0xEu);
            MEMORY[0x261166620](v33, -1, -1);

            double v36 = *(void (**)(unsigned char *, uint64_t))(v53 + 8);
            uint64_t v37 = v50;
            v36(v12, v50);
            (*(void (**)(unsigned char *, uint64_t))(v29 + 8))(v17, v13);
            v36(v10, v37);
          }
          else
          {

            (*(void (**)(unsigned char *, uint64_t))(v53 + 8))(v12, v50);
            (*(void (**)(unsigned char *, uint64_t))(v29 + 8))(v17, v13);
          }
          return (void (*)(uint64_t *, void))v49;
        }
LABEL_15:
        __break(1u);
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_15;
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SILRenderer.swapEnd()()
{
  uint64_t v2 = v0;
  uint64_t v3 = (const char *)type metadata accessor for OSSignpostError();
  uint64_t v91 = *((void *)v3 - 1);
  uint64_t v92 = v3;
  MEMORY[0x270FA5388](v3);
  unint64_t v90 = (char *)&v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for OSSignpostID();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v93 = (char *)&v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v94 = (char *)&v82 - v9;
  uint64_t v10 = type metadata accessor for OSSignposter();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v95 = (char *)&v82 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(uint64_t (**)(void))(*(void *)v0 + 264);
  uint64_t v15 = ((uint64_t (*)(uint64_t))v14)(v12);
  uint64_t v17 = v16;
  outlined consume of (id: UInt64, synchronous: Bool, signpost: OSSignpostIntervalState?)?(v15, v18, v16);
  if (v17 == 1)
  {
    uint64_t v19 = specialized SILError.log()(4, 0, 0xEu);
    uint64_t v21 = v20;
    unsigned __int8 v23 = v22;
    lazy protocol witness table accessor for type SILError and conformance SILError();
    swift_allocError();
    *(void *)uint64_t v24 = v19;
    *(void *)(v24 + 8) = v21;
    *(unsigned char *)(v24 + 16) = v23;
    outlined copy of SILError(v19, v21, v23);
    swift_willThrow();
    return;
  }
  uint64_t v88 = v11;
  uint64_t v89 = v10;
  uint64_t v87 = v6;
  outlined init with copy of SILBackend?(v2 + 24, (uint64_t)v98);
  uint64_t v25 = v99;
  if (!v99)
  {
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v26 = v100;
  __swift_project_boxed_opaque_existential_1(v98, v99);
  (*(void (**)(uint64_t, uint64_t))(v26 + 56))(v25, v26);
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
LABEL_6:
    (*(void (**)(void, void, uint64_t))(*(void *)v2 + 272))(0, 0, 1);
    return;
  }
  uint64_t v27 = __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  uint64_t v28 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 312))(v27);
  (*(void (**)(uint64_t))(*(void *)v28 + 168))(v28);
  uint64_t v29 = swift_release();
  uint64_t v30 = ((uint64_t (*)(uint64_t))v14)(v29);
  if (v32 == 1) {
    goto LABEL_28;
  }
  char v33 = v31;
  uint64_t v34 = outlined consume of (id: UInt64, synchronous: Bool, signpost: OSSignpostIntervalState?)?(v30, v31, v32);
  os_log_t v35 = v95;
  if ((v33 & 1) == 0) {
    goto LABEL_15;
  }
  uint64_t v84 = v5;
  outlined init with copy of SILBackend?(v2 + 24, (uint64_t)v98);
  uint64_t v36 = v99;
  if (!v99)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v37 = v100;
  uint64_t v85 = __swift_project_boxed_opaque_existential_1(v98, v99);
  uint64_t v38 = v14();
  uint64_t v86 = v40;
  if (v39 == 1)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  uint64_t v41 = v38;
  uint64_t v42 = v39;
  char v43 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 40))(v38, 2, v36, v37);
  outlined consume of (id: UInt64, synchronous: Bool, signpost: OSSignpostIntervalState?)?(v41, v86, v42);
  uint64_t v34 = __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  if (v43)
  {
LABEL_14:
    uint64_t v5 = v84;
    os_log_t v35 = v95;
LABEL_15:
    uint64_t v53 = ((uint64_t (*)(uint64_t))v14)(v34);
    if (v54 != 1)
    {
      uint64_t v55 = v53;
      swift_release();
      uint64_t v56 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 296))(v55);
      uint64_t v57 = ((uint64_t (*)(uint64_t))v14)(v56);
      if (v59 != 1)
      {
        uint64_t v60 = v59;
        outlined consume of (id: UInt64, synchronous: Bool, signpost: OSSignpostIntervalState?)?(v57, v58, v59);
        if (!v60) {
          goto LABEL_6;
        }
        uint64_t v61 = SILSignpost.unsafeMutableAddressor();
        uint64_t v62 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v88 + 16))(v35, v61, v89);
        uint64_t v85 = (void *)((uint64_t (*)(uint64_t))v14)(v62);
        uint64_t v86 = v63;
        if (v64)
        {
          if (v64 != 1)
          {
            uint64_t v65 = v64;
            swift_retain_n();
            uint64_t v66 = OSSignposter.logHandle.getter();
            uint64_t v67 = v94;
            OSSignpostIntervalState.signpostID.getter();
            LODWORD(v84) = static os_signpost_type_t.end.getter();
            if ((OS_os_log.signpostsEnabled.getter() & 1) == 0)
            {

              swift_release();
              outlined consume of (id: UInt64, synchronous: Bool, signpost: OSSignpostIntervalState?)?((uint64_t)v85, v86, v65);
              swift_release();
              (*(void (**)(char *, uint64_t))(v87 + 8))(v67, v5);
              (*(void (**)(char *, uint64_t))(v88 + 8))(v95, v89);
              goto LABEL_6;
            }
            os_log_t v82 = v66;
            swift_retain();
            uint64_t v68 = v90;
            checkForErrorAndConsumeState(state:)();
            uint64_t v83 = v65;
            outlined consume of (id: UInt64, synchronous: Bool, signpost: OSSignpostIntervalState?)?((uint64_t)v85, v86, v65);
            uint64_t v70 = v91;
            uint64_t v69 = v92;
            if ((*(unsigned int (**)(char *, const char *))(v91 + 88))(v68, v92) == *MEMORY[0x263F90238])
            {
              char v71 = 0;
              uint64_t v92 = "[Error] Interval already ended";
            }
            else
            {
              (*(void (**)(char *, const char *))(v70 + 8))(v68, v69);
              uint64_t v92 = "[SILMGR] Swap %llu End";
              char v71 = 1;
            }
            os_signpost_id_t v72 = v93;
            uint64_t v73 = v87;
            (*(void (**)(char *, char *, uint64_t))(v87 + 16))(v93, v94, v5);
            uint64_t v74 = swift_slowAlloc();
            *(unsigned char *)uint64_t v74 = 0;
            *(unsigned char *)(v74 + 1) = v71;
            *(_WORD *)(v74 + 2) = 2048;
            uint64_t v75 = v14();
            if (v77 != 1)
            {
              unint64_t v78 = v75;
              outlined consume of (id: UInt64, synchronous: Bool, signpost: OSSignpostIntervalState?)?(v75, v76, v77);
              swift_release();
              unint64_t v96 = v78;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_release();
              os_signpost_id_t v79 = OSSignpostID.rawValue.getter();
              os_log_t v80 = v82;
              _os_signpost_emit_with_name_impl(&dword_25B66B000, v82, (os_signpost_type_t)v84, v79, "Swap", v92, (uint8_t *)v74, 0xCu);
              MEMORY[0x261166620](v74, -1, -1);

              outlined consume of (id: UInt64, synchronous: Bool, signpost: OSSignpostIntervalState?)?((uint64_t)v85, v86, v83);
              unsigned __int8 v81 = *(void (**)(char *, uint64_t))(v73 + 8);
              v81(v94, v5);
              (*(void (**)(char *, uint64_t))(v88 + 8))(v95, v89);
              v81(v72, v5);
              goto LABEL_6;
            }
            goto LABEL_35;
          }
LABEL_34:
          __break(1u);
LABEL_35:
          swift_release();
          __break(1u);
          goto LABEL_36;
        }
LABEL_33:
        __break(1u);
        goto LABEL_34;
      }
      goto LABEL_30;
    }
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  unsigned __int8 v44 = Log.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v45 = *v44;
  unint64_t v96 = 0;
  unint64_t v97 = 0xE000000000000000;
  swift_retain();
  _StringGuts.grow(_:)(28);
  uint64_t v46 = swift_bridgeObjectRelease();
  unint64_t v96 = 0xD00000000000001ALL;
  unint64_t v97 = 0x800000025B6A16F0;
  uint64_t v47 = ((uint64_t (*)(uint64_t))v14)(v46);
  uint64_t v86 = v49;
  if (v48 != 1)
  {
    uint64_t v50 = v47;
    uint64_t v51 = v48;
    uint64_t v101 = v47;
    v52._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v52);
    swift_bridgeObjectRelease();
    outlined consume of (id: UInt64, synchronous: Bool, signpost: OSSignpostIntervalState?)?(v50, v86, v51);
    (*(void (**)(uint64_t, unint64_t, unint64_t))(*(void *)v45 + 144))(4, v96, v97);
    swift_release();
    uint64_t v34 = swift_bridgeObjectRelease();
    goto LABEL_14;
  }
LABEL_36:
  __break(1u);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance FlipBookStateHash(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t SILIndicatorValidator.__allocating_init(framesCount:constraints:flipbook:)(unsigned __int16 a1, void *a2, void *a3)
{
  int v6 = a1;
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = (void *)MEMORY[0x263F8EED0];
  if (v6)
  {
    unsigned int v9 = (*(unsigned int (**)(void))((*MEMORY[0x263F8EED0] & *a2) + 0x90))() >> 16;
    if ((unsigned __int16)(a1 - 1) <= v9) {
      __int16 v10 = v9;
    }
    else {
      __int16 v10 = a1 - 1;
    }
  }
  else
  {
    __int16 v10 = 0;
  }
  uint64_t v11 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))((*v8 & *a2) + 0xA0))(v15);
  *(_WORD *)(v12 + 2) = v10;
  v11(v15, 0);

  uint64_t v13 = MEMORY[0x263F8EE78];
  *(_WORD *)(v7 + 32) = a1;
  *(void *)(v7 + 16) = v13;
  *(void *)(v7 + 24) = a2;
  return v7;
}

Swift::Bool __swiftcall SILIndicatorValidator.flipbookFrameSteady(frame:)(Swift::UInt16 frame)
{
  uint64_t v2 = *(void *)(v1 + 16);
  unint64_t v3 = *(void *)(v2 + 16);
  if (v3 && *(unsigned __int16 *)(v2 + 32) <= frame)
  {
    if (v3 == 1)
    {
      uint64_t v4 = 1;
    }
    else
    {
      __int16 v10 = (unsigned __int16 *)(v2 + 64);
      uint64_t v4 = 1;
      while (1)
      {
        unsigned int v11 = *v10;
        v10 += 16;
        if (v11 > frame) {
          break;
        }
        uint64_t v12 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          goto LABEL_21;
        }
        ++v4;
        if (v12 == v3)
        {
          uint64_t v4 = *(void *)(v2 + 16);
          break;
        }
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  BOOL v5 = __OFSUB__(v4, 1);
  unint64_t v6 = v4 - 1;
  if (v5)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int64_t v7 = v6 + 1;
  if (__OFADD__(v6, 1))
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v7 >= (uint64_t)v3)
  {
    uint64_t v8 = (unsigned __int16 *)(v1 + 32);
  }
  else
  {
    if (v7 < 0)
    {
LABEL_25:
      __break(1u);
      return frame;
    }
    uint64_t v8 = (unsigned __int16 *)(v2 + 32 * v7 + 32);
  }
  if (v6 >= v3) {
    goto LABEL_23;
  }
  int v9 = *(unsigned __int16 *)(v2 + 32 * v6 + 32) + 1;
  if ((v9 & 0x10000) != 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  LOBYTE(frame) = *v8 == (unsigned __int16)v9;
  return frame;
}

void SILIndicatorValidator.validateFlipBookTransitionFrom(now:prevState:toFrame:)(uint64_t a1, uint64_t a2, unsigned __int16 a3)
{
  unsigned int v4 = *(unsigned __int16 *)(a2 + 50);
  if (v4 == a3) {
    return;
  }
  uint64_t v5 = *(void *)(v3 + 16);
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 && v4 >= *(unsigned __int16 *)(v5 + 32))
  {
    if (v6 == 1)
    {
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v24 = (unsigned __int16 *)(v5 + 64);
      uint64_t v7 = 1;
      while (1)
      {
        unsigned int v25 = *v24;
        v24 += 16;
        if (v4 < v25) {
          break;
        }
        uint64_t v26 = v7 + 1;
        if (__OFADD__(v7, 1))
        {
LABEL_87:
          __break(1u);
LABEL_88:
          __break(1u);
LABEL_89:
          __break(1u);
          goto LABEL_90;
        }
        ++v7;
        if (v26 == v6)
        {
          uint64_t v7 = *(void *)(v5 + 16);
          break;
        }
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  unint64_t v8 = v7 - 1;
  if (__OFSUB__(v7, 1))
  {
LABEL_90:
    __break(1u);
    goto LABEL_91;
  }
  if (v8 >= v6)
  {
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  int v9 = (unsigned __int16 *)(v5 + 32);
  __int16 v10 = (unsigned __int16 *)(v5 + 32 + 32 * v8);
  unsigned int v11 = *v10;
  uint64_t v12 = *((void *)v10 + 1);
  int64_t v13 = v8 + 1;
  if (v13 >= (uint64_t)v6) {
    uint64_t v14 = (unsigned __int16 *)(v3 + 32);
  }
  else {
    uint64_t v14 = (unsigned __int16 *)(v5 + 32 + 32 * v13);
  }
  if (v11 > a3 || (unsigned int v15 = *v14, v15 <= a3))
  {
    if (*v9 <= a3)
    {
      if (v6 == 1)
      {
        uint64_t v17 = 1;
      }
      else
      {
        uint64_t v27 = (unsigned __int16 *)(v5 + 64);
        uint64_t v17 = 1;
        while (1)
        {
          unsigned int v28 = *v27;
          v27 += 16;
          if (v28 > a3) {
            break;
          }
          uint64_t v29 = v17 + 1;
          if (__OFADD__(v17, 1)) {
            goto LABEL_88;
          }
          ++v17;
          if (v29 == v6)
          {
            uint64_t v17 = v6;
            break;
          }
        }
      }
    }
    else
    {
      uint64_t v17 = 0;
    }
    BOOL v30 = __OFSUB__(v17, 1);
    unint64_t v31 = v17 - 1;
    if (!v30)
    {
      if (v31 < v6)
      {
        uint64_t v82 = *(unsigned __int16 *)(a2 + 50);
        uint64_t v32 = *(void *)(v12 + 16);
        if (v32)
        {
          char v33 = &v9[16 * v31];
          int v80 = *v33;
          uint64_t v34 = *((void *)v33 + 1);
          uint64_t v35 = *(void *)(v34 + 16);
          uint64_t v84 = v12 + 32;
          uint64_t v36 = *((void *)v10 + 2);
          swift_bridgeObjectRetain_n();
          uint64_t v81 = v36;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          unint64_t v37 = 0;
          uint64_t v83 = v12;
          while (1)
          {
            if (v37 >= *(void *)(v12 + 16)) {
              goto LABEL_89;
            }
            uint64_t v38 = (unsigned __int16 *)(v84 + 4 * v37);
            int v39 = *v38;
            int v40 = v38[1];
            if (v39 == v40) {
              uint64_t v41 = closure #1 in FlipBookStateHash.validateTransitionFunc()partial apply;
            }
            else {
              uint64_t v41 = closure #2 in FlipBookStateHash.validateTransitionFunc()partial apply;
            }
            uint64_t v42 = swift_allocObject();
            *(_WORD *)(v42 + 16) = v39;
            *(_WORD *)(v42 + 18) = v40;
            if (v35)
            {
              uint64_t v43 = *(unsigned int *)(v34 + 32);
              swift_bridgeObjectRetain_n();
              swift_retain();
              if (((uint64_t (*)(uint64_t))v41)(v43))
              {
LABEL_53:
                swift_release();
                swift_bridgeObjectRelease();
                swift_release();
                swift_bridgeObjectRelease_n();
                int64_t v47 = *(void *)(v36 + 16);
                if (v47)
                {
                  uint64_t v85 = MEMORY[0x263F8EE78];
                  swift_bridgeObjectRetain();
                  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v47, 0);
                  uint64_t v48 = v36;
                  uint64_t v49 = v82;
                  uint64_t v50 = 0;
                  uint64_t v51 = v85;
                  unint64_t v52 = *(void *)(v85 + 16);
                  do
                  {
                    if (*(unsigned __int16 *)(v48 + 2 * v50 + 32) - v49 >= 0) {
                      uint64_t v53 = *(unsigned __int16 *)(v48 + 2 * v50 + 32) - v49;
                    }
                    else {
                      uint64_t v53 = v49 - *(unsigned __int16 *)(v48 + 2 * v50 + 32);
                    }
                    unint64_t v54 = *(void *)(v85 + 24);
                    if (v52 >= v54 >> 1)
                    {
                      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v54 > 1), v52 + 1, 1);
                      uint64_t v48 = v81;
                      uint64_t v49 = v82;
                    }
                    ++v50;
                    *(void *)(v85 + 16) = v52 + 1;
                    *(void *)(v85 + 8 * v52++ + 32) = v53;
                  }
                  while (v47 != v50);
                  swift_bridgeObjectRelease_n();
                  swift_bridgeObjectRelease();
                }
                else
                {
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t v51 = MEMORY[0x263F8EE78];
                }
                unint64_t v61 = *(void *)(v51 + 16);
                if (!v61) {
                  goto LABEL_98;
                }
                unint64_t v62 = *(void *)(v51 + 32);
                unint64_t v63 = v61 - 1;
                if (v61 != 1)
                {
                  if (v61 >= 5)
                  {
                    unint64_t v64 = v63 & 0xFFFFFFFFFFFFFFFCLL | 1;
                    int64x2_t v65 = vdupq_n_s64(v62);
                    uint64_t v66 = (int64x2_t *)(v51 + 56);
                    unint64_t v67 = v63 & 0xFFFFFFFFFFFFFFFCLL;
                    int64x2_t v68 = v65;
                    do
                    {
                      int64x2_t v65 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v65, v66[-1]), (int8x16_t)v66[-1], (int8x16_t)v65);
                      int64x2_t v68 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v68, *v66), *(int8x16_t *)v66, (int8x16_t)v68);
                      v66 += 2;
                      v67 -= 4;
                    }
                    while (v67);
                    int8x16_t v69 = vbslq_s8((int8x16_t)vcgtq_s64(v68, v65), (int8x16_t)v65, (int8x16_t)v68);
                    uint64_t v70 = vextq_s8(v69, v69, 8uLL).u64[0];
                    unint64_t v62 = (unint64_t)vbsl_s8((int8x8_t)vcgtd_s64(v70, v69.i64[0]), *(int8x8_t *)v69.i8, (int8x8_t)v70);
                    if (v63 != (v63 & 0xFFFFFFFFFFFFFFFCLL)) {
                      goto LABEL_72;
                    }
                  }
                  else
                  {
                    unint64_t v64 = 1;
LABEL_72:
                    unint64_t v71 = v61 - v64;
                    os_signpost_id_t v72 = (int64_t *)(v51 + 8 * v64 + 32);
                    do
                    {
                      int64_t v74 = *v72++;
                      unint64_t v73 = v74;
                      if (v74 < (uint64_t)v62) {
                        unint64_t v62 = v73;
                      }
                      --v71;
                    }
                    while (v71);
                  }
                }
                swift_bridgeObjectRelease();
                if ((v62 & 0x8000000000000000) != 0 || v62 >= 0x10000) {
                  goto LABEL_99;
                }
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if (((a3 - v80) & 0xFFFF0000) != 0) {
                  goto LABEL_94;
                }
                if ((((unsigned __int16)(a3 - v80) + (unsigned __int16)v62) & 0x10000) == 0)
                {
                  if ((unsigned __int16)(a3 - v80 + v62) < 4u) {
                    return;
                  }
                  _StringGuts.grow(_:)(67);
                  v75._object = (void *)0x800000025B6A17B0;
                  v75._uint64_t countAndFlagsBits = 0xD000000000000014;
                  String.append(_:)(v75);
                  v76._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
                  String.append(_:)(v76);
                  swift_bridgeObjectRelease();
                  v77._uint64_t countAndFlagsBits = 15917;
                  v77._object = (void *)0xE200000000000000;
                  String.append(_:)(v77);
                  v78._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
                  String.append(_:)(v78);
                  swift_bridgeObjectRelease();
                  unint64_t v22 = 0xD000000000000029;
                  unsigned __int8 v23 = " for transition exceeds allowed threshold";
                  goto LABEL_82;
                }
                goto LABEL_95;
              }
              if (v35 != 1)
              {
                uint64_t v44 = 1;
                uint64_t v45 = v34 + 38;
                while (1)
                {
                  uint64_t v46 = v44 + 1;
                  if (__OFADD__(v44, 1)) {
                    break;
                  }
                  if (((uint64_t (*)(void))v41)(*(unsigned int *)(v45 - 2))) {
                    goto LABEL_53;
                  }
                  v45 += 4;
                  ++v44;
                  if (v46 == v35) {
                    goto LABEL_38;
                  }
                }
                __break(1u);
                goto LABEL_87;
              }
LABEL_38:
              swift_release();
              swift_bridgeObjectRelease();
              uint64_t v12 = v83;
              swift_release();
              swift_bridgeObjectRelease();
            }
            else
            {
              swift_release();
            }
            if (++v37 == v32)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              goto LABEL_63;
            }
          }
        }
        swift_bridgeObjectRetain();
LABEL_63:
        swift_bridgeObjectRelease();
        _StringGuts.grow(_:)(38);
        swift_bridgeObjectRelease();
        v55._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
        String.append(_:)(v55);
        swift_bridgeObjectRelease();
        v56._uint64_t countAndFlagsBits = 544175136;
        v56._object = (void *)0xE400000000000000;
        String.append(_:)(v56);
        v57._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
        String.append(_:)(v57);
        swift_bridgeObjectRelease();
        unint64_t v58 = 0x800000025B6A1790;
        lazy protocol witness table accessor for type SILError and conformance SILError();
        swift_allocError();
        *(void *)uint64_t v59 = 0xD00000000000001ELL;
        char v60 = 11;
LABEL_83:
        *(void *)(v59 + 8) = v58;
        *(unsigned char *)(v59 + 16) = v60;
        swift_willThrow();
        return;
      }
      goto LABEL_93;
    }
LABEL_92:
    __break(1u);
LABEL_93:
    __break(1u);
LABEL_94:
    __break(1u);
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  if (v4 < a3)
  {
    LOWORD(v16) = a3 - v4;
LABEL_22:
    if ((unsigned __int16)v16 < 4u) {
      return;
    }
    _StringGuts.grow(_:)(52);
    v18._object = (void *)0x800000025B6A17B0;
    v18._uint64_t countAndFlagsBits = 0xD000000000000014;
    String.append(_:)(v18);
    v19._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v19);
    swift_bridgeObjectRelease();
    v20._uint64_t countAndFlagsBits = 15917;
    v20._object = (void *)0xE200000000000000;
    String.append(_:)(v20);
    v21._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v21);
    swift_bridgeObjectRelease();
    unint64_t v22 = 0xD00000000000001ALL;
    unsigned __int8 v23 = " exceeds allowed threshold";
LABEL_82:
    unint64_t v79 = (unint64_t)(v23 - 32) | 0x8000000000000000;
    String.append(_:)(*(Swift::String *)&v22);
    unint64_t v58 = 0xE000000000000000;
    lazy protocol witness table accessor for type SILError and conformance SILError();
    swift_allocError();
    *(void *)uint64_t v59 = 0;
    char v60 = 9;
    goto LABEL_83;
  }
  if (((v15 - v4) & 0xFFFF0000) == 0)
  {
    int v16 = (unsigned __int16)(v15 - v4) + (unsigned __int16)(a3 - v11);
    if ((v16 & 0x10000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_97;
  }
LABEL_96:
  __break(1u);
LABEL_97:
  __break(1u);
LABEL_98:
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_99:
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t SILIndicatorValidator.validateCamMicSwap(now:state:newType:newFrame:opacity:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, float a5)
{
  __int16 v10 = *(void **)(a2 + 16);
  if (a5 < 0.4)
  {
    int v11 = 0;
    goto LABEL_7;
  }
  if (*(void *)((char *)v10 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_flipbook))
  {
    int v11 = *(unsigned __int8 *)(*(void *)((char *)v10 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_frames)
                             + 20 * (unsigned __int16)a4
                             + 16) ^ 1;
    goto LABEL_7;
  }
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v10) + 0xF0))();
  if (result)
  {
    int64_t v13 = (char *)*(id *)(result + 24);
    swift_release();
    unsigned int v14 = *(unsigned __int16 *)&v13[OBJC_IVAR____TtC10SILManager14SILConstraints_noticeableFrame];

    int v11 = v14 <= (unsigned __int16)a4;
LABEL_7:
    unsigned int v15 = specialized static SILValidator.frameSteady(_:_:_:)(v10, a4, a5);
    int v16 = *(unsigned __int16 *)(a2 + 80) | (*(unsigned __int8 *)(a2 + 82) << 16);
    if ((v16 & 0xFF0000) == 0x20000) {
      return a3;
    }
    uint64_t v52 = a3;
    unint64_t v17 = *(void *)(a2 + 64);
    uint64_t v18 = *(void *)(a2 + 72);
    if (v17 > a1)
    {
      if (a1 > *(void *)a2 && (double)((a1 - *(void *)a2) / 0xF4240) / 1000.0 > 0.5)
      {
        _StringGuts.grow(_:)(68);
        v19._uint64_t countAndFlagsBits = 0xD000000000000024;
        v19._object = (void *)0x800000025B6A18A0;
        String.append(_:)(v19);
        a3 = MEMORY[0x263F8E248];
        Double.write<A>(to:)();
        v20._uint64_t countAndFlagsBits = 0xD000000000000014;
        v20._object = (void *)0x800000025B6A18D0;
        String.append(_:)(v20);
        Double.write<A>(to:)();
        unint64_t v21 = 0x73646E6F63657320;
        unint64_t v22 = 0xE800000000000000;
LABEL_18:
        String.append(_:)(*(Swift::String *)&v21);
        lazy protocol witness table accessor for type SILError and conformance SILError();
        swift_allocError();
        *(void *)uint64_t v33 = 0;
        *(void *)(v33 + 8) = 0xE000000000000000;
        *(unsigned char *)(v33 + 16) = 9;
        swift_willThrow();
        return a3;
      }
      unsigned int v23 = *(unsigned __int16 *)(a2 + 80);
      if ((v16 & 0x10000) != 0)
      {
        if (v23 < (unsigned __int16)a4)
        {
          _StringGuts.grow(_:)(90);
          v24._object = (void *)0x800000025B6A1820;
          v24._uint64_t countAndFlagsBits = 0xD00000000000001ALL;
          String.append(_:)(v24);
          a3 = MEMORY[0x263F8E8D8];
          v25._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
          String.append(_:)(v25);
          swift_bridgeObjectRelease();
          v26._uint64_t countAndFlagsBits = 0x6620646C6F203E20;
          v26._object = (void *)0xED000020656D6172;
          String.append(_:)(v26);
          v27._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
          String.append(_:)(v27);
          swift_bridgeObjectRelease();
          unint64_t v21 = 0xD00000000000002FLL;
          unsigned int v28 = " after reaching noticeable state, and going out";
LABEL_17:
          unint64_t v22 = (unint64_t)(v28 - 32) | 0x8000000000000000;
          goto LABEL_18;
        }
      }
      else if (v23 > (unsigned __int16)a4)
      {
        _StringGuts.grow(_:)(76);
        v29._object = (void *)0x800000025B6A1820;
        v29._uint64_t countAndFlagsBits = 0xD00000000000001ALL;
        String.append(_:)(v29);
        a3 = MEMORY[0x263F8E8D8];
        v30._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
        String.append(_:)(v30);
        swift_bridgeObjectRelease();
        v31._uint64_t countAndFlagsBits = 0x6620646C6F203C20;
        v31._object = (void *)0xED000020656D6172;
        String.append(_:)(v31);
        v32._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
        String.append(_:)(v32);
        swift_bridgeObjectRelease();
        unint64_t v21 = 0xD000000000000021;
        unsigned int v28 = " before reaching noticeable state";
        goto LABEL_17;
      }
    }
    if (((v11 ^ (v17 == -1)) & 1) == 0)
    {
      uint64_t v34 = Log.unsafeMutableAddressor();
      swift_beginAccess();
      uint64_t v35 = *v34;
      swift_retain();
      _StringGuts.grow(_:)(28);
      uint64_t v36 = swift_bridgeObjectRelease();
      (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v10) + 0xA8))(v36);
      v37._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v37);
      swift_bridgeObjectRelease();
      v38._uint64_t countAndFlagsBits = 7563552;
      v38._object = (void *)0xE300000000000000;
      String.append(_:)(v38);
      if (v11) {
        uint64_t v39 = 0;
      }
      else {
        uint64_t v39 = 1414483488;
      }
      if (v11) {
        unint64_t v40 = 0xE000000000000000;
      }
      else {
        unint64_t v40 = 0xE400000000000000;
      }
      unint64_t v41 = v40;
      String.append(_:)(*(Swift::String *)&v39);
      swift_bridgeObjectRelease();
      v42._uint64_t countAndFlagsBits = 0x61656369746F6E20;
      v42._object = (void *)0xEB00000000656C62;
      String.append(_:)(v42);
      (*(void (**)(uint64_t, uint64_t, unint64_t))(*(void *)v35 + 152))(7, 0x6F74616369646E49, 0xEA00000000002072);
      swift_release();
      swift_bridgeObjectRelease();
    }
    if (((v15 ^ (v18 == -1)) & 1) == 0)
    {
      uint64_t v43 = Log.unsafeMutableAddressor();
      swift_beginAccess();
      uint64_t v44 = *v43;
      swift_retain();
      _StringGuts.grow(_:)(24);
      uint64_t v45 = swift_bridgeObjectRelease();
      (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v10) + 0xA8))(v45);
      v46._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v46);
      swift_bridgeObjectRelease();
      v47._uint64_t countAndFlagsBits = 7563552;
      v47._object = (void *)0xE300000000000000;
      String.append(_:)(v47);
      if (v15) {
        uint64_t v48 = 0;
      }
      else {
        uint64_t v48 = 1414483488;
      }
      if (v15) {
        unint64_t v49 = 0xE000000000000000;
      }
      else {
        unint64_t v49 = 0xE400000000000000;
      }
      unint64_t v50 = v49;
      String.append(_:)(*(Swift::String *)&v48);
      swift_bridgeObjectRelease();
      v51._uint64_t countAndFlagsBits = 0x79646165747320;
      v51._object = (void *)0xE700000000000000;
      String.append(_:)(v51);
      (*(void (**)(uint64_t, uint64_t, unint64_t))(*(void *)v44 + 152))(7, 0x6F74616369646E49, 0xEA00000000002072);
      swift_release();
      swift_bridgeObjectRelease();
    }
    return v52;
  }
  __break(1u);
  return result;
}

uint64_t SILIndicatorValidator.sensorTypeFrom(indicator:frame:)(uint64_t a1, unsigned __int16 a2)
{
  uint64_t v3 = *(void *)(a1 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_sensorCategory);
  uint64_t result = 0;
  switch(v3)
  {
    case 0:
      return result;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      uint64_t v9 = *(void *)(v2 + 16);
      unint64_t v10 = *(void *)(v9 + 16);
      if (!v10 || *(unsigned __int16 *)(v9 + 32) > a2)
      {
        uint64_t v11 = 0;
        goto LABEL_8;
      }
      if (v10 == 1)
      {
        uint64_t v11 = 1;
        goto LABEL_8;
      }
      unsigned int v14 = (unsigned __int16 *)(v9 + 64);
      uint64_t v11 = 1;
      break;
    default:
      uint64_t v5 = Log.unsafeMutableAddressor();
      swift_beginAccess();
      uint64_t v6 = *v5;
      swift_retain();
      _StringGuts.grow(_:)(25);
      swift_bridgeObjectRelease();
      v7._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v7);
      swift_bridgeObjectRelease();
      v8._uint64_t countAndFlagsBits = 2171168;
      v8._object = (void *)0xE300000000000000;
      String.append(_:)(v8);
      (*(void (**)(uint64_t, unint64_t, unint64_t))(*(void *)v6 + 144))(5, 0xD000000000000014, 0x800000025B6A18F0);
      swift_release();
      swift_bridgeObjectRelease();
      return 1;
  }
  do
  {
    unsigned int v15 = *v14;
    v14 += 16;
    if (v15 > a2) {
      goto LABEL_8;
    }
    uint64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    ++v11;
  }
  while (v16 != v10);
  uint64_t v11 = *(void *)(v9 + 16);
LABEL_8:
  BOOL v12 = __OFSUB__(v11, 1);
  unint64_t v13 = v11 - 1;
  if (v12) {
    goto LABEL_22;
  }
  if (v13 >= v10)
  {
LABEL_23:
    __break(1u);
    JUMPOUT(0x25B696D2CLL);
  }
  if (*(unsigned char *)(v9 + 32 * v13 + 56)) {
    return 4;
  }
  else {
    return 3;
  }
}

uint64_t SILIndicatorValidator.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t SILValidator.statePerRegion.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SILValidator.statePerRegion.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 24) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t SILRenderer.Region.pageContents.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SILRenderer.Region.pageContents.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 32) = a1;
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall SILValidator.turnOffRegions(regionMask:)(Swift::Int32 regionMask)
{
  if (regionMask >= 1)
  {
    Swift::Int32 v2 = regionMask;
    uint64_t v3 = *(uint64_t (**)(unsigned char *))(*(void *)v1 + 144);
    while (1)
    {
      unint64_t v4 = __clz(__rbit32(v2));
      int v5 = v4 >= 0x20 ? -1 : (-1 << v4) - 1;
      uint64_t v6 = (void (*)(unsigned char *, void))v3(v13);
      Swift::String v8 = v7;
      uint64_t v9 = *v7;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      void *v8 = v9;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew()(v9);
        void *v8 = v9;
      }
      if (v9[2] <= v4) {
        break;
      }
      uint64_t v11 = &v9[11 * v4];
      BOOL v12 = (void *)v11[6];
      v2 &= v5;
      *((_OWORD *)v11 + 4) = 0u;
      *((_OWORD *)v11 + 5) = 0u;
      *((_OWORD *)v11 + 6) = 0u;
      *(_DWORD *)((char *)v11 + 111) = 0;
      *((_OWORD *)v11 + 2) = 0u;
      *((_OWORD *)v11 + 3) = 0u;

      v6(v13, 0);
      if (v2 <= 0) {
        return;
      }
    }
    __break(1u);
  }
}

Swift::Void __swiftcall SILValidator.swapEnd()()
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 128))();
  (*(void (**)(uint64_t))(*(void *)v0 + 112))(v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SILValidator.State?);
  uint64_t v2 = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(void *)(v2 + 16) = 4;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 96) = 0u;
  *(_DWORD *)(v2 + 111) = 0;
  *(_OWORD *)(v2 + 120) = 0u;
  *(_OWORD *)(v2 + 136) = 0u;
  *(_OWORD *)(v2 + 152) = 0u;
  *(_OWORD *)(v2 + 168) = 0u;
  *(_OWORD *)(v2 + 184) = 0u;
  *(_DWORD *)(v2 + 199) = 0;
  *(_OWORD *)(v2 + 224) = 0u;
  *(_OWORD *)(v2 + 240) = 0u;
  *(_OWORD *)(v2 + 256) = 0u;
  *(_OWORD *)(v2 + 272) = 0u;
  *(_OWORD *)(v2 + 208) = 0u;
  *(_DWORD *)(v2 + 287) = 0;
  *(_DWORD *)(v2 + 375) = 0;
  *(_OWORD *)(v2 + 344) = 0u;
  *(_OWORD *)(v2 + 360) = 0u;
  *(_OWORD *)(v2 + 312) = 0u;
  *(_OWORD *)(v2 + 328) = 0u;
  *(_OWORD *)(v2 + 296) = 0u;
  uint64_t v3 = *(void (**)(void))(*(void *)v0 + 136);
  v3();
}

void SILValidator.validateSwap(now:regionId:indicator:center:frameNumber:opacity:)(unint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X2>, unsigned int a4@<W3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>, float a8@<S2>)
{
  Swift::Int v144 = *(uint64_t (**)(void))(*(void *)v8 + 104);
  uint64_t v20 = v144();
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  if (*(void *)(v20 + 16) <= a2) {
    goto LABEL_61;
  }
  unsigned int v150 = a4;
  uint64_t v141 = a5;
  unint64_t v147 = a2;
  uint64_t v21 = v20 + 88 * a2;
  unint64_t v22 = *(void **)(v21 + 48);
  uint64_t v133 = *(void *)(v21 + 40);
  uint64_t v136 = *(void *)(v21 + 32);
  uint64_t v23 = *(void *)(v21 + 64);
  uint64_t v24 = *(void *)(v21 + 72);
  uint64_t v25 = *(void *)(v21 + 80);
  unint64_t v26 = *(void *)(v21 + 96);
  uint64_t v137 = *(void *)(v21 + 104);
  uint64_t v140 = *(void *)(v21 + 88);
  int v27 = *(unsigned __int16 *)(v21 + 112) | (*(unsigned __int8 *)(v21 + 114) << 16);
  char v28 = *(unsigned char *)(v21 + 56);
  id v29 = v22;
  uint64_t v30 = swift_bridgeObjectRelease();
  uint64_t v149 = a1;
  Swift::Int v151 = a3;
  __int16 v130 = v25;
  if (!v22)
  {
    if (a8 <= 0.01) {
      goto LABEL_20;
    }
    goto LABEL_11;
  }
  if ((v27 & 0xFF0000) == 0x20000 || a1 <= v26)
  {
    if (a8 <= 0.01) {
      goto LABEL_16;
    }
LABEL_11:
    BOOL v32 = 0;
    goto LABEL_13;
  }
  BOOL v32 = (double)((a1 - v26) / 0xF4240) / 1000.0 > 3.0;
  if (a8 <= 0.01) {
    goto LABEL_16;
  }
LABEL_13:
  uint64_t v127 = v29;
  LODWORD(v10) = *(_DWORD *)(v152 + 16);
  LODWORD(v11) = *(_DWORD *)(v152 + 20);
  uint64_t v33 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *a3) + 0xF0))(v30);
  if (!v33)
  {
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  double v34 = a6 / (double)v10;
  double v35 = a7 / (double)v11;
  uint64_t v36 = (char *)*(id *)(v33 + 24);
  swift_release();
  uint64_t v37 = *(void *)&v36[OBJC_IVAR____TtC10SILManager14SILConstraints_boundingBoxes];
  swift_retain();

  Swift::String v38 = *(uint64_t (**)(BOOL, double, double))(*(void *)v37 + 104);
  if ((v38(v32, v34, v35) & 1) == 0)
  {
    if (v32
      || (char v56 = default argument 1 of SILBoundingBoxes.isPositionValid(position:includeDynamicBoundingBoxes:)(),
          (v38(v56 & 1, v34, v35) & 1) == 0))
    {
      v61._uint64_t countAndFlagsBits = 0x203A7265746E6563;
      v61._object = (void *)0xE800000000000000;
      String.append(_:)(v61);
      type metadata accessor for CGPoint(0);
      _print_unlocked<A, B>(_:_:)();
      lazy protocol witness table accessor for type SILError and conformance SILError();
      swift_allocError();
      *(void *)uint64_t v62 = 0;
      *(void *)(v62 + 8) = 0xE000000000000000;
      *(unsigned char *)(v62 + 16) = 8;
      swift_willThrow();
    }
    else
    {
      _StringGuts.grow(_:)(65);
      v57._uint64_t countAndFlagsBits = 0xD00000000000002CLL;
      v57._object = (void *)0x800000025B6A1910;
      String.append(_:)(v57);
      type metadata accessor for CGPoint(0);
      _print_unlocked<A, B>(_:_:)();
      v58._object = (void *)0x800000025B6A1940;
      v58._uint64_t countAndFlagsBits = 0xD000000000000010;
      String.append(_:)(v58);
      if (!v22)
      {
LABEL_71:
        __break(1u);
        goto LABEL_72;
      }
      if ((v27 & 0xFF0000) == 0x20000)
      {
LABEL_72:
        __break(1u);
        goto LABEL_73;
      }
      if (a1 < v26) {
        goto LABEL_64;
      }
      Double.write<A>(to:)();
      v59._uint64_t countAndFlagsBits = 115;
      v59._object = (void *)0xE100000000000000;
      String.append(_:)(v59);
      lazy protocol witness table accessor for type SILError and conformance SILError();
      swift_allocError();
      *(void *)uint64_t v60 = 0;
      *(void *)(v60 + 8) = 0xE000000000000000;
      *(unsigned char *)(v60 + 16) = 12;
      swift_willThrow();
    }
    swift_release();
    return;
  }
  swift_release();
  a3 = v151;
  id v29 = v127;
  if (!v22)
  {
LABEL_20:
    specialized SILValidator.State.init(now:indicator:center:frameNumber:opacity:)(a1, a3, v150, (uint64_t)v155, a6, a7, a8);
    uint64_t v47 = v155[0];
    uint64_t v48 = v155[1];
    unint64_t v49 = (void *)v155[2];
    char v50 = v156;
    a6 = v157;
    a7 = v158;
    __int16 v51 = v159;
    LOWORD(v44) = v160;
    a8 = v161;
    uint64_t v52 = v162;
    uint64_t v53 = v163;
    int v46 = v165 | (v166 << 16);
    uint64_t v54 = v164;
    uint64_t v55 = v141;
LABEL_53:
    *(void *)uint64_t v55 = v47;
    *(void *)(v55 + 8) = v48;
    *(void *)(v55 + 16) = v49;
    *(unsigned char *)(v55 + 24) = v50;
    *(double *)(v55 + 32) = a6;
    *(double *)(v55 + 40) = a7;
    *(_WORD *)(v55 + 48) = v51;
    *(_WORD *)(v55 + 50) = v44;
    *(float *)(v55 + 52) = a8;
    *(void *)(v55 + 56) = v52;
    *(void *)(v55 + 64) = v53;
    *(void *)(v55 + 72) = v54;
    *(unsigned char *)(v55 + 82) = BYTE2(v46);
    *(_WORD *)(v55 + 80) = v46;
    return;
  }
LABEL_16:
  v189[0] = v136;
  v189[1] = v133;
  v189[2] = v29;
  char v190 = v28;
  uint64_t v191 = v23;
  uint64_t v192 = v24;
  uint64_t v193 = v25;
  uint64_t v194 = v140;
  unint64_t v195 = v26;
  uint64_t v196 = v137;
  __int16 v197 = v27;
  char v198 = BYTE2(v27);
  uint64_t v39 = *(void *)((char *)a3 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_flipbook);
  unint64_t v40 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *a3) + 0xF0);
  unint64_t v41 = v29;
  uint64_t v42 = v40();
  uint64_t v43 = v42;
  uint64_t v126 = v39;
  if (v39)
  {
    uint64_t v44 = v150;
    if (!v42)
    {
LABEL_67:
      __break(1u);
      goto LABEL_68;
    }
    (*(void (**)(unint64_t, void *, void))(*(void *)v42 + 120))(a1, v189, v150);
    uint64_t v45 = v9;
    if (!v9)
    {
      swift_release();
      uint64_t v153 = 0;
      uint64_t v142 = 0;
      uint64_t v145 = 0;
      int v46 = 0x20000;
      goto LABEL_48;
    }
  }
  else
  {
    uint64_t v44 = v150;
    if (!v42)
    {
LABEL_69:
      __break(1u);
LABEL_70:
      __break(1u);
      goto LABEL_71;
    }
    uint64_t v63 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v151) + 0xA8))();
    uint64_t v64 = (*(uint64_t (**)(unint64_t, void *, uint64_t, void, float))(*(void *)v43 + 128))(a1, v189, v63, v150, a8);
    uint64_t v45 = v9;
    if (!v9)
    {
      int v98 = v67;
      uint64_t v142 = v66;
      uint64_t v145 = v65;
      uint64_t v153 = v64;
      swift_release();
      int v46 = v98 & 0x1FFFF;
LABEL_48:
      uint64_t v99 = v151;
      unsigned __int8 v100 = specialized static SILValidator.frameSteady(_:_:_:)(v99, v44, a8);
      uint64_t v101 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v99) + 0xF0);
      unint64_t v49 = v99;
      uint64_t v102 = v101();
      if (v102)
      {
        if (v100) {
          uint64_t v48 = -1;
        }
        else {
          uint64_t v48 = 32000000;
        }
        char v50 = (*(uint64_t (**)(void *, uint64_t))(*(void *)v102 + 136))(v49, v44);
        swift_release();

        uint64_t v47 = v149;
        uint64_t v55 = v141;
        uint64_t v54 = v142;
        uint64_t v52 = v153;
        uint64_t v53 = v145;
        __int16 v51 = v130;
        goto LABEL_53;
      }
      goto LABEL_70;
    }
  }
  swift_release();

  int64x2_t v68 = (void *)MEMORY[0x263F8EED0];
  int8x16_t v69 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v41) + 0xA8);
  uint64_t v70 = v41;
  uint64_t v71 = v69();

  uint64_t v125 = *(uint64_t (**)(void))((*v68 & *v151) + 0xA8);
  if (v71 == v125()
    || (uint64_t v123 = (void (*)(void))v69,
        id v124 = v70,
        id v148 = v45,
        uint64_t v72 = *(void *)(v144() + 16),
        uint64_t v73 = swift_bridgeObjectRelease(),
        !v72))
  {
LABEL_32:
    swift_willThrow();

    return;
  }
  unint64_t v74 = 0;
  uint64_t v75 = 112;
  while (1)
  {
    if (v147 != v74)
    {
      uint64_t v76 = ((uint64_t (*)(uint64_t))v144)(v73);
      if (v74 >= *(void *)(v76 + 16)) {
        goto LABEL_62;
      }
      uint64_t v77 = *(void *)(v76 + v75 - 64);
      uint64_t v73 = swift_bridgeObjectRelease();
      if (v77) {
        break;
      }
    }
    ++v74;
    v75 += 88;
    if (v72 == v74) {
      goto LABEL_32;
    }
  }
  uint64_t v78 = ((uint64_t (*)(uint64_t))v144)(v73);
  if (v74 >= *(void *)(v78 + 16)) {
    goto LABEL_63;
  }
  uint64_t v80 = *(void *)(v78 + v75 - 80);
  uint64_t v79 = *(void *)(v78 + v75 - 72);
  uint64_t v81 = *(void *)(v78 + v75 - 56);
  uint64_t v138 = *(void **)(v78 + v75 - 64);
  uint64_t v82 = *(void *)(v78 + v75 - 48);
  uint64_t v83 = *(void *)(v78 + v75 - 40);
  uint64_t v84 = *(void *)(v78 + v75 - 32);
  uint64_t v131 = *(void *)(v78 + v75 - 16);
  uint64_t v134 = *(void *)(v78 + v75 - 24);
  uint64_t v128 = *(void *)(v78 + v75 - 8);
  int v85 = *(unsigned __int8 *)(v78 + v75 + 2);
  int v86 = *(unsigned __int16 *)(v78 + v75);
  id v87 = v138;
  swift_bridgeObjectRelease();
  if (!v138)
  {
    specialized SILValidator.State.init(now:indicator:center:frameNumber:opacity:)(v149, v151, v150, (uint64_t)v167, a6, a7, a8);
    uint64_t v149 = v167[0];
    unint64_t v49 = (void *)v167[2];
    uint64_t v135 = v167[1];
    char v132 = v168;
    a6 = v169;
    a7 = v170;
    __int16 v129 = v171;
    LOWORD(v150) = v172;
    a8 = v173;
    uint64_t v154 = v174;
    int v139 = v177 | (v178 << 16);
    uint64_t v143 = v176;
    uint64_t v146 = v175;
    unsigned __int8 v103 = v124;
LABEL_59:
    uint64_t v111 = Log.unsafeMutableAddressor();
    swift_beginAccess();
    uint64_t v112 = *v111;
    swift_retain();
    _StringGuts.grow(_:)(126);
    v113._uint64_t countAndFlagsBits = 0xD000000000000029;
    v113._object = (void *)0x800000025B6A1960;
    String.append(_:)(v113);
    v114._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v114);
    swift_bridgeObjectRelease();
    v115._object = (void *)0x800000025B6A15A0;
    v115._uint64_t countAndFlagsBits = 0xD000000000000010;
    String.append(_:)(v115);
    id v116 = v103;
    v123();

    v117._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v117);
    swift_bridgeObjectRelease();
    v118._uint64_t countAndFlagsBits = 0xD000000000000022;
    v118._object = (void *)0x800000025B6A1990;
    String.append(_:)(v118);
    v125();
    v119._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v119);
    swift_bridgeObjectRelease();
    v120._uint64_t countAndFlagsBits = 0x657220747562202CLL;
    v120._object = (void *)0xED0000206E6F6967;
    String.append(_:)(v120);
    v121._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v121);
    swift_bridgeObjectRelease();
    v122._uint64_t countAndFlagsBits = 0x6574706563636120;
    v122._object = (void *)0xEE00706177732064;
    String.append(_:)(v122);
    (*(void (**)(uint64_t, void, unint64_t))(*(void *)v112 + 152))(4, 0, 0xE000000000000000);

    swift_release();
    swift_bridgeObjectRelease();
    __int16 v51 = v129;
    uint64_t v55 = v141;
    uint64_t v47 = v149;
    LOWORD(v44) = v150;
    uint64_t v52 = v154;
    uint64_t v54 = v143;
    uint64_t v53 = v146;
    int v46 = v139;
    uint64_t v48 = v135;
    char v50 = v132;
    goto LABEL_53;
  }
  v179[0] = v80;
  v179[1] = v79;
  v179[2] = v87;
  char v180 = v81;
  uint64_t v181 = v82;
  uint64_t v182 = v83;
  uint64_t v183 = v84;
  uint64_t v184 = v134;
  uint64_t v185 = v131;
  uint64_t v186 = v128;
  __int16 v187 = v86;
  char v188 = (v86 | (v85 << 16)) >> 16;
  uint64_t v88 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v151) + 0xF0);
  id v89 = v87;
  uint64_t v90 = v88();
  uint64_t v91 = v90;
  if (v126)
  {
    if (v90)
    {
      (*(void (**)(uint64_t, void *, void))(*(void *)v90 + 120))(v149, v179, v150);
      __int16 v104 = v84;
      swift_release();
      uint64_t v154 = 0;
      uint64_t v143 = 0;
      uint64_t v146 = 0;
      int v105 = 0x20000;
      goto LABEL_55;
    }
    goto LABEL_66;
  }
  if (!v90)
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  uint64_t v92 = v125();
  uint64_t v93 = (*(uint64_t (**)(uint64_t, void *, uint64_t, void, float))(*(void *)v91 + 128))(v149, v179, v92, v150, a8);
  int v95 = v94;
  __int16 v104 = v84;
  uint64_t v143 = v97;
  uint64_t v146 = v96;
  uint64_t v154 = v93;
  swift_release();
  int v105 = v95 & 0x1FFFF;
LABEL_55:
  int v139 = v105;
  unint64_t v106 = v151;
  unsigned __int8 v107 = specialized static SILValidator.frameSteady(_:_:_:)(v106, v150, a8);
  int v108 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v106) + 0xF0);
  unint64_t v49 = v106;
  uint64_t v109 = v108();
  if (v109)
  {
    uint64_t v110 = 32000000;
    if (v107) {
      uint64_t v110 = -1;
    }
    uint64_t v135 = v110;
    char v132 = (*(uint64_t (**)(void *, void))(*(void *)v109 + 136))(v49, v150);
    swift_release();

    unsigned __int8 v103 = v124;
    __int16 v129 = v104;
    goto LABEL_59;
  }
LABEL_73:
  __break(1u);
}

uint64_t SILValidator.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(unsigned int a1)
{
  uint64_t v3 = MEMORY[0x261165D10](*(void *)(v1 + 40), a1, 4);
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v3);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

void *specialized _ArrayBuffer._consumeAndCreateNew()(void *a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

size_t specialized _copyCollectionToContiguousArray<A>(_:)(size_t result, unint64_t a2)
{
  if (!result) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v3 = (const void *)result;
  int64_t v4 = a2 - result;
  if (a2 == result) {
    return MEMORY[0x263F8EE78];
  }
  if (v4 < 1)
  {
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
    if (!a2) {
      goto LABEL_13;
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v5 = (void *)swift_allocObject();
    unint64_t result = _swift_stdlib_malloc_size(v5);
    uint64_t v5[2] = v4;
    void v5[3] = 2 * result - 64;
    if (!a2) {
      goto LABEL_13;
    }
  }
  if ((unint64_t)v3 < a2)
  {
    if ((v4 & 0x8000000000000000) == 0)
    {
      memmove(v5 + 4, v3, v4);
      return (size_t)v5;
    }
    __break(1u);
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t specialized SILError.log()(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  switch(a3)
  {
    case 1u:
    case 4u:
    case 5u:
      goto LABEL_6;
    case 2u:
      unint64_t v10 = Log.unsafeMutableAddressor();
      swift_beginAccess();
      uint64_t v11 = *v10;
      swift_retain();
      outlined copy of SILError(a1, a2, 2u);
      uint64_t v12 = String.init<A>(describing:)();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v11 + 144))(2, v12, v13);
      break;
    case 3u:
      unsigned int v14 = Log.unsafeMutableAddressor();
      swift_beginAccess();
      uint64_t v15 = *v14;
      outlined copy of SILError(a1, a2, 3u);
      swift_retain();
      uint64_t v16 = String.init<A>(describing:)();
      (*(void (**)(void, uint64_t, uint64_t))(*(void *)v15 + 144))(0, v16, v17);
      break;
    case 6u:
    case 7u:
    case 8u:
    case 9u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
      uint64_t v6 = Log.unsafeMutableAddressor();
      swift_beginAccess();
      uint64_t v7 = *v6;
      outlined copy of SILError(a1, a2, a3);
      swift_retain();
      uint64_t v8 = String.init<A>(describing:)();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 144))(7, v8, v9);
      break;
    case 0xEu:
      if (!(a1 | a2)) {
        goto LABEL_7;
      }
LABEL_6:
      uint64_t v18 = Log.unsafeMutableAddressor();
      swift_beginAccess();
      uint64_t v19 = *v18;
      outlined copy of SILError(a1, a2, a3);
      swift_retain();
      uint64_t v20 = String.init<A>(describing:)();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v19 + 144))(4, v20, v21);
      break;
    default:
LABEL_7:
      unint64_t v22 = Log.unsafeMutableAddressor();
      swift_beginAccess();
      uint64_t v23 = *v22;
      outlined copy of SILError(a1, a2, a3);
      swift_retain();
      uint64_t v24 = String.init<A>(describing:)();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v23 + 144))(5, v24, v25);
      break;
  }
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t outlined copy of SILError(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 0xDu) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t outlined consume of SILError(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 0xDu) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<UInt32, PixelFormatInfo>);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  unsigned int v4 = *(_DWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v4);
  if (v8)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  uint64_t v9 = (void *)(a1 + 72);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_DWORD *)(v3[6] + 4 * result) = v4;
    unint64_t v10 = (void *)(v3[7] + 16 * result);
    *unint64_t v10 = v6;
    v10[1] = v5;
    uint64_t v11 = v3[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    v3[2] = v13;
    if (!--v1) {
      goto LABEL_8;
    }
    unsigned int v14 = v9 + 3;
    unsigned int v4 = *((_DWORD *)v9 - 4);
    uint64_t v6 = *(v9 - 1);
    uint64_t v15 = *v9;
    swift_bridgeObjectRetain();
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v4);
    uint64_t v9 = v14;
    uint64_t v5 = v15;
    if (v16) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t specialized SensorType.init(rawValue:)(uint64_t result)
{
  if (result >= 5u) {
    return 5;
  }
  else {
    return result;
  }
}

uint64_t outlined init with copy of SILBackend?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SILBackend?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined copy of (id: UInt64, synchronous: Bool, signpost: OSSignpostIntervalState?)?(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1) {
    return swift_retain();
  }
  return result;
}

uint64_t outlined consume of (id: UInt64, synchronous: Bool, signpost: OSSignpostIntervalState?)?(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1) {
    return swift_release();
  }
  return result;
}

uint64_t type metadata accessor for SILRenderer()
{
  return self;
}

uint64_t type metadata accessor for SILValidator()
{
  return self;
}

uint64_t type metadata accessor for SILRenderer.Region()
{
  return self;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IOSurfaceLike);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 88 * a1 + 32;
    unint64_t v6 = a3 + 88 * v4;
    if (v5 >= v6 || v5 + 88 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SILValidator.State?);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id *specialized static SILValidator.frameSteady(_:_:_:)(void *a1, uint64_t a2, float a3)
{
  if (a3 < 0.4) {
    return 0;
  }
  uint64_t v5 = *(void *)((char *)a1 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_flipbook);
  unint64_t v6 = (void *)MEMORY[0x263F8EED0];
  uint64_t v7 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *a1) + 0xF0);
  uint64_t result = (id *)v7();
  if (v5)
  {
    if (result)
    {
      char v8 = (*((uint64_t (**)(uint64_t))*result + 14))(a2);
      swift_release();
      return (id *)(v8 & 1);
    }
    __break(1u);
    goto LABEL_11;
  }
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v9 = result[3];
  uint64_t v10 = swift_release();
  unsigned __int16 v11 = (*(uint64_t (**)(uint64_t))((*v6 & *v9) + 0x90))(v10);

  if (v11 > (unsigned __int16)a2) {
    return 0;
  }
  uint64_t result = (id *)v7();
  if (result)
  {
    BOOL v12 = result[3];
    uint64_t v13 = swift_release();
    unsigned int v14 = (*(uint64_t (**)(uint64_t))((*v6 & *v12) + 0x90))(v13);

    return (id *)(HIWORD(v14) >= (unsigned __int16)a2);
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t specialized static SILValidator.frameNoticeable(_:_:_:)(void *a1, unsigned __int16 a2, float a3)
{
  if (a3 < 0.4)
  {
    char v3 = 0;
    return v3 & 1;
  }
  if (*(void *)((char *)a1 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_flipbook))
  {
    char v3 = *(unsigned char *)(*(void *)((char *)a1 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_frames) + 20 * a2 + 16) ^ 1;
    return v3 & 1;
  }
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *a1) + 0xF0))();
  if (result)
  {
    unint64_t v6 = (char *)*(id *)(result + 24);
    swift_release();
    unsigned int v7 = *(unsigned __int16 *)&v6[OBJC_IVAR____TtC10SILManager14SILConstraints_noticeableFrame];

    char v3 = v7 <= a2;
    return v3 & 1;
  }
  __break(1u);
  return result;
}

void specialized SILValidator.State.init(now:indicator:center:frameNumber:opacity:)(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, float a7@<S2>)
{
  uint64_t v13 = a2;
  unsigned __int8 v14 = specialized static SILValidator.frameSteady(_:_:_:)(v13, a3, a7);
  uint64_t v15 = (void *)MEMORY[0x263F8EED0];
  if (*(void *)((char *)v13 + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_flipbook))
  {
    uint64_t v37 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    int v18 = 0x20000;
  }
  else
  {
    char v19 = specialized static SILValidator.frameNoticeable(_:_:_:)(v13, a3, a7);
    if (v19) {
      uint64_t v20 = a1;
    }
    else {
      uint64_t v20 = -1;
    }
    uint64_t v21 = *(uint64_t (**)(void))((*v15 & *v13) + 0xA8);
    uint64_t v36 = v20;
    uint64_t v37 = v21();
    if (v19)
    {
      unint64_t v22 = Log.unsafeMutableAddressor();
      swift_beginAccess();
      uint64_t v23 = *v22;
      swift_retain();
      _StringGuts.grow(_:)(26);
      uint64_t v24 = swift_bridgeObjectRelease();
      ((void (*)(uint64_t))v21)(v24);
      v25._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v25);
      swift_bridgeObjectRelease();
      v26._uint64_t countAndFlagsBits = 0x69746F6E20736920;
      v26._object = (void *)0xEE00656C62616563;
      String.append(_:)(v26);
      (*(void (**)(uint64_t, uint64_t, unint64_t))(*(void *)v23 + 152))(7, 0x6F74616369646E49, 0xEA00000000002072);
      swift_release();
      swift_bridgeObjectRelease();
      int v27 = 0x10000;
    }
    else
    {
      int v27 = 0;
    }
    int v18 = v27 | (unsigned __int16)a3;
    if (v14)
    {
      char v28 = Log.unsafeMutableAddressor();
      swift_beginAccess();
      uint64_t v29 = *v28;
      swift_retain();
      _StringGuts.grow(_:)(22);
      uint64_t v30 = swift_bridgeObjectRelease();
      ((void (*)(uint64_t))v21)(v30);
      v31._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v31);
      swift_bridgeObjectRelease();
      v32._uint64_t countAndFlagsBits = 0x6165747320736920;
      v32._object = (void *)0xEA00000000007964;
      String.append(_:)(v32);
      (*(void (**)(uint64_t, uint64_t, unint64_t))(*(void *)v29 + 152))(7, 0x6F74616369646E49, 0xEA00000000002072);
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v17 = a1;
    }
    else
    {
      uint64_t v17 = -1;
    }
    uint64_t v16 = v36;
    uint64_t v15 = (void *)MEMORY[0x263F8EED0];
  }
  uint64_t v33 = (*(uint64_t (**)(void))((*v15 & *v13) + 0xF0))();
  if (v33)
  {
    if (v14) {
      uint64_t v34 = -1;
    }
    else {
      uint64_t v34 = 32000000;
    }
    char v35 = (*(uint64_t (**)(void *, uint64_t))(*(void *)v33 + 136))(v13, a3);
    swift_release();

    *(void *)a4 = a1;
    *(void *)(a4 + 8) = v34;
    *(void *)(a4 + 16) = v13;
    *(unsigned char *)(a4 + 24) = v35;
    *(double *)(a4 + 32) = a5;
    *(double *)(a4 + 40) = a6;
    *(_WORD *)(a4 + 48) = 0;
    *(_WORD *)(a4 + 50) = a3;
    *(float *)(a4 + 52) = a7;
    *(void *)(a4 + 56) = v37;
    *(void *)(a4 + 64) = v16;
    *(void *)(a4 + 72) = v17;
    *(unsigned char *)(a4 + 82) = BYTE2(v18);
    *(_WORD *)(a4 + 80) = v18;
  }
  else
  {
    __break(1u);
  }
}

uint64_t outlined destroy of SILBackend?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

BOOL partial apply for closure #1 in FlipBookStateHash.validateTransitionFunc()(unsigned __int16 a1)
{
  return *(unsigned __int16 *)(v1 + 16) == a1;
}

uint64_t sub_25B6992C0()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

BOOL partial apply for closure #2 in FlipBookStateHash.validateTransitionFunc()(unsigned int a1)
{
  int v2 = *(unsigned __int16 *)(v1 + 18);
  if (v2 != HIWORD(a1)) {
    return 0;
  }
  return v2 == (unsigned __int16)a1 || *(unsigned __int16 *)(v1 + 16) == (unsigned __int16)a1;
}

uint64_t sub_25B699300()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

unint64_t lazy protocol witness table accessor for type SwapWaitType and conformance SwapWaitType()
{
  unint64_t result = lazy protocol witness table cache variable for type SwapWaitType and conformance SwapWaitType;
  if (!lazy protocol witness table cache variable for type SwapWaitType and conformance SwapWaitType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SwapWaitType and conformance SwapWaitType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SensorType and conformance SensorType()
{
  unint64_t result = lazy protocol witness table cache variable for type SensorType and conformance SensorType;
  if (!lazy protocol witness table cache variable for type SensorType and conformance SensorType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SensorType and conformance SensorType);
  }
  return result;
}

uint64_t destroy for SILError(uint64_t a1)
{
  return outlined consume of SILError(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t initializeBufferWithCopyOfBuffer for SILError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  outlined copy of SILError(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SILError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  outlined copy of SILError(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  outlined consume of SILError(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SILError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  outlined consume of SILError(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SILError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF2 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 242);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 0xE) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SILError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF1)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 242;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xF2) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF2) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for SILError(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 0xDu) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 14);
  }
}

uint64_t destructiveInjectEnumTag for SILError(uint64_t result, unsigned int a2)
{
  if (a2 >= 0xE)
  {
    *(void *)__n128 result = a2 - 14;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 14;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SILError()
{
  return &type metadata for SILError;
}

void *initializeBufferWithCopyOfBuffer for PixelFormatInfo(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PixelFormatInfo()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for PixelFormatInfo(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for PixelFormatInfo(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PixelFormatInfo(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PixelFormatInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PixelFormatInfo()
{
  return &type metadata for PixelFormatInfo;
}

uint64_t getEnumTagSinglePayload for SwapWaitType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SwapWaitType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *__n128 result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25B699840);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SwapWaitType()
{
  return &type metadata for SwapWaitType;
}

unsigned char *storeEnumTagSinglePayload for SensorType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *__n128 result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25B699944);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SensorType()
{
  return &type metadata for SensorType;
}

ValueMetadata *type metadata accessor for SILRenderer.Region.PageContent()
{
  return &type metadata for SILRenderer.Region.PageContent;
}

_DWORD *__swift_memcpy4_2(_DWORD *result, _DWORD *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FlipBookStateHash(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for FlipBookStateHash(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)__n128 result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 4) = v3;
  return result;
}

ValueMetadata *type metadata accessor for FlipBookStateHash()
{
  return &type metadata for FlipBookStateHash;
}

uint64_t type metadata accessor for SILIndicatorValidator()
{
  return self;
}

uint64_t destroy for SILIndicatorValidator.StateInfo()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SILIndicatorValidator.StateInfo(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SILIndicatorValidator.StateInfo(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SILIndicatorValidator.StateInfo(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for SILIndicatorValidator.StateInfo(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 25)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SILIndicatorValidator.StateInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SILIndicatorValidator.StateInfo()
{
  return &type metadata for SILIndicatorValidator.StateInfo;
}

void destroy for SILValidator.State(uint64_t a1)
{
}

uint64_t initializeWithCopy for SILValidator.State(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  int v4 = *(_DWORD *)(a2 + 52);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 52) = v4;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 67) = *(_OWORD *)(a2 + 67);
  id v5 = v3;
  return a1;
}

uint64_t assignWithCopy for SILValidator.State(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  int v4 = *(void **)(a2 + 16);
  id v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  id v6 = v4;

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(_WORD *)(a1 + 50) = *(_WORD *)(a2 + 50);
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  long long v7 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 67) = *(_OWORD *)(a2 + 67);
  *(_OWORD *)(a1 + 56) = v7;
  return a1;
}

__n128 __swift_memcpy83_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_DWORD *)(a1 + 79) = *(_DWORD *)(a2 + 79);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for SILValidator.State(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 67) = *(_OWORD *)(a2 + 67);
  return a1;
}

uint64_t getEnumTagSinglePayload for SILValidator.State(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 83)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SILValidator.State(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 82) = 0;
    *(_WORD *)(result + 80) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 83) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 83) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SILValidator.State()
{
  return &type metadata for SILValidator.State;
}

__n128 __swift_memcpy27_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 11) = *(_OWORD *)(a2 + 11);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SILValidator.State.CamMicState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 27)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 26);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SILValidator.State.CamMicState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 26) = 0;
    *(_WORD *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 27) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 27) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 26) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SILValidator.State.CamMicState()
{
  return &type metadata for SILValidator.State.CamMicState;
}

char *specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    int v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    long long v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  __n128 result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t SILManager.Service.__allocating_init(endpoint:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TightbeamEndpoint();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  int v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  type metadata accessor for ClientConnection();
  swift_allocObject();
  uint64_t v7 = ClientConnection.init(endpoint:)();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  *(void *)(v6 + 16) = v7;
  return v6;
}

uint64_t SILManager.Service.__allocating_init(connection:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t SILManager.Service.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t protocol witness for TightbeamServiceInitProtocol.init(endpoint:) in conformance SILManager.Service@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for TightbeamEndpoint();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  type metadata accessor for ClientConnection();
  swift_allocObject();
  uint64_t v9 = ClientConnection.init(endpoint:)();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  *(void *)(v8 + 16) = v9;
  *a2 = v8;
  return result;
}

uint64_t SILManager.Server.__allocating_init(endpoint:handler:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TightbeamEndpoint();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  outlined init with copy of SILFileHandle(a2, v8 + 24);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  type metadata accessor for ServiceConnection();
  swift_allocObject();
  *(void *)(v8 + 16) = ServiceConnection.init(endpoint:)();
  lazy protocol witness table accessor for type SILManager.Server and conformance SILManager.Server(&lazy protocol witness table cache variable for type SILManager.Server and conformance SILManager.Server);
  swift_retain();
  dispatch thunk of ServiceConnection.service.setter();
  __swift_destroy_boxed_opaque_existential_1(a2);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v8;
}

uint64_t type metadata accessor for SILManager.Server()
{
  return self;
}

uint64_t SILManager.Server.decode(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for TightbeamEncoder();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  int v85 = (char *)&v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TightbeamEncoder?);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  id v87 = (char *)&v83 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  int v86 = (char *)&v83 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  unsigned __int8 v14 = (char *)&v83 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v88 = (char *)&v83 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  char v19 = (char *)&v83 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  unint64_t v22 = (char *)&v83 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v83 - v23;
  uint64_t v25 = type metadata accessor for TightbeamDecoder();
  MEMORY[0x270FA5388](v25);
  int v27 = (char *)&v83 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = v28;
  uint64_t v94 = v29;
  (*(void (**)(char *, uint64_t))(v29 + 16))(v27, a1);
  uint64_t v90 = v5;
  uint64_t v91 = v4;
  id v89 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v89(v24, 1, 1, v4);
  int v95 = v27;
  uint64_t v30 = TightbeamDecoder.decode(as:)();
  uint64_t v31 = v30;
  if (v30 > 0x67C81ED3212CD498)
  {
    if (v30 == 0x67C81ED3212CD499)
    {
      uint64_t v84 = v5 + 56;
      uint64_t v60 = v2[6];
      uint64_t v61 = v2[7];
      __swift_project_boxed_opaque_existential_1(v2 + 3, v60);
      uint64_t v62 = TightbeamDecoder.decode(as:)();
      char v63 = TightbeamDecoder.decode(as:)();
      Swift::UInt32 v64 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v61 + 32))(v62, v63 & 1, v60, v61);
      Swift::UInt64 v66 = v65;
      uint64_t v67 = v92;
      TightbeamDecoder.encoder(bytes:capabilities:)();
      uint64_t v48 = v91;
      if (!v67)
      {
        v89(v14, 0, 1, v91);
        outlined assign with take of TightbeamEncoder?((uint64_t)v14, (uint64_t)v24);
        unint64_t v49 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v90 + 48);
        if (!v49(v24, 1, v48))
        {
          TightbeamEncoder.encode(_:)(v64);
          TightbeamEncoder.encode(_:)(v66);
        }
        uint64_t v51 = v93;
        goto LABEL_29;
      }
      goto LABEL_20;
    }
    if (v30 != 0x74E2ED7425CD826ALL)
    {
      if (v30 == 0x7C740F6E7438C1BALL)
      {
        uint64_t v73 = v2[6];
        uint64_t v74 = v2[7];
        __swift_project_boxed_opaque_existential_1(v2 + 3, v73);
        unsigned __int8 v14 = (char *)(*(uint64_t (**)(uint64_t, uint64_t))(v74 + 40))(v73, v74);
        uint64_t v75 = (uint64_t)v86;
        uint64_t v76 = v92;
        TightbeamDecoder.encoder(bytes:capabilities:)();
        uint64_t v51 = v93;
        if (v76) {
          goto LABEL_21;
        }
        uint64_t v48 = v91;
        v89((char *)v75, 0, 1, v91);
        outlined assign with take of TightbeamEncoder?(v75, (uint64_t)v24);
        unint64_t v49 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v90 + 48);
        if (!v49(v24, 1, v48)) {
          goto LABEL_28;
        }
        goto LABEL_29;
      }
      goto LABEL_34;
    }
    uint64_t v52 = v2[6];
    uint64_t v53 = v2[7];
    __swift_project_boxed_opaque_existential_1(v2 + 3, v52);
    unsigned __int8 v14 = (char *)(*(uint64_t (**)(uint64_t, uint64_t))(v53 + 8))(v52, v53);
    uint64_t v54 = v92;
    TightbeamDecoder.encoder(bytes:capabilities:)();
    uint64_t v48 = v91;
    if (!v54)
    {
      v89(v22, 0, 1, v91);
LABEL_13:
      outlined assign with take of TightbeamEncoder?((uint64_t)v22, (uint64_t)v24);
      unint64_t v49 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v90 + 48);
      unsigned int v59 = v49(v24, 1, v48);
      goto LABEL_27;
    }
LABEL_20:
    uint64_t v51 = v93;
LABEL_21:
    (*(void (**)(char *, uint64_t))(v94 + 8))(v95, v51);
    outlined destroy of TightbeamEncoder?((uint64_t)v24);
    return (uint64_t)v14;
  }
  if (v30 == 0x8FCDC6E3802C9B2CLL)
  {
    uint64_t v55 = v2[6];
    uint64_t v56 = v2[7];
    __swift_project_boxed_opaque_existential_1(v2 + 3, v55);
    uint64_t v57 = TightbeamDecoder.decode(as:)();
    unsigned __int8 v14 = (char *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v56 + 48))(v57, v55, v56);
    unint64_t v22 = v87;
    uint64_t v58 = v92;
    TightbeamDecoder.encoder(bytes:capabilities:)();
    if (!v58)
    {
      uint64_t v48 = v91;
      v89(v22, 0, 1, v91);
      goto LABEL_13;
    }
    goto LABEL_20;
  }
  uint64_t v84 = v5 + 56;
  if (v30 == 0xA1B06ACB080733F6)
  {
    uint64_t v32 = v2[6];
    uint64_t v33 = v2[7];
    __swift_project_boxed_opaque_existential_1(v2 + 3, v32);
    uint64_t v34 = TightbeamDecoder.decode(as:)();
    uint64_t v35 = TightbeamDecoder.decode(as:)();
    TightbeamDecoder.decode(as:)();
    double v37 = v36;
    TightbeamDecoder.decode(as:)();
    double v39 = v38;
    TightbeamDecoder.decode(as:)();
    float v41 = v40;
    uint64_t v42 = TightbeamDecoder.decode(as:)();
    TightbeamDecoder.decode(as:)();
    Swift::UInt32 v44 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double, double, float, float))(v33 + 24))(v34, v35, v42, v32, v33, v37, v39, v41, v43);
    unsigned __int8 v14 = v45;
    uint64_t v46 = (uint64_t)v88;
    uint64_t v47 = v92;
    TightbeamDecoder.encoder(bytes:capabilities:)();
    if (!v47)
    {
      uint64_t v48 = v91;
      v89((char *)v46, 0, 1, v91);
      outlined assign with take of TightbeamEncoder?(v46, (uint64_t)v24);
      unint64_t v49 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v90 + 48);
      unsigned int v50 = v49(v24, 1, v48);
      uint64_t v51 = v93;
      if (!v50)
      {
        TightbeamEncoder.encode(_:)(v44);
        TightbeamEncoder.encode(_:)((Swift::UInt64)v14);
      }
      goto LABEL_29;
    }
    goto LABEL_20;
  }
  if (v30 == 0xA410C7076A35A6E8)
  {
    uint64_t v68 = v2[6];
    uint64_t v69 = v2[7];
    __swift_project_boxed_opaque_existential_1(v2 + 3, v68);
    char v70 = TightbeamDecoder.decode(as:)();
    char v71 = TightbeamDecoder.decode(as:)();
    unsigned __int8 v14 = (char *)(*(uint64_t (**)(void, void, uint64_t, uint64_t))(v69 + 16))(v70 & 1, v71 & 1, v68, v69);
    uint64_t v72 = v92;
    TightbeamDecoder.encoder(bytes:capabilities:)();
    if (v72) {
      goto LABEL_20;
    }
    uint64_t v77 = v91;
    v89(v19, 0, 1, v91);
    uint64_t v78 = (uint64_t)v19;
    uint64_t v48 = v77;
    outlined assign with take of TightbeamEncoder?(v78, (uint64_t)v24);
    unint64_t v49 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v90 + 48);
    unsigned int v59 = v49(v24, 1, v77);
LABEL_27:
    uint64_t v51 = v93;
    if (!v59) {
LABEL_28:
    }
      TightbeamEncoder.encode(_:)((Swift::UInt32)v14);
LABEL_29:
    if (v49(v24, 1, v48))
    {
      (*(void (**)(char *, uint64_t))(v94 + 8))(v95, v51);
      unsigned __int8 v14 = 0;
    }
    else
    {
      uint64_t v79 = v90;
      uint64_t v80 = v85;
      (*(void (**)(char *, char *, uint64_t))(v90 + 16))(v85, v24, v48);
      unsigned __int8 v14 = (char *)TightbeamEncoder.complete()();
      (*(void (**)(char *, uint64_t))(v79 + 8))(v80, v48);
      (*(void (**)(char *, uint64_t))(v94 + 8))(v95, v51);
    }
    outlined destroy of TightbeamEncoder?((uint64_t)v24);
    return (uint64_t)v14;
  }
LABEL_34:
  unint64_t v97 = 0;
  unint64_t v98 = 0xE000000000000000;
  _StringGuts.grow(_:)(43);
  swift_bridgeObjectRelease();
  unint64_t v97 = 0xD000000000000029;
  unint64_t v98 = 0x800000025B6A1C50;
  uint64_t v96 = v31;
  v82._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v82);
  swift_bridgeObjectRelease();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t SILManager.Server.__deallocating_deinit()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocClassInstance();
}

uint64_t protocol witness for MessageDecodeProtocol.decode(_:) in conformance SILManager.Server(uint64_t a1)
{
  return SILManager.Server.decode(_:)(a1);
}

uint64_t SILManager.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t SILManager.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t outlined destroy of TightbeamEncoder?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TightbeamEncoder?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined assign with take of TightbeamEncoder?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TightbeamEncoder?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t base witness table accessor for MessageDecodeProtocol in SILManager.Server()
{
  return lazy protocol witness table accessor for type SILManager.Server and conformance SILManager.Server((unint64_t *)&lazy protocol witness table cache variable for type SILManager.Server and conformance SILManager.Server);
}

uint64_t lazy protocol witness table accessor for type SILManager.Server and conformance SILManager.Server(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SILManager.Server();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for SwapReturn()
{
  return &type metadata for SwapReturn;
}

uint64_t type metadata accessor for SILManager()
{
  return self;
}

uint64_t type metadata accessor for SILManager.Service()
{
  return self;
}

void sil_argb8888_to_b3a8_cold_1()
{
  __assert_rtn("sil_argb8888_to_b3a8", "SILManagerCommon.mm", 42, "(src_bpr % simd_group_size) == 0");
}

void SILServer_createSILServerClient(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_25B66B000, a2, OS_LOG_TYPE_ERROR, "Error creating SILServerClientConnection (tbErr:%d)", (uint8_t *)v2, 8u);
}

{
  _DWORD v2[2];
  uint64_t v3;

  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_25B66B000, a2, OS_LOG_TYPE_ERROR, "Error creating SILServerEndpoint (tbErr:%d)", (uint8_t *)v2, 8u);
}

void do_tightbeam_call<unsigned int,tb_error_t (*)(silmanager_silmanager_s const*,void({block_pointer})(unsigned int)),silmanager_silmanager_s*>(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_25B66B000, log, OS_LOG_TYPE_ERROR, "Error while making Tightbeam call for %s : %d", (uint8_t *)&v3, 0x12u);
}

void SILServer_setPower()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_25B66B000, v0, v1, "Error while making Tightbeam call for %s : %d", v2, v3, v4, v5, 2u);
}

void SILServer_swap()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_25B66B000, v0, v1, "Error while making Tightbeam call for %s : %d", v2, v3, v4, v5, 2u);
}

void SILServer_turnOffIndicators()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_25B66B000, v0, v1, "Error while making Tightbeam call for %s : %d", v2, v3, v4, v5, 2u);
}

void SILServer_setLogLevel()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_25B66B000, v0, v1, "Error while making Tightbeam call for %s : %d", v2, v3, v4, v5, 2u);
}

void frame_distance()
{
  __assert_rtn("frame_distance", "SILStateMachine.mm", 109, "range_1 != tp.end");
}

{
  __assert_rtn("frame_distance", "SILStateMachine.mm", 110, "range_2 != tp.end");
}

{
  __assert_rtn("frame_distance", "SILStateMachine.mm", 75, "frame_1 >= range_1->from && frame_1 <= range_1->to");
}

{
  __assert_rtn("frame_distance", "SILStateMachine.mm", 76, "frame_2 >= range_2->from && frame_2 <= range_2->to");
}

{
  __assert_rtn("frame_distance", "SILStateMachine.mm", 97, "frame_2 >= range_1->from");
}

void SILManagerCreate_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_25B66B000, a2, OS_LOG_TYPE_ERROR, "Failed to create SIL Renderer ! err: %x", (uint8_t *)v2, 8u);
}

void SILManagerCreate_cold_2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_25B66B000, a2, OS_LOG_TYPE_ERROR, "Failed to create SIL Server Client ! err: %x", (uint8_t *)v2, 8u);
}

void SILManagerSetPower_cold_1(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = "off";
  if (a1) {
    uint64_t v2 = "on";
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_25B66B000, a2, OS_LOG_TYPE_ERROR, "SILManager failed to set power %s", (uint8_t *)&v3, 0xCu);
}

void SILManagerSwap_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_25B66B000, log, OS_LOG_TYPE_ERROR, "SILManager swap failed because pipe is not ready", v1, 2u);
}

uint64_t static CharacterSet.newlines.getter()
{
  return MEMORY[0x270EEE218]();
}

uint64_t type metadata accessor for CharacterSet()
{
  return MEMORY[0x270EEE258]();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x270EEE628]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x270EEE688]();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x270EEF238]();
}

uint64_t PropertyListDecoder.init()()
{
  return MEMORY[0x270EEF250]();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return MEMORY[0x270EEF268]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF830]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.init(fileURLWithFileSystemRepresentation:isDirectory:relativeTo:)()
{
  return MEMORY[0x270EEFE08]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x270EF0070]();
}

uint64_t Data.copyBytes(to:count:)()
{
  return MEMORY[0x270EF0268]();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t OSSignposter.init(logger:)()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t OSSignposter.logHandle.getter()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t type metadata accessor for OSSignposter()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t TightbeamDecoder.decode(as:)()
{
  return MEMORY[0x270F7DF50]();
}

{
  return MEMORY[0x270F7DF60]();
}

{
  return MEMORY[0x270F7DF70]();
}

{
  return MEMORY[0x270F7DF78]();
}

{
  return MEMORY[0x270F7DF90]();
}

{
  return MEMORY[0x270F7DF98]();
}

{
  return MEMORY[0x270F7DFA8]();
}

uint64_t TightbeamDecoder.encoder(bytes:capabilities:)()
{
  return MEMORY[0x270F7DFB8]();
}

uint64_t type metadata accessor for TightbeamDecoder()
{
  return MEMORY[0x270F7DFD8]();
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::UInt64 a1)
{
}

uint64_t TightbeamEncoder.complete()()
{
  return MEMORY[0x270F7E030]();
}

uint64_t type metadata accessor for TightbeamEncoder()
{
  return MEMORY[0x270F7E040]();
}

uint64_t type metadata accessor for TightbeamEndpoint()
{
  return MEMORY[0x270F7E050]();
}

uint64_t ClientConnection.init(endpoint:)()
{
  return MEMORY[0x270F7E078]();
}

uint64_t type metadata accessor for ClientConnection()
{
  return MEMORY[0x270F7E080]();
}

uint64_t dispatch thunk of ServiceConnection.service.setter()
{
  return MEMORY[0x270F7E090]();
}

uint64_t ServiceConnection.init(endpoint:)()
{
  return MEMORY[0x270F7E098]();
}

uint64_t type metadata accessor for ServiceConnection()
{
  return MEMORY[0x270F7E0A0]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1840]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.init<A>(bytes:encoding:)()
{
  return MEMORY[0x270EF1A18]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x270F9D620]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x270F9D800]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x270F9D810]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x270F9D860]();
}

Swift::Bool __swiftcall String.hasSuffix(_:)(Swift::String a1)
{
  return MEMORY[0x270F9D880](a1._countAndFlagsBits, a1._object);
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9DBA0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t Double.description.getter()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t Double.write<A>(to:)()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t Float.write<A>(to:)()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t NSFileHandle.read(upToCount:)()
{
  return MEMORY[0x270EF1E30]();
}

Swift::UInt64 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> NSFileHandle.offset()()
{
  return MEMORY[0x270EF1E48]();
}

uint64_t NSFileHandle.readToEnd()()
{
  return MEMORY[0x270EF1E50]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t static os_signpost_type_t.event.getter()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t StringProtocol.components(separatedBy:)()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x270F9E7F0]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

{
  return MEMORY[0x270F9EFF0]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x270F9F098]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F278]();
}

{
  return MEMORY[0x270F9F290]();
}

{
  return MEMORY[0x270F9F2D0]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x270F9F2E8]();
}

{
  return MEMORY[0x270F9F300]();
}

{
  return MEMORY[0x270F9F308]();
}

{
  return MEMORY[0x270F9F350]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F318]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x270F9F4C8](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x270EF2680]();
}

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t static Hasher._hash(seed:bytes:count:)()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

uint64_t MobileGestalt_copy_productType_obj()
{
  return MEMORY[0x270F960A0]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983C8](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
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

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x270F98C70](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x270F98C78](this);
}

void std::locale::~locale(std::locale *this)
{
}

const std::locale *__cdecl std::locale::operator=(std::locale *this, const std::locale *a2)
{
  return (const std::locale *)MEMORY[0x270F98C88](this, a2);
}

uint64_t std::to_chars(std::__1 *this, char *a2, char *a3, double a4)
{
  return MEMORY[0x270F98DA0](this, a2, a3, a4);
}

{
  return MEMORY[0x270F98DB8](this, a2, a3, a4);
}

uint64_t std::to_chars()
{
  return MEMORY[0x270F98DA8]();
}

{
  return MEMORY[0x270F98DB0]();
}

{
  return MEMORY[0x270F98DC0]();
}

{
  return MEMORY[0x270F98DC8]();
}

{
  return MEMORY[0x270F98DD8]();
}

{
  return MEMORY[0x270F98DE0]();
}

uint64_t std::to_chars(std::__1 *this, char *a2, char *a3, float a4)
{
  return MEMORY[0x270F98DD0](this, a2, a3, a4);
}

void std::terminate(void)
{
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
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t __udivti3()
{
  return MEMORY[0x270ED7F10]();
}

uint64_t __umodti3()
{
  return MEMORY[0x270ED7F28]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x270ED8EF8](*(void *)&__clock_id);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F48](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_decode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x270F98F50](*(void *)&algorithm);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

float remainderf(float a1, float a2)
{
  MEMORY[0x270EDB1E0](a1, a2);
  return result;
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t tb_client_connection_activate()
{
  return MEMORY[0x270F7E0B0]();
}

uint64_t tb_client_connection_create_with_endpoint()
{
  return MEMORY[0x270F7E0C8]();
}

uint64_t tb_client_connection_message_construct()
{
  return MEMORY[0x270F7E0E8]();
}

uint64_t tb_client_connection_message_destruct()
{
  return MEMORY[0x270F7E0F0]();
}

uint64_t tb_conclave_endpoint_for_service()
{
  return MEMORY[0x270F7E100]();
}

uint64_t tb_connection_send_query()
{
  return MEMORY[0x270F7E110]();
}

uint64_t tb_endpoint_set_interface_identifier()
{
  return MEMORY[0x270F7E128]();
}

uint64_t tb_message_complete()
{
  return MEMORY[0x270F7E140]();
}

uint64_t tb_message_decode_u32()
{
  return MEMORY[0x270F7E1A8]();
}

uint64_t tb_message_decode_u64()
{
  return MEMORY[0x270F7E1B8]();
}

uint64_t tb_message_encode_BOOL()
{
  return MEMORY[0x270F7E1D8]();
}

uint64_t tb_message_encode_f32()
{
  return MEMORY[0x270F7E1E0]();
}

uint64_t tb_message_encode_f64()
{
  return MEMORY[0x270F7E1F0]();
}

uint64_t tb_message_encode_s32()
{
  return MEMORY[0x270F7E200]();
}

uint64_t tb_message_encode_u16()
{
  return MEMORY[0x270F7E210]();
}

uint64_t tb_message_encode_u64()
{
  return MEMORY[0x270F7E230]();
}

uint64_t tb_message_encode_u8()
{
  return MEMORY[0x270F7E238]();
}

vImage_Error vImageRotate90_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, const Pixel_8888 backColor, vImage_Flags flags)
{
  return MEMORY[0x270EDF2A8](src, dest, rotationConstant, backColor, *(void *)&flags);
}