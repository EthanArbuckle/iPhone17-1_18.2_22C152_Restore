void RTCommonCalculateDistanceHighPrecision(double a1, double a2, double a3, double a4)
{
  RTCommonCalculateDistanceRadius(1, a1, a2, a3, a4);
}

void RTCommonCalculateDistanceRadius(int a1, double a2, double a3, double a4, double a5)
{
  double v7 = (a2 + a4) * 0.0174532925;
  if (a3 < 0.0) {
    a3 = a3 + 360.0;
  }
  if (a5 < 0.0) {
    a5 = a5 + 360.0;
  }
  double v8 = a5 - a3;
  if (v8 <= 180.0)
  {
    if (v8 < -180.0) {
      double v8 = v8 + 360.0;
    }
  }
  else
  {
    double v8 = v8 + -360.0;
  }
  double v9 = v7 * 0.5;
  double v10 = (a4 - a2) * 0.0174532925;
  unsigned int v11 = (int)v8;
  if ((int)v8 < 0) {
    unsigned int v11 = -v11;
  }
  int v12 = (int)a4 - (int)a2;
  if (v12 < 0) {
    int v12 = (int)a2 - (int)a4;
  }
  double v13 = v8 * 0.0174532925;
  if (v12 > 2 || v11 > 2)
  {
    if (a1) {
      sin(v9);
    }
    long double v14 = sin(v10 * 0.5);
    long double v15 = v14 * v14;
    double v16 = cos(a2 * 0.0174532925);
    long double v17 = v16 * cos(a4 * 0.0174532925);
    long double v18 = sin(v13 * 0.5);
    double v19 = v15 + v17 * (v18 * v18);
    double v20 = 1.0 - v19;
    if (v19 < 0.0) {
      double v19 = 0.0;
    }
    if (v20 < 0.0) {
      double v20 = 0.0;
    }
    atan2(sqrt(v19), sqrt(v20));
  }
  else
  {
    __sincos_stret(v9);
  }
}

void RTCommonCalculateBoundingBox(double *a1, double *a2, double *a3, double *a4, double a5, double a6, double a7)
{
  if (a1 && a2 && a3)
  {
    if (a4)
    {
      double v16 = 0.0;
      double v17 = 0.0;
      RTCommonGetDestinationCoordinate(&v17, &v16, a5, a6, 0.0, a7);
      double v14 = vabdd_f64(v17, a5);
      RTCommonGetDestinationCoordinate(&v17, &v16, a5, a6, 90.0, a7);
      double v15 = vabdd_f64(v16, a6);
      *a1 = a5 - v14;
      *a3 = v14 + a5;
      *a2 = a6 - v15;
      *a4 = v15 + a6;
    }
  }
}

double RTCommonGetDestinationCoordinate(double *a1, double *a2, double a3, double a4, double a5, double a6)
{
  double v8 = a4 * 0.0174532925;
  double v9 = a5 * 0.0174532925;
  double v10 = a6 / 6378137.0;
  __double2 v11 = __sincos_stret(a3 * 0.0174532925);
  __double2 v12 = __sincos_stret(v10);
  __double2 v13 = __sincos_stret(v9);
  long double v14 = asin(v13.__cosval * (v11.__cosval * v12.__sinval) + v11.__sinval * v12.__cosval);
  long double v15 = sin(v14);
  long double v16 = atan2(v11.__cosval * (v13.__sinval * v12.__sinval), v12.__cosval - v11.__sinval * v15);
  *a1 = v14 / 0.0174532925;
  double result = (v8 + v16) / 0.0174532925;
  *a2 = result;
  return result;
}

id sub_25B6E2F3C()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SMActivityManager()), sel_init);
  qword_26B349488 = (uint64_t)result;
  return result;
}

id static SMActivityManager.shared.getter()
{
  if (qword_26B3494C0 != -1) {
    swift_once();
  }
  v0 = (void *)qword_26B349488;
  return v0;
}

void sub_25B6E3174(void *a1, uint64_t a2, int a3)
{
}

uint64_t sub_25B6E317C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  *(unsigned char *)(v7 + 160) = a7;
  *(void *)(v7 + 32) = a5;
  *(void *)(v7 + 40) = a6;
  *(void *)(v7 + 24) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A50D8E0);
  *(void *)(v7 + 48) = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50D838);
  *(void *)(v7 + 56) = v8;
  *(void *)(v7 + 64) = *(void *)(v8 - 8);
  *(void *)(v7 + 72) = swift_task_alloc();
  sub_25B757EC0();
  *(void *)(v7 + 80) = swift_task_alloc();
  *(void *)(v7 + 88) = swift_task_alloc();
  sub_25B7582B0();
  *(void *)(v7 + 96) = swift_task_alloc();
  *(void *)(v7 + 104) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A50D8E8);
  *(void *)(v7 + 112) = swift_task_alloc();
  uint64_t v9 = sub_25B758060();
  *(void *)(v7 + 120) = v9;
  *(void *)(v7 + 128) = *(void *)(v9 - 8);
  *(void *)(v7 + 136) = swift_task_alloc();
  *(void *)(v7 + 144) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25B6E338C, 0, 0);
}

uint64_t sub_25B6E338C()
{
  uint64_t v30 = v0;
  v1 = *(void **)(v0 + 24);
  sub_25B758050();
  if ((objc_msgSend(v1, sel_isPromptState) & 1) != 0
    || objc_msgSend(*(id *)(v0 + 24), sel_isCacheReleasedState))
  {
    uint64_t v3 = *(void *)(v0 + 136);
    uint64_t v2 = *(void *)(v0 + 144);
    uint64_t v4 = *(void *)(v0 + 120);
    uint64_t v5 = *(void *)(v0 + 128);
    sub_25B758040();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v2, v3, v4);
    if (qword_26B3494B0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_25B758230();
    __swift_project_value_buffer(v6, (uint64_t)qword_26B349558);
    swift_retain_n();
    uint64_t v7 = sub_25B758210();
    os_log_type_t v8 = sub_25B758450();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v29 = v10;
      *(_DWORD *)uint64_t v9 = 136315138;
      uint64_t v11 = sub_25B757F90();
      *(void *)(v0 + 16) = sub_25B6E424C(v11, v12, &v29);
      sub_25B7584C0();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_25B6E0000, v7, v8, "Alerting with only haptics - (%s)", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261168610](v10, -1, -1);
      MEMORY[0x261168610](v9, -1, -1);
    }
    else
    {
      swift_release_n();
    }
  }
  int v13 = *(unsigned __int8 *)(v0 + 160);
  long double v14 = *(void **)(v0 + 24);
  _s13SafetyMonitor25SMInitiatorAlertUtilitiesC10alertTitle4with11addTimeMode12shortStrings05watchM0SSSo21SMSessionManagerStateCSg_S3btFZ_0(v14, 0, 0, 0);
  _s13SafetyMonitor25SMInitiatorAlertUtilitiesC12alertMessage4with11addTimeMode19isWatchNotification12shortStrings05watchP0SSSo21SMSessionManagerStateCSg_S4btFZ_0(v14, 0, 1, 0, 0);
  if (v13 == 1)
  {
    uint64_t v15 = *(void *)(v0 + 128);
    uint64_t v25 = *(void *)(v0 + 136);
    uint64_t v26 = *(void *)(v0 + 120);
    uint64_t v27 = *(void *)(v0 + 144);
    sub_25B7582A0();
    sub_25B758290();
    sub_25B758280();
    swift_bridgeObjectRelease();
    sub_25B758290();
    sub_25B757EB0();
    sub_25B7582A0();
    sub_25B758290();
    sub_25B758280();
    swift_bridgeObjectRelease();
    sub_25B758290();
    sub_25B757EB0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v25, v27, v26);
    sub_25B758070();
    uint64_t v16 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v16 = 1;
  }
  uint64_t v17 = *(void *)(v0 + 112);
  uint64_t v18 = *(void *)(v0 + 48);
  uint64_t v19 = sub_25B758080();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v17, v16, 1, v19);
  uint64_t v20 = sub_25B757F50();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v18, 1, 1, v20);
  sub_25B6E5AE8();
  sub_25B6E5B3C();
  sub_25B6E5B90();
  sub_25B758030();
  v28 = (uint64_t (*)(uint64_t, uint64_t))((int)*MEMORY[0x263EFB508] + MEMORY[0x263EFB508]);
  v21 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v21;
  void *v21 = v0;
  v21[1] = sub_25B6E3878;
  uint64_t v22 = *(void *)(v0 + 112);
  uint64_t v23 = *(void *)(v0 + 72);
  return v28(v23, v22);
}

uint64_t sub_25B6E3878()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 72);
  uint64_t v2 = *(void *)(*(void *)v0 + 64);
  uint64_t v3 = *(void *)(*(void *)v0 + 56);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return MEMORY[0x270FA2498](sub_25B6E39D0, 0, 0);
}

uint64_t sub_25B6E39D0()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[16];
  sub_25B6E5BE4(v0[14], &qword_26A50D8E8);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_25B6E3B5C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25B757FE0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3494A0);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B349498);
  uint64_t v8 = sub_25B757F80();
  uint64_t v9 = (uint64_t *)(v1 + OBJC_IVAR___SMActivityManagerInternal_activities);
  swift_beginAccess();
  *uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  unint64_t v10 = *v9;
  if (!(v10 >> 62))
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v11) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_25B758560();
  uint64_t v11 = result;
  if (!result) {
    return swift_bridgeObjectRelease();
  }
LABEL_3:
  if (v11 >= 1)
  {
    uint64_t v14 = 0;
    v32 = (void (**)(char *, uint64_t))(v3 + 8);
    unint64_t v33 = v10 & 0xC000000000000001;
    *(void *)&long long v13 = 136315138;
    long long v29 = v13;
    v28[1] = MEMORY[0x263F8EE58] + 8;
    uint64_t v30 = v5;
    uint64_t v31 = v7;
    do
    {
      if (v33) {
        MEMORY[0x261167AD0](v14, v10);
      }
      else {
        swift_retain();
      }
      if (qword_26B3494B0 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_25B758230();
      __swift_project_value_buffer(v16, (uint64_t)qword_26B349558);
      swift_retain_n();
      uint64_t v17 = sub_25B758210();
      os_log_type_t v18 = sub_25B758450();
      if (os_log_type_enabled(v17, v18))
      {
        unint64_t v19 = v10;
        uint64_t v20 = v2;
        uint64_t v21 = swift_slowAlloc();
        uint64_t v22 = v11;
        uint64_t v23 = swift_slowAlloc();
        uint64_t v34 = v23;
        *(_DWORD *)uint64_t v21 = v29;
        uint64_t v24 = sub_25B757F90();
        *(void *)(v21 + 4) = sub_25B6E424C(v24, v25, &v34);
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25B6E0000, v17, v18, "Ending activity -  (%s)", (uint8_t *)v21, 0xCu);
        swift_arrayDestroy();
        uint64_t v26 = v23;
        uint64_t v11 = v22;
        MEMORY[0x261168610](v26, -1, -1);
        uint64_t v27 = v21;
        uint64_t v2 = v20;
        unint64_t v10 = v19;
        uint64_t v5 = v30;
        uint64_t v7 = v31;
        MEMORY[0x261168610](v27, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      ++v14;
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50D838);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v7, 1, 1, v15);
      sub_25B757FD0();
      sub_25B757FA0();
      swift_release();
      (*v32)(v5, v2);
      sub_25B6E5BE4((uint64_t)v7, (uint64_t *)&unk_26B3494A0);
    }
    while (v11 != v14);
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

BOOL sub_25B6E3F98()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B349498);
  uint64_t v2 = sub_25B757F80();
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR___SMActivityManagerInternal_activities);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  unint64_t v4 = *v3;
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25B758560();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return v5 != 0;
}

id SMActivityManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SMActivityManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25B6E419C()
{
  uint64_t v0 = sub_25B758230();
  __swift_allocate_value_buffer(v0, qword_26B349558);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B349558);
  swift_bridgeObjectRetain();
  return sub_25B758220();
}

void *sub_25B6E4230@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_25B6E4240(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_25B6E424C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25B6E4320(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25B6E5808((uint64_t)v12, *a3);
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
      sub_25B6E5808((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_25B6E4320(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25B7584D0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25B6E44DC(a5, a6);
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
  uint64_t v8 = sub_25B758530();
  if (!v8)
  {
    sub_25B758550();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25B758570();
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

uint64_t sub_25B6E44DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25B6E4574(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25B6E4754(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25B6E4754(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25B6E4574(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25B6E46EC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25B758500();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25B758550();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25B758350();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25B758570();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25B758550();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25B6E46EC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A50D8C0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25B6E4754(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A50D8C0);
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
  long long v13 = a4 + 32;
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
  uint64_t result = sub_25B758570();
  __break(1u);
  return result;
}

unsigned char **sub_25B6E48A4(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void sub_25B6E48B4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25B758020();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  size_t v5 = (char *)v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A50D8E0);
  MEMORY[0x270FA5388]();
  int64_t v7 = (char *)v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50D838);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v48 = (char *)v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B349498);
  uint64_t v11 = sub_25B757F80();
  uint64_t v12 = (uint64_t *)(v1 + OBJC_IVAR___SMActivityManagerInternal_activities);
  swift_beginAccess();
  *uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  if ((unint64_t)*v12 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_25B758560();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = *(void *)((*v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v13)
  {
    if (qword_26B3494B0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_25B758230();
    __swift_project_value_buffer(v14, (uint64_t)qword_26B349558);
    uint64_t v15 = sub_25B758210();
    os_log_type_t v16 = sub_25B758470();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_25B6E0000, v15, v16, "Unable to start live activity - another activity is already active", v17, 2u);
      MEMORY[0x261168610](v17, -1, -1);
    }
  }
  else
  {
    uint64_t v46 = v8;
    if (qword_26B3494B0 != -1) {
      swift_once();
    }
    uint64_t v44 = v2;
    uint64_t v45 = v9;
    v43 = v5;
    uint64_t v47 = v3;
    uint64_t v18 = sub_25B758230();
    v42[0] = __swift_project_value_buffer(v18, (uint64_t)qword_26B349558);
    unint64_t v19 = sub_25B758210();
    os_log_type_t v20 = sub_25B758450();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_25B6E0000, v19, v20, "Starting live activity", v21, 2u);
      MEMORY[0x261168610](v21, -1, -1);
    }

    uint64_t v22 = sub_25B7582F0();
    v42[1] = v23;
    v42[2] = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A50D908);
    uint64_t v24 = sub_25B757FC0();
    uint64_t v25 = *(void *)(v24 - 8);
    uint64_t v26 = *(void *)(v25 + 72);
    unint64_t v27 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_25B75D420;
    long long v29 = (uint64_t *)(v28 + v27);
    *long long v29 = sub_25B7582F0();
    v29[1] = v30;
    uint64_t v31 = *MEMORY[0x263EFB550];
    v32 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v25 + 104);
    v32(v29, v31, v24);
    unint64_t v33 = (uint64_t *)((char *)v29 + v26);
    *unint64_t v33 = sub_25B7582F0();
    v33[1] = v34;
    v32(v33, v31, v24);
    uint64_t v35 = sub_25B757F50();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v7, 1, 1, v35);
    sub_25B6E5AE8();
    sub_25B6E5B3C();
    sub_25B6E5B90();
    v36 = v48;
    sub_25B758030();
    sub_25B757FF0();
    v37 = v43;
    sub_25B758000();
    sub_25B758010();
    sub_25B757FB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    uint64_t v38 = swift_retain();
    MEMORY[0x261167940](v38);
    uint64_t v39 = v44;
    uint64_t v40 = v45;
    uint64_t v41 = v47;
    if (*(void *)((*v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_25B7583D0();
    }
    sub_25B7583E0();
    sub_25B7583C0();
    swift_endAccess();
    swift_release();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v37, v39);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v36, v46);
  }
}

void sub_25B6E50B0(void *a1, int a2)
{
  uint64_t v3 = v2;
  LODWORD(v4) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3494B8);
  MEMORY[0x270FA5388]();
  int64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B349498);
  uint64_t v8 = sub_25B757F80();
  uint64_t v9 = (uint64_t *)&v3[OBJC_IVAR___SMActivityManagerInternal_activities];
  swift_beginAccess();
  *uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  uint64_t v10 = *v9;
  if ((unint64_t)*v9 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_25B758560()) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v11)
    {
LABEL_3:
      if ((v10 & 0xC000000000000001) != 0)
      {
        uint64_t v12 = MEMORY[0x261167AD0](0, v10);
LABEL_6:
        swift_bridgeObjectRelease();
        if (objc_msgSend(a1, sel_sessionState) == (id)1)
        {
          if (qword_26B3494B0 != -1) {
            swift_once();
          }
          uint64_t v13 = sub_25B758230();
          __swift_project_value_buffer(v13, (uint64_t)qword_26B349558);
          uint64_t v14 = sub_25B758210();
          os_log_type_t v15 = sub_25B758470();
          if (os_log_type_enabled(v14, v15))
          {
            os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)os_log_type_t v16 = 0;
            _os_log_impl(&dword_25B6E0000, v14, v15, "Session is not active - end the activity instead of updating", v16, 2u);
            MEMORY[0x261168610](v16, -1, -1);
          }

          sub_25B6E3B5C();
          swift_release();
        }
        else
        {
          if (qword_26B3494B0 != -1) {
            swift_once();
          }
          uint64_t v17 = sub_25B758230();
          __swift_project_value_buffer(v17, (uint64_t)qword_26B349558);
          swift_retain_n();
          uint64_t v18 = sub_25B758210();
          os_log_type_t v19 = sub_25B758450();
          if (os_log_type_enabled(v18, v19))
          {
            uint64_t v20 = swift_slowAlloc();
            int v34 = (int)v4;
            uint64_t v4 = (uint8_t *)v20;
            uint64_t v21 = swift_slowAlloc();
            uint64_t v37 = v21;
            *(_DWORD *)uint64_t v4 = 136315138;
            uint64_t v35 = v3;
            uint64_t v22 = sub_25B757F90();
            uint64_t v36 = sub_25B6E424C(v22, v23, &v37);
            uint64_t v3 = v35;
            sub_25B7584C0();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_25B6E0000, v18, v19, "Updating live activity - (%s)", v4, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x261168610](v21, -1, -1);
            uint64_t v24 = v4;
            LOBYTE(v4) = v34;
            MEMORY[0x261168610](v24, -1, -1);
          }
          else
          {

            swift_release_n();
          }
          uint64_t v25 = sub_25B758430();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v7, 1, 1, v25);
          uint64_t v26 = swift_allocObject();
          *(void *)(v26 + 16) = 0;
          *(void *)(v26 + 24) = 0;
          *(void *)(v26 + 32) = a1;
          *(void *)(v26 + 40) = v3;
          *(void *)(v26 + 48) = v12;
          *(unsigned char *)(v26 + 56) = v4 & 1;
          id v27 = a1;
          uint64_t v28 = v3;
          sub_25B6F2730((uint64_t)v7, (uint64_t)&unk_26A50D8D8, v26);
          swift_release();
        }
        return;
      }
      if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        uint64_t v12 = *(void *)(v10 + 32);
        swift_retain();
        goto LABEL_6;
      }
      __break(1u);
      goto LABEL_25;
    }
  }
  swift_bridgeObjectRelease();
  if (qword_26B3494B0 != -1) {
LABEL_25:
  }
    swift_once();
  uint64_t v29 = sub_25B758230();
  __swift_project_value_buffer(v29, (uint64_t)qword_26B349558);
  uint64_t v30 = sub_25B758210();
  os_log_type_t v31 = sub_25B758470();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v32 = 0;
    _os_log_impl(&dword_25B6E0000, v30, v31, "Unable to update live activity - no activities found", v32, 2u);
    MEMORY[0x261168610](v32, -1, -1);
  }
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t type metadata accessor for SMActivityManager()
{
  return self;
}

uint64_t method lookup function for SMActivityManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SMActivityManager);
}

uint64_t dispatch thunk of SMActivityManager.startActivity(with:localState:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SMActivityManager.updateActivity(with:localState:shouldNotify:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SMActivityManager.endActivities()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of SMActivityManager.hasActivity()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

void type metadata accessor for SMInitiatorEligibilityStatus(uint64_t a1)
{
}

void type metadata accessor for SMSessionState(uint64_t a1)
{
}

void sub_25B6E5770(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_25B6E5808(uint64_t a1, uint64_t a2)
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

uint64_t sub_25B6E58CC()
{
  swift_unknownObjectRelease();

  swift_release();
  return MEMORY[0x270FA0238](v0, 57, 7);
}

uint64_t sub_25B6E591C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  char v9 = *(unsigned char *)(v1 + 56);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_25B6E59F4;
  return sub_25B6E317C(a1, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_25B6E59F4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_25B6E5AE8()
{
  unint64_t result = qword_26A50D8F0;
  if (!qword_26A50D8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50D8F0);
  }
  return result;
}

unint64_t sub_25B6E5B3C()
{
  unint64_t result = qword_26A50D8F8;
  if (!qword_26A50D8F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50D8F8);
  }
  return result;
}

unint64_t sub_25B6E5B90()
{
  unint64_t result = qword_26A50D900;
  if (!qword_26A50D900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50D900);
  }
  return result;
}

uint64_t sub_25B6E5BE4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25B6E5D7C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DAA0);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  os_log_type_t v16 = (char *)&v59 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  os_log_type_t v19 = (char *)&v59 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v59 - v20;
  if (!a1) {
    goto LABEL_8;
  }
  unint64_t v22 = a1[2];
  if (!(v22 | a3))
  {
    if (qword_26A50D6D8 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_25B758230();
    __swift_project_value_buffer(v23, (uint64_t)qword_26A510020);
    uint64_t v24 = sub_25B758210();
    os_log_type_t v25 = sub_25B758470();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_25B6E0000, v24, v25, "Live Activity, deepLinkURL, unable to resolve conversation", v26, 2u);
      MEMORY[0x261168610](v26, -1, -1);
    }

    goto LABEL_8;
  }
  if (v22 < 2)
  {
    if (v22) {
      goto LABEL_15;
    }
LABEL_8:
    uint64_t v27 = sub_25B757F00();
    uint64_t v28 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56);
    return v28(a5, 1, 1, v27);
  }
  if (!a3)
  {
LABEL_15:
    uint64_t v30 = a1[5];
    uint64_t v65 = a1[4];
    uint64_t v66 = v30;
    swift_bridgeObjectRetain();
    int v67 = 0;
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  int v67 = 1;
  uint64_t v65 = a2;
  uint64_t v66 = a3;
LABEL_16:
  if (qword_26A50D6D8 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_25B758230();
  __swift_project_value_buffer(v31, (uint64_t)qword_26A510020);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v32 = sub_25B758210();
  os_log_type_t v33 = sub_25B758450();
  int v64 = v33;
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = swift_slowAlloc();
    uint64_t v63 = a5;
    uint64_t v35 = v34;
    uint64_t v61 = swift_slowAlloc();
    uint64_t v70 = v61;
    *(_DWORD *)uint64_t v35 = 136315650;
    int v62 = a4;
    uint64_t v68 = (uint64_t)a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DAA8);
    os_log_t v60 = v32;
    uint64_t v36 = sub_25B7584A0();
    uint64_t v68 = sub_25B6E424C(v36, v37, &v70);
    sub_25B7584C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 12) = 2080;
    uint64_t v68 = a2;
    uint64_t v69 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DAB0);
    uint64_t v38 = sub_25B7584A0();
    uint64_t v68 = sub_25B6E424C(v38, v39, &v70);
    LOBYTE(a4) = v62;
    sub_25B7584C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 22) = 1024;
    LODWORD(v68) = a4 & 1;
    sub_25B7584C0();
    os_log_t v40 = v60;
    _os_log_impl(&dword_25B6E0000, v60, (os_log_type_t)v64, "Live Activity, deepLinkURL, receiverHandles, %s, groupID, %s, isSessionActive, %{BOOL}d", (uint8_t *)v35, 0x1Cu);
    uint64_t v41 = v61;
    swift_arrayDestroy();
    MEMORY[0x261168610](v41, -1, -1);
    uint64_t v42 = v35;
    a5 = v63;
    MEMORY[0x261168610](v42, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v43 = self;
  uint64_t v44 = (void *)sub_25B7582E0();
  swift_bridgeObjectRelease();
  if (a4)
  {
    if (v67)
    {
      uint64_t v45 = (void *)sub_25B758390();
      id v46 = objc_msgSend(v43, sel_createURLToDetailViewForGroupID_recipientHandles_, v44, v45);

      if (v46)
      {
        sub_25B757EF0();

        uint64_t v47 = sub_25B757F00();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v16, 0, 1, v47);
      }
      else
      {
        uint64_t v54 = sub_25B757F00();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v16, 1, 1, v54);
      }
      uint64_t v55 = (uint64_t)v16;
    }
    else
    {
      id v50 = objc_msgSend(v43, sel_createURLToDetailViewForRecipientHandle_, v44);

      if (v50)
      {
        sub_25B757EF0();

        uint64_t v51 = sub_25B757F00();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v13, 0, 1, v51);
      }
      else
      {
        uint64_t v57 = sub_25B757F00();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v13, 1, 1, v57);
      }
      uint64_t v55 = (uint64_t)v13;
    }
  }
  else if (v67)
  {
    id v48 = objc_msgSend(v43, sel_createURLToConversationForGroupID_, v44);

    if (v48)
    {
      sub_25B757EF0();

      uint64_t v49 = sub_25B757F00();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v21, 0, 1, v49);
    }
    else
    {
      uint64_t v56 = sub_25B757F00();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v21, 1, 1, v56);
    }
    uint64_t v55 = (uint64_t)v21;
  }
  else
  {
    id v52 = objc_msgSend(v43, sel_createURLToConversationForRecipientHandle_, v44);

    if (v52)
    {
      sub_25B757EF0();

      uint64_t v53 = sub_25B757F00();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v19, 0, 1, v53);
    }
    else
    {
      uint64_t v58 = sub_25B757F00();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(v19, 1, 1, v58);
    }
    uint64_t v55 = (uint64_t)v19;
  }
  return sub_25B6EDE48(v55, a5, &qword_26A50DAA0);
}

id SMInitiatorAlertUtilities.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SMInitiatorAlertUtilities.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SMInitiatorAlertUtilities();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SMInitiatorAlertUtilities.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SMInitiatorAlertUtilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25B6E6630()
{
  uint64_t v0 = sub_25B758230();
  __swift_allocate_value_buffer(v0, qword_26A510020);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A510020);
  swift_bridgeObjectRetain();
  return sub_25B758220();
}

uint64_t sub_25B6E66C8(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  sub_25B6E424C(0xD00000000000004DLL, 0x800000025B75EB50, a3);
  uint64_t v4 = *a1 + 8;
  uint64_t result = sub_25B7584C0();
  *a1 = v4;
  return result;
}

