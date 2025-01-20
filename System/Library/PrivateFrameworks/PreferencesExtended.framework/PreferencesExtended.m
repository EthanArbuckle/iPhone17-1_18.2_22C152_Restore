unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
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

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
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

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_25A1456A0(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v18 = sub_25A160150();
  uint64_t v4 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388]();
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    if (!v7) {
      return v8;
    }
    uint64_t v21 = MEMORY[0x263F8EE78];
    uint64_t result = sub_25A145DAC(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0) {
      break;
    }
    uint64_t v10 = 0;
    uint64_t v8 = v21;
    v16[1] = v2;
    unint64_t v17 = a1 & 0xC000000000000001;
    uint64_t v2 = a1;
    while (v7 != v10)
    {
      if (v17) {
        id v11 = (id)MEMORY[0x25A2F6EA0](v10, a1);
      }
      else {
        id v11 = *(id *)(a1 + 8 * v10 + 32);
      }
      v12 = v11;
      v20[3] = sub_25A145D6C();
      v20[0] = v12;
      sub_25A145DCC((uint64_t)v20, (uint64_t)v19);
      id v13 = v12;
      sub_25A160140();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v20);

      uint64_t v21 = v8;
      unint64_t v15 = *(void *)(v8 + 16);
      unint64_t v14 = *(void *)(v8 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_25A145DAC(v14 > 1, v15 + 1, 1);
        uint64_t v8 = v21;
      }
      ++v10;
      *(void *)(v8 + 16) = v15 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v15, v6, v18);
      a1 = v2;
      if (v7 == v10) {
        return v8;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25A160A40();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t PSViewController.emitNavigationEventForSystemSetting(icon:title:localizedNavigationComponents:deepLink:)()
{
  sub_25A160790();
  sub_25A160780();
  sub_25A160760();

  return swift_release();
}

uint64_t sub_25A145954(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = sub_25A160200();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25A1607E0();
  uint64_t v12 = v11;
  sub_25A145D6C();
  unint64_t v13 = sub_25A160830();
  sub_25A1601D0();
  id v14 = a4;
  id v15 = a1;
  sub_25A1460BC(v10, v12, v14, v13, (uint64_t)v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t PSViewController.emitNavigationEventForApplicationSetting(applicationBundleIdentifier:title:localizedNavigationComponents:deepLink:)()
{
  sub_25A160790();
  sub_25A160780();
  sub_25A160770();

  return swift_release();
}

uint64_t sub_25A145B2C(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v18 = sub_25A160150();
  uint64_t v6 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_25A160200();
  uint64_t v9 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[1] = sub_25A1607E0();
  unint64_t v12 = sub_25A145D6C();
  unint64_t v13 = sub_25A160830();
  sub_25A1601D0();
  unint64_t v21 = v12;
  v20 = a4;
  id v14 = a4;
  id v15 = a1;
  sub_25A160140();
  sub_25A1456A0(v13);
  sub_25A160790();
  sub_25A160780();
  sub_25A160770();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v18);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v19);
}

unint64_t sub_25A145D6C()
{
  unint64_t result = qword_26B327240;
  if (!qword_26B327240)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B327240);
  }
  return result;
}

uint64_t sub_25A145DAC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25A145E78(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25A145DCC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_25A145E78(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B327248);
  uint64_t v10 = *(void *)(sub_25A160150() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_25A160150() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  unint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_25A160A80();
  __break(1u);
  return result;
}

uint64_t sub_25A1460BC(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, uint64_t a5)
{
  v19[1] = a5;
  uint64_t v9 = sub_25A160150();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_25A160730();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v16 = (void *)((char *)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v16 = a1;
  v16[1] = a2;
  (*(void (**)(void *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x263F67E48], v13);
  v19[7] = sub_25A145D6C();
  v19[4] = a3;
  swift_bridgeObjectRetain();
  id v17 = a3;
  sub_25A160140();
  sub_25A1456A0(a4);
  sub_25A160790();
  sub_25A160780();
  sub_25A160760();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return (*(uint64_t (**)(void *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t SettingsAnyViewRecipe.view.getter()
{
  type metadata accessor for SettingsAnyViewRecipe();

  return swift_retain();
}

uint64_t type metadata accessor for SettingsAnyViewRecipe()
{
  uint64_t result = qword_26B327330;
  if (!qword_26B327330) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SettingsAnyViewRecipe.init<A>(content:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X8>)
{
  MEMORY[0x270FA5388]();
  uint64_t v4 = sub_25A160220();
  a1(v4);
  uint64_t v5 = sub_25A1606E0();
  uint64_t result = type metadata accessor for SettingsAnyViewRecipe();
  *(void *)(a2 + *(int *)(result + 20)) = v5;
  return result;
}

uint64_t SettingsAnyViewRecipe.hash(into:)()
{
  sub_25A160230();
  sub_25A1466F8(&qword_26A408D80, MEMORY[0x263F07508]);

  return sub_25A1607C0();
}

uint64_t SettingsAnyViewRecipe.hashValue.getter()
{
  return sub_25A160B30();
}

uint64_t sub_25A146520()
{
  return sub_25A160B30();
}

uint64_t sub_25A1465A8()
{
  sub_25A160230();
  sub_25A1466F8(&qword_26A408D80, MEMORY[0x263F07508]);

  return sub_25A1607C0();
}

uint64_t sub_25A14662C()
{
  return sub_25A160B30();
}

uint64_t sub_25A1466B0()
{
  return sub_25A1466F8(&qword_26B327328, (void (*)(uint64_t))type metadata accessor for SettingsAnyViewRecipe);
}

uint64_t sub_25A1466F8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *initializeBufferWithCopyOfBuffer for SettingsAnyViewRecipe(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_25A160230();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t destroy for SettingsAnyViewRecipe(uint64_t a1)
{
  uint64_t v2 = sub_25A160230();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_release();
}

uint64_t initializeWithCopy for SettingsAnyViewRecipe(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A160230();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SettingsAnyViewRecipe(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A160230();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for SettingsAnyViewRecipe(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A160230();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for SettingsAnyViewRecipe(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A160230();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SettingsAnyViewRecipe(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A146AA4);
}

uint64_t sub_25A146AA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A160230();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for SettingsAnyViewRecipe(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A146B78);
}

uint64_t sub_25A146B78(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25A160230();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_25A146C34()
{
  uint64_t result = sub_25A160230();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

__n128 SettingsAnyPlatformViewControllerModel.__allocating_init(recipe:)(__n128 *a1)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 32) = 0;
  __n128 result = *a1;
  *(__n128 *)(v2 + 16) = *a1;
  return result;
}

uint64_t SettingsAnyPlatformViewControllerModel.init(recipe:)(_OWORD *a1)
{
  *(void *)(v1 + 32) = 0;
  *(_OWORD *)(v1 + 16) = *a1;
  return v1;
}

void *sub_25A146D1C()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327668);
  uint64_t v3 = *(void **)(v2 - 8);
  MEMORY[0x270FA5388]();
  int v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25A160310();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B3292B8);
  swift_retain_n();
  uint64_t v7 = sub_25A1602F0();
  os_log_type_t v8 = sub_25A1608E0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v32 = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v29 = v2;
    v30 = v3;
    uint64_t v11 = sub_25A160B40();
    uint64_t v31 = sub_25A14A43C(v11, v12, &v32);
    sub_25A160960();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v31 = sub_25A14A43C(0xD00000000000001CLL, 0x800000025A162B70, &v32);
    uint64_t v2 = v29;
    uint64_t v3 = v30;
    sub_25A160960();
    _os_log_impl(&dword_25A143000, v7, v8, "Start (%s.%s)…", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v10, -1, -1);
    MEMORY[0x25A2F7630](v9, -1, -1);

    uint64_t v13 = *(void **)(v1 + 24);
    if (*(void *)(v1 + 32)) {
      goto LABEL_5;
    }
LABEL_8:
    swift_getKeyPath();
    id v21 = v13;
    sub_25A160160();
    swift_release();
    *(void *)(swift_allocObject() + 16) = v21;
    sub_25A147C0C();
    id v22 = v21;
    uint64_t v23 = sub_25A1603B0();
    swift_release();
    ((void (*)(char *, uint64_t))v3[1])(v5, v2);
    *(void *)(v1 + 32) = v23;
    swift_release();
    uint64_t v14 = v22;
    uint64_t v15 = sub_25A1602F0();
    os_log_type_t v24 = sub_25A1608E0();
    if (os_log_type_enabled(v15, v24))
    {
      uint64_t v17 = swift_slowAlloc();
      v30 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 141558275;
      uint64_t v32 = 1752392040;
      sub_25A160960();
      *(_WORD *)(v17 + 12) = 2113;
      uint64_t v32 = (uint64_t)v14;
      v25 = v13;
      v26 = v14;
      sub_25A160960();
      v27 = v30;
      void *v30 = v14;

      uint64_t v13 = v25;
      _os_log_impl(&dword_25A143000, v15, v24, "Returning now configured platform view controller: %{private,mask.hash}@.", (uint8_t *)v17, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B327680);
      swift_arrayDestroy();
      uint64_t v20 = v27;
      goto LABEL_10;
    }
LABEL_11:

    uint64_t v15 = v14;
    goto LABEL_12;
  }

  swift_release_n();
  uint64_t v13 = *(void **)(v1 + 24);
  if (!*(void *)(v1 + 32)) {
    goto LABEL_8;
  }
LABEL_5:
  uint64_t v14 = v13;
  uint64_t v15 = sub_25A1602F0();
  os_log_type_t v16 = sub_25A1608E0();
  if (!os_log_type_enabled(v15, v16)) {
    goto LABEL_11;
  }
  uint64_t v17 = swift_slowAlloc();
  v30 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v17 = 141558275;
  uint64_t v32 = 1752392040;
  sub_25A160960();
  *(_WORD *)(v17 + 12) = 2113;
  uint64_t v32 = (uint64_t)v14;
  uint64_t v18 = v14;
  sub_25A160960();
  uint64_t v19 = v30;
  void *v30 = v14;

  _os_log_impl(&dword_25A143000, v15, v16, "Returning existing platform view controller: %{private,mask.hash}@.", (uint8_t *)v17, 0x16u);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B327680);
  swift_arrayDestroy();
  uint64_t v20 = v19;
LABEL_10:
  MEMORY[0x25A2F7630](v20, -1, -1);
  MEMORY[0x25A2F7630](v17, -1, -1);
LABEL_12:

  sub_25A147304();
  return v13;
}

void sub_25A147304()
{
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25A160310();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B3292B8);
  swift_retain_n();
  uint64_t v1 = sub_25A1602F0();
  os_log_type_t v2 = sub_25A1608E0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v7 = v4;
    *(_DWORD *)uint64_t v3 = 136315394;
    uint64_t v5 = sub_25A160B40();
    sub_25A14A43C(v5, v6, &v7);
    sub_25A160960();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2080;
    sub_25A14A43C(0xD00000000000001CLL, 0x800000025A162B70, &v7);
    sub_25A160960();
    _os_log_impl(&dword_25A143000, v1, v2, "…Complete (%s.%s)", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v4, -1, -1);
    MEMORY[0x25A2F7630](v3, -1, -1);
  }
  else
  {

    swift_release_n();
  }
}

void sub_25A147514(id *a1, void *a2)
{
  if (*a1)
  {
    uint64_t v3 = qword_26B327350;
    id v4 = *a1;
    id v5 = v4;
    if (v3 != -1)
    {
      swift_once();
      id v4 = v5;
    }
    sub_25A15B0E4(a2, v4);
  }
}

uint64_t SettingsAnyPlatformViewControllerModel.deinit()
{
  swift_release();
  return v0;
}

uint64_t SettingsAnyPlatformViewControllerModel.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

BOOL static SettingsAnyPlatformViewControllerModel.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 16) == *(void *)(a2 + 16);
}

BOOL sub_25A147634(uint64_t a1, uint64_t a2)
{
  return *(void *)(*(void *)a1 + 16) == *(void *)(*(void *)a2 + 16);
}

uint64_t SettingsAnyPlatformViewControllerModel.hash(into:)()
{
  return sub_25A160B20();
}

uint64_t SettingsAnyPlatformViewControllerModel.hashValue.getter()
{
  return sub_25A160B30();
}

uint64_t sub_25A1476C0()
{
  return sub_25A160B30();
}

uint64_t sub_25A147708()
{
  return sub_25A160B20();
}

uint64_t sub_25A147738()
{
  return sub_25A160B30();
}

unint64_t sub_25A147780()
{
  unint64_t result = qword_26A408D88;
  if (!qword_26A408D88)
  {
    type metadata accessor for SettingsAnyPlatformViewControllerModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A408D88);
  }
  return result;
}

uint64_t type metadata accessor for SettingsAnyPlatformViewControllerModel()
{
  return self;
}

uint64_t method lookup function for SettingsAnyPlatformViewControllerModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SettingsAnyPlatformViewControllerModel);
}

uint64_t dispatch thunk of SettingsAnyPlatformViewControllerModel.__allocating_init(recipe:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void sub_25A147824()
{
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25A160310();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B3292B8);
  swift_retain_n();
  uint64_t v1 = sub_25A1602F0();
  os_log_type_t v2 = sub_25A1608E0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v13 = v4;
    *(_DWORD *)uint64_t v3 = 136315394;
    uint64_t v5 = sub_25A160B40();
    sub_25A14A43C(v5, v6, &v13);
    sub_25A160960();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2080;
    sub_25A14A43C(0xD000000000000037, 0x800000025A162B30, &v13);
    sub_25A160960();
    _os_log_impl(&dword_25A143000, v1, v2, "Start (%s.%s)…", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v4, -1, -1);
    MEMORY[0x25A2F7630](v3, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  swift_retain_n();
  uint64_t v7 = sub_25A1602F0();
  os_log_type_t v8 = sub_25A1608E0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v13 = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v11 = sub_25A160B40();
    sub_25A14A43C(v11, v12, &v13);
    sub_25A160960();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    sub_25A14A43C(0xD000000000000037, 0x800000025A162B30, &v13);
    sub_25A160960();
    _os_log_impl(&dword_25A143000, v7, v8, "…Complete (%s.%s)", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v10, -1, -1);
    MEMORY[0x25A2F7630](v9, -1, -1);
  }
  else
  {

    swift_release_n();
  }
}

char *keypath_get_selector_parentViewController()
{
  return sel_parentViewController;
}

uint64_t sub_25A147BCC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25A147C04(id *a1)
{
  sub_25A147514(a1, *(void **)(v1 + 16));
}

unint64_t sub_25A147C0C()
{
  unint64_t result = qword_26B327660;
  if (!qword_26B327660)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B327668);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B327660);
  }
  return result;
}

BOOL static SettingsAnyPlatformViewControllerRecipe.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

id SettingsAnyPlatformViewControllerRecipe.viewController.getter()
{
  return *(id *)(v0 + 8);
}

uint64_t SettingsAnyPlatformViewControllerRecipe.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  a2[1] = result;
  return result;
}

BOOL sub_25A147C8C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t SettingsAnyPlatformViewControllerRecipe.hash(into:)()
{
  return sub_25A160B20();
}

uint64_t SettingsAnyPlatformViewControllerRecipe.hashValue.getter()
{
  return sub_25A160B30();
}

uint64_t sub_25A147D14()
{
  return sub_25A160B30();
}

uint64_t sub_25A147D5C()
{
  return sub_25A160B20();
}

uint64_t sub_25A147D88()
{
  return sub_25A160B30();
}

unint64_t sub_25A147DD0()
{
  unint64_t result = qword_26B3274D0[0];
  if (!qword_26B3274D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26B3274D0);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for SettingsAnyPlatformViewControllerRecipe(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = v3;
  return a1;
}

void destroy for SettingsAnyPlatformViewControllerRecipe(uint64_t a1)
{
}

void *assignWithCopy for SettingsAnyPlatformViewControllerRecipe(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = (void *)a2[1];
  id v4 = (void *)a1[1];
  a1[1] = v3;
  id v5 = v3;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for SettingsAnyPlatformViewControllerRecipe(uint64_t a1, _OWORD *a2)
{
  uint64_t v3 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for SettingsAnyPlatformViewControllerRecipe(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SettingsAnyPlatformViewControllerRecipe(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SettingsAnyPlatformViewControllerRecipe()
{
  return &type metadata for SettingsAnyPlatformViewControllerRecipe;
}

uint64_t sub_25A147F74(uint64_t a1)
{
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25A160310();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B3292B8);
  swift_retain();
  uint64_t v3 = sub_25A1602F0();
  os_log_type_t v4 = sub_25A1608E0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v9 = v6;
    *(_DWORD *)uint64_t v5 = 136315394;
    sub_25A14A43C(0xD00000000000002ELL, 0x800000025A1615A0, &v9);
    sub_25A160960();
    swift_release();
    *(_WORD *)(v5 + 12) = 2080;
    sub_25A14A43C(0xD000000000000011, 0x800000025A162C20, &v9);
    sub_25A160960();
    _os_log_impl(&dword_25A143000, v3, v4, "Start (%s.%s)…", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v6, -1, -1);
    MEMORY[0x25A2F7630](v5, -1, -1);
  }
  else
  {

    swift_release();
  }
  type metadata accessor for SettingsAnyPlatformViewControllerRepresentable.Coordinator();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  swift_retain();
  sub_25A148180();
  return v7;
}

void sub_25A148180()
{
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25A160310();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B3292B8);
  swift_retain();
  uint64_t v1 = sub_25A1602F0();
  os_log_type_t v2 = sub_25A1608E0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = v4;
    *(_DWORD *)uint64_t v3 = 136315394;
    sub_25A14A43C(0xD00000000000002ELL, 0x800000025A1615A0, &v5);
    sub_25A160960();
    swift_release();
    *(_WORD *)(v3 + 12) = 2080;
    sub_25A14A43C(0xD000000000000011, 0x800000025A162C20, &v5);
    sub_25A160960();
    _os_log_impl(&dword_25A143000, v1, v2, "…Complete (%s.%s)", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v4, -1, -1);
    MEMORY[0x25A2F7630](v3, -1, -1);
  }
  else
  {

    swift_release();
  }
}

void *sub_25A148388()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A408DA0);
  sub_25A1605B0();
  swift_retain();
  swift_release();
  uint64_t v0 = sub_25A146D1C();
  swift_release();
  return v0;
}

uint64_t sub_25A1483F0()
{
  uint64_t v0 = sub_25A160490();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A408DA0);
  sub_25A1605B0();
  swift_retain();
  swift_release();
  sub_25A1605C0();
  sub_25A1605D0();
  sub_25A147824();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_25A14852C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A147F74(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_25A148558()
{
  return sub_25A160520();
}

uint64_t sub_25A148594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_25A148770();

  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_25A1485F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_25A148770();

  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

uint64_t sub_25A14865C()
{
  return sub_25A160660();
}

void sub_25A148678()
{
}

uint64_t sub_25A1486A0()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for SettingsAnyPlatformViewControllerRepresentable.Coordinator()
{
  return self;
}

ValueMetadata *type metadata accessor for SettingsAnyPlatformViewControllerRepresentable()
{
  return &type metadata for SettingsAnyPlatformViewControllerRepresentable;
}

unint64_t sub_25A148710()
{
  unint64_t result = qword_26A408D90;
  if (!qword_26A408D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A408D90);
  }
  return result;
}

uint64_t sub_25A148764()
{
  return MEMORY[0x263F1BB58];
}

unint64_t sub_25A148770()
{
  unint64_t result = qword_26A408D98;
  if (!qword_26A408D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A408D98);
  }
  return result;
}

uint64_t SettingsAnyPlatformViewControllerView.init(platformViewControllerModel:)@<X0>(void *a1@<X8>)
{
  type metadata accessor for SettingsAnyPlatformViewControllerModel();
  uint64_t result = sub_25A1606C0();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t SettingsAnyPlatformViewControllerView.init(platformViewControllerRecipe:)@<X0>(_OWORD *a1@<X0>, void *a2@<X8>)
{
  type metadata accessor for SettingsAnyPlatformViewControllerModel();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 32) = 0;
  *(_OWORD *)(v4 + 16) = *a1;
  uint64_t result = sub_25A1606C0();
  *a2 = v6;
  a2[1] = v7;
  return result;
}

uint64_t SettingsAnyPlatformViewControllerView.body.getter()
{
  return swift_release();
}

unint64_t sub_25A148938()
{
  unint64_t result = qword_26A408DB8;
  if (!qword_26A408DB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A408DB0);
    sub_25A148710();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A408DB8);
  }
  return result;
}

unint64_t sub_25A1489B4()
{
  unint64_t result = qword_26B3272A0;
  if (!qword_26B3272A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3272A0);
  }
  return result;
}

uint64_t sub_25A148A08()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25A148A2C()
{
  return swift_release();
}

uint64_t destroy for SettingsAnyPlatformViewControllerView()
{
  swift_release();

  return swift_release();
}

void *_s19PreferencesExtended37SettingsAnyPlatformViewControllerViewVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SettingsAnyPlatformViewControllerView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for SettingsAnyPlatformViewControllerView(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SettingsAnyPlatformViewControllerView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SettingsAnyPlatformViewControllerView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SettingsAnyPlatformViewControllerView()
{
  return &type metadata for SettingsAnyPlatformViewControllerView;
}

uint64_t sub_25A148C8C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25A148CFC()
{
  uint64_t appended = type metadata accessor for AppendSettingsNavigationPathAction();
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275F0);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(appended, qword_26B3273E8);
  uint64_t v5 = __swift_project_value_buffer(appended, (uint64_t)qword_26B3273E8);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275E8);
  uint64_t v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  v7(v4, 1, 1, v6);
  v7(v2, 1, 1, v6);
  os_log_type_t v8 = &v2[*(int *)(appended + 20)];
  *(void *)os_log_type_t v8 = 0;
  *((void *)v8 + 1) = 0;
  uint64_t v9 = &v2[*(int *)(appended + 24)];
  *(void *)uint64_t v9 = 0;
  v9[8] = 1;
  sub_25A148F8C((uint64_t)v4, (uint64_t)v2);
  return sub_25A14BB98((uint64_t)v2, v5);
}

uint64_t AppendSettingsNavigationPathAction.init(namespace:navigationPath:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(a4, 1, 1, v8);
  uint64_t appended = type metadata accessor for AppendSettingsNavigationPathAction();
  uint64_t v10 = (void *)(a4 + *(int *)(appended + 20));
  *uint64_t v10 = 0;
  v10[1] = 0;
  uint64_t v11 = a4 + *(int *)(appended + 24);
  *(void *)uint64_t v11 = a1;
  *(unsigned char *)(v11 + 8) = a2 & 1;

  return sub_25A148F8C(a3, a4);
}

uint64_t type metadata accessor for AppendSettingsNavigationPathAction()
{
  uint64_t result = qword_26B327388;
  if (!qword_26B327388) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A148F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A148FF4@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B327400 != -1) {
    swift_once();
  }
  uint64_t appended = type metadata accessor for AppendSettingsNavigationPathAction();
  uint64_t v3 = __swift_project_value_buffer(appended, (uint64_t)qword_26B3273E8);

  return sub_25A1491F8(v3, a1);
}

uint64_t sub_25A14906C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_25A14BB40();

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t sub_25A1490D0()
{
  uint64_t appended = type metadata accessor for AppendSettingsNavigationPathAction();
  __swift_allocate_value_buffer(appended, qword_26B327468);
  uint64_t v1 = __swift_project_value_buffer(appended, (uint64_t)qword_26B327468);
  if (qword_26B327400 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(appended, (uint64_t)qword_26B3273E8);

  return sub_25A1491F8(v2, v1);
}

uint64_t static AppendSettingsNavigationPathActionTrait.defaultValue.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B327488 != -1) {
    swift_once();
  }
  uint64_t appended = type metadata accessor for AppendSettingsNavigationPathAction();
  uint64_t v3 = __swift_project_value_buffer(appended, (uint64_t)qword_26B327468);
  swift_beginAccess();
  return sub_25A1491F8(v3, a1);
}

uint64_t sub_25A1491F8(uint64_t a1, uint64_t a2)
{
  uint64_t appended = type metadata accessor for AppendSettingsNavigationPathAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(appended - 8) + 16))(a2, a1, appended);
  return a2;
}

uint64_t static AppendSettingsNavigationPathActionTrait.defaultValue.setter(uint64_t a1)
{
  if (qword_26B327488 != -1) {
    swift_once();
  }
  uint64_t appended = type metadata accessor for AppendSettingsNavigationPathAction();
  uint64_t v3 = __swift_project_value_buffer(appended, (uint64_t)qword_26B327468);
  swift_beginAccess();
  sub_25A1492F8(a1, v3);
  swift_endAccess();
  return sub_25A14935C(a1);
}

uint64_t sub_25A1492F8(uint64_t a1, uint64_t a2)
{
  uint64_t appended = type metadata accessor for AppendSettingsNavigationPathAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(appended - 8) + 24))(a2, a1, appended);
  return a2;
}

uint64_t sub_25A14935C(uint64_t a1)
{
  uint64_t appended = type metadata accessor for AppendSettingsNavigationPathAction();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(appended - 8) + 8))(a1, appended);
  return a1;
}

uint64_t (*static AppendSettingsNavigationPathActionTrait.defaultValue.modify())()
{
  if (qword_26B327488 != -1) {
    swift_once();
  }
  uint64_t appended = type metadata accessor for AppendSettingsNavigationPathAction();
  __swift_project_value_buffer(appended, (uint64_t)qword_26B327468);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_25A149450@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B327488 != -1) {
    swift_once();
  }
  uint64_t appended = type metadata accessor for AppendSettingsNavigationPathAction();
  uint64_t v3 = __swift_project_value_buffer(appended, (uint64_t)qword_26B327468);
  swift_beginAccess();
  return sub_25A1491F8(v3, a1);
}

uint64_t EnvironmentValues.appendSettingsNavigationPath.getter()
{
  sub_25A149538();

  return sub_25A1604A0();
}

unint64_t sub_25A149538()
{
  unint64_t result = qword_26B327410;
  if (!qword_26B327410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B327410);
  }
  return result;
}

uint64_t sub_25A14958C()
{
  return sub_25A1604A0();
}

uint64_t sub_25A1495CC(uint64_t a1)
{
  type metadata accessor for AppendSettingsNavigationPathAction();
  uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v8 - v5;
  sub_25A1491F8(a1, (uint64_t)&v8 - v5);
  sub_25A1491F8((uint64_t)v6, (uint64_t)v4);
  sub_25A149538();
  sub_25A1604B0();
  return sub_25A14935C((uint64_t)v6);
}

