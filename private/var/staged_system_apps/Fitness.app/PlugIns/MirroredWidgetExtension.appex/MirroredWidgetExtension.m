ValueMetadata *type metadata accessor for MirroredWidgetLiveActivity()
{
  return &type metadata for MirroredWidgetLiveActivity;
}

uint64_t sub_100004430()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000444C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10000460C(&qword_1000180F8);
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a2, a1, v4);
}

uint64_t sub_1000044C4()
{
  return sub_1000109B0();
}

uint64_t sub_1000045C4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000460C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100004654()
{
  unint64_t result = qword_100018100;
  if (!qword_100018100)
  {
    sub_1000046B0(&qword_100018108);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018100);
  }
  return result;
}

uint64_t sub_1000046B0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

__n128 initializeWithTake for WidgetButtonStyle(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100004708(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100004728(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize()
{
  if (!qword_100018110)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100018110);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for WorkoutTypeGlyph(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for WorkoutTypeGlyph(uint64_t a1)
{
}

uint64_t initializeWithCopy for WorkoutTypeGlyph(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  id v4 = v3;
  return a1;
}

void *assignWithCopy for WorkoutTypeGlyph(void *a1, void *a2)
{
  *a1 = *a2;
  id v4 = (void *)a2[1];
  v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

__n128 initializeWithTake for WorkoutTypeGlyph(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for WorkoutTypeGlyph(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  id v4 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutTypeGlyph(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WorkoutTypeGlyph(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkoutTypeGlyph()
{
  return &type metadata for WorkoutTypeGlyph;
}

uint64_t sub_100004964()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004980@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v48 = a2;
  uint64_t v3 = sub_100010930();
  uint64_t v4 = *(void *)(v3 - 8);
  ((void (*)(void))__chkstk_darwin)();
  id v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000460C(&qword_100018120);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v47 = (uint64_t)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  v45 = (char *)&v44 - v10;
  __chkstk_darwin(v9);
  uint64_t v46 = (uint64_t)&v44 - v11;
  uint64_t v12 = sub_10000460C(&qword_100018128);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v44 = (uint64_t)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  v17 = (char *)&v44 - v16;
  __chkstk_darwin(v15);
  v19 = (char *)&v44 - v18;
  if (!(id)FIUICircularWorkoutGradientImageWithGoal())
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v60 = sub_100010910();
  id v20 = [a1 localizedName];
  uint64_t v21 = sub_100010A40();
  unint64_t v23 = v22;

  unint64_t v49 = v21;
  unint64_t v50 = v23;
  sub_10000504C();
  sub_100010880();
  swift_release();
  swift_bridgeObjectRelease();
  sub_100005308((uint64_t)v17, (uint64_t)v19, &qword_100018128);
  id v24 = (id)FIUIStaticScalableWorkoutIconImage();
  if (v24)
  {
    v25 = v24;
    id v26 = [v24 imageWithRenderingMode:2];

    sub_100010910();
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for Image.ResizingMode.stretch(_:), v3);
    uint64_t v27 = sub_100010950();
    swift_release();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    id v28 = [self metricColorsForGoalTypeIdentifier:0];
    id v29 = [v28 nonGradientTextColor];

    if (v29)
    {
      uint64_t v30 = sub_100010900();
      uint64_t KeyPath = swift_getKeyPath();
      sub_100010970();
      sub_1000105F0();
      unint64_t v49 = v27;
      unint64_t v50 = 0;
      __int16 v51 = 1;
      uint64_t v52 = KeyPath;
      uint64_t v53 = v30;
      uint64_t v54 = v60;
      char v55 = v61;
      uint64_t v56 = v62;
      char v57 = v63;
      long long v58 = v64;
      char v59 = 1;
      sub_10000460C(&qword_100018138);
      sub_1000050A8();
      uint64_t v32 = (uint64_t)v45;
      sub_100010890();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v33 = v46;
      sub_100005308(v32, v46, &qword_100018120);
      uint64_t v34 = v44;
      sub_10000536C((uint64_t)v19, v44, &qword_100018128);
      uint64_t v35 = v47;
      sub_10000536C(v33, v47, &qword_100018120);
      uint64_t v36 = v48;
      sub_10000536C(v34, v48, &qword_100018128);
      uint64_t v37 = sub_10000460C(&qword_100018190);
      sub_10000536C(v35, v36 + *(int *)(v37 + 48), &qword_100018120);
      sub_1000053D0(v33, &qword_100018120);
      sub_1000053D0((uint64_t)v19, &qword_100018128);
      sub_1000053D0(v35, &qword_100018120);
      return sub_1000053D0(v34, &qword_100018128);
    }
    goto LABEL_6;
  }
LABEL_7:
  unint64_t v49 = 0;
  unint64_t v50 = 0xE000000000000000;
  sub_100010B00(41);
  swift_bridgeObjectRelease();
  unint64_t v49 = 0xD000000000000027;
  unint64_t v50 = 0x8000000100013650;
  id v39 = a1;
  id v40 = [v39 description];
  uint64_t v41 = sub_100010A40();
  v43 = v42;

  v65._countAndFlagsBits = v41;
  v65._object = v43;
  sub_100010A70(v65);

  swift_bridgeObjectRelease();
  uint64_t result = sub_100010B40();
  __break(1u);
  return result;
}

uint64_t sub_100004FBC()
{
  return sub_100010850();
}

uint64_t sub_100004FD8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void **)(v1 + 8);
  *a1 = sub_100010970();
  a1[1] = v4;
  uint64_t v5 = sub_10000460C(&qword_100018118);
  return sub_100004980(v3, (uint64_t)a1 + *(int *)(v5 + 44));
}

unint64_t sub_10000504C()
{
  unint64_t result = qword_100018130;
  if (!qword_100018130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018130);
  }
  return result;
}

unint64_t sub_1000050A8()
{
  unint64_t result = qword_100018140;
  if (!qword_100018140)
  {
    sub_1000046B0(&qword_100018138);
    sub_100005124();
    sub_1000052B4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018140);
  }
  return result;
}

unint64_t sub_100005124()
{
  unint64_t result = qword_100018148;
  if (!qword_100018148)
  {
    sub_1000046B0(&qword_100018150);
    sub_1000051A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018148);
  }
  return result;
}

unint64_t sub_1000051A0()
{
  unint64_t result = qword_100018158;
  if (!qword_100018158)
  {
    sub_1000046B0(&qword_100018160);
    sub_100005240();
    sub_100005468(&qword_100018178, &qword_100018180);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018158);
  }
  return result;
}

unint64_t sub_100005240()
{
  unint64_t result = qword_100018168;
  if (!qword_100018168)
  {
    sub_1000046B0(&qword_100018170);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018168);
  }
  return result;
}

unint64_t sub_1000052B4()
{
  unint64_t result = qword_100018188;
  if (!qword_100018188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018188);
  }
  return result;
}

uint64_t sub_100005308(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000460C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000536C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000460C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000053D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000460C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000542C()
{
  return sub_100005468(&qword_100018198, &qword_1000181A0);
}

uint64_t sub_100005468(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000046B0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000054B0()
{
  unint64_t result = qword_1000181A8;
  if (!qword_1000181A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181A8);
  }
  return result;
}

unint64_t sub_100005508()
{
  unint64_t result = qword_1000181B0;
  if (!qword_1000181B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181B0);
  }
  return result;
}

unint64_t sub_100005560()
{
  unint64_t result = qword_1000181B8;
  if (!qword_1000181B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181B8);
  }
  return result;
}

unint64_t sub_1000055B8()
{
  unint64_t result = qword_1000181C0;
  if (!qword_1000181C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181C0);
  }
  return result;
}

uint64_t sub_10000560C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005628(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000061B4(a1, a2, a3, (void (*)(void))sub_100005508);
}

uint64_t sub_100005640@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v3 = sub_100010560();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v20 - v8;
  uint64_t v10 = sub_1000105D0();
  uint64_t v23 = *(void *)(v10 - 8);
  uint64_t v24 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000105B0();
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v13(v9, a1, v3);
  uint64_t v14 = sub_1000105C0();
  os_log_type_t v15 = sub_100010AC0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v27 = v22;
    uint64_t v21 = v16;
    *(_DWORD *)uint64_t v16 = 136315138;
    id v20 = v16 + 4;
    v13(v7, (uint64_t)v9, v3);
    uint64_t v17 = sub_100010A60();
    uint64_t v26 = sub_100006634(v17, v18, &v27);
    sub_100010AE0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "We should never have been requested to run command %s, it should have routed to the app.", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }

  (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v24);
  return sub_100010490();
}

uint64_t sub_100005934(uint64_t a1)
{
  return sub_10000622C(a1, qword_100018788);
}

uint64_t sub_100005958@<X0>(uint64_t a1@<X8>)
{
  return sub_1000062B0(&qword_1000180D0, (uint64_t)qword_100018788, a1);
}

uint64_t sub_100005984()
{
  return 0;
}

uint64_t sub_100005994(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_100010560();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return _swift_task_switch(sub_100005A54, 0, 0);
}

uint64_t sub_100005A54()
{
  sub_100010AB0();
  *(void *)(v0 + 48) = sub_100010AA0();
  uint64_t v2 = sub_100010A90();
  return _swift_task_switch(sub_100005AE8, v2, v1);
}

uint64_t sub_100005AE8()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[2];
  swift_release();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for DataLinkCommand.resume(_:), v2);
  sub_100005640(v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_100005BB0(uint64_t a1)
{
  unint64_t v2 = sub_100005508();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100005BF0()
{
  unint64_t result = qword_1000181D0;
  if (!qword_1000181D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181D0);
  }
  return result;
}

unint64_t sub_100005C48()
{
  unint64_t result = qword_1000181D8;
  if (!qword_1000181D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181D8);
  }
  return result;
}

unint64_t sub_100005CA0()
{
  unint64_t result = qword_1000181E0;
  if (!qword_1000181E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181E0);
  }
  return result;
}

unint64_t sub_100005CF8()
{
  unint64_t result = qword_1000181E8;
  if (!qword_1000181E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181E8);
  }
  return result;
}

uint64_t sub_100005D4C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005D68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000061B4(a1, a2, a3, (void (*)(void))sub_100005C48);
}

uint64_t sub_100005D80(uint64_t a1)
{
  return sub_10000622C(a1, qword_1000187A0);
}

uint64_t sub_100005DA4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000062B0(&qword_1000180D8, (uint64_t)qword_1000187A0, a1);
}

uint64_t sub_100005DC8(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_100010560();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return _swift_task_switch(sub_100005E88, 0, 0);
}

uint64_t sub_100005E88()
{
  sub_100010AB0();
  *(void *)(v0 + 48) = sub_100010AA0();
  uint64_t v2 = sub_100010A90();
  return _swift_task_switch(sub_100005F1C, v2, v1);
}

uint64_t sub_100005F1C()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[2];
  swift_release();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for DataLinkCommand.pause(_:), v2);
  sub_100005640(v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_100005FE4(uint64_t a1)
{
  unint64_t v2 = sub_100005C48();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100006024()
{
  unint64_t result = qword_1000181F8;
  if (!qword_1000181F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181F8);
  }
  return result;
}

unint64_t sub_10000607C()
{
  unint64_t result = qword_100018200;
  if (!qword_100018200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018200);
  }
  return result;
}

unint64_t sub_1000060D4()
{
  unint64_t result = qword_100018208;
  if (!qword_100018208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018208);
  }
  return result;
}

unint64_t sub_10000612C()
{
  unint64_t result = qword_100018210;
  if (!qword_100018210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018210);
  }
  return result;
}

uint64_t sub_100006180()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000619C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000061B4(a1, a2, a3, (void (*)(void))sub_10000607C);
}

uint64_t sub_1000061B4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006208(uint64_t a1)
{
  return sub_10000622C(a1, qword_1000187B8);
}

