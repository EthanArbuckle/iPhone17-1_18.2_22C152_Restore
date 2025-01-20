uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void sub_25E3AE07C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

id NSStringFromSBINAppIntentActionSource(unint64_t a1)
{
  if (a1 >= 3)
  {
    v1 = objc_msgSend(NSString, "stringWithFormat:", @"<unknown: %lu>", a1);
  }
  else
  {
    v1 = (void *)*((void *)&off_265525950 + a1);
  }
  return v1;
}

id SBINLogCommon()
{
  if (SBINLogCommon_onceToken != -1) {
    dispatch_once(&SBINLogCommon_onceToken, &__block_literal_global);
  }
  v0 = (void *)SBINLogCommon___logObj;
  return v0;
}

uint64_t __SBINLogCommon_block_invoke()
{
  SBINLogCommon___logObj = (uint64_t)os_log_create("com.apple.SpringBoardIntents", "Common");
  return MEMORY[0x270F9A758]();
}

id SBINLogIntentExecution()
{
  if (SBINLogIntentExecution_onceToken[0] != -1) {
    dispatch_once(SBINLogIntentExecution_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)SBINLogIntentExecution___logObj;
  return v0;
}

uint64_t __SBINLogIntentExecution_block_invoke()
{
  SBINLogIntentExecution___logObj = (uint64_t)os_log_create("com.apple.SpringBoardIntents", "IntentExecution");
  return MEMORY[0x270F9A758]();
}

Class __getFCActivityManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!FocusLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __FocusLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2655259B8;
    uint64_t v6 = 0;
    FocusLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!FocusLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("FCActivityManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getFCActivityManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getFCActivityManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FocusLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FocusLibraryCore_frameworkLibrary = result;
  return result;
}

__CFString *NSStringFromSBINCameraCaptureMode(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown: %lu>", a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = off_265525A38[a1];
  }
  return v1;
}

__CFString *NSStringFromSBINCameraCaptureDevice(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      v2 = @"back";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"<unknown: %lu>", a1);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v2 = @"front";
  }
  return v2;
}

uint64_t sub_25E3AF1BC()
{
  uint64_t v0 = sub_25E3B5A68();
  __swift_allocate_value_buffer(v0, qword_26A6ED440);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A6ED440);
  return sub_25E3B5A58();
}

unint64_t sub_25E3AF220()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B386488);
  uint64_t v0 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v39 = (char *)&v28 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  v36 = (char *)&v28 - v3;
  MEMORY[0x270FA5388](v2);
  v32 = (char *)&v28 - v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B386490);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  v37 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v41 = (char *)&v28 - v9;
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v28 - v10;
  uint64_t v12 = sub_25E3B5AA8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v34 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v40 = (char *)&v28 - v17;
  MEMORY[0x270FA5388](v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6ED120);
  v18 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A6ED128) - 8);
  uint64_t v19 = *(void *)(*(void *)v18 + 72);
  unint64_t v20 = (*(unsigned __int8 *)(*(void *)v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v18 + 80);
  uint64_t v35 = 4 * v19;
  uint64_t v21 = swift_allocObject();
  uint64_t v38 = v21;
  *(_OWORD *)(v21 + 16) = xmmword_25E3B63F0;
  unint64_t v22 = v21 + v20;
  *(unsigned char *)(v21 + v20) = 0;
  unint64_t v33 = 0xD000000000000016;
  sub_25E3B5A88();
  v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v23(v11, 1, 1, v12);
  v29 = v23;
  sub_25E3B59C8();
  sub_25E3B59E8();
  v32 = (char *)(v22 + v19 + v18[14]);
  *(unsigned char *)(v22 + v19) = 1;
  sub_25E3B5A88();
  uint64_t v31 = v12;
  v23(v41, 1, 1, v12);
  uint64_t v30 = v13 + 56;
  sub_25E3B59C8();
  sub_25E3B59E8();
  *(unsigned char *)(v22 + 2 * v19) = 2;
  sub_25E3B5A88();
  v24 = v29;
  v29(v37, 1, 1, v12);
  sub_25E3B59C8();
  sub_25E3B59E8();
  *(unsigned char *)(v22 + 3 * v19) = 3;
  sub_25E3B5A88();
  v25 = v41;
  uint64_t v26 = v31;
  v24(v41, 1, 1, v31);
  sub_25E3B59C8();
  sub_25E3B59E8();
  *(unsigned char *)(v22 + v35) = 4;
  sub_25E3B5A88();
  v24(v25, 1, 1, v26);
  sub_25E3B59C8();
  sub_25E3B59E8();
  unint64_t result = sub_25E3AF7FC(v38);
  qword_26A6ED458 = result;
  return result;
}

unint64_t sub_25E3AF7FC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6ED128);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6ED130);
  uint64_t v6 = sub_25E3B5C18();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_25E3B14E4(v12, (uint64_t)v5);
    char v14 = *v5;
    unint64_t result = sub_25E3B0F6C(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_25E3B59F8();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_25E3AF9EC(char a1)
{
  return *(void *)&aRearphotfrontp[8 * a1];
}

uint64_t sub_25E3AFA0C(char *a1, char *a2)
{
  return sub_25E3AFA70(*a1, *a2);
}

unint64_t sub_25E3AFA1C()
{
  unint64_t result = qword_26B386558;
  if (!qword_26B386558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386558);
  }
  return result;
}

uint64_t sub_25E3AFA70(char a1, char a2)
{
  if (*(void *)&aRearphotfrontp[8 * a1] == *(void *)&aRearphotfrontp[8 * a2]
    && *(void *)&aRearphotfrontp[8 * a1 + 40] == *(void *)&aRearphotfrontp[8 * a2 + 40])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25E3B5C48();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25E3AFAF8()
{
  return sub_25E3AFB00();
}

uint64_t sub_25E3AFB00()
{
  return sub_25E3B5C68();
}

uint64_t sub_25E3AFB6C()
{
  return sub_25E3AFB74();
}

uint64_t sub_25E3AFB74()
{
  sub_25E3B5B88();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E3AFBC8()
{
  return sub_25E3AFBD0();
}

uint64_t sub_25E3AFBD0()
{
  return sub_25E3B5C68();
}

uint64_t sub_25E3AFC38@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25E3B1110();
  *a1 = result;
  return result;
}

uint64_t sub_25E3AFC68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25E3AF9EC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25E3AFC98()
{
  unint64_t result = qword_26B386510;
  if (!qword_26B386510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386510);
  }
  return result;
}