uint64_t View.appendSettingsNavigationPathAction(_:)()
{
  swift_getKeyPath();
  sub_25A160650();

  return swift_release();
}

uint64_t sub_25A149710()
{
  return sub_25A1604A0();
}

uint64_t UITraitCollection.appendSettingsNavigationPath.getter()
{
  sub_25A14979C();

  return sub_25A160900();
}

unint64_t sub_25A14979C()
{
  unint64_t result = qword_26B327490;
  if (!qword_26B327490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B327490);
  }
  return result;
}

uint64_t sub_25A1497F0(uint64_t a1)
{
  uint64_t appended = type metadata accessor for AppendSettingsNavigationPathAction();
  MEMORY[0x270FA5388](appended - 8);
  sub_25A1491F8(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25A14979C();
  sub_25A160340();
  return sub_25A14935C(a1);
}

uint64_t sub_25A1498A8()
{
  return sub_25A160900();
}

uint64_t sub_25A1498E8(uint64_t a1, uint64_t a2)
{
  uint64_t appended = type metadata accessor for AppendSettingsNavigationPathAction();
  MEMORY[0x270FA5388](appended - 8);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A1491F8(a2, (uint64_t)v6);
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
  return sub_25A1497F0((uint64_t)v6);
}

uint64_t AppendSettingsNavigationPathAction.init(namespace:onAppend:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a5, 1, 1, v10);
  uint64_t result = type metadata accessor for AppendSettingsNavigationPathAction();
  unint64_t v12 = (void *)(a5 + *(int *)(result + 20));
  uint64_t v13 = a5 + *(int *)(result + 24);
  *(void *)uint64_t v13 = a1;
  *(unsigned char *)(v13 + 8) = a2 & 1;
  void *v12 = a3;
  v12[1] = a4;
  return result;
}

void AppendSettingsNavigationPathAction.callAsFunction<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v31 = a3;
  uint64_t v32 = a1;
  uint64_t v5 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25A160420();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275F0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275E8);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v16 = *(void (**)(uint64_t *))(v3
                                         + *(int *)(type metadata accessor for AppendSettingsNavigationPathAction() + 20));
  if (v16)
  {
    v33[3] = a2;
    v33[4] = v31;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v33);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 16))(boxed_opaque_existential_1, v32, a2);
    swift_retain();
    v16(v33);
    sub_25A14ABBC((uint64_t)v16);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v33);
  }
  else
  {
    uint64_t v30 = a2;
    uint64_t v18 = v32;
    sub_25A149EAC(v3, (uint64_t)v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
    {
      sub_25A14AAFC((uint64_t)v11, &qword_26B3275F0);
      if (qword_26A408C58 != -1) {
        swift_once();
      }
      uint64_t v19 = sub_25A160310();
      __swift_project_value_buffer(v19, (uint64_t)qword_26A409688);
      uint64_t v20 = v7;
      uint64_t v21 = v18;
      uint64_t v22 = v30;
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v21, v30);
      uint64_t v23 = sub_25A1602F0();
      os_log_type_t v24 = sub_25A1608D0();
      if (os_log_type_enabled(v23, v24))
      {
        v25 = (uint8_t *)swift_slowAlloc();
        uint64_t v26 = swift_slowAlloc();
        v33[0] = v26;
        *(_DWORD *)v25 = 136315138;
        swift_getDynamicType();
        uint64_t v27 = sub_25A160B40();
        v33[5] = sub_25A14A43C(v27, v28, v33);
        sub_25A160960();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v20, v22);
        swift_arrayDestroy();
        MEMORY[0x25A2F7630](v26, -1, -1);
        MEMORY[0x25A2F7630](v25, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v20, v22);
      }
    }
    else
    {
      sub_25A14AA94((uint64_t)v11, (uint64_t)v15);
      MEMORY[0x25A2F6B90](v12);
      sub_25A1603E0();
      sub_25A160700();
      sub_25A14AAFC((uint64_t)v15, &qword_26B3275E8);
    }
  }
}

uint64_t sub_25A149EAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void AppendSettingsNavigationPathAction.callAsFunction<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v34 = a3;
  uint64_t v35 = a5;
  uint64_t v33 = a4;
  uint64_t v36 = a1;
  uint64_t v7 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25A160420();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275F0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275E8);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *(void (**)(uint64_t *))(v5
                                         + *(int *)(type metadata accessor for AppendSettingsNavigationPathAction() + 20));
  if (v18)
  {
    v37[3] = a2;
    v37[4] = v35;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v37);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v7 + 16))(boxed_opaque_existential_1, v36, a2);
    swift_retain();
    v18(v37);
    sub_25A14ABBC((uint64_t)v18);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v37);
  }
  else
  {
    uint64_t v32 = a2;
    uint64_t v20 = v36;
    sub_25A149EAC(v5, (uint64_t)v13);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
    {
      sub_25A14AAFC((uint64_t)v13, &qword_26B3275F0);
      if (qword_26A408C58 != -1) {
        swift_once();
      }
      uint64_t v21 = sub_25A160310();
      __swift_project_value_buffer(v21, (uint64_t)qword_26A409688);
      uint64_t v22 = v9;
      uint64_t v23 = v20;
      uint64_t v24 = v32;
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v23, v32);
      v25 = sub_25A1602F0();
      os_log_type_t v26 = sub_25A1608D0();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = (uint8_t *)swift_slowAlloc();
        uint64_t v28 = swift_slowAlloc();
        v37[0] = v28;
        *(_DWORD *)uint64_t v27 = 136315138;
        swift_getDynamicType();
        uint64_t v29 = sub_25A160B40();
        v37[5] = sub_25A14A43C(v29, v30, v37);
        sub_25A160960();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v7 + 8))(v22, v24);
        swift_arrayDestroy();
        MEMORY[0x25A2F7630](v28, -1, -1);
        MEMORY[0x25A2F7630](v27, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v7 + 8))(v22, v24);
      }
    }
    else
    {
      sub_25A14AA94((uint64_t)v13, (uint64_t)v17);
      MEMORY[0x25A2F6B90](v14);
      sub_25A1603F0();
      sub_25A160700();
      sub_25A14AAFC((uint64_t)v17, &qword_26B3275E8);
    }
  }
}

uint64_t static AppendSettingsNavigationPathAction.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(int *)(type metadata accessor for AppendSettingsNavigationPathAction() + 24);
  uint64_t v5 = (uint64_t *)(a1 + v4);
  int v6 = *(unsigned __int8 *)(a1 + v4 + 8);
  uint64_t v7 = (uint64_t *)(a2 + v4);
  unsigned int v8 = *((unsigned __int8 *)v7 + 8);
  if (v6 & 1) != 0 || (v8) {
    return v6 & v8;
  }
  uint64_t v9 = *v7;
  uint64_t v10 = *v5;

  return MEMORY[0x270F05240](v10, v9);
}

uint64_t sub_25A14A40C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(int *)(a3 + 24);
  uint64_t v4 = (void *)(a1 + v3);
  int v5 = *(unsigned __int8 *)(a1 + v3 + 8);
  uint64_t v6 = a2 + v3;
  unsigned int v7 = *(unsigned __int8 *)(v6 + 8);
  if (v5 & 1) != 0 || (v7) {
    return v5 & v7;
  }
  else {
    return MEMORY[0x270F05240](*v4, *(void *)v6);
  }
}

uint64_t sub_25A14A43C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25A14A510(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25A145DCC((uint64_t)v12, *a3);
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
      sub_25A145DCC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_25A14A510(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25A160970();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25A14A6CC(a5, a6);
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
  uint64_t v8 = sub_25A160A10();
  if (!v8)
  {
    sub_25A160A30();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25A160A80();
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

uint64_t sub_25A14A6CC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25A14A764(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25A14A944(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25A14A944(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25A14A764(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25A14A8DC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25A1609F0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25A160A30();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25A160810();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25A160A80();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25A160A30();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25A14A8DC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327698);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25A14A944(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327698);
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
  uint64_t result = sub_25A160A80();
  __break(1u);
  return result;
}

uint64_t sub_25A14AA94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A14AAFC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_25A14ABBC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

ValueMetadata *type metadata accessor for AppendSettingsNavigationPathActionTrait()
{
  return &type metadata for AppendSettingsNavigationPathActionTrait;
}

uint64_t *initializeBufferWithCopyOfBuffer for AppendSettingsNavigationPathAction(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275E8);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275F0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      uint64_t v11 = a2[1];
      *a1 = *a2;
      a1[1] = v11;
      uint64_t v12 = *(int *)(v7 + 32);
      uint64_t v23 = (char *)a2 + v12;
      uint64_t v24 = (char *)a1 + v12;
      uint64_t v13 = sub_25A160420();
      uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
      swift_retain();
      swift_retain();
      v14(v24, v23, v13);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v15 = *(int *)(a3 + 20);
    uint64_t v16 = (uint64_t *)((char *)a1 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    if (*v17)
    {
      uint64_t v18 = v17[1];
      *uint64_t v16 = *v17;
      v16[1] = v18;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
    }
    uint64_t v19 = *(int *)(a3 + 24);
    uint64_t v20 = (char *)a1 + v19;
    uint64_t v21 = (char *)a2 + v19;
    *(void *)uint64_t v20 = *(void *)v21;
    v20[8] = v21[8];
  }
  return a1;
}

uint64_t destroy for AppendSettingsNavigationPathAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275E8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1, v4);
  if (!result)
  {
    swift_release();
    swift_release();
    uint64_t v6 = a1 + *(int *)(v4 + 32);
    uint64_t v7 = sub_25A160420();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  if (*(void *)(a1 + *(int *)(a2 + 20)))
  {
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for AppendSettingsNavigationPathAction(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275E8);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275F0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    uint64_t v10 = *(int *)(v6 + 32);
    uint64_t v21 = (char *)a2 + v10;
    uint64_t v22 = (char *)a1 + v10;
    uint64_t v11 = sub_25A160420();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_retain();
    swift_retain();
    v12(v22, v21, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  if (*v15)
  {
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  }
  uint64_t v17 = *(int *)(a3 + 24);
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  return a1;
}

void *assignWithCopy for AppendSettingsNavigationPathAction(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275E8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      uint64_t v11 = *(int *)(v6 + 32);
      uint64_t v31 = (char *)a2 + v11;
      uint64_t v32 = (char *)a1 + v11;
      uint64_t v12 = sub_25A160420();
      uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
      swift_retain();
      swift_retain();
      v13(v32, v31, v12);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    sub_25A14AAFC((uint64_t)a1, &qword_26B3275E8);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275F0);
    memcpy(a1, a2, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v27 = *(int *)(v6 + 32);
  uint64_t v28 = (char *)a1 + v27;
  uint64_t v29 = (char *)a2 + v27;
  uint64_t v30 = sub_25A160420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 24))(v28, v29, v30);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 20);
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = *(void *)((char *)a1 + v15);
  uint64_t v19 = *(void *)((char *)a2 + v15);
  if (!v18)
  {
    if (v19)
    {
      uint64_t v21 = *((void *)v17 + 1);
      *uint64_t v16 = v19;
      v16[1] = v21;
      swift_retain();
      goto LABEL_14;
    }
LABEL_13:
    *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
    goto LABEL_14;
  }
  if (!v19)
  {
    swift_release();
    goto LABEL_13;
  }
  uint64_t v20 = *((void *)v17 + 1);
  *uint64_t v16 = v19;
  v16[1] = v20;
  swift_retain();
  swift_release();
LABEL_14:
  uint64_t v22 = *(int *)(a3 + 24);
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  uint64_t v25 = *(void *)v24;
  v23[8] = v24[8];
  *(void *)uint64_t v23 = v25;
  return a1;
}

void *initializeWithTake for AppendSettingsNavigationPathAction(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275E8);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275F0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    uint64_t v10 = *(int *)(v6 + 32);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_25A160420();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v14 = *(int *)(a3 + 20);
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v17 = *v16;
  if (*v16)
  {
    uint64_t v18 = v16[1];
    *uint64_t v15 = v17;
    v15[1] = v18;
  }
  else
  {
    *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  }
  uint64_t v19 = *(int *)(a3 + 24);
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  *(void *)uint64_t v20 = *(void *)v21;
  v20[8] = v21[8];
  return a1;
}

void *assignWithTake for AppendSettingsNavigationPathAction(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275E8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      uint64_t v11 = a2[1];
      *a1 = *a2;
      a1[1] = v11;
      uint64_t v12 = *(int *)(v6 + 32);
      uint64_t v13 = (char *)a1 + v12;
      uint64_t v14 = (char *)a2 + v12;
      uint64_t v15 = sub_25A160420();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    sub_25A14AAFC((uint64_t)a1, &qword_26B3275E8);
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275F0);
    memcpy(a1, a2, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  uint64_t v28 = *(int *)(v6 + 32);
  uint64_t v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  uint64_t v31 = sub_25A160420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 40))(v29, v30, v31);
LABEL_7:
  uint64_t v17 = *(int *)(a3 + 20);
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = *(void *)((char *)a1 + v17);
  uint64_t v21 = *(void *)((char *)a2 + v17);
  if (!v20)
  {
    if (v21)
    {
      uint64_t v23 = *((void *)v19 + 1);
      *uint64_t v18 = v21;
      v18[1] = v23;
      goto LABEL_14;
    }
LABEL_13:
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
    goto LABEL_14;
  }
  if (!v21)
  {
    swift_release();
    goto LABEL_13;
  }
  uint64_t v22 = *((void *)v19 + 1);
  *uint64_t v18 = v21;
  v18[1] = v22;
  swift_release();
LABEL_14:
  uint64_t v24 = *(int *)(a3 + 24);
  uint64_t v25 = (char *)a1 + v24;
  os_log_type_t v26 = (char *)a2 + v24;
  *(void *)uint64_t v25 = *(void *)v26;
  v25[8] = v26[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for AppendSettingsNavigationPathAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A14B76C);
}

uint64_t sub_25A14B76C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275F0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for AppendSettingsNavigationPathAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A14B850);
}

uint64_t sub_25A14B850(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275F0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  return result;
}

void sub_25A14B910()
{
  sub_25A14B9B0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_25A14B9B0()
{
  if (!qword_26B3275F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B3275E8);
    unint64_t v0 = sub_25A160950();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B3275F8);
    }
  }
}

uint64_t sub_25A14BA0C()
{
  return swift_getWitnessTable();
}

unint64_t sub_25A14BA7C()
{
  unint64_t result = qword_26B3275B0;
  if (!qword_26B3275B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B3275B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3275B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for AppendSettingsNavigationPathActionKey()
{
  return &type metadata for AppendSettingsNavigationPathActionKey;
}

unint64_t sub_25A14BAEC()
{
  unint64_t result = qword_26B327408;
  if (!qword_26B327408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B327408);
  }
  return result;
}

unint64_t sub_25A14BB40()
{
  unint64_t result = qword_26B327380;
  if (!qword_26B327380)
  {
    type metadata accessor for AppendSettingsNavigationPathAction();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B327380);
  }
  return result;
}

uint64_t sub_25A14BB98(uint64_t a1, uint64_t a2)
{
  uint64_t appended = type metadata accessor for AppendSettingsNavigationPathAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(appended - 8) + 32))(a2, a1, appended);
  return a2;
}

uint64_t sub_25A14BBFC()
{
  uint64_t v0 = type metadata accessor for ClearSettingsNavigationPathAction();
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275F0);
  MEMORY[0x270FA5388](v3 - 8);
  int v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v0, qword_26B3273B0);
  uint64_t v6 = __swift_project_value_buffer(v0, (uint64_t)qword_26B3273B0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275E8);
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  v8(v5, 1, 1, v7);
  v8(v2, 1, 1, v7);
  uint64_t v9 = &v2[*(int *)(v0 + 20)];
  *(void *)uint64_t v9 = 0;
  *((void *)v9 + 1) = 0;
  unint64_t v10 = &v2[*(int *)(v0 + 24)];
  *(void *)unint64_t v10 = 0;
  v10[8] = 1;
  sub_25A148F8C((uint64_t)v5, (uint64_t)v2);
  return sub_25A14D114((uint64_t)v2, v6);
}

uint64_t ClearSettingsNavigationPathAction.init(namespace:navigationPath:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(a4, 1, 1, v8);
  uint64_t v9 = type metadata accessor for ClearSettingsNavigationPathAction();
  unint64_t v10 = (void *)(a4 + *(int *)(v9 + 20));
  *unint64_t v10 = 0;
  v10[1] = 0;
  uint64_t v11 = a4 + *(int *)(v9 + 24);
  *(void *)uint64_t v11 = a1;
  *(unsigned char *)(v11 + 8) = a2 & 1;

  return sub_25A148F8C(a3, a4);
}

uint64_t type metadata accessor for ClearSettingsNavigationPathAction()
{
  uint64_t result = qword_26B327370;
  if (!qword_26B327370) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A14BE8C@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B3273D0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for ClearSettingsNavigationPathAction();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B3273B0);

  return sub_25A14C090(v3, a1);
}

uint64_t sub_25A14BF04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_25A14D0BC();

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t sub_25A14BF68()
{
  uint64_t v0 = type metadata accessor for ClearSettingsNavigationPathAction();
  __swift_allocate_value_buffer(v0, qword_26B327438);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26B327438);
  if (qword_26B3273D0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26B3273B0);

  return sub_25A14C090(v2, v1);
}

uint64_t static ClearSettingsNavigationPathActionTrait.defaultValue.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B327458 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for ClearSettingsNavigationPathAction();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B327438);
  swift_beginAccess();
  return sub_25A14C090(v3, a1);
}

uint64_t sub_25A14C090(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClearSettingsNavigationPathAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static ClearSettingsNavigationPathActionTrait.defaultValue.setter(uint64_t a1)
{
  if (qword_26B327458 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for ClearSettingsNavigationPathAction();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B327438);
  swift_beginAccess();
  sub_25A14C190(a1, v3);
  swift_endAccess();
  return sub_25A14C1F4(a1);
}

uint64_t sub_25A14C190(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClearSettingsNavigationPathAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A14C1F4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ClearSettingsNavigationPathAction();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t (*static ClearSettingsNavigationPathActionTrait.defaultValue.modify())()
{
  if (qword_26B327458 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for ClearSettingsNavigationPathAction();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B327438);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_25A14C2E4@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B327458 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for ClearSettingsNavigationPathAction();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B327438);
  swift_beginAccess();
  return sub_25A14C090(v3, a1);
}

uint64_t EnvironmentValues.clearSettingsNavigationPath.getter()
{
  sub_25A14C3B8();

  return sub_25A1604A0();
}

unint64_t sub_25A14C3B8()
{
  unint64_t result = qword_26B3273E0;
  if (!qword_26B3273E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3273E0);
  }
  return result;
}

uint64_t sub_25A14C40C()
{
  return sub_25A1604A0();
}

uint64_t sub_25A14C44C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ClearSettingsNavigationPathAction();
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  int v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v9 - v6;
  sub_25A14C090(a1, (uint64_t)&v9 - v6);
  sub_25A14C090((uint64_t)v7, (uint64_t)v5);
  sub_25A14C3B8();
  sub_25A1604B0();
  return sub_25A14C1F4((uint64_t)v7);
}

uint64_t View.clearSettingsNavigationPathAction(_:)()
{
  swift_getKeyPath();
  sub_25A160650();

  return swift_release();
}

uint64_t sub_25A14C590()
{
  return sub_25A1604A0();
}

uint64_t UITraitCollection.clearSettingsNavigationPath.getter()
{
  sub_25A14C61C();

  return sub_25A160900();
}

unint64_t sub_25A14C61C()
{
  unint64_t result = qword_26B327460;
  if (!qword_26B327460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B327460);
  }
  return result;
}

uint64_t sub_25A14C670(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ClearSettingsNavigationPathAction();
  MEMORY[0x270FA5388](v2 - 8);
  sub_25A14C090(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25A14C61C();
  sub_25A160340();
  return sub_25A14C1F4(a1);
}

uint64_t sub_25A14C728()
{
  return sub_25A160900();
}

uint64_t sub_25A14C768(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClearSettingsNavigationPathAction();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A14C090(a2, (uint64_t)v6);
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
  return sub_25A14C670((uint64_t)v6);
}

uint64_t ClearSettingsNavigationPathAction.init(namespace:onClear:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a5, 1, 1, v10);
  uint64_t result = type metadata accessor for ClearSettingsNavigationPathAction();
  uint64_t v12 = (void *)(a5 + *(int *)(result + 20));
  uint64_t v13 = a5 + *(int *)(result + 24);
  *(void *)uint64_t v13 = a1;
  *(unsigned char *)(v13 + 8) = a2 & 1;
  void *v12 = a3;
  v12[1] = a4;
  return result;
}

Swift::Void __swiftcall ClearSettingsNavigationPathAction.callAsFunction()()
{
  uint64_t v1 = sub_25A160420();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275F0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275E8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void (**)(uint64_t))(v0
                                       + *(int *)(type metadata accessor for ClearSettingsNavigationPathAction() + 20));
  if (v12)
  {
    uint64_t v13 = swift_retain();
    v12(v13);
    sub_25A14ABBC((uint64_t)v12);
  }
  else
  {
    sub_25A149EAC(v0, (uint64_t)v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    {
      sub_25A14AAFC((uint64_t)v7, &qword_26B3275F0);
      if (qword_26A408C58 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_25A160310();
      __swift_project_value_buffer(v14, (uint64_t)qword_26A409688);
      uint64_t v15 = sub_25A1602F0();
      os_log_type_t v16 = sub_25A1608D0();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v17 = 0;
        MEMORY[0x25A2F7630](v17, -1, -1);
      }
    }
    else
    {
      sub_25A14AA94((uint64_t)v7, (uint64_t)v11);
      MEMORY[0x25A2F6B90](v8);
      char v18 = sub_25A160400();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      if (v18)
      {
        if (qword_26A408C58 != -1) {
          swift_once();
        }
        uint64_t v19 = sub_25A160310();
        __swift_project_value_buffer(v19, (uint64_t)qword_26A409688);
        uint64_t v20 = sub_25A1602F0();
        os_log_type_t v21 = sub_25A1608E0();
        if (os_log_type_enabled(v20, v21))
        {
          uint64_t v22 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v22 = 0;
          _os_log_impl(&dword_25A143000, v20, v21, "NavigationPath is already empty.", v22, 2u);
          MEMORY[0x25A2F7630](v22, -1, -1);
        }
      }
      else
      {
        sub_25A160410();
        sub_25A160700();
      }
      sub_25A14AAFC((uint64_t)v11, &qword_26B3275E8);
    }
  }
}

uint64_t static ClearSettingsNavigationPathAction.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(int *)(type metadata accessor for ClearSettingsNavigationPathAction() + 24);
  uint64_t v5 = (uint64_t *)(a1 + v4);
  int v6 = *(unsigned __int8 *)(a1 + v4 + 8);
  uint64_t v7 = (uint64_t *)(a2 + v4);
  unsigned int v8 = *((unsigned __int8 *)v7 + 8);
  if (v6 & 1) != 0 || (v8) {
    return v6 & v8;
  }
  uint64_t v9 = *v7;
  uint64_t v10 = *v5;

  return MEMORY[0x270F05240](v10, v9);
}

ValueMetadata *type metadata accessor for ClearSettingsNavigationPathActionTrait()
{
  return &type metadata for ClearSettingsNavigationPathActionTrait;
}

uint64_t getEnumTagSinglePayload for ClearSettingsNavigationPathAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A14CD44);
}

uint64_t sub_25A14CD44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275F0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    unsigned int v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for ClearSettingsNavigationPathAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A14CE28);
}

uint64_t sub_25A14CE28(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275F0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  return result;
}

void sub_25A14CEE8()
{
  sub_25A14B9B0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_25A14CF88()
{
  return swift_getWitnessTable();
}

unint64_t sub_25A14CFF8()
{
  unint64_t result = qword_26B3275A0;
  if (!qword_26B3275A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B3275A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3275A0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ClearSettingsNavigationPathActionKey()
{
  return &type metadata for ClearSettingsNavigationPathActionKey;
}

unint64_t sub_25A14D068()
{
  unint64_t result = qword_26B3273D8;
  if (!qword_26B3273D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3273D8);
  }
  return result;
}

unint64_t sub_25A14D0BC()
{
  unint64_t result = qword_26B327368;
  if (!qword_26B327368)
  {
    type metadata accessor for ClearSettingsNavigationPathAction();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B327368);
  }
  return result;
}

uint64_t sub_25A14D114(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClearSettingsNavigationPathAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t ResetSettingsNavigationStateAction.init(namespace:onReset:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = a3;
  *(void *)(a5 + 8) = a4;
  *(void *)(a5 + 16) = result;
  *(unsigned char *)(a5 + 24) = a2 & 1;
  return result;
}

uint64_t sub_25A14D18C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1 = qword_26A408DC0;
  char v2 = byte_26A408DD8;
  *(void *)a1 = qword_26A408DC0;
  *(_OWORD *)(a1 + 8) = unk_26A408DC8;
  *(unsigned char *)(a1 + 24) = v2;
  return sub_25A14D2DC(v1);
}

uint64_t sub_25A14D1B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_25A14DDA0();

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t sub_25A14D218()
{
  qword_26B327498 = qword_26A408DC0;
  unk_26B3274A0 = *(_OWORD *)&qword_26A408DC8;
  byte_26B3274B0 = byte_26A408DD8;
  return sub_25A14D2DC(qword_26A408DC0);
}

uint64_t static ResetSettingsNavigationStateActionTrait.defaultValue.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B3274C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = qword_26B327498;
  char v3 = byte_26B3274B0;
  *(void *)a1 = qword_26B327498;
  *(_OWORD *)(a1 + 8) = unk_26B3274A0;
  *(unsigned char *)(a1 + 24) = v3;
  return sub_25A14D2DC(v2);
}