uint64_t sub_10000622C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000104C0();
  sub_100006D74(v3, a2);
  sub_100006D3C(v3, (uint64_t)a2);
  return sub_1000104B0();
}

uint64_t sub_10000628C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000062B0(&qword_1000180E0, (uint64_t)qword_1000187B8, a1);
}

uint64_t sub_1000062B0@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1000104C0();
  uint64_t v6 = sub_100006D3C(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t sub_10000634C(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_100010560();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return _swift_task_switch(sub_10000640C, 0, 0);
}

uint64_t sub_10000640C()
{
  sub_100010AB0();
  *(void *)(v0 + 48) = sub_100010AA0();
  uint64_t v2 = sub_100010A90();
  return _swift_task_switch(sub_1000064A0, v2, v1);
}

uint64_t sub_1000064A0()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[2];
  swift_release();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for DataLinkCommand.markSegment(_:), v2);
  sub_100005640(v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_100006568(uint64_t a1)
{
  unint64_t v2 = sub_10000607C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for MarkMirroredSegment()
{
  return &type metadata for MarkMirroredSegment;
}

ValueMetadata *type metadata accessor for PauseMirroredWorkout()
{
  return &type metadata for PauseMirroredWorkout;
}

ValueMetadata *type metadata accessor for ResumeMirroredWorkout()
{
  return &type metadata for ResumeMirroredWorkout;
}

unint64_t sub_1000065D8()
{
  unint64_t result = qword_100018220;
  if (!qword_100018220)
  {
    sub_1000046B0(&qword_100018228);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018220);
  }
  return result;
}

uint64_t sub_100006634(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100006708(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006CDC((uint64_t)v12, *a3);
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
      sub_100006CDC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006C8C((uint64_t)v12);
  return v7;
}

uint64_t sub_100006708(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100010AF0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000068C4(a5, a6);
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
  uint64_t v8 = sub_100010B20();
  if (!v8)
  {
    sub_100010B30();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100010B50();
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

uint64_t sub_1000068C4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000695C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006B3C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006B3C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000695C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100006AD4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100010B10();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100010B30();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100010A80();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100010B50();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100010B30();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100006AD4(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10000460C(&qword_100018230);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100006B3C(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000460C(&qword_100018230);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
  uint64_t result = sub_100010B50();
  __break(1u);
  return result;
}

uint64_t sub_100006C8C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006CDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006D3C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100006D74(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006DD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10000460C(&qword_100018238);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  size_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  int64_t v7 = (char *)&v17 - v6;
  uint64_t v8 = sub_100010510();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v17 - v13;
  sub_100010500();
  sub_100010540();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_100007660((uint64_t)v7);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a1, v14, v8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v7, v8);
    sub_100010520();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5, 1, 1, v8);
    sub_1000104D0();
    swift_bridgeObjectRelease();
    sub_100007660((uint64_t)v5);
    uint64_t v16 = *(void (**)(char *, uint64_t))(v9 + 8);
    v16(v12, v8);
    return ((uint64_t (*)(char *, uint64_t))v16)(v14, v8);
  }
}

uint64_t sub_100007018@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v56 = a1;
  unint64_t v50 = a2;
  uint64_t v2 = sub_10000460C(&qword_100018238);
  __chkstk_darwin(v2 - 8);
  uint64_t v54 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100010590();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v53 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v46 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v46 - v11;
  uint64_t v13 = sub_100010510();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  unint64_t v49 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  unint64_t v18 = (char *)&v46 - v17;
  uint64_t v19 = sub_10000460C(&qword_1000180F8);
  sub_100010990();
  sub_100010570();
  id v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v21 = v12;
  uint64_t v22 = v50;
  v20(v21, v4);
  sub_100006DD8((uint64_t)v18);
  swift_release();
  uint64_t v51 = v14;
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  char v55 = v18;
  uint64_t v24 = v18;
  uint64_t v25 = v19;
  uint64_t v26 = v13;
  uint64_t v47 = v23;
  uint64_t v48 = v14 + 16;
  v23(v22, v24, v13);
  sub_100010990();
  sub_100010570();
  uint64_t v52 = v20;
  v20(v10, v4);
  uint64_t v27 = sub_100010530();
  if (v27)
  {
    id v28 = (id)v27;
    id v29 = v22;
  }
  else
  {
    id v29 = v22;
    id v28 = [objc_allocWithZone((Class)FIUIWorkoutActivityType) initWithActivityTypeIdentifier:13 isIndoor:0];
  }
  swift_release();
  uint64_t v30 = (int *)type metadata accessor for DecodedContext();
  *(void *)&v29[v30[5]] = v28;
  id v31 = v28;
  id v32 = (id)FIUIStaticScalableWorkoutIconImage();
  if (v32)
  {
    uint64_t v33 = v32;

    *(void *)&v29[v30[6]] = v33;
    unint64_t v50 = v33;
    uint64_t v34 = v53;
    uint64_t v35 = v56;
    sub_100010990();
    sub_100010570();
    v52(v34, v4);
    uint64_t v36 = (uint64_t)v54;
    sub_100010550();
    swift_release();
    uint64_t v37 = v51;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v51 + 48))(v36, 1, v26) == 1)
    {
      sub_100007660(v36);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v37 + 56))(&v29[v30[7]], 1, 1, v26);
      long long v58 = &type metadata for PauseMirroredWorkout;
      unint64_t v59 = sub_100005C48();

      (*(void (**)(uint64_t, uint64_t))(*(void *)(v25 - 8) + 8))(v35, v25);
      (*(void (**)(char *, uint64_t))(v37 + 8))(v55, v26);
    }
    else
    {
      v38 = v49;
      (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v49, v36, v26);
      id v39 = &v29[v30[7]];
      v47(v39, v38, v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v39, 0, 1, v26);
      long long v58 = &type metadata for ResumeMirroredWorkout;
      unint64_t v59 = sub_100005508();

      (*(void (**)(uint64_t, uint64_t))(*(void *)(v25 - 8) + 8))(v35, v25);
      id v40 = *(void (**)(char *, uint64_t))(v37 + 8);
      v40(v38, v26);
      v40(v55, v26);
    }
    return sub_1000076C0(&v57, (uint64_t)&v29[v30[8]]);
  }
  else
  {
    *(void *)&long long v57 = 0;
    *((void *)&v57 + 1) = 0xE000000000000000;
    sub_100010B00(41);
    swift_bridgeObjectRelease();
    *(void *)&long long v57 = 0xD000000000000027;
    *((void *)&v57 + 1) = 0x8000000100013960;
    id v42 = [v31 description];
    uint64_t v43 = sub_100010A40();
    v45 = v44;

    v60._countAndFlagsBits = v43;
    v60._object = v45;
    sub_100010A70(v60);

    swift_bridgeObjectRelease();
    uint64_t result = sub_100010B40();
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for DecodedContext()
{
  uint64_t result = qword_100018298;
  if (!qword_100018298) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100007660(uint64_t a1)
{
  uint64_t v2 = sub_10000460C(&qword_100018238);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000076C0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t *sub_1000076D8(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100010510();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v23 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    v23(a1, a2, v7);
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    uint64_t v11 = *(void **)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + v9) = (uint64_t)v11;
    uint64_t v12 = *(void **)((char *)a2 + v10);
    *(uint64_t *)((char *)a1 + v10) = (uint64_t)v12;
    uint64_t v13 = a3[7];
    __dst = (char *)a1 + v13;
    uint64_t v14 = (char *)a2 + v13;
    uint64_t v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    id v16 = v11;
    id v17 = v12;
    if (v15(v14, 1, v7))
    {
      uint64_t v18 = sub_10000460C(&qword_100018238);
      memcpy(__dst, v14, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      v23((uint64_t *)__dst, (uint64_t *)v14, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(__dst, 0, 1, v7);
    }
    uint64_t v20 = a3[8];
    long long v21 = *(_OWORD *)((char *)a2 + v20 + 24);
    *(_OWORD *)((char *)a1 + v20 + 24) = v21;
    (**(void (***)(void))(v21 - 8))();
  }
  return a1;
}

uint64_t sub_1000078E8(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_100010510();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);

  uint64_t v7 = a1 + a2[7];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4)) {
    v6(v7, v4);
  }
  uint64_t v8 = a1 + a2[8];

  return sub_100006C8C(v8);
}