uint64_t sub_25B6E6730(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25B6E6750(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25B6E6750(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DAB8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25B758570();
  __break(1u);
  return result;
}

id _s13SafetyMonitor25SMInitiatorAlertUtilitiesC21recipientsDisplayNameySSSgSo14SMConversationCSgFZ_0(id result)
{
  uint64_t v44 = 0;
  unint64_t v45 = 0;
  if (result)
  {
    id v1 = result;
    unint64_t v2 = (unint64_t)result;
    id v3 = objc_msgSend((id)v2, sel_receiverHandles);
    sub_25B6EDC70(0, (unint64_t *)&unk_26A50DDC0);
    unint64_t v4 = sub_25B7583A0();

    if (v4 >> 62)
    {
LABEL_38:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_25B758560();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v5 >= 2)
    {
      id v6 = objc_msgSend((id)v2, sel_displayName);
      if (v6)
      {
        int64_t v7 = v6;
        uint64_t v8 = sub_25B7582F0();
        unint64_t v10 = v9;

        uint64_t v44 = v8;
        unint64_t v45 = v10;
        uint64_t v11 = qword_26A50D6D8;
        swift_bridgeObjectRetain();
        if (v11 != -1) {
          swift_once();
        }
        uint64_t v12 = sub_25B758230();
        __swift_project_value_buffer(v12, (uint64_t)qword_26A510020);
        swift_bridgeObjectRetain();
        uint64_t v13 = sub_25B758210();
        os_log_type_t v14 = sub_25B758450();
        if (!os_log_type_enabled(v13, v14))
        {

          swift_bridgeObjectRelease_n();
          goto LABEL_36;
        }
        uint64_t v15 = swift_slowAlloc();
        uint64_t v16 = swift_slowAlloc();
        v43[0] = v16;
        *(_DWORD *)uint64_t v15 = 136315394;
        sub_25B6E424C(0xD000000000000019, 0x800000025B75EAE0, v43);
        sub_25B7584C0();
        *(_WORD *)(v15 + 12) = 2080;
        swift_bridgeObjectRetain();
        sub_25B6E424C(v8, v10, v43);
        sub_25B7584C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25B6E0000, v13, v14, "%s, got group chat display name %s", (uint8_t *)v15, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x261168610](v16, -1, -1);
        uint64_t v17 = v15;
LABEL_33:
        MEMORY[0x261168610](v17, -1, -1);

LABEL_36:
        swift_beginAccess();
        return (id)v44;
      }
      if (qword_26A50D6D8 == -1)
      {
LABEL_31:
        uint64_t v37 = sub_25B758230();
        __swift_project_value_buffer(v37, (uint64_t)qword_26A510020);
        uint64_t v13 = sub_25B758210();
        os_log_type_t v38 = sub_25B758450();
        if (!os_log_type_enabled(v13, v38))
        {

          goto LABEL_36;
        }
        unint64_t v39 = (uint8_t *)swift_slowAlloc();
        uint64_t v40 = swift_slowAlloc();
        v43[0] = v40;
        *(_DWORD *)unint64_t v39 = 136315138;
        sub_25B6E424C(0xD000000000000019, 0x800000025B75EAE0, v43);
        sub_25B7584C0();
        _os_log_impl(&dword_25B6E0000, v13, v38, "%s, no custom group chat display name found", v39, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261168610](v40, -1, -1);
        uint64_t v17 = (uint64_t)v39;
        goto LABEL_33;
      }
LABEL_44:
      swift_once();
      goto LABEL_31;
    }
    if (qword_26A50D7D0 != -1) {
      swift_once();
    }
    unint64_t v2 = (unint64_t)(id)v2;
    unint64_t v18 = sub_25B6F67A4(v1);

    if (v18 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_25B758560();
      swift_bridgeObjectRelease();
      uint64_t v41 = (void *)v2;
      if (v19) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v41 = (void *)v2;
      if (v19)
      {
LABEL_15:
        v43[0] = MEMORY[0x263F8EE78];
        sub_25B6E6730(0, v19 & ~(v19 >> 63), 0);
        if (v19 < 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        uint64_t v20 = (void *)v43[0];
        id v42 = self;
        uint64_t v21 = 0;
        unint64_t v4 = v18 & 0xC000000000000001;
        id v1 = (void *)v18;
        do
        {
          if (v19 == v21)
          {
            __break(1u);
            goto LABEL_38;
          }
          if (v4) {
            id v22 = (id)MEMORY[0x261167AD0](v21, v18);
          }
          else {
            id v22 = *(id *)(v18 + 8 * v21 + 32);
          }
          uint64_t v23 = v22;
          uint64_t result = objc_msgSend(v42, sel_componentsForContact_, v22, v41);
          if (!result)
          {
            __break(1u);
            return result;
          }
          uint64_t v24 = result;
          id v25 = objc_msgSend(self, sel_localizedStringFromPersonNameComponents_style_options_, result, 1, 0);
          uint64_t v26 = sub_25B7582F0();
          uint64_t v28 = v27;

          v43[0] = (uint64_t)v20;
          unint64_t v2 = v20[2];
          unint64_t v29 = v20[3];
          if (v2 >= v29 >> 1)
          {
            sub_25B6E6730(v29 > 1, v2 + 1, 1);
            uint64_t v20 = (void *)v43[0];
          }
          ++v21;
          v20[2] = v2 + 1;
          uint64_t v30 = &v20[2 * v2];
          v30[4] = v26;
          v30[5] = v28;
          unint64_t v18 = (unint64_t)v1;
        }
        while (v19 != v21);
        swift_bridgeObjectRelease();
        if (!v20[2]) {
          goto LABEL_41;
        }
        goto LABEL_26;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v20 = (void *)MEMORY[0x263F8EE78];
    if (!*(void *)(MEMORY[0x263F8EE78] + 16))
    {
LABEL_41:
      swift_bridgeObjectRelease();
      __break(1u);
LABEL_42:
      swift_once();
LABEL_27:
      uint64_t v32 = sub_25B758230();
      __swift_project_value_buffer(v32, (uint64_t)qword_26A510020);
      swift_bridgeObjectRetain();
      os_log_type_t v33 = sub_25B758210();
      os_log_type_t v34 = sub_25B758450();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        v43[0] = v36;
        *(_DWORD *)uint64_t v35 = 136315394;
        sub_25B6E424C(0xD000000000000019, 0x800000025B75EAE0, v43);
        sub_25B7584C0();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        sub_25B6E424C(v19, v4, v43);
        sub_25B7584C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25B6E0000, v33, v34, "%s, got contact name \"%s\"", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x261168610](v36, -1, -1);
        MEMORY[0x261168610](v35, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      goto LABEL_36;
    }
LABEL_26:
    uint64_t v19 = v20[4];
    unint64_t v4 = v20[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v44 = v19;
    unint64_t v45 = v4;
    uint64_t v31 = qword_26A50D6D8;
    swift_bridgeObjectRetain();
    if (v31 == -1) {
      goto LABEL_27;
    }
    goto LABEL_42;
  }
  return result;
}

uint64_t _s13SafetyMonitor25SMInitiatorAlertUtilitiesC10alertTitle4with11addTimeMode12shortStrings05watchM0SSSo21SMSessionManagerStateCSg_S3btFZ_0(void *a1, char a2, int a3, int a4)
{
  int v111 = a4;
  LODWORD(v112) = a3;
  uint64_t v6 = sub_25B7582B0();
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  v104 = &v98[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v105 = &v98[-v10];
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v108 = &v98[-v12];
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v106 = &v98[-v14];
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = &v98[-v19];
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50D8E0);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  v107 = &v98[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v109 = &v98[-v25];
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v28 = &v98[-v27];
  MEMORY[0x270FA5388](v26);
  v110 = &v98[-v29];
  uint64_t v30 = sub_25B757F70();
  MEMORY[0x270FA5388](v30 - 8);
  uint64_t v31 = sub_25B7582D0();
  MEMORY[0x270FA5388](v31 - 8);
  if (a2)
  {
    sub_25B758270();
    sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v33 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    sub_25B757F60();
    return sub_25B758300();
  }
  if (!a1)
  {
LABEL_8:
    if (qword_26A50D6D8 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_25B758230();
    __swift_project_value_buffer(v41, (uint64_t)qword_26A510020);
    id v42 = sub_25B758210();
    os_log_type_t v43 = sub_25B758470();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 136315138;
      v114[0] = v45;
      uint64_t v113 = sub_25B6E424C(0xD000000000000037, 0x800000025B760EE0, v114);
      sub_25B7584C0();
      _os_log_impl(&dword_25B6E0000, v42, v43, "Invalid Session State in %s!", v44, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261168610](v45, -1, -1);
      MEMORY[0x261168610](v44, -1, -1);
    }

    sub_25B758270();
    sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
    uint64_t v46 = swift_getObjCClassFromMetadata();
    id v47 = objc_msgSend(self, sel_bundleForClass_, v46);
    sub_25B757F60();
    return sub_25B758310();
  }
  id v35 = a1;
  id v36 = objc_msgSend(v35, sel_configuration);
  if (!v36)
  {

    goto LABEL_8;
  }
  id v101 = v36;
  v102 = v20;
  id v37 = objc_msgSend(v35, sel_configuration);
  if (v37)
  {
    os_log_type_t v38 = v37;
    id v39 = v35;
    id v40 = objc_msgSend(v37, sel_conversation);

    unsigned int v99 = objc_msgSend(v40, sel_isGroup);
    id v35 = v39;
  }
  else
  {
    unsigned int v99 = 0;
  }
  id v103 = v35;
  id v50 = objc_msgSend(v35, sel_configuration);
  if (v50)
  {
    uint64_t v51 = v50;
    id v52 = objc_msgSend(v50, sel_conversation);
  }
  else
  {
    id v52 = 0;
  }
  id v100 = _s13SafetyMonitor25SMInitiatorAlertUtilitiesC21recipientsDisplayNameySSSgSo14SMConversationCSgFZ_0(v52);
  uint64_t v54 = v53;

  id v55 = v103;
  switch((unint64_t)objc_msgSend(v103, sel_sessionState))
  {
    case 2uLL:
      swift_bridgeObjectRelease();
      id v56 = objc_msgSend(v55, sel_estimatedEndDateStatus);
      char v57 = v111;
      if (v56 == (id)2 && (v111 & 1) == 0) {
        goto LABEL_85;
      }
      id v62 = objc_msgSend(v55, sel_estimatedEndDateStatus);
      char v63 = (char)v112;
      if (v62 != (id)3 || (v112 & 1) != 0 || (v57 & 1) != 0) {
        goto LABEL_80;
      }
      id v64 = objc_msgSend(v55, sel_estimatedEndDate);
      if (v64)
      {
        uint64_t v65 = v64;
        sub_25B757F30();

        uint64_t v66 = sub_25B757F50();
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56))(v28, 0, 1, v66);
      }
      else
      {
        uint64_t v66 = sub_25B757F50();
        (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56))(v28, 1, 1, v66);
      }
      v73 = v110;
      sub_25B6EDE48((uint64_t)v28, (uint64_t)v110, &qword_26A50D8E0);
      sub_25B757F50();
      uint64_t v74 = *(void *)(v66 - 8);
      v75 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v74 + 48);
      if (v75(v73, 1, v66) != 1)
      {
        id v112 = (id)sub_25B757F10();
        v81 = *(void (**)(unsigned char *, uint64_t))(v74 + 8);
        v81(v73, v66);
        id v82 = objc_msgSend(v103, sel_coarseEstimatedEndDate);
        if (v82)
        {
          v83 = v82;
          uint64_t v84 = (uint64_t)v107;
          sub_25B757F30();

          uint64_t v85 = 0;
        }
        else
        {
          uint64_t v85 = 1;
          uint64_t v84 = (uint64_t)v107;
        }
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v74 + 56))(v84, v85, 1, v66);
        v89 = v109;
        sub_25B6EDE48(v84, (uint64_t)v109, &qword_26A50D8E0);
        if (v75(v89, 1, v66) == 1)
        {
          sub_25B6EDEAC((uint64_t)v89);
          sub_25B7582A0();
          sub_25B758290();
          id v90 = v112;
          id v91 = objc_msgSend(v112, sel_absoluteTimeString_preposition_capitalized_, 0, 0, 0);
          sub_25B7582F0();

          sub_25B758280();
          swift_bridgeObjectRelease();
          sub_25B758290();
          sub_25B7582C0();
          sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
          uint64_t v92 = swift_getObjCClassFromMetadata();
          id v93 = objc_msgSend(self, sel_bundleForClass_, v92);
          sub_25B757F60();
          uint64_t v48 = sub_25B758310();
        }
        else
        {
          v94 = (void *)sub_25B757F10();
          v81(v89, v66);
          sub_25B7582A0();
          sub_25B758290();
          id v95 = objc_msgSend(v94, sel_absoluteTimeString_preposition_capitalized_, 0, 0, 0);
          sub_25B7582F0();

          sub_25B758280();
          swift_bridgeObjectRelease();
          sub_25B758290();
          sub_25B7582C0();
          sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
          uint64_t v96 = swift_getObjCClassFromMetadata();
          id v97 = objc_msgSend(self, sel_bundleForClass_, v96);
          sub_25B757F60();
          uint64_t v48 = sub_25B758310();
        }
        return v48;
      }
      sub_25B6EDEAC((uint64_t)v73);
      id v55 = v103;
LABEL_80:
      if (objc_msgSend(v55, sel_estimatedEndDateStatus) != (id)3
        || (id v76 = objc_msgSend(v55, sel_configuration)) == 0
        || (v77 = v76, id v78 = objc_msgSend(v76, sel_sessionType), v77, v78 != (id)4)
        || (v57 & 1) != 0
        || (v63 & 1) != 0)
      {
LABEL_85:
        sub_25B758270();
        sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
        uint64_t v79 = swift_getObjCClassFromMetadata();
        id v59 = objc_msgSend(self, sel_bundleForClass_, v79);
        goto LABEL_86;
      }
      goto LABEL_53;
    case 4uLL:
      if (v112)
      {
        if (!v99) {
          goto LABEL_69;
        }
        if (v54)
        {
          sub_25B7582A0();
          sub_25B758290();
          sub_25B758280();
          swift_bridgeObjectRelease();
          sub_25B758290();
          sub_25B7582C0();
        }
        else
        {
          sub_25B758270();
        }
        sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
        uint64_t v60 = swift_getObjCClassFromMetadata();
        objc_msgSend(self, sel_bundleForClass_, v60);
        sub_25B757F60();
        goto LABEL_70;
      }
      if (v111) {
        goto LABEL_35;
      }
      id v69 = v101;
      if (objc_msgSend(v101, sel_sessionType) == (id)1)
      {
        if (v99)
        {
          if (!v54) {
            goto LABEL_53;
          }
          goto LABEL_69;
        }
      }
      else if (v99)
      {
        if (!v54) {
          goto LABEL_53;
        }
        goto LABEL_69;
      }
      sub_25B7582A0();
      sub_25B758290();
      sub_25B758280();
      swift_bridgeObjectRelease();
      sub_25B758290();
      sub_25B7582C0();
      sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
      uint64_t v87 = swift_getObjCClassFromMetadata();
      id v88 = objc_msgSend(self, sel_bundleForClass_, v87);
      sub_25B757F60();
      uint64_t v48 = sub_25B758310();
      id v80 = v69;
      goto LABEL_89;
    case 7uLL:
      swift_bridgeObjectRelease();
      if (v112 & 1) != 0 || (v111) {
        goto LABEL_53;
      }
      goto LABEL_51;
    case 9uLL:
      swift_bridgeObjectRelease();
      if (v112 & 1) != 0 || (v111) {
        goto LABEL_51;
      }
      goto LABEL_53;
    case 0xCuLL:
      if (v112)
      {
        if (objc_msgSend(v55, sel_sessionEndReason) == (id)9)
        {
LABEL_35:
          swift_bridgeObjectRelease();
          sub_25B758270();
          sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
          uint64_t v61 = swift_getObjCClassFromMetadata();
          objc_msgSend(self, sel_bundleForClass_, v61);
          sub_25B757F60();
          goto LABEL_70;
        }
        if (!v99 || v54) {
          goto LABEL_69;
        }
LABEL_51:
        sub_25B758270();
        sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
        uint64_t v67 = swift_getObjCClassFromMetadata();
        objc_msgSend(self, sel_bundleForClass_, v67);
        sub_25B757F60();
        goto LABEL_70;
      }
      if (v111)
      {
        swift_bridgeObjectRelease();
        objc_msgSend(v55, sel_sessionEndReason);
        goto LABEL_51;
      }
      if (objc_msgSend(v55, sel_sessionEndReason) == (id)1)
      {
        if (v99)
        {
          if (v54) {
            goto LABEL_69;
          }
LABEL_53:
          sub_25B758270();
          sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
          uint64_t v68 = swift_getObjCClassFromMetadata();
          objc_msgSend(self, sel_bundleForClass_, v68);
          sub_25B757F60();
        }
        else
        {
          sub_25B7582A0();
          sub_25B758290();
          sub_25B758280();
          swift_bridgeObjectRelease();
          sub_25B758290();
          sub_25B7582C0();
          sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
          uint64_t v86 = swift_getObjCClassFromMetadata();
          objc_msgSend(self, sel_bundleForClass_, v86);
          sub_25B757F60();
        }
      }
      else
      {
        if (objc_msgSend(v55, sel_sessionEndReason) != (id)9)
        {
          if (v99 && !v54) {
            goto LABEL_51;
          }
LABEL_69:
          sub_25B7582A0();
          sub_25B758290();
          sub_25B758280();
          swift_bridgeObjectRelease();
          sub_25B758290();
          sub_25B7582C0();
          sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
          uint64_t v70 = swift_getObjCClassFromMetadata();
          objc_msgSend(self, sel_bundleForClass_, v70);
          sub_25B757F60();
LABEL_70:
          uint64_t v71 = sub_25B758300();
          goto LABEL_88;
        }
        swift_bridgeObjectRelease();
        sub_25B758270();
        sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
        uint64_t v72 = swift_getObjCClassFromMetadata();
        objc_msgSend(self, sel_bundleForClass_, v72);
        sub_25B757F60();
      }
LABEL_87:
      uint64_t v71 = sub_25B758310();
LABEL_88:
      uint64_t v48 = v71;
      id v80 = v101;
LABEL_89:

      return v48;
    case 0xEuLL:
      swift_bridgeObjectRelease();
      if (v112 & 1) != 0 || (v111) {
        goto LABEL_53;
      }
      goto LABEL_51;
    default:
      swift_bridgeObjectRelease();
      sub_25B758270();
      sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
      uint64_t v58 = swift_getObjCClassFromMetadata();
      id v59 = objc_msgSend(self, sel_bundleForClass_, v58);
LABEL_86:
      v59;
      sub_25B757F60();
      goto LABEL_87;
  }
}

uint64_t _s13SafetyMonitor25SMInitiatorAlertUtilitiesC12alertMessage4with11addTimeMode19isWatchNotification12shortStrings05watchP0SSSo21SMSessionManagerStateCSg_S4btFZ_0(void *a1, char a2, int a3, int a4, int a5)
{
  int v266 = a5;
  LODWORD(v261) = a3;
  v265 = (void *)sub_25B758230();
  uint64_t v260 = *(v265 - 1);
  uint64_t v8 = MEMORY[0x270FA5388](v265);
  v259 = (char *)&v224 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v257 = (char *)&v224 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50D8E0);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  v251 = (char *)&v224 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v252 = (uint64_t)&v224 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v254 = (char *)&v224 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v255 = (uint64_t)&v224 - v19;
  MEMORY[0x270FA5388](v18);
  v256 = (char *)&v224 - v20;
  uint64_t v21 = sub_25B7582B0();
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  v248 = (char *)&v224 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v243 = (char *)&v224 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  v242 = (char *)&v224 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  v240 = (char *)&v224 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  v232 = (char *)&v224 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  v238 = (char *)&v224 - v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  v234 = (char *)&v224 - v35;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  v231 = (char *)&v224 - v37;
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  v233 = (char *)&v224 - v39;
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  v237 = (char *)&v224 - v41;
  uint64_t v42 = MEMORY[0x270FA5388](v40);
  v244 = (char *)&v224 - v43;
  uint64_t v44 = MEMORY[0x270FA5388](v42);
  v241 = (char *)&v224 - v45;
  uint64_t v46 = MEMORY[0x270FA5388](v44);
  v239 = (char *)&v224 - v47;
  uint64_t v48 = MEMORY[0x270FA5388](v46);
  v236 = (char *)&v224 - v49;
  uint64_t v50 = MEMORY[0x270FA5388](v48);
  v235 = (char *)&v224 - v51;
  uint64_t v52 = MEMORY[0x270FA5388](v50);
  v246 = (char *)&v224 - v53;
  uint64_t v54 = MEMORY[0x270FA5388](v52);
  uint64_t v55 = MEMORY[0x270FA5388](v54);
  uint64_t v56 = MEMORY[0x270FA5388](v55);
  v249 = (char *)&v224 - v57;
  uint64_t v58 = MEMORY[0x270FA5388](v56);
  v245 = (char *)&v224 - v59;
  uint64_t v60 = MEMORY[0x270FA5388](v58);
  v247 = (char *)&v224 - v61;
  uint64_t v62 = MEMORY[0x270FA5388](v60);
  v253 = (char *)&v224 - v63;
  uint64_t v64 = MEMORY[0x270FA5388](v62);
  v258 = (char *)&v224 - v65;
  MEMORY[0x270FA5388](v64);
  uint64_t v66 = sub_25B757F50();
  isa = v66[-1].isa;
  v262 = v66;
  v263 = isa;
  uint64_t v68 = MEMORY[0x270FA5388](v66);
  v250 = (char *)&v224 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = MEMORY[0x270FA5388](v68);
  uint64_t v72 = (char *)&v224 - v71;
  MEMORY[0x270FA5388](v70);
  uint64_t v74 = (char *)&v224 - v73;
  uint64_t v75 = sub_25B757F70();
  MEMORY[0x270FA5388](v75 - 8);
  v77 = (char *)&v224 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_25B7582D0();
  MEMORY[0x270FA5388](v78 - 8);
  id v80 = (char *)&v224 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