unint64_t sub_25E3AFCF0()
{
  unint64_t result = qword_26B386538;
  if (!qword_26B386538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386538);
  }
  return result;
}

unint64_t sub_25E3AFD48()
{
  unint64_t result = qword_26B386560;
  if (!qword_26B386560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386560);
  }
  return result;
}

uint64_t sub_25E3AFD9C()
{
  return MEMORY[0x263F8D380];
}

uint64_t sub_25E3AFDA8()
{
  return sub_25E3B0F28(&qword_26A6ED058, &qword_26A6ED060);
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

void sub_25E3AFE2C(void *a1@<X8>)
{
  *a1 = &unk_270B1F2D8;
}

unint64_t sub_25E3AFE40()
{
  unint64_t result = qword_26B386468;
  if (!qword_26B386468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386468);
  }
  return result;
}

unint64_t sub_25E3AFE98()
{
  unint64_t result = qword_26B386530;
  if (!qword_26B386530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386530);
  }
  return result;
}

unint64_t sub_25E3AFEF0()
{
  unint64_t result = qword_26B386518;
  if (!qword_26B386518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386518);
  }
  return result;
}

unint64_t sub_25E3AFF48()
{
  unint64_t result = qword_26B386520;
  if (!qword_26B386520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386520);
  }
  return result;
}

uint64_t sub_25E3AFFA0@<X0>(uint64_t a1@<X8>)
{
  return sub_25E3B0A70(&qword_26A6ED020, MEMORY[0x263EFBE48], (uint64_t)qword_26A6ED440, a1);
}

uint64_t sub_25E3AFFD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25E3B0414(a1, a2, a3, (void (*)(void))sub_25E3B0004);
}

unint64_t sub_25E3B0004()
{
  unint64_t result = qword_26A6ED068;
  if (!qword_26A6ED068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6ED068);
  }
  return result;
}

uint64_t sub_25E3B0058(uint64_t a1)
{
  unint64_t v2 = sub_25E3B0004();
  return MEMORY[0x270EE0C40](a1, v2);
}

unint64_t sub_25E3B00A8()
{
  unint64_t result = qword_26B386540;
  if (!qword_26B386540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386540);
  }
  return result;
}

unint64_t sub_25E3B0100()
{
  unint64_t result = qword_26B386568;
  if (!qword_26B386568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386568);
  }
  return result;
}

unint64_t sub_25E3B0158()
{
  unint64_t result = qword_26B386550;
  if (!qword_26B386550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386550);
  }
  return result;
}

uint64_t sub_25E3B01AC()
{
  if (qword_26A6ED028 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E3B0208(uint64_t a1)
{
  unint64_t v2 = sub_25E3AFF48();
  return MEMORY[0x270EE1C28](a1, v2);
}

unint64_t sub_25E3B0258()
{
  unint64_t result = qword_26A6ED078[0];
  if (!qword_26A6ED078[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6ED078);
  }
  return result;
}

uint64_t sub_25E3B02AC()
{
  return MEMORY[0x263F8E650];
}

uint64_t sub_25E3B02B8()
{
  return MEMORY[0x263F8E630];
}

unint64_t sub_25E3B02C8()
{
  unint64_t result = qword_26B386580;
  if (!qword_26B386580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386580);
  }
  return result;
}

unint64_t sub_25E3B0320()
{
  unint64_t result = qword_26B386588;
  if (!qword_26B386588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386588);
  }
  return result;
}

unint64_t sub_25E3B0378()
{
  unint64_t result = qword_26B386570;
  if (!qword_26B386570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386570);
  }
  return result;
}

uint64_t sub_25E3B03CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25E3B03E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25E3B0414(a1, a2, a3, (void (*)(void))sub_25E3B02C8);
}

uint64_t sub_25E3B0414(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25E3B045C()
{
  uint64_t v0 = sub_25E3B5AA8();
  __swift_allocate_value_buffer(v0, qword_26A6ED460);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A6ED460);
  return sub_25E3B5A88();
}

uint64_t sub_25E3B04C0(uint64_t a1, uint64_t a2)
{
  v2[15] = a1;
  v2[16] = a2;
  sub_25E3B5BC8();
  v2[17] = sub_25E3B5BB8();
  uint64_t v4 = sub_25E3B5BA8();
  v2[18] = v4;
  v2[19] = v3;
  return MEMORY[0x270FA2498](sub_25E3B0558, v4, v3);
}

uint64_t sub_25E3B0558()
{
  sub_25E3B5958();
  uint64_t v1 = 8 * *(char *)(v0 + 80);
  uint64_t v2 = *(void *)((char *)&unk_25E3B6810 + v1);
  uint64_t v3 = *(void *)((char *)&unk_25E3B6838 + v1);
  uint64_t v4 = swift_retain();
  id v5 = sub_25E3B4100(v4);
  swift_release();
  id v6 = objc_msgSend(objc_allocWithZone((Class)SBINOpenCameraAppIntent), sel_initWithCaptureDevice_captureMode_systemContext_, v2, v3, v5);
  *(void *)(v0 + 160) = v6;

  id v7 = objc_msgSend(self, sel_sharedSystemCoordinator);
  *(void *)(v0 + 168) = v7;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 176;
  *(void *)(v0 + 24) = sub_25E3B0708;
  uint64_t v8 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_25E3B4A5C;
  *(void *)(v0 + 104) = &block_descriptor;
  *(void *)(v0 + 112) = v8;
  objc_msgSend(v7, sel_performAppIntent_withCompletion_, v6, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_25E3B0708()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 152);
  uint64_t v2 = *(void *)(*(void *)v0 + 144);
  return MEMORY[0x270FA2498](sub_25E3B0810, v2, v1);
}