char *sub_1000079F8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100010510();
  uint64_t v7 = *(void *)(v6 - 8);
  long long v21 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v21(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = *(void **)&a2[v8];
  *(void *)&a1[v8] = v10;
  uint64_t v11 = *(void **)&a2[v9];
  *(void *)&a1[v9] = v11;
  uint64_t v12 = a3[7];
  __dst = &a1[v12];
  uint64_t v13 = &a2[v12];
  uint64_t v14 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  id v15 = v10;
  id v16 = v11;
  if (v14(v13, 1, v6))
  {
    uint64_t v17 = sub_10000460C(&qword_100018238);
    memcpy(__dst, v13, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    v21(__dst, v13, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(__dst, 0, 1, v6);
  }
  uint64_t v18 = a3[8];
  long long v19 = *(_OWORD *)&a2[v18 + 24];
  *(_OWORD *)&a1[v18 + 24] = v19;
  (**(void (***)(void))(v19 - 8))();
  return a1;
}

uint64_t sub_100007BB8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100010510();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v24(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = *(void **)(a2 + v8);
  uint64_t v10 = *(void **)(a1 + v8);
  *(void *)(a1 + v8) = v9;
  id v11 = v9;

  uint64_t v12 = a3[6];
  uint64_t v13 = *(void **)(a2 + v12);
  uint64_t v14 = *(void **)(a1 + v12);
  *(void *)(a1 + v12) = v13;
  id v15 = v13;

  uint64_t v25 = a3;
  uint64_t v16 = a3[7];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (const void *)(a2 + v16);
  long long v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  int v20 = v19(a1 + v16, 1, v6);
  int v21 = v19((uint64_t)v18, 1, v6);
  if (!v20)
  {
    if (!v21)
    {
      v24((uint64_t)v17, (uint64_t)v18, v6);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(v17, v6);
    goto LABEL_6;
  }
  if (v21)
  {
LABEL_6:
    uint64_t v22 = sub_10000460C(&qword_100018238);
    memcpy(v17, v18, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(v17, v18, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v17, 0, 1, v6);
LABEL_7:
  sub_100007DC4((uint64_t *)(a1 + v25[8]), (uint64_t *)(a2 + v25[8]));
  return a1;
}

uint64_t *sub_100007DC4(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *long long v3 = v12;
      }
      else
      {
        id v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *long long v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

char *sub_100007FF4(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100010510();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  uint64_t v9 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  *(void *)&a1[v9] = *(void *)&a2[v9];
  uint64_t v10 = a3[7];
  id v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v10], 1, v6))
  {
    uint64_t v13 = sub_10000460C(&qword_100018238);
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    v8(v11, v12, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  uint64_t v14 = a3[8];
  id v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  long long v17 = *((_OWORD *)v16 + 1);
  *(_OWORD *)id v15 = *(_OWORD *)v16;
  *((_OWORD *)v15 + 1) = v17;
  *((void *)v15 + 4) = *((void *)v16 + 4);
  return a1;
}

uint64_t sub_100008174(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100010510();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v24(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = *(void **)(a1 + v8);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);

  uint64_t v10 = a3[6];
  id v11 = *(void **)(a1 + v10);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);

  uint64_t v25 = a3;
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  id v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  int v16 = v15(a1 + v12, 1, v6);
  int v17 = v15((uint64_t)v14, 1, v6);
  if (!v16)
  {
    if (!v17)
    {
      v24((uint64_t)v13, (uint64_t)v14, v6);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(v13, v6);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v18 = sub_10000460C(&qword_100018238);
    memcpy(v13, v14, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(v13, v14, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);
LABEL_7:
  uint64_t v19 = v25[8];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  sub_100006C8C(a1 + v19);
  long long v22 = *(_OWORD *)(v21 + 16);
  *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
  *(_OWORD *)(v20 + 16) = v22;
  *(void *)(v20 + 32) = *(void *)(v21 + 32);
  return a1;
}

uint64_t sub_10000838C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000083A0);
}

uint64_t sub_1000083A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100010510();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = sub_10000460C(&qword_100018238);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 28);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_1000084D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000084E4);
}

uint64_t sub_1000084E4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100010510();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = sub_10000460C(&qword_100018238);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 28);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_100008614()
{
  sub_100010510();
  if (v0 <= 0x3F)
  {
    sub_1000086F4();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1000086F4()
{
  if (!qword_1000182A8)
  {
    sub_100010510();
    unint64_t v0 = sub_100010AD0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000182A8);
    }
  }
}

uint64_t sub_10000874C()
{
  unint64_t v0 = sub_100008848();

  return static WidgetBundleBuilder.buildBlock<A>(_:)(v0, &type metadata for MirroredWidgetLiveActivity, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000087C8()
{
  unint64_t result = qword_1000182E8;
  if (!qword_1000182E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for MirroredWidgetBundle()
{
  return &type metadata for MirroredWidgetBundle;
}

uint64_t sub_10000882C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100008848()
{
  unint64_t result = qword_1000182F0;
  if (!qword_1000182F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182F0);
  }
  return result;
}

uint64_t sub_10000889C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000088E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v3 = sub_10000460C(&qword_1000180F8);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v26 = *(void *)(v4 + 64);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DecodedContext();
  uint64_t v25 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v25 + 64);
  uint64_t v9 = __chkstk_darwin(v7 - 8);
  unint64_t v10 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v24 - v12;
  __chkstk_darwin(v11);
  id v15 = (char *)&v24 - v14;
  int v16 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v24 = v3;
  v16(v6, a1, v3);
  sub_100007018((uint64_t)v6, v15);
  sub_100009088((uint64_t)v15, (uint64_t)v13);
  v16(v6, a1, v3);
  unint64_t v17 = (*(unsigned __int8 *)(v25 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  unint64_t v18 = (v17 + v8 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v19 = swift_allocObject();
  sub_100009300((uint64_t)v13, v19 + v17);
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v19 + v18, v6, v24);
  sub_100009088((uint64_t)v15, (uint64_t)v10);
  uint64_t v20 = swift_allocObject();
  sub_100009300((uint64_t)v10, v20 + v17);
  sub_100009088((uint64_t)v15, (uint64_t)v10);
  uint64_t v21 = swift_allocObject();
  sub_100009300((uint64_t)v10, v21 + v17);
  sub_100009088((uint64_t)v15, (uint64_t)v10);
  uint64_t v22 = swift_allocObject();
  sub_100009300((uint64_t)v10, v22 + v17);
  sub_10000460C(&qword_1000182F8);
  sub_10000460C(&qword_100018300);
  sub_100005468(&qword_100018308, &qword_1000182F8);
  sub_10000C3AC();
  sub_10000C400();
  sub_100010980();
  return sub_10000C6E0((uint64_t)v15);
}

uint64_t sub_100008C9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v20 = a3;
  uint64_t v21 = sub_10000460C(&qword_1000183D0);
  uint64_t v5 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10000460C(&qword_1000183D8);
  uint64_t v8 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  unint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100010A20();
  __chkstk_darwin(v11 - 8);
  uint64_t v18 = sub_10000460C(&qword_1000183E0);
  uint64_t v12 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010A00();
  uint64_t v26 = a1;
  uint64_t v27 = a2;
  uint64_t v15 = sub_10000460C(&qword_1000183E8);
  uint64_t v16 = sub_100005468(&qword_1000183F0, &qword_1000183E8);
  sub_1000109D0();
  sub_100010A10();
  uint64_t v25 = a1;
  sub_10000460C(&qword_1000183F8);
  sub_10000D688();
  sub_1000109D0();
  uint64_t v24 = v14;
  sub_10000460C(&qword_100018458);
  uint64_t v28 = v15;
  uint64_t v29 = v16;
  swift_getOpaqueTypeConformance2();
  sub_1000109E0();
  uint64_t v22 = v7;
  uint64_t v23 = v10;
  sub_10000460C(&qword_1000182F8);
  sub_100005468(&qword_100018308, &qword_1000182F8);
  sub_1000109E0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v21);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v18);
}

uint64_t sub_100009088(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DecodedContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000090EC()
{
  uint64_t v1 = (int *)type metadata accessor for DecodedContext();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v13 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v14 = sub_10000460C(&qword_1000180F8);
  uint64_t v3 = *(void *)(v14 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v12 = *(void *)(v3 + 64);
  uint64_t v15 = v0;
  uint64_t v5 = v0 + ((v2 + 16) & ~v2);
  uint64_t v6 = sub_100010510();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v8(v5, v6);

  uint64_t v9 = v5 + v1[7];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v9, 1, v6)) {
    v8(v9, v6);
  }
  uint64_t v10 = (((v2 + 16) & ~v2) + v13 + v4) & ~v4;
  sub_100006C8C(v5 + v1[8]);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v15 + v10, v14);

  return _swift_deallocObject(v15, v10 + v12, v2 | v4 | 7);
}

uint64_t sub_100009300(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DecodedContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009364@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for DecodedContext() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = v4 + *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(sub_10000460C(&qword_1000180F8) - 8);
  uint64_t v7 = v1 + ((v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return sub_100008C9C(v1 + v4, v7, a1);
}

uint64_t sub_10000943C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = sub_1000106A0();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  uint64_t v6 = sub_10000460C(&qword_100018478);
  return sub_1000094A4(a1, a2, a3 + *(int *)(v6 + 44), (void *)0x4049000000000000);
}

uint64_t sub_1000094A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, void *a4@<D0>)
{
  uint64_t v87 = a2;
  uint64_t v95 = a3;
  uint64_t v88 = sub_100010590();
  uint64_t v86 = *(void *)(v88 - 8);
  __chkstk_darwin(v88);
  v85 = (char *)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_10000460C(&qword_100018480);
  uint64_t v83 = *(void *)(v90 - 8);
  __chkstk_darwin(v90);
  v82 = (char *)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_10000460C(&qword_100018488);
  uint64_t v91 = *(void *)(v93 - 8);
  __chkstk_darwin(v93);
  v89 = (char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000460C(&qword_100018490);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  v94 = (char *)&v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v92 = (uint64_t)&v75 - v12;
  uint64_t v13 = sub_10000460C(&qword_100018238);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v75 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = (void *)sub_10000460C(&qword_100018498);
  uint64_t v16 = *(v77 - 1);
  __chkstk_darwin(v77);
  uint64_t v18 = (char *)&v75 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_10000460C(&qword_1000184A0);
  uint64_t v80 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  uint64_t v20 = (char *)&v75 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_10000460C(&qword_1000184A8);
  uint64_t v22 = __chkstk_darwin(v21 - 8);
  uint64_t v84 = (uint64_t)&v75 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  v78 = (char *)&v75 - v25;
  __chkstk_darwin(v24);
  uint64_t v96 = (uint64_t)&v75 - v26;
  uint64_t v27 = type metadata accessor for DecodedContext();
  uint64_t v28 = *(int *)(v27 + 32);
  uint64_t v76 = a1;
  uint64_t v29 = sub_10000DACC((void *)(a1 + v28), *(void *)(a1 + v28 + 24));
  __chkstk_darwin(v29);
  (*(void (**)(char *))(v31 + 16))((char *)&v75 - v30);
  uint64_t v97 = a1;
  v98 = a4;
  sub_10000460C(&qword_1000184B0);
  sub_10000DCBC(&qword_1000184B8, &qword_1000184B0, (void (*)(void))sub_10000DB1C);
  sub_100010960();
  uint64_t v32 = sub_1000108B0();
  uint64_t v33 = sub_1000108B0();
  uint64_t v99 = v32;
  v100 = (ValueMetadata *)v33;
  uint64_t v34 = sub_100005468(&qword_100018500, &qword_100018498);
  unint64_t v35 = sub_10000DC5C();
  v79 = v20;
  uint64_t v36 = v77;
  sub_100010840();
  swift_release();
  swift_release();
  uint64_t v37 = v18;
  v38 = v36;
  (*(void (**)(char *, void *))(v16 + 8))(v37, v36);
  sub_10000536C(v76 + *(int *)(v27 + 28), (uint64_t)v15, &qword_100018238);
  uint64_t v39 = sub_100010510();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v39 - 8) + 48))(v15, 1, v39);
  sub_1000053D0((uint64_t)v15, &qword_100018238);
  sub_1000106B0();
  uint64_t v40 = sub_1000107F0();
  uint64_t v42 = v41;
  LOBYTE(v32) = v43 & 1;
  uint64_t v99 = (uint64_t)v38;
  v100 = &type metadata for WidgetButtonStyle;
  uint64_t v101 = v34;
  unint64_t v102 = v35;
  v77 = &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>;
  swift_getOpaqueTypeConformance2();
  uint64_t v44 = (uint64_t)v78;
  uint64_t v45 = v81;
  uint64_t v46 = v79;
  sub_100010870();
  sub_10000C784(v40, v42, v32);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v80 + 8))(v46, v45);
  uint64_t v47 = sub_100005308(v44, v96, &qword_1000184A8);
  __chkstk_darwin(v47);
  v74._object = a4;
  sub_10000460C(&qword_100018510);
  sub_10000DCBC((unint64_t *)&qword_100018518, &qword_100018510, (void (*)(void))sub_10000DBBC);
  sub_10000607C();
  uint64_t v48 = v82;
  sub_100010960();
  uint64_t v49 = sub_1000108E0();
  uint64_t v50 = sub_1000108B0();
  uint64_t v99 = v49;
  v100 = (ValueMetadata *)v50;
  uint64_t v51 = sub_100005468(&qword_100018520, &qword_100018480);
  uint64_t v52 = v89;
  uint64_t v53 = v90;
  sub_100010840();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v83 + 8))(v48, v53);
  uint64_t v54 = (objc_class *)[self mainBundle];
  v103._countAndFlagsBits = 0xD00000000000001BLL;
  v74._countAndFlagsBits = 0xE000000000000000;
  v103._object = (void *)0x80000001000139B0;
  v104.value._countAndFlagsBits = 0;
  v104.value._object = 0;
  v55.super.isa = v54;
  v105._countAndFlagsBits = 0;
  v105._object = (void *)0xE000000000000000;
  sub_1000104A0(v103, v104, v55, v105, v74);

  sub_10000460C(&qword_100018528);
  uint64_t v56 = swift_allocObject();
  *(_OWORD *)(v56 + 16) = xmmword_100011510;
  sub_10000460C(&qword_1000180F8);
  long long v57 = v85;
  sub_100010990();
  uint64_t v58 = sub_100010580();
  (*(void (**)(char *, uint64_t))(v86 + 8))(v57, v88);
  *(void *)(v56 + 56) = &type metadata for Int;
  *(void *)(v56 + 64) = &protocol witness table for Int;
  *(void *)(v56 + 32) = v58;
  uint64_t v59 = sub_100010A50();
  char v61 = v60;
  swift_bridgeObjectRelease();
  uint64_t v99 = v59;
  v100 = v61;
  sub_10000504C();
  uint64_t v62 = sub_100010800();
  uint64_t v64 = v63;
  uint64_t v99 = v53;
  v100 = &type metadata for WidgetButtonStyle;
  uint64_t v101 = v51;
  LOBYTE(v53) = v65 & 1;
  unint64_t v102 = v35;
  swift_getOpaqueTypeConformance2();
  uint64_t v66 = v93;
  uint64_t v67 = (uint64_t)v94;
  sub_100010870();
  sub_10000C784(v62, v64, v53);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v91 + 8))(v52, v66);
  uint64_t v68 = v92;
  sub_100005308(v67, v92, &qword_100018490);
  uint64_t v69 = v96;
  uint64_t v70 = v84;
  sub_10000536C(v96, v84, &qword_1000184A8);
  sub_10000536C(v68, v67, &qword_100018490);
  uint64_t v71 = v95;
  sub_10000536C(v70, v95, &qword_1000184A8);
  uint64_t v72 = sub_10000460C(&qword_100018530);
  sub_10000536C(v67, v71 + *(int *)(v72 + 48), &qword_100018490);
  sub_1000053D0(v68, &qword_100018490);
  sub_1000053D0(v69, &qword_1000184A8);
  sub_1000053D0(v67, &qword_100018490);
  return sub_1000053D0(v70, &qword_1000184A8);
}