uint64_t sub_25A14D2DC(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t static ResetSettingsNavigationStateActionTrait.defaultValue.setter(uint64_t a1)
{
  uint64_t v1 = *(void *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  char v4 = *(unsigned char *)(a1 + 24);
  if (qword_26B3274C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v5 = qword_26B327498;
  qword_26B327498 = v1;
  unk_26B3274A0 = v2;
  qword_26B3274A8 = v3;
  byte_26B3274B0 = v4;
  return sub_25A14ABBC(v5);
}

uint64_t (*static ResetSettingsNavigationStateActionTrait.defaultValue.modify())()
{
  if (qword_26B3274C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_25A14D414@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B3274C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = qword_26B327498;
  char v3 = byte_26B3274B0;
  *(void *)a1 = qword_26B327498;
  *(_OWORD *)(a1 + 8) = unk_26B3274A0;
  *(unsigned char *)(a1 + 24) = v3;
  return sub_25A14D2DC(v2);
}

uint64_t EnvironmentValues.resetSettingsNavigationState.getter()
{
  sub_25A14D4F0();

  return sub_25A1604A0();
}

unint64_t sub_25A14D4F0()
{
  unint64_t result = qword_26B327420;
  if (!qword_26B327420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B327420);
  }
  return result;
}

double sub_25A14D544@<D0>(uint64_t a1@<X8>)
{
  sub_25A14D4F0();
  sub_25A1604A0();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_25A14D5A4(uint64_t *a1)
{
  return sub_25A1604B0();
}

uint64_t View.resetSettingsNavigationStateAction(_:)()
{
  return swift_release();
}

uint64_t sub_25A14D6A8()
{
  return sub_25A160340();
}

uint64_t UITraitCollection.resetSettingsNavigationState.getter()
{
  sub_25A14D760();

  return sub_25A160900();
}

unint64_t sub_25A14D760()
{
  unint64_t result = qword_26B3274C8;
  if (!qword_26B3274C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3274C8);
  }
  return result;
}

uint64_t sub_25A14D7B4()
{
  return sub_25A160900();
}

uint64_t sub_25A14D7F4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
  sub_25A14D2DC(v2);
  return sub_25A14D6A8();
}

Swift::Void __swiftcall ResetSettingsNavigationStateAction.callAsFunction()()
{
  uint64_t v1 = *v0;
  if (*v0)
  {
    uint64_t v2 = swift_retain();
    v1(v2);
    sub_25A14ABBC((uint64_t)v1);
  }
  else
  {
    if (qword_26A408C58 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25A160310();
    __swift_project_value_buffer(v3, (uint64_t)qword_26A409688);
    oslog = sub_25A1602F0();
    os_log_type_t v4 = sub_25A1608D0();
    if (os_log_type_enabled(oslog, v4))
    {
      char v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v5 = 0;
      _os_log_impl(&dword_25A143000, oslog, v4, "Attempting to reset settings navigation state when there is no reset action set.", v5, 2u);
      MEMORY[0x25A2F7630](v5, -1, -1);
    }
  }
}

uint64_t static ResetSettingsNavigationStateAction.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 24);
  unsigned int v3 = *(unsigned __int8 *)(a2 + 24);
  if (v2 & 1) != 0 || (v3) {
    return v2 & v3;
  }
  else {
    return MEMORY[0x270F05240](*(void *)(a1 + 16), *(void *)(a2 + 16));
  }
}

uint64_t sub_25A14D9C8(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 24);
  unsigned int v3 = *(unsigned __int8 *)(a2 + 24);
  if (v2 & 1) != 0 || (v3) {
    return v2 & v3;
  }
  else {
    return MEMORY[0x270F05240](*(void *)(a1 + 16), *(void *)(a2 + 16));
  }
}

ValueMetadata *type metadata accessor for ResetSettingsNavigationStateActionTrait()
{
  return &type metadata for ResetSettingsNavigationStateActionTrait;
}

uint64_t initializeBufferWithCopyOfBuffer for ResetSettingsNavigationStateAction(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void *destroy for ResetSettingsNavigationStateAction(void *result)
{
  if (*result) {
    return (void *)swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for ResetSettingsNavigationStateAction(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2)
  {
    uint64_t v4 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t assignWithCopy for ResetSettingsNavigationStateAction(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (!*(void *)a1)
  {
    if (v4)
    {
      uint64_t v6 = a2[1];
      *(void *)a1 = v4;
      *(void *)(a1 + 8) = v6;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = a2[1];
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  swift_retain();
  swift_release();
LABEL_8:
  uint64_t v7 = a2[2];
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  *(void *)(a1 + 16) = v7;
  return a1;
}

uint64_t assignWithTake for ResetSettingsNavigationStateAction(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (!*(void *)a1)
  {
    if (v4)
    {
      uint64_t v6 = a2[1];
      *(void *)a1 = v4;
      *(void *)(a1 + 8) = v6;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = a2[1];
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  swift_release();
LABEL_8:
  *(void *)(a1 + 16) = a2[2];
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for ResetSettingsNavigationStateAction(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 25)) {
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

uint64_t storeEnumTagSinglePayload for ResetSettingsNavigationStateAction(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ResetSettingsNavigationStateAction()
{
  return &type metadata for ResetSettingsNavigationStateAction;
}

uint64_t sub_25A14DC6C()
{
  return swift_getWitnessTable();
}

unint64_t sub_25A14DCDC()
{
  unint64_t result = qword_26B3275C0;
  if (!qword_26B3275C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26B3275C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3275C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ResetSettingsNavigationStateActionKey()
{
  return &type metadata for ResetSettingsNavigationStateActionKey;
}

unint64_t sub_25A14DD4C()
{
  unint64_t result = qword_26B327418;
  if (!qword_26B327418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B327418);
  }
  return result;
}

unint64_t sub_25A14DDA0()
{
  unint64_t result = qword_26B327398;
  if (!qword_26B327398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B327398);
  }
  return result;
}

uint64_t type metadata accessor for PreferencesControllerErrorHostingController()
{
  uint64_t result = qword_26A408DE0;
  if (!qword_26A408DE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A14DE40()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25A14DE80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = objc_msgSend(self, sel_currentDevice);
  unsigned int v5 = objc_msgSend(v4, sel_sf_isInternalInstall);

  if (v5)
  {
    uint64_t v6 = sub_25A1604C0();
    sub_25A14E01C(a1, (uint64_t)v10);
    *(_OWORD *)&v12[119] = v10[7];
    *(_OWORD *)&v12[135] = v10[8];
    *(_OWORD *)&v12[151] = v10[9];
    *(_OWORD *)&v12[55] = v10[3];
    *(_OWORD *)&v12[71] = v10[4];
    *(_OWORD *)&v12[87] = v10[5];
    *(_OWORD *)&v12[103] = v10[6];
    *(_OWORD *)&v12[7] = v10[0];
    *(_OWORD *)&v12[23] = v10[1];
    char v13 = 1;
    v12[167] = v11;
    *(_OWORD *)&v12[39] = v10[2];
    uint64_t KeyPath = swift_getKeyPath();
    char v8 = sub_25A1605E0();
    long long v24 = *(_OWORD *)&v12[112];
    long long v25 = *(_OWORD *)&v12[128];
    long long v26 = *(_OWORD *)&v12[144];
    long long v20 = *(_OWORD *)&v12[48];
    long long v21 = *(_OWORD *)&v12[64];
    long long v22 = *(_OWORD *)&v12[80];
    long long v23 = *(_OWORD *)&v12[96];
    long long v17 = *(_OWORD *)v12;
    long long v18 = *(_OWORD *)&v12[16];
    char v14 = 1;
    long long v15 = (unint64_t)v6;
    char v16 = 1;
    uint64_t v27 = *(void *)&v12[160];
    long long v19 = *(_OWORD *)&v12[32];
    uint64_t v28 = KeyPath;
    char v29 = 1;
    char v30 = v8;
    long long v31 = 0u;
    long long v32 = 0u;
    char v33 = 1;
    nullsub_6(&v15);
  }
  else
  {
    sub_25A14EB2C(&v15);
  }
  sub_25A14EB58((uint64_t)&v15, (uint64_t)v34);
  return sub_25A14EB58((uint64_t)v34, a2);
}

uint64_t sub_25A14E01C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25A1606A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A160690();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F1B4B8], v4);
  uint64_t v39 = sub_25A1606B0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_25A160710();
  sub_25A1603C0();
  char v8 = v45;
  uint64_t v37 = v46;
  uint64_t v38 = v44;
  char v9 = v47;
  uint64_t v36 = v48;
  uint64_t v35 = v49;
  uint64_t v34 = sub_25A160680();
  uint64_t KeyPath = swift_getKeyPath();
  sub_25A160610();
  uint64_t v31 = sub_25A160620();
  uint64_t v30 = v10;
  char v12 = v11;
  uint64_t v32 = v13;
  swift_release();
  int v14 = v12 & 1;
  uint64_t v42 = 0;
  unint64_t v43 = 0xE000000000000000;
  uint64_t v41 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A408DF8);
  sub_25A160A20();
  sub_25A160600();
  uint64_t v15 = sub_25A160620();
  uint64_t v17 = v16;
  LOBYTE(v5) = v18;
  uint64_t v20 = v19;
  swift_bridgeObjectRelease();
  swift_release();
  HIDWORD(v29) = v14;
  char v40 = v14;
  char v58 = 1;
  char v57 = v8;
  char v56 = v9;
  char v54 = v14;
  char v52 = v5 & 1;
  char v50 = 1;
  *(_DWORD *)(a2 + 9) = v42;
  *(_DWORD *)(a2 + 12) = *(_DWORD *)((char *)&v42 + 3);
  *(_DWORD *)(a2 + 33) = v41;
  *(_DWORD *)(a2 + 36) = *(_DWORD *)((char *)&v41 + 3);
  int v21 = *(_DWORD *)v55;
  *(_DWORD *)(a2 + 52) = *(_DWORD *)&v55[3];
  *(_DWORD *)(a2 + 49) = v21;
  int v22 = *(_DWORD *)v53;
  *(_DWORD *)(a2 + 108) = *(_DWORD *)&v53[3];
  *(_DWORD *)(a2 + 105) = v22;
  int v23 = *(_DWORD *)v51;
  *(_DWORD *)(a2 + 140) = *(_DWORD *)&v51[3];
  *(_DWORD *)(a2 + 137) = v23;
  LOBYTE(v23) = v50;
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  uint64_t v24 = v38;
  *(void *)(a2 + 16) = v39;
  *(void *)(a2 + 24) = v24;
  *(unsigned char *)(a2 + 32) = v8;
  *(void *)(a2 + 40) = v37;
  *(unsigned char *)(a2 + 48) = v9;
  *(void *)(a2 + 56) = v36;
  *(void *)(a2 + 64) = v35;
  uint64_t v25 = v34;
  *(void *)(a2 + 72) = KeyPath;
  *(void *)(a2 + 80) = v25;
  uint64_t v26 = v31;
  uint64_t v27 = v30;
  *(void *)(a2 + 88) = v31;
  *(void *)(a2 + 96) = v27;
  *(unsigned char *)(a2 + 104) = v14;
  *(void *)(a2 + 112) = v32;
  *(void *)(a2 + 120) = v15;
  *(void *)(a2 + 128) = v17;
  *(unsigned char *)(a2 + 136) = v5 & 1;
  *(void *)(a2 + 144) = v20;
  *(void *)(a2 + 152) = 0;
  *(unsigned char *)(a2 + 160) = v23;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_25A14F188(v26, v27, SBYTE4(v29));
  swift_bridgeObjectRetain();
  sub_25A14F188(v15, v17, v5 & 1);
  swift_bridgeObjectRetain();
  sub_25A14F198(v15, v17, v5 & 1);
  swift_bridgeObjectRelease();
  sub_25A14F198(v26, v27, v40);
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A14E444@<X0>(uint64_t a1@<X8>)
{
  return sub_25A14DE80(*v1, a1);
}

id sub_25A14E450()
{
  return 0;
}

id sub_25A14E45C()
{
  return 0;
}

id sub_25A14E468()
{
  return 0;
}

uint64_t sub_25A14E478(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    id v5 = a4;
    id v6 = a1;
    swift_unknownObjectRetain();
    sub_25A160980();

    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  return sub_25A14AAFC((uint64_t)v8, &qword_26A408E48);
}

id sub_25A14E4FC()
{
  return 0;
}

uint64_t sub_25A14E504(void *a1, uint64_t a2, void *a3, const void *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A408E00);
  MEMORY[0x270FA5388](v7 - 8);
  char v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  char v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_25A160880();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A408E10;
  v13[5] = v11;
  int v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A408E20;
  v14[5] = v13;
  id v15 = a3;
  id v16 = a1;
  sub_25A14ED58((uint64_t)v9, (uint64_t)&unk_26A408E30, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_25A14E680(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v3[5] = sub_25A160860();
  v3[6] = sub_25A160850();
  uint64_t v5 = sub_25A160840();
  return MEMORY[0x270FA2498](sub_25A14E720, v5, v4);
}

uint64_t sub_25A14E720()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(const void **)(v0 + 24);
  swift_release();
  *(void *)(v0 + 56) = _Block_copy(v2);
  if (v1) {
    uint64_t v3 = sub_25A1607B0();
  }
  else {
    uint64_t v3 = 0;
  }
  *(void *)(v0 + 64) = v3;
  id v4 = *(id *)(v0 + 32);
  *(void *)(v0 + 72) = sub_25A160850();
  uint64_t v6 = sub_25A160840();
  return MEMORY[0x270FA2498](sub_25A14E7FC, v6, v5);
}

uint64_t sub_25A14E7FC()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = (void *)v0[4];
  swift_release();
  swift_bridgeObjectRelease();

  if (v1)
  {
    uint64_t v3 = (void (**)(void))v0[7];
    v3[2](v3);
    _Block_release(v3);
  }
  id v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_25A14E898()
{
  return 1;
}

id sub_25A14E8A0(void *a1, uint64_t a2, uint64_t a3)
{
  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for PreferencesControllerErrorHostingController();
  return objc_msgSendSuper2(&v5, sel_initWithCoder_, a3);
}

id sub_25A14E8EC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PreferencesControllerErrorHostingController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25A14E924()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for PreferencesControllerErrorHostingController());
  return sub_25A1604E0();
}

uint64_t sub_25A14E968()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for PreferencesControllerErrorHostingController());
  return sub_25A1604D0();
}

uint64_t sub_25A14E9BC()
{
  return type metadata accessor for PreferencesControllerErrorHostingController();
}

void *initializeBufferWithCopyOfBuffer for PreferencesControllerErrorView(void *a1, id *a2)
{
  id v3 = *a2;
  id v4 = *a2;
  *a1 = v3;
  return a1;
}

void destroy for PreferencesControllerErrorView(id *a1)
{
}

void **assignWithCopy for PreferencesControllerErrorView(void **a1, id *a2)
{
  id v3 = *a2;
  id v4 = *a2;
  objc_super v5 = *a1;
  *a1 = v3;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **assignWithTake for PreferencesControllerErrorView(void **a1, void **a2)
{
  id v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for PreferencesControllerErrorView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PreferencesControllerErrorView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreferencesControllerErrorView()
{
  return &type metadata for PreferencesControllerErrorView;
}

uint64_t sub_25A14EB10()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_25A14EB2C(_OWORD *a1)
{
  double result = 0.0;
  *(_OWORD *)((char *)a1 + 233) = 0u;
  a1[13] = 0u;
  a1[14] = 0u;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_25A14EB58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A408DF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A14EBC0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_25A14F85C;
  return v6();
}

uint64_t sub_25A14EC8C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  objc_super v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *objc_super v5 = v4;
  v5[1] = sub_25A14F85C;
  return v7();
}

uint64_t sub_25A14ED58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A160880();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_25A160870();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25A14AAFC(a1, &qword_26A408E00);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25A160840();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_25A14EF04(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25A14EFE0;
  return v6(a1);
}

uint64_t sub_25A14EFE0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25A14F0D8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A160470();
  *a1 = result;
  return result;
}

uint64_t sub_25A14F104()
{
  return sub_25A160480();
}

uint64_t sub_25A14F130@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A160450();
  *a1 = result;
  return result;
}

uint64_t sub_25A14F15C()
{
  return sub_25A160460();
}

uint64_t sub_25A14F188(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_25A14F198(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25A14F1A8()
{
  _Block_release(*(const void **)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25A14F1F0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  objc_super v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *objc_super v5 = v1;
  v5[1] = sub_25A14F2A4;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_26A408E08 + dword_26A408E08);
  return v6(v2, v3, v4);
}

uint64_t sub_25A14F2A4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25A14F39C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  objc_super v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *objc_super v5 = v1;
  v5[1] = sub_25A14F85C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_26A408E18 + dword_26A408E18);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_8Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25A14F4A0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_25A14F85C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_26A408E28 + dword_26A408E28);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_25A14F56C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25A14F5A4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25A14F2A4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A408E38 + dword_26A408E38);
  return v6(a1, v4);
}

unint64_t sub_25A14F660()
{
  unint64_t result = qword_26A408E50;
  if (!qword_26A408E50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A408DF0);
    sub_25A14F6D4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A408E50);
  }
  return result;
}

unint64_t sub_25A14F6D4()
{
  unint64_t result = qword_26A408E58;
  if (!qword_26A408E58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A408E60);
    sub_25A14F750();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A408E58);
  }
  return result;
}

unint64_t sub_25A14F750()
{
  unint64_t result = qword_26A408E68;
  if (!qword_26A408E68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A408E70);
    sub_25A14F814(&qword_26A408E78, &qword_26A408E80);
    sub_25A14F814(&qword_26A408E88, qword_26A408E90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A408E68);
  }
  return result;
}