uint64_t sub_25E3B0810()
{
  uint64_t v1 = *(void **)(v0 + 168);
  swift_release();
  int v2 = *(unsigned __int8 *)(v0 + 176);

  if (qword_26A6ED038 != -1) {
    swift_once();
  }
  uint64_t v3 = *(void **)(v0 + 160);
  uint64_t v4 = sub_25E3B5B28();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A6ED478);
  id v5 = v3;
  id v6 = sub_25E3B5B18();
  os_log_type_t v7 = sub_25E3B5BD8();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = *(void **)(v0 + 160);
  if (v8)
  {
    os_log_type_t type = v7;
    uint64_t v10 = swift_slowAlloc();
    unint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412546;
    *(void *)(v0 + 80) = v9;
    id v12 = v9;
    sub_25E3B5BE8();
    void *v11 = v9;

    *(_WORD *)(v10 + 12) = 1024;
    *(_DWORD *)(v0 + 80) = v2;
    sub_25E3B5BE8();
    _os_log_impl(&dword_25E3AC000, v6, type, "%@ intent performed successfully: %{BOOL}d", (uint8_t *)v10, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6ED110);
    swift_arrayDestroy();
    MEMORY[0x2611D5DB0](v11, -1, -1);
    MEMORY[0x2611D5DB0](v10, -1, -1);
    uint64_t v13 = *(NSObject **)(v0 + 160);
  }
  else
  {

    uint64_t v13 = *(NSObject **)(v0 + 160);
    id v6 = v13;
  }

  sub_25E3B5948();
  char v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t sub_25E3B0A38@<X0>(uint64_t a1@<X8>)
{
  return sub_25E3B0A70(&qword_26A6ED030, MEMORY[0x263F06D40], (uint64_t)qword_26A6ED460, a1);
}

uint64_t sub_25E3B0A70@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = __swift_project_value_buffer(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);
  return v9(a4, v8, v7);
}

uint64_t sub_25E3B0B1C()
{
  return 0;
}

uint64_t sub_25E3B0B2C(uint64_t a1)
{
  uint64_t v4 = *v1;
  id v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *id v5 = v2;
  v5[1] = sub_25E3B0BCC;
  return sub_25E3B04C0(a1, v4);
}

uint64_t sub_25E3B0BCC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25E3B0CC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25E3B115C();
  *a1 = result;
  return result;
}

uint64_t sub_25E3B0CE8()
{
  sub_25E3B02C8();
  return sub_25E3B5918();
}

ValueMetadata *type metadata accessor for OpenCamera()
{
  return &type metadata for OpenCamera;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CameraMode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CameraMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x25E3B0EA0);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_25E3B0EC8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25E3B0ED4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CameraMode()
{
  return &type metadata for CameraMode;
}

uint64_t sub_25E3B0EEC()
{
  return sub_25E3B0F28((unint64_t *)&qword_26A6ED090, (uint64_t *)&unk_26A6ED250);
}

uint64_t sub_25E3B0F28(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_25E3B0F6C(char a1)
{
  sub_25E3B5C58();
  sub_25E3B5B88();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_25E3B5C68();
  return sub_25E3B0FFC(a1, v2);
}

unint64_t sub_25E3B0FFC(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = 8 * a1;
    uint64_t v7 = *(void *)&aRearphotfrontp[v6];
    uint64_t v8 = *(void *)&aRearphotfrontp[v6 + 40];
    while (*(void *)&aRearphotfrontp[8 * *(char *)(*(void *)(v2 + 48) + v4)] != v7
         || *(void *)&aRearphotfrontp[8 * *(char *)(*(void *)(v2 + 48) + v4) + 40] != v8)
    {
      char v10 = sub_25E3B5C48();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_25E3B1110()
{
  unint64_t v0 = sub_25E3B5C38();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_25E3B115C()
{
  uint64_t v17 = sub_25E3B5A28();
  uint64_t v0 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B386460);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B386490);
  MEMORY[0x270FA5388](v9 - 8);
  unint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25E3B5AA8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6ED100);
  sub_25E3B5A88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 0;
  uint64_t v14 = sub_25E3B5938();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, *MEMORY[0x263EFBDC8], v17);
  sub_25E3B0004();
  return sub_25E3B5968();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
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

uint64_t sub_25E3B14E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6ED128);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_25E3B154C()
{
  uint64_t v0 = sub_25E3B5B28();
  __swift_allocate_value_buffer(v0, qword_26A6ED478);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A6ED478);
  id result = SBINLogIntentExecution();
  if (result) {
    return (id)sub_25E3B5B38();
  }
  __break(1u);
  return result;
}

unint64_t sub_25E3B15B4()
{
  unint64_t result = qword_26B3865D0;
  if (!qword_26B3865D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3865D0);
  }
  return result;
}

unint64_t sub_25E3B160C()
{
  unint64_t result = qword_26B3865E8;
  if (!qword_26B3865E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3865E8);
  }
  return result;
}

unint64_t sub_25E3B1664()
{
  unint64_t result = qword_26B386620;
  if (!qword_26B386620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386620);
  }
  return result;
}

unint64_t sub_25E3B16BC()
{
  unint64_t result = qword_26B386498;
  if (!qword_26B386498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386498);
  }
  return result;
}

uint64_t sub_25E3B1710()
{
  return MEMORY[0x263EFC020];
}

uint64_t sub_25E3B171C()
{
  uint64_t v0 = sub_25E3B5AA8();
  __swift_allocate_value_buffer(v0, qword_26A6ED490);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A6ED490);
  return sub_25E3B5A88();
}

uint64_t sub_25E3B1780()
{
  uint64_t v0 = sub_25E3B5A68();
  __swift_allocate_value_buffer(v0, qword_26A6ED4A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A6ED4A8);
  return sub_25E3B5A58();
}

uint64_t sub_25E3B17DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B386488);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v28 = (uint64_t)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B386490);
  MEMORY[0x270FA5388](v4 - 8);
  v27 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25E3B5A98();
  uint64_t v25 = *(void *)(v6 - 8);
  uint64_t v26 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (uint64_t *)((char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_25E3B5AF8();
  MEMORY[0x270FA5388](v9 - 8);
  v24 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25E3B5B58();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v12 = sub_25E3B5AA8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  char v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  char v18 = (char *)&v24 - v17;
  uint64_t v20 = *v1;
  uint64_t v19 = v1[1];
  v29 = v1;
  if (v20 == sub_25E3B5B78() && v19 == v21)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v22 = sub_25E3B5C48();
    swift_bridgeObjectRelease();
    if ((v22 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      sub_25E3B5A88();
      goto LABEL_7;
    }
  }
  sub_25E3B5B48();
  sub_25E3B5AE8();
  *uint64_t v8 = sub_25E3B4010(0, (unint64_t *)&unk_26B3864D0);
  (*(void (**)(uint64_t *, void, uint64_t))(v25 + 104))(v8, *MEMORY[0x263F06D30], v26);
  sub_25E3B5AB8();
LABEL_7:
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v27, 1, 1, v12);
  sub_25E3B1C0C(v28);
  sub_25E3B59E8();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
}