uint64_t sub_10000A05C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v30 = a2;
  uint64_t v28 = sub_10000460C(&qword_1000184F8) - 8;
  __chkstk_darwin(v28);
  unint64_t v4 = (uint64_t *)((char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_100010940();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000460C(&qword_100018238);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000460C(&qword_1000184C8);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  uint64_t v15 = (uint64_t *)((char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v29 = sub_10000460C(&qword_1000184B0) - 8;
  __chkstk_darwin(v29);
  uint64_t v27 = (uint64_t)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for DecodedContext();
  sub_10000536C(a1 + *(int *)(v17 + 28), (uint64_t)v11, &qword_100018238);
  uint64_t v18 = sub_100010510();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48))(v11, 1, v18);
  sub_1000053D0((uint64_t)v11, &qword_100018238);
  uint64_t v19 = sub_100010920();
  uint64_t v20 = sub_100010730();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for Image.Scale.small(_:), v5);
  uint64_t v22 = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)v4 + *(int *)(v28 + 36), v8, v5);
  *unint64_t v4 = v22;
  sub_10000536C((uint64_t)v4, (uint64_t)v15 + *(int *)(v13 + 44), &qword_1000184F8);
  *uint64_t v15 = v19;
  v15[1] = KeyPath;
  v15[2] = v20;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000053D0((uint64_t)v4, &qword_1000184F8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_release();
  swift_release();
  swift_release();
  sub_100010970();
  sub_1000105F0();
  uint64_t v23 = v27;
  sub_10000536C((uint64_t)v15, v27, &qword_1000184C8);
  uint64_t v24 = (_OWORD *)(v23 + *(int *)(v29 + 44));
  long long v25 = v32;
  *uint64_t v24 = v31;
  v24[1] = v25;
  v24[2] = v33;
  sub_1000053D0((uint64_t)v15, &qword_1000184C8);
  return sub_100005308(v23, v30, &qword_1000184B0);
}

double sub_10000A488@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10000460C(&qword_1000183A8);
  __chkstk_darwin(v2 - 8);
  unint64_t v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100010590();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = 0;
  unint64_t v24 = 0xE000000000000000;
  sub_10000460C(&qword_1000180F8);
  sub_100010990();
  uint64_t v9 = sub_100010580();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v22[1] = v9;
  uint64_t v10 = sub_100010B60();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  uint64_t v23 = v10;
  unint64_t v24 = v12;
  v28._countAndFlagsBits = 0x656C637269632ELL;
  v28._object = (void *)0xE700000000000000;
  sub_100010A70(v28);
  uint64_t v13 = sub_100010920();
  sub_100010790();
  uint64_t v14 = sub_100010760();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 1, 1, v14);
  uint64_t v15 = sub_1000107B0();
  sub_1000053D0((uint64_t)v4, &qword_1000183A8);
  uint64_t KeyPath = swift_getKeyPath();
  sub_100010970();
  sub_1000105F0();
  uint64_t v17 = v23;
  char v18 = v24;
  uint64_t v19 = v25;
  char v20 = v26;
  *(void *)a1 = v13;
  *(void *)(a1 + 8) = KeyPath;
  *(void *)(a1 + 16) = v15;
  *(void *)(a1 + 24) = v17;
  *(unsigned char *)(a1 + 32) = v18;
  *(void *)(a1 + 40) = v19;
  *(unsigned char *)(a1 + 48) = v20;
  double result = *(double *)&v27;
  *(_OWORD *)(a1 + 56) = v27;
  return result;
}

