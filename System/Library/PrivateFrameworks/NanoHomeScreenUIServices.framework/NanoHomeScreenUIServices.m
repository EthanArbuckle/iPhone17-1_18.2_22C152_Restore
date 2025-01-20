__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_257332F2C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_257332F4C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)result = (a2 - 1);
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

void *sub_257332F88@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_257332F94()
{
  return sub_257338670();
}

uint64_t sub_257332FDC()
{
  return sub_257338660();
}

uint64_t sub_257333008()
{
  return sub_257338670();
}

void *sub_25733304C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_257333060(void *result)
{
  *v1 &= *result;
  return result;
}

BOOL sub_257333074(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_257333088(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_25733309C(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_2573330B0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_2573330C0(void *a1@<X8>)
{
  *a1 = *v1;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void type metadata accessor for CLKDeviceSizeClass(uint64_t a1)
{
}

void sub_2573330F4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_257333140()
{
  unint64_t result = qword_269FE7B10;
  if (!qword_269FE7B10)
  {
    type metadata accessor for CLKDeviceSizeClass(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE7B10);
  }
  return result;
}

id sub_2573331A0()
{
  type metadata accessor for SmartStackSuggestionSettingsWidgetProvider();
  swift_allocObject();
  id result = sub_25733326C();
  qword_269FE7B20 = (uint64_t)result;
  return result;
}

id sub_2573331DC()
{
  return sub_25733326C();
}

uint64_t static SmartStackSuggestionSettingsWidgetProvider.shared.getter()
{
  if (qword_269FE7AE0 != -1) {
    swift_once();
  }
  return swift_retain();
}

id sub_25733326C()
{
  ObjectType = (objc_class *)swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE7B98);
  MEMORY[0x270FA5388]();
  char v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  uint64_t v4 = self;
  swift_retain();
  v0[14] = objc_msgSend(v4, sel_weakObjectsHashTable);
  v0[15] = 0;
  swift_release();
  v10.receiver = v0;
  v10.super_class = ObjectType;
  id v5 = objc_msgSendSuper2(&v10, sel_init);
  uint64_t v6 = sub_257338530();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v3, 1, 1, v6);
  v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v5;
  id v8 = v5;
  sub_257333494((uint64_t)v3, (uint64_t)&unk_269FE7BA8, (uint64_t)v7);
  swift_release();
  return v8;
}

uint64_t sub_2573333D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_2573333F8, a4, 0);
}

uint64_t sub_2573333F8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F31EB0]), sel_initIncludingIntents_, 1);
  char v3 = *(void **)(v1 + 120);
  *(void *)(v1 + 120) = v2;

  uint64_t v4 = *(void **)(v1 + 120);
  if (v4) {
    objc_msgSend(v4, sel_registerObserver_, *(void *)(v0 + 16));
  }
  id v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_257333494(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_257338530();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_257338520();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2573366F8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2573384F0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_25733365C()
{
  id v1 = objc_msgSend(*(id *)(v0 + 112), sel_allObjects);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269FE7C30);
  unint64_t v2 = sub_2573384A0();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2573385D0();
    swift_bridgeObjectRelease();
    if (!v3) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v3) {
      goto LABEL_10;
    }
  }
  if (v3 < 1)
  {
    __break(1u);
    return;
  }
  for (uint64_t i = 0; i != v3; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0)
    {
      id v5 = (void *)MEMORY[0x25A2B4270](i, v2);
    }
    else
    {
      id v5 = *(void **)(v2 + 8 * i + 32);
      swift_unknownObjectRetain();
    }
    objc_msgSend(v5, sel_widgetProviderDidUpdateWithProvider_, v0);
    swift_unknownObjectRelease();
  }
LABEL_10:
  swift_bridgeObjectRelease();
}

unint64_t sub_257333788(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE7BD0);
  unint64_t v2 = (void *)sub_257338600();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_2573375A0(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    objc_super v10 = (uint64_t *)(v2[6] + 16 * result);
    *objc_super v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
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

uint64_t sub_2573338A4(uint64_t a1)
{
  uint64_t v1 = a1;
  v46 = (void *)MEMORY[0x263F8EE80];
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_257338580();
    sub_257338570();
    sub_257336574();
    sub_257338550();
    uint64_t v1 = v41;
    uint64_t v38 = v42;
    uint64_t v2 = v43;
    uint64_t v3 = v44;
    unint64_t v4 = v45;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v38 = a1 + 56;
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
  }
  uint64_t v36 = v2;
  int64_t v37 = (unint64_t)(v2 + 64) >> 6;
  uint64_t v8 = (void *)MEMORY[0x263F8EE80];
  for (i = v1; ; uint64_t v1 = i)
  {
    if (v1 < 0)
    {
      if (!sub_257338590()) {
        goto LABEL_46;
      }
      sub_257338570();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v14 = v40;
      swift_unknownObjectRelease();
      uint64_t v13 = v3;
      uint64_t v11 = v4;
      if (!v40) {
        goto LABEL_46;
      }
    }
    else
    {
      if (v4)
      {
        uint64_t v11 = (v4 - 1) & v4;
        unint64_t v12 = __clz(__rbit64(v4)) | (v3 << 6);
        uint64_t v13 = v3;
      }
      else
      {
        int64_t v15 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_49;
        }
        if (v15 >= v37) {
          goto LABEL_46;
        }
        unint64_t v16 = *(void *)(v38 + 8 * v15);
        uint64_t v13 = v3 + 1;
        if (!v16)
        {
          uint64_t v13 = v3 + 2;
          if (v3 + 2 >= v37) {
            goto LABEL_46;
          }
          unint64_t v16 = *(void *)(v38 + 8 * v13);
          if (!v16)
          {
            uint64_t v13 = v3 + 3;
            if (v3 + 3 >= v37) {
              goto LABEL_46;
            }
            unint64_t v16 = *(void *)(v38 + 8 * v13);
            if (!v16)
            {
              uint64_t v13 = v3 + 4;
              if (v3 + 4 >= v37) {
                goto LABEL_46;
              }
              unint64_t v16 = *(void *)(v38 + 8 * v13);
              if (!v16)
              {
                uint64_t v13 = v3 + 5;
                if (v3 + 5 >= v37) {
                  goto LABEL_46;
                }
                unint64_t v16 = *(void *)(v38 + 8 * v13);
                if (!v16)
                {
                  uint64_t v17 = v3 + 6;
                  while (v37 != v17)
                  {
                    unint64_t v16 = *(void *)(v38 + 8 * v17++);
                    if (v16)
                    {
                      uint64_t v13 = v17 - 1;
                      goto LABEL_33;
                    }
                  }
LABEL_46:
                  sub_257336914();
                  return (uint64_t)v46;
                }
              }
            }
          }
        }
LABEL_33:
        uint64_t v11 = (v16 - 1) & v16;
        unint64_t v12 = __clz(__rbit64(v16)) + (v13 << 6);
      }
      id v14 = *(id *)(*(void *)(v1 + 48) + 8 * v12);
      if (!v14) {
        goto LABEL_46;
      }
    }
    id v18 = objc_msgSend(v14, sel_containerBundleIdentifier, v36);
    unint64_t v19 = sub_257338470();
    uint64_t v21 = v20;

    if (v19 == 0xD00000000000001FLL && v21 == 0x80000002573396F0 || (sub_257338630() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v21 = 0x8000000257339710;
      unint64_t v19 = 0xD000000000000016;
    }
    unint64_t v23 = sub_2573375A0(v19, v21);
    uint64_t v24 = v8[2];
    BOOL v25 = (v22 & 1) == 0;
    uint64_t v26 = v24 + v25;
    if (__OFADD__(v24, v25)) {
      break;
    }
    char v27 = v22;
    if (v8[3] < v26)
    {
      sub_2573376B0(v26, 1);
      uint64_t v8 = v46;
      unint64_t v28 = sub_2573375A0(v19, v21);
      if ((v27 & 1) != (v29 & 1)) {
        goto LABEL_50;
      }
      unint64_t v23 = v28;
    }
    if (v27)
    {
      uint64_t v9 = swift_bridgeObjectRelease();
      uint64_t v8 = v46;
      objc_super v10 = (void *)(v46[7] + 8 * v23);
      MEMORY[0x25A2B4160](v9);
      if (*(void *)((*v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_2573384C0();
      }
      sub_2573384E0();
      sub_2573384B0();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269FE7BF8);
      uint64_t v30 = swift_allocObject();
      *(_OWORD *)(v30 + 16) = xmmword_257338BF0;
      *(void *)(v30 + 32) = v14;
      v40 = (void *)v30;
      sub_2573384B0();
      v8[(v23 >> 6) + 8] |= 1 << v23;
      v31 = (unint64_t *)(v8[6] + 16 * v23);
      unint64_t *v31 = v19;
      v31[1] = v21;
      *(void *)(v8[7] + 8 * v23) = v40;
      uint64_t v32 = v8[2];
      BOOL v33 = __OFADD__(v32, 1);
      uint64_t v34 = v32 + 1;
      if (v33) {
        goto LABEL_48;
      }
      v8[2] = v34;
    }
    uint64_t v3 = v13;
    unint64_t v4 = v11;
  }
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  uint64_t result = sub_257338640();
  __break(1u);
  return result;
}

uint64_t sub_257333D60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_257333D80, 0, 0);
}

