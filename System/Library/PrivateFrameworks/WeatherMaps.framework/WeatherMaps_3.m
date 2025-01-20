void (*sub_20A366868(uint64_t a1))(uint64_t)
{
  void (*result)(uint64_t);
  uint64_t v3;
  uint64_t vars8;

  sub_20A3661A0(2);
  result = (void (*)(uint64_t))sub_20A365FC0();
  if (result)
  {
    v3 = (uint64_t)result;
    result(a1);
    return (void (*)(uint64_t))sub_20A1E59F0(v3);
  }
  return result;
}

void sub_20A3668E0(void *a1)
{
  id v1 = a1;
  sub_20A36621C();
}

uint64_t sub_20A366928()
{
  return 1;
}

uint64_t sub_20A366930(void *a1)
{
  id v1 = a1;
  unsigned __int8 v2 = sub_20A366964();

  return v2 & 1;
}

id sub_20A366964()
{
  if (v0[qword_267628828]) {
    return 0;
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AsyncTaskOperation();
  return objc_msgSendSuper2(&v2, sel_isReady);
}

uint64_t type metadata accessor for AsyncTaskOperation()
{
  return __swift_instantiateGenericMetadata();
}

BOOL sub_20A366A04()
{
  return sub_20A366A2C();
}

BOOL sub_20A366A2C()
{
  return *(unsigned char *)(v0 + qword_267628828) == 1;
}

BOOL sub_20A366A44()
{
  return sub_20A366A6C();
}

BOOL sub_20A366A6C()
{
  return *(unsigned char *)(v0 + qword_267628828) == 2;
}

uint64_t sub_20A366A84()
{
  return sub_20A3673E4((uint64_t)&unk_26BE2FF50);
}

id sub_20A366A90(uint64_t a1, uint64_t a2)
{
  return sub_20A366AF0(a1, a2, (void (*)(void))sub_20A366A84);
}

uint64_t sub_20A366AA8()
{
  return sub_20A3673E4((uint64_t)&unk_26BE2FF80);
}

id sub_20A366AB4(uint64_t a1, uint64_t a2)
{
  return sub_20A366AF0(a1, a2, (void (*)(void))sub_20A366AA8);
}

uint64_t sub_20A366ACC()
{
  return sub_20A3673E4((uint64_t)&unk_26BE2FFB0);
}

id sub_20A366AD8(uint64_t a1, uint64_t a2)
{
  return sub_20A366AF0(a1, a2, (void (*)(void))sub_20A366ACC);
}

id sub_20A366AF0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  v3 = (void *)sub_20A38BAE0();
  swift_bridgeObjectRelease();
  return v3;
}

id AsyncTaskOperation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id AsyncTaskOperation.init()()
{
  id v1 = (uint64_t *)&v0[qword_2676287F8];
  objc_super v2 = v0;
  *id v1 = sub_20A365CB4();
  v1[1] = v3;
  v4 = &v2[qword_267628800];
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  v2[qword_267628828] = 0;

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for AsyncTaskOperation();
  return objc_msgSendSuper2(&v6, sel_init);
}

id sub_20A366C2C()
{
  return AsyncTaskOperation.init()();
}

id AsyncTaskOperation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AsyncTaskOperation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_20A366CB4()
{
  return 8;
}

void *sub_20A366CC0(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_20A366CCC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_20A366D24(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + qword_267628800);
  return sub_20A1E59F0(v2);
}

uint64_t method lookup function for AsyncTaskOperation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AsyncTaskOperation);
}

uint64_t dispatch thunk of AsyncTaskOperation.completion.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of AsyncTaskOperation.completion.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AsyncTaskOperation.completion.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AsyncTaskOperation.perform(completion:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_2_50((*MEMORY[0x263F8EED0] & *v2) + 168);
  v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_20A367884;
  return v9(a1, a2);
}

uint64_t sub_20A366F24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 8);
}

unsigned char *sub_20A366F2C(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *result = a2 + 2;
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
        JUMPOUT(0x20A366FF8);
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
          *result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t type metadata accessor for AsyncTaskOperation.State()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_20A367038()
{
  return swift_getWitnessTable();
}

uint64_t sub_20A367054()
{
  uint64_t result = sub_20A38B6F0();
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v1 = result;
  uint64_t v2 = sub_20A367794(result, 0);
  int v3 = sub_20A3676D8(&v4, v2 + 4, v1, 0xD000000000000010, 0x800000020A3A9240);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 != (void *)v1)
  {
    __break(1u);
LABEL_4:
    uint64_t v2 = (void *)MEMORY[0x263F8EE78];
  }
  off_2676287F0 = v2;
  return result;
}

uint64_t sub_20A3670F8(uint64_t a1)
{
  uint64_t v2 = sub_20A389700();
  OUTLINED_FUNCTION_2_3();
  uint64_t v32 = v3;
  MEMORY[0x270FA5388](v4);
  unsigned int v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v36 = (char *)&v27 - v8;
  if (!*(void *)(a1 + 16))
  {
    uint64_t v10 = MEMORY[0x263F8EE88];
    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267628938);
  uint64_t result = sub_20A38C460();
  uint64_t v10 = result;
  uint64_t v31 = *(void *)(a1 + 16);
  if (!v31)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return v10;
  }
  unint64_t v11 = 0;
  uint64_t v30 = a1 + ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80));
  uint64_t v34 = v32 + 16;
  uint64_t v35 = result + 56;
  v12 = (void (**)(char *, uint64_t))(v32 + 8);
  uint64_t v28 = a1;
  v29 = (uint64_t (**)(uint64_t, char *, uint64_t))(v32 + 32);
  while (v11 < *(void *)(a1 + 16))
  {
    uint64_t v13 = *(void *)(v32 + 72);
    v14 = *(void (**)(void))(v32 + 16);
    OUTLINED_FUNCTION_5_41();
    v14();
    sub_20A3675B4(&qword_267628940, MEMORY[0x263F07908]);
    uint64_t v15 = sub_20A38B550() & ~(-1 << *(unsigned char *)(v10 + 32));
    OUTLINED_FUNCTION_3_51();
    if ((v18 & v17) != 0)
    {
      unint64_t v33 = v11;
      uint64_t v20 = ~v19;
      while (1)
      {
        OUTLINED_FUNCTION_5_41();
        v14();
        sub_20A3675B4(&qword_267628948, MEMORY[0x263F07908]);
        char v21 = sub_20A38B5C0();
        v22 = *v12;
        (*v12)(v6, v2);
        if (v21) {
          break;
        }
        uint64_t v15 = (v15 + 1) & v20;
        OUTLINED_FUNCTION_3_51();
        if ((v17 & v18) == 0)
        {
          a1 = v28;
          unint64_t v11 = v33;
          goto LABEL_10;
        }
      }
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v22)(v36, v2);
      a1 = v28;
      unint64_t v11 = v33;
    }
    else
    {
LABEL_10:
      v23 = v36;
      *(void *)(v35 + 8 * v16) = v18 | v17;
      uint64_t result = (*v29)(*(void *)(v10 + 48) + v15 * v13, v23, v2);
      uint64_t v24 = *(void *)(v10 + 16);
      BOOL v25 = __OFADD__(v24, 1);
      uint64_t v26 = v24 + 1;
      if (v25) {
        goto LABEL_18;
      }
      *(void *)(v10 + 16) = v26;
    }
    if (++v11 == v31) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_20A3673E4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267627530);
  uint64_t result = sub_20A38C460();
  uint64_t v3 = result;
  uint64_t v24 = *(void *)(a1 + 16);
  if (!v24)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return v3;
  }
  unint64_t v4 = 0;
  uint64_t v5 = result + 56;
  while (v4 < *(void *)(a1 + 16))
  {
    unsigned int v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    sub_20A38C920();
    swift_bridgeObjectRetain();
    sub_20A38B6E0();
    uint64_t result = sub_20A38C970();
    uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v10 = result & ~v9;
    unint64_t v11 = v10 >> 6;
    uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
    uint64_t v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      uint64_t v14 = *(void *)(v3 + 48);
      uint64_t v15 = (void *)(v14 + 16 * v10);
      BOOL v16 = *v15 == v8 && v15[1] == v7;
      if (v16 || (uint64_t result = sub_20A38C830(), (result & 1) != 0))
      {
LABEL_11:
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      uint64_t v17 = ~v9;
      while (1)
      {
        unint64_t v10 = (v10 + 1) & v17;
        unint64_t v11 = v10 >> 6;
        uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
        uint64_t v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * v10);
        if (*v18 != v8 || v18[1] != v7)
        {
          uint64_t result = sub_20A38C830();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_11;
      }
    }
    *(void *)(v5 + 8 * v11) = v13 | v12;
    uint64_t v20 = (void *)(*(void *)(v3 + 48) + 16 * v10);
    *uint64_t v20 = v8;
    v20[1] = v7;
    uint64_t v21 = *(void *)(v3 + 16);
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_27;
    }
    *(void *)(v3 + 16) = v23;
LABEL_22:
    if (++v4 == v24) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_20A3675B4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_20A3675FC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_20A367634()
{
  return (*(uint64_t (**)(void))(v0 + 24))();
}

uint64_t sub_20A36765C()
{
  return (*(uint64_t (**)(void))(v0 + 24))();
}

unint64_t sub_20A367684()
{
  unint64_t result = qword_267628958;
  if (!qword_267628958)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267628950);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628958);
  }
  return result;
}

void *sub_20A3676D8(void *result, uint64_t *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v5 = result;
  uint64_t v6 = HIBYTE(a5) & 0xF;
  uint64_t v12 = a4;
  unint64_t v13 = a5;
  if ((a5 & 0x2000000000000000) == 0) {
    uint64_t v6 = a4 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v14 = v6;
  if (!a2)
  {
    uint64_t v7 = 0;
LABEL_14:
    *uint64_t v5 = a4;
    v5[1] = a5;
    v5[2] = 0;
    v5[3] = v6;
    return (void *)v7;
  }
  uint64_t v7 = a3;
  if (!a3) {
    goto LABEL_14;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = a2;
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = sub_20A38B730();
      if (!v11) {
        break;
      }
      ++v9;
      *uint64_t v8 = v10;
      v8[1] = v11;
      v8 += 2;
      if (v7 == v9)
      {
        a4 = v12;
        a5 = v13;
        goto LABEL_13;
      }
    }
    a4 = v12;
    a5 = v13;
    uint64_t v7 = v9;
LABEL_13:
    uint64_t v6 = v14;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

void *sub_20A367794(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_267627D38);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * ((uint64_t)(v5 - 32) / 16);
  return v4;
}

uint64_t sub_20A367808()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20A367840()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void (*sub_20A367878(uint64_t a1))(uint64_t)
{
  return sub_20A366868(a1);
}

void sub_20A367888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (qword_26AC3C4E0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_20A38A9B0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26AC3C4C8);
  swift_retain_n();
  sub_20A1E5BA4(a2, a3);
  swift_retain();
  sub_20A1E5BA4(a2, a3);
  uint64_t v9 = sub_20A38A990();
  os_log_type_t v10 = sub_20A38BD00();
  p_vtable = (void **)(&OBJC_METACLASS____TtC11WeatherMaps28WeatherMapOverlayDataManager + 24);
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v34 = v13;
    *(_DWORD *)uint64_t v12 = 136447234;
    uint64_t v14 = (void *)(v4 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeRegion);
    swift_beginAccess();
    uint64_t v15 = v14[3];
    if (v15)
    {
      BOOL v16 = __swift_project_boxed_opaque_existential_1(v14, v15);
      uint64_t v17 = sub_20A2CE498(*v16, v16[1], v16[2]);
    }
    else
    {
      uint64_t v17 = 0;
    }
    uint64_t v35 = v17;
    uint64_t v36 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC3D160);
    uint64_t v18 = sub_20A38B660();
    uint64_t v35 = sub_20A1C5B28(v18, v19, &v34);
    sub_20A38C260();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2082;
    uint64_t v20 = v14[3];
    if (v20)
    {
      uint64_t v21 = __swift_project_boxed_opaque_existential_1(v14, v20);
      uint64_t v22 = sub_20A2CE498(*v21, v21[1], v21[2]);
    }
    else
    {
      uint64_t v22 = 0;
    }
    uint64_t v35 = v22;
    uint64_t v36 = v20;
    uint64_t v23 = sub_20A38B660();
    uint64_t v35 = sub_20A1C5B28(v23, v24, &v34);
    sub_20A38C260();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 22) = 2050;
    uint64_t v35 = *(void *)(v4 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeZoomLevel);
    sub_20A38C260();
    swift_release_n();
    *(_WORD *)(v12 + 32) = 2082;
    uint64_t v35 = a2;
    uint64_t v36 = a3;
    sub_20A1E5BA4(a2, a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC38C70);
    uint64_t v25 = sub_20A38B660();
    uint64_t v35 = sub_20A1C5B28(v25, v26, &v34);
    sub_20A38C260();
    swift_bridgeObjectRelease();
    sub_20A1D8BFC(a2, a3);
    sub_20A1D8BFC(a2, a3);
    *(_WORD *)(v12 + 42) = 2082;
    p_vtable = &OBJC_METACLASS____TtC11WeatherMaps28WeatherMapOverlayDataManager.vtable;
    uint64_t v27 = *(void *)(v4 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeCountryCode + 8);
    uint64_t v35 = *(void *)(v4 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeCountryCode);
    uint64_t v36 = v27;
    sub_20A1E5BA4(v35, v27);
    uint64_t v28 = sub_20A38B660();
    uint64_t v35 = sub_20A1C5B28(v28, v29, &v34);
    sub_20A38C260();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_20A1B7000, v9, v10, "Metadata: Updating active region. activeRegion=%{public}s, currentActiveRegion=%{public}s), currentZoomLevel=%{public}f, activeCountryCode=%{public}s, currentActiveCountryCode=%{public}s", (uint8_t *)v12, 0x34u);
    swift_arrayDestroy();
    MEMORY[0x210519500](v13, -1, -1);
    MEMORY[0x210519500](v12, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_20A1D8BFC(a2, a3);
    sub_20A1D8BFC(a2, a3);

    swift_release_n();
  }
  uint64_t v30 = v4 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeRegion;
  swift_beginAccess();
  sub_20A36CE84(a1, v30);
  swift_endAccess();
  uint64_t v31 = (uint64_t *)((char *)p_vtable[104] + v4);
  uint64_t v32 = *v31;
  uint64_t v33 = v31[1];
  *uint64_t v31 = a2;
  v31[1] = a3;
  sub_20A1E5BA4(a2, a3);
  sub_20A1D8BFC(v32, v33);
  sub_20A367D10(0, 0, 0);
}

void sub_20A367D10(char a1, void (*a2)(uint64_t, uint64_t (*)(void), void), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = MEMORY[0x210519640](v3 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_delegate);
  if (!v8)
  {
    if (qword_26AC3C4E0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_20A38A9B0();
    __swift_project_value_buffer(v14, (uint64_t)qword_26AC3C4C8);
    uint64_t v15 = sub_20A38A990();
    os_log_type_t v16 = sub_20A38BD00();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_20A1B7000, v15, v16, "Metadata: Not calling delegate - delegate is nil", v17, 2u);
      MEMORY[0x210519500](v17, -1, -1);
    }

    if (a2) {
      a2(2, nullsub_1, 0);
    }
    return;
  }
  uint64_t v9 = v8;
  char v55 = a1;
  os_log_type_t v10 = (void *)(v3 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeRegion);
  swift_beginAccess();
  sub_20A231EB4((uint64_t)v10, (uint64_t)v67, &qword_26AC3D058);
  uint64_t v54 = OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeOverlayKind;
  v64[0].n128_u8[0] = *(unsigned char *)(v3 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeOverlayKind);
  uint64_t v11 = *(void *)(v3 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activePointsOfInterest);
  swift_bridgeObjectRetain();
  sub_20A368758((uint64_t)v67, (unsigned __int8 *)v64, v11, (uint64_t)v56);
  v65[0] = (__n128)v56[0];
  v65[1] = (__n128)v56[1];
  v65[2] = (__n128)v56[2];
  v65[3] = (__n128)v56[3];
  v65[4] = (__n128)v56[4];
  v65[5] = (__n128)v56[5];
  v65[6] = (__n128)v56[6];
  v65[7] = (__n128)v56[7];
  v65[8] = (__n128)v56[8];
  v65[9] = (__n128)v56[9];
  v65[10] = (__n128)v56[10];
  unsigned __int8 v66 = v57[0];
  swift_bridgeObjectRelease();
  sub_20A2866A4((uint64_t)v67, &qword_26AC3D058);
  sub_20A1C626C((uint64_t)v65, (uint64_t)v67);
  int v12 = v66;
  uint64_t v13 = OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeOverlayIsSupported;
  if (v66 == *(unsigned __int8 *)(v3
                                 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeOverlayIsSupported))
  {
    sub_20A232484(v3 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeOverlay, (uint64_t)v63, &qword_26AC38C10);
    sub_20A232484((uint64_t)v63, (uint64_t)v64, &qword_26AC38C10);
    if (sub_20A36B6C4((uint64_t)v64) == 1)
    {
      sub_20A1C626C((uint64_t)v65, (uint64_t)v59);
      nullsub_1(v59);
      sub_20A232484((uint64_t)v63, (uint64_t)v56, &qword_26AC38C10);
      sub_20A232484((uint64_t)v59, (uint64_t)v57, &qword_26AC38C10);
      sub_20A36CB10(v65);
      sub_20A36C810((uint64_t)v56);
    }
    else
    {
      sub_20A232484((uint64_t)v63, (uint64_t)v59, &qword_26AC38C10);
      sub_20A1C626C((uint64_t)v59, (uint64_t)v56);
      sub_20A36CB10(v63);
      sub_20A36CB10(v65);
      char v18 = sub_20A2CDF34((uint64_t)v56, v67);
      sub_20A36CB10(v65);
      sub_20A36CB10(v63);
      if ((v18 & 1) != 0 && (v55 & 1) == 0)
      {
        if (qword_26AC3C4E0 != -1) {
          swift_once();
        }
        uint64_t v44 = sub_20A38A9B0();
        __swift_project_value_buffer(v44, (uint64_t)qword_26AC3C4C8);
        sub_20A36CB10(v65);
        v45 = sub_20A38A990();
        os_log_type_t v46 = sub_20A38BD00();
        if (os_log_type_enabled(v45, v46))
        {
          uint64_t v47 = swift_slowAlloc();
          uint64_t v48 = swift_slowAlloc();
          uint64_t v61 = v48;
          *(_DWORD *)uint64_t v47 = 136446466;
          sub_20A1C626C((uint64_t)v67, (uint64_t)v58);
          sub_20A1F1148();
          uint64_t v49 = sub_20A38C7E0();
          v58[0] = sub_20A1C5B28(v49, v50, &v61);
          sub_20A38C260();
          swift_bridgeObjectRelease();
          sub_20A36CB10(v65);
          sub_20A36CB10(v65);
          *(_WORD *)(v47 + 12) = 1026;
          LODWORD(v58[0]) = v12;
          sub_20A38C260();
          _os_log_impl(&dword_20A1B7000, v45, v46, "Metadata: Not notifying delegate, overlay did not change. overlay=%{public}s, isSupported=%{BOOL,public}d", (uint8_t *)v47, 0x12u);
          swift_arrayDestroy();
          MEMORY[0x210519500](v48, -1, -1);
          MEMORY[0x210519500](v47, -1, -1);
        }
        else
        {
          sub_20A36CB10(v65);
          sub_20A36CB10(v65);
        }

        if (a2) {
          a2(2, nullsub_1, 0);
        }
        goto LABEL_32;
      }
    }
  }
  sub_20A1C626C((uint64_t)v65, (uint64_t)v63);
  nullsub_1(v63);
  uint64_t v19 = v4 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeOverlay;
  sub_20A232484(v4 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeOverlay, (uint64_t)v64, &qword_26AC38C10);
  sub_20A232484((uint64_t)v63, v19, &qword_26AC38C10);
  sub_20A36CB10(v65);
  sub_20A36CB10(v64);
  *(unsigned char *)(v4 + v13) = v12;
  uint64_t v61 = 0;
  char v62 = 1;
  uint64_t v20 = v10[3];
  if (!v20 || (uint64_t v21 = __swift_project_boxed_opaque_existential_1(v10, v20)[2], (v22 = *(void *)(v21 + 16)) == 0))
  {
LABEL_25:
    int v53 = v12;
    if (qword_26AC3C4E0 != -1) {
      goto LABEL_45;
    }
    goto LABEL_26;
  }
  uint64_t v23 = v21 + 32;
  while (1)
  {
    sub_20A1C626C(v23, (uint64_t)v58);
    sub_20A1C626C((uint64_t)v58, (uint64_t)v59);
    if (sub_20A1DC760((uint64_t)v59) != 2) {
      goto LABEL_24;
    }
    uint64_t v24 = sub_20A1DC8F4((uint64_t)v59);
    uint64_t v25 = *(void *)(v24 + 152);
    if (*(unsigned char *)(v24 + 160)) {
      uint64_t v25 = 0;
    }
    BOOL v26 = __OFSUB__(*(void *)v24, v25);
    uint64_t v27 = *(void *)v24 - v25;
    if (v26) {
      break;
    }
    double v28 = rint(*(double *)(v24 + 8) * (double)v27 / 3600.0);
    if ((~*(void *)&v28 & 0x7FF0000000000000) == 0) {
      goto LABEL_42;
    }
    if (v28 <= -9.22337204e18) {
      goto LABEL_43;
    }
    if (v28 >= 9.22337204e18) {
      goto LABEL_44;
    }
    uint64_t v61 = (uint64_t)v28;
    char v62 = 0;
LABEL_24:
    v23 += 176;
    if (!--v22) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  swift_once();
LABEL_26:
  uint64_t v29 = sub_20A38A9B0();
  __swift_project_value_buffer(v29, (uint64_t)qword_26AC3C4C8);
  sub_20A36CB10(v65);
  sub_20A36CB10(v65);
  uint64_t v30 = sub_20A38A990();
  os_log_type_t v31 = sub_20A38BD00();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = swift_slowAlloc();
    v52 = a2;
    uint64_t v33 = swift_slowAlloc();
    uint64_t v60 = v33;
    *(_DWORD *)uint64_t v32 = 136446722;
    sub_20A1C626C((uint64_t)v67, (uint64_t)v59);
    sub_20A1F1148();
    uint64_t v34 = sub_20A38C7E0();
    v59[0] = sub_20A1C5B28(v34, v35, &v60);
    sub_20A38C260();
    swift_bridgeObjectRelease();
    sub_20A36CB10(v65);
    sub_20A36CB10(v65);
    *(_WORD *)(v32 + 12) = 1026;
    int v36 = v53;
    LODWORD(v59[0]) = v53;
    sub_20A38C260();
    *(_WORD *)(v32 + 18) = 2050;
    swift_beginAccess();
    uint64_t v37 = v61;
    if (v62) {
      uint64_t v37 = 0;
    }
    v59[0] = v37;
    sub_20A38C260();
    _os_log_impl(&dword_20A1B7000, v30, v31, "Metadata: Notifying delegate with new overlay metadata. overlay=%{public}s, isSupported=%{BOOL,public}d, forecastHourCount=%{public}ld", (uint8_t *)v32, 0x1Cu);
    swift_arrayDestroy();
    uint64_t v38 = v33;
    a2 = v52;
    MEMORY[0x210519500](v38, -1, -1);
    MEMORY[0x210519500](v32, -1, -1);
  }
  else
  {
    sub_20A36CB10(v65);
    sub_20A36CB10(v65);

    int v36 = v53;
  }
  uint64_t v39 = *(void *)(v4 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeCountryCode);
  uint64_t v40 = *(void *)(v4 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeCountryCode + 8);
  unsigned int v41 = *(unsigned __int8 *)(v4 + v54);
  swift_beginAccess();
  uint64_t v42 = v61;
  char v43 = v62;
  sub_20A1E5BA4(v39, v40);
  LOBYTE(v51) = v55 & 1;
  sub_20A36C338(v4, (uint64_t)v67, v39, v40, v41, v36 ^ 1, v42, v43, v51, (uint64_t)a2, a3, v9);
  sub_20A1D8BFC(v39, v40);
  sub_20A36CB10(v65);
LABEL_32:
  swift_unknownObjectRelease();
}

double sub_20A368758@<D0>(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  int v8 = *a2;
  __src[0] = *a2;
  sub_20A36A4B0(__src, a1, a3, (uint64_t)v66);
  sub_20A232484((uint64_t)v66, (uint64_t)v71, &qword_26AC3C900);
  sub_20A232484((uint64_t)v66, (uint64_t)__src, &qword_26AC3C900);
  if (sub_20A36B6C4((uint64_t)__src) == 1)
  {
    sub_20A231EB4(a1, (uint64_t)&v52, &qword_26AC3D058);
    if (v53)
    {
      uint64_t v9 = __swift_project_boxed_opaque_existential_1(&v52, v53)[2];
      v54.n128_u8[0] = v8;
      swift_bridgeObjectRetain();
      sub_20A36A994(&v54, v9, (uint64_t)v67);
      sub_20A232484((uint64_t)v67, (uint64_t)v70, &qword_26AC38C10);
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v52);
      sub_20A232484((uint64_t)v67, (uint64_t)__dst, &qword_26AC38C10);
      if (sub_20A36B6C4((uint64_t)__dst) != 1)
      {
        sub_20A1C626C((uint64_t)__dst, (uint64_t)v51);
        if (qword_26AC3C4E0 != -1) {
          swift_once();
        }
        uint64_t v10 = sub_20A38A9B0();
        __swift_project_value_buffer(v10, (uint64_t)qword_26AC3C4C8);
        sub_20A232484((uint64_t)v70, (uint64_t)v68, &qword_26AC38C10);
        sub_20A36CB10(v67);
        sub_20A36CB10(v68);
        uint64_t v11 = sub_20A38A990();
        os_log_type_t v12 = sub_20A38BD00();
        if (os_log_type_enabled(v11, v12))
        {
          uint64_t v13 = (uint8_t *)swift_slowAlloc();
          uint64_t v14 = swift_slowAlloc();
          v65[0] = v14;
          *(_DWORD *)uint64_t v13 = 136446210;
          sub_20A1C626C((uint64_t)v51, (uint64_t)&v54);
          sub_20A1F1148();
          uint64_t v15 = sub_20A38C7E0();
          v54.n128_u64[0] = sub_20A1C5B28(v15, v16, v65);
          sub_20A38C260();
          swift_bridgeObjectRelease();
          sub_20A36CB10(v67);
          sub_20A36CB10(v67);
          _os_log_impl(&dword_20A1B7000, v11, v12, "Metadata: Found supported overlay: %{public}s", v13, 0xCu);
          char v17 = 1;
          swift_arrayDestroy();
          MEMORY[0x210519500](v14, -1, -1);
          MEMORY[0x210519500](v13, -1, -1);

          sub_20A1C626C((uint64_t)v51, (uint64_t)&v54);
        }
        else
        {
          sub_20A36CB10(v67);
          sub_20A36CB10(v67);

          sub_20A1C626C((uint64_t)v51, (uint64_t)&v54);
          char v17 = 1;
        }
        goto LABEL_36;
      }
    }
    else
    {
      sub_20A2866A4((uint64_t)&v52, &qword_26AC3D058);
    }
    if (qword_26AC3C4E0 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_20A38A9B0();
    __swift_project_value_buffer(v26, (uint64_t)qword_26AC3C4C8);
    sub_20A231EB4(a1, (uint64_t)v65, &qword_26AC3D058);
    uint64_t v27 = sub_20A38A990();
    os_log_type_t v28 = sub_20A38BD00();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      v70[0] = v49;
      *(_DWORD *)uint64_t v29 = 136446210;
      sub_20A231EB4((uint64_t)v65, (uint64_t)&v54, &qword_26AC3D058);
      if (*((void *)&v55 + 1))
      {
        uint64_t v30 = __swift_project_boxed_opaque_existential_1(&v54, *((uint64_t *)&v55 + 1));
        uint64_t v31 = sub_20A2CE498(*v30, v30[1], v30[2]);
        unint64_t v33 = v32;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v54);
      }
      else
      {
        sub_20A2866A4((uint64_t)&v54, &qword_26AC3D058);
        uint64_t v31 = 0;
        unint64_t v33 = 0;
      }
      v54.n128_u64[0] = v31;
      v54.n128_u64[1] = v33;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AC3D160);
      uint64_t v34 = sub_20A38B660();
      v54.n128_u64[0] = sub_20A1C5B28(v34, v35, v70);
      sub_20A38C260();
      swift_bridgeObjectRelease();
      sub_20A2866A4((uint64_t)v65, &qword_26AC3D058);
      _os_log_impl(&dword_20A1B7000, v27, v28, "Metadata: No supported overlay found: %{public}s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x210519500](v49, -1, -1);
      MEMORY[0x210519500](v29, -1, -1);
    }
    else
    {
      sub_20A2866A4((uint64_t)v65, &qword_26AC3D058);
    }

    int v36 = (void *)(v5 + 96);
    switch(v8)
    {
      case 5:
        __swift_project_boxed_opaque_existential_1(v36, *(void *)(v5 + 120));
        sub_20A3152D0((uint64_t)v68);
        break;
      case 4:
        __swift_project_boxed_opaque_existential_1(v36, *(void *)(v5 + 120));
        sub_20A315238((uint64_t)v68);
        break;
      case 3:
        __swift_project_boxed_opaque_existential_1(v36, *(void *)(v5 + 120));
        sub_20A36CAF8(&v52);
        sub_20A232484((uint64_t)&v52, (uint64_t)v51, &qword_267626110);
        sub_20A315094(v51, (uint64_t)v68);
        break;
      default:
        __swift_project_boxed_opaque_existential_1(v36, *(void *)(v5 + 120));
        if (v8 == 1) {
          sub_20A3151C0((uint64_t)v68);
        }
        else {
          sub_20A315150((uint64_t)v68);
        }
        sub_20A1C626C((uint64_t)v68, (uint64_t)v70);
        uint64_t v37 = (__n128 *)v70;
        goto LABEL_35;
    }
    uint64_t v37 = v68;
LABEL_35:
    sub_20A1C626C((uint64_t)v37, (uint64_t)&v54);
    sub_20A1C626C((uint64_t)&v54, (uint64_t)v70);
    sub_20A1C626C((uint64_t)v70, (uint64_t)&v54);
    char v17 = 0;
LABEL_36:
    uint64_t v25 = &v54;
    goto LABEL_37;
  }
  memcpy(__dst, __src, 0xB1uLL);
  char v17 = __dst[176];
  if (qword_26AC3C4E0 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_20A38A9B0();
  __swift_project_value_buffer(v18, (uint64_t)qword_26AC3C4C8);
  sub_20A232484((uint64_t)v71, (uint64_t)&v54, &qword_26AC3C900);
  sub_20A36CB48(v66);
  sub_20A36CB10(&v54);
  uint64_t v19 = sub_20A38A990();
  os_log_type_t v20 = sub_20A38BD00();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    v68[0].n128_u64[0] = v22;
    *(_DWORD *)uint64_t v21 = 136446210;
    sub_20A1C626C((uint64_t)__dst, (uint64_t)v70);
    sub_20A1F1148();
    uint64_t v23 = sub_20A38C7E0();
    v70[0] = sub_20A1C5B28(v23, v24, (uint64_t *)v68);
    sub_20A38C260();
    swift_bridgeObjectRelease();
    sub_20A36CB48(v66);
    sub_20A36CB48(v66);
    _os_log_impl(&dword_20A1B7000, v19, v20, "Metadata: returning overriden overlay=%{public}s)", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x210519500](v22, -1, -1);
    MEMORY[0x210519500](v21, -1, -1);
  }
  else
  {
    sub_20A36CB48(v66);
    sub_20A36CB48(v66);
  }

  uint64_t v25 = (__n128 *)__dst;
LABEL_37:
  sub_20A1C626C((uint64_t)v25, (uint64_t)v70);
  sub_20A1C626C((uint64_t)v70, (uint64_t)&v54);
  double result = v54.n128_f64[0];
  long long v39 = v55;
  long long v40 = v56;
  long long v41 = v57;
  long long v42 = v58;
  long long v43 = v59;
  long long v44 = v60;
  long long v45 = v61;
  long long v46 = v62;
  long long v47 = v63;
  long long v48 = v64;
  *(__n128 *)a4 = v54;
  *(_OWORD *)(a4 + 16) = v39;
  *(_OWORD *)(a4 + 32) = v40;
  *(_OWORD *)(a4 + 48) = v41;
  *(_OWORD *)(a4 + 64) = v42;
  *(_OWORD *)(a4 + 80) = v43;
  *(_OWORD *)(a4 + 96) = v44;
  *(_OWORD *)(a4 + 112) = v45;
  *(_OWORD *)(a4 + 128) = v46;
  *(_OWORD *)(a4 + 144) = v47;
  *(_OWORD *)(a4 + 160) = v48;
  *(unsigned char *)(a4 + 176) = v17;
  return result;
}

void sub_20A36900C()
{
  OUTLINED_FUNCTION_9_4();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC392C0);
  uint64_t v5 = OUTLINED_FUNCTION_3_1(v4);
  uint64_t v75 = v6;
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v72 = (uint64_t)&v65 - v11;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v65 - v13;
  MEMORY[0x270FA5388](v15);
  char v17 = (char *)&v65 - v16;
  MEMORY[0x270FA5388](v18);
  os_log_type_t v20 = (char *)&v65 - v19;
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v65 - v22;
  uint64_t v24 = *(void *)v3;
  uint64_t v74 = *(void *)(v3 + 8);
  int v73 = *(unsigned __int8 *)(v3 + 16);
  uint64_t v25 = *(void *)(v0 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeVisibleMapRect);
  uint64_t v26 = *(void *)(v0 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeVisibleMapRect + 8);
  uint64_t v27 = *(void *)(v0 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeVisibleMapRect + 16);
  uint64_t v28 = *(void *)(v0 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeVisibleMapRect + 24);
  uint64_t v29 = v0 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeAirQualityLocation;
  swift_beginAccess();
  sub_20A231EB4(v29, (uint64_t)v23, (uint64_t *)&unk_26AC392C0);
  if (qword_26AC3C4E0 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_20A38A9B0();
  __swift_project_value_buffer(v30, (uint64_t)qword_26AC3C4C8);
  sub_20A231EB4((uint64_t)v23, (uint64_t)v20, (uint64_t *)&unk_26AC392C0);
  sub_20A231EB4((uint64_t)v23, (uint64_t)v17, (uint64_t *)&unk_26AC392C0);
  uint64_t v31 = sub_20A38A990();
  int v32 = sub_20A38BD00();
  if (os_log_type_enabled(v31, (os_log_type_t)v32))
  {
    int v67 = v32;
    os_log_t v68 = v31;
    v69 = v17;
    uint64_t v70 = v24;
    v71 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v33 = swift_slowAlloc();
    uint64_t v66 = swift_slowAlloc();
    v80[0] = v66;
    *(_DWORD *)uint64_t v33 = 136381699;
    uint64_t v76 = v25;
    uint64_t v77 = v26;
    uint64_t v78 = v27;
    uint64_t v79 = v28;
    type metadata accessor for MKMapRect(0);
    sub_20A36CE3C((unint64_t *)&qword_26AC3D258, type metadata accessor for MKMapRect);
    uint64_t v34 = sub_20A38C7E0();
    uint64_t v76 = sub_20A1C5B28(v34, v35, v80);
    sub_20A38C260();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 12) = 2160;
    uint64_t v76 = 1752392040;
    sub_20A38C260();
    *(_WORD *)(v33 + 22) = 2081;
    sub_20A231EB4((uint64_t)v20, (uint64_t)v14, (uint64_t *)&unk_26AC392C0);
    uint64_t v36 = sub_20A38A2B0();
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v36);
    if (EnumTagSinglePayload == 1)
    {
      sub_20A2866A4((uint64_t)v14, (uint64_t *)&unk_26AC392C0);
      uint64_t v38 = 0;
      uint64_t v39 = 0;
    }
    else
    {
      sub_20A38A220();
      uint64_t v38 = v41;
      uint64_t v39 = v42;
      OUTLINED_FUNCTION_5_1();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v14, v36);
    }
    uint64_t v76 = v38;
    uint64_t v77 = v39;
    LOBYTE(v78) = EnumTagSinglePayload == 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267628968);
    uint64_t v44 = sub_20A38B660();
    uint64_t v76 = sub_20A1C5B28(v44, v45, v80);
    sub_20A38C260();
    swift_bridgeObjectRelease();
    sub_20A2866A4((uint64_t)v20, (uint64_t *)&unk_26AC392C0);
    *(_WORD *)(v33 + 32) = 2160;
    uint64_t v76 = 1752392040;
    sub_20A38C260();
    *(_WORD *)(v33 + 42) = 2081;
    uint64_t v46 = (uint64_t)v69;
    uint64_t v47 = v72;
    sub_20A231EB4((uint64_t)v69, v72, (uint64_t *)&unk_26AC392C0);
    int v48 = __swift_getEnumTagSinglePayload(v47, 1, v36);
    uint64_t v9 = v71;
    if (v48 == 1)
    {
      sub_20A2866A4(v47, (uint64_t *)&unk_26AC392C0);
      uint64_t v49 = 0;
      uint64_t v50 = 0;
    }
    else
    {
      uint64_t v49 = sub_20A38A280();
      uint64_t v50 = v51;
      OUTLINED_FUNCTION_5_1();
      (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v47, v36);
    }
    uint64_t v24 = v70;
    uint64_t v76 = v49;
    uint64_t v77 = v50;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC3D160);
    uint64_t v53 = sub_20A38B660();
    uint64_t v76 = sub_20A1C5B28(v53, v54, v80);
    sub_20A38C260();
    swift_bridgeObjectRelease();
    sub_20A2866A4(v46, (uint64_t *)&unk_26AC392C0);
    os_log_t v55 = v68;
    _os_log_impl(&dword_20A1B7000, v68, (os_log_type_t)v67, "Refresh overlay metadata. visibleMapRect=%{private}s, airQualityLocation.coordinate=%{private,mask.hash}s, airQualityLocation.name=%{private,mask.hash}s", (uint8_t *)v33, 0x34u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
  }
  else
  {
    sub_20A2866A4((uint64_t)v20, (uint64_t *)&unk_26AC392C0);
    sub_20A2866A4((uint64_t)v17, (uint64_t *)&unk_26AC392C0);
  }
  uint64_t v56 = v75;
  MEMORY[0x270FA5388](v40);
  *(&v65 - 2) = (uint64_t)v23;
  *(&v65 - 1) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC38C70);
  sub_20A38A790();
  uint64_t v57 = swift_allocObject();
  *(void *)(v57 + 16) = v1;
  *(void *)(v57 + 24) = v25;
  *(void *)(v57 + 32) = v26;
  *(void *)(v57 + 40) = v27;
  *(void *)(v57 + 48) = v28;
  uint64_t v58 = v74;
  *(void *)(v57 + 56) = v24;
  *(void *)(v57 + 64) = v58;
  unsigned __int8 v59 = v73;
  *(unsigned char *)(v57 + 72) = v73;
  swift_retain();
  sub_20A1F55C4(v24, v58, v59);
  long long v60 = (void *)sub_20A38A5D0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267628960);
  sub_20A38A6A0();
  swift_release();
  swift_release();

  sub_20A1BAF8C();
  long long v61 = (void *)sub_20A38BE70();
  sub_20A231EB4((uint64_t)v23, (uint64_t)v9, (uint64_t *)&unk_26AC392C0);
  unint64_t v62 = (*(unsigned __int8 *)(v56 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
  uint64_t v63 = swift_allocObject();
  sub_20A232484((uint64_t)v9, v63 + v62, (uint64_t *)&unk_26AC392C0);
  *(void *)(v63 + ((v8 + v62 + 7) & 0xFFFFFFFFFFFFFFF8)) = v1;
  uint64_t v64 = swift_allocObject();
  *(void *)(v64 + 16) = sub_20A36CD34;
  *(void *)(v64 + 24) = v63;
  swift_retain();
  sub_20A38A6B0();
  swift_release();
  swift_release();

  swift_release();
  sub_20A2866A4((uint64_t)v23, (uint64_t *)&unk_26AC392C0);
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_20A3697D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC392C0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_20A38A2B0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A231EB4(a1, (uint64_t)v6, (uint64_t *)&unk_26AC392C0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1)
  {
    sub_20A2866A4((uint64_t)v6, (uint64_t *)&unk_26AC392C0);
    long long v13 = xmmword_20A391780;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267628970);
    swift_allocObject();
    return sub_20A38A700();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    __swift_project_boxed_opaque_existential_1((void *)(a2 + 56), *(void *)(a2 + 80));
    sub_20A38A1A0();
    uint64_t v11 = sub_20A38A680();
    swift_release();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return v11;
}

uint64_t sub_20A3699CC(uint64_t *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v10 = *a1;
  uint64_t v11 = a1[1];
  __swift_project_boxed_opaque_existential_1((void *)(a2 + 16), *(void *)(a2 + 40));
  sub_20A33E4E0(v10, v11, a3, a4, a5, a6);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  *(void *)(v12 + 24) = v11;
  sub_20A1E5BA4(v10, v11);
  long long v13 = (void *)sub_20A38A5D0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267628960);
  uint64_t v14 = sub_20A38A6B0();
  swift_release();
  swift_release();

  return v14;
}

uint64_t sub_20A369AF4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = *a1;
  a4[1] = a2;
  a4[2] = a3;
  swift_bridgeObjectRetain();
  return sub_20A1E5BA4(a2, a3);
}

void sub_20A369B3C(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v82 = a2;
  os_log_t v83 = a3;
  uint64_t v81 = a1;
  uint64_t v7 = sub_20A38A2B0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v77 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC392C0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v80 = (uint64_t)&v77 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v79 = (uint64_t)&v77 - v14;
  MEMORY[0x270FA5388](v15);
  char v17 = (char *)&v77 - v16;
  MEMORY[0x270FA5388](v18);
  uint64_t v85 = (uint64_t)&v77 - v19;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v77 - v21;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_267627C40);
  uint64_t v24 = v23 - 8;
  MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)&v77 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = a5;
  uint64_t v27 = a5 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeAirQualityLocation;
  swift_beginAccess();
  uint64_t v28 = (uint64_t)&v26[*(int *)(v24 + 56)];
  v84 = (char *)a4;
  sub_20A231EB4(a4, (uint64_t)v26, (uint64_t *)&unk_26AC392C0);
  sub_20A231EB4(v27, v28, (uint64_t *)&unk_26AC392C0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, v7) == 1)
  {
    uint64_t v29 = v8;
    if (__swift_getEnumTagSinglePayload(v28, 1, v7) == 1)
    {
      sub_20A2866A4((uint64_t)v26, (uint64_t *)&unk_26AC392C0);
LABEL_14:
      sub_20A2A6D38(v81, (uint64_t)&v87);
      sub_20A367888((uint64_t)&v87, v82, (uint64_t)v83);
      sub_20A2866A4((uint64_t)&v87, &qword_26AC3D058);
      return;
    }
    goto LABEL_6;
  }
  sub_20A231EB4((uint64_t)v26, (uint64_t)v22, (uint64_t *)&unk_26AC392C0);
  uint64_t v29 = v8;
  if (__swift_getEnumTagSinglePayload(v28, 1, v7) == 1)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v22, v7);
LABEL_6:
    sub_20A2866A4((uint64_t)v26, &qword_267627C40);
    uint64_t v30 = v10;
    goto LABEL_7;
  }
  uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 32);
  uint64_t v30 = v10;
  v42(v10, v28, v7);
  sub_20A36CE3C((unint64_t *)&qword_26AC38C80, MEMORY[0x263F85DA8]);
  char v43 = sub_20A38B5C0();
  uint64_t v44 = v29;
  unint64_t v45 = *(void (**)(char *, uint64_t))(v29 + 8);
  v45(v30, v7);
  v45(v22, v7);
  uint64_t v29 = v44;
  sub_20A2866A4((uint64_t)v26, (uint64_t *)&unk_26AC392C0);
  if (v43) {
    goto LABEL_14;
  }
LABEL_7:
  if (qword_26AC3C4E0 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_20A38A9B0();
  __swift_project_value_buffer(v31, (uint64_t)qword_26AC3C4C8);
  uint64_t v33 = (uint64_t)v84;
  uint64_t v32 = v85;
  sub_20A231EB4((uint64_t)v84, v85, (uint64_t *)&unk_26AC392C0);
  sub_20A231EB4(v33, (uint64_t)v17, (uint64_t *)&unk_26AC392C0);
  swift_retain_n();
  uint64_t v34 = sub_20A38A990();
  int v35 = sub_20A38BD00();
  if (os_log_type_enabled(v34, (os_log_type_t)v35))
  {
    LODWORD(v82) = v35;
    v84 = v17;
    uint64_t v36 = swift_slowAlloc();
    uint64_t v81 = swift_slowAlloc();
    uint64_t v90 = v81;
    *(_DWORD *)uint64_t v36 = 141559811;
    uint64_t v87 = 1752392040;
    sub_20A38C260();
    *(_WORD *)(v36 + 12) = 2081;
    uint64_t v37 = v32;
    uint64_t v38 = v79;
    sub_20A231EB4(v37, v79, (uint64_t *)&unk_26AC392C0);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v38, 1, v7);
    os_log_t v83 = v34;
    if (EnumTagSinglePayload == 1)
    {
      sub_20A2866A4(v38, (uint64_t *)&unk_26AC392C0);
      uint64_t v40 = 0;
      uint64_t v41 = 0;
    }
    else
    {
      sub_20A38A220();
      uint64_t v40 = v46;
      uint64_t v41 = v47;
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v38, v7);
    }
    uint64_t v87 = v40;
    uint64_t v88 = v41;
    BOOL v89 = EnumTagSinglePayload == 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267628968);
    uint64_t v48 = sub_20A38B660();
    uint64_t v87 = sub_20A1C5B28(v48, v49, &v90);
    sub_20A38C260();
    swift_bridgeObjectRelease();
    sub_20A2866A4(v85, (uint64_t *)&unk_26AC392C0);
    *(_WORD *)(v36 + 22) = 2160;
    uint64_t v87 = 1752392040;
    sub_20A38C260();
    *(_WORD *)(v36 + 32) = 2081;
    uint64_t v50 = v80;
    sub_20A231EB4((uint64_t)v84, v80, (uint64_t *)&unk_26AC392C0);
    int v51 = __swift_getEnumTagSinglePayload(v50, 1, v7);
    uint64_t v77 = v30;
    uint64_t v78 = v29;
    if (v51 == 1)
    {
      sub_20A2866A4(v50, (uint64_t *)&unk_26AC392C0);
      uint64_t v52 = 0;
      uint64_t v53 = 0;
    }
    else
    {
      uint64_t v52 = sub_20A38A280();
      uint64_t v53 = v54;
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v50, v7);
    }
    uint64_t v87 = v52;
    uint64_t v88 = v53;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC3D160);
    uint64_t v55 = sub_20A38B660();
    uint64_t v87 = sub_20A1C5B28(v55, v56, &v90);
    sub_20A38C260();
    swift_bridgeObjectRelease();
    sub_20A2866A4((uint64_t)v84, (uint64_t *)&unk_26AC392C0);
    *(_WORD *)(v36 + 42) = 2160;
    uint64_t v87 = 1752392040;
    sub_20A38C260();
    *(_WORD *)(v36 + 52) = 2081;
    int v57 = __swift_getEnumTagSinglePayload(v27, 1, v7);
    uint64_t v58 = 0;
    uint64_t v59 = 0;
    if (!v57)
    {
      uint64_t v60 = v27;
      long long v61 = v77;
      uint64_t v62 = v78;
      (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v77, v60, v7);
      sub_20A38A220();
      uint64_t v58 = v63;
      uint64_t v59 = v64;
      uint64_t v65 = v62;
      uint64_t v27 = v60;
      (*(void (**)(char *, uint64_t))(v65 + 8))(v61, v7);
    }
    uint64_t v87 = v58;
    uint64_t v88 = v59;
    BOOL v89 = v57 != 0;
    uint64_t v66 = sub_20A38B660();
    uint64_t v87 = sub_20A1C5B28(v66, v67, &v90);
    sub_20A38C260();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v36 + 62) = 2160;
    uint64_t v87 = 1752392040;
    sub_20A38C260();
    *(_WORD *)(v36 + 72) = 2081;
    if (__swift_getEnumTagSinglePayload(v27, 1, v7))
    {
      uint64_t v68 = 0;
      uint64_t v69 = 0;
    }
    else
    {
      v71 = v77;
      uint64_t v70 = v78;
      (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v77, v27, v7);
      uint64_t v68 = sub_20A38A280();
      uint64_t v69 = v72;
      (*(void (**)(char *, uint64_t))(v70 + 8))(v71, v7);
    }
    uint64_t v87 = v68;
    uint64_t v88 = v69;
    uint64_t v73 = sub_20A38B660();
    uint64_t v87 = sub_20A1C5B28(v73, v74, &v90);
    sub_20A38C260();
    swift_release_n();
    swift_bridgeObjectRelease();
    os_log_t v75 = v83;
    _os_log_impl(&dword_20A1B7000, v83, (os_log_type_t)v82, "Ignore metadata update, airQuality location no longer matches. airQualityLocation.coordinate=%{private,mask.hash}s, airQualityLocation.name=%{private,mask.hash}s, activeAirQualityLocation.coordinate=%{private,mask.hash}s, activeAirQualityLocation.name=%{private,mask.hash}s ", (uint8_t *)v36, 0x52u);
    uint64_t v76 = v81;
    swift_arrayDestroy();
    MEMORY[0x210519500](v76, -1, -1);
    MEMORY[0x210519500](v36, -1, -1);
  }
  else
  {
    sub_20A2866A4(v32, (uint64_t *)&unk_26AC392C0);
    sub_20A2866A4((uint64_t)v17, (uint64_t *)&unk_26AC392C0);

    swift_release_n();
  }
}

uint64_t sub_20A36A4B0@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  int v6 = *a1;
  if ((v6 - 3) >= 3)
  {
    uint64_t v7 = v4;
    if (*a1)
    {
      sub_20A231EB4(a2, (uint64_t)v31, &qword_26AC3D058);
      if (v32)
      {
        uint64_t v10 = __swift_project_boxed_opaque_existential_1(v31, v32)[2];
        uint64_t v11 = *(void *)(v10 + 16);
        if (v11)
        {
          sub_20A1C626C(v10 + 32, (uint64_t)__dst);
          uint64_t v12 = v10 + 208;
          while (1)
          {
            --v11;
            sub_20A1C626C((uint64_t)__dst, (uint64_t)&v33);
            switch(sub_20A1DC760((uint64_t)&v33))
            {
              case 1u:
                sub_20A1DC8F4((uint64_t)&v33);
                if (v6 != 1) {
                  goto LABEL_11;
                }
                char v17 = 1;
                goto LABEL_27;
              case 2u:
                sub_20A1DC8F4((uint64_t)&v33);
                if (v6 != 2) {
                  goto LABEL_11;
                }
                char v17 = 2;
LABEL_27:
                *(unsigned char *)(v7 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeOverlayKind) = v17;
                sub_20A1C626C((uint64_t)__dst, (uint64_t)v22);
                nullsub_1(v22);
                sub_20A36CB10((__n128 *)__dst);
                __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
                uint64_t v18 = (long long *)v22;
                goto LABEL_31;
              default:
                sub_20A1DC8F4((uint64_t)&v33);
LABEL_11:
                if (!v11) {
                  goto LABEL_18;
                }
                sub_20A1C626C(v12, (uint64_t)__dst);
                v12 += 176;
                break;
            }
          }
        }
LABEL_18:
        sub_20A2155C8(&v33);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
      }
      else
      {
        sub_20A2866A4((uint64_t)v31, &qword_26AC3D058);
        sub_20A2155C8(&v33);
      }
      sub_20A232484((uint64_t)&v33, (uint64_t)v24, &qword_26AC38C10);
      sub_20A36CB10(v24);
      if (v6 == 1)
      {
        *(unsigned char *)(v7 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeOverlayKind) = 1;
        __swift_project_boxed_opaque_existential_1((void *)(v7 + 96), *(void *)(v7 + 120));
        sub_20A3151C0((uint64_t)v31);
        sub_20A1C626C((uint64_t)v31, (uint64_t)&v33);
        sub_20A1C626C((uint64_t)&v33, (uint64_t)v26);
      }
      else
      {
        *(unsigned char *)(v7 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeOverlayKind) = 2;
        __swift_project_boxed_opaque_existential_1((void *)(v7 + 96), *(void *)(v7 + 120));
        sub_20A315150((uint64_t)v31);
        sub_20A1C626C((uint64_t)v31, (uint64_t)&v33);
        sub_20A1C626C((uint64_t)&v33, (uint64_t)v26);
        int v6 = 1;
      }
LABEL_32:
      sub_20A231EB4(a2, (uint64_t)&v33, &qword_26AC3D058);
      if (v34)
      {
        sub_20A1BE594(&v33, (uint64_t)v23);
        if (v6 && *(void *)(a3 + 16))
        {
          uint64_t v19 = __swift_project_boxed_opaque_existential_1(v23, v23[3]);
          unsigned __int8 v20 = sub_20A36BDC8(*v19, v19[1], v19[2], v19[3], a3);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
          if ((v20 & 1) == 0)
          {
            sub_20A1C626C((uint64_t)v26, (uint64_t)v22);
            v22[176] = 0;
LABEL_40:
            memcpy(__dst, v22, sizeof(__dst));
            nullsub_1(__dst);
            goto LABEL_41;
          }
        }
        else
        {
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
        }
      }
      else
      {
        sub_20A2866A4((uint64_t)&v33, &qword_26AC3D058);
      }
      sub_20A1C626C((uint64_t)v26, (uint64_t)v22);
      v22[176] = 1;
      goto LABEL_40;
    }
    sub_20A231EB4(a2, (uint64_t)__dst, &qword_26AC3D058);
    if (*(void *)&__dst[24])
    {
      uint64_t v13 = __swift_project_boxed_opaque_existential_1(__dst, *(uint64_t *)&__dst[24])[2];
      v22[0] = 0;
      swift_bridgeObjectRetain();
      sub_20A36A994(v22, v13, (uint64_t)v28);
      sub_20A232484((uint64_t)v28, (uint64_t)&v33, &qword_26AC38C10);
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)__dst);
      sub_20A232484((uint64_t)v28, (uint64_t)v29, &qword_26AC38C10);
      if (sub_20A36B6C4((uint64_t)v29) != 1)
      {
        sub_20A1C626C((uint64_t)v29, (uint64_t)v30);
        sub_20A1C626C((uint64_t)v30, (uint64_t)v31);
        int v14 = sub_20A1DC760((uint64_t)v31);
        if (v14 == 2)
        {
          sub_20A1DC8F4((uint64_t)v31);
          uint64_t v15 = OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeOverlayKind;
          char v16 = 2;
        }
        else
        {
          if (v14 != 1) {
            goto LABEL_30;
          }
          sub_20A1DC8F4((uint64_t)v31);
          uint64_t v15 = OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeOverlayKind;
          char v16 = 1;
        }
        *(unsigned char *)(v7 + v15) = v16;
LABEL_30:
        uint64_t v18 = &v33;
LABEL_31:
        sub_20A232484((uint64_t)v18, (uint64_t)v25, &qword_26AC38C10);
        sub_20A232484((uint64_t)v25, (uint64_t)&v33, &qword_26AC38C10);
        sub_20A1C626C((uint64_t)&v33, (uint64_t)v26);
        int v6 = 0;
        goto LABEL_32;
      }
    }
    else
    {
      sub_20A2866A4((uint64_t)__dst, &qword_26AC3D058);
      sub_20A2155C8(&v33);
    }
    sub_20A232484((uint64_t)&v33, (uint64_t)v24, &qword_26AC38C10);
  }
  sub_20A36CB88((uint64_t)__dst);
LABEL_41:
  sub_20A232484((uint64_t)__dst, (uint64_t)&v33, &qword_26AC3C900);
  return sub_20A232484((uint64_t)&v33, a4, &qword_26AC3C900);
}

uint64_t sub_20A36A994@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v5 = *a1;
  if (*a1)
  {
    uint64_t v6 = *(void *)(a2 + 16);
    if (v6)
    {
      sub_20A1C626C(a2 + 32, (uint64_t)v13);
      uint64_t v7 = a2 + 208;
      while (1)
      {
        --v6;
        sub_20A1C626C((uint64_t)v13, (uint64_t)v14);
        switch(sub_20A1DC760((uint64_t)v14))
        {
          case 1u:
            sub_20A1DC8F4((uint64_t)v14);
            if (v5 != 1) {
              goto LABEL_14;
            }
            goto LABEL_19;
          case 2u:
            sub_20A1DC8F4((uint64_t)v14);
            if (v5 == 2) {
              goto LABEL_19;
            }
            goto LABEL_14;
          case 3u:
            sub_20A1DC8F4((uint64_t)v14);
            if (v5 == 4) {
              goto LABEL_19;
            }
            goto LABEL_14;
          case 4u:
            sub_20A1DC8F4((uint64_t)v14);
            if (v5 != 5) {
              goto LABEL_14;
            }
            goto LABEL_19;
          default:
            sub_20A1DC8F4((uint64_t)v14);
            if (v5 == 3)
            {
LABEL_19:
              sub_20A1C626C((uint64_t)v13, (uint64_t)v12);
              nullsub_1(v12);
              sub_20A36CB10(v13);
              uint64_t v8 = v12;
              goto LABEL_21;
            }
LABEL_14:
            if (!v6) {
              goto LABEL_16;
            }
            sub_20A1C626C(v7, (uint64_t)v13);
            v7 += 176;
            break;
        }
      }
    }
LABEL_16:
    sub_20A2155C8(v14);
    uint64_t v8 = v14;
  }
  else
  {
    v15[0] = 1;
    sub_20A36A994(v12, v15, a2);
    sub_20A232484((uint64_t)v12, (uint64_t)v11, &qword_26AC38C10);
    sub_20A232484((uint64_t)v12, (uint64_t)v13, &qword_26AC38C10);
    if (sub_20A36B6C4((uint64_t)v13) == 1)
    {
      v15[0] = 2;
      sub_20A36A994(v14, v15, a2);
      sub_20A232484((uint64_t)v14, (uint64_t)v10, &qword_26AC38C10);
      uint64_t v8 = v10;
    }
    else
    {
      sub_20A1C626C((uint64_t)v13, (uint64_t)v14);
      uint64_t v8 = v11;
    }
  }
LABEL_21:
  sub_20A232484((uint64_t)v8, (uint64_t)v15, &qword_26AC38C10);
  return sub_20A232484((uint64_t)v15, a3, &qword_26AC38C10);
}

uint64_t sub_20A36ABD4()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  sub_20A2866A4(v0 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeAirQualityLocation, (uint64_t *)&unk_26AC392C0);
  sub_20A1D8BFC(*(void *)(v0 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeCountryCode), *(void *)(v0 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeCountryCode + 8));
  sub_20A232484(v0 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeOverlay, (uint64_t)v2, &qword_26AC38C10);
  sub_20A36CB10(v2);
  sub_20A2866A4(v0 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeRegion, &qword_26AC3D058);
  swift_bridgeObjectRelease();
  sub_20A1CC7A0(v0 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_delegate);
  return v0;
}

uint64_t sub_20A36ACB0()
{
  sub_20A36ABD4();
  OUTLINED_FUNCTION_1_1();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);
  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t sub_20A36ACE8()
{
  return type metadata accessor for WeatherMapOverlayMetadataManager();
}

uint64_t type metadata accessor for WeatherMapOverlayMetadataManager()
{
  uint64_t result = qword_26AC3A358;
  if (!qword_26AC3A358) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_20A36AD38()
{
  sub_20A23C488();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_20A36AE34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v32 = a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC392C0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = &v28[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = &v28[-v10];
  uint64_t v12 = sub_20A38A2B0();
  OUTLINED_FUNCTION_2_3();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  char v17 = &v28[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = sub_20A38B300();
  OUTLINED_FUNCTION_2_3();
  uint64_t v20 = v19;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_28_0();
  uint64_t v22 = *(void *)a2;
  uint64_t v30 = *(void *)(a2 + 8);
  uint64_t v31 = v22;
  int v29 = *(unsigned __int8 *)(a2 + 16);
  sub_20A1BAF8C();
  uint64_t *v3 = sub_20A38BE70();
  uint64_t v23 = OUTLINED_FUNCTION_7_36();
  v24(v23);
  LOBYTE(a2) = sub_20A38B320();
  (*(void (**)(uint64_t *, uint64_t))(v20 + 8))(v3, v18);
  if ((a2 & 1) == 0)
  {
    __break(1u);
    return;
  }
  uint64_t v25 = v4 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeAirQualityLocation;
  swift_beginAccess();
  sub_20A231EB4(v25, (uint64_t)v11, (uint64_t *)&unk_26AC392C0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
  {
    sub_20A2866A4((uint64_t)v11, (uint64_t *)&unk_26AC392C0);
    uint64_t v26 = v32;
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v14 + 32))(v17, v11, v12);
    uint64_t v26 = v32;
    char v27 = sub_20A38A250();
    (*(void (**)(unsigned char *, uint64_t))(v14 + 8))(v17, v12);
    if (v27) {
      return;
    }
  }
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v14 + 16))(v8, v26, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v12);
  swift_beginAccess();
  sub_20A23E30C((uint64_t)v8, v25);
  swift_endAccess();
  uint64_t v33 = v31;
  uint64_t v34 = v30;
  char v35 = v29;
  sub_20A36900C();
}

void sub_20A36B118(unsigned __int8 *a1, uint64_t a2, char a3, void (*a4)(uint64_t, uint64_t (*)(void), void), uint64_t a5)
{
  uint64_t v7 = v5;
  uint64_t v12 = sub_20A38B300();
  OUTLINED_FUNCTION_2_3();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_28_0();
  int v16 = *a1;
  sub_20A1BAF8C();
  *uint64_t v6 = sub_20A38BE70();
  uint64_t v17 = OUTLINED_FUNCTION_7_36();
  v18(v17);
  LOBYTE(a1) = sub_20A38B320();
  uint64_t v20 = *(void (**)(uint64_t *, uint64_t))(v14 + 8);
  p_vtable = (void **)(v14 + 8);
  v20(v6, v12);
  if ((a1 & 1) == 0)
  {
    __break(1u);
    goto LABEL_41;
  }
  if (a2)
  {
    *(void *)(v7 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activePointsOfInterest) = a2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  if (!v16)
  {
    uint64_t v29 = *(void *)(v7 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activePointsOfInterest);
    if (*(void *)(v29 + 16))
    {
      uint64_t v30 = v7 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeRegion;
      swift_beginAccess();
      sub_20A231EB4(v30, (uint64_t)&v46, &qword_26AC3D058);
      if (v47)
      {
        sub_20A1BE594(&v46, (uint64_t)v48);
        if (*(void *)(v29 + 16))
        {
          uint64_t v44 = a5;
          uint64_t v31 = __swift_project_boxed_opaque_existential_1(v48, v48[3]);
          uint64_t v32 = *v31;
          uint64_t v33 = v31[1];
          uint64_t v35 = v31[2];
          uint64_t v34 = v31[3];
          swift_bridgeObjectRetain();
          LOBYTE(v34) = sub_20A36BDC8(v32, v33, v35, v34, v29);
          swift_bridgeObjectRelease();
          if ((v34 & 1) == 0)
          {
            LOBYTE(v46) = 2;
            sub_20A36B118(&v46, a2, a3 & 1, a4, v44);
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
            return;
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
          a5 = v44;
        }
        else
        {
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
        }
      }
      else
      {
        sub_20A2866A4((uint64_t)&v46, &qword_26AC3D058);
      }
    }
  }
  p_vtable = &OBJC_METACLASS____TtC11WeatherMaps28WeatherMapOverlayDataManager.vtable;
  if (a3)
  {
LABEL_6:
    if (qword_26AC3C4E0 == -1)
    {
LABEL_7:
      uint64_t v21 = sub_20A38A9B0();
      __swift_project_value_buffer(v21, (uint64_t)qword_26AC3C4C8);
      uint64_t v22 = sub_20A38A990();
      os_log_type_t v23 = sub_20A38BD00();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        v48[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v24 = 136446210;
        LOBYTE(v46) = v16;
        sub_20A1F0AA8();
        uint64_t v25 = sub_20A38C7E0();
        uint64_t v27 = sub_20A1C5B28(v25, v26, v48);
        OUTLINED_FUNCTION_6_35(v27);
        p_vtable = &OBJC_METACLASS____TtC11WeatherMaps28WeatherMapOverlayDataManager.vtable;
        sub_20A38C260();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_20A1B7000, v22, v23, "Metadata: Updating overlayKind. overlayKind=%{public}s", v24, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_3_0();
      }

      *((unsigned char *)p_vtable[101] + v7) = v16;
      sub_20A232484(v7 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeOverlay, (uint64_t)&v46, &qword_26AC38C10);
      sub_20A232484((uint64_t)&v46, (uint64_t)v48, &qword_26AC38C10);
      if (sub_20A36B6C4((uint64_t)v48) != 1) {
        sub_20A367D10(a3 & 1, a4, a5);
      }
      return;
    }
LABEL_41:
    swift_once();
    goto LABEL_7;
  }
  int v28 = *(unsigned __int8 *)(v7 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeOverlayKind);
  switch(v16)
  {
    case 5:
      if (v28 != 5) {
        goto LABEL_6;
      }
      break;
    case 4:
      if (v28 != 4) {
        goto LABEL_6;
      }
      break;
    case 3:
      if (v28 != 3) {
        goto LABEL_6;
      }
      break;
    default:
      if ((v28 - 6) > 0xFFFFFFFC || v16 != v28) {
        goto LABEL_6;
      }
      break;
  }
  if (qword_26AC3C4E0 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_20A38A9B0();
  __swift_project_value_buffer(v37, (uint64_t)qword_26AC3C4C8);
  uint64_t v38 = sub_20A38A990();
  os_log_type_t v39 = sub_20A38BD00();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    v48[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v40 = 136446210;
    LOBYTE(v46) = v16;
    sub_20A1F0AA8();
    uint64_t v41 = sub_20A38C7E0();
    uint64_t v43 = sub_20A1C5B28(v41, v42, v48);
    OUTLINED_FUNCTION_6_35(v43);
    sub_20A38C260();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_20A1B7000, v38, v39, "Metadata: Not updating overlayKind as it's the same. overlayKind=%{public}s", v40, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
  }

  if (a4) {
    a4(2, nullsub_1, 0);
  }
}

uint64_t sub_20A36B6C4(uint64_t a1)
{
  if ((*(void *)(a1 + 160) >> 1) > 0x80000000) {
    return -(*(void *)(a1 + 160) >> 1);
  }
  else {
    return 0;
  }
}

void sub_20A36B6DC()
{
  OUTLINED_FUNCTION_9_4();
  uint64_t v6 = v0;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  OUTLINED_FUNCTION_9_31();
  uint64_t v11 = sub_20A38B300();
  OUTLINED_FUNCTION_2_3();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  int v16 = (void *)((char *)v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = *(void *)v8;
  uint64_t v18 = *(void *)(v8 + 8);
  char v19 = *(unsigned char *)(v8 + 16);
  sub_20A1BAF8C();
  *int v16 = sub_20A38BE70();
  (*(void (**)(uint64_t *, void, uint64_t))(v13 + 104))(v16, *MEMORY[0x263F8F0E0], v11);
  LOBYTE(v8) = sub_20A38B320();
  (*(void (**)(uint64_t *, uint64_t))(v13 + 8))(v16, v11);
  if ((v8 & 1) == 0)
  {
    __break(1u);
LABEL_20:
    swift_once();
    goto LABEL_14;
  }
  *(void *)(v6 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activePointsOfInterest) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = (double *)(v6 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeVisibleMapRect);
  BOOL v21 = *(double *)(v6 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeVisibleMapRect) == v5
     && *(double *)(v6 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeVisibleMapRect + 8) == v4;
  if (!v21
    || (v20[2] == v3 ? (BOOL v22 = v20[3] == v2) : (BOOL v22 = 0),
        !v22 || *(double *)(v6 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeZoomLevel) != v1))
  {
    *uint64_t v20 = v5;
    v20[1] = v4;
    v20[2] = v3;
    v20[3] = v2;
    *(double *)(v6 + OBJC_IVAR____TtC11WeatherMaps32WeatherMapOverlayMetadataManager_activeZoomLevel) = v1;
    v27[1] = v17;
    v27[2] = v18;
    char v28 = v19;
    sub_20A36900C();
    goto LABEL_18;
  }
  if (qword_26AC3C4E0 != -1) {
    goto LABEL_20;
  }
LABEL_14:
  uint64_t v23 = sub_20A38A9B0();
  __swift_project_value_buffer(v23, (uint64_t)qword_26AC3C4C8);
  uint64_t v24 = sub_20A38A990();
  os_log_type_t v25 = sub_20A38BD00();
  if (os_log_type_enabled(v24, v25))
  {
    unint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v26 = 0;
    _os_log_impl(&dword_20A1B7000, v24, v25, "Metadata: No need to update metadata - VisibleMapRect & ZoomLevel did not change", v26, 2u);
    OUTLINED_FUNCTION_3_0();
  }

LABEL_18:
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_20A36B914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_9_31();
  OUTLINED_FUNCTION_1_1();
  char v10 = *v9;
  uint64_t v12 = *(void *)v11;
  uint64_t v13 = *(void *)(v11 + 8);
  unsigned __int8 v14 = *(unsigned char *)(v11 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC38C70);
  sub_20A38A790();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v7;
  *(void *)(v15 + 24) = v6;
  *(void *)(v15 + 32) = v5;
  *(void *)(v15 + 40) = v4;
  *(void *)(v15 + 48) = v12;
  *(void *)(v15 + 56) = v13;
  *(unsigned char *)(v15 + 64) = v14;
  *(unsigned char *)(v15 + 65) = v10;
  *(void *)(v15 + 72) = v3;
  *(void *)(v15 + 80) = a3;
  sub_20A1F55C4(v12, v13, v14);
  swift_bridgeObjectRetain();
  int v16 = (void *)sub_20A38A5D0();
  uint64_t v17 = sub_20A38A6C0();
  swift_release();
  swift_release();

  return v17;
}

uint64_t sub_20A36BA60(uint64_t a1)
{
  __swift_project_boxed_opaque_existential_1((void *)(a1 + 56), *(void *)(a1 + 80));
  sub_20A38A1A0();
  uint64_t v1 = sub_20A38A680();
  swift_release();
  return v1;
}

uint64_t sub_20A36BAD4(uint64_t *a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12)
{
  uint64_t v16 = *a1;
  uint64_t v17 = a1[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC38DD0);
  sub_20A38A790();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a2;
  *(unsigned char *)(v18 + 24) = a11;
  *(double *)(v18 + 32) = a7;
  *(void *)(v18 + 40) = a12;
  *(void *)(v18 + 48) = v16;
  *(void *)(v18 + 56) = v17;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_20A1E5BA4(v16, v17);
  char v19 = (void *)sub_20A38A5D0();
  uint64_t v20 = sub_20A38A6B0();
  swift_release();
  swift_release();

  return v20;
}

uint64_t sub_20A36BC10(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  return sub_20A33E4E0(a2, a3, a4, a5, a6, a7);
}

uint64_t sub_20A36BCB8@<X0>(uint64_t *a1@<X0>, unsigned __int8 a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  sub_20A2A6D38(*a1, (uint64_t)v13);
  unsigned __int8 v12 = a2;
  sub_20A368758((uint64_t)v13, &v12, a3, (uint64_t)&v14);
  LOBYTE(a3) = v15;
  sub_20A2866A4((uint64_t)v13, &qword_26AC3D058);
  sub_20A1C626C((uint64_t)&v14, a6);
  *(void *)(a6 + 176) = a4;
  *(void *)(a6 + 184) = a5;
  *(unsigned char *)(a6 + 192) = a2;
  *(unsigned char *)(a6 + 193) = a3 ^ 1;
  return sub_20A1E5BA4(a4, a5);
}

id sub_20A36BDC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v46 = sub_20A38A300();
  uint64_t v10 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  unint64_t v45 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = &unk_26BE38430;
  unint64_t v49 = &off_26BE38450;
  unsigned __int8 v12 = (void *)swift_allocObject();
  v47[0] = v12;
  v12[2] = a1;
  v12[3] = a2;
  v12[4] = a3;
  v12[5] = a4;
  if (!*(void *)(__swift_project_boxed_opaque_existential_1(v47, (uint64_t)&unk_26BE38430)[3] + 16)
    || (uint64_t v13 = *(void *)(a5 + 16)) == 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_21:
    uint64_t v36 = 0;
    goto LABEL_22;
  }
  uint64_t v14 = qword_26AC3C4E0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v14 != -1) {
    goto LABEL_25;
  }
  while (1)
  {
    uint64_t v15 = sub_20A38A9B0();
    __swift_project_value_buffer(v15, (uint64_t)qword_26AC3C4C8);
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_20A38A990();
    os_log_type_t v17 = sub_20A38BD00();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 134349056;
      uint64_t v50 = v13;
      sub_20A38C260();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_20A1B7000, v16, v17, "Metadata: checking whether region contains %{public}ld coordinate(s)", v18, 0xCu);
      MEMORY[0x210519500](v18, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    uint64_t v19 = a5 + 32;
    unsigned int v44 = *MEMORY[0x263F00040];
    unint64_t v42 = v51;
    uint64_t v43 = (void (**)(char *, void, uint64_t))(v10 + 104);
    uint64_t v20 = (void (**)(char *, uint64_t))(v10 + 8);
    uint64_t v39 = a5;
    swift_bridgeObjectRetain();
    uint64_t v21 = 0;
    uint64_t v38 = v13;
    uint64_t v37 = a5 + 32;
    uint64_t v10 = v46;
LABEL_9:
    if (v21 != v13) {
      break;
    }
    __break(1u);
LABEL_25:
    swift_once();
  }
  MKMapPoint v22 = MKMapPointForCoordinate(*(CLLocationCoordinate2D *)(v19 + 16 * v21));
  uint64_t v23 = __swift_project_boxed_opaque_existential_1(v47, (uint64_t)v48)[3];
  a5 = *(void *)(v23 + 16);
  if (!a5)
  {
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  uint64_t v40 = v21 + 1;
  swift_bridgeObjectRetain_n();
  uint64_t v41 = v23;
  uint64_t v24 = (unsigned char *)(v23 + 40);
  while (1)
  {
    os_log_type_t v25 = (void *)*((void *)v24 - 1);
    unint64_t v26 = (Class *)0x263F109C0;
    if (*v24)
    {
      uint64_t v27 = &selRef_initWithMultiPolygon_;
    }
    else
    {
      unint64_t v26 = (Class *)0x263F10A00;
      uint64_t v27 = &selRef_initWithPolygon_;
    }
    id v28 = objc_allocWithZone(*v26);
    id v29 = v25;
    id v30 = objc_msgSend(v28, *v27, v29);
    objc_msgSend(v30, sel_pointForMapPoint_, v22.x, v22.y);
    id result = objc_msgSend(v30, sel_path);
    if (!result)
    {
      __break(1u);
      return result;
    }
    uint64_t v32 = result;
    uint64_t v33 = v45;
    (*v43)(v45, v44, v10);
    uint64_t v34 = v42;
    *unint64_t v42 = 0;
    v34[1] = 0;
    uint64_t v50 = 0x3FF0000000000000;
    v51[2] = 0x3FF0000000000000;
    v51[3] = 0;
    v51[4] = 0;
    char v35 = sub_20A38C200();

    (*v20)(v33, v10);
    if (v35) {
      break;
    }
    v24 += 16;
    if (!--a5)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      goto LABEL_21;
    }
  }
  swift_bridgeObjectRelease_n();
  uint64_t v13 = v38;
  uint64_t v21 = v40;
  uint64_t v19 = v37;
  if (v40 != v38) {
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
  uint64_t v36 = 1;
LABEL_22:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
  return (id)v36;
}

uint64_t sub_20A36C27C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_20A36C2C4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,unint64_t a21)
{
  if (a21 >> 1 != 0xFFFFFFFF)
  {
    return sub_20A1D8C10(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21);
  }
  return result;
}

uint64_t sub_20A36C338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v53 = a7;
  uint64_t v54 = a3;
  unint64_t v56 = __PAIR64__(a6, a5);
  uint64_t v55 = a2;
  uint64_t v14 = type metadata accessor for ScrubberStore.ViewModel(0);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  os_log_type_t v17 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v51 - v18;
  if (qword_26AC3C4E0 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_20A38A9B0();
  __swift_project_value_buffer(v20, (uint64_t)qword_26AC3C4C8);
  uint64_t v21 = sub_20A38A990();
  os_log_type_t v22 = sub_20A38BD00();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    int v51 = v17;
    uint64_t v24 = v23;
    uint64_t v25 = swift_slowAlloc();
    uint64_t v52 = a4;
    uint64_t v26 = v25;
    v58[0] = v25;
    *(_DWORD *)uint64_t v24 = 136446466;
    LOBYTE(v57) = v56;
    sub_20A1F0AA8();
    uint64_t v27 = sub_20A38C7E0();
    uint64_t v57 = sub_20A1C5B28(v27, v28, v58);
    sub_20A38C260();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 1026;
    LODWORD(v57) = BYTE4(v56) & 1;
    sub_20A38C260();
    _os_log_impl(&dword_20A1B7000, v21, v22, "Receiving new overlay metadata. Will transition to new overlay. overlayKind=%{public}s, isLocatedInUnsupportedArea=%{BOOL,public}d", (uint8_t *)v24, 0x12u);
    swift_arrayDestroy();
    uint64_t v29 = v26;
    a4 = v52;
    MEMORY[0x210519500](v29, -1, -1);
    uint64_t v30 = v24;
    os_log_type_t v17 = v51;
    MEMORY[0x210519500](v30, -1, -1);
  }

  if ((a8 & 1) == 0)
  {
    uint64_t v31 = MEMORY[0x210519640](a12 + 360);
    if (v31)
    {
      uint64_t v32 = *(void *)(v31 + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_scrubberStore)
          + OBJC_IVAR____TtC11WeatherMaps13ScrubberStore_viewModel;
      swift_beginAccess();
      sub_20A36CA38(v32, (uint64_t)v19);
      uint64_t v33 = &v19[*(int *)(v14 + 64)];
      *(void *)uint64_t v33 = v53;
      v33[8] = 0;
      sub_20A36CA38((uint64_t)v19, (uint64_t)v17);
      swift_retain();
      sub_20A28D700((uint64_t)v17);
      sub_20A36CA9C((uint64_t)v19);
      swift_unknownObjectRelease();
      swift_release();
    }
  }
  __swift_project_boxed_opaque_existential_1((void *)(a12 + 208), *(void *)(a12 + 232));
  uint64_t v34 = *(void *)(a12 + 384);
  sub_20A389D20();
  sub_20A389D00();
  if (qword_26AC3C878 != -1) {
    swift_once();
  }
  sub_20A389CF0();
  swift_release();
  unsigned __int8 v35 = v56;
  if (v57 == 1)
  {
    LOBYTE(v57) = v56;
    uint64_t v36 = sub_20A240D08(&v57, v34);
  }
  else
  {
    LOBYTE(v57) = v56;
    uint64_t v36 = sub_20A324EE4((unsigned __int8 *)&v57, v34);
  }
  LOBYTE(v57) = v35;
  char v40 = BYTE4(v56) & 1;
  LOBYTE(v49) = BYTE4(v56) & 1;
  LOBYTE(v48) = *(unsigned char *)(a12 + 392);
  sub_20A32A5B8((uint64_t)&v57, v54, a4, v55, v36, v37 & 0x101, v38, v39, v48, a12, (uint64_t)&off_26BE39DF0, *(void *)(a12 + 384), v49, v50, (uint64_t)v51, v52, v53, v54, v55,
    v56,
    v35,
    v58[0],
    v58[1],
    v58[2],
    v59);
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  swift_bridgeObjectRelease();
  uint64_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = a10;
  *(void *)(v45 + 24) = a11;
  *(unsigned char *)(v45 + 32) = v40;
  uint64_t v46 = swift_allocObject();
  *(void *)(v46 + 16) = a12;
  *(unsigned char *)(v46 + 24) = v40;
  *(void *)(v46 + 32) = v42;
  *(void *)(v46 + 40) = v44;
  sub_20A1C5AF4(a10);
  swift_retain();
  swift_unknownObjectRetain();
  sub_20A32BB58();
  swift_unknownObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_20A36C810(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 184);
  uint64_t v17 = *(void *)(a1 + 176);
  uint64_t v3 = *(void *)(a1 + 192);
  uint64_t v4 = *(void *)(a1 + 200);
  uint64_t v5 = *(void *)(a1 + 208);
  uint64_t v6 = *(void *)(a1 + 216);
  uint64_t v7 = *(void *)(a1 + 224);
  uint64_t v8 = *(void *)(a1 + 232);
  long long v15 = *(_OWORD *)(a1 + 256);
  long long v16 = *(_OWORD *)(a1 + 240);
  long long v14 = *(_OWORD *)(a1 + 272);
  long long v12 = *(_OWORD *)(a1 + 304);
  long long v13 = *(_OWORD *)(a1 + 288);
  long long v11 = *(_OWORD *)(a1 + 320);
  unint64_t v9 = *(void *)(a1 + 336);
  sub_20A36C2C4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160));
  sub_20A36C2C4(v17, v2, v3, v4, v5, v6, v7, v8, v16, *((uint64_t *)&v16 + 1), v15, *((uint64_t *)&v15 + 1), v14, *((uint64_t *)&v14 + 1), v13, *((uint64_t *)&v13 + 1), v12, *((uint64_t *)&v12 + 1), v11,
    *((uint64_t *)&v11 + 1),
    v9);
  return a1;
}

uint64_t sub_20A36C928(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,unint64_t a21)
{
  if (a21 >> 1 != 0xFFFFFFFF)
  {
    return sub_20A1E5BB8(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21);
  }
  return result;
}

uint64_t sub_20A36C99C()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_20A36C9DC(uint64_t (*a1)(void), uint64_t a2)
{
  return sub_20A32E7A0(a1, a2, *(void (**)(void, uint64_t (*)(void), uint64_t))(v2 + 16), *(void *)(v2 + 24), *(unsigned char *)(v2 + 32));
}

uint64_t sub_20A36C9E8()
{
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_20A36CA28()
{
  return sub_20A32E838(*(void *)(v0 + 16), *(unsigned __int8 *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_20A36CA38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScrubberStore.ViewModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A36CA9C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ScrubberStore.ViewModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

double sub_20A36CAF8(_OWORD *a1)
{
  double result = 0.0;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_20A36CB10(__n128 *a1)
{
  OUTLINED_FUNCTION_2_51(a1);
  OUTLINED_FUNCTION_12_20();
  v2();
  return v1;
}

uint64_t sub_20A36CB48(__n128 *a1)
{
  OUTLINED_FUNCTION_2_51(a1);
  OUTLINED_FUNCTION_12_20();
  v2();
  return v1;
}

double sub_20A36CB88(uint64_t a1)
{
  bzero((void *)a1, 0xA0uLL);
  *(void *)&double result = 0x1FFFFFFFELL;
  *(_OWORD *)(a1 + 160) = xmmword_20A391790;
  *(unsigned char *)(a1 + 176) = 0;
  return result;
}

uint64_t sub_20A36CBC0()
{
  return sub_20A3697D4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_20A36CBDC()
{
  swift_release();
  sub_20A1F5470(*(void *)(v0 + 56), *(void *)(v0 + 64), *(unsigned char *)(v0 + 72));
  return MEMORY[0x270FA0238](v0, 73, 7);
}

uint64_t sub_20A36CC20(uint64_t *a1)
{
  return sub_20A3699CC(a1, *(void *)(v1 + 16), *(double *)(v1 + 24), *(double *)(v1 + 32), *(double *)(v1 + 40), *(double *)(v1 + 48));
}

uint64_t sub_20A36CC4C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC392C0);
  OUTLINED_FUNCTION_3_1(v1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = sub_20A38A2B0();
  if (!__swift_getEnumTagSinglePayload(v0 + v4, 1, v7))
  {
    OUTLINED_FUNCTION_5_1();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0 + v4, v7);
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, ((v6 + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | 7);
}

void sub_20A36CD34(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC392C0);
  OUTLINED_FUNCTION_3_1(v7);
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  unint64_t v12 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = *(void *)(v3 + ((*(void *)(v11 + 64) + v12 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_20A369B3C(a1, a2, a3, v3 + v12, v13);
}

uint64_t sub_20A36CDC8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20A36CE00(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(v1 + 16))(*a1, a1[1], a1[2]);
}

uint64_t sub_20A36CE3C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_20A36CE84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC3D058);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A36CEEC()
{
  if (*(void *)(v0 + 24) != 1) {
    swift_bridgeObjectRelease();
  }
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20A36CF2C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_20A369AF4(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_20A36CF48()
{
  return sub_20A36BA60(*(void *)(v0 + 16));
}

uint64_t sub_20A36CF64()
{
  sub_20A1F5470(*(void *)(v0 + 48), *(void *)(v0 + 56), *(unsigned char *)(v0 + 64));
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_20A36CFA8(uint64_t *a1, uint64_t a2)
{
  return sub_20A36BAD4(a1, a2, *(double *)(v2 + 16), *(double *)(v2 + 24), *(double *)(v2 + 32), *(double *)(v2 + 40), *(double *)(v2 + 72), *(void *)(v2 + 48), *(void *)(v2 + 56), *(unsigned __int8 *)(v2 + 64), *(unsigned char *)(v2 + 65), *(void *)(v2 + 80));
}

uint64_t sub_20A36CFDC()
{
  return sub_20A36BC10(*(void *)(v0 + 16), *(void *)(v0 + 56), *(void *)(v0 + 64), *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
}

uint64_t sub_20A36D00C()
{
  swift_release();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 56) != 1) {
    swift_bridgeObjectRelease();
  }
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_20A36D05C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_20A36BCB8(a1, *(unsigned char *)(v2 + 24), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56), a2);
}

uint64_t destroy for WeatherMapOverlayMetadataDescription(uint64_t *a1)
{
  sub_20A1D8C10(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18],
    a1[19],
    a1[20]);
  uint64_t result = a1[23];
  if (result != 1)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for WeatherMapOverlayMetadataDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 48);
  uint64_t v15 = *(void *)(a2 + 64);
  uint64_t v16 = *(void *)(a2 + 72);
  uint64_t v17 = *(void *)(a2 + 80);
  uint64_t v18 = *(void *)(a2 + 88);
  uint64_t v19 = *(void *)(a2 + 96);
  uint64_t v20 = *(void *)(a2 + 104);
  uint64_t v21 = *(void *)(a2 + 112);
  uint64_t v22 = *(void *)(a2 + 120);
  uint64_t v23 = *(void *)(a2 + 128);
  uint64_t v24 = *(void *)(a2 + 136);
  uint64_t v25 = *(void *)(a2 + 144);
  uint64_t v26 = *(void *)(a2 + 152);
  uint64_t v27 = *(void *)(a2 + 160);
  uint64_t v28 = *(void *)(a2 + 168);
  uint64_t v8 = *(void *)a2;
  uint64_t v9 = *(void *)(a2 + 8);
  uint64_t v10 = *(void *)(a2 + 16);
  uint64_t v11 = *(void *)(a2 + 56);
  sub_20A1E5BB8(*(void *)a2, v9, v10, v4, v5, v6, v7, v11, *(void *)(a2 + 64), *(void *)(a2 + 72), *(void *)(a2 + 80), *(void *)(a2 + 88), *(void *)(a2 + 96), *(void *)(a2 + 104), *(void *)(a2 + 112), *(void *)(a2 + 120), *(void *)(a2 + 128), *(void *)(a2 + 136), *(void *)(a2 + 144),
    *(void *)(a2 + 152),
    *(void *)(a2 + 160));
  *(void *)a1 = v8;
  *(void *)(a1 + 8) = v9;
  *(void *)(a1 + 16) = v10;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v15;
  *(void *)(a1 + 72) = v16;
  *(void *)(a1 + 80) = v17;
  *(void *)(a1 + 88) = v18;
  *(void *)(a1 + 96) = v19;
  *(void *)(a1 + 104) = v20;
  *(void *)(a1 + 112) = v21;
  *(void *)(a1 + 120) = v22;
  *(void *)(a1 + 128) = v23;
  *(void *)(a1 + 136) = v24;
  *(void *)(a1 + 144) = v25;
  *(void *)(a1 + 152) = v26;
  *(void *)(a1 + 160) = v27;
  *(void *)(a1 + 168) = v28;
  unint64_t v12 = (_OWORD *)(a2 + 176);
  uint64_t v13 = *(void *)(a2 + 184);
  if (v13 == 1)
  {
    *(_OWORD *)(a1 + 176) = *v12;
  }
  else
  {
    *(void *)(a1 + 176) = *(void *)v12;
    *(void *)(a1 + 184) = v13;
    swift_bridgeObjectRetain();
  }
  *(_WORD *)(a1 + 192) = *(_WORD *)(a2 + 192);
  return a1;
}

uint64_t assignWithCopy for WeatherMapOverlayMetadataDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a2 + 56);
  uint64_t v29 = *(void *)(a2 + 64);
  uint64_t v30 = *(void *)(a2 + 72);
  uint64_t v31 = *(void *)(a2 + 80);
  uint64_t v32 = *(void *)(a2 + 88);
  uint64_t v33 = *(void *)(a2 + 96);
  uint64_t v34 = *(void *)(a2 + 104);
  uint64_t v35 = *(void *)(a2 + 112);
  uint64_t v36 = *(void *)(a2 + 120);
  uint64_t v37 = *(void *)(a2 + 128);
  uint64_t v38 = *(void *)(a2 + 136);
  uint64_t v39 = *(void *)(a2 + 144);
  uint64_t v40 = *(void *)(a2 + 152);
  unint64_t v41 = *(void *)(a2 + 160);
  uint64_t v42 = *(void *)(a2 + 168);
  sub_20A1E5BB8(*(void *)a2, v5, v6, v7, v8, v9, v10, v11, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39,
    v40,
    v41);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  long long v20 = *(_OWORD *)(a1 + 64);
  long long v21 = *(_OWORD *)(a1 + 80);
  *(void *)(a1 + 64) = v29;
  *(void *)(a1 + 72) = v30;
  *(void *)(a1 + 80) = v31;
  *(void *)(a1 + 88) = v32;
  long long v22 = *(_OWORD *)(a1 + 96);
  long long v23 = *(_OWORD *)(a1 + 112);
  *(void *)(a1 + 96) = v33;
  *(void *)(a1 + 104) = v34;
  *(void *)(a1 + 112) = v35;
  *(void *)(a1 + 120) = v36;
  long long v24 = *(_OWORD *)(a1 + 128);
  long long v25 = *(_OWORD *)(a1 + 144);
  *(void *)(a1 + 128) = v37;
  *(void *)(a1 + 136) = v38;
  *(void *)(a1 + 144) = v39;
  *(void *)(a1 + 152) = v40;
  unint64_t v26 = *(void *)(a1 + 160);
  *(void *)(a1 + 160) = v41;
  *(void *)(a1 + 168) = v42;
  sub_20A1D8C10(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, *((uint64_t *)&v23 + 1), v24, *((uint64_t *)&v24 + 1), v25,
    *((uint64_t *)&v25 + 1),
    v26);
  uint64_t v27 = *(void *)(a2 + 184);
  if (*(void *)(a1 + 184) != 1)
  {
    if (v27 != 1)
    {
      *(void *)(a1 + 176) = *(void *)(a2 + 176);
      *(void *)(a1 + 184) = *(void *)(a2 + 184);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    sub_20A1EF728(a1 + 176);
    goto LABEL_6;
  }
  if (v27 == 1)
  {
LABEL_6:
    *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
    goto LABEL_8;
  }
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
LABEL_8:
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(unsigned char *)(a1 + 193) = *(unsigned char *)(a2 + 193);
  return a1;
}

void *__swift_memcpy194_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xC2uLL);
}

uint64_t assignWithTake for WeatherMapOverlayMetadataDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  long long v12 = *(_OWORD *)(a1 + 64);
  long long v13 = *(_OWORD *)(a1 + 80);
  long long v14 = *(_OWORD *)(a1 + 96);
  long long v15 = *(_OWORD *)(a1 + 112);
  long long v16 = *(_OWORD *)(a1 + 128);
  long long v17 = *(_OWORD *)(a1 + 144);
  unint64_t v18 = *(void *)(a1 + 160);
  long long v19 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v19;
  long long v20 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v20;
  long long v21 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v21;
  long long v22 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v22;
  long long v23 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v23;
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  sub_20A1D8C10(v4, v5, v6, v7, v8, v9, v10, v11, v12, *((uint64_t *)&v12 + 1), v13, *((uint64_t *)&v13 + 1), v14, *((uint64_t *)&v14 + 1), v15, *((uint64_t *)&v15 + 1), v16, *((uint64_t *)&v16 + 1), v17,
    *((uint64_t *)&v17 + 1),
    v18);
  long long v24 = (void *)(a2 + 176);
  if (*(void *)(a1 + 184) != 1)
  {
    uint64_t v25 = *(void *)(a2 + 184);
    if (v25 != 1)
    {
      *(void *)(a1 + 176) = *v24;
      *(void *)(a1 + 184) = v25;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_20A1EF728(a1 + 176);
  }
  *(_OWORD *)(a1 + 176) = *(_OWORD *)v24;
LABEL_6:
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(unsigned char *)(a1 + 193) = *(unsigned char *)(a2 + 193);
  return a1;
}

uint64_t getEnumTagSinglePayload for WeatherMapOverlayMetadataDescription(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 194))
    {
      int v3 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *(void *)(a1 + 160) >> 1;
      if (v2 > 0x80000000) {
        int v3 = ~v2;
      }
      else {
        int v3 = -1;
      }
    }
  }
  else
  {
    int v3 = -1;
  }
  return (v3 + 1);
}

void storeEnumTagSinglePayload for WeatherMapOverlayMetadataDescription(char *a1, int a2, int a3)
{
  if (a2 < 0)
  {
    *((void *)a1 + 23) = 0;
    *(_OWORD *)(a1 + 168) = 0u;
    *(_OWORD *)(a1 + 152) = 0u;
    *(_OWORD *)(a1 + 136) = 0u;
    *(_OWORD *)(a1 + 120) = 0u;
    *(_OWORD *)(a1 + 104) = 0u;
    *(_OWORD *)(a1 + 88) = 0u;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *((_WORD *)a1 + 96) = 0;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      a1[194] = 1;
    }
  }
  else
  {
    if (a3 < 0) {
      a1[194] = 0;
    }
    if (a2)
    {
      uint64_t v4 = 2 * -a2;
      bzero(a1, 0xA0uLL);
      *((void *)a1 + 20) = v4;
      *((void *)a1 + 21) = 0;
    }
  }
}

ValueMetadata *type metadata accessor for WeatherMapOverlayMetadataDescription()
{
  return &type metadata for WeatherMapOverlayMetadataDescription;
}

uint64_t OUTLINED_FUNCTION_7_36()
{
  return v0;
}

void sub_20A36D6A8(uint64_t a1, uint64_t a2)
{
  int v3 = *(void **)(v2 + 16);
  if (v3)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = a1;
    *(void *)(v6 + 24) = a2;
    v8[4] = sub_20A36D9E8;
    v8[5] = v6;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 1107296256;
    v8[2] = sub_20A2E6060;
    v8[3] = &block_descriptor_28;
    uint64_t v7 = _Block_copy(v8);
    swift_retain();
    swift_release();
    objc_msgSend(v3, sel_addCompletedHandler_, v7);
    _Block_release(v7);
  }
}

uint64_t sub_20A36D790(char a1)
{
  sub_20A1BF748(v1 + 16, (uint64_t)v5);
  type metadata accessor for OverlayGeneratorContext();
  uint64_t v3 = swift_allocObject();
  sub_20A36D7E8(v5, a1);
  return v3;
}

uint64_t sub_20A36D7E8(void *a1, char a2)
{
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v6 + 8))(v8, v5, v6);
  *(void *)(v2 + 16) = objc_msgSend(*(id *)(*__swift_project_boxed_opaque_existential_1(v8, v8[3]) + 24), sel_commandBuffer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  sub_20A1BF748((uint64_t)a1, v2 + 24);
  *(unsigned char *)(v2 + 64) = a2;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v2;
}

id sub_20A36D8A8(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    swift_retain();
    sub_20A36D6A8(a1, a2);
    sub_20A1E59F0(a1);
  }
  id result = *(id *)(v2 + 16);
  if (result)
  {
    return objc_msgSend(result, sel_commit);
  }
  return result;
}

uint64_t sub_20A36D928()
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return MEMORY[0x270FA0228](v0, 65, 7);
}

uint64_t type metadata accessor for OverlayGeneratorContext()
{
  return self;
}

uint64_t type metadata accessor for OverlayGenerator()
{
  return self;
}

uint64_t sub_20A36D9B0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20A36D9E8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_26(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_26()
{
  return swift_release();
}

void *sub_20A36DA28(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    void *v4 = *a2;
    uint64_t v4 = (void *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = v7;
    *(_WORD *)(a1 + 24) = *((_WORD *)a2 + 12);
    uint64_t v8 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v8;
    uint64_t v9 = a2[7];
    uint64_t v10 = a3[6];
    uint64_t v11 = a1 + v10;
    uint64_t v12 = (uint64_t)a2 + v10;
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628978);
    long long v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
    v14(v11, v12, v13);
    v14((uint64_t)v4 + a3[7], (uint64_t)a2 + a3[7], v13);
    uint64_t v15 = a3[8];
    long long v16 = (void *)((char *)v4 + v15);
    long long v17 = (uint64_t *)((char *)a2 + v15);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676262A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_20A38ACB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    }
    else
    {
      *long long v16 = *v17;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v4;
}

uint64_t sub_20A36DC04(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628978);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(a1 + a2[7], v5);
  uint64_t v7 = a1 + a2[8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676262A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_20A38ACB0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    return v9(v7, v8);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_20A36DD4C(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  uint64_t v9 = a3[6];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628978);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
  v13(v10, v11, v12);
  v13(a1 + a3[7], a2 + a3[7], v12);
  uint64_t v14 = a3[8];
  uint64_t v15 = (void *)(a1 + v14);
  long long v16 = (void *)(a2 + v14);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676262A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_20A38ACB0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  }
  else
  {
    *uint64_t v15 = *v16;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_20A36DED0(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628978);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v11(a1 + a3[7], a2 + a3[7], v10);
  if (a1 != a2)
  {
    uint64_t v12 = a3[8];
    uint64_t v13 = (void *)(a1 + v12);
    uint64_t v14 = (void *)(a2 + v12);
    sub_20A1F1460(a1 + v12, (uint64_t *)&unk_2676262A8);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676262A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_20A38ACB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    }
    else
    {
      *uint64_t v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_20A36E0B0(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  *(_OWORD *)((char *)a1 + 10) = *(_OWORD *)((char *)a2 + 10);
  long long v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628978);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v11((char *)a1 + a3[7], (char *)a2 + a3[7], v10);
  uint64_t v12 = a3[8];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676262A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v16 = sub_20A38ACB0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v13, v14, v16);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
  }
  return a1;
}

uint64_t sub_20A36E218(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628978);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(a1 + a3[7], a2 + a3[7], v10);
  if (a1 != a2)
  {
    uint64_t v12 = a3[8];
    uint64_t v13 = (void *)(a1 + v12);
    uint64_t v14 = (const void *)(a2 + v12);
    sub_20A1F1460(a1 + v12, (uint64_t *)&unk_2676262A8);
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676262A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_20A38ACB0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v16 - 8) + 32))(v13, v14, v16);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_20A36E3E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A36E3F4);
}

uint64_t sub_20A36E3F4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267628978);
    OUTLINED_FUNCTION_1();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 24);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628980);
      uint64_t v11 = *(int *)(a3 + 32);
    }
    return __swift_getEnumTagSinglePayload(a1 + v11, a2, v10);
  }
}

uint64_t sub_20A36E4A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A36E4BC);
}

uint64_t sub_20A36E4BC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267628978);
    OUTLINED_FUNCTION_1();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 24);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628980);
      uint64_t v11 = *(int *)(a4 + 32);
    }
    return __swift_storeEnumTagSinglePayload(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for LocationPicker()
{
  uint64_t result = qword_26AC3B278;
  if (!qword_26AC3B278) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_20A36E5B4()
{
  sub_20A36E690();
  if (v0 <= 0x3F)
  {
    sub_20A36E6EC();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_20A36E690()
{
  if (!qword_26AC3C560)
  {
    sub_20A21FF28();
    unint64_t v0 = sub_20A38AC30();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AC3C560);
    }
  }
}

void sub_20A36E6EC()
{
  if (!qword_26AC390C0)
  {
    sub_20A38ACB0();
    unint64_t v0 = sub_20A38ABF0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AC390C0);
    }
  }
}

uint64_t sub_20A36E744()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20A36E760@<X0>(uint64_t a1@<X8>)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628988);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v6 = sub_20A38AE20();
  *((void *)v6 + 1) = 0;
  v6[16] = 0;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628990);
  sub_20A36E854(v2, (uint64_t)&v6[*(int *)(v7 + 44)]);
  uint64_t v8 = sub_20A38B170();
  char v9 = sub_20A38AF40();
  sub_20A1DC8A4((uint64_t)v6, a1, &qword_267628988);
  uint64_t v10 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267628998) + 36);
  *(void *)uint64_t v10 = v8;
  *(unsigned char *)(v10 + 8) = v9;
  return sub_20A1F1460((uint64_t)v6, &qword_267628988);
}

uint64_t sub_20A36E854@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_20A38AE70();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v75 = v4;
  uint64_t v76 = v5;
  MEMORY[0x270FA5388](v4);
  unint64_t v74 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676289A0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676289A8);
  uint64_t v68 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676289B0);
  uint64_t v71 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  uint64_t v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676289B8);
  uint64_t v70 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  uint64_t v64 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676289C0);
  uint64_t v17 = v16 - 8;
  MEMORY[0x270FA5388](v16);
  uint64_t v72 = (uint64_t)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  long long v21 = (char *)&v51 - v20;
  MEMORY[0x270FA5388](v22);
  uint64_t v67 = (uint64_t)&v51 - v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676289C8);
  MEMORY[0x270FA5388](v24 - 8);
  uint64_t v65 = (uint64_t)&v51 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (char *)&v51 - v27;
  sub_20A38B270();
  sub_20A38AC70();
  uint64_t v63 = v80;
  int v62 = v81;
  uint64_t v61 = v82;
  int v60 = v83;
  uint64_t v59 = v84;
  uint64_t v58 = v85;
  *(void *)uint64_t v28 = sub_20A38ADF0();
  *((void *)v28 + 1) = 0x4020000000000000;
  v28[16] = 0;
  uint64_t v29 = (uint64_t)&v28[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2676289D0) + 44)];
  int v51 = (unsigned char *)a1;
  sub_20A36F10C(a1, v29);
  sub_20A38B270();
  sub_20A38AC70();
  uint64_t v57 = v86;
  int v56 = v87;
  uint64_t v55 = v88;
  int v54 = v89;
  uint64_t v53 = v90;
  uint64_t v52 = v91;
  unint64_t v77 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676289D8);
  sub_20A373F8C();
  sub_20A38AFE0();
  unint64_t v30 = sub_20A375624((uint64_t)&unk_267628A08);
  sub_20A38B0B0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_20A38B170();
  uint64_t v78 = v7;
  unint64_t v79 = v30;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v32 = v66;
  sub_20A38B0D0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v12, v32);
  uint64_t v33 = v74;
  sub_20A38AE60();
  uint64_t v78 = v32;
  unint64_t v79 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v34 = v64;
  uint64_t v35 = v69;
  uint64_t v36 = v75;
  sub_20A38B140();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v33, v36);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v14, v35);
  uint64_t KeyPath = swift_getKeyPath();
  if (((*v51 - 3) & 0xFD) != 0) {
    double v38 = 44.0;
  }
  else {
    double v38 = 60.0;
  }
  uint64_t v39 = v70;
  uint64_t v40 = v73;
  (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v21, v34, v73);
  unint64_t v41 = &v21[*(int *)(v17 + 44)];
  *(void *)unint64_t v41 = KeyPath;
  *((double *)v41 + 1) = v38;
  (*(void (**)(char *, uint64_t))(v39 + 8))(v34, v40);
  uint64_t v42 = (uint64_t)v21;
  uint64_t v43 = v67;
  sub_20A3754C8(v42, v67, &qword_2676289C0);
  uint64_t v44 = v65;
  sub_20A1DC8A4((uint64_t)v28, v65, &qword_2676289C8);
  uint64_t v45 = v72;
  sub_20A1DC8A4(v43, v72, &qword_2676289C0);
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  *(void *)(a2 + 16) = v63;
  *(unsigned char *)(a2 + 24) = v62;
  *(void *)(a2 + 32) = v61;
  *(unsigned char *)(a2 + 40) = v60;
  uint64_t v46 = v58;
  *(void *)(a2 + 48) = v59;
  *(void *)(a2 + 56) = v46;
  uint64_t v47 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267628A10);
  sub_20A1DC8A4(v44, a2 + v47[12], &qword_2676289C8);
  uint64_t v48 = a2 + v47[16];
  *(void *)uint64_t v48 = 0;
  *(unsigned char *)(v48 + 8) = 1;
  *(void *)(v48 + 16) = v57;
  *(unsigned char *)(v48 + 24) = v56;
  *(void *)(v48 + 32) = v55;
  *(unsigned char *)(v48 + 40) = v54;
  uint64_t v49 = v52;
  *(void *)(v48 + 48) = v53;
  *(void *)(v48 + 56) = v49;
  sub_20A1DC8A4(v45, a2 + v47[20], &qword_2676289C0);
  sub_20A1F1460(v43, &qword_2676289C0);
  sub_20A1F1460((uint64_t)v28, &qword_2676289C8);
  sub_20A1F1460(v45, &qword_2676289C0);
  return sub_20A1F1460(v44, &qword_2676289C8);
}

uint64_t sub_20A36F10C@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628C30);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v36 = (uint64_t)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v30 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628C38);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628C40);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628C48);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v30 - v19;
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v30 - v22;
  sub_20A38B270();
  sub_20A38AC70();
  uint64_t v35 = v37;
  int v34 = v38;
  uint64_t v33 = v39;
  int v32 = v40;
  uint64_t v31 = v41;
  uint64_t v30 = v42;
  sub_20A36F544((uint64_t)v11);
  sub_20A38B270();
  sub_20A38ACD0();
  sub_20A1DC8A4((uint64_t)v11, (uint64_t)v14, &qword_267628C38);
  memcpy(&v14[*(int *)(v12 + 36)], __src, 0x70uLL);
  sub_20A1F1460((uint64_t)v11, &qword_267628C38);
  sub_20A375290();
  sub_20A38B110();
  sub_20A1F1460((uint64_t)v14, &qword_267628C40);
  sub_20A3754C8((uint64_t)v20, (uint64_t)v23, &qword_267628C48);
  *(void *)uint64_t v8 = sub_20A38AE20();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628C90);
  sub_20A36FBC0(a1, &v8[*(int *)(v24 + 44)]);
  sub_20A1DC8A4((uint64_t)v23, (uint64_t)v17, &qword_267628C48);
  uint64_t v25 = v36;
  sub_20A1DC8A4((uint64_t)v8, v36, &qword_267628C30);
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  *(void *)(a2 + 16) = v35;
  *(unsigned char *)(a2 + 24) = v34;
  *(void *)(a2 + 32) = v33;
  *(unsigned char *)(a2 + 40) = v32;
  uint64_t v26 = v30;
  *(void *)(a2 + 48) = v31;
  *(void *)(a2 + 56) = v26;
  uint64_t v27 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267628C98);
  sub_20A1DC8A4((uint64_t)v17, a2 + v27[12], &qword_267628C48);
  sub_20A1DC8A4(v25, a2 + v27[16], &qword_267628C30);
  uint64_t v28 = a2 + v27[20];
  *(void *)uint64_t v28 = 0;
  *(unsigned char *)(v28 + 8) = 1;
  sub_20A1F1460((uint64_t)v8, &qword_267628C30);
  sub_20A1F1460((uint64_t)v23, &qword_267628C48);
  sub_20A1F1460(v25, &qword_267628C30);
  return sub_20A1F1460((uint64_t)v17, &qword_267628C48);
}

uint64_t sub_20A36F544@<X0>(uint64_t a1@<X8>)
{
  uint64_t v40 = a1;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628C88);
  MEMORY[0x270FA5388](v32);
  uint64_t v28 = (uint64_t)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628CC8);
  MEMORY[0x270FA5388](v38);
  uint64_t v39 = (uint64_t)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628CD0);
  MEMORY[0x270FA5388](v29);
  uint64_t v30 = (uint64_t)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628C68);
  MEMORY[0x270FA5388](v37);
  uint64_t v31 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628B98);
  MEMORY[0x270FA5388](v36);
  uint64_t v6 = (uint64_t *)((char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_20A38B1D0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628C78);
  MEMORY[0x270FA5388](v11);
  int v34 = (uint64_t *)((char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v33 = sub_20A38B1B0();
  uint64_t v13 = sub_20A38AF90();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v15 = sub_20A38B180();
  uint64_t v16 = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F1B530], v7);
  uint64_t v17 = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)v6 + *(int *)(v36 + 28), v10, v7);
  *uint64_t v6 = v17;
  uint64_t v36 = v11;
  uint64_t v18 = *(int *)(v11 + 36);
  uint64_t v19 = v34;
  sub_20A1DC8A4((uint64_t)v6, (uint64_t)v34 + v18, &qword_267628B98);
  *uint64_t v19 = v33;
  v19[1] = KeyPath;
  v19[2] = v13;
  v19[3] = v16;
  v19[4] = v15;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_20A1F1460((uint64_t)v6, &qword_267628B98);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  int v20 = *v35;
  if (v20 == 4)
  {
    uint64_t v21 = v28;
    sub_20A1DC8A4((uint64_t)v19, v28, &qword_267628C78);
    *(_OWORD *)(v21 + *(int *)(v32 + 36)) = xmmword_20A39BF50;
    sub_20A1DC8A4(v21, v30, &qword_267628C88);
    swift_storeEnumTagMultiPayload();
    sub_20A3753F8();
    sub_20A375498();
    uint64_t v22 = (uint64_t)v31;
    sub_20A38AE50();
    sub_20A1DC8A4(v22, v39, &qword_267628C68);
    swift_storeEnumTagMultiPayload();
    sub_20A3753BC();
    sub_20A38AE50();
    sub_20A1F1460(v22, &qword_267628C68);
    uint64_t v23 = v21;
    uint64_t v24 = &qword_267628C88;
LABEL_6:
    sub_20A1F1460(v23, v24);
    return sub_20A1F1460((uint64_t)v19, &qword_267628C78);
  }
  if (v20 != 5)
  {
    sub_20A1DC8A4((uint64_t)v19, v30, &qword_267628C78);
    swift_storeEnumTagMultiPayload();
    sub_20A3753F8();
    sub_20A375498();
    uint64_t v25 = (uint64_t)v31;
    sub_20A38AE50();
    sub_20A1DC8A4(v25, v39, &qword_267628C68);
    swift_storeEnumTagMultiPayload();
    sub_20A3753BC();
    sub_20A38AE50();
    uint64_t v23 = v25;
    uint64_t v24 = &qword_267628C68;
    goto LABEL_6;
  }
  sub_20A1DC8A4((uint64_t)v19, v39, &qword_267628C78);
  swift_storeEnumTagMultiPayload();
  sub_20A3753BC();
  sub_20A3753F8();
  sub_20A38AE50();
  return sub_20A1F1460((uint64_t)v19, &qword_267628C78);
}

uint64_t sub_20A36FBC0@<X0>(unint64_t a1@<X0>, char *a2@<X8>)
{
  v93 = a2;
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628CA0);
  MEMORY[0x270FA5388](v95);
  uint64_t v4 = (char *)&v78 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628CA8);
  uint64_t v98 = *(void *)(v5 - 8);
  uint64_t v99 = v5;
  MEMORY[0x270FA5388](v5);
  v92 = (char *)&v78 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v91 = (char *)&v78 - v8;
  MEMORY[0x270FA5388](v9);
  v97 = (char *)&v78 - v10;
  MEMORY[0x270FA5388](v11);
  v96 = (char *)&v78 - v12;
  unint64_t v94 = a1;
  uint64_t v13 = sub_20A3703F8();
  uint64_t v15 = v14;
  char v17 = v16 & 1;
  sub_20A38AF50();
  uint64_t v18 = sub_20A38B050();
  uint64_t v20 = v19;
  char v22 = v21;
  swift_release();
  sub_20A277868(v13, v15, v17);
  swift_bridgeObjectRelease();
  sub_20A38AF70();
  uint64_t v23 = sub_20A38AFF0();
  uint64_t v25 = v24;
  char v27 = v26 & 1;
  sub_20A277868(v18, v20, v22 & 1);
  swift_bridgeObjectRelease();
  sub_20A38B180();
  uint64_t v28 = sub_20A38B040();
  uint64_t v30 = v29;
  LOBYTE(v18) = v31;
  uint64_t v33 = v32;
  swift_release();
  sub_20A277868(v23, v25, v27);
  swift_bridgeObjectRelease();
  uint64_t v105 = v28;
  uint64_t v106 = v30;
  LOBYTE(v107) = v18 & 1;
  uint64_t v108 = v33;
  uint64_t v34 = *MEMORY[0x263F18CD8];
  uint64_t v35 = sub_20A38ACB0();
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v36 + 104);
  uint64_t v38 = v36 + 104;
  v37(v4, v34, v35);
  unint64_t v39 = sub_20A375518((uint64_t)&unk_267628CB0);
  v100 = v4;
  uint64_t result = sub_20A38B5C0();
  if (result)
  {
    unsigned int v90 = v34;
    unint64_t v41 = sub_20A375624((uint64_t)&unk_267628CB8);
    unsigned __int8 v89 = v37;
    uint64_t v42 = v97;
    uint64_t v43 = (uint64_t)v100;
    unint64_t v87 = v41;
    sub_20A38B0E0();
    sub_20A1F1460(v43, &qword_267628CA0);
    sub_20A277868(v105, v106, v107);
    swift_bridgeObjectRelease();
    uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v98 + 32);
    uint64_t v86 = v98 + 32;
    uint64_t v85 = v44;
    v44(v96, v42, v99);
    type metadata accessor for LocationPicker();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267628978);
    sub_20A38AC20();
    sub_20A38B270();
    sub_20A38AC70();
    uint64_t v84 = v105;
    int v83 = v106;
    uint64_t v82 = v107;
    int v81 = v108;
    uint64_t v80 = v109;
    uint64_t v79 = v110;
    sub_20A38AE00();
    uint64_t v45 = sub_20A38B060();
    uint64_t v47 = v46;
    unint64_t v94 = v39;
    LOBYTE(v43) = v48 & 1;
    sub_20A38AFB0();
    uint64_t v49 = sub_20A38B050();
    uint64_t v88 = v38;
    uint64_t v51 = v50;
    char v53 = v52;
    swift_release();
    sub_20A277868(v45, v47, v43);
    swift_bridgeObjectRelease();
    sub_20A38AF80();
    uint64_t v54 = sub_20A38AFF0();
    uint64_t v56 = v55;
    LOBYTE(v43) = v57 & 1;
    sub_20A277868(v49, v51, v53 & 1);
    swift_bridgeObjectRelease();
    sub_20A38B190();
    uint64_t v58 = sub_20A38B040();
    uint64_t v60 = v59;
    char v62 = v61;
    uint64_t v64 = v63;
    swift_release();
    sub_20A277868(v54, v56, v43);
    swift_bridgeObjectRelease();
    uint64_t v101 = v58;
    uint64_t v102 = v60;
    char v103 = v62 & 1;
    uint64_t v104 = v64;
    v89(v100, v90, v35);
    uint64_t result = sub_20A38B5C0();
    if (result)
    {
      uint64_t v65 = v91;
      uint64_t v66 = (uint64_t)v100;
      sub_20A38B0E0();
      sub_20A1F1460(v66, &qword_267628CA0);
      sub_20A277868(v101, v102, v103);
      swift_bridgeObjectRelease();
      uint64_t v67 = v97;
      uint64_t v68 = v99;
      v85(v97, v65, v99);
      uint64_t v69 = v98;
      uint64_t v70 = *(void (**)(char *, char *, uint64_t))(v98 + 16);
      uint64_t v71 = v96;
      v70(v65, v96, v68);
      uint64_t v72 = v92;
      v70(v92, v67, v68);
      uint64_t v73 = v93;
      v70(v93, v65, v68);
      uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628CC0);
      uint64_t v75 = &v73[*(int *)(v74 + 48)];
      *(void *)uint64_t v75 = 0;
      v75[8] = 1;
      *((void *)v75 + 2) = v84;
      v75[24] = v83;
      *((void *)v75 + 4) = v82;
      v75[40] = v81;
      uint64_t v76 = v79;
      *((void *)v75 + 6) = v80;
      *((void *)v75 + 7) = v76;
      v70(&v73[*(int *)(v74 + 64)], v72, v68);
      unint64_t v77 = *(void (**)(char *, uint64_t))(v69 + 8);
      v77(v67, v68);
      v77(v71, v68);
      v77(v72, v68);
      return ((uint64_t (*)(char *, uint64_t))v77)(v65, v68);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_20A3703F8()
{
  return sub_20A38B060();
}

uint64_t sub_20A37058C()
{
  return sub_20A38B260();
}

uint64_t sub_20A3705F4()
{
  uint64_t v0 = type metadata accessor for LocationPicker();
  MEMORY[0x270FA5388](v0 - 8);
  sub_20A3742EC();
  swift_allocObject();
  sub_20A374594();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267627338);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267628A00);
  sub_20A375624((uint64_t)&unk_267628A18);
  sub_20A375624((uint64_t)&unk_2676289F8);
  sub_20A375518((uint64_t)&unk_267628A20);
  return sub_20A38B250();
}

uint64_t sub_20A370800()
{
  uint64_t v0 = type metadata accessor for LocationPickerViewModel.Row();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = type metadata accessor for LocationPicker();
  MEMORY[0x270FA5388](v1 - 8);
  sub_20A3742EC();
  sub_20A3742EC();
  swift_allocObject();
  sub_20A374594();
  sub_20A374594();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267628A28);
  sub_20A374690();
  return sub_20A38B200();
}

uint64_t sub_20A370A28()
{
  return sub_20A38B220();
}

uint64_t sub_20A370A88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628A40);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v8 = sub_20A38ADF0();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628A58);
  sub_20A370B8C(a1, a2, (uint64_t)&v8[*(int *)(v9 + 44)]);
  uint64_t v10 = sub_20A38B160();
  uint64_t KeyPath = swift_getKeyPath();
  sub_20A1DC8A4((uint64_t)v8, a3, &qword_267628A40);
  uint64_t v12 = (uint64_t *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267628A28) + 36));
  *uint64_t v12 = KeyPath;
  v12[1] = v10;
  return sub_20A1F1460((uint64_t)v8, &qword_267628A40);
}

uint64_t sub_20A370B8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v246 = a2;
  uint64_t v238 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628A60);
  MEMORY[0x270FA5388](v238);
  v227 = (char *)&v215 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628A68);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v224 = (uint64_t)&v215 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v226 = (uint64_t)&v215 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628A70);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v223 = (uint64_t)&v215 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v225 = (char *)&v215 - v13;
  uint64_t v233 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628A78);
  MEMORY[0x270FA5388](v233);
  uint64_t v235 = (uint64_t)&v215 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v234 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628A80);
  MEMORY[0x270FA5388](v234);
  v222 = (uint64_t *)((char *)&v215 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = sub_20A38ACB0();
  uint64_t v231 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v215 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v242 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628A88);
  MEMORY[0x270FA5388](v242);
  v236 = (char *)&v215 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v240 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628A90);
  MEMORY[0x270FA5388](v240);
  v241 = (uint64_t *)((char *)&v215 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v251 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628A98);
  MEMORY[0x270FA5388](v251);
  v243 = (char *)&v215 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v249 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628AA0);
  MEMORY[0x270FA5388](v249);
  uint64_t v250 = (uint64_t)&v215 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v244 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628AA8);
  MEMORY[0x270FA5388](v244);
  uint64_t v24 = (char *)&v215 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v245 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628AB0);
  MEMORY[0x270FA5388](v245);
  v237 = (uint64_t *)((char *)&v215 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v248 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628AB8);
  MEMORY[0x270FA5388](v248);
  char v27 = (char *)&v215 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v229 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628AC0);
  MEMORY[0x270FA5388](v229);
  v230 = (uint64_t *)((char *)&v215 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628AC8);
  MEMORY[0x270FA5388](v29 - 8);
  v220 = (uint64_t *)((char *)&v215 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v228 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628AD0);
  MEMORY[0x270FA5388](v228);
  uint64_t v219 = (uint64_t)&v215 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v32);
  uint64_t v221 = (uint64_t)&v215 - v33;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628AD8);
  MEMORY[0x270FA5388](v34 - 8);
  uint64_t v232 = (uint64_t)&v215 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v36);
  uint64_t v239 = (uint64_t)&v215 - v37;
  uint64_t v38 = a1 + *(int *)(type metadata accessor for LocationPickerViewModel.Row() + 20);
  unint64_t v247 = *(void *)v38;
  uint64_t v39 = *(void *)(v38 + 8);
  uint64_t v40 = *(void *)(v38 + 16);
  uint64_t v41 = *(void *)(v38 + 24);
  uint64_t v42 = *(void *)(v38 + 48);
  unint64_t v43 = *(void *)(v38 + 56);
  uint64_t v44 = *(unsigned __int8 *)(v38 + 64);
  uint64_t v252 = a3;
  switch(v44)
  {
    case 1:
      v218 = v24;
      v243 = v27;
      uint64_t v55 = v41;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v242 = sub_20A38AE20();
      sub_20A373ADC(v247, (uint64_t)v256);
      swift_bridgeObjectRelease();
      v257[136] = 1;
      memcpy(&v257[7], v256, 0x80uLL);
      LODWORD(v247) = 1;
      memcpy(v258, v257, 0x87uLL);
      if (v55)
      {
        uint64_t v56 = (uint64_t *)sub_20A38B1B0();
        uint64_t v57 = sub_20A38AF60();
        uint64_t KeyPath = swift_getKeyPath();
        uint64_t v59 = sub_20A38B150();
        uint64_t v60 = swift_getKeyPath();
        v241 = v56;
        v263[0] = (uint64_t)v56;
        v263[1] = KeyPath;
        v263[2] = v57;
        v263[3] = v60;
        v263[4] = v59;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        sub_20A372D34(v263, (uint64_t)v261);
        uint64_t v61 = v261[0];
        uint64_t v62 = v261[1];
        uint64_t v63 = v261[2];
        uint64_t v64 = (void *)v261[3];
        uint64_t v246 = v261[4];
        char v65 = v262;
        swift_release();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_release_n();
      }
      else
      {
        *(void *)v260 = 11565;
        *(void *)&v260[8] = 0xE200000000000000;
        sub_20A230CD8();
        uint64_t v154 = sub_20A38B070();
        uint64_t v156 = v155;
        char v158 = v157 & 1;
        sub_20A38AF60();
        uint64_t v159 = sub_20A38B050();
        uint64_t v161 = v160;
        char v163 = v162;
        swift_release();
        char v164 = v163 & 1;
        sub_20A277868(v154, v156, v158);
        swift_bridgeObjectRelease();
        sub_20A38B180();
        uint64_t v165 = sub_20A38B040();
        uint64_t v167 = v166;
        char v169 = v168;
        uint64_t v171 = v170;
        swift_release();
        sub_20A277868(v159, v161, v164);
        swift_bridgeObjectRelease();
        v259[0] = v165;
        v259[1] = v167;
        v259[2] = v169 & 1;
        v259[3] = v171;
        v259[4] = 0;
        LOBYTE(v259[5]) = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_267628B48);
        sub_20A374BE0();
        sub_20A38AE50();
        uint64_t v61 = *(void *)v260;
        uint64_t v62 = *(void *)&v260[8];
        uint64_t v63 = *(void *)&v260[16];
        uint64_t v64 = *(void **)&v260[24];
        uint64_t v246 = *(void *)&v260[32];
        char v65 = v260[40];
      }
      uint64_t v172 = v242;
      v253[0] = v242;
      v253[1] = 0;
      char v173 = v247;
      LOBYTE(v253[2]) = v247;
      memcpy((char *)&v253[2] + 1, v258, 0x87uLL);
      memcpy(v259, v253, sizeof(v259));
      char v255 = 0;
      char v174 = v65;
      char v254 = v65;
      sub_20A3747DC((uint64_t)v253);
      uint64_t v175 = v246;
      sub_20A374CA0(v61, v62, v63, (uint64_t)v64, v246, v174);
      sub_20A374860((uint64_t)v256);
      sub_20A374CA0(v61, v62, v63, (uint64_t)v64, v175, v174);
      sub_20A374D40(v61, v62, v63, (uint64_t)v64, v175, v174);
      *(void *)v260 = v172;
      *(void *)&v260[8] = 0;
      v260[16] = v173;
      memcpy(&v260[17], v258, 0x87uLL);
      sub_20A3748D4((uint64_t)v260);
      v176 = v64;
      uint64_t v240 = v63;
      v241 = v64;
      uint64_t v177 = v61;
      v178 = v218;
      memcpy(v218, v259, 0x98uLL);
      v178[19] = 0x4020000000000000;
      *((unsigned char *)v178 + 160) = 0;
      v178[21] = v177;
      v178[22] = v62;
      v178[23] = v63;
      v178[24] = v176;
      v178[25] = v175;
      *((unsigned char *)v178 + 208) = v174;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267628B30);
      sub_20A375624((uint64_t)&unk_267628B20);
      sub_20A375624((uint64_t)&unk_267628B28);
      uint64_t v179 = (uint64_t)v243;
      sub_20A38AE50();
      sub_20A1DC8A4(v179, v250, &qword_267628AB8);
      swift_storeEnumTagMultiPayload();
      sub_20A374A80();
      sub_20A374B40();
      sub_20A38AE50();
      sub_20A374D40(v177, v62, v240, (uint64_t)v241, v175, v174);
      sub_20A1F1460(v179, &qword_267628AB8);
      return sub_20A374948((uint64_t)v256);
    case 2:
      uint64_t v238 = v39;
      swift_bridgeObjectRetain();
      sub_20A38A270();
      uint64_t v66 = sub_20A38A1F0();
      uint64_t v68 = v67;
      if (v66 == sub_20A38A1F0() && v68 == v69)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v71 = sub_20A38C830();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v71 & 1) == 0)
        {
          uint64_t v72 = sub_20A38A240();
          uint64_t v74 = v73;
LABEL_29:
          *(void *)v260 = v72;
          *(void *)&v260[8] = v74;
          v237 = (void *)sub_20A230CD8();
          uint64_t v111 = sub_20A38B070();
          uint64_t v113 = v112;
          char v115 = v114 & 1;
          sub_20A38AF60();
          uint64_t v116 = sub_20A38B050();
          uint64_t v118 = v117;
          char v120 = v119;
          swift_release();
          sub_20A277868(v111, v113, v115);
          swift_bridgeObjectRelease();
          sub_20A38B180();
          uint64_t v121 = sub_20A38B040();
          uint64_t v245 = v122;
          uint64_t v246 = v121;
          char v124 = v123;
          uint64_t v239 = v125;
          swift_release();
          LODWORD(v244) = v124 & 1;
          sub_20A277868(v116, v118, v120 & 1);
          swift_bridgeObjectRelease();
          *(void *)v260 = v247;
          *(void *)&v260[8] = v238;
          uint64_t v126 = sub_20A38B070();
          uint64_t v128 = v127;
          LOBYTE(v116) = v129 & 1;
          sub_20A38AF60();
          uint64_t v130 = sub_20A38B050();
          uint64_t v132 = v131;
          char v134 = v133;
          swift_release();
          sub_20A277868(v126, v128, v116);
          swift_bridgeObjectRelease();
          sub_20A38B190();
          uint64_t v135 = sub_20A38B040();
          uint64_t v137 = v136;
          LOBYTE(v118) = v138;
          uint64_t v140 = v139;
          swift_release();
          LOBYTE(v116) = v118 & 1;
          sub_20A277868(v130, v132, v134 & 1);
          swift_bridgeObjectRelease();
          LOBYTE(v130) = v244;
          v260[0] = v244;
          uint64_t v142 = v245;
          uint64_t v141 = v246;
          sub_20A374850(v246, v245, v244);
          uint64_t v143 = v239;
          swift_bridgeObjectRetain();
          sub_20A374850(v135, v137, v116);
          swift_bridgeObjectRetain();
          char v144 = v130;
          sub_20A374850(v141, v142, v130);
          swift_bridgeObjectRetain();
          sub_20A374850(v135, v137, v116);
          swift_bridgeObjectRetain();
          sub_20A277868(v135, v137, v116);
          swift_bridgeObjectRelease();
          uint64_t v145 = v141;
          uint64_t v146 = v141;
          uint64_t v147 = v142;
          sub_20A277868(v146, v142, v260[0]);
          swift_bridgeObjectRelease();
          v148 = v241;
          uint64_t *v241 = v145;
          v148[1] = v147;
          *((unsigned char *)v148 + 16) = v144;
          v148[3] = v143;
          v148[4] = 0;
          *((unsigned char *)v148 + 40) = 1;
          v148[6] = v135;
          v148[7] = v137;
          *((unsigned char *)v148 + 64) = v116;
          v148[9] = v140;
          swift_storeEnumTagMultiPayload();
          __swift_instantiateConcreteTypeFromMangledName(&qword_267628B00);
          sub_20A375624((uint64_t)&unk_267628B08);
          sub_20A3749BC();
          uint64_t v149 = (uint64_t)v243;
          sub_20A38AE50();
          sub_20A1DC8A4(v149, v250, &qword_267628A98);
          swift_storeEnumTagMultiPayload();
          sub_20A374A80();
          sub_20A374B40();
          sub_20A38AE50();
          sub_20A1F1460(v149, &qword_267628A98);
          sub_20A277868(v135, v137, v116);
          swift_bridgeObjectRelease();
          sub_20A277868(v246, v245, v244);
          return swift_bridgeObjectRelease();
        }
      }
      if (qword_26AC3C6D8 != -1) {
        swift_once();
      }
      id v109 = (id)qword_26AC41740;
      uint64_t v72 = sub_20A3891E0();
      uint64_t v74 = v110;

      goto LABEL_29;
    case 3:
      uint64_t v245 = v42;
      uint64_t v217 = v41;
      uint64_t v75 = *(void *)(v38 + 32);
      uint64_t v76 = v39;
      type metadata accessor for LocationPicker();
      uint64_t v77 = v246;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      sub_20A354D88();
      char v78 = sub_20A38ACA0();
      (*(void (**)(char *, uint64_t))(v231 + 8))(v18, v16);
      if (v78)
      {
        uint64_t v79 = sub_20A38AE20();
        uint64_t v80 = (uint64_t)v222;
        uint64_t *v222 = v79;
        *(void *)(v80 + 8) = 0;
        *(unsigned char *)(v80 + 16) = 1;
        uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628B40);
        sub_20A372E58(v77, v247, v76, v40, v217, v75, v245, (uint64_t *)(v80 + *(int *)(v81 + 44)), v43);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_20A1DC8A4(v80, v235, &qword_267628A80);
        swift_storeEnumTagMultiPayload();
        sub_20A375624((uint64_t)&unk_267628AF0);
        sub_20A375624((uint64_t)&unk_267628AF8);
        uint64_t v82 = (uint64_t)v236;
        sub_20A38AE50();
        sub_20A1F1460(v80, &qword_267628A80);
      }
      else
      {
        uint64_t v150 = v75;
        uint64_t v151 = sub_20A38AE20();
        sub_20A373ADC(v247, (uint64_t)v260);
        swift_bridgeObjectRelease();
        memcpy(v258, v260, 0x80uLL);
        v257[0] = 1;
        memcpy((char *)v253 + 7, v258, 0x80uLL);
        LODWORD(v247) = 1;
        uint64_t v216 = v40;
        if (v40)
        {
          swift_retain();
          uint64_t v152 = (uint64_t)v225;
          sub_20A373650();
          swift_release();
          uint64_t v153 = 0;
        }
        else
        {
          uint64_t v153 = 1;
          uint64_t v152 = (uint64_t)v225;
        }
        uint64_t v207 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628AE0);
        __swift_storeEnumTagSinglePayload(v152, v153, 1, v207);
        uint64_t v208 = v226;
        sub_20A373794(v217, v150, v245, v43, v226);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v209 = v223;
        sub_20A1DC8A4(v152, v223, &qword_267628A70);
        uint64_t v210 = v224;
        sub_20A1DC8A4(v208, v224, &qword_267628A68);
        v259[0] = v151;
        v259[1] = 0;
        char v211 = v247;
        LOBYTE(v259[2]) = v247;
        memcpy((char *)&v259[2] + 1, v253, 0x87uLL);
        v212 = v227;
        memcpy(v227, v259, 0x98uLL);
        v212[19] = 0;
        *((unsigned char *)v212 + 160) = 1;
        uint64_t v213 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628AE8);
        sub_20A1DC8A4(v209, (uint64_t)v212 + *(int *)(v213 + 64), &qword_267628A70);
        sub_20A1DC8A4(v210, (uint64_t)v212 + *(int *)(v213 + 80), &qword_267628A68);
        sub_20A3747DC((uint64_t)v259);
        sub_20A374860((uint64_t)v258);
        sub_20A1F1460(v210, &qword_267628A68);
        sub_20A1F1460(v209, &qword_267628A70);
        *(void *)v260 = v151;
        *(void *)&v260[8] = 0;
        v260[16] = v211;
        memcpy(&v260[17], v253, 0x87uLL);
        sub_20A3748D4((uint64_t)v260);
        sub_20A1DC8A4((uint64_t)v212, v235, &qword_267628A60);
        swift_storeEnumTagMultiPayload();
        sub_20A375624((uint64_t)&unk_267628AF0);
        sub_20A375624((uint64_t)&unk_267628AF8);
        uint64_t v82 = (uint64_t)v236;
        sub_20A38AE50();
        sub_20A1F1460((uint64_t)v212, &qword_267628A60);
        sub_20A1F1460(v208, &qword_267628A68);
        sub_20A1F1460(v152, &qword_267628A70);
        sub_20A374948((uint64_t)v258);
      }
      sub_20A1DC8A4(v82, (uint64_t)v241, &qword_267628A88);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267628B00);
      sub_20A375624((uint64_t)&unk_267628B08);
      sub_20A3749BC();
      uint64_t v214 = (uint64_t)v243;
      sub_20A38AE50();
      sub_20A1DC8A4(v214, v250, &qword_267628A98);
      swift_storeEnumTagMultiPayload();
      sub_20A374A80();
      sub_20A374B40();
      sub_20A38AE50();
      swift_release();
      sub_20A1F1460(v214, &qword_267628A98);
      return sub_20A1F1460(v82, &qword_267628A88);
    default:
      v243 = v27;
      uint64_t v45 = v39;
      uint64_t v217 = v41;
      swift_bridgeObjectRetain();
      uint64_t v238 = v45;
      swift_bridgeObjectRetain();
      sub_20A38A270();
      uint64_t v46 = sub_20A38A1F0();
      uint64_t v48 = v47;
      BOOL v50 = v46 == sub_20A38A1F0() && v48 == v49;
      v218 = v24;
      uint64_t v216 = v40;
      if (v50)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v51 = sub_20A38C830();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v51 & 1) == 0)
        {
          uint64_t v52 = sub_20A38A240();
          uint64_t v54 = v53;
          goto LABEL_22;
        }
      }
      if (qword_26AC3C6D8 != -1) {
        swift_once();
      }
      id v83 = (id)qword_26AC41740;
      uint64_t v52 = sub_20A3891E0();
      uint64_t v54 = v84;

LABEL_22:
      *(void *)v260 = v52;
      *(void *)&v260[8] = v54;
      v236 = (char *)sub_20A230CD8();
      uint64_t v85 = sub_20A38B070();
      uint64_t v87 = v86;
      char v89 = v88 & 1;
      sub_20A38AF60();
      uint64_t v90 = sub_20A38B050();
      uint64_t v92 = v91;
      char v94 = v93;
      swift_release();
      sub_20A277868(v85, v87, v89);
      swift_bridgeObjectRelease();
      sub_20A38B180();
      uint64_t v240 = sub_20A38B040();
      v241 = v95;
      LODWORD(v97) = v96;
      uint64_t v99 = v98;
      swift_release();
      sub_20A277868(v90, v92, v94 & 1);
      swift_bridgeObjectRelease();
      uint64_t v242 = v99;
      if (v238)
      {
        unint64_t v100 = v217;
        if (v217)
        {
          uint64_t v101 = sub_20A38AE10();
          uint64_t v102 = (uint64_t)v220;
          uint64_t *v220 = v101;
          *(void *)(v102 + 8) = 0;
          *(unsigned char *)(v102 + 16) = 1;
          uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628B90);
          sub_20A3727B4(v216, v100, v102 + *(int *)(v103 + 44));
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          type metadata accessor for LocationPicker();
          __swift_instantiateConcreteTypeFromMangledName(&qword_267628978);
          sub_20A38AC20();
          sub_20A38B270();
          sub_20A38AC70();
          uint64_t v104 = v219;
          sub_20A1DC8A4(v102, v219, &qword_267628AC8);
          uint64_t v105 = (_OWORD *)(v104 + *(int *)(v228 + 36));
          long long v106 = *(_OWORD *)&v260[16];
          *uint64_t v105 = *(_OWORD *)v260;
          v105[1] = v106;
          v105[2] = *(_OWORD *)&v260[32];
          sub_20A1F1460(v102, &qword_267628AC8);
          uint64_t v107 = v221;
          sub_20A3754C8(v104, v221, &qword_267628AD0);
          sub_20A1DC8A4(v107, (uint64_t)v230, &qword_267628AD0);
          swift_storeEnumTagMultiPayload();
          sub_20A374E08();
          uint64_t v108 = v239;
          sub_20A38AE50();
          sub_20A1F1460(v107, &qword_267628AD0);
          goto LABEL_37;
        }
        LODWORD(v247) = v97;
      }
      else
      {
        LODWORD(v247) = v97;
      }
      swift_bridgeObjectRelease();
      *(void *)v260 = 11565;
      *(void *)&v260[8] = 0xE200000000000000;
      uint64_t v181 = sub_20A38B070();
      uint64_t v183 = v182;
      char v185 = v184 & 1;
      sub_20A38AF60();
      uint64_t v186 = sub_20A38B050();
      uint64_t v188 = v187;
      char v190 = v189;
      swift_release();
      char v191 = v190 & 1;
      sub_20A277868(v181, v183, v185);
      swift_bridgeObjectRelease();
      sub_20A38AFC0();
      uint64_t v192 = sub_20A38B050();
      uint64_t v194 = v193;
      char v196 = v195;
      uint64_t v97 = v197;
      swift_release();
      sub_20A277868(v186, v188, v191);
      swift_bridgeObjectRelease();
      v198 = v230;
      uint64_t *v230 = v192;
      v198[1] = v194;
      *((unsigned char *)v198 + 16) = v196 & 1;
      v198[3] = v97;
      swift_storeEnumTagMultiPayload();
      sub_20A374E08();
      uint64_t v108 = v239;
      sub_20A38AE50();
      LOBYTE(v97) = v247;
LABEL_37:
      uint64_t v199 = v232;
      sub_20A1DC8A4(v108, v232, &qword_267628AD8);
      uint64_t v200 = (uint64_t)v237;
      uint64_t v202 = v240;
      v201 = v241;
      void *v237 = v240;
      *(void *)(v200 + 8) = v201;
      uint64_t v203 = (uint64_t)v201;
      char v204 = v97 & 1;
      *(unsigned char *)(v200 + 16) = v97 & 1;
      *(void *)(v200 + 24) = v242;
      *(void *)(v200 + 32) = 0;
      *(unsigned char *)(v200 + 40) = 1;
      uint64_t v205 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628B88);
      sub_20A1DC8A4(v199, v200 + *(int *)(v205 + 64), &qword_267628AD8);
      sub_20A374850(v202, v203, v97 & 1);
      swift_bridgeObjectRetain();
      sub_20A374850(v202, v203, v97 & 1);
      swift_bridgeObjectRetain();
      sub_20A1F1460(v199, &qword_267628AD8);
      sub_20A277868(v202, v203, v97 & 1);
      swift_bridgeObjectRelease();
      sub_20A1DC8A4(v200, (uint64_t)v218, &qword_267628AB0);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267628B30);
      sub_20A375624((uint64_t)&unk_267628B20);
      sub_20A375624((uint64_t)&unk_267628B28);
      uint64_t v206 = (uint64_t)v243;
      sub_20A38AE50();
      sub_20A1F1460(v200, &qword_267628AB0);
      sub_20A1DC8A4(v206, v250, &qword_267628AB8);
      swift_storeEnumTagMultiPayload();
      sub_20A374A80();
      sub_20A374B40();
      sub_20A38AE50();
      sub_20A1F1460(v206, &qword_267628AB8);
      sub_20A1F1460(v239, &qword_267628AD8);
      sub_20A277868(v202, (uint64_t)v241, v204);
      return swift_bridgeObjectRelease();
  }
}

uint64_t sub_20A3727B4@<X0>(uint64_t a1@<X2>, unint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v52 = a1;
  unint64_t v53 = a2;
  uint64_t v54 = a3;
  uint64_t v3 = sub_20A38AE90();
  uint64_t v50 = *(void *)(v3 - 8);
  uint64_t v51 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v49 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628B98) - 8;
  MEMORY[0x270FA5388](v45);
  uint64_t v6 = (uint64_t *)((char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_20A38B1D0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628BA0);
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (uint64_t *)((char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628BA8) - 8;
  MEMORY[0x270FA5388](v44);
  uint64_t v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628BB0);
  MEMORY[0x270FA5388](v46);
  uint64_t v42 = (uint64_t)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628BB8);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v47 = v18;
  uint64_t v48 = v19;
  MEMORY[0x270FA5388](v18);
  unint64_t v43 = (char *)&v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_20A38B1B0();
  uint64_t v22 = v10;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F1B530], v7);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)v6 + *(int *)(v45 + 36), v22, v7);
  *uint64_t v6 = KeyPath;
  sub_20A1DC8A4((uint64_t)v6, (uint64_t)v14 + *(int *)(v12 + 44), &qword_267628B98);
  *uint64_t v14 = v21;
  swift_retain();
  sub_20A1F1460((uint64_t)v6, &qword_267628B98);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v22, v7);
  swift_release();
  uint64_t v24 = sub_20A38AF60();
  uint64_t v25 = swift_getKeyPath();
  sub_20A1DC8A4((uint64_t)v14, (uint64_t)v16, &qword_267628BA0);
  uint64_t v26 = (uint64_t *)&v16[*(int *)(v44 + 44)];
  *uint64_t v26 = v25;
  v26[1] = v24;
  sub_20A1F1460((uint64_t)v14, &qword_267628BA0);
  uint64_t v27 = sub_20A38B180();
  uint64_t v28 = swift_getKeyPath();
  uint64_t v29 = v42;
  sub_20A1DC8A4((uint64_t)v16, v42, &qword_267628BA8);
  uint64_t v30 = v46;
  uint64_t v31 = (uint64_t *)(v29 + *(int *)(v46 + 36));
  *uint64_t v31 = v28;
  v31[1] = v27;
  sub_20A1F1460((uint64_t)v16, &qword_267628BA8);
  uint64_t v32 = v49;
  sub_20A38AE80();
  unint64_t v33 = sub_20A374F98();
  uint64_t v34 = v43;
  sub_20A38B120();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v32, v51);
  sub_20A1F1460(v29, &qword_267628BB0);
  uint64_t v55 = v52;
  unint64_t v56 = v53;
  sub_20A230CD8();
  swift_bridgeObjectRetain();
  uint64_t v35 = sub_20A38B070();
  uint64_t v37 = v36;
  char v39 = v38 & 1;
  uint64_t v55 = v30;
  unint64_t v56 = v33;
  swift_getOpaqueTypeConformance2();
  uint64_t v40 = v47;
  sub_20A38B0F0();
  sub_20A277868(v35, v37, v39);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v34, v40);
}

double sub_20A372D34@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *a1;
  long long v12 = *(_OWORD *)(a1 + 1);
  uint64_t v14 = v4;
  sub_20A3754C8((uint64_t)&v12 + 8, (uint64_t)v13, &qword_267628BE0);
  long long v10 = *(_OWORD *)(a1 + 3);
  sub_20A3754C8((uint64_t)&v10 + 8, (uint64_t)v11, &qword_267628BE8);
  sub_20A375184((uint64_t)&v14);
  swift_retain();
  sub_20A375184((uint64_t)v13);
  swift_retain();
  sub_20A375184((uint64_t)v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267628B48);
  sub_20A374BE0();
  sub_20A38AE50();
  double result = *(double *)&v6;
  *(_OWORD *)a2 = v6;
  *(_OWORD *)(a2 + 16) = v7;
  *(void *)(a2 + 32) = v8;
  *(unsigned char *)(a2 + 40) = v9;
  return result;
}

uint64_t sub_20A372E58@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t *a8@<X8>, unint64_t a9)
{
  uint64_t v100 = a6;
  uint64_t v101 = a7;
  uint64_t v99 = a5;
  uint64_t v96 = a4;
  uint64_t v94 = a3;
  uint64_t v91 = a2;
  uint64_t v106 = a1;
  uint64_t v82 = a8;
  unint64_t v98 = a9;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628A68);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v104 = (uint64_t)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v103 = (uint64_t)&v81 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628A70);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v102 = (uint64_t)&v81 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v97 = (char *)&v81 - v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628BF0);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v105 = (uint64_t)&v81 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (uint64_t *)((char *)&v81 - v20);
  sub_20A38A270();
  uint64_t v22 = sub_20A38A1F0();
  uint64_t v24 = v23;
  BOOL v26 = v22 == sub_20A38A1F0() && v24 == v25;
  uint64_t v107 = v21;
  if (v26)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v27 = sub_20A38C830();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v27 & 1) == 0)
    {
      uint64_t v28 = sub_20A38A240();
      uint64_t v30 = v29;
      goto LABEL_11;
    }
  }
  if (qword_26AC3C6D8 != -1) {
    swift_once();
  }
  id v31 = (id)qword_26AC41740;
  uint64_t v28 = sub_20A3891E0();
  uint64_t v30 = v32;

LABEL_11:
  uint64_t v110 = v28;
  uint64_t v111 = v30;
  unint64_t v84 = sub_20A230CD8();
  uint64_t v33 = sub_20A38B070();
  uint64_t v35 = v34;
  char v37 = v36 & 1;
  sub_20A38AF60();
  uint64_t v38 = sub_20A38B050();
  uint64_t v40 = v39;
  char v42 = v41;
  swift_release();
  sub_20A277868(v33, v35, v37);
  swift_bridgeObjectRelease();
  sub_20A38B180();
  uint64_t v93 = sub_20A38B040();
  uint64_t v92 = v43;
  int v83 = v44;
  uint64_t v95 = v45;
  swift_release();
  sub_20A277868(v38, v40, v42 & 1);
  swift_bridgeObjectRelease();
  type metadata accessor for LocationPicker();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267628978);
  sub_20A38AC20();
  sub_20A38B270();
  sub_20A38AC70();
  uint64_t v90 = v110;
  int v89 = v111;
  uint64_t v88 = v112;
  int v87 = v113;
  uint64_t v86 = v114;
  uint64_t v85 = v115;
  uint64_t v108 = v91;
  uint64_t v109 = v94;
  swift_bridgeObjectRetain();
  uint64_t v46 = sub_20A38B070();
  uint64_t v48 = v47;
  char v50 = v49 & 1;
  sub_20A38AF50();
  uint64_t v51 = sub_20A38B050();
  uint64_t v53 = v52;
  char v55 = v54;
  swift_release();
  sub_20A277868(v46, v48, v50);
  swift_bridgeObjectRelease();
  sub_20A38B190();
  uint64_t v91 = sub_20A38B040();
  unint64_t v84 = v56;
  char v58 = v57;
  uint64_t v94 = v59;
  swift_release();
  sub_20A277868(v51, v53, v55 & 1);
  swift_bridgeObjectRelease();
  uint64_t v60 = sub_20A38ADF0();
  uint64_t v61 = v107;
  *uint64_t v107 = v60;
  v61[1] = 0;
  *((unsigned char *)v61 + 16) = 1;
  if (v96)
  {
    swift_retain();
    uint64_t v62 = (uint64_t)v97;
    sub_20A373650();
    swift_release();
    uint64_t v63 = 0;
  }
  else
  {
    uint64_t v63 = 1;
    uint64_t v62 = (uint64_t)v97;
  }
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628AE0);
  __swift_storeEnumTagSinglePayload(v62, v63, 1, v64);
  char v65 = v58 & 1;
  char v66 = v83 & 1;
  uint64_t v67 = (uint64_t)v61 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267628BF8) + 44);
  uint64_t v68 = v103;
  sub_20A373794(v99, v100, v101, v98, v103);
  uint64_t v69 = v102;
  sub_20A1DC8A4(v62, v102, &qword_267628A70);
  uint64_t v70 = v104;
  sub_20A1DC8A4(v68, v104, &qword_267628A68);
  sub_20A1DC8A4(v69, v67, &qword_267628A70);
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628C00);
  sub_20A1DC8A4(v70, v67 + *(int *)(v71 + 48), &qword_267628A68);
  sub_20A1F1460(v68, &qword_267628A68);
  sub_20A1F1460(v62, &qword_267628A70);
  sub_20A1F1460(v70, &qword_267628A68);
  sub_20A1F1460(v69, &qword_267628A70);
  LOBYTE(v108) = v66;
  uint64_t v72 = v105;
  sub_20A1DC8A4((uint64_t)v61, v105, &qword_267628BF0);
  uint64_t v73 = v93;
  uint64_t v74 = v82;
  uint64_t v75 = v92;
  *uint64_t v82 = v93;
  v74[1] = v75;
  *((unsigned char *)v74 + 16) = v66;
  v74[3] = v95;
  v74[4] = 0;
  *((unsigned char *)v74 + 40) = 1;
  v74[6] = v90;
  *((unsigned char *)v74 + 56) = v89;
  v74[8] = v88;
  *((unsigned char *)v74 + 72) = v87;
  uint64_t v76 = v85;
  v74[10] = v86;
  v74[11] = v76;
  uint64_t v77 = v91;
  uint64_t v78 = v84;
  v74[12] = v91;
  v74[13] = v78;
  *((unsigned char *)v74 + 112) = v65;
  v74[15] = v94;
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628C08);
  sub_20A1DC8A4(v72, (uint64_t)v74 + *(int *)(v79 + 80), &qword_267628BF0);
  sub_20A374850(v73, v75, v66);
  swift_bridgeObjectRetain();
  sub_20A374850(v77, v78, v65);
  swift_bridgeObjectRetain();
  sub_20A1F1460((uint64_t)v107, &qword_267628BF0);
  sub_20A1F1460(v72, &qword_267628BF0);
  sub_20A277868(v77, v78, v65);
  swift_bridgeObjectRelease();
  sub_20A277868(v73, v75, v108);
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A373650()
{
  swift_retain();
  uint64_t v0 = sub_20A38B080();
  uint64_t v2 = v1;
  char v4 = v3 & 1;
  sub_20A38AF50();
  uint64_t v5 = sub_20A38B050();
  uint64_t v7 = v6;
  char v9 = v8;
  swift_release();
  sub_20A277868(v0, v2, v4);
  swift_bridgeObjectRelease();
  sub_20A38B190();
  uint64_t v10 = sub_20A38B040();
  uint64_t v12 = v11;
  char v14 = v13;
  swift_release();
  sub_20A277868(v5, v7, v9 & 1);
  swift_bridgeObjectRelease();
  sub_20A38B110();
  sub_20A277868(v10, v12, v14 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A373794@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v34 = a4;
  uint64_t v33 = a3;
  uint64_t v36 = a5;
  uint64_t v32 = sub_20A38ACB0();
  uint64_t v31 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  char v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = a1;
  uint64_t v40 = a2;
  unint64_t v9 = sub_20A230CD8();
  swift_bridgeObjectRetain();
  unint64_t v35 = v9;
  uint64_t v10 = sub_20A38B070();
  uint64_t v12 = v11;
  char v14 = v13 & 1;
  sub_20A38AF50();
  uint64_t v15 = sub_20A38B050();
  uint64_t v17 = v16;
  char v19 = v18;
  swift_release();
  sub_20A277868(v10, v12, v14);
  swift_bridgeObjectRelease();
  sub_20A38B190();
  uint64_t v20 = sub_20A38B040();
  uint64_t v22 = v21;
  char v24 = v23;
  uint64_t v26 = v25;
  swift_release();
  sub_20A277868(v15, v17, v19 & 1);
  swift_bridgeObjectRelease();
  type metadata accessor for LocationPicker();
  sub_20A354D88();
  sub_20A38ACA0();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v32);
  sub_20A38B270();
  sub_20A38AC70();
  uint64_t v39 = v20;
  uint64_t v40 = v22;
  char v41 = v24 & 1;
  uint64_t v42 = v26;
  __int16 v43 = 257;
  uint64_t v44 = v49;
  char v45 = v50;
  uint64_t v46 = v51;
  char v47 = v52;
  long long v48 = v53;
  uint64_t v27 = v33;
  if (v34)
  {
    unint64_t v28 = v34;
  }
  else
  {
    uint64_t v27 = 0;
    unint64_t v28 = 0xE000000000000000;
  }
  uint64_t v37 = v27;
  unint64_t v38 = v28;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267628C10);
  sub_20A3751B0((uint64_t)&unk_267628C18);
  sub_20A38B100();
  swift_bridgeObjectRelease();
  sub_20A277868(v20, v22, v24 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A373ADC@<X0>(unint64_t a1@<X2>, uint64_t a2@<X8>)
{
  sub_20A38A270();
  uint64_t v3 = sub_20A38A1F0();
  uint64_t v5 = v4;
  if (v3 == sub_20A38A1F0() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v8 = sub_20A38C830();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
      uint64_t v9 = sub_20A38A240();
      char v11 = v10;
      goto LABEL_11;
    }
  }
  if (qword_26AC3C6D8 != -1) {
    swift_once();
  }
  id v12 = (id)qword_26AC41740;
  uint64_t v9 = sub_20A3891E0();
  char v11 = v13;

LABEL_11:
  uint64_t v54 = v9;
  char v55 = v11;
  sub_20A230CD8();
  uint64_t v14 = sub_20A38B070();
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  sub_20A38AF60();
  uint64_t v19 = sub_20A38B050();
  uint64_t v21 = v20;
  char v23 = v22;
  swift_release();
  sub_20A277868(v14, v16, v18);
  swift_bridgeObjectRelease();
  sub_20A38B180();
  uint64_t v24 = sub_20A38B040();
  uint64_t v46 = v25;
  uint64_t v47 = v24;
  char v27 = v26;
  uint64_t v48 = v28;
  swift_release();
  sub_20A277868(v19, v21, v23 & 1);
  swift_bridgeObjectRelease();
  type metadata accessor for LocationPicker();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267628978);
  sub_20A38AC20();
  sub_20A38B270();
  sub_20A38AC70();
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_20A38B070();
  uint64_t v31 = v30;
  LOBYTE(v19) = v32 & 1;
  sub_20A38AF50();
  uint64_t v33 = sub_20A38B050();
  uint64_t v35 = v34;
  char v37 = v36;
  swift_release();
  sub_20A277868(v29, v31, v19);
  swift_bridgeObjectRelease();
  sub_20A38B190();
  uint64_t v38 = sub_20A38B040();
  uint64_t v40 = v39;
  char v42 = v41;
  uint64_t v44 = v43;
  swift_release();
  sub_20A277868(v33, v35, v37 & 1);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a2 + 17) = a1;
  *(_DWORD *)(a2 + 20) = a1 >> 24;
  *(_DWORD *)(a2 + 41) = *(_DWORD *)v53;
  *(_DWORD *)(a2 + 44) = *(_DWORD *)&v53[3];
  *(_DWORD *)(a2 + 60) = *(_DWORD *)&v52[3];
  *(_DWORD *)(a2 + 57) = *(_DWORD *)v52;
  *(_DWORD *)(a2 + 76) = *(_DWORD *)&v51[3];
  *(_DWORD *)(a2 + 73) = *(_DWORD *)v51;
  *(_DWORD *)(a2 + 116) = *(_DWORD *)&v50[3];
  *(_DWORD *)(a2 + 113) = *(_DWORD *)v50;
  *(void *)a2 = v47;
  *(void *)(a2 + 8) = v46;
  *(unsigned char *)(a2 + 16) = v27 & 1;
  *(void *)(a2 + 24) = v48;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = v54;
  *(unsigned char *)(a2 + 56) = v55;
  *(void *)(a2 + 64) = v56;
  *(unsigned char *)(a2 + 72) = v57;
  *(void *)(a2 + 80) = v58;
  *(void *)(a2 + 88) = v59;
  *(void *)(a2 + 96) = v38;
  *(void *)(a2 + 104) = v40;
  *(unsigned char *)(a2 + 112) = v42 & 1;
  *(void *)(a2 + 120) = v44;
  sub_20A374850(v47, v46, v27 & 1);
  swift_bridgeObjectRetain();
  sub_20A374850(v38, v40, v42 & 1);
  swift_bridgeObjectRetain();
  sub_20A277868(v38, v40, v42 & 1);
  swift_bridgeObjectRelease();
  sub_20A277868(v47, v46, v27 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A373F84()
{
  return sub_20A37058C();
}

unint64_t sub_20A373F8C()
{
  unint64_t result = qword_2676289E0;
  if (!qword_2676289E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2676289D8);
    sub_20A37400C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2676289E0);
  }
  return result;
}

unint64_t sub_20A37400C()
{
  unint64_t result = qword_2676289E8;
  if (!qword_2676289E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2676289F0);
    sub_20A375624((uint64_t)&unk_2676289F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2676289E8);
  }
  return result;
}

uint64_t sub_20A3740A4@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_20A38AD70();
  *a1 = v3;
  return result;
}

uint64_t sub_20A3740D0()
{
  return sub_20A38AD80();
}

uint64_t sub_20A3740F8()
{
  return sub_20A3705F4();
}

uint64_t sub_20A374100()
{
  uint64_t v1 = (int *)(type metadata accessor for LocationPicker() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + v1[8];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628978);
  OUTLINED_FUNCTION_0();
  char v8 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v8(v5, v6);
  v8(v0 + v3 + v1[9], v6);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676262A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_20A38ACB0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_5();
    v9();
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_20A37428C()
{
  uint64_t v0 = type metadata accessor for LocationPicker();
  OUTLINED_FUNCTION_10(v0);
  return sub_20A370800();
}

uint64_t sub_20A3742EC()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_34();
  v2(v1);
  OUTLINED_FUNCTION_0();
  uint64_t v3 = OUTLINED_FUNCTION_9_2();
  v4(v3);
  return v0;
}

uint64_t sub_20A374334()
{
  uint64_t v1 = (int *)(type metadata accessor for LocationPicker() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v17 = *(void *)(*(void *)v1 + 64);
  uint64_t v18 = type metadata accessor for LocationPickerViewModel.Row();
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(v18 - 8) + 80);
  uint64_t v16 = *(void *)(*(void *)(v18 - 8) + 64);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + v1[8];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628978);
  OUTLINED_FUNCTION_0();
  char v8 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v8(v5, v6);
  v8(v0 + v3 + v1[9], v6);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676262A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_20A38ACB0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_5();
    v9();
  }
  else
  {
    swift_release();
  }
  uint64_t v10 = (v3 + v17 + v4) & ~v4;
  uint64_t v11 = v10 + v16;
  uint64_t v12 = v0 + v10;
  sub_20A38A2B0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  v13();
  uint64_t v14 = v12 + *(int *)(v18 + 20);
  sub_20A289650(*(void *)v14, *(void *)(v14 + 8), *(void *)(v14 + 16), *(void *)(v14 + 24), *(void *)(v14 + 32), *(void *)(v14 + 40), *(void *)(v14 + 48), *(void *)(v14 + 56), *(unsigned char *)(v14 + 64));
  return MEMORY[0x270FA0238](v0, v11, v2 | v4 | 7);
}

uint64_t sub_20A374594()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_34();
  v2(v1);
  OUTLINED_FUNCTION_0();
  uint64_t v3 = OUTLINED_FUNCTION_69();
  v4(v3);
  return v0;
}

uint64_t sub_20A3745DC()
{
  type metadata accessor for LocationPicker();
  uint64_t v0 = type metadata accessor for LocationPickerViewModel.Row();
  OUTLINED_FUNCTION_10(v0);
  return sub_20A370A28();
}

uint64_t sub_20A374688@<X0>(uint64_t a1@<X8>)
{
  return sub_20A370A88(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_20A374690()
{
  unint64_t result = qword_267628A30;
  if (!qword_267628A30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267628A28);
    sub_20A375624((uint64_t)&unk_267628A38);
    sub_20A375624((uint64_t)&unk_267628A48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628A30);
  }
  return result;
}

uint64_t sub_20A374754()
{
  return sub_20A38ADA0();
}

uint64_t sub_20A374780@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_20A38AD40();
  *a1 = result;
  return result;
}

uint64_t sub_20A3747AC()
{
  return sub_20A38AD50();
}

uint64_t sub_20A3747DC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 120);
  uint64_t v3 = *(void *)(a1 + 128);
  char v4 = *(unsigned char *)(a1 + 136);
  sub_20A374850(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_20A374850(v2, v3, v4);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_20A374850(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_20A374860(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  uint64_t v3 = *(void *)(a1 + 104);
  char v4 = *(unsigned char *)(a1 + 112);
  sub_20A374850(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_bridgeObjectRetain();
  sub_20A374850(v2, v3, v4);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_20A3748D4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 120);
  uint64_t v3 = *(void *)(a1 + 128);
  char v4 = *(unsigned char *)(a1 + 136);
  sub_20A277868(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_20A277868(v2, v3, v4);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_20A374948(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  uint64_t v3 = *(void *)(a1 + 104);
  char v4 = *(unsigned char *)(a1 + 112);
  sub_20A277868(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_bridgeObjectRelease();
  sub_20A277868(v2, v3, v4);
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_20A3749BC()
{
  unint64_t result = qword_267628B10;
  if (!qword_267628B10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267628A88);
    sub_20A375624((uint64_t)&unk_267628AF0);
    sub_20A375624((uint64_t)&unk_267628AF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628B10);
  }
  return result;
}

unint64_t sub_20A374A80()
{
  unint64_t result = qword_267628B18;
  if (!qword_267628B18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267628AB8);
    sub_20A375624((uint64_t)&unk_267628B20);
    sub_20A375624((uint64_t)&unk_267628B28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628B18);
  }
  return result;
}

unint64_t sub_20A374B40()
{
  unint64_t result = qword_267628B38;
  if (!qword_267628B38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267628A98);
    sub_20A375624((uint64_t)&unk_267628B08);
    sub_20A3749BC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628B38);
  }
  return result;
}

unint64_t sub_20A374BE0()
{
  unint64_t result = qword_267628B50;
  if (!qword_267628B50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267628B48);
    sub_20A3750F8((uint64_t)&unk_267628B58);
    sub_20A375624((uint64_t)&unk_267628A48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628B50);
  }
  return result;
}

uint64_t sub_20A374CA0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6)
  {
    sub_20A374850(a1, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  else
  {
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
}

uint64_t sub_20A374D40(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6)
  {
    sub_20A277868(a1, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
}

uint64_t sub_20A374DD8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_20A38AD90();
  *a1 = result;
  return result;
}

unint64_t sub_20A374E08()
{
  unint64_t result = qword_267628B78;
  if (!qword_267628B78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267628AD0);
    sub_20A375624((uint64_t)&unk_267628B80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628B78);
  }
  return result;
}

uint64_t sub_20A374EA8()
{
  return sub_20A38AD00();
}

uint64_t sub_20A374ECC(uint64_t a1)
{
  uint64_t v2 = sub_20A38B1D0();
  __n128 v3 = MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, __n128))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return sub_20A38AD10();
}

unint64_t sub_20A374F98()
{
  unint64_t result = qword_267628BC0;
  if (!qword_267628BC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267628BB0);
    sub_20A375038();
    sub_20A375624((uint64_t)&unk_267628A48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628BC0);
  }
  return result;
}

unint64_t sub_20A375038()
{
  unint64_t result = qword_267628BC8;
  if (!qword_267628BC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267628BA8);
    sub_20A3750F8((uint64_t)&unk_267628BD0);
    sub_20A375624((uint64_t)&unk_267628B68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628BC8);
  }
  return result;
}

unint64_t sub_20A3750F8(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_22_0(a1);
  if (!result)
  {
    OUTLINED_FUNCTION_3_52(0, v4);
    sub_20A375624(v2);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_20A375184(uint64_t a1)
{
  return a1;
}

unint64_t sub_20A3751B0(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_22_0(a1);
  if (!result)
  {
    OUTLINED_FUNCTION_3_52(0, v4);
    v2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_20A37521C()
{
  unint64_t result = qword_267628C20;
  if (!qword_267628C20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267628C28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628C20);
  }
  return result;
}

unint64_t sub_20A375290()
{
  unint64_t result = qword_267628C50;
  if (!qword_267628C50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267628C40);
    sub_20A375344((uint64_t)&unk_267628C58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628C50);
  }
  return result;
}

unint64_t sub_20A375344(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_22_0(a1);
  if (!result)
  {
    OUTLINED_FUNCTION_3_52(0, v5);
    v3();
    v2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_20A3753BC()
{
  return sub_20A375344((uint64_t)&unk_267628C60);
}

unint64_t sub_20A3753F8()
{
  unint64_t result = qword_267628C70;
  if (!qword_267628C70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267628C78);
    sub_20A374BE0();
    sub_20A375624((uint64_t)&unk_267628BD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628C70);
  }
  return result;
}

unint64_t sub_20A375498()
{
  return sub_20A3751B0((uint64_t)&unk_267628C80);
}

uint64_t sub_20A3754C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = OUTLINED_FUNCTION_69();
  v5(v4);
  return a2;
}

unint64_t sub_20A375518(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_22_0(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_20A375560()
{
  unint64_t result = qword_267628CD8;
  if (!qword_267628CD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267628998);
    sub_20A375624((uint64_t)&unk_267628CE0);
    sub_20A375624((uint64_t)&unk_267628CE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628CD8);
  }
  return result;
}

unint64_t sub_20A375624(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_22_0(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_20A375664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, float a7)
{
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  *(void *)(v7 + 32) = a3;
  *(float *)(v7 + 40) = a7;
  *(void *)(v7 + 48) = a4;
  *(void *)(v7 + 56) = a5;
  *(void *)(v7 + 64) = a6;
  return v7;
}

uint64_t sub_20A375680()
{
  sub_20A1FA670(*(void *)(v0 + 48), *(void *)(v0 + 56));
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_20A3756A8()
{
  sub_20A375680();
  return MEMORY[0x270FA0228](v0, 72, 7);
}

uint64_t type metadata accessor for OverlayImmutableTileResourceProvider()
{
  return self;
}

double sub_20A375700@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 64);
  if (*(void *)(v4 + 16) && (uint64_t v5 = sub_20A2D2E54(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(v4 + 56) + 48 * v5;
    sub_20A2A65E8(v7, a2);
  }
  else
  {
    *(void *)(a2 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(unsigned char *)(a2 + 40) = -1;
  }
  return result;
}

uint64_t sub_20A375774@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = result;
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *)(v2 + 24);
  uint64_t v7 = *(void *)(v2 + 32);
  int v8 = *(_DWORD *)(v2 + 40);
  uint64_t v9 = *(void *)(v2 + 64);
  if (*(void *)(v9 + 16) && (double result = sub_20A2D2E54(result), (v10 & 1) != 0))
  {
    sub_20A2A65E8(*(void *)(v9 + 56) + 48 * result, (uint64_t)v11);
    sub_20A1D8F9C((uint64_t)v11, (uint64_t)v12);
    double result = sub_20A1D8F9C((uint64_t)v12, a2 + 40);
  }
  else
  {
    *(void *)(a2 + 72) = 0;
    *(_OWORD *)(a2 + 56) = 0u;
    *(_OWORD *)(a2 + 40) = 0u;
    *(unsigned char *)(a2 + 80) = 4;
  }
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v5;
  *(void *)(a2 + 16) = v7;
  *(_DWORD *)(a2 + 24) = v8;
  *(void *)(a2 + 32) = v3;
  return result;
}

unint64_t sub_20A375834(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      unint64_t result = 0xD000000000000011;
      break;
    case 1:
      unint64_t result = 0x6566664572756C62;
      break;
    case 2:
      unint64_t result = 0xD000000000000017;
      break;
    case 3:
      unint64_t result = 0x79636E6172626976;
      break;
    default:
      unint64_t result = 0x64696C6F73;
      break;
  }
  return result;
}

void sub_20A3758FC(void *a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC11WeatherMaps20BackgroundEffectView_cornerCurve);
  *(void *)(v1 + OBJC_IVAR____TtC11WeatherMaps20BackgroundEffectView_cornerCurve) = a1;
  id v3 = a1;

  sub_20A375954();
}

id sub_20A375954()
{
  double v1 = *(double *)&v0[OBJC_IVAR____TtC11WeatherMaps20BackgroundEffectView_cornerRadius];
  uint64_t v2 = sub_20A38B610();
  uint64_t v4 = v3;
  if (v2 == sub_20A38B610() && v4 == v5) {
    char v7 = 1;
  }
  else {
    char v7 = sub_20A38C830();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return objc_msgSend(v0, sel__setCornerRadius_continuous_maskedCorners_, v7 & 1, 15, v1);
}

id sub_20A375A24(uint64_t a1)
{
  return sub_20A375A44(a1, 8, &qword_267628CF8);
}

id sub_20A375A34(uint64_t a1)
{
  return sub_20A375A44(a1, 6, &qword_267628D00);
}

id sub_20A375A44(uint64_t a1, uint64_t a2, void *a3)
{
  id result = objc_msgSend(self, sel_effectWithStyle_, a2);
  *a3 = result;
  return result;
}

void sub_20A375A90()
{
  if (qword_267625130 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_267628D00;
  double v1 = self;
  id v2 = v0;
  id v3 = objc_msgSend(v1, sel_effectForBlurEffect_style_, v2, 0);

  qword_267628D08 = (uint64_t)v3;
}

void sub_20A375B2C()
{
  if (qword_267625128 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_267628CF8;
  double v1 = self;
  id v2 = v0;
  id v3 = objc_msgSend(v1, sel_effectForBlurEffect_style_, v2, 4);

  qword_267628D10 = (uint64_t)v3;
}

id sub_20A375BC8()
{
  id v0 = objc_allocWithZone((Class)swift_getObjectType());
  id v1 = sub_20A375C58((void *)1, 0, 0, 0, 1);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v1;
}

id sub_20A375C58(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v6[OBJC_IVAR____TtC11WeatherMaps20BackgroundEffectView_style] = a1;
  char v13 = &v6[OBJC_IVAR____TtC11WeatherMaps20BackgroundEffectView_groupName];
  *(void *)char v13 = a2;
  *((void *)v13 + 1) = a3;
  double v14 = *(double *)&a4;
  if (a5) {
    double v14 = 10.0;
  }
  if (a1 == (void *)2) {
    double v14 = 0.0;
  }
  *(double *)&v6[OBJC_IVAR____TtC11WeatherMaps20BackgroundEffectView_cornerRadius] = v14;
  uint64_t v15 = (void *)*MEMORY[0x263F15A20];
  *(void *)&v6[OBJC_IVAR____TtC11WeatherMaps20BackgroundEffectView_cornerCurve] = *MEMORY[0x263F15A20];
  id v16 = v15;
  sub_20A1D6664(a1);
  v20.receiver = v6;
  v20.super_class = ObjectType;
  swift_bridgeObjectRetain();
  id v17 = objc_msgSendSuper2(&v20, sel_initWithEffect_, 0);
  if (a3)
  {
    uint64_t v18 = (void *)sub_20A38B5D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v18 = 0;
  }
  objc_msgSend(v17, sel__setGroupName_, v18, v20.receiver, v20.super_class);

  objc_msgSend(v17, sel_setUserInteractionEnabled_, 0);
  sub_20A375DC0();
  sub_20A375954();
  sub_20A1D6674(a1);

  return v17;
}

void sub_20A375DC0()
{
  id v1 = v0;
  if (*(void *)&v0[OBJC_IVAR____TtC11WeatherMaps20BackgroundEffectView_groupName + 8])
  {
    uint64_t v4 = *(void *)&v0[OBJC_IVAR____TtC11WeatherMaps20BackgroundEffectView_groupName];
    uint64_t v5 = *(void *)&v0[OBJC_IVAR____TtC11WeatherMaps20BackgroundEffectView_groupName + 8];
    swift_bridgeObjectRetain();
    sub_20A38B720();
    sub_20A375834(*(void *)&v0[OBJC_IVAR____TtC11WeatherMaps20BackgroundEffectView_style]);
    sub_20A38B720();
    swift_bridgeObjectRelease();
    sub_20A376384(v4, v5, v0);
  }
  id v2 = *(void **)&v0[OBJC_IVAR____TtC11WeatherMaps20BackgroundEffectView_style];
  switch((unint64_t)v2)
  {
    case 0uLL:
      if (qword_267625130 != -1) {
        swift_once();
      }
      uint64_t v3 = qword_267628D00;
      goto LABEL_19;
    case 1uLL:
      if (qword_267625128 != -1) {
        swift_once();
      }
      uint64_t v3 = qword_267628CF8;
      goto LABEL_19;
    case 2uLL:
      if (qword_267625138 != -1) {
        swift_once();
      }
      uint64_t v3 = qword_267628D08;
      goto LABEL_19;
    case 3uLL:
      if (qword_267625140 != -1) {
        swift_once();
      }
      uint64_t v3 = qword_267628D10;
LABEL_19:
      objc_msgSend(v1, sel_setEffect_, v3);
      break;
    default:
      objc_msgSend(v1, sel_setBackgroundColor_, v2);
      objc_msgSend(v1, sel_setEffect_, 0);
      sub_20A1D6674(v2);
      break;
  }
}

void sub_20A375FF0()
{
}

void sub_20A37605C()
{
}

void sub_20A3760B0()
{
}

uint64_t type metadata accessor for BackgroundEffectView()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for BackgroundEffectViewStyle(void *a1, void **a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    id v4 = v3;
  }
  *a1 = v3;
  return a1;
}

void destroy for BackgroundEffectViewStyle(void **a1)
{
  id v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF) {
}
  }

void **assignWithCopy for BackgroundEffectViewStyle(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  id v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
    {
      *a1 = v4;
      id v6 = v4;
      return a1;
    }
LABEL_7:
    *a1 = v4;
    return a1;
  }
  if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    id v4 = *a2;
    goto LABEL_7;
  }
  *a1 = v4;
  id v5 = v4;

  return a1;
}

void **assignWithTake for BackgroundEffectViewStyle(void **a1, unint64_t *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF) {
    goto LABEL_6;
  }
  if (v4 < 0xFFFFFFFF)
  {

LABEL_6:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for BackgroundEffectViewStyle(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFC && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483644);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 3;
  if (v4 >= 5) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for BackgroundEffectViewStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFB)
  {
    *(void *)id result = 0;
    *(_DWORD *)id result = a2 - 2147483644;
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)id result = a2 + 3;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BackgroundEffectViewStyle()
{
  return &type metadata for BackgroundEffectViewStyle;
}

void sub_20A376384(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_20A38B5D0();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel__setGroupName_, v4);
}

id sub_20A3763EC()
{
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_quaternaryLabelColor);
  objc_msgSend(v0, sel_alphaComponent);
  id v2 = objc_msgSend(v0, sel_colorWithAlphaComponent_, v1 * 0.5);

  return v2;
}

uint64_t *sub_20A376460(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_20A38A2B0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AC392E0) + 48);
      uint64_t v9 = (char *)a1 + v8;
      char v10 = (char *)a2 + v8;
      *(void *)uint64_t v9 = *(void *)v10;
      v9[8] = v10[8];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
  }
  return a1;
}

uint64_t sub_20A376584(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v3 = sub_20A38A2B0();
    id v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

char *sub_20A376600(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_20A38A2B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AC392E0) + 48);
    uint64_t v8 = &a1[v7];
    uint64_t v9 = &a2[v7];
    *(void *)uint64_t v8 = *(void *)v9;
    v8[8] = v9[8];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

char *sub_20A3766E0(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_20A3767D0((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_20A38A2B0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AC392E0) + 48);
      uint64_t v8 = &a1[v7];
      uint64_t v9 = &a2[v7];
      char v10 = v9[8];
      *(void *)uint64_t v8 = *(void *)v9;
      v8[8] = v10;
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_20A3767D0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InteractiveFocus();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for InteractiveFocus()
{
  uint64_t result = qword_26AC3B748;
  if (!qword_26AC3B748) {
    return swift_getSingletonMetadata();
  }
  return result;
}

char *sub_20A376874(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_20A38A2B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AC392E0) + 48);
    uint64_t v8 = &a1[v7];
    uint64_t v9 = &a2[v7];
    *(void *)uint64_t v8 = *(void *)v9;
    v8[8] = v9[8];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

char *sub_20A376954(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_20A3767D0((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_20A38A2B0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AC392E0) + 48);
      uint64_t v8 = &a1[v7];
      uint64_t v9 = &a2[v7];
      *(void *)uint64_t v8 = *(void *)v9;
      v8[8] = v9[8];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_20A376A44()
{
  v2[4] = "\t";
  uint64_t result = sub_20A38A2B0();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v2[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for InteractiveFocus.ZoomLevel()
{
  return &type metadata for InteractiveFocus.ZoomLevel;
}

uint64_t sub_20A376AFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20A38A2B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for InteractiveFocus();
  MEMORY[0x270FA5388](v8);
  char v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  char v13 = (double *)((char *)&v31 - v12);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC3B7F0);
  MEMORY[0x270FA5388](v14 - 8);
  id v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = (uint64_t)&v16[*(int *)(v17 + 56)];
  sub_20A376EA4(a1, (uint64_t)v16);
  sub_20A376EA4(a2, v18);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    sub_20A376EA4((uint64_t)v16, (uint64_t)v13);
    double v27 = *v13;
    if (!swift_getEnumCaseMultiPayload())
    {
      double v28 = *(double *)v18;
      int v29 = *(unsigned __int8 *)(v18 + 8);
      if (*((unsigned char *)v13 + 8) == 1)
      {
        if (v27 == 0.0)
        {
          if (v28 != 0.0) {
            LOBYTE(v29) = 0;
          }
          if ((v29 & 1) == 0) {
            goto LABEL_24;
          }
        }
        else
        {
          if (v28 == 0.0) {
            int v29 = 0;
          }
          if (v29 != 1) {
            goto LABEL_24;
          }
        }
      }
      else
      {
        if (v27 != v28) {
          LOBYTE(v29) = 1;
        }
        if (v29) {
          goto LABEL_24;
        }
      }
LABEL_14:
      sub_20A3767D0((uint64_t)v16);
      char v26 = 1;
      return v26 & 1;
    }
LABEL_16:
    sub_20A376F08((uint64_t)v16);
LABEL_25:
    char v26 = 0;
    return v26 & 1;
  }
  if (EnumCaseMultiPayload != 1)
  {
    if (swift_getEnumCaseMultiPayload() == 2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  sub_20A376EA4((uint64_t)v16, (uint64_t)v10);
  uint64_t v20 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AC392E0) + 48);
  uint64_t v21 = *(void *)&v10[v20];
  char v22 = v10[v20 + 8];
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    goto LABEL_16;
  }
  uint64_t v32 = *(void *)(v18 + v20);
  unsigned __int8 v23 = *(unsigned char *)(v18 + v20 + 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v18, v4);
  char v24 = sub_20A38A250();
  uint64_t v25 = *(void (**)(char *, uint64_t))(v5 + 8);
  v25(v7, v4);
  v25(v10, v4);
  if ((v24 & 1) == 0)
  {
LABEL_24:
    sub_20A3767D0((uint64_t)v16);
    goto LABEL_25;
  }
  char v26 = sub_20A376E40(v21, v22, v32, v23);
  sub_20A3767D0((uint64_t)v16);
  return v26 & 1;
}

uint64_t sub_20A376E40(uint64_t a1, char a2, uint64_t a3, unsigned __int8 a4)
{
  BOOL v4 = *(double *)&a1 == *(double *)&a3;
  if (a4) {
    BOOL v4 = 0;
  }
  unsigned int v5 = a4 & (a3 == 0);
  if (*(double *)&a1 != 0.0) {
    unsigned int v5 = a4 & (a3 != 0);
  }
  if (a2) {
    return v5;
  }
  else {
    return v4;
  }
}

uint64_t sub_20A376E88(uint64_t a1, uint64_t a2)
{
  return sub_20A376E40(*(void *)a1, *(unsigned char *)(a1 + 8), *(void *)a2, *(unsigned char *)(a2 + 8));
}

uint64_t sub_20A376EA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InteractiveFocus();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A376F08(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC3B7F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20A376F68(uint64_t result, uint64_t a2, void *a3)
{
  uint64_t v3 = a2 - result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
  }
  else
  {
    if (!v3)
    {

      return MEMORY[0x263F8EE78];
    }
    uint64_t v6 = result;
    uint64_t v12 = MEMORY[0x263F8EE78];
    uint64_t result = sub_20A2C0E58(0, v3 & ~(v3 >> 63), 0);
    if (a2 >= v6 && (v3 & 0x8000000000000000) == 0)
    {
      uint64_t v7 = v12;
      do
      {
        id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
        sub_20A37A578(v8, 0);
        objc_msgSend(a3, sel_addSubview_, v8);
        unint64_t v10 = *(void *)(v12 + 16);
        unint64_t v9 = *(void *)(v12 + 24);
        if (v10 >= v9 >> 1) {
          sub_20A2C0E58(v9 > 1, v10 + 1, 1);
        }
        *(void *)(v12 + 16) = v10 + 1;
        uint64_t v11 = v12 + 24 * v10;
        *(void *)(v11 + 32) = v8;
        *(void *)(v11 + 40) = 0;
        *(_WORD *)(v11 + 48) = 4;
        --v3;
      }
      while (v3);

      return v7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_20A3770C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2;
  uint64_t v7 = sub_20A389550();
  OUTLINED_FUNCTION_2_3();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_5_13();
  sub_20A2923EC((unint64_t *)&qword_26AC3CB58);
  char v11 = sub_20A38B5A0();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  if (v11) {
    uint64_t v13 = a1;
  }
  else {
    uint64_t v13 = v4;
  }
  v12(v3, v13, v7);
  uint64_t v14 = v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267625A90) + 36);
  if (sub_20A38B590())
  {
    uint64_t v15 = a2;
    uint64_t v16 = v3;
  }
  else
  {
    uint64_t v15 = a2;
    uint64_t v16 = v14;
  }
  v12(v15, v16, v7);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v3, v7);
}

uint64_t sub_20A377210(uint64_t a1)
{
  OUTLINED_FUNCTION_10_29();
  uint64_t v3 = sub_20A389550();
  OUTLINED_FUNCTION_1();
  uint64_t v5 = v4;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v1, a1, v3);
  swift_endAccess();
  sub_20A3779C0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v3);
}

BOOL sub_20A3772AC()
{
  id v0 = sub_20A377590();
  id v1 = objc_msgSend(v0, sel_state);

  if (v1 == (id)2) {
    return 1;
  }
  id v3 = sub_20A377590();
  id v4 = objc_msgSend(v3, sel_state);

  return v4 == (id)1;
}

uint64_t sub_20A37731C()
{
  uint64_t v2 = sub_20A389550();
  OUTLINED_FUNCTION_2_3();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = OUTLINED_FUNCTION_16_2();
  uint64_t v7 = type metadata accessor for MapScrubberOverlayBar.ViewModel(v6);
  MEMORY[0x270FA5388](v7 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_3();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = v0 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_model;
  OUTLINED_FUNCTION_4();
  sub_20A37EB34(v16, v10, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
  if (__swift_getEnumTagSinglePayload(v10, 1, v11) == 1)
  {
    uint64_t v17 = type metadata accessor for MapScrubberOverlayBar.ViewModel;
    uint64_t v18 = v10;
  }
  else
  {
    sub_20A37E700(v10, v15);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v15 + *(int *)(v11 + 32), v2);
    sub_20A377210(v1);
    uint64_t v17 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active;
    uint64_t v18 = v15;
  }
  return sub_20A37E6A8(v18, (void (*)(void))v17);
}

uint64_t sub_20A3774C8(uint64_t a1)
{
  OUTLINED_FUNCTION_10_29();
  sub_20A37EC24(a1, v1);
  swift_endAccess();
  sub_20A377760();
  return sub_20A37E6A8(a1, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
}

double sub_20A377538()
{
  objc_msgSend(v0, sel_frame);
  double MinY = CGRectGetMinY(v3);
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_bar], sel_frame);
  return MinY + CGRectGetMidY(v4);
}

id sub_20A377590()
{
  uint64_t v1 = OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar____lazy_storage___gestureRecognizer;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar____lazy_storage___gestureRecognizer];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar____lazy_storage___gestureRecognizer];
  }
  else
  {
    CGRect v4 = v0;
    uint64_t ObjectType = swift_getObjectType();
    type metadata accessor for MapScrubberGestureRecognizer();
    v11[3] = ObjectType;
    v11[0] = v4;
    uint64_t v6 = v4;
    id v7 = sub_20A33AEB0(v11, (uint64_t)sel_handleWithGesture_);
    uint64_t v8 = *(void **)&v4[v1];
    *(void *)&v4[v1] = v7;
    id v3 = v7;

    uint64_t v2 = 0;
  }
  id v9 = v2;
  return v3;
}

id sub_20A377634()
{
  uint64_t v0 = sub_20A389680();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  objc_msgSend(v4, sel_setDateStyle_, 0);
  objc_msgSend(v4, sel_setTimeStyle_, 1);
  sub_20A389620();
  uint64_t v5 = (void *)sub_20A389610();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  objc_msgSend(v4, sel_setLocale_, v5);

  return v4;
}

id sub_20A377760()
{
  v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_forceNeedsLayout] = 1;
  sub_20A3777A4();
  return objc_msgSend(v0, sel_setNeedsLayout);
}

uint64_t sub_20A3777A4()
{
  uint64_t v1 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  MEMORY[0x270FA5388](v1);
  id v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for MapScrubberOverlayBar.ViewModel(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (uint64_t *)(v0 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_tickMarks);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    uint64_t v20 = v6;
    uint64_t v21 = v1;
    char v22 = v3;
    swift_bridgeObjectRetain_n();
    uint64_t v10 = 32;
    uint64_t v11 = 1;
    while (1)
    {
      uint64_t v13 = *(void **)(v8 + v10);
      uint64_t v12 = *(void **)(v8 + v10 + 8);
      id v14 = v12;
      id v15 = v13;
      objc_msgSend(v15, sel_removeFromSuperview);
      if (v12)
      {
        objc_msgSend(v14, sel_removeFromSuperview);
      }
      if (v9 == v11) {
        break;
      }
      v10 += 24;
      if (__OFADD__(v11++, 1))
      {
        __break(1u);
        break;
      }
    }
    swift_bridgeObjectRelease_n();
    uint64_t v1 = v21;
    id v3 = v22;
    uint64_t v6 = v20;
  }
  uint64_t v17 = v0 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_model;
  swift_beginAccess();
  sub_20A37EB34(v17, (uint64_t)v6, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v1) == 1) {
    return sub_20A37AEF4();
  }
  sub_20A37E700((uint64_t)v6, (uint64_t)v3);
  sub_20A37AD44((uint64_t)v3);
  return sub_20A37E6A8((uint64_t)v3, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
}

id sub_20A3779C0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_20A389550();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v18 - v7;
  uint64_t v9 = type metadata accessor for MapScrubberOverlayBar.ViewModel(0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  MEMORY[0x270FA5388](v12);
  id v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t)&v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_model];
  swift_beginAccess();
  sub_20A37EB34(v15, (uint64_t)v11, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
  {
    sub_20A37E6A8((uint64_t)v11, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
    return objc_msgSend(v1, sel_setAccessibilityValue_, 0);
  }
  else
  {
    sub_20A37E700((uint64_t)v11, (uint64_t)v14);
    uint64_t v17 = &v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_current];
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v17, v2);
    sub_20A3770C0((uint64_t)v5, (uint64_t)v8);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v3 + 40))(v17, v8, v2);
    swift_endAccess();
    sub_20A377C94();
    return (id)sub_20A37E6A8((uint64_t)v14, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
  }
}

id sub_20A377C94()
{
  uint64_t v2 = v0;
  sub_20A389550();
  OUTLINED_FUNCTION_2_3();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3();
  uint64_t v6 = type metadata accessor for MapScrubberOverlayBar.ViewModel(0);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_5_13();
  uint64_t v12 = (uint64_t)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_model];
  OUTLINED_FUNCTION_4();
  sub_20A37EB34(v12, v9, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
  if (__swift_getEnumTagSinglePayload(v9, 1, v10) == 1)
  {
    sub_20A37E6A8(v9, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
    return objc_msgSend(v0, sel_setAccessibilityValue_, 0);
  }
  else
  {
    sub_20A37E700(v9, v1);
    OUTLINED_FUNCTION_4();
    id v14 = *(void (**)(uint64_t))(v4 + 16);
    uint64_t v15 = OUTLINED_FUNCTION_7_37();
    v14(v15);
    char v16 = sub_20A3894D0();
    uint64_t v17 = *(void (**)(uint64_t))(v4 + 8);
    uint64_t v18 = OUTLINED_FUNCTION_14_22();
    v17(v18);
    if (v16)
    {
      if (qword_26AC3C6D8 != -1) {
        swift_once();
      }
      id v19 = (id)qword_26AC41740;
      OUTLINED_FUNCTION_4_43();
      uint64_t v20 = sub_20A3891E0();
    }
    else
    {
      char v22 = *(void **)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_accessibilityDateFormatter];
      uint64_t v23 = OUTLINED_FUNCTION_7_37();
      v14(v23);
      char v24 = (void *)sub_20A389460();
      uint64_t v25 = OUTLINED_FUNCTION_14_22();
      v17(v25);
      id v19 = objc_msgSend(v22, sel_stringFromDate_, v24);

      uint64_t v20 = sub_20A38B610();
    }
    uint64_t v26 = v20;
    uint64_t v27 = v21;

    sub_20A265E74(v26, v27, v2, (SEL *)&selRef_setAccessibilityValue_);
    return (id)sub_20A37E6A8(v1, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
  }
}

double sub_20A377F78()
{
  uint64_t v1 = sub_20A389550();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v0 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_current;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  double v6 = COERCE_DOUBLE(sub_20A37809C());
  LOBYTE(v5) = v7;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  double result = v6;
  if (v5) {
    return 0.0;
  }
  return result;
}

uint64_t sub_20A37809C()
{
  uint64_t v1 = type metadata accessor for MapScrubberOverlayBar.ViewModel(0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  MEMORY[0x270FA5388](v4);
  double v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (uint64_t)v0 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_model;
  swift_beginAccess();
  sub_20A37EB34(v7, (uint64_t)v3, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v4) == 1)
  {
    sub_20A37E6A8((uint64_t)v3, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
    return 0;
  }
  else
  {
    sub_20A37E700((uint64_t)v3, (uint64_t)v6);
    sub_20A389440();
    double v10 = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267625A90);
    sub_20A389440();
    double v12 = v10 / v11;
    if (v12 > 1.0) {
      double v12 = 1.0;
    }
    if (v12 < 0.0) {
      double v13 = 0.0;
    }
    else {
      double v13 = v12;
    }
    id v14 = objc_msgSend(v0, sel_effectiveUserInterfaceLayoutDirection);
    sub_20A37E6A8((uint64_t)v6, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
    double v15 = 1.0 - v13;
    if (v14 != (id)1) {
      double v15 = v13;
    }
    return *(void *)&v15;
  }
}

uint64_t sub_20A378290()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC39100);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_20A389550();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  double v11 = (char *)&v20 - v10;
  MEMORY[0x270FA5388](v12);
  id v14 = (char *)&v20 - v13;
  sub_20A37854C((uint64_t)v4);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1) {
    return sub_20A1D4270((uint64_t)v4, &qword_26AC39100);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v14, v4, v5);
  uint64_t v16 = &v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_current];
  swift_beginAccess();
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v17(v11, v16, v5);
  v17(v8, v14, v5);
  sub_20A377210((uint64_t)v8);
  v17(v8, v16, v5);
  sub_20A2923EC((unint64_t *)&qword_267625F60);
  char v18 = sub_20A38B5C0();
  id v19 = *(void (**)(char *, uint64_t))(v6 + 8);
  v19(v8, v5);
  if ((v18 & 1) == 0) {
    objc_msgSend(v1, sel_sendActionsForControlEvents_, 4096);
  }
  v19(v11, v5);
  return ((uint64_t (*)(char *, uint64_t))v19)(v14, v5);
}

uint64_t sub_20A37854C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for MapScrubberOverlayBar.ViewModel(0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v1 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_model;
  swift_beginAccess();
  sub_20A37EB34(v9, (uint64_t)v5, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) == 1)
  {
    sub_20A37E6A8((uint64_t)v5, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
    uint64_t v10 = 1;
  }
  else
  {
    sub_20A37E700((uint64_t)v5, (uint64_t)v8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267625A90);
    sub_20A389440();
    sub_20A389450();
    sub_20A37E6A8((uint64_t)v8, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
    uint64_t v10 = 0;
  }
  uint64_t v11 = sub_20A389550();
  return __swift_storeEnumTagSinglePayload(a1, v10, 1, v11);
}

id sub_20A378718()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_bar;
  id v4 = objc_allocWithZone(MEMORY[0x263F82E00]);
  uint64_t v5 = v0;
  *(void *)&v1[v3] = objc_msgSend(v4, sel_init);
  uint64_t v6 = OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_elapsedBar;
  *(void *)&v5[v6] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  uint64_t v7 = OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_control;
  *(void *)&v5[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  *(void *)&v5[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_tickMarks] = MEMORY[0x263F8EE78];
  uint64_t v8 = &v5[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_nowTickMark];
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  *(void *)uint64_t v8 = v9;
  *((void *)v8 + 1) = v10;
  *(void *)&v5[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_barHeight] = 0x4010000000000000;
  *(void *)&v5[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_tickWidth] = 0x4000000000000000;
  *(void *)&v5[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_baselineSpacing] = 0x4018000000000000;
  *(void *)&v5[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_minimumWidth] = 0x4044000000000000;
  *(void *)&v5[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_verticalHitAreaIncrease] = 0x4018000000000000;
  id v11 = objc_msgSend(self, sel_sharedApplication);
  id v12 = objc_msgSend(v11, sel_preferredContentSizeCategory);

  LOBYTE(v11) = sub_20A38BF70();
  double v13 = 0.0;
  if (v11) {
    double v13 = 2.0;
  }
  *(double *)&v5[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_extraPadding] = v13;
  id v14 = &v5[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_overlappingLabelInsets];
  *(_OWORD *)id v14 = xmmword_20A39C230;
  *((_OWORD *)v14 + 1) = xmmword_20A39C230;
  uint64_t v15 = OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_nowLabel;
  if (qword_26AC3C6D8 != -1) {
    swift_once();
  }
  uint64_t v16 = (uint64_t *)&v5[v15];
  id v17 = (id)qword_26AC41740;
  OUTLINED_FUNCTION_4_43();
  uint64_t v18 = sub_20A3891E0();
  uint64_t v20 = v19;

  *uint64_t v16 = v18;
  v16[1] = v20;
  uint64_t v21 = (uint64_t *)&v5[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_todayLabel];
  id v22 = (id)qword_26AC41740;
  OUTLINED_FUNCTION_5_42();
  uint64_t v23 = sub_20A3891E0();
  uint64_t v25 = v24;

  *uint64_t v21 = v23;
  v21[1] = v25;
  uint64_t v26 = &v5[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_lastBounds];
  *(_OWORD *)uint64_t v26 = 0u;
  *((_OWORD *)v26 + 1) = 0u;
  v5[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_forceNeedsLayout] = 0;
  *(void *)&v5[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar____lazy_storage___gestureRecognizer] = 0;
  uint64_t v27 = OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_accessibilityDateFormatter;
  *(void *)&v5[v27] = sub_20A377634();
  uint64_t v28 = (uint64_t)&v5[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_model];
  uint64_t v29 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  __swift_storeEnumTagSinglePayload(v28, 1, 1, v29);
  sub_20A389540();

  v32.receiver = v5;
  v32.super_class = ObjectType;
  id v30 = objc_msgSendSuper2(&v32, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0, 0x800000020A3A9940);
  sub_20A378A78();

  return v30;
}

void sub_20A378A78()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_bar];
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_tertiarySystemFillColor);
  objc_msgSend(v1, sel_setBackgroundColor_, v3);

  double v4 = *(double *)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_barHeight];
  objc_msgSend(v1, sel__setCornerRadius_, v4 * 0.5);
  objc_msgSend(v0, sel_addSubview_, v1);
  uint64_t v5 = *(void **)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_elapsedBar];
  id v6 = objc_msgSend(v2, sel_labelColor);
  objc_msgSend(v5, sel_setBackgroundColor_, v6);

  objc_msgSend(v5, sel__setCornerRadius_, v4 * 0.5);
  id v7 = objc_msgSend(v5, sel_layer);
  objc_msgSend(v7, sel_setZPosition_, 10.0);

  objc_msgSend(v0, sel_addSubview_, v5);
  sub_20A3777A4();
  uint64_t v8 = (id *)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_nowTickMark];
  id v9 = *(id *)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_nowTickMark];
  sub_20A37A578(v9, 1);

  id v10 = v8[1];
  uint64_t v11 = sub_20A37A8CC();
  sub_20A37A9E4(v10, v11, v12, 1);

  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_addSubview_, *v8);
  objc_msgSend(v0, sel_addSubview_, v8[1]);
  double v13 = *(void **)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_control];
  id v14 = objc_msgSend(v2, sel_labelColor);
  objc_msgSend(v13, sel_setBackgroundColor_, v14);

  objc_msgSend(v13, sel_bounds);
  objc_msgSend(v13, sel_setBounds_);
  objc_msgSend(v13, sel__setCornerRadius_, v4);
  objc_msgSend(v0, sel_addSubview_, v13);
  id v15 = sub_20A377590();
  objc_msgSend(v0, sel_addGestureRecognizer_, v15);

  objc_msgSend(v0, sel_setIsAccessibilityElement_, 1);
  uint64_t v16 = *MEMORY[0x263F83248];
  uint64_t v17 = *MEMORY[0x263F832D8];
  if (!*MEMORY[0x263F83248])
  {
    if (!v17)
    {
      uint64_t v16 = 0;
      goto LABEL_7;
    }
LABEL_5:
    v16 |= v17;
    goto LABEL_7;
  }
  if ((v17 & ~v16) != 0) {
    goto LABEL_5;
  }
LABEL_7:
  unint64_t v18 = (unint64_t)objc_msgSend(v0, sel_accessibilityTraits);
  if ((v16 & ~v18) != 0) {
    uint64_t v19 = v16;
  }
  else {
    uint64_t v19 = 0;
  }
  objc_msgSend(v0, sel_setAccessibilityTraits_, v19 | v18);
  if (qword_26AC3C6D8 != -1) {
    swift_once();
  }
  id v20 = (id)qword_26AC41740;
  uint64_t v21 = sub_20A3891E0();
  uint64_t v23 = v22;

  sub_20A265E74(v21, v23, v0, (SEL *)&selRef_setAccessibilityLabel_);
}

void sub_20A378E4C()
{
  uint64_t v1 = OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_bar;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  uint64_t v2 = OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_elapsedBar;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  uint64_t v3 = OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_control;
  *(void *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  *(void *)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_tickMarks] = MEMORY[0x263F8EE78];
  double v4 = &v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_nowTickMark];
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  void *v4 = v5;
  v4[1] = v6;
  *(void *)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_barHeight] = 0x4010000000000000;
  *(void *)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_tickWidth] = 0x4000000000000000;
  *(void *)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_baselineSpacing] = 0x4018000000000000;
  *(void *)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_minimumWidth] = 0x4044000000000000;
  *(void *)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_verticalHitAreaIncrease] = 0x4018000000000000;
  id v7 = objc_msgSend(self, sel_sharedApplication);
  id v8 = objc_msgSend(v7, sel_preferredContentSizeCategory);

  LOBYTE(v7) = sub_20A38BF70();
  double v9 = 0.0;
  if (v7) {
    double v9 = 2.0;
  }
  *(double *)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_extraPadding] = v9;
  id v10 = &v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_overlappingLabelInsets];
  *id v10 = xmmword_20A39C230;
  v10[1] = xmmword_20A39C230;
  uint64_t v11 = OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_nowLabel;
  if (qword_26AC3C6D8 != -1) {
    swift_once();
  }
  uint64_t v12 = (uint64_t *)&v0[v11];
  id v13 = (id)qword_26AC41740;
  OUTLINED_FUNCTION_4_43();
  uint64_t v14 = sub_20A3891E0();
  uint64_t v16 = v15;

  *uint64_t v12 = v14;
  v12[1] = v16;
  uint64_t v17 = (uint64_t *)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_todayLabel];
  id v18 = (id)qword_26AC41740;
  OUTLINED_FUNCTION_5_42();
  uint64_t v19 = sub_20A3891E0();
  uint64_t v21 = v20;

  *uint64_t v17 = v19;
  v17[1] = v21;
  uint64_t v22 = &v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_lastBounds];
  *uint64_t v22 = 0u;
  v22[1] = 0u;
  v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_forceNeedsLayout] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar____lazy_storage___gestureRecognizer] = 0;
  uint64_t v23 = OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_accessibilityDateFormatter;
  *(void *)&v0[v23] = sub_20A377634();
  uint64_t v24 = (uint64_t)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_model];
  uint64_t v25 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  __swift_storeEnumTagSinglePayload(v24, 1, 1, v25);
  sub_20A389540();

  sub_20A38C620();
  __break(1u);
}

void sub_20A3791A8()
{
  v15.receiver = v0;
  v15.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v15, sel_layoutSubviews);
  uint64_t v1 = &v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_lastBounds];
  CGFloat v2 = *(double *)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_lastBounds];
  CGFloat v3 = *(double *)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_lastBounds + 8];
  CGFloat v4 = *(double *)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_lastBounds + 16];
  CGFloat v5 = *(double *)&v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_lastBounds + 24];
  objc_msgSend(v0, sel_bounds);
  v17.origin.x = v6;
  v17.origin.y = v7;
  v17.size.width = v8;
  v17.size.height = v9;
  v16.origin.x = v2;
  v16.origin.y = v3;
  v16.size.width = v4;
  v16.size.height = v5;
  if (!CGRectEqualToRect(v16, v17) || v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_forceNeedsLayout] == 1)
  {
    objc_msgSend(v0, sel_bounds);
    *(void *)uint64_t v1 = v10;
    *((void *)v1 + 1) = v11;
    *((void *)v1 + 2) = v12;
    *((void *)v1 + 3) = v13;
    v0[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_forceNeedsLayout] = 0;
    objc_msgSend(v0, sel_bounds);
    sub_20A379298(v14);
    sub_20A3797A4();
  }
}

id sub_20A379298(double a1)
{
  uint64_t v3 = type metadata accessor for MapScrubberOverlayBar.ViewModel(0);
  MEMORY[0x270FA5388](v3 - 8);
  CGFloat v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  MEMORY[0x270FA5388](v6);
  CGFloat v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v9 = *(double *)&v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_barHeight];
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_bar], sel_setFrame_, 0.0, v9 * 0.5, a1, v9);
  sub_20A37A08C(a1);
  uint64_t v10 = (uint64_t)&v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_model];
  swift_beginAccess();
  sub_20A37EB34(v10, (uint64_t)v5, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) == 1)
  {
    uint64_t v11 = type metadata accessor for MapScrubberOverlayBar.ViewModel;
    uint64_t v12 = (uint64_t)v5;
  }
  else
  {
    sub_20A37E700((uint64_t)v5, (uint64_t)v8);
    double v13 = COERCE_DOUBLE(sub_20A37809C());
    if ((v14 & 1) == 0)
    {
      double v15 = *(double *)&v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_tickWidth];
      double v16 = v13 * a1 - v15;
      CGRect v17 = (id *)&v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_nowTickMark];
      objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_nowTickMark], sel_setCenter_, v16, v9);
      objc_msgSend(v17[1], sel_sizeToFit);
      id v18 = v17[1];
      if (objc_msgSend(v1, sel_effectiveUserInterfaceLayoutDirection) == (id)1)
      {
        objc_msgSend(v17[1], sel_bounds);
        double v19 = CGRectGetWidth(v54) + v15 * -0.5;
      }
      else
      {
        double v19 = v15 * 0.5;
      }
      double v20 = v16 - v19;
      double v21 = v9
          + *(double *)&v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_baselineSpacing]
          + *(double *)&v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_extraPadding] * 0.5;
      objc_msgSend(v18, sel_frame);
      objc_msgSend(v18, sel_setFrame_, v20, v21);
    }
    uint64_t v11 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active;
    uint64_t v12 = (uint64_t)v8;
  }
  sub_20A37E6A8(v12, (void (*)(void))v11);
  uint64_t v22 = &v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_tickMarks];
  swift_beginAccess();
  id result = *(id *)v22;
  unint64_t v24 = *(void *)(*(void *)v22 + 16);
  if (v24 < 2) {
    return result;
  }
  uint64_t v52 = OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_baselineSpacing;
  uint64_t v53 = OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_tickWidth;
  uint64_t v51 = (id *)&v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_nowTickMark];
  uint64_t v50 = OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_extraPadding;
  uint64_t v25 = 0;
  unint64_t v26 = v24 - 1;
  uint64_t v49 = swift_bridgeObjectRetain();
  uint64_t v27 = (id *)(v49 + 40);
  uint64_t v28 = &selRef_contextMenuInteraction_willEndForConfiguration_animator_;
  while (1)
  {
    uint64_t v29 = *(v27 - 1);
    id v30 = *v27;
    id v31 = *v27;
    id v32 = v29;
    double v33 = COERCE_DOUBLE(sub_20A37A190(v25, a1));
    if (v34)
    {
      objc_msgSend(v32, v28[19], 1, v49);
      if (v30)
      {
        objc_msgSend(v31, v28[19], 1);
      }
LABEL_21:

      if (v26 == v25) {
        return (id)swift_bridgeObjectRelease();
      }
      goto LABEL_22;
    }
    double v35 = v33;
    double v36 = *(double *)&v1[v53];
    objc_msgSend(v32, sel_setCenter_, v33 - v36 * 0.5, v9);
    if (!v30) {
      goto LABEL_21;
    }
    id v37 = v31;
    objc_msgSend(v37, sel_sizeToFit);
    id v38 = v37;
    if (objc_msgSend(v1, sel_effectiveUserInterfaceLayoutDirection) == (id)1)
    {
      objc_msgSend(v38, sel_bounds);
      double v36 = CGRectGetWidth(v55) - v36 * 0.5;
    }
    double v39 = *(double *)&v1[v52];
    id result = objc_msgSend(v51[1], sel_font, v49);
    if (!result) {
      break;
    }
    uint64_t v40 = result;
    objc_msgSend(result, sel_ascender);
    double v42 = v41;

    id result = objc_msgSend(v38, sel_font);
    if (!result) {
      goto LABEL_26;
    }
    uint64_t v43 = result;
    double v44 = v35 - v36;
    double v45 = v9 + v39 + v42;
    objc_msgSend(result, sel_ascender);
    double v47 = v46;

    double v48 = v45 - v47 + *(double *)&v1[v50] * 0.5;
    objc_msgSend(v38, sel_frame);
    objc_msgSend(v38, sel_setFrame_, v44, v48);

    uint64_t v28 = &selRef_contextMenuInteraction_willEndForConfiguration_animator_;
    if (v26 == v25) {
      return (id)swift_bridgeObjectRelease();
    }
LABEL_22:
    v27 += 3;
    ++v25;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void sub_20A3797A4()
{
  uint64_t v1 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v64 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for MapScrubberOverlayBar.ViewModel(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v0 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_model;
  swift_beginAccess();
  sub_20A37EB34(v7, (uint64_t)v6, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
  uint64_t v8 = 1;
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v6, 1, v1);
  if (EnumTagSinglePayload != 1)
  {
    sub_20A37E700((uint64_t)v6, (uint64_t)v3);
    uint64_t v8 = *(void *)(*((void *)v3 + 1) + 16) < 2uLL;
    sub_20A37E6A8((uint64_t)v3, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
  }
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_control), sel_setHidden_, v8);
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_elapsedBar), sel_setHidden_, v8);
  uint64_t v10 = (uint64_t *)(v0 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_tickMarks);
  swift_beginAccess();
  uint64_t v11 = *v10;
  uint64_t v12 = *(void *)(*v10 + 16);
  uint64_t v66 = v0;
  uint64_t v67 = v12;
  if (v12)
  {
    uint64_t v64 = v10;
    LODWORD(v65) = v8;
    swift_bridgeObjectRetain_n();
    uint64_t v13 = 32;
    uint64_t v14 = 1;
    while (1)
    {
      uint64_t v15 = v11;
      uint64_t v16 = v11 + v13;
      id v18 = *(void **)(v11 + v13);
      CGRect v17 = *(void **)(v16 + 8);
      id v19 = v17;
      id v20 = v18;
      objc_msgSend(v20, sel_setHidden_, EnumTagSinglePayload == 1);
      if (v17)
      {
        objc_msgSend(v19, sel_setHidden_, EnumTagSinglePayload == 1);
      }
      if (v67 == v14) {
        break;
      }
      v13 += 24;
      BOOL v21 = __OFADD__(v14++, 1);
      uint64_t v11 = v15;
      if (v21)
      {
        __break(1u);
        break;
      }
    }
    swift_bridgeObjectRelease_n();
    uint64_t v0 = v66;
    uint64_t v8 = v65;
    uint64_t v10 = v64;
  }
  uint64_t v22 = v0 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_nowTickMark;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_nowTickMark), sel_setHidden_, v8);
  objc_msgSend(*(id *)(v22 + 8), sel_setHidden_, v8);
  uint64_t v23 = *v10;
  uint64_t v24 = *(void *)(*v10 + 16);
  if (v24)
  {
    uint64_t v65 = v22;
    uint64_t v67 = OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_bar;
    swift_bridgeObjectRetain();
    uint64_t v25 = 0;
    unint64_t v26 = 0;
    while (1)
    {
      uint64_t v27 = *(void **)(v23 + v25 + 32);
      uint64_t v28 = *(void **)(v23 + v25 + 40);
      swift_beginAccess();
      uint64_t v29 = *v10;
      id v30 = v28;
      id v31 = v27;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v10 = v29;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_20A237604();
        uint64_t v29 = v39;
        *uint64_t v10 = v39;
      }
      if (v26 >= *(void *)(v29 + 16)) {
        break;
      }
      *(unsigned char *)(v29 + v25 + 49) = 0;
      swift_endAccess();
      if (v28)
      {
        id v33 = v30;
        objc_msgSend(v33, sel_frame);
        double MinX = CGRectGetMinX(v68);
        double v35 = *(void **)(v66 + v67);
        objc_msgSend(v35, sel_frame);
        if (MinX < CGRectGetMinX(v69)
          || (objc_msgSend(v33, sel_frame),
              double MaxX = CGRectGetMaxX(v70),
              objc_msgSend(v35, sel_frame),
              CGRectGetMaxX(v71) < MaxX))
        {
          objc_msgSend(v33, sel_setHidden_, 1);
          swift_beginAccess();
          uint64_t v37 = *v10;
          char v38 = swift_isUniquelyReferenced_nonNull_native();
          *uint64_t v10 = v37;
          if ((v38 & 1) == 0)
          {
            sub_20A237604();
            uint64_t v37 = v40;
            *uint64_t v10 = v40;
          }
          if (v26 >= *(void *)(v37 + 16)) {
            goto LABEL_42;
          }
          *(unsigned char *)(v37 + v25 + 49) = 1;
          swift_endAccess();
        }
      }
      ++v26;

      v25 += 24;
      if (v24 == v26)
      {
        swift_bridgeObjectRelease();
        uint64_t v22 = v65;
        uint64_t v0 = v66;
        goto LABEL_27;
      }
    }
    __break(1u);
LABEL_42:
    __break(1u);
  }
  else
  {
LABEL_27:
    sub_20A37B338();
    objc_msgSend(*(id *)(v22 + 8), sel_frame);
    uint64_t v45 = *v10;
    uint64_t v46 = *(void *)(v45 + 16);
    if (v46)
    {
      double v47 = UIEdgeInsetsInsetRect(v41, v42, v43, v44, *(double *)(v0 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_overlappingLabelInsets), *(double *)(v0 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_overlappingLabelInsets + 8));
      CGFloat v49 = v48;
      CGFloat v51 = v50;
      CGFloat v53 = v52;
      CGRect v54 = *(void **)(v0 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_bar);
      swift_bridgeObjectRetain();
      uint64_t v55 = v46 - 1;
      for (i = (id *)(v45 + 40); ; i += 3)
      {
        char v57 = *(i - 1);
        id v58 = *i;
        id v59 = *i;
        id v60 = v57;
        objc_msgSend(v60, sel_frame);
        double v61 = CGRectGetMinX(v72);
        objc_msgSend(v54, sel_frame);
        if (v61 <= CGRectGetMinX(v73)
          || (objc_msgSend(v60, sel_frame),
              double v62 = CGRectGetMaxX(v74),
              objc_msgSend(v54, sel_frame),
              CGRectGetMaxX(v75) <= v62))
        {
          objc_msgSend(v60, sel_setHidden_, 1);
        }
        if (v58)
        {
          id v63 = v59;
          objc_msgSend(v63, sel_frame);
          v77.origin.x = v47;
          v77.origin.y = v49;
          v77.size.width = v51;
          v77.size.height = v53;
          if (CGRectIntersectsRect(v76, v77)) {
            objc_msgSend(v63, sel_setHidden_, 1);
          }
        }
        else
        {
          id v63 = v60;
        }

        if (!v55) {
          break;
        }
        --v55;
      }
      swift_bridgeObjectRelease();
    }
  }
}

void sub_20A379DB0(double a1)
{
  sub_20A379298(a1);
  uint64_t v2 = v1 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_tickMarks;
  OUTLINED_FUNCTION_4();
  if (*(void *)(*(void *)v2 + 16))
  {
    uint64_t v3 = *(void **)(*(void *)v2 + 40);
    if (v3)
    {
      id v4 = v3;
      objc_msgSend(v4, sel_frame);
      CGRectGetMinY(v7);
      id v5 = objc_msgSend(v4, sel_font);
      if (v5)
      {
        uint64_t v6 = v5;
        objc_msgSend(v5, sel_ascender);
      }
      else
      {
        __break(1u);
      }
    }
  }
}

id sub_20A379F10(uint64_t a1, CGFloat a2, CGFloat a3)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  OUTLINED_FUNCTION_0_36();
  CGRect v15 = CGRectInset(v14, 0.0, -*(double *)&v3[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_verticalHitAreaIncrease]);
  v13.x = a2;
  v13.y = a3;
  if (!CGRectContainsPoint(v15, v13)) {
    return 0;
  }
  OUTLINED_FUNCTION_0_36();
  CGRectGetMinX(v16);
  OUTLINED_FUNCTION_0_36();
  CGRectGetMaxX(v17);
  sub_20A38A350();
  double v9 = v8;
  OUTLINED_FUNCTION_0_36();
  CGRectGetMinY(v18);
  OUTLINED_FUNCTION_0_36();
  CGRectGetMaxY(v19);
  sub_20A38A350();
  v12.receiver = v3;
  v12.super_class = ObjectType;
  return objc_msgSendSuper2(&v12, sel_hitTest_withEvent_, a1, v9, v10);
}

id sub_20A37A08C(double a1)
{
  id v3 = objc_msgSend(v1, sel_effectiveUserInterfaceLayoutDirection);
  id v4 = *(void **)&v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_elapsedBar];
  if (v3 == (id)1)
  {
    double v5 = sub_20A377F78() * a1;
    double v6 = *(double *)&v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_barHeight];
    double v7 = v6 * 0.5;
    objc_msgSend(v4, sel_setFrame_, v5, v6 * 0.5, a1 - sub_20A377F78() * a1, v6);
  }
  else
  {
    double v6 = *(double *)&v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_barHeight];
    double v7 = v6 * 0.5;
    objc_msgSend(v4, sel_setFrame_, 0.0, v6 * 0.5, sub_20A377F78() * a1, v6);
  }
  double v8 = *(void **)&v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_control];
  double v9 = v7 + (a1 - v6) * sub_20A377F78();
  return objc_msgSend(v8, sel_setCenter_, v9, v6);
}

uint64_t sub_20A37A190(uint64_t a1, double a2)
{
  id v3 = v2;
  uint64_t v6 = sub_20A389550();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  double v9 = &v30[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = type metadata accessor for MapScrubberOverlayBar.ViewModel(0);
  MEMORY[0x270FA5388](v10 - 8);
  objc_super v12 = &v30[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  MEMORY[0x270FA5388](v13);
  CGRect v15 = &v30[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = (uint64_t)&v3[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_model];
  swift_beginAccess();
  sub_20A37EB34(v16, (uint64_t)v12, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13) != 1)
  {
    sub_20A37E700((uint64_t)v12, (uint64_t)v15);
    uint64_t v23 = *(void *)v15;
    if (*(void *)(*(void *)v15 + 16) > a1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267625A90);
      uint64_t result = sub_20A389440();
      if (a1 < 0)
      {
        __break(1u);
      }
      else if (*(void *)(v23 + 16) > (unint64_t)a1)
      {
        double v26 = v25;
        (*(void (**)(unsigned char *, unint64_t, uint64_t))(v7 + 16))(v9, v23+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * a1, v6);
        sub_20A389440();
        double v28 = v27;
        (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
        double v19 = v28 / v26 * a2;
        id v29 = objc_msgSend(v3, sel_effectiveUserInterfaceLayoutDirection);
        sub_20A37E6A8((uint64_t)v15, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
        double v21 = a2 - v19;
        BOOL v22 = v29 == (id)1;
        goto LABEL_8;
      }
      __break(1u);
      return result;
    }
    sub_20A37E6A8((uint64_t)v15, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
    return 0;
  }
  sub_20A37E6A8((uint64_t)v12, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
  CGRect v17 = &v3[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_tickMarks];
  swift_beginAccess();
  unint64_t v18 = *(void *)(*(void *)v17 + 16);
  if (v18 < 2) {
    return 0;
  }
  double v19 = a2 / (double)(uint64_t)(v18 - 1) * (double)a1
      + *(double *)&v3[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_tickWidth] * 0.5;
  id v20 = objc_msgSend(v3, sel_effectiveUserInterfaceLayoutDirection);
  double v21 = a2 - v19;
  BOOL v22 = v20 == (id)1;
LABEL_8:
  if (!v22) {
    double v21 = v19;
  }
  return *(void *)&v21;
}

void sub_20A37A514()
{
  objc_msgSend(v0, sel_effectiveUserInterfaceLayoutDirection);
  objc_msgSend(v0, sel_bounds);
  CGRectGetWidth(v1);
}

void sub_20A37A578(void *a1, char a2)
{
  id v4 = self;
  if (a2)
  {
    id v5 = objc_msgSend(v4, sel_blackColor);
    id v6 = objc_msgSend(v5, sel_colorWithAlphaComponent_, 0.65);
  }
  else
  {
    id v6 = objc_msgSend(v4, sel_secondarySystemFillColor);
  }
  objc_msgSend(a1, sel_setBackgroundColor_, v6);

  objc_msgSend(a1, sel__setCornerRadius_, 0.5);
  objc_msgSend(a1, sel_bounds);
  objc_msgSend(a1, sel_setBounds_);
  if ((a2 & 1) == 0)
  {
    id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F157E8]), sel_init);
    id v7 = objc_msgSend(a1, sel_layer);
    objc_msgSend(v7, sel_addSublayer_, v30);

    id v8 = objc_msgSend(self, sel_secondarySystemFillColor);
    id v9 = objc_msgSend(v8, sel_CGColor);

    objc_msgSend(v30, sel_setBackgroundColor_, v9);
    objc_msgSend(a1, sel__cornerRadius);
    objc_msgSend(v30, sel_setCornerRadius_);
    uint64_t v10 = (void *)sub_20A38B5D0();
    objc_msgSend(v30, sel_setCompositingFilter_, v10);

    objc_msgSend(a1, sel_bounds);
    objc_msgSend(v30, sel_bounds);
    objc_msgSend(v30, sel_setBounds_);
    id v11 = objc_msgSend(a1, sel_layer);
    objc_msgSend(v11, sel_bounds);
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;

    v32.origin.x = v13;
    v32.origin.y = v15;
    v32.size.width = v17;
    v32.size.height = v19;
    double MidX = CGRectGetMidX(v32);
    id v21 = objc_msgSend(a1, sel_layer);
    objc_msgSend(v21, sel_bounds);
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;

    v33.origin.x = v23;
    v33.origin.y = v25;
    v33.size.width = v27;
    v33.size.height = v29;
    objc_msgSend(v30, sel_setPosition_, MidX, CGRectGetMidY(v33));
  }
}

uint64_t sub_20A37A8CC()
{
  uint64_t v1 = type metadata accessor for MapScrubberOverlayBar.ViewModel(0);
  MEMORY[0x270FA5388](v1 - 8);
  id v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = v0 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_model;
  swift_beginAccess();
  sub_20A37EB34(v4, (uint64_t)v3, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
  uint64_t v5 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v5) == 1) {
    return 0;
  }
  sub_20A37E6A8((uint64_t)v3, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
  uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_nowLabel);
  swift_bridgeObjectRetain();
  return v6;
}

void sub_20A37A9E4(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = sub_20A38B350();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_20A3891B0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  CGFloat v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_20A1CC764(0, (unint64_t *)&qword_26AC3D238);
    id v16 = sub_20A1DA950((void *)*MEMORY[0x263F83590], 0, 0, 1, 0, 0, *MEMORY[0x263F81800]);
    objc_msgSend(a1, sel_setFont_, v16);

    sub_20A3462B4(a2, a3, a1);
    id v17 = objc_msgSend(self, sel_labelColor);
    id v23 = objc_msgSend(v17, sel_colorWithAlphaComponent_, 0.65);

    objc_msgSend(a1, sel_setTextColor_, v23);
    double v18 = v23;
  }
  else
  {
    sub_20A38B330();
    sub_20A38AFA0();
    sub_20A38B340();
    swift_release();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_20A1CC764(0, (unint64_t *)&qword_26AC3D238);
    id v19 = sub_20A1DA950((void *)*MEMORY[0x263F83590], 0, 0, 1, 0, 0, *MEMORY[0x263F81800]);
    id v20 = (void *)sub_20A3891A0();

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    objc_msgSend(a1, sel_setAttributedText_, v20);

    id v21 = objc_msgSend(self, sel_secondaryLabelColor);
    objc_msgSend(a1, sel_setTextColor_, v21);
  }
}

id sub_20A37AD44(uint64_t a1)
{
  uint64_t v3 = sub_20A389550();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  id v17 = v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_20A37B0A0(v7, v8, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20A37EC1C);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = (uint64_t *)&v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_tickMarks];
  swift_beginAccess();
  *uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  uint64_t v11 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16))(v6, a1 + *(int *)(v11 + 28), v3);
  sub_20A377210((uint64_t)v6);
  id v12 = *(id *)&v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_nowTickMark + 8];
  uint64_t v13 = sub_20A37A8CC();
  sub_20A2B811C(v13, v14, v12);

  return objc_msgSend(v1, sel_bringSubviewToFront_, *(void *)&v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_control]);
}

uint64_t sub_20A37AEF4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_20A376F68(0, 6, v1);
  uint64_t v3 = (uint64_t *)&v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_tickMarks];
  swift_beginAccess();
  uint64_t *v3 = v2;
  return swift_bridgeObjectRelease();
}

id sub_20A37AF70(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  sub_20A1CC764(0, (unint64_t *)&qword_26AC3D238);
  id v8 = sub_20A1DA950((void *)*MEMORY[0x263F83590], 0, 0, 1, 0, 0, *MEMORY[0x263F81840]);
  objc_msgSend(v7, sel_setFont_, v8);

  sub_20A37A9E4(v7, a1, a2, 0);
  objc_msgSend(a4, sel_addSubview_, v7);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  sub_20A37A578(v9, 0);
  objc_msgSend(a4, sel_addSubview_, v9);
  return v9;
}

uint64_t sub_20A37B0A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  unint64_t v5 = *(void *)(a1 + 16);
  unint64_t v6 = *(void *)(a2 + 16);
  if (v6 >= v5) {
    int64_t v7 = *(void *)(a1 + 16);
  }
  else {
    int64_t v7 = *(void *)(a2 + 16);
  }
  uint64_t v45 = MEMORY[0x263F8EE78];
  sub_20A2C0E58(0, v7, 0);
  unint64_t v40 = v6;
  unint64_t v41 = v5;
  uint64_t v38 = a2;
  uint64_t v39 = a1;
  int64_t v37 = v7;
  if (v7)
  {
    id v8 = (unsigned __int8 *)(a2 + 32);
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v10 = (uint64_t *)(a1 + 40);
    unint64_t v11 = v6;
    while (v5)
    {
      if (!v11) {
        goto LABEL_23;
      }
      uint64_t v12 = *(v10 - 1);
      uint64_t v13 = *v10;
      uint64_t v14 = *v8;
      swift_bridgeObjectRetain();
      uint64_t v15 = a3(v12, v13, v14);
      uint64_t v43 = v16;
      uint64_t v44 = v15;
      __int16 v18 = v17;
      uint64_t result = swift_bridgeObjectRelease();
      unint64_t v19 = *(void *)(v45 + 16);
      unint64_t v20 = *(void *)(v45 + 24);
      if (v19 >= v20 >> 1) {
        uint64_t result = sub_20A2C0E58(v20 > 1, v19 + 1, 1);
      }
      *(void *)(v45 + 16) = v19 + 1;
      uint64_t v21 = v45 + 24 * v19;
      *(void *)(v21 + 32) = v44;
      *(void *)(v21 + 40) = v43;
      --v11;
      *(unsigned char *)(v21 + 48) = v18;
      *(unsigned char *)(v21 + 49) = HIBYTE(v18) & 1;
      --v5;
      ++v8;
      v10 += 2;
      if (!--v7) {
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_23:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
LABEL_13:
    unint64_t v23 = v40;
    unint64_t v22 = v41;
    if (v41 <= v40)
    {
LABEL_21:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v45;
    }
    unint64_t v24 = v37;
    CGFloat v25 = (uint64_t *)(v39 + 16 * v37 + 40);
    while (v24 < v22)
    {
      if (v23 == v24) {
        goto LABEL_21;
      }
      if (v24 >= v23) {
        goto LABEL_25;
      }
      uint64_t v26 = *(v25 - 1);
      uint64_t v27 = *v25;
      uint64_t v28 = *(unsigned __int8 *)(v38 + 32 + v24);
      swift_bridgeObjectRetain();
      uint64_t v29 = a3(v26, v27, v28);
      uint64_t v31 = v30;
      __int16 v33 = v32;
      uint64_t result = swift_bridgeObjectRelease();
      unint64_t v35 = *(void *)(v45 + 16);
      unint64_t v34 = *(void *)(v45 + 24);
      if (v35 >= v34 >> 1) {
        uint64_t result = sub_20A2C0E58(v34 > 1, v35 + 1, 1);
      }
      ++v24;
      *(void *)(v45 + 16) = v35 + 1;
      uint64_t v36 = v45 + 24 * v35;
      *(void *)(v36 + 32) = v29;
      *(void *)(v36 + 40) = v31;
      *(unsigned char *)(v36 + 48) = v33;
      *(unsigned char *)(v36 + 49) = HIBYTE(v33) & 1;
      v25 += 2;
      unint64_t v23 = v40;
      unint64_t v22 = v41;
      if (v41 == v24) {
        goto LABEL_21;
      }
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_20A37B338()
{
  if (sub_20A37B3C8())
  {
    unsigned __int8 v0 = 0;
    uint64_t v1 = 2;
    while (1)
    {
      if (v0 > 2u)
      {
        uint64_t result = sub_20A37B724(v1);
        if (__OFADD__(v1++, 1))
        {
          __break(1u);
          return result;
        }
      }
      else
      {
        sub_20A37B630(++v0);
      }
      uint64_t result = sub_20A37B3C8();
      if ((result & 1) == 0) {
        return result;
      }
    }
  }
  return sub_20A37B630(0);
}

uint64_t sub_20A37B3C8()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_tickMarks);
  swift_beginAccess();
  uint64_t v2 = *(void *)(*v1 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = (double *)(v0 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_overlappingLabelInsets);
  uint64_t v4 = *v1 + 32;
  uint64_t v36 = *v1;
  swift_bridgeObjectRetain();
  unint64_t v5 = 0;
  while (1)
  {
    if (*(unsigned char *)(v4 + 17) == 1) {
      goto LABEL_19;
    }
    unint64_t v6 = *(void **)v4;
    int64_t v7 = *(void **)(v4 + 8);
    if (v5)
    {
      if (!v7) {
        goto LABEL_19;
      }
      id v8 = v7;
      id v9 = v6;
      uint64_t v10 = v5;
      goto LABEL_12;
    }
    if (!v7)
    {
      unint64_t v5 = 0;
      goto LABEL_19;
    }
    id v8 = v7;
    id v11 = v6;
    if (objc_msgSend(v8, sel_isHidden)) {
      break;
    }
    uint64_t v10 = v8;
    unint64_t v5 = v7;
LABEL_12:
    sub_20A1CC764(0, &qword_267625AE8);
    id v12 = v8;
    id v13 = v10;
    char v14 = sub_20A38C100();

    if ((v14 & 1) == 0) {
      goto LABEL_14;
    }

LABEL_19:
    v4 += 24;
    if (!--v2)
    {
      swift_bridgeObjectRelease();

      return 0;
    }
  }

  id v12 = v8;
  unint64_t v5 = 0;
LABEL_14:
  if ((objc_msgSend(v12, sel_isHidden, v36) & 1) != 0 || !v5)
  {

    goto LABEL_19;
  }
  objc_msgSend(v5, sel_frame);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  objc_msgSend(v12, sel_frame);
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  v38.origin.x = UIEdgeInsetsInsetRect(v16, v18, v20, v22, *v3, v3[1]);
  v38.origin.y = v31;
  v38.size.width = v32;
  v38.size.height = v33;
  v37.origin.x = v24;
  v37.origin.y = v26;
  v37.size.width = v28;
  v37.size.height = v30;
  BOOL v34 = CGRectIntersectsRect(v37, v38);

  if (!v34)
  {
    unint64_t v5 = v12;
    goto LABEL_19;
  }

  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_20A37B630(unsigned __int8 a1)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_tickMarks);
  uint64_t result = swift_beginAccess();
  uint64_t v5 = *v3;
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    unsigned int v7 = a1;
    swift_bridgeObjectRetain();
    id v8 = (unsigned __int8 *)(v5 + 48);
    do
    {
      id v9 = (void *)*((void *)v8 - 1);
      unsigned int v10 = *v8;
      if (v10 != 4 && v9 != 0)
      {
        id v12 = *((id *)v8 - 2);
        id v13 = v9;
        if ((objc_msgSend(v13, sel_isHidden) & 1) == 0 && v10 < v7) {
          objc_msgSend(v13, sel_setHidden_, 1);
        }
      }
      v8 += 24;
      --v6;
    }
    while (v6);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_20A37B724(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_tickMarks);
  uint64_t result = swift_beginAccess();
  uint64_t v5 = *v3;
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = 0;
    id v8 = (unsigned char *)(v5 + 49);
    do
    {
      id v9 = *(void **)(v8 - 9);
      if (v9 && *v8 != 1)
      {
        if (a1 == -1)
        {
          int v11 = 1;
        }
        else
        {
          if (a1) {
            BOOL v10 = v7 % a1 == 0;
          }
          else {
            BOOL v10 = v7 == 0;
          }
          int v11 = v10;
        }
        objc_msgSend(v9, sel_setHidden_, v11 ^ 1u);
      }
      ++v7;
      v8 += 24;
    }
    while (v6 != v7);
    return swift_bridgeObjectRelease();
  }
  return result;
}

id sub_20A37B800()
{
  sub_20A38A350();
  sub_20A378290();
  objc_msgSend(v0, sel_bounds);
  return sub_20A37A08C(v1);
}

void sub_20A37B850(void *a1)
{
  uint64_t v3 = (char *)objc_msgSend(a1, sel_state);
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if (v3 == (char *)3)
    {
      objc_msgSend(v1, sel_sendActionsForControlEvents_, 64);
    }
  }
  else
  {
    if (objc_msgSend(a1, sel_state) == (id)1) {
      objc_msgSend(v1, sel_sendActionsForControlEvents_, 1);
    }
    sub_20A37A514();
    sub_20A37B800();
    objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_nowTickMark], sel_center);
    sub_20A33AE4C(v4);
  }
}

void sub_20A37B998()
{
}

uint64_t sub_20A37BB04()
{
  return type metadata accessor for MapScrubberOverlayBar(0);
}

uint64_t type metadata accessor for MapScrubberOverlayBar(uint64_t a1)
{
  return sub_20A1BBBE4(a1, (uint64_t *)&unk_267628DC8);
}

uint64_t sub_20A37BB2C()
{
  uint64_t result = type metadata accessor for MapScrubberOverlayBar.ViewModel(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_20A389550();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t type metadata accessor for MapScrubberOverlayBar.ViewModel(uint64_t a1)
{
  return sub_20A1BBBE4(a1, (uint64_t *)&unk_267628DD8);
}

id sub_20A37BCC0()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_control), sel_accessibilityActivationPoint);
}

uint64_t sub_20A37BCDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v82 = a1;
  uint64_t v83 = a2;
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_267627458);
  MEMORY[0x270FA5388](v80);
  uint64_t v78 = (uint64_t)&v66 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC39100);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v76 = (uint64_t)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  CGRect v77 = (char *)&v66 - v7;
  MEMORY[0x270FA5388](v8);
  uint64_t v79 = (uint64_t)&v66 - v9;
  MEMORY[0x270FA5388](v10);
  uint64_t v81 = (uint64_t)&v66 - v11;
  MEMORY[0x270FA5388](v12);
  char v14 = (char *)&v66 - v13;
  uint64_t v15 = sub_20A389550();
  uint64_t v84 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  double v17 = (char *)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  double v20 = (char *)&v66 - v19;
  uint64_t v21 = type metadata accessor for MapScrubberOverlayBar.ViewModel(0);
  MEMORY[0x270FA5388](v21 - 8);
  double v23 = (char *)&v66 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  MEMORY[0x270FA5388](v24);
  CGFloat v26 = (char *)&v66 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  double v29 = (uint64_t *)((char *)&v66 - v28);
  uint64_t v30 = v2 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_model;
  swift_beginAccess();
  sub_20A37EB34(v30, (uint64_t)v23, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
  if (__swift_getEnumTagSinglePayload((uint64_t)v23, 1, v24) != 1)
  {
    CGRect v74 = v14;
    CGRect v75 = v26;
    uint64_t v72 = v2;
    CGRect v73 = v17;
    sub_20A37E700((uint64_t)v23, (uint64_t)v29);
    CGFloat v33 = (char *)v29 + *(int *)(v24 + 32);
    uint64_t v34 = v82;
    sub_20A3770C0(v82, (uint64_t)v20);
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_267625A90);
    uint64_t v36 = &v33[*(int *)(v35 + 36)];
    LOBYTE(v33) = sub_20A3894D0();
    uint64_t v37 = v84 + 8;
    CGRect v38 = *(uint64_t (**)(char *, uint64_t))(v84 + 8);
    uint64_t v39 = v38(v20, v15);
    if (v33)
    {
      uint64_t v40 = v83;
      sub_20A389450();
      uint64_t v41 = (uint64_t)v29;
LABEL_5:
      sub_20A37E6A8(v41, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
      uint64_t v31 = v40;
LABEL_24:
      uint64_t v32 = 0;
      return __swift_storeEnumTagSinglePayload(v31, v32, 1, v15);
    }
    uint64_t v68 = v24;
    CGRect v69 = (void (*)(char *, uint64_t))v38;
    uint64_t v70 = v37;
    CGRect v71 = v36;
    uint64_t v42 = *v29;
    MEMORY[0x270FA5388](v39);
    *(&v66 - 2) = v34;
    swift_bridgeObjectRetain();
    uint64_t v43 = v81;
    sub_20A27A39C((uint64_t (*)(uint64_t))sub_20A37EBF0, v42, v81);
    swift_bridgeObjectRelease();
    uint64_t v44 = (uint64_t)v75;
    sub_20A37EB34((uint64_t)v29, (uint64_t)v75, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v43, 1, v15);
    uint64_t v46 = (uint64_t)v29;
    uint64_t v67 = v20;
    if (EnumTagSinglePayload == 1)
    {
      uint64_t v47 = (uint64_t)v74;
      sub_20A37C7F4(v44 + *(int *)(v68 + 32) + (uint64_t)*(int *)(v35 + 36), (uint64_t)v74);
      sub_20A37E6A8(v44, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
      sub_20A1D4270(v43, &qword_26AC39100);
    }
    else
    {
      sub_20A37E6A8(v44, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
      uint64_t v47 = (uint64_t)v74;
      (*(void (**)(char *, uint64_t, uint64_t))(v84 + 32))(v74, v43, v15);
      __swift_storeEnumTagSinglePayload(v47, 0, 1, v15);
    }
    uint64_t v49 = v79;
    uint64_t v48 = v80;
    double v50 = v69;
    sub_20A1DC8A4(v47, v79, &qword_26AC39100);
    if (__swift_getEnumTagSinglePayload(v49, 1, v15) == 1)
    {
      sub_20A1D4270(v49, &qword_26AC39100);
    }
    else
    {
      CGFloat v51 = v73;
      (*(void (**)(char *, uint64_t, uint64_t))(v84 + 32))(v73, v49, v15);
      uint64_t v52 = v46 + *(int *)(v68 + 28);
      if (sub_20A389480())
      {
        char v53 = sub_20A389480();
        v50(v51, v15);
        if (v53)
        {
          sub_20A1D4270(v47, &qword_26AC39100);
          uint64_t v40 = v83;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v84 + 16))(v83, v52, v15);
          uint64_t v41 = v46;
          goto LABEL_5;
        }
      }
      else
      {
        v50(v51, v15);
      }
    }
    uint64_t v82 = v46;
    uint64_t v54 = v84;
    uint64_t v55 = (uint64_t)v77;
    (*(void (**)(char *, char *, uint64_t))(v84 + 16))(v77, v71, v15);
    __swift_storeEnumTagSinglePayload(v55, 0, 1, v15);
    uint64_t v56 = *(int *)(v48 + 48);
    uint64_t v57 = v54;
    uint64_t v58 = v78;
    uint64_t v59 = v78 + v56;
    sub_20A1DC8A4(v47, v78, &qword_26AC39100);
    sub_20A1DC8A4(v55, v59, &qword_26AC39100);
    if (__swift_getEnumTagSinglePayload(v58, 1, v15) == 1)
    {
      sub_20A1D4270(v55, &qword_26AC39100);
      if (__swift_getEnumTagSinglePayload(v59, 1, v15) == 1)
      {
        sub_20A1D4270(v58, &qword_26AC39100);
        uint64_t v60 = v82;
LABEL_23:
        uint64_t v65 = v83;
        sub_20A389450();
        sub_20A1D4270(v47, &qword_26AC39100);
        sub_20A37E6A8(v60, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
        uint64_t v31 = v65;
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v61 = v76;
      sub_20A1DC8A4(v58, v76, &qword_26AC39100);
      if (__swift_getEnumTagSinglePayload(v59, 1, v15) != 1)
      {
        id v63 = v67;
        (*(void (**)(char *, uint64_t, uint64_t))(v57 + 32))(v67, v59, v15);
        sub_20A2923EC((unint64_t *)&qword_267625F60);
        char v64 = sub_20A38B5C0();
        v50(v63, v15);
        sub_20A1D4270(v55, &qword_26AC39100);
        v50((char *)v61, v15);
        sub_20A1D4270(v58, &qword_26AC39100);
        uint64_t v60 = v82;
        if (v64) {
          goto LABEL_23;
        }
LABEL_21:
        sub_20A37E6A8(v60, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
        return sub_20A37EB88(v47, v83);
      }
      sub_20A1D4270(v55, &qword_26AC39100);
      v50((char *)v61, v15);
    }
    sub_20A1D4270(v58, &qword_267627458);
    uint64_t v60 = v82;
    goto LABEL_21;
  }
  sub_20A37E6A8((uint64_t)v23, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
  uint64_t v31 = v83;
  uint64_t v32 = 1;
  return __swift_storeEnumTagSinglePayload(v31, v32, 1, v15);
}

uint64_t sub_20A37C614(void (*a1)(char *))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC39100);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_16_2();
  uint64_t v5 = sub_20A389550();
  OUTLINED_FUNCTION_2_3();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v18 - v12;
  char v14 = &v1[OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_current];
  OUTLINED_FUNCTION_4();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v15(v10, v14, v5);
  a1(v10);
  uint64_t v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v10, v5);
  if (__swift_getEnumTagSinglePayload(v2, 1, v5) == 1) {
    return sub_20A1D4270(v2, &qword_26AC39100);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v13, v2, v5);
  v15(v10, v13, v5);
  sub_20A377210((uint64_t)v10);
  objc_msgSend(v1, sel_sendActionsForControlEvents_, 4096);
  return ((uint64_t (*)(char *, uint64_t))v16)(v13, v5);
}

uint64_t sub_20A37C7F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v57 = a1;
  uint64_t v58 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC39100);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v54 = (uint64_t)v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v56 = (void *)((char *)v51 - v6);
  MEMORY[0x270FA5388](v7);
  uint64_t v55 = (char *)v51 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267625A90);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_20A389550();
  uint64_t v59 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  char v14 = (char *)v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  double v17 = (char *)v51 - v16;
  uint64_t v18 = type metadata accessor for MapScrubberOverlayBar.ViewModel(0);
  MEMORY[0x270FA5388](v18 - 8);
  double v20 = (char *)v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  MEMORY[0x270FA5388](v21);
  double v23 = (char *)v51 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  CGFloat v26 = (void *)((char *)v51 - v25);
  uint64_t v27 = v2 + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_model;
  swift_beginAccess();
  sub_20A37EB34(v27, (uint64_t)v20, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v21) == 1)
  {
    sub_20A37E6A8((uint64_t)v20, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
    uint64_t v28 = v58;
    uint64_t v29 = 1;
    return __swift_storeEnumTagSinglePayload(v28, v29, 1, v12);
  }
  uint64_t v52 = v14;
  char v53 = v23;
  v51[1] = v2;
  sub_20A37E700((uint64_t)v20, (uint64_t)v26);
  uint64_t v30 = (uint64_t)v26 + *(int *)(v21 + 32);
  uint64_t v31 = v57;
  sub_20A3770C0(v57, (uint64_t)v17);
  uint64_t v32 = v21;
  char v33 = sub_20A3894D0();
  uint64_t v34 = *(uint64_t (**)(char *, uint64_t))(v59 + 8);
  uint64_t v35 = v34(v17, v12);
  if (v33)
  {
    sub_20A1DC8A4(v30, (uint64_t)v11, &qword_267625A90);
    sub_20A37E6A8((uint64_t)v26, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
    uint64_t v36 = v58;
    (*(void (**)(uint64_t, char *, uint64_t))(v59 + 16))(v58, v11, v12);
    sub_20A1D4270((uint64_t)v11, &qword_267625A90);
    uint64_t v28 = v36;
LABEL_5:
    uint64_t v29 = 0;
    return __swift_storeEnumTagSinglePayload(v28, v29, 1, v12);
  }
  v51[0] = v34;
  uint64_t v38 = *v26;
  MEMORY[0x270FA5388](v35);
  v51[-2] = v31;
  uint64_t v60 = v38;
  swift_bridgeObjectRetain();
  uint64_t v39 = sub_20A37E764((uint64_t (*)(uint64_t))sub_20A37EAA4, (uint64_t)&v51[-4], v38);
  MEMORY[0x270FA5388](v39);
  v51[-2] = &v60;
  uint64_t v40 = v56;
  sub_20A37E9F4((void *(*)(void *__return_ptr, uint64_t *))sub_20A37EB14, v41, v42, v56);
  swift_bridgeObjectRelease();
  uint64_t v43 = (uint64_t)v53;
  sub_20A37EB34((uint64_t)v26, (uint64_t)v53, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
  if (__swift_getEnumTagSinglePayload((uint64_t)v40, 1, v12) == 1)
  {
    uint64_t v44 = (uint64_t)v55;
    sub_20A37BCDC(v43 + *(int *)(v32 + 32));
    sub_20A37E6A8(v43, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
    sub_20A1D4270((uint64_t)v40, &qword_26AC39100);
    uint64_t v45 = v59;
  }
  else
  {
    sub_20A37E6A8(v43, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
    uint64_t v45 = v59;
    uint64_t v44 = (uint64_t)v55;
    (*(void (**)(char *, void *, uint64_t))(v59 + 32))(v55, v40, v12);
    __swift_storeEnumTagSinglePayload(v44, 0, 1, v12);
  }
  uint64_t v46 = v54;
  uint64_t v47 = v52;
  sub_20A1DC8A4(v44, v54, &qword_26AC39100);
  if (__swift_getEnumTagSinglePayload(v46, 1, v12) == 1)
  {
    sub_20A37E6A8((uint64_t)v26, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
    sub_20A1D4270(v46, &qword_26AC39100);
LABEL_16:
    uint64_t v50 = v58;
    return sub_20A37EB88(v44, v50);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v45 + 32))(v47, v46, v12);
  uint64_t v48 = (char *)v26 + *(int *)(v32 + 28);
  if ((sub_20A389470() & 1) == 0)
  {
    ((void (*)(char *, uint64_t))v51[0])(v47, v12);
    sub_20A37E6A8((uint64_t)v26, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
    goto LABEL_16;
  }
  char v49 = sub_20A389470();
  ((void (*)(char *, uint64_t))v51[0])(v47, v12);
  uint64_t v50 = v58;
  if (v49)
  {
    sub_20A1D4270(v44, &qword_26AC39100);
    (*(void (**)(uint64_t, char *, uint64_t))(v45 + 16))(v50, v48, v12);
    sub_20A37E6A8((uint64_t)v26, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
    uint64_t v28 = v50;
    goto LABEL_5;
  }
  sub_20A37E6A8((uint64_t)v26, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
  return sub_20A37EB88(v44, v50);
}

uint64_t sub_20A37CF48(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  id v5 = v3;
  id v6 = v4;
  return a1;
}

uint64_t assignWithCopy for MapScrubberOverlayBar.Tickmark(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a1 + 8);
  uint64_t v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for MapScrubberOverlayBar.Tickmark(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for MapScrubberOverlayBar.Tickmark(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 18))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MapScrubberOverlayBar.Tickmark(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 18) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 18) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MapScrubberOverlayBar.Tickmark()
{
  return &type metadata for MapScrubberOverlayBar.Tickmark;
}

uint64_t *sub_20A37D0E0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = (int *)type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, (uint64_t)v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v9 = a2[1];
      *a1 = *a2;
      a1[1] = v9;
      a1[2] = a2[2];
      uint64_t v10 = v7[7];
      uint64_t v19 = (char *)a1 + v10;
      uint64_t v11 = (char *)a2 + v10;
      uint64_t v12 = sub_20A389550();
      uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v13(v19, v11, v12);
      uint64_t v14 = v7[8];
      uint64_t v15 = (char *)a1 + v14;
      uint64_t v16 = (char *)a2 + v14;
      v13((char *)a1 + v14, (char *)a2 + v14, v12);
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267625A90);
      v13(&v15[*(int *)(v17 + 36)], &v16[*(int *)(v17 + 36)], v12);
      *((unsigned char *)a1 + v7[9]) = *((unsigned char *)a2 + v7[9]);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, (uint64_t)v7);
    }
  }
  return a1;
}

uint64_t type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(uint64_t a1)
{
  return sub_20A1BBBE4(a1, (uint64_t *)&unk_267628DE8);
}

uint64_t sub_20A37D2B8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  uint64_t result = __swift_getEnumTagSinglePayload(a1, 1, v2);
  if (!result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = a1 + *(int *)(v2 + 28);
    uint64_t v5 = sub_20A389550();
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v5 - 8), v4, v5);
    uint64_t v6 = a1 + *(int *)(v2 + 32);
    v8(v6, v5);
    uint64_t v7 = v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267625A90) + 36);
    return ((uint64_t (*)(uint64_t, uint64_t))v8)(v7, v5);
  }
  return result;
}

void *sub_20A37D3D4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, (uint64_t)v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    a1[2] = a2[2];
    uint64_t v8 = v6[7];
    uint64_t v17 = (char *)a1 + v8;
    uint64_t v9 = (char *)a2 + v8;
    uint64_t v10 = sub_20A389550();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v17, v9, v10);
    uint64_t v12 = v6[8];
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    v11((char *)a1 + v12, (char *)a2 + v12, v10);
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267625A90);
    v11(&v13[*(int *)(v15 + 36)], &v14[*(int *)(v15 + 36)], v10);
    *((unsigned char *)a1 + v6[9]) = *((unsigned char *)a2 + v6[9]);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, (uint64_t)v6);
  }
  return a1;
}

char *sub_20A37D550(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, (uint64_t)v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, (uint64_t)v6);
  if (!EnumTagSinglePayload)
  {
    if (!v8)
    {
      *(void *)a1 = *(void *)a2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)a1 + 1) = *((void *)a2 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)a1 + 2) = *((void *)a2 + 2);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v18 = v6[7];
      uint64_t v19 = &a1[v18];
      double v20 = &a2[v18];
      uint64_t v21 = sub_20A389550();
      uint64_t v22 = *(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 24);
      v22(v19, v20, v21);
      uint64_t v23 = v6[8];
      uint64_t v24 = &a1[v23];
      uint64_t v25 = &a2[v23];
      v22(&a1[v23], &a2[v23], v21);
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_267625A90);
      v22(&v24[*(int *)(v26 + 36)], &v25[*(int *)(v26 + 36)], v21);
      a1[v6[9]] = a2[v6[9]];
      return a1;
    }
    sub_20A37E6A8((uint64_t)a1, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  uint64_t v9 = v6[7];
  uint64_t v27 = &a1[v9];
  uint64_t v10 = &a2[v9];
  uint64_t v11 = sub_20A389550();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v27, v10, v11);
  uint64_t v13 = v6[8];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  v12(&a1[v13], &a2[v13], v11);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267625A90);
  v12(&v14[*(int *)(v16 + 36)], &v15[*(int *)(v16 + 36)], v11);
  a1[v6[9]] = a2[v6[9]];
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, (uint64_t)v6);
  return a1;
}

void *sub_20A37D7FC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, (uint64_t)v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
    uint64_t v7 = v6[7];
    int v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_20A389550();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32);
    v11(v8, v9, v10);
    uint64_t v12 = v6[8];
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    v11((char *)a1 + v12, (char *)a2 + v12, v10);
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267625A90);
    v11(&v13[*(int *)(v15 + 36)], &v14[*(int *)(v15 + 36)], v10);
    *((unsigned char *)a1 + v6[9]) = *((unsigned char *)a2 + v6[9]);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, (uint64_t)v6);
  }
  return a1;
}

char *sub_20A37D94C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, (uint64_t)v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, (uint64_t)v6);
  if (!EnumTagSinglePayload)
  {
    if (!v8)
    {
      *(void *)a1 = *(void *)a2;
      swift_bridgeObjectRelease();
      *((void *)a1 + 1) = *((void *)a2 + 1);
      swift_bridgeObjectRelease();
      *((void *)a1 + 2) = *((void *)a2 + 2);
      swift_bridgeObjectRelease();
      uint64_t v19 = v6[7];
      double v20 = &a1[v19];
      uint64_t v21 = &a2[v19];
      uint64_t v22 = sub_20A389550();
      uint64_t v23 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 40);
      v23(v20, v21, v22);
      uint64_t v24 = v6[8];
      uint64_t v25 = &a1[v24];
      uint64_t v26 = &a2[v24];
      v23(&a1[v24], &a2[v24], v22);
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_267625A90);
      v23(&v25[*(int *)(v27 + 36)], &v26[*(int *)(v27 + 36)], v22);
      a1[v6[9]] = a2[v6[9]];
      return a1;
    }
    sub_20A37E6A8((uint64_t)a1, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel.Active);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((void *)a1 + 2) = *((void *)a2 + 2);
  uint64_t v9 = v6[7];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_20A389550();
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32);
  v13(v10, v11, v12);
  uint64_t v14 = v6[8];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  v13(&a1[v14], &a2[v14], v12);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267625A90);
  v13(&v15[*(int *)(v17 + 36)], &v16[*(int *)(v17 + 36)], v12);
  a1[v6[9]] = a2[v6[9]];
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, (uint64_t)v6);
  return a1;
}

uint64_t sub_20A37DBAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A37DBC0);
}

uint64_t sub_20A37DBC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  unsigned int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, a2, v4);
  if (EnumTagSinglePayload >= 2) {
    return EnumTagSinglePayload - 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_20A37DC08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A37DC1C);
}

uint64_t sub_20A37DC1C(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  return __swift_storeEnumTagSinglePayload(a1, v5, a3, v6);
}

uint64_t sub_20A37DC78(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  return __swift_getEnumTagSinglePayload(a1, 1, v2);
}

uint64_t sub_20A37DCBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v4);
}

uint64_t sub_20A37DD08()
{
  uint64_t result = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

char *sub_20A37DD80(char *a1, char *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *(void *)a2;
  *(void *)a1 = *(void *)a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (char *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = *((void *)a2 + 2);
    *((void *)a1 + 1) = *((void *)a2 + 1);
    *((void *)a1 + 2) = v8;
    uint64_t v9 = a3[7];
    uint64_t v18 = &a1[v9];
    uint64_t v10 = &a2[v9];
    uint64_t v11 = sub_20A389550();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v18, v10, v11);
    uint64_t v13 = a3[8];
    uint64_t v14 = &v7[v13];
    uint64_t v15 = &a2[v13];
    v12(&v7[v13], &a2[v13], v11);
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267625A90);
    v12(&v14[*(int *)(v16 + 36)], &v15[*(int *)(v16 + 36)], v11);
    v7[a3[9]] = a2[a3[9]];
  }
  return v7;
}

uint64_t sub_20A37DEF0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_20A389550();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v9)((void *)(v5 - 8), v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 32);
  v9(v6, v5);
  uint64_t v7 = v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267625A90) + 36);
  return ((uint64_t (*)(uint64_t, uint64_t))v9)(v7, v5);
}

char *sub_20A37DFDC(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  *((void *)a1 + 2) = *((void *)a2 + 2);
  uint64_t v7 = a3[7];
  uint64_t v16 = &a1[v7];
  uint64_t v8 = &a2[v7];
  uint64_t v9 = sub_20A389550();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v16, v8, v9);
  uint64_t v11 = a3[8];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  v10(&a1[v11], &a2[v11], v9);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267625A90);
  v10(&v12[*(int *)(v14 + 36)], &v13[*(int *)(v14 + 36)], v9);
  a1[a3[9]] = a2[a3[9]];
  return a1;
}

char *sub_20A37E100(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[7];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_20A389550();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  uint64_t v11 = a3[8];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  v10(&a1[v11], &a2[v11], v9);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267625A90);
  v10(&v12[*(int *)(v14 + 36)], &v13[*(int *)(v14 + 36)], v9);
  a1[a3[9]] = a2[a3[9]];
  return a1;
}

uint64_t sub_20A37E230(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = a3[7];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_20A389550();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = a3[8];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  v10(a1 + v11, a2 + v11, v9);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267625A90);
  v10(v12 + *(int *)(v14 + 36), v13 + *(int *)(v14 + 36), v9);
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  return a1;
}

char *sub_20A37E328(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[7];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_20A389550();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40);
  v10(v7, v8, v9);
  uint64_t v11 = a3[8];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  v10(&a1[v11], &a2[v11], v9);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267625A90);
  v10(&v12[*(int *)(v14 + 36)], &v13[*(int *)(v14 + 36)], v9);
  a1[a3[9]] = a2[a3[9]];
  return a1;
}

uint64_t sub_20A37E440(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A37E454);
}

uint64_t sub_20A37E454(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    sub_20A389550();
    OUTLINED_FUNCTION_1();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 28);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267625A90);
      uint64_t v11 = *(int *)(a3 + 32);
    }
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + v11, a2, v10);
  }
}

uint64_t sub_20A37E504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A37E518);
}

void *sub_20A37E518(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    sub_20A389550();
    OUTLINED_FUNCTION_1();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 28);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267625A90);
      uint64_t v11 = *(int *)(a4 + 32);
    }
    return (void *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_20A37E5C4()
{
  sub_20A389550();
  if (v0 <= 0x3F)
  {
    sub_20A1F6F18();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_20A37E6A8(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_20A37E700(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MapScrubberOverlayBar.ViewModel.Active(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A37E764(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  if (v4)
  {
    uint64_t v7 = *(void *)(sub_20A389550() - 8);
    uint64_t v8 = *(void *)(v7 + 72);
    --v4;
    uint64_t v9 = a3 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)) + v8 * v4;
    uint64_t v10 = -v8;
    while (1)
    {
      char v11 = a1(v9);
      if (v3 || (v11 & 1) != 0) {
        break;
      }
      --v4;
      v9 += v10;
      if (v4 == -1) {
        return 0;
      }
    }
  }
  return v4;
}

unint64_t sub_20A37E858@<X0>(unint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)(a2 + 16) > result)
  {
    uint64_t v3 = a2 + 56 * result;
    uint64_t v4 = *(void *)(v3 + 56);
    uint64_t v5 = *(void *)(v3 + 64);
    uint64_t v6 = *(void *)(v3 + 72);
    char v7 = *(unsigned char *)(v3 + 80);
    *(void *)a3 = *(void *)(v3 + 32);
    *(_OWORD *)(a3 + 8) = *(_OWORD *)(v3 + 40);
    *(void *)(a3 + 24) = v4;
    *(void *)(a3 + 32) = v5;
    *(void *)(a3 + 40) = v6;
    *(unsigned char *)(a3 + 48) = v7;
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  __break(1u);
  return result;
}

unint64_t sub_20A37E8D4@<X0>(unint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = result;
    if (*(void *)(a2 + 16) > result)
    {
      uint64_t v6 = sub_20A389550();
      return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a3, a2+ ((*(unsigned __int8 *)(*(void *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80))+ *(void *)(*(void *)(v6 - 8) + 72) * v4, v6);
    }
  }
  __break(1u);
  return result;
}

void *sub_20A37E974@<X0>(void *result@<X0>, uint64_t a2@<X2>, char a3@<W3>, uint64_t a4@<X8>)
{
  if (a3)
  {
    char v6 = 0;
    long long v7 = 0uLL;
    long long v8 = 0uLL;
    long long v9 = 0uLL;
LABEL_6:
    *(_OWORD *)a4 = v7;
    *(_OWORD *)(a4 + 16) = v8;
    *(_OWORD *)(a4 + 32) = v9;
    *(unsigned char *)(a4 + 48) = v6;
    return result;
  }
  uint64_t v10 = a2;
  uint64_t result = ((void *(*)(_OWORD *__return_ptr, uint64_t *))result)(v11, &v10);
  if (!v4)
  {
    long long v7 = v11[0];
    long long v8 = v11[1];
    long long v9 = v11[2];
    char v6 = v12;
    goto LABEL_6;
  }
  return result;
}

void *sub_20A37E9F4@<X0>(void *(*a1)(void *__return_ptr, uint64_t *)@<X0>, uint64_t a2@<X2>, char a3@<W3>, void *a4@<X8>)
{
  if (a3)
  {
    uint64_t v7 = sub_20A389550();
    return (void *)__swift_storeEnumTagSinglePayload((uint64_t)a4, 1, 1, v7);
  }
  else
  {
    uint64_t v9 = a2;
    uint64_t result = a1(a4, &v9);
    if (!v4)
    {
      uint64_t v8 = sub_20A389550();
      return (void *)__swift_storeEnumTagSinglePayload((uint64_t)a4, 0, 1, v8);
    }
  }
  return result;
}

void sub_20A37EA98(uint64_t a1, uint64_t a2, void *a3)
{
}

BOOL sub_20A37EAA4()
{
  OUTLINED_FUNCTION_13_21();
  return v0 < 0.0;
}

void sub_20A37EAD0(uint64_t a1, uint64_t a2, void *a3)
{
}

unint64_t sub_20A37EADC@<X0>(unint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_20A37E8D4(*a1, *a2, a3);
}

unint64_t sub_20A37EB14@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_20A37EADC(a1, *(uint64_t **)(v2 + 16), a2);
}

uint64_t sub_20A37EB34(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = OUTLINED_FUNCTION_9_2();
  v5(v4);
  return a2;
}

uint64_t sub_20A37EB88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC39100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

BOOL sub_20A37EBF0()
{
  OUTLINED_FUNCTION_13_21();
  return v0 > 0.0;
}

id sub_20A37EC1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20A37AF70(a1, a2, a3, *(void **)(v3 + 16));
}

uint64_t sub_20A37EC24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MapScrubberOverlayBar.ViewModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_7_37()
{
  return v0;
}

uint64_t View.buttons(_:buttons:)(long long *a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *((void *)a1 + 2);
  uint64_t v8 = *((void *)a1 + 3);
  long long v10 = *a1;
  uint64_t v11 = v7;
  uint64_t v12 = v8;
  uint64_t v13 = a2();
  MEMORY[0x210516FC0](&v10, a4, &type metadata for ButtonsModifier, a5);
  return swift_bridgeObjectRelease();
}

uint64_t View.delegate(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20A1BF748(a1, (uint64_t)v6);
  MEMORY[0x210516FC0](v6, a2, &type metadata for DelegateModifier, a3);
  return sub_20A37EDA4((uint64_t)v6);
}

uint64_t sub_20A37EDA4(uint64_t a1)
{
  return a1;
}

uint64_t EnvironmentValues.buttons.getter()
{
  sub_20A37EE08();
  sub_20A38ADD0();
  return v1;
}

unint64_t sub_20A37EE08()
{
  unint64_t result = qword_26AC393A8;
  if (!qword_26AC393A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC393A8);
  }
  return result;
}

uint64_t EnvironmentValues.buttons.setter()
{
  return sub_20A38ADE0();
}

uint64_t (*EnvironmentValues.buttons.modify(uint64_t a1))(void *a1, char a2)
{
  *(void *)(a1 + 16) = v1;
  *(void *)(a1 + 24) = sub_20A37EE08();
  sub_20A38ADD0();
  return sub_20A37EEF0;
}

uint64_t sub_20A37EEF0(void *a1, char a2)
{
  a1[1] = *a1;
  if ((a2 & 1) == 0) {
    return sub_20A38ADE0();
  }
  swift_bridgeObjectRetain();
  sub_20A38ADE0();
  return swift_bridgeObjectRelease();
}

uint64_t EnvironmentValues.delegate.getter()
{
  sub_20A37EFCC();
  return sub_20A38ADD0();
}

unint64_t sub_20A37EFCC()
{
  unint64_t result = qword_26AC393B0;
  if (!qword_26AC393B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC393B0);
  }
  return result;
}

uint64_t EnvironmentValues.delegate.setter(uint64_t a1)
{
  sub_20A37F06C(a1, (uint64_t)v3);
  sub_20A37EFCC();
  sub_20A38ADE0();
  return sub_20A37F0D4(a1);
}

uint64_t sub_20A37F06C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC38C88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A37F0D4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC38C88);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void (*EnvironmentValues.delegate.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[15] = v1;
  v3[16] = sub_20A37EFCC();
  sub_20A38ADD0();
  return sub_20A37F1AC;
}

void sub_20A37F1AC(uint64_t *a1, char a2)
{
  uint64_t v2 = (void *)*a1;
  uint64_t v3 = *a1 + 40;
  if (a2)
  {
    sub_20A37F06C(*a1, v3);
    sub_20A37F06C(v3, (uint64_t)v2 + 80);
    sub_20A38ADE0();
    sub_20A37F0D4(v3);
  }
  else
  {
    sub_20A37F06C(*a1, v3);
    sub_20A38ADE0();
  }
  sub_20A37F0D4((uint64_t)v2);
  free(v2);
}

uint64_t EnvironmentValues.preferredMapSize.getter()
{
  sub_20A37F2AC();
  sub_20A38ADD0();
  return v1;
}

unint64_t sub_20A37F2AC()
{
  unint64_t result = qword_26AC3D3E8;
  if (!qword_26AC3D3E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC3D3E8);
  }
  return result;
}

uint64_t sub_20A37F2F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = EnvironmentValues.preferredMapSize.getter();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  return result;
}

uint64_t sub_20A37F32C()
{
  return EnvironmentValues.preferredMapSize.setter();
}

uint64_t EnvironmentValues.preferredMapSize.setter()
{
  return sub_20A38ADE0();
}

void (*EnvironmentValues.preferredMapSize.modify(void *a1))(_OWORD **a1)
{
  uint64_t v3 = (char *)malloc(0x40uLL);
  *a1 = v3;
  *((void *)v3 + 6) = v1;
  *((void *)v3 + 7) = sub_20A37F2AC();
  sub_20A38ADD0();
  char v4 = v3[40];
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(v3 + 24);
  v3[16] = v4;
  return sub_20A37F42C;
}

void sub_20A37F42C(_OWORD **a1)
{
  char v2 = *((unsigned char *)*a1 + 16);
  uint64_t v1 = *a1;
  *(_OWORD *)(v1 + 24) = **a1;
  v1[40] = v2;
  sub_20A38ADE0();
  free(v1);
}

uint64_t sub_20A37F4A0(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx11WeatherMaps15ButtonsModifierVGAaBHPxAaBHD1__AgA0cI0HPyHCHCTm(a1, (uint64_t)&type metadata for ButtonsModifier, (void (*)(void))sub_20A37F4C0);
}

unint64_t sub_20A37F4C0()
{
  unint64_t result = qword_267628E10;
  if (!qword_267628E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628E10);
  }
  return result;
}

uint64_t sub_20A37F50C(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx11WeatherMaps15ButtonsModifierVGAaBHPxAaBHD1__AgA0cI0HPyHCHCTm(a1, (uint64_t)&type metadata for DelegateModifier, (void (*)(void))sub_20A37F59C);
}

uint64_t get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx11WeatherMaps15ButtonsModifierVGAaBHPxAaBHD1__AgA0cI0HPyHCHCTm(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return swift_getWitnessTable();
}

unint64_t sub_20A37F59C()
{
  unint64_t result = qword_26AC3B740;
  if (!qword_26AC3B740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC3B740);
  }
  return result;
}

ValueMetadata *type metadata accessor for WeatherMapPreferredSizeKey()
{
  return &type metadata for WeatherMapPreferredSizeKey;
}

ValueMetadata *type metadata accessor for WeatherMapDelegateKey()
{
  return &type metadata for WeatherMapDelegateKey;
}

ValueMetadata *type metadata accessor for WeatherMapButtonsKey()
{
  return &type metadata for WeatherMapButtonsKey;
}

uint64_t initializeWithCopy for DelegateModifier(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for DelegateModifier(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t assignWithTake for DelegateModifier(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

ValueMetadata *type metadata accessor for DelegateModifier()
{
  return &type metadata for DelegateModifier;
}

uint64_t initializeWithCopy for ButtonsModifier(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ButtonsModifier(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ButtonsModifier(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ButtonsModifier(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      int v3 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *(void *)(a1 + 16) >> 1;
      if (v2 > 0x80000000) {
        int v3 = ~v2;
      }
      else {
        int v3 = -1;
      }
    }
  }
  else
  {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ButtonsModifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)unint64_t result = 0;
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = 2 * -a2;
      *(void *)(result + 24) = 0;
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ButtonsModifier()
{
  return &type metadata for ButtonsModifier;
}

uint64_t sub_20A37F848()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20A37F864@<X0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v11[0] = *(_OWORD *)v1;
  v11[1] = v3;
  uint64_t v12 = *(void *)(v1 + 32);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v5 = swift_allocObject();
  long long v6 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v5 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v5 + 32) = v6;
  *(void *)(v5 + 48) = *(void *)(v1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267628E58);
  OUTLINED_FUNCTION_28_1();
  uint64_t v7 = OUTLINED_FUNCTION_0_53();
  v8(v7);
  uint64_t v9 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267628E60) + 36));
  *uint64_t v9 = KeyPath;
  v9[1] = (uint64_t)sub_20A37FF98;
  v9[2] = v5;
  return sub_20A37FFA0((uint64_t)v11);
}

void sub_20A37F944(void **a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  sub_20A37FFA0((uint64_t)a2);
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *a1;
  uint64_t v14 = *a1;
  *a1 = (void *)0x8000000000000000;
  unint64_t v8 = sub_20A2D0A14(v3, v4, v5, v6);
  if (__OFADD__(v7[2], (v9 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  unint64_t v10 = v8;
  char v11 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267628E68);
  if (sub_20A38C5E0())
  {
    unint64_t v12 = sub_20A2D0A14(v3, v4, v5, v6);
    if ((v11 & 1) == (v13 & 1))
    {
      unint64_t v10 = v12;
      goto LABEL_5;
    }
LABEL_9:
    sub_20A38C880();
    __break(1u);
    return;
  }
LABEL_5:
  *a1 = v14;
  swift_bridgeObjectRelease();
  if ((v11 & 1) == 0) {
    sub_20A296D48(v10, v3, v4, v5, v6, MEMORY[0x263F8EE78], *a1);
  }
  sub_20A2F2CF4();
}

uint64_t sub_20A37FA9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  sub_20A1BF748(v1, (uint64_t)v8);
  uint64_t v4 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AC38DC0) + 36));
  sub_20A37F06C((uint64_t)v8, (uint64_t)(v4 + 1));
  uint64_t *v4 = KeyPath;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC3C578);
  OUTLINED_FUNCTION_28_1();
  uint64_t v5 = OUTLINED_FUNCTION_0_53();
  v6(v5);
  return sub_20A37F0D4((uint64_t)v8);
}

uint64_t sub_20A37FB44()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_20A37FB60()
{
  qword_26AC38C08 = 0;
  double result = 0.0;
  xmmword_26AC38BE8 = 0u;
  unk_26AC38BF8 = 0u;
  return result;
}

long long *sub_20A37FB78()
{
  if (qword_26AC38C98 != -1) {
    swift_once();
  }
  return &xmmword_26AC38BE8;
}

uint64_t sub_20A37FBC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_20A37FB78();
  return sub_20A37F06C((uint64_t)v2, a1);
}

void sub_20A37FC00()
{
  qword_26AC39398 = MEMORY[0x263F8EE80];
}

uint64_t *sub_20A37FC14()
{
  if (qword_26AC393A0 != -1) {
    swift_once();
  }
  return &qword_26AC39398;
}

uint64_t sub_20A37FC60@<X0>(uint64_t *a1@<X8>)
{
  *a1 = *sub_20A37FC14();
  return swift_bridgeObjectRetain();
}

uint64_t sub_20A37FC9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_20A37FE9C(&qword_267628E18, &qword_267628E20, (void (*)(void))sub_20A37FE14);
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

void *sub_20A37FD38()
{
  return &unk_267628DF8;
}

__n128 sub_20A37FD44@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v2 = (__n128 *)sub_20A37FD38();
  unsigned __int8 v3 = v2[1].n128_u8[0];
  __n128 result = *v2;
  *a1 = *v2;
  a1[1].n128_u8[0] = v3;
  return result;
}

uint64_t sub_20A37FD78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_20A37FE9C(&qword_267628E40, &qword_267628E48, (void (*)(void))sub_20A37FF08);
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t sub_20A37FE14()
{
  return sub_20A37FE9C(&qword_267628E28, &qword_267628E30, (void (*)(void))sub_20A37FE50);
}

unint64_t sub_20A37FE50()
{
  unint64_t result = qword_267628E38;
  if (!qword_267628E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628E38);
  }
  return result;
}

uint64_t sub_20A37FE9C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_20A37FF08()
{
  unint64_t result = qword_267628E50;
  if (!qword_267628E50)
  {
    type metadata accessor for CGSize(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628E50);
  }
  return result;
}

uint64_t sub_20A37FF60()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_20A37FF98(void **a1)
{
  sub_20A37F944(a1, (uint64_t *)(v1 + 16));
}

uint64_t sub_20A37FFA0(uint64_t a1)
{
  return a1;
}

unint64_t sub_20A37FFD8()
{
  unint64_t result = qword_267628E70;
  if (!qword_267628E70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267628E60);
    sub_20A1C4924(&qword_267628E78, &qword_267628E58);
    sub_20A1C4924(&qword_267628E80, &qword_267628E88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628E70);
  }
  return result;
}

unint64_t sub_20A3800A0()
{
  unint64_t result = qword_26AC3C568;
  if (!qword_26AC3C568)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AC38DC0);
    sub_20A1C4924(&qword_26AC3C570, &qword_26AC3C578);
    sub_20A1C4924(&qword_26AC3C580, &qword_26AC3C588);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC3C568);
  }
  return result;
}

BOOL sub_20A380168()
{
  swift_retain();
  sub_20A38A560();
  swift_release();
  if (v1) {

  }
  return v1 != 0;
}

uint64_t sub_20A3801CC()
{
  OUTLINED_FUNCTION_1_60();
  uint64_t v2 = v1;
  int v4 = v3 & 1;
  sub_20A38A400();
  OUTLINED_FUNCTION_4_44();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AC3C498 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_20A38A9B0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26AC3C478);
  char v9 = sub_20A38A990();
  os_log_type_t v10 = sub_20A38BD00();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    v21[0] = v2;
    unint64_t v12 = (uint8_t *)v11;
    char v13 = (void *)swift_slowAlloc();
    v21[1] = v7;
    uint64_t v14 = v13;
    id v23 = v13;
    *(_DWORD *)unint64_t v12 = 136446210;
    LOBYTE(v22) = v4;
    uint64_t v15 = sub_20A38B660();
    uint64_t v22 = sub_20A1C5B28(v15, v16, (uint64_t *)&v23);
    sub_20A38C260();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_20A1B7000, v9, v10, "Invalidating and cancelling url session: %{public}s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x210519500](v14, -1, -1);
    uint64_t v17 = v12;
    uint64_t v2 = v21[0];
    MEMORY[0x210519500](v17, -1, -1);
  }

  swift_retain();
  sub_20A38A570();
  swift_release();
  id v18 = v23;
  objc_msgSend(v23, sel_invalidateAndCancel);

  *(void *)(OUTLINED_FUNCTION_11() + 16) = v2;
  id v23 = (id)MEMORY[0x263F8EE78];
  sub_20A1BA93C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC3C5E8);
  sub_20A1C5A4C();
  OUTLINED_FUNCTION_2_52();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC3C430);
  swift_allocObject();
  if (v4)
  {
    v0[3] = sub_20A38A580();
    swift_release();
    type metadata accessor for WeatherMapOverlayServiceStatistics();
    swift_allocObject();
    uint64_t v19 = swift_retain();
    v0[4] = sub_20A1BD0BC(v19);
  }
  else
  {
    v0[2] = sub_20A38A580();
  }
  return swift_release();
}

uint64_t sub_20A380594()
{
  swift_retain();
  sub_20A38A570();
  swift_release();
  return v1;
}

uint64_t sub_20A3805EC()
{
  uint64_t v0 = sub_20A38C690();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_20A380640(char a1)
{
  if (a1) {
    return 0xD000000000000012;
  }
  else {
    return 0x6C6172656E6567;
  }
}

uint64_t sub_20A38067C(char *a1, char *a2)
{
  return sub_20A224804(*a1, *a2);
}

uint64_t sub_20A380688()
{
  return sub_20A3832A8();
}

uint64_t sub_20A380690()
{
  return sub_20A2CD58C();
}

uint64_t sub_20A380698()
{
  return sub_20A2CD838();
}

uint64_t sub_20A3806A0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20A3805EC();
  *a1 = result;
  return result;
}

uint64_t sub_20A3806D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_20A380640(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

id sub_20A3806FC(char a1)
{
  if (qword_26AC38C18 != -1) {
    swift_once();
  }
  id v2 = objc_msgSend(self, sel_sessionWithConfiguration_, qword_26AC39098);
  if (a1) {
    uint64_t v3 = 0xD000000000000012;
  }
  else {
    uint64_t v3 = 0x6C6172656E6567;
  }
  if (a1) {
    uint64_t v4 = 0x800000020A39D5D0;
  }
  else {
    uint64_t v4 = 0xE700000000000000;
  }
  sub_20A380BE8(v3, v4, v2);
  return v2;
}

id sub_20A3807C0@<X0>(void *a1@<X8>)
{
  id result = sub_20A3806FC(0);
  *a1 = result;
  return result;
}

id sub_20A3807F0@<X0>(void *a1@<X8>)
{
  id result = sub_20A3806FC(1);
  *a1 = result;
  return result;
}

uint64_t sub_20A380820()
{
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_20A380850()
{
  sub_20A380820();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

void *sub_20A38088C()
{
  id result = sub_20A3808AC();
  qword_26AC39098 = (uint64_t)result;
  return result;
}

void *sub_20A3808AC()
{
  uint64_t v0 = sub_20A38BFE0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC390E8);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  char v9 = (char *)&v18 - v8;
  uint64_t v10 = sub_20A389310();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  char v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = objc_msgSend(self, sel_defaultManager);
  sub_20A360840((uint64_t)v9);

  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10) == 1)
  {
    sub_20A360A48((uint64_t)v9);
    type metadata accessor for WeatherMapURLCache();
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v10);
    uint64_t v15 = (void *)sub_20A38BC40();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
    type metadata accessor for WeatherMapURLCache();
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v7, v13, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v10);
    uint64_t v15 = (void *)sub_20A38BC40();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  sub_20A380C4C();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F85E60], v0);
  unint64_t v16 = (void *)sub_20A38BFD0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  objc_msgSend(v16, sel_setURLCache_, v15);
  objc_msgSend(v16, sel_setWaitsForConnectivity_, 1);

  return v16;
}

void sub_20A380BE8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_20A38B5D0();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setSessionDescription_, v4);
}

unint64_t sub_20A380C4C()
{
  unint64_t result = qword_26AC3C6B8;
  if (!qword_26AC3C6B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AC3C6B8);
  }
  return result;
}

id sub_20A380C90@<X0>(void *a1@<X8>)
{
  return sub_20A3807F0(a1);
}

id sub_20A380C9C@<X0>(void *a1@<X8>)
{
  return sub_20A3807C0(a1);
}

unsigned char *storeEnumTagSinglePayload for WeatherMapURLSessionKind(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A380D70);
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

ValueMetadata *type metadata accessor for WeatherMapURLSessionKind()
{
  return &type metadata for WeatherMapURLSessionKind;
}

unint64_t sub_20A380DAC()
{
  unint64_t result = qword_267628E90;
  if (!qword_267628E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628E90);
  }
  return result;
}

uint64_t sub_20A380E00(uint64_t a1)
{
  uint64_t v3 = (uint64_t)v1 + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_model;
  swift_beginAccess();
  sub_20A1D6300(a1, v3);
  swift_endAccess();
  sub_20A380E94();
  objc_msgSend(v1, sel_setNeedsLayout);
  return sub_20A383070(a1, type metadata accessor for WeatherMapAnnotationContentViewModel);
}

id sub_20A380E94()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v1, sel_setBackgroundColor_, v2);

  objc_msgSend(v1, sel_addSubview_, *(void *)&v1[OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_titleLabel]);
  objc_msgSend(v1, sel_addSubview_, *(void *)&v1[OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_iconView]);
  uint64_t v3 = sub_20A381A0C();
  if (v4)
  {
    uint64_t v6 = v3;
    uint64_t v7 = v4;
    uint64_t v8 = v5;
    uint64_t v9 = OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_headerSectionView;
    uint64_t v10 = *(void **)&v1[OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_headerSectionView];
    if (v10) {
      objc_msgSend(v10, sel_removeFromSuperview);
    }
    id v11 = objc_allocWithZone((Class)type metadata accessor for WeatherMapAnnotationHeaderSectionView());
    swift_bridgeObjectRetain();
    id v12 = sub_20A345E3C(v6, v7, v8);
    objc_msgSend(v1, sel_addSubview_, v12);
    sub_20A382FC4(v6, v7, v8);
    char v13 = *(void **)&v1[v9];
    *(void *)&v1[v9] = v12;
  }
  sub_20A381BAC((uint64_t)v26);
  uint64_t v14 = v26[0];
  uint64_t v15 = v26[1];
  unint64_t v16 = (void *)v26[2];
  uint64_t v17 = (void *)v26[3];
  uint64_t v18 = (void *)v26[4];
  uint64_t v19 = (void *)v26[5];
  unsigned __int16 v20 = v27;
  sub_20A382F0C((uint64_t)v26, (uint64_t)v28);
  if ((~v29 & 0xFEFE) != 0)
  {
    sub_20A2DE21C((uint64_t)v28, (uint64_t)v30);
    uint64_t v21 = OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_footerSectionView;
    uint64_t v22 = *(void **)&v1[OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_footerSectionView];
    if (v22) {
      objc_msgSend(v22, sel_removeFromSuperview);
    }
    objc_allocWithZone((Class)type metadata accessor for WeatherMapAnnotationFooterSectionView());
    sub_20A2DE278(v14, v15, v16, v17, v18, v19, v20);
    id v23 = sub_20A2DD868((uint64_t)v30);
    objc_msgSend(v1, sel_addSubview_, v23);
    sub_20A382F74((uint64_t)v26);
    uint64_t v24 = *(void **)&v1[v21];
    *(void *)&v1[v21] = v23;
  }
  return sub_20A381F34();
}

id sub_20A3810A8(uint64_t a1)
{
  id v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_titleLabel;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  uint64_t v7 = v2;
  *(void *)&v2[v5] = objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_iconView;
  *(void *)&v7[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_init);
  *(void *)&v7[OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_headerSectionView] = 0;
  *(void *)&v7[OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_footerSectionView] = 0;
  sub_20A1D63C0(a1, (uint64_t)&v7[OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_model]);

  v11.receiver = v7;
  v11.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v11, sel_initWithFrame_, 0.0, 0.0, 56.0, 56.0);
  sub_20A380E94();

  sub_20A383070(a1, type metadata accessor for WeatherMapAnnotationContentViewModel);
  return v9;
}

void sub_20A3811D4()
{
  uint64_t v1 = OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_titleLabel;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  uint64_t v2 = OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_iconView;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_init);
  *(void *)&v0[OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_headerSectionView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_footerSectionView] = 0;

  sub_20A38C620();
  __break(1u);
}

void sub_20A3812B4()
{
  v1.receiver = v0;
  v1.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v1, sel_layoutSubviews);
  if (sub_20A381300()) {
    sub_20A381400();
  }
  else {
    sub_20A3815D4();
  }
}

uint64_t sub_20A381300()
{
  uint64_t v1 = type metadata accessor for WeatherMapAnnotationContentViewModel(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = v0 + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_model;
  swift_beginAccess();
  sub_20A1D63C0(v4, (uint64_t)v3);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  id v6 = type metadata accessor for WeatherMapAnnotationContentViewModel;
  if (EnumCaseMultiPayload)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = v3[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2676271E0) + 48)];
    id v6 = type metadata accessor for WeatherMapAnnotationContentViewModel.TitleIconModel;
  }
  sub_20A383070((uint64_t)v3, v6);
  return v7;
}

id sub_20A381400()
{
  objc_msgSend(v0, sel_bounds);
  double Width = CGRectGetWidth(v20);
  double v2 = sub_20A382300();
  double v3 = Width - (v2 + v2);
  uint64_t v4 = *(void **)&v0[OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_titleLabel];
  objc_msgSend(v4, sel_sizeThatFits_, v3, 1.79769313e308);
  if (v3 >= v5) {
    double v7 = v5;
  }
  else {
    double v7 = v3;
  }
  double v8 = v6 * (v7 / v5);
  objc_msgSend(v4, sel_bounds);
  objc_msgSend(v4, sel_setBounds_);
  double v9 = sub_20A382034();
  objc_msgSend(v0, sel_bounds);
  double Height = CGRectGetHeight(v21);
  double v11 = Height - sub_20A382328() - v8 - v9 + 4.0;
  uint64_t v12 = OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_footerSectionView;
  char v13 = *(void **)&v0[OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_footerSectionView];
  if (v13)
  {
    id v14 = v13;
    objc_msgSend(v0, sel_bounds);
    CGRectGetWidth(v22);
    objc_msgSend(v14, sel_bounds);
    objc_msgSend(v14, sel_setBounds_);

    uint64_t v15 = *(void **)&v0[v12];
    if (v15)
    {
      id v16 = v15;
      objc_msgSend(v0, sel_bounds);
      objc_msgSend(v16, sel_setCenter_, CGRectGetWidth(v23) * 0.5, v9 + v11 * 0.5);
    }
  }
  objc_msgSend(v0, sel_bounds);
  double v17 = CGRectGetWidth(v24) * 0.5;
  return objc_msgSend(v4, sel_setCenter_, v17, v8 * 0.5 + v9 + v11 + -4.0);
}

void sub_20A3815D4()
{
  double v1 = sub_20A382034();
  objc_msgSend(v0, sel_bounds);
  double Width = CGRectGetWidth(v39);
  sub_20A382180();
  double v4 = Width - v3;
  double v5 = sub_20A382300();
  double v6 = v4 - (v5 + v5);
  double v7 = *(void **)&v0[OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_titleLabel];
  if (objc_msgSend(v7, sel_isHidden))
  {
    double v8 = *(void **)&v0[OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_iconView];
    if ((objc_msgSend(v8, sel_isHidden) & 1) == 0)
    {
      objc_msgSend(v8, sel_sizeThatFits_, v6, 1.79769313e308);
      objc_msgSend(v8, sel_bounds);
      objc_msgSend(v8, sel_setBounds_);
      objc_msgSend(v0, sel_bounds);
      CGFloat v9 = CGRectGetWidth(v40) * 0.5;
      objc_msgSend(v0, sel_bounds);
      objc_msgSend(v8, sel_setCenter_, v9, CGRectGetHeight(v41) * 0.5 + 2.0);
    }
    goto LABEL_10;
  }
  objc_msgSend(v7, sel_sizeThatFits_, v6, 1.79769313e308);
  if (v6 >= v10) {
    double v12 = v10;
  }
  else {
    double v12 = v6;
  }
  double v13 = v12 / v10;
  double v14 = v11 * (v12 / v10);
  objc_msgSend(v7, sel_bounds);
  objc_msgSend(v7, sel_setBounds_);
  id v15 = objc_msgSend(v7, sel_font);
  if (!v15)
  {
    __break(1u);
    goto LABEL_20;
  }
  id v16 = v15;
  id v17 = objc_msgSend(v7, sel_font);
  if (!v17)
  {
LABEL_20:
    __break(1u);
    return;
  }
  uint64_t v18 = v17;
  objc_msgSend(v17, sel_pointSize);
  double v20 = v19;

  id v21 = objc_msgSend(v16, sel_fontWithSize_, v13 * v20);
  objc_msgSend(v21, sel_ascender);
  double v23 = v22;
  objc_msgSend(v0, sel_bounds);
  CGFloat v24 = CGRectGetWidth(v42) * 0.5;
  sub_20A382180();
  objc_msgSend(v7, sel_setCenter_, v24 + v25, v14 * 0.5 + v1 - v23);

LABEL_10:
  objc_msgSend(v0, sel_bounds);
  double v26 = CGRectGetHeight(v43) - v1;
  uint64_t v27 = OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_headerSectionView;
  uint64_t v28 = *(void **)&v0[OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_headerSectionView];
  if (v28)
  {
    id v29 = v28;
    objc_msgSend(v0, sel_bounds);
    CGRectGetWidth(v44);
    objc_msgSend(v29, sel_bounds);
    objc_msgSend(v29, sel_setBounds_);

    uint64_t v30 = *(void **)&v0[v27];
    if (v30)
    {
      id v31 = v30;
      objc_msgSend(v0, sel_bounds);
      objc_msgSend(v31, sel_setCenter_, CGRectGetWidth(v45) * 0.5, v26 * 0.5);
    }
  }
  uint64_t v32 = OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_footerSectionView;
  char v33 = *(void **)&v0[OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_footerSectionView];
  if (v33)
  {
    id v34 = v33;
    objc_msgSend(v0, sel_bounds);
    CGRectGetWidth(v46);
    objc_msgSend(v34, sel_bounds);
    objc_msgSend(v34, sel_setBounds_);

    uint64_t v35 = *(void **)&v0[v32];
    if (v35)
    {
      id v37 = v35;
      objc_msgSend(v0, sel_bounds);
      CGFloat v36 = CGRectGetWidth(v47) * 0.5;
      objc_msgSend(v0, sel_bounds);
      objc_msgSend(v37, sel_setCenter_, v36, CGRectGetHeight(v48) - v26 * 0.5);
    }
  }
}

uint64_t sub_20A381A0C()
{
  uint64_t v1 = type metadata accessor for WeatherMapAnnotationContentViewModel.TitleWithHeaderFooterModel(0);
  MEMORY[0x270FA5388](v1 - 8);
  double v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for WeatherMapAnnotationContentViewModel(0);
  MEMORY[0x270FA5388](v4);
  double v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v0 + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_model;
  swift_beginAccess();
  sub_20A1D63C0(v7, (uint64_t)v6);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload != 1)
    {
      sub_20A383008((uint64_t)v6, (uint64_t)v3, type metadata accessor for WeatherMapAnnotationContentViewModel.TitleWithHeaderFooterModel);
      uint64_t v10 = *((void *)v3 + 2);
      double v11 = (void *)*((void *)v3 + 4);
      swift_bridgeObjectRetain();
      v11;
      sub_20A383070((uint64_t)v3, type metadata accessor for WeatherMapAnnotationContentViewModel.TitleWithHeaderFooterModel);
      return v10;
    }
    CGFloat v9 = type metadata accessor for WeatherMapAnnotationContentViewModel;
  }
  else
  {
    CGFloat v9 = type metadata accessor for WeatherMapAnnotationContentViewModel.TitleIconModel;
  }
  sub_20A383070((uint64_t)v6, v9);
  return 0;
}

uint64_t sub_20A381BAC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for WeatherMapAnnotationContentViewModel.TitleIconModel(0);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (uint64_t *)((char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for WeatherMapAnnotationContentViewModel.TitleWithHeaderFooterModel(0);
  MEMORY[0x270FA5388](v6 - 8);
  double v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WeatherMapAnnotationContentViewModel.ScaleModel(0);
  MEMORY[0x270FA5388](v9 - 8);
  double v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for WeatherMapAnnotationContentViewModel(0);
  MEMORY[0x270FA5388](v12);
  double v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = v1 + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_model;
  swift_beginAccess();
  sub_20A1D63C0(v15, (uint64_t)v14);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_20A383008((uint64_t)v14, (uint64_t)v11, type metadata accessor for WeatherMapAnnotationContentViewModel.ScaleModel);
      uint64_t v18 = *((void *)v11 + 8);
      uint64_t v17 = *((void *)v11 + 9);
      double v19 = (void *)*((void *)v11 + 10);
      id v20 = (id)*((void *)v11 + 11);
      id v22 = (id)*((void *)v11 + 12);
      id v21 = (void *)*((void *)v11 + 13);
      unsigned __int16 v23 = *((_WORD *)v11 + 56);
      sub_20A3830D0(v18, v17, v19, v20, v22, v21, v23);
      CGFloat v24 = type metadata accessor for WeatherMapAnnotationContentViewModel.ScaleModel;
      uint64_t v25 = (uint64_t)v11;
    }
    else
    {
      sub_20A383008((uint64_t)v14, (uint64_t)v8, type metadata accessor for WeatherMapAnnotationContentViewModel.TitleWithHeaderFooterModel);
      uint64_t v18 = *((void *)v8 + 5);
      uint64_t v17 = *((void *)v8 + 6);
      double v19 = (void *)*((void *)v8 + 7);
      id v20 = (id)*((void *)v8 + 8);
      id v22 = (id)*((void *)v8 + 9);
      id v21 = (void *)*((void *)v8 + 10);
      unsigned __int16 v23 = *((_WORD *)v8 + 44);
      sub_20A2DE278(v18, v17, v19, v20, v22, v21, v23);
      CGFloat v24 = type metadata accessor for WeatherMapAnnotationContentViewModel.TitleWithHeaderFooterModel;
      uint64_t v25 = (uint64_t)v8;
    }
    uint64_t result = sub_20A383070(v25, v24);
  }
  else
  {
    int v26 = v14[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2676271E0) + 48)];
    sub_20A383008((uint64_t)v14, (uint64_t)v5, type metadata accessor for WeatherMapAnnotationContentViewModel.TitleIconModel);
    uint64_t v17 = v5[3];
    if (v17)
    {
      uint64_t v18 = v5[2];
      uint64_t v27 = *(void **)((char *)v5 + *(int *)(v3 + 32));
      uint64_t v28 = (void **)MEMORY[0x263F83618];
      double v19 = (void *)v5[4];
      if (!v26) {
        uint64_t v28 = (void **)MEMORY[0x263F83588];
      }
      id v29 = *v28;
      uint64_t v30 = (void **)MEMORY[0x263F81800];
      if (!v26) {
        uint64_t v30 = (void **)MEMORY[0x263F81838];
      }
      id v21 = *v30;
      id v22 = v29;
      swift_bridgeObjectRetain();
      id v20 = v27;
      uint64_t result = sub_20A383070((uint64_t)v5, type metadata accessor for WeatherMapAnnotationContentViewModel.TitleIconModel);
      unsigned __int16 v23 = 256;
    }
    else
    {
      uint64_t result = sub_20A383070((uint64_t)v5, type metadata accessor for WeatherMapAnnotationContentViewModel.TitleIconModel);
      uint64_t v18 = 0;
      double v19 = 0;
      id v20 = 0;
      id v22 = 0;
      id v21 = 0;
      unsigned __int16 v23 = -258;
    }
  }
  *(void *)a1 = v18;
  *(void *)(a1 + 8) = v17;
  *(void *)(a1 + 16) = v19;
  *(void *)(a1 + 24) = v20;
  *(void *)(a1 + 32) = v22;
  *(void *)(a1 + 40) = v21;
  *(_WORD *)(a1 + 48) = v23;
  return result;
}

id sub_20A381F34()
{
  sub_20A382A38();
  sub_20A382350();
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_headerSectionView];
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = sub_20A381A0C();
    uint64_t v6 = v4;
    if (v4) {
      sub_20A382FC4(v3, v4, v5);
    }
    objc_msgSend(v2, sel_setHidden_, v6 == 0);
  }
  uint64_t v7 = *(void **)&v0[OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_footerSectionView];
  if (v7)
  {
    id v8 = v7;
    sub_20A381BAC((uint64_t)v11);
    sub_20A382F0C((uint64_t)v11, (uint64_t)v12);
    int v9 = v13 & 0xFEFE;
    if (v9 != 65278)
    {
      sub_20A2DE21C((uint64_t)v12, (uint64_t)v14);
      sub_20A382F74((uint64_t)v11);
    }
    objc_msgSend(v8, sel_setHidden_, v9 == 65278);
  }
  return objc_msgSend(v0, sel_setNeedsLayout);
}

double sub_20A382034()
{
  uint64_t v1 = type metadata accessor for WeatherMapAnnotationContentViewModel(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = v0 + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_model;
  swift_beginAccess();
  sub_20A1D63C0(v4, (uint64_t)v3);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_20A383070((uint64_t)v3, type metadata accessor for WeatherMapAnnotationContentViewModel);
      return 34.0;
    }
    else
    {
      sub_20A383070((uint64_t)v3, type metadata accessor for WeatherMapAnnotationContentViewModel);
      return 35.0;
    }
  }
  else
  {
    int v7 = v3[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2676271E0) + 48)];
    sub_20A383070((uint64_t)v3, type metadata accessor for WeatherMapAnnotationContentViewModel.TitleIconModel);
    double result = 30.0;
    if (v7) {
      return 6.0;
    }
  }
  return result;
}

id sub_20A382180()
{
  id result = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_titleLabel), sel_text);
  if (!result) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = sub_20A38B610();
  unint64_t v5 = v4;

  id result = (id)sub_20A38B6F0();
  if (__OFSUB__(result, 1))
  {
    __break(1u);
    return result;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_20A2A6D5C(v3, v5);
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  if (v8)
  {
    if (v6 == 45250 && v8 == 0xA200000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v10 = sub_20A38C830();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0) {
        goto LABEL_9;
      }
    }
    return (id)swift_bridgeObjectRelease();
  }
LABEL_9:
  uint64_t v11 = sub_20A35AA64(v3, v5);
  uint64_t v13 = v12;
  id result = (id)swift_bridgeObjectRelease();
  if (v13)
  {
    if (v11 == 45250 && v13 == 0xA200000000000000)
    {
      return (id)swift_bridgeObjectRelease();
    }
    else
    {
      sub_20A38C830();
      return (id)swift_bridgeObjectRelease();
    }
  }
  return result;
}

double sub_20A382300()
{
  char v0 = sub_20A381300();
  double result = 6.0;
  if (v0) {
    return 9.0;
  }
  return result;
}

double sub_20A382328()
{
  char v0 = sub_20A381300();
  double result = 0.0;
  if (v0) {
    return 8.0;
  }
  return result;
}

id sub_20A382350()
{
  uint64_t v1 = sub_20A3824F0();
  if (v2)
  {
    uint64_t v4 = v1;
    uint64_t v5 = v2;
    sub_20A381300();
    uint64_t v6 = *(void **)(v0 + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_titleLabel);
    sub_20A1CC764(0, (unint64_t *)&qword_26AC3D238);
    uint64_t v7 = (void *)sub_20A38C020();
    objc_msgSend(v6, sel_setFont_, v7);

    objc_msgSend(v6, sel_setAdjustsFontForContentSizeCategory_, 0);
    sub_20A2B811C(v4, v5, v6);
    id v8 = sub_20A382798();
    objc_msgSend(v6, sel_setTextColor_, v8);

    objc_msgSend(v6, sel_setTextAlignment_, 1);
    objc_msgSend(v6, sel_setHidden_, 0);
    objc_msgSend(v6, sel_setAdjustsFontSizeToFitWidth_, 1);
    int v9 = sel_setMinimumScaleFactor_;
    double v3 = 0.5;
    char v10 = v6;
  }
  else
  {
    char v10 = *(void **)(v0 + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_titleLabel);
    int v9 = sel_setHidden_;
  }
  return objc_msgSend(v10, v9, v3);
}

uint64_t sub_20A3824F0()
{
  uint64_t v1 = type metadata accessor for WeatherMapAnnotationContentViewModel.ScaleModel(0);
  MEMORY[0x270FA5388](v1 - 8);
  double v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for WeatherMapAnnotationContentViewModel.TitleWithHeaderFooterModel(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for WeatherMapAnnotationContentViewModel.TitleIconModel(0);
  MEMORY[0x270FA5388](v7 - 8);
  int v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for WeatherMapAnnotationContentViewModel(0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = v0 + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_model;
  swift_beginAccess();
  sub_20A1D63C0(v13, (uint64_t)v12);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    sub_20A383008((uint64_t)v12, (uint64_t)v9, type metadata accessor for WeatherMapAnnotationContentViewModel.TitleIconModel);
    uint64_t v15 = sub_20A38B690();
    uint64_t v17 = type metadata accessor for WeatherMapAnnotationContentViewModel.TitleIconModel;
    uint64_t v18 = (uint64_t)v9;
LABEL_7:
    sub_20A383070(v18, v17);
    return v15;
  }
  if (EnumCaseMultiPayload != 1)
  {
    sub_20A383008((uint64_t)v12, (uint64_t)v6, type metadata accessor for WeatherMapAnnotationContentViewModel.TitleWithHeaderFooterModel);
    uint64_t v15 = sub_20A38B690();
    uint64_t v17 = type metadata accessor for WeatherMapAnnotationContentViewModel.TitleWithHeaderFooterModel;
    uint64_t v18 = (uint64_t)v6;
    goto LABEL_7;
  }
  sub_20A383008((uint64_t)v12, (uint64_t)v3, type metadata accessor for WeatherMapAnnotationContentViewModel.ScaleModel);
  uint64_t v15 = *((void *)v3 + 1);
  int v16 = v3[24];
  sub_20A1CC578();
  sub_20A383070((uint64_t)v3, type metadata accessor for WeatherMapAnnotationContentViewModel.ScaleModel);
  if (v16 == 1)
  {
    sub_20A1CC630();
    return 0;
  }
  return v15;
}

id sub_20A382798()
{
  uint64_t v1 = type metadata accessor for WeatherMapAnnotationContentViewModel.ScaleModel(0);
  MEMORY[0x270FA5388](v1);
  double v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for WeatherMapAnnotationContentViewModel.TitleWithHeaderFooterModel(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for WeatherMapAnnotationContentViewModel.TitleIconModel(0);
  MEMORY[0x270FA5388](v7);
  int v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for WeatherMapAnnotationContentViewModel(0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = v0 + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_model;
  swift_beginAccess();
  sub_20A1D63C0(v13, (uint64_t)v12);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_20A383008((uint64_t)v12, (uint64_t)v3, type metadata accessor for WeatherMapAnnotationContentViewModel.ScaleModel);
      id v15 = *(id *)&v3[*(int *)(v1 + 40)];
      int v16 = type metadata accessor for WeatherMapAnnotationContentViewModel.ScaleModel;
      uint64_t v17 = (uint64_t)v3;
    }
    else
    {
      sub_20A383008((uint64_t)v12, (uint64_t)v6, type metadata accessor for WeatherMapAnnotationContentViewModel.TitleWithHeaderFooterModel);
      id v15 = *(id *)&v6[*(int *)(v4 + 32)];
      int v16 = type metadata accessor for WeatherMapAnnotationContentViewModel.TitleWithHeaderFooterModel;
      uint64_t v17 = (uint64_t)v6;
    }
  }
  else
  {
    sub_20A383008((uint64_t)v12, (uint64_t)v9, type metadata accessor for WeatherMapAnnotationContentViewModel.TitleIconModel);
    id v15 = *(id *)&v9[*(int *)(v7 + 32)];
    int v16 = type metadata accessor for WeatherMapAnnotationContentViewModel.TitleIconModel;
    uint64_t v17 = (uint64_t)v9;
  }
  sub_20A383070(v17, v16);
  return v15;
}

void sub_20A382A38()
{
  id v1 = sub_20A382B1C();
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_iconView);
  if (v1)
  {
    id v5 = v1;
    objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_iconView), sel_setImage_);
    id v3 = objc_msgSend(self, sel_labelColor);
    objc_msgSend(v2, sel_setTintColor_, v3);

    objc_msgSend(v2, sel_setHidden_, 0);
  }
  else
  {
    uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_iconView);
    objc_msgSend(v4, sel_setHidden_, 1);
  }
}

id sub_20A382B1C()
{
  uint64_t v1 = type metadata accessor for WeatherMapAnnotationContentViewModel(0);
  MEMORY[0x270FA5388](v1);
  id v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for WeatherMapAnnotationContentViewModel.ScaleModel(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v0 + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_model;
  swift_beginAccess();
  sub_20A1D63C0(v7, (uint64_t)v3);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    double v14 = type metadata accessor for WeatherMapAnnotationContentViewModel;
    uint64_t v15 = (uint64_t)v3;
LABEL_6:
    sub_20A383070(v15, v14);
    return 0;
  }
  sub_20A383008((uint64_t)v3, (uint64_t)v6, type metadata accessor for WeatherMapAnnotationContentViewModel.ScaleModel);
  if (v6[24] != 1)
  {
    double v14 = type metadata accessor for WeatherMapAnnotationContentViewModel.ScaleModel;
    uint64_t v15 = (uint64_t)v6;
    goto LABEL_6;
  }
  uint64_t v9 = *((void *)v6 + 1);
  uint64_t v8 = *((void *)v6 + 2);
  sub_20A1CC764(0, (unint64_t *)&qword_26AC3C6D0);
  uint64_t v10 = (void *)*MEMORY[0x263F83618];
  double v11 = *MEMORY[0x263F81838];
  sub_20A1CC578();
  id v12 = v10;
  id v13 = sub_20A3327D8(v9, v8, v12, -1, v11, 0, 0, 2);

  sub_20A1CC630();
  sub_20A383070((uint64_t)v6, type metadata accessor for WeatherMapAnnotationContentViewModel.ScaleModel);
  return v13;
}

void sub_20A382D40()
{
}

uint64_t sub_20A382E10()
{
  return type metadata accessor for WeatherMapAnnotationContentForegroundView();
}

uint64_t type metadata accessor for WeatherMapAnnotationContentForegroundView()
{
  uint64_t result = qword_267628EB8;
  if (!qword_267628EB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_20A382E60()
{
  uint64_t result = type metadata accessor for WeatherMapAnnotationContentViewModel(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_20A382F0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628EC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A382F74(uint64_t a1)
{
  return a1;
}

void sub_20A382FB0(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, int a7)
{
  if ((~a7 & 0xFEFE) != 0) {
    sub_20A2DE378(a1, a2, a3, a4, a5, a6, a7);
  }
}

void sub_20A382FC4(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_20A383008(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_20A383070(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_20A3830D0(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, int a7)
{
  if ((~a7 & 0xFEFE) != 0) {
    sub_20A2DE278(a1, a2, a3, a4, a5, a6, a7);
  }
}

id sub_20A3830E4()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  type metadata accessor for MKPointOfInterestCategory(0);
  unint64_t v1 = (void *)sub_20A38B870();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initIncludingCategories_, v1);

  return v2;
}

void sub_20A38315C(char a1)
{
  objc_msgSend(v1, *off_263FD46B8[a1]);
  sub_20A3831E4();
  id v2 = sub_20A3830E4();
  objc_msgSend(v1, sel_setPointOfInterestFilter_, v2);
}

unint64_t sub_20A3831E4()
{
  unint64_t result = qword_26AC3CAE0;
  if (!qword_26AC3CAE0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AC3CAE0);
  }
  return result;
}

unint64_t sub_20A383228()
{
  unint64_t result = qword_26AC3D068;
  if (!qword_26AC3D068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC3D068);
  }
  return result;
}

uint64_t sub_20A383278()
{
  return sub_20A2CD740();
}

uint64_t sub_20A383284(uint64_t a1)
{
  return sub_20A383458(a1, (void (*)(unsigned char *, uint64_t))sub_20A2CD5FC);
}

uint64_t sub_20A38329C()
{
  return sub_20A2CD7C4();
}

uint64_t sub_20A3832A8()
{
  return sub_20A2CD838();
}

uint64_t sub_20A3832B4(char a1)
{
  return sub_20A2CD8AC(0, a1 & 1);
}

uint64_t sub_20A3832C0()
{
  return sub_20A383338();
}

uint64_t sub_20A3832DC()
{
  return sub_20A2CD940();
}

uint64_t sub_20A3832E8()
{
  return sub_20A383338();
}

uint64_t sub_20A383300()
{
  return sub_20A2CD9D0();
}

uint64_t sub_20A38330C()
{
  return sub_20A2CDA40();
}

uint64_t sub_20A383318()
{
  return sub_20A383338();
}

uint64_t sub_20A383338()
{
  return sub_20A38C970();
}

uint64_t sub_20A383380()
{
  return sub_20A2CDB4C();
}

uint64_t sub_20A38338C()
{
  return sub_20A2CDBCC();
}

uint64_t sub_20A383398()
{
  return sub_20A2CDC48();
}

uint64_t sub_20A3833A4()
{
  return sub_20A38C970();
}

uint64_t sub_20A3833E8()
{
  return sub_20A2CDCE4();
}

uint64_t sub_20A3833F4()
{
  return sub_20A2CDD4C();
}

uint64_t sub_20A383400()
{
  return sub_20A38C970();
}

uint64_t sub_20A383440(uint64_t a1)
{
  return sub_20A383458(a1, (void (*)(unsigned char *, uint64_t))sub_20A2CCF94);
}

uint64_t sub_20A383458(uint64_t a1, void (*a2)(unsigned char *, uint64_t))
{
  OUTLINED_FUNCTION_0_55();
  a2(v5, a1);
  return sub_20A38C970();
}

uint64_t sub_20A3834A0()
{
  return sub_20A2CDE54();
}

uint64_t sub_20A3834AC()
{
  return sub_20A38C970();
}

uint64_t sub_20A3834F0()
{
  return sub_20A38C970();
}

uint64_t sub_20A383530()
{
  unint64_t v0 = sub_20A38C690();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_20A38357C(char a1)
{
  uint64_t result = 5000257;
  switch(a1)
  {
    case 1:
      uint64_t result = 67;
      break;
    case 2:
      uint64_t result = 70;
      break;
    case 3:
      uint64_t result = 75;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_20A3835E4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20A383530();
  *a1 = result;
  return result;
}

uint64_t sub_20A383614@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_20A38357C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_20A383640@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20A2FF344();
  if (!v1) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_20A38366C()
{
  return sub_20A2FF274();
}

uint64_t sub_20A383688(unsigned __int8 *a1, char *a2)
{
  return sub_20A22442C(*a1, *a2);
}

uint64_t sub_20A383694()
{
  return sub_20A383458(*v0, (void (*)(unsigned char *, uint64_t))sub_20A2CD2C4);
}

uint64_t sub_20A3836C4()
{
  return sub_20A2CD2C4();
}

uint64_t sub_20A3836CC(uint64_t a1)
{
  return sub_20A2CDB34(a1, *v1);
}

unsigned char *storeEnumTagSinglePayload for WeatherMapTemperatureScaleIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x20A3837A0);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WeatherMapTemperatureScaleIdentifier()
{
  return &type metadata for WeatherMapTemperatureScaleIdentifier;
}

uint64_t type metadata accessor for WeatherMapSelectedDateStream()
{
  return self;
}

void sub_20A3837FC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v5 = 0.0;
  v57.origin.x = OUTLINED_FUNCTION_0_1();
  BOOL v6 = CGRectEqualToRect(v57, v59);
  if (v6)
  {
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    float v15 = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
    double v18 = 0.0;
    double v19 = 0.0;
    double v20 = 0.0;
LABEL_46:
    *(double *)a2 = v7;
    *(double *)(a2 + 8) = v8;
    *(double *)(a2 + 16) = v9;
    *(double *)(a2 + 24) = v10;
    *(double *)(a2 + 32) = v5;
    *(double *)(a2 + 40) = v16;
    *(void *)(a2 + 48) = v11;
    *(double *)(a2 + 56) = v17;
    *(double *)(a2 + 64) = v18;
    *(double *)(a2 + 72) = v19;
    *(double *)(a2 + 80) = v20;
    *(void *)(a2 + 88) = v12;
    *(void *)(a2 + 96) = v13;
    *(void *)(a2 + 104) = v14;
    *(float *)(a2 + 112) = v15;
    *(unsigned char *)(a2 + 116) = v6;
    return;
  }
  float v21 = *(float *)(a1 + 64);
  if (v21 == 1.0) {
    double v22 = 20.0;
  }
  else {
    double v22 = 21.0;
  }
  v58.origin.x = OUTLINED_FUNCTION_0_1();
  CGFloat Width = CGRectGetWidth(v58);
  double v25 = *(double *)(a1 + 32);
  double v24 = *(double *)(a1 + 40);
  double v27 = *(double *)(a1 + 48);
  double v26 = *(double *)(a1 + 56);
  double v28 = v22 + log2(Width / v27);
  if (v28 < 0.0) {
    double v29 = 0.0;
  }
  else {
    double v29 = v28;
  }
  double v30 = floor(v29 + 0.01);
  if (v30 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_48;
  }
  if (v30 >= 9.22337204e18)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  uint64_t v13 = (uint64_t)v30 - 1;
  if (__OFSUB__((uint64_t)v30, 1))
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  if (__OFADD__(v13, 1))
  {
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  float v56 = v21;
  uint64_t v31 = *(void *)&v30 & 0x7FF0000000000000;
  double v32 = exp2((double)(uint64_t)v30) * 0.5;
  if (v31 == 0x7FF0000000000000 || (*(void *)&v32 & 0x7FF0000000000000) == 0x7FF0000000000000) {
    goto LABEL_51;
  }
  if (v32 <= -9.22337204e18)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  if (v32 >= 9.22337204e18)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  double v34 = (double)(uint64_t)v32;
  double v35 = v25 / *MEMORY[0x263F10868] * v34;
  double v36 = floor(v35);
  if ((~*(void *)&v36 & 0x7FF0000000000000) == 0)
  {
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  if (v36 <= -9.22337204e18)
  {
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  if (v36 >= 9.22337204e18)
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  double v37 = floor((v25 + v27) / *MEMORY[0x263F10868] * v34);
  if (v37 <= -9.22337204e18)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  if (v37 >= 9.22337204e18)
  {
LABEL_58:
    __break(1u);
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  double v38 = *(double *)(MEMORY[0x263F10868] + 8);
  double v39 = v24 / v38 * v34;
  double v40 = floor(v39);
  if ((*(void *)&v37 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(void *)&v40 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_59;
  }
  if (v40 <= -9.22337204e18)
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  if (v40 >= 9.22337204e18)
  {
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  double v42 = floor((v24 + v26) / v38 * v34);
  if ((~*(void *)&v42 & 0x7FF0000000000000) == 0)
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  if (v42 <= -9.22337204e18)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (v42 >= 9.22337204e18)
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  uint64_t v43 = (uint64_t)v36;
  uint64_t v44 = (uint64_t)v37 - (uint64_t)v36;
  if (__OFSUB__((uint64_t)v37, (uint64_t)v36))
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  uint64_t v45 = v44 + 1;
  if (__OFADD__(v44, 1))
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  uint64_t v46 = (uint64_t)v40;
  uint64_t v47 = (uint64_t)v42 - (uint64_t)v40;
  if (__OFSUB__((uint64_t)v42, (uint64_t)v40))
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  uint64_t v48 = v47 + 1;
  if (__OFADD__(v47, 1))
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  double v49 = floor(v29);
  if (v49 <= -9.22337204e18)
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  if (v49 >= 9.22337204e18)
  {
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  double v50 = v26;
  double v51 = v39;
  double v55 = v50;
  uint64_t v52 = *(void *)&v49 & 0x7FF0000000000000;
  double v53 = round(((exp2(v29 - (double)(uint64_t)v49) + -1.0) * 0.5 + 0.5) * (double)*(uint64_t *)(a1 + 72));
  if (v52 == 0x7FF0000000000000 || (*(void *)&v53 & 0x7FF0000000000000) == 0x7FF0000000000000) {
    goto LABEL_71;
  }
  if (v53 <= -9.22337204e18)
  {
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  if (v53 < 9.22337204e18)
  {
    uint64_t v14 = (uint64_t)v32;
    double v17 = (double)v43;
    double v18 = (double)v46;
    double v19 = (double)v45;
    double v20 = (double)v48;
    double v5 = ((double)v43 - v35) * v53;
    double v16 = ((double)v46 - v51) * v53;
    uint64_t v11 = (uint64_t)v53;
    double v7 = v25;
    uint64_t v12 = *(void *)(v2 + 16);
    double v8 = v24;
    double v9 = v27;
    double v10 = v55;
    float v15 = v56;
    goto LABEL_46;
  }
LABEL_73:
  __break(1u);
}

uint64_t type metadata accessor for TiledField()
{
  return self;
}

uint64_t sub_20A383C48(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_20A383C98(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 40) = v4;
  return a1;
}

uint64_t sub_20A383D20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t sub_20A383D80(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 49))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_20A383DC0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for WeatherMapScale.Point()
{
}

uint64_t sub_20A383E1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_20A383EAC(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  return a1;
}

void *__swift_memcpy96_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x60uLL);
}

uint64_t sub_20A383F9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  return a1;
}

uint64_t sub_20A38402C(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 96))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_20A38406C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for WeatherMapScale()
{
}

uint64_t sub_20A3840D0(char a1)
{
  if (a1)
  {
    sub_20A1E5B48(v1 + 72, (uint64_t)&v3, &qword_2676257D8);
    sub_20A1E5B48((uint64_t)&v3, (uint64_t)&v4, &qword_2676257D8);
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_20A384138(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2 || *(void *)(a1 + 8) != *(void *)(a2 + 8))
  {
    sub_20A38C830();
    uint64_t result = OUTLINED_FUNCTION_10_30();
    if ((v6 & 1) == 0) {
      return result;
    }
  }
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a2 + 24);
  if (!v7)
  {
    if (v8) {
      return 0;
    }
    goto LABEL_15;
  }
  if (!v8) {
    return 0;
  }
  BOOL v9 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && v7 == v8;
  if (v9 || (sub_20A38C830(), uint64_t result = OUTLINED_FUNCTION_10_30(), (v10 & 1) != 0))
  {
LABEL_15:
    if (sub_20A22432C(*(unsigned char *)(a1 + 32), *(unsigned char *)(a2 + 32)))
    {
      int v11 = *(unsigned __int8 *)(a1 + 33);
      int v12 = *(unsigned __int8 *)(a2 + 33);
      if (v11 == 2)
      {
        if (v12 != 2) {
          return 0;
        }
      }
      else if (v12 == 2 || (sub_20A224B50(v11 & 1, v12 & 1) & 1) == 0)
      {
        return 0;
      }
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = *(void *)(a2 + 48);
      if (v13)
      {
        if (!v14) {
          return 0;
        }
        if (*(void *)(a1 + 40) != *(void *)(a2 + 40) || v13 != v14)
        {
          sub_20A38C830();
          uint64_t result = OUTLINED_FUNCTION_10_30();
          if ((v16 & 1) == 0) {
            return result;
          }
        }
      }
      else if (v14)
      {
        return 0;
      }
      if (sub_20A2F339C())
      {
        uint64_t v17 = *(void *)(a2 + 64);
        if (*(void *)(a1 + 64))
        {
          if (!v17 || (sub_20A2F339C() & 1) == 0) {
            return 0;
          }
LABEL_36:
          int v18 = *(unsigned __int8 *)(a1 + 72);
          int v19 = *(unsigned __int8 *)(a2 + 72);
          if (v18 == 2)
          {
            if (v19 != 2) {
              return 0;
            }
          }
          else if (v19 == 2 || (sub_20A22489C(v18 & 1, v19 & 1) & 1) == 0)
          {
            return 0;
          }
          return *(double *)(a1 + 80) == *(double *)(a2 + 80) && *(double *)(a1 + 88) == *(double *)(a2 + 88);
        }
        if (!v17) {
          goto LABEL_36;
        }
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_20A3842D0(char a1)
{
  if (a1) {
    return 0x7261646E6F636573;
  }
  else {
    return 0x7972616D697270;
  }
}

uint64_t sub_20A38430C()
{
  unint64_t v0 = sub_20A38C690();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_20A384358(char a1)
{
  if (!a1) {
    return 0x6F756E69746E6F63;
  }
  if (a1 == 1) {
    return 0x6574657263736964;
  }
  return 0x6576697463616E69;
}

uint64_t sub_20A3843B4()
{
  uint64_t v0 = sub_20A38C690();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_20A384404(char a1)
{
  if (a1) {
    return 0x694D7261656E696CLL;
  }
  else {
    return 0xD000000000000011;
  }
}

uint64_t sub_20A384448(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
  if (v2 || (sub_20A38C830() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x726F6C6F63 && a2 == 0xE500000000000000;
    if (v6 || (sub_20A38C830() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x65756C6176 && a2 == 0xE500000000000000;
      if (v7 || (sub_20A38C830() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x61746E6563726570 && a2 == 0xEA00000000006567)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = sub_20A38C830();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_20A3845F0(char a1)
{
  uint64_t result = 0x6C6562616CLL;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x726F6C6F63;
      break;
    case 2:
      uint64_t result = 0x65756C6176;
      break;
    case 3:
      uint64_t result = 0x61746E6563726570;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_20A384674(char *a1, char *a2)
{
  return sub_20A22489C(*a1, *a2);
}

uint64_t sub_20A384680()
{
  return sub_20A38329C();
}

uint64_t sub_20A384688()
{
  return sub_20A2CD160();
}

uint64_t sub_20A384690()
{
  return sub_20A2CD7C4();
}

uint64_t sub_20A384698@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20A3843B4();
  *a1 = result;
  return result;
}

uint64_t sub_20A3846D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_20A3842D0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_20A3846FC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20A38430C();
  *a1 = result;
  return result;
}

uint64_t sub_20A38472C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_20A384358(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_20A384758@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20A3843B4();
  *a1 = result;
  return result;
}

uint64_t sub_20A384790@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_20A384404(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_20A3847BC()
{
  return sub_20A3845F0(*v0);
}

uint64_t sub_20A3847C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A384448(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20A3847EC(uint64_t a1)
{
  unint64_t v2 = sub_20A38720C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A384828(uint64_t a1)
{
  unint64_t v2 = sub_20A38720C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_20A384864(uint64_t a1, uint64_t a2)
{
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628F98);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_6();
  uint64_t v51 = v5;
  MEMORY[0x270FA5388](v6);
  uint64_t v50 = (uint64_t)v48 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC3C860);
  MEMORY[0x270FA5388](v8 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v52 = v10 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267628FA0);
  MEMORY[0x270FA5388](v11 - 8);
  OUTLINED_FUNCTION_6();
  uint64_t v53 = v12;
  MEMORY[0x270FA5388](v13);
  uint64_t v55 = (uint64_t)v48 - v14;
  uint64_t v15 = sub_20A389210();
  MEMORY[0x270FA5388](v15 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v56 = sub_20A3891B0();
  OUTLINED_FUNCTION_2_3();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  double v20 = (char *)v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  unsigned __int16 v23 = (char *)v48 - v22;
  uint64_t v57 = a1;
  uint64_t v58 = a2;
  uint64_t v61 = 40;
  unint64_t v62 = 0xE100000000000000;
  uint64_t v59 = 0;
  unint64_t v60 = 0xE000000000000000;
  sub_20A230CD8();
  uint64_t v57 = OUTLINED_FUNCTION_6_36();
  uint64_t v58 = v24;
  uint64_t v61 = 41;
  unint64_t v62 = 0xE100000000000000;
  uint64_t v59 = 0;
  unint64_t v60 = 0xE000000000000000;
  uint64_t v25 = OUTLINED_FUNCTION_6_36();
  uint64_t v27 = v26;
  swift_bridgeObjectRelease();
  sub_20A389200();
  swift_bridgeObjectRetain();
  sub_20A3891C0();
  uint64_t v57 = v25;
  uint64_t v58 = v27;
  uint64_t v61 = 32;
  unint64_t v62 = 0xE100000000000000;
  double v28 = (void *)sub_20A38C280();
  swift_bridgeObjectRelease();
  if (v28[2])
  {
    uint64_t v29 = v28[4];
    uint64_t v30 = v28[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
    double v32 = v23;
    double v49 = v23;
    uint64_t v33 = v56;
    v31(v20, v32, v56);
    v48[1] = v29;
    uint64_t v57 = v29;
    uint64_t v58 = v30;
    uint64_t v34 = sub_20A389680();
    uint64_t v35 = v52;
    __swift_storeEnumTagSinglePayload(v52, 1, 1, v34);
    unint64_t v36 = sub_20A3872A4();
    uint64_t v37 = v55;
    v48[0] = v36;
    sub_20A389270();
    sub_20A1D4270(v35, &qword_26AC3C860);
    double v38 = *(void (**)(char *, uint64_t))(v17 + 8);
    v38(v20, v33);
    uint64_t v39 = v53;
    sub_20A1E5994(v37, v53, &qword_267628FA0);
    uint64_t v40 = v17;
    if (__swift_getEnumTagSinglePayload(v39, 1, v54) == 1)
    {
      sub_20A1D4270(v55, &qword_267628FA0);
      swift_bridgeObjectRelease();
      sub_20A1D4270(v39, &qword_267628FA0);
      uint64_t v41 = v56;
      unsigned __int16 v23 = v49;
    }
    else
    {
      uint64_t v42 = v50;
      sub_20A1E5B48(v39, v50, &qword_267628F98);
      sub_20A38B670();
      uint64_t v53 = v17;
      swift_bridgeObjectRelease();
      sub_20A389200();
      sub_20A3891C0();
      sub_20A387334();
      uint64_t v41 = v56;
      unsigned __int16 v23 = v49;
      sub_20A389190();
      v38(v20, v41);
      uint64_t v43 = v51;
      sub_20A1E5994(v42, v51, &qword_267628F98);
      uint64_t KeyPath = swift_getKeyPath();
      MEMORY[0x270FA5388](KeyPath);
      swift_getKeyPath();
      LOBYTE(v61) = 1;
      uint64_t v45 = (void (*)(uint64_t *, void))sub_20A3891D0();
      sub_20A3873A8();
      sub_20A389220();
      v45(&v57, 0);
      uint64_t v40 = v53;
      sub_20A1D4270(v43, &qword_267628F98);
      sub_20A1D4270(v42, &qword_267628F98);
      sub_20A1D4270(v55, &qword_267628FA0);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v40 = v17;
    uint64_t v41 = v56;
  }
  sub_20A3872F4();
  (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v20, v23, v41);
  uint64_t v46 = sub_20A38BED0();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v23, v41);
  return v46;
}

uint64_t sub_20A384E68()
{
  return sub_20A38B5C0() & 1;
}

uint64_t sub_20A384EC4()
{
  return sub_20A38B570();
}

void sub_20A384F0C()
{
}

uint64_t sub_20A384F34(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656449656C616373 && a2 == 0xEF7265696669746ELL;
  if (v2 || (sub_20A38C830() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000020A3A9CB0 || (sub_20A38C830() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v6 = a1 == 1684957547 && a2 == 0xE400000000000000;
    if (v6 || (sub_20A38C830() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v7 = a1 == 0x676E696C616373 && a2 == 0xE700000000000000;
      if (v7 || (sub_20A38C830() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        BOOL v8 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
        if (v8 || (sub_20A38C830() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          BOOL v9 = a1 == 0x73746E696F70 && a2 == 0xE600000000000000;
          if (v9 || (sub_20A38C830() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            BOOL v10 = a1 == 0x7261646E6F636573 && a2 == 0xEF73746E696F5079;
            if (v10 || (sub_20A38C830() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              BOOL v11 = a1 == 0x656956656C616373 && a2 == 0xEF656372756F5377;
              if (v11 || (sub_20A38C830() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 7;
              }
              else if (a1 == 0x65676E6172 && a2 == 0xE500000000000000)
              {
                swift_bridgeObjectRelease();
                return 8;
              }
              else
              {
                char v13 = sub_20A38C830();
                swift_bridgeObjectRelease();
                if (v13) {
                  return 8;
                }
                else {
                  return 9;
                }
              }
            }
          }
        }
      }
    }
  }
}

unint64_t sub_20A385304(char a1)
{
  unint64_t result = 0x656449656C616373;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 1684957547;
      break;
    case 3:
      unint64_t result = 0x676E696C616373;
      break;
    case 4:
      unint64_t result = 0x6C6562616CLL;
      break;
    case 5:
      unint64_t result = 0x73746E696F70;
      break;
    case 6:
      unint64_t result = 0x7261646E6F636573;
      break;
    case 7:
      unint64_t result = 0x656956656C616373;
      break;
    case 8:
      unint64_t result = 0x65676E6172;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_20A385438()
{
  return sub_20A385304(*v0);
}

uint64_t sub_20A385440@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A384F34(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20A385468(uint64_t a1)
{
  unint64_t v2 = sub_20A386E40();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A3854A4(uint64_t a1)
{
  unint64_t v2 = sub_20A386E40();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_20A3854E0()
{
  if (qword_26AC3C6D8 != -1) {
    swift_once();
  }
  id v0 = (id)qword_26AC41740;
  uint64_t v1 = sub_20A3891E0();
  uint64_t v3 = v2;

  qword_26AC41818 = v1;
  unk_26AC41820 = v3;
}

uint64_t sub_20A3855B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (!v4)
  {
    if (v5) {
      return 0;
    }
    goto LABEL_10;
  }
  if (!v5) {
    return 0;
  }
  BOOL v6 = *(void *)a1 == *(void *)a2 && v4 == v5;
  if (v6 || (sub_20A38C830(), uint64_t result = OUTLINED_FUNCTION_10_30(), (v8 & 1) != 0))
  {
LABEL_10:
    if (*(void *)(a1 + 16) != *(void *)(a2 + 16) || *(void *)(a1 + 24) != *(void *)(a2 + 24))
    {
      sub_20A38C830();
      uint64_t result = OUTLINED_FUNCTION_10_30();
      if ((v10 & 1) == 0) {
        return result;
      }
    }
    if (*(double *)(a1 + 32) == *(double *)(a2 + 32))
    {
      char v11 = *(unsigned char *)(a2 + 48);
      if (*(unsigned char *)(a1 + 48))
      {
        if ((*(unsigned char *)(a2 + 48) & 1) == 0) {
          return 0;
        }
      }
      else
      {
        if (*(double *)(a1 + 40) != *(double *)(a2 + 40)) {
          char v11 = 1;
        }
        if (v11) {
          return 0;
        }
      }
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_20A385678(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  sub_20A38B6E0();
  swift_bridgeObjectRelease();
  if (*(void *)(v2 + 24))
  {
    sub_20A38C940();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_13_22();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_20A38C940();
  }
  sub_20A38B6E0();
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v2 + 33) == 2)
  {
    sub_20A38C940();
  }
  else
  {
    sub_20A38C940();
    sub_20A38B6E0();
    swift_bridgeObjectRelease();
  }
  if (*(void *)(v2 + 48))
  {
    sub_20A38C940();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_13_22();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_20A38C940();
  }
  uint64_t v4 = *(void *)(v2 + 56);
  swift_bridgeObjectRetain();
  sub_20A386CEC(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v2 + 64);
  sub_20A38C940();
  if (v5)
  {
    swift_bridgeObjectRetain();
    sub_20A386CEC(a1, v5);
    swift_bridgeObjectRelease();
  }
  if (*(unsigned char *)(v2 + 72) == 2)
  {
    sub_20A38C940();
  }
  else
  {
    sub_20A38C940();
    sub_20A38B6E0();
    swift_bridgeObjectRelease();
  }
  return sub_20A2DC4C8();
}

uint64_t sub_20A3858F0()
{
  sub_20A38C920();
  sub_20A385678((uint64_t)v1);
  return sub_20A38C970();
}

uint64_t sub_20A385930()
{
  if (*(void *)(v0 + 8))
  {
    sub_20A38C940();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_13_22();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_20A38C940();
  }
  swift_bridgeObjectRetain();
  sub_20A38B6E0();
  swift_bridgeObjectRelease();
  sub_20A38C960();
  if (*(unsigned char *)(v0 + 48) == 1) {
    return sub_20A38C940();
  }
  sub_20A38C940();
  return sub_20A38C960();
}

uint64_t sub_20A3859F4()
{
  return sub_20A38C970();
}

uint64_t sub_20A385A34(void *a1)
{
  uint64_t v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267628F38);
  OUTLINED_FUNCTION_2_3();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A386E40();
  OUTLINED_FUNCTION_19_22();
  LOBYTE(v9) = 0;
  sub_20A38C7A0();
  if (!v2)
  {
    OUTLINED_FUNCTION_12_21(1);
    LOBYTE(v9) = *(unsigned char *)(v3 + 32);
    char v10 = 2;
    sub_20A386FBC();
    sub_20A38C7C0();
    sub_20A1E5B48(v3 + 33, (uint64_t)&v13, &qword_2676271D0);
    sub_20A1E5B48((uint64_t)&v13, (uint64_t)&v9, &qword_2676271D0);
    char v10 = 3;
    sub_20A387008();
    OUTLINED_FUNCTION_11_27();
    OUTLINED_FUNCTION_12_21(4);
    *(void *)&long long v9 = *(void *)(v3 + 56);
    char v10 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267627DD0);
    sub_20A387054(&qword_267628F50, (void (*)(void))sub_20A3870C4);
    OUTLINED_FUNCTION_3_53();
    sub_20A38C7C0();
    sub_20A1E5B48(v3 + 64, (uint64_t)v12, &qword_2676257E0);
    sub_20A1E5B48((uint64_t)v12, (uint64_t)&v9, &qword_2676257E0);
    char v10 = 6;
    OUTLINED_FUNCTION_3_53();
    sub_20A38C790();
    sub_20A1E5B48(v3 + 72, (uint64_t)&v11, &qword_2676257D8);
    sub_20A1E5B48((uint64_t)&v11, (uint64_t)&v9, &qword_2676257D8);
    char v10 = 7;
    sub_20A387110();
    OUTLINED_FUNCTION_11_27();
    long long v9 = *(_OWORD *)(v3 + 80);
    char v10 = 8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267627DF8);
    sub_20A38715C(&qword_267628F68);
    sub_20A38C7C0();
  }
  uint64_t v6 = OUTLINED_FUNCTION_15_20();
  return v7(v6);
}

uint64_t sub_20A385D3C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267628EF8);
  OUTLINED_FUNCTION_2_3();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A386E40();
  sub_20A38C980();
  if (v2)
  {
    int v6 = 0;
    char v7 = 0;
  }
  else
  {
    uint64_t v12 = sub_20A38C710();
    uint64_t v14 = v13;
    swift_bridgeObjectRetain();
    uint64_t v28 = OUTLINED_FUNCTION_17_21();
    uint64_t v29 = v12;
    uint64_t v16 = v15;
    unint64_t v17 = sub_20A386E8C();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_2_53();
    sub_20A38C740();
    uint64_t v30 = v16;
    if (!v17)
    {
      sub_20A386ED8();
      OUTLINED_FUNCTION_16_20();
      LOBYTE(v31) = 4;
      uint64_t v27 = OUTLINED_FUNCTION_17_21();
      uint64_t v21 = v20;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267627DD0);
      sub_20A387054(&qword_267628F18, (void (*)(void))sub_20A386F24);
      swift_bridgeObjectRetain();
      sub_20A38C740();
      int v10 = 1;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_16_20();
      unint64_t v22 = sub_20A386F70();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_2_53();
      sub_20A38C700();
      if (!v22)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_267627DF8);
        sub_20A38715C(&qword_267628F30);
        sub_20A38C740();
        uint64_t v25 = OUTLINED_FUNCTION_1_61();
        v26(v25);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        *(void *)a2 = v29;
        *(void *)(a2 + 8) = v14;
        *(void *)(a2 + 16) = v28;
        *(void *)(a2 + 24) = v30;
        *(unsigned char *)(a2 + 32) = 1;
        *(unsigned char *)(a2 + 33) = 1;
        *(void *)(a2 + 40) = v27;
        *(void *)(a2 + 48) = v21;
        *(void *)(a2 + 56) = v31;
        *(void *)(a2 + 64) = v31;
        *(unsigned char *)(a2 + 72) = 4;
        *(void *)(a2 + 80) = v31;
        *(void *)(a2 + 88) = v32;
        return result;
      }
      uint64_t v23 = OUTLINED_FUNCTION_1_61();
      v24(v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v11 = 1;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      LOBYTE(v6) = 1;
      int v9 = 1;
      goto LABEL_6;
    }
    uint64_t v18 = OUTLINED_FUNCTION_1_61();
    v19(v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int v6 = 1;
    char v7 = 1;
  }
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  if ((v7 & 1) == 0)
  {
    if (!v6) {
      return result;
    }
    int v11 = 0;
    int v10 = 0;
    LOBYTE(v9) = 0;
    goto LABEL_13;
  }
  int v9 = 0;
  int v10 = 0;
  int v11 = 0;
LABEL_6:
  uint64_t result = swift_bridgeObjectRelease();
  if ((v6 & 1) == 0)
  {
    if (!v9) {
      goto LABEL_8;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t result = swift_bridgeObjectRelease();
  if ((v9 & 1) == 0)
  {
LABEL_8:
    if (v10) {
      goto LABEL_9;
    }
LABEL_15:
    if (!v11) {
      return result;
    }
    return swift_bridgeObjectRelease();
  }
LABEL_14:
  uint64_t result = swift_bridgeObjectRelease();
  if ((v10 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_9:
  uint64_t result = swift_bridgeObjectRelease();
  if ((v11 & 1) == 0) {
    return result;
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A386288(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267628F88);
  OUTLINED_FUNCTION_2_3();
  MEMORY[0x270FA5388](v3);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A38720C();
  OUTLINED_FUNCTION_19_22();
  OUTLINED_FUNCTION_14_23();
  sub_20A38C770();
  if (!v1)
  {
    OUTLINED_FUNCTION_14_23();
    sub_20A38C7A0();
    sub_20A38C7B0();
    OUTLINED_FUNCTION_14_23();
    sub_20A38C780();
  }
  uint64_t v4 = OUTLINED_FUNCTION_15_20();
  return v5(v4);
}

uint64_t sub_20A3863DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267628F78);
  OUTLINED_FUNCTION_2_3();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A38720C();
  sub_20A38C980();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  OUTLINED_FUNCTION_9_32();
  uint64_t v6 = sub_20A38C6D0();
  uint64_t v8 = v7;
  uint64_t v21 = v6;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_9_32();
  uint64_t v9 = sub_20A38C710();
  uint64_t v11 = v10;
  uint64_t v19 = v9;
  swift_bridgeObjectRetain();
  uint64_t v20 = v11;
  sub_20A38C720();
  uint64_t v13 = v12;
  OUTLINED_FUNCTION_9_32();
  uint64_t v14 = sub_20A38C6E0();
  char v16 = v15;
  OUTLINED_FUNCTION_8_35();
  v17();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v21;
  *(void *)(a2 + 8) = v8;
  *(void *)(a2 + 16) = v19;
  *(void *)(a2 + 24) = v20;
  *(void *)(a2 + 32) = v13;
  *(void *)(a2 + 40) = v14;
  *(unsigned char *)(a2 + 48) = v16 & 1;
  return result;
}

uint64_t sub_20A386644(char *a1, char *a2)
{
  return sub_20A22432C(*a1, *a2);
}

uint64_t sub_20A386654(char *a1, char *a2)
{
  return sub_20A224B50(*a1, *a2);
}

uint64_t sub_20A386668()
{
  sub_20A38C920();
  sub_20A385678((uint64_t)v1);
  return sub_20A38C970();
}

uint64_t sub_20A3866A4()
{
  return sub_20A383380();
}

uint64_t sub_20A3866AC(uint64_t a1)
{
  return sub_20A2CD248(a1, *v1);
}

uint64_t sub_20A3866B4()
{
  return sub_20A2CDB4C();
}

uint64_t sub_20A3866C4()
{
  return sub_20A38C970();
}

uint64_t sub_20A386700()
{
  return sub_20A38338C();
}

uint64_t sub_20A386708()
{
  return sub_20A2CD1D0();
}

uint64_t sub_20A386710()
{
  return sub_20A2CDBCC();
}

uint64_t sub_20A386718()
{
  return sub_20A38B850();
}

uint64_t sub_20A386778()
{
  return sub_20A38B840();
}

void *sub_20A3867C8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = (void *)sub_20A385D3C(a1, (uint64_t)v5);
  if (!v2) {
    return memcpy(a2, v5, 0x60uLL);
  }
  return result;
}

uint64_t sub_20A386814(void *a1)
{
  memcpy(v4, v1, sizeof(v4));
  return sub_20A385A34(a1);
}

uint64_t sub_20A386868()
{
  return sub_20A38B850();
}

uint64_t sub_20A3868C8()
{
  return sub_20A38B840();
}

double sub_20A386918@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_20A3863DC(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(unsigned char *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_20A386968(void *a1)
{
  return sub_20A386288(a1);
}

uint64_t sub_20A386980()
{
  return sub_20A38B850();
}

uint64_t sub_20A3869E0()
{
  return sub_20A38B840();
}

void *sub_20A386A30@<X0>(void *a1@<X8>)
{
  double result = (void *)sub_20A2FE960((uint64_t)v4);
  if (!v1) {
    return memcpy(a1, v4, 0x60uLL);
  }
  return result;
}

uint64_t sub_20A386A7C()
{
  memcpy(v2, v0, sizeof(v2));
  return sub_20A2FE6D8();
}

uint64_t sub_20A386AD0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20A2FED04();
  if (!v1) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_20A386AFC()
{
  return sub_20A2FEC78();
}

double sub_20A386B18@<D0>(uint64_t a1@<X8>)
{
  sub_20A2FF0F4((uint64_t)v5);
  if (!v1)
  {
    long long v4 = v5[1];
    *(_OWORD *)a1 = v5[0];
    *(_OWORD *)(a1 + 16) = v4;
    double result = *(double *)&v6;
    *(_OWORD *)(a1 + 32) = v6;
    *(unsigned char *)(a1 + 48) = v7;
  }
  return result;
}

uint64_t sub_20A386B68()
{
  return sub_20A2FEFF4();
}

unint64_t sub_20A386BB0()
{
  unint64_t result = qword_267628ED0;
  if (!qword_267628ED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628ED0);
  }
  return result;
}

unint64_t sub_20A386C00()
{
  unint64_t result = qword_267628ED8;
  if (!qword_267628ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628ED8);
  }
  return result;
}

unint64_t sub_20A386C50()
{
  unint64_t result = qword_267628EE0;
  if (!qword_267628EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628EE0);
  }
  return result;
}

unint64_t sub_20A386CA0()
{
  unint64_t result = qword_267628EE8;
  if (!qword_267628EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628EE8);
  }
  return result;
}

uint64_t sub_20A386CEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_20A38C930();
  if (v3)
  {
    long long v5 = (unsigned __int8 *)(a2 + 80);
    do
    {
      int v6 = *v5;
      if (*((void *)v5 - 5))
      {
        sub_20A38C940();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_20A38B6E0();
      }
      else
      {
        sub_20A38C940();
        swift_bridgeObjectRetain();
      }
      sub_20A38B6E0();
      sub_20A38C960();
      sub_20A38C940();
      if (!v6) {
        sub_20A38C960();
      }
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      v5 += 56;
      --v3;
    }
    while (v3);
  }
  return result;
}

unint64_t sub_20A386DF4()
{
  unint64_t result = qword_267628EF0;
  if (!qword_267628EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628EF0);
  }
  return result;
}

unint64_t sub_20A386E40()
{
  unint64_t result = qword_267628F00;
  if (!qword_267628F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628F00);
  }
  return result;
}

unint64_t sub_20A386E8C()
{
  unint64_t result = qword_267628F08;
  if (!qword_267628F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628F08);
  }
  return result;
}

unint64_t sub_20A386ED8()
{
  unint64_t result = qword_267628F10;
  if (!qword_267628F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628F10);
  }
  return result;
}

unint64_t sub_20A386F24()
{
  unint64_t result = qword_267628F20;
  if (!qword_267628F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628F20);
  }
  return result;
}

unint64_t sub_20A386F70()
{
  unint64_t result = qword_267628F28;
  if (!qword_267628F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628F28);
  }
  return result;
}

unint64_t sub_20A386FBC()
{
  unint64_t result = qword_267628F40;
  if (!qword_267628F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628F40);
  }
  return result;
}

unint64_t sub_20A387008()
{
  unint64_t result = qword_267628F48;
  if (!qword_267628F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628F48);
  }
  return result;
}

uint64_t sub_20A387054(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267627DD0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_20A3870C4()
{
  unint64_t result = qword_267628F58;
  if (!qword_267628F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628F58);
  }
  return result;
}

unint64_t sub_20A387110()
{
  unint64_t result = qword_267628F60;
  if (!qword_267628F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628F60);
  }
  return result;
}

uint64_t sub_20A38715C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267627DF8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_20A3871C0()
{
  unint64_t result = qword_267628F70;
  if (!qword_267628F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628F70);
  }
  return result;
}

unint64_t sub_20A38720C()
{
  unint64_t result = qword_267628F80;
  if (!qword_267628F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628F80);
  }
  return result;
}

unint64_t sub_20A387258()
{
  unint64_t result = qword_267628F90;
  if (!qword_267628F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628F90);
  }
  return result;
}

unint64_t sub_20A3872A4()
{
  unint64_t result = qword_267628FA8;
  if (!qword_267628FA8)
  {
    sub_20A3891B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628FA8);
  }
  return result;
}

unint64_t sub_20A3872F4()
{
  unint64_t result = qword_267625E28;
  if (!qword_267625E28)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_267625E28);
  }
  return result;
}

unint64_t sub_20A387334()
{
  unint64_t result = qword_267628FB0;
  if (!qword_267628FB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267628F98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628FB0);
  }
  return result;
}

void sub_20A387388()
{
}

unint64_t sub_20A3873A8()
{
  unint64_t result = qword_267628FB8;
  if (!qword_267628FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628FB8);
  }
  return result;
}

uint64_t sub_20A3873F8()
{
  return 8;
}

uint64_t sub_20A387404()
{
  return swift_release();
}

uint64_t sub_20A38740C(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_20A387420(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

unsigned char *storeEnumTagSinglePayload for WeatherMapScale.Point.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A3874F8);
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

ValueMetadata *type metadata accessor for WeatherMapScale.Point.CodingKeys()
{
  return &type metadata for WeatherMapScale.Point.CodingKeys;
}

uint64_t getEnumTagSinglePayload for WeatherMapScale.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF8)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v5 = v6 - 9;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for WeatherMapScale.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A387684);
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

ValueMetadata *type metadata accessor for WeatherMapScale.CodingKeys()
{
  return &type metadata for WeatherMapScale.CodingKeys;
}

void type metadata accessor for WeatherMapScaleSource()
{
}

unsigned char *sub_20A3876D0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A38779CLL);
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

void type metadata accessor for WeatherMapScale.Scaling()
{
}

unsigned char *sub_20A3877D0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x20A38789CLL);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

void type metadata accessor for WeatherMapScale.Kind()
{
}

unint64_t sub_20A3878D4()
{
  unint64_t result = qword_267628FC8;
  if (!qword_267628FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628FC8);
  }
  return result;
}

unint64_t sub_20A387924()
{
  unint64_t result = qword_267628FD0;
  if (!qword_267628FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628FD0);
  }
  return result;
}

unint64_t sub_20A387974()
{
  unint64_t result = qword_267628FD8;
  if (!qword_267628FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628FD8);
  }
  return result;
}

unint64_t sub_20A3879C4()
{
  unint64_t result = qword_267628FE0;
  if (!qword_267628FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628FE0);
  }
  return result;
}

unint64_t sub_20A387A14()
{
  unint64_t result = qword_267628FE8;
  if (!qword_267628FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628FE8);
  }
  return result;
}

unint64_t sub_20A387A64()
{
  unint64_t result = qword_267628FF0;
  if (!qword_267628FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628FF0);
  }
  return result;
}

unint64_t sub_20A387AB4()
{
  unint64_t result = qword_267628FF8;
  if (!qword_267628FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267628FF8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_17_21()
{
  return sub_20A38C6D0();
}

uint64_t sub_20A387B20(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && a1[8])
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *a1;
      BOOL v4 = v3 >= 2;
      int v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_20A387B6C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

void type metadata accessor for ParticleRenderConfiguration()
{
}

void type metadata accessor for ParticleStyle()
{
}

unsigned char *sub_20A387BC8(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A387C94);
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

void type metadata accessor for ParticleTrailStep()
{
}

uint64_t sub_20A387CC8(char a1)
{
  if (a1) {
    return 0x64656E696F6ALL;
  }
  else {
    return 0x746E696F70;
  }
}

uint64_t sub_20A387CF8(char a1)
{
  if (a1) {
    return 1953722224;
  }
  else {
    return 6648432;
  }
}

uint64_t sub_20A387D20(char *a1, char *a2)
{
  return sub_20A224238(*a1, *a2);
}

uint64_t sub_20A387D2C()
{
  return sub_20A3833E8();
}

uint64_t sub_20A387D34()
{
  return sub_20A2CD0BC();
}

uint64_t sub_20A387D3C()
{
  return sub_20A2CDCE4();
}

uint64_t sub_20A387D44@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20A3843B4();
  *a1 = result;
  return result;
}

uint64_t sub_20A387D7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_20A387CC8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_20A387DA8()
{
  return sub_20A38B850();
}

uint64_t sub_20A387E08()
{
  return sub_20A38B840();
}

uint64_t sub_20A387E58(char *a1, char *a2)
{
  return sub_20A2241B4(*a1, *a2);
}

uint64_t sub_20A387E64()
{
  return sub_20A3833F4();
}

uint64_t sub_20A387E6C()
{
  return sub_20A2CD060();
}

uint64_t sub_20A387E74()
{
  return sub_20A2CDD4C();
}

uint64_t sub_20A387E7C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20A3843B4();
  *a1 = result;
  return result;
}

uint64_t sub_20A387EB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_20A387CF8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_20A387EE0()
{
  return sub_20A38B850();
}

uint64_t sub_20A387F40()
{
  return sub_20A38B840();
}

unint64_t sub_20A387F94()
{
  unint64_t result = qword_267629000;
  if (!qword_267629000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267629000);
  }
  return result;
}

unint64_t sub_20A387FE4()
{
  unint64_t result = qword_267629008;
  if (!qword_267629008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267629008);
  }
  return result;
}

unint64_t sub_20A388030()
{
  unint64_t result = qword_267629010;
  if (!qword_267629010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267629010);
  }
  return result;
}

unint64_t sub_20A38807C()
{
  unint64_t result = qword_267629018;
  if (!qword_267629018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267629018);
  }
  return result;
}

uint64_t sub_20A3880C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = type metadata accessor for WeatherMapAnnotatedLocation(0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1_62();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v18 - v10;
  uint64_t v12 = v1 + OBJC_IVAR____TtC11WeatherMaps20WeatherMapAnnotation_annotatedLocation;
  OUTLINED_FUNCTION_5_43();
  sub_20A2BAB3C(v12, (uint64_t)v11);
  sub_20A2BAB3C((uint64_t)v11, (uint64_t)v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_20A2BABA0((uint64_t)v9, v2);
    uint64_t v13 = v2 + *(int *)(v4 + 20);
    uint64_t v14 = sub_20A3899F0();
    OUTLINED_FUNCTION_0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(a1, v13, v14);
    sub_20A388B98(v2, (void (*)(void))type metadata accessor for WeatherMapAnnotatedLocation);
    __swift_storeEnumTagSinglePayload(a1, 0, 1, v14);
  }
  else
  {
    uint64_t v16 = sub_20A3899F0();
    __swift_storeEnumTagSinglePayload(a1, 1, 1, v16);
    sub_20A388B98((uint64_t)v9, (void (*)(void))type metadata accessor for WeatherMapAnnotatedLocationData);
  }
  return sub_20A388B98((uint64_t)v11, (void (*)(void))type metadata accessor for WeatherMapAnnotatedLocationData);
}

uint64_t sub_20A3882AC()
{
  sub_20A38A2B0();
  OUTLINED_FUNCTION_2_3();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = OUTLINED_FUNCTION_1_62();
  uint64_t v5 = OUTLINED_FUNCTION_9(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_6_0();
  uint64_t v6 = v0 + OBJC_IVAR____TtC11WeatherMaps20WeatherMapAnnotation_annotatedLocation;
  OUTLINED_FUNCTION_5_43();
  sub_20A2BAB3C(v6, v2);
  sub_20A2BA5FC(v1);
  sub_20A388B98(v2, (void (*)(void))type metadata accessor for WeatherMapAnnotatedLocationData);
  uint64_t v7 = sub_20A38A260();
  uint64_t v8 = OUTLINED_FUNCTION_4_45();
  v9(v8);
  return v7;
}

uint64_t sub_20A3883B0(uint64_t a1)
{
  sub_20A38A2B0();
  OUTLINED_FUNCTION_2_3();
  uint64_t v35 = v4;
  uint64_t v36 = v3;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_3();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = type metadata accessor for WeatherMapAnnotatedLocationData(0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v34 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC39130);
  uint64_t v16 = OUTLINED_FUNCTION_9(v15);
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_3();
  uint64_t v19 = v18 - v17;
  uint64_t v20 = sub_20A3899F0();
  OUTLINED_FUNCTION_2_3();
  uint64_t v22 = v21;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_3();
  uint64_t v26 = v25 - v24;
  sub_20A388BF0(a1, v19);
  if (__swift_getEnumTagSinglePayload(v19, 1, v20) == 1)
  {
    sub_20A1DA8F0(v19);
    uint64_t v27 = v1 + OBJC_IVAR____TtC11WeatherMaps20WeatherMapAnnotation_annotatedLocation;
    swift_beginAccess();
    sub_20A2BAB3C(v27, (uint64_t)v11);
    sub_20A2BA5FC((uint64_t)v14);
    sub_20A1DA8F0(a1);
    sub_20A388B98((uint64_t)v11, (void (*)(void))type metadata accessor for WeatherMapAnnotatedLocationData);
    swift_storeEnumTagMultiPayload();
    swift_beginAccess();
    uint64_t v28 = (uint64_t)v14;
    uint64_t v29 = v27;
  }
  else
  {
    v34[1] = v8;
    uint64_t v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32);
    v30(v26, v19, v20);
    uint64_t v31 = v1 + OBJC_IVAR____TtC11WeatherMaps20WeatherMapAnnotation_annotatedLocation;
    swift_beginAccess();
    sub_20A2BAB3C(v31, (uint64_t)v11);
    sub_20A2BA5FC(v7);
    sub_20A1DA8F0(a1);
    sub_20A388B98((uint64_t)v11, (void (*)(void))type metadata accessor for WeatherMapAnnotatedLocationData);
    uint64_t v32 = type metadata accessor for WeatherMapAnnotatedLocation(0);
    v30((uint64_t)&v14[*(int *)(v32 + 20)], v26, v20);
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 32))(v14, v7, v36);
    swift_storeEnumTagMultiPayload();
    swift_beginAccess();
    uint64_t v28 = (uint64_t)v14;
    uint64_t v29 = v31;
  }
  sub_20A388C58(v28, v29);
  return swift_endAccess();
}

uint64_t sub_20A388748()
{
  sub_20A38A2B0();
  OUTLINED_FUNCTION_2_3();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = OUTLINED_FUNCTION_1_62();
  uint64_t v5 = OUTLINED_FUNCTION_9(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_6_0();
  uint64_t v6 = v0 + OBJC_IVAR____TtC11WeatherMaps20WeatherMapAnnotation_annotatedLocation;
  OUTLINED_FUNCTION_5_43();
  sub_20A2BAB3C(v6, v2);
  sub_20A2BA5FC(v1);
  sub_20A388B98(v2, (void (*)(void))type metadata accessor for WeatherMapAnnotatedLocationData);
  uint64_t v7 = sub_20A38A280();
  uint64_t v8 = OUTLINED_FUNCTION_4_45();
  v9(v8);
  return v7;
}

double sub_20A388890()
{
  sub_20A38A2B0();
  OUTLINED_FUNCTION_2_3();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = OUTLINED_FUNCTION_1_62();
  uint64_t v5 = OUTLINED_FUNCTION_9(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_6_0();
  uint64_t v6 = v0 + OBJC_IVAR____TtC11WeatherMaps20WeatherMapAnnotation_annotatedLocation;
  OUTLINED_FUNCTION_5_43();
  sub_20A2BAB3C(v6, v2);
  sub_20A2BA5FC(v1);
  sub_20A388B98(v2, (void (*)(void))type metadata accessor for WeatherMapAnnotatedLocationData);
  sub_20A38A220();
  double v8 = v7;
  uint64_t v9 = OUTLINED_FUNCTION_4_45();
  v10(v9);
  return v8;
}

id sub_20A38899C(uint64_t a1, unsigned char *a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  LOBYTE(a2) = *a2;
  sub_20A2BAB3C(a1, (uint64_t)&v2[OBJC_IVAR____TtC11WeatherMaps20WeatherMapAnnotation_annotatedLocation]);
  v2[OBJC_IVAR____TtC11WeatherMaps20WeatherMapAnnotation_overlayKind] = (_BYTE)a2;
  v8.receiver = v2;
  v8.super_class = ObjectType;
  id v6 = objc_msgSendSuper2(&v8, sel_init);
  sub_20A388B98(a1, (void (*)(void))type metadata accessor for WeatherMapAnnotatedLocationData);
  return v6;
}

void sub_20A388A38()
{
}

uint64_t sub_20A388AB0()
{
  return type metadata accessor for WeatherMapAnnotation();
}

uint64_t type metadata accessor for WeatherMapAnnotation()
{
  uint64_t result = qword_26AC3CB78;
  if (!qword_26AC3CB78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_20A388B00()
{
  uint64_t result = type metadata accessor for WeatherMapAnnotatedLocationData(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_20A388B98(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_20A388BF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC39130);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A388C58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WeatherMapAnnotatedLocationData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_20A388CE0()
{
  return MEMORY[0x270F9CC70]();
}

uint64_t sub_20A388CF0()
{
  return MEMORY[0x270F9CCA8]();
}

uint64_t sub_20A388D00()
{
  return MEMORY[0x270F9CCC0]();
}

uint64_t sub_20A388D10()
{
  return MEMORY[0x270F9CCD8]();
}

uint64_t sub_20A388D20()
{
  return MEMORY[0x270F9CCE0]();
}

uint64_t sub_20A388D30()
{
  return MEMORY[0x270F9CD28]();
}

uint64_t sub_20A388D40()
{
  return MEMORY[0x270F9CD38]();
}

uint64_t sub_20A388D50()
{
  return MEMORY[0x270F9CD68]();
}

uint64_t sub_20A388D60()
{
  return MEMORY[0x270EEDBA0]();
}

uint64_t sub_20A388D70()
{
  return MEMORY[0x270F84AA0]();
}

uint64_t sub_20A388D80()
{
  return MEMORY[0x270EEDBD0]();
}

uint64_t sub_20A388D90()
{
  return MEMORY[0x270F84FA8]();
}

uint64_t sub_20A388DA0()
{
  return MEMORY[0x270F84FB0]();
}

uint64_t sub_20A388DB0()
{
  return MEMORY[0x270F84FB8]();
}

uint64_t sub_20A388DC0()
{
  return MEMORY[0x270F84FC0]();
}

uint64_t sub_20A388DD0()
{
  return MEMORY[0x270EEDBF8]();
}

uint64_t sub_20A388DE0()
{
  return MEMORY[0x270EEDC48]();
}

uint64_t sub_20A388DF0()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_20A388E00()
{
  return MEMORY[0x270EEDC68]();
}

uint64_t sub_20A388E10()
{
  return MEMORY[0x270EEDCA0]();
}

uint64_t sub_20A388E20()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_20A388E30()
{
  return MEMORY[0x270EEDD18]();
}

uint64_t sub_20A388E40()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_20A388E50()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_20A388E60()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_20A388E70()
{
  return MEMORY[0x270EEDF60]();
}

uint64_t sub_20A388E80()
{
  return MEMORY[0x270EEDFA0]();
}

uint64_t sub_20A388E90()
{
  return MEMORY[0x270EEDFA8]();
}

uint64_t sub_20A388EA0()
{
  return MEMORY[0x270EEDFC0]();
}

uint64_t sub_20A388EB0()
{
  return MEMORY[0x270EEDFC8]();
}

uint64_t sub_20A388EC0()
{
  return MEMORY[0x270F85260]();
}

uint64_t sub_20A388ED0()
{
  return MEMORY[0x270F85268]();
}

uint64_t sub_20A388EE0()
{
  return MEMORY[0x270EEDFF8]();
}

uint64_t sub_20A388EF0()
{
  return MEMORY[0x270EEE040]();
}

uint64_t sub_20A388F00()
{
  return MEMORY[0x270EEE048]();
}

uint64_t sub_20A388F10()
{
  return MEMORY[0x270EEE058]();
}

uint64_t sub_20A388F20()
{
  return MEMORY[0x270EEE068]();
}

uint64_t sub_20A388F30()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_20A388F40()
{
  return MEMORY[0x270EEE0C0]();
}

uint64_t sub_20A388F50()
{
  return MEMORY[0x270EEE208]();
}

uint64_t sub_20A388F60()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_20A388F70()
{
  return MEMORY[0x270EEE2E8]();
}

uint64_t sub_20A388F80()
{
  return MEMORY[0x270EEE328]();
}

uint64_t sub_20A388F90()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_20A388FA0()
{
  return MEMORY[0x270EEE360]();
}

uint64_t sub_20A388FB0()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_20A388FC0()
{
  return MEMORY[0x270EEE388]();
}

uint64_t sub_20A388FD0()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_20A388FE0()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_20A388FF0()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_20A389000()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_20A389010()
{
  return MEMORY[0x270EEE4B0]();
}

uint64_t sub_20A389020()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_20A389030()
{
  return MEMORY[0x270EEE4D8]();
}

uint64_t sub_20A389040()
{
  return MEMORY[0x270EEE4E0]();
}

uint64_t sub_20A389050()
{
  return MEMORY[0x270EEE518]();
}

uint64_t sub_20A389060()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_20A389070()
{
  return MEMORY[0x270EEE530]();
}

uint64_t sub_20A389080()
{
  return MEMORY[0x270EEE548]();
}

uint64_t sub_20A389090()
{
  return MEMORY[0x270EEE558]();
}

uint64_t sub_20A3890A0()
{
  return MEMORY[0x270EEE568]();
}

uint64_t sub_20A3890B0()
{
  return MEMORY[0x270EEE578]();
}

uint64_t sub_20A3890C0()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_20A3890D0()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_20A3890E0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_20A3890F0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_20A389100()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_20A389110()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_20A389120()
{
  return MEMORY[0x270EEE828]();
}

uint64_t sub_20A389130()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_20A389140()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_20A389150()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_20A389160()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_20A389170()
{
  return MEMORY[0x270EE05B0]();
}

uint64_t sub_20A389180()
{
  return MEMORY[0x270F816C0]();
}

uint64_t sub_20A389190()
{
  return MEMORY[0x270EEEB78]();
}

uint64_t sub_20A3891A0()
{
  return MEMORY[0x270F852A8]();
}

uint64_t sub_20A3891B0()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_20A3891C0()
{
  return MEMORY[0x270EEEDF0]();
}

uint64_t sub_20A3891D0()
{
  return MEMORY[0x270EEEE18]();
}

uint64_t sub_20A3891E0()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_20A3891F0()
{
  return MEMORY[0x270EEF020]();
}

uint64_t sub_20A389200()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_20A389210()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_20A389220()
{
  return MEMORY[0x270EEF180]();
}

uint64_t sub_20A389230()
{
  return MEMORY[0x270EE05D0]();
}

uint64_t sub_20A389240()
{
  return MEMORY[0x270F816D8]();
}

uint64_t sub_20A389250()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_20A389260()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_20A389270()
{
  return MEMORY[0x270EEF930]();
}

uint64_t sub_20A389280()
{
  return MEMORY[0x270EEF950]();
}

uint64_t sub_20A389290()
{
  return MEMORY[0x270EEF9B8]();
}

uint64_t sub_20A3892A0()
{
  return MEMORY[0x270EEFA30]();
}

uint64_t sub_20A3892B0()
{
  return MEMORY[0x270EEFB10]();
}

uint64_t sub_20A3892C0()
{
  return MEMORY[0x270EEFB28]();
}

uint64_t sub_20A3892D0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_20A3892E0()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_20A3892F0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_20A389300()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_20A389310()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_20A389320()
{
  return MEMORY[0x270EEFF98]();
}

uint64_t sub_20A389330()
{
  return MEMORY[0x270EEFFB8]();
}

uint64_t sub_20A389340()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_20A389350()
{
  return MEMORY[0x270EF0008]();
}

uint64_t sub_20A389360()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_20A389370()
{
  return MEMORY[0x270EF00D0]();
}

uint64_t sub_20A389380()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_20A389390()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_20A3893A0()
{
  return MEMORY[0x270EF01B0]();
}

uint64_t sub_20A3893B0()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_20A3893C0()
{
  return MEMORY[0x270EF02A8]();
}

uint64_t sub_20A3893D0()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_20A3893E0()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_20A3893F0()
{
  return MEMORY[0x270F79E68]();
}

uint64_t sub_20A389400()
{
  return MEMORY[0x270F79E70]();
}

uint64_t sub_20A389410()
{
  return MEMORY[0x270F84AC0]();
}

uint64_t sub_20A389420()
{
  return MEMORY[0x270F84AD0]();
}

uint64_t sub_20A389430()
{
  return MEMORY[0x270F84FC8]();
}

uint64_t sub_20A389440()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_20A389450()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_20A389460()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_20A389470()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_20A389480()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_20A389490()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_20A3894A0()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_20A3894B0()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_20A3894C0()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_20A3894D0()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_20A3894E0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_20A3894F0()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_20A389500()
{
  return MEMORY[0x270EF0BD8]();
}

uint64_t sub_20A389510()
{
  return MEMORY[0x270F852C8]();
}

uint64_t sub_20A389520()
{
  return MEMORY[0x270F852D0]();
}

uint64_t sub_20A389530()
{
  return MEMORY[0x270F852E8]();
}

uint64_t sub_20A389540()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_20A389550()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_20A389560()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_20A389570()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_20A389580()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_20A389590()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_20A3895A0()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_20A3895B0()
{
  return MEMORY[0x270F84FD0]();
}

uint64_t sub_20A3895C0()
{
  return MEMORY[0x270EF0E70]();
}

uint64_t sub_20A3895D0()
{
  return MEMORY[0x270EF0E80]();
}

uint64_t sub_20A3895E0()
{
  return MEMORY[0x270EF0E90]();
}

uint64_t sub_20A3895F0()
{
  return MEMORY[0x270EF0E98]();
}

uint64_t sub_20A389600()
{
  return MEMORY[0x270EF0EB0]();
}

uint64_t sub_20A389610()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_20A389620()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_20A389630()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_20A389640()
{
  return MEMORY[0x270F84AF8]();
}

uint64_t sub_20A389650()
{
  return MEMORY[0x270F84B08]();
}

uint64_t sub_20A389660()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_20A389670()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_20A389680()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_20A389690()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_20A3896A0()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_20A3896B0()
{
  return MEMORY[0x270F84FD8]();
}

uint64_t sub_20A3896C0()
{
  return MEMORY[0x270EF1150]();
}

uint64_t sub_20A3896D0()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_20A3896E0()
{
  return MEMORY[0x270EF12C8]();
}

uint64_t sub_20A3896F0()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_20A389700()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_20A389710()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_20A389720()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_20A389730()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_20A389740()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_20A389750()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_20A389760()
{
  return MEMORY[0x270F06B18]();
}

uint64_t sub_20A389770()
{
  return MEMORY[0x270F06B38]();
}

uint64_t sub_20A389780()
{
  return MEMORY[0x270F06B70]();
}

uint64_t sub_20A389790()
{
  return MEMORY[0x270F06B90]();
}

uint64_t sub_20A3897A0()
{
  return MEMORY[0x270F06BC8]();
}

uint64_t sub_20A3897B0()
{
  return MEMORY[0x270F06BF8]();
}

uint64_t sub_20A3897C0()
{
  return MEMORY[0x270F06C10]();
}

uint64_t sub_20A3897D0()
{
  return MEMORY[0x270F06C40]();
}

uint64_t sub_20A3897E0()
{
  return MEMORY[0x270F06C48]();
}

uint64_t sub_20A3897F0()
{
  return MEMORY[0x270F85340]();
}

uint64_t sub_20A389800()
{
  return MEMORY[0x270F06CA8]();
}

uint64_t sub_20A389810()
{
  return MEMORY[0x270F06CB0]();
}

uint64_t sub_20A389820()
{
  return MEMORY[0x270F06CC0]();
}

uint64_t sub_20A389830()
{
  return MEMORY[0x270F06CF8]();
}

uint64_t sub_20A389840()
{
  return MEMORY[0x270F06D38]();
}

uint64_t sub_20A389850()
{
  return MEMORY[0x270F06D40]();
}

uint64_t sub_20A389860()
{
  return MEMORY[0x270F06D70]();
}

uint64_t sub_20A389870()
{
  return MEMORY[0x270F06D78]();
}

uint64_t sub_20A389880()
{
  return MEMORY[0x270F06DF0]();
}

uint64_t sub_20A389890()
{
  return MEMORY[0x270F06DF8]();
}

uint64_t sub_20A3898A0()
{
  return MEMORY[0x270F06E00]();
}

uint64_t sub_20A3898B0()
{
  return MEMORY[0x270F06E08]();
}

uint64_t sub_20A3898C0()
{
  return MEMORY[0x270F06E10]();
}

uint64_t sub_20A3898D0()
{
  return MEMORY[0x270F06E18]();
}

uint64_t sub_20A3898E0()
{
  return MEMORY[0x270F06E20]();
}

uint64_t sub_20A3898F0()
{
  return MEMORY[0x270F06E28]();
}

uint64_t sub_20A389900()
{
  return MEMORY[0x270F06E68]();
}

uint64_t sub_20A389910()
{
  return MEMORY[0x270F06E80]();
}

uint64_t sub_20A389920()
{
  return MEMORY[0x270F06E88]();
}

uint64_t sub_20A389940()
{
  return MEMORY[0x270F06EB8]();
}

uint64_t sub_20A389950()
{
  return MEMORY[0x270F85370]();
}

uint64_t sub_20A389960()
{
  return MEMORY[0x270F06EE8]();
}

uint64_t sub_20A389970()
{
  return MEMORY[0x270F06EF0]();
}

uint64_t sub_20A389980()
{
  return MEMORY[0x270F06EF8]();
}

uint64_t sub_20A389990()
{
  return MEMORY[0x270F06F00]();
}

uint64_t sub_20A3899A0()
{
  return MEMORY[0x270F06F08]();
}

uint64_t sub_20A3899B0()
{
  return MEMORY[0x270F06F10]();
}

uint64_t sub_20A3899C0()
{
  return MEMORY[0x270F06F18]();
}

uint64_t sub_20A3899D0()
{
  return MEMORY[0x270F06F20]();
}

uint64_t sub_20A3899E0()
{
  return MEMORY[0x270F06F28]();
}

uint64_t sub_20A3899F0()
{
  return MEMORY[0x270F06F30]();
}

uint64_t sub_20A389A00()
{
  return MEMORY[0x270F85378]();
}

uint64_t sub_20A389A10()
{
  return MEMORY[0x270F06F50]();
}

uint64_t sub_20A389A20()
{
  return MEMORY[0x270F06F60]();
}

uint64_t sub_20A389A30()
{
  return MEMORY[0x270F06F68]();
}

uint64_t sub_20A389A40()
{
  return MEMORY[0x270F06F70]();
}

uint64_t sub_20A389A50()
{
  return MEMORY[0x270F06F80]();
}

uint64_t sub_20A389A60()
{
  return MEMORY[0x270F06F98]();
}

uint64_t sub_20A389A70()
{
  return MEMORY[0x270F06FA0]();
}

uint64_t sub_20A389A80()
{
  return MEMORY[0x270F06FB8]();
}

uint64_t sub_20A389A90()
{
  return MEMORY[0x270F06FC0]();
}

uint64_t sub_20A389AA0()
{
  return MEMORY[0x270F06FD0]();
}

uint64_t sub_20A389AB0()
{
  return MEMORY[0x270F06FE0]();
}

uint64_t sub_20A389AC0()
{
  return MEMORY[0x270F85380]();
}

uint64_t sub_20A389AD0()
{
  return MEMORY[0x270F85388]();
}

uint64_t sub_20A389AE0()
{
  return MEMORY[0x270F85390]();
}

uint64_t sub_20A389AF0()
{
  return MEMORY[0x270F07060]();
}

uint64_t sub_20A389B00()
{
  return MEMORY[0x270F07068]();
}

uint64_t sub_20A389B10()
{
  return MEMORY[0x270F07070]();
}

uint64_t sub_20A389B20()
{
  return MEMORY[0x270F07080]();
}

uint64_t sub_20A389B30()
{
  return MEMORY[0x270F07100]();
}

uint64_t sub_20A389B40()
{
  return MEMORY[0x270F07108]();
}

uint64_t sub_20A389B50()
{
  return MEMORY[0x270F07110]();
}

uint64_t sub_20A389B60()
{
  return MEMORY[0x270F07130]();
}

uint64_t sub_20A389B70()
{
  return MEMORY[0x270F071D0]();
}

uint64_t sub_20A389B80()
{
  return MEMORY[0x270F071D8]();
}

uint64_t sub_20A389B90()
{
  return MEMORY[0x270F071E0]();
}

uint64_t sub_20A389BA0()
{
  return MEMORY[0x270F071E8]();
}

uint64_t sub_20A389BB0()
{
  return MEMORY[0x270F071F0]();
}

uint64_t sub_20A389BC0()
{
  return MEMORY[0x270F071F8]();
}

uint64_t sub_20A389BD0()
{
  return MEMORY[0x270F07200]();
}

uint64_t sub_20A389BE0()
{
  return MEMORY[0x270F07208]();
}

uint64_t sub_20A389BF0()
{
  return MEMORY[0x270F07268]();
}

uint64_t sub_20A389C00()
{
  return MEMORY[0x270F07280]();
}

uint64_t sub_20A389C10()
{
  return MEMORY[0x270F07288]();
}

uint64_t sub_20A389C20()
{
  return MEMORY[0x270F07290]();
}

uint64_t sub_20A389C30()
{
  return MEMORY[0x270F84B18]();
}

uint64_t sub_20A389C40()
{
  return MEMORY[0x270F84B20]();
}

uint64_t sub_20A389C70()
{
  return MEMORY[0x270F7A890]();
}

uint64_t sub_20A389C90()
{
  return MEMORY[0x270F7A8A8]();
}

uint64_t sub_20A389CA0()
{
  return MEMORY[0x270F7A8B0]();
}

uint64_t sub_20A389CC0()
{
  return MEMORY[0x270F7A8C0]();
}

uint64_t _s11TeaSettings0B0C11WeatherMapsE0D0V15WindOverlayHintCfd_0()
{
  return MEMORY[0x270F7A8C8]();
}

uint64_t sub_20A389CE0()
{
  return MEMORY[0x270F7A8D0]();
}

uint64_t sub_20A389CF0()
{
  return MEMORY[0x270F7A8D8]();
}

uint64_t sub_20A389D00()
{
  return MEMORY[0x270F7A8E0]();
}

uint64_t sub_20A389D10()
{
  return MEMORY[0x270F7A8E8]();
}

uint64_t sub_20A389D20()
{
  return MEMORY[0x270F7A8F0]();
}

uint64_t sub_20A389D30()
{
  return MEMORY[0x270F7A8F8]();
}

uint64_t sub_20A389D40()
{
  return MEMORY[0x270F7A900]();
}

uint64_t sub_20A389D50()
{
  return MEMORY[0x270F7A908]();
}

uint64_t sub_20A389D60()
{
  return MEMORY[0x270F7A910]();
}

uint64_t sub_20A389D70()
{
  return MEMORY[0x270F7A918]();
}

uint64_t sub_20A389D80()
{
  return MEMORY[0x270F7A920]();
}

uint64_t sub_20A389D90()
{
  return MEMORY[0x270F84B28]();
}

uint64_t sub_20A389DA0()
{
  return MEMORY[0x270F7A928]();
}

uint64_t sub_20A389DB0()
{
  return MEMORY[0x270F7A930]();
}

uint64_t sub_20A389DC0()
{
  return MEMORY[0x270F7A940]();
}

uint64_t sub_20A389DD0()
{
  return MEMORY[0x270F7A948]();
}

uint64_t sub_20A389DE0()
{
  return MEMORY[0x270F7A950]();
}

uint64_t sub_20A389DF0()
{
  return MEMORY[0x270F7A958]();
}

uint64_t sub_20A389E00()
{
  return MEMORY[0x270F7A960]();
}

uint64_t sub_20A389E10()
{
  return MEMORY[0x270F7A970]();
}

uint64_t sub_20A389E20()
{
  return MEMORY[0x270F84B30]();
}

uint64_t sub_20A389E30()
{
  return MEMORY[0x270F84B38]();
}

uint64_t sub_20A389E40()
{
  return MEMORY[0x270F84B40]();
}

uint64_t sub_20A389E50()
{
  return MEMORY[0x270F84B48]();
}

uint64_t sub_20A389E60()
{
  return MEMORY[0x270F84B50]();
}

uint64_t sub_20A389E70()
{
  return MEMORY[0x270F84B58]();
}

uint64_t sub_20A389E80()
{
  return MEMORY[0x270F84B60]();
}

uint64_t sub_20A389E90()
{
  return MEMORY[0x270F84B68]();
}

uint64_t sub_20A389EA0()
{
  return MEMORY[0x270F84B90]();
}

uint64_t sub_20A389EB0()
{
  return MEMORY[0x270F84B98]();
}

uint64_t sub_20A389EC0()
{
  return MEMORY[0x270F84BB8]();
}

uint64_t sub_20A389ED0()
{
  return MEMORY[0x270F84BD0]();
}

uint64_t sub_20A389EE0()
{
  return MEMORY[0x270F84BD8]();
}

uint64_t sub_20A389EF0()
{
  return MEMORY[0x270F84C00]();
}

uint64_t sub_20A389F00()
{
  return MEMORY[0x270F84C28]();
}

uint64_t sub_20A389F10()
{
  return MEMORY[0x270F84C38]();
}

uint64_t sub_20A389F20()
{
  return MEMORY[0x270F84C40]();
}

uint64_t sub_20A389F30()
{
  return MEMORY[0x270F84C48]();
}

uint64_t sub_20A389F40()
{
  return MEMORY[0x270F84C50]();
}

uint64_t sub_20A389F50()
{
  return MEMORY[0x270F84C58]();
}

uint64_t sub_20A389F60()
{
  return MEMORY[0x270F84C60]();
}

uint64_t sub_20A389F70()
{
  return MEMORY[0x270F84C68]();
}

uint64_t sub_20A389F80()
{
  return MEMORY[0x270F84C70]();
}

uint64_t sub_20A389F90()
{
  return MEMORY[0x270F84C78]();
}

uint64_t sub_20A389FA0()
{
  return MEMORY[0x270F84C80]();
}

uint64_t sub_20A389FB0()
{
  return MEMORY[0x270F84C88]();
}

uint64_t sub_20A389FC0()
{
  return MEMORY[0x270F84C90]();
}

uint64_t sub_20A389FD0()
{
  return MEMORY[0x270F84C98]();
}

uint64_t sub_20A389FE0()
{
  return MEMORY[0x270F84CA0]();
}

uint64_t sub_20A389FF0()
{
  return MEMORY[0x270F84CA8]();
}

uint64_t sub_20A38A000()
{
  return MEMORY[0x270F84CB0]();
}

uint64_t sub_20A38A010()
{
  return MEMORY[0x270F84CB8]();
}

uint64_t sub_20A38A020()
{
  return MEMORY[0x270F84CC0]();
}

uint64_t sub_20A38A030()
{
  return MEMORY[0x270F84CC8]();
}

uint64_t sub_20A38A040()
{
  return MEMORY[0x270F84CD0]();
}

uint64_t sub_20A38A050()
{
  return MEMORY[0x270F84CD8]();
}

uint64_t sub_20A38A060()
{
  return MEMORY[0x270F84CE0]();
}

uint64_t sub_20A38A070()
{
  return MEMORY[0x270F84CE8]();
}

uint64_t sub_20A38A080()
{
  return MEMORY[0x270F84CF0]();
}

uint64_t sub_20A38A090()
{
  return MEMORY[0x270F84CF8]();
}

uint64_t sub_20A38A0A0()
{
  return MEMORY[0x270F84D00]();
}

uint64_t sub_20A38A0B0()
{
  return MEMORY[0x270F84D08]();
}

uint64_t sub_20A38A0C0()
{
  return MEMORY[0x270F84D10]();
}

uint64_t sub_20A38A0D0()
{
  return MEMORY[0x270F84D18]();
}

uint64_t sub_20A38A0E0()
{
  return MEMORY[0x270F84D20]();
}

uint64_t sub_20A38A0F0()
{
  return MEMORY[0x270F84D28]();
}

uint64_t sub_20A38A100()
{
  return MEMORY[0x270F84D30]();
}

uint64_t sub_20A38A110()
{
  return MEMORY[0x270F84D38]();
}

uint64_t sub_20A38A120()
{
  return MEMORY[0x270F84D48]();
}

uint64_t sub_20A38A130()
{
  return MEMORY[0x270F84DF0]();
}

uint64_t sub_20A38A140()
{
  return MEMORY[0x270F84DF8]();
}

uint64_t sub_20A38A150()
{
  return MEMORY[0x270F84E00]();
}

uint64_t sub_20A38A160()
{
  return MEMORY[0x270F84E08]();
}

uint64_t sub_20A38A170()
{
  return MEMORY[0x270F84E10]();
}

uint64_t sub_20A38A180()
{
  return MEMORY[0x270F84E58]();
}

uint64_t sub_20A38A190()
{
  return MEMORY[0x270F84E70]();
}

uint64_t sub_20A38A1A0()
{
  return MEMORY[0x270F84E78]();
}

uint64_t sub_20A38A1B0()
{
  return MEMORY[0x270F84E80]();
}

uint64_t sub_20A38A1C0()
{
  return MEMORY[0x270F84E88]();
}

uint64_t sub_20A38A1D0()
{
  return MEMORY[0x270F84E98]();
}

uint64_t sub_20A38A1E0()
{
  return MEMORY[0x270F84EC0]();
}

uint64_t sub_20A38A1F0()
{
  return MEMORY[0x270F84EC8]();
}

uint64_t sub_20A38A200()
{
  return MEMORY[0x270F84ED8]();
}

uint64_t sub_20A38A210()
{
  return MEMORY[0x270F84EE0]();
}

uint64_t sub_20A38A220()
{
  return MEMORY[0x270F84EE8]();
}

uint64_t sub_20A38A230()
{
  return MEMORY[0x270F84EF0]();
}

uint64_t sub_20A38A240()
{
  return MEMORY[0x270F84EF8]();
}

uint64_t sub_20A38A250()
{
  return MEMORY[0x270F84F00]();
}

uint64_t sub_20A38A260()
{
  return MEMORY[0x270F84F08]();
}

uint64_t sub_20A38A270()
{
  return MEMORY[0x270F84F10]();
}

uint64_t sub_20A38A280()
{
  return MEMORY[0x270F84F18]();
}

uint64_t sub_20A38A290()
{
  return MEMORY[0x270F84F20]();
}

uint64_t sub_20A38A2A0()
{
  return MEMORY[0x270F84F28]();
}

uint64_t sub_20A38A2B0()
{
  return MEMORY[0x270F84F30]();
}

uint64_t sub_20A38A2C0()
{
  return MEMORY[0x270F84F38]();
}

uint64_t sub_20A38A2D0()
{
  return MEMORY[0x270F84F40]();
}

uint64_t sub_20A38A2E0()
{
  return MEMORY[0x270F84F48]();
}

uint64_t sub_20A38A2F0()
{
  return MEMORY[0x270F84F50]();
}

uint64_t sub_20A38A300()
{
  return MEMORY[0x270EE57F8]();
}

uint64_t sub_20A38A310()
{
  return MEMORY[0x270EF17B0]();
}

uint64_t sub_20A38A320()
{
  return MEMORY[0x270EF17B8]();
}

uint64_t sub_20A38A330()
{
  return MEMORY[0x270EF17D0]();
}

uint64_t sub_20A38A340()
{
  return MEMORY[0x270EF17E0]();
}

uint64_t sub_20A38A350()
{
  return MEMORY[0x270F7AAD0]();
}

uint64_t sub_20A38A360()
{
  return MEMORY[0x270F79ED8]();
}

uint64_t sub_20A38A370()
{
  return MEMORY[0x270F79EF8]();
}

uint64_t sub_20A38A380()
{
  return MEMORY[0x270F79F00]();
}

uint64_t sub_20A38A390()
{
  return MEMORY[0x270F79F08]();
}

uint64_t sub_20A38A3A0()
{
  return MEMORY[0x270F79F10]();
}

uint64_t sub_20A38A3B0()
{
  return MEMORY[0x270F79F18]();
}

uint64_t sub_20A38A3C0()
{
  return MEMORY[0x270F79F20]();
}

uint64_t sub_20A38A3D0()
{
  return MEMORY[0x270F79F28]();
}

uint64_t sub_20A38A3E0()
{
  return MEMORY[0x270F79F38]();
}

uint64_t sub_20A38A3F0()
{
  return MEMORY[0x270F79F68]();
}

uint64_t sub_20A38A400()
{
  return MEMORY[0x270F79F88]();
}

uint64_t sub_20A38A410()
{
  return MEMORY[0x270F79FE0]();
}

uint64_t sub_20A38A420()
{
  return MEMORY[0x270F79FE8]();
}

uint64_t sub_20A38A430()
{
  return MEMORY[0x270F79FF0]();
}

uint64_t sub_20A38A440()
{
  return MEMORY[0x270F7A000]();
}

uint64_t sub_20A38A450()
{
  return MEMORY[0x270F7A008]();
}

uint64_t sub_20A38A460()
{
  return MEMORY[0x270F7A038]();
}

uint64_t sub_20A38A470()
{
  return MEMORY[0x270F7A0A8]();
}

uint64_t sub_20A38A480()
{
  return MEMORY[0x270F7A0B0]();
}

uint64_t sub_20A38A490()
{
  return MEMORY[0x270F7A0C0]();
}

uint64_t sub_20A38A4A0()
{
  return MEMORY[0x270F7A0C8]();
}

uint64_t sub_20A38A4B0()
{
  return MEMORY[0x270F7A208]();
}

uint64_t sub_20A38A4C0()
{
  return MEMORY[0x270F7A210]();
}

uint64_t sub_20A38A4D0()
{
  return MEMORY[0x270F7A388]();
}

uint64_t sub_20A38A4E0()
{
  return MEMORY[0x270F7A3A8]();
}

uint64_t sub_20A38A4F0()
{
  return MEMORY[0x270F7A3B0]();
}

uint64_t sub_20A38A500()
{
  return MEMORY[0x270F7A410]();
}

uint64_t sub_20A38A510()
{
  return MEMORY[0x270F7A418]();
}

uint64_t sub_20A38A520()
{
  return MEMORY[0x270F7A420]();
}

uint64_t sub_20A38A530()
{
  return MEMORY[0x270F7A428]();
}

uint64_t sub_20A38A540()
{
  return MEMORY[0x270F7A4A0]();
}

uint64_t sub_20A38A550()
{
  return MEMORY[0x270F7A4A8]();
}

uint64_t sub_20A38A560()
{
  return MEMORY[0x270F7A4D8]();
}

uint64_t sub_20A38A570()
{
  return MEMORY[0x270F7A4E8]();
}

uint64_t sub_20A38A580()
{
  return MEMORY[0x270F7A4F8]();
}

uint64_t sub_20A38A590()
{
  return MEMORY[0x270F7A508]();
}

uint64_t sub_20A38A5A0()
{
  return MEMORY[0x270F7A510]();
}

uint64_t sub_20A38A5B0()
{
  return MEMORY[0x270F7A518]();
}

uint64_t sub_20A38A5C0()
{
  return MEMORY[0x270F7A560]();
}

uint64_t sub_20A38A5D0()
{
  return MEMORY[0x270F7A580]();
}

uint64_t sub_20A38A5E0()
{
  return MEMORY[0x270F7A588]();
}

uint64_t sub_20A38A5F0()
{
  return MEMORY[0x270F7A590]();
}

uint64_t sub_20A38A600()
{
  return MEMORY[0x270F7A598]();
}

uint64_t sub_20A38A610()
{
  return MEMORY[0x270F7A5A0]();
}

uint64_t sub_20A38A620()
{
  return MEMORY[0x270F7A5B0]();
}

uint64_t sub_20A38A630()
{
  return MEMORY[0x270F7A5B8]();
}

uint64_t sub_20A38A640()
{
  return MEMORY[0x270F7A5C0]();
}

uint64_t sub_20A38A650()
{
  return MEMORY[0x270F7A5C8]();
}

uint64_t sub_20A38A660()
{
  return MEMORY[0x270F7A5D0]();
}

uint64_t sub_20A38A670()
{
  return MEMORY[0x270F7A5D8]();
}

uint64_t sub_20A38A680()
{
  return MEMORY[0x270F7A5E0]();
}

uint64_t sub_20A38A6A0()
{
  return MEMORY[0x270F7A608]();
}

uint64_t sub_20A38A6B0()
{
  return MEMORY[0x270F7A610]();
}

uint64_t sub_20A38A6C0()
{
  return MEMORY[0x270F7A618]();
}

uint64_t sub_20A38A6D0()
{
  return MEMORY[0x270F7A620]();
}

uint64_t sub_20A38A6E0()
{
  return MEMORY[0x270F7A640]();
}

uint64_t sub_20A38A6F0()
{
  return MEMORY[0x270F7A648]();
}

uint64_t sub_20A38A700()
{
  return MEMORY[0x270F7A650]();
}

uint64_t sub_20A38A710()
{
  return MEMORY[0x270F7A658]();
}

uint64_t sub_20A38A720()
{
  return MEMORY[0x270F7A670]();
}

uint64_t sub_20A38A730()
{
  return MEMORY[0x270F7A678]();
}

uint64_t sub_20A38A740()
{
  return MEMORY[0x270F7A680]();
}

uint64_t sub_20A38A750()
{
  return MEMORY[0x270F7A690]();
}

uint64_t sub_20A38A760()
{
  return MEMORY[0x270F7A6C8]();
}

uint64_t sub_20A38A770()
{
  return MEMORY[0x270F7A6D0]();
}

uint64_t sub_20A38A780()
{
  return MEMORY[0x270F7A6D8]();
}

uint64_t sub_20A38A790()
{
  return MEMORY[0x270F7A6E0]();
}

uint64_t sub_20A38A7A0()
{
  return MEMORY[0x270F7A700]();
}

uint64_t sub_20A38A7B0()
{
  return MEMORY[0x270F7A708]();
}

uint64_t sub_20A38A7C0()
{
  return MEMORY[0x270F7A710]();
}

uint64_t sub_20A38A7D0()
{
  return MEMORY[0x270F7A720]();
}

uint64_t sub_20A38A7E0()
{
  return MEMORY[0x270F7A770]();
}

uint64_t sub_20A38A7F0()
{
  return MEMORY[0x270F7A778]();
}

uint64_t sub_20A38A800()
{
  return MEMORY[0x270F85080]();
}

uint64_t sub_20A38A810()
{
  return MEMORY[0x270F85088]();
}

uint64_t sub_20A38A820()
{
  return MEMORY[0x270F850C8]();
}

uint64_t sub_20A38A830()
{
  return MEMORY[0x270F850D0]();
}

uint64_t sub_20A38A840()
{
  return MEMORY[0x270F850E8]();
}

uint64_t sub_20A38A850()
{
  return MEMORY[0x270F85100]();
}

uint64_t sub_20A38A860()
{
  return MEMORY[0x270F85110]();
}

uint64_t sub_20A38A870()
{
  return MEMORY[0x270F85118]();
}

uint64_t sub_20A38A880()
{
  return MEMORY[0x270F85160]();
}

uint64_t sub_20A38A890()
{
  return MEMORY[0x270F85178]();
}

uint64_t sub_20A38A8A0()
{
  return MEMORY[0x270F85198]();
}

uint64_t sub_20A38A8B0()
{
  return MEMORY[0x270F851A8]();
}

uint64_t sub_20A38A8C0()
{
  return MEMORY[0x270F851E0]();
}

uint64_t sub_20A38A8D0()
{
  return MEMORY[0x270F851E8]();
}

uint64_t sub_20A38A8E0()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_20A38A8F0()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_20A38A900()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_20A38A910()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_20A38A920()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_20A38A930()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_20A38A940()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_20A38A950()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_20A38A960()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_20A38A970()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_20A38A980()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_20A38A990()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_20A38A9A0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_20A38A9B0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_20A38A9C0()
{
  return MEMORY[0x270F7AC70]();
}

uint64_t sub_20A38A9D0()
{
  return MEMORY[0x270F7ACA8]();
}

uint64_t sub_20A38A9E0()
{
  return MEMORY[0x270F7ACB0]();
}

uint64_t sub_20A38A9F0()
{
  return MEMORY[0x270F7AF90]();
}

uint64_t sub_20A38AA00()
{
  return MEMORY[0x270F7B2D8]();
}

uint64_t sub_20A38AA10()
{
  return MEMORY[0x270F7B2E0]();
}

uint64_t sub_20A38AA20()
{
  return MEMORY[0x270F7B708]();
}

uint64_t sub_20A38AA30()
{
  return MEMORY[0x270F7BFE0]();
}

uint64_t sub_20A38AA40()
{
  return MEMORY[0x270F819F8]();
}

uint64_t sub_20A38AA50()
{
  return MEMORY[0x270F81B08]();
}

uint64_t sub_20A38AA60()
{
  return MEMORY[0x270F81CB0]();
}

uint64_t sub_20A38AA70()
{
  return MEMORY[0x270F81CF8]();
}

uint64_t sub_20A38AA80()
{
  return MEMORY[0x270F81D10]();
}

uint64_t sub_20A38AA90()
{
  return MEMORY[0x270F823E0]();
}

uint64_t sub_20A38AAA0()
{
  return MEMORY[0x270F823F8]();
}

uint64_t sub_20A38AAB0()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_20A38AAC0()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_20A38AAD0()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_20A38AAE0()
{
  return MEMORY[0x270EE3C98]();
}

uint64_t sub_20A38AAF0()
{
  return MEMORY[0x270EE3CA0]();
}

uint64_t sub_20A38AB00()
{
  return MEMORY[0x270EE3CB8]();
}

uint64_t sub_20A38AB10()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_20A38AB20()
{
  return MEMORY[0x270EE3F68]();
}

uint64_t sub_20A38AB30()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_20A38AB40()
{
  return MEMORY[0x270EE3FC0]();
}

uint64_t sub_20A38AB50()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_20A38AB60()
{
  return MEMORY[0x270EF70B8]();
}

uint64_t sub_20A38AB70()
{
  return MEMORY[0x270EF70E0]();
}

uint64_t sub_20A38AB80()
{
  return MEMORY[0x270EF7578]();
}

uint64_t sub_20A38AB90()
{
  return MEMORY[0x270EF7590]();
}

uint64_t sub_20A38ABA0()
{
  return MEMORY[0x270EF75A0]();
}

uint64_t sub_20A38ABB0()
{
  return MEMORY[0x270EF75A8]();
}

uint64_t sub_20A38ABC0()
{
  return MEMORY[0x270EF77B0]();
}

uint64_t sub_20A38ABD0()
{
  return MEMORY[0x270EF77B8]();
}

uint64_t sub_20A38ABE0()
{
  return MEMORY[0x270EF77C0]();
}

uint64_t sub_20A38ABF0()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_20A38AC00()
{
  return MEMORY[0x270EFF1D0]();
}

uint64_t sub_20A38AC10()
{
  return MEMORY[0x270EFF3E0]();
}

uint64_t sub_20A38AC20()
{
  return MEMORY[0x270EFF408]();
}

uint64_t sub_20A38AC30()
{
  return MEMORY[0x270EFF418]();
}

uint64_t sub_20A38AC40()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_20A38AC50()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_20A38AC60()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_20A38AC70()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_20A38AC80()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_20A38ACA0()
{
  return MEMORY[0x270EFFEB0]();
}

uint64_t sub_20A38ACB0()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_20A38ACC0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_20A38ACD0()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_20A38ACE0()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_20A38ACF0()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_20A38AD00()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_20A38AD10()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_20A38AD20()
{
  return MEMORY[0x270F00A00]();
}

uint64_t sub_20A38AD30()
{
  return MEMORY[0x270F00A18]();
}

uint64_t sub_20A38AD40()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_20A38AD50()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_20A38AD60()
{
  return MEMORY[0x270F00A98]();
}

uint64_t sub_20A38AD70()
{
  return MEMORY[0x270F00C90]();
}

uint64_t sub_20A38AD80()
{
  return MEMORY[0x270F00C98]();
}

uint64_t sub_20A38AD90()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_20A38ADA0()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_20A38ADB0()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_20A38ADC0()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_20A38ADD0()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_20A38ADE0()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_20A38ADF0()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_20A38AE00()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_20A38AE10()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_20A38AE20()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_20A38AE30()
{
  return MEMORY[0x270F01690]();
}

uint64_t sub_20A38AE40()
{
  return MEMORY[0x270F016D0]();
}

uint64_t sub_20A38AE50()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_20A38AE60()
{
  return MEMORY[0x270F01B80]();
}

uint64_t sub_20A38AE70()
{
  return MEMORY[0x270F01B88]();
}

uint64_t sub_20A38AE80()
{
  return MEMORY[0x270F02370]();
}

uint64_t sub_20A38AE90()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_20A38AEA0()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_20A38AEB0()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_20A38AED0()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_20A38AEE0()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_20A38AEF0()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_20A38AF10()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_20A38AF20()
{
  return MEMORY[0x270F02998]();
}

uint64_t sub_20A38AF30()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_20A38AF40()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_20A38AF50()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_20A38AF60()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_20A38AF70()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_20A38AF80()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_20A38AF90()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_20A38AFA0()
{
  return MEMORY[0x270F02CF8]();
}

uint64_t sub_20A38AFB0()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_20A38AFC0()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_20A38AFD0()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_20A38AFE0()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_20A38AFF0()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_20A38B000()
{
  return MEMORY[0x270F02F50]();
}

uint64_t sub_20A38B010()
{
  return MEMORY[0x270F02F60]();
}

uint64_t sub_20A38B020()
{
  return MEMORY[0x270F02F68]();
}

uint64_t sub_20A38B030()
{
  return MEMORY[0x270F02F70]();
}

uint64_t sub_20A38B040()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_20A38B050()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_20A38B060()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_20A38B070()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_20A38B080()
{
  return MEMORY[0x270F03260]();
}

uint64_t sub_20A38B090()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_20A38B0A0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_20A38B0B0()
{
  return MEMORY[0x270F034C8]();
}

uint64_t sub_20A38B0C0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_20A38B0D0()
{
  return MEMORY[0x270F03710]();
}

uint64_t sub_20A38B0E0()
{
  return MEMORY[0x270F03790]();
}

uint64_t sub_20A38B0F0()
{
  return MEMORY[0x270F039A0]();
}

uint64_t sub_20A38B100()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_20A38B110()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_20A38B120()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_20A38B130()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_20A38B140()
{
  return MEMORY[0x270F04278]();
}

uint64_t sub_20A38B150()
{
  return MEMORY[0x270F853D0]();
}

uint64_t sub_20A38B160()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_20A38B170()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_20A38B180()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_20A38B190()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_20A38B1A0()
{
  return MEMORY[0x270F853D8]();
}

uint64_t sub_20A38B1B0()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_20A38B1C0()
{
  return MEMORY[0x270F046F0]();
}

uint64_t sub_20A38B1D0()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_20A38B1E0()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_20A38B1F0()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_20A38B200()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_20A38B210()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_20A38B220()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_20A38B230()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_20A38B240()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_20A38B250()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_20A38B260()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_20A38B270()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_20A38B280()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_20A38B290()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_20A38B2A0()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_20A38B2B0()
{
  return MEMORY[0x270FA0A10]();
}

uint64_t sub_20A38B2C0()
{
  return MEMORY[0x270FA0A28]();
}

uint64_t sub_20A38B2D0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_20A38B2E0()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_20A38B2F0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_20A38B300()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_20A38B310()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_20A38B320()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_20A38B330()
{
  return MEMORY[0x270F85428]();
}

uint64_t sub_20A38B340()
{
  return MEMORY[0x270F85450]();
}

uint64_t sub_20A38B350()
{
  return MEMORY[0x270F85458]();
}

uint64_t sub_20A38B360()
{
  return MEMORY[0x270F85460]();
}

uint64_t sub_20A38B370()
{
  return MEMORY[0x270F85480]();
}

uint64_t sub_20A38B380()
{
  return MEMORY[0x270F85488]();
}

uint64_t sub_20A38B390()
{
  return MEMORY[0x270F854A8]();
}

uint64_t sub_20A38B3A0()
{
  return MEMORY[0x270F854B0]();
}

uint64_t sub_20A38B3B0()
{
  return MEMORY[0x270F854B8]();
}

uint64_t sub_20A38B3C0()
{
  return MEMORY[0x270F854C0]();
}

uint64_t sub_20A38B3D0()
{
  return MEMORY[0x270F854C8]();
}

uint64_t sub_20A38B3E0()
{
  return MEMORY[0x270F854D0]();
}

uint64_t sub_20A38B3F0()
{
  return MEMORY[0x270F854D8]();
}

uint64_t sub_20A38B400()
{
  return MEMORY[0x270F854E0]();
}

uint64_t sub_20A38B410()
{
  return MEMORY[0x270F854E8]();
}

uint64_t sub_20A38B420()
{
  return MEMORY[0x270F85508]();
}

uint64_t sub_20A38B430()
{
  return MEMORY[0x270F85510]();
}

uint64_t sub_20A38B440()
{
  return MEMORY[0x270F85518]();
}

uint64_t sub_20A38B450()
{
  return MEMORY[0x270F85520]();
}

uint64_t sub_20A38B460()
{
  return MEMORY[0x270F85560]();
}

uint64_t sub_20A38B470()
{
  return MEMORY[0x270F855C8]();
}

uint64_t sub_20A38B480()
{
  return MEMORY[0x270F855D0]();
}

uint64_t sub_20A38B490()
{
  return MEMORY[0x270F85610]();
}

uint64_t sub_20A38B4A0()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_20A38B4B0()
{
  return MEMORY[0x270EF17F8]();
}

uint64_t sub_20A38B4C0()
{
  return MEMORY[0x270EF1808]();
}

uint64_t sub_20A38B4D0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_20A38B4E0()
{
  return MEMORY[0x270F7A780]();
}

uint64_t sub_20A38B4F0()
{
  return MEMORY[0x270F7A788]();
}

uint64_t sub_20A38B500()
{
  return MEMORY[0x270F7A790]();
}

uint64_t sub_20A38B510()
{
  return MEMORY[0x270F7A7A0]();
}

uint64_t sub_20A38B520()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_20A38B530()
{
  return MEMORY[0x270F9D190]();
}

uint64_t sub_20A38B540()
{
  return MEMORY[0x270F85620]();
}

uint64_t sub_20A38B550()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_20A38B560()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_20A38B570()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_20A38B580()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_20A38B590()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_20A38B5A0()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_20A38B5B0()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_20A38B5C0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_20A38B5D0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_20A38B5E0()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_20A38B5F0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_20A38B600()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_20A38B610()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_20A38B620()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_20A38B630()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_20A38B640()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_20A38B650()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_20A38B660()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_20A38B670()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_20A38B680()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_20A38B690()
{
  return MEMORY[0x270F7A7A8]();
}

uint64_t sub_20A38B6A0()
{
  return MEMORY[0x270F7A7B0]();
}

uint64_t sub_20A38B6B0()
{
  return MEMORY[0x270F7A7B8]();
}

uint64_t sub_20A38B6C0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_20A38B6D0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_20A38B6E0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_20A38B6F0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_20A38B700()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_20A38B710()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_20A38B720()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_20A38B730()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_20A38B740()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_20A38B750()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_20A38B760()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_20A38B780()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_20A38B790()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_20A38B7A0()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_20A38B7B0()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_20A38B7C0()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_20A38B7D0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_20A38B7E0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_20A38B7F0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_20A38B830()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_20A38B840()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_20A38B850()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_20A38B860()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_20A38B870()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_20A38B880()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_20A38B890()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_20A38B8A0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_20A38B8B0()
{
  return MEMORY[0x270F7A7D0]();
}

uint64_t sub_20A38B8C0()
{
  return MEMORY[0x270F7A7D8]();
}

uint64_t sub_20A38B8D0()
{
  return MEMORY[0x270F7A7E0]();
}

uint64_t sub_20A38B8E0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_20A38B8F0()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_20A38B900()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_20A38B910()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_20A38B920()
{
  return MEMORY[0x270F85628]();
}

uint64_t sub_20A38B930()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_20A38B940()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_20A38B950()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_20A38B960()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_20A38B980()
{
  return MEMORY[0x270FA1E70]();
}

uint64_t sub_20A38B9A0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_20A38B9B0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_20A38B9C0()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_20A38B9D0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_20A38B9E0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_20A38BA00()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_20A38BA20()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_20A38BA30()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_20A38BA50()
{
  return MEMORY[0x270FA2040]();
}

uint64_t sub_20A38BA80()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_20A38BA90()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_20A38BAA0()
{
  return MEMORY[0x270F85630]();
}

uint64_t sub_20A38BAB0()
{
  return MEMORY[0x270F85640]();
}

uint64_t sub_20A38BAC0()
{
  return MEMORY[0x270F9DDC0]();
}

uint64_t sub_20A38BAD0()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t sub_20A38BAE0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_20A38BAF0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_20A38BB00()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_20A38BB10()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_20A38BB20()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_20A38BB30()
{
  return MEMORY[0x270F85648]();
}

uint64_t sub_20A38BB40()
{
  return MEMORY[0x270F85650]();
}

uint64_t sub_20A38BB50()
{
  return MEMORY[0x270F85658]();
}

uint64_t sub_20A38BB60()
{
  return MEMORY[0x270F856B0]();
}

uint64_t sub_20A38BB70()
{
  return MEMORY[0x270F856B8]();
}

uint64_t sub_20A38BB80()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_20A38BB90()
{
  return MEMORY[0x270F84F68]();
}

uint64_t sub_20A38BBA0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_20A38BBB0()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_20A38BBC0()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_20A38BBD0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_20A38BBE0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_20A38BBF0()
{
  return MEMORY[0x270F7A818]();
}

uint64_t sub_20A38BC00()
{
  return MEMORY[0x270F7A820]();
}

uint64_t sub_20A38BC10()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_20A38BC20()
{
  return MEMORY[0x270F856C0]();
}

uint64_t sub_20A38BC30()
{
  return MEMORY[0x270F84F70]();
}

uint64_t sub_20A38BC40()
{
  return MEMORY[0x270EF1DA8]();
}

uint64_t sub_20A38BC50()
{
  return MEMORY[0x270F84F78]();
}

uint64_t sub_20A38BC60()
{
  return MEMORY[0x270F84F80]();
}

uint64_t sub_20A38BC70()
{
  return MEMORY[0x270F856C8]();
}

uint64_t sub_20A38BC80()
{
  return MEMORY[0x270F856D0]();
}

uint64_t sub_20A38BC90()
{
  return MEMORY[0x270F856D8]();
}

uint64_t sub_20A38BCA0()
{
  return MEMORY[0x270F85700]();
}

uint64_t sub_20A38BCB0()
{
  return MEMORY[0x270F82460]();
}

uint64_t sub_20A38BCC0()
{
  return MEMORY[0x270F82468]();
}

uint64_t sub_20A38BCD0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_20A38BCE0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_20A38BCF0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_20A38BD00()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_20A38BD10()
{
  return MEMORY[0x270F83968]();
}

uint64_t sub_20A38BD20()
{
  return MEMORY[0x270EE58B8]();
}

uint64_t sub_20A38BD30()
{
  return MEMORY[0x270EE58E8]();
}

uint64_t sub_20A38BD40()
{
  return MEMORY[0x270EF78C8]();
}

uint64_t sub_20A38BD50()
{
  return MEMORY[0x270EF78D0]();
}

uint64_t sub_20A38BD60()
{
  return MEMORY[0x270F82548]();
}

uint64_t sub_20A38BD70()
{
  return MEMORY[0x270F82558]();
}

uint64_t sub_20A38BD80()
{
  return MEMORY[0x270F82578]();
}

uint64_t sub_20A38BD90()
{
  return MEMORY[0x270F85728]();
}

uint64_t sub_20A38BDA0()
{
  return MEMORY[0x270F85730]();
}

uint64_t sub_20A38BDB0()
{
  return MEMORY[0x270F85228]();
}

uint64_t sub_20A38BDC0()
{
  return MEMORY[0x270F85738]();
}

uint64_t sub_20A38BDD0()
{
  return MEMORY[0x270F85748]();
}

uint64_t sub_20A38BDE0()
{
  return MEMORY[0x270F85758]();
}

uint64_t sub_20A38BDF0()
{
  return MEMORY[0x270F85768]();
}

uint64_t sub_20A38BE00()
{
  return MEMORY[0x270F85770]();
}

uint64_t sub_20A38BE10()
{
  return MEMORY[0x270F85778]();
}

uint64_t sub_20A38BE20()
{
  return MEMORY[0x270F84F90]();
}

uint64_t sub_20A38BE30()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_20A38BE40()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_20A38BE50()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_20A38BE60()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_20A38BE70()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_20A38BE80()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_20A38BE90()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_20A38BEA0()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_20A38BEB0()
{
  return MEMORY[0x270F825A0]();
}

uint64_t sub_20A38BEC0()
{
  return MEMORY[0x270F825C0]();
}

uint64_t sub_20A38BED0()
{
  return MEMORY[0x270EF1FD0]();
}

uint64_t sub_20A38BEE0()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_20A38BEF0()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_20A38BF00()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_20A38BF10()
{
  return MEMORY[0x270EF1FE8]();
}

uint64_t sub_20A38BF20()
{
  return MEMORY[0x270EF1FF0]();
}

uint64_t sub_20A38BF30()
{
  return MEMORY[0x270EF1FF8]();
}

uint64_t sub_20A38BF40()
{
  return MEMORY[0x270F9CE18]();
}

uint64_t sub_20A38BF50()
{
  return MEMORY[0x270FA0F10]();
}

uint64_t sub_20A38BF60()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_20A38BF70()
{
  return MEMORY[0x270F82688]();
}

uint64_t sub_20A38BF80()
{
  return MEMORY[0x270F82698]();
}

uint64_t sub_20A38BF90()
{
  return MEMORY[0x270F84F98]();
}

uint64_t sub_20A38BFA0()
{
  return MEMORY[0x270F84FA0]();
}

uint64_t sub_20A38BFB0()
{
  return MEMORY[0x270EF2028]();
}

uint64_t sub_20A38BFC0()
{
  return MEMORY[0x270F7CA08]();
}

uint64_t sub_20A38BFD0()
{
  return MEMORY[0x270F85230]();
}

uint64_t sub_20A38BFE0()
{
  return MEMORY[0x270F85238]();
}

uint64_t sub_20A38BFF0()
{
  return MEMORY[0x270EF2070]();
}

uint64_t sub_20A38C000()
{
  return MEMORY[0x270F7CA28]();
}

uint64_t sub_20A38C010()
{
  return MEMORY[0x270F7CA50]();
}

uint64_t sub_20A38C020()
{
  return MEMORY[0x270F7CA58]();
}

uint64_t sub_20A38C030()
{
  return MEMORY[0x270F7CA70]();
}

uint64_t sub_20A38C040()
{
  return MEMORY[0x270F7CA78]();
}

uint64_t sub_20A38C050()
{
  return MEMORY[0x270F85780]();
}

uint64_t sub_20A38C060()
{
  return MEMORY[0x270F7CA88]();
}

uint64_t sub_20A38C070()
{
  return MEMORY[0x270F828A8]();
}

uint64_t sub_20A38C080()
{
  return MEMORY[0x270F828B8]();
}

uint64_t sub_20A38C090()
{
  return MEMORY[0x270F828C0]();
}

uint64_t sub_20A38C0A0()
{
  return MEMORY[0x270EF20B8]();
}

uint64_t sub_20A38C0B0()
{
  return MEMORY[0x270F85788]();
}

uint64_t sub_20A38C0C0()
{
  return MEMORY[0x270F85790]();
}

uint64_t sub_20A38C0D0()
{
  return MEMORY[0x270F85798]();
}

uint64_t sub_20A38C0E0()
{
  return MEMORY[0x270F7CAC0]();
}

uint64_t sub_20A38C0F0()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_20A38C100()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_20A38C110()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_20A38C120()
{
  return MEMORY[0x270F82988]();
}

uint64_t sub_20A38C130()
{
  return MEMORY[0x270F82990]();
}

uint64_t sub_20A38C140()
{
  return MEMORY[0x270F829B0]();
}

uint64_t sub_20A38C150()
{
  return MEMORY[0x270F829B8]();
}

uint64_t sub_20A38C160()
{
  return MEMORY[0x270F829F8]();
}

uint64_t sub_20A38C170()
{
  return MEMORY[0x270F82A00]();
}

uint64_t sub_20A38C180()
{
  return MEMORY[0x270F82A18]();
}

uint64_t sub_20A38C190()
{
  return MEMORY[0x270F82A78]();
}

uint64_t sub_20A38C1A0()
{
  return MEMORY[0x270F82AB0]();
}

uint64_t sub_20A38C1B0()
{
  return MEMORY[0x270F82AE0]();
}

uint64_t sub_20A38C1C0()
{
  return MEMORY[0x270F82AF0]();
}

uint64_t sub_20A38C1D0()
{
  return MEMORY[0x270F82B58]();
}

uint64_t sub_20A38C1E0()
{
  return MEMORY[0x270F82B60]();
}

uint64_t sub_20A38C1F0()
{
  return MEMORY[0x270EE5940]();
}

uint64_t sub_20A38C200()
{
  return MEMORY[0x270EE5950]();
}

uint64_t sub_20A38C210()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_20A38C220()
{
  return MEMORY[0x270F7A840]();
}

uint64_t sub_20A38C230()
{
  return MEMORY[0x270F7A848]();
}

uint64_t sub_20A38C240()
{
  return MEMORY[0x270F857A8]();
}

uint64_t sub_20A38C250()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_20A38C260()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_20A38C270()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_20A38C280()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_20A38C290()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_20A38C2A0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_20A38C2B0()
{
  return MEMORY[0x270EF24B0]();
}

uint64_t sub_20A38C2C0()
{
  return MEMORY[0x270EF25E0]();
}

uint64_t sub_20A38C2D0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_20A38C2F0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_20A38C300()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_20A38C310()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_20A38C320()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_20A38C330()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_20A38C340()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_20A38C350()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_20A38C360()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_20A38C370()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_20A38C380()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_20A38C390()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_20A38C3A0()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_20A38C3B0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_20A38C3C0()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_20A38C3D0()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_20A38C3E0()
{
  return MEMORY[0x270F9E890]();
}

uint64_t sub_20A38C3F0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_20A38C400()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_20A38C410()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_20A38C430()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_20A38C440()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_20A38C450()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_20A38C460()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_20A38C470()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_20A38C480()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_20A38C490()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_20A38C4A0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_20A38C4B0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_20A38C4C0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_20A38C4D0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_20A38C4E0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_20A38C500()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_20A38C510()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_20A38C520()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_20A38C530()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_20A38C540()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_20A38C550()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_20A38C560()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_20A38C570()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_20A38C580()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_20A38C590()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_20A38C5A0()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_20A38C5B0()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_20A38C5C0()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_20A38C5D0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_20A38C5E0()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_20A38C5F0()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_20A38C600()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_20A38C610()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_20A38C620()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_20A38C630()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_20A38C640()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_20A38C650()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_20A38C660()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_20A38C670()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_20A38C680()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t sub_20A38C690()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_20A38C6C0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_20A38C6D0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_20A38C6E0()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_20A38C6F0()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_20A38C700()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_20A38C710()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_20A38C720()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_20A38C730()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_20A38C740()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_20A38C750()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_20A38C770()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_20A38C780()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_20A38C790()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_20A38C7A0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_20A38C7B0()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_20A38C7C0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_20A38C7D0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_20A38C7E0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_20A38C800()
{
  return MEMORY[0x270F9F750]();
}

uint64_t sub_20A38C810()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_20A38C820()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_20A38C830()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_20A38C850()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_20A38C870()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_20A38C880()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_20A38C890()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_20A38C8B0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_20A38C8C0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_20A38C8D0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_20A38C8E0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_20A38C8F0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_20A38C900()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_20A38C910()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_20A38C920()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_20A38C930()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_20A38C940()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_20A38C950()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_20A38C960()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_20A38C970()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_20A38C980()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_20A38C990()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_20A38C9C0()
{
  return MEMORY[0x270FA0128]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
}

void CGContextSetTextDrawingMode(CGContextRef c, CGTextDrawingMode mode)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x270EE62B8](provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x270EE62E0](info, data, size, releaseData);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6770](source, decode, shouldInterpolate, *(void *)&intent);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x270EE6778](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A0](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x270EE67E8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7060](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t DeviceIsSlow()
{
  return MEMORY[0x270F857C0]();
}

uint64_t DeviceIsVerySlow()
{
  return MEMORY[0x270F857C8]();
}

uint64_t DeviceSupportsMapsControlEffects()
{
  return MEMORY[0x270F857D0]();
}

uint64_t DeviceSupportsVFX()
{
  return MEMORY[0x270F857D8]();
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D68](buffer);
}

uint64_t MKBearingFromCoordinateToCoordinate()
{
  return MEMORY[0x270EF58A0]();
}

CLLocationCoordinate2D MKCoordinateForMapPoint(MKMapPoint mapPoint)
{
  MEMORY[0x270EF58A8]((__n128)mapPoint, *(__n128 *)&mapPoint.y);
  result.longitude = v2;
  result.latitude = v1;
  return result;
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  MEMORY[0x270EF58C8]((__n128)coordinate, *(__n128 *)&coordinate.longitude);
  result.y = v2;
  result.x = v1;
  return result;
}

BOOL MKMapRectContainsPoint(MKMapRect rect, MKMapPoint point)
{
  return MEMORY[0x270EF58E0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

uint64_t MKMapRectContainsRectWrappingMeridian()
{
  return MEMORY[0x270EF58F0]();
}

MKMapRect MKMapRectIntersection(MKMapRect rect1, MKMapRect rect2)
{
  MEMORY[0x270EF5908]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t MKMapRectMakeWithZoomLevel()
{
  return MEMORY[0x270EF5920]();
}

CLLocationDistance MKMetersBetweenMapPoints(MKMapPoint a, MKMapPoint b)
{
  MEMORY[0x270EF5930]((__n128)a, *(__n128 *)&a.y, (__n128)b, *(__n128 *)&b.y);
  return result;
}

uint64_t MKZoomScaleForZoomLevelF()
{
  return MEMORY[0x270EF5940]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x270F82BF8]();
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return MEMORY[0x270F82C30]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F82C48]();
}

BOOL UIAccessibilityIsVideoAutoplayEnabled(void)
{
  return MEMORY[0x270F82C78]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F82C80]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
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

{
  return MEMORY[0x270F9A3C8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

long double asin(long double __x)
{
  MEMORY[0x270ED8610](__x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x270ED9860](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

uint64_t lroundf(float a1)
{
  return MEMORY[0x270EDA110](a1);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x270EF7EB0](hostname, port);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x270F9AA40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_modifyAtReferenceWritableKeyPath()
{
  return MEMORY[0x270FA04E0]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x270FA0500]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_taskGroup_addPending()
{
  return MEMORY[0x270FA2448]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x270FA05E0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}