uint64_t sub_10000A704@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v96 = a2;
  uint64_t v3 = sub_100010610();
  uint64_t v101 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v100 = (char *)&v93 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000460C(&qword_1000183A8);
  __chkstk_darwin(v5 - 8);
  v107 = (char *)&v93 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000460C(&qword_100018238);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v113 = (uint64_t)&v93 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v106 = (uint64_t)&v93 - v10;
  uint64_t v102 = sub_10000460C(&qword_1000183B0);
  uint64_t v11 = __chkstk_darwin(v102);
  uint64_t v13 = (char *)&v93 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v93 - v14;
  uint64_t v16 = sub_100010510();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  char v20 = (char *)&v93 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v93 - v21;
  uint64_t v103 = sub_10000460C(&qword_1000183B8);
  uint64_t v23 = __chkstk_darwin(v103);
  Swift::String_optional v104 = (char *)&v93 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v105 = (uint64_t)&v93 - v25;
  uint64_t v97 = sub_10000460C(&qword_100018470);
  uint64_t v112 = *(void *)(v97 - 8);
  __chkstk_darwin(v97);
  v108 = (char *)&v93 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = sub_10000460C(&qword_100018430);
  __chkstk_darwin(v109);
  v111 = (char *)&v93 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = sub_10000460C(&qword_100018420);
  __chkstk_darwin(v110);
  v98 = (char *)&v93 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = sub_10000460C(&qword_100018410);
  __chkstk_darwin(v99);
  v114 = (char *)&v93 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_10000460C(&qword_1000183F8);
  __chkstk_darwin(v30 - 8);
  uint64_t v95 = (char *)&v93 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v32 = *(void (**)(char *, uint64_t))(v17 + 16);
  uint64_t v120 = a1;
  v117 = v32;
  ((void (*)(char *, uint64_t, uint64_t))v32)(v22, a1, v16);
  sub_1000104E0();
  sub_10000C73C(&qword_1000183C8, (void (*)(uint64_t))&type metadata accessor for Date);
  v118 = v20;
  uint64_t v33 = v16;
  uint64_t result = sub_100010A30();
  if (result)
  {
    uint64_t v94 = v3;
    uint64_t v35 = v102;
    uint64_t v36 = &v15[*(int *)(v102 + 48)];
    uint64_t v116 = v17;
    uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    v119 = v22;
    v37(v15, v22, v33);
    uint64_t v93 = v36;
    v37(v36, v118, v33);
    v38 = &v13[*(int *)(v35 + 48)];
    uint64_t v39 = (void (*)(char *, char *, uint64_t))v117;
    ((void (*)(char *, char *, uint64_t))v117)(v13, v15, v33);
    v39(v38, v36, v33);
    uint64_t v40 = (uint64_t)v104;
    v37(v104, v13, v33);
    uint64_t v115 = v33;
    uint64_t v42 = (char *)(v116 + 8);
    uint64_t v41 = *(void (**)(char *, uint64_t))(v116 + 8);
    v41(v38, v33);
    char v43 = v42;
    uint64_t v44 = &v13[*(int *)(v35 + 48)];
    v37(v13, v15, v33);
    v37(v44, v93, v33);
    v37((char *)(v40 + *(int *)(v103 + 36)), v44, v33);
    v41(v13, v33);
    v118 = v43;
    uint64_t v45 = v41;
    v117 = v41;
    sub_100005308(v40, v105, &qword_1000183B8);
    Swift::String_optional v104 = (char *)(v120 + *(int *)(type metadata accessor for DecodedContext() + 28));
    sub_10000536C((uint64_t)v104, v106, &qword_100018238);
    uint64_t v46 = sub_1000107C0();
    uint64_t v48 = v47;
    LOBYTE(v43) = v49 & 1;
    uint64_t v50 = v119;
    sub_100010500();
    sub_1000104F0();
    v45(v50, v33);
    sub_100010780();
    uint64_t v51 = enum case for Font.Design.rounded(_:);
    uint64_t v52 = sub_100010760();
    uint64_t v53 = *(void *)(v52 - 8);
    uint64_t v54 = (uint64_t)v107;
    (*(void (**)(char *, uint64_t, uint64_t))(v53 + 104))(v107, v51, v52);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v53 + 56))(v54, 0, 1, v52);
    sub_1000107B0();
    sub_1000053D0(v54, &qword_1000183A8);
    uint64_t v55 = sub_1000107E0();
    uint64_t v105 = v55;
    v107 = v56;
    LOBYTE(v54) = v57;
    uint64_t v106 = v58;
    swift_release();
    LOBYTE(v54) = v54 & 1;
    sub_10000C784(v46, v48, (char)v43);
    swift_bridgeObjectRelease();
    uint64_t v59 = v119;
    sub_100010500();
    sub_1000104F0();
    v117(v59, v33);
    sub_100010970();
    sub_1000105F0();
    uint64_t v60 = v133;
    LOBYTE(v48) = v134;
    uint64_t v61 = v135;
    LOBYTE(v35) = v136;
    uint64_t v62 = v137;
    uint64_t v63 = v138;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v65 = (uint64_t)v107;
    uint64_t v121 = v55;
    v122 = v107;
    char v123 = v54;
    uint64_t v124 = v106;
    uint64_t v125 = v60;
    char v126 = v48;
    uint64_t v127 = v61;
    char v128 = v35;
    uint64_t v129 = v62;
    uint64_t v130 = v63;
    uint64_t v131 = KeyPath;
    char v132 = 2;
    sub_10000460C(&qword_100018438);
    sub_10000D978();
    uint64_t v66 = v108;
    sub_100010860();
    sub_10000C784(v105, v65, v54);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v67 = v113;
    sub_10000536C((uint64_t)v104, v113, &qword_100018238);
    int v68 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v116 + 48))(v67, 1, v115);
    sub_1000053D0(v67, &qword_100018238);
    uint64_t v69 = v66;
    if (v68 == 1)
    {
      uint64_t v70 = sub_1000108B0();
    }
    else
    {
      sub_1000108C0();
      uint64_t v70 = sub_1000108F0();
      swift_release();
    }
    uint64_t v71 = v101;
    uint64_t v72 = v100;
    uint64_t v73 = v99;
    uint64_t v74 = (uint64_t)v98;
    uint64_t v75 = v97;
    uint64_t v76 = swift_getKeyPath();
    uint64_t v77 = v112;
    uint64_t v78 = (uint64_t)v111;
    (*(void (**)(char *, char *, uint64_t))(v112 + 16))(v111, v69, v75);
    v79 = (uint64_t *)(v78 + *(int *)(v109 + 36));
    uint64_t *v79 = v76;
    v79[1] = v70;
    (*(void (**)(char *, uint64_t))(v77 + 8))(v69, v75);
    uint64_t v80 = sub_1000108D0();
    LOBYTE(v76) = sub_100010720();
    sub_10000536C(v78, v74, &qword_100018430);
    uint64_t v81 = v74 + *(int *)(v110 + 36);
    *(void *)uint64_t v81 = v80;
    *(unsigned char *)(v81 + 8) = v76;
    sub_1000053D0(v78, &qword_100018430);
    sub_100010600();
    uint64_t v82 = swift_getKeyPath();
    uint64_t v83 = (uint64_t)v114;
    uint64_t v84 = (uint64_t *)&v114[*(int *)(v73 + 36)];
    uint64_t v85 = sub_10000460C(&qword_100018398);
    uint64_t v86 = v94;
    (*(void (**)(char *, char *, uint64_t))(v71 + 16))((char *)v84 + *(int *)(v85 + 28), v72, v94);
    *uint64_t v84 = v82;
    sub_10000536C(v74, v83, &qword_100018420);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v72, v86);
    sub_1000053D0(v74, &qword_100018420);
    uint64_t v87 = v119;
    sub_100010500();
    sub_1000104F0();
    v117(v87, v115);
    uint64_t result = (uint64_t)(id)AXDurationStringForDuration();
    if (result)
    {
      uint64_t v88 = (void *)result;
      uint64_t v89 = sub_100010A40();
      uint64_t v91 = v90;

      uint64_t v121 = v89;
      v122 = v91;
      sub_10000D734();
      sub_10000504C();
      uint64_t v92 = (uint64_t)v95;
      sub_100010880();
      swift_bridgeObjectRelease();
      sub_1000053D0(v83, &qword_100018410);
      return sub_100005308(v92, v96, &qword_1000183F8);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000B45C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v107 = a2;
  uint64_t v95 = sub_100010610();
  uint64_t v94 = *(void *)(v95 - 8);
  __chkstk_darwin(v95);
  uint64_t v93 = (char *)&v86 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000460C(&qword_1000183A8);
  __chkstk_darwin(v4 - 8);
  v100 = (char *)&v86 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000460C(&qword_100018238);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v105 = (uint64_t)&v86 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v99 = (uint64_t)&v86 - v9;
  uint64_t v98 = sub_10000460C(&qword_1000183B0);
  uint64_t v10 = __chkstk_darwin(v98);
  uint64_t v12 = (char *)&v86 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v86 - v13;
  uint64_t v15 = sub_100010510();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v86 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v86 - v20;
  uint64_t v96 = sub_10000460C(&qword_1000183B8);
  uint64_t v22 = __chkstk_darwin(v96);
  uint64_t v97 = (char *)&v86 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v25 = (char *)&v86 - v24;
  uint64_t v91 = sub_10000460C(&qword_1000183C0);
  uint64_t v90 = *(void *)(v91 - 8);
  __chkstk_darwin(v91);
  v111 = (char *)&v86 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = sub_10000460C(&qword_100018348);
  __chkstk_darwin(v101);
  uint64_t v103 = (char *)&v86 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = sub_10000460C(&qword_100018338);
  __chkstk_darwin(v102);
  uint64_t v104 = (uint64_t)&v86 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = sub_10000460C(&qword_100018328);
  __chkstk_darwin(v106);
  uint64_t v92 = (char *)&v86 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_10000460C(&qword_100018300);
  __chkstk_darwin(v30 - 8);
  uint64_t v89 = (char *)&v86 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v32 = *(void (**)(char *, char *))(v16 + 16);
  uint64_t v112 = a1;
  uint64_t v109 = v32;
  ((void (*)(char *, uint64_t, uint64_t))v32)(v21, a1, v15);
  sub_1000104E0();
  sub_10000C73C(&qword_1000183C8, (void (*)(uint64_t))&type metadata accessor for Date);
  uint64_t v33 = v21;
  uint64_t v113 = v19;
  uint64_t result = sub_100010A30();
  if (result)
  {
    uint64_t v88 = v25;
    uint64_t v35 = v98;
    uint64_t v36 = &v14[*(int *)(v98 + 48)];
    uint64_t v108 = v16;
    uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
    uint64_t v110 = v33;
    v37(v14, v33, v15);
    uint64_t v87 = v36;
    v37(v36, v113, v15);
    v38 = &v12[*(int *)(v35 + 48)];
    uint64_t v39 = (void (*)(char *, char *, uint64_t))v109;
    ((void (*)(char *, char *, uint64_t))v109)(v12, v14, v15);
    v39(v38, v36, v15);
    uint64_t v40 = (uint64_t)v97;
    v37(v97, v12, v15);
    uint64_t v113 = (char *)v15;
    uint64_t v41 = (char *)(v108 + 8);
    uint64_t v42 = *(void (**)(char *, char *))(v108 + 8);
    v42(v38, v113);
    uint64_t v109 = v42;
    char v43 = &v12[*(int *)(v35 + 48)];
    v37(v12, v14, (uint64_t)v113);
    v37(v43, v87, (uint64_t)v113);
    v37((char *)(v40 + *(int *)(v96 + 36)), v43, (uint64_t)v113);
    v42(v12, v113);
    sub_100005308(v40, (uint64_t)v88, &qword_1000183B8);
    uint64_t v98 = v112 + *(int *)(type metadata accessor for DecodedContext() + 28);
    sub_10000536C(v98, v99, &qword_100018238);
    uint64_t v44 = sub_1000107C0();
    uint64_t v46 = v45;
    char v48 = v47 & 1;
    sub_1000107A0();
    uint64_t v49 = enum case for Font.Design.rounded(_:);
    uint64_t v50 = sub_100010760();
    uint64_t v51 = *(void *)(v50 - 8);
    uint64_t v52 = (uint64_t)v100;
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 104))(v100, v49, v50);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v51 + 56))(v52, 0, 1, v50);
    sub_1000107B0();
    sub_1000053D0(v52, &qword_1000183A8);
    uint64_t v53 = sub_1000107E0();
    uint64_t v55 = v54;
    LOBYTE(v52) = v56;
    uint64_t v58 = v57;
    swift_release();
    sub_10000C784(v44, v46, v48);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v60 = v110;
    sub_100010500();
    sub_1000104F0();
    v100 = v41;
    v109(v60, v113);
    sub_100010970();
    sub_1000105F0();
    uint64_t v114 = v53;
    uint64_t v115 = v55;
    char v116 = v52 & 1;
    uint64_t v117 = v58;
    uint64_t v118 = KeyPath;
    char v119 = 2;
    uint64_t v120 = v125;
    char v121 = v126;
    uint64_t v122 = v127;
    char v123 = v128;
    long long v124 = v129;
    sub_10000460C(&qword_100018350);
    sub_10000C618();
    sub_100010860();
    sub_10000C784(v53, v55, v52 & 1);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v61 = v105;
    sub_10000536C(v98, v105, &qword_100018238);
    LODWORD(v41) = (*(uint64_t (**)(uint64_t, uint64_t, char *))(v108 + 48))(v61, 1, v113);
    sub_1000053D0(v61, &qword_100018238);
    if (v41 == 1)
    {
      uint64_t v62 = sub_1000108B0();
    }
    else
    {
      sub_1000108C0();
      uint64_t v62 = sub_1000108F0();
      swift_release();
    }
    uint64_t v63 = v95;
    uint64_t v64 = v94;
    uint64_t v65 = v93;
    uint64_t v66 = (uint64_t)v92;
    uint64_t v67 = v91;
    uint64_t v68 = v90;
    uint64_t v69 = swift_getKeyPath();
    uint64_t v70 = (uint64_t)v103;
    uint64_t v71 = v111;
    (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v103, v111, v67);
    uint64_t v72 = (uint64_t *)(v70 + *(int *)(v101 + 36));
    *uint64_t v72 = v69;
    v72[1] = v62;
    (*(void (**)(char *, uint64_t))(v68 + 8))(v71, v67);
    uint64_t v73 = sub_1000108D0();
    LOBYTE(v69) = sub_100010720();
    uint64_t v74 = v104;
    sub_10000536C(v70, v104, &qword_100018348);
    uint64_t v75 = v74 + *(int *)(v102 + 36);
    *(void *)uint64_t v75 = v73;
    *(unsigned char *)(v75 + 8) = v69;
    sub_1000053D0(v70, &qword_100018348);
    sub_100010600();
    uint64_t v76 = swift_getKeyPath();
    uint64_t v77 = (uint64_t *)(v66 + *(int *)(v106 + 36));
    uint64_t v78 = sub_10000460C(&qword_100018398);
    (*(void (**)(char *, char *, uint64_t))(v64 + 16))((char *)v77 + *(int *)(v78 + 28), v65, v63);
    uint64_t *v77 = v76;
    sub_10000536C(v74, v66, &qword_100018338);
    (*(void (**)(char *, uint64_t))(v64 + 8))(v65, v63);
    sub_1000053D0(v74, &qword_100018338);
    v79 = v110;
    sub_100010500();
    sub_1000104F0();
    v109(v79, v113);
    uint64_t result = (uint64_t)(id)AXDurationStringForDuration();
    uint64_t v80 = v107;
    if (result)
    {
      uint64_t v81 = (void *)result;
      uint64_t v82 = sub_100010A40();
      uint64_t v84 = v83;

      uint64_t v114 = v82;
      uint64_t v115 = v84;
      sub_10000C4AC();
      sub_10000504C();
      uint64_t v85 = (uint64_t)v89;
      sub_100010880();
      swift_bridgeObjectRelease();
      sub_1000053D0(v66, &qword_100018328);
      return sub_100005308(v85, v80, &qword_100018300);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000C140@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for DecodedContext() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_10000B45C(v4, a1);
}

uint64_t sub_10000C1B4()
{
  uint64_t v1 = (int *)type metadata accessor for DecodedContext();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v9 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v4 = sub_100010510();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(v0 + v3, v4);

  uint64_t v7 = v0 + v3 + v1[7];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4)) {
    v6(v7, v4);
  }
  sub_100006C8C(v0 + v3 + v1[8]);

  return _swift_deallocObject(v0, v3 + v9, v2 | 7);
}

id sub_10000C338@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = type metadata accessor for DecodedContext();
  id result = [*(id *)(v1+ ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80))+ *(int *)(v3 + 20)) isIndoor];
  *a1 = (_BYTE)result;
  return result;
}

unint64_t sub_10000C3AC()
{
  unint64_t result = qword_100018310;
  if (!qword_100018310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018310);
  }
  return result;
}

unint64_t sub_10000C400()
{
  unint64_t result = qword_100018318;
  if (!qword_100018318)
  {
    sub_1000046B0(&qword_100018300);
    sub_10000C4AC();
    sub_10000C73C(&qword_1000183A0, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018318);
  }
  return result;
}

unint64_t sub_10000C4AC()
{
  unint64_t result = qword_100018320;
  if (!qword_100018320)
  {
    sub_1000046B0(&qword_100018328);
    sub_10000C54C();
    sub_100005468(&qword_100018390, &qword_100018398);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018320);
  }
  return result;
}

unint64_t sub_10000C54C()
{
  unint64_t result = qword_100018330;
  if (!qword_100018330)
  {
    sub_1000046B0(&qword_100018338);
    sub_10000D8A0(&qword_100018340, &qword_100018348, &qword_100018350, (void (*)(void))sub_10000C618);
    sub_100005468(&qword_100018380, &qword_100018388);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018330);
  }
  return result;
}

uint64_t sub_10000C618()
{
  return sub_10000DCBC(&qword_100018358, &qword_100018350, (void (*)(void))sub_10000C640);
}

unint64_t sub_10000C640()
{
  unint64_t result = qword_100018360;
  if (!qword_100018360)
  {
    sub_1000046B0(&qword_100018368);
    sub_100005468(&qword_100018370, &qword_100018378);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018360);
  }
  return result;
}