id sub_25E3B1C0C@<X0>(uint64_t a1@<X8>)
{
  sub_25E3B3FA8(v1 + 32, (uint64_t)v8);
  sub_25E3B3FA8((uint64_t)v8, (uint64_t)v9);
  if (v9[1])
  {
    sub_25E3B3FA8(v1 + 48, (uint64_t)v7);
    sub_25E3B3FA8((uint64_t)v7, (uint64_t)v10);
    if (v10[1])
    {
      sub_25E3B4010(0, qword_26B3864F0);
      ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
      sub_25E3B404C((uint64_t)v7);
      sub_25E3B404C((uint64_t)v7);
      sub_25E3B404C((uint64_t)v8);
      if (objc_msgSend(ObjCClassFromMetadata, sel_respondsToSelector_, sub_25E3B5B08()))
      {
        id v4 = objc_msgSend(ObjCClassFromMetadata, sel_performSelector_, sub_25E3B5B08());
        id result = ObjCClassFromMetadata;
        if (!v4)
        {
          __break(1u);
          return result;
        }
        swift_unknownObjectRetain();
        self;
        if (swift_dynamicCastObjCClass()) {
          return (id)sub_25E3B59C8();
        }
        swift_unknownObjectRelease();
      }
      else
      {
        sub_25E3B4078((uint64_t)v7);
      }
      sub_25E3B4078((uint64_t)v8);
    }
  }
  uint64_t v6 = sub_25E3B59D8();
  return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(a1, 1, 1, v6);
}

unint64_t sub_25E3B1DC8()
{
  unint64_t result = qword_26B3865F0;
  if (!qword_26B3865F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3865F0);
  }
  return result;
}

unint64_t sub_25E3B1E20()
{
  unint64_t result = qword_26B3865F8;
  if (!qword_26B3865F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3865F8);
  }
  return result;
}

unint64_t sub_25E3B1E78()
{
  unint64_t result = qword_26B3865E0;
  if (!qword_26B3865E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3865E0);
  }
  return result;
}

unint64_t sub_25E3B1ED0()
{
  unint64_t result = qword_26B386608;
  if (!qword_26B386608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386608);
  }
  return result;
}

uint64_t sub_25E3B1F24()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_25E3B1F30@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E3B1F3C@<X0>(uint64_t a1@<X8>)
{
  return sub_25E3B0A70(&qword_26A6ED048, MEMORY[0x263EFBE48], (uint64_t)qword_26A6ED4A8, a1);
}

uint64_t sub_25E3B1F74()
{
  return sub_25E3B0F28(&qword_26A6ED200, qword_26A6ED208);
}

uint64_t sub_25E3B1FB0(uint64_t a1)
{
  unint64_t v2 = sub_25E3B2190();
  return MEMORY[0x270EE0C68](a1, v2);
}

unint64_t sub_25E3B2000()
{
  unint64_t result = qword_26B386610;
  if (!qword_26B386610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386610);
  }
  return result;
}

uint64_t sub_25E3B2054@<X0>(uint64_t a1@<X8>)
{
  return sub_25E3B17DC(a1);
}

uint64_t sub_25E3B2090(uint64_t a1)
{
  unint64_t v2 = sub_25E3B1ED0();
  return MEMORY[0x270EE1D98](a1, v2);
}

unint64_t sub_25E3B20E0()
{
  unint64_t result = qword_26B3865B8;
  if (!qword_26B3865B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3865B8);
  }
  return result;
}

unint64_t sub_25E3B2138()
{
  unint64_t result = qword_26B3865C0;
  if (!qword_26B3865C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3865C0);
  }
  return result;
}

unint64_t sub_25E3B2190()
{
  unint64_t result = qword_26B3864A8;
  if (!qword_26B3864A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3864A8);
  }
  return result;
}

uint64_t sub_25E3B21E4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  id v4 = (uint64_t (__cdecl *)())((char *)&dword_26A6ED270 + dword_26A6ED270);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_25E3B2288;
  return v4();
}

uint64_t sub_25E3B2288(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  *(void *)(*v2 + 32) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 40) = a1;
    return MEMORY[0x270FA2498](sub_25E3B23D8, 0, 0);
  }
}

uint64_t sub_25E3B23D8()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[2];
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_25E3B3A90(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (uint64_t (*)(uint64_t))v0[1];
  return v4(v3);
}

uint64_t sub_25E3B2470(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_26A6ED270 + dword_26A6ED270);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_25E3B2514;
  return v4();
}

uint64_t sub_25E3B2514(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

unint64_t sub_25E3B2628()
{
  unint64_t result = qword_26B3865B0;
  if (!qword_26B3865B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3865B0);
  }
  return result;
}

unint64_t sub_25E3B2680()
{
  unint64_t result = qword_26B3864C8;
  if (!qword_26B3864C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B3864C0);
    sub_25E3B1E78();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3864C8);
  }
  return result;
}

uint64_t sub_25E3B26F4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_25E3B16BC();
  *uint64_t v5 = v2;
  v5[1] = sub_25E3B40A4;
  return MEMORY[0x270EE0E40](a1, a2, v6);
}

uint64_t sub_25E3B27A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25E3B0BCC;
  return MEMORY[0x270EE1A10](a1, a2, a3);
}

unint64_t sub_25E3B2864()
{
  unint64_t result = qword_26B386648;
  if (!qword_26B386648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386648);
  }
  return result;
}

unint64_t sub_25E3B28BC()
{
  unint64_t result = qword_26B386630;
  if (!qword_26B386630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386630);
  }
  return result;
}

uint64_t sub_25E3B2910()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25E3B292C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_25E3B297C()
{
  unint64_t result = qword_26B386638;
  if (!qword_26B386638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386638);
  }
  return result;
}

uint64_t sub_25E3B29D0(uint64_t a1, uint64_t a2)
{
  v2[18] = a1;
  v2[19] = a2;
  sub_25E3B5BC8();
  v2[20] = sub_25E3B5BB8();
  uint64_t v4 = sub_25E3B5BA8();
  v2[21] = v4;
  v2[22] = v3;
  return MEMORY[0x270FA2498](sub_25E3B2A68, v4, v3);
}