uint64_t sub_257333D80()
{
  sub_257338510();
  *(void *)(v0 + 24) = sub_257338500();
  uint64_t v2 = sub_2573384F0();
  return MEMORY[0x270FA2498](sub_257333E14, v2, v1);
}

uint64_t sub_257333E14()
{
  swift_release();
  sub_25733365C();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t SmartStackSuggestionSettingsWidgetProvider.sortedWidgetDescriptors()()
{
  uint64_t v18 = MEMORY[0x263F8EE78];
  uint64_t v1 = *(void **)(v0 + 120);
  if (v1)
  {
    id v2 = objc_msgSend(v1, sel_containers);
    sub_257338570();
    sub_257336574();
    uint64_t v3 = sub_257338540();

    uint64_t v4 = sub_2573338A4(v3);
    uint64_t v5 = sub_257334870(v4);
    unint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t result = sub_257333788(MEMORY[0x263F8EE78]);
    uint64_t v5 = result;
  }
  int64_t v7 = 0;
  uint64_t v8 = v5 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  uint64_t v11 = v10 & *(void *)(v5 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      v11 &= v11 - 1;
      goto LABEL_8;
    }
    if (__OFADD__(v7++, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v7 >= v12) {
      goto LABEL_25;
    }
    uint64_t v16 = *(void *)(v8 + 8 * v7);
    if (!v16) {
      break;
    }
LABEL_20:
    uint64_t v11 = (v16 - 1) & v16;
LABEL_8:
    unint64_t v13 = swift_bridgeObjectRetain();
    unint64_t v14 = sub_2573340A8(v13);
    swift_bridgeObjectRelease();
    unint64_t result = sub_257334448(v14);
  }
  int64_t v17 = v7 + 1;
  if (v7 + 1 >= v12) {
    goto LABEL_25;
  }
  uint64_t v16 = *(void *)(v8 + 8 * v17);
  if (v16) {
    goto LABEL_19;
  }
  int64_t v17 = v7 + 2;
  if (v7 + 2 >= v12) {
    goto LABEL_25;
  }
  uint64_t v16 = *(void *)(v8 + 8 * v17);
  if (v16) {
    goto LABEL_19;
  }
  int64_t v17 = v7 + 3;
  if (v7 + 3 >= v12)
  {
LABEL_25:
    swift_release();
    return v18;
  }
  uint64_t v16 = *(void *)(v8 + 8 * v17);
  if (v16)
  {
LABEL_19:
    int64_t v7 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v7 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v7 >= v12) {
      goto LABEL_25;
    }
    uint64_t v16 = *(void *)(v8 + 8 * v7);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_2573340A8(unint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v28 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_47;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v2)
  {
LABEL_3:
    unint64_t v3 = 0;
    uint64_t v23 = v2;
    unint64_t v24 = v1 & 0xC000000000000001;
    uint64_t v21 = v1 & 0xFFFFFFFFFFFFFF8;
    uint64_t v22 = v1;
    uint64_t v20 = v1 + 32;
    while (1)
    {
      if (v24)
      {
        id v4 = (id)MEMORY[0x25A2B4270](v3, v22);
      }
      else
      {
        if (v3 >= *(void *)(v21 + 16)) {
          goto LABEL_46;
        }
        id v4 = *(id *)(v20 + 8 * v3);
      }
      uint64_t v1 = (uint64_t)v4;
      BOOL v5 = __OFADD__(v3, 1);
      unint64_t v6 = v3 + 1;
      if (v5) {
        goto LABEL_45;
      }
      id v7 = objc_msgSend(v4, sel_localExtensions);
      sub_257336884(0, &qword_269FE7BF0);
      unint64_t v8 = sub_2573384A0();

      BOOL v25 = (void *)v1;
      unint64_t v26 = v6;
      if (!(v8 >> 62))
      {
        uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v9) {
          break;
        }
        goto LABEL_4;
      }
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_2573385D0();
      swift_bridgeObjectRelease();
      if (v9) {
        break;
      }
LABEL_4:

      swift_bridgeObjectRelease();
      unint64_t v3 = v26;
      if (v26 == v23)
      {
        swift_bridgeObjectRelease();
        return v28;
      }
    }
    unint64_t v10 = 0;
    while (1)
    {
      if ((v8 & 0xC000000000000001) != 0)
      {
        id v11 = (id)MEMORY[0x25A2B4270](v10, v8);
        BOOL v5 = __OFADD__(v10++, 1);
        if (v5) {
          goto LABEL_42;
        }
      }
      else
      {
        if (v10 >= *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_44;
        }
        id v11 = *(id *)(v8 + 32 + 8 * v10);
        BOOL v5 = __OFADD__(v10++, 1);
        if (v5)
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
LABEL_47:
          swift_bridgeObjectRetain();
          uint64_t v2 = sub_2573385D0();
          if (!v2) {
            break;
          }
          goto LABEL_3;
        }
      }
      char v27 = v11;
      id v12 = objc_msgSend(v11, sel_orderedDescriptors, v20);
      if (v12)
      {
        uint64_t v1 = (uint64_t)v12;
        sub_257336884(0, &qword_269FE7BE0);
        uint64_t v13 = sub_2573384A0();

        if (!((unint64_t)v13 >> 62)) {
          goto LABEL_22;
        }
      }
      else
      {
        uint64_t v13 = MEMORY[0x263F8EE78];
        if (!(MEMORY[0x263F8EE78] >> 62))
        {
LABEL_22:
          uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (!v14) {
            goto LABEL_13;
          }
          goto LABEL_23;
        }
      }
      if (v13 < 0) {
        uint64_t v1 = v13;
      }
      else {
        uint64_t v1 = v13 & 0xFFFFFFFFFFFFFF8;
      }
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_2573385D0();
      swift_bridgeObjectRelease();
      if (!v14) {
        goto LABEL_13;
      }
LABEL_23:
      if (v14 < 1) {
        goto LABEL_43;
      }
      for (uint64_t i = 0; i != v14; ++i)
      {
        if ((v13 & 0xC000000000000001) != 0) {
          id v16 = (id)MEMORY[0x25A2B4270](i, v13);
        }
        else {
          id v16 = *(id *)(v13 + 8 * i + 32);
        }
        int64_t v17 = v16;
        if ((objc_msgSend(v16, sel_supportedFamilies) & 0x800) != 0)
        {
          id v18 = v17;
          uint64_t v1 = (uint64_t)&v28;
          MEMORY[0x25A2B4160]();
          if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_2573384C0();
          }
          sub_2573384E0();
          sub_2573384B0();
        }
      }
LABEL_13:

      swift_bridgeObjectRelease();
      if (v10 == v9) {
        goto LABEL_4;
      }
    }
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t sub_257334448(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2573385D0();
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
    uint64_t v5 = sub_2573385D0();
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
    unint64_t v4 = MEMORY[0x25A2B4280](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_257335F04(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2573385D0();
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
  return sub_2573384B0();
}

uint64_t SmartStackSuggestionSettingsWidgetProvider.deinit()
{
  swift_defaultActor_destroy();
  return v0;
}

uint64_t SmartStackSuggestionSettingsWidgetProvider.__deallocating_deinit()
{
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t SmartStackSuggestionSettingsWidgetProvider.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_257334690()
{
  return v0;
}

uint64_t sub_25733469C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unint64_t v4 = v2;
  v4[1] = sub_257334778;
  return v6(a1);
}

uint64_t sub_257334778()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_257334870(uint64_t a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE7BD0);
  uint64_t v4 = sub_2573385E0();
  uint64_t v5 = (void *)v4;
  int64_t v6 = 0;
  uint64_t v31 = a1;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v8 = a1 + 64;
  uint64_t v7 = v9;
  uint64_t v10 = 1 << *(unsigned char *)(v8 - 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & v7;
  uint64_t v28 = v8;
  int64_t v29 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v30 = v4 + 64;
  if ((v11 & v7) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v13 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v13 | (v6 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v6 << 6))
  {
    id v18 = (uint64_t *)(*(void *)(v31 + 48) + 16 * i);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    unint64_t v21 = *(void *)(*(void *)(v31 + 56) + 8 * i);
    if ((v21 & 0x8000000000000000) != 0 || (v21 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v22 = (uint64_t)sub_257334B54(v21);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v22 = v21 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
    }
    uint64_t v32 = v22;
    sub_257334AD8(&v32);
    if (v2) {
      break;
    }
    uint64_t v2 = 0;
    swift_bridgeObjectRelease();
    uint64_t v23 = v32;
    *(void *)(v30 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    unint64_t v24 = (void *)(v5[6] + 16 * i);
    *unint64_t v24 = v20;
    v24[1] = v19;
    *(void *)(v5[7] + 8 * i) = v23;
    uint64_t v25 = v5[2];
    BOOL v15 = __OFADD__(v25, 1);
    uint64_t v26 = v25 + 1;
    if (v15)
    {
      __break(1u);
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
      break;
    }
    v5[2] = v26;
    if (v12) {
      goto LABEL_4;
    }
LABEL_5:
    BOOL v15 = __OFADD__(v6++, 1);
    if (v15) {
      goto LABEL_30;
    }
    if (v6 >= v29) {
      return (uint64_t)v5;
    }
    unint64_t v16 = *(void *)(v28 + 8 * v6);
    if (!v16)
    {
      int64_t v17 = v6 + 1;
      if (v6 + 1 >= v29) {
        return (uint64_t)v5;
      }
      unint64_t v16 = *(void *)(v28 + 8 * v17);
      if (!v16)
      {
        int64_t v17 = v6 + 2;
        if (v6 + 2 >= v29) {
          return (uint64_t)v5;
        }
        unint64_t v16 = *(void *)(v28 + 8 * v17);
        if (!v16)
        {
          int64_t v17 = v6 + 3;
          if (v6 + 3 >= v29) {
            return (uint64_t)v5;
          }
          unint64_t v16 = *(void *)(v28 + 8 * v17);
          if (!v16)
          {
            while (1)
            {
              int64_t v6 = v17 + 1;
              if (__OFADD__(v17, 1)) {
                goto LABEL_31;
              }
              if (v6 >= v29) {
                return (uint64_t)v5;
              }
              unint64_t v16 = *(void *)(v28 + 8 * v6);
              ++v17;
              if (v16) {
                goto LABEL_15;
              }
            }
          }
        }
      }
      int64_t v6 = v17;
    }
LABEL_15:
    unint64_t v12 = (v16 - 1) & v16;
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_257334AD8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_2573360C0();
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_257334C4C(v6);
  return sub_2573385C0();
}

void *sub_257334B54(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269FE7BF8);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_257335D58((uint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_2573385D0();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v3;
}

void sub_257334C4C(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = sub_257338620();
  if (v4 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_150;
    }
    if (v3) {
      sub_2573354C4(0, v3, 1, a1);
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
    goto LABEL_149;
  }
  uint64_t v120 = v4;
  v117 = a1;
  if (v3 <= 1)
  {
    uint64_t v8 = (char *)MEMORY[0x263F8EE78];
    uint64_t v133 = MEMORY[0x263F8EE78];
    v128 = (void **)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      unint64_t v11 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_115:
      if (v11 >= 2)
      {
        uint64_t v111 = *v117;
        do
        {
          unint64_t v112 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_144;
          }
          if (!v111) {
            goto LABEL_157;
          }
          uint64_t v113 = *(void *)&v8[16 * v112 + 32];
          uint64_t v114 = *(void *)&v8[16 * v11 + 24];
          sub_257335648((void **)(v111 + 8 * v113), (id *)(v111 + 8 * *(void *)&v8[16 * v11 + 16]), (id *)(v111 + 8 * v114), v128);
          if (v1) {
            break;
          }
          if (v114 < v113) {
            goto LABEL_145;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v8 = sub_257335B20((uint64_t)v8);
          }
          if (v112 >= *((void *)v8 + 2)) {
            goto LABEL_146;
          }
          v115 = &v8[16 * v112 + 32];
          *(void *)v115 = v113;
          *((void *)v115 + 1) = v114;
          unint64_t v116 = *((void *)v8 + 2);
          if (v11 > v116) {
            goto LABEL_147;
          }
          memmove(&v8[16 * v11 + 16], &v8[16 * v11 + 32], 16 * (v116 - v11));
          *((void *)v8 + 2) = v116 - 1;
          unint64_t v11 = v116 - 1;
        }
        while (v116 > 2);
      }
LABEL_126:
      swift_bridgeObjectRelease();
      *(void *)((v133 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_2573384B0();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    sub_257338570();
    uint64_t v7 = sub_2573384D0();
    *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
    v128 = (void **)((v7 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v133 = v7;
  }
  uint64_t v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v118 = *a1 + 16;
  uint64_t v119 = *a1 - 8;
  uint64_t v8 = (char *)MEMORY[0x263F8EE78];
  uint64_t v125 = v3;
  uint64_t v129 = *a1;
  while (2)
  {
    uint64_t v12 = v9 + 1;
    uint64_t v124 = v9;
    if (v9 + 1 >= v3) {
      goto LABEL_44;
    }
    v121 = v8;
    unint64_t v13 = *(void **)(v10 + 8 * v9);
    id v14 = *(id *)(v10 + 8 * v12);
    id v15 = v13;
    id v16 = objc_msgSend(v14, sel_containerBundleIdentifier);
    uint64_t v17 = sub_257338470();
    uint64_t v19 = v18;

    id v20 = objc_msgSend(v15, sel_containerBundleIdentifier);
    uint64_t v21 = sub_257338470();
    uint64_t v23 = v22;

    if (v17 == v21 && v19 == v23) {
      int v126 = 0;
    }
    else {
      int v126 = sub_257338630();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    uint64_t v12 = v9 + 2;
    uint64_t v3 = v125;
    if (v9 + 2 >= v125) {
      goto LABEL_36;
    }
    uint64_t v25 = (id *)(v118 + 8 * v9);
    while (1)
    {
      uint64_t v130 = v12;
      char v27 = *(v25 - 1);
      id v28 = *v25;
      id v29 = v27;
      id v30 = objc_msgSend(v28, sel_containerBundleIdentifier);
      uint64_t v31 = sub_257338470();
      uint64_t v33 = v32;

      id v34 = objc_msgSend(v29, sel_containerBundleIdentifier);
      uint64_t v35 = sub_257338470();
      uint64_t v37 = v36;

      if (v31 == v35 && v33 == v37)
      {

        swift_bridgeObjectRelease_n();
        if (v126)
        {
          uint64_t v8 = v121;
          uint64_t v9 = v124;
          uint64_t v3 = v125;
          uint64_t v10 = v129;
          uint64_t v12 = v130;
          goto LABEL_37;
        }
        goto LABEL_25;
      }
      int v26 = sub_257338630();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v126 ^ v26)) {
        break;
      }
LABEL_25:
      uint64_t v12 = v130 + 1;
      ++v25;
      uint64_t v3 = v125;
      if (v125 == v130 + 1)
      {
        uint64_t v12 = v125;
        goto LABEL_35;
      }
    }
    uint64_t v3 = v125;
    uint64_t v12 = v130;
LABEL_35:
    uint64_t v9 = v124;
LABEL_36:
    uint64_t v8 = v121;
    uint64_t v10 = v129;
    if (v126)
    {
LABEL_37:
      if (v12 < v9) {
        goto LABEL_151;
      }
      if (v9 < v12)
      {
        v39 = (uint64_t *)(v119 + 8 * v12);
        uint64_t v40 = v12;
        uint64_t v41 = v9;
        uint64_t v42 = (uint64_t *)(v10 + 8 * v9);
        do
        {
          if (v41 != --v40)
          {
            if (!v10) {
              goto LABEL_156;
            }
            uint64_t v43 = *v42;
            *uint64_t v42 = *v39;
            uint64_t *v39 = v43;
          }
          ++v41;
          --v39;
          ++v42;
        }
        while (v41 < v40);
      }
    }
LABEL_44:
    if (v12 >= v3) {
      goto LABEL_67;
    }
    if (__OFSUB__(v12, v9)) {
      goto LABEL_148;
    }
    if (v12 - v9 >= v120)
    {
LABEL_67:
      if (v12 < v9) {
        goto LABEL_143;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v8 = sub_257335A24(0, *((void *)v8 + 2) + 1, 1, v8);
      }
      unint64_t v63 = *((void *)v8 + 2);
      unint64_t v62 = *((void *)v8 + 3);
      unint64_t v11 = v63 + 1;
      if (v63 >= v62 >> 1) {
        uint64_t v8 = sub_257335A24((char *)(v62 > 1), v63 + 1, 1, v8);
      }
      *((void *)v8 + 2) = v11;
      v64 = v8 + 32;
      v65 = &v8[16 * v63 + 32];
      *(void *)v65 = v9;
      *((void *)v65 + 1) = v12;
      uint64_t v132 = v12;
      if (!v63)
      {
        unint64_t v11 = 1;
LABEL_14:
        uint64_t v3 = v125;
        uint64_t v9 = v132;
        if (v132 >= v125) {
          goto LABEL_115;
        }
        continue;
      }
      while (1)
      {
        unint64_t v66 = v11 - 1;
        if (v11 >= 4)
        {
          v71 = &v64[16 * v11];
          uint64_t v72 = *((void *)v71 - 8);
          uint64_t v73 = *((void *)v71 - 7);
          BOOL v77 = __OFSUB__(v73, v72);
          uint64_t v74 = v73 - v72;
          if (v77) {
            goto LABEL_132;
          }
          uint64_t v76 = *((void *)v71 - 6);
          uint64_t v75 = *((void *)v71 - 5);
          BOOL v77 = __OFSUB__(v75, v76);
          uint64_t v69 = v75 - v76;
          char v70 = v77;
          if (v77) {
            goto LABEL_133;
          }
          unint64_t v78 = v11 - 2;
          v79 = &v64[16 * v11 - 32];
          uint64_t v81 = *(void *)v79;
          uint64_t v80 = *((void *)v79 + 1);
          BOOL v77 = __OFSUB__(v80, v81);
          uint64_t v82 = v80 - v81;
          if (v77) {
            goto LABEL_134;
          }
          BOOL v77 = __OFADD__(v69, v82);
          uint64_t v83 = v69 + v82;
          if (v77) {
            goto LABEL_136;
          }
          if (v83 >= v74)
          {
            v101 = &v64[16 * v66];
            uint64_t v103 = *(void *)v101;
            uint64_t v102 = *((void *)v101 + 1);
            BOOL v77 = __OFSUB__(v102, v103);
            uint64_t v104 = v102 - v103;
            if (v77) {
              goto LABEL_142;
            }
            BOOL v94 = v69 < v104;
            goto LABEL_104;
          }
        }
        else
        {
          if (v11 != 3)
          {
            uint64_t v95 = *((void *)v8 + 4);
            uint64_t v96 = *((void *)v8 + 5);
            BOOL v77 = __OFSUB__(v96, v95);
            uint64_t v88 = v96 - v95;
            char v89 = v77;
            goto LABEL_98;
          }
          uint64_t v68 = *((void *)v8 + 4);
          uint64_t v67 = *((void *)v8 + 5);
          BOOL v77 = __OFSUB__(v67, v68);
          uint64_t v69 = v67 - v68;
          char v70 = v77;
        }
        if (v70) {
          goto LABEL_135;
        }
        unint64_t v78 = v11 - 2;
        v84 = &v64[16 * v11 - 32];
        uint64_t v86 = *(void *)v84;
        uint64_t v85 = *((void *)v84 + 1);
        BOOL v87 = __OFSUB__(v85, v86);
        uint64_t v88 = v85 - v86;
        char v89 = v87;
        if (v87) {
          goto LABEL_137;
        }
        v90 = &v64[16 * v66];
        uint64_t v92 = *(void *)v90;
        uint64_t v91 = *((void *)v90 + 1);
        BOOL v77 = __OFSUB__(v91, v92);
        uint64_t v93 = v91 - v92;
        if (v77) {
          goto LABEL_139;
        }
        if (__OFADD__(v88, v93)) {
          goto LABEL_141;
        }
        if (v88 + v93 >= v69)
        {
          BOOL v94 = v69 < v93;
LABEL_104:
          if (v94) {
            unint64_t v66 = v78;
          }
          goto LABEL_106;
        }
LABEL_98:
        if (v89) {
          goto LABEL_138;
        }
        v97 = &v64[16 * v66];
        uint64_t v99 = *(void *)v97;
        uint64_t v98 = *((void *)v97 + 1);
        BOOL v77 = __OFSUB__(v98, v99);
        uint64_t v100 = v98 - v99;
        if (v77) {
          goto LABEL_140;
        }
        if (v100 < v88) {
          goto LABEL_14;
        }
LABEL_106:
        unint64_t v105 = v66 - 1;
        if (v66 - 1 >= v11)
        {
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
          goto LABEL_153;
        }
        if (!v10) {
          goto LABEL_155;
        }
        v106 = &v64[16 * v105];
        uint64_t v107 = *(void *)v106;
        v108 = &v64[16 * v66];
        uint64_t v109 = *((void *)v108 + 1);
        sub_257335648((void **)(v10 + 8 * *(void *)v106), (id *)(v10 + 8 * *(void *)v108), (id *)(v10 + 8 * v109), v128);
        if (v1) {
          goto LABEL_126;
        }
        if (v109 < v107) {
          goto LABEL_129;
        }
        if (v66 > *((void *)v8 + 2)) {
          goto LABEL_130;
        }
        *(void *)v106 = v107;
        *(void *)&v64[16 * v105 + 8] = v109;
        unint64_t v110 = *((void *)v8 + 2);
        if (v66 >= v110) {
          goto LABEL_131;
        }
        unint64_t v11 = v110 - 1;
        memmove(&v64[16 * v66], v108 + 16, 16 * (v110 - 1 - v66));
        *((void *)v8 + 2) = v110 - 1;
        if (v110 <= 2) {
          goto LABEL_14;
        }
      }
    }
    break;
  }
  if (__OFADD__(v9, v120)) {
    goto LABEL_152;
  }
  if (v9 + v120 >= v3) {
    uint64_t v44 = v3;
  }
  else {
    uint64_t v44 = v9 + v120;
  }
  if (v44 >= v9)
  {
    if (v12 != v44)
    {
      v122 = v8;
      uint64_t v123 = v44;
      uint64_t v45 = v119 + 8 * v12;
      do
      {
        v47 = *(void **)(v10 + 8 * v12);
        uint64_t v127 = v45;
        uint64_t v131 = v12;
        while (1)
        {
          v48 = *(void **)v45;
          id v49 = v47;
          id v50 = v48;
          id v51 = objc_msgSend(v49, sel_containerBundleIdentifier);
          uint64_t v52 = sub_257338470();
          uint64_t v54 = v53;

          id v55 = objc_msgSend(v50, sel_containerBundleIdentifier);
          uint64_t v56 = sub_257338470();
          uint64_t v58 = v57;

          if (v52 == v56 && v54 == v58) {
            break;
          }
          char v60 = sub_257338630();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v10 = v129;
          if ((v60 & 1) == 0) {
            goto LABEL_55;
          }
          if (!v129) {
            goto LABEL_154;
          }
          v61 = *(void **)v45;
          v47 = *(void **)(v45 + 8);
          *(void *)uint64_t v45 = v47;
          *(void *)(v45 + 8) = v61;
          v45 -= 8;
          ++v9;
          uint64_t v46 = v131;
          if (v131 == v9) {
            goto LABEL_56;
          }
        }

        swift_bridgeObjectRelease_n();
        uint64_t v10 = v129;
LABEL_55:
        uint64_t v46 = v131;
LABEL_56:
        uint64_t v12 = v46 + 1;
        uint64_t v45 = v127 + 8;
        uint64_t v9 = v124;
      }
      while (v12 != v123);
      uint64_t v12 = v123;
      uint64_t v8 = v122;
    }
    goto LABEL_67;
  }
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
}

uint64_t sub_2573354C4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v23 = result;
  if (a3 != a2)
  {
    uint64_t v25 = *a4;
    uint64_t v4 = *a4 + 8 * a3 - 8;
LABEL_6:
    uint64_t v6 = *(void **)(v25 + 8 * a3);
    uint64_t v7 = v23;
    uint64_t v24 = v4;
    uint64_t v26 = a3;
    while (1)
    {
      uint64_t v8 = *(void **)v4;
      id v9 = v6;
      id v10 = v8;
      id v11 = objc_msgSend(v9, sel_containerBundleIdentifier);
      uint64_t v12 = sub_257338470();
      uint64_t v14 = v13;

      id v15 = objc_msgSend(v10, sel_containerBundleIdentifier);
      uint64_t v16 = sub_257338470();
      uint64_t v18 = v17;

      if (v12 == v16 && v14 == v18)
      {

        uint64_t result = swift_bridgeObjectRelease_n();
        uint64_t v5 = v26;
LABEL_5:
        a3 = v5 + 1;
        uint64_t v4 = v24 + 8;
        if (a3 == a2) {
          return result;
        }
        goto LABEL_6;
      }
      char v20 = sub_257338630();

      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v5 = v26;
      if ((v20 & 1) == 0) {
        goto LABEL_5;
      }
      if (!v25) {
        break;
      }
      uint64_t v21 = *(void **)v4;
      uint64_t v6 = *(void **)(v4 + 8);
      *(void *)uint64_t v4 = v6;
      *(void *)(v4 + 8) = v21;
      v4 -= 8;
      if (v26 == ++v7) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_257335648(void **__dst, id *__src, id *a3, void **a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = (char *)__src - (char *)__dst;
  int64_t v9 = (char *)__src - (char *)__dst + 7;
  if ((char *)__src - (char *)__dst >= 0) {
    int64_t v9 = (char *)__src - (char *)__dst;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = (char *)a3 - (char *)__src;
  uint64_t v12 = (char *)a3 - (char *)__src + 7;
  if ((char *)a3 - (char *)__src >= 0) {
    uint64_t v12 = (char *)a3 - (char *)__src;
  }
  uint64_t v13 = v12 >> 3;
  if (v10 >= v12 >> 3)
  {
    if (a4 != __src || &__src[v13] <= a4) {
      memmove(a4, __src, 8 * v13);
    }
    uint64_t v14 = &v4[v13];
    if (v7 >= v6 || v11 < 8) {
      goto LABEL_49;
    }
    id v50 = v7;
    id v51 = v4;
    while (1)
    {
      uint64_t v53 = v5;
      unint64_t v55 = (unint64_t)v14;
      uint64_t v32 = v14 - 1;
      uint64_t v57 = v6;
      id v34 = v6 - 1;
      uint64_t v33 = *(v6 - 1);
      id v35 = *(v14 - 1);
      id v36 = v33;
      id v37 = objc_msgSend(v35, sel_containerBundleIdentifier);
      uint64_t v38 = sub_257338470();
      uint64_t v40 = v39;

      id v41 = objc_msgSend(v36, sel_containerBundleIdentifier);
      uint64_t v42 = sub_257338470();
      uint64_t v44 = v43;

      if (v38 == v42 && v40 == v44) {
        break;
      }
      char v46 = sub_257338630();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v47 = v53;
      uint64_t v5 = v53 - 1;
      if ((v46 & 1) == 0) {
        goto LABEL_41;
      }
      unint64_t v48 = (unint64_t)v50;
      uint64_t v14 = (void **)v55;
      if (v53 == v57)
      {
        uint64_t v6 = v34;
        uint64_t v4 = v51;
        if (v5 < v57) {
          goto LABEL_47;
        }
        goto LABEL_46;
      }
      uint64_t v6 = v34;
LABEL_45:
      uint64_t v4 = v51;
LABEL_46:
      *uint64_t v5 = *v34;
LABEL_47:
      if ((unint64_t)v6 <= v48 || v14 <= v4) {
        goto LABEL_49;
      }
    }

    swift_bridgeObjectRelease_n();
    v47 = v53;
    uint64_t v5 = v53 - 1;
LABEL_41:
    uint64_t v6 = v57;
    unint64_t v48 = (unint64_t)v50;
    id v34 = v32;
    if (v47 == (id *)v55)
    {
      uint64_t v14 = v32;
      uint64_t v4 = v51;
      if ((unint64_t)v5 < v55) {
        goto LABEL_47;
      }
      goto LABEL_46;
    }
    uint64_t v14 = v32;
    goto LABEL_45;
  }
  if (a4 != __dst || &__dst[v10] <= a4) {
    memmove(a4, __dst, 8 * v10);
  }
  uint64_t v14 = &v4[v10];
  if (v6 < v5 && v8 >= 8)
  {
    uint64_t v52 = v5;
    uint64_t v54 = &v4[v10];
    while (1)
    {
      id v15 = v7;
      uint64_t v56 = v6;
      uint64_t v16 = *v4;
      id v17 = *v6;
      id v18 = v16;
      id v19 = objc_msgSend(v17, sel_containerBundleIdentifier);
      uint64_t v20 = sub_257338470();
      uint64_t v22 = v21;

      id v23 = objc_msgSend(v18, sel_containerBundleIdentifier);
      uint64_t v24 = sub_257338470();
      uint64_t v26 = v25;

      BOOL v27 = v20 == v24 && v22 == v26;
      if (v27) {
        break;
      }
      char v28 = sub_257338630();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v28 & 1) == 0) {
        goto LABEL_20;
      }
      id v29 = v56;
      uint64_t v6 = v56 + 1;
      id v30 = v15;
      unint64_t v31 = (unint64_t)v52;
      if (v15 != v56) {
        goto LABEL_21;
      }
LABEL_22:
      uint64_t v7 = v30 + 1;
      uint64_t v14 = v54;
      if (v4 >= v54 || (unint64_t)v6 >= v31) {
        goto LABEL_24;
      }
    }

    swift_bridgeObjectRelease_n();
LABEL_20:
    id v29 = v4;
    id v30 = v15;
    BOOL v27 = v15 == v4++;
    uint64_t v6 = v56;
    unint64_t v31 = (unint64_t)v52;
    if (v27) {
      goto LABEL_22;
    }
LABEL_21:
    *id v30 = *v29;
    goto LABEL_22;
  }
LABEL_24:
  uint64_t v6 = v7;
LABEL_49:
  if (v6 != v4
    || v6 >= (void **)((char *)v4
                     + (((char *)v14 - (char *)v4 + ((char *)v14 - (char *)v4 < 0 ? 7uLL : 0)) & 0xFFFFFFFFFFFFFFF8)))
  {
    memmove(v6, v4, 8 * (v14 - v4));
  }
  return 1;
}

char *sub_257335A24(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269FE7C10);
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

char *sub_257335B20(uint64_t a1)
{
  return sub_257335A24(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t (*sub_257335B34(void (**a1)(id *), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_257335C50(v6, a2, a3);
  return sub_257335B9C;
}

uint64_t (*sub_257335BA0(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_257335CD0(v6, a2, a3);
  return sub_257335B9C;
}

void sub_257335C08(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_257335C50(void (*result)(id *), unint64_t a2, uint64_t a3))(id *)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x25A2B4270](a2, a3);
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
    return j__s24NanoHomeScreenUIServices22WidgetMetricsConstantsVwxx;
  }
  __break(1u);
  return result;
}

void (*sub_257335CD0(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x25A2B4270](a2, a3);
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
    return destroy for WidgetMetricsConstants;
  }
  __break(1u);
  return result;
}

void destroy for WidgetMetricsConstants(id *a1)
{
}

uint64_t sub_257335D58(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2573385D0();
    uint64_t result = swift_bridgeObjectRelease();
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
      uint64_t v8 = sub_2573385D0();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_2573368C4(&qword_269FE7C08, &qword_269FE7C00);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_269FE7C00);
            uint64_t v10 = sub_257335B34(v13, i, a3);
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
        sub_257338570();
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

uint64_t sub_257335F04(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2573385D0();
    uint64_t result = swift_bridgeObjectRelease();
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
      uint64_t v8 = sub_2573385D0();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_2573368C4(&qword_269FE7BE8, &qword_269FE7BD8);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_269FE7BD8);
            uint64_t v10 = sub_257335BA0(v13, i, a3);
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
        sub_257336884(0, &qword_269FE7BE0);
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

void sub_2573360C0()
{
}

unint64_t sub_2573360D4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269FE7BC0);
    uint64_t v3 = (void *)sub_257338600();
    for (unint64_t i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      uint64_t v5 = *(i - 1);
      uint64_t v6 = *i;
      unint64_t result = sub_257337618(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      uint64_t v9 = 8 * result;
      *(void *)(v3[6] + v9) = v5;
      *(void *)(v3[7] + v9) = v6;
      uint64_t v10 = v3[2];
      BOOL v11 = __OFADD__(v10, 1);
      uint64_t v12 = v10 + 1;
      if (v11) {
        goto LABEL_10;
      }
      v3[2] = v12;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

unint64_t sub_2573361B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE7BC8);
  uint64_t v3 = (void *)sub_257338600();
  long long v4 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)&v27[96] = *(_OWORD *)(a1 + 128);
  *(_OWORD *)&v27[112] = v4;
  *(_OWORD *)&v27[128] = *(_OWORD *)(a1 + 160);
  long long v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)BOOL v27 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&v27[16] = v5;
  long long v6 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v27[32] = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v27[48] = v6;
  long long v7 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)&v27[64] = *(_OWORD *)(a1 + 96);
  *(_OWORD *)&v27[80] = v7;
  uint64_t v8 = *(void *)v27;
  unint64_t result = sub_257337618(*(uint64_t *)v27);
  if (v10)
  {
LABEL_7:
    __break(1u);
    return MEMORY[0x263F8EE80];
  }
  BOOL v11 = (_OWORD *)(a1 + 176);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v8;
    uint64_t v12 = v3[7] + 136 * result;
    *(_OWORD *)uint64_t v12 = *(_OWORD *)&v27[8];
    long long v13 = *(_OWORD *)&v27[24];
    long long v14 = *(_OWORD *)&v27[40];
    long long v15 = *(_OWORD *)&v27[72];
    *(_OWORD *)(v12 + 48) = *(_OWORD *)&v27[56];
    *(_OWORD *)(v12 + 64) = v15;
    *(_OWORD *)(v12 + 16) = v13;
    *(_OWORD *)(v12 + 32) = v14;
    long long v16 = *(_OWORD *)&v27[88];
    long long v17 = *(_OWORD *)&v27[104];
    long long v18 = *(_OWORD *)&v27[120];
    *(void *)(v12 + 128) = *(void *)&v27[136];
    *(_OWORD *)(v12 + 96) = v17;
    *(_OWORD *)(v12 + 112) = v18;
    *(_OWORD *)(v12 + 80) = v16;
    uint64_t v19 = v3[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      break;
    }
    v3[2] = v21;
    sub_257336810((uint64_t)v27);
    if (!--v1) {
      return (unint64_t)v3;
    }
    long long v22 = v11[7];
    *(_OWORD *)&v27[96] = v11[6];
    *(_OWORD *)&v27[112] = v22;
    *(_OWORD *)&v27[128] = v11[8];
    long long v23 = v11[1];
    *(_OWORD *)BOOL v27 = *v11;
    *(_OWORD *)&v27[16] = v23;
    long long v24 = v11[3];
    *(_OWORD *)&v27[32] = v11[2];
    *(_OWORD *)&v27[48] = v24;
    long long v25 = v11[5];
    *(_OWORD *)&v27[64] = v11[4];
    *(_OWORD *)&v27[80] = v25;
    uint64_t v8 = *(void *)v27;
    unint64_t result = sub_257337618(*(uint64_t *)v27);
    v11 += 9;
    if (v26) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t _s24NanoHomeScreenUIServices42SmartStackSuggestionSettingsWidgetProviderC19extensionsDidChange8providerySo018CHSWidgetExtensionJ0C_tF_0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE7B98);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_257338530();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  long long v6 = (void *)swift_allocObject();
  uint64_t v6[2] = 0;
  v6[3] = 0;
  v6[4] = v1;
  int v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  swift_retain();
  if (v7 == 1)
  {
    sub_2573366F8((uint64_t)v3);
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    sub_257338520();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v8 = sub_2573384F0();
      uint64_t v9 = v10;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = &unk_269FE7C20;
  *(void *)(v11 + 24) = v6;
  if (v9 | v8)
  {
    v13[0] = 0;
    v13[1] = 0;
    v13[2] = v8;
    v13[3] = v9;
  }
  swift_task_create();
  return swift_release();
}

unint64_t sub_257336574()
{
  unint64_t result = qword_269FE7B28;
  if (!qword_269FE7B28)
  {
    sub_257338570();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE7B28);
  }
  return result;
}

uint64_t type metadata accessor for SmartStackSuggestionSettingsWidgetProvider()
{
  return self;
}

uint64_t method lookup function for SmartStackSuggestionSettingsWidgetProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SmartStackSuggestionSettingsWidgetProvider);
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

uint64_t sub_257336650()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_257336BEC;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_2573333F8, v2, 0);
}

uint64_t sub_2573366F8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE7B98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_257336758(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_257336BEC;
  long long v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269FE7BB0 + dword_269FE7BB0);
  return v6(a1, v4);
}