uint64_t sub_10000C6E0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DecodedContext();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000C73C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000C784(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000C794@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  v26[3] = a1;
  uint64_t v29 = a2;
  uint64_t v27 = sub_100010710();
  uint64_t v2 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000460C(&qword_100018538);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (uint64_t *)((char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_10000460C(&qword_100018540);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_10000460C(&qword_100018548);
  uint64_t v11 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000460C(&qword_100018550);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v7 = sub_100010970();
  v7[1] = v17;
  uint64_t v18 = sub_10000460C(&qword_100018558);
  sub_10000CB90((uint64_t *)((char *)v7 + *(int *)(v18 + 44)));
  swift_bridgeObjectRelease();
  sub_10000536C((uint64_t)v7, (uint64_t)v10, &qword_100018538);
  v10[*(int *)(v8 + 36)] = 1;
  sub_1000053D0((uint64_t)v7, &qword_100018538);
  sub_100010700();
  unint64_t v19 = sub_10000DFC4();
  sub_1000108A0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v27);
  sub_1000053D0((uint64_t)v10, &qword_100018540);
  sub_1000106B0();
  uint64_t v20 = sub_1000107F0();
  uint64_t v22 = v21;
  LOBYTE(v7) = v23 & 1;
  uint64_t v30 = v8;
  unint64_t v31 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v24 = v28;
  sub_100010870();
  sub_10000C784(v20, v22, (char)v7);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v24);
  return sub_100005308((uint64_t)v16, v29, &qword_100018550);
}

void sub_10000CB90(uint64_t *a1@<X8>)
{
  uint64_t v35 = a1;
  uint64_t v37 = sub_10000460C(&qword_1000184F8);
  __chkstk_darwin(v37);
  uint64_t v2 = (uint64_t *)((char *)&v30 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v3 = sub_100010940();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000460C(&qword_1000183A8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_10000460C(&qword_1000184C8);
  __chkstk_darwin(v36);
  uint64_t v11 = (uint64_t *)((char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v32 = sub_10000460C(&qword_100018570);
  uint64_t v12 = __chkstk_darwin(v32);
  uint64_t v34 = (uint64_t)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v30 - v15;
  __chkstk_darwin(v14);
  uint64_t v33 = (uint64_t)&v30 - v17;
  if ((id)FIUICircularWorkoutGradientImageWithGoal())
  {
    uint64_t v31 = sub_100010910();
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_100010920();
    sub_100010790();
    uint64_t v19 = sub_100010760();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v9, 1, 1, v19);
    uint64_t v20 = sub_1000107B0();
    sub_1000053D0((uint64_t)v9, &qword_1000183A8);
    uint64_t KeyPath = swift_getKeyPath();
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for Image.Scale.medium(_:), v3);
    uint64_t v22 = swift_getKeyPath();
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v2 + *(int *)(v37 + 28), v6, v3);
    *uint64_t v2 = v22;
    sub_10000536C((uint64_t)v2, (uint64_t)v11 + *(int *)(v36 + 36), &qword_1000184F8);
    *uint64_t v11 = v18;
    v11[1] = KeyPath;
    v11[2] = v20;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1000053D0((uint64_t)v2, &qword_1000184F8);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_release();
    swift_release();
    swift_release();
    id v23 = [self metricColorsForGoalTypeIdentifier:0];
    id v24 = [v23 nonGradientTextColor];

    if (v24)
    {
      uint64_t v25 = sub_100010900();
      sub_10000536C((uint64_t)v11, (uint64_t)v16, &qword_1000184C8);
      *(void *)&v16[*(int *)(v32 + 36)] = v25;
      sub_1000053D0((uint64_t)v11, &qword_1000184C8);
      uint64_t v26 = v33;
      sub_100005308((uint64_t)v16, v33, &qword_100018570);
      uint64_t v27 = v34;
      sub_10000536C(v26, v34, &qword_100018570);
      uint64_t v28 = v35;
      *uint64_t v35 = v31;
      uint64_t v29 = sub_10000460C(&qword_100018578);
      sub_10000536C(v27, (uint64_t)v28 + *(int *)(v29 + 48), &qword_100018570);
      swift_retain();
      sub_1000053D0(v26, &qword_100018570);
      sub_1000053D0(v27, &qword_100018570);
      swift_release();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_10000D08C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C794(*v1, a1);
}

uint64_t sub_10000D094@<X0>(char *a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_10000460C(&qword_100018460);
  uint64_t v27 = *(void *)(v1 - 8);
  uint64_t v2 = v27;
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v29 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v25 - v5;
  uint64_t v7 = sub_10000460C(&qword_100018458);
  uint64_t v28 = *(void *)(v7 - 8);
  uint64_t v8 = v28;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v25 - v12;
  sub_10000460C(&qword_1000183D0);
  sub_1000109F0();
  sub_10000460C(&qword_1000183D8);
  uint64_t v26 = v6;
  sub_1000109C0();
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v15 = v11;
  v14(v11, v13, v7);
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  uint64_t v17 = v29;
  uint64_t v18 = v6;
  uint64_t v19 = v1;
  v16(v29, v18, v1);
  uint64_t v20 = v30;
  v14(v30, v15, v7);
  uint64_t v21 = sub_10000460C(&qword_100018468);
  v16(&v20[*(int *)(v21 + 48)], v17, v19);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v27 + 8);
  v22(v26, v19);
  id v23 = *(void (**)(char *, uint64_t))(v28 + 8);
  v23(v13, v7);
  v22(v17, v19);
  return ((uint64_t (*)(char *, uint64_t))v23)(v15, v7);
}

uint64_t sub_10000D344()
{
  return sub_100010650();
}

uint64_t sub_10000D368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000D444(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ContentTransition, (uint64_t (*)(char *))&EnvironmentValues.contentTransition.setter);
}

uint64_t sub_10000D394@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100010630();
  *a1 = result;
  return result;
}

uint64_t sub_10000D3C0()
{
  return sub_100010640();
}

uint64_t sub_10000D3EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100010680();
  *a1 = result;
  return result;
}

uint64_t sub_10000D418()
{
  return sub_100010690();
}

uint64_t sub_10000D444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_10000D514@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100010660();
  *a1 = result;
  return result;
}

uint64_t sub_10000D540@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100010660();
  *a1 = result;
  return result;
}

uint64_t sub_10000D56C()
{
  return sub_100010670();
}

uint64_t sub_10000D594()
{
  return sub_100010670();
}

uint64_t sub_10000D5BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100010630();
  *a1 = result;
  return result;
}

uint64_t sub_10000D5E8()
{
  return sub_100010640();
}

uint64_t sub_10000D614()
{
  return sub_100010650();
}

uint64_t sub_10000D638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000D444(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ContentTransition, (uint64_t (*)(char *))&EnvironmentValues.contentTransition.setter);
}

uint64_t sub_10000D678@<X0>(uint64_t a1@<X8>)
{
  return sub_10000943C(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_10000D680@<X0>(uint64_t a1@<X8>)
{
  return sub_10000A704(*(void *)(v1 + 16), a1);
}

unint64_t sub_10000D688()
{
  unint64_t result = qword_100018400;
  if (!qword_100018400)
  {
    sub_1000046B0(&qword_1000183F8);
    sub_10000D734();
    sub_10000C73C(&qword_1000183A0, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018400);
  }
  return result;
}

unint64_t sub_10000D734()
{
  unint64_t result = qword_100018408;
  if (!qword_100018408)
  {
    sub_1000046B0(&qword_100018410);
    sub_10000D7D4();
    sub_100005468(&qword_100018390, &qword_100018398);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018408);
  }
  return result;
}

unint64_t sub_10000D7D4()
{
  unint64_t result = qword_100018418;
  if (!qword_100018418)
  {
    sub_1000046B0(&qword_100018420);
    sub_10000D8A0(&qword_100018428, &qword_100018430, &qword_100018438, (void (*)(void))sub_10000D978);
    sub_100005468(&qword_100018380, &qword_100018388);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018418);
  }
  return result;
}

uint64_t sub_10000D8A0(unint64_t *a1, uint64_t *a2, uint64_t *a3, void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000046B0(a2);
    sub_1000046B0(a3);
    a4();
    swift_getOpaqueTypeConformance2();
    sub_100005468(&qword_100018178, &qword_100018180);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000D978()
{
  unint64_t result = qword_100018440;
  if (!qword_100018440)
  {
    sub_1000046B0(&qword_100018438);
    sub_10000DA18();
    sub_100005468(&qword_100018370, &qword_100018378);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018440);
  }
  return result;
}

unint64_t sub_10000DA18()
{
  unint64_t result = qword_100018448;
  if (!qword_100018448)
  {
    sub_1000046B0(&qword_100018450);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018448);
  }
  return result;
}

uint64_t sub_10000DA8C()
{
  return sub_1000109C0();
}

uint64_t sub_10000DAC4@<X0>(char *a1@<X8>)
{
  return sub_10000D094(a1);
}

void *sub_10000DACC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000DB10@<X0>(uint64_t a1@<X8>)
{
  return sub_10000A05C(*(void *)(v1 + 16), a1);
}

unint64_t sub_10000DB1C()
{
  unint64_t result = qword_1000184C0;
  if (!qword_1000184C0)
  {
    sub_1000046B0(&qword_1000184C8);
    sub_10000DBBC();
    sub_100005468(&qword_1000184F0, &qword_1000184F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184C0);
  }
  return result;
}

unint64_t sub_10000DBBC()
{
  unint64_t result = qword_1000184D0;
  if (!qword_1000184D0)
  {
    sub_1000046B0(&qword_1000184D8);
    sub_100005468(&qword_1000184E0, &qword_1000184E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184D0);
  }
  return result;
}

unint64_t sub_10000DC5C()
{
  unint64_t result = qword_100018508;
  if (!qword_100018508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018508);
  }
  return result;
}

double sub_10000DCB0@<D0>(uint64_t a1@<X8>)
{
  return sub_10000A488(a1);
}

uint64_t sub_10000DCBC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000046B0(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000DD3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100010680();
  *a1 = result;
  return result;
}

uint64_t sub_10000DD68()
{
  return sub_100010690();
}

uint64_t sub_10000DD94()
{
  return sub_100010620();
}

uint64_t sub_10000DDB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000D444(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for Image.Scale, (uint64_t (*)(char *))&EnvironmentValues.imageScale.setter);
}

unsigned char *initializeBufferWithCopyOfBuffer for MinimalIconView(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MinimalIconView(unsigned __int8 *a1, unsigned int a2)
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
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MinimalIconView(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x10000DF70);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MinimalIconView()
{
  return &type metadata for MinimalIconView;
}

uint64_t sub_10000DFA8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000DFC4()
{
  unint64_t result = qword_100018560;
  if (!qword_100018560)
  {
    sub_1000046B0(&qword_100018540);
    sub_100005468(&qword_100018568, &qword_100018538);
    sub_1000052B4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018560);
  }
  return result;
}

unint64_t sub_10000E068()
{
  unint64_t result = qword_100018580;
  if (!qword_100018580)
  {
    sub_1000046B0(&qword_100018550);
    sub_1000046B0(&qword_100018540);
    sub_10000DFC4();
    swift_getOpaqueTypeConformance2();
    sub_10000C73C(&qword_1000183A0, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018580);
  }
  return result;
}

uint64_t destroy for WidgetButtonStyle()
{
  swift_release();

  return swift_release();
}

void *_s23MirroredWidgetExtension17WidgetButtonStyleVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for WidgetButtonStyle(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for WidgetButtonStyle(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetButtonStyle(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for WidgetButtonStyle(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for WidgetButtonStyle()
{
  return &type metadata for WidgetButtonStyle;
}

uint64_t sub_10000E2F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000E310@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v25 = a2;
  uint64_t v23 = sub_1000106D0();
  uint64_t v2 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  unsigned int v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000460C(&qword_100018588);
  uint64_t v6 = v5 - 8;
  __chkstk_darwin(v5);
  int v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_10000460C(&qword_100018590) - 8;
  __chkstk_darwin(v22);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_10000460C(&qword_100018598) - 8;
  __chkstk_darwin(v21);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000106E0();
  sub_1000106F0();
  uint64_t v13 = sub_1000108F0();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v15 = v23;
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v8, v4, v23);
  uint64_t v16 = (uint64_t *)&v8[*(int *)(v6 + 44)];
  *uint64_t v16 = KeyPath;
  v16[1] = v13;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v15);
  sub_1000106F0();
  uint64_t v17 = sub_1000108F0();
  LOBYTE(v13) = sub_100010720();
  sub_10000536C((uint64_t)v8, (uint64_t)v10, &qword_100018588);
  uint64_t v18 = &v10[*(int *)(v22 + 44)];
  *(void *)uint64_t v18 = v17;
  v18[8] = v13;
  sub_1000053D0((uint64_t)v8, &qword_100018588);
  sub_10000536C((uint64_t)v10, (uint64_t)v12, &qword_100018590);
  *(_WORD *)&v12[*(int *)(v21 + 44)] = 256;
  sub_1000053D0((uint64_t)v10, &qword_100018590);
  return sub_10000E600((uint64_t)v12, v25);
}

uint64_t sub_10000E5F0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000E310(*(void *)(v1 + 8), a1);
}