LABEL_12:
    sub_25B758270();
    sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    sub_25B757F60();
    return sub_25B758310();
  }
  int v229 = a4;
  v230 = v80;
  v264 = v77;
  if (!a1)
  {
LABEL_7:
    if (qword_26A50D6D8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer((uint64_t)v265, (uint64_t)qword_26A510020);
    uint64_t v86 = sub_25B758210();
    os_log_type_t v87 = sub_25B758470();
    if (os_log_type_enabled(v86, v87))
    {
      id v88 = (uint8_t *)swift_slowAlloc();
      uint64_t v89 = swift_slowAlloc();
      v268[0] = v89;
      *(_DWORD *)id v88 = 136315138;
      uint64_t v267 = sub_25B6E424C(0xD00000000000004DLL, 0x800000025B75EB50, v268);
      sub_25B7584C0();
      _os_log_impl(&dword_25B6E0000, v86, v87, "Invalid Session State in %s!", v88, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261168610](v89, -1, -1);
      MEMORY[0x261168610](v88, -1, -1);
    }

    goto LABEL_12;
  }
  id v81 = a1;
  id v82 = objc_msgSend(v81, sel_configuration);
  if (!v82)
  {

    goto LABEL_7;
  }
  id v227 = v82;
  id v83 = objc_msgSend(v81, sel_configuration);
  id v228 = v81;
  if (v83)
  {
    uint64_t v84 = v83;
    id v85 = objc_msgSend(v83, sel_conversation);

    unsigned int v225 = objc_msgSend(v85, sel_isGroup);
    id v81 = v228;
  }
  else
  {
    unsigned int v225 = 0;
  }
  id v93 = objc_msgSend(v81, sel_configuration);
  if (v93)
  {
    v94 = v93;
    id v95 = objc_msgSend(v93, (SEL)&_OBJC_LABEL_PROTOCOL___IDSServiceDelegate + 3);
  }
  else
  {
    id v95 = 0;
  }
  id v224 = _s13SafetyMonitor25SMInitiatorAlertUtilitiesC21recipientsDisplayNameySSSgSo14SMConversationCSgFZ_0(v95);
  uint64_t v226 = v96;

  id v97 = v228;
  switch((unint64_t)objc_msgSend(v228, sel_sessionState))
  {
    case 2uLL:
      id v110 = v227;
      id v111 = objc_msgSend(v227, sel_sessionType);
      if (v111 == (id)4)
      {
        if (v266 & 1) != 0 || (v229)
        {
          swift_bridgeObjectRelease();
          sub_25B758270();
          sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
          uint64_t v180 = swift_getObjCClassFromMetadata();
          id v181 = objc_msgSend(self, sel_bundleForClass_, v180);
          sub_25B757F60();
          uint64_t v182 = sub_25B758300();
        }
        else
        {
          if (v225)
          {
            if (!v226) {
              goto LABEL_42;
            }
            goto LABEL_102;
          }
          sub_25B7582A0();
          sub_25B758290();
          sub_25B758280();
          swift_bridgeObjectRelease();
          sub_25B758290();
          sub_25B7582C0();
          sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
          uint64_t v195 = swift_getObjCClassFromMetadata();
          id v196 = objc_msgSend(self, sel_bundleForClass_, v195);
          sub_25B757F60();
          uint64_t v182 = sub_25B758310();
        }
        uint64_t v91 = v182;

        return v91;
      }
      if (v111 == (id)2)
      {
        id v151 = objc_msgSend(v97, sel_estimatedEndDate);
        v152 = v263;
        if (v151)
        {
          v153 = v151;
          uint64_t v154 = (uint64_t)v254;
          sub_25B757F30();

          v155 = (void (*)(char *, uint64_t, uint64_t, NSObject *))v152[7].isa;
          v156 = (char *)v154;
          uint64_t v157 = 0;
        }
        else
        {
          v155 = (void (*)(char *, uint64_t, uint64_t, NSObject *))v263[7].isa;
          uint64_t v154 = (uint64_t)v254;
          v156 = v254;
          uint64_t v157 = 1;
        }
        v184 = v262;
        v155(v156, v157, 1, v262);
        uint64_t v185 = v255;
        sub_25B6EDE48(v154, v255, &qword_26A50D8E0);
        v186 = (unsigned int (*)(uint64_t, uint64_t, NSObject *))v152[6].isa;
        if (v186(v185, 1, v184) == 1)
        {
          sub_25B6EDEAC(v185);
          if (v229)
          {
            if (v225 && !v226)
            {
LABEL_70:
              sub_25B758270();
              sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
              uint64_t v175 = swift_getObjCClassFromMetadata();
              id v176 = objc_msgSend(self, sel_bundleForClass_, v175);
              sub_25B757F60();
LABEL_71:
              uint64_t v177 = sub_25B758300();
LABEL_94:
              uint64_t v91 = v177;
LABEL_120:

              return v91;
            }
LABEL_102:
            sub_25B7582A0();
            sub_25B758290();
            sub_25B758280();
            swift_bridgeObjectRelease();
            sub_25B758290();
            sub_25B7582C0();
            sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
            uint64_t v197 = swift_getObjCClassFromMetadata();
            id v198 = objc_msgSend(self, sel_bundleForClass_, v197);
            sub_25B757F60();
            goto LABEL_71;
          }
          if (v225)
          {
            if (v226) {
              goto LABEL_102;
            }
LABEL_42:
            sub_25B758270();
            sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
            uint64_t v142 = swift_getObjCClassFromMetadata();
            objc_msgSend(self, sel_bundleForClass_, v142);
            sub_25B757F60();
          }
          else
          {
            sub_25B7582A0();
            sub_25B758290();
            sub_25B758280();
            swift_bridgeObjectRelease();
            sub_25B758290();
            sub_25B7582C0();
            sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
            uint64_t v213 = swift_getObjCClassFromMetadata();
            objc_msgSend(self, sel_bundleForClass_, v213);
            sub_25B757F60();
          }
LABEL_93:
          uint64_t v177 = sub_25B758310();
          goto LABEL_94;
        }
        v187 = (void *)sub_25B757F10();
        v262 = v152[1].isa;
        ((void (*)(uint64_t, NSObject *))v262)(v185, v184);
        v265 = v187;
        id v188 = objc_msgSend(v97, sel_coarseEstimatedEndDate);
        if (v188)
        {
          v189 = v188;
          v190 = v251;
          sub_25B757F30();

          uint64_t v191 = (uint64_t)v190;
          uint64_t v192 = 0;
        }
        else
        {
          uint64_t v192 = 1;
          uint64_t v191 = (uint64_t)v251;
        }
        v155((char *)v191, v192, 1, v184);
        uint64_t v199 = v252;
        sub_25B6EDE48(v191, v252, &qword_26A50D8E0);
        if (v186(v199, 1, v184) == 1)
        {
          sub_25B6EDEAC(v199);
          v200 = 0;
          id v201 = v265;
        }
        else
        {
          v202 = (void *)sub_25B757F10();
          ((void (*)(uint64_t, NSObject *))v262)(v199, v184);
          id v201 = v202;

          v200 = v201;
        }
        uint64_t v203 = v226;
        id v204 = objc_msgSend(v201, sel_absoluteTimeString_preposition_capitalized_, 0, 0, 0);
        sub_25B7582F0();

        if (v229)
        {
          if (v225)
          {
            if (v203)
            {
LABEL_110:
              sub_25B7582A0();
              sub_25B758290();
              sub_25B758280();
              swift_bridgeObjectRelease();
              sub_25B758290();
              sub_25B758280();
              swift_bridgeObjectRelease();
              sub_25B758290();
              sub_25B7582C0();
              sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
              uint64_t v205 = swift_getObjCClassFromMetadata();
              id v206 = objc_msgSend(self, sel_bundleForClass_, v205);
              sub_25B757F60();
LABEL_111:
              uint64_t v207 = sub_25B758300();
LABEL_145:
              uint64_t v91 = v207;

              return v91;
            }
            goto LABEL_142;
          }
          goto LABEL_123;
        }
        if (objc_msgSend(v97, sel_estimatedEndDateStatus) == (id)1)
        {
          if (v266)
          {
LABEL_114:
            swift_bridgeObjectRelease();
            sub_25B7582A0();
            sub_25B758290();
            sub_25B758280();
            swift_bridgeObjectRelease();
            sub_25B758290();
            sub_25B7582C0();
            sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
            uint64_t v208 = swift_getObjCClassFromMetadata();
            objc_msgSend(self, sel_bundleForClass_, v208);
            sub_25B757F60();
            goto LABEL_144;
          }
          swift_bridgeObjectRelease();
          id v217 = objc_msgSend(v201, sel_absoluteTimeString_preposition_capitalized_, 0, 1, 0);
          sub_25B7582F0();

          if (!v225)
          {
LABEL_123:
            sub_25B7582A0();
            sub_25B758290();
            sub_25B758280();
            swift_bridgeObjectRelease();
            sub_25B758290();
            sub_25B758280();
            swift_bridgeObjectRelease();
            sub_25B758290();
            sub_25B7582C0();
            sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
            uint64_t v214 = swift_getObjCClassFromMetadata();
            objc_msgSend(self, sel_bundleForClass_, v214);
            sub_25B757F60();
            goto LABEL_144;
          }
          if (v203) {
            goto LABEL_110;
          }
        }
        else
        {
          if (objc_msgSend(v97, sel_estimatedEndDateStatus) == (id)3 && (v266 & 1) != 0) {
            goto LABEL_114;
          }
          swift_bridgeObjectRelease();
          if (objc_msgSend(v97, sel_estimatedEndDateStatus) == (id)2 && (v266 & 1) != 0)
          {
            swift_bridgeObjectRelease();
            sub_25B758270();
            sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
            uint64_t v218 = swift_getObjCClassFromMetadata();
            objc_msgSend(self, sel_bundleForClass_, v218);
            sub_25B757F60();
            goto LABEL_144;
          }
          if (v225)
          {
            if (v203)
            {
              sub_25B7582A0();
              sub_25B758290();
              sub_25B758280();
              swift_bridgeObjectRelease();
              sub_25B758290();
              sub_25B7582C0();
              sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
              uint64_t v220 = swift_getObjCClassFromMetadata();
              id v221 = objc_msgSend(self, sel_bundleForClass_, v220);
              sub_25B757F60();
              goto LABEL_111;
            }
            sub_25B758270();
            sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
            uint64_t v223 = swift_getObjCClassFromMetadata();
            objc_msgSend(self, sel_bundleForClass_, v223);
            sub_25B757F60();
LABEL_144:
            uint64_t v207 = sub_25B758310();
            goto LABEL_145;
          }
        }
LABEL_142:
        sub_25B7582A0();
        sub_25B758290();
        sub_25B758280();
        swift_bridgeObjectRelease();
        sub_25B758290();
        sub_25B7582C0();
        sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
        uint64_t v222 = swift_getObjCClassFromMetadata();
        objc_msgSend(self, sel_bundleForClass_, v222);
        sub_25B757F60();
        goto LABEL_144;
      }
      id v112 = v263;
      if (v111 == (id)1)
      {
        swift_bridgeObjectRelease();
        id v113 = objc_msgSend(v110, sel_time);
        if (v113)
        {
          v114 = v113;
          id v115 = objc_msgSend(v113, sel_timeBound);

          sub_25B757F30();
          v116 = (void (*)(char *, char *, NSObject *))v112[4].isa;
          uint64_t v117 = (uint64_t)v256;
          v118 = v262;
          v116(v256, v74, v262);
          ((void (*)(uint64_t, void, uint64_t, NSObject *))v112[7].isa)(v117, 0, 1, v118);
          if (((unsigned int (*)(uint64_t, uint64_t, NSObject *))v112[6].isa)(v117, 1, v118) != 1)
          {
            v119 = v250;
            v116(v250, (char *)v117, v118);
            v120 = (void *)sub_25B757F10();
            id v121 = objc_msgSend(v120, sel_absoluteTimeString_preposition_capitalized_, 0, 2, 0);

            sub_25B7582F0();
            if (v229)
            {
              sub_25B7582A0();
              sub_25B758290();
              sub_25B758280();
              swift_bridgeObjectRelease();
              sub_25B758290();
              sub_25B7582C0();
              sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
              uint64_t v122 = swift_getObjCClassFromMetadata();
              id v123 = objc_msgSend(self, sel_bundleForClass_, v122);
              sub_25B757F60();
              uint64_t v91 = sub_25B758310();

              ((void (*)(char *, NSObject *))v112[1].isa)(v119, v118);
            }
            else if (v266)
            {
              swift_bridgeObjectRelease();
              v209 = v250;
              v210 = (void *)sub_25B757F10();
              id v211 = objc_msgSend(v210, (SEL)&_OBJC_LABEL_PROTOCOL___SMReceiverProtocol + 1, 0, 0, 0);

              sub_25B7582F0();
              objc_msgSend(v97, sel_estimatedEndDateStatus);
              sub_25B7582A0();
              sub_25B758290();
              sub_25B758280();
              swift_bridgeObjectRelease();
              sub_25B758290();
              sub_25B7582C0();
              sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
              uint64_t v219 = swift_getObjCClassFromMetadata();
              objc_msgSend(self, sel_bundleForClass_, v219);
              sub_25B757F60();
              uint64_t v91 = sub_25B758310();

              ((void (*)(char *, NSObject *))v112[1].isa)(v209, v118);
            }
            else
            {
              sub_25B7582A0();
              sub_25B758290();
              sub_25B758280();
              swift_bridgeObjectRelease();
              sub_25B758290();
              sub_25B7582C0();
              sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
              uint64_t v215 = swift_getObjCClassFromMetadata();
              id v216 = objc_msgSend(self, sel_bundleForClass_, v215);
              sub_25B757F60();
              uint64_t v91 = sub_25B758310();

              ((void (*)(char *, NSObject *))v112[1].isa)(v250, v118);
            }
            return v91;
          }
        }
        else
        {
          uint64_t v117 = (uint64_t)v256;
          ((void (*)(char *, uint64_t, uint64_t, NSObject *))v112[7].isa)(v256, 1, 1, v262);
        }
        sub_25B6EDEAC(v117);
        sub_25B758270();
        sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
        uint64_t v193 = swift_getObjCClassFromMetadata();
        objc_msgSend(self, sel_bundleForClass_, v193);
        sub_25B757F60();
        goto LABEL_93;
      }
      swift_bridgeObjectRelease();
      if (qword_26A50D6D8 != -1) {
        swift_once();
      }
      v158 = v265;
      uint64_t v159 = __swift_project_value_buffer((uint64_t)v265, (uint64_t)qword_26A510020);
      (*(void (**)(char *, uint64_t, void *))(v260 + 16))(v257, v159, v158);
      uint64_t v160 = swift_allocObject();
      id v161 = v227;
      *(void *)(v160 + 16) = v227;
      v262 = v161;
      v162 = sub_25B758210();
      LODWORD(v263) = sub_25B758470();
      uint64_t v163 = swift_allocObject();
      *(unsigned char *)(v163 + 16) = 32;
      uint64_t v164 = swift_allocObject();
      *(unsigned char *)(v164 + 16) = 8;
      uint64_t v165 = swift_allocObject();
      *(unsigned char *)(v165 + 16) = 0;
      uint64_t v166 = swift_allocObject();
      *(unsigned char *)(v166 + 16) = 8;
      uint64_t v167 = swift_allocObject();
      *(void *)(v167 + 16) = sub_25B6EDD98;
      *(void *)(v167 + 24) = v160;
      uint64_t v168 = swift_allocObject();
      *(void *)(v168 + 16) = sub_25B6EDF0C;
      *(void *)(v168 + 24) = v167;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DAC8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_25B75D530;
      *(void *)(inited + 32) = sub_25B6EDF10;
      *(void *)(inited + 40) = v163;
      *(void *)(inited + 48) = sub_25B6EDF10;
      *(void *)(inited + 56) = v164;
      *(void *)(inited + 64) = sub_25B6E66C4;
      *(void *)(inited + 72) = 0;
      *(void *)(inited + 80) = sub_25B6EDF10;
      *(void *)(inited + 88) = v165;
      *(void *)(inited + 96) = sub_25B6EDF10;
      *(void *)(inited + 104) = v166;
      *(void *)(inited + 112) = sub_25B6EDD94;
      *(void *)(inited + 120) = v168;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      os_log_type_t v170 = v263;
      v263 = v162;
      if (os_log_type_enabled(v162, v170))
      {
        v171 = (uint8_t *)swift_slowAlloc();
        uint64_t v261 = swift_slowAlloc();
        v268[0] = v261;
        *(_WORD *)v171 = 514;
        v171[2] = 32;
        swift_release();
        v171[3] = 8;
        swift_release();
        uint64_t v267 = sub_25B6E424C(0xD00000000000004DLL, 0x800000025B75EB50, v268);
        sub_25B7584C0();
        v171[12] = 0;
        swift_release();
        v171[13] = 8;
        swift_release();
        v138 = v262;
        id v172 = [v262 sessionType];

        swift_release();
        uint64_t v267 = (uint64_t)v172;
        sub_25B7584C0();
        swift_release();
        swift_release();
        v173 = v263;
        _os_log_impl(&dword_25B6E0000, v263, v170, "Invalid session type in %s: %lu", v171, 0x16u);
        uint64_t v174 = v261;
        swift_arrayDestroy();
        MEMORY[0x261168610](v174, -1, -1);
        MEMORY[0x261168610](v171, -1, -1);
      }
      else
      {

        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        v138 = v262;

        swift_release();
      }
      (*(void (**)(char *, void *))(v260 + 8))(v257, v265);
      id v147 = v228;
LABEL_82:
      sub_25B758270();
      sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
      uint64_t v183 = swift_getObjCClassFromMetadata();
      id v148 = objc_msgSend(self, sel_bundleForClass_, v183);
      sub_25B757F60();
      uint64_t v91 = sub_25B758310();

      return v91;
    case 4uLL:
      swift_bridgeObjectRelease();
      if (v229 & 1) != 0 || (v266 & 1) != 0 || (v261) {
        goto LABEL_42;
      }
      goto LABEL_70;
    case 7uLL:
    case 9uLL:
    case 0xEuLL:
      id v98 = objc_msgSend(v97, sel_cacheReleaseDate);
      sub_25B757F30();

      sub_25B757F40();
      LOBYTE(v98) = sub_25B757F20();
      unsigned int v99 = v97;
      id v100 = (void (*)(char *, NSObject *))v263[1].isa;
      id v101 = v72;
      v102 = v262;
      v100(v101, v262);
      v100(v74, v102);
      if (v98)
      {
        id v103 = objc_msgSend(v99, sel_cacheReleaseDate);
        uint64_t v104 = v226;
        if (!v103)
        {
          swift_bridgeObjectRelease();
          __break(1u);
          JUMPOUT(0x25B6EDBECLL);
        }
        v105 = v103;
        id v97 = v99;
        id v106 = objc_msgSend(v103, sel_relativeTimeString);
        sub_25B7582F0();

        if (v229)
        {
          swift_bridgeObjectRelease();
          sub_25B7582A0();
          sub_25B758290();
          sub_25B758280();
          swift_bridgeObjectRelease();
          sub_25B758290();
          sub_25B7582C0();
          sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
          uint64_t v107 = swift_getObjCClassFromMetadata();
          objc_msgSend(self, sel_bundleForClass_, v107);
          sub_25B757F60();
LABEL_23:
          uint64_t v108 = sub_25B758300();
LABEL_119:
          uint64_t v91 = v108;

          goto LABEL_120;
        }
        if (v261)
        {
          if (v225)
          {
            if (v104)
            {
LABEL_50:
              sub_25B7582A0();
              sub_25B758290();
              sub_25B758280();
              swift_bridgeObjectRelease();
              sub_25B758290();
              sub_25B758280();
              swift_bridgeObjectRelease();
              sub_25B758290();
              sub_25B7582C0();
              sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
              uint64_t v146 = swift_getObjCClassFromMetadata();
              objc_msgSend(self, sel_bundleForClass_, v146);
              sub_25B757F60();
              goto LABEL_23;
            }
            goto LABEL_117;
          }
        }
        else
        {
          if (v266)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (objc_msgSend(v99, sel_sessionState) != (id)14)
            {
              sub_25B758270();
              sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
              uint64_t v194 = swift_getObjCClassFromMetadata();
              objc_msgSend(self, sel_bundleForClass_, v194);
              sub_25B757F60();
              goto LABEL_23;
            }
            sub_25B758270();
            sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
            uint64_t v150 = swift_getObjCClassFromMetadata();
            objc_msgSend(self, sel_bundleForClass_, v150);
            sub_25B757F60();
LABEL_118:
            uint64_t v108 = sub_25B758310();
            goto LABEL_119;
          }
          if (v225)
          {
            if (v104) {
              goto LABEL_50;
            }
LABEL_117:
            sub_25B7582A0();
            sub_25B758290();
            sub_25B758280();
            swift_bridgeObjectRelease();
            sub_25B758290();
            sub_25B7582C0();
            sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
            uint64_t v212 = swift_getObjCClassFromMetadata();
            objc_msgSend(self, sel_bundleForClass_, v212);
            sub_25B757F60();
            goto LABEL_118;
          }
        }
        sub_25B7582A0();
        sub_25B758290();
        sub_25B758280();
        swift_bridgeObjectRelease();
        sub_25B758290();
        sub_25B758280();
        swift_bridgeObjectRelease();
        sub_25B758290();
        sub_25B7582C0();
        sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
        uint64_t v178 = swift_getObjCClassFromMetadata();
        objc_msgSend(self, sel_bundleForClass_, v178);
        sub_25B757F60();
        goto LABEL_118;
      }
      if (v261)
      {
        id v109 = v228;
        if (v225)
        {
          if (v226) {
            goto LABEL_46;
          }
LABEL_76:
          sub_25B758270();
          sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
          uint64_t v179 = swift_getObjCClassFromMetadata();
          objc_msgSend(self, sel_bundleForClass_, v179);
          sub_25B757F60();
          goto LABEL_77;
        }
      }
      else
      {
        id v109 = v228;
        if (v225)
        {
          if (v226)
          {
LABEL_46:
            sub_25B7582A0();
            sub_25B758290();
            sub_25B758280();
            swift_bridgeObjectRelease();
            sub_25B758290();
            sub_25B7582C0();
            sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
            uint64_t v143 = swift_getObjCClassFromMetadata();
            id v144 = objc_msgSend(self, sel_bundleForClass_, v143);
            sub_25B757F60();
            uint64_t v145 = sub_25B758300();
LABEL_78:
            uint64_t v91 = v145;

            return v91;
          }
          goto LABEL_76;
        }
      }
      sub_25B7582A0();
      sub_25B758290();
      sub_25B758280();
      swift_bridgeObjectRelease();
      sub_25B758290();
      sub_25B7582C0();
      sub_25B6EDC70(0, (unint64_t *)&qword_26A50DAC0);
      uint64_t v149 = swift_getObjCClassFromMetadata();
      objc_msgSend(self, sel_bundleForClass_, v149);
      sub_25B757F60();
LABEL_77:
      uint64_t v145 = sub_25B758310();
      goto LABEL_78;
    case 0xCuLL:
      swift_bridgeObjectRelease();
      goto LABEL_42;
    default:
      swift_bridgeObjectRelease();
      if (qword_26A50D6D8 != -1) {
        swift_once();
      }
      v124 = v265;
      uint64_t v125 = __swift_project_value_buffer((uint64_t)v265, (uint64_t)qword_26A510020);
      (*(void (**)(char *, uint64_t, void *))(v260 + 16))(v259, v125, v124);
      uint64_t v126 = swift_allocObject();
      id v127 = v227;
      *(void *)(v126 + 16) = v227;
      v263 = v127;
      v128 = sub_25B758210();
      LODWORD(v262) = sub_25B758470();
      uint64_t v129 = swift_allocObject();
      *(unsigned char *)(v129 + 16) = 32;
      uint64_t v130 = swift_allocObject();
      *(unsigned char *)(v130 + 16) = 8;
      uint64_t v131 = swift_allocObject();
      *(unsigned char *)(v131 + 16) = 0;
      uint64_t v132 = swift_allocObject();
      *(unsigned char *)(v132 + 16) = 8;
      uint64_t v133 = swift_allocObject();
      *(void *)(v133 + 16) = sub_25B6EDF14;
      *(void *)(v133 + 24) = v126;
      uint64_t v134 = swift_allocObject();
      *(void *)(v134 + 16) = sub_25B6EDD64;
      *(void *)(v134 + 24) = v133;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DAC8);
      uint64_t v135 = swift_initStackObject();
      *(_OWORD *)(v135 + 16) = xmmword_25B75D530;
      *(void *)(v135 + 32) = sub_25B6EDCF4;
      *(void *)(v135 + 40) = v129;
      *(void *)(v135 + 48) = sub_25B6EDF10;
      *(void *)(v135 + 56) = v130;
      *(void *)(v135 + 64) = sub_25B6E66C4;
      *(void *)(v135 + 72) = 0;
      *(void *)(v135 + 80) = sub_25B6EDF10;
      *(void *)(v135 + 88) = v131;
      *(void *)(v135 + 96) = sub_25B6EDF10;
      *(void *)(v135 + 104) = v132;
      *(void *)(v135 + 112) = sub_25B6EDD94;
      *(void *)(v135 + 120) = v134;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      os_log_type_t v136 = v262;
      v262 = v128;
      if (os_log_type_enabled(v128, v136))
      {
        v137 = (uint8_t *)swift_slowAlloc();
        uint64_t v261 = swift_slowAlloc();
        v268[0] = v261;
        *(_WORD *)v137 = 514;
        v137[2] = 32;
        swift_release();
        v137[3] = 8;
        swift_release();
        uint64_t v267 = sub_25B6E424C(0xD00000000000004DLL, 0x800000025B75EB50, v268);
        sub_25B7584C0();
        v137[12] = 0;
        swift_release();
        v137[13] = 8;
        swift_release();
        v138 = v263;
        id v139 = [v263 sessionType];

        swift_release();
        uint64_t v267 = (uint64_t)v139;
        sub_25B7584C0();
        swift_release();
        swift_release();
        v140 = v262;
        _os_log_impl(&dword_25B6E0000, v262, v136, "Invalid state in %s: %lu", v137, 0x16u);
        uint64_t v141 = v261;
        swift_arrayDestroy();
        MEMORY[0x261168610](v141, -1, -1);
        MEMORY[0x261168610](v137, -1, -1);
      }
      else
      {

        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        v138 = v263;

        swift_release();
      }
      (*(void (**)(char *, void *))(v260 + 8))(v259, v265);
      id v147 = v228;
      goto LABEL_82;
  }
}

uint64_t type metadata accessor for SMInitiatorAlertUtilities()
{
  return self;
}

uint64_t method lookup function for SMInitiatorAlertUtilities(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SMInitiatorAlertUtilities);
}

uint64_t dispatch thunk of static SMInitiatorAlertUtilities.deepLinkURL(for:with:and:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_25B6EDC70(uint64_t a1, unint64_t *a2)
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

uint64_t sub_25B6EDCAC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25B6EDCE4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char **sub_25B6EDCF4(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_25B6E48A4(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_25B6EDCFC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_25B6EDD0C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_25B6EDD1C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_25B6EDD2C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25B6EDD64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

id sub_25B6EDD98()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_sessionType);
}

uint64_t sub_25B6EDDA8()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_25B6EDDB8()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_25B6EDDC8()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_25B6EDDD8()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_25B6EDDE8(uint64_t *a1)
{
  (*(void (**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  uint64_t v3 = *a1 + 8;
  uint64_t result = sub_25B7584C0();
  *a1 = v3;
  return result;
}

uint64_t sub_25B6EDE48(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25B6EDEAC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50D8E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25B6EDF28()
{
  return 0;
}

uint64_t sub_25B6EDF34()
{
  return 0;
}

void sub_25B6EDF40(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_25B6EDF4C(uint64_t a1)
{
  unint64_t v2 = sub_25B6EE520();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B6EDF88(uint64_t a1)
{
  unint64_t v2 = sub_25B6EE520();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B6EDFC4(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0(a1);
}

uint64_t sub_25B6EDFEC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_25B6EE184(a1, a2, a3, &qword_26A50DAE0, (void (*)(void))sub_25B6EE520);
}

uint64_t sub_25B6EE028()
{
  return sub_25B7585E0();
}

uint64_t sub_25B6EE064()
{
  return sub_25B7585E0();
}

uint64_t sub_25B6EE098()
{
  return 1;
}

uint64_t sub_25B6EE0A0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_25B6EE0D0(uint64_t a1)
{
  unint64_t v2 = sub_25B6EE4CC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B6EE10C(uint64_t a1)
{
  unint64_t v2 = sub_25B6EE4CC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B6EE148(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_25B6EE184(a1, a2, a3, &qword_26A50DAD0, (void (*)(void))sub_25B6EE4CC);
}

uint64_t sub_25B6EE184(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(void))
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a5();
  sub_25B7585F0();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_25B6EE2A4()
{
  return sub_25B758370();
}

uint64_t sub_25B6EE304()
{
  return sub_25B758360();
}

ValueMetadata *type metadata accessor for SMActivityAttributes()
{
  return &type metadata for SMActivityAttributes;
}

ValueMetadata *type metadata accessor for SMActivityAttributes.ContentState()
{
  return &type metadata for SMActivityAttributes.ContentState;
}

unint64_t sub_25B6EE378()
{
  unint64_t result = qword_26B3494C8;
  if (!qword_26B3494C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3494C8);
  }
  return result;
}

unint64_t sub_25B6EE3D0()
{
  unint64_t result = qword_26B3494D8;
  if (!qword_26B3494D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3494D8);
  }
  return result;
}

unint64_t sub_25B6EE428()
{
  unint64_t result = qword_26B3494D0;
  if (!qword_26B3494D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3494D0);
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

unint64_t sub_25B6EE4CC()
{
  unint64_t result = qword_26A50DAD8;
  if (!qword_26A50DAD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50DAD8);
  }
  return result;
}

unint64_t sub_25B6EE520()
{
  unint64_t result = qword_26A50DAE8;
  if (!qword_26A50DAE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50DAE8);
  }
  return result;
}

unint64_t sub_25B6EE574()
{
  unint64_t result = qword_26A50DAF0;
  if (!qword_26A50DAF0)
  {
    type metadata accessor for SMSessionState(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50DAF0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SMActivityAttributes.ContentState.CodingKeys()
{
  return &type metadata for SMActivityAttributes.ContentState.CodingKeys;
}

ValueMetadata *type metadata accessor for SMActivityAttributes.CodingKeys()
{
  return &type metadata for SMActivityAttributes.CodingKeys;
}

unint64_t sub_25B6EE5F0()
{
  unint64_t result = qword_26A50DAF8;
  if (!qword_26A50DAF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50DAF8);
  }
  return result;
}

unint64_t sub_25B6EE648()
{
  unint64_t result = qword_26A50DB00;
  if (!qword_26A50DB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50DB00);
  }
  return result;
}

unint64_t sub_25B6EE6A0()
{
  unint64_t result = qword_26A50DB08;
  if (!qword_26A50DB08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50DB08);
  }
  return result;
}

unint64_t sub_25B6EE6F8()
{
  unint64_t result = qword_26A50DB10;
  if (!qword_26A50DB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50DB10);
  }
  return result;
}

uint64_t static SendValidityUtilities.sendMessageFailureAlertCannotSendTitle()()
{
  return sub_25B6EE7C8(&qword_26A50D770, &qword_26A50DC38);
}

uint64_t static SendValidityUtilities.sendMessageFailureAlertOKButtonText()()
{
  return sub_25B6EE7C8(&qword_26A50D778, &qword_26A50DC48);
}

uint64_t sub_25B6EE7C8(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

id sub_25B6EE844(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)sub_25B7582E0();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t static SendValidityUtilities.sendValidityAlertMessage(for:)(uint64_t a1)
{
  static SendValidity.sendValidity(from:)(a1, (uint64_t)&v2);
  return SendValidity.alertErrorMessage.getter();
}

uint64_t static SendValidity.sendValidity(from:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2 = 1;
  uint64_t v3 = 7;
  switch(result)
  {
    case 18:
    case 19:
      break;
    case 23:
      uint64_t v3 = 6;
      break;
    case 25:
      uint64_t v3 = 0;
      char v2 = 0;
      break;
    case 26:
      char v2 = 0;
      uint64_t v3 = 2;
      break;
    case 27:
      char v2 = 0;
      uint64_t v3 = 3;
      break;
    case 28:
      char v2 = 0;
      uint64_t v3 = 4;
      break;
    case 29:
      char v2 = 0;
      uint64_t v3 = 5;
      break;
    case 30:
      char v2 = 0;
      uint64_t v3 = 6;
      break;
    case 31:
      char v2 = 0;
      uint64_t v3 = 7;
      break;
    case 32:
      char v2 = 0;
      goto LABEL_13;
    case 33:
      char v2 = 0;
      uint64_t v3 = 9;
      break;
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
      uint64_t v3 = 1;
      break;
    case 50:
      char v2 = 0;
      uint64_t v3 = 10;
      break;
    case 51:
      char v2 = 0;
      uint64_t v3 = 11;
      break;
    case 52:
      char v2 = 0;
      uint64_t v3 = 12;
      break;
    default:
      char v2 = 1;
LABEL_13:
      uint64_t v3 = 8;
      break;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

uint64_t SendValidity.alertErrorMessage.getter()
{
  uint64_t v1 = *v0;
  if (*((unsigned char *)v0 + 8) == 1)
  {
    uint64_t v2 = 0;
    switch(v1)
    {
      case 1:
        if (qword_26A50D740 != -1) {
          swift_once();
        }
        uint64_t v3 = &qword_26A50DBD8;
        goto LABEL_6;
      case 2:
        if (qword_26A50D6E8 != -1) {
          swift_once();
        }
        uint64_t v3 = &qword_26A50DB28;
        goto LABEL_6;
      case 3:
      case 4:
      case 5:
      case 8:
        goto LABEL_3;
      case 6:
        if (qword_26A50D750 != -1) {
          swift_once();
        }
        uint64_t v3 = &qword_26A50DBF8;
        goto LABEL_6;
      case 7:
        if (qword_26A50D758 != -1) {
          swift_once();
        }
        uint64_t v3 = &qword_26A50DC08;
        goto LABEL_6;
      case 9:
        if (qword_26A50D748 != -1) {
          swift_once();
        }
        uint64_t v3 = &qword_26A50DBE8;
        goto LABEL_6;
      case 10:
        return v2;
      default:
        if (qword_26A50D6E0 != -1) {
          swift_once();
        }
        uint64_t v3 = &qword_26A50DB18;
        goto LABEL_6;
    }
  }
  else
  {
    uint64_t v2 = 0;
    switch(v1)
    {
      case 1:
        return v2;
      case 4:
        if (qword_26A50D788 != -1) {
          swift_once();
        }
        uint64_t v3 = &qword_26A50DC68;
        goto LABEL_6;
      case 5:
        if (qword_26A50D790 != -1) {
          swift_once();
        }
        uint64_t v3 = &qword_26A50DC78;
        goto LABEL_6;
      case 6:
        if (qword_26A50D798 != -1) {
          swift_once();
        }
        uint64_t v3 = &qword_26A50DC88;
        goto LABEL_6;
      case 7:
        if (qword_26A50D7A0 != -1) {
          swift_once();
        }
        uint64_t v3 = &qword_26A50DC98;
        goto LABEL_6;
      case 8:
        if (qword_26A50D7A8 != -1) {
          swift_once();
        }
        uint64_t v3 = &qword_26A50DCA8;
        goto LABEL_6;
      case 10:
        if (qword_26A50D7B0 != -1) {
          swift_once();
        }
        uint64_t v3 = &qword_26A50DCB8;
        goto LABEL_6;
      case 11:
        if (qword_26A50D7B8 != -1) {
          swift_once();
        }
        uint64_t v3 = &qword_26A50DCC8;
        goto LABEL_6;
      case 12:
        if (qword_26A50D7C0 != -1) {
          swift_once();
        }
        uint64_t v3 = &qword_26A50DCD8;
        goto LABEL_6;
      default:
LABEL_3:
        if (qword_26A50D760 != -1) {
          swift_once();
        }
        uint64_t v3 = &qword_26A50DC18;
LABEL_6:
        uint64_t v2 = *v3;
        swift_bridgeObjectRetain();
        break;
    }
  }
  return v2;
}

id SendValidityUtilities.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SendValidityUtilities.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SendValidityUtilities();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SendValidityUtilities.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SendValidityUtilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL SendValidity.isValid.getter()
{
  return *(unsigned char *)(v0 + 8) == 1 && *(void *)v0 > 9uLL;
}

uint64_t SendValidity.platterErrorMessage.getter()
{
  uint64_t v1 = *(void *)v0;
  if (*(unsigned char *)(v0 + 8) != 1) {
    return sub_25B6EF2BC(v1);
  }
  uint64_t v2 = 0;
  switch(v1)
  {
    case 1:
      if (qword_26A50D740 != -1) {
        swift_once();
      }
      uint64_t v3 = &qword_26A50DBD8;
      goto LABEL_25;
    case 2:
      if (qword_26A50D6E8 != -1) {
        swift_once();
      }
      uint64_t v3 = &qword_26A50DB28;
      goto LABEL_25;
    case 3:
    case 4:
    case 5:
    case 8:
      if (qword_26A50D738 != -1) {
        swift_once();
      }
      uint64_t v3 = &qword_26A50DBC8;
      goto LABEL_25;
    case 6:
      if (qword_26A50D750 != -1) {
        swift_once();
      }
      uint64_t v3 = &qword_26A50DBF8;
      goto LABEL_25;
    case 7:
      if (qword_26A50D758 != -1) {
        swift_once();
      }
      uint64_t v3 = &qword_26A50DC08;
      goto LABEL_25;
    case 9:
      if (qword_26A50D748 != -1) {
        swift_once();
      }
      uint64_t v3 = &qword_26A50DBE8;
      goto LABEL_25;
    case 10:
      return v2;
    default:
      if (qword_26A50D6E0 != -1) {
        swift_once();
      }
      uint64_t v3 = &qword_26A50DB18;
LABEL_25:
      uint64_t v2 = *v3;
      swift_bridgeObjectRetain();
      break;
  }
  return v2;
}

uint64_t sub_25B6EF2BC(uint64_t a1)
{
  uint64_t v1 = 0;
  switch(a1)
  {
    case 0:
    case 2:
    case 9:
      goto LABEL_10;
    case 1:
      return v1;
    case 4:
      if (qword_26A50D6F8 != -1) {
        swift_once();
      }
      uint64_t v2 = &qword_26A50DB48;
      goto LABEL_34;
    case 5:
      if (qword_26A50D700 != -1) {
        swift_once();
      }
      uint64_t v2 = &qword_26A50DB58;
      goto LABEL_34;
    case 6:
      if (qword_26A50D708 != -1) {
        swift_once();
      }
      uint64_t v2 = &qword_26A50DB68;
      goto LABEL_34;
    case 7:
      if (qword_26A50D710 != -1) {
        swift_once();
      }
      uint64_t v2 = &qword_26A50DB78;
      goto LABEL_34;
    case 8:
      if (qword_26A50D718 != -1) {
        swift_once();
      }
      uint64_t v2 = &qword_26A50DB88;
      goto LABEL_34;
    case 10:
      if (qword_26A50D720 != -1) {
        swift_once();
      }
      uint64_t v2 = &qword_26A50DB98;
      goto LABEL_34;
    case 11:
      if (qword_26A50D728 != -1) {
        swift_once();
      }
      uint64_t v2 = &qword_26A50DBA8;
      goto LABEL_34;
    case 12:
      if (qword_26A50D730 != -1) {
        swift_once();
      }
      uint64_t v2 = &qword_26A50DBB8;
      goto LABEL_34;
    default:
      if (qword_26A50D7C8 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_25B758230();
      __swift_project_value_buffer(v3, (uint64_t)qword_26A510038);
      unint64_t v4 = sub_25B758210();
      os_log_type_t v5 = sub_25B758470();
      if (os_log_type_enabled(v4, v5))
      {
        uint64_t v6 = swift_slowAlloc();
        uint64_t v7 = swift_slowAlloc();
        uint64_t v11 = v7;
        *(_DWORD *)uint64_t v6 = 136315650;
        uint64_t v8 = sub_25B758320();
        sub_25B6E424C(v8, v9, &v11);
        sub_25B7584C0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v6 + 12) = 2080;
        sub_25B6E424C(0xD00000000000003CLL, 0x800000025B7629E0, &v11);
        sub_25B7584C0();
        *(_WORD *)(v6 + 22) = 2048;
        sub_25B7584C0();
        _os_log_impl(&dword_25B6E0000, v4, v5, "%s, %s: Unknown eligibilityStatus, %ld", (uint8_t *)v6, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x261168610](v7, -1, -1);
        MEMORY[0x261168610](v6, -1, -1);
      }

LABEL_10:
      if (qword_26A50D738 != -1) {
        swift_once();
      }
      uint64_t v2 = &qword_26A50DBC8;
LABEL_34:
      uint64_t v1 = *v2;
      swift_bridgeObjectRetain();
      return v1;
  }
}

uint64_t static SendValidity.initiatorEligibilityFailureReasonAlert(eligibilityStatus:onSend:)(uint64_t a1, char a2)
{
  uint64_t v2 = 0;
  switch(a1)
  {
    case 1:
      return v2;
    case 4:
      if (qword_26A50D788 != -1) {
        swift_once();
      }
      uint64_t v3 = &qword_26A50DC68;
      goto LABEL_33;
    case 5:
      if (qword_26A50D790 != -1) {
        swift_once();
      }
      uint64_t v3 = &qword_26A50DC78;
      goto LABEL_33;
    case 6:
      if (qword_26A50D798 != -1) {
        swift_once();
      }
      uint64_t v3 = &qword_26A50DC88;
      goto LABEL_33;
    case 7:
      if (qword_26A50D7A0 != -1) {
        swift_once();
      }
      uint64_t v3 = &qword_26A50DC98;
      goto LABEL_33;
    case 8:
      if (qword_26A50D7A8 != -1) {
        swift_once();
      }
      uint64_t v3 = &qword_26A50DCA8;
      goto LABEL_33;
    case 10:
      if (qword_26A50D7B0 != -1) {
        swift_once();
      }
      uint64_t v3 = &qword_26A50DCB8;
      goto LABEL_33;
    case 11:
      if (qword_26A50D7B8 != -1) {
        swift_once();
      }
      uint64_t v3 = &qword_26A50DCC8;
      goto LABEL_33;
    case 12:
      if (qword_26A50D7C0 != -1) {
        swift_once();
      }
      uint64_t v3 = &qword_26A50DCD8;
      goto LABEL_33;
    default:
      if (a2)
      {
        if (qword_26A50D760 != -1) {
          swift_once();
        }
        uint64_t v3 = &qword_26A50DC18;
      }
      else
      {
        if (qword_26A50D768 != -1) {
          swift_once();
        }
        uint64_t v3 = &qword_26A50DC28;
      }
LABEL_33:
      uint64_t v2 = *v3;
      swift_bridgeObjectRetain();
      return v2;
  }
}

unint64_t SendValidity.settingsDeepLinkUrl.getter()
{
  if (*(unsigned char *)(v0 + 8)) {
    return 0;
  }
  else {
    return sub_25B6EFA7C(*(void *)v0);
  }
}

unint64_t sub_25B6EFA7C(uint64_t a1)
{
  uint64_t v1 = a1 - 4;
  unint64_t result = 0xD000000000000020;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      unint64_t result = 0xD000000000000022;
      break;
    case 2:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
      unint64_t result = 0xD000000000000030;
      break;
    case 4:
      unint64_t result = 0xD000000000000033;
      break;
    default:
      if (qword_26A50D7C8 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_25B758230();
      __swift_project_value_buffer(v3, (uint64_t)qword_26A510038);
      unint64_t v4 = sub_25B758210();
      os_log_type_t v5 = sub_25B758470();
      if (os_log_type_enabled(v4, v5))
      {
        uint64_t v6 = swift_slowAlloc();
        uint64_t v7 = swift_slowAlloc();
        uint64_t v10 = v7;
        *(_DWORD *)uint64_t v6 = 136315650;
        uint64_t v8 = sub_25B758320();
        sub_25B6E424C(v8, v9, &v10);
        sub_25B7584C0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v6 + 12) = 2080;
        sub_25B6E424C(0xD000000000000036, 0x800000025B762960, &v10);
        sub_25B7584C0();
        *(_WORD *)(v6 + 22) = 2048;
        sub_25B7584C0();
        _os_log_impl(&dword_25B6E0000, v4, v5, "%s, %s: Unknown eligibilityStatus, %ld", (uint8_t *)v6, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x261168610](v7, -1, -1);
        MEMORY[0x261168610](v6, -1, -1);
      }

      unint64_t result = 0;
      break;
  }
  return result;
}

uint64_t sub_25B6EFD2C(uint64_t a1)
{
  return sub_25B6F0CCC(a1, 0xD000000000000015, 0x800000025B763120, &qword_26A50DB18, &qword_26A50DB20);
}

uint64_t static SendValidity.initiatorEligibilityAddRecipientText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D6E0, &qword_26A50DB18);
}

uint64_t sub_25B6EFD7C(uint64_t a1)
{
  return sub_25B6F0CCC(a1, 0xD000000000000016, 0x800000025B7631C0, &qword_26A50DB28, &qword_26A50DB30);
}

uint64_t static SendValidity.initiatorEligibilityGroupConversationText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D6E8, &qword_26A50DB28);
}

uint64_t sub_25B6EFDCC(uint64_t a1)
{
  return sub_25B6F0CCC(a1, 0xE2676E6964616F4CLL, 0xAA0000000000A680, &qword_26A50DB38, &qword_26A50DB40);
}

uint64_t static SendValidity.initiatorLoadingText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D6F0, &qword_26A50DB38);
}

uint64_t sub_25B6EFE1C()
{
  uint64_t v0 = sub_25B757F70();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25B7582D0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758310();
  qword_26A50DB48 = result;
  unk_26A50DB50 = v5;
  return result;
}

uint64_t static SendValidity.initiatorEligibilityFailureLocationServicesText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D6F8, &qword_26A50DB48);
}

