id sub_26293BF74()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id result;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v1 = OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider____lazy_storage___serviceOwnersManager;
  v2 = *(void **)(v0 + OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider____lazy_storage___serviceOwnersManager);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider____lazy_storage___serviceOwnersManager);
LABEL_5:
    v8 = v2;
    return v3;
  }
  result = objc_msgSend(self, sel_defaultStore);
  if (result)
  {
    v5 = result;
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F26D88]), sel_initWithAccountStore_, result);

    v7 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v6;
    v3 = v6;

    v2 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

id iCloudCalendarUnifiedSettingsProvider.__allocating_init(accountManager:presenter:)(void *a1, void *a2)
{
  v5 = (char *)objc_allocWithZone(v2);
  *(void *)&v5[OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider_calendarSettingsProvider] = 0;
  *(void *)&v5[OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider____lazy_storage___serviceOwnersManager] = 0;
  *(void *)&v5[OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider_accountManager] = a1;
  *(void *)&v5[OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider_presenter] = a2;
  v10.receiver = v5;
  v10.super_class = v2;
  id v6 = a1;
  id v7 = a2;
  id v8 = objc_msgSendSuper2(&v10, sel_init);
  sub_26293E16C();

  return v8;
}

id iCloudCalendarUnifiedSettingsProvider.init(accountManager:presenter:)(void *a1, void *a2)
{
  *(void *)&v2[OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider_calendarSettingsProvider] = 0;
  *(void *)&v2[OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider____lazy_storage___serviceOwnersManager] = 0;
  *(void *)&v2[OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider_accountManager] = a1;
  *(void *)&v2[OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider_presenter] = a2;
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for iCloudCalendarUnifiedSettingsProvider();
  id v5 = a1;
  id v6 = a2;
  id v7 = objc_msgSendSuper2(&v9, sel_init);
  sub_26293E16C();

  return v7;
}

char *iCloudCalendarUnifiedSettingsProvider.__allocating_init(presenter:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return iCloudCalendarUnifiedSettingsProvider.init(presenter:)(a1);
}

char *iCloudCalendarUnifiedSettingsProvider.init(presenter:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider_calendarSettingsProvider] = 0;
  *(void *)&v1[OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider____lazy_storage___serviceOwnersManager] = 0;
  id v3 = self;
  v4 = v1;
  result = (char *)objc_msgSend(v3, sel_defaultStore);
  if (result)
  {
    id v6 = result;
    id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F26D70]), sel_initWithAccountStore_, result);

    *(void *)&v4[OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider_accountManager] = v7;
    *(void *)&v4[OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider_presenter] = a1;
    id v8 = a1;

    v13.receiver = v4;
    v13.super_class = (Class)type metadata accessor for iCloudCalendarUnifiedSettingsProvider();
    objc_super v9 = (char *)objc_msgSendSuper2(&v13, sel_init);
    objc_super v10 = *(void **)&v9[OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider_accountManager];
    v11 = v9;
    id v12 = v10;
    objc_msgSend(v12, sel_setDelegate_, v11);

    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_26293C340()
{
  return sub_26293C3A0(0, 0);
}

uint64_t sub_26293C3A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_26293E968();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  id v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_26293E16C();
  id v8 = (NSString *)sub_26293E988();
  Class v9 = NSClassFromString(v8);

  if (v9 && (swift_getObjCClassMetadata(), v19[1] = &unk_270DE0960, swift_dynamicCastTypeToObjCProtocolConditional()))
  {
    id v10 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithManager_presenter_, *(void *)(v2 + OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider_accountManager), *(void *)(v2 + OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider_presenter));
    uint64_t v11 = OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider_calendarSettingsProvider;
    *(void *)(v2 + OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider_calendarSettingsProvider) = v10;
    uint64_t result = swift_unknownObjectRelease();
    objc_super v13 = *(void **)(v2 + v11);
    if (v13)
    {
      swift_unknownObjectRetain();
      if (a2) {
        v14 = (void *)sub_26293E988();
      }
      else {
        v14 = 0;
      }
      objc_msgSend(v13, sel_onCalendarTapWithDeeplink_, v14);

      return swift_unknownObjectRelease();
    }
  }
  else
  {
    if (qword_26A97F7A0 != -1) {
      swift_once();
    }
    uint64_t v15 = __swift_project_value_buffer(v4, (uint64_t)qword_26A97F7A8);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v15, v4);
    v16 = sub_26293E948();
    os_log_type_t v17 = sub_26293EA08();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_26293A000, v16, v17, "[iCloudCalendarSettingsProvider] Unable to find CalendarSettingsSpecifierProvider", v18, 2u);
      MEMORY[0x263E57570](v18, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return result;
}

id iCloudCalendarUnifiedSettingsProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void iCloudCalendarUnifiedSettingsProvider.init()()
{
}

id iCloudCalendarUnifiedSettingsProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for iCloudCalendarUnifiedSettingsProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_26293C7E0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v54 = a4;
  uint64_t v55 = a5;
  uint64_t v8 = sub_26293E968();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  id v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v14 = (char *)&v52 - v13;
  id v15 = sub_26293BF74();
  id v16 = objc_msgSend(v15, sel_accountForService_, a1);

  if (!v16)
  {
    if (qword_26A97F7A0 != -1) {
      swift_once();
    }
    uint64_t v31 = __swift_project_value_buffer(v8, (uint64_t)qword_26A97F7A8);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v31, v8);
    id v32 = a1;
    v33 = sub_26293E948();
    os_log_type_t v34 = sub_26293EA08();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v55 = v8;
      v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = v9;
      uint64_t v37 = swift_slowAlloc();
      uint64_t v57 = v37;
      *(_DWORD *)v35 = 136315138;
      uint64_t v38 = sub_26293E9B8();
      uint64_t v56 = sub_26293D2CC(v38, v39, &v57);
      sub_26293EA18();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_26293A000, v33, v34, "No account exist for serviceType: %s", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E57570](v37, -1, -1);
      MEMORY[0x263E57570](v35, -1, -1);

      (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v55);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }
    return 0;
  }
  id v17 = sub_26293BF74();
  id v18 = objc_msgSend(v17, sel_altDSIDForAccount_service_, v16, a1);

  if (!v18) {
    goto LABEL_8;
  }
  v53 = v14;
  uint64_t v19 = v9;
  uint64_t v20 = v8;
  uint64_t v21 = sub_26293E9B8();
  uint64_t v23 = v22;

  if (v21 == a2 && v23 == a3) {
    goto LABEL_11;
  }
  char v25 = sub_26293EAA8();
  swift_bridgeObjectRelease();
  uint64_t v8 = v20;
  uint64_t v9 = v19;
  v14 = v53;
  if ((v25 & 1) == 0)
  {
LABEL_8:
    id v26 = sub_26293BF74();
    id v27 = objc_msgSend(v26, sel_DSIDForAccount_service_, v16, a1);

    if (v27)
    {
      uint64_t v28 = sub_26293E9B8();
      uint64_t v30 = v29;

      if (v28 == v54 && v30 == v55)
      {
LABEL_11:
        swift_bridgeObjectRelease();
        return v16;
      }
      char v40 = sub_26293EAA8();
      swift_bridgeObjectRelease();
      if (v40) {
        return v16;
      }
    }
    if (qword_26A97F7A0 != -1) {
      swift_once();
    }
    uint64_t v41 = __swift_project_value_buffer(v8, (uint64_t)qword_26A97F7A8);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v14, v41, v8);
    id v42 = a1;
    v43 = sub_26293E948();
    uint64_t v44 = v9;
    os_log_type_t v45 = sub_26293EA08();
    if (os_log_type_enabled(v43, v45))
    {
      v53 = v14;
      v46 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      uint64_t v55 = v8;
      uint64_t v48 = v47;
      uint64_t v57 = v47;
      *(_DWORD *)v46 = 136315138;
      uint64_t v49 = sub_26293E9B8();
      uint64_t v56 = sub_26293D2CC(v49, v50, &v57);
      sub_26293EA18();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_26293A000, v43, v45, "No matching account found for serviceType: %s", v46, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E57570](v48, -1, -1);
      MEMORY[0x263E57570](v46, -1, -1);

      (*(void (**)(char *, uint64_t))(v44 + 8))(v53, v55);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v44 + 8))(v14, v8);
    }
    return 0;
  }
  return v16;
}

uint64_t sub_26293CE40()
{
  uint64_t v0 = sub_26293E968();
  __swift_allocate_value_buffer(v0, qword_26A97F7A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A97F7A8);
  return sub_26293E958();
}