uint64_t sub_257336810(uint64_t a1)
{
  id v2 = *(id *)(a1 + 8);
  return a1;
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

uint64_t sub_257336884(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2573368C4(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_257336914()
{
  return swift_release();
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_257336960()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_257336A08;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_257333D80, 0, 0);
}

uint64_t sub_257336A08()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_257336AFC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_257336B34(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_257336A08;
  long long v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269FE7BB0 + dword_269FE7BB0);
  return v6(a1, v4);
}

uint64_t sub_257336BF8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_257336C0C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

double WidgetMetricsConstants.accessoryWidgetGroupTopInset.getter()
{
  return *(double *)(v0 + 8);
}

double WidgetMetricsConstants.accessoryWidgetGroupBottomInset.getter()
{
  return *(double *)(v0 + 16);
}

double WidgetMetricsConstants.accessoryWidgetGroupHorizontalInset.getter()
{
  return *(double *)(v0 + 24);
}

double WidgetMetricsConstants.accessoryWidgetGroupNestedContentDiameter.getter()
{
  return *(double *)(v0 + 32);
}

double WidgetMetricsConstants.accessoryWidgetGroupNestedContentSquareCornerRadius.getter()
{
  return *(double *)(v0 + 40);
}

double WidgetMetricsConstants.circularComplicationDiameter.getter()
{
  return *(double *)(v0 + 48);
}

double WidgetMetricsConstants.circularComplicationPlatterDiameter.getter()
{
  return *(double *)(v0 + 56);
}

double WidgetMetricsConstants.circularComplicationSize.getter()
{
  return *(double *)(v0 + 64);
}

double WidgetMetricsConstants.rectangularComplicationCornerRadius.getter()
{
  return *(double *)(v0 + 80);
}

double WidgetMetricsConstants.rectangularComplicationHorizontalInset.getter()
{
  return *(double *)(v0 + 88);
}

double WidgetMetricsConstants.rectangularComplicationLineHeight.getter()
{
  return *(double *)(v0 + 96);
}

double WidgetMetricsConstants.rectangularComplicationSize.getter()
{
  return *(double *)(v0 + 104);
}

double WidgetMetricsConstants.rectangularComplicationVerticalInset.getter()
{
  return *(double *)(v0 + 120);
}

double WidgetMetricsConstants.screenMargins.getter()
{
  return *(double *)(v0 + 128);
}

double sub_257336C90@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = objc_allocWithZone(MEMORY[0x263EFD188]);
  id v5 = a1;
  id v6 = objc_msgSend(v4, sel_initWithDevice_identitySizeClass_, v5, 4);
  objc_msgSend(v6, sel_setRoundingBehavior_, 1);
  sub_2573360D4((uint64_t)&unk_27064D570);
  sub_257338560();
  double v8 = v7;
  double v30 = v7;
  swift_bridgeObjectRelease();
  sub_2573360D4((uint64_t)&unk_27064D600);
  sub_257338560();
  uint64_t v33 = v9;
  swift_bridgeObjectRelease();
  sub_2573360D4((uint64_t)&unk_27064D690);
  sub_257338560();
  double v11 = v10;
  double v32 = v10;
  swift_bridgeObjectRelease();
  sub_2573360D4((uint64_t)&unk_27064D720);
  sub_257338560();
  double v13 = v12;
  swift_bridgeObjectRelease();
  double v31 = v8 * 3.0 + v11 + v11;
  objc_msgSend(v5, sel_screenBounds);
  CGFloat v29 = CGRectGetWidth(v34) - (v13 + v13);
  objc_msgSend(v6, sel_scaledValue_, 12.5);
  uint64_t v28 = v14;
  sub_2573360D4((uint64_t)&unk_27064D7A0);
  sub_257338560();
  double v16 = v15;
  swift_bridgeObjectRelease();
  sub_2573360D4((uint64_t)&unk_27064D830);
  sub_257338560();
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  sub_2573360D4((uint64_t)&unk_27064D8C0);
  sub_257338560();
  uint64_t v20 = v19;
  swift_bridgeObjectRelease();
  sub_2573360D4((uint64_t)&unk_27064D950);
  sub_257338560();
  uint64_t v22 = v21;
  swift_bridgeObjectRelease();
  sub_2573360D4((uint64_t)&unk_27064D9E0);
  sub_257338560();
  uint64_t v24 = v23;
  swift_bridgeObjectRelease();
  sub_2573360D4((uint64_t)&unk_27064DA70);
  sub_257338560();
  uint64_t v26 = v25;
  swift_bridgeObjectRelease();

  *(void *)a2 = v5;
  *(void *)(a2 + 8) = v18;
  *(void *)(a2 + 16) = v20;
  *(void *)(a2 + 24) = v22;
  *(void *)(a2 + 32) = v24;
  *(void *)(a2 + 40) = v26;
  *(double *)(a2 + 48) = v16 + -4.0;
  *(double *)(a2 + 56) = v16;
  *(double *)(a2 + 64) = v16 + -4.0;
  *(double *)(a2 + 72) = v16 + -4.0;
  *(void *)(a2 + 80) = v28;
  *(void *)(a2 + 88) = v33;
  *(double *)(a2 + 96) = v30;
  *(CGFloat *)(a2 + 104) = v29;
  *(double *)(a2 + 112) = v31;
  double result = v32;
  *(double *)(a2 + 120) = v32;
  *(double *)(a2 + 128) = v13;
  return result;
}