uint64_t sub_10000E600(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000460C(&qword_100018598);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000E66C()
{
  unint64_t result = qword_1000185A0;
  if (!qword_1000185A0)
  {
    sub_1000046B0(&qword_100018598);
    sub_10000E70C();
    sub_100005468(&qword_1000185C0, &qword_1000185C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000185A0);
  }
  return result;
}

unint64_t sub_10000E70C()
{
  unint64_t result = qword_1000185A8;
  if (!qword_1000185A8)
  {
    sub_1000046B0(&qword_100018590);
    sub_10000E7AC();
    sub_100005468(&qword_100018380, &qword_100018388);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000185A8);
  }
  return result;
}

unint64_t sub_10000E7AC()
{
  unint64_t result = qword_1000185B0;
  if (!qword_1000185B0)
  {
    sub_1000046B0(&qword_100018588);
    sub_10000E84C();
    sub_100005468(&qword_100018178, &qword_100018180);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000185B0);
  }
  return result;
}

unint64_t sub_10000E84C()
{
  unint64_t result = qword_1000185B8;
  if (!qword_1000185B8)
  {
    sub_1000106D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000185B8);
  }
  return result;
}

uint64_t sub_10000E8A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000460C(&qword_1000180F8);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_10000E914(uint64_t a1)
{
  uint64_t v2 = sub_10000460C(&qword_1000180F8);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_10000E97C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000460C(&qword_1000180F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_10000E9E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000460C(&qword_1000180F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_10000EA4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000460C(&qword_1000180F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_10000EAB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000460C(&qword_1000180F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_10000EB1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000EB30);
}

uint64_t sub_10000EB30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000460C(&qword_1000180F8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_10000EBA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000EBB4);
}

uint64_t sub_10000EBB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000460C(&qword_1000180F8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for MirroredLockScreenView()
{
  uint64_t result = qword_100018628;
  if (!qword_100018628) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000EC74()
{
  sub_10000ED00();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10000ED00()
{
  if (!qword_100018638)
  {
    sub_1000105A0();
    sub_100010244(&qword_1000180E8, (void (*)(uint64_t))&type metadata accessor for MirroredWidgetAttributes);
    unint64_t v0 = sub_1000109A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100018638);
    }
  }
}

uint64_t sub_10000ED94()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000EDB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v51 = a1;
  uint64_t v1 = sub_100010610();
  uint64_t v49 = *(void *)(v1 - 8);
  uint64_t v50 = v1;
  __chkstk_darwin(v1);
  char v48 = (char *)v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000460C(&qword_100018668);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000460C(&qword_100018670);
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_10000460C(&qword_100018678);
  __chkstk_darwin(v45);
  uint64_t v11 = (char *)v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000460C(&qword_100018680);
  uint64_t v46 = *(void *)(v12 - 8);
  uint64_t v47 = v12;
  __chkstk_darwin(v12);
  v43[0] = (char *)v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000460C(&qword_100018688);
  uint64_t v15 = v14 - 8;
  __chkstk_darwin(v14);
  uint64_t v44 = (char *)v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10000460C(&qword_1000180F8);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for DecodedContext();
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)v43 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v18 + 16))(v20, v43[1], v17);
  sub_100007018((uint64_t)v20, v23);
  FIUIIconSize();
  double v25 = v24;
  double v27 = v26;
  *(void *)uint64_t v5 = sub_1000106A0();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v28 = sub_10000460C(&qword_100018690);
  sub_10000F314(v23, (double *)&v5[*(int *)(v28 + 44)], 48.0, v25, v27, 30.0);
  LOBYTE(v20) = sub_100010720();
  sub_10000536C((uint64_t)v5, (uint64_t)v9, &qword_100018668);
  uint64_t v29 = &v9[*(int *)(v7 + 44)];
  *uint64_t v29 = (char)v20;
  *(_OWORD *)(v29 + 8) = 0u;
  *(_OWORD *)(v29 + 24) = 0u;
  v29[40] = 1;
  sub_1000053D0((uint64_t)v5, &qword_100018668);
  uint64_t v30 = sub_1000108D0();
  LOBYTE(v17) = sub_100010720();
  sub_10000536C((uint64_t)v9, (uint64_t)v11, &qword_100018670);
  uint64_t v31 = &v11[*(int *)(v45 + 36)];
  *(void *)uint64_t v31 = v30;
  v31[8] = v17;
  sub_1000053D0((uint64_t)v9, &qword_100018670);
  sub_1000108D0();
  sub_1000100FC();
  uint64_t v32 = v43[0];
  sub_100010810();
  swift_release();
  sub_1000053D0((uint64_t)v11, &qword_100018678);
  uint64_t v33 = v48;
  sub_100010600();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v35 = (uint64_t)v44;
  uint64_t v36 = (uint64_t *)&v44[*(int *)(v15 + 44)];
  uint64_t v37 = sub_10000460C(&qword_100018398);
  uint64_t v39 = v49;
  uint64_t v38 = v50;
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))((char *)v36 + *(int *)(v37 + 28), v33, v50);
  *uint64_t v36 = KeyPath;
  uint64_t v41 = v46;
  uint64_t v40 = v47;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16))(v35, v32, v47);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v33, v38);
  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v32, v40);
  sub_100005308(v35, v51, &qword_100018688);
  return sub_10000C6E0((uint64_t)v23);
}

uint64_t sub_10000F314@<X0>(char *a1@<X0>, double *a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  uint64_t v114 = a2;
  uint64_t v11 = sub_10000460C(&qword_100018480);
  uint64_t v111 = *(void *)(v11 - 8);
  uint64_t v112 = v11;
  __chkstk_darwin(v11);
  uint64_t v110 = (char *)&v98 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000460C(&qword_100018488);
  uint64_t v115 = *(void *)(v13 - 8);
  uint64_t v116 = v13;
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v113 = (char *)&v98 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v120 = (char *)&v98 - v16;
  uint64_t v17 = sub_10000460C(&qword_1000183A8);
  __chkstk_darwin(v17 - 8);
  uint64_t v108 = (char *)&v98 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10000460C(&qword_100018238);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v109 = (uint64_t)&v98 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v107 = (uint64_t)&v98 - v22;
  uint64_t v106 = (char *)sub_10000460C(&qword_1000183B0);
  uint64_t v23 = __chkstk_darwin(v106);
  double v25 = (char *)&v98 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v104 = (char *)&v98 - v26;
  uint64_t v27 = sub_100010510();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v31 = (char *)&v98 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v29);
  uint64_t v33 = (char *)&v98 - v32;
  uint64_t v102 = sub_10000460C(&qword_1000183B8);
  uint64_t v34 = __chkstk_darwin(v102);
  uint64_t v101 = (char *)&v98 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v34);
  uint64_t v103 = (uint64_t)&v98 - v36;
  uint64_t v118 = (int *)type metadata accessor for DecodedContext();
  char v119 = a1;
  uint64_t v37 = *(void **)&a1[v118[5]];
  uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
  v38(v33, a1, v27);
  id v39 = v37;
  sub_1000104E0();
  sub_100010244(&qword_1000183C8, (void (*)(uint64_t))&type metadata accessor for Date);
  uint64_t v105 = v27;
  uint64_t result = sub_100010A30();
  if (result)
  {
    id v100 = v39;
    uint64_t v41 = v25;
    uint64_t v42 = (uint64_t)v106;
    char v43 = v31;
    uint64_t v44 = v38;
    uint64_t v45 = v104;
    uint64_t v46 = &v104[*((int *)v106 + 12)];
    uint64_t KeyPath = v28;
    uint64_t v47 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
    char v48 = v33;
    uint64_t v49 = v105;
    v47(v104, v48, v105);
    uint64_t v99 = v46;
    uint64_t v50 = v43;
    uint64_t v51 = v49;
    v47(v46, v50, v49);
    uint64_t v52 = &v41[*(int *)(v42 + 48)];
    v44(v41, v45, v51);
    v44(v52, v46, v51);
    uint64_t v53 = (uint64_t)v101;
    uint64_t v54 = v51;
    v47(v101, v41, v51);
    uint64_t v55 = *(void (**)(char *, uint64_t))(KeyPath + 8);
    char v56 = v52;
    uint64_t v57 = v54;
    v55(v56, v54);
    uint64_t v58 = &v41[*(int *)(v42 + 48)];
    v47(v41, v45, v57);
    v47(v58, v99, v57);
    v47((char *)(v53 + *(int *)(v102 + 36)), v58, v57);
    v55(v41, v57);
    sub_100005308(v53, v103, &qword_1000183B8);
    uint64_t v106 = &v119[v118[7]];
    sub_10000536C((uint64_t)v106, v107, &qword_100018238);
    uint64_t v59 = sub_1000107C0();
    uint64_t v61 = v60;
    LOBYTE(v55) = v62 & 1;
    sub_100010780();
    uint64_t v63 = enum case for Font.Design.rounded(_:);
    uint64_t v64 = sub_100010760();
    uint64_t v65 = *(void *)(v64 - 8);
    uint64_t v66 = (uint64_t)v108;
    (*(void (**)(char *, uint64_t, uint64_t))(v65 + 104))(v108, v63, v64);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v65 + 56))(v66, 0, 1, v64);
    sub_1000107B0();
    sub_1000053D0(v66, &qword_1000183A8);
    sub_100010740();
    swift_release();
    sub_100010750();
    swift_release();
    uint64_t v67 = sub_1000107E0();
    uint64_t v69 = v68;
    LODWORD(v108) = v70;
    swift_release();
    sub_10000C784(v59, v61, (char)v55);
    swift_bridgeObjectRelease();
    uint64_t v71 = v109;
    sub_10000536C((uint64_t)v106, v109, &qword_100018238);
    LODWORD(v61) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(KeyPath + 48))(v71, 1, v57);
    sub_1000053D0(v71, &qword_100018238);
    if (v61 == 1)
    {
      sub_1000108B0();
    }
    else
    {
      sub_1000108C0();
      sub_1000108F0();
      swift_release();
    }
    char v72 = v108 & 1;
    uint64_t v107 = sub_1000107D0();
    uint64_t v108 = v74;
    uint64_t v109 = v73;
    char v76 = v75;
    swift_release();
    LODWORD(v106) = v76 & 1;
    sub_10000C784(v67, v69, v72);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v77 = v119;
    uint64_t v78 = sub_10000DACC(&v119[v118[8]], *(void *)&v119[v118[8] + 24]);
    __chkstk_darwin(v78);
    uint64_t v81 = (*(uint64_t (**)(char *))(v80 + 16))((char *)&v98 - v79);
    __chkstk_darwin(v81);
    *(&v98 - 4) = (uint64_t)v77;
    *((double *)&v98 - 3) = a6;
    *((double *)&v98 - 2) = a3;
    sub_10000460C(&qword_100018510);
    sub_1000102A0();
    uint64_t v82 = v110;
    sub_100010960();
    uint64_t v83 = sub_1000108E0();
    uint64_t v84 = sub_1000108B0();
    uint64_t v121 = v83;
    uint64_t v122 = v84;
    sub_100005468(&qword_100018520, &qword_100018480);
    sub_10000DC5C();
    uint64_t v85 = v112;
    uint64_t v86 = v113;
    sub_100010840();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v111 + 8))(v82, v85);
    uint64_t v88 = v115;
    uint64_t v87 = v116;
    uint64_t v89 = v120;
    (*(void (**)(char *, char *, uint64_t))(v115 + 32))(v120, v86, v116);
    char v119 = *(char **)(v88 + 16);
    ((void (*)(char *, char *, uint64_t))v119)(v86, v89, v87);
    uint64_t v90 = v114;
    double *v114 = a3;
    uint64_t v91 = v100;
    *((void *)v90 + 1) = v100;
    v90[2] = a4;
    v90[3] = a5;
    v90[4] = 0.0;
    *((unsigned char *)v90 + 40) = 1;
    uint64_t v92 = v107;
    uint64_t v94 = v108;
    uint64_t v93 = v109;
    *((void *)v90 + 6) = v107;
    *((void *)v90 + 7) = v93;
    LOBYTE(v89) = (_BYTE)v106;
    *((unsigned char *)v90 + 64) = (_BYTE)v106;
    uint64_t v95 = KeyPath;
    *((void *)v90 + 9) = v94;
    *((void *)v90 + 10) = v95;
    *((unsigned char *)v90 + 88) = 1;
    v90[12] = 0.0;
    *((unsigned char *)v90 + 104) = 1;
    uint64_t v96 = sub_10000460C(&qword_1000186B0);
    ((void (*)(char *, char *, uint64_t))v119)((char *)v90 + *(int *)(v96 + 96), v86, v87);
    char v119 = v91;
    sub_10001031C(v92, v93, (char)v89);
    uint64_t v97 = *(void (**)(char *, uint64_t))(v88 + 8);
    swift_bridgeObjectRetain();
    swift_retain();
    v97(v120, v87);
    v97(v86, v87);
    sub_10000C784(v92, v93, (char)v89);

    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