uint64_t sub_25B6EFF8C()
{
  uint64_t v0 = sub_25B757F70();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25B7582D0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758310();
  qword_26A50DB58 = result;
  unk_26A50DB60 = v5;
  return result;
}

uint64_t static SendValidity.initiatorEligibilityFailureCellularDataText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D700, &qword_26A50DB58);
}

uint64_t sub_25B6F00FC()
{
  uint64_t v0 = sub_25B757F70();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25B7582D0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758310();
  qword_26A50DB68 = result;
  unk_26A50DB70 = v5;
  return result;
}

uint64_t static SendValidity.initiatorEligibilityFailureiMessageText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D708, &qword_26A50DB68);
}

uint64_t sub_25B6F026C()
{
  uint64_t v0 = sub_25B757F70();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25B7582D0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758310();
  qword_26A50DB78 = result;
  unk_26A50DB80 = v5;
  return result;
}

uint64_t static SendValidity.initiatorEligibilityFailureLocationAuthorizationText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D710, &qword_26A50DB78);
}

uint64_t sub_25B6F03DC()
{
  uint64_t v0 = sub_25B757F70();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25B7582D0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758310();
  qword_26A50DB88 = result;
  unk_26A50DB90 = v5;
  return result;
}

uint64_t static SendValidity.initiatorEligibilityFailureManateeText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D718, &qword_26A50DB88);
}

uint64_t sub_25B6F054C()
{
  uint64_t v0 = sub_25B757F70();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25B7582D0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758310();
  qword_26A50DB98 = result;
  unk_26A50DBA0 = v5;
  return result;
}

uint64_t static SendValidity.initiatorEligibilityFailureNetworkReachabilityText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D720, &qword_26A50DB98);
}

uint64_t sub_25B6F06BC()
{
  uint64_t v0 = sub_25B757F70();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25B7582D0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758310();
  qword_26A50DBA8 = result;
  unk_26A50DBB0 = v5;
  return result;
}

uint64_t static SendValidity.initiatorEligibilityFailureRequiresiPhoneText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D728, &qword_26A50DBA8);
}

uint64_t sub_25B6F082C()
{
  uint64_t v0 = sub_25B757F70();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25B7582D0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758310();
  qword_26A50DBB8 = result;
  unk_26A50DBC0 = v5;
  return result;
}

uint64_t static SendValidity.initiatorEligibilityFailureRequiresiPhoneOrCellularText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D730, &qword_26A50DBB8);
}

uint64_t sub_25B6F099C()
{
  uint64_t v0 = sub_25B757F70();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25B7582D0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758310();
  qword_26A50DBC8 = result;
  unk_26A50DBD0 = v5;
  return result;
}

uint64_t static SendValidity.initiatorEligibilityFailureUnknownText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D738, &qword_26A50DBC8);
}

uint64_t sub_25B6F0B14(uint64_t a1)
{
  return sub_25B6F0CCC(a1, 0x1000000000000035, 0x800000025B763140, &qword_26A50DBD8, &qword_26A50DBE0);
}

uint64_t static SendValidity.sendValidityReceiverIneligible.getter()
{
  return sub_25B6EE7C8(&qword_26A50D740, &qword_26A50DBD8);
}

uint64_t sub_25B6F0B64(uint64_t a1)
{
  return sub_25B6F0CCC(a1, 0x1000000000000031, 0x800000025B763180, &qword_26A50DBE8, &qword_26A50DBF0);
}

uint64_t static SendValidity.sendValidityGroupReceiverIneligible.getter()
{
  return sub_25B6EE7C8(&qword_26A50D748, &qword_26A50DBE8);
}

uint64_t sub_25B6F0BB4(uint64_t a1)
{
  return sub_25B6F0CCC(a1, 0x1000000000000028, 0x800000025B763240, &qword_26A50DBF8, &qword_26A50DC00);
}

uint64_t static SendValidity.sendValiditySessionAlreadyActive.getter()
{
  return sub_25B6EE7C8(&qword_26A50D750, &qword_26A50DBF8);
}

uint64_t sub_25B6F0C04(uint64_t a1)
{
  return sub_25B6F0CCC(a1, 0x1000000000000030, 0x800000025B763270, &qword_26A50DC08, &qword_26A50DC10);
}

uint64_t static SendValidity.sendValidityInvalidETA.getter()
{
  return sub_25B6EE7C8(&qword_26A50D758, &qword_26A50DC08);
}

uint64_t sub_25B6F0C54(uint64_t a1)
{
  return sub_25B6F0CCC(a1, 0x1000000000000059, 0x800000025B7631E0, &qword_26A50DC18, &qword_26A50DC20);
}

uint64_t static SendValidity.sendValidityGeneralError.getter()
{
  return sub_25B6EE7C8(&qword_26A50D760, &qword_26A50DC18);
}

uint64_t sub_25B6F0CA4(uint64_t a1)
{
  return sub_25B6F0CCC(a1, 0x1000000000000033, 0x800000025B7629A0, &qword_26A50DC28, &qword_26A50DC30);
}

uint64_t sub_25B6F0CCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void *a5)
{
  uint64_t v7 = sub_25B757F70();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_25B7582D0();
  MEMORY[0x270FA5388](v8 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v10 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758310();
  *a4 = result;
  *a5 = v12;
  return result;
}

uint64_t static SendValidity.preSendValidityGeneralError.getter()
{
  return sub_25B6EE7C8(&qword_26A50D768, &qword_26A50DC28);
}

unint64_t static SendValidity.locationServicesSettingsDeepLinkUrl.getter()
{
  return 0xD000000000000020;
}

unint64_t static SendValidity.cellularDataSettingsDeepLinkUrl.getter()
{
  return 0xD000000000000022;
}

unint64_t static SendValidity.messagesSettingsDeepLinkUrl.getter()
{
  return 0xD000000000000013;
}

unint64_t static SendValidity.locationAuthorizationSettingsDeepLinkUrl.getter()
{
  return 0xD000000000000030;
}

unint64_t static SendValidity.manateeSettingsDeepLinkUrl.getter()
{
  return 0xD000000000000033;
}

uint64_t sub_25B6F0EC8()
{
  uint64_t v0 = sub_25B757F70();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25B7582D0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758310();
  qword_26A50DC38 = result;
  unk_26A50DC40 = v5;
  return result;
}

uint64_t static SendValidity.sendMessageFailureAlertCannotSendTitle.getter()
{
  return sub_25B6EE7C8(&qword_26A50D770, &qword_26A50DC38);
}

uint64_t sub_25B6F1038()
{
  uint64_t v0 = sub_25B757F70();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25B7582D0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758300();
  qword_26A50DC48 = result;
  unk_26A50DC50 = v5;
  return result;
}

uint64_t static SendValidity.sendMessageFailureAlertOKButtonText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D778, &qword_26A50DC48);
}

uint64_t sub_25B6F11B8()
{
  uint64_t v0 = sub_25B757F70();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25B7582D0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758310();
  qword_26A50DC58 = result;
  unk_26A50DC60 = v5;
  return result;
}

uint64_t static SendValidity.sendMessageFailureAlertDevicePlatformText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D780, &qword_26A50DC58);
}

uint64_t sub_25B6F1328()
{
  uint64_t v0 = sub_25B757F70();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25B7582D0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758310();
  qword_26A50DC68 = result;
  unk_26A50DC70 = v5;
  return result;
}

uint64_t static SendValidity.sendMessageFailureAlertLocationServicesText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D788, &qword_26A50DC68);
}

uint64_t sub_25B6F1498()
{
  uint64_t v0 = sub_25B757F70();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25B7582D0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758310();
  qword_26A50DC78 = result;
  unk_26A50DC80 = v5;
  return result;
}

uint64_t static SendValidity.sendMessageFailureAlertCellularDataText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D790, &qword_26A50DC78);
}

uint64_t sub_25B6F1608()
{
  uint64_t v0 = sub_25B757F70();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25B7582D0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758310();
  qword_26A50DC88 = result;
  unk_26A50DC90 = v5;
  return result;
}

uint64_t static SendValidity.sendMessageFailureAlertiMessageText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D798, &qword_26A50DC88);
}

uint64_t sub_25B6F1778()
{
  uint64_t v0 = sub_25B757F70();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25B7582D0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758310();
  qword_26A50DC98 = result;
  unk_26A50DCA0 = v5;
  return result;
}

uint64_t static SendValidity.sendMessageFailureAlertFailureLocationAuthorizationText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D7A0, &qword_26A50DC98);
}

uint64_t sub_25B6F18E8()
{
  uint64_t v0 = sub_25B757F70();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25B7582D0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758310();
  qword_26A50DCA8 = result;
  unk_26A50DCB0 = v5;
  return result;
}

uint64_t static SendValidity.sendMessageFailureAlertManateeText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D7A8, &qword_26A50DCA8);
}

uint64_t sub_25B6F1A58()
{
  uint64_t v0 = sub_25B757F70();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25B7582D0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758310();
  qword_26A50DCB8 = result;
  unk_26A50DCC0 = v5;
  return result;
}

uint64_t static SendValidity.sendMessageFailureAlertNetworkReachabilityText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D7B0, &qword_26A50DCB8);
}

uint64_t sub_25B6F1BC8()
{
  uint64_t v0 = sub_25B757F70();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25B7582D0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758310();
  qword_26A50DCC8 = result;
  unk_26A50DCD0 = v5;
  return result;
}

uint64_t static SendValidity.sendMessageFailureAlertRequiresiPhoneText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D7B8, &qword_26A50DCC8);
}

uint64_t sub_25B6F1D38()
{
  uint64_t v0 = sub_25B757F70();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25B7582D0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B758270();
  sub_25B6F26F0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B757F60();
  uint64_t result = sub_25B758310();
  qword_26A50DCD8 = result;
  unk_26A50DCE0 = v5;
  return result;
}

uint64_t type metadata accessor for SendValidityUtilities()
{
  return self;
}

uint64_t static SendValidity.sendMessageFailureAlertRequiresiPhoneOrCellularText.getter()
{
  return sub_25B6EE7C8(&qword_26A50D7C0, &qword_26A50DCD8);
}

void SendValidity.type.getter(unsigned char *a1@<X8>)
{
  if (*(unsigned char *)(v1 + 8) == 1) {
    *a1 = byte_25B75DA0E[*(void *)v1];
  }
  else {
    *a1 = 0;
  }
}

SafetyMonitor::SendValidity::Case_optional __swiftcall SendValidity.Case.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_25B758580();
  result.value = swift_bridgeObjectRelease();
  char v5 = 12;
  if (v3 < 0xC) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

unint64_t SendValidity.Case.rawValue.getter()
{
  unint64_t result = 0xD000000000000013;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x7669656365526F6ELL;
      break;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0x61684370756F7267;
      break;
    case 4:
      unint64_t result = 0x43676E697373696DLL;
      break;
    case 5:
      unint64_t result = 0x7964616552746F6ELL;
      break;
    case 6:
      unint64_t result = 0xD000000000000011;
      break;
    case 7:
      unint64_t result = 0xD000000000000014;
      break;
    case 8:
      unint64_t result = 0x4564696C61766E69;
      break;
    case 9:
      unint64_t result = 0x64696C6176;
      break;
    case 0xA:
      unint64_t result = 0x456C6172656E6567;
      break;
    case 0xB:
      unint64_t result = 0xD000000000000017;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25B6F20DC()
{
  return sub_25B6F8634();
}

uint64_t sub_25B6F20E8()
{
  return sub_25B7585E0();
}

uint64_t sub_25B6F2150()
{
  SendValidity.Case.rawValue.getter();
  sub_25B758330();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25B6F21B4()
{
  return sub_25B7585E0();
}

SafetyMonitor::SendValidity::Case_optional sub_25B6F2218(Swift::String *a1)
{
  return SendValidity.Case.init(rawValue:)(*a1);
}

unint64_t sub_25B6F2224@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = SendValidity.Case.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25B6F2250()
{
  uint64_t v0 = sub_25B758230();
  __swift_allocate_value_buffer(v0, qword_26A510038);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A510038);
  swift_bridgeObjectRetain();
  return sub_25B758220();
}

BOOL _s13SafetyMonitor12SendValidityO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  if (*((unsigned char *)a1 + 8) == 1)
  {
    switch(v2)
    {
      case 1:
        if (v3 != 1) {
          char v4 = 0;
        }
        if ((v4 & 1) == 0) {
          return 0;
        }
        BOOL result = 1;
        break;
      case 2:
        if (v3 != 2) {
          char v4 = 0;
        }
        if ((v4 & 1) == 0) {
          return 0;
        }
        BOOL result = 1;
        break;
      case 3:
        if (v3 != 3) {
          char v4 = 0;
        }
        if ((v4 & 1) == 0) {
          return 0;
        }
        BOOL result = 1;
        break;
      case 4:
        if (v3 != 4) {
          char v4 = 0;
        }
        if ((v4 & 1) == 0) {
          return 0;
        }
        BOOL result = 1;
        break;
      case 5:
        if (v3 != 5) {
          char v4 = 0;
        }
        if ((v4 & 1) == 0) {
          return 0;
        }
        BOOL result = 1;
        break;
      case 6:
        if (v3 != 6) {
          char v4 = 0;
        }
        if ((v4 & 1) == 0) {
          return 0;
        }
        BOOL result = 1;
        break;
      case 7:
        if (v3 != 7) {
          char v4 = 0;
        }
        if ((v4 & 1) == 0) {
          return 0;
        }
        BOOL result = 1;
        break;
      case 8:
        if (v3 != 8) {
          char v4 = 0;
        }
        if ((v4 & 1) == 0) {
          return 0;
        }
        BOOL result = 1;
        break;
      case 9:
        if (v3 != 9) {
          char v4 = 0;
        }
        if ((v4 & 1) == 0) {
          return 0;
        }
        BOOL result = 1;
        break;
      case 10:
        if (v3 <= 9) {
          char v4 = 0;
        }
        if ((v4 & 1) == 0) {
          return 0;
        }
        BOOL result = 1;
        break;
      default:
        if (v3) {
          char v4 = 0;
        }
        if ((v4 & 1) == 0) {
          return 0;
        }
        BOOL result = 1;
        break;
    }
  }
  else
  {
    return (*(unsigned char *)(a2 + 8) & 1) == 0 && v2 == v3;
  }
  return result;
}

unint64_t sub_25B6F2438()
{
  unint64_t result = qword_26A50DCF8;
  if (!qword_26A50DCF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50DCF8);
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for SendValidity(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SendValidity(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_25B6F24F4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25B6F2510(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SendValidity()
{
  return &type metadata for SendValidity;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SendValidity.Case(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SendValidity.Case(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *unint64_t result = a2 + 11;
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
        JUMPOUT(0x25B6F26A8);
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
          *unint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

uint64_t sub_25B6F26D0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25B6F26D8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SendValidity.Case()
{
  return &type metadata for SendValidity.Case;
}

unint64_t sub_25B6F26F0()
{
  unint64_t result = qword_26A50DAC0;
  if (!qword_26A50DAC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A50DAC0);
  }
  return result;
}

uint64_t sub_25B6F2730(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25B758430();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_25B758420();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25B6E5BE4(a1, &qword_26B3494B8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25B7583F0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id SMCloudKitFunctionSwift.__allocating_init(serviceName:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return SMCloudKitFunctionSwift.init(serviceName:)(a1, a2);
}

id SMCloudKitFunctionSwift.init(serviceName:)(uint64_t a1, uint64_t a2)
{
  id v5 = v2;
  sub_25B758220();
  uint64_t v6 = &v5[OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_containerName];
  *(void *)uint64_t v6 = 0xD000000000000023;
  *((void *)v6 + 1) = 0x800000025B763480;
  uint64_t v7 = &v5[OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_serviceName];
  *(void *)uint64_t v7 = a1;
  *((void *)v7 + 1) = a2;
  id v8 = objc_allocWithZone(MEMORY[0x263EFD620]);
  unint64_t v9 = (void *)sub_25B7582E0();
  id v10 = objc_msgSend(v8, sel_initWithContainerIdentifier_environment_, v9, 1);

  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD610]), sel_initWithContainerID_, v10);
  *(void *)&v5[OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_container] = v11;
  id v12 = v11;
  swift_bridgeObjectRetain();
  uint64_t v13 = (void *)sub_25B7582E0();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v12, sel_codeServiceWithName_databaseScope_, v13, 3);

  *(void *)&v5[OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_client] = v14;
  id v15 = v14;

  v32.receiver = v5;
  v32.super_class = (Class)type metadata accessor for SMCloudKitFunctionSwift();
  id v16 = objc_msgSendSuper2(&v32, sel_init);
  uint64_t v17 = sub_25B758210();
  os_log_type_t v18 = sub_25B758480();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v31 = v20;
    *(_DWORD *)uint64_t v19 = 136315650;
    uint64_t v21 = (char *)v16;
    id v22 = objc_msgSend(v21, sel_description);
    uint64_t v29 = v10;
    uint64_t v30 = v15;
    uint64_t v23 = sub_25B7582F0();
    unint64_t v25 = v24;

    sub_25B6E424C(v23, v25, &v31);
    sub_25B7584C0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    sub_25B6E424C(0xD000000000000012, 0x800000025B7634B0, &v31);
    sub_25B7584C0();
    *(_WORD *)(v19 + 22) = 2080;
    uint64_t v26 = *(void *)&v21[OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_serviceName];
    unint64_t v27 = *(void *)&v21[OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_serviceName + 8];
    swift_bridgeObjectRetain();
    sub_25B6E424C(v26, v27, &v31);
    sub_25B7584C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25B6E0000, v17, v18, "#SafetyCache,Receiver,%s,%s,initialized with serviceName %s", (uint8_t *)v19, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x261168610](v20, -1, -1);
    MEMORY[0x261168610](v19, -1, -1);
  }
  else
  {
  }
  return v16;
}

uint64_t type metadata accessor for SMCloudKitFunctionSwift()
{
  uint64_t result = qword_26A50DD38;
  if (!qword_26A50DD38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25B6F2D80(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3494B8);
  MEMORY[0x270FA5388](v13 - 8);
  id v15 = (char *)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = v6;
  id v17 = objc_msgSend(v16, sel_description);
  uint64_t v18 = sub_25B7582F0();
  uint64_t v77 = v19;

  if (a4)
  {
    uint64_t v75 = v18;
    uint64_t v20 = a1;
    swift_bridgeObjectRetain_n();
    id v21 = v16;
    swift_bridgeObjectRetain_n();
    id v22 = v21;
    uint64_t v23 = sub_25B758210();
    os_log_type_t v24 = sub_25B758480();
    int v71 = v24;
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v72 = v15;
      uint64_t v26 = v25;
      uint64_t v70 = swift_slowAlloc();
      os_log_t v79 = (os_log_t)v70;
      *(_DWORD *)uint64_t v26 = 136316162;
      uint64_t v73 = a6;
      swift_bridgeObjectRetain();
      uint64_t v74 = v20;
      uint64_t v78 = sub_25B6E424C(v20, a2, (uint64_t *)&v79);
      uint64_t v76 = a3;
      sub_25B7584C0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v26 + 12) = 2080;
      os_log_t v68 = (os_log_t)(v26 + 14);
      unint64_t v27 = (char *)v22;
      id v28 = objc_msgSend(v27, sel_description);
      unint64_t v29 = a2;
      unint64_t v30 = a4;
      uint64_t v31 = a5;
      uint64_t v32 = sub_25B7582F0();
      os_log_t v69 = v23;
      unint64_t v34 = v33;

      uint64_t v35 = v32;
      a5 = v31;
      a4 = v30;
      a2 = v29;
      uint64_t v78 = sub_25B6E424C(v35, v34, (uint64_t *)&v79);
      sub_25B7584C0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v26 + 22) = 2080;
      uint64_t v78 = sub_25B6E424C(0xD000000000000034, 0x800000025B7634D0, (uint64_t *)&v79);
      sub_25B7584C0();
      *(_WORD *)(v26 + 32) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v78 = sub_25B6E424C(v76, a4, (uint64_t *)&v79);
      sub_25B7584C0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v26 + 42) = 2080;
      uint64_t v36 = *(void *)&v27[OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_serviceName];
      unint64_t v37 = *(void *)&v27[OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_serviceName + 8];
      swift_bridgeObjectRetain();
      uint64_t v38 = v36;
      a6 = v73;
      uint64_t v78 = sub_25B6E424C(v38, v37, (uint64_t *)&v79);
      a3 = v76;
      sub_25B7584C0();

      uint64_t v39 = v74;
      swift_bridgeObjectRelease();
      os_log_t v40 = v69;
      _os_log_impl(&dword_25B6E0000, v69, (os_log_type_t)v71, "#SafetyCache,Receiver,sessionID:%s,%s,%s,requesting safety cache with token %s using serviceName %s", (uint8_t *)v26, 0x34u);
      uint64_t v41 = v70;
      swift_arrayDestroy();
      MEMORY[0x261168610](v41, -1, -1);
      uint64_t v42 = v26;
      id v15 = v72;
      MEMORY[0x261168610](v42, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      swift_bridgeObjectRelease_n();
      uint64_t v39 = v20;
    }
    uint64_t v18 = v75;
  }
  else
  {
    uint64_t v76 = a3;
    id v43 = v16;
    uint64_t v74 = a1;
    id v44 = v43;
    swift_bridgeObjectRetain_n();
    id v45 = v44;
    uint64_t v39 = v74;
    id v46 = v45;
    uint64_t v47 = sub_25B758210();
    os_log_type_t v48 = sub_25B758480();
    int v71 = v48;
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = swift_slowAlloc();
      uint64_t v72 = v15;
      uint64_t v50 = v49;
      os_log_t v69 = (os_log_t)swift_slowAlloc();
      os_log_t v79 = v69;
      *(_DWORD *)uint64_t v50 = 136315906;
      uint64_t v70 = a5;
      swift_bridgeObjectRetain();
      uint64_t v78 = sub_25B6E424C(v39, a2, (uint64_t *)&v79);
      sub_25B7584C0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v50 + 12) = 2080;
      uint64_t v51 = (char *)v46;
      id v52 = objc_msgSend(v51, sel_description);
      uint64_t v75 = v18;
      id v53 = v52;
      uint64_t v54 = sub_25B7582F0();
      os_log_t v68 = v47;
      uint64_t v55 = v54;
      uint64_t v73 = a6;
      unint64_t v57 = v56;

      uint64_t v78 = sub_25B6E424C(v55, v57, (uint64_t *)&v79);
      a5 = v70;
      sub_25B7584C0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v50 + 22) = 2080;
      uint64_t v78 = sub_25B6E424C(0xD000000000000034, 0x800000025B7634D0, (uint64_t *)&v79);
      sub_25B7584C0();
      *(_WORD *)(v50 + 32) = 2080;
      uint64_t v58 = *(void *)&v51[OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_serviceName];
      unint64_t v59 = *(void *)&v51[OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_serviceName + 8];
      swift_bridgeObjectRetain();
      uint64_t v60 = v58;
      a6 = v73;
      uint64_t v78 = sub_25B6E424C(v60, v59, (uint64_t *)&v79);
      uint64_t v39 = v74;
      sub_25B7584C0();

      uint64_t v18 = v75;
      swift_bridgeObjectRelease();
      os_log_t v61 = v68;
      _os_log_impl(&dword_25B6E0000, v68, (os_log_type_t)v71, "#SafetyCache,Receiver,sessionID:%s,%s,%s,requesting safety cache without token using serviceName %s", (uint8_t *)v50, 0x2Au);
      os_log_t v62 = v69;
      swift_arrayDestroy();
      MEMORY[0x261168610](v62, -1, -1);
      uint64_t v63 = v50;
      id v15 = v72;
      MEMORY[0x261168610](v63, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    a3 = v76;
  }
  uint64_t v64 = sub_25B758430();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v64 - 8) + 56))(v15, 1, 1, v64);
  uint64_t v65 = (void *)swift_allocObject();
  v65[2] = 0;
  v65[3] = 0;
  v65[4] = v39;
  v65[5] = a2;
  v65[6] = a3;
  v65[7] = a4;
  v65[8] = v16;
  v65[9] = v18;
  v65[10] = v77;
  v65[11] = a5;
  v65[12] = a6;
  swift_bridgeObjectRetain();
  swift_retain();
  id v66 = v16;
  swift_bridgeObjectRetain();
  sub_25B6F2730((uint64_t)v15, (uint64_t)&unk_26A50DD30, (uint64_t)v65);
  return swift_release();
}