uint64_t sub_25E3B2A68()
{
  sub_25E3B5958();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = swift_retain();
  id v2 = sub_25E3B4120(v1);
  swift_release();
  id v3 = objc_allocWithZone((Class)SBINFocusAppIntent);
  uint64_t v4 = (void *)sub_25E3B5B68();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v3, sel_initWithModeIdentifier_systemContext_, v4, v2);
  v0[23] = v5;

  id v6 = objc_msgSend(self, sel_sharedSystemCoordinator);
  v0[24] = v6;
  v0[2] = v0;
  v0[7] = v0 + 25;
  v0[3] = sub_25E3B2C38;
  uint64_t v7 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_25E3B4A5C;
  v0[13] = &block_descriptor_0;
  v0[14] = v7;
  objc_msgSend(v6, sel_performAppIntent_withCompletion_, v5, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_25E3B2C38()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 176);
  uint64_t v2 = *(void *)(*(void *)v0 + 168);
  return MEMORY[0x270FA2498](sub_25E3B2D40, v2, v1);
}

uint64_t sub_25E3B2D40()
{
  uint64_t v1 = *(void **)(v0 + 192);
  swift_release();
  int v2 = *(unsigned __int8 *)(v0 + 200);

  if (qword_26A6ED038 != -1) {
    swift_once();
  }
  id v3 = *(void **)(v0 + 184);
  uint64_t v4 = sub_25E3B5B28();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A6ED478);
  id v5 = v3;
  id v6 = sub_25E3B5B18();
  os_log_type_t v7 = sub_25E3B5BD8();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = *(void **)(v0 + 184);
  if (v8)
  {
    os_log_type_t type = v7;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412546;
    *(void *)(v0 + 80) = v9;
    id v12 = v9;
    sub_25E3B5BE8();
    void *v11 = v9;

    *(_WORD *)(v10 + 12) = 1024;
    *(_DWORD *)(v0 + 80) = v2;
    sub_25E3B5BE8();
    _os_log_impl(&dword_25E3AC000, v6, type, "%@ intent performed successfully: %{BOOL}d", (uint8_t *)v10, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6ED110);
    swift_arrayDestroy();
    MEMORY[0x2611D5DB0](v11, -1, -1);
    MEMORY[0x2611D5DB0](v10, -1, -1);
    uint64_t v13 = *(NSObject **)(v0 + 184);
  }
  else
  {

    uint64_t v13 = *(NSObject **)(v0 + 184);
    id v6 = v13;
  }

  sub_25E3B5948();
  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t sub_25E3B2F68@<X0>(uint64_t a1@<X8>)
{
  return sub_25E3B0A70(&qword_26A6ED040, MEMORY[0x263F06D40], (uint64_t)qword_26A6ED490, a1);
}

uint64_t sub_25E3B2FA0(uint64_t a1)
{
  uint64_t v4 = *v1;
  id v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *id v5 = v2;
  v5[1] = sub_25E3B0BCC;
  return sub_25E3B29D0(a1, v4);
}

uint64_t sub_25E3B3040@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25E3B3CC4();
  *a1 = result;
  return result;
}

uint64_t sub_25E3B3068()
{
  sub_25E3B297C();
  return sub_25E3B5918();
}

ValueMetadata *type metadata accessor for Focus()
{
  return &type metadata for Focus;
}

ValueMetadata *type metadata accessor for Focus.FocusQuery()
{
  return &type metadata for Focus.FocusQuery;
}