double sub_10000FE98@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10000460C(&qword_1000183A8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000460C(&qword_100018238);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DecodedContext();
  sub_10000536C(a1 + *(int *)(v10 + 28), (uint64_t)v9, &qword_100018238);
  uint64_t v11 = sub_100010510();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v9, 1, v11);
  sub_1000053D0((uint64_t)v9, &qword_100018238);
  uint64_t v12 = sub_100010920();
  sub_100010770();
  uint64_t v13 = sub_100010760();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 1, 1, v13);
  uint64_t v14 = sub_1000107B0();
  sub_1000053D0((uint64_t)v6, &qword_1000183A8);
  uint64_t KeyPath = swift_getKeyPath();
  sub_100010970();
  sub_1000105F0();
  uint64_t v16 = v21;
  char v17 = v22;
  uint64_t v18 = v23;
  char v19 = v24;
  *(void *)a2 = v12;
  *(void *)(a2 + 8) = KeyPath;
  *(void *)(a2 + 16) = v14;
  *(void *)(a2 + 24) = v16;
  *(unsigned char *)(a2 + 32) = v17;
  *(void *)(a2 + 40) = v18;
  *(unsigned char *)(a2 + 48) = v19;
  double result = *(double *)&v25;
  *(_OWORD *)(a2 + 56) = v25;
  return result;
}

unint64_t sub_1000100FC()
{
  unint64_t result = qword_100018698;
  if (!qword_100018698)
  {
    sub_1000046B0(&qword_100018678);
    sub_10001019C();
    sub_100005468(&qword_100018380, &qword_100018388);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018698);
  }
  return result;
}

unint64_t sub_10001019C()
{
  unint64_t result = qword_1000186A0;
  if (!qword_1000186A0)
  {
    sub_1000046B0(&qword_100018670);
    sub_100005468(&qword_1000186A8, &qword_100018668);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000186A0);
  }
  return result;
}

uint64_t sub_100010244(unint64_t *a1, void (*a2)(uint64_t))
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

double sub_100010294@<D0>(uint64_t a1@<X8>)
{
  return sub_10000FE98(*(void *)(v1 + 16), a1);
}

unint64_t sub_1000102A0()
{
  unint64_t result = qword_100018518;
  if (!qword_100018518)
  {
    sub_1000046B0(&qword_100018510);
    sub_10000DBBC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018518);
  }
  return result;
}

uint64_t sub_10001031C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

unint64_t sub_100010338()
{
  unint64_t result = qword_1000186B8;
  if (!qword_1000186B8)
  {
    sub_1000046B0(&qword_100018688);
    sub_1000046B0(&qword_100018678);
    sub_1000100FC();
    swift_getOpaqueTypeConformance2();
    sub_100005468(&qword_100018390, &qword_100018398);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000186B8);
  }
  return result;
}

uint64_t sub_10001040C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100010440()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100010450()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100010460()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100010470()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100010490()
{
  return static IntentResult.result<>()();
}

uint64_t sub_1000104A0(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_1000104B0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_1000104C0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_1000104D0()
{
  return Date.offset(until:pauseTimes:lastUnbalancedPauseStart:)();
}

uint64_t sub_1000104E0()
{
  return static Date.distantFuture.getter();
}

uint64_t sub_1000104F0()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t sub_100010500()
{
  return Date.init()();
}

uint64_t sub_100010510()
{
  return type metadata accessor for Date();
}

uint64_t sub_100010520()
{
  return WorkoutStatePublisher.pauseTimes.getter();
}

uint64_t sub_100010530()
{
  return WorkoutStatePublisher.activityType.getter();
}

uint64_t sub_100010540()
{
  return WorkoutStatePublisher.workoutStartDate.getter();
}

uint64_t sub_100010550()
{
  return WorkoutStatePublisher.lastUnbalancedPauseStart.getter();
}

uint64_t sub_100010560()
{
  return type metadata accessor for DataLinkCommand();
}

uint64_t sub_100010570()
{
  return MirroredWidgetAttributes.ContentState.workoutState.getter();
}

uint64_t sub_100010580()
{
  return MirroredWidgetAttributes.ContentState.segmentIndex.getter();
}

uint64_t sub_100010590()
{
  return type metadata accessor for MirroredWidgetAttributes.ContentState();
}

uint64_t sub_1000105A0()
{
  return type metadata accessor for MirroredWidgetAttributes();
}

uint64_t sub_1000105B0()
{
  return static WOLog.dataLink.getter();
}

uint64_t sub_1000105C0()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000105D0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000105E0()
{
  return static WidgetBundle.main()();
}

uint64_t sub_1000105F0()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_100010600()
{
  return static ContentTransition.identity.getter();
}

uint64_t sub_100010610()
{
  return type metadata accessor for ContentTransition();
}

uint64_t sub_100010620()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_100010630()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_100010640()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_100010650()
{
  return EnvironmentValues.contentTransition.getter();
}

uint64_t sub_100010660()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_100010670()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_100010680()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_100010690()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_1000106A0()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_1000106B0()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_1000106D0()
{
  return type metadata accessor for ButtonStyleConfiguration.Label();
}

uint64_t sub_1000106E0()
{
  return ButtonStyleConfiguration.label.getter();
}

uint64_t sub_1000106F0()
{
  return ButtonStyleConfiguration.isPressed.getter();
}

uint64_t sub_100010700()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t sub_100010710()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_100010720()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100010730()
{
  return static Font.largeTitle.getter();
}

uint64_t sub_100010740()
{
  return Font.monospacedDigit()();
}

uint64_t sub_100010750()
{
  return Font.lowercaseSmallCaps()();
}

uint64_t sub_100010760()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_100010770()
{
  return static Font.Weight.thin.getter();
}

uint64_t sub_100010780()
{
  return static Font.Weight.medium.getter();
}

uint64_t sub_100010790()
{
  return static Font.Weight.regular.getter();
}

uint64_t sub_1000107A0()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_1000107B0()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_1000107C0()
{
  return Text.init(timerInterval:pauseTime:countsDown:showsHours:)();
}

uint64_t sub_1000107D0()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_1000107E0()
{
  return Text.font(_:)();
}

uint64_t sub_1000107F0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_100010800()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100010810()
{
  return View.activityBackgroundTint(_:)();
}

uint64_t sub_100010820()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100010830()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100010840()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_100010850()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100010860()
{
  return View.monospacedDigit()();
}

uint64_t sub_100010870()
{
  return View.accessibilityLabel(_:)();
}

uint64_t sub_100010880()
{
  return View.accessibilityLabel<A>(_:)();
}

uint64_t sub_100010890()
{
  return View.accessibilityHidden(_:)();
}

uint64_t sub_1000108A0()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_1000108B0()
{
  return Color.init(rgbHex:)();
}

uint64_t sub_1000108C0()
{
  return static Color.gray.getter();
}

uint64_t sub_1000108D0()
{
  return static Color.black.getter();
}

uint64_t sub_1000108E0()
{
  return static Color.white.getter();
}

uint64_t sub_1000108F0()
{
  return Color.opacity(_:)();
}

uint64_t sub_100010900()
{
  return Color.init(_:)();
}

uint64_t sub_100010910()
{
  return Image.init(uiImage:)();
}

uint64_t sub_100010920()
{
  return Image.init(systemName:)();
}

uint64_t sub_100010930()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_100010940()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_100010950()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_100010960()
{
  return Button.init<A>(intent:label:)();
}

uint64_t sub_100010970()
{
  return static Alignment.center.getter();
}

uint64_t sub_100010980()
{
  return DynamicIsland.init<A, B, C, D>(expanded:compactLeading:compactTrailing:minimal:)();
}

uint64_t sub_100010990()
{
  return ActivityViewContext.state.getter();
}

uint64_t sub_1000109A0()
{
  return type metadata accessor for ActivityViewContext();
}

uint64_t sub_1000109B0()
{
  return ActivityConfiguration.init<A>(for:content:dynamicIsland:)();
}

uint64_t sub_1000109C0()
{
  return DynamicIslandExpandedRegion._viewRepresentation.getter();
}

uint64_t sub_1000109D0()
{
  return DynamicIslandExpandedRegion.init(_:priority:content:)();
}

uint64_t sub_1000109E0()
{
  return DynamicIslandExpandedContent.init(content:)();
}

uint64_t sub_1000109F0()
{
  return DynamicIslandExpandedContent.content.getter();
}

uint64_t sub_100010A00()
{
  return static DynamicIslandExpandedRegionPosition.leading.getter();
}

uint64_t sub_100010A10()
{
  return static DynamicIslandExpandedRegionPosition.trailing.getter();
}

uint64_t sub_100010A20()
{
  return type metadata accessor for DynamicIslandExpandedRegionPosition();
}

uint64_t sub_100010A30()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t sub_100010A40()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100010A50()
{
  return String.init(format:_:)();
}

uint64_t sub_100010A60()
{
  return String.init<A>(describing:)();
}

void sub_100010A70(Swift::String a1)
{
}

Swift::Int sub_100010A80()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100010A90()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100010AA0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100010AB0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100010AC0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100010AD0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100010AE0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100010AF0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

void sub_100010B00(Swift::Int a1)
{
}

uint64_t sub_100010B10()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100010B20()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100010B30()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100010B40()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100010B50()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100010B60()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t AXDurationStringForDuration()
{
  return _AXDurationStringForDuration();
}

uint64_t FIUICircularWorkoutGradientImageWithGoal()
{
  return _FIUICircularWorkoutGradientImageWithGoal();
}

uint64_t FIUIIconSize()
{
  return _FIUIIconSize();
}

uint64_t FIUIStaticScalableWorkoutIconImage()
{
  return _FIUIStaticScalableWorkoutIconImage();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}