uint64_t sub_25B6F34BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 184) = v13;
  *(void *)(v8 + 192) = v14;
  *(_OWORD *)(v8 + 168) = v12;
  *(void *)(v8 + 152) = a7;
  *(void *)(v8 + 160) = a8;
  *(void *)(v8 + 136) = a5;
  *(void *)(v8 + 144) = a6;
  *(void *)(v8 + 128) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DD58);
  *(void *)(v8 + 200) = swift_task_alloc();
  uint64_t v9 = sub_25B7580C0();
  *(void *)(v8 + 208) = v9;
  *(void *)(v8 + 216) = *(void *)(v9 - 8);
  *(void *)(v8 + 224) = swift_task_alloc();
  *(void *)(v8 + 232) = type metadata accessor for FetchSafetyCacheResponse(0);
  *(void *)(v8 + 240) = swift_task_alloc();
  *(void *)(v8 + 248) = swift_task_alloc();
  *(void *)(v8 + 256) = type metadata accessor for FetchSafetyCacheRequest(0);
  *(void *)(v8 + 264) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25B6F3664, 0, 0);
}

uint64_t sub_25B6F3664()
{
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 160);
  uint64_t v3 = *(void *)(v0 + 144);
  long long v10 = *(_OWORD *)(v0 + 128);
  uint64_t v4 = swift_task_alloc();
  *(_OWORD *)(v4 + 16) = v10;
  *(void *)(v4 + 32) = v3;
  *(void *)(v4 + 40) = v1;
  sub_25B6F4B54();
  sub_25B7581A0();
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_client);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 272) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_25B6F37B8;
  uint64_t v7 = *(void *)(v0 + 264);
  uint64_t v8 = *(void *)(v0 + 248);
  return sub_25B6FCF60(v8, v7, v5);
}

uint64_t sub_25B6F37B8()
{
  *(void *)(*(void *)v1 + 280) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25B6F3E64;
  }
  else {
    uint64_t v2 = sub_25B6F38F8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25B6F38F8()
{
  unint64_t v34 = v0;
  v33[1] = *MEMORY[0x263EF8340];
  v0[8] = 0;
  uint64_t v1 = (void *)v0[31];
  if (*v1)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v3 = v0[26];
    uint64_t v4 = v0[27];
    uint64_t v5 = v0[25];
    sub_25B6F4C70((uint64_t)v1 + *(int *)(v0[29] + 24), v5);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) == 1)
    {
      uint64_t v6 = v0[25];
      sub_25B7580B0();
      sub_25B6E5BE4(v6, &qword_26A50DD58);
    }
    else
    {
      (*(void (**)(void, void, void))(v0[27] + 32))(v0[28], v0[25], v0[26]);
    }
    sub_25B6F4CD8();
    uint64_t v2 = (void *)sub_25B758490();
    v0[8] = v2;
    uint64_t v1 = (void *)v0[31];
  }
  sub_25B6F4BAC((uint64_t)v1, v0[30]);
  id v7 = v2;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v8 = v7;
  uint64_t v9 = sub_25B758210();
  os_log_type_t v10 = sub_25B758480();
  BOOL v11 = os_log_type_enabled(v9, v10);
  unint64_t v12 = v0[22];
  if (v11)
  {
    os_log_type_t v31 = v10;
    uint64_t v32 = v9;
    id v28 = (uint64_t *)v0[30];
    uint64_t v13 = v2;
    uint64_t v14 = v0[16];
    uint64_t v27 = v0[21];
    unint64_t v15 = v0[17];
    uint64_t v16 = swift_slowAlloc();
    unint64_t v29 = (void *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    v33[0] = v30;
    *(_DWORD *)uint64_t v16 = 136316162;
    swift_bridgeObjectRetain();
    v0[10] = sub_25B6E424C(v14, v15, v33);
    sub_25B7584C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v16 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[11] = sub_25B6E424C(v27, v12, v33);
    sub_25B7584C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v16 + 22) = 2080;
    v0[12] = sub_25B6E424C(0xD000000000000034, 0x800000025B7634D0, v33);
    sub_25B7584C0();
    *(_WORD *)(v16 + 32) = 2048;
    uint64_t v17 = *v28;
    sub_25B6F4C10(v0[30], type metadata accessor for FetchSafetyCacheResponse);
    v0[13] = v17;
    sub_25B7584C0();
    *(_WORD *)(v16 + 42) = 2112;
    if (v13)
    {
      v0[15] = v8;
      id v18 = v8;
    }
    else
    {
      v0[14] = 0;
    }
    sub_25B7584C0();
    *unint64_t v29 = v13;

    _os_log_impl(&dword_25B6E0000, v32, v31, "#SafetyCache,Receiver,sessionID:%s,%s,%s,received response,responseCode,%ld,record,%@", (uint8_t *)v16, 0x34u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A50DDD0);
    swift_arrayDestroy();
    MEMORY[0x261168610](v29, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x261168610](v30, -1, -1);
    MEMORY[0x261168610](v16, -1, -1);
  }
  else
  {
    sub_25B6F4C10(v0[30], type metadata accessor for FetchSafetyCacheResponse);

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v19 = (uint64_t *)v0[31];
  uint64_t v20 = *v19;
  uint64_t v21 = v0[33];
  id v22 = (void (*)(uint64_t, void *, void))v0[23];
  swift_beginAccess();
  uint64_t v23 = (void *)v0[8];
  id v24 = v23;
  v22(v20, v23, 0);

  sub_25B6F4C10((uint64_t)v19, type metadata accessor for FetchSafetyCacheResponse);
  sub_25B6F4C10(v21, type metadata accessor for FetchSafetyCacheRequest);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = (uint64_t (*)(void))v0[1];
  return v25();
}

uint64_t sub_25B6F3E64()
{
  id v24 = v0;
  v23[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = (void *)v0[35];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v2 = v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v3 = v1;
  uint64_t v4 = sub_25B758210();
  os_log_type_t v5 = sub_25B758470();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[35];
    unint64_t v7 = v0[22];
    uint64_t v20 = v0[21];
    uint64_t v8 = v0[16];
    unint64_t v9 = v0[17];
    uint64_t v10 = swift_slowAlloc();
    uint64_t v21 = (void *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    v23[0] = v22;
    *(_DWORD *)uint64_t v10 = 136315906;
    swift_bridgeObjectRetain();
    v0[9] = sub_25B6E424C(v8, v9, v23);
    sub_25B7584C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[5] = sub_25B6E424C(v20, v7, v23);
    sub_25B7584C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 22) = 2080;
    v0[6] = sub_25B6E424C(0xD000000000000034, 0x800000025B7634D0, v23);
    sub_25B7584C0();
    *(_WORD *)(v10 + 32) = 2112;
    id v11 = v6;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[7] = v12;
    sub_25B7584C0();
    void *v21 = v12;

    _os_log_impl(&dword_25B6E0000, v4, v5, "#SafetyCache,Receiver,sessionID:%s,%s,%s,returned error %@", (uint8_t *)v10, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A50DDD0);
    swift_arrayDestroy();
    MEMORY[0x261168610](v21, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x261168610](v22, -1, -1);
    MEMORY[0x261168610](v10, -1, -1);
  }
  else
  {
    uint64_t v13 = (void *)v0[35];

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v14 = (void *)v0[35];
  uint64_t v15 = v0[33];
  uint64_t v16 = (void (*)(uint64_t, void, void *))v0[23];
  id v17 = v14;
  v16(1, 0, v14);

  sub_25B6F4C10(v15, type metadata accessor for FetchSafetyCacheRequest);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_25B6F423C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  if (a5)
  {
    unint64_t v10 = a5;
  }
  else
  {
    a4 = 0;
    unint64_t v10 = 0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  a1[2] = a4;
  a1[3] = v10;
  return result;
}

void sub_25B6F43B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3) {
    uint64_t v7 = sub_25B757E90();
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (id)v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a1, a2);
}

id SMCloudKitFunctionSwift.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SMCloudKitFunctionSwift.init()()
{
}

id SMCloudKitFunctionSwift.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SMCloudKitFunctionSwift();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25B6F45B8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25B6F4694;
  return v6(a1);
}

uint64_t sub_25B6F4694()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25B6F478C()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 104, 7);
}

uint64_t sub_25B6F47EC(uint64_t a1)
{
  uint64_t v4 = v1[3];
  uint64_t v12 = v1[2];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v7 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v9 = v1[8];
  unint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *unint64_t v10 = v2;
  v10[1] = sub_25B6E59F4;
  return sub_25B6F34BC(a1, v12, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_25B6F48F0()
{
  return type metadata accessor for SMCloudKitFunctionSwift();
}

uint64_t sub_25B6F48F8()
{
  uint64_t result = sub_25B758230();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SMCloudKitFunctionSwift(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SMCloudKitFunctionSwift);
}

uint64_t dispatch thunk of SMCloudKitFunctionSwift.__allocating_init(serviceName:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of SMCloudKitFunctionSwift.requestSafetyCacheRecord(fromZone:token:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t sub_25B6F4A04()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25B6F4A3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25B6F43B4(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_25B6F4A44()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25B6F4A7C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25B6E59F4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A50DD48 + dword_26A50DD48);
  return v6(a1, v4);
}

uint64_t sub_25B6F4B34(void *a1)
{
  return sub_25B6F423C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

unint64_t sub_25B6F4B54()
{
  unint64_t result = qword_26A50DD60;
  if (!qword_26A50DD60)
  {
    type metadata accessor for FetchSafetyCacheRequest(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50DD60);
  }
  return result;
}

uint64_t sub_25B6F4BAC(uint64_t a1, uint64_t a2)
{
  uint64_t SafetyCacheResponse = type metadata accessor for FetchSafetyCacheResponse(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(SafetyCacheResponse - 8) + 16))(a2, a1, SafetyCacheResponse);
  return a2;
}

uint64_t sub_25B6F4C10(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25B6F4C70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DD58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_25B6F4CD8()
{
  unint64_t result = qword_26A50DD68;
  if (!qword_26A50DD68)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A50DD68);
  }
  return result;
}

id sub_25B6F4D18()
{
  uint64_t v1 = OBJC_IVAR___SMContactsManagerInternal_store;
  id v2 = objc_allocWithZone(MEMORY[0x263EFEA58]);
  uint64_t v3 = v0;
  *(void *)&v0[v1] = objc_msgSend(v2, sel_init);
  uint64_t v4 = OBJC_IVAR___SMContactsManagerInternal_keystoFetch;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DDB8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_25B75DA70;
  uint64_t v6 = (void *)*MEMORY[0x263EFDF80];
  uint64_t v7 = (void *)*MEMORY[0x263EFE070];
  *(void *)(v5 + 32) = *MEMORY[0x263EFDF80];
  *(void *)(v5 + 40) = v7;
  uint64_t v8 = (void *)*MEMORY[0x263EFDFC8];
  uint64_t v9 = (void *)*MEMORY[0x263EFDFB8];
  *(void *)(v5 + 48) = *MEMORY[0x263EFDFC8];
  *(void *)(v5 + 56) = v9;
  v25[0] = v5;
  sub_25B7583C0();
  *(void *)&v3[v4] = v25[0];
  unint64_t v10 = &v3[OBJC_IVAR___SMContactsManagerInternal_cachedContact];
  *((void *)v10 + 1) = 0;
  *((void *)v10 + 2) = 0;
  *(void *)unint64_t v10 = 0;
  id v11 = v6;
  id v12 = v7;
  id v13 = v8;
  id v14 = v9;

  v26.receiver = v3;
  v26.super_class = (Class)type metadata accessor for ContactsManager();
  id v15 = objc_msgSendSuper2(&v26, sel_init);
  uint64_t v16 = self;
  id v17 = v15;
  id v18 = objc_msgSend(v16, sel_defaultCenter);
  uint64_t v19 = *MEMORY[0x263EFE118];
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v17;
  v25[4] = sub_25B6F8190;
  v25[5] = v20;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 1107296256;
  v25[2] = sub_25B6F5164;
  v25[3] = &block_descriptor;
  uint64_t v21 = _Block_copy(v25);
  id v22 = v17;
  swift_release();
  id v23 = objc_msgSend(v18, sel_addObserverForName_object_queue_usingBlock_, v19, 0, 0, v21);

  _Block_release(v21);
  swift_unknownObjectRelease();

  return v22;
}

uint64_t sub_25B6F4F60(uint64_t a1, void *a2)
{
  if (qword_26A50D7D8 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25B758230();
  __swift_project_value_buffer(v3, (uint64_t)qword_26A510050);
  uint64_t v4 = a2;
  uint64_t v5 = sub_25B758210();
  os_log_type_t v6 = sub_25B758480();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v17 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    uint64_t v9 = v4;
    id v10 = objc_msgSend(v9, sel_description);
    uint64_t v11 = sub_25B7582F0();
    unint64_t v13 = v12;

    sub_25B6E424C(v11, v13, &v17);
    sub_25B7584C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25B6E0000, v5, v6, "%s, CNContactStoreDidChange, clearing cached contact", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261168610](v8, -1, -1);
    MEMORY[0x261168610](v7, -1, -1);
  }
  else
  {
  }
  id v14 = &v4[OBJC_IVAR___SMContactsManagerInternal_cachedContact];
  id v15 = *(void **)&v4[OBJC_IVAR___SMContactsManagerInternal_cachedContact];
  *(void *)id v14 = 0;
  *((void *)v14 + 1) = 0;
  *((void *)v14 + 2) = 0;

  return swift_bridgeObjectRelease();
}

uint64_t sub_25B6F5164(uint64_t a1)
{
  uint64_t v2 = sub_25B757E00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v6 = *(void (**)(char *))(a1 + 32);
  sub_25B757DF0();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

id ContactsManager.__deallocating_deinit()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_name_object_, v0, *MEMORY[0x263EFE118], 0);

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for ContactsManager();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for ContactsManager()
{
  return self;
}

id sub_25B6F5428()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ContactsManager()), sel_init);
  qword_26A50DD70 = (uint64_t)result;
  return result;
}

id static ContactsManager.shared.getter()
{
  if (qword_26A50D7D0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26A50DD70;
  return v0;
}

void *sub_25B6F5510()
{
  v11[1] = *(id *)MEMORY[0x263EF8340];
  id v1 = self;
  uint64_t v2 = (void *)sub_25B7582E0();
  id v3 = objc_msgSend(v1, sel_predicateForContactsMatchingEmailAddress_, v2);

  uint64_t v4 = *(void **)(v0 + OBJC_IVAR___SMContactsManagerInternal_store);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DDA8);
  uint64_t v5 = (void *)sub_25B758390();
  v11[0] = 0;
  id v6 = objc_msgSend(v4, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v3, v5, v11);

  id v7 = v11[0];
  if (v6)
  {
    sub_25B6EDC70(0, &qword_26A50DDB0);
    id v1 = (void *)sub_25B7583A0();
    id v8 = v7;
  }
  else
  {
    id v9 = v11[0];
    sub_25B757EA0();

    swift_willThrow();
  }

  return v1;
}

objc_class *sub_25B6F5690(void *a1, void *a2)
{
  id v3 = v2;
  v144[3] = *(id *)MEMORY[0x263EF8340];
  id v6 = (void **)sub_25B758230();
  id v7 = (objc_class *)*(v6 - 1);
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  id v10 = &v135[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  unint64_t v13 = &v135[-v12];
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  id v139 = &v135[-v15];
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = &v135[-v16];
  id v18 = (objc_class *)objc_msgSend(objc_allocWithZone(MEMORY[0x263EFE9F8]), sel_init);
  uint64_t v143 = v18;
  if (!a2)
  {
    if (qword_26A50D7D8 != -1) {
      swift_once();
    }
    uint64_t v50 = __swift_project_value_buffer((uint64_t)v6, (uint64_t)qword_26A510050);
    (*((void (**)(unsigned char *, uint64_t, void **))v7 + 2))(v13, v50, v6);
    uint64_t v51 = v3;
    unint64_t v52 = sub_25B758210();
    os_log_type_t v53 = sub_25B758470();
    if (os_log_type_enabled((os_log_t)v52, v53))
    {
      uint64_t v54 = swift_slowAlloc();
      v140 = v6;
      uint64_t v55 = v54;
      unint64_t v56 = (void *)swift_slowAlloc();
      v144[0] = v56;
      *(_DWORD *)uint64_t v55 = 136315394;
      id v139 = (unsigned char *)(v55 + 4);
      unint64_t v57 = v51;
      id v58 = objc_msgSend(v57, sel_description);
      unint64_t v59 = v7;
      uint64_t v60 = sub_25B7582F0();
      unint64_t v62 = v61;

      uint64_t v141 = sub_25B6E424C(v60, v62, (uint64_t *)v144);
      sub_25B7584C0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v55 + 12) = 2080;
      uint64_t v141 = sub_25B6E424C(0x28746361746E6F63, 0xEE00293A68746977, (uint64_t *)v144);
      sub_25B7584C0();
      _os_log_impl(&dword_25B6E0000, (os_log_t)v52, v53, "%s, %s: could not resolve contact due to no handle", (uint8_t *)v55, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261168610](v56, -1, -1);
      MEMORY[0x261168610](v55, -1, -1);

      (*((void (**)(unsigned char *, void **))v59 + 1))(v13, v140);
      return v143;
    }
LABEL_25:

    (*((void (**)(unsigned char *, void **))v7 + 1))(v13, v6);
    return v143;
  }
  uint64_t v19 = v18;
  v140 = v6;
  id v6 = (void **)&v3[OBJC_IVAR___SMContactsManagerInternal_cachedContact];
  uint64_t v20 = *(void **)&v3[OBJC_IVAR___SMContactsManagerInternal_cachedContact];
  if (!v20 || (v21 = v6[2]) == 0 || (v6[1] == a1 ? (BOOL v22 = v21 == a2) : (BOOL v22 = 0), !v22 && (sub_25B758590() & 1) == 0))
  {
    v138 = v7;
    id v7 = v19;
    swift_bridgeObjectRetain();
    uint64_t v47 = (void *)sub_25B7582E0();
    os_log_type_t v48 = (void *)sub_25B7582E0();
    [(objc_class *)v7 setValue:v47 forKey:v48];

    v144[0] = a1;
    v144[1] = a2;
    uint64_t v141 = 64;
    unint64_t v142 = 0xE100000000000000;
    sub_25B6F7BD4();
    if (sub_25B7584E0())
    {
      unint64_t v49 = (unint64_t)sub_25B6F5510();
      unint64_t v52 = v49;
      if (v49 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v108 = sub_25B758560();
        swift_bridgeObjectRelease();
        if (v108)
        {
LABEL_30:
          if ((v52 & 0xC000000000000001) == 0)
          {
            if (!*(void *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              __break(1u);
            }
            goto LABEL_32;
          }
LABEL_49:
          uint64_t v72 = (objc_class *)MEMORY[0x261167AD0](0, v52);
          goto LABEL_33;
        }
      }
      else if (*(void *)((v49 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_30;
      }
LABEL_51:
      swift_bridgeObjectRelease();
      goto LABEL_52;
    }
    uint64_t v63 = self;
    id v64 = objc_allocWithZone(MEMORY[0x263EFEB28]);
    swift_bridgeObjectRetain();
    uint64_t v65 = (void *)sub_25B7582E0();
    swift_bridgeObjectRelease();
    id v66 = objc_msgSend(v64, sel_initWithStringValue_, v65);

    id v67 = objc_msgSend(v63, sel_predicateForContactsMatchingPhoneNumber_, v66);
    os_log_t v68 = *(void **)&v3[OBJC_IVAR___SMContactsManagerInternal_store];
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DDA8);
    os_log_t v69 = (void *)sub_25B758390();
    v144[0] = 0;
    unint64_t v13 = objc_msgSend(v68, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v67, v69, v144);

    id v70 = v144[0];
    if (!v13)
    {
      id v80 = v144[0];
      id v81 = (void *)sub_25B757EA0();

      swift_willThrow();
      id v82 = v138;
      uint64_t v83 = (uint64_t)v140;
      if (qword_26A50D7D8 != -1) {
        swift_once();
      }
      uint64_t v84 = __swift_project_value_buffer(v83, (uint64_t)qword_26A510050);
      (*((void (**)(unsigned char *, uint64_t, uint64_t))v82 + 2))(v10, v84, v83);
      id v85 = v3;
      id v86 = v81;
      os_log_type_t v87 = v85;
      swift_bridgeObjectRetain();
      id v88 = v81;
      uint64_t v89 = sub_25B758210();
      os_log_type_t v90 = sub_25B758470();
      int v91 = v90;
      if (os_log_type_enabled(v89, v90))
      {
        uint64_t v92 = swift_slowAlloc();
        id v139 = (unsigned char *)swift_slowAlloc();
        v144[0] = v139;
        *(_DWORD *)uint64_t v92 = 136315906;
        os_log_t v137 = v89;
        id v93 = v87;
        id v94 = objc_msgSend(v93, sel_description);
        uint64_t v95 = sub_25B7582F0();
        int v136 = v91;
        uint64_t v96 = v95;
        unint64_t v98 = v97;

        uint64_t v141 = sub_25B6E424C(v96, v98, (uint64_t *)v144);
        sub_25B7584C0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v92 + 12) = 2080;
        uint64_t v141 = sub_25B6E424C(0x28746361746E6F63, 0xEE00293A68746977, (uint64_t *)v144);
        sub_25B7584C0();
        *(_WORD *)(v92 + 22) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v141 = sub_25B6E424C((uint64_t)a1, (unint64_t)a2, (uint64_t *)v144);
        sub_25B7584C0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v92 + 32) = 2080;
        swift_getErrorValue();
        uint64_t v99 = sub_25B7585C0();
        uint64_t v141 = sub_25B6E424C(v99, v100, (uint64_t *)v144);
        sub_25B7584C0();
        swift_bridgeObjectRelease();

        os_log_t v101 = v137;
        _os_log_impl(&dword_25B6E0000, v137, (os_log_type_t)v136, "%s, %s: Unable to resolve contact from handle - %s| Error: %s", (uint8_t *)v92, 0x2Au);
        v102 = v139;
        swift_arrayDestroy();
        MEMORY[0x261168610](v102, -1, -1);
        MEMORY[0x261168610](v92, -1, -1);

        (*((void (**)(unsigned char *, void **))v138 + 1))(v10, v140);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*((void (**)(unsigned char *, uint64_t))v82 + 1))(v10, v83);
      }
      return v143;
    }
    sub_25B6EDC70(0, &qword_26A50DDB0);
    unint64_t v52 = sub_25B7583A0();
    id v71 = v70;

    if (v52 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v51 = (char *)sub_25B758560();
      swift_bridgeObjectRelease();
      if (!v51) {
        goto LABEL_51;
      }
    }
    else
    {
      uint64_t v51 = *(char **)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v51) {
        goto LABEL_51;
      }
    }
    if ((v52 & 0xC000000000000001) != 0) {
      goto LABEL_49;
    }
    if (*(void *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_32:
      uint64_t v72 = (objc_class *)*(id *)(v52 + 32);
LABEL_33:
      uint64_t v73 = v72;
      swift_bridgeObjectRelease();
      uint64_t v74 = v73;
      id v75 = [(objc_class *)v74 givenName];
      uint64_t v76 = sub_25B7582F0();
      unint64_t v78 = v77;

      swift_bridgeObjectRelease();
      uint64_t v79 = HIBYTE(v78) & 0xF;
      if ((v78 & 0x2000000000000000) == 0) {
        uint64_t v79 = v76 & 0xFFFFFFFFFFFFLL;
      }
      if (v79)
      {

        id v7 = v74;
LABEL_45:

        uint64_t v143 = v74;
LABEL_53:
        id v109 = *v6;
        *id v6 = v74;
        v6[1] = a1;
        v6[2] = a2;
        id v110 = v74;

        swift_bridgeObjectRelease();
        id v111 = v138;
        if (qword_26A50D7D8 != -1) {
          swift_once();
        }
        uint64_t v112 = (uint64_t)v140;
        uint64_t v113 = __swift_project_value_buffer((uint64_t)v140, (uint64_t)qword_26A510050);
        v114 = v139;
        (*((void (**)(unsigned char *, uint64_t, uint64_t))v111 + 2))(v139, v113, v112);
        id v115 = v143;
        v116 = v3;
        uint64_t v117 = v115;
        v118 = v116;
        v119 = v117;
        v120 = sub_25B758210();
        os_log_type_t v121 = sub_25B758450();
        int v122 = v121;
        if (os_log_type_enabled(v120, v121))
        {
          uint64_t v123 = swift_slowAlloc();
          os_log_t v137 = (os_log_t)swift_slowAlloc();
          v144[0] = v137;
          *(_DWORD *)uint64_t v123 = 136315650;
          v124 = v118;
          id v125 = objc_msgSend(v124, sel_description);
          uint64_t v126 = sub_25B7582F0();
          int v136 = v122;
          unint64_t v128 = v127;

          uint64_t v141 = sub_25B6E424C(v126, v128, (uint64_t *)v144);
          sub_25B7584C0();

          swift_bridgeObjectRelease();
          *(_WORD *)(v123 + 12) = 2080;
          uint64_t v141 = sub_25B6E424C(0x28746361746E6F63, 0xEE00293A68746977, (uint64_t *)v144);
          sub_25B7584C0();
          *(_WORD *)(v123 + 22) = 2080;
          id v129 = [(objc_class *)v119 givenName];
          uint64_t v130 = sub_25B7582F0();
          unint64_t v132 = v131;

          uint64_t v141 = sub_25B6E424C(v130, v132, (uint64_t *)v144);
          sub_25B7584C0();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_25B6E0000, v120, (os_log_type_t)v136, "%s, %s: setting cached contact %s", (uint8_t *)v123, 0x20u);
          os_log_t v133 = v137;
          swift_arrayDestroy();
          MEMORY[0x261168610](v133, -1, -1);
          MEMORY[0x261168610](v123, -1, -1);

          (*((void (**)(unsigned char *, uint64_t))v138 + 1))(v139, v112);
        }
        else
        {

          (*((void (**)(unsigned char *, uint64_t))v111 + 1))(v114, v112);
        }
        swift_beginAccess();
        return v143;
      }
      id v103 = [(objc_class *)v74 familyName];
      uint64_t v104 = sub_25B7582F0();
      unint64_t v106 = v105;

      swift_bridgeObjectRelease();
      uint64_t v107 = HIBYTE(v106) & 0xF;
      if ((v106 & 0x2000000000000000) == 0) {
        uint64_t v107 = v104 & 0xFFFFFFFFFFFFLL;
      }
      if (v107) {
        goto LABEL_45;
      }

LABEL_52:
      uint64_t v74 = v7;
      goto LABEL_53;
    }
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v23 = qword_26A50D7D8;
  id v24 = v20;
  if (v23 != -1) {
    swift_once();
  }
  uint64_t v25 = (uint64_t)v140;
  uint64_t v26 = __swift_project_value_buffer((uint64_t)v140, (uint64_t)qword_26A510050);
  (*((void (**)(unsigned char *, uint64_t, uint64_t))v7 + 2))(v17, v26, v25);
  id v27 = v24;
  id v28 = v3;
  id v29 = v27;
  uint64_t v30 = v28;
  os_log_type_t v31 = sub_25B758210();
  os_log_type_t v32 = sub_25B758460();
  int v33 = v32;
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v34 = swift_slowAlloc();
    LODWORD(v137) = v33;
    uint64_t v35 = v34;
    id v139 = (unsigned char *)swift_slowAlloc();
    v144[0] = v139;
    *(_DWORD *)uint64_t v35 = 136315650;
    uint64_t v36 = v30;
    v138 = v7;
    unint64_t v37 = v36;
    id v38 = objc_msgSend(v36, sel_description);
    uint64_t v39 = sub_25B7582F0();
    unint64_t v41 = v40;

    uint64_t v141 = sub_25B6E424C(v39, v41, (uint64_t *)v144);
    sub_25B7584C0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 12) = 2080;
    uint64_t v141 = sub_25B6E424C(0x28746361746E6F63, 0xEE00293A68746977, (uint64_t *)v144);
    sub_25B7584C0();
    *(_WORD *)(v35 + 22) = 2080;
    id v42 = objc_msgSend(v29, sel_givenName);
    uint64_t v43 = sub_25B7582F0();
    unint64_t v45 = v44;

    uint64_t v141 = sub_25B6E424C(v43, v45, (uint64_t *)v144);
    sub_25B7584C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25B6E0000, v31, (os_log_type_t)v137, "%s, %s: returning cached contact %s", (uint8_t *)v35, 0x20u);
    id v46 = v139;
    swift_arrayDestroy();
    MEMORY[0x261168610](v46, -1, -1);
    MEMORY[0x261168610](v35, -1, -1);

    (*((void (**)(unsigned char *, uint64_t))v138 + 1))(v17, v25);
  }
  else
  {

    (*((void (**)(unsigned char *, uint64_t))v7 + 1))(v17, v25);
  }

  return (objc_class *)v29;
}