uint64_t initializeBufferWithCopyOfBuffer for Focus.FocusEntity(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for Focus.FocusEntity()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for Focus.FocusEntity(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Focus.FocusEntity(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for Focus.FocusEntity(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Focus.FocusEntity(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Focus.FocusEntity(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Focus.FocusEntity()
{
  return &type metadata for Focus.FocusEntity;
}

uint64_t sub_25E3B336C()
{
  return sub_25E3B0F28((unint64_t *)&qword_26A6ED090, (uint64_t *)&unk_26A6ED250);
}

void *sub_25E3B33A8(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B386508);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 + 31;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 6);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 4]) {
          memmove(v13, a4 + 4, v8 << 6);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25E3B3644(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25E3B34B8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25E3B34D8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25E3B34D8(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B386508);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 + 31;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 6);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[64 * v8]) {
      memmove(v13, v14, v8 << 6);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[64 * v8] || v13 >= &v14[64 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25E3B5C28();
  __break(1u);
  return result;
}

uint64_t sub_25E3B3644(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + (a1 << 6) + 32;
    unint64_t v6 = a3 + (v4 << 6);
    if (v5 >= v6 || v5 + (v4 << 6) <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25E3B5C28();
  __break(1u);
  return result;
}

uint64_t sub_25E3B3738()
{
  return MEMORY[0x270FA2498](sub_25E3B3754, 0, 0);
}

uint64_t sub_25E3B3754()
{
  id v1 = objc_msgSend(self, sel_sharedActivityManager);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B386508);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_25E3B68B0;
  *(void *)(v2 + 32) = sub_25E3B5B78();
  *(void *)(v2 + 40) = v3;
  *(void *)(v2 + 48) = 0;
  *(void *)(v2 + 56) = 0xE000000000000000;
  *(_OWORD *)(v2 + 64) = xmmword_25E3B68C0;
  *(void *)(v2 + 80) = 0xD000000000000010;
  *(void *)(v2 + 88) = 0x800000025E3B71C0;
  id v4 = objc_msgSend(v1, sel_availableActivities);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3864E0);
  unint64_t v5 = sub_25E3B5B98();

  if (v5 >> 62)
  {
LABEL_17:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25E3B5C08();
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v6)
    {
LABEL_3:
      uint64_t v7 = 0;
      while (1)
      {
        if ((v5 & 0xC000000000000001) != 0)
        {
          uint64_t v8 = (void *)MEMORY[0x2611D5860](v7, v5);
          uint64_t v9 = v7 + 1;
          if (__OFADD__(v7, 1)) {
            goto LABEL_16;
          }
        }
        else
        {
          uint64_t v8 = *(void **)(v5 + 8 * v7 + 32);
          swift_unknownObjectRetain();
          uint64_t v9 = v7 + 1;
          if (__OFADD__(v7, 1))
          {
LABEL_16:
            __break(1u);
            goto LABEL_17;
          }
        }
        if (objc_msgSend(v8, sel_isPlaceholder))
        {
          swift_unknownObjectRelease();
          ++v7;
          if (v9 == v6) {
            break;
          }
        }
        else
        {
          id v35 = v1;
          id v10 = objc_msgSend(v8, sel_activityIdentifier);
          uint64_t v11 = sub_25E3B5B78();
          uint64_t v33 = v12;
          uint64_t v34 = v11;

          id v13 = objc_msgSend(v8, sel_activityDisplayName);
          uint64_t v14 = sub_25E3B5B78();
          uint64_t v31 = v15;
          uint64_t v32 = v14;

          id v16 = objc_msgSend(v8, sel_activitySymbolImageName);
          uint64_t v17 = sub_25E3B5B78();
          uint64_t v29 = v18;
          uint64_t v30 = v17;

          id v19 = objc_msgSend(v8, sel_activityColorName);
          uint64_t v20 = sub_25E3B5B78();
          uint64_t v28 = v21;

          unint64_t v23 = *(void *)(v2 + 16);
          unint64_t v22 = *(void *)(v2 + 24);
          v24 = (void *)v2;
          if (v23 >= v22 >> 1) {
            v24 = sub_25E3B33A8((void *)(v22 > 1), v23 + 1, 1, (void *)v2);
          }
          v24[2] = v23 + 1;
          uint64_t v2 = (uint64_t)v24;
          uint64_t v25 = &v24[8 * v23];
          v25[4] = v34;
          v25[5] = v33;
          v25[6] = v32;
          v25[7] = v31;
          v25[8] = v30;
          v25[9] = v29;
          v25[10] = v20;
          v25[11] = v28;
          swift_unknownObjectRelease();
          id v1 = v35;
          if (v9 == v6) {
            break;
          }
          uint64_t v7 = v9;
        }
      }
    }
  }
  swift_bridgeObjectRelease_n();

  uint64_t v26 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v26(v2);
}

uint64_t sub_25E3B3A90(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(void *)(result + 16);
  if (v2)
  {
    unint64_t v3 = 0;
    uint64_t v23 = result + 32;
    uint64_t v21 = (void *)(a2 + 56);
    uint64_t v22 = MEMORY[0x263F8EE78];
    uint64_t v29 = a2;
    unint64_t v26 = *(void *)(result + 16);
    while (1)
    {
      if (v3 <= v2) {
        unint64_t v4 = v2;
      }
      else {
        unint64_t v4 = v3;
      }
      unint64_t v28 = v4;
      while (1)
      {
        if (v3 == v28) {
          goto LABEL_34;
        }
        uint64_t v5 = v3++;
        uint64_t v6 = *(void *)(a2 + 16);
        if (!v6) {
          goto LABEL_7;
        }
        uint64_t v7 = v23 + (v5 << 6);
        uint64_t v8 = *(void *)v7;
        uint64_t v9 = *(void *)(v7 + 8);
        uint64_t v10 = *(void *)(v7 + 24);
        uint64_t v24 = *(void *)(v7 + 32);
        uint64_t v25 = *(void *)(v7 + 16);
        long long v27 = *(_OWORD *)(v7 + 40);
        uint64_t v11 = *(void *)(v7 + 56);
        if (*(void *)(v29 + 32) == *(void *)v7 && *(void *)(v29 + 40) == v9) {
          break;
        }
        uint64_t result = sub_25E3B5C48();
        if (result) {
          break;
        }
        if (v6 != 1)
        {
          id v13 = v21;
          uint64_t v14 = 1;
          while (1)
          {
            uint64_t v15 = v14 + 1;
            if (__OFADD__(v14, 1)) {
              break;
            }
            if (*(v13 - 1) == v8 && *v13 == v9) {
              goto LABEL_25;
            }
            uint64_t result = sub_25E3B5C48();
            if (result) {
              goto LABEL_25;
            }
            v13 += 2;
            ++v14;
            if (v15 == v6) {
              goto LABEL_7;
            }
          }
          __break(1u);
LABEL_34:
          __break(1u);
          return result;
        }
LABEL_7:
        a2 = v29;
        if (v3 == v26) {
          return v22;
        }
      }
LABEL_25:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v17 = v22;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = sub_25E3B34B8(0, *(void *)(v22 + 16) + 1, 1);
        uint64_t v17 = v22;
      }
      unint64_t v19 = *(void *)(v17 + 16);
      unint64_t v18 = *(void *)(v17 + 24);
      if (v19 >= v18 >> 1)
      {
        uint64_t result = sub_25E3B34B8(v18 > 1, v19 + 1, 1);
        uint64_t v17 = v22;
      }
      *(void *)(v17 + 16) = v19 + 1;
      uint64_t v22 = v17;
      uint64_t v20 = v17 + (v19 << 6);
      *(void *)(v20 + 32) = v8;
      *(void *)(v20 + 40) = v9;
      *(void *)(v20 + 48) = v25;
      *(void *)(v20 + 56) = v10;
      *(void *)(v20 + 64) = v24;
      *(_OWORD *)(v20 + 72) = v27;
      *(void *)(v20 + 88) = v11;
      unint64_t v2 = v26;
      a2 = v29;
      if (v3 == v26) {
        return v22;
      }
    }
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_25E3B3CC4()
{
  uint64_t v18 = sub_25E3B5A28();
  uint64_t v0 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  unint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B386460);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B386490);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25E3B5AA8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B386478);
  sub_25E3B5A88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  uint64_t v14 = sub_25E3B5938();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, *MEMORY[0x263EFBDC8], v18);
  sub_25E3B2190();
  return sub_25E3B5978();
}

uint64_t sub_25E3B3FA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3864B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E3B4010(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_25E3B404C(uint64_t a1)
{
  return a1;
}

uint64_t sub_25E3B4078(uint64_t a1)
{
  return a1;
}

unint64_t sub_25E3B40AC()
{
  unint64_t result = qword_26B386598;
  if (!qword_26B386598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386598);
  }
  return result;
}

id sub_25E3B4100(uint64_t a1)
{
  return sub_25E3B4140(a1, (void (*)(uint64_t))sub_25E3B02C8, (uint64_t)&type metadata for OpenCamera);
}

id sub_25E3B4120(uint64_t a1)
{
  return sub_25E3B4140(a1, (void (*)(uint64_t))sub_25E3B297C, (uint64_t)&type metadata for Focus);
}