uint64_t sub_25A14F814(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_25A14F860()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for NSBundle.PreferencesPluginLocation();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (void **)((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25A1513AC(v1, (uint64_t)v7, type metadata accessor for PreferencesControllerRecipe.Kind);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327600);
      sub_25A14FF30((uint64_t)v7 + *(int *)(v12 + 48), (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
      unint64_t v14 = 0;
      unint64_t v15 = 0xE000000000000000;
      sub_25A1609E0();
      sub_25A160800();
      sub_25A160800();
      swift_bridgeObjectRelease();
      sub_25A160800();
      NSBundle.PreferencesPluginLocation.description.getter();
      sub_25A160800();
      swift_bridgeObjectRelease();
      sub_25A160800();
      sub_25A160800();
      swift_bridgeObjectRelease();
      sub_25A160800();
      unint64_t v11 = v14;
      sub_25A152938((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
      return v11;
    case 2u:
      unint64_t v14 = 0;
      unint64_t v15 = 0xE000000000000000;
      sub_25A1609E0();
      sub_25A160800();
      swift_getMetatypeMetadata();
      sub_25A160B40();
      sub_25A160800();
      swift_bridgeObjectRelease();
      sub_25A160800();
      return v14;
    case 3u:
      uint64_t v8 = *v7;
      unint64_t v14 = 0;
      unint64_t v15 = 0xE000000000000000;
      sub_25A1609E0();
      swift_bridgeObjectRelease();
      unint64_t v14 = 0xD00000000000002CLL;
      unint64_t v15 = 0x800000025A162F30;
      id v9 = objc_msgSend(v8, sel_description);
      goto LABEL_5;
    default:
      uint64_t v8 = *v7;
      unint64_t v14 = 0;
      unint64_t v15 = 0xE000000000000000;
      sub_25A1609E0();
      swift_bridgeObjectRelease();
      unint64_t v14 = 0xD000000000000019;
      unint64_t v15 = 0x800000025A162FF0;
      id v9 = objc_msgSend(v8, sel_description);
LABEL_5:
      id v10 = v9;
      sub_25A1607E0();

      sub_25A160800();
      swift_bridgeObjectRelease();
      sub_25A160800();

      return v14;
  }
}

void PreferencesControllerRecipe.viewControllerIfLoaded.getter()
{
  type metadata accessor for PreferencesControllerRecipe(0);

  JUMPOUT(0x25A2F76F0);
}

uint64_t type metadata accessor for PreferencesControllerRecipe(uint64_t a1)
{
  return sub_25A14FCDC(a1, (uint64_t *)&unk_26B327260);
}

uint64_t PreferencesControllerRecipe.init(specifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25A150C10(a1, a2);
}

uint64_t type metadata accessor for PreferencesControllerRecipe.Kind(uint64_t a1)
{
  return sub_25A14FCDC(a1, qword_26B3272A8);
}

uint64_t sub_25A14FCDC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void PreferencesControllerRecipe.init(specifier:pendingURLPayload:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for PreferencesControllerRecipe(0);
  uint64_t v7 = (int *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (uint64_t *)((char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  void *v12 = a1;
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = v7[7];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327560);
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(void *)&v9[v13] = v14;
  uint64_t v15 = v7[8];
  *(void *)&v9[v15] = 0;
  *(void *)&v9[v7[9]] = 0;
  sub_25A14FF30((uint64_t)v12, (uint64_t)v9, type metadata accessor for PreferencesControllerRecipe.Kind);
  *(void *)&v9[v7[10]] = 0;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327738);
  uint64_t v17 = swift_allocObject();
  *(unsigned char *)(v17 + 16) = 0;
  *(void *)(v17 + 24) = sub_25A15384C;
  *(void *)(v17 + 32) = v16;
  id v18 = a1;
  swift_release();
  *(void *)&v9[v15] = v17;
  sub_25A14FF30((uint64_t)v9, a3, type metadata accessor for PreferencesControllerRecipe);
}

uint64_t sub_25A14FEF8()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25A14FF30(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t PreferencesControllerRecipe.init(viewController:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25A150C10(a1, a2);
}

uint64_t PreferencesControllerRecipe.init(viewController:specifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_25A150D28(a1, a2, a3);
}

void PreferencesControllerRecipe.init(viewController:pendingURLPayload:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for PreferencesControllerRecipe(0);
  uint64_t v7 = (int *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (uint64_t *)((char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  void *v12 = a1;
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = v7[7];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327560);
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(void *)&v9[v13] = v14;
  uint64_t v15 = v7[8];
  *(void *)&v9[v15] = 0;
  *(void *)&v9[v7[9]] = 0;
  sub_25A14FF30((uint64_t)v12, (uint64_t)v9, type metadata accessor for PreferencesControllerRecipe.Kind);
  *(void *)&v9[v7[10]] = 0;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327738);
  uint64_t v17 = swift_allocObject();
  *(unsigned char *)(v17 + 16) = 0;
  *(void *)(v17 + 24) = sub_25A15384C;
  *(void *)(v17 + 32) = v16;
  id v18 = a1;
  swift_release();
  *(void *)&v9[v15] = v17;
  sub_25A14FF30((uint64_t)v9, a3, type metadata accessor for PreferencesControllerRecipe);
}

void PreferencesControllerRecipe.init(viewController:specifier:pendingURLPayload:)(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for PreferencesControllerRecipe(0);
  id v9 = (int *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (uint64_t *)((char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v14 = a1;
  swift_storeEnumTagMultiPayload();
  uint64_t v15 = v9[7];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327560);
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(void *)&v11[v15] = v16;
  uint64_t v17 = v9[8];
  *(void *)&v11[v17] = 0;
  *(void *)&v11[v9[9]] = 0;
  sub_25A14FF30((uint64_t)v14, (uint64_t)v11, type metadata accessor for PreferencesControllerRecipe.Kind);
  *(void *)&v11[v9[10]] = a2;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327738);
  uint64_t v19 = swift_allocObject();
  *(unsigned char *)(v19 + 16) = 0;
  *(void *)(v19 + 24) = sub_25A15384C;
  *(void *)(v19 + 32) = v18;
  id v20 = a1;
  id v21 = a2;
  swift_release();
  *(void *)&v11[v17] = v19;
  sub_25A14FF30((uint64_t)v11, a4, type metadata accessor for PreferencesControllerRecipe);
}

uint64_t PreferencesControllerRecipe.init(bundleName:location:viewControllerClassName:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v26 = a6;
  uint64_t v11 = type metadata accessor for PreferencesControllerRecipe(0);
  uint64_t v12 = (int *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (uint64_t *)((char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327600);
  uint64_t v19 = (uint64_t)v17 + *(int *)(v18 + 48);
  id v20 = (void *)((char *)v17 + *(int *)(v18 + 64));
  *uint64_t v17 = a1;
  v17[1] = a2;
  sub_25A1513AC(a3, v19, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
  void *v20 = a4;
  v20[1] = a5;
  swift_storeEnumTagMultiPayload();
  uint64_t v21 = v12[7];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327560);
  uint64_t v22 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(void *)&v14[v21] = v22;
  uint64_t v23 = v12[8];
  *(void *)&v14[v12[9]] = 0;
  sub_25A14FF30((uint64_t)v17, (uint64_t)v14, type metadata accessor for PreferencesControllerRecipe.Kind);
  *(void *)&v14[v12[10]] = 0;
  *(void *)&v14[v23] = 0;
  sub_25A14FF30((uint64_t)v14, v26, type metadata accessor for PreferencesControllerRecipe);
  return sub_25A152938(a3, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
}

uint64_t PreferencesControllerRecipe.init(specifier:bundleName:location:viewControllerClassName:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v27 = a1;
  uint64_t v28 = a7;
  uint64_t v12 = type metadata accessor for PreferencesControllerRecipe(0);
  uint64_t v13 = (int *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (uint64_t *)((char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327600);
  uint64_t v20 = (uint64_t)v18 + *(int *)(v19 + 48);
  uint64_t v21 = (void *)((char *)v18 + *(int *)(v19 + 64));
  *uint64_t v18 = a2;
  v18[1] = a3;
  sub_25A1513AC(a4, v20, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
  *uint64_t v21 = a5;
  v21[1] = a6;
  swift_storeEnumTagMultiPayload();
  uint64_t v22 = v13[7];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327560);
  uint64_t v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(void *)&v15[v22] = v23;
  uint64_t v24 = v13[8];
  *(void *)&v15[v13[9]] = 0;
  sub_25A14FF30((uint64_t)v18, (uint64_t)v15, type metadata accessor for PreferencesControllerRecipe.Kind);
  uint64_t v25 = v28;
  *(void *)&v15[v13[10]] = v27;
  *(void *)&v15[v24] = 0;
  sub_25A14FF30((uint64_t)v15, v25, type metadata accessor for PreferencesControllerRecipe);
  return sub_25A152938(a4, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
}

uint64_t PreferencesControllerRecipe.init(bundleName:location:viewControllerClassName:pendingURLPayload:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v28 = a6;
  uint64_t v29 = a7;
  uint64_t v12 = type metadata accessor for PreferencesControllerRecipe(0);
  uint64_t v13 = (int *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (uint64_t *)((char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327600);
  uint64_t v20 = (uint64_t)v18 + *(int *)(v19 + 48);
  uint64_t v21 = (void *)((char *)v18 + *(int *)(v19 + 64));
  *uint64_t v18 = a1;
  v18[1] = a2;
  sub_25A1513AC(a3, v20, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
  *uint64_t v21 = a4;
  v21[1] = a5;
  swift_storeEnumTagMultiPayload();
  uint64_t v22 = v13[7];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327560);
  uint64_t v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(void *)&v15[v22] = v23;
  uint64_t v24 = v13[8];
  *(void *)&v15[v24] = 0;
  *(void *)&v15[v13[9]] = 0;
  sub_25A14FF30((uint64_t)v18, (uint64_t)v15, type metadata accessor for PreferencesControllerRecipe.Kind);
  *(void *)&v15[v13[10]] = 0;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v28;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327738);
  uint64_t v26 = swift_allocObject();
  *(unsigned char *)(v26 + 16) = 0;
  *(void *)(v26 + 24) = sub_25A15384C;
  *(void *)(v26 + 32) = v25;
  swift_release();
  *(void *)&v15[v24] = v26;
  sub_25A14FF30((uint64_t)v15, v29, type metadata accessor for PreferencesControllerRecipe);
  return sub_25A152938(a3, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
}

uint64_t PreferencesControllerRecipe.init(specifier:bundleName:location:viewControllerClassName:pendingURLPayload:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v32 = a1;
  uint64_t v33 = a7;
  uint64_t v34 = a8;
  uint64_t v13 = type metadata accessor for PreferencesControllerRecipe(0);
  uint64_t v14 = (int *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (uint64_t *)((char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327600);
  uint64_t v21 = (uint64_t)v19 + *(int *)(v20 + 48);
  uint64_t v22 = (void *)((char *)v19 + *(int *)(v20 + 64));
  *uint64_t v19 = a2;
  v19[1] = a3;
  sub_25A1513AC(a4, v21, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
  *uint64_t v22 = a5;
  v22[1] = a6;
  swift_storeEnumTagMultiPayload();
  uint64_t v23 = v14[7];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327560);
  uint64_t v24 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(void *)&v16[v23] = v24;
  uint64_t v25 = v14[8];
  *(void *)&v16[v25] = 0;
  *(void *)&v16[v14[9]] = 0;
  sub_25A14FF30((uint64_t)v19, (uint64_t)v16, type metadata accessor for PreferencesControllerRecipe.Kind);
  uint64_t v26 = v32;
  *(void *)&v16[v14[10]] = v32;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = v33;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327738);
  uint64_t v28 = swift_allocObject();
  *(unsigned char *)(v28 + 16) = 0;
  *(void *)(v28 + 24) = sub_25A15384C;
  *(void *)(v28 + 32) = v27;
  id v29 = v26;
  swift_release();
  *(void *)&v16[v25] = v28;
  sub_25A14FF30((uint64_t)v16, v34, type metadata accessor for PreferencesControllerRecipe);

  return sub_25A152938(a4, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
}

uint64_t PreferencesControllerRecipe.init(viewControllerClass:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25A150C10(a1, a2);
}

uint64_t sub_25A150C10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (uint64_t *)((char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  void *v6 = a1;
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = (int *)type metadata accessor for PreferencesControllerRecipe(0);
  uint64_t v8 = v7[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327560);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(void *)(a2 + v8) = v9;
  uint64_t v10 = v7[6];
  *(void *)(a2 + v7[7]) = 0;
  uint64_t result = sub_25A14FF30((uint64_t)v6, a2, type metadata accessor for PreferencesControllerRecipe.Kind);
  *(void *)(a2 + v7[8]) = 0;
  *(void *)(a2 + v10) = 0;
  return result;
}

uint64_t PreferencesControllerRecipe.init(viewControllerClass:specifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_25A150D28(a1, a2, a3);
}

uint64_t sub_25A150D28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (uint64_t *)((char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v8 = a1;
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = (int *)type metadata accessor for PreferencesControllerRecipe(0);
  uint64_t v10 = v9[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327560);
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(void *)(a3 + v10) = v11;
  uint64_t v12 = v9[6];
  *(void *)(a3 + v9[7]) = 0;
  uint64_t result = sub_25A14FF30((uint64_t)v8, a3, type metadata accessor for PreferencesControllerRecipe.Kind);
  *(void *)(a3 + v9[8]) = a2;
  *(void *)(a3 + v12) = 0;
  return result;
}

uint64_t PreferencesControllerRecipe.init(viewControllerClass:pendingURLPayload:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (uint64_t *)((char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v8 = a1;
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = (int *)type metadata accessor for PreferencesControllerRecipe(0);
  uint64_t v10 = v9[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327560);
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(void *)(a3 + v10) = v11;
  uint64_t v12 = v9[6];
  *(void *)(a3 + v12) = 0;
  *(void *)(a3 + v9[7]) = 0;
  sub_25A14FF30((uint64_t)v8, a3, type metadata accessor for PreferencesControllerRecipe.Kind);
  *(void *)(a3 + v9[8]) = 0;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327738);
  uint64_t v14 = swift_allocObject();
  *(unsigned char *)(v14 + 16) = 0;
  *(void *)(v14 + 24) = sub_25A15384C;
  *(void *)(v14 + 32) = v13;
  uint64_t result = swift_release();
  *(void *)(a3 + v12) = v14;
  return result;
}

void PreferencesControllerRecipe.init(viewControllerClass:specifier:pendingURLPayload:)(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for PreferencesControllerRecipe(0);
  uint64_t v9 = (int *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (uint64_t *)((char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v14 = a1;
  swift_storeEnumTagMultiPayload();
  uint64_t v15 = v9[7];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327560);
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(void *)&v11[v15] = v16;
  uint64_t v17 = v9[8];
  *(void *)&v11[v17] = 0;
  *(void *)&v11[v9[9]] = 0;
  sub_25A14FF30((uint64_t)v14, (uint64_t)v11, type metadata accessor for PreferencesControllerRecipe.Kind);
  *(void *)&v11[v9[10]] = a2;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327738);
  uint64_t v19 = swift_allocObject();
  *(unsigned char *)(v19 + 16) = 0;
  *(void *)(v19 + 24) = sub_25A15384C;
  *(void *)(v19 + 32) = v18;
  id v20 = a2;
  swift_release();
  *(void *)&v11[v17] = v19;
  sub_25A14FF30((uint64_t)v11, a4, type metadata accessor for PreferencesControllerRecipe);
}

uint64_t PreferencesControllerRecipe.controllerRecipeWithPendingURLPayload(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_25A1513AC(v2, a2, type metadata accessor for PreferencesControllerRecipe);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327738);
  uint64_t v6 = swift_allocObject();
  *(unsigned char *)(v6 + 16) = 0;
  *(void *)(v6 + 24) = sub_25A151414;
  *(void *)(v6 + 32) = v5;
  uint64_t v7 = *(int *)(type metadata accessor for PreferencesControllerRecipe(0) + 24);
  swift_bridgeObjectRetain();
  uint64_t result = swift_release();
  *(void *)(a2 + v7) = v6;
  return result;
}

uint64_t PreferencesControllerRecipe.controllerRecipeWithPendingURLPayload(_:pendingURLCompletion:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  sub_25A1513AC(v5, a4, type metadata accessor for PreferencesControllerRecipe);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327738);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = 0;
  *(void *)(v11 + 24) = sub_25A15384C;
  *(void *)(v11 + 32) = v10;
  uint64_t v12 = type metadata accessor for PreferencesControllerRecipe(0);
  uint64_t v13 = *(int *)(v12 + 24);
  swift_bridgeObjectRetain();
  uint64_t result = swift_release();
  *(void *)(a4 + v13) = v11;
  if (a2)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = a2;
    *(void *)(v15 + 24) = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A408EA8);
    uint64_t v16 = swift_allocObject();
    *(unsigned char *)(v16 + 16) = 0;
    *(void *)(v16 + 24) = sub_25A1514D8;
    *(void *)(v16 + 32) = v15;
    uint64_t v17 = *(int *)(v12 + 28);
    swift_retain();
    uint64_t result = swift_release();
    *(void *)(a4 + v17) = v16;
  }
  return result;
}

uint64_t sub_25A1513AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A151414@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_25A151420@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t (**a3)()@<X8>)
{
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = a2;
    *a3 = sub_25A153824;
    a3[1] = (uint64_t (*)())v6;
    return swift_retain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25A151498()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25A1514D8@<X0>(uint64_t (**a1)()@<X8>)
{
  return sub_25A151420(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t PreferencesControllerRecipe.description.getter()
{
  return 0xD00000000000001DLL;
}

unint64_t sub_25A15153C()
{
  return 0xD00000000000001DLL;
}

void sub_25A151598()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for NSBundle.PreferencesPluginLocation();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (void **)((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25A1513AC(v1, (uint64_t)v7, type metadata accessor for PreferencesControllerRecipe.Kind);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327600);
      uint64_t v10 = (uint64_t)v7 + *(int *)(v9 + 48);
      uint64_t v11 = *(uint64_t *)((char *)v7 + *(int *)(v9 + 64) + 8);
      sub_25A14FF30(v10, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
      sub_25A1607F0();
      swift_bridgeObjectRelease();
      sub_25A160200();
      sub_25A153744(&qword_26A408EB8, MEMORY[0x263F06EA8]);
      sub_25A1607C0();
      if (v11)
      {
        sub_25A1607F0();
        sub_25A152938((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_25A152938((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
      }
      break;
    case 2u:
      ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
      uint64_t v13 = NSStringFromClass(ObjCClassFromMetadata);
      sub_25A1607E0();

      sub_25A1607F0();
      swift_bridgeObjectRelease();
      break;
    default:
      uint64_t v8 = *v7;
      sub_25A160940();

      break;
  }
}

uint64_t sub_25A15181C()
{
  return sub_25A160B30();
}

uint64_t sub_25A151860()
{
  return sub_25A160B30();
}

id static PreferencesControllerRecipe.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((sub_25A151B88(a1, a2) & 1) == 0) {
    return 0;
  }
  uint64_t v4 = *(int *)(type metadata accessor for PreferencesControllerRecipe(0) + 32);
  id result = *(id *)(a1 + v4);
  if (!result) {
    return result;
  }
  if (*(void *)(a2 + v4)) {
    return objc_msgSend(result, sel_isEqualToSpecifier_);
  }
  else {
    return 0;
  }
}

void PreferencesControllerRecipe.hash(into:)()
{
  sub_25A151598();
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for PreferencesControllerRecipe(0) + 32));
  if (v1)
  {
    id v2 = v1;
    sub_25A160940();
  }
}

uint64_t PreferencesControllerRecipe.hashValue.getter()
{
  sub_25A160B10();
  sub_25A151598();
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for PreferencesControllerRecipe(0) + 32));
  if (v1)
  {
    id v2 = v1;
    sub_25A160940();
  }
  return sub_25A160B30();
}

uint64_t sub_25A1519E0(uint64_t a1)
{
  sub_25A160B10();
  sub_25A151598();
  uint64_t v3 = *(void **)(v1 + *(int *)(a1 + 32));
  if (v3)
  {
    id v4 = v3;
    sub_25A160940();
  }
  return sub_25A160B30();
}

void sub_25A151A44(uint64_t a1, uint64_t a2)
{
  sub_25A151598();
  id v4 = *(void **)(v2 + *(int *)(a2 + 32));
  if (v4)
  {
    id v5 = v4;
    sub_25A160940();
  }
}

uint64_t sub_25A151AC8(uint64_t a1, uint64_t a2)
{
  sub_25A160B10();
  sub_25A151598();
  id v4 = *(void **)(v2 + *(int *)(a2 + 32));
  if (v4)
  {
    id v5 = v4;
    sub_25A160940();
  }
  return sub_25A160B30();
}

id sub_25A151B28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((sub_25A151B88(a1, a2) & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(int *)(a3 + 32);
  id result = *(id *)(a1 + v6);
  if (!result) {
    return result;
  }
  if (*(void *)(a2 + v6)) {
    return objc_msgSend(result, sel_isEqualToSpecifier_);
  }
  else {
    return 0;
  }
}

uint64_t sub_25A151B88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NSBundle.PreferencesPluginLocation();
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v57 = (uint64_t)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v58 = (uint64_t)&v53 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v59 = (uint64_t)&v53 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v60 = (uint64_t)&v53 - v11;
  uint64_t v12 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (void **)((char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (uint64_t *)((char *)&v53 - v17);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (void **)((char *)&v53 - v20);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (void **)((char *)&v53 - v22);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327250);
  uint64_t v25 = MEMORY[0x270FA5388](v24 - 8);
  uint64_t v27 = (char *)&v53 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = &v27[*(int *)(v25 + 56)];
  sub_25A1513AC(a1, (uint64_t)v27, type metadata accessor for PreferencesControllerRecipe.Kind);
  sub_25A1513AC(a2, (uint64_t)v28, type metadata accessor for PreferencesControllerRecipe.Kind);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_25A1513AC((uint64_t)v27, (uint64_t)v21, type metadata accessor for PreferencesControllerRecipe.Kind);
      uint64_t v33 = *v21;
      uint64_t v32 = v21[1];
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327600);
      uint64_t v35 = *(int *)(v34 + 48);
      uint64_t v36 = (uint64_t)v21 + v35;
      uint64_t v37 = *(int *)(v34 + 64);
      uint64_t v38 = (char *)v21 + v37;
      uint64_t v39 = *(uint64_t *)((char *)v21 + v37);
      uint64_t v40 = *((void *)v38 + 1);
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_25A152938(v36, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
        goto LABEL_17;
      }
      uint64_t v55 = v39;
      uint64_t v42 = *(void **)v28;
      uint64_t v41 = (void *)*((void *)v28 + 1);
      uint64_t v43 = *(void *)&v28[v37 + 8];
      uint64_t v54 = *(void *)&v28[v37];
      uint64_t v56 = v43;
      uint64_t v44 = v60;
      sub_25A14FF30(v36, v60, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
      uint64_t v45 = (uint64_t)&v28[v35];
      uint64_t v46 = v59;
      sub_25A14FF30(v45, v59, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
      if (v33 == v42 && v32 == v41)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v49 = v58;
        sub_25A1513AC(v44, v58, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
        uint64_t v50 = v57;
        sub_25A1513AC(v46, v57, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
      }
      else
      {
        char v48 = sub_25A160A90();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v49 = v58;
        sub_25A1513AC(v44, v58, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
        uint64_t v50 = v57;
        sub_25A1513AC(v46, v57, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
        if ((v48 & 1) == 0) {
          goto LABEL_25;
        }
      }
      if ((MEMORY[0x25A2F6660](v49, v50) & 1) == 0)
      {
LABEL_25:
        sub_25A152938(v50, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
        sub_25A152938(v49, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_25A152938(v46, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
        sub_25A152938(v44, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
LABEL_26:
        unsigned __int8 v31 = 0;
        goto LABEL_27;
      }
      sub_25A152938(v50, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
      sub_25A152938(v49, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
      if (v40)
      {
        if (!v56)
        {
          swift_bridgeObjectRetain();
          sub_25A152938(v46, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
          sub_25A152938(v44, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
          swift_bridgeObjectRelease_n();
          goto LABEL_26;
        }
        if (v55 == v54 && v40 == v56) {
          unsigned __int8 v31 = 1;
        }
        else {
          unsigned __int8 v31 = sub_25A160A90();
        }
        swift_bridgeObjectRelease();
        sub_25A152938(v46, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
        sub_25A152938(v44, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_25A152938(v46, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
        sub_25A152938(v44, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
        if (v56)
        {
          swift_bridgeObjectRelease();
          goto LABEL_26;
        }
        unsigned __int8 v31 = 1;
      }
LABEL_27:
      sub_25A152938((uint64_t)v27, type metadata accessor for PreferencesControllerRecipe.Kind);
      return v31 & 1;
    case 2u:
      sub_25A1513AC((uint64_t)v27, (uint64_t)v18, type metadata accessor for PreferencesControllerRecipe.Kind);
      if (swift_getEnumCaseMultiPayload() != 2) {
        goto LABEL_17;
      }
      unsigned __int8 v31 = *v18 == *(void *)v28;
      goto LABEL_27;
    case 3u:
      sub_25A1513AC((uint64_t)v27, (uint64_t)v15, type metadata accessor for PreferencesControllerRecipe.Kind);
      id v29 = *v15;
      if (swift_getEnumCaseMultiPayload() != 3) {
        goto LABEL_15;
      }
      v51 = *(void **)v28;

      unsigned __int8 v31 = v29 == v51;
      goto LABEL_27;
    default:
      sub_25A1513AC((uint64_t)v27, (uint64_t)v23, type metadata accessor for PreferencesControllerRecipe.Kind);
      id v29 = *v23;
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v30 = *(void **)v28;
        unsigned __int8 v31 = objc_msgSend(v29, sel_isEqualToSpecifier_, *(void *)v28);

        goto LABEL_27;
      }
LABEL_15:

LABEL_17:
      sub_25A15378C((uint64_t)v27);
      unsigned __int8 v31 = 0;
      return v31 & 1;
  }
}

uint64_t sub_25A15225C()
{
  return sub_25A153744(&qword_26B3272C0, (void (*)(uint64_t))type metadata accessor for PreferencesControllerRecipe);
}

void *initializeBufferWithCopyOfBuffer for PreferencesControllerRecipe(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) == 0)
  {
    uint64_t v7 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload != 3)
    {
      if (EnumCaseMultiPayload == 1)
      {
        uint64_t v12 = a2[1];
        *a1 = *a2;
        a1[1] = v12;
        swift_bridgeObjectRetain();
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327600);
        uint64_t v14 = *(int *)(v13 + 48);
        uint64_t v15 = (char *)a1 + v14;
        uint64_t v16 = (char *)a2 + v14;
        uint64_t v17 = sub_25A160200();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
        uint64_t v18 = *(int *)(v13 + 64);
        uint64_t v19 = (void *)((char *)a1 + v18);
        uint64_t v20 = (void *)((char *)a2 + v18);
        uint64_t v21 = v20[1];
        *uint64_t v19 = *v20;
        v19[1] = v21;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        goto LABEL_10;
      }
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
        goto LABEL_10;
      }
    }
    uint64_t v9 = (void *)*a2;
    *a1 = *a2;
    id v10 = v9;
    swift_storeEnumTagMultiPayload();
LABEL_10:
    uint64_t v22 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    *(void *)((char *)a1 + v22) = *(void *)((char *)a2 + v22);
    uint64_t v23 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    uint64_t v24 = *(void **)((char *)a2 + v23);
    *(void *)((char *)a1 + v23) = v24;
    swift_retain();
    swift_retain();
    swift_retain();
    id v25 = v24;
    return a1;
  }
  uint64_t v11 = *a2;
  *a1 = *a2;
  a1 = (void *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
  swift_retain();
  return a1;
}

void destroy for PreferencesControllerRecipe(id *a1, uint64_t a2)
{
  type metadata accessor for PreferencesControllerRecipe.Kind(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
LABEL_4:

    goto LABEL_6;
  }
  if (EnumCaseMultiPayload != 1)
  {
    if (EnumCaseMultiPayload) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  swift_bridgeObjectRelease();
  int v5 = (char *)a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B327600) + 48);
  uint64_t v6 = sub_25A160200();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
LABEL_6:
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = *(id *)((char *)a1 + *(int *)(a2 + 32));
}

void *initializeWithCopy for PreferencesControllerRecipe(void *a1, void *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload != 3)
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      swift_bridgeObjectRetain();
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327600);
      uint64_t v12 = *(int *)(v11 + 48);
      uint64_t v13 = (char *)a1 + v12;
      uint64_t v14 = (char *)a2 + v12;
      uint64_t v15 = sub_25A160200();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
      uint64_t v16 = *(int *)(v11 + 64);
      uint64_t v17 = (void *)((char *)a1 + v16);
      uint64_t v18 = (void *)((char *)a2 + v16);
      uint64_t v19 = v18[1];
      *uint64_t v17 = *v18;
      v17[1] = v19;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
      goto LABEL_8;
    }
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
      goto LABEL_8;
    }
  }
  uint64_t v8 = (void *)*a2;
  *a1 = *a2;
  id v9 = v8;
  swift_storeEnumTagMultiPayload();
LABEL_8:
  uint64_t v20 = a3[6];
  *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
  *(void *)((char *)a1 + v20) = *(void *)((char *)a2 + v20);
  uint64_t v21 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  uint64_t v22 = *(void **)((char *)a2 + v21);
  *(void *)((char *)a1 + v21) = v22;
  swift_retain();
  swift_retain();
  swift_retain();
  id v23 = v22;
  return a1;
}

void *assignWithCopy for PreferencesControllerRecipe(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_25A152938((uint64_t)a1, type metadata accessor for PreferencesControllerRecipe.Kind);
    uint64_t v6 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload != 3)
    {
      if (EnumCaseMultiPayload == 1)
      {
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327600);
        uint64_t v11 = *(int *)(v10 + 48);
        uint64_t v12 = (char *)a1 + v11;
        uint64_t v13 = (char *)a2 + v11;
        uint64_t v14 = sub_25A160200();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
        uint64_t v15 = *(int *)(v10 + 64);
        uint64_t v16 = (void *)((char *)a1 + v15);
        uint64_t v17 = (void *)((char *)a2 + v15);
        *uint64_t v16 = *v17;
        v16[1] = v17[1];
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        goto LABEL_9;
      }
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
        goto LABEL_9;
      }
    }
    uint64_t v8 = (void *)*a2;
    *a1 = *a2;
    id v9 = v8;
    swift_storeEnumTagMultiPayload();
  }
LABEL_9:
  *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_retain();
  swift_release();
  uint64_t v18 = a3[8];
  uint64_t v19 = *(void **)((char *)a1 + v18);
  uint64_t v20 = *(void **)((char *)a2 + v18);
  *(void *)((char *)a1 + v18) = v20;
  id v21 = v20;

  return a1;
}

uint64_t sub_25A152938(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *initializeWithTake for PreferencesControllerRecipe(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *a1 = *a2;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327600);
    uint64_t v8 = *(int *)(v7 + 48);
    id v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25A160200();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    *(_OWORD *)((char *)a1 + *(int *)(v7 + 64)) = *(_OWORD *)((char *)a2 + *(int *)(v7 + 64));
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v12 = a3[6];
  *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  uint64_t v13 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  return a1;
}

_OWORD *assignWithTake for PreferencesControllerRecipe(_OWORD *a1, _OWORD *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_25A152938((uint64_t)a1, type metadata accessor for PreferencesControllerRecipe.Kind);
    uint64_t v6 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327600);
      uint64_t v8 = *(int *)(v7 + 48);
      id v9 = (char *)a1 + v8;
      uint64_t v10 = (char *)a2 + v8;
      uint64_t v11 = sub_25A160200();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
      *(_OWORD *)((char *)a1 + *(int *)(v7 + 64)) = *(_OWORD *)((char *)a2 + *(int *)(v7 + 64));
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
  swift_release();
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_release();
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_release();
  uint64_t v12 = a3[8];
  uint64_t v13 = *(void **)((char *)a1 + v12);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);

  return a1;
}

uint64_t getEnumTagSinglePayload for PreferencesControllerRecipe(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A152C50);
}

uint64_t sub_25A152C50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for PreferencesControllerRecipe(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A152D24);
}

uint64_t sub_25A152D24(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_25A152DE0()
{
  uint64_t result = type metadata accessor for PreferencesControllerRecipe.Kind(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_25A152E88(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    unint64_t v10 = *a2;
    *(void *)a1 = *a2;
    a1 = &v10[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload != 3)
    {
      if (EnumCaseMultiPayload == 1)
      {
        uint64_t v11 = a2[1];
        *(void *)a1 = *a2;
        *((void *)a1 + 1) = v11;
        swift_bridgeObjectRetain();
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327600);
        uint64_t v13 = *(int *)(v12 + 48);
        uint64_t v14 = &a1[v13];
        uint64_t v15 = (char *)a2 + v13;
        uint64_t v16 = sub_25A160200();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
        uint64_t v17 = *(int *)(v12 + 64);
        uint64_t v18 = &a1[v17];
        uint64_t v19 = (char **)((char *)a2 + v17);
        uint64_t v20 = v19[1];
        *(void *)uint64_t v18 = *v19;
        *((void *)v18 + 1) = v20;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(v6 + 64));
        return a1;
      }
    }
    uint64_t v8 = *a2;
    *(void *)a1 = *a2;
    uint64_t v9 = v8;
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_25A153018(void **a1)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
LABEL_4:
    uint64_t v3 = *a1;

    return;
  }
  if (EnumCaseMultiPayload != 1)
  {
    if (EnumCaseMultiPayload) {
      return;
    }
    goto LABEL_4;
  }
  swift_bridgeObjectRelease();
  uint64_t v4 = (char *)a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B327600) + 48);
  uint64_t v5 = sub_25A160200();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  swift_bridgeObjectRelease();
}

void *sub_25A153100(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload != 3)
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v9 = a2[1];
      *a1 = *a2;
      a1[1] = v9;
      swift_bridgeObjectRetain();
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327600);
      uint64_t v11 = *(int *)(v10 + 48);
      uint64_t v12 = (char *)a1 + v11;
      uint64_t v13 = (char *)a2 + v11;
      uint64_t v14 = sub_25A160200();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
      uint64_t v15 = *(int *)(v10 + 64);
      uint64_t v16 = (void *)((char *)a1 + v15);
      uint64_t v17 = (void *)((char *)a2 + v15);
      uint64_t v18 = v17[1];
      *uint64_t v16 = *v17;
      v16[1] = v18;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      return a1;
    }
  }
  uint64_t v7 = (void *)*a2;
  *a1 = *a2;
  id v8 = v7;
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_25A15324C(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25A152938((uint64_t)a1, type metadata accessor for PreferencesControllerRecipe.Kind);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload != 3)
    {
      if (EnumCaseMultiPayload == 1)
      {
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327600);
        uint64_t v10 = *(int *)(v9 + 48);
        uint64_t v11 = (char *)a1 + v10;
        uint64_t v12 = (char *)a2 + v10;
        uint64_t v13 = sub_25A160200();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
        uint64_t v14 = *(int *)(v9 + 64);
        uint64_t v15 = (void *)((char *)a1 + v14);
        uint64_t v16 = (void *)((char *)a2 + v14);
        *uint64_t v15 = *v16;
        v15[1] = v16[1];
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        return a1;
      }
    }
    uint64_t v7 = (void *)*a2;
    *a1 = *a2;
    id v8 = v7;
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_25A1533CC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *a1 = *a2;
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327600);
    uint64_t v7 = *(int *)(v6 + 48);
    id v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_25A160200();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    *(_OWORD *)((char *)a1 + *(int *)(v6 + 64)) = *(_OWORD *)((char *)a2 + *(int *)(v6 + 64));
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

_OWORD *sub_25A1534BC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25A152938((uint64_t)a1, type metadata accessor for PreferencesControllerRecipe.Kind);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327600);
      uint64_t v7 = *(int *)(v6 + 48);
      id v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_25A160200();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      *(_OWORD *)((char *)a1 + *(int *)(v6 + 64)) = *(_OWORD *)((char *)a2 + *(int *)(v6 + 64));
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_25A1535D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_25A1535F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25A153624()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_25A153634()
{
  v2[4] = MEMORY[0x263F8CF48] + 64;
  uint64_t result = sub_25A160200();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    v2[5] = v2;
    v2[6] = &unk_25A161F00;
    v2[7] = &unk_25A161F18;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_25A1536FC()
{
  return sub_25A153744(&qword_26A408EB0, (void (*)(uint64_t))type metadata accessor for PreferencesControllerRecipe.Kind);
}

uint64_t sub_25A153744(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25A15378C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B327250);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25A1537EC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25A153824()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25A153870(uint64_t a1)
{
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25A160310();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B3292B8);
  swift_retain();
  uint64_t v3 = sub_25A1602F0();
  os_log_type_t v4 = sub_25A1608E0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v10 = v6;
    *(_DWORD *)uint64_t v5 = 136315394;
    sub_25A14A43C(0xD000000000000022, 0x800000025A161FD0, &v10);
    sub_25A160960();
    swift_release();
    *(_WORD *)(v5 + 12) = 2080;
    sub_25A14A43C(0xD000000000000011, 0x800000025A162C20, &v10);
    sub_25A160960();
    _os_log_impl(&dword_25A143000, v3, v4, "Start (%s.%s)…", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v6, -1, -1);
    MEMORY[0x25A2F7630](v5, -1, -1);
  }
  else
  {

    swift_release();
  }
  type metadata accessor for PreferencesControllerRepresentable.Coordinator();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  uint64_t v8 = swift_retain();
  sub_25A153FFC(v8, 0xD000000000000011, 0x800000025A162C20);
  return v7;
}

NSObject *sub_25A153A8C(uint64_t a1, uint64_t a2)
{
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25A160310();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B3292B8);
  swift_retain();
  os_log_type_t v4 = sub_25A1602F0();
  os_log_type_t v5 = sub_25A1608E0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v10 = v7;
    *(_DWORD *)uint64_t v6 = 136315394;
    sub_25A14A43C(0xD000000000000022, 0x800000025A161FD0, &v10);
    sub_25A160960();
    swift_release();
    *(_WORD *)(v6 + 12) = 2080;
    sub_25A14A43C(0xD00000000000001ELL, 0x800000025A163120, &v10);
    sub_25A160960();
    _os_log_impl(&dword_25A143000, v4, v5, "Start (%s.%s)…", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v7, -1, -1);
    MEMORY[0x25A2F7630](v6, -1, -1);
  }
  else
  {

    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275D8);
  sub_25A1605B0();
  swift_retain();
  swift_release();
  uint64_t v8 = PreferencesControllerRepresentableModel.makeViewControllerIfNeeded()();
  swift_release();
  sub_25A153FFC(a2, 0xD00000000000001ELL, 0x800000025A163120);
  return v8;
}

void sub_25A153CDC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_25A160490();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25A160310();
  __swift_project_value_buffer(v9, (uint64_t)qword_26B3292B8);
  swift_retain();
  uint64_t v10 = sub_25A1602F0();
  os_log_type_t v11 = sub_25A1608E0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v17 = v5;
    uint64_t v14 = v13;
    uint64_t v19 = v13;
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v16 = a1;
    uint64_t v18 = sub_25A14A43C(0xD000000000000022, 0x800000025A161FD0, &v19);
    sub_25A160960();
    swift_release();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v18 = sub_25A14A43C(0xD000000000000022, 0x800000025A1630F0, &v19);
    a1 = v16;
    sub_25A160960();
    _os_log_impl(&dword_25A143000, v10, v11, "Start (%s.%s)…", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    uint64_t v15 = v14;
    uint64_t v5 = v17;
    MEMORY[0x25A2F7630](v15, -1, -1);
    MEMORY[0x25A2F7630](v12, -1, -1);
  }
  else
  {

    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3275D8);
  sub_25A1605B0();
  swift_retain();
  swift_release();
  sub_25A1605C0();
  sub_25A1605D0();
  sub_25A1595C0(a1);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_25A153FFC(a3, 0xD000000000000022, 0x800000025A1630F0);
}

void sub_25A153FFC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25A160310();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B3292B8);
  swift_retain();
  uint64_t v6 = sub_25A1602F0();
  os_log_type_t v7 = sub_25A1608E0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = v9;
    *(_DWORD *)uint64_t v8 = 136315394;
    sub_25A14A43C(0xD000000000000022, 0x800000025A161FD0, &v10);
    sub_25A160960();
    swift_release();
    *(_WORD *)(v8 + 12) = 2080;
    sub_25A14A43C(a2, a3, &v10);
    sub_25A160960();
    _os_log_impl(&dword_25A143000, v6, v7, "…Complete (%s.%s)", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v9, -1, -1);
    MEMORY[0x25A2F7630](v8, -1, -1);
  }
  else
  {

    swift_release();
  }
}

NSObject *sub_25A154204(uint64_t a1)
{
  return sub_25A153A8C(a1, *v1);
}

void sub_25A15420C(void *a1, uint64_t a2)
{
  sub_25A153CDC(a1, a2, *v2);
}

void sub_25A154214(void *a1)
{
}

uint64_t sub_25A15421C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A153870(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_25A154248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_25A1543C4();

  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_25A1542AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_25A1543C4();

  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_25A154310()
{
}

uint64_t type metadata accessor for PreferencesControllerRepresentable.Coordinator()
{
  return self;
}

ValueMetadata *type metadata accessor for PreferencesControllerRepresentable()
{
  return &type metadata for PreferencesControllerRepresentable;
}

unint64_t sub_25A154370()
{
  unint64_t result = qword_26B3272D0;
  if (!qword_26B3272D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3272D0);
  }
  return result;
}

unint64_t sub_25A1543C4()
{
  unint64_t result = qword_26B3272C8;
  if (!qword_26B3272C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3272C8);
  }
  return result;
}

