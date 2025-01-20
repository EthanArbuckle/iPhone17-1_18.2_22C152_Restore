id sub_100005768(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  uint64_t Strong;
  uint64_t v19;
  uint64_t v21;

  v6 = sub_100006080(&qword_100051EB0);
  v7 = __chkstk_darwin(v6 - 8);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v21 - v10;
  v12 = sub_100006080((uint64_t *)&unk_100050D28);
  v13 = *(void *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v11, a1, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  sub_1000060C4((uint64_t)v11, (uint64_t)v9);
  v14 = a2
      + OBJC_IVAR____TtC50SiriUserFeedbackLearningUniversalSuggestionsPlugin9HomeStore_homeManagerDidUpdateHomesContinuation;
  swift_beginAccess();
  sub_10000612C((uint64_t)v9, v14);
  swift_endAccess();
  v15 = sub_100005E74(a3, a3[3]);
  v16 = *v15;
  *(void *)(*v15
            + OBJC_IVAR____TtC50SiriUserFeedbackLearningUniversalSuggestionsPlugin14HomeKitManager_homeManagerDelegate
            + 8) = &off_10004D270;
  swift_unknownObjectWeakAssign();
  v17 = *(void **)(v16 + OBJC_IVAR____TtC50SiriUserFeedbackLearningUniversalSuggestionsPlugin14HomeKitManager_homeManager);
  Strong = swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectRelease();
  if (Strong) {
    v19 = v16;
  }
  else {
    v19 = 0;
  }
  return [v17 setDelegate:v19];
}

uint64_t sub_100005934@<X0>(void *a1@<X0>, id **a2@<X8>)
{
  v4 = (void *)*sub_100005E74(a1, a1[3]);
  v22 = &type metadata for HomeKitAccessory;
  v23 = &off_10004D5F0;
  v21[0] = v4;
  v5 = (void *)*sub_100005E74(v21, (uint64_t)&type metadata for HomeKitAccessory);
  id v6 = v4;
  uint64_t v7 = sub_100042080(v5);
  swift_retain();
  v8 = sub_100005EB8(v7);
  swift_bridgeObjectRelease();
  swift_release();
  sub_100006030((uint64_t)v21);
  v9 = (void *)*sub_100005E74(a1, a1[3]);
  v22 = &type metadata for HomeKitAccessory;
  v23 = &off_10004D5F0;
  v21[0] = v9;
  v10 = (void *)*sub_100005E74(v21, (uint64_t)&type metadata for HomeKitAccessory);
  id v11 = v9;
  id v12 = [v10 assistantIdentifier];
  if (v12)
  {
    v13 = v12;
    uint64_t v14 = sub_100044DE0();
    v16 = v15;

    sub_100006030((uint64_t)v21);
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v8 = sub_100042C04(0, (int64_t)v8[2] + 1, 1, v8);
    }
    unint64_t v18 = (unint64_t)v8[2];
    unint64_t v17 = (unint64_t)v8[3];
    if (v18 >= v17 >> 1) {
      v8 = sub_100042C04((id *)(v17 > 1), v18 + 1, 1, v8);
    }
    v8[2] = (id)(v18 + 1);
    v19 = &v8[2 * v18];
    v19[4] = (id)v14;
    v19[5] = v16;
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = sub_100006030((uint64_t)v21);
  }
  *a2 = v8;
  return result;
}

uint64_t sub_100005AE8()
{
  sub_100006030(v0 + 16);
  sub_100006194(v0+ OBJC_IVAR____TtC50SiriUserFeedbackLearningUniversalSuggestionsPlugin9HomeStore_homeManagerDidUpdateHomesContinuation);
  swift_bridgeObjectRelease();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_100005B64()
{
  return type metadata accessor for HomeStore();
}

uint64_t type metadata accessor for HomeStore()
{
  uint64_t result = qword_100050D10;
  if (!qword_100050D10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100005BB8()
{
  sub_100005C5C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100005C5C()
{
  if (!qword_100050D20)
  {
    sub_100005CB8((uint64_t *)&unk_100050D28);
    unint64_t v0 = sub_100044F90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100050D20);
    }
  }
}

uint64_t sub_100005CB8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

BOOL sub_100005D00(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void sub_100005D14(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

void sub_100005D20(void *a1@<X8>)
{
  *a1 = *v1;
}

Swift::Int sub_100005D2C()
{
  Swift::UInt32 v1 = *v0;
  sub_100045150();
  sub_100045170(v1);
  return sub_100045180();
}

void sub_100005D74()
{
  sub_100045170(*v0);
}

Swift::Int sub_100005DA0()
{
  Swift::UInt32 v1 = *v0;
  sub_100045150();
  sub_100045170(v1);
  return sub_100045180();
}

void sub_100005DE4(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100005DEC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_100005E00(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100005E30(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100005E44(void *result)
{
  *v1 &= *result;
  return result;
}

_DWORD *sub_100005E58@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void *sub_100005E68@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *sub_100005E74(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

id *sub_100005EB8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v2 = (void *)(a1 + 32);
  swift_bridgeObjectRetain();
  uint64_t v3 = _swiftEmptyArrayStorage;
  do
  {
    uint64_t v4 = (void *)*sub_100005E74(v2, v2[3]);
    v16[3] = &type metadata for HomeKitService;
    v16[4] = &off_10004D2D8;
    v16[0] = v4;
    v5 = (void *)*sub_100005E74(v16, (uint64_t)&type metadata for HomeKitService);
    id v6 = v4;
    id v7 = [v5 assistantIdentifier];
    if (v7)
    {
      v8 = v7;
      uint64_t v9 = sub_100044DE0();
      id v11 = v10;

      sub_100006030((uint64_t)v16);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v3 = sub_100042C04(0, (int64_t)v3[2] + 1, 1, v3);
      }
      unint64_t v13 = (unint64_t)v3[2];
      unint64_t v12 = (unint64_t)v3[3];
      if (v13 >= v12 >> 1) {
        uint64_t v3 = sub_100042C04((id *)(v12 > 1), v13 + 1, 1, v3);
      }
      v3[2] = (id)(v13 + 1);
      uint64_t v14 = &v3[2 * v13];
      v14[4] = (id)v9;
      v14[5] = v11;
    }
    else
    {
      sub_100006030((uint64_t)v16);
    }
    v2 += 5;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_100006030(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006080(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000060C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006080(&qword_100051EB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000612C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006080(&qword_100051EB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006194(uint64_t a1)
{
  uint64_t v2 = sub_100006080(&qword_100051EB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void type metadata accessor for FLOWSchemaFLOWStateType()
{
  if (!qword_100050E28)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100050E28);
    }
  }
}

unint64_t sub_100006250()
{
  unint64_t result = qword_100050E30;
  if (!qword_100050E30)
  {
    type metadata accessor for FLOWSchemaFLOWStateType();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050E30);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeKitService()
{
  return &type metadata for HomeKitService;
}

id *sub_1000062C0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v2 = (void *)(a1 + 32);
  swift_bridgeObjectRetain();
  uint64_t v3 = _swiftEmptyArrayStorage;
  while (1)
  {
    sub_100005E74(v2, v2[3]);
    uint64_t v4 = sub_100044AE0();
    int64_t v5 = *(void *)(v4 + 16);
    id v6 = v3[2];
    int64_t v7 = (int64_t)v6 + v5;
    if (__OFADD__(v6, v5)) {
      break;
    }
    uint64_t v8 = v4;
    isUniquelyReferenced_nonNull_native = (id *)swift_isUniquelyReferenced_nonNull_native();
    if (isUniquelyReferenced_nonNull_native && v7 <= (uint64_t)((unint64_t)v3[3] >> 1))
    {
      if (*(void *)(v8 + 16)) {
        goto LABEL_14;
      }
    }
    else
    {
      if ((uint64_t)v6 <= v7) {
        int64_t v10 = (int64_t)v6 + v5;
      }
      else {
        int64_t v10 = (int64_t)v6;
      }
      uint64_t v3 = sub_100042EA0(isUniquelyReferenced_nonNull_native, v10, 1, v3);
      if (*(void *)(v8 + 16))
      {
LABEL_14:
        id v11 = v3[2];
        if ((uint64_t)(((unint64_t)v3[3] >> 1) - (void)v11) < v5) {
          goto LABEL_28;
        }
        unint64_t v12 = &v3[(void)v11 + 4];
        if (v8 + 32 < (unint64_t)&v12[v5] && (unint64_t)v12 < v8 + 32 + 8 * v5) {
          goto LABEL_30;
        }
        memcpy(v12, (const void *)(v8 + 32), 8 * v5);
        if (v5)
        {
          uint64_t v14 = (char *)v3[2];
          BOOL v15 = __OFADD__(v14, v5);
          v16 = &v14[v5];
          if (v15) {
            goto LABEL_29;
          }
          v3[2] = v16;
        }
        goto LABEL_4;
      }
    }
    if (v5) {
      goto LABEL_27;
    }
LABEL_4:
    swift_bridgeObjectRelease();
    v2 += 5;
    if (!--v1)
    {
      swift_bridgeObjectRelease();
      return v3;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  unint64_t result = (id *)sub_1000450D0();
  __break(1u);
  return result;
}

id *sub_100006480(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  if (!v4) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v5 = a3 + 32;
  swift_bridgeObjectRetain();
  id v6 = _swiftEmptyArrayStorage;
  while (1)
  {
    a1(&v21, v5);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v6;
    }
    uint64_t v7 = v21;
    int64_t v8 = *(void *)(v21 + 16);
    id v9 = v6[2];
    int64_t v10 = (int64_t)v9 + v8;
    if (__OFADD__(v9, v8)) {
      break;
    }
    isUniquelyReferenced_nonNull_native = (id *)swift_isUniquelyReferenced_nonNull_native();
    if (isUniquelyReferenced_nonNull_native && v10 <= (uint64_t)((unint64_t)v6[3] >> 1))
    {
      if (*(void *)(v7 + 16)) {
        goto LABEL_15;
      }
    }
    else
    {
      if ((uint64_t)v9 <= v10) {
        int64_t v12 = (int64_t)v9 + v8;
      }
      else {
        int64_t v12 = (int64_t)v9;
      }
      id v6 = sub_1000430C4(isUniquelyReferenced_nonNull_native, v12, 1, v6);
      if (*(void *)(v7 + 16))
      {
LABEL_15:
        id v13 = v6[2];
        if ((uint64_t)(((unint64_t)v6[3] >> 1) - (void)v13) < v8) {
          goto LABEL_30;
        }
        unint64_t v14 = (unint64_t)&v6[5 * (void)v13 + 4];
        if (v7 + 32 < v14 + 40 * v8 && v14 < v7 + 32 + 40 * v8) {
          goto LABEL_32;
        }
        sub_100006080(&qword_100051F10);
        swift_arrayInitWithCopy();
        if (v8)
        {
          v16 = (char *)v6[2];
          BOOL v17 = __OFADD__(v16, v8);
          unint64_t v18 = &v16[v8];
          if (v17) {
            goto LABEL_31;
          }
          v6[2] = v18;
        }
        goto LABEL_4;
      }
    }
    if (v8) {
      goto LABEL_29;
    }
LABEL_4:
    swift_bridgeObjectRelease();
    v5 += 40;
    if (!--v4)
    {
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  unint64_t result = (id *)sub_1000450D0();
  __break(1u);
  return result;
}

uint64_t sub_100006680()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for SiriUserFeedbackLearningUniversalSuggestionsConstants()
{
  return self;
}

uint64_t sub_1000066B4()
{
  v1[6] = v0;
  v1[7] = *v0;
  uint64_t v2 = sub_100044510();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  return _swift_task_switch(sub_10000679C, 0, 0);
}

uint64_t sub_10000679C()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v1 + 16;
  uint64_t v3 = v1 + 56;
  uint64_t v4 = v1 + 104;
  uint64_t v5 = v1 + 144;
  sub_1000444F0();
  id v6 = (void *)swift_task_alloc();
  v0[11] = v6;
  *id v6 = v0;
  v6[1] = sub_100006868;
  uint64_t v7 = v0[10];
  return sub_100006B34(v2, v3, v4, v5, v7);
}

uint64_t sub_100006868(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)*v3;
  id v6 = (void *)*v3;
  v6[2] = v3;
  v6[3] = a1;
  v6[4] = a2;
  v6[5] = v2;
  uint64_t v7 = v5[10];
  uint64_t v8 = v5[9];
  uint64_t v9 = v5[8];
  v6[12] = v2;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  if (v2)
  {
    int64_t v10 = sub_100006AD0;
  }
  else
  {
    v6[13] = a1;
    int64_t v10 = sub_1000069FC;
  }
  return _swift_task_switch(v10, 0, 0);
}

uint64_t sub_1000069FC()
{
  uint64_t v1 = (void *)v0[13];
  if (v1)
  {
    sub_100005E74((void *)(v0[6] + 144), *(void *)(v0[6] + 168));
    id v2 = v1;
    sub_1000448D0();
  }
  uint64_t v3 = v0[4];
  sub_100012678(v3);
  sub_100007AA4(v3);

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100006AD0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100006B34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[12] = a5;
  v6[13] = v5;
  v6[10] = a3;
  v6[11] = a4;
  v6[8] = a1;
  v6[9] = a2;
  uint64_t v7 = sub_100006080(&qword_100050FF8);
  v6[14] = v7;
  v6[15] = *(void *)(v7 - 8);
  v6[16] = swift_task_alloc();
  uint64_t v8 = sub_100006080(&qword_100051000);
  v6[17] = v8;
  v6[18] = *(void *)(v8 - 8);
  v6[19] = swift_task_alloc();
  sub_100006080(&qword_100051008);
  v6[20] = swift_task_alloc();
  uint64_t v9 = sub_100006080(&qword_100051010);
  v6[21] = v9;
  v6[22] = *(void *)(v9 - 8);
  v6[23] = swift_task_alloc();
  uint64_t v10 = sub_100006080(&qword_100051018);
  v6[24] = v10;
  v6[25] = *(void *)(v10 - 8);
  v6[26] = swift_task_alloc();
  uint64_t v11 = sub_100006080(&qword_100051020);
  v6[27] = v11;
  v6[28] = *(void *)(v11 - 8);
  v6[29] = swift_task_alloc();
  v6[30] = swift_task_alloc();
  return _swift_task_switch(sub_100006DC0, 0, 0);
}

uint64_t sub_100006DC0()
{
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 240);
  uint64_t v3 = *(void *)(v0 + 216);
  uint64_t v4 = *(void *)(v0 + 224);
  sub_1000083D0(*(void **)(v0 + 72), *(void **)(v0 + 88), *(void **)(v0 + 96));
  uint64_t v5 = swift_allocObject();
  *(void *)(v0 + 248) = v5;
  *(void *)(v5 + 16) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v2, v3);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = &unk_100051030;
  *(void *)(v6 + 24) = v5;
  sub_100044C80();
  sub_100014030(&qword_100051048, &qword_100051020);
  swift_retain();
  sub_1000450A0();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 256) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_100006F70;
  uint64_t v8 = *(void *)(v0 + 208);
  uint64_t v9 = *(void *)(v0 + 160);
  uint64_t v10 = *(void *)(v0 + 80);
  uint64_t v11 = *(void *)(v0 + 64);
  return sub_100008988(v9, v8, v10, v11);
}

uint64_t sub_100006F70()
{
  *(void *)(*(void *)v1 + 264) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000079A8;
  }
  else {
    uint64_t v2 = sub_100007084;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100007084()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[20];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_100017B30(v3, &qword_100051008);
    if (qword_100050C60 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_100044D60();
    sub_1000136A8(v4, (uint64_t)qword_100050E38);
    uint64_t v5 = sub_100044D40();
    os_log_type_t v6 = sub_100044F40();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to extract featurised turns", v7, 2u);
      swift_slowDealloc();
    }
    uint64_t v8 = v0[30];
    uint64_t v9 = v0[27];
    uint64_t v10 = v0[28];
    uint64_t v12 = v0[25];
    uint64_t v11 = v0[26];
    uint64_t v13 = v0[24];

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v14 = (uint64_t (*)(void, id *))v0[1];
    return v14(0, _swiftEmptyArrayStorage);
  }
  else
  {
    uint64_t v17 = v0[15];
    uint64_t v16 = v0[16];
    uint64_t v18 = v0[14];
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(v0[23], v3, v1);
    v0[5] = _swiftEmptyArrayStorage;
    sub_100014030(&qword_100051058, &qword_100051010);
    sub_100044EF0();
    sub_100044920();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    uint64_t v19 = sub_100014030(&qword_100051060, &qword_100051000);
    v20 = (void *)swift_task_alloc();
    v0[34] = v20;
    void *v20 = v0;
    v20[1] = sub_1000073EC;
    uint64_t v21 = v0[17];
    return dispatch thunk of AsyncIteratorProtocol.next()(v0 + 6, v21, v19);
  }
}

uint64_t sub_1000073EC()
{
  *(void *)(*(void *)v1 + 280) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000077D0;
  }
  else {
    uint64_t v2 = sub_100007500;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100007500()
{
  *(void *)(v0 + 288) = *(void *)(v0 + 48);
  return _swift_task_switch(sub_100007524, 0, 0);
}

void sub_100007524()
{
  uint64_t v1 = v0[36];
  if (v1)
  {
    uint64_t v2 = v0[35];
    uint64_t v3 = v0[13];
    uint64_t v4 = v0[8];
    sub_100008F70(v1, v3, v4, v0 + 5);
    if (v2)
    {
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v18 = sub_100014030(&qword_100051060, &qword_100051000);
      uint64_t v19 = (void *)swift_task_alloc();
      v0[34] = v19;
      void *v19 = v0;
      v19[1] = sub_1000073EC;
      uint64_t v20 = v0[17];
      dispatch thunk of AsyncIteratorProtocol.next()(v0 + 6, v20, v18);
    }
  }
  else
  {
    uint64_t v6 = v0[31];
    uint64_t v22 = v0[30];
    uint64_t v7 = v0[28];
    uint64_t v21 = v0[27];
    uint64_t v8 = v0[25];
    uint64_t v9 = v0[26];
    uint64_t v11 = v0[23];
    uint64_t v10 = v0[24];
    uint64_t v13 = v0[21];
    uint64_t v12 = v0[22];
    (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v22, v21);
    swift_beginAccess();
    unint64_t v14 = *(void **)(v6 + 16);
    uint64_t v15 = v0[5];
    id v16 = v14;
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = (void (*)(void *, uint64_t))v0[1];
    v17(v14, v15);
  }
}

uint64_t sub_1000077D0()
{
  *(void *)(v0 + 56) = *(void *)(v0 + 280);
  sub_100006080(&qword_100051068);
  swift_willThrowTypedImpl();
  return _swift_task_switch(sub_10000785C, 0, 0);
}

uint64_t sub_10000785C()
{
  uint64_t v1 = v0[30];
  uint64_t v2 = v0[27];
  uint64_t v3 = v0[28];
  uint64_t v5 = v0[25];
  uint64_t v4 = v0[26];
  uint64_t v7 = v0[23];
  uint64_t v6 = v0[24];
  uint64_t v9 = v0[21];
  uint64_t v8 = v0[22];
  (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_1000079A8()
{
  uint64_t v1 = v0[30];
  uint64_t v2 = v0[27];
  uint64_t v3 = v0[28];
  (*(void (**)(void, void))(v0[25] + 8))(v0[26], v0[24]);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_release();
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

uint64_t sub_100007AA4(uint64_t a1)
{
  uint64_t v73 = sub_100044B40();
  uint64_t v3 = *(void *)(v73 - 8);
  __chkstk_darwin(v73);
  v72 = (char *)v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_100044AA0();
  uint64_t v5 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  v70 = (char *)v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_100044AC0();
  uint64_t v7 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  v53 = (char *)v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_100044C20();
  uint64_t v9 = __chkstk_darwin(v60);
  uint64_t v61 = (uint64_t)v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v65 = (uint64_t)v50 - v11;
  uint64_t v64 = sub_100044850();
  uint64_t v12 = *(void *)(v64 - 8);
  uint64_t v13 = __chkstk_darwin(v64);
  v63 = (char *)v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v62 = (char *)v50 - v15;
  uint64_t updated = type metadata accessor for ModelUpdateStep(0);
  __chkstk_darwin(updated);
  uint64_t v17 = (char *)v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = type metadata accessor for RequestLinkedModelUpdateStep(0);
  uint64_t result = __chkstk_darwin(v78);
  uint64_t v21 = (char *)v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *(void *)(a1 + 16);
  if (v22)
  {
    v74 = (void *)(v1 + 16);
    uint64_t v80 = *(void *)(v1 + 184);
    uint64_t v23 = a1 + ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80));
    uint64_t v24 = *(void *)(v19 + 72);
    uint64_t v76 = v1;
    uint64_t v77 = v24;
    v69 = (void (**)(char *, char *, uint64_t))(v5 + 32);
    int v59 = enum case for UniversalSuggestionFeedbackAction.markSurfaced(_:);
    v67 = (void (**)(char *, uint64_t))(v3 + 8);
    v68 = (void (**)(char *, void, uint64_t))(v3 + 104);
    v66 = (void (**)(char *, uint64_t))(v5 + 8);
    int v58 = enum case for UniversalSuggestionFeedbackAction.demote(_:);
    int v57 = enum case for UniversalSuggestionFeedbackAction.promote(_:);
    v56 = (void (**)(char *, char *, uint64_t))(v12 + 32);
    v52 = (void (**)(char *, uint64_t, uint64_t))(v7 + 32);
    v51 = (void (**)(char *, uint64_t))(v7 + 8);
    v55 = (void (**)(char *, uint64_t))(v12 + 8);
    v50[1] = a1;
    swift_bridgeObjectRetain();
    v75 = v17;
    do
    {
      sub_100013640(v23, (uint64_t)v21, type metadata accessor for RequestLinkedModelUpdateStep);
      uint64_t v34 = v78;
      sub_100012A44((uint64_t)v21, v80, (uint64_t)&v21[*(int *)(v78 + 24)]);
      sub_100013640((uint64_t)&v21[*(int *)(v34 + 20)], (uint64_t)v17, type metadata accessor for ModelUpdateStep);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          v25 = v70;
          v40 = v17;
          uint64_t v27 = v71;
          (*v69)(v70, v40, v71);
          sub_100005E74(v74, *(void *)(v76 + 40));
          v28 = *v68;
          v29 = v72;
          v30 = v72;
          v31 = (char *)&v81 + 4;
          goto LABEL_4;
        case 2u:
          v25 = v70;
          v41 = v17;
          uint64_t v27 = v71;
          (*v69)(v70, v41, v71);
          sub_100005E74(v74, *(void *)(v76 + 40));
          v28 = *v68;
          v29 = v72;
          v30 = v72;
          v31 = (char *)&v82;
          goto LABEL_4;
        case 3u:
          v25 = v70;
          v26 = v17;
          uint64_t v27 = v71;
          (*v69)(v70, v26, v71);
          sub_100005E74(v74, *(void *)(v76 + 40));
          v28 = *v68;
          v29 = v72;
          v30 = v72;
          v31 = (char *)&v82 + 4;
LABEL_4:
          uint64_t v32 = v73;
          v28(v30, *((unsigned int *)v31 - 64), v73);
          sub_100044A00();
          (*v67)(v29, v32);
          uint64_t v33 = v27;
          uint64_t v17 = v75;
          (*v66)(v25, v33);
          break;
        case 4u:
          break;
        default:
          v35 = &v17[*(int *)(sub_100006080(&qword_100050FD0) + 48)];
          v36 = *v56;
          v37 = v17;
          uint64_t v38 = v64;
          (*v56)(v62, v37, v64);
          v36(v63, v35, v38);
          sub_100005E74(v74, *(void *)(v76 + 40));
          uint64_t v39 = v65;
          sub_1000449F0();
          sub_100013640(v39, v61, (uint64_t (*)(void))&type metadata accessor for UniversalSuggestionCandidateDonationResult);
          if (swift_getEnumCaseMultiPayload() > 1)
          {
            if (qword_100050C60 != -1) {
              swift_once();
            }
            uint64_t v44 = sub_100044D60();
            sub_1000136A8(v44, (uint64_t)qword_100050E38);
            v45 = sub_100044D40();
            os_log_type_t v46 = sub_100044F40();
            if (os_log_type_enabled(v45, v46))
            {
              v47 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v47 = 0;
              _os_log_impl((void *)&_mh_execute_header, v45, v46, "Could not donate suggestion to shared Universal Suggestions store", v47, 2u);
              swift_slowDealloc();
            }
          }
          else
          {
            v42 = v53;
            uint64_t v43 = v54;
            (*v52)(v53, v61, v54);
            sub_100044BB0();
            (*v51)(v42, v43);
          }
          sub_1000136E0(v65, (uint64_t (*)(void))&type metadata accessor for UniversalSuggestionCandidateDonationResult);
          v48 = *v55;
          uint64_t v49 = v64;
          (*v55)(v63, v64);
          v48(v62, v49);
          uint64_t v17 = v75;
          break;
      }
      sub_1000136E0((uint64_t)v21, type metadata accessor for RequestLinkedModelUpdateStep);
      v23 += v77;
      --v22;
    }
    while (v22);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1000083D0(void *a1, void *a2, void *a3)
{
  uint64_t v27 = a3;
  uint64_t v5 = sub_100044510();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v25 - v10;
  sub_100005E74(a2, a2[3]);
  uint64_t v12 = sub_1000448C0();
  if (v12)
  {
    uint64_t v13 = a1[3];
    uint64_t v27 = (void *)v12;
    sub_100005E74(a1, v13);
    sub_100044AB0();
    uint64_t v14 = v27;
  }
  else
  {
    v25[0] = v11;
    v25[1] = "overlapping range";
    uint64_t v26 = v6;
    if (qword_100050C60 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_100044D60();
    sub_1000136A8(v15, (uint64_t)qword_100050E38);
    uint64_t v16 = sub_100044D40();
    os_log_type_t v17 = sub_100044F30();
    BOOL v18 = os_log_type_enabled(v16, v17);
    uint64_t v19 = v5;
    uint64_t v20 = v9;
    uint64_t v21 = v25[0];
    if (v18)
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "No existing turn bookmark found. A new bookmark will be created and only the last 24hrs of data will be reviewed.", v22, 2u);
      swift_slowDealloc();
    }

    sub_100044500();
    sub_100044760();
    uint64_t v23 = v26;
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v20, v21, v19);
    uint64_t v24 = (void *)sub_100044750();
    sub_100005E74(a1, a1[3]);
    sub_100044AB0();

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v21, v19);
  }
}

uint64_t sub_1000086C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[6] = a2;
  v3[7] = a3;
  v3[5] = a1;
  return _swift_task_switch(sub_1000086EC, 0, 0);
}

uint64_t sub_1000086EC()
{
  uint64_t v2 = (void *)v0[6];
  uint64_t v1 = v0[7];
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v2;
  id v4 = v2;

  uint64_t v7 = (uint64_t (*)(uint64_t))v0[1];
  swift_retain();
  uint64_t v5 = v0[5];
  return v7(v5);
}

uint64_t sub_100008794(uint64_t a1, uint64_t *a2, int *a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_100008878;
  return v8(v4, v5);
}

uint64_t sub_100008878(uint64_t a1)
{
  uint64_t v3 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  *uint64_t v3 = a1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_100008988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[15] = a4;
  v5[16] = v4;
  v5[13] = a2;
  v5[14] = a3;
  v5[12] = a1;
  v5[17] = sub_100006080(&qword_1000510C0);
  v5[18] = swift_task_alloc();
  v5[19] = swift_task_alloc();
  v5[20] = sub_100006080(&qword_1000510C8);
  v5[21] = swift_task_alloc();
  v5[22] = sub_100006080(&qword_1000510D0);
  v5[23] = swift_task_alloc();
  uint64_t v6 = sub_100006080(&qword_100051010);
  v5[24] = v6;
  v5[25] = *(void *)(v6 - 8);
  v5[26] = swift_task_alloc();
  uint64_t v7 = sub_100044BA0();
  v5[27] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v5[28] = v8;
  v5[29] = *(void *)(v8 + 64);
  v5[30] = swift_task_alloc();
  v5[31] = swift_task_alloc();
  return _swift_task_switch(sub_100008B74, 0, 0);
}

uint64_t sub_100008B74()
{
  uint64_t v1 = *(void *)(v0 + 248);
  uint64_t v19 = *(void *)(v0 + 240);
  uint64_t v2 = *(void *)(v0 + 224);
  uint64_t v10 = *(void *)(v0 + 232);
  uint64_t v18 = *(void *)(v0 + 216);
  uint64_t v11 = *(void *)(v0 + 200);
  uint64_t v12 = *(void *)(v0 + 208);
  uint64_t v13 = *(void *)(v0 + 152);
  uint64_t v14 = *(void *)(v0 + 144);
  uint64_t v15 = *(void *)(v0 + 192);
  uint64_t v3 = *(void *)(v0 + 120);
  uint64_t v9 = *(void *)(v0 + 128);
  uint64_t v4 = *(void *)(v0 + 112);
  uint64_t v16 = *(void *)(v0 + 96);
  sub_100044690();
  swift_allocObject();
  uint64_t v17 = sub_100044680();
  sub_100013D44(v3, v0 + 16);
  sub_100044B80();
  sub_100006080(&qword_100051018);
  sub_100014030(&qword_1000510D8, &qword_100051018);
  sub_100044EE0();
  sub_100013D44(v4, v0 + 56);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v19, v1, v18);
  unint64_t v5 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v17;
  *(void *)(v6 + 24) = v9;
  sub_100013CF0((long long *)(v0 + 56), v6 + 32);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v6 + v5, v19, v18);
  *(void *)(v6 + ((v10 + v5 + 7) & 0xFFFFFFFFFFFFFFF8)) = v9;
  type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  sub_100014030(&qword_1000510F0, &qword_1000510C8);
  swift_retain();
  sub_100045120();
  sub_100014030(&qword_1000510F8, &qword_1000510D0);
  sub_100044860();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v13, v12, v15);
  sub_100013FCC(v13, v14, &qword_1000510C0);
  sub_100014030(&qword_100051100, &qword_1000510C0);
  sub_100044860();
  swift_release();
  sub_100017B30(v13, &qword_1000510C0);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v15);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v18);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v16, 0, 1, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

void sub_100008F70(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v39 = a2;
  v40 = a4;
  uint64_t v38 = a3;
  uint64_t updated = type metadata accessor for RequestLinkedModelUpdateStep(0);
  uint64_t v7 = *(void *)(updated - 8);
  uint64_t v8 = __chkstk_darwin(updated - 8);
  uint64_t v41 = (uint64_t)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v42 = (uint64_t)&v36 - v10;
  uint64_t v11 = sub_100006080(&qword_100051070);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v36 - v15;
  uint64_t v17 = type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v21 = *(void *)(a1 + 16);
  if (v21)
  {
    uint64_t v37 = v7;
    uint64_t v22 = a1 + ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80));
    sub_100013640(v22, (uint64_t)v20, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    if (v21 == 1)
    {
      uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
      v23(v16, 1, 1, v17);
    }
    else
    {
      uint64_t v36 = v4;
      uint64_t v28 = *(void *)(v18 + 72);
      sub_100013640(v22 + v28, (uint64_t)v16, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
      v23(v16, 0, 1, v17);
      if (v21 >= 3)
      {
        sub_100013640(v22 + 2 * v28, (uint64_t)v14, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
        v23(v14, 0, 1, v17);
        v29 = v40;
LABEL_12:
        uint64_t v30 = v42;
        sub_100009460((uint64_t)v20, (uint64_t)v16, (uint64_t)v14, v38, v42);
        sub_100013640(v30, v41, type metadata accessor for RequestLinkedModelUpdateStep);
        unint64_t v31 = *v29;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t *v29 = v31;
        uint64_t v33 = v37;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          unint64_t v31 = sub_100042E6C(0, *(void *)(v31 + 16) + 1, 1, v31);
          unint64_t *v29 = v31;
        }
        unint64_t v35 = *(void *)(v31 + 16);
        unint64_t v34 = *(void *)(v31 + 24);
        if (v35 >= v34 >> 1)
        {
          unint64_t v31 = sub_100042E6C(v34 > 1, v35 + 1, 1, v31);
          unint64_t *v29 = v31;
        }
        *(void *)(v31 + 16) = v35 + 1;
        sub_1000137A4(v41, v31+ ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80))+ *(void *)(v33 + 72) * v35, type metadata accessor for RequestLinkedModelUpdateStep);
        sub_1000136E0(v42, type metadata accessor for RequestLinkedModelUpdateStep);
        sub_100017B30((uint64_t)v14, &qword_100051070);
        sub_100017B30((uint64_t)v16, &qword_100051070);
        sub_1000136E0((uint64_t)v20, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
        return;
      }
    }
    v29 = v40;
    v23(v14, 1, 1, v17);
    goto LABEL_12;
  }
  if (qword_100050C60 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_100044D60();
  sub_1000136A8(v24, (uint64_t)qword_100050E38);
  v25 = sub_100044D40();
  os_log_type_t v26 = sub_100044F40();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "The turn window received from the sequence is empty, skipping the current iteration", v27, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_100009460@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v124 = a4;
  uint64_t v123 = a3;
  uint64_t v130 = a5;
  uint64_t v102 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
  __chkstk_darwin(v102);
  uint64_t v101 = (uint64_t)&v97 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
  __chkstk_darwin(v8 - 8);
  uint64_t v108 = (uint64_t)&v97 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100044540();
  uint64_t v129 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v107 = (char *)&v97 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = sub_100044AA0();
  uint64_t v104 = *(void *)(v103 - 8);
  __chkstk_darwin(v103);
  v113 = (char *)&v97 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100006080(&qword_100050FD8);
  __chkstk_darwin(v13 - 8);
  uint64_t v118 = (uint64_t)&v97 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
  uint64_t v117 = *(void *)(v119 - 8);
  __chkstk_darwin(v119);
  uint64_t v106 = (uint64_t)&v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t updated = type metadata accessor for ModelUpdateStep(0);
  uint64_t v16 = __chkstk_darwin(updated);
  v120 = (char *)&v97 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v128 = (char *)&v97 - v18;
  uint64_t v19 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
  __chkstk_darwin(v19 - 8);
  unint64_t v21 = (char *)&v97 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = sub_100044850();
  uint64_t v111 = *(void *)(v112 - 8);
  uint64_t v22 = __chkstk_darwin(v112);
  v110 = (char *)&v97 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v109 = (char *)&v97 - v24;
  uint64_t v122 = type metadata accessor for UniversalSuggestionRequestState(0);
  __chkstk_darwin(v122);
  v131 = (char *)&v97 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = type metadata accessor for UniversalSuggestionRequestTaskState(0);
  __chkstk_darwin(v116);
  uint64_t v126 = (uint64_t)&v97 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = type metadata accessor for UniversalSuggestionCorrectionDiscovered(0);
  __chkstk_darwin(v121);
  uint64_t v134 = (uint64_t)&v97 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = sub_100006080(&qword_100051078);
  __chkstk_darwin(v115);
  v114 = (char *)&v97 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_100006080(&qword_100051070);
  uint64_t v30 = __chkstk_darwin(v29 - 8);
  uint64_t v32 = (char *)&v97 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  unint64_t v34 = (char *)&v97 - v33;
  uint64_t v133 = type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  uint64_t v35 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  uint64_t v37 = (char *)&v97 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100050C60 != -1) {
    swift_once();
  }
  uint64_t v38 = sub_100044D60();
  uint64_t v39 = sub_1000136A8(v38, (uint64_t)qword_100050E38);
  uint64_t v132 = a1;
  sub_100013640(a1, (uint64_t)v37, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  v125 = (void (*)(void, void, void))a2;
  sub_100013FCC(a2, (uint64_t)v34, &qword_100051070);
  uint64_t v105 = v39;
  v40 = sub_100044D40();
  int v41 = sub_100044F30();
  if (os_log_type_enabled(v40, (os_log_type_t)v41))
  {
    int v99 = v41;
    v100 = v21;
    uint64_t v42 = swift_slowAlloc();
    uint64_t v98 = swift_slowAlloc();
    *(void *)&long long v136 = v98;
    *(_DWORD *)uint64_t v42 = 136315394;
    uint64_t v43 = v133;
    sub_100013CA8(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v44 = sub_1000450F0();
    uint64_t v135 = sub_1000434C0(v44, v45, (uint64_t *)&v136);
    sub_100044FA0();
    swift_bridgeObjectRelease();
    sub_1000136E0((uint64_t)v37, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    *(_WORD *)(v42 + 12) = 2080;
    sub_100013FCC((uint64_t)v34, (uint64_t)v32, &qword_100051070);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v32, 1, v43) == 1)
    {
      sub_100017B30((uint64_t)v32, &qword_100051070);
      uint64_t v46 = 1;
      uint64_t v47 = v10;
      uint64_t v48 = v129;
      unint64_t v21 = v100;
      uint64_t v49 = v114;
    }
    else
    {
      uint64_t v48 = v129;
      uint64_t v49 = v114;
      (*(void (**)(char *, char *, uint64_t))(v129 + 16))(v114, &v32[*(int *)(v43 + 20)], v10);
      sub_1000136E0((uint64_t)v32, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      uint64_t v46 = 0;
      uint64_t v47 = v10;
      unint64_t v21 = v100;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v48 + 56))(v49, v46, 1, v47);
    uint64_t v51 = sub_100044DF0();
    uint64_t v135 = sub_1000434C0(v51, v52, (uint64_t *)&v136);
    sub_100044FA0();
    swift_bridgeObjectRelease();
    sub_100017B30((uint64_t)v34, &qword_100051070);
    _os_log_impl((void *)&_mh_execute_header, v40, (os_log_type_t)v99, "Analysing request pair: %s -> %s", (uint8_t *)v42, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v50 = v48;
  }
  else
  {
    sub_1000136E0((uint64_t)v37, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    sub_100017B30((uint64_t)v34, &qword_100051070);

    uint64_t v47 = v10;
    uint64_t v50 = v129;
  }
  uint64_t v53 = (uint64_t)v131;
  uint64_t v54 = v132;
  uint64_t v55 = v134;
  v56 = v125;
  sub_10000A5C8(v132, (uint64_t)v125, v123, v134);
  sub_100013D44(v124, (uint64_t)&v136);
  type metadata accessor for UniversalSuggestionsRequestTaskStateExtractor();
  uint64_t v57 = swift_initStackObject() + 16;
  sub_100013CF0(&v136, v57);
  uint64_t v58 = v126;
  sub_100021E14(v54, v56, v126);
  swift_setDeallocating();
  sub_100006030(v57);
  sub_100013640(v55, v53, type metadata accessor for UniversalSuggestionCorrectionDiscovered);
  uint64_t v59 = v53 + *(int *)(v122 + 20);
  sub_100013640(v58, v59, type metadata accessor for UniversalSuggestionRequestTaskState);
  sub_100013640(v53 + *(int *)(v121 + 24), (uint64_t)v21, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
  uint64_t v60 = sub_100006080(&qword_100050FD0);
  int v61 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v60 - 8) + 48))(v21, 2, v60);
  uint64_t v62 = (uint64_t)v128;
  if (!v61)
  {
    sub_1000136E0(v58, type metadata accessor for UniversalSuggestionRequestTaskState);
    sub_1000136E0(v55, type metadata accessor for UniversalSuggestionCorrectionDiscovered);
    uint64_t v65 = &v21[*(int *)(v60 + 48)];
    v66 = *(void (**)(char *, char *, uint64_t))(v111 + 32);
    v67 = v109;
    uint64_t v68 = v112;
    v66(v109, v21, v112);
    uint64_t v69 = v50;
    v70 = v110;
    v66(v110, v65, v68);
    uint64_t v71 = type metadata accessor for RequestLinkedModelUpdateStep(0);
    uint64_t v72 = *(int *)(v71 + 20);
    uint64_t v129 = v47;
    uint64_t v73 = v130;
    uint64_t v74 = v130 + v72 + *(int *)(v60 + 48);
    v66((char *)(v130 + v72), v67, v68);
    v66((char *)v74, v70, v68);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v69 + 16))(v73, v132 + *(int *)(v133 + 20), v129);
    uint64_t v75 = v73 + *(int *)(v71 + 24);
    uint64_t v76 = type metadata accessor for UniversalSuggestionRequestState;
    uint64_t v77 = (uint64_t)v131;
    return sub_1000137A4(v77, v75, v76);
  }
  sub_1000136E0((uint64_t)v21, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
  swift_storeEnumTagMultiPayload();
  uint64_t v63 = v118;
  sub_100013FCC(v59 + *(int *)(v116 + 20), v118, &qword_100050FD8);
  uint64_t v64 = v119;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v117 + 48))(v63, 1, v119) != 1)
  {
    uint64_t v78 = v106;
    sub_1000137A4(v63, v106, type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState);
    uint64_t v79 = v78 + *(int *)(type metadata accessor for UniversalSuggestionItem(0) + 24);
    uint64_t v80 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 16);
    uint64_t v129 = v47;
    v80(v107, v79, v47);
    uint64_t v81 = v113;
    sub_100044A80();
    uint64_t v82 = v108;
    sub_100013640(v78 + *(int *)(v64 + 20), v108, type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState);
    sub_1000136E0(v78, type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState);
    uint64_t v83 = sub_100006080(&qword_100050FE0);
    int v84 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v83 - 8) + 48))(v82, 3, v83);
    if ((v84 - 2) >= 2)
    {
      if (v84)
      {
        (*(void (**)(char *, uint64_t))(v104 + 8))(v81, v103);
        goto LABEL_20;
      }
      sub_1000136E0(v62, type metadata accessor for ModelUpdateStep);
      uint64_t v85 = v82;
      uint64_t v86 = v101;
      sub_1000137A4(v85, v101, type metadata accessor for UniversalSuggestionDisambiguationOffered);
      int v87 = *(unsigned __int8 *)(v86 + *(int *)(v102 + 20));
      sub_1000136E0(v86, type metadata accessor for UniversalSuggestionDisambiguationOffered);
      if ((v87 - 1) >= 3)
      {
        uint64_t v47 = v129;
        (*(void (**)(uint64_t, char *, uint64_t))(v104 + 32))(v62, v113, v103);
        swift_storeEnumTagMultiPayload();
        goto LABEL_21;
      }
      (*(void (**)(uint64_t, char *, uint64_t))(v104 + 32))(v62, v113, v103);
    }
    else
    {
      sub_1000136E0(v62, type metadata accessor for ModelUpdateStep);
      (*(void (**)(uint64_t, char *, uint64_t))(v104 + 32))(v62, v81, v103);
    }
    swift_storeEnumTagMultiPayload();
LABEL_20:
    uint64_t v47 = v129;
    goto LABEL_21;
  }
  sub_100017B30(v63, &qword_100050FD8);
LABEL_21:
  uint64_t v88 = (uint64_t)v120;
  swift_storeEnumTagMultiPayload();
  char v89 = sub_10000FC38(v62, v88);
  sub_1000136E0(v88, type metadata accessor for ModelUpdateStep);
  uint64_t v90 = v134;
  if (v89)
  {
    v91 = sub_100044D40();
    os_log_type_t v92 = sub_100044F30();
    if (os_log_type_enabled(v91, v92))
    {
      v93 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v93 = 0;
      _os_log_impl((void *)&_mh_execute_header, v91, v92, "No learnable interactions found between these requests", v93, 2u);
      uint64_t v90 = v134;
      swift_slowDealloc();
    }
  }
  sub_1000136E0(v58, type metadata accessor for UniversalSuggestionRequestTaskState);
  sub_1000136E0(v90, type metadata accessor for UniversalSuggestionCorrectionDiscovered);
  uint64_t v94 = v130;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16))(v130, v54 + *(int *)(v133 + 20), v47);
  uint64_t v95 = type metadata accessor for RequestLinkedModelUpdateStep(0);
  sub_1000137A4(v53, v94 + *(int *)(v95 + 24), type metadata accessor for UniversalSuggestionRequestState);
  uint64_t v75 = v94 + *(int *)(v95 + 20);
  uint64_t v76 = type metadata accessor for ModelUpdateStep;
  uint64_t v77 = v62;
  return sub_1000137A4(v77, v75, v76);
}

uint64_t sub_10000A5C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v285 = a3;
  uint64_t v300 = a4;
  uint64_t v6 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
  __chkstk_darwin(v6 - 8);
  v301 = (char *)&v268 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006080(&qword_100051088);
  __chkstk_darwin(v8 - 8);
  uint64_t v281 = (uint64_t)&v268 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v282 = type metadata accessor for UniversalSuggestionsPromptState(0);
  uint64_t v280 = *(void *)(v282 - 8);
  __chkstk_darwin(v282);
  uint64_t v277 = (uint64_t)&v268 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100044850();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v288 = v11;
  uint64_t v289 = v12;
  uint64_t v13 = __chkstk_darwin(v11);
  v274 = (uint64_t *)((char *)&v268 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v13);
  v287 = (char *)&v268 - v15;
  uint64_t v16 = sub_100006080(&qword_100051090);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  v295 = (char *)&v268 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v268 - v19;
  uint64_t v21 = sub_100044510();
  uint64_t v298 = *(void *)(v21 - 8);
  uint64_t v299 = v21;
  uint64_t v22 = __chkstk_darwin(v21);
  v292 = (char *)&v268 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  v291 = (char *)&v268 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  v294 = (char *)&v268 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  v296 = (char *)&v268 - v29;
  __chkstk_darwin(v28);
  v297 = (char *)&v268 - v30;
  uint64_t v31 = type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = __chkstk_darwin(v31);
  uint64_t v278 = (uint64_t)&v268 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __chkstk_darwin(v33);
  uint64_t v275 = (uint64_t)&v268 - v36;
  uint64_t v37 = __chkstk_darwin(v35);
  uint64_t v273 = (uint64_t)&v268 - v38;
  uint64_t v39 = __chkstk_darwin(v37);
  uint64_t v276 = (uint64_t)&v268 - v40;
  uint64_t v41 = __chkstk_darwin(v39);
  uint64_t v279 = (uint64_t)&v268 - v42;
  uint64_t v43 = __chkstk_darwin(v41);
  v290 = (char *)&v268 - v44;
  uint64_t v45 = __chkstk_darwin(v43);
  uint64_t v286 = (uint64_t)&v268 - v46;
  uint64_t v47 = __chkstk_darwin(v45);
  uint64_t v49 = (char *)&v268 - v48;
  __chkstk_darwin(v47);
  uint64_t v51 = (char *)&v268 - v50;
  uint64_t v52 = sub_100006080(&qword_100051070);
  uint64_t v53 = __chkstk_darwin(v52 - 8);
  uint64_t v283 = (uint64_t)&v268 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __chkstk_darwin(v53);
  uint64_t v57 = (char *)&v268 - v56;
  __chkstk_darwin(v55);
  uint64_t v59 = (char *)&v268 - v58;
  sub_100013FCC(a2, (uint64_t)&v268 - v58, &qword_100051070);
  sub_100013640(a1, (uint64_t)v51, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  sub_100013FCC(a2, (uint64_t)v57, &qword_100051070);
  uint64_t v60 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48);
  v293 = (int *)v31;
  uint64_t v284 = v32 + 48;
  if (v60(v57, 1, v31) == 1)
  {
    sub_100017B30((uint64_t)v57, &qword_100051070);
    if (qword_100050C60 != -1) {
      swift_once();
    }
    uint64_t v61 = sub_100044D60();
    sub_1000136A8(v61, (uint64_t)qword_100050E38);
    uint64_t v62 = sub_100044D40();
    os_log_type_t v63 = sub_100044F30();
    BOOL v64 = os_log_type_enabled(v62, v63);
    uint64_t v66 = v300;
    uint64_t v65 = (uint64_t)v301;
    if (v64)
    {
      v67 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v67 = 0;
      _os_log_impl((void *)&_mh_execute_header, v62, v63, "Reached end of turn pairs, skipping.", v67, 2u);
      swift_slowDealloc();
    }

    uint64_t v68 = sub_100006080(&qword_100050FD0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v68 - 8) + 56))(v65, 1, 2, v68);
    sub_10000CD7C(v65, (uint64_t)v59, (uint64_t)v51, v66);
    sub_1000136E0(v65, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
    uint64_t v69 = (uint64_t)v51;
LABEL_16:
    sub_1000136E0(v69, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    uint64_t v86 = (uint64_t)v59;
    return sub_100017B30(v86, &qword_100051070);
  }
  sub_1000137A4((uint64_t)v57, (uint64_t)v49, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  sub_100013FCC(a1, (uint64_t)v20, &qword_100051090);
  uint64_t v70 = v298;
  uint64_t v71 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v298 + 48);
  if (v71(v20, 1, v299) == 1)
  {
    uint64_t v72 = v20;
LABEL_11:
    uint64_t v78 = (uint64_t)v301;
    sub_100017B30((uint64_t)v72, &qword_100051090);
    if (qword_100050C60 != -1) {
      swift_once();
    }
    uint64_t v79 = sub_100044D60();
    sub_1000136A8(v79, (uint64_t)qword_100050E38);
    uint64_t v80 = sub_100044D40();
    os_log_type_t v81 = sub_100044F40();
    BOOL v82 = os_log_type_enabled(v80, v81);
    uint64_t v83 = v300;
    if (v82)
    {
      int v84 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v84 = 0;
      _os_log_impl((void *)&_mh_execute_header, v80, v81, "Skipping turn pair - missing timestamp(s)", v84, 2u);
      swift_slowDealloc();
    }

    uint64_t v85 = sub_100006080(&qword_100050FD0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v85 - 8) + 56))(v78, 1, 2, v85);
    sub_10000CD7C(v78, (uint64_t)v59, (uint64_t)v51, v83);
    sub_1000136E0(v78, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
    sub_1000136E0((uint64_t)v49, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    uint64_t v69 = (uint64_t)v51;
    goto LABEL_16;
  }
  uint64_t v73 = v70;
  v270 = (uint64_t (*)(uint64_t, uint64_t, int *))v60;
  v271 = v51;
  v272 = v59;
  uint64_t v74 = *(void (**)(char *, char *, uint64_t))(v70 + 32);
  uint64_t v75 = v297;
  uint64_t v76 = v20;
  uint64_t v77 = v299;
  v74(v297, v76, v299);
  uint64_t v72 = v295;
  sub_100013FCC((uint64_t)v49, (uint64_t)v295, &qword_100051090);
  if (v71(v72, 1, v77) == 1)
  {
    (*(void (**)(char *, uint64_t))(v73 + 8))(v75, v77);
    uint64_t v59 = v272;
    uint64_t v51 = v271;
    goto LABEL_11;
  }
  uint64_t v268 = a1;
  v74(v296, v72, v77);
  uint64_t v88 = v294;
  sub_1000444D0();
  sub_100013CA8(&qword_100051098, (void (*)(uint64_t))&type metadata accessor for Date);
  char v89 = sub_100044DB0();
  v295 = *(char **)(v73 + 8);
  ((void (*)(char *, uint64_t))v295)(v88, v77);
  if (v89)
  {
    uint64_t v90 = v75;
    if (qword_100050C60 != -1) {
      swift_once();
    }
    uint64_t v91 = sub_100044D60();
    sub_1000136A8(v91, (uint64_t)qword_100050E38);
    os_log_type_t v92 = *(void (**)(char *, char *, uint64_t))(v73 + 16);
    v93 = v291;
    v92(v291, v90, v77);
    uint64_t v94 = v292;
    v92(v292, v296, v77);
    uint64_t v95 = sub_100044D40();
    os_log_type_t v96 = sub_100044F40();
    int v97 = v96;
    if (os_log_type_enabled(v95, v96))
    {
      uint64_t v98 = v77;
      uint64_t v99 = swift_slowAlloc();
      uint64_t v100 = swift_slowAlloc();
      v269 = v49;
      uint64_t v298 = v100;
      v303 = (char *)v100;
      *(_DWORD *)uint64_t v99 = 136315394;
      sub_100013CA8(&qword_1000510A0, (void (*)(uint64_t))&type metadata accessor for Date);
      LODWORD(v294) = v97;
      uint64_t v101 = sub_1000450F0();
      uint64_t v302 = sub_1000434C0(v101, v102, (uint64_t *)&v303);
      sub_100044FA0();
      swift_bridgeObjectRelease();
      uint64_t v103 = (void (*)(char *, uint64_t))v295;
      ((void (*)(char *, uint64_t))v295)(v93, v98);
      *(_WORD *)(v99 + 12) = 2080;
      uint64_t v104 = sub_1000450F0();
      uint64_t v302 = sub_1000434C0(v104, v105, (uint64_t *)&v303);
      uint64_t v90 = v297;
      sub_100044FA0();
      swift_bridgeObjectRelease();
      v103(v94, v98);
      _os_log_impl((void *)&_mh_execute_header, v95, (os_log_type_t)v294, "Skipping turn pair as they are too far apart in time: %s -> %s", (uint8_t *)v99, 0x16u);
      swift_arrayDestroy();
      uint64_t v49 = v269;
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v106 = (uint64_t)v272;
    }
    else
    {
      uint64_t v103 = (void (*)(char *, uint64_t))v295;
      ((void (*)(char *, uint64_t))v295)(v93, v77);
      v103(v94, v77);

      uint64_t v106 = (uint64_t)v272;
      uint64_t v98 = v77;
    }
    uint64_t v123 = (uint64_t)v271;
    uint64_t v125 = v300;
    uint64_t v124 = (uint64_t)v301;
    uint64_t v126 = sub_100006080(&qword_100050FD0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v126 - 8) + 56))(v124, 1, 2, v126);
    sub_10000CD7C(v124, v106, v123, v125);
    sub_1000136E0(v124, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
    v103(v296, v98);
    v103(v90, v98);
    uint64_t v127 = (uint64_t)v49;
LABEL_33:
    sub_1000136E0(v127, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    sub_1000136E0(v123, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    uint64_t v86 = v106;
    return sub_100017B30(v86, &qword_100051070);
  }
  uint64_t v298 = v73 + 8;
  unint64_t v107 = *(void *)&v49[v293[7]];
  uint64_t v108 = (uint64_t)v272;
  v269 = v49;
  if (v107 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v109 = sub_1000450C0();
    uint64_t v110 = (uint64_t)v290;
    if (!v109) {
      goto LABEL_43;
    }
  }
  else
  {
    uint64_t v109 = *(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    uint64_t v110 = (uint64_t)v290;
    if (!v109) {
      goto LABEL_43;
    }
  }
  if ((v107 & 0xC000000000000001) != 0)
  {
    uint64_t v111 = sub_100045020();
  }
  else
  {
    uint64_t v111 = *(void *)(v107 + 32);
    swift_retain();
  }
  char v112 = sub_100010394(v111);
  swift_release();
  if (v112)
  {
LABEL_28:
    swift_bridgeObjectRelease_n();
    v113 = v293;
    uint64_t v114 = v293[6];
    uint64_t v115 = *(void *)(v268 + v114);
    if (*(void *)(v115 + 16))
    {
      uint64_t v116 = *(void (**)(char *, unint64_t, uint64_t))(v289 + 16);
      v116(v287, v115 + ((*(unsigned __int8 *)(v289 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v289 + 80)), v288);
      uint64_t v117 = v283;
      sub_100013FCC(v285, v283, &qword_100051070);
      int v118 = v270(v117, 1, v113);
      uint64_t v119 = v299;
      if (v118 == 1)
      {
        uint64_t v120 = v268;
        sub_100017B30(v117, &qword_100051070);
        uint64_t v121 = v286;
        uint64_t v122 = v282;
      }
      else
      {
        sub_1000137A4(v117, v110, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
        uint64_t v120 = v268;
        char v154 = sub_100010758(v268, (uint64_t)v269, v110);
        uint64_t v121 = v286;
        uint64_t v122 = v282;
        if (v154)
        {
          sub_1000137A4(v110, v286, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
          goto LABEL_58;
        }
        sub_1000136E0(v110, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      }
      sub_100013640((uint64_t)v269, v121, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
LABEL_58:
      if (*(void *)(*(void *)(v120 + v114) + 16) != 1)
      {
        if (qword_100050C60 != -1) {
          swift_once();
        }
        uint64_t v157 = sub_100044D60();
        sub_1000136A8(v157, (uint64_t)qword_100050E38);
        uint64_t v158 = v120;
        uint64_t v159 = v278;
        sub_100013640(v158, v278, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
        v160 = sub_100044D40();
        os_log_type_t v161 = sub_100044F30();
        if (os_log_type_enabled(v160, v161))
        {
          v162 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v162 = 134217984;
          uint64_t v163 = *(void *)(*(void *)(v159 + v113[6]) + 16);
          sub_1000136E0(v159, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
          v303 = (char *)v163;
          sub_100044FA0();
          _os_log_impl((void *)&_mh_execute_header, v160, v161, "Correctable (first) turn mentioned %ld entities, which is unsupported -> correctedNotLearnable", v162, 0xCu);
          swift_slowDealloc();
        }
        else
        {
          sub_1000136E0(v159, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
        }
        uint64_t v168 = v300;
        uint64_t v169 = (uint64_t)v301;
        uint64_t v170 = (uint64_t)v269;
        v171 = v297;

        uint64_t v172 = sub_100006080(&qword_100050FD0);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v172 - 8) + 56))(v169, 2, 2, v172);
        uint64_t v173 = v168;
        uint64_t v141 = (uint64_t)v271;
        sub_10000CD7C(v169, v108, (uint64_t)v271, v173);
        sub_1000136E0(v169, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
        sub_1000136E0(v121, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
        (*(void (**)(char *, uint64_t))(v289 + 8))(v287, v288);
        v174 = (void (*)(char *, uint64_t))v295;
        uint64_t v175 = v299;
        ((void (*)(char *, uint64_t))v295)(v296, v299);
        v174(v171, v175);
        uint64_t v144 = v170;
        goto LABEL_131;
      }
      BOOL v304 = 0;
      uint64_t v155 = v281;
      sub_100013FCC(v121 + v113[10], v281, &qword_100051088);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v280 + 48))(v155, 1, v122) == 1)
      {
        sub_100017B30(v155, &qword_100051088);
        BOOL v156 = 0;
      }
      else
      {
        v164 = v116;
        uint64_t v165 = v277;
        sub_1000137A4(v155, v277, type metadata accessor for UniversalSuggestionsPromptState);
        uint64_t v166 = swift_bridgeObjectRetain();
        char v167 = sub_10000D3FC(v166);
        swift_bridgeObjectRelease();
        sub_1000136E0(v165, type metadata accessor for UniversalSuggestionsPromptState);
        if (v167 == 2)
        {
          BOOL v156 = 1;
          BOOL v304 = 1;
        }
        else
        {
          BOOL v304 = !(v167 & 1);
          BOOL v156 = (v167 & 1) == 0;
        }
        uint64_t v119 = v299;
        uint64_t v116 = v164;
      }
      uint64_t v176 = *(void *)(*(void *)(v121 + v113[6]) + 16);
      uint64_t v177 = v279;
      sub_100013640(v121, v279, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      if (v176 == 1)
      {
        sub_1000136E0(v177, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
LABEL_73:
        uint64_t v178 = v113[8];
        uint64_t v179 = v120 + v178;
        uint64_t v180 = *(void *)(v120 + v178);
        if (!v180 || (v181 = (uint64_t *)(v121 + v178), (uint64_t v182 = *v181) == 0))
        {
          if (qword_100050C60 != -1) {
            swift_once();
          }
          uint64_t v197 = sub_100044D60();
          sub_1000136A8(v197, (uint64_t)qword_100050E38);
          v187 = sub_100044D40();
          os_log_type_t v188 = sub_100044F30();
          BOOL v198 = os_log_type_enabled(v187, v188);
          uint64_t v190 = (uint64_t)v301;
          uint64_t v191 = (uint64_t)v269;
          if (!v198) {
            goto LABEL_91;
          }
          v192 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v192 = 0;
          v193 = "Could not read control home intents from turns, skipping pair...";
LABEL_90:
          _os_log_impl((void *)&_mh_execute_header, v187, v188, v193, v192, 2u);
          swift_slowDealloc();
LABEL_91:

          uint64_t v199 = sub_100006080(&qword_100050FD0);
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v199 - 8) + 56))(v190, 2, 2, v199);
          uint64_t v141 = (uint64_t)v271;
          sub_10000CD7C(v190, v108, (uint64_t)v271, v300);
          sub_1000136E0(v190, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
          sub_1000136E0(v121, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
          (*(void (**)(char *, uint64_t))(v289 + 8))(v287, v288);
          v200 = (void (*)(char *, uint64_t))v295;
          uint64_t v201 = v299;
          ((void (*)(char *, uint64_t))v295)(v296, v299);
          v200(v297, v201);
          uint64_t v144 = v191;
          goto LABEL_131;
        }
        v294 = (char *)v116;
        unint64_t v183 = *(void *)(v179 + 8);
        unint64_t v184 = v181[1];
        if (v184 >> 62)
        {
          sub_100013C68(v182);
          swift_bridgeObjectRetain();
          uint64_t v185 = sub_1000450C0();
          swift_bridgeObjectRelease();
          if (v185 == 1)
          {
LABEL_77:
            if ((sub_10001192C(v180, v183) & 1) == 0 && (sub_10001192C(v182, v184) & 1) == 0)
            {
              id v214 = sub_100011C50(v184);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v214)
              {
                char *v274 = v214;
                (*(void (**)(void))(v289 + 104))();
                swift_retain();
                uint64_t v215 = sub_100044840();
                if (!v216) {
                  goto LABEL_113;
                }
                uint64_t v217 = v215;
                unint64_t v218 = v216;
                uint64_t v219 = sub_100044840();
                if (!v220) {
                  goto LABEL_112;
                }
                uint64_t v221 = v219;
                unint64_t v222 = v220;
                if (qword_100050C60 != -1) {
                  swift_once();
                }
                uint64_t v223 = sub_100044D60();
                sub_1000136A8(v223, (uint64_t)qword_100050E38);
                sub_100013640(v120, v273, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                v224 = sub_100044D40();
                os_log_type_t v225 = sub_100044F30();
                if (os_log_type_enabled(v224, v225))
                {
                  uint64_t v226 = swift_slowAlloc();
                  v292 = (char *)swift_slowAlloc();
                  v303 = v292;
                  *(_DWORD *)uint64_t v226 = 136315650;
                  swift_bridgeObjectRetain();
                  uint64_t v302 = sub_1000434C0(v217, v218, (uint64_t *)&v303);
                  sub_100044FA0();
                  swift_bridgeObjectRelease_n();
                  *(_WORD *)(v226 + 12) = 2080;
                  swift_bridgeObjectRetain();
                  uint64_t v302 = sub_1000434C0(v221, v222, (uint64_t *)&v303);
                  sub_100044FA0();
                  swift_bridgeObjectRelease_n();
                  *(_WORD *)(v226 + 22) = 2080;
                  uint64_t v227 = v273;
                  uint64_t v228 = sub_100044520();
                  uint64_t v302 = sub_1000434C0(v228, v229, (uint64_t *)&v303);
                  sub_100044FA0();
                  swift_bridgeObjectRelease();
                  sub_1000136E0(v227, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
                  _os_log_impl((void *)&_mh_execute_header, v224, v225, "Found a correction response in request %s -> %s, requestId=%s", (uint8_t *)v226, 0x20u);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_slowDealloc();
                }
                else
                {
                  swift_bridgeObjectRelease_n();
                  swift_bridgeObjectRelease_n();
                  sub_1000136E0(v273, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
                }

                uint64_t v250 = sub_100006080(&qword_100050FD0);
                uint64_t v251 = (uint64_t)v301;
                v252 = &v301[*(int *)(v250 + 48)];
                v254 = v287;
                uint64_t v253 = v288;
                v255 = (void (*)(char *, void *, uint64_t))v294;
                ((void (*)(char *, char *, uint64_t))v294)(v301, v287, v288);
                v256 = (char *)v274;
                v255(v252, (char *)v274, v253);
                (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v250 - 8) + 56))(v251, 0, 2, v250);
                uint64_t v244 = (uint64_t)v272;
                uint64_t v245 = (uint64_t)v271;
                sub_10000CD7C(v251, (uint64_t)v272, (uint64_t)v271, v300);
                swift_release();
                sub_1000136E0(v251, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
                v247 = *(void (**)(char *, uint64_t))(v289 + 8);
                v247(v256, v253);
                sub_1000136E0(v286, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
                v248 = v254;
                uint64_t v249 = v253;
                goto LABEL_122;
              }
              if (qword_100050C60 != -1) {
                swift_once();
              }
              uint64_t v230 = sub_100044D60();
              sub_1000136A8(v230, (uint64_t)qword_100050E38);
              v231 = sub_100044D40();
              os_log_type_t v232 = sub_100044F30();
              if (os_log_type_enabled(v231, v232))
              {
                v233 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)v233 = 0;
                _os_log_impl((void *)&_mh_execute_header, v231, v232, "Skipping generating correction: no entity could be built from control home intent response", v233, 2u);
                swift_slowDealloc();
              }

              uint64_t v234 = sub_100006080(&qword_100050FD0);
              uint64_t v235 = (uint64_t)v301;
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v234 - 8) + 56))(v301, 2, 2, v234);
              uint64_t v106 = (uint64_t)v272;
              uint64_t v123 = (uint64_t)v271;
              sub_10000CD7C(v235, (uint64_t)v272, (uint64_t)v271, v300);
              sub_1000136E0(v235, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
              sub_1000136E0(v286, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
              (*(void (**)(char *, uint64_t))(v289 + 8))(v287, v288);
              v236 = (void (*)(char *, uint64_t))v295;
              uint64_t v237 = v299;
              ((void (*)(char *, uint64_t))v295)(v296, v299);
              v236(v297, v237);
              uint64_t v127 = (uint64_t)v269;
              goto LABEL_33;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (qword_100050C60 != -1) {
              swift_once();
            }
            uint64_t v186 = sub_100044D60();
            sub_1000136A8(v186, (uint64_t)qword_100050E38);
            v187 = sub_100044D40();
            os_log_type_t v188 = sub_100044F30();
            BOOL v189 = os_log_type_enabled(v187, v188);
            uint64_t v190 = (uint64_t)v301;
            uint64_t v191 = (uint64_t)v269;
            if (!v189) {
              goto LABEL_91;
            }
            v192 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v192 = 0;
            v193 = "Turns contain unsupported types of entities, skipping pair...";
            goto LABEL_90;
          }
        }
        else
        {
          uint64_t v185 = *(void *)((v184 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v185 == 1) {
            goto LABEL_77;
          }
        }
        if (qword_100050C60 != -1) {
          swift_once();
        }
        uint64_t v259 = sub_100044D60();
        sub_1000136A8(v259, (uint64_t)qword_100050E38);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v260 = sub_100044D40();
        os_log_type_t v261 = sub_100044F30();
        if (os_log_type_enabled(v260, v261))
        {
          v262 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v262 = 134217984;
          uint64_t v121 = v286;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v303 = (char *)v185;
          sub_100044FA0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v260, v261, "Correction (second) turn contains %ld resolved entities, which is unsupported -> correctedNotLearnable", v262, 0xCu);
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
        }
        uint64_t v263 = (uint64_t)v301;
        uint64_t v264 = (uint64_t)v269;
        uint64_t v265 = sub_100006080(&qword_100050FD0);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v265 - 8) + 56))(v263, 2, 2, v265);
        uint64_t v141 = (uint64_t)v271;
        sub_10000CD7C(v263, v108, (uint64_t)v271, v300);
        sub_1000136E0(v263, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
        sub_1000136E0(v121, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
        (*(void (**)(char *, uint64_t))(v289 + 8))(v287, v288);
        v266 = (void (*)(char *, uint64_t))v295;
        uint64_t v267 = v299;
        ((void (*)(char *, uint64_t))v295)(v296, v299);
        v266(v297, v267);
        uint64_t v144 = v264;
        goto LABEL_131;
      }
      uint64_t v194 = v276;
      sub_100013640(v177, v276, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      if (v156)
      {
        uint64_t v195 = v194;
        uint64_t v196 = *(void *)(*(void *)(v194 + v113[6]) + 16);
        sub_1000136E0(v195, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
        sub_1000136E0(v177, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
        if (!v196) {
          goto LABEL_73;
        }
      }
      else
      {
        sub_1000136E0(v194, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
        sub_1000136E0(v177, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      }
      uint64_t v202 = (uint64_t)v301;
      if (qword_100050C60 != -1) {
        swift_once();
      }
      uint64_t v203 = sub_100044D60();
      sub_1000136A8(v203, (uint64_t)qword_100050E38);
      uint64_t v204 = v275;
      sub_100013640(v121, v275, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      v205 = sub_100044D40();
      os_log_type_t v206 = sub_100044F30();
      if (os_log_type_enabled(v205, v206))
      {
        uint64_t v207 = swift_slowAlloc();
        *(_DWORD *)uint64_t v207 = 134218240;
        uint64_t v208 = *(void *)(*(void *)(v204 + v113[6]) + 16);
        sub_1000136E0(v204, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
        v303 = (char *)v208;
        sub_100044FA0();
        *(_WORD *)(v207 + 12) = 1024;
        swift_beginAccess();
        LODWORD(v302) = v304;
        sub_100044FA0();
        _os_log_impl((void *)&_mh_execute_header, v205, v206, "Correction (second) turn mentioned %ld entities and didDetectTouchInteraction=%{BOOL}d, which is unsupported -> correctedNotLearnable", (uint8_t *)v207, 0x12u);
        uint64_t v119 = v299;
        swift_slowDealloc();
      }
      else
      {
        sub_1000136E0(v204, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      }
      uint64_t v209 = v300;
      v210 = v297;

      uint64_t v211 = sub_100006080(&qword_100050FD0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v211 - 8) + 56))(v202, 2, 2, v211);
      uint64_t v212 = v209;
      uint64_t v141 = (uint64_t)v271;
      sub_10000CD7C(v202, v108, (uint64_t)v271, v212);
      sub_1000136E0(v202, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
      sub_1000136E0(v121, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      (*(void (**)(char *, uint64_t))(v289 + 8))(v287, v288);
      v213 = (void (*)(char *, uint64_t))v295;
      ((void (*)(char *, uint64_t))v295)(v296, v119);
      v213(v210, v119);
      uint64_t v144 = (uint64_t)v269;
      goto LABEL_131;
    }
    uint64_t v145 = v299;
    if (qword_100050C60 != -1) {
      swift_once();
    }
    uint64_t v146 = sub_100044D60();
    sub_1000136A8(v146, (uint64_t)qword_100050E38);
    v147 = sub_100044D40();
    os_log_type_t v148 = sub_100044F30();
    BOOL v149 = os_log_type_enabled(v147, v148);
    uint64_t v150 = (uint64_t)v301;
    uint64_t v138 = (uint64_t)v269;
    if (v149)
    {
      v151 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v151 = 0;
      _os_log_impl((void *)&_mh_execute_header, v147, v148, "Skipping turn because a correction cannot exist as long as the previous turn doesn't have an entity", v151, 2u);
      uint64_t v145 = v299;
      swift_slowDealloc();
    }

    uint64_t v152 = sub_100006080(&qword_100050FD0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v152 - 8) + 56))(v150, 1, 2, v152);
    uint64_t v141 = (uint64_t)v271;
    sub_10000CD7C(v150, v108, (uint64_t)v271, v300);
    sub_1000136E0(v150, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
    v153 = (void (*)(char *, uint64_t))v295;
    ((void (*)(char *, uint64_t))v295)(v296, v145);
    v153(v297, v145);
LABEL_48:
    uint64_t v144 = v138;
LABEL_131:
    sub_1000136E0(v144, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    sub_1000136E0(v141, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    uint64_t v86 = v108;
    return sub_100017B30(v86, &qword_100051070);
  }
  if (v109 == 1)
  {
LABEL_43:
    swift_bridgeObjectRelease_n();
    if (qword_100050C60 != -1) {
      swift_once();
    }
    uint64_t v133 = sub_100044D60();
    sub_1000136A8(v133, (uint64_t)qword_100050E38);
    uint64_t v134 = sub_100044D40();
    os_log_type_t v135 = sub_100044F30();
    BOOL v136 = os_log_type_enabled(v134, v135);
    uint64_t v137 = (uint64_t)v301;
    uint64_t v138 = (uint64_t)v269;
    if (v136)
    {
      v139 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v139 = 0;
      _os_log_impl((void *)&_mh_execute_header, v134, v135, "Next turn doesn't have a correction event, skipping pair...", v139, 2u);
      swift_slowDealloc();
    }

    uint64_t v140 = sub_100006080(&qword_100050FD0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v140 - 8) + 56))(v137, 1, 2, v140);
    uint64_t v141 = (uint64_t)v271;
    sub_10000CD7C(v137, v108, (uint64_t)v271, v300);
    sub_1000136E0(v137, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
    v142 = (void (*)(char *, uint64_t))v295;
    uint64_t v143 = v299;
    ((void (*)(char *, uint64_t))v295)(v296, v299);
    v142(v297, v143);
    goto LABEL_48;
  }
  uint64_t v128 = 5;
  while (1)
  {
    uint64_t v129 = v128 - 4;
    if ((v107 & 0xC000000000000001) == 0) {
      break;
    }
    uint64_t v130 = sub_100045020();
    uint64_t v131 = v128 - 3;
    if (__OFADD__(v129, 1)) {
      goto LABEL_111;
    }
LABEL_41:
    char v132 = sub_100010394(v130);
    swift_release();
    if (v132) {
      goto LABEL_28;
    }
    ++v128;
    if (v131 == v109) {
      goto LABEL_43;
    }
  }
  uint64_t v130 = *(void *)(v107 + 8 * v128);
  swift_retain();
  uint64_t v131 = v128 - 3;
  if (!__OFADD__(v129, 1)) {
    goto LABEL_41;
  }
LABEL_111:
  __break(1u);
LABEL_112:
  swift_bridgeObjectRelease();
LABEL_113:
  if (qword_100050C60 != -1) {
    swift_once();
  }
  uint64_t v238 = sub_100044D60();
  sub_1000136A8(v238, (uint64_t)qword_100050E38);
  v239 = sub_100044D40();
  os_log_type_t v240 = sub_100044F30();
  if (os_log_type_enabled(v239, v240))
  {
    v241 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v241 = 0;
    _os_log_impl((void *)&_mh_execute_header, v239, v240, "Skipping generating correction: could not extract names from the entities", v241, 2u);
    swift_slowDealloc();
  }

  uint64_t v242 = sub_100006080(&qword_100050FD0);
  uint64_t v243 = (uint64_t)v301;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v242 - 8) + 56))(v301, 2, 2, v242);
  uint64_t v244 = (uint64_t)v272;
  uint64_t v245 = (uint64_t)v271;
  sub_10000CD7C(v243, (uint64_t)v272, (uint64_t)v271, v300);
  swift_release();
  sub_1000136E0(v243, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
  uint64_t v246 = v288;
  v247 = *(void (**)(char *, uint64_t))(v289 + 8);
  v247((char *)v274, v288);
  sub_1000136E0(v286, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  v248 = v287;
  uint64_t v249 = v246;
LABEL_122:
  v247(v248, v249);
  v257 = (void (*)(char *, uint64_t))v295;
  uint64_t v258 = v299;
  ((void (*)(char *, uint64_t))v295)(v296, v299);
  v257(v297, v258);
  sub_1000136E0((uint64_t)v269, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  sub_1000136E0(v245, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  uint64_t v86 = v244;
  return sub_100017B30(v86, &qword_100051070);
}

uint64_t sub_10000CD7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_100006080(&qword_100051070);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100006080(&qword_100051078);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100006080(&qword_100050FD0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v13, 1, 2, v17);
  char v18 = sub_10002C3B0(a1, (uint64_t)v13);
  sub_1000136E0((uint64_t)v13, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
  if ((v18 & 1) == 0)
  {
    sub_100013FCC(a2, (uint64_t)v10, &qword_100051070);
    uint64_t v19 = type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48))(v10, 1, v19) != 1)
    {
      uint64_t v21 = &v10[*(int *)(v19 + 20)];
      uint64_t v20 = sub_100044540();
      uint64_t v22 = *(void *)(v20 - 8);
      (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v16, v21, v20);
      sub_1000136E0((uint64_t)v10, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v16, 0, 1, v20);
      goto LABEL_6;
    }
    sub_100017B30((uint64_t)v10, &qword_100051070);
  }
  uint64_t v20 = sub_100044540();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v16, 1, 1, v20);
LABEL_6:
  uint64_t v23 = a3 + *(int *)(type metadata accessor for UniversalSuggestionsFeaturisedTurn(0) + 20);
  sub_100044540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(a4, v23, v20);
  uint64_t v24 = type metadata accessor for UniversalSuggestionCorrectionDiscovered(0);
  sub_1000157D8((uint64_t)v16, a4 + *(int *)(v24 + 20), &qword_100051078);
  return sub_100013640(a1, a4 + *(int *)(v24 + 24), type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
}

uint64_t sub_10000D108@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_10000FAD8(a1);
  if (v6) {
    goto LABEL_10;
  }
  if (*(_DWORD *)(a1 + 36) != v5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32))
  {
    uint64_t v7 = sub_100044540();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = a2;
    uint64_t v11 = 1;
  }
  else
  {
    sub_10000FB78(result, v5, a1, a2);
    uint64_t v12 = sub_100044540();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v9 = v12;
    uint64_t v10 = a2;
    uint64_t v11 = 0;
  }
  return v8(v10, v11, 1, v9);
}

uint64_t sub_10000D1EC(uint64_t a1)
{
  return sub_10000D21C(a1, (void (*)(void))&type metadata accessor for PromptBeginEventType);
}

uint64_t sub_10000D204(uint64_t a1)
{
  return sub_10000D21C(a1, (void (*)(void))&type metadata accessor for PromptEndTaskName);
}

uint64_t sub_10000D21C(uint64_t a1, void (*a2)(void))
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_100013D44(v4, (uint64_t)&v7);
      sub_100013D44((uint64_t)&v7, (uint64_t)v9);
      sub_100006080(&qword_100051F10);
      a2(0);
      if (swift_dynamicCast()) {
        break;
      }
      sub_100006030((uint64_t)&v7);
      v4 += 40;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    sub_100013CF0(&v7, (uint64_t)v9);
  }
  else
  {
LABEL_6:
    uint64_t v10 = 0;
    memset(v9, 0, sizeof(v9));
  }
  sub_100013FCC((uint64_t)v9, (uint64_t)&v7, &qword_1000510B0);
  if (!v8)
  {
    sub_100017B30((uint64_t)&v7, &qword_1000510B0);
    goto LABEL_12;
  }
  sub_100006080(&qword_100051F10);
  a2(0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    uint64_t v5 = 0;
    goto LABEL_13;
  }
  swift_retain();
  sub_100044880();
  swift_release_n();
  uint64_t v5 = v7;
LABEL_13:
  sub_100017B30((uint64_t)v9, &qword_1000510B0);
  return v5;
}

uint64_t sub_10000D3B4(uint64_t a1)
{
  return sub_10000D21C(a1, (void (*)(void))&type metadata accessor for PromptEndEventType);
}

uint64_t sub_10000D3CC(uint64_t a1)
{
  return sub_10000D21C(a1, (void (*)(void))&type metadata accessor for PromptBeginTaskName);
}

uint64_t sub_10000D3E4(uint64_t a1)
{
  return sub_10000D21C(a1, (void (*)(void))&type metadata accessor for PromptBeginSlotName);
}

uint64_t sub_10000D3FC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_100013D44(v2, (uint64_t)&v5);
      sub_100013D44((uint64_t)&v5, (uint64_t)v7);
      sub_100006080(&qword_100051F10);
      sub_100044720();
      if (swift_dynamicCast()) {
        break;
      }
      sub_100006030((uint64_t)&v5);
      v2 += 40;
      if (!--v1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    sub_100013CF0(&v5, (uint64_t)v7);
  }
  else
  {
LABEL_6:
    uint64_t v8 = 0;
    memset(v7, 0, sizeof(v7));
  }
  sub_100013FCC((uint64_t)v7, (uint64_t)&v5, &qword_1000510B0);
  if (!v6)
  {
    sub_100017B30((uint64_t)&v5, &qword_1000510B0);
    goto LABEL_12;
  }
  sub_100006080(&qword_100051F10);
  sub_100044720();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    uint64_t v3 = 2;
    goto LABEL_13;
  }
  swift_retain();
  sub_100044880();
  swift_release_n();
  uint64_t v3 = v5;
LABEL_13:
  sub_100017B30((uint64_t)v7, &qword_1000510B0);
  return v3;
}

unint64_t sub_10000D580(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_100013D44(v2, (uint64_t)&v6);
      sub_100013D44((uint64_t)&v6, (uint64_t)v8);
      sub_100006080(&qword_100051F10);
      sub_100044910();
      if (swift_dynamicCast()) {
        break;
      }
      sub_100006030((uint64_t)&v6);
      v2 += 40;
      if (!--v1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    sub_100013CF0(&v6, (uint64_t)v8);
  }
  else
  {
LABEL_6:
    uint64_t v9 = 0;
    memset(v8, 0, sizeof(v8));
  }
  sub_100013FCC((uint64_t)v8, (uint64_t)&v6, &qword_1000510B0);
  if (!v7)
  {
    sub_100017B30((uint64_t)&v6, &qword_1000510B0);
    goto LABEL_12;
  }
  sub_100006080(&qword_100051F10);
  sub_100044910();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    uint64_t v4 = 0;
    unsigned __int8 v3 = 1;
    goto LABEL_13;
  }
  swift_retain();
  sub_100044880();
  swift_release_n();
  unsigned __int8 v3 = 0;
  uint64_t v4 = v6;
LABEL_13:
  sub_100017B30((uint64_t)v8, &qword_1000510B0);
  return v4 | ((unint64_t)v3 << 32);
}

uint64_t sub_10000D714@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_100013D44(v4, (uint64_t)&v8);
      sub_100013D44((uint64_t)&v8, (uint64_t)v10);
      sub_100006080(&qword_100051F10);
      sub_100044730();
      if (swift_dynamicCast()) {
        break;
      }
      sub_100006030((uint64_t)&v8);
      v4 += 40;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    sub_100013CF0(&v8, (uint64_t)v10);
  }
  else
  {
LABEL_6:
    uint64_t v11 = 0;
    memset(v10, 0, sizeof(v10));
  }
  sub_100013FCC((uint64_t)v10, (uint64_t)&v8, &qword_1000510B0);
  if (v9)
  {
    sub_100006080(&qword_100051F10);
    sub_100044730();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_100044880();
      swift_release_n();
      sub_100017B30((uint64_t)v10, &qword_1000510B0);
      uint64_t v5 = sub_100044540();
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(a2, 0, 1, v5);
    }
  }
  else
  {
    sub_100017B30((uint64_t)&v8, &qword_1000510B0);
  }
  sub_100017B30((uint64_t)v10, &qword_1000510B0);
  uint64_t v7 = sub_100044540();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a2, 1, 1, v7);
}

uint64_t sub_10000D910(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_100013D44(v2, (uint64_t)&v5);
      sub_100013D44((uint64_t)&v5, (uint64_t)v7);
      sub_100006080(&qword_100051F10);
      sub_100044AD0();
      if (swift_dynamicCast()) {
        break;
      }
      sub_100006030((uint64_t)&v5);
      v2 += 40;
      if (!--v1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    sub_100013CF0(&v5, (uint64_t)v7);
  }
  else
  {
LABEL_6:
    uint64_t v8 = 0;
    memset(v7, 0, sizeof(v7));
  }
  sub_100013FCC((uint64_t)v7, (uint64_t)&v5, &qword_1000510B0);
  if (!v6)
  {
    sub_100017B30((uint64_t)&v5, &qword_1000510B0);
    goto LABEL_12;
  }
  sub_100006080(&qword_100051F10);
  sub_100044AD0();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    uint64_t v3 = 0;
    goto LABEL_13;
  }
  swift_retain();
  sub_100044880();
  swift_release_n();
  uint64_t v3 = v5;
LABEL_13:
  sub_100017B30((uint64_t)v7, &qword_1000510B0);
  return v3;
}

uint64_t sub_10000DA94(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[6] = a6;
  v7[7] = a7;
  v7[4] = a4;
  v7[5] = a5;
  _OWORD v7[2] = a1;
  v7[3] = a3;
  uint64_t v8 = a2[1];
  v7[8] = *a2;
  v7[9] = v8;
  return _swift_task_switch(sub_10000DAC4, 0, 0);
}

uint64_t sub_10000DAC4()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = (void (*)(char *, uint64_t))v0[9];
  uint64_t v3 = v0[6];
  uint64_t v4 = (id *)v0[5];
  uint64_t v6 = v0[2];
  long long v5 = (void (**)(char *, uint64_t, uint64_t, uint64_t))v0[3];
  sub_10000DB94(v1, v2, v5, v4, v3, v6);
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_10000DB94@<X0>(uint64_t a1@<X0>, void (*a2)(char *, uint64_t)@<X1>, void (**a3)(char *, uint64_t, uint64_t, uint64_t)@<X2>, id *a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v167 = a5;
  uint64_t v173 = a4;
  uint64_t v176 = a3;
  uint64_t v177 = a6;
  uint64_t v165 = sub_100006080(&qword_100051090);
  __chkstk_darwin(v165);
  v164 = (char *)&v155 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006080(&qword_100051088);
  __chkstk_darwin(v9 - 8);
  uint64_t v170 = (uint64_t)&v155 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100006080(&qword_100051078);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v168 = (char *)&v155 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v155 - v15;
  __chkstk_darwin(v14);
  char v18 = (char *)&v155 - v17;
  uint64_t v19 = sub_100044540();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v163 = (char *)&v155 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v166 = (char *)&v155 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  unint64_t v184 = (char *)&v155 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v178 = (char *)&v155 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  v174 = (char *)&v155 - v30;
  uint64_t v31 = __chkstk_darwin(v29);
  uint64_t v172 = (char *)&v155 - v32;
  __chkstk_darwin(v31);
  uint64_t v34 = (char *)&v155 - v33;
  sub_1000449B0();
  swift_allocObject();
  uint64_t v179 = a2;
  swift_retain();
  swift_retain();
  sub_1000449A0();
  sub_100044C60();
  uint64_t v35 = sub_100044990();
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000D714(v35, (uint64_t)v18);
  swift_bridgeObjectRelease();
  uint64_t v185 = *(NSObject **)(v20 + 48);
  uint64_t v186 = (uint8_t *)(v20 + 48);
  int v36 = ((uint64_t (*)(char *, uint64_t, uint64_t))v185)(v18, 1, v19);
  *(void *)&long long v183 = v20;
  if (v36 != 1)
  {
    uint64_t v47 = *(void (**)(void, void, void))(v20 + 32);
    uint64_t v169 = v34;
    uint64_t v187 = v19;
    v181 = (void (*)(char *, char *, uint64_t))v47;
    uint64_t v182 = v20 + 32;
    v47(v34, v18, v19);
    sub_100044780();
    sub_100044C60();
    uint64_t v162 = sub_100044770();
    swift_bridgeObjectRelease();
    uint64_t v175 = a1;
    sub_100044C60();
    uint64_t v48 = sub_100044670();
    swift_bridgeObjectRelease();
    uint64_t v49 = _swiftEmptyArrayStorage;
    uint64_t v191 = _swiftEmptyArrayStorage;
    uint64_t v50 = *(void *)(v48 + 16);
    if (v50)
    {
      uint64_t v51 = v48 + 32;
      swift_bridgeObjectRetain();
      do
      {
        sub_100013D44(v51, (uint64_t)v190);
        sub_100013D44((uint64_t)v190, (uint64_t)&v188);
        sub_100006080(&qword_100051F10);
        sub_100044660();
        if ((swift_dynamicCast() & 1) == 0) {
          uint64_t v189 = 0;
        }
        sub_100006030((uint64_t)v190);
        if (v189)
        {
          sub_100044E30();
          if (*(void *)(((unint64_t)v191 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)v191 & 0xFFFFFFFFFFFFFF8)
                                                                                               + 0x18) >> 1)
            sub_100044E60();
          sub_100044E70();
          sub_100044E50();
        }
        v51 += 40;
        --v50;
      }
      while (v50);
      swift_bridgeObjectRelease();
      uint64_t v49 = v191;
    }
    swift_bridgeObjectRelease();
    uint64_t v52 = v175;
    uint64_t v53 = sub_100014300();
    uint64_t v54 = v53;
    uint64_t v55 = v180;
    uint64_t v56 = v183;
    if ((unint64_t)v53 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v135 = sub_1000450C0();
      swift_bridgeObjectRelease();
      uint64_t v57 = v187;
      if (v135)
      {
LABEL_18:
        uint64_t v58 = sub_100014C14(v52, v179, v173);
        if (v55)
        {
          (*(void (**)(char *, uint64_t))(v56 + 8))(v169, v57);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          return swift_release();
        }
        os_log_type_t v161 = v59;
        uint64_t v172 = (char *)v58;
        uint64_t v158 = v54;
        uint64_t v159 = v49;
        sub_100044980();
        swift_allocObject();
        sub_100044970();
        sub_100044C60();
        uint64_t v61 = sub_100044960();
        swift_release();
        swift_bridgeObjectRelease();
        unint64_t v62 = sub_10000D580(v61);
        swift_bridgeObjectRelease();
        if ((v62 & 0x100000000) != 0)
        {
          if (!v179) {
            goto LABEL_28;
          }
          swift_retain();
          os_log_type_t v63 = sub_100014300();
          if ((unint64_t)v63 >> 62) {
            goto LABEL_81;
          }
          uint64_t v64 = *(void *)(((unint64_t)v63 & 0xFFFFFFFFFFFFFF8) + 0x10);
          goto LABEL_26;
        }
        uint64_t v157 = 0;
        while (1)
        {
          unint64_t v66 = sub_100014074();
          unint64_t v67 = v66;
          if (v66 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v68 = sub_1000450C0();
          }
          else
          {
            uint64_t v68 = *(void *)((v66 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
          }
          uint64_t v180 = 0;
          unint64_t v160 = v62;
          if (!v68)
          {
            uint64_t v71 = _swiftEmptyArrayStorage;
            uint64_t v77 = v57;
            goto LABEL_51;
          }
          if (v68 >= 1) {
            break;
          }
          __break(1u);
LABEL_81:
          uint64_t v64 = sub_1000450C0();
LABEL_26:
          swift_bridgeObjectRelease();
          if (v64)
          {
            swift_release();
LABEL_28:
            unint64_t v62 = 0;
            uint64_t v157 = 1;
          }
          else
          {
            swift_allocObject();
            sub_100044970();
            sub_100044C60();
            uint64_t v65 = sub_100044960();
            swift_release();
            swift_bridgeObjectRelease();
            unint64_t v62 = sub_10000D580(v65);
            swift_bridgeObjectRelease();
            swift_release();
            uint64_t v157 = HIDWORD(v62) & 1;
          }
        }
        uint64_t v69 = 0;
        uint64_t v70 = (id *)(v67 & 0xC000000000000001);
        uint64_t v176 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v56 + 56);
        uint64_t v71 = _swiftEmptyArrayStorage;
        uint64_t v171 = (uint64_t)v16;
        uint64_t v173 = (id *)(v67 & 0xC000000000000001);
        do
        {
          if (v70) {
            id v72 = (id)sub_100045020();
          }
          else {
            id v72 = *(id *)(v67 + 8 * v69 + 32);
          }
          uint64_t v73 = v72;
          id v74 = [v72 eventMetadata];
          if (v74
            && (v75 = v74, id v76 = [v74 taskId], v75, v76))
          {
            sub_100044F20();

            uint64_t v73 = v76;
            uint64_t v77 = v187;
          }
          else
          {
            uint64_t v77 = v187;
            (*v176)(v16, 1, 1, v187);
          }

          if (((unsigned int (*)(char *, uint64_t, uint64_t))v185)(v16, 1, v77) == 1)
          {
            sub_100017B30((uint64_t)v16, &qword_100051078);
          }
          else
          {
            uint64_t v78 = v16;
            unint64_t v79 = v67;
            uint64_t v80 = v68;
            os_log_type_t v81 = v178;
            BOOL v82 = v181;
            v181(v178, v78, v77);
            v82(v184, v81, v77);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v71 = (id *)sub_1000430D8(0, (int64_t)v71[2] + 1, 1, (unint64_t)v71);
            }
            unint64_t v84 = (unint64_t)v71[2];
            unint64_t v83 = (unint64_t)v71[3];
            uint64_t v68 = v80;
            if (v84 >= v83 >> 1) {
              uint64_t v71 = (id *)sub_1000430D8(v83 > 1, v84 + 1, 1, (unint64_t)v71);
            }
            unint64_t v67 = v79;
            v71[2] = (id)(v84 + 1);
            v181((char *)v71+ ((*(unsigned __int8 *)(v183 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v183 + 80))+ *(void *)(v183 + 72) * v84, v184, v77);
            uint64_t v16 = (char *)v171;
            uint64_t v70 = v173;
          }
          ++v69;
        }
        while (v68 != v69);
LABEL_51:
        uint64_t v85 = v77;
        swift_bridgeObjectRelease_n();
        uint64_t v86 = sub_10002C824((uint64_t)v71);
        swift_bridgeObjectRelease();
        sub_100044B20();
        swift_allocObject();
        sub_100044B10();
        sub_100044C60();
        uint64_t v87 = sub_100044B00();
        swift_release();
        swift_bridgeObjectRelease();
        if (qword_100050C60 != -1) {
          swift_once();
        }
        uint64_t v88 = sub_100044D60();
        uint64_t v89 = sub_1000136A8(v88, (uint64_t)qword_100050E38);
        uint64_t v90 = v183;
        uint64_t v91 = v166;
        (*(void (**)(char *, char *, uint64_t))(v183 + 16))(v166, v169, v85);
        swift_retain_n();
        os_log_type_t v92 = sub_100044D40();
        os_log_type_t v93 = sub_100044F30();
        LODWORD(v173) = v93;
        BOOL v94 = os_log_type_enabled(v92, v93);
        unint64_t v184 = (char *)v89;
        uint64_t v178 = (char *)v86;
        uint64_t v176 = (void (**)(char *, uint64_t, uint64_t, uint64_t))v87;
        if (v94)
        {
          uint64_t v95 = swift_slowAlloc();
          uint64_t v171 = swift_slowAlloc();
          v190[0] = v171;
          *(_DWORD *)uint64_t v95 = 136315650;
          uint64_t v155 = v95 + 4;
          os_log_type_t v96 = v174;
          sub_100044C70();
          sub_100013CA8(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
          os_log_t v156 = v92;
          uint64_t v97 = v90;
          uint64_t v98 = sub_1000450F0();
          unint64_t v100 = v99;
          *(void *)&long long v183 = *(void *)(v97 + 8);
          ((void (*)(char *, uint64_t))v183)(v96, v85);
          uint64_t v188 = sub_1000434C0(v98, v100, v190);
          sub_100044FA0();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v95 + 12) = 2080;
          uint64_t v87 = (uint64_t)v176;
          uint64_t v101 = sub_1000450F0();
          uint64_t v188 = sub_1000434C0(v101, v102, v190);
          sub_100044FA0();
          swift_bridgeObjectRelease();
          ((void (*)(char *, uint64_t))v183)(v91, v85);
          *(_WORD *)(v95 + 22) = 2080;
          sub_100044C50();
          uint64_t v103 = sub_100044DF0();
          uint64_t v188 = sub_1000434C0(v103, v104, v190);
          sub_100044FA0();
          swift_release_n();
          swift_bridgeObjectRelease();
          os_log_t v105 = v156;
          _os_log_impl((void *)&_mh_execute_header, v156, (os_log_type_t)v173, "Turn %s, requestId=%s, date=%s. Features:", (uint8_t *)v95, 0x20u);
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v86 = (uint64_t)v178;
          swift_slowDealloc();
        }
        else
        {
          swift_release_n();
          (*(void (**)(char *, uint64_t))(v90 + 8))(v91, v85);

          swift_release_n();
        }
        uint64_t v106 = v177;
        uint64_t v107 = (uint64_t)v168;
        uint64_t v108 = *(void *)(v87 + 16);
        if (v108)
        {
          uint64_t v109 = v87 + 32;
          swift_bridgeObjectRetain();
          *(void *)&long long v110 = 136315138;
          long long v183 = v110;
          do
          {
            sub_100013D44(v109, (uint64_t)v190);
            uint64_t v111 = sub_100044D40();
            os_log_type_t v112 = sub_100044F30();
            if (os_log_type_enabled(v111, v112))
            {
              uint64_t v113 = swift_slowAlloc();
              uint64_t v188 = swift_slowAlloc();
              *(_DWORD *)uint64_t v113 = v183;
              sub_100005E74(v190, v190[3]);
              uint64_t v114 = sub_1000450F0();
              *(void *)(v113 + 4) = sub_1000434C0(v114, v115, &v188);
              swift_bridgeObjectRelease();
              sub_100006030((uint64_t)v190);
              _os_log_impl((void *)&_mh_execute_header, v111, v112, "    %s", (uint8_t *)v113, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {

              sub_100006030((uint64_t)v190);
            }
            v109 += 40;
            --v108;
          }
          while (v108);
          uint64_t v87 = (uint64_t)v176;
          swift_bridgeObjectRelease();
          uint64_t v106 = v177;
          uint64_t v107 = (uint64_t)v168;
          uint64_t v86 = (uint64_t)v178;
        }
        if (*(void *)(v86 + 16) == 1)
        {
          sub_10000D108(v86, v107);
          uint64_t v116 = v187;
          if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v185)(v107, 1, v187) != 1)
          {
            swift_bridgeObjectRelease();
            uint64_t v122 = v163;
            uint64_t v123 = (void (*)(uint64_t, char *, uint64_t))v181;
            v181(v163, (char *)v107, v116);
            uint64_t v124 = v170;
            v123(v170, v122, v116);
            uint64_t v125 = type metadata accessor for UniversalSuggestionsPromptState(0);
            *(void *)(v124 + *(int *)(v125 + 20)) = v87;
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v125 - 8) + 56))(v124, 0, 1, v125);
LABEL_71:
            uint64_t v126 = v159;
            uint64_t v127 = v158;
            char v128 = v157;
            sub_100044C60();
            uint64_t v129 = sub_100044B90();
            swift_bridgeObjectRelease();
            uint64_t v130 = sub_10000D910(v129);
            swift_bridgeObjectRelease();
            sub_100044C50();
            swift_release();
            swift_release();
            uint64_t v131 = (int *)type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
            v181((char *)(v106 + v131[5]), v169, v187);
            *(void *)(v106 + v131[6]) = v162;
            *(void *)(v106 + v131[7]) = v126;
            char v132 = (char **)(v106 + v131[8]);
            uint64_t v133 = v161;
            *char v132 = v172;
            v132[1] = v133;
            *(void *)(v106 + v131[9]) = v127;
            sub_1000157D8(v170, v106 + v131[10], &qword_100051088);
            uint64_t v134 = v106 + v131[11];
            *(_DWORD *)uint64_t v134 = v160;
            *(unsigned char *)(v134 + 4) = v128;
            *(void *)(v106 + v131[12]) = v130;
            return (*(uint64_t (**)(uint64_t, void, uint64_t, int *))(*((void *)v131 - 1) + 56))(v106, 0, 1, v131);
          }
          swift_bridgeObjectRelease();
          sub_100017B30(v107, &qword_100051078);
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        uint64_t v117 = type metadata accessor for UniversalSuggestionsPromptState(0);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v117 - 8) + 56))(v170, 1, 1, v117);
        swift_bridgeObjectRetain();
        int v118 = sub_100044D40();
        os_log_type_t v119 = sub_100044F40();
        if (os_log_type_enabled(v118, v119))
        {
          uint64_t v120 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v120 = 134217984;
          uint64_t v121 = *(void *)(v86 + 16);
          swift_bridgeObjectRelease();
          v190[0] = v121;
          sub_100044FA0();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v118, v119, "The flow prompt state extraction is performed only for single-task turns, found %ld tasks", v120, 0xCu);
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        goto LABEL_71;
      }
    }
    else
    {
      uint64_t v57 = v187;
      if (*(void *)(((unint64_t)v53 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_18;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_100050C60 != -1) {
      swift_once();
    }
    uint64_t v136 = sub_100044D60();
    sub_1000136A8(v136, (uint64_t)qword_100050E38);
    uint64_t v137 = v172;
    uint64_t v138 = v169;
    (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v172, v169, v57);
    swift_retain_n();
    v139 = sub_100044D40();
    os_log_type_t v140 = sub_100044F30();
    int v141 = v140;
    if (os_log_type_enabled(v139, v140))
    {
      uint64_t v142 = swift_slowAlloc();
      uint64_t v187 = swift_slowAlloc();
      v190[0] = v187;
      *(_DWORD *)uint64_t v142 = 136315394;
      uint64_t v182 = v142 + 4;
      uint64_t v143 = v174;
      LODWORD(v186) = v141;
      sub_100044C70();
      sub_100013CA8(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v144 = sub_1000450F0();
      uint64_t v145 = v56;
      unint64_t v147 = v146;
      uint64_t v185 = v139;
      unint64_t v184 = *(char **)(v145 + 8);
      ((void (*)(char *, uint64_t))v184)(v143, v57);
      uint64_t v188 = sub_1000434C0(v144, v147, v190);
      sub_100044FA0();
      swift_release_n();
      uint64_t v41 = v177;
      swift_bridgeObjectRelease();
      *(_WORD *)(v142 + 12) = 2080;
      os_log_type_t v148 = v172;
      uint64_t v149 = sub_1000450F0();
      uint64_t v188 = sub_1000434C0(v149, v150, v190);
      sub_100044FA0();
      swift_bridgeObjectRelease();
      v151 = (void (*)(char *, uint64_t))v184;
      ((void (*)(char *, uint64_t))v184)(v148, v57);
      os_log_t v152 = v185;
      _os_log_impl((void *)&_mh_execute_header, v185, (os_log_type_t)v186, "The turn/request didn't make it to execution - skipping: %s/%s", (uint8_t *)v142, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();

      swift_release();
      v151(v169, v57);
    }
    else
    {

      swift_release();
      v153 = *(void (**)(char *, uint64_t))(v56 + 8);
      v153(v137, v57);
      swift_release_n();
      v153(v138, v57);
      uint64_t v41 = v177;
    }
    goto LABEL_78;
  }
  sub_100017B30((uint64_t)v18, &qword_100051078);
  if (qword_100050C60 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_100044D60();
  sub_1000136A8(v37, (uint64_t)qword_100050E38);
  swift_retain_n();
  uint64_t v38 = sub_100044D40();
  os_log_type_t v39 = sub_100044F40();
  BOOL v40 = os_log_type_enabled(v38, v39);
  uint64_t v41 = v177;
  if (v40)
  {
    uint64_t v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v187 = swift_slowAlloc();
    v190[0] = v187;
    *(_DWORD *)uint64_t v42 = 136315138;
    uint64_t v186 = v42 + 4;
    uint64_t v43 = v174;
    sub_100044C70();
    sub_100013CA8(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v44 = sub_1000450F0();
    unint64_t v46 = v45;
    (*(void (**)(char *, uint64_t))(v183 + 8))(v43, v19);
    uint64_t v188 = sub_1000434C0(v44, v46, v190);
    sub_100044FA0();
    swift_release_n();
    uint64_t v41 = v177;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v38, v39, "Skipping pair having turn with id %s, cannot extract request id", v42, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_release();

    swift_release();
  }
  else
  {

    swift_release();
    swift_release_n();
  }
LABEL_78:
  uint64_t v154 = type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v154 - 8) + 56))(v41, 1, 1, v154);
}

uint64_t sub_10000F3D4()
{
  sub_100006030(v0 + 16);
  sub_100006030(v0 + 56);
  sub_100006030(v0 + 104);
  sub_100006030(v0 + 144);
  swift_release();
  return _swift_deallocClassInstance(v0, 192, 7);
}

uint64_t type metadata accessor for SiriUserFeedbackLearningUniversalSuggestionsEngine()
{
  return self;
}

uint64_t type metadata accessor for ModelUpdateStep(uint64_t a1)
{
  return sub_100013C30(a1, qword_100051228);
}

uint64_t type metadata accessor for RequestLinkedModelUpdateStep(uint64_t a1)
{
  return sub_100013C30(a1, qword_100051178);
}

uint64_t sub_10000F490()
{
  uint64_t v39 = sub_100044AA0();
  uint64_t v1 = *(void *)(v39 - 8);
  uint64_t v2 = __chkstk_darwin(v39);
  uint64_t v4 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v7 = (char *)&v38 - v6;
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v38 - v8;
  uint64_t v10 = sub_100044850();
  uint64_t v38 = *(void *)(v10 - 8);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v38 - v14;
  uint64_t updated = type metadata accessor for ModelUpdateStep(0);
  __chkstk_darwin(updated);
  char v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100013640(v0, (uint64_t)v18, type metadata accessor for ModelUpdateStep);
  uint64_t v19 = 1701736302;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v28 = v1;
      uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v1 + 32);
      uint64_t v30 = v39;
      v29(v9, v18, v39);
      unint64_t v40 = 0;
      unint64_t v41 = 0xE000000000000000;
      sub_100045000(41);
      v44._countAndFlagsBits = 0xD000000000000026;
      v44._object = (void *)0x8000000100046970;
      sub_100044E10(v44);
      sub_100045090();
      v45._countAndFlagsBits = 41;
      v45._object = (void *)0xE100000000000000;
      sub_100044E10(v45);
      uint64_t v19 = v40;
      (*(void (**)(char *, uint64_t))(v28 + 8))(v9, v30);
      break;
    case 2u:
      uint64_t v31 = v1;
      uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v1 + 32);
      uint64_t v33 = v39;
      v32(v7, v18, v39);
      unint64_t v40 = 0;
      unint64_t v41 = 0xE000000000000000;
      sub_100045000(42);
      v46._countAndFlagsBits = 0xD000000000000027;
      v46._object = (void *)0x8000000100046940;
      sub_100044E10(v46);
      sub_100045090();
      v47._countAndFlagsBits = 41;
      v47._object = (void *)0xE100000000000000;
      sub_100044E10(v47);
      uint64_t v19 = v40;
      (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v33);
      break;
    case 3u:
      uint64_t v34 = v1;
      uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v1 + 32);
      uint64_t v36 = v39;
      v35(v4, v18, v39);
      unint64_t v40 = 0;
      unint64_t v41 = 0xE000000000000000;
      sub_100045000(29);
      v48._object = (void *)0x8000000100046920;
      v48._countAndFlagsBits = 0xD00000000000001BLL;
      sub_100044E10(v48);
      sub_100045090();
      uint64_t v19 = v40;
      (*(void (**)(char *, uint64_t))(v34 + 8))(v4, v36);
      break;
    case 4u:
      return v19;
    default:
      uint64_t v20 = &v18[*(int *)(sub_100006080(&qword_100050FD0) + 48)];
      uint64_t v21 = v38;
      uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v38 + 32);
      v22(v15, v18, v10);
      v22(v13, v20, v10);
      unint64_t v40 = 0;
      unint64_t v41 = 0xE000000000000000;
      sub_100045000(45);
      swift_bridgeObjectRelease();
      unint64_t v40 = 0xD00000000000001ELL;
      unint64_t v41 = 0x80000001000469A0;
      v23._countAndFlagsBits = sub_100044840();
      if (v23._object)
      {
        object = v23._object;
      }
      else
      {
        v23._countAndFlagsBits = 7104878;
        object = (void *)0xE300000000000000;
      }
      v23._object = object;
      sub_100044E10(v23);
      swift_bridgeObjectRelease();
      v42._countAndFlagsBits = 0x746567726174202CLL;
      v42._object = (void *)0xEA0000000000203ALL;
      sub_100044E10(v42);
      v25._countAndFlagsBits = sub_100044840();
      if (v25._object)
      {
        uint64_t v26 = v25._object;
      }
      else
      {
        v25._countAndFlagsBits = 7104878;
        uint64_t v26 = (void *)0xE300000000000000;
      }
      v25._object = v26;
      sub_100044E10(v25);
      swift_bridgeObjectRelease();
      v43._countAndFlagsBits = 41;
      v43._object = (void *)0xE100000000000000;
      sub_100044E10(v43);
      uint64_t v19 = v40;
      uint64_t v27 = *(void (**)(char *, uint64_t))(v21 + 8);
      v27(v13, v10);
      v27(v15, v10);
      break;
  }
  return v19;
}

uint64_t sub_10000FA10()
{
  uint64_t v0 = sub_100044D60();
  sub_100013740(v0, qword_100050E38);
  uint64_t v1 = sub_1000136A8(v0, (uint64_t)qword_100050E38);
  if (qword_100050C68 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000136A8(v0, (uint64_t)qword_100052920);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_10000FAD8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_10000FB78@<X0>(uint64_t result@<X0>, int a2@<W1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  if (result < 0 || (uint64_t v4 = result, 1 << *(unsigned char *)(a3 + 32) <= result))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (((*(void *)(a3 + 8 * ((unint64_t)result >> 6) + 56) >> result) & 1) == 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (*(_DWORD *)(a3 + 36) != a2)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v6 = *(void *)(a3 + 48);
  uint64_t v7 = sub_100044540();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  uint64_t v10 = v6 + *(void *)(v8 + 72) * v4;
  return v9(a4, v10, v7);
}

uint64_t sub_10000FC38(uint64_t a1, uint64_t a2)
{
  uint64_t v70 = a2;
  uint64_t v3 = sub_100044AA0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v68 = v3;
  uint64_t v69 = v4;
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v64 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  os_log_type_t v63 = (char *)&v61 - v8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v61 - v9;
  uint64_t v11 = sub_100044850();
  uint64_t v66 = *(void *)(v11 - 8);
  uint64_t v67 = v11;
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v61 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v65 = (char *)&v61 - v15;
  __chkstk_darwin(v14);
  unint64_t v62 = (char *)&v61 - v16;
  uint64_t updated = type metadata accessor for ModelUpdateStep(0);
  uint64_t v18 = __chkstk_darwin(updated);
  uint64_t v20 = (char *)&v61 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v18);
  Swift::String v23 = (char *)&v61 - v22;
  uint64_t v24 = __chkstk_darwin(v21);
  uint64_t v26 = (char *)&v61 - v25;
  __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v61 - v27;
  uint64_t v29 = sub_100006080(&qword_100051080);
  uint64_t v30 = __chkstk_darwin(v29 - 8);
  uint64_t v32 = (char *)&v61 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = (uint64_t)&v32[*(int *)(v30 + 56)];
  sub_100013640(a1, (uint64_t)v32, type metadata accessor for ModelUpdateStep);
  sub_100013640(v70, v33, type metadata accessor for ModelUpdateStep);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_100013640((uint64_t)v32, (uint64_t)v26, type metadata accessor for ModelUpdateStep);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v37 = v69;
        uint64_t v38 = v33;
        uint64_t v39 = v68;
        (*(void (**)(char *, uint64_t, uint64_t))(v69 + 32))(v10, v38, v68);
        char v40 = sub_100044A90();
        unint64_t v41 = *(void (**)(char *, uint64_t))(v37 + 8);
        v41(v10, v39);
        v41(v26, v39);
        goto LABEL_11;
      }
      (*(void (**)(char *, uint64_t))(v69 + 8))(v26, v68);
      goto LABEL_17;
    case 2u:
      sub_100013640((uint64_t)v32, (uint64_t)v23, type metadata accessor for ModelUpdateStep);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v42 = v69;
        Swift::String v43 = v63;
        uint64_t v44 = v33;
        uint64_t v45 = v68;
        (*(void (**)(char *, uint64_t, uint64_t))(v69 + 32))(v63, v44, v68);
        char v40 = sub_100044A90();
        Swift::String v46 = *(void (**)(char *, uint64_t))(v42 + 8);
        v46(v43, v45);
        v46(v23, v45);
        goto LABEL_11;
      }
      (*(void (**)(char *, uint64_t))(v69 + 8))(v23, v68);
      goto LABEL_17;
    case 3u:
      sub_100013640((uint64_t)v32, (uint64_t)v20, type metadata accessor for ModelUpdateStep);
      if (swift_getEnumCaseMultiPayload() != 3)
      {
        (*(void (**)(char *, uint64_t))(v69 + 8))(v20, v68);
        goto LABEL_17;
      }
      uint64_t v47 = v69;
      Swift::String v48 = v64;
      uint64_t v49 = v33;
      uint64_t v50 = v68;
      (*(void (**)(char *, uint64_t, uint64_t))(v69 + 32))(v64, v49, v68);
      char v40 = sub_100044A90();
      uint64_t v51 = *(void (**)(char *, uint64_t))(v47 + 8);
      v51(v48, v50);
      v51(v20, v50);
      goto LABEL_11;
    case 4u:
      if (swift_getEnumCaseMultiPayload() != 4) {
        goto LABEL_17;
      }
      sub_1000136E0((uint64_t)v32, type metadata accessor for ModelUpdateStep);
      char v40 = 1;
      return v40 & 1;
    default:
      sub_100013640((uint64_t)v32, (uint64_t)v28, type metadata accessor for ModelUpdateStep);
      uint64_t v34 = *(int *)(sub_100006080(&qword_100050FD0) + 48);
      if (swift_getEnumCaseMultiPayload())
      {
        uint64_t v35 = *(void (**)(char *, uint64_t))(v66 + 8);
        uint64_t v36 = v67;
        v35(&v28[v34], v67);
        v35(v28, v36);
LABEL_17:
        sub_100017B30((uint64_t)v32, &qword_100051080);
        goto LABEL_18;
      }
      uint64_t v70 = v33 + v34;
      uint64_t v54 = v66;
      uint64_t v53 = v67;
      uint64_t v55 = *(void (**)(char *, uint64_t, uint64_t))(v66 + 32);
      uint64_t v56 = v62;
      v55(v62, v33, v67);
      v55(v65, (uint64_t)&v28[v34], v53);
      uint64_t v57 = v61;
      v55(v61, v70, v53);
      char v58 = sub_100044830();
      uint64_t v59 = *(void (**)(char *, uint64_t))(v54 + 8);
      v59(v28, v53);
      if ((v58 & 1) == 0)
      {
        v59(v57, v53);
        v59(v65, v53);
        v59(v56, v53);
        sub_1000136E0((uint64_t)v32, type metadata accessor for ModelUpdateStep);
LABEL_18:
        char v40 = 0;
        return v40 & 1;
      }
      uint64_t v60 = v65;
      char v40 = sub_100044830();
      v59(v57, v53);
      v59(v60, v53);
      v59(v56, v53);
LABEL_11:
      sub_1000136E0((uint64_t)v32, type metadata accessor for ModelUpdateStep);
      return v40 & 1;
  }
}

uint64_t sub_100010394(uint64_t a1)
{
  uint64_t v2 = sub_100044D60();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100050C60 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1000136A8(v2, (uint64_t)qword_100050E38);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_retain_n();
  uint64_t v7 = sub_100044D40();
  int v8 = sub_100044F30();
  if (os_log_type_enabled(v7, (os_log_type_t)v8))
  {
    int v26 = v8;
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = (void *)swift_slowAlloc();
    id v29 = v25;
    *(_DWORD *)uint64_t v9 = 136315138;
    sub_100044880();
    id v10 = v28;
    id v11 = [v28 dictionaryRepresentation];

    uint64_t v27 = a1;
    if (!v11)
    {
      uint64_t result = swift_release();
      __break(1u);
      return result;
    }
    uint64_t v24 = v9 + 4;
    sub_100044D80();

    uint64_t v12 = sub_100044D90();
    unint64_t v14 = v13;
    swift_bridgeObjectRelease();
    id v28 = (id)sub_1000434C0(v12, v14, (uint64_t *)&v29);
    sub_100044FA0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, (os_log_type_t)v26, "correctionUndoResponse: %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_100044880();
  id v15 = v29;
  unsigned int v16 = [v29 undoType];

  if (v16 == 1)
  {
    sub_100044880();
    id v17 = v29;
    unsigned int v18 = [v29 reason];

    if (v18 == 3) {
      return 1;
    }
  }
  sub_100044880();
  id v20 = v29;
  unsigned int v21 = [v29 undoType];

  if (v21 == 1) {
    return 0;
  }
  sub_100044880();
  id v22 = v29;
  unsigned int v23 = [v29 undoType];

  return v23 != 0;
}

uint64_t sub_100010758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v128 = a3;
  uint64_t v4 = type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  __chkstk_darwin(v4);
  uint64_t v122 = (uint64_t)&v120 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100044800();
  uint64_t v124 = *(void *)(v6 - 8);
  uint64_t v125 = v6;
  __chkstk_darwin(v6);
  uint64_t v123 = (char *)&v120 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100044820();
  unint64_t v126 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v10 = (char *)&v120 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100006080(&qword_100051088);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  unint64_t v14 = (char *)&v120 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  unsigned int v16 = (char *)&v120 - v15;
  uint64_t v17 = type metadata accessor for UniversalSuggestionsPromptState(0);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  unint64_t v127 = (unint64_t)&v120 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  id v22 = (char *)&v120 - v21;
  sub_100013FCC(a2 + *(int *)(v4 + 40), (uint64_t)v16, &qword_100051088);
  unsigned int v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  if (v23(v16, 1, v17) == 1)
  {
    unint64_t v14 = v16;
LABEL_5:
    sub_100017B30((uint64_t)v14, &qword_100051088);
    if (qword_100050C60 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_100044D60();
    sub_1000136A8(v24, (uint64_t)qword_100050E38);
    uint64_t v25 = sub_100044D40();
    os_log_type_t v26 = sub_100044F30();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Could not find prompt states for a correction, skipping evaluation", v27, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  sub_1000137A4((uint64_t)v16, (uint64_t)v22, type metadata accessor for UniversalSuggestionsPromptState);
  sub_100013FCC(v128 + *(int *)(v4 + 40), (uint64_t)v14, &qword_100051088);
  if (v23(v14, 1, v17) == 1)
  {
    sub_1000136E0((uint64_t)v22, type metadata accessor for UniversalSuggestionsPromptState);
    goto LABEL_5;
  }
  uint64_t v120 = v4;
  uint64_t v28 = v127;
  sub_1000137A4((uint64_t)v14, v127, type metadata accessor for UniversalSuggestionsPromptState);
  unint64_t v29 = *(int *)(v17 + 20);
  uint64_t v30 = swift_bridgeObjectRetain();
  uint64_t v31 = sub_10000D21C(v30, (void (*)(void))&type metadata accessor for PromptBeginEventType);
  uint64_t v33 = v32;
  swift_bridgeObjectRelease();
  if (!v33) {
    goto LABEL_19;
  }
  uint64_t v121 = v22;
  unint64_t v34 = v126;
  (*(void (**)(char *, void, uint64_t))(v126 + 104))(v10, enum case for PromptEventType.Beginning.disambiguation(_:), v8);
  uint64_t v35 = sub_100044810();
  uint64_t v37 = v36;
  (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v8);
  if (v31 != v35 || v33 != v37)
  {
    char v38 = sub_100045110();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v22 = v121;
    if (v38) {
      goto LABEL_15;
    }
LABEL_19:
    if (qword_100050C60 != -1) {
      swift_once();
    }
    uint64_t v49 = sub_100044D60();
    sub_1000136A8(v49, (uint64_t)qword_100050E38);
    uint64_t v50 = sub_100044D40();
    os_log_type_t v51 = sub_100044F30();
    if (!os_log_type_enabled(v50, v51)) {
      goto LABEL_49;
    }
    uint64_t v52 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v52 = 0;
    uint64_t v53 = "Disambiguation did not occur after a correction, skipping evaluation";
    goto LABEL_48;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v22 = v121;
LABEL_15:
  unint64_t v126 = v29;
  uint64_t v39 = swift_bridgeObjectRetain();
  uint64_t v40 = sub_10000D21C(v39, (void (*)(void))&type metadata accessor for PromptEndEventType);
  uint64_t v42 = v41;
  swift_bridgeObjectRelease();
  if (!v42) {
    goto LABEL_30;
  }
  uint64_t v44 = v123;
  uint64_t v43 = v124;
  uint64_t v45 = v125;
  (*(void (**)(char *, void, uint64_t))(v124 + 104))(v123, enum case for PromptEventType.Ending.disambiguation(_:), v125);
  uint64_t v46 = sub_1000447F0();
  uint64_t v48 = v47;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v45);
  if (v40 == v46 && v42 == v48)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  char v54 = sub_100045110();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v54 & 1) == 0)
  {
LABEL_30:
    if (qword_100050C60 != -1) {
      swift_once();
    }
    uint64_t v63 = sub_100044D60();
    sub_1000136A8(v63, (uint64_t)qword_100050E38);
    uint64_t v50 = sub_100044D40();
    os_log_type_t v51 = sub_100044F30();
    if (!os_log_type_enabled(v50, v51)) {
      goto LABEL_49;
    }
    uint64_t v52 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v52 = 0;
    uint64_t v53 = "Disambiguation response could not be found, skipping evaluation";
    goto LABEL_48;
  }
LABEL_24:
  if ((sub_100044530() & 1) == 0)
  {
    if (qword_100050C60 != -1) {
      swift_once();
    }
    uint64_t v64 = sub_100044D60();
    sub_1000136A8(v64, (uint64_t)qword_100050E38);
    uint64_t v50 = sub_100044D40();
    os_log_type_t v51 = sub_100044F30();
    if (!os_log_type_enabled(v50, v51)) {
      goto LABEL_49;
    }
    uint64_t v52 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v52 = 0;
    uint64_t v53 = "Could not match prompt response based on flow task id, skipping evaluation";
    goto LABEL_48;
  }
  uint64_t v55 = swift_bridgeObjectRetain();
  uint64_t v56 = sub_10000D21C(v55, (void (*)(void))&type metadata accessor for PromptBeginTaskName);
  uint64_t v58 = v57;
  swift_bridgeObjectRelease();
  if (!v58) {
    goto LABEL_44;
  }
  uint64_t v59 = swift_bridgeObjectRetain();
  uint64_t v60 = sub_10000D21C(v59, (void (*)(void))&type metadata accessor for PromptEndTaskName);
  uint64_t v62 = v61;
  swift_bridgeObjectRelease();
  if (!v62) {
    goto LABEL_43;
  }
  if (v56 == v60 && v58 == v62)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v65 = sub_100045110();
    swift_bridgeObjectRelease();
    if ((v65 & 1) == 0)
    {
LABEL_43:
      swift_bridgeObjectRelease();
LABEL_44:
      if (qword_100050C60 != -1) {
        swift_once();
      }
      uint64_t v71 = sub_100044D60();
      sub_1000136A8(v71, (uint64_t)qword_100050E38);
      uint64_t v50 = sub_100044D40();
      os_log_type_t v51 = sub_100044F30();
      if (!os_log_type_enabled(v50, v51)) {
        goto LABEL_49;
      }
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v52 = 0;
      uint64_t v53 = "Could not find a control home flow task in the detected prompt, skipping evaluation";
LABEL_48:
      _os_log_impl((void *)&_mh_execute_header, v50, v51, v53, v52, 2u);
      swift_slowDealloc();
LABEL_49:

      uint64_t v72 = v28;
LABEL_50:
      sub_1000136E0(v72, type metadata accessor for UniversalSuggestionsPromptState);
      sub_1000136E0((uint64_t)v22, type metadata accessor for UniversalSuggestionsPromptState);
      return 0;
    }
  }
  sub_100013D08(0, &qword_1000510A8);
  id v66 = [(id)swift_getObjCClassFromMetadata() typeName];
  if (!v66) {
    goto LABEL_43;
  }
  uint64_t v67 = v66;
  uint64_t v68 = sub_100044DE0();
  uint64_t v70 = v69;

  if (v56 == v68 && v58 == v70)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_54;
  }
  char v75 = sub_100045110();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v75 & 1) == 0) {
    goto LABEL_44;
  }
LABEL_54:
  unint64_t v76 = *(void *)(v128 + *(int *)(v120 + 36));
  uint64_t v77 = (uint64_t *)(v76 >> 62);
  if (v76 >> 62)
  {
LABEL_76:
    swift_bridgeObjectRetain_n();
    uint64_t v78 = sub_1000450C0();
    if (v78)
    {
LABEL_56:
      uint64_t v79 = 0;
      uint64_t v125 = (uint64_t)v77;
      unint64_t v126 = v76 + 32;
      do
      {
        if ((v76 & 0xC000000000000001) != 0) {
          uint64_t v80 = (char *)sub_100045020();
        }
        else {
          uint64_t v80 = (char *)*(id *)(v126 + 8 * v79);
        }
        id v22 = v80;
        BOOL v81 = __OFADD__(v79++, 1);
        if (v81)
        {
          __break(1u);
          goto LABEL_76;
        }
        if (qword_100050CA0 != -1) {
          swift_once();
        }
        uint64_t v82 = qword_100052988;
        unsigned int v83 = [v22 flowStateType];
        if (*(void *)(v82 + 16))
        {
          Swift::UInt32 v84 = v83;
          sub_100045150();
          uint64_t v77 = v130;
          sub_100045170(v84);
          Swift::Int v85 = sub_100045180();
          uint64_t v86 = -1 << *(unsigned char *)(v82 + 32);
          unint64_t v87 = v85 & ~v86;
          if ((*(void *)(v82 + 56 + ((v87 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v87))
          {
            uint64_t v88 = *(void *)(v82 + 48);
            if (*(_DWORD *)(v88 + 4 * v87) == v84)
            {
LABEL_70:

              swift_bridgeObjectRelease_n();
              LODWORD(v90) = 1;
              goto LABEL_71;
            }
            uint64_t v89 = ~v86;
            while (1)
            {
              unint64_t v87 = (v87 + 1) & v89;
              if (((*(void *)(v82 + 56 + ((v87 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v87) & 1) == 0) {
                break;
              }
              if (*(_DWORD *)(v88 + 4 * v87) == v84) {
                goto LABEL_70;
              }
            }
          }
        }
      }
      while (v79 != v78);
      swift_bridgeObjectRelease_n();
      LODWORD(v90) = 0;
LABEL_71:
      id v22 = v121;
      if (v125) {
        goto LABEL_78;
      }
      goto LABEL_72;
    }
  }
  else
  {
    uint64_t v78 = *(void *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v78) {
      goto LABEL_56;
    }
  }
  swift_bridgeObjectRelease_n();
  LODWORD(v90) = 0;
  if (v77)
  {
LABEL_78:
    swift_bridgeObjectRetain_n();
    uint64_t v91 = sub_1000450C0();
    if (!v91) {
      goto LABEL_95;
    }
LABEL_79:
    LODWORD(v125) = v90;
    uint64_t v92 = 0;
    unint64_t v93 = v76 & 0xC000000000000001;
    unint64_t v126 = v76 + 32;
    uint64_t v90 = &HomeStore;
    while (1)
    {
      BOOL v94 = v93 ? (char *)sub_100045020() : (char *)*(id *)(v126 + 8 * v92);
      id v22 = v94;
      BOOL v81 = __OFADD__(v92++, 1);
      if (v81) {
        break;
      }
      if (qword_100050C90 != -1) {
        swift_once();
      }
      uint64_t v95 = qword_100052978;
      unsigned int v96 = [v22 flowStateType];
      if (*(void *)(v95 + 16))
      {
        Swift::UInt32 v97 = v96;
        sub_100045150();
        sub_100045170(v97);
        Swift::Int v98 = sub_100045180();
        uint64_t v99 = -1 << *(unsigned char *)(v95 + 32);
        unint64_t v100 = v98 & ~v99;
        if ((*(void *)(v95 + 56 + ((v100 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v100))
        {
          uint64_t v101 = *(void *)(v95 + 48);
          if (*(_DWORD *)(v101 + 4 * v100) == v97)
          {
LABEL_93:

            swift_bridgeObjectRelease_n();
            LODWORD(v93) = 1;
            id v22 = v121;
            unint64_t v76 = v127;
            LODWORD(v90) = v125;
            goto LABEL_102;
          }
          uint64_t v102 = ~v99;
          while (1)
          {
            unint64_t v100 = (v100 + 1) & v102;
            if (((*(void *)(v95 + 56 + ((v100 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v100) & 1) == 0) {
              break;
            }
            if (*(_DWORD *)(v101 + 4 * v100) == v97) {
              goto LABEL_93;
            }
          }
        }
      }

      if (v92 == v91)
      {
        id v22 = v121;
        LODWORD(v90) = v125;
        goto LABEL_95;
      }
    }
    __break(1u);
LABEL_113:
    swift_once();
LABEL_103:
    uint64_t v112 = sub_100044D60();
    sub_1000136A8(v112, (uint64_t)qword_100050E38);
    uint64_t v113 = sub_100044D40();
    os_log_type_t v114 = sub_100044F30();
    if (os_log_type_enabled(v113, v114))
    {
      uint64_t v115 = swift_slowAlloc();
      *(_DWORD *)uint64_t v115 = 67109376;
      LODWORD(v130[0]) = v90;
      sub_100044FA0();
      *(_WORD *)(v115 + 8) = 1024;
      LODWORD(v130[0]) = v93;
      sub_100044FA0();
      _os_log_impl((void *)&_mh_execute_header, v113, v114, "Could not find a selection in the follow-up turn: didSelect=%{BOOL}d, didCancel=%{BOOL}d, skipping evaluation", (uint8_t *)v115, 0xEu);
      swift_slowDealloc();
    }

    uint64_t v72 = v76;
    goto LABEL_50;
  }
LABEL_72:
  uint64_t v91 = *(void *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  if (v91) {
    goto LABEL_79;
  }
LABEL_95:
  swift_bridgeObjectRelease_n();
  if ((v90 & 1) == 0)
  {
    LODWORD(v93) = 0;
    unint64_t v76 = v127;
LABEL_102:
    if (qword_100050C60 == -1) {
      goto LABEL_103;
    }
    goto LABEL_113;
  }
  uint64_t v104 = v127;
  uint64_t v103 = v128;
  if (!*(void *)(v128 + *(int *)(v120 + 32)))
  {
    if (qword_100050C60 != -1) {
      swift_once();
    }
    uint64_t v116 = sub_100044D60();
    sub_1000136A8(v116, (uint64_t)qword_100050E38);
    uint64_t v117 = sub_100044D40();
    os_log_type_t v118 = sub_100044F30();
    if (os_log_type_enabled(v117, v118))
    {
      os_log_type_t v119 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v119 = 0;
      _os_log_impl((void *)&_mh_execute_header, v117, v118, "Could not find a control home intent in the follow-up turn, skipping evaluation", v119, 2u);
      swift_slowDealloc();
    }

    uint64_t v72 = v104;
    goto LABEL_50;
  }
  if (qword_100050C60 != -1) {
    swift_once();
  }
  uint64_t v105 = sub_100044D60();
  sub_1000136A8(v105, (uint64_t)qword_100050E38);
  uint64_t v106 = v122;
  sub_100013640(v103, v122, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  uint64_t v107 = sub_100044D40();
  os_log_type_t v108 = sub_100044F30();
  if (os_log_type_enabled(v107, v108))
  {
    uint64_t v109 = (uint8_t *)swift_slowAlloc();
    v130[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v109 = 136315138;
    sub_100044540();
    sub_100013CA8(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v110 = sub_1000450F0();
    uint64_t v129 = sub_1000434C0(v110, v111, v130);
    sub_100044FA0();
    swift_bridgeObjectRelease();
    sub_1000136E0(v106, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    _os_log_impl((void *)&_mh_execute_header, v107, v108, "Detected a disambiguation selection after a correction, using the intent from turn with requestId=%s", v109, 0xCu);
    uint64_t v73 = 1;
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    sub_1000136E0(v104, type metadata accessor for UniversalSuggestionsPromptState);
    sub_1000136E0((uint64_t)v121, type metadata accessor for UniversalSuggestionsPromptState);
  }
  else
  {

    sub_1000136E0(v106, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    sub_1000136E0(v104, type metadata accessor for UniversalSuggestionsPromptState);
    sub_1000136E0((uint64_t)v121, type metadata accessor for UniversalSuggestionsPromptState);
    return 1;
  }
  return v73;
}

uint64_t sub_10001192C(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = swift_bridgeObjectRetain();
  sub_10000D21C(v3, (void (*)(void))&type metadata accessor for ControlHomeIntentFeature.ControlHomeIntentGroupName);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v5)
  {
    if (qword_100050C60 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_100044D60();
    sub_1000136A8(v6, (uint64_t)qword_100050E38);
    uint64_t v7 = sub_100044D40();
    os_log_type_t v8 = sub_100044F30();
    if (!os_log_type_enabled(v7, v8)) {
      goto LABEL_12;
    }
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    id v10 = "A group is mentioned in the turn.";
    goto LABEL_11;
  }
  uint64_t v11 = swift_bridgeObjectRetain();
  sub_10000D21C(v11, (void (*)(void))&type metadata accessor for ControlHomeIntentFeature.ControlHomeIntentZoneName);
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v13)
  {
    if (qword_100050C60 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_100044D60();
    sub_1000136A8(v14, (uint64_t)qword_100050E38);
    uint64_t v7 = sub_100044D40();
    os_log_type_t v8 = sub_100044F30();
    if (!os_log_type_enabled(v7, v8)) {
      goto LABEL_12;
    }
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    id v10 = "A zone is mentioned in the turn.";
    goto LABEL_11;
  }
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_1000450C0())
    {
LABEL_15:
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v17 = (id)sub_100045020();
      }
      else
      {
        if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_27;
        }
        id v17 = *(id *)(a2 + 32);
      }
      uint64_t v18 = v17;
      swift_bridgeObjectRelease();
      id v19 = [v18 type];

      if (v19 == (id)7) {
        return 0;
      }
      if (qword_100050C60 == -1)
      {
LABEL_21:
        uint64_t v20 = sub_100044D60();
        sub_1000136A8(v20, (uint64_t)qword_100050E38);
        uint64_t v7 = sub_100044D40();
        os_log_type_t v8 = sub_100044F30();
        if (!os_log_type_enabled(v7, v8)) {
          goto LABEL_12;
        }
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v9 = 0;
        id v10 = "Entity is not of device type.";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v7, v8, v10, v9, 2u);
        swift_slowDealloc();
LABEL_12:

        return 1;
      }
LABEL_27:
      swift_once();
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v16 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v16) {
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

id sub_100011C50(unint64_t a1)
{
  uint64_t v2 = sub_1000445E0();
  unint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v67 = (char *)&v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (uint64_t)&v60 - v7;
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v60 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v60 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  id v74 = (char *)&v60 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  id v19 = (char *)&v60 - v18;
  uint64_t v20 = __chkstk_darwin(v17);
  id v22 = (char *)&v60 - v21;
  __chkstk_darwin(v20);
  unint64_t v24 = (unint64_t)&v60 - v23;
  if (!(a1 >> 62))
  {
    uint64_t v25 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v25) {
      goto LABEL_3;
    }
LABEL_28:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_27:
  swift_bridgeObjectRetain();
  if (!sub_1000450C0()) {
    goto LABEL_28;
  }
LABEL_3:
  uint64_t v62 = v14;
  if ((a1 & 0xC000000000000001) != 0)
  {
    id v26 = (id)sub_100045020();
  }
  else
  {
    if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_32;
    }
    id v26 = *(id *)(a1 + 32);
  }
  uint64_t v27 = v26;
  swift_bridgeObjectRelease();
  id v28 = [v27 entityName];
  if (!v28)
  {

    return 0;
  }
  unint64_t v29 = v28;
  uint64_t v60 = v11;
  uint64_t v61 = v8;
  id v30 = [v28 spokenPhrase];
  uint64_t v68 = v27;
  id v31 = v30;

  sub_100044DE0();
  uint64_t v32 = v68;
  uint64_t v64 = sub_100044580();
  swift_allocObject();
  uint64_t v66 = sub_100044570();
  uint64_t v65 = sub_100044620();
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v33 = sub_100044610();
  sub_1000445B0();
  sub_100044590();
  uint64_t v35 = *(void (**)(char *, uint64_t))(v3 + 8);
  v3 += 8;
  unint64_t v34 = v35;
  v35((char *)v24, v2);
  uint64_t v63 = "homeAutomationAccessoryName";
  sub_1000445B0();
  sub_100044590();
  uint64_t v36 = v22;
  uint64_t v37 = v33;
  v35(v36, v2);
  id v38 = [v32 entityIdentifier];
  if (v38)
  {
    uint64_t v39 = v38;
    sub_100044DE0();

    sub_1000445B0();
    sub_100044590();
    v34(v19, v2);
  }
  uint64_t v73 = v34;
  id v40 = [v32 deviceTypes];
  uint64_t v11 = (char *)v66;
  if (!v40) {
    goto LABEL_20;
  }
  uint64_t v41 = v40;
  sub_100013D08(0, &qword_1000510B8);
  unint64_t v24 = sub_100044E40();

  uint64_t v71 = v37;
  unint64_t v72 = v3;
  if (!(v24 >> 62))
  {
    id v22 = *(char **)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v22) {
      goto LABEL_12;
    }
    goto LABEL_19;
  }
LABEL_32:
  swift_bridgeObjectRetain();
  id v22 = (char *)sub_1000450C0();
  swift_bridgeObjectRelease();
  if (!v22)
  {
LABEL_19:
    swift_bridgeObjectRelease();
    uint64_t v37 = v71;
    uint64_t v32 = v68;
LABEL_20:
    uint64_t v75 = v37;
    sub_1000445F0();
    id v46 = [v32 room];
    if (v46)
    {
      uint64_t v47 = v46;
      id v48 = [v46 spokenPhrase];

      sub_100044DE0();
      swift_allocObject();
      swift_bridgeObjectRetain();
      uint64_t v49 = sub_100044610();
      uint64_t v50 = v62;
      sub_1000445B0();
      sub_100044590();
      os_log_type_t v51 = v73;
      v73(v50, v2);
      uint64_t v52 = v60;
      sub_1000445B0();
      sub_100044590();
      v51(v52, v2);
      swift_allocObject();
      sub_100044570();
      uint64_t v75 = v49;
      sub_1000445F0();
      swift_retain();
      sub_100044560();
      swift_release();
      swift_release_n();
    }
    id v53 = [v32 home];
    if (v53)
    {
      char v54 = v53;
      id v55 = [v53 spokenPhrase];

      sub_100044DE0();
      swift_allocObject();
      swift_bridgeObjectRetain();
      uint64_t v56 = sub_100044610();
      uint64_t v57 = v61;
      sub_1000445B0();
      sub_100044590();
      uint64_t v58 = v73;
      v73((char *)v57, v2);
      uint64_t v59 = v67;
      sub_1000445B0();
      sub_100044590();
      v58(v59, v2);
      swift_allocObject();
      sub_100044570();
      uint64_t v75 = v56;
      uint64_t v32 = v68;
      sub_1000445F0();
      swift_retain();
      sub_100044560();
      swift_release();
      swift_release_n();
    }
    sub_100044600();
    sub_100044550();
    sub_100044630();
    swift_release();
    swift_release();

    swift_release();
    return (id)v75;
  }
LABEL_12:
  uint64_t v8 = 4;
  unint64_t v69 = 0x8000000100046A40;
  unint64_t v70 = v24 & 0xC000000000000001;
  id v19 = v74;
  while (1)
  {
    a1 = v8 - 4;
    if (v70) {
      id v42 = (id)sub_100045020();
    }
    else {
      id v42 = *(id *)(v24 + 8 * v8);
    }
    uint64_t v43 = v42;
    uint64_t v14 = (char *)(v8 - 3);
    if (__OFADD__(a1, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    unint64_t v3 = v24;
    [v42 integerValue];
    id result = (id)INHomeDeviceTypeGetName();
    if (!result) {
      break;
    }
    uint64_t v45 = result;
    uint64_t v11 = (char *)sub_100044DE0();

    sub_1000445B0();
    sub_100044590();

    v73(v19, v2);
    ++v8;
    if (v14 == v22) {
      goto LABEL_19;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100012678(uint64_t a1)
{
  uint64_t updated = type metadata accessor for RequestLinkedModelUpdateStep(0);
  uint64_t v2 = *(void *)(updated - 8);
  uint64_t v3 = __chkstk_darwin(updated);
  uint64_t v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v3);
  uint64_t v8 = (char *)v25 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    if (qword_100050C60 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_100044D60();
    uint64_t v11 = sub_1000136A8(v10, (uint64_t)qword_100050E38);
    uint64_t v12 = sub_100044D40();
    os_log_type_t v13 = sub_100044F30();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Learned updates:", v14, 2u);
      swift_slowDealloc();
    }

    uint64_t v15 = a1 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    uint64_t v16 = *(void *)(v2 + 72);
    v25[0] = a1;
    swift_bridgeObjectRetain();
    *(void *)&long long v17 = 136315394;
    long long v26 = v17;
    v25[1] = (char *)&type metadata for Any + 8;
    uint64_t v27 = v16;
    uint64_t v28 = v11;
    do
    {
      sub_100013640(v15, (uint64_t)v8, type metadata accessor for RequestLinkedModelUpdateStep);
      sub_100013640(v15, (uint64_t)v5, type metadata accessor for RequestLinkedModelUpdateStep);
      uint64_t v18 = sub_100044D40();
      os_log_type_t v19 = sub_100044F30();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = swift_slowAlloc();
        uint64_t v30 = swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = v26;
        sub_100044540();
        sub_100013CA8(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v21 = sub_1000450F0();
        *(void *)(v20 + 4) = sub_1000434C0(v21, v22, &v30);
        swift_bridgeObjectRelease();
        sub_1000136E0((uint64_t)v8, type metadata accessor for RequestLinkedModelUpdateStep);
        *(_WORD *)(v20 + 12) = 2080;
        uint64_t v23 = sub_10000F490();
        *(void *)(v20 + 14) = sub_1000434C0(v23, v24, &v30);
        swift_bridgeObjectRelease();
        sub_1000136E0((uint64_t)v5, type metadata accessor for RequestLinkedModelUpdateStep);
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Request %s -> %s", (uint8_t *)v20, 0x16u);
        swift_arrayDestroy();
        uint64_t v16 = v27;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        sub_1000136E0((uint64_t)v5, type metadata accessor for RequestLinkedModelUpdateStep);
        sub_1000136E0((uint64_t)v8, type metadata accessor for RequestLinkedModelUpdateStep);
      }
      v15 += v16;
      --v9;
    }
    while (v9);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100012A44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v69 = a2;
  uint64_t v5 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
  __chkstk_darwin(v5 - 8);
  unint64_t v72 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
  __chkstk_darwin(v7 - 8);
  uint64_t v71 = (uint64_t)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
  __chkstk_darwin(v68);
  uint64_t v67 = (uint64_t)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100006080(&qword_100050FD8);
  __chkstk_darwin(v10 - 8);
  uint64_t v76 = (uint64_t)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
  uint64_t v75 = *(void *)(v77 - 8);
  uint64_t v12 = __chkstk_darwin(v77);
  uint64_t v73 = (uint64_t)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v62 - v14;
  uint64_t v78 = type metadata accessor for UniversalSuggestionRequestState(0);
  uint64_t v16 = __chkstk_darwin(v78);
  uint64_t v74 = (uint64_t)&v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v70 = (uint64_t)&v62 - v19;
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v62 - v20;
  uint64_t v22 = sub_100044540();
  uint64_t v23 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v25 = (char *)&v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_100044D60();
  uint64_t v27 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  unint64_t v29 = (char *)&v62 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100050C60 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_1000136A8(v26, (uint64_t)qword_100050E38);
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v29, v30, v26);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v25, a1, v22);
  uint64_t v79 = a3;
  sub_100013640(a3, (uint64_t)v21, type metadata accessor for UniversalSuggestionRequestState);
  id v31 = sub_100044D40();
  os_log_type_t v32 = sub_100044F30();
  int v33 = v32;
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v34 = swift_slowAlloc();
    uint64_t v66 = v15;
    uint64_t v35 = v34;
    uint64_t v65 = swift_slowAlloc();
    v82[0] = v65;
    *(_DWORD *)uint64_t v35 = 136315394;
    int v64 = v33;
    sub_100013CA8(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
    os_log_t v63 = v31;
    uint64_t v36 = sub_1000450F0();
    uint64_t v80 = sub_1000434C0(v36, v37, v82);
    sub_100044FA0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
    *(_WORD *)(v35 + 12) = 2080;
    uint64_t v38 = v70;
    sub_100013640((uint64_t)v21, v70, type metadata accessor for UniversalSuggestionRequestState);
    uint64_t v80 = 0;
    unint64_t v81 = 0xE000000000000000;
    sub_100045000(64);
    v83._object = (void *)0x80000001000468F0;
    v83._countAndFlagsBits = 0xD00000000000002CLL;
    sub_100044E10(v83);
    type metadata accessor for UniversalSuggestionCorrectionDiscovered(0);
    sub_100045090();
    v84._countAndFlagsBits = 0x736575716572202CLL;
    v84._object = (void *)0xEF203A6B73615474;
    sub_100044E10(v84);
    uint64_t v62 = v21;
    uint64_t v39 = v78;
    v85._countAndFlagsBits = sub_100021B8C();
    sub_100044E10(v85);
    swift_bridgeObjectRelease();
    v86._countAndFlagsBits = 41;
    v86._object = (void *)0xE100000000000000;
    sub_100044E10(v86);
    uint64_t v40 = v80;
    unint64_t v41 = v81;
    sub_1000136E0(v38, type metadata accessor for UniversalSuggestionRequestState);
    uint64_t v80 = sub_1000434C0(v40, v41, v82);
    sub_100044FA0();
    swift_bridgeObjectRelease();
    sub_1000136E0((uint64_t)v62, type metadata accessor for UniversalSuggestionRequestState);
    os_log_t v42 = v63;
    _os_log_impl((void *)&_mh_execute_header, v63, (os_log_type_t)v64, "Reviewing request state to emit outcome event for %s, requestState=%s", (uint8_t *)v35, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v15 = v66;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v26);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
    sub_1000136E0((uint64_t)v21, type metadata accessor for UniversalSuggestionRequestState);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v26);
    uint64_t v39 = v78;
  }
  uint64_t v43 = v79;
  uint64_t v44 = v79 + *(int *)(v39 + 20);
  uint64_t v45 = type metadata accessor for UniversalSuggestionRequestTaskState(0);
  uint64_t v46 = v76;
  sub_100013FCC(v44 + *(int *)(v45 + 20), v76, &qword_100050FD8);
  uint64_t v47 = v77;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v75 + 48))(v46, 1, v77) == 1) {
    return sub_100017B30(v46, &qword_100050FD8);
  }
  sub_1000137A4(v46, (uint64_t)v15, type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState);
  sub_100013640(v43, v74, type metadata accessor for UniversalSuggestionRequestState);
  sub_100013640((uint64_t)v15, v73, type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState);
  uint64_t v49 = (uint64_t)&v15[*(int *)(v47 + 20)];
  uint64_t v50 = v71;
  sub_100013640(v49, v71, type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState);
  uint64_t v51 = sub_100006080(&qword_100050FE0);
  int v52 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 48))(v50, 3, v51);
  uint64_t v53 = (uint64_t)v72;
  switch(v52)
  {
    case 1:
    case 2:
      break;
    case 3:
      uint64_t v55 = type metadata accessor for UniversalSuggestionCorrectionDiscovered(0);
      sub_100013640(v43 + *(int *)(v55 + 24), v53, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
      uint64_t v56 = sub_100006080(&qword_100050FD0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 48))(v53, 2, v56))
      {
        uint64_t v57 = v53 + *(int *)(v56 + 48);
        uint64_t v58 = sub_100044850();
        uint64_t v59 = *(void (**)(uint64_t, uint64_t))(*(void *)(v58 - 8) + 8);
        v59(v57, v58);
        v59(v53, v58);
      }
      break;
    default:
      uint64_t v54 = v67;
      sub_1000137A4(v50, v67, type metadata accessor for UniversalSuggestionDisambiguationOffered);
      sub_1000136E0(v54, type metadata accessor for UniversalSuggestionDisambiguationOffered);
      break;
  }
  uint64_t v60 = v74;
  type metadata accessor for UniversalSuggestionItem(0);
  uint64_t v61 = v73;
  sub_100044BC0();
  sub_1000136E0(v61, type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState);
  sub_1000136E0(v60, type metadata accessor for UniversalSuggestionRequestState);
  return sub_1000136E0((uint64_t)v15, type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState);
}

uint64_t sub_100013640(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000136A8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000136E0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_100013740(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000137A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001380C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100013844(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_100013900;
  v6[6] = a2;
  v6[7] = v2;
  v6[5] = a1;
  return _swift_task_switch(sub_1000086EC, 0, 0);
}

uint64_t sub_100013900(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1000139FC()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100013A34(uint64_t a1, uint64_t *a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100013AFC;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t *, int *))((char *)&dword_100051038 + dword_100051038);
  return v8(a1, a2, v6);
}

uint64_t sub_100013AFC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t type metadata accessor for UniversalSuggestionsFeaturisedTurn(uint64_t a1)
{
  return sub_100013C30(a1, (uint64_t *)&unk_100051348);
}

uint64_t type metadata accessor for UniversalSuggestionsPromptState(uint64_t a1)
{
  return sub_100013C30(a1, qword_1000512B8);
}

uint64_t sub_100013C30(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100013C68(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_100013CA8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100013CF0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100013D08(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100013D44(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100013DA8()
{
  uint64_t v1 = sub_100044BA0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 72) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  sub_100006030(v0 + 32);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_100013E88(uint64_t a1, uint64_t *a2)
{
  uint64_t v6 = *(void *)(sub_100044BA0() - 8);
  unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = v2 + v7;
  uint64_t v9 = *(void *)(v2 + ((*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = swift_task_alloc();
  long long v11 = *(_OWORD *)(v2 + 16);
  *(void *)(v3 + 16) = v10;
  *(void *)uint64_t v10 = v3;
  *(void *)(v10 + 8) = sub_100013AFC;
  *(void *)(v10 + 40) = v2 + 32;
  *(void *)(v10 + 48) = v8;
  *(_OWORD *)(v10 + 24) = v11;
  *(void *)(v10 + 16) = a1;
  uint64_t v12 = *a2;
  uint64_t v13 = a2[1];
  *(void *)(v10 + 56) = v9;
  *(void *)(v10 + 64) = v12;
  *(void *)(v10 + 72) = v13;
  return _swift_task_switch(sub_10000DAC4, 0, 0);
}

uint64_t sub_100013FCC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006080(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100014030(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005CB8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100014074()
{
  unint64_t result = sub_100044C60();
  unint64_t v1 = result;
  if (!(result >> 62))
  {
    uint64_t v2 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_16;
  }
  unint64_t result = sub_1000450C0();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    goto LABEL_35;
  }
  for (uint64_t i = 0; i != v2; ++i)
  {
    if ((v1 & 0xC000000000000001) != 0) {
      id v4 = (id)sub_100045020();
    }
    else {
      id v4 = *(id *)(v1 + 8 * i + 32);
    }
    uint64_t v5 = v4;
    if ([v4 anyEventType] == 13)
    {
      sub_100045040();
      sub_100045060();
      sub_100045070();
      sub_100045050();
    }
    else
    {
    }
  }
  swift_bridgeObjectRelease();
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
    goto LABEL_32;
  }
LABEL_16:
  if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) == 0)
  {
    uint64_t v6 = (uint64_t)_swiftEmptyArrayStorage[2];
    unint64_t result = swift_retain();
    if (!v6)
    {
LABEL_33:
      swift_release();
      swift_release();
      return (unint64_t)_swiftEmptyArrayStorage;
    }
    goto LABEL_18;
  }
LABEL_32:
  swift_retain();
  unint64_t result = sub_1000450C0();
  uint64_t v6 = result;
  if (!result) {
    goto LABEL_33;
  }
LABEL_18:
  if (v6 >= 1)
  {
    for (uint64_t j = 0; j != v6; ++j)
    {
      if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000001) != 0) {
        id v8 = (id)sub_100045020();
      }
      else {
        id v8 = _swiftEmptyArrayStorage[j + 4];
      }
      uint64_t v9 = v8;
      id v10 = [v8 unwrap];
      if (v10)
      {
        long long v11 = v10;
        self;
        uint64_t v12 = swift_dynamicCastObjCClass();

        if (v12)
        {
          sub_100044E30();
          if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_100044E60();
          }
          sub_100044E70();
          sub_100044E50();
        }
        else
        {
        }
      }
      else
      {
      }
    }
    goto LABEL_33;
  }
LABEL_35:
  __break(1u);
  return result;
}

id *sub_100014300()
{
  unint64_t v0 = sub_100014074();
  unint64_t v1 = v0;
  if (!(v0 >> 62))
  {
    uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    unint64_t result = (id *)swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  unint64_t result = (id *)sub_1000450C0();
  uint64_t v2 = (uint64_t)result;
  if (!result) {
    goto LABEL_17;
  }
LABEL_3:
  if (v2 >= 1)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((v1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_100045020();
      }
      else {
        id v5 = *(id *)(v1 + 8 * i + 32);
      }
      uint64_t v6 = v5;
      id v7 = [v5 flowStep];
      if (v7)
      {
        id v8 = v7;
        id v9 = [v7 flowState];

        if (v9)
        {
          sub_100044E30();
          if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_100044E60();
          }
          sub_100044E70();
          sub_100044E50();
        }
      }
      else
      {
      }
    }
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

id *sub_1000144A4(void *a1, uint64_t a2)
{
  uint64_t v53 = a2;
  uint64_t v44 = sub_100044740();
  uint64_t v54 = *(void *)(v44 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v55 = (char *)v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006080(&qword_100051108);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v43 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_100044510();
  uint64_t v51 = *(void *)(v52 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v8 = (char *)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  id v10 = (uint64_t (*)(char *, uint64_t, uint64_t))((char *)v42 - v9);
  sub_100006080(&qword_100051110);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100045B00;
  uint64_t v12 = sub_100044B70();
  swift_allocObject();
  *(void *)(inited + 32) = sub_100044B60();
  uint64_t v47 = inited + 32;
  *(void *)(inited + 56) = v12;
  *(void *)(inited + 64) = &protocol witness table for INControlHomeIntentFeatureExtractor;
  uint64_t v13 = sub_1000062C0(inited);
  uint64_t v14 = v2;
  sub_100005E74(a1, a1[3]);
  sub_1000444B0();
  sub_100044490();
  uint64_t v50 = v10;
  uint64_t v46 = v13;
  uint64_t v15 = sub_100044870();
  if (v2)
  {
    uint64_t v16 = *(void (**)(char *, uint64_t))(v51 + 8);
    uint64_t v17 = v52;
    v16(v8, v52);
    v16((char *)v50, v17);
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_100006080(&qword_100051118);
    swift_arrayDestroy();
    return v14;
  }
  uint64_t v18 = v15;
  uint64_t v53 = inited;
  uint64_t v19 = *(void (**)(char *, uint64_t))(v51 + 8);
  uint64_t v20 = v52;
  v19(v8, v52);
  v19((char *)v50, v20);
  swift_retain();
  uint64_t v21 = sub_100045080();
  v42[1] = v18;
  swift_release();
  uint64_t v22 = v43;
  uint64_t v52 = v21;
  sub_1000450E0();
  uint64_t v23 = v54;
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v54 + 48);
  uint64_t v25 = v44;
  uint64_t v51 = v54 + 48;
  uint64_t v50 = v24;
  if (v24(v22, 1, v44) != 1)
  {
    uint64_t v49 = *(uint64_t (**)(char *, char *, uint64_t))(v23 + 32);
    id v48 = (void (**)(char *, uint64_t))(v23 + 8);
    uint64_t v14 = _swiftEmptyArrayStorage;
    uint64_t v27 = v53;
    uint64_t v54 = v23 + 32;
    while (1)
    {
      uint64_t v28 = v55;
      unint64_t v29 = v22;
      uint64_t v30 = v25;
      uint64_t v31 = v49(v55, v22, v25);
      __chkstk_darwin(v31);
      v42[-2] = v28;
      os_log_type_t v32 = sub_100006480((void (*)(uint64_t *__return_ptr, uint64_t))sub_10001583C, (uint64_t)&v42[-4], v27);
      int v33 = v32;
      uint64_t v34 = (char *)v32[2];
      if (v34)
      {
        uint64_t v35 = (uint64_t)(v32 + 4);
        swift_bridgeObjectRetain();
        while (1)
        {
          sub_100013D44(v35, (uint64_t)&v56);
          sub_100013D44((uint64_t)&v56, (uint64_t)v58);
          sub_100006080(&qword_100051F10);
          sub_100044B30();
          if (swift_dynamicCast()) {
            break;
          }
          sub_100006030((uint64_t)&v56);
          v35 += 40;
          if (!--v34)
          {
            swift_bridgeObjectRelease();
            goto LABEL_13;
          }
        }
        swift_bridgeObjectRelease();
        swift_release();
        sub_100013CF0(&v56, (uint64_t)v58);
      }
      else
      {
LABEL_13:
        uint64_t v59 = 0;
        memset(v58, 0, sizeof(v58));
      }
      uint64_t v36 = v55;
      sub_100013FCC((uint64_t)v58, (uint64_t)&v56, &qword_1000510B0);
      if (!v57) {
        break;
      }
      sub_100006080(&qword_100051F10);
      sub_100044B30();
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v36 = v55;
        goto LABEL_20;
      }
      swift_retain();
      sub_100044880();
      swift_release_n();
      uint64_t v36 = v55;
      unint64_t v37 = (id *)v56;
LABEL_21:
      sub_100017B30((uint64_t)v58, &qword_1000510B0);
      (*v48)(v36, v30);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v14 = sub_100042FB4(0, (int64_t)v14[2] + 1, 1, v14);
      }
      unint64_t v39 = (unint64_t)v14[2];
      unint64_t v38 = (unint64_t)v14[3];
      if (v39 >= v38 >> 1) {
        uint64_t v14 = sub_100042FB4((id *)(v38 > 1), v39 + 1, 1, v14);
      }
      v14[2] = (id)(v39 + 1);
      uint64_t v40 = &v14[2 * v39];
      v40[4] = v33;
      v40[5] = v37;
      uint64_t v22 = v29;
      sub_1000450E0();
      uint64_t v25 = v30;
      int v41 = v50(v29, 1, v30);
      uint64_t v27 = v53;
      if (v41 == 1) {
        goto LABEL_5;
      }
    }
    sub_100017B30((uint64_t)&v56, &qword_1000510B0);
LABEL_20:
    unint64_t v37 = _swiftEmptyArrayStorage;
    goto LABEL_21;
  }
  uint64_t v14 = _swiftEmptyArrayStorage;
LABEL_5:
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  sub_100006080(&qword_100051118);
  swift_arrayDestroy();
  return v14;
}

uint64_t sub_100014C14(uint64_t a1, void (*a2)(char *, uint64_t), id *a3)
{
  uint64_t v79 = a3;
  Swift::String v83 = a2;
  uint64_t v3 = sub_1000444C0();
  uint64_t v80 = *(void *)(v3 - 8);
  unint64_t v81 = (void *)v3;
  __chkstk_darwin(v3);
  uint64_t v78 = (char *)&v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006080(&qword_100051090);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  id v8 = (char *)&v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  long long v11 = (char *)&v73 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v73 - v12;
  uint64_t v14 = sub_100044510();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v73 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v82 = (char *)&v73 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v77 = (char *)&v73 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v76 = (char *)&v73 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v27 = (char *)&v73 - v26;
  uint64_t v28 = __chkstk_darwin(v25);
  Swift::String v85 = (char *)&v73 - v29;
  __chkstk_darwin(v28);
  uint64_t v31 = (char *)&v73 - v30;
  sub_100044C50();
  uint64_t v88 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  uint64_t v89 = v15 + 48;
  if (v88(v13, 1, v14) == 1)
  {
    sub_100017B30((uint64_t)v13, &qword_100051090);
    if (qword_100050C60 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_100044D60();
    sub_1000136A8(v32, (uint64_t)qword_100050E38);
    int v33 = sub_100044D40();
    os_log_type_t v34 = sub_100044F40();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v35 = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "The current turn doesn't have a timestamp, cannot retrieve interaction events as there's no clear time window", v35, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  uint64_t v74 = v18;
  Swift::String v84 = v8;
  uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
  Swift::String v86 = v31;
  v36(v31, v13, v14);
  if (v83) {
    sub_100044C50();
  }
  else {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v11, 1, 1, v14);
  }
  unint64_t v37 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  v37(v27, v86, v14);
  unsigned int v38 = v88(v11, 1, v14);
  uint64_t v75 = v15;
  if (v38 == 1)
  {
    unint64_t v39 = v85;
    sub_1000444D0();
    uint64_t v40 = v27;
    int v41 = v39;
    Swift::String v83 = *(void (**)(char *, uint64_t))(v15 + 8);
    v83(v40, v14);
    sub_100017B30((uint64_t)v11, &qword_100051090);
  }
  else
  {
    Swift::String v83 = *(void (**)(char *, uint64_t))(v15 + 8);
    v83(v27, v14);
    int v41 = v85;
    v36(v85, v11, v14);
  }
  sub_100013CA8(&qword_100051098, (void (*)(uint64_t))&type metadata accessor for Date);
  os_log_t v42 = v86;
  char v43 = sub_100044DB0();
  uint64_t v44 = v87;
  uint64_t v45 = (uint64_t)v84;
  if (v43)
  {
    if (qword_100050C60 != -1) {
      swift_once();
    }
    uint64_t v46 = sub_100044D60();
    sub_1000136A8(v46, (uint64_t)qword_100050E38);
    uint64_t v47 = v82;
    v37(v82, v42, v14);
    id v48 = v74;
    v37(v74, v41, v14);
    uint64_t v49 = sub_100044D40();
    os_log_type_t v50 = sub_100044F40();
    int v51 = v50;
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v52 = swift_slowAlloc();
      uint64_t v89 = swift_slowAlloc();
      *(void *)&v92[0] = v89;
      *(_DWORD *)uint64_t v52 = 136315394;
      Swift::String v84 = (char *)(v52 + 4);
      sub_100013CA8(&qword_1000510A0, (void (*)(uint64_t))&type metadata accessor for Date);
      LODWORD(v88) = v51;
      uint64_t v53 = sub_1000450F0();
      *(void *)&long long v90 = sub_1000434C0(v53, v54, (uint64_t *)v92);
      sub_100044FA0();
      swift_bridgeObjectRelease();
      v83(v47, v14);
      *(_WORD *)(v52 + 12) = 2080;
      uint64_t v55 = v74;
      uint64_t v56 = sub_1000450F0();
      *(void *)&long long v90 = sub_1000434C0(v56, v57, (uint64_t *)v92);
      sub_100044FA0();
      swift_bridgeObjectRelease();
      uint64_t v58 = v83;
      v83(v55, v14);
      _os_log_impl((void *)&_mh_execute_header, v49, (os_log_type_t)v88, "The current and next turn timestamps are out of order, cannot retrieve interaction events: curr=%s, next=%s", (uint8_t *)v52, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v58(v85, v14);
      v58(v86, v14);
    }
    else
    {

      os_log_t v63 = v83;
      v83(v48, v14);
      v63(v47, v14);
      v63(v41, v14);
      v63(v42, v14);
    }
    return 0;
  }
  v37(v76, v42, v14);
  v37(v77, v41, v14);
  uint64_t v59 = (uint64_t)v78;
  sub_1000444A0();
  uint64_t v60 = sub_1000144A4(v79, v59);
  if (v44)
  {
    (*(void (**)(uint64_t, void *))(v80 + 8))(v59, v81);
    uint64_t v61 = v75 + 8;
    uint64_t v62 = v83;
    v83(v41, v14);
    v62(v42, v14);
    return v61;
  }
  uint64_t v65 = v60;
  (*(void (**)(uint64_t, void *))(v80 + 8))(v59, v81);
  uint64_t v82 = (char *)v65[2];
  if (!v82)
  {
    uint64_t v61 = 0;
    goto LABEL_44;
  }
  uint64_t v87 = 0;
  unint64_t v81 = v65 + 4;
  uint64_t v79 = v65;
  uint64_t v80 = v75 + 56;
  swift_bridgeObjectRetain();
  uint64_t v66 = 0;
  while (1)
  {
    uint64_t v67 = &v81[2 * (void)v66];
    uint64_t v61 = *v67;
    uint64_t v68 = *(void *)(*v67 + 16);
    if (v68)
    {
      uint64_t v69 = v61 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      while (1)
      {
        sub_100013D44(v69, (uint64_t)&v90);
        sub_100013D44((uint64_t)&v90, (uint64_t)v92);
        sub_100006080(&qword_100051F10);
        sub_100044940();
        if (swift_dynamicCast()) {
          break;
        }
        sub_100006030((uint64_t)&v90);
        v69 += 40;
        if (!--v68)
        {
          swift_bridgeObjectRelease();
          uint64_t v45 = (uint64_t)v84;
          goto LABEL_31;
        }
      }
      swift_bridgeObjectRelease();
      swift_release();
      sub_100013CF0(&v90, (uint64_t)v92);
      uint64_t v45 = (uint64_t)v84;
    }
    else
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
LABEL_31:
      uint64_t v93 = 0;
      memset(v92, 0, sizeof(v92));
    }
    sub_100013FCC((uint64_t)v92, (uint64_t)&v90, &qword_1000510B0);
    if (v91)
    {
      sub_100006080(&qword_100051F10);
      sub_100044940();
      if (swift_dynamicCast())
      {
        swift_retain();
        sub_100044880();
        swift_release_n();
        uint64_t v70 = 0;
        goto LABEL_38;
      }
    }
    else
    {
      sub_100017B30((uint64_t)&v90, &qword_1000510B0);
    }
    uint64_t v70 = 1;
LABEL_38:
    sub_100017B30((uint64_t)v92, &qword_1000510B0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))v80)(v45, v70, 1, v14);
    swift_bridgeObjectRelease();
    unsigned int v71 = v88((char *)v45, 1, v14);
    sub_100017B30(v45, &qword_100051090);
    if (v71 != 1) {
      break;
    }
    ++v66;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v66 == v82)
    {
      swift_bridgeObjectRelease();
      uint64_t v61 = 0;
      goto LABEL_43;
    }
  }
  swift_bridgeObjectRelease();
LABEL_43:
  os_log_t v42 = v86;
  int v41 = v85;
LABEL_44:
  unint64_t v72 = v83;
  v83(v41, v14);
  v72(v42, v14);
  swift_bridgeObjectRelease();
  return v61;
}

uint64_t sub_1000157D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006080(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001583C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005E74(a1, a1[3]);
  uint64_t result = sub_100044AF0();
  *a2 = result;
  return result;
}

uint64_t destroy for FeaturisedInteractionEvent()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s50SiriUserFeedbackLearningUniversalSuggestionsPlugin26FeaturisedInteractionEventVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for FeaturisedInteractionEvent(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for FeaturisedInteractionEvent(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for FeaturisedInteractionEvent(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FeaturisedInteractionEvent(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FeaturisedInteractionEvent(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FeaturisedInteractionEvent()
{
  return &type metadata for FeaturisedInteractionEvent;
}

uint64_t *sub_100015A58(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v6 = sub_100044540();
    uint64_t v7 = *(void *)(v6 - 8);
    id v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16);
    v8(a1, a2, v6);
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    long long v11 = (char *)a2 + v9;
    uint64_t updated = type metadata accessor for ModelUpdateStep(0);
    uint64_t v69 = v7;
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v66 = v8;
        uint64_t v13 = sub_100044850();
        uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
        v14(v10, v11, v13);
        uint64_t v15 = sub_100006080(&qword_100050FD0);
        uint64_t v16 = v13;
        id v8 = v66;
        v14(&v10[*(int *)(v15 + 48)], &v11[*(int *)(v15 + 48)], v16);
        uint64_t v7 = v69;
        goto LABEL_7;
      case 1u:
      case 2u:
      case 3u:
        uint64_t v18 = sub_100044AA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v10, v11, v18);
LABEL_7:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v10, v11, *(void *)(*(void *)(updated - 8) + 64));
        break;
    }
    uint64_t v19 = *(int *)(a3 + 24);
    uint64_t v20 = (char *)a1 + v19;
    uint64_t v21 = (char *)a2 + v19;
    v8((uint64_t *)((char *)a1 + v19), (uint64_t *)v21, v6);
    uint64_t v22 = type metadata accessor for UniversalSuggestionCorrectionDiscovered(0);
    uint64_t v23 = *(int *)(v22 + 20);
    uint64_t v24 = &v20[v23];
    uint64_t v25 = &v21[v23];
    uint64_t v65 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
    if (v65(&v21[v23], 1, v6))
    {
      uint64_t v26 = sub_100006080(&qword_100051078);
      memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      v8((uint64_t *)v24, (uint64_t *)v25, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v24, 0, 1, v6);
    }
    uint64_t v27 = *(int *)(v22 + 24);
    uint64_t v28 = &v20[v27];
    uint64_t v29 = &v21[v27];
    uint64_t v30 = sub_100006080(&qword_100050FD0);
    uint64_t v31 = *(void *)(v30 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 2, v30))
    {
      uint64_t v32 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
      memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
    }
    else
    {
      uint64_t v67 = v8;
      uint64_t v33 = sub_100044850();
      os_log_type_t v34 = *(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16);
      v34(v28, v29, v33);
      uint64_t v35 = v33;
      id v8 = v67;
      v34(&v28[*(int *)(v30 + 48)], &v29[*(int *)(v30 + 48)], v35);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v28, 0, 2, v30);
    }
    uint64_t v36 = *(int *)(type metadata accessor for UniversalSuggestionRequestState(0) + 20);
    unint64_t v37 = &v20[v36];
    unsigned int v38 = &v21[v36];
    v8((uint64_t *)v37, (uint64_t *)&v21[v36], v6);
    uint64_t v39 = *(int *)(type metadata accessor for UniversalSuggestionRequestTaskState(0) + 20);
    uint64_t v40 = &v37[v39];
    int v41 = &v38[v39];
    uint64_t v42 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
    uint64_t v43 = *(void *)(v42 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v41, 1, v42))
    {
      uint64_t v44 = sub_100006080(&qword_100050FD8);
      memcpy(v40, v41, *(void *)(*(void *)(v44 - 8) + 64));
    }
    else
    {
      uint64_t v68 = v43;
      uint64_t v45 = *((void *)v41 + 1);
      *(void *)uint64_t v40 = *(void *)v41;
      *((void *)v40 + 1) = v45;
      *((void *)v40 + 2) = *((void *)v41 + 2);
      v40[24] = v41[24];
      uint64_t v46 = type metadata accessor for UniversalSuggestionItem(0);
      uint64_t v47 = *(int *)(v46 + 24);
      id v48 = (void (*)(char *, char *, uint64_t))v8;
      uint64_t v49 = &v40[v47];
      os_log_type_t v50 = &v41[v47];
      swift_bridgeObjectRetain();
      v48(v49, v50, v6);
      uint64_t v51 = *(int *)(v46 + 28);
      uint64_t v52 = &v40[v51];
      uint64_t v53 = &v41[v51];
      uint64_t v54 = sub_100044A70();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v54 - 8) + 16))(v52, v53, v54);
      uint64_t v55 = *(int *)(v42 + 20);
      uint64_t v56 = &v40[v55];
      unint64_t v57 = &v41[v55];
      uint64_t v58 = sub_100006080(&qword_100050FE0);
      uint64_t v59 = *(void *)(v58 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v59 + 48))(v57, 3, v58))
      {
        uint64_t v60 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
        memcpy(v56, v57, *(void *)(*(void *)(v60 - 8) + 64));
        uint64_t v61 = v68;
      }
      else
      {
        if (v65(v57, 1, v6))
        {
          uint64_t v62 = sub_100006080(&qword_100051078);
          memcpy(v56, v57, *(void *)(*(void *)(v62 - 8) + 64));
        }
        else
        {
          v48(v56, v57, v6);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v69 + 56))(v56, 0, 1, v6);
        }
        uint64_t v61 = v68;
        uint64_t v63 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
        v56[*(int *)(v63 + 20)] = v57[*(int *)(v63 + 20)];
        (*(void (**)(char *, void, uint64_t, uint64_t))(v59 + 56))(v56, 0, 3, v58);
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v61 + 56))(v40, 0, 1, v42);
    }
  }
  return a1;
}

uint64_t sub_100016270(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100044540();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v28(a1, v4);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  type metadata accessor for ModelUpdateStep(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v8 = sub_100044850();
      uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
      v9(v6, v8);
      uint64_t v10 = sub_100006080(&qword_100050FD0);
      v9(v6 + *(int *)(v10 + 48), v8);
      break;
    case 1u:
    case 2u:
    case 3u:
      uint64_t v7 = sub_100044AA0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
      break;
    default:
      break;
  }
  uint64_t v11 = a1 + *(int *)(a2 + 24);
  v28(v11, v4);
  uint64_t v12 = type metadata accessor for UniversalSuggestionCorrectionDiscovered(0);
  uint64_t v13 = v11 + *(int *)(v12 + 20);
  uint64_t v14 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v14(v13, 1, v4)) {
    v28(v13, v4);
  }
  uint64_t v15 = v11 + *(int *)(v12 + 24);
  uint64_t v16 = sub_100006080(&qword_100050FD0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v15, 2, v16))
  {
    uint64_t v17 = sub_100044850();
    uint64_t v18 = *(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8);
    v18(v15, v17);
    v18(v15 + *(int *)(v16 + 48), v17);
  }
  uint64_t v19 = v11 + *(int *)(type metadata accessor for UniversalSuggestionRequestState(0) + 20);
  v28(v19, v4);
  uint64_t v20 = v19 + *(int *)(type metadata accessor for UniversalSuggestionRequestTaskState(0) + 20);
  uint64_t v21 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 48))(v20, 1, v21);
  if (!result)
  {
    swift_bridgeObjectRelease();
    uint64_t v23 = type metadata accessor for UniversalSuggestionItem(0);
    v28(v20 + *(int *)(v23 + 24), v4);
    uint64_t v24 = v20 + *(int *)(v23 + 28);
    uint64_t v25 = sub_100044A70();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v25 - 8) + 8))(v24, v25);
    uint64_t v26 = v20 + *(int *)(v21 + 20);
    uint64_t v27 = sub_100006080(&qword_100050FE0);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 48))(v26, 3, v27);
    if (!result)
    {
      uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v14)(v26, 1, v4);
      if (!result)
      {
        return ((uint64_t (*)(uint64_t, uint64_t))v28)(v26, v4);
      }
    }
  }
  return result;
}

uint64_t sub_1000166C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v64 = a1;
  uint64_t v10 = (char *)(a1 + v9);
  uint64_t v11 = (char *)(a2 + v9);
  uint64_t updated = type metadata accessor for ModelUpdateStep(0);
  uint64_t v63 = v7;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v13 = sub_100044850();
      uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
      v14(v10, v11, v13);
      uint64_t v15 = sub_100006080(&qword_100050FD0);
      v14(&v10[*(int *)(v15 + 48)], &v11[*(int *)(v15 + 48)], v13);
      uint64_t v7 = v63;
      goto LABEL_5;
    case 1u:
    case 2u:
    case 3u:
      uint64_t v16 = sub_100044AA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v10, v11, v16);
LABEL_5:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v10, v11, *(void *)(*(void *)(updated - 8) + 64));
      break;
  }
  uint64_t v17 = *(int *)(a3 + 24);
  uint64_t v18 = v64 + v17;
  uint64_t v19 = a2 + v17;
  v8(v64 + v17, v19, v6);
  uint64_t v20 = type metadata accessor for UniversalSuggestionCorrectionDiscovered(0);
  uint64_t v21 = *(int *)(v20 + 20);
  uint64_t v22 = (void *)(v18 + v21);
  uint64_t v23 = (const void *)(v19 + v21);
  uint64_t v61 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (v61(v19 + v21, 1, v6))
  {
    uint64_t v24 = sub_100006080(&qword_100051078);
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    v8((uint64_t)v22, (uint64_t)v23, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v22, 0, 1, v6);
  }
  uint64_t v25 = *(int *)(v20 + 24);
  uint64_t v26 = (char *)(v18 + v25);
  uint64_t v27 = (char *)(v19 + v25);
  uint64_t v28 = sub_100006080(&qword_100050FD0);
  uint64_t v29 = *(void *)(v28 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 2, v28))
  {
    uint64_t v30 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
    memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
  }
  else
  {
    uint64_t v31 = sub_100044850();
    uint64_t v62 = v8;
    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16);
    v32(v26, v27, v31);
    v32(&v26[*(int *)(v28 + 48)], &v27[*(int *)(v28 + 48)], v31);
    uint64_t v8 = v62;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 2, v28);
  }
  uint64_t v33 = *(int *)(type metadata accessor for UniversalSuggestionRequestState(0) + 20);
  uint64_t v34 = v18 + v33;
  uint64_t v35 = v19 + v33;
  v8(v34, v19 + v33, v6);
  uint64_t v36 = *(int *)(type metadata accessor for UniversalSuggestionRequestTaskState(0) + 20);
  unint64_t v37 = (void *)(v34 + v36);
  unsigned int v38 = (void *)(v35 + v36);
  uint64_t v39 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
  uint64_t v40 = *(void *)(v39 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
  {
    uint64_t v41 = sub_100006080(&qword_100050FD8);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
  }
  else
  {
    uint64_t v42 = v38[1];
    void *v37 = *v38;
    v37[1] = v42;
    v37[2] = v38[2];
    *((unsigned char *)v37 + 24) = *((unsigned char *)v38 + 24);
    uint64_t v43 = type metadata accessor for UniversalSuggestionItem(0);
    uint64_t v44 = *(int *)(v43 + 24);
    uint64_t v45 = (char *)v37 + v44;
    uint64_t v46 = (void (*)(char *, char *, uint64_t))v8;
    uint64_t v47 = (char *)v38 + v44;
    swift_bridgeObjectRetain();
    v46(v45, v47, v6);
    uint64_t v48 = *(int *)(v43 + 28);
    uint64_t v49 = (char *)v37 + v48;
    os_log_type_t v50 = (char *)v38 + v48;
    uint64_t v51 = sub_100044A70();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 16))(v49, v50, v51);
    uint64_t v52 = *(int *)(v39 + 20);
    uint64_t v53 = (char *)v37 + v52;
    uint64_t v54 = (char *)v38 + v52;
    uint64_t v55 = sub_100006080(&qword_100050FE0);
    uint64_t v56 = *(void *)(v55 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v56 + 48))(v54, 3, v55))
    {
      uint64_t v57 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
      memcpy(v53, v54, *(void *)(*(void *)(v57 - 8) + 64));
    }
    else
    {
      if (v61((uint64_t)v54, 1, v6))
      {
        uint64_t v58 = sub_100006080(&qword_100051078);
        memcpy(v53, v54, *(void *)(*(void *)(v58 - 8) + 64));
      }
      else
      {
        v46(v53, v54, v6);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v63 + 56))(v53, 0, 1, v6);
      }
      uint64_t v59 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
      v53[*(int *)(v59 + 20)] = v54[*(int *)(v59 + 20)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v56 + 56))(v53, 0, 3, v55);
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
  }
  return v64;
}

uint64_t sub_100016E7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v7 + 24);
  uint64_t v103 = v6;
  v8(a1, a2);
  uint64_t v100 = a1;
  uint64_t v101 = v8;
  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)(a1 + v9);
    uint64_t v11 = (char *)(a2 + v9);
    sub_1000136E0(a1 + v9, type metadata accessor for ModelUpdateStep);
    uint64_t updated = type metadata accessor for ModelUpdateStep(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v13 = sub_100044850();
        uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
        v14(v10, v11, v13);
        uint64_t v15 = sub_100006080(&qword_100050FD0);
        v14(&v10[*(int *)(v15 + 48)], &v11[*(int *)(v15 + 48)], v13);
        uint64_t v8 = v101;
        goto LABEL_6;
      case 1u:
      case 2u:
      case 3u:
        uint64_t v16 = sub_100044AA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v10, v11, v16);
LABEL_6:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v10, v11, *(void *)(*(void *)(updated - 8) + 64));
        break;
    }
  }
  uint64_t v17 = *(int *)(a3 + 24);
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  ((void (*)(uint64_t, uint64_t, uint64_t))v8)(a1 + v17, a2 + v17, v103);
  uint64_t v20 = type metadata accessor for UniversalSuggestionCorrectionDiscovered(0);
  uint64_t v21 = *(int *)(v20 + 20);
  uint64_t v98 = v18;
  uint64_t v99 = v19;
  uint64_t v22 = (void *)(v18 + v21);
  uint64_t v23 = (const void *)(v19 + v21);
  uint64_t v24 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  unsigned int v25 = v24(v18 + v21, 1, v103);
  unsigned int v96 = (unsigned int (*)(const void *, uint64_t, uint64_t))v24;
  unsigned int v26 = v24((uint64_t)v23, 1, v103);
  uint64_t v97 = v7;
  if (v25)
  {
    if (v26)
    {
      uint64_t v27 = sub_100006080(&qword_100051078);
      memcpy(v22, v23, *(void *)(*(void *)(v27 - 8) + 64));
      uint64_t v28 = v103;
    }
    else
    {
      uint64_t v28 = v103;
      (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(v22, v23, v103);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v22, 0, 1, v103);
    }
  }
  else
  {
    uint64_t v28 = v103;
    if (v26)
    {
      (*(void (**)(void *, uint64_t))(v7 + 8))(v22, v103);
      uint64_t v29 = sub_100006080(&qword_100051078);
      memcpy(v22, v23, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      ((void (*)(void *, const void *, uint64_t))v8)(v22, v23, v103);
    }
  }
  uint64_t v30 = *(int *)(v20 + 24);
  uint64_t v31 = (char *)(v18 + v30);
  uint64_t v32 = (char *)(v99 + v30);
  uint64_t v33 = sub_100006080(&qword_100050FD0);
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 48);
  int v36 = v35(v31, 2, v33);
  int v37 = v35(v32, 2, v33);
  if (v36)
  {
    if (!v37)
    {
      uint64_t v38 = sub_100044850();
      uint64_t v39 = *(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16);
      v39(v31, v32, v38);
      v39(&v31[*(int *)(v33 + 48)], &v32[*(int *)(v33 + 48)], v38);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 2, v33);
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v37)
  {
    sub_100017B30((uint64_t)v31, &qword_100050FD0);
LABEL_19:
    uint64_t v40 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
    memcpy(v31, v32, *(void *)(*(void *)(v40 - 8) + 64));
    goto LABEL_20;
  }
  uint64_t v71 = sub_100044850();
  unint64_t v72 = *(void (**)(char *, char *, uint64_t))(*(void *)(v71 - 8) + 24);
  v72(v31, v32, v71);
  v72(&v31[*(int *)(v33 + 48)], &v32[*(int *)(v33 + 48)], v71);
LABEL_20:
  uint64_t v41 = *(int *)(type metadata accessor for UniversalSuggestionRequestState(0) + 20);
  uint64_t v42 = v18 + v41;
  uint64_t v43 = v99 + v41;
  ((void (*)(uint64_t, uint64_t, uint64_t))v101)(v98 + v41, v99 + v41, v28);
  uint64_t v44 = *(int *)(type metadata accessor for UniversalSuggestionRequestTaskState(0) + 20);
  uint64_t v45 = v42 + v44;
  uint64_t v46 = v43 + v44;
  uint64_t v47 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
  uint64_t v48 = *(void *)(v47 - 8);
  uint64_t v49 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v48 + 48);
  int v50 = v49(v45, 1, v47);
  int v51 = v49(v46, 1, v47);
  if (!v50)
  {
    if (v51)
    {
      sub_1000136E0(v45, type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState);
      goto LABEL_26;
    }
    *(void *)uint64_t v45 = *(void *)v46;
    *(void *)(v45 + 8) = *(void *)(v46 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v73 = *(void *)(v46 + 16);
    *(unsigned char *)(v45 + 24) = *(unsigned char *)(v46 + 24);
    *(void *)(v45 + 16) = v73;
    uint64_t v74 = type metadata accessor for UniversalSuggestionItem(0);
    ((void (*)(uint64_t, uint64_t, uint64_t))v101)(v45 + *(int *)(v74 + 24), v46 + *(int *)(v74 + 24), v28);
    uint64_t v75 = *(int *)(v74 + 28);
    uint64_t v76 = v45 + v75;
    uint64_t v77 = v46 + v75;
    uint64_t v78 = sub_100044A70();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v78 - 8) + 24))(v76, v77, v78);
    uint64_t v79 = *(int *)(v47 + 20);
    uint64_t v80 = (void *)(v45 + v79);
    unint64_t v81 = (void *)(v46 + v79);
    uint64_t v82 = sub_100006080(&qword_100050FE0);
    uint64_t v83 = *(void *)(v82 - 8);
    Swift::String v84 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v83 + 48);
    LODWORD(v76) = v84(v80, 3, v82);
    int v85 = v84(v81, 3, v82);
    if (v76)
    {
      uint64_t v67 = v100;
      if (!v85)
      {
        if (v96(v81, 1, v28))
        {
          uint64_t v86 = sub_100006080(&qword_100051078);
          memcpy(v80, v81, *(void *)(*(void *)(v86 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(v97 + 16))(v80, v81, v28);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v97 + 56))(v80, 0, 1, v28);
        }
        uint64_t v93 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
        *((unsigned char *)v80 + *(int *)(v93 + 20)) = *((unsigned char *)v81 + *(int *)(v93 + 20));
        (*(void (**)(void *, void, uint64_t, uint64_t))(v83 + 56))(v80, 0, 3, v82);
        return v67;
      }
LABEL_36:
      uint64_t v88 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
      memcpy(v80, v81, *(void *)(*(void *)(v88 - 8) + 64));
      return v67;
    }
    uint64_t v67 = v100;
    if (v85)
    {
      sub_100017B30((uint64_t)v80, &qword_100050FE0);
      goto LABEL_36;
    }
    unsigned int v91 = v96(v80, 1, v28);
    unsigned int v92 = v96(v81, 1, v28);
    if (v91)
    {
      if (!v92)
      {
        (*(void (**)(void *, void *, uint64_t))(v97 + 16))(v80, v81, v28);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v97 + 56))(v80, 0, 1, v28);
LABEL_49:
        uint64_t v95 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
        *((unsigned char *)v80 + *(int *)(v95 + 20)) = *((unsigned char *)v81 + *(int *)(v95 + 20));
        return v67;
      }
    }
    else
    {
      if (!v92)
      {
        ((void (*)(void *, void *, uint64_t))v101)(v80, v81, v28);
        goto LABEL_49;
      }
      (*(void (**)(void *, uint64_t))(v97 + 8))(v80, v28);
    }
    uint64_t v94 = sub_100006080(&qword_100051078);
    memcpy(v80, v81, *(void *)(*(void *)(v94 - 8) + 64));
    goto LABEL_49;
  }
  if (v51)
  {
LABEL_26:
    uint64_t v70 = sub_100006080(&qword_100050FD8);
    memcpy((void *)v45, (const void *)v46, *(void *)(*(void *)(v70 - 8) + 64));
    return v100;
  }
  uint64_t v102 = v48;
  *(void *)uint64_t v45 = *(void *)v46;
  *(void *)(v45 + 8) = *(void *)(v46 + 8);
  uint64_t v52 = *(void *)(v46 + 16);
  *(unsigned char *)(v45 + 24) = *(unsigned char *)(v46 + 24);
  *(void *)(v45 + 16) = v52;
  uint64_t v53 = type metadata accessor for UniversalSuggestionItem(0);
  uint64_t v54 = *(int *)(v53 + 24);
  uint64_t v55 = v45 + v54;
  uint64_t v56 = v46 + v54;
  uint64_t v57 = *(void (**)(uint64_t, uint64_t, uint64_t))(v97 + 16);
  swift_bridgeObjectRetain();
  v57(v55, v56, v28);
  uint64_t v58 = *(int *)(v53 + 28);
  uint64_t v59 = v45 + v58;
  uint64_t v60 = v46 + v58;
  uint64_t v61 = sub_100044A70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v61 - 8) + 16))(v59, v60, v61);
  uint64_t v62 = *(int *)(v47 + 20);
  uint64_t v63 = (void *)(v45 + v62);
  uint64_t v64 = (const void *)(v46 + v62);
  uint64_t v65 = sub_100006080(&qword_100050FE0);
  uint64_t v66 = *(void *)(v65 - 8);
  uint64_t v67 = v100;
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v66 + 48))(v64, 3, v65))
  {
    uint64_t v68 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
    memcpy(v63, v64, *(void *)(*(void *)(v68 - 8) + 64));
    uint64_t v69 = v102;
  }
  else
  {
    if (v96(v64, 1, v103))
    {
      uint64_t v87 = sub_100006080(&qword_100051078);
      memcpy(v63, v64, *(void *)(*(void *)(v87 - 8) + 64));
    }
    else
    {
      v57((uint64_t)v63, (uint64_t)v64, v103);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v97 + 56))(v63, 0, 1, v103);
    }
    uint64_t v69 = v102;
    uint64_t v89 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
    *((unsigned char *)v63 + *(int *)(v89 + 20)) = *((unsigned char *)v64 + *(int *)(v89 + 20));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v66 + 56))(v63, 0, 3, v65);
  }
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v69 + 56))(v45, 0, 1, v47);
  return v67;
}

uint64_t sub_100017B30(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006080(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100017B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  uint64_t v59 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v59 + 32);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v60 = a1;
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t updated = type metadata accessor for ModelUpdateStep(0);
  uint64_t v58 = v7;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v12 = sub_100044850();
      uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32);
      v13(v9, v10, v12);
      uint64_t v14 = sub_100006080(&qword_100050FD0);
      v13(&v9[*(int *)(v14 + 48)], &v10[*(int *)(v14 + 48)], v12);
      goto LABEL_5;
    case 1u:
    case 2u:
    case 3u:
      uint64_t v15 = sub_100044AA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v9, v10, v15);
LABEL_5:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v9, v10, *(void *)(*(void *)(updated - 8) + 64));
      break;
  }
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = v60 + v16;
  uint64_t v18 = a2 + v16;
  v7(v60 + v16, v18, v6);
  uint64_t v19 = type metadata accessor for UniversalSuggestionCorrectionDiscovered(0);
  uint64_t v20 = *(int *)(v19 + 20);
  uint64_t v21 = (void *)(v17 + v20);
  uint64_t v22 = (const void *)(v18 + v20);
  uint64_t v23 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v59 + 48);
  if (v23(v18 + v20, 1, v6))
  {
    uint64_t v24 = sub_100006080(&qword_100051078);
    memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v21, (uint64_t)v22, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v59 + 56))(v21, 0, 1, v6);
  }
  uint64_t v25 = *(int *)(v19 + 24);
  unsigned int v26 = (char *)(v17 + v25);
  uint64_t v27 = (char *)(v18 + v25);
  uint64_t v28 = sub_100006080(&qword_100050FD0);
  uint64_t v29 = *(void *)(v28 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 2, v28))
  {
    uint64_t v30 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
    memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
  }
  else
  {
    uint64_t v57 = v6;
    uint64_t v31 = sub_100044850();
    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 32);
    v32(v26, v27, v31);
    v32(&v26[*(int *)(v28 + 48)], &v27[*(int *)(v28 + 48)], v31);
    uint64_t v6 = v57;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 2, v28);
  }
  uint64_t v33 = *(int *)(type metadata accessor for UniversalSuggestionRequestState(0) + 20);
  uint64_t v34 = v17 + v33;
  uint64_t v35 = v18 + v33;
  v58(v34, v18 + v33, v6);
  uint64_t v36 = *(int *)(type metadata accessor for UniversalSuggestionRequestTaskState(0) + 20);
  int v37 = (_OWORD *)(v34 + v36);
  uint64_t v38 = (_OWORD *)(v35 + v36);
  uint64_t v39 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
  uint64_t v40 = *(void *)(v39 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
  {
    uint64_t v41 = sub_100006080(&qword_100050FD8);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
  }
  else
  {
    _OWORD *v37 = *v38;
    *((void *)v37 + 2) = *((void *)v38 + 2);
    *((unsigned char *)v37 + 24) = *((unsigned char *)v38 + 24);
    uint64_t v42 = type metadata accessor for UniversalSuggestionItem(0);
    v58((uint64_t)v37 + *(int *)(v42 + 24), (uint64_t)v38 + *(int *)(v42 + 24), v6);
    uint64_t v43 = *(int *)(v42 + 28);
    uint64_t v44 = (char *)v37 + v43;
    uint64_t v45 = (char *)v38 + v43;
    uint64_t v46 = sub_100044A70();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 32))(v44, v45, v46);
    uint64_t v47 = *(int *)(v39 + 20);
    __dst = (char *)v37 + v47;
    uint64_t v48 = (char *)v38 + v47;
    uint64_t v49 = sub_100006080(&qword_100050FE0);
    uint64_t v50 = *(void *)(v49 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v48, 3, v49))
    {
      uint64_t v51 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
      memcpy(__dst, v48, *(void *)(*(void *)(v51 - 8) + 64));
    }
    else
    {
      if (v23((uint64_t)v48, 1, v6))
      {
        uint64_t v52 = sub_100006080(&qword_100051078);
        uint64_t v53 = __dst;
        memcpy(__dst, v48, *(void *)(*(void *)(v52 - 8) + 64));
      }
      else
      {
        uint64_t v53 = __dst;
        v58((uint64_t)__dst, (uint64_t)v48, v6);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v59 + 56))(__dst, 0, 1, v6);
      }
      uint64_t v54 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
      v53[*(int *)(v54 + 20)] = v48[*(int *)(v54 + 20)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v50 + 56))(v53, 0, 3, v49);
    }
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
  }
  return v60;
}

uint64_t sub_100018340(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v7 + 40);
  uint64_t v98 = v6;
  v8(a1, a2);
  uint64_t v96 = a1;
  uint64_t v97 = v8;
  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)(a1 + v9);
    uint64_t v11 = (char *)(a2 + v9);
    sub_1000136E0(a1 + v9, type metadata accessor for ModelUpdateStep);
    uint64_t updated = type metadata accessor for ModelUpdateStep(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v13 = sub_100044850();
        uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32);
        v14(v10, v11, v13);
        uint64_t v15 = sub_100006080(&qword_100050FD0);
        v14(&v10[*(int *)(v15 + 48)], &v11[*(int *)(v15 + 48)], v13);
        uint64_t v8 = v97;
        goto LABEL_6;
      case 1u:
      case 2u:
      case 3u:
        uint64_t v16 = sub_100044AA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v10, v11, v16);
LABEL_6:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v10, v11, *(void *)(*(void *)(updated - 8) + 64));
        break;
    }
  }
  uint64_t v17 = *(int *)(a3 + 24);
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  ((void (*)(uint64_t, uint64_t, uint64_t))v8)(a1 + v17, a2 + v17, v98);
  uint64_t v20 = type metadata accessor for UniversalSuggestionCorrectionDiscovered(0);
  uint64_t v21 = *(int *)(v20 + 20);
  uint64_t v93 = v18;
  uint64_t v94 = v19;
  uint64_t v22 = (void *)(v18 + v21);
  uint64_t v23 = (const void *)(v19 + v21);
  uint64_t v24 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  unsigned int v25 = v24(v18 + v21, 1, v98);
  unsigned int v92 = (unsigned int (*)(const void *, uint64_t, uint64_t))v24;
  unsigned int v26 = v24((uint64_t)v23, 1, v98);
  uint64_t v95 = v7;
  if (v25)
  {
    if (v26)
    {
      uint64_t v27 = sub_100006080(&qword_100051078);
      memcpy(v22, v23, *(void *)(*(void *)(v27 - 8) + 64));
      uint64_t v28 = v98;
    }
    else
    {
      uint64_t v28 = v98;
      (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(v22, v23, v98);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v22, 0, 1, v98);
    }
  }
  else
  {
    uint64_t v28 = v98;
    if (v26)
    {
      (*(void (**)(void *, uint64_t))(v7 + 8))(v22, v98);
      uint64_t v29 = sub_100006080(&qword_100051078);
      memcpy(v22, v23, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      ((void (*)(void *, const void *, uint64_t))v8)(v22, v23, v98);
    }
  }
  uint64_t v30 = *(int *)(v20 + 24);
  uint64_t v31 = (char *)(v18 + v30);
  uint64_t v32 = (char *)(v94 + v30);
  uint64_t v33 = sub_100006080(&qword_100050FD0);
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 48);
  int v36 = v35(v31, 2, v33);
  int v37 = v35(v32, 2, v33);
  if (v36)
  {
    if (!v37)
    {
      uint64_t v38 = sub_100044850();
      uint64_t v39 = *(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32);
      v39(v31, v32, v38);
      v39(&v31[*(int *)(v33 + 48)], &v32[*(int *)(v33 + 48)], v38);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 2, v33);
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v37)
  {
    sub_100017B30((uint64_t)v31, &qword_100050FD0);
LABEL_19:
    uint64_t v40 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
    memcpy(v31, v32, *(void *)(*(void *)(v40 - 8) + 64));
    goto LABEL_20;
  }
  uint64_t v67 = sub_100044850();
  uint64_t v68 = *(void (**)(char *, char *, uint64_t))(*(void *)(v67 - 8) + 40);
  v68(v31, v32, v67);
  v68(&v31[*(int *)(v33 + 48)], &v32[*(int *)(v33 + 48)], v67);
LABEL_20:
  uint64_t v41 = *(int *)(type metadata accessor for UniversalSuggestionRequestState(0) + 20);
  uint64_t v42 = v18 + v41;
  uint64_t v43 = v94 + v41;
  ((void (*)(uint64_t, uint64_t, uint64_t))v97)(v93 + v41, v94 + v41, v28);
  uint64_t v44 = *(int *)(type metadata accessor for UniversalSuggestionRequestTaskState(0) + 20);
  uint64_t v45 = v42 + v44;
  uint64_t v46 = v43 + v44;
  uint64_t v47 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
  uint64_t v48 = *(void *)(v47 - 8);
  uint64_t v49 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v48 + 48);
  int v50 = v49(v45, 1, v47);
  int v51 = v49(v46, 1, v47);
  if (!v50)
  {
    if (v51)
    {
      sub_1000136E0(v45, type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState);
      goto LABEL_26;
    }
    uint64_t v69 = *(void *)(v46 + 8);
    *(void *)uint64_t v45 = *(void *)v46;
    *(void *)(v45 + 8) = v69;
    swift_bridgeObjectRelease();
    *(void *)(v45 + 16) = *(void *)(v46 + 16);
    *(unsigned char *)(v45 + 24) = *(unsigned char *)(v46 + 24);
    uint64_t v70 = type metadata accessor for UniversalSuggestionItem(0);
    ((void (*)(uint64_t, uint64_t, uint64_t))v97)(v45 + *(int *)(v70 + 24), v46 + *(int *)(v70 + 24), v28);
    uint64_t v71 = *(int *)(v70 + 28);
    uint64_t v72 = v45 + v71;
    uint64_t v73 = v46 + v71;
    uint64_t v74 = sub_100044A70();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v74 - 8) + 40))(v72, v73, v74);
    uint64_t v75 = *(int *)(v47 + 20);
    uint64_t v76 = (void *)(v45 + v75);
    uint64_t v77 = (void *)(v46 + v75);
    uint64_t v78 = sub_100006080(&qword_100050FE0);
    uint64_t v79 = *(void *)(v78 - 8);
    uint64_t v80 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v79 + 48);
    LODWORD(v72) = v80(v76, 3, v78);
    int v81 = v80(v77, 3, v78);
    if (v72)
    {
      uint64_t v66 = v96;
      if (!v81)
      {
        if (v92(v77, 1, v28))
        {
          uint64_t v82 = sub_100006080(&qword_100051078);
          memcpy(v76, v77, *(void *)(*(void *)(v82 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(v95 + 32))(v76, v77, v28);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v95 + 56))(v76, 0, 1, v28);
        }
        uint64_t v89 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
        *((unsigned char *)v76 + *(int *)(v89 + 20)) = *((unsigned char *)v77 + *(int *)(v89 + 20));
        (*(void (**)(void *, void, uint64_t, uint64_t))(v79 + 56))(v76, 0, 3, v78);
        return v66;
      }
LABEL_36:
      uint64_t v84 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
      memcpy(v76, v77, *(void *)(*(void *)(v84 - 8) + 64));
      return v66;
    }
    uint64_t v66 = v96;
    if (v81)
    {
      sub_100017B30((uint64_t)v76, &qword_100050FE0);
      goto LABEL_36;
    }
    unsigned int v87 = v92(v76, 1, v28);
    unsigned int v88 = v92(v77, 1, v28);
    if (v87)
    {
      if (!v88)
      {
        (*(void (**)(void *, void *, uint64_t))(v95 + 32))(v76, v77, v28);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v95 + 56))(v76, 0, 1, v28);
LABEL_49:
        uint64_t v91 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
        *((unsigned char *)v76 + *(int *)(v91 + 20)) = *((unsigned char *)v77 + *(int *)(v91 + 20));
        return v66;
      }
    }
    else
    {
      if (!v88)
      {
        ((void (*)(void *, void *, uint64_t))v97)(v76, v77, v28);
        goto LABEL_49;
      }
      (*(void (**)(void *, uint64_t))(v95 + 8))(v76, v28);
    }
    uint64_t v90 = sub_100006080(&qword_100051078);
    memcpy(v76, v77, *(void *)(*(void *)(v90 - 8) + 64));
    goto LABEL_49;
  }
  if (v51)
  {
LABEL_26:
    uint64_t v65 = sub_100006080(&qword_100050FD8);
    memcpy((void *)v45, (const void *)v46, *(void *)(*(void *)(v65 - 8) + 64));
    return v96;
  }
  *(_OWORD *)uint64_t v45 = *(_OWORD *)v46;
  *(void *)(v45 + 16) = *(void *)(v46 + 16);
  *(unsigned char *)(v45 + 24) = *(unsigned char *)(v46 + 24);
  uint64_t v52 = type metadata accessor for UniversalSuggestionItem(0);
  uint64_t v53 = v28;
  uint64_t v54 = *(void (**)(uint64_t, uint64_t, uint64_t))(v95 + 32);
  v54(v45 + *(int *)(v52 + 24), v46 + *(int *)(v52 + 24), v53);
  uint64_t v55 = *(int *)(v52 + 28);
  uint64_t v56 = v45 + v55;
  uint64_t v57 = v46 + v55;
  uint64_t v58 = sub_100044A70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 32))(v56, v57, v58);
  uint64_t v59 = *(int *)(v47 + 20);
  uint64_t v60 = (void *)(v45 + v59);
  uint64_t v61 = (const void *)(v46 + v59);
  uint64_t v62 = sub_100006080(&qword_100050FE0);
  uint64_t v63 = *(void *)(v62 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v63 + 48))(v61, 3, v62))
  {
    uint64_t v64 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
    memcpy(v60, v61, *(void *)(*(void *)(v64 - 8) + 64));
  }
  else
  {
    if (v92(v61, 1, v98))
    {
      uint64_t v83 = sub_100006080(&qword_100051078);
      memcpy(v60, v61, *(void *)(*(void *)(v83 - 8) + 64));
    }
    else
    {
      v54((uint64_t)v60, (uint64_t)v61, v98);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v95 + 56))(v60, 0, 1, v98);
    }
    uint64_t v85 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
    *((unsigned char *)v60 + *(int *)(v85 + 20)) = *((unsigned char *)v61 + *(int *)(v85 + 20));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v63 + 56))(v60, 0, 3, v62);
  }
  uint64_t v66 = v96;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v48 + 56))(v45, 0, 1, v47);
  return v66;
}

uint64_t sub_100018FB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100018FC8);
}

uint64_t sub_100018FC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t updated = type metadata accessor for ModelUpdateStep(0);
  uint64_t v12 = *(void *)(updated - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = updated;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = type metadata accessor for UniversalSuggestionRequestState(0);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);
  return v15(v17, a2, v16);
}

uint64_t sub_100019114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100019128);
}

uint64_t sub_100019128(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100044540();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t updated = type metadata accessor for ModelUpdateStep(0);
  uint64_t v14 = *(void *)(updated - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = updated;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = type metadata accessor for UniversalSuggestionRequestState(0);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);
  return v17(v19, a2, a2, v18);
}

uint64_t sub_100019280()
{
  uint64_t result = sub_100044540();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for ModelUpdateStep(319);
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for UniversalSuggestionRequestState(319);
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t *sub_100019384(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v7 = sub_100044850();
        uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
        v8(a1, a2, v7);
        uint64_t v9 = sub_100006080(&qword_100050FD0);
        v8((uint64_t *)((char *)a1 + *(int *)(v9 + 48)), (uint64_t *)((char *)a2 + *(int *)(v9 + 48)), v7);
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
      case 2u:
      case 3u:
        uint64_t v12 = sub_100044AA0();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_1000195D8(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v7 = sub_100044850();
      uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
      ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v7 - 8), a1, v7);
      uint64_t v6 = a1 + *(int *)(sub_100006080(&qword_100050FD0) + 48);
      uint64_t v5 = v7;
      uint64_t v4 = v8;
      goto LABEL_4;
    case 1:
    case 2:
    case 3:
      uint64_t v3 = sub_100044AA0();
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      uint64_t v5 = v3;
      uint64_t v6 = a1;
LABEL_4:
      uint64_t result = v4(v6, v5);
      break;
    default:
      return result;
  }
  return result;
}

char *sub_1000196F8(char *a1, char *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v6 = sub_100044850();
      uint64_t v7 = *(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16);
      v7(a1, a2, v6);
      uint64_t v8 = sub_100006080(&qword_100050FD0);
      v7(&a1[*(int *)(v8 + 48)], &a2[*(int *)(v8 + 48)], v6);
      goto LABEL_5;
    case 1u:
    case 2u:
    case 3u:
      uint64_t v9 = sub_100044AA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
LABEL_5:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

char *sub_1000198FC(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1000136E0((uint64_t)a1, type metadata accessor for ModelUpdateStep);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v6 = sub_100044850();
        uint64_t v7 = *(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16);
        v7(a1, a2, v6);
        uint64_t v8 = sub_100006080(&qword_100050FD0);
        v7(&a1[*(int *)(v8 + 48)], &a2[*(int *)(v8 + 48)], v6);
        goto LABEL_6;
      case 1u:
      case 2u:
      case 3u:
        uint64_t v9 = sub_100044AA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
LABEL_6:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

char *sub_100019B24(char *a1, char *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v6 = sub_100044850();
      uint64_t v7 = *(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32);
      v7(a1, a2, v6);
      uint64_t v8 = sub_100006080(&qword_100050FD0);
      v7(&a1[*(int *)(v8 + 48)], &a2[*(int *)(v8 + 48)], v6);
      goto LABEL_5;
    case 1u:
    case 2u:
    case 3u:
      uint64_t v9 = sub_100044AA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
LABEL_5:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

char *sub_100019D28(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1000136E0((uint64_t)a1, type metadata accessor for ModelUpdateStep);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v6 = sub_100044850();
        uint64_t v7 = *(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32);
        v7(a1, a2, v6);
        uint64_t v8 = sub_100006080(&qword_100050FD0);
        v7(&a1[*(int *)(v8 + 48)], &a2[*(int *)(v8 + 48)], v6);
        goto LABEL_6;
      case 1u:
      case 2u:
      case 3u:
        uint64_t v9 = sub_100044AA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
LABEL_6:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_100019F50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100019F78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100019FA8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_100019FB8()
{
  uint64_t result = sub_100044850();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v3[4] = v3;
    uint64_t result = sub_100044AA0();
    if (v2 <= 0x3F)
    {
      uint64_t v4 = *(void *)(result - 8) + 64;
      uint64_t v5 = v4;
      uint64_t v6 = v4;
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_10001A090(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_100044540();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10001A160(uint64_t a1)
{
  uint64_t v2 = sub_100044540();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10001A1D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_10001A254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001A2E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10001A35C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001A3E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001A3F4);
}

uint64_t sub_10001A3F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
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

uint64_t sub_10001A4B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001A4C8);
}

uint64_t sub_10001A4C8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100044540();
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

uint64_t sub_10001A584()
{
  uint64_t result = sub_100044540();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_10001A61C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100044510();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_100006080(&qword_100051090);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = a3[5];
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_100044540();
    uint64_t v34 = *(void (**)(char *, char *))(*(void *)(v14 - 8) + 16);
    uint64_t v35 = v14;
    v34(v12, v13);
    uint64_t v15 = a3[7];
    *(uint64_t *)((char *)a1 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    *(uint64_t *)((char *)a1 + v15) = *(uint64_t *)((char *)a2 + v15);
    uint64_t v16 = a3[8];
    uint64_t v17 = (uint64_t *)((char *)a1 + v16);
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = *(uint64_t *)((char *)a2 + v16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v19)
    {
      uint64_t v20 = *((void *)v18 + 1);
      *uint64_t v17 = v19;
      v17[1] = v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
    }
    uint64_t v21 = a3[10];
    *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    uint64_t v22 = (char *)a1 + v21;
    uint64_t v23 = (char *)a2 + v21;
    uint64_t v24 = type metadata accessor for UniversalSuggestionsPromptState(0);
    uint64_t v25 = *(void *)(v24 - 8);
    unsigned int v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
    swift_bridgeObjectRetain();
    if (v26(v23, 1, v24))
    {
      uint64_t v27 = sub_100006080(&qword_100051088);
      memcpy(v22, v23, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      ((void (*)(char *, char *, uint64_t))v34)(v22, v23, v35);
      *(void *)&v22[*(int *)(v24 + 20)] = *(void *)&v23[*(int *)(v24 + 20)];
      uint64_t v28 = *(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56);
      swift_bridgeObjectRetain();
      v28(v22, 0, 1, v24);
    }
    uint64_t v29 = a3[11];
    uint64_t v30 = a3[12];
    uint64_t v31 = (char *)a1 + v29;
    uint64_t v32 = (char *)a2 + v29;
    *(_DWORD *)uint64_t v31 = *(_DWORD *)v32;
    v31[4] = v32[4];
    *(uint64_t *)((char *)a1 + v30) = *(uint64_t *)((char *)a2 + v30);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10001A964(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_100044510();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  uint64_t v6 = a1 + a2[5];
  uint64_t v7 = sub_100044540();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + a2[8]))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = a1 + a2[10];
  uint64_t v10 = type metadata accessor for UniversalSuggestionsPromptState(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v9, 1, v10))
  {
    v8(v9, v7);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

char *sub_10001AB30(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100044510();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100006080(&qword_100051090);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_100044540();
  uint64_t v32 = *(void (**)(char *, char *))(*(void *)(v12 - 8) + 16);
  uint64_t v33 = v12;
  v32(v10, v11);
  uint64_t v13 = a3[7];
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  *(void *)&a1[v13] = *(void *)&a2[v13];
  uint64_t v14 = a3[8];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = *(void *)&a2[v14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v17)
  {
    uint64_t v18 = *((void *)v16 + 1);
    *(void *)uint64_t v15 = v17;
    *((void *)v15 + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  }
  uint64_t v19 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v22 = type metadata accessor for UniversalSuggestionsPromptState(0);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
  swift_bridgeObjectRetain();
  if (v24(v21, 1, v22))
  {
    uint64_t v25 = sub_100006080(&qword_100051088);
    memcpy(v20, v21, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    ((void (*)(char *, char *, uint64_t))v32)(v20, v21, v33);
    *(void *)&v20[*(int *)(v22 + 20)] = *(void *)&v21[*(int *)(v22 + 20)];
    unsigned int v26 = *(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56);
    swift_bridgeObjectRetain();
    v26(v20, 0, 1, v22);
  }
  uint64_t v27 = a3[11];
  uint64_t v28 = a3[12];
  uint64_t v29 = &a1[v27];
  uint64_t v30 = &a2[v27];
  *(_DWORD *)uint64_t v29 = *(_DWORD *)v30;
  v29[4] = v30[4];
  *(void *)&a1[v28] = *(void *)&a2[v28];
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_10001AE28(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100044510();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = sub_100006080(&qword_100051090);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = a3[5];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_100044540();
  uint64_t v36 = *(void *)(v15 - 8);
  uint64_t v37 = v15;
  uint64_t v35 = *(void (**)(char *, char *))(v36 + 24);
  v35(v13, v14);
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v19 = *(void *)&a2[v16];
  if (*(void *)&a1[v16])
  {
    if (v19)
    {
      *(void *)uint64_t v17 = v19;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)v17 + 1) = *((void *)v18 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    sub_10001B298((uint64_t)&a1[v16]);
  }
  else if (v19)
  {
    *(void *)uint64_t v17 = v19;
    *((void *)v17 + 1) = *((void *)v18 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_14;
  }
  *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
LABEL_14:
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[10];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  uint64_t v23 = type metadata accessor for UniversalSuggestionsPromptState(0);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  int v26 = v25(v21, 1, v23);
  int v27 = v25(v22, 1, v23);
  if (!v26)
  {
    if (!v27)
    {
      ((void (*)(char *, char *, uint64_t))v35)(v21, v22, v37);
      *(void *)&v21[*(int *)(v23 + 20)] = *(void *)&v22[*(int *)(v23 + 20)];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    sub_1000136E0((uint64_t)v21, type metadata accessor for UniversalSuggestionsPromptState);
    goto LABEL_19;
  }
  if (v27)
  {
LABEL_19:
    uint64_t v29 = sub_100006080(&qword_100051088);
    memcpy(v21, v22, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v21, v22, v37);
  *(void *)&v21[*(int *)(v23 + 20)] = *(void *)&v22[*(int *)(v23 + 20)];
  uint64_t v28 = *(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56);
  swift_bridgeObjectRetain();
  v28(v21, 0, 1, v23);
LABEL_20:
  uint64_t v30 = a3[11];
  uint64_t v31 = &a1[v30];
  uint64_t v32 = &a2[v30];
  int v33 = *(_DWORD *)v32;
  v31[4] = v32[4];
  *(_DWORD *)uint64_t v31 = v33;
  *(void *)&a1[a3[12]] = *(void *)&a2[a3[12]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001B298(uint64_t a1)
{
  return a1;
}

char *sub_10001B2CC(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100044510();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100006080(&qword_100051090);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = a3[5];
  int v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_100044540();
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32);
  v13(v10, v11, v12);
  uint64_t v14 = a3[7];
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  *(void *)&a1[v14] = *(void *)&a2[v14];
  uint64_t v15 = a3[9];
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  *(void *)&a1[v15] = *(void *)&a2[v15];
  uint64_t v16 = a3[10];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v19 = type metadata accessor for UniversalSuggestionsPromptState(0);
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    uint64_t v21 = sub_100006080(&qword_100051088);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    v13(v17, v18, v12);
    *(void *)&v17[*(int *)(v19 + 20)] = *(void *)&v18[*(int *)(v19 + 20)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  uint64_t v22 = a3[11];
  uint64_t v23 = a3[12];
  uint64_t v24 = &a1[v22];
  uint64_t v25 = &a2[v22];
  *(_DWORD *)uint64_t v24 = *(_DWORD *)v25;
  v24[4] = v25[4];
  *(void *)&a1[v23] = *(void *)&a2[v23];
  return a1;
}

char *sub_10001B56C(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100044510();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = sub_100006080(&qword_100051090);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = a3[5];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_100044540();
  uint64_t v34 = *(void *)(v15 - 8);
  uint64_t v35 = v15;
  int v33 = *(void (**)(char *, char *))(v34 + 40);
  v33(v13, v14);
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  if (*(void *)&a1[v16])
  {
    if (*(void *)v18)
    {
      *(void *)uint64_t v17 = *(void *)v18;
      swift_bridgeObjectRelease();
      *((void *)v17 + 1) = *((void *)v18 + 1);
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    sub_10001B298((uint64_t)v17);
  }
  *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
LABEL_12:
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[10];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v22 = type metadata accessor for UniversalSuggestionsPromptState(0);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  int v25 = v24(v20, 1, v22);
  int v26 = v24(v21, 1, v22);
  if (!v25)
  {
    if (!v26)
    {
      ((void (*)(char *, char *, uint64_t))v33)(v20, v21, v35);
      *(void *)&v20[*(int *)(v22 + 20)] = *(void *)&v21[*(int *)(v22 + 20)];
      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
    sub_1000136E0((uint64_t)v20, type metadata accessor for UniversalSuggestionsPromptState);
    goto LABEL_17;
  }
  if (v26)
  {
LABEL_17:
    uint64_t v27 = sub_100006080(&qword_100051088);
    memcpy(v20, v21, *(void *)(*(void *)(v27 - 8) + 64));
    goto LABEL_18;
  }
  (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v20, v21, v35);
  *(void *)&v20[*(int *)(v22 + 20)] = *(void *)&v21[*(int *)(v22 + 20)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
LABEL_18:
  uint64_t v28 = a3[11];
  uint64_t v29 = a3[12];
  uint64_t v30 = &a1[v28];
  uint64_t v31 = &a2[v28];
  *(_DWORD *)uint64_t v30 = *(_DWORD *)v31;
  v30[4] = v31[4];
  *(void *)&a1[v29] = *(void *)&a2[v29];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001B97C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001B990);
}

uint64_t sub_10001B990(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100006080(&qword_100051090);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100044540();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + a3[5];
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v14 = *(void *)(a1 + a3[6]);
    if (v14 >= 0xFFFFFFFF) {
      LODWORD(v14) = -1;
    }
    return (v14 + 1);
  }
  else
  {
    uint64_t v15 = sub_100006080(&qword_100051088);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[10];
    return v16(v18, a2, v17);
  }
}

uint64_t sub_10001BB18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001BB2C);
}

uint64_t sub_10001BB2C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_100006080(&qword_100051090);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = sub_100044540();
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + a4[5];
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6]) = (a2 - 1);
  }
  else
  {
    uint64_t v15 = sub_100006080(&qword_100051088);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a4[10];
    return v16(v18, a2, a2, v17);
  }
  return result;
}

void sub_10001BCB4()
{
  sub_10001BE20(319, &qword_100051358, (void (*)(uint64_t))&type metadata accessor for Date);
  if (v0 <= 0x3F)
  {
    sub_100044540();
    if (v1 <= 0x3F)
    {
      sub_10001BE20(319, (unint64_t *)&unk_100051360, (void (*)(uint64_t))type metadata accessor for UniversalSuggestionsPromptState);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_10001BE20(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_100044F90();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_10001BE74(uint64_t a1)
{
  return sub_10001BEBC(a1, qword_100052920);
}

uint64_t sub_10001BE98(uint64_t a1)
{
  return sub_10001BEBC(a1, qword_100052938);
}

uint64_t sub_10001BEBC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100044D60();
  sub_100013740(v3, a2);
  sub_1000136A8(v3, (uint64_t)a2);
  return sub_100044D50();
}

uint64_t sub_10001BF34()
{
  uint64_t v0 = sub_100044D60();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100044CE0();
  sub_100013740(v4, qword_100052950);
  sub_1000136A8(v4, (uint64_t)qword_100052950);
  if (qword_100050C70 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1000136A8(v0, (uint64_t)qword_100052938);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_100044CC0();
}

uint64_t sub_10001C070(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  uint64_t v3 = type metadata accessor for UniversalEntityRemover.CandidateStoreIdAssistantIdPair();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  return _swift_task_switch(sub_10001C14C, 0, 0);
}

uint64_t sub_10001C14C()
{
  sub_100005E74((void *)(*(void *)(v0 + 64) + 16), *(void *)(*(void *)(v0 + 64) + 40));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10001C1F4;
  return sub_1000205B8(v0 + 16);
}

uint64_t sub_10001C1F4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001C2F0, 0, 0);
}

uint64_t sub_10001C2F0()
{
  int v50 = v0;
  uint64_t v48 = v0 + 2;
  uint64_t v1 = (void *)v0[7];
  uint64_t v2 = v0[8];
  sub_100005E74(v1, v1[3]);
  uint64_t v3 = sub_1000449C0();
  swift_retain();
  uint64_t v4 = sub_10001C9B4(v3, v2);
  swift_release();
  swift_bridgeObjectRelease();
  id v47 = v4[2];
  if (v47)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v0[10];
    uint64_t v44 = v0[9];
    uint64_t v45 = *(void *)(v6 + 72);
    uint64_t v46 = (char *)v4 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    while (1)
    {
      uint64_t v9 = v0[13];
      sub_10001D3C8((uint64_t)&v46[v5 * v45], v9);
      uint64_t v10 = *(void *)(*sub_100005E74(v48, v0[5])
                      + OBJC_IVAR____TtC50SiriUserFeedbackLearningUniversalSuggestionsPlugin9HomeStore_entityIds);
      if (!v10 || !*(void *)(v10 + 16)) {
        goto LABEL_22;
      }
      uint64_t v11 = (uint64_t *)(v9 + *(int *)(v44 + 20));
      uint64_t v13 = *v11;
      uint64_t v12 = v11[1];
      sub_100045150();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_100044E00();
      Swift::Int v14 = sub_100045180();
      uint64_t v15 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v16 = v14 & ~v15;
      if (((*(void *)(v10 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16) & 1) == 0) {
        goto LABEL_21;
      }
      uint64_t v17 = *(void *)(v10 + 48);
      uint64_t v18 = (void *)(v17 + 16 * v16);
      BOOL v19 = *v18 == v13 && v18[1] == v12;
      if (!v19 && (sub_100045110() & 1) == 0) {
        break;
      }
LABEL_3:
      uint64_t v7 = v0[13];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v8 = v7;
LABEL_4:
      sub_10001D42C(v8);
      if ((id)++v5 == v47) {
        goto LABEL_32;
      }
    }
    uint64_t v20 = ~v15;
    while (1)
    {
      unint64_t v16 = (v16 + 1) & v20;
      if (((*(void *)(v10 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16) & 1) == 0) {
        break;
      }
      uint64_t v21 = (void *)(v17 + 16 * v16);
      BOOL v22 = *v21 == v13 && v21[1] == v12;
      if (v22 || (sub_100045110() & 1) != 0) {
        goto LABEL_3;
      }
    }
LABEL_21:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_22:
    if (qword_100050C80 != -1) {
      swift_once();
    }
    uint64_t v24 = v0[12];
    uint64_t v23 = v0[13];
    uint64_t v25 = sub_100044D60();
    sub_1000136A8(v25, (uint64_t)qword_1000513B0);
    sub_10001D3C8(v23, v24);
    int v26 = sub_100044D40();
    os_log_type_t v27 = sub_100044F30();
    BOOL v28 = os_log_type_enabled(v26, v27);
    uint64_t v29 = v0[12];
    if (v28)
    {
      uint64_t v30 = swift_slowAlloc();
      v49[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 136315138;
      sub_100044540();
      sub_10001D488();
      uint64_t v31 = sub_1000450F0();
      *(void *)(v30 + 4) = sub_1000434C0(v31, v32, v49);
      swift_bridgeObjectRelease();
      sub_10001D42C(v29);
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Entity corresponding to candidate %s does not exist, deleting candidate from store", (uint8_t *)v30, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_10001D42C(v0[12]);
    }

    sub_100005E74((void *)v0[7], v1[3]);
    char v33 = sub_1000449E0();
    uint64_t v8 = v0[13];
    if ((v33 & 1) == 0)
    {
      sub_10001D3C8(v8, v0[11]);
      uint64_t v34 = sub_100044D40();
      os_log_type_t v35 = sub_100044F40();
      BOOL v36 = os_log_type_enabled(v34, v35);
      uint64_t v37 = v0[13];
      uint64_t v38 = v0[11];
      if (v36)
      {
        uint64_t v39 = swift_slowAlloc();
        v49[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v39 = 136315138;
        sub_100044540();
        sub_10001D488();
        uint64_t v40 = sub_1000450F0();
        *(void *)(v39 + 4) = sub_1000434C0(v40, v41, v49);
        swift_bridgeObjectRelease();
        sub_10001D42C(v38);
        _os_log_impl((void *)&_mh_execute_header, v34, v35, "Unable to delete candidate %s from store", (uint8_t *)v39, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        sub_10001D42C(v38);
      }
      uint64_t v8 = v37;
    }
    goto LABEL_4;
  }
LABEL_32:
  swift_bridgeObjectRelease();
  sub_100006030((uint64_t)v48);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v42 = (uint64_t (*)(void))v0[1];
  return v42();
}

uint64_t sub_10001C844()
{
  sub_100006030(v0 + 16);
  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for UniversalEntityRemover()
{
  return self;
}

uint64_t type metadata accessor for UniversalEntityRemover.CandidateStoreIdAssistantIdPair()
{
  uint64_t result = qword_1000514E8;
  if (!qword_1000514E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001C8EC()
{
  uint64_t v0 = sub_100044D60();
  sub_100013740(v0, qword_1000513B0);
  uint64_t v1 = sub_1000136A8(v0, (uint64_t)qword_1000513B0);
  if (qword_100050C68 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000136A8(v0, (uint64_t)qword_100052920);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

id *sub_10001C9B4(uint64_t a1, uint64_t a2)
{
  uint64_t v80 = a2;
  uint64_t v87 = sub_100044540();
  uint64_t v3 = *(void *)(v87 - 8);
  __chkstk_darwin(v87);
  uint64_t v86 = (char *)v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = sub_1000448B0();
  uint64_t v5 = *(void *)(v105 - 8);
  __chkstk_darwin(v105);
  uint64_t v104 = (char *)v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100044850();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100006080(&qword_100051488);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = type metadata accessor for UniversalEntityRemover.CandidateStoreIdAssistantIdPair();
  uint64_t v14 = *(void *)(v107 - 8);
  uint64_t v15 = __chkstk_darwin(v107);
  uint64_t v99 = (uint64_t)v73 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v89 = (uint64_t)v73 - v17;
  uint64_t v77 = *(void *)(a1 + 16);
  if (!v77) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v18 = *(void *)(sub_1000448F0() - 8);
  uint64_t v76 = a1 + ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80));
  uint64_t v102 = (uint64_t (**)(char *, uint64_t))(v8 + 88);
  int v101 = enum case for UniversalEntity.homeAutomationEntity(_:);
  uint64_t v96 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
  uint64_t v97 = (void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v95 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v85 = (void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v100 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  uint64_t v94 = (void (**)(char *, uint64_t))(v8 + 96);
  uint64_t v82 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
  uint64_t v75 = *(void *)(v18 + 72);
  v73[0] = a1;
  swift_bridgeObjectRetain();
  uint64_t v19 = 0;
  *(void *)&long long v20 = 136315138;
  long long v84 = v20;
  uint64_t v83 = (char *)&type metadata for Any + 8;
  int v81 = _swiftEmptyArrayStorage;
  uint64_t v88 = v7;
  uint64_t v98 = v10;
  uint64_t v103 = v13;
  uint64_t v74 = v5;
  uint64_t v90 = v14;
  while (1)
  {
    uint64_t v21 = sub_1000448E0();
    uint64_t v22 = *(void *)(v21 + 16);
    if (v22)
    {
      uint64_t v79 = v19;
      unint64_t v23 = (*(unsigned __int8 *)(v74 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v74 + 80);
      uint64_t v78 = v21;
      unint64_t v24 = v21 + v23;
      uint64_t v106 = *(void *)(v74 + 72);
      swift_retain();
      uint64_t v25 = _swiftEmptyArrayStorage;
      while (1)
      {
        sub_100044890();
        int v27 = (*v102)(v10, v7);
        if (v27 == v101)
        {
          BOOL v28 = v25;
          (*v94)(v10, v7);
          uint64_t v29 = sub_10002BDB8();
          if (v30)
          {
            uint64_t v31 = v29;
            uint64_t v32 = v30;
            uint64_t v33 = (uint64_t)v103;
            sub_1000448A0();
            swift_release();
            uint64_t v34 = (uint64_t *)(v33 + *(int *)(v107 + 20));
            *uint64_t v34 = v31;
            v34[1] = v32;
            uint64_t v26 = v33;
            ((void (*)(uint64_t, void, uint64_t))*v100)(v33, 0, 1);
            uint64_t v10 = v98;
            uint64_t v25 = v28;
LABEL_19:
            uint64_t v54 = v89;
            sub_10001D540(v26, v89);
            sub_10001D540(v54, v99);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v25 = (id *)sub_10004338C(0, (int64_t)v25[2] + 1, 1, (unint64_t)v25);
            }
            unint64_t v56 = (unint64_t)v25[2];
            unint64_t v55 = (unint64_t)v25[3];
            if (v56 >= v55 >> 1) {
              uint64_t v25 = (id *)sub_10004338C(v55 > 1, v56 + 1, 1, (unint64_t)v25);
            }
            void v25[2] = (id)(v56 + 1);
            sub_10001D540(v99, (uint64_t)v25+ ((*(unsigned __int8 *)(v90 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v90 + 80))+ *(void *)(v90 + 72) * v56);
            goto LABEL_10;
          }
          uint64_t v26 = (uint64_t)v103;
          uint64_t v52 = v107;
          (*v100)(v103, 1, 1, v107);
          swift_release();
          int v53 = (*v82)(v26, 1, v52);
          uint64_t v10 = v98;
          uint64_t v25 = v28;
          if (v53 != 1) {
            goto LABEL_19;
          }
        }
        else
        {
          (*v97)(v10, v7);
          if (qword_100050C80 != -1) {
            swift_once();
          }
          uint64_t v35 = sub_100044D60();
          sub_1000136A8(v35, (uint64_t)qword_1000513B0);
          (*v96)(v104, v24, v105);
          BOOL v36 = sub_100044D40();
          os_log_type_t v37 = sub_100044F40();
          if (os_log_type_enabled(v36, v37))
          {
            uint64_t v38 = (_DWORD *)swift_slowAlloc();
            uint64_t v91 = v38;
            uint64_t v93 = swift_slowAlloc();
            uint64_t v108 = v93;
            *uint64_t v38 = v84;
            os_log_t v92 = v36;
            uint64_t v39 = v86;
            uint64_t v40 = v104;
            sub_1000448A0();
            sub_10001D488();
            unint64_t v41 = v25;
            uint64_t v42 = v87;
            uint64_t v43 = sub_1000450F0();
            unint64_t v45 = v44;
            uint64_t v46 = v39;
            uint64_t v47 = v42;
            uint64_t v25 = v41;
            uint64_t v48 = v105;
            uint64_t v49 = v40;
            uint64_t v10 = v98;
            (*v85)(v46, v47);
            uint64_t v50 = sub_1000434C0(v43, v45, &v108);
            uint64_t v51 = (uint8_t *)v91;
            *(void *)(v91 + 1) = v50;
            uint64_t v7 = v88;
            swift_bridgeObjectRelease();
            (*v95)(v49, v48);
            BOOL v36 = v92;
            _os_log_impl((void *)&_mh_execute_header, v92, v37, "candidate is not a home automation candidate: %s", v51, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            (*v95)(v104, v105);
          }

          uint64_t v26 = (uint64_t)v103;
          (*v100)(v103, 1, 1, v107);
        }
        sub_10001D4E0(v26);
LABEL_10:
        v24 += v106;
        if (!--v22)
        {
          swift_bridgeObjectRelease();
          swift_release();
          uint64_t v14 = v90;
          uint64_t v19 = v79;
          goto LABEL_26;
        }
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v25 = _swiftEmptyArrayStorage;
LABEL_26:
    int64_t v57 = (int64_t)v25[2];
    id v58 = v81[2];
    int64_t v59 = (int64_t)v58 + v57;
    if (__OFADD__(v58, v57)) {
      break;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v61 = v81;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0 || v59 > (uint64_t)((unint64_t)v81[3] >> 1))
    {
      if ((uint64_t)v58 <= v59) {
        int64_t v62 = (int64_t)v58 + v57;
      }
      else {
        int64_t v62 = (int64_t)v58;
      }
      uint64_t v61 = (id *)sub_10004338C(isUniquelyReferenced_nonNull_native, v62, 1, (unint64_t)v81);
    }
    uint64_t v7 = v88;
    id v63 = v25[2];
    int v81 = v61;
    if (v63)
    {
      id v64 = v61[2];
      if ((uint64_t)(((unint64_t)v61[3] >> 1) - (void)v64) < v57) {
        goto LABEL_47;
      }
      unint64_t v65 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
      uint64_t v66 = *(void *)(v14 + 72);
      uint64_t v67 = (char *)v61 + v65 + v66 * (void)v64;
      if ((char *)v25 + v65 < &v67[v66 * v57] && v67 < (char *)v25 + v65 + v66 * v57) {
        goto LABEL_49;
      }
      swift_arrayInitWithCopy();
      if (v57)
      {
        uint64_t v69 = (char *)v81[2];
        BOOL v70 = __OFADD__(v69, v57);
        uint64_t v71 = &v69[v57];
        if (v70) {
          goto LABEL_48;
        }
        v81[2] = v71;
      }
    }
    else if (v57)
    {
      goto LABEL_46;
    }
    ++v19;
    swift_bridgeObjectRelease();
    if (v19 == v77)
    {
      swift_bridgeObjectRelease();
      return v81;
    }
  }
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  swift_release();
  uint64_t result = (id *)sub_1000450D0();
  __break(1u);
  return result;
}

uint64_t sub_10001D3C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UniversalEntityRemover.CandidateStoreIdAssistantIdPair();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001D42C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UniversalEntityRemover.CandidateStoreIdAssistantIdPair();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10001D488()
{
  unint64_t result = qword_100050FE8;
  if (!qword_100050FE8)
  {
    sub_100044540();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100050FE8);
  }
  return result;
}

uint64_t sub_10001D4E0(uint64_t a1)
{
  uint64_t v2 = sub_100006080(&qword_100051488);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001D540(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UniversalEntityRemover.CandidateStoreIdAssistantIdPair();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *sub_10001D5A4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100044540();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    void *v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10001D67C(uint64_t a1)
{
  uint64_t v2 = sub_100044540();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10001D6F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  void *v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_10001D77C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001D818(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10001D894(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  void *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001D920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001D934);
}

uint64_t sub_10001D934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10001D9F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001DA0C);
}

uint64_t sub_10001DA0C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100044540();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_10001DACC()
{
  uint64_t result = sub_100044540();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for SiriUserFeedbackLearningUniversalSuggestionsPlugin()
{
  uint64_t result = qword_100051570;
  if (!qword_100051570) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001DBAC()
{
  return swift_initClassMetadata2();
}

id sub_10001DC14()
{
  sub_1000446F0();
  swift_allocObject();
  uint64_t v0 = sub_1000446E0();
  uint64_t v7 = &type metadata for HomeStoreFactory;
  uint64_t v8 = &off_10004D418;
  type metadata accessor for UniversalEntityRemover();
  uint64_t v1 = swift_allocObject();
  uint64_t v2 = sub_10001FB18((uint64_t)v6, (uint64_t)&type metadata for HomeStoreFactory);
  __chkstk_darwin(v2);
  (*(void (**)(void))(v3 + 16))();
  *(void *)(v1 + 40) = &type metadata for HomeStoreFactory;
  *(void *)(v1 + 48) = &off_10004D418;
  sub_100006030((uint64_t)v6);
  id v4 = sub_10001FDBC(v0, v1);
  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

id sub_10001DD6C()
{
  return sub_10001DC14();
}

uint64_t sub_10001DD90(uint64_t a1, uint64_t a2)
{
  id v4 = v2;
  v4[2] = a1;
  uint64_t v6 = sub_100044CB0();
  v4[3] = v6;
  v4[4] = *(void *)(v6 - 8);
  v4[5] = swift_task_alloc();
  uint64_t v7 = sub_1000446A0();
  v4[6] = v7;
  v4[7] = *(void *)(v7 - 8);
  v4[8] = swift_task_alloc();
  uint64_t v8 = (void *)swift_task_alloc();
  v4[9] = v8;
  void *v8 = v4;
  v8[1] = sub_10001DEF8;
  return sub_10001E18C(a1, a2);
}

uint64_t sub_10001DEF8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001DFF4, 0, 0);
}

uint64_t sub_10001DFF4()
{
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[6];
  sub_1000446C0();
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  uint64_t v5 = v0[7];
  uint64_t v6 = v0[6];
  if (v4 == enum case for SiriUserFeedbackLearningTaskResult.Status.failure(_:))
  {
    (*(void (**)(void, uint64_t))(v5 + 96))(v0[8], v6);
    swift_bridgeObjectRelease();
    uint64_t v7 = qword_100050C78;
    uint64_t v8 = "runUniversalSuggestionsPluginFailure";
  }
  else
  {
    (*(void (**)(void, uint64_t))(v5 + 8))(v0[8], v6);
    uint64_t v7 = qword_100050C78;
    uint64_t v8 = "runUniversalSuggestionsPluginSuccess";
  }
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v10 = v0[4];
  uint64_t v9 = v0[5];
  uint64_t v11 = v0[3];
  uint64_t v12 = sub_100044CE0();
  sub_1000136A8(v12, (uint64_t)qword_100052950);
  sub_100044CD0();
  sub_100044C90();
  sub_100037E64(v8, 36, 2, v9);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_10001E18C(uint64_t a1, uint64_t a2)
{
  v3[82] = v2;
  v3[81] = a2;
  v3[80] = a1;
  uint64_t v4 = sub_100044CF0();
  v3[83] = v4;
  v3[84] = *(void *)(v4 - 8);
  v3[85] = swift_task_alloc();
  v3[86] = swift_task_alloc();
  v3[87] = swift_task_alloc();
  uint64_t v5 = sub_1000446A0();
  v3[88] = v5;
  v3[89] = *(void *)(v5 - 8);
  v3[90] = swift_task_alloc();
  uint64_t v6 = sub_100044CB0();
  v3[91] = v6;
  v3[92] = *(void *)(v6 - 8);
  v3[93] = swift_task_alloc();
  v3[94] = swift_task_alloc();
  v3[95] = swift_task_alloc();
  v3[96] = swift_task_alloc();
  uint64_t v7 = sub_100044700();
  v3[97] = v7;
  v3[98] = *(void *)(v7 - 8);
  v3[99] = swift_task_alloc();
  uint64_t v8 = sub_100044D60();
  v3[100] = v8;
  v3[101] = *(void *)(v8 - 8);
  v3[102] = swift_task_alloc();
  return _swift_task_switch(sub_10001E408, 0, 0);
}

uint64_t sub_10001E408()
{
  uint64_t v63 = v0;
  if (qword_100050C88 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 816);
  uint64_t v2 = *(void *)(v0 + 808);
  uint64_t v3 = *(void *)(v0 + 800);
  uint64_t v4 = *(void *)(v0 + 792);
  uint64_t v5 = *(void *)(v0 + 784);
  uint64_t v6 = *(void *)(v0 + 776);
  uint64_t v7 = *(void *)(v0 + 648);
  uint64_t v8 = sub_1000136A8(v3, (uint64_t)qword_100051520);
  *(void *)(v0 + 824) = v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v8, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  uint64_t v9 = sub_100044D40();
  os_log_type_t v10 = sub_100044F30();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v12 = *(void *)(v0 + 816);
  uint64_t v13 = *(void *)(v0 + 808);
  uint64_t v14 = *(void *)(v0 + 800);
  uint64_t v15 = *(void *)(v0 + 792);
  uint64_t v16 = *(void *)(v0 + 784);
  uint64_t v17 = *(void *)(v0 + 776);
  if (v11)
  {
    uint64_t v61 = *(void *)(v0 + 816);
    uint64_t v18 = swift_slowAlloc();
    uint64_t v62 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315394;
    *(void *)(v0 + 624) = sub_1000434C0(0x72656E6E496E7572, 0xEC000000293A5F28, &v62);
    sub_100044FA0();
    *(_WORD *)(v18 + 12) = 2080;
    sub_100020560();
    uint64_t v19 = sub_1000450F0();
    *(void *)(v0 + 632) = sub_1000434C0(v19, v20, &v62);
    sub_100044FA0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "SiriUserFeedbackLearningUniversalSuggestionsPlugin.%s task:%s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v61, v14);
  }
  else
  {
    (*(void (**)(void, void))(v16 + 8))(*(void *)(v0 + 792), *(void *)(v0 + 776));

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  uint64_t v21 = (void *)(*(void *)(v0 + 656) + qword_100051538);
  sub_100005E74(v21, v21[3]);
  sub_100044790();
  sub_100005E74(v21, v21[3]);
  uint64_t v22 = sub_1000446D0();
  *(void *)(v0 + 520) = sub_100044710();
  *(void *)(v0 + 528) = &protocol witness table for AnyFeature;
  *(void *)(v0 + 496) = v22;
  char v23 = sub_1000447A0();
  sub_100006030(v0 + 496);
  if (v23)
  {
    if (qword_100050C78 != -1) {
      swift_once();
    }
    uint64_t v24 = *(void *)(v0 + 768);
    uint64_t v25 = *(void *)(v0 + 736);
    uint64_t v26 = *(void *)(v0 + 728);
    uint64_t v27 = *(void *)(v0 + 656);
    uint64_t v28 = sub_100044CE0();
    *(void *)(v0 + 832) = sub_1000136A8(v28, (uint64_t)qword_100052950);
    sub_100044CD0();
    sub_100044C90();
    *(void *)(v0 + 840) = sub_100038128("runUniversalSuggestionsPlugin", 29, 2, v24);
    uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
    *(void *)(v0 + 848) = v29;
    *(void *)(v0 + 856) = (v25 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v29(v24, v26);
    sub_100020084(v27 + qword_100051540, v0 + 256);
    if (*(void *)(v0 + 280))
    {
      uint64_t v30 = *(void *)(v0 + 656);
      sub_100013CF0((long long *)(v0 + 256), v0 + 336);
      sub_100013D44(v0 + 336, v0 + 296);
      sub_1000200EC(v30 + qword_100051548, v0 + 208);
      sub_100013D44(v30 + qword_100051550, v0 + 376);
      sub_100013D44(v30 + qword_100051558, v0 + 416);
      sub_100013D44(v30 + qword_100051560, v0 + 456);
      type metadata accessor for SiriUserFeedbackLearningUniversalSuggestionsEngine();
      uint64_t inited = swift_initStackObject();
      *(void *)(v0 + 864) = inited;
      sub_100013D44(v0 + 296, inited + 16);
      sub_1000200EC(v0 + 208, inited + 56);
      sub_100013D44(v0 + 376, inited + 104);
      sub_100013D44(v0 + 416, inited + 144);
      sub_100013D44(v0 + 456, v0 + 536);
      sub_100044BE0();
      swift_allocObject();
      uint64_t v32 = sub_100044BD0();
      sub_100006030(v0 + 456);
      sub_100006030(v0 + 416);
      sub_100006030(v0 + 376);
      sub_100006030(v0 + 208);
      sub_100006030(v0 + 296);
      *(void *)(inited + 184) = v32;
      uint64_t v33 = sub_100044D40();
      os_log_type_t v34 = sub_100044F30();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v35 = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "About to start executing Universal Suggestions engine...", v35, 2u);
        swift_slowDealloc();
      }

      BOOL v36 = (void *)swift_task_alloc();
      *(void *)(v0 + 872) = v36;
      *BOOL v36 = v0;
      v36[1] = sub_10001ED90;
      return sub_1000066B4();
    }
    unint64_t v45 = *(void **)(v0 + 720);
    uint64_t v46 = *(void *)(v0 + 712);
    uint64_t v47 = *(void *)(v0 + 704);
    sub_100020150(v0 + 256);
    void *v45 = 0xD000000000000030;
    v45[1] = 0x8000000100046DD0;
    (*(void (**)(void *, void, uint64_t))(v46 + 104))(v45, enum case for SiriUserFeedbackLearningTaskResult.Status.failure(_:), v47);
    sub_1000446B0();
    uint64_t v48 = sub_100044CD0();
    sub_100044D00();
    os_signpost_type_t v49 = sub_100044F50();
    if (sub_100044F80())
    {
      uint64_t v50 = *(void *)(v0 + 688);
      uint64_t v51 = *(void *)(v0 + 672);
      uint64_t v52 = *(void *)(v0 + 664);
      swift_retain();
      sub_100044D30();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v51 + 88))(v50, v52) == enum case for OSSignpostError.doubleEnd(_:))
      {
        int v53 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 672) + 8))(*(void *)(v0 + 688), *(void *)(v0 + 664));
        int v53 = "";
      }
      uint64_t v56 = *(void *)(v0 + 768);
      uint64_t v57 = *(void *)(v0 + 752);
      uint64_t v58 = *(void *)(v0 + 728);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 736) + 16))(v56, v57, v58);
      int64_t v59 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v59 = 0;
      os_signpost_id_t v60 = sub_100044CA0();
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, v49, v60, "runUniversalSuggestionsPlugin", v53, v59, 2u);
      swift_slowDealloc();

      v29(v57, v58);
      v29(v56, v58);
      swift_release();
    }
    else
    {
      uint64_t v54 = *(void *)(v0 + 752);
      uint64_t v55 = *(void *)(v0 + 728);

      v29(v54, v55);
      swift_release();
    }
  }
  else
  {
    uint64_t v38 = sub_100044D40();
    os_log_type_t v39 = sub_100044F30();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "Universal User Feedback Offline Learning feature is disabled, skipping", v40, 2u);
      swift_slowDealloc();
    }
    uint64_t v41 = *(void *)(v0 + 720);
    uint64_t v42 = *(void *)(v0 + 712);
    uint64_t v43 = *(void *)(v0 + 704);

    (*(void (**)(uint64_t, void, uint64_t))(v42 + 104))(v41, enum case for SiriUserFeedbackLearningTaskResult.Status.skipped(_:), v43);
    sub_1000446B0();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v44 = *(uint64_t (**)(void))(v0 + 8);
  return v44();
}

uint64_t sub_10001ED90()
{
  *(void *)(*(void *)v1 + 880) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10001F4D4;
  }
  else {
    uint64_t v2 = sub_10001EEA4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001EEA4()
{
  uint64_t v1 = sub_100044D40();
  os_log_type_t v2 = sub_100044F30();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Universal Suggestions engine finished execution", v3, 2u);
    swift_slowDealloc();
  }

  uint64_t v4 = sub_100044D40();
  os_log_type_t v5 = sub_100044F30();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Removing deleted entities...", v6, 2u);
    swift_slowDealloc();
  }
  uint64_t v7 = *(void *)(v0 + 656);

  sub_100005E74((void *)(v7 + qword_100051568), *(void *)(v7 + qword_100051568 + 24));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 888) = v8;
  void *v8 = v0;
  v8[1] = sub_10001F03C;
  return sub_10001C070(v0 + 336);
}

uint64_t sub_10001F03C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001F138, 0, 0);
}

uint64_t sub_10001F138()
{
  uint64_t v25 = (uint64_t)(v0 + 42);
  uint64_t v1 = sub_100044D40();
  os_log_type_t v2 = sub_100044F30();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "...Finished removing deleted entities", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = v0[108];
  uint64_t v5 = v0[90];
  uint64_t v6 = v0[89];
  uint64_t v7 = v0[88];

  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v5, enum case for SiriUserFeedbackLearningTaskResult.Status.success(_:), v7);
  sub_1000446B0();
  swift_setDeallocating();
  sub_100006030(v4 + 16);
  sub_100006030(v4 + 56);
  sub_100006030(v4 + 104);
  sub_100006030(v4 + 144);
  swift_release();
  sub_1000201B0(v25);
  sub_100006030(v25);
  uint64_t v8 = sub_100044CD0();
  sub_100044D00();
  os_signpost_type_t v9 = sub_100044F50();
  if (sub_100044F80())
  {
    os_signpost_type_t v26 = v9;
    uint64_t v10 = v0[87];
    uint64_t v11 = v0[84];
    uint64_t v12 = v0[83];
    swift_retain();
    sub_100044D30();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v11 + 88))(v10, v12) == enum case for OSSignpostError.doubleEnd(_:))
    {
      uint64_t v13 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(v0[84] + 8))(v0[87], v0[83]);
      uint64_t v13 = "";
    }
    uint64_t v17 = (void (*)(uint64_t, uint64_t))v0[106];
    uint64_t v18 = v0[96];
    uint64_t v19 = v0[95];
    uint64_t v20 = v0[91];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0[92] + 16))(v18, v19, v20);
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    os_signpost_id_t v22 = sub_100044CA0();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, v26, v22, "runUniversalSuggestionsPlugin", v13, v21, 2u);
    swift_slowDealloc();

    v17(v19, v20);
    v17(v18, v20);
  }
  else
  {
    uint64_t v14 = (void (*)(uint64_t, uint64_t))v0[106];
    uint64_t v15 = v0[95];
    uint64_t v16 = v0[91];

    v14(v15, v16);
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v23 = (uint64_t (*)(void))v0[1];
  return v23();
}

uint64_t sub_10001F4D4()
{
  uint64_t v32 = v0;
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_100044D40();
  os_log_type_t v2 = sub_100044F40();
  uint64_t v29 = (uint64_t)(v0 + 42);
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[110];
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[76] = v3;
    swift_errorRetain();
    sub_100006080(&qword_100051068);
    uint64_t v5 = sub_100044DF0();
    v0[77] = sub_1000434C0(v5, v6, &v31);
    sub_100044FA0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Error thrown: %s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v7 = v0[108];
  uint64_t v8 = (uint64_t *)v0[90];
  uint64_t v9 = v0[89];
  uint64_t v10 = v0[88];
  swift_getErrorValue();
  uint64_t *v8 = sub_100045140();
  v8[1] = v11;
  (*(void (**)(uint64_t *, void, uint64_t))(v9 + 104))(v8, enum case for SiriUserFeedbackLearningTaskResult.Status.failure(_:), v10);
  sub_1000446B0();
  swift_errorRelease();
  swift_setDeallocating();
  sub_100006030(v7 + 16);
  sub_100006030(v7 + 56);
  sub_100006030(v7 + 104);
  sub_100006030(v7 + 144);
  swift_release();
  sub_1000201B0(v29);
  sub_100006030(v29);
  uint64_t v12 = sub_100044CD0();
  sub_100044D00();
  os_signpost_type_t v13 = sub_100044F50();
  if (sub_100044F80())
  {
    os_signpost_type_t v30 = v13;
    uint64_t v14 = v0[85];
    uint64_t v15 = v0[84];
    uint64_t v16 = v0[83];
    swift_retain();
    sub_100044D30();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v15 + 88))(v14, v16) == enum case for OSSignpostError.doubleEnd(_:))
    {
      uint64_t v17 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(v0[84] + 8))(v0[85], v0[83]);
      uint64_t v17 = "";
    }
    uint64_t v21 = (void (*)(uint64_t, uint64_t))v0[106];
    uint64_t v22 = v0[96];
    uint64_t v23 = v0[93];
    uint64_t v24 = v0[91];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0[92] + 16))(v22, v23, v24);
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v25 = 0;
    os_signpost_id_t v26 = sub_100044CA0();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, v30, v26, "runUniversalSuggestionsPlugin", v17, v25, 2u);
    swift_slowDealloc();

    v21(v23, v24);
    v21(v22, v24);
  }
  else
  {
    uint64_t v18 = (void (*)(uint64_t, uint64_t))v0[106];
    uint64_t v19 = v0[93];
    uint64_t v20 = v0[91];

    v18(v19, v20);
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v27 = (uint64_t (*)(void))v0[1];
  return v27();
}

void sub_10001F994()
{
}

uint64_t sub_10001F9C4()
{
  sub_100006030(v0 + qword_100051538);
  sub_100020150(v0 + qword_100051540);
  sub_100006030(v0 + qword_100051548);
  sub_100006030(v0 + qword_100051550);
  sub_100006030(v0 + qword_100051558);
  sub_100006030(v0 + qword_100051560);
  return sub_100006030(v0 + qword_100051568);
}

id sub_10001FA48()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriUserFeedbackLearningUniversalSuggestionsPlugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001FA80(uint64_t a1)
{
  return sub_100006030(a1 + qword_100051568);
}

uint64_t sub_10001FB10()
{
  return type metadata accessor for SiriUserFeedbackLearningUniversalSuggestionsPlugin();
}

uint64_t sub_10001FB18(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_10001FB68()
{
  uint64_t v0 = sub_100044D60();
  sub_100013740(v0, qword_100051520);
  uint64_t v1 = sub_1000136A8(v0, (uint64_t)qword_100051520);
  if (qword_100050C68 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000136A8(v0, (uint64_t)qword_100052920);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

id sub_10001FC30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  void v21[3] = sub_1000446F0();
  v21[4] = &protocol witness table for FeatureManager;
  v21[0] = a1;
  v20[3] = sub_100044A50();
  v20[4] = &protocol witness table for FlatFileStreamBookmarkStore;
  v20[0] = a5;
  v19[3] = type metadata accessor for UniversalEntityRemover();
  v19[4] = &off_10004D3E8;
  v19[0] = a7;
  sub_100013D44((uint64_t)v21, (uint64_t)a8 + qword_100051538);
  sub_100020084(a2, (uint64_t)a8 + qword_100051540);
  sub_1000200EC(a3, (uint64_t)a8 + qword_100051548);
  sub_100013D44(a4, (uint64_t)a8 + qword_100051550);
  sub_100013D44((uint64_t)v20, (uint64_t)a8 + qword_100051558);
  sub_100013D44(a6, (uint64_t)a8 + qword_100051560);
  sub_100013D44((uint64_t)v19, (uint64_t)a8 + qword_100051568);
  v18.receiver = a8;
  v18.super_class = (Class)type metadata accessor for SiriUserFeedbackLearningUniversalSuggestionsPlugin();
  id v16 = objc_msgSendSuper2(&v18, "init");
  sub_100006030((uint64_t)v19);
  sub_100006030(a6);
  sub_100006030((uint64_t)v20);
  sub_100006030(a4);
  sub_100006030(a3);
  sub_100020150(a2);
  sub_100006030((uint64_t)v21);
  return v16;
}

id sub_10001FDBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UniversalEntityRemover();
  v31[3] = v4;
  v31[4] = &off_10004D3E8;
  v31[0] = a2;
  uint64_t v5 = sub_100044C40();
  uint64_t v6 = sub_100044C30();
  if (v6)
  {
    *((void *)&v29 + 1) = v5;
    os_signpost_type_t v30 = &protocol witness table for UniversalSuggestionsStoreCoreData;
    *(void *)&long long v28 = v6;
  }
  else
  {
    os_signpost_type_t v30 = 0;
    long long v28 = 0u;
    long long v29 = 0u;
  }
  sub_1000447E0();
  sub_1000447D0();
  sub_1000447B0();
  swift_release();
  sub_1000447D0();
  sub_1000447C0();
  swift_release();
  sub_100044A50();
  uint64_t v7 = sub_100044A40();
  sub_100044930();
  sub_100013D44((uint64_t)v31, (uint64_t)v24);
  uint64_t v8 = sub_10001FB18((uint64_t)v24, v24[3]);
  __chkstk_darwin(v8);
  uint64_t v10 = (void *)((char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v11 + 16))(v10);
  uint64_t v12 = *v10;
  uint64_t v22 = v4;
  uint64_t v23 = &off_10004D3E8;
  v21[0] = v12;
  id v13 = objc_allocWithZone((Class)type metadata accessor for SiriUserFeedbackLearningUniversalSuggestionsPlugin());
  uint64_t v14 = sub_10001FB18((uint64_t)v21, v22);
  __chkstk_darwin(v14);
  id v16 = (void *)((char *)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v17 + 16))(v16);
  uint64_t v18 = *v16;
  swift_retain();
  swift_retain();
  id v19 = sub_10001FC30(a1, (uint64_t)&v28, (uint64_t)&v27, (uint64_t)&v26, v7, (uint64_t)&v25, v18, v13);
  sub_100006030((uint64_t)v21);
  sub_100006030((uint64_t)v24);
  swift_release();
  sub_100006030((uint64_t)v31);
  return v19;
}

uint64_t sub_100020084(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006080(&qword_1000515D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000200EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100020150(uint64_t a1)
{
  uint64_t v2 = sub_100006080(&qword_1000515D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1000201B0(uint64_t a1)
{
  uint64_t v2 = sub_100044C10();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  sub_100013D44(a1, (uint64_t)v11);
  sub_100006080(&qword_1000515E0);
  sub_100044B50();
  if (swift_dynamicCast())
  {
    sub_100044C00();
    sub_100044BF0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_release();
  }
  else
  {
    if (qword_100050C88 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_100044D60();
    sub_1000136A8(v6, (uint64_t)qword_100051520);
    uint64_t v7 = sub_100044D40();
    os_log_type_t v8 = sub_100044F40();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Could not cast store to a Core Data instance", v9, 2u);
      swift_slowDealloc();
    }
  }
}

unint64_t sub_100020560()
{
  unint64_t result = qword_1000515D8;
  if (!qword_1000515D8)
  {
    sub_100044700();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000515D8);
  }
  return result;
}

uint64_t sub_1000205B8(uint64_t a1)
{
  *(void *)(v1 + 56) = a1;
  return _swift_task_switch(sub_1000205D8, 0, 0);
}

uint64_t sub_1000205D8()
{
  uint64_t v1 = (objc_class *)type metadata accessor for HomeKitManager();
  id v2 = [objc_allocWithZone(v1) init];
  v0[8] = v2;
  v0[5] = v1;
  v0[6] = &off_10004D658;
  v0[2] = v2;
  v0[9] = type metadata accessor for HomeStore();
  uint64_t v3 = swift_allocObject();
  sub_10001FB18((uint64_t)(v0 + 2), (uint64_t)v1);
  uint64_t v4 = *((void *)v1 - 1);
  uint64_t v5 = (uint64_t *)swift_task_alloc();
  v0[10] = v5;
  (*(void (**)(void))(v4 + 16))();
  uint64_t v6 = *v5;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000515F0 + dword_1000515F0);
  id v7 = v2;
  os_log_type_t v8 = (void *)swift_task_alloc();
  v0[11] = v8;
  void *v8 = v0;
  v8[1] = sub_100020774;
  return v10(v6, v3);
}

uint64_t sub_100020774(uint64_t a1)
{
  uint64_t v2 = *(void *)v1 + 16;
  uint64_t v3 = *(void **)(*(void *)v1 + 64);
  *(void *)(*(void *)v1 + 96) = a1;
  swift_task_dealloc();
  sub_100006030(v2);

  swift_task_dealloc();
  return _swift_task_switch(sub_1000208C0, 0, 0);
}

uint64_t sub_1000208C0()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void **)(v0 + 56);
  v2[3] = *(void *)(v0 + 72);
  v2[4] = &off_10004D280;
  *uint64_t v2 = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000208F0(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = (int64_t)(*v1)[2];
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (id *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= (uint64_t)((unint64_t)v3[3] >> 1))
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_100042C04(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  id v8 = v3[2];
  if ((uint64_t)(((unint64_t)v3[3] >> 1) - (void)v8) < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[2 * (void)v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = (char *)v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  id v13 = &v11[v2];
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1000450D0();
  __break(1u);
  return result;
}

uint64_t sub_100020A44(uint64_t a1, uint64_t a2)
{
  v2[7] = a2;
  v2[5] = type metadata accessor for HomeKitManager();
  v2[6] = &off_10004D658;
  v2[2] = a1;
  return _swift_task_switch(sub_100020AC4, 0, 0);
}

uint64_t sub_100020AC4()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v1
     + OBJC_IVAR____TtC50SiriUserFeedbackLearningUniversalSuggestionsPlugin9HomeStore_homeManagerDidUpdateHomesContinuation;
  uint64_t v3 = sub_100006080((uint64_t *)&unk_100050D28);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  *(void *)(v1 + OBJC_IVAR____TtC50SiriUserFeedbackLearningUniversalSuggestionsPlugin9HomeStore_entityIds) = 0;
  sub_100013D44((uint64_t)(v0 + 2), v1 + 16);
  uint64_t v4 = swift_task_alloc();
  v0[8] = v4;
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = v0 + 2;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[9] = v5;
  void *v5 = v0;
  v5[1] = sub_100020C24;
  return withCheckedContinuation<A>(isolation:function:_:)();
}

uint64_t sub_100020C24()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_100020D3C, 0, 0);
}

uint64_t sub_100020D3C()
{
  sub_100005E74(v0 + 2, v0[5]);
  uint64_t v1 = sub_100042630();
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = (void *)(v1 + 32);
    do
    {
      uint64_t v4 = (void **)sub_100005E74(v3, v3[3]);
      uint64_t v5 = sub_100020E68(*v4);
      sub_1000208F0(v5);
      v3 += 5;
      --v2;
    }
    while (v2);
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = v0[7];
  uint64_t v7 = sub_10002C1A4((uint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  *(void *)(v6 + OBJC_IVAR____TtC50SiriUserFeedbackLearningUniversalSuggestionsPlugin9HomeStore_entityIds) = v7;
  swift_bridgeObjectRelease();
  sub_100006030((uint64_t)(v0 + 2));
  id v8 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v9 = v0[7];
  return v8(v9);
}

id sub_100020E60(uint64_t a1)
{
  return sub_100005768(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_100020E68(void *a1)
{
  uint64_t v22 = &type metadata for HomeKitHome;
  uint64_t v23 = &off_10004D638;
  v21[0] = a1;
  uint64_t v2 = (void *)*sub_100005E74(v21, (uint64_t)&type metadata for HomeKitHome);
  id v3 = a1;
  uint64_t v4 = sub_100042358(v2);
  v19[0] = _swiftEmptyArrayStorage;
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v6 = (void *)(v4 + 32);
    swift_bridgeObjectRetain();
    do
    {
      sub_100005934(v6, &v20);
      sub_1000208F0((uint64_t)v20);
      v6 += 5;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease_n();
    uint64_t v7 = (id *)v19[0];
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = _swiftEmptyArrayStorage;
  }
  id v8 = (void *)*sub_100005E74(v21, (uint64_t)v22);
  v19[3] = &type metadata for HomeKitHome;
  v19[4] = &off_10004D638;
  v19[0] = v8;
  uint64_t v9 = (void *)*sub_100005E74(v19, (uint64_t)&type metadata for HomeKitHome);
  id v10 = v8;
  id v11 = [v9 assistantIdentifier];
  if (v11)
  {
    BOOL v12 = v11;
    uint64_t v13 = sub_100044DE0();
    uint64_t v15 = v14;

    sub_100006080(&qword_1000515F8);
    id v16 = (id *)swift_allocObject();
    *((_OWORD *)v16 + 1) = xmmword_100045B00;
    v16[4] = (id)v13;
    void v16[5] = v15;
  }
  else
  {
    id v16 = _swiftEmptyArrayStorage;
  }
  sub_100006030((uint64_t)v19);
  v19[0] = v7;
  sub_1000208F0((uint64_t)v16);
  uint64_t v17 = v19[0];
  sub_100006030((uint64_t)v21);
  return v17;
}

ValueMetadata *type metadata accessor for HomeStoreFactory()
{
  return &type metadata for HomeStoreFactory;
}

uint64_t sub_100021038()
{
  sub_100045000(98);
  v6._countAndFlagsBits = 0xD000000000000022;
  v6._object = (void *)0x8000000100047230;
  sub_100044E10(v6);
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void **)(v0 + 8);
  swift_bridgeObjectRetain();
  v7._countAndFlagsBits = v1;
  v7._object = v2;
  sub_100044E10(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0x7473656D6974202CLL;
  v8._object = (void *)0xED0000203A706D61;
  sub_100044E10(v8);
  if (*(unsigned char *)(v0 + 24))
  {
    object = (void *)0xE300000000000000;
    v4._countAndFlagsBits = 7104878;
  }
  else
  {
    v4._countAndFlagsBits = sub_100044F00();
    object = v4._object;
  }
  v4._object = object;
  sub_100044E10(v4);
  swift_bridgeObjectRelease();
  v9._object = (void *)0x8000000100047260;
  v9._countAndFlagsBits = 0xD000000000000010;
  sub_100044E10(v9);
  type metadata accessor for UniversalSuggestionItem(0);
  sub_100044540();
  sub_10002D308(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
  v10._countAndFlagsBits = sub_1000450F0();
  sub_100044E10(v10);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 0xD00000000000001BLL;
  v11._object = (void *)0x8000000100047280;
  sub_100044E10(v11);
  sub_100044A70();
  sub_100045090();
  return 0;
}

unint64_t sub_100021220(char a1)
{
  unint64_t result = 0xD000000000000026;
  switch(a1)
  {
    case 1:
    case 2:
      unint64_t result = 0xD000000000000024;
      break;
    case 3:
      unint64_t result = 0xD000000000000027;
      break;
    case 4:
      unint64_t result = 0xD000000000000023;
      break;
    default:
      return result;
  }
  return result;
}

Swift::Int sub_1000212C8()
{
  Swift::UInt v1 = *v0;
  sub_100045150();
  sub_100045160(v1);
  return sub_100045180();
}

void sub_100021310()
{
  sub_100045160(*v0);
}

Swift::Int sub_10002133C()
{
  Swift::UInt v1 = *v0;
  sub_100045150();
  sub_100045160(v1);
  return sub_100045180();
}

BOOL sub_100021380(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_100021394()
{
  return sub_100021220(*v0);
}

uint64_t sub_10002139C()
{
  uint64_t v1 = sub_100006080(&qword_100051078);
  __chkstk_darwin(v1);
  id v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[0] = 0;
  v10[1] = 0xE000000000000000;
  sub_100045000(73);
  v11._countAndFlagsBits = 0xD000000000000030;
  v11._object = (void *)0x80000001000470E0;
  sub_100044E10(v11);
  uint64_t v4 = *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for UniversalSuggestionDisambiguationOffered(0) + 20));
  v5._countAndFlagsBits = 0xD000000000000026;
  Swift::String v6 = (void *)0x8000000100047200;
  switch(v4)
  {
    case 1:
      Swift::String v7 = "DisambiguationOfferedState.cancelled";
      goto LABEL_4;
    case 2:
      Swift::String v7 = "DisambiguationOfferedState.abandoned";
LABEL_4:
      Swift::String v6 = (void *)((unint64_t)(v7 - 32) | 0x8000000000000000);
      v5._countAndFlagsBits = 0xD000000000000024;
      break;
    case 3:
      v5._countAndFlagsBits = 0xD000000000000027;
      Swift::String v8 = "DisambiguationOfferedState.inconclusive";
      goto LABEL_7;
    case 4:
      v5._countAndFlagsBits = 0xD000000000000023;
      Swift::String v8 = "DisambiguationOfferedState.selected";
LABEL_7:
      Swift::String v6 = (void *)((unint64_t)(v8 - 32) | 0x8000000000000000);
      break;
    default:
      break;
  }
  v5._object = v6;
  sub_100044E10(v5);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 0xD000000000000014;
  v12._object = (void *)0x8000000100047150;
  sub_100044E10(v12);
  sub_100013FCC(v0, (uint64_t)v3, &qword_100051078);
  v13._countAndFlagsBits = sub_100044DF0();
  sub_100044E10(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 41;
  v14._object = (void *)0xE100000000000000;
  sub_100044E10(v14);
  return v10[0];
}

unint64_t sub_100021570()
{
  uint64_t v1 = v0;
  unint64_t v2 = 0xD00000000000001CLL;
  uint64_t v3 = sub_100044850();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  Swift::String v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  Swift::String v9 = (char *)&v23 - v8;
  uint64_t v10 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
  __chkstk_darwin(v10 - 8);
  Swift::String v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100028690(v1, (uint64_t)v12, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
  uint64_t v13 = sub_100006080(&qword_100050FD0);
  int v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v12, 2, v13);
  if (v14)
  {
    if (v14 != 1) {
      return 0xD000000000000025;
    }
  }
  else
  {
    uint64_t v15 = &v12[*(int *)(v13 + 48)];
    id v16 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v16(v9, v12, v3);
    v16(v7, v15, v3);
    unint64_t v23 = 0;
    unint64_t v24 = 0xE000000000000000;
    sub_100045000(49);
    swift_bridgeObjectRelease();
    unint64_t v23 = 0xD000000000000022;
    unint64_t v24 = 0x8000000100046FC0;
    v17._countAndFlagsBits = sub_100044840();
    if (v17._object)
    {
      object = v17._object;
    }
    else
    {
      v17._countAndFlagsBits = 7104878;
      object = (void *)0xE300000000000000;
    }
    v17._object = object;
    sub_100044E10(v17);
    swift_bridgeObjectRelease();
    v25._countAndFlagsBits = 0x746567726174202CLL;
    v25._object = (void *)0xEA0000000000203ALL;
    sub_100044E10(v25);
    v19._countAndFlagsBits = sub_100044840();
    if (v19._object)
    {
      uint64_t v20 = v19._object;
    }
    else
    {
      v19._countAndFlagsBits = 7104878;
      uint64_t v20 = (void *)0xE300000000000000;
    }
    v19._object = v20;
    sub_100044E10(v19);
    swift_bridgeObjectRelease();
    v26._countAndFlagsBits = 41;
    v26._object = (void *)0xE100000000000000;
    sub_100044E10(v26);
    unint64_t v2 = v23;
    uint64_t v21 = *(void (**)(char *, uint64_t))(v4 + 8);
    v21(v7, v3);
    v21(v9, v3);
  }
  return v2;
}

unint64_t sub_100021868()
{
  uint64_t v1 = v0;
  unint64_t v2 = 0xD00000000000001CLL;
  uint64_t v3 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100028690(v1, (uint64_t)v8, type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState);
  uint64_t v9 = sub_100006080(&qword_100050FE0);
  switch((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 3, v9))
  {
    case 1u:
      return v2;
    case 2u:
      unint64_t v2 = 0xD00000000000001DLL;
      break;
    case 3u:
      unint64_t v2 = 0xD00000000000001FLL;
      break;
    default:
      sub_10002AF28((uint64_t)v8, (uint64_t)v5, type metadata accessor for UniversalSuggestionDisambiguationOffered);
      v11[0] = 0;
      v11[1] = 0xE000000000000000;
      sub_100045000(58);
      v12._countAndFlagsBits = 0xD000000000000037;
      v12._object = (void *)0x8000000100047040;
      sub_100044E10(v12);
      v13._countAndFlagsBits = sub_10002139C();
      sub_100044E10(v13);
      swift_bridgeObjectRelease();
      v14._countAndFlagsBits = 41;
      v14._object = (void *)0xE100000000000000;
      sub_100044E10(v14);
      unint64_t v2 = v11[0];
      sub_10002859C((uint64_t)v5, type metadata accessor for UniversalSuggestionDisambiguationOffered);
      break;
  }
  return v2;
}

uint64_t sub_100021A9C()
{
  sub_100045000(54);
  v1._object = (void *)0x8000000100047010;
  v1._countAndFlagsBits = 0xD000000000000024;
  sub_100044E10(v1);
  v2._countAndFlagsBits = sub_100021038();
  sub_100044E10(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 0x74536B736174202CLL;
  v3._object = (void *)0xED0000203A657461;
  sub_100044E10(v3);
  type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
  v4._countAndFlagsBits = sub_100021868();
  sub_100044E10(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 41;
  v5._object = (void *)0xE100000000000000;
  sub_100044E10(v5);
  return 0;
}

uint64_t sub_100021B8C()
{
  uint64_t v1 = sub_100006080(&qword_100050FD8);
  __chkstk_darwin(v1);
  Swift::String v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6[0] = 0;
  v6[1] = 0xE000000000000000;
  sub_100045000(71);
  v7._countAndFlagsBits = 0xD00000000000002FLL;
  v7._object = (void *)0x8000000100046F40;
  sub_100044E10(v7);
  sub_100044540();
  sub_10002D308(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
  v8._countAndFlagsBits = sub_1000450F0();
  sub_100044E10(v8);
  swift_bridgeObjectRelease();
  v9._object = (void *)0x8000000100046F70;
  v9._countAndFlagsBits = 0xD000000000000013;
  sub_100044E10(v9);
  uint64_t v4 = type metadata accessor for UniversalSuggestionRequestTaskState(0);
  sub_100013FCC(v0 + *(int *)(v4 + 20), (uint64_t)v3, &qword_100050FD8);
  v10._countAndFlagsBits = sub_100044DF0();
  sub_100044E10(v10);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 41;
  v11._object = (void *)0xE100000000000000;
  sub_100044E10(v11);
  return v6[0];
}

uint64_t sub_100021D20()
{
  sub_100045000(64);
  v1._object = (void *)0x80000001000468F0;
  v1._countAndFlagsBits = 0xD00000000000002CLL;
  sub_100044E10(v1);
  type metadata accessor for UniversalSuggestionCorrectionDiscovered(0);
  sub_100045090();
  v2._countAndFlagsBits = 0x736575716572202CLL;
  v2._object = (void *)0xEF203A6B73615474;
  sub_100044E10(v2);
  v3._countAndFlagsBits = sub_100021B8C();
  sub_100044E10(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 41;
  v4._object = (void *)0xE100000000000000;
  sub_100044E10(v4);
  return 0;
}

uint64_t sub_100021E14@<X0>(uint64_t a1@<X0>, void (*a2)(void, void, void)@<X1>, uint64_t a3@<X8>)
{
  unint64_t v45 = a2;
  uint64_t v5 = sub_100006080(&qword_100051738);
  __chkstk_darwin(v5 - 8);
  uint64_t v46 = (uint64_t)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
  uint64_t v43 = *(void *)(v7 - 8);
  uint64_t v44 = v7;
  __chkstk_darwin(v7);
  uint64_t v42 = (uint64_t)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
  __chkstk_darwin(v9 - 8);
  uint64_t v47 = (uint64_t)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100044A70();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  Swift::String v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100006080(&qword_100051740);
  __chkstk_darwin(v15 - 8);
  Swift::String v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for UniversalSuggestionItem(0);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (uint64_t *)((char *)&v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100022520(a1, (uint64_t)v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
  {
    sub_100017B30((uint64_t)v17, &qword_100051740);
    uint64_t v22 = a1 + *(int *)(type metadata accessor for UniversalSuggestionsFeaturisedTurn(0) + 20);
    uint64_t v23 = sub_100044540();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(a3, v22, v23);
    uint64_t v24 = a3 + *(int *)(type metadata accessor for UniversalSuggestionRequestTaskState(0) + 20);
    uint64_t v25 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v24, 1, 1, v25);
  }
  sub_10002AF28((uint64_t)v17, (uint64_t)v21, type metadata accessor for UniversalSuggestionItem);
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for PLUSSuggestionSurfacedState.notSurfaced(_:), v11);
  char v27 = sub_100044A60();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if (v27)
  {
    uint64_t v28 = a1 + *(int *)(type metadata accessor for UniversalSuggestionsFeaturisedTurn(0) + 20);
    uint64_t v29 = sub_100006080(&qword_100050FE0);
    uint64_t v30 = v47;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v47, 1, 3, v29);
  }
  else if (sub_10002CCC4(a1, v21))
  {
    uint64_t v28 = a1 + *(int *)(type metadata accessor for UniversalSuggestionsFeaturisedTurn(0) + 20);
    uint64_t v31 = sub_100006080(&qword_100050FE0);
    uint64_t v30 = v47;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v47, 3, 3, v31);
  }
  else
  {
    uint64_t v32 = v46;
    sub_100023FF0(a1, v45, (uint64_t)v21, v46);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v32, 1, v44) != 1)
    {
      uint64_t v37 = v42;
      sub_10002AF28(v32, v42, type metadata accessor for UniversalSuggestionDisambiguationOffered);
      uint64_t v38 = a1 + *(int *)(type metadata accessor for UniversalSuggestionsFeaturisedTurn(0) + 20);
      uint64_t v39 = v37;
      uint64_t v30 = v47;
      sub_10002AF28(v39, v47, type metadata accessor for UniversalSuggestionDisambiguationOffered);
      uint64_t v40 = sub_100006080(&qword_100050FE0);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v30, 0, 3, v40);
      uint64_t v41 = sub_100044540();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 16))(a3, v38, v41);
      goto LABEL_10;
    }
    sub_100017B30(v32, &qword_100051738);
    uint64_t v28 = a1 + *(int *)(type metadata accessor for UniversalSuggestionsFeaturisedTurn(0) + 20);
    uint64_t v33 = sub_100006080(&qword_100050FE0);
    uint64_t v30 = v47;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v47, 2, 3, v33);
  }
  uint64_t v34 = sub_100044540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 16))(a3, v28, v34);
LABEL_10:
  uint64_t v35 = a3 + *(int *)(type metadata accessor for UniversalSuggestionRequestTaskState(0) + 20);
  sub_100028690((uint64_t)v21, v35, type metadata accessor for UniversalSuggestionItem);
  uint64_t v36 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
  sub_100028690(v30, v35 + *(int *)(v36 + 20), type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v35, 0, 1, v36);
  sub_10002859C(v30, type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState);
  return sub_10002859C((uint64_t)v21, type metadata accessor for UniversalSuggestionItem);
}

uint64_t sub_100022520@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100044A70();
  uint64_t v151 = *(void *)(v4 - 8);
  uint64_t v152 = v4;
  __chkstk_darwin(v4);
  unint64_t v150 = (char *)&v134 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100044510();
  uint64_t v148 = *(void *)(v6 - 8);
  uint64_t v149 = v6;
  __chkstk_darwin(v6);
  uint64_t v144 = (char *)&v134 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006080(&qword_100051090);
  __chkstk_darwin(v8 - 8);
  uint64_t v146 = (uint64_t)&v134 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100006080(&qword_100051078);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v134 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100044540();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v155 = (char *)&v134 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v145 = (char *)&v134 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v154 = (char *)&v134 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  unint64_t v147 = (char *)&v134 - v22;
  __chkstk_darwin(v21);
  uint64_t v157 = (char *)&v134 - v23;
  uint64_t v24 = sub_100006080(&qword_100051728);
  __chkstk_darwin(v24 - 8);
  Swift::String v26 = (char *)&v134 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100044A30();
  uint64_t v28 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  unint64_t v160 = (char *)&v134 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  uint64_t v31 = __chkstk_darwin(v30);
  uint64_t v32 = __chkstk_darwin(v31);
  uint64_t v33 = __chkstk_darwin(v32);
  uint64_t v34 = __chkstk_darwin(v33);
  uint64_t v39 = (uint64_t)&v134 - v38;
  uint64_t v40 = *(int *)(v34 + 48);
  uint64_t v159 = a1;
  unint64_t v41 = *(void *)(a1 + v40);
  if (v41)
  {
    uint64_t v140 = v37;
    uint64_t v138 = v36;
    uint64_t v137 = v35;
    uint64_t v143 = v34;
    uint64_t v158 = v27;
    uint64_t v42 = *(uint64_t **)(v41 + 16);
    if ((unint64_t)v42 >= 2)
    {
      uint64_t v141 = v28;
      uint64_t v142 = v14;
      uint64_t v156 = v13;
      uint64_t v43 = qword_100050CB8;
      swift_bridgeObjectRetain();
      if (v43 != -1) {
        goto LABEL_63;
      }
      goto LABEL_4;
    }
    swift_bridgeObjectRetain();
    if (v42) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v54 = 1;
    uint64_t v53 = v158;
LABEL_14:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56))(v26, v54, 1, v53);
    swift_bridgeObjectRelease();
    int v55 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v53);
    uint64_t v56 = v160;
    if (v55 == 1)
    {
      sub_100017B30((uint64_t)v26, &qword_100051728);
LABEL_60:
      uint64_t v116 = type metadata accessor for UniversalSuggestionItem(0);
      uint64_t v117 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v116 - 8) + 56);
      uint64_t v118 = a2;
      return v117(v118, 1, 1, v116);
    }
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v160, v26, v53);
    sub_100044A10();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
    {
      (*(void (**)(char *, uint64_t))(v28 + 8))(v56, v53);
      sub_100017B30((uint64_t)v12, &qword_100051078);
      goto LABEL_60;
    }
    uint64_t v141 = v28;
    uint64_t v39 = *(void *)(v14 + 32);
    ((void (*)(char *, char *, uint64_t))v39)(v157, v12, v13);
    unint64_t v41 = *(void *)(v159 + *(int *)(v143 + 36));
    v139 = (double *)a2;
    uint64_t v156 = v13;
    uint64_t v142 = v14;
    uint64_t v136 = v14 + 32;
    uint64_t v135 = (void (*)(char *, char *, uint64_t))v39;
    if (v41 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v57 = sub_1000450C0();
      if (v57) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v57 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      if (v57)
      {
LABEL_20:
        uint64_t v12 = (char *)(v41 & 0xC000000000000001);
        a2 = 4;
        uint64_t v42 = &qword_10004D070;
        do
        {
          if (v12) {
            id v58 = (id)sub_100045020();
          }
          else {
            id v58 = *(id *)(v41 + 8 * a2);
          }
          int64_t v59 = v58;
          Swift::String v26 = (char *)(a2 - 3);
          if (__OFADD__(a2 - 4, 1))
          {
            __break(1u);
LABEL_63:
            swift_once();
LABEL_4:
            uint64_t v44 = sub_100044D60();
            sub_1000136A8(v44, (uint64_t)qword_100051600);
            sub_100028690(v159, v39, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
            swift_bridgeObjectRetain_n();
            unint64_t v45 = sub_100044D40();
            os_log_type_t v46 = sub_100044F40();
            if (os_log_type_enabled(v45, v46))
            {
              uint64_t v47 = swift_slowAlloc();
              uint64_t v136 = swift_slowAlloc();
              v162[0] = v136;
              *(_DWORD *)uint64_t v47 = 136315394;
              uint64_t v135 = (void (*)(char *, char *, uint64_t))(v47 + 4);
              sub_10002D308(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
              uint64_t v48 = sub_1000450F0();
              uint64_t v161 = sub_1000434C0(v48, v49, v162);
              v139 = (double *)a2;
              sub_100044FA0();
              swift_bridgeObjectRelease();
              sub_10002859C(v39, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
              *(_WORD *)(v47 + 12) = 2048;
              swift_bridgeObjectRelease();
              uint64_t v161 = (uint64_t)v42;
              a2 = (uint64_t)v139;
              sub_100044FA0();
              swift_bridgeObjectRelease();
              _os_log_impl((void *)&_mh_execute_header, v45, v46, "Suggestion summaries for requestId: %s has multiple (%ld) entries, using first", (uint8_t *)v47, 0x16u);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {
              swift_bridgeObjectRelease();
              sub_10002859C(v39, type metadata accessor for UniversalSuggestionsFeaturisedTurn);

              swift_bridgeObjectRelease();
            }
            uint64_t v28 = v141;
            uint64_t v13 = v156;
            uint64_t v14 = v142;
            if (!*(void *)(v41 + 16)) {
              goto LABEL_13;
            }
LABEL_10:
            uint64_t v53 = v158;
            (*(void (**)(char *, unint64_t, uint64_t))(v28 + 16))(v26, v41 + ((*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80)), v158);
            uint64_t v54 = 0;
            goto LABEL_14;
          }
          id v60 = [v58 currentTaskName];
          if (v60)
          {
            uint64_t v61 = v60;
            uint64_t v62 = sub_100044DE0();
            uint64_t v64 = v63;

            if ("HomeManaging" == (char *)-12) {
              goto LABEL_35;
            }
          }
          else
          {
            uint64_t v62 = 0;
            uint64_t v64 = 0;
            if ("HomeManaging" == (char *)-12)
            {
LABEL_35:
              if (!v64) {
                goto LABEL_42;
              }
LABEL_36:
              if ("sirikit.intent.home.ControlHomeIntent" != (char *)-16
                && (v62 == 0xD000000000000013 && "ome.ControlHomeIntent" == v64 || (sub_100045110() & 1) != 0))
              {
                goto LABEL_43;
              }
              goto LABEL_22;
            }
          }
          if (v64)
          {
            if (v62 == 0xD000000000000025 && "" == v64 || (sub_100045110() & 1) != 0)
            {
LABEL_43:

              swift_bridgeObjectRelease();
LABEL_44:
              swift_bridgeObjectRelease_n();
              unint64_t v65 = v157;
              uint64_t v66 = sub_100024E40(v159, v157);
              a2 = (uint64_t)v139;
              uint64_t v67 = v154;
              if (v66)
              {
                uint64_t v68 = sub_10002BDB8();
                if (v69)
                {
                  uint64_t v70 = v68;
                  uint64_t v71 = v69;
                  uint64_t v72 = v146;
                  sub_100013FCC(v159, v146, &qword_100051090);
                  uint64_t v74 = v148;
                  uint64_t v73 = v149;
                  int v75 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v148 + 48))(v72, 1, v149);
                  double v76 = 0.0;
                  if (v75 != 1)
                  {
                    uint64_t v77 = v72;
                    uint64_t v78 = v144;
                    (*(void (**)(char *, uint64_t, uint64_t))(v74 + 32))(v144, v77, v73);
                    sub_1000444E0();
                    double v76 = sub_100044900(v79);
                    (*(void (**)(char *, uint64_t))(v74 + 8))(v78, v73);
                  }
                  uint64_t v80 = v142;
                  int v81 = v147;
                  uint64_t v82 = v156;
                  uint64_t v83 = v157;
                  (*(void (**)(char *, char *, uint64_t))(v142 + 16))(v147, v157, v156);
                  long long v84 = v150;
                  uint64_t v85 = v160;
                  sub_100044A20();
                  swift_release();
                  (*(void (**)(char *, uint64_t))(v80 + 8))(v83, v82);
                  (*(void (**)(char *, uint64_t))(v141 + 8))(v85, v158);
                  uint64_t v86 = v139;
                  *(void *)v139 = v70;
                  *((void *)v86 + 1) = v71;
                  v86[2] = v76;
                  *((unsigned char *)v86 + 24) = v75 == 1;
                  uint64_t v87 = type metadata accessor for UniversalSuggestionItem(0);
                  v135((char *)v86 + *(int *)(v87 + 24), v81, v82);
                  (*(void (**)(char *, char *, uint64_t))(v151 + 32))((char *)v86 + *(int *)(v87 + 28), v84, v152);
                  return (*(uint64_t (**)(double *, void, uint64_t, uint64_t))(*(void *)(v87 - 8) + 56))(v86, 0, 1, v87);
                }
                if (qword_100050CB8 != -1) {
                  swift_once();
                }
                uint64_t v102 = sub_100044D60();
                sub_1000136A8(v102, (uint64_t)qword_100051600);
                uint64_t v103 = v142;
                uint64_t v104 = v156;
                (*(void (**)(char *, char *, uint64_t))(v142 + 16))(v67, v65, v156);
                uint64_t v105 = v137;
                sub_100028690(v159, v137, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
                uint64_t v106 = sub_100044D40();
                os_log_type_t v107 = sub_100044F40();
                int v108 = v107;
                if (os_log_type_enabled(v106, v107))
                {
                  uint64_t v109 = swift_slowAlloc();
                  uint64_t v159 = swift_slowAlloc();
                  v162[0] = v159;
                  *(_DWORD *)uint64_t v109 = 136315394;
                  sub_10002D308(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
                  LODWORD(v153) = v108;
                  uint64_t v110 = sub_1000450F0();
                  uint64_t v161 = sub_1000434C0(v110, v111, v162);
                  sub_100044FA0();
                  swift_bridgeObjectRelease();
                  uint64_t v155 = *(char **)(v142 + 8);
                  ((void (*)(char *, uint64_t))v155)(v67, v104);
                  *(_WORD *)(v109 + 12) = 2080;
                  uint64_t v112 = sub_1000450F0();
                  uint64_t v161 = sub_1000434C0(v112, v113, v162);
                  a2 = (uint64_t)v139;
                  sub_100044FA0();
                  swift_bridgeObjectRelease();
                  sub_10002859C(v105, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
                  _os_log_impl((void *)&_mh_execute_header, v106, (os_log_type_t)v153, "Failed to parse suggestion entity id with suggestionId: %s; in request %s",
                    (uint8_t *)v109,
                    0x16u);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_slowDealloc();

                  swift_release();
                  ((void (*)(char *, uint64_t))v155)(v157, v104);
                }
                else
                {

                  swift_release();
                  sub_10002859C(v105, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
                  uint64_t v115 = *(void (**)(char *, uint64_t))(v103 + 8);
                  v115(v67, v104);
                  v115(v65, v104);
                }
              }
              else
              {
                if (qword_100050CB8 != -1) {
                  swift_once();
                }
                uint64_t v88 = sub_100044D60();
                sub_1000136A8(v88, (uint64_t)qword_100051600);
                uint64_t v89 = v142;
                uint64_t v90 = v145;
                uint64_t v91 = v156;
                (*(void (**)(char *, char *, uint64_t))(v142 + 16))(v145, v65, v156);
                uint64_t v92 = v138;
                sub_100028690(v159, v138, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
                uint64_t v93 = sub_100044D40();
                os_log_type_t v94 = sub_100044F40();
                int v95 = v94;
                if (os_log_type_enabled(v93, v94))
                {
                  uint64_t v96 = swift_slowAlloc();
                  uint64_t v159 = swift_slowAlloc();
                  v162[0] = v159;
                  *(_DWORD *)uint64_t v96 = 136315394;
                  sub_10002D308(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
                  LODWORD(v155) = v95;
                  uint64_t v97 = sub_1000450F0();
                  uint64_t v161 = sub_1000434C0(v97, v98, v162);
                  sub_100044FA0();
                  swift_bridgeObjectRelease();
                  uint64_t v99 = *(void (**)(char *, uint64_t))(v142 + 8);
                  v99(v90, v91);
                  *(_WORD *)(v96 + 12) = 2080;
                  uint64_t v100 = sub_1000450F0();
                  uint64_t v161 = sub_1000434C0(v100, v101, v162);
                  sub_100044FA0();
                  swift_bridgeObjectRelease();
                  sub_10002859C(v92, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
                  _os_log_impl((void *)&_mh_execute_header, v93, (os_log_type_t)v155, "Failed to extract offered suggested entity with suggestionId: %s; in request: %s",
                    (uint8_t *)v96,
                    0x16u);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_slowDealloc();

                  v99(v157, v91);
                  a2 = (uint64_t)v139;
                }
                else
                {

                  sub_10002859C(v92, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
                  os_log_type_t v114 = *(void (**)(char *, uint64_t))(v89 + 8);
                  v114(v90, v91);
                  v114(v65, v91);
                }
              }
              (*(void (**)(char *, uint64_t))(v141 + 8))(v160, v158);
              goto LABEL_60;
            }
            goto LABEL_36;
          }
          if ("sirikit.intent.home.ControlHomeIntent" == (char *)-16)
          {
LABEL_42:

            goto LABEL_44;
          }
LABEL_22:
          swift_bridgeObjectRelease();
          uint64_t v39 = 2;
          sub_100006080(&qword_1000516E8);
          swift_arrayDestroy();

          ++a2;
        }
        while (v26 != (char *)v57);
      }
    }
    swift_bridgeObjectRelease_n();
    if (qword_100050CB8 != -1) {
      swift_once();
    }
    uint64_t v119 = sub_100044D60();
    sub_1000136A8(v119, (uint64_t)qword_100051600);
    uint64_t v120 = v142;
    uint64_t v121 = v155;
    uint64_t v122 = v156;
    uint64_t v123 = v157;
    (*(void (**)(char *, char *, uint64_t))(v142 + 16))(v155, v157, v156);
    uint64_t v124 = v140;
    sub_100028690(v159, v140, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    uint64_t v125 = sub_100044D40();
    os_log_type_t v126 = sub_100044F40();
    if (os_log_type_enabled(v125, v126))
    {
      uint64_t v127 = swift_slowAlloc();
      uint64_t v159 = swift_slowAlloc();
      v162[0] = v159;
      *(_DWORD *)uint64_t v127 = 136315394;
      sub_10002D308(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v128 = sub_1000450F0();
      uint64_t v161 = sub_1000434C0(v128, v129, v162);
      sub_100044FA0();
      swift_bridgeObjectRelease();
      uint64_t v154 = *(char **)(v142 + 8);
      ((void (*)(char *, uint64_t))v154)(v121, v122);
      *(_WORD *)(v127 + 12) = 2080;
      uint64_t v130 = sub_1000450F0();
      uint64_t v161 = sub_1000434C0(v130, v131, v162);
      sub_100044FA0();
      swift_bridgeObjectRelease();
      sub_10002859C(v124, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      _os_log_impl((void *)&_mh_execute_header, v125, v126, "Failed to find Home task for suggestion with suggestionId: %s; in request %s",
        (uint8_t *)v127,
        0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      ((void (*)(char *, uint64_t))v154)(v157, v122);
    }
    else
    {

      sub_10002859C(v124, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      char v132 = *(void (**)(char *, uint64_t))(v120 + 8);
      v132(v121, v122);
      v132(v123, v122);
    }
    (*(void (**)(char *, uint64_t))(v141 + 8))(v160, v158);
    uint64_t v133 = v139;
    uint64_t v116 = type metadata accessor for UniversalSuggestionItem(0);
    uint64_t v117 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v116 - 8) + 56);
    uint64_t v118 = (uint64_t)v133;
    return v117(v118, 1, 1, v116);
  }
  uint64_t v50 = type metadata accessor for UniversalSuggestionItem(0);
  uint64_t v51 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56);
  return v51(a2, 1, 1, v50);
}

Swift::Int sub_100023B48(Swift::Int result, uint64_t a2)
{
  if (*(void *)(result + 16) < *(void *)(a2 + 16)) {
    return 0;
  }
  Swift::Int v4 = result;
  int64_t v5 = 0;
  uint64_t v6 = a2 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a2 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a2 + 56);
  int64_t v22 = (unint64_t)(63 - v7) >> 6;
  Swift::Int v10 = result + 56;
LABEL_7:
  while (1)
  {
    int64_t v11 = v5;
    if (!v9) {
      break;
    }
    unint64_t v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v13 = v12 | (v5 << 6);
    if (!*(void *)(v4 + 16)) {
      goto LABEL_29;
    }
LABEL_23:
    Swift::UInt32 v17 = *(_DWORD *)(*(void *)(a2 + 48) + 4 * v13);
    sub_100045150();
    sub_100045170(v17);
    unint64_t result = sub_100045180();
    uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v19 = result & ~v18;
    if (((*(void *)(v10 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
      goto LABEL_29;
    }
    uint64_t v20 = *(void *)(v4 + 48);
    if (*(_DWORD *)(v20 + 4 * v19) != v17)
    {
      uint64_t v21 = ~v18;
      while (1)
      {
        unint64_t v19 = (v19 + 1) & v21;
        if (((*(void *)(v10 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
          break;
        }
        if (*(_DWORD *)(v20 + 4 * v19) == v17) {
          goto LABEL_7;
        }
      }
LABEL_29:
      swift_bridgeObjectRetain();
      uint64_t v2 = 0;
LABEL_30:
      sub_10002D260();
      return v2;
    }
  }
  int64_t v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_34;
  }
  if (v14 >= v22) {
    goto LABEL_32;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v14);
  ++v5;
  if (v15) {
    goto LABEL_22;
  }
  int64_t v5 = v11 + 2;
  if (v11 + 2 >= v22) {
    goto LABEL_32;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v5);
  if (v15) {
    goto LABEL_22;
  }
  int64_t v5 = v11 + 3;
  if (v11 + 3 >= v22) {
    goto LABEL_32;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v5);
  if (v15) {
    goto LABEL_22;
  }
  int64_t v16 = v11 + 4;
  if (v11 + 4 >= v22)
  {
LABEL_32:
    swift_bridgeObjectRetain();
    uint64_t v2 = 1;
    goto LABEL_30;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  int64_t v5 = v11 + 4;
  if (v15)
  {
LABEL_22:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v5 << 6);
    if (!*(void *)(v4 + 16)) {
      goto LABEL_29;
    }
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v5 >= v22) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v5);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_34:
  __break(1u);
  return result;
}

Swift::Int sub_100023D9C(Swift::Int result, Swift::Int a2)
{
  unint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 1;
  }
  unint64_t v3 = *(void *)(result + 16);
  if (!v3) {
    return 1;
  }
  int64_t v4 = 0;
  if (v2 >= v3) {
    Swift::Int v5 = result;
  }
  else {
    Swift::Int v5 = a2;
  }
  if (v2 >= v3) {
    Swift::Int v6 = a2;
  }
  else {
    Swift::Int v6 = result;
  }
  Swift::Int v7 = v5 + 56;
  uint64_t v8 = -1 << *(unsigned char *)(v5 + 32);
  if (-v8 < 64) {
    uint64_t v9 = ~(-1 << -(char)v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 56);
  int64_t v24 = (unint64_t)(63 - v8) >> 6;
  Swift::Int v11 = v6 + 56;
  while (1)
  {
    while (1)
    {
      int64_t v12 = v4;
      if (!v10) {
        break;
      }
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v4 << 6);
      if (*(void *)(v6 + 16))
      {
LABEL_29:
        Swift::UInt32 v18 = *(_DWORD *)(*(void *)(v5 + 48) + 4 * v14);
        sub_100045150();
        sub_100045170(v18);
        unint64_t result = sub_100045180();
        uint64_t v19 = -1 << *(unsigned char *)(v6 + 32);
        unint64_t v20 = result & ~v19;
        if ((*(void *)(v11 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20))
        {
          uint64_t v21 = *(void *)(v6 + 48);
          if (*(_DWORD *)(v21 + 4 * v20) == v18)
          {
LABEL_34:
            swift_bridgeObjectRetain();
            uint64_t v23 = 0;
LABEL_35:
            sub_10002D260();
            return v23;
          }
          uint64_t v22 = ~v19;
          while (1)
          {
            unint64_t v20 = (v20 + 1) & v22;
            if (((*(void *)(v11 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
              break;
            }
            if (*(_DWORD *)(v21 + 4 * v20) == v18) {
              goto LABEL_34;
            }
          }
        }
      }
    }
    int64_t v15 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v15 >= v24) {
      goto LABEL_38;
    }
    unint64_t v16 = *(void *)(v7 + 8 * v15);
    ++v4;
    if (!v16)
    {
      int64_t v4 = v12 + 2;
      if (v12 + 2 >= v24) {
        goto LABEL_38;
      }
      unint64_t v16 = *(void *)(v7 + 8 * v4);
      if (!v16)
      {
        int64_t v4 = v12 + 3;
        if (v12 + 3 >= v24) {
          goto LABEL_38;
        }
        unint64_t v16 = *(void *)(v7 + 8 * v4);
        if (!v16)
        {
          int64_t v17 = v12 + 4;
          if (v12 + 4 >= v24)
          {
LABEL_38:
            swift_bridgeObjectRetain();
            uint64_t v23 = 1;
            goto LABEL_35;
          }
          unint64_t v16 = *(void *)(v7 + 8 * v17);
          int64_t v4 = v12 + 4;
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_28:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v4 << 6);
    if (*(void *)(v6 + 16)) {
      goto LABEL_29;
    }
  }
  while (1)
  {
    int64_t v4 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v4 >= v24) {
      goto LABEL_38;
    }
    unint64_t v16 = *(void *)(v7 + 8 * v4);
    ++v17;
    if (v16) {
      goto LABEL_28;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_100023FF0@<X0>(uint64_t a1@<X0>, void (*a2)(void, void, void)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v53 = a4;
  uint64_t v7 = sub_100006080(&qword_100051078);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for UniversalSuggestionsDisambiguationResponseExtractor.DisambiguationResponse(0);
  __chkstk_darwin(v10);
  int64_t v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v13 = (int *)type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v55 = a1;
  uint64_t v56 = (uint64_t)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v16 = *(void *)(a1 + *(int *)(v14 + 36));
  uint64_t v51 = a3;
  uint64_t v52 = v9;
  unint64_t v49 = v12;
  uint64_t v50 = a2;
  uint64_t v48 = v10;
  if (v16 >> 62) {
    goto LABEL_47;
  }
  uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  if (!v17)
  {
LABEL_48:
    swift_bridgeObjectRelease_n();
    uint64_t v30 = v56;
    sub_100028690(v55, v56, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    goto LABEL_51;
  }
LABEL_3:
  uint64_t v18 = 0;
  unint64_t v54 = v16 + 32;
  while (1)
  {
    if ((v16 & 0xC000000000000001) != 0) {
      id v19 = (id)sub_100045020();
    }
    else {
      id v19 = *(id *)(v54 + 8 * v18);
    }
    unint64_t v20 = v19;
    if (__OFADD__(v18++, 1))
    {
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      swift_bridgeObjectRetain_n();
      uint64_t v17 = sub_1000450C0();
      if (!v17) {
        goto LABEL_48;
      }
      goto LABEL_3;
    }
    if (qword_100050C98 != -1) {
      swift_once();
    }
    uint64_t v22 = qword_100052980;
    unsigned int v23 = objc_msgSend(v20, "flowStateType", v48);
    if (*(void *)(v22 + 16))
    {
      Swift::UInt32 v24 = v23;
      sub_100045150();
      sub_100045170(v24);
      Swift::Int v25 = sub_100045180();
      uint64_t v26 = -1 << *(unsigned char *)(v22 + 32);
      unint64_t v27 = v25 & ~v26;
      if ((*(void *)(v22 + 56 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27)) {
        break;
      }
    }
LABEL_4:

    if (v18 == v17) {
      goto LABEL_48;
    }
  }
  uint64_t v28 = *(void *)(v22 + 48);
  if (*(_DWORD *)(v28 + 4 * v27) != v24)
  {
    uint64_t v29 = ~v26;
    do
    {
      unint64_t v27 = (v27 + 1) & v29;
      if (((*(void *)(v22 + 56 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27) & 1) == 0) {
        goto LABEL_4;
      }
    }
    while (*(_DWORD *)(v28 + 4 * v27) != v24);
  }

  swift_bridgeObjectRelease_n();
  uint64_t v30 = v56;
  sub_100028690(v55, v56, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  unint64_t v31 = *(void *)(v30 + v13[9]);
  if (!(v31 >> 62))
  {
    unint64_t v16 = *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v16) {
      goto LABEL_19;
    }
LABEL_50:
    swift_bridgeObjectRelease_n();
    goto LABEL_51;
  }
  swift_bridgeObjectRetain_n();
  unint64_t v16 = sub_1000450C0();
  if (!v16) {
    goto LABEL_50;
  }
LABEL_19:
  uint64_t v32 = 4;
  while (2)
  {
    if ((v31 & 0xC000000000000001) != 0) {
      id v33 = (id)sub_100045020();
    }
    else {
      id v33 = *(id *)(v31 + 8 * v32);
    }
    uint64_t v34 = v33;
    uint64_t v35 = v32 - 3;
    if (__OFADD__(v32 - 4, 1)) {
      goto LABEL_46;
    }
    uint64_t v36 = (int *)[v33 currentTaskName];
    if (v36)
    {
      unint64_t v13 = v36;
      uint64_t v37 = sub_100044DE0();
      uint64_t v39 = v38;

      if ("HomeManaging" != (char *)-12) {
        goto LABEL_28;
      }
LABEL_34:
      if (!v39) {
        goto LABEL_41;
      }
LABEL_35:
      if ("sirikit.intent.home.ControlHomeIntent" != (char *)-16
        && (v37 == 0xD000000000000013 && "ome.ControlHomeIntent" == v39 || (sub_100045110() & 1) != 0))
      {
        goto LABEL_42;
      }
    }
    else
    {
      uint64_t v37 = 0;
      uint64_t v39 = 0;
      if ("HomeManaging" == (char *)-12) {
        goto LABEL_34;
      }
LABEL_28:
      if (v39)
      {
        if (v37 == 0xD000000000000025 && "" == v39 || (sub_100045110() & 1) != 0)
        {
LABEL_42:

          swift_bridgeObjectRelease();
          goto LABEL_43;
        }
        goto LABEL_35;
      }
      if ("sirikit.intent.home.ControlHomeIntent" == (char *)-16)
      {
LABEL_41:

LABEL_43:
        swift_bridgeObjectRelease_n();
        sub_10002859C(v56, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
        uint64_t v40 = v49;
        sub_100024608(v55, v50, v51, v49);
        uint64_t v41 = (uint64_t)v52;
        sub_100013FCC((uint64_t)&v40[*(int *)(v48 + 20)], (uint64_t)v52, &qword_100051078);
        char v42 = *v40;
        sub_10002859C((uint64_t)v40, type metadata accessor for UniversalSuggestionsDisambiguationResponseExtractor.DisambiguationResponse);
        uint64_t v43 = v41;
        uint64_t v44 = v53;
        sub_1000285FC(v43, v53);
        uint64_t v45 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
        *(unsigned char *)(v44 + *(int *)(v45 + 20)) = v42;
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v44, 0, 1, v45);
      }
    }
    swift_bridgeObjectRelease();
    sub_100006080(&qword_1000516E8);
    swift_arrayDestroy();

    ++v32;
    if (v35 != v16) {
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease_n();
  uint64_t v30 = v56;
LABEL_51:
  sub_10002859C(v30, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  uint64_t v47 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v53, 1, 1, v47);
}

uint64_t sub_100024608@<X0>(uint64_t a1@<X0>, void (*a2)(void, void, void)@<X1>, uint64_t a3@<X2>, unsigned char *a4@<X8>)
{
  uint64_t v73 = (char *)a3;
  uint64_t v71 = a2;
  uint64_t v68 = a4;
  uint64_t v78 = type metadata accessor for UniversalSuggestionsDisambiguationResponseExtractor.DisambiguationResponse(0);
  uint64_t v74 = *(void *)(v78 - 8);
  __chkstk_darwin(v78);
  uint64_t v72 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006080(&qword_1000516F0);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v66 = (uint64_t)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  unint64_t v65 = (char *)&v64 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  unint64_t v13 = (char *)&v64 - v12;
  __chkstk_darwin(v11);
  uint64_t v67 = (uint64_t)&v64 - v14;
  uint64_t v15 = type metadata accessor for UniversalSuggestionItem(0);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v77 = (uint64_t)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v75 = (uint64_t)&v64 - v18;
  uint64_t v19 = sub_100006080(&qword_100051070);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v76 = (uint64_t)&v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  unsigned int v23 = (char *)&v64 - v22;
  uint64_t v24 = type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  uint64_t v25 = __chkstk_darwin(v24 - 8);
  unint64_t v27 = (char *)&v64 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  uint64_t v29 = (char *)&v64 - v28;
  sub_100006080(&qword_1000516F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100045F70;
  *(void *)(inited + 32) = sub_100028684;
  *(void *)(inited + 40) = 0;
  *(void *)(inited + 48) = sub_100028688;
  *(void *)(inited + 56) = 0;
  *(void *)(inited + 64) = sub_10002868C;
  *(void *)(inited + 72) = 0;
  uint64_t v69 = v29;
  uint64_t v31 = (uint64_t)v29;
  uint64_t v32 = (uint64_t)v13;
  sub_100028690(a1, v31, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  id v33 = v71;
  uint64_t v70 = v23;
  sub_100013FCC((uint64_t)v71, (uint64_t)v23, &qword_100051070);
  uint64_t v34 = (uint64_t)v73;
  sub_100028690((uint64_t)v73, v75, type metadata accessor for UniversalSuggestionItem);
  sub_100028690(a1, (uint64_t)v27, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  uint64_t v35 = v76;
  sub_100013FCC((uint64_t)v33, v76, &qword_100051070);
  uint64_t v36 = v77;
  sub_100028690(v34, v77, type metadata accessor for UniversalSuggestionItem);
  uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(inited + 32);
  swift_retain();
  uint64_t v73 = v27;
  uint64_t v38 = v27;
  uint64_t v39 = (uint64_t)v72;
  v37(v38, v35, v36);
  swift_release();
  uint64_t v40 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v74 + 48);
  unint64_t v41 = 0;
  if (v40(v32, 1, v78) == 1)
  {
    sub_100017B30(v32, &qword_1000516F0);
    char v42 = *(void (**)(char *, uint64_t, uint64_t))(inited + 48);
    swift_retain();
    uint64_t v43 = (uint64_t)v73;
    uint64_t v44 = v76;
    uint64_t v45 = v77;
    v42(v73, v76, v77);
    swift_release();
    unint64_t v41 = 1;
    uint64_t v46 = v78;
    if (v40(v32, 1, v78) == 1)
    {
      sub_100017B30(v32, &qword_1000516F0);
      uint64_t v71 = *(void (**)(void, void, void))(inited + 64);
      swift_retain();
      v71(v43, v44, v45);
      swift_release();
      if (v40(v32, 1, v46) == 1)
      {
        sub_100017B30(v32, &qword_1000516F0);
        sub_10002859C((uint64_t)v69, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
        sub_100017B30((uint64_t)v70, &qword_100051070);
        sub_10002859C(v75, type metadata accessor for UniversalSuggestionItem);
        uint64_t v47 = 1;
        uint64_t v48 = v68;
        uint64_t v49 = v78;
        uint64_t v50 = v67;
        uint64_t v51 = v74;
        goto LABEL_10;
      }
      unint64_t v41 = 2;
    }
    uint64_t v39 = (uint64_t)v72;
  }
  sub_100017B30(v32, &qword_1000516F0);
  if (v41 >= *(void *)(inited + 16))
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v52 = *(void (**)(char *, char *, uint64_t))(inited + 32 + 16 * v41);
  swift_retain();
  uint64_t v53 = (uint64_t)v65;
  uint64_t v55 = (uint64_t)v69;
  uint64_t v54 = (uint64_t)v70;
  uint64_t v56 = v75;
  v52(v69, v70, v75);
  sub_10002859C(v55, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  sub_100017B30(v54, &qword_100051070);
  sub_10002859C(v56, type metadata accessor for UniversalSuggestionItem);
  swift_release();
  uint64_t v57 = v66;
  sub_100013FCC(v53, v66, &qword_1000516F0);
  uint64_t v49 = v78;
  if (v40(v57, 1, v78) == 1)
  {
LABEL_15:
    sub_10002859C((uint64_t)v73, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    sub_100017B30(v76, &qword_100051070);
    uint64_t result = sub_10002859C(v77, type metadata accessor for UniversalSuggestionItem);
    __break(1u);
    return result;
  }
  sub_10002AF28(v57, v39, type metadata accessor for UniversalSuggestionsDisambiguationResponseExtractor.DisambiguationResponse);
  sub_100017B30(v53, &qword_1000516F0);
  uint64_t v50 = v67;
  sub_10002AF28(v39, v67, type metadata accessor for UniversalSuggestionsDisambiguationResponseExtractor.DisambiguationResponse);
  uint64_t v47 = 0;
  uint64_t v51 = v74;
  uint64_t v48 = v68;
LABEL_10:
  uint64_t v58 = v76;
  uint64_t v59 = v77;
  uint64_t v60 = (uint64_t)v73;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v51 + 56))(v50, v47, 1, v49);
  swift_bridgeObjectRelease();
  sub_10002859C(v60, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  sub_100017B30(v58, &qword_100051070);
  sub_10002859C(v59, type metadata accessor for UniversalSuggestionItem);
  if (v40(v50, 1, v49) != 1) {
    return sub_10002AF28(v50, (uint64_t)v48, type metadata accessor for UniversalSuggestionsDisambiguationResponseExtractor.DisambiguationResponse);
  }
  uint64_t v61 = &v48[*(int *)(v49 + 20)];
  uint64_t v62 = sub_100044540();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v62 - 8) + 56))(v61, 1, 1, v62);
  *uint64_t v48 = 3;
  return sub_100017B30(v50, &qword_1000516F0);
}

uint64_t sub_100024E40(uint64_t a1, char *a2)
{
  uint64_t v57 = a1;
  uint64_t v53 = type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  uint64_t v4 = __chkstk_darwin(v53);
  uint64_t v58 = (uint64_t)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v52 = (uint64_t)&v51 - v6;
  uint64_t v7 = sub_100044540();
  uint64_t v59 = *(void *)(v7 - 8);
  uint64_t v60 = v7;
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v55 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v51 = (char *)&v51 - v10;
  uint64_t v54 = sub_100044850();
  uint64_t v11 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  unint64_t v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100006080(&qword_1000516E0);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000448B0();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005E74((void *)(v2 + 16), *(void *)(v2 + 40));
  uint64_t v56 = a2;
  uint64_t v21 = v17;
  uint64_t v22 = v18;
  sub_1000449D0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v21) == 1)
  {
    sub_100017B30((uint64_t)v16, &qword_1000516E0);
    if (qword_100050CB8 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_100044D60();
    sub_1000136A8(v23, (uint64_t)qword_100051600);
    uint64_t v25 = v59;
    uint64_t v24 = v60;
    uint64_t v26 = v55;
    (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v55, v56, v60);
    uint64_t v27 = v58;
    sub_100028690(v57, v58, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    uint64_t v28 = sub_100044D40();
    os_log_type_t v29 = sub_100044F40();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v62 = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 136315394;
      sub_10002D308(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v31 = sub_1000450F0();
      uint64_t v61 = sub_1000434C0(v31, v32, &v62);
      sub_100044FA0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v24);
      *(_WORD *)(v30 + 12) = 2080;
      uint64_t v33 = v58;
      uint64_t v34 = sub_100044520();
      uint64_t v61 = sub_1000434C0(v34, v35, &v62);
      sub_100044FA0();
      swift_bridgeObjectRelease();
      sub_10002859C(v33, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Failed to find candidate corresponding to offered suggestionId: %s; in request: %s",
        (uint8_t *)v30,
        0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v24);
      sub_10002859C(v27, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v20, v16, v21);
    sub_100044890();
    uint64_t v36 = v54;
    if ((*(unsigned int (**)(char *, uint64_t))(v11 + 88))(v13, v54) == enum case for UniversalEntity.homeAutomationEntity(_:))
    {
      (*(void (**)(char *, uint64_t))(v22 + 8))(v20, v21);
      (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v36);
      return *(void *)v13;
    }
    uint64_t v58 = v21;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v36);
    if (qword_100050CB8 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_100044D60();
    sub_1000136A8(v38, (uint64_t)qword_100051600);
    uint64_t v40 = v59;
    uint64_t v39 = v60;
    unint64_t v41 = v51;
    (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v51, v56, v60);
    uint64_t v42 = v52;
    sub_100028690(v57, v52, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    uint64_t v43 = sub_100044D40();
    os_log_type_t v44 = sub_100044F40();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = swift_slowAlloc();
      uint64_t v57 = swift_slowAlloc();
      uint64_t v62 = v57;
      *(_DWORD *)uint64_t v45 = 136315394;
      sub_10002D308(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v46 = sub_1000450F0();
      uint64_t v61 = sub_1000434C0(v46, v47, &v62);
      uint64_t v56 = v20;
      sub_100044FA0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v39);
      *(_WORD *)(v45 + 12) = 2080;
      uint64_t v48 = v52;
      uint64_t v49 = sub_100044520();
      uint64_t v61 = sub_1000434C0(v49, v50, &v62);
      sub_100044FA0();
      swift_bridgeObjectRelease();
      sub_10002859C(v48, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Failed to unpack entity corresponding to offered suggestionId: %s; in request: %s",
        (uint8_t *)v45,
        0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v22 + 8))(v56, v58);
    }
    else
    {

      sub_10002859C(v42, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v39);
      (*(void (**)(char *, uint64_t))(v22 + 8))(v20, v58);
    }
  }
  return 0;
}

uint64_t type metadata accessor for UniversalSuggestionsRequestTaskStateExtractor()
{
  return self;
}

uint64_t sub_100025734()
{
  uint64_t result = sub_10002C23C((uint64_t)&off_10004D028);
  qword_100052978 = result;
  return result;
}

uint64_t sub_10002575C()
{
  uint64_t result = sub_10002C23C((uint64_t)&off_10004D0E0);
  qword_100052980 = result;
  return result;
}

uint64_t sub_100025784()
{
  uint64_t result = sub_10002C23C((uint64_t)&off_10004D000);
  qword_100052988 = result;
  return result;
}

uint64_t sub_1000257AC()
{
  uint64_t result = sub_10002C23C((uint64_t)&off_10004D090);
  qword_100052990 = result;
  return result;
}

uint64_t sub_1000257D4()
{
  uint64_t result = sub_10002C23C((uint64_t)&off_10004D0B8);
  qword_100052998 = result;
  return result;
}

uint64_t sub_1000257FC(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v10 >= v7) {
      goto LABEL_23;
    }
    unint64_t v11 = *(void *)(v3 + 8 * v10);
    ++v2;
    if (!v11)
    {
      int64_t v2 = v10 + 1;
      if (v10 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v11 = *(void *)(v3 + 8 * v2);
      if (!v11)
      {
        int64_t v2 = v10 + 2;
        if (v10 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        if (!v11)
        {
          int64_t v2 = v10 + 3;
          if (v10 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v11 = *(void *)(v3 + 8 * v2);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v2 << 6);
LABEL_5:
    uint64_t result = sub_100028A00(&v13, *(unsigned int *)(*(void *)(v1 + 48) + 4 * v9));
  }
  int64_t v12 = v10 + 4;
  if (v12 < v7)
  {
    unint64_t v11 = *(void *)(v3 + 8 * v12);
    if (!v11)
    {
      while (1)
      {
        int64_t v2 = v12 + 1;
        if (__OFADD__(v12, 1)) {
          goto LABEL_27;
        }
        if (v2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        ++v12;
        if (v11) {
          goto LABEL_22;
        }
      }
    }
    int64_t v2 = v12;
    goto LABEL_22;
  }
LABEL_23:
  return swift_release();
}

uint64_t sub_100025958(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(_DWORD *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 9; ; ++i)
  {
    uint64_t v4 = i - 7;
    if (__OFADD__(i - 8, 1)) {
      break;
    }
    BOOL v6 = *(_DWORD *)(a2 + 4 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1000259BC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, void *a3@<X2>, char *a4@<X8>)
{
  uint64_t v116 = a3;
  uint64_t v124 = a4;
  uint64_t v123 = (char *)sub_100006080(&qword_100051078);
  uint64_t v6 = __chkstk_darwin(v123);
  uint64_t v122 = (char *)&v115 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v115 = (char *)&v115 - v8;
  uint64_t v9 = sub_100006080(&qword_100051070);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = (uint64_t)&v115 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (uint64_t *)((char *)&v115 - v14);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v115 - v16;
  uint64_t v18 = type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v118 = (uint64_t)&v115 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v119 = (char *)&v115 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v117 = (uint64_t)&v115 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v120 = (char *)&v115 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v121 = (uint64_t)&v115 - v29;
  __chkstk_darwin(v28);
  uint64_t v31 = (char *)&v115 - v30;
  sub_100013FCC((uint64_t)a2, (uint64_t)v17, &qword_100051070);
  uint64_t v32 = *(void *)(v19 + 48);
  uint64_t v125 = v18;
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v32)(v17, 1, v18) == 1)
  {
    sub_100017B30((uint64_t)v17, &qword_100051070);
    goto LABEL_22;
  }
  sub_10002AF28((uint64_t)v17, (uint64_t)v31, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  if ((sub_10002CFD4(a1, (uint64_t)v31) & 1) == 0)
  {
    sub_10002859C((uint64_t)v31, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
LABEL_22:
    if (qword_100050CB8 == -1)
    {
LABEL_23:
      uint64_t v45 = sub_100044D60();
      sub_1000136A8(v45, (uint64_t)qword_100051600);
      sub_100013FCC((uint64_t)a2, (uint64_t)v15, &qword_100051070);
      uint64_t v46 = sub_100044D40();
      os_log_type_t v47 = sub_100044F30();
      if (os_log_type_enabled(v46, v47))
      {
        uint64_t v48 = (uint8_t *)swift_slowAlloc();
        v126[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v48 = 136315138;
        sub_100013FCC((uint64_t)v15, v12, &qword_100051070);
        uint64_t v49 = v125;
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v32)(v12, 1, v125) == 1)
        {
          sub_100017B30(v12, &qword_100051070);
          uint64_t v50 = sub_100044540();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v122, 1, 1, v50);
        }
        else
        {
          uint64_t v51 = v12 + *(int *)(v49 + 20);
          uint64_t v52 = sub_100044540();
          uint64_t v53 = *(void *)(v52 - 8);
          uint64_t v54 = v122;
          (*(void (**)(char *, uint64_t, uint64_t))(v53 + 16))(v122, v51, v52);
          sub_10002859C(v12, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v53 + 56))(v54, 0, 1, v52);
        }
        uint64_t v55 = sub_100044DF0();
        uint64_t v127 = sub_1000434C0(v55, v56, v126);
        sub_100044FA0();
        swift_bridgeObjectRelease();
        sub_100017B30((uint64_t)v15, &qword_100051070);
        _os_log_impl((void *)&_mh_execute_header, v46, v47, "The next turn is outside the response window for a disambiguation selection; requestId=%s",
          v48,
          0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        sub_100017B30((uint64_t)v15, &qword_100051070);
      }

      goto LABEL_30;
    }
LABEL_63:
    swift_once();
    goto LABEL_23;
  }
  uint64_t v32 = *(void *)&v31[*(int *)(v125 + 36)];
  uint64_t v123 = v31;
  if ((unint64_t)v32 >> 62)
  {
    if (v32 < 0) {
      a2 = (uint64_t *)v32;
    }
    else {
      a2 = (uint64_t *)(v32 & 0xFFFFFFFFFFFFFF8);
    }
    swift_bridgeObjectRetain_n();
    uint64_t v15 = (uint64_t *)sub_1000450C0();
    if (v15) {
      goto LABEL_6;
    }
LABEL_68:
    swift_bridgeObjectRelease_n();
    uint64_t v59 = (uint64_t)v123;
    uint64_t v60 = v121;
    sub_100028690((uint64_t)v123, v121, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    int v70 = 0;
    uint64_t v61 = (uint64_t)v120;
    goto LABEL_71;
  }
  uint64_t v15 = *(uint64_t **)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  if (!v15) {
    goto LABEL_68;
  }
LABEL_6:
  uint64_t v33 = 0;
  uint64_t v122 = (char *)(v32 + 32);
  uint64_t v12 = (uint64_t)&HomeStore;
  while (1)
  {
    if ((v32 & 0xC000000000000001) != 0) {
      id v34 = (id)sub_100045020();
    }
    else {
      id v34 = *(id *)&v122[8 * (void)v33];
    }
    unint64_t v35 = v34;
    BOOL v36 = __OFADD__(v33, 1);
    uint64_t v33 = (uint64_t *)((char *)v33 + 1);
    if (v36)
    {
      __break(1u);
LABEL_62:
      __break(1u);
      goto LABEL_63;
    }
    if (qword_100050CA0 != -1) {
      swift_once();
    }
    uint64_t v37 = qword_100052988;
    unsigned int v38 = [v35 flowStateType];
    if (*(void *)(v37 + 16))
    {
      Swift::UInt32 v39 = v38;
      sub_100045150();
      a2 = v126;
      sub_100045170(v39);
      Swift::Int v40 = sub_100045180();
      uint64_t v41 = -1 << *(unsigned char *)(v37 + 32);
      unint64_t v42 = v40 & ~v41;
      if ((*(void *)(v37 + 56 + ((v42 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v42)) {
        break;
      }
    }
LABEL_7:

    if (v33 == v15) {
      goto LABEL_68;
    }
  }
  uint64_t v43 = *(void *)(v37 + 48);
  if (*(_DWORD *)(v43 + 4 * v42) != v39)
  {
    uint64_t v44 = ~v41;
    do
    {
      unint64_t v42 = (v42 + 1) & v44;
      if (((*(void *)(v37 + 56 + ((v42 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v42) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(_DWORD *)(v43 + 4 * v42) != v39);
  }

  swift_bridgeObjectRelease_n();
  uint64_t v59 = (uint64_t)v123;
  uint64_t v60 = v121;
  sub_100028690((uint64_t)v123, v121, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  uint64_t v32 = *(void *)(v60 + *(int *)(v125 + 36));
  if ((unint64_t)v32 >> 62)
  {
    swift_bridgeObjectRetain_n();
    a2 = (uint64_t *)sub_1000450C0();
    uint64_t v61 = (uint64_t)v120;
    if (!a2) {
      goto LABEL_70;
    }
LABEL_33:
    uint64_t v12 = 4;
    uint64_t v15 = &qword_10004D188;
    while (1)
    {
      if ((v32 & 0xC000000000000001) != 0) {
        id v62 = (id)sub_100045020();
      }
      else {
        id v62 = *(id *)(v32 + 8 * v12);
      }
      uint64_t v63 = v62;
      uint64_t v64 = (uint64_t *)(v12 - 3);
      if (__OFADD__(v12 - 4, 1)) {
        goto LABEL_62;
      }
      id v65 = [v62 currentTaskName];
      if (v65)
      {
        uint64_t v66 = v65;
        uint64_t v67 = sub_100044DE0();
        uint64_t v69 = v68;
      }
      else
      {
        uint64_t v67 = 0;
        uint64_t v69 = 0;
      }
      if ("HomeManaging" == (char *)-12) {
        break;
      }
      if (v69)
      {
        if (v67 == 0xD000000000000025 && "" == v69 || (sub_100045110() & 1) != 0)
        {
LABEL_57:
          swift_bridgeObjectRelease();
LABEL_58:
          sub_100006080(&qword_1000516E8);
          swift_arrayDestroy();
          swift_bridgeObjectRelease_n();

          int v70 = 1;
LABEL_60:
          uint64_t v59 = (uint64_t)v123;
          uint64_t v61 = (uint64_t)v120;
          uint64_t v60 = v121;
          goto LABEL_71;
        }
        goto LABEL_50;
      }
      if ("sirikit.intent.home.ControlHomeIntent" == (char *)-16) {
        goto LABEL_58;
      }
LABEL_35:
      swift_bridgeObjectRelease();
      sub_100006080(&qword_1000516E8);
      swift_arrayDestroy();

      ++v12;
      if (v64 == a2)
      {
        swift_bridgeObjectRelease_n();
        int v70 = 0;
        goto LABEL_60;
      }
    }
    if (!v69) {
      goto LABEL_58;
    }
LABEL_50:
    if ("sirikit.intent.home.ControlHomeIntent" != (char *)-16
      && (v67 == 0xD000000000000013 && "ome.ControlHomeIntent" == v69 || (sub_100045110() & 1) != 0))
    {
      goto LABEL_57;
    }
    goto LABEL_35;
  }
  a2 = *(uint64_t **)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  uint64_t v61 = (uint64_t)v120;
  if (a2) {
    goto LABEL_33;
  }
LABEL_70:
  swift_bridgeObjectRelease_n();
  int v70 = 0;
LABEL_71:
  sub_10002859C(v60, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  if (qword_100050CB8 != -1) {
    swift_once();
  }
  uint64_t v71 = sub_100044D60();
  uint64_t v72 = sub_1000136A8(v71, (uint64_t)qword_100051600);
  sub_100028690(v59, v61, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  uint64_t v73 = sub_100044D40();
  os_log_type_t v74 = sub_100044F30();
  if (!os_log_type_enabled(v73, v74))
  {
    sub_10002859C(v61, type metadata accessor for UniversalSuggestionsFeaturisedTurn);

    if (v70) {
      goto LABEL_77;
    }
    goto LABEL_107;
  }
  uint64_t v75 = swift_slowAlloc();
  uint64_t v122 = (char *)v72;
  uint64_t v76 = v75;
  v126[0] = swift_slowAlloc();
  *(_DWORD *)uint64_t v76 = 67109378;
  LODWORD(v127) = v70;
  sub_100044FA0();
  *(_WORD *)(v76 + 8) = 2080;
  sub_100044540();
  sub_10002D308(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v77 = sub_1000450F0();
  uint64_t v127 = sub_1000434C0(v77, v78, v126);
  uint64_t v59 = (uint64_t)v123;
  sub_100044FA0();
  swift_bridgeObjectRelease();
  sub_10002859C(v61, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  _os_log_impl((void *)&_mh_execute_header, v73, v74, "Did user select a disambiguation? %{BOOL}d; in request %s",
    (uint8_t *)v76,
    0x12u);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  if (!v70) {
    goto LABEL_107;
  }
LABEL_77:
  uint64_t v79 = v125;
  uint64_t v80 = (uint64_t *)(v59 + *(int *)(v125 + 32));
  uint64_t v81 = *v80;
  if (!*v80)
  {
    uint64_t v84 = v118;
    sub_100028690(v59, v118, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    uint64_t v92 = sub_100044D40();
    os_log_type_t v93 = sub_100044F30();
    if (os_log_type_enabled(v92, v93))
    {
      os_log_type_t v94 = (uint8_t *)swift_slowAlloc();
      v126[0] = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v94 = 136315138;
      uint64_t v95 = sub_100044520();
      uint64_t v127 = sub_1000434C0(v95, v96, v126);
      sub_100044FA0();
      swift_bridgeObjectRelease();
      sub_10002859C(v84, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      uint64_t v97 = "No executed ControlHomeIntent found after disambiguation selection in request: %s";
LABEL_105:
      _os_log_impl((void *)&_mh_execute_header, v92, v93, v97, v94, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_107;
    }
LABEL_106:

    sub_10002859C(v84, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    goto LABEL_107;
  }
  unint64_t v82 = v80[1];
  if (!(v82 >> 62))
  {
    uint64_t v83 = *(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x10);
    sub_100013C68(v81);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v84 = (uint64_t)v119;
    if (v83) {
      goto LABEL_80;
    }
LABEL_102:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
LABEL_103:
    sub_100028690(v59, v84, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    uint64_t v92 = sub_100044D40();
    os_log_type_t v93 = sub_100044F30();
    if (os_log_type_enabled(v92, v93))
    {
      os_log_type_t v94 = (uint8_t *)swift_slowAlloc();
      v126[0] = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v94 = 136315138;
      uint64_t v113 = sub_100044520();
      uint64_t v127 = sub_1000434C0(v113, v114, v126);
      sub_100044FA0();
      swift_bridgeObjectRelease();
      sub_10002859C(v84, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      uint64_t v97 = "No resolved entity found in the ControlHomeIntent after disambiguation selection in request: %s";
      goto LABEL_105;
    }
    goto LABEL_106;
  }
  sub_100013C68(v81);
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000450C0();
  uint64_t v84 = (uint64_t)v119;
  if (!result) {
    goto LABEL_102;
  }
LABEL_80:
  if ((v82 & 0xC000000000000001) != 0)
  {
    id v85 = (id)sub_100045020();
LABEL_83:
    uint64_t v86 = v85;
    swift_bridgeObjectRelease();
    id v87 = [v86 entityIdentifier];

    if (!v87)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_103;
    }
    uint64_t v88 = sub_100044DE0();
    uint64_t v90 = v89;

    if (v82 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v91 = sub_1000450C0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v91 = *(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v91 == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v88 == *v116 && v90 == v116[1])
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v104 = sub_100045110();
        swift_bridgeObjectRelease();
        if ((v104 & 1) == 0)
        {
          uint64_t v110 = v59 + *(int *)(v79 + 20);
          uint64_t v106 = sub_100044540();
          uint64_t v107 = *(void *)(v106 - 8);
          uint64_t v108 = (uint64_t)v115;
          (*(void (**)(char *, uint64_t, uint64_t))(v107 + 16))(v115, v110, v106);
          char v109 = 0;
          goto LABEL_100;
        }
      }
      uint64_t v105 = v59 + *(int *)(v79 + 20);
      uint64_t v106 = sub_100044540();
      uint64_t v107 = *(void *)(v106 - 8);
      uint64_t v108 = (uint64_t)v115;
      (*(void (**)(char *, uint64_t, uint64_t))(v107 + 16))(v115, v105, v106);
      char v109 = 4;
LABEL_100:
      sub_10002859C(v59, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v107 + 56))(v108, 0, 1, v106);
      unint64_t v111 = v124;
      *uint64_t v124 = v109;
      uint64_t v112 = type metadata accessor for UniversalSuggestionsDisambiguationResponseExtractor.DisambiguationResponse(0);
      sub_1000285FC(v108, (uint64_t)&v111[*(int *)(v112 + 20)]);
      return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v112 - 8) + 56))(v111, 0, 1, v112);
    }
    swift_bridgeObjectRelease();
    uint64_t v98 = v117;
    sub_100028690(v59, v117, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v99 = sub_100044D40();
    os_log_type_t v100 = sub_100044F30();
    if (os_log_type_enabled(v99, v100))
    {
      uint64_t v101 = swift_slowAlloc();
      v126[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v101 = 134218242;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v127 = v91;
      sub_100044FA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_WORD *)(v101 + 12) = 2080;
      uint64_t v102 = sub_100044520();
      uint64_t v127 = sub_1000434C0(v102, v103, v126);
      sub_100044FA0();
      swift_bridgeObjectRelease();
      sub_10002859C(v98, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      _os_log_impl((void *)&_mh_execute_header, v99, v100, "Selected disambiguation resolved %ld entities indicating Everywhere was selected, which is unsupported; requestId=%s",
        (uint8_t *)v101,
        0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10002859C(v98, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
LABEL_107:
    sub_10002859C(v59, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
LABEL_30:
    uint64_t v57 = type metadata accessor for UniversalSuggestionsDisambiguationResponseExtractor.DisambiguationResponse(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v124, 1, 1, v57);
  }
  if (*(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v85 = *(id *)(v82 + 32);
    goto LABEL_83;
  }
  __break(1u);
  return result;
}

uint64_t sub_100026DB0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  os_log_type_t v94 = a3;
  uint64_t v92 = sub_100006080(&qword_100051078);
  uint64_t v5 = __chkstk_darwin(v92);
  uint64_t v91 = (char *)&v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v88 = (char *)&v87 - v7;
  uint64_t v8 = sub_100006080(&qword_100051070);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (unsigned int (*)(char *, uint64_t, uint64_t))((char *)&v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v87 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v87 - v15;
  uint64_t v17 = type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v90 = (uint64_t)&v87 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v89 = (uint64_t)&v87 - v22;
  __chkstk_darwin(v21);
  uint64_t v24 = (uint64_t)&v87 - v23;
  sub_100013FCC(a2, (uint64_t)v16, &qword_100051070);
  uint64_t v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  uint64_t v93 = v17;
  if (v25(v16, 1, v17) == 1)
  {
    sub_100017B30((uint64_t)v16, &qword_100051070);
LABEL_30:
    if (qword_100050CB8 != -1) {
LABEL_52:
    }
      swift_once();
    uint64_t v33 = sub_100044D60();
    sub_1000136A8(v33, (uint64_t)qword_100051600);
    sub_100013FCC(a2, (uint64_t)v14, &qword_100051070);
    id v34 = sub_100044D40();
    os_log_type_t v35 = sub_100044F30();
    if (os_log_type_enabled(v34, v35))
    {
      BOOL v36 = (uint8_t *)swift_slowAlloc();
      unint64_t v96 = (id *)swift_slowAlloc();
      *(_DWORD *)BOOL v36 = 136315138;
      sub_100013FCC((uint64_t)v14, (uint64_t)v11, &qword_100051070);
      if (v25((char *)v11, 1, v93) == 1)
      {
        sub_100017B30((uint64_t)v11, &qword_100051070);
        uint64_t v37 = sub_100044540();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v91, 1, 1, v37);
      }
      else
      {
        uint64_t v39 = sub_100044540();
        uint64_t v40 = *(void *)(v39 - 8);
        uint64_t v41 = v91;
        (*(void (**)(void))(v40 + 16))();
        sub_10002859C((uint64_t)v11, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v41, 0, 1, v39);
      }
      unsigned int v38 = v94;
      uint64_t v42 = sub_100044DF0();
      uint64_t v95 = sub_1000434C0(v42, v43, (uint64_t *)&v96);
      sub_100044FA0();
      swift_bridgeObjectRelease();
      sub_100017B30((uint64_t)v14, &qword_100051070);
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "The next turn is outside the response window for a disambiguation cancel; requestId=%s",
        v36,
        0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_100017B30((uint64_t)v14, &qword_100051070);

      unsigned int v38 = v94;
    }
    uint64_t v44 = type metadata accessor for UniversalSuggestionsDisambiguationResponseExtractor.DisambiguationResponse(0);
    uint64_t v45 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56);
    uint64_t v46 = v38;
    return v45(v46, 1, 1, v44);
  }
  sub_10002AF28((uint64_t)v16, v24, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  if ((sub_10002CFD4(a1, v24) & 1) == 0)
  {
    sub_10002859C(v24, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    goto LABEL_30;
  }
  uint64_t v91 = (char *)*(int *)(v93 + 36);
  uint64_t v92 = v24;
  a2 = *(void *)&v91[v24];
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v11 = (unsigned int (*)(char *, uint64_t, uint64_t))sub_1000450C0();
    if (v11) {
      goto LABEL_6;
    }
LABEL_54:
    swift_bridgeObjectRelease_n();
    if (qword_100050CB8 != -1) {
      swift_once();
    }
    uint64_t v59 = sub_100044D60();
    sub_1000136A8(v59, (uint64_t)qword_100051600);
    uint64_t v60 = v92;
    uint64_t v61 = v90;
    sub_100028690(v92, v90, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    id v62 = sub_100044D40();
    os_log_type_t v63 = sub_100044F30();
    if (os_log_type_enabled(v62, v63))
    {
      uint64_t v64 = (uint8_t *)swift_slowAlloc();
      unint64_t v96 = (id *)swift_slowAlloc();
      *(_DWORD *)uint64_t v64 = 136315138;
      sub_100044540();
      sub_10002D308(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v65 = sub_1000450F0();
      uint64_t v95 = sub_1000434C0(v65, v66, (uint64_t *)&v96);
      sub_100044FA0();
      swift_bridgeObjectRelease();
      sub_10002859C(v61, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      _os_log_impl((void *)&_mh_execute_header, v62, v63, "The next turn does not match a ControlHome task for a disambiguation cancel; requestId=%s",
        v64,
        0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      sub_10002859C(v61, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    }
    sub_10002859C(v60, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    uint64_t v67 = v94;
    uint64_t v44 = type metadata accessor for UniversalSuggestionsDisambiguationResponseExtractor.DisambiguationResponse(0);
    uint64_t v45 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56);
    uint64_t v46 = v67;
    return v45(v46, 1, 1, v44);
  }
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  if (!v11) {
    goto LABEL_54;
  }
LABEL_6:
  uint64_t v26 = 4;
  while (1)
  {
    if ((a2 & 0xC000000000000001) != 0) {
      uint64_t v27 = (char *)sub_100045020();
    }
    else {
      uint64_t v27 = (char *)*(id *)(a2 + 8 * v26);
    }
    uint64_t v14 = v27;
    uint64_t v25 = (unsigned int (*)(char *, uint64_t, uint64_t))(v26 - 3);
    if (__OFADD__(v26 - 4, 1))
    {
      __break(1u);
      goto LABEL_52;
    }
    id v28 = [v27 currentTaskName];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = sub_100044DE0();
      uint64_t v32 = v31;

      if ("HomeManaging" == (char *)-12) {
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v30 = 0;
      uint64_t v32 = 0;
      if ("HomeManaging" == (char *)-12)
      {
LABEL_21:
        if (!v32) {
          goto LABEL_28;
        }
        goto LABEL_22;
      }
    }
    if (!v32)
    {
      if ("sirikit.intent.home.ControlHomeIntent" == (char *)-16)
      {
LABEL_28:

        goto LABEL_40;
      }
      goto LABEL_8;
    }
    if (v30 == 0xD000000000000025 && "" == v32 || (sub_100045110() & 1) != 0) {
      break;
    }
LABEL_22:
    if ("sirikit.intent.home.ControlHomeIntent" != (char *)-16
      && (v30 == 0xD000000000000013 && "ome.ControlHomeIntent" == v32 || (sub_100045110() & 1) != 0))
    {
      break;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    sub_100006080(&qword_1000516E8);
    swift_arrayDestroy();

    ++v26;
    if (v25 == v11) {
      goto LABEL_54;
    }
  }

  swift_bridgeObjectRelease();
LABEL_40:
  swift_bridgeObjectRelease_n();
  uint64_t v48 = v92;
  unint64_t v49 = *(void *)&v91[v92];
  uint64_t v50 = v94;
  if (!(v49 >> 62))
  {
    uint64_t v51 = *(void *)((v49 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v51) {
      goto LABEL_42;
    }
LABEL_61:
    swift_bridgeObjectRelease();
    uint64_t v53 = _swiftEmptyArrayStorage;
LABEL_62:
    Swift::Int v68 = sub_10002C23C((uint64_t)v53);
    swift_bridgeObjectRelease();
    uint64_t v69 = sub_10002C23C((uint64_t)&off_10004D1F8);
    uint64_t v70 = sub_10002C23C((uint64_t)&off_10004D220);
    uint64_t v71 = (uint64_t)sub_10002CACC(v70);
    swift_bridgeObjectRelease();
    uint64_t v72 = sub_10002C23C((uint64_t)&off_10004D248);
    Swift::Int v73 = sub_100028338(v72, v71);
    LOBYTE(v71) = sub_100023B48(v68, v69);
    swift_bridgeObjectRelease();
    if (v71)
    {
      char v74 = sub_100023D9C(v68, v73);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v74)
      {
        uint64_t v75 = v48 + *(int *)(v93 + 20);
        uint64_t v76 = sub_100044540();
        uint64_t v77 = *(void *)(v76 - 8);
        uint64_t v78 = (uint64_t)v88;
        (*(void (**)(char *, uint64_t, uint64_t))(v77 + 16))(v88, v75, v76);
        sub_10002859C(v48, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v77 + 56))(v78, 0, 1, v76);
        *uint64_t v50 = 1;
        uint64_t v79 = type metadata accessor for UniversalSuggestionsDisambiguationResponseExtractor.DisambiguationResponse(0);
        sub_1000285FC(v78, (uint64_t)&v50[*(int *)(v79 + 20)]);
        return (*(uint64_t (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v79 - 8) + 56))(v50, 0, 1, v79);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    if (qword_100050CB8 != -1) {
      swift_once();
    }
    uint64_t v80 = sub_100044D60();
    sub_1000136A8(v80, (uint64_t)qword_100051600);
    uint64_t v81 = v89;
    sub_100028690(v48, v89, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    unint64_t v82 = sub_100044D40();
    os_log_type_t v83 = sub_100044F30();
    if (os_log_type_enabled(v82, v83))
    {
      uint64_t v84 = (uint8_t *)swift_slowAlloc();
      unint64_t v96 = (id *)swift_slowAlloc();
      *(_DWORD *)uint64_t v84 = 136315138;
      sub_100044540();
      sub_10002D308(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v85 = sub_1000450F0();
      uint64_t v95 = sub_1000434C0(v85, v86, (uint64_t *)&v96);
      sub_100044FA0();
      swift_bridgeObjectRelease();
      sub_10002859C(v81, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      _os_log_impl((void *)&_mh_execute_header, v82, v83, "The next turn flow states do not match flow states for a disambiguation cancel; requestId=%s)",
        v84,
        0xCu);
      swift_arrayDestroy();
      uint64_t v50 = v94;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      sub_10002859C(v81, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    }
    sub_10002859C(v48, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    uint64_t v44 = type metadata accessor for UniversalSuggestionsDisambiguationResponseExtractor.DisambiguationResponse(0);
    uint64_t v45 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56);
    uint64_t v46 = v50;
    return v45(v46, 1, 1, v44);
  }
  swift_bridgeObjectRetain();
  uint64_t v51 = sub_1000450C0();
  if (!v51) {
    goto LABEL_61;
  }
LABEL_42:
  unint64_t v96 = _swiftEmptyArrayStorage;
  uint64_t result = sub_10002AC24(0, v51 & ~(v51 >> 63), 0);
  if ((v51 & 0x8000000000000000) == 0)
  {
    uint64_t v52 = 0;
    uint64_t v53 = v96;
    do
    {
      if ((v49 & 0xC000000000000001) != 0) {
        id v54 = (id)sub_100045020();
      }
      else {
        id v54 = *(id *)(v49 + 8 * v52 + 32);
      }
      uint64_t v55 = v54;
      unsigned int v56 = [v54 flowStateType];

      unint64_t v96 = v53;
      uint64_t v58 = (char *)v53[2];
      unint64_t v57 = (unint64_t)v53[3];
      if ((unint64_t)v58 >= v57 >> 1)
      {
        sub_10002AC24(v57 > 1, (int64_t)(v58 + 1), 1);
        uint64_t v53 = v96;
      }
      ++v52;
      v53[2] = v58 + 1;
      *((_DWORD *)v53 + (void)v58 + 8) = v56;
    }
    while (v51 != v52);
    swift_bridgeObjectRelease();
    uint64_t v48 = v92;
    goto LABEL_62;
  }
  __break(1u);
  return result;
}

uint64_t sub_100027CA4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = &v39[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = &v39[-v9];
  uint64_t v11 = (unsigned int *)(a1 + *(int *)(v8 + 44));
  if (v11[1])
  {
    if (qword_100050CB8 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_100044D60();
    sub_1000136A8(v12, (uint64_t)qword_100051600);
    sub_100028690(a1, (uint64_t)v7, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    uint64_t v13 = sub_100044D40();
    os_log_type_t v14 = sub_100044F30();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      unint64_t v43 = (id *)swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      sub_100044540();
      sub_10002D308(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v16 = sub_1000450F0();
      uint64_t v42 = sub_1000434C0(v16, v17, (uint64_t *)&v43);
      sub_100044FA0();
      swift_bridgeObjectRelease();
      sub_10002859C((uint64_t)v7, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "The dismissal reason could not be extracted for a disambguation abandonment; requestId=%s",
        v15,
        0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_10002859C((uint64_t)v7, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    }

LABEL_25:
    uint64_t v38 = type metadata accessor for UniversalSuggestionsDisambiguationResponseExtractor.DisambiguationResponse(0);
    return (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(a2, 1, 1, v38);
  }
  uint64_t v18 = *v11;
  sub_100044980();
  uint64_t v19 = sub_100044950();
  int64_t v20 = *(void *)(v19 + 16);
  if (v20)
  {
    unsigned int v40 = v18;
    uint64_t v41 = a2;
    unint64_t v43 = _swiftEmptyArrayStorage;
    sub_10002AC44(0, v20, 0);
    uint64_t v21 = 0;
    uint64_t v22 = v43;
    uint64_t v23 = (char *)v43[2];
    do
    {
      int v24 = *(_DWORD *)(v19 + 4 * v21 + 32);
      unint64_t v43 = v22;
      unint64_t v25 = (unint64_t)v22[3];
      if ((unint64_t)v23 >= v25 >> 1)
      {
        sub_10002AC44(v25 > 1, (int64_t)(v23 + 1), 1);
        uint64_t v22 = v43;
      }
      ++v21;
      v22[2] = v23 + 1;
      *((_DWORD *)v22 + (void)v23++ + 8) = v24;
    }
    while (v20 != v21);
    swift_bridgeObjectRelease();
    a2 = v41;
    uint64_t v18 = v40;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v22 = _swiftEmptyArrayStorage;
  }
  char v26 = sub_100025958(v18, (uint64_t)v22);
  swift_bridgeObjectRelease();
  if ((v26 & 1) == 0)
  {
    if (qword_100050CB8 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_100044D60();
    sub_1000136A8(v32, (uint64_t)qword_100051600);
    sub_100028690(a1, (uint64_t)v10, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    uint64_t v33 = sub_100044D40();
    os_log_type_t v34 = sub_100044F30();
    if (os_log_type_enabled(v33, v34))
    {
      os_log_type_t v35 = (uint8_t *)swift_slowAlloc();
      unint64_t v43 = (id *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v35 = 136315138;
      sub_100044540();
      sub_10002D308(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v36 = sub_1000450F0();
      uint64_t v42 = sub_1000434C0(v36, v37, (uint64_t *)&v43);
      sub_100044FA0();
      swift_bridgeObjectRelease();
      sub_10002859C((uint64_t)v10, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "The dismissal reason does not match user dismissal reasons; requestId=%s",
        v35,
        0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_10002859C((uint64_t)v10, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    }

    goto LABEL_25;
  }
  uint64_t v27 = type metadata accessor for UniversalSuggestionsDisambiguationResponseExtractor.DisambiguationResponse(0);
  id v28 = &a2[*(int *)(v27 + 20)];
  uint64_t v29 = sub_100044540();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v28, 1, 1, v29);
  *a2 = 2;
  uint64_t v30 = *(uint64_t (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56);
  return v30(a2, 0, 1, v27);
}

uint64_t sub_100028338(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int64_t v3 = 0;
  uint64_t v15 = a2;
  uint64_t v4 = result + 56;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      int64_t v3 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v3);
      if (!v12)
      {
        int64_t v3 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v3);
        if (!v12)
        {
          int64_t v3 = v11 + 3;
          if (v11 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v12 = *(void *)(v4 + 8 * v3);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_5:
    uint64_t result = sub_100028A00(&v14, *(unsigned int *)(*(void *)(v2 + 48) + 4 * v10));
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v15;
  }
  unint64_t v12 = *(void *)(v4 + 8 * v13);
  if (v12)
  {
    int64_t v3 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v3);
    ++v13;
    if (v12) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_100028494()
{
  uint64_t v0 = sub_100044D60();
  sub_100013740(v0, qword_100051600);
  uint64_t v1 = sub_1000136A8(v0, (uint64_t)qword_100051600);
  if (qword_100050C68 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000136A8(v0, (uint64_t)qword_100052920);
  int64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t type metadata accessor for UniversalSuggestionsDisambiguationResponseExtractor.DisambiguationResponse(uint64_t a1)
{
  return sub_100013C30(a1, qword_100051C48);
}

uint64_t type metadata accessor for UniversalSuggestionDisambiguationOffered(uint64_t a1)
{
  return sub_100013C30(a1, qword_100051BB8);
}

uint64_t sub_10002859C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000285FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006080(&qword_100051078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for UniversalSuggestionItem(uint64_t a1)
{
  return sub_100013C30(a1, qword_100051B20);
}

uint64_t sub_100028690(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void *sub_1000286F8(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_1000450D0();
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

uint64_t sub_10002879C(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_1000287C8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000287F0@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_100028820@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_100028850(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_100045150();
  swift_bridgeObjectRetain();
  sub_100044E00();
  Swift::Int v8 = sub_100045180();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_100045110() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_100045110() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1000297CC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100028A00(_DWORD *a1, Swift::Int a2)
{
  uint64_t v5 = *v2;
  sub_100045150();
  sub_100045170(a2);
  Swift::Int v6 = sub_100045180();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_100029968(a2, v8, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if (*(_DWORD *)(v9 + 4 * v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(_DWORD *)(v9 + 4 * v8) != a2);
  }
  uint64_t result = 0;
  LODWORD(a2) = *(_DWORD *)(*(void *)(*v2 + 48) + 4 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_100028B20(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100044540();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_10002D308(&qword_100051758, (void (*)(uint64_t))&type metadata accessor for UUID);
  swift_bridgeObjectRetain();
  uint64_t v33 = a2;
  uint64_t v11 = sub_100044DA0();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    id v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    int v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      int64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_10002D308(&qword_100051760, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v21 = sub_100044DC0();
      uint64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      int v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    int v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    int v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_100029AB8((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_100028E44()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006080(&qword_100051748);
  uint64_t v3 = sub_100044FE0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_100045150();
      sub_100044E00();
      uint64_t result = sub_100045180();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_100029124()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006080(&qword_100051708);
  uint64_t result = sub_100044FE0();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v26;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      Swift::UInt32 v18 = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v14);
      sub_100045150();
      sub_100045170(v18);
      uint64_t result = sub_100045180();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_DWORD *)(*(void *)(v4 + 48) + 4 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_1000293D0()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_100044540();
  uint64_t v2 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  sub_100006080(&qword_100051768);
  uint64_t v5 = sub_100044FE0();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    unint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    os_log_type_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    unint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_10002D308(&qword_100051758, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t result = sub_100044DA0();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v6;
  return result;
}

Swift::Int sub_1000297CC(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_100028E44();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100029D58();
      goto LABEL_22;
    }
    sub_10002A348();
  }
  uint64_t v11 = *v4;
  sub_100045150();
  sub_100044E00();
  uint64_t result = sub_100045180();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_100045110(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_100045130();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        unint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_100045110();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  int64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *int64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

Swift::Int sub_100029968(Swift::Int result, unint64_t a2, char a3)
{
  Swift::UInt32 v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100029124();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (Swift::Int)sub_100029F0C();
      goto LABEL_14;
    }
    sub_10002A5F8();
  }
  uint64_t v8 = *v3;
  sub_100045150();
  sub_100045170(v5);
  uint64_t result = sub_100045180();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(_DWORD *)(v10 + 4 * a2) == v5)
    {
LABEL_13:
      type metadata accessor for FLOWSchemaFLOWStateType();
      uint64_t result = sub_100045130();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(_DWORD *)(v10 + 4 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_DWORD *)(*(void *)(v12 + 48) + 4 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

uint64_t sub_100029AB8(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_100044540();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_1000293D0();
  }
  else
  {
    if (v11 > v10)
    {
      sub_10002A0A4();
      goto LABEL_12;
    }
    sub_10002A874();
  }
  uint64_t v12 = *v3;
  sub_10002D308(&qword_100051758, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v13 = sub_100044DA0();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_10002D308(&qword_100051760, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v21 = sub_100044DC0();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_100045130();
  __break(1u);
  return result;
}

void *sub_100029D58()
{
  uint64_t v1 = v0;
  sub_100006080(&qword_100051748);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100044FD0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    int64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_100029F0C()
{
  uint64_t v1 = v0;
  sub_100006080(&qword_100051708);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100044FD0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_DWORD *)(*(void *)(v4 + 48) + 4 * v15) = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_10002A0A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100044540();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  Swift::UInt32 v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006080(&qword_100051768);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_100044FD0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v8;
    return result;
  }
  int64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_10002A348()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006080(&qword_100051748);
  uint64_t v3 = sub_100044FE0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_100045150();
    swift_bridgeObjectRetain();
    sub_100044E00();
    uint64_t result = sub_100045180();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10002A5F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006080(&qword_100051708);
  uint64_t result = sub_100044FE0();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    Swift::UInt32 v18 = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v14);
    sub_100045150();
    sub_100045170(v18);
    uint64_t result = sub_100045180();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_DWORD *)(*(void *)(v4 + 48) + 4 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10002A874()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100044540();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  int64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_100006080(&qword_100051768);
  uint64_t v7 = sub_100044FE0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_10002D308(&qword_100051758, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = sub_100044DA0();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10002AC24(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002AC64(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10002AC44(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002ADC4(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10002AC64(char a1, int64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100006080(&qword_100051720);
    uint64_t v10 = (id *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    void v10[2] = (id)v8;
    v10[3] = (id)(2 * (v12 >> 2));
  }
  else
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
  uint64_t v13 = (char *)(v10 + 4);
  unint64_t v14 = (char *)(a4 + 32);
  if (a1)
  {
    if (v10 != (id *)a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *(void *)(a4 + 16) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1000450D0();
  __break(1u);
  return result;
}

uint64_t sub_10002ADC4(char a1, int64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100006080(&qword_100051700);
    uint64_t v10 = (id *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    void v10[2] = (id)v8;
    v10[3] = (id)(2 * (v12 >> 2));
  }
  else
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
  uint64_t v13 = (char *)(v10 + 4);
  unint64_t v14 = (char *)(a4 + 32);
  if (a1)
  {
    if (v10 != (id *)a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *(void *)(a4 + 16) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1000450D0();
  __break(1u);
  return result;
}

uint64_t sub_10002AF28(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_10002AF90(uint64_t a1, uint64_t a2)
{
  sub_100045150();
  sub_100044E00();
  Swift::Int v4 = sub_100045180();
  return sub_10002B008(a1, a2, v4);
}

unint64_t sub_10002B008(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100045110() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100045110() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10002B0EC(uint64_t result)
{
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v11 >= v7) {
      goto LABEL_24;
    }
    unint64_t v12 = *(void *)(v3 + 8 * v11);
    ++v8;
    if (!v12)
    {
      int64_t v8 = v11 + 1;
      if (v11 + 1 >= v7) {
        goto LABEL_24;
      }
      unint64_t v12 = *(void *)(v3 + 8 * v8);
      if (!v12)
      {
        int64_t v8 = v11 + 2;
        if (v11 + 2 >= v7) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v8);
        if (!v12)
        {
          int64_t v8 = v11 + 3;
          if (v11 + 3 >= v7) {
            goto LABEL_24;
          }
          unint64_t v12 = *(void *)(v3 + 8 * v8);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_6:
    uint64_t result = sub_10002B610(*(_DWORD *)(*(void *)(v2 + 48) + 4 * v10));
  }
  int64_t v13 = v11 + 4;
  if (v13 < v7)
  {
    unint64_t v12 = *(void *)(v3 + 8 * v13);
    if (!v12)
    {
      while (1)
      {
        int64_t v8 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v8);
        ++v13;
        if (v12) {
          goto LABEL_23;
        }
      }
    }
    int64_t v8 = v13;
    goto LABEL_23;
  }
LABEL_24:
  return swift_release();
}

void *sub_10002B260(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (*(void *)(a2 + 16))
  {
    int64_t v4 = 0;
    uint64_t v6 = a1 + 56;
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v32 = ~v7;
    if (-v7 < 64) {
      uint64_t v8 = ~(-1 << -(char)v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & v5;
    int64_t v10 = (unint64_t)(63 - v7) >> 6;
    uint64_t v11 = a2 + 56;
    while (1)
    {
      do
      {
        if (v9)
        {
          unint64_t v12 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          unint64_t v13 = v12 | (v4 << 6);
        }
        else
        {
          int64_t v14 = v4 + 1;
          if (__OFADD__(v4, 1))
          {
            __break(1u);
            goto LABEL_37;
          }
          if (v14 >= v10) {
            goto LABEL_35;
          }
          unint64_t v15 = *(void *)(v6 + 8 * v14);
          int64_t v16 = v4 + 1;
          if (!v15)
          {
            int64_t v16 = v4 + 2;
            if (v4 + 2 >= v10) {
              goto LABEL_35;
            }
            unint64_t v15 = *(void *)(v6 + 8 * v16);
            if (!v15)
            {
              int64_t v16 = v4 + 3;
              if (v4 + 3 >= v10) {
                goto LABEL_35;
              }
              unint64_t v15 = *(void *)(v6 + 8 * v16);
              if (!v15)
              {
                int64_t v16 = v4 + 4;
                if (v4 + 4 >= v10) {
                  goto LABEL_35;
                }
                unint64_t v15 = *(void *)(v6 + 8 * v16);
                if (!v15)
                {
                  int64_t v17 = v4 + 5;
                  if (v4 + 5 >= v10)
                  {
LABEL_35:
                    swift_bridgeObjectRetain();
                    sub_10002D260();
                    return (void *)v2;
                  }
                  unint64_t v15 = *(void *)(v6 + 8 * v17);
                  if (!v15)
                  {
                    while (1)
                    {
                      int64_t v16 = v17 + 1;
                      if (__OFADD__(v17, 1)) {
                        break;
                      }
                      if (v16 >= v10) {
                        goto LABEL_35;
                      }
                      unint64_t v15 = *(void *)(v6 + 8 * v16);
                      ++v17;
                      if (v15) {
                        goto LABEL_23;
                      }
                    }
LABEL_37:
                    __break(1u);
                  }
                  int64_t v16 = v4 + 5;
                }
              }
            }
          }
LABEL_23:
          unint64_t v9 = (v15 - 1) & v15;
          unint64_t v13 = __clz(__rbit64(v15)) + (v16 << 6);
          int64_t v4 = v16;
        }
        Swift::UInt32 v18 = *(_DWORD *)(*(void *)(a1 + 48) + 4 * v13);
        sub_100045150();
        sub_100045170(v18);
        Swift::Int v19 = sub_100045180();
        uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v21 = v19 & ~v20;
      }
      while (((*(void *)(v11 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0);
      uint64_t v22 = *(void *)(v2 + 48);
      if (*(_DWORD *)(v22 + 4 * v21) == v18) {
        break;
      }
      while (1)
      {
        unint64_t v21 = (v21 + 1) & ~v20;
        if (((*(void *)(v11 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
          break;
        }
        if (*(_DWORD *)(v22 + 4 * v21) == v18) {
          goto LABEL_28;
        }
      }
    }
LABEL_28:
    v33[0] = a1;
    v33[1] = v6;
    v33[2] = v32;
    v33[3] = v4;
    v33[4] = v9;
    unint64_t v23 = (unint64_t)(63 - v20) >> 6;
    size_t v24 = 8 * v23;
    uint64_t isStackAllocationSafe = swift_bridgeObjectRetain();
    if (v23 < 0x81 || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
    {
      __chkstk_darwin(isStackAllocationSafe);
      unint64_t v27 = (char *)&v31 - v26;
      memcpy((char *)&v31 - v26, (const void *)(v2 + 56), v24);
      Swift::Int v28 = sub_10002B740((Swift::Int)v27, v23, v2, v21, v33);
      swift_release();
      sub_10002D260();
    }
    else
    {
      char v29 = (void *)swift_slowAlloc();
      memcpy(v29, (const void *)(v2 + 56), v24);
      Swift::Int v28 = sub_10002B740((Swift::Int)v29, v23, v2, v21, v33);
      swift_release();
      sub_10002D260();
      swift_slowDealloc();
    }
    return (void *)v28;
  }
  else
  {
    swift_release();
    return &_swiftEmptySetSingleton;
  }
}

unint64_t sub_10002B610(Swift::UInt32 a1)
{
  uint64_t v3 = *v1;
  sub_100045150();
  sub_100045170(a1);
  Swift::Int v4 = sub_100045180();
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = v4 & ~v5;
  if (((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_9:
    uint64_t v11 = 0;
    unsigned __int8 v12 = 1;
    return v11 | ((unint64_t)v12 << 32);
  }
  uint64_t v7 = *(void *)(v3 + 48);
  if (*(_DWORD *)(v7 + 4 * v6) != a1)
  {
    uint64_t v8 = ~v5;
    do
    {
      unint64_t v6 = (v6 + 1) & v8;
      if (((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_9;
      }
    }
    while (*(_DWORD *)(v7 + 4 * v6) != a1);
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v1;
  uint64_t v14 = *v1;
  *uint64_t v1 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100029F0C();
    uint64_t v10 = v14;
  }
  uint64_t v11 = *(unsigned int *)(*(void *)(v10 + 48) + 4 * v6);
  sub_10002BC0C(v6);
  *uint64_t v1 = v14;
  swift_bridgeObjectRelease();
  unsigned __int8 v12 = 0;
  return v11 | ((unint64_t)v12 << 32);
}

Swift::Int sub_10002B740(Swift::Int result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = (unint64_t *)result;
  uint64_t v8 = *(void *)(a3 + 16);
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v9 = v8 - 1;
  uint64_t v10 = a3 + 56;
  while (1)
  {
    int64_t v15 = a5[3];
    unint64_t v16 = a5[4];
    if (!v16) {
      break;
    }
    uint64_t v17 = (v16 - 1) & v16;
    unint64_t v18 = __clz(__rbit64(v16)) | (v15 << 6);
LABEL_22:
    Swift::UInt32 v25 = *(_DWORD *)(*(void *)(*a5 + 48) + 4 * v18);
    a5[3] = v15;
    a5[4] = v17;
    sub_100045150();
    sub_100045170(v25);
    uint64_t result = sub_100045180();
    uint64_t v26 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v27 = result & ~v26;
    uint64_t v11 = v27 >> 6;
    uint64_t v12 = 1 << v27;
    if (((1 << v27) & *(void *)(v10 + 8 * (v27 >> 6))) != 0)
    {
      uint64_t v28 = *(void *)(a3 + 48);
      if (*(_DWORD *)(v28 + 4 * v27) == v25)
      {
LABEL_3:
        uint64_t v13 = v11;
        unint64_t v14 = v7[v11];
        v7[v13] = v14 & ~v12;
        if ((v12 & v14) != 0)
        {
          if (__OFSUB__(v9--, 1)) {
            goto LABEL_34;
          }
          if (!v9) {
            return (Swift::Int)&_swiftEmptySetSingleton;
          }
        }
      }
      else
      {
        for (unint64_t i = v27 + 1; ; unint64_t i = v30 + 1)
        {
          unint64_t v30 = i & ~v26;
          if (((*(void *)(v10 + ((v30 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v30) & 1) == 0) {
            break;
          }
          if (*(_DWORD *)(v28 + 4 * v30) == v25)
          {
            uint64_t v11 = v30 >> 6;
            uint64_t v12 = 1 << v30;
            goto LABEL_3;
          }
        }
      }
    }
  }
  int64_t v19 = v15 + 1;
  if (!__OFADD__(v15, 1))
  {
    int64_t v20 = (unint64_t)(a5[2] + 64) >> 6;
    int64_t v21 = a5[3];
    if (v19 >= v20) {
      goto LABEL_31;
    }
    uint64_t v22 = a5[1];
    unint64_t v23 = *(void *)(v22 + 8 * v19);
    if (!v23)
    {
      int64_t v21 = v15 + 1;
      if (v15 + 2 >= v20) {
        goto LABEL_31;
      }
      unint64_t v23 = *(void *)(v22 + 8 * (v15 + 2));
      if (v23)
      {
        int64_t v19 = v15 + 2;
      }
      else
      {
        int64_t v21 = v15 + 2;
        if (v15 + 3 >= v20) {
          goto LABEL_31;
        }
        unint64_t v23 = *(void *)(v22 + 8 * (v15 + 3));
        if (v23)
        {
          int64_t v19 = v15 + 3;
        }
        else
        {
          int64_t v19 = v15 + 4;
          int64_t v21 = v15 + 3;
          if (v15 + 4 >= v20) {
            goto LABEL_31;
          }
          unint64_t v23 = *(void *)(v22 + 8 * v19);
          if (!v23)
          {
            int64_t v21 = v20 - 1;
            int64_t v24 = v15 + 5;
            while (v20 != v24)
            {
              unint64_t v23 = *(void *)(v22 + 8 * v24++);
              if (v23)
              {
                int64_t v19 = v24 - 1;
                goto LABEL_21;
              }
            }
LABEL_31:
            a5[3] = v21;
            a5[4] = 0;
            swift_retain();
            return sub_10002B9A0(v7, a2, v9, a3);
          }
        }
      }
    }
LABEL_21:
    uint64_t v17 = (v23 - 1) & v23;
    unint64_t v18 = __clz(__rbit64(v23)) + (v19 << 6);
    int64_t v15 = v19;
    goto LABEL_22;
  }
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_10002B9A0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_100006080(&qword_100051708);
  uint64_t result = sub_100044FF0();
  uint64_t v9 = (unsigned char *)result;
  uint64_t v28 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v28[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v28[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    Swift::UInt32 v18 = *(_DWORD *)(*(void *)(v4 + 48) + 4 * v14);
    sub_100045150();
    sub_100045170(v18);
    uint64_t result = sub_100045180();
    uint64_t v19 = -1 << v9[32];
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_DWORD *)(*((void *)v9 + 6) + 4 * v22) = v18;
    ++*((void *)v9 + 2);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v28[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

unint64_t sub_10002BC0C(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_100044FC0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::UInt32 v10 = *(_DWORD *)(*(void *)(v3 + 48) + 4 * v6);
        sub_100045150();
        sub_100045170(v10);
        unint64_t v11 = sub_100045180() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          unint64_t v13 = (_DWORD *)(v12 + 4 * v2);
          unint64_t v14 = (_DWORD *)(v12 + 4 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            _DWORD *v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_10002BDB8()
{
  uint64_t v0 = sub_1000445E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006080(&qword_100051730);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000445A0();
  uint64_t v7 = sub_100044650();
  swift_release();
  if (!*(void *)(v7 + 16)) {
    goto LABEL_16;
  }
  unint64_t v8 = sub_10002AF90(0x73656D616ELL, 0xE500000000000000);
  if ((v9 & 1) == 0) {
    goto LABEL_16;
  }
  unint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_1000450C0();
    uint64_t result = swift_bridgeObjectRelease();
    if (v24) {
      goto LABEL_5;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_16;
  }
LABEL_5:
  if ((v10 & 0xC000000000000001) != 0)
  {
    sub_100045020();
  }
  else
  {
    if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    swift_retain();
  }
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_100044640();
  swift_release();
  uint64_t v13 = *(void *)(v12 + 16);
  if (!v13)
  {
    uint64_t v23 = 1;
    goto LABEL_22;
  }
  uint64_t v26 = v6;
  uint64_t v27 = v1;
  BOOL v16 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
  uint64_t v15 = v1 + 16;
  unint64_t v14 = v16;
  unint64_t v17 = v12 + ((*(unsigned __int8 *)(v15 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 64));
  uint64_t v18 = *(void *)(v15 + 56);
  v25[1] = v12;
  swift_bridgeObjectRetain();
  char v29 = "homeAutomationAccessoryType";
  unint64_t v28 = 0x8000000100046A60;
  while (1)
  {
    v14(v3, v17, v0);
    uint64_t v20 = sub_1000445D0();
    if (!v21) {
      goto LABEL_11;
    }
    if (v20 == 0xD000000000000012 && v21 == v28) {
      break;
    }
    char v19 = sub_100045110();
    swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_21;
    }
LABEL_11:
    (*(void (**)(char *, uint64_t))(v15 - 8))(v3, v0);
    v17 += v18;
    if (!--v13)
    {
      swift_bridgeObjectRelease();
      uint64_t v23 = 1;
      unint64_t v6 = v26;
      uint64_t v1 = v27;
      goto LABEL_22;
    }
  }
  swift_bridgeObjectRelease();
LABEL_21:
  swift_bridgeObjectRelease();
  unint64_t v6 = v26;
  uint64_t v1 = v27;
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v26, v3, v0);
  uint64_t v23 = 0;
LABEL_22:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v6, v23, 1, v0);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v6, 1, v0) == 1)
  {
    sub_100017B30((uint64_t)v6, &qword_100051730);
    return 0;
  }
  else
  {
    uint64_t v22 = sub_1000445C0();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  }
  return v22;
}

uint64_t sub_10002C1A4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_100044F10();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_100028850(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_10002C23C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  type metadata accessor for FLOWSchemaFLOWStateType();
  sub_10002D308(&qword_100051718, (void (*)(uint64_t))type metadata accessor for FLOWSchemaFLOWStateType);
  uint64_t result = sub_100044F10();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = (unsigned int *)(a1 + 32);
    do
    {
      unsigned int v5 = *v4++;
      sub_100028A00(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_10002C2E8(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (!v4 && (sub_100045110() & 1) == 0) {
    return 0;
  }
  char v5 = *(unsigned char *)(a2 + 24);
  if (*(unsigned char *)(a1 + 24))
  {
    if (!*(unsigned char *)(a2 + 24)) {
      return 0;
    }
  }
  else
  {
    if (*(double *)(a1 + 16) != *(double *)(a2 + 16)) {
      char v5 = 1;
    }
    if (v5) {
      return 0;
    }
  }
  type metadata accessor for UniversalSuggestionItem(0);
  if ((sub_100044530() & 1) == 0) {
    return 0;
  }
  return sub_100044A60();
}

uint64_t sub_10002C3B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100044850();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v44 = v4;
  uint64_t v45 = v5;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  unint64_t v11 = (char *)&v40 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v40 - v12;
  uint64_t v14 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
  __chkstk_darwin(v14 - 8);
  BOOL v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100006080(&qword_100051750);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v20 = (char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = (uint64_t)&v20[*(int *)(v18 + 56)];
  sub_100028690(a1, (uint64_t)v20, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
  sub_100028690(a2, v21, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
  uint64_t v22 = sub_100006080(&qword_100050FD0);
  uint64_t v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 48);
  int v24 = v23(v20, 2, v22);
  if (!v24)
  {
    uint64_t v41 = v8;
    uint64_t v42 = v11;
    unint64_t v43 = v13;
    uint64_t v25 = v45;
    sub_100028690((uint64_t)v20, (uint64_t)v16, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
    uint64_t v26 = *(int *)(v22 + 48);
    uint64_t v27 = &v16[v26];
    if (!v23((char *)v21, 2, v22))
    {
      uint64_t v32 = v21 + v26;
      uint64_t v33 = v25;
      uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 32);
      int64_t v36 = v43;
      uint64_t v35 = v44;
      v34(v43, v21, v44);
      uint64_t v37 = v42;
      v34(v42, (uint64_t)v27, v35);
      uint64_t v38 = v41;
      v34(v41, v32, v35);
      LOBYTE(v32) = sub_100044830();
      uint64_t v39 = *(void (**)(char *, uint64_t))(v33 + 8);
      v39(v16, v35);
      if (v32)
      {
        char v30 = sub_100044830();
        v39(v38, v35);
        v39(v37, v35);
        v39(v36, v35);
        sub_10002859C((uint64_t)v20, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
        return v30 & 1;
      }
      v39(v38, v35);
      v39(v37, v35);
      v39(v36, v35);
      sub_10002859C((uint64_t)v20, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
      goto LABEL_10;
    }
    unint64_t v28 = *(void (**)(char *, uint64_t))(v25 + 8);
    uint64_t v29 = v44;
    v28(v27, v44);
    v28(v16, v29);
    goto LABEL_9;
  }
  if (v24 != 1)
  {
    if (v23((char *)v21, 2, v22) == 2) {
      goto LABEL_8;
    }
LABEL_9:
    sub_100017B30((uint64_t)v20, &qword_100051750);
LABEL_10:
    char v30 = 0;
    return v30 & 1;
  }
  if (v23((char *)v21, 2, v22) != 1) {
    goto LABEL_9;
  }
LABEL_8:
  sub_10002859C((uint64_t)v20, type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState);
  char v30 = 1;
  return v30 & 1;
}

uint64_t sub_10002C824(uint64_t a1)
{
  uint64_t v2 = sub_100044540();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v28 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v27 = (char *)v21 - v6;
  uint64_t v7 = sub_100006080(&qword_100051078);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a1 + 16);
  sub_10002D308(&qword_100051758, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v29 = sub_100044F10();
  if (v10)
  {
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v13 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v14 = *(void *)(v11 + 56);
    unint64_t v15 = v11 + 40;
    int v24 = (unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 32);
    uint64_t v25 = v12;
    uint64_t v22 = (void (**)(char *, char *, uint64_t))(v11 + 16);
    uint64_t v23 = v14;
    uint64_t v26 = v11;
    BOOL v16 = (void (**)(uint64_t, uint64_t))(v11 - 8);
    v21[1] = v15 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v18 = (uint64_t)v27;
    uint64_t v17 = v28;
    while (1)
    {
      v25(v9, v13, v2);
      uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))v15;
      (*(void (**)(char *, void, uint64_t, uint64_t))v15)(v9, 0, 1, v2);
      if ((*v24)(v9, 1, v2) == 1) {
        break;
      }
      (*v22)(v17, v9, v2);
      sub_100028B20(v18, v17);
      (*v16)(v18, v2);
      v13 += v23;
      if (!--v10) {
        goto LABEL_7;
      }
    }
  }
  else
  {
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
LABEL_7:
    v19(v9, 1, 1, v2);
  }
  return v29;
}

void *sub_10002CACC(uint64_t a1)
{
  if (qword_100050CA8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_100052990;
  uint64_t v3 = qword_100050CB0;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_100050C98;
  swift_bridgeObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_100050CA0;
  swift_bridgeObjectRetain();
  if (v5 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000257FC(v2);
  uint64_t v6 = swift_bridgeObjectRetain();
  sub_1000257FC(v6);
  uint64_t v7 = swift_bridgeObjectRetain();
  sub_1000257FC(v7);
  uint64_t v8 = swift_bridgeObjectRetain();
  sub_1000257FC(v8);
  sub_100006080(&qword_100051710);
  swift_arrayDestroy();
  if (*(void *)(a1 + 16) > _swiftEmptySetSingleton[2] >> 3) {
    return sub_10002B260(a1, (uint64_t)_swiftEmptySetSingleton);
  }
  sub_10002B0EC(a1);
  return _swiftEmptySetSingleton;
}

uint64_t sub_10002CCC4(uint64_t a1, void *a2)
{
  uint64_t v29 = a2;
  uint64_t v3 = type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  unint64_t v4 = *(void *)(a1 + *(int *)(v3 + 36));
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1000450C0();
    if (v5) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    uint64_t v8 = _swiftEmptyArrayStorage;
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_3:
  char v30 = _swiftEmptyArrayStorage;
  uint64_t v6 = &v30;
  sub_10002AC24(0, v5 & ~(v5 >> 63), 0);
  if (v5 < 0)
  {
    __break(1u);
    goto LABEL_33;
  }
  uint64_t v7 = 0;
  uint64_t v8 = v30;
  do
  {
    if ((v4 & 0xC000000000000001) != 0) {
      id v9 = (id)sub_100045020();
    }
    else {
      id v9 = *(id *)(v4 + 8 * v7 + 32);
    }
    uint64_t v10 = v9;
    unsigned int v11 = objc_msgSend(v9, "flowStateType", v29);

    char v30 = v8;
    uint64_t v13 = (char *)v8[2];
    unint64_t v12 = (unint64_t)v8[3];
    if ((unint64_t)v13 >= v12 >> 1)
    {
      sub_10002AC24(v12 > 1, (int64_t)(v13 + 1), 1);
      uint64_t v8 = v30;
    }
    ++v7;
    _OWORD v8[2] = v13 + 1;
    *((_DWORD *)v8 + (void)v13 + 8) = v11;
  }
  while (v5 != v7);
  swift_bridgeObjectRelease();
LABEL_14:
  Swift::Int v14 = sub_10002C23C((uint64_t)v8);
  swift_bridgeObjectRelease();
  uint64_t v15 = sub_10002C23C((uint64_t)&off_10004D108);
  BOOL v16 = sub_10002CACC((uint64_t)_swiftEmptySetSingleton);
  char v17 = sub_100023B48(v14, v15);
  swift_bridgeObjectRelease();
  if ((v17 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  char v18 = sub_100023D9C(v14, (Swift::Int)v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0) {
    goto LABEL_29;
  }
  uint64_t v19 = (void *)(a1 + *(int *)(v3 + 32));
  if (!*v19) {
    goto LABEL_29;
  }
  uint64_t v6 = (id **)v19[1];
  a1 = (unint64_t)v6 & 0xFFFFFFFFFFFFFF8;
  if (!((unint64_t)v6 >> 62))
  {
    uint64_t v20 = *(void *)(((unint64_t)v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v20) {
      goto LABEL_19;
    }
LABEL_27:
    char v28 = 0;
LABEL_28:
    swift_bridgeObjectRelease();
    return v28 & 1;
  }
LABEL_33:
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000450C0();
  if (!result) {
    goto LABEL_27;
  }
LABEL_19:
  if (((unint64_t)v6 & 0xC000000000000001) != 0)
  {
    uint64_t v22 = (id *)sub_100045020();
LABEL_22:
    uint64_t v23 = v22;
    swift_bridgeObjectRelease();
    id v24 = [v23 entityIdentifier];

    if (v24)
    {
      uint64_t v25 = sub_100044DE0();
      uint64_t v27 = v26;

      if (v25 == *v29 && v27 == v29[1]) {
        char v28 = 1;
      }
      else {
        char v28 = sub_100045110();
      }
      goto LABEL_28;
    }
LABEL_29:
    char v28 = 0;
    return v28 & 1;
  }
  if (*(void *)(a1 + 16))
  {
    uint64_t v22 = v6[4];
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_10002CFD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006080(&qword_100051088);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  id v9 = (char *)&v22 - v8;
  uint64_t v10 = type metadata accessor for UniversalSuggestionsPromptState(0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  Swift::Int v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  BOOL v16 = (char *)&v22 - v15;
  uint64_t v17 = type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  sub_100013FCC(a1 + *(int *)(v17 + 40), (uint64_t)v9, &qword_100051088);
  char v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v18(v9, 1, v10) == 1)
  {
    uint64_t v19 = (uint64_t)v9;
  }
  else
  {
    sub_10002AF28((uint64_t)v9, (uint64_t)v16, type metadata accessor for UniversalSuggestionsPromptState);
    sub_100013FCC(a2 + *(int *)(v17 + 40), (uint64_t)v7, &qword_100051088);
    if (v18(v7, 1, v10) != 1)
    {
      sub_10002AF28((uint64_t)v7, (uint64_t)v14, type metadata accessor for UniversalSuggestionsPromptState);
      char v20 = sub_100044530();
      sub_10002859C((uint64_t)v14, type metadata accessor for UniversalSuggestionsPromptState);
      sub_10002859C((uint64_t)v16, type metadata accessor for UniversalSuggestionsPromptState);
      return v20 & 1;
    }
    sub_10002859C((uint64_t)v16, type metadata accessor for UniversalSuggestionsPromptState);
    uint64_t v19 = (uint64_t)v7;
  }
  sub_100017B30(v19, &qword_100051088);
  char v20 = 0;
  return v20 & 1;
}

uint64_t sub_10002D260()
{
  return swift_release();
}

uint64_t type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(uint64_t a1)
{
  return sub_100013C30(a1, (uint64_t *)&unk_100051AB8);
}

uint64_t type metadata accessor for UniversalSuggestionRequestTaskState(uint64_t a1)
{
  return sub_100013C30(a1, (uint64_t *)&unk_100051A08);
}

uint64_t type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(uint64_t a1)
{
  return sub_100013C30(a1, qword_100051978);
}

uint64_t type metadata accessor for UniversalSuggestionCorrectionDiscovered(uint64_t a1)
{
  return sub_100013C30(a1, (uint64_t *)&unk_1000517C8);
}

uint64_t type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(uint64_t a1)
{
  return sub_100013C30(a1, (uint64_t *)&unk_100051910);
}

uint64_t sub_10002D308(unint64_t *a1, void (*a2)(uint64_t))
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

char *sub_10002D350(char *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100044540();
    uint64_t v8 = *(void *)(v7 - 8);
    id v9 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = &a1[v10];
    uint64_t v12 = &a2[v10];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(&a2[v10], 1, v7))
    {
      uint64_t v13 = sub_100006080(&qword_100051078);
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      v9(v11, v12, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v11, 0, 1, v7);
    }
    uint64_t v15 = *(int *)(a3 + 24);
    BOOL v16 = &a1[v15];
    uint64_t v17 = &a2[v15];
    uint64_t v18 = sub_100006080(&qword_100050FD0);
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 2, v18))
    {
      uint64_t v20 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
      memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      uint64_t v21 = sub_100044850();
      uint64_t v22 = *(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16);
      v22(v16, v17, v21);
      v22(&v16[*(int *)(v18 + 48)], &v17[*(int *)(v18 + 48)], v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 2, v18);
    }
  }
  return a1;
}

uint64_t sub_10002D618(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100044540();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  uint64_t v7 = a1 + *(int *)(a2 + 20);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4)) {
    v6(v7, v4);
  }
  uint64_t v8 = a1 + *(int *)(a2 + 24);
  uint64_t v9 = sub_100006080(&qword_100050FD0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 2, v9);
  if (!result)
  {
    uint64_t v11 = sub_100044850();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
    ((void (*)(void *__return_ptr, uint64_t, uint64_t))v13)((void *)(v11 - 8), v8, v11);
    uint64_t v12 = v8 + *(int *)(v9 + 48);
    return v13(v12, v11);
  }
  return result;
}

uint64_t sub_10002D7D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a2 + v9, 1, v6))
  {
    uint64_t v12 = sub_100006080(&qword_100051078);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    v8((uint64_t)v10, (uint64_t)v11, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (char *)(a1 + v13);
  uint64_t v15 = (char *)(a2 + v13);
  uint64_t v16 = sub_100006080(&qword_100050FD0);
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 2, v16))
  {
    uint64_t v18 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    uint64_t v19 = sub_100044850();
    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
    v20(v14, v15, v19);
    v20(&v14[*(int *)(v16 + 48)], &v15[*(int *)(v16 + 48)], v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 2, v16);
  }
  return a1;
}

uint64_t sub_10002DA50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  uint64_t v30 = a3;
  uint64_t v31 = a1;
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v13 = v12(v10, 1, v6);
  int v14 = v12(v11, 1, v6);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 16))(v10, v11, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v7 + 8))(v10, v6);
LABEL_6:
    uint64_t v15 = sub_100006080(&qword_100051078);
    memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  v8((uint64_t)v10, (uint64_t)v11, v6);
LABEL_7:
  uint64_t v16 = *(int *)(v30 + 24);
  uint64_t v17 = (char *)(v31 + v16);
  uint64_t v18 = (char *)(a2 + v16);
  uint64_t v19 = sub_100006080(&qword_100050FD0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 2, v19);
  int v23 = v21(v18, 2, v19);
  if (!v22)
  {
    if (!v23)
    {
      uint64_t v28 = sub_100044850();
      uint64_t v29 = *(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 24);
      v29(v17, v18, v28);
      v29(&v17[*(int *)(v19 + 48)], &v18[*(int *)(v19 + 48)], v28);
      return v31;
    }
    sub_100017B30((uint64_t)v17, &qword_100050FD0);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    uint64_t v26 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
    memcpy(v17, v18, *(void *)(*(void *)(v26 - 8) + 64));
    return v31;
  }
  uint64_t v24 = sub_100044850();
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16);
  v25(v17, v18, v24);
  v25(&v17[*(int *)(v19 + 48)], &v18[*(int *)(v19 + 48)], v24);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 2, v19);
  return v31;
}

uint64_t sub_10002DDCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a2 + v9, 1, v6))
  {
    uint64_t v12 = sub_100006080(&qword_100051078);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    v8((uint64_t)v10, (uint64_t)v11, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  uint64_t v13 = *(int *)(a3 + 24);
  int v14 = (char *)(a1 + v13);
  uint64_t v15 = (char *)(a2 + v13);
  uint64_t v16 = sub_100006080(&qword_100050FD0);
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 2, v16))
  {
    uint64_t v18 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    uint64_t v19 = sub_100044850();
    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32);
    v20(v14, v15, v19);
    v20(&v14[*(int *)(v16 + 48)], &v15[*(int *)(v16 + 48)], v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 2, v16);
  }
  return a1;
}

uint64_t sub_10002E044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  uint64_t v30 = a3;
  uint64_t v31 = a1;
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v13 = v12(v10, 1, v6);
  int v14 = v12(v11, 1, v6);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 32))(v10, v11, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v7 + 8))(v10, v6);
LABEL_6:
    uint64_t v15 = sub_100006080(&qword_100051078);
    memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  v8((uint64_t)v10, (uint64_t)v11, v6);
LABEL_7:
  uint64_t v16 = *(int *)(v30 + 24);
  uint64_t v17 = (char *)(v31 + v16);
  uint64_t v18 = (char *)(a2 + v16);
  uint64_t v19 = sub_100006080(&qword_100050FD0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 2, v19);
  int v23 = v21(v18, 2, v19);
  if (!v22)
  {
    if (!v23)
    {
      uint64_t v28 = sub_100044850();
      uint64_t v29 = *(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 40);
      v29(v17, v18, v28);
      v29(&v17[*(int *)(v19 + 48)], &v18[*(int *)(v19 + 48)], v28);
      return v31;
    }
    sub_100017B30((uint64_t)v17, &qword_100050FD0);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    uint64_t v26 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
    memcpy(v17, v18, *(void *)(*(void *)(v26 - 8) + 64));
    return v31;
  }
  uint64_t v24 = sub_100044850();
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32);
  v25(v17, v18, v24);
  v25(&v17[*(int *)(v19 + 48)], &v18[*(int *)(v19 + 48)], v24);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 2, v19);
  return v31;
}

uint64_t sub_10002E3C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002E3D4);
}

uint64_t sub_10002E3D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100006080(&qword_100051078);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);
  return v15(v17, a2, v16);
}

uint64_t sub_10002E524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002E538);
}

uint64_t sub_10002E538(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100044540();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_100006080(&qword_100051078);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);
  return v17(v19, a2, a2, v18);
}

void sub_10002E694()
{
  sub_100044540();
  if (v0 <= 0x3F)
  {
    sub_100034E9C(319, (unint64_t *)&unk_1000517D8, (void (*)(uint64_t))&type metadata accessor for UUID);
    if (v1 <= 0x3F)
    {
      type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(319);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t *sub_10002E7B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100044540();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    uint64_t v10 = type metadata accessor for UniversalSuggestionCorrectionDiscovered(0);
    uint64_t v11 = *(int *)(v10 + 20);
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v55 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    uint64_t v54 = v8;
    if (v55((char *)a2 + v11, 1, v7))
    {
      uint64_t v14 = sub_100006080(&qword_100051078);
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      v9((uint64_t *)v12, (uint64_t *)v13, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v12, 0, 1, v7);
    }
    uint64_t v16 = *(int *)(v10 + 24);
    uint64_t v17 = (char *)a1 + v16;
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = sub_100006080(&qword_100050FD0);
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 2, v19))
    {
      uint64_t v21 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
      memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      uint64_t v22 = sub_100044850();
      uint64_t v52 = v9;
      int v23 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16);
      v23(v17, v18, v22);
      v23(&v17[*(int *)(v19 + 48)], &v18[*(int *)(v19 + 48)], v22);
      uint64_t v9 = v52;
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 2, v19);
    }
    uint64_t v24 = *(int *)(a3 + 20);
    uint64_t v25 = (char *)a1 + v24;
    uint64_t v26 = (char *)a2 + v24;
    v9((uint64_t *)((char *)a1 + v24), (uint64_t *)((char *)a2 + v24), v7);
    uint64_t v27 = *(int *)(type metadata accessor for UniversalSuggestionRequestTaskState(0) + 20);
    uint64_t v28 = &v25[v27];
    uint64_t v29 = &v26[v27];
    uint64_t v30 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
    uint64_t v31 = *(void *)(v30 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
    {
      uint64_t v32 = sub_100006080(&qword_100050FD8);
      memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
    }
    else
    {
      uint64_t v53 = v31;
      uint64_t v33 = *((void *)v29 + 1);
      *(void *)uint64_t v28 = *(void *)v29;
      *((void *)v28 + 1) = v33;
      *((void *)v28 + 2) = *((void *)v29 + 2);
      v28[24] = v29[24];
      uint64_t v34 = type metadata accessor for UniversalSuggestionItem(0);
      uint64_t v35 = *(int *)(v34 + 24);
      int64_t v36 = &v28[v35];
      uint64_t v37 = &v29[v35];
      swift_bridgeObjectRetain();
      v9((uint64_t *)v36, (uint64_t *)v37, v7);
      uint64_t v38 = *(int *)(v34 + 28);
      uint64_t v39 = &v28[v38];
      uint64_t v40 = &v29[v38];
      uint64_t v41 = sub_100044A70();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
      uint64_t v42 = *(int *)(v30 + 20);
      unint64_t v43 = &v28[v42];
      uint64_t v44 = &v29[v42];
      uint64_t v45 = sub_100006080(&qword_100050FE0);
      uint64_t v46 = *(void *)(v45 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v44, 3, v45))
      {
        uint64_t v47 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
        memcpy(v43, v44, *(void *)(*(void *)(v47 - 8) + 64));
        uint64_t v48 = v53;
      }
      else
      {
        if (v55(v44, 1, v7))
        {
          uint64_t v49 = sub_100006080(&qword_100051078);
          memcpy(v43, v44, *(void *)(*(void *)(v49 - 8) + 64));
        }
        else
        {
          v9((uint64_t *)v43, (uint64_t *)v44, v7);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v54 + 56))(v43, 0, 1, v7);
        }
        uint64_t v48 = v53;
        uint64_t v50 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
        v43[*(int *)(v50 + 20)] = v44[*(int *)(v50 + 20)];
        (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(v43, 0, 3, v45);
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v48 + 56))(v28, 0, 1, v30);
    }
  }
  return a1;
}

uint64_t sub_10002ED98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100044540();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v22(a1, v4);
  uint64_t v6 = type metadata accessor for UniversalSuggestionCorrectionDiscovered(0);
  uint64_t v7 = a1 + *(int *)(v6 + 20);
  uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v8(v7, 1, v4)) {
    v22(v7, v4);
  }
  uint64_t v9 = a1 + *(int *)(v6 + 24);
  uint64_t v10 = sub_100006080(&qword_100050FD0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v9, 2, v10))
  {
    uint64_t v11 = sub_100044850();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
    v12(v9, v11);
    v12(v9 + *(int *)(v10 + 48), v11);
  }
  uint64_t v13 = a1 + *(int *)(a2 + 20);
  v22(v13, v4);
  uint64_t v14 = v13 + *(int *)(type metadata accessor for UniversalSuggestionRequestTaskState(0) + 20);
  uint64_t v15 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v14, 1, v15);
  if (!result)
  {
    swift_bridgeObjectRelease();
    uint64_t v17 = type metadata accessor for UniversalSuggestionItem(0);
    v22(v14 + *(int *)(v17 + 24), v4);
    uint64_t v18 = v14 + *(int *)(v17 + 28);
    uint64_t v19 = sub_100044A70();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
    uint64_t v20 = v14 + *(int *)(v15 + 20);
    uint64_t v21 = sub_100006080(&qword_100050FE0);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 48))(v20, 3, v21);
    if (!result)
    {
      uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v8)(v20, 1, v4);
      if (!result)
      {
        return ((uint64_t (*)(uint64_t, uint64_t))v22)(v20, v4);
      }
    }
  }
  return result;
}

uint64_t sub_10002F0D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100044540();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  uint64_t v8 = type metadata accessor for UniversalSuggestionCorrectionDiscovered(0);
  uint64_t v9 = *(int *)(v8 + 20);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v53 = v6;
  uint64_t v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v12(a2 + v9, 1, v5))
  {
    uint64_t v13 = sub_100006080(&qword_100051078);
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v10, (uint64_t)v11, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v10, 0, 1, v5);
  }
  uint64_t v14 = *(int *)(v8 + 24);
  uint64_t v15 = (char *)(a1 + v14);
  uint64_t v16 = (char *)(a2 + v14);
  uint64_t v17 = sub_100006080(&qword_100050FD0);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v52 = (unsigned int (*)(char *, uint64_t, uint64_t))v12;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 2, v17))
  {
    uint64_t v19 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    uint64_t v54 = a1;
    uint64_t v20 = sub_100044850();
    uint64_t v21 = v7;
    uint64_t v22 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
    v22(v15, v16, v20);
    uint64_t v23 = v20;
    a1 = v54;
    v22(&v15[*(int *)(v17 + 48)], &v16[*(int *)(v17 + 48)], v23);
    uint64_t v7 = v21;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 2, v17);
  }
  uint64_t v24 = *(int *)(a3 + 20);
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  v7(a1 + v24, a2 + v24, v5);
  uint64_t v27 = *(int *)(type metadata accessor for UniversalSuggestionRequestTaskState(0) + 20);
  uint64_t v28 = (void *)(v25 + v27);
  uint64_t v29 = (void *)(v26 + v27);
  uint64_t v30 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
  uint64_t v31 = *(void *)(v30 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
  {
    uint64_t v32 = sub_100006080(&qword_100050FD8);
    memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
  }
  else
  {
    uint64_t v55 = a1;
    uint64_t v33 = v29[1];
    *uint64_t v28 = *v29;
    v28[1] = v33;
    v28[2] = v29[2];
    *((unsigned char *)v28 + 24) = *((unsigned char *)v29 + 24);
    uint64_t v34 = type metadata accessor for UniversalSuggestionItem(0);
    uint64_t v35 = *(int *)(v34 + 24);
    int64_t v36 = (char *)v28 + v35;
    uint64_t v37 = (void (*)(char *, char *, uint64_t))v7;
    uint64_t v38 = (char *)v29 + v35;
    swift_bridgeObjectRetain();
    v37(v36, v38, v5);
    uint64_t v39 = *(int *)(v34 + 28);
    uint64_t v40 = (char *)v28 + v39;
    uint64_t v41 = (char *)v29 + v39;
    uint64_t v42 = sub_100044A70();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16))(v40, v41, v42);
    uint64_t v43 = *(int *)(v30 + 20);
    uint64_t v44 = (char *)v28 + v43;
    uint64_t v45 = (char *)v29 + v43;
    uint64_t v46 = sub_100006080(&qword_100050FE0);
    uint64_t v47 = *(void *)(v46 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v45, 3, v46))
    {
      uint64_t v48 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
      memcpy(v44, v45, *(void *)(*(void *)(v48 - 8) + 64));
    }
    else
    {
      if (v52(v45, 1, v5))
      {
        uint64_t v49 = sub_100006080(&qword_100051078);
        memcpy(v44, v45, *(void *)(*(void *)(v49 - 8) + 64));
      }
      else
      {
        v37(v44, v45, v5);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v53 + 56))(v44, 0, 1, v5);
      }
      uint64_t v50 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
      v44[*(int *)(v50 + 20)] = v45[*(int *)(v50 + 20)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56))(v44, 0, 3, v46);
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
    return v55;
  }
  return a1;
}

uint64_t sub_10002F674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100044540();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v87 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v87(a1, a2, v5);
  uint64_t v7 = type metadata accessor for UniversalSuggestionCorrectionDiscovered(0);
  uint64_t v8 = *(int *)(v7 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  unsigned int v12 = v11(a1 + v8, 1, v5);
  unsigned int v13 = v11((uint64_t)v10, 1, v5);
  os_log_type_t v83 = (unsigned int (*)(const void *, uint64_t, uint64_t))v11;
  uint64_t v84 = v6;
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v9, v10, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v9, 0, 1, v5);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v6 + 8))(v9, v5);
LABEL_6:
    uint64_t v14 = sub_100006080(&qword_100051078);
    memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  v87((uint64_t)v9, (uint64_t)v10, v5);
LABEL_7:
  uint64_t v15 = *(int *)(v7 + 24);
  uint64_t v86 = a1;
  uint64_t v16 = (char *)(a1 + v15);
  uint64_t v17 = (char *)(a2 + v15);
  uint64_t v18 = sub_100006080(&qword_100050FD0);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 2, v18);
  int v22 = v20(v17, 2, v18);
  if (v21)
  {
    if (!v22)
    {
      uint64_t v23 = sub_100044850();
      uint64_t v24 = *(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16);
      v24(v16, v17, v23);
      v24(&v16[*(int *)(v18 + 48)], &v17[*(int *)(v18 + 48)], v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 2, v18);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    sub_100017B30((uint64_t)v16, &qword_100050FD0);
LABEL_12:
    uint64_t v25 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
    memcpy(v16, v17, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_13;
  }
  uint64_t v59 = sub_100044850();
  uint64_t v60 = *(void (**)(char *, char *, uint64_t))(*(void *)(v59 - 8) + 24);
  v60(v16, v17, v59);
  v60(&v16[*(int *)(v18 + 48)], &v17[*(int *)(v18 + 48)], v59);
LABEL_13:
  uint64_t v26 = v86;
  uint64_t v27 = *(int *)(a3 + 20);
  uint64_t v28 = v86 + v27;
  uint64_t v29 = a2 + v27;
  v87(v86 + v27, a2 + v27, v5);
  uint64_t v30 = *(int *)(type metadata accessor for UniversalSuggestionRequestTaskState(0) + 20);
  uint64_t v31 = v28 + v30;
  uint64_t v32 = v29 + v30;
  uint64_t v33 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 48);
  int v36 = v35(v31, 1, v33);
  int v37 = v35(v32, 1, v33);
  if (!v36)
  {
    if (v37)
    {
      sub_10002859C(v31, type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState);
      goto LABEL_19;
    }
    *(void *)uint64_t v31 = *(void *)v32;
    *(void *)(v31 + 8) = *(void *)(v32 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v61 = *(void *)(v32 + 16);
    *(unsigned char *)(v31 + 24) = *(unsigned char *)(v32 + 24);
    *(void *)(v31 + 16) = v61;
    uint64_t v62 = type metadata accessor for UniversalSuggestionItem(0);
    v87(v31 + *(int *)(v62 + 24), v32 + *(int *)(v62 + 24), v5);
    uint64_t v63 = *(int *)(v62 + 28);
    uint64_t v64 = v31 + v63;
    uint64_t v65 = v32 + v63;
    uint64_t v66 = sub_100044A70();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 24))(v64, v65, v66);
    uint64_t v67 = *(int *)(v33 + 20);
    Swift::Int v68 = (void *)(v31 + v67);
    uint64_t v69 = (void *)(v32 + v67);
    uint64_t v70 = sub_100006080(&qword_100050FE0);
    uint64_t v71 = *(void *)(v70 - 8);
    uint64_t v72 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v71 + 48);
    LODWORD(v64) = v72(v68, 3, v70);
    int v73 = v72(v69, 3, v70);
    if (v64)
    {
      if (!v73)
      {
        if (v83(v69, 1, v5))
        {
          uint64_t v74 = sub_100006080(&qword_100051078);
          memcpy(v68, v69, *(void *)(*(void *)(v74 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(v84 + 16))(v68, v69, v5);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v84 + 56))(v68, 0, 1, v5);
        }
        uint64_t v80 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
        *((unsigned char *)v68 + *(int *)(v80 + 20)) = *((unsigned char *)v69 + *(int *)(v80 + 20));
        (*(void (**)(void *, void, uint64_t, uint64_t))(v71 + 56))(v68, 0, 3, v70);
        return v26;
      }
      goto LABEL_31;
    }
    if (v73)
    {
      sub_100017B30((uint64_t)v68, &qword_100050FE0);
LABEL_31:
      size_t v56 = *(void *)(*(void *)(type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0)
                                  - 8)
                      + 64);
      unint64_t v57 = v68;
      uint64_t v58 = v69;
      goto LABEL_20;
    }
    unsigned int v78 = v83(v68, 1, v5);
    unsigned int v79 = v83(v69, 1, v5);
    if (v78)
    {
      if (!v79)
      {
        (*(void (**)(void *, void *, uint64_t))(v84 + 16))(v68, v69, v5);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v84 + 56))(v68, 0, 1, v5);
LABEL_44:
        uint64_t v82 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
        *((unsigned char *)v68 + *(int *)(v82 + 20)) = *((unsigned char *)v69 + *(int *)(v82 + 20));
        return v26;
      }
    }
    else
    {
      if (!v79)
      {
        v87((uint64_t)v68, (uint64_t)v69, v5);
        goto LABEL_44;
      }
      (*(void (**)(void *, uint64_t))(v84 + 8))(v68, v5);
    }
    uint64_t v81 = sub_100006080(&qword_100051078);
    memcpy(v68, v69, *(void *)(*(void *)(v81 - 8) + 64));
    goto LABEL_44;
  }
  if (v37)
  {
LABEL_19:
    size_t v56 = *(void *)(*(void *)(sub_100006080(&qword_100050FD8) - 8) + 64);
    unint64_t v57 = (void *)v31;
    uint64_t v58 = (const void *)v32;
LABEL_20:
    memcpy(v57, v58, v56);
    return v26;
  }
  uint64_t v88 = v34;
  *(void *)uint64_t v31 = *(void *)v32;
  *(void *)(v31 + 8) = *(void *)(v32 + 8);
  uint64_t v38 = *(void *)(v32 + 16);
  *(unsigned char *)(v31 + 24) = *(unsigned char *)(v32 + 24);
  *(void *)(v31 + 16) = v38;
  uint64_t v39 = type metadata accessor for UniversalSuggestionItem(0);
  uint64_t v40 = *(int *)(v39 + 24);
  uint64_t v41 = v31 + v40;
  uint64_t v42 = v5;
  uint64_t v43 = v32 + v40;
  uint64_t v44 = *(void (**)(uint64_t, uint64_t, uint64_t))(v84 + 16);
  swift_bridgeObjectRetain();
  v44(v41, v43, v42);
  uint64_t v45 = *(int *)(v39 + 28);
  uint64_t v46 = v31 + v45;
  uint64_t v47 = v32 + v45;
  uint64_t v48 = sub_100044A70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 16))(v46, v47, v48);
  uint64_t v49 = *(int *)(v33 + 20);
  uint64_t v50 = (void *)(v31 + v49);
  uint64_t v51 = (const void *)(v32 + v49);
  uint64_t v52 = sub_100006080(&qword_100050FE0);
  uint64_t v53 = *(void *)(v52 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v53 + 48))(v51, 3, v52))
  {
    uint64_t v54 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
    memcpy(v50, v51, *(void *)(*(void *)(v54 - 8) + 64));
    uint64_t v26 = v86;
    uint64_t v55 = v88;
  }
  else
  {
    if (v83(v51, 1, v42))
    {
      uint64_t v75 = sub_100006080(&qword_100051078);
      memcpy(v50, v51, *(void *)(*(void *)(v75 - 8) + 64));
    }
    else
    {
      v44((uint64_t)v50, (uint64_t)v51, v42);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v84 + 56))(v50, 0, 1, v42);
    }
    uint64_t v26 = v86;
    uint64_t v55 = v88;
    uint64_t v76 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
    *((unsigned char *)v50 + *(int *)(v76 + 20)) = *((unsigned char *)v51 + *(int *)(v76 + 20));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v53 + 56))(v50, 0, 3, v52);
  }
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v55 + 56))(v31, 0, 1, v33);
  return v26;
}

uint64_t sub_100030090(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100044540();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  uint64_t v8 = type metadata accessor for UniversalSuggestionCorrectionDiscovered(0);
  uint64_t v9 = *(int *)(v8 + 20);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v45 = v6;
  unsigned int v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v12(a2 + v9, 1, v5))
  {
    uint64_t v13 = sub_100006080(&qword_100051078);
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v10, (uint64_t)v11, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v10, 0, 1, v5);
  }
  uint64_t v14 = *(int *)(v8 + 24);
  uint64_t v15 = (char *)(a1 + v14);
  uint64_t v16 = (char *)(a2 + v14);
  uint64_t v17 = sub_100006080(&qword_100050FD0);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v44 = (unsigned int (*)(char *, uint64_t, uint64_t))v12;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 2, v17))
  {
    uint64_t v19 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    uint64_t v20 = sub_100044850();
    int v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32);
    v21(v15, v16, v20);
    v21(&v15[*(int *)(v17 + 48)], &v16[*(int *)(v17 + 48)], v20);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 2, v17);
  }
  uint64_t v22 = *(int *)(a3 + 20);
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  v7(a1 + v22, a2 + v22, v5);
  uint64_t v25 = *(int *)(type metadata accessor for UniversalSuggestionRequestTaskState(0) + 20);
  uint64_t v26 = (_OWORD *)(v23 + v25);
  uint64_t v27 = (_OWORD *)(v24 + v25);
  uint64_t v28 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
  uint64_t v29 = *(void *)(v28 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
  {
    uint64_t v30 = sub_100006080(&qword_100050FD8);
    memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
  }
  else
  {
    _OWORD *v26 = *v27;
    *((void *)v26 + 2) = *((void *)v27 + 2);
    *((unsigned char *)v26 + 24) = *((unsigned char *)v27 + 24);
    uint64_t v31 = type metadata accessor for UniversalSuggestionItem(0);
    v7((uint64_t)v26 + *(int *)(v31 + 24), (uint64_t)v27 + *(int *)(v31 + 24), v5);
    uint64_t v32 = *(int *)(v31 + 28);
    uint64_t v33 = (char *)v26 + v32;
    uint64_t v34 = (char *)v27 + v32;
    uint64_t v35 = sub_100044A70();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 32))(v33, v34, v35);
    uint64_t v36 = *(int *)(v28 + 20);
    __dsta = (char *)v26 + v36;
    int v37 = (char *)v27 + v36;
    uint64_t v38 = sub_100006080(&qword_100050FE0);
    uint64_t v39 = *(void *)(v38 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v37, 3, v38))
    {
      uint64_t v40 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
      memcpy(__dsta, v37, *(void *)(*(void *)(v40 - 8) + 64));
    }
    else
    {
      if (v44(v37, 1, v5))
      {
        uint64_t v41 = sub_100006080(&qword_100051078);
        memcpy(__dsta, v37, *(void *)(*(void *)(v41 - 8) + 64));
      }
      else
      {
        v7((uint64_t)__dsta, (uint64_t)v37, v5);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(__dsta, 0, 1, v5);
      }
      uint64_t v42 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
      __dsta[*(int *)(v42 + 20)] = v37[*(int *)(v42 + 20)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(__dsta, 0, 3, v38);
    }
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  }
  return a1;
}

uint64_t sub_100030624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100044540();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v80 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v80(a1, a2, v5);
  uint64_t v7 = type metadata accessor for UniversalSuggestionCorrectionDiscovered(0);
  uint64_t v8 = *(int *)(v7 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  unsigned int v12 = v11(a1 + v8, 1, v5);
  unsigned int v13 = v11((uint64_t)v10, 1, v5);
  uint64_t v76 = (unsigned int (*)(const void *, uint64_t, uint64_t))v11;
  uint64_t v77 = v6;
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(v9, v10, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v9, 0, 1, v5);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v6 + 8))(v9, v5);
LABEL_6:
    uint64_t v14 = sub_100006080(&qword_100051078);
    memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  v80((uint64_t)v9, (uint64_t)v10, v5);
LABEL_7:
  uint64_t v15 = *(int *)(v7 + 24);
  uint64_t v79 = a1;
  uint64_t v16 = (char *)(a1 + v15);
  uint64_t v17 = (char *)(a2 + v15);
  uint64_t v18 = sub_100006080(&qword_100050FD0);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 2, v18);
  int v22 = v20(v17, 2, v18);
  if (v21)
  {
    if (!v22)
    {
      uint64_t v23 = sub_100044850();
      uint64_t v24 = *(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32);
      v24(v16, v17, v23);
      v24(&v16[*(int *)(v18 + 48)], &v17[*(int *)(v18 + 48)], v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 2, v18);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    sub_100017B30((uint64_t)v16, &qword_100050FD0);
LABEL_12:
    uint64_t v25 = type metadata accessor for UniversalSuggestionCorrectionDiscovered.CorrectionState(0);
    memcpy(v16, v17, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_13;
  }
  uint64_t v52 = sub_100044850();
  uint64_t v53 = *(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 40);
  v53(v16, v17, v52);
  v53(&v16[*(int *)(v18 + 48)], &v17[*(int *)(v18 + 48)], v52);
LABEL_13:
  uint64_t v26 = v79;
  uint64_t v27 = *(int *)(a3 + 20);
  uint64_t v28 = v79 + v27;
  uint64_t v29 = a2 + v27;
  v80(v79 + v27, a2 + v27, v5);
  uint64_t v30 = *(int *)(type metadata accessor for UniversalSuggestionRequestTaskState(0) + 20);
  uint64_t v31 = v28 + v30;
  uint64_t v32 = v29 + v30;
  uint64_t v33 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 48);
  int v36 = v35(v31, 1, v33);
  int v37 = v35(v32, 1, v33);
  if (!v36)
  {
    if (v37)
    {
      sub_10002859C(v31, type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState);
      goto LABEL_19;
    }
    uint64_t v54 = *(void *)(v32 + 8);
    *(void *)uint64_t v31 = *(void *)v32;
    *(void *)(v31 + 8) = v54;
    swift_bridgeObjectRelease();
    *(void *)(v31 + 16) = *(void *)(v32 + 16);
    *(unsigned char *)(v31 + 24) = *(unsigned char *)(v32 + 24);
    uint64_t v55 = type metadata accessor for UniversalSuggestionItem(0);
    v80(v31 + *(int *)(v55 + 24), v32 + *(int *)(v55 + 24), v5);
    uint64_t v56 = *(int *)(v55 + 28);
    uint64_t v57 = v31 + v56;
    uint64_t v58 = v32 + v56;
    uint64_t v59 = sub_100044A70();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 40))(v57, v58, v59);
    uint64_t v60 = *(int *)(v33 + 20);
    uint64_t v61 = (void *)(v31 + v60);
    uint64_t v62 = (void *)(v32 + v60);
    uint64_t v63 = sub_100006080(&qword_100050FE0);
    uint64_t v64 = *(void *)(v63 - 8);
    uint64_t v65 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v64 + 48);
    LODWORD(v57) = v65(v61, 3, v63);
    int v66 = v65(v62, 3, v63);
    if (v57)
    {
      if (!v66)
      {
        if (v76(v62, 1, v5))
        {
          uint64_t v67 = sub_100006080(&qword_100051078);
          memcpy(v61, v62, *(void *)(*(void *)(v67 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(v77 + 32))(v61, v62, v5);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v77 + 56))(v61, 0, 1, v5);
        }
        uint64_t v73 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
        *((unsigned char *)v61 + *(int *)(v73 + 20)) = *((unsigned char *)v62 + *(int *)(v73 + 20));
        (*(void (**)(void *, void, uint64_t, uint64_t))(v64 + 56))(v61, 0, 3, v63);
        return v26;
      }
      goto LABEL_31;
    }
    if (v66)
    {
      sub_100017B30((uint64_t)v61, &qword_100050FE0);
LABEL_31:
      size_t v49 = *(void *)(*(void *)(type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0)
                                  - 8)
                      + 64);
      uint64_t v50 = v61;
      uint64_t v51 = v62;
      goto LABEL_20;
    }
    unsigned int v71 = v76(v61, 1, v5);
    unsigned int v72 = v76(v62, 1, v5);
    if (v71)
    {
      if (!v72)
      {
        (*(void (**)(void *, void *, uint64_t))(v77 + 32))(v61, v62, v5);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v77 + 56))(v61, 0, 1, v5);
LABEL_44:
        uint64_t v75 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
        *((unsigned char *)v61 + *(int *)(v75 + 20)) = *((unsigned char *)v62 + *(int *)(v75 + 20));
        return v26;
      }
    }
    else
    {
      if (!v72)
      {
        v80((uint64_t)v61, (uint64_t)v62, v5);
        goto LABEL_44;
      }
      (*(void (**)(void *, uint64_t))(v77 + 8))(v61, v5);
    }
    uint64_t v74 = sub_100006080(&qword_100051078);
    memcpy(v61, v62, *(void *)(*(void *)(v74 - 8) + 64));
    goto LABEL_44;
  }
  if (v37)
  {
LABEL_19:
    size_t v49 = *(void *)(*(void *)(sub_100006080(&qword_100050FD8) - 8) + 64);
    uint64_t v50 = (void *)v31;
    uint64_t v51 = (const void *)v32;
LABEL_20:
    memcpy(v50, v51, v49);
    return v26;
  }
  *(_OWORD *)uint64_t v31 = *(_OWORD *)v32;
  *(void *)(v31 + 16) = *(void *)(v32 + 16);
  *(unsigned char *)(v31 + 24) = *(unsigned char *)(v32 + 24);
  uint64_t v38 = type metadata accessor for UniversalSuggestionItem(0);
  uint64_t v81 = *(void (**)(uint64_t, uint64_t, uint64_t))(v77 + 32);
  v81(v31 + *(int *)(v38 + 24), v32 + *(int *)(v38 + 24), v5);
  uint64_t v39 = *(int *)(v38 + 28);
  uint64_t v40 = v31 + v39;
  uint64_t v41 = v32 + v39;
  uint64_t v42 = sub_100044A70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 32))(v40, v41, v42);
  uint64_t v43 = *(int *)(v33 + 20);
  uint64_t v44 = (void *)(v31 + v43);
  uint64_t v45 = (const void *)(v32 + v43);
  uint64_t v46 = sub_100006080(&qword_100050FE0);
  uint64_t v47 = *(void *)(v46 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v47 + 48))(v45, 3, v46))
  {
    uint64_t v48 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
    memcpy(v44, v45, *(void *)(*(void *)(v48 - 8) + 64));
    uint64_t v26 = v79;
  }
  else
  {
    if (v76(v45, 1, v5))
    {
      uint64_t v68 = sub_100006080(&qword_100051078);
      memcpy(v44, v45, *(void *)(*(void *)(v68 - 8) + 64));
    }
    else
    {
      v81((uint64_t)v44, (uint64_t)v45, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v77 + 56))(v44, 0, 1, v5);
    }
    uint64_t v26 = v79;
    uint64_t v69 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
    *((unsigned char *)v44 + *(int *)(v69 + 20)) = *((unsigned char *)v45 + *(int *)(v69 + 20));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v47 + 56))(v44, 0, 3, v46);
  }
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  return v26;
}

uint64_t sub_100031018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003102C);
}

uint64_t sub_10003102C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100032D4C(a1, a2, a3, type metadata accessor for UniversalSuggestionCorrectionDiscovered, type metadata accessor for UniversalSuggestionRequestTaskState);
}

uint64_t sub_100031058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003106C);
}

uint64_t sub_10003106C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_100032E90(a1, a2, a3, a4, type metadata accessor for UniversalSuggestionCorrectionDiscovered, type metadata accessor for UniversalSuggestionRequestTaskState);
}

uint64_t type metadata accessor for UniversalSuggestionRequestState(uint64_t a1)
{
  return sub_100013C30(a1, qword_100051868);
}

uint64_t sub_1000310B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100032FD8(a1, a2, a3, type metadata accessor for UniversalSuggestionCorrectionDiscovered, type metadata accessor for UniversalSuggestionRequestTaskState);
}

uint64_t *sub_1000310E4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = sub_100006080(&qword_100050FD0);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 2, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = sub_100044850();
      uint64_t v11 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16);
      v11(a1, a2, v10);
      v11((uint64_t *)((char *)a1 + *(int *)(v7 + 48)), (uint64_t *)((char *)a2 + *(int *)(v7 + 48)), v10);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t sub_100031278(uint64_t a1)
{
  uint64_t v2 = sub_100006080(&qword_100050FD0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 2, v2);
  if (!result)
  {
    uint64_t v4 = sub_100044850();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    ((void (*)(void *__return_ptr, uint64_t, uint64_t))v6)((void *)(v4 - 8), a1, v4);
    uint64_t v5 = a1 + *(int *)(v2 + 48);
    return v6(v5, v4);
  }
  return result;
}

char *sub_100031370(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100006080(&qword_100050FD0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_100044850();
    uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
    v9(a1, a2, v8);
    v9(&a1[*(int *)(v6 + 48)], &a2[*(int *)(v6 + 48)], v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

char *sub_1000314C8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100006080(&qword_100050FD0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v14 = sub_100044850();
      uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 24);
      v15(a1, a2, v14);
      v15(&a1[*(int *)(v6 + 48)], &a2[*(int *)(v6 + 48)], v14);
      return a1;
    }
    sub_100017B30((uint64_t)a1, &qword_100050FD0);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_100044850();
  unsigned int v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  v12(a1, a2, v11);
  v12(&a1[*(int *)(v6 + 48)], &a2[*(int *)(v6 + 48)], v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

char *sub_1000316B4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100006080(&qword_100050FD0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_100044850();
    int v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32);
    v9(a1, a2, v8);
    v9(&a1[*(int *)(v6 + 48)], &a2[*(int *)(v6 + 48)], v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

char *sub_10003180C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100006080(&qword_100050FD0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v14 = sub_100044850();
      uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 40);
      v15(a1, a2, v14);
      v15(&a1[*(int *)(v6 + 48)], &a2[*(int *)(v6 + 48)], v14);
      return a1;
    }
    sub_100017B30((uint64_t)a1, &qword_100050FD0);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_100044850();
  unsigned int v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32);
  v12(a1, a2, v11);
  v12(&a1[*(int *)(v6 + 48)], &a2[*(int *)(v6 + 48)], v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

uint64_t sub_1000319F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100031A0C);
}

uint64_t sub_100031A0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006080(&qword_100050FD0);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 3) {
    return v5 - 2;
  }
  else {
    return 0;
  }
}

uint64_t sub_100031A7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100031A90);
}

uint64_t sub_100031A90(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_100006080(&qword_100050FD0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_100031B18(uint64_t a1, uint64_t a2)
{
  return sub_100035E18(a1, a2, &qword_100050FD0, 2);
}

uint64_t sub_100031B28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100035E94(a1, a2, a3, &qword_100050FD0, 2);
}

uint64_t sub_100031B38()
{
  uint64_t result = sub_100044850();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

void *sub_100031BC8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v24 = *a2;
    void *v4 = *a2;
    uint64_t v4 = (void *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = a2[2];
    *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
    uint64_t v8 = type metadata accessor for UniversalSuggestionItem(0);
    uint64_t v9 = *(int *)(v8 + 24);
    int v10 = (char *)v4 + v9;
    uint64_t v11 = (uint64_t)a2 + v9;
    uint64_t v12 = sub_100044540();
    uint64_t v28 = *(void *)(v12 - 8);
    unsigned int v13 = *(void (**)(char *, uint64_t, uint64_t))(v28 + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    uint64_t v14 = *(int *)(v8 + 28);
    uint64_t v15 = (char *)v4 + v14;
    uint64_t v16 = (uint64_t)a2 + v14;
    uint64_t v17 = sub_100044A70();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    uint64_t v18 = *(int *)(a3 + 20);
    uint64_t v19 = (char *)v4 + v18;
    uint64_t v20 = (char *)a2 + v18;
    uint64_t v21 = sub_100006080(&qword_100050FE0);
    uint64_t v22 = *(void *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 3, v21))
    {
      uint64_t v23 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
      memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v20, 1, v12))
      {
        uint64_t v25 = sub_100006080(&qword_100051078);
        memcpy(v19, v20, *(void *)(*(void *)(v25 - 8) + 64));
      }
      else
      {
        v13(v19, (uint64_t)v20, v12);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v19, 0, 1, v12);
      }
      uint64_t v26 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
      v19[*(int *)(v26 + 20)] = v20[*(int *)(v26 + 20)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 3, v21);
    }
  }
  return v4;
}

uint64_t sub_100031EA0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = type metadata accessor for UniversalSuggestionItem(0);
  uint64_t v5 = a1 + *(int *)(v4 + 24);
  uint64_t v6 = sub_100044540();
  uint64_t v7 = *(void *)(v6 - 8);
  unsigned int v13 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v13(v5, v6);
  uint64_t v8 = a1 + *(int *)(v4 + 28);
  uint64_t v9 = sub_100044A70();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = a1 + *(int *)(a2 + 20);
  uint64_t v11 = sub_100006080(&qword_100050FE0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 3, v11);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v10, 1, v6);
    if (!result)
    {
      return ((uint64_t (*)(uint64_t, uint64_t))v13)(v10, v6);
    }
  }
  return result;
}

uint64_t sub_100032038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v6 = type metadata accessor for UniversalSuggestionItem(0);
  uint64_t v7 = *(int *)(v6 + 24);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_100044540();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(void *, const void *, uint64_t))(v11 + 16);
  swift_bridgeObjectRetain();
  v12(v8, v9, v10);
  uint64_t v13 = *(int *)(v6 + 28);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_100044A70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  uint64_t v17 = *(int *)(a3 + 20);
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (const void *)(a2 + v17);
  uint64_t v20 = sub_100006080(&qword_100050FE0);
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48))(v19, 3, v20))
  {
    uint64_t v22 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
    memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v19, 1, v10))
    {
      uint64_t v23 = sub_100006080(&qword_100051078);
      memcpy(v18, v19, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      v12(v18, v19, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v18, 0, 1, v10);
    }
    uint64_t v24 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
    *((unsigned char *)v18 + *(int *)(v24 + 20)) = *((unsigned char *)v19 + *(int *)(v24 + 20));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 3, v20);
  }
  return a1;
}

uint64_t sub_1000322C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = type metadata accessor for UniversalSuggestionItem(0);
  uint64_t v8 = *(int *)(v7 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v33 = sub_100044540();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v34 + 24);
  v11(v9, v10);
  uint64_t v12 = *(int *)(v7 + 28);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100044A70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v16 = *(int *)(a3 + 20);
  uint64_t v17 = (unsigned char *)(a1 + v16);
  uint64_t v18 = (unsigned char *)(a2 + v16);
  uint64_t v19 = sub_100006080(&qword_100050FE0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v20 + 48);
  uint64_t v22 = v17;
  LODWORD(v17) = v21(v17, 3, v19);
  int v23 = v21(v18, 3, v19);
  if (!v17)
  {
    if (v23)
    {
      sub_100017B30((uint64_t)v22, &qword_100050FE0);
      goto LABEL_7;
    }
    uint64_t v26 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v34 + 48);
    int v27 = v26(v22, 1, v33);
    int v28 = v26(v18, 1, v33);
    if (v27)
    {
      if (!v28)
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v34 + 16))(v22, v18, v33);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v34 + 56))(v22, 0, 1, v33);
LABEL_16:
        uint64_t v31 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
        v22[*(int *)(v31 + 20)] = v18[*(int *)(v31 + 20)];
        return a1;
      }
    }
    else
    {
      if (!v28)
      {
        ((void (*)(unsigned char *, unsigned char *, uint64_t))v11)(v22, v18, v33);
        goto LABEL_16;
      }
      (*(void (**)(unsigned char *, uint64_t))(v34 + 8))(v22, v33);
    }
    uint64_t v30 = sub_100006080(&qword_100051078);
    memcpy(v22, v18, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_16;
  }
  if (v23)
  {
LABEL_7:
    uint64_t v25 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
    memcpy(v22, v18, *(void *)(*(void *)(v25 - 8) + 64));
    return a1;
  }
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v34 + 48))(v18, 1, v33))
  {
    uint64_t v24 = sub_100006080(&qword_100051078);
    memcpy(v22, v18, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v34 + 16))(v22, v18, v33);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v34 + 56))(v22, 0, 1, v33);
  }
  uint64_t v29 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
  v22[*(int *)(v29 + 20)] = v18[*(int *)(v29 + 20)];
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v20 + 56))(v22, 0, 3, v19);
  return a1;
}

uint64_t sub_1000326B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v6 = type metadata accessor for UniversalSuggestionItem(0);
  uint64_t v7 = *(int *)(v6 + 24);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_100044540();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(void *, const void *, uint64_t))(v11 + 32);
  v12(v8, v9, v10);
  uint64_t v13 = *(int *)(v6 + 28);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_100044A70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  uint64_t v17 = *(int *)(a3 + 20);
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (const void *)(a2 + v17);
  uint64_t v20 = sub_100006080(&qword_100050FE0);
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48))(v19, 3, v20))
  {
    uint64_t v22 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
    memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v19, 1, v10))
    {
      uint64_t v23 = sub_100006080(&qword_100051078);
      memcpy(v18, v19, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      v12(v18, v19, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v18, 0, 1, v10);
    }
    uint64_t v24 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
    *((unsigned char *)v18 + *(int *)(v24 + 20)) = *((unsigned char *)v19 + *(int *)(v24 + 20));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 3, v20);
  }
  return a1;
}

uint64_t sub_100032928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = type metadata accessor for UniversalSuggestionItem(0);
  uint64_t v8 = *(int *)(v7 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v33 = sub_100044540();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v34 + 40);
  v11(v9, v10);
  uint64_t v12 = *(int *)(v7 + 28);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100044A70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = *(int *)(a3 + 20);
  uint64_t v17 = (unsigned char *)(a1 + v16);
  uint64_t v18 = (unsigned char *)(a2 + v16);
  uint64_t v19 = sub_100006080(&qword_100050FE0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v20 + 48);
  uint64_t v22 = v17;
  LODWORD(v17) = v21(v17, 3, v19);
  int v23 = v21(v18, 3, v19);
  if (!v17)
  {
    if (v23)
    {
      sub_100017B30((uint64_t)v22, &qword_100050FE0);
      goto LABEL_7;
    }
    uint64_t v26 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v34 + 48);
    int v27 = v26(v22, 1, v33);
    int v28 = v26(v18, 1, v33);
    if (v27)
    {
      if (!v28)
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v34 + 32))(v22, v18, v33);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v34 + 56))(v22, 0, 1, v33);
LABEL_16:
        uint64_t v31 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
        v22[*(int *)(v31 + 20)] = v18[*(int *)(v31 + 20)];
        return a1;
      }
    }
    else
    {
      if (!v28)
      {
        ((void (*)(unsigned char *, unsigned char *, uint64_t))v11)(v22, v18, v33);
        goto LABEL_16;
      }
      (*(void (**)(unsigned char *, uint64_t))(v34 + 8))(v22, v33);
    }
    uint64_t v30 = sub_100006080(&qword_100051078);
    memcpy(v22, v18, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_16;
  }
  if (v23)
  {
LABEL_7:
    uint64_t v25 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
    memcpy(v22, v18, *(void *)(*(void *)(v25 - 8) + 64));
    return a1;
  }
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v34 + 48))(v18, 1, v33))
  {
    uint64_t v24 = sub_100006080(&qword_100051078);
    memcpy(v22, v18, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v34 + 32))(v22, v18, v33);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v34 + 56))(v22, 0, 1, v33);
  }
  uint64_t v29 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
  v22[*(int *)(v29 + 20)] = v18[*(int *)(v29 + 20)];
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v20 + 56))(v22, 0, 3, v19);
  return a1;
}

uint64_t sub_100032D0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100032D20);
}

uint64_t sub_100032D20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100032D4C(a1, a2, a3, type metadata accessor for UniversalSuggestionItem, type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState);
}

uint64_t sub_100032D4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  uint64_t v9 = a4(0);
  uint64_t v10 = *(void *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == a2)
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v11(a1, a2, v9);
  }
  else
  {
    uint64_t v13 = a5(0);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + *(int *)(a3 + 20);
    return v14(v16, a2, v15);
  }
}

uint64_t sub_100032E50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100032E64);
}

uint64_t sub_100032E64(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_100032E90(a1, a2, a3, a4, type metadata accessor for UniversalSuggestionItem, type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState);
}

uint64_t sub_100032E90(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  uint64_t v11 = a5(0);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a3)
  {
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
    return v13(a1, a2, a2, v11);
  }
  else
  {
    uint64_t v15 = a6(0);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + *(int *)(a4 + 20);
    return v16(v18, a2, a2, v17);
  }
}

uint64_t sub_100032FAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100032FD8(a1, a2, a3, type metadata accessor for UniversalSuggestionItem, type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState);
}

uint64_t sub_100032FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t))
{
  uint64_t result = a4(319);
  if (v7 <= 0x3F)
  {
    uint64_t result = a5(319);
    if (v8 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1000330AC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100044540();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v9((char *)a1, (char *)a2, v7);
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = (uint64_t *)((char *)a1 + v10);
    uint64_t v12 = (uint64_t *)((char *)a2 + v10);
    uint64_t v13 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      uint64_t v15 = sub_100006080(&qword_100050FD8);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      uint64_t v36 = v8;
      uint64_t v37 = v14;
      uint64_t v17 = v12[1];
      *uint64_t v11 = *v12;
      v11[1] = v17;
      void v11[2] = v12[2];
      *((unsigned char *)v11 + 24) = *((unsigned char *)v12 + 24);
      uint64_t v18 = type metadata accessor for UniversalSuggestionItem(0);
      uint64_t v19 = *(int *)(v18 + 24);
      uint64_t v20 = (char *)v11 + v19;
      uint64_t v38 = v9;
      uint64_t v21 = (char *)v12 + v19;
      swift_bridgeObjectRetain();
      v38(v20, v21, v7);
      uint64_t v22 = *(int *)(v18 + 28);
      int v23 = (char *)v11 + v22;
      uint64_t v24 = (char *)v12 + v22;
      uint64_t v25 = sub_100044A70();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
      uint64_t v26 = *(int *)(v13 + 20);
      int v27 = (char *)v11 + v26;
      int v28 = (char *)v12 + v26;
      uint64_t v29 = sub_100006080(&qword_100050FE0);
      uint64_t v30 = *(void *)(v29 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 3, v29))
      {
        uint64_t v31 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
        memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
        uint64_t v32 = v37;
      }
      else
      {
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v28, 1, v7))
        {
          uint64_t v33 = sub_100006080(&qword_100051078);
          memcpy(v27, v28, *(void *)(*(void *)(v33 - 8) + 64));
        }
        else
        {
          v38(v27, v28, v7);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v27, 0, 1, v7);
        }
        uint64_t v32 = v37;
        uint64_t v34 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
        v27[*(int *)(v34 + 20)] = v28[*(int *)(v34 + 20)];
        (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 3, v29);
      }
      (*(void (**)(void *, void, uint64_t, uint64_t))(v32 + 56))(v11, 0, 1, v13);
    }
  }
  return a1;
}

uint64_t sub_100033480(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100044540();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v14(a1, v4);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!result)
  {
    swift_bridgeObjectRelease();
    uint64_t v9 = type metadata accessor for UniversalSuggestionItem(0);
    v14(v6 + *(int *)(v9 + 24), v4);
    uint64_t v10 = v6 + *(int *)(v9 + 28);
    uint64_t v11 = sub_100044A70();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
    uint64_t v12 = v6 + *(int *)(v7 + 20);
    uint64_t v13 = sub_100006080(&qword_100050FE0);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v12, 3, v13);
    if (!result)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v12, 1, v4);
      if (!result)
      {
        return ((uint64_t (*)(uint64_t, uint64_t))v14)(v12, v4);
      }
    }
  }
  return result;
}

uint64_t sub_10003368C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = sub_100006080(&qword_100050FD8);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    uint64_t v33 = v7;
    uint64_t v34 = v13;
    uint64_t v35 = a1;
    uint64_t v15 = v11[1];
    void *v10 = *v11;
    v10[1] = v15;
    void v10[2] = v11[2];
    *((unsigned char *)v10 + 24) = *((unsigned char *)v11 + 24);
    uint64_t v16 = type metadata accessor for UniversalSuggestionItem(0);
    uint64_t v17 = *(int *)(v16 + 24);
    uint64_t v18 = (char *)v10 + v17;
    uint64_t v19 = (char *)v11 + v17;
    swift_bridgeObjectRetain();
    v8((uint64_t)v18, (uint64_t)v19, v6);
    uint64_t v20 = *(int *)(v16 + 28);
    uint64_t v21 = (char *)v10 + v20;
    uint64_t v22 = (char *)v11 + v20;
    uint64_t v23 = sub_100044A70();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    uint64_t v24 = *(int *)(v12 + 20);
    uint64_t v25 = (char *)v10 + v24;
    uint64_t v26 = (char *)v11 + v24;
    uint64_t v27 = sub_100006080(&qword_100050FE0);
    uint64_t v28 = *(void *)(v27 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 3, v27))
    {
      uint64_t v29 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
      memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v26, 1, v6))
      {
        uint64_t v30 = sub_100006080(&qword_100051078);
        memcpy(v25, v26, *(void *)(*(void *)(v30 - 8) + 64));
      }
      else
      {
        v8((uint64_t)v25, (uint64_t)v26, v6);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v25, 0, 1, v6);
      }
      uint64_t v31 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
      v25[*(int *)(v31 + 20)] = v26[*(int *)(v31 + 20)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 3, v27);
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v34 + 56))(v10, 0, 1, v12);
    return v35;
  }
  return a1;
}

uint64_t sub_100033A08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  uint64_t v61 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 24);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (v15)
    {
      sub_10002859C(v9, type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState);
      goto LABEL_7;
    }
    *(void *)uint64_t v9 = *(void *)v10;
    *(void *)(v9 + 8) = *(void *)(v10 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v37 = *(void *)(v10 + 16);
    *(unsigned char *)(v9 + 24) = *(unsigned char *)(v10 + 24);
    *(void *)(v9 + 16) = v37;
    uint64_t v38 = type metadata accessor for UniversalSuggestionItem(0);
    v7(v9 + *(int *)(v38 + 24), v10 + *(int *)(v38 + 24), v6);
    uint64_t v39 = *(int *)(v38 + 28);
    uint64_t v40 = v9 + v39;
    uint64_t v41 = v10 + v39;
    uint64_t v42 = sub_100044A70();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 24))(v40, v41, v42);
    uint64_t v43 = *(int *)(v11 + 20);
    uint64_t v44 = (void *)(v9 + v43);
    uint64_t v45 = (void *)(v10 + v43);
    uint64_t v46 = sub_100006080(&qword_100050FE0);
    uint64_t v47 = *(void *)(v46 - 8);
    uint64_t v48 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v47 + 48);
    LODWORD(v40) = v48(v44, 3, v46);
    int v49 = v48(v45, 3, v46);
    if (v40)
    {
      if (!v49)
      {
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v61 + 48))(v45, 1, v6))
        {
          uint64_t v50 = sub_100006080(&qword_100051078);
          memcpy(v44, v45, *(void *)(*(void *)(v50 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(v61 + 16))(v44, v45, v6);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v61 + 56))(v44, 0, 1, v6);
        }
        uint64_t v57 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
        *((unsigned char *)v44 + *(int *)(v57 + 20)) = *((unsigned char *)v45 + *(int *)(v57 + 20));
        (*(void (**)(void *, void, uint64_t, uint64_t))(v47 + 56))(v44, 0, 3, v46);
        return a1;
      }
      goto LABEL_17;
    }
    if (v49)
    {
      sub_100017B30((uint64_t)v44, &qword_100050FE0);
LABEL_17:
      size_t v34 = *(void *)(*(void *)(type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0)
                                  - 8)
                      + 64);
      uint64_t v35 = v44;
      uint64_t v36 = v45;
      goto LABEL_8;
    }
    uint64_t v54 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v61 + 48);
    int v55 = v54(v44, 1, v6);
    int v56 = v54(v45, 1, v6);
    if (v55)
    {
      if (!v56)
      {
        (*(void (**)(void *, void *, uint64_t))(v61 + 16))(v44, v45, v6);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v61 + 56))(v44, 0, 1, v6);
LABEL_30:
        uint64_t v59 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
        *((unsigned char *)v44 + *(int *)(v59 + 20)) = *((unsigned char *)v45 + *(int *)(v59 + 20));
        return a1;
      }
    }
    else
    {
      if (!v56)
      {
        v7((uint64_t)v44, (uint64_t)v45, v6);
        goto LABEL_30;
      }
      (*(void (**)(void *, uint64_t))(v61 + 8))(v44, v6);
    }
    uint64_t v58 = sub_100006080(&qword_100051078);
    memcpy(v44, v45, *(void *)(*(void *)(v58 - 8) + 64));
    goto LABEL_30;
  }
  if (v15)
  {
LABEL_7:
    size_t v34 = *(void *)(*(void *)(sub_100006080(&qword_100050FD8) - 8) + 64);
    uint64_t v35 = (void *)v9;
    uint64_t v36 = (const void *)v10;
LABEL_8:
    memcpy(v35, v36, v34);
    return a1;
  }
  uint64_t v60 = v12;
  *(void *)uint64_t v9 = *(void *)v10;
  *(void *)(v9 + 8) = *(void *)(v10 + 8);
  uint64_t v16 = *(void *)(v10 + 16);
  *(unsigned char *)(v9 + 24) = *(unsigned char *)(v10 + 24);
  *(void *)(v9 + 16) = v16;
  uint64_t v17 = type metadata accessor for UniversalSuggestionItem(0);
  uint64_t v18 = *(int *)(v17 + 24);
  uint64_t v19 = v9 + v18;
  uint64_t v20 = v6;
  uint64_t v21 = v10 + v18;
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 16);
  swift_bridgeObjectRetain();
  v22(v19, v21, v20);
  uint64_t v23 = *(int *)(v17 + 28);
  uint64_t v24 = v9 + v23;
  uint64_t v25 = v10 + v23;
  uint64_t v26 = sub_100044A70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
  uint64_t v27 = *(int *)(v11 + 20);
  uint64_t v28 = (void *)(v9 + v27);
  uint64_t v29 = (const void *)(v10 + v27);
  uint64_t v30 = sub_100006080(&qword_100050FE0);
  uint64_t v31 = *(void *)(v30 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v31 + 48))(v29, 3, v30))
  {
    uint64_t v32 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
    memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
    uint64_t v33 = v60;
  }
  else
  {
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v61 + 48))(v29, 1, v20))
    {
      uint64_t v51 = sub_100006080(&qword_100051078);
      memcpy(v28, v29, *(void *)(*(void *)(v51 - 8) + 64));
    }
    else
    {
      v22((uint64_t)v28, (uint64_t)v29, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v61 + 56))(v28, 0, 1, v20);
    }
    uint64_t v33 = v60;
    uint64_t v52 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
    *((unsigned char *)v28 + *(int *)(v52 + 20)) = *((unsigned char *)v29 + *(int *)(v52 + 20));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v31 + 56))(v28, 0, 3, v30);
  }
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v33 + 56))(v9, 0, 1, v11);
  return a1;
}

uint64_t sub_100034134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (_OWORD *)(a1 + v9);
  uint64_t v11 = (_OWORD *)(a2 + v9);
  uint64_t v12 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = sub_100006080(&qword_100050FD8);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    uint64_t v28 = v7;
    _OWORD *v10 = *v11;
    *((void *)v10 + 2) = *((void *)v11 + 2);
    *((unsigned char *)v10 + 24) = *((unsigned char *)v11 + 24);
    uint64_t v15 = type metadata accessor for UniversalSuggestionItem(0);
    v8((uint64_t)v10 + *(int *)(v15 + 24), (uint64_t)v11 + *(int *)(v15 + 24), v6);
    uint64_t v16 = *(int *)(v15 + 28);
    uint64_t v17 = (char *)v10 + v16;
    uint64_t v18 = (char *)v11 + v16;
    uint64_t v19 = sub_100044A70();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
    uint64_t v20 = *(int *)(v12 + 20);
    uint64_t v29 = (char *)v10 + v20;
    uint64_t v21 = (char *)v11 + v20;
    uint64_t v22 = sub_100006080(&qword_100050FE0);
    uint64_t v23 = *(void *)(v22 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 3, v22))
    {
      uint64_t v24 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
      memcpy(v29, v21, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v21, 1, v6))
      {
        uint64_t v25 = sub_100006080(&qword_100051078);
        memcpy(v29, v21, *(void *)(*(void *)(v25 - 8) + 64));
      }
      else
      {
        v8((uint64_t)v29, (uint64_t)v21, v6);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v29, 0, 1, v6);
      }
      uint64_t v26 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
      v29[*(int *)(v26 + 20)] = v21[*(int *)(v26 + 20)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v29, 0, 3, v22);
    }
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  return a1;
}

uint64_t sub_1000344A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  uint64_t v55 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 40);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v56 = a1;
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState(0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (v15)
    {
      sub_10002859C(v9, type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState);
      goto LABEL_7;
    }
    uint64_t v32 = *(void *)(v10 + 8);
    *(void *)uint64_t v9 = *(void *)v10;
    *(void *)(v9 + 8) = v32;
    swift_bridgeObjectRelease();
    *(void *)(v9 + 16) = *(void *)(v10 + 16);
    *(unsigned char *)(v9 + 24) = *(unsigned char *)(v10 + 24);
    uint64_t v33 = type metadata accessor for UniversalSuggestionItem(0);
    v7(v9 + *(int *)(v33 + 24), v10 + *(int *)(v33 + 24), v6);
    uint64_t v34 = *(int *)(v33 + 28);
    uint64_t v35 = v9 + v34;
    uint64_t v36 = v10 + v34;
    uint64_t v37 = sub_100044A70();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 40))(v35, v36, v37);
    uint64_t v38 = *(int *)(v11 + 20);
    uint64_t v39 = (void *)(v9 + v38);
    uint64_t v40 = (void *)(v10 + v38);
    uint64_t v41 = sub_100006080(&qword_100050FE0);
    uint64_t v42 = *(void *)(v41 - 8);
    uint64_t v43 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v42 + 48);
    LODWORD(v35) = v43(v39, 3, v41);
    int v44 = v43(v40, 3, v41);
    if (v35)
    {
      if (!v44)
      {
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v55 + 48))(v40, 1, v6))
        {
          uint64_t v45 = sub_100006080(&qword_100051078);
          memcpy(v39, v40, *(void *)(*(void *)(v45 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(v55 + 32))(v39, v40, v6);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v55 + 56))(v39, 0, 1, v6);
        }
        uint64_t v28 = v56;
        uint64_t v52 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
        *((unsigned char *)v39 + *(int *)(v52 + 20)) = *((unsigned char *)v40 + *(int *)(v52 + 20));
        (*(void (**)(void *, void, uint64_t, uint64_t))(v42 + 56))(v39, 0, 3, v41);
        return v28;
      }
      goto LABEL_18;
    }
    if (v44)
    {
      sub_100017B30((uint64_t)v39, &qword_100050FE0);
LABEL_18:
      size_t v29 = *(void *)(*(void *)(type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0)
                                  - 8)
                      + 64);
      uint64_t v30 = v39;
      uint64_t v31 = v40;
      goto LABEL_8;
    }
    int v49 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v55 + 48);
    int v50 = v49(v39, 1, v6);
    int v51 = v49(v40, 1, v6);
    if (v50)
    {
      if (!v51)
      {
        (*(void (**)(void *, void *, uint64_t))(v55 + 32))(v39, v40, v6);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v55 + 56))(v39, 0, 1, v6);
LABEL_31:
        uint64_t v54 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
        *((unsigned char *)v39 + *(int *)(v54 + 20)) = *((unsigned char *)v40 + *(int *)(v54 + 20));
        return v56;
      }
    }
    else
    {
      if (!v51)
      {
        v7((uint64_t)v39, (uint64_t)v40, v6);
        goto LABEL_31;
      }
      (*(void (**)(void *, uint64_t))(v55 + 8))(v39, v6);
    }
    uint64_t v53 = sub_100006080(&qword_100051078);
    memcpy(v39, v40, *(void *)(*(void *)(v53 - 8) + 64));
    goto LABEL_31;
  }
  if (v15)
  {
LABEL_7:
    size_t v29 = *(void *)(*(void *)(sub_100006080(&qword_100050FD8) - 8) + 64);
    uint64_t v30 = (void *)v9;
    uint64_t v31 = (const void *)v10;
LABEL_8:
    memcpy(v30, v31, v29);
    return v56;
  }
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(void *)(v9 + 16) = *(void *)(v10 + 16);
  *(unsigned char *)(v9 + 24) = *(unsigned char *)(v10 + 24);
  uint64_t v16 = type metadata accessor for UniversalSuggestionItem(0);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 32);
  v17(v9 + *(int *)(v16 + 24), v10 + *(int *)(v16 + 24), v6);
  uint64_t v18 = *(int *)(v16 + 28);
  uint64_t v19 = v9 + v18;
  uint64_t v20 = v10 + v18;
  uint64_t v21 = sub_100044A70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
  uint64_t v22 = *(int *)(v11 + 20);
  uint64_t v23 = (void *)(v9 + v22);
  uint64_t v24 = (const void *)(v10 + v22);
  uint64_t v25 = sub_100006080(&qword_100050FE0);
  uint64_t v26 = *(void *)(v25 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v26 + 48))(v24, 3, v25))
  {
    uint64_t v27 = type metadata accessor for UniversalSuggestionRequestTaskState.RequestTaskState(0);
    memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
    uint64_t v28 = v56;
  }
  else
  {
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v55 + 48))(v24, 1, v6))
    {
      uint64_t v46 = sub_100006080(&qword_100051078);
      memcpy(v23, v24, *(void *)(*(void *)(v46 - 8) + 64));
    }
    else
    {
      v17((uint64_t)v23, (uint64_t)v24, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v55 + 56))(v23, 0, 1, v6);
    }
    uint64_t v28 = v56;
    uint64_t v47 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
    *((unsigned char *)v23 + *(int *)(v47 + 20)) = *((unsigned char *)v24 + *(int *)(v47 + 20));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 3, v25);
  }
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  return v28;
}

uint64_t sub_100034B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100034BA0);
}

uint64_t sub_100034BA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_100006080(&qword_100050FD8);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_100034C9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100034CB0);
}

uint64_t sub_100034CB0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100044540();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_100006080(&qword_100050FD8);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_100034DB8()
{
  sub_100044540();
  if (v0 <= 0x3F)
  {
    sub_100034E9C(319, (unint64_t *)&unk_100051A18, (void (*)(uint64_t))type metadata accessor for UniversalSuggestionRequestTaskState.SurfacedSuggestionState);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100034E9C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_100044F90();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t *sub_100034EF0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = sub_100006080(&qword_100050FE0);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 3, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = sub_100044540();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v11 + 48))(a2, 1, v10))
      {
        uint64_t v12 = sub_100006080(&qword_100051078);
        memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v11 + 16))(a1, a2, v10);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v11 + 56))(a1, 0, 1, v10);
      }
      uint64_t v13 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
      *((unsigned char *)a1 + *(int *)(v13 + 20)) = *((unsigned char *)a2 + *(int *)(v13 + 20));
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 3, v7);
    }
  }
  return a1;
}

uint64_t sub_100035114(uint64_t a1)
{
  uint64_t v2 = sub_100006080(&qword_100050FE0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 3, v2);
  if (!result)
  {
    uint64_t v4 = sub_100044540();
    uint64_t v6 = *(void *)(v4 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v4);
    if (!result)
    {
      int v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
      return v5(a1, v4);
    }
  }
  return result;
}

void *sub_100035228(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_100006080(&qword_100050FE0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_100044540();
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
    {
      uint64_t v10 = sub_100006080(&qword_100051078);
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(a1, a2, v8);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
    }
    uint64_t v11 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
    *((unsigned char *)a1 + *(int *)(v11 + 20)) = *((unsigned char *)a2 + *(int *)(v11 + 20));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

unsigned char *sub_100035410(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100006080(&qword_100050FE0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 3, v6);
  int v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_100017B30((uint64_t)a1, &qword_100050FE0);
      goto LABEL_7;
    }
    uint64_t v14 = sub_100044540();
    uint64_t v15 = *(void *)(v14 - 8);
    uint64_t v16 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v15 + 48);
    int v17 = v16(a1, 1, v14);
    int v18 = v16(a2, 1, v14);
    if (v17)
    {
      if (!v18)
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v15 + 16))(a1, a2, v14);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v15 + 56))(a1, 0, 1, v14);
LABEL_16:
        uint64_t v21 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
        a1[*(int *)(v21 + 20)] = a2[*(int *)(v21 + 20)];
        return a1;
      }
    }
    else
    {
      if (!v18)
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v15 + 24))(a1, a2, v14);
        goto LABEL_16;
      }
      (*(void (**)(unsigned char *, uint64_t))(v15 + 8))(a1, v14);
    }
    uint64_t v20 = sub_100006080(&qword_100051078);
    memcpy(a1, a2, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_16;
  }
  if (v10)
  {
LABEL_7:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_100044540();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11))
  {
    uint64_t v13 = sub_100006080(&qword_100051078);
    memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v12 + 16))(a1, a2, v11);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
  }
  uint64_t v19 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
  a1[*(int *)(v19 + 20)] = a2[*(int *)(v19 + 20)];
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

void *sub_100035788(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_100006080(&qword_100050FE0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_100044540();
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
    {
      uint64_t v10 = sub_100006080(&qword_100051078);
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(a1, a2, v8);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
    }
    uint64_t v11 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
    *((unsigned char *)a1 + *(int *)(v11 + 20)) = *((unsigned char *)a2 + *(int *)(v11 + 20));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

unsigned char *sub_100035970(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100006080(&qword_100050FE0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 3, v6);
  int v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_100017B30((uint64_t)a1, &qword_100050FE0);
      goto LABEL_7;
    }
    uint64_t v14 = sub_100044540();
    uint64_t v15 = *(void *)(v14 - 8);
    uint64_t v16 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v15 + 48);
    int v17 = v16(a1, 1, v14);
    int v18 = v16(a2, 1, v14);
    if (v17)
    {
      if (!v18)
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v15 + 32))(a1, a2, v14);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v15 + 56))(a1, 0, 1, v14);
LABEL_16:
        uint64_t v21 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
        a1[*(int *)(v21 + 20)] = a2[*(int *)(v21 + 20)];
        return a1;
      }
    }
    else
    {
      if (!v18)
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v15 + 40))(a1, a2, v14);
        goto LABEL_16;
      }
      (*(void (**)(unsigned char *, uint64_t))(v15 + 8))(a1, v14);
    }
    uint64_t v20 = sub_100006080(&qword_100051078);
    memcpy(a1, a2, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_16;
  }
  if (v10)
  {
LABEL_7:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_100044540();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11))
  {
    uint64_t v13 = sub_100006080(&qword_100051078);
    memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v12 + 32))(a1, a2, v11);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
  }
  uint64_t v19 = type metadata accessor for UniversalSuggestionDisambiguationOffered(0);
  a1[*(int *)(v19 + 20)] = a2[*(int *)(v19 + 20)];
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

uint64_t sub_100035CE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100035CFC);
}

uint64_t sub_100035CFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006080(&qword_100050FE0);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 4) {
    return v5 - 3;
  }
  else {
    return 0;
  }
}

uint64_t sub_100035D6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100035D80);
}

uint64_t sub_100035D80(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 3);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_100006080(&qword_100050FE0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_100035E08(uint64_t a1, uint64_t a2)
{
  return sub_100035E18(a1, a2, &qword_100050FE0, 3);
}

uint64_t sub_100035E18(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v6 = sub_100006080(a3);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48);
  return v7(a1, a4, v6);
}

uint64_t sub_100035E84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100035E94(a1, a2, a3, &qword_100050FE0, 3);
}

uint64_t sub_100035E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v8 = sub_100006080(a4);
  int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  return v9(a1, a2, a5, v8);
}

uint64_t sub_100035F10()
{
  uint64_t result = type metadata accessor for UniversalSuggestionDisambiguationOffered(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

void *sub_100035F88(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    void *v4 = *a2;
    uint64_t v4 = (void *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = a2[2];
    *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
    uint64_t v8 = *(int *)(a3 + 24);
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_100044540();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 28);
    uint64_t v14 = (char *)v4 + v13;
    uint64_t v15 = (uint64_t)a2 + v13;
    uint64_t v16 = sub_100044A70();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return v4;
}

uint64_t sub_1000360D8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_100044540();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  uint64_t v7 = sub_100044A70();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  return v8(v6, v7);
}

uint64_t sub_100036198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100044540();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100044A70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

uint64_t sub_100036298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100044540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 28);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_100044A70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t sub_100036394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_100044540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_100044A70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

uint64_t sub_100036478(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100044540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 28);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_100044A70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_100036564(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100036578);
}

uint64_t sub_100036578(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100044540();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100044A70();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 28);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_1000366A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000366B8);
}

uint64_t sub_1000366B8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_100044540();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100044A70();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 28);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t sub_1000367E4()
{
  uint64_t result = sub_100044540();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_100044A70();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UniversalSuggestionsDisambiguationResponseExtractor()
{
  return &type metadata for UniversalSuggestionsDisambiguationResponseExtractor;
}

uint64_t *sub_1000368D0(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_100044540();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_100006080(&qword_100051078);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_100036A48(uint64_t a1)
{
  uint64_t v2 = sub_100044540();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v2);
  if (!result)
  {
    unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_100036B18(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100006080(&qword_100051078);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *sub_100036C40(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = sub_100006080(&qword_100051078);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *sub_100036DCC(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100006080(&qword_100051078);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *sub_100036EF4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_100044540();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = sub_100006080(&qword_100051078);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_100037080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100037094);
}

uint64_t sub_100037094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006080(&qword_100051078);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 5) {
      return v10 - 4;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_100037154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100037168);
}

uint64_t sub_100037168(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100006080(&qword_100051078);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 4;
  }
  return result;
}

void sub_100037228()
{
  sub_100034E9C(319, (unint64_t *)&unk_1000517D8, (void (*)(uint64_t))&type metadata accessor for UUID);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_1000372D8(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_100044540();
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    {
      uint64_t v10 = sub_100006080(&qword_100051078);
      memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
    }
  }
  return v3;
}

uint64_t sub_10003743C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_100044540();
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v2, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(v2, v3);
  }
  return result;
}

unsigned char *sub_100037510(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_100044540();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = sub_100006080(&qword_100051078);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16))(v5, v6, v7);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

unsigned char *sub_100037624(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_100044540();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(v5, 1, v7);
  int v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 24))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v12 = sub_100006080(&qword_100051078);
    memcpy(v5, v6, *(void *)(*(void *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

unsigned char *sub_10003779C(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_100044540();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = sub_100006080(&qword_100051078);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

unsigned char *sub_1000378B0(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_100044540();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(v5, 1, v7);
  int v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 40))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v12 = sub_100006080(&qword_100051078);
    memcpy(v5, v6, *(void *)(*(void *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v5, v6, v7);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

uint64_t sub_100037A28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100037A3C);
}

uint64_t sub_100037A3C(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 251)
  {
    unsigned int v4 = *a1;
    if (v4 >= 5) {
      return v4 - 4;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = sub_100006080(&qword_100051078);
    uint64_t v9 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    int v11 = &a1[*(int *)(a3 + 20)];
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100037AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100037AFC);
}

unsigned char *sub_100037AFC(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 251)
  {
    *uint64_t result = a2 + 4;
  }
  else
  {
    uint64_t v7 = sub_100006080(&qword_100051078);
    uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = &v5[*(int *)(a4 + 20)];
    return (unsigned char *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_100037BA4()
{
  sub_100034E9C(319, (unint64_t *)&unk_1000517D8, (void (*)(uint64_t))&type metadata accessor for UUID);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for UniversalSuggestionDisambiguationOffered.DisambiguationOfferedState(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UniversalSuggestionDisambiguationOffered.DisambiguationOfferedState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for UniversalSuggestionDisambiguationOffered.DisambiguationOfferedState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100037DC4);
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

uint64_t sub_100037DEC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100037DF4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for UniversalSuggestionDisambiguationOffered.DisambiguationOfferedState()
{
  return &type metadata for UniversalSuggestionDisambiguationOffered.DisambiguationOfferedState;
}

unint64_t sub_100037E10()
{
  unint64_t result = qword_100051C80;
  if (!qword_100051C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100051C80);
  }
  return result;
}

void sub_100037E64(const char *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v7 = sub_100044CB0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100050CC0 != -1) {
    swift_once();
  }
  int v11 = byte_1000529A0;
  uint64_t v20 = sub_100044CD0();
  os_signpost_type_t v12 = sub_100044F70();
  char v13 = sub_100044F80();
  if (v11 == 1)
  {
    if ((v13 & 1) == 0) {
      goto LABEL_12;
    }
    if (a3)
    {
      if ((unint64_t)a1 >> 32)
      {
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
      if (a1 >> 11 == 27)
      {
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      if (a1 >> 16 > 0x10) {
        goto LABEL_28;
      }
      a1 = &v21;
    }
    else if (!a1)
    {
      __break(1u);
      goto LABEL_8;
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a4, v7);
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    os_signpost_id_t v16 = sub_100044CA0();
    os_signpost_type_t v17 = v12;
    int v18 = "";
LABEL_25:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, v17, v16, a1, v18, v15, 2u);
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return;
  }
LABEL_8:
  if (v13)
  {
    if ((a3 & 1) == 0)
    {
      if (!a1)
      {
        __break(1u);
        goto LABEL_12;
      }
      goto LABEL_24;
    }
    if (!((unint64_t)a1 >> 32))
    {
      if (a1 >> 11 == 27)
      {
LABEL_31:
        __break(1u);
        return;
      }
      if (a1 >> 16 <= 0x10)
      {
        a1 = &v22;
LABEL_24:
        (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a4, v7);
        uint64_t v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v15 = 0;
        os_signpost_id_t v16 = sub_100044CA0();
        os_signpost_type_t v17 = v12;
        int v18 = "enableTelemetry=YES";
        goto LABEL_25;
      }
      goto LABEL_29;
    }
    goto LABEL_27;
  }
LABEL_12:
  uint64_t v14 = v20;
}

uint64_t sub_100038128(const char *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v7 = sub_100044CB0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100050CC0 != -1) {
    swift_once();
  }
  int v11 = byte_1000529A0;
  os_signpost_type_t v12 = sub_100044CD0();
  int v13 = sub_100044F60();
  uint64_t result = sub_100044F80();
  if (v11 == 1)
  {
    if ((result & 1) == 0)
    {
LABEL_12:

      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a4, v7);
LABEL_24:
      sub_100044D20();
      swift_allocObject();
      return sub_100044D10();
    }
    int v21 = v13;
    if (a3)
    {
      if ((unint64_t)a1 >> 32)
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      if (a1 >> 11 == 27)
      {
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
      if (a1 >> 16 > 0x10) {
        goto LABEL_27;
      }
      a1 = &v22;
    }
    else if (!a1)
    {
      __break(1u);
      goto LABEL_8;
    }
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    v15(v10, a4, v7);
    os_signpost_id_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_signpost_id_t v16 = 0;
    os_signpost_id_t v17 = sub_100044CA0();
    os_signpost_type_t v18 = v21;
    uint64_t v19 = "";
LABEL_23:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, v18, v17, a1, v19, v16, 2u);
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    v15(v10, a4, v7);
    goto LABEL_24;
  }
LABEL_8:
  if ((result & 1) == 0) {
    goto LABEL_12;
  }
  int v21 = v13;
  if ((a3 & 1) == 0)
  {
    if (!a1)
    {
      __break(1u);
      goto LABEL_12;
    }
    goto LABEL_22;
  }
  if ((unint64_t)a1 >> 32) {
    goto LABEL_26;
  }
  if (a1 >> 11 != 27)
  {
    if (a1 >> 16 <= 0x10)
    {
      a1 = &v23;
LABEL_22:
      uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
      v15(v10, a4, v7);
      os_signpost_id_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_signpost_id_t v16 = 0;
      os_signpost_id_t v17 = sub_100044CA0();
      os_signpost_type_t v18 = v21;
      uint64_t v19 = "enableTelemetry=YES";
      goto LABEL_23;
    }
    goto LABEL_28;
  }
LABEL_30:
  __break(1u);
  return result;
}

void sub_10003841C()
{
  id v0 = [self standardUserDefaults];
  NSString v1 = sub_100044DD0();
  unsigned __int8 v2 = [v0 BOOLForKey:v1];

  byte_1000529A0 = v2;
}

uint64_t sub_1000384AC@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result) {
    *a2 = result;
  }
  else {
    __break(1u);
  }
  return result;
}

void sub_1000384BC(uint8_t *a1, uint32_t a2, NSObject *a3, os_signpost_type_t a4, uint64_t a5, const char *a6, const char *a7)
{
  os_signpost_id_t v13 = sub_100044CA0();
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, a3, a4, v13, a6, a7, a1, a2);
}

uint64_t sub_100038540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

uint64_t sub_100038548()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1000385D8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    *int v3 = *a2;
    int v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_100038690(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_1000386BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_10003870C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_10003875C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1000387AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1000387FC(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void sub_100038958(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x100038B70);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        os_signpost_id_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for UniversalSuggestionsPromptCoalescedAsyncSequence()
{
  return sub_10003B6C8();
}

uint64_t sub_100038BB0()
{
  return swift_getWitnessTable();
}

uint64_t sub_100038BCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v5 = *(void *)(a2 - 8);
  __chkstk_darwin(a1);
  unsigned int v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = v8;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v19 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v20 = AssociatedTypeWitness;
  __chkstk_darwin(AssociatedTypeWitness);
  int v11 = (char *)&v18 - v10;
  unsigned int v12 = (int *)type metadata accessor for UniversalSuggestionsPromptCoalescedAsyncSequence.UniversalSuggestionsPromptCoalescedFeaturisedTurnAsyncIterator();
  uint64_t v13 = a3 + v12[9];
  uint64_t v14 = type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  int v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v13, 1, 1, v14);
  v15(a3 + v12[10], 1, 1, v14);
  *(unsigned char *)(a3 + v12[11]) = 0;
  uint64_t v16 = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v21, a2);
  sub_100044ED0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v16, a2);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v19 + 32))(a3, v11, v20);
}

uint64_t sub_100038E08(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  void v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  v3[8] = swift_task_alloc();
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  v3[11] = swift_task_alloc();
  sub_100006080(&qword_100051070);
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  return _swift_task_switch(sub_100038F88, 0, 0);
}

uint64_t sub_100038F88()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(int *)(*(void *)(v0 + 24) + 44);
  *(_DWORD *)(v0 + 224) = v2;
  if (*(unsigned char *)(v1 + v2))
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 48) + 56))(*(void *)(v0 + 16), 1, 1, *(void *)(v0 + 40));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    int v3 = *(uint64_t (**)(void))(v0 + 8);
LABEL_5:
    return v3();
  }
  if (sub_100044EC0())
  {
    *(unsigned char *)(v1 + v2) = 1;
    sub_100044E90();
    sub_10003B668(qword_100051D38, (void (*)(uint64_t))&type metadata accessor for CancellationError);
    swift_allocError();
    sub_100044D70();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    int v3 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_5;
  }
  uint64_t v5 = *(void *)(v0 + 24);
  *(void *)(v0 + 160) = *(void *)(v5 + 24);
  *(void *)(v0 + 168) = *(void *)(v5 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v8;
  void *v8 = v0;
  v8[1] = sub_1000392C0;
  uint64_t v9 = *(void *)(v0 + 152);
  return dispatch thunk of AsyncIteratorProtocol.next()(v9, AssociatedTypeWitness, AssociatedConformanceWitness);
}

uint64_t sub_1000392C0()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100039EBC;
  }
  else {
    uint64_t v2 = sub_1000393D4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000393D4()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 48) + 48);
  if (v2(*(void *)(v0 + 152), 1, v1) == 1)
  {
    *(unsigned char *)(*(void *)(v0 + 32) + *(int *)(v0 + 224)) = 1;
    uint64_t v1 = *(void *)(v0 + 40);
  }
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 32) + *(int *)(*(void *)(v0 + 24) + 36);
  sub_100013FCC(v4, v3, &qword_100051070);
  if (v2(v3, 1, v1) == 1)
  {
    sub_100017B30(*(void *)(v0 + 144), &qword_100051070);
  }
  else
  {
    uint64_t v5 = *(void *)(v0 + 152);
    uint64_t v6 = *(void *)(v0 + 136);
    uint64_t v7 = *(void *)(v0 + 40);
    sub_10003B5A0(*(void *)(v0 + 144), *(void *)(v0 + 88), type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    sub_100013FCC(v5, v6, &qword_100051070);
    if (v2(v6, 1, v7) == 1)
    {
      uint64_t v8 = *(void *)(v0 + 136);
      sub_10003B608(*(void *)(v0 + 88), type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      sub_100017B30(v8, &qword_100051070);
    }
    else
    {
      uint64_t v10 = *(void *)(v0 + 80);
      uint64_t v9 = *(void *)(v0 + 88);
      sub_10003B5A0(*(void *)(v0 + 136), v10, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      if (sub_10003AC48(v9, v10))
      {
        sub_10003AAB4(*(void *)(v0 + 152), *(void *)(v0 + 32) + *(int *)(*(void *)(v0 + 24) + 40));
        int v11 = (void *)swift_task_alloc();
        *(void *)(v0 + 192) = v11;
        *int v11 = v0;
        unsigned int v12 = sub_100039A34;
LABEL_12:
        v11[1] = v12;
        uint64_t v17 = *(void *)(v0 + 24);
        uint64_t v18 = *(void *)(v0 + 16);
        return sub_100038E08(v18, v17);
      }
      uint64_t v13 = *(void *)(v0 + 88);
      sub_10003B608(*(void *)(v0 + 80), type metadata accessor for UniversalSuggestionsFeaturisedTurn);
      sub_10003B608(v13, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    }
  }
  uint64_t v14 = *(void *)(v0 + 128);
  uint64_t v15 = *(void *)(v0 + 40);
  sub_100013FCC(v4, v14, &qword_100051070);
  if (v2(v14, 1, v15) == 1)
  {
    uint64_t v16 = *(void *)(v0 + 152);
    sub_100017B30(*(void *)(v0 + 128), &qword_100051070);
    sub_10003AAB4(v16, v4);
    int v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 208) = v11;
    *int v11 = v0;
    unsigned int v12 = sub_100039C90;
    goto LABEL_12;
  }
  uint64_t v21 = *(void *)(v0 + 104);
  uint64_t v20 = *(void *)(v0 + 112);
  uint64_t v22 = *(void *)(v0 + 32);
  uint64_t v23 = *(void *)(v0 + 40);
  uint64_t v24 = *(void *)(v0 + 24);
  sub_10003B5A0(*(void *)(v0 + 128), *(void *)(v0 + 72), type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  uint64_t v25 = v22 + *(int *)(v24 + 40);
  sub_100013FCC(v25, v20, &qword_100051070);
  sub_100013FCC(v20, v21, &qword_100051070);
  if (v2(v21, 1, v23) == 1)
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 48) + 56))(*(void *)(v0 + 120), 1, 1, *(void *)(v0 + 40));
  }
  else
  {
    uint64_t v46 = *(void *)(v0 + 184);
    uint64_t v26 = *(void *)(v0 + 120);
    uint64_t v28 = *(void *)(v0 + 64);
    uint64_t v27 = *(void *)(v0 + 72);
    uint64_t v29 = *(void *)(v0 + 32);
    sub_10003B5A0(*(void *)(v0 + 104), v28, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    sub_10003A230(v28, v29, v27, v26);
    uint64_t result = sub_10003B608(v28, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    if (v46) {
      return result;
    }
  }
  uint64_t v30 = *(void *)(v0 + 152);
  uint64_t v31 = *(void *)(v0 + 96);
  uint64_t v47 = *(void *)(v0 + 72);
  uint64_t v32 = *(void *)(v0 + 48);
  uint64_t v44 = *(void *)(v0 + 120);
  uint64_t v45 = *(void *)(v0 + 56);
  uint64_t v33 = *(void *)(v0 + 40);
  sub_100017B30(*(void *)(v0 + 112), &qword_100051070);
  sub_10003AAB4(v30, v4);
  sub_100017B30(v25, &qword_100051070);
  uint64_t v34 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56);
  v34(v25, 1, 1, v33);
  sub_1000157D8(v44, v31, &qword_100051070);
  sub_10003AB1C(v47, v45);
  unsigned int v35 = v2(v31, 1, v33);
  uint64_t v36 = *(void *)(v0 + 96);
  uint64_t v37 = *(void *)(v0 + 56);
  uint64_t v38 = *(void *)(v0 + 16);
  uint64_t v39 = v34;
  if (v35 == 1)
  {
    sub_10003B5A0(v37, *(void *)(v0 + 16), type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    sub_100017B30(v36, &qword_100051070);
  }
  else
  {
    sub_10003B608(v37, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    sub_10003B5A0(v36, v38, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  }
  uint64_t v40 = *(void *)(v0 + 152);
  uint64_t v41 = *(void *)(v0 + 40);
  uint64_t v42 = *(void *)(v0 + 16);
  sub_10003B608(*(void *)(v0 + 72), type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  sub_100017B30(v40, &qword_100051070);
  v39(v42, 0, 1, v41);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v43 = *(uint64_t (**)(void))(v0 + 8);
  return v43();
}

uint64_t sub_100039A34()
{
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100039FC8;
  }
  else {
    uint64_t v2 = sub_100039B48;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100039B48()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[11];
  sub_10003B608(v0[10], type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  sub_10003B608(v2, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  sub_100017B30(v1, &qword_100051070);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_100039C90()
{
  *(void *)(*(void *)v1 + 216) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10003A114;
  }
  else {
    uint64_t v2 = sub_100039DA4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100039DA4()
{
  sub_100017B30(*(void *)(v0 + 152), &qword_100051070);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100039EBC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100039FC8()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[11];
  sub_10003B608(v0[10], type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  sub_10003B608(v2, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  sub_100017B30(v1, &qword_100051070);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_10003A114()
{
  sub_100017B30(*(void *)(v0 + 152), &qword_100051070);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10003A230@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for UniversalSuggestionsPromptCoalescedAsyncSequence.UniversalSuggestionsPromptCoalescedFeaturisedTurnAsyncIterator();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  int v11 = (char *)&v14 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v14 - v10, a2, v8);
  sub_10003A38C(a3, a1, a4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v12 = type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a4, 0, 1, v12);
}

uint64_t sub_10003A38C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v5 = (int *)type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  __chkstk_darwin(v5);
  uint64_t v7 = &v36[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_100006080(&qword_100051088);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = &v36[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_100044540();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = &v36[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = sub_100006080(&qword_100051090);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = &v36[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100013FCC(a1, (uint64_t)v17, &qword_100051090);
  uint64_t v18 = a1 + v5[5];
  uint64_t v38 = v12;
  uint64_t v19 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v42 = v14;
  uint64_t v43 = v11;
  v19(v14, v18, v11);
  uint64_t v20 = *(void *)(a1 + v5[6]);
  uint64_t v21 = (uint64_t *)(a1 + v5[8]);
  uint64_t v23 = *v21;
  uint64_t v22 = v21[1];
  uint64_t v24 = *(void *)(a1 + v5[9]);
  uint64_t v39 = *(void *)(a1 + v5[7]);
  uint64_t v40 = v24;
  uint64_t v25 = a1 + v5[10];
  uint64_t v44 = v10;
  sub_100013FCC(v25, (uint64_t)v10, &qword_100051088);
  uint64_t v26 = a1 + v5[11];
  int v27 = *(_DWORD *)v26;
  LODWORD(v10) = *(unsigned __int8 *)(v26 + 4);
  sub_10003AB1C(v41, (uint64_t)v7);
  if (v10 == 1)
  {
    uint64_t v28 = &v7[v5[11]];
    LODWORD(v41) = *(_DWORD *)v28;
    int v37 = v28[4];
  }
  else
  {
    int v37 = 0;
    LODWORD(v41) = v27;
  }
  swift_bridgeObjectRetain();
  uint64_t v29 = v39;
  swift_bridgeObjectRetain();
  uint64_t v30 = v22;
  sub_100013C68(v23);
  uint64_t v31 = v40;
  swift_bridgeObjectRetain();
  sub_10003B608((uint64_t)v7, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  uint64_t v32 = *(void *)(a1 + v5[12]);
  sub_1000157D8((uint64_t)v17, a3, &qword_100051090);
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v38 + 32))(a3 + v5[5], v42, v43);
  *(void *)(a3 + v5[6]) = v20;
  *(void *)(a3 + v5[7]) = v29;
  uint64_t v33 = (uint64_t *)(a3 + v5[8]);
  *uint64_t v33 = v23;
  v33[1] = v30;
  *(void *)(a3 + v5[9]) = v31;
  sub_1000157D8((uint64_t)v44, a3 + v5[10], &qword_100051088);
  uint64_t v34 = a3 + v5[11];
  *(_DWORD *)uint64_t v34 = v41;
  *(unsigned char *)(v34 + 4) = v37;
  *(void *)(a3 + v5[12]) = v32;
  return swift_bridgeObjectRetain();
}

uint64_t sub_10003A6E0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100013AFC;
  return sub_100038E08(a1, a2);
}

uint64_t sub_10003A788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 24) = a4;
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v12;
  *uint64_t v12 = v6;
  v12[1] = sub_10003A868;
  return _sScIsE4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKF(a1, a2, a3, a5, a6, v6 + 16);
}

uint64_t sub_10003A868()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0) {
    **(void **)(v2 + 24) = *(void *)(v2 + 16);
  }
  uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
  return v4();
}

uint64_t sub_10003A978@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  __chkstk_darwin(a1);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v6 + 16))(v5);
  return sub_100038BCC((uint64_t)v5, v3, a2);
}

uint64_t sub_10003AA48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_10003A978(a1, a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8);
  return v4(v2, a1);
}

void *sub_10003AAA8()
{
  return &protocol self-conformance witness table for Error;
}

uint64_t sub_10003AAB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006080(&qword_100051070);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003AB1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003AB80()
{
  uint64_t v0 = sub_100044D60();
  sub_100013740(v0, qword_100051C88);
  uint64_t v1 = sub_1000136A8(v0, (uint64_t)qword_100051C88);
  if (qword_100050C68 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000136A8(v0, (uint64_t)qword_100052920);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_10003AC48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UniversalSuggestionsFeaturisedTurn(0);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v85 = (uint64_t)v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v86 = (char *)v81 - v7;
  uint64_t v8 = sub_100044820();
  Class isa = v8[-1].isa;
  os_log_t v89 = v8;
  __chkstk_darwin(v8);
  uint64_t v87 = (char *)v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100006080(&qword_100051088);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)v81 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)v81 - v14;
  uint64_t v16 = type metadata accessor for UniversalSuggestionsPromptState(0);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)v81 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)v81 - v21;
  uint64_t v23 = *(int *)(v4 + 40);
  uint64_t v84 = a1;
  sub_100013FCC(a1 + v23, (uint64_t)v15, &qword_100051088);
  uint64_t v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
  if (v24(v15, 1, v16) == 1)
  {
    sub_100017B30((uint64_t)v15, &qword_100051088);
    return 0;
  }
  sub_10003B5A0((uint64_t)v15, (uint64_t)v22, type metadata accessor for UniversalSuggestionsPromptState);
  sub_100013FCC(a2 + *(int *)(v4 + 40), (uint64_t)v13, &qword_100051088);
  if (v24(v13, 1, v16) == 1)
  {
    sub_10003B608((uint64_t)v22, type metadata accessor for UniversalSuggestionsPromptState);
    sub_100017B30((uint64_t)v13, &qword_100051088);
    return 0;
  }
  uint64_t v25 = (uint64_t)v20;
  sub_10003B5A0((uint64_t)v13, (uint64_t)v20, type metadata accessor for UniversalSuggestionsPromptState);
  if ((sub_100044530() & 1) == 0)
  {
    sub_10003B608((uint64_t)v20, type metadata accessor for UniversalSuggestionsPromptState);
    uint64_t v35 = (uint64_t)v22;
LABEL_21:
    sub_10003B608(v35, type metadata accessor for UniversalSuggestionsPromptState);
    return 0;
  }
  uint64_t v82 = a2;
  os_log_type_t v83 = v22;
  uint64_t v26 = *(int *)(v16 + 20);
  uint64_t v27 = swift_bridgeObjectRetain();
  uint64_t v28 = sub_10000D1EC(v27);
  uint64_t v30 = v29;
  swift_bridgeObjectRelease();
  if (!v30)
  {
LABEL_20:
    sub_10003B608(v25, type metadata accessor for UniversalSuggestionsPromptState);
    uint64_t v35 = (uint64_t)v83;
    goto LABEL_21;
  }
  v81[1] = v26;
  uint64_t v31 = swift_bridgeObjectRetain();
  uint64_t v32 = sub_10000D1EC(v31);
  uint64_t v34 = v33;
  swift_bridgeObjectRelease();
  if (!v34) {
    goto LABEL_16;
  }
  if (v28 != v32 || v30 != v34)
  {
    char v36 = sub_100045110();
    swift_bridgeObjectRelease();
    if (v36) {
      goto LABEL_13;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
LABEL_13:
  Class v38 = isa;
  os_log_t v37 = v89;
  uint64_t v39 = v28;
  uint64_t v40 = v87;
  (*((void (**)(char *, void, os_log_t))isa + 13))(v87, enum case for PromptEventType.Beginning.disambiguation(_:), v89);
  uint64_t v41 = sub_100044810();
  uint64_t v43 = v42;
  (*((void (**)(char *, os_log_t))v38 + 1))(v40, v37);
  if (v39 == v41 && v30 == v43)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v44 = sub_100045110();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v44 & 1) == 0) {
      goto LABEL_20;
    }
  }
  uint64_t v45 = swift_bridgeObjectRetain();
  sub_10000D204(v45);
  uint64_t v47 = v46;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v47) {
    goto LABEL_20;
  }
  uint64_t v48 = swift_bridgeObjectRetain();
  sub_10000D3B4(v48);
  uint64_t v50 = v49;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v50) {
    goto LABEL_20;
  }
  uint64_t v52 = swift_bridgeObjectRetain();
  uint64_t v53 = sub_10000D3CC(v52);
  uint64_t v55 = v54;
  swift_bridgeObjectRelease();
  if (!v55) {
    goto LABEL_20;
  }
  uint64_t v56 = swift_bridgeObjectRetain();
  uint64_t v57 = sub_10000D3E4(v56);
  uint64_t v59 = v58;
  swift_bridgeObjectRelease();
  if (!v59) {
    goto LABEL_16;
  }
  uint64_t v60 = swift_bridgeObjectRetain();
  uint64_t v61 = sub_10000D3CC(v60);
  uint64_t v63 = v62;
  swift_bridgeObjectRelease();
  if (!v63) {
    goto LABEL_31;
  }
  uint64_t v64 = swift_bridgeObjectRetain();
  os_log_t v89 = (os_log_t)sub_10000D3E4(v64);
  uint64_t v66 = v65;
  swift_bridgeObjectRelease();
  if (!v66)
  {
    swift_bridgeObjectRelease();
LABEL_31:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  if (v53 != v61 || v55 != v63)
  {
    char v67 = sub_100045110();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v67) {
      goto LABEL_34;
    }
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_34:
  if (v57 != v89 || v59 != v66)
  {
    char v69 = sub_100045110();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v68 = (uint64_t)v86;
    if (v69) {
      goto LABEL_38;
    }
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v68 = (uint64_t)v86;
LABEL_38:
  if (qword_100050CC8 != -1) {
    swift_once();
  }
  uint64_t v70 = sub_100044D60();
  sub_1000136A8(v70, (uint64_t)qword_100051C88);
  sub_10003AB1C(v82, v68);
  uint64_t v71 = v85;
  sub_10003AB1C(v84, v85);
  unsigned int v72 = sub_100044D40();
  os_log_type_t v73 = sub_100044F30();
  int v74 = v73;
  if (os_log_type_enabled(v72, v73))
  {
    uint64_t v75 = swift_slowAlloc();
    uint64_t v87 = (char *)swift_slowAlloc();
    uint64_t v91 = v87;
    *(_DWORD *)uint64_t v75 = 136315394;
    uint64_t v86 = (char *)(v75 + 4);
    os_log_t v89 = v72;
    sub_100044540();
    sub_10003B668(&qword_100050FE8, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v76 = sub_1000450F0();
    uint64_t v90 = sub_1000434C0(v76, v77, (uint64_t *)&v91);
    LODWORD(isa) = v74;
    sub_100044FA0();
    swift_bridgeObjectRelease();
    sub_10003B608(v68, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    *(_WORD *)(v75 + 12) = 2080;
    uint64_t v78 = sub_1000450F0();
    uint64_t v90 = sub_1000434C0(v78, v79, (uint64_t *)&v91);
    sub_100044FA0();
    swift_bridgeObjectRelease();
    sub_10003B608(v71, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    os_log_t v80 = v89;
    _os_log_impl((void *)&_mh_execute_header, v89, (os_log_type_t)isa, "Coalescing a featurised turn with request id %s into turn with request id %s due to a reprompt", (uint8_t *)v75, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    sub_10003B608(v71, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
    sub_10003B608(v68, type metadata accessor for UniversalSuggestionsFeaturisedTurn);
  }
  sub_10003B608(v25, type metadata accessor for UniversalSuggestionsPromptState);
  sub_10003B608((uint64_t)v83, type metadata accessor for UniversalSuggestionsPromptState);
  return 1;
}

uint64_t sub_10003B5A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10003B608(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10003B668(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for UniversalSuggestionsPromptCoalescedAsyncSequence.UniversalSuggestionsPromptCoalescedFeaturisedTurnAsyncIterator()
{
  return sub_10003B6C8();
}

uint64_t sub_10003B6C8()
{
  return swift_getGenericMetadata();
}

uint64_t sub_10003B6F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

void sub_10003B700()
{
  swift_getAssociatedTypeWitness();
  if (v0 <= 0x3F)
  {
    sub_100042028();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_10003B7E8(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v109 = sub_100044510();
  uint64_t v6 = *(void *)(v109 - 8);
  int v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = sub_100044540();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = v9;
  int v11 = *(_DWORD *)(v9 + 80);
  unsigned int v12 = *(_DWORD *)(v9 + 84);
  uint64_t v114 = v9;
  uint64_t v115 = v8;
  uint64_t v13 = v11;
  uint64_t v14 = v7 & 0xF8 | v11 | 7u;
  uint64_t v112 = v6;
  int v15 = *(_DWORD *)(v6 + 84);
  if (v15) {
    unsigned int v16 = v15 - 1;
  }
  else {
    unsigned int v16 = 0;
  }
  if (v12 <= v16) {
    unsigned int v17 = v16;
  }
  else {
    unsigned int v17 = *(_DWORD *)(v9 + 84);
  }
  unsigned int v117 = *(_DWORD *)(v9 + 84);
  if (v12 <= 0x7FFFFFFF) {
    unsigned int v12 = 0x7FFFFFFF;
  }
  unsigned int v18 = v12 - 1;
  if (v17 <= v18) {
    unsigned int v19 = v18;
  }
  else {
    unsigned int v19 = v17;
  }
  if (v19 <= 0x7FFFFFFF) {
    int v20 = 0x7FFFFFFF;
  }
  else {
    int v20 = v19;
  }
  unsigned int v113 = *(_DWORD *)(v6 + 84);
  if (v15) {
    uint64_t v21 = *(void *)(v6 + 64);
  }
  else {
    uint64_t v21 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v22 = *(void *)(v9 + 64);
  uint64_t v23 = *(_DWORD *)(v4 + 80) & 0xF8 | v14;
  if (v23 == 7 && ((v11 | v7 | *(_DWORD *)(v4 + 80)) & 0x100000) == 0)
  {
    uint64_t v25 = v5 + v14;
    unint64_t v26 = v11 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
    uint64_t v27 = v22 + 7;
    unint64_t v28 = (v22 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v111 = v21 + v13;
    uint64_t v110 = v13 + 8;
    unint64_t v106 = v26;
    unint64_t v100 = v28 + 20;
    size_t v29 = ((v28
          + 20
          + ((v13
            + 8
            + ((((((((v22 + 7 + ((v21 + v13) & ~v13)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
              + 23) & 0xFFFFFFFFFFFFFFF8)) & v26)) & 0xFFFFFFFFFFFFFFF8)
        + 8;
    if ((((((v25 | v14) + v29) & ~v14) + v29) | 1) <= 0x18)
    {
      unsigned int v95 = v19;
      size_t __n = v21;
      uint64_t v97 = *(void *)(v6 + 64);
      uint64_t v98 = *(_DWORD *)(v10 + 80);
      uint64_t v30 = ~v13;
      size_t v104 = v28 + 8;
      int v107 = v20;
      unsigned int v108 = v16;
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v4 + 16))(a1, a2, AssociatedTypeWitness);
      uint64_t v31 = (void *)(((unint64_t)a1 + v25) & ~v14);
      unint64_t v102 = (unint64_t)a2 + v25;
      uint64_t v103 = ~v14;
      uint64_t v32 = (const void *)(((unint64_t)a2 + v25) & ~v14);
      size_t v105 = v29;
      uint64_t v99 = v30;
      unint64_t v101 = (unint64_t)a1 + v25;
      if (v108 == v107)
      {
        uint64_t v33 = v113;
        uint64_t v34 = v30;
        uint64_t v35 = v109;
        uint64_t v36 = v6;
        uint64_t v37 = v27;
        if (v113 < 2)
        {
LABEL_28:
          if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v36 + 48))(v32, 1, v35))
          {
            memcpy(v31, v32, __n);
          }
          else
          {
            (*(void (**)(void *, const void *, uint64_t))(v36 + 16))(v31, v32, v35);
            (*(void (**)(void *, void, uint64_t, uint64_t))(v36 + 56))(v31, 0, 1, v35);
          }
          unint64_t v45 = ((unint64_t)v31 + v111) & v34;
          unint64_t v46 = ((unint64_t)v32 + v111) & v34;
          uint64_t v47 = *(void (**)(unint64_t, unint64_t, uint64_t))(v114 + 16);
          v47(v45, v46, v115);
          uint64_t v48 = v37;
          uint64_t v49 = (void *)((v37 + v46) & 0xFFFFFFFFFFFFFFF8);
          uint64_t v50 = (void *)((v37 + v45) & 0xFFFFFFFFFFFFFFF8);
          *uint64_t v50 = *v49;
          int v51 = (void *)(((unint64_t)v49 + 15) & 0xFFFFFFFFFFFFFFF8);
          uint64_t v52 = (void *)(((unint64_t)v50 + 15) & 0xFFFFFFFFFFFFFFF8);
          *uint64_t v52 = *v51;
          unint64_t v53 = ((unint64_t)v52 + 15) & 0xFFFFFFFFFFFFFFF8;
          uint64_t v54 = (unint64_t *)(((unint64_t)v51 + 15) & 0xFFFFFFFFFFFFFFF8);
          unint64_t v55 = *v54;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v55 < 0xFFFFFFFF)
          {
            *(_OWORD *)unint64_t v53 = *(_OWORD *)v54;
          }
          else
          {
            *(void *)unint64_t v53 = v55;
            *(void *)(v53 + 8) = v54[1];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
          }
          uint64_t v56 = (void *)((v53 + 23) & 0xFFFFFFFFFFFFFFF8);
          uint64_t v57 = (void *)(((unint64_t)v54 + 23) & 0xFFFFFFFFFFFFFFF8);
          *uint64_t v56 = *v57;
          uint64_t v58 = (char *)(((unint64_t)v56 + v110) & v106);
          uint64_t v59 = (char *)(((unint64_t)v57 + v110) & v106);
          swift_bridgeObjectRetain();
          if (v117 < 0x7FFFFFFF)
          {
            uint64_t v37 = v48;
            unint64_t v61 = *(void *)((unint64_t)&v59[v48] & 0xFFFFFFFFFFFFFFF8);
            if (v61 >= 0xFFFFFFFF) {
              LODWORD(v61) = -1;
            }
            int v60 = v61 + 1;
          }
          else
          {
            int v60 = (*(uint64_t (**)(char *, void, uint64_t))(v114 + 48))(v59, v117, v115);
            uint64_t v37 = v48;
          }
          uint64_t v34 = v99;
          size_t v29 = v105;
          if (v60)
          {
            size_t v62 = v104;
            memcpy(v58, v59, v104);
            uint64_t v33 = v113;
          }
          else
          {
            v47((unint64_t)v58, (unint64_t)v59, v115);
            *(void *)((unint64_t)&v58[v37] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v59[v37] & 0xFFFFFFFFFFFFFFF8);
            swift_bridgeObjectRetain();
            uint64_t v33 = v113;
            size_t v62 = v104;
          }
          uint64_t v63 = &v58[v62];
          int v64 = *(_DWORD *)&v59[v62];
          v63[4] = v59[v62 + 4];
          *(_DWORD *)uint64_t v63 = v64;
          *(void *)((unint64_t)&v58[v62 + 12] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v59[v62 + 12] & 0xFFFFFFFFFFFFFFF8);
          swift_bridgeObjectRetain();
          unint64_t v42 = v105;
          uint64_t v36 = v112;
          if (v33) {
            unint64_t v42 = ((v100
          }
                  + ((v110
                    + ((((((((v37 + ((v97 + v98) & v99)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
                      + 23) & 0xFFFFFFFFFFFFFFF8)) & v106)) & 0xFFFFFFFFFFFFFFF8)
                + 8;
LABEL_53:
          uint64_t v65 = (void *)(((v101 | v14) + v42) & v103);
          uint64_t v66 = (const void *)(((v102 | v14) + v42) & v103);
          if (v108 == v107)
          {
            if (v33 < 2) {
              goto LABEL_57;
            }
            unsigned int v67 = (*(uint64_t (**)(const void *, uint64_t, uint64_t))(v36 + 48))(v66, v33, v35);
LABEL_56:
            if (v67 < 2) {
              goto LABEL_57;
            }
LABEL_61:
            memcpy(v65, v66, v29);
            uint64_t v40 = a1;
LABEL_80:
            *((unsigned char *)v65 + v29) = *((unsigned char *)v66 + v29);
            return v40;
          }
          unint64_t v69 = ((unint64_t)v66 + v111) & v34;
          if (v117 == v107)
          {
            if ((*(unsigned int (**)(unint64_t, void, uint64_t))(v114 + 48))(v69, v117, v115)) {
              goto LABEL_61;
            }
          }
          else
          {
            uint64_t v70 = (unint64_t *)((v37 + v69) & 0xFFFFFFFFFFFFFFF8);
            if ((v95 & 0x80000000) != 0)
            {
              unint64_t v92 = (v110
                   + (((((((unint64_t)v70 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & v106;
              if (v117 >= 0x7FFFFFFF)
              {
                unsigned int v67 = (*(uint64_t (**)(unint64_t, void, uint64_t))(v114 + 48))(v92, v117, v115);
                goto LABEL_56;
              }
              unint64_t v94 = *(void *)((v37 + v92) & 0xFFFFFFFFFFFFFFF8);
              if (v94 >= 0xFFFFFFFF) {
                LODWORD(v94) = -1;
              }
              if ((v94 + 1) >= 2) {
                goto LABEL_61;
              }
            }
            else
            {
              unint64_t v71 = *v70;
              if (v71 >= 0xFFFFFFFF) {
                LODWORD(v71) = -1;
              }
              if (v71 != -1) {
                goto LABEL_61;
              }
            }
          }
LABEL_57:
          if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v36 + 48))(v66, 1, v35))
          {
            unint64_t v68 = v106;
            memcpy(v65, v66, __n);
          }
          else
          {
            uint64_t v72 = v36;
            unint64_t v68 = v106;
            (*(void (**)(void *, const void *, uint64_t))(v72 + 16))(v65, v66, v35);
            (*(void (**)(void *, void, uint64_t, uint64_t))(v72 + 56))(v65, 0, 1, v35);
          }
          os_log_type_t v73 = *(void (**)(unint64_t, unint64_t, uint64_t))(v114 + 16);
          v73(((unint64_t)v65 + v111) & v34, ((unint64_t)v66 + v111) & v34, v115);
          uint64_t v74 = v37;
          uint64_t v75 = (void *)((v37 + (((unint64_t)v66 + v111) & v34)) & 0xFFFFFFFFFFFFFFF8);
          uint64_t v76 = (void *)((v37 + (((unint64_t)v65 + v111) & v34)) & 0xFFFFFFFFFFFFFFF8);
          *uint64_t v76 = *v75;
          unint64_t v77 = (void *)(((unint64_t)v75 + 15) & 0xFFFFFFFFFFFFFFF8);
          uint64_t v78 = (void *)(((unint64_t)v76 + 15) & 0xFFFFFFFFFFFFFFF8);
          *uint64_t v78 = *v77;
          unint64_t v79 = ((unint64_t)v78 + 15) & 0xFFFFFFFFFFFFFFF8;
          os_log_t v80 = (unint64_t *)(((unint64_t)v77 + 15) & 0xFFFFFFFFFFFFFFF8);
          unint64_t v81 = *v80;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v81 < 0xFFFFFFFF)
          {
            *(_OWORD *)unint64_t v79 = *(_OWORD *)v80;
          }
          else
          {
            *(void *)unint64_t v79 = v81;
            *(void *)(v79 + 8) = v80[1];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
          }
          uint64_t v82 = (void *)((v79 + 23) & 0xFFFFFFFFFFFFFFF8);
          os_log_type_t v83 = (void *)(((unint64_t)v80 + 23) & 0xFFFFFFFFFFFFFFF8);
          *uint64_t v82 = *v83;
          uint64_t v84 = (char *)(((unint64_t)v82 + v110) & v68);
          uint64_t v85 = (char *)(((unint64_t)v83 + v110) & v68);
          swift_bridgeObjectRetain();
          if (v117 < 0x7FFFFFFF)
          {
            unint64_t v87 = *(void *)((unint64_t)&v85[v74] & 0xFFFFFFFFFFFFFFF8);
            if (v87 >= 0xFFFFFFFF) {
              LODWORD(v87) = -1;
            }
            if (v87 != -1) {
              goto LABEL_73;
            }
          }
          else if ((*(unsigned int (**)(char *, void, uint64_t))(v114 + 48))(v85, v117, v115))
          {
LABEL_73:
            size_t v86 = v104;
            memcpy(v84, v85, v104);
            goto LABEL_78;
          }
          v73((unint64_t)v84, (unint64_t)v85, v115);
          *(void *)((unint64_t)&v84[v74] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v85[v74] & 0xFFFFFFFFFFFFFFF8);
          swift_bridgeObjectRetain();
          size_t v86 = v104;
LABEL_78:
          uint64_t v88 = &v84[v86];
          int v89 = *(_DWORD *)&v85[v86];
          v88[4] = v85[v86 + 4];
          *(_DWORD *)uint64_t v88 = v89;
          *(void *)((unint64_t)&v84[v86 + 12] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v85[v86 + 12] & 0xFFFFFFFFFFFFFFF8);
          swift_bridgeObjectRetain();
          uint64_t v40 = a1;
          size_t v29 = v105;
          if (v113) {
            size_t v29 = ((v100
          }
                  + ((v110
                    + ((((((((v74 + ((v97 + v98) & v99)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
                      + 23) & 0xFFFFFFFFFFFFFFF8)) & v68)) & 0xFFFFFFFFFFFFFFF8)
                + 8;
          goto LABEL_80;
        }
        unsigned int v38 = (*(uint64_t (**)(const void *, void, uint64_t))(v112 + 48))(v32, v113, v109);
      }
      else
      {
        unint64_t v41 = ((unint64_t)v32 + v111) & v30;
        uint64_t v33 = v113;
        uint64_t v34 = v30;
        if (v117 == v107)
        {
          uint64_t v35 = v109;
          uint64_t v36 = v6;
          uint64_t v37 = v27;
          if (!(*(unsigned int (**)(unint64_t, void, uint64_t))(v114 + 48))(v41, v117, v115)) {
            goto LABEL_28;
          }
          goto LABEL_33;
        }
        uint64_t v37 = v27;
        uint64_t v43 = (unint64_t *)((v27 + v41) & 0xFFFFFFFFFFFFFFF8);
        if ((v95 & 0x80000000) == 0)
        {
          unint64_t v44 = *v43;
          if (v44 >= 0xFFFFFFFF) {
            LODWORD(v44) = -1;
          }
          uint64_t v35 = v109;
          uint64_t v36 = v112;
          if (v44 == -1) {
            goto LABEL_28;
          }
          goto LABEL_33;
        }
        uint64_t v35 = v109;
        unint64_t v91 = (v110
             + (((((((unint64_t)v43 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & v106;
        uint64_t v36 = v112;
        if (v117 < 0x7FFFFFFF)
        {
          unint64_t v93 = *(void *)((v27 + v91) & 0xFFFFFFFFFFFFFFF8);
          if (v93 >= 0xFFFFFFFF) {
            LODWORD(v93) = -1;
          }
          if ((v93 + 1) < 2) {
            goto LABEL_28;
          }
          goto LABEL_33;
        }
        unsigned int v38 = (*(uint64_t (**)(unint64_t, void, uint64_t))(v114 + 48))(v91, v117, v115);
      }
      if (v38 < 2) {
        goto LABEL_28;
      }
LABEL_33:
      memcpy(v31, v32, v29);
      unint64_t v42 = v29;
      goto LABEL_53;
    }
  }
  uint64_t v39 = *a2;
  *a1 = *a2;
  uint64_t v40 = (uint64_t *)(v39 + ((v23 + 16) & ~v23));
  swift_retain();
  return v40;
}

uint64_t sub_10003C294(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8) + 8;
  (*(void (**)(uint64_t, uint64_t))v3)(a1, AssociatedTypeWitness);
  uint64_t v4 = *(void *)(v3 + 56);
  uint64_t v85 = sub_100044510();
  uint64_t v5 = *(void *)(v85 - 8);
  int v6 = *(_DWORD *)(v5 + 80) & 0xF8;
  uint64_t v84 = sub_100044540();
  uint64_t v7 = *(void *)(v84 - 8);
  int v8 = *(_DWORD *)(v7 + 80);
  uint64_t v9 = *(unsigned int *)(v7 + 84);
  uint64_t v86 = v5;
  uint64_t v87 = v7;
  uint64_t v10 = v8;
  uint64_t v11 = v6 | v8 | 7u;
  uint64_t v82 = ~v11;
  uint64_t v12 = (v4 + a1 + v11) & ~v11;
  uint64_t v13 = *(unsigned int *)(v5 + 84);
  if (v13) {
    unsigned int v14 = v13 - 1;
  }
  else {
    unsigned int v14 = 0;
  }
  if (v9 <= v14) {
    unsigned int v15 = v14;
  }
  else {
    unsigned int v15 = *(_DWORD *)(v7 + 84);
  }
  if (v9 <= 0x7FFFFFFF) {
    int v16 = 0x7FFFFFFF;
  }
  else {
    int v16 = *(_DWORD *)(v7 + 84);
  }
  unsigned int v17 = v16 - 1;
  if (v15 <= v17) {
    unsigned int v18 = v17;
  }
  else {
    unsigned int v18 = v15;
  }
  if (v18 <= 0x7FFFFFFF) {
    int v19 = 0x7FFFFFFF;
  }
  else {
    int v19 = v18;
  }
  unint64_t v20 = ~(unint64_t)v8;
  unint64_t v88 = v8 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = *(void *)(v7 + 64) + 7;
  unint64_t v22 = v21 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v83 = *(void *)(v5 + 64);
  if (v14 == v19)
  {
    if (v13 >= 2)
    {
      uint64_t v23 = *(unsigned int *)(v5 + 84);
      int v24 = v19;
      unint64_t v25 = v21 & 0xFFFFFFFFFFFFFFF8;
      uint64_t v26 = v11;
      unsigned int v27 = v14;
      uint64_t v28 = *(void *)(v7 + 64) + 7;
      uint64_t v29 = v13;
      uint64_t v30 = v12;
      unsigned int v31 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v86 + 48))(v12, v23, v85);
      uint64_t v12 = v30;
      uint64_t v13 = v29;
      uint64_t v21 = v28;
      unsigned int v14 = v27;
      uint64_t v11 = v26;
      unint64_t v22 = v25;
      unint64_t v20 = ~v10;
      int v19 = v24;
      if (v31 >= 2)
      {
        BOOL v32 = 0;
        goto LABEL_52;
      }
    }
    goto LABEL_37;
  }
  BOOL v32 = v13 == 0;
  if (v13) {
    uint64_t v33 = *(_DWORD *)(v7 + 80);
  }
  else {
    uint64_t v33 = v10 + 1;
  }
  unint64_t v34 = (v33 + *(void *)(v5 + 64) + v12) & v20;
  if (v9 == v19)
  {
    int v35 = v19;
    unint64_t v80 = v21 & 0xFFFFFFFFFFFFFFF8;
    uint64_t v36 = v11;
    unsigned int v37 = v14;
    uint64_t v38 = v21;
    uint64_t v39 = v13;
    uint64_t v40 = v12;
    BOOL v41 = v32;
    int v42 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v87 + 48))(v34, v9, v84);
    BOOL v32 = v41;
    uint64_t v12 = v40;
    uint64_t v13 = v39;
    uint64_t v21 = v38;
    unsigned int v14 = v37;
    uint64_t v11 = v36;
    unint64_t v22 = v80;
    unint64_t v20 = ~v10;
    int v19 = v35;
    if (v42) {
      goto LABEL_52;
    }
LABEL_37:
    int v79 = v19;
    uint64_t v55 = v12;
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v86 + 48))(v12, 1, v85)) {
      (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v55, v85);
    }
    uint64_t v78 = v55;
    if (v13) {
      uint64_t v56 = v10;
    }
    else {
      uint64_t v56 = v10 + 1;
    }
    uint64_t v57 = (v56 + v83 + v55) & ~v10;
    uint64_t v58 = *(void (**)(uint64_t, uint64_t))(v87 + 8);
    v58(v57, v84);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v59 = (void *)((((((v21 + v57) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
    if (*v59 >= 0xFFFFFFFFuLL)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    unint64_t v60 = (v10 + (((unint64_t)v59 + 23) & 0xFFFFFFFFFFFFFFF8) + 8) & v88;
    if (v9 < 0x7FFFFFFF)
    {
      unint64_t v61 = *(void *)((v21 + v60) & 0xFFFFFFFFFFFFFFF8);
      if (v61 >= 0xFFFFFFFF) {
        LODWORD(v61) = -1;
      }
      if (v61 != -1) {
        goto LABEL_51;
      }
    }
    else if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v87 + 48))(v60, v9, v84))
    {
LABEL_51:
      swift_bridgeObjectRelease();
      unint64_t v20 = ~v10;
      int v19 = v79;
      BOOL v32 = v13 == 0;
      uint64_t v12 = v78;
      goto LABEL_52;
    }
    v58(v60, v84);
    swift_bridgeObjectRelease();
    goto LABEL_51;
  }
  uint64_t v43 = (unint64_t *)((v21 + v34) & 0xFFFFFFFFFFFFFFF8);
  if ((v18 & 0x80000000) != 0)
  {
    unint64_t v45 = (v10
         + (((((((unint64_t)v43 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
         + 8) & v88;
    if (v9 < 0x7FFFFFFF)
    {
      unint64_t v54 = *(void *)((v21 + v45) & 0xFFFFFFFFFFFFFFF8);
      if (v54 >= 0xFFFFFFFF) {
        LODWORD(v54) = -1;
      }
      if ((v54 + 1) < 2) {
        goto LABEL_37;
      }
    }
    else
    {
      int v46 = v19;
      unint64_t v81 = v21 & 0xFFFFFFFFFFFFFFF8;
      uint64_t v47 = v11;
      unsigned int v48 = v14;
      uint64_t v49 = v21;
      uint64_t v50 = v13;
      uint64_t v51 = v12;
      BOOL v52 = v32;
      unsigned int v53 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v87 + 48))(v45, v9, v84);
      BOOL v32 = v52;
      uint64_t v12 = v51;
      uint64_t v13 = v50;
      uint64_t v21 = v49;
      unsigned int v14 = v48;
      uint64_t v11 = v47;
      unint64_t v22 = v81;
      unint64_t v20 = ~v10;
      int v19 = v46;
      if (v53 < 2) {
        goto LABEL_37;
      }
    }
  }
  else
  {
    unint64_t v44 = *v43;
    if (v44 >= 0xFFFFFFFF) {
      LODWORD(v44) = -1;
    }
    if (v44 == -1) {
      goto LABEL_37;
    }
  }
LABEL_52:
  uint64_t v62 = v83 + v32 + v10;
  uint64_t v63 = v10 + 8;
  unint64_t v64 = (v11
       + v12
       + ((v22
         + 20
         + ((v63
           + ((((((((v21 + (v62 & v20)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
             + 23) & 0xFFFFFFFFFFFFFFF8)) & v88)) & 0xFFFFFFFFFFFFFFF8)
       + 8) & v82;
  if (v14 == v19)
  {
    uint64_t v65 = v85;
    uint64_t v66 = v86;
    uint64_t v67 = v84;
    if (v13 < 2) {
      goto LABEL_56;
    }
    uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v86 + 48))(v64, v13, v85);
    goto LABEL_55;
  }
  unint64_t v72 = (v62 + v64) & v20;
  uint64_t v66 = v86;
  uint64_t v67 = v84;
  if (v9 == v19)
  {
    uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v87 + 48))(v72, v9, v84);
    uint64_t v65 = v85;
    if (result) {
      return result;
    }
LABEL_56:
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v66 + 48))(v64, 1, v65)) {
      (*(void (**)(unint64_t, uint64_t))(v66 + 8))(v64, v65);
    }
    unint64_t v69 = *(void (**)(unint64_t, uint64_t))(v87 + 8);
    v69((v62 + v64) & v20, v67);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v70 = (void *)((((((v21 + ((v62 + v64) & v20)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
    if (*v70 >= 0xFFFFFFFFuLL)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    unint64_t v71 = (v63 + (((unint64_t)v70 + 23) & 0xFFFFFFFFFFFFFFF8)) & v88;
    if (v9 < 0x7FFFFFFF)
    {
      unint64_t v73 = *(void *)((v21 + v71) & 0xFFFFFFFFFFFFFFF8);
      if (v73 >= 0xFFFFFFFF) {
        LODWORD(v73) = -1;
      }
      if (v73 != -1) {
        goto LABEL_70;
      }
    }
    else if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v87 + 48))(v71, v9, v67))
    {
LABEL_70:
      return swift_bridgeObjectRelease();
    }
    v69(v71, v67);
    swift_bridgeObjectRelease();
    goto LABEL_70;
  }
  uint64_t v74 = (unint64_t *)((v21 + v72) & 0xFFFFFFFFFFFFFFF8);
  if ((v18 & 0x80000000) != 0)
  {
    unint64_t v76 = (v63
         + (((((((unint64_t)v74 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & v88;
    uint64_t v65 = v85;
    if (v9 >= 0x7FFFFFFF)
    {
      uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v87 + 48))(v76, v9, v84);
LABEL_55:
      if (result >= 2) {
        return result;
      }
      goto LABEL_56;
    }
    unint64_t v77 = *(void *)((v21 + v76) & 0xFFFFFFFFFFFFFFF8);
    if (v77 >= 0xFFFFFFFF) {
      LODWORD(v77) = -1;
    }
    uint64_t result = (v77 + 1);
    if (result < 2) {
      goto LABEL_56;
    }
  }
  else
  {
    unint64_t v75 = *v74;
    if (v75 >= 0xFFFFFFFF) {
      LODWORD(v75) = -1;
    }
    uint64_t result = (v75 + 1);
    uint64_t v65 = v85;
    if (v75 == -1) {
      goto LABEL_56;
    }
  }
  return result;
}

uint64_t sub_10003CAB0(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t v109 = sub_100044510();
  uint64_t v7 = *(void *)(v109 - 8);
  int v8 = *(_DWORD *)(v7 + 80) & 0xF8;
  uint64_t v115 = sub_100044540();
  uint64_t v9 = *(void *)(v115 - 8);
  int v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = *(unsigned int *)(v9 + 84);
  uint64_t v111 = v9;
  uint64_t v12 = v10;
  uint64_t v13 = v8 | v10 | 7u;
  uint64_t v14 = v6 + v13;
  uint64_t v98 = a1;
  uint64_t v15 = v6 + v13 + a1;
  int v16 = (void *)(v15 & ~v13);
  uint64_t v17 = v14 + a2;
  unsigned int v18 = (const void *)((v14 + a2) & ~v13);
  uint64_t v108 = v7;
  uint64_t v19 = *(unsigned int *)(v7 + 84);
  if (v19) {
    unsigned int v20 = v19 - 1;
  }
  else {
    unsigned int v20 = 0;
  }
  if (v11 <= v20) {
    unsigned int v21 = v20;
  }
  else {
    unsigned int v21 = *(_DWORD *)(v9 + 84);
  }
  if (v11 <= 0x7FFFFFFF) {
    int v22 = 0x7FFFFFFF;
  }
  else {
    int v22 = *(_DWORD *)(v9 + 84);
  }
  unsigned int v23 = v22 - 1;
  if (v21 <= v23) {
    unsigned int v24 = v23;
  }
  else {
    unsigned int v24 = v21;
  }
  if (v24 <= 0x7FFFFFFF) {
    int v25 = 0x7FFFFFFF;
  }
  else {
    int v25 = v24;
  }
  size_t v26 = *(void *)(v7 + 64);
  unint64_t v27 = v10 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v105 = *(void *)(*(void *)(v115 - 8) + 64) + 7;
  unint64_t v107 = v27;
  unint64_t __n = (v105 & 0xFFFFFFFFFFFFFFF8) + 8;
  uint64_t v116 = v10;
  size_t v117 = v26;
  unint64_t v114 = ~(unint64_t)v10;
  unsigned int v112 = *(_DWORD *)(v7 + 84);
  int v103 = v25;
  uint64_t v102 = ~v13;
  unsigned int v101 = v20;
  uint64_t v99 = v15;
  uint64_t v100 = v17;
  if (v20 != v25)
  {
    BOOL v28 = v19 == 0;
    if (v19) {
      uint64_t v30 = v10;
    }
    else {
      uint64_t v30 = v10 + 1;
    }
    size_t v29 = v30 + v26;
    unint64_t v31 = ((unint64_t)v18 + v30 + v26) & ~(unint64_t)v10;
    if (v11 == v25)
    {
      if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(v31, v11, v115)) {
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v38 = (unint64_t *)((v105 + v31) & 0xFFFFFFFFFFFFFFF8);
      if ((v24 & 0x80000000) != 0)
      {
        unint64_t v71 = (v10
             + (((((((unint64_t)v38 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
             + 8) & v27;
        if (v11 < 0x7FFFFFFF)
        {
          unint64_t v73 = *(void *)((v105 + v71) & 0xFFFFFFFFFFFFFFF8);
          if (v73 >= 0xFFFFFFFF) {
            LODWORD(v73) = -1;
          }
          if ((v73 + 1) >= 2) {
            goto LABEL_25;
          }
        }
        else if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(v71, v11, v115) >= 2)
        {
          goto LABEL_25;
        }
      }
      else
      {
        unint64_t v39 = *v38;
        if (v39 >= 0xFFFFFFFF) {
          LODWORD(v39) = -1;
        }
        if (v39 != -1) {
          goto LABEL_25;
        }
      }
    }
LABEL_30:
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v108 + 48))(v18, 1, v109))
    {
      if (v19) {
        size_t v37 = v117;
      }
      else {
        size_t v37 = v117 + 1;
      }
      memcpy(v16, v18, v37);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v108 + 16))(v16, v18, v109);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v108 + 56))(v16, 0, 1, v109);
      if (v19) {
        size_t v37 = v117;
      }
      else {
        size_t v37 = v117 + 1;
      }
    }
    unint64_t v40 = ((unint64_t)v16 + v37 + v12) & v114;
    unint64_t v41 = ((unint64_t)v18 + v37 + v12) & v114;
    uint64_t v97 = *(void (**)(unint64_t, unint64_t, uint64_t))(v111 + 16);
    v97(v40, v41, v115);
    uint64_t v35 = v105;
    int v42 = (void *)((v105 + v41) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v43 = (void *)((v105 + v40) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v43 = *v42;
    unint64_t v44 = (void *)(((unint64_t)v42 + 15) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v45 = (void *)(((unint64_t)v43 + 15) & 0xFFFFFFFFFFFFFFF8);
    void *v45 = *v44;
    unint64_t v46 = ((unint64_t)v45 + 15) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v47 = (unint64_t *)(((unint64_t)v44 + 15) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v48 = *v47;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v48 < 0xFFFFFFFF)
    {
      *(_OWORD *)unint64_t v46 = *(_OWORD *)v47;
    }
    else
    {
      *(void *)unint64_t v46 = v48;
      *(void *)(v46 + 8) = v47[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    uint64_t v49 = (void *)((v46 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v50 = (void *)(((unint64_t)v47 + 23) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v49 = *v50;
    unint64_t v27 = v107;
    uint64_t v51 = (char *)(((unint64_t)v49 + v116 + 8) & v107);
    BOOL v52 = (char *)(((unint64_t)v50 + v116 + 8) & v107);
    swift_bridgeObjectRetain();
    if (v11 < 0x7FFFFFFF)
    {
      unint64_t v54 = *(void *)((unint64_t)&v52[v105] & 0xFFFFFFFFFFFFFFF8);
      if (v54 >= 0xFFFFFFFF) {
        LODWORD(v54) = -1;
      }
      if (v54 != -1) {
        goto LABEL_43;
      }
    }
    else if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v111 + 48))(v52, v11, v115))
    {
LABEL_43:
      unint64_t v53 = (v105 & 0xFFFFFFFFFFFFFFF8) + 8;
      memcpy(v51, v52, __n);
      size_t v36 = v117;
      goto LABEL_48;
    }
    v97((unint64_t)v51, (unint64_t)v52, v115);
    *(void *)((unint64_t)&v51[v105] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v52[v105] & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
    size_t v36 = v117;
    unint64_t v53 = (v105 & 0xFFFFFFFFFFFFFFF8) + 8;
LABEL_48:
    uint64_t v55 = &v51[v53];
    int v56 = *(_DWORD *)&v52[v53];
    v55[4] = v52[v53 + 4];
    *(_DWORD *)uint64_t v55 = v56;
    *(void *)((unint64_t)&v51[v53 + 12] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v52[v53 + 12] & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
    size_t v57 = v36;
    uint64_t v32 = v116 + 8;
    unint64_t v33 = v105 & 0xFFFFFFFFFFFFFFF8;
    if (v112) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
  if (v19 < 2
    || (*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(v18, v19, v109) < 2)
  {
    goto LABEL_30;
  }
  BOOL v28 = 0;
  size_t v29 = v117 + v12;
LABEL_25:
  uint64_t v32 = v12 + 8;
  unint64_t v33 = v105 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v34 = v16;
  uint64_t v35 = v105;
  memcpy(v34, v18, (((v105 & 0xFFFFFFFFFFFFFFF8)+ ((v32+ ((((((((v105 + (v29 & v114)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)) & v27)+ 20) & 0xFFFFFFFFFFFFFFF8)+ 8);
  size_t v36 = v117;
  size_t v37 = v117 + v28;
LABEL_49:
  size_t v57 = v37;
LABEL_50:
  unint64_t v106 = v33 + 20;
  unint64_t v58 = ((v33
        + 20
        + ((v32
          + ((((((((v35 + ((v57 + v116) & v114)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
            + 23) & 0xFFFFFFFFFFFFFFF8)) & v27)) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  uint64_t v59 = (void *)(((v99 | v13) + v58) & v102);
  unint64_t v60 = (const void *)(((v100 | v13) + v58) & v102);
  if (v101 == v103)
  {
    uint64_t v62 = v108;
    uint64_t v61 = v109;
    if (v112 >= 2 && (*(unsigned int (**)(const void *, void, uint64_t))(v108 + 48))(v60, v112, v109) >= 2)
    {
      size_t v63 = v117 + v116;
LABEL_64:
      size_t v69 = ((v106
            + ((v32
              + ((((((((v35 + (v63 & v114)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
                + 23) & 0xFFFFFFFFFFFFFFF8)) & v27)) & 0xFFFFFFFFFFFFFFF8)
          + 8;
      memcpy(v59, v60, v69);
      uint64_t v70 = v98;
      goto LABEL_98;
    }
  }
  else
  {
    if (v112) {
      uint64_t v64 = v116;
    }
    else {
      uint64_t v64 = v116 + 1;
    }
    size_t v63 = v64 + v36;
    unint64_t v65 = ((unint64_t)v60 + v63) & v114;
    if (v11 == v103)
    {
      int v66 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v111 + 48))(v65, v11, v115);
    }
    else
    {
      uint64_t v67 = (unint64_t *)((v35 + v65) & 0xFFFFFFFFFFFFFFF8);
      if ((v24 & 0x80000000) != 0)
      {
        unint64_t v72 = (v32
             + (((((((unint64_t)v67 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & v27;
        uint64_t v62 = v108;
        uint64_t v61 = v109;
        if (v11 < 0x7FFFFFFF)
        {
          unint64_t v74 = *(void *)((v35 + v72) & 0xFFFFFFFFFFFFFFF8);
          if (v74 >= 0xFFFFFFFF) {
            LODWORD(v74) = -1;
          }
          if ((v74 + 1) >= 2) {
            goto LABEL_64;
          }
        }
        else if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v111 + 48))(v72, v11, v115) >= 2)
        {
          goto LABEL_64;
        }
        goto LABEL_78;
      }
      unint64_t v68 = *v67;
      if (v68 >= 0xFFFFFFFF) {
        LODWORD(v68) = -1;
      }
      int v66 = v68 + 1;
    }
    uint64_t v62 = v108;
    uint64_t v61 = v109;
    if (v66) {
      goto LABEL_64;
    }
  }
LABEL_78:
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v62 + 48))(v60, 1, v61))
  {
    BOOL v110 = v112 == 0;
    if (v112) {
      size_t v75 = v117;
    }
    else {
      size_t v75 = v117 + 1;
    }
    memcpy(v59, v60, v75);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v62 + 16))(v59, v60, v61);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v62 + 56))(v59, 0, 1, v61);
    BOOL v110 = v112 == 0;
    if (v112) {
      size_t v75 = v117;
    }
    else {
      size_t v75 = v117 + 1;
    }
  }
  size_t v76 = v75 + v116;
  unsigned int v113 = v59;
  unint64_t v77 = ((unint64_t)v59 + v75 + v116) & v114;
  unint64_t v78 = ((unint64_t)v60 + v76) & v114;
  int v79 = *(void (**)(unint64_t, unint64_t, uint64_t))(v111 + 16);
  v79(v77, v78, v115);
  unint64_t v80 = (void *)((v35 + v78) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v81 = (void *)((v35 + v77) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v81 = *v80;
  uint64_t v82 = (void *)(((unint64_t)v80 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v83 = (void *)(((unint64_t)v81 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v83 = *v82;
  unint64_t v84 = ((unint64_t)v83 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v85 = (unint64_t *)(((unint64_t)v82 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v86 = *v85;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v86 < 0xFFFFFFFF)
  {
    *(_OWORD *)unint64_t v84 = *(_OWORD *)v85;
  }
  else
  {
    *(void *)unint64_t v84 = v86;
    *(void *)(v84 + 8) = v85[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v87 = (void *)((v84 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v88 = (void *)(((unint64_t)v85 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v87 = *v88;
  int v89 = (char *)(((unint64_t)v87 + v32) & v107);
  uint64_t v90 = (char *)(((unint64_t)v88 + v32) & v107);
  swift_bridgeObjectRetain();
  if (v11 < 0x7FFFFFFF)
  {
    unint64_t v92 = *(void *)((unint64_t)&v90[v35] & 0xFFFFFFFFFFFFFFF8);
    if (v92 >= 0xFFFFFFFF) {
      LODWORD(v92) = -1;
    }
    int v91 = v92 + 1;
  }
  else
  {
    int v91 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v111 + 48))(v90, v11, v115);
  }
  uint64_t v59 = v113;
  if (v91)
  {
    unint64_t v93 = __n;
    memcpy(v89, v90, __n);
    uint64_t v70 = v98;
  }
  else
  {
    v79((unint64_t)v89, (unint64_t)v90, v115);
    *(void *)((unint64_t)&v89[v35] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v90[v35] & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
    uint64_t v70 = v98;
    unint64_t v93 = __n;
  }
  unint64_t v94 = &v89[v93];
  int v95 = *(_DWORD *)&v90[v93];
  v94[4] = v90[v93 + 4];
  *(_DWORD *)unint64_t v94 = v95;
  *(void *)((unint64_t)&v89[v93 + 12] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v90[v93 + 12] & 0xFFFFFFFFFFFFFFF8);
  size_t v69 = ((v106
        + ((v32
          + ((((((((v35 + ((v110 + v116 + v117) & v114)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
            + 23) & 0xFFFFFFFFFFFFFFF8)) & v107)) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  swift_bridgeObjectRetain();
LABEL_98:
  *((unsigned char *)v59 + v69) = *((unsigned char *)v60 + v69);
  return v70;
}

uint64_t sub_10003D574(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 40);
  uint64_t v237 = sub_100044510();
  uint64_t v7 = *(void *)(v237 - 8);
  int v8 = *(_DWORD *)(v7 + 80) & 0xF8;
  uint64_t v248 = sub_100044540();
  uint64_t v9 = *(void *)(v248 - 8);
  int v11 = *(_DWORD *)(v9 + 80);
  unsigned int v10 = *(_DWORD *)(v9 + 84);
  int v12 = v8 | v11;
  uint64_t v13 = v7;
  uint64_t v14 = v12 | 7u;
  uint64_t v228 = a1;
  uint64_t v15 = v6 + v14 + a1;
  uint64_t v16 = v11;
  uint64_t v17 = (void *)(v15 & ~v14);
  unsigned int v18 = (void *)((v6 + v14 + a2) & ~v14);
  unsigned int v19 = *(_DWORD *)(v7 + 84);
  if (v19) {
    unsigned int v20 = v19 - 1;
  }
  else {
    unsigned int v20 = 0;
  }
  if (v10 <= v20) {
    unsigned int v21 = v20;
  }
  else {
    unsigned int v21 = *(_DWORD *)(v9 + 84);
  }
  if (v10 <= 0x7FFFFFFF) {
    int v22 = 0x7FFFFFFF;
  }
  else {
    int v22 = *(_DWORD *)(v9 + 84);
  }
  unsigned int v23 = v22 - 1;
  if (v21 <= v23) {
    unsigned int v21 = v23;
  }
  unsigned int v224 = v21;
  if (v21 <= 0x7FFFFFFF) {
    int v24 = 0x7FFFFFFF;
  }
  else {
    int v24 = v21;
  }
  size_t v25 = *(void *)(v7 + 64);
  unint64_t v243 = v11 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v249 = *(void *)(*(void *)(v248 - 8) + 64) + 7;
  unint64_t __n = (v249 & 0xFFFFFFFFFFFFFFF8) + 8;
  uint64_t v240 = *(_DWORD *)(v9 + 80);
  unint64_t v246 = ~(unint64_t)v11;
  size_t v244 = v25;
  unsigned int v247 = *(_DWORD *)(v9 + 84);
  unsigned int __src = *(_DWORD *)(v7 + 84);
  int v238 = v24;
  uint64_t v233 = v14;
  uint64_t v234 = ~v14;
  unsigned int v232 = v20;
  uint64_t v229 = v15;
  uint64_t v231 = v6 + v14 + a2;
  if (v20 == v24)
  {
    uint64_t v26 = v237;
    if (v19 < 2) {
      goto LABEL_19;
    }
    unint64_t v27 = *(uint64_t (**)(uint64_t, void, uint64_t))(v7 + 48);
    unsigned int v28 = v27(v15 & ~v14, v19, v237);
    unsigned int v29 = v27((uint64_t)v18, __src, v237);
    if (v28 < 2)
    {
      uint64_t v30 = ~v16;
      if (v29 < 2) {
        goto LABEL_19;
      }
LABEL_77:
      if (!(*(unsigned int (**)(void *, uint64_t, uint64_t))(v13 + 48))(v17, 1, v26)) {
        (*(void (**)(void *, uint64_t))(v13 + 8))(v17, v26);
      }
      size_t v90 = v244;
      if (!__src) {
        size_t v90 = v244 + 1;
      }
      size_t v225 = v90;
      uint64_t v91 = v90 + v16;
      unint64_t v92 = ((unint64_t)v17 + v90 + v16) & v30;
      uint64_t v223 = *(void (**)(unint64_t, uint64_t))(v9 + 8);
      v223(v92, v248);
      unint64_t v93 = v249 + v92;
      uint64_t v94 = v16;
      unint64_t v95 = (v93 & 0xFFFFFFFFFFFFFFF8) + 15;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v96 = (void *)(((v95 & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
      if (*v96 >= 0xFFFFFFFFuLL)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      uint64_t v245 = v94 + 8;
      unint64_t v97 = (v94 + 8 + (((unint64_t)v96 + 23) & 0xFFFFFFFFFFFFFFF8)) & v243;
      if (v247 < 0x7FFFFFFF)
      {
        unint64_t v100 = *(void *)((v249 + v97) & 0xFFFFFFFFFFFFFFF8);
        if (v100 >= 0xFFFFFFFF) {
          LODWORD(v100) = -1;
        }
        unint64_t v46 = v249 & 0xFFFFFFFFFFFFFFF8;
        if (v100 != -1) {
          goto LABEL_95;
        }
      }
      else
      {
        unint64_t v46 = v249 & 0xFFFFFFFFFFFFFFF8;
        if ((*(unsigned int (**)(unint64_t))(v9 + 48))(v97))
        {
LABEL_95:
          swift_bridgeObjectRelease();
          unint64_t v42 = v246;
          unint64_t v76 = v243;
          memcpy(v17, v18, ((v46+ 20+ ((v245+ ((((((((v249 + (v91 & v246)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)) & v243)) & 0xFFFFFFFFFFFFFFF8)+ 8);
          uint64_t v16 = v240;
          unsigned int v80 = v247;
          uint64_t v81 = __src;
          int v82 = v238;
          uint64_t v84 = v233;
          uint64_t v83 = v234;
          unsigned int v85 = v232;
          uint64_t v87 = v229;
          uint64_t v86 = v231;
          goto LABEL_96;
        }
      }
      v223(v97, v248);
      swift_bridgeObjectRelease();
      goto LABEL_95;
    }
    unint64_t v42 = ~v16;
    unint64_t v46 = v249 & 0xFFFFFFFFFFFFFFF8;
    if (v29 >= 2)
    {
      BOOL v36 = 0;
      size_t v38 = v244 + v16;
      goto LABEL_109;
    }
    goto LABEL_104;
  }
  BOOL v36 = v19 == 0;
  if (v19) {
    uint64_t v37 = *(_DWORD *)(v9 + 80);
  }
  else {
    uint64_t v37 = v11 + 1;
  }
  size_t v38 = v37 + v25;
  unint64_t v39 = ((unint64_t)v17 + v37 + v25) & ~(unint64_t)v11;
  if (v10 == v24)
  {
    unint64_t v40 = *(uint64_t (**)(unint64_t, void, uint64_t))(v9 + 48);
    int v41 = v40(v39, v10, v248);
    int v24 = v238;
    unsigned int v10 = v247;
    if (v41)
    {
      unint64_t v42 = ~v16;
      int v43 = v40(((unint64_t)v18 + v38) & v246, v247, v248);
      goto LABEL_33;
    }
  }
  else
  {
    unint64_t v44 = (void *)((v249 + v39) & 0xFFFFFFFFFFFFFFF8);
    if ((v21 & 0x80000000) != 0)
    {
      unint64_t v50 = (v11
           + 8
           + (((((((unint64_t)v44 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & v243;
      if (v10 < 0x7FFFFFFF)
      {
        unint64_t v88 = *(void *)((v249 + v50) & 0xFFFFFFFFFFFFFFF8);
        if (v88 >= 0xFFFFFFFF) {
          LODWORD(v88) = -1;
        }
        if ((v88 + 1) < 2) {
          goto LABEL_75;
        }
      }
      else
      {
        unsigned int v51 = (*(uint64_t (**)(unint64_t, void, uint64_t))(v9 + 48))(v50, v10, v248);
        int v24 = v238;
        unsigned int v10 = v247;
        if (v51 < 2) {
          goto LABEL_75;
        }
      }
      unint64_t v42 = ~v16;
      unint64_t v52 = (v16
           + 8
           + ((((((((v249 + (((unint64_t)v18 + v38) & v246)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
               + 15) & 0xFFFFFFFFFFFFFFF8)
             + 23) & 0xFFFFFFFFFFFFFFF8)) & v243;
      if (v10 < 0x7FFFFFFF)
      {
        unint64_t v103 = *(void *)((v249 + v52) & 0xFFFFFFFFFFFFFFF8);
        if (v103 >= 0xFFFFFFFF) {
          LODWORD(v103) = -1;
        }
        unsigned int v53 = v103 + 1;
      }
      else
      {
        unsigned int v53 = (*(uint64_t (**)(unint64_t))(v9 + 48))(v52);
      }
      unint64_t v46 = v249 & 0xFFFFFFFFFFFFFFF8;
      uint64_t v26 = v237;
      if (v53 >= 2) {
        goto LABEL_109;
      }
      goto LABEL_104;
    }
    if (*v44 <= 0xFFFFFFFEuLL)
    {
      unint64_t v42 = ~(unint64_t)v11;
      unint64_t v45 = *(void *)((v249 + (((unint64_t)v18 + v38) & v246)) & 0xFFFFFFFFFFFFFFF8);
      if (v45 >= 0xFFFFFFFF) {
        LODWORD(v45) = -1;
      }
      int v43 = v45 + 1;
LABEL_33:
      unint64_t v46 = v249 & 0xFFFFFFFFFFFFFFF8;
      uint64_t v26 = v237;
      if (v43)
      {
LABEL_109:
        unint64_t v105 = (((((((v249 + (v38 & v42)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
              + 23) & 0xFFFFFFFFFFFFFFF8;
        uint64_t v245 = v16 + 8;
        unint64_t v76 = v243;
        memcpy(v17, v18, ((v46 + ((v16 + 8 + v105) & v243) + 20) & 0xFFFFFFFFFFFFFFF8) + 8);
        size_t v101 = v244 + v36;
        unsigned int v80 = v247;
        uint64_t v81 = __src;
        int v82 = v238;
        uint64_t v84 = v233;
        uint64_t v83 = v234;
        unsigned int v85 = v232;
        uint64_t v87 = v229;
        uint64_t v86 = v231;
        goto LABEL_124;
      }
LABEL_104:
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v13 + 48))(v18, 1, v26))
      {
        if (__src) {
          size_t v104 = v244;
        }
        else {
          size_t v104 = v244 + 1;
        }
        memcpy(v17, v18, v104);
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v13 + 16))(v17, v18, v26);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v17, 0, 1, v26);
        if (__src) {
          size_t v104 = v244;
        }
        else {
          size_t v104 = v244 + 1;
        }
      }
      size_t v226 = v104;
      unint64_t v106 = ((unint64_t)v17 + v104 + v16) & v42;
      unint64_t v107 = ((unint64_t)v18 + v104 + v16) & v42;
      uint64_t v108 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16);
      v108(v106, v107, v248);
      uint64_t v109 = (void *)((v249 + v107) & 0xFFFFFFFFFFFFFFF8);
      BOOL v110 = (void *)((v249 + v106) & 0xFFFFFFFFFFFFFFF8);
      void *v110 = *v109;
      uint64_t v111 = (void *)(((unint64_t)v109 + 15) & 0xFFFFFFFFFFFFFFF8);
      unsigned int v112 = (void *)(((unint64_t)v110 + 15) & 0xFFFFFFFFFFFFFFF8);
      *unsigned int v112 = *v111;
      unint64_t v113 = ((unint64_t)v112 + 15) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v114 = (unint64_t *)(((unint64_t)v111 + 15) & 0xFFFFFFFFFFFFFFF8);
      unint64_t v115 = *v114;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v115 < 0xFFFFFFFF)
      {
        *(_OWORD *)unint64_t v113 = *(_OWORD *)v114;
      }
      else
      {
        *(void *)unint64_t v113 = v115;
        *(void *)(v113 + 8) = v114[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      uint64_t v116 = (void *)((v113 + 23) & 0xFFFFFFFFFFFFFFF8);
      size_t v117 = (void *)(((unint64_t)v114 + 23) & 0xFFFFFFFFFFFFFFF8);
      *uint64_t v116 = *v117;
      unint64_t v76 = v243;
      uint64_t v118 = (char *)(((unint64_t)v116 + v16 + 8) & v243);
      uint64_t v245 = v16 + 8;
      uint64_t v119 = (char *)(((unint64_t)v117 + v16 + 8) & v243);
      swift_bridgeObjectRetain();
      if (v247 < 0x7FFFFFFF)
      {
        unint64_t v121 = *(void *)((unint64_t)&v119[v249] & 0xFFFFFFFFFFFFFFF8);
        if (v121 >= 0xFFFFFFFF) {
          LODWORD(v121) = -1;
        }
        if (v121 != -1) {
          goto LABEL_118;
        }
      }
      else if ((*(unsigned int (**)(char *))(v9 + 48))(v119))
      {
LABEL_118:
        unint64_t v120 = (v249 & 0xFFFFFFFFFFFFFFF8) + 8;
        memcpy(v118, v119, __n);
        unint64_t v42 = ~v16;
        goto LABEL_123;
      }
      v108((unint64_t)v118, (unint64_t)v119, v248);
      *(void *)((unint64_t)&v118[v249] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v119[v249] & 0xFFFFFFFFFFFFFFF8);
      swift_bridgeObjectRetain();
      unint64_t v42 = ~v16;
      unint64_t v120 = (v249 & 0xFFFFFFFFFFFFFFF8) + 8;
LABEL_123:
      uint64_t v122 = &v118[v120];
      int v123 = *(_DWORD *)&v119[v120];
      v122[4] = v119[v120 + 4];
      *(_DWORD *)uint64_t v122 = v123;
      *(void *)((unint64_t)&v118[v120 + 12] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v119[v120 + 12] & 0xFFFFFFFFFFFFFFF8);
      swift_bridgeObjectRetain();
      size_t v124 = v244;
      unsigned int v80 = v247;
      uint64_t v81 = __src;
      int v82 = v238;
      uint64_t v84 = v233;
      uint64_t v83 = v234;
      unsigned int v85 = v232;
      uint64_t v87 = v229;
      uint64_t v86 = v231;
      unint64_t v46 = v249 & 0xFFFFFFFFFFFFFFF8;
      size_t v101 = v226;
      if (__src) {
        goto LABEL_125;
      }
      goto LABEL_124;
    }
  }
LABEL_75:
  uint64_t v30 = ~v16;
  unint64_t v89 = ((unint64_t)v18 + v38) & v246;
  if (v10 == v24)
  {
    uint64_t v26 = v237;
    if ((*(unsigned int (**)(unint64_t))(v9 + 48))(v89)) {
      goto LABEL_77;
    }
  }
  else
  {
    uint64_t v98 = (unint64_t *)((v249 + v89) & 0xFFFFFFFFFFFFFFF8);
    if ((v224 & 0x80000000) != 0)
    {
      unint64_t v102 = (v16
            + (((((((unint64_t)v98 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
            + 8) & v243;
      uint64_t v26 = v237;
      if (v10 < 0x7FFFFFFF)
      {
        unint64_t v221 = *(void *)((v249 + v102) & 0xFFFFFFFFFFFFFFF8);
        if (v221 >= 0xFFFFFFFF) {
          LODWORD(v221) = -1;
        }
        if ((v221 + 1) >= 2) {
          goto LABEL_77;
        }
      }
      else if ((*(unsigned int (**)(unint64_t))(v9 + 48))(v102) >= 2)
      {
        goto LABEL_77;
      }
    }
    else
    {
      unint64_t v99 = *v98;
      if (v99 >= 0xFFFFFFFF) {
        LODWORD(v99) = -1;
      }
      uint64_t v26 = v237;
      if (v99 != -1) {
        goto LABEL_77;
      }
    }
  }
LABEL_19:
  unint64_t v31 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  int v32 = v31(v17, 1, v26);
  int v33 = v31(v18, 1, v26);
  if (v32)
  {
    uint64_t v34 = ~v16;
    uint64_t v35 = v9;
    if (!v33)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 16))(v17, v18, v26);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v17, 0, 1, v26);
LABEL_48:
      unsigned int v47 = __src;
      size_t v48 = v244;
      goto LABEL_49;
    }
  }
  else
  {
    uint64_t v34 = ~v16;
    uint64_t v35 = v9;
    if (!v33)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 24))(v17, v18, v26);
      goto LABEL_48;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v17, v26);
  }
  unsigned int v47 = __src;
  size_t v48 = v244;
  if (__src) {
    size_t v49 = v244;
  }
  else {
    size_t v49 = v244 + 1;
  }
  memcpy(v17, v18, v49);
LABEL_49:
  if (v47) {
    size_t v54 = v48;
  }
  else {
    size_t v54 = v48 + 1;
  }
  size_t v225 = v54;
  uint64_t v55 = v54 + v16;
  unint64_t v56 = ((unint64_t)v17 + v55) & v34;
  unint64_t v57 = ((unint64_t)v18 + v55) & v34;
  unint64_t v58 = *(void (**)(unint64_t, unint64_t, uint64_t))(v35 + 24);
  v58(v56, v57, v248);
  uint64_t v59 = (void *)((v249 + v56) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v60 = (v249 + v57) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v61 = *(void *)v60;
  v60 += 15;
  *uint64_t v59 = v61;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v62 = (void *)(((unint64_t)v59 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v63 = (v60 & 0xFFFFFFFFFFFFFFF8) + 15;
  void *v62 = *(void *)(v60 & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v64 = (void *)(((unint64_t)v62 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v65 = (unint64_t *)(v63 & 0xFFFFFFFFFFFFFFF8);
  unint64_t v66 = *v65;
  if (*v64 < 0xFFFFFFFFuLL)
  {
    if (v66 >= 0xFFFFFFFF)
    {
      *uint64_t v64 = v66;
      v64[1] = v65[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_59;
    }
  }
  else
  {
    if (v66 >= 0xFFFFFFFF)
    {
      *uint64_t v64 = v66;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v64[1] = v65[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_59;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  *(_OWORD *)uint64_t v64 = *(_OWORD *)v65;
LABEL_59:
  uint64_t v67 = (void *)(((unint64_t)v64 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v68 = (void *)(((unint64_t)v65 + 23) & 0xFFFFFFFFFFFFFFF8);
  void *v67 = *v68;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  size_t v69 = (char *)(((unint64_t)v67 + v16 + 8) & v243);
  uint64_t v245 = v16 + 8;
  uint64_t v70 = (char *)(((unint64_t)v68 + v16 + 8) & v243);
  if (v247 >= 0x7FFFFFFF)
  {
    uint64_t v71 = v35;
    unint64_t v72 = *(uint64_t (**)(char *, void, uint64_t))(v35 + 48);
    int v73 = v72(v69, v247, v248);
    int v74 = v72(v70, v247, v248);
    uint64_t v16 = v240;
    if (v73) {
      goto LABEL_61;
    }
LABEL_66:
    if (v74)
    {
      uint64_t v9 = v71;
      (*(void (**)(char *, uint64_t))(v71 + 8))(v69, v248);
      swift_bridgeObjectRelease();
      unint64_t v75 = (v249 & 0xFFFFFFFFFFFFFFF8) + 8;
      memcpy(v69, v70, __n);
      unint64_t v76 = v243;
      unint64_t v42 = v246;
      goto LABEL_71;
    }
    v58((unint64_t)v69, (unint64_t)v70, v248);
    *(void *)((unint64_t)&v69[v249] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v70[v249] & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    unint64_t v76 = v243;
    unint64_t v42 = v246;
    uint64_t v9 = v71;
LABEL_70:
    unint64_t v75 = (v249 & 0xFFFFFFFFFFFFFFF8) + 8;
    goto LABEL_71;
  }
  uint64_t v71 = v35;
  unint64_t v77 = *(void *)((unint64_t)&v70[v249] & 0xFFFFFFFFFFFFFFF8);
  if (v77 >= 0xFFFFFFFF) {
    LODWORD(v77) = -1;
  }
  int v74 = v77 + 1;
  if (*(void *)((unint64_t)&v69[v249] & 0xFFFFFFFFFFFFFFF8) >= 0xFFFFFFFFuLL) {
    goto LABEL_66;
  }
LABEL_61:
  if (!v74)
  {
    uint64_t v9 = v71;
    (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v69, v70, v248);
    *(void *)((unint64_t)&v69[v249] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v70[v249] & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
    unint64_t v76 = v243;
    unint64_t v42 = v246;
    goto LABEL_70;
  }
  unint64_t v75 = (v249 & 0xFFFFFFFFFFFFFFF8) + 8;
  memcpy(v69, v70, __n);
  unint64_t v76 = v243;
  unint64_t v42 = v246;
  uint64_t v9 = v71;
LABEL_71:
  uint64_t v26 = v237;
  unint64_t v78 = &v69[v75];
  int v79 = *(_DWORD *)&v70[v75];
  v78[4] = v70[v75 + 4];
  *(_DWORD *)unint64_t v78 = v79;
  *(void *)((unint64_t)&v69[v75 + 12] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v70[v75 + 12] & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unsigned int v80 = v247;
  uint64_t v81 = __src;
  int v82 = v238;
  uint64_t v84 = v233;
  uint64_t v83 = v234;
  unsigned int v85 = v232;
  uint64_t v87 = v229;
  uint64_t v86 = v231;
  unint64_t v46 = v249 & 0xFFFFFFFFFFFFFFF8;
LABEL_96:
  size_t v101 = v225;
LABEL_124:
  size_t v124 = v101;
LABEL_125:
  v239 = (void *)v9;
  unint64_t v125 = v46 + 20;
  unint64_t v126 = ((v46
         + 20
         + ((v245
           + ((((((((v249 + ((v124 + v16) & v42)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
             + 23) & 0xFFFFFFFFFFFFFFF8)) & v76)) & 0xFFFFFFFFFFFFFFF8)
       + 8;
  uint64_t v127 = (void *)(((v87 | v84) + v126) & v83);
  __srca = (unsigned char *)(((v86 | v84) + v126) & v83);
  if (v85 != v82)
  {
    BOOL v236 = v81 == 0;
    if (v81) {
      uint64_t v139 = v16;
    }
    else {
      uint64_t v139 = v16 + 1;
    }
    size_t v140 = v139 + v244;
    uint64_t v128 = v127;
    unint64_t v141 = ((unint64_t)v127 + v139 + v244) & v42;
    unint64_t v227 = v125;
    if (v80 == v82)
    {
      uint64_t v142 = v13;
      uint64_t v143 = (uint64_t (*)(unint64_t, void, uint64_t))v239[6];
      int v144 = v143(v141, v247, v248);
      int v82 = v238;
      unsigned int v80 = v247;
      if (v144)
      {
        int v145 = v143((unint64_t)&__srca[v140] & v246, v247, v248);
        unint64_t v132 = v246;
        uint64_t v26 = v237;
        goto LABEL_143;
      }
    }
    else
    {
      uint64_t v146 = (void *)((v249 + v141) & 0xFFFFFFFFFFFFFFF8);
      if ((v224 & 0x80000000) != 0)
      {
        unint64_t v173 = (v245
              + (((((((unint64_t)v146 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & v76;
        uint64_t v142 = v13;
        if (v80 < 0x7FFFFFFF)
        {
          unint64_t v180 = *(void *)((v249 + v173) & 0xFFFFFFFFFFFFFFF8);
          if (v180 >= 0xFFFFFFFF) {
            LODWORD(v180) = -1;
          }
          if ((v180 + 1) < 2) {
            goto LABEL_184;
          }
        }
        else
        {
          unsigned int v174 = ((uint64_t (*)(unint64_t, void, uint64_t))v239[6])(v173, v247, v248);
          int v82 = v238;
          unsigned int v80 = v247;
          if (v174 < 2) {
            goto LABEL_184;
          }
        }
        unint64_t v132 = v246;
        unint64_t v175 = (v245
              + ((((((((v249 + ((unint64_t)&__srca[v140] & v246)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
                  + 15) & 0xFFFFFFFFFFFFFFF8)
                + 23) & 0xFFFFFFFFFFFFFFF8)) & v76;
        if (v80 < 0x7FFFFFFF)
        {
          unint64_t v194 = *(void *)((v249 + v175) & 0xFFFFFFFFFFFFFFF8);
          if (v194 >= 0xFFFFFFFF) {
            LODWORD(v194) = -1;
          }
          unsigned int v176 = v194 + 1;
        }
        else
        {
          unsigned int v176 = ((uint64_t (*)(unint64_t))v239[6])(v175);
        }
        unint64_t v125 = v227;
        if (v176 >= 2) {
          goto LABEL_217;
        }
        goto LABEL_212;
      }
      uint64_t v142 = v13;
      if (*v146 <= 0xFFFFFFFEuLL)
      {
        unint64_t v132 = v246;
        unint64_t v147 = *(void *)((v249 + ((unint64_t)&__srca[v140] & v246)) & 0xFFFFFFFFFFFFFFF8);
        if (v147 >= 0xFFFFFFFF) {
          LODWORD(v147) = -1;
        }
        int v145 = v147 + 1;
LABEL_143:
        uint64_t v13 = v142;
        unint64_t v125 = v227;
        if (v145)
        {
LABEL_217:
          size_t v196 = ((v125
                 + ((v245
                   + ((((((((v249 + (v140 & v132)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
                     + 23) & 0xFFFFFFFFFFFFFFF8)) & v76)) & 0xFFFFFFFFFFFFFFF8)
               + 8;
          uint64_t v177 = v128;
          uint64_t v191 = __srca;
          memcpy(v128, __srca, v196);
          uint64_t v170 = v228;
          size_t v192 = v244;
          goto LABEL_237;
        }
LABEL_212:
        if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(__srca, 1, v26))
        {
          BOOL v236 = v81 == 0;
          if (v81) {
            size_t v195 = v244;
          }
          else {
            size_t v195 = v244 + 1;
          }
          uint64_t v177 = v128;
          memcpy(v128, __srca, v195);
        }
        else
        {
          (*(void (**)(void *, unsigned char *, uint64_t))(v13 + 16))(v128, __srca, v26);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v128, 0, 1, v26);
          BOOL v197 = v81 == 0;
          uint64_t v177 = v128;
          uint64_t v198 = v197;
          BOOL v236 = v198;
          if (v197) {
            size_t v195 = v244 + 1;
          }
          else {
            size_t v195 = v244;
          }
        }
        size_t v199 = v195 + v16;
        unint64_t v200 = ((unint64_t)v177 + v195 + v16) & v132;
        unint64_t v201 = (unint64_t)&__srca[v199] & v132;
        uint64_t v202 = (void (*)(unint64_t, unint64_t, uint64_t))v239[2];
        v202(v200, v201, v248);
        uint64_t v203 = (void *)((v249 + v201) & 0xFFFFFFFFFFFFFFF8);
        uint64_t v204 = (void *)((v249 + v200) & 0xFFFFFFFFFFFFFFF8);
        *uint64_t v204 = *v203;
        v205 = (void *)(((unint64_t)v203 + 15) & 0xFFFFFFFFFFFFFFF8);
        os_log_type_t v206 = (void *)(((unint64_t)v204 + 15) & 0xFFFFFFFFFFFFFFF8);
        *os_log_type_t v206 = *v205;
        unint64_t v207 = ((unint64_t)v206 + 15) & 0xFFFFFFFFFFFFFFF8;
        uint64_t v208 = (unint64_t *)(((unint64_t)v205 + 15) & 0xFFFFFFFFFFFFFFF8);
        unint64_t v209 = *v208;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v209 < 0xFFFFFFFF)
        {
          *(_OWORD *)unint64_t v207 = *(_OWORD *)v208;
        }
        else
        {
          *(void *)unint64_t v207 = v209;
          *(void *)(v207 + 8) = v208[1];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        v210 = (void *)((v207 + 23) & 0xFFFFFFFFFFFFFFF8);
        uint64_t v211 = (void *)(((unint64_t)v208 + 23) & 0xFFFFFFFFFFFFFFF8);
        void *v210 = *v211;
        uint64_t v212 = (char *)(((unint64_t)v210 + v245) & v76);
        v213 = (char *)(((unint64_t)v211 + v245) & v76);
        swift_bridgeObjectRetain();
        if (v247 < 0x7FFFFFFF)
        {
          unint64_t v215 = *(void *)((unint64_t)&v213[v249] & 0xFFFFFFFFFFFFFFF8);
          if (v215 >= 0xFFFFFFFF) {
            LODWORD(v215) = -1;
          }
          int v214 = v215 + 1;
        }
        else
        {
          int v214 = ((uint64_t (*)(char *))v239[6])(v213);
        }
        uint64_t v170 = v228;
        unint64_t v132 = v246;
        if (v214)
        {
          unint64_t v216 = (v249 & 0xFFFFFFFFFFFFFFF8) + 8;
          memcpy(v212, v213, __n);
          uint64_t v16 = v240;
        }
        else
        {
          v202((unint64_t)v212, (unint64_t)v213, v248);
          *(void *)((unint64_t)&v212[v249] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v213[v249] & 0xFFFFFFFFFFFFFFF8);
          swift_bridgeObjectRetain();
          uint64_t v16 = v240;
          unint64_t v216 = (v249 & 0xFFFFFFFFFFFFFFF8) + 8;
        }
        uint64_t v217 = &v212[v216];
        int v218 = *(_DWORD *)&v213[v216];
        v217[4] = v213[v216 + 4];
        *(_DWORD *)uint64_t v217 = v218;
        *(void *)((unint64_t)&v212[v216 + 12] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v213[v216 + 12] & 0xFFFFFFFFFFFFFFF8);
        swift_bridgeObjectRetain();
        goto LABEL_236;
      }
    }
LABEL_184:
    unint64_t v132 = v246;
    unint64_t v181 = (unint64_t)&__srca[v140] & v246;
    if (v80 == v82)
    {
      int v182 = ((uint64_t (*)(unint64_t))v239[6])(v181);
    }
    else
    {
      long long v183 = (unint64_t *)((v249 + v181) & 0xFFFFFFFFFFFFFFF8);
      if ((v224 & 0x80000000) != 0)
      {
        unint64_t v193 = (v245
              + (((((((unint64_t)v183 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & v76;
        uint64_t v13 = v142;
        unint64_t v125 = v227;
        if (v80 < 0x7FFFFFFF)
        {
          unint64_t v222 = *(void *)((v249 + v193) & 0xFFFFFFFFFFFFFFF8);
          if (v222 >= 0xFFFFFFFF) {
            LODWORD(v222) = -1;
          }
          if ((v222 + 1) >= 2) {
            goto LABEL_191;
          }
        }
        else if (((unsigned int (*)(unint64_t))v239[6])(v193) >= 2)
        {
          goto LABEL_191;
        }
LABEL_129:
        uint64_t v133 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
        int v134 = v133(v128, 1, v26);
        int v135 = v133(__srca, 1, v26);
        if (v134)
        {
          uint64_t v136 = v240;
          unint64_t v137 = v246;
          if (!v135)
          {
            (*(void (**)(void *, unsigned char *, uint64_t))(v13 + 16))(v128, __srca, v26);
            (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v128, 0, 1, v26);
            size_t v138 = v244;
            goto LABEL_151;
          }
        }
        else
        {
          uint64_t v136 = v240;
          unint64_t v137 = v246;
          if (!v135)
          {
            (*(void (**)(void *, unsigned char *, uint64_t))(v13 + 24))(v128, __srca, v26);
            size_t v138 = v244;
            goto LABEL_151;
          }
          (*(void (**)(void *, uint64_t))(v13 + 8))(v128, v26);
        }
        size_t v138 = v244;
        if (v81) {
          size_t v148 = v244;
        }
        else {
          size_t v148 = v244 + 1;
        }
        memcpy(v128, __srca, v148);
LABEL_151:
        BOOL v236 = v81 == 0;
        if (v81) {
          size_t v149 = v138;
        }
        else {
          size_t v149 = v138 + 1;
        }
        uint64_t v150 = v149 + v136;
        unint64_t v151 = ((unint64_t)v128 + v150) & v137;
        unint64_t v152 = (unint64_t)&__srca[v150] & v137;
        uint64_t v153 = (void (*)(unint64_t, unint64_t, uint64_t))v239[3];
        v153(v151, v152, v248);
        uint64_t v154 = (void *)((v249 + v151) & 0xFFFFFFFFFFFFFFF8);
        unint64_t v155 = (v249 + v152) & 0xFFFFFFFFFFFFFFF8;
        uint64_t v156 = *(void *)v155;
        v155 += 15;
        *uint64_t v154 = v156;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v157 = (void *)(((unint64_t)v154 + 15) & 0xFFFFFFFFFFFFFFF8);
        unint64_t v158 = (v155 & 0xFFFFFFFFFFFFFFF8) + 15;
        *uint64_t v157 = *(void *)(v155 & 0xFFFFFFFFFFFFFFF8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v159 = (void *)(((unint64_t)v157 + 15) & 0xFFFFFFFFFFFFFFF8);
        unint64_t v160 = v158 & 0xFFFFFFFFFFFFFFF8;
        unint64_t v161 = *(void *)(v158 & 0xFFFFFFFFFFFFFFF8);
        if (*v159 < 0xFFFFFFFFuLL)
        {
          if (v161 >= 0xFFFFFFFF)
          {
            *uint64_t v159 = v161;
            v159[1] = *(void *)(v160 + 8);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            goto LABEL_163;
          }
        }
        else
        {
          if (v161 >= 0xFFFFFFFF)
          {
            *uint64_t v159 = v161;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            v159[1] = *(void *)(v160 + 8);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            goto LABEL_163;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        *(_OWORD *)uint64_t v159 = *(_OWORD *)v160;
LABEL_163:
        unint64_t v76 = v243;
        uint64_t v162 = (void *)(((unint64_t)v159 + 23) & 0xFFFFFFFFFFFFFFF8);
        uint64_t v163 = (void *)((v160 + 23) & 0xFFFFFFFFFFFFFFF8);
        void *v162 = *v163;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v164 = (char *)(((unint64_t)v162 + v245) & v243);
        uint64_t v165 = (char *)(((unint64_t)v163 + v245) & v243);
        uint64_t v230 = v128;
        if (v247 < 0x7FFFFFFF)
        {
          uint64_t v166 = v239;
          unint64_t v171 = *(void *)((unint64_t)&v165[v249] & 0xFFFFFFFFFFFFFFF8);
          if (v171 >= 0xFFFFFFFF) {
            LODWORD(v171) = -1;
          }
          int v169 = v171 + 1;
          uint64_t v170 = v228;
          if (*(void *)((unint64_t)&v164[v249] & 0xFFFFFFFFFFFFFFF8) < 0xFFFFFFFFuLL)
          {
LABEL_165:
            if (!v169)
            {
              ((void (*)(char *, char *, uint64_t))v166[2])(v164, v165, v248);
              *(void *)((unint64_t)&v164[v249] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v165[v249] & 0xFFFFFFFFFFFFFFF8);
              swift_bridgeObjectRetain();
LABEL_178:
              unint64_t v132 = v246;
              unint64_t v172 = (v249 & 0xFFFFFFFFFFFFFFF8) + 8;
              goto LABEL_179;
            }
            goto LABEL_172;
          }
        }
        else
        {
          uint64_t v166 = v239;
          uint64_t v167 = (uint64_t (*)(char *, void, uint64_t))v239[6];
          int v168 = v167(v164, v247, v248);
          int v169 = v167(v165, v247, v248);
          unint64_t v76 = v243;
          uint64_t v170 = v228;
          if (v168) {
            goto LABEL_165;
          }
        }
        if (!v169)
        {
          v153((unint64_t)v164, (unint64_t)v165, v248);
          *(void *)((unint64_t)&v164[v249] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v165[v249] & 0xFFFFFFFFFFFFFFF8);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          goto LABEL_178;
        }
        ((void (*)(char *, uint64_t))v166[1])(v164, v248);
        swift_bridgeObjectRelease();
LABEL_172:
        unint64_t v172 = (v249 & 0xFFFFFFFFFFFFFFF8) + 8;
        memcpy(v164, v165, __n);
        unint64_t v132 = v246;
LABEL_179:
        uint64_t v177 = v230;
        uint64_t v178 = &v164[v172];
        int v179 = *(_DWORD *)&v165[v172];
        v178[4] = v165[v172 + 4];
        *(_DWORD *)uint64_t v178 = v179;
        *(void *)((unint64_t)&v164[v172 + 12] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v165[v172 + 12] & 0xFFFFFFFFFFFFFFF8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v16 = v240;
LABEL_236:
        size_t v192 = v244;
        uint64_t v191 = __srca;
        goto LABEL_237;
      }
      unint64_t v184 = *v183;
      if (v184 >= 0xFFFFFFFF) {
        LODWORD(v184) = -1;
      }
      int v182 = v184 + 1;
    }
    uint64_t v13 = v142;
    unint64_t v125 = v227;
    if (v182) {
      goto LABEL_191;
    }
    goto LABEL_129;
  }
  uint64_t v128 = v127;
  if (v81 < 2) {
    goto LABEL_129;
  }
  unint64_t v129 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  unsigned int v130 = v129(v127, v81, v26);
  unsigned int v131 = v129(__srca, v81, v26);
  if (v130 >= 2)
  {
    uint64_t v16 = v240;
    unint64_t v132 = v246;
    if (v131 >= 2)
    {
      BOOL v236 = 0;
      size_t v140 = v244 + v240;
      goto LABEL_217;
    }
    goto LABEL_212;
  }
  uint64_t v16 = v240;
  unint64_t v132 = v246;
  if (v131 < 2) {
    goto LABEL_129;
  }
LABEL_191:
  if (!(*(unsigned int (**)(void *, uint64_t, uint64_t))(v13 + 48))(v128, 1, v26)) {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v128, v26);
  }
  BOOL v236 = v81 == 0;
  size_t v185 = v244;
  if (!v81) {
    size_t v185 = v244 + 1;
  }
  uint64_t v186 = v185 + v16;
  uint64_t v187 = (void (*)(unint64_t, uint64_t))v239[1];
  v187(((unint64_t)v128 + v186) & v132, v248);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v188 = (void *)((((((v249 + (((unint64_t)v128 + v186) & v132)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
                   + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v177 = v128;
  if (*v188 >= 0xFFFFFFFFuLL)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  unint64_t v189 = (v245 + (((unint64_t)v188 + 23) & 0xFFFFFFFFFFFFFFF8)) & v76;
  if (v247 < 0x7FFFFFFF)
  {
    unint64_t v190 = *(void *)((v249 + v189) & 0xFFFFFFFFFFFFFFF8);
    if (v190 >= 0xFFFFFFFF) {
      LODWORD(v190) = -1;
    }
    uint64_t v170 = v228;
    if (v190 != -1) {
      goto LABEL_204;
    }
    goto LABEL_203;
  }
  uint64_t v170 = v228;
  if (!((unsigned int (*)(unint64_t))v239[6])(v189))
  {
LABEL_203:
    v187(v189, v248);
    swift_bridgeObjectRelease();
  }
LABEL_204:
  swift_bridgeObjectRelease();
  uint64_t v191 = __srca;
  memcpy(v177, __srca, ((v125+ ((v245+ ((((((((v249 + (v186 & v132)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)) & v76)) & 0xFFFFFFFFFFFFFFF8)+ 8);
  uint64_t v16 = v240;
  size_t v192 = v244;
LABEL_237:
  unint64_t v219 = ((v125
         + ((v245
           + ((((((((v249 + ((v236 + v192 + v16) & v132)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
             + 23) & 0xFFFFFFFFFFFFFFF8)) & v76)) & 0xFFFFFFFFFFFFFFF8)
       + 8;
  *((unsigned char *)v177 + v219) = v191[v219];
  return v170;
}

uint64_t sub_10003F180(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t v114 = sub_100044510();
  uint64_t v7 = *(void *)(v114 - 8);
  int v8 = *(_DWORD *)(v7 + 80) & 0xF8;
  uint64_t v9 = sub_100044540();
  uint64_t v10 = *(void *)(v9 - 8);
  int v11 = *(_DWORD *)(v10 + 80);
  uint64_t v12 = *(unsigned int *)(v10 + 84);
  uint64_t v115 = v10;
  uint64_t v116 = v9;
  uint64_t v13 = v8 | v11 | 7u;
  uint64_t v110 = a1;
  uint64_t v14 = v6 + v13 + a1;
  uint64_t v15 = v11;
  uint64_t v16 = (void *)(v14 & ~v13);
  uint64_t v17 = v6 + v13 + a2;
  unsigned int v18 = (const void *)(v17 & ~v13);
  uint64_t v113 = v7;
  unsigned int v19 = *(_DWORD *)(v7 + 84);
  if (v19) {
    unsigned int v20 = v19 - 1;
  }
  else {
    unsigned int v20 = 0;
  }
  if (v12 <= v20) {
    unsigned int v21 = v20;
  }
  else {
    unsigned int v21 = *(_DWORD *)(v10 + 84);
  }
  if (v12 <= 0x7FFFFFFF) {
    int v22 = 0x7FFFFFFF;
  }
  else {
    int v22 = *(_DWORD *)(v10 + 84);
  }
  unsigned int v23 = v22 - 1;
  if (v21 > v23) {
    unsigned int v23 = v21;
  }
  if (v23 <= 0x7FFFFFFF) {
    int v24 = 0x7FFFFFFF;
  }
  else {
    int v24 = v23;
  }
  size_t v25 = *(void *)(v7 + 64);
  unint64_t v26 = ~(unint64_t)v11;
  unint64_t v27 = v11 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v28 = *(void *)(v10 + 64) + 7;
  unint64_t __n = (v28 & 0xFFFFFFFFFFFFFFF8) + 8;
  unint64_t v117 = v26;
  unint64_t v118 = v27;
  uint64_t v119 = v28;
  size_t v123 = v25;
  unsigned int v120 = *(_DWORD *)(v7 + 84);
  uint64_t v112 = v11;
  unsigned int v105 = v23;
  int v109 = v24;
  unsigned int v108 = v20;
  uint64_t v106 = v14;
  uint64_t v107 = v17;
  if (v20 != v24)
  {
    BOOL v29 = v19 == 0;
    if (v19) {
      uint64_t v31 = v11;
    }
    else {
      uint64_t v31 = v11 + 1;
    }
    size_t v30 = v31 + v25;
    unint64_t v32 = ((unint64_t)v18 + v31 + v25) & v26;
    if (v12 == v24)
    {
      if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v115 + 48))(v32, v12, v116)) {
        goto LABEL_24;
      }
    }
    else
    {
      int v43 = (unint64_t *)((v28 + v32) & 0xFFFFFFFFFFFFFFF8);
      if ((v23 & 0x80000000) != 0)
      {
        unint64_t v100 = (v11
              + (((((((unint64_t)v43 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
              + 8) & v27;
        if (v12 < 0x7FFFFFFF)
        {
          unint64_t v102 = *(void *)((v28 + v100) & 0xFFFFFFFFFFFFFFF8);
          if (v102 >= 0xFFFFFFFF) {
            LODWORD(v102) = -1;
          }
          if ((v102 + 1) >= 2) {
            goto LABEL_24;
          }
        }
        else if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v115 + 48))(v100, v12, v116) >= 2)
        {
          goto LABEL_24;
        }
      }
      else
      {
        unint64_t v44 = *v43;
        if (v44 >= 0xFFFFFFFF) {
          LODWORD(v44) = -1;
        }
        if (v44 != -1) {
          goto LABEL_24;
        }
      }
    }
LABEL_29:
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v113 + 48))(v18, 1, v114))
    {
      if (v120) {
        size_t v36 = v123;
      }
      else {
        size_t v36 = v123 + 1;
      }
      memcpy(v16, v18, v36);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v113 + 32))(v16, v18, v114);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v113 + 56))(v16, 0, 1, v114);
      if (v120) {
        size_t v36 = v123;
      }
      else {
        size_t v36 = v123 + 1;
      }
    }
    unint64_t v45 = ((unint64_t)v16 + v36 + v15) & v26;
    unint64_t v46 = ((unint64_t)v18 + v36 + v15) & v26;
    size_t v104 = *(void (**)(unint64_t, unint64_t, uint64_t))(v115 + 32);
    v104(v45, v46, v116);
    unsigned int v47 = (void *)((v28 + v45) & 0xFFFFFFFFFFFFFFF8);
    size_t v48 = (void *)((v28 + v46) & 0xFFFFFFFFFFFFFFF8);
    void *v47 = *v48;
    size_t v49 = (void *)(((unint64_t)v47 + 15) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v50 = (void *)(((unint64_t)v48 + 15) & 0xFFFFFFFFFFFFFFF8);
    *size_t v49 = *v50;
    unsigned int v51 = (_OWORD *)(((unint64_t)v49 + 15) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v52 = (_OWORD *)(((unint64_t)v50 + 15) & 0xFFFFFFFFFFFFFFF8);
    *unsigned int v51 = *v52;
    unsigned int v53 = (void *)(((unint64_t)v51 + 23) & 0xFFFFFFFFFFFFFFF8);
    size_t v54 = (void *)(((unint64_t)v52 + 23) & 0xFFFFFFFFFFFFFFF8);
    void *v53 = *v54;
    uint64_t v55 = (char *)(((unint64_t)v53 + v15 + 8) & v27);
    uint64_t v122 = v15 + 8;
    unint64_t v56 = (char *)(((unint64_t)v54 + v15 + 8) & v27);
    if (v12 < 0x7FFFFFFF)
    {
      unint64_t v58 = *(void *)((unint64_t)&v56[v28] & 0xFFFFFFFFFFFFFFF8);
      if (v58 >= 0xFFFFFFFF) {
        LODWORD(v58) = -1;
      }
      if (v58 != -1) {
        goto LABEL_39;
      }
    }
    else if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v115 + 48))(v56, v12, v116))
    {
LABEL_39:
      unint64_t v57 = (v28 & 0xFFFFFFFFFFFFFFF8) + 8;
      memcpy(v55, v56, __n);
      unint64_t v26 = ~v15;
      uint64_t v15 = v112;
      goto LABEL_44;
    }
    v104((unint64_t)v55, (unint64_t)v56, v116);
    *(void *)((unint64_t)&v55[v28] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v56[v28] & 0xFFFFFFFFFFFFFFF8);
    unint64_t v26 = ~v15;
    unint64_t v57 = (v28 & 0xFFFFFFFFFFFFFFF8) + 8;
    uint64_t v15 = v112;
LABEL_44:
    size_t v35 = v123;
    unsigned int v37 = v120;
    int v38 = v109;
    uint64_t v39 = ~v13;
    unsigned int v40 = v108;
    uint64_t v41 = v106;
    uint64_t v42 = v107;
    uint64_t v59 = &v55[v57];
    int v60 = *(_DWORD *)&v56[v57];
    v59[4] = v56[v57 + 4];
    *(_DWORD *)uint64_t v59 = v60;
    *(void *)((unint64_t)&v55[v57 + 12] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v56[v57 + 12] & 0xFFFFFFFFFFFFFFF8);
    size_t v61 = v123;
    unint64_t v34 = v28 & 0xFFFFFFFFFFFFFFF8;
    if (v120) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  if (v19 < 2 || (*(unsigned int (**)(const void *, void, uint64_t))(v7 + 48))(v18, v19, v114) < 2) {
    goto LABEL_29;
  }
  BOOL v29 = 0;
  size_t v30 = v123 + v15;
LABEL_24:
  uint64_t v122 = v15 + 8;
  unint64_t v33 = (v15
       + 8
       + ((((((((v28 + (v30 & v26)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
         + 23) & 0xFFFFFFFFFFFFFFF8)) & v27;
  unint64_t v34 = v28 & 0xFFFFFFFFFFFFFFF8;
  memcpy(v16, v18, (((v28 & 0xFFFFFFFFFFFFFFF8) + v33 + 20) & 0xFFFFFFFFFFFFFFF8) + 8);
  size_t v35 = v123;
  size_t v36 = v123 + v29;
  unsigned int v37 = v120;
  int v38 = v109;
  uint64_t v39 = ~v13;
  unsigned int v40 = v108;
  uint64_t v41 = v106;
  uint64_t v42 = v107;
LABEL_45:
  size_t v61 = v36;
LABEL_46:
  unint64_t v62 = (v122
       + ((((((((v28 + ((v61 + v15) & v26)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
         + 23) & 0xFFFFFFFFFFFFFFF8)) & v27;
  unint64_t v63 = v34 + 20;
  unint64_t v64 = ((v34 + 20 + v62) & 0xFFFFFFFFFFFFFFF8) + 8;
  unint64_t v65 = (void *)(((v41 | v13) + v64) & v39);
  unint64_t v66 = (const void *)(((v42 | v13) + v64) & v39);
  if (v40 != v38)
  {
    unint64_t v70 = v26;
    if (v37) {
      uint64_t v71 = v15;
    }
    else {
      uint64_t v71 = v15 + 1;
    }
    size_t v69 = v71 + v35;
    unint64_t v72 = ((unint64_t)v66 + v71 + v35) & v70;
    if (v12 == v38)
    {
      uint64_t v68 = v113;
      uint64_t v67 = v114;
      if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v115 + 48))(v72, v12, v116)) {
        goto LABEL_55;
      }
    }
    else
    {
      unint64_t v75 = (unint64_t *)((v119 + v72) & 0xFFFFFFFFFFFFFFF8);
      if ((v105 & 0x80000000) != 0)
      {
        unint64_t v101 = (v122
              + (((((((unint64_t)v75 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & v27;
        uint64_t v68 = v113;
        uint64_t v67 = v114;
        if (v12 < 0x7FFFFFFF)
        {
          unint64_t v103 = *(void *)((v119 + v101) & 0xFFFFFFFFFFFFFFF8);
          if (v103 >= 0xFFFFFFFF) {
            LODWORD(v103) = -1;
          }
          if ((v103 + 1) >= 2) {
            goto LABEL_55;
          }
        }
        else if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v115 + 48))(v101, v12, v116) >= 2)
        {
          goto LABEL_55;
        }
      }
      else
      {
        unint64_t v76 = *v75;
        if (v76 >= 0xFFFFFFFF) {
          LODWORD(v76) = -1;
        }
        uint64_t v68 = v113;
        uint64_t v67 = v114;
        if (v76 != -1) {
          goto LABEL_55;
        }
      }
    }
LABEL_60:
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v68 + 48))(v66, 1, v67))
    {
      BOOL v77 = v120 == 0;
      BOOL v121 = v120 == 0;
      if (v77) {
        size_t v78 = v123 + 1;
      }
      else {
        size_t v78 = v123;
      }
      memcpy(v65, v66, v78);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v68 + 32))(v65, v66, v67);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v68 + 56))(v65, 0, 1, v67);
      BOOL v77 = v120 == 0;
      BOOL v121 = v120 == 0;
      if (v77) {
        size_t v78 = v123 + 1;
      }
      else {
        size_t v78 = v123;
      }
    }
    size_t v79 = v78 + v15;
    unint64_t v80 = ((unint64_t)v65 + v78 + v15) & v117;
    unint64_t v81 = ((unint64_t)v66 + v79) & v117;
    int v82 = *(void (**)(unint64_t, unint64_t, uint64_t))(v115 + 32);
    v82(v80, v81, v116);
    uint64_t v83 = (void *)((v119 + v80) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v84 = (void *)((v119 + v81) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v83 = *v84;
    unsigned int v85 = (void *)(((unint64_t)v83 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v86 = (void *)(((unint64_t)v84 + 15) & 0xFFFFFFFFFFFFFFF8);
    *unsigned int v85 = *v86;
    uint64_t v87 = (_OWORD *)(((unint64_t)v85 + 15) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v88 = (_OWORD *)(((unint64_t)v86 + 15) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v87 = *v88;
    unint64_t v89 = (void *)(((unint64_t)v87 + 23) & 0xFFFFFFFFFFFFFFF8);
    size_t v90 = (void *)(((unint64_t)v88 + 23) & 0xFFFFFFFFFFFFFFF8);
    *unint64_t v89 = *v90;
    uint64_t v91 = (char *)(((unint64_t)v89 + v122) & v27);
    unint64_t v92 = (char *)(((unint64_t)v90 + v122) & v27);
    if (v12 < 0x7FFFFFFF)
    {
      unint64_t v97 = *(void *)((unint64_t)&v92[v119] & 0xFFFFFFFFFFFFFFF8);
      if (v97 >= 0xFFFFFFFF) {
        LODWORD(v97) = -1;
      }
      if (v97 != -1) {
        goto LABEL_70;
      }
    }
    else if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v115 + 48))(((unint64_t)v90 + v122) & v27, v12, v116))
    {
LABEL_70:
      unint64_t v93 = __n;
      memcpy(v91, v92, __n);
      uint64_t result = v110;
      unint64_t v95 = v117;
      unint64_t v94 = v118;
      uint64_t v96 = v119;
LABEL_75:
      uint64_t v98 = &v91[v93];
      int v99 = *(_DWORD *)&v92[v93];
      v98[4] = v92[v93 + 4];
      *(_DWORD *)uint64_t v98 = v99;
      *(void *)((unint64_t)&v91[v93 + 12] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v92[v93 + 12] & 0xFFFFFFFFFFFFFFF8);
      size_t v73 = ((v63
            + ((v122
              + ((((((((v96 + ((v121 + v112 + v123) & v95)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
                + 23) & 0xFFFFFFFFFFFFFFF8)) & v94)) & 0xFFFFFFFFFFFFFFF8)
          + 8;
      goto LABEL_76;
    }
    v82((unint64_t)v91, (unint64_t)v92, v116);
    uint64_t v96 = v119;
    *(void *)((unint64_t)&v91[v119] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v92[v119] & 0xFFFFFFFFFFFFFFF8);
    uint64_t result = v110;
    unint64_t v95 = v117;
    unint64_t v94 = v27;
    unint64_t v93 = __n;
    goto LABEL_75;
  }
  uint64_t v68 = v113;
  uint64_t v67 = v114;
  if (v37 < 2 || (*(unsigned int (**)(const void *, void, uint64_t))(v113 + 48))(v66, v120, v114) < 2) {
    goto LABEL_60;
  }
  size_t v69 = v123 + v15;
LABEL_55:
  size_t v73 = ((v63
        + ((v122
          + ((((((((v119 + (v69 & v117)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
            + 23) & 0xFFFFFFFFFFFFFFF8)) & v27)) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  memcpy(v65, v66, v73);
  uint64_t result = v110;
LABEL_76:
  *((unsigned char *)v65 + v73) = *((unsigned char *)v66 + v73);
  return result;
}

uint64_t sub_10003FBC8(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v251 = sub_100044510();
  uint64_t v7 = *(void *)(v251 - 8);
  int v8 = (void (**)(void *, const void *, uint64_t))v7;
  int v9 = *(_DWORD *)(v7 + 80) & 0xF8;
  uint64_t v265 = sub_100044540();
  uint64_t v10 = *(void *)(v265 - 8);
  int v11 = *(_DWORD *)(v10 + 80);
  unsigned int v12 = *(_DWORD *)(v10 + 84);
  uint64_t v257 = v10;
  int v13 = v9 | v11;
  uint64_t v14 = v12;
  uint64_t v15 = v13 | 7u;
  uint64_t v235 = a1;
  uint64_t v16 = v6 + v15 + a1;
  uint64_t v17 = v11;
  unsigned int v18 = (void *)(v16 & ~v15);
  uint64_t v19 = v6 + v15 + a2;
  unsigned int v20 = (char *)(v19 & ~v15);
  uint64_t v21 = *(unsigned int *)(v7 + 84);
  if (v21) {
    unsigned int v22 = v21 - 1;
  }
  else {
    unsigned int v22 = 0;
  }
  if (v12 <= v22) {
    unsigned int v23 = v22;
  }
  else {
    unsigned int v23 = *(_DWORD *)(v10 + 84);
  }
  if (v12 <= 0x7FFFFFFF) {
    unsigned int v12 = 0x7FFFFFFF;
  }
  unsigned int v24 = v12 - 1;
  if (v23 <= v24) {
    unsigned int v23 = v24;
  }
  unsigned int v234 = v23;
  if (v23 <= 0x7FFFFFFF) {
    int v25 = 0x7FFFFFFF;
  }
  else {
    int v25 = v23;
  }
  size_t v26 = *(void *)(v7 + 64);
  unint64_t v256 = v11 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v27 = *(void *)(*(void *)(v265 - 8) + 64) + 7;
  unint64_t v247 = v27 & 0xFFFFFFFFFFFFFFF8;
  unint64_t __n = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
  unint64_t v258 = ~(unint64_t)v11;
  unsigned int __src = (void (**)(void *, const void *, uint64_t))v7;
  size_t v255 = v26;
  unsigned int v246 = v14;
  unsigned int v259 = *(_DWORD *)(v7 + 84);
  int v250 = v25;
  uint64_t v261 = v11;
  uint64_t v243 = v15;
  uint64_t v244 = ~v15;
  unsigned int v239 = v22;
  uint64_t v240 = v16;
  uint64_t v242 = v19;
  if (v22 == v25)
  {
    if (v21 < 2) {
      goto LABEL_18;
    }
    uint64_t v28 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    unsigned int v29 = v28(v16 & ~v15, v21, v251);
    unsigned int v30 = v28((uint64_t)v20, v21, v251);
    if (v29 < 2)
    {
      uint64_t v31 = ~v17;
      unsigned int v32 = v21;
      if (v30 < 2) {
        goto LABEL_18;
      }
LABEL_78:
      if (!((unsigned int (*)(void *, uint64_t, uint64_t))v8[6])(v18, 1, v251)) {
        ((void (*)(void *, uint64_t))v8[1])(v18, v251);
      }
      size_t v91 = v255;
      if (!v32) {
        size_t v91 = v255 + 1;
      }
      size_t v237 = v91;
      uint64_t v263 = v91 + v17;
      unint64_t v92 = ((unint64_t)v18 + v91 + v17) & v31;
      uint64_t v233 = *(void (**)(unint64_t, uint64_t))(v257 + 8);
      v233(v92, v265);
      uint64_t v93 = v17;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v94 = (void *)((((((v27 + v92) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
      if (*v94 >= 0xFFFFFFFFuLL)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      unint64_t v95 = ((unint64_t)v94 + 23) & 0xFFFFFFFFFFFFFFF8;
      swift_bridgeObjectRelease();
      uint64_t v84 = v93 + 8;
      unint64_t v96 = (v84 + v95) & v256;
      if (v14 < 0x7FFFFFFF)
      {
        unint64_t v98 = *(void *)((v27 + v96) & 0xFFFFFFFFFFFFFFF8);
        if (v98 >= 0xFFFFFFFF) {
          LODWORD(v98) = -1;
        }
        int v97 = v98 + 1;
      }
      else
      {
        int v97 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v257 + 48))((v84 + v95) & v256, v14, v265);
      }
      unint64_t v37 = v258;
      if (!v97)
      {
        v233(v96, v265);
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      int v99 = v20;
      unint64_t v83 = v256;
      memcpy(v18, v99, ((v247+ 20+ ((v84+ ((((((((v27 + (v263 & v258)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)) & v256)) & 0xFFFFFFFFFFFFFFF8)+ 8);
      BOOL v77 = __src;
      size_t v82 = v255;
      uint64_t v78 = v259;
      int v100 = v250;
      uint64_t v102 = v243;
      uint64_t v101 = v244;
      unsigned int v103 = v239;
      uint64_t v104 = v240;
      uint64_t v105 = v242;
      size_t v79 = v237;
      goto LABEL_106;
    }
    unsigned int v47 = v8;
    uint64_t v44 = v257;
    if (v30 >= 2)
    {
      BOOL v40 = 0;
      size_t v42 = v255 + v261;
      goto LABEL_104;
    }
    goto LABEL_99;
  }
  BOOL v40 = v21 == 0;
  if (v21) {
    uint64_t v41 = v11;
  }
  else {
    uint64_t v41 = v11 + 1;
  }
  size_t v42 = v41 + v26;
  unint64_t v43 = ((unint64_t)v18 + v41 + v26) & ~(unint64_t)v11;
  if (v14 != v25)
  {
    size_t v48 = (void *)((v27 + v43) & 0xFFFFFFFFFFFFFFF8);
    if ((v23 & 0x80000000) == 0)
    {
      uint64_t v44 = *(void *)(v265 - 8);
      if (*v48 <= 0xFFFFFFFEuLL)
      {
        unint64_t v49 = *(void *)((v27 + ((unint64_t)&v20[v42] & v258)) & 0xFFFFFFFFFFFFFFF8);
        if (v49 >= 0xFFFFFFFF) {
          LODWORD(v49) = -1;
        }
        unsigned int v47 = v8;
        if (v49 != -1) {
          goto LABEL_104;
        }
        goto LABEL_99;
      }
LABEL_71:
      unint64_t v86 = (unint64_t)&v20[v42];
      uint64_t v31 = ~v17;
      unint64_t v87 = v86 & v258;
      if (v14 == v25)
      {
        int v88 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v44 + 48))(v87, v14, v265);
      }
      else
      {
        unint64_t v89 = (unint64_t *)((v27 + v87) & 0xFFFFFFFFFFFFFFF8);
        if ((v234 & 0x80000000) != 0)
        {
          unint64_t v106 = (v17
                + (((((((unint64_t)v89 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
                + 8) & v256;
          int v8 = __src;
          unsigned int v32 = v259;
          if (v14 < 0x7FFFFFFF)
          {
            unint64_t v230 = *(void *)((v27 + v106) & 0xFFFFFFFFFFFFFFF8);
            if (v230 >= 0xFFFFFFFF) {
              LODWORD(v230) = -1;
            }
            if ((v230 + 1) >= 2) {
              goto LABEL_78;
            }
          }
          else if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v44 + 48))(v106, v14, v265) >= 2)
          {
            goto LABEL_78;
          }
          goto LABEL_18;
        }
        unint64_t v90 = *v89;
        if (v90 >= 0xFFFFFFFF) {
          LODWORD(v90) = -1;
        }
        int v88 = v90 + 1;
      }
      int v8 = __src;
      unsigned int v32 = v259;
      if (v88) {
        goto LABEL_78;
      }
LABEL_18:
      unint64_t v33 = v8[6];
      int v34 = ((uint64_t (*)(void *, uint64_t, uint64_t))v33)(v18, 1, v251);
      int v35 = ((uint64_t (*)(char *, uint64_t, uint64_t))v33)(v20, 1, v251);
      if (v34)
      {
        uint64_t v36 = v257;
        unint64_t v37 = ~v17;
        unsigned int v38 = v259;
        if (!v35)
        {
          __src[4](v18, v20, v251);
          unsigned int v38 = v259;
          ((void (*)(void *, void, uint64_t, uint64_t))__src[7])(v18, 0, 1, v251);
          size_t v39 = v255;
          goto LABEL_40;
        }
      }
      else
      {
        uint64_t v36 = v257;
        unint64_t v37 = ~v17;
        unsigned int v38 = v259;
        if (!v35)
        {
          __src[5](v18, v20, v251);
          size_t v39 = v255;
          goto LABEL_40;
        }
        ((void (*)(void *, uint64_t))__src[1])(v18, v251);
      }
      size_t v39 = v255;
      if (v38) {
        size_t v50 = v255;
      }
      else {
        size_t v50 = v255 + 1;
      }
      memcpy(v18, v20, v50);
LABEL_40:
      if (v38) {
        size_t v51 = v39;
      }
      else {
        size_t v51 = v39 + 1;
      }
      size_t v236 = v51;
      uint64_t v52 = v51 + v17;
      unint64_t v53 = ((unint64_t)v18 + v52) & v37;
      unint64_t v54 = (unint64_t)&v20[v52] & v37;
      uint64_t v55 = *(void (**)(unint64_t, unint64_t, uint64_t))(v36 + 40);
      v55(v53, v54, v265);
      unint64_t v56 = (void *)((v27 + v53) & 0xFFFFFFFFFFFFFFF8);
      unint64_t v57 = (v27 + v54) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v58 = *(void *)v57;
      v57 += 15;
      *unint64_t v56 = v58;
      swift_bridgeObjectRelease();
      uint64_t v59 = (void *)(((unint64_t)v56 + 15) & 0xFFFFFFFFFFFFFFF8);
      unint64_t v60 = (v57 & 0xFFFFFFFFFFFFFFF8) + 15;
      *uint64_t v59 = *(void *)(v57 & 0xFFFFFFFFFFFFFFF8);
      swift_bridgeObjectRelease();
      size_t v61 = (void *)(((unint64_t)v59 + 15) & 0xFFFFFFFFFFFFFFF8);
      unint64_t v62 = (void *)(v60 & 0xFFFFFFFFFFFFFFF8);
      unsigned int v232 = (void (*)(char *, char *, uint64_t))v55;
      if (*v61 >= 0xFFFFFFFFuLL)
      {
        if (*v62 >= 0xFFFFFFFFuLL)
        {
          *size_t v61 = *v62;
          swift_bridgeObjectRelease();
          v61[1] = v62[1];
          swift_bridgeObjectRelease();
          goto LABEL_50;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      *(_OWORD *)size_t v61 = *(_OWORD *)v62;
LABEL_50:
      unint64_t v63 = (void *)(((unint64_t)v61 + 23) & 0xFFFFFFFFFFFFFFF8);
      unint64_t v64 = (void *)(((unint64_t)v62 + 23) & 0xFFFFFFFFFFFFFFF8);
      void *v63 = *v64;
      swift_bridgeObjectRelease();
      unint64_t v65 = (char *)(((unint64_t)v63 + v17 + 8) & v256);
      uint64_t v262 = v17 + 8;
      unint64_t v66 = (char *)(((unint64_t)v64 + v17 + 8) & v256);
      if (v14 < 0x7FFFFFFF)
      {
        unint64_t v72 = *(void *)((unint64_t)&v66[v27] & 0xFFFFFFFFFFFFFFF8);
        if (v72 >= 0xFFFFFFFF) {
          LODWORD(v72) = -1;
        }
        int v69 = v72 + 1;
        size_t v70 = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
        if (*(void *)((unint64_t)&v65[v27] & 0xFFFFFFFFFFFFFFF8) < 0xFFFFFFFFuLL) {
          goto LABEL_52;
        }
      }
      else
      {
        uint64_t v67 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v36 + 48);
        int v68 = v67(v65, v14, v265);
        int v69 = v67(v66, v14, v265);
        unint64_t v37 = v258;
        size_t v70 = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
        if (v68)
        {
LABEL_52:
          if (!v69)
          {
            (*(void (**)(char *, char *, uint64_t))(v257 + 32))(v65, v66, v265);
            uint64_t v71 = v27;
            *(void *)((unint64_t)&v65[v27] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v66[v27] & 0xFFFFFFFFFFFFFFF8);
            goto LABEL_66;
          }
          uint64_t v71 = v27;
LABEL_59:
          memcpy(v65, v66, v70);
LABEL_66:
          uint64_t v14 = v14;
          BOOL v77 = __src;
          uint64_t v78 = v259;
          size_t v79 = v236;
          unint64_t v80 = &v65[v70];
          int v81 = *(_DWORD *)&v66[v70];
          v80[4] = v66[v70 + 4];
          *(_DWORD *)unint64_t v80 = v81;
          *(void *)((unint64_t)&v65[v70 + 12] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v66[v70 + 12] & 0xFFFFFFFFFFFFFFF8);
          swift_bridgeObjectRelease();
          size_t v82 = v255;
          unint64_t v83 = v256;
          uint64_t v27 = v71;
          uint64_t v84 = v262;
LABEL_105:
          int v100 = v250;
          uint64_t v102 = v243;
          uint64_t v101 = v244;
          unsigned int v103 = v239;
          uint64_t v104 = v240;
          uint64_t v105 = v242;
LABEL_106:
          size_t v110 = v79;
          goto LABEL_107;
        }
      }
      if (!v69)
      {
        v232(v65, v66, v265);
        uint64_t v71 = v27;
        *(void *)((unint64_t)&v65[v27] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v66[v27] & 0xFFFFFFFFFFFFFFF8);
        swift_bridgeObjectRelease();
        goto LABEL_66;
      }
      (*(void (**)(char *, uint64_t))(v257 + 8))(v65, v265);
      uint64_t v71 = v27;
      swift_bridgeObjectRelease();
      goto LABEL_59;
    }
    unint64_t v73 = (v11
         + 8
         + (((((((unint64_t)v48 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & v256;
    if (v14 < 0x7FFFFFFF)
    {
      unint64_t v85 = *(void *)((v27 + v73) & 0xFFFFFFFFFFFFFFF8);
      if (v85 >= 0xFFFFFFFF) {
        LODWORD(v85) = -1;
      }
      uint64_t v44 = *(void *)(v265 - 8);
      if ((v85 + 1) < 2) {
        goto LABEL_71;
      }
    }
    else
    {
      uint64_t v44 = *(void *)(v265 - 8);
      unsigned int v74 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v10 + 48))(v73, v14, v265);
      int v25 = v250;
      if (v74 < 2) {
        goto LABEL_71;
      }
    }
    unint64_t v75 = (v17
         + 8
         + ((((((((v27 + ((unint64_t)&v20[v42] & v258)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
           + 23) & 0xFFFFFFFFFFFFFFF8)) & v256;
    if (v14 < 0x7FFFFFFF)
    {
      unint64_t v107 = *(void *)((v27 + v75) & 0xFFFFFFFFFFFFFFF8);
      if (v107 >= 0xFFFFFFFF) {
        LODWORD(v107) = -1;
      }
      unsigned int v76 = v107 + 1;
    }
    else
    {
      unsigned int v76 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v44 + 48))(v75, v14, v265);
    }
    unsigned int v47 = v8;
    if (v76 >= 2) {
      goto LABEL_104;
    }
    goto LABEL_99;
  }
  uint64_t v44 = *(void *)(v265 - 8);
  unint64_t v45 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v10 + 48);
  int v46 = v45(v43, v14, v265);
  int v25 = v250;
  if (!v46) {
    goto LABEL_71;
  }
  unsigned int v47 = __src;
  if (v45((unint64_t)&v20[v42] & v258, v14, v265))
  {
LABEL_104:
    BOOL v77 = v47;
    unint64_t v108 = (((((((v27 + (v42 & v258)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
          + 23) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v84 = v261 + 8;
    int v109 = v20;
    unint64_t v83 = v256;
    memcpy(v18, v109, ((v247 + ((v261 + 8 + v108) & v256) + 20) & 0xFFFFFFFFFFFFFFF8) + 8);
    size_t v82 = v255;
    size_t v79 = v255 + v40;
    unint64_t v37 = v258;
    uint64_t v78 = v259;
    goto LABEL_105;
  }
LABEL_99:
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v47[6])(v20, 1, v251))
  {
    BOOL v77 = v47;
    if (v259) {
      size_t v79 = v255;
    }
    else {
      size_t v79 = v255 + 1;
    }
    memcpy(v18, v20, v79);
  }
  else
  {
    v47[4](v18, v20, v251);
    BOOL v77 = v47;
    ((void (*)(void *, void, uint64_t, uint64_t))v47[7])(v18, 0, 1, v251);
    if (v259) {
      size_t v79 = v255;
    }
    else {
      size_t v79 = v255 + 1;
    }
  }
  unint64_t v37 = v258;
  unint64_t v164 = ((unint64_t)v18 + v79 + v261) & v258;
  unint64_t v165 = (unint64_t)&v20[v79 + v261] & v258;
  __srcb = *(void (**)(unint64_t, unint64_t, uint64_t))(v44 + 32);
  __srcb(v164, v165, v265);
  uint64_t v166 = (void *)((v27 + v164) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v167 = (void *)((v27 + v165) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v166 = *v167;
  int v168 = (void *)(((unint64_t)v166 + 15) & 0xFFFFFFFFFFFFFFF8);
  int v169 = (void *)(((unint64_t)v167 + 15) & 0xFFFFFFFFFFFFFFF8);
  *int v168 = *v169;
  uint64_t v170 = (_OWORD *)(((unint64_t)v168 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v171 = (_OWORD *)(((unint64_t)v169 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v170 = *v171;
  unint64_t v172 = (void *)(((unint64_t)v170 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v173 = (void *)(((unint64_t)v171 + 23) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v172 = *v173;
  unsigned int v174 = (char *)(((unint64_t)v172 + v261 + 8) & v256);
  unint64_t v175 = (char *)(((unint64_t)v173 + v261 + 8) & v256);
  if (v14 < 0x7FFFFFFF)
  {
    unint64_t v177 = *(void *)((unint64_t)&v175[v27] & 0xFFFFFFFFFFFFFFF8);
    if (v177 >= 0xFFFFFFFF) {
      LODWORD(v177) = -1;
    }
    int v176 = v177 + 1;
  }
  else
  {
    int v176 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v44 + 48))(v175, v14, v265);
  }
  uint64_t v78 = v259;
  unsigned int v103 = v239;
  if (v176)
  {
    unint64_t v178 = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
    memcpy(v174, v175, __n);
  }
  else
  {
    __srcb((unint64_t)v174, (unint64_t)v175, v265);
    *(void *)((unint64_t)&v174[v27] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v175[v27] & 0xFFFFFFFFFFFFFFF8);
    unint64_t v178 = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
  }
  long long v183 = &v174[v178];
  int v184 = *(_DWORD *)&v175[v178];
  v183[4] = v175[v178 + 4];
  *(_DWORD *)long long v183 = v184;
  *(void *)((unint64_t)&v174[v178 + 12] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v175[v178 + 12] & 0xFFFFFFFFFFFFFFF8);
  size_t v82 = v255;
  unint64_t v83 = v256;
  size_t v110 = v255;
  uint64_t v84 = v261 + 8;
  int v100 = v250;
  uint64_t v102 = v243;
  uint64_t v101 = v244;
  uint64_t v104 = v240;
  uint64_t v105 = v242;
  if (!v259) {
    goto LABEL_106;
  }
LABEL_107:
  unint64_t v238 = v247 + 20;
  unint64_t v111 = ((v247
         + 20
         + ((v84
           + ((((((((v27 + ((v110 + v261) & v37)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
             + 23) & 0xFFFFFFFFFFFFFFF8)) & v83)) & 0xFFFFFFFFFFFFFFF8)
       + 8;
  uint64_t v112 = (void *)(((v104 | v102) + v111) & v101);
  __srca = (unsigned char *)(((v105 | v102) + v111) & v101);
  uint64_t v264 = v84;
  if (v103 == v100)
  {
    uint64_t v113 = (void *)(((v104 | v102) + v111) & v101);
    uint64_t v114 = v251;
    uint64_t v115 = v77;
    if (v78 < 2) {
      goto LABEL_111;
    }
    uint64_t v116 = v77[6];
    unsigned int v117 = ((uint64_t (*)(void *, uint64_t, uint64_t))v116)(v112, v78, v251);
    unsigned int v118 = ((uint64_t (*)(unsigned char *, uint64_t, uint64_t))v116)(__srca, v78, v251);
    if (v117 < 2)
    {
      unint64_t v37 = v258;
      unsigned int v119 = v259;
      uint64_t v115 = v77;
      if (v118 < 2) {
        goto LABEL_111;
      }
LABEL_184:
      if (!((unsigned int (*)(void *, uint64_t, uint64_t))v115[6])(v113, 1, v114)) {
        ((void (*)(void *, uint64_t))v115[1])(v113, v114);
      }
      BOOL v249 = v119 == 0;
      if (v119) {
        size_t v191 = v82;
      }
      else {
        size_t v191 = v82 + 1;
      }
      uint64_t v192 = v191 + v261;
      unint64_t v193 = ((unint64_t)v113 + v191 + v261) & v37;
      unint64_t v194 = *(void (**)(unint64_t, uint64_t))(v257 + 8);
      v194(v193, v265);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      size_t v195 = (void *)((((((v27 + v193) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
      if (*v195 >= 0xFFFFFFFFuLL)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      unint64_t v196 = (v264 + (((unint64_t)v195 + 23) & 0xFFFFFFFFFFFFFFF8)) & v83;
      if (v246 < 0x7FFFFFFF)
      {
        unint64_t v197 = *(void *)((v27 + v196) & 0xFFFFFFFFFFFFFFF8);
        if (v197 >= 0xFFFFFFFF) {
          LODWORD(v197) = -1;
        }
        uint64_t v159 = v235;
        if (v197 != -1) {
          goto LABEL_198;
        }
      }
      else
      {
        uint64_t v159 = v235;
        if ((*(unsigned int (**)(unint64_t))(v257 + 48))(v196))
        {
LABEL_198:
          unint64_t v179 = v238;
          swift_bridgeObjectRelease();
          unint64_t v198 = (((((((v27 + (v192 & v37)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
                + 23) & 0xFFFFFFFFFFFFFFF8;
          uint64_t v84 = v264;
          size_t v199 = __srca;
          memcpy(v113, __srca, ((v238 + ((v264 + v198) & v83)) & 0xFFFFFFFFFFFFFFF8) + 8);
          uint64_t v182 = v261;
          size_t v82 = v255;
LABEL_226:
          BOOL v207 = v249;
          goto LABEL_227;
        }
      }
      v194(v196, v265);
      swift_bridgeObjectRelease();
      goto LABEL_198;
    }
    uint64_t v138 = v257;
    unint64_t v37 = v258;
    int v135 = __srca;
    if (v118 >= 2)
    {
      BOOL v248 = 0;
      size_t v130 = v82 + v261;
      goto LABEL_212;
    }
LABEL_207:
    if (((unsigned int (*)(const void *, uint64_t, uint64_t))v77[6])(v135, 1, v114))
    {
      BOOL v249 = v259 == 0;
      if (v259) {
        size_t v205 = v82;
      }
      else {
        size_t v205 = v82 + 1;
      }
      memcpy(v113, v135, v205);
    }
    else
    {
      v77[4](v113, v135, v114);
      ((void (*)(void *, void, uint64_t, uint64_t))v77[7])(v113, 0, 1, v114);
      BOOL v249 = v259 == 0;
      if (v259) {
        size_t v205 = v82;
      }
      else {
        size_t v205 = v82 + 1;
      }
    }
    size_t v208 = v205 + v261;
    unint64_t v209 = ((unint64_t)v113 + v205 + v261) & v37;
    unint64_t v210 = ((unint64_t)v135 + v208) & v37;
    uint64_t v211 = *(void (**)(unint64_t, unint64_t, uint64_t))(v138 + 32);
    v211(v209, v210, v265);
    uint64_t v212 = (void *)((v27 + v209) & 0xFFFFFFFFFFFFFFF8);
    v213 = (void *)((v27 + v210) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v212 = *v213;
    int v214 = (void *)(((unint64_t)v212 + 15) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v215 = (void *)(((unint64_t)v213 + 15) & 0xFFFFFFFFFFFFFFF8);
    *int v214 = *v215;
    unint64_t v216 = (_OWORD *)(((unint64_t)v214 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v217 = (_OWORD *)(((unint64_t)v215 + 15) & 0xFFFFFFFFFFFFFFF8);
    *unint64_t v216 = *v217;
    int v218 = (void *)(((unint64_t)v216 + 23) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v219 = (void *)(((unint64_t)v217 + 23) & 0xFFFFFFFFFFFFFFF8);
    *int v218 = *v219;
    unint64_t v220 = (char *)(((unint64_t)v218 + v84) & v256);
    unint64_t v221 = (char *)(((unint64_t)v219 + v84) & v256);
    v241 = v113;
    if (v246 < 0x7FFFFFFF)
    {
      uint64_t v222 = v27;
      unint64_t v224 = *(void *)((unint64_t)&v221[v27] & 0xFFFFFFFFFFFFFFF8);
      if (v224 >= 0xFFFFFFFF) {
        LODWORD(v224) = -1;
      }
      int v223 = v224 + 1;
    }
    else
    {
      uint64_t v222 = v27;
      int v223 = (*(uint64_t (**)(char *))(v138 + 48))(v221);
    }
    uint64_t v159 = v235;
    unint64_t v83 = v256;
    if (v223)
    {
      unint64_t v225 = __n;
      memcpy(v220, v221, __n);
      uint64_t v27 = v222;
    }
    else
    {
      v211((unint64_t)v220, (unint64_t)v221, v265);
      uint64_t v27 = v222;
      *(void *)((unint64_t)&v220[v222] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v221[v222] & 0xFFFFFFFFFFFFFFF8);
      unint64_t v225 = __n;
    }
    unint64_t v179 = v238;
    size_t v226 = &v220[v225];
    int v227 = *(_DWORD *)&v221[v225];
    v226[4] = v221[v225 + 4];
    *(_DWORD *)size_t v226 = v227;
    *(void *)((unint64_t)&v220[v225 + 12] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v221[v225 + 12] & 0xFFFFFFFFFFFFFFF8);
    uint64_t v182 = v261;
    uint64_t v84 = v264;
    size_t v82 = v255;
    uint64_t v113 = v241;
    goto LABEL_225;
  }
  BOOL v248 = v78 == 0;
  if (v78) {
    uint64_t v129 = v261;
  }
  else {
    uint64_t v129 = v261 + 1;
  }
  size_t v130 = v129 + v82;
  uint64_t v113 = v112;
  unint64_t v131 = ((unint64_t)v112 + v129 + v82) & v37;
  if (v14 == v100)
  {
    unint64_t v132 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v257 + 48);
    int v133 = v132(v131, v14, v265);
    int v100 = v250;
    if (v133)
    {
      int v134 = v132((unint64_t)&__srca[v130] & v37, v14, v265);
      int v135 = __srca;
      goto LABEL_125;
    }
LABEL_177:
    unint64_t v186 = (unint64_t)&__srca[v130] & v37;
    unsigned int v187 = v14;
    if (v14 == v100)
    {
      int v188 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v257 + 48))(v186, v14, v265);
    }
    else
    {
      unint64_t v189 = (unint64_t *)((v27 + v186) & 0xFFFFFFFFFFFFFFF8);
      if ((v234 & 0x80000000) != 0)
      {
        unint64_t v202 = (v84
              + (((((((unint64_t)v189 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & v256;
        uint64_t v114 = v251;
        unsigned int v119 = v259;
        uint64_t v115 = v77;
        if (v187 < 0x7FFFFFFF)
        {
          unint64_t v231 = *(void *)((v27 + v202) & 0xFFFFFFFFFFFFFFF8);
          if (v231 >= 0xFFFFFFFF) {
            LODWORD(v231) = -1;
          }
          unsigned int v203 = v231 + 1;
        }
        else
        {
          unsigned int v203 = (*(uint64_t (**)(unint64_t))(v257 + 48))(v202);
        }
        unint64_t v83 = v256;
        if (v203 >= 2) {
          goto LABEL_184;
        }
LABEL_111:
        unsigned int v120 = v115[6];
        int v121 = ((uint64_t (*)(void *, uint64_t, uint64_t))v120)(v113, 1, v114);
        int v122 = ((uint64_t (*)(unsigned char *, uint64_t, uint64_t))v120)(__srca, 1, v114);
        if (v121)
        {
          uint64_t v124 = v257;
          unint64_t v123 = v258;
          unsigned int v125 = v259;
          uint64_t v126 = v27;
          if (!v122)
          {
            size_t v127 = v82;
            uint64_t v128 = __srca;
            v77[4](v113, __srca, v114);
            ((void (*)(void *, void, uint64_t, uint64_t))v77[7])(v113, 0, 1, v114);
            goto LABEL_133;
          }
        }
        else
        {
          uint64_t v124 = v257;
          unint64_t v123 = v258;
          unsigned int v125 = v259;
          uint64_t v126 = v27;
          if (!v122)
          {
            size_t v127 = v82;
            uint64_t v128 = __srca;
            v77[5](v113, __srca, v114);
            goto LABEL_133;
          }
          ((void (*)(void *, uint64_t))v77[1])(v113, v114);
        }
        if (v125) {
          size_t v139 = v82;
        }
        else {
          size_t v139 = v82 + 1;
        }
        size_t v127 = v82;
        uint64_t v128 = __srca;
        memcpy(v113, __srca, v139);
LABEL_133:
        BOOL v249 = v125 == 0;
        if (v125) {
          size_t v140 = v127;
        }
        else {
          size_t v140 = v127 + 1;
        }
        uint64_t v141 = v140 + v261;
        unint64_t v142 = ((unint64_t)v113 + v141) & v123;
        unint64_t v143 = ((unint64_t)v128 + v141) & v123;
        int v144 = *(void (**)(unint64_t, unint64_t, uint64_t))(v124 + 40);
        v144(v142, v143, v265);
        uint64_t v27 = v126;
        int v145 = (void *)((v126 + v142) & 0xFFFFFFFFFFFFFFF8);
        uint64_t v146 = (void *)((v126 + v143) & 0xFFFFFFFFFFFFFFF8);
        *int v145 = *v146;
        swift_bridgeObjectRelease();
        unint64_t v147 = (void *)(((unint64_t)v145 + 15) & 0xFFFFFFFFFFFFFFF8);
        size_t v148 = (void *)(((unint64_t)v146 + 15) & 0xFFFFFFFFFFFFFFF8);
        void *v147 = *v148;
        swift_bridgeObjectRelease();
        size_t v149 = (void *)(((unint64_t)v147 + 15) & 0xFFFFFFFFFFFFFFF8);
        uint64_t v150 = (void *)(((unint64_t)v148 + 15) & 0xFFFFFFFFFFFFFFF8);
        v260 = (void (*)(char *, char *, uint64_t))v144;
        if (*v149 >= 0xFFFFFFFFuLL)
        {
          uint64_t v151 = v124;
          if (*v150 >= 0xFFFFFFFFuLL)
          {
            *size_t v149 = *v150;
            swift_bridgeObjectRelease();
            v149[1] = v150[1];
            swift_bridgeObjectRelease();
            goto LABEL_144;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v151 = v124;
        }
        *(_OWORD *)size_t v149 = *(_OWORD *)v150;
LABEL_144:
        size_t v82 = v255;
        unint64_t v152 = (void *)(((unint64_t)v149 + 23) & 0xFFFFFFFFFFFFFFF8);
        uint64_t v153 = (void *)(((unint64_t)v150 + 23) & 0xFFFFFFFFFFFFFFF8);
        *unint64_t v152 = *v153;
        swift_bridgeObjectRelease();
        uint64_t v154 = (char *)(((unint64_t)v152 + v264) & v83);
        unint64_t v155 = (char *)(((unint64_t)v153 + v264) & v83);
        if (v246 < 0x7FFFFFFF)
        {
          unint64_t v160 = *(void *)((unint64_t)&v155[v126] & 0xFFFFFFFFFFFFFFF8);
          if (v160 >= 0xFFFFFFFF) {
            LODWORD(v160) = -1;
          }
          int v158 = v160 + 1;
          uint64_t v159 = v235;
          if (*(void *)((unint64_t)&v154[v126] & 0xFFFFFFFFFFFFFFF8) < 0xFFFFFFFFuLL)
          {
LABEL_146:
            unint64_t v37 = v258;
            if (!v158)
            {
              (*(void (**)(char *, char *, uint64_t))(v151 + 32))(v154, v155, v265);
              *(void *)((unint64_t)&v154[v27] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v155[v27] & 0xFFFFFFFFFFFFFFF8);
LABEL_167:
              unint64_t v161 = __n;
              goto LABEL_168;
            }
            goto LABEL_153;
          }
        }
        else
        {
          uint64_t v156 = *(uint64_t (**)(char *, void, uint64_t))(v151 + 48);
          int v157 = v156(v154, v246, v265);
          int v158 = v156(v155, v246, v265);
          size_t v82 = v255;
          unint64_t v83 = v256;
          uint64_t v159 = v235;
          if (v157) {
            goto LABEL_146;
          }
        }
        unint64_t v37 = v258;
        if (!v158)
        {
          v260(v154, v155, v265);
          *(void *)((unint64_t)&v154[v27] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v155[v27] & 0xFFFFFFFFFFFFFFF8);
          swift_bridgeObjectRelease();
          goto LABEL_167;
        }
        (*(void (**)(char *, uint64_t))(v151 + 8))(v154, v265);
        swift_bridgeObjectRelease();
LABEL_153:
        unint64_t v161 = __n;
        memcpy(v154, v155, __n);
LABEL_168:
        unint64_t v179 = v238;
        unint64_t v180 = &v154[v161];
        int v181 = *(_DWORD *)&v155[v161];
        v180[4] = v155[v161 + 4];
        *(_DWORD *)unint64_t v180 = v181;
        *(void *)((unint64_t)&v154[v161 + 12] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&v155[v161 + 12] & 0xFFFFFFFFFFFFFFF8);
        swift_bridgeObjectRelease();
        uint64_t v182 = v261;
        uint64_t v84 = v264;
LABEL_225:
        size_t v199 = __srca;
        goto LABEL_226;
      }
      unint64_t v190 = *v189;
      if (v190 >= 0xFFFFFFFF) {
        LODWORD(v190) = -1;
      }
      int v188 = v190 + 1;
    }
    uint64_t v114 = v251;
    unsigned int v119 = v259;
    unint64_t v83 = v256;
    uint64_t v115 = v77;
    if (v188) {
      goto LABEL_184;
    }
    goto LABEL_111;
  }
  uint64_t v136 = (void *)((v27 + v131) & 0xFFFFFFFFFFFFFFF8);
  if ((v234 & 0x80000000) != 0)
  {
    unint64_t v162 = (v84
          + (((((((unint64_t)v136 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & v83;
    if (v14 < 0x7FFFFFFF)
    {
      unint64_t v185 = *(void *)((v27 + v162) & 0xFFFFFFFFFFFFFFF8);
      if (v185 >= 0xFFFFFFFF) {
        LODWORD(v185) = -1;
      }
      unsigned int v163 = v185 + 1;
    }
    else
    {
      unsigned int v163 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v257 + 48))(v162, v14, v265);
      int v100 = v250;
    }
    uint64_t v14 = v14;
    if (v163 >= 2)
    {
      int v135 = __srca;
      unint64_t v200 = (v84
            + ((((((((v27 + ((unint64_t)&__srca[v130] & v37)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
                + 15) & 0xFFFFFFFFFFFFFFF8)
              + 23) & 0xFFFFFFFFFFFFFFF8)) & v256;
      if (v14 < 0x7FFFFFFF)
      {
        unint64_t v204 = *(void *)((v27 + v200) & 0xFFFFFFFFFFFFFFF8);
        if (v204 >= 0xFFFFFFFF) {
          LODWORD(v204) = -1;
        }
        unsigned int v201 = v204 + 1;
        uint64_t v138 = v257;
      }
      else
      {
        uint64_t v138 = v257;
        unsigned int v201 = (*(uint64_t (**)(unint64_t, void, uint64_t))(v257 + 48))(v200, v14, v265);
      }
      uint64_t v114 = v251;
      if (v201 >= 2) {
        goto LABEL_212;
      }
      goto LABEL_207;
    }
    goto LABEL_177;
  }
  if (*v136 > 0xFFFFFFFEuLL) {
    goto LABEL_177;
  }
  int v135 = __srca;
  unint64_t v137 = *(void *)((v27 + ((unint64_t)&__srca[v130] & v37)) & 0xFFFFFFFFFFFFFFF8);
  if (v137 >= 0xFFFFFFFF) {
    LODWORD(v137) = -1;
  }
  int v134 = v137 + 1;
LABEL_125:
  uint64_t v138 = v257;
  uint64_t v114 = v251;
  if (!v134) {
    goto LABEL_207;
  }
LABEL_212:
  unint64_t v83 = v256;
  unint64_t v206 = (v84
        + ((((((((v27 + (v130 & v37)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
          + 23) & 0xFFFFFFFFFFFFFFF8)) & v256;
  unint64_t v179 = v238;
  memcpy(v113, v135, ((v238 + v206) & 0xFFFFFFFFFFFFFFF8) + 8);
  size_t v199 = v135;
  uint64_t v159 = v235;
  BOOL v207 = v248;
  uint64_t v182 = v261;
LABEL_227:
  unint64_t v228 = ((v179
         + ((v84
           + ((((((((v27 + ((v207 + v82 + v182) & v37)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
             + 23) & 0xFFFFFFFFFFFFFFF8)) & v83)) & 0xFFFFFFFFFFFFFFF8)
       + 8;
  *((unsigned char *)v113 + v228) = v199[v228];
  return v159;
}

uint64_t sub_10004163C(unsigned __int16 *a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v49 = AssociatedTypeWitness;
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v48 = sub_100044510();
  uint64_t v7 = *(void *)(v48 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  if (v8) {
    unsigned int v9 = v8 - 1;
  }
  else {
    unsigned int v9 = 0;
  }
  uint64_t v10 = *(void *)(sub_100044540() - 8);
  uint64_t v11 = v10;
  unsigned int v12 = *(_DWORD *)(v10 + 84);
  if (v12 <= v9) {
    unsigned int v13 = v9;
  }
  else {
    unsigned int v13 = *(_DWORD *)(v10 + 84);
  }
  if (v12 <= 0x7FFFFFFF) {
    int v14 = 0x7FFFFFFF;
  }
  else {
    int v14 = *(_DWORD *)(v10 + 84);
  }
  unsigned int v15 = v14 - 1;
  if (v13 > v15) {
    unsigned int v15 = v13;
  }
  if (v15 <= 0x7FFFFFFF) {
    int v16 = 0x7FFFFFFF;
  }
  else {
    int v16 = v15;
  }
  if (v16 - 1 <= v6) {
    unsigned int v17 = v6;
  }
  else {
    unsigned int v17 = v16 - 1;
  }
  int v18 = *(_DWORD *)(v10 + 80);
  uint64_t v19 = *(void *)(v7 + 64);
  if (!v8) {
    ++v19;
  }
  uint64_t v20 = *(void *)(v10 + 64);
  if (!a2) {
    return 0;
  }
  uint64_t v21 = v18;
  uint64_t v22 = *(_DWORD *)(v7 + 80) & 0xF8 | v18 | 7u;
  uint64_t v23 = *(void *)(v5 + 64) + v22;
  unint64_t v24 = v18 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v25 = v20 + 7;
  uint64_t v26 = v19 + v18;
  uint64_t v27 = v18 + 8;
  if (a2 > v17)
  {
    unint64_t v28 = (((v25 & 0xFFFFFFFFFFFFFFF8)
          + ((v27
            + ((((((((v25 + (v26 & ~v21)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
              + 23) & 0xFFFFFFFFFFFFFFF8)) & v24)
          + 20) & 0xFFFFFFFFFFFFFFF8)
        + 8;
    uint64_t v29 = ((((v23 | v22) + v28) & ~v22) + v28) | 1;
    char v30 = 8 * v29;
    if (v29 > 3) {
      goto LABEL_23;
    }
    unsigned int v32 = (a2 - v17 + ~(-1 << v30)) >> v30;
    if (v32 > 0xFFFE)
    {
      int v31 = *(_DWORD *)((char *)a1 + v29);
      if (!v31) {
        goto LABEL_40;
      }
      goto LABEL_30;
    }
    if (v32 > 0xFE)
    {
      int v31 = *(unsigned __int16 *)((char *)a1 + v29);
      if (!*(unsigned __int16 *)((char *)a1 + v29)) {
        goto LABEL_40;
      }
      goto LABEL_30;
    }
    if (v32)
    {
LABEL_23:
      int v31 = *((unsigned __int8 *)a1 + v29);
      if (!*((unsigned char *)a1 + v29)) {
        goto LABEL_40;
      }
LABEL_30:
      int v33 = (v31 - 1) << v30;
      if (v29 <= 3)
      {
        int v34 = v29;
      }
      else
      {
        int v33 = 0;
        int v34 = 4;
      }
      switch(v34)
      {
        case 2:
          int v35 = *a1;
          break;
        case 3:
          int v35 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
          int v35 = *(_DWORD *)a1;
          break;
        default:
          int v35 = *(unsigned __int8 *)a1;
          break;
      }
      return v17 + (v35 | v33) + 1;
    }
  }
LABEL_40:
  if (v6 >= v16 - 1)
  {
    uint64_t v41 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v5 + 48);
    return v41(a1, v6, v49);
  }
  unint64_t v37 = ((unint64_t)a1 + v23) & ~v22;
  if (v9 == v16)
  {
    if (v8 < 2) {
      return 0;
    }
    unsigned int v38 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 48))(v37, v8, v48);
  }
  else
  {
    unint64_t v42 = (v26 + v37) & ~v21;
    if (v12 == v16)
    {
      int v43 = (*(uint64_t (**)(unint64_t))(v11 + 48))(v42);
      BOOL v40 = v43 != 0;
      uint64_t result = (v43 - 1);
      if (result != 0 && v40) {
        return result;
      }
      return 0;
    }
    uint64_t v44 = (uint64_t *)((v25 + v42) & 0xFFFFFFFFFFFFFFF8);
    if ((v15 & 0x80000000) == 0)
    {
      uint64_t v45 = *v44;
      if ((unint64_t)*v44 >= 0xFFFFFFFF) {
        LODWORD(v45) = -1;
      }
      uint64_t result = v45;
      if (v45 == 0 || v45 == -1) {
        return 0;
      }
      return result;
    }
    unint64_t v46 = (v27
         + (((((((unint64_t)v44 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & v24;
    if (v12 < 0x7FFFFFFF)
    {
      unint64_t v47 = *(void *)((v25 + v46) & 0xFFFFFFFFFFFFFFF8);
      if (v47 >= 0xFFFFFFFF) {
        LODWORD(v47) = -1;
      }
      unsigned int v38 = v47 + 1;
    }
    else
    {
      unsigned int v38 = (*(uint64_t (**)(unint64_t))(v11 + 48))(v46);
    }
  }
  if (v38 < 2) {
    return 0;
  }
  unsigned int v39 = v38 - 1;
  BOOL v40 = v39 != 0;
  uint64_t result = v39 - 1;
  if (result == 0 || !v40) {
    return 0;
  }
  return result;
}

void sub_100041A98(unsigned char *a1, uint64_t a2, unsigned int a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v56 = v6;
  uint64_t v57 = AssociatedTypeWitness;
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v55 = sub_100044510();
  uint64_t v8 = *(void *)(v55 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  if (v9) {
    unsigned int v10 = v9 - 1;
  }
  else {
    unsigned int v10 = 0;
  }
  int v11 = 0;
  uint64_t v12 = *(void *)(sub_100044540() - 8);
  unsigned int v13 = *(_DWORD *)(v12 + 84);
  uint64_t v14 = *(void *)(v8 + 64);
  uint64_t v15 = *(void *)(v12 + 64);
  if (v13 <= v10) {
    unsigned int v16 = v10;
  }
  else {
    unsigned int v16 = *(_DWORD *)(v12 + 84);
  }
  if (v13 <= 0x7FFFFFFF) {
    unsigned int v17 = 0x7FFFFFFF;
  }
  else {
    unsigned int v17 = *(_DWORD *)(v12 + 84);
  }
  unsigned int v18 = v17 - 1;
  if (v16 > v17 - 1) {
    unsigned int v18 = v16;
  }
  if (v18 <= 0x7FFFFFFF) {
    unsigned int v19 = 0x7FFFFFFF;
  }
  else {
    unsigned int v19 = v18;
  }
  unsigned int v20 = v19 - 1;
  if (v19 - 1 <= v7) {
    unsigned int v21 = v7;
  }
  else {
    unsigned int v21 = v19 - 1;
  }
  uint64_t v22 = *(_DWORD *)(v12 + 80);
  uint64_t v23 = *(_DWORD *)(v8 + 80) & 0xF8 | *(_DWORD *)(v12 + 80) | 7u;
  uint64_t v24 = *(void *)(v6 + 64) + v23;
  if (!v9) {
    ++v14;
  }
  unint64_t v25 = *(_DWORD *)(v12 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v26 = v15 + 7;
  unint64_t v27 = (v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v28 = v14 + v22;
  uint64_t v29 = v15 + 7 + ((v14 + v22) & ~v22);
  uint64_t v30 = v22 + 8;
  unint64_t v31 = ((v27
        + ((v22
          + 8
          + (((((((v29 & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & v25)
        + 20) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  size_t v32 = ((((v24 | v23) + v31) & ~v23) + v31) | 1;
  if (a3 > v21)
  {
    if (v32 <= 3)
    {
      unsigned int v33 = (a3 - v21 + ~(-1 << (8 * v32))) >> (8 * v32);
      if (v33 > 0xFFFE)
      {
        int v11 = 4;
      }
      else if (v33 >= 0xFF)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v33 != 0;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  unsigned int v34 = a2;
  if (v21 < a2)
  {
    unsigned int v35 = ~v21 + a2;
    if (v32 < 4)
    {
      int v36 = (v35 >> (8 * v32)) + 1;
      int v40 = v35 & ~(-1 << (8 * v32));
      bzero(a1, v32);
      if (v32 == 1)
      {
        *a1 = v40;
      }
      else
      {
        *(_WORD *)a1 = v40;
        a1[2] = BYTE2(v40);
      }
    }
    else
    {
      bzero(a1, v32);
      *(_DWORD *)a1 = v35;
      int v36 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v32] = v36;
        return;
      case 2:
        *(_WORD *)&a1[v32] = v36;
        return;
      case 3:
        goto LABEL_78;
      case 4:
        *(_DWORD *)&a1[v32] = v36;
        return;
      default:
        return;
    }
  }
  size_t v37 = v27 + 8;
  uint64_t v38 = ~v23;
  unsigned int v39 = a1;
  switch(v11)
  {
    case 1:
      a1[v32] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_38;
    case 2:
      *(_WORD *)&a1[v32] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_38;
    case 3:
LABEL_78:
      __break(1u);
      JUMPOUT(0x100042000);
    case 4:
      *(_DWORD *)&a1[v32] = 0;
      goto LABEL_37;
    default:
LABEL_37:
      if (!a2) {
        return;
      }
LABEL_38:
      if (v7 >= v20)
      {
        uint64_t v46 = v57;
        unint64_t v47 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v56 + 56);
        uint64_t v48 = a2;
        uint64_t v49 = v7;
LABEL_45:
        v47(v39, v48, v49, v46);
        return;
      }
      uint64_t v41 = (_DWORD *)((unint64_t)&a1[v24] & v38);
      size_t v42 = ((((v30 + (((((((v29 & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8)) & v25)
            + v37
            + 12) & 0xFFFFFFF8)
          + 8;
      if (v20 < v34 || (uint64_t v43 = v34 + 1, v43 > v19))
      {
        if (!v42) {
          return;
        }
        unsigned int v44 = v34 - v19;
        uint64_t v45 = (void *)((unint64_t)&a1[v24] & v38);
        size_t v37 = v42;
        goto LABEL_43;
      }
      if (v34 == -1) {
        return;
      }
      if (v10 == v19)
      {
        uint64_t v48 = v34 + 2;
        unint64_t v47 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
        unsigned int v39 = (unsigned char *)((unint64_t)&a1[v24] & v38);
        uint64_t v49 = v9;
        uint64_t v46 = v55;
        goto LABEL_45;
      }
      unint64_t v50 = ((unint64_t)v41 + v28) & ~v22;
      if (v13 == v19)
      {
        size_t v51 = *(void (**)(unint64_t, uint64_t))(v12 + 56);
        uint64_t v52 = v34 + 1;
LABEL_60:
        v51(v50, v52);
        return;
      }
      unint64_t v53 = (void *)((v26 + v50) & 0xFFFFFFFFFFFFFFF8);
      if ((v18 & 0x80000000) == 0)
      {
        if ((v43 & 0x80000000) != 0) {
          uint64_t v54 = v34 - 0x7FFFFFFF;
        }
        else {
          uint64_t v54 = v34;
        }
        void *v53 = v54;
        return;
      }
      uint64_t v41 = (_DWORD *)((v30
                      + (((((((unint64_t)v53 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & v25);
      if (v34 + 2 <= v17)
      {
        if (v34 == -2) {
          return;
        }
        if (v13 >= 0x7FFFFFFF)
        {
          size_t v51 = *(void (**)(unint64_t, uint64_t))(v12 + 56);
          unint64_t v50 = (v30
               + (((((((unint64_t)v53 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & v25;
          uint64_t v52 = v34 + 2;
          goto LABEL_60;
        }
        if (((v34 + 2) & 0x80000000) != 0) {
          uint64_t v43 = v34 - 2147483646;
        }
        *(void *)(((unint64_t)v41 + v26) & 0xFFFFFFFFFFFFFFF8) = v43;
      }
      else if (v27 != -8)
      {
        unsigned int v44 = v43 - v17;
        uint64_t v45 = (void *)((v30
                      + (((((((unint64_t)v53 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & v25);
LABEL_43:
        bzero(v45, v37);
        _DWORD *v41 = v44;
      }
      return;
  }
}

void sub_100042028()
{
  if (!qword_100051DC0)
  {
    type metadata accessor for UniversalSuggestionsFeaturisedTurn(255);
    unint64_t v0 = sub_100044F90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100051DC0);
    }
  }
}

uint64_t sub_100042080(void *a1)
{
  id v1 = [a1 services];
  sub_100042308();
  unint64_t v2 = sub_100044E40();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
LABEL_15:
    uint64_t v6 = _swiftEmptyArrayStorage;
LABEL_16:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v6;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000450C0();
  uint64_t v3 = result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_3:
  if (v3 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = _swiftEmptyArrayStorage;
    unint64_t v16 = v2 & 0xC000000000000001;
    unint64_t v7 = v2;
    do
    {
      if (v16) {
        id v8 = (id)sub_100045020();
      }
      else {
        id v8 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v23 = &type metadata for HomeKitService;
      uint64_t v24 = &off_10004D2D8;
      *(void *)&long long v22 = v8;
      sub_100013CF0(&v22, (uint64_t)v20);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v6 = sub_100042E58(0, (int64_t)v6[2] + 1, 1, v6);
      }
      unint64_t v10 = (unint64_t)v6[2];
      unint64_t v9 = (unint64_t)v6[3];
      if (v10 >= v9 >> 1) {
        uint64_t v6 = sub_100042E58((id *)(v9 > 1), v10 + 1, 1, v6);
      }
      ++v5;
      uint64_t v11 = sub_10001FB18((uint64_t)v20, v21);
      __chkstk_darwin(v11);
      unsigned int v13 = (uint64_t *)((char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v14 + 16))(v13);
      uint64_t v15 = *v13;
      unsigned int v19 = &off_10004D2D8;
      unsigned int v18 = &type metadata for HomeKitService;
      *(void *)&long long v17 = v15;
      void v6[2] = (id)(v10 + 1);
      sub_100013CF0(&v17, (uint64_t)&v6[5 * v10 + 4]);
      sub_100006030((uint64_t)v20);
      unint64_t v2 = v7;
    }
    while (v3 != v5);
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

unint64_t sub_100042308()
{
  unint64_t result = qword_100051DC8;
  if (!qword_100051DC8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100051DC8);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeKitAccessory()
{
  return &type metadata for HomeKitAccessory;
}

uint64_t sub_100042358(void *a1)
{
  id v1 = [a1 accessories];
  sub_1000425E0();
  unint64_t v2 = sub_100044E40();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
LABEL_15:
    uint64_t v6 = _swiftEmptyArrayStorage;
LABEL_16:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v6;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000450C0();
  uint64_t v3 = result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_3:
  if (v3 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = _swiftEmptyArrayStorage;
    unint64_t v16 = v2 & 0xC000000000000001;
    unint64_t v7 = v2;
    do
    {
      if (v16) {
        id v8 = (id)sub_100045020();
      }
      else {
        id v8 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v23 = &type metadata for HomeKitAccessory;
      uint64_t v24 = &off_10004D5F0;
      *(void *)&long long v22 = v8;
      sub_100013CF0(&v22, (uint64_t)v20);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v6 = sub_100042D14(0, (int64_t)v6[2] + 1, 1, v6);
      }
      unint64_t v10 = (unint64_t)v6[2];
      unint64_t v9 = (unint64_t)v6[3];
      if (v10 >= v9 >> 1) {
        uint64_t v6 = sub_100042D14((id *)(v9 > 1), v10 + 1, 1, v6);
      }
      ++v5;
      uint64_t v11 = sub_10001FB18((uint64_t)v20, v21);
      __chkstk_darwin(v11);
      unsigned int v13 = (uint64_t *)((char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v14 + 16))(v13);
      uint64_t v15 = *v13;
      unsigned int v19 = &off_10004D5F0;
      unsigned int v18 = &type metadata for HomeKitAccessory;
      *(void *)&long long v17 = v15;
      void v6[2] = (id)(v10 + 1);
      sub_100013CF0(&v17, (uint64_t)&v6[5 * v10 + 4]);
      sub_100006030((uint64_t)v20);
      unint64_t v2 = v7;
    }
    while (v3 != v5);
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

unint64_t sub_1000425E0()
{
  unint64_t result = qword_100051DD0;
  if (!qword_100051DD0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100051DD0);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeKitHome()
{
  return &type metadata for HomeKitHome;
}

uint64_t sub_100042630()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC50SiriUserFeedbackLearningUniversalSuggestionsPlugin14HomeKitManager_homeManager) homes];
  sub_100042AB0();
  unint64_t v2 = sub_100044E40();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
LABEL_15:
    uint64_t v6 = _swiftEmptyArrayStorage;
LABEL_16:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v6;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000450C0();
  uint64_t v3 = result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_3:
  if (v3 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = _swiftEmptyArrayStorage;
    unint64_t v7 = v2 & 0xC000000000000001;
    unint64_t v8 = v2;
    do
    {
      if (v7) {
        id v9 = (id)sub_100045020();
      }
      else {
        id v9 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v24 = &type metadata for HomeKitHome;
      unint64_t v25 = &off_10004D638;
      *(void *)&long long v23 = v9;
      sub_100013CF0(&v23, (uint64_t)v21);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v6 = sub_100042D28(0, (int64_t)v6[2] + 1, 1, v6, &qword_100051E98, (uint64_t *)&unk_100051EA0);
      }
      unint64_t v11 = (unint64_t)v6[2];
      unint64_t v10 = (unint64_t)v6[3];
      if (v11 >= v10 >> 1) {
        uint64_t v6 = sub_100042D28((id *)(v10 > 1), v11 + 1, 1, v6, &qword_100051E98, (uint64_t *)&unk_100051EA0);
      }
      ++v5;
      uint64_t v12 = sub_10001FB18((uint64_t)v21, v22);
      __chkstk_darwin(v12);
      uint64_t v14 = (uint64_t *)((char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v15 + 16))(v14);
      uint64_t v16 = *v14;
      unsigned int v20 = &off_10004D638;
      unsigned int v19 = &type metadata for HomeKitHome;
      *(void *)&long long v18 = v16;
      void v6[2] = (id)(v11 + 1);
      sub_100013CF0(&v18, (uint64_t)&v6[5 * v11 + 4]);
      sub_100006030((uint64_t)v21);
      unint64_t v2 = v8;
    }
    while (v3 != v5);
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

id sub_100042A0C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HomeKitManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for HomeKitManager()
{
  return self;
}

unint64_t sub_100042AB0()
{
  unint64_t result = qword_100051E90;
  if (!qword_100051E90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100051E90);
  }
  return result;
}

uint64_t sub_100042AF0()
{
  uint64_t v0 = sub_100044D60();
  sub_100013740(v0, qword_100051DE0);
  uint64_t v1 = sub_1000136A8(v0, (uint64_t)qword_100051DE0);
  if (qword_100050C68 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000136A8(v0, (uint64_t)qword_100052920);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_100042BB8(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100042BC8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

id *sub_100042C04(id *result, int64_t a2, char a3, id *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = (unint64_t)a4[3];
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
    uint64_t v8 = (uint64_t)a4[2];
    if (v7 <= v8) {
      id v9 = a4[2];
    }
    else {
      id v9 = (id)v7;
    }
    if (v9)
    {
      sub_100006080(&qword_1000515F8);
      unint64_t v10 = (id *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = (id)v8;
      v10[3] = (id)(2 * (v12 >> 4));
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
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
    sub_100043C14(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

id *sub_100042D14(id *a1, int64_t a2, char a3, id *a4)
{
  return sub_100042D28(a1, a2, a3, a4, &qword_100051EE0, &qword_100051EE8);
}

id *sub_100042D28(id *result, int64_t a2, char a3, id *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }
  unint64_t v9 = (unint64_t)a4[3];
  uint64_t v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v10 + 0x4000000000000000 >= 0)
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v10 = a2;
    }
LABEL_8:
    uint64_t v11 = (uint64_t)a4[2];
    if (v10 <= v11) {
      id v12 = a4[2];
    }
    else {
      id v12 = (id)v10;
    }
    if (v12)
    {
      sub_100006080(a5);
      uint64_t v13 = (id *)swift_allocObject();
      size_t v14 = j__malloc_size(v13);
      v13[2] = (id)v11;
      v13[3] = (id)(2 * ((uint64_t)(v14 - 32) / 40));
      uint64_t v15 = v13 + 4;
      if (v8)
      {
LABEL_13:
        if (v13 != a4 || v15 >= &a4[5 * v11 + 4]) {
          memmove(v15, a4 + 4, 40 * v11);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v13 = _swiftEmptyArrayStorage;
      uint64_t v15 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_100043F58(0, v11, (unint64_t)v15, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

id *sub_100042E58(id *a1, int64_t a2, char a3, id *a4)
{
  return sub_100042D28(a1, a2, a3, a4, &qword_100051ED0, &qword_100051ED8);
}

uint64_t sub_100042E6C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10004310C(a1, a2, a3, a4, &qword_100051EF0, type metadata accessor for RequestLinkedModelUpdateStep, type metadata accessor for RequestLinkedModelUpdateStep);
}

id *sub_100042EA0(id *result, int64_t a2, char a3, id *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = (unint64_t)a4[3];
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
    uint64_t v8 = (uint64_t)a4[2];
    if (v7 <= v8) {
      id v9 = a4[2];
    }
    else {
      id v9 = (id)v7;
    }
    if (v9)
    {
      sub_1000433C0();
      uint64_t v10 = (id *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      void v10[2] = (id)v8;
      v10[3] = (id)(2 * (v12 >> 3));
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_100043B28(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

id *sub_100042FB4(id *result, int64_t a2, char a3, id *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = (unint64_t)a4[3];
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
    uint64_t v8 = (uint64_t)a4[2];
    if (v7 <= v8) {
      id v9 = a4[2];
    }
    else {
      id v9 = (id)v7;
    }
    if (v9)
    {
      sub_100006080(&qword_100051F00);
      uint64_t v10 = (id *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = (id)v8;
      v10[3] = (id)(2 * (v12 >> 4));
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
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
    sub_100043D08(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

id *sub_1000430C4(id *a1, int64_t a2, char a3, id *a4)
{
  return sub_100042D28(a1, a2, a3, a4, &qword_100051F08, &qword_100051F10);
}

uint64_t sub_1000430D8(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10004310C(a1, a2, a3, a4, &qword_100051EF8, (uint64_t (*)(void))&type metadata accessor for UUID, (uint64_t (*)(void))&type metadata accessor for UUID);
}

uint64_t sub_10004310C(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    long long v18 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100006080(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  long long v18 = (id *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_1000450B0();
    __break(1u);
    return result;
  }
  v18[2] = (id)v13;
  v18[3] = (id)(2 * ((uint64_t)(v19 - v17) / v16));
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (id *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100043DFC(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_10004338C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10004310C(a1, a2, a3, a4, (uint64_t *)&unk_100051EC0, (uint64_t (*)(void))type metadata accessor for UniversalEntityRemover.CandidateStoreIdAssistantIdPair, (uint64_t (*)(void))type metadata accessor for UniversalEntityRemover.CandidateStoreIdAssistantIdPair);
}

uint64_t sub_1000433C0()
{
  uint64_t v0 = sub_100006080(&qword_100051F18);
  if (swift_isClassType()) {
    uint64_t v1 = v0;
  }
  else {
    uint64_t v1 = 0;
  }
  if (v1) {
    uint64_t v2 = (uint64_t *)&unk_100051F28;
  }
  else {
    uint64_t v2 = (uint64_t *)&unk_100051F20;
  }
  return sub_100006080(v2);
}

uint64_t sub_100043420(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100043448(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_1000434C0(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_100044FA0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1000434C0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100043594(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10004440C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10004440C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006030((uint64_t)v12);
  return v7;
}

uint64_t sub_100043594(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100044FB0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100043750(a5, a6);
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
  uint64_t v8 = sub_100045030();
  if (!v8)
  {
    sub_1000450B0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000450D0();
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

uint64_t sub_100043750(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000437E8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000439C8(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000439C8(v3 > 1, v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

id *sub_1000437E8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100043960(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100045010();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000450B0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100044E20();
      if (!v2) {
        return _swiftEmptyArrayStorage;
      }
    }
    sub_1000450D0();
    __break(1u);
LABEL_14:
    uint64_t result = (id *)sub_1000450B0();
    __break(1u);
  }
  else
  {
    return _swiftEmptyArrayStorage;
  }
  return result;
}

id *sub_100043960(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  sub_100006080(&qword_100051EB8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return (id *)v4;
}

uint64_t sub_1000439C8(char a1, int64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100006080(&qword_100051EB8);
    uint64_t v10 = (id *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    void v10[2] = (id)v8;
    v10[3] = (id)(2 * v11 - 64);
  }
  else
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
  uint64_t v12 = (char *)(v10 + 4);
  uint64_t v13 = (char *)(a4 + 32);
  if (a1)
  {
    if (v10 != (id *)a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *(void *)(a4 + 16) = 0;
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
  uint64_t result = sub_1000450D0();
  __break(1u);
  return result;
}

unsigned char **sub_100043B18(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

char *sub_100043B28(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    size_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    int64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_1000450D0();
  __break(1u);
  return result;
}

uint64_t sub_100043C14(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1000450D0();
  __break(1u);
  return result;
}

uint64_t sub_100043D08(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1000450D0();
  __break(1u);
  return result;
}

uint64_t sub_100043DFC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_1000450D0();
  __break(1u);
  return result;
}

uint64_t sub_100043F58(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = a4 + 40 * a1 + 32;
    unint64_t v7 = a3 + 40 * v5;
    if (v6 >= v7 || v6 + 40 * v5 <= a3)
    {
      sub_100006080(a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  uint64_t result = sub_1000450D0();
  __break(1u);
  return result;
}

uint64_t sub_100044064()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100006080((uint64_t *)&unk_100050D28);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006080(&qword_100051EB0);
  __chkstk_darwin(v6 - 8);
  int64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100050CD0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_100044D60();
  sub_1000136A8(v9, (uint64_t)qword_100051DE0);
  uint64_t v10 = sub_100044D40();
  os_log_type_t v11 = sub_100044F30();
  if (os_log_type_enabled(v10, v11))
  {
    unint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v19 = v2;
    v21[0] = v13;
    *(_DWORD *)unint64_t v12 = 136315138;
    uint64_t v20 = sub_1000434C0(0xD00000000000001DLL, 0x80000001000473A0, v21);
    sub_100044FA0();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "HomeKitManager.%s", v12, 0xCu);
    swift_arrayDestroy();
    uint64_t v2 = v19;
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v15 = result
        + OBJC_IVAR____TtC50SiriUserFeedbackLearningUniversalSuggestionsPlugin9HomeStore_homeManagerDidUpdateHomesContinuation;
    swift_beginAccess();
    sub_1000443A4(v15, (uint64_t)v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2))
    {
      id v16 = v1;
      sub_100006194((uint64_t)v8);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
      id v17 = v1;
      sub_100006194((uint64_t)v8);
      sub_100044E80();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1000443A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006080(&qword_100051EB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10004440C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100044468(uint64_t a1)
{
  return a1;
}

uint64_t sub_100044490()
{
  return DateInterval.end.getter();
}

uint64_t sub_1000444A0()
{
  return DateInterval.init(start:end:)();
}

uint64_t sub_1000444B0()
{
  return DateInterval.start.getter();
}

uint64_t sub_1000444C0()
{
  return type metadata accessor for DateInterval();
}

uint64_t sub_1000444D0()
{
  return Date.addingTimeInterval(_:)();
}

uint64_t sub_1000444E0()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_1000444F0()
{
  return static Date.now.getter();
}

uint64_t sub_100044500()
{
  return Date.advanced(by:)();
}

uint64_t sub_100044510()
{
  return type metadata accessor for Date();
}

uint64_t sub_100044520()
{
  return UUID.uuidString.getter();
}

uint64_t sub_100044530()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_100044540()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100044550()
{
  return type metadata accessor for UsoEntity_common_UserEntity();
}

uint64_t sub_100044560()
{
  return dispatch thunk of UsoEntityBuilder_common_UserEntity.addAssociatedUserEntities(value:)();
}

uint64_t sub_100044570()
{
  return UsoEntityBuilder_common_UserEntity.init()();
}

uint64_t sub_100044580()
{
  return type metadata accessor for UsoEntityBuilder_common_UserEntity();
}

uint64_t sub_100044590()
{
  return dispatch thunk of UsoBuilder.addUsoIdentifier(usoIdentifier:)();
}

uint64_t sub_1000445A0()
{
  return CodeGenBase.entity.getter();
}

uint64_t sub_1000445B0()
{
  return UsoIdentifier.init(value:appBundleId:namespace:)();
}

uint64_t sub_1000445C0()
{
  return UsoIdentifier.value.getter();
}

uint64_t sub_1000445D0()
{
  return UsoIdentifier.namespace.getter();
}

uint64_t sub_1000445E0()
{
  return type metadata accessor for UsoIdentifier();
}

uint64_t sub_1000445F0()
{
  return dispatch thunk of UsoEntityBuilder.addAsHelper<A>(attributeName:value:)();
}

uint64_t sub_100044600()
{
  return static UsoBuilderConversionUtils.convertEntityBuilderToEntity(entityBuilder:)();
}

uint64_t sub_100044610()
{
  return UsoPrimitiveStringBuilder.init(value:)();
}

uint64_t sub_100044620()
{
  return type metadata accessor for UsoPrimitiveStringBuilder();
}

uint64_t sub_100044630()
{
  return static UsoEntity_CodeGenConverter.convertAs<A>(entity:asType:)();
}

uint64_t sub_100044640()
{
  return dispatch thunk of UsoValue.getUsoIdentifiers()();
}

uint64_t sub_100044650()
{
  return UsoEntity.attributes.getter();
}

uint64_t sub_100044660()
{
  return type metadata accessor for SiriCorrectionsUndoResponse();
}

uint64_t sub_100044670()
{
  return dispatch thunk of SiriCorrectionsFeatureExtractor.extract(from:)();
}

uint64_t sub_100044680()
{
  return SiriCorrectionsFeatureExtractor.init()();
}

uint64_t sub_100044690()
{
  return type metadata accessor for SiriCorrectionsFeatureExtractor();
}

uint64_t sub_1000446A0()
{
  return type metadata accessor for SiriUserFeedbackLearningTaskResult.Status();
}

uint64_t sub_1000446B0()
{
  return SiriUserFeedbackLearningTaskResult.init(status:)();
}

uint64_t sub_1000446C0()
{
  return SiriUserFeedbackLearningTaskResult.status.getter();
}

uint64_t sub_1000446D0()
{
  return static SiriUserFeedbackLearningPlatformFeatures.UniversalSuggestionsOfflineLearning.getter();
}

uint64_t sub_1000446E0()
{
  return SiriUserFeedbackLearningPlatformFeatures.SiriUserFeedbackLearningPlatformFeatureManager.init()();
}

uint64_t sub_1000446F0()
{
  return type metadata accessor for SiriUserFeedbackLearningPlatformFeatures.SiriUserFeedbackLearningPlatformFeatureManager();
}

uint64_t sub_100044700()
{
  return type metadata accessor for SiriUserFeedbackLearningTask();
}

uint64_t sub_100044710()
{
  return type metadata accessor for AnyFeature();
}

uint64_t sub_100044720()
{
  return type metadata accessor for HasNLXEvents();
}

uint64_t sub_100044730()
{
  return type metadata accessor for SELFRequestID();
}

uint64_t sub_100044740()
{
  return type metadata accessor for AppInteraction();
}

uint64_t sub_100044750()
{
  return StreamBookmark.__allocating_init(name:date:)();
}

uint64_t sub_100044760()
{
  return type metadata accessor for StreamBookmark();
}

uint64_t sub_100044770()
{
  return static EntityExtractor.extract(from:)();
}

uint64_t sub_100044780()
{
  return type metadata accessor for EntityExtractor();
}

uint64_t sub_100044790()
{
  return dispatch thunk of FeatureManaging.refresh()();
}

uint64_t sub_1000447A0()
{
  return dispatch thunk of FeatureManaging.isActive(_:)();
}

uint64_t sub_1000447B0()
{
  return PLLoggingReader.asyncSignalReader.getter();
}

uint64_t sub_1000447C0()
{
  return PLLoggingReader.interactionReader.getter();
}

uint64_t sub_1000447D0()
{
  return static PLLoggingReader.shared.getter();
}

uint64_t sub_1000447E0()
{
  return type metadata accessor for PLLoggingReader();
}

uint64_t sub_1000447F0()
{
  return PromptEventType.Ending.rawValue.getter();
}

uint64_t sub_100044800()
{
  return type metadata accessor for PromptEventType.Ending();
}

uint64_t sub_100044810()
{
  return PromptEventType.Beginning.rawValue.getter();
}

uint64_t sub_100044820()
{
  return type metadata accessor for PromptEventType.Beginning();
}

uint64_t sub_100044830()
{
  return static UniversalEntity.== infix(_:_:)();
}

uint64_t sub_100044840()
{
  return UniversalEntity.getName()().value._countAndFlagsBits;
}

uint64_t sub_100044850()
{
  return type metadata accessor for UniversalEntity();
}

uint64_t sub_100044860()
{
  return AnyAsyncSequence.init<A>(_:)();
}

uint64_t sub_100044870()
{
  return dispatch thunk of InteractionReader.appInteractions(since:intentTypes:until:)();
}

uint64_t sub_100044880()
{
  return TypedNamedFeature.value.getter();
}

uint64_t sub_100044890()
{
  return UniversalCandidate.candidateEntity.getter();
}

uint64_t sub_1000448A0()
{
  return UniversalCandidate.id.getter();
}

uint64_t sub_1000448B0()
{
  return type metadata accessor for UniversalCandidate();
}

uint64_t sub_1000448C0()
{
  return dispatch thunk of StreamBookmarkStore.read(name:)();
}

uint64_t sub_1000448D0()
{
  return dispatch thunk of StreamBookmarkStore.write(bookmark:)();
}

uint64_t sub_1000448E0()
{
  return UniversalSuggestion.candidates.getter();
}

uint64_t sub_1000448F0()
{
  return type metadata accessor for UniversalSuggestion();
}

double sub_100044900(Swift::Double timestamp)
{
  return floorToMostRecentDay(timestamp:)(timestamp);
}

uint64_t sub_100044910()
{
  return type metadata accessor for DismissalReasonFeature();
}

uint64_t sub_100044920()
{
  return WindowedNAsyncSequence.makeAsyncIterator()();
}

uint64_t sub_100044930()
{
  return makePLUSEventLogTarget()();
}

uint64_t sub_100044940()
{
  return type metadata accessor for ControlHomeIntentFeature.ControlHomeIntentInteractionTimestamp();
}

uint64_t sub_100044950()
{
  return static DismissalFeatureExtractor.allUserDismissalEvents.getter();
}

uint64_t sub_100044960()
{
  return dispatch thunk of DismissalFeatureExtractor.extract(from:)();
}

uint64_t sub_100044970()
{
  return DismissalFeatureExtractor.init()();
}

uint64_t sub_100044980()
{
  return type metadata accessor for DismissalFeatureExtractor();
}

uint64_t sub_100044990()
{
  return dispatch thunk of RequestIdFeatureExtractor.extract(from:)();
}

uint64_t sub_1000449A0()
{
  return RequestIdFeatureExtractor.init()();
}

uint64_t sub_1000449B0()
{
  return type metadata accessor for RequestIdFeatureExtractor();
}

uint64_t sub_1000449C0()
{
  return dispatch thunk of UniversalSuggestionsStore.readAllSuggestions()();
}

uint64_t sub_1000449D0()
{
  return dispatch thunk of UniversalSuggestionsStore.findCandidate(id:)();
}

uint64_t sub_1000449E0()
{
  return dispatch thunk of UniversalSuggestionsStore.deleteCandidate(id:)();
}

uint64_t sub_1000449F0()
{
  return dispatch thunk of UniversalSuggestionsStore.donateSuggestionCandidate(initialEntity:correctedEntity:)();
}

uint64_t sub_100044A00()
{
  return dispatch thunk of UniversalSuggestionsStore.updateSuggestionFromFeedback(candidate:action:)();
}

uint64_t sub_100044A10()
{
  return UniversalSuggestionSummary.candidateId.getter();
}

uint64_t sub_100044A20()
{
  return UniversalSuggestionSummary.suggestionSurfacedState.getter();
}

uint64_t sub_100044A30()
{
  return type metadata accessor for UniversalSuggestionSummary();
}

uint64_t sub_100044A40()
{
  return static FlatFileStreamBookmarkStore.shared.getter();
}

uint64_t sub_100044A50()
{
  return type metadata accessor for FlatFileStreamBookmarkStore();
}

uint64_t sub_100044A60()
{
  return static PLUSSuggestionSurfacedState.== infix(_:_:)();
}

uint64_t sub_100044A70()
{
  return type metadata accessor for PLUSSuggestionSurfacedState();
}

uint64_t sub_100044A80()
{
  return UniversalSuggestionSurfaced.init(suggestionId:timestamp:)();
}

uint64_t sub_100044A90()
{
  return static UniversalSuggestionSurfaced.== infix(_:_:)();
}

uint64_t sub_100044AA0()
{
  return type metadata accessor for UniversalSuggestionSurfaced();
}

uint64_t sub_100044AB0()
{
  return dispatch thunk of AsyncBookmarkingSignalReader.turnsBookmarked(startBookmark:)();
}

uint64_t sub_100044AC0()
{
  return type metadata accessor for UniversalSuggestionCandidate();
}

uint64_t sub_100044AD0()
{
  return type metadata accessor for UniversalSuggestionSummaries();
}

uint64_t sub_100044AE0()
{
  return dispatch thunk of AppInteractionFeatureExtractor.intentTypes.getter();
}

uint64_t sub_100044AF0()
{
  return dispatch thunk of AppInteractionFeatureExtractor.extract(from:)();
}

uint64_t sub_100044B00()
{
  return dispatch thunk of FlowClientEventFeatureExtractor.extract(from:)();
}

uint64_t sub_100044B10()
{
  return FlowClientEventFeatureExtractor.init()();
}

uint64_t sub_100044B20()
{
  return type metadata accessor for FlowClientEventFeatureExtractor();
}

uint64_t sub_100044B30()
{
  return type metadata accessor for ControlHomeIntentResponseFeatures.ControlHomeIntentEntityResponses();
}

uint64_t sub_100044B40()
{
  return type metadata accessor for UniversalSuggestionFeedbackAction();
}

uint64_t sub_100044B50()
{
  return type metadata accessor for UniversalSuggestionsStoreCoreData();
}

uint64_t sub_100044B60()
{
  return INControlHomeIntentFeatureExtractor.init()();
}

uint64_t sub_100044B70()
{
  return type metadata accessor for INControlHomeIntentFeatureExtractor();
}

uint64_t sub_100044B80()
{
  return UniversalSuggestionSummaryExtractor.init(suggestionStore:)();
}

uint64_t sub_100044B90()
{
  return UniversalSuggestionSummaryExtractor.extract(from:)();
}

uint64_t sub_100044BA0()
{
  return type metadata accessor for UniversalSuggestionSummaryExtractor();
}

uint64_t sub_100044BB0()
{
  return dispatch thunk of PLUSUniversalSuggestionsInferenceLogger.logSuggestionGenerated(originalRequestId:suggestion:changeDataCaptureType:)();
}

uint64_t sub_100044BC0()
{
  return dispatch thunk of PLUSUniversalSuggestionsInferenceLogger.logSuggestionOutcomeReported(originalRequestId:suggestionId:suggestionOutcome:)();
}

uint64_t sub_100044BD0()
{
  return PLUSUniversalSuggestionsInferenceLogger.init(logTarget:)();
}

uint64_t sub_100044BE0()
{
  return type metadata accessor for PLUSUniversalSuggestionsInferenceLogger();
}

uint64_t sub_100044BF0()
{
  return UniversalSuggestionsCoreDataStorePolicies.runPolicy(store:)();
}

uint64_t sub_100044C00()
{
  return UniversalSuggestionsCoreDataStorePolicies.init()();
}

uint64_t sub_100044C10()
{
  return type metadata accessor for UniversalSuggestionsCoreDataStorePolicies();
}

uint64_t sub_100044C20()
{
  return type metadata accessor for UniversalSuggestionCandidateDonationResult();
}

uint64_t sub_100044C30()
{
  return UniversalSuggestionsStoreCoreDataWithMigrations.__allocating_init()();
}

uint64_t sub_100044C40()
{
  return type metadata accessor for UniversalSuggestionsStoreCoreDataWithMigrations();
}

uint64_t sub_100044C50()
{
  return Turn.date.getter();
}

uint64_t sub_100044C60()
{
  return Turn.events.getter();
}

uint64_t sub_100044C70()
{
  return Turn.turnID.getter();
}

uint64_t sub_100044C80()
{
  return type metadata accessor for Turn();
}

uint64_t sub_100044C90()
{
  return OSSignpostID.init(log:)();
}

uint64_t sub_100044CA0()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t sub_100044CB0()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_100044CC0()
{
  return OSSignposter.init(logger:)();
}

uint64_t sub_100044CD0()
{
  return OSSignposter.logHandle.getter();
}

uint64_t sub_100044CE0()
{
  return type metadata accessor for OSSignposter();
}

uint64_t sub_100044CF0()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t sub_100044D00()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t sub_100044D10()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t sub_100044D20()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t sub_100044D30()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t sub_100044D40()
{
  return Logger.logObject.getter();
}

uint64_t sub_100044D50()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100044D60()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100044D70()
{
  return CancellationError.init()();
}

uint64_t sub_100044D80()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100044D90()
{
  return Dictionary.description.getter();
}

uint64_t sub_100044DA0()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_100044DB0()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_100044DC0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_100044DD0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100044DE0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100044DF0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100044E00()
{
  return String.hash(into:)();
}

void sub_100044E10(Swift::String a1)
{
}

Swift::Int sub_100044E20()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100044E30()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100044E40()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100044E50()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100044E60()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100044E70()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100044E80()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_100044E90()
{
  return type metadata accessor for CancellationError();
}

uint64_t sub_100044EC0()
{
  return static Task<>.isCancelled.getter();
}

uint64_t sub_100044ED0()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

uint64_t sub_100044EE0()
{
  return AsyncSequence.window2()();
}

uint64_t sub_100044EF0()
{
  return AsyncSequence.windowN(length:)();
}

uint64_t sub_100044F00()
{
  return Double.description.getter();
}

uint64_t sub_100044F10()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_100044F20()
{
  return SISchemaUUID.toNSUUIDSafely()();
}

uint64_t sub_100044F30()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100044F40()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100044F50()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_100044F60()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_100044F70()
{
  return static os_signpost_type_t.event.getter();
}

uint64_t sub_100044F80()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_100044F90()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100044FA0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100044FB0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100044FC0()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_100044FD0()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100044FE0()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100044FF0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_100045000(Swift::Int a1)
{
}

uint64_t sub_100045010()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100045020()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100045030()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100045040()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100045050()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100045060()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100045070()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100045080()
{
  return dispatch thunk of _AnySequenceBox._makeIterator()();
}

uint64_t sub_100045090()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_1000450A0()
{
  return AsyncMapSequence.init(_:transform:)();
}

uint64_t sub_1000450B0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000450C0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000450D0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000450E0()
{
  return dispatch thunk of _AnyIteratorBoxBase.next()();
}

uint64_t sub_1000450F0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100045110()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100045120()
{
  return AsyncThrowingCompactMapSequence.init(_:transform:)();
}

uint64_t sub_100045130()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100045140()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100045150()
{
  return Hasher.init(_seed:)();
}

void sub_100045160(Swift::UInt a1)
{
}

void sub_100045170(Swift::UInt32 a1)
{
}

Swift::Int sub_100045180()
{
  return Hasher._finalize()();
}

uint64_t INHomeDeviceTypeGetName()
{
  return _INHomeDeviceTypeGetName();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

{
}

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
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isClassType()
{
  return _swift_isClassType();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}