id sub_25E3B4140(uint64_t a1, void (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v34 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6ED288);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25E3B5998();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v34 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6ED290);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  long long v20 = (char *)&v34 - v19;
  uint64_t v21 = sub_25E3B59B8();
  uint64_t v35 = *(void *)(v21 - 8);
  uint64_t v36 = v21;
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v34 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = a1;
  a2(v22);
  sub_25E3B58E8();
  sub_25E3B5988();
  sub_25E3B59A8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_25E3B5634((uint64_t)v7, &qword_26A6ED288);
    uint64_t v25 = 0;
  }
  else
  {
    unint64_t v26 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v26(v14, v7, v8);
    v26(v12, v14, v8);
    int v27 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v12, v8);
    uint64_t v25 = 2;
    if (v27 != *MEMORY[0x263EFBBF8]
      && v27 != *MEMORY[0x263EFBBF0]
      && v27 != *MEMORY[0x263EFBC00]
      && v27 != *MEMORY[0x263EFBC20]
      && v27 != *MEMORY[0x263EFBC10])
    {
      if (v27 == *MEMORY[0x263EFBBE0])
      {
        uint64_t v25 = 1;
      }
      else
      {
        uint64_t v25 = 2;
        if (v27 != *MEMORY[0x263EFBC28] && v27 != *MEMORY[0x263EFBBE8])
        {
          (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
          uint64_t v25 = 2;
        }
      }
    }
  }
  sub_25E3B55CC((uint64_t)v20, (uint64_t)v18);
  uint64_t v28 = sub_25E3B5AD8();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v18, 1, v28) != 1)
  {
    uint64_t v30 = (void *)sub_25E3B5AC8();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v18, v28);
  }
  id v31 = objc_allocWithZone((Class)SBINAppIntentSystemContext);
  id v32 = objc_msgSend(v31, sel_initWithPreciseTimestamp_actionSource_, v30, v25, v34);

  sub_25E3B5634((uint64_t)v20, (uint64_t *)&unk_26A6ED290);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v24, v36);
  return v32;
}

id sub_25E3B45C8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6ED288);
  MEMORY[0x270FA5388](v0 - 8);
  unint64_t v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25E3B5998();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v27 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6ED290);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v27 - v14;
  uint64_t v16 = sub_25E3B59B8();
  uint64_t v28 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E3B40AC();
  sub_25E3B58E8();
  sub_25E3B5988();
  sub_25E3B59A8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_25E3B5634((uint64_t)v2, &qword_26A6ED288);
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v27 = v16;
    uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v25(v9, v2, v3);
    v25(v7, v9, v3);
    int v26 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v7, v3);
    uint64_t v19 = 2;
    if (v26 == *MEMORY[0x263EFBBF8])
    {
      uint64_t v16 = v27;
    }
    else
    {
      uint64_t v16 = v27;
      if (v26 != *MEMORY[0x263EFBBF0]
        && v26 != *MEMORY[0x263EFBC00]
        && v26 != *MEMORY[0x263EFBC20]
        && v26 != *MEMORY[0x263EFBC10])
      {
        if (v26 == *MEMORY[0x263EFBBE0])
        {
          uint64_t v19 = 1;
        }
        else
        {
          uint64_t v19 = 2;
          if (v26 != *MEMORY[0x263EFBC28] && v26 != *MEMORY[0x263EFBBE8])
          {
            (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
            uint64_t v19 = 2;
          }
        }
      }
    }
  }
  sub_25E3B55CC((uint64_t)v15, (uint64_t)v13);
  uint64_t v20 = sub_25E3B5AD8();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v13, 1, v20) != 1)
  {
    uint64_t v22 = (void *)sub_25E3B5AC8();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v13, v20);
  }
  id v23 = objc_msgSend(objc_allocWithZone((Class)SBINAppIntentSystemContext), sel_initWithPreciseTimestamp_actionSource_, v22, v19);

  sub_25E3B5634((uint64_t)v15, (uint64_t *)&unk_26A6ED290);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v18, v16);
  return v23;
}

uint64_t sub_25E3B4A5C(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return MEMORY[0x270FA2400]();
}

uint64_t sub_25E3B4A80()
{
  uint64_t v0 = sub_25E3B5AA8();
  __swift_allocate_value_buffer(v0, qword_26A6ED4C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A6ED4C0);
  return sub_25E3B5A88();
}

uint64_t sub_25E3B4AE4(uint64_t a1)
{
  v1[15] = a1;
  sub_25E3B5BC8();
  v1[16] = sub_25E3B5BB8();
  uint64_t v3 = sub_25E3B5BA8();
  v1[17] = v3;
  v1[18] = v2;
  return MEMORY[0x270FA2498](sub_25E3B4B7C, v3, v2);
}

uint64_t sub_25E3B4B7C()
{
  sub_25E3B40AC();
  sub_25E3B5918();
  uint64_t v1 = (void *)sub_25E3B5B68();
  v0[19] = v1;
  swift_bridgeObjectRelease();
  id v2 = v1;
  id v3 = sub_25E3B45C8();
  id v4 = objc_msgSend(objc_allocWithZone((Class)SBINAppIntent), sel_initWithIdentifier_systemContext_, v2, v3);
  v0[20] = v4;

  id v5 = objc_msgSend(self, sel_sharedSystemCoordinator);
  v0[21] = v5;
  v0[2] = v0;
  v0[7] = v0 + 22;
  v0[3] = sub_25E3B4D1C;
  uint64_t v6 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_25E3B4A5C;
  v0[13] = &block_descriptor_1;
  v0[14] = v6;
  objc_msgSend(v5, sel_performAppIntent_withCompletion_, v4, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_25E3B4D1C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 144);
  uint64_t v2 = *(void *)(*(void *)v0 + 136);
  return MEMORY[0x270FA2498](sub_25E3B4E24, v2, v1);
}