void sub_25A154418()
{
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25A160310();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B3292B8);
  oslog = sub_25A1602F0();
  os_log_type_t v1 = sub_25A1608E0();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = swift_slowAlloc();
    uint64_t v3 = swift_slowAlloc();
    uint64_t v5 = v3;
    *(_DWORD *)uint64_t v2 = 136315394;
    sub_25A14A43C(0xD000000000000027, 0x800000025A163090, &v5);
    sub_25A160960();
    *(_WORD *)(v2 + 12) = 2080;
    sub_25A14A43C(0xD000000000000029, 0x800000025A1630C0, &v5);
    sub_25A160960();
    _os_log_impl(&dword_25A143000, oslog, v1, "…Complete (%s.%s)", (uint8_t *)v2, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v3, -1, -1);
    MEMORY[0x25A2F7630](v2, -1, -1);
  }
  else
  {
  }
}

void sub_25A154600(void *a1)
{
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25A160310();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B3292B8);
  uint64_t v3 = sub_25A1602F0();
  os_log_type_t v4 = sub_25A1608E0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v13 = v6;
    *(_DWORD *)uint64_t v5 = 136315394;
    sub_25A14A43C(0xD000000000000027, 0x800000025A163090, (uint64_t *)&v13);
    sub_25A160960();
    *(_WORD *)(v5 + 12) = 2080;
    sub_25A14A43C(0xD000000000000029, 0x800000025A1630C0, (uint64_t *)&v13);
    sub_25A160960();
    _os_log_impl(&dword_25A143000, v3, v4, "Start (%s.%s)…", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v6, -1, -1);
    MEMORY[0x25A2F7630](v5, -1, -1);
  }

  os_log_type_t v7 = a1;
  uint64_t v8 = sub_25A1602F0();
  os_log_type_t v9 = sub_25A1608E0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    uint64_t v13 = v7;
    uint64_t v12 = v7;
    sub_25A160960();
    *os_log_type_t v11 = v7;

    _os_log_impl(&dword_25A143000, v8, v9, "Dismantle for %@.", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B327680);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v11, -1, -1);
    MEMORY[0x25A2F7630](v10, -1, -1);
  }
  else
  {

    uint64_t v8 = v7;
  }

  sub_25A155044();
  sub_25A154418();
}

id sub_25A1548E8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_parentViewController);
  *a2 = result;
  return result;
}

NSObject *PreferencesControllerRepresentableModel.makeViewControllerIfNeeded()()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327668);
  uint64_t v36 = *(void *)(v2 - 8);
  uint64_t v37 = (void *)v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v35 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25A160310();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B3292B8);
  swift_retain_n();
  uint64_t v5 = sub_25A1602F0();
  os_log_type_t v6 = sub_25A1608E0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    v39[0] = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v9 = sub_25A160B40();
    uint64_t v38 = sub_25A14A43C(v9, v10, v39);
    sub_25A160960();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    uint64_t v38 = sub_25A14A43C(0xD00000000000001CLL, 0x800000025A162B70, v39);
    sub_25A160960();
    _os_log_impl(&dword_25A143000, v5, v6, "Start (%s.%s)…", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v8, -1, -1);
    MEMORY[0x25A2F7630](v7, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v11 = OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_preferencesController;
  uint64_t v12 = *(void **)(v0
                 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_preferencesController);
  if (!v12)
  {
    id v19 = sub_25A155C10();
    swift_getKeyPath();
    v39[0] = v0;
    sub_25A159448(&qword_26B327310);
    sub_25A160250();
    swift_release();
    uint64_t v20 = v0 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel__recipe;
    swift_beginAccess();
    uint64_t v21 = type metadata accessor for PreferencesControllerRecipe(0);
    swift_unknownObjectWeakAssign();
    self;
    uint64_t v22 = (void *)swift_dynamicCastObjCClass();
    if (v22) {
      objc_msgSend(v22, sel_setUrlHandlingDeferredForViewControllerContainment_, 1);
    }
    swift_getKeyPath();
    uint64_t v38 = v0;
    sub_25A160250();
    swift_release();
    if (*(void *)(v20 + *(int *)(v21 + 32))) {
      objc_msgSend(v19, sel_setSpecifier_);
    }
    swift_getKeyPath();
    id v23 = v19;
    uint64_t v24 = v35;
    sub_25A160160();

    swift_release();
    *(void *)(swift_allocObject() + 16) = v23;
    sub_25A147C0C();
    id v25 = v23;
    uint64_t v26 = v37;
    uint64_t v27 = sub_25A1603B0();
    swift_release();
    (*(void (**)(char *, void *))(v36 + 8))(v24, v26);
    *(void *)(v1 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_cancellable) = v27;
    swift_release();
    uint64_t v28 = *(void **)(v1 + v11);
    *(void *)(v1 + v11) = v19;
    id v29 = v25;

    uint64_t v13 = v29;
    uint64_t v14 = sub_25A1602F0();
    os_log_type_t v30 = sub_25A1608E0();
    if (os_log_type_enabled(v14, v30))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v37 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 141558275;
      uint64_t v38 = 1752392040;
      sub_25A160960();
      *(_WORD *)(v16 + 12) = 2113;
      uint64_t v38 = (uint64_t)v13;
      unsigned __int8 v31 = v13;
      sub_25A160960();
      uint64_t v32 = v37;
      *uint64_t v37 = v19;

      _os_log_impl(&dword_25A143000, v14, v30, "Returning lazily created preferences controller: %{private,mask.hash}@.", (uint8_t *)v16, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B327680);
      swift_arrayDestroy();
      uint64_t v18 = v32;
      goto LABEL_15;
    }
LABEL_16:

    uint64_t v14 = v13;
    goto LABEL_17;
  }
  uint64_t v13 = v12;
  uint64_t v14 = sub_25A1602F0();
  os_log_type_t v15 = sub_25A1608E0();
  if (!os_log_type_enabled(v14, v15)) {
    goto LABEL_16;
  }
  uint64_t v16 = swift_slowAlloc();
  uint64_t v17 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v16 = 141558275;
  v39[0] = 1752392040;
  sub_25A160960();
  *(_WORD *)(v16 + 12) = 2113;
  v39[0] = (uint64_t)v13;
  uint64_t v13 = v13;
  sub_25A160960();
  *uint64_t v17 = v12;

  _os_log_impl(&dword_25A143000, v14, v15, "Returning existing preferences controller: %{private,mask.hash}@.", (uint8_t *)v16, 0x16u);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B327680);
  swift_arrayDestroy();
  uint64_t v18 = v17;
LABEL_15:
  MEMORY[0x25A2F7630](v18, -1, -1);
  MEMORY[0x25A2F7630](v16, -1, -1);
LABEL_17:

  sub_25A157F1C(v1, 0xD00000000000001CLL, 0x800000025A162B70);
  return v13;
}

uint64_t sub_25A155044()
{
  swift_getKeyPath();
  sub_25A159448(&qword_26B327310);
  sub_25A160250();
  swift_release();
  swift_beginAccess();
  type metadata accessor for PreferencesControllerRecipe(0);
  swift_unknownObjectWeakAssign();
  uint64_t v1 = *(void **)(v0
                + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_preferencesController);
  *(void *)(v0 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_preferencesController) = 0;

  uint64_t v2 = OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_cancellable;
  if (*(void *)(v0 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_cancellable))
  {
    swift_retain();
    sub_25A1603A0();
    swift_release();
  }
  *(void *)(v0 + v2) = 0;
  return swift_release();
}

uint64_t PreferencesControllerRepresentableModel.recipe.getter@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  sub_25A159448(&qword_26B327310);
  sub_25A160250();
  swift_release();
  uint64_t v3 = v1 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel__recipe;
  swift_beginAccess();
  return sub_25A159CF4(v3, a1, type metadata accessor for PreferencesControllerRecipe);
}

uint64_t sub_25A155220@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_25A159448(&qword_26B327310);
  sub_25A160250();
  swift_release();
  uint64_t v4 = v3 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel__recipe;
  swift_beginAccess();
  return sub_25A159CF4(v4, a2, type metadata accessor for PreferencesControllerRecipe);
}

uint64_t sub_25A1552EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for PreferencesControllerRecipe(0);
  MEMORY[0x270FA5388](v4 - 8);
  os_log_type_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25A159CF4(a1, (uint64_t)v6, type metadata accessor for PreferencesControllerRecipe);
  uint64_t v7 = *a2;
  swift_getKeyPath();
  uint64_t v10 = v7;
  uint64_t v11 = v6;
  uint64_t v12 = v7;
  sub_25A159448(&qword_26B327310);
  sub_25A160240();
  swift_release();
  return sub_25A159D5C((uint64_t)v6, type metadata accessor for PreferencesControllerRecipe);
}

uint64_t sub_25A155428(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel__recipe;
  swift_beginAccess();
  sub_25A159C2C(a2, v3);
  return swift_endAccess();
}

uint64_t PreferencesControllerRepresentableModel.__allocating_init(recipe:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  PreferencesControllerRepresentableModel.init(recipe:)(a1);
  return v2;
}

uint64_t PreferencesControllerRepresentableModel.init(recipe:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for PreferencesControllerRecipe(0);
  MEMORY[0x270FA5388](v4 - 8);
  os_log_type_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v1 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_preferencesController) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_cancellable) = 0;
  sub_25A160260();
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_25A160310();
  __swift_project_value_buffer(v7, (uint64_t)qword_26B3292B8);
  sub_25A159CF4(a1, (uint64_t)v6, type metadata accessor for PreferencesControllerRecipe);
  swift_retain_n();
  uint64_t v8 = sub_25A1602F0();
  os_log_type_t v9 = sub_25A1608B0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v18 = v15;
    *(_DWORD *)uint64_t v10 = 136315907;
    uint64_t v11 = sub_25A160B40();
    uint64_t v16 = sub_25A14A43C(v11, v12, &v18);
    sub_25A160960();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    uint64_t v16 = sub_25A14A43C(0x6365722874696E69, 0xED0000293A657069, &v18);
    sub_25A160960();
    *(_WORD *)(v10 + 22) = 2160;
    uint64_t v16 = 1752392040;
    sub_25A160960();
    *(_WORD *)(v10 + 32) = 2081;
    uint64_t v16 = 0xD00000000000001DLL;
    unint64_t v17 = 0x800000025A162F10;
    sub_25A14F860();
    sub_25A160800();
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_25A14A43C(v16, v17, &v18);
    sub_25A160960();
    swift_bridgeObjectRelease();
    sub_25A159D5C((uint64_t)v6, type metadata accessor for PreferencesControllerRecipe);
    _os_log_impl(&dword_25A143000, v8, v9, "Start (%s.%s) recipe: %{private,mask.hash}s…", (uint8_t *)v10, 0x2Au);
    uint64_t v13 = v15;
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v13, -1, -1);
    MEMORY[0x25A2F7630](v10, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_25A159D5C((uint64_t)v6, type metadata accessor for PreferencesControllerRecipe);
  }

  sub_25A159CF4(a1, v2 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel__recipe, type metadata accessor for PreferencesControllerRecipe);
  sub_25A1558B0(v2, a1);
  sub_25A159D5C(a1, type metadata accessor for PreferencesControllerRecipe);
  return v2;
}

void sub_25A1558B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for PreferencesControllerRecipe(0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25A160310();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B3292B8);
  sub_25A159CF4(a2, (uint64_t)v5, type metadata accessor for PreferencesControllerRecipe);
  swift_retain_n();
  uint64_t v7 = sub_25A1602F0();
  os_log_type_t v8 = sub_25A1608B0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v16 = v10;
    *(_DWORD *)uint64_t v9 = 136315907;
    uint64_t v11 = sub_25A160B40();
    uint64_t v14 = sub_25A14A43C(v11, v12, &v16);
    sub_25A160960();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v14 = sub_25A14A43C(0x6365722874696E69, 0xED0000293A657069, &v16);
    sub_25A160960();
    *(_WORD *)(v9 + 22) = 2160;
    uint64_t v14 = 1752392040;
    sub_25A160960();
    *(_WORD *)(v9 + 32) = 2081;
    uint64_t v14 = 0xD00000000000001DLL;
    unint64_t v15 = 0x800000025A162F10;
    sub_25A14F860();
    sub_25A160800();
    swift_bridgeObjectRelease();
    uint64_t v14 = sub_25A14A43C(v14, v15, &v16);
    sub_25A160960();
    swift_bridgeObjectRelease();
    sub_25A159D5C((uint64_t)v5, type metadata accessor for PreferencesControllerRecipe);
    _os_log_impl(&dword_25A143000, v7, v8, "…Complete (%s.%s) recipe: %{private,mask.hash}s", (uint8_t *)v9, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v10, -1, -1);
    MEMORY[0x25A2F7630](v9, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_25A159D5C((uint64_t)v5, type metadata accessor for PreferencesControllerRecipe);
  }
}