uint64_t sub_26293CEBC(uint64_t a1, uint64_t a2)
{
  return sub_26293CFB4(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_26293CED4()
{
  sub_26293E9B8();
  sub_26293E9C8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_26293CF28()
{
  sub_26293E9B8();
  sub_26293EAC8();
  sub_26293E9C8();
  uint64_t v0 = sub_26293EAD8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_26293CF9C(uint64_t a1, uint64_t a2)
{
  return sub_26293CFB4(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_26293CFB4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_26293E9B8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_26293CFF8(uint64_t a1, id *a2)
{
  uint64_t result = sub_26293E998();
  *a2 = 0;
  return result;
}

uint64_t sub_26293D070(uint64_t a1, id *a2)
{
  char v3 = sub_26293E9A8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_26293D0F0@<X0>(uint64_t *a1@<X8>)
{
  sub_26293E9B8();
  uint64_t v2 = sub_26293E988();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_26293D134()
{
  uint64_t v0 = sub_26293E9B8();
  uint64_t v2 = v1;
  if (v0 == sub_26293E9B8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_26293EAA8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_26293D1C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_26293E988();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_26293D208@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_26293E9B8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_26293D234(uint64_t a1)
{
  uint64_t v2 = sub_26293E904(&qword_26A97F700);
  uint64_t v3 = sub_26293E904(&qword_26A97F738);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_26293D2CC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_26293D3A0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_26293E760((uint64_t)v12, *a3);
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
      sub_26293E760((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_26293D3A0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_26293EA28();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_26293D55C(a5, a6);
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
  uint64_t v8 = sub_26293EA48();
  if (!v8)
  {
    sub_26293EA58();
    __break(1u);
LABEL_17:
    uint64_t result = sub_26293EA88();
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

uint64_t sub_26293D55C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_26293D5F4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_26293D7D4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_26293D7D4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_26293D5F4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_26293D76C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_26293EA38();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_26293EA58();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_26293E9E8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_26293EA88();
    __break(1u);
LABEL_14:
    uint64_t result = sub_26293EA58();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_26293D76C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97F708);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_26293D7D4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A97F708);
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
  uint64_t result = sub_26293EA88();
  __break(1u);
  return result;
}

unint64_t sub_26293D924(uint64_t a1)
{
  sub_26293E9B8();
  sub_26293EAC8();
  sub_26293E9C8();
  uint64_t v2 = sub_26293EAD8();
  swift_bridgeObjectRelease();
  return sub_26293DE4C(a1, v2);
}

uint64_t sub_26293D9B8(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97F710);
  char v39 = a2;
  uint64_t v6 = sub_26293EA78();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v38 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v36 = v2;
  int64_t v37 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v13;
    if (!v24)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v13);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          unint64_t v3 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v13 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v13);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    id v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((v39 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    sub_26293E9B8();
    sub_26293EAC8();
    sub_26293E9C8();
    uint64_t v14 = sub_26293EAD8();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = v14 & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v11 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v36;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

void sub_26293DCE8(uint64_t a1, void *a2, char a3)
{
  unint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_26293D924((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_26293DFC4();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];

      *(void *)(v16 + 8 * v9) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_26293D9B8(v12, a3 & 1);
  unint64_t v17 = sub_26293D924((uint64_t)a2);
  if ((v13 & 1) != (v18 & 1))
  {
LABEL_17:
    type metadata accessor for AIDAServiceType();
    sub_26293EAB8();
    __break(1u);
    return;
  }
  unint64_t v9 = v17;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v19 = 8 * v9;
  *(void *)(v15[6] + v19) = a2;
  *(void *)(v15[7] + v19) = a1;
  uint64_t v20 = v15[2];
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v22;
  id v23 = a2;
}

unint64_t sub_26293DE4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_26293E9B8();
    uint64_t v8 = v7;
    if (v6 == sub_26293E9B8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_26293EAA8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_26293E9B8();
          uint64_t v15 = v14;
          if (v13 == sub_26293E9B8() && v15 == v16) {
            break;
          }
          char v18 = sub_26293EAA8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

id sub_26293DFC4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97F710);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_26293EA68();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    char v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_26293E16C()
{
  uint64_t v0 = NSOpenStepRootDirectory();
  sub_26293E9B8();

  swift_bridgeObjectRetain();
  sub_26293E9F8();
  sub_26293E9D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_26293E9F8();
  uint64_t v6 = v1;
  sub_26293E9D8();
  swift_bridgeObjectRelease();
  id v2 = objc_allocWithZone(MEMORY[0x263F086E0]);
  uint64_t v3 = (void *)sub_26293E988();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_initWithPath_, v3, v5, v6, 0xD00000000000001DLL, 0x800000026293F540);

  if (!v4 || (objc_msgSend(v4, sel_isLoaded) & 1) == 0) {
    objc_msgSend(v4, sel_load);
  }
}

uint64_t type metadata accessor for iCloudCalendarUnifiedSettingsProvider()
{
  return self;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t _s29iCloudCalendarUnifiedSettings01iabcD8ProviderC8accounts3forSDySo15AIDAServiceTypeaSo9ACAccountCGSo18AIDAAccountManagerC_tF_0()
{
  id v0 = sub_26293BF74();
  uint64_t v1 = (void *)*MEMORY[0x263F26D28];
  id v2 = objc_msgSend(v0, sel_accountForService_, *MEMORY[0x263F26D28]);

  uint64_t v3 = MEMORY[0x263F8EE80];
  if (v2)
  {
    id v4 = v1;
    id v5 = v2;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_26293DCE8((uint64_t)v5, v4, isUniquelyReferenced_nonNull_native);

    swift_bridgeObjectRelease();
    id v7 = sub_26293BF74();
    id v8 = objc_msgSend(v7, sel_altDSIDForAccount_service_, v5, v4);

    if (v8)
    {
      uint64_t v9 = sub_26293E9B8();
      uint64_t v11 = v10;

      id v12 = sub_26293BF74();
      id v13 = objc_msgSend(v12, sel_DSIDForAccount_service_, v5, v4);

      if (v13)
      {
        uint64_t v14 = sub_26293E9B8();
        uint64_t v16 = v15;

        unint64_t v17 = (void *)*MEMORY[0x263F26D38];
        id v18 = sub_26293C7E0((void *)*MEMORY[0x263F26D38], v9, v11, v14, v16);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v18)
        {
          id v19 = v17;
          id v20 = v18;
          char v21 = swift_isUniquelyReferenced_nonNull_native();
          sub_26293DCE8((uint64_t)v20, v19, v21);

          swift_bridgeObjectRelease();
          goto LABEL_8;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
LABEL_8:
  id v22 = sub_26293BF74();
  id v23 = (void *)*MEMORY[0x263F26D48];
  id v24 = objc_msgSend(v22, sel_accountForService_, *MEMORY[0x263F26D48]);

  if (v24)
  {
    id v25 = v23;
    id v26 = v24;
    char v27 = swift_isUniquelyReferenced_nonNull_native();
    sub_26293DCE8((uint64_t)v26, v25, v27);

    swift_bridgeObjectRelease();
  }
  return v3;
}

uint64_t method lookup function for iCloudCalendarUnifiedSettingsProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for iCloudCalendarUnifiedSettingsProvider);
}

uint64_t dispatch thunk of iCloudCalendarUnifiedSettingsProvider.__allocating_init(accountManager:presenter:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of iCloudCalendarUnifiedSettingsProvider.__allocating_init(presenter:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of iCloudCalendarUnifiedSettingsProvider.navigateToiCloudCalendarSettings()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of iCloudCalendarUnifiedSettingsProvider.navigateToiCloudCalendarSettings(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

void type metadata accessor for AIDAServiceType()
{
  if (!qword_26A97F718)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A97F718);
    }
  }
}

unint64_t sub_26293E6D0()
{
  unint64_t result = qword_26A97F6F8;
  if (!qword_26A97F6F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A97F6F8);
  }
  return result;
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

uint64_t sub_26293E760(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_26293E868()
{
  return sub_26293E904(&qword_26A97F720);
}

uint64_t sub_26293E89C()
{
  return sub_26293E904(&qword_26A97F728);
}

uint64_t sub_26293E8D0()
{
  return sub_26293E904(&qword_26A97F730);
}

uint64_t sub_26293E904(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AIDAServiceType();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_26293E948()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_26293E958()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_26293E968()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_26293E978()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_26293E988()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_26293E998()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_26293E9A8()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_26293E9B8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_26293E9C8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_26293E9D8()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_26293E9E8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_26293E9F8()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_26293EA08()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_26293EA18()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_26293EA28()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_26293EA38()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_26293EA48()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_26293EA58()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_26293EA68()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_26293EA78()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_26293EA88()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_26293EAA8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_26293EAB8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_26293EAC8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_26293EAD8()
{
  return MEMORY[0x270F9FC90]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *NSOpenStepRootDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2B68]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_dynamicCastTypeToObjCProtocolConditional()
{
  return MEMORY[0x270FA02A8]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}