uint64_t sub_257336F48()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE7CB0);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_269FE7CA0 = result;
  return result;
}

void *sub_257336F80()
{
  uint64_t result = (void *)sub_2573361B0(MEMORY[0x263F8EE78]);
  off_269FE7CA8 = result;
  return result;
}

uint64_t static WidgetMetricsConstants.shared(for:)()
{
  if (qword_269FE7AE8 != -1) {
    swift_once();
  }
  uint64_t v0 = (os_unfair_lock_s *)qword_269FE7CA0;
  uint64_t v1 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  MEMORY[0x270FA5388](v1);
  swift_retain();
  os_unfair_lock_lock(v0 + 4);
  sub_2573372AC();
  os_unfair_lock_unlock(v0 + 4);
  return swift_release();
}

__n128 sub_2573370A4@<Q0>(id a1@<X0>, uint64_t a2@<X8>)
{
  if (qword_269FE7AF0 != -1) {
    swift_once();
  }
  id v4 = objc_msgSend(a1, sel_sizeClass);
  swift_beginAccess();
  id v5 = off_269FE7CA8;
  if (*((void *)off_269FE7CA8 + 2) && (unint64_t v6 = sub_257337618((uint64_t)v4), (v7 & 1) != 0))
  {
    uint64_t v8 = v5[7] + 136 * v6;
    long long v26 = *(_OWORD *)v8;
    long long v9 = *(_OWORD *)(v8 + 48);
    long long v10 = *(_OWORD *)(v8 + 64);
    long long v11 = *(_OWORD *)(v8 + 32);
    __n128 v27 = *(__n128 *)(v8 + 16);
    long long v28 = v11;
    long long v29 = v9;
    long long v30 = v10;
    long long v12 = *(_OWORD *)(v8 + 80);
    long long v13 = *(_OWORD *)(v8 + 96);
    long long v14 = *(_OWORD *)(v8 + 112);
    uint64_t v34 = *(void *)(v8 + 128);
    long long v32 = v13;
    long long v33 = v14;
    long long v31 = v12;
    swift_endAccess();
    long long v15 = v33;
    *(_OWORD *)(a2 + 96) = v32;
    *(_OWORD *)(a2 + 112) = v15;
    *(void *)(a2 + 128) = v34;
    long long v16 = v29;
    *(_OWORD *)(a2 + 32) = v28;
    *(_OWORD *)(a2 + 48) = v16;
    long long v17 = v31;
    *(_OWORD *)(a2 + 64) = v30;
    *(_OWORD *)(a2 + 80) = v17;
    __n128 v18 = v27;
    *(_OWORD *)a2 = v26;
    *(__n128 *)(a2 + 16) = v18;
    sub_257337684((id *)&v26);
  }
  else
  {
    swift_endAccess();
    id v20 = a1;
    id v21 = objc_msgSend(v20, sel_sizeClass, sub_257336C90(v20, (uint64_t)&v26));
    swift_beginAccess();
    sub_257337684((id *)&v26);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    id v35 = off_269FE7CA8;
    off_269FE7CA8 = (_UNKNOWN *)0x8000000000000000;
    sub_257337ECC((uint64_t)&v26, (uint64_t)v21, isUniquelyReferenced_nonNull_native);
    off_269FE7CA8 = v35;
    swift_bridgeObjectRelease();
    swift_endAccess();
    long long v23 = v33;
    *(_OWORD *)(a2 + 96) = v32;
    *(_OWORD *)(a2 + 112) = v23;
    *(void *)(a2 + 128) = v34;
    long long v24 = v29;
    *(_OWORD *)(a2 + 32) = v28;
    *(_OWORD *)(a2 + 48) = v24;
    long long v25 = v31;
    *(_OWORD *)(a2 + 64) = v30;
    *(_OWORD *)(a2 + 80) = v25;
    __n128 result = v27;
    *(_OWORD *)a2 = v26;
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

double sub_257337290@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_2573370A4((id)*(void *)(v1 + 16), a1).n128_u64[0];
  return result;
}

uint64_t sub_2573372AC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t initializeBufferWithCopyOfBuffer for WidgetMetricsConstants(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for WidgetMetricsConstants(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  long long v4 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v4;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  id v5 = v3;
  return a1;
}

uint64_t assignWithCopy for WidgetMetricsConstants(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  return a1;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for WidgetMetricsConstants(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetMetricsConstants(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 136)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WidgetMetricsConstants(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 136) = 1;
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
    *(unsigned char *)(result + 136) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetMetricsConstants()
{
  return &type metadata for WidgetMetricsConstants;
}

unint64_t sub_2573375A0(uint64_t a1, uint64_t a2)
{
  sub_257338650();
  sub_257338480();
  uint64_t v4 = sub_257338670();
  return sub_257337D4C(a1, a2, v4);
}

unint64_t sub_257337618(uint64_t a1)
{
  sub_257338650();
  sub_257338660();
  uint64_t v2 = sub_257338670();
  return sub_257337E30(a1, v2);
}

id *sub_257337684(id *a1)
{
  id v2 = *a1;
  return a1;
}

uint64_t sub_2573376B0(uint64_t a1, char a2)
{
  long long v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE7BD0);
  char v36 = a2;
  uint64_t v6 = sub_2573385F0();
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
    sub_257338650();
    sub_257338480();
    uint64_t result = sub_257338670();
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
    __n128 v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *__n128 v18 = v31;
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
  *long long v3 = v7;
  return result;
}

uint64_t sub_2573379C8(uint64_t a1, char a2)
{
  long long v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE7BC8);
  uint64_t result = sub_2573385F0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    v47 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v46 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v19 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v20 = v19 | (v8 << 6);
        if (a2) {
          goto LABEL_10;
        }
      }
      else
      {
        int64_t v28 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v28 >= v46) {
          goto LABEL_33;
        }
        unint64_t v29 = v47[v28];
        ++v8;
        if (!v29)
        {
          int64_t v8 = v28 + 1;
          if (v28 + 1 >= v46) {
            goto LABEL_33;
          }
          unint64_t v29 = v47[v8];
          if (!v29)
          {
            int64_t v30 = v28 + 2;
            if (v30 >= v46)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                long long v3 = v2;
                goto LABEL_40;
              }
              uint64_t v45 = 1 << *(unsigned char *)(v5 + 32);
              if (v45 >= 64) {
                bzero(v47, ((unint64_t)(v45 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v47 = -1 << v45;
              }
              long long v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v29 = v47[v30];
            if (!v29)
            {
              while (1)
              {
                int64_t v8 = v30 + 1;
                if (__OFADD__(v30, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v46) {
                  goto LABEL_33;
                }
                unint64_t v29 = v47[v8];
                ++v30;
                if (v29) {
                  goto LABEL_22;
                }
              }
            }
            int64_t v8 = v30;
          }
        }
LABEL_22:
        unint64_t v11 = (v29 - 1) & v29;
        unint64_t v20 = __clz(__rbit64(v29)) + (v8 << 6);
        if (a2)
        {
LABEL_10:
          uint64_t v21 = *(void *)(*(void *)(v5 + 48) + 8 * v20);
          uint64_t v22 = *(void *)(v5 + 56) + 136 * v20;
          long long v23 = *(_OWORD *)(v22 + 112);
          long long v63 = *(_OWORD *)(v22 + 96);
          long long v64 = v23;
          uint64_t v65 = *(void *)(v22 + 128);
          long long v24 = *(_OWORD *)(v22 + 48);
          long long v59 = *(_OWORD *)(v22 + 32);
          long long v60 = v24;
          long long v25 = *(_OWORD *)(v22 + 80);
          long long v61 = *(_OWORD *)(v22 + 64);
          long long v62 = v25;
          long long v27 = *(_OWORD *)v22;
          long long v26 = *(_OWORD *)(v22 + 16);
          goto LABEL_24;
        }
      }
      uint64_t v21 = *(void *)(*(void *)(v5 + 48) + 8 * v20);
      uint64_t v31 = *(void *)(v5 + 56) + 136 * v20;
      long long v48 = *(_OWORD *)v31;
      long long v32 = *(_OWORD *)(v31 + 64);
      long long v34 = *(_OWORD *)(v31 + 16);
      long long v33 = *(_OWORD *)(v31 + 32);
      long long v51 = *(_OWORD *)(v31 + 48);
      long long v52 = v32;
      long long v49 = v34;
      long long v50 = v33;
      long long v36 = *(_OWORD *)(v31 + 96);
      long long v35 = *(_OWORD *)(v31 + 112);
      long long v37 = *(_OWORD *)(v31 + 80);
      uint64_t v56 = *(void *)(v31 + 128);
      long long v54 = v36;
      long long v55 = v35;
      long long v53 = v37;
      sub_257337684((id *)&v48);
      long long v63 = v54;
      long long v64 = v55;
      uint64_t v65 = v56;
      long long v59 = v50;
      long long v60 = v51;
      long long v61 = v52;
      long long v62 = v53;
      long long v27 = v48;
      long long v26 = v49;
LABEL_24:
      long long v57 = v27;
      long long v58 = v26;
      sub_257338650();
      sub_257338660();
      uint64_t result = sub_257338670();
      uint64_t v38 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v39 = result & ~v38;
      unint64_t v40 = v39 >> 6;
      if (((-1 << v39) & ~*(void *)(v12 + 8 * (v39 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v39) & ~*(void *)(v12 + 8 * (v39 >> 6)))) | v39 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v41 = 0;
        unint64_t v42 = (unint64_t)(63 - v38) >> 6;
        do
        {
          if (++v40 == v42 && (v41 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v43 = v40 == v42;
          if (v40 == v42) {
            unint64_t v40 = 0;
          }
          v41 |= v43;
          uint64_t v44 = *(void *)(v12 + 8 * v40);
        }
        while (v44 == -1);
        unint64_t v13 = __clz(__rbit64(~v44)) + (v40 << 6);
      }
      *(void *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v7 + 48) + 8 * v13) = v21;
      uint64_t v14 = *(void *)(v7 + 56) + 136 * v13;
      long long v15 = v64;
      *(_OWORD *)(v14 + 96) = v63;
      *(_OWORD *)(v14 + 112) = v15;
      *(void *)(v14 + 128) = v65;
      long long v16 = v60;
      *(_OWORD *)(v14 + 32) = v59;
      *(_OWORD *)(v14 + 48) = v16;
      long long v17 = v62;
      *(_OWORD *)(v14 + 64) = v61;
      *(_OWORD *)(v14 + 80) = v17;
      long long v18 = v58;
      *(_OWORD *)uint64_t v14 = v57;
      *(_OWORD *)(v14 + 16) = v18;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *long long v3 = v7;
  return result;
}

unint64_t sub_257337D4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_257338630() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_257338630() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_257337E30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_257337ECC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_257337618(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 < result || (a3 & 1) == 0)
  {
    if (v15 < result || (a3 & 1) != 0)
    {
      sub_2573379C8(result, a3 & 1);
      uint64_t result = sub_257337618(a2);
      if ((v14 & 1) != (v18 & 1))
      {
LABEL_17:
        type metadata accessor for CLKDeviceSizeClass(0);
        uint64_t result = sub_257338640();
        __break(1u);
        return result;
      }
      unint64_t v10 = result;
      long long v16 = (void *)*v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
    uint64_t result = (uint64_t)sub_257338058();
  }
  long long v16 = (void *)*v4;
  if ((v14 & 1) == 0)
  {
LABEL_13:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(void *)(v16[6] + 8 * v10) = a2;
    uint64_t v19 = v16[7] + 136 * v10;
    *(_OWORD *)uint64_t v19 = *(_OWORD *)a1;
    long long v20 = *(_OWORD *)(a1 + 16);
    long long v21 = *(_OWORD *)(a1 + 32);
    long long v22 = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(v19 + 48) = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v19 + 64) = v22;
    *(_OWORD *)(v19 + 16) = v20;
    *(_OWORD *)(v19 + 32) = v21;
    long long v23 = *(_OWORD *)(a1 + 80);
    long long v24 = *(_OWORD *)(a1 + 96);
    long long v25 = *(_OWORD *)(a1 + 112);
    *(void *)(v19 + 128) = *(void *)(a1 + 128);
    *(_OWORD *)(v19 + 96) = v24;
    *(_OWORD *)(v19 + 112) = v25;
    *(_OWORD *)(v19 + 80) = v23;
    uint64_t v26 = v16[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (!v27)
    {
      v16[2] = v28;
      return result;
    }
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v17 = v16[7] + 136 * v10;
  return sub_257338270(a1, v17);
}

void *sub_257338058()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE7BC8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2573385E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v33 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v33 >= v13) {
      goto LABEL_26;
    }
    unint64_t v34 = *(void *)(v6 + 8 * v33);
    ++v9;
    if (!v34)
    {
      int64_t v9 = v33 + 1;
      if (v33 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v34 = *(void *)(v6 + 8 * v9);
      if (!v34) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v34 - 1) & v34;
    unint64_t v15 = __clz(__rbit64(v34)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 136 * v15;
    uint64_t v19 = *(void *)(v2 + 56) + v18;
    long long v21 = *(_OWORD *)(v19 + 16);
    long long v20 = *(_OWORD *)(v19 + 32);
    long long v22 = *(_OWORD *)(v19 + 64);
    long long v39 = *(_OWORD *)(v19 + 48);
    long long v40 = v22;
    long long v24 = *(_OWORD *)(v19 + 96);
    long long v23 = *(_OWORD *)(v19 + 112);
    long long v25 = *(_OWORD *)(v19 + 80);
    uint64_t v44 = *(void *)(v19 + 128);
    long long v42 = v24;
    long long v43 = v23;
    long long v41 = v25;
    long long v36 = *(_OWORD *)v19;
    long long v37 = v21;
    long long v38 = v20;
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t v26 = *(void *)(v4 + 56) + v18;
    *(_OWORD *)uint64_t v26 = v36;
    long long v27 = v37;
    long long v28 = v38;
    long long v29 = v40;
    *(_OWORD *)(v26 + 48) = v39;
    *(_OWORD *)(v26 + 64) = v29;
    *(_OWORD *)(v26 + 16) = v27;
    *(_OWORD *)(v26 + 32) = v28;
    long long v30 = v41;
    long long v31 = v42;
    long long v32 = v43;
    *(void *)(v26 + 128) = v44;
    *(_OWORD *)(v26 + 96) = v31;
    *(_OWORD *)(v26 + 112) = v32;
    *(_OWORD *)(v26 + 80) = v30;
    uint64_t result = sub_257337684((id *)&v36);
  }
  int64_t v35 = v33 + 2;
  if (v35 >= v13) {
    goto LABEL_26;
  }
  unint64_t v34 = *(void *)(v6 + 8 * v35);
  if (v34)
  {
    int64_t v9 = v35;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v35 + 1;
    if (__OFADD__(v35, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v34 = *(void *)(v6 + 8 * v9);
    ++v35;
    if (v34) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_257338270(uint64_t a1, uint64_t a2)
{
  return a2;
}

id NHSSSmartStackSuggestionDefaults.widgetSuggestionsEnabled(widgetDescriptor:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (char *)objc_msgSend(a1, sel_extensionIdentity);
  uint64_t v5 = &v4[*MEMORY[0x263F31DA0]];
  swift_beginAccess();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE7CB8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6)) {
    sub_257338450();
  }
  swift_endAccess();

  unint64_t v7 = (void *)sub_257338460();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(a1, sel_extensionBundleIdentifier);
  if (!v8)
  {
    sub_257338470();
    id v8 = (id)sub_257338460();
    swift_bridgeObjectRelease();
  }
  id v9 = objc_msgSend(a1, sel_kind);
  if (!v9)
  {
    sub_257338470();
    id v9 = (id)sub_257338460();
    swift_bridgeObjectRelease();
  }
  id v10 = objc_msgSend(v2, sel_widgetSuggestionsEnabledForContainerBundleIdentifier_extensionBundleIdentifier_kind_, v7, v8, v9);

  return v10;
}

uint64_t sub_257338450()
{
  return MEMORY[0x270F16670]();
}

uint64_t sub_257338460()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_257338470()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_257338480()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_257338490()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2573384A0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2573384B0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2573384C0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2573384D0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2573384E0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2573384F0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_257338500()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_257338510()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_257338520()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_257338530()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_257338540()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_257338550()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_257338560()
{
  return MEMORY[0x270EE3148]();
}

uint64_t sub_257338570()
{
  return MEMORY[0x270F166B0]();
}

uint64_t sub_257338580()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_257338590()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_2573385A0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2573385B0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2573385C0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2573385D0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2573385E0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2573385F0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_257338600()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_257338610()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_257338620()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_257338630()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_257338640()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_257338650()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_257338660()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_257338670()
{
  return MEMORY[0x270F9FC90]();
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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