id sub_25A155C10()
{
  uint64_t v188 = *MEMORY[0x263EF8340];
  uint64_t v0 = type metadata accessor for NSBundle.PreferencesPluginLocation();
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  uint64_t v169 = (uint64_t)&v164 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v175 = (uint64_t)&v164 - v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v164 - v5;
  uint64_t v173 = sub_25A1602B0();
  uint64_t v172 = *(void *)(v173 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v173);
  uint64_t v9 = (char *)&v164 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v164 - v10;
  uint64_t v12 = sub_25A1602E0();
  *(void *)&long long v174 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)&v164 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v168 = (char *)&v164 - v16;
  uint64_t v178 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x270FA5388](v178);
  uint64_t v18 = (char *)&v164 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_25A160310();
  uint64_t v20 = __swift_project_value_buffer(v19, (uint64_t)qword_26B3292B8);
  swift_retain_n();
  uint64_t v21 = sub_25A1602F0();
  os_log_type_t v22 = sub_25A1608E0();
  BOOL v23 = os_log_type_enabled(v21, v22);
  uint64_t v176 = v12;
  v171 = v9;
  v170 = v15;
  if (v23)
  {
    uint64_t v24 = swift_slowAlloc();
    v167 = v11;
    uint64_t v25 = v24;
    uint64_t v26 = swift_slowAlloc();
    *(void *)&long long v184 = v26;
    *(_DWORD *)uint64_t v25 = 136315394;
    uint64_t v27 = sub_25A160B40();
    *(void *)&long long v182 = sub_25A14A43C(v27, v28, (uint64_t *)&v184);
    v177 = v6;
    sub_25A160960();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2080;
    *(void *)&long long v182 = sub_25A14A43C(0xD000000000000014, 0x800000025A163260, (uint64_t *)&v184);
    uint64_t v6 = v177;
    sub_25A160960();
    _os_log_impl(&dword_25A143000, v21, v22, "Start (%s.%s)…", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v26, -1, -1);
    uint64_t v29 = v25;
    uint64_t v11 = v167;
    MEMORY[0x25A2F7630](v29, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  swift_getKeyPath();
  uint64_t v30 = v179;
  *(void *)&long long v184 = v179;
  sub_25A159448(&qword_26B327310);
  sub_25A160250();
  swift_release();
  uint64_t v31 = v30 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel__recipe;
  swift_beginAccess();
  sub_25A159CF4(v31, (uint64_t)v18, type metadata accessor for PreferencesControllerRecipe.Kind);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v57 = *(char **)v18;
      uint64_t v56 = *((void *)v18 + 1);
      uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327600);
      uint64_t v59 = (uint64_t *)&v18[*(int *)(v58 + 64)];
      uint64_t v61 = *v59;
      uint64_t v60 = (char *)v59[1];
      sub_25A159C90((uint64_t)&v18[*(int *)(v58 + 48)], (uint64_t)v6);
      uint64_t v62 = v175;
      sub_25A159CF4((uint64_t)v6, v175, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
      uint64_t v178 = v56;
      swift_bridgeObjectRetain_n();
      v63 = sub_25A1602F0();
      os_log_type_t v64 = sub_25A1608E0();
      BOOL v65 = os_log_type_enabled(v63, v64);
      uint64_t v165 = v61;
      if (v65)
      {
        uint64_t v66 = swift_slowAlloc();
        v177 = v6;
        uint64_t v67 = v66;
        uint64_t v68 = swift_slowAlloc();
        v167 = v60;
        unint64_t v69 = v178;
        v168 = v57;
        uint64_t v70 = v68;
        *(void *)&long long v184 = v68;
        *(_DWORD *)uint64_t v67 = 136446466;
        swift_bridgeObjectRetain();
        *(void *)&long long v182 = sub_25A14A43C((uint64_t)v168, v69, (uint64_t *)&v184);
        sub_25A160960();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v67 + 12) = 2082;
        uint64_t v71 = NSBundle.PreferencesPluginLocation.description.getter();
        *(void *)&long long v182 = sub_25A14A43C(v71, v72, (uint64_t *)&v184);
        sub_25A160960();
        swift_bridgeObjectRelease();
        sub_25A159D5C(v62, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
        _os_log_impl(&dword_25A143000, v63, v64, "Retrieving preferences plugin with name '%{public}s' at location '%{public}s'.", (uint8_t *)v67, 0x16u);
        swift_arrayDestroy();
        uint64_t v73 = v70;
        uint64_t v57 = v168;
        uint64_t v60 = v167;
        MEMORY[0x25A2F7630](v73, -1, -1);
        uint64_t v74 = v67;
        uint64_t v6 = v177;
        MEMORY[0x25A2F7630](v74, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
        sub_25A159D5C(v62, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
      }

      id v98 = sub_25A15F328();
      v168 = v57;
      v167 = v60;
      uint64_t v99 = v169;
      sub_25A159CF4((uint64_t)v6, v169, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
      swift_bridgeObjectRetain_n();
      v100 = sub_25A1602F0();
      os_log_type_t v101 = sub_25A1608E0();
      BOOL v102 = os_log_type_enabled(v100, v101);
      uint64_t v166 = v20;
      v177 = v6;
      if (v102)
      {
        uint64_t v103 = swift_slowAlloc();
        uint64_t v104 = swift_slowAlloc();
        *(void *)&long long v184 = v104;
        *(_DWORD *)uint64_t v103 = 136446466;
        unint64_t v105 = v178;
        swift_bridgeObjectRetain();
        *(void *)&long long v182 = sub_25A14A43C((uint64_t)v168, v105, (uint64_t *)&v184);
        sub_25A160960();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v103 + 12) = 2082;
        uint64_t v106 = NSBundle.PreferencesPluginLocation.description.getter();
        *(void *)&long long v182 = sub_25A14A43C(v106, v107, (uint64_t *)&v184);
        sub_25A160960();
        swift_bridgeObjectRelease();
        sub_25A159D5C(v99, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
        _os_log_impl(&dword_25A143000, v100, v101, "Loading plugin with name '%{public}s' at location '%{public}s'.", (uint8_t *)v103, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25A2F7630](v104, -1, -1);
        MEMORY[0x25A2F7630](v103, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
        sub_25A159D5C(v99, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
      }

      uint64_t v108 = v176;
      uint64_t v109 = v174;
      if (qword_26B3276A8 != -1) {
        swift_once();
      }
      uint64_t v110 = __swift_project_value_buffer(v108, (uint64_t)qword_26B3292D0);
      v111 = v170;
      (*(void (**)(char *, uint64_t, uint64_t))(v109 + 16))(v170, v110, v108);
      id v112 = v98;
      v113 = v171;
      sub_25A1602A0();
      v114 = (uint8_t *)swift_slowAlloc();
      uint64_t v175 = swift_slowAlloc();
      *(void *)&long long v184 = v175;
      *(void *)&long long v115 = 136446210;
      uint64_t v116 = v109;
      long long v174 = v115;
      *(_DWORD *)v114 = 136446210;
      id v117 = objc_msgSend(v112, sel_bundlePath);
      uint64_t v118 = sub_25A1607E0();
      unint64_t v120 = v119;

      *(void *)&long long v182 = sub_25A14A43C(v118, v120, (uint64_t *)&v184);
      sub_25A160960();

      swift_bridgeObjectRelease();
      v121 = sub_25A1602D0();
      os_signpost_type_t v122 = sub_25A160920();
      os_signpost_id_t v123 = sub_25A160290();
      _os_signpost_emit_with_name_impl(&dword_25A143000, v121, v122, v123, "Preferences Plugin Bundle Load", "Bundle: %{public}s", v114, 0xCu);
      *(void *)&long long v182 = 0;
      if (!objc_msgSend(v112, sel_loadAndReturnError_, &v182))
      {
        id v135 = (id)v182;
        v136 = (void *)sub_25A160130();

        swift_willThrow();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        sub_25A159D5C((uint64_t)v177, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);

        (*(void (**)(char *, uint64_t))(v172 + 8))(v113, v173);
        (*(void (**)(char *, uint64_t))(v116 + 8))(v111, v176);
        goto LABEL_63;
      }
      id v124 = (id)v182;
      os_signpost_type_t v125 = sub_25A160910();
      os_signpost_id_t v126 = sub_25A160290();
      _os_signpost_emit_with_name_impl(&dword_25A143000, v121, v125, v126, "Preferences Plugin Bundle Load", "Bundle: %{public}s", v114, 0xCu);

      uint64_t v127 = v175;
      swift_arrayDestroy();
      MEMORY[0x25A2F7630](v127, -1, -1);
      MEMORY[0x25A2F7630](v114, -1, -1);
      (*(void (**)(char *, uint64_t))(v172 + 8))(v113, v173);
      (*(void (**)(char *, uint64_t))(v116 + 8))(v111, v176);
      unint64_t v128 = (unint64_t)v167;
      if (v167)
      {
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        v129 = sub_25A1602F0();
        os_log_type_t v130 = sub_25A1608E0();
        if (os_log_type_enabled(v129, v130))
        {
          uint64_t v131 = swift_slowAlloc();
          uint64_t v132 = swift_slowAlloc();
          *(void *)&long long v184 = v132;
          *(_DWORD *)uint64_t v131 = 136446466;
          swift_bridgeObjectRetain();
          *(void *)&long long v182 = sub_25A14A43C(v165, v128, (uint64_t *)&v184);
          sub_25A160960();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v131 + 12) = 2082;
          unint64_t v133 = v178;
          swift_bridgeObjectRetain();
          *(void *)&long long v182 = sub_25A14A43C((uint64_t)v168, v133, (uint64_t *)&v184);
          sub_25A160960();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_25A143000, v129, v130, "Retrieving '%{public}s' from bundle '%{public}s'.", (uint8_t *)v131, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x25A2F7630](v132, -1, -1);
          MEMORY[0x25A2F7630](v131, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
        }
        uint64_t v134 = (uint64_t)v177;
        v143 = (NSString *)sub_25A1607D0();
        swift_bridgeObjectRelease();
        Class v144 = NSClassFromString(v143);

        if (v144)
        {
          swift_getObjCClassMetadata();
          v186 = &unk_2708266C0;
LABEL_72:
          uint64_t v161 = swift_dynamicCastTypeToObjCProtocolConditional();
          if (v161)
          {
            uint64_t v162 = v161;
            sub_25A159E10(0, (unint64_t *)&qword_26B327620);
            uint64_t v35 = swift_dynamicCastMetatype() ? v162 : 0;
            if (v35)
            {
              sub_25A159D5C(v134, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);

              goto LABEL_12;
            }
          }
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        v138 = sub_25A1602F0();
        os_log_type_t v139 = sub_25A1608E0();
        if (os_log_type_enabled(v138, v139))
        {
          v140 = (uint8_t *)swift_slowAlloc();
          uint64_t v141 = swift_slowAlloc();
          *(void *)&long long v184 = v141;
          *(_DWORD *)v140 = v174;
          unint64_t v142 = v178;
          swift_bridgeObjectRetain();
          *(void *)&long long v182 = sub_25A14A43C((uint64_t)v168, v142, (uint64_t *)&v184);
          sub_25A160960();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_25A143000, v138, v139, "Retrieving principal class from bundle '%{public}s'.", v140, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x25A2F7630](v141, -1, -1);
          MEMORY[0x25A2F7630](v140, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        uint64_t v134 = (uint64_t)v177;
        if (objc_msgSend(v112, sel_principalClass))
        {
          swift_getObjCClassMetadata();
          v187 = &unk_2708266C0;
          goto LABEL_72;
        }
      }
      sub_25A159DBC();
      v136 = (void *)swift_allocError();
      unsigned char *v163 = 2;
      swift_willThrow();

      sub_25A159D5C(v134, (uint64_t (*)(void))type metadata accessor for NSBundle.PreferencesPluginLocation);
      goto LABEL_63;
    case 2u:
      uint64_t v35 = *(void *)v18;
      uint64_t v36 = sub_25A1602F0();
      os_log_type_t v37 = sub_25A1608E0();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (uint8_t *)swift_slowAlloc();
        uint64_t v39 = swift_slowAlloc();
        *(void *)&long long v184 = v39;
        *(_DWORD *)uint64_t v38 = 136446210;
        uint64_t v40 = sub_25A160B40();
        *(void *)&long long v182 = sub_25A14A43C(v40, v41, (uint64_t *)&v184);
        sub_25A160960();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25A143000, v36, v37, "Eagerly loading controller of type '%{public}s'", v38, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A2F7630](v39, -1, -1);
        MEMORY[0x25A2F7630](v38, -1, -1);
      }

LABEL_12:
      uint64_t v181 = v35;
      uint64_t v42 = sub_25A1602F0();
      os_log_type_t v43 = sub_25A1608E0();
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v44 = (uint8_t *)swift_slowAlloc();
        uint64_t v45 = swift_slowAlloc();
        *(void *)&long long v184 = v45;
        *(_DWORD *)uint64_t v44 = 136446210;
        uint64_t v46 = sub_25A160B40();
        *(void *)&long long v182 = sub_25A14A43C(v46, v47, (uint64_t *)&v184);
        sub_25A160960();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25A143000, v42, v43, "Initializing %{public}s.", v44, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A2F7630](v45, -1, -1);
        MEMORY[0x25A2F7630](v44, -1, -1);
      }

      swift_beginAccess();
      id v48 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
      goto LABEL_67;
    case 3u:
      id v49 = *(id *)v18;
      uint64_t v50 = sub_25A1602F0();
      os_log_type_t v51 = sub_25A1608E0();
      if (os_log_type_enabled(v50, v51))
      {
        char v52 = (uint8_t *)swift_slowAlloc();
        uint64_t v53 = swift_slowAlloc();
        *(void *)&long long v184 = v53;
        *(_DWORD *)char v52 = 136446210;
        swift_getObjectType();
        uint64_t v54 = sub_25A160B40();
        *(void *)&long long v182 = sub_25A14A43C(v54, v55, (uint64_t *)&v184);
        sub_25A160960();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25A143000, v50, v51, "Using existing controller of type '%{public}s'.", v52, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A2F7630](v53, -1, -1);
        MEMORY[0x25A2F7630](v52, -1, -1);
      }
      else
      {
      }
      goto LABEL_68;
    default:
      id v32 = *(id *)v18;
      *(void *)&long long v182 = sub_25A1607E0();
      *((void *)&v182 + 1) = v33;
      id v34 = objc_msgSend(v32, sel_objectForKeyedSubscript_, sub_25A160AA0());
      swift_unknownObjectRelease();
      if (v34)
      {
        sub_25A160980();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v182 = 0u;
        long long v183 = 0u;
      }
      sub_25A1593AC((uint64_t)&v182, (uint64_t)&v184);
      if (!*((void *)&v185 + 1))
      {
        sub_25A14AAFC((uint64_t)&v184, &qword_26A408E48);
        goto LABEL_55;
      }
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_55;
      }
      id v75 = objc_allocWithZone(MEMORY[0x263F086E0]);
      v76 = (void *)sub_25A1607D0();
      swift_bridgeObjectRelease();
      id v77 = objc_msgSend(v75, sel_initWithPath_, v76);

      if (!v77) {
        goto LABEL_55;
      }
      uint64_t v166 = v20;
      if (qword_26B3276A8 != -1) {
        swift_once();
      }
      uint64_t v78 = v176;
      uint64_t v79 = __swift_project_value_buffer(v176, (uint64_t)qword_26B3292D0);
      uint64_t v80 = (uint64_t)v168;
      (*(void (**)(char *, uint64_t, uint64_t))(v174 + 16))(v168, v79, v78);
      id v81 = v77;
      sub_25A1602A0();
      v82 = (uint8_t *)swift_slowAlloc();
      uint64_t v178 = swift_slowAlloc();
      *(void *)&long long v184 = v178;
      *(_DWORD *)v82 = 136446210;
      id v83 = objc_msgSend(v81, sel_bundlePath);
      uint64_t v84 = sub_25A1607E0();
      v85 = v11;
      unint64_t v87 = v86;

      *(void *)&long long v182 = sub_25A14A43C(v84, v87, (uint64_t *)&v184);
      sub_25A160960();

      uint64_t v88 = v80;
      swift_bridgeObjectRelease();
      v89 = sub_25A1602D0();
      os_signpost_type_t v90 = sub_25A160920();
      os_signpost_id_t v91 = sub_25A160290();
      _os_signpost_emit_with_name_impl(&dword_25A143000, v89, v90, v91, "Preferences Plugin Bundle Load (via PSSpecifier)", "Bundle: %{public}s", v82, 0xCu);
      *(void *)&long long v182 = 0;
      if (!objc_msgSend(v81, sel_loadAndReturnError_, &v182))
      {
        id v137 = (id)v182;
        v136 = (void *)sub_25A160130();

        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v172 + 8))(v85, v173);
        (*(void (**)(uint64_t, uint64_t))(v174 + 8))(v88, v176);
        goto LABEL_63;
      }
      id v92 = (id)v182;
      os_signpost_type_t v93 = sub_25A160910();
      os_signpost_id_t v94 = sub_25A160290();
      _os_signpost_emit_with_name_impl(&dword_25A143000, v89, v93, v94, "Preferences Plugin Bundle Load (via PSSpecifier)", "Bundle: %{public}s", v82, 0xCu);

      uint64_t v95 = v178;
      swift_arrayDestroy();
      MEMORY[0x25A2F7630](v95, -1, -1);
      MEMORY[0x25A2F7630](v82, -1, -1);
      (*(void (**)(char *, uint64_t))(v172 + 8))(v85, v173);
      (*(void (**)(uint64_t, uint64_t))(v174 + 8))(v80, v176);
      *(void *)&long long v182 = sub_25A1607E0();
      *((void *)&v182 + 1) = v96;
      id v97 = objc_msgSend(v32, sel_objectForKeyedSubscript_, sub_25A160AA0());
      swift_unknownObjectRelease();
      if (v97)
      {
        sub_25A160980();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v182 = 0u;
        long long v183 = 0u;
      }
      sub_25A1593AC((uint64_t)&v182, (uint64_t)&v184);
      if (*((void *)&v185 + 1))
      {
        if (swift_dynamicCast())
        {
          v145 = (NSString *)sub_25A1607D0();
          swift_bridgeObjectRelease();
          Class v146 = NSClassFromString(v145);

          objc_msgSend(v32, sel_setDetailControllerClass_, v146);
          goto LABEL_54;
        }
      }
      else
      {
        sub_25A14AAFC((uint64_t)&v184, &qword_26A408E48);
      }
      objc_msgSend(v32, sel_setDetailControllerClass_, objc_msgSend(v81, sel_principalClass));
LABEL_54:

LABEL_55:
      id v147 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5FBC0]), sel_init);
      id v148 = objc_msgSend(v147, sel_selectSpecifier_, v32);
      if (v148)
      {
        id v149 = v148;
        *((void *)&v185 + 1) = swift_getObjectType();
        *(void *)&long long v184 = v149;
      }
      else
      {
        long long v184 = 0u;
        long long v185 = 0u;
      }
      sub_25A159E4C((uint64_t)&v184, (uint64_t)&v182, &qword_26A408E48);
      if (*((void *)&v183 + 1))
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A408EF8);
        if (swift_dynamicCast())
        {

          id v49 = v180;
          sub_25A14AAFC((uint64_t)&v184, &qword_26A408E48);
          goto LABEL_68;
        }
      }
      else
      {
        sub_25A14AAFC((uint64_t)&v182, &qword_26A408E48);
      }
      sub_25A159DBC();
      v136 = (void *)swift_allocError();
      unsigned char *v150 = 3;
      swift_willThrow();

      sub_25A14AAFC((uint64_t)&v184, &qword_26A408E48);
LABEL_63:
      id v151 = v136;
      id v152 = v136;
      v153 = sub_25A1602F0();
      os_log_type_t v154 = sub_25A1608C0();
      if (os_log_type_enabled(v153, v154))
      {
        v155 = (uint8_t *)swift_slowAlloc();
        uint64_t v156 = swift_slowAlloc();
        *(void *)&long long v184 = v156;
        *(_DWORD *)v155 = 136446210;
        swift_getErrorValue();
        uint64_t v157 = sub_25A160AC0();
        *(void *)&long long v182 = sub_25A14A43C(v157, v158, (uint64_t *)&v184);
        sub_25A160960();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_25A143000, v153, v154, "Encountered error creating view controller: '%{public}s'", v155, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A2F7630](v156, -1, -1);
        MEMORY[0x25A2F7630](v155, -1, -1);
      }
      else
      {
      }
      id v159 = objc_allocWithZone((Class)type metadata accessor for PreferencesControllerErrorHostingController());
      *(void *)&long long v184 = v136;
      id v48 = (id)sub_25A1604E0();
LABEL_67:
      id v49 = v48;
LABEL_68:
      sub_25A157F1C(v179, 0xD000000000000014, 0x800000025A163260);
      return v49;
  }
}

void sub_25A157910(uint64_t a1, void *a2)
{
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25A160310();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B3292B8);
  swift_retain_n();
  id v4 = a2;
  uint64_t v5 = sub_25A1602F0();
  os_log_type_t v6 = sub_25A1608E0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v13 = v9;
    *(_DWORD *)uint64_t v7 = 136315907;
    uint64_t v10 = sub_25A160B40();
    sub_25A14A43C(v10, v11, &v13);
    sub_25A160960();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    sub_25A14A43C(0xD000000000000037, 0x800000025A162B30, &v13);
    sub_25A160960();
    *(_WORD *)(v7 + 22) = 2160;
    sub_25A160960();
    *(_WORD *)(v7 + 32) = 2113;
    id v12 = v4;
    sub_25A160960();
    *uint64_t v8 = v4;

    _os_log_impl(&dword_25A143000, v5, v6, "…Complete (%s.%s), preferencesController: %{private,mask.hash}@", (uint8_t *)v7, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B327680);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v8, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v9, -1, -1);
    MEMORY[0x25A2F7630](v7, -1, -1);
  }
  else
  {

    swift_release_n();
  }
}

void sub_25A157BE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25A160310();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B3292B8);
  swift_retain_n();
  uint64_t v9 = sub_25A1602F0();
  os_log_type_t v10 = sub_25A1608E0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v21 = a3;
    uint64_t v12 = swift_slowAlloc();
    aBlock[0] = v12;
    *(_DWORD *)uint64_t v11 = 136315394;
    uint64_t v13 = sub_25A160B40();
    sub_25A14A43C(v13, v14, aBlock);
    sub_25A160960();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    sub_25A14A43C(0xD00000000000002ALL, 0x800000025A1631D0, aBlock);
    sub_25A160960();
    _os_log_impl(&dword_25A143000, v9, v10, "Start (%s.%s)…", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    uint64_t v15 = v12;
    a3 = v21;
    MEMORY[0x25A2F7630](v15, -1, -1);
    MEMORY[0x25A2F7630](v11, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v16 = PreferencesControllerRepresentableModel.makeViewControllerIfNeeded()();
  uint64_t v17 = (void *)sub_25A1607A0();
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = v16;
  v18[3] = a1;
  v18[4] = a2;
  v18[5] = a3;
  v18[6] = v4;
  aBlock[4] = (uint64_t)sub_25A159B34;
  aBlock[5] = (uint64_t)v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_25A158858;
  aBlock[3] = (uint64_t)&block_descriptor;
  uint64_t v19 = _Block_copy(aBlock);
  swift_retain();
  uint64_t v20 = v16;
  swift_bridgeObjectRetain();
  sub_25A14D2DC(a2);
  swift_release();
  [v20 handleURL:v17 withCompletion:v19];
  _Block_release(v19);
}

void sub_25A157F1C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25A160310();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B3292B8);
  swift_retain_n();
  os_log_type_t v6 = sub_25A1602F0();
  os_log_type_t v7 = sub_25A1608E0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v12 = v9;
    *(_DWORD *)uint64_t v8 = 136315394;
    uint64_t v10 = sub_25A160B40();
    sub_25A14A43C(v10, v11, &v12);
    sub_25A160960();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    sub_25A14A43C(a2, a3, &v12);
    sub_25A160960();
    _os_log_impl(&dword_25A143000, v6, v7, "…Complete (%s.%s)", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v9, -1, -1);
    MEMORY[0x25A2F7630](v8, -1, -1);
  }
  else
  {

    swift_release_n();
  }
}

void sub_25A15812C(void *a1, uint64_t a2, void (*a3)(uint64_t))
{
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (!v6)
  {
LABEL_24:
    unint64_t v21 = 0x26B327000;
    if (a3) {
      goto LABEL_25;
    }
    goto LABEL_27;
  }
  os_log_type_t v7 = (void *)v6;
  id v8 = a1;
  sub_25A1609D0();
  if (*(void *)(a2 + 16) && (unint64_t v9 = sub_25A15C46C((uint64_t)v38), (v10 & 1) != 0))
  {
    sub_25A145DCC(*(void *)(a2 + 56) + 32 * v9, (uint64_t)&v39);
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
  }
  sub_25A159B5C((uint64_t)v38);
  if (*((void *)&v40 + 1))
  {
    sub_25A159E10(0, qword_26B327748);
    if ((swift_dynamicCast() & 1) == 0)
    {

      unint64_t v21 = 0x26B327000;
      if (a3) {
        goto LABEL_25;
      }
      goto LABEL_27;
    }
    id v11 = objc_msgSend((id)0x68746170, sel_pathComponents);
    uint64_t v12 = sub_25A160830();

    uint64_t v13 = *(void *)(v12 + 16);
    swift_bridgeObjectRelease();
    if (v13 != 1)
    {
LABEL_23:

      goto LABEL_24;
    }
    id v14 = objc_msgSend((id)0x68746170, sel_pathComponents);
    uint64_t v15 = sub_25A160830();

    if (!*(void *)(v15 + 16))
    {

      uint64_t v6 = swift_bridgeObjectRelease();
      unint64_t v21 = 0x26B327000uLL;
      if (a3) {
        goto LABEL_25;
      }
      goto LABEL_27;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v16 = (void *)sub_25A1607D0();
    swift_bridgeObjectRelease();
    id v17 = (id)SFObjectAndOffsetForURLPair();

    uint64_t v18 = sub_25A1607B0();
    sub_25A1609D0();
    if (*(void *)(v18 + 16) && (unint64_t v19 = sub_25A15C46C((uint64_t)v38), (v20 & 1) != 0))
    {
      sub_25A145DCC(*(void *)(v18 + 56) + 32 * v19, (uint64_t)&v39);
    }
    else
    {
      long long v39 = 0u;
      long long v40 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_25A159B5C((uint64_t)v38);
    if (*((void *)&v40 + 1))
    {
      if (swift_dynamicCast())
      {
        os_log_type_t v22 = (void *)sub_25A1607D0();
        objc_msgSend(v7, sel__scrollToSpecifierWithID_animated_, v22, 1);

        BOOL v23 = (void *)sub_25A1607D0();
        swift_bridgeObjectRelease();
        objc_msgSend(v7, sel_highlightSpecifierWithID_, v23);

        unint64_t v21 = 0x26B327000;
        if (!a3) {
          goto LABEL_27;
        }
LABEL_25:
        a3(v6);
        goto LABEL_32;
      }
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v6 = sub_25A14AAFC((uint64_t)&v39, &qword_26A408E48);
  unint64_t v21 = 0x26B327000;
  if (a3) {
    goto LABEL_25;
  }
LABEL_27:
  if (*(void *)(v21 + 1392) != -1) {
    swift_once();
  }
  uint64_t v24 = sub_25A160310();
  __swift_project_value_buffer(v24, (uint64_t)qword_26B3292B8);
  swift_retain_n();
  uint64_t v25 = sub_25A1602F0();
  os_log_type_t v26 = sub_25A1608D0();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    v38[0] = v28;
    *(_DWORD *)uint64_t v27 = 136315394;
    uint64_t v29 = sub_25A160B40();
    *(void *)&long long v39 = sub_25A14A43C(v29, v30, v38);
    sub_25A160960();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 2080;
    *(void *)&long long v39 = sub_25A14A43C(0xD00000000000002ALL, 0x800000025A1631D0, v38);
    sub_25A160960();
    _os_log_impl(&dword_25A143000, v25, v26, "%s.%s: completion block not present", (uint8_t *)v27, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v28, -1, -1);
    MEMORY[0x25A2F7630](v27, -1, -1);
  }
  else
  {

    swift_release_n();
  }
LABEL_32:
  if (*(void *)(v21 + 1392) != -1) {
    swift_once();
  }
  uint64_t v31 = sub_25A160310();
  __swift_project_value_buffer(v31, (uint64_t)qword_26B3292B8);
  swift_retain_n();
  id v32 = sub_25A1602F0();
  os_log_type_t v33 = sub_25A1608E0();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    v38[0] = v35;
    *(_DWORD *)uint64_t v34 = 136315394;
    uint64_t v36 = sub_25A160B40();
    *(void *)&long long v39 = sub_25A14A43C(v36, v37, v38);
    sub_25A160960();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 12) = 2080;
    *(void *)&long long v39 = sub_25A14A43C(0xD00000000000002ALL, 0x800000025A1631D0, v38);
    sub_25A160960();
    _os_log_impl(&dword_25A143000, v32, v33, "…Complete (%s.%s)", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v35, -1, -1);
    MEMORY[0x25A2F7630](v34, -1, -1);
  }
  else
  {

    swift_release_n();
  }
}

uint64_t sub_25A158858(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t PreferencesControllerRepresentableModel.deinit()
{
  sub_25A159D5C(v0 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel__recipe, type metadata accessor for PreferencesControllerRecipe);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_preferencesController));
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel___observationRegistrar;
  uint64_t v2 = sub_25A160270();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t PreferencesControllerRepresentableModel.__deallocating_deinit()
{
  sub_25A159D5C(v0 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel__recipe, type metadata accessor for PreferencesControllerRecipe);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_preferencesController));
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel___observationRegistrar;
  uint64_t v2 = sub_25A160270();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

BOOL static PreferencesControllerRepresentableModel.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void PreferencesControllerRepresentableModel.hash(into:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PreferencesControllerRecipe(0);
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v12 = v0;
  sub_25A159448(&qword_26B327310);
  sub_25A160250();
  swift_release();
  uint64_t v6 = v0 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel__recipe;
  swift_beginAccess();
  sub_25A159CF4(v6, (uint64_t)v5, type metadata accessor for PreferencesControllerRecipe);
  sub_25A151598();
  os_log_type_t v7 = *(void **)&v5[*(int *)(v3 + 40)];
  if (v7)
  {
    id v8 = v7;
    sub_25A160940();
  }
  sub_25A159D5C((uint64_t)v5, type metadata accessor for PreferencesControllerRecipe);
  unint64_t v9 = *(void **)(v1
                + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_preferencesController);
  if (v9)
  {
    id v10 = v9;
    sub_25A160940();
  }
}

uint64_t PreferencesControllerRepresentableModel.hashValue.getter()
{
  return sub_25A160B30();
}

uint64_t sub_25A158BFC()
{
  return sub_25A160B30();
}

void sub_25A158C40()
{
}

uint64_t sub_25A158C64()
{
  return sub_25A160B30();
}

uint64_t PreferencesControllerRepresentableModel.description.getter()
{
  return 0;
}

uint64_t sub_25A158D5C()
{
  return 0;
}

uint64_t UIViewController.associatedPreferencesControllerRecipe.getter@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  id v3 = objc_getAssociatedObject(v1, &unk_26A408EC0);
  swift_endAccess();
  if (v3)
  {
    sub_25A160980();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_25A1593AC((uint64_t)v8, (uint64_t)v9);
  if (v10)
  {
    uint64_t v4 = type metadata accessor for PreferencesControllerRecipe(0);
    int v5 = swift_dynamicCast();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(a1, v5 ^ 1u, 1, v4);
  }
  else
  {
    sub_25A14AAFC((uint64_t)v9, &qword_26A408E48);
    uint64_t v7 = type metadata accessor for PreferencesControllerRecipe(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a1, 1, 1, v7);
  }
}

uint64_t sub_25A158F64(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A408ED0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A159E4C(a1, (uint64_t)v4, &qword_26A408ED0);
  return UIViewController.associatedPreferencesControllerRecipe.setter((uint64_t)v4);
}

uint64_t UIViewController.associatedPreferencesControllerRecipe.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for PreferencesControllerRecipe(0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A408ED0);
  MEMORY[0x270FA5388](v7 - 8);
  unint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A159E4C(a1, (uint64_t)v9, &qword_26A408ED0);
  uint64_t v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3) != 1)
  {
    sub_25A159CF4((uint64_t)v9, (uint64_t)v6, type metadata accessor for PreferencesControllerRecipe);
    uint64_t v10 = (void *)sub_25A160AA0();
    sub_25A159D5C((uint64_t)v9, type metadata accessor for PreferencesControllerRecipe);
  }
  swift_beginAccess();
  objc_setAssociatedObject(v1, &unk_26A408EC0, v10, (void *)1);
  swift_endAccess();
  swift_unknownObjectRelease();
  return sub_25A14AAFC(a1, &qword_26A408ED0);
}

void (*UIViewController.associatedPreferencesControllerRecipe.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  size_t v3 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A408ED0) - 8) + 64);
  a1[1] = malloc(v3);
  uint64_t v4 = malloc(v3);
  a1[2] = v4;
  UIViewController.associatedPreferencesControllerRecipe.getter((uint64_t)v4);
  return sub_25A159260;
}

void sub_25A159260(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  size_t v3 = *(void **)(a1 + 16);
  if (a2)
  {
    sub_25A159E4C(*(void *)(a1 + 16), (uint64_t)v2, &qword_26A408ED0);
    UIViewController.associatedPreferencesControllerRecipe.setter((uint64_t)v2);
    sub_25A14AAFC((uint64_t)v3, &qword_26A408ED0);
  }
  else
  {
    UIViewController.associatedPreferencesControllerRecipe.setter(*(void *)(a1 + 16));
  }
  free(v3);

  free(v2);
}

uint64_t type metadata accessor for PreferencesControllerRepresentableModel()
{
  uint64_t result = qword_26B327318;
  if (!qword_26B327318) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_25A159338@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_parentViewController);
  *a2 = result;
  return result;
}

uint64_t sub_25A159374()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25A1593AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A408E48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A159414()
{
  return sub_25A159448((unint64_t *)&unk_26A408ED8);
}