uint64_t sub_25B6F67A4(void *a1)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFE9F8]), sel_init);
  if (a1)
  {
    id v5 = a1;
    id v6 = objc_msgSend(v5, sel_receiverHandles);
    sub_25B6EDC70(0, (unint64_t *)&unk_26A50DDC0);
    unint64_t v7 = sub_25B7583A0();

    if (v7 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_25B758560();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v8 < 1)
    {
      if (qword_26A50D7D8 == -1)
      {
LABEL_21:
        uint64_t v34 = sub_25B758230();
        __swift_project_value_buffer(v34, (uint64_t)qword_26A510050);
        id v35 = v2;
        uint64_t v36 = sub_25B758210();
        os_log_type_t v37 = sub_25B758470();
        if (os_log_type_enabled(v36, v37))
        {
          uint64_t v38 = swift_slowAlloc();
          uint64_t v39 = swift_slowAlloc();
          uint64_t v50 = v39;
          *(_DWORD *)uint64_t v38 = 136315394;
          id v40 = v35;
          id v41 = objc_msgSend(v40, sel_description);
          uint64_t v42 = sub_25B7582F0();
          unint64_t v44 = v43;

          sub_25B6E424C(v42, v44, &v50);
          sub_25B7584C0();

          swift_bridgeObjectRelease();
          *(_WORD *)(v38 + 12) = 2080;
          sub_25B6E424C(0xD000000000000024, 0x800000025B7635D0, &v50);
          sub_25B7584C0();
          _os_log_impl(&dword_25B6E0000, v36, v37, "%s, %s: could not resolve contact due to no handles", (uint8_t *)v38, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x261168610](v39, -1, -1);
          MEMORY[0x261168610](v38, -1, -1);
        }
        else
        {
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DDB8);
        uint64_t v46 = swift_allocObject();
        *(_OWORD *)(v46 + 16) = xmmword_25B75DA80;
        *(void *)(v46 + 32) = v4;
        uint64_t v50 = v46;
        sub_25B7583C0();
        uint64_t v33 = v50;

        return v33;
      }
LABEL_33:
      swift_once();
      goto LABEL_21;
    }
    uint64_t v50 = MEMORY[0x263F8EE78];
    id v9 = objc_msgSend(v5, sel_receiverHandles);
    unint64_t v10 = sub_25B7583A0();

    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_25B758560();
      swift_bridgeObjectRelease();
      if (v11) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v11)
      {
LABEL_7:
        if (v11 >= 1)
        {
          id v48 = v4;
          unint64_t v49 = v5;
          uint64_t v12 = 0;
          do
          {
            if ((v10 & 0xC000000000000001) != 0) {
              id v13 = (id)MEMORY[0x261167AD0](v12, v10);
            }
            else {
              id v13 = *(id *)(v10 + 8 * v12 + 32);
            }
            uint64_t v14 = v13;
            id v15 = objc_msgSend(v13, sel_primaryHandle, v48);
            uint64_t v16 = (void *)sub_25B7582F0();
            id v18 = v17;

            sub_25B6F5690(v16, v18);
            uint64_t v19 = swift_bridgeObjectRelease();
            MEMORY[0x261167940](v19);
            if (*(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_25B7583D0();
            }
            ++v12;
            sub_25B7583E0();
            sub_25B7583C0();
          }
          while (v11 != v12);

          swift_bridgeObjectRelease();
          uint64_t v33 = v50;
          id v4 = v48;
          goto LABEL_30;
        }
        __break(1u);
        goto LABEL_33;
      }
    }

    swift_bridgeObjectRelease();
    uint64_t v33 = MEMORY[0x263F8EE78];
LABEL_30:

    return v33;
  }
  if (qword_26A50D7D8 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_25B758230();
  __swift_project_value_buffer(v20, (uint64_t)qword_26A510050);
  id v21 = v2;
  BOOL v22 = sub_25B758210();
  os_log_type_t v23 = sub_25B758470();
  if (os_log_type_enabled(v22, v23))
  {
    id v24 = v4;
    uint64_t v25 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v50 = v26;
    *(_DWORD *)uint64_t v25 = 136315394;
    id v27 = v21;
    id v28 = objc_msgSend(v27, sel_description);
    uint64_t v29 = sub_25B7582F0();
    unint64_t v31 = v30;

    sub_25B6E424C(v29, v31, &v50);
    sub_25B7584C0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2080;
    sub_25B6E424C(0xD000000000000024, 0x800000025B7635D0, &v50);
    sub_25B7584C0();
    _os_log_impl(&dword_25B6E0000, v22, v23, "%s, %s: could not resolve contact due to no session state or configuration", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261168610](v26, -1, -1);
    uint64_t v32 = v25;
    id v4 = v24;
    MEMORY[0x261168610](v32, -1, -1);
  }
  else
  {
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DDB8);
  uint64_t v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = xmmword_25B75DA80;
  *(void *)(v45 + 32) = v4;
  uint64_t v50 = v45;
  sub_25B7583C0();
  return v50;
}

unint64_t sub_25B6F6EFC(unint64_t a1, uint64_t a2)
{
  unint64_t v3 = a1;
  v64[1] = *(id *)MEMORY[0x263EF8340];
  if (!a1) {
    return v3;
  }
  if (!a2) {
    return 0;
  }
  id v4 = v2;
  swift_bridgeObjectRetain();
  unint64_t v5 = swift_bridgeObjectRetain();
  sub_25B6F7C28(v5);
  unint64_t v63 = v3;
  if (v3 >> 62)
  {
LABEL_38:
    swift_bridgeObjectRetain_n();
    uint64_t v6 = sub_25B758560();
    if (v6) {
      goto LABEL_5;
    }
LABEL_39:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v3;
  }
  uint64_t v6 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  if (!v6) {
    goto LABEL_39;
  }
LABEL_5:
  uint64_t v7 = self;
  unint64_t v57 = v4;
  id v59 = *(id *)&v4[OBJC_IVAR___SMContactsManagerInternal_store];
  id v60 = (id)v7;
  for (uint64_t i = 4; ; ++i)
  {
    unint64_t v9 = i - 4;
    if ((v3 & 0xC000000000000001) != 0) {
      id v10 = (id)MEMORY[0x261167AD0](i - 4, v3);
    }
    else {
      id v10 = *(id *)(v3 + 8 * i);
    }
    uint64_t v11 = v10;
    uint64_t v12 = i - 3;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DAB8);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_25B75DA90;
    id v14 = objc_msgSend(v11, sel_identifier);
    uint64_t v15 = sub_25B7582F0();
    uint64_t v17 = v16;

    *(void *)(v13 + 32) = v15;
    *(void *)(v13 + 40) = v17;
    id v18 = (void *)sub_25B758390();
    swift_bridgeObjectRelease();
    id v19 = objc_msgSend(v60, sel_predicateForContactsWithIdentifiers_, v18);

    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DDA8);
    id v21 = (void *)sub_25B758390();
    v64[0] = 0;
    id v22 = objc_msgSend(v59, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v19, v21, v64);

    id v4 = (char *)v64[0];
    if (!v22) {
      break;
    }
    sub_25B6EDC70(0, &qword_26A50DDB0);
    unint64_t v23 = sub_25B7583A0();
    id v24 = v4;

    if (v23 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_25B758560();
      swift_bridgeObjectRelease();
      if (!v31)
      {
LABEL_6:

        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
    }
    else if (!*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_6;
    }
    if ((v23 & 0xC000000000000001) != 0)
    {
      uint64_t v25 = (char *)MEMORY[0x261167AD0](0, v23);
    }
    else
    {
      if (!*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_36;
      }
      uint64_t v25 = (char *)*(id *)(v23 + 32);
    }
    id v4 = v25;
    swift_bridgeObjectRelease();
    unint64_t v26 = v63;
    id v27 = v4;
    if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
      || (v63 & 0x8000000000000000) != 0
      || (v63 & 0x4000000000000000) != 0)
    {
      sub_25B6F7DF4(v63);
      unint64_t v26 = v28;
      unint64_t v63 = v28;
    }
    uint64_t v29 = v26 & 0xFFFFFFFFFFFFFF8;
    if (v9 >= *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_37;
    }
    unint64_t v30 = *(void **)(v29 + 8 * i);
    *(void *)(v29 + 8 * i) = v27;

    sub_25B7583C0();
LABEL_7:
    if (v12 == v6)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v63;
    }
  }
  id v32 = v64[0];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v33 = (void *)sub_25B757EA0();

  swift_willThrow();
  if (qword_26A50D7D8 != -1) {
    swift_once();
  }
  uint64_t v34 = sub_25B758230();
  __swift_project_value_buffer(v34, (uint64_t)qword_26A510050);
  id v35 = v57;
  id v36 = v11;
  id v37 = v33;
  id v38 = v35;
  id v39 = v36;
  id v40 = v33;
  swift_bridgeObjectRetain();
  id v41 = sub_25B758210();
  os_log_type_t v42 = sub_25B758470();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = swift_slowAlloc();
    unint64_t v62 = (void *)swift_slowAlloc();
    id v61 = (id)swift_slowAlloc();
    v64[0] = v61;
    *(_DWORD *)uint64_t v43 = 136316162;
    os_log_type_t type = v42;
    id v44 = v38;
    id v45 = objc_msgSend(v44, sel_description);
    uint64_t v46 = sub_25B7582F0();
    unint64_t v48 = v47;

    sub_25B6E424C(v46, v48, (uint64_t *)v64);
    sub_25B7584C0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v43 + 12) = 2080;
    sub_25B6E424C(0xD000000000000025, 0x800000025B763600, (uint64_t *)v64);
    sub_25B7584C0();
    *(_WORD *)(v43 + 22) = 2112;
    id v49 = v39;
    sub_25B7584C0();
    *unint64_t v62 = v39;

    *(_WORD *)(v43 + 32) = 2080;
    uint64_t v50 = swift_bridgeObjectRetain();
    uint64_t v51 = MEMORY[0x261167970](v50, v20);
    unint64_t v53 = v52;
    swift_bridgeObjectRelease();
    sub_25B6E424C(v51, v53, (uint64_t *)v64);
    sub_25B7584C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v43 + 42) = 2080;
    swift_getErrorValue();
    uint64_t v54 = sub_25B7585C0();
    sub_25B6E424C(v54, v55, (uint64_t *)v64);
    sub_25B7584C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25B6E0000, v41, type, "%s, %s: Unable to fetch additional keys for contact - %@, keys - %s| Error: %s", (uint8_t *)v43, 0x34u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A50DDD0);
    swift_arrayDestroy();
    MEMORY[0x261168610](v62, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x261168610](v61, -1, -1);
    MEMORY[0x261168610](v43, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return 0;
}

id sub_25B6F7798()
{
  v24[1] = *(id *)MEMORY[0x263EF8340];
  id v1 = *(void **)&v0[OBJC_IVAR___SMContactsManagerInternal_store];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DDA8);
  uint64_t v2 = (void *)sub_25B758390();
  v24[0] = 0;
  id v3 = objc_msgSend(v1, sel__crossPlatformUnifiedMeContactWithKeysToFetch_error_, v2, v24);

  id v4 = v24[0];
  if (!v3)
  {
    unint64_t v5 = v4;
    uint64_t v6 = (void *)sub_25B757EA0();

    swift_willThrow();
    if (qword_26A50D7D8 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_25B758230();
    __swift_project_value_buffer(v7, (uint64_t)qword_26A510050);
    uint64_t v8 = v0;
    id v9 = v6;
    id v10 = v8;
    id v11 = v6;
    uint64_t v12 = sub_25B758210();
    os_log_type_t v13 = sub_25B758470();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = (void *)swift_slowAlloc();
      v24[0] = v15;
      *(_DWORD *)uint64_t v14 = 136315650;
      uint64_t v16 = v10;
      id v17 = objc_msgSend(v16, sel_description);
      uint64_t v18 = sub_25B7582F0();
      unint64_t v20 = v19;

      sub_25B6E424C(v18, v20, (uint64_t *)v24);
      sub_25B7584C0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      sub_25B6E424C(0xD000000000000012, 0x800000025B763630, (uint64_t *)v24);
      sub_25B7584C0();
      *(_WORD *)(v14 + 22) = 2080;
      swift_getErrorValue();
      uint64_t v21 = sub_25B7585C0();
      sub_25B6E424C(v21, v22, (uint64_t *)v24);
      sub_25B7584C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25B6E0000, v12, v13, "%s, %s: Unable to fetch self contact, error: %s", (uint8_t *)v14, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x261168610](v15, -1, -1);
      MEMORY[0x261168610](v14, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  return v3;
}

uint64_t sub_25B6F7B40()
{
  uint64_t v0 = sub_25B758230();
  __swift_allocate_value_buffer(v0, qword_26A510050);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A510050);
  swift_bridgeObjectRetain();
  return sub_25B758220();
}

unint64_t sub_25B6F7BD4()
{
  unint64_t result = qword_26A50DD90;
  if (!qword_26A50DD90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50DD90);
  }
  return result;
}

uint64_t sub_25B6F7C28(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_25B758560();
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
    uint64_t v5 = sub_25B758560();
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
  unint64_t *v1 = v4;
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
    unint64_t v4 = MEMORY[0x261167AE0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_25B6F81B0(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_25B758560();
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
  return sub_25B7583C0();
}

void sub_25B6F7DF4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_25B758560();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x261167AE0);
}

uint64_t method lookup function for ContactsManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ContactsManager);
}

uint64_t dispatch thunk of ContactsManager.contact(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ContactsManager.activeSessionRecipientContacts(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ContactsManager.fetchAdditionalInfo(for:keysToFetch:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ContactsManager.fetchSelfContact()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t destroy for ContactsManager.SMCNContact(id *a1)
{
  return swift_bridgeObjectRelease();
}

void *_s13SafetyMonitor15ContactsManagerC11SMCNContactVwCP_0(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ContactsManager.SMCNContact(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ContactsManager.SMCNContact(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactsManager.SMCNContact(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactsManager.SMCNContact(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactsManager.SMCNContact()
{
  return &type metadata for ContactsManager.SMCNContact;
}

uint64_t sub_25B6F8158()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25B6F8190(uint64_t a1)
{
  return sub_25B6F4F60(a1, *(void **)(v1 + 16));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_25B6F81B0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25B758560();
    swift_bridgeObjectRelease();
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
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25B758560();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_25B6F8468();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DDE0);
          uint64_t v12 = sub_25B6F83B8(v16, i, a3);
          uint64_t v14 = *v13;
          swift_unknownObjectRetain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DDA8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_25B758570();
  __break(1u);
  return result;
}

void (*sub_25B6F83B8(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_25B6F850C(v6, a2, a3);
  return sub_25B6F8420;
}

void sub_25B6F8420(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

unint64_t sub_25B6F8468()
{
  unint64_t result = qword_26A50DDE8;
  if (!qword_26A50DDE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A50DDE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50DDE8);
  }
  return result;
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

uint64_t (*sub_25B6F850C(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = MEMORY[0x261167AD0](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_unknownObjectRetain();
LABEL_5:
    *uint64_t v3 = v4;
    return sub_25B6F858C;
  }
  __break(1u);
  return result;
}

uint64_t sub_25B6F858C()
{
  return swift_unknownObjectRelease();
}

id CNContact.localizedName.getter()
{
  id result = objc_msgSend(self, sel_componentsForContact_, v0);
  if (result)
  {
    uint64_t v2 = result;
    id v3 = objc_msgSend(self, sel_localizedStringFromPersonNameComponents_style_options_, result, 1, 0);
    uint64_t v4 = sub_25B7582F0();

    return (id)v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25B6F8634()
{
  unint64_t v0 = SendValidity.Case.rawValue.getter();
  uint64_t v2 = v1;
  if (v0 == SendValidity.Case.rawValue.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_25B758590();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

BOOL sub_25B6F86CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 == a3;
}

void sub_25B6F86D8(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

void sub_25B6F86E8(uint64_t a1@<X8>)
{
  sub_25B6FCF38();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 9) = v4 & 1;
}

uint64_t sub_25B6F871C()
{
  return *(void *)v0;
}

void sub_25B6F8724(uint64_t a1@<X8>)
{
  sub_25B6FCF38();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 9) = v4 & 1;
}

uint64_t sub_25B6F875C()
{
  return sub_25B7585E0();
}

uint64_t sub_25B6F87C8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25B6FB510();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

uint64_t sub_25B6F8814()
{
  return sub_25B7585E0();
}

BOOL sub_25B6F887C(uint64_t a1, uint64_t *a2)
{
  return sub_25B6F86CC(*(void *)a1, *(unsigned __int8 *)(a1 + 8), *a2);
}

void sub_25B6F8898()
{
  qword_26A510068 = (uint64_t)&unk_27090A7C8;
}

uint64_t sub_25B6F88AC@<X0>(void *a1@<X8>)
{
  if (qword_26A50D7E0 != -1) {
    swift_once();
  }
  *a1 = qword_26A510068;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25B6F8918()
{
  uint64_t v0 = sub_25B758200();
  __swift_allocate_value_buffer(v0, qword_26A510070);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A510070);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DE78);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A50DE80) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_25B75DAF0;
  unint64_t v4 = v24 + v3;
  unint64_t v5 = v24 + v3 + v1[14];
  *(void *)(v24 + v3) = 0;
  *(void *)unint64_t v5 = "FETCH_SAFETY_CACHE_RESPONSE_CODE_SUCCESS";
  *(void *)(v5 + 8) = 40;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_25B7581E0();
  uint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v4 + v2 + v1[14];
  *(void *)(v4 + v2) = 1;
  *(void *)unint64_t v9 = "FETCH_SAFETY_CACHE_RESPONSE_CODE_UNKNOWN_ERROR";
  *(void *)(v9 + 8) = 46;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  uint64_t v10 = (void *)(v4 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  *uint64_t v10 = 2;
  *(void *)uint64_t v11 = "FETCH_SAFETY_CACHE_RESPONSE_CODE_DENIED";
  *((void *)v11 + 1) = 39;
  v11[16] = 2;
  v8();
  uint64_t v12 = (void *)(v4 + 3 * v2);
  BOOL v13 = (char *)v12 + v1[14];
  *uint64_t v12 = 3;
  *(void *)BOOL v13 = "FETCH_SAFETY_CACHE_RESPONSE_CODE_MISSING_ACCESS_DATA_RECORD";
  *((void *)v13 + 1) = 59;
  v13[16] = 2;
  v8();
  uint64_t v14 = (void *)(v4 + 4 * v2);
  uint64_t v15 = (char *)v14 + v1[14];
  *uint64_t v14 = 4;
  *(void *)uint64_t v15 = "FETCH_SAFETY_CACHE_RESPONSE_CODE_MISSING_SAFETY_CACHE_RECORD";
  *((void *)v15 + 1) = 60;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v4 + 5 * v2);
  id v17 = (char *)v16 + v1[14];
  *uint64_t v16 = 5;
  *(void *)id v17 = "FETCH_SAFETY_CACHE_RESPONSE_CODE_MISSING_TOKEN";
  *((void *)v17 + 1) = 46;
  v17[16] = 2;
  v8();
  uint64_t v18 = (void *)(v4 + 6 * v2);
  unint64_t v19 = (char *)v18 + v1[14];
  *uint64_t v18 = 6;
  *(void *)unint64_t v19 = "FETCH_SAFETY_CACHE_RESPONSE_CODE_MISSING_RELEASE_TIME";
  *((void *)v19 + 1) = 53;
  v19[16] = 2;
  v8();
  unint64_t v20 = (void *)(v4 + 7 * v2);
  uint64_t v21 = (char *)v20 + v1[14];
  *unint64_t v20 = 7;
  *(void *)uint64_t v21 = "FETCH_SAFETY_CACHE_RESPONSE_CODE_ZONE_NOT_FOUND";
  *((void *)v21 + 1) = 47;
  v21[16] = 2;
  v8();
  uint64_t v22 = v4 + 8 * v2 + v1[14];
  *(void *)(v4 + 8 * v2) = 8;
  *(void *)uint64_t v22 = "FETCH_SAFETY_CACHE_RESPONSE_CODE_RECORD_TRANSPORT_INIT_FAILURE";
  *(void *)(v22 + 8) = 62;
  *(unsigned char *)(v22 + 16) = 2;
  v8();
  return sub_25B7581F0();
}

uint64_t sub_25B6F8C88@<X0>(uint64_t a1@<X8>)
{
  return sub_25B6FA350(&qword_26A50D7E8, (uint64_t)qword_26A510070, a1);
}

void sub_25B6F8CAC()
{
  unk_26A510095 = 0;
  unk_26A510096 = -5120;
}

uint64_t sub_25B6F8CD8(uint64_t a1)
{
  return sub_25B6F8FC4(a1, qword_26A510098, (uint64_t)"name", 4);
}

uint64_t sub_25B6F8CF0@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  return sub_25B7580E0();
}

uint64_t sub_25B6F8D18(uint64_t a1, uint64_t a2)
{
  return sub_25B6F926C(a1, a2, &qword_26A50D7F0, &qword_26A510088);
}

uint64_t (*sub_25B6F8D4C())()
{
  return nullsub_1;
}

uint64_t sub_25B6F8D70()
{
  return sub_25B6F9120();
}

uint64_t sub_25B6F8D88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25B6F9190(a1, a2, a3, (void (*)(void))type metadata accessor for HelloRequest);
}

uint64_t sub_25B6F8DB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25B6FA634(&qword_26A50DE88, (void (*)(uint64_t))type metadata accessor for HelloRequest);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25B6F8E38@<X0>(uint64_t a1@<X8>)
{
  return sub_25B6FA350(&qword_26A50D7F8, (uint64_t)qword_26A510098, a1);
}

uint64_t sub_25B6F8E5C(uint64_t a1)
{
  uint64_t v2 = sub_25B6FA634(&qword_26A50DE50, (void (*)(uint64_t))type metadata accessor for HelloRequest);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25B6F8ECC()
{
  sub_25B6FA634(&qword_26A50DE50, (void (*)(uint64_t))type metadata accessor for HelloRequest);
  return sub_25B758190();
}

uint64_t sub_25B6F8F4C(char *a1, char *a2)
{
  return sub_25B6FAB64(a1, a2, type metadata accessor for HelloRequest) & 1;
}

void sub_25B6F8F7C()
{
  *(_WORD *)&algn_26A5100B8[6] = -4864;
}

uint64_t sub_25B6F8FAC(uint64_t a1)
{
  return sub_25B6F8FC4(a1, qword_26A5100C0, (uint64_t)"response", 8);
}

uint64_t sub_25B6F8FC4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_25B758200();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DE78);
  uint64_t v8 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A50DE80) - 8);
  unint64_t v9 = (*(unsigned __int8 *)(*(void *)v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v8 + 80);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_25B75DA90;
  unint64_t v11 = v10 + v9 + v8[14];
  *(void *)(v10 + v9) = 1;
  *(void *)unint64_t v11 = a3;
  *(void *)(v11 + 8) = a4;
  *(unsigned char *)(v11 + 16) = 2;
  uint64_t v12 = *MEMORY[0x263F50718];
  uint64_t v13 = sub_25B7581E0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 104))(v11, v12, v13);
  return sub_25B7581F0();
}

uint64_t sub_25B6F9120()
{
  while (1)
  {
    uint64_t result = sub_25B758130();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    if (result == 1) {
      sub_25B758150();
    }
  }
  return result;
}

uint64_t sub_25B6F9190(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  unint64_t v7 = v4[1];
  uint64_t v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0) {
    uint64_t v8 = *v4 & 0xFFFFFFFFFFFFLL;
  }
  if (!v8 || (uint64_t result = sub_25B7581C0(), !v5))
  {
    a4(0);
    return sub_25B7580D0();
  }
  return result;
}

uint64_t sub_25B6F9244(uint64_t a1, uint64_t a2)
{
  return sub_25B6F926C(a1, a2, &qword_26A50D800, &qword_26A5100B0);
}

uint64_t sub_25B6F926C(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v5 = *a4;
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_25B6F92C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25B6F9190(a1, a2, a3, (void (*)(void))type metadata accessor for HelloResponse);
}

uint64_t sub_25B6F92F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25B6FA634(&qword_26A50DE98, (void (*)(uint64_t))type metadata accessor for HelloResponse);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25B6F936C@<X0>(uint64_t a1@<X8>)
{
  return sub_25B6FA350(&qword_26A50D808, (uint64_t)qword_26A5100C0, a1);
}

uint64_t sub_25B6F9390(uint64_t a1)
{
  uint64_t v2 = sub_25B6FA634(&qword_26A50DE30, (void (*)(uint64_t))type metadata accessor for HelloResponse);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25B6F93FC()
{
  sub_25B6FA634(&qword_26A50DE30, (void (*)(uint64_t))type metadata accessor for HelloResponse);
  return sub_25B758190();
}

uint64_t sub_25B6F9478(char *a1, char *a2)
{
  return sub_25B6FAB64(a1, a2, type metadata accessor for HelloResponse) & 1;
}

uint64_t sub_25B6F94A8()
{
  uint64_t v0 = sub_25B758200();
  __swift_allocate_value_buffer(v0, qword_26A5100D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A5100D8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DE78);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A50DE80) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_25B75D420;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "zoneName";
  *(void *)(v6 + 8) = 8;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_25B7581E0();
  unint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "token";
  *((void *)v10 + 1) = 5;
  v10[16] = 2;
  v9();
  return sub_25B7581F0();
}

uint64_t sub_25B6F9660()
{
  uint64_t result = sub_25B758130();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2 || result == 1) {
        sub_25B758150();
      }
      uint64_t result = sub_25B758130();
    }
  }
  return result;
}