uint64_t sub_25E3B4E24()
{
  uint64_t v1 = *(void **)(v0 + 168);
  swift_release();
  int v2 = *(unsigned __int8 *)(v0 + 176);

  if (qword_26A6ED038 != -1) {
    swift_once();
  }
  id v3 = *(void **)(v0 + 160);
  uint64_t v4 = sub_25E3B5B28();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A6ED478);
  id v5 = v3;
  uint64_t v6 = sub_25E3B5B18();
  os_log_type_t v7 = sub_25E3B5BD8();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = *(void **)(v0 + 160);
  if (v8)
  {
    os_log_type_t type = v7;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412546;
    *(void *)(v0 + 80) = v9;
    id v12 = v9;
    sub_25E3B5BE8();
    void *v11 = v9;

    *(_WORD *)(v10 + 12) = 1024;
    *(_DWORD *)(v0 + 80) = v2;
    sub_25E3B5BE8();
    _os_log_impl(&dword_25E3AC000, v6, type, "%@ intent performed successfully: %{BOOL}d", (uint8_t *)v10, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6ED110);
    swift_arrayDestroy();
    MEMORY[0x2611D5DB0](v11, -1, -1);
    MEMORY[0x2611D5DB0](v10, -1, -1);
    uint64_t v13 = *(NSObject **)(v0 + 160);
  }
  else
  {

    uint64_t v13 = *(NSObject **)(v0 + 160);
    uint64_t v6 = v13;
  }
  uint64_t v14 = *(void **)(v0 + 152);

  sub_25E3B5948();
  uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
  return v15();
}

unint64_t sub_25E3B5064()
{
  unint64_t result = qword_26B3865A0;
  if (!qword_26B3865A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3865A0);
  }
  return result;
}

unint64_t sub_25E3B50BC()
{
  unint64_t result = qword_26B386590;
  if (!qword_26B386590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B386590);
  }
  return result;
}

uint64_t sub_25E3B5110()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25E3B512C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25E3B517C@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A6ED050 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25E3B5AA8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A6ED4C0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_25E3B5224(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25E3B0BCC;
  return sub_25E3B4AE4(a1);
}

uint64_t sub_25E3B52BC()
{
  sub_25E3B40AC();
  return sub_25E3B5918();
}

ValueMetadata *type metadata accessor for ToggleFlashlight()
{
  return &type metadata for ToggleFlashlight;
}

unint64_t sub_25E3B530C()
{
  unint64_t result = qword_26A6ED090;
  if (!qword_26A6ED090)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26A6ED250);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6ED090);
  }
  return result;
}

uint64_t sub_25E3B5368(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_25E3B5378(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_25E3B53B4(uint64_t (*a1)(void))
{
  return a1();
}

void sub_25E3B53DC(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_25E3B5BE8();
  *a1 = v7;
  BOOL v8 = *a2;
  if (*a2)
  {
    *BOOL v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

unsigned char **sub_25E3B5494(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *unint64_t result = v4 + 1;
  return result;
}

void *sub_25E3B54A4(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_25E3B5C28();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_25E3B5548(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_25E3B5574(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25E3B559C@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_25E3B55CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6ED290);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E3B5634(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __getFCActivityManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SBINAppIntent initWithIdentifier:systemContext:](v0);
}

uint64_t sub_25E3B5878()
{
  return MEMORY[0x270EE0AA8]();
}

uint64_t sub_25E3B5888()
{
  return MEMORY[0x270EE0AB0]();
}

uint64_t sub_25E3B5898()
{
  return MEMORY[0x270EE0AB8]();
}

uint64_t sub_25E3B58C8()
{
  return MEMORY[0x270EE0C80]();
}

uint64_t sub_25E3B58D8()
{
  return MEMORY[0x270EE0CB0]();
}

uint64_t sub_25E3B58E8()
{
  return MEMORY[0x270EE0CB8]();
}

uint64_t sub_25E3B58F8()
{
  return MEMORY[0x270EE0CD0]();
}

uint64_t sub_25E3B5908()
{
  return MEMORY[0x270EE0D18]();
}

uint64_t sub_25E3B5918()
{
  return MEMORY[0x270EE0D28]();
}

uint64_t sub_25E3B5938()
{
  return MEMORY[0x270EE0E88]();
}

uint64_t sub_25E3B5948()
{
  return MEMORY[0x270EE0FB0]();
}

uint64_t sub_25E3B5958()
{
  return MEMORY[0x270EE11D8]();
}

uint64_t sub_25E3B5968()
{
  return MEMORY[0x270EE1250]();
}

uint64_t sub_25E3B5978()
{
  return MEMORY[0x270EE1270]();
}

uint64_t sub_25E3B5988()
{
  return MEMORY[0x270EE1700]();
}

uint64_t sub_25E3B5998()
{
  return MEMORY[0x270EE1710]();
}

uint64_t sub_25E3B59A8()
{
  return MEMORY[0x270EE1718]();
}

uint64_t sub_25E3B59B8()
{
  return MEMORY[0x270EE1720]();
}

uint64_t sub_25E3B59C8()
{
  return MEMORY[0x270F07E88]();
}

uint64_t sub_25E3B59D8()
{
  return MEMORY[0x270EE1918]();
}

uint64_t sub_25E3B59E8()
{
  return MEMORY[0x270EE1938]();
}

uint64_t sub_25E3B59F8()
{
  return MEMORY[0x270EE1958]();
}

uint64_t sub_25E3B5A18()
{
  return MEMORY[0x270EE1A20]();
}

uint64_t sub_25E3B5A28()
{
  return MEMORY[0x270EE1B80]();
}

uint64_t sub_25E3B5A48()
{
  return MEMORY[0x270EE1C48]();
}

uint64_t sub_25E3B5A58()
{
  return MEMORY[0x270EE1CA0]();
}

uint64_t sub_25E3B5A68()
{
  return MEMORY[0x270EE1CC0]();
}

uint64_t sub_25E3B5A88()
{
  return MEMORY[0x270EEF868]();
}

uint64_t sub_25E3B5A98()
{
  return MEMORY[0x270EEF870]();
}

uint64_t sub_25E3B5AA8()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_25E3B5AB8()
{
  return MEMORY[0x270EEF8C8]();
}

uint64_t sub_25E3B5AC8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25E3B5AD8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25E3B5AE8()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_25E3B5AF8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25E3B5B08()
{
  return MEMORY[0x270FA1168]();
}

uint64_t sub_25E3B5B18()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25E3B5B28()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25E3B5B38()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_25E3B5B48()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_25E3B5B58()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_25E3B5B68()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25E3B5B78()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25E3B5B88()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25E3B5B98()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25E3B5BA8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25E3B5BB8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_25E3B5BC8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_25E3B5BD8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25E3B5BE8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25E3B5BF8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25E3B5C08()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25E3B5C18()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25E3B5C28()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25E3B5C38()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25E3B5C48()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25E3B5C58()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25E3B5C68()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x270F10758]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x270F107B8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x270F107C8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x270F109A8]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}