uint64_t sub_25A159448(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for PreferencesControllerRepresentableModel();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25A15948C@<X0>(uint64_t a1@<X8>)
{
  return UIViewController.associatedPreferencesControllerRecipe.getter(a1);
}

uint64_t sub_25A1594B4()
{
  return type metadata accessor for PreferencesControllerRepresentableModel();
}

uint64_t sub_25A1594BC()
{
  uint64_t result = type metadata accessor for PreferencesControllerRecipe(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25A160270();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t method lookup function for PreferencesControllerRepresentableModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PreferencesControllerRepresentableModel);
}

uint64_t dispatch thunk of PreferencesControllerRepresentableModel.__allocating_init(recipe:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

void sub_25A1595C0(void *a1)
{
  void (*v17)(uint64_t *__return_ptr, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*(*v21)())();
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32[3];

  uint64_t v2 = v1;
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25A160310();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B3292B8);
  swift_retain_n();
  id v5 = a1;
  uint64_t v6 = sub_25A1602F0();
  os_log_type_t v7 = sub_25A1608E0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    unint64_t v9 = (void *)swift_slowAlloc();
    unint64_t v30 = swift_slowAlloc();
    v32[0] = v30;
    *(_DWORD *)uint64_t v8 = 136315907;
    uint64_t v10 = sub_25A160B40();
    sub_25A14A43C(v10, v11, v32);
    sub_25A160960();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    sub_25A14A43C(0xD000000000000037, 0x800000025A162B30, v32);
    sub_25A160960();
    *(_WORD *)(v8 + 22) = 2160;
    sub_25A160960();
    *(_WORD *)(v8 + 32) = 2113;
    uint64_t v31 = (uint64_t)v5;
    id v12 = v5;
    sub_25A160960();
    void *v9 = v5;

    _os_log_impl(&dword_25A143000, v6, v7, "Start (%s.%s), preferencesController: %{private,mask.hash}@…", (uint8_t *)v8, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B327680);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v9, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v30, -1, -1);
    MEMORY[0x25A2F7630](v8, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  swift_getKeyPath();
  v32[0] = v2;
  sub_25A159448(&qword_26B327310);
  sub_25A160250();
  swift_release();
  uint64_t v13 = v2 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel__recipe;
  swift_beginAccess();
  uint64_t v14 = type metadata accessor for PreferencesControllerRecipe(0);
  uint64_t v15 = *(void *)(v13 + *(int *)(v14 + 24));
  if (v15 && (*(unsigned char *)(v15 + 16) & 1) == 0)
  {
    uint64_t v16 = v14;
    id v17 = *(void (**)(uint64_t *__return_ptr, uint64_t))(v15 + 24);
    uint64_t v18 = 1;
    *(unsigned char *)(v15 + 16) = 1;
    swift_getKeyPath();
    uint64_t v31 = v2;
    swift_retain();
    sub_25A160250();
    unint64_t v19 = swift_release();
    char v20 = *(void *)(v13 + *(int *)(v16 + 28));
    if (v20 && (*(unsigned char *)(v20 + 16) & 1) == 0)
    {
      BOOL v23 = *(void *)(v20 + 24);
      os_log_type_t v22 = *(void *)(v20 + 32);
      *(unsigned char *)(v20 + 16) = 1;
      uint64_t v24 = swift_allocObject();
      *(void *)(v24 + 16) = v23;
      *(void *)(v24 + 24) = v22;
      unint64_t v19 = swift_retain();
      uint64_t v18 = 0;
      unint64_t v21 = sub_25A159A74;
    }
    else
    {
      unint64_t v21 = 0;
    }
    v17(&v31, v19);
    swift_release();
    uint64_t v25 = v31;
    if (v18)
    {
      os_log_type_t v26 = 0;
      uint64_t v27 = 0;
    }
    else
    {
      uint64_t v28 = swift_retain();
      os_log_type_t v26 = ((uint64_t (*)(uint64_t))v21)(v28);
      uint64_t v27 = v29;
      sub_25A14ABBC((uint64_t)v21);
    }
    sub_25A157BE0(v25, v26, v27);
    sub_25A14ABBC(v26);
    swift_bridgeObjectRelease();
    sub_25A14ABBC((uint64_t)v21);
  }
  sub_25A157910(v2, v5);
}

uint64_t (*sub_25A159A74())()
{
  (*(void (**)(long long *__return_ptr))(v0 + 16))(&v2);
  *(_OWORD *)(swift_allocObject() + 16) = v2;
  return sub_25A159BE8;
}

uint64_t sub_25A159ADC()
{
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 32)) {
    swift_release();
  }
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_25A159B34()
{
  sub_25A15812C(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void (**)(uint64_t))(v0 + 32));
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

uint64_t sub_25A159B5C(uint64_t a1)
{
  return a1;
}

uint64_t sub_25A159BB0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25A159BE8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25A159C10()
{
  return sub_25A155428(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_25A159C2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreferencesControllerRecipe(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A159C90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NSBundle.PreferencesPluginLocation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A159CF4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A159D5C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_25A159DBC()
{
  unint64_t result = qword_26A408EE8;
  if (!qword_26A408EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A408EE8);
  }
  return result;
}

uint64_t sub_25A159E10(uint64_t a1, unint64_t *a2)
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

uint64_t sub_25A159E4C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t PreferencesControllerView.init(preferencesControllerRepresentableModel:)@<X0>(void *a1@<X8>)
{
  type metadata accessor for PreferencesControllerRepresentableModel();
  uint64_t result = sub_25A1606C0();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t PreferencesControllerView.init(preferencesControllerRecipe:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for PreferencesControllerRecipe(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A159FD0(a1, (uint64_t)v6);
  type metadata accessor for PreferencesControllerRepresentableModel();
  swift_allocObject();
  v9[1] = PreferencesControllerRepresentableModel.init(recipe:)((uint64_t)v6);
  sub_25A1606C0();
  uint64_t result = sub_25A15A034(a1);
  uint64_t v8 = v9[3];
  *a2 = v9[2];
  a2[1] = v8;
  return result;
}

uint64_t sub_25A159FD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreferencesControllerRecipe(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A15A034(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PreferencesControllerRecipe(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t PreferencesControllerView.body.getter()
{
  return swift_release();
}

unint64_t sub_25A15A144()
{
  unint64_t result = qword_26B327578;
  if (!qword_26B327578)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B327580);
    sub_25A154370();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B327578);
  }
  return result;
}

uint64_t sub_25A15A1C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25A15A1DC()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for PreferencesControllerView()
{
  return &type metadata for PreferencesControllerView;
}

uint64_t sub_25A15A2A0()
{
  return swift_getOpaqueTypeConformance2();
}

PreferencesExtended::SettingsAppPrimaryNavigationMode_optional __swiftcall SettingsAppPrimaryNavigationMode.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  *uint64_t v1 = v2;
  return (PreferencesExtended::SettingsAppPrimaryNavigationMode_optional)rawValue;
}

uint64_t SettingsAppPrimaryNavigationMode.rawValue.getter()
{
  return *v0;
}

BOOL sub_25A15A334(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_25A15A34C()
{
  return sub_25A160B30();
}

uint64_t sub_25A15A394()
{
  return sub_25A160B20();
}

uint64_t sub_25A15A3C0()
{
  return sub_25A160B30();
}

void *sub_25A15A404@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_25A15A424(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t static SettingsAppPrimaryNavigationModeKey.defaultValue.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = byte_26A408F00;
  return result;
}

uint64_t static SettingsAppPrimaryNavigationModeKey.defaultValue.setter(char *a1)
{
  char v1 = *a1;
  uint64_t result = swift_beginAccess();
  byte_26A408F00 = v1;
  return result;
}

uint64_t (*static SettingsAppPrimaryNavigationModeKey.defaultValue.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_25A15A51C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = byte_26A408F00;
  return result;
}

uint64_t sub_25A15A568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_25A15AC5C();

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t EnvironmentValues.settingsAppPrimaryNavigationMode.getter()
{
  sub_25A15A614();

  return sub_25A1604A0();
}

unint64_t sub_25A15A614()
{
  unint64_t result = qword_26B3273A8;
  if (!qword_26B3273A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3273A8);
  }
  return result;
}

uint64_t sub_25A15A668@<X0>(unsigned char *a1@<X8>)
{
  sub_25A15A614();
  uint64_t result = sub_25A1604A0();
  *a1 = v3;
  return result;
}

uint64_t sub_25A15A6B8()
{
  return sub_25A1604B0();
}

uint64_t View.settingsAppPrimaryNavigationMode(_:)()
{
  return swift_release();
}

uint64_t sub_25A15A778@<X0>(unsigned char *a1@<X8>)
{
  sub_25A15A614();
  uint64_t result = sub_25A1604A0();
  *a1 = v3;
  return result;
}

uint64_t sub_25A15A7C8()
{
  return sub_25A1604B0();
}

uint64_t sub_25A15A814()
{
  uint64_t result = swift_beginAccess();
  byte_26A408F01 = byte_26A408F00;
  return result;
}

uint64_t static SettingsAppPrimaryNavigationModeTrait.defaultValue.getter@<X0>(unsigned char *a1@<X8>)
{
  if (qword_26B327428 != -1) {
    uint64_t result = swift_once();
  }
  *a1 = byte_26A408F01;
  return result;
}

uint64_t sub_25A15A8BC@<X0>(unsigned char *a1@<X8>)
{
  if (qword_26B327428 != -1) {
    uint64_t result = swift_once();
  }
  *a1 = byte_26A408F01;
  return result;
}

uint64_t UITraitCollection.settingsAppPrimaryNavigationMode.getter()
{
  sub_25A15A974();
  sub_25A15A9C8();

  return sub_25A1608F0();
}

unint64_t sub_25A15A974()
{
  unint64_t result = qword_26B327430;
  if (!qword_26B327430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B327430);
  }
  return result;
}

unint64_t sub_25A15A9C8()
{
  unint64_t result = qword_26B327360;
  if (!qword_26B327360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B327360);
  }
  return result;
}

uint64_t UIMutableTraits.settingsAppPrimaryNavigationMode.getter(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25A15A974();
  unint64_t v5 = sub_25A15A9C8();

  return MEMORY[0x270F81A40](&type metadata for SettingsAppPrimaryNavigationModeTrait, &type metadata for SettingsAppPrimaryNavigationModeTrait, v4, v5, a1, a2);
}

uint64_t UIMutableTraits.settingsAppPrimaryNavigationMode.setter()
{
  return sub_25A160330();
}

uint64_t (*UIMutableTraits.settingsAppPrimaryNavigationMode.modify(uint64_t *a1, uint64_t a2, uint64_t a3))()
{
  a1[1] = a3;
  a1[2] = v3;
  *a1 = a2;
  UIMutableTraits.settingsAppPrimaryNavigationMode.getter(a2, a3);
  return sub_25A15AB5C;
}

uint64_t sub_25A15AB5C()
{
  return UIMutableTraits.settingsAppPrimaryNavigationMode.setter();
}

uint64_t static SettingsAppPrimaryNavigationModeKey.read(from:)()
{
  return sub_25A1608F0();
}

uint64_t static SettingsAppPrimaryNavigationModeKey.write(to:value:)(uint64_t a1)
{
  return UIMutableTraits.settingsAppPrimaryNavigationMode.setter();
}

unint64_t sub_25A15AC5C()
{
  unint64_t result = qword_26B327358;
  if (!qword_26B327358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B327358);
  }
  return result;
}

unint64_t sub_25A15ACB4()
{
  unint64_t result = qword_26B3273A0;
  if (!qword_26B3273A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3273A0);
  }
  return result;
}

uint64_t sub_25A15AD08()
{
  return sub_25A1608F0();
}

uint64_t sub_25A15AD5C(uint64_t a1)
{
  return UIMutableTraits.settingsAppPrimaryNavigationMode.setter();
}

uint64_t sub_25A15ADB4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, unsigned char *a3@<X8>)
{
  uint64_t result = UIMutableTraits.settingsAppPrimaryNavigationMode.getter(*(void *)(a2 + a1 - 16), *(void *)(a2 + a1 - 8));
  *a3 = v5;
  return result;
}

uint64_t sub_25A15ADF8()
{
  return UIMutableTraits.settingsAppPrimaryNavigationMode.setter();
}

uint64_t sub_25A15AE38()
{
  return 16;
}

__n128 sub_25A15AE44(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t getEnumTagSinglePayload for SettingsAppPrimaryNavigationMode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SettingsAppPrimaryNavigationMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x25A15AFACLL);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_25A15AFD4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25A15AFDC(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SettingsAppPrimaryNavigationMode()
{
  return &type metadata for SettingsAppPrimaryNavigationMode;
}

ValueMetadata *type metadata accessor for SettingsAppPrimaryNavigationModeKey()
{
  return &type metadata for SettingsAppPrimaryNavigationModeKey;
}

ValueMetadata *type metadata accessor for SettingsAppPrimaryNavigationModeTrait()
{
  return &type metadata for SettingsAppPrimaryNavigationModeTrait;
}

uint64_t sub_25A15B018()
{
  return swift_getWitnessTable();
}

unint64_t sub_25A15B088()
{
  unint64_t result = qword_26B327590;
  if (!qword_26B327590)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B327598);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B327590);
  }
  return result;
}

void sub_25A15B0E4(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327678);
  uint64_t v35 = *(void *)(v6 - 8);
  uint64_t v36 = v6;
  MEMORY[0x270FA5388]();
  int v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327668);
  uint64_t v34 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_msgSend(a1, sel_navigationItem);
  id v13 = objc_msgSend(a2, sel_navigationItem);
  char v14 = sub_25A15B690((uint64_t)v12, (uint64_t)v13);

  if ((v14 & 1) == 0)
  {
    id v15 = objc_msgSend(a1, sel_navigationItem);
    uint64_t v33 = (uint64_t)v15;
    id v16 = objc_msgSend(a2, sel_navigationItem);
    uint64_t v32 = (uint64_t)v16;

    id v17 = objc_msgSend(a2, sel_navigationItem);
    id v18 = objc_msgSend(a1, sel_navigationItem);
    id v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F83058]), sel_initWithDestinationNavigationItem_sourceNavigationItem_, v17, v18);

    swift_getKeyPath();
    sub_25A160160();
    swift_release();
    uint64_t v19 = swift_allocObject();
    swift_weakInit();
    char v20 = (void *)swift_allocObject();
    v20[2] = a2;
    v20[3] = v19;
    void v20[4] = a1;
    sub_25A15BFF4((unint64_t *)&qword_26B327660, &qword_26B327668);
    id v21 = a2;
    id v22 = a1;
    uint64_t v23 = sub_25A1603B0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v9);
    swift_getKeyPath();
    sub_25A160160();
    swift_release();
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = v22;
    *(void *)(v24 + 24) = v21;
    sub_25A15BFF4(&qword_26B327670, &qword_26B327678);
    id v25 = v21;
    id v26 = v22;
    uint64_t v27 = v36;
    uint64_t v28 = sub_25A1603B0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v27);
    swift_beginAccess();
    id v29 = v31;
    swift_retain();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v37 = *(void *)(v3 + 16);
    *(void *)(v3 + 16) = 0x8000000000000000;
    sub_25A15C9B0((uint64_t)v29, v23, v28, v33, v32, isUniquelyReferenced_nonNull_native);
    *(void *)(v3 + 16) = v37;
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();
    swift_release();
  }
}

uint64_t sub_25A15B540()
{
  return sub_25A160B30();
}

uint64_t sub_25A15B59C()
{
  return sub_25A160B20();
}

uint64_t sub_25A15B5D8()
{
  return sub_25A160B30();
}

BOOL sub_25A15B630(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

unint64_t sub_25A15B648()
{
  type metadata accessor for UINavigationItemProxyManager();
  uint64_t v0 = swift_allocObject();
  unint64_t result = sub_25A15CEE0(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 16) = result;
  qword_26B3292B0 = v0;
  return result;
}

uint64_t sub_25A15B690(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 16);
  if (*(void *)(v5 + 16) && (unint64_t v6 = sub_25A15C3EC(a1, a2), (v7 & 1) != 0))
  {
    int v8 = *(void **)(*(void *)(v5 + 56) + 24 * v6);
    id v9 = v8;
    swift_retain();
    swift_retain();
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
    int v8 = 0;
  }
  swift_endAccess();
  sub_25A15CE94(v8);
  return v10;
}

void *sub_25A15B750(void *result, void *a2, uint64_t a3, void *a4)
{
  if (*result) {
    BOOL v4 = *result == (void)a2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    swift_beginAccess();
    unint64_t result = (void *)swift_weakLoadStrong();
    if (result)
    {
      sub_25A15B7D4(a4, a2);
      return (void *)swift_release();
    }
  }
  return result;
}

void sub_25A15B7D4(void *a1, void *a2)
{
  id v4 = objc_msgSend(a1, sel_navigationItem);
  id v5 = objc_msgSend(a2, sel_navigationItem);
  char v6 = sub_25A15B690((uint64_t)v4, (uint64_t)v5);

  if (v6)
  {
    id v7 = objc_msgSend(a1, sel_navigationItem);
    id v8 = objc_msgSend(a2, sel_navigationItem);

    swift_beginAccess();
    id v9 = (void *)sub_25A15C330((uint64_t)v7, (uint64_t)v8);
    swift_endAccess();
    if (v9)
    {
      sub_25A1603A0();
      sub_25A1603A0();
      swift_release();
      swift_release();
    }
  }
}

void sub_25A15B8FC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_toolbarItems);
  if (v3)
  {
    id v4 = v3;
    sub_25A159E10(0, &qword_26B327618);
    uint64_t v5 = sub_25A160830();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = v5;
}

void sub_25A15B97C(void *a1, void **a2)
{
  uint64_t v2 = *a2;
  if (*a1)
  {
    sub_25A159E10(0, &qword_26B327618);
    uint64_t v3 = sub_25A160820();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setToolbarItems_);
}

void sub_25A15BA04(unint64_t *a1, id a2, void *a3)
{
  unint64_t v4 = *a1;
  id v5 = objc_msgSend(a2, sel_parentViewController);
  if (!v5) {
    return;
  }
  char v6 = v5;
  sub_25A159E10(0, (unint64_t *)&qword_26B327620);
  id v7 = a3;
  id v8 = v6;
  char v9 = sub_25A160930();

  if ((v9 & 1) == 0) {
    return;
  }
  id v10 = objc_msgSend(v7, sel_toolbarItems);
  if (v10)
  {
    unint64_t v11 = v10;
    sub_25A159E10(0, &qword_26B327618);
    uint64_t v12 = sub_25A160830();

    if (!v4)
    {
      if (!v12) {
        return;
      }
      swift_bridgeObjectRelease();
      uint64_t v14 = 0;
      goto LABEL_12;
    }
    if (v12)
    {
      swift_bridgeObjectRetain_n();
      unsigned __int8 v13 = sub_25A15C044(v4, v12);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      if (v13) {
        return;
      }
    }
  }
  else if (!v4)
  {
    return;
  }
  sub_25A159E10(0, &qword_26B327618);
  uint64_t v14 = sub_25A160820();
LABEL_12:
  id v15 = (id)v14;
  objc_msgSend(v7, sel_setToolbarItems_);
}

uint64_t sub_25A15BBBC()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for UINavigationItemProxyManager()
{
  return self;
}

uint64_t destroy for UINavigationItemProxyManager.ProxyValue(id *a1)
{
  swift_release();

  return swift_release();
}