uint64_t sub_25B6F96F4()
{
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_25B7581C0(), !v1))
  {
    unint64_t v5 = v0[3];
    uint64_t v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0) {
      uint64_t v6 = v0[2] & 0xFFFFFFFFFFFFLL;
    }
    if (!v6 || (uint64_t result = sub_25B7581C0(), !v1))
    {
      type metadata accessor for FetchSafetyCacheRequest(0);
      return sub_25B7580D0();
    }
  }
  return result;
}

uint64_t sub_25B6F97D0@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  return sub_25B7580E0();
}

unint64_t sub_25B6F97FC()
{
  return 0xD000000000000017;
}

uint64_t sub_25B6F9818@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 24);
  uint64_t v5 = sub_25B7580F0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_25B6F9888(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 24);
  uint64_t v5 = sub_25B7580F0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*sub_25B6F98F8())()
{
  return nullsub_1;
}

uint64_t sub_25B6F991C()
{
  return sub_25B6F9660();
}

uint64_t sub_25B6F9934()
{
  return sub_25B6F96F4();
}

uint64_t sub_25B6F994C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25B6FA634(&qword_26A50DEA0, (void (*)(uint64_t))type metadata accessor for FetchSafetyCacheRequest);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25B6F99C8@<X0>(uint64_t a1@<X8>)
{
  return sub_25B6FA350(&qword_26A50D810, (uint64_t)qword_26A5100D8, a1);
}

uint64_t sub_25B6F99EC(uint64_t a1)
{
  uint64_t v2 = sub_25B6FA634((unint64_t *)&qword_26A50DD60, (void (*)(uint64_t))type metadata accessor for FetchSafetyCacheRequest);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25B6F9A58()
{
  sub_25B6FA634((unint64_t *)&qword_26A50DD60, (void (*)(uint64_t))type metadata accessor for FetchSafetyCacheRequest);
  return sub_25B758190();
}

uint64_t sub_25B6F9AD8()
{
  uint64_t v0 = sub_25B758200();
  __swift_allocate_value_buffer(v0, qword_26A5100F0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A5100F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DE78);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A50DE80) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_25B75D420;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "responseCode";
  *(void *)(v6 + 8) = 12;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_25B7581E0();
  unint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "safetyCacheRecord";
  *((void *)v10 + 1) = 17;
  v10[16] = 2;
  v9();
  return sub_25B7581F0();
}

uint64_t sub_25B6F9C90()
{
  uint64_t result = sub_25B758130();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2)
      {
        sub_25B6F9D6C();
      }
      else if (result == 1)
      {
        sub_25B6FB510();
        sub_25B758140();
      }
      uint64_t result = sub_25B758130();
    }
  }
  return result;
}

uint64_t sub_25B6F9D6C()
{
  return sub_25B758160();
}

uint64_t sub_25B6F9E1C()
{
  if (!*v0 || (sub_25B6FB510(), uint64_t result = sub_25B7581B0(), !v1))
  {
    uint64_t result = sub_25B6F9EF8((uint64_t)v0);
    if (!v1)
    {
      type metadata accessor for FetchSafetyCacheResponse(0);
      return sub_25B7580D0();
    }
  }
  return result;
}

uint64_t sub_25B6F9EF8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DD58);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25B7580C0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t SafetyCacheResponse = type metadata accessor for FetchSafetyCacheResponse(0);
  sub_25B6F4C70(a1 + *(int *)(SafetyCacheResponse + 24), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_25B6E5BE4((uint64_t)v4, &qword_26A50DD58);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  sub_25B6FA634(&qword_26A50DEB8, MEMORY[0x263F327D8]);
  sub_25B7581D0();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25B6FA0F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  sub_25B7580E0();
  uint64_t v4 = a2 + *(int *)(a1 + 24);
  uint64_t v5 = sub_25B7580C0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  return v6(v4, 1, 1, v5);
}

unint64_t sub_25B6FA184()
{
  return 0xD000000000000018;
}

uint64_t sub_25B6FA1A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = sub_25B7580F0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_25B6FA210(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25B7580F0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t sub_25B6FA280()
{
  return sub_25B6F9C90();
}

uint64_t sub_25B6FA298()
{
  return sub_25B6F9E1C();
}

uint64_t sub_25B6FA2B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25B6FA634(&qword_26A50DEA8, (void (*)(uint64_t))type metadata accessor for FetchSafetyCacheResponse);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25B6FA32C@<X0>(uint64_t a1@<X8>)
{
  return sub_25B6FA350(&qword_26A50D818, (uint64_t)qword_26A5100F0, a1);
}

uint64_t sub_25B6FA350@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25B758200();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t sub_25B6FA3EC(uint64_t a1)
{
  uint64_t v2 = sub_25B6FA634(&qword_26A50DDF8, (void (*)(uint64_t))type metadata accessor for FetchSafetyCacheResponse);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25B6FA458()
{
  return sub_25B7585E0();
}

uint64_t sub_25B6FA4B0()
{
  sub_25B6FA634(&qword_26A50DDF8, (void (*)(uint64_t))type metadata accessor for FetchSafetyCacheResponse);
  return sub_25B758190();
}

uint64_t sub_25B6FA52C()
{
  return sub_25B7585E0();
}

uint64_t sub_25B6FA584()
{
  return sub_25B6FA634(&qword_26A50DDF0, (void (*)(uint64_t))type metadata accessor for FetchSafetyCacheResponse);
}

uint64_t type metadata accessor for FetchSafetyCacheResponse(uint64_t a1)
{
  return sub_25B6FA9F4(a1, (uint64_t *)&unk_26A50DF00);
}

uint64_t sub_25B6FA5EC()
{
  return sub_25B6FA634(&qword_26A50DDF8, (void (*)(uint64_t))type metadata accessor for FetchSafetyCacheResponse);
}

uint64_t sub_25B6FA634(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25B6FA67C()
{
  return sub_25B6FA634(&qword_26A50DE00, (void (*)(uint64_t))type metadata accessor for FetchSafetyCacheResponse);
}

uint64_t sub_25B6FA6C4()
{
  return sub_25B6FA634(&qword_26A50DE08, (void (*)(uint64_t))type metadata accessor for FetchSafetyCacheResponse);
}

uint64_t sub_25B6FA70C()
{
  return sub_25B6FA634(&qword_26A50DE10, (void (*)(uint64_t))type metadata accessor for FetchSafetyCacheRequest);
}

uint64_t type metadata accessor for FetchSafetyCacheRequest(uint64_t a1)
{
  return sub_25B6FA9F4(a1, (uint64_t *)&unk_26A50DEF0);
}

uint64_t sub_25B6FA774()
{
  return sub_25B6FA634((unint64_t *)&qword_26A50DD60, (void (*)(uint64_t))type metadata accessor for FetchSafetyCacheRequest);
}

uint64_t sub_25B6FA7BC()
{
  return sub_25B6FA634(&qword_26A50DE18, (void (*)(uint64_t))type metadata accessor for FetchSafetyCacheRequest);
}

uint64_t sub_25B6FA804()
{
  return sub_25B6FA634(&qword_26A50DE20, (void (*)(uint64_t))type metadata accessor for FetchSafetyCacheRequest);
}

uint64_t sub_25B6FA84C()
{
  return sub_25B6FA634(&qword_26A50DE28, (void (*)(uint64_t))type metadata accessor for HelloResponse);
}

uint64_t type metadata accessor for HelloResponse(uint64_t a1)
{
  return sub_25B6FA9F4(a1, (uint64_t *)&unk_26A50DEE0);
}

uint64_t sub_25B6FA8B4()
{
  return sub_25B6FA634(&qword_26A50DE30, (void (*)(uint64_t))type metadata accessor for HelloResponse);
}

uint64_t sub_25B6FA8FC()
{
  return sub_25B6FA634(&qword_26A50DE38, (void (*)(uint64_t))type metadata accessor for HelloResponse);
}

uint64_t sub_25B6FA944()
{
  return sub_25B6FA634(&qword_26A50DE40, (void (*)(uint64_t))type metadata accessor for HelloResponse);
}

uint64_t sub_25B6FA98C()
{
  return sub_25B6FA634(&qword_26A50DE48, (void (*)(uint64_t))type metadata accessor for HelloRequest);
}

uint64_t type metadata accessor for HelloRequest(uint64_t a1)
{
  return sub_25B6FA9F4(a1, (uint64_t *)&unk_26A50DED0);
}

uint64_t sub_25B6FA9F4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25B6FAA2C()
{
  return sub_25B6FA634(&qword_26A50DE50, (void (*)(uint64_t))type metadata accessor for HelloRequest);
}

uint64_t sub_25B6FAA74()
{
  return sub_25B6FA634(&qword_26A50DE58, (void (*)(uint64_t))type metadata accessor for HelloRequest);
}

uint64_t sub_25B6FAABC()
{
  return sub_25B6FA634(&qword_26A50DE60, (void (*)(uint64_t))type metadata accessor for HelloRequest);
}

unint64_t sub_25B6FAB08()
{
  unint64_t result = qword_26A50DE68;
  if (!qword_26A50DE68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A50DE70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50DE68);
  }
  return result;
}

uint64_t sub_25B6FAB64(char *a1, char *a2, uint64_t (*a3)(void))
{
  uint64_t v6 = sub_25B7580F0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v19 - v11;
  BOOL v13 = *(void *)a1 == *(void *)a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
  if (v13 || (char v14 = 0, (sub_25B758590() & 1) != 0))
  {
    uint64_t v15 = a3(0);
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v16(v12, &a1[*(int *)(v15 + 20)], v6);
    v16(v10, &a2[*(int *)(v15 + 20)], v6);
    sub_25B6FA634(&qword_26A50DE90, MEMORY[0x263F50560]);
    char v14 = sub_25B758260();
    id v17 = *(void (**)(char *, uint64_t))(v7 + 8);
    v17(v10, v6);
    v17(v12, v6);
  }
  return v14 & 1;
}

uint64_t sub_25B6FAD30(char *a1, uint64_t *a2)
{
  uint64_t v4 = sub_25B7580F0();
  uint64_t v46 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  id v45 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  id v44 = (char *)&v41 - v7;
  uint64_t v8 = sub_25B7580C0();
  uint64_t v48 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DEC0);
  MEMORY[0x270FA5388](v11);
  BOOL v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DD58);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  id v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  unint64_t v20 = (char *)&v41 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v41 - v21;
  unint64_t v47 = a1;
  uint64_t v23 = *(void *)a1;
  uint64_t v24 = *a2;
  if (*((unsigned char *)a2 + 8) == 1)
  {
    switch(v24)
    {
      case 1:
        if (v23 != 1) {
          goto LABEL_12;
        }
        goto LABEL_6;
      case 2:
        if (v23 != 2) {
          goto LABEL_12;
        }
        goto LABEL_6;
      case 3:
        if (v23 != 3) {
          goto LABEL_12;
        }
        goto LABEL_6;
      case 4:
        if (v23 != 4) {
          goto LABEL_12;
        }
        goto LABEL_6;
      case 5:
        if (v23 != 5) {
          goto LABEL_12;
        }
        goto LABEL_6;
      case 6:
        if (v23 != 6) {
          goto LABEL_12;
        }
        goto LABEL_6;
      case 7:
        if (v23 != 7) {
          goto LABEL_12;
        }
        goto LABEL_6;
      case 8:
        if (v23 != 8) {
          goto LABEL_12;
        }
        goto LABEL_6;
      default:
        if (!v23) {
          goto LABEL_6;
        }
        goto LABEL_12;
    }
  }
  if (v23 != v24) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v43 = v4;
  uint64_t SafetyCacheResponse = type metadata accessor for FetchSafetyCacheResponse(0);
  sub_25B6F4C70((uint64_t)&v47[*(int *)(SafetyCacheResponse + 24)], (uint64_t)v22);
  uint64_t v42 = SafetyCacheResponse;
  sub_25B6F4C70((uint64_t)a2 + *(int *)(SafetyCacheResponse + 24), (uint64_t)v20);
  uint64_t v26 = (uint64_t)&v13[*(int *)(v11 + 48)];
  sub_25B6F4C70((uint64_t)v22, (uint64_t)v13);
  sub_25B6F4C70((uint64_t)v20, v26);
  id v27 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v48 + 48);
  if (v27((uint64_t)v13, 1, v8) == 1)
  {
    sub_25B6E5BE4((uint64_t)v20, &qword_26A50DD58);
    sub_25B6E5BE4((uint64_t)v22, &qword_26A50DD58);
    if (v27(v26, 1, v8) == 1)
    {
      sub_25B6E5BE4((uint64_t)v13, &qword_26A50DD58);
LABEL_15:
      uint64_t v34 = v42;
      uint64_t v33 = v43;
      uint64_t v35 = v46;
      id v36 = *(void (**)(char *, char *, uint64_t))(v46 + 16);
      id v37 = v44;
      v36(v44, &v47[*(int *)(v42 + 20)], v43);
      id v38 = (char *)a2 + *(int *)(v34 + 20);
      id v39 = v45;
      v36(v45, v38, v33);
      sub_25B6FA634(&qword_26A50DE90, MEMORY[0x263F50560]);
      char v28 = sub_25B758260();
      id v40 = *(void (**)(char *, uint64_t))(v35 + 8);
      v40(v39, v33);
      v40(v37, v33);
      return v28 & 1;
    }
    goto LABEL_11;
  }
  sub_25B6F4C70((uint64_t)v13, (uint64_t)v17);
  if (v27(v26, 1, v8) == 1)
  {
    sub_25B6E5BE4((uint64_t)v20, &qword_26A50DD58);
    sub_25B6E5BE4((uint64_t)v22, &qword_26A50DD58);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v17, v8);
LABEL_11:
    sub_25B6E5BE4((uint64_t)v13, &qword_26A50DEC0);
    goto LABEL_12;
  }
  uint64_t v30 = v48;
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 32))(v10, v26, v8);
  sub_25B6FA634(&qword_26A50DEC8, MEMORY[0x263F327D8]);
  char v31 = sub_25B758260();
  id v32 = *(void (**)(char *, uint64_t))(v30 + 8);
  v32(v10, v8);
  sub_25B6E5BE4((uint64_t)v20, &qword_26A50DD58);
  sub_25B6E5BE4((uint64_t)v22, &qword_26A50DD58);
  v32(v17, v8);
  sub_25B6E5BE4((uint64_t)v13, &qword_26A50DD58);
  if (v31) {
    goto LABEL_15;
  }
LABEL_12:
  char v28 = 0;
  return v28 & 1;
}

uint64_t sub_25B6FB328(char *a1, char *a2)
{
  uint64_t v4 = sub_25B7580F0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v18 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
  if (v11 || (char v12 = 0, (sub_25B758590() & 1) != 0))
  {
    BOOL v13 = *((void *)a1 + 2) == *((void *)a2 + 2) && *((void *)a1 + 3) == *((void *)a2 + 3);
    if (v13 || (char v12 = 0, (sub_25B758590() & 1) != 0))
    {
      uint64_t SafetyCacheRequest = type metadata accessor for FetchSafetyCacheRequest(0);
      uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v15(v10, &a1[*(int *)(SafetyCacheRequest + 24)], v4);
      v15(v8, &a2[*(int *)(SafetyCacheRequest + 24)], v4);
      sub_25B6FA634(&qword_26A50DE90, MEMORY[0x263F50560]);
      char v12 = sub_25B758260();
      uint64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
      v16(v8, v4);
      v16(v10, v4);
    }
  }
  return v12 & 1;
}

unint64_t sub_25B6FB510()
{
  unint64_t result = qword_26A50DEB0;
  if (!qword_26A50DEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50DEB0);
  }
  return result;
}

ValueMetadata *type metadata accessor for FetchSafetyCacheResponseCode()
{
  return &type metadata for FetchSafetyCacheResponseCode;
}

uint64_t sub_25B6FB58C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t sub_25B6FB5A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

uint64_t *sub_25B6FB5C0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_25B7580F0();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_25B6FB6A8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25B7580F0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_25B6FB720(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_25B7580F0();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *sub_25B6FB7B8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25B7580F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_25B6FB854(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_25B7580F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_25B6FB8D0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25B7580F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_25B6FB95C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25B6FB970);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_25B7580F0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_25B6FBA24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25B6FBA38);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25B7580F0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25B6FBAE4()
{
  uint64_t result = sub_25B7580F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25B6FBB7C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_25B7580F0();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t sub_25B6FBC74(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_25B7580F0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_25B6FBCF4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25B7580F0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

void *sub_25B6FBD9C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25B7580F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_25B6FBE58(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_25B7580F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *sub_25B6FBED4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_25B7580F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_25B6FBF70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25B6FBF84);
}

uint64_t sub_25B6FBF84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_25B7580F0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_25B6FC034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25B6FC048);
}

uint64_t sub_25B6FC048(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25B7580F0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25B6FC0F0()
{
  uint64_t result = sub_25B7580F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_25B6FC188(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (void *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = a1 + v7;
    uint64_t v9 = (uint64_t)a2 + v7;
    uint64_t v10 = sub_25B7580F0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = *(int *)(a3 + 24);
    uint64_t v12 = (char *)v4 + v11;
    BOOL v13 = (char *)a2 + v11;
    uint64_t v14 = sub_25B7580C0();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DD58);
      memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
  }
  return v4;
}

uint64_t sub_25B6FC344(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25B7580F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = sub_25B7580C0();
  uint64_t v10 = *(void *)(v7 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v6, 1, v7);
  if (!result)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
    return v9(v6, v7);
  }
  return result;
}

uint64_t sub_25B6FC458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_25B7580F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (const void *)(a2 + v10);
  uint64_t v13 = sub_25B7580C0();
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DD58);
    memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v14 + 16))(v11, v12, v13);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  return a1;
}

uint64_t sub_25B6FC5C4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t)a2 + v7;
  uint64_t v10 = sub_25B7580F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_25B7580C0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  LODWORD(v9) = v16(v12, 1, v14);
  int v17 = v16(v13, 1, v14);
  if (!v9)
  {
    if (!v17)
    {
      (*(void (**)(void *, char *, uint64_t))(v15 + 24))(v12, v13, v14);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v15 + 8))(v12, v14);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DD58);
    memcpy(v12, v13, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  return a1;
}

uint64_t sub_25B6FC794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_25B7580F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (const void *)(a2 + v10);
  uint64_t v13 = sub_25B7580C0();
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DD58);
    memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v14 + 32))(v11, v12, v13);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  return a1;
}

uint64_t sub_25B6FC900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_25B7580F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  uint64_t v13 = sub_25B7580C0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  LODWORD(v8) = v15(v11, 1, v13);
  int v16 = v15(v12, 1, v13);
  if (!v8)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 40))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DD58);
    memcpy(v11, v12, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 32))(v11, v12, v13);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  return a1;
}

uint64_t sub_25B6FCAD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25B6FCAE4);
}

uint64_t sub_25B6FCAE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25B7580F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DD58);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a3 + 24);
    return v13(v15, a2, v14);
  }
}

uint64_t sub_25B6FCBE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25B6FCBF8);
}

uint64_t sub_25B6FCBF8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_25B7580F0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DD58);
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
    uint64_t v16 = v14;
    uint64_t v17 = a1 + *(int *)(a4 + 24);
    return v15(v17, a2, a2, v16);
  }
}

void sub_25B6FCD04()
{
  sub_25B7580F0();
  if (v0 <= 0x3F)
  {
    sub_25B6FCDD8();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_25B6FCDD8()
{
  if (!qword_26A50DF10)
  {
    sub_25B7580C0();
    unint64_t v0 = sub_25B7584B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A50DF10);
    }
  }
}

unint64_t sub_25B6FCE34()
{
  unint64_t result = qword_26A50DF18;
  if (!qword_26A50DF18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50DF18);
  }
  return result;
}

unint64_t sub_25B6FCE8C()
{
  unint64_t result = qword_26A50DF20;
  if (!qword_26A50DF20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50DF20);
  }
  return result;
}

unint64_t sub_25B6FCEE4()
{
  unint64_t result = qword_26A50DF28;
  if (!qword_26A50DF28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A50DF28);
  }
  return result;
}

ValueMetadata *type metadata accessor for SafetyMonitorServerClient()
{
  return &type metadata for SafetyMonitorServerClient;
}

uint64_t sub_25B6FCF60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DF38);
  v3[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25B6FCFF8, 0, 0);
}

uint64_t sub_25B6FCFF8()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  sub_25B6FD3AC(v0[3], v1);
  uint64_t SafetyCacheRequest = type metadata accessor for FetchSafetyCacheRequest(0);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(SafetyCacheRequest - 8) + 56))(v1, 0, 1, SafetyCacheRequest);
  id v4 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_26A50DF40));
  uint64_t v5 = sub_25B7580A0();
  v0[6] = v5;
  uint64_t v6 = swift_task_alloc();
  v0[7] = v6;
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = v2;
  uint64_t v7 = swift_task_alloc();
  v0[8] = v7;
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = (void *)swift_task_alloc();
  v0[9] = v8;
  uint64_t SafetyCacheResponse = type metadata accessor for FetchSafetyCacheResponse(0);
  *uint64_t v8 = v0;
  v8[1] = sub_25B6FD194;
  uint64_t v10 = v0[2];
  return MEMORY[0x270FA2338](v10, &unk_26A50DF50, v6, sub_25B6FD9FC, v7, 0, 0, SafetyCacheResponse);
}

uint64_t sub_25B6FD194()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_25B6FD324;
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = sub_25B6FD2B8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25B6FD2B8()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6FD324()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6FD3AC(uint64_t a1, uint64_t a2)
{
  uint64_t SafetyCacheRequest = type metadata accessor for FetchSafetyCacheRequest(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(SafetyCacheRequest - 8) + 16))(a2, a1, SafetyCacheRequest);
  return a2;
}

uint64_t sub_25B6FD410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_25B6FD434, 0, 0);
}

uint64_t sub_25B6FD434()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  uint64_t SafetyCacheResponse = type metadata accessor for FetchSafetyCacheResponse(0);
  *uint64_t v2 = v0;
  v2[1] = sub_25B6FD528;
  uint64_t v4 = *(void *)(v0 + 16);
  return MEMORY[0x270FA2360](v4, 0, 0, 0xD000000000000014, 0x800000025B763960, sub_25B6FDA0C, v1, SafetyCacheResponse);
}

uint64_t sub_25B6FD528()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25B6FD664, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25B6FD664()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6FD6C8(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_25B6E59F4;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_25B6FD434, 0, 0);
}

uint64_t sub_25B6FD77C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DF58);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v6 + v5, (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  sub_25B758090();
  return sub_25B758440();
}

uint64_t sub_25B6FD8C4(uint64_t a1)
{
  uint64_t SafetyCacheResponse = type metadata accessor for FetchSafetyCacheResponse(0);
  MEMORY[0x270FA5388](SafetyCacheResponse - 8);
  uint64_t v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DF60);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (void *)((char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25B6FDB1C(a1, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9[1] = *v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DF58);
    return sub_25B758400();
  }
  else
  {
    sub_25B6FDB84((uint64_t)v7, (uint64_t)v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DF58);
    return sub_25B758410();
  }
}

id sub_25B6FD9FC()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_cancel);
}

uint64_t sub_25B6FDA0C(uint64_t a1)
{
  return sub_25B6FD77C(a1);
}

uint64_t sub_25B6FDA14()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DF58);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25B6FDAA8(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DF58);
  return sub_25B6FD8C4(a1);
}

uint64_t sub_25B6FDB1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DF60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25B6FDB84(uint64_t a1, uint64_t a2)
{
  uint64_t SafetyCacheResponse = type metadata accessor for FetchSafetyCacheResponse(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(SafetyCacheResponse - 8) + 32))(a2, a1, SafetyCacheResponse);
  return a2;
}

void sub_25B6FDBE8()
{
  uint64_t v0 = (void *)sub_25B7582E0();
  char v1 = MGGetBoolAnswer();

  byte_26A510108 = v1;
}

uint64_t sub_25B6FDC40()
{
  v1[11] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DAA0);
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25B6FDD10, 0, 0);
}