void *_s19PreferencesExtended28UINavigationItemProxyManagerC10ProxyValueVwCP_0(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  id v5 = v3;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for UINavigationItemProxyManager.ProxyValue(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for UINavigationItemProxyManager.ProxyValue(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for UINavigationItemProxyManager.ProxyValue(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UINavigationItemProxyManager.ProxyValue(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UINavigationItemProxyManager.ProxyValue()
{
  return &type metadata for UINavigationItemProxyManager.ProxyValue;
}

uint64_t getEnumTagSinglePayload for UINavigationItemProxyManager.ProxyKey(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for UINavigationItemProxyManager.ProxyKey(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)__n128 result = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UINavigationItemProxyManager.ProxyKey()
{
  return &type metadata for UINavigationItemProxyManager.ProxyKey;
}

unint64_t sub_25A15BEB4()
{
  unint64_t result = qword_26B327340;
  if (!qword_26B327340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B327340);
  }
  return result;
}

uint64_t sub_25A15BF0C()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25A15BF44()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void *sub_25A15BF8C(void *a1)
{
  return sub_25A15B750(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

char *keypath_get_selector_toolbarItems()
{
  return sel_toolbarItems;
}

uint64_t sub_25A15BFAC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25A15BFEC(unint64_t *a1)
{
  sub_25A15BA04(a1, *(id *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_25A15BFF4(unint64_t *a1, uint64_t *a2)
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

id sub_25A15C044(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_25A160A40();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_25A160A40();
    swift_bridgeObjectRelease();
    if (v5 == v29) {
      goto LABEL_5;
    }
LABEL_49:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  if (v5 != *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_49;
  }
LABEL_5:
  if (!v5) {
    goto LABEL_38;
  }
  uint64_t v6 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0) {
    uint64_t v6 = v3;
  }
  if (!v4) {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  }
  uint64_t v7 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v8 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0) {
    uint64_t v9 = a2;
  }
  else {
    uint64_t v9 = a2 & 0xFFFFFFFFFFFFFF8;
  }
  if ((unint64_t)a2 >> 62) {
    uint64_t v8 = v9;
  }
  if (v6 == v8)
  {
LABEL_38:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_55;
  }
  unint64_t v30 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0) {
    goto LABEL_56;
  }
  for (id result = *(id *)(v3 + 32); ; id result = (id)MEMORY[0x25A2F6EA0](0, v3))
  {
    unint64_t v11 = result;
    if ((a2 & 0xC000000000000001) == 0) {
      break;
    }
    id v12 = (id)MEMORY[0x25A2F6EA0](0, a2);
LABEL_22:
    unsigned __int8 v13 = v12;
    sub_25A159E10(0, &qword_26B327618);
    char v14 = sub_25A160930();

    if ((v14 & 1) == 0) {
      goto LABEL_49;
    }
    unint64_t v15 = v5 - 1;
    if (v5 == 1) {
      return (id)(v5 & 1);
    }
    if (((a2 | v3) & 0xC000000000000001) != 0)
    {
      uint64_t v16 = 0;
      unint64_t v17 = v5 - 2;
      while (v15 != v16)
      {
        unint64_t v5 = v16 + 1;
        if (v30) {
          id v18 = (id)MEMORY[0x25A2F6EA0](v16 + 1, v3);
        }
        else {
          id v18 = *(id *)(v3 + 40 + 8 * v16);
        }
        uint64_t v19 = v18;
        if ((a2 & 0xC000000000000001) != 0)
        {
          id v20 = (id)MEMORY[0x25A2F6EA0](v16 + 1, a2);
        }
        else
        {
          if (v5 >= *(void *)(v7 + 16)) {
            goto LABEL_54;
          }
          id v20 = *(id *)(a2 + 40 + 8 * v16);
        }
        id v21 = v20;
        unint64_t v5 = sub_25A160930();

        if ((v5 & 1) != 0 && v17 != v16++) {
          continue;
        }
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      unint64_t v23 = *(void *)(v7 + 16);
      if (v23 <= 1) {
        unint64_t v23 = 1;
      }
      unint64_t v24 = v23 - 1;
      id v25 = (void **)(v3 + 40);
      uint64_t v7 = a2 + 40;
      while (v15)
      {
        if (!v24) {
          goto LABEL_53;
        }
        uint64_t v27 = *v25++;
        id v26 = v27;
        uint64_t v28 = *(void **)v7;
        v7 += 8;
        a2 = v26;
        uint64_t v3 = v28;
        unint64_t v5 = sub_25A160930();

        if (v5)
        {
          --v24;
          if (--v15) {
            continue;
          }
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    ;
  }
  if (*(void *)(v7 + 16))
  {
    id v12 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_25A15C330(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  unint64_t v4 = sub_25A15C3EC(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  unint64_t v6 = v4;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v2;
  uint64_t v11 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_25A15CCB4();
    uint64_t v8 = v11;
  }
  uint64_t v9 = *(void *)(*(void *)(v8 + 56) + 24 * v6);
  sub_25A15C7D0(v6, v8);
  *uint64_t v3 = v8;
  swift_bridgeObjectRelease();
  return v9;
}

unint64_t sub_25A15C3EC(uint64_t a1, uint64_t a2)
{
  sub_25A160B10();
  sub_25A160B20();
  sub_25A160B20();
  uint64_t v4 = sub_25A160B30();

  return sub_25A15CB70(a1, a2, v4);
}

unint64_t sub_25A15C46C(uint64_t a1)
{
  uint64_t v2 = sub_25A1609B0();

  return sub_25A15CBEC(a1, v2);
}

uint64_t sub_25A15C4B0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B327688);
  uint64_t result = sub_25A160A60();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v34 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v19 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v34[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v34[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
              if (v32 >= 64) {
                bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v34 = -1 << v32;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v22 = v34[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v34[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v11 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      long long v28 = *(_OWORD *)(*(void *)(v5 + 48) + 16 * v20);
      uint64_t v29 = *(void *)(v5 + 56) + 24 * v20;
      long long v35 = *(_OWORD *)v29;
      long long v36 = v28;
      uint64_t v30 = *(void *)(v29 + 16);
      if ((a2 & 1) == 0)
      {
        id v31 = (id)v35;
        swift_retain();
        swift_retain();
      }
      sub_25A160B10();
      sub_25A160B20();
      sub_25A160B20();
      uint64_t result = sub_25A160B30();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
        long long v17 = v36;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v13) >> 6;
        long long v17 = v36;
        do
        {
          if (++v15 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v26 = v15 == v25;
          if (v15 == v25) {
            unint64_t v15 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v12 + 8 * v15);
        }
        while (v27 == -1);
        unint64_t v16 = __clz(__rbit64(~v27)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_OWORD *)(*(void *)(v7 + 48) + 16 * v16) = v17;
      uint64_t v18 = *(void *)(v7 + 56) + 24 * v16;
      *(_OWORD *)uint64_t v18 = v35;
      *(void *)(v18 + 16) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_25A15C7D0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_25A1609A0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_25A160B10();
        sub_25A160B20();
        sub_25A160B20();
        uint64_t result = sub_25A160B30();
        unint64_t v10 = result & v7;
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
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = v14 + 24 * v3;
          unint64_t v16 = (long long *)(v14 + 24 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= (unint64_t)v16 + 24))
          {
            long long v9 = *v16;
            *(void *)(v15 + 16) = *((void *)v16 + 2);
            *(_OWORD *)unint64_t v15 = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    long long v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    long long v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *long long v17 = v19 & v18;
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

void sub_25A15C9B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = (void **)v6;
  uint64_t v14 = (void *)*v6;
  unint64_t v16 = sub_25A15C3EC(a4, a5);
  uint64_t v17 = v14[2];
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v20 = v15;
  uint64_t v21 = v14[3];
  if (v21 >= v19 && (a6 & 1) != 0)
  {
LABEL_7:
    uint64_t v22 = *v7;
    if (v20)
    {
LABEL_8:
      uint64_t v23 = v22[7] + 24 * v16;
      char v24 = *(void **)v23;
      swift_release();
      swift_release();

      *(void *)uint64_t v23 = a1;
      *(void *)(v23 + 8) = a2;
      *(void *)(v23 + 16) = a3;
      return;
    }
    goto LABEL_11;
  }
  if (v21 >= v19 && (a6 & 1) == 0)
  {
    sub_25A15CCB4();
    goto LABEL_7;
  }
  sub_25A15C4B0(v19, a6 & 1);
  unint64_t v25 = sub_25A15C3EC(a4, a5);
  if ((v20 & 1) != (v26 & 1))
  {
LABEL_15:
    sub_25A160AB0();
    __break(1u);
    return;
  }
  unint64_t v16 = v25;
  uint64_t v22 = *v7;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:

  sub_25A15CB1C(v16, a4, a5, a1, a2, a3, v22);
}

unint64_t sub_25A15CB1C(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  a7[(result >> 6) + 8] |= 1 << result;
  uint64_t v7 = (void *)(a7[6] + 16 * result);
  *uint64_t v7 = a2;
  v7[1] = a3;
  unint64_t v8 = (void *)(a7[7] + 24 * result);
  *unint64_t v8 = a4;
  v8[1] = a5;
  _OWORD v8[2] = a6;
  uint64_t v9 = a7[2];
  BOOL v10 = __OFADD__(v9, 1);
  uint64_t v11 = v9 + 1;
  if (v10) {
    __break(1u);
  }
  else {
    a7[2] = v11;
  }
  return result;
}

unint64_t sub_25A15CB70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t result = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = ~v5;
    do
    {
      unint64_t v8 = (uint64_t *)(*(void *)(v3 + 48) + 16 * result);
      uint64_t v10 = *v8;
      uint64_t v9 = v8[1];
      if (v10 == a1 && v9 == a2) {
        break;
      }
      unint64_t result = (result + 1) & v7;
    }
    while (((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

unint64_t sub_25A15CBEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_25A15D048(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x25A2F6E60](v9, a1);
      sub_25A159B5C((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void *sub_25A15CCB4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B327688);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A160A50();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = 24 * v15;
    uint64_t v18 = *(void *)(v2 + 56) + v17;
    uint64_t v19 = *(void *)(v18 + 16);
    long long v20 = *(_OWORD *)v18;
    *(_OWORD *)(*(void *)(v4 + 48) + v16) = *(_OWORD *)(*(void *)(v2 + 48) + v16);
    uint64_t v21 = *(void *)(v4 + 56) + v17;
    *(_OWORD *)uint64_t v21 = v20;
    *(void *)(v21 + 16) = v19;
    id v22 = (id)v20;
    swift_retain();
    unint64_t result = (void *)swift_retain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
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
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25A15CE94(void *result)
{
  if (result)
  {

    swift_release();
    return (void *)swift_release();
  }
  return result;
}

unint64_t sub_25A15CEE0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B327688);
  uint64_t v3 = (void *)sub_25A160A70();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  long long v21 = *(_OWORD *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 64);
  unint64_t result = sub_25A15C3EC(v4, v5);
  long long v8 = v21;
  if (v9)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    id v20 = (id)v8;
    swift_retain();
    swift_retain();
    return (unint64_t)v3;
  }
  uint64_t v10 = (void *)(a1 + 104);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v4;
    v11[1] = v5;
    uint64_t v12 = v3[7] + 24 * result;
    *(_OWORD *)uint64_t v12 = v8;
    *(void *)(v12 + 16) = v6;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      break;
    }
    v3[2] = v15;
    if (!--v1) {
      goto LABEL_8;
    }
    uint64_t v16 = v10 + 5;
    uint64_t v4 = *(v10 - 4);
    uint64_t v5 = *(v10 - 3);
    long long v22 = *((_OWORD *)v10 - 1);
    uint64_t v17 = *v10;
    id v18 = (id)v8;
    swift_retain();
    swift_retain();
    unint64_t result = sub_25A15C3EC(v4, v5);
    uint64_t v10 = v16;
    uint64_t v6 = v17;
    long long v8 = v22;
    if (v19) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25A15D048(uint64_t a1, uint64_t a2)
{
  return a2;
}

ValueMetadata *type metadata accessor for UINavigationItemProxyNavigationItemAdaptor()
{
  return &type metadata for UINavigationItemProxyNavigationItemAdaptor;
}

uint64_t sub_25A15D0B4()
{
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_25A162670;
  sub_25A160590();
  sub_25A160580();
  sub_25A15DE4C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B327608);
  sub_25A15DEA4();
  return sub_25A160990();
}

void sub_25A15D1D8()
{
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25A160310();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B3292B8);
  oslog = sub_25A1602F0();
  os_log_type_t v1 = sub_25A1608E0();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = swift_slowAlloc();
    uint64_t v3 = swift_slowAlloc();
    uint64_t v5 = v3;
    *(_DWORD *)uint64_t v2 = 136315394;
    sub_25A14A43C(0xD00000000000002ALL, 0x800000025A162670, &v5);
    sub_25A160960();
    *(_WORD *)(v2 + 12) = 2080;
    sub_25A14A43C(0xD000000000000022, 0x800000025A163300, &v5);
    sub_25A160960();
    _os_log_impl(&dword_25A143000, oslog, v1, "…Complete (%s.%s)", (uint8_t *)v2, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v3, -1, -1);
    MEMORY[0x25A2F7630](v2, -1, -1);
  }
  else
  {
  }
}

void sub_25A15D3C0(void *a1)
{
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25A160310();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B3292B8);
  uint64_t v3 = sub_25A1602F0();
  os_log_type_t v4 = sub_25A1608E0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v13 = v6;
    *(_DWORD *)uint64_t v5 = 136315394;
    sub_25A14A43C(0xD00000000000002ALL, 0x800000025A162670, &v13);
    sub_25A160960();
    *(_WORD *)(v5 + 12) = 2080;
    sub_25A14A43C(0xD000000000000022, 0x800000025A163300, &v13);
    sub_25A160960();
    _os_log_impl(&dword_25A143000, v3, v4, "Start (%s.%s)…", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v6, -1, -1);
    MEMORY[0x25A2F7630](v5, -1, -1);
  }

  unint64_t v7 = a1;
  long long v8 = sub_25A1602F0();
  os_log_type_t v9 = sub_25A1608E0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 141558275;
    uint64_t v13 = 1752392040;
    sub_25A160960();
    *(_WORD *)(v10 + 12) = 2113;
    uint64_t v13 = (uint64_t)v7;
    uint64_t v12 = v7;
    sub_25A160960();
    *uint64_t v11 = v7;

    _os_log_impl(&dword_25A143000, v8, v9, "Update Navigation Item for %{private,mask.hash}@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B327680);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v11, -1, -1);
    MEMORY[0x25A2F7630](v10, -1, -1);
  }
  else
  {

    long long v8 = v7;
  }

  sub_25A15D1D8();
}

void sub_25A15D6C0(void *a1, void *a2)
{
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25A160310();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B3292B8);
  id v5 = a1;
  id v6 = a2;
  id v15 = v5;
  id v7 = v6;
  long long v8 = sub_25A1602F0();
  os_log_type_t v9 = sub_25A1608E0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v16 = v14;
    *(_DWORD *)uint64_t v10 = 136316419;
    sub_25A14A43C(0xD00000000000002ALL, 0x800000025A162670, &v16);
    sub_25A160960();
    *(_WORD *)(v10 + 12) = 2080;
    sub_25A14A43C(0xD000000000000022, 0x800000025A1632D0, &v16);
    sub_25A160960();
    *(_WORD *)(v10 + 22) = 2160;
    sub_25A160960();
    *(_WORD *)(v10 + 32) = 2113;
    id v12 = v15;
    sub_25A160960();
    *uint64_t v11 = v15;

    *(_WORD *)(v10 + 42) = 2160;
    sub_25A160960();
    *(_WORD *)(v10 + 52) = 2113;
    id v13 = v7;
    sub_25A160960();
    v11[1] = v7;

    _os_log_impl(&dword_25A143000, v8, v9, "…Complete (%s.%s) viewController: %{private,mask.hash}@, child: %{private,mask.hash}@", (uint8_t *)v10, 0x3Eu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B327680);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v11, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v14, -1, -1);
    MEMORY[0x25A2F7630](v10, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_25A15DA0C(void *a1, void *a2)
{
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25A160310();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B3292B8);
  id v5 = a1;
  id v6 = a2;
  id v7 = v5;
  id v8 = v6;
  os_log_type_t v9 = sub_25A1602F0();
  os_log_type_t v10 = sub_25A1608E0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    id v12 = (void *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = v20;
    *(_DWORD *)uint64_t v11 = 136316419;
    sub_25A14A43C(0xD00000000000002ALL, 0x800000025A162670, &v21);
    sub_25A160960();
    *(_WORD *)(v11 + 12) = 2080;
    sub_25A14A43C(0xD000000000000022, 0x800000025A1632D0, &v21);
    sub_25A160960();
    *(_WORD *)(v11 + 22) = 2160;
    sub_25A160960();
    *(_WORD *)(v11 + 32) = 2113;
    id v13 = v7;
    sub_25A160960();
    void *v12 = v7;

    *(_WORD *)(v11 + 42) = 2160;
    sub_25A160960();
    *(_WORD *)(v11 + 52) = 2113;
    id v14 = v8;
    sub_25A160960();
    v12[1] = v8;

    _os_log_impl(&dword_25A143000, v9, v10, "Start (%s.%s) viewController: %{private,mask.hash}@, child: %{private,mask.hash}@…", (uint8_t *)v11, 0x3Eu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B327680);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v12, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25A2F7630](v20, -1, -1);
    MEMORY[0x25A2F7630](v11, -1, -1);
  }
  else
  {
  }
  id v15 = objc_msgSend(v7, sel_childViewControllers);
  sub_25A15DE0C();
  unint64_t v16 = sub_25A160830();

  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_25A160A40();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v17)
  {
    if (v7 == v8)
    {
      uint64_t v18 = 1;
      id v8 = v7;
      goto LABEL_15;
    }
    if (qword_26B327350 != -1) {
      swift_once();
    }
    sub_25A15B0E4(v8, v7);
  }
  uint64_t v18 = 0;
LABEL_15:
  sub_25A15D6C0(v7, v8);
  return v18;
}

unint64_t sub_25A15DE0C()
{
  unint64_t result = qword_26B327620;
  if (!qword_26B327620)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B327620);
  }
  return result;
}

unint64_t sub_25A15DE4C()
{
  unint64_t result = qword_26B327588;
  if (!qword_26B327588)
  {
    sub_25A1605A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B327588);
  }
  return result;
}

unint64_t sub_25A15DEA4()
{
  unint64_t result = qword_26B327610;
  if (!qword_26B327610)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B327608);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B327610);
  }
  return result;
}

void PSViewController.register(_:url:undoAction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v26 = a1;
  uint64_t v27 = a2;
  uint64_t v5 = sub_25A160200();
  uint64_t v25 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25A160150();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25A160740();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v31 = &type metadata for SettingsAppFeatureFlags;
  unint64_t v32 = sub_25A15E27C();
  v30[0] = 0;
  char v16 = sub_25A160280();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v30);
  if (v16)
  {
    id v17 = objc_msgSend(v4, sel_undoManager);
    if (v17)
    {
      uint64_t v18 = v17;
      swift_getObjectType();
      if (swift_conformsToProtocol2()) {
        char v19 = v18;
      }
      else {
        char v19 = 0;
      }
      if (v19)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v26, v8);
        (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v7, v27, v5);
        id v20 = v18;
        swift_retain();
        sub_25A160750();
        sub_25A160890();

        (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
        return;
      }
    }
    if (qword_26A408C50 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_25A160310();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A409670);
    long long v22 = sub_25A1602F0();
    os_log_type_t v23 = sub_25A1608A0();
    if (os_log_type_enabled(v22, v23))
    {
      unint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v24 = 0;
      _os_log_impl(&dword_25A143000, v22, v23, "UndoManager that for Settings unavailable.", v24, 2u);
      MEMORY[0x25A2F7630](v24, -1, -1);
    }
  }
}

unint64_t sub_25A15E27C()
{
  unint64_t result = qword_26A408F08;
  if (!qword_26A408F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A408F08);
  }
  return result;
}

uint64_t sub_25A15E2D0(void *a1, uint64_t a2, void *a3, uint64_t a4, const void *a5)
{
  uint64_t v8 = sub_25A160150();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25A160200();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v16 = _Block_copy(a5);
  sub_25A1601D0();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  v21[3] = sub_25A145D6C();
  v21[0] = a3;
  id v18 = a3;
  id v19 = a1;
  sub_25A160140();
  PSViewController.register(_:url:undoAction:)((uint64_t)v11, (uint64_t)v15, (uint64_t)sub_25A15E514, v17);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_25A15E4DC()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25A15E514()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_25A15E528()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25A15E56C()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for WeakBox()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t static NSBundle.PreferencesPluginLocation.default.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A15ED90(&qword_26B327648, (uint64_t)qword_26B327628, a1);
}

id static NSBundle.preferencesPlugin(name:location:)()
{
  return sub_25A15F328();
}

uint64_t sub_25A15E62C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327298);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25A160170();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for NSBundle.PreferencesPluginLocation();
  __swift_allocate_value_buffer(v7, qword_26B327628);
  __swift_project_value_buffer(v7, (uint64_t)qword_26B327628);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F06E30], v3);
  uint64_t v8 = sub_25A160200();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v2, 1, 1, v8);
  return sub_25A1601F0();
}

uint64_t type metadata accessor for NSBundle.PreferencesPluginLocation()
{
  uint64_t result = qword_26B327650;
  if (!qword_26B327650) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A15E820(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NSBundle.PreferencesPluginLocation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t NSBundle.PreferencesPluginLocation.init(path:)()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327298);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v8 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25A160170();
  MEMORY[0x270FA5388](v3);
  (*(void (**)(char *, void))(v5 + 104))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F06E30]);
  uint64_t v6 = sub_25A160200();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v2, 1, 1, v6);
  return sub_25A1601F0();
}

uint64_t sub_25A15E9F8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327298);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25A160170();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for NSBundle.PreferencesPluginLocation();
  __swift_allocate_value_buffer(v7, qword_26B327270);
  __swift_project_value_buffer(v7, (uint64_t)qword_26B327270);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F06E30], v3);
  uint64_t v8 = sub_25A160200();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v2, 1, 1, v8);
  return sub_25A1601F0();
}

uint64_t static NSBundle.PreferencesPluginLocation.appleInternal.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A15ED90(&qword_26B327290, (uint64_t)qword_26B327270, a1);
}

uint64_t sub_25A15EBC4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B327298);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25A160170();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for NSBundle.PreferencesPluginLocation();
  __swift_allocate_value_buffer(v7, qword_26A408F10);
  __swift_project_value_buffer(v7, (uint64_t)qword_26A408F10);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F06E30], v3);
  uint64_t v8 = sub_25A160200();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v2, 1, 1, v8);
  return sub_25A1601F0();
}

uint64_t static NSBundle.PreferencesPluginLocation.privacy.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A15ED90(&qword_26A408C48, (uint64_t)qword_26A408F10, a1);
}

uint64_t sub_25A15ED90@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for NSBundle.PreferencesPluginLocation();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);

  return sub_25A15E820(v6, a3);
}

uint64_t NSBundle.PreferencesPluginLocation.description.getter()
{
  sub_25A1609E0();
  type metadata accessor for NSBundle.PreferencesPluginLocation();
  uint64_t v0 = sub_25A160B40();
  swift_bridgeObjectRelease();
  sub_25A160800();
  sub_25A160180();
  sub_25A160800();
  swift_bridgeObjectRelease();
  sub_25A160800();
  return v0;
}

uint64_t NSBundle.PreferencesPluginLocation.hash(into:)()
{
  sub_25A160200();
  sub_25A15F554(&qword_26A408EB8, MEMORY[0x263F06EA8]);

  return sub_25A1607C0();
}

uint64_t NSBundle.PreferencesPluginLocation.hashValue.getter()
{
  return sub_25A160B30();
}

uint64_t sub_25A15EFB8()
{
  return sub_25A160B30();
}

uint64_t sub_25A15F040()
{
  sub_25A160200();
  sub_25A15F554(&qword_26A408EB8, MEMORY[0x263F06EA8]);

  return sub_25A1607C0();
}

uint64_t sub_25A15F0C4()
{
  return sub_25A160B30();
}

uint64_t sub_25A15F154()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v0 = sub_25A160200();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = &v12[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = &v12[-v5];
  sub_25A1601A0();
  sub_25A1601B0();
  uint64_t v7 = *(void (**)(unsigned char *, uint64_t))(v1 + 8);
  v7(v4, v0);
  char v13 = 0;
  id v8 = objc_msgSend(self, sel_defaultManager);
  sub_25A1601E0();
  uint64_t v9 = (void *)sub_25A1607D0();
  swift_bridgeObjectRelease();
  unsigned __int8 v10 = objc_msgSend(v8, sel_fileExistsAtPath_isDirectory_, v9, &v13);

  v7(v6, v0);
  return (v10 & v13);
}

id sub_25A15F328()
{
  uint64_t v0 = sub_25A160200();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v13 - v5;
  sub_25A1601A0();
  id v7 = v4;
  sub_25A1601B0();
  id v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  if ((sub_25A15F154() & 1) != 0
    && (id v9 = objc_allocWithZone(MEMORY[0x263F086E0]),
        unsigned __int8 v10 = (void *)sub_25A160190(),
        id v7 = objc_msgSend(v9, sel_initWithURL_, v10),
        v10,
        v7))
  {
    v8(v6, v0);
  }
  else
  {
    sub_25A159DBC();
    swift_allocError();
    *uint64_t v11 = 0;
    swift_willThrow();
    v8(v6, v0);
  }
  return v7;
}

uint64_t sub_25A15F50C()
{
  return sub_25A15F554(&qword_26A408F28, (void (*)(uint64_t))type metadata accessor for NSBundle.PreferencesPluginLocation);
}

uint64_t sub_25A15F554(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t _s25PreferencesPluginLocationVwCP(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A160200();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t _s25PreferencesPluginLocationVwxx(uint64_t a1)
{
  uint64_t v2 = sub_25A160200();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t _s25PreferencesPluginLocationVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A160200();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t _s25PreferencesPluginLocationVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A160200();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t _s25PreferencesPluginLocationVwtk(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A160200();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t _s25PreferencesPluginLocationVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A160200();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t _s25PreferencesPluginLocationVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A15F810);
}

uint64_t sub_25A15F810(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A160200();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t _s25PreferencesPluginLocationVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A15F890);
}

uint64_t sub_25A15F890(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A160200();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_25A15F900()
{
  uint64_t result = sub_25A160200();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25A15F98C(uint64_t a1)
{
  return sub_25A15F9F4(a1, qword_26A409670);
}

uint64_t sub_25A15F9AC(uint64_t a1)
{
  return sub_25A15F9F4(a1, qword_26A409688);
}

uint64_t sub_25A15F9D0(uint64_t a1)
{
  return sub_25A15F9F4(a1, qword_26B3292B8);
}

uint64_t sub_25A15F9F4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_25A160310();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  swift_bridgeObjectRetain();
  return sub_25A160300();
}

uint64_t sub_25A15FA7C()
{
  uint64_t v0 = sub_25A160310();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25A1602E0();
  __swift_allocate_value_buffer(v4, qword_26B3292D0);
  __swift_project_value_buffer(v4, (uint64_t)qword_26B3292D0);
  if (qword_26B327570 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_26B3292B8);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_25A1602C0();
}

uint64_t sub_25A15FBB8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25A15FC08()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for OnceClosure()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t PreferencesPluginError.description.getter()
{
  unint64_t result = 0xD00000000000002ELL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 2:
      unint64_t result = 0xD000000000000024;
      break;
    case 3:
      unint64_t result = 0xD000000000000042;
      break;
    default:
      return result;
  }
  return result;
}

BOOL static PreferencesPluginError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PreferencesPluginError.hash(into:)()
{
  return sub_25A160B20();
}

uint64_t PreferencesPluginError.hashValue.getter()
{
  return sub_25A160B30();
}

BOOL sub_25A15FD74(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_25A15FD8C()
{
  unint64_t result = qword_26A408F40;
  if (!qword_26A408F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A408F40);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PreferencesPluginError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PreferencesPluginError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A15FF50);
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

unsigned char *sub_25A15FF78(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PreferencesPluginError()
{
  return &type metadata for PreferencesPluginError;
}

unsigned char *storeEnumTagSinglePayload for SettingsAppFeatureFlags(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A16005CLL);
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

ValueMetadata *type metadata accessor for SettingsAppFeatureFlags()
{
  return &type metadata for SettingsAppFeatureFlags;
}

unint64_t sub_25A160098()
{
  unint64_t result = qword_26A408F48;
  if (!qword_26A408F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A408F48);
  }
  return result;
}

const char *sub_25A1600EC()
{
  return "SettingsApp";
}

const char *sub_25A160100()
{
  if (*v0) {
    return "ZeroKeywordSearch";
  }
  else {
    return "SettingsUndo";
  }
}

uint64_t sub_25A160130()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25A160140()
{
  return MEMORY[0x270EEF848]();
}

uint64_t sub_25A160150()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_25A160160()
{
  return MEMORY[0x270EEFBA8]();
}

uint64_t sub_25A160170()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_25A160180()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_25A160190()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25A1601A0()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_25A1601B0()
{
  return MEMORY[0x270EEFD90]();
}

uint64_t sub_25A1601C0()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_25A1601D0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25A1601E0()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_25A1601F0()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_25A160200()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t _s19PreferencesExtended21SettingsAnyViewRecipeV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_25A160220()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25A160230()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25A160240()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_25A160250()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_25A160260()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_25A160270()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_25A160280()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_25A160290()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_25A1602A0()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_25A1602B0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25A1602C0()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_25A1602D0()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_25A1602E0()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_25A1602F0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25A160300()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25A160310()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25A160330()
{
  return MEMORY[0x270F81A48]();
}

uint64_t sub_25A160340()
{
  return MEMORY[0x270F81A58]();
}

uint64_t sub_25A160350()
{
  return MEMORY[0x270F81B20]();
}

uint64_t sub_25A160360()
{
  return MEMORY[0x270F81B28]();
}

uint64_t sub_25A160370()
{
  return MEMORY[0x270F81B30]();
}

uint64_t sub_25A160380()
{
  return MEMORY[0x270F81B38]();
}

uint64_t sub_25A160390()
{
  return MEMORY[0x270F81B40]();
}

uint64_t sub_25A1603A0()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_25A1603B0()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_25A1603C0()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_25A1603E0()
{
  return MEMORY[0x270EFFB38]();
}

uint64_t sub_25A1603F0()
{
  return MEMORY[0x270EFFB40]();
}

uint64_t sub_25A160400()
{
  return MEMORY[0x270EFFB48]();
}

uint64_t sub_25A160410()
{
  return MEMORY[0x270EFFB50]();
}

uint64_t sub_25A160420()
{
  return MEMORY[0x270EFFB58]();
}

uint64_t sub_25A160430()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_25A160440()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_25A160450()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_25A160460()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_25A160470()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_25A160480()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_25A160490()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_25A1604A0()
{
  return MEMORY[0x270F00EF0]();
}

uint64_t sub_25A1604B0()
{
  return MEMORY[0x270F00EF8]();
}

uint64_t sub_25A1604C0()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_25A1604D0()
{
  return MEMORY[0x270F01678]();
}

uint64_t sub_25A1604E0()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_25A1604F0()
{
  return MEMORY[0x270F020B0]();
}

uint64_t sub_25A160500()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_25A160510()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_25A160520()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_25A160540()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_25A160550()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_25A160560()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_25A160580()
{
  return MEMORY[0x270F02778]();
}

uint64_t sub_25A160590()
{
  return MEMORY[0x270F02780]();
}

uint64_t sub_25A1605A0()
{
  return MEMORY[0x270F02788]();
}

uint64_t sub_25A1605B0()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_25A1605C0()
{
  return MEMORY[0x270F02990]();
}

uint64_t sub_25A1605D0()
{
  return MEMORY[0x270F02998]();
}

uint64_t sub_25A1605E0()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_25A1605F0()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_25A160600()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_25A160610()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_25A160620()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_25A160630()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_25A160640()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_25A160650()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_25A160660()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_25A160670()
{
  return MEMORY[0x270F03C90]();
}

uint64_t sub_25A160680()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_25A160690()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_25A1606A0()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_25A1606B0()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_25A1606C0()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_25A1606D0()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_25A1606E0()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_25A1606F0()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_25A160700()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_25A160710()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_25A160730()
{
  return MEMORY[0x270F5D090]();
}

uint64_t sub_25A160740()
{
  return MEMORY[0x270F5D098]();
}

uint64_t sub_25A160750()
{
  return MEMORY[0x270F5D0A0]();
}

uint64_t sub_25A160760()
{
  return MEMORY[0x270F5D0A8]();
}

uint64_t sub_25A160770()
{
  return MEMORY[0x270F5D0B0]();
}

uint64_t sub_25A160780()
{
  return MEMORY[0x270F5D0B8]();
}

uint64_t sub_25A160790()
{
  return MEMORY[0x270F5D0C0]();
}

uint64_t sub_25A1607A0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25A1607B0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25A1607C0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25A1607D0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25A1607E0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25A1607F0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25A160800()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25A160810()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25A160820()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25A160830()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25A160840()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25A160850()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_25A160860()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_25A160870()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25A160880()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25A160890()
{
  return MEMORY[0x270F5D128]();
}

uint64_t sub_25A1608A0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25A1608B0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25A1608C0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25A1608D0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25A1608E0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25A1608F0()
{
  return MEMORY[0x270F825E0]();
}

uint64_t sub_25A160900()
{
  return MEMORY[0x270F825E8]();
}

uint64_t sub_25A160910()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_25A160920()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_25A160930()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25A160940()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_25A160950()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25A160960()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25A160970()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25A160980()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25A160990()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25A1609A0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25A1609B0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25A1609C0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_25A1609D0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_25A1609E0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25A1609F0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25A160A00()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25A160A10()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25A160A20()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25A160A30()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25A160A40()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25A160A50()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25A160A60()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25A160A70()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25A160A80()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25A160A90()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25A160AA0()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_25A160AB0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25A160AC0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25A160AD0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25A160AE0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25A160AF0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25A160B00()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25A160B10()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25A160B20()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25A160B30()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25A160B40()
{
  return MEMORY[0x270FA0128]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t SFObjectAndOffsetForURLPair()
{
  return MEMORY[0x270F5D190]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastTypeToObjCProtocolConditional()
{
  return MEMORY[0x270FA02A8]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
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