uint64_t sub_25B6FDD10()
{
  uint64_t v42 = v0;
  v41[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = v0[13];
  sub_25B757E40();
  uint64_t v2 = sub_25B757F00();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  int v5 = v4(v1, 1, v2);
  uint64_t v6 = v0[13];
  if (v5 == 1)
  {
    sub_25B6E5BE4(v0[13], &qword_26A50DAA0);
    uint64_t v7 = 0;
    unint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = sub_25B757ED0();
    unint64_t v8 = v9;
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  }
  if (qword_26A50D820 != -1) {
    swift_once();
  }
  if (byte_26A510108 == 1)
  {
    if (byte_26A510109 == 1)
    {
      swift_bridgeObjectRelease();
      goto LABEL_41;
    }
    uint64_t v35 = v7;
    byte_26A510109 = 1;
    v0[9] = 3;
    CFStringRef v18 = (const __CFString *)sub_25B7582E0();
    uint64_t v19 = (__CFString *)sub_25B7582E0();
    id v38 = (__CFString *)sub_25B7582E0();
    id v39 = (__CFString *)v18;
    id v37 = (__CFString *)sub_25B7582E0();
    CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, v18, v19, v38, v37, 0, v0 + 9);
    if (v0[9])
    {
      id v36 = v19;
      if (qword_26A50D828 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_25B758230();
      __swift_project_value_buffer(v20, (uint64_t)qword_26A510110);
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_25B758210();
      os_log_type_t v22 = sub_25B758470();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = (uint8_t *)swift_slowAlloc();
        uint64_t v40 = swift_slowAlloc();
        v41[0] = v40;
        *(_DWORD *)uint64_t v23 = 136315138;
        if (v8) {
          uint64_t v24 = v35;
        }
        else {
          uint64_t v24 = 0;
        }
        if (v8) {
          unint64_t v25 = v8;
        }
        else {
          unint64_t v25 = 0xE000000000000000;
        }
        swift_bridgeObjectRetain();
        v0[10] = sub_25B6E424C(v24, v25, v41);
        sub_25B7584C0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25B6E0000, v21, v22, "TTR Dismissed, radar info: %s", v23, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261168610](v40, -1, -1);
        MEMORY[0x261168610](v23, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      id v26 = objc_msgSend(self, sel_defaultWorkspace);
      if (!v26)
      {
LABEL_40:
        byte_26A510109 = 0;

        goto LABEL_41;
      }
      id v27 = v26;
      id v36 = v19;
      uint64_t v28 = v0[12];
      sub_25B757E40();
      if (v4(v28, 1, v2) == 1)
      {
        uint64_t v29 = 0;
      }
      else
      {
        uint64_t v30 = v0[12];
        uint64_t v29 = (void *)sub_25B757EE0();
        (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v30, v2);
      }
      id v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F018D8]), sel_init);
      v0[6] = sub_25B6FE460;
      v0[7] = 0;
      v0[2] = MEMORY[0x263EF8330];
      v0[3] = 1107296256;
      v0[4] = sub_25B6FE640;
      v0[5] = &block_descriptor_0;
      id v32 = _Block_copy(v0 + 2);
      objc_msgSend(v27, sel_openURL_configuration_completionHandler_, v29, v31, v32);
      _Block_release(v32);
    }
    uint64_t v19 = v36;
    goto LABEL_40;
  }
  if (qword_26A50D828 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_25B758230();
  __swift_project_value_buffer(v10, (uint64_t)qword_26A510110);
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_25B758210();
  os_log_type_t v12 = sub_25B758450();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = v7;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    v41[0] = v15;
    *(_DWORD *)uint64_t v14 = 67109378;
    *((_DWORD *)v0 + 28) = byte_26A510108;
    sub_25B7584C0();
    *(_WORD *)(v14 + 8) = 2080;
    if (v8) {
      uint64_t v16 = v13;
    }
    else {
      uint64_t v16 = 0;
    }
    if (v8) {
      unint64_t v17 = v8;
    }
    else {
      unint64_t v17 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    v0[8] = sub_25B6E424C(v16, v17, v41);
    sub_25B7584C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25B6E0000, v11, v12, "TTR isInternal:%{BOOL}d, radar info:%s", (uint8_t *)v14, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x261168610](v15, -1, -1);
    MEMORY[0x261168610](v14, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

LABEL_41:
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v33 = (uint64_t (*)(void))v0[1];
  return v33();
}

void sub_25B6FE460(uint64_t a1, void *a2)
{
  if (a2)
  {
    if (qword_26A50D828 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25B758230();
    __swift_project_value_buffer(v3, (uint64_t)qword_26A510110);
    id v4 = a2;
    id v5 = a2;
    oslog = sub_25B758210();
    os_log_type_t v6 = sub_25B758470();
    if (os_log_type_enabled(oslog, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      unint64_t v8 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 138412290;
      id v9 = a2;
      uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
      sub_25B7584C0();
      *unint64_t v8 = v11;

      _os_log_impl(&dword_25B6E0000, oslog, v6, "TTR Error filing radar: %@", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A50DDD0);
      swift_arrayDestroy();
      MEMORY[0x261168610](v8, -1, -1);
      MEMORY[0x261168610](v7, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_25B6FE640(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2) {
    uint64_t v5 = sub_25B758240();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25B6FE6EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_26A50DF80 + dword_26A50DF80);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25B700DA4;
  return v9(a1, a2, a3);
}

uint64_t sub_25B6FE92C(void *a1, uint64_t a2, void *aBlock)
{
  v3[2] = a1;
  v3[3] = _Block_copy(aBlock);
  if (a2)
  {
    a2 = sub_25B7582F0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v3[4] = v7;
  uint64_t v11 = (uint64_t (*)(id, uint64_t, uint64_t))((char *)&dword_26A50DF80 + dword_26A50DF80);
  id v8 = a1;
  id v9 = (void *)swift_task_alloc();
  v3[5] = v9;
  *id v9 = v3;
  v9[1] = sub_25B6FEA28;
  return v11(v8, a2, v7);
}

uint64_t sub_25B6FEA28()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 24);
  uint64_t v2 = *(void **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  v1[2](v1);
  _Block_release(v1);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_25B6FEB84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  switch(a1)
  {
    case 0:
      uint64_t v13 = (char *)&dword_26A50DF90 + dword_26A50DF90;
      uint64_t v10 = (void *)swift_task_alloc();
      v3[2] = v10;
      *uint64_t v10 = v3;
      v10[1] = sub_25B6FEDA8;
      unint64_t v11 = 0x800000025B7639B0;
      unint64_t v12 = 0xD00000000000002DLL;
      goto LABEL_9;
    case 1:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      uint64_t v6 = (uint64_t (*)(void))v3[1];
      return v6();
    case 2:
      uint64_t v13 = (char *)&dword_26A50DF90 + dword_26A50DF90;
      id v8 = (void *)swift_task_alloc();
      v3[3] = v8;
      *id v8 = v3;
      id v9 = sub_25B6FEEA0;
      goto LABEL_8;
    default:
      uint64_t v13 = (char *)&dword_26A50DF90 + dword_26A50DF90;
      id v8 = (void *)swift_task_alloc();
      v3[4] = v8;
      *id v8 = v3;
      id v9 = sub_25B6FEF98;
LABEL_8:
      v8[1] = v9;
      unint64_t v11 = 0x800000025B763980;
      unint64_t v12 = 0xD000000000000029;
LABEL_9:
      return ((uint64_t (*)(unint64_t, unint64_t, void, void, uint64_t, uint64_t))v13)(v12, v11, 0, 0, a2, a3);
  }
}

uint64_t sub_25B6FEDA8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25B6FEEA0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25B6FEF98()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25B6FF090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_26A50DF90
                                                                                     + dword_26A50DF90);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_25B700DA4;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_25B6FF308(uint64_t a1, uint64_t a2, uint64_t a3, void *aBlock)
{
  v4[2] = _Block_copy(aBlock);
  if (a1)
  {
    a1 = sub_25B7582F0();
    uint64_t v9 = v8;
    v4[3] = v8;
    if (a2) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v11 = 0;
    v4[4] = 0;
    if (a3) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v9 = 0;
  v4[3] = 0;
  if (!a2) {
    goto LABEL_6;
  }
LABEL_3:
  a2 = sub_25B7582F0();
  uint64_t v11 = v10;
  v4[4] = v10;
  if (a3)
  {
LABEL_4:
    a3 = sub_25B7582F0();
    uint64_t v13 = v12;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v13 = 0;
LABEL_8:
  v4[5] = v13;
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_26A50DF90
                                                                                     + dword_26A50DF90);
  uint64_t v14 = (void *)swift_task_alloc();
  v4[6] = v14;
  *uint64_t v14 = v4;
  v14[1] = sub_25B6FF454;
  return v16(a1, v9, a2, v11, a3, v13);
}

uint64_t sub_25B6FF454()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 16);
  uint64_t v4 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1[2](v1);
  _Block_release(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

id SMTapToRadarManagerInternal.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SMTapToRadarManagerInternal.init()()
{
}

id SMTapToRadarManagerInternal.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SMTapToRadarManagerInternal();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25B6FF708()
{
  uint64_t v0 = sub_25B758230();
  __swift_allocate_value_buffer(v0, qword_26A510110);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A510110);
  swift_bridgeObjectRetain();
  return sub_25B758220();
}

uint64_t sub_25B6FF788(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_25B700DA4;
  return v6();
}

uint64_t sub_25B6FF854(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_25B700DA4;
  return v7();
}

uint64_t sub_25B6FF920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25B758430();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_25B758420();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25B6E5BE4(a1, &qword_26B3494B8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25B7583F0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_25B6FFACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[8] = a5;
  v6[9] = a6;
  v6[6] = a3;
  v6[7] = a4;
  v6[4] = a1;
  v6[5] = a2;
  uint64_t v7 = sub_25B757E80();
  v6[10] = v7;
  v6[11] = *(void *)(v7 - 8);
  v6[12] = swift_task_alloc();
  v6[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25B6FFBA4, 0, 0);
}

uint64_t sub_25B6FFBA4()
{
  Class super_class = v0[6].super_class;
  id receiver = v0[5].receiver;
  id v10 = v0[6].receiver;
  Class v8 = v0[5].super_class;
  sub_25B757E70();
  sub_25B757E60();
  MEMORY[0x261167410](7824750, 0xE300000000000000);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A50E030);
  sub_25B757E20();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_25B75DAF0;
  sub_25B757E10();
  sub_25B757E10();
  sub_25B757E10();
  sub_25B757E10();
  sub_25B757E10();
  sub_25B757E10();
  swift_bridgeObjectRetain();
  sub_25B757E10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25B757E10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25B757E10();
  swift_bridgeObjectRelease();
  sub_25B757E30();
  objc_super v2 = (void (*)(id, Class, id))*((void *)v8 + 2);
  v2(v10, super_class, receiver);
  uint64_t v3 = (objc_class *)type metadata accessor for SMTapToRadarManagerInternal();
  uint64_t v4 = (char *)objc_allocWithZone(v3);
  v2(&v4[OBJC_IVAR____TtC13SafetyMonitor27SMTapToRadarManagerInternal_urlComponents], (Class)v10, receiver);
  v0[1].id receiver = v4;
  v0[1].Class super_class = v3;
  v0[7].id receiver = objc_msgSendSuper2(v0 + 1, sel_init);
  uint64_t v5 = (objc_class *)*((void *)v8 + 1);
  v0[7].Class super_class = v5;
  v0[8].id receiver = (id)(((unint64_t)v8 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
  ((void (*)(id, id))v5)(v10, receiver);
  uint64_t v6 = (objc_class *)swift_task_alloc();
  v0[8].Class super_class = v6;
  *(void *)uint64_t v6 = v0;
  *((void *)v6 + 1) = sub_25B700070;
  return sub_25B6FDC40();
}

uint64_t sub_25B700070()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25B70016C, 0, 0);
}

uint64_t sub_25B70016C()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 80);

  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_25B700204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[6] = a2;
  v3[7] = a3;
  v3[5] = a1;
  return MEMORY[0x270FA2498](sub_25B700228, 0, 0);
}

uint64_t sub_25B700228()
{
  uint64_t v1 = v0[5];
  sub_25B7584F0();
  v0[2] = 0;
  v0[3] = 0xE000000000000000;
  sub_25B758340();
  v0[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A50E038);
  sub_25B758540();
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  v0[8] = v3;
  Class v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_26A50DF90
                                                                                    + dword_26A50DF90);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[9] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25B700368;
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[7];
  return v8(v2, v3, 0, 0, v5, v6);
}

uint64_t sub_25B700368()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t type metadata accessor for SMTapToRadarManagerInternal()
{
  uint64_t result = qword_26A50DFA0;
  if (!qword_26A50DFA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25B7004C4()
{
  return type metadata accessor for SMTapToRadarManagerInternal();
}

uint64_t sub_25B7004CC()
{
  uint64_t result = sub_25B757E80();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SMTapToRadarManagerInternal(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SMTapToRadarManagerInternal);
}

uint64_t dispatch thunk of static SMTapToRadarManagerInternal.fileRadar(withError:conversationIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 104) + **(int **)(v3 + 104));
  Class v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *Class v8 = v4;
  v8[1] = sub_25B700DA4;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of static SMTapToRadarManagerInternal.fileRadar(withValidity:conversationIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 112) + **(int **)(v3 + 112));
  Class v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *Class v8 = v4;
  v8[1] = sub_25B6E59F4;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of static SMTapToRadarManagerInternal.fileRadar(withTitle:description:conversationIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 + 120)
                                                                                     + **(int **)(v6 + 120));
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v14;
  *uint64_t v14 = v7;
  v14[1] = sub_25B700DA4;
  return v16(a1, a2, a3, a4, a5, a6);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_25B7008B8()
{
  _Block_release(*(const void **)(v0 + 40));
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25B700908()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_25B700DA4;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *))((char *)&dword_26A50DFD0 + dword_26A50DFD0);
  return v7(v2, v3, v4, v5);
}

uint64_t sub_25B7009D4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25B700DA4;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_26A50DFE0 + dword_26A50DFE0);
  return v6(v2, v3, v4);
}

uint64_t sub_25B700A98(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_25B700DA4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_26A50DFF0 + dword_26A50DFF0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_25B700B64()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25B700B9C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25B6E59F4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A50E000 + dword_26A50E000);
  return v6(a1, v4);
}

uint64_t sub_25B700C54()
{
  _Block_release(*(const void **)(v0 + 32));
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25B700C9C()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25B700DA4;
  uint64_t v6 = (uint64_t (*)(void *, uint64_t, void *))((char *)&dword_26A50E010 + dword_26A50E010);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_13Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_25B7061EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_25B706E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t IMSharedUtilitiesLibraryCore()
{
  if (!IMSharedUtilitiesLibraryCore_frameworkLibrary) {
    IMSharedUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return IMSharedUtilitiesLibraryCore_frameworkLibrary;
}

uint64_t getIMChatCanonicalIDSIDsForAddressSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getIMChatCanonicalIDSIDsForAddressSymbolLoc_ptr;
  uint64_t v6 = getIMChatCanonicalIDSIDsForAddressSymbolLoc_ptr;
  if (!getIMChatCanonicalIDSIDsForAddressSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __getIMChatCanonicalIDSIDsForAddressSymbolLoc_block_invoke;
    v2[3] = &unk_2654991E0;
    v2[4] = &v3;
    __getIMChatCanonicalIDSIDsForAddressSymbolLoc_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_25B708B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __IMSharedUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IMSharedUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getIMChatCanonicalIDSIDsForAddressSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)IMSharedUtilitiesLibraryCore();
  if (!v2)
  {
    uint64_t v4 = (void *)abort_report_np();
    free(v4);
  }
  uint64_t result = dlsym(v2, "IMChatCanonicalIDSIDsForAddress");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIMChatCanonicalIDSIDsForAddressSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void log_analytics_submission(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = objc_opt_new();
  [v5 appendFormat:@"\n=== BEGIN analytics submission for event %@ ===\n", v3];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v4 allKeys];
  uint64_t v7 = [v6 sortedArrayUsingComparator:&__block_literal_global];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v13 = [v4 objectForKeyedSubscript:v12];
        [v5 appendFormat:@"%@ : %@\n", v12, v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v9);
  }

  [v5 appendFormat:@"=== END analytics submission for event %@ ===\n", v3];
  uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v5;
    _os_log_impl(&dword_25B6E0000, v14, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
}

uint64_t __log_analytics_submission_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void sub_25B709074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B709188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B70D3A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_25B714260()
{
  return 0;
}

void sub_25B718328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B71A008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B71A94C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
}

double RTCommonIsCoordinateValid(double a1, double a2)
{
  double v2 = 1.0;
  if (a2 < -180.0) {
    double v2 = 0.0;
  }
  if (a2 > 180.0 || a1 < -90.0 || a1 > 90.0) {
    return 0.0;
  }
  else {
    return v2;
  }
}

void RTCommonCalculateDistance(double a1, double a2, double a3, double a4)
{
}

BOOL RTCommonConvertGeodeticToLocalFrame(double *a1, double *a2, double *a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v9 = vabdd_f64(a4, a7);
  if (v9 <= 2.0)
  {
    double v16 = (a4 + a7) * 0.5 * 0.0174532925;
    double v17 = (a7 - a4) * 0.0174532925;
    double v18 = 360.0;
    if (a5 < 0.0) {
      a5 = a5 + 360.0;
    }
    double v19 = a8 + 360.0;
    if (a8 >= 0.0) {
      double v19 = a8;
    }
    double v20 = v19 - a5;
    if (v20 <= 180.0)
    {
      if (v20 >= -180.0)
      {
LABEL_10:
        double v21 = v20 * 0.0174532925;
        __double2 v22 = __sincos_stret(v16);
        double v23 = sqrt(v22.__sinval * -0.00669437999 * v22.__sinval + 1.0);
        *a1 = v17 * (6335439.33 / (v23 * (v23 * v23)) + a6);
        *a2 = v22.__cosval * (6378137.0 / v23 + a6) * v21;
        *a3 = a9 - a6;
        return v9 <= 2.0;
      }
    }
    else
    {
      double v18 = -360.0;
    }
    double v20 = v20 + v18;
    goto LABEL_10;
  }
  return v9 <= 2.0;
}

BOOL RTCommonConvertLocalFrameToGeodetic(double *a1, double *a2, double a3, double a4, double a5, double a6, double a7)
{
  BOOL v8 = a3 >= -90.0 && a3 <= 90.0;
  if (v8)
  {
    __double2 v15 = __sincos_stret(a3 * 0.0174532925);
    double v16 = sqrt(v15.__sinval * -0.00669437999 * v15.__sinval + 1.0);
    double v17 = 6335439.33 / (v16 * (v16 * v16)) + a5;
    double v18 = v15.__cosval * (6378137.0 / v16 + a5);
    if (v18 < 10.0) {
      double v18 = 10.0;
    }
    *a1 = a3 + a6 / v17 * 57.2957795;
    *a2 = a4 + a7 / v18 * 57.2957795;
  }
  return v8;
}

double RTCommonRandomDouble(double a1, double a2)
{
  return a1 + (double)arc4random_uniform(0x7FFFFFFFu) / 2147483650.0 * (a2 - a1);
}

uint64_t RTCommonRandomInt(unsigned int a1)
{
  return arc4random_uniform(0x7FFFFFFFu) % a1;
}

BOOL RTCommonRandomFlip(double a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a1 < 0.0 || a1 > 1.0)
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 134217984;
      double v6 = a1;
      _os_log_error_impl(&dword_25B6E0000, v3, OS_LOG_TYPE_ERROR, "RTCommonRandomFlip, invalid probability, %f, probability must be between 0 and 1", (uint8_t *)&v5, 0xCu);
    }
  }
  return (double)arc4random_uniform(0x7FFFFFFFu) / 2147483650.0 < a1;
}

BOOL RTCommonValidConfidence(double a1)
{
  return a1 <= 1.0 && a1 >= 0.0;
}

void RTCommonSafeLog(long double a1)
{
}

uint64_t conversationHandlesValid(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v1 = objc_msgSend(a1, "receiverHandles", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v1);
        }
        double v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (!v6) {
          goto LABEL_12;
        }
        uint64_t v7 = [*(id *)(*((void *)&v11 + 1) + 8 * i) primaryHandle];
        if (!v7) {
          goto LABEL_14;
        }
        BOOL v8 = [v6 primaryHandle];
        int64_t v9 = +[SMHandle getSMHandleTypeWithHandle:v8];

        if (!v9)
        {
LABEL_12:
          uint64_t v7 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v7 = 1;
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }
LABEL_14:

  return v7;
}

void sub_25B72C124(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t isEligibleForReceivingZelkova()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v0 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315394;
    uint64_t v3 = "BOOL isEligibleForReceivingZelkova(void)";
    __int16 v4 = 1024;
    int v5 = 1;
    _os_log_impl(&dword_25B6E0000, v0, OS_LOG_TYPE_DEFAULT, "%s, isEligible, %d", (uint8_t *)&v2, 0x12u);
  }

  return 1;
}

__CFString *initiatorEligiblityStatusToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xC) {
    return @"Unknown";
  }
  else {
    return off_265499A68[a1 - 1];
  }
}

id _SMSafeArray(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  long long v14 = (id *)&a9;
  id v11 = v9;
  if (!v9) {
    goto LABEL_4;
  }
  while (v11 != (id)1)
  {
    objc_msgSend(v10, "addObject:");
    do
    {
LABEL_4:
      long long v12 = v14++;
      id v11 = *v12;
    }
    while (!*v12);
  }

  return v10;
}

id _SMMultiErrorCreate(void *a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (a1)
  {
    double v19 = (void *)[a1 copy];
    uint64_t v1 = [v19 flatten];
    int v2 = [MEMORY[0x263EFF980] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v1;
    uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v39 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v29;
      uint64_t v20 = *(void *)v29;
      do
      {
        uint64_t v6 = 0;
        uint64_t v21 = v4;
        do
        {
          if (*(void *)v29 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v28 + 1) + 8 * v6);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v23 = v6;
            long long v26 = 0u;
            long long v27 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            id v8 = v7;
            uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v38 count:16];
            if (v9)
            {
              uint64_t v10 = v9;
              uint64_t v11 = *(void *)v25;
              do
              {
                uint64_t v12 = 0;
                do
                {
                  if (*(void *)v25 != v11) {
                    objc_enumerationMutation(v8);
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    long long v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315394;
                      uint64_t v35 = "NSError * _Nonnull _SMMultiErrorCreate(NSArray *__strong _Nonnull)";
                      __int16 v36 = 1024;
                      int v37 = 49;
                      _os_log_error_impl(&dword_25B6E0000, v13, OS_LOG_TYPE_ERROR, "All parameters must be NSError or nil. (in %s:%d)", buf, 0x12u);
                    }
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [v2 addObject:v8];
                  }
                  ++v12;
                }
                while (v10 != v12);
                uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v38 count:16];
              }
              while (v10);
            }

            uint64_t v5 = v20;
            uint64_t v4 = v21;
            uint64_t v6 = v23;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              long long v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                uint64_t v35 = "NSError * _Nonnull _SMMultiErrorCreate(NSArray *__strong _Nonnull)";
                __int16 v36 = 1024;
                int v37 = 55;
                _os_log_error_impl(&dword_25B6E0000, v14, OS_LOG_TYPE_ERROR, "All parameters must be NSError or nil. (in %s:%d)", buf, 0x12u);
              }
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v2 addObject:v7];
            }
          }
          ++v6;
        }
        while (v6 != v4);
        uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v39 count:16];
      }
      while (v4);
    }

    if ((unint64_t)[v2 count] < 2)
    {
      double v17 = [v2 firstObject];
    }
    else
    {
      __double2 v15 = (void *)MEMORY[0x263F087E8];
      v32[0] = *MEMORY[0x263F08320];
      v32[1] = @"SMDetailedErrorsKey";
      v33[0] = @"Multiple errors occurred.";
      v33[1] = v2;
      uint64_t v16 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
      double v17 = [v15 errorWithDomain:@"SMErrorDomain" code:9 userInfo:v16];
    }
  }
  else
  {
    double v17 = 0;
  }
  return v17;
}

uint64_t onDaemonStartNotification(uint64_t a1, void *a2)
{
  return [a2 handleDaemonStart];
}

void sub_25B73F280(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 144));
  _Unwind_Resume(a1);
}

id SMErrorConnectionCreate(const char *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v21[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = (objc_class *)NSString;
  id v11 = a2;
  uint64_t v12 = (void *)[[v10 alloc] initWithFormat:v11 arguments:&a9];

  long long v13 = (void *)MEMORY[0x263F087E8];
  uint64_t v20 = *MEMORY[0x263F08320];
  long long v14 = NSString;
  __double2 v15 = NSStringFromSelector(a1);
  uint64_t v16 = [v14 stringWithFormat:@"connection failure while servicing %@, %@", v15, v12];
  v21[0] = v16;
  double v17 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  double v18 = [v13 errorWithDomain:@"SMErrorDomain" code:8 userInfo:v17];

  return v18;
}

void sub_25B7409D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_25B740F74(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_25B741474(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_25B741988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B742180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B742644(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_25B742B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B743018(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_25B743518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B743A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B74412C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B74502C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B745CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B7462EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B746820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B746E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B74748C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B747AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B749D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B74A300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B74B018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B74FA20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B74FF9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B7504F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_25B750A58(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_25B75110C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B7516C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B7531E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void _RTRequireInitializer(uint64_t a1, SEL aSelector)
{
  uint64_t v3 = NSString;
  uint64_t v4 = NSStringFromSelector(aSelector);
  uint64_t v5 = [v3 stringWithFormat:@"%@ requires the use of the initializer: %@", a1, v4];

  id v6 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:v5 userInfo:0];
  objc_exception_throw(v6);
}

id _RTErrorInvalidParameterCreate(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = [NSString stringWithFormat:@"Invalid parameter not satisfying: %@", a1, *MEMORY[0x263F08320]];
  v6[0] = v1;
  int v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  uint64_t v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F37F20] code:7 userInfo:v2];

  return v3;
}

id _rt_log_facility_get_os_log(dispatch_once_t *predicate)
{
  if (*predicate != -1) {
    dispatch_once_f(predicate, predicate, (dispatch_function_t)_rt_log_facility_prepare);
  }
  int v2 = (void *)predicate[2];
  return v2;
}

os_log_t _rt_log_facility_prepare(uint64_t a1)
{
  os_log_t result = os_log_create("com.apple.CoreRoutine", *(const char **)(a1 + 8));
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_25B757DF0()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_25B757E00()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_25B757E10()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_25B757E20()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_25B757E30()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_25B757E40()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_25B757E50()
{
  return MEMORY[0x270EEE548]();
}

uint64_t sub_25B757E60()
{
  return MEMORY[0x270EEE5B8]();
}

uint64_t sub_25B757E70()
{
  return MEMORY[0x270EEE5F8]();
}

uint64_t sub_25B757E80()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_25B757E90()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25B757EA0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25B757EB0()
{
  return MEMORY[0x270EEF888]();
}

uint64_t sub_25B757EC0()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_25B757ED0()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_25B757EE0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25B757EF0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25B757F00()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25B757F10()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25B757F20()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_25B757F30()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_25B757F40()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_25B757F50()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25B757F60()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_25B757F70()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25B757F80()
{
  return MEMORY[0x270EE06B0]();
}

uint64_t sub_25B757F90()
{
  return MEMORY[0x270EE06E8]();
}

uint64_t sub_25B757FA0()
{
  return MEMORY[0x270EE06F8]();
}

uint64_t sub_25B757FB0()
{
  return MEMORY[0x270EE0700]();
}

uint64_t sub_25B757FC0()
{
  return MEMORY[0x270EE0740]();
}

uint64_t sub_25B757FD0()
{
  return MEMORY[0x270EE0790]();
}

uint64_t sub_25B757FE0()
{
  return MEMORY[0x270EE0798]();
}

uint64_t sub_25B757FF0()
{
  return MEMORY[0x270EE07A0]();
}

uint64_t sub_25B758000()
{
  return MEMORY[0x270EE07B0]();
}

uint64_t sub_25B758010()
{
  return MEMORY[0x270EE07C0]();
}

uint64_t sub_25B758020()
{
  return MEMORY[0x270EE07C8]();
}

uint64_t sub_25B758030()
{
  return MEMORY[0x270EE0828]();
}

uint64_t sub_25B758040()
{
  return MEMORY[0x270EE08D0]();
}

uint64_t sub_25B758050()
{
  return MEMORY[0x270EE08D8]();
}

uint64_t sub_25B758060()
{
  return MEMORY[0x270EE08E0]();
}

uint64_t sub_25B758070()
{
  return MEMORY[0x270EE08E8]();
}

uint64_t sub_25B758080()
{
  return MEMORY[0x270EE08F0]();
}

uint64_t sub_25B758090()
{
  return MEMORY[0x270F16CA0]();
}

uint64_t sub_25B7580A0()
{
  return MEMORY[0x270F16CA8]();
}

uint64_t sub_25B7580B0()
{
  return MEMORY[0x270F16CB0]();
}

uint64_t sub_25B7580C0()
{
  return MEMORY[0x270F16CB8]();
}

uint64_t sub_25B7580D0()
{
  return MEMORY[0x270F44A18]();
}

uint64_t sub_25B7580E0()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_25B7580F0()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_25B758100()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_25B758130()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_25B758140()
{
  return MEMORY[0x270F44B50]();
}

uint64_t sub_25B758150()
{
  return MEMORY[0x270F44BF8]();
}

uint64_t sub_25B758160()
{
  return MEMORY[0x270F44C38]();
}

uint64_t sub_25B758170()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_25B758190()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_25B7581A0()
{
  return MEMORY[0x270F44CE0]();
}

uint64_t sub_25B7581B0()
{
  return MEMORY[0x270F44D68]();
}

uint64_t sub_25B7581C0()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_25B7581D0()
{
  return MEMORY[0x270F44E00]();
}

uint64_t sub_25B7581E0()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_25B7581F0()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_25B758200()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_25B758210()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25B758220()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25B758230()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25B758240()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25B758250()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25B758260()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25B758270()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_25B758280()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_25B758290()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_25B7582A0()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_25B7582B0()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_25B7582C0()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_25B7582D0()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_25B7582E0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25B7582F0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25B758300()
{
  return MEMORY[0x270EF1AE8]();
}

uint64_t sub_25B758310()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_25B758320()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25B758330()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25B758340()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25B758350()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25B758360()
{
  return MEMORY[0x270F9DAA0]();
}

uint64_t sub_25B758370()
{
  return MEMORY[0x270F9DB20]();
}

uint64_t sub_25B758380()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25B758390()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25B7583A0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25B7583B0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25B7583C0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25B7583D0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25B7583E0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25B7583F0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25B758400()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_25B758410()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25B758420()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25B758430()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25B758440()
{
  return MEMORY[0x270F16CC0]();
}

uint64_t sub_25B758450()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25B758460()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25B758470()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25B758480()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25B758490()
{
  return MEMORY[0x270F16CC8]();
}

uint64_t sub_25B7584A0()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_25B7584B0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25B7584C0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25B7584D0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25B7584E0()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_25B7584F0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25B758500()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25B758510()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25B758520()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_25B758530()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25B758540()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25B758550()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25B758560()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25B758570()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25B758580()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25B758590()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25B7585C0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25B7585D0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25B7585E0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25B7585F0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE54D8](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x270EE7460]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x270EE7470](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t IMStringIsEmail()
{
  return MEMORY[0x270F3CE68]();
}

uint64_t IMStringIsPhoneNumber()
{
  return MEMORY[0x270F3CE70]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t TMGetReferenceTime()
{
  return MEMORY[0x270F23998]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
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

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

long double asin(long double __x)
{
  MEMORY[0x270ED8610](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}